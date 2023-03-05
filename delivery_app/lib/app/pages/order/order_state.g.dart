// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension OrderStatusMatch on OrderStatus {
  T match<T>({required T Function() initial, required T Function() loaded}) {
    final v = this;
    if (v == OrderStatus.initial) {
      return initial();
    }

    if (v == OrderStatus.loaded) {
      return loaded();
    }

    throw Exception('OrderStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loaded}) {
    final v = this;
    if (v == OrderStatus.initial && initial != null) {
      return initial();
    }

    if (v == OrderStatus.loaded && loaded != null) {
      return loaded();
    }

    return any();
  }
}
