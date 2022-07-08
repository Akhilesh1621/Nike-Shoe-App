import 'package:flutter/material.dart';

import '../models/models.dart';

class ShoeList extends StatelessWidget {
  final List<ShoesList> shoe;
  const ShoeList({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoe.length,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Color(0xD0F3F3F3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  shoe[index].imageUrl,
                  height: 200.0,
                ),
                Text(
                  shoe[index].name,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  shoe[index].catagory,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "\$ ${shoe[index].price.toString()}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
