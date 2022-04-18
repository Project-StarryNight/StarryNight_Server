/*
 * ZenScript by Hikari_Nova & shang_jun_
 * 未经过授权，禁止用于其他整合包或服务器内容。
 * 此脚本为龙素产线内容
*/

import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;

//注:本脚本内的"XX处理"是指这一配方是用于处理XX的,而不是通过处理获得XX

//龙心处理
starry_universe_cultivation_cabin.recipeBuilder()
    .inputs(<draconicevolution:dragon_heart>)
    .fluidInputs([<liquid:sterilized_growth_medium> * 8000])
    .outputs(
        <contenttweaker:dragon_cell> * 512
    )
    .fluidOutputs([<liquid:dragon_blood> * 128000])
    .circuit(4)
    .EUt(7680)
    .duration(12000)
    .buildAndRegister();

//龙蛋复制
starry_universe_cultivation_cabin.recipeBuilder()
    .inputs(<minecraft:dragon_egg>)
    .fluidInputs([<liquid:sterilized_growth_medium> * 8000])
    .outputs(<minecraft:dragon_egg> * 4)
    .fluidOutputs([<liquid:mutagen> * 3200])
    .circuit(0)
    .EUt(7680)
    .duration(9000)
    .buildAndRegister();

//龙血
starry_universe_cultivation_cabin.recipeBuilder()
    .inputs(<minecraft:dragon_egg>)
    .fluidInputs([<liquid:sterilized_growth_medium> * 8000])
    .fluidOutputs([<liquid:dragon_blood> * 32000, <liquid:mutagen> * 3200])
    .circuit(1)
    .EUt(7680)
    .duration(18000)
    .buildAndRegister();

//龙息
starry_universe_cultivation_cabin.recipeBuilder()
    .inputs(<minecraft:dragon_egg>)
    .fluidInputs([<liquid:sterilized_growth_medium> * 8000])
    .outputs(<minecraft:dragon_breath> * 64)
    .fluidOutputs([<liquid:mutagen> * 3200])
    .circuit(2)
    .EUt(7680)
    .duration(18000)
    .buildAndRegister();

//龙组织
starry_universe_cultivation_cabin.recipeBuilder()
    .inputs(<minecraft:dragon_egg>)
    .fluidInputs([<liquid:sterilized_growth_medium> * 8000])
    .outputs(
        <contenttweaker:dragon_cell> * 256
    )
    .fluidOutputs([<liquid:mutagen> * 3200])
    .circuit(3)
    .EUt(7680)
    .duration(18000)
    .buildAndRegister();

//氧化龙素混合物粉处理
chemical_reactor.recipeBuilder()
    .inputs(<ore:dustDraconiumOxideCompound> * 7)
    .fluidInputs([<liquid:phosphoric_acid> * 6000])
    .fluidOutputs([<liquid:draconium_oxide_compound_slurry> * 5000])
    .EUt(30720)
    .duration(220)
    .buildAndRegister();

//氧化龙素混合物矿浆处理
centrifuge.recipeBuilder()
    .fluidInputs([<liquid:draconium_oxide_compound_slurry> * 2500])
    .outputs(<gregtech:meta_dust:32025> * 6)
    .fluidOutputs([<liquid:precipitated_draconium_residue_solution> * 10000])
    .EUt(30720)
    .duration(130)
    .buildAndRegister();

//沉淀龙素矿渣溶液处理
centrifuge.recipeBuilder()
    .fluidInputs([<liquid:precipitated_draconium_residue_solution> * 5000])
    .outputs(<gregtech:meta_dust:118> * 2, <gregtech:meta_dust:53>)
    .fluidOutputs([<liquid:phosphoric_acid> * 2000])
    .EUt(30720)
    .duration(80)
    .buildAndRegister();

//低纯氧化龙素粉处理
chemical_reactor.recipeBuilder()
    .inputs(<ore:dustLowPurityDraconiumOxide> * 6)
    .fluidInputs([<liquid:fluoroantimonic_acid> * 9000])
    .fluidOutputs([<liquid:fluoantimonate_draconium_solution> * 5000])
    .EUt(122880)
    .duration(200)
    .buildAndRegister();

//氟锑酸龙素溶液处理
distillation_tower.recipeBuilder()
    .fluidInputs([<liquid:fluoantimonate_draconium_solution> * 5000])
    .fluidOutputs([<liquid:impure_fluoroantimonic_acid> * 9000])
    .outputs(<gregtech:meta_dust:32026> * 7)
    .EUt(122880)
    .duration(265)
    .buildAndRegister();

