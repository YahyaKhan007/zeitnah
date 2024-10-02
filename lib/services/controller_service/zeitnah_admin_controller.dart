import 'package:get/get.dart';

import '../../views/web_layout/utils/app_constants/app_constants.dart';


class ZeitnahAdminController extends GetxController {
  Rx<AuthScreenEnum> authScreen = Rx<AuthScreenEnum>(AuthScreenEnum.login);
  RxInt dashboardScreentIndex = RxInt(0);

  RxBool editProfile = RxBool(false);
  RxString selectedPage = RxString("Dashboard");

  RxBool isPriorityFunction = RxBool(false);
  RxInt adminProviderSubScreenIndex = RxInt(0);
  RxInt appointmentSubScreenIndex = RxInt(0);
  RxInt setPriorityTime = RxInt(3);
  RxBool customPriority = RxBool(false);

  RxInt providerUserTab = RxInt(0);
}
