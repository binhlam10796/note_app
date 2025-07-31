import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/users_cubit/users_cubit.dart';
import '../../cubits/users_cubit/users_state.dart';

class UsersSortButton extends StatelessWidget {
  const UsersSortButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        SortType currentSort = SortType.none;
        if (state is UsersLoaded) {
          currentSort = state.sortType;
        }

        return PopupMenuButton<SortType>(
          onSelected: (sortType) {
            context.read<UsersCubit>().sortUsers(sortType);
          },
          icon: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.sort,
              color: currentSort != SortType.none ? Colors.blue : Colors.grey[600],
            ),
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: SortType.none,
              child: Row(
                children: [
                  Icon(
                    Icons.clear,
                    color: currentSort == SortType.none ? Colors.blue : null,
                  ),
                  const SizedBox(width: 8),
                  const Text('Default'),
                ],
              ),
            ),
            PopupMenuItem(
              value: SortType.nameAsc,
              child: Row(
                children: [
                  Icon(
                    Icons.sort_by_alpha,
                    color: currentSort == SortType.nameAsc ? Colors.blue : null,
                  ),
                  const SizedBox(width: 8),
                  const Text('Name A-Z'),
                ],
              ),
            ),
            PopupMenuItem(
              value: SortType.nameDesc,
              child: Row(
                children: [
                  Icon(
                    Icons.sort_by_alpha,
                    color: currentSort == SortType.nameDesc ? Colors.blue : null,
                  ),
                  const SizedBox(width: 8),
                  const Text('Name Z-A'),
                ],
              ),
            ),
            PopupMenuItem(
              value: SortType.idAsc,
              child: Row(
                children: [
                  Icon(
                    Icons.numbers,
                    color: currentSort == SortType.idAsc ? Colors.blue : null,
                  ),
                  const SizedBox(width: 8),
                  const Text('ID Low-High'),
                ],
              ),
            ),
            PopupMenuItem(
              value: SortType.idDesc,
              child: Row(
                children: [
                  Icon(
                    Icons.numbers,
                    color: currentSort == SortType.idDesc ? Colors.blue : null,
                  ),
                  const SizedBox(width: 8),
                  const Text('ID High-Low'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}