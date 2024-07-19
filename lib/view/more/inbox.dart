import 'package:all_in_1/common/color_extension.dart';
import 'package:all_in_1/view/more/order_view.dart';
import 'package:flutter/material.dart';


class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List inboxArr = [
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
{
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
    },
    {
      "title": " Promotions",
      "detail":
          "1+1 for every Milk Shake",
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
                        "Inbox",
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
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: inboxArr.length,
                separatorBuilder: ((context, index) => Divider(
                      indent: 25,
                      endIndent: 25,
                      color: TColor.secondaryText.withOpacity(0.4),
                      height: 1,
                    )),
                itemBuilder: ((context, index) {
                  var cObj = inboxArr[index] as Map? ?? {};
                  return Container(
                    decoration: BoxDecoration(
                        color:
                            TColor.white ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cObj["title"].toString(),
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                cObj["detail"].toString(),
                                maxLines: 2,
                                style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}