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
    RequestImap(GetHashKey("bla_feedstore_ext")) -- Exterior
    RequestImap(GetHashKey("bla_feedstore_ext_em")) -- Exterior Embeds
    RequestImap(GetHashKey("bla_feedstore_det")) -- Detail
    RequestImap(GetHashKey("bla_feedstore_decal")) -- Decal
    
end 

function EnableResouresINTERIORS(x, y, z)     
    --[[ 
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    bla_feedstore_decal.ydr
    bla_feedstore_decal+hidr.ytd
    bla_feedstore_det.ydr
    bla_feedstore_ext_em.ydr
    bla_feedstore_ext.ydr
    bla_feedstore_ext+hidr.ytd
    --]]
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_feedstore_ext_em")     -- Exterior Embeds    
    ActivateInteriorEntitySet(interior, "bla_feedstore_ext") -- Exterior
    ActivateInteriorEntitySet(interior, "bla_feedstore_ext+hidr") -- Exterior High Def
    ActivateInteriorEntitySet(interior, "bla_feedstore_det") -- Detail
    ActivateInteriorEntitySet(interior, "bla_feedstore_decal")     -- Decal
    ActivateInteriorEntitySet(interior, "bla_feedstore_decal+hidr")    -- Decal  High Def
   
end



----------- turn off the bar ------
function DisableResourcesYMAPS() 
    --[[
    RemoveImap(6666_________________17953) -- Something relating to BizTemplate  
    --]]  
    RemoveImap(GetHashKey("bla_feedstore_ext")) -- Something relating to BizTemplate
    RemoveImap(GetHashKey("bla_feedstore_ext_em")) -- Something relating to BizTemplate
    RemoveImap(GetHashKey("bla_feedstore_det")) -- Something relating to BizTemplate
    RemoveImap(GetHashKey("bla_feedstore_decal")) -- Something relating to BizTemplate 
end

function DisableResourcesINTERIORS(x, y, z)  
    --[[
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "_________________")     
    DeactivateInteriorEntitySet(interior, "_________________")  
    --]]      
    local interior = GetInteriorAtCoords(x, y, z) 
    DeactivateInteriorEntitySet(interior, "bla_feedstore_ext_em")    
    DeactivateInteriorEntitySet(interior, "bla_feedstore_ext")    
    DeactivateInteriorEntitySet(interior, "bla_feedstore_ext+hidr")   
    DeactivateInteriorEntitySet(interior, "bla_feedstore_det")    
    DeactivateInteriorEntitySet(interior, "bla_feedstore_decal")    
    DeactivateInteriorEntitySet(interior, "bla_feedstore_decal+hidr")     
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
 