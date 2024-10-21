import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';
import 'package:zeitnah/services/snackbar_service/snackbar_service.dart';

class MyTimeCalendarController extends GetxController {
  final dataController = Get.find<ZeitnahDataController>();
  final DataBaseService dbService = DataBaseService();
  final SnackBarService snackBarService = SnackBarService();

  RxBool always = RxBool(false);
  RxBool mute = RxBool(false);
  RxBool myTimes = RxBool(false);

  RxMap<String, dynamic> myCalendar = <String, dynamic>{}.obs;
  RxString getNotified = ''.obs;

  // Observable for individual calendar days
  RxList<dynamic> monday = <dynamic>[].obs;
  RxList<dynamic> tuesday = <dynamic>[].obs;
  RxList<dynamic> wednesday = <dynamic>[].obs;
  RxList<dynamic> thursday = <dynamic>[].obs;
  RxList<dynamic> friday = <dynamic>[].obs;
  RxList<dynamic> saturday = <dynamic>[].obs;
  RxList<dynamic> sunday = <dynamic>[].obs;

  setNotification({required String value}) {
    switch (value) {
      case 'Always':
        always.value = true;
        myTimes.value = false;
        mute.value = false;

        dbService.changeNotifyStatus(value);
        break;

      case 'My times':
        always.value = false;
        myTimes.value = true;
        mute.value = false;
        dbService.changeNotifyStatus(value);

        break;

      case 'Mute':
        always.value = false;
        myTimes.value = false;
        mute.value = true;
        dbService.changeNotifyStatus(value);

        break;
    }
    getNotified.value = value;
  }

  // Updating Notify table
  Future<void> updateNotifyTable(
      {required List dayTimeList, required String day}) async {
    dbService.updateTimeForSpecificDay(dayTimeList: dayTimeList, day: day);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // Print current user's freeSlots data
    print(dataController.currentLoggedInPatient.value?.freeSlots.toString());

    // Initialize the myCalendar with observable fields
    myCalendar.value = Map<String, dynamic>.from(
        dataController.currentLoggedInPatient.value!.freeSlots);

    // Set observable value for getNotified
    getNotified.value = myCalendar["getNotified"];

    // Print the value for Monday
    print("Values for Monday : ${myCalendar['monday']}");

    // / Convert freeSlots into observables
    monday.value = List<dynamic>.from(myCalendar['monday'] ?? []);
    tuesday.value = List<dynamic>.from(myCalendar['tuesday'] ?? []);
    wednesday.value = List<dynamic>.from(myCalendar['wednesday'] ?? []);
    thursday.value = List<dynamic>.from(myCalendar['thursday'] ?? []);
    friday.value = List<dynamic>.from(myCalendar['friday'] ?? []);
    saturday.value = List<dynamic>.from(myCalendar['saturday'] ?? []);
    sunday.value = List<dynamic>.from(myCalendar['sunday'] ?? []);

    // Initialize the notification setting
    setNotification(value: getNotified.value);
  }

  showLogs() {
    print("monday : ${monday.runtimeType}  : $monday");
    print("monday : ${tuesday.runtimeType}  : $tuesday");
    print("monday : ${wednesday.runtimeType}  : $wednesday");
    print("monday : ${thursday.runtimeType}  : $thursday");
    print("monday : ${friday.runtimeType}  : $friday");
    print("monday : ${saturday.runtimeType}  : $saturday");
    print("monday : ${sunday.runtimeType}  : $sunday");
  }

  void onControllerReady() {}
}
