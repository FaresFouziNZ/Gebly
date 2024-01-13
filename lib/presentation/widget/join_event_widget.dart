import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gebly/view_models/home_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JoinEventWidget extends ConsumerWidget {
  const JoinEventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = JoinEventViewModel();
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
            child: GestureDetector(
              onTap: () async {},
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
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              onSubmit: (value) async {
                if (viewModel.isCodeValid(value)) {
                  final event = await viewModel.getEventData(value);
                  // ref.read(eventProvider.notifier).state = event;
                  if (event == null) {
                    return;
                  }
                  context.push('/event-info', extra: event);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
