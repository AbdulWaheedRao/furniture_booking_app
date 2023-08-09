import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Controller/CartProvider/FetchCartItems.dart';
import 'package:flutter_office_furniture_store_app/View/proceedToOrder.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const pageName = '/CartPage';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int number = 0;
  void increment() {
    setState(() {
      number++;
    });
  }

  void decrement() {
    setState(() {
      number--;
    });
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;
    final cleintHeight = height - kBottomNavigationBarHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                    width: width,
                    // color: Colors.teal,
                    child: Column(
                      children: [
                        SizedBox(
                          height: cleintHeight * 0.03,
                        ),
                        const AutoSizeText(
                          'Cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          // maxLines: 3,
                        ),
                      ],
                    ))),
            Expanded(
                flex: 11,
                child: SizedBox(
                    width: width,
                    // color: Colors.purpleAccent,
                    child: Column(
                      children: [
                        SizedBox(
                            width: width * 0.9,
                            height: cleintHeight * 0.65,
                            // color: Colors.red,
                            child: const FetchCartsList()),
                      ],
                    ))),
            Expanded(
                flex: 3,
                child: SizedBox(
                    width: width * 0.93,
                    // color: Colors.grey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: cleintHeight * 0.08,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AutoSizeText(
                                  'Total price',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  // maxLines: 3,
                                ),
                                SizedBox(
                                  height: cleintHeight * 0.01,
                                ),
                                const AutoSizeText(
                                  '\$1469.96',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  // maxLines: 3,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProceedToOrder.pageName);
                              },
                              child: Container(
                                width: width * 0.38,
                                height: cleintHeight * 0.055,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Center(
                                  child: AutoSizeText(
                                    'Chekout',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    // maxLines: 3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )))
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   // backgroundColor: Colors.deepPurple,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       backgroundColor: Colors.red,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.agriculture_outlined),
      //       label: 'Shopping cart',
      //       backgroundColor: Colors.green,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //       backgroundColor: Colors.purple,
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: Icon(Icons.settings),
      //     //   label: 'Settings',
      //     //   backgroundColor: Colors.pink,
      //     // ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
