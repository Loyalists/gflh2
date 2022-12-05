// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" )
    {
        maps\dcemp_beautiful_corner::_id_C662();
        return;
    }

    _id_B5B0();
    maps\_utility::default_start( ::start_intro );
    maps\_utility::add_start( "intro", ::start_intro, "[intro] -> play end of dc burning", ::intro_main );
    maps\_utility::add_start( "iss", ::_id_A9F2, "[iss] -> see the emp up close and personal", ::_id_A882 );
    maps\_utility::add_start( "emp", ::_id_CB40, "[emp] -> see the emp effects from the ground", ::_id_AE4C );
    maps\_utility::add_start( "street", ::start_street, "[street] -> find cover off the street", ::_id_C29B );
    maps\_utility::add_start( "corner", ::_id_D33D, "[corner] -> watch the plane crash", ::_id_A8B3 );
    maps\_utility::add_start( "meetup", ::_id_CA4C, "[meetup] -> meetup with some allies", ::_id_C6D7 );
    maps\_utility::add_start( "lobby", ::start_lobby, "[lobby] -> sneak through the lobby", ::_id_BC49 );
    maps\_utility::add_start( "office", ::start_office, "[office] -> fight through the office", ::_id_AD29 );
    maps\_utility::add_start( "parking", ::_id_D263, "[parking] -> traverse the parking deck", ::_id_C70A );
    maps\_utility::add_start( "plaza", ::_id_AB90, "[plaza] -> continue through the plaza", ::_id_CCCC );
    maps\_utility::add_start( "tunnels", maps\dcemp_endpart::_id_C201, "[tunnels] -> traverse the tunnels", maps\dcemp_endpart::_id_B414 );
    _id_C2B0();
    thread _id_A7FD();
    thread maps\dcemp_code::hide_elements_intro();
    thread maps\dcemp_code::static_model_group_setup();
    thread maps\dcemp_code::fire_react_trigger();
    thread maps\dcemp_code::hide_mannequins();
}

_id_B5B0()
{
    common_scripts\utility::flag_init( "intro_fx" );
    common_scripts\utility::flag_init( "iss_fx" );
    common_scripts\utility::flag_init( "rain_fx" );
    common_scripts\utility::flag_init( "rain_fx2" );
    common_scripts\utility::flag_init( "end_fx" );
    common_scripts\utility::flag_init( "script2model_intro" );
    common_scripts\utility::flag_init( "script2model_iss" );
    common_scripts\utility::flag_init( "script2model_end" );
    common_scripts\utility::flag_init( "team_initialized" );
    common_scripts\utility::flag_init( "spotlight_lightning" );
    common_scripts\utility::flag_init( "iss_player_first_controls" );
    common_scripts\utility::flag_init( "iss_player_drive_controls" );
    common_scripts\utility::flag_init( "iss_organize_ents" );
    common_scripts\utility::flag_init( "iss_see_icbm" );
    common_scripts\utility::flag_init( "iss_stop_sounds" );
    common_scripts\utility::flag_init( "iss_space_nuke" );
    common_scripts\utility::flag_init( "iss_destroy_first_wave" );
    common_scripts\utility::flag_init( "iss_destroy_blast_wave" );
    common_scripts\utility::flag_init( "iss_done" );
    common_scripts\utility::flag_init( "iss_start_dialogue" );
    common_scripts\utility::flag_init( "iss_start_breathing" );
    common_scripts\utility::flag_init( "iss_copythat" );
    common_scripts\utility::flag_init( "iss_anyword" );
    common_scripts\utility::flag_init( "iss_nag_dialogue" );
    common_scripts\utility::flag_init( "iss_lights_out" );
    common_scripts\utility::flag_init( "emp_main" );
    common_scripts\utility::flag_init( "emp_jet_crash" );
    common_scripts\utility::flag_init( "emp_heli_crash" );
    common_scripts\utility::flag_init( "emp_heli_crash_go" );
    common_scripts\utility::flag_init( "street_main" );
    common_scripts\utility::flag_init( "do_player_crash_fx" );
    common_scripts\utility::flag_init( "street_crash_cop" );
    common_scripts\utility::flag_init( "street_crash_left" );
    common_scripts\utility::flag_init( "street_guy_fall" );
    common_scripts\utility::flag_init( "street_crash_hide" );
    common_scripts\utility::flag_init( "street_crash_left2" );
    common_scripts\utility::flag_init( "Sandler_can_jump" );
    common_scripts\utility::flag_init( "squadReadyToLeave" );
    common_scripts\utility::flag_init( "street_crash_heli_first" );
    common_scripts\utility::flag_init( "street_crash_btr_first" );
    common_scripts\utility::flag_init( "street_crash_heli_hide" );
    common_scripts\utility::flag_init( "street_crash_heli_done" );
    common_scripts\utility::flag_init( "street_safe" );
    common_scripts\utility::flag_init( "street_btr_death" );
    common_scripts\utility::flag_init( "street_btr_scene_done" );
    common_scripts\utility::flag_init( "corner_start_crash_scene" );
    common_scripts\utility::flag_init( "corner_engine_crash" );
    common_scripts\utility::flag_init( "corner_engine_hit" );
    common_scripts\utility::flag_init( "corner_main" );
    common_scripts\utility::flag_init( "corner_look_outside" );
    common_scripts\utility::flag_init( "corner_moveout" );
    common_scripts\utility::flag_init( "corner_crash_scene_done" );
    common_scripts\utility::flag_init( "start_rain_ambience" );
    common_scripts\utility::flag_init( "meetup_main" );
    common_scripts\utility::flag_init( "meetup_moveout" );
    common_scripts\utility::flag_init( "meetup_challenge_start" );
    common_scripts\utility::flag_init( "meetup_challenge_done" );
    common_scripts\utility::flag_init( "meetup_do_scripted_scene" );
    common_scripts\utility::flag_init( "meetup_runner_safe" );
    common_scripts\utility::flag_init( "meetup_runner_leave" );
    common_scripts\utility::flag_init( "meetup_runner_sprint" );
    common_scripts\utility::flag_init( "lobby_main" );
    common_scripts\utility::flag_init( "lobby_check" );
    common_scripts\utility::flag_init( "lobby_clear" );
    common_scripts\utility::flag_init( "lobby_door_ready" );
    common_scripts\utility::flag_init( "lobby_robo_death" );
    common_scripts\utility::flag_init( "lobby_door_kick" );
    common_scripts\utility::flag_init( "office_main" );
    common_scripts\utility::flag_init( "office_done" );
    common_scripts\utility::flag_init( "office_go_red" );
    common_scripts\utility::flag_init( "office_enemies_wave3" );
    common_scripts\utility::flag_init( "parking_main" );
    common_scripts\utility::flag_init( "parking_moveout" );
    common_scripts\utility::flag_init( "parking_moveout2" );
    common_scripts\utility::flag_init( "parking_moveout3" );
    common_scripts\utility::flag_init( "parking_checking_body" );
    common_scripts\utility::flag_init( "parking_btr_shot_at" );
    common_scripts\utility::flag_init( "parking_open_fire" );
    common_scripts\utility::flag_init( "plaza_to_street" );
    common_scripts\utility::flag_init( "plaza_show_enemies" );
    common_scripts\utility::flag_init( "plaza_open_fire" );
    common_scripts\utility::flag_init( "plaza_prepare_throw" );
    common_scripts\utility::flag_init( "plaza_throw_react" );
    common_scripts\utility::flag_init( "plaza_flare_thrown" );
    common_scripts\utility::flag_init( "plaza_moveout_exit" );
    common_scripts\utility::flag_init( "plaza_moveout_exit2" );
    common_scripts\utility::flag_init( "tunnels_main" );
    common_scripts\utility::flag_init( "emp_lighting_flash" );
    common_scripts\utility::flag_init( "office1" );
    common_scripts\utility::flag_init( "foley_street_dialog_end" );
    common_scripts\utility::flag_init( "parking_dialog_resume" );
    common_scripts\utility::flag_init( "player_and_squad_safe" );
    common_scripts\utility::flag_init( "tunnels_foley_dialogue" );
    common_scripts\utility::flag_init( "intro_heli_crashing" );
}

_id_AE48()
{
    if ( !isdefined( level.func ) )
        level.func = [];

    level.func["create_triggerfx"] = maps\dcemp_code::_id_C4A0;

    if ( getdvar( "createfx" ) == "on" )
    {
        common_scripts\utility::flag_set( "rain_fx" );
        common_scripts\utility::flag_set( "end_fx" );
    }
}

_id_B566()
{
    precachemodel( "ch_street_light_01_on" );
    precachemodel( "iss_prop_3" );
    precachemodel( "iss_prop_5" );
    precachemodel( "com_outdoor_switch" );
    precachemodel( "iss_prop_7" );
    precachemodel( "iss_grip_1" );
    precachemodel( "iss_prop_1" );
    precachemodel( "iss_grip_2" );
    precachemodel( "iss_prop_8" );
    precachemodel( "iss_sail_frame" );
    precachemodel( "iss_sail_center" );
    precachemodel( "iss_prop_6" );
    precachemodel( "iss_prop_9" );
    precachemodel( "bg_iss" );
    maps\_utility::delaythread( 0.5, maps\dcemp_code::_id_CC14 );
}

_id_C2B0()
{
    _id_AE48();
    var_0 = getentarray( "trigger_multiple_dyn_photo_copier", "classname" );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "trigger_multiple_dyn_copier_no_light", "classname" ) );
    common_scripts\utility::array_call( var_0, ::delete );
    _id_BA41::main();
    var_1 = getentarray( "mask_ents", "targetname" );
    maps\_utility::mask_destructibles_in_volumes( var_1 );
    maps\_utility::mask_interactives_in_volumes( var_1 );
    _id_BF7E::main();
    _id_D43E::main();
    _id_BD4E::main();
    _id_CD74::main();
    maps\dc_crashsite::main();
    maps\dcemp_anim::main();
    maps\_load::main();
    level._id_B39B = 4.5;
    thread _id_D301::_id_D23F();
    maps\_drone_ai::init();
    maps\dcemp_aud::main();
    maps\_compass::setupminimap( "compass_map_dcemp" );
    maps\dcemp_code::_id_CF82();
    precachemodel( "hud_space_helmet_overlay" );
    precachemodel( "prop_photocopier_destroyed" );
    precachemodel( "prop_photocopier_destroyed_top" );
    precachemodel( "prop_photocopier_destroyed_right_shelf" );
    precachemodel( "prop_photocopier_destroyed_left_feeder" );
    precachemodel( "com_tv2_d" );
    precachemodel( "com_newspaperbox_red_dam" );
    precachemodel( "com_newspaperbox_red_des" );
    precachemodel( "com_newspaperbox_red_door" );
    precachemodel( "com_newspaperbox_blue_dam" );
    precachemodel( "com_newspaperbox_blue_door" );
    precachemodel( "com_newspaperbox_blue_des" );
    precachemodel( "me_electricbox2_dest" );
    precachemodel( "me_electricbox2_door_upper" );
    precachemodel( "me_electricbox2_door" );
    precachemodel( "me_electricbox4_dest" );
    precachemodel( "me_electricbox4_door" );
    precachemodel( "com_filecabinetblackclosed_dam" );
    precachemodel( "com_filecabinetblackclosed_des" );
    precachemodel( "com_filecabinetblackclosed_drawer" );
    precachemodel( "me_lightfluohang_double_destroyed" );
    precachemodel( "vehicle_mi-28_d_animated" );
    precachemodel( "projectile_us_smoke_grenade" );
    precachemodel( "tag_origin" );
    precachemodel( "vehicle_van_white_door_rb" );
    precachemodel( "bc_military_tire01" );
    precachemodel( "vehicle_van_white_hood" );
    precachemodel( "rubble_large_slab_02" );
    precachemodel( "727_seats_row_left" );
    precachemodel( "ch_street_light_01_off" );
    precachemodel( "iss_sail_center" );
    precacherumble( "tank_rumble" );
    precacherumble( "damage_heavy" );
    precacherumble( "steady_rumble" );
    precacheshader( "white" );
    precacheshellshock( "default" );
    precacheshellshock( "nosound" );
    precachemodel( "body_us_army_assault_a_dead_elevator" );
    precachemodel( "head_us_army_d_dead_elevator" );
    precachemodel( "com_firehydrant_dest" );
    precachemodel( "com_firehydrant_dam" );
    precachemodel( "com_firehydrant_cap" );
    loadfx( "fx/props/firehydrant_leak" );
    loadfx( "fx/props/firehydrant_exp" );
    loadfx( "fx/props/firehydrant_spray_10sec" );
    level.default_goalheight = 128;
    precachemodel( "rappelrope100_ri" );
    precachemodel( "mil_emergency_flare" );
    precacheturret( "heli_spotlight" );
    precacheitem( "rpg_straight" );
    precachemodel( "com_door_01_handleleft2" );
    precachestring( &"DCEMP_ISS_INTROSCREEN1" );
    precachestring( &"DCEMP_ISS_INTROSCREEN2" );
    precachestring( &"DCEMP_ISS_INTROSCREEN3" );
    precachestring( &"DCEMP_OBJ_CRASH_SITE" );
    precachestring( &"DCEMP_OBJ_FIND_SHELTER" );
    precachestring( &"DCEMP_OBJ_FOLLOW_SGT_FOLEY" );
    precachestring( &"DCEMP_OBJ_WHISKEY_HOTEL" );
    precachemodel( "h2_ch_street_light_01_bulb_off" );

    precachemodel( "h2_gfl_ump9_viewbody" );
    precachemodel( "h2_gfl_ump9_viewhands" );
    precachemodel( "h2_gfl_ump9_viewhands_player" );

    maps\dcemp_code::_id_CAE3();
    maps\dcemp_code::_id_CF15();
    var_2 = getent( "meetup_door_left", "targetname" );
    var_3 = getent( "office_door_clip", "targetname" );
    var_3 linkto( var_2 );
    var_2 common_scripts\utility::delaycall( 0.1, ::rotateyaw, 90, 0.1 );
    var_3 common_scripts\utility::delaycall( 0.2, ::disconnectpaths );
    level._id_CD9B = 0;
    level._id_A87F.greenberet_disabled = 1;
}

intro_main()
{
    common_scripts\utility::flag_set( "player_crash_done" );
    thread maps\dcemp_code::dancing_lights_setup();
    thread maps\dcemp_code::portal_group_setup();
    var_0 = getentarray( "emp_show", "targetname" );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "emp_light", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "fx_flare", "targetname" ) );
    common_scripts\utility::array_thread( var_0, maps\dcemp_code::_id_C5B8 );
    thread _id_BCFB();
    thread maps\dcemp_code::_id_CD9F();
    startmap_light_setup();
    maps\dc_crashsite::_id_BFC4();
    thread maps\dcemp_aud::intro_heli_sequence_snd();
}

_id_BCFB()
{
    if ( level.start_point == "emp" )
    {
        getent( "heli_crash_site_spotlight_emp_start", "targetname" ) maps\_utility::add_spawn_function( maps\dcemp_code::_id_D38F );
        getent( "btr80s_end_emp_start", "targetname" ) maps\_utility::add_spawn_function( maps\dcemp_code::_id_BEF8 );
    }
    else
    {
        getent( "heli_crash_site_spotlight", "targetname" ) maps\_utility::add_spawn_function( maps\dcemp_code::_id_D38F );
        getent( "btr80s_end", "targetname" ) maps\_utility::add_spawn_function( maps\dcemp_code::_id_BEF8 );
    }

    common_scripts\utility::array_thread( getentarray( "helis_crash_rappel", "targetname" ), maps\_utility::add_spawn_function, maps\dcemp_code::_id_A9FE );
    common_scripts\utility::array_thread( getentarray( "helis_crash_distant", "targetname" ), maps\_utility::add_spawn_function, maps\dcemp_code::_id_D240 );
    thread maps\dcemp_aud::crashsite_heli_rappel();
    common_scripts\utility::flag_wait( "first_wave_done" );
    wait 4;
    maps\_utility::delaythread( 0, maps\_vehicle::spawn_vehicles_from_targetname_and_drive, "helis_crash_distant" );
}

_id_A882()
{
    common_scripts\utility::flag_wait( "emp_entity_cleanup_done" );
    thread maps\_utility::set_vision_set( "dcemp_iss", 0 );
    thread maps\_utility::vision_set_fog_changes( "dcemp_iss", 0 );
    soundscripts\_snd::snd_message( "start_iss_ambience" );
    level.player disableweapons();
    level.player freezecontrols( 1 );
    level._id_AED3 = level.player getplayerangles();
    level._id_BB85 = level.player getstance();
    level.player allowcrouch( 0 );
    level.player setstance( "stand" );
    level.player lightset( "space" );
    setsaveddvar( "actionSlotsHide", "1" );
    setomnvar( "ui_astronauthelmet", 1 );
    thread maps\dcemp_code::_id_AA88( level.suncolor["space"], 1 );
    var_0 = anglestoforward( ( 5.0, 210.0, 0.0 ) );
    setsundirection( var_0 );
    maps\dcemp_code::_id_C919();
    common_scripts\utility::flag_set( "iss_fx" );
    maps\dcemp_code::_id_AEE9();
    thread maps\dcemp_code::_id_CC14();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "script2model_iss" );
    maps\_utility::add_func( maps\dcemp_code::_id_D013 );
    thread maps\_utility::do_wait();

    if ( !isdefined( level.white_overlay ) )
        level.white_overlay = maps\_hud_util::create_client_overlay( "white", 1 );

    common_scripts\utility::flag_wait( "iss_organize_ents" );
    var_1 = undefined;
    var_1 = "0 0 0";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_1 );
    wait 0.5;
    level._id_B415 = maps\dcemp_code::_id_B5CC();
    thread h2_iss_cinematic();
    enableouterspacemodellighting( level._id_B415["camera"].origin, ( 0.2, 0.2, 0.2 ) );
    thread _id_BC32();
    thread _id_D114();
    thread _id_B0EF();
    wait 0.5;
    var_2 = 1;
    common_scripts\utility::flag_set( "dc_emp_missile" );
    level.white_overlay fadeovertime( 4 );
    level.white_overlay.alpha = 0;
    common_scripts\utility::flag_wait( "iss_start_dialogue" );
    thread maps\dcemp_code::missile_pre_launch();
    wait 13;
    common_scripts\utility::flag_set( "iss_see_icbm" );
    _id_BDD1();
    wait 3.35;
    common_scripts\utility::flag_set( "iss_stop_sounds" );
    level.white_overlay.alpha = 1;
    var_2 = 0.1;
    soundscripts\_snd::snd_message( "stop_iss_ambience" );
    disableouterspacemodellighting();
    resetsundirection();
    common_scripts\utility::flag_set( "iss_done" );
}

_id_AC46( var_0 )
{
    self endon( "iss_wait_player_see_icbm" );
    level._id_B2A2 endon( "death" );

    if ( isdefined( var_0 ) )
        thread maps\_utility::notify_delay( "iss_wait_player_see_icbm", var_0 );

    while ( !self worldpointinreticle_circle( level._id_B2A2.origin, getdvarint( "cg_fov" ), 200 ) )
        wait 0.1;

    return 1;
}

_id_D087()
{
    level endon( "iss_nag_dialogue" );

    for (;;)
    {
        if ( !isdefined( level.player _id_AC46( 0.5 ) ) )
            thread maps\_utility::radio_dialogue( "dcemp_iss_rotateview" );

        if ( isdefined( level.player _id_AC46( 13 ) ) )
            break;
    }
}

