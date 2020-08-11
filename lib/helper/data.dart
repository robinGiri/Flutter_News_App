import 'package:newsapp/model/Categories_model.dart';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> category = new List<CategoriesModel>();
  CategoriesModel categoriesModel = new CategoriesModel();

  categoriesModel.categoryName = 'joke';
  categoriesModel.categoryURL =
      'https://images.pexels.com/photos/3673523/pexels-photo-3673523.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

  //1
  categoriesModel = new CategoriesModel();
  categoriesModel.categoryName = "Business";
  categoriesModel.categoryURL =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  category.add(categoriesModel);

  //2
  categoriesModel = new CategoriesModel();
  categoriesModel.categoryName = "Entertainment";
  categoriesModel.categoryURL =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoriesModel);

  //3
  categoriesModel = new CategoriesModel();
  categoriesModel.categoryName = "General";
  categoriesModel.categoryURL =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(categoriesModel);

  //4
  categoriesModel = new CategoriesModel();
  categoriesModel.categoryName = "Health";
  categoriesModel.categoryURL =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(categoriesModel);

  //5
  categoriesModel = new CategoriesModel();
  categoriesModel.categoryName = "Science";
  categoriesModel.categoryURL =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(categoriesModel);

  //5
  categoriesModel = new CategoriesModel();
  categoriesModel.categoryName = "Sports";
  categoriesModel.categoryURL =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(categoriesModel);

  //5
  categoriesModel = new CategoriesModel();
  categoriesModel.categoryName = "Technology";
  categoriesModel.categoryURL =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoriesModel);

  categoriesModel = new CategoriesModel();

  return category;
}
