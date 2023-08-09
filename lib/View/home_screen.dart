import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Chairs/FetchChairs.dart';
import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Disks/FetchDisks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
     static const pageName='/HomePage';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;
    // final cleintHeight = height - kToolbarHeight;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: width * 0.95,
                  // color: Colors.deepPurple,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                            // color: Colors.pink,
                            width: width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      'Hello Sina',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Icon(Icons.dehaze_sharp),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                const AutoSizeText(
                                  'Buy Your favourite desk',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                width: width * 0.95,
                                height: height * 0.07,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    suffixIcon: Icon(Icons.dehaze_sharp),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(17)),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: (BorderSide(
                                          width: 1.0, color: Colors.blue)),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(17),
                                      ),
                                    ),
                                    labelText: 'Search',
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: width * 0.95,
                  child: const FetchDisksList(),
                ),
              ),
              Expanded(
                flex: 8,
                child: SizedBox(
                  width: width * 0.95,
                  // height: height,
                  // color: Colors.teal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AutoSizeText(
                        'Popular',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        width: width * 0.95,
                        height: height * 0.43,
                        // color: Colors.red,
                        child: const FetchChairsList(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
