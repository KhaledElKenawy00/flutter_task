import 'package:flutter/material.dart';
import 'package:flutter_task/core/constant/constant.dart';
import 'package:flutter_task/core/widgets/build_settings_option.dart';
import 'package:flutter_task/core/widgets/build_top_option_column.dart';
import 'package:flutter_task/modules/profile/controller/profile_controller.dart';
import 'package:flutter_task/modules/profile/views/edit_profile.dart';
import 'package:flutter_task/modules/profile/views/order_view.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  final String userId;

  ProfileView({required this.userId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    controller.fetchUser(userId);
    // UserModel user = controller.user.value!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile', style: TextStyle(color: salamonColor)),
        actions: [
          Obx(() {
            if (controller.user.value == null) return SizedBox();
            return IconButton(
              onPressed: () {
                Get.to(() => EditProfileView(user: controller.user.value!));
              },
              icon: Icon(Icons.edit, color: salamonColor),
            );
          }),
        ],
      ),
      body: Obx(() {
        if (controller.user.value == null) {
          return Center(child: CircularProgressIndicator());
        }
        final user = controller.user.value!;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user.imageUrl),
                    ),
                  ],
                ),
                Text(
                  user.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text("ID : ${user.id}"),
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: salamonColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTopOption(Icons.person, "Profile"),
                      VerticalDivider(
                        color: whiteColor,
                        endIndent: 20,
                        indent: 20,
                      ),
                      buildTopOption(Icons.favorite, "Wishlist"),
                      VerticalDivider(
                        color: whiteColor,
                        endIndent: 20,
                        indent: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => OrdersView());
                        },
                        child: buildTopOption(
                          Icons.shopping_cart_sharp,
                          "My Orders",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                buildSettingsRow(Icons.privacy_tip, "Privacy Policy"),
                buildSettingsRow(Icons.payment, "Payment Methods"),
                buildSettingsRow(Icons.notification_add, "Notification"),
                buildSettingsRow(Icons.settings, "Settings"),
                buildSettingsRow(Icons.help, "Help"),
                buildSettingsRow(Icons.logout, "Log Out"),
              ],
            ),
          ),
        );
      }),
    );
  }
}
