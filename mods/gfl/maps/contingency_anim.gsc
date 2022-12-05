// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A902()
{
    _id_B740();
    _id_B728();
    generic_human();
    dialog();
    vehicles();
    _id_C5A8();
    player_anims();
}

_id_C88D( var_0 )
{
    var_0 notify( "attach rocket" );
}

_id_C16A( var_0 )
{
    var_0 notify( "fire rocket" );
}

_id_B8DD( var_0 )
{
    var_0 notify( "drop rocket" );
}
#using_animtree("vehicles");

_id_B740()
{
    level.scr_anim["generic"]["boneyard_UAZ_door"] = %boneyard_uaz_door;
}

_id_CF42()
{
    var_0 = maps\_vehicle_aianim::getanimatemodel();
    var_0 setflaggedanimknob( "uaz_door_anim", level.scr_anim["generic"]["boneyard_UAZ_door"], 1, 0.2, 1 );
    var_0 waittillmatch( "uaz_door_anim", "end" );
    var_0 clearanim( level.scr_anim["generic"]["boneyard_UAZ_door"], 0 );
}
#using_animtree("player");

_id_B728()
{
    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_st_ar15_viewhands_player";
    level.scr_anim["player_rig"]["boneyard_uaz_mount"] = %boneyard_player_enter_uaz;
}
#using_animtree("generic_human");

