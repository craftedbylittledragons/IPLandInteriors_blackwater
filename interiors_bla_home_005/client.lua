---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS()            
    --[[ 
	[65794] = {x=-765.55474853516,y=-1293.0404052734,z=42.960033416748,typeHashId=-1357442553,typeHashName="bla_tailor_int",rpf="bla_tailor_int.rpf"},

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
    bla_slumhouse_05_dec.ydr
    bla_slumhouse_05_dec+hidr.ytd
    bla_slumhouse_05_door.ydr
    bla_slumhouse_05_door+hidr.ytd
    bla_slumhouse_05.ydr
    bla_slumhouse_05+hidr.ytd
    --]] 
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_slumhouse_05")
    ActivateInteriorEntitySet(interior, "bla_slumhouse_05+hidr")
    ActivateInteriorEntitySet(interior, "bla_slumhouse_05_dec") 
    ActivateInteriorEntitySet(interior, "bla_slumhouse_05_dec+hidr")   
    ActivateInteriorEntitySet(interior, "bla_slumhouse_05_door") 
    ActivateInteriorEntitySet(interior, "bla_slumhouse_05_door+hidr")  
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
    DeactivateInteriorEntitySet(interior, "bla_slumhouse_05")
    DeactivateInteriorEntitySet(interior, "bla_slumhouse_05+hidr")
    DeactivateInteriorEntitySet(interior, "bla_slumhouse_05_dec") 
    DeactivateInteriorEntitySet(interior, "bla_slumhouse_05_dec+hidr")   
    DeactivateInteriorEntitySet(interior, "bla_slumhouse_05_door") 
    DeactivateInteriorEntitySet(interior, "bla_slumhouse_05_door+hidr")    
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

 