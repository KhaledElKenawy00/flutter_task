import 'package:flutter/material.dart';
import 'package:flutter_task/core/constant/constant.dart';

class CustomProfileImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onImagePick;

  const CustomProfileImage({
    required this.imageUrl,
    required this.onImagePick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(radius: 50, backgroundImage: NetworkImage(imageUrl)),
          Positioned(
            bottom: -15,
            child: IconButton(
              onPressed: onImagePick,
              icon: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: salamonColor,
                ),
                child: Icon(Icons.camera_sharp, color: BlackColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
