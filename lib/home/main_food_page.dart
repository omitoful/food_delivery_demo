import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_layout.dart';
import '../Utils/colors.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: AppLayout.getHeight(60), bottom: AppLayout.getHeight(15)),
              padding: EdgeInsets.only(left: AppLayout.getWidth(20), right: AppLayout.getWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Country", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "City", color: Colors.black54),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          // showing the body
          // FoodPageBody(),
        ],
      ),
    );
  }
}
