// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    precachemodel( "com_cellphone_on" );
    precachemodel( "com_metal_briefcase" );
    _id_BE32();
    _id_CEA8();
    _id_C45B();
    _id_B3AE();
    vehicle_anims();
    player_anims();
    model_anims();
    _id_CA09();
    _id_B782();
    _id_B771();
    dialog();
}
#using_animtree("generic_human");

_id_BE32()
{
    var_0 = [];
    var_0[0] = 2;
    var_0[1] = 1;
    var_0[2] = 1;
    var_0[3] = 1;
    var_1 = [];
    var_1[0] = 7;
    var_1[1] = 3;
    var_2 = common_scripts\utility::get_cumulative_weights( var_1 );
    level.scr_anim["civilian_cellphone_walk"]["run_noncombat"][0] = %civilian_cellphonewalk;
    level.scr_anim["civilian_cellphone_walk"]["run_noncombat"][1] = %civilian_cellphonewalk_twitch;
    level.scr_anim["civilian_cellphone_walk"]["run_weights"] = var_2;
    level.scr_anim["civilian_cellphone_walk"]["dodge_left"] = %civilian_cellphonewalk_dodge_l;
    level.scr_anim["civilian_cellphone_walk"]["dodge_right"] = %civilian_cellphonewalk_dodge_r;
    level.scr_anim["civilian_cellphone_walk"]["turn_left_90"] = %civilian_cellphonewalk_turn_l;
    level.scr_anim["civilian_cellphone_walk"]["turn_right_90"] = %civilian_cellphonewalk_turn_r;
    level.scr_anim["civilian_hurried_walk"]["run_noncombat"][0] = %civilian_walk_hurried_1;
    level.scr_anim["civilian_hurried_walk"]["run_noncombat"][1] = %civilian_walk_hurried_2;
    level.scr_anim["civilian_cool_walk"]["run_noncombat"][0] = %civilian_walk_cool;
    level.scr_anim["civilian_briefcase_walk"]["run_noncombat"][0] = %civilian_briefcase_walk;
    level.scr_anim["civilian_briefcase_walk"]["dodge_left"] = %civilian_briefcase_walk_dodge_l;
    level.scr_anim["civilian_briefcase_walk"]["dodge_right"] = %civilian_briefcase_walk_dodge_r;
    level.scr_anim["civilian_briefcase_walk"]["turn_left_90"] = %civilian_briefcase_walk_turn_l;
    level.scr_anim["civilian_briefcase_walk"]["turn_right_90"] = %civilian_briefcase_walk_turn_r;
}

_id_C45B()
{
    level.scr_anim["generic"]["civilian_stand_idle"][0] = %civilian_stand_idle;
    level.scr_anim["generic"]["civilian_smoking_A"][0] = %civilian_smoking_a;
    level.scr_anim["generic"]["civilian_smoking_B"][0] = %civilian_smoking_b;
    level.scr_anim["generic"]["civilian_directions_1_A"][0] = %civilian_directions_1_a;
    level.scr_anim["generic"]["civilian_directions_1_B"][0] = %civilian_directions_1_b;
    level.scr_anim["generic"]["civilian_hackey_guy1"][0] = %civilian_hackey_guy1;
    level.scr_anim["generic"]["civilian_hackey_guy2"][0] = %civilian_hackey_guy2;
}

