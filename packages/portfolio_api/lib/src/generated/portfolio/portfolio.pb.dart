// This is a generated file - do not edit.
//
// Generated from portfolio/portfolio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:portfolio_api/src/generated/asset/asset.pb.dart' as $1;
import 'package:portfolio_api/src/generated/history/history.pb.dart' as $2;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();

  Empty._();

  factory Empty.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Empty.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Empty',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty)) as Empty;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  @$core.override
  Empty createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class PortfolioResponse extends $pb.GeneratedMessage {
  factory PortfolioResponse({
    $core.Iterable<$1.Asset>? assets,
    $core.Iterable<$2.HistoryPoint>? history,
    $core.double? totalBalance,
  }) {
    final result = create();
    if (assets != null) result.assets.addAll(assets);
    if (history != null) result.history.addAll(history);
    if (totalBalance != null) result.totalBalance = totalBalance;
    return result;
  }

  PortfolioResponse._();

  factory PortfolioResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PortfolioResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PortfolioResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'),
      createEmptyInstance: create)
    ..pPM<$1.Asset>(1, _omitFieldNames ? '' : 'assets',
        subBuilder: $1.Asset.create)
    ..pPM<$2.HistoryPoint>(2, _omitFieldNames ? '' : 'history',
        subBuilder: $2.HistoryPoint.create)
    ..aD(3, _omitFieldNames ? '' : 'totalBalance')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PortfolioResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PortfolioResponse copyWith(void Function(PortfolioResponse) updates) =>
      super.copyWith((message) => updates(message as PortfolioResponse))
          as PortfolioResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PortfolioResponse create() => PortfolioResponse._();
  @$core.override
  PortfolioResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PortfolioResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PortfolioResponse>(create);
  static PortfolioResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.Asset> get assets => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$2.HistoryPoint> get history => $_getList(1);

  @$pb.TagNumber(3)
  $core.double get totalBalance => $_getN(2);
  @$pb.TagNumber(3)
  set totalBalance($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalBalance() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
