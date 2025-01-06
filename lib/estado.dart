import 'package:innerlibs/innerlibs.dart';

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

  /// Retorna uma lista de estados.
  ///
  /// Essa função estática assíncrona retorna uma lista de objetos do tipo Estado.
  /// A lista contém todos os estados do Brasil.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// List<Estado> estados = await Estado.pegarEstados;
  /// ```
  static List<Estado> get pegarEstados => values
      .whereNot((e) => [
            Estado.naoDefinido,
            Estado.suframa,
            Estado.an,
            Estado.svcrs,
            Estado.svcsp,
            Estado.ex,
            Estado.sincChavesRSparaSVSP,
          ].contains(e))
      .toList();

  static List<Estado> get pegarEstadosECodigosEspeciais => values;

  final int ibge;

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

  /// Constrói um [Estado] com o valor fornecido.
  const Estado(this.ibge, this.latitude, this.longitude, this.nome, this.uf, this.regiao);

  /// Cria uma instancia de Estado a partir da inscrição estadual
  factory Estado.fromInscricaoEstadual(dynamic value) => values.firstWhereOrNull((e) => e.validarInscricaoEstadual(value)) ?? Estado.naoDefinido;

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

  /// Retorna a cidade capital do estado.
  Future<Cidade> get capital async => (await cidades).singleWhere((e) => e.capital);

  /// Lista de cidades pertencentes ao estado.
  Future<Iterable<Cidade>> get cidades async => (await Brasil.cidades).where((e) => e.ibge.toString().first(2) == ibge.toString());

  /// Verifica se o estado é um código especial utilizado somente em NFe.
  bool get codigoEspecial => !estadoReal;

  /// Verifica se o estado é um estado real e não um código especial utilizado somente em NFe.
  /// Os seguintes códigos são considerados especiais:
  /// - 90 - SUFRAMA
  /// - 91 - RFB - Ambiente Nacional - AN
  /// - 94 - SVCRS - Serviço Virtual de Contingência do Rio Grande do Sul
  /// - 95 - SVCSP - Serviço Virtual de Contingência de São Paulo
  /// - 96 - Sincronização de chaves do estado do Rio Grande do Sul com o Sistema Virtual de São Paulo
  /// - 99 - Exportação
  /// - 0 - Não definido
  ///
  bool get estadoReal => isIn(Brasil.estados);

  @override
  int compareTo(other) => nome.compareTo(other.nome);

  Map<String, dynamic> toJson() => {'Nome': nome, 'UF': uf, 'IBGE': ibge, 'Regiao': regiao, 'Latitude': latitude, 'Longitude': longitude};

  /// Retorna o nome do estado.
  @override
  String toString() => nome;

  bool validarInscricaoEstadual(dynamic value) {
    if (value == null) {
      return false;
    }

    value = flatString(value);

    String strBase;
    String strBase2;
    String strOrigem;
    String strDigito1;
    String strDigito2;
    int intPos = 0;
    int intValor = 0;
    int intSoma = 0;
    int intResto = 0;
    int intNumero = 0;
    int intPeso = 0;
    int intDig = 0;
    strBase = "";
    strBase2 = "";
    strOrigem = "";

    if (value.flatEqual("ISENTO")) {
      return true;
    }

    for (int intPos = 0; intPos < value.trim().length; intPos++) {
      if ("0123456789P".contains(value.trim().substring(intPos, intPos + 1), 0)) {
        strOrigem += value.trim().substring(intPos, intPos + 1);
      }
    }
    consoleLog("Validando IE para $uf");
    switch (this) {
      case Estado.ac: //Acre
        String strBase = ("${strOrigem.trim()}000000000").first(13);
        int d01 = int.parse(strBase.first());
        int d02 = int.parse(strBase.substring(1, 2));
        int d03 = int.parse(strBase.substring(2, 3));
        int d04 = int.parse(strBase.substring(3, 4));
        int d05 = int.parse(strBase.substring(4, 5));
        int d06 = int.parse(strBase.substring(5, 6));
        int d07 = int.parse(strBase.substring(6, 7));
        int d08 = int.parse(strBase.substring(7, 8));
        int d09 = int.parse(strBase.substring(8, 9));
        int d10 = int.parse(strBase.substring(9, 10));
        int d11 = int.parse(strBase.substring(10, 11));
        int dv01 = int.parse(strBase.substring(11, 12));
        int dv02 = int.parse(strBase.substring(12, 13));

        if (d01 != 0 || d02 != 1) {
          return false;
        }

        int ds = 4 * d01 + 3 * d02 + 2 * d03 + 9 * d04 + 8 * d05 + 7 * d06 + 6 * d07 + 5 * d08 + 4 * d09 + 3 * d10 + 2 * d11;

        int aux1 = (ds ~/ 11) * 11;
        int aux2 = ds - aux1;
        int digverificador1 = 11 - aux2;

        if (digverificador1 == 10 || digverificador1 == 11) {
          digverificador1 = 0;
        }

        ds = 5 * d01 + 4 * d02 + 3 * d03 + 2 * d04 + 9 * d05 + 8 * d06 + 7 * d07 + 6 * d08 + 5 * d09 + 4 * d10 + 3 * d11 + 2 * digverificador1;

        aux1 = (ds ~/ 11) * 11;
        aux2 = ds - aux1;
        int digverificador2 = 11 - aux2;

        if (digverificador2 == 10 || digverificador2 == 11) {
          digverificador2 = 0;
        }

        if (digverificador1 == dv01 && digverificador2 == dv02) {
          return true;
        }
        break;
      case Estado.al: // Alagoas
        strBase = ("${strOrigem.trim()}000000000").first(9);
        if (strBase.first(2) == "24") {
          intSoma = 0;
          for (intPos = 0; intPos < 8; intPos++) {
            intValor = int.parse(strBase.substring(intPos, intPos + 1));
            intValor = intValor * (10 - intPos);
            intSoma = intSoma + intValor;
          }
          intSoma = intSoma * 10;
          intResto = intSoma % 11;
          strDigito1 = intResto == 10 ? "0" : intResto.toString();
          strBase2 = strBase.first(8) + strDigito1;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.am: // Amazonas
        strBase = ("${strOrigem.trim()}000000000").first(9);
        intSoma = 0;
        for (intPos = 0; intPos < 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos, intPos + 1));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        if (intSoma < 11) {
          strDigito1 = intSoma.toString();
        } else {
          intResto = intSoma % 11;
          strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        }
        strBase2 = strBase.first(8) + strDigito1;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.ap: // Amapa
        strBase = ("${strOrigem.trim()}000000000").first(9);
        intPeso = 0;
        intDig = 0;
        if (strBase.first(2) == "03") {
          intNumero = int.parse(strBase.first(8));
          if (intNumero >= 3000001 && intNumero <= 3017000) {
            intPeso = 5;
            intDig = 0;
          } else if (intNumero >= 3017001 && intNumero <= 3019022) {
            intPeso = 9;
            intDig = 1;
          } else if (intNumero >= 3019023) {
            intPeso = 0;
            intDig = 0;
          }
          intSoma = intPeso;
          for (intPos = 0; intPos < 8; intPos++) {
            intValor = int.parse(strBase.substring(intPos, intPos + 1));
            intValor = intValor * (10 - intPos);
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 11;
          intValor = 11 - intResto;
          if (intValor == 10) {
            intValor = 0;
          } else if (intValor == 11) {
            intValor = intDig;
          }
          strDigito1 = intValor.toString();
          strBase2 = strBase.first(8) + strDigito1;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.ba: // Bahia
        strBase = ("${strOrigem.trim()}00000000").first(8);
        if ("0123458".contains(strBase.first())) {
          intSoma = 0;
          for (intPos = 0; intPos < 6; intPos++) {
            intValor = int.parse(strBase.substring(intPos, intPos + 1));
            intValor = intValor * (8 - intPos);
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 10;
          strDigito2 = intResto == 0 ? "0" : (10 - intResto).toString();
          strBase2 = strBase.first(6) + strDigito2;
          intSoma = 0;
          for (intPos = 0; intPos < 7; intPos++) {
            intValor = int.parse(strBase2.substring(intPos, intPos + 1));
            intValor = intValor * (9 - intPos);
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 10;
          strDigito1 = intResto == 0 ? "0" : (10 - intResto).toString();
        } else {
          intSoma = 0;
          for (intPos = 0; intPos < 6; intPos++) {
            intValor = int.parse(strBase.substring(intPos, intPos + 1));
            intValor = intValor * (8 - intPos);
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 11;
          strDigito2 = intResto < 2 ? "0" : (11 - intResto).toString();
          strBase2 = strBase.first(6) + strDigito2;
          intSoma = 0;
          for (intPos = 0; intPos < 7; intPos++) {
            intValor = int.parse(strBase2.substring(intPos, intPos + 1));
            intValor = intValor * (9 - intPos);
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 11;
          strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        }
        strBase2 = strBase.first(6) + strDigito1 + strDigito2;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.ce: // Ceara
        strBase = ("${strOrigem.trim()}000000000").first(9);
        intSoma = 0;
        for (intPos = 0; intPos < 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos, intPos + 1));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        intValor = 11 - intResto;
        if (intValor > 9) {
          intValor = 0;
        }
        strDigito1 = intValor.toString();
        strBase2 = strBase.first(8) + strDigito1;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.df: // Distrito Federal
        strBase = ("${strOrigem.trim()}0000000000000").first(13);
        if (strBase.first(3) == "073") {
          intSoma = 0;
          intPeso = 2;
          for (intPos = 11; intPos >= 1; intPos--) {
            intValor = int.parse(strBase.substring(intPos, intPos + 1));
            intValor = intValor * intPeso;
            intSoma = intSoma + intValor;
            intPeso = intPeso + 1;
            if (intPeso > 9) {
              intPeso = 2;
            }
          }
          intResto = intSoma % 11;
          strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
          strBase2 = strBase.first(11) + strDigito1;
          intSoma = 0;
          intPeso = 2;
          for (intPos = 12; intPos >= 1; intPos--) {
            intValor = int.parse(strBase.substring(intPos, intPos + 1));
            intValor = intValor * intPeso;
            intSoma = intSoma + intValor;
            intPeso = intPeso + 1;
            if (intPeso > 9) {
              intPeso = 2;
            }
          }
          intResto = intSoma % 11;
          strDigito2 = intResto < 2 ? "0" : (11 - intResto).toString();
          strBase2 = strBase.first(12) + strDigito2;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.es: // Espirito Santo
        strBase = ("${strOrigem.trim()}000000000").first(9);
        intSoma = 0;
        for (intPos = 0; intPos < 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos, intPos + 1));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase.first(8) + strDigito1;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.go: // Goias
        strBase = ("${strOrigem.trim()}000000000").first(9);
        if (["10", "11", "15"].contains(strBase.first(2))) {
          intSoma = 0;
          for (intPos = 0; intPos < 8; intPos++) {
            intValor = int.parse(strBase.substring(intPos, intPos + 1));
            intValor = intValor * (10 - intPos);
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 11;
          if (intResto == 0) {
            strDigito1 = "0";
          } else if (intResto == 1) {
            intNumero = int.parse(strBase.first(8));
            strDigito1 = (intNumero >= 10103105 && intNumero <= 10119997) ? "1" : "0";
          } else {
            strDigito1 = (11 - intResto).toString();
          }
          strBase2 = strBase.first(8) + strDigito1;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.ma: // Maranhão
        strBase = ("${strOrigem.trim()}000000000").first(9);
        if (strBase.first(2) == "12") {
          intSoma = 0;
          for (intPos = 0; intPos < 8; intPos++) {
            intValor = int.parse(strBase.substring(intPos, intPos + 1));
            intValor = intValor * (10 - intPos);
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 11;
          strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
          strBase2 = strBase.first(8) + strDigito1;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.mt: // Mato Grosso
        while (strOrigem.length < 11) {
          strOrigem = "0$strOrigem";
        }
        String strBase = ("${strOrigem.trim()}000000000").first(11);
        int d01 = int.parse(strBase.first());
        int d02 = int.parse(strBase.substring(1, 2));
        int d03 = int.parse(strBase.substring(2, 3));
        int d04 = int.parse(strBase.substring(3, 4));
        int d05 = int.parse(strBase.substring(4, 5));
        int d06 = int.parse(strBase.substring(5, 6));
        int d07 = int.parse(strBase.substring(6, 7));
        int d08 = int.parse(strBase.substring(7, 8));
        int d09 = int.parse(strBase.substring(8, 9));
        int d10 = int.parse(strBase.substring(9, 10));
        int dfinal = int.parse(strBase.substring(10, 11));
        int ds = 3 * d01 + 2 * d02 + 9 * d03 + 8 * d04 + 7 * d05 + 6 * d06 + 5 * d07 + 4 * d08 + 3 * d09 + 2 * d10;
        int aux1 = (ds ~/ 11) * 11;
        int aux2 = ds - aux1;
        int digVerificador = aux2 == 0 || aux2 == 1 ? 0 : 11 - aux2;
        if (dfinal == digVerificador) {
          return true;
        }
        break;
      case Estado.ms: // Mato Grosso do Sul
        strBase = ("${strOrigem.trim()}000000000").first(9);
        if (strBase.first(2) == "28") {
          intSoma = 0;
          for (intPos = 1; intPos <= 8; intPos++) {
            intValor = int.parse(strBase.substring(intPos - 1, intPos));
            intValor = intValor * (10 - intPos);
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 11;
          strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
          strBase2 = strBase.first(8) + strDigito1;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.mg: // Minas Gerais
        strBase = ("${strOrigem.trim()}0000000000000").first(13);
        strBase2 = "${strBase.first(3)}0${strBase.substring(3, 11)}";
        intNumero = 2;
        for (intPos = 0; intPos < 12; intPos++) {
          intValor = int.parse(strBase2.substring(intPos, intPos + 1));
          intNumero = intNumero == 2 ? 1 : 2;
          intValor = intValor * intNumero;
          if (intValor > 9) {
            String strDigito1 = intValor.toString().padLeft(2, '0');
            intValor = int.parse(strDigito1.first()) + int.parse(strDigito1.substring(1, 2));
          }
          intSoma = intSoma + intValor;
        }
        intValor = intSoma;
        while (intValor % 10 != 0) {
          intValor = intValor + 1;
        }
        String strDigito1 = (intValor - intSoma).toString().padLeft(2, '0');
        strBase2 = strBase.first(11) + strDigito1;
        intSoma = 0;
        intPeso = 2;
        for (intPos = 11; intPos >= 1; intPos--) {
          intValor = int.parse(strBase2.substring(intPos, intPos + 1));
          intValor = intValor * intPeso;
          intSoma = intSoma + intValor;
          intPeso = intPeso + 1;
          if (intPeso > 11) {
            intPeso = 2;
          }
        }
        intResto = intSoma % 11;
        String strDigito2 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase2 + strDigito2;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.pa: // Para
        strBase = ("${strOrigem.trim()}000000000").first(9);
        if (strBase.first(2) == "15") {
          intSoma = 0;
          for (intPos = 0; intPos < 8; intPos++) {
            intValor = int.parse(strBase.substring(intPos, intPos + 1));
            intValor = intValor * (10 - intPos);
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 11;
          strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
          strBase2 = strBase.first(8) + strDigito1;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.pb: // Paraiba
        strBase = ("${strOrigem.trim()}000000000").first(9);
        intSoma = 0;
        for (intPos = 0; intPos < 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos, intPos + 1));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        intValor = 11 - intResto;
        if (intValor > 9) {
          intValor = 0;
        }
        strDigito1 = intValor.toString().substring(intValor.toString().length - 1);
        strBase2 = strBase.first(8) + strDigito1;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.pe: // Pernambuco
        strBase = ("${strOrigem.trim()}00000000000000").first(14);
        intSoma = 0;
        intPeso = 2;
        for (intPos = 13; intPos >= 1; intPos--) {
          intValor = int.parse(strBase.substring(intPos, intPos + 1));
          intValor = intValor * intPeso;
          intSoma = intSoma + intValor;
          intPeso = intPeso + 1;
          if (intPeso > 9) {
            intPeso = 1;
          }
        }
        intResto = intSoma % 11;
        intValor = 11 - intResto;
        if (intValor > 9) {
          intValor = intValor - 10;
        }
        strDigito1 = intValor.toString().substring(intValor.toString().length - 1);
        strBase2 = strBase.first(13) + strDigito1;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.pi: // Piaui
        strBase = ("${strOrigem.trim()}000000000").first(9);
        intSoma = 0;
        for (intPos = 0; intPos < 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos, intPos + 1));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase.first(8) + strDigito1;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.pr: // Parana
        strBase = ("${strOrigem.trim()}0000000000").first(10);
        intSoma = 0;
        intPeso = 2;
        for (intPos = 8; intPos >= 1; intPos--) {
          intValor = int.parse(strBase.substring(intPos - 1, intPos));
          intValor = intValor * intPeso;
          intSoma = intSoma + intValor;
          intPeso = intPeso + 1;
          if (intPeso > 7) {
            intPeso = 2;
          }
        }
        intResto = intSoma % 11;
        strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase.first(8) + strDigito1;
        intSoma = 0;
        intPeso = 2;
        for (intPos = 9; intPos >= 1; intPos--) {
          intValor = int.parse(strBase2.substring(intPos - 1, intPos));
          intValor = intValor * intPeso;
          intSoma = intSoma + intValor;
          intPeso = intPeso + 1;
          if (intPeso > 7) {
            intPeso = 2;
          }
        }
        intResto = intSoma % 11;
        strDigito2 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase2 + strDigito2;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.rj: // Rio de Janeiro
        strBase = ("${strOrigem.trim()}00000000").first(8);
        intSoma = 0;
        intPeso = 2;
        for (intPos = 7; intPos >= 1; intPos--) {
          intValor = int.parse(strBase.substring(intPos - 1, intPos));
          intValor = intValor * intPeso;
          intSoma = intSoma + intValor;
          intPeso = intPeso + 1;
          if (intPeso > 7) {
            intPeso = 2;
          }
        }
        intResto = intSoma % 11;
        strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase.first(7) + strDigito1;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.rn: // Rio Grande do Norte
        strBase = ("${strOrigem.trim()}000000000").first(9);
        if (strBase.first(2) == "20") {
          intSoma = 0;
          for (intPos = 1; intPos <= 8; intPos++) {
            intValor = int.parse(strBase.substring(intPos - 1, intPos));
            intValor = intValor * (10 - intPos);
            intSoma = intSoma + intValor;
          }
          intSoma = intSoma * 10;
          intResto = intSoma % 11;
          strDigito1 = intResto > 9 ? "0" : intResto.toString();
          strBase2 = strBase.first(8) + strDigito1;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.ro: // Rondonia, estado alterado
        strBase = ("${strOrigem.trim()}000000000").first(14);
        int d01 = int.parse(strBase.first());
        int d02 = int.parse(strBase.substring(1, 2));
        int d03 = int.parse(strBase.substring(2, 3));
        int d04 = int.parse(strBase.substring(3, 4));
        int d05 = int.parse(strBase.substring(4, 5));
        int d06 = int.parse(strBase.substring(5, 6));
        int d07 = int.parse(strBase.substring(6, 7));
        int d08 = int.parse(strBase.substring(7, 8));
        int d09 = int.parse(strBase.substring(8, 9));
        int d10 = int.parse(strBase.substring(9, 10));
        int d11 = int.parse(strBase.substring(10, 11));
        int d12 = int.parse(strBase.substring(11, 12));
        int d13 = int.parse(strBase.substring(12, 13));
        int dfinal = int.parse(strBase.substring(13, 14));
        int ds = 6 * d01 + 5 * d02 + 4 * d03 + 3 * d04 + 2 * d05 + 9 * d06 + 8 * d07 + 7 * d08 + 6 * d09 + 5 * d10 + 4 * d11 + 3 * d12 + 2 * d13;
        int aux1 = (ds / 11).floor();
        aux1 = aux1 * 11;
        int aux2 = ds - aux1;
        int digVerificador = 11 - aux2;
        int restoDoCalculo;
        if (digVerificador > 9) {
          restoDoCalculo = digVerificador - 10;
        } else {
          restoDoCalculo = digVerificador;
        }
        if (dfinal != restoDoCalculo) {
          return false;
        } else {
          return true;
        }

      case Estado.rr: // Roraima
        strBase = ("${strOrigem.trim()}000000000").first(9);
        if (strBase.first(2) == "24") {
          intSoma = 0;
          for (intPos = 1; intPos <= 8; intPos++) {
            intValor = int.parse(strBase.substring(intPos - 1, intPos));
            intValor = intValor * intPos;
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 9;
          strDigito1 = intResto.toString().substring(intResto.toString().length - 1);
          strBase2 = strBase.first(8) + strDigito1;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.rs: // Rio Grande do Sul
        strBase = ("${strOrigem.trim()}0000000000").first(10);
        intNumero = int.parse(strBase.first(3));
        if (intNumero > 0 && intNumero < 468) {
          intSoma = 0;
          intPeso = 2;
          for (intPos = 9; intPos >= 1; intPos--) {
            intValor = int.parse(strBase.substring(intPos - 1, intPos));
            intValor = intValor * intPeso;
            intSoma = intSoma + intValor;
            intPeso = intPeso + 1;
            if (intPeso > 9) {
              intPeso = 2;
            }
          }
          intResto = intSoma % 11;
          intValor = 11 - intResto;
          if (intValor > 9) {
            intValor = 0;
          }
          strDigito1 = intValor.toString().substring(intValor.toString().length - 1);
          strBase2 = strBase.first(9) + strDigito1;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.sc: // Santa Catarina
        strBase = ("${strOrigem.trim()}000000000").first(9);
        intSoma = 0;
        for (intPos = 1; intPos <= 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos - 1, intPos));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase.first(8) + strDigito1;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.se: // Sergipe
        strBase = ("${strOrigem.trim()}000000000").first(9);
        intSoma = 0;
        for (intPos = 1; intPos <= 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos - 1, intPos));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        intValor = 11 - intResto;
        if (intValor > 9) {
          intValor = 0;
        }
        strDigito1 = intValor.toString().substring(intValor.toString().length - 1);
        strBase2 = strBase.first(8) + strDigito1;
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.sp: // São Paulo
        if (strOrigem.first() == "P") {
          strBase = ("${strOrigem.trim()}0000000000000").first(13);
          strBase2 = strBase.substring(1, 9);
          intSoma = 0;
          intPeso = 1;
          for (intPos = 1; intPos <= 8; intPos++) {
            intValor = int.parse(strBase.substring(intPos - 1, intPos));
            intValor = intValor * intPeso;
            intSoma = intSoma + intValor;
            intPeso = intPeso + 1;
            if (intPeso == 2) {
              intPeso = 3;
            }
            if (intPeso == 9) {
              intPeso = 10;
            }
          }
          intResto = intSoma % 11;
          strDigito1 = intResto.toString().substring(intResto.toString().length - 1);
          strBase2 = strBase.first(8) + strDigito1 + strBase.substring(10, 13);
        } else {
          strBase = ("${strOrigem.trim()}000000000000").first(12);
          intSoma = 0;
          intPeso = 1;
          for (intPos = 1; intPos <= 8; intPos++) {
            intValor = int.parse(strBase.substring(intPos - 1, intPos));
            intValor = intValor * intPeso;
            intSoma = intSoma + intValor;
            intPeso = intPeso + 1;
            if (intPeso == 2) {
              intPeso = 3;
            }
            if (intPeso == 9) {
              intPeso = 10;
            }
          }
          intResto = intSoma % 11;
          strDigito1 = intResto.toString().substring(intResto.toString().length - 1);
          strBase2 = strBase.first(8) + strDigito1 + strBase.substring(9, 11);
          intSoma = 0;
          intPeso = 2;
          for (intPos = 11; intPos >= 1; intPos--) {
            intValor = int.parse(strBase.substring(intPos - 1, intPos));
            intValor = intValor * intPeso;
            intSoma = intSoma + intValor;
            intPeso = intPeso + 1;
            if (intPeso > 10) {
              intPeso = 2;
            }
          }
          intResto = intSoma % 11;
          strDigito2 = intResto.toString().substring(intResto.toString().length - 1);
          strBase2 = strBase2 + strDigito2;
        }
        if (strBase2 == strOrigem) {
          return true;
        }
        break;
      case Estado.to: // Tocantins
        strBase = ("${strOrigem.trim()}00000000000").first(11);
        if (["01", "02", "03", "99"].contains(strBase.substring(2, 4))) {
          strBase2 = strBase.first(2) + strBase.substring(4, 10);
          intSoma = 0;
          for (intPos = 1; intPos <= 8; intPos++) {
            intValor = int.parse(strBase2.substring(intPos - 1, intPos));
            intValor = intValor * (10 - intPos);
            intSoma = intSoma + intValor;
          }
          intResto = intSoma % 11;
          strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
          strBase2 = strBase.first(10) + strDigito1;
          if (strBase2 == strOrigem) {
            return true;
          }
        }
        break;
      case Estado.naoDefinido:
      case Estado.suframa:
      case Estado.svcrs:
      case Estado.svcsp:
      case Estado.sincChavesRSparaSVSP:
        return false;
      case Estado.ex:
        return "$value".flatEqual("EX");
      case Estado.an:
        return Brasil.estados.any((x) => x.validarInscricaoEstadual(value));
    }

    return false;
  }

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
  static Iterable<Estado> pesquisar(dynamic nomeOuUFOuIBGE) => Brasil.pesquisarEstado(nomeOuUFOuIBGE);
}

enum Regiao {
  naoDefinido(0),
  norte(1),
  nordeste(2),
  centroOeste(3),
  sudeste(4),
  sul(5),
  nacional(91),
  exportacao(99);

  /// Retorna uma lista de regiões.
  static List<Regiao> get pegarRegioes => [norte, nordeste, centroOeste, sudeste, sul];

  final int value;

  const Regiao(this.value);

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

  /// Retorna uma lista de cidades capitais desta região
  Future<Iterable<Cidade>> get capitais async => (await cidades).where((e) => e.capital);

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

  bool get regiaoReal => isIn(Brasil.regioes);

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
