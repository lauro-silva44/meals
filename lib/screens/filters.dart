import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/widgets/filter_switch.dart';

import '../providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(children: [
        FilterSwitch(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals',
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isCheck) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isCheck);
            }),
        FilterSwitch(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isCheck) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isCheck);
            }),
        FilterSwitch(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isCheck) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isCheck);
            }),
        FilterSwitch(
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            value: activeFilters[Filter.vegan]!,
            onChanged: (isCheck) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isCheck);
            }),
      ]),
    );
  }
}
