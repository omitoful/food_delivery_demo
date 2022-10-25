import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';
import '../Utils/app_layout.dart';
import '../Utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: AppLayout.getHeight(26)),
        SizedBox(height: AppLayout.getHeight(10)),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) => const Icon(Icons.star, color: AppColors.mainColor, size: 15)),
            ),
            SizedBox(width: AppLayout.getWidth(10)),
            SmallText(text: "4.5"),
            SizedBox(width: AppLayout.getWidth(10)),
            SmallText(text: "1287"),
            SizedBox(width: AppLayout.getWidth(10)),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(height: AppLayout.getHeight(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
