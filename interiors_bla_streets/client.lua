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
    RequestImap(1858796535)    -- West Elizabeth -- Blackwater -- Fast Travel
    --RequestImap(1490756544)    -- West Elizabeth -- Blackwater -- Crates & Barrels on Streets
    --RequestImap(-677362237)    -- West Elizabeth -- Blackwater -- Wreckage near bards crossing
 
    for key, table in pairs(sets) do
        if sets[key]["type"] == "ymap" then 
            if sets[key]["engage"] == true then 
                hash_key = GetHashKey(sets[key]["name"])
                RequestImap(hash_key)  
                print("I: ",sets[key]["name"], hash_key, sets[key]["type"], sets[key]["desc"])
                Citizen.Wait(200)
            end 
        end 
    end  

end

function EnableResouresINTERIORS(x, y, z)     
    --[[  
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    --]]
    local interior = GetInteriorAtCoords(x, y, z) 
    for key, table in pairs(sets) do
        if sets[key]["type"] == "ydr" then 
            if sets[key]["engage"] == true then 
                ActivateInteriorEntitySet(interior, sets[key]["name"] )  
                print("A: ",sets[key]["name"], sets[key]["type"], sets[key]["desc"])
                Citizen.Wait(200)
            end 
        end 
    end       
    local interior = GetInteriorAtCoords(x, y, z) 
    for key, table in pairs(sets) do
        if sets[key]["type"] == "ytd" then 
            if sets[key]["engage"] == true then 
                ActivateInteriorEntitySet(interior, sets[key]["name"] )  
                print("A: ",sets[key]["name"], sets[key]["type"], sets[key]["desc"])
                Citizen.Wait(200)
            end 
        end 
    end  
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesYMAPS() 
    --[[
    RemoveImap(_________________) -- Something relating to BizTemplate  
    --]]      
    RemoveImap(1858796535)    -- West Elizabeth -- Blackwater -- Fast Travel
    RemoveImap(1490756544)    -- West Elizabeth -- Blackwater -- Crates & Barrels on Streets
    RemoveImap(-677362237)    -- West Elizabeth -- Blackwater -- Wreckage near bards crossing
    
    for key, table in pairs(sets) do
        if sets[key]["type"] == "ymap" then  
            hash_key = GetHashKey(sets[key]["name"])
            RemoveImap(hash_key)  
            print("R: ",sets[key]["name"], hash_key, sets[key]["type"], sets[key]["desc"]) 
            Citizen.Wait(200)
        end 
    end  
end

function DisableResourcesINTERIORS(x, y, z)  
    --[[
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "_________________")     
    DeactivateInteriorEntitySet(interior, "_________________")  
    --]]         
    local interior = GetInteriorAtCoords(x, y, z) 
    for key, table in pairs(sets) do
        if sets[key]["type"] == "ydr" then   
            DeactivateInteriorEntitySet(interior, sets[key]["name"] )  
            print("D: ",sets[key]["name"], sets[key]["type"], sets[key]["desc"]) 
            Citizen.Wait(200)
        end 
    end      
    local interior = GetInteriorAtCoords(x, y, z) 
    for key, table in pairs(sets) do
        if sets[key]["type"] == "ytd" then   
            DeactivateInteriorEntitySet(interior, sets[key]["name"] )  
            print("D: ",sets[key]["name"], sets[key]["type"], sets[key]["desc"]) 
            Citizen.Wait(200)
        end 
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
        --DisableResourcesYMAPS() 
        --DisableResourcesINTERIORS(Config.x, Config.y, Config.z)

        -- basically run once after character has loadded in  
        EnableResouresYMAPS() 
        EnableResouresINTERIORS(Config.x, Config.y, Config.z)
        interiorsActive = true
        unlockDoors()  
    end
end)

 