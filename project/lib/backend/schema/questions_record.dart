import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question_text" field.
  QuestionTextLanguagesStruct? _questionText;
  QuestionTextLanguagesStruct get questionText =>
      _questionText ?? QuestionTextLanguagesStruct();
  bool hasQuestionText() => _questionText != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "question_type" field.
  String? _questionType;
  String get questionType => _questionType ?? '';
  bool hasQuestionType() => _questionType != null;

  // "answered_users" field.
  List<String>? _answeredUsers;
  List<String> get answeredUsers => _answeredUsers ?? const [];
  bool hasAnsweredUsers() => _answeredUsers != null;

  // "company_profile_id" field.
  DocumentReference? _companyProfileId;
  DocumentReference? get companyProfileId => _companyProfileId;
  bool hasCompanyProfileId() => _companyProfileId != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "choices" field.
  List<String>? _choices;
  List<String> get choices => _choices ?? const [];
  bool hasChoices() => _choices != null;

  // "slider_min" field.
  double? _sliderMin;
  double get sliderMin => _sliderMin ?? 0.0;
  bool hasSliderMin() => _sliderMin != null;

  // "slider_max" field.
  double? _sliderMax;
  double get sliderMax => _sliderMax ?? 0.0;
  bool hasSliderMax() => _sliderMax != null;

  void _initializeFields() {
    _questionText = snapshotData['question_text'] is QuestionTextLanguagesStruct
        ? snapshotData['question_text']
        : QuestionTextLanguagesStruct.maybeFromMap(
            snapshotData['question_text']);
    _category = snapshotData['category'] as String?;
    _questionType = snapshotData['question_type'] as String?;
    _answeredUsers = getDataList(snapshotData['answered_users']);
    _companyProfileId =
        snapshotData['company_profile_id'] as DocumentReference?;
    _isActive = snapshotData['is_active'] as bool?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _choices = getDataList(snapshotData['choices']);
    _sliderMin = castToType<double>(snapshotData['slider_min']);
    _sliderMax = castToType<double>(snapshotData['slider_max']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  QuestionTextLanguagesStruct? questionText,
  String? category,
  String? questionType,
  DocumentReference? companyProfileId,
  bool? isActive,
  DateTime? timestamp,
  double? sliderMin,
  double? sliderMax,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question_text': QuestionTextLanguagesStruct().toMap(),
      'category': category,
      'question_type': questionType,
      'company_profile_id': companyProfileId,
      'is_active': isActive,
      'timestamp': timestamp,
      'slider_min': sliderMin,
      'slider_max': sliderMax,
    }.withoutNulls,
  );

  // Handle nested data for "question_text" field.
  addQuestionTextLanguagesStructData(
      firestoreData, questionText, 'question_text');

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.questionText == e2?.questionText &&
        e1?.category == e2?.category &&
        e1?.questionType == e2?.questionType &&
        listEquality.equals(e1?.answeredUsers, e2?.answeredUsers) &&
        e1?.companyProfileId == e2?.companyProfileId &&
        e1?.isActive == e2?.isActive &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.choices, e2?.choices) &&
        e1?.sliderMin == e2?.sliderMin &&
        e1?.sliderMax == e2?.sliderMax;
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality().hash([
        e?.questionText,
        e?.category,
        e?.questionType,
        e?.answeredUsers,
        e?.companyProfileId,
        e?.isActive,
        e?.timestamp,
        e?.choices,
        e?.sliderMin,
        e?.sliderMax
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
