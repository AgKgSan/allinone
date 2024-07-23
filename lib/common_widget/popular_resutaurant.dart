import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class PopularRestaurant extends StatelessWidget {
  final dynamic pObj;
  final VoidCallback onTap;
  const PopularRestaurant({super.key, required this.pObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              // borderRadius: BorderRadius.circular(70),
              child: Image.network(
                pObj['logo'],
                width: double.maxFinite,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    pObj["name"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/img/rate.png",
                        width: 10,
                        height: 10,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        pObj["rating"].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: TColor.primary, fontSize: 11),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "(${pObj["rating"].toString()} Ratings)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 11),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Type",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 11),
                      ),
                      Text(
                        " . ",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: TColor.primary, fontSize: 11),
                      ),
                      Text(
                        "Food Type",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
