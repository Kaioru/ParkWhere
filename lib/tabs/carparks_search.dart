import 'package:flutter/cupertino.dart';

class CarparksSearch extends StatefulWidget {
  const CarparksSearch({super.key});

  @override
  State<CarparksSearch> createState() => _CarparksSearchState();
}

class _CarparksSearchState extends State<CarparksSearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoSearchTextField(),
        )
      ],
    ));
  }
}
