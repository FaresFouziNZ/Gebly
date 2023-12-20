import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gebly/view_models/signup_view_model.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends HookWidget {
  final String phoneNumber;
  const SignUpView({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final viewModel = SignUpViewModel();
    final checkboxIsPressed = useState<bool>(false);
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
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
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFFDDB8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Create your account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF232323),
                                fontSize: 57,
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.w400,
                                height: 1.12,
                                letterSpacing: -0.25,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                                color: Colors.white,
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: firstNameController,
                                decoration: const InputDecoration(
                                    focusColor: Colors.lightGreen,
                                    labelText: "First Name",
                                    hintText: 'Enter your first name',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 10)),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                                color: Colors.white,
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: lastNameController,
                                decoration: const InputDecoration(
                                    labelText: "Last Name",
                                    hintText: 'Enter your last name',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 10)),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                    value: checkboxIsPressed.value,
                                    onChanged: (bool? value) {
                                      checkboxIsPressed.value = value!;
                                    }),
                                const Text("I agree to the User Agreement\nand Privacy Policy"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     const Text('Already have an account?',
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 16,
                            //           fontFamily: 'Readex Pro',
                            //           fontWeight: FontWeight.w400,
                            //           height: 1.12,
                            //           letterSpacing: -0.25,
                            //         )),
                            //     TextButton(
                            //       onPressed: () {
                            //         // viewModel.verifyOTP();
                            //       },
                            //       child: const Text(
                            //         'Sign in',
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           fontFamily: 'Readex Pro',
                            //           fontWeight: FontWeight.w400,
                            //           height: 1.12,
                            //           letterSpacing: -0.25,
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),
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
                  if (viewModel.isDataValid(
                      fName: firstNameController.text,
                      lName: lastNameController.text,
                      isAgreed: checkboxIsPressed.value,
                      phoneNumber: phoneNumber)) {
                    await viewModel.signUp(
                      fName: firstNameController.text,
                      lName: lastNameController.text,
                      phoneNumber: phoneNumber,
                    );
                    context.go('/home');
                  }
                },
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
    );
  }
}
