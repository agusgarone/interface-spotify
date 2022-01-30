// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_final_fields, unused_field, sized_box_for_whitespace, avoid_print, use_function_type_syntax_for_parameters, unused_element

import 'package:flutter/material.dart';
import 'package:spotify_app/pages/Search.dart';
import 'package:spotify_app/pages/biblioteca.dart';

void main() => runApp(Inicio());

class Inicio extends StatefulWidget {
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<Podcast> _Podcasts = [
    Podcast("La Cruda", "assets/img/lacruda.jfif",
        ["Programa", "Spotify", "Studio"]),
    Podcast("El Futuro", "assets/img/elfuturo.jpg", ["Programa", "elfuturo"]),
    Podcast("Hablemos de guita", "assets/img/hablemosGuita.jfif",
        ["Programa", "Hablemos de guita", "RamiroGamarra"]),
  ];

  List<Remix> _Remixs = [
    Remix(
        "Los Palmeras, La nueva Luna, Los Charros", "assets/img/lanueva.jfif"),
    Remix("Dalila, Leo Mattioli", "assets/img/leo.jfif"),
    Remix("Los Cafres, DreadMar I, Los pericos", "assets/img/cafres.jfif")
  ];

  List<Escuchado> _Escuchados = [
    Escuchado("Si el amor se cae", "assets/img/mysticLove.jpg"),
    Escuchado("Nothing else matters", "assets/img/metallica.jpg"),
    Escuchado("Self Control", "assets/img/selfcontrol.jpg"),
    Escuchado("Civil War", "assets/img/guns.jpg"),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      _changePage(index);
    });
  }

  void _changePage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Inicio()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Search()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Biblioteca()));
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          extendBody: true,
          backgroundColor: Colors.black,
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.white30, Colors.white10],
              stops: [0.0, 0.18],
            )),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                navbarSuperior(),
                TarjPlaylist(context),
                ListHorizontalRemix(
                  context,
                  SimilarA(context, "Los Pericos"),
                  _Remixs,
                ),
                ListHorizontalPodcast(
                    context, TituloCard(context, "Tus programas"), _Podcasts),
                SizedBox(
                  height: 15.0,
                ),
                ListHorizontalEscuchados(
                  context,
                  TituloCard(context, "Escuchados recientemente"),
                  _Escuchados,
                ),
                // _createBottomNavigationBar(),
              ],
            ),
          ),
          bottomNavigationBar: _createBottomNavigationBar(
              context, _selectedIndex, _onItemTapped)),
    );
  }
}

Widget navbarSuperior() {
  return SafeArea(
    child: (Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Buenas Tardes",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.notifications_none_rounded,
                  color: Colors.white, size: 30.0),
              SizedBox(
                width: 15.0,
              ),
              Icon(Icons.restore, color: Colors.white, size: 30.0),
              SizedBox(
                width: 15.0,
              ),
              Icon(Icons.settings, color: Colors.white, size: 30.0),
            ],
          ),
        ],
      ),
    )),
  );
}

Widget TarjPlaylist(context) {
  return Container(
      height: 170.0,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20.0),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Tarjeta(context, "Rock", "assets/img/rock.jfif"),
              Tarjeta(context, "Mis pistas de Shazam",
                  "assets/img/mispistasShazam.jfif"),
              Tarjeta(context, "Cumbia", "assets/img/cumbia.jfif"),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Tarjeta(context, "Regeton", "assets/img/regeton.jfif"),
              Tarjeta(context, "Tus me gusta", "assets/img/megusta.png"),
              Tarjeta(context, "Rock int", "assets/img/playlistRockInt.jfif"),
            ],
          ),
        ],
      ));
}

Widget Tarjeta(context, nombre, imagen) {
  return Container(
      height: 50.0,
      width: 170.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white12,
      ),
      child: Row(children: <Widget>[
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
            ),
            child: Image.asset(imagen, fit: BoxFit.cover),
          ),
          // child: Image.asset(imagen),
        ),
        SizedBox(
          width: 10.0,
        ),
        Container(
            width: 110.0,
            height: 50.0,
            alignment: Alignment.centerLeft,
            child: Text(
              nombre,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ]));
}

