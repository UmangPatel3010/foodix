import 'package:flutter/material.dart';
import 'package:foodix/all_list.dart';

List<bool> orderHistoryDetail = [];//[false,false,false,false,false,false];
void setOrderHistoryDetail(index) {
  orderHistoryDetail[index] = !orderHistoryDetail[index];
}

class RecentOrders extends StatefulWidget {
  const RecentOrders({super.key});

  @override
  State<RecentOrders> createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  double historyHeight =
      double.parse(((804 * 0.210) * recentOrders.length).toString());

  void calculateHeight(index) {
    if (orderHistoryDetail[index])
      historyHeight += recentOrders[index]["items"].length * 25.0 + 87;
    else
      historyHeight -= recentOrders[index]["items"].length * 25.0 + 87;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text(
            "Orders History",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: (recentOrders.isEmpty)
            ? Center(
                child: Text(
                  "You Haven't Order Yet",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 7),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: historyHeight + 70,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: recentOrders.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              setOrderHistoryDetail(index);
                              calculateHeight(index);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 7),
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      rowTextCreator(
                                          title: "OrderID",
                                          value: recentOrders[index]
                                              ["orderID"]),
                                      rowTextCreator(
                                          title: "Date and Time",
                                          value: recentOrders[index]
                                              ["dateTime"]),
                                      rowTextCreator(
                                          title: "Item Ordered",
                                          value: recentOrders[index]["items"]
                                              .length
                                              .toString()),
                                      orderHistoryDetail[index]
                                          ? const SizedBox()
                                          : rowTextCreator(
                                              title: "Amount Payed",
                                              value:
                                                  "\$ ${double.parse(recentOrders[index]["grandTotal"].toString()).toStringAsFixed(2)}"),
                                      orderHistoryDetail[index]
                                          ? getMoreDetails(
                                              recentOrders[index]["subTotal"],
                                              recentOrders[index]["discount"],
                                              recentOrders[index]["grandTotal"],
                                              recentOrders[index]["items"])
                                          : const Text(
                                              "See More Details...",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Colors.blue),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ));
  }

  Widget getMoreDetails(subTotal, discount,double grandTotal, List itemList) {
    List<Widget> columnDisplayList = <Widget>[
      const Text(
        "Ordered Items",
        style: TextStyle(fontSize: 25),
      )
    ];

    columnDisplayList.addAll(itemList
        .map((item) => Row(
              children: [
                Text(
                  item["itemName"],
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "\$${item["itemPrice"]}",
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                )
              ],
            ))
        .toList());
    columnDisplayList.addAll([
      const SizedBox(
        height: 10,
      ),
      Divider(
        height: 0,
        indent: 1,
        endIndent: 1,
        color: Colors.grey.shade800,
      ),
      Container(
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            const Text(
              "Sub Total",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Expanded(child: Container()),
            Text("\$${subTotal}",
                style: const TextStyle(fontSize: 16, color: Colors.black))
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          children: [
            const Text(
              "Discount",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Expanded(child: Container()),
            Text("- \$${discount}",
                style: const TextStyle(fontSize: 16, color: Colors.black))
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
        margin: const EdgeInsets.only(top: 7),
        child: Row(
          children: [
            const Text(
              "Grand Total",
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
            Expanded(child: Container()),
            Text("\$${grandTotal.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 20, color: Colors.red))
          ],
        ),
      ),
    ]);
    return Container(
      child: Column(children: columnDisplayList),
    );
  }

  Widget rowTextCreator(
      {required String title,
      required String value,
      double titleSize = 17,
      double sepSize = 20,
      double valueSize = 17}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleSize,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          " : ",
          style: TextStyle(
              fontSize: sepSize,
              color: Colors.green,
              fontWeight: FontWeight.w600),
        ),
        Text(
          value,
          style:
              TextStyle(fontSize: valueSize, color: Colors.deepOrange.shade800),
        ),
      ],
    );
  }
}
