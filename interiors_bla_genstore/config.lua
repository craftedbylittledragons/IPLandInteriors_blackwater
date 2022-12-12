Config = {}
Config.Commands = true  -- For testing set to false for live server
Config.TeleportME = true -- For testing set to false for live server

-- imap
Config.Smoke = true 
Config.HayBales = false  
 
-- ipl 
Config.Unknown = true 
Config.Debris = false 
 

Config.Label = "BizTemplate"
Config.x = -846.36
Config.y = -1321.8
Config.z = 43.14    
 
Config.door_hash_v1 = {
    ----Valentine 
}

Config.door_hash_v2 = {
    --[[
    [3798786] = {3798786,-542955242,"p_door04x",-322.7286, 767.2573, 121.7059},  -- "Name": "Room 2A", // Valentine
    [3459074] = {3459074,-542955242,"p_door04x",-321.5221, 762.2973, 121.6815},  -- "Name": "Room 2B", // Valentine
    --]]
}  

--------------------------------------------------
-- Teleport Cofiguration  ---------------------------
--------------------------------------------------
Config.definedkey = { named = "G", hash = 0x760A9C6F }
Config.TeleporterPrompt = "Use Door [~e~"..  Config.definedkey.named  .."~q~]"
Config.TeleportDistance = 0.5
Config.WaitTimer = 1000
Config.FadeTimer = 2

Config.TeleportEnter_On = false
Config.EnterRoom = {x = -306.673, y= 803.274, z=122.175, h = 000.00 } -- upstairs right  - room exist - structure interior missing 
Config.EnterRoom2B = {x = -312.446, y= 802.122, z=122.176, h = 000.00 }  -- upstairs left  - room exist - structure interior missing  

Config.TeleportExit_On = false
Config.ExitRoom = {x = -306.695, y= 801.549, z=121.732 , h = 000.00 }
Config.ExitRoom2B = {x = -312.651, y= 801.041, z=121.730, h = 000.00 }  
 

-- ActivateInteriorEntitySets(61442, "Blackwater general store", 
item_sets = {
    "_p_apple01x_dressing",
    "_p_apple01x_dressing",
    "_p_carrots_01x_dressing",
    "_p_carrots_01x_group",
    "_p_cigar02x_dressing",
    "_p_cigar02x_group",
    "_p_cigarettebox01x_dressing",
    "_p_cigarettebox01x_group",
    "_p_int_fishing01_dressing",
    "_p_tin_pomade01x_dressing",
    "_p_tin_pomade01x_group",
    "_p_tin_soap01x_dressing",
    "_p_tin_soap01x_group",
    "_s_beardTonic01x_dressing",
    "_s_beardTonic01x_group",
    "_s_biscuits01x_dressing",
    "_s_biscuits01x_group",
    "_s_brandy01x_group",
    "_s_canApricots01x_dressing",
    "_s_canApricots01x_group",
    "_s_candyBag01x_red_group",
    "_s_canKidney01x_dressing",
    "_s_cankidney01x_group",
    "_s_canPeas01x_dressing",
    "_s_canPeas01x_group",
    "_s_cheeseWedge1x_group",
    "_s_chocolateBar02x_dressing",
    "_s_chocolateBar02x_group",
    "_s_coffeeTin01x_dressing",
    "_s_coffeeTin01x_group",
    "_s_cornedBeef01x_dressing",
    "_s_cornedBeef01x_group",
    "_s_crackers01x_dressing",
    "_s_crackers01x_group",
    "_s_cricketTin01x_dressing",
    "_s_cricketTin01x_group",
    "_s_gunOil01x_dressing",
    "_s_gunOil01x_group",
    "_s_inv_baitHerb01x_dressing",
    "_s_inv_baitherb01x_group",
    "_s_inv_baitMeat01x_dressing",
    "_s_inv_baitmeat01x_group",
    "_s_inv_gin01x_dressing",
    "_s_inv_gin01x_group",
    "_s_inv_horsePills01x_dressing",
    "_s_inv_horsePills01x_group",
    "_s_inv_rum01x_dressing",
    "_s_inv_rum01x_group",
    "_s_inv_tabacco01x_dressing",
    "_s_inv_tabacco01x_group",
    "_s_inv_whiskey01x_dressing",
    "_s_inv_whiskey01x_group",
    "_s_oatcakes01x_dressing",
    "_s_oatcakes01x_group",
    "_s_peach01x_dressing",
    "_s_peach01x_group",
    "_s_saltedbeef01x_group",
    "_s_saltedbeef02x_group",
    "_s_wormCan01x_dressing",
    "_s_wormcan01x_group"
}