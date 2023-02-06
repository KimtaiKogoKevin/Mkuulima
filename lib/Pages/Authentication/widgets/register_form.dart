import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/form-validation/form_bloc.dart';
import '../../../utils/globalColors.dart';
import '../../../widgets/customButton.dart';
import '../../../widgets/customEmailPhoneField.dart';
import '../../../widgets/login_textformfield.dart';
import '../SocialLogin.dart';
import '../email_verification.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController userController = TextEditingController();

  final TextEditingController emailPhoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {


    bool isEmail(String input) => EmailValidator.validate(input);
    bool isPhone(String input) =>
        RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
            .hasMatch(input);

    return Form(

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
        BlocBuilder<FormBloc, FormsValidate>(builder: (context, state) {
          return LoginFormField(
            controller: emailController,
            title: 'Email',
            obscureText: false,
            textInputType: TextInputType.text,
            onChanged: (value) {
              context.read<FormBloc>().add(NameChanged(value!));
            },
            errorText: !state.isNameValid ? '''Name cannot be empty!''' : null,
            labelText: "UserName",
            helperText: '''Name must be valid!''',
            hintText: 'UserName',
          );
        }),

        SizedBox(height: 35),
        BlocBuilder<FormBloc, FormsValidate>(
          builder: (context, state) {
            return LoginFormField(
                controller: emailController,
                title: 'Email',
                obscureText: false,
                textInputType: TextInputType.emailAddress,

                onChanged: (value) {
                  context.read<FormBloc>().add(EmailChanged(value!));

                },
                errorText: !state.isEmailValid
                    ? 'Please ensure the email entered is valid'
                    : null,
                labelText: 'Email',
                helperText: 'A complete, valid email e.g. joe@gmail.com',
                hintText: 'Email');
          },
        ),
        // EmailPhone(
        //       controller: emailPhoneController,
        //       title: 'Email or Phone Number',
        //       obscureText: false,
        //       textInputType: TextInputType.text,
        //     ),

        SizedBox(height: 35),
        BlocBuilder<FormBloc, FormsValidate>(builder: (context, state) {
          return LoginFormField(
              controller: passwordController,
              title: 'Password',
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
              onChanged: (value) {
                context.read<FormBloc>().add(PasswordChanged(value!));
              },
              errorText: !state.isPasswordValid
                  ? '''Password must be at least 8 characters and contain at least one letter and number'''
                  : null,
              labelText: 'Password',
              helperText:
                  '''Password should be at least 8 characters with at least one letter and number''',
              hintText: 'Password');
        }),

        SizedBox(height: 35),

        Center(child:
            BlocBuilder<FormBloc, FormsValidate>(builder: (context, state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : InkWell(
            onTap:(){
              if(!state.isFormValid ){
                context.read<FormBloc>().add(const FormSubmitted(value:Status.signUp));
              }


              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const EmailVerificationScreen()),
                      (Route<dynamic> route) => false);

              // !state.isFormValid
              //             ? () => context
              //                 .read<FormBloc>()
              //                 .add(const FormSubmitted(value: Status.signUp))
              //             :  null;

            },
            child: Container(
              alignment:Alignment.center,
              height:55,
              decoration:BoxDecoration(
                color:GlobalColors.mainColor,
                borderRadius:BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color:Colors.black.withOpacity(0.1),
                      blurRadius:10
                  ),
                ],
              ),
              child: const Text('Sign up',style:TextStyle(
                  color:Colors.white,fontWeight:FontWeight.w600
              )),
            ),
          );
          // CustomButton(
          //         text: 'Verify',
          //
          //         onPressed: !state.isFormValid
          //             ? () => context
          //                 .read<FormBloc>()
          //                 .add(const FormSubmitted(value: Status.signUp))
          //             :  null,
          //
          //       );
        })),

        // ElevatedButton(
        //     onPressed: () {
        //       if (key.currentState!.validate()) {
        //         // If the form is valid, display a snackbar. In the real world,
        //         // you'd often call a server or save the information in a database.
        //         ScaffoldMessenger.of(context).showSnackBar(
        //           const SnackBar(content: Text('Processing Data')),
        //         );
        //       }
        //     },
        //     style: ButtonStyle(
        //         padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
        //         foregroundColor: MaterialStateProperty.all(Colors.white),
        //         backgroundColor:
        //             MaterialStateProperty.all(Color(0xFF0D47A1))),
        //     child: isEmail(emailPhoneController.text)
        //         ? const Text('Verify Email', style: TextStyle(fontSize: 20))
        //         : isPhone(emailPhoneController.text)
        //             ? Text('Verify Phone Number',
        //                 style: TextStyle(fontSize: 20))
        //             : Text('Verify')),

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
    );
  }
}
