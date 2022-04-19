
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Notifictions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset('assets/milk.jpg'),
          ),
          title: const Text('Special offers for milk'),
          subtitle: const Text(('Today 10:10 PM')),
          trailing: Container(height: 30,width:60,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.red)),child: Center(child: Text('Pending',style: TextStyle(color: Colors.red),)),),
        ),
      ),
    );
  }
}
