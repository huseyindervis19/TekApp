import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';
import 'package:tek_app/constance.dart';
import 'package:tek_app/core/view_model/checkout_viewmodel.dart';
import 'package:tek_app/view/ckeckout/summary_widget.dart';
import 'package:tek_app/view/widgets/custom_button.dart';

import '../../helper/enum.dart';
import 'add_address_widget.dart';
import 'delevery_time_widget.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 100,
              // child: StatusChange.tileBuilder(
              //   theme: StatusChangeThemeData(
              //     direction: Axis.horizontal,
              //     connectorTheme:
              //         ConnectorThemeData(space: 1.0, thickness: 1.0),
              //   ),
              //   builder: StatusChangeTileBuilder.connected(
              //     itemWidth: (_) =>
              //         MediaQuery.of(context).size.width / _processes.length,
              //     nameWidgetBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.only(top: 15.0),
              //         child: Text(
              //           _processes[index],
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             color: controller.getColor(index),
              //           ),
              //         ),
              //       );
              //     },
              //     indicatorWidgetBuilder: (_, index) {
              //       if (index <= controller.index) {
              //         return DotIndicator(
              //           size: 35.0,
              //           border: Border.all(color: Colors.green, width: 1),
              //           child: Padding(
              //             padding: const EdgeInsets.all(6.0),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 shape: BoxShape.circle,
              //                 color: Colors.green,
              //               ),
              //             ),
              //           ),
              //         );
              //       } else {
              //         return OutlinedDotIndicator(
              //           size: 30,
              //           borderWidth: 1.0,
              //           color: todoColor,
              //         );
              //       }
              //     },
              //     lineWidgetBuilder: (index) {
              //       if (index > 0) {
              //         if (index == controller.index) {
              //           final prevColor = controller.getColor(index - 1);
              //           final color = controller.getColor(index);
              //           var gradientColors;
              //           gradientColors = [
              //             prevColor,
              //             Color.lerp(prevColor, color, 0.5)
              //           ];
              //           return DecoratedLineConnector(
              //             decoration: BoxDecoration(
              //               gradient: LinearGradient(
              //                 colors: gradientColors,
              //               ),
              //             ),
              //           );
              //         } else {
              //           return SolidLineConnector(
              //             color: controller.getColor(index),
              //           );
              //         }
              //       } else {
              //         return null;
              //       }
              //     },
              //     itemCount: _processes.length,
              //   ),
              // ),
            ),
            controller.pages == Pages.DeliveryTime
                ? DeliveryTime()
                : controller.pages == Pages.AddAddress
                    ? AddAddress()
                    : Summary(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                controller.index == 0
                    ? Container()
                    : Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: 200,
                          child: CustomButton(
                            color: Colors.white,
                            textColor: kMainColor,
                            text: 'BACK',
                            onPressed: () {
                              controller.changeIndex(controller.index - 1);
                            },
                          ),
                        ),
                      ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: 200,
                    child: CustomButton(
                      text: 'NEXT',
                      onPressed: () {
                        controller.changeIndex(controller.index + 1);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];
