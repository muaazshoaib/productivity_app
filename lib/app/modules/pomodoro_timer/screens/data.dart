// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../utils/colors.dart';

// class Data extends StatefulWidget {
//   const Data({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _DataState();
//   }
// }

// class _DataState extends State<Data> {
//   SharedPreferences? _prefs;
//   final String _data = '';
//   late Map<int, String> _sessions;
//   final List<String> _dates = [];
//   final List<String> _sesh = [];
//   int _totalMin = 0;
//   int _longestSesh = 0;
//   int _seshNum = 0;
//   double _avgSesh = 0;

//   @override
//   void initState() {
//     super.initState();
//     _getPrefs();
//   }

//   // ignore: unused_element
//   Future<void> _resetTime() async {
//     await _prefs!.setString('time', '');
//   }

//   void _getPrefs() async {
//     _prefs = await SharedPreferences.getInstance();
//     setState(() {
//       // _data = _prefs!.getString('time')!;
//       final split = _data.split('/');

//       _sessions = {for (int i = 0; i < split.length; i++) i: split[i]};
//       for (int i = 1; i < _sessions.length; i++) {
//         _dates.add(_sessions[i]!.split(' ')[2]);
//       }
//       for (int i = 1; i < _sessions.length; i++) {
//         _sesh.add(_sessions[i]!.split(' ')[1]);
//         _totalMin += int.parse(_sessions[i]!.split(' ')[1]);
//         _seshNum++;
//         if (int.parse(_sessions[i]!.split(' ')[1]) > _longestSesh) {
//           _longestSesh = int.parse(_sessions[i]!.split(' ')[1]);
//         }
//       }
//       _avgSesh = _totalMin / _seshNum;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: kBackgroundColor,
//         // padding: const EdgeInsets.all(20.0),
//         appBar: AppBar(
//           title: const Text("Pomodoro Analytics"),
//         ),
//         body: SizedBox(
//             width: 600,
//             height: 600,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(25.0),
//                   child: GridView(
//                     shrinkWrap: true,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 2,
//                       mainAxisSpacing: 0,
//                     ),
//                     children: [
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(45.0),
//                         ),
//                         clipBehavior: Clip.antiAlias,
//                         color: kBackgroundColor,
//                         // shadowColor: Colors.grey,
//                         elevation: 15,
//                         child: Padding(
//                           padding: const EdgeInsets.all(26.0),
//                           child: Column(
//                             children: [
//                               const Icon(
//                                 Icons.access_time_filled_outlined,
//                                 color: Colors.black,
//                                 size: 40,
//                               ),
//                               Text(_totalMin.toString(),
//                                   style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'Arial')),
//                               const Text('Total minutes',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                       fontFamily: 'Arial',
//                                       fontStyle: FontStyle.italic)),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(45.0),
//                         ),
//                         clipBehavior: Clip.antiAlias,
//                         color: kBackgroundColor,
//                         shadowColor: Colors.black,
//                         elevation: 15,
//                         child: Padding(
//                           padding: const EdgeInsets.all(26.0),
//                           child: Column(
//                             children: [
//                               const Icon(
//                                 Icons.emoji_events,
//                                 color: Colors.black,
//                                 size: 40,
//                               ),
//                               Text(_longestSesh.toString(),
//                                   style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'Arial')),
//                               const Text('Longest session',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                       fontFamily: 'Arial',
//                                       fontStyle: FontStyle.italic)),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(45.0),
//                         ),
//                         clipBehavior: Clip.antiAlias,
//                         color: kBackgroundColor,
//                         //shadowColor: kBackgroundColor,
//                         elevation: 15,
//                         child: Padding(
//                           padding: const EdgeInsets.all(26.0),
//                           child: Column(
//                             children: [
//                               const Icon(
//                                 Icons.calendar_month_rounded,
//                                 color: Colors.black,
//                                 size: 40,
//                               ),
//                               Text(_seshNum.toString(),
//                                   style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'Arial')),
//                               const Text('No of sessions',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                       fontFamily: 'Arial',
//                                       fontStyle: FontStyle.italic)),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25.0),
//                         ),
//                         clipBehavior: Clip.antiAlias,
//                         color: kBackgroundColor,
//                         shadowColor: Colors.black,
//                         elevation: 15,
//                         child: Padding(
//                           padding: const EdgeInsets.all(26.0),
//                           child: Column(
//                             children: [
//                               const Icon(
//                                 Icons.bar_chart_rounded,
//                                 color: Colors.black,
//                                 size: 40,
//                               ),
//                               Text(
//                                   double.parse((_avgSesh).toStringAsFixed(2))
//                                       .toString(),
//                                   style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'Arial')),
//                               const Text('Avg session time',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                       fontFamily: 'Arial',
//                                       fontStyle: FontStyle.italic)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )));
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DataState();
  }
}

