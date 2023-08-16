import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_desafio_flutter/presentation/pages/consolidated_values_page.dart';
import '../../application/services/report_generic_service.dart';
import '../core/widgets/menu/principal_menu.dart';

final formatter = NumberFormat("#,##0.00", "pt_BR");

class ConsolidatedValuesPage extends StatelessWidget {
  const ConsolidatedValuesPage({super.key});

  String get titlePage => 'Relatórios';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          titlePage,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [PrincipalMenu(reportGenerate: ReportGenerate.salesReport())],
      ),
      body: Column(children: [
        const Expanded(
          flex: 20,
          child: SalesTotalResume(),
        ),
        Expanded(
          flex: 25,
          child: Row(children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
              child: Column(children: [
                const GenericInfoCompany(),
                Expanded(
                  flex: 10,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          titlePage,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const BoxTotalReport(),
              ]),
            )),
          ]),
        ),
      ]),
    );
  }
}
