import 'package:apifirstdemo/articlesmodelcalss.dart';
import 'package:apifirstdemo/providerclass.dart';
import 'package:apifirstdemo/service/newsApi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detailspage.dart';

class Homepage extends StatefulWidget {
  String country;
  String category;
  Homepage({Key? key, required this.country, required this.category})
      : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // NewsApi newsApi = NewsApi();

  @override
  Widget build(BuildContext context) {
    // var datas=context.watch<NewProvider>().data;
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder<List<Newscad>>(
          // future: newsApi.getNews('${widget.country}', '${widget.category}'),
        future: Provider.of<NewProvider>(context,listen: false).getnews(widget.country, widget.category),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    var news = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detailspage(
                                      namea: news.source!.name,
                                      image: news.urlToImage.toString(),
                                      name: news.title.toString(),
                                      discription: news.description.toString(),
                                    ),
                                  ));
                            },
                            child: snapshot.data?[index].urlToImage != null
                                ? Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data![index].urlToImage
                                                .toString()),
                                            fit: BoxFit.cover)),
                                  )
                                : Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000'))),
                                  ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    news.source!.name,
                                    // or       snapshot.data[index].source!.name,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                color: Colors.red,
                                shape: StadiumBorder(
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              Text(
                                news.title.toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                news.description.toString(),
                                style: TextStyle(fontSize: 15),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
