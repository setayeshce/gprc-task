import 'package:grpc/grpc.dart';
import 'generated/server.pbgrpc.dart';

class GrpcClientProvider {
  late IntuiotionSearchClient stub;

  GrpcClientProvider() {
    final channel = ClientChannel(
      '49.13.128.217',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    stub = IntuiotionSearchClient(channel);
  }

  Future<ImageResponse> queryImage(ImageRequest request) async {
    try {
      final response = await stub.queryImage(request);
      print("response  ${response}");
      return response;
    } catch (e) {
      print('Caught error: $e');
      rethrow;
    }
  }
}
