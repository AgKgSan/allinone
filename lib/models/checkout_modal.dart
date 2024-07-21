import 'package:all_in_1/models/local_cart.dart';

class CheckOutModal {
  final List<LocalCartItem>? orderItems;
  final String customerAddress;
  final double latitude;
  final double longitude;
  final double totalPrice;
  final String deliveryNote;
  final double deliveryCost;
  final double subTotal;
  final double status;

  CheckOutModal({
    required this.orderItems,
    required this.customerAddress,
    required this.latitude,
    required this.longitude,
    required this.totalPrice,
    required this.deliveryNote,
    required this.deliveryCost,
    required this.subTotal,
    required this.status,
  });

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
      };
}
