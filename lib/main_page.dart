import 'package:aorl_apps_bloc/counter/cubit/counter_cubit.dart';
import 'package:aorl_apps_bloc/dio/screens/dio_screen.dart';
import 'package:aorl_apps_bloc/list/bloc/post_bloc.dart';
import 'package:aorl_apps_bloc/list/screens/post_page.dart';
import 'package:aorl_apps_bloc/list_api/screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/nav_button.dart';
import 'counter/screens/counter_page.dart';
import 'package:dio/dio.dart';

import 'list/screens/list_demo.dart';
import 'map/screens/map_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aorl Apps with BLoC'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const NavButton(
                label: 'Go To Counter',
                destination: CounterPage(),
              ),
              const NavButton(
                label: 'Go To Google Map',
                destination: MapPage(),
              ),
              const NavButton(
                label: 'Go To DIO Demo',
                destination: DioScreen(),
              ),
              const NavButton(
                label: 'Go To List Demo',
                destination: PostPage(),
              ),
              const NavButton(
                label: 'Go To List API Screen',
                destination: ListScreen(),
              ),
              ElevatedButton(
                onPressed: () {
                  // getHttp();
                  // print(context.read<PostBloc>());
                  // print('Value A : ${context.read<CounterCubit>().countA}');
                  // print('Value B : ${context.read<CounterCubit>().countB}');
                  print('It Works');
                },
                child: const Text('Test BloC'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getHttp() async {
    try {
      var response = await Dio().get('https://reqres.in/api/users?page=2');
      print(response.data['data']);
    } catch (e) {
      print(e);
    }
  }
}
