import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrix_example/module/metric_view/controller/metric_controller.dart';
import 'package:metrix_example/module/metric_view/widget/expanded_center.dart';

class MetricView extends StatelessWidget {
  final controller = Get.put(MetricController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MetricController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Metric View"),
            actions: [
              FlatButton(
                color: Colors.orange,
                onPressed: () => controller.loadItems(),
                child: Text("Refresh"),
              ),
            ],
          ),
          body: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: List.generate(controller.items.length, (rowIndex) {
                  var item = controller.items[rowIndex];

                  return Container(
                    child: Row(
                      children:
                          List.generate(item["values"].length, (colIndex) {
                        var columnItem = item["values"][colIndex];
                        var green = columnItem["green"];
                        var yellow = columnItem["yellow"];
                        var red = columnItem["red"];

                        var colHeaderLabel =
                            controller.getLabelByIndex(colIndex);

                        return Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            child: Container(
                              child: Column(
                                children: [
                                  if (rowIndex == 0) Text("$colHeaderLabel"),
                                  Row(
                                    children: [
                                      if (colIndex == 0)
                                        Text(
                                          "${rowIndex + 1}",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      Expanded(
                                        child: Container(
                                          color: columnItem["color"],
                                          child: Column(
                                            children: [
                                              Text(
                                                "$colHeaderLabel${rowIndex + 1}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ExpandedCenter(
                                                    text: "$green",
                                                  ),
                                                  ExpandedCenter(
                                                    text: "$yellow",
                                                  ),
                                                  ExpandedCenter(
                                                    text: "$red",
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ExpandedCenter(
                                                    text: "G",
                                                    fontSize: 12.0,
                                                  ),
                                                  ExpandedCenter(
                                                    text: "Y",
                                                    fontSize: 12.0,
                                                  ),
                                                  ExpandedCenter(
                                                    text: "R",
                                                    fontSize: 12.0,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
