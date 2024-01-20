import 'package:breadly/controllers/popular_product_controller.dart';
import 'package:breadly/controllers/recommended_product_controller.dart';
import 'package:breadly/models/product_model.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Big_text.dart';
import 'package:breadly/widgets/Small_text.dart';
import 'package:breadly/widgets/app_column.dart';
import 'package:breadly/widgets/icon_and_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PageBody extends StatefulWidget {
  const PageBody({super.key});

  @override
  State<PageBody> createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  PageController pageController = PageController(
    viewportFraction: 0.85
  );
   var _currPageValue=0.0;
   final double _scaleFactor=0.8;
  final double _height=Dimensions.pageViewContainer;
  
   @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
         _currPageValue=pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded?
          SizedBox(
            // color: Colors.redAccent,
            height: Dimensions.pageView,
              child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position){
                  return _buildPageItem(
                    position,
                    popularProducts.popularProductList[position],
              );},
                ),
          ): const CircularProgressIndicator(
            color: Colors.blueAccent
          );
        }),
GetBuilder<PopularProductController>(builder: (popularProducts){
     return DotsIndicator(
 dotsCount: popularProducts.popularProductList.isEmpty?1 : popularProducts.popularProductList.length, // to do poprawy
  position: _currPageValue.toInt(),
  decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
);
}),
  SizedBox(height: Dimensions.height30,),

  Container(
    margin: EdgeInsets.only(left:Dimensions.height30),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      BigText(text: "Polecane"),
    ],),
  ),
GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
    return recommendedProduct.isLoaded?
    ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    itemCount: recommendedProduct.recommendedProductList.length,
    itemBuilder: (context, index){
      return GestureDetector(
        onTap: (){
          Get.toNamed(RouteHelper.getRecommendedFood(index, "cartpage"));
        },
        child: Container(
          margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,bottom: Dimensions.height10),
          child: Row(
            children: [
            Container(
              width: Dimensions.listViewImgSize,
              height: Dimensions.listViewImgSize ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white38, 
                image: DecorationImage(
                  fit:BoxFit.cover,
                  image: NetworkImage(
                recommendedProduct.recommendedProductList[index].img!
              ),
              ),
            ),
            ),
            Expanded(
              child: Container(
                height: Dimensions.listViewTextContSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(text: recommendedProduct.recommendedProductList[index].name!),
                      SizedBox(height: Dimensions.height10,),
                      SmallText(text: recommendedProduct.recommendedProductList[index].s_description!),
                      SizedBox(height: Dimensions.height10,),
                       const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconText(
                    icon: Icons.circle_sharp, 
                    text: "Normal", 
                    iconColor: Colors.orange
                    ),
                      IconText(
                    icon: Icons.location_on, 
                    text: "1,7 km", 
                    iconColor: Colors.green
                    ),
                      IconText(
                    icon: Icons.access_time_rounded, 
                    text: "32min", 
                    iconColor: Colors.redAccent
                    ),
                ],)
                    ],
                  ),
                ),
              ),
              
            )
          ]
          ),
        ),
      );
    }
  ): const CircularProgressIndicator(
    color: Colors.blueAccent,
  );
  })
      ],
    );
  }
  Widget _buildPageItem(int index, ProductModel popularProduct){
    Matrix4 matrix = Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else if (index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
          var currTrans = _height*(1-currScale)/2;
          matrix = Matrix4.diagonal3Values(1, currScale, 1);
                matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
     else if (index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
          matrix = Matrix4.diagonal3Values(1, currScale, 1);
          matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale=0.8;
                matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
             onTap: () {

                Get.toNamed(RouteHelper.getDetailFood(index, "home"));
              },
            child: Container(
                  height: Dimensions.pageViewContainer,
                  margin:  EdgeInsets.only(left:Dimensions.width10, right: Dimensions.width10,),
                  decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven?const Color(0xFF69c5df):const Color(0xFF9294cc),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                popularProduct.img!,
              ),
              ),
                  ),
                ),
          ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: Dimensions.pageViewTextContainer,
          margin:  EdgeInsets.only(left:Dimensions.height20, right: Dimensions.height20, bottom: Dimensions.height30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFe8e8e8),
                blurRadius: 5.0,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-5, 0)
              ),
               BoxShadow(
                color: Colors.white,
                offset: Offset(5, 0)
              )
            ],
          ),
          child: Container(
            padding:  EdgeInsets.only(top:Dimensions.height10, left:Dimensions.width15, right:Dimensions.width30),
            child: AppColumn(text:popularProduct.name!, stars: popularProduct.stars!,),
          ),
        ),
        
      )
        ],
      ),
    );
  }
}