import 'package:flutter/material.dart';

import '../widgets/main-drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Filters(this.saveFilters, this.currentFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchList(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchList(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    /* TO DO
                    * Fix the setState, refactor
                    */

                    (_) {
                      setState(
                        () {
                          _glutenFree = !_glutenFree;
                        },
                      );
                    },
                  ),
                  _buildSwitchList(
                    'Lactose-free',
                    'Only include lactose-free meals',
                    _lactoseFree,
                    /* TO DO
                    * Fix the setState, refactor
                    */

                    (_) {
                      setState(
                        () {
                          _lactoseFree = !_lactoseFree;
                        },
                      );
                    },
                  ),
                  _buildSwitchList(
                    'Vegetarian ',
                    'Only include vegetarian meals',
                    _vegetarian,
                    /* TO DO
                    * Fix the setState, refactor
                    */
                    (_) {
                      setState(
                        () {
                          _vegetarian = !_vegetarian;
                        },
                      );
                    },
                  ),
                  _buildSwitchList(
                    'Vegan ',
                    'Only include vegan meals',
                    _vegan,
                    /* TO DO
                    * Fix the setState, refactor
                    */
                    (_) {
                      setState(
                        () {
                          _vegan = !_vegan;
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
