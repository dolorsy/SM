import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shibly_marketing/UI/main_screen.dart';
import 'package:shibly_marketing/Utility/const_values.dart';

import 'onboarding_screen.dart';



class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return new MaterialApp(
      home: Screen(),
    );

    ;
  }


}
class Screen extends StatefulWidget{
  _Screen createState()=> _Screen();

}

class _Screen extends State<Screen>{

  FlareActor logoAnim = new FlareActor("flare/logoAnim.flr",
      alignment:Alignment.center,
      fit: BoxFit.contain,
      animation:"mainAnim",

  );


  @override
  Widget build(BuildContext context) {

    //TODO: should get OnBoarding Data from API or if it's cashed just wait 3.5 Second then open main Screen

    Timer.periodic(new Duration(milliseconds:3500), (time) {
      time.cancel();

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConstValues.firstOpening?OnBoardingScreen():MainScreen())
      );
    },
    );

    double x =  MediaQuery.of(context).size.width;
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      home :SizedBox(
        width: x,
        child: AnimatedContainer(
           color: Color(0xFFFFFFFF),
          alignment: Alignment.center,
         duration: Duration(milliseconds:1000),
           child: logoAnim,
          onEnd: ()=> {  Navigator.push(
         context,
          MaterialPageRoute(builder: (context) => MainScreen()),

    ) }
    ),
    )
    );
  }


}