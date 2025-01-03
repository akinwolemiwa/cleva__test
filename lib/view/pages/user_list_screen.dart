import 'package:cleva_test/view/bloc/user_bloc.dart';
import 'package:cleva_test/view/bloc/user_event.dart';
import 'package:cleva_test/view/bloc/user_state.dart';
import 'package:cleva_test/view/widgets/user_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  Future<void> _refresh(BuildContext context) async {
    context.read<UserBloc>().add(FetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Details'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refresh(context),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.users.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: Text('Pull down to refresh')),
                    );
                  }
                  return UserListItem(user: state.users[index]);
                },
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            }
            return const Center(
                child: Text('Pull down to refresh and get users'));
          },
        ),
      ),
    );
  }
}
