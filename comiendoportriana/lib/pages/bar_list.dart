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
            return const Center(child: Text('failed to fetch Bar'));
          case BarStatus.success:
            if (state.bar!.isEmpty) {
              return const Center(child: Text('no bar'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.bar!.length
                    ? const BottomLoader()
                    : BarListItem(bar: state.bar!.elementAt(index));
              },
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