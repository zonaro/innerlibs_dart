import 'package:flutter_test/flutter_test.dart';
import 'package:innerlibs/innerlibs.dart';

void main() {
  test('Test ChaveNFe.fromComponents', () async {
    final chaveNFe = await ChaveNFe.fromComponents(
      uf: 'SP',
      cnpj: '12345678901234',
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.uf, 35);
    expect(chaveNFe.cnpj, 12345678901234);
    expect(chaveNFe.ano, 2022);
    expect(chaveNFe.mes, 10);
    expect(chaveNFe.modelo, 55);
    expect(chaveNFe.serie, 1);
    expect(chaveNFe.nota, 123456789);
    expect(chaveNFe.formaEmissao, 1);
    expect(chaveNFe.codigo, 123);
  });

  test('Test ChaveNFe.fromString', () {
    const chaveString = '35101012345678901234550010000012345678901234';
    final chaveNFe = ChaveNFe.fromString(chaveString);

    expect(chaveNFe.uf, 35);
    expect(chaveNFe.cnpj, 12345678901234);
    expect(chaveNFe.ano, 10);
    expect(chaveNFe.mes, 12);
    expect(chaveNFe.modelo, 345);
    expect(chaveNFe.serie, 678);
    expect(chaveNFe.nota, 901234);
    expect(chaveNFe.formaEmissao, 500);
    expect(chaveNFe.codigo, 100000);
    expect(chaveNFe.digito, 1234);
  });

  test('Test ChaveNFe.tipo', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.tipo, 'NF-e');
  });

  test('Test ChaveNFe.chaveFormatadaTraco', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.chaveFormatadaTraco, '35-2210-12345678901234-55-001-123456789-1-123');
  });

  test('Test ChaveNFe.chaveFormatadaComEspacos', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.chaveFormatadaComEspacos, '35 2210 12345678901234 55 001 123456789 1 123');
  });

  test('Test ChaveNFe.mesAno', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.mesAno, '2210');
  });

  test('Test ChaveNFe.modeloFixo', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.modeloFixo, '55');
  });

  test('Test ChaveNFe.notaFixo', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.notaFixo, '123456789');
  });

  test('Test ChaveNFe.serieFixo', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.serieFixo, '001');
  });

  test('Test ChaveNFe.ufFixo', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.ufFixo, '35');
  });

  test('Test ChaveNFe.formaEmissaoFixo', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.formaEmissaoFixo, '1');
  });

  test('Test ChaveNFe.cnpjFixo', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.cnpjFixo, '12345678901234');
  });

  test('Test ChaveNFe.codigoFixo', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
    );

    expect(chaveNFe.codigoFixo, '123');
  });

  test('Test ChaveNFe.digitoFixo', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
      digito: 1234,
    );

    expect(chaveNFe.digitoFixo, '1234');
  });

  test('Test ChaveNFe.calcularDigitoChave', () {
    const chaveString = '35101012345678901234550010000012345678901234';
    final digito = ChaveNFe.calcularDigitoChave(chaveString);

    expect(digito, 1234);
  });

  test('Test ChaveNFe.toString', () {
    final chaveNFe = ChaveNFe(
      uf: 35,
      cnpj: 12345678901234,
      ano: 2022,
      mes: 10,
      modelo: 55,
      serie: 1,
      nota: 123456789,
      formaEmissao: 1,
      codigo: 123,
      digito: 1234,
    );

    expect(chaveNFe.toString(), '35101012345678901234550010000012345678901234');
  });
}