_id_D114()
{
    common_scripts\utility::flag_wait( "iss_start_dialogue" );
    maps\_utility::radio_dialogue( "dcemp_iss_requestfeed" );
    wait 1;
    maps\_utility::radio_dialogue( "dcemp_iss_theywantyou" );
    common_scripts\utility::flag_wait( "iss_see_icbm" );
    wait 1.5;
    thread maps\_utility::flag_set_delayed( "iss_nag_dialogue", 30 );
    _id_D087();
    common_scripts\utility::flag_set( "iss_nag_dialogue" );
    wait 0.5;
    maps\_utility::radio_dialogue_stop();
    wait 0.5;
    maps\_utility::radio_dialogue( "dcemp_iss_thereitis" );
    common_scripts\utility::flag_wait( "iss_copythat" );
    maps\_utility::radio_dialogue( "dcemp_hsc_copythat" );
    wait 1;
    maps\_utility::radio_dialogue( "dcemp_hsc_keeptracking" );
    wait 1.5;
    maps\_utility::radio_dialogue( "dcemp_iss_notscheduled" );
    wait 2.5;
    thread maps\_utility::radio_dialogue( "dcemp_hsc_standby" );
    common_scripts\utility::flag_wait( "iss_anyword" );
    thread maps\_utility::radio_dialogue( "dcemp_iss_anyword" );
}

_id_BDD1()
{
    common_scripts\utility::flag_wait( "iss_nag_dialogue" );
    thread maps\_utility::flag_set_delayed( "iss_copythat", 8 );
    thread maps\_utility::flag_set_delayed( "iss_anyword", 33.4 );
    level._id_B2A2 vehicle_setspeedimmediate( 55, 100 );
    level._id_B2A2 waittill( "reached_end_node" );
    common_scripts\_exploder::exploder( "space_nuke" );
    level._id_B2A2 delete();
    common_scripts\utility::flag_set( "iss_space_nuke" );
    common_scripts\utility::flag_set( "dc_emp_missile_hit" );
    common_scripts\utility::flag_set( "iss_lights_out" );
    thread maps\dcemp_aud::iss_emp_exp_interrupt();
    thread _id_C5F5();
    wait 0.5;
    wait 3.5;
    maps\dcemp_code::_id_B275();
    wait 1.5;
    common_scripts\_exploder::exploder( "iss_explodes" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_iss_explosion" );
    wait 0.35;
    wait 1.85;
    thread common_scripts\utility::play_sound_in_space( "scn_dcemp_space_transition_out", ( 0.0, 0.0, 0.0 ) );
    level.white_overlay fadeovertime( 4 );
    level.white_overlay.alpha = 0.15;
    thread maps\dcemp_code::_id_A972();
    wait 0.1;
    wait 0.5;
    thread maps\dcemp_code::_id_B05A();
    common_scripts\_exploder::exploder( "sat_destroy" );
}

_id_BC32()
{
    var_0 = 45;
    var_1 = -2000;
    var_2 = 115;
    var_3 = level._id_B415["node"];
    var_4 = level._id_B415["camera"].node;
    var_3.angles += ( 0, var_0, 0 );
    var_3.origin += ( var_1, 0, 0 );
    var_4.angles += ( 0, var_0, 0 );
    var_4.origin += ( var_1, 0, 0 );
    var_3 rotateyaw( var_0 * -1, var_2 );
    var_3 movex( var_1 * -1, var_2 );
    var_4 rotateyaw( var_0 * -1, var_2 );
    var_4 movex( var_1 * -1, var_2 );
    var_3 thread maps\_anim::anim_single_solo( level._id_B415["model"], "ISS_animation" );
    var_4 thread maps\_anim::anim_single_solo( level._id_B415["camera"], "ISS_animation" );
    level._id_B415["camera"] setanim( level._id_B415["camera"] maps\_utility::getanim( "ISS_animation" ), 1, 0, 0 );
    wait 3.5;
    level.player freezecontrols( 0 );
    wait 1.0;
    thread maps\_utility::flag_set_delayed( "iss_start_dialogue", 2.5 );
    thread maps\_utility::flag_set_delayed( "iss_start_breathing", 0.5 );
    var_4 maps\_anim::anim_single_solo( level._id_B415["camera"], "ISS_animation" );
    var_4 thread maps\_anim::anim_loop_solo( level._id_B415["camera"], "ISS_idle" );
    var_2 = 15;
    common_scripts\utility::flag_wait( "iss_space_nuke" );
    wait 6;
    var_4 notify( "stop_loop" );
    level._id_B415["camera"].node = spawn( "script_origin", level._id_B415["camera"].origin );
    level._id_B415["camera"].node.angles = level._id_B415["camera"].angles;
    level._id_B415["camera"].node linkto( var_3 );
    level._id_B415["camera"] linkto( level._id_B415["camera"].node );
    level._id_B415["camera"].node thread maps\_anim::anim_single_solo( level._id_B415["camera"], "ISS_float_away" );
}

_id_C5F5()
{
    level.player maps\_utility::delaythread( 0.5, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 3, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    common_scripts\utility::flag_wait( "iss_destroy_first_wave" );
    level.player maps\_utility::delaythread( 0, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 0.5, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 1, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 1.5, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 2, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    common_scripts\utility::flag_wait( "iss_destroy_blast_wave" );
    wait 0.35;
    level.player maps\_utility::delaythread( 0, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 1, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 2, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
}

_id_B0EF()
{
    common_scripts\utility::flag_wait( "iss_start_breathing" );
    thread _id_CD6D();
    common_scripts\utility::flag_wait( "iss_nag_dialogue" );
}

_id_CD6D()
{
    while ( !common_scripts\utility::flag( "iss_space_nuke" ) )
    {
        level.player maps\_utility::play_sound_on_entity( "scn_dcemp_iss_helmet_breathe_slow" );
        wait 2;
    }
}

h2_iss_cinematic()
{
    var_0 = _id_D397::_id_A97A( "iss_setup" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.0, 0.0, 0.0, 0, 0, 0, 0 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 5.1 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 4.0, 2.0, 2.0, 18, 35, 15, 18 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 10.5 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 2.0, 1.0, 1.0, 5, 10, 8, 12 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 14.8 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 4.0, 2.0, 2.0, 45, 55, 15, 40 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_1 = 0.5;
    var_2 = 10000;
    var_3 = level.player;
    var_0 _id_D397::_id_BEA0( 12.4 ) _id_D397::_id_B85E( 0.09, var_1, var_3, var_2 ) _id_D397::_id_A970( ::h2_iss_rumblehelpersystem, level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 15.4 ) _id_D397::_id_B85E( 0.11, var_1, var_3, var_2 ) _id_D397::_id_A970( ::h2_iss_rumblehelpersystem, level.player, 0.05 );
    var_4 = 5500;
    var_5 = 47000;
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 10.0, var_5, 16.0, 16.0 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 5.0 ) _id_D397::_id_C491( 18.0, var_4, 8.0, 8.0 );
    var_0 _id_D397::_id_BEA0( 10.8 ) _id_D397::_id_C491( 14.0, 17, 12.0, 12.0 );
    var_0 _id_D397::_id_BEA0( 15.5 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BC26();
    common_scripts\utility::flag_wait( "iss_nag_dialogue" );
    var_0 = _id_D397::_id_A97A( "iss_finale" );
    var_0 _id_D397::_id_BEA0( 36.3 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 6.7, 3.0, 3.0, 20, 15, 10, 4 );
    var_0 _id_D397::_id_BEA0( 43.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.3, 0.6, 0.7, 0, 0, 0, 0 );
    var_0 _id_D397::_id_BEA0( 43.1 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 48.5 ) _id_D397::_id_BAE4( 0 );
    var_6 = 0.11;
    var_7 = 0.17;
    var_8 = 0.22;
    var_9 = 0.25;
    var_10 = 0.5;
    var_11 = 0.75;
    var_2 = 100000;
    var_3 = level.player;
    var_0 _id_D397::_id_BEA0( 36.35 ) _id_D397::_id_B85E( 0.05, 4.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 41.85 ) _id_D397::_id_B85E( var_6, var_9, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 41.95 ) _id_D397::_id_B85E( var_6, var_9, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.05 ) _id_D397::_id_B85E( var_6, var_9, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.15 ) _id_D397::_id_B85E( var_6, var_9, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.25 ) _id_D397::_id_B85E( var_6, var_9, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.35 ) _id_D397::_id_B85E( var_7, var_11, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.65 ) _id_D397::_id_B85E( var_6, var_9 * 2, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.85 ) _id_D397::_id_B85E( var_6, var_9 * 2, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.05 ) _id_D397::_id_B85E( var_8, var_10 * 2, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.25 ) _id_D397::_id_B85E( var_6, var_10 * 3, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.65 ) _id_D397::_id_B85E( var_7, var_11 * 3, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.65 ) _id_D397::_id_B85E( var_6, var_9 * 2, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.85 ) _id_D397::_id_B85E( var_6, var_9 * 2, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 40.5 ) _id_D397::_id_B85E( 0.04, 4.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 41.5 ) _id_D397::_id_B85E( 0.04, 3.7, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.0 ) _id_D397::_id_B85E( 0.04, 3.3, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.25 ) _id_D397::_id_B85E( 0.05, 3.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.45 ) _id_D397::_id_B85E( 0.05, 2.7, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.6 ) _id_D397::_id_B85E( 0.06, 2.3, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 42.8 ) _id_D397::_id_B85E( 0.06, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.0 ) _id_D397::_id_B85E( 0.07, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.2 ) _id_D397::_id_B85E( 0.08, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.4 ) _id_D397::_id_B85E( 0.09, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.5 ) _id_D397::_id_B85E( 0.1, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.6 ) _id_D397::_id_B85E( 0.11, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.7 ) _id_D397::_id_B85E( 0.12, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.8 ) _id_D397::_id_B85E( 0.13, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 43.9 ) _id_D397::_id_B85E( 0.14, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 44.0 ) _id_D397::_id_B85E( 0.15, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 44.1 ) _id_D397::_id_B85E( 0.17, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 44.15 ) _id_D397::_id_B85E( 0.19, 2.0, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 44.0 ) _id_D397::_id_B85E( 0.3, 4.3, var_3, var_2 );
    var_0 _id_D397::_id_BEA0( 36.35 ) _id_D397::_id_A970( ::h2_iss_rumblehelpersystem, level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 41.15 ) _id_D397::_id_A970( ::h2_iss_rumbleincrement, level.player, 3.1, 1.1, 0.05, 0.5 );
    var_0 _id_D397::_id_BEA0( 47.85 ) _id_D397::_id_A970( ::h2_iss_rumblehelpersystem, level.player, 0.5 );
    var_0 _id_D397::_id_BC26();
}

h2_iss_rumblehelpersystem( var_0 )
{
    level.player playrumblelooponentity( "tank_rumble" );
    wait(var_0);
    level.player _meth_80B6( "tank_rumble" );
}

h2_iss_rumbleincrement( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;

    while ( var_4 <= var_0 )
    {
        var_2 = var_1 * var_2;
        var_3 = 1 / var_1 * var_3;

        if ( var_3 < 0.05 )
            var_3 = 0.05;

        var_4 += var_3;
        thread h2_iss_rumblehelpersystem( var_2 );
        wait(var_3);
    }
}

_id_AE4C()
{
    common_scripts\utility::flag_wait( "iss_done" );
    maps\dcemp_code::_id_CD2C();
    maps\dcemp_code::_id_AA9B();
    maps\dcemp_code::_id_C49A();
    thread maps\dcemp_code::remove_ais_after_space();
    soundscripts\_snd::snd_message( "start_iss_fadeout_mix" );
    level.player lightset( "dcemp" );
    var_0 = undefined;
    var_0 = "-42263 6917 183";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_0 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_0 );
    setomnvar( "ui_astronauthelmet", 0 );
    setsaveddvar( "actionSlotsHide", "0" );
    common_scripts\utility::array_thread( getentarray( "street_crash_car", "script_noteworthy" ), maps\dcemp_code::_id_C377 );
    common_scripts\utility::array_thread( getentarray( "street_cars_bounce", "targetname" ), maps\dcemp_code::_id_C344 );
    thread maps\dcemp_code::heli_falling_kill_player();
    var_1 = getentarray( "emp_delete", "targetname" );
    var_1 = common_scripts\utility::array_combine( var_1, getentarray( "emp_swap", "targetname" ) );
    common_scripts\utility::array_thread( var_1, maps\dcemp_code::_id_C5B8 );
    wait 2;
    common_scripts\_exploder::exploder( "emp_flash" );
    thread maps\dcemp_code::animatedoor();
    thread _id_C3CB();
    thread _id_B28A();
    thread _id_C620();
    thread maps\dcemp_code::_id_CBF2();
    thread maps\dcemp_code::_id_B109();
    thread _id_C71E();
    thread _id_AABE();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "emp_jet_crash" );
    maps\_utility::add_func( maps\_utility::flag_set_delayed, "street_main", 3.25 );
    thread maps\_utility::do_wait();
}

_id_AABE()
{
    common_scripts\utility::flag_wait( "emp_entity_cleanup_done" );
    objective_add( level._id_CD9B, "invisible", &"DCEMP_OBJ_CRASH_SITE" );
    objective_state_nomessage( level._id_CD9B, "done" );
}

_id_C3CB()
{
    level.player freezecontrols( 1 );
    setblur( 0, 0 );
    level.player playersetgroundreferenceent( undefined );
    thread maps\dcemp_code::_id_D26E( 0 );
    level.player playerlinktodelta( level.player._id_B0D8, "tag_player", 1, 60, 60, 40, 20, 1 );
    level.player enableweapons();
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "ui_hideAmmoStatus", 1 );
    level.player setempjammed( 1 );
    maps\_compass::setupminimap( "compass_map_dcemp_static" );
    wait 0.35;
    level.player playerlinktodelta( level.player._id_B0D8, "tag_player", 1, 60, 60, 40, 20, 1 );
    level.player lerpviewangleclamp( 0.1, 0.1, 0, 60, 60, 40, 20 );
    level.player playersetgroundreferenceent( undefined );

    if ( isdefined( level._id_AED3 ) )
        level.player setplayerangles( level._id_AED3 );
    else
        level.player setplayerangles( level.player._id_B0D8.angles );

    level.player freezecontrols( 0 );
    level.player allowcrouch( 1 );

    if ( isdefined( level._id_BB85 ) )
        level.player setstance( level._id_BB85 );

    var_0 = 1.5;

    if ( getdvarint( "r_dcburning_culldist" ) == 1 )
        setculldist( 23000 );

    common_scripts\utility::flag_set( "emp_back_from_whiteout" );
    level.white_overlay fadeovertime( 4 );
    level.white_overlay.alpha = 0;
}

_id_C71E()
{
    common_scripts\utility::flag_wait( "emp_heli_crash" );
    common_scripts\utility::flag_wait( "emp_jet_crash" );
    wait 2.5;
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_whatsgoinon" );
}

_id_C620()
{
    common_scripts\utility::flag_wait( "iss_done" );
    thread maps\dcemp_code::_id_C760();
    thread common_scripts\utility::play_sound_in_space( "scn_dcemp_emp_main", level.player.origin + ( 0.0, 0.0, 100.0 ) );
    soundscripts\_snd::snd_message( "start_emp_mix" );
}

_id_B28A()
{
    common_scripts\utility::flag_wait( "emp_entity_cleanup_done" );
    thread maps\_utility::battlechatter_off();
    _id_BD5B();
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreme, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreall, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_arrivals );
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_zero );
    common_scripts\utility::array_thread( level.team, maps\dcemp_code::_id_C3F4, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_pain );
    level.foley thread _id_C302();
    level._id_ACC0 thread _id_C255();
    level.team["marine1"] thread _id_B497();
}

_id_C302()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = getnode( var_0.target, "targetname" );
    self.goalradius = 16;
    self setgoalnode( var_1 );
    var_2 = getent( "crash_node", "targetname" );
    var_0.origin = var_1.origin;
    var_0.angles = var_1.angles + ( 0.0, -90.0, 0.0 );
    var_2 maps\_anim::anim_generic( self, "DCemp_react_guyA_react" );
    maps\_anim::anim_generic( self, "corner_standR_alert_2_look" );
    thread maps\_anim::anim_generic_loop( self, "corner_standR_look_idle" );
    common_scripts\utility::flag_wait( "emp_heli_crash_go" );
    wait 2.25;
    self notify( "stop_loop" );
    thread maps\_anim::anim_generic( self, "corner_standR_look_2_alert_fast" );
    common_scripts\utility::flag_wait( "emp_heli_crash" );
    self notify( "stop_loop" );
    maps\_anim::anim_generic( self, "corner_standR_painC" );
    common_scripts\utility::flag_wait( "emp_jet_crash" );
    self playsound( "generic_pain_american_" + randomintrange( 1, 9 ) );
    maps\_anim::anim_generic( self, "corner_standR_flinchB" );
    maps\_anim::anim_generic( self, "corner_standR_alert_2_look" );
    thread maps\_anim::anim_generic_loop( self, "corner_standR_look_idle" );
}

_id_C255()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 = getnode( var_1.target, "targetname" );
    self.goalradius = 16;
    self setgoalnode( var_0 );
    var_2 = getent( "crash_node", "targetname" );
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    var_2 maps\_anim::anim_generic( self, "DCemp_react_guyB_react" );
    maps\_anim::anim_generic( self, "CornerCrR_alert_2_look" );
    thread maps\_anim::anim_generic_loop( self, "CornerCrR_look_idle" );
    common_scripts\utility::flag_wait( "emp_heli_crash" );
    self notify( "stop_loop" );
    self playsound( "generic_pain_american_" + randomintrange( 1, 9 ) );
    thread maps\_anim::anim_generic_gravity( self, "bog_b_spotter_react" );
    var_3 = getanimlength( maps\_utility::getanim_generic( "bog_b_spotter_react" ) );
    maps\_utility::delaythread( var_3 * 0.93, maps\_utility::anim_stopanimscripted );
}

_id_B497()
{
    var_0 = common_scripts\utility::getstruct( "intro_heli_free_start", "targetname" );
    maps\dcemp_code::_id_AFEF( var_0 );
    self setgoalpos( var_0.origin );
    self.goalradius = 8;
    maps\_utility::disable_arrivals();
    maps\_utility::disable_exits();
    maps\_utility::walkdist_zero();
    maps\_utility::pathrandompercent_zero();
    wait 2.5;
    wait(level._id_B39B);
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "dcemp_BHrescue_soldier" );
    maps\_utility::delaythread( 5.5, ::_id_AA1C );
    var_1 = common_scripts\utility::array_add( level._id_BBF1, self );
    var_0 thread h2_player_rescue_anim();
    var_0 thread maps\_anim::anim_single( var_1, "dcemp_BHrescue" );
    var_2 = getanimlength( maps\_utility::getanim_generic( "dcemp_BHrescue_soldier" ) );
    wait(var_2 - 0.6);
    maps\_utility::anim_stopanimscripted();
    var_0 = spawn( "script_origin", self.origin );
    var_0.angles = self.angles + ( 0.0, -7.0, 0.0 );
    var_0 maps\dcemp_code::_id_D4EA( self, "corner_standR_trans_IN_3" );
    var_0 delete();
    var_0 = getnode( self.target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    self.goalradius = 16;
    maps\_utility::enable_arrivals();
    maps\_utility::enable_exits();
    self setgoalnode( var_0 );
    self waittill( "goal" );
    maps\_utility::disable_arrivals();
    maps\_utility::disable_exits();
}

