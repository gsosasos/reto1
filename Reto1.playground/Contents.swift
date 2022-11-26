import UIKit

/**
 RETO SWIFT
 Teniendo ciertos datos de 6 personas, se crea una lista de personas que contenga datos como nombre, apellido paterno, apellido materno, fecha de nacimiento, nro de documento, sexo, correo, la cantidad de hermanos y usuario de cada persona.

 A partir de esta lista:

 - Obtener la persona con mayor y menor edad
 X Obtener dos listas más, una para hombres y otra mara mujeres e imprimir la cantidad de personas que hay en cada lista
 X Obtener una lista de todas las personas que tienen más de dos hermanos
 X Imprimir cada persona con este formato “Luis Inga M.” Solo primer nombre, ape pate completo y solo la inicial del ape mate más un punto. *Y EN CAPITALIZE* (primera letra de cada palabra en mayúscula y todo lo demás en minúscula)
 X Crear usuarios a todas las personas y guardar en la lista.

 NOTA

 No te vendrá el usuario de por sí, por lo que ese campo será nulo al inicio. Tendrás que obtenerlo a partir del correo. Si mi correo es luis.ingam@gmail.com, entonces mi usuario es  luis.ingam

 Lo obtengo con todo lo que hay antes de la arroba @
 */

class Persona {
    let nombre:String
    let apellido_paterno:String
    let apellido_materno:String
    let fecha_nac:String
    let dni:String
    let sexo:String
    let correo:String
    let cant_hermanos:Int
    let nombre_usuario: String? = nil
    
    // Formato requerido segun el reto
    var formatoNombre: String {
        let formatoRequerido = apellido_materno.prefix(1)
        return nombre + " " + apellido_paterno + " " + String(formatoRequerido) + "."
     }
    
    // Creamos formato de usuario
    
    var nombreUsuario: String {
       let firstSpace = correo.firstIndex(of: "@") ?? correo.endIndex
       let nombre_usuario = correo[..<firstSpace]
       return String(nombre_usuario)
    }
    
    init(nombre:String, apellido_paterno:String, apellido_materno:String, fecha_nac:String, dni:String, sexo:String, correo:String, cant_hermanos:Int) {
        self.nombre = nombre
        self.apellido_paterno = apellido_paterno
        self.apellido_materno = apellido_materno
        self.fecha_nac = fecha_nac
        self.dni = dni
        self.sexo = sexo
        self.correo = correo
        self.cant_hermanos = cant_hermanos
    }
    
   
}



var personas : [Persona] = []

func getPersonas() {
    personas.append(Persona(nombre: "Carlos", apellido_paterno: "Robles", apellido_materno: "Gomes", fecha_nac: "06/08/1995", dni: "78451245", sexo: "M", correo: "carlos.robles@hotmail.com", cant_hermanos: 2))
    personas.append(Persona(nombre: "Miguel", apellido_paterno: "Quispe", apellido_materno: "Otero", fecha_nac: "28/12/1995", dni: "79451654", sexo: "M", correo: "miguel.angel@gmail.com", cant_hermanos: 0))
    personas.append(Persona(nombre: "Karla", apellido_paterno: "Flores", apellido_materno: "Rosas", fecha_nac: "15/02/1997", dni: "77485812", sexo: "F", correo: "Karla.alexandra@hotmail.com", cant_hermanos: 1))
    personas.append(Persona(nombre: "Nicolas", apellido_paterno: "Quispe", apellido_materno: "Zeballos", fecha_nac: "08/10/1990", dni: "71748552", sexo: "M", correo: "nicolas123@gmail.com", cant_hermanos: 1))
    personas.append(Persona(nombre: "Pedro", apellido_paterno: "Picasso", apellido_materno: "Betancur", fecha_nac: "17/05/1994", dni: "74823157", sexo: "M", correo: "pedroandrepicasso@gotmail.com", cant_hermanos: 2))
    personas.append(Persona(nombre: "Fabiola", apellido_paterno: "Palacio", apellido_materno: "Vega", fecha_nac: "02/02/1992", dni: "76758254", sexo: "F", correo: "mailto:fabi@hotmail.com", cant_hermanos: 0))
    
    
}

// Obtener listas de hombres y mujeres
func getHombresYMujeres() {
    
    var hombres : [Persona] = []
    var mujeres : [Persona]  = []
    
    for persona in personas {
        if persona.sexo == "M" {
            hombres.append(persona)
        } else {
            mujeres.append(persona)
        }
    }
    
    print("Total de Hombres: \(hombres.count)"  )
    print("Total de Mujeres: \(mujeres.count)"  )

}

// Obtener listas de personas con mas de 2 hermanos
func getPersonasConMasde2Hermanos() {
    
    var personasConMas2deHermanos : [Persona] = []
    
    let mas2deHermanos = personas.filter { $0.cant_hermanos > 1}
        print("\n")
        print("Personas con más de un hermano")
        for p in mas2deHermanos{
            personasConMas2deHermanos.append(p)
            print(p.nombre)
        }
    //print("personasConMas2deHermanos
}

func calcularEdad(birthday: String) -> Int {
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "MM/dd/yyyy"
    let birthdayDate = dateFormater.date(from: birthday)
    let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
    let now = Date()
    let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
    let age = calcAge.year
    return age!
}

// Obtener la persona con mayor y menor edad
func getpersonasConMayoryMmenorEdad() {
    
    var personaMayor : [Persona] = []
    var mayorEdad  = 0;
    for persona in personas {
        var edad = calcularEdad(birthday: persona.fecha_nac)
        print (edad)
        if (edad > mayorEdad ) {
            //personaMayor = persona
        }
    }
    
    
    
}

// Imprimir nombres con el formato requerido
func getFormatoRequerido() {
    print("\n")
    print("Nombres con el formato requerido:")
    for p in personas {
        print(p.formatoNombre)
    }
}

// Imprimir nombres con el formato requerido
func getUsuarios() {
    print("\n")
    print("Nombres con el formato requerido:")
    for p in personas {
        print(p.nombreUsuario)
    }
}



//print("lista")

getPersonas()
getHombresYMujeres()
getPersonasConMasde2Hermanos()
//getpersonasConMayoryMmenorEdad()
getFormatoRequerido()
getUsuarios()

