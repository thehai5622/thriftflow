import 'package:flutter/material.dart';
import 'package:thriftflow/Global/app_color.dart';

class MyPopupMenu extends StatelessWidget {
  const MyPopupMenu({
    super.key,
    required this.child,
    this.itemMenu = const <PopupMenuItem>[],
  });

  final List<PopupMenuItem> itemMenu;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        final offset = details.globalPosition;
        final Size size = MediaQuery.of(context).size;

        showMenu(
          context: context,
          popUpAnimationStyle: AnimationStyle(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 300),
          ),
          color: AppColor.main,
          position: RelativeRect.fromLTRB(
            offset.dx,
            offset.dy,
            size.width - offset.dx,
            size.height - offset.dy,
          ),
          items: itemMenu,
        );
      },
      child: child,
    );
  }
}
