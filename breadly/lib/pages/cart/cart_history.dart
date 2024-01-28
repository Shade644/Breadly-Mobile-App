import 'dart:convert';
import 'package:breadly/base/no_date_page.dart';
import 'package:breadly/controllers/cart_controller.dart';
import 'package:breadly/models/cart_model.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Big_text.dart';
import 'package:breadly/widgets/Small_text.dart';
import 'package:breadly/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {

    var getCartHistoryList = Get.find<CartController>()
      .getCartHistoryList().reversed.toList();

      Map<String, int> cartItemsPerOrder = {};
  
  for(int i=0;i<getCartHistoryList.length; i++){
 if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
   cartItemsPerOrder.update(getCartHistoryList[i].time!, (value)=>++value);
   }
    else{
      cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,()=>1);
    }
  }
  
  List<int> cartItemsPerOrderToList(){
  return cartItemsPerOrder.entries.map((e)=>e.value).toList();
  }
    List<String> cartOrderTimeToList(){
  return cartItemsPerOrder.entries.map((e)=>e.key).toList();
  }
  
  List<int> itemsPerOrder = cartItemsPerOrderToList();
  print(itemsPerOrder);
  var listCounter=0;

Widget timeWidget(int index) {
  var outputDate = DateTime.now().toString();

  if (index < getCartHistoryList.length) {
    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat("dd-MM-yyyy HH:mm:ss"); 
    outputDate = outputFormat.format(inputDate);
  }

  return BigText(text: outputDate);
}
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height20*5,
            color: Colors.blueAccent,
            width: double.maxFinite,
            padding: EdgeInsets.only(top:Dimensions.height15*3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Historia Zamówień",color: Colors.white,),
                const AppIcon(icon: Icons.shopping_cart_outlined,
                 iconColor: Colors.blueAccent,
                 ),
            ],)
          ),
          GetBuilder<CartController>(builder: (cartController){
            return cartController.getCartHistoryList().isNotEmpty?
              Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top:Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                    for(int i=0; i<itemsPerOrder.length;i++)
                    Container(
                      height: Dimensions.height20*6,
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          timeWidget(listCounter),
                          // BigText(text: getCartHistoryList[listCounter].time!),
                          SizedBox(height: Dimensions.height10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(itemsPerOrder[i], (index){
                                  if(listCounter<getCartHistoryList.length){
                                    listCounter++;
                                  }
                                  return index<=2?
                                    Container(
                                      height: Dimensions.height20*4,
                                      width: Dimensions.height20*4,
                                      margin: EdgeInsets.only(
                                        right: Dimensions.width10/2
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                        image: DecorationImage(
                                          fit:BoxFit.cover,
                                        image: NetworkImage(
                                          getCartHistoryList[listCounter-1].img!
                                        )
                                      ),
                                      ),
                                    ):Container();
                                })
                              ),
                              SizedBox(
                                height: Dimensions.height20*4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SmallText(text: "Zakupiono"),
                                    BigText(text: "${itemsPerOrder[i]} Items"),
                                    GestureDetector(
                                      onTap: (){
                                        var orderTime = cartOrderTimeToList();
                                        Map<int, CartModel> moreOrder ={};
                                        for(int j=0; j<getCartHistoryList.length; j++){
                                          if(getCartHistoryList[j].time == orderTime[i]){
                                            moreOrder.putIfAbsent(getCartHistoryList[j].id!, () => 
                                            CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j]))),
                                            );
                                          }
                                        }
                                        Get.find<CartController>().setItems = moreOrder;
                                        Get.find<CartController>().addToCartList();
                                        Get.toNamed(RouteHelper.getCartPage());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.width10,
                                          vertical: Dimensions.height10/2,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                          border: Border.all(width: 1,color: Colors.blueAccent),
                                        ),
                                        child: SmallText(text: "Zamów Ponownie",color: Colors.blueAccent,)
                                      ),
                                    )
                                ]),
                              )
                            ],)
                        ],
                      ),
                    )        
                    ],
                  ),
                ),
              ),
            ):const NoDataPage(text: "Nic jeszcze nie kupiłeś");
                      })
      ],)
    );
  }
}