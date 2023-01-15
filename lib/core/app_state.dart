import 'package:testing/core/carpark_detail.dart';

class AppState {
  late List<CarparkDetail> carparks;

  AppState() {
    carparks = List.empty(growable: true);
  }
}
