import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loginResponse = await LinodeServerGroup.loginUserCall.call(
        email: FFAppState().userEmail,
        password: FFAppState().userPassword,
      );
      FFAppState().userName = LinodeServerGroup.loginUserCall
          .userName(
            (_model.loginResponse?.jsonBody ?? ''),
          )
          .toString();
      FFAppState().uid = LinodeServerGroup.loginUserCall
          .uid(
            (_model.loginResponse?.jsonBody ?? ''),
          )
          .toString();
      if ((_model.loginResponse?.succeeded ?? true) &&
          (LinodeServerGroup.loginUserCall
                  .status(
                    (_model.loginResponse?.jsonBody ?? ''),
                  )
                  .toString() ==
              FFAppState().kStatusSuccess)) {
        context.pushNamed('DiscoverPage');
      } else {
        _model.placesResponse = await LinodeServerGroup.getPlacesCall.call();
        if ((_model.placesResponse?.succeeded ?? true)) {
          FFAppState().placeCities = (LinodeServerGroup.getPlacesCall.cities(
            (_model.placesResponse?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .toList();

          context.pushNamed('HomePage');
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        alignment: AlignmentDirectional(0, 0.25),
        children: [
          Image.asset(
            'assets/images/wanderxp_splash.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: 50,
            height: 50,
            child: custom_widgets.CustomProgressIndicator(
              width: 50,
              height: 50,
              color: FlutterFlowTheme.of(context).primaryColor,
              strokeWidth: 4.0,
            ),
          ),
        ],
      ),
    );
  }
}
