class Note {
  late final String Id;
  late final String Anotacao;
  late final int Pagina;
  late final int LivroId;
  late final int Tipo;

  Note({
    required this.Id,
    required this.Anotacao,
    required this.Pagina,
    required this.LivroId,
    required this.Tipo
  });

  Note.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    Anotacao = json['notation'];
    Pagina = json['page'];
    LivroId = json['book_id'];
    Tipo = json['type_id'];
  }

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = Id;
    data['notation'] = Anotacao;
    data['page'] = Pagina;
    data['book_id'] = LivroId;
    data['type_id'] = Tipo;

    return data;
  }
}