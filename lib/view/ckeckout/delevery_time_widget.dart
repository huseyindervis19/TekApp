import 'package:flutter/material.dart';
import 'package:tek_app/constance.dart';
import 'package:tek_app/helper/enum.dart';
import 'package:tek_app/view/widgets/custom_text.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delevery delevery = Delevery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomText(
            text: 'Delivery',
            fontSize: 15,
            alignment: Alignment.center,
            color: kMainColor,
          ),
          SizedBox(
            height: 20,
          ),
          RadioListTile<Delevery>(
            value: Delevery.StandardDelivery,
            groupValue: delevery,
            onChanged: (value) {
              setState(() {
                delevery = value!;
              });
            },
            title: CustomText(
              text: 'Standart Delevery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\nOrder will be delivered between 3 - 5 business days',
              fontSize: 18,
            ),
            activeColor: kMainColor,
          ),
          SizedBox(
            height: 50,
          ),
          RadioListTile<Delevery>(
            value: Delevery.NextDayDelivery,
            groupValue: delevery,
            onChanged: (value) {
              setState(() {
                delevery = value!;
              });
            },
            title: CustomText(
              text: 'Next Day Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text:
                  '\nPlace your order before 6pm and your items will be delivered the next day',
              fontSize: 18,
            ),
            activeColor: kMainColor,
          ),
          SizedBox(
            height: 50,
          ),
          RadioListTile<Delevery>(
            value: Delevery.NominatedDelivery,
            groupValue: delevery,
            onChanged: (value) {
              setState(() {
                delevery = value!;
              });
            },
            title: CustomText(
              text: 'Nominated Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text:
                  '\nPick a particular date from the calendar and order will be delivered on selected date',
              fontSize: 18,
            ),
            activeColor: kMainColor,
          ),
        ],
      ),
    );
  }
}
