// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension OrderStatusMatch on OrderStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() updateOrder,
      required T Function() confirmDeleteProduct,
      required T Function() emptyBag,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == OrderStatus.initial) {
      return initial();
    }

    if (v == OrderStatus.loading) {
      return loading();
    }

    if (v == OrderStatus.loaded) {
      return loaded();
    }

    if (v == OrderStatus.updateOrder) {
      return updateOrder();
    }

    if (v == OrderStatus.confirmDeleteProduct) {
      return confirmDeleteProduct();
    }

    if (v == OrderStatus.emptyBag) {
      return emptyBag();
    }

    if (v == OrderStatus.success) {
      return success();
    }

    if (v == OrderStatus.error) {
      return error();
    }

    throw Exception('OrderStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? updateOrder,
      T Function()? confirmDeleteProduct,
      T Function()? emptyBag,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == OrderStatus.initial && initial != null) {
      return initial();
    }

    if (v == OrderStatus.loading && loading != null) {
      return loading();
    }

    if (v == OrderStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == OrderStatus.updateOrder && updateOrder != null) {
      return updateOrder();
    }

    if (v == OrderStatus.confirmDeleteProduct && confirmDeleteProduct != null) {
      return confirmDeleteProduct();
    }

    if (v == OrderStatus.emptyBag && emptyBag != null) {
      return emptyBag();
    }

    if (v == OrderStatus.success && success != null) {
      return success();
    }

    if (v == OrderStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
