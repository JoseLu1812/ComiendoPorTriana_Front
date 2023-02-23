


import 'package:comiendoportriana/blocs/bar/bar.dart';
import 'package:comiendoportriana/pages/bar_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaresPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => BarBloc(/*httpClient: http.Client()*/)..add(BarFetched()),
        child: BarsList(),
      ),
    );
  }
}