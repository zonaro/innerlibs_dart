import 'package:innerlibs/innerlibs.dart';

/// Classe que representa as informações de um usuário.
class InfoUsuario implements Validator {
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
  });

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

  @override
  int get hashCode => Object.hash(cpfCnpj, 1);

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

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
    ];
  }
}
