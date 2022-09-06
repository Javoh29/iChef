class RecipeModel {
  String? recipeVideo;
  String? recipeVideoPoster;
  String? userAvatar;
  String? userName;
  String? categoryName;
  String? recipeName;
  String? recipeTime;
  String? recipeView;
  String? recipeDesc;
  int? likeCount;
  int? commentCount;
  int? ingredientCount;
  int? variationCount;
  List<Map> recipeSteps;
  List<Map> userComment;

  RecipeModel({
    this.recipeVideo,
    this.recipeVideoPoster,
    this.userAvatar,
    this.userName,
    this.categoryName,
    this.recipeName,
    this.recipeTime,
    this.recipeView,
    this.likeCount,
    this.commentCount,
    this.ingredientCount,
    this.variationCount,
    this.recipeDesc,
    required this.recipeSteps,
    required this.userComment,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        recipeVideo: json['recipe_video'] as String?,
        recipeVideoPoster: json['recipe_video_poster'] as String?,
        userAvatar: json['user_avatar'] as String?,
        userName: json['user_name'] as String?,
        categoryName: json['category_name'] as String?,
        recipeName: json['recipe_name'] as String?,
        likeCount: json['like_count'] as int?,
        commentCount: json['comment_count'] as int?,
        ingredientCount: json['ingredient_count'] as int?,
        variationCount: json['variation_count'] as int?,
        recipeDesc: json['recipe_desc'] as String?,
        recipeSteps: json['recipe_steps'] as List<Map>,
        userComment: json['user_comment'] as List<Map>,
      );

  Map<String, dynamic> toJson() => {
        'recipe_video': recipeVideo,
        'recipe_video_poster': recipeVideoPoster,
        'user_avatar': userAvatar,
        'user_name': userName,
        'category_name': categoryName,
        'recipe_name': recipeName,
        'like_count': likeCount,
        'comment_count': commentCount,
        'ingredient_count': ingredientCount,
        'variation_count': variationCount,
        'recipe_desc': recipeDesc,
      };

  RecipeModel copyWith({
    String? recipeVideo,
    String? recipeVideoPoster,
    String? userAvatar,
    String? userName,
    String? categoryName,
    String? recipeName,
    int? likeCount,
    int? commentCount,
    int? ingredientCount,
    int? variationCount,
  }) {
    return RecipeModel(
      recipeVideo: recipeVideo ?? this.recipeVideo,
      recipeVideoPoster: recipeVideoPoster ?? this.recipeVideoPoster,
      userAvatar: userAvatar ?? this.userAvatar,
      userName: userName ?? this.userName,
      categoryName: categoryName ?? this.categoryName,
      recipeName: recipeName ?? this.recipeName,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      ingredientCount: ingredientCount ?? this.ingredientCount,
      variationCount: variationCount ?? this.variationCount,
      recipeSteps: [],
      userComment: [],
    );
  }

  @override
  String toString() {
    return 'RecipeModel(recipeVideo: $recipeVideo, userAvatar: $userAvatar, userName: $userName, categoryName: $categoryName, recipeName: $recipeName, likeCount: $likeCount, commentCount: $commentCount, ingredientCount: $ingredientCount, variationCount: $variationCount)';
  }
}
