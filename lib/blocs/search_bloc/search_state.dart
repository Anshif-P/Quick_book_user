part of 'search_bloc.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchFoundState extends SearchState {
  final List<RoomsModel> filteredRooms;

  SearchFoundState({required this.filteredRooms});
}

final class SearchNotFoundState extends SearchState {}

final class SearchShowAllRoomState extends SearchState {
  final List<RoomsModel> totalRooms;

  SearchShowAllRoomState({required this.totalRooms});
}
