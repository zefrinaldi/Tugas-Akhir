// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:linear_progress_bar/linear_progress_bar.dart';

// // class PlayersDetail extends StatefulWidget {
// //   const PlayersDetail({super.key, required this.id});
// //   final int id;

// //   @override
// //   State<PlayersDetail> createState() => _PlayersDetailState();
// // }

// // class _PlayersDetailState extends State<PlayersDetail> {
// //   // List listData = [];
// //   Map<String, dynamic>? playerData;

// //   Future getDetailPlayerById() async {
// //     var response = await rootBundle.loadString("assets/male_players.json.json");
// //     var jsonData = await jsonDecode(response);
// //     List tempList = jsonData;
// //     tempList.forEach((element) {
// //       if (element["player_id"] == widget.id) {
// //         playerData = element;
// //       }
// //     });

// //     return playerData;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Players Detail"),
// //         centerTitle: true,
// //         backgroundColor: Colors.blue,
// //       ),
// //       body: FutureBuilder(
// //         future: getDetailPlayerById(),
// //         builder: (context, snapshot) {
// //           if (snapshot.hasData) {
// //             return Padding(
// //               padding: const EdgeInsets.all(10),
// //               child: Column(
// //                 children: [
// //                   Text(snapshot.data!["long_name"]),
// //                   Divider(),
// //                   SizedBox(
// //                     height: 400,
// //                     child: ListView(
// //                       shrinkWrap: true,
// //                       children: [
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Expanded(
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text("Pace: ${snapshot.data!["pace"]}"),
// //                                   Text(
// //                                       "Acceleration: ${snapshot.data!["movement_acceleration"]}"),
// //                                   LinearProgressBar(
// //                                     maxSteps: 100,
// //                                     progressType:
// //                                         LinearProgressBar.progressTypeLinear,
// //                                     currentStep:
// //                                         snapshot.data!["movement_acceleration"],
// //                                     progressColor: Colors.amber,
// //                                     backgroundColor: Colors.grey,
// //                                   ),
// //                                   Text(
// //                                       "Sprint Speed: ${snapshot.data!["movement_sprint_speed"]}"),
// //                                   LinearProgressBar(
// //                                     maxSteps: 100,
// //                                     progressType:
// //                                         LinearProgressBar.progressTypeLinear,
// //                                     currentStep:
// //                                         snapshot.data!["movement_sprint_speed"],
// //                                     progressColor: Colors.amber,
// //                                     backgroundColor: Colors.grey,
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                             SizedBox(
// //                               width: 50,
// //                             ),
// //                             Expanded(
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                       "Shooting: ${snapshot.data!["shooting"]}"),
// //                                   Text(
// //                                       "Positioning: ${snapshot.data!["mentality_positioning"]}"),
// //                                   LinearProgressBar(
// //                                     maxSteps: 100,
// //                                     progressType:
// //                                         LinearProgressBar.progressTypeLinear,
// //                                     currentStep:
// //                                         snapshot.data!["mentality_positioning"],
// //                                     progressColor: Colors.amber,
// //                                     backgroundColor: Colors.grey,
// //                                   ),
// //                                   Text(
// //                                       "Finishing: ${snapshot.data!["attacking_finishing"]}"),
// //                                   LinearProgressBar(
// //                                     maxSteps: 100,
// //                                     progressType:
// //                                         LinearProgressBar.progressTypeLinear,
// //                                     currentStep:
// //                                         snapshot.data!["attacking_finishing"],
// //                                     progressColor: Colors.amber,
// //                                     backgroundColor: Colors.grey,
// //                                   ),
// //                                   Text(
// //                                       "Shot Power: ${snapshot.data!["power_shot_power"]}"),
// //                                   LinearProgressBar(
// //                                     maxSteps: 100,
// //                                     progressType:
// //                                         LinearProgressBar.progressTypeLinear,
// //                                     currentStep:
// //                                         snapshot.data!["power_shot_power"],
// //                                     progressColor: Colors.amber,
// //                                     backgroundColor: Colors.grey,
// //                                   ),
// //                                   Text(
// //                                       "Long Shots: ${snapshot.data!["power_long_shots"]}"),
// //                                   LinearProgressBar(
// //                                     maxSteps: 100,
// //                                     progressType:
// //                                         LinearProgressBar.progressTypeLinear,
// //                                     currentStep:
// //                                         snapshot.data!["power_long_shots"],
// //                                     progressColor: Colors.amber,
// //                                     backgroundColor: Colors.grey,
// //                                   ),
// //                                   Text(
// //                                       "Volleys: ${snapshot.data!["attacking_volleys"]}"),
// //                                   LinearProgressBar(
// //                                     maxSteps: 100,
// //                                     progressType:
// //                                         LinearProgressBar.progressTypeLinear,
// //                                     currentStep:
// //                                         snapshot.data!["attacking_volleys"],
// //                                     progressColor: Colors.amber,
// //                                     backgroundColor: Colors.grey,
// //                                   ),
// //                                   Text(
// //                                       "Penalties: ${snapshot.data!["mentality_penalties"]}"),
// //                                   LinearProgressBar(
// //                                     maxSteps: 100,
// //                                     progressType:
// //                                         LinearProgressBar.progressTypeLinear,
// //                                     currentStep:
// //                                         snapshot.data!["mentality_penalties"],
// //                                     progressColor: Colors.amber,
// //                                     backgroundColor: Colors.grey,
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         )
// //                       ],
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             );
// //           } else if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           } else {
// //             print("Can't load data");
// //           }
// //           return const Center(child: CircularProgressIndicator());
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:linear_progress_bar/linear_progress_bar.dart';

