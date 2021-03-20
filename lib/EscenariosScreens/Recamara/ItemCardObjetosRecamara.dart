import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/InfoObjetosEscenario/Recamara.dart';
import 'package:rompecabezas_sika/Juegos/Palabras.dart';
import 'package:rompecabezas_sika/Juegos/Rompecabezas.dart';
import '../../Audio.dart';
import '../../Constantes.dart';
class ItemCardRecamara extends StatelessWidget {
  final Recamara recamara;
  final Function press;
  const ItemCardRecamara({
    Key key,
    this.recamara,
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
                  imagen: recamara.imagen,
                  mostrar: recamara.mostrar,
                  opciones: recamara.opciones,
                  imagenes: recamara.imagenes,
                  correcta: recamara.correcta,
                  audio: AudioRecamaraFrases[recamara.id-1],
                )
            ),
          );
        }else{
          final route=MaterialPageRoute(builder: (context){
            return Rompecabezas(
                imagen: recamara.image, //imagen del rompecabezas
                ren: 2, //Renglones rompecabezas
                col: 2,
                audio:AudioRecamara[recamara.id-1],
                nombre:TextRecamara[recamara.id-1],
                color:recamara.color
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
                color: recamara.color,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Hero(
                tag: "${recamara.id}",
                child: Image.asset(recamara.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Row(
              children: [
                Text(
                  TextRecamara[recamara.id-1],
                  style: TextStyle(color: kTextLightColor),
                ),
                BotonAudio(AudioRecamara[recamara.id-1]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}