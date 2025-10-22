part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<ProductModel> cartItems;
  final double totalAmount;

  const CartState({required this.cartItems, required this.totalAmount});

  factory CartState.initial() {
    return const CartState(cartItems: [], totalAmount: 0);
  }

  CartState copyWith({List<ProductModel>? cartItems, double? totalAmount}) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  @override
  List<Object> get props => [cartItems, totalAmount];
}
