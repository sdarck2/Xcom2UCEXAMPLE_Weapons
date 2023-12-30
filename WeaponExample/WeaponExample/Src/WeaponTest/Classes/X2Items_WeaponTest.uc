class X2Items_WeaponTest extends  X2Item config(GameData_WeaponData);


// This data is modified in a configuration file
var config WeaponDamageValue  Example_BASEDAMAGE;       //With this we edit the Damage  Spread, PlusOne, Crit, Pierce, Shred, Tag, DamageType            


var config int Example_AIM;
var config int Example_CRITCHANCE;
var config int Example_ICLIPSIZE; //The amount of weapon ammunition before it needs to reload again
var config int Example_ISOUNDRANGE; //Range in Meters, for alerting enemies; 
var config int Example_IENVIRONMENTDAMAGE;//Damage caused to an object (trees, cars, covers) 


var config array<int> Example_RANGE; // the range of the weapon


static function array<X2DataTemplate> CreateTemplates() //With this we create the weapon templates
{
	local array<X2DataTemplate> Weapons; // With this we define the array that we will use to add the templates in this case it's Weapons
	
	Weapons.AddItem(ExampleRifle());	

	return Weapons;

}


static function X2DataTemplate ExampleRifle() // With this we begin to create the weapon and its characteristics of the 
{
	local X2WeaponTemplate Template;     //the local class we will use for the weapon data

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'ExampleRifle_CV');  //The 3rd piece of information is the name that the weapon will have when we call it (Do not be confused with the friendlyname of the weapon that is applied in the localization)
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';  // must match one of the entries in X2ItemTemplateManager's ItemCategories
	Template.WeaponCat = 'rifle';// the category of weapon to which it belongs
	Template.WeaponTech = 'conventional'; //What tier does it belong to
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base";//the image that will show when equipped in the inventory(You have to copy the full name of the image in the package that you created in unreal editor)
	Template.Tier = 0; // The tier this item should be assigned to. Used for sorting lists.

	Template.RangeAccuracy = default.Example_RANGE;
	Template.BaseDamage = default.Example_BASEDAMAGE;
	Template.Aim = default.Example_AIM;
	Template.CritChance = default.Example_CRITCHANCE;
	Template.iClipSize = default.Example_ICLIPSIZE;
	Template.iSoundRange = default.Example_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.Example_IENVIRONMENTDAMAGE;
	
	Template.NumUpgradeSlots = 1; // Number of weapon slots available
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon; //If it is a primary or secondary weapon

	//These are the basic abilities that a rifle has
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_AssaultRifle_CV.WP_AssaultRifle_CV";

	
	//This is used when you want to make the attachments visible in the game
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true; //refers to whether the item can be used from the beginning without having to buy or improve something
	Template.CanBeBuilt = false; // This means that if you can create it in Engineering
	Template.bInfiniteItem = true; //This refers to whether the object is infinite or not
	
	Template.fKnockbackDamageAmount = 5.0f; //Damage amount applied to the environment on knock back
	Template.fKnockbackDamageRadius = 0.0f; //Radius of the affected area at hit tile locations

	Template.DamageTypeTemplateName = 'Projectile_Conventional';
	
	return Template;
}