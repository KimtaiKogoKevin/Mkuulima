import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../utils/globalColors.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customEmailPhoneField.dart';
import '../../widgets/custom_text_formfield.dart';
import '../../widgets/login_textformfield.dart';
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






  final TextEditingController userController = TextEditingController();

  final TextEditingController emailPhoneController = TextEditingController();


  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    bool isEmail(String input) => EmailValidator.validate(input);

    bool isPhone(String input) => RegExp(
        r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'
    ).hasMatch(input);


    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(35.0),
              child:
              Form(
                key:key,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Text('Logo',
                        style: TextStyle(
                          color: GlobalColors.mainColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(height: 50),
                  const Text('Welcome to  MukuLima',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(height: 15),
                  LoginFormField(
                      controller: userController,
                      title: 'Username',
                      obscureText: true,
                      textInputType: TextInputType.text),
                  SizedBox(height: 35),
                  EmailPhone(controller:emailPhoneController,title: 'Email or Phone Number', obscureText: false,textInputType: TextInputType.text,),
                  SizedBox(height: 35),
                  LoginFormField(
                      controller: passwordController,
                      title: 'Password',
                      obscureText: true,
                      textInputType: TextInputType.phone),
                  SizedBox(height: 35),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          backgroundColor:
                          MaterialStateProperty.all(Color(0xFF0D47A1))),
                      child: isEmail(emailPhoneController.text)?const Text('Verify Email', style: TextStyle(fontSize: 20)):Text('Verify Phone Number',style: TextStyle(fontSize: 20)),
                    ),
                  ),

                  // CustomButton(
                  //   text: 'Sign in',
                  // ),
                  SizedBox(height: 50),
                  const SocialLogin(),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),

                      ),
                      const SizedBox(width: 5),
                       Text(
                        'Log in',
                        style: TextStyle(
                          color: GlobalColors.mainColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),

                      ),
                    ],
                  ),
                ]),
              ),
            ),
          )),
    );
  }
}
