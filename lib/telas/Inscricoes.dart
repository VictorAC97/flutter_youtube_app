import 'package:flutter/material.dart';

class Inscricoes extends StatefulWidget {
  const Inscricoes({Key? key}) : super(key: key);

  @override
  _InscricoesState createState() => _InscricoesState();
}

class _InscricoesState extends State<Inscricoes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://i.pinimg.com/originals/6a/11/b8/6a11b874f3de881c9ee447d86c32d465.jpg',
            width: 250,
          ),
          Text(
            'Inscrições',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
