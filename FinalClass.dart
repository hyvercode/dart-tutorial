final class vehile {
  void startEngine() {
    print("Engine started");
  }

  void stopEngine() {
    print("Engine stopped");
  }
}

// Extending the final class error canont be extended
class Car extends vehile {
  @override
  void startEngine() {
    super.startEngine();
  }

  @override
  void stopEngine() {
    super.stopEngine();
  }
}

// Impelement the final class error canont be extended
class Bike implements vehile {
  @override
  void startEngine() {
    print("Bike engine started");
  }

  @override
  void stopEngine() {
    print("Bike engine stopped");
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
