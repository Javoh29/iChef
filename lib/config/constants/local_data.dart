import 'package:flutter/material.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/data/models/user_model.dart';
import 'package:ichef/presentation/routes/routes.dart';

import '../../data/models/recipe_model.dart';
import '../../main.dart';
import '../../presentation/components/ingridient_detail_container.dart';

List<RecipeModel> listRecipes = [
  RecipeModel(
      userName: "Ирина Волкова",
      userAvatar: Assets.images.userAvatar1,
      recipeVideo: 'assets/videos/video6.mp4',
      recipeVideoPoster: "assets/images/favorite_images/img.png",
      categoryName: "Temantoga",
      recipeName: "Нежная и сочная свиная вырезка",
      recipeTime: "02:15:00",
      recipeView: "32K",
      likeCount: 14,
      commentCount: 135,
      variationCount: 23,
      recipeDesc: recipeText,
      recipeSteps: recipeSteps,
      userComment: userComments,
      drawer: nejnayaDrawerModel,
      ingredientCount: 7),
  RecipeModel(
    userName: "Анастасия Королёва",
    userAvatar: Assets.images.userAvatar3,
    recipeVideo: 'assets/videos/video7.mp4',
    recipeVideoPoster: "assets/images/favorite_images/tab2/tab2.8.jpg",
    categoryName: "Шеф-повар Tramontina",
    recipeName: "Жареная курица в хрустящей панировке.",
    recipeTime: "04:30:00",
    recipeView: "32K",
    likeCount: 10,
    commentCount: 99,
    variationCount: 14,
    recipeSteps: recipeSteps2,
    userComment: userComments2,
    recipeDesc: recipeText2,
    ingredientCount: 5,
    drawer: jarenayaDrawerModel,
  ),
  RecipeModel(
      userName: "Ирина Волкова",
      userAvatar: Assets.images.userAvatar1,
      recipeVideo: 'assets/videos/video1.mp4',
      recipeVideoPoster: "assets/images/favorite_images/img.png",
      categoryName: "Temantoga",
      recipeName: "Куриная грудка. Базовый рецепт",
      recipeTime: "02:15:00",
      recipeView: "32K",
      likeCount: 14,
      commentCount: 135,
      variationCount: 23,
      recipeSteps: recipeSteps,
      userComment: userComments,
      recipeDesc: recipeText,
      drawer: nejnayaDrawerModel,
      ingredientCount: 7),
  RecipeModel(
    userName: "Анастасия Королёва",
    userAvatar: Assets.images.userAvatar3,
    recipeVideo: 'assets/videos/video2.mp4',
    recipeVideoPoster: "assets/images/favorite_images/tab2/tab2.8.jpg",
    categoryName: "Шеф-повар Tramontina",
    recipeName: "Сочные куриные бедрышки гриль",
    recipeTime: "04:30:00",
    recipeView: "32K",
    likeCount: 10,
    commentCount: 99,
    variationCount: 14,
    recipeSteps: recipeSteps2,
    userComment: userComments2,
    recipeDesc: recipeText2,
    drawer: jarenayaDrawerModel,
    ingredientCount: 5,
  ),
  RecipeModel(
      userName: "Ирина Волкова",
      userAvatar: Assets.images.userAvatar1,
      recipeVideo: 'assets/videos/video3.mp4',
      recipeVideoPoster: "assets/images/favorite_images/img.png",
      categoryName: "Temantoga",
      recipeName: "Идеальная спаржа",
      recipeTime: "1 час- 2 часа 15 мин",
      recipeView: "32K",
      likeCount: 14,
      commentCount: 135,
      recipeSteps: recipeSteps,
      userComment: userComments,
      variationCount: 23,
      recipeDesc: recipeText,
      drawer: nejnayaDrawerModel,
      ingredientCount: 7),
  RecipeModel(
    userName: "Анастасия Королёва",
    userAvatar: Assets.images.userAvatar3,
    recipeVideo: 'assets/videos/video4.mp4',
    recipeVideoPoster: "assets/images/favorite_images/tab2/tab2.8.jpg",
    categoryName: "Шеф-повар Tramontina",
    recipeName: "Английский крем для фруктовых салатов",
    recipeTime: "04:30:00",
    recipeView: "32K",
    likeCount: 10,
    commentCount: 99,
    variationCount: 14,
    recipeSteps: recipeSteps2,
    userComment: userComments2,
    recipeDesc: recipeText2,
    drawer: jarenayaDrawerModel,
    ingredientCount: 5,
  ),
  RecipeModel(
      userName: "Ирина Волкова",
      userAvatar: Assets.images.userAvatar1,
      recipeVideo: 'assets/videos/video5.mp4',
      recipeVideoPoster: "assets/images/favorite_images/img.png",
      categoryName: "Temantoga",
      recipeName: "Идеальное яйцо всмятку",
      recipeTime: "1 час- 2 часа 15 мин",
      recipeView: "32K",
      likeCount: 14,
      commentCount: 135,
      variationCount: 23,
      recipeSteps: recipeSteps,
      userComment: userComments,
      recipeDesc: recipeText,
      drawer: nejnayaDrawerModel,
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
  'Масло',
];
List<String> recipePath = [
  'Десерты',
  'Выпечка',
];
String recipeText =
    "Представляем вам рецепт приготовления сочной и вкусной свиной вырезки.Это нежное мясо готовится в су-вид в течение 90 минут и получается именно таким, как мы любим - красивым и розовым.Приправьте этот прекрасный кусочек вырезки травяным маслом, а затем похвалите себя за создание еще одного прекрасного ужина!";
String recipeText2 =
    '''Когда вы жарите курицу в панировке очень легко можно недожарить куриную грудку или ножку.
При приготовлении в sous vide вы всегда приготовите курицу до той степени готовности, как вам нравится.
Вы можете использовать и светлое и темное мясо.''';
List<Map> recipeSteps = [
  {
    "stepNumber": "Шаг 1",
    "stepName": "Посмотрим, как должна выглядеть идеальная свиная вырезка!",
    "stepContext":
        "Ваша свиная вырезка выглядит так же? Отлично, начинаем готовить!",
    "stepImage": "assets/images/favorite_images/img_1.png",
    "stepVideo": "",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 2",
    "stepName": "Готовим смесь для мяса и готовим (по желанию) травяное масло.",
    "stepContext":
        "В небольшой миске соединяем 5 частей соли с 2 частями сахара и перемешиваем.Смесь сахара и соли работает как рассол для того, чтобы пока свинина готовится, она оставалась красивой и сочной.Для приготовления травяного масла, смешиваем все инградиеты, кроме соли, и ооткладываем в сторону. Добавляем соль непосредственно перед подачей на стол.",
    "stepImage": "assets/images/favorite_images/img_4.png",
    "stepVideo": "assets/videos/step_video2.mp4",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 3",
    "stepName": "Приправляем мясо и упаковываем его.",
    "stepContext":
        "Приправляем вырезку смесью сахара и соли, из расчета примерно 1,5 % от веса мяса. (Это не должно быть обязательно точно).Есть важный момент! Приправляем мясо только тогда, когда готовы, чтобы сразу начать  его приготовить.Свиная вырезка очень нежная, поэтому слишком ранняя засолка сделает ее ветчиной.Помещаем термостат в воду и когда он нагреет ее до достаточной температуры, аккуратно и медленно помещаем пакет с мясом в емкость с водой.Закрепляем пакет так, чтобы он был полностью погружен в воду. Если пакет всплывает, кладем на него для утяжеления вилку или что-то другое.",
    "stepImage": "assets/images/favorite_images/img_2.png",
    "stepVideo": "assets/videos/step_video3.mp4",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 4",
    "stepName": "Обжариваем кусок вырезки.",
    "stepContext":
        "Обжариваем вырезку на сковороде гриль или гриле. На чем бы не готовили вы, убедитесь, что ваша сковорода или гриль сильно разогреты.Имейте ввиду, что вырезка получается вкусной и нежирной, поэтому ее очень легко пережарить во время обжаривания.",
    "stepImage": "assets/images/favorite_images/img_3.png",
    "stepVideo": "assets/videos/step_video4.mp4",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 5",
    "stepName": "Серверуем",
    "stepContext":
        "Подаем на стол с приготовленным травяным маслом. Нарезаем кусочками.Наслаждаемся нежной свиной вырезкой!",
    "stepImage": "assets/images/favorite_images/img.png",
    "stepVideo": "assets/videos/step_video5.mp4",
    'stepComment': []
  }
];
List<Map> recipeSteps2 = [
  {
    "stepNumber": "Шаг 1",
    "stepName": "Немного солим курицу",
    "stepContext":
        "Солим кусочки курицы. Количество соли должно быть примерно 1 процент от веса кусочков курицы или на ваше усмотрение.",
    "stepImage": "assets/images/favorite_images/tab2/tab2.17.jpg",
    "stepVideo": "assets/videos/video2/step_video1.mp4",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 2",
    "stepName": "Упаковываем белое и темное мясо в разные пакеты.",
    "stepContext":
        "В разные пакеты укладываем кусочки белого и темного мяса в один слой, чтобы они готовились равномерно.",
    "stepImage": "assets/images/kur_panirovke/img.png",
    "stepVideo": "assets/videos/video2/video2.mp4",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 3",
    "stepName": "Готовим.",
    "stepContext":
        "Сначала начинаем готовить ножки и темное мясо. Эти кусочки курицы готовятся дольше, чем белое мясо. Куриные грудки добаляем за 1 час до подачи на стол.",
    "stepImage": "assets/images/kur_panirovke/img_9.png",
    "stepVideo": "assets/videos/video2/video_3.mp4",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 4",
    "stepName": "Смешиваем муку и специи",
    "stepContext":
        "Смешиваем муку со специями. Вы можете использовать разные специи по своему вкусу.",
    "stepImage": "assets/images/kur_panirovke/img_1.png",
    "stepVideo": "assets/videos/video2/video3.mp4",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 5",
    "stepName": "Разрезаем куриные грудки.",
    "stepContext":
        "Разрезаем куриные грудки на 2 части, чтобы кусочки были поменьше, а хрустящей корочки было побольше.",
    "stepImage": "assets/images/kur_panirovke/img_3.png",
    "stepVideo": "assets/videos/video2/video4.mp4",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 6",
    "stepName": " Готовимся к жарке.",
    "stepContext":
        "Располагаем миску со сливками, мукой и курицей рядом с плитой. В сковороду с толстым дном наливаем масло для жарки и нагреваем на сильном огне.",
    "stepImage": "assets/images/kur_panirovke/img_4.png",
    "stepVideo": "assets/videos/video2/set_up6.mp4",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 7",
    "stepName": "Обваливаем курицу в муке.",
    "stepContext": "Обваливаем кусочки курицы в муке один или два раза.",
    "stepImage": "assets/images/kur_panirovke/img_10.png",
    "stepVideo": "assets/videos/video2/video7.mp4",
    'stepComment': [
      {
        "userName": "Инна Худокормова",
        "userImage": Assets.images.userAvatar3,
        "lastSeen": "2 м назад",
        "time": "12.07.2022",
        "chatText":
            "А я смешиваю сливки с яйцом, окунаю туда кусочки мяса и на сковородку",
        "isOwner": false
      },
      {
        "userName": "Елена Никодимова",
        "userImage": Assets.images.userAvatar3,
        "lastSeen": "2 м назад",
        "time": "19.08.2008",
        "chatText":
            "Настя спасибо за рецепт — у меня не было сливок и я решила залить молоком- результат отличный- получилось очень вкусно",
        "isOwner": false
      },
    ]
  },
  {
    "stepNumber": "Шаг 8",
    "stepName":
        "Быстро обжариваем кусочки курицы в кипящем масле до образования корочки. После обжарки удаляем лишнее масло при помощи салфетки.",
    "stepContext":
        "Смешиваем муку со специями. Вы можете использовать разные специи по своему вкусу.",
    "stepImage": "assets/images/kur_panirovke/img_6.png",
    "stepVideo": "assets/videos/video2/chicken-fry.mp4",
    'stepComment': [
      {
        "userName": "Глеб Симохин",
        "userImage": Assets.images.userAvatar3,
        "lastSeen": "2 м назад",
        "time": "12.07.2022",
        "chatText": "А быстро, это сколько? Секунды или минуты?",
        "isOwner": false
      },
    ]
  },
  {
    "stepNumber": "Шаг 9",
    "stepName":
        "Пока обжариваем кусочки курицы, обжаренные кусочки можем выложить на противень и поставить в нагретую до 95 градусов духовку.",
    "stepContext":
        "Разрезаем куриные грудки на 2 части, чтобы кусочки были поменьше, а хрустящей корочки было побольше.",
    "stepImage": "assets/images/kur_panirovke/img_7.png",
    "stepVideo": "assets/videos/video2/oven-front.mp4",
    'stepComment': []
  },
  {
    "stepNumber": "Шаг 10",
    "stepName": "Серверуем",
    "stepContext":
        "Подаем на стол горячие куриные кусочки. Так же, можно есть и холодными.",
    "stepImage": "assets/images/kur_panirovke/img_8.png",
    "stepVideo": "assets/videos/video2/video10.mp4",
    'stepComment': []
  },
];

List<Map> userComments = [
  {
    "userName": "Антонина Васина",
    "userImage": Assets.images.userAvatar3,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        "Спасибо, ваши рецепты помогают радовать наших любимых мужчин! А ведь они даже не догадываются, как с вашей помощью все это просто приготовить))",
    "isOwner": false
  },
  {
    "userName": "Алина Кашкина",
    "userImage": Assets.images.userAvatar4,
    "lastSeen": "5 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        "ОБЯЗАТЕЛЬНО ПРИГОТОВЬТЕ ЭТО СУПЕРСКОЕ БЛЮДО!!! действительно, мясо получилось ну очень сочным и вкусным!!! к вину-идеальное блюдо!!!",
    "isOwner": true
  },
  {
    "userName": "Татьяна Ведунова",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        '''Девочки только что приготовила мяско супер получилось сочное вкусное!!! Семья в восторге!!!''',
    "isOwner": false
  },
  {
    "userName": "Ирина Кракомяко.",
    "userImage": Assets.images.userAvatar3,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        "Вчера готовила это мясо-получилось очень вкусно!!! Съели все за один вечер.Сегодня опять его готовила, но уже добавила картофель крупными кусками, чтобы сразу с гарниром было!!! Настенька, спасибо большое за рецепт. Поедем на море-приготовлю такое мяско в дорогу!!!",
    "isOwner": false
  },
  {
    "userName": "Зулька",
    "userImage": Assets.images.userAvatar4,
    "lastSeen": "5 м назад",
    "time": "Ср 18, 13:49",
    "chatText": "Всё гениальное просто, а ещё и вкусно! Спасибо за рецептик",
    "isOwner": true
  },
  {
    "userName": "Оля Финоченова",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        '''Поистенне шикарно Ирина ты просто кулинарная фея, такие шедевры))) спасибо большое)''',
    "isOwner": false
  },
  {
    "userName": "Ольга Егорова",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText": '''Очень очень вкусно.Всем рекомендую''',
    "isOwner": false
  },
];
List<Map> userComments2 = [
  {
    "userName": "utro_na_more",
    "userImage": Assets.images.userAvatar3,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        "спасибо. все получилось очень нежно. гости все съели за пару минут)",
    "isOwner": false
  },
  {
    "userName": "княгиня",
    "userImage": Assets.images.userAvatar4,
    "lastSeen": "5 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        "Приготовила из филе куры, немного из свинины (корейка, предварительно отбив). Безусловно. из куры лучше, но и свинина неплохо. Спасибо!",
    "isOwner": true
  },
  {
    "userName": "gvenevra",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        '''Спасибо за вкусный рецепт! Готовлю так уже 2 месяца, и никак не можем насладится необычайно вкусным блюдом. Оно теперь одно из самых любимых блюд нашей семьи!''',
    "isOwner": false
  },
  {
    "userName": "Диана Винокурова",
    "userImage": Assets.images.userAvatar3,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        "Вчера сделала, очень вкусно получилось, а жарить быстро, минут 5 на сильном огне если)))))))))))))))",
    "isOwner": false
  },
  {
    "userName": "Евгения Тарасова",
    "userImage": Assets.images.userAvatar4,
    "lastSeen": "5 м назад",
    "time": "Ср 18, 13:49",
    "chatText": "Вчера приготовила очень понравилось! Спасибо за рецепт!",
    "isOwner": true
  },
  {
    "userName": "Ирина Осокина",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        '''Попробовав этот рецепт, только так стала гововить курицу — это очень вкусно, и детям нравится.''',
    "isOwner": false
  },
  {
    "userName": "Настя Гончарная",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText": '''Настя, спасибо за рецепт! просто и оччень вкусно!!!''',
    "isOwner": false
  },
  {
    "userName": "Мышечка Викуся",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText": '''Сегодня буду делать — думаю все получиться!''',
    "isOwner": false
  },
  {
    "userName": "Abracadabra",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "24.10.2022",
    "chatText":
        '''Спасибо огромное, настолько вкусно что просто слов не хватает. Не могу остановится, пора прятать тарерку:-)))''',
    "isOwner": false
  },
  {
    "userName": "marijka",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        '''Получилось обалденно вкусно! Моя маленькая дочка уплетала такую курочку за обе щеки.
''',
    "isOwner": false
  },
  {
    "userName": "Иляна",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        '''спасибо большое! вся семья уплетала за обе щеки...я назвала это блюдо-пища Богов!''',
    "isOwner": false
  },
  {
    "userName": "elena strekoza",
    "userImage": Assets.images.userAvatar5,
    "lastSeen": "2 м назад",
    "time": "Ср 18, 13:49",
    "chatText":
        '''Обязательно сделаю сегодня! Не сомневаюсь, что будет очень вкусно, готовила по другим Вашим рецептам--нравиться абсолютно всё!!!
В курицу всегда добавляю мяту, получается очень свеженько, советую!!!''',
    "isOwner": false
  },
];

List<Map> nejnayaDrawerModel = [
  {"title": 'Ингредиенты', 'items': firstIngredientsRazdel},
  {"title": 'Для травяного масла', 'items': firstIngredientRazdel1},
];
List<Map> jarenayaDrawerModel = [
  {"title": 'Ингредиенты', 'items': secondIngredientsRazdel}
];

List<Widget> secondIngredientsRazdel = [
  const IngridientDetailContainer(
    title: "Части курицы",
    addInfo: "",
    data: "1800 гр",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Соль",
    addInfo: "",
    data: "",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Перец ",
    addInfo: "",
    data: "14 гр (по желанию)",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Паприка",
    addInfo: "",
    data: "25 гр (по желанию)",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Луковый порошек",
    addInfo: "",
    data: "20 гр (по желанию)",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Обезжиренные сливки",
    addInfo: "",
    data: "500 гр",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Мука",
    addInfo: "",
    data: "750 гр",
    data2: "",
  ),
  const SizedBox(height: 5),
  IngridientDetailContainer(
      title: "Масло для жарки",
      addInfo: "",
      data: "2 литра",
      data2: "",
      onTap: () => Navigator.pushNamed(
          MyApp.navigatorKey.currentState!.context, Routes.oilPage)),
];
List<Widget> firstIngredientRazdel1 = [
  const IngridientDetailContainer(
    title: "Петрушка",
    addInfo: "",
    data: "30 гр",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Соль",
    addInfo: "",
    data: "30 гр",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Зеленый лук ",
    addInfo: "",
    data: "30 гр",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Чеснок",
    addInfo: "",
    data: "2 гp",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Лук шалот",
    addInfo: "",
    data: "10 гр",
    data2: "",
  ),
  const SizedBox(height: 5),
  IngridientDetailContainer(
      title: "Оливковое масло ",
      addInfo: "",
      data: "150 г",
      data2: "",
      onTap: () => Navigator.pushNamed(
          MyApp.navigatorKey.currentState!.context, Routes.oilPage)),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Перец чили",
    addInfo: "",
    data: "5 гр",
    data2: "",
  ),
  const SizedBox(height: 5),
  const IngridientDetailContainer(
    title: "Соль ",
    addInfo: "",
    data: "10 гр",
    data2: "",
  ),
];
List<Widget> firstIngredientsRazdel = const [
  IngridientDetailContainer(
    title: "Свиная вырезка",
    addInfo: "",
    data: "550г",
    data2: "",
  ),
  SizedBox(height: 5),
  IngridientDetailContainer(
    title: "Соль",
    addInfo: "",
    data: "5 ч.л.",
    data2: "",
  ),
  SizedBox(height: 5),
  IngridientDetailContainer(
    title: "Сахар",
    addInfo: "",
    data: "2 ч.л.",
    data2: "",
  ),
];

