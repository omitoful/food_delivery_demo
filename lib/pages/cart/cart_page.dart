import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/Utils/app_layout.dart';
import 'package:food_delivery/Utils/colors.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: AppLayout.getHeight(20) * 3,
            left: AppLayout.getWidth(20),
            right: AppLayout.getWidth(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    bgColor: AppColors.mainColor,
                    iconSize: AppLayout.getHeight(24),
                  ),
                ),
                SizedBox(width: AppLayout.getWidth(20) * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    bgColor: AppColors.mainColor,
                    iconSize: AppLayout.getHeight(24),
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  iconSize: AppLayout.getHeight(24),
                ),
              ],
            ),
          ),
          Positioned(
            top: AppLayout.getHeight(20) * 5,
            left: AppLayout.getWidth(20),
            right: AppLayout.getWidth(20),
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: AppLayout.getHeight(15)),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController){
                  return ListView.builder(
                    itemCount: cartController.getItems.length,
                    itemBuilder: (_, index) {
                      return Container(
                        height: AppLayout.getHeight(20) * 5,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              width: AppLayout.getHeight(20) * 5,
                              height: AppLayout.getHeight(20) * 5,
                              margin: EdgeInsets.only(bottom: AppLayout.getHeight(10)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        AppConstants.BASE_URL + AppConstants.UPLOAD_URL + cartController.getItems[index].img!
                                      )
                                  )
                              ),
                            ),
                            SizedBox(width: AppLayout.getWidth(10)),
                            Expanded(child: Container(
                              height: AppLayout.getHeight(20) * 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                    text: cartController.getItems[index].name!,
                                    color: Colors.black54,
                                  ),
                                  SmallText(text: "Spicy"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: "\$ ${cartController.getItems[index].price}",
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(AppLayout.getHeight(10)),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                                            color: Colors.white
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  // popularProduct.setQuantity(false);
                                                },
                                                child: const Icon(Icons.remove, color: AppColors.signColor)
                                            ),
                                            SizedBox(height: AppLayout.getWidth(10)),
                                            BigText(text: cartController.getItems[index].quantity.toString()), //popularProduct.quantity.toString()),
                                            SizedBox(height: AppLayout.getWidth(10)),
                                            GestureDetector(
                                                onTap: () {
                                                  // popularProduct.setQuantity(true);
                                                },
                                                child: const Icon(Icons.add, color: AppColors.signColor)
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
