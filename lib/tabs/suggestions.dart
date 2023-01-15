import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/tabs/carparks_search.dart';

import '../core/app_state.dart';

class Suggestions extends StatefulWidget {
  final AppState state;

  const Suggestions({super.key, required this.state});

  @override
  State<Suggestions> createState() => _SuggestionsState(state);
}

class _SuggestionsState extends State<Suggestions> {
  final AppState state;

  _SuggestionsState(this.state);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(),
        SliverFillRemaining(
            child: state.suggestions.length == 0
                ? Center(child: Text("No suggestions reported!"))
                : ListView.builder(
                    itemCount: state.suggestions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    state.suggestions[index]["carpark"] +
                                        " #" +
                                        (index + 1).toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  CupertinoButton(
                                      child: Icon(CupertinoIcons.star),
                                      onPressed: () {
                                        setState(() {
                                          state.suggestions[index]["likes"] += 1;
                                        });
                                      }),
                                  Text(state.suggestions[index]["likes"]
                                      .toString())
                                ],
                              ),
                              Text(state.suggestions[index]["suggestion"],
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
                          ));
                    },
                  )),
      ],
    ));
  }
}