// class PlayersDetail extends StatefulWidget {
//   const PlayersDetail({super.key, required this.id});
//   final String id;

//   @override
//   State<PlayersDetail> createState() => _PlayersDetailState();
// }

// class _PlayersDetailState extends State<PlayersDetail> {
//   // List listData = [];
//   dynamic? playerData;
//   // Future getDetailPlayerById() async {
//   //   var response = await rootBundle.loadString("assets/male_players.json.json");
//   //   var jsonData = await jsonDecode(response);
//   //   List tempList = jsonData;
//   //   tempList.forEach((element) {
//   //     if (element["player_id"] == widget.id) {
//   //       playerData = element;
//   //     }
//   //   });

//   //   return playerData;
//   // }
//   void getDataFromFirebase() async {
//     final databaseRef = FirebaseDatabase.instance.ref().child(widget.id);
//     databaseRef.onValue.listen((event) {
//       setState(() {
//         playerData = event.snapshot.value;
//       });
//     });
//   }

//   void initState() {
//     super.initState();
//     getDataFromFirebase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Players Detail"),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: playerData == null
//           ? Center(
//               child: Text("Data Not Found"),
//             )
//           : Center(
//               child: Column(
//                 children: [
//                   Text(playerData?["long_name"]),
//                   Text("Pace: ${playerData?["pace"]}"),
//                   Text("Shooting: ${playerData?["shooting"]}"),
//                   Text("Dribling: ${playerData?["dribbling"]}"),
//                 ],
//               ),
//             ),
//       // body: FutureBuilder(
//       //   future: getDetailPlayerById(),
//       //   builder: (context, snapshot) {
//       //     if (snapshot.hasData) {
//       //       return Padding(
//       //         padding: const EdgeInsets.all(10),
//       //         child: Column(
//       //           children: [
//       //             Text(snapshot.data!["long_name"]),
//       //             Divider(),
//       //             SizedBox(
//       //               height: 400,
//       //               child: ListView(
//       //                 shrinkWrap: true,
//       //                 children: [
//       //                   Row(
//       //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //                     children: [
//       //                       Expanded(
//       //                         child: Column(
//       //                           crossAxisAlignment: CrossAxisAlignment.start,
//       //                           children: [
//       //                             Text("Pace: ${snapshot.data!["pace"]}"),
//       //                             Text(
//       //                                 "Acceleration: ${snapshot.data!["movement_acceleration"]}"),
//       //                             LinearProgressBar(
//       //                               maxSteps: 100,
//       //                               progressType:
//       //                                   LinearProgressBar.progressTypeLinear,
//       //                               currentStep:
//       //                                   snapshot.data!["movement_acceleration"],
//       //                               progressColor: Colors.amber,
//       //                               backgroundColor: Colors.grey,
//       //                             ),
//       //                             Text(
//       //                                 "Sprint Speed: ${snapshot.data!["movement_sprint_speed"]}"),
//       //                             LinearProgressBar(
//       //                               maxSteps: 100,
//       //                               progressType:
//       //                                   LinearProgressBar.progressTypeLinear,
//       //                               currentStep:
//       //                                   snapshot.data!["movement_sprint_speed"],
//       //                               progressColor: Colors.amber,
//       //                               backgroundColor: Colors.grey,
//       //                             ),
//       //                           ],
//       //                         ),
//       //                       ),
//       //                       SizedBox(
//       //                         width: 50,
//       //                       ),
//       //                       Expanded(
//       //                         child: Column(
//       //                           crossAxisAlignment: CrossAxisAlignment.start,
//       //                           children: [
//       //                             Text(
//       //                                 "Shooting: ${snapshot.data!["shooting"]}"),
//       //                             Text(
//       //                                 "Positioning: ${snapshot.data!["mentality_positioning"]}"),
//       //                             LinearProgressBar(
//       //                               maxSteps: 100,
//       //                               progressType:
//       //                                   LinearProgressBar.progressTypeLinear,
//       //                               currentStep:
//       //                                   snapshot.data!["mentality_positioning"],
//       //                               progressColor: Colors.amber,
//       //                               backgroundColor: Colors.grey,
//       //                             ),
//       //                             Text(
//       //                                 "Finishing: ${snapshot.data!["attacking_finishing"]}"),
//       //                             LinearProgressBar(
//       //                               maxSteps: 100,
//       //                               progressType:
//       //                                   LinearProgressBar.progressTypeLinear,
//       //                               currentStep:
//       //                                   snapshot.data!["attacking_finishing"],
//       //                               progressColor: Colors.amber,
//       //                               backgroundColor: Colors.grey,
//       //                             ),
//       //                           ],
//       //                         ),
//       //                       ),
//       //                     ],
//       //                   )
//       //                 ],
//       //               ),
//       //             )
//       //           ],
//       //         ),
//       //       );
//       //     } else if (snapshot.connectionState == ConnectionState.waiting) {
//       //       return const Center(
//       //         child: CircularProgressIndicator(),
//       //       );
//       //     } else {
//       //       print("Can't load data");
//       //     }
//       //     return const Center(child: CircularProgressIndicator());
//       //   },
//       // ),
//     );
//   }
// }

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class PlayersDetail extends StatefulWidget {
  const PlayersDetail({super.key, required this.id});
  final String id;

  @override
  State<PlayersDetail> createState() => _PlayersDetailState();
}

