import 'package:flutter/material.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          //subtotal
          Row(
            children: [
              Text('Subtotal  - ', style: Theme.of(context).textTheme.bodyMedium,),
              Text(' ₹ 2500', style: Theme.of(context).textTheme.bodyMedium, )
            ],
          )
        ],
    );
  }
}