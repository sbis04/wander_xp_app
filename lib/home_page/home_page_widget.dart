import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 200),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/ildiko-szabo-U69tbIc2xXU-unsplash_(1).jpg',
                  ).image,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Where are you ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: 'travelling ',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                              TextSpan(
                                text: 'to?',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 36,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Autocomplete<String>(
                          initialValue: TextEditingValue(),
                          optionsBuilder: (textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return FFAppState()
                                .placeCities
                                .toList()
                                .where((option) {
                              final lowercaseOption = option.toLowerCase();
                              return lowercaseOption.contains(
                                  textEditingValue.text.toLowerCase());
                            });
                          },
                          optionsViewBuilder: (context, onSelected, options) {
                            return AutocompleteOptionsList(
                              textFieldKey: _model.textFieldKey,
                              textController: _model.textController!,
                              options: options.toList(),
                              onSelected: onSelected,
                              textStyle: FlutterFlowTheme.of(context).bodyText1,
                              textHighlightStyle: TextStyle(),
                              elevation: 4,
                              optionBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              optionHighlightColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              maxHeight: 140,
                            );
                          },
                          onSelected: (String selection) {
                            setState(() =>
                                _model.textFieldSelectedOption = selection);
                            FocusScope.of(context).unfocus();
                          },
                          fieldViewBuilder: (
                            context,
                            textEditingController,
                            focusNode,
                            onEditingComplete,
                          ) {
                            _model.textController = textEditingController;
                            return TextFormField(
                              key: _model.textFieldKey,
                              controller: textEditingController,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 100),
                                () => setState(() {}),
                              ),
                              textCapitalization: TextCapitalization.words,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Place',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: 'Enter the place\'s name',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFFF0000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFFF0000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Icon(
                                  Icons.place_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                  ),
                              keyboardType: TextInputType.name,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Do you want to ',
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: 'discover ',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'places?',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                context.goNamed('DiscoverPage');
                              },
                              child: Text(
                                'Show',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_model.textFieldSelectedOption != null &&
                          _model.textFieldSelectedOption != '')
                        FFButtonWidget(
                          onPressed: _model.textFieldSelectedOption == null ||
                                  _model.textFieldSelectedOption == ''
                              ? null
                              : () async {
                                  FFAppState().placeName =
                                      _model.textFieldSelectedOption!;

                                  context.pushNamed('LoginPage');
                                },
                          text: 'Continue',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 55,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 24,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.normal,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            disabledColor:
                                FlutterFlowTheme.of(context).primaryLight,
                          ),
                        ),
                    ],
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ],
        ),
      ),
    );
  }
}
