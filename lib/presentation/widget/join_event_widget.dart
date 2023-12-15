import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JoinEventWidget extends HookConsumerWidget {
  const JoinEventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.925,
      height: MediaQuery.of(context).size.height * 0.138,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).colorScheme.scrim.withOpacity(0.4),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 32,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8132,
            height: MediaQuery.of(context).size.height * 0.138,
            color: Theme.of(context).colorScheme.scrim.withOpacity(0.4),
            child: OtpTextField(
              numberOfFields: 6,
              borderColor: Theme.of(context).colorScheme.tertiary,
              focusedBorderColor: Theme.of(context).colorScheme.tertiary,
              keyboardType: TextInputType.text,
              inputFormatters: [UpperCaseTextFormatter()],
            ),
          ),
        ],
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
