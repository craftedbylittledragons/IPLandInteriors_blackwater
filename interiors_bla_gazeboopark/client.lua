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

    bla_blk02_park_cloth.yft
    bla_blk02_park_cloth+hifr.ytd
    bla_blk02_parklights.ydr
    bla_blk02_parklights+hidr.ytd   

    bla_blk04_gazebo01_dec.ydr
    bla_blk04_gazebo01_dec+hidr.ytd
    bla_blk04_gazebo01.ydr
    bla_blk04_gazebo01+hidr.ytd

    --]]    
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_blk02_park_cloth")   
    ActivateInteriorEntitySet(interior, "bla_blk02_park_cloth+hifr")  
    ActivateInteriorEntitySet(interior, "bla_blk02_parklights")  
    ActivateInteriorEntitySet(interior, "bla_blk02_parklights+hifr")  
    ActivateInteriorEntitySet(interior, "bla_blk04_gazebo01_dec")  
    ActivateInteriorEntitySet(interior, "bla_blk04_gazebo01_dec+hifr")  
    ActivateInteriorEntitySet(interior, "bla_blk04_gazebo01")  
    ActivateInteriorEntitySet(interior, "bla_blk04_gazebo01+hifr")   
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
    DeactivateInteriorEntitySet(interior, "bla_blk02_park_cloth")   
    DeactivateInteriorEntitySet(interior, "bla_blk02_park_cloth+hifr")  
    DeactivateInteriorEntitySet(interior, "bla_blk02_parklights")  
    DeactivateInteriorEntitySet(interior, "bla_blk02_parklights+hifr")  
    DeactivateInteriorEntitySet(interior, "bla_blk04_gazebo01_dec")  
    DeactivateInteriorEntitySet(interior, "bla_blk04_gazebo01_dec+hifr")  
    DeactivateInteriorEntitySet(interior, "bla_blk04_gazebo01")  
    DeactivateInteriorEntitySet(interior, "bla_blk04_gazebo01+hifr")  
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

 