generic_human()
{
    level.scr_anim["price"]["submarine"] = %h2_contingency_submarine_price;
    maps\_anim::addnotetrack_customfunction( "price", "price_open_sub_hatch", maps\contingency_aud::aud_price_open_sub_hatch, "submarine" );
    level.scr_anim["price"]["intro"] = %h2_contingency_price_intro;
    level.scr_anim["generic"]["cqb_stand_idle_scan"] = %patrol_bored_react_look_v1;
    level.scr_anim["price"]["ridge_in"] = %h2_contingency_price_ridge_in;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "ridge_in", "cont_pri_ridgeisperfect" );
    level.scr_anim["price"]["ridge_idle"][0] = %h2_contingency_price_ridge_idle;
    level.scr_anim["price"]["ridge_dialogue"] = %h2_contingency_price_ridge_dialog;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "ridge_dialogue", "cont_pri_controluav" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "ridge_dialogue", "cont_pri_bollocks" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "ridge_dialogue", "cont_pri_mobilesaminvillage" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "ridge_dialogue", "cont_pri_uavsharpish" );
    maps\_anim::addnotetrack_customfunction( "price", "dialog2", ::_id_BF9F, "ridge_dialogue", "cont_cmt_whathappened" );
    maps\_anim::addnotetrack_customfunction( "price", "activate_predator", maps\contingency::_id_BBF5, "ridge_dialogue" );
    level.scr_anim["price"]["running_slide"] = %h2_contingency_price_ridge_runandslide;
    level.scr_anim["price"]["slide"] = %h2_contingency_price_slide;
    level.scr_anim["price"]["pre_BTR"] = %h2_contingency_price_road_dialog;
    level.scr_anim["price"]["pre_BTR_idle"][0] = %h2_contingency_price_road_dialog_idle;
    level.scr_anim["price"]["price_run_in_wood"] = %h2_contingency_btrattack_price;
    level.scr_anim["price"]["price_run_in_wood_quick"] = %h2_contingency_btr_price_stop;
    level.scr_goaltime["price"]["price_run_in_wood_quick"] = 0.1;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "price_run_in_wood", "cont_pri_incoming" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "price_run_in_wood", "cont_pri_intothewoods" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "price_run_in_wood", "cont_pri_followme" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "price_run_in_wood_quick", "cont_pri_incoming" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "price_run_in_wood_quick", "cont_pri_intothewoods" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "price_run_in_wood_quick", "cont_pri_followme" );
    level.scr_anim["price"]["price_new_running"][0] = %h2_contingency_btrattack_sprint;
    level.scr_anim["generic"]["tear_gas_guy1"] = %contingency_teargas_1;
    level.scr_anim["generic"]["tear_gas_guy2"] = %contingency_teargas_2;
    level.scr_anim["generic"]["tear_gas_guy3"] = %contingency_teargas_3;
    maps\_anim::addnotetrack_customfunction( "price", "price_land", ::_id_BE41, "slide" );
    maps\_anim::addnotetrack_customfunction( "price", "price_land_settle", ::_id_D4E5, "slide" );
    maps\_anim::addnotetrack_customfunction( "price", "price_slide_start", ::_id_AF5D, "slide", [ "J_Ankle_LE" ] );
    maps\_anim::addnotetrack_customfunction( "price", "price_slide_end", ::_id_C251, "slide" );
    level.scr_anim["bricktop"]["at4_fire"] = %contengency_rocket_moment;
    maps\_anim::addnotetrack_customfunction( "bricktop", "attach rocket", ::_id_C88D, "at4_fire" );
    maps\_anim::addnotetrack_customfunction( "bricktop", "fire rocket", ::_id_C16A, "at4_fire" );
    maps\_anim::addnotetrack_customfunction( "bricktop", "drop rocket", ::_id_B8DD, "at4_fire" );
    level.scr_anim["rasta"]["at4_fire"] = %contengency_rocket_moment;
    maps\_anim::addnotetrack_customfunction( "rasta", "attach rocket", ::_id_C88D, "at4_fire" );
    maps\_anim::addnotetrack_customfunction( "rasta", "fire rocket", ::_id_C16A, "at4_fire" );
    maps\_anim::addnotetrack_customfunction( "rasta", "drop rocket", ::_id_B8DD, "at4_fire" );
    level.scr_anim["price"]["at4_fire"] = %contengency_rocket_moment;
    maps\_anim::addnotetrack_customfunction( "price", "attach rocket", ::_id_C88D, "at4_fire" );
    maps\_anim::addnotetrack_customfunction( "price", "fire rocket", ::_id_C16A, "at4_fire" );
    maps\_anim::addnotetrack_customfunction( "price", "drop rocket", ::_id_B8DD, "at4_fire" );
    maps\_hand_signals::inithandsignals();
    level.scr_anim["generic"]["_stealth_patrol_search_a"] = %patrolwalk_cold_gunup_idle;
    level.scr_anim["generic"]["_stealth_patrol_search_b"] = %patrolwalk_cold_gunup_idle;
    level.scr_anim["generic"]["_stealth_patrol_cqb"] = %patrolwalk_cold_gunup_idle;
    level.scr_anim["generic"]["patrol_cold_huddle"][0] = %patrolwalk_cold_huddle_idle;
    level.scr_anim["generic"]["patrol_cold_huddle"][1] = %patrolwalk_cold_huddle_twitch;
    level.scr_anim["generic"]["patrol_cold_huddle_pause"] = %patrolwalk_cold_huddle_stand_idle;
    level.scr_anim["generic"]["patrol_cold_huddle_stop"] = %patrolwalk_cold_huddle_walk2stand;
    level.scr_anim["generic"]["patrol_cold_huddle_start"] = %patrolwalk_cold_huddle_stand2walk;
    level.scr_anim["generic"]["patrol_cold_crossed"][0] = %patrolwalk_cold_crossed_idle;
    level.scr_anim["generic"]["patrol_cold_crossed"][1] = %patrolwalk_cold_crossed_twitch;
    level.scr_anim["generic"]["patrol_cold_crossed_pause"] = %patrolwalk_cold_crossed_stand_idle;
    level.scr_anim["generic"]["patrol_cold_crossed_stop"] = %patrolwalk_cold_crossed_walk2stand;
    level.scr_anim["generic"]["patrol_cold_crossed_start"] = %patrolwalk_cold_crossed_stand2walk;
    level.scr_anim["generic"]["sprint"] = %sprint1_loop;
    var_0 = [];
    var_0[0] = 8;
    var_0[1] = 2;
    level.scr_anim["generic"]["patrol_twitch_weights"] = common_scripts\utility::get_cumulative_weights( var_0 );
    level.scr_anim["generic"]["patrol_cold_gunup_search"] = %patrolwalk_cold_gunup_idle;
    level.scr_anim["generic"]["patrol_cold_gunup"][0] = %patrolwalk_cold_gunup_idle;
    level.scr_anim["generic"]["patrol_cold_gunup"][1] = %patrolwalk_cold_gunup_twitcha;
    level.scr_anim["generic"]["patrol_cold_gunup"][2] = %patrolwalk_cold_gunup_twitchb;
    var_0 = [];
    var_0[0] = 4;
    var_0[1] = 3;
    var_0[2] = 3;
    level.scr_anim["generic"]["patrol_gunup_twitch_weights"] = common_scripts\utility::get_cumulative_weights( var_0 );
    level.scr_anim["generic"]["truckride_climbin"] = %traverse_stepup_52;
    level.scr_anim["rasta"]["nuke_ending"] = %h2_contingency_ghost_nuke_reaction;
    maps\_anim::addnotetrack_dialogue( "rasta", "dialog", "nuke_ending", "cont_gst_youthere" );
    maps\_anim::addnotetrack_dialogue( "rasta", "dialog", "nuke_ending", "cont_gst_comein" );
    maps\_anim::addnotetrack_dialogue( "rasta", "dialog", "nuke_ending", "cont_gst_doyoucopy" );
    maps\_anim::addnotetrack_dialogue( "rasta", "dialog", "nuke_ending", "cont_gst_whatwait" );
    maps\_anim::addnotetrack_dialogue( "rasta", "dialog", "nuke_ending", "cont_gst_codeblack" );
}

