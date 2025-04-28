// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance!;
  }

  static void setProfile(String profile) async {
    await _prefsInstance!.setString("profile", profile);
  }

  static Future<Map<String, dynamic>> getProfile() async {
    Map<String, dynamic> mapProfile =
        jsonDecode(_prefsInstance!.getString("profile")!);
    return mapProfile;
  }
}
