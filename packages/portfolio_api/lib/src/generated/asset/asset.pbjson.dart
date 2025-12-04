// This is a generated file - do not edit.
//
// Generated from asset/asset.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use assetTypeDescriptor instead')
const AssetType$json = {
  '1': 'AssetType',
  '2': [
    {'1': 'ASSET_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'ASSET_TYPE_STOCK', '2': 1},
    {'1': 'ASSET_TYPE_ETF', '2': 2},
    {'1': 'ASSET_TYPE_CRYPTO', '2': 3},
  ],
};

/// Descriptor for `AssetType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List assetTypeDescriptor = $convert.base64Decode(
    'CglBc3NldFR5cGUSGgoWQVNTRVRfVFlQRV9VTlNQRUNJRklFRBAAEhQKEEFTU0VUX1RZUEVfU1'
    'RPQ0sQARISCg5BU1NFVF9UWVBFX0VURhACEhUKEUFTU0VUX1RZUEVfQ1JZUFRPEAM=');

@$core.Deprecated('Use assetDescriptor instead')
const Asset$json = {
  '1': 'Asset',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'symbol', '3': 3, '4': 1, '5': 9, '10': 'symbol'},
    {'1': 'price', '3': 4, '4': 1, '5': 1, '10': 'price'},
    {'1': 'change_percent', '3': 5, '4': 1, '5': 1, '10': 'changePercent'},
    {
      '1': 'type',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.portfolio.AssetType',
      '10': 'type'
    },
  ],
};

/// Descriptor for `Asset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDescriptor = $convert.base64Decode(
    'CgVBc3NldBIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIWCgZzeW1ib2wYAy'
    'ABKAlSBnN5bWJvbBIUCgVwcmljZRgEIAEoAVIFcHJpY2USJQoOY2hhbmdlX3BlcmNlbnQYBSAB'
    'KAFSDWNoYW5nZVBlcmNlbnQSKAoEdHlwZRgGIAEoDjIULnBvcnRmb2xpby5Bc3NldFR5cGVSBH'
    'R5cGU=');
