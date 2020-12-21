import 'dart:io';

void main(){
  //for
  exFor();

  //for in object
  Person p1 = Person();
  p1.setName("Crist");
  p1.setAge(25);

  Person p2= Person();
  p2.setName("Jhon");
  p2.setAge(35);

  List<Person> list = [];
  list.add(p1);
  list.add(p2);

  for(Person person in list){
    print("Name : "+person.getName);
    print("Age : "+person.getAge.toString());
  }

  //while
  exWhile();

  //do while
  exDoWhile();

}

void exFor(){
  for(int i=0;i<10;i++){
    print("Index : $i");
  }
}

class Person{
  String name;
  int age;

  Person(this.name,this.age);

  void setName(String pName) {
    name = pName;
  }

  String get getName {
    return name;
  }

  void setAge(int currentYear) {
    age = currentYear;
  }

  int get getAge {
    return age;
  }
}


void exWhile(){
  var list = [1,2,3,4,5];
  int count=0;

  while(list.length >0){
    list.length --;
    print(count ++);
  }
}

void exDoWhile(){
  var list = [1,2,3,4,5];
  int count=0;

  do{
    list.length --;
    print(count ++);
  }while(list.length >0);

}


