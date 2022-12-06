---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresIMAP()            
    --[[ 
    [61442] = {x=-782.50006103516,y=-1324.0,z=44.0,typeHashId=222488432,typeHashName="bla_genstore_int",rpf="bla_genstore_int.rpf"},
    if Config.Unknow == true then
        RequestImap(_________________) -- Something relating to BizTemplate
    end     
    --]] 
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
        61442 	222488432 	bla_genstore_int 	_p_apple01x_dressing
        61442 	222488432 	bla_genstore_int 	_p_apple01x_group
        61442 	222488432 	bla_genstore_int 	_p_carrots_01x_dressing
        61442 	222488432 	bla_genstore_int 	_p_carrots_01x_group
        61442 	222488432 	bla_genstore_int 	_p_cigar02x_dressing
        61442 	222488432 	bla_genstore_int 	_p_cigar02x_group
        61442 	222488432 	bla_genstore_int 	_p_cigarettebox01x_dressing
        61442 	222488432 	bla_genstore_int 	_p_cigarettebox01x_group
        61442 	222488432 	bla_genstore_int 	_p_int_fishing01_dressing
        61442 	222488432 	bla_genstore_int 	_p_tin_pomade01x_dressing
        61442 	222488432 	bla_genstore_int 	_p_tin_pomade01x_group
        61442 	222488432 	bla_genstore_int 	_p_tin_soap01x_dressing
        61442 	222488432 	bla_genstore_int 	_p_tin_soap01x_group
        61442 	222488432 	bla_genstore_int 	_s_beardTonic01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_beardTonic01x_group
        61442 	222488432 	bla_genstore_int 	_s_biscuits01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_biscuits01x_group
        61442 	222488432 	bla_genstore_int 	_s_brandy01x_group
        61442 	222488432 	bla_genstore_int 	_s_canApricots01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_canApricots01x_group
        61442 	222488432 	bla_genstore_int 	_s_candyBag01x_red_group
        61442 	222488432 	bla_genstore_int 	_s_canKidney01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_cankidney01x_group
        61442 	222488432 	bla_genstore_int 	_s_canPeas01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_canPeas01x_group
        61442 	222488432 	bla_genstore_int 	_s_cheeseWedge1x_group
        61442 	222488432 	bla_genstore_int 	_s_chocolateBar02x_dressing
        61442 	222488432 	bla_genstore_int 	_s_chocolateBar02x_group
        61442 	222488432 	bla_genstore_int 	_s_coffeeTin01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_coffeeTin01x_group
        61442 	222488432 	bla_genstore_int 	_s_cornedBeef01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_cornedBeef01x_group
        61442 	222488432 	bla_genstore_int 	_s_crackers01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_crackers01x_group
        61442 	222488432 	bla_genstore_int 	_s_cricketTin01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_cricketTin01x_group
        61442 	222488432 	bla_genstore_int 	_s_gunOil01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_gunOil01x_group
        61442 	222488432 	bla_genstore_int 	_s_inv_baitHerb01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_inv_baitherb01x_group
        61442 	222488432 	bla_genstore_int 	_s_inv_baitMeat01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_inv_baitmeat01x_group
        61442 	222488432 	bla_genstore_int 	_s_inv_gin01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_inv_gin01x_group
        61442 	222488432 	bla_genstore_int 	_s_inv_horsePills01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_inv_horsePills01x_group
        61442 	222488432 	bla_genstore_int 	_s_inv_rum01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_inv_rum01x_group
        61442 	222488432 	bla_genstore_int 	_s_inv_tabacco01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_inv_tabacco01x_group
        61442 	222488432 	bla_genstore_int 	_s_inv_whiskey01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_inv_whiskey01x_group
        61442 	222488432 	bla_genstore_int 	_s_oatcakes01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_oatcakes01x_group
        61442 	222488432 	bla_genstore_int 	_s_peach01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_peach01x_group
        61442 	222488432 	bla_genstore_int 	_s_saltedbeef01x_group
        61442 	222488432 	bla_genstore_int 	_s_saltedbeef02x_group
        61442 	222488432 	bla_genstore_int 	_s_wormCan01x_dressing
        61442 	222488432 	bla_genstore_int 	_s_wormcan01x_group

	ActivateInteriorEntitySets(61442, "Blackwater general store", {
		"_p_apple01x_dressing",
		"_p_apple01x_dressing",
		"_p_carrots_01x_dressing",
		"_p_carrots_01x_group",
		"_p_cigar02x_dressing",
		"_p_cigar02x_group",
		"_p_cigarettebox01x_dressing",
		"_p_cigarettebox01x_group",
		"_p_int_fishing01_dressing",
		"_p_tin_pomade01x_dressing",
		"_p_tin_pomade01x_group",
		"_p_tin_soap01x_dressing",
		"_p_tin_soap01x_group",
		"_s_beardTonic01x_dressing",
		"_s_beardTonic01x_group",
		"_s_biscuits01x_dressing",
		"_s_biscuits01x_group",
		"_s_brandy01x_group",
		"_s_canApricots01x_dressing",
		"_s_canApricots01x_group",
		"_s_candyBag01x_red_group",
		"_s_canKidney01x_dressing",
		"_s_cankidney01x_group",
		"_s_canPeas01x_dressing",
		"_s_canPeas01x_group",
		"_s_cheeseWedge1x_group",
		"_s_chocolateBar02x_dressing",
		"_s_chocolateBar02x_group",
		"_s_coffeeTin01x_dressing",
		"_s_coffeeTin01x_group",
		"_s_cornedBeef01x_dressing",
		"_s_cornedBeef01x_group",
		"_s_crackers01x_dressing",
		"_s_crackers01x_group",
		"_s_cricketTin01x_dressing",
		"_s_cricketTin01x_group",
		"_s_gunOil01x_dressing",
		"_s_gunOil01x_group",
		"_s_inv_baitHerb01x_dressing",
		"_s_inv_baitherb01x_group",
		"_s_inv_baitMeat01x_dressing",
		"_s_inv_baitmeat01x_group",
		"_s_inv_gin01x_dressing",
		"_s_inv_gin01x_group",
		"_s_inv_horsePills01x_dressing",
		"_s_inv_horsePills01x_group",
		"_s_inv_rum01x_dressing",
		"_s_inv_rum01x_group",
		"_s_inv_tabacco01x_dressing",
		"_s_inv_tabacco01x_group",
		"_s_inv_whiskey01x_dressing",
		"_s_inv_whiskey01x_group",
		"_s_oatcakes01x_dressing",
		"_s_oatcakes01x_group",
		"_s_peach01x_dressing",
		"_s_peach01x_group",
		"_s_saltedbeef01x_group",
		"_s_saltedbeef02x_group",
		"_s_wormCan01x_dressing",
		"_s_wormcan01x_group"
	})
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    --]]
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesIMAPS() 
    --[[
    RemoveImap(6666_________________17953) -- Something relating to BizTemplate  
    --]]  
