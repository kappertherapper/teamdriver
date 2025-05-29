import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

int parseStringToInt(String? textValue) {
  if (textValue == null) {
    return 0; // Default value if input is null
  }
  return int.tryParse(textValue) ?? 0;
}

int parseDoubleToInt(double? doubleValue) {
  if (doubleValue == null) {
    return 0; // Default value if input is null
  }
  return doubleValue.toInt();
}

String? parseDoubleToString(double? doubleValue) {
  if (doubleValue == null) {
    return "0.0";
  }

  int intValue = doubleValue.toInt();
  return intValue.toString();
}

bool doesQuestionExistInList(
  List<AnswerValueStruct> answerValueList,
  DocumentReference targetQuestionRef,
) {
  // Tjek om listen findes eller er tom
  if (answerValueList == null || answerValueList.isEmpty) {
    return false;
  }

  for (AnswerValueStruct item in answerValueList) {
    if (item.question != null && item.question == targetQuestionRef) {
      return true; // Match
    }
  }

  return false; // Intet Match
}

List<DocumentReference>? extractQuestionsFromReponses(
    DocumentReference documents) {
  List<DocumentReference> questionRefs = [];
  if (documents == null) {
    return questionRefs; // Returner tom liste hvis input er tomt
  }

  //for (var doc in documents) {
  //if (doc.responses != null) {
  // Tjek om listen eksisterer
  //for (var responseItem in doc.responses) {
  //if (responseItem.question != null) {
  // Tjek om question referencen eksisterer
  //questionRefs.add(responseItem.question!); // Tilføj referencen
  // }
  //}
  //}
  //}
  //return questionRefs;
}
