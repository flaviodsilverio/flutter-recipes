import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';

class MealDetail extends StatelessWidget {
  static const routeName = "meal-detail";
  
  Widget buildSectionTitle(BuildContext  context, String  text) {
    return Container(
                child: Text(text,
                style: Theme.of(context).textTheme.headline6
                 )
                 );
  }

  Widget buildContainer(Widget child) {
    return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 200,
                width: 300,
                child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
          body: SingleChildScrollView(
                      child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover
                  )
                ),
                buildSectionTitle(context, "Ingredients"),
                buildContainer(ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(meal.ingredients[index]),
                      ),
                    ),
                    ),
                    ),
                buildSectionTitle(context, "Steps"),
                buildContainer(
                  ListView.builder(
                    itemBuilder: (ctx, index) => Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}")
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider()
                    ],),
                    itemCount: meal.steps.length,
                  )
                ),
              ],
            ),
          )
    );
  }
}