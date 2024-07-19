import 'package:all_in_1/common/color_extension.dart';
import 'package:all_in_1/common_widget/tab_button.dart';
import 'package:all_in_1/view/home/home_view.dart';
import 'package:all_in_1/view/menu/menu.dart';
import 'package:all_in_1/view/more/more.dart';
import 'package:all_in_1/view/offer/offer.dart';
import 'package:all_in_1/view/profile/profile.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPageView = const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPageView),
      backgroundColor: const Color(0xfff5f5f5),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (selectTab != 2) {
                selectTab = 2;
                selectPageView = const HomeView();
              } else {}
              if (mounted) {
                setState(() {});
              }
            });
          },
          shape: const CircleBorder(),
          backgroundColor: selectTab == 2 ? TColor.primary : TColor.placeholder,
          child: Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/img/home_tab.png",
              width: 30,
              height: 30,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: TColor.white,
        surfaceTintColor: TColor.white,
        shadowColor: Colors.black,
        elevation: 1,
        notchMargin: 12,
        height: 80,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                title: "Menu",
                icon: "assets/img/menu_tab.png",
                onTap: () {
                  if (selectTab != 0) {
                    selectTab = 0;
                    selectPageView = const MenuView();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                isSelected: selectTab == 0,
              ),
              TabButton(
                title: "Offer",
                icon: "assets/img/offer_tab.png",
                onTap: () {
                  if (selectTab != 1) {
                    selectTab = 1;
                    selectPageView = const OfferView();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                isSelected: selectTab == 1,
              ),
              const SizedBox(
                width: 30,
                height: 30,
              ),
              TabButton(
                title: "Profile",
                icon: "assets/img/profile_tab.png",
                onTap: () {
                  if (selectTab != 3) {
                    selectTab = 3;
                    selectPageView =const  Profile();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                isSelected: selectTab == 3,
              ),
              TabButton(
                title: "More",
                icon: "assets/img/more_tab.png",
                onTap: () {
                  if (selectTab != 4) {
                    selectTab = 4;
                    selectPageView = const MoreView();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                isSelected: selectTab == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
