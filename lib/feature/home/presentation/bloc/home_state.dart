part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetAllDataState extends HomeState {
  final Status status;
  final String? statusMessage;

  GetAllDataState({required this.status, this.statusMessage});
}

class InsertDataState extends HomeState {
  final Status status;
  final String? statusMessage;

  InsertDataState({required this.status, this.statusMessage});
}

class DeleteDataState extends HomeState {
  final Status status;
  final String? statusMessage;

  DeleteDataState({required this.status, this.statusMessage});
}

class UpdateDataState extends HomeState {
  final Status status;
  final String? statusMessage;

  UpdateDataState({required this.status, this.statusMessage});
}
