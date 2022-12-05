// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody_uaz" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );
    maps\_load::set_player_viewhand_model( "h2_gfl_m4_sopmod_ii_viewhands_player" );

    _id_B740();
    _id_B728();
    script_model_animation();
    dialogue();
    c130_anims();
    _id_ACDD();
    level.scr_anim["generic"]["prone_2_stand"] = %prone_2_stand;
    level.scr_anim["rook"]["boneyard_driver_death"] = %h2_boneyard_driver_death;
    level.scr_anim["rook"]["boneyard_driver_death_pushed"] = %h2_boneyard_driver_death_pushed;
    level.scr_anim["rook"]["jeep_ride_driver"] = %h2_boneyard_jeep_ride_driver;
    level.scr_anim["rook"]["jeep_evac_driver"] = %h2_boneyard_jeep_evac_driver;
    level.scr_anim["price"]["boneyard_jeep_ride_price"] = %h2_boneyard_jeep_ride_price;
    maps\_anim::addnotetrack_customfunction( "price", "pri_dialog_01", ::play_price_jeep_ride_vo, "boneyard_jeep_ride_price", "byard_pri_thedrivers" );
    maps\_anim::addnotetrack_customfunction( "price", "pri_dialog_02", ::play_price_jeep_ride_vo, "boneyard_jeep_ride_price", "byard_pri_hangon" );
    maps\_anim::addnotetrack_customfunction( "price", "pri_dialog_03", ::play_price_jeep_ride_vo, "boneyard_jeep_ride_price", "byard_pri_behindus" );
    maps\_anim::addnotetrack_customfunction( "price", "pri_dialog_04", ::play_price_jeep_ride_vo, "boneyard_jeep_ride_price", "byard_pri_rightside" );
    maps\_anim::addnotetrack_customfunction( "price", "pri_dialog_05", ::play_price_jeep_ride_vo, "boneyard_jeep_ride_price", "byard_pri_holdon" );
    maps\_anim::addnotetrack_customfunction( "price", "pri_dialog_06", ::play_price_jeep_ride_vo, "boneyard_jeep_ride_price", "byard_pri_droptheramp" );
    maps\_anim::addnotetrack_customfunction( "price", "pri_dialog_07", ::play_price_jeep_ride_vo, "boneyard_jeep_ride_price", "byard_pri_vehiclesat12" );
    maps\_anim::addnotetrack_customfunction( "price", "pri_dialog_08", ::play_price_jeep_ride_vo, "boneyard_jeep_ride_price", "byard_pri_takewheel" );
    maps\_anim::addnotetrack_customfunction( "price", "dialog2", ::playvoprice, "boneyard_jeep_ride_price" );
}

