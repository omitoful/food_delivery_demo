import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/app_constants.dart';
import 'package:food_delivery/Utils/app_layout.dart';
import 'package:food_delivery/Utils/colors.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import '../../widgets/icon_and_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = AppLayout.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }
  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded ? Container(
            height: AppLayout.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, popularProducts.popularProductList[position]);
                }
            ),
          ) : const CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        /// dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty ? 1 : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        /// popular title
        SizedBox(height: AppLayout.getHeight(30)),
        Container(
          margin: EdgeInsets.only(left: AppLayout.getWidth(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: AppLayout.getWidth(10)),
              Container(
                margin: EdgeInsets.only(bottom: AppLayout.getHeight(3)),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: AppLayout.getWidth(10)),
              Container(
                margin: EdgeInsets.only(bottom: AppLayout.getHeight(2)),
                child: SmallText(text: "Food Pairing"),
              )
            ],
          ),
        ),
        /// list of food
        SizedBox(height: AppLayout.getHeight(20)),
        MediaQuery.removePadding( /// remove the unexpected top padding
          removeTop: true,
          context: context,
          child: GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
            return recommendedProduct.isLoaded ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recommendedProduct.recommendedProductList.isEmpty ? 1 : recommendedProduct.recommendedProductList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20), vertical: AppLayout.getHeight(5)),
                    child: Row(
                      children: [
                        /// image section
                        Container(
                          width: AppLayout.getHeight(120),
                          height: AppLayout.getHeight(120),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                              color: Colors.white38,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + recommendedProduct.recommendedProductList[index].img!)
                              )
                          ),
                        ),
                        /// text container
                        Expanded(
                          child: Container(
                            height: AppLayout.getHeight(100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(AppLayout.getHeight(20)), bottomRight: Radius.circular(AppLayout.getHeight(20))),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center ,
                                children: [
                                  BigText(text: recommendedProduct.recommendedProductList[index].name),
                                  SizedBox(height: AppLayout.getHeight(10)),
                                  SmallText(text: "With chinese characteristics"),
                                  SizedBox(height: AppLayout.getHeight(10)),
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
            ) :
            const CircularProgressIndicator(
              color: AppColors.mainColor,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProductList) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale = _scaleFactor + (_currentPageValue - index + 1)*(1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        /// if not use stack, the container size will be the same as the super one.
        children: [
          Container(
            height: AppLayout.pageViewContainer,
            margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(25)),
                color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +  AppConstants.UPLOAD_URL + popularProductList.img!)
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: AppLayout.pageTextContainer,
              margin: EdgeInsets.only(left: AppLayout.getWidth(30), right: AppLayout.getWidth(30), bottom: AppLayout.getHeight(30)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    )
                  ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: AppLayout.getHeight(15), left: AppLayout.getWidth(15), right: AppLayout.getWidth(15)),
                child: AppColumn(text: popularProductList.name!),
              ),
            ),
          )
        ],
      ),
    );
  }
}
