
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class  bottombar extends StatelessWidget{
  bottombar({this.text,this.transfer});

  String text;
  Function transfer;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 40,
      margin: EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          transfer();
        },
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text( text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  inherit: true,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(left: 90),
              child:  new Icon(FontAwesomeIcons.arrowRight,color: Colors.white,),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xff2A3A50),
      ),
    );
  }


}
