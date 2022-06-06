import 'package:flutter/material.dart';

import '../resources/index.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    Key? key,
    this.text = '',
    this.titleHeight = 18,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  final String text;
  final double? titleHeight;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        splashColor: AppColors.primaryColor.withOpacity(0.3),
        radius: 100,
        child: SizedBox(
          height: 40,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                text,
                style: TextStyles.primaryHeaderBold.copyWith(
                    fontSize: titleHeight,
                    color: isActive ? AppColors.primaryColor : AppColors.gray.withOpacity(0.5)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
