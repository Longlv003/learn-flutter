import 'package:get_it/get_it.dart';
import 'package:learn_flutter/blocs/home/home_cubit.dart';
import 'package:learn_flutter/blocs/home/product_cubit.dart';
import 'package:learn_flutter/blocs/login/login_cubit.dart';
import 'package:learn_flutter/blocs/splash/splash_cubit.dart';
import 'package:learn_flutter/services/api_service.dart';
import 'package:learn_flutter/services/login/login_api.dart';
import 'package:learn_flutter/services/product/product_api.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<Logger>(() => Logger());

  getIt
    ..registerLazySingleton<ApiService>(() => ApiService())
    ..registerLazySingleton<LoginApi>(() => LoginApi())
    ..registerLazySingleton<ProductApi>(() => ProductApi());

  getIt
    ..registerFactory<SplashCubit>(() => SplashCubit())
    ..registerFactory<LoginCubit>(() => LoginCubit(getIt()))
    ..registerFactory<HomeCubit>(() => HomeCubit(getIt()))
    ..registerFactory<ProductCubit>(() => ProductCubit(getIt()));
}
