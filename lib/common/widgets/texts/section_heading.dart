import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.giventextcolor,
    this.showactionbutton = true,
    required this.title,
    this.buttontitle = 'view all',
    this.onpressed,
  });

  final Color? giventextcolor;
  final bool showactionbutton;
  final String title, buttontitle;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(color: giventextcolor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showactionbutton)
          TextButton(
            onPressed: onpressed,
            child: Text(
              buttontitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: giventextcolor),
            ),
          ),
      ],
    );
  }
}
