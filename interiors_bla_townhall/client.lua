---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS()            
    --[[ 
    if Config.Unknow == true then
        RequestImap(_________________) -- Something relating to BizTemplate
    end     
    --]] --## Blackwater ##--
    if Config.Construction == true then 
        -- Town Hall
        if Config.extras == true then 
            RequestImap(1343343014)   -- West Elizabeth -- Blackwater -- Town Hall -- Addons Construction
            RequestImap(739412171)    -- West Elizabeth -- Blackwater -- Town Hall -- Two Boards in front of city hall (Goes with Town Hall Construction)
            RequestImap(1173561253)   -- West Elizabeth -- Blackwater -- Town Hall -- Tents Beside City Hall Near Trech
            RequestImap(1490756544)     -- crates on main st   
        end 
        -- Ground
        RequestImap(-2082201137)  -- West Elizabeth -- Blackwater -- Town Hall -- Ground     
        RequestImap(-2082201137)  --Blackwater Ground Town Hall   
    else 
        RequestImap(1470738186) -- West Elizabeth -- Blackwater -- Town Hall -- Adds Town Hall Pre-Construcion Ground (Ground does not mesh well with contrustion IPLs)
        RequestImap(-1632348233)-- West Elizabeth -- Blackwater -- Town Hall -- Adds Trees and Grass (DO NOT USE WITH CONSTRUCTION IPL, WILL MERGE VISUALS)
    end 
     
    ------------------------------------- Blackwater Town Hall   
    --RequestImap(1641449717)
    --RequestImap(1258244391) -- something  
    --RequestImap(466168676)
    --RequestImap(411846009)
    --RequestImap(-393583941)
    --RequestImap(-636161219)         
    ------------------------------------- #### END OF BLACKWATER TOWN HALL ####KWATER TOWN HALL ####
    if Config.Gunshop == true then 
        RequestImap(-501793326)     -- gunshop across for forman of construction -- under constructions        
        RequestImap(GetHashKey("new_com_07_interior_new_gunshop_int_milo_")) -- new_com_07_interior_new_gunshop_int_milo_.ymap
    end 
    if Config.Trapper == true then 
        RequestImap(-753454183) -- trapper
        RequestImap(-1854368742) -- trapper
    end 
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
     local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    bla_cityhall_glue.ydr
    bla_cityhall_glue+hidr.ytd
    bla_cityhall_pipes.ydr
    bla_cityhall01x.ydr
    bla_cityhall01x+hidr.ytd
    bla_cityhallbricks.ydr

    bla_civic_endsum_txd.ytd
    bla_civic_endsum_txd+hi.ytd
    bla_civic_fence_glu_01.ydr
    bla_civic_fence_glue02.ydr
    bla_civic_fence.ydr
    bla_civic_fence+hidr.ytd  
    bla_civic_fence2.ydr
    bla_civic_fence2+hidr.ytd
    bla_civic_fman_decal01.ydr
    bla_civic_fman_decal01+hidr.ytd
    bla_civic_fman01.ydr
    bla_civic_fman01+hidr.ytd
    bla_civic_woodplanks_00.ydr
    bla_civic_woodplanks_00+hidr.ytd

    bla_civic_props_debris_00.ydr
    bla_civic_props_debris_01.ydr
    bla_civic_props_debris_02.ydr
    bla_civic_props_debris_03.ydr
    bla_civic_props_debris_txd.ytd
    
    bla_civic.ytd
    --]]
     local interior = GetInteriorAtCoords(x, y, z) 
     if Config.CityHall == true then 
        ActivateInteriorEntitySet(interior, "bla_cityhall_glue")   
        ActivateInteriorEntitySet(interior, "bla_cityhall_glue+hidr")   
        ActivateInteriorEntitySet(interior, "bla_cityhall_pipes")   
        ActivateInteriorEntitySet(interior, "bla_cityhall01x")   
        ActivateInteriorEntitySet(interior, "bla_cityhall01x+hidr")   
        ActivateInteriorEntitySet(interior, "bla_cityhallbricks")  
    end 
      
     if Config.Civic == true then  
        ActivateInteriorEntitySet(interior, "bla_civic_endsum_txd")   
        ActivateInteriorEntitySet(interior, "bla_civic_endsum_txd+hidr") 
        ActivateInteriorEntitySet(interior, "bla_civic")  
    end 
      
     if Config.Fence == true then 
        ActivateInteriorEntitySet(interior, "bla_civic_fence_glu_01")    
        ActivateInteriorEntitySet(interior, "bla_civic_fence_glue02.ydr")    
        ActivateInteriorEntitySet(interior, "bla_civic_fence")    
        ActivateInteriorEntitySet(interior, "bla_civic_fence+hidr") 
        ActivateInteriorEntitySet(interior, "bla_civic_fence2")  
        ActivateInteriorEntitySet(interior, "bla_civic_fence2+hidr") 
     end 

     if Config.Forman == true then     
        ActivateInteriorEntitySet(interior, "bla_civic_fman_decal01")   
        ActivateInteriorEntitySet(interior, "bla_civic_fman_decal01+hidr")  
        ActivateInteriorEntitySet(interior, "bla_civic_fman01")   
        ActivateInteriorEntitySet(interior, "bla_civic_fman01+hidr")      
    end 

    if Config.extras == true then 
        ActivateInteriorEntitySet(interior, "bla_civic_woodplanks_00")   
        ActivateInteriorEntitySet(interior, "bla_civic_woodplanks_00+hidr") 
    end 

     if Config.Debris == true then    
        ActivateInteriorEntitySet(interior, "bla_civic_props_debris_00")    
        ActivateInteriorEntitySet(interior, "bla_civic_props_debris_01")    
        ActivateInteriorEntitySet(interior, "bla_civic_props_debris_02")    
        ActivateInteriorEntitySet(interior, "bla_civic_props_debris_03")   
        ActivateInteriorEntitySet(interior, "bla_civic_props_debris_txd")     
     end  
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesYMAPS() 
    --[[
    RemoveImap(_________________) -- Something relating to BizTemplate  
    --]]  --## Blackwater ##--    
    ------------------------------------- Blackwater Town Hall  
    RemoveImap(-2082201137)  -- West Elizabeth -- Blackwater -- Town Hall -- Ground
    RemoveImap(1343343014)   -- West Elizabeth -- Blackwater -- Town Hall -- Addons Construction
    RemoveImap(739412171)    -- West Elizabeth -- Blackwater -- Town Hall -- Two Boards in front of city hall (Goes with Town Hall Construction)    
    RemoveImap(1173561253) -- West Elizabeth -- Blackwater -- Town Hall -- Tents Beside City Hall Near Trech
    RemoveImap(1470738186) -- West Elizabeth -- Blackwater -- Town Hall -- Adds Town Hall Pre-Construcion Ground (Ground does not mesh well with contrustion IPLs)
    RemoveImap(-1632348233)-- West Elizabeth -- Blackwater -- Town Hall -- Adds Trees and Grass (DO NOT USE WITH CONSTRUCTION IPL, WILL MERGE VISUALS)
    
    ------------------------------------- Blackwater Town Hall   
    RemoveImap(1641449717) 
    RemoveImap(1490756544) -- crates on main st
    RemoveImap(-753454183) -- trapper
    RemoveImap(-1854368742) -- trapper
    RemoveImap(466168676)
    RemoveImap(411846009)
    RemoveImap(-393583941)
    RemoveImap(-636161219) 
    ------------------------------------- #### END OF BLACKWATER TOWN HALL ####
