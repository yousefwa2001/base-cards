import 'package:bloc/bloc.dart';

import '../../../../../core/storage/secure_storage_api.dart';

class UserNameCubit extends Cubit<String> {
  UserNameCubit({required this.storage}) : super('');
  final SecureStorageApi storage;

  Future<void> load() async {
    emit(await storage.getUserName() ?? '');
  }
}