h2_player_rescue_anim()
{
    var_0 = maps\_utility::spawn_anim_model( "player_rig" );
    var_0 hide();
    thread player_rescue_cinematic( var_0 );
    var_1 = common_scripts\utility::getstruct( "firelight_helico_crash_02_struct", "script_noteworthy" );
    var_2 = getent( var_1.target, "targetname" );
    var_1 notify( "stop_dynamic_light_behavior" );
    maps\_anim::anim_first_frame_solo( var_0, "dcemp_BHrescue" );
    waittillframeend;
    thread maps\_anim::anim_single_solo( var_0, "dcemp_BHrescue" );
    level.player allowcrouch( 0 );
    waittillframeend;
    var_2 setlightintensity( 0 );
    level.player disableweapons( 1, 200 );
    var_3 = level.player maps\_anim::_id_D101( var_0, 60, 50, 0.25, 0.5 );
    level.player playerlinktoblend( var_0, "tag_player", var_3, var_3 / 2, var_3 / 2 );
    wait(var_3);
    var_0 show();
    wait(getanimlength( var_0 maps\_utility::getanim( "dcemp_BHrescue" ) ) - var_3);
    level.player enableweapons();
    level.player allowcrouch( 1 );
    level.player unlink();
    var_0 delete();
}

player_rescue_cinematic( var_0 )
{
    var_1 = _id_D397::_id_A97A( "player_rescue_cinematic" );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_1 _id_D397::_id_BEA0( 6.7 ) _id_D397::_id_BAE4( 0 );
    var_1 _id_D397::_id_BEA0( 1.1 ) _id_D397::_id_B85E( 0.04, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 1.4 ) _id_D397::_id_B85E( 0.04, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 3.85 ) _id_D397::_id_B85E( 0.1, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 _id_D397::_id_BEA0( 4.45 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_1 _id_D397::_id_BC26();
}

_id_AA1C()
{
    var_0 = getent( "crash_site_clip", "targetname" );
    var_0 delete();
    level notify( "player_unlinked" );
    wait 0.25;
    var_1 = level.player._id_B0D8;
    var_2 = getent( "movement_grid_exit", "targetname" );
    soundscripts\_snd::snd_message( "start_exterior_ambience" );
    var_3 = 1;
    var_1 moveto( var_2.origin, var_3, var_3 * 0.5, var_3 * 0.5 );
    var_1 waittill( "movedone" );
    level.player unlink();
    level.player allowstand( 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 0 );
    level.player _meth_830F( 1 );
    level.player allowjump( 1 );
    var_4 = getent( "intro_heli_after_emp_clip", "targetname" );
    var_4 solid();
    setsaveddvar( "ui_hidemap", 0 );
    setsaveddvar( "hud_showStance", "1" );
    setsaveddvar( "compass", "1" );
}

_id_C29B()
{
    common_scripts\utility::flag_wait( "street_main" );
    common_scripts\utility::flag_clear( "allow_ammo_pickups" );
    common_scripts\utility::flag_set( "street_crash_heli_first" );
    thread maps\_utility::autosave_now();
    var_0 = undefined;
    var_0 = "-42263 6917 183";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_0 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_0 );
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    maps\_utility::delaythread( 3, maps\dcemp_code::_id_B46A );
    maps\_utility::delaythread( 1, maps\_utility::activate_trigger, "meetup_allies", "target" );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreme, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreall, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_arrivals );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_exits );
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_zero );
    common_scripts\utility::array_thread( level.team, maps\dcemp_code::_id_C3F4, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_pain );
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_zero );
    common_scripts\utility::array_thread( level.team, maps\_utility::ent_flag_init, "street_hide" );
    level.player maps\_utility::blend_movespeedscale( 0.8 );
    common_scripts\utility::flag_set( "dc_emp_afternath" );
    var_1 = 3.15;
    thread maps\_utility::flag_set_delayed( "street_crash_btr_first", 2.5 + var_1 );
    maps\_utility::delaythread( 2.5 + var_1, maps\dcemp_code::_id_B1E2 );
    wait 1.65;
    level.foley notify( "stop_loop" );
    level.foley thread maps\_anim::anim_generic( level.foley, "corner_standR_look_2_alert" );
    level.foley thread maps\_utility::dialogue_queue( "dcemp_fly_seekshelter" );
    level._id_CD9B++;
    objective_add( level._id_CD9B, "active", &"DCEMP_OBJ_FIND_SHELTER" );
    objective_onentity( level._id_CD9B, level._id_ACC0, ( 0.0, 0.0, 70.0 ) );
    objective_current( level._id_CD9B );
    level.team["dunn"] thread _id_CCAA();
    wait 1.0;
    level.team["foley"] thread _id_C127();
    wait 0.5;
    level.team["marine1"] thread _id_C9ED();
    thread maps\dcemp_code::_id_B717();
    common_scripts\utility::flag_wait( "street_safe" );
    common_scripts\utility::flag_set( "corner_main" );
}

_id_C9ED()
{
    var_0 = getent( "street_marine2_anim0a", "targetname" );
    maps\_utility::enable_heat_behavior();
    var_1 = spawnstruct();
    var_1.origin = self.origin;
    var_1.angles = self.angles + ( 0.0, -12.0, 0.0 );
    var_1 thread maps\_anim::anim_generic_gravity( self, "corner_standR_trans_OUT_6" );
    wait 0.5;
    maps\_utility::anim_stopanimscripted();
    self linkto( var_0 );
    var_0 common_scripts\utility::delaycall( 0.25, ::movez, 8, 0.5 );
    var_0 thread maps\_anim::anim_generic( self, "gulag_sewer_slide" );
    var_2 = getanimlength( maps\_utility::getanim_generic( "gulag_sewer_slide" ) );
    wait(var_2 * 0.28);
    self unlink();
    maps\_utility::anim_stopanimscripted();
    var_1.origin = self.origin;
    var_1.angles = ( 0.0, 80.0, 0.0 );
    var_1 maps\_anim::anim_generic_run( self, "stand_2_run_F_2" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    self.a._id_C55F = 4.6;
    var_0 maps\_anim::anim_generic_reach( self, "run_turn_R45" );
    var_0 maps\_anim::anim_generic_run( self, "run_turn_R45" );
    thread maps\_anim::anim_generic_gravity( self, "run_react_stumble_non_loop" );
    self playsound( "generic_pain_american_" + randomintrange( 1, 9 ) );
    common_scripts\utility::flag_wait( "street_btr_death" );
    thread maps\_anim::anim_generic( self, "bog_b_spotter_react" );
    self playsound( "generic_pain_american_" + randomintrange( 1, 9 ) );
    wait 0.05;
    self setanimtime( maps\_utility::getanim_generic( "bog_b_spotter_react" ), 0.1 );
    var_2 = getanimlength( maps\_utility::getanim_generic( "bog_b_spotter_react" ) );
    wait(var_2 * 0.72 - 0.05);
    maps\_utility::anim_stopanimscripted();
    maps\_utility::delaythread( 0.5, maps\_utility::dialogue_queue, "dcemp_ar1_whatsgoinon" );
    var_3 = spawn( "script_origin", self.origin );
    var_3.angles = self.angles;
    self linkto( var_3 );
    var_3 common_scripts\utility::delaycall( 0.25, ::rotateyaw, 25, 0.5 );
    var_3 maps\_anim::anim_generic_run( self, "crouch_2run_F" );
    self unlink();
    var_3 delete();
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "run_turn_R45" );
    var_0 maps\_anim::anim_generic_run( self, "run_turn_R45" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "run_react_flinch_non_loop" );
    var_0 maps\_anim::anim_generic_run( self, "run_react_flinch_non_loop" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_4 = getent( "safeZoneAnimationNode", "targetname" );
    var_4 maps\_anim::anim_reach_solo( self, "safe_zone_in" );
    self.a._id_C55F = undefined;
    common_scripts\utility::flag_set( "Sandler_can_jump" );
    var_4 maps\_anim::anim_single_solo( self, "safe_zone_in" );
    var_4 thread maps\_anim::anim_loop_solo( self, "safe_zone_idle", "exit_shelter" );
    readytoexittheshelter();
    maps\_utility::disable_heat_behavior();
    maps\_utility::enable_arrivals();
    var_0 = getnode( "street_macey_hide_node", "targetname" );
    self setgoalnode( var_0 );
    maps\_utility::enable_pain();
    self.moveplaybackrate = 1.0;
}

_id_CCAA()
{
    maps\_utility::anim_stopanimscripted();
    maps\_utility::delaythread( 2.75, maps\_utility::dialogue_queue, "dcemp_cpd_notgood" );
    maps\_utility::enable_heat_behavior();
    maps\dcemp_code::_id_D4EA( self, "CornerCrR_trans_OUT_F" );
    var_0 = common_scripts\utility::getstruct( "street_marine1_anim0", "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "run_reaction_L_quick" );
    maps\_utility::delaythread( 0, maps\_utility::dialogue_queue, "dcemp_cpd_whoa" );
    var_0 maps\_anim::anim_generic_run( self, "run_reaction_L_quick" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0.origin = self.origin;
    var_0 maps\_anim::anim_generic_run( self, "run_turn_R45" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    self.a._id_C55F = 4.6;
    var_0 maps\_anim::anim_generic_reach( self, "run_reaction_R_quick" );
    maps\_utility::delaythread( 0.0, maps\_utility::dialogue_queue, "dcemp_cpd_holy" );
    var_0 maps\_anim::anim_generic_run( self, "run_reaction_R_quick" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0.origin = self.origin;
    var_0 maps\_anim::anim_generic_run( self, "run_turn_L45" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "exposed_idle_reactB" );
    var_0 thread maps\_anim::anim_generic( self, "exposed_idle_reactB" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "exposed_idle_reactB" ) );
    self playsound( "generic_pain_american_" + randomintrange( 1, 9 ) );
    wait(var_1 - 0.75);
    maps\_utility::anim_stopanimscripted();
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "run_pain_fallonknee_03" );
    level.foley maps\_utility::delaythread( 0.5, maps\_utility::dialogue_queue, "dcemp_fly_justkeepmovin" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "run_pain_fallonknee_03" ) );
    maps\_utility::delaythread( var_1 - 0.5, maps\_utility::dialogue_queue, "dcemp_cpd_lookout" );
    var_0 maps\_anim::anim_generic_run( self, "run_pain_fallonknee_03" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    maps\_utility::disable_heat_behavior();
    var_2 = getent( "safeZoneAnimationNode", "targetname" );
    var_2 maps\_anim::anim_reach_solo( self, "safe_zone_in" );
    var_2 maps\_anim::anim_single_solo( self, "safe_zone_in" );
    self.a._id_C55F = undefined;
    var_2 thread maps\_anim::anim_loop_solo( self, "safe_zone_idle", "exit_shelter" );
    readytoexittheshelter();
    maps\_utility::disable_heat_behavior();
    maps\_utility::enable_arrivals();
    var_0 = getnode( "street_marine1_hide_node", "targetname" );
    self setgoalnode( var_0 );
    maps\_utility::enable_pain();
    self.moveplaybackrate = 1.0;
}

_id_C127()
{
    maps\_utility::anim_stopanimscripted();
    var_0 = common_scripts\utility::getstruct( "street_macey_anim0", "targetname" );
    maps\_utility::enable_heat_behavior();
    maps\dcemp_code::_id_D4EA( self, "corner_standR_trans_OUT_6" );
    maps\dcemp_code::_id_D4EA( self, "run_turn_L90" );
    maps\dcemp_code::_id_D4EA( self, "run_turn_L45" );
    maps\_utility::disable_exits();
    maps\_utility::disable_arrivals();
    self.a.pose = "stand";
    var_0 maps\_anim::anim_generic_reach( self, "exposed_idle_reactB" );
    var_0 thread maps\_anim::anim_generic( self, "exposed_idle_reactB" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "exposed_idle_reactB" ) );
    self playsound( "generic_pain_american_" + randomintrange( 1, 9 ) );
    maps\_utility::delaythread( var_1 - 1.0, maps\_utility::dialogue_queue, "dcemp_fly_dontstop" );
    wait(var_1 - 0.75);
    maps\_utility::anim_stopanimscripted();
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    self.a._id_C55F = 4.6;
    var_0 maps\_anim::anim_generic_reach( self, "run_pain_fallonknee" );
    self playsound( "generic_pain_american_" + randomintrange( 1, 9 ) );
    var_0 maps\_anim::anim_generic_run( self, "run_pain_fallonknee" );
    maps\_utility::delaythread( 0, maps\_utility::dialogue_queue, "dcemp_fly_gogogo" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "slide_across_car" );
    self playsound( "generic_pain_american_" + randomintrange( 1, 9 ) );
    var_0 maps\_anim::anim_generic_run( self, "slide_across_car" );
    level._id_ACC0 maps\_utility::delaythread( 1.0, maps\_utility::dialogue_queue, "dcemp_cpd_EMP" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "run_react_duck_non_loop" );
    self playsound( "generic_pain_american_" + randomintrange( 1, 9 ) );
    var_0 maps\_anim::anim_generic_run( self, "run_react_duck_non_loop" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = getent( "safeZoneAnimationNode", "targetname" );
    var_2 maps\_anim::anim_reach_solo( self, "safe_zone_in" );
    self.a._id_C55F = undefined;
    var_2 maps\_anim::anim_single_solo( self, "safe_zone_in" );
    var_2 thread maps\_anim::anim_loop_solo( self, "safe_zone_idle", "FoleyCanGo" );
    readytoexittheshelter();
    maps\_utility::disable_heat_behavior();
    maps\_utility::enable_arrivals();
    maps\_utility::enable_exits();
    var_0 = getnode( "corner_macey_hide_node", "targetname" );
    self setgoalnode( var_0 );
    maps\_utility::enable_pain();
    self.moveplaybackrate = 1.0;
}

_id_D350()
{
    common_scripts\utility::array_thread( getentarray( "meetup_allies", "targetname" ), maps\_utility::add_spawn_function, ::_id_D4CC );
    getent( "street_btr", "targetname" ) maps\_utility::add_spawn_function( maps\dcemp_code::_id_CE3F );
    getent( "street_crash_motorcycle", "targetname" ) thread maps\dcemp_code::_id_A98E();
    common_scripts\utility::array_thread( getentarray( "street_crash_heli", "script_noteworthy" ), maps\dcemp_code::_id_B77C );
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "street_crash_heli_anim", "script_noteworthy" ), maps\dcemp_code::_id_BD58 );
    common_scripts\utility::array_thread( getentarray( "corner_truck_engine_crash", "targetname" ), maps\dcemp_code::_id_CC34 );
    thread _id_CFB0();
    var_0 = getent( "hide_clip", "targetname" );
    var_0 connectpaths();
    var_0 notsolid();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "emp_entity_cleanup_done" );
    maps\_utility::add_func( maps\_utility::activate_trigger_with_targetname, "street_btr_spawner" );
    thread maps\_utility::do_wait();
}

_id_D046( var_0, var_1 )
{
    var_2 = 0;

    if ( var_0 != 0 )
        var_3 = var_1 / var_0;
    else
        var_3 = var_1;

    while ( var_2 < var_1 )
    {
        var_2 = common_scripts\utility::_id_D0EA( var_2 + var_3, var_1 );
        self setlightintensity( var_2 );
        waitframe();
    }
}

_id_D4CC()
{
    _id_BDA7();
    var_0 = getent( "safeZoneAnimationNode", "targetname" );

    if ( self.script_noteworthy == "marine3" )
    {
        var_0 thread maps\_anim::anim_loop_solo( self, "safe_zone_idle", "exit_shelter" );
        readytoexittheshelter();
        return;
    }

    self.team = "neutral";
    var_1 = common_scripts\utility::getstruct( self.target, "targetname" );
    self forceteleport( var_1.origin, var_1.angles );
    common_scripts\utility::flag_wait( "street_marine2_hide" );
    self.team = "allies";
    wait 0.5;
    var_0 maps\_anim::anim_reach_solo( self, "safe_zone_in" );
    var_0 maps\_anim::anim_single_solo( self, "safe_zone_in" );
    var_0 thread maps\_anim::anim_loop_solo( self, "safe_zone_idle", "exit_shelter" );
    readytoexittheshelter();
}

readytoexittheshelter()
{
    if ( !isdefined( level.soldierreadytoexit ) )
        level.soldierreadytoexit = 0;

    level.soldierreadytoexit++;
    waitframe();

    if ( level.soldierreadytoexit == 5 )
        common_scripts\utility::flag_set( "squadReadyToLeave" );
}

_id_BDA7()
{
    maps\dcemp_code::_id_C743( self );
    maps\_utility::ent_flag_init( "street_hide" );
    thread maps\_utility::magic_bullet_shield();
    maps\dcemp_code::_id_C3F4( 1 );
    maps\_utility::disable_pain();
    maps\_utility::pathrandompercent_zero();
    maps\_utility::walkdist_zero();
}

_id_A8B3()
{
    common_scripts\utility::flag_wait( "corner_main" );
    thread _id_AAED();
    var_0 = undefined;
    var_0 = "-42263 6917 183";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_0 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_0 );

    foreach ( var_2 in level.team )
        var_2.walkdistfacingmotion = 0;

    common_scripts\utility::array_thread( level.team, maps\_utility::enable_arrivals );
    common_scripts\utility::array_thread( level.team, maps\_utility::enable_exits );
    common_scripts\utility::array_thread( level.team, maps\_utility::enable_pain );
    common_scripts\utility::flag_wait( "corner_look_outside" );
    thread maps\dcemp_code::_id_B72A();
    level.foley thread _id_C045();
    level.team["dunn"] thread _id_D2EC();
    level.team["marine1"] thread _id_B787();
    level.team["marine2"] thread _id_CF0E();
    level.team["marine3"] thread _id_BEB6();
    common_scripts\utility::flag_wait( "corner_moveout" );
    level._id_CD9B++;
    objective_add( level._id_CD9B, "active", &"DCEMP_OBJ_FOLLOW_SGT_FOLEY", level.foley.origin );
    objective_current( level._id_CD9B );
    objective_onentity( level._id_CD9B, level.foley, ( 0.0, 0.0, 70.0 ) );
    thread _id_C696();
    maps\_utility::add_wait( maps\_utility::array_wait, level.team, "corner_at_plane" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "meetup_main" );
    thread maps\_utility::do_wait();
}

_id_AAED()
{
    common_scripts\utility::flag_wait( "allow_ammo_pickups" );
    objective_state( level._id_CD9B, "done" );
}

_id_C696()
{
    wait 4.5;
    var_0 = level.team["marine1"];
    var_0 maps\_utility::dialogue_queue( "dcemp_ar1_thisisweird" );
    wait 0.5;
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_soquiet" );
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_heywhatthe" );
    var_0 maps\_utility::dialogue_queue( "dcemp_ar1_minedowntoo" );
    wait 0.5;
    level.foley thread maps\_utility::dialogue_queue( "dcemp_fly_empblast" );
}

