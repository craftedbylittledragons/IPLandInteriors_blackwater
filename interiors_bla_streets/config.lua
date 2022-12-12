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
 

sets = {
    {name = "bla_street_a_dec", type="ydr", engage=true, desc=""},
    {name = "bla_street_a_dec+hidr", type="ytd", engage=true, desc=""},
    {name = "bla_street_a", type="ydr", engage=true, desc=""},
    {name = "bla_street_b_dec", type="ydr", engage=true, desc=""},
    {name = "bla_street_b", type="ydr", engage=true, desc=""},
    {name = "bla_street_c_dec", type="ydr", engage=true, desc=""},
    {name = "bla_street_c_dec+hidr", type="ytd", engage=true, desc=""},
    {name = "bla_street_trash_1", type="ydr", engage=true, desc=""},
    {name = "bla_streetsign_01", type="ydr", engage=true, desc=""},
    {name = "bla_streetsign_02", type="ydr", engage=true, desc=""},
    {name = "bla_streetsign_03", type="ydr", engage=true, desc=""},
    {name = "bla_streetsign_04", type="ydr", engage=true, desc=""},
    {name = "bla_streetsign_05", type="ydr", engage=true, desc=""},
    {name = "bla_streetsign_07", type="ydr", engage=true, desc=""},
    {name = "bla_streetsign_08", type="ydr", engage=true, desc=""},
    {name = "bla_streetsign_09_lod", type="ydr", engage=true, desc=""},
    {name = "bla_streetsign_09", type="ydr", engage=true, desc=""},
    {name = "bla_streetsign_10", type="ydr", engage=true, desc=""},
    {name = "bla_sidewalk_02_lod", type="ydr", engage=true, desc=""},
    {name = "bla_sidewalk_lumber_016", type="ydr", engage=true, desc=""},
    {name = "bla_sidewalk_lumber_016+hidr", type="ytd", engage=true, desc=""},
    {name = "bla_sidewalk_lumber_020", type="ydr", engage=true, desc=""},
    {name = "bla_sidewalk_lumber_020+hidr", type="ytd", engage=true, desc=""},
    {name = "bla_sidewalk_streetmud01", type="ydr", engage=true, desc=""},
    {name = "bla_sidewalk_streetmud01+hidr", type="ytd", engage=true, desc=""},
    {name = "bla_sidewalk0", type="ydr", engage=true, desc=""},
    {name = "bla_sidewalk02", type="ydr", engage=true, desc=""},
    {name = "bla_sidewalk02+hidr", type="ytd", engage=true, desc=""},
    {name = "bla_sidewalk03x_3", type="ydr", engage=true, desc=""},
    {name = "bla_sidewalk03x_decal", type="ydr", engage=true, desc=""},
    {name = "bla_sidewalk03x_decal+hidr", type="ytdv", engage=true, desc=""},
    {name = "bla_sidewalk03x", type="ydr", engage=true, desc=""},
    {name = "bla_sidewalk03x+hidr", type="ytd", engage=true, desc=""},

    {name = "bla_road_props_debris_00", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_01", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_02", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_03", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_04", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_05", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_06", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_07", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_08", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_09", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_10", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_11", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_12", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_13", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_14", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_30", type="ydr", engage=false, desc=""},
    {name = "bla_road_props_debris_txd", type="ytd", engage=false, desc=""},

    {name = "bla_road_sidewalk01_lod", type="ydr", engage=true, desc=""},
    {name = "bla_road_sidewalk01", type="ydr", engage=true, desc=""},
    {name = "bla_road_sidewalk02_lod", type="ydr", engage=true, desc=""},
    {name = "bla_road_sidewalk02", type="ydr", engage=true, desc=""},
    {name = "bla_road_track_decal_01b", type="ydr", engage=true, desc=""},
    {name = "bla_road_track_decal_01c", type="ydr", engage=true, desc=""},
    {name = "bla_road_track_decal_02", type="ydr", engage=true, desc=""},
    {name = "bla_road_track_decal_03a", type="ydr", engage=true, desc=""},
    {name = "bla_road_track_decal_03b", type="ydr", engage=true, desc=""},
    {name = "bla_road_track_decal_03d", type="ydr", engage=true, desc=""},
    {name = "bla_road_track_decal_04", type="ydr", engage=true, desc=""},
    {name = "bla_road_txd_ne", type="ytd", engage=true, desc=""},
    {name = "bla_road_txd_nw", type="ytd", engage=true, desc=""},
    {name = "bla_road_txd_se", type="ytd", engage=true, desc=""},
    {name = "bla_road_txd_sw", type="ytd", engage=true, desc=""},
    {name = "bla_road_txd", type="ytd", engage=true, desc=""},
    {name = "bla_road_txd+hi", type="ytd", engage=true, desc=""},

    {name = "bla_blk01_em_slod", type="ydr", engage=true, desc=""},
    {name = "bla_blk01_em_slod", type="ytd", engage=true, desc=""},
    {name = "bla_blk01_em", type="ytd", engage=true, desc=""},
    {name = "bla_blk01_props_debris_01", type="ydr", engage=false, desc=""},
    {name = "bla_blk01_props_debris_02", type="ydr", engage=false, desc=""},
    {name = "bla_blk01_props_debris_txd", type="ytd", engage=false, desc=""},
    {name = "bla_blk01", type="ytd", engage=true, desc=""},
    {name = "bla_blk01+hi", type="ytd", engage=true, desc=""},
    {name = "bla_blk02_em_slod", type="ydr", engage=true, desc=""},
    {name = "bla_blk02_em_slod", type="ytd", engage=true, desc=""},
    {name = "bla_blk02_em", type="ytd", engage=true, desc=""},
    {name = "bla_blk02", type="ytd", engage=true, desc=""},
    {name = "bla_blk02+hi", type="ytd", engage=true, desc=""},
    {name = "bla_blk03_debris_01", type="ydr", engage=false, desc=""},
    {name = "bla_blk03_debris_01+hidr", type="ytd", engage=false, desc=""},
    {name = "bla_blk03_em_slod", type="ydr", engage=true, desc=""},
    {name = "bla_blk03_em_slod", type="ytd", engage=true, desc=""},
    {name = "bla_blk03_em", type="ytd", engage=true, desc=""},
    {name = "bla_blk03_props_debris_02", type="ydr", engage=false, desc=""},
    {name = "bla_blk03_props_debris_02+hidr", type="ytd", engage=false, desc=""},
    {name = "bla_blk03_txd1", type="ytd", engage=true, desc=""},
    {name = "bla_blk03_txd2", type="ytd", engage=true, desc=""},
    {name = "bla_blk03_txd2+hi", type="ytd", engage=true, desc=""},
    {name = "bla_blk04_em_slod", type="ydr", engage=true, desc=""},
    {name = "bla_blk04_em_slod", type="ytd", engage=true, desc=""},
    {name = "bla_blk04_em", type="ytd", engage=true, desc=""},
    {name = "bla_blk04", type="ytd", engage=true, desc=""},
    {name = "bla_blk04+hi", type="ytd", engage=true, desc=""},
    {name = "bla_blk05_bcloth_sim", type="yft", engage=true, desc=""},
    {name = "bla_blk05_bcloth_sim+hifr", type="ytd", engage=true, desc=""},
    {name = "bla_blk05_em_slod", type="ydr", engage=true, desc=""},
    {name = "bla_blk05_em_slod", type="ytd", engage=true, desc=""},
    {name = "bla_blk05_em", type="ytd", engage=true, desc=""},
    {name = "bla_blk05_props_debris_01", type="ydr", engage=false, desc=""},
    {name = "bla_blk05_roofaccess", type="ydr", engage=true, desc=""},
    {name = "bla_blk05_roofaccess+hidr", type="ytd", engage=true, desc=""},
    {name = "bla_blk05_txd1", type="ytd", engage=true, desc=""},
    {name = "bla_blk05_txd1+hi", type="ytd", engage=true, desc=""},
    {name = "bla_blk05_txd2", type="ytd", engage=true, desc=""},
    {name = "bla_blk05_txd2+hi", type="ytd", engage=true, desc=""},
    {name = "bla_blk06_em_slod", type="ydr", engage=true, desc=""},
    {name = "bla_blk06_em_slod", type="ytd", engage=true, desc=""},
    {name = "bla_blk06_em", type="ytd", engage=true, desc=""},
    {name = "bla_blk06_props_debris_00", type="ydr", engage=false, desc=""},
    {name = "bla_blk06_props_debris_01", type="ydr", engage=false, desc=""},
    {name = "bla_blk06_props_debris_02", type="ydr", engage=false, desc=""},
    {name = "bla_blk06_props_debris_txd", type="ytd", engage=false, desc=""},
    {name = "bla_blk06_props_dummy", type="ydr", engage=true, desc=""},
    {name = "bla_blk06", type="ytd", engage=true, desc=""},
    {name = "bla_blk06+hi", type="ytd", engage=true, desc=""},

    {name = "0x00C3E769", type="ytd", engage=true, desc=""},
    {name = "0x017134B7", type="ytd", engage=true, desc=""},
    {name = "0x025A8EBF", type="ytd", engage=true, desc=""},
    {name = "0x0BCDCA41", type="ytd", engage=true, desc=""},
    {name = "0x0BD187DC", type="ytd", engage=true, desc=""},
    {name = "0x0BF0F7E8", type="ytd", engage=true, desc=""},
    {name = "0x0C9B6467", type="ytd", engage=true, desc=""},
    {name = "0x1338984E", type="ytd", engage=true, desc=""},
    {name = "0x13454DD2", type="ytd", engage=true, desc=""},
    {name = "0x1DF5779D", type="ytd", engage=true, desc=""},
    {name = "0x21B7B56F", type="ytd", engage=true, desc=""},
    {name = "0x24BA468D", type="ytd", engage=true, desc=""},
    {name = "0x25B1A101", type="ytd", engage=true, desc=""},
    {name = "0x2B2AC15C", type="ytd", engage=true, desc=""},
    {name = "0x2BAE3B64", type="ytd", engage=true, desc=""},
    {name = "0x341F2C95", type="ytd", engage=true, desc=""},
    {name = "0x44DEBED2", type="ytd", engage=true, desc=""},
    {name = "0x4659EE9C", type="ytd", engage=true, desc=""},
    {name = "0x4735B06F", type="ytd", engage=true, desc=""},
    {name = "0x48D93A2E", type="ytd", engage=true, desc=""},
    {name = "0x4CD7A16E", type="ytd", engage=true, desc=""},
    {name = "0x55603577", type="ytd", engage=true, desc=""},
    {name = "0x6088FC33", type="ytd", engage=true, desc=""},
    {name = "0x609028DC", type="ytd", engage=true, desc=""},
    {name = "0x66A7C3F7", type="ytd", engage=true, desc=""},
    {name = "0x66FB574F", type="ytd", engage=true, desc=""},
    {name = "0x70C31398", type="ytd", engage=true, desc=""},
    {name = "0x78707CCD", type="ytd", engage=true, desc=""},
    {name = "0x83737075", type="ytd", engage=true, desc=""},
    {name = "0x9032F555", type="ytd", engage=true, desc=""},
    {name = "0x94D76BC1", type="ytd", engage=true, desc=""},
    {name = "0x956DFDDA", type="ytd", engage=true, desc=""},
    {name = "0x9DF3FD7E", type="ytd", engage=true, desc=""},
    {name = "0xB54D5941", type="ytd", engage=true, desc=""},
    {name = "0xB985DCFB", type="ytd", engage=true, desc=""},
    {name = "0xC3C60906", type="ytd", engage=true, desc=""},
    {name = "0xC836C2D9", type="ytd", engage=true, desc=""},
    {name = "0xCB875535", type="ytd", engage=true, desc=""},
    {name = "0xCBB7D08B", type="ytd", engage=true, desc=""},
    {name = "0xD83A32B5", type="ytd", engage=true, desc=""},
    {name = "0xD97177C8", type="ytd", engage=true, desc=""},
    {name = "0xDB33FF0F", type="ytd", engage=true, desc=""},
    {name = "0xDE9E4BFA", type="ytd", engage=true, desc=""},
    {name = "0xEC4A2439", type="ytd", engage=true, desc=""},
    {name = "0xEF6F799B", type="ytd", engage=true, desc=""},
    {name = "0xFD86C422", type="ytd", engage=true, desc=""},
    {name = "0xFF804875", type="ytd", engage=true, desc=""},

    {name = "bla_slum_em_slod", type="ydr", engage=true, desc=""},
    {name = "bla_slum_em_slod", type="ytd", engage=true, desc=""},
    {name = "bla_slum_em", type="ytd", engage=true, desc=""},
    {name = "bla_slum", type="ytd", engage=true, desc=""},
    {name = "bla_slum+hi", type="ytd", engage=true, desc=""},
    
    {name = "bla_slum_props_debris_00", type="ytd", engage=false, desc=""},
    {name = "bla_slum_props_debris_01", type="ytd", engage=false, desc=""},
    {name = "bla_slum_props_debris_02", type="ytd", engage=false, desc=""},
    {name = "bla_slum_props_debris_03", type="ytd", engage=false, desc=""},
    {name = "bla_slum_props_debris_04", type="ytd", engage=false, desc=""},
    {name = "bla_slum_props_debris_05", type="ytd", engage=false, desc=""},
    {name = "bla_slum_props_debris_05+hidr", type="ytd", engage=false, desc=""},
    {name = "bla_slum_props_debris_06", type="ytd", engage=false, desc=""},
    {name = "bla_slum_props_debris_txd", type="ytd", engage=false, desc=""},
    {name = "bla_slum_props_debris_txd+hi", type="ytd", engage=false, desc=""}, 
 
    {name = "bla_blk06_slum01_d", type="ydr", engage=true, desc=""},
    {name = "bla_blk06_slum01_d+hi", type="ytd", engage=true, desc=""},
    {name = "bla_blk06_slum01_em", type="ydr", engage=true, desc=""}, 
    {name = "bla_blk06_slum01", type="ydr", engage=true, desc=""},
    {name = "bla_blk06_slum01+hi", type="ydr", engage=true, desc=""},     


    {name = "bla_clothsline_01", type="ytd", engage=true, desc=""},
    {name = "bla_clothsline_01+hi", type="ytd", engage=true, desc=""}, 

    {name = "blabl01pr_combo_dslod", type="ydr", engage=false, desc=""},
    {name = "blabl01pr_combo_slod2", type="ydr", engage=false, desc=""},
    {name = "blabl02pr_combo_dslod", type="ydr", engage=false, desc=""},
    {name = "blabl03_combo_slod", type="ydr", engage=false, desc=""},
    {name = "blabl05pr_combo_dslod", type="ydr", engage=false, desc=""},
    {name = "blabl05pr_combo01_slod", type="ydr", engage=false, desc=""},
    {name = "blabl05pr_combo02_slod", type="ydr", engage=false, desc=""},
    {name = "blabl06pr_combo_slod", type="ydr", engage=false, desc=""},
    {name = "blabl06pr_combo01_slod", type="ydr", engage=false, desc=""},
    {name = "blacipr_combo_slod", type="ydr", engage=false, desc=""},
    {name = "blacipr_combo_slod2", type="ydr", engage=false, desc=""},
    {name = "blacipr_combo01_slod", type="ydr", engage=false, desc=""},
    {name = "blacipr_combo01_slod2", type="ydr", engage=false, desc=""},
    {name = "blacipr_combo02_slod", type="ydr", engage=false, desc=""},
    {name = "bladopr_combo02_dslod", type="ydr", engage=false, desc=""},
    {name = "blaropr_combo03_slod", type="ydr", engage=false, desc=""},
    {name = "blaslpr_combo01_dslod", type="ydr", engage=false, desc=""},
    {name = "blasorepr_combo01_slod", type="ydr", engage=false, desc=""},
    {name = "blasorepr_combo02_slod", type="ydr", engage=false, desc=""},
    {name = "blasorepr_combo03_slod", type="ydr", engage=false, desc=""},
    {name = "blasorepr_combo04_slod", type="ydr", engage=false, desc=""},
    {name = "blasorepr_combo05_slod", type="ydr", engage=false, desc=""},
    {name = "blawerepr_combo01_slod", type="ydr", engage=false, desc=""},


    {name = "bla_object002", type="ydr", engage=true, desc=""},
    {name = "bla_object003", type="ydr", engage=true, desc=""},
    {name = "bla_object004", type="ydr", engage=true, desc=""},
    {name = "bla_object005", type="ydr", engage=true, desc=""},
    {name = "bla_object006", type="ydr", engage=true, desc=""},
    {name = "bla_object007", type="ydr", engage=true, desc=""},
    {name = "bla_object008", type="ydr", engage=true, desc=""},
    {name = "bla_object009", type="ydr", engage=true, desc=""},
    {name = "bla_object010", type="ydr", engage=true, desc=""},
    {name = "bla_object011", type="ydr", engage=true, desc=""},
    {name = "bla_object012", type="ydr", engage=true, desc=""},
    {name = "bla_object013", type="ydr", engage=true, desc=""},
    {name = "bla_object014", type="ydr", engage=true, desc=""},
    {name = "bla_object015", type="ydr", engage=true, desc=""},
    {name = "bla_object016", type="ydr", engage=true, desc=""},
    {name = "bla_object017", type="ydr", engage=true, desc=""},
    {name = "bla_object018", type="ydr", engage=true, desc=""},
    {name = "bla_object019", type="ydr", engage=true, desc=""},
    {name = "bla_object020", type="ydr", engage=true, desc=""},
    {name = "bla_object021", type="ydr", engage=true, desc=""},
    {name = "bla_object022", type="ydr", engage=true, desc=""},
    {name = "bla_object023", type="ydr", engage=true, desc=""},
    {name = "bla_object024", type="ydr", engage=true, desc=""},
    {name = "bla_object025", type="ydr", engage=true, desc=""},
    {name = "bla_object026", type="ydr", engage=true, desc=""},
    {name = "bla_object027", type="ydr", engage=true, desc=""},
    {name = "bla_object028", type="ydr", engage=true, desc=""},
    {name = "bla_object029", type="ydr", engage=true, desc=""},
 

    {name = "bla_emitterdummy_donotdelete", type="ydr", engage=false, desc=""},
    {name = "bla_emitterdummy_donotdelete01", type="ydr", engage=false, desc=""},
    {name = "bla_emitterdummy_donotdelete02", type="ydr", engage=false, desc=""},
    {name = "bla_emitterdummy_donotdelete03", type="ydr", engage=false, desc=""},
    {name = "bla_emitterdummy_donotdelete04", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete06", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete07", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete08", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete09", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete10", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete11", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete13", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete14", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete15", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete16", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete17", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete18", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete19", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete21", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete23", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete24", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete25", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete26", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete27", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete28", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete29", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete30", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete31", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete32", type="ydr", engage=true, desc=""},
    {name = "bla_emitterdummy_donotdelete33", type="ydr", engage=true, desc=""},


    {name = "bla_hay_coverage_1", type="ydr", engage=true, desc=""},
    {name = "bla_hay_coverage_3", type="ydr", engage=true, desc=""},

    {name = "bla_awningcloth01", type="yft", engage=true, desc=""},   
    {name = "bla_awningcloth01+hifr", type="ytd", engage=true, desc=""},   
     
    {name = "bla_chicken_decal", type="ydr", engage=true, desc=""},
    {name = "bla_construction_slod", type="ydr", engage=false, desc=""},
    {name = "bla_construction", type="ydr", engage=false, desc=""},
    
    {name = "bla_corner02_em", type="ydr", engage=true, desc=""},
    {name = "bla_corner02", type="ydr", engage=true, desc=""},
    {name = "bla_corner02+hidr", type="ytd", engage=true, desc=""},         
      
    {name = "bla_int_plane", type="ydr", engage=true, desc=""},
    {name = "bla_plane001", type="ydr", engage=true, desc=""},
    {name = "bla_plane002", type="ydr", engage=true, desc=""},
    {name = "bla_blkgazeboplane", type="ydr", engage=true, desc=""},

    {name = "bla_brokenwagon02", type="ydr", engage=false, desc=""},
    {name = "bla_brokenwagon02+hidr", type="ytd", engage=false, desc=""},   

    {name = "bla_blk06_stagecoach", type="ydr", engage=true, desc=""},
    {name = "bla_blk06_stagecoach+hidr", type="ytd", engage=true, desc=""},      
        
}