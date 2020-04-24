import 'dart:convert';
import 'package:corona_update/Properties/bottombar.dart';
import 'package:corona_update/Properties/cardview.dart';
import 'package:corona_update/Properties/iconscode.dart';
import 'package:corona_update/Statewisedata/Statecoronastatus.dart';
import 'package:corona_update/Worldcorona/CoronaSymtopms.dart';
import 'package:corona_update/Worldcorona/wordlcorona.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:async/async.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {

 // coronadata coronas = new coronadata();
 // String data=coronas.indianTotalDeaths;
  String newAPI="https://api.covid19api.com/live/country/india/status/confirmed";

// this is the for india..
//  int date;
  int IndiannewConfirmed;
  int InTotalConfirmed;
  int indianTotalDeaths;
  int indianTotalRecovered;

  Future<List<CoronaModel>>_newAPi() async
  {
    Response response= await get(newAPI);
    int size=0;
    List<CoronaModel> consultdata=[]; // this is the List Where all data will be stored...
    if(response.statusCode==200)
    {
      var decodedata=jsonDecode(response.body);
      for(var as  in decodedata) // this foreach loop are use for the find the total length of the  data array
          {
        size+=1;
        print(as);
      }
      print(size);
      var jsonIndexValue=size-1;
      InTotalConfirmed=decodedata[jsonIndexValue]['Confirmed'];  // total confirmed
      print(" confirmed case $InTotalConfirmed");
      indianTotalDeaths=decodedata[jsonIndexValue]['Deaths'];  // total Death
      print(" Deaths case $indianTotalDeaths");
      indianTotalRecovered=decodedata[jsonIndexValue]['Recovered'];  // total Recoverd
      print(" Recovered case $indianTotalRecovered");
      IndiannewConfirmed=decodedata[jsonIndexValue]['Active'];  // total confirmed
      print(" Active case $IndiannewConfirmed");
//      date=decodedata[jsonIndexValue]['Date'];
//      print("date is $date");

      CoronaModel kalka=CoronaModel(decodedata[jsonIndexValue]['Confirmed'],decodedata[jsonIndexValue]['Deaths'],decodedata[jsonIndexValue]['Recovered'],decodedata[jsonIndexValue]['Active']); // this is constucter of the corona class..
      //String lalur="name";
      consultdata.add(kalka);
    }
    return consultdata; // this method return the coron details list..


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_newAPi();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "CoronaVirus Tracker",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_alert,
              color: Colors.white,
            ),
            onPressed: (
                ) {
//              snackbar();
              Toast.show("Notification is Empty..", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM,backgroundColor: Colors.teal);
              // do something
            },
          )
        ],


        backgroundColor: Color(0xff000B18),
        centerTitle: true,
      ),
      body: Container(
          //color: Color(0xff000B18),
          child: FutureBuilder(
            future:_newAPi(),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.data==null)
                {
                  return   Container(
                    color: Colors.white70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: SpinKitCircle(
                            color: Colors.deepOrange,
                            size: 90.0,

                          ),

                        ),
                        Center(
                          child:  new Text("Please Wait fetching  "
                              ""
                              "info.."),
                        )
                      ],
                    ),
                  );
                }
              else
                {
                  print("Success");
                  return new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Container(
                        height: 40,
                        margin: EdgeInsets.all(10.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('images/indian.png',height: 40,width: 50,fit: BoxFit.fill,),


                            new Text(
                              " India Corona Status..",
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
                          color:Color(0xff2A3A50),
                        ),
                      ),
                      new Text("",style: TextStyle(fontSize: 10),textAlign: TextAlign.center,),
                      Expanded(
                        // this is the use for the suspected Corona Patients
                        child: new Row(
                          children: <Widget>[
                            Expanded(
                              child: containerCard(
                                color: 0xffea0000,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[ //"https://img.icons8.com/color/2x/hospital-3.png"
                                    iconns('images/hospitalpng.png'),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: new Text(
                                        " Total Confirmed ",
                                        style:
                                        TextStyle(color: Colors.white, fontSize: 20.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),

                                      child: new Text("$InTotalConfirmed",
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
                                  mainAxisAlignment: MainAxisAlignment.center,  //"https://img.icons8.com/nolan/2x/hospital-wheel-bed.png"
                                  children: <Widget>[
                                    iconns("images/newconfirmed.png"),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: new Text(
                                        "Active Case ",
                                        style:
                                        TextStyle(color: Colors.white, fontSize: 20.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: new Text(
                                       " $IndiannewConfirmed",
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
                      ),

                      Divider(height: 1.0,),
                      Expanded(
                        child: new Row(
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
                                        "$indianTotalRecovered",
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
                                        "$indianTotalDeaths",
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
                      ),

                      /// bottom bar
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          bottombar(
                            text: "Corona Status for World              ",
                            transfer: () {
                              print("More info");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => wordcorona()));
                            },
                          ),
                          bottombar(
                            text: "Corona Status for Indian State",
                            transfer: () {
                              print("More info");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => StateCorona()));
                            },
                          ),
                          bottombar(
                            text: "   Check out Corona Symptoms",
                            transfer: () {
                              print("More info");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => coronaSymtopms()));
                            },
                          ),

                          new Text(
                            "Designed and developed by Kp singh.",
                            style: TextStyle(fontSize: 15, letterSpacing: 2.0),
                          ),
                        ],
                      ),
                    ],
                  );
                }
            }

            //child:
          )),
    );
  }
}



class CoronaModel{

  final int IndiannewConfirmed;
  final int InTotalConfirmed;
  final int indianTotalDeaths;
  final  int indianTotalRecovered;

  CoronaModel(this.indianTotalDeaths,this.indianTotalRecovered,this.InTotalConfirmed,this.IndiannewConfirmed);

}



Widget snackbar()
{
  SnackBar(
    backgroundColor: Colors.blue,
    elevation: 10.0,
    content: Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
}