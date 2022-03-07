import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:youtube_flutter/model/Video.dart';

const CHAVE_YOUTUBE_API = ""; // ADD ONE API KEY HERE FROM YOUTUBE API!
const ID_CANAL = 'UCVHFbqXqoYvEWM1Ddxl0QDg';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    String url = URL_BASE +
        'search'
            "?part=snippet"
            "&type=video"
            "&maxResults=40"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&q=$pesquisa";
    Uri httpurl = Uri.parse(url);
    http.Response response = await http.get(httpurl);

    List<Video> videos = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = jsonDecode(response.body);
      videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
        //return Video.fromJson(map);
      }).toList();
    } else {
      print('Erro! ${response.statusCode}');
    }
    return videos;
  }
}
