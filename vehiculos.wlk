object bicicleta{
    method peso() = 5 
}

object camion{
    var cantidadDeAclopados = 1
    
    method peso() {
        cantidadDeAclopados * 500
    } 
    method cambiarCantidadAclopados(nuevaCantidad) {
      cantidadDeAclopados = nuevaCantidad
    }
}