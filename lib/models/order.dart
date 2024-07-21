import 'package:all_in_1/models/local_cart.dart';
import 'package:all_in_1/models/order_item.dart';

class Order {
  final int id;
  final List<OrderItem>? orderItems;
  final String customerAddress;
  final String latitude;
  final String longitude;
  final double totalPrice;
  final String deliveryNote;
  final double deliveryCost;
  final double subTotal;
  final int status;
  final String created_at;

  Order({
    required this.id,
    required this.orderItems,
    required this.customerAddress,
    required this.latitude,
    required this.longitude,
    required this.totalPrice,
    required this.deliveryNote,
    required this.deliveryCost,
    required this.subTotal,
    required this.status,
    required this.created_at,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    var items = json['order_items'] as List;

    List<OrderItem> orderItemList =
        items.map((i) => OrderItem.fromJson(i)).toList();

    return Order(
      id: json['id'] ?? 0,
      orderItems: orderItemList,
      customerAddress: json['customer_address'] ?? "",
      latitude: json['latitude'] ?? "",
      longitude: json['longitude'] ?? "",
      totalPrice: (json['total_price'] as num?)?.toDouble() ?? 0,
      deliveryNote: json['delivery_note'] ?? "",
      deliveryCost: (json['delivery_cost'] as num?)?.toDouble() ?? 0,
      subTotal: (json['sub_total'] as num?)?.toDouble() ?? 0,
      status: json['status'] ?? 0,
      created_at: json['created_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        'order_items': orderItems?.map((item) => item.toJson()).toList(),
        'customer_address': customerAddress,
        'latitude': latitude,
        'longitude': longitude,
        'total_price': totalPrice,
        'delivery_note': deliveryNote,
        'delivery_cost': deliveryCost,
        'sub_total': subTotal,
        'status': status,
        'created_at': created_at,
      };
}
