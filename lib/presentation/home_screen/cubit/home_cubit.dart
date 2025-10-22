import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:shopsy/data/model/product_model.dart';
import 'package:shopsy/data/repository/product_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final _productRepo = GetIt.instance<ProductRepo>();
  final int pageSize;

  List<ProductModel> _allProducts = [];
  int _currentPage = 0;
  HomeCubit({this.pageSize = 10}) : super(HomeInitial());

  Future<void> fetchProducts() async {
    try {
      emit(HomeLoadingState(isLoading: true));
      _allProducts = await _productRepo.loadProduct();
      _currentPage = 1;

      emit(
        HomeProductLoadedST(
          products: _allProducts.take(pageSize).toList(),
          hasMore: _allProducts.length > pageSize,
        ),
      );
    } catch (e) {
      log('Error in fetchProducts');
    }
  }

  void loadMore() {
    if (state is HomeProductLoadedST) {
      final currentState = state as HomeProductLoadedST;
      final nextPage = _currentPage + 1;
      final startIndex = _currentPage * pageSize;
      final endIndex = startIndex + pageSize;
      if (startIndex >= _allProducts.length) return;

      final nextItems = _allProducts.sublist(
        startIndex,
        endIndex.clamp(0, _allProducts.length),
      );
      _currentPage = nextPage;
      emit(
        HomeProductLoadedST(
          products: [...currentState.products, ...nextItems],
          hasMore:
              _allProducts.length >
              currentState.products.length + nextItems.length,
        ),
      );
    }
  }
}
