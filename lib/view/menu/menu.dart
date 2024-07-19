import 'package:all_in_1/view/menu/menu_item.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_textfield.dart';
import '../more/order_view.dart';
// import '../more/my_order_view.dart';
// import 'menu_items_view.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  List menuArr = [
    {
      "name": "Food",
      "image": "assets/img/myanmarfood.webp",
      "items_count": "120",
    },
    {
      "name": "Drink",
      "image": "assets/img/myanmarfood.webp",
      "items_count": "220",
    },
    {
      "name": "China",
      "image": "assets/img/myanmarfood.webp",
      "items_count": "155",
    },
    {
      "name": "Promotions",
      "image": "assets/img/myanmarfood.webp",
      "items_count": "25",
    },
  ];
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        // alignment: Alignment.centerLeft,
        children: [
          // Container(
          //   margin: const EdgeInsets.only(top: 50),
          //   width: media.width * 1,
          //   height: media.height * 0.1,
          //   decoration:  BoxDecoration(
          //     color:Color.fromARGB(154, 242, 227, 10),
          //     borderRadius:  const BorderRadius.only(
          //         topRight: Radius.circular(30),
          //         bottomRight: Radius.circular(30),
          //         topLeft: Radius.circular(30),
          //         ),
          //   ),
          // ),
          // Container(
          //   margin: const EdgeInsets.only(top: 200),
          //   width: media.width * 0.27,
          //   height: media.height * 1,
          //   decoration:  BoxDecoration(
          //     color: TColor.primary,
          //     borderRadius:  const BorderRadius.only(
          //         topRight: Radius.circular(30),
          //         bottomRight: Radius.circular(30)),
          //   ),
          // ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Menu",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
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
                    height: 70,
                  ),
                  ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: menuArr.length,
                      itemBuilder: ((context, index) {
                        var mObj = menuArr[index] as Map? ?? {};
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuItem(
                                  mObj: mObj,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 8, bottom: 8, right: 20),
                                width: media.width - 100,
                                height: 90,
                                decoration: BoxDecoration(
                                    color: TColor.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 30,
                                          offset: Offset(0, 4))
                                    ]),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      mObj["image"].toString(),
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          mObj["name"].toString(),
                                          style: TextStyle(
                                              color: TColor.primaryText,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "${mObj["items_count"].toString()} items",
                                          style: TextStyle(
                                              color: TColor.secondaryText,
                                              fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(17.5),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 4,
                                              offset: Offset(0, 2))
                                        ]),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      "assets/img/btn_next.png",
                                      width: 15,
                                      height: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
