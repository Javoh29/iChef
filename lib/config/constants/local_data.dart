import 'package:flutter/material.dart';
import 'package:ichef/config/constants/assets.dart';

import '../../data/models/recipe_model.dart';
import '../../presentation/components/ingridient_detail_container.dart';

List<RecipeModel> listRecipes = [
  RecipeModel(
      userName: "Ирина Волкова",
      userAvatar: Assets.images.userAvatar1,
      recipeVideo: Assets.images.recipeMedovik,
      categoryName: "Temantoga",
      recipeName: "Классический медовик",
      recipeTime: "1.5ч",
      recipeView: "32K",
      likeCount: 14,
      commentCount: 135,
      variationCount: 23,
      ingredientCount: 7),
  RecipeModel(
      userName: "Павел Антипов",
      userAvatar: Assets.images.userAvatar2,
      recipeVideo: Assets.images.recipeChicken,
      categoryName: "Баклажан",
      recipeName: "Запеченная курица",
      recipeTime: "1.5ч",
      recipeView: "32K",
      likeCount: 10,
      commentCount: 99,
      variationCount: 14,
      ingredientCount: 5),
  RecipeModel(
      userName: "Ирина Волкова",
      userAvatar: Assets.images.userAvatar1,
      recipeVideo: Assets.images.recipeMedovik,
      categoryName: "Temantoga",
      recipeName: "Классический медовик",
      recipeTime: "1.5ч",
      recipeView: "32K",
      likeCount: 14,
      commentCount: 135,
      variationCount: 23,
      ingredientCount: 7),
  RecipeModel(
      userName: "Павел Антипов",
      userAvatar: Assets.images.userAvatar2,
      recipeVideo: Assets.images.recipeChicken,
      categoryName: "Баклажан",
      recipeName: "Запеченная курица",
      recipeTime: "1.5ч",
      recipeView: "32K",
      likeCount: 10,
      commentCount: 99,
      variationCount: 14,
      ingredientCount: 5),
];

List<String> infoIcons = [
  Assets.icons.pancakeOne,
  Assets.icons.flagOne,
  Assets.icons.stoveOne,
  Assets.icons.bakeryOne,
  Assets.icons.gluttenOne,
  Assets.icons.timeOne
];
List<String> recipeTypes = [
  'Panasonic 1259',
  'Без глютена',
  'Любимый',
  'Любимый',
];
List<String> recipePath = [
  'Десерты',
  'Выпечка',
];
String recipeText =
    "Американский тыквенный пирог с корицей — классика застолья Среднего и прочего Запада, анекдотический персонаж американского быта не лишен, однако, прелести, особенно если не получать его с младых ногтей каждые два дня в качестве десерта. Тыква тоже имеет звание чуть ли не коренного жителя Америки, так как открыта была именно здесь и охотно используется жителями континента во многих блюдах по многим случаям. И все же этот пирог получается безумно вкусным, если выбрать правильную тыкву — удлиненную, с закругленным концом.";

List<Map> recipeSteps = [
  {
    "stepNumber": "Шаг 1",
    "stepName": "Soften the onion",
    "stepContext":
        "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.",
  },
  {
    "stepNumber": "Шаг 2",
    "stepName": "Soften the onion",
    "stepContext":
        "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.",
  },
  {
    "stepNumber": "Шаг 3",
    "stepName": "Soften the onion",
    "stepContext":
        "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.",
  },
  {
    "stepNumber": "Шаг 4",
    "stepName": "Soften the onion",
    "stepContext":
        "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.",
  },
  {
    "stepNumber": "Шаг 5",
    "stepName": "Soften the onion",
    "stepContext":
        "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.",
  }
];

List<Widget> firstIngredientsRazdel = const [
  IngridientDetailContainer(
    isActive: false,
    title: "Пшеничная мука",
    addInfo: "Manitoba 400",
    data: "400 г, 3 шт",
  ),
  SizedBox(
    height: 5,
  ),
  IngridientDetailContainer(
    isActive: false,
    title: "Сливочное масло",
    addInfo: "",
    data: "400 г, 3 шт",
  ),
];

List<Widget> secondIngredientsRazdel = const [
  IngridientDetailContainer(
    isActive: true,
    title: "Куриное яйцо",
    addInfo: "C0",
    data: "400 г, 3 шт",
  ),
  SizedBox(
    height: 5,
  ),
  IngridientDetailContainer(
    isActive: true,
    title: "Тыква",
    addInfo: "",
    data: "400 г, 3 шт",
  ),
  SizedBox(
    height: 5,
  ),
  IngridientDetailContainer(
    isActive: false,
    title: "Корица",
    addInfo: "KOTANYI целая",
    data: "400 г, 3 шт",
  ),
  SizedBox(
    height: 5,
  ),
  IngridientDetailContainer(
    isActive: false,
    title: "Соль",
    addInfo: "",
    data: "400 г, 3 шт",
  ),
];
