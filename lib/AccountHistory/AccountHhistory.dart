import 'package:flutter/material.dart';
import 'package:gwalamilk/AccountHistory/orderDetails.dart';
import 'package:gwalamilk/DrawerWidget/drawerWidget.dart';

class AccountHistory extends StatefulWidget {
  const AccountHistory({Key? key}) : super(key: key);

  @override
  State<AccountHistory> createState() => _AccountHistoryState();
}

class _AccountHistoryState extends State<AccountHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        title: const Text('Account History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [TransactionHistoryWidget()],
        ),
      ),
    );
  }

  Widget TransactionHistoryWidget() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (BuildContext, int index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  title:
                      Text('Wallet to wallet tranfer,balance added to account'),
                  leading: ClipRRect(
                    child: Image.asset('assets/milk.jpg'),
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Text('Repeat ORder'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(width: 2, color: Colors.green)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            child: Text('View Order'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('2020-07-12 18:50:00'),
                          Text('TransactionId G19LWA70'),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '+₹2000',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
