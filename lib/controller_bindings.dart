import 'package:get/get.dart';

import 'services/services.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ZeitnahController());
  }
}
