import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  var isDarkMode = true.obs;
  var notification = true.obs;
  var reminder = true.obs;

  var defaultLanguage = 'en, US'.obs;

  @override
  void onReady() {
    super.onReady();
    // spService.getLanguage(defaultLanguage.value);
  }

  // change language
  changeLanguage(param1, param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
    //save state of current language
    // spService.setLanguage(param1, param2);
    print('$param1, $param2');
    update();
  }

  // switch flip

  flipSwitch(value) {
    value = !value;
    print(value);
  }

  // launch url
  void launchGmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'flutterboyfriend200@gmail.com',
      query: 'subject= Suggest A Feature Todey&body = ',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch gmail');
    }
  }

  //Report a problem
  void reportProblem() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'flutterboyfriend200@gmail.com',
        query: 'subject=Report A Problem Todey&body= ');
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch gmail');
    }
  }

  void launchTwitter() async {
    final String url = 'https://www.twitter.com/@ichie200';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch twitter');
    }
  }

  void changeTheme(bool value) {
    if (value) {
      Get.changeThemeMode(ThemeMode.dark);
      update();
    } else {
      Get.changeThemeMode(ThemeMode.light);
      update();
    }
  }
}
