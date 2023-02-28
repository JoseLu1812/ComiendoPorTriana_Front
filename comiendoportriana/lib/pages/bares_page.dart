import 'package:comiendoportriana/blocs/bar/bar.dart';
import 'package:comiendoportriana/blocs/blocs.dart';
import 'package:comiendoportriana/models/bar_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

const String imgBase = "http://localhost:8080/images/";

class BaresPage extends StatelessWidget {
  const BaresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BarBloc()..add(BarFetched()),
      child: const BaresBody(),
    );
  }
}

class BaresBody extends StatefulWidget {
  const BaresBody({super.key});

  @override
  State<BaresBody> createState() => _BaresBodyState();
}

class _BaresBodyState extends State<BaresBody> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarBloc, BarState>(builder: (context, state) {
      switch (state.status) {
        case BarStatus.failure:
          return Center(
            child: Column(
              children: [
                Text('Error de carga', style: TextStyle(fontSize: 20)),
                ElevatedButton(
                  onPressed: () {
                    context.read<BarBloc>().add(BarFetched());
                  },
                  child: Text('Reintentar'),
                ),
              ],
          ));
        case BarStatus.success:
          if (state.bar.isEmpty) {
            return const Center(child: Text('No hay restaurantes'));
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.bar.length
                  ? const BottomLoader()
                  : BarItem(bar: state.bar[index]);
            },
            itemCount:
                state.hasReachedMax ? state.bar.length : state.bar.length + 1,
            controller: _scrollController,
          );
        case BarStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<BarBloc>().add(BarFetched());
  }

  bool get _isBottom {
    if (_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.only(top: 6, bottom: 6),
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    ));
  }
}

class BarItem extends StatelessWidget {
  const BarItem({super.key, required this.bar});

  final BarContent bar;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      child: Container(
        height: 200,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(
                  imgBase + bar.image!,
                  fit: BoxFit.fill,
                ),
                flex: 5
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(bar.name!,
                style: TextStyle(fontWeight: FontWeight.w800),),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
         ),
      ),
    );
  }
}
