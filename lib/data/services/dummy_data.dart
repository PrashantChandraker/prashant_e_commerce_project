import 'package:prashant_e_commerce_project/features/shop/models/category_model.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';

import '../../features/shop/models/banner_model.dart';
import '../../routes/routes.dart';

class DummyData {
  // Banners

  static final List<BannerModel> banners = [
    BannerModel(
      targetScreen: TRoutes.favourites,
      active: true,
      imageUrl: TImages.nikelogo3,
    ),
    BannerModel(
      targetScreen: TRoutes.checkout,
      active: true,
      imageUrl: TImages.tshirtBanner,
    ),
    BannerModel(
      targetScreen: TRoutes.cart,
      active: true,
      imageUrl: TImages.successlogo,
    ),
  ];

  // List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sporticon, isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Furniture',
        image: TImages.furnitureicon,
        isFeatured: true),
    CategoryModel(
        id: '3',
        name: 'Electronics',
        image: TImages.electronicsicon,
        isFeatured: true),
    CategoryModel(
        id: '4', name: 'Clothes', image: TImages.clothicon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Cosmetics',
        image: TImages.cosmeticsicon,
        isFeatured: true),
  ];

  //  // User
  // static final UserModel user = UserModel(
  //   firstname: 'Prashant',
  //   lastname: 'chandraker',
  //   email: 'prashantchandraker1@gmail.com',
  //   phoneNumber: '8827530290',
  //   ProfilePicture: TImages.demouser,
  //   addressess:[
  //     AddressModel(
  //       id: '1',
  //       name:'Prashant Chandraker',
  //       PhoneNumber: '8827530290',
  //       city: 'vengal rao nagar',
  //       state: 'Telangana',
  //     ),

  //     AddressModel(
  //       id: '2',
  //       name:'Gopal Chandraker',
  //       PhoneNumber: '8827530290',
  //       city: 'vengal rao nagar',
  //       state: 'Telangana',
  //     ),
  //   ]
  // );

  //  //cart
  // static final CartModel cart =  CartModel(
  //   cartId: '001',
  //   items: [
  //     CartItemModel(
  //       productId: '001',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandname: products[0].brand!.name,
  //       price: products[0].productVariations![0].attributeValues,
  //    ),
  //    CartItemModel(
  //       productId: '002',
  //       variationId: '2',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandname: products[0].brand!.name,
  //       price: products[0].productVariations![0].attributeValues,
  //    ),
  //   ]
  // );

  //  // Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id:'CWT0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2023, 09, 1),
  //     deliveryDate: DateTime(2023, 09, 9),
  //   ),
  //    OrderModel(
  //     id:'CWT0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2023, 09, 1),
  //     deliveryDate: DateTime(2023, 09, 9),
  //   ),
  // ];

  //Banner images
  // static final List<BannerModel> HomeBanner = [
  //   BannerModel(targetScreen: TRoutes.order, name : 'tShirt',imageUrl: TImages.tshirtBanner, active: false),
  //   BannerModel(id: '2', name : 'tShirt2', imageUrl: TImages.tshirtBanner, isFeatured: true)
  // ];
}
