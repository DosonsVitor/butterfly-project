import 'package:flutter/material.dart';

import 'anotacao.dart';

class Book {
  late final String Nome;
  late final String Autor;
  late final String Sinopse;
  late final int Paginas;
  late final int PaginasLidas;
  late final int Status;

  Book({
    required this.Nome,
    required this.Autor,
    this.Sinopse = "",
    required this.Paginas,
    required this.PaginasLidas,
    this.Status = 1
  });

  Book.fromJson(Map<String, dynamic> json) {
    Nome = json['nome'];
    Autor = json['autor'];
    Sinopse = json['sinopse'];
    Paginas = json['paginas'];
    PaginasLidas = json['paginas_lidas'];
    Status = json['status_id'];
  }

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['nome'] = Nome;
    data['autor'] = Autor;
    data['sinopse'] = Sinopse;
    data['paginas'] = Paginas;
    data['paginas_lidas'] = PaginasLidas;
    data['status_id'] = Status;

    return data;
  }
}