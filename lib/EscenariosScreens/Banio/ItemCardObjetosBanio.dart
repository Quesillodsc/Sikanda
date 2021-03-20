import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/Juegos/Palabras.dart';
import 'package:rompecabezas_sika/Juegos/Rompecabezas.dart';
import '../../Audio.dart';
import '../../Constantes.dart';
import '../../InfoObjetosEscenario/Banio.dart';
class ItemCardBanio extends StatelessWidget {
  final Banio banio;
  final Function press;
  const ItemCardBanio({
    Key key,
    this.banio,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        var rng = new Random();
        if(rng.nextInt(4)%2 ==0){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                Relacionable(
                  imagen: banio.imagen,
                  mostrar: banio.mostrar,
                  opciones: banio.opciones,
                  imagenes: banio.imagenes,
                  correcta: banio.correcta,
                  audio: AudioBanioFrases[banio.id-1],
                )
            ),
          );
        }else{
          final route=MaterialPageRoute(builder: (context){
            return Rompecabezas(
                imagen: banio.image, //imagen del rompecabezas
                ren: 2, //Renglones rompecabezas
                col: 2,
                audio:AudioBanio[banio.id-1],
                nombre:TextBanio[banio.id-1],
                color:banio.color
            );
          });
          Navigator.push(context, route);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: banio.color,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Hero(
                tag: "${banio.id}",
                child: Image.asset(banio.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Row(
              children: [
                Text(
                  TextBanio[banio.id-1],
                  style: TextStyle(color: kTextLightColor),
                ),
                BotonAudio(AudioBanio[banio.id-1]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}