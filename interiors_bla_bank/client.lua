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
    RequestImap(-5339556)     -- West Elizabeth -- Blackwater -- New Bank Under Construction
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
	    [72962] = {x=-814.74194335938,y=-1276.5770263672,z=43.864669799805,typeHashId=679970449,
        typeHashName="bla_bank_int",rpf="bla_bank_int.rpf"},              
        bla_bank01_bricks001.ydr
        bla_bank01x.ydr
        bla_bank01x+hidr.ytd
        bla_bank01x01_glue.ydr
        bla_bank01x01_glue+hidr.ytd
        bla_bankscafold.ydr
        bla_bankscafold+hidr.ytd    

        bla_new_bank_ext_decal.ydr
        bla_new_bank_ext_decal+hidr.ytd
        bla_new_bank_ext_em.ydr
        bla_new_bank_ext.ydr
        bla_new_bank_ext+hidr.ytd

    --]]    
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_bank_int")       
    if Config.Bank == true then    
        ActivateInteriorEntitySet(interior, "bla_bank_int_02x")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_decals")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_decals1")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_decals2")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_mcp_shell")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_office_details")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_shadowproxy")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_shell_txd")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_txd")  
        ActivateInteriorEntitySet(interior, "bla_bank_int_vault")  
        ActivateInteriorEntitySet(interior, "bla_bank_lightbox")  
        ActivateInteriorEntitySet(interior, "bla_bank_lightbox00")                 
    end       
    if Config.NewBank == true then    
        ActivateInteriorEntitySet(interior, "bla_bank01_bricks001")  
        ActivateInteriorEntitySet(interior, "bla_bank01x")  
        ActivateInteriorEntitySet(interior, "bla_bank01x+hidr")  
        ActivateInteriorEntitySet(interior, "bla_bank01x01_glue")  
        ActivateInteriorEntitySet(interior, "bla_bank01x01_glue+hidr")

        ActivateInteriorEntitySet(interior, "bla_new_bank_ext_decal")  
        ActivateInteriorEntitySet(interior, "bla_new_bank_ext_decal+hidr")
        ActivateInteriorEntitySet(interior, "bla_new_bank_ext")  
        ActivateInteriorEntitySet(interior, "bla_new_bank_ext+hidr")
        ActivateInteriorEntitySet(interior, "bla_new_bank_ext_em")  

        if Config.NewBankConstruction == true then 
            ActivateInteriorEntitySet(interior, "bla_bankscafold")  
            ActivateInteriorEntitySet(interior, "bla_bankscafold+hidr")    
        end        
    end     
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesIMAPS() 
    --[[
    RemoveImap(_________________) -- Something relating to BizTemplate  
    --]]  
    RemoveImap(-5339556)     -- West Elizabeth -- Blackwater -- New Bank Under Construction
end

function DisableResourcesINTERIORS(x, y, z)  
    --[[
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "_________________")     
    DeactivateInteriorEntitySet(interior, "_________________")  
    --]]       
    local interior = GetInteriorAtCoords(x, y, z)   
    DeactivateInteriorEntitySet(interior, "bla_bank_int_02x")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_decals")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_decals1")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_decals2")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_mcp_shell")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_office_details")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_shadowproxy")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_shell_txd")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_txd")  
    DeactivateInteriorEntitySet(interior, "bla_bank_int_vault")  
    DeactivateInteriorEntitySet(interior, "bla_bank_lightbox")  
    DeactivateInteriorEntitySet(interior, "bla_bank_lightbox00")       

    DeactivateInteriorEntitySet(interior, "bla_bank01_bricks001")  
    DeactivateInteriorEntitySet(interior, "bla_bank01x")  
    DeactivateInteriorEntitySet(interior, "bla_bank01x+hidr")  
    DeactivateInteriorEntitySet(interior, "bla_bank01x01_glue")  
    DeactivateInteriorEntitySet(interior, "bla_bank01x01_glue+hidr")
    DeactivateInteriorEntitySet(interior, "bla_bankscafold")  
    DeactivateInteriorEntitySet(interior, "bla_bankscafold+hidr")  

    DeactivateInteriorEntitySet(interior, "bla_new_bank_ext_decal")  
    DeactivateInteriorEntitySet(interior, "bla_new_bank_ext_decal+hidr")
    DeactivateInteriorEntitySet(interior, "bla_new_bank_ext")  
    DeactivateInteriorEntitySet(interior, "bla_new_bank_ext+hidr")
    DeactivateInteriorEntitySet(interior, "bla_new_bank_ext_em")  

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

 