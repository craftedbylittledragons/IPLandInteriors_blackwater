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
    --[[r
	[53506] = {x=-868.33392333984,y=-1366.1890869141,z=41.829612731934,typeHashId=645886888,typeHashName="bla_carriagehouse_int",rpf="bla_carriagehouse_int.rpf"},
    --]]            
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_carriagehouse_int")       
    if Config.CarriageHouse == true then  
        ActivateInteriorEntitySet(interior, "bla_carriagehouse_int_ref")
        ActivateInteriorEntitySet(interior, "bla_carriagehouse_lightbox ")
        ActivateInteriorEntitySet(interior, "bla_carriage_int_decals02")
        ActivateInteriorEntitySet(interior, "bla_carriage_int_details01")
        ActivateInteriorEntitySet(interior, "bla_carriage_int_details02")
        ActivateInteriorEntitySet(interior, "bla_carriage_int_floor")
        ActivateInteriorEntitySet(interior, "bla_carriage_int_floor_glue")
        ActivateInteriorEntitySet(interior, "bla_carriage_int_frames")
        ActivateInteriorEntitySet(interior, "bla_carriage_int_shell")
        ActivateInteriorEntitySet(interior, "bla_carriage_int_stable")
        ActivateInteriorEntitySet(interior, "bla_carriage_shadowproxy") 
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
    DeactivateInteriorEntitySet(interior, "bla_carriagehouse_int")        
    DeactivateInteriorEntitySet(interior, "bla_carriagehouse_int_ref")
    DeactivateInteriorEntitySet(interior, "bla_carriagehouse_lightbox ")
    DeactivateInteriorEntitySet(interior, "bla_carriage_int_decals02")
    DeactivateInteriorEntitySet(interior, "bla_carriage_int_details01")
    DeactivateInteriorEntitySet(interior, "bla_carriage_int_details02")
    DeactivateInteriorEntitySet(interior, "bla_carriage_int_floor")
    DeactivateInteriorEntitySet(interior, "bla_carriage_int_floor_glue")
    DeactivateInteriorEntitySet(interior, "bla_carriage_int_frames")
    DeactivateInteriorEntitySet(interior, "bla_carriage_int_shell")
    DeactivateInteriorEntitySet(interior, "bla_carriage_int_stable")
    DeactivateInteriorEntitySet(interior, "bla_carriage_shadowproxy")     
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

 