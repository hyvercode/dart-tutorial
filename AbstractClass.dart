abstract class car{
  void onRun();
}

class Truck implements car{
  @override
  void onRun() {
    // TODO: implement onRun
    print("Truck run");
  }

}

void main(){
  var truck = new Truck();
  truck.onRun();
}