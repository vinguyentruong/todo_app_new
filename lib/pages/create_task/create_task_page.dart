import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/common/utils/extensions/extension.dart';
import 'package:todo_app/common/widgets/default_app_bar.dart';
import 'package:todo_app/common/widgets/spacing.dart';
import 'package:todo_app/common/widgets/toast/toast.dart';
import 'package:todo_app/pages/create_task/bloc/create_task_event.dart';

import '../../common/enums/status.dart';
import '../../common/widgets/dialogs/loading_dialog.dart';
import '../../di/injection.dart';
import '../../models/task.dart';
import 'bloc/create_task_bloc.dart';
import 'bloc/create_task_state.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  bool _isCreate = true;
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Task? task = context.getRouteArguments();
    _isCreate = task == null;
    return BlocProvider<CreateTaskBloc>(
      create: (_) => getIt<CreateTaskBloc>()..add(CreateTaskChangeInitEvent()..withValue(task)),
      child: BlocConsumer<CreateTaskBloc, CreateTaskState>(
        listener: _handleStateListener,
        builder: (context, state) => Form(
          key: _formKey,
          child: Scaffold(
            body: Column(
              children: <Widget>[
                DefaultAppBar(
                  title: _isCreate ? 'Create Task' : 'Edit Task',
                  onTrailingTapped: () => _onSaveTapped(context),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name'),
                      const TitleSpacing(),
                      TextFormField(
                        key: Key('TaskName'),
                        initialValue: task?.name,
                        onChanged: (text) => context
                            .read<CreateTaskBloc>()
                            .add(CreateTaskChangeNameEvent()..withValue(text)),
                        validator: (text) {
                          if ((text ?? '').isEmpty) {
                            return 'Name is required';
                          }
                        },
                      ),
                      const Spacing(),
                      Text('Description'),
                      const TitleSpacing(),
                      TextFormField(
                        key: Key('TaskDesc'),
                        initialValue: task?.desc,
                        onChanged: (text) => context
                            .read<CreateTaskBloc>()
                            .add(CreateTaskChangeDescEvent()..withValue(text)),
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleStateListener(BuildContext context, state) {
    switch (state.status) {
      case RequestStatus.initial:
        break;
      case RequestStatus.requesting:
        IgnoreLoadingIndicator().show(context);
        break;
      case RequestStatus.success:
        IgnoreLoadingIndicator().hide(context);
        Navigator.pop(context);
        break;
      case RequestStatus.failed:
        IgnoreLoadingIndicator().hide(context);
        showFailureMessage(context, state.message ?? '');
        break;
    }
  }

  void _onSaveTapped(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context
          .read<CreateTaskBloc>()
          .add(_isCreate ? CreateTaskChangeCreateEvent() : CreateTaskChangeUpdateEvent());
    }
  }
}
