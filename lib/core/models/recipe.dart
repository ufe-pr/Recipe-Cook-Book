import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable(explicitToJson: true)
class Recipe {
  @JsonKey(name: 'id')
  final int recipeId;

  @JsonKey(name: 'title')
  final String recipeTitle;

  final int readyInMinutes, servings;

  @JsonKey(name: 'image')
  final String imageUrl;

  final String summary;
  final List<String> dishTypes, diets, occasions;

  final List<AnalyzedInstruction> analyzedInstructions;

  Recipe(this.recipeId, this.recipeTitle, this.readyInMinutes, this.servings, this.imageUrl, this.summary, this.dishTypes, this.diets, this.occasions, this.analyzedInstructions);

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  String get imageAssetPath => 'assets/api/images/${this.recipeId}';
}

@JsonSerializable(explicitToJson: true)
class AnalyzedInstruction {
  final String name;
  final List<Step> steps;

  AnalyzedInstruction(this.name, this.steps);

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => _$AnalyzedInstructionFromJson(json);
  Map<String, dynamic> toJson() => _$AnalyzedInstructionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Step {
  final int number;
  final String step;
  final List<Ingredient> ingredients;

  @JsonKey(name: 'equipment')
  final List<Equipment> equipments;

  Step(this.number, this.step, this.ingredients, this.equipments);

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
  Map<String, dynamic> toJson() => _$StepToJson(this);
}

@JsonSerializable()
class Ingredient {
  @JsonKey(name: 'id')
  final int ingredientId;

  final String name;

  @JsonKey(name: 'image')
  final String imageUrl;

  Ingredient(this.ingredientId, this.name, this.imageUrl);

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

@JsonSerializable()
class Equipment {
  @JsonKey(name: 'id')
  final int equipmentId;

  final String name;

  @JsonKey(name: 'image')
  final String imageUrl;

  Equipment(this.equipmentId, this.name, this.imageUrl);

  factory Equipment.fromJson(Map<String, dynamic> json) => _$EquipmentFromJson(json);
  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}
