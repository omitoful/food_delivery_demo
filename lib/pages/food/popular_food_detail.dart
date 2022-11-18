import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_layout.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import '../../Utils/app_constants.dart';
import '../../Utils/colors.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../cart/cart_page.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(Get.find<CartController>());
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!)
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
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: const AppIcon(icon: Icons.arrow_back_ios)
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => const CartPage());
                    },
                    child: Stack(
                      children: [
                        const AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems >= 1 ?
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AppIcon(
                                icon: Icons.circle,
                                size: AppLayout.getHeight(20),
                                iconColor: Colors.transparent,
                                bgColor: AppColors.mainColor,
                              ),
                              BigText(
                                text: Get.find<PopularProductController>().totalItems.toString(),
                                size: 12,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ) : Container()
                      ],
                    ),
                  );
                })
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
                  AppColumn(text: product.name.toString()),
                  SizedBox(height: AppLayout.getHeight(20)),
                  BigText(text: "Introduce"),
                  SizedBox(height: AppLayout.getHeight(10)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: product.description,
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
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
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
                    GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: const Icon(Icons.remove, color: AppColors.signColor)
                    ),
                    SizedBox(height: AppLayout.getWidth(10)),
                    BigText(text: popularProduct.quantity.toString()),
                    SizedBox(height: AppLayout.getWidth(10)),
                    GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: const Icon(Icons.add, color: AppColors.signColor)
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppLayout.getHeight(20)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                    color: AppColors.mainColor
                ),
                child: GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: BigText(text: "\$ ${product.price * popularProduct.quantity} | Add to cart", color: Colors.white)
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
