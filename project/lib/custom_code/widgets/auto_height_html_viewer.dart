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

import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:html' as html;

class AutoHeightHtmlViewer extends StatefulWidget {
  const AutoHeightHtmlViewer({Key? key, required this.html, this.width})
      : super(key: key);

  final String html;
  final double? width;

  @override
  _AutoHeightHtmlViewerState createState() => _AutoHeightHtmlViewerState();
}

class _AutoHeightHtmlViewerState extends State<AutoHeightHtmlViewer> {
  late final WebViewController _webViewController;
  double _height = 100; // Default height

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString("<html><body>${widget.html}</body></html>");

    _calculateHeight();
  }

  Future<void> _calculateHeight() async {
    double newHeight = await calculateWebViewHeight(widget.html);
    if (mounted) {
      setState(() {
        _height = newHeight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: _height, // Dynamic height
      child: WebViewWidget(controller: _webViewController),
    );
  }
}

// Function to calculate HTML content height before rendering
Future<double> calculateWebViewHeight(String bodyContent) async {
  final completer = Completer<double>();

  final div = html.DivElement();
  div.style.visibility = 'hidden';
  div.style.position = 'absolute';
  div.style.width = '100%';

  div.setInnerHtml(bodyContent, validator: html.NodeValidatorBuilder.common());
  html.document.body?.append(div);

  Future.delayed(Duration(milliseconds: 50), () {
    final height = div.offsetHeight.toDouble();
    completer.complete(height);
    div.remove();
  });

  return completer.future;
}
