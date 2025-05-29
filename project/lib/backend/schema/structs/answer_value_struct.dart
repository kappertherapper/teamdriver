// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AnswerValueStruct extends FFFirebaseStruct {
  AnswerValueStruct({
    String? response,
    DocumentReference? question,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _response = response,
        _question = question,
        _type = type,
        super(firestoreUtilData);

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  set response(String? val) => _response = val;

  bool hasResponse() => _response != null;

  // "question" field.
  DocumentReference? _question;
  DocumentReference? get question => _question;
  set question(DocumentReference? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static AnswerValueStruct fromMap(Map<String, dynamic> data) =>
      AnswerValueStruct(
        response: data['response'] as String?,
        question: data['question'] as DocumentReference?,
        type: data['type'] as String?,
      );

  static AnswerValueStruct? maybeFromMap(dynamic data) => data is Map
      ? AnswerValueStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'response': _response,
        'question': _question,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'response': serializeParam(
          _response,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.DocumentReference,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static AnswerValueStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnswerValueStruct(
        response: deserializeParam(
          data['response'],
          ParamType.String,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['questions'],
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AnswerValueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnswerValueStruct &&
        response == other.response &&
        question == other.question &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([response, question, type]);
}

AnswerValueStruct createAnswerValueStruct({
  String? response,
  DocumentReference? question,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnswerValueStruct(
      response: response,
      question: question,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnswerValueStruct? updateAnswerValueStruct(
  AnswerValueStruct? answerValue, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    answerValue
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnswerValueStructData(
  Map<String, dynamic> firestoreData,
  AnswerValueStruct? answerValue,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (answerValue == null) {
    return;
  }
  if (answerValue.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && answerValue.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final answerValueData =
      getAnswerValueFirestoreData(answerValue, forFieldValue);
  final nestedData =
      answerValueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = answerValue.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnswerValueFirestoreData(
  AnswerValueStruct? answerValue, [
  bool forFieldValue = false,
]) {
  if (answerValue == null) {
    return {};
  }
  final firestoreData = mapToFirestore(answerValue.toMap());

  // Add any Firestore field values
  answerValue.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnswerValueListFirestoreData(
  List<AnswerValueStruct>? answerValues,
) =>
    answerValues?.map((e) => getAnswerValueFirestoreData(e, true)).toList() ??
    [];
