import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/users_cubit/users_cubit.dart';
import '../services/api_service.dart';
import 'widgets/users_view_body.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(apiService: ApiService())..fetchUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GitHub Users'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const UsersViewBody(),
      ),
    );
  }
}