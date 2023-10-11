import '/backend/api_requests/api_calls.dart';
import '/components/loding_widget.dart';
import '/components/vedio_start_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool loding = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (search)] action in HomePage widget.
  ApiCallResponse? apiResult4iu;
  // Stores action output result for [Backend Call - API (search)] action in Container widget.
  ApiCallResponse? apiResult537;
  // Model for loding component.
  late LodingModel lodingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    lodingModel = createModel(context, () => LodingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    lodingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
