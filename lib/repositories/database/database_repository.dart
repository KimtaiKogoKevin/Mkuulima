
import '../../models/UserModel.dart';
import 'database_service.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseService service = DatabaseService();

  @override
  Future<void> saveUserData(UserModel user) {
    return service.addUserData(user);
  }

  @override
  Future<List<UserModel>> retrieveUserData() {
    return service.retrieveUserData();
  }
}

abstract class DatabaseRepository {
  Future<void> saveUserData(UserModel user);
  Future<List<UserModel>> retrieveUserData();
}