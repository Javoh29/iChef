import 'package:flutter/material.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/data/models/user_model.dart';

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
      recipeVideoPoster: "assets/images/img_chicken.png",
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
  },
  {
    "stepNumber": "Шаг 6",
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
    title: "Пшеничная мука",
    addInfo: "Manitoba 400",
    data: "400 г",
    data2: "400 г",
  ),
  SizedBox(
    height: 5,
  ),
  IngridientDetailContainer(
    title: "Сливочное масло",
    addInfo: "",
    data: "400 г",
    data2: "250 г",
  ),
];

List<Widget> secondIngredientsRazdel = const [
  IngridientDetailContainer(
    title: "Куриное яйцо",
    addInfo: "C0",
    data: "400 г, 3 шт",
    data2: "30 г, 3 шт",
  ),
  SizedBox(
    height: 5,
  ),
  IngridientDetailContainer(
    title: "Тыква",
    addInfo: "",
    data: "400 г, 3 шт",
    data2: "900 г",
  ),
  SizedBox(
    height: 5,
  ),
  IngridientDetailContainer(
    title: "Корица",
    addInfo: "KOTANYI целая",
    data: "400 г, 3 шт",
    data2: "3 г",
  ),
  SizedBox(
    height: 5,
  ),
  IngridientDetailContainer(
    title: "Соль",
    addInfo: "",
    data: "400 г, 3 шт",
    data2: "3 г, 0.5 ч. л.",
  ),
];

List brandImages = [
  Assets.images.brand3,
  Assets.images.brand2,
  Assets.images.brand1,
];

List brandNames = [
  "Molino Gra...",
  "Предпортовая",
  "Мелькомбинат",
];

List brandPrices = [
  "98",
  "65",
  "69.99",
];

List salerImages = [
  Assets.images.saler2,
  Assets.images.saler1,
  Assets.images.saler3,
];

List salerNames = [
  "Окей",
  "Лента",
  "Eldorado",
];

List salerPrices = [
  "98",
  "88",
  "102",
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
List<String> types = [
  "Завтрак",
  "Континентальный завтрак",
  "Бранч",
  "Ланч",
  "Обед",
  "Полдник",
  "Ужин",
  "Ямча",
];

List<String> favImagesTab1 = [
  'assets/images/favorite_images/img.png',
  'assets/images/favorite_images/img_1.png',
  'assets/images/favorite_images/img_2.png',
  'assets/images/favorite_images/img_3.png',
  'assets/images/favorite_images/img_4.png',
  'assets/images/favorite_images/img_5.png',
  'assets/images/favorite_images/img_6.png',
  'assets/images/favorite_images/img_7.png',
  'assets/images/favorite_images/img_8.png',
  'assets/images/favorite_images/img_9.png',
  'assets/images/favorite_images/img_10.png',
  'assets/images/favorite_images/img_11.png',
  'assets/images/favorite_images/img_12.png',
  'assets/images/favorite_images/img_13.png',
];
List<String> favImagesTab2 = [
  'assets/images/favorite_images/tab2/tab2.1.jpg',
  'assets/images/favorite_images/tab2/tab2.2.jpg',
  'assets/images/favorite_images/tab2/tab2.3.jpg',
  'assets/images/favorite_images/tab2/tab2.4.jpg',
  'assets/images/favorite_images/tab2/tab2.5.jpg',
  'assets/images/favorite_images/tab2/tab2.6.jpg',
  'assets/images/favorite_images/tab2/tab2.7.jpg',
  'assets/images/favorite_images/tab2/tab2.8.jpg',
  'assets/images/favorite_images/tab2/tab2.9.jpg',
  'assets/images/favorite_images/tab2/tab2.10.jpg',
  'assets/images/favorite_images/tab2/tab2.11.jpg',
  'assets/images/favorite_images/tab2/tab2.12.jpg',
  'assets/images/favorite_images/tab2/tab2.13.jpg',
  'assets/images/favorite_images/tab2/tab2.14.jpg',
  'assets/images/favorite_images/tab2/tab2.15.jpg',
  'assets/images/favorite_images/tab2/tab2.16.jpg',
  'assets/images/favorite_images/tab2/tab2.17.jpg',
  'assets/images/favorite_images/tab2/tab2.18.jpg',
  'assets/images/favorite_images/tab2/tab2.19.jpg',
];
List<UserModel> users = [
  UserModel(
    username: "Ирина Волкова",
    userImage: Assets.images.userAvatar1,
    job: "Шеф-повар ресторана Temantoga",
    bio: '''Шеф-повар ресторана Temantoga
текстовое описание которые сам пишет,
может даже сайт указать''',
    followers: "45,6 тыс",
    following: "4,8 тыс",
  ),
  UserModel(
    username: "Ирина Волкова",
    userImage: Assets.images.userAvatar2,
    job: "Шеф-повар ресторана Temantoga",
    bio: '''Шеф-повар ресторана Temantoga
текстовое описание которые сам пишет,
может даже сайт указать''',
    followers: "45,6 тыс",
    following: "4,8 тыс",
  ),
  UserModel(
    username: "Ирина Волкова",
    userImage: Assets.images.userAvatar3,
    job: "Шеф-повар ресторана Temantoga",
    bio: '''Шеф-повар ресторана Temantoga
текстовое описание которые сам пишет,
может даже сайт указать''',
    followers: "45,6 тыс",
    following: "4,8 тыс",
  ),
  UserModel(
    username: "Ирина Волкова",
    userImage: Assets.images.userAvatar4,
    job: "Шеф-повар ресторана Temantoga",
    bio: '''Шеф-повар ресторана Temantoga
текстовое описание которые сам пишет,
может даже сайт указать''',
    followers: "45,6 тыс",
    following: "4,8 тыс",
  ),
  UserModel(
    username: "Ирина Волкова",
    userImage: Assets.images.userAvatar5,
    job: "Шеф-повар ресторана Temantoga",
    bio: '''Шеф-повар ресторана Temantoga
текстовое описание которые сам пишет,
может даже сайт указать''',
    followers: "45,6 тыс",
    following: "4,8 тыс",
  ),
];

List profileTabList = [
  'Рецепты',
  'Блоги',
  'Чат',
];

List<Map> foodTypes = [
  {
    "imagePath": Assets.icons.foodOne,
    "name": "Завтр...",
  },
  {
    "imagePath": Assets.icons.foodTwo,
    "name": "Мясные б...",
  },
  {
    "imagePath": Assets.icons.foodThree,
    "name": "Сувид",
  },
  {
    "imagePath": Assets.icons.foodFour,
    "name": "Выпечка",
  },
  {
    "imagePath": Assets.icons.foodFive,
    "name": "Грузинс...",
  },
  {
    "imagePath": Assets.icons.foodSix,
    "name": "Сувид",
  },
];