end

function DisableResourcesINTERIORS(x, y, z)  
    --[[
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "_________________")     
    DeactivateInteriorEntitySet(interior, "_________________")  
    --]]       
end    
 
 
-----------------------------------------------------
---remove all on resource stop---
-----------------------------------------------------
AddEventHandler('onResourceStop', function(resource) 
    if resource == GetCurrentResourceName() then     
        -- when resource stops disable them, admin is restarting the script
        DisableResourcesIMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)
    end
end)

-----------------------------------------------------
--- clear all on resource start ---
-----------------------------------------------------
AddEventHandler('onResourceStart', function(resource) 
    if resource == GetCurrentResourceName() then         
        Citizen.Wait(3000)
        -- interiors loads all of these, so we need to disable them 
        DisableResourcesIMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)
        Citizen.Wait(3000)        
        -- because the character is already logged in on resource "re"start
        character_selected = true
    end
end)
 

-----------------------------------------------------
-- Trigger when character is selected
-----------------------------------------------------
RegisterNetEvent("vorp:SelectedCharacter") -- NPC loads after selecting character
AddEventHandler("vorp:SelectedCharacter", function(charid) 
	character_selected = true
end)
  
-----------------------------------------------------
-- Main thread that controls the script
-----------------------------------------------------
Citizen.CreateThread(function()
    while character_selected == false do 
        Citizen.Wait(1000)
    end 
    if character_selected == true and interiorsActive == false then 
        --- cleanup any previous scripts loading content
        DisableResourcesIMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)

        -- basically run once after character has loadded in  
        EnableResouresIMAP() 
        EnableResouresINTERIORS(Config.x, Config.y, Config.z)
        interiorsActive = true
        unlockDoors()  
    end
end)

 