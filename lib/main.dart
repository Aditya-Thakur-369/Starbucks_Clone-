import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starbucks_clone/features/onboarding%20/onboard_screen.dart';

void main() {
  runApp(const MainApp());
}

// ** Instagram **
// flutterspirit ( Aditya Thakur )
// **

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardScreen(),
      ),
    );
  }
}
