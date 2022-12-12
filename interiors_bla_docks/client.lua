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
    if Config.CarriageHouse == true then  
        ActivateInteriorEntitySet(interior, "bla_carriagehouse_int_ref") 
    end   
        bla_dock_ferry01x.ydr
        bla_dock_ferry01x+hidr.ytd

        bla_dock_ferry01x01_glue.ydr
        bla_dock_ferry01x01_glue+hidr.ytd
        bla_dock_ferry01x01_glue2.ydr

        bla_dock_pier.ydr
        bla_dock_pier+hidr.ytd
        bla_dock_platform.ydr
        bla_dock_platform+hidr.ytd

        bla_dock_props_debris_00.ydr
        bla_dock_props_debris_01.ydr
        bla_dock_props_debris_01+hidr.ytd
        bla_dock_props_debris_txd.ytd
        bla_dock_props_debris_txd+hi.ytd
        bla_dock_supportsb_decals.ydr
        bla_dock01.ydr
        bla_dock01+hidr.ytd
        bla_docks.ytd
        bla_docks+hi.ytd
        bla_bza_dock_ferry02_glue_.ydr
        bla_bza_dock_ferry02_glue_+hidr.ytd
    --]]            
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_docks")  
    ActivateInteriorEntitySet(interior, "bla_docks+hi")  

    ActivateInteriorEntitySet(interior, "bla_dock01")  
    ActivateInteriorEntitySet(interior, "bla_dock01+hidr")  

    if Config.Debris == true then  
        ActivateInteriorEntitySet(interior, "bla_dock_props_debris_00")  
        ActivateInteriorEntitySet(interior, "bla_dock_props_debris_01")  
        ActivateInteriorEntitySet(interior, "bla_dock_props_debris_01+hidr")  
        ActivateInteriorEntitySet(interior, "bla_dock_props_debris_txd")  
        ActivateInteriorEntitySet(interior, "bla_dock_props_debris_txd+hidr") 
    end  

    ActivateInteriorEntitySet(interior, "bla_dock_supportsb_decals")  
    
    ActivateInteriorEntitySet(interior, "bla_dock_platform")  
    ActivateInteriorEntitySet(interior, "bla_dock_platform+hidr") 
    
    ActivateInteriorEntitySet(interior, "bla_dock_pier")  
    ActivateInteriorEntitySet(interior, "bla_dock_pier+hidr") 
    
    ActivateInteriorEntitySet(interior, "bla_dock_ferry01x")  
    ActivateInteriorEntitySet(interior, "bla_dock_ferry01x+hidr") 

    ActivateInteriorEntitySet(interior, "bla_dock_ferry01x01_glue") 
    ActivateInteriorEntitySet(interior, "bla_dock_ferry01x01_glue+hidr") 
    ActivateInteriorEntitySet(interior, "bla_dock_ferry01x01_glue2")   
    ActivateInteriorEntitySet(interior, "bla_bza_dock_ferry02_glue_") 
    ActivateInteriorEntitySet(interior, "bla_bza_dock_ferry02_glue_+hidr")     
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
    DeactivateInteriorEntitySet(interior, "bla_docks")  
    DeactivateInteriorEntitySet(interior, "bla_docks+hi")  

    DeactivateInteriorEntitySet(interior, "bla_dock01")  
    DeactivateInteriorEntitySet(interior, "bla_dock01+hidr")  

    DeactivateInteriorEntitySet(interior, "bla_dock_props_debris_00")  
    DeactivateInteriorEntitySet(interior, "bla_dock_props_debris_01")  
    DeactivateInteriorEntitySet(interior, "bla_dock_props_debris_01+hidr")  

    DeactivateInteriorEntitySet(interior, "bla_dock_props_debris_txd")  
    DeactivateInteriorEntitySet(interior, "bla_dock_props_debris_txd+hidr")  

    DeactivateInteriorEntitySet(interior, "bla_dock_supportsb_decals")  
    
    DeactivateInteriorEntitySet(interior, "bla_dock_platform")  
    DeactivateInteriorEntitySet(interior, "bla_dock_platform+hidr") 
    
    DeactivateInteriorEntitySet(interior, "bla_dock_pier")  
    DeactivateInteriorEntitySet(interior, "bla_dock_pier+hidr") 
    
    DeactivateInteriorEntitySet(interior, "bla_dock_ferry01x")  
    DeactivateInteriorEntitySet(interior, "bla_dock_ferry01x+hidr") 

    DeactivateInteriorEntitySet(interior, "bla_dock_ferry01x01_glue") 
    DeactivateInteriorEntitySet(interior, "bla_dock_ferry01x01_glue+hidr") 
    DeactivateInteriorEntitySet(interior, "bla_dock_ferry01x01_glue2")       
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

 