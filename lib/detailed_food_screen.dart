import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodix/all_list.dart';

class DetailedFood extends StatefulWidget {
  final Map<String,dynamic>? item;
  const DetailedFood({super.key,  this.item});

  @override
  State<DetailedFood> createState() => _DetailedFoodState();
}

class _DetailedFoodState extends State<DetailedFood> {
  Map<String,dynamic>? currentItem;
  @override
  Widget build(BuildContext context) {
    currentItem ??= widget.item;
    bool isFavourite = favouriteFoodItems.contains(currentItem);
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height-70,
            maxHeight: 747  //770+(390/150)*30
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image(
                    width: MediaQuery.of(context).size.width,
                    image: const AssetImage("assets/images/Detailed_Food/Burger.jpg"),
                  ),
                  Row(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 45, left: 20, right: 20),
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        alignment: Alignment.center,
                        child: InkWell(
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
                          child: const Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 45, left: 20, right: 20),
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if(isFavourite){
                                favouriteFoodItems.remove(currentItem);
                              }
                              else{
                                favouriteFoodItems.add(currentItem!);
                              }
                              isFavourite = !(isFavourite);
                            });
                          },
                          child: Icon(
                            FontAwesomeIcons.solidHeart,
                            color: (isFavourite) ? Colors.red : Colors.white,
                            size: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${currentItem!["name"]}",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 7),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              // height: 12,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.timer_sharp,
                                    size: 15,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "${currentItem!["timeToMake"]} Min",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              // height: 12,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.local_fire_department_sharp,
                                    size: 15,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "${currentItem!["calories"]}kal",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              // height: 12,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star_purple500_sharp,
                                    size: 15,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "${currentItem!["rating"]} (1.8k Review)",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 10,),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 7),
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                            "${currentItem!["detailedDescription"]}",
                            maxLines: 5,
                            style: const TextStyle(color: Colors.grey)),

                      ),
                      const Text(
                        "Ingredients",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          minHeight: 35.0,
                          maxHeight: 55.0,
                        ),
                        // decoration: BoxDecoration(
                        //   border: Border.all(width: 1)
                        // ),
                        child: ListView.builder(
                            padding: const EdgeInsets.only(left: 0),
                            shrinkWrap: true,
                            itemCount: currentItem?["ingredients"].length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Fluttertoast.showToast(
                                        msg: ingredient[index]);
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                      "assets/images/Ingredient/${currentItem?["ingredients"][index]}.png",
                                    ),
                                    radius: 25,
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () {
            if(!cartFoodItems.contains(currentItem)){
              setState(() {
                cartFoodItems.add(currentItem!);
                cartFoodItems.last["quantity"] = 1;
              });
            }else{
              Fluttertoast.showToast(msg: "Item Already in Cart");
            }
          },
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Text(
                "Add Item \$3.60",
                style: TextStyle(fontSize: 20),
              )),
        ),
      ),
    );
  }
}