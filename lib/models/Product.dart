import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../firebase_services.dart';

class Product extends Equatable {
  final String productName;
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

  const Product({
    required this.productName,
    this.productDescription,
    this.regularPrice,
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
    this.reorderLevel,
    this.sizeList,
    this.otherDetails,
    this.selectedUnit,
    required this.imageUrls,
    this.seller,
    this.approved,
    this.productId,
    this.isRecommended,
    this.isPopular,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        brandName,
        category,
        imageUrls,
        productName,
        regularPrice,
        isPopular,
        isRecommended
      ];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        category: snap['category'],
        isPopular: snap['isPopular'],
        brandName: snap['brandName'],
        isRecommended: snap['isRecommended'],
        imageUrls: snap['imageUrls'],
        regularPrice: snap['regularPrice'],
        productName: snap['productName'],
        subCategory: snap['subCategory']);
    return product;
  }
}

FirebaseService _service = FirebaseService();
productWithSubCatCollection( productSubCatSelected) {
  return _service.Products.where('active', isEqualTo: true).where(
      'subCategory', isEqualTo: productSubCatSelected).snapshots();
}