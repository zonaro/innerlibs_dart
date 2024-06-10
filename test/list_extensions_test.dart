import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:innerlibs/utils/constants.dart';

void main() {
  
  test(' ', () {
    "a,b c;d".splitAny([",", ";", " "]).forEach((x) => consoleLog(x));
  });

  test(' ', () {
    var t = const Size(1920, 1080).getAspectRatioString();
    consoleLog(t);
  });

  test(' ', () async {
    var t = await Brasil.pegarEstado("São Paulo");
    consoleLog(t?.uf ?? "");
  });

  test(' ', () async {
    var t = await Brasil.pesquisarCEP("05366000");
    t.toString();
  });

  test(' ', () {
    for (var m in DateConstants.months) {
      consoleLog(m.month);
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

  test(' ', () {
    var tel = Brasil.formataTelefone(37335600);
    consoleLog(tel);
  });
}
