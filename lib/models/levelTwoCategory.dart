import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';


class LevelTwoCategory extends Equatable {
  final String mainCategory;
  final String category;

  const LevelTwoCategory({
    required this.mainCategory,
    required this.category
  });

  @override
  // TODO: implement props
  List<Object?> get props => [mainCategory, category];

  static LevelTwoCategory fromSnapshot(DocumentSnapshot snap){
    LevelTwoCategory level2Category  = LevelTwoCategory( mainCategory: snap ['mainCategory'] ,  category: snap['category'],);
    return level2Category;
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