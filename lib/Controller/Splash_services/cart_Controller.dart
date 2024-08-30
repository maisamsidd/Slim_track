import 'package:get/get.dart';
import 'package:slim_track/Model/UserModel/cart_model.dart';

class CartController extends GetxController {
  var cartItems = <CartModel>[].obs;

  void addToCart(CartModel item) {
    cartItems.add(item);
  }

  void removeFromCart(CartModel item) {
    cartItems.remove(item);
  }
}
