import 'package:flutter/material.dart';
import '../../../../application/services/report_generic_service.dart';

enum EItem { register, reports, newOrder, deliveryTicket }

class PrincipalMenu extends StatefulWidget {
  final ReportGenerate reportGenerate;
  const PrincipalMenu({
    Key? key,
    required this.reportGenerate,
  }) : super(key: key);

  @override
  State<PrincipalMenu> createState() => _PrincipalMenuState();
}

class _PrincipalMenuState extends State<PrincipalMenu> {
  EItem? selectedMenu;

// onSelected
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert, color: Colors.black),
      itemBuilder: (_) {
        return [
          PopupMenuItem(
            child: PopupMenuButton(
              child: Row(
                children: const [
                  Text("Cadastrar"),
                  Spacer(flex: 1),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                    size: 30,
                  ),
                ],
              ),
              itemBuilder: (_) {
                return [
                  PopupMenuItem(
                      child: Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        color: Colors.blue,
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Text("Cadastrar Cliente"),
                    ],
                  )),
                  PopupMenuItem(
                      child: Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        color: Colors.blue,
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Text("Cadastrar Produto"),
                    ],
                  )),
                  PopupMenuItem(
                      child: Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        color: Colors.blue,
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Text("Cadastrar Atendente"),
                    ],
                  )),
                ];
              },
            ),
          ),
          PopupMenuItem(
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute<void>(builder: (BuildContext context) => ReportPage(reportGenerate: null, ereport: null,)),
            // ),
            child: PopupMenuButton(
              child: Row(
                children: const [
                  Text('Relatórios'),
                  Spacer(flex: 1),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                    size: 30,
                  ),
                ],
              ),
              itemBuilder: (context) {
                return [
                  // PopupMenuItem(
                  //     onTap: () {
                  //       print('kjbwejc');
                  //       // await Future.delayed(Duration.zero);
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute<void>(builder: (BuildContext context) => goToGenericPageReport()),
                  //       );
                  //     },
                  //     child: Text('Relatório de Vendas')),
                  // PopupMenuItem(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute<void>(builder: (BuildContext context) => goToGenericPageReport()),
                  //       );
                  //     },
                  //     child: Text('Relatório de Entregas')),
                  // PopupMenuItem(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute<void>(builder: (BuildContext context) => goToGenericPageReport()),
                  //       );
                  //     },
                  //     child: Text('Relatório de Estoques')),
                  // PopupMenuItem(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute<void>(builder: (BuildContext context) => goToGenericPageReport()),
                  //       );
                  //     },
                  //     child: Text('Relatório de Comissões')),
                ];
              },
            ),
          ),
          PopupMenuItem(
            child: PopupMenuButton(
              child: const Text('Novo Pedido'),
              itemBuilder: (_) {
                return [
                  // PopupMenuItem(child: Text("Cadastrar Atendente")),
                ];
              },
            ),
          ),
          PopupMenuItem(
            child: PopupMenuButton(
              child: const Text('Ticket de Entrega'),
              itemBuilder: (_) {
                return [
                  // PopupMenuItem(child: Text("Cadastrar Atendente")),
                ];
              },
            ),
          ),
        ];
      },
    );
  }

  // goToGenericPageReport() {
  //   return GenericReport(
  //     totalList: widget.reportGenerate.sizeListReport,
  //     reportGenerate: ReportGenerate.salesReport(),
  //     itemName: widget.reportGenerate.nameItemReport,
  //     detailInfo: widget.reportGenerate.detailItemReport,
  //     totalByItem: widget.reportGenerate.valueItemReport,
  //     titleReport: widget.reportGenerate.titleReport,
  //   );
  // }
}
