import 'package:innerlibs/innerlibs.dart';

enum Regiao {
  naoDefinido(0),
  norte(1),
  nordeste(2),
  centroOeste(3),
  sudeste(4),
  sul(5),
  nacional(91),
  exportacao(99);

  final int value;

  const Regiao(this.value);

  bool get regiaoReal => isIn(Brasil.regioes);

  /// Retorna uma lista de regiões.
  static List<Regiao> get pegarRegioes => [norte, nordeste, centroOeste, sudeste, sul];

  /// Retorna uma lista de cidades desta região
  Future<Iterable<Cidade>> get cidades async {
    if (this == nacional) {
      return await Brasil.cidades;
    }
    if (this == exportacao || this == naoDefinido) {
      return [];
    }

    return (await Brasil.cidades).where((e) => e.regiao == this);
  }

  /// Retorna uma lista de cidades capitais desta região
  Future<Iterable<Cidade>> get capitais async => (await cidades).where((e) => e.capital);

  /// Retorna uma lista de estados desta região
  Iterable<Estado> get estados {
    if (this == nacional) {
      return Estado.pegarEstados;
    }
    if (this == exportacao || this == naoDefinido) {
      return [];
    }

    return Brasil.estados.where((e) => e.regiao == this);
  }

  factory Regiao.fromValue(int value) {
    switch (value) {
      case 1:
        return norte;
      case 2:
        return nordeste;
      case 3:
        return centroOeste;
      case 4:
        return sudeste;
      case 5:
        return sul;
      case 91:
        return nacional;
      case 99:
        return exportacao;
      default:
        return naoDefinido;
    }
  }

  @override
  String toString() {
    switch (this) {
      case norte:
        return 'Norte';
      case nordeste:
        return 'Nordeste';
      case centroOeste:
        return 'Centro-Oeste';
      case sudeste:
        return 'Sudeste';
      case sul:
        return 'Sul';
      case nacional:
        return 'Nacional';
      case exportacao:
        return 'Exportação';
      default:
        return 'Não definido';
    }
  }

  static Regiao pegar(dynamic value) {
    if (value == null) {
      return naoDefinido;
    }

    if (value is Regiao) return value;

    if (value is String) {
      if (value.isNumericOnly) {
        value = int.parse(value);
      } else {
        value = value.toLowerCase().removeAny([" ", "-", "_"]);
      }
    }
    if (value is num) {
      value = value.floor();
    }
    switch (value) {
      case 1:
      case "norte":
        return norte;
      case 2:
      case "nordeste":
        return nordeste;
      case 3:
      case "centrooeste":
        return centroOeste;
      case 4:
      case "sudeste":
        return sudeste;
      case 5:
      case "sul":
        return sul;
      case 91:
      case "nacional":
        return nacional;
      case 99:
      case "exportacao":
        return exportacao;
      default:
        return naoDefinido;
    }
  }
}

/// Classe que representa um estado.
enum Estado implements Comparable<Estado> {
  /// 12 - Acre - AC
  ac(12, -8.77, -70.55, 'Acre', 'AC', Regiao.norte),

  /// 27 - Alagoas - AL
  al(27, -9.71, -35.73, 'Alagoas', 'AL', Regiao.nordeste),

  /// 16 - Amapá - AP
  ap(16, 1.41, -51.77, 'Amapá', 'AP', Regiao.norte),

  /// 13 - Amazonas - AM
  am(13, -3.47, -65.10, 'Amazonas', 'AM', Regiao.norte),

  /// 29 - Bahia - BA
  ba(29, -12.96, -38.51, 'Bahia', 'BA', Regiao.nordeste),

  /// 23 - Ceará - CE
  ce(23, -3.71, -38.54, 'Ceará', 'CE', Regiao.nordeste),

  /// 53 - Distrito Federal - DF
  df(53, -15.83, -47.86, 'Distrito Federal', 'DF', Regiao.centroOeste),

  /// 32 - Espírito Santo - ES
  es(32, -19.19, -40.34, 'Espírito Santo', 'ES', Regiao.sudeste),

