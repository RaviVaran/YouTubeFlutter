import '/backend/api_requests/api_calls.dart';
import '/components/loding_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  bool isloding = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchTerm widget.
  TextEditingController? searchTermController;
  String? Function(BuildContext, String?)? searchTermControllerValidator;
  // Stores action output result for [Backend Call - API (search)] action in searchTerm widget.
  ApiCallResponse? apiResult0ow;
  // Model for loding component.
  late LodingModel lodingModel;
  // Stores action output result for [Backend Call - API (search)] action in IconButton widget.
  ApiCallResponse? apiResultm2h;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    lodingModel = createModel(context, () => LodingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchTermController?.dispose();
    lodingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
