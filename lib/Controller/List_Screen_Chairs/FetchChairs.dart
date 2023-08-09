import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Chairs/ChairState.dart';
import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Chairs/ChairStateNotifierProvider.dart';
import 'package:flutter_office_furniture_store_app/Model/Chair.dart';
import 'package:flutter_office_furniture_store_app/View/detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchChairsList extends ConsumerWidget {
  const FetchChairsList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(chairProvider);
        if (state is ChairsLoadingState) {
          return const ChairsLoadingWidget();
        } else if (state is ChairsLoadedState) {
          return ChairsLodidWidget(list: state.list);
        } else {
          return ChairsErrorWidget(
              errorMessage: (state as ChairsErrorWidget).errorMessage);
        }
      },
    );
  }
}

class ChairsLoadingWidget extends ConsumerWidget {
  const ChairsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(chairProvider.notifier).fetchChair();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ChairsLodidWidget extends ConsumerWidget {
  ChairsLodidWidget({super.key, required this.list});
  List<Chair> list;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5 / 2,
            crossAxisSpacing: 4 / 2,
            mainAxisSpacing: 15),
        itemCount: list.length,
        itemBuilder: (BuildContext ctx, index) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, DetailPage.pageName,
                      arguments: Chair(
                          title: list[index].title.toString(),
                          image: list[index].image.toString(),
                          discription: list[index].discription.toString(),
                          price: double.parse(list[index].price.toString()),
                          id: list[index].id.toString()));
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return DetailPage(
                  //         title: list[index].hading.toString(),
                  //         image: list[index].image.toString(),
                  //         discription: list[index].discription.toString(),
                  //         price: double.parse(list[index].price.toString()),
                  //         id: list[index].id.toString());
                  //   },
                  // ));
                },
                child: Hero(
                  tag: list[index].id,
                  child: Container(
                    width: width * 0.45,
                    height: height * 0.18,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(list[index].image.toString()),
                            fit: BoxFit.cover),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: AutoSizeText(
                      list[index].title.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                      // maxLines: 3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(list[index].price.toString()),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.4,
                    child: AutoSizeText(
                      list[index].discription.toString(),
                      // '35 lounge tillt and 4D adjustable armresta',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),

                      maxLines: 3,
                      wrapWords: true,
                    ),
                  )
                ],
              )
            ],
          );
        });
  }
}

class ChairsErrorWidget extends StatelessWidget {
  const ChairsErrorWidget({required this.errorMessage, super.key});
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
