import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewRecords extends StatelessWidget {
  Future fetchSubjects() async {
    var response = await http.get(Uri.parse("https://pcc.edu.pk/ws/list/ls_providers.php"));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Records'),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchSubjects(),
          builder: (BuildContext _, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          showBottomBorder: true,
                           columnSpacing: 14,
                          columns: [
                            DataColumn(label: Text('First Name')),
                            DataColumn(label: Text('Last Name')),
                            DataColumn(label: Text('Gender')),
                            DataColumn(label: Text('Phone')),
                            DataColumn(label: Text('Email')),
                          ],
                          rows: snapshot.data
                              .map<DataRow>(
                                (record) => DataRow(cells: [
                                  DataCell(Text(record['firstName'] ?? '___')),
                                  DataCell(Text(record['lastName'] ?? '___')),
                                  DataCell(
                                      Text(record['gender'] ?? '___')),
                                  DataCell(Text(record['phone'] ?? '___')),
                                  DataCell(Text(record['email'] ?? '___')),
                                ]),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}