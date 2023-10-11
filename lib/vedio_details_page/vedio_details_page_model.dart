import '/backend/api_requests/api_calls.dart';
import '/components/vedio_start_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'vedio_details_page_widget.dart' show VedioDetailsPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VedioDetailsPageModel extends FlutterFlowModel<VedioDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for vedioStart component.
  late VedioStartModel vedioStartModel1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vedioStartModel1 = createModel(context, () => VedioStartModel());
  }

  void dispose() {
    unfocusNode.dispose();
    vedioStartModel1.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
