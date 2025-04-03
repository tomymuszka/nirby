import '/components/noconnection_widget.dart';
import 'package:marketplace_check_internet_connection_library_vrjzhi/custom_code/actions/index.dart'
    as marketplace_check_internet_connection_library_vrjzhi_actions;
import 'package:flutter/material.dart';

Future checkConnection(BuildContext context) async {
  bool? internet;

  internet = await marketplace_check_internet_connection_library_vrjzhi_actions
      .checkInternetConnection();
  if (!internet) {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: NoconnectionWidget(),
        );
      },
    );
  }
}
