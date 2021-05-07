import 'package:flutter/material.dart';
class ZweiAmpel extends StatelessWidget {
  late Color _oben;
  late Color _unten;

  ZweiAmpel(ZweiAmpelZustand _zustand) {
    switch(_zustand) {

      case ZweiAmpelZustand.aus:
        _oben = Colors.black;
        _unten = Colors.black;
        break;
      case ZweiAmpelZustand.rot:
        _oben = Colors.red;
        _unten = Colors.black;
        break;
      case ZweiAmpelZustand.grun:
        _oben = Colors.black;
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
              color: _unten
          ),
        ),
      ],
    );
  }
}

enum ZweiAmpelZustand{
  aus,
  rot,
  grun
}