_id_BF9F( var_0, var_1 )
{
    maps\_utility::radio_dialogue( var_1 );
}

_id_CBF0()
{
    level endon( "run_to_woods" );
    maps\_anim::anim_reach_solo( level.price, "caution_stop" );
    maps\_anim::anim_single_solo( level.price, "caution_stop" );
    level.price setgoalnode( self );
}
#using_animtree("vehicles");

vehicles()
{
    level.scr_anim["gauntlet"]["radar_spinup"] = %sa15_radar_spinup;
    level.scr_anim["gauntlet"]["radar_spinloop"] = %sa15_radar_spinloop;
    level.scr_anim["gauntlet"]["radar_spindown"] = %sa15_radar_spindown;
    level.scr_anim["gauntlet"]["turret_scanloop"] = %sa15_turret_scanloop;
    level.scr_animtree["contingency_btr_slide"] = #animtree;
    level.scr_anim["contingency_btr_slide"]["contingency_btr_slide"] = %h2_contingency_btrattack;
    level.scr_model["contingency_btr_slide"] = "vehicle_btr80_snow";
    maps\_anim::addnotetrack_customfunction( "contingency_btr_slide", "btr_fire", ::_id_CAE4, "contingency_btr_slide" );
}

_id_CAE4( var_0 )
{
    var_0 fireweapon();
    level notify( "btr_fired" );
}

_id_BE41( var_0 )
{
    var_1 = var_0 gettagorigin( "J_Ankle_RI" );
    var_1 = physicstrace( var_1 + ( 0.0, 0.0, 64.0 ), var_1 + ( 0.0, 0.0, -64.0 ) );
    playfx( level._effect["price_landing"], var_1 );
}

_id_D4E5( var_0 )
{
    var_1 = var_0 gettagorigin( "J_Ankle_LE" );
    var_1 = physicstrace( var_1 + ( 0.0, 0.0, 64.0 ), var_1 + ( 0.0, 0.0, -64.0 ) );
    playfx( level._effect["price_landing"], var_1 );
}

_id_AF5D( var_0, var_1 )
{
    var_0 endon( "stop_slide_fx" );
    var_0 endon( "death" );
    var_2 = var_1[0];

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "price_sliding" ), var_0, var_2 );
        wait 0.1;
    }
}

_id_C251( var_0 )
{
    var_0 notify( "stop_slide_fx" );
}

