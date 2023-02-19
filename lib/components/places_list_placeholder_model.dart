import '../components/place_placeholder_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlacesListPlaceholderModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for PlacePlaceholder component.
  late PlacePlaceholderModel placePlaceholderModel1;
  // Model for PlacePlaceholder component.
  late PlacePlaceholderModel placePlaceholderModel2;
  // Model for PlacePlaceholder component.
  late PlacePlaceholderModel placePlaceholderModel3;
  // Model for PlacePlaceholder component.
  late PlacePlaceholderModel placePlaceholderModel4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    placePlaceholderModel1 =
        createModel(context, () => PlacePlaceholderModel());
    placePlaceholderModel2 =
        createModel(context, () => PlacePlaceholderModel());
    placePlaceholderModel3 =
        createModel(context, () => PlacePlaceholderModel());
    placePlaceholderModel4 =
        createModel(context, () => PlacePlaceholderModel());
  }

  void dispose() {
    placePlaceholderModel1.dispose();
    placePlaceholderModel2.dispose();
    placePlaceholderModel3.dispose();
    placePlaceholderModel4.dispose();
  }

  /// Additional helper methods are added here.

}
