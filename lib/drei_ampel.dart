import 'package:flutter/material.dart';

class DreiAmpel extends StatelessWidget {
  late Color _oben;
  late Color _mitte;
  late Color _unten;
  DreiAmpel(DreiAmpelZustand dreiAmpelZustand) {
    switch(dreiAmpelZustand){
      case DreiAmpelZustand.aus:
        _oben = Colors.black;
        _mitte = Colors.black;
        _unten = Colors.black;
        break;
      case DreiAmpelZustand.gelb:
        _oben = Colors.black;
        _mitte = Colors.yellow;
        _unten = Colors.black;
        break;
      case DreiAmpelZustand.rot:
        _oben = Colors.red;
        _mitte = Colors.black;
        _unten = Colors.black;
        break;
      case DreiAmpelZustand.rotGelb:
        _oben = Colors.red;
        _mitte = Colors.yellow;
        _unten = Colors.black;
        break;
      case DreiAmpelZustand.grun:
        _oben = Colors.black;
        _mitte = Colors.black;
        _unten = Colors.green;
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100, width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _oben
          ),
        ),
        Container(
          height: 100, width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _mitte
          ),
        ),
        Container(
          height: 100, width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _unten
          ),

        ),
      ],
    );
  }
}


enum DreiAmpelZustand {
  aus,
  gelb,
  rot,
  rotGelb,
  grun,
}