dialog()
{
    level.scr_radio["cont_pri_alertenemies"] = "cont_pri_alertenemies";
    level.scr_radio["cont_pri_foundabody"] = "cont_pri_foundabody";
    level.scr_radio["cont_pri_foundabody2"] = "cont_pri_foundabody2";
    level.scr_radio["cont_pri_letpass"] = "cont_pri_letpass";
    level.scr_radio["cont_pri_twoonleft"] = "cont_pri_twoonleft";
    level.scr_radio["cont_pri_slippast"] = "cont_pri_slippast";
    level.scr_radio["cont_pri_nicelydone"] = "cont_pri_nicelydone";
    level.scr_radio["cont_pri_welldone"] = "cont_pri_welldone";
    level.scr_radio["cont_pri_good"] = "cont_pri_good";
    level.scr_radio["cont_pri_seenbetter"] = "cont_pri_seenbetter";
    level.scr_radio["cont_pri_goodwork"] = "cont_pri_goodwork";
    level.scr_radio["cont_pri_impressive"] = "cont_pri_impressive";
    level.scr_radio["cont_pri_forasmoke"] = "cont_pri_forasmoke";
    level.scr_radio["cont_pri_twoinwoods"] = "cont_pri_twoinwoods";
    level.scr_radio["cont_pri_imready"] = "cont_pri_imready";
    level.scr_radio["cont_pri_endawar"] = "cont_pri_endawar";
    level.scr_sound["price"]["cont_pri_foundroach"] = "cont_pri_foundroach";
    level.scr_radio["cont_pri_foundroach"] = "cont_pri_foundroach";
    level.scr_sound["price"]["cont_pri_headnw"] = "cont_pri_headnw";
    level.scr_radio["cont_pri_headnw"] = "cont_pri_headnw";
    level.scr_radio["cont_cmt_fareast"] = "cont_cmt_fareast";
    level.scr_sound["price"]["cont_pri_proceed"] = "cont_pri_proceed";
    level.scr_radio["cont_pri_proceed"] = "cont_pri_proceed";
    level.scr_sound["price"]["cont_pri_foundtransport"] = "cont_pri_foundtransport";
    level.scr_radio["cont_pri_foundtransport"] = "cont_pri_foundtransport";
    level.scr_radio["cont_cmt_workingonit"] = "cont_cmt_workingonit";
    level.scr_radio["cont_pri_outofsight"] = "cont_pri_outofsight";
    level.scr_radio["cont_pri_30metersfront"] = "cont_pri_30metersfront";
    level.scr_radio["cont_pri_pickoffstragglers"] = "cont_pri_pickoffstragglers";
    level.scr_sound["price"]["cont_pri_convoycoming"] = "cont_pri_convoycoming";
    level.scr_radio["cont_pri_convoycoming"] = "cont_pri_convoycoming";
    level.scr_sound["price"]["cont_pri_letthempass"] = "cont_pri_letpass";
    level.scr_radio["cont_pri_letthempass"] = "cont_pri_letpass";
    level.scr_sound["price"]["cont_pri_intelwasoff"] = "cont_pri_intelwasoff";
    level.scr_radio["cont_pri_intelwasoff"] = "cont_pri_intelwasoff";
    level.scr_sound["price"]["cont_cmt_rogerthat"] = "cont_cmt_rogerthat";
    level.scr_radio["cont_cmt_rogerthat"] = "cont_cmt_rogerthat";
    level.scr_radio["cont_pri_yourparachute"] = "cont_pri_yourparachute";
    level.scr_radio["cont_pri_keepmoving"] = "cont_pri_keepmoving";
    level.scr_radio["cont_pri_getdown"] = "cont_pri_getdown";
    level.scr_radio["cont_pri_hugthewalls"] = "cont_pri_hugthewalls";
    level.scr_radio["cont_pri_thatwasclose"] = "cont_pri_thatwasclose";
    level.scr_radio["cont_pri_sittingducks"] = "cont_pri_sittingducks";
    level.scr_radio["cont_pri_goloud"] = "cont_pri_goloud";
    level.scr_radio["cont_pri_ontous"] = "cont_pri_ontous";
    level.scr_radio["cont_pri_werespotted"] = "cont_pri_werespotted";
    level.scr_radio["cont_pri_patience"] = "cont_pri_patience";
    level.scr_radio["cont_pri_sametime"] = "cont_pri_sametime";
    level.scr_radio["cont_pri_yourchance"] = "cont_pri_yourchance";
    level.scr_radio["cont_pri_dontgetclose"] = "cont_pri_dontgetclose";
    level.scr_radio["cont_pri_waitposition"] = "cont_pri_waitposition";
    level.scr_radio["cont_pri_waitforme"] = "cont_pri_waitforme";
    level.scr_radio["cont_pri_whenyoureready"] = "cont_pri_whenyoureready";
    level.scr_radio["cont_pri_getuskilled"] = "cont_pri_getuskilled";
    level.scr_radio["cont_pri_thewordstealth"] = "cont_pri_thewordstealth";
    level.scr_radio["cont_pri_giveawayposition"] = "cont_pri_giveawayposition";
    level.scr_radio["cont_pri_lowprofile"] = "cont_pri_lowprofile";
    level.scr_radio["cont_pri_moveup"] = "cont_pri_moveup";
    level.scr_radio["cont_pri_move"] = "cont_pri_move";
    level.scr_radio["cont_pri_hideinwoods"] = "cont_pri_hideinwoods";
    level.scr_radio["cont_pri_getintowoods"] = "cont_pri_getintowoods";
    level.scr_radio["cont_pri_theyrealerted"] = "cont_pri_theyrealerted";
    level.scr_radio["cont_pri_arentlooking"] = "cont_pri_arentlooking";
    level.scr_radio["cont_pri_splittingup"] = "cont_pri_splittingup";
    level.scr_radio["cont_pri_beautiful"] = "cont_pri_beautiful";
    level.scr_radio["cont_pri_goodshot"] = "cont_pri_goodshot";
    level.scr_radio["cont_pri_gotone"] = "cont_pri_gotone";
    level.scr_radio["cont_pri_hesdown2"] = "cont_pri_hesdown2";
    level.scr_radio["cont_pri_tangodown"] = "cont_pri_tangodown";
    level.scr_radio["cont_pri_goodnight"] = "cont_pri_goodnight";
    level.scr_radio["cont_pri_targeteliminated"] = "cont_pri_targeteliminated";
    level.scr_radio["cont_pri_targetdown"] = "cont_pri_targetdown";
    level.scr_radio["cont_pri_henoticed"] = "cont_pri_henoticed";
    level.scr_radio["cont_pri_getoutofsight"] = "cont_pri_getoutofsight";
    level.scr_radio["cont_pri_hidebeenalerted"] = "cont_pri_hidebeenalerted";
    level.scr_radio["cont_pri_hesalerted"] = "cont_pri_hesalerted";
    level.scr_radio["cont_pri_dogpatrol"] = "cont_pri_dogpatrol";
    level.scr_radio["cont_pri_3manpatrol"] = "cont_pri_3manpatrol";
    level.scr_radio["cont_pri_largepatrol12"] = "cont_pri_largepatrol12";
    level.scr_radio["cont_pri_anotherdogpatrol"] = "cont_pri_anotherdogpatrol";
    level.scr_radio["cont_pri_anotherpatrol"] = "cont_pri_anotherpatrol";
    level.scr_radio["cont_pri_yourcall"] = "cont_pri_yourcall";
    level.scr_radio["cont_pri_cantslipby"] = "cont_pri_cantslipby";
    level.scr_radio["cont_pri_outoraround"] = "cont_pri_outoraround";
    level.scr_sound["price"]["cont_pri_incoming"] = "cont_pri_incoming";
    level.scr_radio["cont_pri_incoming"] = "cont_pri_incoming";
    level.scr_radio["cont_pri_getdown2"] = "cont_pri_getdown2";
    level.scr_sound["price"]["cont_pri_intothewoods"] = "cont_pri_intothewoods";
    level.scr_radio["cont_pri_intothewoods"] = "cont_pri_intothewoods";
    level.scr_sound["price"]["cont_pri_followme"] = "cont_pri_followme";
    level.scr_radio["cont_pri_followme"] = "cont_pri_followme";
    level.scr_sound["price"]["cont_pri_slowdown"] = "cont_pri_slowdown";
    level.scr_radio["cont_pri_slowdown"] = "cont_pri_slowdown";
    level.scr_radio["cont_pri_hatedogs"] = "cont_pri_hatedogs";
    level.scr_radio["cont_pri_gotm"] = "cont_pri_gotm";
    level.scr_radio["cont_pri_hesdown"] = "cont_pri_hesdown";
    level.scr_radio["cont_pri_downboy"] = "cont_pri_downboy";
    level.scr_radio["cont_pri_naptime"] = "cont_pri_naptime";
    level.scr_sound["price"]["cont_pri_airsupport"] = "cont_pri_airsupport";
    level.scr_radio["cont_pri_airsupport"] = "cont_pri_airsupport";
    level.scr_radio["cont_cmt_almostinpos"] = "cont_cmt_almostinpos";
    level.scr_sound["price"]["cont_pri_rogerthat"] = "cont_pri_rogerthat";
    level.scr_radio["cont_pri_rogerthat"] = "cont_pri_rogerthat";
    level.scr_sound["price"]["cont_pri_ridgeisperfect"] = "cont_pri_ridgeisperfect";
    level.scr_radio["cont_pri_ridgeisperfect"] = "cont_pri_ridgeisperfect";
    level.scr_sound["price"]["cont_pri_controluav"] = "cont_pri_controluav";
    level.scr_radio["cont_pri_controluav"] = "cont_pri_controluav";
    level.scr_sound["price"]["cont_pri_bollocks"] = "cont_pri_bollocks";
    level.scr_radio["cont_pri_bollocks"] = "cont_pri_bollocks";
    level.scr_radio["cont_cmt_whathappened"] = "cont_cmt_whathappened";
    level.scr_sound["price"]["cont_pri_mobilesaminvillage"] = "cont_pri_mobilesaminvillage";
    level.scr_radio["cont_pri_mobilesaminvillage"] = "cont_pri_mobilesaminvillage";
    level.scr_sound["price"]["cont_pri_uavsharpish"] = "cont_pri_uavsharpish";
    level.scr_radio["cont_pri_uavsharpish"] = "cont_pri_uavsharpish";
    level.scr_sound["price"]["cont_pri_roachletsgo"] = "cont_pri_roachletsgo";
    level.scr_radio["cont_pri_roachletsgo"] = "cont_pri_roachletsgo";
    level.scr_sound["rasta"]["cont_rst_standback"] = "cont_rst_standback";
    level.scr_sound["rasta"]["cont_rst_getback"] = "cont_rst_getback";
    level.scr_sound["rasta"]["cont_rst_checkfire"] = "cont_rst_checkfire";
    level.scr_sound["price"]["cont_pri_nicework"] = "cont_pri_nicework";
    level.scr_sound["rasta"]["cont_rst_getmoving"] = "cont_rst_getmoving";
    level.scr_sound["price"]["cont_pri_grabweapon"] = "cont_pri_grabweapon";
    level.scr_sound["price"]["cont_pri_rastaandbricktop"] = "cont_pri_rastaandbricktop";
    level.scr_radio["cont_cmt_2nduav"] = "cont_cmt_2nduav";
    level.scr_sound["price"]["cont_pri_belowcrane"] = "cont_pri_belowcrane";
    level.scr_sound["price"]["cont_pri_softendefenses"] = "cont_pri_softendefenses";
    level.scr_radio["cont_cmt_gotattention"] = "cont_cmt_gotattention";
    level.scr_radio["cont_cmt_baseonalert"] = "cont_cmt_baseonalert";
    level.scr_radio["cont_cmt_betterhurry"] = "cont_cmt_betterhurry";
    level.scr_sound["price"]["cont_pri_weremoving"] = "cont_pri_weremoving";
    level.scr_radio["cont_cmt_halwaythere"] = "cont_cmt_halwaythere";
    level.scr_radio["cont_cmt_90secs"] = "cont_cmt_90secs";
    level.scr_radio["cont_cmt_60secs"] = "cont_cmt_60secs";
    level.scr_radio["cont_cmt_30secs"] = "cont_cmt_30secs";
    level.scr_sound["price"]["cont_pri_subwontwait"] = "cont_pri_subwontwait";
    level.scr_sound["price"]["cont_pri_gogogo"] = "cont_pri_gogogo";
    level.scr_sound["price"]["cont_pri_gettosub"] = "cont_pri_gettosub";
    level.scr_sound["price"]["cont_pri_reachedsub"] = "cont_pri_reachedsub";
    level.scr_radio["cont_cmt_rogerthat2"] = "cont_cmt_rogerthat2";
    level.scr_sound["price"]["cont_pri_getmaskon"] = "cont_pri_getmaskon";
    level.scr_sound["price"]["cont_pri_downthehatch"] = "cont_pri_downthehatch";
    level.scr_sound["price"]["cont_pri_needfewminutes"] = "cont_pri_needfewminutes";
    level.scr_radio["cont_cmt_eastgate"] = "cont_cmt_eastgate";
    level.scr_sound["price"]["cont_pri_copythatsoap"] = "cont_pri_copythatsoap";
    level.scr_sound["price"]["cont_pri_almostdone"] = "cont_pri_almostdone";
    level.scr_radio["cont_cmt_muchlonger"] = "cont_cmt_muchlonger";
    level.scr_sound["price"]["cont_pri_notsinking"] = "cont_pri_notsinking";
    level.scr_radio["cont_cmt_bloodyhell"] = "cont_cmt_bloodyhell";
    level.scr_sound["price"]["cont_pri_notime"] = "cont_pri_notime";
    level.scr_sound["price"]["cont_pri_runningout"] = "cont_pri_runningout";
    level.scr_sound["price"]["cont_pri_trustme"] = "cont_pri_trustme";
    level.scr_sound["price"]["cont_pri_donehereletsgo"] = "cont_pri_donehereletsgo";
    level.scr_sound["price"]["cont_pri_gettotruck"] = "cont_pri_gettotruck";
    level.scr_sound["price"]["cont_pri_endawar"] = "cont_pri_endawar";
    level.scr_sound["price"]["cont_pri_usehellfire"] = "cont_pri_usehellfire";
    level.scr_sound["price"]["cont_pri_takeoutheli"] = "cont_pri_takeoutheli";
    level.scr_radio["cont_pri_fivemen"] = "cont_pri_fivemen";
    level.scr_radio["cont_cmt_hatedogs"] = "cont_cmt_hatedogs";
    level.scr_radio["cont_pri_twoonright"] = "cont_pri_twoonright";
    level.scr_radio["cont_pri_searchingforus"] = "cont_pri_searchingforus";
    level.scr_sound["price"]["cont_pri_armoredvehicle"] = "cont_pri_armoredvehicle";
    level.scr_sound["price"]["cont_pri_goingforsub"] = "cont_pri_goingforsub";
    level.scr_sound["price"]["cont_pri_coverme"] = "cont_pri_coverme";
    level.scr_sound["rasta"]["cont_gst_rogerthat"] = "cont_gst_rogerthat";
    level.scr_sound["rasta"]["cont_gst_guardhouse"] = "cont_gst_guardhouse";
    level.scr_radio["cont_pri_insidesub"] = "cont_pri_insidesub";
    level.scr_sound["rasta"]["cont_gst_twotruckseast"] = "cont_gst_twotruckseast";
    level.scr_sound["rasta"]["cont_gst_morevehicleseast"] = "cont_gst_morevehicleseast";
    level.scr_sound["rasta"]["cont_gst_nexttosub"] = "cont_gst_nexttosub";
    level.scr_sound["rasta"]["cont_gst_youthere"] = "cont_gst_youthere";
    level.scr_sound["rasta"]["cont_gst_comein"] = "cont_gst_comein";
    level.scr_sound["rasta"]["cont_gst_doyoucopy"] = "cont_gst_doyoucopy";
    level.scr_radio["cont_pri_good2"] = "cont_pri_good2";
    level.scr_sound["rasta"]["cont_gst_whatwait"] = "cont_gst_whatwait";
    level.scr_sound["rasta"]["cont_gst_codeblack"] = "cont_gst_codeblack";
    level.scr_sound["rasta"]["cont_gst_whathaveyoudone"] = "cont_gst_whathaveyoudone";
    level.scr_radio["cont_pri_russiandogs"] = "cont_pri_russiandogs";
    level.scr_radio["cont_cmt_haveyouback"] = "cont_cmt_haveyouback";
    level.scr_radio["cont_pri_rogerthat2"] = "cont_pri_rogerthat2";
    level.scr_radio["cont_cmt_directhitshelo"] = "cont_cmt_directhitshelo";
    level.scr_radio["cont_cmt_btrdestroyed"] = "cont_cmt_btrdestroyed";
    level.scr_radio["cont_cmt_directhitjeep"] = "cont_cmt_directhitjeep";
    level.scr_radio["cont_cmt_goodkilltruck"] = "cont_cmt_goodkilltruck";
    level.scr_radio["cont_cmt_goodhitvehicles"] = "cont_cmt_goodhitvehicles";
    level.scr_radio["cont_cmt_goodeffectkia"] = "cont_cmt_goodeffectkia";
    level.scr_radio["cont_cmt_fivepluskias"] = "cont_cmt_fivepluskias";
    level.scr_radio["cont_cmt_mutlipleconfirmed"] = "cont_cmt_mutlipleconfirmed";
    level.scr_radio["cont_cmt_3kills"] = "cont_cmt_3kills";
    level.scr_radio["cont_cmt_theyredown"] = "cont_cmt_theyredown";
    level.scr_radio["cont_cmt_directhit"] = "cont_cmt_directhit";
    level.scr_radio["cont_cmt_hesdown"] = "cont_cmt_hesdown";
    level._id_AE8C = 1;
    level.scr_radio["uav_reloading"] = "cont_cmt_rearmhellfires";
    level.scr_radio["uav_offline"] = "cont_cmt_hellfiresoffline";
    level.scr_radio["uav_online"] = "cont_cmt_hellfireonline";
    level.scr_radio["uav_online_repeat"] = "cont_cmt_repeatonline";
    level.scr_radio["uav_down"] = "cont_cmt_predatordown";
    level.scr_radio["cont_cmt_barelysee"] = "cont_cmt_barelysee";
    level.scr_sound["price"]["cont_pri_strobes"] = "cont_pri_strobes";
}
#using_animtree("script_model");

