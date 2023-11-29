part of 'search_bloc.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchFoundState extends SearchState {
  final List<RoomsModel> hotelList;

  SearchFoundState({required this.hotelList});
}

final class SearchNotFoundState extends SearchState {}
