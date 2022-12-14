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
    x=-814.03784179688
    y=-1374.2679443359
    z=42.323146820068       
    --[[
	[12546] = {x=-814.03784179688,y=-1374.2679443359,z=42.323146820068,typeHashId=-658231316,typeHashName="bla_photo_int",rpf="bla_photo_int.rpf"},        
    
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end    
    _manifest.ymf
    _cache.ych
    q_reflector01.ydr
    hi@bla_photo_int.ybn
    bla_photo_lightboxportrait.ydr
    bla_photo_lightbox01.ydr
    bla_photo_int_shell.ydr
    bla_photo_int_shell+hidr.ytd
    bla_photo_int_shadowproxy.ydr
    bla_photo_int_ref.ydr
    bla_photo_int_ref+hidr.ytd
    bla_photo_int_props01.ydr
    bla_photo_int_props01+hidr.ytd
    bla_photo_int_gears.ydr
    bla_photo_int_gears+hidr.ytd
    bla_photo_int_decal01.ydr
    bla_photo_int_decal01+hidr.ytd
    bla_photo_int.ytyp
    bla_photo_int.ytd
    bla_photo_int.ybn
    bla_photo_int+hi.ytd
    --]]
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_photo_int")  
    ActivateInteriorEntitySet(interior, "bla_photo_int+hi.")  
    ActivateInteriorEntitySet(interior, "bla_photo_int_decal01+hidr")  
    ActivateInteriorEntitySet(interior, "bla_photo_int_decal01")  
    ActivateInteriorEntitySet(interior, "bla_photo_int_gears+hidr")  
    ActivateInteriorEntitySet(interior, "bla_photo_int_gears")  
    ActivateInteriorEntitySet(interior, "bla_photo_int_props01+hidr")  
    ActivateInteriorEntitySet(interior, "bla_photo_int_props01")  
    ActivateInteriorEntitySet(interior, "bla_photo_int_shadowproxy")      
    ActivateInteriorEntitySet(interior, "bla_photo_int_ref+hidr")  
    ActivateInteriorEntitySet(interior, "bla_photo_int_ref")  
    ActivateInteriorEntitySet(interior, "bla_photo_int_shell+hidr")  
    ActivateInteriorEntitySet(interior, "bla_photo_int_shell")      
    ActivateInteriorEntitySet(interior, "bla_photo_lightbox01")  
    ActivateInteriorEntitySet(interior, "bla_photo_lightboxportrait")  
    ActivateInteriorEntitySet(interior, "hi@bla_photo_in")  
    ActivateInteriorEntitySet(interior, "q_reflector01") 
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesIMAPS() 
    --[[
    RemoveImap(_________________) -- Something relating to BizTemplate  
    --]]  
end

function DisableResourcesINTERIORS(x, y, z)  
    --[[
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "_________________")     
    DeactivateInteriorEntitySet(interior, "_________________")  
    --]]       
    local interior = GetInteriorAtCoords(x, y, z) 
    DeactivateInteriorEntitySet(interior, "bla_photo_int")   
    DeactivateInteriorEntitySet(interior, "bla_photo_int+hi.")  
    DeactivateInteriorEntitySet(interior, "bla_photo_int_decal01+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_photo_int_decal01")  
    DeactivateInteriorEntitySet(interior, "bla_photo_int_gears+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_photo_int_gears")  
    DeactivateInteriorEntitySet(interior, "bla_photo_int_props01+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_photo_int_props01")  
    DeactivateInteriorEntitySet(interior, "bla_photo_int_shadowproxy")      
    DeactivateInteriorEntitySet(interior, "bla_photo_int_ref+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_photo_int_ref")  
    DeactivateInteriorEntitySet(interior, "bla_photo_int_shell+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_photo_int_shell")      
    DeactivateInteriorEntitySet(interior, "bla_photo_lightbox01")  
    DeactivateInteriorEntitySet(interior, "bla_photo_lightboxportrait")  
    DeactivateInteriorEntitySet(interior, "hi@bla_photo_in")  
    DeactivateInteriorEntitySet(interior, "q_reflector01")     
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

 