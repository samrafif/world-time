import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/State/app_state.dart';


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

    final routeData = ModalRoute.of(context)?.settings.arguments as Map?;
    data = data.isNotEmpty ? data : (routeData ?? {});

    print('(home.dart)VAR_DUMP-data $data');
    String bgImage = (data['isDaytime'] ?? false) ? 'Daytime_Image.jpg' : 'Night_Image.jpg';
    Color bgColor = (data['isDaytime'] ?? false) ? Colors.blue[900]! : Colors.indigo[900]!;
    Color txtColor = (data['isDaytime'] ?? false) ? Colors.black : Colors.white;


    final appState = Provider.of<AppState>(context);

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
                // Simple state-managed controls
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Text('Counter: ${appState.counter}', style: TextStyle(color: txtColor)),
                      Row(
                        children: [
                          Text('Dark', style: TextStyle(color: txtColor)),
                          Switch(
                            value: appState.darkMode,
                            onChanged: (_) => appState.toggleDarkMode(),
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.0),
                TextButton.icon(
                    style: TextButton.styleFrom(foregroundColor: txtColor),
                    onPressed: (){
                      Navigator.pushNamed(context, '/settings');
                    },
                    icon: Icon(
                        Icons.settings,
                        color: txtColor,
                    ),
                    label: Text('Settings')
                ),
                TextButton.icon(
                    style: TextButton.styleFrom(foregroundColor: txtColor),
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
                    label: Text("Edit Location")
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<AppState>(context, listen: false).increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
