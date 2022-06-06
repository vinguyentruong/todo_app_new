import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/common/api_client/data_state.dart';
import 'package:todo_app/common/enums/status.dart';
import 'package:todo_app/common/event/event_bus_mixin.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/pages/helper/event_bus/task_events.dart';
import 'package:todo_app/repositories/task_repository.dart';
import 'package:uuid/uuid.dart';

import 'create_task_event.dart';
import 'create_task_state.dart';

@Injectable()
class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> with EventBusMixin {
  CreateTaskBloc(this._taskRepository) : super(CreateTaskState());

  final TaskRepository _taskRepository;

  @override
  Stream<CreateTaskState> mapEventToState(CreateTaskEvent event) async* {
    if (event is CreateTaskChangeInitEvent) {
      yield state.copyWith(
        task: event.value,
        name: event.value?.name,
        desc: event.value?.desc,
      );
    } else if (event is CreateTaskChangeNameEvent) {
      yield state.copyWith(name: event.value);
    } else if (event is CreateTaskChangeDescEvent) {
      yield state.copyWith(desc: event.value);
    } else if (event is CreateTaskChangeUpdateEvent) {
      yield* _updateTask();
    } else if (event is CreateTaskChangeCreateEvent) {
      yield* _createTask();
    }
  }

  Stream<CreateTaskState> _updateTask() async* {
    yield state.copyWith(status: RequestStatus.requesting);
    final task = Task(
      id: state.task?.id,
      name: state.name,
      desc: state.desc,
      createAt: state.task?.createAt,
      expiredAt: state.task?.expiredAt,
      status: state.task?.status,
    );
    try {
      final result = await _taskRepository.updateTask(task);
      if (result is DataSuccess) {
        yield state.copyWith(status: RequestStatus.success);
        shareEvent(OnUpdateTaskEvent(task));
      } else {
        yield state.copyWith(status: RequestStatus.failed, message: result.message);
      }
    } catch (e) {
      yield state.copyWith(status: RequestStatus.failed, message: e.toString());
    }
  }

  Stream<CreateTaskState> _createTask() async* {
    yield state.copyWith(status: RequestStatus.requesting);
    final task = Task(
      id: Uuid().v1(),
      name: state.name,
      desc: state.desc,
      createAt: DateTime.now(),
      status: TaskStatus.incomplete,
    );
    try {
      final result = await _taskRepository.createTask(task);
      if (result is DataSuccess) {
        yield state.copyWith(status: RequestStatus.success);
        shareEvent(OnCreateTaskEvent(task));
      } else {
        yield state.copyWith(status: RequestStatus.failed);
      }
    } catch (e) {
      yield state.copyWith(status: RequestStatus.failed, message: e.toString());
    }
  }
}
