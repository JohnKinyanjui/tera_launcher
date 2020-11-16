import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tera_launcher/components/app_holder.dart';
import 'package:tera_launcher/settings/categories.dart';

class AppCategory extends StatefulWidget {
  final int currentPage;
  final Function(int) onpress;

  const AppCategory({Key key, this.onpress, this.currentPage})
      : super(key: key);
  @override
  _AppCategoryState createState() => _AppCategoryState();
}

class _AppCategoryState extends State<AppCategory> {
  Color activeColor = Colors.white;
  Color inactiveColor = Colors.black45;

  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 50);

  _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    int i = widget.currentPage == null ? 0 : widget.currentPage;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (i < 5) {
        _scrollToTop();
      }

      if (i > 4) {
        _scrollToBottom();
      }
    });

    return Container(
      height: 70,
      child: ListView.builder(
        controller: _scrollController,
        addAutomaticKeepAlives: true,
        scrollDirection: Axis.horizontal,
        itemCount: 9,
        itemBuilder: (context, index) {
          return AppHolder(
            height: 50,
            width: 50,
            onpress: () {
              setState(() {
                i = index;
              });
              widget.onpress(i);
            },
            child: Icon(
              getCategoryIcon(index),
              color: i == index ? activeColor : inactiveColor,
            ),
          );
        },
      ),
    );
  }
}
