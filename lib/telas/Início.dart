import 'package:flutter/material.dart';
import 'package:youtube_flutter/Api.dart';
import 'package:youtube_flutter/model/Video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Inicio extends StatefulWidget {
  //const Inicio({Key? key}) : super(key: key);

  String? pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<List<Video>> _listarVideos(String pesquisa) async {
    Future<List<Video>> videos;
    Api api = Api();
    videos = api.pesquisar(pesquisa);
    return videos;
  }

  @override
  void initState() {
    super.initState();
    print("chamado 1 - initState");
    //O initState serve quando queremos fazer configuracoes iniciais antes de renderizar a interface
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("chamado 2 - didChangeDependencies");
    //O didChangeDependencies serve para quando formos construir a interface,
    //voce possui dependencias que sem elas voce nao precisa fazer a contruicao da interface, como por exemplo a listagem de videos
  }

  @override
  void didUpdateWidget(covariant Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("chamado 2 - didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("chamado 4 - dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("chamado 3 - build");
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa!),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video> videos = snapshot.data!;
                  Video video = videos[index];
                  YoutubePlayerController _controller = YoutubePlayerController(
                    initialVideoId: video.id!,
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    ),
                  );
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: _controller,
                            progressColors: ProgressBarColors(
                              backgroundColor: Colors.black26,
                              playedColor: Colors.red,
                              bufferedColor: Colors.white,
                              handleColor: Colors.red,
                            ),
                          ),
                          builder: (context, player) {
                            return Column(
                              children: [
                                player,
                              ],
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(video.title!),
                        subtitle: Text(video.channel!),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(height: 2, color: Colors.grey),
                itemCount: snapshot.data!.length,
              );
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido."),
              );
            }
        }
      },
    );
  }
}
