// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_final_fields, unused_field, sized_box_for_whitespace, avoid_print, use_function_type_syntax_for_parameters, unused_element, unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spotify_app/pages/Inicio.dart';
import 'package:spotify_app/pages/Search.dart';

void main() => runApp(Biblioteca());

class Biblioteca extends StatefulWidget {
  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  List<Etiquetas> _Etiquetas = [
    Etiquetas([
      "Playlist",
      "Artistas",
      "Álbumes",
      "Podcast y programas",
      "Descargado"
    ]),
  ];

  List<Playlist> _Playlists = [
    Playlist("Tus me gusta", "assets/img/megusta.png",
        ["Playlist", "127 canciones"]),
    Playlist("Mi Vida: Grandes Exitos", "assets/img/julio.jfif",
        ["Album", "Julio Iglesias"]),
    Playlist(
        "La cruda", "assets/img/lacruda.jfif", ["Podcast", "Spotify Studios"]),
    Playlist("Exodus", "assets/img/exodus.jfif",
        ["Album", "Bob Marley & The Wailers"]),
    Playlist("Mis pistas de Shazam", "assets/img/mispistasShazam.jfif",
        ["Playlist", "Agustin Garone"]),
    Playlist("Agus", "assets/img/eminem.jfif", ["Playlist", "Agustin Garone"]),
    Playlist("Descubrimiento semanal", "assets/img/descubrimiento.jfif",
        ["Playlist", "Spotify"]),
    Playlist("MARCO", "assets/img/marco.jfif", ["Playlist", "donnacaro81"]),
    Playlist("Blues", "assets/img/blues.jfif", ["Playlist", "Agustin Garone"]),
    Playlist("Rock int", "assets/img/guns.jpg", ["Playlist", "Agustin Garone"]),
    Playlist(
        "Cumbia", "assets/img/cumbia.jfif", ["Playlist", "Agustin Garone"]),
  ];

  int _selectedIndex = 2;

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
    _selectedIndex = 2;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      title: 'Material App',
      home: Scaffold(
          extendBody: true,
          backgroundColor: Color(0xFF171717),
          body: ListView(
            physics: NeverScrollableScrollPhysics(),
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _Cabecera(),
              _ContenedorEtiquetas(_Etiquetas),
              _ListaPlaylist(context, _Playlists),
              // Text(
              //   "Hollaaaaaaa",
              //   style: TextStyle(color: Colors.white),
              // ),
              // _createBottomNavigationBar(context, _selectedIndex, _onItemTapped)
            ],
          ),
          bottomNavigationBar: _createBottomNavigationBar(
              context, _selectedIndex, _onItemTapped)),
    );
  }
}

Widget _Cabecera() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(
          top: 30.0, left: 15.0, bottom: 15.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/img/perfil.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Tu biblioteca",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30.0,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.add,
                color: Colors.white,
                size: 30.0,
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget _ContenedorEtiquetas(List<Etiquetas> _Etiquetas) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF171717),
      boxShadow: [
        BoxShadow(
          color: Color(0xFF111111),
          offset: const Offset(
            0.0,
            5.0,
          ),
          blurRadius: 8.0,
          spreadRadius: 1.0,
        ), //BoxShadow
      ],
    ),
    height: 40,
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _Etiquetas[0].titulo.length,
          itemBuilder: (BuildContext context, int index) {
            return _CardEtiquetas(_Etiquetas[0].titulo[index]);
          },
        ),
      ),
    ),
  );
}

Widget _CardEtiquetas(String texto) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF171717),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.white54,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 7.0, left: 7.0, right: 7.0, bottom: 7.0),
              child: Text(
                texto,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    ),
  );
}

Widget _Filters() {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
    child: Container(
      decoration: BoxDecoration(color: Color(0xFF171717)),
      // color: Colors.blue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.arrow_downward_rounded, size: 12, color: Colors.white),
              Icon(Icons.arrow_upward_rounded, size: 12, color: Colors.white),
              SizedBox(
                width: 10,
              ),
              Text(
                "Agregado recientemente",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Icon(
            Icons.grid_view_outlined,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}

Widget _ListaPlaylist(context, List<Playlist> playlists) {
  return Container(
    height: 650,
    child: ListView(physics: BouncingScrollPhysics(), children: [
      _Filters(),
      Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topRight,
        height: 750.0,
        child: ListView.builder(
            // physics: BouncingScrollPhysics(),
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 17),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  // decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              // color: Colors.red,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                playlists[index].imagen,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(playlists[index].nombre,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white)),
                          SizedBox(
                            height: 3.0,
                          ),
                          Row(
                            children: <Widget>[
                              playlists[index].leyenda.length == 2
                                  ? (_TextIcons(playlists[index].leyenda[0],
                                      playlists[index].leyenda[1]))
                                  : (Text(playlists[index].leyenda[0]))
                              // Text(playlists[index].leyenda[0],
                              //     style: TextStyle(fontSize: 15)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ]),
  );
}

Widget _TextIcons(texto1, texto2) {
  return Row(
    children: [
      Text(
        texto1,
        style: TextStyle(color: Colors.white54),
      ),
      SizedBox(
        width: 3,
      ),
      Icon(Icons.fiber_manual_record, size: 5, color: Colors.white54),
      SizedBox(
        width: 3,
      ),
      Text(texto2, style: TextStyle(color: Colors.white54)),
    ],
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

class Etiquetas {
  late List<String> titulo;

  Etiquetas(List<String> title) {
    this.titulo = title;
  }
}

class Playlist {
  late String nombre;
  late String imagen;
  late List<String> leyenda;

  Playlist(String name, String image, List<String> leyend) {
    this.nombre = name;
    this.imagen = image;
    this.leyenda = leyend;
  }
}
