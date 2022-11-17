import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_layout.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import '../../Utils/app_constants.dart';
import '../../Utils/colors.dart';
import '../../controllers/cart_controller.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(Get.find<CartController>());
    print("${product.name}'s page id is: $pageId");
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: AppLayout.getHeight(80),
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: const AppIcon(icon: Icons.clear),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
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
                  );
                })
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
                child: Center(child: BigText(text: product.name, size: AppLayout.getHeight(26))),
              ),
            ),
            pinned: true, /// let the header image stuck on the top.
            backgroundColor: AppColors.mainColor,
            expandedHeight: AppLayout.getHeight(300),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!, width: double.maxFinite, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20), vertical: AppLayout.getHeight(10)),
                  child: ExpandableTextWidget(text: product.description)
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(50), vertical: AppLayout.getHeight(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(false);
                    },
                    child: AppIcon(icon: Icons.remove, bgColor: AppColors.mainColor, iconColor: Colors.white, iconSize: AppLayout.getHeight(24)),
                  ),
                  BigText(text: "\$ ${product.price} X ${controller.inCartItems}", color: AppColors.mainBlackColor, size: AppLayout.getHeight(26)),
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(true);
                    },
                    child: AppIcon(icon: Icons.add, bgColor: AppColors.mainColor, iconColor: Colors.white, iconSize: AppLayout.getHeight(24)),
                  )
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
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppLayout.getHeight(20)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                          color: AppColors.mainColor
                      ),
                      child: BigText(text: "\$ ${product.price * controller.quantity} | Add to cart", color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
