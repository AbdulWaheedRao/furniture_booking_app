import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Disks/DiskStateNotifierProvider.dart';
import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Disks/DisksState.dart';
import 'package:flutter_office_furniture_store_app/Model/Chair.dart';
import 'package:flutter_office_furniture_store_app/View/detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchDisksList extends ConsumerStatefulWidget {
  const FetchDisksList({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FetchDiskListState();
}

class _FetchDiskListState extends ConsumerState<FetchDisksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(diskProvider);
        if (state is DisksLoadingState) {
          return const DisksLoadingWidget();
        } else if (state is DisksLoadedState) {
          return DisksLodidWidget(list: state.list);
        } else {
          return DisksErrorWidget(
              errorMessage: (state as DisksErrorWidget).errorMessage);
        }
      },
    );
  }
}

class DisksLoadingWidget extends ConsumerWidget {
  const DisksLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(diskProvider.notifier).fetchDisk();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

// ignore: must_be_immutable
class DisksLodidWidget extends StatefulWidget {
  DisksLodidWidget({super.key, required this.list});
  List<Chair> list;

  @override
  State<DisksLodidWidget> createState() => _DisksLodidWidgetState();
}

class _DisksLodidWidgetState extends State<DisksLodidWidget> {
  int index = 0;
  Color focusedColor = Colors.lightGreenAccent;
  Color unfocusedColor = Colors.grey;
  late Color color1, color2, color3, color4, color5, color6, color7;
  @override
  void initState() {
    super.initState();
    color1 = focusedColor;
    color2 = unfocusedColor;
    color3 = unfocusedColor;
    color4 = unfocusedColor;
    color5 = unfocusedColor;
    color6 = unfocusedColor;
    color7 = unfocusedColor;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              width: width * 0.95,
              height: height * 0.175,
              child: CarouselSlider.builder(
                itemCount: widget.list.length,
                itemBuilder: (context, index, realIndex) {
                  return InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, DetailPage.pageName,
                          arguments: Chair(
                            price: double.parse(
                                widget.list[index].price.toString()),
                            image: widget.list[index].image.toString(),
                            discription:
                                widget.list[index].discription.toString(),
                            title: widget.list[index].title.toString(),
                            id: widget.list[index].id.toString(),
                          ));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => DetailPage(
                      //           price: double.parse(
                      //               widget.list[index].price.toString()),
                      //           image: widget.list[index].image.toString(),
                      //           discription:
                      //               widget.list[index].discription.toString(),
                      //           title: widget.list[index].title.toString(),
                      //           id: widget.list[index].id.toString(),
                      //         )));
                    }),
                    child: Hero(
                      tag: widget.list[index].id.toString(),
                      child: Container(
                        width: width * 0.95,
                        height: height * 0.175,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.list[index].image.toString()),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        this.index = index;
                        color1 = unfocusedColor;
                        color2 = unfocusedColor;
                        color3 = unfocusedColor;
                        color4 = unfocusedColor;
                        color5 = unfocusedColor;
                        color6 = unfocusedColor;
                        color7 = unfocusedColor;
                        if (index == 0) {
                          color1 = focusedColor;
                        } else if (index == 1) {
                          color2 = focusedColor;
                        } else if (index == 2) {
                          color3 = focusedColor;
                        } else if (index == 3) {
                          color4 = focusedColor;
                        } else if (index == 4) {
                          color5 = focusedColor;
                        } else if (index == 5) {
                          color6 = focusedColor;
                        } else {
                          color7 = focusedColor;
                        }
                      });
                    },
                    enlargeCenterPage: true,
                    height: 200,
                    reverse: false,
                    enableInfiniteScroll: true),
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: index == 0 ? width * 0.06 : width * 0.045,
                  height: index == 0 ? height * 0.017 : height * 0.01,
                  decoration:
                      BoxDecoration(color: color1, shape: BoxShape.circle),
                ),
                Container(
                  width: index == 1 ? width * 0.06 : width * 0.045,
                  height: index == 1 ? height * 0.017 : height * 0.01,
                  decoration:
                      BoxDecoration(color: color2, shape: BoxShape.circle),
                ),
                Container(
                  width: index == 2 ? width * 0.06 : width * 0.045,
                  height: index == 2 ? height * 0.017 : height * 0.01,
                  decoration:
                      BoxDecoration(color: color3, shape: BoxShape.circle),
                ),
                Container(
                  width: index == 3 ? width * 0.06 : width * 0.045,
                  height: index == 3 ? height * 0.017 : height * 0.01,
                  decoration:
                      BoxDecoration(color: color4, shape: BoxShape.circle),
                ),
                Container(
                  width: index == 4 ? width * 0.06 : width * 0.045,
                  height: index == 4 ? height * 0.017 : height * 0.01,
                  decoration:
                      BoxDecoration(color: color5, shape: BoxShape.circle),
                ),
                Container(
                  width: index == 5 ? width * 0.06 : width * 0.045,
                  height: index == 5 ? height * 0.017 : height * 0.01,
                  decoration:
                      BoxDecoration(color: color6, shape: BoxShape.circle),
                ),
                Container(
                  width: index == 6 ? width * 0.06 : width * 0.045,
                  height: index == 6 ? height * 0.017 : height * 0.01,
                  decoration:
                      BoxDecoration(color: color7, shape: BoxShape.circle),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class DisksErrorWidget extends StatelessWidget {
  const DisksErrorWidget({required this.errorMessage, super.key});
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
