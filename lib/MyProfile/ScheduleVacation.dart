
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwalamilk/Constants/appConstants.dart';
class ScheduleVacation extends StatefulWidget {
  const ScheduleVacation({Key? key}) : super(key: key);

  @override
  State<ScheduleVacation> createState() => _ScheduleVacationState();
}

class _ScheduleVacationState extends State<ScheduleVacation> {

  DateTime currentEndDate = DateTime.now();
  DateTime currentStartDate = DateTime.now();
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedEndDate = await showDatePicker(
        context: context,
        initialDate: currentStartDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2090));
    if (pickedEndDate != null && pickedEndDate != currentStartDate)
      setState(() {
        currentStartDate = pickedEndDate;
      });
  }
  Future<void> _selectEndtDate(BuildContext context) async {
    final DateTime? pickedEndDate = await showDatePicker(
        context: context,
        initialDate: currentEndDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2090));
    if (pickedEndDate != null && pickedEndDate != currentEndDate)
      setState(() {
        currentEndDate = pickedEndDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.black,backgroundColor: Colors.white,elevation: 0.5,title: Text('Schedule Vacation'),
      actions: [ElevatedButton(onPressed: (){}, child: Text('Reset'),style: ElevatedButton.styleFrom(primary: AppConstants.buttonColor),)],),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(height: 35,),
            Text('Create Vaction',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('Suspend all delivery during vacation choose start date and end date.'),
              SizedBox(height: 25,),
            Row(
              children: [
                Container(height: 50,width: 50,child:Icon(FontAwesomeIcons.repeat,color: Colors.red,),),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Subscription will be Extended',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                    Text('Your subscrtion will be resumed when you \nare back.'),

                  ],
                ),
              ],
            ),

              SizedBox(height: 35,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(height: 50,width: 50,child: Icon(FontAwesomeIcons.indianRupeeSign,color: Colors.green,)),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery once order refunded',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('We will automatically cancel and refund one \ntime order.',style: TextStyle(fontSize: 15,color: Colors.black54),),
                  ],
                ),
              ],
            ),
              SizedBox(height: 15,),
              Divider(),
              SizedBox(height: 15,),
            Text('Select Vacation Dates',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              SizedBox(height: 15,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        _selectStartDate(context);
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xFFF5F5F5)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 7, left: 8),
                                  child: Text(
                                    'Start Date',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2, left: 8),
                                  child: Text(
                                    '${currentStartDate.day}/${currentStartDate.month}/${currentStartDate.year}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        _selectEndtDate(context);
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xFFF5F5F5)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 7, left: 8),
                                  child: Text(
                                    'End Date',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2, left: 8),
                                  child: Text(
                                    '${currentEndDate.day}/${currentEndDate.month}/${currentEndDate.year}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(child: Image.asset('assets/tour.png',height: 250,),),
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: AppConstants.buttonColor), child: Text('Set Vacation'))
          ],),
        ),
      ),
    );
  }
}
