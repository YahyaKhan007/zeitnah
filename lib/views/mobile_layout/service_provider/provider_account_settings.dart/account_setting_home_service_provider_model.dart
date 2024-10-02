import 'package:get/get.dart';

import '../../../../services/auth_service.dart/auth_service.dart';

class AccountSettingHomeServiceProviderModel extends GetxController {
  final _authService = AuthService();

  logout() async {
    await _authService.logoutUser();
  }
}