_id_CEA8()
{
    level.scr_anim["generic"]["bike_rider"] = %favela_bicycle_rider;
    level.scr_anim["makarov"]["opening_scene"] = %h2_favela_van_shootout_rojasassist;
    level.scr_anim["makarov"]["opening_scene_shoot"][0] = %favela_van_shootout_guy1_aimidle;
    level.scr_anim["makarov"]["opening_scene_flee"] = %favela_van_shootout_guy1_runaway;
    level.scr_anim["makarov"]["stand_fire"] = %pistol_stand_fire_a;
    level.scr_anim["gunner1"]["opening_scene"] = %h2_favela_van_shootout_guy2;
    level.scr_anim["gunner2"]["opening_scene"] = %h2_favela_van_shootout_guy3;
    level.scr_anim["driver"]["opening_scene"] = %h2_favela_van_shootout_guy4;
    level.scr_anim["generic"]["airport_civ_fear_drop_5"] = %airport_civ_fear_drop_5;
    level.scr_anim["generic"]["airport_civ_dying_groupA_kneel"] = %airport_civ_dying_groupa_kneel;
    level.scr_anim["generic"]["airport_civ_dying_groupA_lean"] = %airport_civ_dying_groupa_lean;
    level.scr_anim["driver"]["idle"][0] = %coup_driver_idle;
    level.scr_anim["driver"]["drive_and_die"] = %h2_favela_opening_driver;
    maps\_anim::addnotetrack_customfunction( "driver", "bullet hit", maps\favela::_id_BDED );
    maps\_anim::addnotetrack_customfunction( "driver", "steering hit", maps\favela::_id_C6D8 );
    level.scr_anim["curtain_pull"]["pulldown"] = %favela_curtain_pull;
    level.scr_anim["generic"]["window_smash"] = %window_melee;
    level.scr_anim["generic"]["civilian_window_1"] = %unarmed_shout_window_v2;
    level.scr_sound["generic"]["civilian_window_1"] = "civilian_window_shout_1";
    level.scr_anim["desert_eagle_guy"]["run"] = %unarmed_run_russian;
    level.scr_anim["generic"]["run_death_roll"] = %run_death_roll;
    level.scr_anim["generic"]["alley_death_fall"] = %civilian_run_2_crawldeath;
    level.scr_anim["generic"]["alley_death_fall_too_late"] = %run_death_flop_nodropgun;
    maps\_anim::addnotetrack_animsound( "generic", "alley_death_fall", "bodyfall large", "scn_favela_death_crawl" );
    level.scr_anim["meat"]["favela_warning_jump"] = %h2_favela_civ_warning_jump;
    level.scr_anim["meat"]["favela_warning_landing"] = %h2_favela_civ_warning_landing;
    level.scr_anim["mactavish"]["run_and_wave"] = %favela_run_and_wave;
    level.scr_anim["mactavish"]["intro"] = %h2_favela_opening_soap;
    level.scr_anim["mactavish"]["hit_by_car"] = %h2_favela_intersection_soap_crossing_slide;
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "hit_by_car", "favela_cmt_nonlethal" );
    level.scr_anim["faust"]["ending_takedown"] = %h2_favela_ending_rojas_tackled;
    level.scr_anim["mactavish"]["ending_takedown"] = %h2_favela_ending_soap_tackling;
    maps\_anim::addnotetrack_animsound( "mactavish", "ending_takedown", "break_glass", "scn_favela_npc_through_window" );
    maps\_anim::addnotetrack_customfunction( "mactavish", "break_glass", maps\favela_code::_id_B8CC );
    maps\_anim::addnotetrack_customfunction( "mactavish", "break_glass", maps\favela_code::_id_B692 );
    level.scr_anim["torture_enemy"]["torture"] = %h2_favela_torture_sequence_rojasassist;
    level.scr_anim["torture_friend1"]["torture"] = %h2_favela_torture_sequence_ghost;
    level.scr_anim["torture_friend2"]["torture"] = %h2_favela_torture_sequence_soap;
    level.scr_anim["torture_friend2"]["torture"] = %h2_favela_torture_sequence_soap_intro;
    level.scr_anim["torture_friend2"]["tortureOutro"] = %h2_favela_torture_sequence_soap;
    maps\_anim::addnotetrack_customfunction( "torture_friend2", "garage_door_closed", maps\favela_aud::_id_C514 );
    maps\_anim::addnotetrack_dialogue( "torture_friend2", "dialog", "tortureOutro", "favela_cmt_hidinginfav" );
    maps\_anim::addnotetrack_flag( "torture_friend2", "pull_start", "drop_door" );
    level.scr_anim["royce"]["torture"] = %h2_favela_torture_sequence_royce;
    level.scr_anim["generic"]["lean_none"] = %run_lowready_f;
    level.scr_anim["generic"]["lean_none_jog"] = %combat_jog;
    level.scr_anim["trailer"]["casual_stand_v2_twitch_talk"][0] = %casual_stand_v2_twitch_talk;
    level.scr_anim["generic"]["h2_civilian_close_shutter"] = %h2_civilian_close_shutter;
    level.scr_anim["faust"]["run"][0] = %rojas_unarmed_run;
    level.scr_anim["generic"]["hit_by_car"] = %h2_favela_intersection_civilian;
    level.scr_anim["driver"]["hit_by_car"] = %h2_favela_intersection_driver01;
    level.scr_anim["driver2"]["hit_by_car"] = %h2_favela_intersection_driver03;
}
#using_animtree("dog");

