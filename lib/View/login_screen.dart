import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_office_furniture_store_app/Controller/CreateUserProvider/States.dart';
import 'package:flutter_office_furniture_store_app/Controller/SignInUserProvider/SignInUser_StateNotifierProvider.dart';
import 'package:flutter_office_furniture_store_app/Controller/Validations/Validation_Mixin.dart';
import 'package:flutter_office_furniture_store_app/View/Widgets/button.dart';
import 'package:flutter_office_furniture_store_app/View/Widgets/text_field.dart';
import 'package:flutter_office_furniture_store_app/View/home_screen.dart';
import 'package:flutter_office_furniture_store_app/View/reset_password_screen.dart';
import 'package:flutter_office_furniture_store_app/View/signup_screen.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  static const pageName = '/SignInPage';

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>
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

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: ref.watch(signInUserProvider) is LoadingState
          ? const Center(child: CircularProgressIndicator())
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
                        child: CustomPaint(painter: MyPainter(50)),
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
                            flex: 5,
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
                            flex: 7,
                            child: Form(
                              key: globalKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //! Email TextFormFiels
                                  textFormField(
                                      icon: Icons.email_outlined,
                                      hintText: 'Email...',
                                      isPassword: false,
                                      isEmail: true,
                                      controller: emailController,
                                      context: context,
                                      validator: (value) =>
                                          emailValidation(value)),

                                  //! Email TextFormFiels
                                  textFormField(
                                      icon: Icons.lock_outline,
                                      hintText: 'Password...',
                                      isPassword: true,
                                      isEmail: false,
                                      context: context,
                                      controller: passwordController,
                                      validator: (value) =>
                                          paswodValidation(value)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //! LogIn Page Button
                                      button(
                                        string: 'LOGIN',
                                        width: 2.58,
                                        context: context,
                                        voidCallback: () {
                                          if (globalKey.currentState!
                                              .validate()) {
                                            ref
                                                .read(
                                                    signInUserProvider.notifier)
                                                .loadingState;

                                            ref
                                                .read(
                                                    signInUserProvider.notifier)
                                                .signInUserWithEmailAndPassword(
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text)
                                                .then((value) {
                                              ref
                                                  .read(signInUserProvider
                                                      .notifier)
                                                  .loadedState;
                                              Navigator.pushNamed(
                                                  context, HomeScreen.pageName);
                                            });
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                              'Feild should not be empty',
                                              style: TextStyle(
                                                  color: Colors.amber),
                                            )));
                                          }
                                        },
                                      ),
                                      SizedBox(width: size.width / 20),

                                      //! ForgetPassword Button
                                      button(
                                        string: 'Forgotten password!',
                                        width: 2.58,
                                        context: context,
                                        voidCallback: () {
                                          Navigator.pushNamed(context,
                                              ForgotPasswordScreen.pageName);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                button(
                                  string: 'Create Account',
                                  width: 2.58,
                                  context: context,
                                  voidCallback: () {
                                    Navigator.pushNamed(
                                        context, SignUpPage.pageName);
                                  },
                                ),
                                SizedBox(height: size.height * .05),
                              ],
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

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
              colors: [Color(0xffFD5E3D), Color(0xffC43990)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
