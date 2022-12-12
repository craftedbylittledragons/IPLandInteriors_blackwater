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
[26370] = {x=-778.00006103516,y=-1362.0,z=44.000003814697,typeHashId=-1330027216,typeHashName="bla_theater_int",rpf="bla_theater_int.rpf"},
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    
    bla_theater_bulbs_holder.ydr
    bla_theater_decal.ydr
    bla_theater_ext_em.ydr
    bla_theater_ext.ydr
    bla_theater_ext+hidr.ytd
    bla_theatre_signs.ydr
    --]]
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_theater_int")   
    ActivateInteriorEntitySet(interior, "bla_theater_bulbs_holder")   
    ActivateInteriorEntitySet(interior, "bla_theater_decal")   
    ActivateInteriorEntitySet(interior, "bla_theater_ext_em")   
    ActivateInteriorEntitySet(interior, "bla_theater_ext")   
    ActivateInteriorEntitySet(interior, "bla_theater_ext+hidr")   
    ActivateInteriorEntitySet(interior, "bla_theatre_signs")   
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
    local interior = GetInteriorAtCoords(x, y, z)  
    DeactivateInteriorEntitySet(interior, "bla_theater_int")   
    DeactivateInteriorEntitySet(interior, "bla_theater_bulbs_holder")   
    DeactivateInteriorEntitySet(interior, "bla_theater_decal")   
    DeactivateInteriorEntitySet(interior, "bla_theater_ext_em")   
    DeactivateInteriorEntitySet(interior, "bla_theater_ext")   
    DeactivateInteriorEntitySet(interior, "bla_theater_ext+hidr")   
    DeactivateInteriorEntitySet(interior, "bla_theatre_signs")   
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

 