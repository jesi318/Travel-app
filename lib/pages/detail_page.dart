import 'package:flutter/material.dart';
import 'package:flutter_travel/misc/colors.dart';
import 'package:flutter_travel/widgets/app_large_text.dart';
import 'package:flutter_travel/widgets/app_text.dart';
import 'package:flutter_travel/widgets/responsive_button.dart';

import '../widgets/app_buttons.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("img/mountain.jpeg"),
                            fit: BoxFit.cover)),
                  )),
              Positioned(
                  child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sort,
                      color: Colors.white,
                    ),

                    // color:
                  ),
                ],
              )),
              Positioned(
                  top: 250,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: "Yosemite",
                              color: Colors.black,
                            ),
                            AppLargeText(
                              text: "\$ 250",
                              color: Colors.black45,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            AppText(
                              text: "USA, California",
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: gottenStars > index
                                      ? AppColors.starColor
                                      : AppColors.textColor1,
                                );
                              }),
                            ),
                            AppText(text: "(4.0)", color: AppColors.textColor2)
                          ],
                        ),
                        SizedBox(height: 25),
                        Column(
                          children: [
                            AppLargeText(
                              text: "People",
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: "Number of people in your group",
                              color: AppColors.mainColor,
                            ),
                            Wrap(
                                children: List.generate(4, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    text: (index + 1).toString(),
                                    size: 50,
                                  ),
                                ),
                              );
                            })),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                            text: "Description",
                            size: 20,
                            color: Colors.black.withOpacity(0.8)),
                        AppText(text: 'Lorem Ipsum dolor sit'),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        color: AppColors.textColor2,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor2,
                        size: 60,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
