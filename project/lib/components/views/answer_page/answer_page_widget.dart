import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/question_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'answer_page_model.dart';
export 'answer_page_model.dart';

class AnswerPageWidget extends StatefulWidget {
  const AnswerPageWidget({
    super.key,
    required this.surveyDocRef,
  });

  final DocumentReference? surveyDocRef;

  static String routeName = 'AnswerPage';
  static String routePath = '/answerPage';

  @override
  State<AnswerPageWidget> createState() => _AnswerPageWidgetState();
}

class _AnswerPageWidgetState extends State<AnswerPageWidget> {
  late AnswerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnswerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().addToCurrentAnswersValue(AnswerValueStruct());
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<SurveysRecord>(
      stream: SurveysRecord.getDocument(widget.surveyDocRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final answerPageSurveysRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Spørgsmål ${(FFAppState().currentQuestionIndex + 1).toString()}/${valueOrDefault<String>(
                                  answerPageSurveysRecord.questionIds.length
                                      .toString(),
                                  '69',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 12.0, 8.0, 0.0),
                            child: LinearPercentIndicator(
                              percent: valueOrDefault<double>(
                                (int totalNumQuestions,
                                        int currentQuestionIndex) {
                                  return (totalNumQuestions > 0)
                                      ? (((currentQuestionIndex + 1) /
                                              totalNumQuestions.toDouble())
                                          .clamp(0.0, 1.0))
                                      : 0.0;
                                }(
                                    valueOrDefault<int>(
                                      answerPageSurveysRecord
                                          .questionIds.length,
                                      0,
                                    ),
                                    FFAppState().currentQuestionIndex),
                                0.0,
                              ),
                              width: MediaQuery.sizeOf(context).width * 0.96,
                              lineHeight: 12.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).success,
                              backgroundColor: Color(0xFFE0E3E7),
                              barRadius: Radius.circular(24.0),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          if (FFAppState().currentQuestionIndex <
                              answerPageSurveysRecord.questionIds.length)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 100.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.questionComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: QuestionComponentWidget(
                                    question: answerPageSurveysRecord
                                        .questionIds
                                        .elementAtOrNull(
                                            FFAppState().currentQuestionIndex),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 32.0, 0.0, 32.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().currentQuestionIndex =
                                    FFAppState().currentQuestionIndex + -1;
                                FFAppState().currentAnswerValue = FFAppState()
                                    .currentAnswersValue
                                    .elementAtOrNull(
                                        FFAppState().currentQuestionIndex)!
                                    .response;
                                safeSetState(() {});
                              },
                              text: 'Forrige Spørgsmål',
                              options: FFButtonOptions(
                                width: 300.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 32.0, 32.0, 32.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (FFAppState().currentAnswerValue == '') {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Svar er tomt'),
                                            content: Text(
                                                'Du har intet svar givet, vil du fortsætte?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Annullere'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Fortsæt'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                            }
                            if (FFAppState()
                                    .currentAnswersValue
                                    .elementAtOrNull(
                                        FFAppState().currentQuestionIndex) !=
                                null) {
                              FFAppState().updateCurrentAnswersValueAtIndex(
                                FFAppState().currentQuestionIndex,
                                (_) => AnswerValueStruct(
                                  response: FFAppState().currentAnswerValue,
                                  question: answerPageSurveysRecord.questionIds
                                      .elementAtOrNull(
                                          FFAppState().currentQuestionIndex),
                                ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState()
                                  .addToCurrentAnswersValue(AnswerValueStruct(
                                response: FFAppState().currentAnswerValue,
                                question: answerPageSurveysRecord.questionIds
                                    .elementAtOrNull(
                                        FFAppState().currentQuestionIndex),
                              ));
                              safeSetState(() {});
                            }

                            FFAppState().currentAnswerValue = '';
                            safeSetState(() {});
                            FFAppState().currentQuestionIndex =
                                FFAppState().currentQuestionIndex + 1;
                            safeSetState(() {});
                            if (FFAppState().currentQuestionIndex >
                                (answerPageSurveysRecord.questionIds.length -
                                    1)) {
                              await QuestionResponseTestRecord.collection
                                  .doc()
                                  .set({
                                ...createQuestionResponseTestRecordData(
                                  surveyId: widget.surveyDocRef,
                                  timestamp: getCurrentTimestamp,
                                  createdBy: currentUserReference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'responses':
                                        getAnswerValueListFirestoreData(
                                      FFAppState().currentAnswersValue,
                                    ),
                                  },
                                ),
                              });

                              context
                                  .pushNamed(ConfirmationPageWidget.routeName);
                            }
                          },
                          text: 'Næste Spørgsmål',
                          options: FFButtonOptions(
                            width: 300.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
