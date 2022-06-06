import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/common/utils/extensions/extension.dart';

import '../../../common/resources/index.dart';
import '../../../common/widgets/bottom_bar_item.dart';
import '../../../common/widgets/layout/row_flex.dart';
import '../../../common/widgets/spacing.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({
    Key? key,
    required this.onSelected,
    this.currentIndex = 0,
    this.titleHeight,
    this.onMenuTapped,
  }) : super(key: key);

  final int currentIndex;
  final double? titleHeight;
  final Function(int index) onSelected;
  final Function()? onMenuTapped;

  @override
  _MainBottomBarState createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  int _currentIndex = 0;

  final List<String> _titles = <String>[
    'Todo',
    'Completed',
    'In completed',
  ];

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = max(MediaQuery.of(context).padding.bottom, 18.0);
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
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: RowFlex(
          children: _titles.map(
                (String text) {
              final int index = _titles.indexOf(text);
              return BottomBarItem(
                onTap: () => _onTapItem(index),
                text: text,
                isActive: index == _currentIndex,
                titleHeight: widget.titleHeight,
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  void _onTapItem(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onSelected(index);
  }
}
