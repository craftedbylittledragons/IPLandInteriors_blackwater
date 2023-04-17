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
    if Config.Graves == true then
        RequestImap(-2122914678) -- grave
        RequestImap(917434281) -- grave
        RequestImap(-518004776) -- grave
        RequestImap(-562289114) -- something in cemetary
    end 
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end 
    bla_west_res_church_em.ydr
    bla_west_res_church.ydr
    bla_west_res_church+hidr.ytd

    bla_west_re_burial_cap_lod.ydr
    bla_west_re_burial_cap.ydr
    bla_west_re_burial_cap+hidr.ytd

    bla_west_re_burial_hole_d.ydr
    bla_west_re_burial_hole_lod.ydr
    bla_west_re_burial_hole.ydr
    bla_west_re_burial_hole+hidr.ytd
    bla_west_res_townburial_hole.ytd
    --]] 
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_west_res_church")   
    ActivateInteriorEntitySet(interior, "bla_west_res_church_em")   
    ActivateInteriorEntitySet(interior, "bla_west_res_church+hidr") 
    
    ActivateInteriorEntitySet(interior, "bla_west_re_burial_cap_lod")       
    ActivateInteriorEntitySet(interior, "bla_west_re_burial_cap")   
    ActivateInteriorEntitySet(interior, "bla_west_re_burial_cap+hidr")      
    ActivateInteriorEntitySet(interior, "bla_west_re_burial_hole_d")       
    ActivateInteriorEntitySet(interior, "bla_west_re_burial_hole_lod")  
    ActivateInteriorEntitySet(interior, "bla_west_re_burial_hole")   
    ActivateInteriorEntitySet(interior, "bla_west_re_burial_hole+hidr")    
    ActivateInteriorEntitySet(interior, "bla_west_res_townburial_hole")   
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesYMAPS() 
    --[[
    RemoveImap(6666_________________17953) -- Something relating to BizTemplate  
    --]]  
    RemoveImap(-2122914678) -- grave
    RemoveImap(917434281) -- grave
    RemoveImap(-518004776) -- grave 
    RequestImap(-562289114) -- something in cemetary
end

function DisableResourcesINTERIORS(x, y, z)  
    --[[
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "_________________")     
    DeactivateInteriorEntitySet(interior, "_________________")  
    --]]   
    local interior = GetInteriorAtCoords(x, y, z) 
    DeactivateInteriorEntitySet(interior, "bla_west_res_church")   
    DeactivateInteriorEntitySet(interior, "bla_west_res_church_em")   
    DeactivateInteriorEntitySet(interior, "bla_west_res_church+hidr")  
    
    DeactivateInteriorEntitySet(interior, "bla_west_re_burial_cap_lod")       
    DeactivateInteriorEntitySet(interior, "bla_west_re_burial_cap")   
    DeactivateInteriorEntitySet(interior, "bla_west_re_burial_cap+hidr")      
    DeactivateInteriorEntitySet(interior, "bla_west_re_burial_hole_d")       
    DeactivateInteriorEntitySet(interior, "bla_west_re_burial_hole_lod")  
    DeactivateInteriorEntitySet(interior, "bla_west_re_burial_hole")   
    DeactivateInteriorEntitySet(interior, "bla_west_re_burial_hole+hidr")    
    DeactivateInteriorEntitySet(interior, "bla_west_res_townburial_hole")     
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

 