dialogue()
{
    level.scr_radio["byard_pri_wipeoutus"] = "byard_pri_wipeoutus";
    level.scr_radio["byard_pri_backupplan"] = "byard_pri_backupplan";
    level.scr_radio["byard_pri_lzishot"] = "byard_pri_lzishot";
    level.scr_radio["byard_pri_sharpish"] = "byard_pri_sharpish";
    level.scr_radio["byard_pri_gettransport"] = "byard_pri_gettransport";
    level.scr_radio["byard_pri_headnorth"] = "byard_pri_headnorth";
    level.scr_radio["byard_pri_radiotraffic"] = "byard_pri_radiotraffic";
    level.scr_radio["byard_pri_contactmakarov"] = "byard_pri_contactmakarov";
    level.scr_radio["byard_pri_warhero"] = "byard_pri_warhero";
    level.scr_radio["byard_pri_takecareofrest"] = "byard_pri_takecareofrest";
    level.scr_radio["byard_pri_onthischannel"] = "byard_pri_onthischannel";
    level.scr_radio["byard_pri_lastaweek"] = "byard_pri_lastaweek";
    level.scr_radio["byard_pri_myfriend"] = "byard_pri_myfriend";
    level.scr_radio["byard_pri_myregards"] = "byard_pri_myregards";
    level.scr_radio["byard_pri_whereareyou"] = "byard_pri_whereareyou";
    level.scr_radio["byard_pri_landtheplane"] = "byard_pri_landtheplane";
    level.scr_radio["byard_pri_gettoplane"] = "byard_pri_gettoplane";
    level.scr_radio["byard_pri_muchtime"] = "byard_pri_muchtime";
    level.scr_radio["byard_pri_foudntransport"] = "byard_pri_foudntransport";
    level.scr_sound["price"]["byard_pri_getinjeep"] = "byard_pri_getinjeep";
    level.scr_sound["price"]["byard_pri_contact12"] = "byard_pri_contact12";
    level.scr_sound["price"]["byard_pri_contactahead"] = "byard_pri_contactahead";
    level.scr_sound["price"]["byard_pri_behindus"] = "byard_pri_behindus";
    level.scr_sound["price"]["byard_pri_onour6"] = "byard_pri_onour6";
    level.scr_sound["price"]["byard_pri_totheright"] = "byard_pri_totheright";
    level.scr_sound["price"]["byard_pri_rightside"] = "byard_pri_rightside";
    level.scr_sound["price"]["byard_pri_totheleft"] = "byard_pri_totheleft";
    level.scr_sound["price"]["byard_pri_ontheleft"] = "byard_pri_ontheleft";
    level.scr_sound["price"]["byard_pri_vehiclesat12"] = "byard_pri_vehiclesat12";
    level.scr_sound["price"]["byard_pri_vehicleson6"] = "byard_pri_vehicleson6";
    level.scr_sound["price"]["byard_pri_thedrivers"] = "byard_pri_thedrivers";
    level.scr_sound["price"]["byard_pri_hangon"] = "byard_pri_hangon";
    level.scr_sound["price"]["byard_pri_holdon"] = "byard_pri_holdon";
    level.scr_sound["price"]["byard_pri_takewheel"] = "byard_pri_takewheel";
    level.scr_sound["price"]["byard_pri_droptheramp"] = "byard_pri_droptheramp";
    level.scr_face["price"]["byard_pri_droptheramp"] = %byard_pri_droptheramp;
    level.scr_sound["price"]["byard_pri_aimforramp"] = "byard_pri_aimforramp";
    level.scr_sound["price"]["byard_pri_weareleaving"] = "byard_pri_weareleaving";
    level.scr_radio["byard_mkv_neitherwillyou"] = "byard_mkv_neitherwillyou";
    level.scr_radio["byard_mkv_cutsbothways"] = "byard_mkv_cutsbothways";
    level.scr_radio["byard_mkv_hotelbravo"] = "byard_mkv_hotelbravo";
    level.scr_radio["byard_nkl_ontheway"] = "byard_nkl_ontheway";
    level.scr_radio["byard_nkl_sandstorms"] = "byard_nkl_sandstorms";
    level.scr_radio["byard_nkl_unsafetoland"] = "byard_nkl_unsafetoland";
    level.scr_radio["byard_nkl_paidenough"] = "byard_nkl_paidenough";
    level.scr_radio["byard_nkl_oneminute"] = "byard_nkl_oneminute";
}

_id_ACDD()
{
    maps\_vehicle::_id_CCF4( "script_vehicle_uaz_open_destructible", ::_id_BCD0, ::_id_AD49 );
    maps\_vehicle::_id_BCB7( "script_vehicle_uaz_open_destructible", maps\boneyard_code::_id_CFFD );
    maps\_vehicle::_id_CCF4( "script_vehicle_pickup_roobars_physics", ::_id_B7AE, ::_id_D387 );
    maps\_vehicle::_id_CCF4( "script_vehicle_suburban_technical", ::_id_ACB1, _id_D3FE::set_vehicle_anims );
    maps\_vehicle::_id_CCF4( "script_vehicle_suburban", ::_id_D277, _id_ADD8::set_vehicle_anims );
}

_id_B7AE()
{
    var_0 = _id_BE7B::setanims();
    var_0[1].sittag = "tag_guy3";
    var_0[3].sittag = "tag_guy2";
    var_0[4].sittag = "tag_passenger";
    var_0[4].idle = %technical_passenger_idle;
    var_0[4].getout = %pickup_passenger_climb_out;
    return var_0;
}

_id_ACB1()
{
    var_0 = _id_D3FE::setanims();
    var_0 = _id_BE6C( var_0 );
    return var_0;
}

_id_D277()
{
    var_0 = _id_ADD8::setanims();
    var_0 = _id_BE6C( var_0 );
    var_0[1].death = %uaz_rear_driver_death;
    var_0[2].death = %uaz_rear_driver_death;
    var_0[3].death = %uaz_rear_driver_death;
    return var_0;
}

_id_BE6C( var_0 )
{
    var_0[1]._id_D077[0] = %uaz_rguy_scan_side_v1;
    var_0[1]._id_D077[1] = %uaz_rguy_scan_side_v1;
    var_0[1]._id_ABD8[0] = 500;
    var_0[1]._id_ABD8[1] = 500;
    var_0[2]._id_D077[0] = %uaz_rguy_scan_side_v1;
    var_0[2]._id_D077[1] = %uaz_rguy_scan_side_v1;
    var_0[2]._id_ABD8[0] = 500;
    var_0[2]._id_ABD8[1] = 500;
    var_0[3]._id_D077[0] = %uaz_lguy_fire_side_v1;
    var_0[3]._id_D077[1] = %uaz_lguy_fire_side_v2;
    var_0[3]._id_ABD8[0] = 500;
    var_0[3]._id_ABD8[1] = 500;
    return var_0;
}

