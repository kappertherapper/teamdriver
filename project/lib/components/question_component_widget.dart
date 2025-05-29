import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/single_choice_option_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_component_model.dart';
export 'question_component_model.dart';

class QuestionComponentWidget extends StatefulWidget {
  const QuestionComponentWidget({
    super.key,
    this.question,
  });

  final DocumentReference? question;

  @override
  State<QuestionComponentWidget> createState() =>
      _QuestionComponentWidgetState();
}

class _QuestionComponentWidgetState extends State<QuestionComponentWidget> {
  late QuestionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionComponentModel());

    _model.textController ??=
        TextEditingController(text: FFAppState().currentAnswerValue);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<QuestionsRecord>(
      stream: QuestionsRecord.getDocument(widget.question!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final containerQuestionsRecord = snapshot.data!;

        return Container(
          width: 600.0,
          height: 400.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                child: Text(
                  containerQuestionsRecord.questionText.dansk,
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        font: GoogleFonts.outfit(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                ),
              ),
              Stack(
                children: [
                  if (containerQuestionsRecord.questionType ==
                      QuestionType.Text.name)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              width: 300.0,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 100),
                                  () async {
                                    FFAppState().currentAnswerValue =
                                        _model.textController.text;
                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                  hintText: 'Skriv svar her',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                maxLines: 3,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (containerQuestionsRecord.questionType ==
                      QuestionType.Rating.name)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                containerQuestionsRecord.sliderMin.toString(),
                                '1',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                width: 303.0,
                                child: Slider.adaptive(
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  min: valueOrDefault<double>(
                                    containerQuestionsRecord.sliderMin,
                                    1.0,
                                  ),
                                  max: valueOrDefault<double>(
                                    containerQuestionsRecord.sliderMax,
                                    100.0,
                                  ),
                                  value: _model.sliderValue ??=
                                      containerQuestionsRecord.sliderMin,
                                  onChanged: (newValue) {
                                    newValue = double.parse(
                                        newValue.toStringAsFixed(6));
                                    safeSetState(
                                        () => _model.sliderValue = newValue);
                                    EasyDebounce.debounce(
                                      '_model.sliderValue',
                                      Duration(milliseconds: 200),
                                      () async {
                                        _model.currentSliderValue = functions
                                            .parseDoubleToInt(
                                                _model.sliderValue)
                                            .toDouble();
                                        safeSetState(() {});
                                        FFAppState().currentAnswerValue =
                                            functions.parseDoubleToString(
                                                _model.sliderValue)!;
                                        safeSetState(() {});
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                containerQuestionsRecord.sliderMax.toString(),
                                '100',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 6.0)),
                        ),
                        Text(
                          valueOrDefault<String>(
                            _model.currentSliderValue?.toString(),
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                  if (containerQuestionsRecord.questionType ==
                      QuestionType.MultipleChoice.name)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 30.0),
                          child: Builder(
                            builder: (context) {
                              final choiceOptions =
                                  containerQuestionsRecord.choices.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(choiceOptions.length,
                                    (choiceOptionsIndex) {
                                  final choiceOptionsItem =
                                      choiceOptions[choiceOptionsIndex];
                                  return Container(
                                    width: 200.0,
                                    child: SingleChoiceOptionItemWidget(
                                      key: Key(
                                          'Key0f9_${choiceOptionsIndex}_of_${choiceOptions.length}'),
                                      optionText: valueOrDefault<String>(
                                        choiceOptionsItem,
                                        'value',
                                      ),
                                      currentGroupSelection:
                                          FFAppState().currentAnswerValue,
                                      optionValue: valueOrDefault<String>(
                                        choiceOptionsItem,
                                        'value',
                                      ),
                                      onSelected: (selectedValueOutput) async {
                                        FFAppState().currentAnswerValue =
                                            valueOrDefault<String>(
                                          selectedValueOutput,
                                          'default',
                                        );
                                        safeSetState(() {});
                                      },
                                    ),
                                  );
                                }).divide(SizedBox(height: 10.0)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