_id_C045()
{
    maps\_utility::enable_cqbwalk();
    self waittillmatch( "single anim", "end" );
    self setgoalpos( self.origin );
    thread maps\_utility::flag_set_delayed( "corner_moveout", 1.0 );
    var_0 = common_scripts\utility::getstruct( "corner_anim2a", "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "patrol_jog_360_once" );
    var_0 maps\_anim::anim_generic_run( self, "CQB_walk_turn_9" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "patrol_jog_360_once" );
    var_0 thread maps\_anim::anim_generic_gravity( self, "patrol_jog_360_once" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "patrol_jog_360_once" ) );
    wait(var_1 * 0.79);
    self clearanim( maps\_utility::getanim_generic( "patrol_jog_360_once" ), 0.2 );
    self notify( "killanimscript" );
    maps\_utility::disable_cqbwalk();
    self.alertlevel = "noncombat";
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_reach_solo( self, "hunted_woundedhostage_check" );
    var_2 = [];
    var_2[var_2.size] = self;
    var_2[var_2.size] = level._id_BEE1;
    level._id_BEE1 setcontents( 0 );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::anim_single( var_2, "hunted_woundedhostage_check" );
    thread maps\_utility::dialogue_queue( "dcemp_fly_dammit" );
    self notify( "corner_at_plane" );
    var_0 maps\_anim::anim_generic_run( self, "DCemp_wounded_check_end" );
    self.a.pose = "stand";
    self setgoalpos( self.origin );
}

_id_B787()
{
    maps\_utility::enable_cqbwalk();
    self waittillmatch( "single anim", "end" );
    var_0 = common_scripts\utility::getstruct( "corner_anim1", "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "patrol_jog_look_up_once" );
    var_0 maps\_anim::anim_generic_run( self, "patrol_jog_look_up_once" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "CQB_walk_turn_9" );
    var_0 maps\_anim::anim_generic_run( self, "CQB_walk_turn_9" );
    maps\_utility::disable_cqbwalk();
    maps\_utility::set_generic_run_anim_array( "casual_killer_jog" );
    self.alertlevel = "noncombat";
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "casual_killer_jog_stop" );
    level endon( "meetup_go" );
    self notify( "corner_at_plane" );
    maps\_anim::anim_generic_run( self, "casual_killer_jog_stop" );
    self setgoalpos( self.origin );
}

_id_CF0E()
{
    maps\_utility::enable_cqbwalk();
    self waittillmatch( "single anim", "end" );
    maps\dcemp_code::_id_C3F4( 0 );
    waittillframeend;
    var_0 = common_scripts\utility::getstruct( "corner_anim1", "targetname" );
    self.a._id_C55F = 6;
    var_0 maps\_anim::anim_generic_reach( self, "patrol_jog_360_once" );
    self.a._id_C55F = undefined;
    var_0 maps\_anim::anim_generic_run( self, "patrol_jog_360_once" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    maps\_utility::enable_cqbwalk();
    var_0 maps\_anim::anim_generic_reach( self, "CQB_walk_turn_9" );
    self notify( "corner_at_plane" );
    var_0 maps\_anim::anim_generic_run( self, "CQB_walk_turn_9" );
    var_0 = getnode( "corner_anim4", "targetname" );
    maps\_utility::follow_path( var_0 );
    maps\_utility::disable_cqbwalk();
    maps\dcemp_code::_id_C3F4( 1 );
}

_id_BEB6()
{
    maps\_utility::enable_cqbwalk();
    self waittillmatch( "single anim", "end" );
    maps\dcemp_code::_id_C3F4( 0 );
    waittillframeend;
    var_0 = common_scripts\utility::getstruct( "corner_anim5b", "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "CQB_walk_turn_9" );
    var_0 maps\_anim::anim_generic_run( self, "CQB_walk_turn_9" );
    maps\_utility::disable_cqbwalk();
    var_0 = getnode( "corner_anim5", "targetname" );
    maps\_utility::follow_path( var_0 );
    maps\dcemp_code::_id_C3F4( 1 );
    self notify( "corner_at_plane" );
}

_id_D2EC()
{
    maps\_utility::enable_cqbwalk();
    self waittillmatch( "single anim", "end" );
    var_0 = common_scripts\utility::getstruct( "corner_anim3", "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "combatwalk_F_spin" );
    var_0 maps\_anim::anim_generic_run( self, "combatwalk_F_spin" );
    maps\_utility::disable_cqbwalk();
    maps\_utility::set_generic_run_anim_array( "casual_killer_jog" );
    self.alertlevel = "noncombat";
    thread maps\_utility::dialogue_queue( "dcemp_cpd_checkitout" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "casual_killer_jog_stop" );
    level endon( "meetup_go" );
    self notify( "corner_at_plane" );
    var_0 maps\_anim::anim_generic_run( self, "casual_killer_jog_stop" );
    self setgoalpos( self.origin );
}

_id_CFB0()
{
    getent( "corner_engine", "targetname" ) thread maps\dcemp_code::_id_C2BD();
    common_scripts\utility::flag_wait( "street_crash_heli_done" );
    wait 2.5;
    common_scripts\utility::flag_set( "corner_start_crash_scene" );
    common_scripts\utility::flag_wait( "corner_engine_hit" );
    common_scripts\_exploder::exploder( "corner_fire_trails" );
    maps\dcemp_code::_id_BD06();
    wait 1.0;
    var_0 = getent( "planeTurbine_fire_light", "targetname" );
    var_0 thread _id_D046( 120, 5600 );
    var_0 = getent( "planeTurbine_fire_light02", "targetname" );
    var_0 thread _id_D046( 120, 8600 );
}

_id_C6D7()
{
    getent( "meetup_runner", "targetname" ) maps\_utility::add_spawn_function( ::_id_B0D4 );
    common_scripts\utility::flag_wait( "meetup_main" );
    var_0 = undefined;
    var_0 = "-42263 6917 183";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_0 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_0 );
    level.foley thread _id_CC2B();
    level._id_ACC0 thread _id_BA87();
    level.team["marine1"] thread _id_ABD7();
    level.team["marine2"] thread _id_CAD6();
    level.team["marine3"] thread _id_D1A1();
    common_scripts\utility::flag_wait( "meetup_show_guys" );
    thread common_scripts\utility::play_sound_in_space( "elm_thunder_distant", level.player.origin + ( 0.0, 0.0, 60.0 ) );
    maps\_utility::delaythread( 3, maps\_weather::rainmedium, 20 );
    maps\_utility::delaythread( 0, maps\_weather::lightning, _id_CD74::lightning_normal, _id_CD74::lightning_flash );
    thread common_scripts\utility::play_sound_in_space( "elm_thunder_strike", level.player.origin + ( 0.0, 0.0, 60.0 ) );
    maps\_utility::delaythread( 6, common_scripts\utility::flag_set, "start_rain_ambience" );
    maps\_utility::delaythread( 6, ::meetup_rain_ripples );
    thread _id_B80F();
    wait 1;
    thread maps\_utility::autosave_by_name( "meetup_main" );
    level.foley setlookatentity( level.team["marine1"] );
    level.foley common_scripts\utility::delaycall( 2, ::setlookatentity );
    level.foley common_scripts\utility::delaycall( 2.75, ::setlookatentity, level._id_ACC0 );
    level.foley common_scripts\utility::delaycall( 5.5, ::setlookatentity );
    level.foley thread maps\_anim::anim_facialfiller( "done_talking", undefined );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_regroup" );
    level.foley notify( "done_talking" );
    level._id_ACC0 thread maps\_utility::dialogue_queue( "dcemp_cpd_huah2" );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreme, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreall, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_zero );
    common_scripts\utility::array_thread( level.team, maps\dcemp_code::_id_C3F4, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_zero );
    common_scripts\utility::flag_set( "meetup_moveout" );
    setsaveddvar( "cg_crosshairEnemyColor", "0" );
    maps\_utility::delaythread( 4, maps\_utility::activate_trigger, "meetup_runner", "target" );
    thread maps\_utility::flag_set_delayed( "rain_started", 11 );
    thread maps\_utility::flag_set_delayed( "rain_mask_on", 11 );
    common_scripts\utility::flag_wait( "meetup_challenge_start" );
    var_1 = spawn( "script_origin", level._id_B624 geteye() + ( 0.0, 0.0, 16.0 ) );
    var_1 linkto( level._id_B624 );
    level._id_ACC0 setentitytarget( var_1 );
    level._id_ACC0 maps\_utility::enable_dontevershoot();
    level._id_ACC0 maps\_utility::set_ignoreall( 0 );
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_star" );
    common_scripts\utility::flag_set( "meetup_challenge_done" );
    var_2 = [ level._id_ACC0, level.team["marine1"], level.team["marine3"], level.foley ];
    common_scripts\utility::array_thread( var_2, maps\_utility::clear_run_anim );
    wait 1.25;
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_willfire" );
    thread maps\dcemp_code::_id_C9E4();
    common_scripts\utility::flag_set( "meetup_runner_safe" );
    maps\_utility::delaythread( 0, maps\_weather::lightning, _id_CD74::lightning_normal, _id_CD74::lightning_flash );
    level._id_B624 maps\_utility::dialogue_queue( "dcemp_ar3_dontshoot" );
    setsaveddvar( "cg_crosshairEnemyColor", "1" );
    wait 0.5;
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_properresponse" );
    common_scripts\utility::flag_set( "foley_street_dialog_end" );
    common_scripts\utility::flag_wait( "lobby_main" );
    var_1 delete();
    thread maps\dcemp_code::kill_office_enemies_with_cheat();
}

_id_CC2B()
{
    common_scripts\utility::flag_wait( "meetup_moveout" );
    wait 1.5;
    _id_B089( "corner_flash_1" );
}

_id_BA87()
{
    common_scripts\utility::flag_wait( "meetup_moveout" );
    maps\_utility::enable_heat_behavior();
    maps\_utility::clear_run_anim();
    var_0 = getnode( "corner_flash_3", "targetname" );
    self.goalradius = 120;
    self setgoalnode( var_0 );
    self waittill( "goal" );
    maps\_utility::disable_heat_behavior();
}

_id_ABD7()
{
    common_scripts\utility::flag_wait( "meetup_moveout" );
    wait 2;
    _id_B089( "corner_flash_4" );
}

_id_CAD6()
{
    common_scripts\utility::flag_wait( "meetup_moveout" );
    wait 3;
    maps\_utility::set_generic_run_anim_array( "casual_killer_jog" );
    var_0 = getnode( "corner_flash_5", "targetname" );
    self setgoalnode( var_0 );
}

_id_D1A1()
{
    common_scripts\utility::flag_wait( "meetup_moveout" );
    wait 1.5;
    maps\_utility::set_generic_run_anim_array( "casual_killer_jog" );
    var_0 = getnode( "corner_flash_2", "targetname" );
    self setgoalnode( var_0 );
}

_id_D302( var_0, var_1 )
{
    var_2 = common_scripts\utility::getstruct( var_1, "targetname" );
    var_0.origin = self.origin;
    var_0.angles = vectortoangles( var_2.origin - self.origin );
    self orientmode( "face angle", var_0.angles[1] );
    self setgoalpos( self.origin );
    wait 0.5;
    var_0 thread maps\dcemp_code::_id_D4EA( self, "patrol_bored_2_walk" );
    maps\_utility::clear_run_anim();
    maps\_utility::disable_arrivals();
    maps\_utility::disable_exits();
    waittillframeend;
    maps\_utility::set_generic_run_anim( "patrol_bored_patrolwalk" );
    self setgoalpos( var_2.origin );
    self.goalradius = 16;
}

_id_ABEC()
{
    self endon( "movingout" );
    self waittill( "goal" );
    maps\_anim::anim_generic_gravity( self, "patrol_bored_walk_2_bored" );
    self setgoalpos( self.origin );
}

_id_B089( var_0 )
{
    self setlookatentity();
    self notify( "movingout" );
    maps\_utility::clear_run_anim();
    maps\_utility::enable_arrivals();
    waittillframeend;
    maps\_utility::set_generic_run_anim_array( "casual_killer_jog" );
    var_1 = getnode( var_0, "targetname" );
    var_2 = spawn( "script_origin", self.origin );
    var_2.angles = self.angles;
    self linkto( var_2 );
    maps\_utility::disable_exits();
    var_3 = 0.75;
    var_2 rotateto( vectortoangles( var_1.origin - var_2.origin ), var_3, var_3 );
    var_2 thread maps\_anim::anim_generic_run( self, "casual_killer_jog_start" );
    var_2 waittill( "rotatedone" );
    self unlink();
    self setgoalnode( var_1 );
    var_2 delete();
    maps\_utility::delaythread( 3, maps\_utility::enable_exits );
}

_id_B0D4()
{
    thread maps\dcemp_code::sun_angles_change_setup();
    level._id_B624 = self;
    self.animname = "runner";
    maps\dcemp_code::_id_C3F4( 1 );
    thread maps\_utility::magic_bullet_shield();
    self.name = "";
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = getent( "meetup_door_left", "targetname" );
    var_2 = getent( "office_door_clip", "targetname" );
    var_2 linkto( var_1 );
    var_2 connectpaths();
    var_3 = 1.25;
    var_1 common_scripts\utility::delaycall( 2.0, ::rotateyaw, -90, var_3, 0, var_3 );
    var_2 common_scripts\utility::delaycall( 2.5 + var_3, ::disconnectpaths );
    maps\_utility::delaythread( 1.75, common_scripts\_exploder::exploder, "meetup_dooropen" );
    maps\_utility::disable_surprise();
    maps\_utility::disable_bulletwhizbyreaction();
    maps\_utility::pathrandompercent_zero();
    maps\_utility::walkdist_zero();
    maps\_utility::set_fixednode_false();
    var_0 maps\_anim::anim_generic_run( self, "cargoship_open_cargo_guyL" );
    thread meetup_runner_running( var_0 );
    var_0 = getent( var_0.target, "targetname" );
    wait 2.05;
    common_scripts\utility::flag_set( "meetup_challenge_start" );
    var_0 = getent( var_0.target, "targetname" );
    wait 7.6;
    common_scripts\utility::flag_wait( "meetup_runner_safe" );
    self.name = "Pvt. Vaughan";
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    common_scripts\utility::flag_wait( "meetup_do_scripted_scene" );
    var_4 = [];
    var_4[var_4.size] = self;
    var_4[var_4.size] = level._id_ACC0;
    var_0 maps\dcemp_code::_id_D4EA( self, "DCemp_run_sequence_runner" );
    var_0 = getent( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "unarmed_climb_wall" );
    self linkto( var_0 );
    maps\_utility::gun_remove();
    var_0 thread maps\_anim::anim_generic_run( self, "unarmed_climb_wall" );
    self waittillmatch( "single anim", "footstep_right_large" );
    self waittillmatch( "single anim", "footstep_right_large" );
    wait 0.25;
    var_0 movez( 4, 0.35 );
    self waittillmatch( "single anim", "footstep_left_small" );
    wait 0.5;
    var_5 = anglestoforward( var_0.angles );
    var_5 *= 16;
    var_0 moveto( var_0.origin + var_5, 0.5 );
    var_0 waittill( "unarmed_climb_wall" );
    maps\_utility::gun_recall();
    self unlink();
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 64;
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 64;
    self waittill( "goal" );
    maps\_utility::stop_magic_bullet_shield();
    self delete();
}

meetup_runner_running( var_0 )
{
    var_0 maps\_anim::anim_single_solo( self, "h2_DCemp_run_sequence_runner" );
    common_scripts\utility::flag_set( "meetup_do_scripted_scene" );
}

meetup_rain_ripples()
{
    wait 18;
    common_scripts\_exploder::exploder( "rain_ripple_street" );
}

_id_BC49()
{
    thread maps\dcemp_code::_id_D579();
    thread maps\dcemp_code::_id_C187();
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "lobby_vision_change" );
    level.player maps\_utility::add_func( maps\_utility::blend_movespeedscale, 0.65 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "lobby_robo_death" );
    level.player maps\_utility::add_func( maps\_utility::blend_movespeedscale, 0.77 );
    thread maps\_utility::do_wait();
    common_scripts\_exploder::exploder( "moon" );
    var_0 = undefined;
    var_0 = "-42263 6917 183";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_0 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_0 );
    common_scripts\utility::flag_wait( "lobby_main" );
    level.player.ignoreme = 0;
    common_scripts\utility::array_thread( level.team, maps\_utility::clear_run_anim );
    common_scripts\utility::array_thread( level.team, maps\_utility::enable_exits );
    common_scripts\utility::array_thread( level.team, maps\_utility::enable_arrivals );
    common_scripts\utility::array_call( level.team, ::setlookatentity );
    thread maps\_utility::autosave_by_name( "lobby_main" );
    level.foley maps\_utility::delaythread( 0.5, maps\_utility::dialogue_queue, "dcemp_fly_heardtheman" );
    level.foley thread maps\_anim::anim_generic_gravity( level.foley, "exposed_tracking_turn180L" );
    wait 1.5;
    objective_add( level._id_CD9B, "active", &"DCEMP_OBJ_GET_TO_WHISKEY_HOTEL" );
    level._id_CD9B = 3;
    objective_add( level._id_CD9B, "invisible", &"DCEMP_OBJ_FOLLOW_SGT_FOLEY" );
    _func_1E7( level._id_CD9B, 1 );
    objective_state_nomessage( level._id_CD9B, "current" );
    objective_onentity( level._id_CD9B, level.foley, ( 0.0, 0.0, 70.0 ) );
    _id_C043();
    thread _id_D149();
    common_scripts\utility::flag_set( "office_main" );
}

_id_D149()
{
    level.foley maps\_utility::add_wait( maps\_utility::waittill_msg, "reached_path_end" );
    level._id_ACC0 maps\_utility::add_wait( maps\_utility::waittill_msg, "reached_path_end" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "meetup_movein" );
    maps\_utility::do_wait();
    level.foley thread maps\_utility::dialogue_queue( "dcemp_fly_dunnyoureup" );
    wait 1.5;
    level._id_ACC0 thread maps\_utility::dialogue_queue( "dcemp_cpd_huah2" );
    common_scripts\utility::flag_set( "lobby_check" );
    common_scripts\utility::flag_wait( "lobby_clear" );
    thread maps\dcemp_code::hide_stuff_from_offices();
    wait 1;
    level.team["marine2"] maps\_utility::dialogue_queue( "dcemp_ar2_gotoursix" );
    level.foley thread maps\_utility::dialogue_queue( "dcemp_fly_copythat" );
    common_scripts\utility::flag_wait( "lobby_robo_death" );
    var_0 = common_scripts\utility::array_remove( level.team, level._id_ACC0 );
    var_0 = common_scripts\utility::array_remove( var_0, level.foley );
    common_scripts\utility::array_thread( var_0, maps\_utility::set_ignoreme, 0 );
    common_scripts\utility::array_thread( var_0, maps\_utility::set_ignoreall, 0 );
    common_scripts\utility::array_thread( var_0, maps\_utility::walkdist_reset );
    common_scripts\utility::array_thread( var_0, maps\_utility::enable_exits );
    common_scripts\utility::array_thread( var_0, maps\_utility::enable_arrivals );
    common_scripts\utility::array_thread( var_0, maps\_utility::pathrandompercent_reset );
    common_scripts\utility::array_thread( var_0, maps\dcemp_code::_id_C3F4, 0 );
    common_scripts\utility::array_thread( var_0, maps\_utility::enable_pain );
    maps\_utility::trigger_wait_targetname( "office_ally_color_2" );
    common_scripts\utility::flag_set( "office_go_red" );
    var_0 = maps\_utility::array_removedead( var_0 );
    common_scripts\utility::array_thread( var_0, maps\_utility::set_force_color, "red" );
    setsaveddvar( "ai_friendlyFireBlockDuration", "2000" );
}

