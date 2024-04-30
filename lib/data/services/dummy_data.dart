import 'package:prashant_e_commerce_project/features/shop/models/category_model.dart';
import 'package:prashant_e_commerce_project/utils/constants/image.strings.dart';

import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';
import '../../routes/routes.dart';

class DummyData {
  // Banners

  static final List<BannerModel> banners = [
    BannerModel(
      targetScreen: TRoutes.prashant,
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

  //List of all products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike Sports Shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.nikelogo3,
        description: 'Nike ',
        brand: BrandModel(
            id: '1',
            image: TImages.nikepants,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.8,
              image: TImages.facebook,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.single'),



            ProductModel(
        id: '002',
        title: 'Green Nike Sports Shoe',
        stock: 15,
        price: 50,
        isFeatured: true,
        thumbnail: TImages.nikeshoe2,
        description: 'Green shirt',
        brand: BrandModel(
            id: '1',
            image: TImages.shoeimage1,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        salePrice: 70,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.8,
              image: TImages.facebook,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
               ProductVariationModel(
              id: '2',
              stock: 34,
              price: 134,
              salePrice: 122.8,
              image: TImages.facebook,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
              
        ],
        productType: 'ProductType.single'),




            ProductModel(
        id: '003',
        title: 'Green Nike Sports Shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.shirt_1,
        description: 'Loose tshirt Brand',
        brand: BrandModel(
            id: '1',
            image: TImages.shoeimage1,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        salePrice: 100,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.8,
              image: TImages.facebook,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.single'),



  ProductModel(
        id: '004',
        title: 'Green Nike Sports Shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.mobilelogo,
        description: 'Loose tshirt Brand',
        brand: BrandModel(
            id: '1',
            image: TImages.shoeimage1,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        salePrice: 100,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.8,
              image: TImages.facebook,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.single'),






        //     ProductModel(
        // id: '004',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),





        //     ProductModel(
        // id: '005',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),



        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),





        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),





        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),




        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),




        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),





        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),




        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),




        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),



        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),





        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),





        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),





        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),






        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),







        //     ProductModel(
        // id: '001',
        // title: 'Green Nike Sports Shoe',
        // stock: 15,
        // price: 135,
        // isFeatured: true,
        // thumbnail: TImages.nikeshoe2,
        // description: 'Green Nike sports Shoe',
        // brand: BrandModel(
        //     id: '1',
        //     image: TImages.shoeimage1,
        //     name: 'Nike',
        //     productsCount: 265,
        //     isFeatured: true),
        // images: [TImages.sporticon, TImages.mobilelogo, TImages.successlogo],
        // salePrice: 30,
        // sku: 'ABR4568',
        // categoryId: '1',
        // productAttributes: [
        //   ProductAttributeModel(
        //       name: 'Color', values: ['Green', 'Black', 'Red']),
        //   ProductAttributeModel(
        //       name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        // ],
        // productVariations: [
        //   ProductVariationModel(
        //       id: '1',
        //       stock: 34,
        //       price: 134,
        //       salePrice: 122.8,
        //       image: TImages.facebook,
        //       description:
        //           'This is a product description for Green Nike Sport Shoe',
        //       attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ],
        // productType: 'ProductType.single'),
  ];
}
