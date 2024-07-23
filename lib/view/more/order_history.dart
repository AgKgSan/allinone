import 'package:all_in_1/common_widget/order_history_card.dart';
import 'package:all_in_1/models/order.dart';
import 'package:all_in_1/services/order_service.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import 'order_view.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final OrderService _orderService = OrderService();

  List notificationArr = [
    {
      "title": "Your orders has been picked up",
      "time": "Now",
    },
    {
      "title": "Your order has been delivered",
      "time": "1 h ago",
    },
    {
      "title": "Your orders has been picked up",
      "time": "3 h ago",
    },
    {
      "title": "Your order has been delivered",
      "time": "5 h ago",
    },
    {
      "title": "Your orders has been picked up",
      "time": "05 Jun 2024",
    },
    {
      "title": "Your order has been delivered",
      "time": "05 Jun 2024",
    },
    {
      "title": "Your orders has been picked up",
      "time": "06 Jun 2024",
    },
    {
      "title": "Your order has been delivered",
      "time": "06 Jun 2024",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
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
              FutureBuilder<List<dynamic>>(
                future: _orderService.getOrderHistory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final items = snapshot.data!;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      itemCount: items.length,
                      itemBuilder: ((context, index) {
                        var mObj = items[index];

                        return OrderHistoryCard(order: mObj);
                      }),
                    );
                  }
                },
              ),
              // ListView.separated(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   padding: EdgeInsets.zero,
              //   itemCount: notificationArr.length,
              //   separatorBuilder: ((context, index) => Divider(
              //         indent: 25,
              //         endIndent: 25,
              //         color: TColor.secondaryText.withOpacity(0.4),
              //         height: 1,
              //       )),
              //   itemBuilder: ((context, index) {
              //     var cObj = notificationArr[index] as Map? ?? {};
              //     return Container(
              //       decoration: BoxDecoration(color: TColor.white),
              //       padding: const EdgeInsets.symmetric(
              //           vertical: 15, horizontal: 25),
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             margin: const EdgeInsets.only(top: 4),
              //             width: 8,
              //             height: 8,
              //             decoration: BoxDecoration(
              //                 color: TColor.primary,
              //                 borderRadius: BorderRadius.circular(4)),
              //           ),
              //           const SizedBox(
              //             width: 15,
              //           ),
              //           Expanded(
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   cObj["title"].toString(),
              //                   style: TextStyle(
              //                       color: TColor.primaryText,
              //                       fontSize: 14,
              //                       fontWeight: FontWeight.w600),
              //                 ),
              //                 const SizedBox(
              //                   height: 4,
              //                 ),
              //                 Text(
              //                   cObj["time"].toString(),
              //                   style: TextStyle(
              //                       color: TColor.secondaryText,
              //                       fontSize: 12,
              //                       fontWeight: FontWeight.w500),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
