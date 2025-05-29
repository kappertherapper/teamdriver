import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionResponseTestRecord extends FirestoreRecord {
  QuestionResponseTestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "experiment_group" field.
  String? _experimentGroup;
  String get experimentGroup => _experimentGroup ?? '';
  bool hasExperimentGroup() => _experimentGroup != null;

  // "company_profile_id" field.
  DocumentReference? _companyProfileId;
  DocumentReference? get companyProfileId => _companyProfileId;
  bool hasCompanyProfileId() => _companyProfileId != null;

  // "survey_id" field.
  DocumentReference? _surveyId;
  DocumentReference? get surveyId => _surveyId;
  bool hasSurveyId() => _surveyId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "responses" field.
  List<AnswerValueStruct>? _responses;
  List<AnswerValueStruct> get responses => _responses ?? const [];
  bool hasResponses() => _responses != null;

  void _initializeFields() {
    _experimentGroup = snapshotData['experiment_group'] as String?;
    _companyProfileId =
        snapshotData['company_profile_id'] as DocumentReference?;
    _surveyId = snapshotData['survey_id'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _responses = getStructList(
      snapshotData['responses'],
      AnswerValueStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question_response_test');

  static Stream<QuestionResponseTestRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionResponseTestRecord.fromSnapshot(s));

  static Future<QuestionResponseTestRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => QuestionResponseTestRecord.fromSnapshot(s));

  static QuestionResponseTestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionResponseTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionResponseTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionResponseTestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionResponseTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionResponseTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionResponseTestRecordData({
  String? experimentGroup,
  DocumentReference? companyProfileId,
  DocumentReference? surveyId,
  DateTime? timestamp,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'experiment_group': experimentGroup,
      'company_profile_id': companyProfileId,
      'survey_id': surveyId,
      'timestamp': timestamp,
      'created_by': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionResponseTestRecordDocumentEquality
    implements Equality<QuestionResponseTestRecord> {
  const QuestionResponseTestRecordDocumentEquality();

  @override
  bool equals(QuestionResponseTestRecord? e1, QuestionResponseTestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.experimentGroup == e2?.experimentGroup &&
        e1?.companyProfileId == e2?.companyProfileId &&
        e1?.surveyId == e2?.surveyId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.createdBy == e2?.createdBy &&
        listEquality.equals(e1?.responses, e2?.responses);
  }

  @override
  int hash(QuestionResponseTestRecord? e) => const ListEquality().hash([
        e?.experimentGroup,
        e?.companyProfileId,
        e?.surveyId,
        e?.timestamp,
        e?.createdBy,
        e?.responses
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionResponseTestRecord;
}
