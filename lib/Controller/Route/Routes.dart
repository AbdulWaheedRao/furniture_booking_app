import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Model/Chair.dart';
import 'package:flutter_office_furniture_store_app/View/cart_screen.dart';
import 'package:flutter_office_furniture_store_app/View/detail_screen.dart';
import 'package:flutter_office_furniture_store_app/View/home_screen.dart';
import 'package:flutter_office_furniture_store_app/View/login_screen.dart';
import 'package:flutter_office_furniture_store_app/View/proceedToOrder.dart';
import 'package:flutter_office_furniture_store_app/View/reset_password_screen.dart';
import 'package:flutter_office_furniture_store_app/View/signup_screen.dart';
import 'package:flutter_office_furniture_store_app/View/starting_screen.dart';

Route ongenerateRoute(RouteSettings settings) {
  if (settings.name == MyStartingPage.pageName) {
    return MaterialPageRoute(
      builder: (context) => const MyStartingPage(),
    );
  } else if (settings.name == LoginPage.pageName) {
    return MaterialPageRoute(
      builder: (context) => const LoginPage(),
    );
  } else if (settings.name == SignUpPage.pageName) {
    return MaterialPageRoute(
      builder: (context) => const SignUpPage(),
    );
  } else if (settings.name == ForgotPasswordScreen.pageName) {
    return MaterialPageRoute(
      builder: (context) => const ForgotPasswordScreen(),
    );
  } else if (settings.name == HomeScreen.pageName) {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
  } else if (settings.name == DetailPage.pageName) {
    Chair chair = settings.arguments as Chair;
    return MaterialPageRoute(
        settings: RouteSettings(arguments: settings),
        builder: (context) => DetailPage(
              title: chair.title,
              image: chair.image,
              id: chair.id,
              price: chair.price,
              discription: chair.discription,
            ));
  } else if (settings.name == CartScreen.pageName) {
    return MaterialPageRoute(
      builder: (context) => const CartScreen(),
    );
  } else {
    return MaterialPageRoute(
      builder: (context) => const ProceedToOrder(),
    );
  }
}
