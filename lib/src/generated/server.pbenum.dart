//
//  Generated code. Do not modify.
//  source: server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BoundType extends $pb.ProtobufEnum {
  static const BoundType RECT = BoundType._(0, _omitEnumNames ? '' : 'RECT');
  static const BoundType CIRCLE = BoundType._(1, _omitEnumNames ? '' : 'CIRCLE');
  static const BoundType POLYGON = BoundType._(2, _omitEnumNames ? '' : 'POLYGON');

  static const $core.List<BoundType> values = <BoundType> [
    RECT,
    CIRCLE,
    POLYGON,
  ];

  static final $core.Map<$core.int, BoundType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BoundType? valueOf($core.int value) => _byValue[value];

  const BoundType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
