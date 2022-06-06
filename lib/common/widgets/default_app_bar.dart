import 'package:flutter/material.dart';
import 'package:todo_app/common/utils/extensions/extension.dart';

import '../resources/index.dart';
import 'spacing.dart';

class DefaultAppBar extends StatefulWidget {
  const DefaultAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.leading,
    this.trailing,
    this.onTrailingTapped,
    this.padding,
    this.tabletHorizontalPadding = 30,
  }) : super(key: key);

  final Widget? leading;
  final Widget? trailing;
  final String? title;
  final Widget? titleWidget;
  final Function()? onTrailingTapped;
  final double? padding;
  final double tabletHorizontalPadding;

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    final bool isLandscape = context.isLandscape();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: SizedBox(
          height: 60,
          child: Row(
            children: <Widget>[
              if (!isLandscape) const Spacing(),
              Material(
                color: AppColors.transparent,
                child: widget.leading ??
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => _onClosePressed(context),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.primaryColor,
                      ),
                    ),
              ),
              Expanded(
                child: widget.titleWidget ??
                    Text(widget.title ?? '',
                        textAlign: TextAlign.center, style: TextStyles.blackHeaderBold),
              ),
              Material(
                color: AppColors.transparent,
                child: widget.trailing ??
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => _onTrailingPress(context),
                      child: const Icon(
                        Icons.check,
                        color: AppColors.primaryColor,
                      ),
                    ),
              ),
              if (!isLandscape) const Spacing()
            ],
          ),
        ),
      ),
    );
  }

  void _onClosePressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onTrailingPress(BuildContext context) {
    if (widget.onTrailingTapped != null) {
      widget.onTrailingTapped!();
      return;
    }
    Navigator.pop(context);
  }
}
