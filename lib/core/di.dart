import 'package:get_it/get_it.dart';
import 'package:shopsy/data/repository/product_repo.dart';
import 'package:shopsy/presentation/home_screen/cubit/home_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
