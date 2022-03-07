import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
      IconButton(
        icon: Icon(Icons.check),
        onPressed: () {
          close(context, query);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("resultado: pesquisa realizada - " + query);
    //close(context, query); //PROBLEMA AQUI
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("resultado: " + query);
    //return Container();

    List<String> lista = [];

    if (query.isNotEmpty) {
      lista = [
        "Victor Alves",
        "Drift",
        "Assetto",
        "Assetto Corsa",
      ]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(lista[index]),
              onTap: () {
                close(context, lista[index]);
              },
            );
          });
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa!"),
      );
    }
  }
}
