import 'package:projeto_desafio_flutter/application/services/cadastro_service.dart';
import 'package:projeto_desafio_flutter/application/services/report_generic_service.dart';
import 'package:projeto_desafio_flutter/presentation/core/utils/page_info_generic.dart';

class Controller {
  final salesReport = ReportGenerate.salesReport();
  final commissionReport = ReportGenerate.commissionReport();
  final stockReport = ReportGenerate.stockReport();
  final deliveryReport = ReportGenerate.deliveryReport();
  final cadastroService = CadastroService.companyData();
  final pageGenericInfo = PageGenericInfo.reportPage();
}
