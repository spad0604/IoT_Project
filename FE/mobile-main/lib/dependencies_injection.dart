import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/core/websocket/websocket_manager.dart';
import 'package:flutter_auth_app/features/auth/domain/usecases/controller_device.dart';
import 'package:flutter_auth_app/features/auth/domain/usecases/get_device.dart';
import 'package:flutter_auth_app/features/auth/domain/usecases/register_device_uc.dart';
import 'package:flutter_auth_app/features/auth/pages/otp/cubit/otp_cubit.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/features/users/pages/device_control/cubit/device_control_cubit.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({
  bool isUnitTest = false,
  bool isHiveEnable = true,
  String prefixBox = '',
}) async {
  /// For unit testing only
  if (isUnitTest) await sl.reset();

  if (isHiveEnable) {
    await _initHiveBoxes(isUnitTest: isUnitTest, prefixBox: prefixBox);
  }
  sl.registerSingleton<DioClient>(DioClient(isUnitTest: isUnitTest));
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
}

Future<void> _initHiveBoxes({
  bool isUnitTest = false,
  String prefixBox = '',
}) async {
  await MainBoxMixin.initHive(prefixBox);
  sl.registerSingleton<MainBoxMixin>(MainBoxMixin());
}

/// Register repositories
void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(sl()));
}

/// Register dataSources
void _dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<UsersRemoteDatasource>(
    () => UsersRemoteDatasourceImpl(sl()),
  );
}

void _useCase() {
  /// Auth
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => GetDevice(sl()));
  sl.registerLazySingleton(() => PostLogout(sl()));
  sl.registerLazySingleton(() => RegisterDeviceUC(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));
  sl.registerLazySingleton(() => ControllerDevice(sl()));

  /// Users
  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));
}

void _cubit() {
  /// Auth
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => AuthCubit(sl(), sl()));
  sl.registerFactory(() => DeviceControlCubit(sl(), sl()));
  sl.registerFactory(() => WebSocketConfig());
  sl.registerFactory(() => GeneralTokenCubit());
  sl.registerFactory(() => LogoutCubit(sl()));
  sl.registerFactory(() => OtpCubit());

  /// General
  sl.registerFactory(() => ReloadFormCubit());

  /// Users
  sl.registerFactory(() => UserCubit(sl()));
  sl.registerFactory(() => UsersCubit(sl()));
  sl.registerFactory(() => SettingsCubit());
  sl.registerFactory(() => MainCubit());
}
