part of 'splash_cubit.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashInProgress extends SplashState {}

class SplashSuccess extends SplashState {
  SplashSuccess();
}
