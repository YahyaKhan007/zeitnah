import 'package:get/get.dart';

class ZeitnahController extends GetxController {
  RxInt selectedPageIndex = RxInt(0);
  RxInt selectedTabIndex = RxInt(0);
  RxInt selectPateientTab = RxInt(0);
  RxBool isPriorityFunction = RxBool(false);
  RxBool isPatientPriority = RxBool(false);
  RxBool willNotifyPatient = RxBool(true);
}
