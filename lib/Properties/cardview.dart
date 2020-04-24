
import 'package:flutter/cupertino.dart';

class containerCard extends StatelessWidget{

  containerCard({this.color,this.child});

  int color;
  Widget child;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Container(
      margin: EdgeInsets.all(15.0),
      height: 180,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius:BorderRadius.circular(10.0),
      ),
      child: child,


    );
  }


}
