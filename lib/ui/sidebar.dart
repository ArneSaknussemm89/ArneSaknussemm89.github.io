import 'package:flutter/material.dart';

import 'package:thegreycouncil/ui/theme.dart';

class AppDrawer extends StatelessWidget {
  Widget get separator => SizedBox(height: GreyCouncilTheme.marginFactor * 4);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: GreyCouncilTheme.grey,
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () => {}, // show dialog about the game.
              leading: Icon(Icons.info_outline, size: 30, color: Colors.white),
              title: Text('About The Game'),
            ),
            separator,
            ListTile(
              onTap: () => {},
              leading: Icon(Icons.person, size: 30, color: Colors.white),
              title: Text('About Me'),
            ),
          ],
        ),
      ),
    );
  }
}
