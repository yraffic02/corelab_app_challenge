import 'package:flutter/material.dart';
import 'package:corelab_app_challenge/shared/CustomAppbar/custom_appbar.dart';
import 'package:corelab_app_challenge/shared/CustomBottomBar/cusotm_bottom_bar.dart';

class CustomLayout extends StatefulWidget {
  final Widget child;
  final FocusNode? focusNode;
  final TextEditingController? searchController;

  const CustomLayout({
    super.key,
    required this.child,
    this.focusNode,
    this.searchController,
  });

  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        focusNode: widget.focusNode,
        searchController: widget.searchController,
      ),
      body: widget.child,
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
