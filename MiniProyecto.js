use "MiniProyecto";

db.pasajeros.insertOne({
  id: "PAS001",  
  nombre: "María González",
  apellidos: "Rodríguez López",
  fechaNacimiento: ISODate("1985-04-12"),
  documento: {
    tipo: "DNI",
    numero: "12345678X"
  },
  contacto: {
    email: "maria.gonzalez@email.com",
    telefono: "+34612345678",
    direccion: {
      calle: "Calle Principal 123",
      ciudad: "Madrid",
      codigoPostal: "28001",
      pais: "España"
    }
  },
  preferencias: {
    asiento: "ventana",
    comida: "vegetariana"
  },
  fechaRegistro: ISODate("2023-01-15")
});


db.vuelos.insertOne({
  id: "VUELO001",  
  numeroVuelo: "IB3456",
  aerolinea: {
    codigo: "IB",
    nombre: "Iberia"
  },
  origen: {
    codigoIATA: "MAD",
    ciudad: "Madrid",
    pais: "España"
  },
  destino: {
    codigoIATA: "BCN",
    ciudad: "Barcelona",
    pais: "España"
  },
  fechaSalida: ISODate("2025-05-15T10:30:00Z"),
  fechaLlegada: ISODate("2025-05-15T11:45:00Z"),
  duracion: 75, 
  avion: {
    modelo: "Airbus A320",
    capacidad: 180
  },
  estado: "programado", 
  asientos: [
    { numero: "1A", clase: "business", disponible: true },
    { numero: "1B", clase: "business", disponible: false }
  ],
  precios: {
    economica: 120.50,
    business: 350.00
  }
});


db.reservas.insertOne({
  codigo: "RES12345",
  fechaReserva: ISODate("2025-04-01T14:30:00Z"),
  estado: "confirmada",  
  pasajero: "PAS001",  
  vuelo: "VUELO001",  
  asiento: "15C",
  clase: "economica",
  precio: 150.75,
  datosPago: {
    metodo: "tarjeta",
    referencia: "PAY789012",
    fechaPago: ISODate("2025-04-01T14:35:00Z")
  },
  serviciosAdicionales: [
    { tipo: "equipajeExtra", cantidad: 1, precio: 30.00 },
    { tipo: "seleccionAsiento", precio: 10.00 }
  ],
  checkIn: {
    realizado: false,
    fecha: null
  }
});


