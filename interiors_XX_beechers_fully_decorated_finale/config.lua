Config = {}
Config.Commands = true  -- For testing set to false for live server
Config.TeleportME = true -- For testing set to false for live server

-- ipl / imap
Config.Sign = true 

-- interiors
Config.Posts = true  

Config.Label = "House Template"
Config.x = -309.288
Config.y = 808.374
Config.z = 119.187   
 
Config.door_hash_v1 = {
    ----Valentine 
}

Config.door_hash_v2 = {
    --"Name": "Room 1", // Saint Denis
    --"DoorsStatus": [ 2634.68, -1225.02, 58.6 ],
    --"Doors":  [ 2634.681, -1225.021, 58.59612, 89.478607177734 ]    
    --[entity] = {entity,hash_code,"obj_name",2634.681, -1225.021, 58.59612},  
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
--"TPEnter": [ 2633.843, -1224.484, 58.64468 ],
Config.Room = {x = 2634.843, y= -1225.484, z=58.64468, h = 000.00 } -- upstairs right  - room exist - structure interior missing 
 
Config.TeleportExit_On = false
--"TPLeave": [ 2635.453, -1224.474, 58.63639 ],
Config.Room = {x = 2634.453, y= -1225.474, z=58.63639 , h = 000.00 }
 
--[[
  "Houses": [     
    {
      "Id": 50690, // No carga bien el interior | It does not load interior well
      "InteriorName": "beechers_fully_decorated_finale",
      "Name": "House on the outskirts of Blackwater",
      "Price": 2456.0,
      "DoorsStatus": [ -1645.6, -1367.16, 84.47 ],
      "Doors": [
        [ -1646.2409667969, -1367.1358642578, 83.465660095215, 330.23867797852 ],
        [ -1649.2072753906, -1359.2379150391, 83.464546203613, 59.999992370605 ],
        [ -1637.7155761719, -1352.6480712891, 83.466453552246, 330.0 ]
      ],
      "Inventory": [ -1640.02, -1352.36, 84.45, 1.5 ],
      "MaxWeight": 115
    },
--]]