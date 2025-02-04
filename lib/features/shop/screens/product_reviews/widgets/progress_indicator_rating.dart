
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/utils/constants/colors.dart';
import 'package:prashant_e_commerce_project/utils/device/device_utility.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });


final String text;
final double value;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: Text(text,style: Theme.of(context).textTheme.bodyMedium,)),
      
      Expanded(
       flex: 15,
        child: SizedBox(
          width: TDeviceutils.getScreenWidth(context) * 0.5,
          child: LinearProgressIndicator(
            value:value,
            minHeight: 9,
            backgroundColor: TColors.grey,
            valueColor:const AlwaysStoppedAnimation(TColors.primary),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ],);
  }
}