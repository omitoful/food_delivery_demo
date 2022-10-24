import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_layout.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(320),
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        }
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      /// if not use stack, the container size will be the same as the super one.
      children: [
        Container(
          height: AppLayout.getHeight(220),
          margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(5)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.getHeight(30)),
              color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img_1.png")
              )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: AppLayout.getHeight(150),
            margin: EdgeInsets.only(left: AppLayout.getWidth(40), right: AppLayout.getWidth(40), bottom: AppLayout.getHeight(15)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(30)),
                color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
