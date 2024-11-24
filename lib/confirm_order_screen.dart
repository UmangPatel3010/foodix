import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodix/make_payment_screen.dart';
import 'package:foodix/navigator_screen.dart';
import 'package:foodix/all_list.dart';
import 'package:flutter/services.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: (cartFoodItems.isEmpty)
          ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cart Is Empty",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30)),
                    child: InkWell(
                      onTap: () {
                        setSelectionPage(0);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NavigationScreen()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_sharp,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Add Item",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: isPortrait
                    ? maxHeight * (cartFoodItems.length * 0.1229) + 270
                    : maxHeight * (cartFoodItems.length * 0.272) + 275,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: maxHeight *
                          (isPortrait
                              ? (cartFoodItems.length * 0.124)
                              : (cartFoodItems.length * 0.272)),
                      child: ListView.builder(
                          itemCount: cartFoodItems.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              // margin: const EdgeInsets.only(bottom: 7),
                              height: 96,
                              decoration: BoxDecoration(
                                  // border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Card(
                                surfaceTintColor: Colors.grey.shade900,
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                              "assets/images/Food/Sandwich.jpg")),
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
                                              "${cartFoodItems[index]["name"]}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "${cartFoodItems[index]["subName"]}",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black,
                                                        fontSize: 17),
                                                  ),
                                                  Expanded(child: Container()),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(1),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color: Colors
                                                                .grey.shade900),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Colors.black45),
                                                    child: Row(
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                if (cartFoodItems[
                                                                            index]
                                                                        [
                                                                        "quantity"] ==
                                                                    1) {
                                                                  showDialog(
                                                                      barrierDismissible:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text(
                                                                            "Confirmation",
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          content:
                                                                              const Text(
                                                                            "Are You Sure You Want to delete?",
                                                                            style:
                                                                                TextStyle(fontSize: 17),
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    Navigator.pop(context);
                                                                                  });
                                                                                },
                                                                                child: const Text("NO")),
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    cartFoodItems.removeAt(index);
                                                                                    Navigator.pop(context);
                                                                                  });
                                                                                },
                                                                                child: const Text("Yes"))
                                                                          ],
                                                                        );
                                                                      });
                                                                } else {
                                                                  cartFoodItems[
                                                                          index]
                                                                      [
                                                                      "quantity"]--;
                                                                }
                                                              });
                                                            },
                                                            child: Icon(
                                                              (cartFoodItems[index]
                                                                          [
                                                                          "quantity"] ==
                                                                      1)
                                                                  ? Icons.cancel
                                                                  : Icons
                                                                      .remove_circle_sharp,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          cartFoodItems[index]
                                                                  ["quantity"]
                                                              .toString()
                                                              .padLeft(2, "0"),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 17),
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                if (cartFoodItems[
                                                                            index]
                                                                        [
                                                                        "quantity"] !=
                                                                    10) {
                                                                  cartFoodItems[
                                                                          index]
                                                                      [
                                                                      "quantity"]++;
                                                                }
                                                              });
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .add_circle_sharp,
                                                              color:
                                                                  Colors.white,
                                                            ))
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
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(30)),
                      child: InkWell(
                        onTap: () {
                          setSelectionPage(0);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NavigationScreen()));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_sharp,
                              size: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add More Items",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Sub Total",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "\$${calcSubTotal().toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 0,
                      indent: 1,
                      endIndent: 1,
                      color: Colors.red.shade400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(vertical: 10)),
                                  elevation: MaterialStateProperty.all(6),
                                  surfaceTintColor:
                                      MaterialStateProperty.all(Colors.pink),
                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.orange.shade900)),
                              onPressed: () {
                                if (cartFoodItems.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "cart is empty you cant proceed");
                                } else {
                                  WidgetsFlutterBinding.ensureInitialized();
                                  SystemChrome.setPreferredOrientations([
                                    DeviceOrientation.portraitUp,
                                    DeviceOrientation.portraitDown
                                  ]);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MakePayment(
                                                subTotal: calcSubTotal(),
                                              ))).then((value) {
                                                // Fluttertoast.showToast(msg: value.toString());
                                  });
                                }
                              },
                              child: const Text("Proceed to Payment")),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  double calcSubTotal() {
    double subtotal = 0.0;
    for (var i in cartFoodItems) {
      subtotal += i["price"] * i["quantity"];
    }
    return subtotal;
  }
}
