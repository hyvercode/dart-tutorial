class Person{
  String name;
  int age;

  Person(this.name,this.age);
}

void main(){
  var person = Person("Alfaz",30);
  
  print('Name : '+person.name);
  print('Age :'+person.age.toString());
}