import 'dart:convert';

import 'package:http/http.dart';
class coronadata{


  coronadata(this.indianTotalDeaths,this.indianTotalRecovered,this.InTotalConfirmed,this.IndiannewConfirmed);
  // ignore: non_constant_identifier_names
  var IndiannewConfirmed;
  var InTotalConfirmed;
  var indianTotalDeaths;
   var indianTotalRecovered;
  var GlobalNewConfirmed;
  var GlobalTotalConfirmed;
  var GlobalNewDeaths;
  var GlobaleTotalDeaths;
  var GlobalNewRecovered;
  var GlobalTotalRecovered;
  //String ApiUrl="https://pomber.github.io/covid19/timeseries.json";

 // String ApiUrl= "https://api.covid19api.com/dayone/country/india/status/confirmed";
  String ApiUrl="https://api.covid19api.com/summary"; // this is the for all over  world details

  String newAPI="https://api.covid19api.com/live/country/india/status/confirmed";




  Future  fetchdata() async{

    List<dynamic> indiadata=[];

  Response response= await get(ApiUrl);

if(response.statusCode==200)
  {
    var decodeData=jsonDecode(response.body);
 GlobalNewConfirmed=decodeData['Global']['NewConfirmed'];
 GlobalTotalConfirmed =decodeData['Global']['TotalConfirmed'];
 GlobalNewDeaths=decodeData['Global']['NewDeaths'];
 GlobaleTotalDeaths =decodeData['Global']['TotalDeaths'];
 GlobalNewRecovered =decodeData['Global']['NewRecovered'];
 GlobalTotalRecovered=decodeData['Global']['TotalRecovered'];

 ////////////////////////////////
    // indian data fetch
    //////////////////////
 var indiannewconformed=decodeData['Countries'][100]['Country'];

 var IndianNewDeath;
 //=decodeData['Countries'][101]['NewDeaths'];
 var IndianTotalDeaths;
 //=decodeData['Countries'][101]['TotalDeaths'];
 var IndianTotalRecovered;
 //=decodeData['Countries'][101]['TotalRecovered'];

///  here fetch all json data....

    ///
    ///
  // var alljson=decodeData.toString();
    //print(decodeData);

    var rest = decodeData["Countries"];
    //print("hello");
//    print(indiannewconformed);
    int postion=0;
    for(int i=0;i<120;i++)
      {
        if(decodeData['Countries'][i]['Country']=="India")
          {
            //print(decodeData["Countries"][i]['Country']);

            IndiannewConfirmed=decodeData['Countries'][i]['NewConfirmed']; // this is the for new confirmed case in india..
            indiadata.add(IndiannewConfirmed);
            InTotalConfirmed=decodeData['Countries'][i]['TotalConfirmed'];
            indiadata.add(InTotalConfirmed);
            indianTotalDeaths=decodeData['Countries'][i]['TotalDeaths'];
            indiadata.add(indianTotalDeaths);
            indianTotalRecovered=decodeData['Countries'][i]['TotalRecovered'];
            indiadata.add(indianTotalRecovered);
            postion=i;
            print("Matched");
          }
      }
//    print(postion);
//    print(IndiannewConfirmed);
    /// Adding data into list
    // indiadata.add(indiannewconformed);

 //var date=decodeData[71]['Date'];
// var date=decodeData[0];
    var success="success";
   // print(price);
   // print(CountryCode);
//
    /// this is the form  glebal
    print("NewConfirmed $GlobalNewConfirmed");
    print("TotalConfirmed $GlobalTotalConfirmed");
    print("New Death $GlobalNewDeaths");
    print("Total Death $GlobaleTotalDeaths");
    print("New Recoverd $GlobalNewRecovered");
    print("TotalRecoverd $GlobalTotalRecovered");

    print("***************");
    /// this is the for the Indian
    print("Indian country $indiannewconformed");
    print("Indian new Confirmed$IndiannewConfirmed");
    print("Indian Total Confirmed $InTotalConfirmed");
   // print("Indian New Death $IndianNewDeath");
    print("Indian Total Death $indianTotalDeaths");
    print("Indian Total Recovers$indianTotalRecovered");
    print("");
    //print(indiadata);
   // return indiadata;

  }
else{
  //return "failed";
  print(response.statusCode);
}

  }



}