_id_B3AE()
{
    level.scr_anim["dog"]["fence_attack"] = %sniper_escape_dog_fence;
    level.scr_anim["dog"]["german_shepherd_idle"][0] = %german_shepherd_idle;
    level.scr_anim["dog"]["german_shepherd_eating_loop"][0] = %german_shepherd_eating_loop;
}
#using_animtree("vehicles");

vehicle_anims()
{
    level.scr_animtree["van"] = #animtree;
    level.scr_anim["van"]["opening_scene"] = %h2_favela_van_shootout_van;
    level.scr_animtree["car"] = #animtree;
    level.scr_anim["car"]["intro"] = %h2_favela_opening_car;
    level.scr_anim["car"]["hit_by_car"] = %h2_favela_intersection_car02;
    level.scr_animtree["car2"] = #animtree;
    level.scr_anim["car2"]["hit_by_car"] = %h2_favela_intersection_car03;
    level.scr_anim["car"]["ending_takedown"] = %favela_ending_car;
    maps\_anim::addnotetrack_animsound( "car", "ending_takedown", "window_shatter", "scn_favela_npc_car_landing" );
    maps\_anim::addnotetrack_customfunction( "car", "window_shatter", maps\favela_code::_id_B930 );
}
#using_animtree("player");

player_anims()
{
    level.scr_anim["player_rig"]["die"] = %h2_favela_opening_playerview_death;
    level.scr_anim["player_rig"]["duck_down"] = %h2_favela_opening_playerview_down;
    level.scr_anim["player_rig"]["duck_down_idle"][0] = %h2_favela_opening_playerview_downidle;
    level.scr_anim["player_rig"]["duck_up"] = %h2_favela_opening_playerview_up;
    level.scr_anim["player_rig"]["intro"] = %h2_favela_opening_playerview_intro;
    level.scr_anim["player_rig"]["idle"][0] = %h2_favela_opening_playerview_idle;
    level.scr_anim["player_rig"]["getout"] = %h2_favela_opening_playerview_getout;
    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_st_ar15_viewbody";
}
#using_animtree("script_model");

