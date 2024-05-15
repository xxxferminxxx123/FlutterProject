class Local {
  final int idLocal;
  final String nombre;
  final String direccion;
  final String foto;


  Local({
    required this.idLocal,
    required this.nombre,
    required this.direccion,
    required this.foto

  });

  factory Local.fromJson(Map<String, dynamic> json) {
    return Local(
      idLocal: json['idLocal'],
      nombre: json['nombre'],
      direccion: json['direccion'],
      foto: json['foto'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idLocal': idLocal,
      'nombre': nombre,
      'direccion': direccion,
      'foto': foto,

    };
  }
}
