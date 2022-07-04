import 'package:butterfly_project/domain/book.dart';
import 'package:butterfly_project/widget/book_card.dart';
import 'package:flutter/material.dart';

List<BookCard> readList = [
  BookCard(
      book: Book(
          Nome: "Tartarugas até lá embaixo",
          Autor: "John Green",
          Sinopse:
              "A história acompanha a jornada de Aza Holmes, uma menina de 16 anos que sai em busca de um bilionário misteriosamente desaparecido – quem encontrá-lo receberá uma polpuda recompensa em dinheiro – enquanto tenta lidar com o próprio transtorno obsessivo-compulsivo (TOC).",
          Cor01: Colors.orange,
          Cor02: Colors.orange,
          Paginas: 230,
          PaginasLidas: 0,
          Icon: Icons.business)),
  BookCard(
      book: Book(
          Nome: "Harry Potter e o prisioneiro de Azkaban",
          Autor: "JKR",
          Sinopse:
              "É o início do terceiro ano na escola de bruxaria Hogwarts. Harry, Ron e Hermione têm muito o que aprender. Mas uma ameaça ronda a escola e ela se chama Sirius Black. Após doze anos encarcerado na prisão de Azkaban, ele consegue escapar e volta para vingar seu mestre, Lord Voldemort. Para piorar, os Dementores, guardas supostamente enviados para proteger Hogwarts e seguir os passos de Black, parecem ser ameaças ainda mais perigosas.",
          Cor01: Colors.deepPurple,
          Cor02: Color.fromARGB(255, 100, 18, 138),
          Paginas: 320,
          PaginasLidas: 0,
          Icon: Icons.castle))
];

List<BookCard> reading = [
  BookCard(
      book: Book(
          Nome: "Quem é você Alaska?",
          Autor: "John Green",
          Sinopse:
              "Miles Halter levava uma vidinha sem graça e sem muitas emoções (ou amizades) na Flórida. Ele tinha um gosto peculiar: memorizar as últimas palavras de grandes personalidades da história. Uma dessas personalidades, François Rabelais, escritor do século XVI, disse no leito de morte que ia “em busca de um Grande Talvez”. Para não ter que esperar a morte para encontrar seu Grande Talvez, Miles decide fazer as malas e partir. Ele vai para Culver Creek, um internato no ensolarado Alabama.",
          Cor01: Colors.black,
          Cor02: Colors.black,
          Paginas: 230,
          PaginasLidas: 120,
          Icon: Icons.ac_unit)),
  BookCard(
      book: Book(
          Nome: "Harry Potter e a pedra filosofal",
          Autor: "JKR",
          Sinopse:
              "Harry Potter é um garoto órfão que vive infeliz com seus tios, os Dursleys. Ele recebe uma carta contendo um convite para ingressar em Hogwarts, uma famosa escola especializada em formar jovens bruxos. Inicialmente, Harry é impedido de ler a carta por seu tio, mas logo recebe a visita de Hagrid, o guarda-caça de Hogwarts, que chega para levá-lo até a escola. Harry adentra um mundo mágico que jamais imaginara, vivendo diversas aventuras com seus novos amigos, Rony Weasley e Hermione Granger.",
          Cor01: Colors.orange,
          Cor02: Colors.amber,
          Paginas: 310,
          PaginasLidas: 200,
          Icon: Icons.bolt))
];

List<BookCard> paused = [
  BookCard(
      book: Book(
          Nome: "O sorriso da hiena",
          Autor: "Arthur Ávila",
          Sinopse:
              "Para saber se é um homem cruel por ter testemunhado o brutal assassinato de seus pais quando tinha apenas oito anos, David planeja repetir com outras famílias o mesmo que aconteceu com a sua, dando a William a chance de acompanhar o crescimento das crianças órfãs e descobrir a influência desse trauma no desenvolvimento delas.",
          Cor01: Colors.deepOrange,
          Cor02: Colors.deepOrange,
          Paginas: 300,
          PaginasLidas: 100,
          Icon: Icons.computer)),
  BookCard(
      book: Book(
          Nome: "Percy Jackson e o ladrão de raios",
          Autor: "Rick Riordan",
          Sinopse:
              "A vida do adolescente Percy Jackson, que está sempre pronto para entrar em uma confusão, torna-se bem mais complicada quando ele descobre que é filho do deus grego Poseidon. Em um campo de treinamento para filhos das divindades, Percy aprende a tirar proveito de seus poderes divinos e se preparea para a maior aventura de sua vida.",
          Cor01: Color.fromARGB(255, 4, 155, 130),
          Cor02: Color.fromARGB(255, 10, 204, 107),
          Paginas: 350,
          PaginasLidas: 290,
          Icon: Icons.bolt))
];

List<BookCard> read = [
  BookCard(
      book: Book(
          Nome: "A culpa é das estrelas",
          Autor: "John Green",
          Sinopse:
              "Hazel Grace Lancaster e Augustus Waters são dois adolescentes que se conhecem em um grupo de apoio para pacientes com câncer. Por causa da doença, Hazel sempre descartou a ideia de se envolver amorosamente, mas acaba cedendo ao se apaixonar por Augustus. Juntos, eles viajam para Amsterdã, onde embarcam em uma jornada inesquecível.",
          Cor01: Colors.blue,
          Cor02: Colors.blue,
          Paginas: 230,
          PaginasLidas: 230,
          Icon: Icons.cloud)),
  BookCard(
      book: Book(
          Nome: "Harry Potter e o calice de fogo",
          Autor: "JKR",
          Sinopse:
              "Harry retorna para seu quarto ano na Escola de Magia e Bruxaria de Hogwarts, junto com os seus amigos Ron e Hermione. Desta vez, acontece um torneio entre as três maiores escola de magia, com um participante selecionado de cada escola, pelo Cálice de Fogo. O nome de Harry aparece, mesmo não tendo se inscrito, e ele precisa competir.",
          Cor01: Colors.orange,
          Cor02: Colors.amber,
          Paginas: 310,
          PaginasLidas: 310,
          Icon: Icons.local_fire_department))
];

List<BookCard> all = [
  readList[0],
  readList[1],
  read[0],
  read[1],
  reading[0],
  reading[1],
  paused[0],
  paused[1]
];