model_anims()
{
    level.scr_animtree["bike"] = #animtree;
    level.scr_anim["bike"]["pedal"] = %favela_bicycle;
    level.scr_animtree["curtain"] = #animtree;
    level.scr_model["curtain"] = "h2_curtain_torn01_animated";
    level.scr_anim["curtain"]["pulldown"] = %favela_curtain_model_pull;
    level.scr_animtree["chain"] = #animtree;
    level.scr_anim["chain"]["idle"][0] = %h2_fav_chained_lamps_soft_swing;
    level.scr_animtree["fan"] = #animtree;
    level.scr_anim["fan"]["idle"][0] = %fan_upright_tall_01_spin;
    level.scr_animtree["soccerball"] = #animtree;
    level.scr_model["soccerball"] = "h2_soccer_ball";
    level.scr_anim["soccerball"]["soccerball_for_guys"] = %h2_favela_civ_warning_ball_01;
    level.scr_anim["soccerball"]["soccerball_single_guy"] = %h2_favela_civ_warning_ball_02;
    maps\_anim::addnotetrack_notify( "soccerball", "start_ragdoll", "multi_soccerball", "soccerball_for_guys" );
    maps\_anim::addnotetrack_notify( "soccerball", "start_ragdoll", "single_soccerball", "soccerball_single_guy" );
    maps\_anim::addnotetrack_notify( "civilian_custom", "start_event", "soccer_start", "civ_playing_soccer_05" );
    level.scr_animtree["fence"] = #animtree;
    level.scr_model["fence"] = "h2_fav_soccer_fence_anim";
    level.scr_anim["fence"]["fence_shake"] = %h2_dog_fence;
    level.scr_animtree["flag1"] = #animtree;
    level.scr_anim["flag1"]["flag_idle"][0] = %h2_fav_brazil_flag_animated_01_idle;
    level.scr_anim["flag1"]["flag_idle"][1] = %h2_fav_brazil_flag_animated_01_wind1;
    level.scr_anim["flag1"]["flag_idle"][2] = %h2_fav_brazil_flag_animated_01_wind2;
    level.scr_animtree["flag2"] = #animtree;
    level.scr_anim["flag2"]["flag_idle"][0] = %h2_fav_brazil_flag_animated_02_idle;
    level.scr_anim["flag2"]["flag_idle"][1] = %h2_fav_brazil_flag_animated_02_wave;
    level.scr_model["chicken_anim"] = "chicken";
    level.scr_animtree["chicken_anim"] = #animtree;
    level.scr_anim["chicken_anim"]["crazy01"][0] = %chicken_cage_loop_01;
    level.scr_anim["chicken_anim"]["crazy02"][0] = %chicken_cage_loop_02;
    level.scr_anim["chicken_anim"]["pecking"][0] = %chicken_cage_pecking_idle;
    level.scr_anim["chicken_anim"]["seated"][0] = %chicken_cage_seated_idle;
    level.scr_anim["chicken_anim"]["death01"] = %chicken_cage_death;
    level.scr_anim["chicken_anim"]["death02"] = %chicken_cage_death_02;
    level.scr_model["torture_torch"] = "h2_fav_propane_blow_torch";
    level.scr_animtree["torture_torch"] = #animtree;
    level.scr_anim["torture_torch"]["torture"] = %h2_favela_torture_sequence_blowtorch;
    level.scr_model["torture_door"] = "h2_fav_garage_door_03_animated";
    level.scr_animtree["torture_door"] = #animtree;
    level.scr_anim["torture_door"]["tortureOutro"] = %h2_favela_torture_sequence_garagedoor;
    level.scr_animtree["h2_chains_02_without_attach_animated"] = #animtree;
    level.scr_model["h2_chains_02_without_attach_animated"] = "h2_chains_02_without_attach_animated";
    level.scr_anim["h2_chains_02_without_attach_animated"]["idle"][0] = %h2_gulag_hanging_chains_03;
    level.scr_animtree["h2_cs_chain_accessories_hanging_straight_short_01"] = #animtree;
    level.scr_model["h2_cs_chain_accessories_hanging_straight_short_01"] = "h2_cs_chain_accessories_hanging_straight_short_01";
    level.scr_anim["h2_cs_chain_accessories_hanging_straight_short_01"]["idle"][0] = %h2_gulag_hanging_chains_02;
    level.scr_animtree["h2_chains_alone_03_animated"] = #animtree;
    level.scr_model["h2_chains_alone_03_animated"] = "h2_chains_alone_03_animated";
    level.scr_anim["h2_chains_alone_03_animated"]["idle"][0] = %h2_chains_03_alone_animated;
    level.scr_model["pliers"] = "h2_fav_plier";
    level.scr_animtree["pliers"] = #animtree;
    level.scr_anim["pliers"]["torture"] = %h2_favela_torture_sequence_pliers;
    level.scr_model["goals"] = "h2_fav_soccer_goal_anim";
    level.scr_animtree["goals"] = #animtree;
    level.scr_anim["goals"]["soccer_goal"][0] = %h2_fav_soccer_goal_idle;
    level.scr_animtree["sheet_green"] = #animtree;
    level.scr_anim["sheet_green"]["sheet_green"] = %h2_hagging_clothes_sheet;
    level.scr_animtree["payphone"] = #animtree;
    level.scr_anim["payphone"]["opening_radiotower"] = %h2_favela_escape_opening_phone;
}

