import 'package:todo_app/common/utils/change_value_event.dart';

import '../../../models/task.dart';

abstract class CreateTaskEvent {}

class CreateTaskChangeInitEvent extends CreateTaskEvent with ChangeValueEvent<Task> {}

class CreateTaskChangeNameEvent extends CreateTaskEvent with ChangeValueEvent<String> {}

class CreateTaskChangeDescEvent extends CreateTaskEvent with ChangeValueEvent<String> {}

class CreateTaskChangeUpdateEvent extends CreateTaskEvent {}

class CreateTaskChangeCreateEvent extends CreateTaskEvent {}
