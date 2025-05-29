// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactStruct extends FFFirebaseStruct {
  ContactStruct({
    String? name,
    String? uid,
    CompanyStruct? company,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _uid = uid,
        _company = company,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "Company" field.
  CompanyStruct? _company;
  CompanyStruct get company => _company ?? CompanyStruct();
  set company(CompanyStruct? val) => _company = val;

  void updateCompany(Function(CompanyStruct) updateFn) {
    updateFn(_company ??= CompanyStruct());
  }

  bool hasCompany() => _company != null;

  static ContactStruct fromMap(Map<String, dynamic> data) => ContactStruct(
        name: data['name'] as String?,
        uid: data['uid'] as String?,
        company: data['Company'] is CompanyStruct
            ? data['Company']
            : CompanyStruct.maybeFromMap(data['Company']),
      );

  static ContactStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContactStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'uid': _uid,
        'Company': _company?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'Company': serializeParam(
          _company,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ContactStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContactStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        company: deserializeStructParam(
          data['Company'],
          ParamType.DataStruct,
          false,
          structBuilder: CompanyStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ContactStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContactStruct &&
        name == other.name &&
        uid == other.uid &&
        company == other.company;
  }

  @override
  int get hashCode => const ListEquality().hash([name, uid, company]);
}

ContactStruct createContactStruct({
  String? name,
  String? uid,
  CompanyStruct? company,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContactStruct(
      name: name,
      uid: uid,
      company: company ?? (clearUnsetFields ? CompanyStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContactStruct? updateContactStruct(
  ContactStruct? contact, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contact
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContactStructData(
  Map<String, dynamic> firestoreData,
  ContactStruct? contact,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contact == null) {
    return;
  }
  if (contact.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contact.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contactData = getContactFirestoreData(contact, forFieldValue);
  final nestedData = contactData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contact.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContactFirestoreData(
  ContactStruct? contact, [
  bool forFieldValue = false,
]) {
  if (contact == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contact.toMap());

  // Handle nested data for "Company" field.
  addCompanyStructData(
    firestoreData,
    contact.hasCompany() ? contact.company : null,
    'Company',
    forFieldValue,
  );

  // Add any Firestore field values
  contact.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContactListFirestoreData(
  List<ContactStruct>? contacts,
) =>
    contacts?.map((e) => getContactFirestoreData(e, true)).toList() ?? [];