_id_BCD0()
{
    var_0 = _id_C782::setanims();
    var_0[0].sittag = "tag_driver";
    var_0[1].sittag = "tag_passenger";
    var_0[2].sittag = "tag_guy0";
    var_0[3].sittag = "tag_guy1";
    var_0[4].sittag = "tag_guy2";
    var_0[5].sittag = "tag_guy3";
    var_0[0].idle = %uaz_driver_idle;
    var_0[0].getout = %uaz_driver_exit_into_stand;
    var_0[2].getout = %uaz_driver_exit_into_run;
    var_0[0].getin = %uaz_driver_enter_from_huntedrun;
    var_0[2].idle = [];
    var_0[2].idle[0] = %uaz_lguy_idle_hide;
    var_0[2].idle[1] = %uaz_lguy_idle_react;
    var_0[2].idleoccurrence[0] = 1000;
    var_0[2].idleoccurrence[1] = 100;
    var_0[2]._id_D3D7 = %uaz_lguy_trans_hide2back;
    var_0[2]._id_C042 = %uaz_lguy_fire_back;
    var_0[2]._id_D1EA = %uaz_lguy_trans_back2hide;
    var_0[2]._id_B94E = %uaz_lguy_fire_hide_forward;
    var_0[2]._id_D077[0] = %uaz_lguy_fire_side_v1;
    var_0[2]._id_D077[1] = %uaz_lguy_fire_side_v2;
    var_0[2]._id_ABD8[0] = 500;
    var_0[2]._id_ABD8[1] = 500;
    var_0[2]._id_C8B2[0] = %uaz_lguy_standfire_side_v3;
    var_0[2]._id_C8B2[1] = %uaz_lguy_standfire_side_v4;
    var_0[2]._id_B304[0] = 100;
    var_0[2]._id_B304[1] = 100;
    var_0[2]._id_B2CF[0] = %uaz_lguy_fire_hide_back_v1;
    var_0[2]._id_B2CF[1] = %uaz_lguy_fire_hide_back_v2;
    var_0[2]._id_BE1A[0] = 500;
    var_0[2]._id_BE1A[1] = 500;
    var_0[2]._id_A8AA = %uaz_lguy_idle_react;
    var_0[0].duck_once = %uaz_driver_duck;
    var_0[0].turn_right = %uaz_driver_turnright;
    var_0[0].turn_left = %uaz_driver_turnleft;
    var_0[0].weave = %uaz_driver_weave;
    return var_0;
}
#using_animtree("vehicles");

_id_AD49( var_0 )
{
    var_0 = _id_C782::set_vehicle_anims( var_0 );
    var_0[0].vehicle_idle = %uaz_steeringwheel_idle;
    var_0[0].vehicle_duck_once = %uaz_steeringwheel_duck;
    var_0[0].vehicle_turn_left = %uaz_steeringwheel_turnleft;
    var_0[0].vehicle_turn_right = %uaz_steeringwheel_turnright;
    var_0[0].vehicle_weave = %uaz_steeringwheel_weave;
    var_0[2].vehicle_getoutanim = %uaz_rear_driver_exit_into_run_door;
    var_0[3].vehicle_getoutanim = %uaz_passenger2_exit_into_run_door;
    return var_0;
}

_id_D387( var_0 )
{
    var_0[0].vehicle_getoutanim = %door_pickup_driver_climb_out;
    var_0[1].vehicle_getoutanim = %door_pickup_passenger_climb_out;
    var_0[2].vehicle_getoutanim = %door_pickup_passenger_rr_climb_out;
    var_0[3].vehicle_getoutanim = %door_pickup_passenger_rl_climb_out;
    var_0[4].vehicle_getoutanim = %door_pickup_passenger_climb_out;
    var_0[0].vehicle_getoutanim_clear = 0;
    var_0[1].vehicle_getoutanim_clear = 0;
    var_0[2].vehicle_getoutanim_clear = 0;
    var_0[3].vehicle_getoutanim_clear = 0;
    var_0[4].vehicle_getoutanim_clear = 0;
    var_0[0].vehicle_getinanim = %door_pickup_driver_climb_in;
    var_0[1].vehicle_getinanim = %door_pickup_passenger_climb_in;
    return var_0;
}

