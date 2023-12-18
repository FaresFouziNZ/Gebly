import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LogInView extends HookWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('LogInView'),
        ),
        body: Center(
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
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Welcome back!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF232323),
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
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Phone number",
                            hintText: 'Enter your phone number',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
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
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFB42341))),
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
              )
            ],
          ),
        ));
  }
}
