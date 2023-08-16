// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cadastro_cubit.dart';

@immutable
abstract class CadastroState {}

class CadastroInitial extends CadastroState {}

class WaitingCompanyData extends CadastroState {}

class CompiledCompanyData extends CadastroState {
  String companyName;
  String cnpj;
  CompiledCompanyData({
    required this.companyName,
    required this.cnpj,
  });
}
