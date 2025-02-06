import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_token_cubit.freezed.dart';
part 'general_token_state.dart';

class GeneralTokenCubit extends Cubit<GeneralTokenState> {
  GeneralTokenCubit() : super(const GeneralTokenState.loading()) {
    _loadToken();
  }

  void _loadToken() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(const GeneralTokenState.success());
  }
}
