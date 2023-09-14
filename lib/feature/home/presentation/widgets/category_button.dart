import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CatogoryButton extends StatelessWidget {
  late int tabPossition;
  bool? isSelected;
  String? title;
  ValueSetter<int>? onTap = (value) {};

  CatogoryButton(
      {Key? key,
      required this.tabPossition,
      this.isSelected,
      this.title,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            onTap != null ? onTap!(tabPossition) : null;
          },
          style: ElevatedButton.styleFrom(
            primary: isSelected ?? true ? Colors.blue : Colors.grey,
          ),
          child: Text(title ?? ''),
        ),
      ),
    );
  }
}
