part of 'ampel_cubit.dart';


class AmpelState {
  late DreiAmpelZustand strassenAmpel;
  late ZweiAmpelZustand fusAmpel;
  late bool fusgangerWartet;


  AmpelState(DreiAmpelZustand zustand, bool fusgangerWartet) {
    strassenAmpel = zustand;
    this.fusgangerWartet = fusgangerWartet;
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