import 'package:collection/collection.dart';

class Task {
  String? id;
  String? name;
  String? desc;
  DateTime? createAt;
  DateTime? expiredAt;
  TaskStatus? status;

  Task({
    this.id,
    this.name,
    this.desc,
    this.createAt,
    this.expiredAt,
    this.status,
  });
}

enum TaskStatus {
  complete, incomplete
}

extension TaskStatusX on TaskStatus {
  String get name {
    switch (this) {
      case TaskStatus.complete:
        return 'Completed';
      case TaskStatus.incomplete:
        return 'Incomplete';
    }
  }

  String get rawValue {
    switch (this) {
      case TaskStatus.complete:
        return 'complete';
      case TaskStatus.incomplete:
        return 'incomplete';
    }
  }

  static TaskStatus? initFrom(String? value) {
    return TaskStatus.values
        .firstWhereOrNull((TaskStatus e) => e.rawValue.toLowerCase() == value?.toLowerCase());
  }
}
