import 'package:flutter/material.dart';

import '../../utils/globalColors.dart';
import '../../widgets/custom_text_formfield.dart';
import '../../widgets/login_textformfield.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/login';
  final TextEditingController emailController = TextEditingController();

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
           padding:const EdgeInsets.all(15.0),
           child: Column(
             crossAxisAlignment:CrossAxisAlignment.start,
             children:[
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
               SizedBox(height:15),
               LoginFormField(controller: emailController,title: 'Email',obscureText: true),



             ]
           ),
         ),
       ) 
      ),
    );
  }
}
