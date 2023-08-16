import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../controller/controller.dart';
part 'cadastro_state.dart';

class CadastroCubit extends Cubit<CadastroState> {
  Controller controller = Controller();
  CadastroCubit() : super(CadastroInitial()) {
    getCompanyData();
  }

  getCompanyData() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(CompiledCompanyData(
      companyName: controller.cadastroService.name,
      cnpj: controller.cadastroService.documentNumber,
    ));
  }
}
