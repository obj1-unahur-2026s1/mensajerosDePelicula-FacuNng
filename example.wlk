import vehiculos.*

object empresaDeMensajeria {
  const mensajeros = []
  method mensajeros() = mensajeros 
  method contratarMensajero(mensajero) {
    mensajeros.add(mensajero)
  } 
  method despedirMensajero(mensajero) {
    mensajeros.remove(mensajero)
  } 
  method despedirATodosLosMensajeros() {
    mensajeros.clear()
  }
  method mensajeriaEsGrande() {
    return mensajeros.size() > 2
  } 
  method puedeEntregarPrimerEmpleado(destino) {
    return mensajeros.first().puedeLlevarPaquete(destino) 
  }
  method saberPesoUltimoMensajero() {
    return mensajeros.last().peso()   
  }  
}

object paquetito{
  method precio() = 0
  method estaPago() = true
  method puedeSerEntregado(mensajero, destino) {
    return true
  }   
  method cambiarPago() {

  } 
}

object paquetonViajero{
  const destinos = []
  var pago = 0

  
  method precio() {
    return 100 * destinos.size()
  } 
  method estaPago() {
    return self.precio() == pago
  }

  method agregarDestinos(destino) {
    destinos.add(destino)
  } 
  method cambiarPago(){
    pago = self.precio()
  }
  method cambiarPagoACuotas(pesos){
    pago += pesos
  }
  method puedeSerEntregado(destino, mensajero) {
    return destinos.all({ d => mensajero.puedeLlevarPaquete(d)}) and self.estaPago()
  } 
}

object paquete{
  var estaPago = true
  
  method precio() = 50 
  method cambiarPago() {
    estaPago = false
  }
  method estaPago() {
    return estaPago
  } 
  method puedeSerEntregado(mensajero, destino) {
    mensajero.puedeLlevarPaquete(destino) and estaPago
  } 
}


object roberto{
    var vehiculo = bicicleta

    method puedeLlamar() = false
    method cambiarTransporte(transporteNuevo) {
      vehiculo = transporteNuevo
    }
    method peso() {
      return self.pesoPropio() + vehiculo.peso()
    } 
    method pesoPropio() = 90 

    method puedeLlevarPaquete(destino) {
      return destino.dejarPasarA(self) and paquete.estaPago()
    } 
}

object chuckNorris{
  method puedeLlamar() = true 
  method peso() {
    return 80
  }
  method puedeLlevarPaquete(destino) {
      return destino.dejarPasarA(self) and paquete.estaPago()
    }
}

object neo{
  var credito = 10
  
  method peso(){

  }
  method puedeLlamar() {
    0 < credito
  }
  method cargarCredito(creditos){
    credito += creditos
  }
  method puedeLlevarPaquete(destino) {
      return destino.dejarPasarA(self) and paquete.estaPago()
    }
}


object puenteDeBrooklyn{
  method dejarPasarA(mensajero) {
    mensajero.peso() <= 1000
  } 
}

object matrix{
  method dejarPasarA(mensajero) {
    mensajero.puedeLlamar()
  } 
}