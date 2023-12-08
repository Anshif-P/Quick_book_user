import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import '../home_bloc/home_bloc.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.homeBloc) : super(SearchInitial()) {
    on<SearchHotelEvent>(_onSearch);
  }
  final HomeBloc homeBloc;

  _onSearch(SearchHotelEvent event, Emitter<SearchState> emit) {
    List<RoomsModel> filteredRooms = [];
    List<String> amentiesList = [];
    double priceRange;

    priceRange = event.priceRange == null ? 15000 : event.priceRange!;

    if (event.amentiesList.isEmpty) {
      amentiesList = [
        'Ac',
        'Swimming Pool',
        'Meeting Room',
        'Wifi',
        'Restaurant',
        'Power backup',
        'Fitness Center',
        'Tv',
        'Elevatorv'
      ];
    } else {
      amentiesList = event.amentiesList;
    }

    List<RoomsModel> totalRooms = homeBloc.roomsObjList;

    if (event.query == null &&
        event.amentiesList.isEmpty &&
        event.priceRange == null) {
      emit(SearchFoundState(filteredRooms: totalRooms));
    } else {
      filteredRooms = totalRooms.where((e) {
        for (int i = 0; i < amentiesList.length; i++) {
          double price = double.parse(e.price);
          if (e.amenities.contains(amentiesList[i]) && price <= priceRange) {
            return true;
          }
        }
        return false;
      }).toList();

      if (event.query != null) {
        filteredRooms = filteredRooms
            .where((e) =>
                e.state.toLowerCase().contains(event.query!.toLowerCase()))
            .toList();
        if (filteredRooms.isNotEmpty) {
          emit(SearchFoundState(filteredRooms: filteredRooms));
        } else if (filteredRooms.isEmpty) {
          emit(SearchNotFoundState());
        }
      } else if (event.query == null && filteredRooms.isNotEmpty) {
        emit(SearchNotFoundState());
      }
    }
  }
}



       // if (event.query != null) {
      //   filteredRooms = totalRooms
      //       .where((element) => element.state
      //           .toLowerCase()
      //           .contains(event.query!.toLowerCase()))
      //       .toList();
      //   if (filteredRooms.isEmpty) {
      //     emit(SearchNotFoundState());
      //   } else {
      //     emit(SearchFoundState(filteredRooms: filteredRooms));
      //   }
      // }


      // filteredRooms = totalRooms.where((e) {
      //   double price = double.parse(e.price);

      //   // Assume initially that all amenities are present
      //   bool allAmenitiesPresent = true;

      //   for (int i = 0; i < amentiesList.length; i++) {
      //     if (!e.amenities.contains(amentiesList[i]) || price > priceRange) {
      //       // If any amenity is not present or the price is higher, set the flag to false
      //       allAmenitiesPresent = false;
      //       break; // No need to continue checking, as we've already found a missing amenity
      //     }
      //   }

      //   return allAmenitiesPresent;
      // }).toList();