Widget SimilarA(context, nombreBanda) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: <Widget>[
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(
              "assets/img/lospericos.jfif",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Similares a",
              style: TextStyle(color: Colors.white24, fontSize: 12.0),
            ),
            Text(
              nombreBanda,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    ),
  );
}

Widget ListHorizontalPodcast(context, itemTitulo, List<Podcast> _Podcasts) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      itemTitulo,
      Container(
        height: 230.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _Podcasts.length,
            itemBuilder: (context, index) {
              return CardCuadradoRedondeado(context, _Podcasts[index].nombre,
                  _Podcasts[index].imagen, _Podcasts[index].etiquetas, index);
            }),
      ),
    ],
  );
}

Widget ListHorizontalRemix(context, itemTitulo, List<Remix> _Remixs) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      itemTitulo,
      Container(
        height: 230.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _Remixs.length,
            itemBuilder: (context, index) {
              return CardCuadrado(context, _Remixs[index].artistas,
                  _Remixs[index].imagen, index);
            }),
      ),
    ],
  );
}

Widget ListHorizontalEscuchados(
    context, itemTitulo, List<Escuchado> _Escuchados) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      itemTitulo,
      Container(
        height: 230.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _Escuchados.length,
            itemBuilder: (context, index) {
              return CardSmall(context, _Escuchados[index].cancion,
                  _Escuchados[index].imagen, index);
            }),
      ),
    ],
  );
}

Widget CardCuadrado(context, artistas, imagen, index) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 5.0),
    child: Row(
      children: [
        Column(
          children: [
            Container(
              height: 170.0,
              width: 170.0,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  // borderRadius: BorderRadius.circular(20.0),
                  ),
              child: Image.asset(imagen, fit: BoxFit.cover),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
              child: Container(
                width: 170.0,
                height: 30.0,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20.0),
                    ),
                child: Text(
                  artistas,
                  style: TextStyle(
                    color: Colors.white54,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget CardCuadradoRedondeado(context, nombre, imagen, List etiquetas, index) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 5.0),
    child: Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 170.0,
                height: 170.0,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      imagen,
                      fit: BoxFit.cover,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
              child: Text(
                nombre,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text(etiquetas[0],
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0)),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.fiber_manual_record,
                      color: Colors.white54,
                      size: 5.0,
                    ),
                  ),
                  Text(etiquetas[1],
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0)),
                ],
              ),
            )
          ]),
    ),
  );
}

Widget TituloCard(context, titulo) {
  return Padding(
    padding:
        const EdgeInsets.only(top: 0.0, left: 15.0, right: 15.0, bottom: 10.0),
    child: Text(
      titulo,
      style: TextStyle(
          color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget CardSmall(context, cancion, imagen, index) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15.0,
      right: 5.0,
    ),
    child: Row(
      children: [
        Column(
          children: [
            Container(
              height: 150.0,
              width: 150.0,
              // decoration: BoxDecoration(
              //   color: Colors.red,
              //   // borderRadius: BorderRadius.circular(20.0),
              // ),
              child: Image.asset(
                imagen,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
              child: Container(
                width: 150.0,
                height: 30.0,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20.0),
                    ),
                child: Text(
                  cancion,
                  style: TextStyle(
                    color: Colors.white54,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget _createBottomNavigationBar(context, _selectedIndex, _onItemTapped) {
  return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.transparent],
          // Color(0xFF00B3FA)
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.0, 1],
          tileMode: TileMode.clamp,
        ),
      ),
      child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Incio"),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Buscar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Tu blibioteca",
            ),
          ]));
}

class Podcast {
  late String nombre;
  late String imagen;
  late List<String> etiquetas;

  Podcast(String name, String image, List<String> tags) {
    nombre = name;
    imagen = image;
    etiquetas = tags;
  }
}

class Remix {
  late String artistas;
  late String imagen;

  Remix(String artist, String image) {
    artistas = artist;
    imagen = image;
  }
}

class Escuchado {
  late String cancion;
  late String imagen;

  Escuchado(String song, String image) {
    cancion = song;
    imagen = image;
  }
}
