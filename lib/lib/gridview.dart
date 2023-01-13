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
  List<DraggableGridItem> _listOfDraggableGridItem = [];

  //method that is called when an object for your stateful widget is created and inserted inside the widget tree.
  @override
  void initState() {
    _generateImageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: SafeArea(
        child: DraggableGridViewBuilder(
          //A delegate that controls the layout of the children within the GridView.
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //Creates grid layouts with a fixed number of tiles in the cross axis.
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 3),
          ),
          /*This property contains list of [DraggableGridItem] and it is use to show the widget
            inside the GridView.builder to provide the drag & drop functionality.
            Also, it contains isDraggable parameter which manages enable/disable the drag & drop functionality. */
          children: _listOfDraggableGridItem,
          //This callback provides updated list and old and new indexes.
          dragCompletion: onDragAccept,
          /*This property contains bool value. If this property is false then it works with simple press draggable
          or else it works with long press. default value is 'true'.*/
          isOnlyLongPress: false,
          /* display the widget when the widget is being dragged. */
          dragFeedback: feedback,
          //With this callback, you have to return a PlaceHolderWidget and we will use this widget in place holder.
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
        color: Colors.white,
      ),
    );
  }

  void onDragAccept(
      List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
    log('onDragAccept: $beforeIndex -> $afterIndex');
  }

  void _generateImageData() {
    _listOfDraggableGridItem.addAll(
      [
        DraggableGridItem(
          child: Container(
            padding: EdgeInsets.symmetric(
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
              padding: EdgeInsets.symmetric(
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
              padding: EdgeInsets.symmetric(
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
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_4,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
        DraggableGridItem(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_5,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: false),
        DraggableGridItem(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_6,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
        DraggableGridItem(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_7,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
        DraggableGridItem(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_8,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
        DraggableGridItem(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_9,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
        DraggableGridItem(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_10,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
        DraggableGridItem(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_11,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
        DraggableGridItem(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_12,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
        DraggableGridItem(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 4.0,
              ),
              child: Image.asset(
                Images.asset_13,
                fit: BoxFit.cover,
              ),
            ),
            isDraggable: true),
      ],
    );
  }
}
