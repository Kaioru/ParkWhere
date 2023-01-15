import 'package:flutter/cupertino.dart';
import 'package:testing/tabs/carparks_search.dart';

class Faults extends StatefulWidget {
  const Faults({super.key});

  @override
  State<Faults> createState() => _FaultsState();
}

class _FaultsState extends State<Faults> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(),
      ],
    ));
  }
}
