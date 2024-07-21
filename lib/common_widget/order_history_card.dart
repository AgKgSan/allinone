import 'package:all_in_1/models/order.dart';
import 'package:all_in_1/view/more/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderHistoryCard extends StatelessWidget {
  final Order order;

  const OrderHistoryCard({
    super.key,
    required this.order,
  });

  String _formatDate(String dateStr) {
    final dateFormat = DateFormat('d/M/yyyy h:mm a');
    final date = DateTime.parse(dateStr);
    return dateFormat.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetail(
                  order: order,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order ID: ${order.id}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Address: ${order.customerAddress}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Total : ${order.totalPrice}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Order Date: ${_formatDate(order.created_at)}',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status: ${order.status}',
                      style: TextStyle(
                        color: _getStatusColor("pending"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      _getStatusIcon("pending"),
                      color: _getStatusColor("pending"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "accepted":
        return Colors.green;
      case "delivering":
        return Colors.orange;
      case "delivered":
        return Colors.blue;
      case "cancel":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case "accepted":
        return Icons.check_circle;
      case "delivering":
        return Icons.hourglass_empty;
      case "delivered":
        return Icons.check_circle;
      case "cancel":
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }
}
