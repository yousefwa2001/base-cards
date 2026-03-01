import '../repositories/auth_repository.dart';
import '../value_objects/auth_status.dart';

class WatchAuthStatusUseCase {
  final AuthRepository repository;
  WatchAuthStatusUseCase({required this.repository});

  Stream<AuthStatus> call() => repository.watchAuthStatus();
}
