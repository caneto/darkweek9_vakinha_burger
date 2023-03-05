
import 'package:bloc/bloc.dart';

import '../../dto/order_product_dto.dart';
import 'order_state.dart';

class OrderController extends Cubit<OrderState> {
  OrderController() : super(const OrderState.initial());

  void load(List<OrderProductDto> products) {
    emit(state.copyWith(orderProduct: products));
    
  }


  
}