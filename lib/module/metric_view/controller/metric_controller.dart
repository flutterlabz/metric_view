import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MetricController extends GetxController {
  List items = [];
  String headerLabels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  loadItems() {
    var minRow = 4;
    var rowCount = minRow + Random().nextInt(8 - minRow);
    var colCount = 4;

    var newRow = {};
    items.clear();
    for (var rowIndex = 0; rowIndex < rowCount; rowIndex++) {
      newRow = {
        "rowNumber": rowIndex + 1,
        "values": List.generate(colCount, (index) {
          return {
            "green": randomValue,
            "yellow": randomValue,
            "red": randomValue,
            "color": randomColor,
          };
        }),
      };
      items.add(newRow);
    }

    update();
  }

  get randomValue {
    return Random().nextInt(10);
  }

  get randomColor {
    var rand = Random().nextInt(3);
    if (rand == 0) {
      return Colors.green[400];
    } else if (rand == 1) {
      return Colors.orange[400];
    } else if (rand == 2) {
      return Colors.red[400];
    }
  }

  String getLabelByIndex(index) {
    return headerLabels[index];
  }

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }
}
