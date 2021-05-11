import 'package:ampel/drei_ampel.dart';
import 'package:ampel/zwei_ampel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ampel_state.dart';

class AmpelCubit extends Cubit<AmpelState> {
  AmpelCubit({DreiAmpelZustand startZustand = DreiAmpelZustand.aus})
      : super(AmpelState(startZustand, false)) {
    _zustand = startZustand;
  }

  late bool _fusgangerWartet = false;
  late DreiAmpelZustand _zustand;

  void tick() {
    switch (_zustand) {
      case DreiAmpelZustand.aus:
        _zustand = DreiAmpelZustand.gelb;
        break;
      case DreiAmpelZustand.gelb:
        _zustand = DreiAmpelZustand.rot;
        break;
      case DreiAmpelZustand.rot:
        _zustand = DreiAmpelZustand.rotGelb;
        _fusgangerWartet = false;
        break;
      case DreiAmpelZustand.rotGelb:
        _zustand = DreiAmpelZustand.grun;
        break;
      case DreiAmpelZustand.grun:
        if (_fusgangerWartet)
          _zustand = DreiAmpelZustand.gelb;
        break;
    }
    emit(AmpelState(_zustand, _fusgangerWartet));
  }

  void setzeFusganger(bool? wert) {
    _fusgangerWartet = wert ?? false;
    emit(AmpelState(_zustand, _fusgangerWartet));
  }


  void ausschalten() {

    if(_zustand == DreiAmpelZustand.grun) {
      _zustand = DreiAmpelZustand.aus;
    }
    else {
      throw Exception("Hauptampel-Zustand muss ${ZweiAmpelZustand.grun.toString()} sein um auszuschalten. Momentaner zustand ist ${_zustand.toString()}");
    }

    emit(AmpelState(_zustand, _fusgangerWartet));
  }

}
