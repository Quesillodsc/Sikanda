import 'package:flutter/material.dart';
import 'Audio.dart';
import 'Constantes.dart';
import 'EscenariosScreens/Banio/ListarObjetosBanio.dart';
import 'EscenariosScreens/Cocina/ListarObjetosCocina.dart';
import 'EscenariosScreens/Recamara/ListarObjetosRecamara.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: new EdgeInsets.all(10.0),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Column(
                children: [
                  Mundo("Cocina","assets/images/cocina.jpeg",Colors.orange[800],"audio/espaniol/cocina/13.m4a"),
                  Mundo("Baño","assets/images/baño.jpeg",Color(0xFFFFC400),"audio/espaniol/banio/8.m4a"),
                  Mundo("Recamara","assets/images/habitacion.jpeg",Color(0xFF304FFE),"audio/espaniol/recamara/7.m4a"),
                ],
              ),
            ),
          ),
        ],
      );
  }
}

class Mundo extends StatelessWidget {
  var titulo,imagen,sonido;
  Color color;
  Mundo(this.titulo,this.imagen, this.color, this.sonido);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          print("$titulo");
          if(titulo=="Cocina")
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  ListarObjetosCocina(color)
              ),
            );
          else if(titulo=="Baño")
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  ListarObjetosBanio(color)
              ),
            );
          else if(titulo=="Recamara")
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  ListarObjetosRecamara(color)
              ),
            );
        },
        child: Column(children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            //codigo de un mundo
            padding: EdgeInsets.all(kDefaultPaddin),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(const Radius.circular(26)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "$titulo",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    BotonAudio(sonido),
                  ],
                ),
                Image.asset(
                  imagen,
                  width: MediaQuery.of(context).size.width*0.9,
                ),
              ],
            ),
          ),
        ]));
  }
}