import 'package:get/get.dart';

class ZeitnahController extends GetxController {
  RxInt selectedPageIndex = RxInt(0);
  RxInt selectedClientPageIndex = RxInt(0);
  RxInt selectedTabIndex = RxInt(0);
  RxInt selectPateientTab = RxInt(0);
  RxInt selectClientMessagetab = RxInt(0);
  RxBool isPriorityFunction = RxBool(false);
  RxBool isPatientPriority = RxBool(false);
  RxBool willNotifyPatient = RxBool(true);
  RxList<String> memberList = RxList<String>();

//
  RxBool always = RxBool(true);
  RxBool mute = RxBool(false);
  RxBool myTimes = RxBool(false);
  setNotification({required String value}) {
    switch (value) {
      case 'Always':
        always.value = true;
        myTimes.value = false;
        mute.value = false;
        break;

      case 'My times':
        always.value = false;
        myTimes.value = true;
        mute.value = false;
        break;

      case 'Mute':
        always.value = false;
        myTimes.value = false;
        mute.value = true;
        break;
    }
  }

  // custome notifications
}
