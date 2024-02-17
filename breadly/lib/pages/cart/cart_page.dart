import 'package:breadly/base/no_date_page.dart';
import 'package:breadly/base/show_message.dart';
import 'package:breadly/controllers/auth_controller.dart';
import 'package:breadly/controllers/cart_controller.dart';
import 'package:breadly/controllers/order_controller.dart';
import 'package:breadly/controllers/popular_product_controller.dart';
import 'package:breadly/controllers/recommended_product_controller.dart';
import 'package:breadly/controllers/user_controller.dart';
import 'package:breadly/models/place_order_model.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:breadly/utils/app_constants.dart';
import 'package:breadly/utils/dimensions.dart';
import 'package:breadly/widgets/Big_text.dart';
import 'package:breadly/widgets/Small_text.dart';
import 'package:breadly/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      iconSize: Dimensions.icon24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      iconSize: Dimensions.icon24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    iconSize: Dimensions.icon24,
                  ),
                ],
              )),
          GetBuilder<CartController>(builder: (cartController) {
            return cartController.getItems.isNotEmpty
                ? Positioned(
                    top: Dimensions.height20 * 5,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: Container(
                        margin: EdgeInsets.only(top: Dimensions.height15),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(
                              builder: (cartController) {
                            var cartList = cartController.getItems;
                            return ListView.builder(
                                itemCount: cartList.length,
                                itemBuilder: (_, index) {
                                  return SizedBox(
                                    height: Dimensions.height20 * 5,
                                    width: double.maxFinite,
                                    child: Row(children: [
                                      GestureDetector(
                                        onTap: () {
                                          var popularIndex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  cartList[index].product!);
                                          if (popularIndex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getDetailFood(
                                                    popularIndex, "cartpage"));
                                          } else {
                                            var recommeendedIndex = Get.find<
                                                    RecommendedProductController>().recommendedProductList.indexOf(cartList[index].product!);
                                            if (recommeendedIndex < 0) {
                                              Get.snackbar("Historia Zamówień",
                                                  "Produkt nie jest już dostępny");
                                            } else {
                                              Get.toNamed(RouteHelper
                                                  .getRecommendedFood(
                                                      recommeendedIndex,
                                                      "cartpage"));
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: Dimensions.height20 * 5,
                                          height: Dimensions.height20 * 5,
                                          margin: EdgeInsets.only(
                                              bottom: Dimensions.height10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    cartController.getItems[index].img!)),
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      Expanded(
                                          child: SizedBox(
                                        height: Dimensions.height20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text: cartController.getItems[index].name!,
                                              color: Colors.black54,
                                            ),
                                            SmallText(text: "Spicy"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                  text: cartController
                                                      .getItems[index].price
                                                      .toString()+" zł",
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        top:
                                                            Dimensions.height10,
                                                        bottom:
                                                            Dimensions.height10,
                                                        left:
                                                            Dimensions.width10,
                                                        right:
                                                            Dimensions.width10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimensions.radius20),
                                                        color: Colors.white),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(cartList[index].product!,-1);
                                                            },
                                                            child: const Icon(
                                                                Icons.remove,
                                                                color: Colors
                                                                    .black)),
                                                        SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2),
                                                        BigText(
                                                            text: cartList[index].quantity.toString()), //popularProduct.inCartItems.toString()),
                                                        SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2),
                                                        GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  cartList[index].product!,1);
                                                            },
                                                            child: const Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .black)),
                                                      ],
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                    ]),
                                  );
                                });
                          }),
                        )))
                : const NoDataPage(text: "Twój koszyk jest pusty!");
          })
        ]),
        bottomNavigationBar:
            GetBuilder<CartController>(builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(134, 196, 196, 196),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                )),
            child: cartController.getItems.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height15,
                                bottom: Dimensions.height15,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white),
                            child: Row(
                              children: [
                                SizedBox(width: Dimensions.width10),
                                BigText(
                                    text: "${cartController.totalAmount} zł"),
                                SizedBox(width: Dimensions.width10),
                              ],
                            )),
                        GestureDetector(
                          onTap: () {
                            if (Get.find<AuthController>().userLoggedIn()) {
                              print("Zalogowany");
                              print("Przed placeOrders " +cartController.totalAmount.toString());
                              PlaceOrderBody placeOrder = PlaceOrderBody(
                                details: cartController.getItems.map((item) {
                                  return OrderDetail(
                                    productId: item.product!.id!,
                                    quantity: item.quantity!,
                                    totalPrice: item.quantity!.toDouble() * item.product!.price!,
                                  );
                                }).toList(),
                              );
                              Get.find<OrderController>()
                                  .placeOrders(placeOrder);
                              print("Po placeOrders " + placeOrder.toString());
                             cartController.addToHistory();
                            } else {
                              Get.toNamed(RouteHelper.getSingInPage());
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height15,
                                bottom: Dimensions.height15,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Colors.blueAccent,
                            ),
                            child:
                                BigText(text: " Zapłać", color: Colors.white),
                          ),
                        )
                      ])
                : Container(),
          );
        }));
  }
}
