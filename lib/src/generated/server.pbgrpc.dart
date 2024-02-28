//
//  Generated code. Do not modify.
//  source: server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'server.pb.dart' as $0;

export 'server.pb.dart';

@$pb.GrpcServiceName('IntuiotionSearch')
class IntuiotionSearchClient extends $grpc.Client {
  static final _$queryImage = $grpc.ClientMethod<$0.ImageRequest, $0.ImageResponse>(
      '/IntuiotionSearch/QueryImage',
      ($0.ImageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ImageResponse.fromBuffer(value));

  IntuiotionSearchClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ImageResponse> queryImage($0.ImageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$queryImage, request, options: options);
  }
}

@$pb.GrpcServiceName('IntuiotionSearch')
abstract class IntuiotionSearchServiceBase extends $grpc.Service {
  $core.String get $name => 'IntuiotionSearch';

  IntuiotionSearchServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ImageRequest, $0.ImageResponse>(
        'QueryImage',
        queryImage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ImageRequest.fromBuffer(value),
        ($0.ImageResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ImageResponse> queryImage_Pre($grpc.ServiceCall call, $async.Future<$0.ImageRequest> request) async {
    return queryImage(call, await request);
  }

  $async.Future<$0.ImageResponse> queryImage($grpc.ServiceCall call, $0.ImageRequest request);
}
