import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_sumer/models/gif_model.dart';
import 'package:test_flutter_sumer/providers/gifs_provider.dart';
import 'package:test_flutter_sumer/screen/widgets/git_items.dart';
import 'package:test_flutter_sumer/screen/widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SearchBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: content(context),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget content(BuildContext context) {
    final gifsProvider = Provider.of<GifsProvider>(context, listen: true);
    if (gifsProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (gifsProvider.onGifs.isNotEmpty) {
      final gifMap = splitList(gifsProvider.onGifs);
      return list(gifMap);
    }
    return const Center(
      child: Text('No items found'),
    );
  }

  Widget list(Map<String, List<Datum>> gifMap) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [...gifMap['list1']!.map((e) => GifItems(id: e.id))],
        ),
        Column(
          children: [...gifMap['list2']!.map((e) => GifItems(id: e.id))],
        ),
      ],
    );
  }

  Map<String, List<Datum>> splitList(List<Datum> gifList) {
    final List<Datum> list1 = [];
    final List<Datum> list2 = [];
    for (int i = 0; i < gifList.length; i++) {
      if (i % 2 == 0) {
        list1.add(gifList[i]);
      } else {
        list2.add(gifList[i]);
      }
    }
    return {
      'list1': list1,
      'list2': list2,
    };
  }
}
