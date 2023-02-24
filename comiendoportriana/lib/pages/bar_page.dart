import 'package:comiendoportriana/blocs/bar/bar.dart';
import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/pages/bar_list.dart';
import 'package:comiendoportriana/repositories/bar_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          final barRepository = getIt<BarRepository>();
          return BarBloc(barRepository)..add(BarFetched());
        },
        child: BarsList(),
      ),
    );

    /*return Scaffold(
      body: BlocProvider(
        final barRepository = getIt<BarRepository>();
        create: (context)=> BarBloc()..add(BarFetched()),
        child: BarsList(),
      ),
    );*/
  }
}
