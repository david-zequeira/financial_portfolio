// This is a generated file - do not edit.
//
// Generated from portfolio/portfolio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'portfolio.pb.dart' as $0;

export 'portfolio.pb.dart';

@$pb.GrpcServiceName('portfolio.PortfolioService')
class PortfolioServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PortfolioServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseStream<$0.PortfolioResponse> getPortfolio(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$getPortfolio, $async.Stream.fromIterable([request]),
        options: options);
  }

  // method descriptors

  static final _$getPortfolio =
      $grpc.ClientMethod<$0.Empty, $0.PortfolioResponse>(
          '/portfolio.PortfolioService/GetPortfolio',
          ($0.Empty value) => value.writeToBuffer(),
          $0.PortfolioResponse.fromBuffer);
}

@$pb.GrpcServiceName('portfolio.PortfolioService')
abstract class PortfolioServiceBase extends $grpc.Service {
  $core.String get $name => 'portfolio.PortfolioService';

  PortfolioServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.PortfolioResponse>(
        'GetPortfolio',
        getPortfolio_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.PortfolioResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.PortfolioResponse> getPortfolio_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async* {
    yield* getPortfolio($call, await $request);
  }

  $async.Stream<$0.PortfolioResponse> getPortfolio(
      $grpc.ServiceCall call, $0.Empty request);
}
