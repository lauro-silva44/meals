import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);

    _animationController.forward();
  }

  void _onSelectCategory(BuildContext context, Category category) {
    final filterMeal = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filterMeal,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick your category'),
        ),
        body: AnimatedBuilder(
            animation: _animationController,
            child: GridView(
              padding: const EdgeInsets.all(24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              children: availableCategories
                  .map((category) => CategoryGridItem(
                        category: category,
                        onSelectedCategory: () {
                          _onSelectCategory(context, category);
                        },
                      ))
                  .toList(),
            ),
            builder: (context, child) => SlideTransition(
                  position: Tween(
                    begin: const Offset(0, 0.3),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                        parent: _animationController, curve: Curves.easeInOut),
                  ),
                  child: child,
                )));
  }
}
