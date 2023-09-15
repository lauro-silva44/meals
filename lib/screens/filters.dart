import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_switch.dart';

enum Filter { glutenFree, lactosaFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactosaFree]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactosaFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFreeFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: Column(children: [
          FilterSwitch(
            title: 'Glutten-free',
            subtitle: 'Only include glutten-free meals',
            value: _glutenFreeFilterSet,
            onChanged: (isCheck) {
              setState(() {
                _glutenFreeFilterSet = isCheck;
              });
            },
          ),
          FilterSwitch(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
            value: _lactoseFreeFilterSet,
            onChanged: (isCheck) {
              setState(() {
                _lactoseFreeFilterSet = isCheck;
              });
            },
          ),
          FilterSwitch(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            value: _vegetarianFreeFilterSet,
            onChanged: (isCheck) {
              setState(() {
                _vegetarianFreeFilterSet = isCheck;
              });
            },
          ),
          FilterSwitch(
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            value: _veganFilterSet,
            onChanged: (isCheck) {
              setState(() {
                _veganFilterSet = isCheck;
              });
            },
          ),
        ]),
      ),
    );
  }
}
