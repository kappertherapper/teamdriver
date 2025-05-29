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

Future<void> shareToX(String? text, String? url) async {
  if (url == null || !url.startsWith('http')) {
    throw 'Invalid URL. Make sure it starts with http or https.';
  }
  final safeUrl = url ?? " ";
  final safeText = text ?? " ";

  final teamDriverHashtag = "teamdriver";

  // Encode parametre
  final encodedText = Uri.encodeComponent(safeText);
  final encodedUrl = Uri.encodeComponent(safeUrl);
  final encodedHashtag = Uri.encodeComponent(teamDriverHashtag);

  // X URL
  final xSharerUrl =
      "https://twitter.com/intent/tweet?text=$encodedText&url=$encodedUrl&hashtags=$encodedHashtag";

  // Åbn linket
  if (await canLaunchUrl(Uri.parse(xSharerUrl))) {
    await launchUrl(Uri.parse(xSharerUrl));
  } else {
    throw 'Could not launch $xSharerUrl';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
