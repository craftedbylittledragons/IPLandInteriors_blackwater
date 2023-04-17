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

	[41218] = {x=-818.0,y=-1316.9998779297,z=44.999977111816,typeHashId=1070325776,typeHashName="bla_saloon_int",rpf="bla_saloon_int.rpf"},
    41218 	1070325776 	bla_saloon_int 	bla_saloon_sadie5setdressing        
    
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    --]]
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_saloon_int")        
    ActivateInteriorEntitySet(interior, "bla_saloon_sadie5setdressing")  
    
    _manifest.ymf
    _cache.ych
    hi@bla_saloon_int.ybn
    bla_sal_player_mirrorref.ydr
    bla_sal_int_txd.ytd
    bla_sal_int_txd+hi.ytd
    bla_sal_int_shell_txd.ytd
    bla_sal_int_shell_txd+hi.ytd
    bla_sal_int_playersrm_detail.ydr
    bla_sal_int_playersrm_detail+hidr.ytd
    bla_sal_int_pillar01.ydr
    bla_sal_int_blackjack001.ydr
    bla_sal_int_blackjack001+hidr.ytd
    bla_sal_floor_detail.ydr
    bla_sal_floor_detail+hidr.ytd
    bla_sal_decals_bath.ydr
    bla_sal_decals_bath+hidr.ytd
    bla_sal_decals_2f.ydr
    bla_sal_decals_1f.ydr
    bla_sal_decals_1f+hidr.ytd
    bla_sal_bath_details02.ydr
    bla_sal_bath_details02+hidr.ytd
    bla_saloon_phebooth.ydr
    bla_saloon_phebooth+hidr.ytd
    bla_saloon_main_detail.ydr
    bla_saloon_main_detail+hidr.ytd
    bla_saloon_lightbox003.ydr
    bla_saloon_lightbox002.ydr
    bla_saloon_lightbox001.ydr
    bla_saloon_int_up_room.ydr
    bla_saloon_int_shell.ydr
    bla_saloon_int_shell+hidr.ytd
    bla_saloon_int_shadowproxy.ydr
    bla_saloon_int_ref.ydr
    bla_saloon_int_ref+hidr.ytd
    bla_saloon_int_player001.ydr
    bla_saloon_int_player001+hidr.ytd
    bla_saloon_int_mrr_refln_proxy.ydr
    bla_saloon_int_mrr_refln_proxy+hidr.ytd
    bla_saloon_int_mirror.ydr
    bla_saloon_int_mirror+hidr.ytd
    bla_saloon_int.ytyp
    bla_saloon_int.ybn
    bla_saloon_handrail01.ydr
    bla_saloon_handrail00.ydr
    bla_saloon_handrail00+hidr.ytd
    bla_03_sal08.ydr
    bla_03_sal08+hidr.ytd
        
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
    DeactivateInteriorEntitySet(interior, "bla_saloon_int")        
    DeactivateInteriorEntitySet(interior, "bla_saloon_sadie5setdressing")    
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

 