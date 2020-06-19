import 'package:blocpackagetommysp/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
        builder: (context) => ColorBloc(),
        child:MainPage()
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: (){
            bloc.dispatch(ColorEvent.to_yellow);
          },
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            backgroundColor: Colors.lightGreen,
            onPressed: (){
            bloc.dispatch(ColorEvent.to_light_green);
          },
          )
        ],
      ),
      appBar: AppBar(
        title: Text("Flutter_Bloc TomSP"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc,Color>(
        builder: (context,currentColor)=> AnimatedContainer(
          width: 100,
          height: 100,
          color: currentColor,
          duration: Duration(milliseconds: 500),
        ),
        ),
      ),
    );
  }
}

