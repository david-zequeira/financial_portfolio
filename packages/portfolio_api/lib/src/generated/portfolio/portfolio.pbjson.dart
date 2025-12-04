// This is a generated file - do not edit.
//
// Generated from portfolio/portfolio.proto.

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

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor =
    $convert.base64Decode('CgVFbXB0eQ==');

@$core.Deprecated('Use portfolioResponseDescriptor instead')
const PortfolioResponse$json = {
  '1': 'PortfolioResponse',
  '2': [
    {
      '1': 'assets',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.portfolio.Asset',
      '10': 'assets'
    },
    {
      '1': 'history',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.portfolio.HistoryPoint',
      '10': 'history'
    },
    {'1': 'total_balance', '3': 3, '4': 1, '5': 1, '10': 'totalBalance'},
  ],
};

/// Descriptor for `PortfolioResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List portfolioResponseDescriptor = $convert.base64Decode(
    'ChFQb3J0Zm9saW9SZXNwb25zZRIoCgZhc3NldHMYASADKAsyEC5wb3J0Zm9saW8uQXNzZXRSBm'
    'Fzc2V0cxIxCgdoaXN0b3J5GAIgAygLMhcucG9ydGZvbGlvLkhpc3RvcnlQb2ludFIHaGlzdG9y'
    'eRIjCg10b3RhbF9iYWxhbmNlGAMgASgBUgx0b3RhbEJhbGFuY2U=');
