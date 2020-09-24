import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrix_example/module/metric_view/view/metric_view.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      home: MetricView(),
    ),
  );
}
