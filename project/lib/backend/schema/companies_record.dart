import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesRecord extends FirestoreRecord {
  CompaniesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "contacts" field.
  List<ContactStruct>? _contacts;
  List<ContactStruct> get contacts => _contacts ?? const [];
  bool hasContacts() => _contacts != null;

  // "companies" field.
  List<CompanyStruct>? _companies;
  List<CompanyStruct> get companies => _companies ?? const [];
  bool hasCompanies() => _companies != null;

  // "UID" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _contacts = getStructList(
      snapshotData['contacts'],
      ContactStruct.fromMap,
    );
    _companies = getStructList(
      snapshotData['companies'],
      CompanyStruct.fromMap,
    );
    _uid = snapshotData['UID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesRecord.fromSnapshot(s));

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompaniesRecord.fromSnapshot(s));

  static CompaniesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesRecordData({
  String? name,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'UID': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompaniesRecordDocumentEquality implements Equality<CompaniesRecord> {
  const CompaniesRecordDocumentEquality();

  @override
  bool equals(CompaniesRecord? e1, CompaniesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.contacts, e2?.contacts) &&
        listEquality.equals(e1?.companies, e2?.companies) &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(CompaniesRecord? e) =>
      const ListEquality().hash([e?.name, e?.contacts, e?.companies, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is CompaniesRecord;
}
