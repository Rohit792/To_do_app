import 'package:to_do_app/feature/home/domain/repositories/home_repository_builder.dart';
import 'package:to_do_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:to_do_app/feature/splash/application/splash_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //Bloc
  sl.registerFactory(() => SplashCubit());

  sl.registerFactory(() => HomeBloc(homeRepository: sl.get()));
  sl.registerSingleton<HomeRepository>(HomeRepositoryBuilder.repository());

  //useCase
}
