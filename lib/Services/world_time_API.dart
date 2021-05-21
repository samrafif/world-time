import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location name for the UI
  String time; //the time in the location
  String flag; //url to an asset flag icon
  String urlLoc; //the location url for the API endpoint
  bool isDaytime; //true or false if daytime or not

  WorldTime({ this.location, this.flag, this.urlLoc});

  Future<void> getTime() async {

    try {
      //Make the request to the API
      Response response = await get('http://worldtimeapi.org/api/timezone/$urlLoc');
      Map data = jsonDecode(response.body);
        /*
      Debug:
      print(data)
      */

      //Get properties from data
      String dateTime = data['datetime'];
      String utcOfset = data['utc_offset'].substring(1,3);
        /*
      debug:
      print(dateTime);
      print(utcOfset);
      */

      //Create datetime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(utcOfset)));

      //Set the time property
      isDaytime = now.hour > 5 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e){
      print('Error Caught: $e');
      time = 'Oops something went wrong while fetching data from the API';
    }

  }

}