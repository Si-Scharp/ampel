import 'package:ampel/drei_ampel.dart';
import 'package:ampel/zwei_ampel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ampel_state.dart';

class AmpelCubit extends Cubit<AmpelState> {
  AmpelCubit({DreiAmpelZustand startZustand = DreiAmpelZustand.aus})
      : super(AmpelState(startZustand)) {
    _zustand = startZustand;
  }

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
        break;
      case DreiAmpelZustand.rotGelb:
        _zustand = DreiAmpelZustand.grun;
        break;
      case DreiAmpelZustand.grun:
        _zustand = DreiAmpelZustand.gelb;
        break;
    }
    emit(AmpelState(_zustand));
  }


  void ausschalten() {

    if(_zustand == DreiAmpelZustand.grun) {
      _zustand = DreiAmpelZustand.aus;
    }
    else {
      throw Exception("Hauptampel-Zustand muss ${ZweiAmpelZustand.grun.toString()} sein um auszuschalten. Momentaner zustand ist ${_zustand.toString()}");
    }

    emit(AmpelState(_zustand));
  }

}