class _PlayersDetailState extends State<PlayersDetail> {
  dynamic playerData;
  void getDataFromFirebase() async {
    final databaseRef = FirebaseDatabase.instance.ref().child(widget.id);
    databaseRef.onValue.listen((event) {
      setState(() {
        playerData = event.snapshot.value;
      });
      print(playerData);
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Players Detail"),
        backgroundColor: Colors.blue,
      ),
      body: playerData == null
          ? const Center(
              child: Text("Data Not Found"),
            )
          : Center(
              child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(playerData['long_name']),
                  Text("Positions: ${playerData['player_positions']}"),
                  Text("Overall: ${playerData['overall']}"),
                  Text("Age: ${playerData['age']}"),
                  Text("Height: ${playerData['height_cm']} cm"),
                  Text("Weight: ${playerData['weight_kg']} kg"),
                  Text("Nation: ${playerData['nationality_name']}"),
                  Text("Preferred Foot: ${playerData['preferred_foot']}"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Pace: ${playerData['pace']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Shooting: ${playerData['shooting']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Acceleration: ${playerData['movement_acceleration']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Positioning: ${playerData['mentality_positioning']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          // minHeight: 50,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['movement_acceleration'],
                          progressColor: (playerData['movement_acceleration'] >
                                      70 &&
                                  playerData['movement_acceleration'] <= 100)
                              ? Colors.green
                              : (playerData['movement_acceleration'] > 50 &&
                                      playerData['movement_acceleration'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      // if (playerData['movement_acceleration'] > 70 && playerData['movement_acceleration'] <= 100) {
                      //   colorBar = Colors.green;
                      // },

                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          // minHeight: 50,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['mentality_positioning'],
                          progressColor: (playerData['mentality_positioning'] >
                                      70 &&
                                  playerData['mentality_positioning'] <= 100)
                              ? Colors.green
                              : (playerData['mentality_positioning'] > 50 &&
                                      playerData['mentality_positioning'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Sprint Speed: ${playerData['movement_sprint_speed']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Finishing: ${playerData['attacking_finishing']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['movement_sprint_speed'],
                          progressColor: (playerData['movement_sprint_speed'] >
                                      70 &&
                                  playerData['movement_sprint_speed'] <= 100)
                              ? Colors.green
                              : (playerData['movement_sprint_speed'] > 50 &&
                                      playerData['movement_sprint_speed'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['attacking_finishing'],
                          progressColor: (playerData['attacking_finishing'] >
                                      70 &&
                                  playerData['attacking_finishing'] <= 100)
                              ? Colors.green
                              : (playerData['attacking_finishing'] > 50 &&
                                      playerData['attacking_finishing'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      Expanded(
                        child: Text(
                            "Shot Power: ${playerData['power_shot_power']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['power_shot_power'],
                          progressColor: (playerData['power_shot_power'] > 70 &&
                                  playerData['power_shot_power'] <= 100)
                              ? Colors.green
                              : (playerData['power_shot_power'] > 50 &&
                                      playerData['power_shot_power'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      Expanded(
                        child: Text(
                            "Long Shots: ${playerData['power_long_shots']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['power_long_shots'],
                          progressColor: (playerData['power_long_shots'] > 70 &&
                                  playerData['power_long_shots'] <= 100)
                              ? Colors.green
                              : (playerData['power_long_shots'] > 50 &&
                                      playerData['power_long_shots'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      Expanded(
                        child:
                            Text("Volleys: ${playerData['attacking_volleys']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['attacking_volleys'],
                          progressColor:
                              (playerData['attacking_volleys'] > 70 &&
                                      playerData['attacking_volleys'] <= 100)
                                  ? Colors.green
                                  : (playerData['attacking_volleys'] > 50 &&
                                          playerData['attacking_volleys'] <= 70)
                                      ? Colors.amber
                                      : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      Expanded(
                        child: Text(
                            "Penalties: ${playerData['mentality_penalties']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['mentality_penalties'],
                          progressColor: (playerData['mentality_penalties'] >
                                      70 &&
                                  playerData['mentality_penalties'] <= 100)
                              ? Colors.green
                              : (playerData['mentality_penalties'] > 50 &&
                                      playerData['mentality_penalties'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Passing: ${playerData['passing']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Dribbling: ${playerData['dribbling']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child:
                            Text("Vision: ${playerData['mentality_vision']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child:
                            Text("Agility: ${playerData['movement_agility']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['mentality_vision'],
                          progressColor: (playerData['mentality_vision'] > 70 &&
                                  playerData['mentality_vision'] <= 100)
                              ? Colors.green
                              : (playerData['mentality_vision'] > 50 &&
                                      playerData['mentality_vision'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['movement_agility'],
                          progressColor: (playerData['movement_agility'] > 70 &&
                                  playerData['movement_agility'] <= 100)
                              ? Colors.green
                              : (playerData['movement_agility'] > 50 &&
                                      playerData['movement_agility'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Crossing: ${playerData['attacking_crossing']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child:
                            Text("Balance: ${playerData['movement_balance']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['attacking_crossing'],
                          progressColor: (playerData['attacking_crossing'] >
                                      70 &&
                                  playerData['attacking_crossing'] <= 100)
                              ? Colors.green
                              : (playerData['attacking_crossing'] > 50 &&
                                      playerData['attacking_crossing'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['movement_balance'],
                          progressColor: (playerData['movement_balance'] > 70 &&
                                  playerData['movement_balance'] <= 100)
                              ? Colors.green
                              : (playerData['movement_balance'] > 50 &&
                                      playerData['movement_balance'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Free Kick Accuracy: ${playerData['skill_fk_accuracy']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Reactions: ${playerData['movement_reactions']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['skill_fk_accuracy'],
                          progressColor:
                              (playerData['skill_fk_accuracy'] > 70 &&
                                      playerData['skill_fk_accuracy'] <= 100)
                                  ? Colors.green
                                  : (playerData['skill_fk_accuracy'] > 50 &&
                                          playerData['skill_fk_accuracy'] <= 70)
                                      ? Colors.amber
                                      : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['movement_reactions'],
                          progressColor: (playerData['movement_reactions'] >
                                      70 &&
                                  playerData['movement_reactions'] <= 100)
                              ? Colors.green
                              : (playerData['movement_reactions'] > 50 &&
                                      playerData['movement_reactions'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Short Passing: ${playerData['attacking_short_passing']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Ball Control: ${playerData['skill_ball_control']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['attacking_short_passing'],
                          progressColor: (playerData[
                                          'attacking_short_passing'] >
                                      70 &&
                                  playerData['attacking_short_passing'] <= 100)
                              ? Colors.green
                              : (playerData['attacking_short_passing'] > 50 &&
                                      playerData['attacking_short_passing'] <=
                                          70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['skill_ball_control'],
                          progressColor: (playerData['skill_ball_control'] >
                                      70 &&
                                  playerData['skill_ball_control'] <= 100)
                              ? Colors.green
                              : (playerData['skill_ball_control'] > 50 &&
                                      playerData['skill_ball_control'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Long Passing: ${playerData['skill_long_passing']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child:
                            Text("Dribbling: ${playerData['skill_dribbling']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['skill_long_passing'],
                          progressColor: (playerData['skill_long_passing'] >
                                      70 &&
                                  playerData['skill_long_passing'] <= 100)
                              ? Colors.green
                              : (playerData['skill_long_passing'] > 50 &&
                                      playerData['skill_long_passing'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['skill_dribbling'],
                          progressColor: (playerData['skill_dribbling'] > 70 &&
                                  playerData['skill_dribbling'] <= 100)
                              ? Colors.green
                              : (playerData['skill_dribbling'] > 50 &&
                                      playerData['skill_dribbling'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Curve: ${playerData['skill_curve']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Composure: ${playerData['mentality_composure']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['skill_curve'],
                          progressColor: (playerData['skill_curve'] > 70 &&
                                  playerData['skill_curve'] <= 100)
                              ? Colors.green
                              : (playerData['skill_curve'] > 50 &&
                                      playerData['skill_curve'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['mentality_composure'],
                          progressColor: (playerData['mentality_composure'] >
                                      70 &&
                                  playerData['mentality_composure'] <= 100)
                              ? Colors.green
                              : (playerData['mentality_composure'] > 50 &&
                                      playerData['mentality_composure'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Defending: ${playerData['defending']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Physicality: ${playerData['physic']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Interceptions: ${playerData['mentality_interceptions']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Jumping: ${playerData['power_jumping']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['mentality_interceptions'],
                          progressColor: (playerData[
                                          'mentality_interceptions'] >
                                      70 &&
                                  playerData['mentality_interceptions'] <= 100)
                              ? Colors.green
                              : (playerData['mentality_interceptions'] > 50 &&
                                      playerData['mentality_interceptions'] <=
                                          70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['power_jumping'],
                          progressColor: (playerData['power_jumping'] > 70 &&
                                  playerData['power_jumping'] <= 100)
                              ? Colors.green
                              : (playerData['power_jumping'] > 50 &&
                                      playerData['power_jumping'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Heading Accuracy: ${playerData['attacking_heading_accuracy']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Stamina: ${playerData['power_stamina']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['attacking_heading_accuracy'],
                          progressColor: (playerData[
                                          'attacking_heading_accuracy'] >
                                      70 &&
                                  playerData['attacking_heading_accuracy'] <=
                                      100)
                              ? Colors.green
                              : (playerData['attacking_heading_accuracy'] >
                                          50 &&
                                      playerData[
                                              'attacking_heading_accuracy'] <=
                                          70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['power_stamina'],
                          progressColor: (playerData['power_stamina'] > 70 &&
                                  playerData['power_stamina'] <= 100)
                              ? Colors.green
                              : (playerData['power_stamina'] > 50 &&
                                      playerData['power_stamina'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Def Awareness: ${playerData['defending_marking_awareness']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child:
                            Text("Strength: ${playerData['power_strength']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep:
                              playerData['defending_marking_awareness'],
                          progressColor: (playerData[
                                          'defending_marking_awareness'] >
                                      70 &&
                                  playerData['defending_marking_awareness'] <=
                                      100)
                              ? Colors.green
                              : (playerData['defending_marking_awareness'] >
                                          50 &&
                                      playerData[
                                              'defending_marking_awareness'] <=
                                          70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['power_strength'],
                          progressColor: (playerData['power_strength'] > 70 &&
                                  playerData['power_strength'] <= 100)
                              ? Colors.green
                              : (playerData['power_strength'] > 50 &&
                                      playerData['power_strength'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Standing Tackle: ${playerData['defending_standing_tackle']}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Aggression: ${playerData['mentality_aggression']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['defending_standing_tackle'],
                          progressColor: (playerData[
                                          'defending_standing_tackle'] >
                                      70 &&
                                  playerData['defending_standing_tackle'] <=
                                      100)
                              ? Colors.green
                              : (playerData['defending_standing_tackle'] > 50 &&
                                      playerData['defending_standing_tackle'] <=
                                          70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['mentality_aggression'],
                          progressColor: (playerData['mentality_aggression'] >
                                      70 &&
                                  playerData['mentality_aggression'] <= 100)
                              ? Colors.green
                              : (playerData['mentality_aggression'] > 50 &&
                                      playerData['mentality_aggression'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "Sliding Tackle: ${playerData['defending_sliding_tackle']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['defending_sliding_tackle'],
                          progressColor: (playerData[
                                          'defending_sliding_tackle'] >
                                      70 &&
                                  playerData['defending_sliding_tackle'] <= 100)
                              ? Colors.green
                              : (playerData['defending_sliding_tackle'] > 50 &&
                                      playerData['defending_sliding_tackle'] <=
                                          70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text("Goalkeeping"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "GK Diving: ${playerData['goalkeeping_diving']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['goalkeeping_diving'],
                          progressColor: (playerData['goalkeeping_diving'] >
                                      70 &&
                                  playerData['goalkeeping_diving'] <= 100)
                              ? Colors.green
                              : (playerData['goalkeeping_diving'] > 50 &&
                                      playerData['goalkeeping_diving'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "GK Handling: ${playerData['goalkeeping_handling']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['goalkeeping_handling'],
                          progressColor: (playerData['goalkeeping_handling'] >
                                      70 &&
                                  playerData['goalkeeping_handling'] <= 100)
                              ? Colors.green
                              : (playerData['goalkeeping_handling'] > 50 &&
                                      playerData['goalkeeping_handling'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "GK Kicking: ${playerData['goalkeeping_kicking']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['goalkeeping_kicking'],
                          progressColor: (playerData['goalkeeping_kicking'] >
                                      70 &&
                                  playerData['goalkeeping_kicking'] <= 100)
                              ? Colors.green
                              : (playerData['goalkeeping_kicking'] > 50 &&
                                      playerData['goalkeeping_kicking'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "GK Positioning: ${playerData['goalkeeping_positioning']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['goalkeeping_positioning'],
                          progressColor: (playerData[
                                          'goalkeeping_positioning'] >
                                      70 &&
                                  playerData['goalkeeping_positioning'] <= 100)
                              ? Colors.green
                              : (playerData['goalkeeping_positioning'] > 50 &&
                                      playerData['goalkeeping_positioning'] <=
                                          70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            "GK Reflexes: ${playerData['goalkeeping_reflexes']}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: playerData['goalkeeping_reflexes'],
                          progressColor: (playerData['goalkeeping_reflexes'] >
                                      70 &&
                                  playerData['goalkeeping_reflexes'] <= 100)
                              ? Colors.green
                              : (playerData['goalkeeping_reflexes'] > 50 &&
                                      playerData['goalkeeping_reflexes'] <= 70)
                                  ? Colors.amber
                                  : Colors.red,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                    ],
                  ),
                ],
              ),
            )
              // child: Text(playerData['long_name']),
              ),
    );
  }
}
