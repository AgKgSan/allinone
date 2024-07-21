import 'package:all_in_1/common_widget/menu_row.dart';
import 'package:all_in_1/models/item.dart';
import 'package:all_in_1/services/item_service.dart';
import 'package:all_in_1/view/menu/item_details.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/popular_resutaurant.dart';

import '../../common_widget/round_button.dart';

import '../more/order_view.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  TextEditingController txtSearch = TextEditingController();
  final ItemService itemService = ItemService();

  List offerArr = [
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

  List recentArr = [
    {
      "image": "assets/img/myanmarfood.webp",
      "name": "Res type",
      "rate": "4.9",
      "rating": "124",
      "type": "type",
      "food_type": "Food type"
    },
    {
      "image": "assets/img/myanmarfood.webp",
      "name": "Res type",
      "rate": "4.9",
      "rating": "124",
      "type": "type",
      "food_type": "Food type"
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Offers",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find discounts, Offers special\nmeals and more!",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 140,
                  height: 30,
                  child: RoundButton(
                    title: "check Offers",
                    fontSize: 12,
                    onpressed: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder<List<Item>>(
                future: itemService.fetchItems(),
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

                        return ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: MenuItemRow(
                            mObj: mObj,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ItemDetails(id: mObj.id),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
