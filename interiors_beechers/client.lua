---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS()            
    --[[ 
    if Config.Unknow == true then
        RequestImap(_________________) -- Something relating to BizTemplate
    end     
----------------------- Beechers field
RequestImap(255093300)
RequestImap(1344772301)
RequestImap(-382865315)
RequestImap(181690478)
RequestImap(774601424)
RequestImap(431365499)
RequestImap(-2090209059)
RequestImap(-706937940)
RequestImap(-71885140)
RequestImap(-1792872817)
RequestImap(-1402083909)
-- RequestImap(1929454697) -- beechers field side rows of some medium crop
-- RequestImap(1649902358) -- beechers field side rows of some small crop
-- RequestImap(1864768904) -- beechers field crops in middle
-- RequestImap(938290967)  -- beechers field crops in middle
-- RequestImap(1169279648) -- beechers field crops in middle
-- RequestImap(-284612948) -- beechers field tilled field
RequestImap(-1765152778) -- beechers field logs laying in 
RequestImap(-2072231077) -- beechers field plants over area
RequestImap(-1253110600) -- beechers field hole in ground fix
RequestImap(1965249616)
RequestImap(276582710)
RequestImap(1977031606)
RequestImap(-2021605623)
RequestImap(1191890045)
RequestImap(19217583)
RequestImap(-284612948)
------------------------------------- #### END OF BEECHERS FIELD ####
    --]] 
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end  
    
 ActivateInteriorEntitySet(interior, "bee_01_masterBR_bed01")
 ActivateInteriorEntitySet(interior, "Beechers_decorated_after_Abigail3")
 ActivateInteriorEntitySet(interior, "IntGrp_livingrm_furniture_basic")
 ActivateInteriorEntitySet(interior, "bee_01_house_fireplace_on") 
    --]]
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesYMAPS() 
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

 