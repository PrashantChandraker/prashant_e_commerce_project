
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:prashant_e_commerce_project/features/authentication/screens/signup/signup.dart';
import 'package:prashant_e_commerce_project/features/personalization/screens/settings/settings.dart';
import 'package:prashant_e_commerce_project/routes/routes.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/cart/cart.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/checkout/checkout.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/home/home.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/product_reviews/product_review.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/store/store.dart';
import 'package:prashant_e_commerce_project/features/shop/screens/wishlist/wishlist.dart';

import '../features/authentication/screens/Password_configuration/forgot_password.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/shop/screens/order/order_screen.dart';

class AppRoutes{
  static final pages = [

GetPage(name: TRoutes.home, page: () => const HomeScreen()),

GetPage(name: TRoutes.store, page: () => const StoreScreen()),

GetPage(name: TRoutes.prashant, page: () => const FavrouiteScreen()),

GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),

GetPage(name: TRoutes.productReviews, page: () => const ProductReviewScreen()),

GetPage(name: TRoutes.order, page: () => const TOrderScreen()),

GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),

GetPage(name: TRoutes.cart, page: () => const CartScreen()),

GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),

GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),

GetPage(name: TRoutes.signup, page: () => const Signup_Screen()),

 GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),

GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),

 GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),

GetPage(name: TRoutes.onBoarding, page: () => const OnBoardScreen()),

// Add more GetPage entries as needed
  ];
}