import '/components/list_widget_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'surveys_user_widget.dart' show SurveysUserWidget;
import 'package:flutter/material.dart';

class SurveysUserModel extends FlutterFlowModel<SurveysUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for ListWidgetComponent component.
  late ListWidgetComponentModel listWidgetComponentModel1;
  // Model for ListWidgetComponent component.
  late ListWidgetComponentModel listWidgetComponentModel3;

  @override
  void initState(BuildContext context) {
    listWidgetComponentModel1 =
        createModel(context, () => ListWidgetComponentModel());
    listWidgetComponentModel3 =
        createModel(context, () => ListWidgetComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    listWidgetComponentModel1.dispose();
    listWidgetComponentModel3.dispose();
  }
}
