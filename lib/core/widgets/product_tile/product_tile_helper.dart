import '../../../data/model/product_model.dart';
import '../../../presentation/cart_screen/cart_cubit/cart_cubit.dart';

int getCartQuantity(ProductModel product, CartState state) {
  return state.cartItems
          .firstWhere(
            (item) => item.id == product.id,
            orElse: () => product.copyWith(stock: 0),
          )
          .stock ??
      0;
}
