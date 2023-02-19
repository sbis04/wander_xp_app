import '../components/place_placeholder_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'places_list_placeholder_model.dart';
export 'places_list_placeholder_model.dart';

class PlacesListPlaceholderWidget extends StatefulWidget {
  const PlacesListPlaceholderWidget({Key? key}) : super(key: key);

  @override
  _PlacesListPlaceholderWidgetState createState() =>
      _PlacesListPlaceholderWidgetState();
}

class _PlacesListPlaceholderWidgetState
    extends State<PlacesListPlaceholderWidget> {
  late PlacesListPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlacesListPlaceholderModel());
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
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(),
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        children: [
          wrapWithModel(
            model: _model.placePlaceholderModel1,
            updateCallback: () => setState(() {}),
            child: PlacePlaceholderWidget(),
          ),
          wrapWithModel(
            model: _model.placePlaceholderModel2,
            updateCallback: () => setState(() {}),
            child: PlacePlaceholderWidget(),
          ),
          wrapWithModel(
            model: _model.placePlaceholderModel3,
            updateCallback: () => setState(() {}),
            child: PlacePlaceholderWidget(),
          ),
          wrapWithModel(
            model: _model.placePlaceholderModel4,
            updateCallback: () => setState(() {}),
            child: PlacePlaceholderWidget(),
          ),
        ],
      ),
    );
  }
}
