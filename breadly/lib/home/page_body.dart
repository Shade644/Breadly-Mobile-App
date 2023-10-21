import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Big_text.dart';
import 'package:breadly/widgets/Small_text.dart';
import 'package:breadly/widgets/icon_and_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';


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
   double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){
              return _buildPageItem(
                position
          );},
            ),
        ),
    DotsIndicator(
  dotsCount: 5,
  position: _currPageValue.toInt(),
  decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
),
      ],
    );
  }
  Widget _buildPageItem(int index){
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
          Container(
        height: Dimensions.pageViewContainer,
        margin:  EdgeInsets.only(left:Dimensions.width10, right: Dimensions.width10,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          color: index.isEven?const Color(0xFF69c5df):const Color(0xFF9294cc),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/bread.png"),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              BigText(text: "Chleb"),
              SizedBox(height:Dimensions.height10,),
              Row(children: [
                Wrap(
                  children: List.generate(5, (index) => const Icon(Icons.star,color:Colors.amberAccent,size: 18,))
                ),
                 SizedBox(width:Dimensions.width10,),
                SmallText(text: "4.5"),
                 SizedBox(width: Dimensions.width10,),
                SmallText(text: "30"),
                SizedBox(width: Dimensions.width1,),
                SmallText(text: "Ocen"),
              ],),
               SizedBox(height: Dimensions.height20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
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
    
            ]),
          ),
        ),
        
      )
        ],
      ),
    );
  }
}