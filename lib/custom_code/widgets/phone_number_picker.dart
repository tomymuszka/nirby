// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberPicker extends StatefulWidget {
  const PhoneNumberPicker({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<PhoneNumberPicker> createState() => _PhoneNumberPickerState();
}

class _PhoneNumberPickerState extends State<PhoneNumberPicker> {
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 60,
      child: IntlPhoneField(
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          filled: true,
          fillColor: Color(0xFFF9FAFB), // Color de fondo (#F9FAFB)
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD1D5DB), // Color del borde (#D1D5DB)
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  Color(0xFFD1D5DB), // Color del borde cuando no está enfocado
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD1D5DB), // Color del borde cuando está enfocado
              width: 2.0, // Puedes ajustar el grosor si lo deseas
            ),
          ),
        ),
        initialCountryCode:
            'US', // Ajusta el código de país por defecto si lo necesitas
        onChanged: (phone) {
          print('Phone number: ${phone.completeNumber}');
        },
        onCountryChanged: (country) {
          print('Country changed to: ${country.name}');
        },
      ),
    );
  }
}
