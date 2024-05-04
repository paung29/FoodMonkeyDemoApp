class Tags{
  String name,image;
  Tags({required this.name,required this.image});

  factory Tags.fromJson(dynamic data){
    return Tags(name: data['name'], image: data['image']);
  }
}