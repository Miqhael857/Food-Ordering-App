import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signinapp/model/category_model.dart';
import 'package:flutter_signinapp/model/feature_model.dart';

class MyProvider with ChangeNotifier{
  List<CategoryModel> categoryModelList = [];
  CategoryModel categoryModel;
  Future <void> getCategoryProduct() async {
   List<CategoryModel> list = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("homecategory").get();
    querySnapshot.docs.forEach((categoryData) {
      categoryModel = CategoryModel(
          assets: categoryData.data(), name:categoryData.data(),
      );
      list.add(categoryModel);
    }
    );
    categoryModelList = list;
    notifyListeners();
  }
  List<CategoryModel> get getCategoryModelList{
    return categoryModelList;
  }

  List<FeatureModel> featureModelList = [];
  FeatureModel featureModelModel;
  Future <void> getFeatureFood() async {
    List<FeatureModel> list = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("homefeaturefood").get();
    querySnapshot.docs.forEach((homeFeatureFood) {
      featureModelModel = FeatureModel(
          foodSubtitle: homeFeatureFood.data(),
          foodTitle: homeFeatureFood.data(),
          foodassets: homeFeatureFood.data(),
          rating: homeFeatureFood.data(),
          price: homeFeatureFood.data(),
      );
      list.add(featureModelModel);
    }
    );
    featureModelList = list;
    notifyListeners();
  }
  List<FeatureModel> get getfeatureModelList{
    return featureModelList;
  }
  }