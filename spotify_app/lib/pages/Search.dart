// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_this, unused_field, prefer_final_fields
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spotify_app/pages/Inicio.dart';
import 'package:spotify_app/pages/biblioteca.dart';

void main() => runApp(Search());

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<GenerosEscuchados> _GenerosEscuchados = [
    GenerosEscuchados("Tus generos mas escuchados", ["Rock", "Latina"]),
  ];

  List<CategoriasPopulares> _CategoriasPopulares = [
    CategoriasPopulares("Categorias populares de podcast",
        ["Nuevos podcast", "Sociedad y cultura"]),
  ];

  List<ExplorarTodo> _ExplorarTodo = [
    ExplorarTodo(
      "Explorar Todo",
      [
        "Tu 2021 en spotify",
        "Podcast",
        "Creadas para vos",
        "Listas",
        "Nuevos lanzamientos",
        "Radio",
        "Descubrir",
        "Conciertos",
        "Pop",
        "Cumbia"
      ],
    )
  ];

  List<Color> _Colores = [
    Colors.blue,
    Colors.lightGreenAccent,
    Colors.red.shade900,
    Colors.purple.shade600,
    Colors.orange.shade800,
    Colors.amber,
    Colors.deepPurple,
    Colors.teal,
    Colors.yellow,
    Colors.brown
  ];

  int _selectedIndex = 1;

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
    _selectedIndex = 1;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          extendBody: true,
          backgroundColor: Colors.black,
          body: ListView(
            children: <Widget>[
              _Buscador(),
              _ContenedorGeneros(_GenerosEscuchados),
              _ContenedorCategorias(_CategoriasPopulares),
              _ContenedorExplorar(_ExplorarTodo, _Colores),
            ],
          ),
          bottomNavigationBar: _createBottomNavigationBar(
              context, _selectedIndex, _onItemTapped)),
    );
  }
}

Widget _Buscador() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, bottom: 5.0, top: 45.0),
            child: Text(
              "Buscar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 50.0,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                hintText: "Artistas, canciones o podcast",
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _ContenedorGeneros(List<GenerosEscuchados> _GenerosEscuchados) {
  return Container(
    width: double.infinity,
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Titulo(_GenerosEscuchados[0].titulo),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(_GenerosEscuchados[0].genero[0], Colors.red),
            Card(_GenerosEscuchados[0].genero[1], Colors.pink[300])
          ],
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
    ]),
  );
}

Widget Titulo(texto) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
    child: Text(texto,
        style: TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
  );
}

Widget Card(String texto, color) {
  return Container(
    width: 175.0,
    height: 90.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 12.0),
      child: Text(
        texto,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      // style: TextStyle(
      //     color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _ContenedorCategorias(List<CategoriasPopulares> _CategoriasPopulares) {
  return Container(
    width: double.infinity,
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Titulo(_CategoriasPopulares[0].titulo),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(_CategoriasPopulares[0].genero[0], Colors.green[600]),
            Card(_CategoriasPopulares[0].genero[1], Colors.blue[900])
          ],
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
    ]),
  );
}

Widget _ContenedorExplorar(
    List<ExplorarTodo> _ExplorarTodo, List<Color> _Colores) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Titulo(_ExplorarTodo[0].titulo),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          // color: Colors.white,
          height: 530.0,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                return Card(_ExplorarTodo[0].genero[index], _Colores[index]);
              }),
        ),
      ),
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

class GenerosEscuchados {
  late String titulo;
  late List<String> genero;

  GenerosEscuchados(String title, List<String> gender) {
    this.titulo = title;
    this.genero = gender;
  }
}

class CategoriasPopulares {
  late String titulo;
  late List<String> genero;

  CategoriasPopulares(String title, List<String> gender) {
    this.titulo = title;
    this.genero = gender;
  }
}

class ExplorarTodo {
  late String titulo;
  late List<String> genero;

  ExplorarTodo(String title, List<String> gender) {
    this.titulo = title;
    this.genero = gender;
  }
}
