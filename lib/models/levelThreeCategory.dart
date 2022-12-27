import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';


class LevelThreeCategory extends Equatable {
  final String mainCategory;
  final String image;
  final String subCatName;


  const LevelThreeCategory({
    required this.mainCategory,
    required this.subCatName,
    required this.image
  });

  @override
  // TODO: implement props
  List<Object?> get props => [mainCategory, image,subCatName];

  static LevelThreeCategory fromSnapshot(DocumentSnapshot snap){
    LevelThreeCategory level3Category  = LevelThreeCategory( mainCategory: snap ['mainCategory'] ,  subCatName: snap['subCategory'],image: snap['image']);
    return level3Category;
  }
// static List<Category> categories = [
//   const Category(catName: 'category1',
//     image: 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   ),
//   const Category(catName: 'category2',
//     image: 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//
//   ),
//   const Category(catName: 'category3',
//     image: 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//
//   ),
//
// ];
}