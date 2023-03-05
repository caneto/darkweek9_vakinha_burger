import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:delivery_app/app/dto/order_product_dto.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
  loaded,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProduct;

  const OrderState({
    required this.status,
    this.orderProduct = const [],
  });

  const OrderState.initial()
      : status = OrderStatus.initial,
        orderProduct = const [];

  @override
  List<Object?> get props => [status, orderProduct];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderProductDto>? orderProduct,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProduct: orderProduct ?? this.orderProduct,
    );
  }
}
