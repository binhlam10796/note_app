import 'package:equatable/equatable.dart';
import '../../models/user_model.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object?> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserModel> users;
  final bool hasReachedMax;
  final int currentPage;
  final String? searchQuery;
  final SortType sortType;

  const UsersLoaded({
    required this.users,
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.searchQuery,
    this.sortType = SortType.none,
  });

  UsersLoaded copyWith({
    List<UserModel>? users,
    bool? hasReachedMax,
    int? currentPage,
    String? searchQuery,
    SortType? sortType,
  }) {
    return UsersLoaded(
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
      sortType: sortType ?? this.sortType,
    );
  }

  @override
  List<Object?> get props => [
        users,
        hasReachedMax,
        currentPage,
        searchQuery,
        sortType,
      ];
}

class UsersError extends UsersState {
  final String message;

  const UsersError(this.message);

  @override
  List<Object?> get props => [message];
}

class UsersLoadingMore extends UsersLoaded {
  const UsersLoadingMore({
    required super.users,
    super.hasReachedMax,
    super.currentPage,
    super.searchQuery,
    super.sortType,
  });
}

enum SortType {
  none,
  nameAsc,
  nameDesc,
  idAsc,
  idDesc,
}