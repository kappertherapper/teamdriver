import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_survey_widget.dart' show CreateSurveyWidget;
import 'package:flutter/material.dart';

class CreateSurveyModel extends FlutterFlowModel<CreateSurveyWidget> {
  ///  Local state fields for this page.

  DocumentReference? currentlySelectedQuestion;

  DocumentReference? createdSurvey;

  List<DocumentReference> emptyQuestionList = [];
  void addToEmptyQuestionList(DocumentReference item) =>
      emptyQuestionList.add(item);
  void removeFromEmptyQuestionList(DocumentReference item) =>
      emptyQuestionList.remove(item);
  void removeAtIndexFromEmptyQuestionList(int index) =>
      emptyQuestionList.removeAt(index);
  void insertAtIndexInEmptyQuestionList(int index, DocumentReference item) =>
      emptyQuestionList.insert(index, item);
  void updateEmptyQuestionListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      emptyQuestionList[index] = updateFn(emptyQuestionList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CreateSurvey widget.
  SurveysRecord? loadedSurvey;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in SaveSurveyBtn widget.
  SurveysRecord? createSurvey;
  // State field(s) for NameTextFieldCreate widget.
  FocusNode? nameTextFieldCreateFocusNode;
  TextEditingController? nameTextFieldCreateTextController;
  String? Function(BuildContext, String?)?
      nameTextFieldCreateTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    nameTextFieldCreateFocusNode?.dispose();
    nameTextFieldCreateTextController?.dispose();
  }
}
