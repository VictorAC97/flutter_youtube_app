import 'package:flutter/material.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({Key? key}) : super(key: key);

  @override
  _BibliotecaState createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://pbs.twimg.com/media/ELm-1qnXsAEc74r.jpg',
            width: 200,
          ),
          Text(
            'Biblioteca',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
