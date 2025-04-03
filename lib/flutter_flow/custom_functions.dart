import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? returntext(List<String>? list) {
  // from a list of strings return a single text separated by ,
  if (list == null || list.isEmpty) {
    return null;
  }

  return list.join(', ');
}

List<String>? fromlistreturnarray(
  String? input1,
  String? input2,
) {
  // from 2 inputs return an array
  return [input1 ?? '', input2 ?? ''];
}

bool? verifyIfIsANumber(String? input) {
  // if the input is a valid number, return true, else false
  if (input == null) {
    return false;
  }

  try {
    double.parse(input);
    return true;
  } catch (e) {
    return false;
  }
}

List<String>? returnarrayfromstring(String? input) {
  // return an array fron an input split by ,
  // return an array from an input split by ,
  if (input == null) {
    return null;
  }

  return input.split(',');
}

List<int>? returnarrayfromint(int? input) {
  // return an array of integers from a single inetger
  // return an array from a single integer
  if (input == null) {
    return null;
  }

  String inputString = input.toString();
  List<int> result = inputString.runes
      .map((rune) => int.parse(String.fromCharCode(rune)))
      .toList();
  return result;
}

String? returnInitials(String? input) {
  // from an input return the initials
  // return the initials from an input string
  if (input == null || input.isEmpty) {
    return null;
  }

  List<String> words = input.split(' ');
  List<String> initials = words.map((word) => word[0]).toList();
  return initials.join('');
}

DateTime? fromIsoReturnDate(String? input) {
  // from this 2025-12-19T22.14.36.000-04.02 return the date 2025-12-19
  if (input == null || input.isEmpty) {
    return null;
  }

  List<String> parts = input.split('T');
  return DateTime.tryParse(parts[0]);
}

String? passwordtoken(String? input) {
  // i need the string from the input after code=
  if (input == null || !input.contains('code=')) {
    return null;
  }

  int startIndex = input.indexOf('code=') + 5;
  return input.substring(startIndex);
}

int? sumdates(
  DateTime? currentdate,
  DateTime? createdat,
) {
// Necesito que em devuelvas la cantidad de dias de diferencia entre el created at y el currentdate
  if (currentdate == null || createdat == null) {
    return null;
  }

  Duration difference = currentdate.difference(createdat);
  return difference.inDays;
}

bool? isPositive(int? input) {
  // return true if the input is positive
  if (input == null) {
    return null;
  }

  return input > 0;
}

bool? differencebetweendatesmenor90(
  DateTime? currentdate,
  DateTime? createdat,
) {
  // return true if the difference between current date and createdat is lower than 90
// return true if the difference between current date and createdat is lower than 90
  if (currentdate == null || createdat == null) {
    return null;
  }

  Duration difference = currentdate.difference(createdat);
  return difference.inDays < 90;
}

bool? arraycontainsstring(
  String? input,
  List<String>? arrayinput,
) {
// verify if the input is included in the array input
  // verify if the input is included in the array input
  if (input == null || arrayinput == null) {
    return null;
  }

  return arrayinput.contains(input);
}

DateTime? timebefore(
  DateTime? inputDate,
  int? inputTime,
) {
  // substarct the input Time in hours from the inputDate
  // subtract the input Time in hours from the inputDate
  if (inputDate == null || inputTime == null) {
    return null;
  }

  return inputDate.subtract(Duration(hours: inputTime));
}

List<String>? additemtoarray(
  List<String>? list,
  String? item,
) {
  // add the item to the list
  // add the item to the list
  if (list == null) {
    list = [];
  }
  list.add(item ?? '');
  return list;
}

bool? isWordInString(
  String? word,
  String? string,
) {
  // if the word is in the string, return true. else false
  if (word == null || string == null) {
    return null;
  }

  return string.contains(word);
}

int? getNumbersFromString(String? input) {
  // get a number from a string
  // get a number from a string
  // get a number from a string
  if (input == null) {
    return null;
  }

  // Regular expression to match numbers in a string
  RegExp regExp = RegExp(r'\d+');
  // Find the first match in the input string
  Match? match = regExp.firstMatch(input);
  // If a match is found, extract the number and parse it to an integer
  if (match != null) {
    String numberString = match.group(0)!;
    return int.parse(numberString);
  }

  return null;
}
