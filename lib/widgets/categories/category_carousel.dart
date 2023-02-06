import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../blocs/category/category_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../models/Category.dart';
import 'categoryCarouselItem.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: BlocBuilder<CategoryBloc,CategoryState>(
          builder: (context,state){
            if(state is CategoryLoading){
              return const Center(child: CircularProgressIndicator());
            }
            if(state is CategoryLoaded){
              return CarouselSlider(

                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enableInfiniteScroll: false,
                ),
                items: state.categories
                    .map((category) => CategoryCarouselCard(category2: category))
                    .toList(),
              );

            }
            else {
              return const Text('Something Went Wrong');
            }
          }
      ),
    );

  }
}

