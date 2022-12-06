import 'package:flutter/material.dart';

class Detailspage extends StatefulWidget {
  String image;
  String name;
  String discription;
  String namea;
   Detailspage({Key? key, required this.image,
    required this.name,
    required this.discription,
   required this.namea}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover)),

          ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        widget.namea,
                        style: TextStyle(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                    color: Colors.red,
                    shape: StadiumBorder(
                        side: BorderSide(color: Colors.transparent))),
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),

                ),
                Text(
                  widget.discription,
                  style: TextStyle(fontSize: 15),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
