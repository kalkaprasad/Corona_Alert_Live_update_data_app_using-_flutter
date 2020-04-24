
import 'package:corona_update/APIData/Corona_Data.dart';
import 'package:corona_update/Properties/alertsystem.dart';
import 'package:corona_update/Properties/watchvideo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class coronaSymtopms extends StatelessWidget{


  String Protection="""
  People may be sick with the virus for 1 to 14 days before developing symptoms. The most common symptoms of coronavirus disease (COVID-19) are fever, tiredness, and dry cough. Most people (about 80%) recover from the disease without needing special treatment.
  More rarely, the disease can be serious and even fatal. Older people, and people with other medical conditions (such as asthma, diabetes, or heart disease), may be more vulnerable to becoming severely ill.
"""
  ;
  String option ="""" People may experience:
  cough
  fever
  tiredness
  difficulty breathing (severe cases)""";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<Color> _colors = [Color(0xff7b4397), Color(0xffdc2430)];
    List<double> _stops = [0.0, 0.7];
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "CoronaVirus Tracker Live",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xff000B18),
        centerTitle: true,
      ),
      body:Container(
        //color: Colors.deepOrangeAccent,
        margin: EdgeInsets.only(top: 15,left: 20,right: 10,bottom: 20),
       // color: Colors.blue,
        decoration:  BoxDecoration(
          //color: Color(0xff000B18),
          gradient:LinearGradient(
            colors: _colors,
            stops: _stops,

          ),

          borderRadius: BorderRadius.only(topLeft: Radius.circular(80),topRight: Radius.circular(80),bottomRight:Radius.circular(80) )
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
                child:  GestureDetector(
                    onTap: (){
                      alersystem(context);
                    },

                    child: new  Text("Symptoms of Coronavirus",style: TextStyle(color: Colors.white,fontFamily: 'kalka',fontWeight: FontWeight.bold,fontSize: 20.0),softWrap: true,))),
            Padding(
                padding: EdgeInsets.all(10),
                child: new Text(Protection,style: TextStyle(color: Colors.white,fontSize:16.0, fontStyle: FontStyle.normal,fontFamily: 'kalka',letterSpacing: 1.0),textAlign: TextAlign.center,)
            ),
        Divider(color: Colors.white,thickness: 5.0,),
            new Text(option,style: TextStyle(color: Colors.white, fontSize: 15 ,fontWeight: FontWeight.w500,fontFamily: 'fonts/ak',letterSpacing: 1.0),textAlign: TextAlign.center,),
//             Padding(padding:EdgeInsets.all(19.0),
//             child: FlatButton(
//               color: Colors.deepOrange,
//               shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
//               child: new Text("Watch Video ",style: TextStyle(color: Colors.white),),
//               onPressed: (){
//                 //coronadata cor= new coronadata();
//                // cor.fetchdata();
//        //dynamic a=cor.fetchdata();
////                 print(coronadata().newAPi());
////                 print(coronadata().GlobalTotalRecovered);
//                 //print(coronadata().fetchdata());
//               },
//             ),),

          ],

        ),

      ),

    );
  }


}