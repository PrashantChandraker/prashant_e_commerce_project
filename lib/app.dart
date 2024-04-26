import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prashant_e_commerce_project/bindings/genral_bindings.dart';
import 'package:prashant_e_commerce_project/routes/app_routes.dart';
import 'package:prashant_e_commerce_project/utils/theme/theme.dart';

import 'utils/constants/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.LightTheme, // lighttheme
      darkTheme: TAppTheme.DarkTheme, //darktheme
      initialBinding: GenralBindings(),

      getPages:AppRoutes.pages,

      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
