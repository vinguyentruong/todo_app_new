import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../common/api_client/data_state.dart';
import '../../../common/enums/data_source_status.dart';
import '../../../common/enums/status.dart';
import '../../../common/event/event_bus_mixin.dart';
import '../../../models/task.dart';
import '../../../repositories/task_repository.dart';
import '../../helper/event_bus/task_events.dart';
import 'complete_state.dart';

@Injectable()
class CompleteCubit extends Cubit<CompleteState> with EventBusMixin {
  CompleteCubit(this._taskRepository) : super(const CompleteState()) {
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
        final tasks =
            result.data?.where((element) => element.status == TaskStatus.complete).toList();
        emit(state.copyWith(
            task: tasks,
            dataStatus:
                (tasks?.isNotEmpty ?? false) ? DataSourceStatus.success : DataSourceStatus.empty));
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
            dataStatus: (newTasks?.isNotEmpty ?? false)
                ? DataSourceStatus.success
                : DataSourceStatus.empty));
      } else {
        emit(state.copyWith(
          status: RequestStatus.failed,
          message: result.message,
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: RequestStatus.failed, message: e.toString()));
    }
  }
}
