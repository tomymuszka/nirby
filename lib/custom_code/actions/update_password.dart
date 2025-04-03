// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

Future<bool> updatePassword(String newPassword) async {
  // Add your function code here!
  final response = await SupaFlow.client.auth.updateUser(
    UserAttributes(password: newPassword),
  );

  if (response.user != null) {
    return true;
  } else {
    return false;
  }
}