dialog()
{
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "intro", "favela_cmt_ready2move" );
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "intro", "favela_gst_good2go" );
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "intro", "favela_cmt_rogerthat" );
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "intro", "favela_cmt_inposition" );
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "intro", "favela_cmt_insight" );
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "intro", "favela_cmt_needhimalive" );
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "intro", "favela_cmt_getdown" );
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "intro", "favela_cmt_gettingaway" );
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "intro", "favela_cmt_driversdead" );
    level.scr_radio["favela_gst_onmyway"] = "favela_gst_onmyway";
    level.scr_radio["favela_gst_hesfast"] = "favela_gst_hesfast";
    level.scr_sound["mactavish"]["favela_cmt_nonlethal"] = "favela_cmt_nonlethal";
    level.scr_sound["mactavish"]["favela_cmt_takeshot"] = "favela_cmt_takeshot";
    level.scr_sound["mactavish"]["favela_cmt_hesdown"] = "favela_cmt_hesdown";
    maps\_anim::addnotetrack_dialogue( "royce", "dialog", "torture", "favela_ryc_letsgo" );
    level.scr_sound["royce"]["favela_ryc_watchyourbg"] = "favela_ryc_watchyourbg";
    level.scr_sound["royce"]["favela_ryc_warning"] = "favela_ryc_warning";
    level.scr_sound["meat"]["favela_met_rogerthat"] = "favela_met_rogerthat";
    level.scr_radio["favela_cmt_fullbattalion"] = "favela_cmt_fullbattalion";
    level.scr_radio["favela_ryc_withyou"] = "favela_ryc_withyou";
    level.scr_radio["favela_cmt_doingok"] = "favela_cmt_doingok";
    level.scr_radio["favela_ryc_nosign"] = "favela_ryc_nosign";
    level.scr_radio["favela_cmt_keepsearching"] = "favela_cmt_keepsearching";
    level.scr_radio["favela_ryc_moveup"] = "favela_ryc_moveup";
    level.scr_radio["favela_ryc_meatisdown"] = "favela_ryc_meatisdown";
    level.scr_radio["favela_ryc_imhit"] = "favela_ryc_imdown";
    level.scr_radio["favela_cmt_cuthimoff"] = "favela_cmt_cuthimoff";
    level.scr_radio["favela_cmt_keepgoing"] = "favela_cmt_keepgoing";
    level.scr_radio["favela_cmt_notime"] = "favela_cmt_notime";
    level.scr_radio["favela_cmt_watchrooftops"] = "favela_cmt_watchrooftops";
    level.scr_radio["favela_cmt_theirterritory"] = "favela_cmt_theirterritory";
    level.scr_radio["favela_cmt_stilltracking"] = "favela_cmt_stilltracking";
    level.scr_radio["favela_gst_duffelbag"] = "favela_gst_duffelbag";
    level.scr_radio["favela_cmt_intercept"] = "favela_cmt_intercept";
    level.scr_radio["favela_cmt_yourside"] = "favela_cmt_yourside";
    level.scr_radio["favela_gst_pinyoudown"] = "favela_gst_pinyoudown";
    level.scr_radio["favela_cmt_lostsightagain"] = "favela_cmt_lostsightagain";
    level.scr_radio["favela_gst_alleysbelow"] = "favela_gst_alleysbelow";
    level.scr_radio["favela_cmt_stayonhim"] = "favela_cmt_stayonhim";
    level.scr_radio["favela_gst_cuttingthru"] = "favela_gst_cuttingthru";
    level.scr_radio["favela_cmt_headforrooftops"] = "favela_cmt_headforrooftops";
    level.scr_radio["favela_gst_wayaround"] = "favela_gst_wayaround";
    level.scr_radio["favela_gst_halfklick"] = "favela_gst_halfklick";
    level.scr_radio["favela_cmt_eyeopen"] = "favela_cmt_eyeopen";
    level.scr_radio["favela_gst_legshot"] = "favela_gst_legshot";
    level.scr_radio["favela_cmt_donotengage"] = "favela_cmt_donotengage";
    level.scr_radio["favela_gst_rogerthat2"] = "favela_gst_rogerthat2";
    level.scr_radio["favela_cmt_spottedfaust"] = "favela_cmt_spottedfaust";
    level.scr_radio["favela_cmt_unharmed"] = "favela_cmt_unharmed";
    level.scr_radio["favela_cmt_cutoff"] = "favela_cmt_cutoff";
    level.scr_radio["favela_cmt_nowheretogo"] = "favela_cmt_nowheretogo";
    level.scr_radio["favela_cmt_traphimuphere"] = "favela_cmt_traphimuphere";
    level.scr_radio["favela_gst_jumpedfence"] = "favela_gst_jumpedfence";
    level.scr_radio["favela_cmt_goingleft"] = "favela_cmt_goingleft";
    level.scr_radio["favela_gst_whereishe"] = "favela_gst_whereishe";
    level.scr_radio["favela_cmt_slidingrooftops"] = "favela_cmt_slidingrooftops";
    level.scr_radio["favela_gst_anotherlegshot"] = "favela_gst_anotherlegshot";
    level.scr_radio["favela_cmt_carryhimback"] = "favela_cmt_carryhimback";
    level.scr_radio["favela_cmt_closertoyourpart"] = "favela_cmt_closertoyourpart";
    level.scr_radio["favela_cmt_motorcycle"] = "favela_cmt_motorcycle";
    level.scr_radio["favela_gst_nohesnot"] = "favela_gst_nohesnot";
    level.scr_radio["favela_cmt_dontshoothim"] = "favela_cmt_dontshoothim";
    level.scr_radio["favela_cmt_onthemove"] = "favela_cmt_onthemove";
    level.scr_radio["favela_cmt_anotherfence"] = "favela_cmt_anotherfence";
    level.scr_radio["favela_cmt_corraling"] = "favela_cmt_corraling";
    level.scr_radio["favela_cmt_backtowards"] = "favela_cmt_backtowards";
    level.scr_radio["favela_cmt_doubleback"] = "favela_cmt_doubleback";
    level.scr_radio["favela_cmt_farright"] = "favela_cmt_farright";
    level.scr_radio["favela_gst_rogerthat"] = "favela_gst_rogerthat";
    level.scr_radio["favela_gst_getaway"] = "favela_gst_getaway";
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "ending_takedown", "favela_cmt_nohesnot" );
    maps\_anim::addnotetrack_dialogue( "mactavish", "dialog", "ending_takedown", "favela_cmt_gotpackage" );
    level.scr_sound["generic"]["walla1"] = "favela_civ1_outofhere";
    level.scr_sound["generic"]["walla2"] = "favela_civ2_run";
    level.scr_sound["generic"]["walla3"] = "favela_civ3_kidsoutofhere";
    level.scr_sound["generic"]["walla4"] = "favela_civ4_carlarun";
    level.scr_sound["generic"]["walla5"] = "favela_civ1_policecoming";
    level.scr_sound["generic"]["walla6"] = "favela_civ2_surepolice";
    level.scr_sound["generic"]["walla7"] = "favela_civ3_notstaying";
    level.scr_sound["generic"]["walla8"] = "favela_civ4_policeraid";
    level.scr_sound["generic"]["walla9"] = "favela_civ1_ineshouse";
    level.scr_sound["generic"]["walla10"] = "favela_civ2_crossfire";
    level.scr_sound["generic"]["walla11"] = "favela_civ3_shootout";
    level.scr_sound["generic"]["walla12"] = "favela_civ4_otherside";
    level._id_BE90[0] = "walla1";
    level._id_BE90[1] = "walla2";
    level._id_BE90[2] = "walla3";
    level._id_BE90[3] = "walla4";
    level._id_BE90[4] = "walla5";
    level._id_BE90[5] = "walla6";
    level._id_BE90[6] = "walla7";
    level._id_BE90[7] = "walla8";
    level._id_BE90[8] = "walla9";
    level._id_BE90[9] = "walla10";
    level._id_BE90[10] = "walla11";
    level._id_BE90[11] = "walla12";
}
#using_animtree("animated_props");

