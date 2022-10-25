import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_layout.dart';
import 'package:food_delivery/widgets/app_column.dart';
import '../../Utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: AppLayout.getHeight(350),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img_1.png")
                )
              ),
            ),
          ),
          Positioned(
            top: AppLayout.getHeight(45),
            left: AppLayout.getWidth(20),
            right: AppLayout.getWidth(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: AppLayout.getHeight(350) - 20,
            child: Container(
              padding: EdgeInsets.only(left: AppLayout.getWidth(20), right: AppLayout.getWidth(20), top: AppLayout.getHeight(20)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppLayout.getHeight(20)),
                  topLeft: Radius.circular(AppLayout.getHeight(20))
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: "Chinese Side"),
                  SizedBox(height: AppLayout.getHeight(20)),
                  BigText(text: "Introduce")
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}
