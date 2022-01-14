import 'dart:convert' as convert;
import 'package:save_data_googlesheet_flutter/model/form.dart';
import 'package:http/http.dart' as http;

class FormController {
  // Callback function to give response of status of current request.
  final void Function(String) callback;

  // Google App Script Web URL
  static const String URL =
      "https://script.google.com/macros/s/AKfycbw5OgzIKuUwicqI0HcfkgWzn3xJSYG_K4oJuLghUDyImR-QDK9O0hSoTjfU3ujgbPTT/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http.get(Uri.parse(URL + feedbackForm.toParams())).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
    }
  }
}
