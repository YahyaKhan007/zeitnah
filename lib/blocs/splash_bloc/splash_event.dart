part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class SplashInitialEvent extends SplashEvent {
  const SplashInitialEvent();
}
