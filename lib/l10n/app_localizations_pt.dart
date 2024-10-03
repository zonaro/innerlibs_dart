import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class InnerLibsLocalizationsPt extends InnerLibsLocalizations {
  InnerLibsLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get call => 'Ligar';

  @override
  String get send => 'Enviar';

  @override
  String calltoItem(String item) {
    return 'Ligar para $item';
  }

  @override
  String sendtoItem(String item) {
    return 'Enviar para $item';
  }

  @override
  String sendItemToItem(String item1, String item2) {
    return 'Enviar $item1 para $item2';
  }

  @override
  String get to => 'Para';

  @override
  String get open => 'Abrir';

  @override
  String get view => 'Visualizar';

  @override
  String get search => 'Buscar';

  @override
  String searchFor(String item) {
    return 'Buscar por $item...';
  }

  @override
  String searchForIn(String item, String location) {
    return 'Buscar por $item em $location';
  }

  @override
  String findItem(String item) {
    return 'Encontrar $item';
  }

  @override
  String findIn(String item) {
    return 'Encontrar em $item';
  }

  @override
  String get find => 'Encontrar';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Fechar';

  @override
  String get save => 'Salvar';

  @override
  String get delete => 'Excluir';

  @override
  String get edit => 'Editar';

  @override
  String newItem(String item) {
    return 'Novo $item';
  }

  @override
  String get add => 'Adicionar';

  @override
  String get back => 'Voltar';

  @override
  String get next => 'Próximo';

  @override
  String get previous => 'Anterior';

  @override
  String get finish => 'Finalizar';

  @override
  String get loading => 'Carregando';

  @override
  String get clear => 'Limpar';

  @override
  String get error => 'Erro';

  @override
  String get warning => 'Aviso';

  @override
  String get info => 'Informação';

  @override
  String get success => 'Sucesso';

  @override
  String get confirm => 'Confirmar';

  @override
  String get register => 'Registrar';

  @override
  String get login => 'Entrar';

  @override
  String get logout => 'Sair';

  @override
  String get username => 'Nome de usuário';

  @override
  String get password => 'Senha';

  @override
  String get name => 'Nome';

  @override
  String get number => 'Número';

  @override
  String get date => 'Data';

  @override
  String get value => 'Valor';

  @override
  String get phone => 'Telefone';

  @override
  String get city => 'Cidade';

  @override
  String get country => 'País';

  @override
  String get estate => 'Estado';

  @override
  String get dateOutOfRange => 'Data fora do intervalo';

  @override
  String invalidItem(String item) {
    return '$item inválido.';
  }

  @override
  String couldNotFindItem(String item) {
    return 'Não foi possível encontrar $item.';
  }

  @override
  String confirmDelete(String item) {
    return 'Tem certeza de que deseja excluir $item?';
  }

  @override
  String confirmDeleteMultiple(int count, String singular, String plural) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString $plural',
      one: '1 $singular',
    );
    return 'Tem certeza de que deseja excluir $_temp0?';
  }
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class InnerLibsLocalizationsPtBr extends InnerLibsLocalizationsPt {
  InnerLibsLocalizationsPtBr(): super('pt_BR');


}
