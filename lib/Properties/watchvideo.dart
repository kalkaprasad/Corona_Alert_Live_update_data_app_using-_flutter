import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:youtube_player/youtube_player.dart';

void watchVideo(BuildContext context) async
{
  Alert(
      title: "Covide-19",
      context: context,
      style:AlertStyle(titleStyle: TextStyle(color: Colors.red),descStyle: TextStyle(fontWeight: FontWeight.bold),animationDuration: Duration(milliseconds: 300),animationType: AnimationType.grow),
     // desc: "Stay Home, Stay Safe.",
      content:
          Row(
//            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              new  ///
                  /// LOW = 240p
                  /// MEDIUM = 360p
                  /// HIGH = 480p
                  /// HD = 720p
                  /// FHD = 1080p
                  /// "source" can be either youtube video ID or link.
                  /// "showThumbnail" Default is true.
                  /// "acpectRatio" Default is 16/9
                  ///
                  YoutubePlayer(
                    // placeHolder: new Text("Corona"),
                    source: "https://youtu.be/sHP0UIdZyI4",
                    quality: YoutubeQuality.LOW,
                    aspectRatio: 10/8,
                    //aspectRatio:5/5,
                    loop: false,
                    bufferedColor: Colors.teal,
                    showThumbnail: false,
                  ),
            ],
          ),
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
Widget images()
{
  return new Image(
      image:
      NetworkImage("https://img.icons8.com/cute-clipart/2x/home.png")
  );
}
