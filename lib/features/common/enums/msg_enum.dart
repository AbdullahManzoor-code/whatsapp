enum Messagetype {
  text('text'),
  audio('audio'),
  vedio('video'),
  gif('gif'),
  image('image');

  const Messagetype(this.type);
  final String type;
}
