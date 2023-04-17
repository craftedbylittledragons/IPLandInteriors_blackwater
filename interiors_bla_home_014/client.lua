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
    bla_west_res_em_slod.ydr
    bla_west_res_em_slod.ytd
    bla_west_res_em.ytd
    bla_west_res_props.ytd
    bla_west_res_props+hi.ytd 

    bla_west_res_walla_d.ydr
    bla_west_res_walla.ydr
    bla_west_res_wallb.ydr
    bla_west_res_wallb1_d.ydr
    bla_west_res_walle_d.ydr
    bla_west_res_walle.ydr
    bla_west_res_wallf_d.ydr
    bla_west_res_wallf.ydr

    bla_west_res.ytd
    bla_west_res+hi.ytd
    --]] 
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_west_res")   
    ActivateInteriorEntitySet(interior, "bla_west_res+hi")  
    ActivateInteriorEntitySet(interior, "bla_west_res_walla")  
    ActivateInteriorEntitySet(interior, "bla_west_res_wallb")  
    ActivateInteriorEntitySet(interior, "bla_west_res_walla_d")  
    ActivateInteriorEntitySet(interior, "bla_west_res_wallb1_d")  
    ActivateInteriorEntitySet(interior, "bla_west_res_walle_d")  
    ActivateInteriorEntitySet(interior, "bla_west_res_walle")  
    ActivateInteriorEntitySet(interior, "bla_west_res_wallf_d")  
    ActivateInteriorEntitySet(interior, "bla_west_res_wallf")
    ActivateInteriorEntitySet(interior, "bla_west_res_em_slod")  
    ActivateInteriorEntitySet(interior, "bla_west_res_em")  
    ActivateInteriorEntitySet(interior, "bla_west_res_props")  
    ActivateInteriorEntitySet(interior, "bla_west_res_props+hi")   
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
    DeactivateInteriorEntitySet(interior, "bla_west_res")   
    DeactivateInteriorEntitySet(interior, "bla_west_res+hi")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_walla")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_wallb")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_walla_d")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_wallb1_d")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_walle_d")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_walle")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_wallf_d")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_wallf")
    DeactivateInteriorEntitySet(interior, "bla_west_res_em_slod")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_em")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_props")  
    DeactivateInteriorEntitySet(interior, "bla_west_res_props+hi")         
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

 