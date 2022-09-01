abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get homeMenu => '$basePath/menu_icons/ic_home_menu.svg';

  String get cartMenu => '$basePath/menu_icons/ic_cart_menu.svg';

  String get favoritesMenu => '$basePath/menu_icons/ic_favorites_menu.svg';

  String get calendarMenu => '$basePath/menu_icons/ic_calendar_menu.svg';

  String get recipesMenu => '$basePath/menu_icons/ic_recipes_menu.svg';

  String get searchMenu => '$basePath/menu_icons/ic_search_menu.svg';

  String get settingsMenu => '$basePath/menu_icons/ic_settings_menu.svg';

  String get appLogo => '$basePath/ic_app_logo.svg';

  String get like => '$basePath/ic_like.svg';

  String get share => '$basePath/ic_share.svg';

  String get comment => '$basePath/ic_comment.svg';

  String get ingredients => '$basePath/ic_ingredients.svg';

  String get variation => '$basePath/ic_variation.svg';

  String get peoples => '$basePath/ic_peoples.svg';

  String get calendar => '$basePath/ic_calendar.svg';

  String get recipeTime => '$basePath/recipe_info_icons/ic_recipe_time.svg';

  String get recipeView => '$basePath/recipe_info_icons/ic_recipe_view.svg';

  String get bakeryOne => '$basePath/recipe_info_icons/ic_bakery_one.png';

  String get flagOne => '$basePath/recipe_info_icons/ic_flag_one.png';

  String get gluttenOne => '$basePath/recipe_info_icons/ic_glutten_one.png';

  String get moreOne => '$basePath/recipe_info_icons/ic_more_one.png';

  String get pancakeOne => '$basePath/recipe_info_icons/ic_pancake_one.png';

  String get stoveOne => '$basePath/recipe_info_icons/ic_stove_one.png';

  String get timeOne => '$basePath/recipe_info_icons/ic_time_one.png';

  String get backArrow => '$basePath/ic_back_arrow.svg';

  String get nextArrow => '$basePath/ic_next_arrow.svg';

  String get search => '$basePath/ic_search.svg';

  String get playBtn => '$basePath/ic_play_btn.svg';

  String get coffee => "$basePath/ic_coffee.png";

  String get cancel => "$basePath/ic_cancel.svg";

  String get cancelBlack => "$basePath/ic_cancel_black.png";

  String get back => '$basePath/ic_back.svg';

  String get info => '$basePath/ic_info.svg';

  String get add => '$basePath/ic_add.svg';

  String get addBlack => '$basePath/ic_add_black.svg';

  String get remove => '$basePath/ic_remove.svg';

  String get removeBlack => '$basePath/ic_remove_black.svg';

  String get scanner => '$basePath/ic_scanner.svg';

  String get edit => '$basePath/ic_edit.svg';

  String get delete => '$basePath/ic_delete.svg';

  String get basket => '$basePath/ic_basket.svg';

  String get subscribe => '$basePath/ic_subscripe.svg';

  String get trash => '$basePath/ic_trash.svg';

  String get check => '$basePath/ic_check.svg';

  String get filter => '$basePath/ic_filter.svg';

  String get threePoint => '$basePath/three_point.svg';

  String get bSheetClose => '$basePath/ic_bsheet_close.svg';

  String get more => '$basePath/ic_more.svg';

  String get folder => '$basePath/ic_folder.svg';

  String get up => '$basePath/ic_up.svg';

  String get down => '$basePath/ic_down.svg';

  String get addOutlined => '$basePath/ic_add_outlined.svg';

  String get twoPerson => '$basePath/ic_two_person.svg';
  String get addRounded => '$basePath/ic_add_rounded.svg';

  String get bell => '$basePath/ic_bell.svg';

  String get contact => '$basePath/ic_contact.svg';

  String get foodOne => '$basePath/ic_food_one.png';

  String get foodTwo => '$basePath/ic_food_two.png';

  String get foodThree => '$basePath/ic_food_three.png';

  String get foodFour => '$basePath/ic_food_four.png';

  String get foodFive => '$basePath/ic_food_five.png';

  String get foodSix => '$basePath/ic_food_six.png';

  String get send => '$basePath/ic_send.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get userAvatar1 => "$basePath/img_user1.jpeg";

  String get userAvatar2 => "$basePath/img_user2.jpeg";

  String get userAvatar3 => "$basePath/img_user3.png";

  String get userAvatar4 => "$basePath/img_user4.png";

  String get userAvatar5 => "$basePath/img_user5.png";

  String get recipeChicken => "$basePath/img_chicken.png";

  String get recipeMedovik => "$basePath/img_classic_medovik.png";

  String get recipePrepaireOne => "$basePath/img_prepaire_one.png";

  String get flourImg => "$basePath/img_flour.png";

  String get wheatFlourImg => "$basePath/img_wheat_flour.png";

  String get brand1 => "$basePath/flour_brands/img_brand_flour_1.png";

  String get brand2 => "$basePath/flour_brands/img_brand_flour_2.png";

  String get brand3 => "$basePath/flour_brands/img_brand_flour_3.png";

  String get saler1 => "$basePath/flour_salers/img_saler_lenta.png";

  String get saler2 => "$basePath/flour_salers/img_saler_okey.png";

  String get saler3 => "$basePath/flour_salers/img_saler_ozon.png";

  String get smile => "$basePath/img_smile.png";
}
