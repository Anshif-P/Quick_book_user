part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchShowAllEvent extends SearchEvent {}

class SearchHotelEvent extends SearchEvent {
  final String? query;
  final List<String> amentiesList;
  final double? priceRange;
  SearchHotelEvent(
      {required this.query,
      required this.amentiesList,
      required this.priceRange});
}
