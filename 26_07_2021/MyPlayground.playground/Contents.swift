import UIKit


// MARK: - TIPOS BÁSICOS

var nombre: String = "Pepe" // var -> Propiedad mutable
let apellido: String = "Rodriguez"  //let -> propiedad inmutable

nombre = "Felipe"

let profesion = "iOS Developer"
print(profesion)

print("El Sr. \(nombre + apellido), es \(profesion)")

var numeroA: Int = 4
var numeroB = 3.5

var multiplicacion = Double(numeroA) * numeroB

typealias enteroDavid = Int

var numeroC: enteroDavid = 5

multiplicacion = multiplicacion + Double(numeroC)

var numeroH = 1, numeroG = 4, numeroL = 5

var numeroD = 0

numeroD = 2 * 5 + 7
numeroD += 1

print(numeroD)

numeroD -= 10

var sino: Bool = true

if (sino){
    print("correcto")
}else{
    print("incorrecto")
}

if nombre.isEmpty || apellido.isEmpty {
    print("Coloca datos")
} else {
    print("Datos colocados")
}

var resultado = numeroD != 0 ? numeroA / Int(numeroB) : 0

print(resultado)

// MARK: - STRINGS - CHARACTERS

var emptyString = ""

var anotherEmptyString = String()

var despedida = "Hola"

emptyString.isEmpty
despedida.isEmpty

var mutable = "David"

mutable += "Cuñado"

for index in despedida {
    print(index)
}

let exclamacion: Character = "!"

despedida += String(exclamacion)

var categoriaCaracteres: [Character] = ["a", "b", "c"]

categoriaCaracteres.append("d")

var catString = String(categoriaCaracteres)

let animalesInusuales = "Koala, finguino, dromedarius"

print("Animales \(animalesInusuales.count) caracteres")

var bienvenido = "Hola"

bienvenido.insert("!", at: bienvenido.endIndex)

// MARK: - ARRAYS

var iPhones = ["iPhone 4", "iPhone 5", "iPhone XR", "iPhone X"]

var iPads = ["iPad Air", "iPad Pro", "iPad mini retina"]

var dispositivos = iPhones + iPads

dispositivos.append("MacBook Pro")
dispositivos.insert("iWatch", at: 0)

dispositivos.remove(at: 5)

dispositivos.sort(by: >)

let iPhone5 = dispositivos[3]

let aux = dispositivos.filter{
    $0.contains("iP")
}

print(aux)

// MARK: - DICCIONARIOS

var diccionario: [String: Any] = [:]
var otroDiccionario = Dictionary<String, Any>()

var coche: [String: String] = ["marca": "Renault",
                               "modelo": "megane",
                               "potencia": "145 caballos"]

let marca = coche["marca"]

if coche["modelo"] != nil {
    print(coche["modelo"]!)
}

if let modelo = coche["modelo"] {
    print(modelo)
    print(marca ?? "")
}

for (clave, valor) in coche {
    print("Clave: \(clave) y valor: \(valor)")
}

for clave in coche.keys {
    print(clave)
}
for valor in coche.values {
    print(valor)
}


// MARK: - Opcionales

var numeroEntero = 4

var numeroString = "3"

var sumaIntStr = numeroEntero + Int(numeroString)!

var nombreAA: String? = "David"


// MARK: - Funciones

func saludar(mensaje: String){
    print(mensaje)
}

saludar(mensaje: "holaaa")







