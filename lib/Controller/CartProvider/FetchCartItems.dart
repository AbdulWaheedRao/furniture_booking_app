import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Controller/CartProvider/CartNotifeirProvider.dart';
import 'package:flutter_office_furniture_store_app/Controller/CartProvider/States.dart';
import 'package:flutter_office_furniture_store_app/Controller/Increament_Decrement_Provider/StateNotifierProvider.dart';
import 'package:flutter_office_furniture_store_app/Model/AddToCartModelClass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ModelClassForAddToCart> list2 = [];

class FetchCartsList extends ConsumerWidget {
  const FetchCartsList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(cartProvider);
        if (state is CartLoadingState) {
          return const CartLoadingWidget();
        } else if (state is CartLoadedState) {
          list2 = state.list;
          return CartLoadedWidget(list: state.list);
        } else {
          return CartErrorWidget(
              errorMessage: (state as CartErrorWidget).errorMessage);
        }
      },
    );
  }
}

class CartLoadingWidget extends ConsumerWidget {
  const CartLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(cartProvider.notifier).fetchCart();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CartErrorWidget extends StatelessWidget {
  const CartErrorWidget({required this.errorMessage, super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.red,
        child: Text(errorMessage),
      ),
    );
  }
}

class CartLoadedWidget extends ConsumerStatefulWidget {
  CartLoadedWidget({super.key, required this.list});
  List<ModelClassForAddToCart> list;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CartLoadedWidgetState();
}

class _CartLoadedWidgetState extends ConsumerState<CartLoadedWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;
    final cleintHeight = height - kBottomNavigationBarHeight;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5 / 2,
            crossAxisSpacing: 4 / 2,
            mainAxisSpacing: 30),
        itemCount: widget.list.length,
        itemBuilder: (BuildContext ctx, index) {
          return Row(
            children: [
              Container(
                width: width * 0.37,
                height: cleintHeight * 0.18,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(widget.list[index].image),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              SizedBox(
                width: width * 0.35,
                height: cleintHeight * 0.2,
                // color: Colors.pink,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      widget.list[index].heading,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AutoSizeText(
                      widget.list[index].price.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      // maxLines: 3,
                    ),
                    Row(
                      children: [
                        const AutoSizeText(
                          'Color : ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          // maxLines: 3,
                        ),
                        Container(
                          width: width * 0.08,
                          height: cleintHeight * 0.05,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 161, 126, 126),
                              shape: BoxShape.circle),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.14,
                height: cleintHeight * 0.2,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(counterProvider.notifier).decreament();
                      },
                      child: Container(
                        width: width * 0.1,
                        height: cleintHeight * 0.05,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 196, 196),
                                  offset: Offset(0, 1.3)),
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 196, 196),
                                  offset: Offset(0.4, 0)),
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 196, 196),
                                  offset: Offset(-0.4, 0)),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                      height: cleintHeight * 0.007,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.035),
                      child: AutoSizeText(
                        //  '${ref.watch(counterProvider).count}',
                        widget.list[index].quantity.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        // maxLines: 3,
                      ),
                    ),
                    SizedBox(
                      height: cleintHeight * 0.007,
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(counterProvider.notifier).increament();
                      },
                      child: Container(
                        width: width * 0.1,
                        height: cleintHeight * 0.05,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 196, 196),
                                  offset: Offset(0, 1.3)),
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 196, 196),
                                  offset: Offset(0.4, 0)),
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 196, 196),
                                  offset: Offset(-0.4, 0)),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                ),
              )
            ],
          );
        });
  }
}
