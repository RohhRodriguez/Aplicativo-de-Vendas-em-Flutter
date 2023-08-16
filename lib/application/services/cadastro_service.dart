import 'package:projeto_desafio_flutter/infrastructure/data.dart';

enum ECadastro { productAdd, clientAdd, atendentAdd, companyData }

enum EDataCompany { companyName, cnpj }

class CadastroService {
  final ECadastro cadastro;
  final Mock mock = Mock();

  CadastroService._(this.cadastro);

  factory CadastroService.companyData() => CadastroService._(ECadastro.companyData);
  factory CadastroService.productAdd() => CadastroService._(ECadastro.productAdd);
  factory CadastroService.clientAdd() => CadastroService._(ECadastro.clientAdd);
  factory CadastroService.atendentAdd() => CadastroService._(ECadastro.atendentAdd);

  String get name {
    return {
      ECadastro.companyData: mock.company.companyName,
      ECadastro.productAdd: 'João da Silva',
      ECadastro.clientAdd: 'Pedro Pereira',
      ECadastro.atendentAdd: 'Maria Aparecida',
    }[cadastro]!;
  }

  String get documentNumber {
    return {
      ECadastro.companyData: mock.company.cnpj,
      ECadastro.productAdd: 'João da Silva',
      ECadastro.clientAdd: 'Pedro Pereira',
      ECadastro.atendentAdd: 'Maria Aparecida',
    }[cadastro]!;
  }

  String get label {
    return {
      ECadastro.companyData: 'Nome do Empresa',
      ECadastro.productAdd: 'Nome do Produto',
      ECadastro.clientAdd: 'Nome do Cliente',
      ECadastro.atendentAdd: 'Nome do Atendente',
    }[cadastro]!;
  }

  String get descriptionInput {
    return {
      ECadastro.companyData: 'Insira o Nome do Empresa',
      ECadastro.productAdd: 'Insira o Nome do Produto',
      ECadastro.clientAdd: 'Insira o Nome do Cliente',
      ECadastro.atendentAdd: 'Insira o Nome do Atendente',
    }[cadastro]!;
  }

  getCompanyData(EDataCompany dataCompany) {
    switch (dataCompany) {
      case EDataCompany.companyName:
        return mock.company.companyName;
      case EDataCompany.cnpj:
        return mock.company.cnpj;
    }
  }
}
