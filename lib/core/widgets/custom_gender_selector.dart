import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/core/constant/constant.dart';

class CustomGenderSelector extends StatelessWidget {
  final RxString gender;

  const CustomGenderSelector({required this.gender, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: beigeColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Obx(
            () => Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'male',
                        groupValue: gender.value,
                        onChanged: (value) {
                          gender.value = value!;
                        },
                      ),
                      Text('Male'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'female',
                        groupValue: gender.value,
                        onChanged: (value) {
                          gender.value = value!;
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
