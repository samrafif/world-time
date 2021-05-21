import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*
Home Page
================================================================================
Shows the time of location selected, has buttons to choose_location page and
settings page
*/

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    print('(home.dart)VAR_DUMP-data $data');
    String bgImage = data['isDaytime'] ? 'Daytime_Image.jpg' : 'Night_Image.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue[900] : Colors.indigo[900];
    Color txtColor = data['isDaytime'] ? Colors.black : Colors.white;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(child:
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/Images/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
              children: [
                FlatButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/settings');
                    },
                    icon: Icon(
                        Icons.settings,
                        color: txtColor,
                    ),
                    label: Text(
                        'Settings',
                        style: TextStyle(
                        color: txtColor
                    ),
                    )
                ),
                FlatButton.icon(
                    onPressed: () async {
                    dynamic result =  await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag']
                      };
                    });
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: txtColor,
                    ),
                    label: Text(
                        "Edit Location",
                        style: TextStyle(
                          color: txtColor
                        ),
                    ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: txtColor
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 66.0,
                      color: txtColor
                  ),
                )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
