import 'package:get/get.dart';
import 'package:flutter_task/core/data/models/order_model.dart';

class OrdersController extends GetxController {
  var orders = <OrderModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    orders.value = [
      OrderModel(
        id: '1',
        title: 'order 1',
        description: 'طلب يحتوي على منتجات متنوعة تشمل ملابس واكسسوارات.',
        date: '2024-06-20',
        total: 250.0,
        imageUrl:
            'https://assets-jpcust.jwpsrv.com/thumbnails/k98gi2ri-720.jpg',
      ),
      OrderModel(
        id: '2',
        title: 'طلب رقم 2',
        description: 'طلب يشمل أجهزة إلكترونية وإكسسوارات تقنية.',
        date: '2024-06-15',
        total: 120.5,
        imageUrl:
            'https://media.post.rvohealth.io/wp-content/uploads/2020/03/oats-oatmeal-732x549-thumbnail.jpg',
      ),
      OrderModel(
        id: '3',
        title: 'طلب رقم 3',
        description: 'طلب يحتوي على أدوات منزلية ومستلزمات مطبخ.',
        date: '2024-06-10',
        total: 500.75,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwxSM9Ib-aDXTUIATZlRPQ6qABkkJ0sJwDmA&usqp=CAU',
      ),
    ];
  }
}
