enum Messagetype {
  text('text'),
  audio('audio'),
  vedio('vedio'),
  gif('gif'),
  image('image');

  const Messagetype(this.type);
  final String type;
}
