
class MusicDataModel{

   bool favorite;
   double rating;
   String title;
   String singer;
   String img;
   String audio;
   String lyrics;
   String songInfo;

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