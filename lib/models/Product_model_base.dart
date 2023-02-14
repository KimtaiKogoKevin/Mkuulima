import 'package:cloud_firestore/cloud_firestore.dart';

class ProductBase {
  final String productName;
  final String? productDescription;
  final num regularPrice;
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

//final int? reorderLevel;
//final List? sizeList;
  final String? otherDetails;
  final String? selectedUnit;
  final List imageUrls;
  final bool? approved;
  final bool? isRecommended;
  final bool? isPopular;

  final Map? seller;
  final int? productId;


  ProductBase({
    required this.productName,
    this.productDescription,
    required this.regularPrice,
    this.discountPrice,
    this.category,
    this.mainCategory,
    required this.subCategory,
    this.discountDateSchedule,
    this.skuNumber,
    this.manageInventory,
    this.chargeShipping,
    this.shippingCharge,
    this.brandName,
    this.stockOnHand,
    this.otherDetails,
    this.selectedUnit,
    required this.imageUrls,
    this.approved,
    this.isRecommended,
    this.isPopular,
    this.seller,
    this.productId,
  });

  Map<String, dynamic> toMap() {
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
      //'reorderLevel': reorderLevel,
      // 'sizeList': sizeList,
      'otherDetails': otherDetails,
      'selectedUnit': selectedUnit,
      'imageUrls': imageUrls,
      'seller': seller,
      'approved': approved,
      'productId': productId,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
    };
  }

  ProductBase.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : productName = doc.data()!['productName'],
        approved = doc.data()!['approved'],
        productDescription = doc.data()!['productDescription'],
        regularPrice = doc.data()!['regularPrice'],
        discountPrice = doc.data()!['discountPrice'],
        category = doc.data()!['category'],
        mainCategory = doc.data()!['mainCategory'],
        subCategory = doc.data()!['subCategory'],
        discountDateSchedule = doc.data()!['discountDateSchedule'],
        skuNumber = doc.data()!['skuNumber'],
        manageInventory = doc.data()!['manageInventory'],
        chargeShipping = doc.data()!['chargeShipping'],
        shippingCharge = doc.data()!['shippingCharge'],
        brandName = doc.data()!['brandName'],
        stockOnHand = doc.data()!['stockOnHand'],
        //reOrderLevel: doc.data()!['reorderLevel'],
        //sizeList: json['sizeList'] as List,
        otherDetails = doc.data()!['otherDetails'],
        selectedUnit = doc.data()!['selectedUnit']!,
        imageUrls = doc.data()!['imageUrls'],
        isRecommended = doc.data()!['isRecommended'],
        isPopular = doc.data()!['isPopular'],
        seller = doc.data()!['seller'],
        productId = doc.data()!['productId'];
}
