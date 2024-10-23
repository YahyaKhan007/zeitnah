import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';

import '../../models/models.dart';

class ImagePickerUtils {
  final dataController = Get.find<ZeitnahDataController>();
  final _picker = ImagePicker();
  final _dbService = DataBaseService();

  void pickImageFromGallery({required ClinicModel clinicModel}) async {
    try {
      final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedImage == null) {
        dataController.imageLoading.value = false;
        return;
      }
      dataController.imageLoading.value = true;

      File imageFile = File(pickedImage.path);

      String fileName = DateTime.now().microsecondsSinceEpoch.toString();

      Reference storageRef =
          FirebaseStorage.instance.ref().child('clinicsProfilePhoto/$fileName');

      UploadTask uploadTask = storageRef.putFile(imageFile);

      TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});
      String imageUrl = await snapshot.ref.getDownloadURL();

      dataController.currentLoggedInClinic.value!.profilePicture = imageUrl;

      await _dbService.updatePhotoForClinic(imageUrl);

      // dataController.pickedImage.value = pickedImage;

      dataController.imageLoading.value = false;
    } catch (e, stackTrace) {
      dataController.imageLoading.value = false;
      log("Error : ${e.toString()}");
      log("stackTrace : $stackTrace");
    }
  }

  void pickImageFromCamera({required ClinicModel clinicModel}) async {
    try {
      final pickedImage = await _picker.pickImage(source: ImageSource.camera);

      if (pickedImage == null) return;

      dataController.pickedImage.value = pickedImage;
    } catch (e, stackTrace) {
      log("Error : ${e.toString()}");
      log("stackTrace : $stackTrace");
    }
  }
}
