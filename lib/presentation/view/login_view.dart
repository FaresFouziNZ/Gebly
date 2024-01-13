import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gebly/view_models/login_view_model.dart';
import 'package:go_router/go_router.dart';

class LogInView extends HookWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = LoginViewModel();
    final phoneNumberController = useTextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            // title: const Text('Confirm Order'),
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
                    Positioned(
                      right: MediaQuery.of(context).size.width * -0.08,
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/bg.png',
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Welcome!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 50,
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.w400,
                              height: 1.12,
                              letterSpacing: -0.25,
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Container(
                            width: 350,
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
                              controller: phoneNumberController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                  labelText: "Phone number",
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  hintText: 'Enter your phone number',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10)),
                            ),
                          ),
                        ],
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
                onPressed: () {
                  if (viewModel.isNumberValid(number: phoneNumberController.text)) {
                    viewModel.signIn(number: phoneNumberController.text);
                    context.push('/otp', extra: phoneNumberController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid phone number'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(const Size(0, 58)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  )),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: const Text(
                  'Login',
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
