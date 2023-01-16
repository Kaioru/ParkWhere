import 'package:flutter/cupertino.dart';
import 'package:testing/core/app_state.dart';
import 'package:testing/tabs/carparks.dart';
import 'package:testing/tabs/error.dart';
import 'package:testing/tabs/faults.dart';
import 'package:testing/tabs/settings.dart';
import 'package:testing/tabs/suggestions.dart';

void main() {
  runApp(const ParkWhereApp());
}

class ParkWhereApp extends StatelessWidget {
  const ParkWhereApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: ParkWhere(),
    );
  }
}

class ParkWhere extends StatefulWidget {
  const ParkWhere({super.key});

  @override
  State<ParkWhere> createState() => _ParkWhereState();
}

class _ParkWhereState extends State<ParkWhere> {
  final AppState state = AppState();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.car),
              label: 'Carparks',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.wrench),
              label: 'Faults',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.star),
              label: 'Suggestions',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.gear),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => Carparks(state: state),
                defaultTitle: 'Carparks',
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => Faults(state: state),
                defaultTitle: 'Faults',
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => Suggestions(state: state),
                defaultTitle: 'Suggestions',
              );
            case 3:
              return CupertinoTabView(
                builder: (BuildContext context) => Settings(state: state),
                defaultTitle: 'Settings',
              );
          }
          return const Error();
        });
  }
}
