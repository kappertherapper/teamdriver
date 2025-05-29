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

import 'package:webviewx_plus/webviewx_plus.dart';

class MyHtmlView extends StatefulWidget {
  const MyHtmlView({Key? key, this.width, this.height, required this.html})
      : super(key: key);

  final String html;
  final double? width;
  final double? height;

  @override
  _MyHtmlViewState createState() => _MyHtmlViewState();
}

class _MyHtmlViewState extends State<MyHtmlView> {
  late WebViewXController webViewController;

  // Method to inject CSS that hides the scrollbar
  String _injectCssToHideScrollbar(String htmlContent) {
    return '''
    <html>
      <head>
        <style>
          body {
            overflow: hidden;  /* Disable scrolling */
            -ms-overflow-style: none; /* For Internet Explorer */
            scrollbar-width: none; /* For Firefox */
          }
        </style>
      </head>
      <body>
        $htmlContent
      </body>
    </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    // Inject CSS into the HTML content before passing it to the WebViewX widget
    String modifiedHtml = _injectCssToHideScrollbar(widget.html);

    return WebViewX(
      width: widget.width ?? 300,
      height: widget.height ?? 400,
      initialContent:
          modifiedHtml, // Pass the modified HTML with the injected CSS
      initialSourceType: SourceType.html,
      onWebViewCreated: (controller) {
        webViewController = controller;
      },
      javascriptMode: JavascriptMode.unrestricted,
      ignoreAllGestures: true, // Disable all gestures including scrolling
    );
  }
}
