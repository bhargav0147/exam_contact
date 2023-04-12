import 'package:exam_contact/utiles/contactClass.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

List<Contact> contactList = [
  Contact(name: "Akshay", number: "9988776655", imagePath: null),
  Contact(name: "Ajay", number: "8877665544", imagePath: null),
  Contact(name: "Kajol", number: "6352645879", imagePath: null),
  Contact(name: "Kareena", number: "9105023564", imagePath: null),
  Contact(name: "Alia", number: "9825026265", imagePath: null),
  Contact(name: "Aryan", number: "8866115566", imagePath: null),
  Contact(name: "Sahrukh", number: "9876543210", imagePath: null),
  Contact(name: "The Rock", number: "9725046598", imagePath: null),
  Contact(name: "Jack", number: "9911223344", imagePath: null),
  Contact(name: "Iron Man", number: "9157466535", imagePath: null),
  Contact(name: "Thor", number: "9988552266", imagePath: null),
  Contact(name: "Ketrina", number: "9998886661", imagePath: null),
  Contact(name: "Rocky", number: "6351263758", imagePath: null),
  Contact(name: "Rakul", number: "91574632656", imagePath: null),
  Contact(name: "Rashmika", number: "8866220055", imagePath: null),
];
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "MY CONCTACT",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'add').then((value) {
              setState(() {

              });
            },);
          },
          child: Icon(
            Icons.add,
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Type name or number",
                      style: TextStyle(letterSpacing: 1, fontSize: 15),
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 700,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (context, index) => myContact(index),
                  itemCount: contactList.length,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget myContact(int index) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)
          ]),
      child: Row(
        children: [
          SizedBox(width: 10),
          contactList[index].imagePath==null?CircleAvatar(
            backgroundImage: AssetImage("assets/images/user.png"),
            radius: 20,
          ):CircleAvatar(
            backgroundImage: NetworkImage("${contactList[index].imagePath}"),
            radius: 20,
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${contactList[index].name}",
                style: TextStyle(
                    color: Colors.blue, letterSpacing: 1, fontSize: 15),
              ),
              Text(
                "${contactList[index].number}",
                style: TextStyle(
                     letterSpacing: 1, fontSize: 15),
              ),
            ],
          ),
          Spacer(),
          IconButton(onPressed: () {
            String link = "mailto: ${contactList[index].number}";
            launchUrl(Uri.parse(link));
          }, icon: Icon(Icons.mail,color: Colors.black12,)),
          SizedBox(width: 5),
          IconButton(onPressed: () {
            String link = "sms: ${contactList[index].number}";
            launchUrl(Uri.parse(link));
          }, icon: Icon(Icons.message,color: Colors.black12,)),
          SizedBox(width: 5),
          IconButton(onPressed: () {
            String link = "tel: ${contactList[index].number}";
            launchUrl(Uri.parse(link));
          }, icon: Icon(Icons.call,color: Colors.black12,)),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
