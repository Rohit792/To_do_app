import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void splashLoading() async {
    emit(SplashInProgress());
    await Future.delayed(const Duration(seconds: 1));
    emit(SplashSuccess());
  }
}
