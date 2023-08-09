import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Controller/Increament_Decrement_Provider/StateNotifierProvider.dart';
import 'package:flutter_office_furniture_store_app/Controller/Insert_AddToCart_Pro/FetchAddToCartItems.dart';
import 'package:flutter_office_furniture_store_app/Controller/Insert_AddToCart_Pro/InsertNotifierProder.dart';
import 'package:flutter_office_furniture_store_app/View/cart_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class DetailPage extends ConsumerStatefulWidget {
  DetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.discription,
    required this.price,
    required this.id,
    // required this.album,
  });
  String title;
  String image;
  String discription;
  num price;

  String id;
  // Chair album;
  static const pageName = '/DetailPage';

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;
    final cleintHeight = height - kToolbarHeight;
    // ModelClassForAddToCart data=ModalRoute.of(context)!.settings.arguments as ModelClassForAddToCart;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0),
        title: const Text(
          'Comhar All-in-One ...',
          style: TextStyle(color: Colors.blue),
        ),
        elevation: 0,
        actions: const [
          Icon(
            Icons.book_online,
            color: Colors.blue,
          )
        ],
      ),
      body: SizedBox(
          width: width,
          height: cleintHeight,
          child: SizedBox(
            width: width,
            height: cleintHeight,
            child: Column(
              children: [
                Expanded(
                    flex: 20,
                    child: SizedBox(
                        width: width,
                        // color: Colors.teal,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: widget.id,
                              child: Container(
                                width: width * 0.9,
                                height: cleintHeight * 0.46,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    image: DecorationImage(
                                        image: NetworkImage(widget.image),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            SizedBox(
                              height: cleintHeight * 0.01,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(Icons.star),
                              ],
                            ),
                          ],
                        ))),
                Expanded(
                    flex: 15,
                    child: SizedBox(
                      width: width * 0.95,
                      // color: Colors.amberAccent,
                      child: SizedBox(
                        width: width * 0.95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              widget.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              // maxLines: 3,
                            ),
                            SizedBox(
                              height: cleintHeight * 0.017,
                            ),
                            AutoSizeText(
                              widget.discription,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                              // maxLines: 3,
                            ),
                            SizedBox(
                              height: cleintHeight * 0.035,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const AutoSizeText(
                                      'Color :',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      // maxLines: 3,
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Container(
                                      width: width * 0.09,
                                      height: cleintHeight * 0.05,
                                      decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Container(
                                      width: width * 0.09,
                                      height: cleintHeight * 0.05,
                                      decoration: const BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle),
                                    ),
                                  ],
                                ),
                                Consumer(builder: (BuildContext context,
                                    WidgetRef ref, Widget? child) {
                                  return Row(
                                    children: [
                                      InkWell(
                                        onTap: (() {
                                          ref
                                              .read(counterProvider.notifier)
                                              .decreament();
                                        }),
                                        child: Container(
                                          width: width * 0.1,
                                          height: cleintHeight * 0.05,
                                          decoration: const BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 197, 196, 196),
                                                    offset: Offset(0, 1.3)),
                                                BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 197, 196, 196),
                                                    offset: Offset(0.4, 0)),
                                                BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 197, 196, 196),
                                                    offset: Offset(-0.4, 0)),
                                              ],
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: const Center(
                                            child: AutoSizeText(
                                              '-',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w100,
                                              ),
                                              // maxLines: 3,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.017,
                                      ),
                                      AutoSizeText(
                                        '${ref.watch(counterProvider).count}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        // maxLines: 3,
                                      ),
                                      SizedBox(
                                        width: width * 0.017,
                                      ),
                                      InkWell(
                                        onTap: (() {
                                          ref
                                              .read(counterProvider.notifier)
                                              .increament();
                                        }),
                                        child: Container(
                                          width: width * 0.1,
                                          height: cleintHeight * 0.05,
                                          decoration: const BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 197, 196, 196),
                                                    offset: Offset(0, 1.3)),
                                                BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 197, 196, 196),
                                                    offset: Offset(0.4, 0)),
                                                BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 197, 196, 196),
                                                    offset: Offset(-0.4, 0)),
                                              ],
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: const Center(
                                            child: AutoSizeText(
                                              '+',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w100,
                                              ),
                                              // maxLines: 3,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                              ],
                            ),
                            SizedBox(
                              height: cleintHeight * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      'Price',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w100,
                                      ),
                                      // maxLines: 3,
                                    ),
                                    AutoSizeText(
                                      widget.price.toString(),
                                      style: const TextStyle(
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
                                      ref
                                          .watch(
                                              addToCartStateProvider.notifier)
                                          .addToCart(
                                              heading: widget.title,
                                              id: widget.id,
                                              image: widget.image,
                                              quantity: ref
                                                  .watch(counterProvider)
                                                  .count,
                                              price: double.parse(
                                                  widget.price.toString()),
                                              description: widget.discription);
                                      Navigator.pushNamed(
                                          context, CartScreen.pageName);
                                    },
                                    child: const FetchCartData()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
