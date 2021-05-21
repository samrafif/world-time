import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:world_time/Widgets/GPL-V3_license_table.dart';
import 'package:world_time/Widgets/gradient.dart';

/*
Settings Page
================================================================================
Contains settings and legal information
*/

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String applicationLegalese = 'GNU General Public License v3.0 '
      'Permissions of this strong copyleft license are conditioned'
      ' on making available complete source code of licensed works and modifications,'
      ' which include larger works using a licensed work, under the same license.'
      ' Copyright and license notices must be preserved. Contributors provide an express grant of patent rights.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FlatButton.icon(
            onPressed: () {
              showAboutDialog(
                  context: context,
                  applicationVersion: '1.0',
                  applicationName: 'World Time',
                  applicationIcon: RadiantGradientMask(
                    child: ImageIcon(
                      AssetImage("Assets/Images/Icons/Worldtime_Icon.png"),
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  applicationLegalese: applicationLegalese,
                  children: [
                    FlatButton.icon(
                      onPressed: _launchURL,
                      icon: ImageIcon(
                        AssetImage('Assets/Images/GPL-V3_License_Logo.png'),
                        size: 70,
                        color: Colors.red[900],
                      ),
                      label: Text('GPL License Website'),
                    ),
                    buildTable(),
                  ]);
            }, // ShowAboutDialog()
            icon: Icon(Icons.info),
            label: Text('More Info/Licenses'),
          ),
        ],
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.gnu.org/licenses';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
