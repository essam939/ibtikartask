// import 'package:connectivity/connectivity.dart';
// import 'package:ibtikartask/local_storge/storge.dart';
// import 'package:ibtikartask/model/home_model.dart';
// import 'package:ibtikartask/services/services.dart';
//
// class Movierepository{
//   PostService _postService = PostService();
//   // check if there a network, if not return saved results from data base
//   Future<List<PopularModel>> fetchPosts() async{
//     // get the network status
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     final dbHelper = DbHelper.instance;
//     // if there is not a network, return saved posts in db
//     if(connectivityResult == ConnectivityResult.none){
//       final savedPosts = await dbHelper.queryAllRows();
//       return List<PopularModel>.from(savedPosts.map((savedPost) => PopularModel.fromJson(savedPost)));
//     } else{
//       final posts = await _postService.getData(1);
//       for(final post in posts){
//         dbHelper.insert(post.toMap());
//       }
//       return posts;
//     }
//   }
// }