_id_C043()
{
    var_0 = getnodearray( "lobby_start_nodes", "targetname" );
    var_1 = [];
    var_1["dunn"] = ::_id_C272;
    var_1["foley"] = ::_id_BDB3;
    var_1["marine3"] = ::_id_D4C1;
    var_1["marine2"] = ::_id_D16A;
    var_1["marine1"] = ::_id_AB50;

    foreach ( var_3 in var_0 )
    {
        var_4 = 0;
        var_5 = var_3.script_noteworthy;

        switch ( var_5 )
        {
            case "dunn":
                var_4 = 0;
                break;
            case "marine2":
                var_4 = 0.5;
                break;
            case "marine3":
                var_4 = 0.75;
                break;
            case "marine1":
                var_4 = 0.15;
                break;
            case "foley":
                var_4 = 0.35;
                break;
        }

        level.team[var_5] allowedstances( "stand", "crouch", "prone" );
        level.team[var_5] maps\_utility::delaythread( var_4, var_1[var_5], var_3 );
        level.team[var_5] maps\_utility::delaythread( var_4, maps\_utility::set_fixednode_false );
    }
}

_id_C272( var_0 )
{
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    self notify( "reached_path_end" );
    common_scripts\utility::flag_wait( "lobby_check" );
    maps\_utility::enable_cqbwalk();
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    thread maps\_anim::anim_generic( self, "corner_standR_trans_CQB_OUT_8" );
    wait 2.3;
    maps\_utility::anim_stopanimscripted();
    var_0 thread maps\_anim::anim_generic_run( self, "combatwalk_F_spin" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "combatwalk_F_spin" ) );
    wait(var_1 - 1.5);
    thread maps\_utility::dialogue_queue( "dcemp_cpd_clear" );
    thread maps\_utility::flag_set_delayed( "lobby_clear", 1 );
    var_0 = getnode( var_0.target, "targetname" );
    maps\_utility::follow_path( var_0 );
    maps\_utility::walkdist_reset();
    maps\_utility::enable_exits();
    maps\_utility::enable_arrivals();
    maps\_utility::disable_pain();
    maps\_utility::disable_surprise();
    maps\_utility::disable_bulletwhizbyreaction();
    maps\_utility::disable_cqbwalk();
    common_scripts\utility::flag_wait( "lobby_robo_death" );
    maps\_utility::delaythread( 0.5, maps\_utility::dialogue_queue, "dcemp_cpd_sonofa" );
    maps\_utility::set_ignoreme( 0 );
    maps\_utility::set_ignoreall( 0 );
    maps\_utility::enable_dontevershoot();
    thread maps\_anim::anim_generic( self, "corner_standR_flinchB" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "corner_standR_flinchB" ) );
    wait(var_1 * 0.65);
    maps\_utility::anim_stopanimscripted();
    var_0 = common_scripts\utility::getstruct( "lobby_door_open2a", "targetname" );
    var_2 = spawn( "script_origin", self.origin );
    var_2.angles = ( 0.0, 225.0, 0.0 );
    var_2 thread maps\_anim::anim_generic_run( self, "exposed_tracking_turn180L" );
    thread _id_AA9C();
    var_2 waittill( "exposed_tracking_turn180L" );
    var_0 thread maps\_anim::anim_generic_run( self, "breach_kick_kickerR1_enter" );
    wait 0.25;
    maps\_utility::disable_dontevershoot();
    maps\_utility::set_force_color( "red" );
    wait 0.05;
    self.goalradius = 32;
    maps\_utility::add_wait( maps\_utility::waittill_msg, "goal" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "office_go_red" );
    maps\_utility::do_wait_any();
    maps\_utility::pathrandompercent_reset();
    maps\_utility::enable_pain();
    maps\_utility::enable_surprise();
    maps\_utility::enable_bulletwhizbyreaction();
    maps\dcemp_code::_id_C3F4( 0 );
}

_id_AA9C()
{
    wait 1.15;

    if ( level.foley maps\_utility::ent_flag( "lobby_door_ready" ) )
        level.foley._id_B136 thread maps\_anim::anim_generic( level.foley, "CQB_stand_grenade_throw" );
}

_id_BDB3( var_0 )
{
    maps\_utility::ent_flag_init( "lobby_door_ready" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    self notify( "reached_path_end" );
    common_scripts\utility::flag_wait( "lobby_clear" );
    maps\_utility::enable_cqbwalk();
    wait 2;
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "patrol_jog_360_once" );
    var_0 thread maps\_anim::anim_generic( self, "patrol_jog_360_once" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "patrol_jog_360_once" ) );
    wait(var_1 * 0.68 - 0.05);
    maps\_utility::anim_stopanimscripted();
    var_0 = getnode( var_0.target, "targetname" );
    self._id_B136 = var_0;
    maps\_utility::follow_path( var_0 );
    common_scripts\utility::flag_set( "lobby_door_ready" );
    maps\_utility::disable_cqbwalk();
    var_2 = common_scripts\utility::getstruct( "lobby_arrive_foley", "targetname" );
    var_2 maps\_anim::anim_generic_reach( self, "run_2_stand_90R" );
    var_2 maps\_anim::anim_generic( self, "run_2_stand_90R" );
    self.goalradius = 8;
    self setgoalnode( var_0 );
    maps\_utility::ent_flag_set( "lobby_door_ready" );
    common_scripts\utility::flag_wait( "office_player_near_door" );
    thread maps\_anim::anim_generic( self, "stand_exposed_wave_down" );
    maps\_utility::disable_pain();
    maps\_utility::disable_surprise();
    maps\_utility::disable_bulletwhizbyreaction();
    common_scripts\utility::flag_wait( "lobby_robo_death" );
    maps\_utility::delaythread( 1.5, maps\_utility::dialogue_queue, "dcemp_fly_contact" );
    maps\_anim::anim_generic_gravity( self, "exposed_idle_reactB" );
    common_scripts\utility::flag_wait( "lobby_door_kick" );
    maps\_utility::walkdist_reset();
    maps\_utility::set_ignoreme( 0 );
    maps\_utility::set_ignoreall( 0 );
    maps\_utility::enable_arrivals();
    wait 2.25;
    var_0 thread maps\_anim::anim_generic( self, "stand_2_run_F_2" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "stand_2_run_F_2" ) );
    wait(var_1 * 0.82);
    maps\_utility::anim_stopanimscripted();
    thread maps\_anim::anim_generic_run( self, "run_turn_R45" );
    maps\_utility::delaythread( 2, maps\_utility::enable_exits );
    maps\_utility::set_force_color( "red" );
    wait 0.05;
    self.goalradius = 32;
    maps\_utility::add_wait( maps\_utility::waittill_msg, "goal" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "office_go_red" );
    maps\_utility::do_wait_any();
    maps\_utility::pathrandompercent_reset();
    maps\_utility::enable_pain();
    maps\_utility::enable_surprise();
    maps\_utility::enable_bulletwhizbyreaction();
    maps\dcemp_code::_id_C3F4( 0 );
}

_id_D4C1( var_0 )
{
    maps\_utility::disable_exits();
    maps\dcemp_code::_id_D4EA( self, "stand_2_run_L" );
    maps\dcemp_code::_id_D4EA( self, "run_turn_L45" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    maps\_utility::enable_exits();
    self notify( "reached_path_end" );
    common_scripts\utility::flag_wait( "lobby_clear" );
    maps\_utility::enable_cqbwalk();
    var_0 = getnode( var_0.target, "targetname" );
    maps\_utility::follow_path( var_0 );
    maps\_utility::disable_cqbwalk();
    common_scripts\utility::flag_wait( "lobby_door_ready" );
    common_scripts\utility::flag_wait( "office_player_near_door" );
    wait 0.5;

    if ( level.foley maps\_utility::ent_flag( "lobby_door_ready" ) )
    {
        self setlookatentity( level.foley );
        common_scripts\utility::delaycall( 1, ::setlookatentity );
    }

    wait 0.5;
    var_0 = common_scripts\utility::getstruct( "lobby_door_open", "targetname" );
    var_1 = getent( "lobby_door_left", "targetname" );
    var_2 = getentarray( var_1.target, "targetname" );
    var_3 = undefined;

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( var_5.script_parameters ) && var_5.script_parameters == "door_coll" )
            var_3 = var_5;
    }

    common_scripts\utility::array_call( var_2, ::linkto, var_1 );
    level.team["marine3"] maps\_utility::delaythread( 1.5, maps\_utility::dialogue_queue, "dcemp_ar3_star" );
    var_0 thread maps\_anim::anim_generic( self, "hunted_open_barndoor" );
    var_1 thread maps\_utility::hunted_style_door_open( "scn_dcemp_lobby_door_slow_open" );

    if ( isdefined( var_3 ) )
        var_3 connectpaths();

    var_7 = getanimlength( maps\_utility::getanim_generic( "hunted_open_barndoor" ) );
    wait(var_7 * 0.77 - 0.1);
    thread maps\dcemp_code::_id_AD96();
    wait 0.1;
    var_0 = spawnstruct();
    var_0.origin = self.origin;
    var_0.angles = ( 0.0, 48.0, 0.0 );
    common_scripts\utility::flag_set( "lobby_robo_death" );
    thread maps\_utility::play_sound_on_entity( "scn_dcemp_lobby_door_ally_death" );
    var_0 thread maps\_anim::anim_generic( self, "airport_security_guard_pillar_death_R" );
    var_7 = getanimlength( maps\_utility::getanim_generic( "airport_security_guard_pillar_death_R" ) );
    maps\_utility::delaythread( 0.1, animscripts\shared::dropallaiweapons );
    wait(var_7 - 0.1);
    maps\_utility::stop_magic_bullet_shield();
    self.allowdeath = 1;
    self._id_BC99 = 1;
    self.a.nodeath = 1;
    self.noragdoll = 1;
    self kill();
}

_id_D16A( var_0 )
{
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    self notify( "reached_path_end" );
    common_scripts\utility::flag_wait( "lobby_clear" );
    maps\_utility::enable_cqbwalk();
    wait 0.5;
    var_0 = getnode( "lobby_lookaround_node", "target" );
    self.goalradius = 16;
    self setgoalnode( var_0 );
    wait 5.5;
    maps\dcemp_code::_id_C3F4( 0 );
    var_0 = getnode( "lobby_rear_security", "targetname" );
    maps\_utility::follow_path( var_0 );
    maps\_utility::disable_cqbwalk();

    if ( common_scripts\utility::flag( "office_go_red" ) )
        return;

    level endon( "office_go_red" );
    common_scripts\utility::flag_wait( "lobby_door_kick" );
    var_0 = getnode( "office_entry_cover_right", "targetname" );
    self setgoalnode( var_0 );
}

_id_AB50( var_0 )
{
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    self notify( "reached_path_end" );
    common_scripts\utility::flag_wait( "lobby_clear" );
    maps\_utility::enable_cqbwalk();
    wait 2.2;
    var_0 = getnode( var_0.target, "targetname" );
    maps\_utility::follow_path( var_0 );
    maps\_utility::disable_cqbwalk();

    if ( common_scripts\utility::flag( "office_go_red" ) )
        return;

    level endon( "office_go_red" );
    common_scripts\utility::flag_wait( "lobby_door_kick" );
    wait 2.5;
    var_0 = getnode( "lobby_end_dunn", "targetname" );
    self setgoalnode( var_0 );
}

_id_AD29()
{
    thread maps\dcemp_code::_id_D41C( "office_ally_color_", 2, 6 );
    common_scripts\utility::array_thread( getentarray( "office_enemies_wave1", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\dcemp_code::_id_BB57 );
    common_scripts\utility::array_thread( getentarray( "office_enemies_wave1_runner", "targetname" ), maps\_utility::add_spawn_function, maps\dcemp_code::_id_BBD4 );
    common_scripts\utility::array_thread( getentarray( "office_enemies_wave3", "targetname" ), maps\_utility::add_spawn_function, common_scripts\utility::flag_set, "office_enemies_wave3" );
    var_0 = undefined;
    var_0 = "-42263 6917 183";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_0 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_0 );
    thread _id_B80F();
    var_1 = getent( "office_suppressive_fire_target", "targetname" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "office_ally_color_1" );
    maps\_utility::add_func( maps\_utility::activate_trigger_with_targetname, "office_ally_color_1" );
    var_1 maps\_utility::add_call( ::playsound, "scn_dcemp_interior_movement" );
    maps\_utility::add_func( maps\_weather::rainhard, 15 );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "office_main" );
    maps\_utility::activate_trigger( "office_enemies_wave1", "target" );
    common_scripts\utility::flag_wait( "lobby_robo_death" );
    common_scripts\utility::flag_clear( "_weather_lightning_enabled" );
    common_scripts\utility::array_thread( level.team, maps\_utility::delaythread, 0.1, maps\_utility::set_fixednode_true );
    maps\_utility::delaythread( 1.5, maps\_utility::autosave_by_name, "office_main" );
    thread maps\_utility::battlechatter_on();
    thread common_scripts\utility::play_sound_in_space( "RU_callout_custom", ( -43611.0, 14086.0, -2.468 ) );
    var_2 = maps\_utility::get_living_ai_array( "office_enemies_wave1", "script_noteworthy" );
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_2, 2 );
    maps\_utility::add_wait( maps\_utility::trigger_wait, "office_enemies_wave1_runner", "target" );
    maps\_utility::add_abort( common_scripts\utility::flag_wait, "office_ally_color_4" );
    maps\_utility::do_wait();
    maps\dcemp_code::_id_C919();
    common_scripts\utility::flag_set( "rain_fx" );
    common_scripts\_exploder::exploder( "moon" );
    var_2 = maps\_utility::get_living_ai_array( "office_enemies_wave1", "script_noteworthy" );
    var_3 = getentarray( "office_enemies_wave2", "targetname" );

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_3[var_4] delete();

    common_scripts\utility::array_thread( var_2, maps\_utility::set_force_color, "blue" );
    maps\_utility::activate_trigger_with_targetname( "office_enemy_color_1" );
    maps\_utility::activate_trigger( "office_enemies_wave2", "target" );
    level.team["marine1"] maps\_utility::stop_magic_bullet_shield();
    wait 0.1;
    var_2 = maps\_utility::get_living_ai_array( "office_enemies_wave1", "script_noteworthy" );
    var_2 = common_scripts\utility::array_combine( var_2, maps\_utility::get_living_ai_array( "office_enemies_wave2", "script_noteworthy" ) );
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_2, 4 );
    maps\_utility::add_func( maps\_utility::activate_trigger_with_targetname, "office_enemy_color_2" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_2, 8 );
    maps\_utility::add_func( maps\_utility::delaythread, 0.2, maps\_utility::activate_trigger_with_targetname, "office_enemy_color_3" );
    maps\_utility::add_func( maps\dcemp_code::_id_B2C3 );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "office_predict_wave3" );
    thread maps\_utility::autosave_by_name( "office2" );
    var_2 = maps\_utility::get_living_ai_array( "office_enemies_wave1", "script_noteworthy" );
    var_2 = common_scripts\utility::array_combine( var_2, maps\_utility::get_living_ai_array( "office_enemies_wave2", "script_noteworthy" ) );
    var_3 = getentarray( "office_enemies_wave3", "targetname" );

    if ( var_2.size < var_3.size )
    {
        for ( var_4 = 0; var_4 < var_2.size; var_4++ )
            var_3[var_4] delete();
    }
    else
        common_scripts\utility::array_call( var_3, ::delete );

    thread _id_CA4E();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "office_enemies_wave1_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "office_enemies_wave2_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "office_enemies_wave3_dead" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "office_done" );
    maps\_utility::add_func( maps\_utility::delaythread, 2, maps\_utility::autosave_by_name, "office_done" );
    maps\_utility::add_func( maps\_utility::delaythread, 2, common_scripts\utility::flag_set, "parking_main" );
    thread maps\_utility::do_wait();
    thread _id_B4BE();
}

_id_CC77()
{
    wait 9.5;

    foreach ( var_1 in level.team )
        var_1._animactive = 0;
}

_id_CA4E()
{
    common_scripts\utility::flag_wait( "office_enemies_wave3" );
    wait 0.5;
    var_0 = getaiarray( "axis" );
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_0, var_0.size - 1 );
    maps\_utility::add_func( maps\_utility::battlechatter_off );
    thread maps\_utility::do_wait();
}

_id_B4BE()
{
    common_scripts\utility::flag_wait( "parking_player_jumped_down" );

    if ( common_scripts\utility::flag( "office_done" ) )
        return;

    if ( isalive( level.team["marine1"] ) )
        level.team["marine1"] kill();

    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
        {
            var_2.diequietly = 1;
            var_2 kill();
        }

        wait(randomfloat( 0.5 ));
    }

    wait 0.1;
    var_4 = common_scripts\utility::getstructarray( "parking_start_points", "targetname" );

    foreach ( var_6 in var_4 )
        level.team[var_6.script_noteworthy] thread maps\dcemp_code::_id_AFEF( var_6 );

    common_scripts\utility::flag_set( "parking_main" );
}

_id_C70A()
{
    common_scripts\utility::array_thread( getentarray( "parking_btr_guys", "targetname" ), maps\_utility::add_spawn_function, ::_id_BE51 );
    thread maps\dcemp_code::_id_B5B2();
    thread maps\dcemp_code::_id_C57C();
    thread maps\dcemp_code::_id_CFF2();
    thread maps\dcemp_code::_id_B0D6();
    var_0 = undefined;
    var_0 = "-42263 6917 183";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_0 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_0 );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "parking_vision_set" );
    maps\_utility::add_func( maps\dcemp_code::_id_AE98 );
    level.player maps\_utility::add_func( maps\_utility::blend_movespeedscale, 0.8 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "parking_player_near_btr" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "rain_fx2" );
    thread maps\_utility::do_wait();
    thread _id_B80F();
    common_scripts\utility::flag_wait( "office_done" );
    thread maps\_utility::battlechatter_off();

    if ( level.start_point != "parking" )
    {
        level.team["marine2"].script_noteworthy = "marine1";
        level.team["marine2"].animname = "marine1";
        level.team["marine1"] = level.team["marine2"];
        level.team["marine2"] = undefined;
    }

    common_scripts\utility::flag_wait( "parking_main" );
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    _id_CA3A();
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_zero );
    common_scripts\utility::array_thread( level.team, maps\dcemp_code::_id_C3F4, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_pain );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreall, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_ai_color );
    common_scripts\utility::array_thread( level.team, maps\_utility::ent_flag_init, "parking_start_at_node" );
    common_scripts\utility::array_thread( level.team, maps\_utility::ent_flag_init, "parking_start_at_node2" );
    common_scripts\utility::array_thread( level.team, maps\_utility::delaythread, 0.1, maps\_utility::set_fixednode_false );
    level.foley thread _id_A93F( "parking_btr_node_foley" );
    level._id_ACC0 maps\_utility::delaythread( 1, ::_id_A93F, "parking_btr_node_dunn" );
    level.team["marine1"] maps\_utility::delaythread( 1.5, ::_id_A93F, "parking_btr_node_marine1" );
    common_scripts\utility::flag_clear( "_weather_lightning_enabled" );
    _id_B804();
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_zero );
    common_scripts\utility::flag_set( "parking_moveout" );
    common_scripts\utility::flag_set( "_weather_lightning_enabled" );
    _id_B108();
    common_scripts\utility::flag_wait( "parking_btr_guys_dead" );
    thread maps\_utility::autosave_by_name( "parking_lot_done" );
}

