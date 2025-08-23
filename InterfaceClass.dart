interface class vehicle {
  void startEngine() {
    print("Engine started");
  }

  void stopEngine() {
    print("Engine stopped");
  }
}

// Extending the interface class
class Car extends vehicle {
  @override
  void startEngine() {
    super.startEngine();
  }

  @override
  void stopEngine() {
    super.stopEngine();
  }
}

// Another class implementing the interface class
class Bike implements vehicle {
  @override
  void startEngine() {
    print("Bike engine started");
  }

  @override
  void stopEngine() {
    print("Bike engine stopped");
  }
}

// Main function to demonstrate the usage
void main() {
  print("Interface Class Extends:");
  var myCar = Car();
  myCar.startEngine();
  myCar.stopEngine();

  print("Interface Class Implements:");
  var myBike = Bike();
  myBike.startEngine();
  myBike.stopEngine();
}
