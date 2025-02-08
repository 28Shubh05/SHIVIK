import 'package:flutter/material.dart';

import '../Content/category_movie.dart';


class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Category> categories = CategoriesData.getCategories();
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, categoryIndex) {
        Category currentCategory = categories[categoryIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                currentCategory.name,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200, // Fixed height for horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: currentCategory.imageUrls.length, // Number of images in each category
                itemBuilder: (context, imageIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(currentCategory.imageUrls[imageIndex] , fit: BoxFit.fill,),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}