_id_B80F()
{
    var_0 = getentarray( "parking_pickup_flare", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_2 maps\_utility::delaythread( 0, maps\dcemp_code::_id_B345, 1100, 0.65 );
        var_2 _meth_81EF( 0.3 );
    }

    common_scripts\utility::flag_set( "spotlight_lightning" );
}

_id_CA3A()
{
    _id_C750();

    if ( common_scripts\utility::flag( "parking_player_jumped_down" ) )
        return;

    level endon( "parking_open_fire" );
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_huaah" );
    wait 0.25;
    level.team["marine1"] maps\_utility::dialogue_queue( "dcemp_ar2_clear" );
    level.foley thread maps\_utility::dialogue_queue( "dcemp_fly_roomclear" );
}

_id_C750()
{
    if ( common_scripts\utility::flag( "parking_player_jumped_down" ) )
        return;

    level endon( "parking_player_jumped_down" );

    foreach ( var_1 in level.team )
    {
        while ( var_1.isspeaking )
            wait 0.1;
    }
}

_id_B108()
{
    level endon( "parking_open_fire" );
    maps\_utility::array_wait( level.team, "parking_start_at_node2" );
    wait 1.5;
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_smokeem" );
    common_scripts\utility::flag_set( "parking_open_fire" );
}

_id_B804()
{
    if ( common_scripts\utility::flag( "parking_player_jumped_down" ) )
        return;

    level endon( "parking_open_fire" );
    level.foley waittill( "parking_start_at_node" );
    common_scripts\utility::flag_wait( "parking_vision_set" );
    level thread maps\dcemp_code::_id_A91D( "triple" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_oldexecbuilding" );
    level._id_ACC0 thread maps\_utility::dialogue_queue( "dcemp_cpd_gottagoout" );
}

_id_A93F( var_0 )
{
    thread _id_BFEB();
    var_1 = getnode( var_0, "targetname" );
    _id_AFD7( var_1 );
    maps\dcemp_code::_id_A8FD();
    var_1 = getnode( var_1.target, "targetname" );

    switch ( self.script_noteworthy )
    {
        case "marine1":
            thread _id_C69E( var_1 );
            thread _id_B4F9( var_1 );
            break;
        case "dunn":
            thread _id_C2A4( var_1 );
            thread _id_CF95( var_1 );
            break;
        case "foley":
            thread _id_D454( var_1 );
            thread _id_B8F5( var_1 );
            break;
    }
}

_id_AFD7( var_0 )
{
    if ( common_scripts\utility::flag( "parking_open_fire" ) )
        return;

    level endon( "parking_open_fire" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    maps\_utility::ent_flag_set( "parking_start_at_node" );
    common_scripts\utility::flag_wait( "parking_moveout" );

    switch ( self.script_noteworthy )
    {
        case "dunn":
            wait 1.5;
        case "marine1":
            wait 0.25;
        case "foley":
            wait 0.5;
            break;
    }
}

_id_BFEB()
{
    common_scripts\utility::flag_wait_either( "parking_moveout3", "parking_open_fire" );
    var_0 = getent( "parking_btr_aim_node", "targetname" );
    self setentitytarget( var_0 );
    maps\_utility::enable_dontevershoot();
    maps\_utility::set_ignoreall( 0 );
    self.oldacc = self.accuracy;
    self.oldbase = self.baseaccuracy;
    self.oldgrenade = self.grenadeammo;
    self.baseaccuracy = 100;
    self.accuracy = 100;
    self.grenadeammo = 0;
    common_scripts\utility::flag_wait( "parking_open_fire" );

    while ( !common_scripts\utility::flag( "parking_btr_guys_dead" ) )
    {
        var_1 = self gettagorigin( "TAG_FLASH" );
        var_2 = vectornormalize( var_0.origin - var_1 );
        var_3 = anglestoforward( self gettagangles( "TAG_FLASH" ) );

        if ( vectordot( var_2, var_3 ) > 0.7 )
            self shoot();
        else if ( !maps\_utility::player_looking_at( self geteye() ) && distancesquared( self.origin, level.player.origin ) > squared( 512 ) )
        {
            var_4 = bullettrace( self geteye(), var_0.origin, 0, self );

            if ( !isdefined( var_4["entity"] ) || !isplayer( var_4["entity"] ) )
                magicbullet( self.weapon, self geteye(), var_0.origin );
        }

        wait 0.1;
    }

    self clearentitytarget();
    self notify( "stop_custom_aim" );
    maps\_utility::disable_dontevershoot();
    self.baseaccuracy = self.oldbase;
    self.accuracy = self.oldacc;
    self.grenadeammo = self.oldgrenade;
}

_id_C69E( var_0 )
{
    if ( common_scripts\utility::flag( "parking_open_fire" ) )
        return;

    level endon( "parking_open_fire" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "parking_checking_body" );
    wait 1.0;
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    maps\_utility::enable_cqbwalk();
    var_0 maps\_anim::anim_generic_reach( self, "combatwalk_F_spin" );
    var_0 maps\_anim::anim_generic_run( self, "combatwalk_F_spin" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "parking_moveout2" );
    maps\_utility::disable_cqbwalk();
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "parking_player_near_btr" );
    thread maps\_utility::dialogue_queue( "dcemp_ar2_gotavisual" );
    self.a.movement = "stop";
    maps\_anim::anim_generic( self, "CornerStndR_alert_signal_enemy_spotted" );
    common_scripts\utility::flag_set( "parking_moveout3" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 8;
    self waittill( "goal" );
    maps\_utility::flagwaitthread( "parking_dialog_resume", maps\_utility::dialogue_queue, "dcemp_ar2_clearshot" );
    maps\_utility::ent_flag_set( "parking_start_at_node2" );
}

_id_D454( var_0 )
{
    if ( common_scripts\utility::flag( "parking_open_fire" ) )
        return;

    level endon( "parking_open_fire" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "parking_checking_body" );
    wait 2.5;
    maps\_utility::enable_cqbwalk();
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "parking_moveout2" );
    maps\_utility::disable_cqbwalk();
    maps\_utility::delaythread( 2, maps\_utility::dialogue_queue, "dcemp_fly_keepquiet" );
    var_0 = getnode( "parking_moveup2_foley", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "parking_moveout3" );
    thread maps\dcemp_aud::parking_foley_dialog();
    self.a.movement = "stop";
    maps\_anim::anim_generic( self, "CornerStndR_alert_signal_move_out" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    maps\_utility::ent_flag_set( "parking_start_at_node2" );
}

_id_C2A4( var_0 )
{
    if ( common_scripts\utility::flag( "parking_open_fire" ) )
        return;

    level endon( "parking_open_fire" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "parking_player_jumped_down" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    level.foley thread maps\_utility::dialogue_queue( "dcemp_fly_checkvitals" );
    var_0 maps\_anim::anim_reach_solo( self, "hunted_woundedhostage_check" );
    var_1 = [];
    var_1[var_1.size] = self;
    var_1[var_1.size] = level._id_A966;
    common_scripts\utility::flag_set( "parking_checking_body" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::anim_single( var_1, "hunted_woundedhostage_check" );
    thread maps\_utility::dialogue_queue( "dcemp_cpd_gonner" );
    var_0 maps\_anim::anim_generic_run( self, "hunted_woundedhostage_check_soldier_end" );
    common_scripts\utility::flag_set( "parking_moveout2" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 100;
    self waittill( "goal" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "parking_moveout3" );
    var_0 = getnode( "parking_moveup2_marine1", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    maps\_utility::ent_flag_set( "parking_start_at_node2" );
    maps\_anim::anim_generic_run( self, "CornerStndR_alert_2_lean" );
    self animcustom( maps\dcemp_code::_id_BFD6 );
}

_id_B4F9( var_0 )
{
    self endon( "parking_start_at_node2" );
    common_scripts\utility::flag_wait( "parking_open_fire" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    maps\_utility::anim_stopanimscripted();
    self setgoalnode( var_0 );
    self.goalradius = 8;
}

_id_B8F5( var_0 )
{
    self endon( "parking_start_at_node2" );
    common_scripts\utility::flag_wait( "parking_open_fire" );
    var_0 = getnode( "parking_moveup2_foley", "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    maps\_utility::anim_stopanimscripted();
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
}

_id_CF95( var_0 )
{
    self endon( "parking_start_at_node2" );
    common_scripts\utility::flag_wait( "parking_open_fire" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    var_0 = getnode( "parking_moveup2_marine1", "targetname" );
    maps\_utility::anim_stopanimscripted();
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
}

_id_CA3C()
{
    var_0 = common_scripts\utility::getstruct( "parking_btr_anim_node", "targetname" );
    level._id_BE51[3] = spawn( "script_origin", var_0.origin + ( 0.0, 0.0, 40.0 ) );
    level._id_BE51[4] = spawn( "script_origin", var_0.origin + ( 0.0, 0.0, 40000.0 ) );
    var_1 = level._id_BE51;
    var_1[3] maps\_utility::play_sound_on_entity( "dcemp_rs1_cananyone" );
    var_1[3] maps\_utility::play_sound_on_entity( "dcemp_rs2_shutup" );

    if ( !common_scripts\utility::flag( "parking_btr_shot_at" ) )
    {
        var_1[0] playsound( "dcemp_rs3_wecanhearyou", "sounddone" );
        var_1[0] waittill( "sounddone" );
    }
    else
        var_1[4] maps\_utility::play_sound_on_entity( "dcemp_rs3_wecanhearyou" );

    if ( !common_scripts\utility::flag( "parking_btr_shot_at" ) )
    {
        var_1[1] playsound( "dcemp_rs4_howthehell", "sounddone" );
        var_1[1] waittill( "sounddone" );
    }
    else
        var_1[4] maps\_utility::play_sound_on_entity( "dcemp_rs4_howthehell" );

    if ( !common_scripts\utility::flag( "parking_btr_shot_at" ) )
    {
        var_1[2] playsound( "dcemp_rs5_shutupandhelp", "sounddone" );
        var_1[2] waittill( "sounddone" );
    }
    else
        var_1[4] maps\_utility::play_sound_on_entity( "dcemp_rs5_shutupandhelp" );

    var_1[3] maps\_utility::play_sound_on_entity( "dcemp_rs1_getusout" );
    var_1[3] maps\_utility::play_sound_on_entity( "dcemp_rs2_whatthehell" );

    if ( !common_scripts\utility::flag( "parking_btr_shot_at" ) )
    {
        var_1[2] playsound( "dcemp_rs5_juststaycalm", "sounddone" );
        var_1[2] waittill( "sounddone" );
    }
    else
        var_1[4] maps\_utility::play_sound_on_entity( "dcemp_rs5_juststaycalm" );

    if ( !common_scripts\utility::flag( "parking_btr_shot_at" ) )
    {
        var_1[1] playsound( "dcemp_rs4_notbudging", "sounddone" );
        var_1[1] waittill( "sounddone" );
    }
    else
        var_1[4] maps\_utility::play_sound_on_entity( "dcemp_rs4_notbudging" );

    if ( !common_scripts\utility::flag( "parking_btr_shot_at" ) )
    {
        var_1[0] playsound( "dcemp_rs3_maybewecan", "sounddone" );
        var_1[0] waittill( "sounddone" );
    }
    else
        var_1[4] maps\_utility::play_sound_on_entity( "dcemp_rs3_maybewecan" );

    if ( !common_scripts\utility::flag( "parking_btr_shot_at" ) )
    {
        var_1[2] playsound( "dcemp_rs5_wedonthavetime", "sounddone" );
        var_1[2] waittill( "sounddone" );
    }
    else
        var_1[4] maps\_utility::play_sound_on_entity( "dcemp_rs5_wedonthavetime" );

    var_1[3] maps\_utility::play_sound_on_entity( "dcemp_rs2_ouch" );
    var_1[3] maps\_utility::play_sound_on_entity( "dcemp_rs1_comeon" );
    var_1[3] delete();
    var_1[4] delete();
}

_id_BE51()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    self.a.nodeath = 1;
    self.skipdeathanim = 1;
    self.noragdoll = 1;
    thread maps\_utility::magic_bullet_shield();
    self addaieventlistener( "grenade danger" );
    self addaieventlistener( "bulletwhizby" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "damage" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "ai_event" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "parking_open_fire" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "parking_btr_shot_at" );
    thread maps\_utility::do_wait_any();

    if ( !isdefined( level._id_BE51 ) )
        level._id_BE51 = [];

    level._id_BE51[level._id_BE51.size] = self;

    if ( level._id_BE51.size == 3 )
        thread _id_CA3C();

    switch ( self.script_animation )
    {
        case "DCemp_BTR_moment_guy1":
            var_0 maps\_anim::anim_generic( self, "DCemp_BTR_moment_climb_guy1" );

            if ( !common_scripts\utility::flag( "parking_open_fire" ) )
                var_0 thread maps\_anim::anim_generic_loop( self, "DCemp_BTR_moment_idle_guy1" );

            common_scripts\utility::flag_wait( "parking_btr_shot_at" );
            self notify( "stop_loop" );
            self stopanimscripted();
            var_0 thread maps\_anim::anim_generic( self, self.script_animation );
            break;
        case "DCemp_BTR_moment_guy2":
            var_0 maps\_anim::anim_generic( self, "DCemp_BTR_moment_climb_guy2" );

            if ( !common_scripts\utility::flag( "parking_open_fire" ) )
                var_0 thread maps\_anim::anim_generic_loop( self, "DCemp_BTR_moment_idle_guy2" );

            common_scripts\utility::flag_wait( "parking_btr_shot_at" );
            self notify( "stop_loop" );
            self stopanimscripted();
            var_0 thread maps\_anim::anim_generic( self, self.script_animation );
            break;
        case "DCemp_BTR_moment_guy3":
            maps\dcemp_code::_id_CCC4();
            var_0 maps\_anim::anim_generic( self, "DCemp_BTR_moment_climb_guy3" );

            if ( !common_scripts\utility::flag( "parking_open_fire" ) )
                var_0 thread maps\_anim::anim_generic_loop( self, "DCemp_BTR_moment_idle_guy3" );

            common_scripts\utility::flag_wait( "parking_btr_shot_at" );
            self notify( "stop_loop" );
            self stopanimscripted();
            var_0 thread maps\_anim::anim_generic( self, self.script_animation );
            break;
    }

    self notify( "sounddone" );
    self playrumbleonentity();
    var_1 = getanimlength( maps\_utility::getanim_generic( self.script_animation ) );
    wait(var_1 - randomfloatrange( 1.5, 2.25 ));
    thread common_scripts\utility::play_sound_in_space( "generic_death_russian_" + randomintrange( 1, 8 ), self geteye() );
    thread maps\dcemp_code::_id_C9AB( "killshot" );
    wait 1;
    self.allowdeath = 1;
    maps\_utility::stop_magic_bullet_shield();
    self kill();
}

_id_CCCC()
{
    common_scripts\utility::array_thread( getentarray( "plaza_enemies", "targetname" ), maps\_utility::add_spawn_function, maps\dcemp_code::_id_D590 );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "parking_high_spec" );

    foreach ( var_1 in level.team )
    {
        if ( var_1.script_noteworthy == "marine1" )
            continue;

        var_1 maps\_utility::ent_flag_init( "plaza_at_tree" );
        var_1 maps\_utility::add_wait( maps\_utility::ent_flag_wait, "plaza_at_tree" );
    }

    var_3 = undefined;
    var_3 = "-42263 6917 183";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_3 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_3 );
    thread _id_B80F();
    maps\_utility::add_func( common_scripts\utility::flag_set, "plaza_to_street" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "plaza_player_exit1" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "plaza_open_fire" );
    thread maps\_utility::do_wait();
    wait 1;
    level.team["marine1"] maps\_utility::delaythread( 0, ::_id_C719 );
    level._id_ACC0 maps\_utility::delaythread( 0.25, ::_id_A9D0 );
    level.foley maps\_utility::delaythread( 0.5, ::_id_ACEB );
    level.team["marine1"] thread _id_B465();
    level._id_ACC0 thread _id_C418();
    level.foley thread _id_C43F();
    thread _id_BF74();
    maps\dcemp_code::_id_AEE9();
}

_id_BF74()
{
    thread maps\dcemp_code::tunnel_lamps();
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_moveup" );
    wait 1;
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_whatabout" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_whataboutem" );
    common_scripts\utility::flag_wait_either( "plaza_to_street", "plaza_show_enemies" );

    if ( !common_scripts\utility::flag( "plaza_show_enemies" ) )
    {
        common_scripts\utility::flag_clear( "_weather_lightning_enabled" );
        thread _id_B684();
        common_scripts\utility::flag_wait( "plaza_player_ready_for_throw" );
        var_0 = common_scripts\utility::getstruct( "plaza_lookat_node", "targetname" );
        var_0 maps\_utility::add_wait( maps\_utility::waittill_player_lookat_for_time, 0.5 );
        maps\_utility::add_wait( maps\_utility::_wait, 10 );
        maps\_utility::add_func( common_scripts\utility::flag_set, "plaza_show_enemies" );
        thread maps\_utility::do_wait_any();
        common_scripts\utility::flag_wait( "plaza_show_enemies" );
    }

    setsaveddvar( "aim_aimAssistRangeScale", "0" );
    setsaveddvar( "aim_autoAimRangeScale", "0" );
    setsaveddvar( "cg_crosshairEnemyColor", "0" );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreall, 0 );
    common_scripts\utility::array_thread( level.team, maps\_utility::enable_dontevershoot );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_surprise );

    foreach ( var_2 in level.team )
    {
        var_2.oldgrenade = var_2.grenadeammo;
        var_2.grenadeammo = 0;
    }

    thread maps\_utility::array_spawn( getentarray( "plaza_enemies", "targetname" ), 1 );
    _id_A8ED();
    level._id_ACC0 thread maps\_utility::dialogue_queue( "dcemp_cpd_conact" );
    thread maps\_utility::flag_set_delayed( "_weather_lightning_enabled", 3 );
    common_scripts\utility::flag_set( "plaza_open_fire" );
    setsaveddvar( "ai_friendlyFireBlockDuration", "2000" );
    setsaveddvar( "aim_aimAssistRangeScale", "1" );
    setsaveddvar( "aim_autoAimRangeScale", "1" );
    setsaveddvar( "cg_crosshairEnemyColor", "1" );
    level.player maps\_utility::blend_movespeedscale_default( 1 );
    thread maps\_utility::battlechatter_on();
    maps\_utility::activate_trigger_with_targetname( "plaza_enemy_color_1" );
    maps\_utility::activate_trigger_with_targetname( "plaza_ally_color_1" );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_dontevershoot );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_cqbwalk );
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_reset );
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_reset );
    common_scripts\utility::array_call( level.team, ::allowedstances, "prone", "crouch", "stand" );
    thread maps\_utility::array_spawn( getentarray( "plaza_backup", "targetname" ), 1 );
    common_scripts\utility::array_thread( getaiarray( "axis" ), maps\_utility::set_force_color, "blue" );
    common_scripts\utility::flag_wait( "plaza_flare_thrown" );
    common_scripts\utility::array_thread( level.team, maps\dcemp_code::_id_C3F4, 0 );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_force_color, "red" );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_moveplaybackrate, 1.0 );

    foreach ( var_2 in level.team )
        var_2.grenadeammo = var_2.oldgrenade;

    thread _id_BE5E();
    common_scripts\utility::flag_wait( "parking_plaza_guys_dead" );
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    thread maps\_utility::autosave_by_name( "plaza_guys_dead" );
    thread maps\_utility::battlechatter_off( "allies" );
    wait 2.5;
    level.team["marine1"] maps\_utility::dialogue_queue( "dcemp_ar2_streetclear" );
    level.foley thread maps\_utility::dialogue_queue( "dcemp_fly_oscarmike" );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_ai_color );
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_zero );
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_zero );
    common_scripts\utility::array_thread( level.team, maps\dcemp_code::_id_C3F4, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::ent_flag_init, "plaza_moveout_exit" );
    common_scripts\utility::array_thread( level.team, maps\_utility::ent_flag_init, "plaza_moveout_exit2" );

    foreach ( var_2 in level.team )
        var_2 maps\_utility::add_wait( maps\_utility::ent_flag_wait, "plaza_moveout_exit" );

    maps\_utility::add_wait( common_scripts\utility::flag_wait, "plaza_player_exit1" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "plaza_moveout_exit" );
    thread maps\_utility::do_wait();

    foreach ( var_2 in level.team )
        var_2 maps\_utility::add_wait( maps\_utility::ent_flag_wait, "plaza_moveout_exit2" );

    maps\_utility::add_wait( common_scripts\utility::flag_wait, "plaza_player_exit2" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "plaza_moveout_exit2" );
    thread maps\_utility::do_wait();
    level.team["marine1"] thread _id_B8F9();
    wait 0.5;
    level._id_ACC0 thread _id_C72C();
    wait 0.25;
    level.foley _id_B779();
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_reset );
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_reset );
    common_scripts\utility::array_thread( level.team, maps\dcemp_code::_id_C3F4, 0 );
    setsaveddvar( "ai_friendlyFireBlockDuration", "2000" );
}

