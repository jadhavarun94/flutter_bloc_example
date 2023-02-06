import 'package:bloc_demo/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_demo/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Center(
        child: BlocConsumer<InternetBloc,InternetState>(builder: (BuildContext context, state) {
          // this is for UI as well as background tasks
          if (state is InternetGainedState) {
            return const Text('Connected!');
          } else if (state is InternetLostState) {
            return const Text('Not Connected!');
          } else {
            return const Text('Loading...');
          }
        },listener: (context,state){

          // this runs in backgorund ...if we don't need to build ui
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Internet connected!'),backgroundColor: Colors.green,),);
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Internet not connected!'),backgroundColor: Colors.red,),);

          }
          //TODO: Implement
        },),
        /*child:
            BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
          if (state is InternetGainedState) {
            return const Text('Connected!');
          } else if (state is InternetLostState) {
            return const Text('Not Connected!');
          } else {
            return const Text('Loading...');
          }
        }),*/
      ),
    ));
  }
}
