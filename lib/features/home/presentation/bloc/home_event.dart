part of 'home_bloc.dart';

class HomeEvent {}

class GetAllDocEvent extends HomeEvent {}

class GetOneDocEvent extends HomeEvent {
  final String id;

  GetOneDocEvent({required this.id});
}