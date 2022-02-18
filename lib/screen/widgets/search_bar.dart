import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_sumer/providers/gifs_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gifsProvider = Provider.of<GifsProvider>(context, listen: true);

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by name',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                gifsProvider.getGifBySearch(value);
              },
            ),
          )
        ],
      ),
    );
  }
}
