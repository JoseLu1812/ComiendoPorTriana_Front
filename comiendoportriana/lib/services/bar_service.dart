import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/models/bar_response.dart';
import 'package:comiendoportriana/repositories/bar_repository.dart';
import 'package:comiendoportriana/services/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@Order(5)
@singleton
class BarService {
  late BarRepository _barRepository;

  BarService() {
    _barRepository = GetIt.I.get<BarRepository>();
  }

  Future<BarList> getListaBares(int page) async {
    return _barRepository.getListaBares(page);
  }

  Future<BarResponse> getBarContent(String barId) async {
    return _barRepository.getBarContent(barId);
  }
}
