import 'package:api_testing/cubit/result_state.dart';
import 'package:api_testing/cubit/users_cubit.dart';
import 'package:api_testing/model/user.dart';
import 'package:api_testing/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'exceptions/network_exceptions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersCubit>(context).getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UsersCubit, ResultState<List<User>>>(
        builder: (context, state) => state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (users) => buildUsersList(users),
          error: (error) =>
              Center(child: Text(NetworkExceptions.getErrorMessage(error))),
        ),
      ),
    );
  }

  Widget buildUsersList(List<User> users) => ListView.builder(
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) => UserCard(user: users[index]));
}

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        title: Text(user.username ?? 'guest'),
        subtitle: Text(user.email ?? ''),
      ),
    );
  }
}
