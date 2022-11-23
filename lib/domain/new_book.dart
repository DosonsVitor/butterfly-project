import 'package:flutter/material.dart';

import 'anotacao.dart';

class Book {
  late final String Nome;
  late final String Autor;
  late final String Sinopse;
  late final int Paginas;
  late final int PaginasLidas;
  late final int Status;
  late final Color Cor01;
  late final Color Cor02;

  Book({
    required this.Nome,
    required this.Autor,
    this.Sinopse = "",
    required this.Paginas,
    required this.PaginasLidas,
    this.Status = 1,
    this.Cor01 = Colors.black,
    this.Cor02 = Colors.black,
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