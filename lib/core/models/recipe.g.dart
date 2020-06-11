// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    json['id'] as int,
    json['title'] as String,
    json['readyInMinutes'] as int,
    json['servings'] as int,
    json['image'] as String,
    json['summary'] as String,
    (json['dishTypes'] as List)?.map((e) => e as String)?.toList(),
    (json['diets'] as List)?.map((e) => e as String)?.toList(),
    (json['occasions'] as List)?.map((e) => e as String)?.toList(),
    (json['analyzedInstructions'] as List)
        ?.map((e) => e == null
            ? null
            : AnalyzedInstruction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.recipeId,
      'title': instance.recipeTitle,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'image': instance.imageUrl,
      'summary': instance.summary,
      'dishTypes': instance.dishTypes,
      'diets': instance.diets,
      'occasions': instance.occasions,
      'analyzedInstructions':
          instance.analyzedInstructions?.map((e) => e?.toJson())?.toList(),
    };

AnalyzedInstruction _$AnalyzedInstructionFromJson(Map<String, dynamic> json) {
  return AnalyzedInstruction(
    json['name'] as String,
    (json['steps'] as List)
        ?.map(
            (e) => e == null ? null : Step.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AnalyzedInstructionToJson(
        AnalyzedInstruction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'steps': instance.steps?.map((e) => e?.toJson())?.toList(),
    };

Step _$StepFromJson(Map<String, dynamic> json) {
  return Step(
    json['number'] as int,
    json['step'] as String,
    (json['ingredients'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['equipment'] as List)
        ?.map((e) =>
            e == null ? null : Equipment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
      'number': instance.number,
      'step': instance.step,
      'ingredients': instance.ingredients?.map((e) => e?.toJson())?.toList(),
      'equipment': instance.equipments?.map((e) => e?.toJson())?.toList(),
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return Ingredient(
    json['id'] as int,
    json['name'] as String,
    json['image'] as String,
  );
}

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.ingredientId,
      'name': instance.name,
      'image': instance.imageUrl,
    };

Equipment _$EquipmentFromJson(Map<String, dynamic> json) {
  return Equipment(
    json['id'] as int,
    json['name'] as String,
    json['image'] as String,
  );
}

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'id': instance.equipmentId,
      'name': instance.name,
      'image': instance.imageUrl,
    };
