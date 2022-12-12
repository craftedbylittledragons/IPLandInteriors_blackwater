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
        [61698] = {x=-816.00012207031,y=-1366.9996337891,z=44.0,typeHashId=1624121669,typeHashName="bla_barber_int",rpf="bla_barber_int.rpf"},   
    bla_barber_photo_dec.ydr
    bla_barber_photo_dec+hidr.ytd
    bla_barber_photo_em.ydr
    bla_barber_photo.ydr
    bla_barber_photo+hidr.ytd        
    --]]
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_barber_int")       
    if Config.Unknown == true then    
        ActivateInteriorEntitySet(interior, "bla_barber_int_cutn01") 
        ActivateInteriorEntitySet(interior, "bla_barber_int_mirror01") 
        ActivateInteriorEntitySet(interior, "bla_barber_int_picshall") 
        ActivateInteriorEntitySet(interior, "bla_barber_int_ref_a") 
        ActivateInteriorEntitySet(interior, "bla_barber_int_shadowproxy") 
        ActivateInteriorEntitySet(interior, "bla_barber_int_shell") 
        ActivateInteriorEntitySet(interior, "bla_barber_int_shell_curt") 
        ActivateInteriorEntitySet(interior, "bla_barber_int_shell_txd") 
        ActivateInteriorEntitySet(interior, "bla_barber_int_txd") 
        ActivateInteriorEntitySet(interior, "bla_bar_int_decals") 
        ActivateInteriorEntitySet(interior, "bla_bar_int_halldc") 

        ActivateInteriorEntitySet(interior, "bla_barber_photo_dec")  
        ActivateInteriorEntitySet(interior, "bla_barber_photo_dec+hidr")  
        ActivateInteriorEntitySet(interior, "bla_barber_photo_em")  
        ActivateInteriorEntitySet(interior, "bla_barber_photo")  
        ActivateInteriorEntitySet(interior, "bla_barber_photo+hidr")      
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

 