_id_CA09()
{
    level.scr_animtree["shutter"] = #animtree;
    level.scr_model["shutter"] = "h2_fav_windows_shutter_right_01_anim";
    level.scr_model["shutter"] = "h2_fav_windows_shutter_left_01_anim";
    level.scr_anim["shutter"]["h2_civilian_close_shutter_l"] = %h2_civilian_close_shutter_l;
    level.scr_anim["shutter"]["h2_civilian_close_shutter_r"] = %h2_civilian_close_shutter_r;
    level.scr_animtree["window"] = #animtree;
    level.scr_model["window"] = "h2_fav_window_19_right_anim";
    level.scr_model["window"] = "h2_fav_window_19_left_anim";
    level.scr_anim["window"]["h2_fav_windows_right_open"] = %h2_fav_windows_right_open;
    level.scr_anim["window"]["h2_fav_windows_left_open"] = %h2_fav_windows_left_open;
}
#using_animtree("generic_human");

_id_B782()
{
    level.scr_anim["enemy_death"]["enemy_rooftop_death_a"] = %h2_favela_backalleys_death_rooftop_a;
    level.scr_anim["enemy_death"]["enemy_rooftop_death_b"] = %h2_favela_backalleys_death_rooftop_b;
    level.scr_anim["enemy_death"]["enemy_rooftop_death_c"] = %h2_favela_backalleys_death_rooftop_c;
    level.scr_anim["enemy_death"]["enemy_rooftop_death_d"] = %h2_favela_backalleys_death_rooftop_d;
    level.scr_anim["enemy_death"]["enemy_window_death_a"] = %h2_favela_backalleys_death_window_a;
    level.scr_anim["enemy_death"]["enemy_window_death_a_idle"] = %h2_favela_backalleys_death_window_a_idle;
    level.scr_anim["enemy_death"]["enemy_window_death_b"] = %h2_favela_backalleys_death_window_b;
    level.scr_anim["enemy_death"]["enemy_window_death_b_idle"] = %h2_favela_backalleys_death_window_b_idle;
}

