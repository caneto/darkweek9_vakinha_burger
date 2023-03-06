
import '../models/product_model.dart';

class OrderProductDto {
  final ProductModel product;
  final int amount;

  OrderProductDto({
    required this.product,
    this.amount = 0,
  });

  double get totalPrice => amount * product.price;

  OrderProductDto copyWith({
    ProductModel? product,
    int? amount,
  }) {
    return OrderProductDto(
      product: product ?? this.product,
      amount: amount ?? this.amount,
    );
  }
}
