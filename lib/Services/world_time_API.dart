import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location name for the UI
  late String time; //the time in the location
  String flag; //url to an asset flag icon
  String urlLoc; //the location url for the API endpoint
  late bool isDaytime; //true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.urlLoc});

  Future<void> getTime() async {

    try {
      //Make the request to the API
      print('Fetching time data for $urlLoc from World Time API');
      Response response = await get(
        Uri.parse('https://world-time-api3.p.rapidapi.com/timezone/$urlLoc'),
        headers: {
          'x-rapidapi-host': 'world-time-api3.p.rapidapi.com',
          'x-rapidapi-key': '6db8a934famsha575d2f9672a7aep14ceb7jsn4a7045f02f14'
            });
      Map data = jsonDecode(response.body);
        /*
      Debug:
      */
      print(data);

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
// # [01:22.201] Rebooting soon as I am a-a-able
// # [01:26.109] Every other day, I'm wonderin'
// # [01:29.834] "What's a human being gotta be like?
// # [01:33.659] What's a way to just be competent?"
// # [01:36.774] These sweet instincts ruin my life
// # [01:39.585] Every other day, I'm wonderin'
// # [01:43.681] "Was it a mistake to try and define
// # [01:47.559] What I'm certain's mad incompetence?"
// # [01:51.097] These sweet instincts ruin my life
// # [01:54.676] Da-da-da-da-da-da, da-da-da
// # [01:58.222] Da-da-da-da-da-da, da-da-da, da
// # [02:01.822] Da-da-da-da-da-da, da-da-da
// # [02:05.255] These sweet instincts ruin my life
// # [02:08.919] Da-da-da-da-da-da, da-da-da
// # [02:12.476] Da-da-da-da-da-da, da-da-da, da
// # [02:15.967] Da-da-da-da-da-da, da-da-da
// # [02:19.526] These sweet instincts ruin my life