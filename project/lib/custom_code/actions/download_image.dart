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

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<void> downloadImage(String imagePath) async {
  try {
    if (Uri.tryParse(imagePath)?.hasAbsolutePath ?? false) {
      // Image path is a URL (remote file)
      final response = await http.get(Uri.parse(imagePath));
      if (response.statusCode == 200) {
        // Get the app's local directory
        final directory = await getApplicationDocumentsDirectory();
        // Define the path for the downloaded image
        final filePath = '${directory.path}/downloaded_image.jpg';
        // Save the image data to a file
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        print('Image downloaded to: $filePath');
      } else {
        print('Failed to download image from URL: ${response.statusCode}');
      }
    } else {
      // Image path is a local asset or file
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/copied_image.jpg';
      final bytes = await File(imagePath).readAsBytes();
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      print('Image copied to: $filePath');
    }
  } catch (e) {
    print('Error handling image path: $e');
  }
}
