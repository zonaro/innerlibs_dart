import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:innerlibs/string_extensions.dart';

part 'brazil_tools.part.dart';

/// Contém métodos uteis para varias operações relacionadas com o Brasil
abstract interface class Brasil extends _Brasil {
  /// Lista contendo os nomes mais comuns no Brasil
  static List<String> get nomesComuns => [
        "Miguel",
        "Arthur",
        "Davi",
        "Gabriel",
        "Pedro",
        "Alice",
        "Sophia",
        "Sofia",
        "Manuela",
        "Isabella",
        "Laura",
        "Heitor",
        "Enzo",
        "Lorenzo",
        "Valentina",
        "Giovanna",
        "Giovana",
        "Maria Eduarda",
        "Beatriz",
        "Maria Clara",
        "Vinícius",
        "Rafael",
        "Lara",
        "Mariana",
        "Helena",
        "Mariana",
        "Isadora",
        "Lívia",
        "Luana",
        "Maria Luíza",
        "Luiza",
        "Ana Luiza",
        "Eduarda",
        "Letícia",
        "Lara",
        "Melissa",
        "Maria Fernanda",
        "Cecília",
        "Lorena",
        "Clara",
        "Gustavo",
        "Matheus",
        "João Pedro",
        "Breno",
        "Felipe",
        "Júlia",
        "Carolina",
        "Caroline",
        "Joaquim",
        "Enzo Gabriel",
        "Thiago",
        "Lucas",
        "Giovanni",
        "Bianca",
        "Sophie",
        "Antônio",
        "Benjamin",
        "Vitória",
        "Isabelly",
        "Amanda",
        "Emilly",
        "Maria Cecília",
        "Marina",
        "Analu",
        "Nina",
        "Júlia",
        "Gustavo Henrique",
        "Miguel",
        "Catarina",
        "Stella",
        "Miguel Henrique",
        "Guilherme",
        "Caio",
        "Maria Vitória",
        "Isis",
        "Heloísa",
        "Gabriela",
        "Eloá",
        "Agatha",
        "Arthur Miguel",
        "Luiza",
        "Pedro Henrique",
        "Ana Beatriz",
        "Ruan",
        "Sophia",
        "Lara",
        "Luana",
        "Bárbara",
        "Kaique",
        "Raissa",
        "Rafaela",
        "Maria Valentina",
        "Bernardo",
        "Mirella",
        "Leonardo",
        "Davi Lucas",
        "Luiz Felipe",
        "Emanuel",
        "Maria Alice",
        "Luana",
        "Luna",
        "Enrico"
      ];

  /// Lista contendo os sobrenomes mais comuns no Brasil
  static List<String> get sobrenomesComuns => [
        "Silva",
        "Santos",
        "Souza",
        "Oliveira",
        "Pereira",
        "Ferreira",
        "Alves",
        "Pinto",
        "Ribeiro",
        "Rodrigues",
        "Costa",
        "Carvalho",
        "Gomes",
        "Martins",
        "Araújo",
        "Melo",
        "Barbosa",
        "Cardoso",
        "Nascimento",
        "Lima",
        "Moura",
        "Cavalcanti",
        "Monteiro",
        "Moreira",
        "Nunes",
        "Sales",
        "Ramos",
        "Montenegro",
        "Siqueira",
        "Borges",
        "Teixeira",
        "Amaral",
        "Sampaio",
        "Correa",
        "Fernandes",
        "Batista",
        "Miranda",
        "Leal",
        "Xavier",
        "Marques",
        "Andrade",
        "Freitas",
        "Paiva",
        "Vieira",
        "Aguiar",
        "Macedo",
        "Garcia",
        "Lacerda",
        "Lopes"
      ];

  /// Gera um nome aleatório
  static String gerarNomeAleatorio({bool sobrenomeUnico = false}) {
    var random = Random();
    var s1 = sobrenomesComuns[random.nextInt(sobrenomesComuns.length)];
    var s2 = sobrenomesComuns[random.nextInt(sobrenomesComuns.length)];
    if (random.nextBool() || s1 == s2 || sobrenomeUnico) s2 = "";
    return "${nomesComuns[random.nextInt(nomesComuns.length)]} $s1 $s2".trim();
  }

