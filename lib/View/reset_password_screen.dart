import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Controller/CreateUserProvider/States.dart';
import 'package:flutter_office_furniture_store_app/Controller/Reset_Password_Provider/Reset_StateNotifierProvider.dart';
import 'package:flutter_office_furniture_store_app/Controller/Validations/Validation_Mixin.dart';
import 'package:flutter_office_furniture_store_app/View/Widgets/button.dart';
import 'package:flutter_office_furniture_store_app/View/Widgets/text_field.dart';
import 'package:flutter_office_furniture_store_app/View/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const pageName = '/ResetPasswordPage';

  @override
  ConsumerState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen>
    with TickerProviderStateMixin, FormValidationMixin {
  AnimationController? controller1;
  AnimationController? controller2;
  Animation<double>? animation1;
  Animation<double>? animation2;
  Animation<double>? animation3;
  Animation<double>? animation4;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1 as Animation<double>,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1!.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1 as Animation<double>,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2 as Animation<double>,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2!.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2 as Animation<double>,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      controller1!.forward();
    });

    controller2!.forward();
  }

  @override
  void dispose() {
    controller1!.dispose();
    controller2!.dispose();
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: ref.watch(resetPasswordProvider) is LoadingState
          ? const CircularProgressIndicator()
          : ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.height * (animation2!.value + .58),
                        left: size.width * .21,
                        child: CustomPaint(
                          painter: MyPainter(50),
                        ),
                      ),
                      Positioned(
                        top: size.height * .98,
                        left: size.width * .1,
                        child: CustomPaint(
                          painter: MyPainter(animation4!.value - 30),
                        ),
                      ),
                      Positioned(
                        top: size.height * .5,
                        left: size.width * (animation2!.value + .8),
                        child: CustomPaint(
                          painter: MyPainter(30),
                        ),
                      ),
                      Positioned(
                        top: size.height * animation3!.value,
                        left: size.width * (animation1!.value + .1),
                        child: CustomPaint(
                          painter: MyPainter(60),
                        ),
                      ),
                      Positioned(
                        top: size.height * .1,
                        left: size.width * .8,
                        child: CustomPaint(
                          painter: MyPainter(animation4!.value),
                        ),
                      ),
                      Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * .1),
                              child: Text(
                                'APP NAME',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.7),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  wordSpacing: 4,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 11,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * .1,
                                      left: size.width * .08),
                                  child: Text(
                                    'Receive an email to reset your password',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(.7),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      wordSpacing: 4,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                ),
                                // const Text('Receive an email to reset your password'),
                                Form(
                                  key: globalKey,
                                  child: textFormField(
                                      icon: Icons.email_outlined,
                                      hintText: 'Email...',
                                      isPassword: false,
                                      isEmail: true,
                                      controller: emailController,
                                      context: context,
                                      validator: (value) =>
                                          emailValidation(value)),
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    button(
                                      string: 'Reset',
                                      width: 2.58,
                                      context: context,
                                      voidCallback: () {
                                        if (globalKey.currentState!
                                            .validate()) {
                                          ref
                                              .read(resetPasswordProvider
                                                  .notifier)
                                              .loadingState;
                                          ref
                                              .read(resetPasswordProvider
                                                  .notifier)
                                              .createPasswordResetEmail(
                                                  email: emailController.text)
                                              .then((value) {
                                            ref
                                                .read(resetPasswordProvider
                                                    .notifier)
                                                .loadedState;
                                            Navigator.pushNamed(
                                                context, LoginPage.pageName);
                                          });
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                            'Feild Should Not to be empty',
                                            style:
                                                TextStyle(color: Colors.amber),
                                          )));
                                        }
                                      },
                                    ),
                                    SizedBox(width: size.width / 20),
                                    button(
                                      string: 'Cancel',
                                      width: 2.58,
                                      context: context,
                                      voidCallback: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
