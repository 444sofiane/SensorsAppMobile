import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final Color? backgroundColor;
  final ShapeBorder? shape;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.centerTitle = true,
    this.backgroundColor,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(title, style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      )),
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      shape:  RoundedRectangleBorder( 
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30), top: Radius.circular(30)))
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}