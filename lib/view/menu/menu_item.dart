import 'package:all_in_1/common_widget/menu_row.dart';
import 'package:all_in_1/view/menu/item_details.dart';
import 'package:all_in_1/view/more/order_view.dart';
import 'package:flutter/material.dart';
// import 'package:food_delivery/common/color_extension.dart';
// import 'package:food_delivery/common_widget/round_textfield.dart';

import '../../common/color_extension.dart';
// import '../../common_widget/menu_item_row.dart';
import '../../common_widget/round_textfield.dart';
// import '../more/my_order_view.dart';
// import 'item_details_view.dart';

class MenuItem extends StatefulWidget {
  final Map mObj;
  const MenuItem({super.key, required this.mObj});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  TextEditingController txtSearch = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/img/myanmarfood.webp",
      "name": "Mala",
      "rate": "4.9",
      "rating": "124",
      "type": "Mala Queen",
      "food_type": "Food"
    },
    {
      "image": "assets/img/myanmarfood.webp",
      "name": "Shan",
      "rate": "4.9",
      "rating": "124",
      "type": "Shan",
      "food_type": "Drink"
    },
    {
      "image": "assets/img/myanmarfood.webp",
      "name": "Mala",
      "rate": "4.9",
      "rating": "124",
      "type": "Mala King",
      "food_type": "Food"
    },
    {
      "image": "assets/img/myanmarfood.webp",
      "name": "Shan",
      "rate": "4.9",
      "rating": "124",
      "type": "Shan",
      "food_type": "Drink"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        widget.mObj["name"].toString(),
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
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Search Food",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   padding: EdgeInsets.zero,
              //   itemCount: menuItemsArr.length,
              //   itemBuilder: ((context, index) {
              //     var mObj = menuItemsArr[index] as Map? ?? {};
              //     return MenuItemRow(mObj: mObj,onTap:(){
              //        Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const ItemDetails()),
              //         );
              //     });
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
