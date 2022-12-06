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

--## Blackwater ##--
RequestImap(-2082201137)  -- West Elizabeth -- Blackwater -- Town Hall -- Ground
RequestImap(1343343014)   -- West Elizabeth -- Blackwater -- Town Hall -- Addons Construction
RequestImap(739412171)    -- West Elizabeth -- Blackwater -- Town Hall -- Two Boards in front of city hall (Goes with Town Hall Construction)
RequestImap(-5339556)     -- West Elizabeth -- Blackwater -- Town Hall -- Bank Under Construction
RequestImap(1173561253) -- West Elizabeth -- Blackwater -- Town Hall -- Tents Beside City Hall Near Trech
RequestImap(1470738186) -- West Elizabeth -- Blackwater -- Town Hall -- Adds Town Hall Pre-Construcion Ground (Ground does not mesh well with contrustion IPLs)
RequestImap(-1632348233)-- West Elizabeth -- Blackwater -- Town Hall -- Adds Trees and Grass (DO NOT USE WITH CONSTRUCTION IPL, WILL MERGE VISUALS)
RemoveImap(1173561253)    -- West Elizabeth -- Blackwater -- Town Hall -- Tents Beside City Hall Near Trech
RemoveImap(1470738186)    -- West Elizabeth -- Blackwater -- Town Hall -- Adds Pre-Construcion Ground (Ground does not mesh well with contrustion IPLs)
RemoveImap(-1632348233)   -- West Elizabeth -- Blackwater -- Town Hall -- Adds Trees and Grass (DO NOT USE WITH CONSTRUCTION IPL, WILL MERGE VISUALS)

------------------------------------- Blackwater Town Hall
RequestImap(-2082201137)  --Blackwater Ground Town Hall
RequestImap(1343343014)  --Blackwater Town Hall Addons Construction
RequestImap(739412171)  -- Two Boards in front of city hall (Goes with Town Hall Construction)
RequestImap(-5339556)  --Bank Under Construction
RequestImap(1641449717)
RequestImap(1258244391) -- something
RequestImap(-501793326) -- construction
RequestImap(1490756544) -- crates on main st
RequestImap(-753454183) -- trapper
RequestImap(-1854368742) -- trapper
RequestImap(466168676)
RequestImap(411846009)
RequestImap(-393583941)
RequestImap(-636161219)
-- RequestImap(-2122914678) -- grave
-- RequestImap(917434281) -- grave
RequestImap(-518004776) -- grave
-- RequestImap(1173561253) -- Tents Beside City Hall Near Trech
-- RequestImap(1470738186) -- Adds Pre-Construcion Ground (Ground does not mesh well with contrustion IPLs)
-- RequestImap(-1632348233) -- Adds Trees and Grass (DO NOT USE WITH CONSTRUCTION IPL, WILL MERGE VISUALS)
RequestImap(-562289114) -- something in cemetary
------------------------------------- #### END OF BLACKWATER TOWN HALL ####

    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    --]]
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

 