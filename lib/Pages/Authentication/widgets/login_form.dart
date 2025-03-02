import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkuulima/Pages/homepage.dart';

import '../../../blocs/form-validation/form_bloc.dart';
import '../../../utils/globalColors.dart';
import '../../../widgets/customButton.dart';
import '../../../widgets/login_textformfield.dart';
import '../SocialLogin.dart';
class LoginForm extends StatelessWidget {
   LoginForm({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Form(
      key: key,
      child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            const SizedBox(height:50),

            Center(
              child: Text('Logo',
                  style:TextStyle(
                    color:GlobalColors.mainColor,
                    fontSize:35,
                    fontWeight:FontWeight.bold,
                  )
              ),
            ),
            const SizedBox(height:50),
            const Text('Login to your account',
                style:TextStyle(
                  color:Colors.black,
                  fontSize:16,
                  fontWeight:FontWeight.w500,
                )
            ),
            SizedBox(height:35),
           BlocBuilder<FormBloc,FormsValidate>(
              builder: (context,state) {
                return LoginFormField(controller: emailController,title: 'Email',obscureText: false,textInputType: TextInputType.emailAddress,onChanged:(value){ context.read<FormBloc>().add(EmailChanged(value!));},errorText:!state.isEmailValid
                    ? 'Please ensure the email entered is valid'
                    : null,labelText:'Email',helperText:'A complete, valid email e.g. joe@gmail.com',hintText:'Email');
              }
            ),


            SizedBox(height:15),

                  BlocBuilder<FormBloc,FormsValidate>(
                    builder:(context,state){
                      return   LoginFormField(controller: passwordController,title: 'Password',obscureText: true,textInputType: TextInputType.visiblePassword,onChanged:(value){ context.read<FormBloc>().add(PasswordChanged(value!));},errorText:!state.isPasswordValid
                          ? '''Password must be at least 8 characters and contain at least one letter and number'''
                          : null,labelText:'Password',helperText: '''Password should be at least 8 characters with at least one letter and number''',hintText: 'Password');


                    }
                  ),




            SizedBox(height:15),

            BlocBuilder<FormBloc,FormsValidate>(
              builder:(context,state){
                return state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : InkWell(
                  onTap:(){
                    if(!state.isFormValid ){
                      context.read<FormBloc>().add(const FormSubmitted(value:Status.signIn));
                    }


                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const HomePage()),
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
                    child: const Text('Login',style:TextStyle(
                        color:Colors.white,fontWeight:FontWeight.w600
                    )),
                  ),
                );




                // CustomButton(text: 'Sign in', onPressed: !state.isFormValid
                //     ? () => context
                //     .read<FormBloc>()
                //     .add(const FormSubmitted(value: Status.signIn))
                //     : null,) ;

            }
            ),
            SizedBox(height:50),
            const SocialLogin(),
            SizedBox(height:50),

            Container(
              width:MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('Don\'t Have an Account?',style:TextStyle(
                    color:Colors.black,
                    fontSize:10,
                    fontWeight:FontWeight.w500,
                  ),),
                  const SizedBox(width:5),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,'/register');
                    },
                    child: Text('click here to register ',style:TextStyle(
                      color:GlobalColors.mainColor,
                      fontSize:15,
                      fontWeight:FontWeight.w500,
                    ),),
                  ),

                ],
              ),
            ),






          ]
      ),
    );
  }
}
