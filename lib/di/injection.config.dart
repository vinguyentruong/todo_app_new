// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../configs/build_config.dart' as _i3;
import '../data/task/task_service.dart' as _i5;
import '../pages/complete/bloc/complete_cubit.dart' as _i8;
import '../pages/create_task/bloc/create_task_bloc.dart' as _i9;
import '../pages/incomplete/bloc/incomplete_cubit.dart' as _i10;
import '../pages/main/bloc/main_cubit.dart' as _i4;
import '../pages/todo/bloc/todo_cubit.dart' as _i7;
import '../repositories/task_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.BuildConfig>(() => _i3.BuildConfig());
  gh.factory<_i4.MainCubit>(() => _i4.MainCubit());
  gh.lazySingleton<_i5.TaskService>(() => _i5.TaskServiceImpl());
  gh.lazySingleton<_i6.TaskRepository>(
      () => _i6.TaskRepositoryImpl(userService: get<_i5.TaskService>()));
  gh.factory<_i7.TodoCubit>(() => _i7.TodoCubit(get<_i6.TaskRepository>()));
  gh.factory<_i8.CompleteCubit>(
      () => _i8.CompleteCubit(get<_i6.TaskRepository>()));
  gh.factory<_i9.CreateTaskBloc>(
      () => _i9.CreateTaskBloc(get<_i6.TaskRepository>()));
  gh.factory<_i10.IncompleteCubit>(
      () => _i10.IncompleteCubit(get<_i6.TaskRepository>()));
  return get;
}
