use "ConsultasNoSQL";

db.clientes.insertMany([
    {nombre:"Juan",email:"JuanLopez@yahoo.com",edad:39},
    {nombre:"Jose",email:"JoseSanchez@yahoo.com",edad:35},
    {nombre:"Jorge",email:"BoquitaPasion090@yahoo.com",edad:47},
])

db.clientes.find({
    edad: {
        $gt: 30
    }
});

db.clientes.updateOne(
  { nombre: "Juan" },
  { $set: { email: "JuanLopez.nuevo@yahoo.com" } }
);

db.clientes.deleteOne({ email: "JoseSanchez@yahoo.com" });

db.pedidos.insertMany([
  { clienteId: "1", producto: "Laptop", precio: 1200 },
  { clienteId: "2", producto: "Teclado", precio: 45 },
  { clienteId: "1", producto: "Monitor", precio: 300 }
]);

db.pedidos.find({ clienteId: "1" });

db.pedidos.find({ precio: { $gt: 100 } });

db.createCollection("usuariosMayoresDeEdad", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["nombre", "email", "edad"],
      properties: {
        edad: {
          bsonType: "int",
          minimum: 18,
          description: "La edad debe ser un número mayor a 18"
        },
        nombre: {
          bsonType: "string",
          description: "El nombre es obligatorio y debe ser un string"
        },
        email: {
          bsonType: "string",
          pattern: "^.+@.+$",
          description: "El email debe ser un string válido"
        }
      }
    }
  }
});

db.clientes.updateMany(
  {},
  { $set: { activo: true } }
);

