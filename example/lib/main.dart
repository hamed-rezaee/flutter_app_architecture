import 'package:flutter/material.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

import 'package:example/sample_component/data/mock_user_repository.dart';
import 'package:example/sample_component/domain/user_service.dart';
import 'package:example/sample_component/presentation/user_cubit.dart';
import 'package:example/sample_component/presentation/user_widget.dart';

void main() {
  BlocManager.instance.register(
    UserCubit(service: UserService(MockUserRepository())),
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: Scaffold(
          appBar: AppBar(elevation: 0, title: const Text('Flutter Demo')),
          body: Center(
            child: Column(
              children: <Widget>[
                Expanded(child: Center(child: UserWidget())),
                TextButton(
                  child: const Text('FETCH USER'),
                  onPressed: () =>
                      BlocManager.instance.fetch<UserCubit>().fetchUser(),
                )
              ],
            ),
          ),
        ),
      );
}
