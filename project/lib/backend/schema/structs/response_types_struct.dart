// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ResponseTypesStruct extends FFFirebaseStruct {
  ResponseTypesStruct({
    String? text,
    int? rating,
    String? multipleChoice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _rating = rating,
        _multipleChoice = multipleChoice,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  set rating(int? val) => _rating = val;

  void incrementRating(int amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  // "multiple_choice" field.
  String? _multipleChoice;
  String get multipleChoice => _multipleChoice ?? '';
  set multipleChoice(String? val) => _multipleChoice = val;

  bool hasMultipleChoice() => _multipleChoice != null;

  static ResponseTypesStruct fromMap(Map<String, dynamic> data) =>
      ResponseTypesStruct(
        text: data['text'] as String?,
        rating: castToType<int>(data['rating']),
        multipleChoice: data['multiple_choice'] as String?,
      );

  static ResponseTypesStruct? maybeFromMap(dynamic data) => data is Map
      ? ResponseTypesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'rating': _rating,
        'multiple_choice': _multipleChoice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.int,
        ),
        'multiple_choice': serializeParam(
          _multipleChoice,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResponseTypesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponseTypesStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.int,
          false,
        ),
        multipleChoice: deserializeParam(
          data['multiple_choice'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResponseTypesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResponseTypesStruct &&
        text == other.text &&
        rating == other.rating &&
        multipleChoice == other.multipleChoice;
  }

  @override
  int get hashCode => const ListEquality().hash([text, rating, multipleChoice]);
}

ResponseTypesStruct createResponseTypesStruct({
  String? text,
  int? rating,
  String? multipleChoice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponseTypesStruct(
      text: text,
      rating: rating,
      multipleChoice: multipleChoice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponseTypesStruct? updateResponseTypesStruct(
  ResponseTypesStruct? responseTypes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    responseTypes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponseTypesStructData(
  Map<String, dynamic> firestoreData,
  ResponseTypesStruct? responseTypes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (responseTypes == null) {
    return;
  }
  if (responseTypes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && responseTypes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responseTypesData =
      getResponseTypesFirestoreData(responseTypes, forFieldValue);
  final nestedData =
      responseTypesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = responseTypes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponseTypesFirestoreData(
  ResponseTypesStruct? responseTypes, [
  bool forFieldValue = false,
]) {
  if (responseTypes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(responseTypes.toMap());

  // Add any Firestore field values
  responseTypes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponseTypesListFirestoreData(
  List<ResponseTypesStruct>? responseTypess,
) =>
    responseTypess
        ?.map((e) => getResponseTypesFirestoreData(e, true))
        .toList() ??
    [];
