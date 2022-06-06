import 'package:equatable/equatable.dart';
import 'package:todo_app/common/enums/status.dart';

import '../../../common/enums/data_source_status.dart';
import '../../../models/task.dart';

class IncompleteState extends Equatable {
  final List<Task>? tasks;
  final RequestStatus status;
  final DataSourceStatus dataStatus;
  final String? message;

  const IncompleteState({
    this.tasks,
    this.status = RequestStatus.initial,
    this.dataStatus = DataSourceStatus.initial,
    this.message,
  });

  IncompleteState copyWith({
    List<Task>? task,
    RequestStatus? status,
    DataSourceStatus? dataStatus,
    String? message,
  }) {
    return IncompleteState(
      tasks: task ?? this.tasks,
      status: status ?? RequestStatus.initial,
      dataStatus: dataStatus ?? this.dataStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    this.tasks,
    this.status,
    this.dataStatus,
    this.message,
  ];
}
