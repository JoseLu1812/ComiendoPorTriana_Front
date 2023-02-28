// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:comiendoportriana/repositories/authentication_repository.dart'
    as _i5;
import 'package:comiendoportriana/repositories/bar_repository.dart' as _i4;
import 'package:comiendoportriana/repositories/user_repository.dart' as _i6;
import 'package:comiendoportriana/rest/rest_client.dart' as _i3;
import 'package:comiendoportriana/services/authentication_service.dart' as _i7;
import 'package:comiendoportriana/services/bar_service.dart' as _i8;
import 'package:comiendoportriana/services/user_service.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.RestAuthenticatedClient>(_i3.RestAuthenticatedClient());
    gh.singleton<_i3.RestClient>(_i3.RestClient());
    gh.singleton<_i4.BarRepository>(_i4.BarRepository());
    gh.singleton<_i5.AuthenticationRepository>(_i5.AuthenticationRepository());
    gh.singleton<_i6.UserRepository>(_i6.UserRepository());
    gh.singleton<_i7.JwtAuthenticationService>(_i7.JwtAuthenticationService());
    gh.singleton<_i8.BarService>(_i8.BarService());
    gh.singleton<_i9.UserService>(_i9.UserService());
    return this;
  }
}
