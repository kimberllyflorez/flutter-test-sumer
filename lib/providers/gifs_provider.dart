
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter_sumer/models/gif_model.dart';

class GifsProvider extends ChangeNotifier {
  final String _apiKey = 'GZXrplebPP7eMvV4NzLYY08QWX73ETNM';
  final String _basUrl = 'api.giphy.com';
  List<Datum> onGifs = [];
  bool isLoading = false;

  GifsProvider() {
    getOnDisplayGifs();
  }

  getOnDisplayGifs() async {
    callLoading();
    var url = Uri.https(_basUrl, 'v1/gifs/trending', {
      'api_key': _apiKey,
    });
    final response = await http.get(url);
    final playingResponse = gifModelFromJson(response.body);
    onGifs = playingResponse.data;
    disposeLoading();
    notifyListeners();
  }

  getGifBySearch(String query) async {
    callLoading();
    var url = Uri.https(_basUrl, 'v1/gifs/search', {
      'api_key': _apiKey,
      'q': query,
    });
    final response = await http.get(url);
    final playingResponse = gifModelFromJson(response.body);
    onGifs = playingResponse.data;
    disposeLoading();
    notifyListeners();
  }

  callLoading(){
    isLoading = true;
    notifyListeners();
  }

  disposeLoading(){
    isLoading = false;
    notifyListeners();
  }
}
