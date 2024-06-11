import 'package:innerlibs/innerlibs.dart';

/// Classe que representa a Chave da Nota Fiscal Eletrônica (NFe).
class ChaveNFe {
  /// Tamanho do CNPJ na chave da NFe.
  static const int tamanhoCNPJ = 14;

  /// Tamanho do código na chave da NFe.
  static const int tamanhoCodigo = 8;

  /// Tamanho do dígito na chave da NFe.
  static const int tamanhoDigito = 1;

  /// Tamanho do mês e ano na chave da NFe.
  static const int tamanhoMesAno = 4;

  /// Tamanho do modelo na chave da NFe.
  static const int tamanhoModelo = 2;

  /// Tamanho da nota na chave da NFe.
  static const int tamanhoNota = 9;

  /// Tamanho da série na chave da NFe.
  static const int tamanhoSerie = 3;

  /// Tamanho da UF na chave da NFe.
  static const int tamanhoUF = 2;

  /// Tamanho da forma de emissão na chave da NFe.
  static const int tamanhoFormaEmissao = 1;

  int? ano; // Ano de emissão da NF-e.
  int? formaEmissao; // Forma de emissão da NF-e.
  int? cnpj; // CNPJ do emitente da NF-e.
  int? codigo; // Código do município do emitente da NF-e.
  int? digito; // Dígito verificador da chave da NF-e.
  int? mes; // Mês de emissão da NF-e.
  int? modelo; // Modelo da NF-e.
  DateTime? mesEmissao; // Data de emissão da NF-e.
  int? nota; // Número da NF-e.
  int? serie; // Série da NF-e.
  int? uf; // UF do emitente da NF-e.

  /// Obtém o tipo da NFe com base no modelo fixo.
  ///
  /// Retorna "NF-e" para modelo fixo "55",
  /// "CT-e" para modelo fixo "57",
  /// "NFC-e" para modelo fixo "65",
  /// ou "DF-e Desconhecido" para outros modelos fixos.
  String? get tipo {
    switch (modeloFixo) {
      case "55":
        return "NF-e";

      case "57":
        return "CT-e";

      case "65":
        return "NFC-e";

      default:
        return "DF-e Desconhecido";
    }
  }

  /// Define o tipo da NFe com base no valor fornecido.
  ///
  /// O valor deve ser "55", "57" ou "65" para definir o modelo fixo corretamente.
  /// Caso contrário, o modelo fixo será definido como "0".
  set tipo(String? value) => modeloFixo = value?.nullIf((x) => !["55", "57", "65"].contains(x)) ?? "0";

  /// Construtor padrão da classe ChaveNFe.
  ChaveNFe();

  /// Construtor que inicializa a ChaveNFe com base nos componentes fornecidos.
  ///
  /// Os componentes são: UF, ano, mês, CNPJ, modelo, série, nota, forma de emissão e código.
  ChaveNFe.fromComponents({
    required String uf,
    required int this.ano,
    required int this.mes,
    required String cnpj,
    required int this.modelo,
    required int this.serie,
    required int this.nota,
    required int this.formaEmissao,
    required int this.codigo,
  }) {
    this.uf = int.tryParse(uf);
    this.cnpj = int.tryParse(cnpj);
  }

  /// Construtor que inicializa a ChaveNFe com base em uma data e nos componentes fornecidos.
  ///
  /// Os componentes são: UF, data de emissão, CNPJ, modelo, série, nota, forma de emissão e código.
  ChaveNFe.fromDateAndComponents(String uf, DateTime emissao, String cnpj, int modelo, int serie, int nota, int formaEmissao, int codigo) {
    // Implementar inicialização conforme necessário
  }

  /// Construtor que inicializa a ChaveNFe com base em uma string de chave.
  ///
  /// A string de chave deve conter apenas números.
  ChaveNFe.fromString(String chave) {
    this.chave = chave.onlyNumbers;
  }

  /// Obtém a chave da NFe formatada sem traços.
  String get chave => chaveFormatadaTraco.onlyNumbers;

  /// Define a chave da NFe.
  ///
  /// A chave deve conter apenas números.
  /// Se a chave tiver 43 caracteres, o dígito verificador será calculado e adicionado automaticamente.
  /// Se a chave não tiver 44 caracteres após a formatação, será preenchida com zeros à esquerda.
  set chave(String value) {
    var c = value.zeroIfBlank.onlyNumbers;
    if (c.length == 43) {
      c += calcularDigitoChave(c).toString();
    }

    if (c.length != 44) {
      c = "".padLeft(44, '0');
    }

    var parts = c.splitChunk([tamanhoUF, tamanhoMesAno - 2, tamanhoMesAno - 2, tamanhoCNPJ, tamanhoModelo, tamanhoSerie, tamanhoNota, tamanhoFormaEmissao, tamanhoCodigo, tamanhoDigito]);

    uf = parts[0].toInt;
    ano = parts[1].toInt;
    mes = parts[2].toInt;
    cnpj = parts[3].toInt;
    modelo = parts[4].toInt;
    serie = parts[5].toInt;
    nota = parts[6].toInt;
    formaEmissao = parts[7].toInt;
    codigo = parts[8].toInt;
    digito = parts[9].toInt;
  }

  /// Obtém a chave da NFe formatada com traços.
  ///
  /// Retorna a chave formatada com traços entre os componentes.
  /// Se algum componente fixo for nulo, retorna "null".
  String get chaveFormatadaTraco {
    if (ufFixo != null && mesAno != null && cnpjFixo != null && modeloFixo != null && serieFixo != null && notaFixo != null && formaEmissaoFixo != null && codigoFixo != null && digitoFixo != null) {
      return "$ufFixo-$mesAno-$cnpjFixo-$modeloFixo-$serieFixo-$notaFixo-$formaEmissaoFixo-$codigoFixo-$digitoFixo";
    }
    return "null";
  }

