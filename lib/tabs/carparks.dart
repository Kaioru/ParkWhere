import 'package:flutter/cupertino.dart';
import 'package:testing/tabs/carparks_search.dart';

class Carparks extends StatefulWidget {
  const Carparks({super.key});

  @override
  State<Carparks> createState() => _CarparksState();
}

class _CarparksState extends State<Carparks> {
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
                          child: CarparksSearch());
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
