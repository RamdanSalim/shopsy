import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopsy/data/model/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  void addToCart(ProductModel product) {
    final existingCart = List<ProductModel>.from(state.cartItems);
    final index = existingCart.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      // If  already exists,increment quantity
      final updatedItem = existingCart[index].copyWith(
        stock: existingCart[index].stock! + 1,
      );
      existingCart[index] = updatedItem;
    } else {
      // Add new item
      existingCart.add(product.copyWith(stock: 1));
    }

    emit(
      state.copyWith(
        cartItems: existingCart,
        totalAmount: _calculateTotal(existingCart),
      ),
    );
  }

  void removeFromCart(int productId) {
    final updatedCart = state.cartItems
        .where((item) => item.id != productId)
        .toList();

    emit(
      state.copyWith(
        cartItems: updatedCart,
        totalAmount: _calculateTotal(updatedCart),
      ),
    );
  }

  void changeQuantity(int productId, {bool increment = true}) {
    final updatedCart = List<ProductModel>.from(state.cartItems);
    final index = updatedCart.indexWhere((item) => item.id == productId);

    if (index != -1) {
      final currentQuantity = updatedCart[index].stock;
      final newQuantity = increment
          ? currentQuantity! + 1
          : currentQuantity! - 1;

      if (newQuantity <= 0) {
        updatedCart.removeAt(index);
      } else {
        updatedCart[index] = updatedCart[index].copyWith(stock: newQuantity);
      }

      emit(
        state.copyWith(
          cartItems: updatedCart,
          totalAmount: _calculateTotal(updatedCart),
        ),
      );
    }
  }

  double _calculateTotal(List<ProductModel> items) {
    return items.fold(0.0, (sum, item) => sum + (item.price! * item.stock!));
  }

  void clearCart() {
    emit(state.copyWith(cartItems: [], totalAmount: 0));
  }
}
