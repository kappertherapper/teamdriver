import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveysRecord extends FirestoreRecord {
  SurveysRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "company_profile_id" field.
  DocumentReference? _companyProfileId;
  DocumentReference? get companyProfileId => _companyProfileId;
  bool hasCompanyProfileId() => _companyProfileId != null;

  // "question_ids" field.
  List<DocumentReference>? _questionIds;
  List<DocumentReference> get questionIds => _questionIds ?? const [];
  bool hasQuestionIds() => _questionIds != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _companyProfileId =
        snapshotData['company_profile_id'] as DocumentReference?;
    _questionIds = getDataList(snapshotData['question_ids']);
    _isActive = snapshotData['is_active'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('surveys');

  static Stream<SurveysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveysRecord.fromSnapshot(s));

  static Future<SurveysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurveysRecord.fromSnapshot(s));

  static SurveysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SurveysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveysRecordData({
  String? name,
  DateTime? createdAt,
  DocumentReference? createdBy,
  DocumentReference? companyProfileId,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'created_at': createdAt,
      'created_by': createdBy,
      'company_profile_id': companyProfileId,
      'is_active': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurveysRecordDocumentEquality implements Equality<SurveysRecord> {
  const SurveysRecordDocumentEquality();

  @override
  bool equals(SurveysRecord? e1, SurveysRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.companyProfileId == e2?.companyProfileId &&
        listEquality.equals(e1?.questionIds, e2?.questionIds) &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(SurveysRecord? e) => const ListEquality().hash([
        e?.name,
        e?.createdAt,
        e?.createdBy,
        e?.companyProfileId,
        e?.questionIds,
        e?.isActive
      ]);

  @override
  bool isValidKey(Object? o) => o is SurveysRecord;
}
