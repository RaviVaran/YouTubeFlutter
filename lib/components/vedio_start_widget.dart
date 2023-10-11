import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vedio_start_model.dart';
export 'vedio_start_model.dart';

class VedioStartWidget extends StatefulWidget {
  const VedioStartWidget({
    Key? key,
    this.author,
    this.viewsCount,
    this.populishedTime,
    required this.showAuthor,
  }) : super(key: key);

  final String? author;
  final int? viewsCount;
  final String? populishedTime;
  final bool? showAuthor;

  @override
  _VedioStartWidgetState createState() => _VedioStartWidgetState();
}

class _VedioStartWidgetState extends State<VedioStartWidget> {
  late VedioStartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VedioStartModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.showAuthor == true)
          Text(
            widget.author!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: Color(0xFF363535),
                ),
          ),
        if (widget.showAuthor == true)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: Icon(
              Icons.circle_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 5.0,
            ),
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
          child: Text(
            '${formatNumber(
              widget.viewsCount,
              formatType: FormatType.custom,
              format: '',
              locale: '',
            )} views',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: Color(0xFF363535),
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
          child: Icon(
            Icons.circle_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 5.0,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: Text(
              widget.populishedTime!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: Color(0xFF363535),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