_id_BE5E()
{
    common_scripts\utility::flag_wait( "tunnels_dunn_anim_end" );

    if ( common_scripts\utility::flag( "parking_plaza_guys_dead" ) )
        return;

    if ( common_scripts\utility::flag( "parking_high_spec" ) )
        return;

    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
        var_2.diequietly = 1;

    common_scripts\utility::array_call( var_0, ::kill );
}

_id_B465()
{
    if ( common_scripts\utility::flag( "plaza_flare_thrown" ) )
        return;

    level endon( "plaza_flare_thrown" );
    self endon( "plaza_moveup_kill_backup" );
    common_scripts\utility::flag_wait( "plaza_open_fire" );
    self notify( "stop_loop" );

    if ( isdefined( self._id_ABC9 ) )
        self._id_ABC9 notify( "stop_loop" );

    maps\_utility::anim_stopanimscripted();
    self.moveplaybackrate = 1.25;
    self unlink();
    var_0 = common_scripts\utility::getstruct( "parking_jumpdown_stairs2", "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 8;
}

_id_C418()
{
    if ( common_scripts\utility::flag( "plaza_flare_thrown" ) )
        return;

    level endon( "plaza_flare_thrown" );
    self endon( "plaza_moveup_kill_backup" );
    common_scripts\utility::flag_wait( "plaza_open_fire" );
    self notify( "stop_loop" );

    if ( isdefined( self._id_ABC9 ) )
        self._id_ABC9 notify( "stop_loop" );

    maps\_utility::anim_stopanimscripted();
    self.moveplaybackrate = 1.25;
    self unlink();
    var_0 = common_scripts\utility::getstruct( "park_lookup_foley", "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 8;
}

_id_C43F()
{
    self endon( "corner_trans_out" );
    common_scripts\utility::flag_wait( "plaza_open_fire" );
    self notify( "stop_loop" );

    if ( isdefined( self._id_ABC9 ) )
        self._id_ABC9 notify( "stop_loop" );

    maps\_utility::anim_stopanimscripted();
    self.moveplaybackrate = 1.25;
    self unlink();
    var_0 = common_scripts\utility::getstruct( "street_flarethrow_node", "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "street_flare_throw" );
    _id_B87A();
}

_id_C719()
{
    if ( common_scripts\utility::flag( "plaza_open_fire" ) )
        return;

    level endon( "plaza_open_fire" );
    var_0 = getnode( "park_moveup_marine1", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 4;
    self waittill( "goal" );
    self._id_ABC9 = var_0;
    var_0 maps\_anim::anim_generic( self, "coverstand_look_moveup" );
    var_0 thread maps\_anim::anim_generic_loop( self, "coverstand_look_idle" );
    thread maps\_utility::dialogue_queue( "dcemp_ar2_gotoursixgo" );
    wait 1;
    common_scripts\utility::flag_wait( "plaza_player_at_stairs" );
    var_0 notify( "stop_loop" );
    var_0 thread maps\_anim::anim_generic( self, "coverstand_trans_OUT_R" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "coverstand_trans_OUT_R" ) );
    wait(var_1 * 0.84);
    maps\_utility::anim_stopanimscripted();
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 thread maps\_anim::anim_generic( self, "gulag_sewer_slide" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "gulag_sewer_slide" ) );
    wait(var_1 * 0.3);
    maps\_utility::anim_stopanimscripted();
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 thread maps\_anim::anim_generic( self, "favela_civ_warning_landing" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "favela_civ_warning_landing" ) );
    wait(var_1 * 0.1);
    maps\_utility::anim_stopanimscripted();
    maps\_anim::anim_generic_run( self, "stand_2_run_R" );
    thread maps\_anim::anim_generic( self, "run_turn_R45" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "run_turn_R45" ) );
    wait(var_1 - 0.3);
    maps\_utility::anim_stopanimscripted();
    var_0 = getnode( var_0.target, "targetname" );
    maps\_utility::delaythread( 2, maps\dcemp_code::_id_C3F4, 0 );
    self setgoalnode( var_0 );
    self.goalradius = 8;
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "plaza_to_street" );
    wait 2.25;
    maps\_utility::enable_cqbwalk();
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 8;
    self notify( "plaza_moveup_kill_backup" );
}

_id_A9D0()
{
    if ( common_scripts\utility::flag( "plaza_open_fire" ) )
        return;

    level endon( "plaza_open_fire" );
    var_0 = getnode( "park_moveup_dunn", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 24;
    maps\_utility::disable_arrivals();
    self waittill( "goal" );
    thread maps\_anim::anim_generic_gravity( self, "run_turn_L90" );
    wait 0.75;
    self clearanim( maps\_utility::getanim_generic( "run_turn_L90" ), 0.2 );
    self notify( "killanimscript" );
    maps\_utility::enable_arrivals();
    var_0 = getnode( var_0.target, "targetname" );
    maps\_utility::delaythread( 0.5, maps\_utility::dialogue_queue, "dcemp_cpd_itsclear" );
    self setgoalnode( var_0 );
    self.goalradius = 8;
    self waittill( "goal" );
    maps\_utility::ent_flag_set( "plaza_at_tree" );
    common_scripts\utility::flag_wait( "plaza_to_street" );
    wait 0.5;
    maps\_utility::enable_cqbwalk();
    var_1 = spawn( "script_origin", self.origin );
    self linkto( var_1 );
    var_1 rotateyaw( -6.6, 0.5 );
    var_1 maps\_anim::anim_generic_run( self, "corner_standR_trans_CQB_OUT_8" );
    self unlink();
    var_1 delete();
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0.origin = self.origin;
    var_0 maps\dcemp_code::_id_D4EA( self, "patrol_jog_look_up_once" );
    var_0 = getnode( var_0.target, "targetname" );
    maps\dcemp_code::_id_C3F4( 0 );
    self setgoalnode( var_0 );
    self.goalradius = 8;
    self notify( "plaza_moveup_kill_backup" );
}

_id_ACEB()
{
    maps\_utility::ent_flag_init( "corner_trans_out" );

    if ( common_scripts\utility::flag( "plaza_open_fire" ) )
        return;

    level endon( "plaza_open_fire" );
    var_0 = getnode( "park_moveup_foley", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 8;
    self waittill( "goal" );
    maps\_utility::ent_flag_set( "plaza_at_tree" );
    common_scripts\utility::flag_wait( "plaza_to_street" );
    maps\_utility::enable_cqbwalk();
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 8;
    self waittill( "goal" );
    maps\_utility::ent_flag_set( "corner_trans_out" );
    common_scripts\utility::flag_wait( "plaza_show_enemies" );
    self.a.movement = "stop";
    thread maps\_anim::anim_generic( self, "CornerStndR_alert_signal_enemy_spotted" );
    thread _id_D192();
}

_id_D192()
{
    common_scripts\utility::flag_wait_either( "plaza_prepare_throw", "plaza_open_fire" );
    maps\_utility::add_wait( maps\_utility::_wait, 2.0 );
    maps\_utility::add_func( maps\_utility::dialogue_queue, "dcemp_fly_staaar" );
    maps\_utility::add_abort( common_scripts\utility::flag_wait, "plaza_open_fire" );
    thread maps\_utility::do_wait();
    var_0 = spawn( "script_origin", self.origin );
    self linkto( var_0 );
    var_0 rotateyaw( 17.9, 0.5 );
    var_0 maps\_anim::anim_generic_run( self, "corner_standR_trans_CQB_OUT_9" );
    self unlink();
    var_0 delete();
    _id_B87A();
}

_id_B87A()
{
    var_0 = common_scripts\utility::getstruct( "street_flarethrow_node", "targetname" );
    var_0 maps\_anim::anim_generic( self, "street_flare_throw" );
    common_scripts\utility::flag_set( "plaza_flare_thrown" );

    if ( common_scripts\utility::flag( "plaza_open_fire" ) )
        return;

    self setgoalpos( self.origin );
    self.goalradius = 8;
    self allowedstances( "crouch" );
}

_id_B684()
{
    level endon( "plaza_open_fire" );
    wait 1;
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_freezingmonsoon" );
    level.team["marine1"] maps\_utility::dialogue_queue( "dcemp_ar2_huah" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_quietseesomething" );
}

_id_A8ED()
{
    level endon( "plaza_open_fire" );
    wait 1;
    level thread maps\_utility::function_stack( maps\dcemp_code::_id_A91D, "triple" );
    level thread maps\_utility::function_stack( maps\dcemp_code::_id_A91D, "double" );
    wait 0.5;
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_holdyourfire" );
    wait 1;
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_aretheyfriendly" );
    wait 0.5;
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_dontknowstar" );
    wait 1;
    level.foley thread maps\_utility::dialogue_queue( "dcemp_fly_coverme" );
    common_scripts\utility::flag_set( "plaza_prepare_throw" );
    maps\_utility::add_wait( maps\_utility::_wait, 3.5 );
    level._id_ACC0 maps\_utility::add_func( maps\_utility::dialogue_queue, "dcemp_cpd_saytexas" );
    maps\_utility::add_abort( common_scripts\utility::flag_wait, "plaza_open_fire" );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "plaza_throw_react" );
    wait 3.5;
}

_id_C72C()
{
    var_0 = getnode( "plaza_moveout_marine1", "targetname" );
    var_1 = common_scripts\utility::flag( "tunnels_dunn_anim_end" ) && !common_scripts\utility::flag( "parking_high_spec" );

    if ( !var_1 )
    {
        self setgoalnode( var_0 );
        self.goalradius = 8;
        self waittill( "goal" );
        maps\_utility::ent_flag_set( "plaza_moveout_exit" );
        common_scripts\utility::flag_wait( "plaza_moveout_exit" );
        wait 1;
        var_2 = spawn( "script_origin", self.origin );
        var_2.angles = self.angles;
        self linkto( var_2 );
        var_2 rotateyaw( 15, 1 );
        var_2 maps\_anim::anim_generic_run( self, "crouch_2run_R" );
        self unlink();
        var_2 delete();
        maps\_anim::anim_generic_run( self, "run_turn_L45" );
    }

    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 8;
    self waittill( "goal" );
    maps\_utility::ent_flag_set( "plaza_moveout_exit2" );
    common_scripts\utility::flag_wait( "plaza_moveout_exit2" );
    wait 0.5;
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "jump_across_100_lunge" );
    var_0 maps\_anim::anim_generic_run( self, "jump_across_100_lunge" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 90;
}

_id_B8F9()
{
    var_0 = getnode( "plaza_moveout_dunn", "targetname" );
    var_1 = common_scripts\utility::flag( "tunnels_dunn_anim_end" ) && !common_scripts\utility::flag( "parking_high_spec" );

    if ( !var_1 )
    {
        self setgoalnode( var_0 );
        self.goalradius = 8;
        self waittill( "goal" );
        maps\_anim::anim_generic( self, "corner_standR_alert_2_look" );
        thread maps\_anim::anim_generic_loop( self, "corner_standR_look_idle" );
        maps\_utility::ent_flag_set( "plaza_moveout_exit" );
        common_scripts\utility::flag_wait( "plaza_moveout_exit" );
        wait 0.5;
        self notify( "stop_loop" );
        maps\_utility::anim_stopanimscripted();
        maps\dcemp_code::_id_D4EA( self, "corner_standR_trans_OUT_9" );
    }

    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 8;
    self waittill( "goal" );
    maps\_utility::ent_flag_set( "plaza_moveout_exit2" );
    common_scripts\utility::flag_wait( "plaza_moveout_exit2" );
    wait 1;
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 90;
}

_id_B779()
{
    var_0 = getnode( "plaza_moveout_foley", "targetname" );
    var_1 = common_scripts\utility::flag( "tunnels_dunn_anim_end" ) && !common_scripts\utility::flag( "parking_high_spec" );

    if ( !var_1 )
    {
        self setgoalnode( var_0 );
        self.goalradius = 8;
        self waittill( "goal" );
        maps\_utility::ent_flag_set( "plaza_moveout_exit" );
        common_scripts\utility::flag_wait( "plaza_moveout_exit" );
        thread maps\_utility::dialogue_queue( "dcemp_fly_watchmovement" );
        maps\dcemp_code::_id_D4EA( self, "corner_standR_trans_OUT_6" );
    }

    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 8;
    self waittill( "goal" );
    maps\_utility::ent_flag_set( "plaza_moveout_exit2" );
    common_scripts\utility::flag_wait( "plaza_moveout_exit2" );
    thread maps\_utility::dialogue_queue( "dcemp_fly_moveup" );
    self.a.movement = "stop";
    maps\_anim::anim_generic( self, "CornerStndR_alert_signal_move_out" );
    wait 1;
    var_0 = getent( var_0.target, "targetname" );
    thread maps\_anim::anim_generic( self, "corner_standR_trans_OUT_6" );
    var_2 = getanimlength( maps\_utility::getanim_generic( "corner_standR_trans_OUT_6" ) );
    wait(var_2 - 0.61);
    maps\_utility::anim_stopanimscripted();
    self linkto( var_0 );
    var_0 common_scripts\utility::delaycall( 0.25, ::movez, 8, 0.5 );
    var_0 thread maps\_anim::anim_generic( self, "gulag_sewer_slide" );
    var_2 = getanimlength( maps\_utility::getanim_generic( "gulag_sewer_slide" ) );
    wait(var_2 * 0.28);
    self unlink();
    maps\_utility::anim_stopanimscripted();
    thread maps\_anim::anim_generic_gravity( self, "stand_2_run_F_2", "gravity_run" );
    common_scripts\utility::flag_set( "tunnels_main" );
}

start_intro()
{
    maps\dcemp_code::_id_C49A();
    common_scripts\utility::flag_set( "intro_fx" );
    enablepg( "street", 1 );
    enablepg( "street2", 1 );
    soundscripts\_snd::snd_message( "start_intro_checkpoint" );
    startmap_light_setup();
    _id_D350();
    thread maps\dcemp_code::_id_D26E( 0 );
}

_id_A9F2()
{
    soundscripts\_snd::snd_message( "start_iss_checkpoint" );
    enablepg( "street", 1 );
    enablepg( "street2", 1 );
    var_0 = maps\dc_crashsite::_id_CEDB();
    var_1 = maps\_utility::spawn_anim_model( "player_rig" );
    var_2[0] = var_1;
    var_3 = getent( "crash_node", "targetname" );
    var_3 maps\_anim::anim_first_frame( var_2, "dcburning_BHrescue" );
    level.player freezecontrols( 1 );
    level.player playerlinktodelta( var_1, "tag_player", 1, 0, 0, 0, 0, 1 );
    common_scripts\utility::flag_set( "crash_fade_up" );
    common_scripts\utility::flag_set( "redshirt_headshot" );
    thread maps\dc_crashsite::_id_B888( var_0["top_left"], var_0["bot_right"], var_1 );
    wait 0.05;
    level.player unlink();
    startmap_light_setup();
    thread maps\_utility::flag_set_delayed( "emp_entity_cleanup_done", 0.05 );
}

_id_CB40()
{
    soundscripts\_snd::snd_message( "start_emp_checkpoint" );
    common_scripts\utility::flag_set( "intro_fx" );
    thread maps\dcemp_code::_id_D26E( 0 );
    thread _id_BCFB();
    enablepg( "street", 1 );
    enablepg( "street2", 1 );
    startmap_light_setup();
    var_0 = getent( "heli_crash_site_spotlight", "targetname" );
    var_0.target = "emp_start_crash_heli_spot_node";
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_crash_site_spotlight_emp_start" );
    var_1 thread maps\_vehicle::godon();
    var_1 vehicle_setspeed( 30 );
    var_1 setmaxpitchroll( 20, 20 );
    var_2 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "btr80s_end_emp_start" );
    common_scripts\utility::array_thread( var_2, maps\_vehicle::godon );
    common_scripts\utility::array_thread( var_2, maps\_vehicle::mgoff );
    common_scripts\utility::array_thread( var_2, maps\dc_crashsite::_id_C85C );
    var_3 = maps\dc_crashsite::_id_CEDB();
    var_4 = maps\_utility::spawn_anim_model( "player_rig" );
    var_5[0] = var_4;
    var_6 = getent( "crash_node", "targetname" );
    var_6 thread maps\_anim::anim_single( var_5, "dcburning_BHrescue" );
    var_4 setanimtime( var_4 maps\_utility::getanim( "dcburning_BHrescue" ), 1 );
    level.player freezecontrols( 1 );
    level.player playerlinktodelta( var_4, "tag_player", 1, 0, 0, 0, 0, 1 );
    thread maps\dc_crashsite::_id_B888( var_3["top_left"], var_3["bot_right"], var_4 );
    _id_D350();
    level.player takeallweapons();
    level.player giveweapon( "m4m203_eotech" );
    level.player switchtoweapon( "m4m203_eotech" );
    level.player setweaponammoclip( "m203_m4_eotech", 0 );
    level.player setweaponammostock( "m203_m4_eotech", 0 );
    level.player setweaponammoclip( "m4m203_eotech", 0 );
    level.player setweaponammostock( "m4m203_eotech", 0 );
    setsaveddvar( "ui_hidemap", 1 );
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    common_scripts\utility::flag_set( "crash_fade_up" );
    wait 1;
    common_scripts\utility::flag_set( "redshirt_headshot" );
    common_scripts\utility::flag_set( "crash_cut_to_black" );
    common_scripts\utility::flag_set( "iss_done" );
    thread maps\dc_crashsite::_id_A9E9();
    var_7 = getentarray( "emp_show", "targetname" );
    var_7 = common_scripts\utility::array_combine( var_7, getentarray( "emp_light", "targetname" ) );
    var_7 = common_scripts\utility::array_combine( var_7, common_scripts\utility::getstructarray( "fx_flare", "targetname" ) );
    common_scripts\utility::array_thread( var_7, maps\dcemp_code::_id_C5B8 );
}

start_street()
{
    _id_BD5B( 1 );
    enablepg( "street", 1 );
    enablepg( "street2", 1 );
    level.sunpitch = -20;
    level.sunheading = 55;
    soundscripts\_snd::snd_message( "start_street_checkpoint" );
    maps\dcemp_code::_id_C49A();
    common_scripts\utility::flag_set( "intro_fx" );
    thread maps\dcemp_code::_id_D26E( 0 );
    _id_D350();
    thread maps\_utility::battlechatter_off();
    wait 0.1;
    var_0 = common_scripts\utility::getstruct( level.foley.target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    level.foley maps\dcemp_code::_id_AFEF( var_0 );
    level.foley.goalradius = 16;
    level.foley setgoalnode( var_0 );
    var_0 = common_scripts\utility::getstruct( level._id_ACC0.target, "targetname" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    level._id_ACC0 maps\dcemp_code::_id_AFEF( var_0 );
    level._id_ACC0.goalradius = 16;
    level._id_ACC0 setgoalnode( var_0 );
    var_0 = getnode( level.team["marine1"].target, "targetname" );
    var_0 = getnode( var_0.target, "targetname" );
    level.team["marine1"] maps\dcemp_code::_id_AFEF( var_0 );
    level.team["marine1"].goalradius = 16;
    level.team["marine1"] setgoalnode( var_0 );
    common_scripts\utility::flag_set( "emp_entity_cleanup_done" );
    thread maps\_utility::flag_set_delayed( "street_main", 0.5 );
}

_id_D33D()
{
    _id_BD5B( 1 );
    enablepg( "street", 1 );
    enablepg( "street2", 1 );
    level.sunpitch = -20;
    level.sunheading = 55;
    soundscripts\_snd::snd_message( "start_corner_checkpoint" );
    maps\dcemp_code::_id_C49A();
    common_scripts\utility::flag_set( "intro_fx" );
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    common_scripts\utility::array_thread( getentarray( "street_crash_heli", "script_noteworthy" ), maps\dcemp_code::_id_B77C );
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "street_crash_heli_anim", "script_noteworthy" ), maps\dcemp_code::_id_BD58 );
    common_scripts\utility::array_thread( getentarray( "meetup_allies", "targetname" ), maps\_utility::add_spawn_function, ::_id_BDA7 );
    maps\_utility::activate_trigger( "meetup_allies", "target" );
    level._id_A8A0 delete();
    wait 0.05;
    getent( "street_btr", "targetname" ) maps\_utility::add_spawn_function( maps\dcemp_code::_id_CE3F );
    getent( "street_crash_motorcycle", "targetname" ) thread maps\dcemp_code::_id_A98E();
    common_scripts\utility::array_thread( getentarray( "street_crash_car", "script_noteworthy" ), maps\dcemp_code::_id_C377 );
    common_scripts\utility::array_thread( getentarray( "street_crash_heli", "script_noteworthy" ), maps\dcemp_code::_id_B77C );
    common_scripts\utility::array_thread( getentarray( "corner_truck_engine_crash", "targetname" ), maps\dcemp_code::_id_CC34 );
    thread _id_CFB0();
    common_scripts\_exploder::exploder( "hide_heli_crash" );
    var_0 = getglassarray( "street_hide_glass" );
    var_1 = anglestoforward( ( 0.0, 345.0, 0.0 ) );

    foreach ( var_3 in var_0 )
        common_scripts\utility::noself_delaycall( 1, ::destroyglass, var_3, var_1 * 200 );

    thread maps\_utility::battlechatter_off();
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_zero );
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_zero );
    var_5 = [];
    var_5 = common_scripts\utility::array_add( var_5, getnode( "street_marine1_hide_node", "targetname" ) );
    var_5 = common_scripts\utility::array_add( var_5, getnode( "street_macey_hide_node", "targetname" ) );
    var_5 = common_scripts\utility::array_add( var_5, getnode( "corner_macey_hide_node", "targetname" ) );
    var_5 = common_scripts\utility::array_add( var_5, getnode( "corner_start2", "targetname" ) );
    var_5 = common_scripts\utility::array_add( var_5, getnode( "corner_start3", "targetname" ) );
    maps\dcemp_code::_id_C862( level.team, var_5 );
    maps\dcemp_code::_id_BB1C();

    foreach ( var_7 in level.team )
        var_7.alertlevel = "alert";

    var_9 = getnode( "corner_macey_hide_node", "targetname" );
    level.foley common_scripts\utility::delaycall( 0.5, ::setgoalnode, var_9 );
    thread maps\_utility::flag_set_delayed( "corner_main", 0.5 );
    thread maps\_utility::flag_set_delayed( "street_crash_heli_done", 0.5 );
    objective_add( level._id_CD9B, "active", &"DCEMP_OBJ_FIND_SHELTER", common_scripts\utility::getstruct( "hide_obj", "targetname" ).origin );
    objective_current( level._id_CD9B );
}

