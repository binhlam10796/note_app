import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/user_model.dart';
import '../../services/api_service.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final ApiService _apiService;
  static const int _usersPerPage = 10;

  UsersCubit({ApiService? apiService})
      : _apiService = apiService ?? ApiService(),
        super(UsersInitial());

  Future<void> fetchUsers() async {
    if (state is UsersLoading) return;

    emit(UsersLoading());

    try {
      final users = await _apiService.getUsers(
        page: 1,
        perPage: _usersPerPage,
      );

      emit(UsersLoaded(
        users: users,
        hasReachedMax: users.length < _usersPerPage,
        currentPage: 1,
      ));
    } catch (e) {
      emit(UsersError(_getErrorMessage(e)));
    }
  }

  Future<void> loadMoreUsers() async {
    final currentState = state;
    if (currentState is! UsersLoaded || 
        currentState.hasReachedMax || 
        currentState is UsersLoadingMore) {
      return;
    }

    emit(UsersLoadingMore(
      users: currentState.users,
      hasReachedMax: currentState.hasReachedMax,
      currentPage: currentState.currentPage,
      searchQuery: currentState.searchQuery,
      sortType: currentState.sortType,
    ));

    try {
      final nextPage = currentState.currentPage + 1;
      final newUsers = await _apiService.getUsers(
        page: nextPage,
        perPage: _usersPerPage,
      );

      final allUsers = List<UserModel>.from(currentState.users)..addAll(newUsers);

      emit(UsersLoaded(
        users: allUsers,
        hasReachedMax: newUsers.length < _usersPerPage,
        currentPage: nextPage,
        searchQuery: currentState.searchQuery,
        sortType: currentState.sortType,
      ));
    } catch (e) {
      emit(UsersLoaded(
        users: currentState.users,
        hasReachedMax: currentState.hasReachedMax,
        currentPage: currentState.currentPage,
        searchQuery: currentState.searchQuery,
        sortType: currentState.sortType,
      ));
      // Could emit a different state for load more error
    }
  }

  void searchUsers(String query) {
    final currentState = state;
    if (currentState is! UsersLoaded) return;

    // Get all users without search filter applied
    List<UserModel> allUsers = currentState.users;
    
    // If we have a search query, we need to fetch fresh data
    // For now, we'll filter the current loaded users
    final filteredUsers = query.isEmpty
        ? allUsers
        : allUsers
            .where((user) =>
                user.login.toLowerCase().contains(query.toLowerCase()) ||
                (user.name?.toLowerCase().contains(query.toLowerCase()) ?? false))
            .toList();

    emit(currentState.copyWith(
      users: _sortUsers(filteredUsers, currentState.sortType),
      searchQuery: query,
    ));
  }

  void sortUsers(SortType sortType) {
    final currentState = state;
    if (currentState is! UsersLoaded) return;

    final sortedUsers = _sortUsers(currentState.users, sortType);

    emit(currentState.copyWith(
      users: sortedUsers,
      sortType: sortType,
    ));
  }

  List<UserModel> _sortUsers(List<UserModel> users, SortType sortType) {
    final usersCopy = List<UserModel>.from(users);

    switch (sortType) {
      case SortType.nameAsc:
        usersCopy.sort((a, b) => a.login.toLowerCase().compareTo(b.login.toLowerCase()));
        break;
      case SortType.nameDesc:
        usersCopy.sort((a, b) => b.login.toLowerCase().compareTo(a.login.toLowerCase()));
        break;
      case SortType.idAsc:
        usersCopy.sort((a, b) => a.id.compareTo(b.id));
        break;
      case SortType.idDesc:
        usersCopy.sort((a, b) => b.id.compareTo(a.id));
        break;
      case SortType.none:
        // Keep original order
        break;
    }

    return usersCopy;
  }

  String _getErrorMessage(dynamic error) {
    if (error is ApiException) {
      return error.message;
    }
    return 'An unexpected error occurred. Please try again.';
  }

  void refresh() {
    fetchUsers();
  }
}