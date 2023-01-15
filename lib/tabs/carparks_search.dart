import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarparksSearch extends StatefulWidget {
  const CarparksSearch({super.key});

  @override
  State<CarparksSearch> createState() => _CarparksSearchState();
}

class _CarparksSearchState extends State<CarparksSearch> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
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
              headers: {"AccountKey": "Io54g7V1TSWPZuswdOhHOw=="});

          return jsonDecode(response.body)["value"];
        }), builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CupertinoActivityIndicator();
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(snapshot.data[index]["Development"]);
            },
          );
        }))
      ],
    ));
  }
}
