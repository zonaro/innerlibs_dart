import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innerlibs/brazil/brazil_tools.dart';
import 'package:innerlibs/size_extensions.dart';
import 'package:innerlibs/utils/constants.dart';

void main() {
  test(' ', () {
    var t = const Size(1920, 1080).getAspectRatioString();
    debugPrint(t);
  });

  test(' ', () {
    var t = Brasil.pegarEstado("São Paulo");
    debugPrint(t?.uf);
  });

  test(' ', () async {
    var t = await Brasil.pesquisarCEP("05366000");
    t.toString();
  });

  test(' ', () {
    for (var m in DateConstants.months) {
      debugPrint(m.month);
    }
  });

  test(' ', () {
    var cnpj = Brasil.gerarCNPJFake();
    assert(Brasil.validarCNPJ(cnpj));
  });

   test(' ', () {
    var cpf = Brasil.gerarCPFFake();
    assert(Brasil.validarCPF(cpf));
  });
}
