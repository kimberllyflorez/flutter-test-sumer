import 'package:flutter/material.dart';

class GifItems extends StatelessWidget {
  final String id;

  const GifItems({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: (MediaQuery.of(context).size.width / 2) - 30,
      child: Image.network(
        'https://i.giphy.com/media/$id/200w.webp',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
