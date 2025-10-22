part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {
  final bool isLoading;
  const HomeLoadingState({required this.isLoading});
  @override
  List<Object> get props => [isLoading];
}

final class HomeProductLoadedST extends HomeState {
  final List<ProductModel> products;
  final bool hasMore;

  const HomeProductLoadedST({required this.products, required this.hasMore});
  @override
  List<Object> get props => [products];
}
