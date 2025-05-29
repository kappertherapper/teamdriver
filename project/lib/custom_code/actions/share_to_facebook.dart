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

import 'package:url_launcher/url_launcher.dart';

Future<void> shareToFacebook(String url) async {
  // Encode URL (URL-safe)
  final encodedUrl = Uri.encodeComponent(url);

  // Create Facebook link
  final facebookUrl =
      "https://www.facebook.com/sharer/sharer.php?u=$encodedUrl";

  // Launch in browser
  if (await canLaunchUrl(Uri.parse(facebookUrl))) {
    await launchUrl(Uri.parse(facebookUrl));
  } else {
    throw 'Could not launch $facebookUrl';
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
