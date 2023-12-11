import 'package:expenso70/app_static.dart';
import 'package:flutter/material.dart';

class AllExpensesPage extends StatelessWidget {
  const AllExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = AppStatic.dummyExpense;
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
      ),

      body: ListView.builder(
        itemCount: data.length,
          itemBuilder: (_, parentIndex){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data[parentIndex]['date'].toString()),
                      Text(data[parentIndex]['amt'].toString())
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: (data[parentIndex]['transactions'] as List<Map<String, dynamic>>).length,
                      itemBuilder: (_, childIndex){

                        Map<String, dynamic> eachTransaction = (data[parentIndex]['transactions'] as List<Map<String, dynamic>>)[childIndex];

                    return ListTile(
                      leading: Image.network(eachTransaction['catImg']),
                      title: Text(eachTransaction['title']),
                      subtitle: Text(eachTransaction['desc']),
                      trailing: Column(
                        children: [
                          Text(eachTransaction['amt']),
                          Text(eachTransaction['balance'])
                        ],
                      ),
                    );
                  })
                ],
              ),
            );
          }),
    );
  }
}
