import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gebly/view_models/otp_view_model.dart';
import 'package:go_router/go_router.dart';

class OTPView extends StatelessWidget {
  final String phoneNumber;
  const OTPView({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final viewModel = OtpViewModel();
    String otpCode = '';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 4.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 4.0,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: ShapeDecoration(
                          color: Theme.of(context).colorScheme.tertiaryContainer,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                              child: Text(
                                'set up 2-step verification',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                                  fontSize: 45,
                                  fontFamily: 'Readex Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.12,
                                  letterSpacing: -0.25,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                              child: OtpTextField(
                                showFieldAsBox: true,
                                fillColor: Colors.white,
                                filled: true,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                focusedBorderColor: Theme.of(context).colorScheme.primary,
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Readex Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  //letterSpacing: -0.25,
                                ),
                                onSubmit: (value) async {
                                  final result = await viewModel.verifyOtp(code: value, phoneNumber: phoneNumber);
                                  if (result == true) {
                                    final isUserExist = await viewModel.isUserExist();
                                    if (isUserExist) {
                                      context.go('/home');
                                    } else {
                                      context.go('/sign-up', extra: phoneNumber);
                                    }
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: ElevatedButton(
                onPressed: () async {
                  if (viewModel.isOtpValid(otpCode)) {
                    final result = await viewModel.verifyOtp(code: otpCode, phoneNumber: phoneNumber);
                    if (result == true) {
                      final isUserExist = await viewModel.isUserExist();
                      if (isUserExist) {
                        context.go('/home');
                      } else {
                        context.go('/sign-up');
                      }
                    }
                  } else {}
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(0, 58),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  )),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 28,
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w400,
                    height: 0.05,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
