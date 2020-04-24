
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget iconns(String image)
{
  return   new Container(
      width: 60.0,
      height: 60.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
        //  color: Colors.white,
          image: new DecorationImage(
            fit: BoxFit.fill,
//                                image: AssetImage("images/newcase.png"),
            // image: AssetImage('images/newcase.png'),
            //  image:AssetImage('assets/images/death.jpg'),
            //"https://img.icons8.com/color/2x/human-torch.png"
            image:AssetImage(image),
            //fit: BoxFit.cover,
          )
      ));
}