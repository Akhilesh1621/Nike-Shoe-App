// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoe_app/models/models.dart';

import '../data/data.dart';
import '../widget/widget.dart';

class HomePage extends StatefulWidget {
  final List<Gender> genderlist;
  final List<ShoeSize> shoesize;

  HomePage({Key? key, required this.genderlist, required this.shoesize})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RangeValues _currentRangeValues = const RangeValues(100, 1000);
  late List<bool> selections = List.generate(3, (_) => false);

  late List<bool> sizeselections = List.generate(10, (_) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarMenu(
            bottom: TabBar(
              tabs: [
                const Tab(
                  iconMargin: EdgeInsets.symmetric(horizontal: 10.0),
                  text: 'All',
                ),
                const Tab(
                  text: 'Shoes',
                ),
                const Tab(
                  text: 'Mens',
                ),
                const Tab(
                  text: 'Kids',
                ),
                GenderList(context),
              ],
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.blueGrey,
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ShoeList(
                shoe: shoelist,
              ),
              const Icon(Icons.directions_transit),
              const Icon(Icons.directions_bike),
              const Icon(Icons.directions_bike),
              const Scaffold(),
            ],
          ),
        ),
      ),
    );
  }

// BottomSheet code
  Tab GenderList(BuildContext context) {
    return Tab(
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            // color is applied to main screen when modal bottom screen is displayed
            barrierColor: Color.fromARGB(95, 0, 0, 0),
            //background color for modal bottom screen
            backgroundColor: Colors.white,
            //elevates modal bottom screen
            elevation: 10,
            // gives rounded corner to modal bottom screen
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            builder: (BuildContext context) {
              // UDE : SizedBox instead of Container for whitespaces
              return StatefulBuilder(
                builder: (context, setState) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 132.0),
                              child: Text(
                                'Filters',
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Text(
                                'RESET',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // Gender
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Gender',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
                            itemBuilder: (context, index) =>
                                GenderButton(setState),
                          ),
                        ),
                        // Size toggle Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Size :',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 30.0),
                              child: Text(
                                'UK',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) =>
                                SizeToggleButton(setState),
                          ),
                        ),

                        // Price Progress bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // progress bar

                        SliderTheme(
                          data: const SliderThemeData(
                            overlayColor: Color.fromARGB(66, 255, 135, 71),
                            valueIndicatorColor: Color(0xFFff8847),
                            thumbColor: Color.fromARGB(255, 239, 84, 0),
                            activeTrackColor: Color(0xFFff8847),
                            inactiveTrackColor:
                                Color.fromARGB(255, 221, 221, 221),
                          ),
                          child: RangeSlider(
                            values: _currentRangeValues,
                            max: 1000,
                            divisions: 5,
                            labels: RangeLabels(
                              '\$${_currentRangeValues.start.round().toString()}',
                              '\$${_currentRangeValues.end.round().toString()}',
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                              });
                            },
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Brand',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
                            itemBuilder: (context, index) =>
                                GenderButton(setState),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        icon: const Icon(Icons.filter_list_alt),
      ),
    );
  }

  // GenderButton code

  ToggleButtons GenderButton(StateSetter setState) {
    return ToggleButtons(
      color: Colors.black,
      splashColor: Colors.white,
      fillColor: Colors.white,
      renderBorder: false,
      isSelected: selections,
      children: List<Widget>.generate(
        3,
        (index) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color:
                    selections[index] ? Color(0xFFff8847) : Color(0xFFF6F6F6),
                border: Border.all(
                  color: selections[index] ? Colors.white : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 150,
              height: 70.0,
              alignment: Alignment.center,
              child: Text(
                gender[index].gender,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: selections[index] ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
      ),
      onPressed: (int index) {
        setState(
          () {
            selections = List.generate(3, (index) => false);
            selections[index] = !selections[index];
          },
        );
      },
    );
  }

//Size Toogle
  ToggleButtons SizeToggleButton(StateSetter setState) {
    return ToggleButtons(
      color: Colors.black,
      splashColor: Colors.white,
      fillColor: Colors.white,
      renderBorder: false,
      isSelected: sizeselections,
      children: List<Widget>.generate(
        10,
        (index) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: sizeselections[index]
                    ? Color(0xFFff8847)
                    : Color(0xFFF6F6F6),
                border: Border.all(
                  color:
                      sizeselections[index] ? Colors.white : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: 65,
              height: 70.0,
              alignment: Alignment.center,
              child: Text(
                shoesize[index].sizes,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: sizeselections[index] ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
      ),
      onPressed: (int index) {
        setState(
          () {
            sizeselections = List.generate(10, (index) => false);
            sizeselections[index] = !sizeselections[index];
          },
        );
      },
    );
  }
}