_id_B740()
{
    level.scr_anim["c130_propeller"]["rotate"][0] = %rotate_x_r;
    level.scr_animtree["c130_propeller"] = #animtree;
    level.scr_anim["generic"]["boneyard_jeep_evac"] = %boneyard_jeep_evac;
    level.scr_anim["generic"]["boneyard_UAZ_door"] = %boneyard_uaz_door;
    level.scr_anim["generic"]["steer_straight"] = %h2_boneyard_uaz_steer_straight;
    level.scr_anim["generic"]["steer_left"] = %h2_boneyard_uaz_steer_left;
    level.scr_anim["generic"]["steer_right"] = %h2_boneyard_uaz_steer_right;
    level.scr_anim["generic"]["jeep_ride_vehicle"] = %h2_boneyard_jeep_ride_vehicle;
    level.scr_anim["generic"]["jeep_evac_vehicle"] = %h2_boneyard_jeep_evac_vehicle;
    level.scr_anim["generic"]["old_steering"] = %uaz_steeringwheel_idle;
}

c130_anims()
{
    level.scr_animtree["nikolai"] = #animtree;
    level.scr_model["nikolai"] = "h2_gfl_dima_body";
    level.scr_anim["nikolai"]["nikolai_idle"][0] = %cobra_copilot_idle;
}
#using_animtree("player");

_id_B728()
{
    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_m4_sopmod_ii_viewhands_player";
    level.scr_anim["player_rig"]["boneyard_uaz_sit"] = %boneyard_player_uaz_sit;
    level.scr_anim["player_rig"]["boneyard_uaz_stand"] = %boneyard_player_uaz_stand;
    level.scr_anim["player_rig"]["boneyard_uaz_mount"] = %boneyard_player_enter_uaz;
    level.scr_anim["player_rig"]["boneyard_player_evac"] = %boneyard_player_evac;
    level.scr_anim["player_rig"]["grab_wheel"] = %h2_boneyard_player_grab_wheel;
    level.scr_anim["player_rig"]["steer_straight"] = %h2_boneyard_player_steer_straight;
    level.scr_anim["player_rig"]["steer_left"] = %h2_boneyard_player_steer_left;
    level.scr_anim["player_rig"]["steer_right"] = %h2_boneyard_player_steer_right;
    level.scr_anim["player_rig"]["jeep_evac"] = %h2_boneyard_jeep_evac;
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_anim["worldbody"]["jeep_evac"] = %h2_boneyard_jeep_evac;
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_anim["worldbody"]["slide_in"] = %h2_cliffhanger_slide_in;
    level.scr_anim["worldbody"]["slide_loop"][0] = %h2_cliffhanger_slide_idle;
    level.scr_anim["worldbody"]["slide_out"] = %h2_cliffhanger_slide_out;
    level.scr_anim["worldbody"]["slide_back_loop"][0] = %h2_cliffhanger_slide_back;
    level.scr_anim["worldbody"]["slide_back_in"] = %h2_cliffhanger_slide_back_in;
    level.scr_anim["worldbody"]["slide_back_out"] = %h2_cliffhanger_slide_back_out;
    level.scr_anim["worldbody"]["slide_ar"] = %h2_cliffhanger_slide_turnl;
    level.scr_anim["worldbody"]["slide_al"] = %h2_cliffhanger_slide_turnr;
    maps\_anim::addonstart_animsound( "player_rig", "boneyard_uaz_mount", "scn_plr_boneyard_uaz_mount" );
}
#using_animtree("script_model");

script_model_animation()
{
    level.scr_animtree["angel_flare_rig"] = #animtree;
    level.scr_model["angel_flare_rig"] = "angel_flare_rig";
    level.scr_anim["angel_flare_rig"]["ac130_angel_flares"][0] = %ac130_angel_flares01;
    level.scr_anim["angel_flare_rig"]["ac130_angel_flares"][1] = %ac130_angel_flares02;
    level.scr_anim["angel_flare_rig"]["ac130_angel_flares"][2] = %ac130_angel_flares03;
    level.scr_animtree["airMask"] = #animtree;
    level.scr_anim["airMask"]["idle"] = %h2_bya_air_mask_idle;
}

playvoprice( var_0 )
{
    var_0 thread maps\_utility::play_sound_on_tag( "byard_pri_hangon", "j_head", 1 );
}

play_price_jeep_ride_vo( var_0, var_1 )
{
    if ( !common_scripts\utility::flag( "makarov_dialogue" ) )
        var_0 thread maps\_utility::play_sound_on_tag( var_1, "j_head", 1 );
}
