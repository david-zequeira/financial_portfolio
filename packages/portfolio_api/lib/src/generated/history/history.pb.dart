// This is a generated file - do not edit.
//
// Generated from history/history.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Represents a single data point in the portfolio history graph
class HistoryPoint extends $pb.GeneratedMessage {
  factory HistoryPoint({
    $fixnum.Int64? timestamp,
    $core.double? value,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (value != null) result.value = value;
    return result;
  }

  HistoryPoint._();

  factory HistoryPoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HistoryPoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HistoryPoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..aD(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HistoryPoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HistoryPoint copyWith(void Function(HistoryPoint) updates) =>
      super.copyWith((message) => updates(message as HistoryPoint))
          as HistoryPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HistoryPoint create() => HistoryPoint._();
  @$core.override
  HistoryPoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HistoryPoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HistoryPoint>(create);
  static HistoryPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
