import 'package:csv_test/players_detail.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:multiselect/multiselect.dart';

class HomeScreenScout extends StatefulWidget {
  const HomeScreenScout({super.key});

  @override
  State<HomeScreenScout> createState() => _HomeScreenScoutState();
}

class _HomeScreenScoutState extends State<HomeScreenScout> {
  var reference = FirebaseDatabase.instance.ref();

  TextEditingController searchController = TextEditingController();
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
  List<String> posisi_temp = [];

  @override
  void initState() {
    super.initState();
    reference.child("/");
    print(searchController.text);
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
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ExpansionTile(
              title: Text("Filter by Position"),
              children: [
                DropDownMultiSelect(
                  options: posisi,
                  selectedValues: posisi_temp,
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
              // final data = snapshot.value as dynamic;
              // print(snapshot
              //     .child("long_name")
              //     .value
              //     .toString()
              //     .toLowerCase()
              //     .contains(searchController.text.toLowerCase()));
              // data['key'] = snapshot.key;
              if (search.isEmpty &&
                  search == "" &&
                  searchfilter.isEmpty &&
                  searchfilter == "") {
                final data = snapshot.value as dynamic;
                data['key'] = snapshot.key;
                return ListTile(
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
                );
              } else {
                return Container();
              }
            }),
      )),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {},
                ),
                hintText: 'Search Players',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
