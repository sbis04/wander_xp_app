import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_container_model.dart';
export 'empty_container_model.dart';

class EmptyContainerWidget extends StatefulWidget {
  const EmptyContainerWidget({Key? key}) : super(key: key);

  @override
  _EmptyContainerWidgetState createState() => _EmptyContainerWidgetState();
}

class _EmptyContainerWidgetState extends State<EmptyContainerWidget> {
  late EmptyContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyContainerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
