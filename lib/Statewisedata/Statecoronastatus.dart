
import 'dart:async';
import 'dart:convert';

import 'package:corona_update/Properties/alertsystem.dart';
import 'package:corona_update/Properties/stayhomestaySafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class StateCorona extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateCorona();
  }



}
class _StateCorona extends State<StateCorona>
{



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 10),
            (){
              Stayhome(context);
        } );
  }

  String StateDataAPI="https://script.googleusercontent.com/macros/echo?user_content_key=R2TB9uydr9bakgFTtr8ZIlRYojvSGux-wIbUDsXRsXOt22SI6MbfAWBH3o4VUlei3ThmhlWSPxFtaPBtRGrEtF0pTxGeT-IDm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnKXFvsR88vL4WiBr168omFadgngDnj25DLpEvLRaiIpzZr1NvbW-Bo38vshdDBv10tpytj_A4aoE&lib=Mm1FD1HVuydJN5yAB3dc_e8h00DPSBbB3";



////////



  Future<List<Statedata>> _statedata() async {



    Response response= await get(StateDataAPI);

      var decodeData=jsonDecode(response.body);

   //   int statename=decodeData[0];
     // print(statename);

      // foreach loop here..
    List<Statedata>  datastate=[];
      List states=['Andhra Pradesh','Andaman and Nicobar Islands','Arunachal Pradesh','Assam','Bihar','Chandigarh','Chhattisgarh','Delhi','Goa','Gujarat','Haryana','Himachal Pradesh','Jammu and Kashmir','Jharkhand','Karnataka','Kerala','Ladakh','Madhya Pradesh','Maharashtra','Manipur','Mizoram','Nagaland','Odisha','Puducherry','Punjab','Rajasthan','Tamil Nadu','Telengana','Tripura','Uttarakhand','Uttar Pradesh','West Bengal'];
    print(states.length);
  for(String Stateloop in states)
        {
        print(Stateloop);
//
           int coronacase=decodeData['$Stateloop'];
           print("Corona case $coronacase");

          Statedata statedata= Statedata("$Stateloop","$coronacase");
          datastate.add(statedata);
//          print(states.length);





        }

//    else{
//      //return "failed";
//      print(response.statusCode);
//    }
    return datastate;
  }



  //////////
  var newindex=0;
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar:  new AppBar(title: new Text("India State wise Status"),elevation: 10.0,backgroundColor: Color(0xff2A3A50),centerTitle: true,),
      body:  Container(

        child: FutureBuilder(
          future: _statedata(),
          builder: (BuildContext context , AsyncSnapshot snapshot){

            if(snapshot.data == null)
              {

                print("Faield");
                return  Container(
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
            else

              { print("Success");

                return Container(
                  color: Colors.white70,
                  child: ListView.builder(

                  itemCount: snapshot.data.length,
                      itemBuilder:(BuildContext context,int index){
                    var count=1+index;
                        return Card(
                          color: Color(0xff022946),
                          elevation: 5.0,
                          child: ListTile(

                          //  dense: true,
                            isThreeLine: true,
                            contentPadding: EdgeInsets.all(5.0),
                            title: Text(snapshot.data[index].Statename
                              ,style: TextStyle(color: Colors.white,fontSize: 15.0,fontFamily: 'kalka'),),
                            subtitle: Text("Total  Cases : "+"  "+snapshot.data[index].cases,style: TextStyle(fontFamily: 'kalka',color: Colors.white,fontSize: 14.0),),

                            onTap: (){


                              print("Hello");
                            },
                            leading: Text("$count",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                            enabled: true,
                          ),
                        );
                      } ),
                );}
            },
        ),
      ) ,
    );
  }
}

class Statedata{

  String Statename;
  String cases;

  Statedata(this.Statename,this.cases); // this is the Stateedata
}