//含杂氟锑酸处理
centrifuge.recipeBuilder()
    .fluidInputs([<liquid:impure_fluoroantimonic_acid> * 9000])
    .outputs(<gregtech:meta_dust:2522> * 7)
    .fluidOutputs([<liquid:fluoroantimonic_acid> * 5000])
    .EUt(30720)
    .duration(130)
    .buildAndRegister();

//六氟化龙素处理
large_chemical_reactor.recipeBuilder()
    .inputs(<ore:dustDraconiumHexafluoride> * 7)
    .outputs(<gregtech:meta_dust:32027>,<gregtech:meta_dust:4> * 3)
    .fluidInputs([<liquid:hydrogen> * 21000])
    .fluidOutputs([<liquid:hydrofluoric_acid> * 21000])
    .EUt(122880)
    .duration(200)
    .buildAndRegister();

//粗制龙素粉
mixer.recipeBuilder()
    .inputs(<gregtech:meta_dust:32027>)
    .outputs(<gregtech:meta_dust:32028> * 3)
    .fluidInputs([<liquid:plasma.helium> * 576])
    .fluidOutputs([<liquid:helium> * 576])
    .EUt(30720)
    .duration(290)
    .buildAndRegister();

//龙息溶液
mixer.recipeBuilder()
    .inputs(<minecraft:dragon_breath> * 4)
    .fluidInputs([<liquid:water> * 1000])
    .fluidOutputs([<liquid:dragon_breath_solution> * 2000])
    .EUt(7680)
    .duration(160)
    .buildAndRegister();

//活性龙组织混合液
mixer.recipeBuilder()
    .inputs(<contenttweaker:dragon_cell> * 8)
    .fluidInputs([<liquid:dragon_breath_solution> * 1000,<liquid:dragon_blood> * 1000])
    .fluidOutputs([<liquid:activated_dragon_tissue_mixture> * 1000])
    .EUt(122880)
    .duration(120)
    .buildAndRegister();

//临界龙组织混合液
electric_blast_furnace.recipeBuilder()
    .inputs(<ore:dustNaquadahEnriched> * 4)
    .fluidInputs([<liquid:activated_dragon_tissue_mixture> * 1000])
    .fluidOutputs([<liquid:critical_dragon_tissue_mixture> * 1000])
    .EUt(122880)
    .duration(450)
    .property("temperature",8000)
    .buildAndRegister();

//激发态龙组织混合液
fluid_heater.recipeBuilder()
    .fluidInputs([<liquid:critical_dragon_tissue_mixture> * 1000])
    .fluidOutputs([<liquid:excited_dragon_tissue_mixture> * 800])
    .EUt(122880)
    .duration(360)
    .circuit(1)
    .buildAndRegister();

//热龙素锭
electric_blast_furnace.recipeBuilder()
    .inputs(<ore:dustCrudeDraconium> * 6)
    .outputs(
        <gregtech:meta_ingot_hot:32022>,
        <gregtech:meta_dust:32029>
    )
    .fluidInputs([<liquid:excited_dragon_tissue_mixture> * 400])
    .fluidOutputs([<liquid:inactivated_dragon_tissue_mixture> * 600])
    .EUt(393216)
    .duration(1720)
    .property("temperature",8000)
    .buildAndRegister();

//龙素锭
vacuum_freezer.findRecipe(120, [<metaitem:ingotHotDraconium>], null).remove();
vacuum_freezer.recipeBuilder()
    .inputs(<gregtech:meta_ingot_hot:32022>)
    .outputs(<gregtech:meta_ingot:32022>)
    .EUt(122880)
    .duration(430)
    .buildAndRegister();


//亚稳态觉醒龙素混合物粉处理
mixer.recipeBuilder()
    .inputs(
        <ore:dustSubStableDraconiumAwakenedMixture> * 3,
        <ore:dustNeutronium> * 2
    )
    .outputs(<gregtech:meta_dust:32030> * 5)
    .EUt(491520)
    .duration(265)
    .buildAndRegister();

//超能觉醒龙素混合物粉处理
mixer.recipeBuilder()
    .inputs(<ore:dustHyperDraconiumAwakenedMixture> * 5)
    .fluidOutputs(<liquid:hyper_draconium_awakened_mixture_solution> * 4000)
    .fluidInputs([<liquid:aqua_regia> * 12000])
    .EUt(491520)
    .duration(165)
    .buildAndRegister();

