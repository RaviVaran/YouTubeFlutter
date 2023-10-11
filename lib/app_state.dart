import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _initisialSearch =
          prefs.getString('ff_initisialSearch') ?? _initisialSearch;
    });
    _safeInit(() {
      _History = prefs.getStringList('ff_History') ?? _History;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _simpleResult = [];
  List<dynamic> get simpleResult => _simpleResult;
  set simpleResult(List<dynamic> _value) {
    _simpleResult = _value;
  }

  void addToSimpleResult(dynamic _value) {
    _simpleResult.add(_value);
  }

  void removeFromSimpleResult(dynamic _value) {
    _simpleResult.remove(_value);
  }

  void removeAtIndexFromSimpleResult(int _index) {
    _simpleResult.removeAt(_index);
  }

  void updateSimpleResultAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _simpleResult[_index] = updateFn(_simpleResult[_index]);
  }

  void insertAtIndexInSimpleResult(int _index, dynamic _value) {
    _simpleResult.insert(_index, _value);
  }

  String _initisialSearch = 'it news';
  String get initisialSearch => _initisialSearch;
  set initisialSearch(String _value) {
    _initisialSearch = _value;
    prefs.setString('ff_initisialSearch', _value);
  }

  List<dynamic> _searchRefinements = [];
  List<dynamic> get searchRefinements => _searchRefinements;
  set searchRefinements(List<dynamic> _value) {
    _searchRefinements = _value;
  }

  void addToSearchRefinements(dynamic _value) {
    _searchRefinements.add(_value);
  }

  void removeFromSearchRefinements(dynamic _value) {
    _searchRefinements.remove(_value);
  }

  void removeAtIndexFromSearchRefinements(int _index) {
    _searchRefinements.removeAt(_index);
  }

  void updateSearchRefinementsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _searchRefinements[_index] = updateFn(_searchRefinements[_index]);
  }

  void insertAtIndexInSearchRefinements(int _index, dynamic _value) {
    _searchRefinements.insert(_index, _value);
  }

  List<String> _History = ['Hello', 'Hello world', 'ravivaran'];
  List<String> get History => _History;
  set History(List<String> _value) {
    _History = _value;
    prefs.setStringList('ff_History', _value);
  }

  void addToHistory(String _value) {
    _History.add(_value);
    prefs.setStringList('ff_History', _History);
  }

  void removeFromHistory(String _value) {
    _History.remove(_value);
    prefs.setStringList('ff_History', _History);
  }

  void removeAtIndexFromHistory(int _index) {
    _History.removeAt(_index);
    prefs.setStringList('ff_History', _History);
  }

  void updateHistoryAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _History[_index] = updateFn(_History[_index]);
    prefs.setStringList('ff_History', _History);
  }

  void insertAtIndexInHistory(int _index, String _value) {
    _History.insert(_index, _value);
    prefs.setStringList('ff_History', _History);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
