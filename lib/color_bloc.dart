import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent {to_yellow, to_light_green}

class ColorBloc extends Bloc<ColorEvent, Color>{
  Color _color = Colors.yellow;
  @override
  Color get initialState => Colors.yellow;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    //ada event lalu mapping untuk mengubang state berdasarkan event
    _color = (event == ColorEvent.to_yellow)? Colors.yellow : Colors.lightGreen;
    yield _color;// untuk memasukan stream
  }

}