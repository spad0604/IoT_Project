// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_base/app/cubit/app_cubit.dart' as _i662;
import 'package:flutter_base/src/config/navigation/app_router.dart' as _i680;
import 'package:flutter_base/src/data/local/shared_preferences_manager.dart'
    as _i572;
import 'package:flutter_base/src/presentation/language/bloc/language_bloc.dart'
    as _i612;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i662.AppCubit>(() => _i662.AppCubit());
    gh.singleton<_i680.AppRouter>(() => _i680.AppRouter());
    gh.singleton<_i572.SharedPreferencesManager>(
        () => _i572.SharedPreferencesManager());
    gh.singleton<_i612.LanguageCubit>(() => _i612.LanguageCubit());
    return this;
  }
}
