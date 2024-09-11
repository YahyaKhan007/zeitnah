import 'package:get/get.dart';
import 'package:zeitnah/views/screens/client/client_homepage/my_time_calender/widgets/ui_functions.dart';

class ZeitnahController extends GetxController {
  RxInt selectedPageIndex = RxInt(0);
  RxInt selectedClientPageIndex = RxInt(1);
  RxInt selectedClientPatientPageIndex = RxInt(1);
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
