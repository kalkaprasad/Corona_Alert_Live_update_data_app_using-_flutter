import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void Stayhome(BuildContext context) async
{
  Alert(
      //image: Image.network("https://img.icons8.com/cute-clipart/2x/home.png"),
      title: "Important Message For you.",
      context: context,
      style:AlertStyle(titleStyle: TextStyle(color: Colors.red,fontFamily: 'kalka'),descStyle: TextStyle(fontWeight: FontWeight.bold),animationDuration: Duration(milliseconds: 300),animationType: AnimationType.grow),
      desc: "Stay Home, Stay Safe.",
      content: new Text("Follow the Rules of Lockdown",style: TextStyle(fontFamily: 'kalka',fontSize: 15),),
      buttons:[
        DialogButton(
          radius: BorderRadius.circular(20),
          color: Colors.deepPurpleAccent,
          child: new Text("Ok",style: TextStyle(color: Colors.white, fontSize: 20),),
          onPressed: (){
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>kptech()));
          },
        ),

      ]
  ).show();
}