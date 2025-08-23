sealed class Vehicle {
  void startEngine() {
    print("Engine started");
  }

  void stopEngine() {
    print("Engine stopped");
  }
}

// Hanya class di file ini yang boleh extends/implements/mixin Vehicle
class Car extends Vehicle {
  @override
  void startEngine() {
    print("Car engine started");
  }
}

class Bike extends Vehicle {
  @override
  void startEngine() {
    print("Bike engine started");
  }
}

void main() {
  var myCar = Car();
  myCar.startEngine();
  myCar.stopEngine();

  var myBike = Bike();
  myBike.startEngine();
  myBike.stopEngine();
}
