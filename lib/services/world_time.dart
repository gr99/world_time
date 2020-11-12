import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location,this.url,this.flag});

  Future<void>getTime()async{
    try{
      Response response=await get('https://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);
      // print(data);

      //get properties from the data
      String dateTime=data['datetime'];
      String offset=data['utc_offset'];
      String hour=offset.substring(1,3);
      String minute=offset.substring(4,6);
      // print(minute);

      // decoding the date time into normal form..
      DateTime now=DateTime.parse(dateTime);
      now=now.add(Duration(hours: int.parse(hour),minutes: int.parse(minute)));
      isDaytime=now.hour>6&&now.hour<19? true:false;
      // print(now);
      time=time=DateFormat.jm().format(now);
    }catch(e){
      time="Enter Correct location";
    }



  }
}