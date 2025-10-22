import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:shopsy/data/model/product_model.dart';
import 'package:shopsy/data/repository/product_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _productRepo = GetIt.instance<ProductRepo>();

  Future<void> fetchProducts() async {
    try {
      emit(HomeLoadingState(isLoading: true));
      final products = await _productRepo.loadProduct();
      emit(HomeProductLoadedST(products: products));
    } catch (e) {
      log('Error in fetchProducts');
    }
  }
}
