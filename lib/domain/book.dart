class Book {
  late final int Id;
  late final String Nome;
  late final String Autor;
  late final String Genero;
  late final String Sinopse;
  late final String MotivacaoLeitura;
  late final int Paginas;
  late final int PaginasLidas;
  late final int Status;
  late final String Cor1;
  late final String Cor2;
  late final String IconeURL;

  Book({
    required this.Id,
    required this.Nome,
    required this.Autor,
    this.Genero = "Indefinido",
    this.Sinopse = "",
    required this.Paginas,
    required this.PaginasLidas,
    this.Status = 1,
    this.Cor1 = "",
    this.Cor2 = "",
    this.IconeURL = "https://i.ibb.co/jyfnRT5/open-book.png"
  });

  Book.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    Nome = json['nome'];
    Autor = json['autor'];
    Sinopse = json['sinopse'];
    Paginas = json['paginas'];
    PaginasLidas = json['paginas_lidas'];
    Status = json['status_id'];
    Cor1 = json['cor1'];
    Cor2 = json['cor2'];
    IconeURL = json['icon_url'];
  }

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = Id;
    data['nome'] = Nome;
    data['autor'] = Autor;
    data['sinopse'] = Sinopse;
    data['paginas'] = Paginas;
    data['paginas_lidas'] = PaginasLidas;
    data['status_id'] = Status;
    data['cor1'] = Cor1;
    data['cor2'] = Cor2;
    data['icon_url'] = IconeURL;

    return data;
  }
}