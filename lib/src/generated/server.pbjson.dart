//
//  Generated code. Do not modify.
//  source: server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use boundTypeDescriptor instead')
const BoundType$json = {
  '1': 'BoundType',
  '2': [
    {'1': 'RECT', '2': 0},
    {'1': 'CIRCLE', '2': 1},
    {'1': 'POLYGON', '2': 2},
  ],
};

/// Descriptor for `BoundType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List boundTypeDescriptor = $convert.base64Decode(
    'CglCb3VuZFR5cGUSCAoEUkVDVBAAEgoKBkNJUkNMRRABEgsKB1BPTFlHT04QAg==');

@$core.Deprecated('Use boundsDataDescriptor instead')
const BoundsData$json = {
  '1': 'BoundsData',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.BoundType', '10': 'type'},
    {'1': 'x', '3': 2, '4': 1, '5': 1, '10': 'x'},
    {'1': 'y', '3': 3, '4': 1, '5': 1, '10': 'y'},
    {'1': 'width', '3': 4, '4': 1, '5': 1, '10': 'width'},
    {'1': 'height', '3': 5, '4': 1, '5': 1, '10': 'height'},
    {'1': 'tooltip', '3': 7, '4': 1, '5': 9, '10': 'tooltip'},
    {'1': 'label', '3': 8, '4': 1, '5': 9, '10': 'label'},
  ],
};

/// Descriptor for `BoundsData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boundsDataDescriptor = $convert.base64Decode(
    'CgpCb3VuZHNEYXRhEh4KBHR5cGUYASABKA4yCi5Cb3VuZFR5cGVSBHR5cGUSDAoBeBgCIAEoAV'
    'IBeBIMCgF5GAMgASgBUgF5EhQKBXdpZHRoGAQgASgBUgV3aWR0aBIWCgZoZWlnaHQYBSABKAFS'
    'BmhlaWdodBIYCgd0b29sdGlwGAcgASgJUgd0b29sdGlwEhQKBWxhYmVsGAggASgJUgVsYWJlbA'
    '==');

@$core.Deprecated('Use imageResponseDescriptor instead')
const ImageResponse$json = {
  '1': 'ImageResponse',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    {'1': 'bbox', '3': 2, '4': 3, '5': 11, '6': '.BoundsData', '10': 'bbox'},
  ],
};

/// Descriptor for `ImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageResponseDescriptor = $convert.base64Decode(
    'Cg1JbWFnZVJlc3BvbnNlEhIKBHBhdGgYASABKAlSBHBhdGgSHwoEYmJveBgCIAMoCzILLkJvdW'
    '5kc0RhdGFSBGJib3g=');

@$core.Deprecated('Use imageRequestDescriptor instead')
const ImageRequest$json = {
  '1': 'ImageRequest',
  '2': [
    {'1': 'image', '3': 1, '4': 1, '5': 12, '10': 'image'},
    {'1': 'query', '3': 2, '4': 1, '5': 9, '10': 'query'},
  ],
};

/// Descriptor for `ImageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageRequestDescriptor = $convert.base64Decode(
    'CgxJbWFnZVJlcXVlc3QSFAoFaW1hZ2UYASABKAxSBWltYWdlEhQKBXF1ZXJ5GAIgASgJUgVxdW'
    'VyeQ==');

