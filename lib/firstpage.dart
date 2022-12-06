import 'package:apifirstdemo/homepage.dart';
import 'package:apifirstdemo/service/newsApi.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {

  @override
  Widget build(BuildContext context) {
    TextEditingController countrycontroler=TextEditingController();
    TextEditingController categorycontroler=TextEditingController();
    return  Scaffold(
      backgroundColor: Colors.grey,
appBar: AppBar(title: Text('enter country'),),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: countrycontroler,
                decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.zero),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.zero),
                labelText: 'Enter county',
                  hintText: ' eg: US',
                    labelStyle: TextStyle(color: Colors.white)
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: categorycontroler,
                decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.zero),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.zero),
                    labelText: 'Enter category',
                  hintText: 'technology',
                  labelStyle: TextStyle(color: Colors.white)
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: 200,
               decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black,),
                child: TextButton(
                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(country: countrycontroler.text,category: categorycontroler.text,)));
                    // countrycontroler.text='';
                    // categorycontroler.text='';
                  },
                  child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
