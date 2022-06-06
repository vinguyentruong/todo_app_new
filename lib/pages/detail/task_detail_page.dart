import 'package:flutter/material.dart';
import 'package:todo_app/common/resources/app_colors.dart';
import 'package:todo_app/common/resources/index.dart';
import 'package:todo_app/common/widgets/default_app_bar.dart';
import 'package:todo_app/common/utils/extensions/extension.dart';
import 'package:todo_app/common/widgets/spacing.dart';

import '../../models/task.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Task? task  = context.getRouteArguments();
    return Scaffold(
      body: Column(
        children: <Widget>[
          DefaultAppBar(
            title: 'Detail',
            trailing: const SizedBox(width: 20),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name', style: TextStyles.blackHeaderBold,),
                const TitleSpacing(),
                Text(task?.name ?? '', style: TextStyles.blackSubTitleRegular),
                const Spacing(),
                Text('Description', style: TextStyles.blackHeaderBold,),
                const TitleSpacing(),
                Text(task?.desc ?? '', style: TextStyles.blackSubTitleRegular),
                const Spacing(),
                Text('Created At', style: TextStyles.blackHeaderBold,),
                const TitleSpacing(),
                Text(task?.createAt?.toMMDDYYHHMMAString() ?? '', style: TextStyles.blackSubTitleRegular),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
