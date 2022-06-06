import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/common/enums/data_source_status.dart';
import 'package:todo_app/common/enums/status.dart';
import 'package:todo_app/common/event/event_bus_mixin.dart';
import 'package:todo_app/pages/helper/event_bus/task_events.dart';
import 'package:todo_app/repositories/task_repository.dart';

import '../../../common/api_client/data_state.dart';
import '../../../models/task.dart';
import 'todo_state.dart';

@Injectable()
class TodoCubit extends Cubit<TodoState> with EventBusMixin {
  TodoCubit(this._taskRepository) : super(const TodoState()) {
    listenEvent<OnCreateTaskEvent>((_) => _fetchTasks());
    listenEvent<OnUpdateTaskEvent>((_) => _fetchTasks());
    listenEvent<OnDeleteTaskEvent>((_) => _fetchTasks());
  }

  TaskRepository _taskRepository;

  Future<void> initData() async {
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    emit(state.copyWith(dataStatus: DataSourceStatus.refreshing));
    try {
      final result = await _taskRepository.getTasks();
      if (result is DataSuccess) {
        emit(state.copyWith(task: result.data, dataStatus: (result.data?.isNotEmpty ?? false) ? DataSourceStatus.success : DataSourceStatus.empty));
      } else {
        emit(state.copyWith(dataStatus: DataSourceStatus.failed));
      }
    } catch (e) {
      emit(state.copyWith(dataStatus: DataSourceStatus.failed));
    }
  }

  Future<void> onRefresh() async {
    _fetchTasks();
  }

  Future<void> deleteTask(Task? task) async {
    if (task?.id == null) {
      return;
    }
    emit(state.copyWith(status: RequestStatus.requesting));
    try {
      final result = await _taskRepository.deleteTask(task!.id!);
      if (result is DataSuccess) {
        final newTasks = state.tasks?..removeWhere((element) => element.id == task.id);
        emit(state.copyWith(
            task: newTasks,
            status: RequestStatus.success,
          dataStatus: (newTasks?.isNotEmpty ?? false) ? DataSourceStatus.success : DataSourceStatus.empty
        ));
      } else {
        emit(state.copyWith(status: RequestStatus.failed, message: result.message,));
      }
    } catch (e) {
      emit(state.copyWith(status: RequestStatus.failed, message: e.toString()));
    }
  }

   Future<void> updateTaskStatus(Task? task, bool value) async {
     if (task?.id == null) {
       return;
     }
     emit(state.copyWith(status: RequestStatus.requesting));
    final newTask = Task(
      id: task?.id,
      name: task?.name,
      desc: task?.desc,
      createAt: task?.createAt,
      expiredAt: task?.expiredAt,
      status: value ? TaskStatus.complete : TaskStatus.incomplete
    );
    try {
      final result = await _taskRepository.updateTask(newTask);
      if (result is DataSuccess) {
        emit(state.copyWith(status: RequestStatus.success, message: result.message));
        _fetchTasks();
        shareEvent(OnUpdateTaskEvent(task));
      } else {
        emit(state.copyWith(status: RequestStatus.failed, message: result.message));
      }
    } catch (e) {
      emit(state.copyWith(status: RequestStatus.failed, message: e.toString()));
    }
  }
}