//超能觉醒龙素混合物溶液处理
centrifuge.recipeBuilder()
    .inputs(<ore:dustNaquadriaSulfate> * 6)
    .outputs(
        <gregtech:meta_dust:126>,
        <gregtech:meta_dust:32031> * 6
    )
    .fluidInputs([<liquid:hyper_draconium_awakened_mixture_solution> * 2000])
    .fluidOutputs([<liquid:precipitated_draconium_awakened_residue_solution> * 5000])
    .EUt(1966080)
    .duration(350)
    .buildAndRegister();

//觉醒龙素沉淀矿渣溶液
centrifuge.recipeBuilder()
    .outputs(
        <gregtech:meta_dust:8> * 2,
        <gregtech:meta_dust:66>,
        <gregtech:meta_dust:95>
    )
    .fluidInputs([<liquid:precipitated_draconium_awakened_residue_solution> * 2500])
    .fluidOutputs([<liquid:aqua_regia> * 2250])
    .EUt(30720)
    .duration(310)
    .buildAndRegister();

//硫酸超能觉醒龙素粉处理
electric_blast_furnace.recipeBuilder()
    .inputs(<ore:dustHyperDraconiumAwakenedSulfate> * 6)
    .outputs(<gregtech:meta_dust:32032>)
    .fluidInputs([<liquid:hydrogen> * 2000])
    .fluidOutputs([<liquid:sulfuric_acid> * 1000])
    .EUt(1966080)
    .duration(615)
    .property("temperature",9001)
    .buildAndRegister();

//超能觉醒龙素粉处理
electric_blast_furnace.recipeBuilder()
    .inputs(<ore:dustHyperDraconiumAwakened> * 2)
    .outputs(<gregtech:meta_ingot_hot:32033> * 2)
    .fluidInputs([<liquid:duranium> * 576])
    .EUt(1966080)
    .duration(450)
    .property("temperature",9001)
    .buildAndRegister();

//蕴魔龙素锭
electric_blast_furnace.recipeBuilder()
    .inputs(<ore:ingotDraconium>)
    .outputs(<gregtech:meta_ingot_hot:32034>)
    .fluidInputs([<liquid:mana> * 10000])
    .EUt(122880)
    .duration(870)
    .property("temperature",9001)
    .buildAndRegister();

vacuum_freezer.findRecipe(120, [<metaitem:ingotHotEnchantedDraconium>], null).remove();
vacuum_freezer.recipeBuilder()
    .inputs(<ore:ingotHotEnchantedDraconium>)
    .outputs(<gregtech:meta_ingot:32034>)
    .fluidInputs([<liquid:astralsorcery.liquidstarlight> * 3000])
    .EUt(122880)
    .duration(270)
    .buildAndRegister();

//硬化觉醒龙素
fluid_solidifier.recipeBuilder()
    .inputs(<ore:ingotEnchantedDraconium>)
    .outputs(<gregtech:meta_ingot_hot:32035>)
    .fluidInputs([<liquid:hardened_hyper_draconium_awakened> * 144])
    .EUt(491520)
    .duration(1210)
    .buildAndRegister();

//精华觉醒龙素
chemical_bath.recipeBuilder()
    .inputs(<ore:ingotHardenedDraconiumAwakened>)
    .outputs(<gregtech:meta_ingot:32036>)
    .fluidInputs([<liquid:liquid_ender_air> * 10000])
    .EUt(1966080)
    .duration(170)
    .buildAndRegister();

//觉醒龙素粉
electrolyzer.recipeBuilder()
    .inputs(<gregtech:meta_item_1:209>)
    .outputs(<gregtech:meta_dust:32023> * 20)
    .fluidInputs([<liquid:essential_draconium_awakened> * 4320])
    .fluidOutputs([<liquid:hyper_slurry> * 15000])
    .EUt(1966080)
    .duration(670)
    .buildAndRegister();

//超能泥浆处理
centrifuge.recipeBuilder()
    .outputs(
        <gregtech:meta_dust:39> * 2,
        <gregtech:meta_dust:71> * 2,
        <gregtech:meta_dust:55> * 3
    )
    .fluidInputs([<liquid:hyper_slurry> * 3000])
    .fluidOutputs([<liquid:cosmic_matter_solution> * 500])
    .EUt(491520)
    .duration(405)
    .buildAndRegister();

//寰宇物质溶液处理
electrolyzer.recipeBuilder()
    .outputs(
        <gregtech:meta_dust:27> * 2,
        <avaritia:resource:2> * 3
    )
    .fluidInputs([<liquid:cosmic_matter_solution> * 1000])
    .fluidOutputs([<liquid:aqua_regia> * 1000])
    .EUt(1966080)
    .duration(15)
    .buildAndRegister();