class _DataState extends State<Data> {
  SharedPreferences? _prefs;
  String _data = '';
  late Map<int, String> _sessions;
  final List<String> _dates = [];
  final List<String> _sesh = [];
  int _totalMin = 0;
  int _longestSesh = 0;
  int _seshNum = 0;
  double _avgSesh = 0;

  @override
  void initState() {
    super.initState();
    _getPrefs();
  }

  // ignore: unused_element
  Future<void> _resetTime() async {
    await _prefs!.setString('time', '');
  }

  void _getPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _data = _prefs!.getString('time')!;
      final split = _data.split('/');

      _sessions = {for (int i = 0; i < split.length; i++) i: split[i]};
      for (int i = 1; i < _sessions.length; i++) {
        _dates.add(_sessions[i]!.split(' ')[2]);
      }
      for (int i = 1; i < _sessions.length; i++) {
        _sesh.add(_sessions[i]!.split(' ')[1]);
        _totalMin += int.parse(_sessions[i]!.split(' ')[1]);
        _seshNum++;
        if (int.parse(_sessions[i]!.split(' ')[1]) > _longestSesh) {
          _longestSesh = int.parse(_sessions[i]!.split(' ')[1]);
        }
      }
      _avgSesh = _totalMin / _seshNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // padding: const EdgeInsets.all(20.0),
      appBar: AppBar(
        title: const Text(
          "Pomodoro Analytics",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: 600,
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 0,
                ),
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    // color: Colors.black,
                    // shadowColor: Colors.greenAccent,
                    elevation: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.access_time_filled_outlined,
                            // color: Colors.greenAccent,
                            size: 50,
                          ),
                          Text(
                            _totalMin.toString(),
                            style: const TextStyle(
                              // color: Colors.greenAccent,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Arial',
                            ),
                          ),
                          const Text(
                            'total minutes',
                            style: TextStyle(
                              // color: Colors.greenAccent,
                              fontSize: 12,
                              // fontFamily: 'Arial',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    // color: Colors.black,
                    // shadowColor: Colors.greenAccent,
                    elevation: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.emoji_events,
                            // color: Colors.greenAccent,
                            size: 50,
                          ),
                          Text(
                            _longestSesh.toString(),
                            style: const TextStyle(
                              // color: Colors.greenAccent,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Arial',
                            ),
                          ),
                          const Text(
                            'longest session',
                            style: TextStyle(
                              // color: Colors.greenAccent,
                              fontSize: 12,
                              // fontFamily: 'Arial',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    // color: Colors.black,
                    // shadowColor: Colors.greenAccent,
                    elevation: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded,
                            // color: Colors.greenAccent,
                            size: 50,
                          ),
                          Text(
                            _seshNum.toString(),
                            style: const TextStyle(
                              // color: Colors.greenAccent,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Arial',
                            ),
                          ),
                          const Text(
                            'number of sessions',
                            style: TextStyle(
                              // color: Colors.greenAccent,
                              fontSize: 12,
                              // fontFamily: 'Arial',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    // color: Colors.black,
                    // shadowColor: Colors.greenAccent,
                    elevation: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.bar_chart_rounded,
                            // color: Colors.greenAccent,
                            size: 50,
                          ),
                          Text(
                            double.parse((_avgSesh).toStringAsFixed(2))
                                .toString(),
                            style: const TextStyle(
                              // color: Colors.greenAccent,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Arial',
                            ),
                          ),
                          const Text(
                            'avg session time',
                            style: TextStyle(
                              // color: Colors.greenAccent,
                              fontSize: 12,
                              // fontFamily: 'Arial',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
