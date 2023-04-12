import 'package:exam_contact/Screen/homeScreen.dart';
import 'package:exam_contact/utiles/contactClass.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
String? path;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "New Contact",
          style: TextStyle(color: Colors.black, letterSpacing: 1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            String name = txtname.text;
            String number = txtname.text;
            Contact c1 = Contact(name: name, number: number, imagePath: path);
            contactList.add(c1);
            Navigator.pop(context);
          },
          child: Icon(Icons.done)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 30),
                              Text(
                                "Select Images",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 25,
                                    letterSpacing: 1),
                              ),
                              SizedBox(height: 30),
                              InkWell(onTap: () async {
                                ImagePicker imagepicker = ImagePicker();
                                XFile? xfile = await imagepicker.pickImage(source: ImageSource.gallery);
                                setState(() {
                                  path = xfile!.path;
                                });
                                Navigator.pop(context);
                              },child: Text("Albums",style: TextStyle(fontSize: 15,letterSpacing: 1),)),
                              SizedBox(height: 30),
                              InkWell(onTap: () async {
                                ImagePicker imagepicker = ImagePicker();
                                XFile? xfile = await imagepicker.pickImage(source: ImageSource.gallery);
                                setState(() {
                                  path = xfile!.path;
                                });
                                Navigator.pop(context);
                              },child: Text("Camera",style: TextStyle(fontSize: 15,letterSpacing: 1),)),
                              SizedBox(height: 30),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: path==null?CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user.png"),
                    radius: 60,
                  ):CircleAvatar(
                    backgroundImage: NetworkImage("$path"),
                    radius: 60,
                  )),
              SizedBox(height: 20),
              TextField(
                controller: txtname,
                decoration: InputDecoration(
                  label: Text("Name"),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: txtnumber,
                decoration: InputDecoration(
                  label: Text("Number"),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
