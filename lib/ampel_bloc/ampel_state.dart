part of 'ampel_cubit.dart';


class AmpelState {
  late DreiAmpelZustand strassenAmpel;
  late ZweiAmpelZustand fusAmpel;

  AmpelState(DreiAmpelZustand zustand) {
    strassenAmpel = zustand;
    switch(strassenAmpel){
      case DreiAmpelZustand.aus:
        fusAmpel = ZweiAmpelZustand.aus;
        break;
      case DreiAmpelZustand.gelb:
        fusAmpel = ZweiAmpelZustand.rot;
        break;
      case DreiAmpelZustand.rot:
        fusAmpel = ZweiAmpelZustand.grun;
        break;
      case DreiAmpelZustand.rotGelb:
        fusAmpel = ZweiAmpelZustand.rot;
        break;
      case DreiAmpelZustand.grun:
        fusAmpel = ZweiAmpelZustand.rot;
        break;
    }
  }
}