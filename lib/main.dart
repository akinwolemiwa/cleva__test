import 'package:cleva_test/core/network/api_client.dart';
import 'package:cleva_test/data/repository/user_repository.dart';
import 'package:cleva_test/data/user_data.dart';
import 'package:cleva_test/view/bloc/user_bloc.dart';
import 'package:cleva_test/view/bloc/user_event.dart';
import 'package:cleva_test/view/pages/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final apiClient = ApiClient(client: http.Client());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cleva Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => UserBloc(
          repository: UserRepoImpl(
            dataSource: UserData(
              apiClient: apiClient,
            ),
          ),
        )..add(FetchUsers()),
        child: const UserListScreen(),
      ),
    );
  }
}
