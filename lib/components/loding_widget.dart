import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loding_model.dart';
export 'loding_model.dart';

class LodingWidget extends StatefulWidget {
  const LodingWidget({Key? key}) : super(key: key);

  @override
  _LodingWidgetState createState() => _LodingWidgetState();
}

class _LodingWidgetState extends State<LodingWidget> {
  late LodingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LodingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 30.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Lottie.asset(
        'assets/lottie_animations/animation_lnitjns6.json',
        width: 300.0,
        height: 30.0,
        fit: BoxFit.fitWidth,
        reverse: true,
        animate: true,
      ),
    );
  }
}
