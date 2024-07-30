import 'package:innerlibs/innerlibs.dart';

class Endereco implements Comparable<Endereco> {
  final String cep;
  final String logradouro;
  final String numero;
  final String complemento;
  final String bairro;
  final int? gia;
  final int? ddd;
  final int? siafi;
  String get pais => "Brasil";
  int get codigoPais => 1058;
  final Cidade? cidade;

  int? get ibge => cidade?.ibge;

  Endereco({
    this.cep = "",
    this.logradouro = "",
    this.numero = "",
    this.complemento = "",
    this.bairro = "",
    this.cidade,
    this.gia,
    this.ddd,
    this.siafi,
  });

  Estado? get estado => cidade?.estado;

  static Endereco fromPartialJson(Map<String, dynamic> json) {
    return Endereco(
      cep: Brasil.formatarCEP((json['cep'] ?? "").toString().onlyNumbers.padLeft(8, '0')),
      logradouro: (json['logradouro'] ?? "").toString(),
      numero: (json['numero'] ?? "").toString(),
      complemento: (json['complemento'] ?? "").toString(),
      bairro: (json['bairro'] ?? "").toString(),
      gia: parseTo(json['gia']),
      ddd: parseTo(json['ddd']),
      siafi: parseTo(json['siafi']),
    );
  }

  static Future<Endereco> fromJson(Map<String, dynamic> json) async {
    var cidade = await Cidade.pegar(json['ibge']);
    return Endereco(
      cep: Brasil.formatarCEP((json['cep'] ?? "").toString().onlyNumbers.padLeft(8, '0')),
      logradouro: (json['logradouro'] ?? "").toString(),
      numero: (json['numero'] ?? "").toString(),
      complemento: (json['complemento'] ?? "").toString(),
      bairro: (json['bairro'] ?? "").toString(),
      gia: parseTo(json['gia']),
      ddd: parseTo(json['ddd']) ?? cidade?.ddd,
      siafi: parseTo(json['siafi']),
      cidade: cidade,
    );
  }

  Map<String, dynamic> toJson() => {
        'CEP': cep,
        'Logradouro': logradouro,
        'Numero': numero,
        'Complemento': complemento,
        'Bairro': bairro,
        'GIA': gia,
        'DDD': ddd,
        'SIAFI': siafi,
        'IBGE': ibge,
        'Cidade': cidade?.toJson(),
        'Estado': estado?.toJson(),
      };

  @override
  int get hashCode => Object.hash(cep, numero, complemento);

  @override
  int compareTo(Endereco other) {
    if (cep == other.cep) {
      if (numero == other.numero) {
        return complemento.compareTo(other.complemento);
      } else {
        return numero.compareTo(other.numero);
      }
    } else {
      return cep.compareTo(other.cep);
    }
  }

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  string get logradouroCompleto => [
        logradouro,
        numero,
        complemento,
      ].whereValid.join(", ").trim();

  /// Retorna o endereço completo.
  string get endereco => [
        logradouroCompleto,
        bairroCidadeEstado,
      ].whereValid.join(" - ").trim();

  string get enderecoComCep => [endereco, cep].whereValid.join(" - ").trim();
  string get enderecoCompleto => [endereco, cep, pais].whereValid.join(" - ").trim();
  string get bairroCidadeEstado => [bairro, cidade?.nome ?? "", estado?.uf].whereValid.join(" - ").trim();
  string get bairroCidadeEstadoCep => [bairroCidadeEstado, cep].whereValid.join(" - ").trim();

  /// Retorna uma representação em String do endereço.
  @override
  String toString() => enderecoCompleto;
}
