import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CpfMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var cpf = newValue.text;

    if (cpf.length > 14 || !RegExp(r'^([\d-.]+)?$').hasMatch(cpf)) {
      return oldValue;
    }
    cpf = cpf.replaceAll(RegExp(r'\D'), '');
    final characters = cpf.characters.toList();
    var formatted = '';

    for (var i = 0; i < characters.length; i++) {
      if ([3, 6, 9].contains(i)) {
        formatted += i == 9 ? "-" : "."; //ternario

      }
      formatted += characters[i];
    }
    return newValue.copyWith(
      text: formatted,
      selection:
          TextSelection.fromPosition(TextPosition(offset: formatted.length)),
    );
  }
}

class PhoneMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var phone = newValue.text;

    if (phone.length > 14 || !RegExp(r'^([\d-()]+)?$').hasMatch(phone)) {
      return oldValue;
    }
    phone = phone.replaceAll(RegExp(r'\D'), '');
    final characteres = phone.characters.toList();
    var formatted = '';

    for (var i = 0; i < characteres.length; i++) {
      if (i == 0) {
        formatted += '(';
        formatted += characteres[i];
      } else if (i == 2) {
        formatted += ')';
        formatted += characteres[i];
      } else if (i == 7) {
        formatted += '-';
        formatted += characteres[i];
      } else {
        formatted += characteres[i];
      }
    }
    return newValue.copyWith(
      text: formatted,
      selection:
          TextSelection.fromPosition(TextPosition(offset: formatted.length)),
    );
  }
}
