import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(endIndent: 30)),
        Text("or".tr(), style: Theme.of(context).textTheme.titleMedium),
        Expanded(child: Divider(indent: 30)),
      ],
    );
  }
}
