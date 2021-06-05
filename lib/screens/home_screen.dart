import 'package:flutter/material.dart';
import 'package:ibtikartask/model/home_model.dart';
import 'package:ibtikartask/provider/provider.dart';
import 'package:ibtikartask/screens/detailes_screen.dart';
import 'package:ibtikartask/services/services.dart';
import 'package:provider/provider.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("movies"),
      ),
      body: ChangeNotifierProvider<MainProvider>(
        create: (context) => MainProvider(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: FutureBuilder<PopularModel>(
                  future: PostService().getData(page),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.done&&snapshot.hasData)
                    {
                      return NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if ( scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent&&page!=snapshot.data!.totalPages) {
                            // start loading data
                            setState(() {
                              page++;
                            });
                            PostService().getData(page);
                          }
                          return true;
                        },
                        child:  Consumer<MainProvider>(
                    builder: (buildContext, mainProvider, _){
                      return ListView.builder(
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(results:snapshot.data!.results![index])));
                            } ,
                            title: Text('${snapshot.data!.results![index].title}'),
                            leading: Image.network("$imagePath${snapshot.data!.results![index].posterPath}"),
                            trailing: Text("${snapshot.data!.results![index].popularity}"),
                          );
                        },
                      );
                    }

                        ),
                      );
                    }
                    else return Center(child: CircularProgressIndicator(),);
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}