  static final List<Estado> _estados = [];

  static bool validarCEP(String cep) {
    // Remover espaços e traços (se existirem)
    final cleanedCEP = cep.replaceAll(RegExp(r'[-\s]'), '');

    // Verificar se o CEP possui o tamanho correto
    if (cleanedCEP.length != 8) {
      return false;
    }

    // Verificar se todos os caracteres são dígitos
    if (!cleanedCEP.contains(RegExp(r'^\d{8}$'))) {
      return false;
    }

    // Se chegou até aqui, o CEP é válido
    return true;
  }

  /// Lista com todos os Estados do Brasil
  static List<Estado> get estados {
    if (_estados.isEmpty) {
      for (var v in _Brasil._br) {
        var e = Estado._fromJson(v);
        _estados.add(e);
      }
      _estados.sort();
    }
    return _estados.toList(growable: false);
  }

  /// Lista com todas as cidades do Brasil
  static List<Cidade> get cidades => estados.expand((e) => e.cidades).toList()..sort();

  /// pega um estado a partir do nome, UF ou IBGE
  static Estado? pegarEstado(String nomeOuUFOuIBGE) => pesquisarEstado(nomeOuUFOuIBGE).singleOrNull;

  /// Pesquisa um estado
  static List<Estado> pesquisarEstado(String nomeOuUFOuIBGE) {
    try {
      nomeOuUFOuIBGE = nomeOuUFOuIBGE.toLowerCase().trim();
      var l = estados.where((e) => e.nome.flatContains(nomeOuUFOuIBGE) || e.uf.flatEquals(nomeOuUFOuIBGE) || e.ibge.toString() == nomeOuUFOuIBGE.trim().substring(0, 2)).toList(growable: false);
      if (l.isEmpty) {
        l = estados.where((e) => e.cidades.any((c) => c.nome.flatEquals(nomeOuUFOuIBGE))).toList(growable: false);
      }
      return l;
    } catch (e) {
      return [];
    }
  }

  /// Pega uma cidade a partir do nome, UF ou IBGE e estado
  static Cidade? pegarCidade(String nomeCidadeOuIBGE, [String nomeOuUFOuIBGE = ""]) => (pesquisarCidade(nomeCidadeOuIBGE, nomeOuUFOuIBGE)).singleOrNull;

  /// Pesquisa uma cidade no Brasil todo ou em algum estado especifico se [nomeOuUFOuIBGE] for especificado
  static List<Cidade> pesquisarCidade(String nomeCidadeOuIBGE, [String? nomeOuUFOuIBGE]) {
    try {
      nomeCidadeOuIBGE = nomeCidadeOuIBGE.toLowerCase().removeDiacritics()?.trim() ?? "";
      Estado? e = pegarEstado(nomeCidadeOuIBGE);
      if (e == null && nomeOuUFOuIBGE!.trim() != "") {
        e = pegarEstado(nomeOuUFOuIBGE);
      }
      return (e?.cidades ?? (cidades)).where((c) => c.nome.flatContains(nomeCidadeOuIBGE) || c.ibge.toString().startsWith(nomeCidadeOuIBGE)).toList(growable: false);
    } catch (e) {
      return [];
    }
  }

  static Future<Endereco?> pesquisarCEP(String cep, [String numero = "", String complemento = ""]) async {
    final url = 'https://viacep.com.br/ws/$cep/json/';
    if (validarCEP(cep)) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          return Endereco.fromJson(data)
            ..numero = numero
            ..complemento = complemento;
        } else {
          debugPrint('Erro ao buscar endereço: ${response.statusCode} ${response.reasonPhrase}');
        }
      } catch (e) {
        debugPrint('Erro ao buscar endereço: $e');
      }
    }
    return null;
  }
}

