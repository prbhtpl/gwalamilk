import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}
enum addType { Male, Female, }
class _EditProfileState extends State<EditProfile> {
  addType? _character = addType.Male;
  String addtype = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.white,foregroundColor: Colors.black,elevation: 0.0,title: const Text('Profile'),
      actions: [TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
      }, child: Text('Save'))],

    ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                color:Color(0xffDEF1F8),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container( decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    /*  _showMyDialog();*/
                                  },
                                  child: Container(
                                    width: 125,
                                    height: 125,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(color: Colors.blue, width: 1),
                                    ),
                                    child: ClipOval(
                                        child:  Image.asset(
                                          'assets/person1.jpg',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                    onTap: () {

                                    },
                                    child: Text('Change Photo'))
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Full Name',

                                ),
                                Container(
                                  // Specify some width
                                    width: MediaQuery.of(context).size.width * .7,
                                    child: TextFormField(

                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Prabhat Kumar Pal',hintStyle: TextStyle(color:Colors.grey)),
                                    )),

                              ],
                            ),

                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date of Birth',

                            ),
                            SizedBox(height: 5,),
                            Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 0.5)),
                                width: MediaQuery.of(context).size.width ,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [Icon(CupertinoIcons.calendar_badge_minus,color: Colors.grey,),SizedBox(width: 10,),Text('Date of Birth')],),
                                )),

                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gender',
                                  style: TextStyle(fontSize: 18,color: Colors.grey),
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: RadioButtons(),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',

                            ),
                            SizedBox(height: 5,),
                            Container(
                                height: 40,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 0.5)),
                                width: MediaQuery.of(context).size.width ,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(

                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,contentPadding: EdgeInsets.symmetric(vertical: 9),
                                        hintStyle: TextStyle(color:Colors.grey),prefixIcon: Icon(Icons.email)),
                                  ),
                                )),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget RadioButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Radio<addType>(
              value: addType.Male,
              groupValue: _character,
              onChanged: (addType? value) {
                setState(() {
                  _character = value;
                  addtype = addType.Male.name;
                });
                print(addtype);
              },
            ),
            SizedBox(
              width: 5,
            ),
            Text('Male'),
          ],
        ),
        Row(
          children: [
            Radio<addType>(
              value: addType.Female,
              groupValue: _character,
              onChanged: (addType? value) {
                setState(() {
                  _character = value;
                  addtype = addType.Female.name;
                });
                print(addtype);
              },
            ),
            SizedBox(
              width: 5,
            ),
            Text('Female'),
          ],
        ),

      ],
    );
  }
}
