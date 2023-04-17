---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS()            
    --[[  
    if Config.Unknow == true then
        RequestImap(_________________) -- Something relating to BizTemplate
    end     
    --]] 
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
    [61442] = {x=-782.50006103516,y=-1324.0,z=44.0,typeHashId=222488432,typeHashName="bla_genstore_int",rpf="bla_genstore_int.rpf"},
        61442 	222488432 	bla_genstore_int 	_p_apple01x_dressing 
    ActivateInteriorEntitySet(interior, "_________________")   
    bla_generalstore01x_em.ydr
    bla_generalstore01x.ydr
    bla_generalstore01x+hidr.ytd
    bla_generalstoredecals01x.ydr
--]]
  
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_genstore_int") 
    ActivateInteriorEntitySet(interior, "bla_generalstoredecals01x") 
    ActivateInteriorEntitySet(interior, "bla_generalstore01x_em") 
    ActivateInteriorEntitySet(interior, "bla_generalstore01x") 
    ActivateInteriorEntitySet(interior, "bla_generalstore01x+hidr") 
    for key, item_set in pairs(item_sets) do
        ActivateInteriorEntitySet(interior, item_set)     
    end 
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
  
    local interior = GetInteriorAtCoords(x, y, z) 
    DeactivateInteriorEntitySet(interior, "bla_genstore_int") 
    DeactivateInteriorEntitySet(interior, "bla_generalstoredecals01x") 
    DeactivateInteriorEntitySet(interior, "bla_generalstore01x_em") 
    DeactivateInteriorEntitySet(interior, "bla_generalstore01x") 
    DeactivateInteriorEntitySet(interior, "bla_generalstore01x+hidr")
    for key, item_set in pairs(item_sets) do
        DeactivateInteriorEntitySet(interior, item_set)     
    end 
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

 