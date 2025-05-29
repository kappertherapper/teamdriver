import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionResponseRecord extends FirestoreRecord {
  QuestionResponseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "experiment_group" field.
  String? _experimentGroup;
  String get experimentGroup => _experimentGroup ?? '';
  bool hasExperimentGroup() => _experimentGroup != null;

  // "question" field.
  DocumentReference? _question;
  DocumentReference? get question => _question;
  bool hasQuestion() => _question != null;

  // "company_profile_id" field.
  DocumentReference? _companyProfileId;
  DocumentReference? get companyProfileId => _companyProfileId;
  bool hasCompanyProfileId() => _companyProfileId != null;

  // "survey_id" field.
  DocumentReference? _surveyId;
  DocumentReference? get surveyId => _surveyId;
  bool hasSurveyId() => _surveyId != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  bool hasResponse() => _response != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _experimentGroup = snapshotData['experiment_group'] as String?;
    _question = snapshotData['question'] as DocumentReference?;
    _companyProfileId =
        snapshotData['company_profile_id'] as DocumentReference?;
    _surveyId = snapshotData['survey_id'] as DocumentReference?;
    _response = snapshotData['response'] as String?;
    _type = snapshotData['type'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question_response');

  static Stream<QuestionResponseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionResponseRecord.fromSnapshot(s));

  static Future<QuestionResponseRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => QuestionResponseRecord.fromSnapshot(s));

  static QuestionResponseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionResponseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionResponseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionResponseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionResponseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionResponseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionResponseRecordData({
  String? experimentGroup,
  DocumentReference? question,
  DocumentReference? companyProfileId,
  DocumentReference? surveyId,
  String? response,
  String? type,
  DateTime? timestamp,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'experiment_group': experimentGroup,
      'question': question,
      'company_profile_id': companyProfileId,
      'survey_id': surveyId,
      'response': response,
      'type': type,
      'timestamp': timestamp,
      'created_by': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionResponseRecordDocumentEquality
    implements Equality<QuestionResponseRecord> {
  const QuestionResponseRecordDocumentEquality();

  @override
  bool equals(QuestionResponseRecord? e1, QuestionResponseRecord? e2) {
    return e1?.experimentGroup == e2?.experimentGroup &&
        e1?.question == e2?.question &&
        e1?.companyProfileId == e2?.companyProfileId &&
        e1?.surveyId == e2?.surveyId &&
        e1?.response == e2?.response &&
        e1?.type == e2?.type &&
        e1?.timestamp == e2?.timestamp &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(QuestionResponseRecord? e) => const ListEquality().hash([
        e?.experimentGroup,
        e?.question,
        e?.companyProfileId,
        e?.surveyId,
        e?.response,
        e?.type,
        e?.timestamp,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionResponseRecord;
}
