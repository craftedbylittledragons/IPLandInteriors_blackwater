---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS() 
    --[[  
    if Config.Unknow == true then
        RequestImap(666617953) -- Something relating to valentine saloon
    end 
    --]]     
end

function EnableResouresINTERIORS(x, y, z)  
    --[[  
    local interior = GetInteriorAtCoords(x, y, z)  
    ActivateInteriorEntitySet(interior, "__________________")   -- main 
    if Config.Unknow == true then 
        ActivateInteriorEntitySet(interior, "__________________") -- sub
    end   	
        ActivateInteriorEntitySets(50690, "Beechers", { 
	})
    --]]  
    local interior = GetInteriorAtCoords(x, y, z)  
    ActivateInteriorEntitySet(interior, "bee_01_masterBR_bed01")   -- main 
    ActivateInteriorEntitySet(interior, "Beechers_decorated_after_Abigail3") 
    ActivateInteriorEntitySet(interior, "IntGrp_livingrm_furniture_basic") 
    ActivateInteriorEntitySet(interior, "bee_01_house_fireplace_on") 
    ActivateInteriorEntitySet(interior, "BEECHERS_PIANO_STOOL") 
    ActivateInteriorEntitySet(interior, "bee_01_house_chair") 
    ActivateInteriorEntitySet(interior, "Beechers_fully_decorated_finale")  
end  

----------- turn off the bar ------
function DisableResourcesYMAPS()  
    --[[     
    RemoveImap(666617953) -- Something relating to valentine saloon 
    --]]  
end

function DisableResourcesINTERIORS(x, y, z) 
    --[[   
    local interior = GetInteriorAtCoords(x, y, z)   
    DeactivateInteriorEntitySet(interior, "val_saloon_int")  --- main
    DeactivateInteriorEntitySet(interior, "4_chair_poker_set")  --- sub
    --]]  
    local interior = GetInteriorAtCoords(x, y, z)   
    DeactivateInteriorEntitySet(interior, "bee_01_masterBR_bed01")   -- main 
    DeactivateInteriorEntitySet(interior, "Beechers_decorated_after_Abigail3") 
    DeactivateInteriorEntitySet(interior, "IntGrp_livingrm_furniture_basic") 
    DeactivateInteriorEntitySet(interior, "bee_01_house_fireplace_on") 
    DeactivateInteriorEntitySet(interior, "BEECHERS_PIANO_STOOL") 
    DeactivateInteriorEntitySet(interior, "bee_01_house_chair") 
    DeactivateInteriorEntitySet(interior, "Beechers_fully_decorated_finale")  
end    
 
 
-----------------------------------------------------
---remove all on resource stop---
-----------------------------------------------------
AddEventHandler('onResourceStop', function(resource) 
    if resource == GetCurrentResourceName() then     
        -- when resource stops disable them, admin is restarting the script
        DisableResourcesYMAPS() 
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
        DisableResourcesYMAPS() 
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
        DisableResourcesYMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)

        -- basically run once after character has loadded in  
        EnableResouresYMAPS() 
        EnableResouresINTERIORS(Config.x, Config.y, Config.z)
        interiorsActive = true
        unlockDoors()  
    end
end)

 