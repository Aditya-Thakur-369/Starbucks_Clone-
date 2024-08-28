import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:starbucks_clone/common/color/app_color.dart';
import 'package:starbucks_clone/common/images/app_images.dart';
import 'package:starbucks_clone/features/home/home_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _imageController;
  late Animation<double> _imageAnimation;
  final PageController _pageController = PageController();
  double _currentPage = 0; // Store the current page index

  List<String> onboardList = [
    AppImages.onboard1,
    AppImages.onboard2,
    AppImages.onboard3,
    AppImages.onboard4,
    AppImages.onboard5,
    AppImages.onboard6,
    AppImages.onboard7,
    AppImages.onboard8,
    AppImages.onboard9,
  ];

  List<String> coffeeList = [
    AppImages.coffee4,
    AppImages.coffee2,
    AppImages.coffee6,
    AppImages.coffee7,
    AppImages.coffee5,
    AppImages.coffee3,
  ];
  late List<Widget> preRenderedModels;
  bool _modelsInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _imageController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _imageAnimation =
        Tween<double>(begin: 60.h, end: 100.h).animate(CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeInOut,
    ));

    preRenderedModels = [];

    // Listen to page changes
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0; // Update current page index
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _imageController.dispose();
    _pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeModels();
  }

  void _initializeModels() {
    if (!_modelsInitialized) {
      preRenderedModels = List.generate(coffeeList.length, (index) {
        return KeepAlive(
          keepAlive: true,
          child: SizedBox(
            height: 300.h,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Flutter3DViewer(
              src: coffeeList[index],
              progressBarColor: Colors.transparent,
            ),
          ),
        );
      });
      _modelsInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarygreen,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.paddingOf(context).top,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.appLogo,
              height: 80.h,
              width: 80.w,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          KeepAlive(
            keepAlive: true,
            child: SizedBox(
              height: 500.h,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: coffeeList.length,
                itemBuilder: (context, index) {
                  return transformAnimation(index, preRenderedModels[index]);
                },
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColor.white,
              dotColor: Colors.white.withOpacity(0.3),
              dotHeight: 8.0,
              dotWidth: 8.0,
              expansionFactor: 4,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: "Amazing Taste       ",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 44.sp,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "of coffee",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 44.sp,
                      fontWeight: FontWeight.bold),
                )
              ])),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const StarbucksMenuScreen(),
                  ));
            },
            child: Container(
              height: 70.h,
              width: 280.w,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(30.h))
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(30),
                  //     topRight: Radius.circular(30))
                  ),
              child: Center(
                child: Text(
                  "Get Started",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Transform transformAnimation(index, Widget modelWidget) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002) // Perspective
        ..rotateY((_currentPage - index) * 0.5), // Adjust rotation
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                        offset: Offset(0, _animation.value),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(70.w),
                          ),
                        ));
                  },
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _imageAnimation,
            builder: (BuildContext context, Widget? child) {
              return Positioned(
                top: _imageAnimation.value,
                left: MediaQuery.of(context).size.width * 0.15,
                child: modelWidget,
              );
            },
          ),
        ],
      ),
    );
  }
}
