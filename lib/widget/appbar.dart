import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appBarMenu({required TabBar bottom}) => AppBar(
      centerTitle: true,
      bottom: bottom,
      elevation: 0,
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Image.asset(
        'assets/Nikelogo.png',
        height: 20.0,
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        const Icon(
          CupertinoIcons.search,
          color: Colors.black,
          size: 30.0,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ),
          ),
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          width: 60.0,
          // ignore: prefer_const_literals_to_create_immutables
          child: Stack(children: [
            const Positioned(
              right: 10.0,
              bottom: 15.0,
              child: Icon(Icons.shopping_bag),
            ),
            Positioned(
              right: 10.0,
              bottom: 28.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0)),
                width: 10.0,
                height: 10.0,
              ),
            )
          ]),
        )
      ],
    );
