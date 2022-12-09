import 'package:flutter/material.dart';

import '../../utils/globalColors.dart';
import '../../widgets/customButton.dart';
import '../../widgets/custom_text_formfield.dart';
import '../../widgets/login_textformfield.dart';
import 'SocialLogin.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/login';
  final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();


   static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       child:SafeArea(
         child: Container(
           width: double.infinity,
           padding:const EdgeInsets.all(35.0),
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
               LoginFormField(controller: emailController,title: 'Email',obscureText: false,textInputType: TextInputType.emailAddress,),
               SizedBox(height:15),
               LoginFormField(controller: passwordController,title: 'Password',obscureText: true,textInputType: TextInputType.visiblePassword),

               SizedBox(height:15),

               CustomButton(text: 'Sign in',) ,
               SizedBox(height:50),
               const SocialLogin(),
               SizedBox(height:50),

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:  [
                   const Text('Don\'t Have an Account?',style:TextStyle(
                     color:Colors.black,
                     fontSize:15,
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






             ]
           ),
         ),
       ) 
      ),
    );
  }
}
