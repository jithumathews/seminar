import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';

import 'images.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridExample(
      title: 'Drag and Drop Gridview',
    ),
  ));
}

class GridExample extends StatefulWidget {
  GridExample({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  GridExampleState createState() => GridExampleState();
}

class GridExampleState extends State<GridExample> {
  List<DraggableGridItem> _DraggableGridItem = [];

  @override
  void initState() {
    _ImageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: DraggableGridViewBuilder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 3),
          ),
          children: _DraggableGridItem,
          dragCompletion: onDragIndex,
          isOnlyLongPress: false,
          dragFeedback: feedback,
          dragPlaceHolder: placeHolder,
        ),
      ),
    );
  }

  Widget feedback(List<DraggableGridItem> list, int index) {
    return Container(
      child: list[index].child,
      width: 200,
      height: 150,
    );
  }

  PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
    return PlaceHolderWidget(
      child: Container(
        color: Colors.red,
      ),
    );
  }

  void onDragIndex(
      List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
    print('onDragAccept: $beforeIndex -> $afterIndex');
  }

  void _ImageData() {
    _DraggableGridItem.addAll(
      [
        DraggableGridItem(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
              vertical: 4.0,
            ),
            child: Image.asset(
              Images.asset_1,
              fit: BoxFit.cover,
            ),
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_2,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
        DraggableGridItem(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_3,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
        DraggableGridItem(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_4,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
      ],
    );
  }
}
