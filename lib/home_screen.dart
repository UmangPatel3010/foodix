import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodix/category_item_screen.dart';
import 'package:foodix/detailed_food_screen.dart';
import 'package:foodix/all_list.dart';

import 'all_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> mostPopularItems = foodItems.where((
        element) => element["rating"] >= 4.5).toList();
    double maxHeight = MediaQuery
        .of(context)
        .size
        .height;
    bool isPortrait =
        MediaQuery
            .of(context)
            .orientation == Orientation.portrait;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
            ),
            Column(
              children: [
                Padding(
                    padding:
                    const EdgeInsets.only(left: 15, top: 40, right: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 34,
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              child: const Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/profile.jpg"),
                                    radius: 12,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Hi, Vansh",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 34,
                              decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.basketShopping,
                                    color: Colors.white,
                                    size: 17,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${cartFoodItems.length}",
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                // margin: const EdgeInsets.only(top: 15),
                                padding: const EdgeInsets.only(
                                    top: 2, bottom: 2, left: 5, right: 15),
                                height: 52,
                                width: 350,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(4, 5),
                                          blurRadius: 3)
                                    ]),
                                child: const TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    hintText: "Search for Something Tasty....",
                                    hintStyle: TextStyle(fontSize: 14),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 25,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(25)),
                          child: Image.asset(
                            "assets/images/offer.jpg",
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Food Category",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Expanded(child: Container()),
                            TextButton(
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.white),
                                    foregroundColor:
                                    MaterialStateProperty.all(
                                        Colors.orange),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.only(top: 3))),
                                onPressed: () {
                                  Fluttertoast.showToast(msg: "See More");
                                },
                                child: const Text(
                                  "See More",
                                  style: TextStyle(fontSize: 12),
                                ))
                          ],
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                      ],
                    )),
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 35.0,
                    maxHeight: 75.0,
                  ),
                  child: ListView.builder(
                      padding: const EdgeInsets.only(left: 15),
                      shrinkWrap: true,
                      itemCount: foodCategories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 7),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryItems(
                                              categoryName: foodCategories[index],
                                              categoryFoodItems: (foodCategories[index] ==
                                                  "All") ? foodItems : foodItems
                                                  .where((element) =>
                                              element["category"] ==
                                                  foodCategories[index])
                                                  .toList())));
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/images/Food_Categories/${foodCategories[index]}.png"),
                                  radius: 25,
                                ),
                                const SizedBox(height: 3),
                                Text(foodCategories[index]),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Most Popular Food",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Expanded(child: Container()),
                          TextButton(
                              style: ButtonStyle(
                                  overlayColor:
                                  MaterialStateProperty.all(Colors.white),
                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.orange),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.only(top: 3))),
                              onPressed: () {
                                Navigator
                                    .push(context, MaterialPageRoute(builder:
                                (context)=>
                                  CategoryItems(
                                      categoryName: foodCategories[0],
                                      categoryFoodItems: foodItems)
                                ));
                                Fluttertoast.showToast(msg: "See More"
                                );
                              },
                              child: const Text(
                                "See More",
                                style: TextStyle(fontSize: 12),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: isPortrait
                            ? (maxHeight *
                            ((mostPopularItems.length % 2 == 0
                                ? (mostPopularItems.length ~/ 2)
                                : (mostPopularItems.length ~/ 2 + 1)) *
                                0.3727) +
                            84)
                            : (maxHeight *
                            ((mostPopularItems.length % 4 == 0
                                ? (mostPopularItems.length ~/ 4)
                                : (mostPopularItems.length ~/ 4 + 1)) *
                                0.885) +
                            80),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          // controller: scrollController,
                          padding: const EdgeInsets.only(top: 0),
                          itemCount: mostPopularItems.length,
                          gridDelegate:
                          SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: isPortrait
                                  ? (maxHeight * 0.000686)//0.00072
                                  : (maxHeight * 0.00161)),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailedFood(
                                              item: mostPopularItems[index],
                                            )));
                              },
                              splashColor: Colors.transparent,
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            const BorderRadius.only(
                                                topLeft:
                                                Radius.circular(25),
                                                topRight:
                                                Radius.circular(25),
                                                bottomLeft:
                                                Radius.circular(25)),
                                            child: Image.asset(
                                              "assets/images/Food/Sandwich.jpg",
                                              height: isPortrait ? 145 : 163,
                                              width: isPortrait ? 145 : 163,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10, top: 7),
                                            height: 22,
                                            decoration: const BoxDecoration(
                                                color: Colors.black45,
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  width: 7,
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 13,
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  "${mostPopularItems[index]["rating"]}",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  width: 7,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${mostPopularItems[index]["subName"]}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      Text(
                                        "${mostPopularItems[index]["name"]}",
                                        // maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin:
                                          const EdgeInsets.only(right: 15),
                                          child: Text(
                                            "${mostPopularItems[index]["shortDescription"]}",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey.shade700,
                                            ),
                                            // maxLines: 2,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 1),
                                            child: const Text(
                                              "\$",
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            "${mostPopularItems[index]["price"]}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                                fontSize: 17),
                                          ),
                                          Expanded(child: Container()),
                                          InkWell(
                                            overlayColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                            child: const Icon(
                                              Icons.add_circle,
                                              color: Colors.orange,
                                              size: 30,
                                            ),
                                            onTap: () {
                                              if (!cartFoodItems.contains(
                                                  mostPopularItems[index])) {
                                                setState(() {
                                                  cartFoodItems
                                                      .add(
                                                      mostPopularItems[index]);
                                                  cartFoodItems
                                                      .last["quantity"] = 1;
                                                });
                                                Fluttertoast.showToast(
                                                    msg:
                                                    "Item Added to Cart");
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg:
                                                    "Item Already in Cart");
                                              }
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
