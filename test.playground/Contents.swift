protocol Vehicle {
    var speed: Float { get }
    var type: String { get }
    func travelTime(distant: Float) -> Float
}

class Car: Vehicle {
    internal var speed: Float = 240
    internal var type: String = "Car"
}

class Bike: Vehicle {
    internal var speed: Float = 20
    internal var type: String = "Bike"
}


extension Vehicle {
    func travelTime(distant: Float) -> Float {
        return Float(distant/speed)
    }
}