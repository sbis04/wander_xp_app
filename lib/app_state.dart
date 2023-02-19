import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _userEmail = await secureStorage.getString('ff_userEmail') ?? _userEmail;
    _userPassword =
        await secureStorage.getString('ff_userPassword') ?? _userPassword;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _placeName = '';
  String get placeName => _placeName;
  set placeName(String _value) {
    _placeName = _value;
  }

  DateTime? _tripStartDate;
  DateTime? get tripStartDate => _tripStartDate;
  set tripStartDate(DateTime? _value) {
    _tripStartDate = _value;
  }

  String _flightNumberArrival = '';
  String get flightNumberArrival => _flightNumberArrival;
  set flightNumberArrival(String _value) {
    _flightNumberArrival = _value;
  }

  String _flightNumberDeparture = '';
  String get flightNumberDeparture => _flightNumberDeparture;
  set flightNumberDeparture(String _value) {
    _flightNumberDeparture = _value;
  }

  String _hotelName = '';
  String get hotelName => _hotelName;
  set hotelName(String _value) {
    _hotelName = _value;
  }

  String _hotelAddress = '';
  String get hotelAddress => _hotelAddress;
  set hotelAddress(String _value) {
    _hotelAddress = _value;
  }

  String _hotelConfirmationCode = '';
  String get hotelConfirmationCode => _hotelConfirmationCode;
  set hotelConfirmationCode(String _value) {
    _hotelConfirmationCode = _value;
  }

  String _hotelPhone = '';
  String get hotelPhone => _hotelPhone;
  set hotelPhone(String _value) {
    _hotelPhone = _value;
  }

  List<String> _placesToVisit = [];
  List<String> get placesToVisit => _placesToVisit;
  set placesToVisit(List<String> _value) {
    _placesToVisit = _value;
  }

  void addToPlacesToVisit(String _value) {
    _placesToVisit.add(_value);
  }

  void removeFromPlacesToVisit(String _value) {
    _placesToVisit.remove(_value);
  }

  void removeAtIndexFromPlacesToVisit(int _index) {
    _placesToVisit.removeAt(_index);
  }

  List<String> _placesToVisitNotes = [];
  List<String> get placesToVisitNotes => _placesToVisitNotes;
  set placesToVisitNotes(List<String> _value) {
    _placesToVisitNotes = _value;
  }

  void addToPlacesToVisitNotes(String _value) {
    _placesToVisitNotes.add(_value);
  }

  void removeFromPlacesToVisitNotes(String _value) {
    _placesToVisitNotes.remove(_value);
  }

  void removeAtIndexFromPlacesToVisitNotes(int _index) {
    _placesToVisitNotes.removeAt(_index);
  }

  DateTime? _tripEndDate;
  DateTime? get tripEndDate => _tripEndDate;
  set tripEndDate(DateTime? _value) {
    _tripEndDate = _value;
  }

  String _kStatusSuccess = 'SUCCESS';
  String get kStatusSuccess => _kStatusSuccess;
  set kStatusSuccess(String _value) {
    _kStatusSuccess = _value;
  }

  String _kStatusError = 'ERROR';
  String get kStatusError => _kStatusError;
  set kStatusError(String _value) {
    _kStatusError = _value;
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String _value) {
    _userEmail = _value;
    secureStorage.setString('ff_userEmail', _value);
  }

  void deleteUserEmail() {
    secureStorage.delete(key: 'ff_userEmail');
  }

  String _userPassword = '';
  String get userPassword => _userPassword;
  set userPassword(String _value) {
    _userPassword = _value;
    secureStorage.setString('ff_userPassword', _value);
  }

  void deleteUserPassword() {
    secureStorage.delete(key: 'ff_userPassword');
  }

  List<String> _placeCities = [];
  List<String> get placeCities => _placeCities;
  set placeCities(List<String> _value) {
    _placeCities = _value;
  }

  void addToPlaceCities(String _value) {
    _placeCities.add(_value);
  }

  void removeFromPlaceCities(String _value) {
    _placeCities.remove(_value);
  }

  void removeAtIndexFromPlaceCities(int _index) {
    _placeCities.removeAt(_index);
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String _value) {
    _userName = _value;
  }

  String _uid = '';
  String get uid => _uid;
  set uid(String _value) {
    _uid = _value;
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
