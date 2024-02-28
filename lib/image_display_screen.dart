import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:testgprc/src/generated/server.pbgrpc.dart';
import 'package:testgprc/src/grpc_client_provider.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;

class ImageDisplayScreen extends StatefulWidget {
  @override
  _ImageDisplayScreenState createState() => _ImageDisplayScreenState();
}

class _ImageDisplayScreenState extends State<ImageDisplayScreen> {
  late GrpcClientProvider _grpcClientProvider;
  ImageResponse? _imageResponse;
  String? _imageUrl;
  final GlobalKey _imageKey = GlobalKey();
  var imageW;

  @override
  void initState() {
    super.initState();
    _grpcClientProvider = GrpcClientProvider();
    _fetchInitialImage();
  }

  void _fetchInitialImage() async {
    final request = ImageRequest();
    try {
      final response = await _grpcClientProvider.queryImage(request);
      setState(() {
        _imageResponse = response;
        _imageUrl = 'https://assignment.coredevcentral.com${response.path.trim()}';
      });
    } catch (e) {
      print("Error fetching image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_imageUrl != null) {
      Image image = Image.network(_imageUrl!);
      Completer<ui.Image> completer = Completer<ui.Image>();
      image.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((ImageInfo info, bool _) {
        setState(() {
          imageW = info.image.width;
        });
        completer.complete(info.image);
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Image with Bounding Boxes'),
      ),
      body: _imageResponse == null || _imageUrl == null || imageW == null
          ? const Center(child: CircularProgressIndicator())
          : (_imageUrl != null && _imageUrl!.isNotEmpty)
              ? Stack(
                  alignment: Alignment.topCenter,
                  // fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(
                      _imageUrl!,
                      key: _imageKey,
                    ),
                    ..._buildBoundingBoxes().reversed,
                  ],
                )
              : SizedBox(),
    );
  }

  List<Widget> _buildBoundingBoxes() {
    var boxWidgets = <Widget>[];
    if (_imageResponse != null) {
      for (var box in _imageResponse!.bbox) {
        final double imageWidth = (MediaQuery.sizeOf(context).width / imageW);

        var widget = Positioned(
          top: imageWidth * box.y,
          left: imageWidth * box.x,
          child: InkWell(
            onTap: () {
              _cropAndSendImage(box);
            },
            child: Container(
              width: imageWidth * box.width,
              height: imageWidth * box.height,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        );
        boxWidgets.add(widget);
      }
    }
    return boxWidgets;
  }

  void _cropAndSendImage(BoundsData box) async {
    final Uint8List? croppedImageBytes = await cropImage(_imageUrl!, box);
    if (croppedImageBytes != null) {
      final request = ImageRequest(image: croppedImageBytes);

      try {
        final response = await _grpcClientProvider.queryImage(request);
        showDetailsModal(context, box);
        // Handle the response accordingly
      } catch (e) {
        debugPrint("Error sending cropped image: $e");
      }
    } else {
      debugPrint("Cropped image bytes are null, cannot display image.");
    }
  }

  void showDetailsModal(BuildContext context, BoundsData box) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "y: ${box.y}\n"
                  "x: ${box.x}\n"
                  "width: ${box.width}\n"
                  "height: ${box.height}\n"
                  "type: ${box.type}\n"
                  "label: ${box.label}\n"
                  "tooltip: ${box.tooltip}",
                  style: TextStyle(height: 3),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<Uint8List?> cropImage(String imageUrl, BoundsData box) async {
    try {
      final Uint8List imageBytes = await _downloadImageBytes(imageUrl);
      img.Image? image = img.decodeImage(imageBytes);
      if (image != null) {
        // Convert normalized box coordinates to pixel coordinates
        int x = (box.x * image.width).toInt();
        int y = (box.y * image.height).toInt();
        int width = (box.width * image.width).toInt();
        int height = (box.height * image.height).toInt();

        img.Image cropped = img.copyCrop(image, x: x, y: y, width: width, height: height);
        Uint8List croppedImageBytes = Uint8List.fromList(img.encodeJpg(cropped));
        return croppedImageBytes;
      }
    } catch (e) {
      print("Error cropping image: $e");
    }
    return null;
  }

  Future<Uint8List> _downloadImageBytes(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }
}
