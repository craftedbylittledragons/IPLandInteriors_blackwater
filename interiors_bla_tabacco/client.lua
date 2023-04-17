---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS()            
    --[[       
    if Config.Unknow == true then
        RequestImap(_________________) -- Something relating to BizTemplate
    end     
    [    958171] [RedM_b1436_GTA]             MainThrd/ bla_blk05	-1136459893
    [    958171] [RedM_b1436_GTA]             MainThrd/ bla_tabacco3x_ext01	732824437
    [    958171] [RedM_b1436_GTA]             MainThrd/ bla_tabacco3x_ext01_em	-107641845
    [    958171] [RedM_b1436_GTA]             MainThrd/ bla_tabacco3x_ext01_det	-179638519
    [    958171] [RedM_b1436_GTA]             MainThrd/ bla_tabacco3x_decal01	241510056  

    --]] 
    ymap = "bla_blk05"
    hashKey = GetHashKey(ymap)
    print(ymap, hashKey)
    RequestImap(hashKey) -- Something relating to BizTemplate
    
    ymap = "bla_blk05_bcloth_sim"
    hashKey = GetHashKey(ymap)
    print(ymap, hashKey)
    RequestImap(hashKey) -- Something relating to BizTemplate
 
    ymap = "bla_tabacco3x_ext01"
    hashKey = GetHashKey(ymap)
    print(ymap, hashKey)
    RequestImap(hashKey) -- Something relating to BizTemplate

    ymap = "bla_tabacco3x_ext01_em"
    hashKey = GetHashKey(ymap)
    print(ymap, hashKey)
    RequestImap(hashKey) -- Something relating to BizTemplate

    ymap = "bla_tabacco3x_ext01_det"
    hashKey = GetHashKey(ymap)
    print(ymap, hashKey)
    RequestImap(hashKey) -- Something relating to BizTemplate    

    ymap = "bla_tabacco3x_decal01"
    hashKey = GetHashKey(ymap)
    print(ymap, hashKey)
    RequestImap(hashKey) -- Something relating to BizTemplate  
   
end

function EnableResouresINTERIORS(x, y, z)        
    --[[
	[22786] = {x=-875.21392822266,y=-1332.9946289063,z=44.0,typeHashId=-514415655,typeHashName="bla_train_int",rpf="bla_train_int.rpf"}, 
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    bla_tabacco3x_decal01.ydr
    bla_tabacco3x_ext01_det.ydr
    bla_tabacco3x_ext01_em.ydr
    bla_tabacco3x_ext01.ydr
    bla_tabacco3x_ext01+hidr.ytd    
    --]] 
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "bla_blk05")   
    ActivateInteriorEntitySet(interior, "bla_tabacco3x_ext01")   
    ActivateInteriorEntitySet(interior, "bla_tabacco3x_ext01_em")   
    ActivateInteriorEntitySet(interior, "bla_tabacco3x_ext01_det")    
    ActivateInteriorEntitySet(interior, "bla_tabacco3x_ext01+hidr")   
    ActivateInteriorEntitySet(interior, "bla_tabacco3x_decal01")     
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
    DeactivateInteriorEntitySet(interior, "bla_tabacco3x_ext01_em")   
    DeactivateInteriorEntitySet(interior, "bla_tabacco3x_ext01_det")   
    DeactivateInteriorEntitySet(interior, "bla_tabacco3x_ext01")   
    DeactivateInteriorEntitySet(interior, "bla_tabacco3x_ext01+hidr")   
    DeactivateInteriorEntitySet(interior, "bla_tabacco3x_decal01")      
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

 