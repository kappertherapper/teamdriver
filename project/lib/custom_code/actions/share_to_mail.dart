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

Future<void> shareToMail(String? subject, String? body) async {
  // Encode parameters
  final safeSubject = Uri.encodeComponent(subject ?? "Default Subject");
  final safeBody = Uri.encodeComponent(body ?? "This is the email body.");

  // Mail link
  final mailtoUrl = "mailto:?subject=$safeSubject&body=$safeBody";

  // Launch link
  if (await canLaunchUrl(Uri.parse(mailtoUrl))) {
    await launchUrl(Uri.parse(mailtoUrl));
  } else {
    throw 'Could not launch $mailtoUrl';
  }
}
