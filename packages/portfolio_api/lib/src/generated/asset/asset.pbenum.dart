// This is a generated file - do not edit.
//
// Generated from asset/asset.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Types of assets supported
class AssetType extends $pb.ProtobufEnum {
  static const AssetType ASSET_TYPE_UNSPECIFIED =
      AssetType._(0, _omitEnumNames ? '' : 'ASSET_TYPE_UNSPECIFIED');
  static const AssetType ASSET_TYPE_STOCK =
      AssetType._(1, _omitEnumNames ? '' : 'ASSET_TYPE_STOCK');
  static const AssetType ASSET_TYPE_ETF =
      AssetType._(2, _omitEnumNames ? '' : 'ASSET_TYPE_ETF');
  static const AssetType ASSET_TYPE_CRYPTO =
      AssetType._(3, _omitEnumNames ? '' : 'ASSET_TYPE_CRYPTO');

  static const $core.List<AssetType> values = <AssetType>[
    ASSET_TYPE_UNSPECIFIED,
    ASSET_TYPE_STOCK,
    ASSET_TYPE_ETF,
    ASSET_TYPE_CRYPTO,
  ];

  static final $core.List<AssetType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static AssetType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AssetType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
