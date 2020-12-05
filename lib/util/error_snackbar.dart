import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Function get err => () => Get.snackbar('Error Title', 'Failed: Change Theme');

void showErrorSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Theme.of(Get.context).errorColor,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
  );
}
