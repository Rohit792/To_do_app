// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:to_do_app/feature/core/base_response.dart';
import 'package:to_do_app/feature/home/data/models/to_do_model.dart';
import 'package:to_do_app/feature/home/domain/repositories/home_repository_builder.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  List<ToDo> todoList = [];
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  var tabPosition = 0;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<InitEvent>(init);
    on<GetAllDataEvent>(_fetchAllData);
    on<InsetDataEvent>(_insertData);
    on<DeleteDataEvent>(_deleteData);
    on<UpdateDataEvent>(_updateData);
  }

  init(InitEvent event, Emitter<HomeState> emit) async {
    todoList = [];
    emit(HomeInitial());
  }

  _fetchAllData(GetAllDataEvent event, Emitter<HomeState> emit) async {
    emit(GetAllDataState(status: Status.loading, statusMessage: 'please_wait'));
    final getAllRows = await homeRepository.getAllData(tabPosition.toString());

    todoList.clear();
    getAllRows.forEach((row) => todoList.add(ToDo.fromMap(row)));

    emit(GetAllDataState(status: Status.completed, statusMessage: 'completed'));
  }

  void _insertData(InsetDataEvent event, Emitter<HomeState> emit) async {
    emit(InsertDataState(status: Status.loading, statusMessage: 'please_wait'));

    await homeRepository.insertData(
        event.name, event.discription, event.categoryId);

    emit(InsertDataState(status: Status.completed, statusMessage: 'completed'));
  }

  void _deleteData(DeleteDataEvent event, Emitter<HomeState> emit) async {
    emit(DeleteDataState(status: Status.loading, statusMessage: 'please_wait'));
    await homeRepository.deleteData(event.id);
    emit(DeleteDataState(status: Status.completed, statusMessage: 'completed'));
  }

  void _updateData(UpdateDataEvent event, Emitter<HomeState> emit) async {
    emit(UpdateDataState(status: Status.loading, statusMessage: 'please_wait'));
    await homeRepository.updateData(
        event.name, event.discription, event.id.toString(), event.categoryId);
    emit(UpdateDataState(status: Status.completed, statusMessage: 'completed'));
  }
}
