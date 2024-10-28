import 'package:innerlibs/innerlibs.dart';

/// Classe que representa as informações de um usuário.
class InfoUsuario implements Validator {
  /// Nome do usuário.
  String nome = "";

  /// Sobrenome do usuário.
  String sobrenome = "";

  /// CPF ou CNPJ do usuário.
  String cpfCnpj = "";

  /// RG do usuário.
  String rg = "";

  /// CNH do usuário.
  String cnh = "";

  /// PIS do usuário.
  String pis = "";

  /// Lista de emails do usuário.
  List<String> emails = [];

  /// Lista de telefones do usuário.
  List<Telefone> telefones = [];

  /// Lista de endereços do usuário.
  List<Endereco> enderecos = [];

  JsonMap informacoesComplementares = {};

  InfoUsuario({
    this.nome = "",
    this.sobrenome = "",
    this.cpfCnpj = "",
    this.rg = "",
    this.cnh = "",
    this.pis = "",
    this.emails = const [],
    this.telefones = const [],
    this.enderecos = const [],
    this.informacoesComplementares = const {},
  });

  @override
  int get hashCode => Object.hash(cpfCnpj, 1);

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  operator []=(String key, dynamic value) {
    if (key.isBlank) return;
    if (value == null) {
      informacoesComplementares.removeWhere((k, v) => k == key);
      return;
    }
    if (key == "nome") {
      nome = value;
    }
    if (key == "sobrenome") {
      sobrenome = value;
    }
    if (key == "cpfCnpj") {
      cpfCnpj = value;
    }
    if (key == "rg") {
      rg = value;
    }
    if (key == "cnh") {
      cnh = value;
    }
    if (key == "pis") {
      pis = value;
    }

    if (key == "emails") {
      emails = forceListOf(value);
    }
    if (key == "telefones") {
      telefones = forceListOf(value).map((e) => Telefone(e)).toList();
    }
    if (key == "enderecos") {
      enderecos = forceListOf(value);
    }
    informacoesComplementares[key] = value;
  }

factory InfoUsuario.fromJson(JsonMap json) {
    return InfoUsuario(
      nome: json["nome"],
      sobrenome: json["sobrenome"],
      cpfCnpj: json["cpfCnpj"],
      rg: json["rg"],
      cnh: json["cnh"],
      pis: json["pis"],
      emails: forceListOf(json["emails"]),
      telefones: forceListOf(json["telefones"]).map((e) => Telefone(e)).toList(),
      enderecos: forceListOf(json["enderecos"]),
      informacoesComplementares: JsonMap.from(json)..removeWhere((k, v) => k.flatEqualAny( ["nome", "sobrenome", "cpfCnpj", "rg", "cnh", "pis", "emails", "telefones", "enderecos"])),
    );
  }

  JsonMap toJson() => {
        "nome": nome,
        "sobrenome": sobrenome,
        "cpfCnpj": cpfCnpj,
        "rg": rg,
        "cnh": cnh,
        "pis": pis,
        "emails": emails,
        "telefones": telefones.map((e) => e.toString()).toList(),
        "enderecos": enderecos.map((e) => e.toJson()).toList(),
        ...informacoesComplementares,
      };

  @override
  List<String> validate() {
    return [
      if (nome.isBlank) "O nome é obrigatório",
      if (cpfCnpj.isNotBlank)
        if (Brasil.validarCPFouCNPJ(cpfCnpj) == false) "O CPF ou CNPJ inválido",
      if (cnh.isNotBlank)
        if (Brasil.validarCNH(cnh) == false) "A CNH é inválida",
      if (pis.isNotBlank)
        if (Brasil.validarPIS(pis) == false) "O PIS é inválido",
      for (var email in emails)
        if (!email.isEmail) "O email $email é inválido",
      for (var telefone in telefones) ...[
        if (telefone.numero.isBlank) "O telefone é obrigatório",
      ],
      for (var endereco in enderecos) ...[
        if (endereco.logradouro.isBlank) "O logradouro é obrigatório",
        if (endereco.cidade == null) "A cidade é obrigatória",
        if (endereco.estado == null) "O estado é obrigatório",
      ]
    ];
  }
}
