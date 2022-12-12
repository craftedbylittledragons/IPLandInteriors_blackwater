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
[26370] = {x=-778.00006103516,y=-1362.0,z=44.000003814697,typeHashId=-1330027216,typeHashName="bla_theater_int",rpf="bla_theater_int.rpf"},
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    
    bla_new_theater_booth.ydr
    bla_new_theater_booth+hidr.ytd
    bla_new_theater_ext_em.ydr
    bla_new_theater_roofstps.ydr
    bla_new_theater_roofstps+hidr.ytd
    bla_new_theaterext_dec_dec.ydr
    bla_new_theaterext_dec_dec+hidr.ytd
    bla_new_theaterext.ydr
    bla_new_theaterext+hidr.ytd
    --]]
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_new_theaterext")   
    ActivateInteriorEntitySet(interior, "bla_new_theaterext+hidr")  
    ActivateInteriorEntitySet(interior, "bla_new_theaterext_dec_dec")   
    ActivateInteriorEntitySet(interior, "bla_new_theaterext_dec_dec+hidr")    
    ActivateInteriorEntitySet(interior, "bla_new_theater_roofstps")   
    ActivateInteriorEntitySet(interior, "bla_new_theater_roofstps+hidr")  
    ActivateInteriorEntitySet(interior, "bla_new_theater_booth")   
    ActivateInteriorEntitySet(interior, "bla_new_theater_booth+hidr")  
    ActivateInteriorEntitySet(interior, "bla_new_theater_ext_em")     
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
    DeactivateInteriorEntitySet(interior, "bla_new_theaterext")   
    DeactivateInteriorEntitySet(interior, "bla_new_theaterext+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_new_theaterext_dec_dec")   
    DeactivateInteriorEntitySet(interior, "bla_new_theaterext_dec_dec+hidr")    
    DeactivateInteriorEntitySet(interior, "bla_new_theater_roofstps")   
    DeactivateInteriorEntitySet(interior, "bla_new_theater_roofstps+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_new_theater_booth")   
    DeactivateInteriorEntitySet(interior, "bla_new_theater_booth+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_new_theater_ext_em")     
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

 