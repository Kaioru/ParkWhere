class AppState {
  late List<String> pins;
  late List<dynamic> faults;
  late List<dynamic> suggestions;

  AppState() {
    pins = List.empty(growable: true);
    faults = List.empty(growable: true);
    suggestions = List.empty(growable: true);
  }
}
