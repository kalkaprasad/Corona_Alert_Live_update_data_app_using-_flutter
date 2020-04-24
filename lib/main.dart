import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/homeScreen.dart';
import 'SplashScreen.dart';

void main(){
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(coronaUpdate());}
// ignore: camel_case_types
class coronaUpdate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    // TODO: implement build

    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      title: "CoronaUpdate",
      home:    Splashscreen(),
      //HomeScreen(),
    );
  }




}