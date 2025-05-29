import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_question_widget.dart' show CreateQuestionWidget;
import 'package:flutter/material.dart';

class CreateQuestionModel extends FlutterFlowModel<CreateQuestionWidget> {
  ///  Local state fields for this page.

  int? minValue;

  int? maxValue;

  double? currentSliderValue;

  int? numberOfChoices = 0;

  List<String> choices = [];
  void addToChoices(String item) => choices.add(item);
  void removeFromChoices(String item) => choices.remove(item);
  void removeAtIndexFromChoices(int index) => choices.removeAt(index);
  void insertAtIndexInChoices(int index, String item) =>
      choices.insert(index, item);
  void updateChoicesAtIndex(int index, Function(String) updateFn) =>
      choices[index] = updateFn(choices[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for CategoryTextField widget.
  FocusNode? categoryTextFieldFocusNode;
  TextEditingController? categoryTextFieldTextController;
  String? Function(BuildContext, String?)?
      categoryTextFieldTextControllerValidator;
  // State field(s) for TypeDropDown widget.
  String? typeDropDownValue;
  FormFieldController<String>? typeDropDownValueController;
  // State field(s) for QuestionText widget.
  FocusNode? questionTextFocusNode;
  TextEditingController? questionTextTextController;
  String? Function(BuildContext, String?)? questionTextTextControllerValidator;
  // State field(s) for numChoicesTextField widget.
  FocusNode? numChoicesTextFieldFocusNode1;
  TextEditingController? numChoicesTextFieldTextController1;
  String? Function(BuildContext, String?)?
      numChoicesTextFieldTextController1Validator;
  // State field(s) for choice1TextField widget.
  FocusNode? choice1TextFieldFocusNode1;
  TextEditingController? choice1TextFieldTextController1;
  String? Function(BuildContext, String?)?
      choice1TextFieldTextController1Validator;
  // State field(s) for choice2TextField widget.
  FocusNode? choice2TextFieldFocusNode1;
  TextEditingController? choice2TextFieldTextController1;
  String? Function(BuildContext, String?)?
      choice2TextFieldTextController1Validator;
  // State field(s) for choice3TextField widget.
  FocusNode? choice3TextFieldFocusNode1;
  TextEditingController? choice3TextFieldTextController1;
  String? Function(BuildContext, String?)?
      choice3TextFieldTextController1Validator;
  // State field(s) for choice4TextField widget.
  FocusNode? choice4TextFieldFocusNode1;
  TextEditingController? choice4TextFieldTextController1;
  String? Function(BuildContext, String?)?
      choice4TextFieldTextController1Validator;
  // State field(s) for MinimumTextfield widget.
  FocusNode? minimumTextfieldFocusNode1;
  TextEditingController? minimumTextfieldTextController1;
  String? Function(BuildContext, String?)?
      minimumTextfieldTextController1Validator;
  // State field(s) for MaximumTextField widget.
  FocusNode? maximumTextFieldFocusNode1;
  TextEditingController? maximumTextFieldTextController1;
  String? Function(BuildContext, String?)?
      maximumTextFieldTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for choice1RadioBtn widget.
  FormFieldController<String>? choice1RadioBtnValueController1;
  // State field(s) for choice2RadioBtn widget.
  FormFieldController<String>? choice2RadioBtnValueController1;
  // State field(s) for choice3RadioBtn widget.
  FormFieldController<String>? choice3RadioBtnValueController1;
  // State field(s) for choice4RadioBtn widget.
  FormFieldController<String>? choice4RadioBtnValueController1;
  // State field(s) for Slider widget.
  double? sliderValue1;
  // State field(s) for CategoryTextFieldCreat widget.
  FocusNode? categoryTextFieldCreatFocusNode;
  TextEditingController? categoryTextFieldCreatTextController;
  String? Function(BuildContext, String?)?
      categoryTextFieldCreatTextControllerValidator;
  // State field(s) for TypeDropDownCreate widget.
  String? typeDropDownCreateValue;
  FormFieldController<String>? typeDropDownCreateValueController;
  // State field(s) for QuestionTextCreate widget.
  FocusNode? questionTextCreateFocusNode;
  TextEditingController? questionTextCreateTextController;
  String? Function(BuildContext, String?)?
      questionTextCreateTextControllerValidator;
  // State field(s) for numChoicesTextField widget.
  FocusNode? numChoicesTextFieldFocusNode2;
  TextEditingController? numChoicesTextFieldTextController2;
  String? Function(BuildContext, String?)?
      numChoicesTextFieldTextController2Validator;
  // State field(s) for choice1TextField widget.
  FocusNode? choice1TextFieldFocusNode2;
  TextEditingController? choice1TextFieldTextController2;
  String? Function(BuildContext, String?)?
      choice1TextFieldTextController2Validator;
  // State field(s) for choice2TextField widget.
  FocusNode? choice2TextFieldFocusNode2;
  TextEditingController? choice2TextFieldTextController2;
  String? Function(BuildContext, String?)?
      choice2TextFieldTextController2Validator;
  // State field(s) for choice3TextField widget.
  FocusNode? choice3TextFieldFocusNode2;
  TextEditingController? choice3TextFieldTextController2;
  String? Function(BuildContext, String?)?
      choice3TextFieldTextController2Validator;
  // State field(s) for choice4TextField widget.
  FocusNode? choice4TextFieldFocusNode2;
  TextEditingController? choice4TextFieldTextController2;
  String? Function(BuildContext, String?)?
      choice4TextFieldTextController2Validator;
  // State field(s) for MinimumTextfield widget.
  FocusNode? minimumTextfieldFocusNode2;
  TextEditingController? minimumTextfieldTextController2;
  String? Function(BuildContext, String?)?
      minimumTextfieldTextController2Validator;
  // State field(s) for MaximumTextField widget.
  FocusNode? maximumTextFieldFocusNode2;
  TextEditingController? maximumTextFieldTextController2;
  String? Function(BuildContext, String?)?
      maximumTextFieldTextController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController20;
  String? Function(BuildContext, String?)? textController20Validator;
  // State field(s) for choice1RadioBtn widget.
  FormFieldController<String>? choice1RadioBtnValueController2;
  // State field(s) for choice2RadioBtn widget.
  FormFieldController<String>? choice2RadioBtnValueController2;
  // State field(s) for choice3RadioBtn widget.
  FormFieldController<String>? choice3RadioBtnValueController2;
  // State field(s) for choice4RadioBtn widget.
  FormFieldController<String>? choice4RadioBtnValueController2;
  // State field(s) for Slider widget.
  double? sliderValue2;
  // Stores action output result for [Backend Call - Create Document] action in createQuestionBtn widget.
  QuestionsRecord? createdQuestion;
  // Stores action output result for [Backend Call - Create Document] action in createQuestionBtn widget.
  QuestionsRecord? createdQuestion2;
  // Stores action output result for [Backend Call - Create Document] action in createQuestionBtn widget.
  QuestionsRecord? createdQuestion3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    categoryTextFieldFocusNode?.dispose();
    categoryTextFieldTextController?.dispose();

    questionTextFocusNode?.dispose();
    questionTextTextController?.dispose();

    numChoicesTextFieldFocusNode1?.dispose();
    numChoicesTextFieldTextController1?.dispose();

    choice1TextFieldFocusNode1?.dispose();
    choice1TextFieldTextController1?.dispose();

    choice2TextFieldFocusNode1?.dispose();
    choice2TextFieldTextController1?.dispose();

    choice3TextFieldFocusNode1?.dispose();
    choice3TextFieldTextController1?.dispose();

    choice4TextFieldFocusNode1?.dispose();
    choice4TextFieldTextController1?.dispose();

    minimumTextfieldFocusNode1?.dispose();
    minimumTextfieldTextController1?.dispose();

    maximumTextFieldFocusNode1?.dispose();
    maximumTextFieldTextController1?.dispose();

    textFieldFocusNode1?.dispose();
    textController10?.dispose();

    categoryTextFieldCreatFocusNode?.dispose();
    categoryTextFieldCreatTextController?.dispose();

    questionTextCreateFocusNode?.dispose();
    questionTextCreateTextController?.dispose();

    numChoicesTextFieldFocusNode2?.dispose();
    numChoicesTextFieldTextController2?.dispose();

    choice1TextFieldFocusNode2?.dispose();
    choice1TextFieldTextController2?.dispose();

    choice2TextFieldFocusNode2?.dispose();
    choice2TextFieldTextController2?.dispose();

    choice3TextFieldFocusNode2?.dispose();
    choice3TextFieldTextController2?.dispose();

    choice4TextFieldFocusNode2?.dispose();
    choice4TextFieldTextController2?.dispose();

    minimumTextfieldFocusNode2?.dispose();
    minimumTextfieldTextController2?.dispose();

    maximumTextFieldFocusNode2?.dispose();
    maximumTextFieldTextController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController20?.dispose();
  }

  /// Additional helper methods.
  String? get choice1RadioBtnValue1 => choice1RadioBtnValueController1?.value;
  String? get choice2RadioBtnValue1 => choice2RadioBtnValueController1?.value;
  String? get choice3RadioBtnValue1 => choice3RadioBtnValueController1?.value;
  String? get choice4RadioBtnValue1 => choice4RadioBtnValueController1?.value;
  String? get choice1RadioBtnValue2 => choice1RadioBtnValueController2?.value;
  String? get choice2RadioBtnValue2 => choice2RadioBtnValueController2?.value;
  String? get choice3RadioBtnValue2 => choice3RadioBtnValueController2?.value;
  String? get choice4RadioBtnValue2 => choice4RadioBtnValueController2?.value;
}