_id_CA4C()
{
    _id_BD5B( 1 );
    enablepg( "street", 1 );
    enablepg( "street2", 1 );
    level.sunpitch = -20;
    level.sunheading = 55;
    soundscripts\_snd::snd_message( "start_meetup_checkpoint" );
    maps\dcemp_code::_id_C49A();
    common_scripts\utility::flag_set( "intro_fx" );
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    common_scripts\utility::array_thread( getentarray( "street_crash_heli", "script_noteworthy" ), maps\dcemp_code::_id_B77C );
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "street_crash_heli_anim", "script_noteworthy" ), maps\dcemp_code::_id_BD58 );
    common_scripts\utility::array_thread( getentarray( "meetup_allies", "targetname" ), maps\_utility::add_spawn_function, ::_id_BDA7 );
    maps\_utility::activate_trigger( "meetup_allies", "target" );
    level._id_A8A0 delete();
    maps\dcemp_code::_id_BD06();
    wait 0.05;
    thread maps\_utility::battlechatter_off();
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_zero );
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_zero );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_generic_run_anim_array, "casual_killer_jog" );
    maps\dcemp_code::_id_C862( level.team, common_scripts\utility::getstructarray( "meetup_ai_nodes", "targetname" ) );
    maps\dcemp_code::_id_BB1C();
    thread maps\_utility::flag_set_delayed( "meetup_main", 0.5 );
    objective_add( level._id_CD9B, "active", &"DCEMP_OBJ_FOLLOW_SGT_FOLEY", level.foley.origin );
    objective_current( level._id_CD9B );
    objective_onentity( level._id_CD9B, level.foley, ( 0.0, 0.0, 70.0 ) );
}

start_lobby()
{
    _id_BD5B( 1 );
    enablepg( "street", 1 );
    enablepg( "street2", 1 );
    level.sunpitch = -20;
    level.sunheading = 55;
    soundscripts\_snd::snd_message( "start_lobby_checkpoint" );
    common_scripts\utility::flag_set( "intro_fx" );
    common_scripts\utility::flag_set( "start_rain_ambience" );
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    common_scripts\utility::array_thread( getentarray( "meetup_allies", "targetname" ), maps\_utility::add_spawn_function, ::_id_BDA7 );
    maps\_utility::activate_trigger( "meetup_allies", "target" );
    waittillframeend;
    level._id_A8A0 delete();
    maps\dcemp_code::_id_BD06();
    thread maps\_utility::battlechatter_off();
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreme, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreall, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_zero );
    common_scripts\utility::array_thread( level.team, maps\dcemp_code::_id_C3F4, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_zero );
    var_0 = [];
    var_0 = common_scripts\utility::array_add( var_0, common_scripts\utility::getstruct( "meetup_runner_dunn", "targetname" ) );
    var_0 = common_scripts\utility::array_add( var_0, common_scripts\utility::getstruct( "meetup_runner_foley", "targetname" ) );
    var_0 = common_scripts\utility::array_add( var_0, common_scripts\utility::getstruct( "meetup_runner_1", "targetname" ) );
    var_0 = common_scripts\utility::array_add( var_0, common_scripts\utility::getstruct( "meetup_runner_2", "targetname" ) );
    var_0 = common_scripts\utility::array_add( var_0, common_scripts\utility::getstruct( "meetup_runner_3", "targetname" ) );
    maps\dcemp_code::_id_C862( level.team, var_0 );
    var_1 = common_scripts\utility::getstruct( "meetup_runner_anim_node", "targetname" );
    level._id_ACC0 maps\dcemp_code::_id_AFEF( var_1 );
    maps\dcemp_code::_id_BB1C();
    thread maps\_utility::flag_set_delayed( "lobby_main", 0.5 );
    var_2 = getent( "meetup_door_left", "targetname" );
    var_3 = getent( "office_door_clip", "targetname" );
    var_3 linkto( var_2 );
    var_3 common_scripts\utility::delaycall( 0.5, ::connectpaths );
    var_2 common_scripts\utility::delaycall( 1, ::rotateyaw, -90, 0.5 );
    var_3 common_scripts\utility::delaycall( 2.0, ::disconnectpaths );
    thread maps\_weather::rainmedium( 1 );
    maps\_utility::delaythread( 1, maps\_weather::lightning, _id_CD74::lightning_normal, _id_CD74::lightning_flash );
    objective_add( level._id_CD9B, "active", &"DCEMP_OBJ_WHISKEY_HOTEL", level.foley.origin );
    objective_current( level._id_CD9B );
    objective_onentity( level._id_CD9B, level.foley, ( 0.0, 0.0, 70.0 ) );
}

start_office()
{
    _id_BD5B( 1 );
    enablepg( "street2", 1 );
    level.sunpitch = -20;
    level.sunheading = 55;
    soundscripts\_snd::snd_message( "start_office_checkpoint" );
    common_scripts\utility::flag_set( "intro_fx" );
    common_scripts\utility::flag_set( "start_rain_ambience" );
    common_scripts\_exploder::exploder( "moon" );
    thread maps\dcemp_code::_id_CA53( 0 );
    common_scripts\utility::array_thread( getentarray( "meetup_allies", "targetname" ), maps\_utility::add_spawn_function, ::_id_BDA7 );
    maps\_utility::activate_trigger( "meetup_allies", "target" );
    thread maps\dcemp_code::_id_D579();
    maps\_utility::delaythread( 0.1, maps\_utility::activate_trigger, "office_ally_color_1", "target" );
    maps\_utility::delaythread( 0.5, maps\_utility::activate_trigger, "office_ally_color_2", "target" );
    level._id_A8A0 delete();
    thread maps\_utility::battlechatter_off();
    wait 0.05;
    level.team["marine3"] kill();
    level.team["marine2"] thread maps\_utility::magic_bullet_shield();
    maps\dcemp_code::_id_C862( level.team, common_scripts\utility::getstructarray( "office_start_points1", "targetname" ) );
    maps\dcemp_code::_id_BB1C();
    level.team = maps\_utility::array_removedead( level.team );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_force_color, "red" );
    var_0 = getent( "lobby_door_left", "targetname" );
    var_1 = getentarray( var_0.target, "targetname" );
    var_2 = undefined;

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4.script_parameters ) && var_4.script_parameters == "door_coll" )
            var_2 = var_4;
    }

    common_scripts\utility::array_call( var_1, ::linkto, var_0 );
    var_0 thread maps\_utility::hunted_style_door_open( "scn_dcemp_lobby_door_slow_open" );

    if ( isdefined( var_2 ) )
        var_2 connectpaths();

    var_0 = getent( "lobby_door_right", "targetname" );
    var_1 = getentarray( var_0.target, "targetname" );
    common_scripts\utility::array_call( var_1, ::linkto, var_0 );
    var_0 connectpaths();
    common_scripts\utility::flag_set( "lobby_door_kick" );
    var_6 = 0.4;
    var_0 rotateroll( 90, var_6 );
    var_0 playsound( "scn_dcemp_lobby_door_kick" );
    thread maps\_utility::flag_set_delayed( "office_main", 0.25 );
    thread maps\_weather::rainhard( 1 );
    maps\_utility::delaythread( 1, maps\_weather::lightning, _id_CD74::lightning_normal, _id_CD74::lightning_flash );
    objective_add( level._id_CD9B, "active", &"DCEMP_OBJ_WHISKEY_HOTEL", level.foley.origin );
    objective_current( level._id_CD9B );
    objective_onentity( level._id_CD9B, level.foley, ( 0.0, 0.0, 70.0 ) );
}

_id_D263()
{
    _id_BD5B( 1 );
    level.sunpitch = -24;
    level.sunheading = -14;
    soundscripts\_snd::snd_message( "start_parking_checkpoint" );
    common_scripts\utility::flag_set( "rain_fx" );
    common_scripts\utility::flag_set( "start_rain_ambience" );
    common_scripts\_exploder::exploder( "moon" );
    thread maps\dcemp_code::_id_CA53( 0 );
    thread maps\dcemp_code::_id_D579();
    level._id_A8A0 delete();
    thread maps\_utility::battlechatter_off();
    waittillframeend;
    maps\dcemp_code::_id_C862( level.team, common_scripts\utility::getstructarray( "parking_start_points", "targetname" ) );
    maps\dcemp_code::_id_BB1C();
    thread maps\_utility::flag_set_delayed( "office_done", 0.15 );
    thread maps\_utility::flag_set_delayed( "parking_main", 0.25 );
    thread maps\_weather::rainhard( 0.05 );
    maps\_utility::delaythread( 0.05, maps\_weather::lightning, _id_CD74::lightning_normal, _id_CD74::lightning_flash );
    objective_add( level._id_CD9B, "active", &"DCEMP_OBJ_WHISKEY_HOTEL", level.foley.origin );
    objective_current( level._id_CD9B );
    objective_onentity( level._id_CD9B, level.foley, ( 0.0, 0.0, 70.0 ) );
}

_id_AB90()
{
    _id_BD5B( 1 );
    level.sunpitch = -20;
    level.sunheading = 55;
    soundscripts\_snd::snd_message( "start_plaza_checkpoint" );
    level.player maps\_utility::blend_movespeedscale( 0.8 );
    common_scripts\utility::flag_set( "rain_fx" );
    common_scripts\utility::flag_set( "rain_on" );
    common_scripts\utility::flag_set( "start_rain_ambience" );
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    thread maps\dcemp_code::_id_AE98( 0.1 );
    thread maps\dcemp_code::_id_CFF2();
    thread maps\dcemp_code::_id_B0D6();
    common_scripts\utility::trigger_off( "parking_btr_guys", "target" );
    common_scripts\utility::flag_set( "parking_main" );
    common_scripts\utility::flag_set( "spotlight_lightning" );
    level._id_A8A0 delete();
    thread maps\_utility::battlechatter_off();
    waittillframeend;
    common_scripts\utility::array_thread( level.team, maps\_utility::pathrandompercent_zero );
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_zero );
    common_scripts\utility::array_thread( level.team, maps\dcemp_code::_id_C3F4, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_pain );
    common_scripts\utility::array_thread( level.team, maps\_utility::set_ignoreall, 1 );
    common_scripts\utility::array_thread( level.team, maps\_utility::disable_ai_color );
    maps\dcemp_code::_id_C862( level.team, common_scripts\utility::getstructarray( "plaza_start_points", "targetname" ) );
    maps\dcemp_code::_id_BB1C();
    common_scripts\utility::flag_set( "parking_btr_guys_dead" );
    thread maps\_weather::rainhard( 0.05 );
    maps\_utility::delaythread( 0.05, maps\_weather::lightning, _id_CD74::lightning_normal, _id_CD74::lightning_flash );
    objective_add( level._id_CD9B, "active", &"DCEMP_OBJ_WHISKEY_HOTEL", level.foley.origin );
    objective_current( level._id_CD9B );
    objective_onentity( level._id_CD9B, level.foley, ( 0.0, 0.0, 70.0 ) );
}

startmap_light_setup()
{
    thread maps\dcemp_code::_id_AA88( level.suncolor["helicopterstage"], 2 );
    var_0 = getent( "planeTurbine_fire_light", "targetname" );
    var_0 setlightintensity( 0 );
    var_0 = getent( "planeTurbine_fire_light02", "targetname" );
    var_0 setlightintensity( 0 );
    var_0 = getent( "light_entry_lobby", "script_noteworthy" );
    var_0 setlightintensity( 0 );
    level.sunpitch = -20;
    level.sunheading = 55;
    common_scripts\utility::array_thread( getentarray( "emp_light_column", "script_noteworthy" ), ::_id_D046, 0, 3000 );
    common_scripts\utility::array_thread( getentarray( "emp_light_door", "script_noteworthy" ), ::_id_D046, 0, 600 );
    common_scripts\utility::array_thread( getentarray( "emp_light_window_high", "script_noteworthy" ), ::_id_D046, 0, 500 );
    common_scripts\utility::array_thread( getentarray( "emp_light_window_low", "script_noteworthy" ), ::_id_D046, 0, 250 );
    common_scripts\utility::array_thread( getentarray( "emp_light_ground", "script_noteworthy" ), ::_id_D046, 0, 4000 );
}

_id_BD5B( var_0 )
{
    level.team = [];
    maps\_utility::add_global_spawn_function( "allies", ::_id_B5C9 );
    common_scripts\utility::array_thread( getentarray( "intro_team", "targetname" ), maps\_utility::add_spawn_function, maps\dcemp_code::_id_BF1D );
    maps\_utility::activate_trigger( "intro_team", "target" );
    common_scripts\utility::flag_wait( "team_initialized" );
    var_1 = getent( "mask_ents", "targetname" );
    var_1 maps\_utility::activate_destructibles_in_volume();
    var_1 maps\_utility::activate_interactives_in_volume();

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( var_0 )
        level.player setempjammed( 1 );
}

_id_B5C9()
{
    self.colornode_func = ::_id_A82B;
}

_id_A82B( var_0 )
{
    self endon( "stop_going_to_node" );
    self endon( "stop_color_move" );
    self endon( "death" );
    self waittill( "goal" );
    var_0 notify( "trigger", self );
}

_id_A7FD()
{
    common_scripts\utility::flag_init( "dc_emp_missile" );
    common_scripts\utility::flag_init( "dc_emp_missile_hit" );
    common_scripts\utility::flag_init( "dc_emp_afternath" );

    if ( !common_scripts\utility::flag_exist( "dc_emp_bunker" ) )
        common_scripts\utility::flag_init( "dc_emp_bunker" );

    switch ( level.start_point )
    {
        case "intro":
        case "iss":
        case "default":
            common_scripts\utility::flag_wait( "dc_emp_missile" );
            maps\_utility::music_stop( 1.36 );
            level.player thread common_scripts\utility::play_loop_sound_on_entity( "mus_dc_emp_missile" );
            common_scripts\utility::flag_wait( "dc_emp_missile_hit" );
            level.player thread common_scripts\utility::stop_loop_sound_on_entity( "mus_dc_emp_missile" );
            level.player thread common_scripts\utility::play_loop_sound_on_entity( "mus_dc_emp_missile_hit" );
        case "emp":
        case "street":
            common_scripts\utility::flag_wait( "dc_emp_afternath" );
            level.player thread common_scripts\utility::stop_loop_sound_on_entity( "mus_dc_emp_missile_hit" );
            thread maps\_utility::music_play( "mus_dc_emp_afternath" );
        case "corner":
        case "meetup":
        case "lobby":
        case "office":
        case "parking":
        case "plaza":
        case "tunnels":
            common_scripts\utility::flag_wait( "dc_emp_bunker" );
            wait 2.5;
            thread maps\_utility::music_play( "mus_dc_emp_bunker" );
            break;
        default:
            break;
    }
}
