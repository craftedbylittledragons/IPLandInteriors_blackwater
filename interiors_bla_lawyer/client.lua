---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresIMAP()            
    --[[ 
    if Config.Unknow == true then
        RequestImap(_________________) -- Something relating to BizTemplate
    end     
    --]] 
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end    
    bla_lawofficecloth01.yft
    bla_lawofficecloth02.yft
    bla_lawyer_decal.ydr
    bla_lawyer_decal+hidr.ytd
    bla_lawyer_ext_em.ydr
    bla_lawyer_ext_stepup.ydr
    bla_lawyer_ext.ydr
    bla_lawyer_ext+hidr.ytd
    bla_lawyer_int.ydr
    bla_lawyer_int+hidr.ytd 
    --]] 

    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_lawyer_int")   
    ActivateInteriorEntitySet(interior, "bla_lawyer_int+hidr")  
    ActivateInteriorEntitySet(interior, "bla_lawyer_ext")   
    ActivateInteriorEntitySet(interior, "bla_lawyer_ext+hidr")   
    ActivateInteriorEntitySet(interior, "bla_lawyer_ext_em")    
    ActivateInteriorEntitySet(interior, "bla_lawyer_ext_stepup")   
    ActivateInteriorEntitySet(interior, "bla_lawyer_decal")   
    ActivateInteriorEntitySet(interior, "bla_lawyer_decal+hidr")  
    ActivateInteriorEntitySet(interior, "bla_lawofficecloth01")   
    ActivateInteriorEntitySet(interior, "bla_lawofficecloth02")      
end
 

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

    local interior = GetInteriorAtCoords(x, y, z) 
    DeactivateInteriorEntitySet(interior, "bla_lawyer_int")   
    DeactivateInteriorEntitySet(interior, "bla_lawyer_int+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_lawyer_ext")   
    DeactivateInteriorEntitySet(interior, "bla_lawyer_ext+hidr")   
    DeactivateInteriorEntitySet(interior, "bla_lawyer_ext_em")    
    DeactivateInteriorEntitySet(interior, "bla_lawyer_ext_stepup")   
    DeactivateInteriorEntitySet(interior, "bla_lawyer_decal")   
    DeactivateInteriorEntitySet(interior, "bla_lawyer_decal+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_lawofficecloth01")   
    DeactivateInteriorEntitySet(interior, "bla_lawofficecloth02")         
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

 