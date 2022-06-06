import 'package:injectable/injectable.dart';

import '../common/api_client/data_state.dart';
import '../data/task/request_models/create_task_request.dart';
import '../data/task/request_models/update_task_request.dart';
import '../data/task/response_models/task_model.dart';
import '../data/task/task_service.dart';
import '../models/task.dart';

abstract class TaskRepository {
  Future<DataState<List<Task>>> getTasks();

  Future<DataState<Task>> createTask(Task task);

  Future<DataState<Task>> updateTask(Task task);

  Future<DataState<bool>> deleteTask(String taskId);
}

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl({
    required TaskService userService,
  }) : _taskService = userService;

  final TaskService _taskService;

  @override
  Future<DataState<Task>> createTask(Task task) {
    return _taskService.createTask(CreateTaskRequest(task: TaskModel.fromModel(task)));
  }

  @override
  Future<DataState<bool>> deleteTask(String taskId) {
    return _taskService.deleteTask(taskId);
  }

  @override
  Future<DataState<List<Task>>> getTasks() {
    return _taskService.getTasks();
  }

  @override
  Future<DataState<Task>> updateTask(Task task) {
    return _taskService.updateTask(UpdateTaskRequest(task: TaskModel.fromModel(task)));
  }
}
