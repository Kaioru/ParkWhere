import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/tabs/carparks_search.dart';

import '../core/app_state.dart';

class CarparksDetail extends StatefulWidget {
  final AppState state;
  final dynamic details;

  const CarparksDetail({super.key, required this.state, this.details});

  @override
  State<CarparksDetail> createState() => _CarparksDetailState(state, details);
}

class _CarparksDetailState extends State<CarparksDetail> {
  final AppState state;
  final dynamic details;

  _CarparksDetailState(this.state, this.details);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.fullscreen),
                    Padding(padding: EdgeInsets.all(4)),
                    Expanded(
                        child: Text(
                      "Capacity",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
                Text(details["AvailableLots"].toString() + " available lots!",
                    style: TextStyle(fontSize: 12.0, color: Colors.black)),
              ],
            ),
            height: 80.0,
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
        Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.wrench),
                    Padding(padding: EdgeInsets.all(4)),
                    Expanded(
                        child: Text(
                      "Faults",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
                Text(0.toString() + " reported faults!",
                    style: TextStyle(fontSize: 12.0, color: Colors.black)),
              ],
            ),
            height: 80.0,
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
        Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.heart),
                    Padding(padding: EdgeInsets.all(4)),
                    Expanded(
                        child: Text(
                      "Suggestions",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
                Text(0.toString() + " current suggestions!",
                    style: TextStyle(fontSize: 12.0, color: Colors.black)),
              ],
            ),
            height: 80.0,
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
        Container(
            padding: EdgeInsets.all(13.0),
            child: Row(
              children: [
                CupertinoButton(
                  child: Text("Report"),
                  color: CupertinoColors.destructiveRed,
                  onPressed: () {},
                ),
                Padding(padding: EdgeInsets.all(13)),
                CupertinoButton(
                  child: Text("Suggest"),
                  color: CupertinoColors.systemPink,
                  onPressed: () {},
                )
              ],
            ))
      ],
    ));
  }
}
