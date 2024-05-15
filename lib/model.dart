class Producto {
  final int idProducto;
  final String nombre;
  final String descripcion;

  Producto({
    required this.idProducto,
    required this.nombre,
    required this.descripcion,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      idProducto: json['idProducto'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idProducto': idProducto,
      'nombre': nombre,
      'descripcion': descripcion,
    };
  }
}
