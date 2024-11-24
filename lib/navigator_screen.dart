import 'package:flutter/material.dart';
import 'package:foodix/confirm_order_screen.dart';
import 'package:foodix/favourite_item_screen.dart';
import 'package:foodix/home_screen.dart';
import 'package:foodix/recent_order_screen.dart';

int currentpage = 0;
List<bool> selected = [true, false, false, false];

void setSelectionPage(int index) {
  currentpage = index;
  selected = [false, false, false, false];
  selected[index] = true;
}

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List pages = [
    const Home(),
    const FavouriteItems(),
    const RecentOrders(),
    const ConfirmOrder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              child: pages[currentpage],
            ),
            Container(
                alignment: Alignment.center,
                // decoration: BoxDecoration(
                //     color: Colors.transparent, border: Border.all(width: 1)),
                height: 58,
                margin: const EdgeInsets.only(bottom: 25),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Expanded(flex: 2,child: Container()),
                        iconButtonGenerator(Icons.home_outlined,
                            isSelected: selected[0], onPressed: () {
                          setState(() {
                            setSelectionPage(0);
                          });
                        }),
                        iconButtonGenerator(Icons.favorite_outline_outlined,
                            padding: 6, isSelected: selected[1], onPressed: () {
                          setState(() {
                            setSelectionPage(1);
                          });
                        }),
                        iconButtonGenerator(Icons.event_note_outlined,
                            padding: 6, isSelected: selected[2], onPressed: () {
                          setState(() {
                            setSelectionPage(2);
                          });
                        }),
                        iconButtonGenerator(
                            Icons.account_balance_wallet_outlined,
                            padding: 6,
                            isSelected: selected[3], onPressed: () {
                          setState(() {
                            setSelectionPage(3);
                          });
                        }),
                      ]),
                ))
          ],
        ));
  }

  Widget iconButtonGenerator(IconData? icon,
      {double iconSize = 30,
      double padding = 0,
      bool isSelected = false,
      Function()? onPressed}) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.all(Radius.circular(30)))
          : null,
      child: IconButton(
        highlightColor: Colors.grey.shade800,
        color: isSelected ? Colors.white : Colors.grey,
        padding: EdgeInsets.all(padding),
        iconSize: iconSize,
        alignment: Alignment.center,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
