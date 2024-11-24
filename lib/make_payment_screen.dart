import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodix/navigator_screen.dart';
import 'package:foodix/recent_order_screen.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:intl/intl.dart';
import 'all_list.dart';

class MakePayment extends StatefulWidget {
  final double subTotal;

  const MakePayment({super.key, required this.subTotal});

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  bool isPromotionCodeSelected = false;
  int selectedPromoIndex = -1;

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Orders"),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                WidgetsFlutterBinding.ensureInitialized();
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.landscapeLeft
                ]);
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_sharp)),
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  Fluttertoast.showToast(msg: value);
                },
                position: PopupMenuPosition.under,
                iconSize: 28,
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(value: "item-1", child: Text("item-1")),
                    const PopupMenuItem(value: "item-2", child: Text("item-2")),
                    const PopupMenuItem(value: "item-3", child: Text("item-3")),
                  ];
                }),
            const SizedBox(
              width: 7,
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: maxHeight - (AppBar().preferredSize.height) - 36,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.black),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: maxHeight * (cartFoodItems.length * 0.1269),
                      child: ListView.builder(
                          itemCount: cartFoodItems.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 7),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12),
                              height: 95,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assets/images/Food/Sandwich.jpg",
                                        width: 71,
                                      )),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "${cartFoodItems[index]["subName"]}",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "${cartFoodItems[index]["name"]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    bottom: 1),
                                                child: const Text(
                                                  "\$",
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                "${cartFoodItems[index]["price"]}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    fontSize: 17),
                                              ),
                                              Expanded(child: Container()),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 3),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0,
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.black45),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Quantity:${cartFoodItems[index]["quantity"]}",
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: (isPromotionCodeSelected) ? 17 : 0,
                              bottom: (isPromotionCodeSelected) ? 10 : 0),
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SimpleDialog(
                                      alignment: Alignment.center,
                                      surfaceTintColor: Colors.blue,
                                      title: const Text("Select a Promo Code"),
                                      titlePadding: const EdgeInsets.symmetric(
                                          horizontal: 35, vertical: 10),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      children: [
                                        SizedBox(
                                          height: 235,
                                          child: ListView.builder(
                                              itemCount: promoCodes.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      Navigator.pop(
                                                          context, index);
                                                      // Fluttertoast.showToast(msg: "${(promoCodes[index]["Description"]!.length ~/37) * 20}");
                                                    });
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 5),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    height: 70 +
                                                        ((promoCodes[index][
                                                                        "description"]!
                                                                    .length ~/
                                                                37) *
                                                            20),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "${promoCodes[index]["name"]}",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                            ),
                                                            Expanded(
                                                                child:
                                                                    Container()),
                                                            Text(
                                                              "${promoCodes[index]["code"]}",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          13),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 7,
                                                        ),
                                                        Text(
                                                          "${promoCodes[index]["description"]}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        )
                                      ],
                                    );
                                  },
                                ).then((value) {
                                  if (double.parse(
                                          promoCodes[value]["discount"]!) <
                                      widget.subTotal) {
                                    selectedPromoIndex = value;
                                    isPromotionCodeSelected = true;
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "You can't apply this Promo Code");
                                  }
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: (isPromotionCodeSelected)
                                  ? MainAxisAlignment.center
                                  : MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  (isPromotionCodeSelected)
                                      ? Icons.check_circle
                                      : Icons.add_circle_sharp,
                                  size: 30,
                                  color: (isPromotionCodeSelected)
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      (isPromotionCodeSelected)
                                          ? Text(
                                              "${promoCodes[selectedPromoIndex]["name"]}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 17),
                                            )
                                          : const SizedBox(),
                                      Text(
                                        (isPromotionCodeSelected)
                                            ? "Promotion Code Applied"
                                            : "Apply Promotion Code",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: (isPromotionCodeSelected)
                                                ? 12
                                                : 17),
                                      ),
                                    ]),
                                (isPromotionCodeSelected)
                                    ? Expanded(child: Container())
                                    : const SizedBox(),
                                (isPromotionCodeSelected)
                                    ? Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 12, right: 15),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${promoCodes[selectedPromoIndex]["code"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.orange.shade700,
                                              fontSize: 19),
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                        ),
                        (isPromotionCodeSelected)
                            ? Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                margin:
                                    const EdgeInsets.only(top: 15, right: 6),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPromotionCodeSelected = false;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.xmark,
                                      color: Colors.red.shade400, size: 20),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          const Text(
                            "Sub Total",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text("\$${widget.subTotal.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        children: [
                          const Text(
                            "Promo Code",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                              (isPromotionCodeSelected)
                                  ? "- \$${double.parse(promoCodes[selectedPromoIndex]["discount"]!).toStringAsFixed(2)}"
                                  : "- \$0.00",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white))
                        ],
                      ),
                    ),
                    Divider(
                      height: 0,
                      indent: 1,
                      endIndent: 1,
                      color: Colors.grey.shade800,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 7, bottom: 50),
                      child: Row(
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                              (isPromotionCodeSelected)
                                  ? calcGrandTotal().toStringAsFixed(2)
                                  : "\$${widget.subTotal.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 5),
          color: Colors.black,
          height: 80,
          child: SlideAction(
            height: 55,
            sliderRotate: false,
            sliderButtonIcon: const Icon(Icons.payment),
            sliderButtonIconSize: 25,
            sliderButtonIconPadding: 8,
            sliderButtonYOffset: 0,
            outerColor: Colors.grey.shade700,
            innerColor: Colors.orange,
            animationDuration: const Duration(milliseconds: 900),
            onSubmit: () {
              List temp = [];
              for (Map item in cartFoodItems) {
                temp.add(
                    {"itemName": item["name"], "itemPrice": item["price"]});
              }
              orderHistoryDetail.add(false);

              recentOrders.add({
                "orderID": Random().nextInt(1000).toString(),
                "dateTime":
                    DateFormat.yMd().add_jm().format(DateTime.now()).toString(),
                "items": temp,
                "subTotal": widget.subTotal,
                "discount": (isPromotionCodeSelected)
                    ? promoCodes[selectedPromoIndex]["discount"]
                    : 0,
                "grandTotal": (isPromotionCodeSelected)
                    ? calcGrandTotal()
                    : widget.subTotal
              });

              Fluttertoast.showToast(msg: "Payment Done");
              cartFoodItems = [];
              setSelectionPage(0);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationScreen()));
              return null;
            },
            child: Container(
                margin: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    Text(
                      ">",
                      style: TextStyle(
                          fontSize: 30, color: Colors.white.withOpacity(1)),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      ">",
                      style: TextStyle(
                          fontSize: 30, color: Colors.white.withOpacity(0.8)),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      ">",
                      style: TextStyle(
                          fontSize: 30, color: Colors.white.withOpacity(0.6)),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      ">",
                      style: TextStyle(
                          fontSize: 30, color: Colors.white.withOpacity(0.4)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Make Payment",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
          ),
        ));
  }

  double calcGrandTotal() {
    return widget.subTotal -
        double.parse(promoCodes[selectedPromoIndex]["discount"]!);
  }
}
