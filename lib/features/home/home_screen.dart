// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

import 'package:starbucks_clone/common/color/app_color.dart';
import 'package:starbucks_clone/common/images/app_images.dart';

class StarbucksMenuScreen extends StatefulWidget {
  const StarbucksMenuScreen({super.key});

  @override
  State<StarbucksMenuScreen> createState() => _StarbucksMenuScreenState();
}

class _StarbucksMenuScreenState extends State<StarbucksMenuScreen> {
  List<ModelClass> coffeeList = [
    ModelClass(
      image: AppImages.coffee4,
      name: 'Caramel Frappuccino',
      quantity: "120ml",
      liked: false,
    ),
    ModelClass(
      image: AppImages.coffee2,
      name: 'Latte',
      quantity: "180ml",
      liked: false,
    ),
    ModelClass(
      image: AppImages.coffee6,
      name: 'Espresso',
      quantity: "60ml",
      liked: false,
    ),
    ModelClass(
      image: AppImages.coffee7,
      name: 'Cappuccino',
      quantity: "150ml",
      liked: false,
    ),
    ModelClass(
      image: AppImages.coffee5,
      name: 'Mocha',
      quantity: "200ml",
      liked: false,
    ),
    ModelClass(
      image: AppImages.coffee3,
      name: 'Americano',
      quantity: "120ml",
      liked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: AppColor.primarygreen,
              height: MediaQuery.paddingOf(context).top,
            ),
          ),
          Positioned(
              top: MediaQuery.paddingOf(context).top,
              left: 0,
              right: 0,
              child: _buildAppBar()),
          Positioned(top: 160, left: 0, right: 0, child: _buildSearchBar()),
          Positioned(top: 240, left: 0, right: 0, child: _buildNewMenu()),
          Positioned(
            bottom: 300,
            left: 0,
            right: 0,
            child: _buildSectionHeader('Special for you', 'View All'),
          ),
          const Positioned(
              bottom: -300,
              left: -15,
              right: -100,
              // child: _buildSpecialForYou(context)),
              child: CoffeeSelector()),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.primarygreen,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -10,
            top: 10,
            child: Container(
              width: 100,
              height: 100,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/icons/img.jpg"),
                ),
              ),
            ),
          ),
          const Positioned(
            right: 20,
            top: 40,
            child: Row(
              children: [
                Icon(IconlyBroken.search, color: Colors.white, size: 28),
                SizedBox(width: 20),
                Icon(IconlyBroken.more_circle, color: Colors.white, size: 28),
                SizedBox(width: 20),
                Icon(IconlyBroken.notification, color: Colors.white, size: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Row(
        children: [
          Icon(IconlyLight.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: Text('Search here...',
                style: TextStyle(color: Colors.grey, fontSize: 16)),
          ),
          // const Spacer(),
          // SizedBox(
          //   height: 80,
          //   width: 60,
          //   child: GifView.asset(
          //     "assets/icons/coffee.gif",
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildNewMenu() {
    List<ModelClass> coffeeList = [
      ModelClass(
        image: AppImages.coffee4,
        name: 'Caramel Frappuccino',
        quantity: "120ml",
        liked: false,
      ),
      ModelClass(
        image: AppImages.coffee2,
        name: 'Latte',
        quantity: "180ml",
        liked: false,
      ),
      ModelClass(
        image: AppImages.coffee6,
        name: 'Espresso',
        quantity: "60ml",
        liked: false,
      ),
      ModelClass(
        image: AppImages.coffee7,
        name: 'Cappuccino',
        quantity: "150ml",
        liked: false,
      ),
      ModelClass(
        image: AppImages.coffee5,
        name: 'Mocha',
        quantity: "200ml",
        liked: false,
      ),
      ModelClass(
        image: AppImages.coffee3,
        name: 'Americano',
        quantity: "120ml",
        liked: false,
      ),
    ];
    return Column(
      children: [
        _buildSectionHeader('New Menu', 'View All'),
        SizedBox(
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: coffeeList.length,
            itemBuilder: (context, index) {
              bool flag = index % 2 == 0;
              return _buildMenuItem(
                  coffeeList[index].name, 29.00, flag, coffeeList[index].image);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialForYou(BuildContext context) {
    int i = 0;
    List<ModelClass> coffeeList = [
      ModelClass(
        image: AppImages.coffee4,
        name: 'Caramel Frappuccino',
        quantity: "120ml",
        liked: false,
      ),
      ModelClass(
        image: AppImages.coffee2,
        name: 'Latte',
        quantity: "180ml",
        liked: false,
      ),
      ModelClass(
        image: AppImages.coffee6,
        name: 'Espresso',
        quantity: "60ml",
        liked: false,
      ),
      ModelClass(
        image: AppImages.coffee7,
        name: 'Cappuccino',
        quantity: "150ml",
        liked: false,
      ),
      ModelClass(
        image: AppImages.coffee5,
        name: 'Mocha',
        quantity: "200ml",
        liked: false,
      ),
      ModelClass(
        image: AppImages.coffee3,
        name: 'Americano',
        quantity: "120ml",
        liked: false,
      ),
    ];
    return SizedBox(
      height: 700,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 700,
              width: 700,
              decoration: BoxDecoration(
                color: AppColor.primarygreen,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 40,
            right: 0,
            child: SizedBox(
              height: 580,
              child: CircleList(
                  origin: const Offset(0, 0),
                  children: List.generate(
                    coffeeList.length,
                    (i) {
                      setState(() {
                        i = i;
                      });
                      return SizedBox(
                          height: 120,
                          width: 120,
                          child: Flutter3DViewer(src: coffeeList[i].image));
                    },
                  )),
            ),
          ),
          Positioned(
              top: 260,
              left: 150,
              right: 180,
              child: Container(
                height: 50,
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.black.withOpacity(0.3),
                  //       blurStyle: BlurStyle.outer,
                  //       blurRadius: 10,
                  //       spreadRadius: 1)
                  // ],
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 80,
                    width: 290,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          coffeeList[i].name,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                coffeeList[i].quantity,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Text(
                                "120ml",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 320,
              left: 150,
              right: 180,
              child: Container(
                height: 60,
                width: 40,
                decoration: BoxDecoration(
                  // color: AppColor.black.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.primarygreen.withOpacity(0.3),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10,
                        spreadRadius: 1)
                  ],
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 70,
                    width: 280,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Text(
                        "Add to cart",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                // child: Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Add To Order",
                //       style: GoogleFonts.urbanist(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.bold,
                //               letterSpacing: 2,
                //               color: Colors.white,
                //               fontSize: 26)),
                //     ),
                //     // const SizedBox(
                //     //   width: 10,
                //     // ),
                //     // SizedBox(
                //     //     height: 50,
                //     //     child: Image.asset("assets/icons/Coffee_Icon.png"))
                //   ],
                // ),
              )),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(action,
              style: TextStyle(
                  color: AppColor.primarygreen, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String name, double price, bool isLiked, String img) {
    return Container(
      width: 200,
      height: 250,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 180,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 40,
                      offset: const Offset(10, 30),
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 1,
                    )
                  ],
                  color: Colors.white),
              margin: const EdgeInsets.only(top: 10),
              child: Flutter3DViewer(
                src: img,
                progressBarColor: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: Icon(
              isLiked ? Iconsax.heart5 : IconlyLight.heart,
              color: isLiked ? Colors.red : Colors.grey,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16)),
                  ),
                  Text('\$${price.toStringAsFixed(2)}',
                      style: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.primarygreen,
                              fontSize: 22))),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      // width: 60,
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 3, bottom: 3),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10,
                                spreadRadius: 0.5)
                          ],
                          borderRadius: BorderRadius.circular(12)),
                      child:
                          const Icon(Icons.add, color: Colors.white, size: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ModelClass {
  String image;
  String name;
  String quantity;
  bool liked;
  ModelClass({
    required this.image,
    required this.name,
    required this.quantity,
    required this.liked,
  });
}

class CoffeeSelector extends StatefulWidget {
  const CoffeeSelector({super.key});

  @override
  _CoffeeSelectorState createState() => _CoffeeSelectorState();
}

class _CoffeeSelectorState extends State<CoffeeSelector> {
  int selectedIndex = 0;

  List<ModelClass> coffeeList = [
    ModelClass(
      image: AppImages.coffee4,
      name: 'Caramel Frappuccino',
      quantity: "120ml",
      liked: false,
    ),
    ModelClass(
      image: AppImages.coffee2,
      name: 'Latte',
      quantity: "180ml",
      liked: false,
    ),
    ModelClass(
      image: AppImages.coffee6,
      name: 'Espresso',
      quantity: "60ml",
      liked: false,
    ),
    ModelClass(
      image: AppImages.coffee7,
      name: 'Cappuccino',
      quantity: "150ml",
      liked: false,
    ),
    ModelClass(
      image: AppImages.coffee5,
      name: 'Mocha',
      quantity: "200ml",
      liked: false,
    ),
    ModelClass(
      image: AppImages.coffee3,
      name: 'Americano',
      quantity: "120ml",
      liked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 700,
              width: 700,
              decoration: BoxDecoration(
                color: AppColor.primarygreen,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 40,
            right: 0,
            child: SizedBox(
              height: 580,
              child: CircleList(
                showInitialAnimation: true,
                rotateMode: RotateMode.onlyChildrenRotate,
                origin: const Offset(0, 0),
                children: List.generate(
                  coffeeList.length,
                  (index) {
                    return SizedBox(
                      height: 130,
                      width: 130,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 20,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.2),
                                        blurRadius: 30,
                                        spreadRadius: 2,
                                      )
                                    ]),
                              )),
                          Positioned.fill(
                              child: Flutter3DViewer(
                                  src: coffeeList[index].image)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 150,
            right: 180,
            child: Container(
              height: 50,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Container(
                height: 80,
                width: 290,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      coffeeList[selectedIndex].name,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            coffeeList[selectedIndex].quantity,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "120ml",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 320,
            left: 150,
            right: 180,
            child: Container(
              height: 60,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primarygreen.withOpacity(0.3),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  // Handle add to cart action
                },
                child: Container(
                  height: 70,
                  width: 280,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
