import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawe.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> _curFilters;
  FilterScreen(this.saveFilters, this._curFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluten = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactose = false;

  @override
  initState() {
    _gluten = widget._curFilters['gluten'];
    _vegetarian = widget._curFilters['vegetarian'];
    _vegan = widget._curFilters['vegan'];
    _lactose = widget._curFilters['lactose'];
    super.initState();
  }

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
          actions: <Widget>[
            IconButton(
              tooltip: "Click to Save filters",
              onPressed: () {
                final Map<String, bool> _filters = {
                  'gluten': _gluten,
                  'lactose': _lactose,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.saveFilters(_filters);
                Navigator.of(context).pushReplacementNamed('/');
              },
              icon: Icon(Icons.save),
            )
          ],
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
