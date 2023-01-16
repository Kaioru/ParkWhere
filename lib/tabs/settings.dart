import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/app_state.dart';

class Settings extends StatefulWidget {
  final AppState state;

  const Settings({super.key, required this.state});

  @override
  State<Settings> createState() => _SettingsState(state);
}

class _SettingsState extends State<Settings> {
  final AppState state;

  _SettingsState(this.state);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(slivers: [
      CupertinoSliverNavigationBar(),
      SliverFillRemaining(
        child: ListView(
          children: [
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 32.0,
                            backgroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/122724041?v=4")),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Peter Lim",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Top Carpark Complainer",
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black))
                            ],
                          ),
                        ))
                      ],
                    )
                  ],
                ),
                height: 120.0,
                padding: EdgeInsets.all(13.0),
                margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
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
                )),
            Padding(padding: EdgeInsets.all(13.0)),
            Padding(
              padding: EdgeInsets.only(left: 13.0, right: 13.0, top: 4.0),
              child:
                  CupertinoButton.filled(child: Text("Display"), onPressed: () {}),
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.0, right: 13.0, top: 4.0),
              child:
                  CupertinoButton.filled(child: Text("Language"), onPressed: () {}),
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.0, right: 13.0, top: 4.0),
              child:
                  CupertinoButton.filled(child: Text("Privacy and Security"), onPressed: () {}),
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.0, right: 13.0, top: 4.0),
              child:
                  CupertinoButton.filled(child: Text("Contact Us"), onPressed: () {}),
            ),
          ],
        ),
      )
    ]));
  }
}
