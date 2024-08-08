import 'package:innerlibs/innerlibs.dart';

bool validarInscricaoEstadual(String pUF, String pInscr) {
  bool valid = false;
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
  if (pInscr.flatEqual("ISENTO") || pInscr.flatEqual("EX")) {
    return true;
  }

  for (int intPos = 0; intPos < pInscr.trim().length; intPos++) {
    if ("0123456789P".contains(pInscr.trim().substring(intPos, intPos + 1), 0)) {
      strOrigem += pInscr.trim().substring(intPos, intPos + 1);
    }
  }

  switch (pUF) {
    case "AC": //Acre
      String strBase = ("${strOrigem.trim()}000000000").substring(0, 13);
      int d01 = int.parse(strBase.substring(0, 1));
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
        valid = true;
      }
    case "AL": // Alagoas
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      if (strBase.substring(0, 2) == "24") {
        intSoma = 0;
        for (intPos = 0; intPos < 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos, intPos + 1));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intSoma = intSoma * 10;
        intResto = intSoma % 11;
        strDigito1 = intResto == 10 ? "0" : intResto.toString();
        strBase2 = strBase.substring(0, 8) + strDigito1;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
      break;
    case "AM": // Amazonas
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
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
      strBase2 = strBase.substring(0, 8) + strDigito1;
      if (strBase2 == strOrigem) {
        valid = true;
      }
    case "AP": // Amapa
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      intPeso = 0;
      intDig = 0;
      if (strBase.substring(0, 2) == "03") {
        intNumero = int.parse(strBase.substring(0, 8));
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
        strBase2 = strBase.substring(0, 8) + strDigito1;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
      break;
    case "BA": // Bahia
      strBase = ("${strOrigem.trim()}00000000").substring(0, 8);
      if ("0123458".contains(strBase.substring(0, 1))) {
        intSoma = 0;
        for (intPos = 0; intPos < 6; intPos++) {
          intValor = int.parse(strBase.substring(intPos, intPos + 1));
          intValor = intValor * (8 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 10;
        strDigito2 = intResto == 0 ? "0" : (10 - intResto).toString();
        strBase2 = strBase.substring(0, 6) + strDigito2;
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
        strBase2 = strBase.substring(0, 6) + strDigito2;
        intSoma = 0;
        for (intPos = 0; intPos < 7; intPos++) {
          intValor = int.parse(strBase2.substring(intPos, intPos + 1));
          intValor = intValor * (9 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
      }
      strBase2 = strBase.substring(0, 6) + strDigito1 + strDigito2;
      if (strBase2 == strOrigem) {
        valid = true;
      }
    case "CE": // Ceara
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
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
      strBase2 = strBase.substring(0, 8) + strDigito1;
      if (strBase2 == strOrigem) {
        valid = true;
      }
      break;
    case "DF": // Distrito Federal
      strBase = ("${strOrigem.trim()}0000000000000").substring(0, 13);
      if (strBase.substring(0, 3) == "073") {
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
        strBase2 = strBase.substring(0, 11) + strDigito1;
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
        strBase2 = strBase.substring(0, 12) + strDigito2;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
      break;
    case "ES": // Espirito Santo
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      intSoma = 0;
      for (intPos = 0; intPos < 8; intPos++) {
        intValor = int.parse(strBase.substring(intPos, intPos + 1));
        intValor = intValor * (10 - intPos);
        intSoma = intSoma + intValor;
      }
      intResto = intSoma % 11;
      strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
      strBase2 = strBase.substring(0, 8) + strDigito1;
      if (strBase2 == strOrigem) {
        valid = true;
      }
      break;
    case "GO": // Goias
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      if (["10", "11", "15"].contains(strBase.substring(0, 2))) {
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
          intNumero = int.parse(strBase.substring(0, 8));
          strDigito1 = (intNumero >= 10103105 && intNumero <= 10119997) ? "1" : "0";
        } else {
          strDigito1 = (11 - intResto).toString();
        }
        strBase2 = strBase.substring(0, 8) + strDigito1;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
      break;
    case "MA": // Maranhão
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      if (strBase.substring(0, 2) == "12") {
        intSoma = 0;
        for (intPos = 0; intPos < 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos, intPos + 1));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase.substring(0, 8) + strDigito1;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
      break;
    case "MT": // Mato Grosso
      while (strOrigem.length < 11) {
        strOrigem = "0$strOrigem";
      }
      String strBase = ("${strOrigem.trim()}000000000").substring(0, 11);
      int d01 = int.parse(strBase.substring(0, 1));
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
        valid = true;
      }
    case "MS": // Mato Grosso do Sul
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      if (strBase.substring(0, 2) == "28") {
        intSoma = 0;
        for (intPos = 1; intPos <= 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos - 1, intPos));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase.substring(0, 8) + strDigito1;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
      break;
    case "MG": // Minas Gerais
      strBase = ("${strOrigem.trim()}0000000000000").substring(0, 13);
      strBase2 = "${strBase.substring(0, 3)}0${strBase.substring(3, 11)}";
      intNumero = 2;
      for (intPos = 0; intPos < 12; intPos++) {
        intValor = int.parse(strBase2.substring(intPos, intPos + 1));
        intNumero = intNumero == 2 ? 1 : 2;
        intValor = intValor * intNumero;
        if (intValor > 9) {
          String strDigito1 = intValor.toString().padLeft(2, '0');
          intValor = int.parse(strDigito1.substring(0, 1)) + int.parse(strDigito1.substring(1, 2));
        }
        intSoma = intSoma + intValor;
      }
      intValor = intSoma;
      while (intValor % 10 != 0) {
        intValor = intValor + 1;
      }
      String strDigito1 = (intValor - intSoma).toString().padLeft(2, '0');
      strBase2 = strBase.substring(0, 11) + strDigito1;
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
        valid = true;
      }
      break;
    case "PA": // Para
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      if (strBase.substring(0, 2) == "15") {
        intSoma = 0;
        for (intPos = 0; intPos < 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos, intPos + 1));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase.substring(0, 8) + strDigito1;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
      break;
    case "PB": // Paraiba
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
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
      strBase2 = strBase.substring(0, 8) + strDigito1;
      if (strBase2 == strOrigem) {
        valid = true;
      }
    case "PE": // Pernambuco
      strBase = ("${strOrigem.trim()}00000000000000").substring(0, 14);
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
      strBase2 = strBase.substring(0, 13) + strDigito1;
      if (strBase2 == strOrigem) {
        valid = true;
      }
      break;
    case "PI": // Piaui
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      intSoma = 0;
      for (intPos = 0; intPos < 8; intPos++) {
        intValor = int.parse(strBase.substring(intPos, intPos + 1));
        intValor = intValor * (10 - intPos);
        intSoma = intSoma + intValor;
      }
      intResto = intSoma % 11;
      strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
      strBase2 = strBase.substring(0, 8) + strDigito1;
      if (strBase2 == strOrigem) {
        valid = true;
      }
      break;
    case "PR": // Parana
      strBase = ("${strOrigem.trim()}0000000000").substring(0, 10);
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
      strBase2 = strBase.substring(0, 8) + strDigito1;
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
        valid = true;
      }
      break;
    case "RJ": // Rio de Janeiro
      strBase = ("${strOrigem.trim()}00000000").substring(0, 8);
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
      strBase2 = strBase.substring(0, 7) + strDigito1;
      if (strBase2 == strOrigem) {
        valid = true;
      }
    case "RN": // Rio Grande do Norte
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      if (strBase.substring(0, 2) == "20") {
        intSoma = 0;
        for (intPos = 1; intPos <= 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos - 1, intPos));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intSoma = intSoma * 10;
        intResto = intSoma % 11;
        strDigito1 = intResto > 9 ? "0" : intResto.toString();
        strBase2 = strBase.substring(0, 8) + strDigito1;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
      break;
    case "RO": // Rondonia, estado alterado
      strBase = ("${strOrigem.trim()}000000000").substring(0, 14);
      int d01 = int.parse(strBase.substring(0, 1));
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
        valid = false;
      } else {
        valid = true;
      }
      break;
    case "RR": // Roraima
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      if (strBase.substring(0, 2) == "24") {
        intSoma = 0;
        for (intPos = 1; intPos <= 8; intPos++) {
          intValor = int.parse(strBase.substring(intPos - 1, intPos));
          intValor = intValor * intPos;
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 9;
        strDigito1 = intResto.toString().substring(intResto.toString().length - 1);
        strBase2 = strBase.substring(0, 8) + strDigito1;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
      break;
    case "RS": // Rio Grande do Sul
      strBase = ("${strOrigem.trim()}0000000000").substring(0, 10);
      intNumero = int.parse(strBase.substring(0, 3));
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
        strBase2 = strBase.substring(0, 9) + strDigito1;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
    case "SC": // Santa Catarina
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
      intSoma = 0;
      for (intPos = 1; intPos <= 8; intPos++) {
        intValor = int.parse(strBase.substring(intPos - 1, intPos));
        intValor = intValor * (10 - intPos);
        intSoma = intSoma + intValor;
      }
      intResto = intSoma % 11;
      strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
      strBase2 = strBase.substring(0, 8) + strDigito1;
      if (strBase2 == strOrigem) {
        valid = true;
      }
      break;
    case "SE": // Sergipe
      strBase = ("${strOrigem.trim()}000000000").substring(0, 9);
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
      strBase2 = strBase.substring(0, 8) + strDigito1;
      if (strBase2 == strOrigem) {
        valid = true;
      }
    case "SP": // São Paulo
      if (strOrigem.substring(0, 1) == "P") {
        strBase = ("${strOrigem.trim()}0000000000000").substring(0, 13);
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
        strBase2 = strBase.substring(0, 8) + strDigito1 + strBase.substring(10, 13);
      } else {
        strBase = ("${strOrigem.trim()}000000000000").substring(0, 12);
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
        strBase2 = strBase.substring(0, 8) + strDigito1 + strBase.substring(9, 11);
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
        valid = true;
      }
      break;
    case "TO": // Tocantins
      strBase = ("${strOrigem.trim()}00000000000").substring(0, 11);
      if (["01", "02", "03", "99"].contains(strBase.substring(2, 4))) {
        strBase2 = strBase.substring(0, 2) + strBase.substring(4, 10);
        intSoma = 0;
        for (intPos = 1; intPos <= 8; intPos++) {
          intValor = int.parse(strBase2.substring(intPos - 1, intPos));
          intValor = intValor * (10 - intPos);
          intSoma = intSoma + intValor;
        }
        intResto = intSoma % 11;
        strDigito1 = intResto < 2 ? "0" : (11 - intResto).toString();
        strBase2 = strBase.substring(0, 10) + strDigito1;
        if (strBase2 == strOrigem) {
          valid = true;
        }
      }
      break;
  }
  return valid;
}
