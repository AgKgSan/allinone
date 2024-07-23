import 'dart:convert';

import 'package:all_in_1/common/color_extension.dart';
import 'package:all_in_1/models/order.dart';
import 'package:all_in_1/view/more/order_view.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  final dynamic order;
  const OrderDetail({super.key, required this.order});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    // Sample data; replace this with real data from your backend
    final dynamic items;

    @override
    void initState() {
      super.initState();
    }

    Future<void> _formatItem() async {
      json.decode(widget.order['order_items']);
      setState(() {});
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 46,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset("assets/img/btn_back.png",
                        width: 20, height: 20),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "My Orders",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyOrderView()));
                    },
                    icon: Image.asset(
                      "assets/img/shopping_cart.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Order ID: ${widget.order['id']}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text('Customer Address: ${widget.order['customer_address']}'),
            Text('Delivery Fee: ${widget.order['delivery_cost']}'),
            Text('Sub Total: ${widget.order['sub_total']}'),
            Text('Grand Total: ${widget.order['total_price']}'),
            Text('Order Status: ${widget.order['status']}'),
            // Text('Latitude: ${widget.order.latitude}'),
            // Text('Longitude: ${widget.order.longitude}'),
            Text('Delivery Note: ${widget.order['delivery_note']}'),
            // Text('Delivery Cost: \$${orderDetails["delivery_cost"]}'),
            // Text('Subtotal: \$${orderDetails["sub_total"]}'),
            // Text('Total Price: \$${orderDetails["total_price"]}'),
            // Text('Status: ${_getStatusText(orderDetails["status"])}'),
            // Text('Created At: ${orderDetails["created_at"]}'),
            // Text('Updated At: ${orderDetails["updated_at"]}'),
            ...widget.order['order_items'].map((item) {
              final itemData = item;
              return Card(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                elevation: 2.0,
                child: ListTile(
                  leading: Image.network(
                    item['logo'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text("Item"),
                  subtitle: Text(
                      'Quantity: ${item['quantity']} x \K\s${item['price']}'),
                  trailing: Text('\K\s${item['quantity'] * item['price']}'),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  String _getStatusText(int status) {
    switch (status) {
      case 1:
        return 'Delivered';
      case 2:
        return 'Pending';
      case 3:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }
}
