import 'package:flutter/cupertino.dart';
import 'package:testing/tabs/carparks_search.dart';

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
                );
              },
              child: Icon(CupertinoIcons.search)),
        )
      ],
    ));
  }
}
