---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS()            
    --[[ 
 
        --#### End of Unlisted YMAPS ####--        
        -- Beechers --
        RemoveImap(1353861354) -- West Elizabeth -- Great Plains -- Beechers -- Barn -- Interior, lanterns and doors
        RemoveImap(611701601) -- West Elizabeth -- Great Plains -- Beechers -- Barn -- Work supplies
        RemoveImap(901412334) -- West Elizabeth -- Great Plains -- Beechers -- Work supplies
        RemoveImap(703356498) -- West Elizabeth -- Great Plains -- Beechers -- Barn -- Work supplies
        RemoveImap(-650822431) -- West Elizabeth -- Great Plains -- Beechers -- Barn -- Work supplies
        RemoveImap(-956131204) -- West Elizabeth -- Great Plains -- Beechers -- Barn -- Exterior and Fencing
        RemoveImap(2006257967) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-2008632686) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-1615103170) -- West Elizabeth -- Great Plains -- Beechers
        RemoveImap(578474998) -- West Elizabeth -- Great Plains -- Beechers -- Border Fencing
        RemoveImap(-1860722801) -- West Elizabeth -- Great Plains -- Beechers -- Gazebo
        RemoveImap(-692583342) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-669282002) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-1355464862) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-1141450523) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-252820785) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(258899919) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-767883927) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-535715562) -- West Elizabeth -- Great Plains -- Beechers -- Scaffolding // remove when completed
        RemoveImap(931647489) -- West Elizabeth -- Great Plains -- Beechers -- Interior
        RemoveImap(1467774743) -- West Elizabeth -- Great Plains -- Beechers -- Interior
        RemoveImap(2030594491) -- West Elizabeth -- Great Plains -- Beechers -- Construction materials
        RemoveImap(-790660125) -- West Elizabeth -- Great Plains -- Beechers -- 
        RemoveImap(33260939) -- West Elizabeth -- Great Plains -- Beechers -- Construction supplies
        RemoveImap(780653384) -- West Elizabeth -- Great Plains -- Beechers -- Construction supplies
        RemoveImap(180676027) -- West Elizabeth -- Great Plains -- Beechers -- Construction supplies
        RemoveImap(-270212770) -- West Elizabeth -- Great Plains -- Beechers -- Construction supplies
        RemoveImap(-211623797) -- West Elizabeth -- Great Plains -- Beechers -- Construction supplies
        RemoveImap(862349416) -- West Elizabeth -- Great Plains -- Beechers -- Construction supplies
        RemoveImap(699225334) -- West Elizabeth -- Great Plains -- Beechers -- Construction supplies -- Roof going on
        RemoveImap(411742897) -- West Elizabeth -- Great Plains -- Beechers -- Completed exterior
        RemoveImap(349494711) -- West Elizabeth -- Great Plains -- Beechers -- clothes line, wagon wheel,
        RemoveImap(-706105482) -- West Elizabeth -- Great Plains -- Beechers -- crate on deck by window
        RemoveImap(176369335) -- West Elizabeth -- Great Plains -- Beechers -- old windows from previous shack
        RemoveImap(2087181890) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(637627640) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(44077654) -- West Elizabeth -- Great Plains -- Beechers -- support beam - construction
        RemoveImap(839872819) -- West Elizabeth -- Great Plains -- Beechers -- support beam - construction
        RemoveImap(-1656895602) -- West Elizabeth -- Great Plains -- Beechers -- support beam - construction
        RemoveImap(-583969090) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-364121869) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-1073832871) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-1786558629) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-1548753996) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-1784133719) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-1667461262) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(1757739778) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-2029237844) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(-2000794023) -- West Elizabeth -- Great Plains -- Beechers
        RemoveImap(-531137142) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(5422464) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(203845253) -- West Elizabeth -- Great Plains -- Beechers -- Silo construction materials
        RemoveImap(-1658679165) -- West Elizabeth -- Great Plains -- Beechers -- Silo construction base and materials
        RemoveImap(258733332) -- West Elizabeth -- Great Plains -- Beechers -- Silo construction base and materials
        RemoveImap(79028136) -- West Elizabeth -- Great Plains -- Beechers -- Silo construction base and materials
        RemoveImap(-218940381) -- West Elizabeth -- Great Plains -- Beechers -- Silo completed
        RemoveImap(634752926) -- West Elizabeth -- Great Plains -- Beechers -- chairs and construction supplies
        RemoveImap(984271748) -- West Elizabeth -- Great Plains -- Beechers -- chairs and construction supplies
        RemoveImap(43335376) -- West Elizabeth -- Great Plains -- Beechers 
        RemoveImap(1444950942) -- West Elizabeth -- Great Plains -- Beechers -- green wagon side of house/clipping -- full of bricks
        RemoveImap(910783469) -- West Elizabeth -- Great Plains -- Beechers -- green wagon side of house/clipping -- full of bricks
        RemoveImap(727408145) -- West Elizabeth -- Great Plains -- Beechers -- green wagon front of house/clipping -- full of bricks
        RemoveImap(429636242) -- West Elizabeth -- Great Plains -- Beechers -- pile of wood north side of house -- construction materials
        RemoveImap(-19364596) -- West Elizabeth -- Great Plains -- Beechers -- pile of wood north side of house -- construction materials
        RemoveImap(2131035495) -- West Elizabeth -- Great Plains -- Beechers -- green wagon side of house/clipping -- full of bricks
        RemoveImap(1236917971) -- West Elizabeth -- Great Plains -- Beechers -- Outhouse
        RemoveImap(-316448350) -- West Elizabeth -- Great Plains -- Beechers -- construction materials
        RemoveImap(-496874464) -- West Elizabeth -- Great Plains -- Beechers -- construction materials
        RemoveImap(-794515291) -- West Elizabeth -- Great Plains -- Beechers -- construction materials
        RemoveImap(275588949) -- West Elizabeth -- Great Plains -- Beechers -- construction materials
        RemoveImap(-52330434) -- West Elizabeth -- Great Plains -- Beechers -- construction materials
        RemoveImap(-2131457946) -- West Elizabeth -- Great Plains -- Beechers -- construction materials
        RemoveImap(1819926822) -- West Elizabeth -- Great Plains -- Beechers -- interior framing -- construction
        RemoveImap(1529593482) -- West Elizabeth -- Great Plains -- Beechers -- interior framing -- construction
        RemoveImap(-668911501) -- West Elizabeth -- Great Plains -- Beechers -- framing, remove when exterior is up.
        RemoveImap(-1012618146) -- West Elizabeth -- Great Plains -- Beechers -- old structure
        RemoveImap(2111816145) -- West Elizabeth -- Great Plains -- Beechers -- old structure rubble
        RemoveImap(-722030448) -- West Elizabeth -- Great Plains -- Beechers -- old structure
        RemoveImap(-974480336) -- West Elizabeth -- Great Plains -- Beechers -- canvas gazebos
        RemoveImap(197447134) -- West Elizabeth -- Great Plains -- Beechers -- canvas gazebo north, wagon, and supplies
        RemoveImap(-918785150) -- West Elizabeth -- Great Plains -- Beechers -- firepit seating
        RemoveImap(1256771838) -- West Elizabeth -- Great Plains -- Beechers -- wagon wreckage in cropfield
        RemoveImap(1205945639) -- West Elizabeth -- Great Plains -- Beechers -- lumber pile main driveway in
        RemoveImap(1532774697) -- West Elizabeth -- Great Plains -- Beechers -- lumber pile main driveway in
        RemoveImap(-114633341) -- West Elizabeth -- Great Plains -- Beechers -- saw horse main driveway in
        RemoveImap(-90646166) -- West Elizabeth -- Great Plains -- Beechers -- floating saddle, hat, and rope in corral
        RemoveImap(1681117196) -- West Elizabeth -- Great Plains -- Beechers -- pile of old lumber
        RemoveImap(-803019223) -- West Elizabeth -- Great Plains -- Beechers -- fire behind house
        RemoveImap(449426161) -- West Elizabeth -- Great Plains -- Beechers -- lantern
        RemoveImap(-999913940) -- West Elizabeth -- Great Plains -- Beechers -- lantern
        RemoveImap(-30541382) -- West Elizabeth -- Great Plains -- Beechers -- lantern
        RemoveImap(-960328988) -- West Elizabeth -- Great Plains -- Beechers -- lantern
        -- Beechers field --
        RemoveImap(-1765152778) -- West Elizabeth -- Great Plains -- Beechers Field -- logs laying in 
        RemoveImap(-2072231077) -- West Elizabeth -- Great Plains -- Beechers Field -- plants over area
        RemoveImap(-1253110600) -- West Elizabeth -- Great Plains -- Beechers Field -- hole in ground fix
        RemoveImap(1929454697) -- West Elizabeth -- Great Plains -- Beechers Field -- side rows of some medium crop
        RemoveImap(1649902358) -- West Elizabeth -- Great Plains -- Beechers Field -- side rows of some small crop
        RemoveImap(1864768904) -- West Elizabeth -- Great Plains -- Beechers Field -- crops in middle
        RemoveImap(938290967) -- West Elizabeth -- Great Plains -- Beechers Field -- crops in middle
        RemoveImap(1169279648) -- West Elizabeth -- Great Plains -- Beechers Field -- crops in middle




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

 