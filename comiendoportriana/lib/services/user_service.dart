import 'package:comiendoportriana/models/user.dart';
import 'package:comiendoportriana/models/user_register.dart';
import 'package:comiendoportriana/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@Order(6)
@singleton
class UserService {
  late UserRepository _userRepository;

  UserService() {
    _userRepository = GetIt.I.get<UserRepository>();
  }

  Future<dynamic> me() async {
    return _userRepository.me();
  }

  Future<User> createUser(
    UserRegister request,
  ) async {
    return _userRepository.createUser(request);
  }
}
