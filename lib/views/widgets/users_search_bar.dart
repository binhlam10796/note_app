import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/users_cubit/users_cubit.dart';

class UsersSearchBar extends StatefulWidget {
  const UsersSearchBar({Key? key}) : super(key: key);

  @override
  State<UsersSearchBar> createState() => _UsersSearchBarState();
}

class _UsersSearchBarState extends State<UsersSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {}); // Rebuild to show/hide clear button
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) {
        context.read<UsersCubit>().searchUsers(value);
      },
      decoration: InputDecoration(
        hintText: 'Search users...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  context.read<UsersCubit>().searchUsers('');
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}