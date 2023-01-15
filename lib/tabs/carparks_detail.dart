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
                Text(state.faults.length.toString() + " reported faults!",
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
                Text(
                    state.suggestions.length.toString() +
                        " current suggestions!",
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
                  onPressed: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (ctx) {
                          TextEditingController controller =
                              TextEditingController();

                          return CupertinoAlertDialog(
                            title: Text('Report fault'),
                            content: CupertinoTextField(
                              controller: controller,
                              keyboardType: TextInputType.multiline,
                              minLines: 8,
                              maxLines: 8,
                            ),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                isDestructiveAction: true,
                                onPressed: () {
                                  Navigator.pop(ctx);

                                  setState(() => {
                                        state.faults.add({
                                          "carpark": details["Development"],
                                          "report": controller.text
                                        })
                                      });

                                  showCupertinoDialog(
                                      context: context,
                                      builder: (ctx2) {
                                        return CupertinoAlertDialog(
                                          title: Text("Reported"),
                                          content: Text(
                                              "We have submitted your report!"),
                                          actions: [
                                            CupertinoDialogAction(
                                              child: Text("Ok"),
                                              isDefaultAction: true,
                                              onPressed: () {
                                                Navigator.pop(ctx2);
                                              },
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: const Text('Submit'),
                              ),
                              CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          );
                        });
                  },
                ),
                Padding(padding: EdgeInsets.all(13)),
                CupertinoButton(
                  child: Text("Suggest"),
                  color: CupertinoColors.systemPink,
                  onPressed: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (ctx) {
                          TextEditingController controller =
                              TextEditingController();

                          return CupertinoAlertDialog(
                            title: Text('Suggestion'),
                            content: CupertinoTextField(
                              controller: controller,
                              keyboardType: TextInputType.multiline,
                              minLines: 8,
                              maxLines: 8,
                            ),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                isDestructiveAction: true,
                                onPressed: () {
                                  Navigator.pop(ctx);

                                  setState(() => {
                                        state.suggestions.add({
                                          "carpark": details["Development"],
                                          "suggestion": controller.text,
                                          "likes": 0
                                        })
                                      });

                                  showCupertinoDialog(
                                      context: context,
                                      builder: (ctx2) {
                                        return CupertinoAlertDialog(
                                          title: Text("Submitted"),
                                          content: Text(
                                              "We have submitted your suggestion!"),
                                          actions: [
                                            CupertinoDialogAction(
                                              child: Text("Ok"),
                                              isDefaultAction: true,
                                              onPressed: () {
                                                Navigator.pop(ctx2);
                                              },
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: const Text('Submit'),
                              ),
                              CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          );
                        });
                  },
                )
              ],
            ))
      ],
    ));
  }
}
