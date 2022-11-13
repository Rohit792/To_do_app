part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class InitEvent extends HomeEvent {}

class GetAllDataEvent extends HomeEvent {
  final String categoryId;

  GetAllDataEvent({required this.categoryId});
}

class InsetDataEvent extends HomeEvent {
  final String name;
  final String discription;
  final String categoryId;

  InsetDataEvent(
      {required this.name,
      required this.discription,
      required this.categoryId});
}

class DeleteDataEvent extends HomeEvent {
  final int id;

  DeleteDataEvent({required this.id});
}

class UpdateDataEvent extends HomeEvent {
  final int id;

  final String name;
  final String discription;
  final String categoryId;

  UpdateDataEvent(
      {required this.name,
      required this.discription,
      required this.id,
      required this.categoryId});
}
