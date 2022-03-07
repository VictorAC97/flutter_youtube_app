import 'package:flutter/material.dart';
import 'CustomSearchDelegate.dart';
import 'telas/Início.dart';
import 'telas/EmAlta.dart';
import 'telas/Inscricoes.dart';
import 'telas/Biblioteca.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  String? _pesquisa = '';
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_pesquisa),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Image.asset('images/youtube.png', width: 110),
        actions: [
          IconButton(
              onPressed: () {
                print("acao: videocam");
              },
              icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () async {
                print("acao: search");
                String? resultado = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _pesquisa = resultado;
                });
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                print("acao: account");
              },
              icon: Icon(Icons.account_circle))
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: telas[index],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: index,
        onTap: (indice) {
          setState(() {
            index = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            label: 'Início',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.amber,
            label: 'Em alta',
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            label: 'Inscrições',
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            label: 'Biblioteca',
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
