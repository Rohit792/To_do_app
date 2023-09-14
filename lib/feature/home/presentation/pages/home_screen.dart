import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/error/error_screen.dart';
import 'package:to_do_app/feature/core/base_response.dart';
import 'package:to_do_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:to_do_app/feature/home/presentation/widgets/category_button.dart';
import 'package:to_do_app/feature/home/presentation/widgets/radio_button.dart';
import 'package:to_do_app/injection_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SingingCharacter { today, tomorrow, upcomming }

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homePage';

  late final HomeBloc _homeBloc = sl<HomeBloc>()
    ..add(GetAllDataEvent(categoryId: '0'));

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context).appTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _homeBloc.nameController.text = '';
                _homeBloc.discriptionController.text = '';

                showAlert(context);
              },
            ),
          ),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
          bloc: _homeBloc,
          listener: (context, state) {
            if (state is HomeInitial) {}
            if (state is InsertDataState) {
              if (state.status == Status.completed) {
                _homeBloc.add(GetAllDataEvent(
                    categoryId: _homeBloc.tabPosition.toString()));
              }
            }
            if (state is DeleteDataState) {
              if (state.status == Status.completed) {
                _homeBloc.add(GetAllDataEvent(
                    categoryId: _homeBloc.tabPosition.toString()));
              }
            }
            if (state is UpdateDataState) {
              if (state.status == Status.completed) {
                _homeBloc.add(GetAllDataEvent(
                    categoryId: _homeBloc.tabPosition.toString()));
              }
            }
          },
          builder: (context, snapshot) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CatogoryButton(
                      title: AppLocalizations.of(context).str_btn_today,
                      tabPossition: 0,
                      isSelected: _homeBloc.tabPosition == 0 ? true : false,
                      onTap: (value) {
                        _homeBloc.tabPosition = value;
                        _homeBloc.add(GetAllDataEvent(
                            categoryId: _homeBloc.tabPosition.toString()));
                      },
                    ),
                    CatogoryButton(
                      title: AppLocalizations.of(context).str_btn_tomorrow,
                      tabPossition: 1,
                      isSelected: _homeBloc.tabPosition == 1 ? true : false,
                      onTap: (value) {
                        _homeBloc.tabPosition = value;
                        _homeBloc.add(GetAllDataEvent(
                            categoryId: _homeBloc.tabPosition.toString()));
                      },
                    ),
                    CatogoryButton(
                      title: AppLocalizations.of(context).str_btn_upcoming,
                      tabPossition: 2,
                      isSelected: _homeBloc.tabPosition == 2 ? true : false,
                      onTap: (value) {
                        _homeBloc.tabPosition = value;
                        _homeBloc.add(GetAllDataEvent(
                            categoryId: _homeBloc.tabPosition.toString()));
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: _homeBloc.todoList.isEmpty
                      ? const ErrorPage()
                      : ListView.builder(
                          itemCount: _homeBloc.todoList.length,
                          itemBuilder: (context, index) {
                            var listData = _homeBloc.todoList[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 12),
                              child: Container(
                                color: Colors.blue[100],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 12,
                                                bottom: 8),
                                            child: Text(
                                              '${listData.name}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, bottom: 12),
                                            child: Text(
                                              '${listData.desciption}',
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            _homeBloc.nameController.text =
                                                listData.name.toString();
                                            _homeBloc.discriptionController
                                                    .text =
                                                listData.desciption.toString();

                                            showAlert(
                                                context, listData.id ?? 0);
                                          },
                                          icon: const Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _homeBloc.add(DeleteDataEvent(
                                                id: listData.id ?? 0));
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                )
              ],
            );
          }),
    );
  }

  showAlert(BuildContext context, [int? id]) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(AppLocalizations.of(context).str_btn_addNewRecord),
            content: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _homeBloc.nameController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).str_btn_name,
                        icon: const Icon(Icons.account_box),
                      ),
                    ),
                    TextFormField(
                      controller: _homeBloc.discriptionController,
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context).str_btn_discription,
                        icon: const Icon(Icons.data_array),
                      ),
                    ),
                    RadioCategoryButton(currentTap: _homeBloc.tabPosition),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                  child: Text(AppLocalizations.of(context).str_btn_submit),
                  onPressed: () {
                    if (id != null) {
                      _homeBloc.add(UpdateDataEvent(
                          name: _homeBloc.nameController.text,
                          discription: _homeBloc.discriptionController.text,
                          id: id,
                          categoryId: _homeBloc.tabPosition.toString()));
                    } else {
                      _homeBloc.add(InsetDataEvent(
                          name: _homeBloc.nameController.text,
                          discription: _homeBloc.discriptionController.text,
                          categoryId: _homeBloc.tabPosition.toString()));
                    }
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
