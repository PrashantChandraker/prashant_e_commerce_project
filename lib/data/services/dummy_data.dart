import 'package:prashant_e_commerce_project/features/shop/models/brand_category_model.dart';
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


        // sub categories
         CategoryModel(
        id: '6',
        name: 'Suraj',
        image: TImages.successlogo,
        isFeatured: true,
         parentId: "1",
        ),

           CategoryModel(
        id: '7',
        name: 'sidhhi',
        image: TImages.successlogo,
        isFeatured: true,
         parentId: "1",
        ),

           CategoryModel(
        id: '8',
        name: 'rashmi',
        image: TImages.successlogo,
        isFeatured: true,
         parentId: "1",
        ),

           CategoryModel(
        id: '9',
        name: 'pashant',
        image: TImages.successlogo,
        isFeatured: true,
         parentId: "1",
        ),

        CategoryModel(
        id: '10',
        name: 'sai',
        image: TImages.successlogo,
        isFeatured: true,
         parentId: "1",
        ),



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




// List of all brands
  static final List <BrandModel> brands=[
    BrandModel(id: 'Addidas', image: TImages.addidasLogo, name: 'Addidas', productsCount: 11,isFeatured: true),
     BrandModel(id: 'Jordon', image: TImages.jordonLogo, name: 'Jordon', productsCount: 14,isFeatured: true),
      BrandModel(id: 'Nike', image: TImages.nikeLogo, name: 'Nike', productsCount: 31,isFeatured: true),
       BrandModel(id: 'Puma', image: TImages.pumaLogo, name: 'Puma', productsCount: 19,isFeatured: true),
        //  BrandModel(id: '5', image: TImages.shoeBrandtttt, name: 'Snikker', productsCount: 11,isFeatured: true),


  ];










  //List of all products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Nike Sports Shoe',
        stock: 15,
        price: 1000,
        isFeatured: true,
        thumbnail: TImages.nikewhite,
        
        description: 'Nike shoes',
        brand: BrandModel(
            id: 'Nike',
            image: TImages.nikesmalllogo, //brandimage
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        // images: [
        //   TImages.nikered,
        //   TImages.nikeblack,
        //   TImages.nikeblue,
        //   TImages.nikegreen,
        //   TImages.niketeal,
        //   TImages.nikewhite
        // ],
        salePrice: 400,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Red', 'Blue', 'Black', 'Green', 'Indigo', 'White']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 200,
              salePrice: 175,
              image: TImages.nikered,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '2',
              stock: 34,
              price: 350,
              salePrice: 300,
              image: TImages.nikeblack,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 34,
              price: 400,
              salePrice: 350,
              image: TImages.nikeblue,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
               ProductVariationModel(
              id: '4',
              stock: 34,
              price: 650,
              salePrice: 450,
              image: TImages.nikegreen,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 30'}),
               ProductVariationModel(
              id: '5',
              stock: 34,
              price: 700,
              salePrice: 500,
              image: TImages.niketeal,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Indigo', 'Size': 'EU 32'}),
              
        ],
        productType: 'ProductType.variable'),







    ProductModel(
        id: '002',
        title: 'Green Jordon Sports Shoe',
        stock: 15,
        price: 100,
        isFeatured: true,
        thumbnail: TImages.JordonBlack,
        description: 'Jordon Soes',
        brand: BrandModel(
            id: 'Jordon',
            image: TImages.JordonBlack,
            name: 'Jordon',
            productsCount: 265,
            isFeatured: true),
        images: [TImages.JordonGrey, TImages.JordonRed, TImages.JordonWhite],
        salePrice: 50,
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
              image: TImages.JordonBlack,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          
        ],
        productType: 'ProductType.single'),




    ProductModel(
        id: '003',
        title: 'Puma Sports Shoe',
        stock: 15,
        price: 800,
        isFeatured: true,
        thumbnail: TImages.PumaBlue,
        description: 'Loose tshirt Brand',
        brand: BrandModel(
            id: 'Puma',
            image: TImages.PumaBlue,
            name: 'Puma',
            productsCount: 265,
            isFeatured: true),
        images: [TImages.Pumagreen, TImages.PumaBrown, TImages.Pumawhite],
        salePrice: 650,
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
        title: 'Addidas shoes',
        stock: 15,
        price: 1500,
        isFeatured: true,
        thumbnail: TImages.addidasgrey,
        description: 'Addidas shoe',
        brand: BrandModel(
            id: 'Addidas',
            image: TImages.addidasblack,
            name: 'Addidas',
            productsCount: 265,
            isFeatured: true),
        images: [TImages.addidasblue, TImages.addidasred, TImages.addidasgrey],
        salePrice: 1200,
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
    id: '005',
    title: 'Green Nike Sports Shoe',
    stock: 15,
    price: 135,
    isFeatured: true,
    thumbnail: TImages.nikeshoe2,
    description: 'Green Nike sports Shoe',
    brand: BrandModel(
        id: 'Addidas',
        image: TImages.shoeimage1,
        name: 'Addidas',
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
    id: '006',
    title: 'Green Nike Sports ',
    stock: 15,
    price: 135,
    isFeatured: true,
    thumbnail: TImages.nikeshoe2,
    description: 'Green Nike sports Shoe',
    brand: BrandModel(
        id: '1',
        image: TImages.shoeimage1,
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
    id: '007',
    title: 'Green Nike ',
    stock: 15,
    price: 135,
    isFeatured: true,
    thumbnail: TImages.nikeshoe2,
    description: 'Green Nike sports Shoe',
    brand: BrandModel(
        id: '1',
        image: TImages.shoeimage1,
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
    id: '008',
    title: ' Nike ',
    stock: 15,
    price: 135,
    isFeatured: true,
    thumbnail: TImages.nikeshoe2,
    description: 'Green Nike sports Shoe',
    brand: BrandModel(
        id: '1',
        image: TImages.shoeimage1,
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

  // list of all brand categories
  static final List<BrandCategoryModel> brandCategory =[

    BrandCategoryModel(brandId: '1', categoryId: '1'),
     BrandCategoryModel(brandId: '2', categoryId: '1'),
      BrandCategoryModel(brandId: '3', categoryId: '2'),
       BrandCategoryModel(brandId: '1', categoryId: '1'),
        BrandCategoryModel(brandId: '1', categoryId: '1'),
         BrandCategoryModel(brandId: '1', categoryId: '1'),

  ];
}
