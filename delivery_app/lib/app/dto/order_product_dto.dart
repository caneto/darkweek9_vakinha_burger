
import '../models/product_model.dart';

class OrderProductDto {
  final ProductModel product;
  final int amout;

  OrderProductDto({
    required this.product,
    this.amout = 0,
  });

  double get totalPrice => amout * product.price;
}
