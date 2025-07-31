import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/users_cubit/users_cubit.dart';
import '../../cubits/users_cubit/users_state.dart';
import 'user_item.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({Key? key}) : super(key: key);

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<UsersCubit>().loadMoreUsers();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<UsersCubit>().refresh();
            },
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: state.users.length + (state.hasReachedMax ? 0 : 1),
              itemBuilder: (context, index) {
                if (index >= state.users.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final user = state.users[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: UserItem(user: user),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}