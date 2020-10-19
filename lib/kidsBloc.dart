import 'dart:async';
import 'kids.dart';

class KidsBloc {
  List<Kids> _kidsList = [
    Kids(1, "Swaran", "12-c", 1.0),
    Kids(2, "Iyappan", "12-d", 1.0),
    Kids(3, "Harish", "12-a", 1.0),
    Kids(4, "Vignesh", "12-c", 1.0),
  ];

  final _kidsListStreamController = StreamController<List<Kids>>();

  final _kidsStarIncrementStreamController = StreamController<Kids>();
  final _kidsStarDecrementStreamContoller = StreamController<Kids>();

  Stream<List<Kids>> get kidsListStream => _kidsListStreamController.stream;
  StreamSink<List<Kids>> get kidsListSink => _kidsListStreamController.sink;

  StreamSink<Kids> get kidsStarIncrement =>
      _kidsStarIncrementStreamController.sink;
  StreamSink<Kids> get kidsStarsDecrement =>
      _kidsStarDecrementStreamContoller.sink;

  KidsBloc() {
    _kidsListStreamController.add(_kidsList);

    _kidsStarIncrementStreamController.stream.listen(_starsIncrement);
    _kidsStarDecrementStreamContoller.stream.listen(_starsDecrement);
  }

  _starsIncrement(Kids kids) {
    double stars = kids.stars;
    double incrementedstars = stars * 20 / 100;
    _kidsList[kids.id - 1].stars = stars + incrementedstars;

    kidsListSink.add(_kidsList);
  }

  _starsDecrement(Kids kids) {
    double stars = kids.stars;
    double decrementedstars = stars * 20 / 100;
    _kidsList[kids.id - 1].stars = stars - decrementedstars;

    kidsListSink.add(_kidsList);
  }

  void dispose() {
    _kidsListStreamController.close();
    _kidsStarIncrementStreamController.close();
    _kidsStarDecrementStreamContoller.close();
  }
}
