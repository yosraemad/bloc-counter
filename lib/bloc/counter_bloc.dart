import 'dart:async';

import 'package:implementing_bloc_patter/bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc implements Bloc {
  // state
  int _counter = 0;

  // sink to add data
  final _counterController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterController.sink;

  // stream to get data
  Stream<int> get counter => _counterController.stream;

  // sink to add events
  final _eventController = StreamController<CounterEvent>();

  StreamSink<CounterEvent> get eventSink => _eventController.sink;

  CounterBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event == CounterEvent.increment) {
      _inCounter.add(++_counter);
    } else {
      _inCounter.add(--_counter);
    }
  }

  @override
  void dispose() {
    _counterController.close();
    _eventController.close();
  }
}
