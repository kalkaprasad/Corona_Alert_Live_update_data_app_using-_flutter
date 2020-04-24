
import 'dart:async';

import 'package:corona_update/Screens/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Splashscreen();
  }
  
  
  
}

class _Splashscreen extends State<Splashscreen>
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
            (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        } );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      
      backgroundColor: Color(0xff022946),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                   reverseDuration: Duration(seconds: 1),
                   child: Container(
                    width: 180.0,
                      height: 180.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/cornanew.png"),
                          )
                      )),
                 ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
                child: new Text("Corona Alert",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'kalka'),))
          ],

      ),
    );
  }
  
}