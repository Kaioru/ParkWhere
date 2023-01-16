import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../core/app_state.dart';

class CarparksSearch extends StatefulWidget {
  final AppState state;

  const CarparksSearch({super.key, required this.state});

  @override
  State<CarparksSearch> createState() => _CarparksSearchState(state);
}

class _CarparksSearchState extends State<CarparksSearch> {
  final AppState state;
  late TextEditingController textController;
  String search = "";

  _CarparksSearchState(this.state);

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
    textController.addListener(updateSearch);
  }

  void updateSearch() {
    setState(() => {search = textController.text});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              controller: textController,
            ),
          ),
        ),
        Expanded(
            child: FutureBuilder(future: Future<dynamic>(() async {
          final response = await http.get(
              Uri.parse(
                  'http://datamall2.mytransport.sg/ltaodataservice/CarParkAvailabilityv2'),
              headers: {"AccountKey": String.fromEnvironment('DATAMALL_KEY')});

          return jsonDecode(response.body)["value"]
              .where((v) => v["Development"]
                  .toString()
                  .toLowerCase()
                  .contains(search.toLowerCase()))
              .toList();
        }), builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CupertinoActivityIndicator();
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!state.pins.contains(
                          snapshot.data[index]["CarParkID"].toString())) {
                        state.pins
                            .add(snapshot.data[index]["CarParkID"].toString());
                      } else {
                        state.pins
                            .remove(snapshot.data[index]["CarParkID"].toString());
                      }
                    });
                  },
                  child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(state.pins.contains(snapshot.data[index]
                                          ["CarParkID"]
                                      .toString())
                                  ? CupertinoIcons.pin_fill
                                  : CupertinoIcons.pin),
                              Expanded(
                                  child: Text(
                                snapshot.data[index]["Development"]
                                    .toString()
                                    .toTitleCase(),
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                          Text(
                              snapshot.data[index]["AvailableLots"].toString() +
                                  " available lots!",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black)),
                        ],
                      ),
                      height: 80.0,
                      padding: EdgeInsets.all(13.0),
                      margin:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(13.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          ),
                        ],
                      )));
            },
          );
        }))
      ],
    ));
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
