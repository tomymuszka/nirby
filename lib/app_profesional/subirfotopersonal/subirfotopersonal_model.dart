import '/flutter_flow/flutter_flow_util.dart';
import 'subirfotopersonal_widget.dart' show SubirfotopersonalWidget;
import 'package:flutter/material.dart';

class SubirfotopersonalModel extends FlutterFlowModel<SubirfotopersonalWidget> {
  ///  Local state fields for this page.

  String foto =
      'https://hjqqszvninihwpxrknjm.supabase.co/storage/v1/object/public/fotos/imagePlaceHolder.jpeg';

  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
