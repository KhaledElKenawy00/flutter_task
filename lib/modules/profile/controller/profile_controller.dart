import 'dart:io';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/data/models/user_model.dart';

class ProfileController extends GetxController {
  final database = FirebaseDatabase.instance.ref('users');
  final storage = FirebaseStorage.instance;
  final picker = ImagePicker();

  var user = Rxn<UserModel>();

  Future<void> fetchUser(String userId) async {
    final snapshot = await database.child(userId).get();
    if (snapshot.exists && snapshot.value != null) {
      final data = Map<String, dynamic>.from(snapshot.value as Map);
      user.value = UserModel.fromMap(data, userId);
    }
  }

  Future<void> updateUser(UserModel updatedUser) async {
    await database.child(updatedUser.id).set(updatedUser.toMap());
    user.value = updatedUser;
  }

  Future<void> pickImage(String userId, {required bool fromCamera}) async {
    final pickedFile = await picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      await uploadImage(File(pickedFile.path), userId);
    }
  }

  Future<void> uploadImage(File imageFile, String userId) async {
    try {
      final ref = storage.ref().child('profile_images/$userId.jpg');
      await ref.putFile(imageFile);
      final imageUrl = await ref.getDownloadURL();

      final updatedUser = user.value!.copyWith(imageUrl: imageUrl);
      await updateUser(updatedUser);

      Get.snackbar('تم', 'تم تحديث صورة الملف الشخصي');
    } catch (e) {
      Get.snackbar('خطأ', 'فشل رفع الصورة: $e');
    }
  }
}
