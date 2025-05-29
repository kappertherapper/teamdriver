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

Future<void> shareToLinkedIn(String url) async {
  if (url.isEmpty || !url.startsWith('http')) {
    throw 'Invalid URL. Make sure it starts with http or https.';
  }

  final encodedUrl = Uri.encodeComponent(url);
  final linkedinSharerUrl =
      "https://www.linkedin.com/sharing/share-offsite/?url=$encodedUrl";

  if (await canLaunchUrl(Uri.parse(linkedinSharerUrl))) {
    await launchUrl(Uri.parse(linkedinSharerUrl));
  } else {
    throw 'Could not launch $linkedinSharerUrl';
  }
}
