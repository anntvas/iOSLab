class Car {
    var brand: String
    var model: String
    var year: Int
    var enginePower: Int
    init (brand: String, model: String, year: Int, enginePower: Int) {
        self.brand = brand
        self.model = model
        self.year = year
        self.enginePower = enginePower
    }
    func infoToString() -> String {
        return "Марка: \(brand), модель: \(model), год выпуска: \(year), мощность двигателя: \(enginePower) л.с."
    }
}
class BMW: Car {
    var fuelСonsumption: Double

    init(model: String, year: Int, enginePower: Int, fuelConsumption: Double) {
        self.fuelСonsumption = fuelConsumption
        super.init (brand: "BMW", model: model, year: year, enginePower: enginePower)
    }

    override func infoToString() -> String {
        return super.infoToString() + ", расход топлива: \(fuelСonsumption) л/100км"
    }
}
class Audi: Car {
    var quattro: Bool

    init(model: String, year: Int, enginePower: Int, quattro: Bool) {
        self.quattro = quattro
        super.init (brand: "Audi", model: model, year: year, enginePower: enginePower)
    }
    override func infoToString() -> String {
        return super.infoToString() + ", использование систем постоянного полного привода: \(quattro)"
    }
}

class Mercedes: Car {
    var color: String

    init(model: String, year: Int, enginePower: Int, color: String) {
        self.color = color
        super.init(brand: "Mercedes", model: model, year: year, enginePower: enginePower)
    }
    override func infoToString() -> String {
        return super.infoToString() + ", цвет: \(color)"
    }
}

class Chevrolet: Car {
    var trunkVolume: Double

    init(model: String, year: Int, enginePower: Int, trunkVolume: Double) {
        self.trunkVolume = trunkVolume
        super.init(brand: "Chevrolet", model: model, year: year, enginePower: enginePower)
    }
    override func infoToString() -> String {
        return super.infoToString() + ", объём багажника: \(trunkVolume) л."
    }
}
func createCar () -> Car {
    var randomNumber = Int.random(in: 1...8)
    var randomEnginePower = Int.random(in: 100...500)
    switch randomNumber {
        case 1:
            return BMW(model: "X5", year: 2022, enginePower: randomEnginePower, fuelConsumption: 8.6)
        case 2:
            return Audi(model: "A6", year: 2021, enginePower: randomEnginePower, quattro: true)
        case 3:
            return Mercedes(model: "S-Class", year: 2023, enginePower: randomEnginePower, color: "white")
        case 4:
            return Chevrolet(model: "Malibu", year: 2012, enginePower: randomEnginePower, trunkVolume: 415.8)
        case 5:
            return Mercedes(model: "G-Class", year: 2018, enginePower: randomEnginePower, color: "black")
        case 6:
            return Audi(model: "R8", year: 2022, enginePower: randomEnginePower, quattro: true)
        case 7:
            return BMW(model: "M3", year: 2022, enginePower: randomEnginePower, fuelConsumption: 10.5)
        case 8:
            return Audi(model: "Q7", year: 2020, enginePower: randomEnginePower, quattro: true)
    default:
        return Car(brand: "Unknown", model: "Unknown", year: 2016, enginePower: Int.random(in: 100...300))
    }
}
func createArrayOfCars() -> [Car] {
    let car1 = createCar()
    let car2 = createCar()
    let car3 = createCar()
    let car4 = createCar()
    let car5 = createCar()
    let car6 = createCar()
    return [car1, car2, car3, car4, car5, car6]
}

func raceBetween(car1: Car, car2: Car) -> Car {
    if car1.enginePower != car2.enginePower {
        return car1.enginePower > car2.enginePower ? car1 : car2
    } else {
        return car1.year >= car2.year ? car1 : car2
    }
}

func compareByRace(cars: [Car]) -> Car {
    var winner: Car = cars[0]
    for i in 1..<cars.count {
        winner = raceBetween(car1: winner, car2: cars[i])
    }
    return winner
}

func race(cars: [Car]) {
    var raceCars = cars
    var winners: [Car] = []
    if raceCars.count % 2 != 0 {
        print("Для проведения гонок необходимо чётное число автомобилей. Добавим ещё одну машину.")
        raceCars.append(BMW(model: "X6", year: 2021, enginePower: 340, fuelConsumption: 9.0))
    }
    
    print("Начинаем гонки между машинами...\n")
    var round = 1
    while raceCars.count > 1 {
        let i = Int.random(in: 0..<raceCars.count)
        let car1 = raceCars[i]
        raceCars.remove(at: i)
        let j = Int.random(in: 0..<raceCars.count)
        let car2 = raceCars[j]
        raceCars.remove(at: j)
        let winner = raceBetween(car1: car1, car2: car2)
        winners.append(winner)
        print("Гонки между \(car1.brand) \(car1.model) и \(car2.brand) \(car2.model)\nПобедитель:\n\(winner.infoToString())\n************")
    }
    var finalWinner : Car = compareByRace(cars: winners)
    print("Финальный победитель:\n\(finalWinner.infoToString())")
        
}


var carsArr: [Car] = createArrayOfCars()
race(cars: carsArr)