_id_C5A8()
{
    level.scr_animtree["tree_snow_tall"] = #animtree;
    level.scr_anim["tree_snow_tall"]["idle_slow"][0] = %h2_foliage_contingency_snow_tall_slowidle;
    level.scr_anim["tree_snow_tall"]["fall_broken"] = %h2_foliage_contingency_snow_tall_broken_fall;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_01"] = %h2_contingency_falling_tree_01;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_02"] = %h2_contingency_falling_tree_02;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_03"] = %h2_contingency_falling_tree_03;
    maps\_anim::addnotetrack_customfunction( "tree_snow_tall", "kill_player", maps\contingency::h2_tree_hit_ground_check, "h2_contingency_falling_tree_03" );
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_05"] = %h2_contingency_falling_tree_05;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_10"] = %h2_contingency_falling_tree_10;
    maps\_anim::addnotetrack_customfunction( "tree_snow_tall", "kill_player", maps\contingency::h2_tree_hit_ground_check, "h2_contingency_falling_tree_10" );
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_11"] = %h2_contingency_falling_tree_11;
    maps\_anim::addnotetrack_customfunction( "tree_snow_tall", "kill_player", maps\contingency::h2_tree_hit_ground_check, "h2_contingency_falling_tree_11" );
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_12"] = %h2_contingency_falling_tree_12;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_13"] = %h2_contingency_falling_tree_13;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_14"] = %h2_contingency_falling_tree_14;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_15"] = %h2_contingency_falling_tree_15;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_16"] = %h2_contingency_falling_tree_16;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_17"] = %h2_contingency_falling_tree_17;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_18"] = %h2_contingency_falling_tree_18;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_19"] = %h2_contingency_falling_tree_19;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_20"] = %h2_contingency_falling_tree_20;
    level.scr_anim["tree_snow_tall"]["h2_contingency_falling_tree_21"] = %h2_contingency_falling_tree_21;
    level.scr_animtree["tree_snow_mid"] = #animtree;
    level.scr_anim["tree_snow_mid"]["idle_slow"][0] = %h2_foliage_contingency_snow_tall_slowidle;
    level.scr_anim["tree_snow_mid"]["h2_contingency_falling_tree_04"] = %h2_contingency_falling_tree_04;
    maps\_anim::addnotetrack_customfunction( "tree_snow_mid", "kill_player", maps\contingency::h2_tree_hit_ground_check, "h2_contingency_falling_tree_04" );
    level.scr_anim["tree_snow_mid"]["h2_contingency_falling_tree_06"] = %h2_contingency_falling_tree_06;
    level.scr_anim["tree_snow_mid"]["h2_contingency_falling_tree_07"] = %h2_contingency_falling_tree_07;
    level.scr_anim["tree_snow_mid"]["h2_contingency_falling_tree_08"] = %h2_contingency_falling_tree_08;
    maps\_anim::addnotetrack_customfunction( "tree_snow_mid", "kill_player", maps\contingency::h2_tree_hit_ground_check, "h2_contingency_falling_tree_08" );
    level.scr_anim["tree_snow_mid"]["h2_contingency_falling_tree_09"] = %h2_contingency_falling_tree_09;
    maps\_anim::addnotetrack_customfunction( "tree_snow_mid", "kill_player", maps\contingency::h2_tree_hit_ground_check, "h2_contingency_falling_tree_09" );
    level.scr_animtree["tree_snow_react"] = #animtree;
    level.scr_anim["tree_snow_react"]["idle_slow"][0] = %h2_foliage_contingency_snow_tall_slowidle;
    level.scr_anim["tree_snow_react"]["h2_contingency_shake_tree"] = %h2_contingency_shake_tree;
    level.scr_animtree["hatch"] = #animtree;
    level.scr_anim["hatch"]["hatch_anim"] = %h2_contingency_submarine_hatchdoor;
    level.scr_animtree["animated_cable"] = #animtree;
    level.scr_anim["animated_cable"]["crane_idle"][0] = %h2_con_crane_05_idle;
    level.scr_animtree["bushes"] = #animtree;
    level.scr_anim["bushes"]["bushes_shuffle"] = %h2_contingency_bushes_shuffle;
    level.scr_anim["bushes"]["bushes_idle"] = %h2_contingency_bushes_idle;
    level.scr_anim["bushes"]["bushes_shuffle_add_loop"] = %h2_contingency_bushes_add_loop;
    level.scr_anim["bushes"]["bushes_shuffle_add_loop_anim"] = %h2_contingency_bushes_walkthroughshuffle;
    level.scr_animtree["parachute"] = #animtree;
    level.scr_anim["parachute"]["hanging_idle"] = %h2_invasion_parachute_hanging_idle;
    level.scr_animtree["ice_chunk"] = #animtree;
    level.scr_anim["ice_chunk"]["h2_gulag_ice_chunk_01_idle"][0] = %h2_gulag_ice_chunk_01_idle;
    level.scr_anim["ice_chunk"]["h2_gulag_ice_chunk_02_idle"][0] = %h2_gulag_ice_chunk_02_idle;
    level.scr_anim["ice_chunk"]["h2_gulag_ice_chunk_03_idle"][0] = %h2_gulag_ice_chunk_03_idle;
    level.scr_anim["ice_chunk"]["h2_gulag_ice_chunk_04_idle"][0] = %h2_gulag_ice_chunk_04_idle;
    level.scr_anim["ice_chunk"]["h2_gulag_ice_chunk_05_idle"][0] = %h2_gulag_ice_chunk_05_idle;
    level.scr_anim["ice_chunk"]["h2_gulag_ice_chunk_06_idle"][0] = %h2_gulag_ice_chunk_06_idle;
    level.scr_anim["ice_chunk"]["h2_gulag_ice_chunk_07_idle"][0] = %h2_gulag_ice_chunk_07_idle;
    level.scr_anim["ice_chunk"]["h2_gulag_ice_chunk_08_idle"][0] = %h2_gulag_ice_chunk_08_idle;
    level.scr_animtree["animated_buoy"] = #animtree;
    level.scr_anim["animated_buoy"]["h2_contingency_buoy_idle"][0] = %h2_contingency_buoy_idle;
    level.scr_anim["animated_buoy"]["h2_contingency_buoy_idle_calm"][0] = %h2_contingency_buoy_idle_calm;
    level.scr_anim["animated_buoy"]["h2_contingency_small_buoy_idle"][0] = %h2_contingency_small_buoy_idle;
    level.scr_anim["animated_buoy"]["h2_contingency_small_buoy_idle_calm"][0] = %h2_contingency_small_buoy_idle_calm;
}
#using_animtree("player");

player_anims()
{
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_st_ar15_viewbody";
    level.scr_anim["worldbody"]["slide_in"] = %h2_contingency_slide_player_in;
    level.scr_anim["worldbody"]["slide_loop"][0] = %h2_contingency_slide_player_idle;
    level.scr_anim["worldbody"]["slide_out"] = %h2_contingency_slide_player_out;
    level.scr_anim["worldbody"]["slide_back_loop"][0] = %h2_cliffhanger_slide_back;
    level.scr_anim["worldbody"]["slide_back_in"] = %h2_cliffhanger_slide_back_in;
    level.scr_anim["worldbody"]["slide_back_out"] = %h2_cliffhanger_slide_back_out;
    level.scr_anim["worldbody"]["slide_ar"] = %h2_contingency_slide_player_turnl;
    level.scr_anim["worldbody"]["slide_al"] = %h2_contingency_slide_player_turnr;
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_start", ::_id_AF5D, "slide_in", [ "tag_origin" ] );
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_end", ::_id_C251, "slide_out" );
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_end", ::_id_C251, "slide_back_out" );
}
