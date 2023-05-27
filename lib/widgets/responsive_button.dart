import 'package:flutter/material.dart';
import 'package:flutter_travel/misc/colors.dart';
import 'package:flutter_travel/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key, this.width, this.isResponsive});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              width! > 120
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppText(
                        text: "Book Trip Now",
                        color: Colors.white,
                      ),
                    )
                  : Image.asset("img/button-one.png")
            ]),
      ),
    );
  }
}