class Endereco {
  final String cep;
  final String logradouro;
  String numero = "";
  String complemento;
  final String bairro;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  Endereco({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  Cidade? get cidade => Brasil.pegarCidade(ibge);
  Estado? get estado => cidade?.estado ?? Brasil.pegarEstado(ibge);

  factory Endereco.fromJson(Map<String, dynamic> json) => Endereco(
        cep: json['cep'],
        logradouro: json['logradouro'],
        complemento: json['complemento'],
        bairro: json['bairro'],
        ibge: json['ibge'],
        gia: json['gia'],
        ddd: json['ddd'],
        siafi: json['siafi'],
      );
}

class Estado implements Comparable<Estado> {
  final String nome;
  final String uf;
  final int ibge;
  final String regiao;
  final double latitude;
  final double longitude;
  final List<Cidade> cidades = [];

  static List<Estado> get pegarEstados => Brasil.estados;

  /// pega um estado a partir do nome, UF ou IBGE
  static Estado? pegar(String nomeOuUFOuIBGE) => Brasil.pegarEstado(nomeOuUFOuIBGE);

  /// Pesquisa um estado
  static List<Estado> pesquisar(String nomeOuUFOuIBGE) => Brasil.pesquisarEstado(nomeOuUFOuIBGE);

  Cidade get capital => cidades.firstWhere((e) => e.capital);

  @override
  int compareTo(other) => nome.compareTo(other.nome);

  @override
  String toString() => nome;

  @override
  int get hashCode => Object.hash(ibge, 0);

  Estado._(this.nome, this.uf, this.ibge, this.regiao, this.latitude, this.longitude);

  factory Estado._fromJson(Map<String, dynamic> json) {
    var e = Estado._(json['Nome'], json['UF'], json['IBGE'], json['Regiao'], json['Latitude'], json['Longitude']);
    json['Cidades'].forEach((v) {
      e.cidades.add(Cidade._fromJson(v, e));
    });
    return e;
  }

  Map<String, dynamic> toJson() => {'Nome': nome, 'UF': uf, 'IBGE': ibge, 'Regiao': regiao, 'Latitude': latitude, 'Longitude': longitude, 'Cidades': cidades.map((v) => v.toJson()).toList()};

  @override
  bool operator ==(Object other) {
    if (other is Estado) {
      return ibge == other.ibge;
    }

    if (other is Cidade) {
      return ibge == other.estado.ibge;
    }

    if (other is num) {
      return ibge == other.floor();
    }

    return false;
  }
}

class Cidade implements Comparable<Cidade> {
  final String nome;
  final bool capital;
  final int ibge;
  final int siafi;
  final int ddd;
  final String timeZone;
  final Estado estado;

  static List<Cidade> get pegarCidades => Brasil.cidades;

  /// Pega uma cidade a partir do nome, UF ou IBGE e estado
  static Cidade? pegar(String nomeCidadeOuIBGE, [String nomeOuUFOuIBGE = ""]) => Brasil.pegarCidade(nomeCidadeOuIBGE, nomeOuUFOuIBGE);

  /// Pesquisa uma cidade no Brasil todo ou em algum estado especifico se [nomeOuUFOuIBGE] for especificado
  static List<Cidade> pesquisar(String nomeCidadeOuIBGE, [String nomeOuUFOuIBGE = ""]) => Brasil.pesquisarCidade(nomeCidadeOuIBGE, nomeOuUFOuIBGE);

  @override
  String toString() => nome;

  Cidade._(this.nome, this.capital, this.ibge, this.siafi, this.ddd, this.timeZone, this.estado);

  factory Cidade._fromJson(Map<String, dynamic> json, Estado estado) => Cidade._(json['Nome'], json['Capital'], json['IBGE'], json['SIAFI'], json['DDD'], json['TimeZone'], estado);

  Map<String, dynamic> toJson() => {'Nome': nome, 'Capital': capital, 'IBGE': ibge, 'SIAFI': siafi, 'DDD': ddd, 'TimeZone': timeZone, "Estado": estado.uf};

  @override
  bool operator ==(Object other) {
    if (other is Cidade) {
      return ibge == other.ibge;
    }

    if (other is Estado) {
      return estado.ibge == other.ibge;
    }

    if (other is num) {
      return ibge == other.floor();
    }

    return false;
  }

  @override
  int get hashCode => Object.hash(ibge, 0);

  @override
  int compareTo(other) => nome.compareTo(other.nome);
}
