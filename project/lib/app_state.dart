import 'package:flutter/material.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _selectedType = '';
  String get selectedType => _selectedType;
  set selectedType(String value) {
    _selectedType = value;
  }

  List<DocumentReference> _selectedQuestions = [];
  List<DocumentReference> get selectedQuestions => _selectedQuestions;
  set selectedQuestions(List<DocumentReference> value) {
    _selectedQuestions = value;
  }

  void addToSelectedQuestions(DocumentReference value) {
    selectedQuestions.add(value);
  }

  void removeFromSelectedQuestions(DocumentReference value) {
    selectedQuestions.remove(value);
  }

  void removeAtIndexFromSelectedQuestions(int index) {
    selectedQuestions.removeAt(index);
  }

  void updateSelectedQuestionsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    selectedQuestions[index] = updateFn(_selectedQuestions[index]);
  }

  void insertAtIndexInSelectedQuestions(int index, DocumentReference value) {
    selectedQuestions.insert(index, value);
  }

  List<AnswerValueStruct> _currentAnswersValue = [];
  List<AnswerValueStruct> get currentAnswersValue => _currentAnswersValue;
  set currentAnswersValue(List<AnswerValueStruct> value) {
    _currentAnswersValue = value;
  }

  void addToCurrentAnswersValue(AnswerValueStruct value) {
    currentAnswersValue.add(value);
  }

  void removeFromCurrentAnswersValue(AnswerValueStruct value) {
    currentAnswersValue.remove(value);
  }

  void removeAtIndexFromCurrentAnswersValue(int index) {
    currentAnswersValue.removeAt(index);
  }

  void updateCurrentAnswersValueAtIndex(
    int index,
    AnswerValueStruct Function(AnswerValueStruct) updateFn,
  ) {
    currentAnswersValue[index] = updateFn(_currentAnswersValue[index]);
  }

  void insertAtIndexInCurrentAnswersValue(int index, AnswerValueStruct value) {
    currentAnswersValue.insert(index, value);
  }

  int _currentQuestionIndex = 0;
  int get currentQuestionIndex => _currentQuestionIndex;
  set currentQuestionIndex(int value) {
    _currentQuestionIndex = value;
  }

  String _currentAnswerValue = '';
  String get currentAnswerValue => _currentAnswerValue;
  set currentAnswerValue(String value) {
    _currentAnswerValue = value;
  }
}
