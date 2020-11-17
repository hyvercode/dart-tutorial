import 'dart:io';

void main(){
  List<String> name = [];
  name.add("Dodi");
  name.add("Jhon");
  listFor(name);

  colIf();

  colList();
}


void listFor(List<String> list){
   for(String name in list){
     print("Name : $name");
   }
}

void colIf(){
  bool show = true;

  var names = [
    'Cris',
    'Jhon',
    if(show) 'Dodi'
  ];

  for(String name in names){
     print("$name");
   }
}


void colList(){
  var numbers = [1,2,3];
  var names = [
    'Cris',
    'Jhon',
    'Dodi',
    for (var i in numbers) 'Number = $i'
  ];

  for(String name in names){
     print("$name");
   }
}