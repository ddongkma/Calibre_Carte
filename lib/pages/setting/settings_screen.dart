

import 'package:calibre_carte/pages/about_us/about_us.dart';
import 'package:calibre_carte/pages/setting/widgets/cloud_settings.dart';
import 'package:calibre_carte/pages/setting/widgets/dark_mode_toggle.dart';
import 'package:calibre_carte/pages/setting/widgets/directorychange_button.dart';
import 'package:calibre_carte/pages/setting/widgets/search_dropdown.dart';
import 'package:calibre_carte/providers/color_theme_provider.dart';

import 'package:calibre_carte/providers/update_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../instruction/instructions_screen.dart';
import '../license/license.dart';
import '../privacy_police/privacy_policy.dart';

class SettingsNew extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsNewState createState() => _SettingsNewState();
}

class _SettingsNewState extends State<SettingsNew> {
  late SharedPreferences _prefs;
  late bool darkMode;
  late Future myFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFuture = SharedPreferences.getInstance();
    myFuture.then((sp) {
      _prefs = sp;
      darkMode = sp.getBool('darkMode') ?? false;
    });
  }

  void saveBoolToSharedPrefs(String settingName, bool val) {
    _prefs.setBool(settingName, val);
  }

  void saveStringToSP(String settingName, String val) {
    _prefs.setString(settingName, val);
  }

  Widget _settingGroup(groupName) {
    return Container(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          groupName,
          style: const TextStyle(
              fontFamily: 'Montserrat', color: Colors.grey, fontSize: 20),
        ));
  }
  textScaleFactor(BuildContext context) {
    if (MediaQuery.of(context).size.height > 610) {
      return MediaQuery.of(context).textScaleFactor.clamp(0.6, 1.0);
    } else {
      return MediaQuery.of(context).textScaleFactor.clamp(0.6, 0.85);
    }
  }
  @override
  Widget build(BuildContext context) {
    Update update = Provider.of(context);
    ColorTheme colorTheme = Provider.of(context);
    Widget loadingWidget = const Center(
      child: CircularProgressIndicator(),
    );
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
          textScaleFactor:
              textScaleFactor(context)),
      child: Scaffold(
        backgroundColor: colorTheme.settingsBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          elevation: 0.0,
          backgroundColor: colorTheme.appBarColor,
          title: const Text(
            'Settings',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
            ),
          ),
        ),
        body: FutureBuilder(
          future: myFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
//                print('THe connection finished now');
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20,),
                      _settingGroup("Cloud"),
                      CloudSettings(),
                      _settingGroup("Search"),
                      SearchDropdown(),
                      _settingGroup("Appearance"),
                      DarkMode(),
                      _settingGroup("Download Directory"),
                      Theme(
                          data: ThemeData(primaryColor: Color(0xffFED962)),
                          child: DirectoryChange()),
                      _settingGroup("Help"),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return AboutUs();
                          }));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 16, bottom: 0, top: 10),
                          child: Container(
                            padding: EdgeInsets.only(top: 4),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.help_outline,
                                  color:colorTheme.settingsIcon,
                                ),
                                const SizedBox(width: 10,),
                                Text(" About Calibre Carte",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                        color: colorTheme.headerText))
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PrivacyPolicy();
                          }));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 16, bottom: 0, top: 10),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.help_outline,
                                  color: colorTheme.settingsIcon,
                                ),
                                const SizedBox(width: 10,),
                                Text(" Privacy Policy",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                        color: colorTheme.headerText))
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Instructions();
                          }));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 16, bottom: 0, top: 10),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.help_outline,
                                  color: colorTheme.settingsIcon,
                                ),
                                const SizedBox(width: 10,),
                                Text(" Usage Instructions",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                        color: colorTheme.headerText))
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return License();}));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 16, top: 10),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.info_outline,
                                  color: colorTheme.settingsIcon,
                                ),
                                const SizedBox(width: 10,),
                                Text(" License",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                        color: colorTheme.headerText))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
//                print('The connection hasn\'t finsihed yet');
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
