import 'dart:convert';

import 'package:all_in_1/common/color_extension.dart';
import 'package:all_in_1/common_widget/cata.dart';
import 'package:all_in_1/common_widget/most_popular.dart';
import 'package:all_in_1/common_widget/round_textfield.dart';
import 'package:all_in_1/common_widget/view_all.dart';
import 'package:all_in_1/models/category.dart';
import 'package:all_in_1/services/category_service.dart';
import 'package:all_in_1/view/more/order_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../common_widget/popular_resutaurant.dart';
import '../../common_widget/recent_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtSearch = TextEditingController();
  final CategoryService categoryService = CategoryService();

  List catArr = [
    {"image": "assets/img/offerCat.png", "name": "Offers"},
    {"image": "assets/img/pngwing.com.png", "name": "Shan"},
    {"image": "assets/img/myanmarfood.webp", "name": "Myanmar"},
    {"image": "assets/img/offerCat1.png", "name": "China"},
    {"image": "assets/img/offerCat1.png", "name": "Thai"},
  ];

  List popArr = [
    {
      "image": "assets/img/myanmarfood.webp",
      "name": "Res type",
      "rate": "4.9",
      "rating": "124",
      "type": "type",
      "food_type": "Food type"
    },
  ];

  List mostPopArr = [
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
      // backgroundColor: const Color(0xfffDfDfE),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " Hello User! ",
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
                            builder: (context) => const MyOrderView()),
                      );
                    },
                    icon: Image.asset(
                      "assets/img/shopping_cart.png",
                      width: 30,
                      height: 30,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Delivery To ",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 10,
                        fontWeight: FontWeight.w800),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Image.asset(
                        "assets/img/drop_down.png",
                        width: 12,
                        height: 12,
                      ),
                    ],
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
                // bgColor: TColor.primary,
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
              height: 30,
            ),
            SizedBox(
              height: 120,
              child: FutureBuilder<List<Category>>(
                future: categoryService.fetchCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final categories = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: categories.length,
                      itemBuilder: ((context, index) {
                        final category = categories[index];
                        return Cata(
                          cObj: category,
                          onTap: () {},
                        );
                      }),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ViewAll(
                title: "Popular Restaurants",
                onView: () {},
              ),
            ),
            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   padding: EdgeInsets.zero,
            //   itemCount: popArr.length,
            //   itemBuilder: ((context, index) {
            //     var pObj = popArr[index] as Map? ?? {};
            //     return PopularRestaurant(
            //       pObj: pObj,
            //       onTap: () {},
            //     );
            //   }),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ViewAll(
                title: "Most Popular",
                onView: () {},
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: mostPopArr.length,
                itemBuilder: ((context, index) {
                  var mObj = mostPopArr[index] as Map? ?? {};
                  return MostPopular(
                    mObj: mObj,
                    onTap: () {},
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ViewAll(
                title: "Recent Items",
                onView: () {},
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: recentArr.length,
              itemBuilder: ((context, index) {
                var rObj = recentArr[index] as Map? ?? {};
                return RecentItem(
                  rObj: rObj,
                  onTap: () {},
                );
              }),
            ),
          ],
        ),
      )),
    );
  }
}
