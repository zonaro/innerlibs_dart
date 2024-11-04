import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class InnerLibsLocalizationsPt extends InnerLibsLocalizations {
  InnerLibsLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get add => 'Adicionar';

  @override
  String addTo(String item) {
    return 'Adicionar a $item';
  }

  @override
  String get app => 'Aplicativo';

  @override
  String get apply => 'Aplicar';

  @override
  String applyItem(String item) {
    return 'Aplicar $item';
  }

  @override
  String applyItemIn(String item, String location) {
    return 'Aplicar $item em $location';
  }

  @override
  String applyItemToItem(String item1, String item2) {
    return 'Aplicar $item1 a $item2';
  }

  @override
  String get appName => 'Nome do Aplicativo';

  @override
  String get apps => 'Aplicativos';

  @override
  String get appSettings => 'Configurações do Aplicativo';

  @override
  String get back => 'Voltar';

  @override
  String get calculate => 'Calcular';

  @override
  String get call => 'Chamar';

  @override
  String calltoItem(String item) {
    return 'Chamar $item';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String cancelItem(String item) {
    return 'Cancelar $item';
  }

  @override
  String get categories => 'Categorias';

  @override
  String get category => 'Categoria';

  @override
  String get city => 'Cidade';

  @override
  String get clear => 'Limpar';

  @override
  String get close => 'Fechar';

  @override
  String closeItem(String item) {
    return 'Fechar $item';
  }

  @override
  String get collect => 'Coleta';

  @override
  String get collects => 'coletas';

  @override
  String get color => 'Cor';

  @override
  String get command => 'Comando';

  @override
  String get commands => 'Comandos';

  @override
  String get completed => 'Concluído';

  @override
  String get confirm => 'Confirmar';

  @override
  String confirmDelete(String item) {
    return 'Tem certeza de que deseja excluir $item?';
  }

  @override
  String confirmDeleteMultiple(int count, String plural, String singular) {
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

  @override
  String get contact => 'Contato';

  @override
  String get contacts => 'Contatos';

  @override
  String couldNotFindItem(String item) {
    return 'Não foi possível encontrar $item.';
  }

  @override
  String get country => 'País';

  @override
  String get darkMode => 'Modo Escuro';

  @override
  String get date => 'Data';

  @override
  String get dateOutOfRange => 'Data fora do intervalo';

  @override
  String get day => 'Dia';

  @override
  String get dayMode => 'Modo Diurno';

  @override
  String get days => 'Dias';

  @override
  String get decades => 'Décadas';

  @override
  String get defaultWord => 'Padrão';

  @override
  String get delete => 'Excluir';

  @override
  String get device => 'Dispositivo';

  @override
  String get disable => 'Desabilitar';

  @override
  String get disabled => 'Desabilitado';

  @override
  String disabledItem(String item) {
    return '$item Desabilitado';
  }

  @override
  String disabledItemIn(String item, String location) {
    return '$item Desabilitado em $location';
  }

  @override
  String disableItem(String item) {
    return 'Desabilitar $item';
  }

  @override
  String get dock => 'Acoplar';

  @override
  String dockItem(String item) {
    return 'Acoplar $item';
  }

  @override
  String get edit => 'Editar';

  @override
  String get empty => 'Vazio';

  @override
  String get emulate => 'Emular';

  @override
  String get emulator => 'Emulador';

  @override
  String get emulators => 'Emuladores';

  @override
  String get enable => 'Habilitar';

  @override
  String get enabled => 'Habilitado';

  @override
  String enabledItem(String item) {
    return '$item Habilitado';
  }

  @override
  String enabledItemIn(String item, String location) {
    return '$item Habilitado em $location';
  }

  @override
  String enableItem(String item) {
    return 'Habilitar $item';
  }

  @override
  String get error => 'Erro';

  @override
  String get estate => 'Propriedade';

  @override
  String get failed => 'Falhou';

  @override
  String get favorite => 'Favorito';

  @override
  String favoriteItem(String item) {
    return '$item Favorito';
  }

  @override
  String get favorites => 'Favoritos';

  @override
  String get file => 'Arquivo';

  @override
  String get fileDate => 'Data do Arquivo';

  @override
  String get fileName => 'Nome do Arquivo';

  @override
  String get fileNotFound => 'Arquivo não encontrado';

  @override
  String get fileOwner => 'Proprietário do Arquivo';

  @override
  String get filePermissions => 'Permissões do Arquivo';

  @override
  String get files => 'Arquivos';

  @override
  String get fileSize => 'Tamanho do Arquivo';

  @override
  String get fileType => 'Tipo de Arquivo';

  @override
  String get find => 'Encontrar';

  @override
  String findIn(String item) {
    return 'Encontrar em $item';
  }

  @override
  String findItem(String item) {
    return 'Encontrar $item';
  }

  @override
  String get finish => 'Finalizar';

  @override
  String get finished => 'Finalizado';

  @override
  String get folder => 'Pasta';

  @override
  String get folderName => 'Nome da Pasta';

  @override
  String get follow => 'Seguir';

  @override
  String followItem(String item) {
    return 'Seguir $item';
  }

  @override
  String get game => 'Jogo';

  @override
  String get games => 'Jogos';

  @override
  String get grid => 'Grade';

  @override
  String get gridSize => 'Tamanho da Grade';

  @override
  String get gridView => 'Visualização em Grade';

  @override
  String get height => 'Altura';

  @override
  String get hide => 'Ocultar';

  @override
  String get hours => 'Horas';

  @override
  String get info => 'Informação';

  @override
  String get install => 'Instalar';

  @override
  String installItem(String item) {
    return 'Instalar $item';
  }

  @override
  String invalidItem(String item) {
    return 'Inválido $item.';
  }

  @override
  String itemLibrary(String item) {
    return 'Biblioteca de $item';
  }

  @override
  String itemNotFound(String item) {
    return '$item não encontrado';
  }

  @override
  String itemNotFoundIn(String item, String location) {
    return '$item não encontrado em $location';
  }

  @override
  String get libraries => 'Bibliotecas';

  @override
  String get library => 'Biblioteca';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get list => 'Lista';

  @override
  String get listView => 'Visualização em Lista';

  @override
  String get loading => 'Carregando';

  @override
  String loadingItem(String item) {
    return 'Carregando $item...';
  }

  @override
  String get login => 'Entrar';

  @override
  String get logout => 'Sair';

  @override
  String get main => 'Principal';

  @override
  String get mainColor => 'Cor Principal';

  @override
  String get map => 'Mapa';

  @override
  String get mapView => 'Visualização do Mapa';

  @override
  String get minutes => 'Minutos';

  @override
  String get months => 'Meses';

  @override
  String get name => 'Nome';

  @override
  String newItem(String item) {
    return 'Novo $item';
  }

  @override
  String newItemToItem(String item1, String item2) {
    return 'Novo $item1 para $item2';
  }

  @override
  String get next => 'Próximo';

  @override
  String get night => 'Noite';

  @override
  String get nightMode => 'Modo Noturno';

  @override
  String get no => 'Não';

  @override
  String get notFound => 'Não Encontrado';

  @override
  String get number => 'Número';

  @override
  String get ok => 'OK';

  @override
  String get open => 'Abrir';

  @override
  String openIn(String item) {
    return 'Abrir em $item';
  }

  @override
  String openItem(String item) {
    return 'Abrir $item';
  }

  @override
  String openItemIn(String item, String location) {
    return 'Abrir $item em $location';
  }

  @override
  String get owner => 'Proprietário';

  @override
  String get password => 'Senha';

  @override
  String get pause => 'Pausar';

  @override
  String get paused => 'Pausado';

  @override
  String pauseItem(String item) {
    return 'Pausar $item';
  }

  @override
  String get pending => 'Pendente';

  @override
  String get phone => 'Telefone';

  @override
  String get play => 'Jogar';

  @override
  String get playing => 'Jogando';

  @override
  String playItem(String item) {
    return 'Jogar $item';
  }

  @override
  String get previous => 'Anterior';

  @override
  String get register => 'Registrar';

  @override
  String removeFrom(String item) {
    return 'Remover de $item';
  }

  @override
  String get removeFromfavorites => 'Remover dos favoritos';

  @override
  String get results => 'Resultados';

  @override
  String get save => 'Salvar';

  @override
  String get search => 'Pesquisar';

  @override
  String searchFor(String item) {
    return 'Pesquisar por $item...';
  }

  @override
  String searchForIn(String item, String location) {
    return 'Pesquisar por $item em $location';
  }

  @override
  String get seconds => 'Segundos';

  @override
  String get send => 'Enviar';

  @override
  String sendItemToItem(String item1, String item2) {
    return 'Enviar $item1 para $item2';
  }

  @override
  String sendtoItem(String item) {
    return 'Enviar para $item';
  }

  @override
  String get settings => 'Configurações';

  @override
  String get share => 'Compartilhar';

  @override
  String shareItem(String item) {
    return 'compartilhar $item';
  }

  @override
  String get show => 'Mostrar';

  @override
  String get size => 'Tamanho';

  @override
  String get success => 'Sucesso';

  @override
  String get table => 'Tabela';

  @override
  String get tableView => 'Visualização em Tabela';

  @override
  String get theme => 'Tema';

  @override
  String get themeColor => 'Cor do Tema';

  @override
  String get themeMode => 'Modo do Tema';

  @override
  String get to => 'Para';

  @override
  String toItem(String item) {
    return 'Para $item';
  }

  @override
  String get undock => 'Desacoplar';

  @override
  String undockItem(String item) {
    return 'Desacoplar $item';
  }

  @override
  String get unfavorite => 'Desfavoritar';

  @override
  String unfavoriteItem(String item) {
    return 'Desfavoritar $item';
  }

  @override
  String get unfollow => 'Deixar de Seguir';

  @override
  String unfollowItem(String item) {
    return 'Deixar de Seguir $item';
  }

  @override
  String get uninstall => 'Desinstalar';

  @override
  String uninstallItem(String item) {
    return 'Desinstalar $item';
  }

  @override
  String updateItem(String item) {
    return 'Atualizar $item';
  }

  @override
  String get username => 'Nome de Usuário';

  @override
  String get value => 'Valor';

  @override
  String get view => 'Visualizar';

  @override
  String get viewType => 'Tipo de Visualização';

  @override
  String get wallpaper => 'Papel de Parede';

  @override
  String get warning => 'Aviso';

  @override
  String get weeks => 'Semanas';

  @override
  String get width => 'Largura';

  @override
  String get years => 'Anos';

  @override
  String get yes => 'Sim';

  @override
  String get you => 'Você';

  @override
  String get your => 'Seu';

  @override
  String yourItem(String item) {
    return 'Seu $item';
  }

  @override
  String get directory => 'Diretório';

  @override
  String get directories => 'Diretórios';

  @override
  String get unknown => 'Desconhecido';

  @override
  String unknownItem(String item) {
    return '$item Desconhecido';
  }

  @override
  String get wallpaperInterval => 'Intervalo do papel de parede';

  @override
  String get wallpaperFadeTime => 'Tempo de desvanecimento do papel de parede';

  @override
  String get millisecond => 'Milissegundo';

  @override
  String get milliseconds => 'Milissegundos';

  @override
  String get second => 'Segundo';

  @override
  String get minute => 'Minuto';

  @override
  String get hour => 'Hora';

  @override
  String get week => 'Semana';

  @override
  String get month => 'Mês';

  @override
  String get year => 'Ano';

  @override
  String get decade => 'Década';

  @override
  String get century => 'Século';

  @override
  String get millennium => 'Milênio';

  @override
  String get millenniums => 'Milênios';

  @override
  String get overlays => 'Sobreposições';

  @override
  String get overlay => 'Sobreposição';

  @override
  String get overlayColor => 'Cor da Sobreposição';

  @override
  String get overlayOpacity => 'Opacidade da Sobreposição';

  @override
  String get dateTimeFormat => 'Formato de data e hora';
}
