import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/common/api_client/data_state.dart';
import 'package:todo_app/data/task/request_models/create_task_request.dart';
import 'package:todo_app/data/task/response_models/task_model.dart';
import 'package:todo_app/data/task/task_service.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/repositories/task_repository.dart';

import 'task_service_test.mocks.dart';

@GenerateMocks([TaskService])
void main() {
  group('Testing the TaskService:\n', () {
    test('The task should be create', () async {
      final TaskService service = MockTaskService();
      final TaskRepository repository = TaskRepositoryImpl(userService: service);
      final newTask = Task(name: 'Task Test');
      when(service.createTask(CreateTaskRequest(task: TaskModel.fromModel(newTask))))
          .thenAnswer((_) => Future.value(DataSuccess(TaskModel(name: 'Task test'))));
      final result = await repository.createTask(newTask);
      expect(result.data?.name, 'Task Test');
    });
  });
}

// void main() {
//   group('Testing the TaskService:\n', () {
//     // setUp(() {
//     //   registerServices();
//     // });
//     // tearDown(() {
//     //   unRegisterServices();
//     // });
//     test('The task should be create', () async {
//       final TaskServiceImplMock service = TaskServiceImplMock();
//       // final TaskRepository repository = TaskRepositoryImpl(userService: service);
//       final newTask = Task(name: 'Task Test');
//       when(service.getTasks()).thenAnswer((_) async => DataSuccess(List<MockTaskMode>.generate(3, (index) => MockTaskMode())));
//       // when(service.createTask(CreateTaskRequest(task: TaskModel.fromModel(newTask))))
//       //     .thenAnswer((_) => Future.value(DataSuccess(TaskModel(name: 'Task test'))));
//       // final result = await repository.createTask(newTask);
//       final r2 = await service.getTasks();
//       // expect(result.data?.name, 'Task Test');
//       verify(service.getTasks());
//
//       expect(r2.data?.isSuccess(), false);
//     });
//   });
// }
