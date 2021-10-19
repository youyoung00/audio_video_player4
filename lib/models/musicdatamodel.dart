
class MusicDataModel{

  final bool favorite;
  final double rating;
  final String title;
  final String singer;
  final String img;
  final String audio;
  final String lyrics;
  final String songInfo;

  MusicDataModel({
    required this.favorite,
    required this.rating,
    required this.img,
    required this.title,
    required this.audio,
    required this.lyrics,
    required this.singer,
    required this.songInfo
  });
}