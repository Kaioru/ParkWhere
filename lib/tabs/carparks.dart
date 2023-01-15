import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/tabs/carparks_search.dart';
import 'package:http/http.dart' as http;

import '../core/app_state.dart';

class Carparks extends StatefulWidget {
  final AppState state;
  const Carparks({super.key, required this.state});

  @override
  State<Carparks> createState() => _CarparksState(state);
}

class _CarparksState extends State<Carparks> {
  final AppState state;

  _CarparksState(this.state);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          trailing: CupertinoButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) {
                      return CupertinoPageScaffold(
                          navigationBar: CupertinoNavigationBar(
                            middle: Text('Search for carparks'),
                          ),
                          child: CarparksSearch(state: state));
                    },
                  ),
                ).then((_) => setState(() {}));
              },
              child: Icon(CupertinoIcons.search)),
        ),
        SliverFillRemaining(
            child: FutureBuilder(future: Future<dynamic>(() async {
          final response = await http.get(
              Uri.parse(
                  'http://datamall2.mytransport.sg/ltaodataservice/CarParkAvailabilityv2'),
              headers: {"AccountKey": "Io54g7V1TSWPZuswdOhHOw=="});

          return jsonDecode(response.body)["value"].where((v) => state.pins.contains(v["CarParkID"].toString())).toList();
        }), builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CupertinoActivityIndicator();
          }

          if (snapshot.data.length == 0) {
            return Center(child: Text("No pinned carparks!"));
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
                    });},
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
        }),
        )
      ],
    ));
  }
}
