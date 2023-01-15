import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/tabs/carparks_search.dart';

import '../core/app_state.dart';

class Faults extends StatefulWidget {
  final AppState state;

  const Faults({super.key, required this.state});

  @override
  State<Faults> createState() => _FaultsState(state);
}

class _FaultsState extends State<Faults> {
  final AppState state;

  _FaultsState(this.state);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(),
        SliverFillRemaining(
            child: state.faults.length == 0
                ? Center(child: Text("No faults reported!"))
                : ListView.builder(
                    itemCount: state.faults.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {},
                          child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Text(
                                        state.faults[index]["carpark"] +
                                            " #" +
                                            (index + 1).toString(),
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ))
                                    ],
                                  ),
                                  Text(state.faults[index]["report"],
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.black)),
                                ],
                              ),
                              height: 180.0,
                              padding: EdgeInsets.all(13.0),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 6.0),
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
                  )),
      ],
    ));
  }
}
