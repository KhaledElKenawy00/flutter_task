import 'package:flutter/material.dart';
import 'package:flutter_task/core/constant/constant.dart';
import 'package:flutter_task/modules/profile/controller/order_controller.dart';
import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrdersController());

    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders', style: TextStyle(color: salamonColor)),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.orders.isEmpty) {
          return Center(child: Text('لا توجد طلبات حتى الآن'));
        }

        return ListView.builder(
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final order = controller.orders[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(order.imageUrl),
                ),
                title: Text(order.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.description,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${order.total}\$",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text("1X USD", style: TextStyle(color: Colors.black)),
                        Text(
                          "total: ${order.total}\$",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: SizedBox(
                  width: 60,
                  child: Row(
                    children: [
                      CircleAvatar(
                        foregroundColor: salamonColor,
                        radius: 15,
                        child: Icon(Icons.delete, color: salamonColor),
                      ),

                      CircleAvatar(
                        radius: 15,
                        child: Icon(Icons.add, color: salamonColor),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
