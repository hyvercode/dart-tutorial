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
class Bike extends vehicle {
  @override
  void startEngine() {
    super.startEngine();
  }

  @override
  void stopEngine() {
    super.stopEngine();
  }
}

// Main function to demonstrate the usage
void main() {
  var myCar = Car();
  myCar.startEngine();
  myCar.stopEngine();

  var myBike = Bike();
  myBike.startEngine();
  myBike.stopEngine();
}
