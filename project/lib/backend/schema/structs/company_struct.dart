// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyStruct extends FFFirebaseStruct {
  CompanyStruct({
    String? name,
    String? uniqieID,
    List<ContactStruct>? contacts,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _uniqieID = uniqieID,
        _contacts = contacts,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "uniqieID" field.
  String? _uniqieID;
  String get uniqieID => _uniqieID ?? '';
  set uniqieID(String? val) => _uniqieID = val;

  bool hasUniqieID() => _uniqieID != null;

  // "contacts" field.
  List<ContactStruct>? _contacts;
  List<ContactStruct> get contacts => _contacts ?? const [];
  set contacts(List<ContactStruct>? val) => _contacts = val;

  void updateContacts(Function(List<ContactStruct>) updateFn) {
    updateFn(_contacts ??= []);
  }

  bool hasContacts() => _contacts != null;

  static CompanyStruct fromMap(Map<String, dynamic> data) => CompanyStruct(
        name: data['name'] as String?,
        uniqieID: data['uniqieID'] as String?,
        contacts: getStructList(
          data['contacts'],
          ContactStruct.fromMap,
        ),
      );

  static CompanyStruct? maybeFromMap(dynamic data) =>
      data is Map ? CompanyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'uniqieID': _uniqieID,
        'contacts': _contacts?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'uniqieID': serializeParam(
          _uniqieID,
          ParamType.String,
        ),
        'contacts': serializeParam(
          _contacts,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CompanyStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompanyStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        uniqieID: deserializeParam(
          data['uniqieID'],
          ParamType.String,
          false,
        ),
        contacts: deserializeStructParam<ContactStruct>(
          data['contacts'],
          ParamType.DataStruct,
          true,
          structBuilder: ContactStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CompanyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CompanyStruct &&
        name == other.name &&
        uniqieID == other.uniqieID &&
        listEquality.equals(contacts, other.contacts);
  }

  @override
  int get hashCode => const ListEquality().hash([name, uniqieID, contacts]);
}

CompanyStruct createCompanyStruct({
  String? name,
  String? uniqieID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompanyStruct(
      name: name,
      uniqieID: uniqieID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompanyStruct? updateCompanyStruct(
  CompanyStruct? company, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    company
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompanyStructData(
  Map<String, dynamic> firestoreData,
  CompanyStruct? company,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (company == null) {
    return;
  }
  if (company.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && company.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final companyData = getCompanyFirestoreData(company, forFieldValue);
  final nestedData = companyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = company.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompanyFirestoreData(
  CompanyStruct? company, [
  bool forFieldValue = false,
]) {
  if (company == null) {
    return {};
  }
  final firestoreData = mapToFirestore(company.toMap());

  // Add any Firestore field values
  company.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompanyListFirestoreData(
  List<CompanyStruct>? companys,
) =>
    companys?.map((e) => getCompanyFirestoreData(e, true)).toList() ?? [];
