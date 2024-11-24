import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodix/detailed_food_screen.dart';
import 'package:foodix/all_list.dart';


class CategoryItems extends StatefulWidget {
  final String categoryName;
  final List<Map<String,dynamic>> categoryFoodItems;
  const CategoryItems({super.key, required this.categoryName, required this.categoryFoodItems});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery
        .of(context)
        .size
        .height;
    bool isPortrait =
        MediaQuery
            .of(context)
            .orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          "${widget.categoryName} Items",
          style: const TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: isPortrait
              ? (maxHeight *
              (widget.categoryFoodItems.length % 2 == 0
                  ? (widget.categoryFoodItems.length ~/ 2)
                  : (widget.categoryFoodItems.length ~/ 2 + 1)) *
                  0.38)+15
              : (maxHeight *
              (widget.categoryFoodItems.length % 4 == 0
                  ? (widget.categoryFoodItems.length ~/ 4)
                  : (widget.categoryFoodItems.length ~/ 4 + 1)) *
                  0.889),

          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 0),
            itemCount: widget.categoryFoodItems.length,
            gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: isPortrait
                    ? (maxHeight * 0.00069) //0.00075
                    : (maxHeight * 0.001627)),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: ()  {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailedFood(item: widget.categoryFoodItems[index],)));
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
                                height: isPortrait? 150:165,
                                width: isPortrait? 150:165,
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
                                    "${widget.categoryFoodItems[index]["rating"]}",
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
                          "${widget.categoryFoodItems[index]["subName"]}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          "${widget.categoryFoodItems[index]["name"]}",
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
                              "${widget.categoryFoodItems[index]["shortDescription"]}",
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
                              "${widget.categoryFoodItems[index]["price"]}",
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
                                if(!cartFoodItems.contains(widget.categoryFoodItems[index])){
                                  cartFoodItems.add(widget.categoryFoodItems[index]);
                                  cartFoodItems.last["quantity"] = 1;
                                }else{
                                  Fluttertoast.showToast(msg: "Item Already in Cart");
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
        ),
      ),
    );
  }
}
