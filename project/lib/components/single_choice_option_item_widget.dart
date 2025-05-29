import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'single_choice_option_item_model.dart';
export 'single_choice_option_item_model.dart';

class SingleChoiceOptionItemWidget extends StatefulWidget {
  const SingleChoiceOptionItemWidget({
    super.key,
    String? optionText,
    required this.currentGroupSelection,
    required this.onSelected,
    String? optionValue,
  })  : this.optionText = optionText ?? '',
        this.optionValue = optionValue ?? '';

  final String optionText;
  final String? currentGroupSelection;
  final Future Function(String selectedValueOutput)? onSelected;
  final String optionValue;

  @override
  State<SingleChoiceOptionItemWidget> createState() =>
      _SingleChoiceOptionItemWidgetState();
}

class _SingleChoiceOptionItemWidgetState
    extends State<SingleChoiceOptionItemWidget> {
  late SingleChoiceOptionItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleChoiceOptionItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onSelected?.call(
          widget.optionValue,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Builder(
            builder: (context) {
              if (widget.currentGroupSelection == widget.optionText) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.radio_button_checked_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.optionText,
                        'option text',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                );
              } else {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.radio_button_off_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.optionText,
                        'option text',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
