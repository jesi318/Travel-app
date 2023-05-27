import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel/cubit/app_cubit_states.dart';
import 'package:flutter_travel/cubit/app_cubits.dart';
import 'package:flutter_travel/misc/colors.dart';
import 'package:flutter_travel/widgets/app_large_text.dart';
import 'package:flutter_travel/widgets/app_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late TabController _tabController;

  var image = {
    "balloning.png": "Ballooning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.black54,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Discover"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TabBar(
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, radius: 4),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(text: "Places"),
                        Tab(text: "Inspirations"),
                        Tab(text: "Emotions"),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    padding: const EdgeInsets.only(left: 20),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .detailPage(info[index]);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 15, top: 10),
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "http://mark.bslmeiyu.com/uploads/" +
                                                info[index].img),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          },
                        ),
                        Text("Hi 2"),
                        Text("Hi 3"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Explore more",
                          size: 22,
                        ),
                        AppText(
                          text: 'See all',
                          color: AppColors.textColor1,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 30),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("img/" +
                                            image.keys.elementAt(index)))),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 30),
                                child: AppText(
                                  size: 10,
                                  text: image.values.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              )
                            ],
                          );
                        }),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;

  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;

  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
