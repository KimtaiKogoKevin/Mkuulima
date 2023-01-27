import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../firebase_services.dart';

class ProductDeprecated {
  ProductDeprecated({this.productName, this.productDescription, this.regularPrice, this.discountPrice, this.category, this.mainCategory, required this.subCategory, this.discountDateSchedule, this.skuNumber, this.manageInventory, this.chargeShipping, this.shippingCharge, this.brandName, this.stockOnHand, this.reorderLevel, this.sizeList, this.otherDetails, this.selectedUnit, required this.imageUrls, this.approved, this.isRecommended, this.isPopular, this.seller, this.productId});


  ProductDeprecated.fromJson(Map<String, Object?> json)
      : this(
          productName: json['productName']! as String,
          productDescription: json['productDescription']! as String,
          regularPrice: json['regularPrice']! as num,
          discountPrice: json['discountPrice'] as num,
          category: json['category']! as String,
          mainCategory: json['mainCategory']! as String,
          subCategory: json['subCategory']! as String,
          discountDateSchedule: json['discountDateSchedule']! as Timestamp,
          skuNumber: json['skuNumber'] as int,
          manageInventory: json['manageInventory']! as bool,
          chargeShipping: json['chargeShipping']! as bool,
          shippingCharge: json['shippingCharge']! as int,
          brandName: json['brandName']! as String,
          stockOnHand: json['stockOnHand']! as int,
         // reOrderLevel: json['reorderLevel']! as int,
         // sizeList: json['sizeList'] as List,
          otherDetails: json['otherDetails']! as String,
          selectedUnit: json['selectedUnit']! as String,
          imageUrls: json['imageUrls']! as List,
          isRecommended: json['isRecommended']! as bool,
          isPopular: json['isPopular']! as bool,
          seller: json['seller']! as Map,
          //productId: json['productId'] as String,
        );
  final String? productName;
  final String? productDescription;
  final num? regularPrice;
  final num? discountPrice;
  final String? category;
  final String? mainCategory;
  final String subCategory;
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
  final List imageUrls;
  final bool? approved;
  final bool? isRecommended;
  final bool? isPopular;

  final Map? seller;
  final String? productId;

  Map<String, Object?> toJson() {
    return {
      'productName': productName,
      'productDescription': productDescription,
      'regularPrice': regularPrice,
      'dicountPrice': discountPrice,
      'category': category,
      'mainCategory': mainCategory,
      'subCategory': subCategory,
      'discountDateSchedule': discountDateSchedule,
      'skuNumber': skuNumber,
      'manageInventory': manageInventory,
      'chargeShipping': chargeShipping,
      'brandName': brandName,
      'stockOnHand': stockOnHand,
      'reorderLevel': reorderLevel,
     // 'sizeList': sizeList,
      'otherDetails': otherDetails,
      'selectedUnit': selectedUnit,
      'imageUrls': imageUrls,
      'seller': seller,
      'approved': approved,
      //'productId': productId,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
    };
  }
}

FirebaseService _service = FirebaseService();

productWithSubCatCollection(productSubCatSelected) {
  return _service.Products.where('approved', isEqualTo: true)
      .where('subCategory', isEqualTo: productSubCatSelected)
      .withConverter<ProductDeprecated>(
        fromFirestore: (snapshot, _) =>
            ProductDeprecated.fromJson(snapshot.data()!),
        toFirestore: (products, _) => products.toJson(),
      );
}
