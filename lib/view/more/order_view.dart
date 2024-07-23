import 'package:all_in_1/models/local_cart.dart';
import 'package:all_in_1/services/local_cart_service.dart';
import 'package:flutter/material.dart';
// import 'package:food_delivery/common/color_extension.dart';
// import 'package:food_delivery/common_widget/round_button.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import 'checkout.dart';
// import '../common_widget/round_button.dart';
// import 'checkout_view.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  final LocalCartService _cartService = LocalCartService();
  List<LocalCartItem>? items = [];
  double _totalPrice = 0.0;
  double deli_fee = 1500;

  @override
  void initState() {
    super.initState();
    getCartItem();
  }

  Future<void> getCartItem() async {
    try {
      final cart_items = await _cartService.getCartItems();

      setState(() {
        items = cart_items;
        _totalPrice = cart_items.fold(
            0, (total, item) => total + (item.price * item.quantity).round());
      });
    } catch (e) {
      // Handle error appropriately
    }
  }

  List itemArr = [
    {"name": "Shan Noodle", "qty": "1", "price": 1500},
    {"name": "Fried Rice", "qty": "1", "price": 2500},
    {"name": "Mon Hin Gar", "qty": "1", "price": 1500},
    {"name": "Ice Coffee", "qty": "1", "price": 2000},
    {"name": "Bubble Tea", "qty": "1", "price": 2000}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
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
                        "My Order",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              //   child: Row(
              //     children: [
              //       ClipRRect(
              //           borderRadius: BorderRadius.circular(15),
              //           child: Image.asset(
              //             "assets/img/logo.PNG",
              //             width: 120,
              //             height: 120,
              //             fit: BoxFit.cover,
              //           )),
              //       const SizedBox(
              //         width: 8,
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "Res Name",
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                   color: TColor.primaryText,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w700),
              //             ),
              //             const SizedBox(
              //               height: 4,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Image.asset(
              //                   "assets/img/rate.png",
              //                   width: 10,
              //                   height: 10,
              //                   fit: BoxFit.cover,
              //                 ),
              //                 const SizedBox(
              //                   width: 4,
              //                 ),
              //                 Text(
              //                   "4.9",
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                       color: TColor.primary, fontSize: 12),
              //                 ),
              //                 const SizedBox(
              //                   width: 8,
              //                 ),
              //                 Text(
              //                   "(124 Ratings)",
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                       color: TColor.secondaryText, fontSize: 12),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 4,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Shop Type",
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                       color: TColor.secondaryText, fontSize: 12),
              //                 ),
              //                 Text(
              //                   " . ",
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                       color: TColor.primary, fontSize: 12),
              //                 ),
              //                 Text(
              //                   "Food Type",
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                       color: TColor.secondaryText, fontSize: 12),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 4,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Image.asset(
              //                   "assets/img/location-pin.png",
              //                   width: 13,
              //                   height: 13,
              //                   fit: BoxFit.contain,
              //                 ),
              //                 const SizedBox(
              //                   width: 4,
              //                 ),
              //                 Expanded(
              //                   child: Text(
              //                     "Address",
              //                     textAlign: TextAlign.left,
              //                     style: TextStyle(
              //                         color: TColor.secondaryText,
              //                         fontSize: 12),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: TColor.textfield),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: items!.length ?? 0,
                  separatorBuilder: ((context, index) => Divider(
                        indent: 25,
                        endIndent: 25,
                        color: TColor.secondaryText.withOpacity(0.5),
                        height: 1,
                      )),
                  itemBuilder: ((context, index) {
                    var cObj = items![index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "${cObj.name} x ${cObj.quantity}",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "\K\s${cObj.price * cObj.quantity}",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Instructions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add, color: TColor.primary),
                          label: Text(
                            "Add Notes",
                            style: TextStyle(
                                color: TColor.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: TColor.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "\K\s${_totalPrice.round()}",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Cost",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "\K\s${deli_fee.round()}",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: TColor.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "\K\s${(_totalPrice + 1500).round()}",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RoundButton(
                        title: "Checkout",
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckOut(),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundButton(
                        title: "Clear Cart",
                        onpressed: () {
                          _cartService.clearCart();
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
