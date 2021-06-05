import 'package:flutter/cupertino.dart';
import 'package:ibtikartask/model/home_model.dart';
import 'package:ibtikartask/repository/movie_repository.dart';

class MainProvider with ChangeNotifier{
  late List<PopularModel> popularModel;
  //Movierepository _postRepository = Movierepository();
  // MainProvider(){
  // //  getPosts();
  // }
  // void getPosts() {
  //   _postRepository.fetchPosts().then(
  //           (newPosts){
  //             popularModel = newPosts;
  //         notifyListeners();
  //       }
  //   );
  // }
}