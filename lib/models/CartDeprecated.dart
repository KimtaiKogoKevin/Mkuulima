import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartDeprecated {
  late final String? id;
  final String productName;
  //final String? productDescription;
  final num regularPrice;
  //final num? discountPrice;
  //final String? category;
  //final String? mainCategory;
  //final String subCategory;
  //final Timestamp? discountDateSchedule;
  final ValueNotifier<int> quantity;

  //final int? skuNumber;
  //final bool? manageInventory;
  //final bool? chargeShipping;
  //final int? shippingCharge;
  //final String? brandName;
  //final int? stockOnHand;
  final String productId;
  final String? userId;


//final int? reorderLevel;
//final List? sizeList;
  //final String? otherDetails;
  //final String? selectedUnit;
  //final List imageUrls;
  final Uint8List? imageUrls;
  //final bool? isRecommended;
  //final bool? isPopular;

  //final Map? seller;

  CartDeprecated({
    required this.productName,
    //this.productDescription,
    required this.regularPrice,
   // this.discountPrice,
    //this.category,
    //this.mainCategory,
   // required this.subCategory,
    required this.quantity,
     this.userId,
   // this.discountDateSchedule,
    //this.skuNumber,
    //this.manageInventory,
  //  this.chargeShipping,
    //this.shippingCharge,
   // this.brandName,
   // this.stockOnHand,
   // this.otherDetails,
   // this.selectedUnit,
    required this.imageUrls,
   // this.isRecommended,
    //this.isPopular,
    //this.seller,
    required this.productId, this.id,});

  CartDeprecated.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        userId=data['userId'],
        productId = data['productId'] ,
        productName = data['productName'],
      //  productDescription = data['productDescription'],
        regularPrice = data['regularPrice'],
  //       discountPrice = data['discountPrice'],
  //       category = data['category'],
  //       mainCategory = data['mainCategory'],
  //       subCategory = data['subCategory'],
  //       discountDateSchedule = data['discountDateSchedule'],
  //       skuNumber = data['skuNumber'],
  //       manageInventory = data['manageInventory'],
  //       chargeShipping = data['chargeShipping'],
  //       shippingCharge = data['shippingCharge'],
  //       brandName = data['brandName'],
  //       stockOnHand = data['stockOnHand'],
  // //reOrderLevel: doc.data()!['reorderLevel'],
  // //sizeList: json['sizeList'] as List,
  //       otherDetails = data['otherDetails'],
  //       selectedUnit = data['selectedUnit']!,
        imageUrls = data['imageUrls'],
       // isRecommended = data['isRecommended'],
       // isPopular = data['isPopular'],
        //seller = data['seller'],
        quantity = ValueNotifier(data['quantity']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
     // 'productDescription': productDescription,
      'regularPrice': regularPrice,
     // 'dicountPrice': discountPrice,
     // 'category': category,
     // 'mainCategory': mainCategory,
     //  'subCategory': subCategory,
     //  'discountDateSchedule': discountDateSchedule,
     //  'skuNumber': skuNumber,
     //  'manageInventory': manageInventory,
     //  'chargeShipping': chargeShipping,
     //  'brandName': brandName,
     //  'stockOnHand': stockOnHand,
     //  //'reorderLevel': reorderLevel,
     //  // 'sizeList': sizeList,
     //  'otherDetails': otherDetails,
     //  'selectedUnit': selectedUnit,
      'imageUrls': imageUrls,
      'userId':userId,
    //  'seller': seller,
      //'productId': productId,
     // 'isRecommended': isRecommended,
   //   'isPopular': isPopular,
      'quantity': quantity?.value,

    };


  }
  Map<String, dynamic> quantityMap() {
    return {
      'productId': productId,
      'quantity': quantity!.value,
    };
  }

}