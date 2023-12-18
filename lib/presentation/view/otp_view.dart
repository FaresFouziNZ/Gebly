import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPView extends HookWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    final checkboxIsPressed = useState<bool>(false);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('OTP'),
        ),
        body: Center(
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
                        child: const Text(
                          'set up 2-step verification',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF232323),
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
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
                          onPressed: () {},
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(const Size(0, 58)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              )),
                              backgroundColor: checkboxIsPressed.value
                                  ? MaterialStateProperty.all<Color>(const Color(0xFFB42341))
                                  : MaterialStateProperty.all<Color>(const Color(0xFF4D4545))),
                          child: const Text(
                            'Continue',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
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
              )
            ],
          ),
        ));
  }
}
