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
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
[68354] = {x=-870.76177978516,y=-1288.9918212891,z=41.398983001709,typeHashId=619853493,typeHashName="bla_fenceshop_int",rpf="bla_fenceshop_int.rpf"},        
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   

    --- not sure what to do with these yet
bla_vfx_rain_west_res_church.ydr
bla_vfx_rain_barn.ydr
bla_vfx_rain_bla_feedstore_ext.ydr
bla_vfx_rain_blacksmith.ydr
bla_vfx_rain_blk01_stable_01.ydr
bla_vfx_rain_butcher.ydr
bla_vfx_rain_cafe_ext.ydr
bla_vfx_rain_cityhall01x.ydr
bla_vfx_rain_dock_ferry01x.ydr
bla_vfx_rain_freightstation.ydr
bla_vfx_rain_general_hardware.ydr
bla_vfx_rain_generalstore01x.ydr
bla_vfx_rain_hotel.ydr
bla_vfx_rain_inn.ydr
bla_vfx_rain_lumber_office.ydr
bla_vfx_rain_new_saloon_ext.ydr
bla_vfx_rain_new_theaterext.ydr
bla_vfx_rain_ranch.ydr
bla_vfx_rain_restaurant01.ydr
bla_vfx_rain_shoestore.ydr
bla_vfx_rain_slum01.ydr
bla_vfx_rain_slumhouse_01.ydr
bla_vfx_rain_slumhouse_03.ydr
bla_vfx_rain_slumhouse_04.ydr
bla_vfx_rain_slumwest_02.ydr
bla_vfx_rain_south_res_02.ydr
bla_vfx_rain_south_res_02barn.ydr
bla_vfx_rain_south_res_03.ydr
bla_vfx_rain_south_res_04.ydr
bla_vfx_rain_south_res.ydr
bla_vfx_rain_theater_ext.ydr
bla_vfx_rain_west_res_01.ydr
bla_vfx_rain_west_res_02.ydr
     
    --]]     
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

 