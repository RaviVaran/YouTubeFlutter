import '/backend/api_requests/api_calls.dart';
import '/components/vedio_start_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vedio_details_page_model.dart';
export 'vedio_details_page_model.dart';

class VedioDetailsPageWidget extends StatefulWidget {
  const VedioDetailsPageWidget({
    Key? key,
    required this.vedio,
  }) : super(key: key);

  final dynamic vedio;

  @override
  _VedioDetailsPageWidgetState createState() => _VedioDetailsPageWidgetState();
}

class _VedioDetailsPageWidgetState extends State<VedioDetailsPageWidget> {
  late VedioDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VedioDetailsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, _) => [
              SliverAppBar(
                expandedHeight: 280.0,
                pinned: false,
                floating: false,
                backgroundColor: Color(0x79F5F5F5),
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.white,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Color(0x4CFFFFFF),
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 26.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ],
                        ),
                      ),
                      FlutterFlowYoutubePlayer(
                        url: 'https://www.youtube.com/watch?v=${getJsonField(
                          widget.vedio,
                          r'''$.videoId''',
                        ).toString()}',
                        autoPlay: false,
                        looping: true,
                        mute: false,
                        showControls: true,
                        showFullScreen: true,
                        strictRelatedVideos: false,
                      ),
                    ],
                  ),
                ),
                centerTitle: false,
                elevation: 0.0,
              )
            ],
            body: Builder(
              builder: (context) {
                return SafeArea(
                  top: false,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  getJsonField(
                                    widget.vedio,
                                    r'''$.title''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.vedioStartModel1,
                                  updateCallback: () => setState(() {}),
                                  child: VedioStartWidget(
                                    author: getJsonField(
                                      widget.vedio,
                                      r'''$.author.title''',
                                    ).toString(),
                                    viewsCount: getJsonField(
                                      widget.vedio,
                                      r'''$.stats.views''',
                                    ),
                                    populishedTime: getJsonField(
                                      widget.vedio,
                                      r'''$.publishedTimeText''',
                                    ).toString(),
                                    showAuthor: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  getJsonField(
                                    widget.vedio,
                                    r'''$.descriptionSnippet''',
                                  ).toString(),
                                  maxLines: 3,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          indent: 20.0,
                          endIndent: 20.0,
                          color: FlutterFlowTheme.of(context).accent4,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'More content',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFB8B5B5),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: RetriveChannelCall.call(
                            id: getJsonField(
                              widget.vedio,
                              r'''$.author.channelId''',
                            ).toString(),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFFF21010),
                                    ),
                                  ),
                                ),
                              );
                            }
                            final columnRetriveChannelResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final channalVedio =
                                    RetriveChannelCall.contents(
                                          columnRetriveChannelResponse.jsonBody,
                                        )?.toList() ??
                                        [];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(channalVedio.length,
                                      (channalVedioIndex) {
                                    final channalVedioItem =
                                        channalVedio[channalVedioIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 15.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                getJsonField(
                                                  channalVedioItem,
                                                  r'''$.thumbnails[0].url''',
                                                ),
                                                width: 110.0,
                                                height: 90.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Text(
                                                          getJsonField(
                                                            channalVedioItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: VedioStartWidget(
                                                        key: Key(
                                                            'Key65o_${channalVedioIndex}_of_${channalVedio.length}'),
                                                        author: getJsonField(
                                                          channalVedioItem,
                                                          r'''$.author.title''',
                                                        ).toString(),
                                                        viewsCount:
                                                            getJsonField(
                                                          channalVedioItem,
                                                          r'''$.stats.views''',
                                                        ),
                                                        populishedTime:
                                                            getJsonField(
                                                          channalVedioItem,
                                                          r'''$.publishedTimeText''',
                                                        ).toString(),
                                                        showAuthor: false,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