end

function DisableResourcesINTERIORS(x, y, z)  
    --[[
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "_________________")     
    DeactivateInteriorEntitySet(interior, "_________________")  
    --]]   
    local interior = GetInteriorAtCoords(x, y, z)
    DeactivateInteriorEntitySet(interior, "bla_cityhall_glue")   
    DeactivateInteriorEntitySet(interior, "bla_cityhall_glue+hidr")   
    DeactivateInteriorEntitySet(interior, "bla_cityhall_pipes")   
    DeactivateInteriorEntitySet(interior, "bla_cityhall01x")   
    DeactivateInteriorEntitySet(interior, "bla_cityhall01x+hidr")   
    DeactivateInteriorEntitySet(interior, "bla_cityhallbricks")   

    DeactivateInteriorEntitySet(interior, "bla_civic_endsum_txd")   
    DeactivateInteriorEntitySet(interior, "bla_civic_endsum_txd+hidr") 
    DeactivateInteriorEntitySet(interior, "bla_civic_fence_glu_01")    
    DeactivateInteriorEntitySet(interior, "bla_civic_fence_glue02.ydr")    
    DeactivateInteriorEntitySet(interior, "bla_civic_fence")    
    DeactivateInteriorEntitySet(interior, "bla_civic_fence+hidr") 

    DeactivateInteriorEntitySet(interior, "bla_civic_fence2")  
    DeactivateInteriorEntitySet(interior, "bla_civic_fence2+hidr")   
    DeactivateInteriorEntitySet(interior, "bla_civic_fman_decal01")   
    DeactivateInteriorEntitySet(interior, "bla_civic_fman_decal01+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_civic_fman01")   
    DeactivateInteriorEntitySet(interior, "bla_civic_fman01+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_civic_woodplanks_00")   
    DeactivateInteriorEntitySet(interior, "bla_civic_woodplanks_00+hidr")  

    DeactivateInteriorEntitySet(interior, "bla_civic")    
    DeactivateInteriorEntitySet(interior, "bla_civic_props_debris_00")    
    DeactivateInteriorEntitySet(interior, "bla_civic_props_debris_01")    
    DeactivateInteriorEntitySet(interior, "bla_civic_props_debris_02")    
    DeactivateInteriorEntitySet(interior, "bla_civic_props_debris_03")   
    DeactivateInteriorEntitySet(interior, "bla_civic_props_debris_txd")    
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

 