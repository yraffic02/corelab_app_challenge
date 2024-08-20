import 'package:corelab_app_challenge/shared/CustomAppbar/custom_appbar.dart';
import 'package:corelab_app_challenge/shared/CustomBottomBar/cusotm_bottom_bar.dart';
import 'package:flutter/material.dart';

class CustomLayout extends StatefulWidget {
  final Widget child;

  const CustomLayout({super.key, required this.child});

  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppbar(),
        body: widget.child,
        bottomNavigationBar: const CustomBottomBar());
  }
}