  /// 52 - Goiás - GO
  go(52, -16.64, -49.31, 'Goiás', 'GO', Regiao.centroOeste),

  /// 21 - Maranhão - MA
  ma(21, -2.55, -44.30, 'Maranhão', 'MA', Regiao.nordeste),

  /// 51 - Mato Grosso - MT
  mt(51, -12.64, -55.42, 'Mato Grosso', 'MT', Regiao.centroOeste),

  /// 50 - Mato Grosso do Sul - MS
  ms(50, -20.51, -54.54, 'Mato Grosso do Sul', 'MS', Regiao.centroOeste),

  /// 31 - Minas Gerais - MG
  mg(31, -18.10, -44.38, 'Minas Gerais', 'MG', Regiao.sudeste),

  /// 15 - Pará - PA
  pa(15, -5.53, -52.29, 'Pará', 'PA', Regiao.norte),

  /// 25 - Paraíba - PB
  pb(25, -7.06, -35.55, 'Paraíba', 'PB', Regiao.nordeste),

  /// 41 - Paraná - PR
  pr(41, -24.89, -51.55, 'Paraná', 'PR', Regiao.sul),

  /// 26 - Pernambuco - PE
  pe(26, -8.28, -35.07, 'Pernambuco', 'PE', Regiao.nordeste),

  /// 22 - Piauí - PI
  pi(22, -6.60, -42.28, 'Piauí', 'PI', Regiao.nordeste),

  /// 33 - Rio de Janeiro - RJ
  rj(33, -22.84, -43.15, 'Rio de Janeiro', 'RJ', Regiao.sudeste),

  /// 24 - Rio Grande do Norte - RN
  rn(24, -5.22, -36.52, 'Rio Grande do Norte', 'RN', Regiao.nordeste),

  /// 43 - Rio Grande do Sul - RS
  rs(43, -30.01, -51.22, 'Rio Grande do Sul', 'RS', Regiao.sul),

  /// 11 - Rondônia - RO
  ro(11, -11.22, -62.80, 'Rondônia', 'RO', Regiao.norte),

  /// 14 - Roraima - RR
  rr(14, 1.89, -61.22, 'Roraima', 'RR', Regiao.norte),

  /// 42 - Santa Catarina - SC
  sc(42, -27.33, -49.44, 'Santa Catarina', 'SC', Regiao.sul),

  /// 35 - São Paulo - SP
  sp(35, -23.55, -46.64, 'São Paulo', 'SP', Regiao.sudeste),

  /// 28 - Sergipe - SE
  se(28, -10.90, -37.07, 'Sergipe', 'SE', Regiao.nordeste),

  /// 17 - Tocantins - TO
  to(17, -10.25, -48.25, 'Tocantins', 'TO', Regiao.norte),

  /// 90 - SUFRAMA
  suframa(90, -3.04, -59.94, 'SUFRAMA', 'SUFRAMA', Regiao.nacional),

  /// 91 - RFB - Ambiente Nacional - AN
  an(91, 0, 0, 'RFB - Ambiente Nacional', 'AN', Regiao.nacional),

  /// 94 - SVCRS - Serviço Virtual de Contingência do Rio Grande do Sul
  svcrs(94, 0, 0, 'SVCRS - Serviço Virtual de Contingência do Rio Grande do Sul', 'SVCRS', Regiao.sul),

  /// 95 - SVCRS - Serviço Virtual de Contingência de São Paulo
  svcsp(95, 0, 0, 'SVCSP - Serviço Virtual de Contingência de São Paulo', 'SVCSP', Regiao.sudeste),

  /// 96 - Sincronização de chaves do estado do Rio Grande do Sul com o Sistema Virtual de São Paulo
  sincChavesRSparaSVSP(96, 0, 0, 'Sincronização de chaves do estado do Rio Grande do Sul com o Sistema Virtual de São Paulo', 'SincChavesRSparaSVSP', Regiao.sul),

  /// 99 - Exportação
  ex(99, 0, 0, 'Exportação', 'EX', Regiao.exportacao),

