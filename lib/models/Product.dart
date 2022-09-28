import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? productName;
  final String? productDescription;
  final num? regularPrice;
  final num? discountPrice;
  final String? category;
  final String? mainCategory;
  final String? subCategory;
  final Timestamp? discountDateSchedule;
  final int? skuNumber;
  final bool? manageInventory;
  final bool? chargeShipping;
  final int? shippingCharge;
  final String? brandName;
  final int? stockOnHand;
  final int? reorderLevel;
  final List? sizeList;
  final String? otherDetails;
  final String? selectedUnit;
  final List? imageUrls;
  final bool? approved;
  final bool? isRecommended;
  final bool? isPopular;


  final Map? seller;
  final String? productId;

  const Product({
    this.productName,
    this.productDescription,
    this.regularPrice,
    this.discountPrice,
    this.category,
    this.mainCategory,
    this.subCategory,
    this.discountDateSchedule,
    this.skuNumber,
    this.manageInventory,
    this.chargeShipping,
    this.shippingCharge,
    this.brandName,
    this.stockOnHand,
    this.reorderLevel,
    this.sizeList,
    this.otherDetails,
    this.selectedUnit,
    this.imageUrls,
    this.seller,
    this.approved,
    this.productId,
    this.isRecommended,
    this.isPopular,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [brandName, category, imageUrls,productName, regularPrice ,isPopular, isRecommended];

  static Product fromSnapshot(DocumentSnapshot snap){
    Product product = Product (category: snap['category'], isPopular: snap['isPopular'], brandName: snap['brandName'], isRecommended: snap['isRecommended'], imageUrls: snap['imageUrls'], regularPrice: snap['regularPrice'] , productName: snap['productName']);
    return product;
  }
//
//   static List<Product> products = [
//     const Product(
//         name: 'product1',
//         category: 'category1',
//         price: 3.00,
//         imageUrl:
//             'https://images.unsplash.com/photo-1540574163026-643ea20ade25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         isRecommended: true,
//         isPopular: false),
//     const Product(
//         name: 'product2',
//         category: 'category2',
//         price: 3.00,
//         imageUrl:
//             'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         isRecommended: true,
//         isPopular: false),
//     const Product(
//         name: 'product3',
//         category: 'category3',
//         price: 3.00,
//         imageUrl:
//             'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         isRecommended: true,
//         isPopular: false),
//     const Product(
//         name: 'product4',
//         category: 'category4',
//         price: 3.00,
//         imageUrl:
//             'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         isRecommended: false,
//         isPopular: true),
//     const Product(
//         name: 'product5',
//         category: 'category5',
//         price: 3.00,
//         imageUrl:
//             'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         isRecommended: false,
//         isPopular: true),
//     const Product(
//         name: 'product5',
//         category: 'category5',
//         price: 3.00,
//         imageUrl:
//             'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         isRecommended: false,
//         isPopular: true),
//     const Product(
//         name: 'product5',
//         category: 'category5',
//         price: 3.00,
//         imageUrl:
//             'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         isRecommended: false,
//         isPopular: true),
//     const Product(
//         name: 'product5',
//         category: 'category5',
//         price: 3.00,
//         imageUrl:
//             'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//         isRecommended: false,
//         isPopular: true),
//   ];
}