---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresIMAP()            
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
    bla_south_res_01_03_em_slod.ydr
    bla_south_res_01_decal.ydr
    bla_south_res_01_detail_lod.ydr
    bla_south_res_01_detail.ydr
    bla_south_res_01_em.ydr
    bla_south_res_01.ydr
    bla_south_res_01+hidr.ytd
    --]] 
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_south_res_01")
    ActivateInteriorEntitySet(interior, "bla_south_res_01_em")  
    ActivateInteriorEntitySet(interior, "bla_south_res_01_03_em_slod")  
    ActivateInteriorEntitySet(interior, "bla_south_res_01_decal")
    ActivateInteriorEntitySet(interior, "bla_south_res_01_detail")
    ActivateInteriorEntitySet(interior, "bla_south_res_01_detail_lod")  
    ActivateInteriorEntitySet(interior, "bla_south_res_01+hidr")   

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
    DeactivateInteriorEntitySet(interior, "bla_south_res_01")
    DeactivateInteriorEntitySet(interior, "bla_south_res_01_em")  
    DeactivateInteriorEntitySet(interior, "bla_south_res_01_03_em_slod")  
    DeactivateInteriorEntitySet(interior, "bla_south_res_01_decal")
    DeactivateInteriorEntitySet(interior, "bla_south_res_01_detail")
    DeactivateInteriorEntitySet(interior, "bla_south_res_01_detail_lod")  
    DeactivateInteriorEntitySet(interior, "bla_south_res_01+hidr")      
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

 