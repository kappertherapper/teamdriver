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

class MyHtmlEditor extends StatefulWidget {
  const MyHtmlEditor({
    Key? key,
    this.width,
    this.height,
    this.currentHtml,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? currentHtml;

  @override
  _MyHtmlEditorState createState() => _MyHtmlEditorState();
}

class _MyHtmlEditorState extends State<MyHtmlEditor> {
  HtmlEditorController controller = HtmlEditorController();
  Timer? _debounce;
  String lastSave = "";

  @override
  void initState() {
    super.initState();

    _debounce = Timer.periodic(Duration(milliseconds: 1), (timer) {
      controller.getText().then((updatedText) {
        if (updatedText != lastSave && updatedText.isNotEmpty) {
          lastSave = updatedText;

          FFAppState().update(() {
            FFAppState().textFromHtmlEditor =
                updatedText; // appstate update (name: textFromHtmlEditor)
          });
        }
      });
    });

    ServicesBinding.instance.keyboard.addHandler(_handleKeyPress);
  }

  bool _handleKeyPress(KeyEvent event) {
    final keysPressed = HardwareKeyboard.instance.logicalKeysPressed;

    if (keysPressed.contains(LogicalKeyboardKey.controlLeft) ||
        keysPressed.contains(LogicalKeyboardKey.controlRight)) {
      if (keysPressed.contains(LogicalKeyboardKey.keyB)) {
        controller.execCommand('bold'); // Ctrl + B → Bold
        return true;
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyI)) {
        controller.execCommand('italic'); // Ctrl + I → Italic
        return true;
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyU)) {
        controller.execCommand('underline'); // Ctrl + U → Underline
        return true;
      }
    }
    return false; //
  }

  @override
  Widget build(BuildContext context) {
    return HtmlEditor(
      controller: controller,
      htmlEditorOptions: HtmlEditorOptions(
        hint: "Type your text here",
        initialText: widget.currentHtml,
      ),
      htmlToolbarOptions: HtmlToolbarOptions(
        toolbarType: ToolbarType.nativeGrid,
        onButtonPressed: (ButtonType type, bool? status, Function? _) {
          Future.microtask(() => controller.setFocus()); // auto-focus
          return true;
        },
      ),
      otherOptions: OtherOptions(
        height: 400,
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel(); // clean-up
    super.dispose();
  }
}
