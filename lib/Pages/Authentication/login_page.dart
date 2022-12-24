import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkuulima/Pages/Authentication/widgets/login_form.dart';
import 'package:mkuulima/repositories/authentication/auth_repository.dart';

import '../../blocs/Authentication/authentication_bloc.dart';
import '../../blocs/form-validation/form_bloc.dart';
import '../../utils/error_dialog.dart';
import '../../utils/globalColors.dart';
import '../../widgets/customButton.dart';
import '../../widgets/custom_text_formfield.dart';
import '../../widgets/login_textformfield.dart';
import '../homepage.dart';
import 'Cubit/logincubit/login_cubit.dart';
import 'SocialLogin.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/login';
  final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

   static Page<void> page() =>  MaterialPage<void>(child: LoginPage());

   static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocListener(
      listeners: [ BlocListener<FormBloc, FormsValidate>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            showDialog(
                context: context,
                builder: (context) =>
                    ErrorDialog(errorMessage: state.errorMessage));
          } else if (state.isFormValid && !state.isLoading) {
            context.read<AuthenticationBloc>().add(AuthenticationStarted());
          } else if (state.isFormValidateFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red[300],
              content: Row(
                children: const [
                  Icon(Icons.error),
                  Text('Error! Try again',style:TextStyle(color: Colors.white))
                ],
              ),
            ));
          }
        },
      ),
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationSuccess) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false);
            }
          },
        ),
        ],
      child: Scaffold(
        body: SingleChildScrollView(
         child:SafeArea(
           child: Container(
             width: double.infinity,
             padding:const EdgeInsets.all(35.0),
             child: LoginForm()
           ),
         )
        ),
      ),
    );
  }
}
