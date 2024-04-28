import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  SharedPreferences? _prefs;
  String _data = '';
  late Map<int, String> _sessions;
  final List<String> _dates = [];
  final List<String> _sesh = [];
  int _cardNum = 0;

  @override
  void initState() {
    super.initState();
    _getPrefs();
  }

  Future<void> _resetTime() async {
    await _prefs!.setString('time', '');
  }

  void _getPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _data = _prefs!.getString('time')!;
      _cardNum = ' / '.allMatches(_data).length;
      final split = _data.split('/');

      _sessions = {for (int i = 0; i < split.length; i++) i: split[i]};
      for (int i = 1; i < _sessions.length; i++) {
        _dates.add(_sessions[i]!.split(' ')[2]);
      }
      for (int i = 1; i < _sessions.length; i++) {
        _sesh.add(_sessions[i]!.split(' ')[1]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              backgroundColor: kBackgroundColor,
              title: const Text.rich(
                TextSpan(
                  text: 'History', // text for title
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
              actions: [
                IconButton(
                  padding: const EdgeInsets.only(right: 10.0),
                  icon: const Icon(Icons.delete_outline,
                      color: Colors.black, size: 30),
                  onPressed: () async {
                    bool? delete = await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.black,
                          titleTextStyle: const TextStyle(
                              color: Colors.white, fontSize: 24),
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          title: const Text(
                            'Delete History',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Arial',
                            ),
                          ),
                          content: const Text(
                              'Are you sure you want to delete your ENTIRE session history?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Arial',
                              )),
                          actions: [
                            TextButton(
                              child: const Text('Yes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Arial',
                                  )),
                              onPressed: () => Navigator.of(context).pop(true),
                            ),
                            TextButton(
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial',
                                ),
                              ),
                              onPressed: () => Navigator.of(context).pop(false),
                            ),
                          ],
                        );
                      },
                    );

                    if (delete != null && delete) {
                      // delete the history here
                      setState(() {
                        _data = '';
                        _cardNum = ' / '.allMatches(_data).length;
                        final split = _data.split('/');

                        _sessions = {
                          for (int i = 0; i < split.length; i++) i: split[i]
                        };
                        for (int i = 1; i < _sessions.length; i++) {
                          _dates.add(_sessions[i]!.split(' ')[2]);
                        }
                        for (int i = 1; i < _sessions.length; i++) {
                          _sesh.add(_sessions[i]!.split(' ')[1]);
                        }
                      });
                      _resetTime();
                    }
                  },
                ),
              ],
            ),

            SingleChildScrollView(
                padding: const EdgeInsets.all(5.0),
                physics: const ScrollPhysics(),
                child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _cardNum,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                              width: 5.0,
                              height: 65.0,
                              child: Card(
                                elevation: 15,
                                shadowColor: Colors.grey,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                color: Colors.black,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            _dates[_dates.length - 1 - index],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Arial',
                                            ),
                                          ),
                                          //),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            _sesh[_sesh.length - 1 - index],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontFamily: 'Arial',
                                            ),
                                          ),
                                          //),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }))),

            // other widgets here
          ],
        ),
      ),
    );
  }
}
