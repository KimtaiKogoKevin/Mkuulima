import 'package:firebase_core/firebase_core.dart';
import 'package:mkuulima/repositories/categories/category_repository.dart';
import 'package:mkuulima/splashView.dart';
import 'Pages/Authentication/login_page.dart';
import 'blocs/category/category_bloc.dart';
import 'blocs/wishlist/wishlist_bloc.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkuulima/Pages/homepage.dart';
import 'package:mkuulima/repositories/checkout/checkout_repository.dart';
import 'package:mkuulima/repositories/products/product_repository.dart';
import 'firebase_options.dart';
import 'Pages/cartPage.dart';
import 'Pages/checkout.dart';
import 'blocs/cart/cart_bloc.dart';
import 'blocs/checkout/checkout_bloc.dart';
import 'blocs/product/product_bloc.dart';
import 'config/app_router.dart';
import 'models/Product.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create:(_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create:(_) => CartBloc()..add((LoadCart()))),
        BlocProvider(create:(_) => CategoryBloc(categoryRepository: CategoryRepository())..add((LoadCategories()))),
        BlocProvider(create:(_) => ProductBloc(productRepository: ProductRepository())..add((LoadProducts()))),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            // paymentBloc: context.read<PaymentBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute:LoginPage.routeName,
        routes: {
          "/":(context) =>  const HomePage(),
          "cartPage":(context) => const CartPage(),
         // "itemPage":(context) => const ItemPage(product: ),
          "checkOut":(context) =>  CheckOutPage(),

        },
      ),
    );
  }
}
