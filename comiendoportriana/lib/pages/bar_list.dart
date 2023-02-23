import 'package:comiendoportriana/blocs/bar/bar.dart';
import 'package:comiendoportriana/pages/pages.dart';
import 'package:comiendoportriana/widgets/bar_list_item.dart';
import 'package:comiendoportriana/widgets/bottom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarsList extends StatefulWidget {
  const BarsList({super.key});

  @override
  State<BarsList> createState() => _BarsListState();
}

class _BarsListState extends State<BarsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarBloc, BarState>(
      builder: (context, state) {
        switch (state.status) {
          case BarStatus.failure:
            return const Center(child: Text('failed to fetch Bars'));
          case BarStatus.success:
            if (state.bares.isEmpty) {
              return const Center(child: Text('no Bars'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.bares.length
                    ? const BottomLoader()
                    : BarListItem(barContent: state.bares[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.bares.length
                  : state.bares.length + 1,
              controller: _scrollController,
            );
          case BarStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
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
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}