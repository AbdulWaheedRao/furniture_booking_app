import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Controller/CreateUserProvider/States.dart';
import 'package:flutter_office_furniture_store_app/Controller/CreateUserProvider/createUser_StateNotifierProvider.dart';
import 'package:flutter_office_furniture_store_app/Controller/Validations/Validation_Mixin.dart';
import 'package:flutter_office_furniture_store_app/View/Widgets/button.dart';
import 'package:flutter_office_furniture_store_app/View/Widgets/text_field.dart';
import 'package:flutter_office_furniture_store_app/View/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});
  static const pageName = '/SignUpPage';

  @override
  ConsumerState createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage>
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
    Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      controller1!.forward();
      timer.cancel();
    });
    // Timer(const Duration(milliseconds: 2500), () {
    //   controller1!.forward();
    // });

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

  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: ref.watch(creatUserProvider) is LoadingState
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textFormField(
                                      icon: Icons.account_circle_outlined,
                                      hintText: 'User name...',
                                      isPassword: false,
                                      isEmail: false,
                                      context: context,
                                      controller: userNameController,
                                      validator: (value) =>
                                          emptyValidation(value)),
                                  textFormField(
                                      icon: Icons.email_outlined,
                                      hintText: 'Email...',
                                      isPassword: false,
                                      isEmail: true,
                                      controller: emailController,
                                      context: context,
                                      validator: (value) =>
                                          emailValidation(value)),
                                  textFormField(
                                      icon: Icons.lock_outline,
                                      hintText: 'Password...',
                                      isPassword: true,
                                      context: context,
                                      isEmail: true,
                                      controller: passwordController,
                                      validator: (value) =>
                                          paswodValidation(value)),
                                  textFormField(
                                      icon: Icons.location_history_outlined,
                                      hintText: 'Address...',
                                      isPassword: false,
                                      isEmail: false,
                                      context: context,
                                      controller: addressController,
                                      validator: (value) =>
                                          emptyValidation(value)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      button(
                                        string: 'SignUp',
                                        width: 2.58,
                                        context: context,
                                        voidCallback: () {
                                          if (globalKey.currentState!
                                              .validate()) {
                                            ref
                                                .read(
                                                    creatUserProvider.notifier)
                                                .loadingState;

                                            ref
                                                .read(
                                                    creatUserProvider.notifier)
                                                .createUserWithEmailAndPassword(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  userName:
                                                      userNameController.text,
                                                  address:
                                                      addressController.text,
                                                )
                                                .then((value) {
                                              ref
                                                  .read(creatUserProvider
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
                                              style: TextStyle(
                                                  color: Colors.amber),
                                            )));
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 6,
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
