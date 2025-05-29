import '/flutter_flow/flutter_flow_util.dart';
import 'share_widget.dart' show ShareWidget;
import 'package:flutter/material.dart';

class ShareModel extends FlutterFlowModel<ShareWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> chosenUsers = [];
  void addToChosenUsers(DocumentReference item) => chosenUsers.add(item);
  void removeFromChosenUsers(DocumentReference item) =>
      chosenUsers.remove(item);
  void removeAtIndexFromChosenUsers(int index) => chosenUsers.removeAt(index);
  void insertAtIndexInChosenUsers(int index, DocumentReference item) =>
      chosenUsers.insert(index, item);
  void updateChosenUsersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      chosenUsers[index] = updateFn(chosenUsers[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - addEmojiToText] action in Share widget.
  String? text;
  // State field(s) for messageText widget.
  FocusNode? messageTextFocusNode;
  TextEditingController? messageTextTextController;
  String? Function(BuildContext, String?)? messageTextTextControllerValidator;
  // Stores action output result for [Custom Action - addEmojiToText] action in Button widget.
  String? textPlusEmoji1;
  // Stores action output result for [Custom Action - addEmojiToText] action in Button widget.
  String? textPlusEmoji2;
  // Stores action output result for [Custom Action - addEmojiToText] action in Button widget.
  String? textPlusEmoji3;
  // Stores action output result for [Custom Action - addEmojiToText] action in Button widget.
  String? textPlusEmoji4;
  // Stores action output result for [Custom Action - addEmojiToText] action in Button widget.
  String? textPlusEmoji6;
  // Stores action output result for [Custom Action - addEmojiToText] action in Button widget.
  String? textPlusEmoji;
  // Stores action output result for [Custom Action - addEmojiToText] action in Button widget.
  String? textPlusEmoji5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    messageTextFocusNode?.dispose();
    messageTextTextController?.dispose();
  }
}
