extension ImagePath on String {
  String get toPng => 'images/$this.png';
  String get toGif => 'images/$this.gif';
}
