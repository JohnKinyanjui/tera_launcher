import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String label;
  final String sub;
  final Function onpress;

  const SettingItem({Key key, this.label, this.sub, this.onpress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              color:Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(10))

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$label",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), ),
                        SizedBox(height: 10,),
                        Text("$sub", style: TextStyle(color: Colors.grey[300], fontSize: 12),)
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
