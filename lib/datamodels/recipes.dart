class Recipes{
  int id;
  String name ;
  String category ;
  String image ;
  String time ;
  bool isliked ;
  bool isSelected ;
  Recipes({this.id,this.name, this.category, this.time, this.isliked,this.isSelected = false,this.image});
}