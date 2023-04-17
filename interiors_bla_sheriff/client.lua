---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS()            
    --[[ 
        RequestImap(-1293161516)  -- West Elizabeth -- Blackwater -- Sheriffs Office -- Bounty Board
        
    if Config.Unknow == true then
        RequestImap(_________________) -- Something relating to BizTemplate
    end     
    --]] 
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
	[52226] = {x=-763.02618408203,y=-1269.8580322266,z=44.900039672852,typeHashId=-324128477,typeHashName="bla_jail_int",rpf="bla_jail_int.rpf"},
 
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    --]]
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_sheriff_ext")   
    ActivateInteriorEntitySet(interior, "bla_sheriff_ext+hidr")  
    ActivateInteriorEntitySet(interior, "bla_sheriff_decal_01")    
    ActivateInteriorEntitySet(interior, "bla_jail_int")     
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
    
bla_sheriff_decal_01.ydr
bla_sheriff_ext.ydr
bla_sheriff_ext+hidr.ytd

bla_policeglue_01.ydr
bla_policescafold01x.ydr
bla_policestation01x.ydr
bla_policestation01x+hidr.ytd
    --]]    
    local interior = GetInteriorAtCoords(x, y, z) 
    DeactivateInteriorEntitySet(interior, "bla_sheriff_ext")   
    DeactivateInteriorEntitySet(interior, "bla_sheriff_ext+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_sheriff_decal_01")    
    DeactivateInteriorEntitySet(interior, "bla_jail_int")  

    DeactivateInteriorEntitySet(interior, "bla_policeglue_01") 
    DeactivateInteriorEntitySet(interior, "bla_policescafold01x") 
    DeactivateInteriorEntitySet(interior, "bla_policestation01x")  
    DeactivateInteriorEntitySet(interior, "bla_policestation01x+hidr")  
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

 