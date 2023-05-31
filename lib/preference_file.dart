import 'package:shared_preferences/shared_preferences.dart';

class MyPreferences {
  //Initialized the SharedPreference
  static SharedPreferences? _preferences;

  // Set the Keys here so that you dont about setting the keys on all the screens,
  //Using this format "static const keyname = value"
  //"static const keyname = value"

  static const _keyfirstInput = 'username';
  static const _keysecondInput = 'email';


  // Function to initialise the SharedPreference which will be called at
// the void main of the project
  static Future init() async => _preferences = await SharedPreferences.getInstance();

  // Prepare the getter and the Setters for all the values that will be used i
  static Future setFirstInput(String firstInput) async =>
      await _preferences!.setString(_keyfirstInput, firstInput);
  static String? getFirstInput() => _preferences!.getString(_keyfirstInput);

  static Future setSecondInput(String secondInput) async =>
      await _preferences!.setString(_keysecondInput, secondInput);
  static String? getSecondInput() => _preferences!.getString(_keysecondInput);




}
