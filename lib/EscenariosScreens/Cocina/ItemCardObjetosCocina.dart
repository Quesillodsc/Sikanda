import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/Juegos/Palabras.dart';
import 'package:rompecabezas_sika/Juegos/Rompecabezas.dart';
import '../../Audio.dart';
import '../../Constantes.dart';
import '../../InfoObjetosEscenario/Cocina.dart';
class ItemCardCocina extends StatelessWidget {
  final Cocina cocina;
  final Function press;
  const ItemCardCocina({
    Key key,
    this.cocina,
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
                  imagen: cocina.imagen,
                  mostrar: cocina.mostrar,
                  opciones: cocina.opciones,
                  imagenes: cocina.imagenes,
                  correcta: cocina.correcta,
                  audio: AudioCocinaFrases[cocina.id-1],
                )
            ),
          );
        }else{
          final route=MaterialPageRoute(builder: (context){
            return Rompecabezas(
                imagen: cocina.image, //imagen del rompecabezas
                ren: 2, //Renglones rompecabezas
                col: 2,
                audio:AudioCocina[cocina.id-1],
                nombre:TextCocina[cocina.id-1],
                color:cocina.color
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
                color: cocina.color,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Hero(
                tag: "${cocina.id}",
                child: Image.asset(cocina.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Row(
              children: [
                Text(
                  TextCocina[cocina.id-1],
                  style: TextStyle(color: kTextLightColor),
                ),
                BotonAudio(AudioCocina[cocina.id-1]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}