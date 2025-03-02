import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mkuulima/repositories/User/userRepository.dart';
import 'package:mkuulima/repositories/authentication/authentication_repository.dart';
import 'package:mkuulima/repositories/categories/category_repository.dart';
import 'package:mkuulima/repositories/database/database_repository.dart';
import 'package:mkuulima/repositories/products/product_subcat.repository.dart';
import 'package:mkuulima/splashView.dart';
import 'package:mkuulima/widgets/categories/categories_widget.dart';
import 'package:mkuulima/widgets/categories/category_screen.dart';
import 'package:provider/provider.dart';
import 'Pages/Authentication/login_page.dart';
import 'package:flow_builder/flow_builder.dart';

import 'Pages/checkout/CheckoutPage.dart';
import 'SQFlite/CartProvider.dart';
import 'blocs/Authentication/authentication_bloc.dart';
import 'blocs/appBlocObserver.dart';
import 'blocs/category/category_bloc.dart';
import 'blocs/database/database_bloc.dart';
import 'blocs/form-validation/form_bloc.dart';
import 'blocs/product/subCatProducts/subcat_product_bloc.dart';
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
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  runApp(
    const MyApp(),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add((LoadCart()))),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add((LoadCategories()))),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add((LoadProducts()))),
        BlocProvider(
            create: (_) => ProductSubCatBloc(
                productSubCatRepository: ProductSubCatRepository())
              ..add((LoadSubCatProducts()))),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            // paymentBloc: context.read<PaymentBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(AuthenticationRepositoryImpl())
                ..add(AuthenticationStarted()),
        ),
        BlocProvider(
          create: (context) => FormBloc(
              AuthenticationRepositoryImpl(), DatabaseRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => DatabaseBloc(DatabaseRepositoryImpl()),
        )
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        RepositoryProvider<UserRepository>(
          create: (_) => UserRepository(),
        ),
      ],
      child: MaterialApp(
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        routes: {

          //"/":(context) =>  const HomePage(),
          "cartPage": (context) => const CartPage(),
          //"itemPage":(context) => const ItemPage(product: ),
          "checkOut": (context) => CheckOutPageDeprecated(),
          "/categories-screen": (context) => const CategoryScreen(),
        },
      ),
    );
  }
}

class BlocNavigate extends StatelessWidget {
  const BlocNavigate({Key? key}) : super(key: key);
  static const String routeName = '/blocNavigate';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const BlocNavigate());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return const CheckoutPage();
        } else if (state is AuthenticationInitial) {
          return LoginPage();
        } else {
          return const CheckoutPage();
        }
      },
    );
  }
}
