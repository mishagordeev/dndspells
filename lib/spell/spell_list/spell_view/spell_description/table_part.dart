import 'package:flutter/material.dart';
import 'package:dndspells/styles.dart';

class TablePart extends StatelessWidget {
  final tableData;

  TablePart(this.tableData);

  @override
  Widget build(BuildContext context) {
    List<Widget> table = [];
    List<TableRow> rows = [];
    List<Widget> cells = [];

    for (int row = 0; row < tableData["rows_count"]; row++) {
      for (int column = 0; column < tableData["columns_count"]; column++) {

        String cellText = tableData["rows"][row][column];
        TextAlign columnTextAlign;

        if (tableData["column_alignments"][column] == "center") columnTextAlign = TextAlign.center;
        if (tableData["column_alignments"][column] == "left") columnTextAlign = TextAlign.left;

        row == 0 ?
          cells.add(TableCell(verticalAlignment: TableCellVerticalAlignment.bottom, child: Text(cellText, style: tableTextStyle.copyWith(fontWeight: FontWeight.bold), textAlign: columnTextAlign))):
          cells.add(Text(cellText, style: tableTextStyle, textAlign: columnTextAlign,));
      }

      row % 2 != 0 ?
        rows.add(TableRow(children: cells, decoration: BoxDecoration(color: Colors.black.withOpacity(0.03)))):
        rows.add(TableRow(children: cells));
      cells = [];

    }

    if (tableData["caption"] != null) {
      table.add(Container(alignment: Alignment.centerLeft, padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),child: Text(tableData["caption"],style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold))));
    }

    Map<int, TableColumnWidth> columnWidths = {};
    for (int column = 0; column < tableData["column_widths"].length; column++) {
      if (tableData["column_widths"][column]["type"] == "fixed")
      columnWidths[column] = FixedColumnWidth(tableData["column_widths"][column]["size"].toDouble());
      if (tableData["column_widths"][column]["type"] == "flex")
        columnWidths[column] = FlexColumnWidth(tableData["column_widths"][column]["size"].toDouble());
    }

    table.add(Table(
      columnWidths: columnWidths,
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: rows,
    ));

    table.add(Text(" "));

    return Column(children: table);
  }
}