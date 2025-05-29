// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:url_launcher/url_launcher.dart';

Future<void> shareToSMS(String phoneNumber, String message) async {
  final Uri smsUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
    queryParameters: {'body': message},
  );

  if (await canLaunchUrl(smsUri)) {
    await launchUrl(smsUri);
  } else {
    throw 'Could not launch $smsUri';
  }
}
