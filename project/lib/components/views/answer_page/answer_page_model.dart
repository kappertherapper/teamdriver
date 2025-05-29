import '/components/question_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'answer_page_widget.dart' show AnswerPageWidget;
import 'package:flutter/material.dart';

class AnswerPageModel extends FlutterFlowModel<AnswerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for QuestionComponent component.
  late QuestionComponentModel questionComponentModel;

  @override
  void initState(BuildContext context) {
    questionComponentModel =
        createModel(context, () => QuestionComponentModel());
  }

  @override
  void dispose() {
    questionComponentModel.dispose();
  }
}
