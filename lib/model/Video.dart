class Video {
  String? id;
  String? title;
  String? channel;
  String? thumbnail;
  String? description;

  Video({this.id, this.title, this.channel, this.thumbnail, this.description});

/*
  static converterJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"], 
      channel: json["snippet"]["channelId"],
      thumbnail: json["snippet"]["thumbnails"]["high"]["url"],
    );
  }
*/
  //CONVERSAO DE OBJETOS JSON PARA UM MODELO DE OBJETOS DO SISTEMA JSON -> VIDEO.dart
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json["id"]["videoId"],
        title: json["snippet"]["title"],
        channel: json["snippet"]["channelTitle"],
        thumbnail: json["snippet"]["thumbnails"]["high"]["url"],
        description: json["snippet"]["description"]);
  }
}
