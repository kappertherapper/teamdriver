// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:html_editor_enhanced/html_editor.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:uuid/uuid.dart';

class MyHtmlEditorCopy extends StatefulWidget {
  const MyHtmlEditorCopy({
    Key? key,
    this.width,
    this.height,
    this.currentHtml,
    this.pictureQuality = 50,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? currentHtml;
  final int pictureQuality;

  @override
  _MyHtmlEditorCopyState createState() => _MyHtmlEditorCopyState();
}

class _MyHtmlEditorCopyState extends State<MyHtmlEditorCopy> {
  HtmlEditorController controller = HtmlEditorController();
  String lastSave = "";
  final FirebaseStorage _storage = FirebaseStorage.instance;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    ServicesBinding.instance.keyboard.addHandler(_handleKeyPress);
  }

  bool _handleKeyPress(KeyEvent event) {
    final keysPressed = HardwareKeyboard.instance.logicalKeysPressed;

    if (keysPressed.contains(LogicalKeyboardKey.controlLeft) ||
        keysPressed.contains(LogicalKeyboardKey.controlRight)) {
      if (keysPressed.contains(LogicalKeyboardKey.keyB)) {
        controller.execCommand('bold'); // Ctrl + B
        return true;
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyI)) {
        controller.execCommand('italic'); // Ctrl + I
        return true;
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyU)) {
        controller.execCommand('underline'); // Ctrl + U
        return true;
      }
    }
    return false;
  }

  Future<String?> _uploadImageToFirebase(PlatformFile file) async {
    setState(() {
      _isUploading = true;
    });

    try {
      Uint8List? compressedBytes = file.bytes;

      if (widget.pictureQuality >= 0 && widget.pictureQuality <= 100) {
        compressedBytes = await FlutterImageCompress.compressWithList(
          file.bytes!,
          quality: widget.pictureQuality,
        );
      }

      String filename = 'images/${Uuid().v4()}_${file.name}';
      Reference ref = _storage.ref().child(filename);

      if (compressedBytes != null) {
        UploadTask uploadTask = ref.putData(compressedBytes);
        TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        print("Error compressing image, uploading original quality.");
        UploadTask uploadTask = ref.putData(file.bytes!);
        TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      }
    } catch (e) {
      print("Error uploading image to Firebase: $e");
      return null;
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        HtmlEditor(
          controller: controller,
          htmlEditorOptions: HtmlEditorOptions(
            hint: "Type your text here",
            initialText: widget.currentHtml,
            autoAdjustHeight: false,
          ),
          htmlToolbarOptions: HtmlToolbarOptions(
            toolbarType: ToolbarType.nativeGrid,
            onButtonPressed: (ButtonType type, bool? status, Function? _) {
              Future.microtask(() => controller.setFocus());
              return true;
            },
            mediaUploadInterceptor:
                (PlatformFile file, InsertFileType type) async {
              if (type == InsertFileType.image) {
                String? firebaseUrl = await _uploadImageToFirebase(file);
                if (firebaseUrl != null) {
                  controller.insertNetworkImage(firebaseUrl);
                }
                return false;
              }
              return true;
            },
          ),
          otherOptions: OtherOptions(
            height: 400,
          ),
          callbacks: Callbacks(
            onChangeContent: (String? changed) {
              if (changed != null && changed != lastSave) {
                lastSave = changed;
                FFAppState().update(() {
                  FFAppState().textFromHtmlEditor = changed; // appstate update
                });
              }
            },
            onInit: () {
              if (widget.currentHtml != null &&
                  widget.currentHtml!.isNotEmpty) {
                controller.setText(widget.currentHtml!);
              }
            },
          ),
        ),
        if (_isUploading)
          Positioned(
            top: 50, // Keep at top
            left: 0, // Required for centering with right: 0
            right: 0, // Stretch horizontally to enable centering
            child: Center(
              // Center the CircularProgressIndicator horizontally
              child: SizedBox(
                width: 80, // Increased size to 40x40
                height: 80,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                  strokeWidth: 8, // Adjust strokeWidth as needed
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
