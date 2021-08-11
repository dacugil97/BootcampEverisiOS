
// FUNCIÓN QUE DEVUELVE OTRA
func adder(number: Int) -> (Int) -> Int {
    // 1
    func add(x: Int) -> Int {
        return x + number
    }

    // 2
    return add
}

let add10 = adder(number: 10)

add10(20)


// NESTED FUNCTIONS
let digits = [1,4,10,15]
let even = digits.filter { $0 % 2 == 0 }
let odd = digits.filter { $0 % 2 == 1 }
print("even", even)
print("odd", odd)

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


// FUNCION DE VARIABLE SIN NOMBRE Y CON DEFAULT
func sinNombre(_ number: Int = 10) {
    print(7 + number)
}

sinNombre(8)
sinNombre()


// VARIABLES MULTIPLES
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    print(numbers[1])
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)


// INOUT
var a = 7
func change(number: inout Int) {
    number = 8
}

change(number: &a)
print(a)


