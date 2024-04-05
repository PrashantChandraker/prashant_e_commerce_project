import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
     this.smallsize = false,
     this.maxLines = 2,
    this.textalign = TextAlign.left,
  });

  final String title;
  final bool smallsize;
  final int maxLines;
  final TextAlign? textalign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallsize ? Theme.of(context).textTheme.labelLarge :  Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textalign,
    );
  }
}
