import 'dart:convert';

import 'package:corona_update/APIData/Corona_Data.dart';
import 'package:http/http.dart';

String newAPI="https://api.covid19api.com/live/country/india/status/confirmed";

var IndiannewConfirmed;
var InTotalConfirmed;
var indianTotalDeaths;
var indianTotalRecovered;
 // this is the for india..
Future<List<coronadata>> _newAPi() async
{


  Response response= await get(newAPI);
  int size=0;
  List<coronadata> corona_details_list=[]; // this is the List Where all data will be stored...

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

  coronadata coronaobject=coronadata(indianTotalDeaths,indianTotalRecovered,InTotalConfirmed,IndiannewConfirmed); // this is constucter of the corona class..
    corona_details_list.add(coronaobject);

  }
  return corona_details_list; // this method return the coron details list..


}
