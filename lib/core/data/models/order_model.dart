class OrderModel {
  final String id;
  final String title;
  final String description;
  final String date;
  final double total;
  final String imageUrl;

  OrderModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.total,
    required this.imageUrl,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map, String id) {
    return OrderModel(
      id: id,
      title: map['title'],
      description: map['description'],
      date: map['date'],
      total: (map['total'] as num).toDouble(),
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'total': total,
      'imageUrl': imageUrl,
    };
  }
}