  /// Obtém a chave da NFe formatada com espaços.
  ///
  /// Retorna a chave formatada com espaços a cada 4 caracteres.
  String? get chaveFormatadaComEspacos => chave.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ").trimRight();

  /// Obtém o mês e ano da NFe formatado.
  ///
  /// Retorna uma string com o mês e ano formatados no padrão "MMYY".
  /// Se o ano ou o mês forem nulos, retorna null.
  String? get mesAno {
    if (ano != null && mes != null) {
      return "${ano.toString().padLeft(tamanhoMesAno - 2, '0')}${mes.toString().padLeft(tamanhoMesAno - 2, '0')}";
    }
    return null;
  }

  /// Define o mês e ano da NFe com base na string fornecida.
  ///
  /// A string deve conter apenas números e ter 4 caracteres.
  /// Os dois primeiros caracteres representam o mês e os dois últimos representam o ano.
  set mesAno(String? value) {
    if (value != null && value.isNotEmpty && value.onlyNumbers.length == 4) {
      mes = int.tryParse(value.substring(0, 2));
      ano = int.tryParse(value.substring(2, 4));
    }
  }

  /// Obtém o modelo fixo da NFe formatado.
  ///
  /// Retorna uma string com o modelo fixo formatado com zeros à esquerda.
  String? get modeloFixo => modelo?.toString().padLeft(tamanhoModelo, '0');

  /// Define o modelo fixo da NFe com base na string fornecida.
  ///
  /// A string deve conter apenas números.
  set modeloFixo(String? value) => modelo = value != null ? int.tryParse(value) : null;

  /// Obtém a nota fixa da NFe formatada.
  ///
  /// Retorna uma string com a nota fixa formatada com zeros à esquerda.
  String? get notaFixo => nota?.toString().padLeft(tamanhoNota, '0');

  /// Define a nota fixa da NFe com base na string fornecida.
  ///
  /// A string deve conter apenas números.
  set notaFixo(String? value) => nota = value != null ? int.tryParse(value) : null;

  /// Obtém a série fixa da NFe formatada.
  ///
  /// Retorna uma string com a série fixa formatada com zeros à esquerda.
  String? get serieFixo => serie?.toString().padLeft(tamanhoSerie, '0');

  /// Define a série fixa da NFe com base na string fornecida.
  ///
  /// A string deve conter apenas números.
  set serieFixo(String? value) => serie = value != null ? int.tryParse(value) : null;

  /// Obtém a UF fixa da NFe formatada.
  ///
  /// Retorna uma string com a UF fixa formatada com zeros à esquerda.
  String? get ufFixo => uf?.toString().padLeft(tamanhoUF, '0');

  /// Define a UF fixa da NFe com base na string fornecida.
  ///
  /// A string deve conter apenas números.
  set ufFixo(String? value) => uf = value != null ? int.tryParse(value) : null;

  /// Obtém a forma de emissão fixa da NFe formatada.
  ///
  /// Retorna uma string com a forma de emissão fixa formatada com zeros à esquerda.
  String? get formaEmissaoFixo => formaEmissao?.toString().padLeft(tamanhoFormaEmissao, '0');

  /// Define a forma de emissão fixa da NFe com base na string fornecida.
  ///
  /// A string deve conter apenas números.
  set formaEmissaoFixo(String? value) => formaEmissao = value != null ? int.tryParse(value) : null;

  /// Obtém o CNPJ fixo da NFe formatado.
  ///
  /// Retorna uma string com o CNPJ fixo formatado com zeros à esquerda.
  String? get cnpjFixo => cnpj?.toString().padLeft(tamanhoCNPJ, '0');

  /// Define o CNPJ fixo da NFe com base na string fornecida.
  ///
  /// A string deve conter apenas números.
  set cnpjFixo(String? value) => cnpj = value != null ? int.tryParse(value) : null;

  /// Obtém o código fixo da NFe formatado.
  ///
  /// Retorna uma string com o código fixo formatado com zeros à esquerda.
  String? get codigoFixo => codigo?.toString().padLeft(tamanhoCodigo, '0');

  /// Define o código fixo da NFe com base na string fornecida.
  ///
  /// A string deve conter apenas números.
  set codigoFixo(String? value) => codigo = value != null ? int.tryParse(value) : null;

  /// Obtém o dígito fixo da NFe formatado.
  ///
  /// Retorna uma string com o dígito fixo formatado com zeros à esquerda.
  String? get digitoFixo => digito?.toString().padLeft(tamanhoDigito, '0');

  /// Define o dígito fixo da NFe com base na string fornecida.
  ///
  /// A string deve conter apenas números.
  set digitoFixo(String? value) => digito = value != null ? int.tryParse(value) : null;

  /// Calcula o dígito verificador da chave da NFe.
  ///
  /// Retorna o dígito verificador calculado com base na chave fornecida.
  /// A chave deve ter 43 ou 44 caracteres.
  static int calcularDigitoChave(String chave) {
    if (chave.length == 43 || chave.length == 44) {
      chave = chave.first(43);

      // Cálculo do dígito verificador
      int peso = 2;
      int soma = 0;
      for (int i = chave.length - 1; i >= 0; i--) {
        int algarismo = chave.substring(i, 1).toInt!;
        soma += algarismo * peso;
        peso++;
        if (peso == 10) {
          peso = 2;
        }
      }
      int resto = soma % 11;
      int dv = 11 - resto;
      if (dv == 10 || dv == 11) {
        dv = 0;
      }
      return dv;
    }
    throw const FormatException("Chave NFe inválida");
  }

  @override
  String toString() => chave;
}
