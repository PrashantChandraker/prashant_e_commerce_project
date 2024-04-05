import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.currencySign = '₹',
    required this.price,
    this.maxlines = 1,
    this.islarge = false,
    this.linethrough = false,
  });

  final String currencySign, price;
  final int maxlines;
  final bool islarge;
  final bool linethrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: islarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: linethrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: linethrough ? TextDecoration.lineThrough : null),
    );
  }
}
