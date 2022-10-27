import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_layout.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import '../../Utils/colors.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: AppLayout.getHeight(80),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppLayout.getHeight(20)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(20)),
                    topRight: Radius.circular(AppLayout.getHeight(20))
                  )
                ),
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)),
                child: Center(child: BigText(text: "Chinese Side", size: AppLayout.getHeight(26))),
              ),
            ),
            pinned: true, /// let the header image stuck on the top.
            backgroundColor: AppColors.mainColor,
            expandedHeight: AppLayout.getHeight(300),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/img_1.png", width: double.maxFinite, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20), vertical: AppLayout.getHeight(10)),
                  child: const ExpandableTextWidget(text: "This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.\nThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment."),
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(50), vertical: AppLayout.getHeight(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.remove, bgColor: AppColors.mainColor, iconColor: Colors.white, iconSize: AppLayout.getHeight(24)),
                BigText(text: "\$12.88" + " X " +"0", color: AppColors.mainBlackColor, size: AppLayout.getHeight(26)),
                AppIcon(icon: Icons.add, bgColor: AppColors.mainColor, iconColor: Colors.white, iconSize: AppLayout.getHeight(24))
              ],
            ),
          ),
          Container(
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
                  child: const Icon(Icons.favorite, color: AppColors.mainColor),
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
        ],
      ),
    );
  }
}
