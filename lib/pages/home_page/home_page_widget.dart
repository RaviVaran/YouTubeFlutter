import '/backend/api_requests/api_calls.dart';
import '/components/loding_widget.dart';
import '/components/vedio_start_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().initisialSearch != null &&
          FFAppState().initisialSearch != '') {
        setState(() {
          _model.loding = true;
        });
        _model.apiResult4iu = await SearchCall.call(
          apiQuery: FFAppState().initisialSearch,
        );
        if ((_model.apiResult4iu?.succeeded ?? true)) {
          setState(() {
            FFAppState().simpleResult = SearchCall.vedio(
              (_model.apiResult4iu?.jsonBody ?? ''),
            )!
                .toList()
                .cast<dynamic>();
          });
          setState(() {
            FFAppState().searchRefinements = getJsonField(
              (_model.apiResult4iu?.jsonBody ?? ''),
              r'''$.refinements''',
              true,
            )!
                .toList()
                .cast<dynamic>();
          });
        }
        setState(() {
          _model.loding = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Youtube_New_Logo.jpg',
                        width: 200.0,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment(0.00, 0.00),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Color(0xFFFFFCFC),
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  fillColor: Color(0xFFFFFBFB),
                  icon: Icon(
                    Icons.search,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 25.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      'searchPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                        ),
                      },
                    );
                  },
                ),
              ),
            ],
            centerTitle: true,
            toolbarHeight: 60.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Builder(
                        builder: (context) {
                          final refinenments =
                              FFAppState().searchRefinements.toList();
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(refinenments.length,
                                  (refinenmentsIndex) {
                                final refinenmentsItem =
                                    refinenments[refinenmentsIndex];
                                return Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.apiResult537 =
                                            await SearchCall.call(
                                          apiQuery: refinenmentsItem.toString(),
                                        );
                                        if ((_model.apiResult537?.succeeded ??
                                            true)) {
                                          setState(() {
                                            FFAppState().searchRefinements =
                                                SearchCall.vedio(
                                              (_model.apiResult537?.jsonBody ??
                                                  ''),
                                            )!
                                                    .toList()
                                                    .cast<dynamic>();
                                          });
                                          setState(() {
                                            FFAppState().searchRefinements =
                                                getJsonField(
                                              (_model.apiResult537?.jsonBody ??
                                                  ''),
                                              r'''$.refinements''',
                                              true,
                                            )!
                                                    .toList()
                                                    .cast<dynamic>();
                                          });
                                        }

                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFFCFC),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    refinenmentsItem.toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (_model.loding == true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                      child: wrapWithModel(
                        model: _model.lodingModel,
                        updateCallback: () => setState(() {}),
                        child: LodingWidget(),
                      ),
                    ),
                  Builder(
                    builder: (context) {
                      final vedio = FFAppState().simpleResult.toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: vedio.length,
                        itemBuilder: (context, vedioIndex) {
                          final vedioItem = vedio[vedioIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 5.0),
                                child: Stack(
                                  alignment: AlignmentDirectional(1.0, 1.0),
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'vedioDetailsPage',
                                          queryParameters: {
                                            'vedio': serializeParam(
                                              vedioItem,
                                              ParamType.JSON,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 200),
                                            ),
                                          },
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.network(
                                          getJsonField(
                                            vedioItem,
                                            r'''$.thumbnails[0].url''',
                                          ),
                                          width: double.infinity,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Container(
                                        width: 70.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                functions
                                                    .convertSecondsToMinutes(
                                                        getJsonField(
                                                  vedioItem,
                                                  r'''$.lengthSeconds''',
                                                )),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        getJsonField(
                                          vedioItem,
                                          r'''$.author.avatar[0].url''',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    getJsonField(
                                                      vedioItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color:
                                                              Color(0xFF363535),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            VedioStartWidget(
                                              key: Key(
                                                  'Keyozd_${vedioIndex}_of_${vedio.length}'),
                                              author: getJsonField(
                                                vedioItem,
                                                r'''$.author.title''',
                                              ).toString(),
                                              viewsCount: getJsonField(
                                                vedioItem,
                                                r'''$.stats.views''',
                                              ),
                                              populishedTime: getJsonField(
                                                vedioItem,
                                                r'''$.publishedTimeText''',
                                              ).toString(),
                                              showAuthor: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
