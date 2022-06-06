import 'package:flutter/material.dart';
import 'package:todo_app/common/utils/extensions/extension.dart';

import '../../common/resources/index.dart';
import '../../common/widgets/app_checkbox.dart';
import '../../common/widgets/spacing.dart';
import '../../models/task.dart';
import 'detail_option_widget.dart';

enum TaskDetailOption { edit, delete }

List<DetailOption<TaskDetailOption>> getTaskOptions() {
  return [
    DetailOption<TaskDetailOption>(
      icon: AssetImages.iconEdit.toSvg(),
      key: TaskDetailOption.edit,
      title: 'Edit',
      color: AppColors.black,
    ),
    DetailOption<TaskDetailOption>(
      icon: AssetImages.iconTrash.toSvg(color: AppColors.red500),
      key: TaskDetailOption.delete,
      title: 'Delete',
      color: AppColors.red500,
    ),
  ];
}

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    Key? key,
    required this.tasks,
    this.onItemTapped,
    this.onChecked,
    this.onEditTapped,
    this.onDeleteTapped,
    this.showCheckBox = true,
  }) : super(key: key);

  final List<Task>? tasks;
  final Function(Task? task)? onItemTapped;
  final Function(Task? task, bool value)? onChecked;
  final Function(Task? task)? onEditTapped;
  final Function(Task? task)? onDeleteTapped;
  final bool showCheckBox;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (tasks ?? []).length,
      itemBuilder: (context, index) {
        final task = tasks?[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
          child: InkWell(
            onTap: () => onItemTapped?.call(tasks?[index]),
            borderRadius: BorderRadius.circular(6),
            child: Ink(
              decoration: BoxDecoration(
                color: task?.status == TaskStatus.complete ? AppColors.green300 : AppColors.white,
                borderRadius: BorderRadius.circular(6),
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showCheckBox)
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: AppCheckbox(
                          isSelected: task?.status == TaskStatus.complete,
                          onChanged: (val) => onChecked?.call(task, val),
                        ),
                      ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task?.name ?? '',
                            style: TextStyles.blackHeaderBold,
                          ),
                          const TitleSpacing(),
                          if ((task?.desc ?? '').isNotEmpty)
                            Text(
                              task?.desc ?? '',
                              style: TextStyles.greySubTitleRegular,
                            ),
                          const TitleSpacing(),
                          Text(
                            task?.createAt?.toMMDDYYHHMMAString() ?? '',
                            style: TextStyles.greySubTitleRegular,
                          ),
                          const TitleSpacing(),
                          Row(
                            children: [
                              Text(
                                'Status: ',
                                style: TextStyles.greySubTitleBold,
                              ),
                              Text(
                                (task?.status?.name ?? ''),
                                style: TextStyles.greySubTitleBold.copyWith(
                                    color: task?.status == TaskStatus.complete
                                        ? AppColors.green500
                                        : AppColors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      child: Icon(Icons.more_vert_rounded),
                      onTap: () => _onTaskDetailOptionTapped(context, task),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onTaskDetailOptionTapped(BuildContext context, Task? task) {
    showModalBottomSheet<dynamic>(
      context: context,
      backgroundColor: AppColors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return TaskEditOptionsModal<TaskDetailOption>(
            onPress: (_, option) => _onOptionTapped(option.key, task), options: getTaskOptions());
      },
    );
  }

  void _onOptionTapped(TaskDetailOption option, Task? task) {
    switch (option) {
      case TaskDetailOption.edit:
        onEditTapped?.call(task);
        break;
      case TaskDetailOption.delete:
        onDeleteTapped?.call(task);
        break;
    }
  }
}
