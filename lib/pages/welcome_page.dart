import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel/misc/colors.dart';
import 'package:flutter_travel/widgets/app_large_text.dart';
import 'package:flutter_travel/widgets/app_text.dart';
import 'package:flutter_travel/widgets/responsive_button.dart';

import '../cubit/app_cubits.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("img/" + images[index]))),
              child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(text: "Trips"),
                            AppText(
                              text: "Mountain",
                              size: 30,
                            ),
                            Container(
                              width: 250,
                              child: AppText(
                                text: "Lorem Ipsum dolor sit",
                                color: AppColors.textColor2,
                                size: 14,
                              ),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context).getData();
                              },
                              child: Container(
                                  width: 200,
                                  child: ResponsiveButton(
                                    width: 120,
                                  )),
                            ),
                          ],
                        ),
                        Column(
                            children: List.generate(3, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.3)),
                          );
                        }))
                      ]),
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20)),
            );
          }),
    );
  }
}
