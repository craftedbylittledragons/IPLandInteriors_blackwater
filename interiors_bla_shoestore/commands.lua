
-----------------------------------------------------
------ admin commands to control the bar ----------
--- add admind perms later
-----------------------------------------------------
RegisterCommand("interiors_bla_shoestore_turnon", function(source, args)    
    if Config.Commands == true then   
        TriggerEvent( "interiors_bla_shoestore:turnon", "ok" ) 
    else 
        print("Turn On IMAP is disabled in script "..Config.Label)
    end
end)
RegisterNetEvent('interiors_bla_shoestore:turnon')
AddEventHandler('interiors_bla_shoestore:turnon', function(no_String)  
	EnableResouresYMAPS() 
    EnableResouresINTERIORS(Config.x, Config.y, Config.z)
    Wait(800) 
end) 
  
RegisterCommand("interiors_bla_shoestore_turnoff", function(source, args)  
    if Config.Commands == true then       
        TriggerEvent( "interiors_bla_shoestore:turnoff", "ok" ) 
    else 
        print("Turn Off IMAP is disabled in script "..Config.Label)
    end
end)
RegisterNetEvent('interiors_bla_shoestore:turnoff')
AddEventHandler('interiors_bla_shoestore:turnoff', function(no_String)  
	DisableResourcesYMAPS()
    DisableResourcesINTERIORS(Config.x, Config.y, Config.z)
    Wait(800) 
end)  
