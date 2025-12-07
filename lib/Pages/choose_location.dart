import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time_API.dart';

/*
Choose Location Page
================================================================================
Contains location prefrences (Change time location thru this page)
*/
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

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(urlLoc: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urlLoc: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urlLoc: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urlLoc: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlLoc: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urlLoc: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urlLoc: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urlLoc: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //Navigate to homescreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('Assets/Images/Flags/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
