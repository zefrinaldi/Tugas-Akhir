// import 'package:csv_test/home_screen_scout.dart';
import 'package:csv_test/players_detail.dart';
// import 'package:csv_test/update_player.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:multiselect/multiselect.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController shortNameController = TextEditingController();
  TextEditingController longNameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController overallController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  // TextEditingController footController = TextEditingController();
  TextEditingController paceController = TextEditingController();
  TextEditingController accelerationController = TextEditingController();
  TextEditingController speedController = TextEditingController();
  TextEditingController shootingController = TextEditingController();
  TextEditingController positioningController = TextEditingController();
  TextEditingController finishingController = TextEditingController();
  TextEditingController shotpowerController = TextEditingController();
  TextEditingController longshotsController = TextEditingController();
  TextEditingController volleysController = TextEditingController();
  TextEditingController penaltiesController = TextEditingController();
  TextEditingController passingController = TextEditingController();
  TextEditingController visionController = TextEditingController();
  TextEditingController crossingController = TextEditingController();
  TextEditingController fkaccuracyController = TextEditingController();
  TextEditingController shortpassingController = TextEditingController();
  TextEditingController longpassingController = TextEditingController();
  TextEditingController curveController = TextEditingController();
  TextEditingController dribblingController = TextEditingController();
  TextEditingController agilityController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController reactionsController = TextEditingController();
  TextEditingController ballcontrolController = TextEditingController();
  TextEditingController dribbling2Controller = TextEditingController();
  TextEditingController composureController = TextEditingController();
  TextEditingController defendingController = TextEditingController();
  TextEditingController intreceptionsController = TextEditingController();
  TextEditingController headingaccuracyController = TextEditingController();
  TextEditingController defawarenessController = TextEditingController();
  TextEditingController standingtackleController = TextEditingController();
  TextEditingController slidingtackleController = TextEditingController();
  TextEditingController pyhsicController = TextEditingController();
  TextEditingController jumpingController = TextEditingController();
  TextEditingController staminaController = TextEditingController();
  TextEditingController strengthController = TextEditingController();
  TextEditingController aggressionController = TextEditingController();
  TextEditingController gkdivingController = TextEditingController();
  TextEditingController gkhandlingController = TextEditingController();
  TextEditingController gkkickingController = TextEditingController();
  TextEditingController gkpositioningController = TextEditingController();
  TextEditingController gkreflexesController = TextEditingController();

  var reference = FirebaseDatabase.instance.ref();
  List<String> data = [];
  int jumlahdata = 0;
  String search = "";
  String searchfilter = "";
  List<String> posisi = [
    'CM',
    'CB',
    'RWB',
    'RW',
    'CDM',
    'LB',
    'LWB',
    'RB',
    'CAM',
    'LW',
    'LM',
    'GK',
    'CF',
    'ST',
    'RM'
  ];
  List<String> posisiFilter = [
    'CM',
    'CB',
    'RWB',
    'RW',
    'CDM',
    'LB',
    'LWB',
    'RB',
    'CAM',
    'LW',
    'LM',
    'GK',
    'CF',
    'ST',
    'RM'
  ];
  List<String> posisi_temp = [];
  List<String> posisi_tempFilter = [];
  String? selectedValue;
  List<String> dropdownItems = ['Left', 'Right'];

  @override
  void initState() {
    super.initState();
    reference.child("/");

    reference.child("/").once().then((eventdata) {
      // List data = [];
      // int jumlahdata = 0;
      List<dynamic> values = eventdata.snapshot.value as List<dynamic>;
      print(values.length);
      jumlahdata = values.length;
      // for (var i in values) {
      //   data.add(i);
      // }
      // values.forEach((key, value) {
      //   print(key);
      //   // data.add(value);
      // });
      // print(data);
      // setState(() {
      //   jumlahdata = data.length;
      // });
    });
  }

  void showlength() {
    reference.child("/").once().then((eventdata) {
      // List data = [];
      // int jumlahdata = 0;
      List<dynamic> values = eventdata.snapshot.value as List<dynamic>;
      print(values.length);
      setState(() {
        jumlahdata = values.length;
      });
      // for (var i in values) {
      //   data.add(i);
      // }
      // values.forEach((key, value) {
      //   print(key);
      //   // data.add(value);
      // });
      // print(data);
      // setState(() {
      //   jumlahdata = data.length;
      // });
    });
    print("ini jumlah ${jumlahdata}");
  }

  Future<void> addPlayers(
      String shortname,
      String longname,
      String position,
      int? overall,
      int? age,
      int? height,
      int? weight,
      String nationality,
      String foot,
      int? pace,
      int? acceleration,
      int? speed,
      int? shooting,
      int? positioning,
      int? finishing,
      int? shotpower,
      int? longshots,
      int? volleys,
      int? penalties,
      int? passing,
      int? vision,
      int? crossing,
      int? fkaccuracy,
      int? shortpassing,
      int? longpassing,
      int? curve,
      int? dribbling,
      int? agility,
      int? balance,
      int? reactions,
      int? ballcontrol,
      int? dribbling2,
      int? composure,
      int? defending,
      int? interceptions,
      int? headingaccuracy,
      int? defawareness,
      int? standingtackle,
      int? slidingtackle,
      int? physic,
      int? jumping,
      int? stamina,
      int? strength,
      int? aggression,
      int? gkdiving,
      int? gkhandling,
      int? gkkicking,
      int? gkpositioning,
      int? gkreflexes) async {
    if (overall == null) {
      overall = 0;
    }
    if (age == null) {
      age = 0;
    }
    if (height == null) {
      height = 0;
    }
    if (weight == null) {
      weight = 0;
    }
    if (pace == null) {
      pace = 0;
    }
    if (acceleration == null) {
      acceleration = 0;
    }
    if (speed == null) {
      speed = 0;
    }
    if (shooting == null) {
      shooting = 0;
    }
    if (positioning == null) {
      positioning = 0;
    }
    if (finishing == null) {
      finishing = 0;
    }
    if (shotpower == null) {
      shotpower = 0;
    }
    if (longshots == null) {
      longshots = 0;
    }
    if (volleys == null) {
      volleys = 0;
    }
    if (penalties == null) {
      penalties = 0;
    }
    if (passing == null) {
      passing = 0;
    }
    if (vision == null) {
      vision = 0;
    }
    if (crossing == null) {
      crossing = 0;
    }
    if (fkaccuracy == null) {
      fkaccuracy = 0;
    }
    if (shortpassing == null) {
      shortpassing = 0;
    }
    if (longpassing == null) {
      longpassing = 0;
    }
    if (curve == null) {
      curve = 0;
    }
    if (dribbling == null) {
      dribbling = 0;
    }
    if (agility == null) {
      agility = 0;
    }
    if (balance == null) {
      balance = 0;
    }
    if (reactions == null) {
      reactions = 0;
    }
    if (ballcontrol == null) {
      ballcontrol = 0;
    }
    if (dribbling2 == null) {
      dribbling2 = 0;
    }
    if (composure == null) {
      composure = 0;
    }
    if (defending == null) {
      shortpassing = 0;
    }
    if (interceptions == null) {
      interceptions = 0;
    }
    if (headingaccuracy == null) {
      headingaccuracy = 0;
    }
    if (defawareness == null) {
      defawareness = 0;
    }
    if (standingtackle == null) {
      standingtackle = 0;
    }
    if (slidingtackle == null) {
      slidingtackle = 0;
    }
    if (physic == null) {
      physic = 0;
    }
    if (jumping == null) {
      jumping = 0;
    }
    if (stamina == null) {
      stamina = 0;
    }
    if (strength == null) {
      strength = 0;
    }
    if (aggression == null) {
      aggression = 0;
    }
    if (gkdiving == null) {
      gkdiving = 0;
    }
    if (gkhandling == null) {
      gkhandling = 0;
    }
    if (gkkicking == null) {
      gkkicking = 0;
    }
    if (gkpositioning == null) {
      gkpositioning = 0;
    }
    if (gkreflexes == null) {
      gkreflexes = 0;
    }

    await reference.child("$jumlahdata").set({
      "short_name": shortname,
      "long_name": longname,
      "player_positions": position,
      "overall": overall,
      "age": age,
      "height_cm": height,
      "weight_kg": weight,
      "nationality_name": nationality,
      "preferred_foot": foot,
      "pace": pace,
      "movement_acceleration": acceleration,
      "movement_sprint_speed": speed,
      "shooting": shooting,
      "mentality_positioning": positioning,
      "attacking_finishing": finishing,
      "power_shot_power": shotpower,
      "power_long_shots": longshots,
      "attacking_volleys": volleys,
      "mentality_penalties": penalties,
      "passing": passing,
      "mentality_vision": vision,
      "attacking_crossing": crossing,
      "skill_fk_accuracy": fkaccuracy,
      "attacking_short_passing": shortpassing,
      "skill_long_passing": longpassing,
      "skill_curve": curve,
      "dribbling": dribbling,
      "movement_agility": agility,
      "movement_balance": balance,
      "movement_reactions": reactions,
      "skill_ball_control": ballcontrol,
      "skill_dribbling": dribbling2,
      "mentality_composure": composure,
      "defending": defending,
      "mentality_interceptions": interceptions,
      "attacking_heading_accuracy": headingaccuracy,
      "defending_marking_awareness": defawareness,
      "defending_standing_tackle": standingtackle,
      "defending_sliding_tackle": slidingtackle,
      "physic": physic,
      "power_jumping": jumping,
      "power_stamina": stamina,
      "power_strength": strength,
      "mentality_aggression": aggression,
      "goalkeeping_diving": gkdiving,
      "goalkeeping_handling": gkhandling,
      "goalkeeping_kicking": gkkicking,
      "goalkeeping_positioning": gkpositioning,
      "goalkeeping_reflexes": gkreflexes
    });
  }

  Future<void> updatePlayers(
      String shortname,
      String longname,
      String position,
      int? overall,
      int? age,
      int? height,
      int? weight,
      String nationality,
      String foot,
      int? pace,
      int? acceleration,
      int? speed,
      int? shooting,
      int? positioning,
      int? finishing,
      int? shotpower,
      int? longshots,
      int? volleys,
      int? penalties,
      int? passing,
      int? vision,
      int? crossing,
      int? fkaccuracy,
      int? shortpassing,
      int? longpassing,
      int? curve,
      int? dribbling,
      int? agility,
      int? balance,
      int? reactions,
      int? ballcontrol,
      int? dribbling2,
      int? composure,
      int? defending,
      int? interceptions,
      int? headingaccuracy,
      int? defawareness,
      int? standingtackle,
      int? slidingtackle,
      int? physic,
      int? jumping,
      int? stamina,
      int? strength,
      int? aggression,
      int? gkdiving,
      int? gkhandling,
      int? gkkicking,
      int? gkpositioning,
      int? gkreflexes,
      String key) async {
    if (overall == null) {
      overall = 0;
    }
    if (age == null) {
      age = 0;
    }
    if (height == null) {
      height = 0;
    }
    if (weight == null) {
      weight = 0;
    }
    if (pace == null) {
      pace = 0;
    }
    if (acceleration == null) {
      acceleration = 0;
    }
    if (speed == null) {
      speed = 0;
    }
    if (shooting == null) {
      shooting = 0;
    }
    if (positioning == null) {
      positioning = 0;
    }
    if (finishing == null) {
      finishing = 0;
    }
    if (shotpower == null) {
      shotpower = 0;
    }
    if (longshots == null) {
      longshots = 0;
    }
    if (volleys == null) {
      volleys = 0;
    }
    if (penalties == null) {
      penalties = 0;
    }
    if (passing == null) {
      passing = 0;
    }
    if (vision == null) {
      vision = 0;
    }
    if (crossing == null) {
      crossing = 0;
    }
    if (fkaccuracy == null) {
      fkaccuracy = 0;
    }
    if (shortpassing == null) {
      shortpassing = 0;
    }
    if (longpassing == null) {
      longpassing = 0;
    }
    if (curve == null) {
      curve = 0;
    }
    if (dribbling == null) {
      dribbling = 0;
    }
    if (agility == null) {
      agility = 0;
    }
    if (balance == null) {
      balance = 0;
    }
    if (reactions == null) {
      reactions = 0;
    }
    if (ballcontrol == null) {
      ballcontrol = 0;
    }
    if (dribbling2 == null) {
      dribbling2 = 0;
    }
    if (composure == null) {
      composure = 0;
    }
    if (defending == null) {
      shortpassing = 0;
    }
    if (interceptions == null) {
      interceptions = 0;
    }
    if (headingaccuracy == null) {
      headingaccuracy = 0;
    }
    if (defawareness == null) {
      defawareness = 0;
    }
    if (standingtackle == null) {
      standingtackle = 0;
    }
    if (slidingtackle == null) {
      slidingtackle = 0;
    }
    if (physic == null) {
      physic = 0;
    }
    if (jumping == null) {
      jumping = 0;
    }
    if (stamina == null) {
      stamina = 0;
    }
    if (strength == null) {
      strength = 0;
    }
    if (aggression == null) {
      aggression = 0;
    }
    if (gkdiving == null) {
      gkdiving = 0;
    }
    if (gkhandling == null) {
      gkhandling = 0;
    }
    if (gkkicking == null) {
      gkkicking = 0;
    }
    if (gkpositioning == null) {
      gkpositioning = 0;
    }
    if (gkreflexes == null) {
      gkreflexes = 0;
    }

    await reference.child("/").child(key).update({
      "short_name": shortname,
      "long_name": longname,
      "player_positions": position,
      "overall": overall,
      "age": age,
      "height_cm": height,
      "weight_kg": weight,
      "nationality_name": nationality,
      "preferred_foot": foot,
      "pace": pace,
      "movement_acceleration": acceleration,
      "movement_sprint_speed": speed,
      "shooting": shooting,
      "mentality_positioning": positioning,
      "attacking_finishing": finishing,
      "power_shot_power": shotpower,
      "power_long_shots": longshots,
      "attacking_volleys": volleys,
      "mentality_penalties": penalties,
      "passing": passing,
      "mentality_vision": vision,
      "attacking_crossing": crossing,
      "skill_fk_accuracy": fkaccuracy,
      "attacking_short_passing": shortpassing,
      "skill_long_passing": longpassing,
      "skill_curve": curve,
      "dribbling": dribbling,
      "movement_agility": agility,
      "movement_balance": balance,
      "movement_reactions": reactions,
      "skill_ball_control": ballcontrol,
      "skill_dribbling": dribbling2,
      "mentality_composure": composure,
      "defending": defending,
      "mentality_interceptions": interceptions,
      "attacking_heading_accuracy": headingaccuracy,
      "defending_marking_awareness": defawareness,
      "defending_standing_tackle": standingtackle,
      "defending_sliding_tackle": slidingtackle,
      "physic": physic,
      "power_jumping": jumping,
      "power_stamina": stamina,
      "power_strength": strength,
      "mentality_aggression": aggression,
      "goalkeeping_diving": gkdiving,
      "goalkeeping_handling": gkhandling,
      "goalkeeping_kicking": gkkicking,
      "goalkeeping_positioning": gkpositioning,
      "goalkeeping_reflexes": gkreflexes
    });
  }

  Future<void> deletePlayers(String key) async {
    await reference.child("/").child(key).remove();
  }

  void clearText() {
    shortNameController.clear();
    longNameController.clear();
    positionController.clear();
    overallController.clear();
    ageController.clear();
    heightController.clear();
    weightController.clear();
    nationalityController.clear();
    // footController.clear();
    paceController.clear();
    accelerationController.clear();
    speedController.clear();
    shootingController.clear();
    positioningController.clear();
    finishingController.clear();
    shotpowerController.clear();
    longshotsController.clear();
    volleysController.clear();
    penaltiesController.clear();
    passingController.clear();
    visionController.clear();
    crossingController.clear();
    fkaccuracyController.clear();
    shortpassingController.clear();
    longpassingController.clear();
    curveController.clear();
    dribblingController.clear();
    agilityController.clear();
    balanceController.clear();
    reactionsController.clear();
    ballcontrolController.clear();
    dribbling2Controller.clear();
    composureController.clear();
    defendingController.clear();
    intreceptionsController.clear();
    headingaccuracyController.clear();
    defawarenessController.clear();
    standingtackleController.clear();
    slidingtackleController.clear();
    pyhsicController.clear();
    jumpingController.clear();
    staminaController.clear();
    strengthController.clear();
    aggressionController.clear();
    gkdivingController.clear();
    gkhandlingController.clear();
    gkkickingController.clear();
    gkpositioningController.clear();
    gkreflexesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: Text('Player Data'),
        onSearch: (value) {
          setState(() {
            // print(value.toString());
            search = value.toString();
            print(search);
          });
        },
        backgroundColor: Colors.blue,
        actions: [
          // Add Data
          IconButton(
              onPressed: () {
                clearText();
                showlength();
                showDialog(
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: AlertDialog(
                          title: const Text("Add Player"),
                          content: StatefulBuilder(
                            builder: (context, setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    controller: shortNameController,
                                    decoration: const InputDecoration(
                                        hintText: "Short Name"),
                                  ),
                                  TextField(
                                    controller: longNameController,
                                    decoration: const InputDecoration(
                                        hintText: "Long Name"),
                                  ),
                                  DropDownMultiSelect(
                                    options: posisi,
                                    selectedValues: posisi_temp,
                                    onChanged: (value) {
                                      setState(() {
                                        posisi_temp = value;
                                        positionController.text =
                                            posisi_temp.join(", ");
                                      });
                                      print("$posisi_temp");
                                      print("${positionController.text}");
                                    },
                                    whenEmpty: 'Positions',
                                  ),
                                  TextField(
                                    controller: ageController,
                                    decoration:
                                        const InputDecoration(hintText: "Age"),
                                  ),
                                  TextField(
                                    controller: heightController,
                                    decoration: const InputDecoration(
                                        hintText: "Height (cm)"),
                                  ),
                                  TextField(
                                    controller: weightController,
                                    decoration: const InputDecoration(
                                        hintText: "Weight (kg)"),
                                  ),
                                  TextField(
                                    controller: nationalityController,
                                    decoration: const InputDecoration(
                                        hintText: "Nationality"),
                                  ),
                                  // TextField(
                                  //   controller: footController,
                                  //   decoration: const InputDecoration(
                                  //       hintText: "Preferred Foot (Left/Right)"),
                                  // ),
                                  // Text('selectedValue: $selectedValue'),
                                  InputDecorator(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            const EdgeInsets.only(left: 10)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: selectedValue,
                                        hint: Text("Preferred Foot"),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedValue = newValue;
                                            print("$selectedValue");
                                          });
                                        },
                                        items: dropdownItems.map((String item) {
                                          return DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  TextField(
                                    controller: paceController,
                                    decoration:
                                        const InputDecoration(hintText: "Pace"),
                                  ),
                                  TextField(
                                    controller: accelerationController,
                                    decoration: const InputDecoration(
                                        hintText: "Acceleration (Pace)"),
                                  ),
                                  TextField(
                                    controller: speedController,
                                    decoration: const InputDecoration(
                                        hintText: "Sprint Speed (Pace)"),
                                  ),
                                  TextField(
                                    controller: shootingController,
                                    decoration: const InputDecoration(
                                        hintText: "Shooting"),
                                  ),
                                  TextField(
                                    controller: positioningController,
                                    decoration: const InputDecoration(
                                        hintText: "Positioning (Shooting)"),
                                  ),
                                  TextField(
                                    controller: finishingController,
                                    decoration: const InputDecoration(
                                        hintText: "Finishing (Shooting)"),
                                  ),
                                  TextField(
                                    controller: shotpowerController,
                                    decoration: const InputDecoration(
                                        hintText: "Shot Power (Shooting)"),
                                  ),
                                  TextField(
                                    controller: longshotsController,
                                    decoration: const InputDecoration(
                                        hintText: "Long Shots (Shooting)"),
                                  ),
                                  TextField(
                                    controller: volleysController,
                                    decoration: const InputDecoration(
                                        hintText: "Volleys (Shooting)"),
                                  ),
                                  TextField(
                                    controller: penaltiesController,
                                    decoration: const InputDecoration(
                                        hintText: "Penalties (Shooting)"),
                                  ),
                                  TextField(
                                    controller: passingController,
                                    decoration: const InputDecoration(
                                        hintText: "Passing"),
                                  ),
                                  TextField(
                                    controller: visionController,
                                    decoration: const InputDecoration(
                                        hintText: "Vision (Passing)"),
                                  ),
                                  TextField(
                                    controller: crossingController,
                                    decoration: const InputDecoration(
                                        hintText: "Crossing (Passing)"),
                                  ),
                                  TextField(
                                    controller: fkaccuracyController,
                                    decoration: const InputDecoration(
                                        hintText:
                                            "Free Kick Accuracy (Passing)"),
                                  ),
                                  TextField(
                                    controller: shortpassingController,
                                    decoration: const InputDecoration(
                                        hintText: "Short Passing (Passing)"),
                                  ),
                                  TextField(
                                    controller: longpassingController,
                                    decoration: const InputDecoration(
                                        hintText: "Long Passing (Passing)"),
                                  ),
                                  TextField(
                                    controller: curveController,
                                    decoration: const InputDecoration(
                                        hintText: "Curve (Passing)"),
                                  ),
                                  TextField(
                                    controller: dribblingController,
                                    decoration: const InputDecoration(
                                        hintText: "Dribbling"),
                                  ),
                                  TextField(
                                    controller: agilityController,
                                    decoration: const InputDecoration(
                                        hintText: "Agility (Dribbling)"),
                                  ),
                                  TextField(
                                    controller: balanceController,
                                    decoration: const InputDecoration(
                                        hintText: "Balance (Dribbling)"),
                                  ),
                                  TextField(
                                    controller: reactionsController,
                                    decoration: const InputDecoration(
                                        hintText: "Reactions (Dribbling)"),
                                  ),
                                  TextField(
                                    controller: ballcontrolController,
                                    decoration: const InputDecoration(
                                        hintText: "Ball Control (Dribbling)"),
                                  ),
                                  TextField(
                                    controller: dribbling2Controller,
                                    decoration: const InputDecoration(
                                        hintText:
                                            "Skill Dribbling (Dribbling)"),
                                  ),
                                  TextField(
                                    controller: composureController,
                                    decoration: const InputDecoration(
                                        hintText: "Composure (Dribbling)"),
                                  ),
                                  TextField(
                                    controller: defendingController,
                                    decoration: const InputDecoration(
                                        hintText: "Defending"),
                                  ),
                                  TextField(
                                    controller: intreceptionsController,
                                    decoration: const InputDecoration(
                                        hintText: "Interceptions (Defending)"),
                                  ),
                                  TextField(
                                    controller: headingaccuracyController,
                                    decoration: const InputDecoration(
                                        hintText:
                                            "Heading Accuracy (Defending)"),
                                  ),
                                  TextField(
                                    controller: defawarenessController,
                                    decoration: const InputDecoration(
                                        hintText: "Def Awareness (Defending)"),
                                  ),
                                  TextField(
                                    controller: standingtackleController,
                                    decoration: const InputDecoration(
                                        hintText:
                                            "Standing Tackle (Defending)"),
                                  ),
                                  TextField(
                                    controller: slidingtackleController,
                                    decoration: const InputDecoration(
                                        hintText: "Sliding Tackle (Defending)"),
                                  ),
                                  TextField(
                                    controller: pyhsicController,
                                    decoration: const InputDecoration(
                                        hintText: "Physicality"),
                                  ),
                                  TextField(
                                    controller: jumpingController,
                                    decoration: const InputDecoration(
                                        hintText: "Jumping (Physicality)"),
                                  ),
                                  TextField(
                                    controller: staminaController,
                                    decoration: const InputDecoration(
                                        hintText: "Stamina (Physicality)"),
                                  ),
                                  TextField(
                                    controller: strengthController,
                                    decoration: const InputDecoration(
                                        hintText: "Strength (Physicality)"),
                                  ),
                                  TextField(
                                    controller: aggressionController,
                                    decoration: const InputDecoration(
                                        hintText: "Aggression (Physicality)"),
                                  ),
                                  TextField(
                                    controller: gkdivingController,
                                    decoration: const InputDecoration(
                                        hintText: "GK Diving (Goalkeeping)"),
                                  ),
                                  TextField(
                                    controller: gkhandlingController,
                                    decoration: const InputDecoration(
                                        hintText: "GK Handling (Goalkeeping)"),
                                  ),
                                  TextField(
                                    controller: gkkickingController,
                                    decoration: const InputDecoration(
                                        hintText: "GK Kicking (Goalkeeping)"),
                                  ),
                                  TextField(
                                    controller: gkpositioningController,
                                    decoration: const InputDecoration(
                                        hintText:
                                            "GK Positioning (Goalkeeping)"),
                                  ),
                                  TextField(
                                    controller: gkreflexesController,
                                    decoration: const InputDecoration(
                                        hintText: "GK Reflexes (Goalkeeping)"),
                                  ),
                                  TextField(
                                    controller: overallController,
                                    decoration: const InputDecoration(
                                        hintText: "Overall"),
                                  ),
                                ],
                              );
                            },
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  addPlayers(
                                      shortNameController.text,
                                      longNameController.text,
                                      positionController.text,
                                      int.tryParse(overallController.text),
                                      int.tryParse(ageController.text),
                                      int.tryParse(heightController.text),
                                      int.tryParse(weightController.text),
                                      nationalityController.text,
                                      selectedValue!,
                                      int.tryParse(paceController.text),
                                      int.tryParse(accelerationController.text),
                                      int.tryParse(speedController.text),
                                      int.tryParse(shootingController.text),
                                      int.tryParse(positioningController.text),
                                      int.tryParse(finishingController.text),
                                      int.tryParse(shotpowerController.text),
                                      int.tryParse(longshotsController.text),
                                      int.tryParse(volleysController.text),
                                      int.tryParse(penaltiesController.text),
                                      int.tryParse(passingController.text),
                                      int.tryParse(visionController.text),
                                      int.tryParse(crossingController.text),
                                      int.tryParse(fkaccuracyController.text),
                                      int.tryParse(shortpassingController.text),
                                      int.tryParse(longpassingController.text),
                                      int.tryParse(curveController.text),
                                      int.tryParse(dribblingController.text),
                                      int.tryParse(agilityController.text),
                                      int.tryParse(balanceController.text),
                                      int.tryParse(reactionsController.text),
                                      int.tryParse(ballcontrolController.text),
                                      int.tryParse(dribbling2Controller.text),
                                      int.tryParse(composureController.text),
                                      int.tryParse(defendingController.text),
                                      int.tryParse(
                                          intreceptionsController.text),
                                      int.tryParse(
                                          headingaccuracyController.text),
                                      int.tryParse(defawarenessController.text),
                                      int.tryParse(
                                          standingtackleController.text),
                                      int.tryParse(
                                          slidingtackleController.text),
                                      int.tryParse(pyhsicController.text),
                                      int.tryParse(jumpingController.text),
                                      int.tryParse(staminaController.text),
                                      int.tryParse(strengthController.text),
                                      int.tryParse(aggressionController.text),
                                      int.tryParse(gkdivingController.text),
                                      int.tryParse(gkhandlingController.text),
                                      int.tryParse(gkkickingController.text),
                                      int.tryParse(
                                          gkpositioningController.text),
                                      int.tryParse(gkreflexesController.text));
                                  Navigator.pop(context);
                                  setState(() {
                                    jumlahdata = jumlahdata + 1;
                                  });
                                },
                                child: const Text("Add Player"))
                          ],
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ExpansionTile(
              title: Text("Filter by Position"),
              children: [
                DropDownMultiSelect(
                  options: posisiFilter,
                  selectedValues: posisi_tempFilter,
                  onChanged: (value) {
                    List<String> listva = [];
                    // print(listva);
                    setState(() {
                      value.forEach((element) {
                        listva.add("$element");
                      });
                      searchfilter = listva.join(", ");
                    });
                    print("$search");
                  },
                  whenEmpty: 'Positions',
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: FirebaseAnimatedList(
            shrinkWrap: true,
            query: reference.child(""),
            itemBuilder: (context, snapshot, animation, index) {
              if (search.isEmpty &&
                  search == "" &&
                  searchfilter.isEmpty &&
                  searchfilter == "") {
                final data = snapshot.value as dynamic;
                data['key'] = snapshot.key;
                return ListTile(
                  // Edit data
                  leading: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              shortNameController.text = data["short_name"];
                              longNameController.text = data["long_name"];
                              positionController.text =
                                  data["player_positions"];
                              overallController.text =
                                  data["overall"].toString();
                              ageController.text = data["age"].toString();
                              heightController.text =
                                  data["height_cm"].toString();
                              weightController.text =
                                  data["weight_kg"].toString();
                              nationalityController.text =
                                  data["nationality_name"].toString();
                              selectedValue = data["preferred_foot"].toString();
                              paceController.text = data["pace"].toString();
                              accelerationController.text =
                                  data["movement_acceleration"].toString();
                              speedController.text =
                                  data["movement_sprint_speed"].toString();
                              shootingController.text =
                                  data["shooting"].toString();
                              positioningController.text =
                                  data["mentality_positioning"].toString();
                              finishingController.text =
                                  data["attacking_finishing"].toString();
                              shotpowerController.text =
                                  data["power_shot_power"].toString();
                              longshotsController.text =
                                  data["power_long_shots"].toString();
                              volleysController.text =
                                  data["attacking_volleys"].toString();
                              penaltiesController.text =
                                  data["mentality_penalties"].toString();
                              passingController.text =
                                  data["passing"].toString();
                              visionController.text =
                                  data["mentality_vision"].toString();
                              crossingController.text =
                                  data["attacking_crossing"].toString();
                              fkaccuracyController.text =
                                  data["skill_fk_accuracy"].toString();
                              shortpassingController.text =
                                  data["attacking_short_passing"].toString();
                              longpassingController.text =
                                  data["skill_long_passing"].toString();
                              curveController.text =
                                  data["skill_curve"].toString();
                              dribblingController.text =
                                  data["dribbling"].toString();
                              agilityController.text =
                                  data["movement_agility"].toString();
                              balanceController.text =
                                  data["movement_balance"].toString();
                              reactionsController.text =
                                  data["movement_reactions"].toString();
                              ballcontrolController.text =
                                  data["skill_ball_control"].toString();
                              dribbling2Controller.text =
                                  data["skill_dribbling"].toString();
                              composureController.text =
                                  data["mentality_composure"].toString();
                              defendingController.text =
                                  data["defending"].toString();
                              intreceptionsController.text =
                                  data["mentality_interceptions"].toString();
                              headingaccuracyController.text =
                                  data["attacking_heading_accuracy"].toString();
                              defawarenessController.text =
                                  data["defending_marking_awareness"]
                                      .toString();
                              standingtackleController.text =
                                  data["defending_standing_tackle"].toString();
                              slidingtackleController.text =
                                  data["defending_sliding_tackle"].toString();
                              pyhsicController.text = data["physic"].toString();
                              jumpingController.text =
                                  data["power_jumping"].toString();
                              staminaController.text =
                                  data["power_stamina"].toString();
                              strengthController.text =
                                  data["power_strength"].toString();
                              aggressionController.text =
                                  data["mentality_aggression"].toString();
                              gkdivingController.text =
                                  data["goalkeeping_diving"].toString();
                              gkhandlingController.text =
                                  data["goalkeeping_handling"].toString();
                              gkkickingController.text =
                                  data["goalkeeping_kicking"].toString();
                              gkpositioningController.text =
                                  data["goalkeeping_positioning"].toString();
                              gkreflexesController.text =
                                  data["goalkeeping_reflexes"].toString();

                              return SingleChildScrollView(
                                child: AlertDialog(
                                  title: const Text("Edit Player"),
                                  content: StatefulBuilder(
                                      builder: (context, setState) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          controller: shortNameController,
                                          decoration: const InputDecoration(
                                              hintText: "Short Name"),
                                        ),
                                        TextField(
                                          controller: longNameController,
                                          decoration: const InputDecoration(
                                              hintText: "Long Name"),
                                        ),
                                        DropDownMultiSelect(
                                          options: posisi,
                                          selectedValues: posisi_temp,
                                          onChanged: (value) {
                                            setState(() {
                                              posisi_temp = value;
                                              positionController.text =
                                                  posisi_temp.join(", ");
                                            });
                                            print("$posisi_temp");
                                            print("${positionController.text}");
                                          },
                                          whenEmpty: 'Positions',
                                        ),
                                        TextField(
                                          controller: ageController,
                                          decoration: const InputDecoration(
                                              hintText: "Age"),
                                        ),
                                        TextField(
                                          controller: heightController,
                                          decoration: const InputDecoration(
                                              hintText: "Height (cm)"),
                                        ),
                                        TextField(
                                          controller: weightController,
                                          decoration: const InputDecoration(
                                              hintText: "Weight (kg)"),
                                        ),
                                        TextField(
                                          controller: nationalityController,
                                          decoration: const InputDecoration(
                                              hintText: "Nationality"),
                                        ),
                                        // TextField(
                                        //   controller: footController,
                                        //   decoration: const InputDecoration(
                                        //       hintText:
                                        //           "Preferred Foot (Left/Right)"),
                                        // ),
                                        InputDecorator(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 10)),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: selectedValue,
                                              hint: Text("Preferred Foot"),
                                              onChanged: (String? newValue) {
                                                print("$selectedValue");
                                                setState(() {
                                                  selectedValue = newValue;
                                                  print("$selectedValue");
                                                });
                                              },
                                              items: dropdownItems
                                                  .map((String item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(item),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          controller: paceController,
                                          decoration: const InputDecoration(
                                              hintText: "Pace"),
                                        ),
                                        TextField(
                                          controller: accelerationController,
                                          decoration: const InputDecoration(
                                              hintText: "Acceleration (Pace)"),
                                        ),
                                        TextField(
                                          controller: speedController,
                                          decoration: const InputDecoration(
                                              hintText: "Sprint Speed (Pace)"),
                                        ),
                                        TextField(
                                          controller: shootingController,
                                          decoration: const InputDecoration(
                                              hintText: "Shooting"),
                                        ),
                                        TextField(
                                          controller: positioningController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Positioning (Shooting)"),
                                        ),
                                        TextField(
                                          controller: finishingController,
                                          decoration: const InputDecoration(
                                              hintText: "Finishing (Shooting)"),
                                        ),
                                        TextField(
                                          controller: shotpowerController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Shot Power (Shooting)"),
                                        ),
                                        TextField(
                                          controller: longshotsController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Long Shots (Shooting)"),
                                        ),
                                        TextField(
                                          controller: volleysController,
                                          decoration: const InputDecoration(
                                              hintText: "Volleys (Shooting)"),
                                        ),
                                        TextField(
                                          controller: penaltiesController,
                                          decoration: const InputDecoration(
                                              hintText: "Penalties (Shooting)"),
                                        ),
                                        TextField(
                                          controller: passingController,
                                          decoration: const InputDecoration(
                                              hintText: "Passing"),
                                        ),
                                        TextField(
                                          controller: visionController,
                                          decoration: const InputDecoration(
                                              hintText: "Vision (Passing)"),
                                        ),
                                        TextField(
                                          controller: crossingController,
                                          decoration: const InputDecoration(
                                              hintText: "Crossing (Passing)"),
                                        ),
                                        TextField(
                                          controller: fkaccuracyController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Free Kick Accuracy (Passing)"),
                                        ),
                                        TextField(
                                          controller: shortpassingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Short Passing (Passing)"),
                                        ),
                                        TextField(
                                          controller: longpassingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Long Passing (Passing)"),
                                        ),
                                        TextField(
                                          controller: curveController,
                                          decoration: const InputDecoration(
                                              hintText: "Curve (Passing)"),
                                        ),
                                        TextField(
                                          controller: dribblingController,
                                          decoration: const InputDecoration(
                                              hintText: "Dribbling"),
                                        ),
                                        TextField(
                                          controller: agilityController,
                                          decoration: const InputDecoration(
                                              hintText: "Agility (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: balanceController,
                                          decoration: const InputDecoration(
                                              hintText: "Balance (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: reactionsController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Reactions (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: ballcontrolController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Ball Control (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: dribbling2Controller,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Skill Dribbling (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: composureController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Composure (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: defendingController,
                                          decoration: const InputDecoration(
                                              hintText: "Defending"),
                                        ),
                                        TextField(
                                          controller: intreceptionsController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Interceptions (Defending)"),
                                        ),
                                        TextField(
                                          controller: headingaccuracyController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Heading Accuracy (Defending)"),
                                        ),
                                        TextField(
                                          controller: defawarenessController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Def Awareness (Defending)"),
                                        ),
                                        TextField(
                                          controller: standingtackleController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Standing Tackle (Defending)"),
                                        ),
                                        TextField(
                                          controller: slidingtackleController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Sliding Tackle (Defending)"),
                                        ),
                                        TextField(
                                          controller: pyhsicController,
                                          decoration: const InputDecoration(
                                              hintText: "Physicality"),
                                        ),
                                        TextField(
                                          controller: jumpingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Jumping (Physicality)"),
                                        ),
                                        TextField(
                                          controller: staminaController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Stamina (Physicality)"),
                                        ),
                                        TextField(
                                          controller: strengthController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Strength (Physicality)"),
                                        ),
                                        TextField(
                                          controller: aggressionController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Aggression (Physicality)"),
                                        ),
                                        TextField(
                                          controller: gkdivingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Diving (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkhandlingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Handling (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkkickingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Kicking (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkpositioningController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Positioning (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkreflexesController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Reflexes (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: overallController,
                                          decoration: const InputDecoration(
                                              hintText: "Overall"),
                                        ),
                                      ],
                                    );
                                  }),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          updatePlayers(
                                              shortNameController.text,
                                              longNameController.text,
                                              positionController.text,
                                              int.tryParse(
                                                  overallController.text),
                                              int.tryParse(ageController.text),
                                              int.tryParse(
                                                  heightController.text),
                                              int.tryParse(
                                                  weightController.text),
                                              nationalityController.text,
                                              selectedValue!,
                                              int.tryParse(paceController.text),
                                              int.tryParse(
                                                  accelerationController.text),
                                              int.tryParse(
                                                  speedController.text),
                                              int.tryParse(
                                                  shootingController.text),
                                              int.tryParse(
                                                  positioningController.text),
                                              int.tryParse(
                                                  finishingController.text),
                                              int.tryParse(
                                                  shotpowerController.text),
                                              int.tryParse(
                                                  longshotsController.text),
                                              int.tryParse(
                                                  volleysController.text),
                                              int.tryParse(
                                                  penaltiesController.text),
                                              int.tryParse(
                                                  passingController.text),
                                              int.tryParse(
                                                  visionController.text),
                                              int.tryParse(
                                                  crossingController.text),
                                              int.tryParse(
                                                  fkaccuracyController.text),
                                              int.tryParse(
                                                  shortpassingController.text),
                                              int.tryParse(
                                                  longpassingController.text),
                                              int.tryParse(
                                                  curveController.text),
                                              int.tryParse(
                                                  dribblingController.text),
                                              int.tryParse(
                                                  agilityController.text),
                                              int.tryParse(
                                                  balanceController.text),
                                              int.tryParse(
                                                  reactionsController.text),
                                              int.tryParse(ballcontrolController.text),
                                              int.tryParse(dribbling2Controller.text),
                                              int.tryParse(composureController.text),
                                              int.tryParse(defendingController.text),
                                              int.tryParse(intreceptionsController.text),
                                              int.tryParse(headingaccuracyController.text),
                                              int.tryParse(defawarenessController.text),
                                              int.tryParse(standingtackleController.text),
                                              int.tryParse(slidingtackleController.text),
                                              int.tryParse(pyhsicController.text),
                                              int.tryParse(jumpingController.text),
                                              int.tryParse(staminaController.text),
                                              int.tryParse(strengthController.text),
                                              int.tryParse(aggressionController.text),
                                              int.tryParse(gkdivingController.text),
                                              int.tryParse(gkhandlingController.text),
                                              int.tryParse(gkkickingController.text),
                                              int.tryParse(gkpositioningController.text),
                                              int.tryParse(gkreflexesController.text),
                                              data['key']);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Update Player"))
                                  ],
                                ),
                              );
                            });
                      },
                      icon: const Icon(Icons.edit)),
                  title: Text(data["short_name"]),
                  subtitle: Text("Overall: ${data["overall"]}"),
                  // Show data
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlayersDetail(id: data['key'])));
                  },
                  // Delete Data
                  trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text("Delete Player"),
                                content: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: Text("Delete This Player?"),
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        deletePlayers(data['key']);
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Yes")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No")),
                                ],
                              );
                            }));
                      },
                      icon: const Icon(Icons.delete)),
                );
              } else if (searchfilter.isEmpty &&
                  snapshot
                      .child("long_name")
                      .value
                      .toString()
                      .toLowerCase()
                      .contains(search.toLowerCase())) {
                final data = snapshot.value as dynamic;
                data['key'] = snapshot.key;
                return ListTile(
                  // Edit data
                  leading: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              shortNameController.text = data["short_name"];
                              longNameController.text = data["long_name"];
                              positionController.text =
                                  data["player_positions"];
                              overallController.text =
                                  data["overall"].toString();
                              ageController.text = data["age"].toString();
                              heightController.text =
                                  data["height_cm"].toString();
                              weightController.text =
                                  data["weight_kg"].toString();
                              nationalityController.text =
                                  data["nationality_name"].toString();
                              selectedValue = data["preferred_foot"].toString();
                              paceController.text = data["pace"].toString();
                              accelerationController.text =
                                  data["movement_acceleration"].toString();
                              speedController.text =
                                  data["movement_sprint_speed"].toString();
                              shootingController.text =
                                  data["shooting"].toString();
                              positioningController.text =
                                  data["mentality_positioning"].toString();
                              finishingController.text =
                                  data["attacking_finishing"].toString();
                              shotpowerController.text =
                                  data["power_shot_power"].toString();
                              longshotsController.text =
                                  data["power_long_shots"].toString();
                              volleysController.text =
                                  data["attacking_volleys"].toString();
                              penaltiesController.text =
                                  data["mentality_penalties"].toString();
                              passingController.text =
                                  data["passing"].toString();
                              visionController.text =
                                  data["mentality_vision"].toString();
                              crossingController.text =
                                  data["attacking_crossing"].toString();
                              fkaccuracyController.text =
                                  data["skill_fk_accuracy"].toString();
                              shortpassingController.text =
                                  data["attacking_short_passing"].toString();
                              longpassingController.text =
                                  data["skill_long_passing"].toString();
                              curveController.text =
                                  data["skill_curve"].toString();
                              dribblingController.text =
                                  data["dribbling"].toString();
                              agilityController.text =
                                  data["movement_agility"].toString();
                              balanceController.text =
                                  data["movement_balance"].toString();
                              reactionsController.text =
                                  data["movement_reactions"].toString();
                              ballcontrolController.text =
                                  data["skill_ball_control"].toString();
                              dribbling2Controller.text =
                                  data["skill_dribbling"].toString();
                              composureController.text =
                                  data["mentality_composure"].toString();
                              defendingController.text =
                                  data["defending"].toString();
                              intreceptionsController.text =
                                  data["mentality_interceptions"].toString();
                              headingaccuracyController.text =
                                  data["attacking_heading_accuracy"].toString();
                              defawarenessController.text =
                                  data["defending_marking_awareness"]
                                      .toString();
                              standingtackleController.text =
                                  data["defending_standing_tackle"].toString();
                              slidingtackleController.text =
                                  data["defending_sliding_tackle"].toString();
                              pyhsicController.text = data["physic"].toString();
                              jumpingController.text =
                                  data["power_jumping"].toString();
                              staminaController.text =
                                  data["power_stamina"].toString();
                              strengthController.text =
                                  data["power_strength"].toString();
                              aggressionController.text =
                                  data["mentality_aggression"].toString();
                              gkdivingController.text =
                                  data["goalkeeping_diving"].toString();
                              gkhandlingController.text =
                                  data["goalkeeping_handling"].toString();
                              gkkickingController.text =
                                  data["goalkeeping_kicking"].toString();
                              gkpositioningController.text =
                                  data["goalkeeping_positioning"].toString();
                              gkreflexesController.text =
                                  data["goalkeeping_reflexes"].toString();

                              return SingleChildScrollView(
                                child: AlertDialog(
                                  title: const Text("Edit Player"),
                                  content: StatefulBuilder(
                                      builder: (context, setState) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          controller: shortNameController,
                                          decoration: const InputDecoration(
                                              hintText: "Short Name"),
                                        ),
                                        TextField(
                                          controller: longNameController,
                                          decoration: const InputDecoration(
                                              hintText: "Long Name"),
                                        ),
                                        DropDownMultiSelect(
                                          options: posisi,
                                          selectedValues: posisi_temp,
                                          onChanged: (value) {
                                            setState(() {
                                              posisi_temp = value;
                                              positionController.text =
                                                  posisi_temp.join(", ");
                                            });
                                            print("$posisi_temp");
                                            print("${positionController.text}");
                                          },
                                          whenEmpty: 'Positions',
                                        ),
                                        TextField(
                                          controller: ageController,
                                          decoration: const InputDecoration(
                                              hintText: "Age"),
                                        ),
                                        TextField(
                                          controller: heightController,
                                          decoration: const InputDecoration(
                                              hintText: "Height (cm)"),
                                        ),
                                        TextField(
                                          controller: weightController,
                                          decoration: const InputDecoration(
                                              hintText: "Weight (kg)"),
                                        ),
                                        TextField(
                                          controller: nationalityController,
                                          decoration: const InputDecoration(
                                              hintText: "Nationality"),
                                        ),
                                        InputDecorator(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 10)),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: selectedValue,
                                              hint: Text("Preferred Foot"),
                                              onChanged: (String? newValue) {
                                                print("$selectedValue");
                                                setState(() {
                                                  selectedValue = newValue;
                                                  print("$selectedValue");
                                                });
                                              },
                                              items: dropdownItems
                                                  .map((String item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(item),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          controller: paceController,
                                          decoration: const InputDecoration(
                                              hintText: "Pace"),
                                        ),
                                        TextField(
                                          controller: accelerationController,
                                          decoration: const InputDecoration(
                                              hintText: "Acceleration (Pace)"),
                                        ),
                                        TextField(
                                          controller: speedController,
                                          decoration: const InputDecoration(
                                              hintText: "Sprint Speed (Pace)"),
                                        ),
                                        TextField(
                                          controller: shootingController,
                                          decoration: const InputDecoration(
                                              hintText: "Shooting"),
                                        ),
                                        TextField(
                                          controller: positioningController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Positioning (Shooting)"),
                                        ),
                                        TextField(
                                          controller: finishingController,
                                          decoration: const InputDecoration(
                                              hintText: "Finishing (Shooting)"),
                                        ),
                                        TextField(
                                          controller: shotpowerController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Shot Power (Shooting)"),
                                        ),
                                        TextField(
                                          controller: longshotsController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Long Shots (Shooting)"),
                                        ),
                                        TextField(
                                          controller: volleysController,
                                          decoration: const InputDecoration(
                                              hintText: "Volleys (Shooting)"),
                                        ),
                                        TextField(
                                          controller: penaltiesController,
                                          decoration: const InputDecoration(
                                              hintText: "Penalties (Shooting)"),
                                        ),
                                        TextField(
                                          controller: passingController,
                                          decoration: const InputDecoration(
                                              hintText: "Passing"),
                                        ),
                                        TextField(
                                          controller: visionController,
                                          decoration: const InputDecoration(
                                              hintText: "Vision (Passing)"),
                                        ),
                                        TextField(
                                          controller: crossingController,
                                          decoration: const InputDecoration(
                                              hintText: "Crossing (Passing)"),
                                        ),
                                        TextField(
                                          controller: fkaccuracyController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Free Kick Accuracy (Passing)"),
                                        ),
                                        TextField(
                                          controller: shortpassingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Short Passing (Passing)"),
                                        ),
                                        TextField(
                                          controller: longpassingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Long Passing (Passing)"),
                                        ),
                                        TextField(
                                          controller: curveController,
                                          decoration: const InputDecoration(
                                              hintText: "Curve (Passing)"),
                                        ),
                                        TextField(
                                          controller: dribblingController,
                                          decoration: const InputDecoration(
                                              hintText: "Dribbling"),
                                        ),
                                        TextField(
                                          controller: agilityController,
                                          decoration: const InputDecoration(
                                              hintText: "Agility (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: balanceController,
                                          decoration: const InputDecoration(
                                              hintText: "Balance (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: reactionsController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Reactions (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: ballcontrolController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Ball Control (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: dribbling2Controller,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Skill Dribbling (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: composureController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Composure (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: defendingController,
                                          decoration: const InputDecoration(
                                              hintText: "Defending"),
                                        ),
                                        TextField(
                                          controller: intreceptionsController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Interceptions (Defending)"),
                                        ),
                                        TextField(
                                          controller: headingaccuracyController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Heading Accuracy (Defending)"),
                                        ),
                                        TextField(
                                          controller: defawarenessController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Def Awareness (Defending)"),
                                        ),
                                        TextField(
                                          controller: standingtackleController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Standing Tackle (Defending)"),
                                        ),
                                        TextField(
                                          controller: slidingtackleController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Sliding Tackle (Defending)"),
                                        ),
                                        TextField(
                                          controller: pyhsicController,
                                          decoration: const InputDecoration(
                                              hintText: "Physicality"),
                                        ),
                                        TextField(
                                          controller: jumpingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Jumping (Physicality)"),
                                        ),
                                        TextField(
                                          controller: staminaController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Stamina (Physicality)"),
                                        ),
                                        TextField(
                                          controller: strengthController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Strength (Physicality)"),
                                        ),
                                        TextField(
                                          controller: aggressionController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Aggression (Physicality)"),
                                        ),
                                        TextField(
                                          controller: gkdivingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Diving (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkhandlingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Handling (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkkickingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Kicking (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkpositioningController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Positioning (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkreflexesController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Reflexes (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: overallController,
                                          decoration: const InputDecoration(
                                              hintText: "Overall"),
                                        ),
                                      ],
                                    );
                                  }),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          updatePlayers(
                                              shortNameController.text,
                                              longNameController.text,
                                              positionController.text,
                                              int.tryParse(
                                                  overallController.text),
                                              int.tryParse(ageController.text),
                                              int.tryParse(
                                                  heightController.text),
                                              int.tryParse(
                                                  weightController.text),
                                              nationalityController.text,
                                              selectedValue!,
                                              int.tryParse(paceController.text),
                                              int.tryParse(
                                                  accelerationController.text),
                                              int.tryParse(
                                                  speedController.text),
                                              int.tryParse(
                                                  shootingController.text),
                                              int.tryParse(
                                                  positioningController.text),
                                              int.tryParse(
                                                  finishingController.text),
                                              int.tryParse(
                                                  shotpowerController.text),
                                              int.tryParse(
                                                  longshotsController.text),
                                              int.tryParse(
                                                  volleysController.text),
                                              int.tryParse(
                                                  penaltiesController.text),
                                              int.tryParse(
                                                  passingController.text),
                                              int.tryParse(
                                                  visionController.text),
                                              int.tryParse(
                                                  crossingController.text),
                                              int.tryParse(
                                                  fkaccuracyController.text),
                                              int.tryParse(
                                                  shortpassingController.text),
                                              int.tryParse(
                                                  longpassingController.text),
                                              int.tryParse(
                                                  curveController.text),
                                              int.tryParse(
                                                  dribblingController.text),
                                              int.tryParse(
                                                  agilityController.text),
                                              int.tryParse(
                                                  balanceController.text),
                                              int.tryParse(
                                                  reactionsController.text),
                                              int.tryParse(ballcontrolController.text),
                                              int.tryParse(dribbling2Controller.text),
                                              int.tryParse(composureController.text),
                                              int.tryParse(defendingController.text),
                                              int.tryParse(intreceptionsController.text),
                                              int.tryParse(headingaccuracyController.text),
                                              int.tryParse(defawarenessController.text),
                                              int.tryParse(standingtackleController.text),
                                              int.tryParse(slidingtackleController.text),
                                              int.tryParse(pyhsicController.text),
                                              int.tryParse(jumpingController.text),
                                              int.tryParse(staminaController.text),
                                              int.tryParse(strengthController.text),
                                              int.tryParse(aggressionController.text),
                                              int.tryParse(gkdivingController.text),
                                              int.tryParse(gkhandlingController.text),
                                              int.tryParse(gkkickingController.text),
                                              int.tryParse(gkpositioningController.text),
                                              int.tryParse(gkreflexesController.text),
                                              data['key']);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Update Player"))
                                  ],
                                ),
                              );
                            });
                      },
                      icon: const Icon(Icons.edit)),
                  title: Text(data["short_name"]),
                  subtitle: Text("Overall: ${data["overall"]}"),
                  // Show data
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlayersDetail(id: data['key'])));
                  },
                  // Delete Data
                  trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text("Delete Player"),
                                content: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: Text("Delete This Player?"),
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        deletePlayers(data['key']);
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Yes")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No")),
                                ],
                              );
                            }));
                      },
                      icon: const Icon(Icons.delete)),
                );
              } else if (search.isEmpty &&
                  snapshot
                      .child("player_positions")
                      .value
                      .toString()
                      .toLowerCase()
                      .contains(searchfilter.toLowerCase())) {
                final data = snapshot.value as dynamic;
                data['key'] = snapshot.key;
                return ListTile(
                  // Edit data
                  leading: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              shortNameController.text = data["short_name"];
                              longNameController.text = data["long_name"];
                              positionController.text =
                                  data["player_positions"];
                              overallController.text =
                                  data["overall"].toString();
                              ageController.text = data["age"].toString();
                              heightController.text =
                                  data["height_cm"].toString();
                              weightController.text =
                                  data["weight_kg"].toString();
                              nationalityController.text =
                                  data["nationality_name"].toString();
                              selectedValue = data["preferred_foot"].toString();
                              paceController.text = data["pace"].toString();
                              accelerationController.text =
                                  data["movement_acceleration"].toString();
                              speedController.text =
                                  data["movement_sprint_speed"].toString();
                              shootingController.text =
                                  data["shooting"].toString();
                              positioningController.text =
                                  data["mentality_positioning"].toString();
                              finishingController.text =
                                  data["attacking_finishing"].toString();
                              shotpowerController.text =
                                  data["power_shot_power"].toString();
                              longshotsController.text =
                                  data["power_long_shots"].toString();
                              volleysController.text =
                                  data["attacking_volleys"].toString();
                              penaltiesController.text =
                                  data["mentality_penalties"].toString();
                              passingController.text =
                                  data["passing"].toString();
                              visionController.text =
                                  data["mentality_vision"].toString();
                              crossingController.text =
                                  data["attacking_crossing"].toString();
                              fkaccuracyController.text =
                                  data["skill_fk_accuracy"].toString();
                              shortpassingController.text =
                                  data["attacking_short_passing"].toString();
                              longpassingController.text =
                                  data["skill_long_passing"].toString();
                              curveController.text =
                                  data["skill_curve"].toString();
                              dribblingController.text =
                                  data["dribbling"].toString();
                              agilityController.text =
                                  data["movement_agility"].toString();
                              balanceController.text =
                                  data["movement_balance"].toString();
                              reactionsController.text =
                                  data["movement_reactions"].toString();
                              ballcontrolController.text =
                                  data["skill_ball_control"].toString();
                              dribbling2Controller.text =
                                  data["skill_dribbling"].toString();
                              composureController.text =
                                  data["mentality_composure"].toString();
                              defendingController.text =
                                  data["defending"].toString();
                              intreceptionsController.text =
                                  data["mentality_interceptions"].toString();
                              headingaccuracyController.text =
                                  data["attacking_heading_accuracy"].toString();
                              defawarenessController.text =
                                  data["defending_marking_awareness"]
                                      .toString();
                              standingtackleController.text =
                                  data["defending_standing_tackle"].toString();
                              slidingtackleController.text =
                                  data["defending_sliding_tackle"].toString();
                              pyhsicController.text = data["physic"].toString();
                              jumpingController.text =
                                  data["power_jumping"].toString();
                              staminaController.text =
                                  data["power_stamina"].toString();
                              strengthController.text =
                                  data["power_strength"].toString();
                              aggressionController.text =
                                  data["mentality_aggression"].toString();
                              gkdivingController.text =
                                  data["goalkeeping_diving"].toString();
                              gkhandlingController.text =
                                  data["goalkeeping_handling"].toString();
                              gkkickingController.text =
                                  data["goalkeeping_kicking"].toString();
                              gkpositioningController.text =
                                  data["goalkeeping_positioning"].toString();
                              gkreflexesController.text =
                                  data["goalkeeping_reflexes"].toString();

                              return SingleChildScrollView(
                                child: AlertDialog(
                                  title: const Text("Edit Player"),
                                  content: StatefulBuilder(
                                      builder: (context, setState) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          controller: shortNameController,
                                          decoration: const InputDecoration(
                                              hintText: "Short Name"),
                                        ),
                                        TextField(
                                          controller: longNameController,
                                          decoration: const InputDecoration(
                                              hintText: "Long Name"),
                                        ),
                                        DropDownMultiSelect(
                                          options: posisi,
                                          selectedValues: posisi_temp,
                                          onChanged: (value) {
                                            setState(() {
                                              posisi_temp = value;
                                              positionController.text =
                                                  posisi_temp.join(", ");
                                            });
                                            print("$posisi_temp");
                                            print("${positionController.text}");
                                          },
                                          whenEmpty: 'Positions',
                                        ),
                                        TextField(
                                          controller: ageController,
                                          decoration: const InputDecoration(
                                              hintText: "Age"),
                                        ),
                                        TextField(
                                          controller: heightController,
                                          decoration: const InputDecoration(
                                              hintText: "Height (cm)"),
                                        ),
                                        TextField(
                                          controller: weightController,
                                          decoration: const InputDecoration(
                                              hintText: "Weight (kg)"),
                                        ),
                                        TextField(
                                          controller: nationalityController,
                                          decoration: const InputDecoration(
                                              hintText: "Nationality"),
                                        ),
                                        // TextField(
                                        //   controller: footController,
                                        //   decoration: const InputDecoration(
                                        //       hintText:
                                        //           "Preferred Foot (Left/Right)"),
                                        // ),
                                        InputDecorator(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 10)),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: selectedValue,
                                              hint: Text("Preferred Foot"),
                                              onChanged: (String? newValue) {
                                                print("$selectedValue");
                                                setState(() {
                                                  selectedValue = newValue;
                                                  print("$selectedValue");
                                                });
                                              },
                                              items: dropdownItems
                                                  .map((String item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(item),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          controller: paceController,
                                          decoration: const InputDecoration(
                                              hintText: "Pace"),
                                        ),
                                        TextField(
                                          controller: accelerationController,
                                          decoration: const InputDecoration(
                                              hintText: "Acceleration (Pace)"),
                                        ),
                                        TextField(
                                          controller: speedController,
                                          decoration: const InputDecoration(
                                              hintText: "Sprint Speed (Pace)"),
                                        ),
                                        TextField(
                                          controller: shootingController,
                                          decoration: const InputDecoration(
                                              hintText: "Shooting"),
                                        ),
                                        TextField(
                                          controller: positioningController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Positioning (Shooting)"),
                                        ),
                                        TextField(
                                          controller: finishingController,
                                          decoration: const InputDecoration(
                                              hintText: "Finishing (Shooting)"),
                                        ),
                                        TextField(
                                          controller: shotpowerController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Shot Power (Shooting)"),
                                        ),
                                        TextField(
                                          controller: longshotsController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Long Shots (Shooting)"),
                                        ),
                                        TextField(
                                          controller: volleysController,
                                          decoration: const InputDecoration(
                                              hintText: "Volleys (Shooting)"),
                                        ),
                                        TextField(
                                          controller: penaltiesController,
                                          decoration: const InputDecoration(
                                              hintText: "Penalties (Shooting)"),
                                        ),
                                        TextField(
                                          controller: passingController,
                                          decoration: const InputDecoration(
                                              hintText: "Passing"),
                                        ),
                                        TextField(
                                          controller: visionController,
                                          decoration: const InputDecoration(
                                              hintText: "Vision (Passing)"),
                                        ),
                                        TextField(
                                          controller: crossingController,
                                          decoration: const InputDecoration(
                                              hintText: "Crossing (Passing)"),
                                        ),
                                        TextField(
                                          controller: fkaccuracyController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Free Kick Accuracy (Passing)"),
                                        ),
                                        TextField(
                                          controller: shortpassingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Short Passing (Passing)"),
                                        ),
                                        TextField(
                                          controller: longpassingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Long Passing (Passing)"),
                                        ),
                                        TextField(
                                          controller: curveController,
                                          decoration: const InputDecoration(
                                              hintText: "Curve (Passing)"),
                                        ),
                                        TextField(
                                          controller: dribblingController,
                                          decoration: const InputDecoration(
                                              hintText: "Dribbling"),
                                        ),
                                        TextField(
                                          controller: agilityController,
                                          decoration: const InputDecoration(
                                              hintText: "Agility (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: balanceController,
                                          decoration: const InputDecoration(
                                              hintText: "Balance (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: reactionsController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Reactions (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: ballcontrolController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Ball Control (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: dribbling2Controller,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Skill Dribbling (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: composureController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Composure (Dribbling)"),
                                        ),
                                        TextField(
                                          controller: defendingController,
                                          decoration: const InputDecoration(
                                              hintText: "Defending"),
                                        ),
                                        TextField(
                                          controller: intreceptionsController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Interceptions (Defending)"),
                                        ),
                                        TextField(
                                          controller: headingaccuracyController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Heading Accuracy (Defending)"),
                                        ),
                                        TextField(
                                          controller: defawarenessController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Def Awareness (Defending)"),
                                        ),
                                        TextField(
                                          controller: standingtackleController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Standing Tackle (Defending)"),
                                        ),
                                        TextField(
                                          controller: slidingtackleController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Sliding Tackle (Defending)"),
                                        ),
                                        TextField(
                                          controller: pyhsicController,
                                          decoration: const InputDecoration(
                                              hintText: "Physicality"),
                                        ),
                                        TextField(
                                          controller: jumpingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Jumping (Physicality)"),
                                        ),
                                        TextField(
                                          controller: staminaController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Stamina (Physicality)"),
                                        ),
                                        TextField(
                                          controller: strengthController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Strength (Physicality)"),
                                        ),
                                        TextField(
                                          controller: aggressionController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Aggression (Physicality)"),
                                        ),
                                        TextField(
                                          controller: gkdivingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Diving (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkhandlingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Handling (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkkickingController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Kicking (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkpositioningController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Positioning (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: gkreflexesController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "GK Reflexes (Goalkeeping)"),
                                        ),
                                        TextField(
                                          controller: overallController,
                                          decoration: const InputDecoration(
                                              hintText: "Overall"),
                                        ),
                                      ],
                                    );
                                  }),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          updatePlayers(
                                              shortNameController.text,
                                              longNameController.text,
                                              positionController.text,
                                              int.tryParse(
                                                  overallController.text),
                                              int.tryParse(ageController.text),
                                              int.tryParse(
                                                  heightController.text),
                                              int.tryParse(
                                                  weightController.text),
                                              nationalityController.text,
                                              selectedValue!,
                                              int.tryParse(paceController.text),
                                              int.tryParse(
                                                  accelerationController.text),
                                              int.tryParse(
                                                  speedController.text),
                                              int.tryParse(
                                                  shootingController.text),
                                              int.tryParse(
                                                  positioningController.text),
                                              int.tryParse(
                                                  finishingController.text),
                                              int.tryParse(
                                                  shotpowerController.text),
                                              int.tryParse(
                                                  longshotsController.text),
                                              int.tryParse(
                                                  volleysController.text),
                                              int.tryParse(
                                                  penaltiesController.text),
                                              int.tryParse(
                                                  passingController.text),
                                              int.tryParse(
                                                  visionController.text),
                                              int.tryParse(
                                                  crossingController.text),
                                              int.tryParse(
                                                  fkaccuracyController.text),
                                              int.tryParse(
                                                  shortpassingController.text),
                                              int.tryParse(
                                                  longpassingController.text),
                                              int.tryParse(
                                                  curveController.text),
                                              int.tryParse(
                                                  dribblingController.text),
                                              int.tryParse(
                                                  agilityController.text),
                                              int.tryParse(
                                                  balanceController.text),
                                              int.tryParse(
                                                  reactionsController.text),
                                              int.tryParse(ballcontrolController.text),
                                              int.tryParse(dribbling2Controller.text),
                                              int.tryParse(composureController.text),
                                              int.tryParse(defendingController.text),
                                              int.tryParse(intreceptionsController.text),
                                              int.tryParse(headingaccuracyController.text),
                                              int.tryParse(defawarenessController.text),
                                              int.tryParse(standingtackleController.text),
                                              int.tryParse(slidingtackleController.text),
                                              int.tryParse(pyhsicController.text),
                                              int.tryParse(jumpingController.text),
                                              int.tryParse(staminaController.text),
                                              int.tryParse(strengthController.text),
                                              int.tryParse(aggressionController.text),
                                              int.tryParse(gkdivingController.text),
                                              int.tryParse(gkhandlingController.text),
                                              int.tryParse(gkkickingController.text),
                                              int.tryParse(gkpositioningController.text),
                                              int.tryParse(gkreflexesController.text),
                                              data['key']);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Update Player"))
                                  ],
                                ),
                              );
                            });
                      },
                      icon: const Icon(Icons.edit)),
                  title: Text(data["short_name"]),
                  subtitle: Text("Overall: ${data["overall"]}"),
                  // Show data
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlayersDetail(id: data['key'])));
                  },
                  // Delete Data
                  trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text("Delete Player"),
                                content: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: Text("Delete This Player?"),
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        deletePlayers(data['key']);
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Yes")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No")),
                                ],
                              );
                            }));
                      },
                      icon: const Icon(Icons.delete)),
                );
              } else {
                return Container();
              }
            }),
      )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //         context: context,
      //         builder: (builder) {
      //           return AlertDialog(
      //             title: const Text("Add Player"),
      //             content: Column(children: [
      //               Text("data"),
      //               DropDownMultiSelect(
      //                   options: posisi,
      //                   selectedValues: posisi_temp,
      //                   onChanged: (value) {
      //                     setState(() {
      //                       posisi_temp = value;
      //                       search = posisi_temp.join(", ");
      //                     });
      //                     print(search);
      //                   })
      //             ]),
      //           );
      //         });
      //   },
      //   child: Icon(Icons.filter_alt_off_outlined),
      // ),
      // ),
    );
  }
}