  /// 0 - Não definido
  naoDefinido(0, 0, 0, 'Não definido', 'ND', Regiao.naoDefinido);

  final int ibge;

  /// Verifica se o estado é um estado real.
  bool get estadoReal => isIn(Brasil.estados);

  /// Constrói um [Estado] com o valor fornecido.
  const Estado(this.ibge, this.latitude, this.longitude, this.nome, this.uf, this.regiao);

  /// Nome do estado.
  final String nome;

  /// Sigla do estado.
  final String uf;

  /// Região do estado.
  final Regiao regiao;

  /// Latitude do estado.
  final double latitude;

  /// Longitude do estado.
  final double longitude;

  /// Lista de cidades pertencentes ao estado.
  Future<Iterable<Cidade>> get cidades async => (await Brasil.cidades).where((e) => e.ibge.toString().first(2) == ibge.toString());

  /// Retorna uma lista de estados.
  ///
  /// Essa função estática assíncrona retorna uma lista de objetos do tipo Estado.
  /// A lista contém todos os estados do Brasil.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// List<Estado> estados = await Estado.pegarEstados;
  /// ```
  static List<Estado> get pegarEstados => [
        Estado.ac,
        Estado.al,
        Estado.ap,
        Estado.am,
        Estado.ba,
        Estado.ce,
        Estado.df,
        Estado.es,
        Estado.go,
        Estado.ma,
        Estado.mt,
        Estado.ms,
        Estado.mg,
        Estado.pa,
        Estado.pb,
        Estado.pr,
        Estado.pe,
        Estado.pi,
        Estado.rj,
        Estado.rn,
        Estado.rs,
        Estado.ro,
        Estado.rr,
        Estado.sc,
        Estado.sp,
        Estado.se,
        Estado.to,
      ];

  /// Retorna o estado correspondente ao nome, UF ou código IBGE fornecido.
  ///
  /// Parâmetros:
  /// - nomeOuUFOuIBGE: O nome, UF ou código IBGE do estado a ser buscado.
  ///
  /// Retorna:
  /// Um objeto do tipo Estado correspondente ao nome, UF ou código IBGE fornecido.
  /// Caso nenhum estado seja encontrado, retorna naoDefinido.
  static Estado pegar(dynamic nomeOuUFOuIBGE) => Brasil.pegarEstado(nomeOuUFOuIBGE);

  /// Pesquisa um estado pelo nome, UF ou código IBGE.
  /// Retorna uma lista de estados correspondentes à pesquisa.
  static Future<Iterable<Estado>> pesquisar(dynamic nomeOuUFOuIBGE) async => Brasil.pesquisarEstado(nomeOuUFOuIBGE);

  /// Retorna a cidade capital do estado.
  Future<Cidade> get capital async => (await cidades).singleWhere((e) => e.capital);

  @override
  int compareTo(other) => nome.compareTo(other.nome);

  /// Retorna o nome do estado.
  @override
  String toString() => nome;

  /// Cria uma instância de Estado a partir do código IBGE.
  factory Estado.fromUForIbge(dynamic value) {
    if (value == null) return naoDefinido;
    if (value is Estado) return value;
    if (value is Cidade) return value.estado;

    if (value is String) {
      if (value.isNumericOnly) {
        value = int.parse(value);
      } else {
        value = value.toLowerCase();
      }
    }
    if (value is num) {
      value = value.floor().toString().first(2).toIntOrZero.fixedLength(2);
    }
    switch (value.toString().toLowerCase()) {
      case "90":
      case "suframa":
        return suframa;
      case "91":
      case "an":
        return an;
      case "94":
      case "svcrs":
        return svcrs;
      case "95":
      case "svcsp":
        return svcsp;
      case "96":
      case "sincchavesrsparasvsp":
        return sincChavesRSparaSVSP;
      case "99":
      case "ex":
        return ex;
      default:
        return Estado.pegar(value);
    }
  }

  Map<String, dynamic> toJson() => {'Nome': nome, 'UF': uf, 'IBGE': ibge, 'Regiao': regiao, 'Latitude': latitude, 'Longitude': longitude};
}
