import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawe.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluten = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactose = false;

  Widget _buildSwitches(bool _is, String type, Function updateValue) {
    return SwitchListTile(
      title: Text("$type"),
      subtitle: Text("Only include ${type} Meals"),
      value: _is,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filter Screen"),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust Your Meals",
                  style: Theme.of(context).textTheme.title),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitches(_gluten, "Gluten Free", (newValue) {
                    setState(() {
                      _gluten = newValue;
                    });
                  }),
                  _buildSwitches(_lactose, "Lactose Free", (newValue) {
                    setState(() {
                      _lactose = newValue;
                    });
                  }),
                  _buildSwitches(_vegan, "Vegan", (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  _buildSwitches(_vegetarian, "Vegetarian", (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
