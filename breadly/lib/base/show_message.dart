import 'package:breadly/widgets/Big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMessage(String message,{bool isError=true,String title="Error"}){
Get.snackbar(
  title, message,
  titleText: BigText(text: title, color:Colors.black),
  messageText: Text(message, 
  style: const TextStyle(
    color:Colors.black,
  ),
  ),
  colorText: Colors.black,
  snackPosition: SnackPosition.TOP,
  backgroundColor: Colors.transparent,
);
}