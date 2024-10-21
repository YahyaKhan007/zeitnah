import 'package:get/get.dart';

import '../../views/mobile_layout/client/client_homepage/my_time_calender/widgets/ui_functions.dart';

class ZeitnahController extends GetxController {
  RxInt selectedPageIndex = RxInt(0);
  RxInt selectedClientPageIndex = RxInt(1);

  RxInt selectedTabIndex = RxInt(0);
  RxInt selectPateientTab = RxInt(0);
  RxInt setPriorityTime = RxInt(3);
  RxBool customPriority = RxBool(false);
  RxBool isPriority = RxBool(false);

  RxInt selectClientMessagetab = RxInt(0);
  RxBool isPriorityFunction = RxBool(false);
  RxBool isPatientPriority = RxBool(false);
  RxBool willNotifyPatient = RxBool(true);

  RxString clientAppBarText = RxString("Appointments");

  RxList<String> memberList = RxList<String>();

//
  RxList<AddTime> notificationTime = RxList<AddTime>();

  RxBool isMobile = true.obs;

//

  // custome notifications
}