_id_B771()
{
    level.scr_anim["civilian_custom"]["civ_playing_soccer_01"] = %h2_favela_civ_warning_civ01;
    level.scr_anim["civilian_custom"]["civ_playing_soccer_02"] = %h2_favela_civ_warning_civ02;
    level.scr_anim["civilian_custom"]["civ_playing_soccer_03"] = %h2_favela_civ_warning_civ03;
    level.scr_anim["civilian_custom"]["civ_playing_soccer_04"] = %h2_favela_civ_warning_civ04;
    level.scr_anim["civilian_custom"]["civ_chatting_01"] = %h2_favela_civ_warning_civ05;
    level.scr_anim["civilian_custom"]["civ_chatting_02"] = %h2_favela_civ_warning_civ06;
    level.scr_anim["civilian_custom"]["civ_playing_soccer_05"] = %h2_favela_civ_warning_civ07;
    level.scr_anim["civilian_custom"]["rojas_assistant_run_gun"] = %h2_favela_runnershootingback_accident;
    level.scr_anim["civilian_custom"]["rojas_assistant_run_gun_alley"] = %h2_favela_runnershootingback_alley;
    level.scr_anim["ghost"]["ending_takedown"] = %h2_favela_ending_ghost_shoulderradio;
    maps\_anim::addnotetrack_dialogue( "ghost", "dialog", "ending_takedown", "favela_gst_sendchopper" );
    maps\_anim::addnotetrack_dialogue( "ghost", "dialog", "ending_takedown", "favela_gst_skiesareclear" );
    maps\_anim::addnotetrack_dialogue( "ghost", "dialog", "ending_takedown", "favela_gst_onourown" );
    maps\_anim::addnotetrack_customfunction( "ghost", "mus_play_stinger_02", ::_id_B0E9, "ending_takedown" );
}

_id_B0E9( var_0 )
{
    maps\_utility::music_stop( 1.6 );
    level.player maps\_utility::play_sound_on_entity( "mus_favela_ending_stinger_02" );
}
