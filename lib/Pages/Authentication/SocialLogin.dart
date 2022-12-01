import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.center,
          child: const Text("- Or Sign in With -",
              style: TextStyle(
                color: Colors.black26,
              ))),
      const SizedBox(height:15),
      SizedBox(
        width:MediaQuery.of(context).size.width*0.6,

        child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children:[
          Center(
            child: Container(
              decoration:BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow:[
                  BoxShadow(
                    color:Colors.black.withOpacity(.1),
                    blurRadius: 10,

                  )
                ]
              ),
              alignment:Alignment.center,
              child:SvgPicture.asset('images/facbook.svg',height: 30,)
            ),
          ),
          SizedBox(width:10),
          Center(
            child: Container(
                decoration:BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow:[
                      BoxShadow(
                        color:Colors.black.withOpacity(.1),
                        blurRadius: 10,

                      )
                    ]
                ),
                alignment:Alignment.center,
                child:SvgPicture.asset('images/google.svg',height: 30,),

            ),
          ),
          SizedBox(width:10),
          Center(
            child: Container(
              decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow:[
                    BoxShadow(
                      color:Colors.black.withOpacity(.1),
                      blurRadius: 10,

                    )
                  ]
              ),
              alignment:Alignment.center,
              child:SvgPicture.asset('images/twitter.svg',height: 30,),

            ),
          ),


        ]),
      )
    ]);
  }
}
