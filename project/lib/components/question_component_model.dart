import '/flutter_flow/flutter_flow_util.dart';
import 'question_component_widget.dart' show QuestionComponentWidget;
import 'package:flutter/material.dart';

class QuestionComponentModel extends FlutterFlowModel<QuestionComponentWidget> {
  ///  Local state fields for this component.

  double? currentSliderValue;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