List brandImages = [
  Assets.images.brand3,
  Assets.images.brand2,
  Assets.images.brand1,
];

List brandNames = [
  "Molino Grassi Manitoba 00",
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
  Assets.images.saler2,
];

List salerNames = [
  "Окей",
  "Лента",
  "Eldorado",
  "Eldorado",
];

List salerPrices = [
  "98",
  "88",
  "102",
  "98",
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
    "amount": "63",
    "type": "Б",
    "status": "down",
  },
  {
    "amount": "62",
    "type": "Ж",
    "status": "up",
  },
  {
    "amount": "126",
    "type": "У",
    "status": "down",
  },
  {
    "amount": "1309",
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
    username: "Анастасия Королёва",
    userImage: Assets.images.userAvatar1,
    job: "Шеф-повар Tramontina",
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
    username: "Анастасия Королёва",
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
    userImage: Assets.images.userAvatar3,
    job: "Шеф-повар ресторана Temantoga",
    bio: '''Шеф-повар ресторана Temantoga
текстовое описание которые сам пишет,
может даже сайт указать''',
    followers: "45,6 тыс",
    following: "4,8 тыс",
  ),
  UserModel(
    username: "Анастасия Королёва",
    userImage: Assets.images.userAvatar1,
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
List productTabList = [
  'Информация',
  'Рецепты',
  'Блоги',
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

List<ProductModel> model = [
  ProductModel(
    items: BrandItems(
      brandImages: brandImages,
      brandNames: brandNames,
      brandPrices: brandPrices,
    ),
    title: 'Пшеничная мука',
    ingredient: 'Инградиент • Бакалея',
    desc:
        'Американский тыквенный пирог с корицей — классика застолья Среднего и прочего Запада, анекдотический персонаж американского быта не лишен, однако, прелести',
    subtitle: 'Бренды',
    image: Assets.images.wheatFlourImg,
  ),
  ProductModel(
    items: BrandItems(
      brandImages: oilItemImage,
      brandNames: oilItemName,
      brandPrices: oilItemPrice,
    ),
    title: 'Масло рафинированное',
    ingredient: 'Инградиент • Бакалея',
    desc:
        'Растительное масло, получаемое из плодов оливы европейской. По жирнокислотному составу представляет собой смесь триглицеридов жирных кислот с очень высоким ',
    subtitle: 'Товары',
    image: Assets.images.oilIn,
  ),
];

class ProductModel {
  final String title, ingredient, desc, subtitle, image;
  final BrandItems items;

  ProductModel(
      {required this.title,
      required this.ingredient,
      required this.items,
      required this.desc,
      required this.subtitle,
      required this.image});
}

class BrandItems {
  final List brandImages;
  final List brandNames;
  final List brandPrices;

  BrandItems(
      {required this.brandImages,
      required this.brandNames,
      required this.brandPrices});
}

List oilItemName = [
  "Costa D'Oro",
  "Maestro de Oliva",
];

List oilItemImage = [
  Assets.images.oilSmall,
  Assets.images.maestroOil,
];

List oilItemPrice = [
  "65",
  "65",
];

List props = [
  {
    'title': 'Способ очистки',
    'type': 'Рафинированное',
  },
  {
    'title': 'Особенности производства',
    'type': 'Холодный отжим',
  },
  {
    'title': 'Сорт',
    'type': 'Высший сорт',
  }
];
