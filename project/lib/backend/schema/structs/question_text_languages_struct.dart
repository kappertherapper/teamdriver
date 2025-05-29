// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class QuestionTextLanguagesStruct extends FFFirebaseStruct {
  QuestionTextLanguagesStruct({
    String? dansk,
    String? english,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dansk = dansk,
        _english = english,
        super(firestoreUtilData);

  // "dansk" field.
  String? _dansk;
  String get dansk => _dansk ?? '';
  set dansk(String? val) => _dansk = val;

  bool hasDansk() => _dansk != null;

  // "english" field.
  String? _english;
  String get english => _english ?? '';
  set english(String? val) => _english = val;

  bool hasEnglish() => _english != null;

  static QuestionTextLanguagesStruct fromMap(Map<String, dynamic> data) =>
      QuestionTextLanguagesStruct(
        dansk: data['dansk'] as String?,
        english: data['english'] as String?,
      );

  static QuestionTextLanguagesStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionTextLanguagesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dansk': _dansk,
        'english': _english,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dansk': serializeParam(
          _dansk,
          ParamType.String,
        ),
        'english': serializeParam(
          _english,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionTextLanguagesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      QuestionTextLanguagesStruct(
        dansk: deserializeParam(
          data['dansk'],
          ParamType.String,
          false,
        ),
        english: deserializeParam(
          data['english'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionTextLanguagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionTextLanguagesStruct &&
        dansk == other.dansk &&
        english == other.english;
  }

  @override
  int get hashCode => const ListEquality().hash([dansk, english]);
}

QuestionTextLanguagesStruct createQuestionTextLanguagesStruct({
  String? dansk,
  String? english,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionTextLanguagesStruct(
      dansk: dansk,
      english: english,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionTextLanguagesStruct? updateQuestionTextLanguagesStruct(
  QuestionTextLanguagesStruct? questionTextLanguages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    questionTextLanguages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionTextLanguagesStructData(
  Map<String, dynamic> firestoreData,
  QuestionTextLanguagesStruct? questionTextLanguages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (questionTextLanguages == null) {
    return;
  }
  if (questionTextLanguages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      questionTextLanguages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionTextLanguagesData = getQuestionTextLanguagesFirestoreData(
      questionTextLanguages, forFieldValue);
  final nestedData =
      questionTextLanguagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      questionTextLanguages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionTextLanguagesFirestoreData(
  QuestionTextLanguagesStruct? questionTextLanguages, [
  bool forFieldValue = false,
]) {
  if (questionTextLanguages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(questionTextLanguages.toMap());

  // Add any Firestore field values
  questionTextLanguages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionTextLanguagesListFirestoreData(
  List<QuestionTextLanguagesStruct>? questionTextLanguagess,
) =>
    questionTextLanguagess
        ?.map((e) => getQuestionTextLanguagesFirestoreData(e, true))
        .toList() ??
    [];
