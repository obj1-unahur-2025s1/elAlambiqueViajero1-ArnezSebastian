object luke {
    var cantidadViajes = 0
    var vehiculoAConducir = alambiqueVeloz
    var recuerdo = null //Indica que el valor es nulo.
    //const vidaluke = 1
    method cuantosViajes() = cantidadViajes
    /*
        method visitar() {
        cantidadViajes = cantidadViajes + 1
    }
    */
    method vehiculoAConducir() = vehiculoAConducir
    method subirA(vehiculoASubir) {
        vehiculoAConducir = vehiculoASubir
    }
    method viajar_Con_(lugar, vehiculo) {
        if (lugar.puedeLlegarCon(vehiculo) ) { //Polimofismo: Una única pregunta, que varía su respuesta según los métodos de distintos objetos.
            cantidadViajes = cantidadViajes + 1 //geter = convención de poner el mismo nombre del método y la variable
            recuerdo = lugar.recuerdoTipico()
            vehiculo.consumirCombustible()
        }
    }
    method recuerdo() = recuerdo
}

// VEHÍCULOS:
object alambiqueVeloz {
    var combustible = 100
    const consumoPorViaje = 10
    method cuantoConsumePorViaje() = consumoPorViaje
    method tieneCombustible() = combustible > consumoPorViaje
    method consumirCombustible() {
        combustible = combustible - consumoPorViaje
    }
    method esRapido() = true
}

object superChatarraEspecial {
    /*
    var combustible = 200
    var municionesDeCanion = combustible / 2
    const consumoPorViaje = 20
    method tieneCombustible() = (municionesDeCanion *2) > consumoPorViaje
    method consumirCombustible() {
        combustible = combustible - consumoPorViaje
    }
    */
    var distanciaRecorrida = 0
    var cantidadDeCañones = 3
    var municionesDeCañon = 300
    const consumoDeMunicionIndividual = 5
    var consumoPorViaje =  consumoDeMunicionIndividual * cantidadDeCañones
    method cuantosCañonesTiene() = cantidadDeCañones
    method cuantoConsumePorViaje() = consumoPorViaje
    method tieneCombustible() = municionesDeCañon > consumoPorViaje
    method inutilizarCañonSegunDistanciaRecorrida() {
        if(distanciaRecorrida == 40) {
            cantidadDeCañones = cantidadDeCañones - 1
            consumoPorViaje = consumoDeMunicionIndividual * cantidadDeCañones
        }
    }
    method consumirCombustible() {
        distanciaRecorrida = distanciaRecorrida + 10
        municionesDeCañon = municionesDeCañon - consumoPorViaje
        self.inutilizarCañonSegunDistanciaRecorrida()
    }
    method esRapido() = true
}

object antiguallaBlindada {
    var combustible = 100
    var velocidad = 80
    var cantidadGansters = 5
    const pesoGansgsters = 20
    var consumoPorViaje = 10
    method cuantoConsumePorViaje() = consumoPorViaje
    method cuantaVelocidadTiene() = velocidad
    method tieneCombustible() = combustible > consumoPorViaje
    method bajarGangsterEnDestinoSiQuedan() {
        if (cantidadGansters != 0) {
            cantidadGansters = cantidadGansters - 1
            velocidad += pesoGansgsters
            consumoPorViaje = consumoPorViaje - ((velocidad *1)/100)
        }
    }
    /*
    method bajarGangsterEnDestinoSiQuedan() {
        cantidadGansters = (cantidadGansters - 1).max(0)
        velocidad += pesoGansgsters
        consumoPorViaje = consumoPorViaje - ((velocidad *1)/100)
    }
    */
    method consumirCombustible() {
        combustible = combustible - consumoPorViaje
        self.bajarGangsterEnDestinoSiQuedan()
    }
    method esRapido() {
        return velocidad >= 120
        &&
        velocidad <= 180
    }
}

object superConvertible {
    var vehiculo = alambiqueVeloz
    /*
    if (vehiculo = antiguallaBlindada) {
        var velocidad = 80
        var cantidadGangsters = 5
        const pesoGangsters = 10
    }
    */
    method esElVehiculo() = vehiculo 
    method cuantoConsumePorViaje() = vehiculo.cuantoConsumePorViaje()
    //var combustible = vehiculo.tieneCombustible()
    const combustible = vehiculo.tieneCombustible()
    method convertirEn(nuevo) {
        vehiculo = nuevo
    }
    method tieneCombustible() = combustible
    method consumirCombustible() = vehiculo.consumirCombustible()
    method esRapido() = vehiculo.esRapido()
}

//DESTINOS TURÍSTICOS:
object paris {
    method recuerdoTipico() = "Llavero Torre Eifel"
    method puedeLlegarCon(vehiculo) = vehiculo.tieneCombustible()
}

object buenosAires {
    var presidenteActual = charly
    method presidenteActual() = presidenteActual
    method nombrarPresidente(presidenteNuevo) {
        presidenteActual = presidenteNuevo
    }
    method recuerdoTipico() = presidenteActual.recuerdoTipico()
    //method recuerdoTipico() = "Mate" //Polimorfismo = el uso del mismo método en distintos objetos
    /*
    method recuerdoTipico() {
        if (presidenteActual = "Charly") {
            return "Mate sin Yerba"
        }
        else {
            return "Mate con Yerba"
        }
    }
    */
    method puedeLlegarCon(vehiculo) = vehiculo.esRapido()
}

//PRESIDENTES:
object charly {
    const recuerdoTipico = "Mate sin Yerba"
    method recuerdoTipico() = recuerdoTipico
}

object leo {
    const recuerdoTipico = "Mate con Yerba"
    method recuerdoTipico() = recuerdoTipico
}

//OTROS PAISES:
object bagdad {
    var recuerdo = "Bidón con Petróleo Crudo" // En bagdad el recuerdo puede variar.
    method recuerdoTipico() = recuerdo
    method recuerdo(nuevo) {
        recuerdo = nuevo
    }
    method puedeLlegarCon(vehiculo) = true
}

object lasVegas {
    var homenaje = paris
    method homenajear(lugar) {
        homenaje = lugar
    }
    method recuerdoTipico() = homenaje.recuerdoTipico()
    /*
    method puedeLlegarCon(vehiculo) {
        return homenaje.puedeLlegarCon(vehiculo)
    }
    */
    method puedeLlegarCon(vehiculo) = homenaje.puedeLlegarCon(vehiculo)
}

object hongKong {
    method recuerdoTipico() = "Estatuilla Dorada de Gran Buda"
    /*
    method puedeLlegarCon(vehiculo) {
        return 
            vehiculo.esRapido()
            &&
            vehiculo.tieneCombustible() 
    }
    */
    method puedeLlegarCon(vehiculo) = vehiculo.esRapido() && vehiculo.tieneCombustible()
}