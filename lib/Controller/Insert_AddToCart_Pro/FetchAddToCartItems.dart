import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Controller/Insert_AddToCart_Pro/InsertNotifierProder.dart';
import 'package:flutter_office_furniture_store_app/Controller/Insert_AddToCart_Pro/Insert_Screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchCartData extends ConsumerWidget {
  const FetchCartData({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(addToCartStateProvider);
        if (state is AddToCartLoadingState) {
          return const CartLoadingWidget();
        } else if (state is AddToCartLoadedState) {
          return const CartLodedWidget();
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
    ref.read(addToCartStateProvider.notifier).addToCart();
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

class CartLodedWidget extends ConsumerWidget {
  const CartLodedWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.38,
      height: MediaQuery.sizeOf(context).height * 0.055,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const Center(
        child: AutoSizeText(
          'Add to cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          // maxLines: 3,
        ),
      ),
    );
  }
}
