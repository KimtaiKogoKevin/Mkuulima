import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkuulima/Pages/Authentication/widgets/register_form.dart';

import '../../blocs/Authentication/authentication_bloc.dart';
import '../../blocs/form-validation/form_bloc.dart';
import '../../utils/error_dialog.dart';
import '../../utils/globalColors.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customEmailPhoneField.dart';
import '../../widgets/custom_text_formfield.dart';
import '../../widgets/login_textformfield.dart';
import '../homepage.dart';
import 'SocialLogin.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



class RegisterPage extends HookWidget {
   RegisterPage({Key? key}) : super(key: key);
  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => RegisterPage());
  }








  @override
  Widget build(BuildContext context) {


    return      MultiBlocListener(
      listeners: [
        BlocListener<FormBloc, FormsValidate>(
          listener: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              showDialog(
                  context: context,
                  builder: (context) =>
                      ErrorDialog(errorMessage: state.errorMessage));
            } else if (state.isFormValid && !state.isLoading) {
              context.read<AuthenticationBloc>().add(AuthenticationStarted());
              context.read<FormBloc>().add(const FormSucceeded());
            } else if (state.isFormValidateFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error submitting form , try again')));
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
                  child: RegisterForm(),
              ),
            )
        ),
      ),
    );

  }
}
