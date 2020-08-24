import 'package:flutter/material.dart';

class TableView extends StatelessWidget {
  final tableData;
  final textStyle;

  TableView(this.tableData, this.textStyle);

  @override
  Widget build(BuildContext context) {
    List<Widget> table = [];
    List<TableRow> rows = [];
    List<Widget> cells = [];
    for (var r = 0; r < tableData["rows_count"]; r++) {
      for (var c = 0; c < tableData["cols_count"]; c++) {

        String cellText = tableData["rows"][r][c];
        TextAlign columnTextAlign;

        if (tableData["columns_alignment"][c] == "center") {
          columnTextAlign = TextAlign.center;
        }
        if (tableData["columns_alignment"][c] == "left") {
          columnTextAlign = TextAlign.left;
        }

        if (r == 0) {
          cells.add(Text(cellText, style: textStyle.copyWith(fontWeight: FontWeight.bold), textAlign: columnTextAlign));
        } else {
          cells.add(Text(cellText, style: textStyle, textAlign: columnTextAlign,));
        }
      }

      if (r % 2 != 0) {
        rows.add(TableRow(children: cells, decoration: BoxDecoration(color: Colors.black.withOpacity(0.03))));
      } else {
        rows.add(TableRow(children: cells));
      }
      cells = [];

    }

    if (tableData["caption"].length != 0) {
      table.add(Text(tableData["caption"],style: textStyle,));
    }

    Map<int, TableColumnWidth> cw = {};
    List cw1 = tableData["columns_width"];
    for (int k = 0; k < cw1.length; k++) {
      if (cw1[k] == 0) continue;
      cw[k] = FixedColumnWidth(cw1[k].toDouble());
      print(cw[k]);
    }

    table.add(Table(
          columnWidths: cw,
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children: rows,
        )
    );

    return Column(children: table);
  }
}