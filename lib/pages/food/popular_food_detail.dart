import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_layout.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// background image
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
          /// icon widgets
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
          /// introduction of food
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
                  BigText(text: "Introduce"),
                  SizedBox(height: AppLayout.getHeight(10)),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text: "This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment."
                      ),
                    ),
                  ),
                  SizedBox(height: AppLayout.getHeight(10)),
                ],
              ),
            ),
          ),
        ]
      ),
      bottomNavigationBar: Container(
        height: AppLayout.getHeight(120),
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20), vertical: AppLayout.getHeight(30)),
        decoration: BoxDecoration(
          color: AppColors.btnBgColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(40)), topRight: Radius.circular(AppLayout.getHeight(40))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(AppLayout.getHeight(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                color: Colors.white
              ),
              child: Row(
                children: [
                  const Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(height: AppLayout.getWidth(10)),
                  BigText(text: "0"),
                  SizedBox(height: AppLayout.getWidth(10)),
                  const Icon(Icons.add,  color: AppColors.signColor)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(AppLayout.getHeight(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                color: AppColors.mainColor
              ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
