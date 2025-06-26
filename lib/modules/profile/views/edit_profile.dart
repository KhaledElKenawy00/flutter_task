import 'package:flutter/material.dart';
import 'package:flutter_task/core/constant/constant.dart';
import 'package:flutter_task/core/data/models/user_model.dart';
import 'package:flutter_task/core/widgets/custom_text_feild.dart';
import 'package:flutter_task/modules/profile/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_gender_selector.dart';
import '../../../core/widgets/custom_profile_image.dart';

class EditProfileView extends StatelessWidget {
  final UserModel user;
  EditProfileView({required this.user});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final birthDateController = TextEditingController();
  final emailController = TextEditingController();
  final gender = ''.obs;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    nameController.text = user.name;
    phoneController.text = user.phone;
    birthDateController.text = user.birthDate;
    emailController.text = user.email;
    gender.value = user.gender;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: salamonColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomProfileImage(
              imageUrl: user.imageUrl,
              onImagePick: () {
                _showImagePickerOptions(controller, user.id);
              },
            ),
            SizedBox(height: 15),
            _buildUserHeader(user),
            SizedBox(height: 25),
            CustomTextField(label: "Full Name", controller: nameController),
            CustomTextField(label: "Email", controller: emailController),
            CustomTextField(
              label: "Mobile Number",
              controller: phoneController,
            ),
            CustomTextField(
              label: "Date Of Birth",
              controller: birthDateController,
            ),
            CustomGenderSelector(gender: gender),
            SizedBox(height: 20),
            _buildUpdateButton(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildUserHeader(UserModel user) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(color: beigeColor),
      child: Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text("ID : ${user.id}"),
        ],
      ),
    );
  }

  Widget _buildUpdateButton(ProfileController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(salamonColor),
        ),
        onPressed: () {
          final updatedUser = user.copyWith(
            name: nameController.text,
            phone: phoneController.text,
            birthDate: birthDateController.text,
            gender: gender.value,
            email: emailController.text,
          );

          controller.updateUser(updatedUser);
          Get.back();
        },
        child: Text(
          'Update Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
      ),
    );
  }

  void _showImagePickerOptions(ProfileController controller, String userId) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('اختيار من المعرض'),
              onTap: () {
                Get.back();
                controller.pickImage(userId, fromCamera: false);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('التقاط صورة بالكاميرا'),
              onTap: () {
                Get.back();
                controller.pickImage(userId, fromCamera: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
