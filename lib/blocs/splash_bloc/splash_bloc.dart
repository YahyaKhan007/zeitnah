import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../../services/services.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashInitialEvent>(_splashInitialEvent);
  }

  _splashInitialEvent(
      SplashInitialEvent event, Emitter<SplashState> emit) async {
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        Get.offNamed(RouterHelperService.login);
      },
    );
  }
}
