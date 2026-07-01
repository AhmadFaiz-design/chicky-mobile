import 'package:flutter/material.dart';
import 'package:chicky/core/colours.dart';

class _FilterButton extends StatelessWidget {
  final String title;
  final int index;
  final int idButton;
  final Function callBack;

  const _FilterButton({required this.title, required this.index, required this.idButton, required this.callBack});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: idButton == index ? TextButton.styleFrom(
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
        foregroundColor: Colors.white,
        backgroundColor: Colours.mainOrange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ) : TextButton.styleFrom(
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
              foregroundColor: Colours.mainOrange,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colours.mainOrange),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
      onPressed: () {
        callBack(idButton);
      },
      child: Text(title, style: TextStyle(fontSize: 14)),
    );
  }
}

class FilterCardHistory extends StatefulWidget {
  @override
  State<FilterCardHistory> createState() => FilterCardState();
}

class FilterCardState extends State<FilterCardHistory> {
  int index = 0;

  @override
  void initState() {
    
    super.initState();
  }

  void _getQuery(int _selecetedIndex) {
    setState(() {
      index = _selecetedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          _FilterButton(title: "Semua", index: index, idButton: 0, callBack: _getQuery),
          SizedBox(width: 10),
          _FilterButton(title: "Bagus", index: index, idButton: 1, callBack: _getQuery),
          SizedBox(width: 10),
          _FilterButton(title: "Buruk", index: index, idButton: 2, callBack: _getQuery),
        ],
      ),
    );
  }
}
