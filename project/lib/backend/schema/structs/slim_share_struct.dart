// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SlimShareStruct extends FFFirebaseStruct {
  SlimShareStruct({
    String? photoUrl,
    String? url,
    DocumentReference? user,
    String? content,
    String? userName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _photoUrl = photoUrl,
        _url = url,
        _user = user,
        _content = content,
        _userName = userName,
        super(firestoreUtilData);

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  static SlimShareStruct fromMap(Map<String, dynamic> data) => SlimShareStruct(
        photoUrl: data['photo_url'] as String?,
        url: data['url'] as String?,
        user: data['user'] as DocumentReference?,
        content: data['content'] as String?,
        userName: data['userName'] as String?,
      );

  static SlimShareStruct? maybeFromMap(dynamic data) => data is Map
      ? SlimShareStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'photo_url': _photoUrl,
        'url': _url,
        'user': _user,
        'content': _content,
        'userName': _userName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
      }.withoutNulls;

  static SlimShareStruct fromSerializableMap(Map<String, dynamic> data) =>
      SlimShareStruct(
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SlimShareStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SlimShareStruct &&
        photoUrl == other.photoUrl &&
        url == other.url &&
        user == other.user &&
        content == other.content &&
        userName == other.userName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([photoUrl, url, user, content, userName]);
}

SlimShareStruct createSlimShareStruct({
  String? photoUrl,
  String? url,
  DocumentReference? user,
  String? content,
  String? userName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SlimShareStruct(
      photoUrl: photoUrl,
      url: url,
      user: user,
      content: content,
      userName: userName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SlimShareStruct? updateSlimShareStruct(
  SlimShareStruct? slimShare, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    slimShare
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSlimShareStructData(
  Map<String, dynamic> firestoreData,
  SlimShareStruct? slimShare,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (slimShare == null) {
    return;
  }
  if (slimShare.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && slimShare.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final slimShareData = getSlimShareFirestoreData(slimShare, forFieldValue);
  final nestedData = slimShareData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = slimShare.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSlimShareFirestoreData(
  SlimShareStruct? slimShare, [
  bool forFieldValue = false,
]) {
  if (slimShare == null) {
    return {};
  }
  final firestoreData = mapToFirestore(slimShare.toMap());

  // Add any Firestore field values
  slimShare.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSlimShareListFirestoreData(
  List<SlimShareStruct>? slimShares,
) =>
    slimShares?.map((e) => getSlimShareFirestoreData(e, true)).toList() ?? [];
