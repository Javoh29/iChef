import 'package:flutter/material.dart';
import 'package:ichef/config/constants/assets.dart';

import '../../data/models/recipe_model.dart';
import '../../presentation/components/ingridient_detail_container.dart';

List<RecipeModel> listRecipes = [
  RecipeModel(
      userName: "Ирина Волкова",
      userAvatar: Assets.images.userAvatar1,
      recipeVideo: 'assets/videos/video1.mp4',
      recipeVideoPoster: "assets/images/img_classic_medovik.png",
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
      recipeVideo: 'assets/videos/video2.mp4',
      recipeVideoPoster: "assets/images/img_chicken.png",
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
      recipeVideo: 'assets/videos/video3.mp4',
      recipeVideoPoster: "assets/images/img_classic_medovik.png",
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
      recipeVideo: 'assets/videos/video4.mp4',
      recipeVideoPoster: "assets/images/img_chicken.png",
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
      recipeVideo: 'assets/videos/video5.mp4',
      recipeVideoPoster: "assets/images/img_classic_medovik.png",
      categoryName: "Temantoga",
      recipeName: "Классический медовик",
      recipeTime: "1.5ч",
      recipeView: "32K",
      likeCount: 14,
      commentCount: 135,
      variationCount: 23,
      ingredientCount: 7),
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

String stepName = "Soften the onion";

String stepContext =
    '''Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.
Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.
Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.
Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.
Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.''';

List<Map> userComments = [
  {
    "userName": "Надежда Румянцева",
    "userImage": Assets.images.userAvatar3,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText": "Cut the bell",
    "isOwner": false
  },
  {
    "userName": "Анна Матюнина",
    "userImage": Assets.images.userAvatar4,
    "lastSeen": "5 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful)",
    "isOwner": true
  },
  {
    "userName": "Александра Кадира",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        '''Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.
Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.''',
    "isOwner": false
  },
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

List<String> folders = [
  "Понравилось",
  "Приготовлено",
  "К готовке",
  "Название папки",
];

List<String> commands = [
  "Заблокировать",
  "Пожаловаться",
  "Информация об аккаунте",
  "Скопировать URL  профиля",
  "Поделиться этим профилем",
  "Перенести в папку",
  "Удалить из избранного",
];

Map<String, dynamic> mockData = {
  "items": [
    {
      "image": "assets/images/img_classic_medovik.png",
      "video_path": 'assets/videos/video1.mp4',
    },
    {
      "image": "assets/images/img_classic_medovik.png",
      "video_path": "assets/videos/video2.mp4",
    },
    {
      "image": "assets/images/img_classic_medovik.png",
      "video_path": "assets/videos/video3.mp4",
    },
    {
      "image": "assets/images/img_classic_medovik.png",
      "video_path": "assets/videos/video4.mp4",
    },
    {
      "image": "assets/images/img_classic_medovik.png",
      "video_path": "assets/videos/video5.mp4",
    }
  ]
};

  List info = [
    {
      "amount": "56",
      "type": "Б",
      "status": "down",
    },
    {
      "amount": "62",
      "type": "Ж",
      "status": "up",
    },
    {
      "amount": "56",
      "type": "У",
      "status": "down",
    },
    {
      "amount": "1226",
      "type": "Ккал",
      "status": "up",
    },
  ];
