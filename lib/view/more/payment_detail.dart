import 'package:flutter/material.dart';


import '../../common/color_extension.dart';

import 'order_view.dart';


class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  List cardArr = [
    {
      "icon": "assets/img/KPay.png",
      "payment": "Kpay",
    },
     {
      "icon": "assets/img/KPay.png",
      "payment": "Wave",
    }
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
                        "Payment Details",
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text(
                  "Customize your payment method",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(
                  color: TColor.secondaryText.withOpacity(0.4),
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: TColor.textfield,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          offset: Offset(0, 9))
                    ]),
                child: Column(
                  children: [
                    Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: TColor.textfield,
                                      borderRadius: BorderRadius.circular(10),),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      items: ["Cash on Deli","Online Payment"].map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                                color: TColor.primaryText,
                                                fontSize: 14),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (val) {},
                                      hint: Text(
                                        "- Select the payment method -",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: TColor.secondaryText,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Divider(
                        color: TColor.secondaryText.withOpacity(0.4),
                        height: 1,
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: cardArr.length,
                      itemBuilder: ((context, index) {
                        var cObj = cardArr[index] as Map? ?? {};
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 35),
                          child: Row(
                            children: [
                              Image.asset(
                                cObj["icon"].toString(),
                                width: 50,
                                height: 35,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  cObj["payment"].toString(),
                                  style: TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              
                            ],
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Divider(
                        color: TColor.secondaryText.withOpacity(0.4),
                        height: 1,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 15, horizontal: 35),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "Other Methods",
                    //         style: TextStyle(
                    //             color: TColor.primaryText,
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25),
              //   child: RoundIconButton(
              //       title: "Add Another Credit/Debit Card",
              //       icon: "assets/img/add.png",
              //       color: TColor.primary,
              //       fontSize: 16,
              //       onPressed: () {
              //         // showModalBottomSheet(
              //         //   isScrollControlled: true,
              //         //   backgroundColor: Colors.transparent,
              //         //     context: context,
              //         //     builder: (context) {
              //         //       return const AddCardView();
              //         //     });
              //         // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddCardView() ));
              //       }),
              // ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
