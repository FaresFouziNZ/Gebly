import 'package:flutter/services.dart';
import 'package:gebly/core/models/event.dart';
import 'package:gebly/core/services/database_queries.dart';

class JoinEventViewModel {
  bool isCodeValid(eventCode) {
    if (eventCode.length == 6) {
      return true;
    }
    return false;
  }

  Future<Event?> getEventData(eventCode) async {
    final event = await DatabaseServices().getEventByCode(code: eventCode);
    return event;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
