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
	[72962] = {x=-814.74194335938,y=-1276.5770263672,z=43.864669799805,typeHashId=679970449,typeHashName="bla_bank_int",rpf="bla_bank_int.rpf"},              
    --]]    
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_bank_int")       
    if Config.Bank == true then    
        ActivateInteriorEntitySet(interior, "bla_bank_int_02x")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_decals")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_decals1")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_decals2")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_mcp_shell")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_office_details")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_shadowproxy")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_shell_txd")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_txd")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_vault")  
        ActivateInteriorEntitySet(interior, "bla_bank_lightbox")  
        ActivateInteriorEntitySet(interior, "bla_bank_lightbox00")                 
    end   
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
    DeactivateInteriorEntitySet(interior, "bla_bank_int_02x")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_decals")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_decals1")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_decals2")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_mcp_shell")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_office_details")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_shadowproxy")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_shell_txd")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_txd")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_vault")  
    DeactivateInteriorEntitySet(interior, "bla_bank_lightbox")  
    DeactivateInteriorEntitySet(interior, "bla_bank_lightbox00")     
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

 