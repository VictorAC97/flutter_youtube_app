import 'package:flutter/material.dart';

class EmAlta extends StatefulWidget {
  const EmAlta({Key? key}) : super(key: key);

  @override
  _EmAltaState createState() => _EmAltaState();
}

class _EmAltaState extends State<EmAlta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOMAOc1BFrbak7yrXWvSwRs-CRjOS2X3UWKw&usqp=CAU'),
          Text(
            'Em Alta',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
