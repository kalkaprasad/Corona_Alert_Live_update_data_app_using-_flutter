
import 'dart:async';
import 'dart:convert';

import 'package:corona_update/APIData/Corona_Data.dart';
import 'package:corona_update/Properties/alertsystem.dart';
import 'package:corona_update/Properties/bottombar.dart';
import 'package:corona_update/Properties/cardview.dart';
import 'package:corona_update/Properties/iconscode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

class wordcorona extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _wordcorona();
  }
}

class _wordcorona extends State<wordcorona> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 10),
            (){
              alersystem(context);
            } );
  }

  //// word corona status ..



  String wordapi="https://api.covid19api.com/summary";

   int GlobalNewConfirmed;
  int GlobalTotalConfirmed;
  int GlobaleTotalDeaths;
  int GlobalTotalRecovered;

  Future<List<WordldCoronaModel>>_wordcoro() async
  {
    Response response= await get(wordapi);
    int size=0;
    List<WordldCoronaModel> consultdata=[]; // this is the List Where all data will be stored...
    if(response.statusCode==200)
    {
      var decodedata=jsonDecode(response.body);
      GlobalTotalConfirmed=decodedata['Global']['TotalConfirmed'];  // total confirmed
      print(" confirmed case $GlobalTotalConfirmed");
      GlobaleTotalDeaths=decodedata['Global']['TotalDeaths'];  // total Death
      print(" Deaths case $GlobaleTotalDeaths");
      GlobalTotalRecovered=decodedata['Global']['TotalRecovered'];  // total Recoverd
      print(" Recovered case $GlobalTotalRecovered");
      GlobalNewConfirmed=decodedata['Global']['NewConfirmed'];  // total confirmed
      print(" Active case $GlobalNewConfirmed");
//      date=decodedata[jsonIndexValue]['Date'];
//      print("date is $date");

      WordldCoronaModel kalka=WordldCoronaModel(decodedata['Global']['TotalConfirmed'],decodedata['Global']['TotalDeaths'],decodedata['Global']['TotalRecovered'],decodedata['Global']['NewConfirmed']); // this is constucter of the corona class..
      //String lalur="name";
      consultdata.add(kalka);
    }
    return consultdata; // this method return the coron details list..


  }

  ////////
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: Container(
        //color: Color(0xff000B18),
          child: FutureBuilder(
            future:_wordcoro(),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.data==null)
              {
                return   Container(
                  color: Colors.white70,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: SpinKitCircle(
                          color: Colors.deepOrange,
                          size: 90.0,

                        ),
                        
                      ),
                      Center(
                        child:  new Text("Please Wait fetching info.."),
                      )
                    ],
                  ),
                );
              }
              else{
                return new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Container(
                      height: 30,
                      margin: EdgeInsets.all(10.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Image(
                            image:
                            NetworkImage("https://img.icons8.com/color/2x/earth-planet.png"),
                          ),
                          new Text(
                            " World Corona Status..",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.purple,
                      ),
                    ),

                    // this is the use for the suspected Corona Patients
                    new Row(
                      children: <Widget>[
                        Expanded(
                          child: containerCard(
                            color: 0xffea0000,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                iconns('images/hospitalpng.png'),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: new Text(
                                    "Total Confirmed",
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: new Text(
                                    "$GlobalTotalConfirmed",
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: containerCard(
                            color: 0xff009b4e,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                iconns("images/newconfirmed.png"),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: new Text(
                                    "New Confirmed",
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: new Text(
                                    "$GlobalNewConfirmed",
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),


                    Divider(),
                    new Row(
                      children: <Widget>[
                        Expanded(
                          child: containerCard(
                            color: 0xffe67300,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                iconns(
                                    "images/recoverd.png"),
                                // this is use for recoverd patient    //https://img.icons8.com/cotton/2x/crossbones.png
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: new Text(
                                    "Recovered",
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: new Text(
                                    "$GlobalTotalRecovered",
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: containerCard(
                            color: 0xff0082bf,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                iconns("images/cofirmdeath.png"),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: new Text(
                                    "Total Death",
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: new Text(
                                    "$GlobalNewConfirmed",
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),


                  ],
                );
              }
            },
          )),
    );
  }
}

//
//FlatButton(
//child: new Text("Click here"),
//color:  Colors.teal,
//onPressed: (){
//
//coronadata().fetchdata();
//},
//),

class WordldCoronaModel{

  final int IndiannewConfirmed;
  final int InTotalConfirmed;
  final int indianTotalDeaths;
  final  int indianTotalRecovered;

  WordldCoronaModel(this.indianTotalDeaths,this.indianTotalRecovered,this.InTotalConfirmed,this.IndiannewConfirmed);

}
