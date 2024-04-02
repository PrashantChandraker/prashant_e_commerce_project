import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:prashant_e_commerce_project/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.LightTheme, // lighttheme
        darkTheme: TAppTheme.DarkTheme, //darktheme
        home: OnBoardScreen(),
        );
  }
}