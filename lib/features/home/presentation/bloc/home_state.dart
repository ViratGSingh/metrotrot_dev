// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String? lat;
  final String? lng;

  const HomeState({this.lat, this.lng});

  @override
  List<String> get props => [lat.toString(), lng.toString()];

  factory HomeState.initial() {
    return const HomeState();
  }

  HomeState copyWith({
    String? lat,
    String? lng,
  }) {
    return HomeState(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }
}
