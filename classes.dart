class Person{
  String name;
  int age;

  Person(this.name,this.age){
      this.name = name;
      this.age = age;
  }

  String getPersonName(){
    return 'Alfaz';
  }

  void printIdntity(){
    print('Name :$name'+" Age :"+age.toString());
  }
}

void main(){
  // create by  oject
  var man = Person("",0);
  String name = man.getPersonName();
  print(name);

 // create by contructors
 var detail = Person("Jhon", 30);
 detail.printIdntity();

}