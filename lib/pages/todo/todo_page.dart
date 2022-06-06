import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/common/resources/index.dart';
import 'package:todo_app/common/widgets/content_bundle.dart';
import 'package:todo_app/common/widgets/default_app_bar.dart';
import 'package:todo_app/common/widgets/spacing.dart';
import 'package:todo_app/pages/todo/bloc/todo_state.dart';

import '../../common/enums/status.dart';
import '../../common/widgets/dialogs/loading_dialog.dart';
import '../../common/widgets/toast/toast.dart';
import '../../models/task.dart';
import '../../routes/app_routes.dart';
import '../widgets/task_list_widget.dart';
import 'bloc/todo_cubit.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: _handleStateListener,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  const Spacing(),
                  DefaultAppBar(
                    title: 'Todo List',
                    leading: const SizedBox(width: 20),
                    trailing: InkWell(
                      child: AssetImages.iconAdd.toSvg(),
                      onTap: () => _onAddTapped(context),
                    ),
                  ),
                  const Spacing(),
                  Expanded(
                    child: ContentBundle(
                      onRefresh: (_) => context.read<TodoCubit>().onRefresh(),
                      status: state.dataStatus,
                      child: TaskListWidget(
                        tasks: state.tasks,
                        onItemTapped: (task) => _onItemTapped(context, task),
                        onChecked: (task, val) => _onCheck(context, task, val),
                        onEditTapped: (task) => _onEditTapped(context, task),
                        onDeleteTapped: (task) => _onDeleteTapped(context, task),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleStateListener(context, state) {
    switch (state.status) {
      case RequestStatus.initial:
        break;
      case RequestStatus.requesting:
        IgnoreLoadingIndicator().show(context);
        break;
      case RequestStatus.success:
        IgnoreLoadingIndicator().hide(context);
        break;
      case RequestStatus.failed:
        IgnoreLoadingIndicator().hide(context);
        showFailureMessage(context, state.message ?? '');
        break;
    }
  }

  void _onCheck(BuildContext context, Task? task, bool value) {
    context.read<TodoCubit>().updateTaskStatus(task, value);
  }

  void _onAddTapped(BuildContext context) {
    Navigator.pushNamed(context, RouterName.createTask);
  }

  void _onItemTapped(BuildContext context, Task? task) {
    Navigator.pushNamed(context, RouterName.taskDetail, arguments: task);
  }

  void _onEditTapped(BuildContext context, Task? task) {
    Navigator.pushNamed(context, RouterName.editTask, arguments: task);
  }

  void _onDeleteTapped(BuildContext context, Task? task) {
    context.read<TodoCubit>().deleteTask(task);
  }
}
