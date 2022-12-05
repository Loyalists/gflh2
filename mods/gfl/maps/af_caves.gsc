// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( maps\af_caves_beautiful_corner::main() )
        return;

    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\af_caves_mission_select_cam::_id_C490();
        return;
    }

    maps\_utility::set_console_status();
    _id_CBA3();
    maps\_utility::default_start( ::_id_B972 );
    maps\_utility::add_start( "road", ::_id_CA0E );
    maps\_utility::add_start( "rappel", ::_id_B80C );
    maps\_utility::add_start( "barracks", ::_id_B9B0, "barracks (cave entrance)" );
    maps\_utility::add_start( "steamroom", ::_id_C703 );
    maps\_utility::add_start( "ledge", ::_id_CDFB );
    maps\_utility::add_start( "overlook", ::start_overlook );
    maps\_utility::add_start( "control", ::start_control_room );
    maps\_utility::add_start( "airstrip", ::_id_D010 );
    level.primaryweapon = "cheytac_silencer_desert";
    level.secondaryweapon = "kriss_acog_silencer";
    precachemodel( "com_flashlight_on" );
    precachemodel( "weapon_parabolic_knife" );
    precachemodel( "com_cellphone_on_anim" );
    precachemodel( "h2_prop_npc_cigar" );
    precachemodel( "com_two_light_fixture_off" );
    precachemodel( "com_utility_light_off" );
    precachemodel( "body_shadow_co_smg_takedown" );
    precachemodel( "head_shadow_co_c_takedown" );
    precachemodel( "body_shadow_co_assault_takedown" );
    precachemodel( "head_shadow_co_b_takedown" );
    precacheitem( "scar_h_thermal_silencer" );
    precacheitem( "usp_silencer" );
    precacheitem( "rappel_knife" );
    precacheitem( "rpg_straight" );
    precacheitem( "hellfire_missile_af_caves" );
    precacherumble( "damage_heavy" );
    precachestring( &"AF_CAVES_HINT_C4_SWITCH" );
    precachestring( &"AF_CAVES_RAPPEL_HINT" );
    precachestring( &"AF_CAVES_RAPPEL_HINT_PC" );
    precachestring( &"AF_CAVES_OVERRIDE" );
    precachestring( &"AF_CAVES_HOOKUP" );
    precacheitem( "cheytac_silencer_desert" );

    precachemodel( "h2_gfl_m4_sopmod_ii_body" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );

    level._id_B8AB = "h2_gfl_m4_sopmod_ii_viewbody";
    level._id_C0C9 = 1;
    level._id_C7C3 = 1;
    _id_CFD6::main();
    _id_AC9E::main();
    _id_CFD6::treadfx_override();
    level._id_B964 = 62500;
    level.cosine["70"] = cos( 70 );
    level.cosine["45"] = cos( 45 );
    maps\af_caves_backhalf::_id_C06B();
    vehicle_scripts\_attack_heli::preload();
    maps\_breach::main();
    maps\_hand_signals::inithandsignals();
    _id_AAAB::main();
    maps\af_caves_anim::main();
    _id_B9EF::main();
    maps\_load::main();
    _id_C471::main();
    maps\af_caves_lighting::main();
    common_scripts\utility::array_thread( getentarray( "steamroom_c4", "targetname" ), maps\_load::ammo_pickup, "c4" );
    maps\af_caves_backhalf::_id_B17D();
    maps\_load::set_player_viewhand_model( "h2_gfl_m4_sopmod_ii_viewhands_player" );
    maps\_drone_ai::init();
    maps\_slowmo_breach::slowmo_breach_init();
    maps\_nightvision::main();
    maps\_stealth::main();
    level._id_BD3C = 1600;
    level._id_B074 = 64000000;
    maps\_patrol_anims::main();
    animscripts\dog\dog_init::initdoganimations();
    maps\_idle::idle_main();
    maps\_idle_phone::main();
    _id_A9F5::main();
    _id_BC61::main();
    _id_B881::main();
    _id_B2D2::main();
    thread _id_D301::_id_C09E();
    maps\af_caves_aud::main();
    maps\_utility::add_hint_string( "begin_descent", &"AF_CAVES_DESCEND", maps\af_caves_code::_id_D0E1, undefined, "small_background" );
    maps\_utility::add_hint_string( "nvg", &"SCRIPT_NIGHTVISION_USE", maps\_nightvision::shouldbreaknvghintprint );
    maps\_utility::add_hint_string( "rappel_melee", &"SCRIPT_PLATFORM_OILRIG_HINT_STEALTH_KILL", maps\af_caves_code::_id_C3DC, undefined, "medium_background" );
    maps\_compass::setupminimap( "compass_map_afghan_caves" );
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "price" );
    level.player setthreatbiasgroup( "player" );
    level._id_B6F5 = [];
    level._id_B6F5["sand"] = 1;
    level.player thread maps\_utility::_id_B43E();
    var_0 = getentarray( "enemy_road_patrollers_dogs", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_CDA1 );

    foreach ( var_2 in var_0 )
        var_2.slowdog = 1;

    var_4 = getentarray( "enemy_road_patrollers", "targetname" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::_id_AD36 );
    var_5 = getent( "group2_smoker_patrol2_start", "script_noteworthy" );
    var_5 maps\_utility::add_spawn_function( ::roadpatrollers_idle );
    var_6 = getent( "group2_doghandler_patrol2_start", "script_noteworthy" );
    var_6 maps\_utility::add_spawn_function( ::roadpatrollers_idle );
    var_7 = getent( "price_spawner", "targetname" );
    var_7 maps\_utility::add_spawn_function( maps\af_caves_code::_id_C00A );
    var_7 maps\_utility::add_spawn_function( maps\af_caves_code::set_threatbiasgroup, "price" );
    var_7 maps\_utility::spawn_ai();
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    common_scripts\utility::array_thread( getentarray( "clip_nosight", "targetname" ), maps\af_caves_code::_id_AEED );
    var_8 = getent( "player_rope", "targetname" );
    var_8 hide();
    var_9 = getent( "soldier_rope", "targetname" );
    var_9 hide();
    var_10 = getent( "rappel_hookup_glowing", "targetname" );
    var_10 hide();
    thread _id_B623();
    level._id_C0C9 = 1;
    level._id_C7C3 = 1;
    thread _id_D3EC();
    thread _id_BDBE();
    thread _id_B721();
    thread maps\af_caves_code::_id_CB64();
    thread maps\af_caves_code::player_falling_to_death();
    thread maps\af_caves_code::_id_D054();
    level.player thread night_vision_no_tesselation();
    thread maps\af_caves_backhalf::_id_B4D7();
    thread maps\af_caves_code::_id_B3B9();
    thread maps\af_caves_code::initialize_portal_flags();
    thread maps\af_caves_code::vista_staticgroups();
    thread maps\af_caves_code::init_fx_alphathreshold();
    thread startexploderfx();
    thread maps\af_caves_code::rotate_fan_blade();
    var_11 = getspawnerarray();
    common_scripts\utility::array_thread( var_11, maps\_utility::add_spawn_function, ::remove_danger_close_gun );
    thread maps\af_caves_backhalf::bombardment_animate_environment();
    thread _id_C0C3::override_wolf_model( "h2_body_vil_shepherd_cheat_af_caves" );
}

remove_danger_close_gun()
{
    self.cheat._id_BDF2 = 1;
}

roadpatrollers_idle()
{
    self.specialidleanim = [ level.scr_anim["generic"]["patrol_idle_1"] ];
}

_id_B623()
{
    level._id_B686 = getent( "steamroom_door_open", "targetname" );
    var_0 = getent( "steamroom_door_closed_col", "targetname" );
    var_0 notsolid();
    var_0 connectpaths();
}

_id_CBA3()
{
    common_scripts\utility::flag_init( "scripted_dialogue" );
    common_scripts\utility::flag_init( "stealth_kill_dialogue_running" );
    common_scripts\utility::flag_init( "unsuppressed_weapon_warning_played" );
    common_scripts\utility::flag_init( "player_falling_kill_in_progress" );
    common_scripts\utility::flag_init( "intro_dialogue_start" );
    common_scripts\utility::flag_init( "intro_fade_in" );
    common_scripts\utility::flag_init( "intro_faded_in" );
    common_scripts\utility::flag_init( "player_intro_unlock" );
    common_scripts\utility::flag_init( "intro_player_moved" );
    common_scripts\utility::flag_init( "introscreen_feed_lines" );
    common_scripts\utility::flag_init( "introscreen_feed_lines_done" );
    common_scripts\utility::flag_init( "price_rise_up" );
    common_scripts\utility::flag_init( "price_abort_intro_stop" );
    common_scripts\utility::flag_init( "intro_player_past_starting_area" );
    common_scripts\utility::flag_init( "intro_price_sent_to_post_getup_node" );
    common_scripts\utility::flag_init( "intro_price_reached_post_getup_node" );
    common_scripts\utility::flag_init( "price_at_hillside" );
    common_scripts\utility::flag_init( "price_hillside_dialogue_done" );
    common_scripts\utility::flag_init( "road_enemy_wiretap_dialogue_done" );
    common_scripts\utility::flag_init( "road_group1_countdown_kill_aborted" );
    common_scripts\utility::flag_init( "group1_countdown_kill_done" );
    common_scripts\utility::flag_init( "road_group1_killed_without_stealthbreak" );
    common_scripts\utility::flag_init( "road_group2_alerted" );
    common_scripts\utility::flag_init( "road_group2_startmoving" );
    common_scripts\utility::flag_init( "road_group2_walked_away" );
    common_scripts\utility::flag_init( "road_group2_coming_back" );
    common_scripts\utility::flag_init( "road_group2_lastchance" );
    common_scripts\utility::flag_init( "road_player_broke_stealth" );
    common_scripts\utility::flag_init( "road_uav_inbound" );
    common_scripts\utility::flag_init( "player_shot_someone" );
    common_scripts\utility::flag_init( "price_done_moving_to_road" );
    common_scripts\utility::flag_init( "road_patrol_humans_cleared" );
    common_scripts\utility::flag_init( "road_patrol_cleared" );
    common_scripts\utility::flag_init( "descending" );
    common_scripts\utility::flag_init( "rappel_threads" );
    common_scripts\utility::flag_init( "price_at_rappel" );
    common_scripts\utility::flag_init( "price_hooksup" );
    common_scripts\utility::flag_init( "player_hooking_up" );
    common_scripts\utility::flag_init( "player_hooked_up" );
    common_scripts\utility::flag_init( "player_failed_rappel" );
    common_scripts\utility::flag_init( "player_braked" );
    common_scripts\utility::flag_init( "guard_2_exposing_himself" );
    common_scripts\utility::flag_init( "player_killing_guard" );
    common_scripts\utility::flag_init( "player_rappeled" );
    common_scripts\utility::flag_init( "rappel_guards_react" );
    common_scripts\utility::flag_init( "rappel_end" );
    common_scripts\utility::flag_init( "end_of_rappel_scene" );
    common_scripts\utility::flag_init( "barracks_price_ready_to_dodge_biggroup" );
    common_scripts\utility::flag_init( "barracks_biggroup_passingby" );
    common_scripts\utility::flag_init( "barracks_biggroup_gone" );
    common_scripts\utility::flag_init( "barracks_stairguys_countdown_dialogue_done" );
    common_scripts\utility::flag_init( "barracks_stairguys_spawned" );
    common_scripts\utility::flag_init( "barracks_stairguys_countdown_kill_done" );
    common_scripts\utility::flag_init( "barracks_stairguys_countdown_kill_aborted" );
    common_scripts\utility::flag_init( "barracks_stealth_broken" );
    common_scripts\utility::flag_init( "barracks_stealthbreak_survived" );
    common_scripts\utility::flag_init( "destroy_tv" );
    common_scripts\utility::flag_init( "barracks_follow_price" );
    common_scripts\utility::flag_init( "steamroom_start" );
    common_scripts\utility::flag_init( "steamroom_knifekill_setup_done" );
    common_scripts\utility::flag_init( "steamroom_price_knifekill_sequencestart" );
    common_scripts\utility::flag_init( "steamroom_price_knifekill_abort" );
    common_scripts\utility::flag_init( "steamroom_price_knifekill_started" );
    common_scripts\utility::flag_init( "steamroom_price_knifekill_walkup_abort" );
    common_scripts\utility::flag_init( "steamroom_price_knifekill_committed" );
    common_scripts\utility::flag_init( "steamroom_price_knifekill_done" );
    common_scripts\utility::flag_init( "steamroom_halfway_point" );
    common_scripts\utility::flag_init( "steamroom_door_preblow" );
    common_scripts\utility::flag_init( "steamroom_door_blown" );
    common_scripts\utility::flag_init( "steamroom_ambush_started" );
    common_scripts\utility::flag_init( "steamroom_player_spotted" );
    common_scripts\utility::flag_init( "steamroom_patrollers_protect_door" );
    common_scripts\utility::flag_init( "steamroom_ambush_done" );
    common_scripts\utility::flag_init( "steamroom_going_dark" );
    common_scripts\utility::flag_init( "steamroom_lights_out" );
    common_scripts\utility::flag_init( "steamroom_ambush_finish_dialogue_ended" );
    common_scripts\utility::flag_init( "steamroom_done" );
}

_id_B972()
{
    soundscripts\_snd::snd_message( "start_default_checkpoint" );
    maps\af_caves_lighting::_id_C7A6( "af_caves_start" );
    level.player maps\_stealth_utility::stealth_default();
    thread maps\af_caves_code::_id_D26D();
    thread _id_CDCD();
}

_id_CA0E()
{
    soundscripts\_snd::snd_message( "start_road_checkpoint" );
    maps\af_caves_lighting::_id_C7A6( "af_caves" );
    level.player maps\_stealth_utility::stealth_default();
    thread maps\af_caves_code::_id_D26D();
    var_0 = common_scripts\utility::getstruct( "road_player", "targetname" );
    var_1 = common_scripts\utility::getstruct( "road_price", "targetname" );
    level.player maps\af_caves_code::_id_B21F( var_0 );
    level.price maps\af_caves_code::_id_B21F( var_1 );
    thread maps\af_caves_code::_id_D270();
    thread maps\af_caves_code::_id_C8A8();
    common_scripts\utility::flag_set( "price_goto_hillside" );
    common_scripts\utility::flag_set( "intro_price_reached_post_getup_node" );
    thread _id_CB97();
    thread _id_AF79();
    soundtime( "music", 1 );
    soundtime( "interface", 1 );
    soundtime( "notimescale", 1 );
}

_id_B80C()
{
    soundscripts\_snd::snd_message( "start_rappel_checkpoint" );
    maps\af_caves_lighting::_id_C7A6( "af_caves" );
    level.player maps\_stealth_utility::stealth_default();
    thread maps\af_caves_code::_id_D26D();
    thread _id_CB97();
    var_0 = getent( "rappel_player", "targetname" );
    var_1 = getent( "rappel_price", "targetname" );
    level.player maps\af_caves_code::_id_B21F( var_0 );
    level.price maps\af_caves_code::_id_B21F( var_1 );
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price maps\_utility::forceuseweapon( "scar_h_thermal_silencer", "primary" );
    common_scripts\utility::flag_set( "rappel_threads" );
    thread maps\af_caves_code::_id_C8A8();
    wait 0.5;
    thread maps\_utility::autosave_by_name( "rappel" );
}

_id_B9B0()
{
    soundscripts\_snd::snd_message( "start_barracks_checkpoint" );
    maps\af_caves_lighting::_id_C7A6( "af_caves" );
    thread _id_D0D0();
    var_0 = getent( "cave_entrance_player", "targetname" );
    var_1 = getent( "cave_entrance_price", "targetname" );
    level.player maps\af_caves_code::_id_B21F( var_0 );
    level.price maps\af_caves_code::_id_B21F( var_1 );
    level.player switchtoweapon( level.secondaryweapon );
    level.price maps\_utility::forceuseweapon( "scar_h_thermal_silencer", "primary" );
    level.price maps\_utility::set_force_color( "r" );
    level.price allowedstances( "crouch" );
    level.player maps\_stealth_utility::stealth_default();
    thread maps\af_caves_code::_id_D26D();
    common_scripts\utility::flag_set( "end_of_rappel_scene" );
    common_scripts\utility::flag_set( "player_killing_guard" );
    thread maps\af_caves_code::_id_C926();
    wait 0.5;
    thread maps\_utility::autosave_by_name( "cave_entrance" );
}

_id_C703()
{
    soundscripts\_snd::snd_message( "start_steamroom_checkpoint" );
    common_scripts\utility::flag_set( "barracks_follow_price" );
    thread _id_CE68();
    maps\af_caves_lighting::_id_C7A6( "af_caves_indoors" );
    var_0 = getent( "steamroom_player", "targetname" );
    level.player maps\af_caves_code::_id_B21F( var_0 );
    level.player maps\_stealth_utility::stealth_default();
    thread maps\af_caves_code::_id_D26D();
    level.player switchtoweapon( level.secondaryweapon );
    var_1 = getent( "steamroom_price", "targetname" );
    level.price maps\af_caves_code::_id_B21F( var_1 );
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price maps\_utility::forceuseweapon( "scar_h_thermal_silencer", "primary" );
    common_scripts\utility::flag_set( "steamroom_start" );
    wait 0.5;
    thread maps\_utility::autosave_by_name( "steamroom" );
}

_id_CDFB()
{
    soundscripts\_snd::snd_message( "start_ledge_checkpoint" );
    maps\af_caves_lighting::_id_C7A6( "af_caves_ledge" );
    level notify( "start_ledge" );
    _id_B1AD();
    thread maps\af_caves_code::_id_A8CC();
    level.player maps\_stealth_utility::stealth_default();
    thread maps\af_caves_code::_id_C9CF();
    common_scripts\utility::flag_set( "steamroom_halfway_point" );
    var_0 = getent( "ledge_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    thread maps\af_caves_backhalf::_id_C595();
    var_1 = getent( "ledge_price", "targetname" );
    level.price teleport( var_1.origin, var_1.angles );
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price maps\_utility::forceuseweapon( "scar_h_thermal_silencer", "primary" );
    wait 0.1;
    common_scripts\utility::flag_set( "steamroom_done" );
    common_scripts\utility::flag_set( "steamroom_ambush_finish_dialogue_ended" );
    wait 0.5;
    thread maps\_utility::autosave_by_name( "ledge" );
    var_2 = getent( "shadow_breach", "targetname" );
    var_2 connectpaths();
    var_2 delete();
}

start_overlook()
{
    soundscripts\_snd::snd_message( "start_overlook_checkpoint" );
    maps\af_caves_lighting::_id_C7A6( "af_caves_indoors_overlook" );
    var_0 = getent( "overlook_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    thread maps\af_caves_backhalf::_id_C595();
    var_1 = getent( "overlook_price", "targetname" );
    level.price teleport( var_1.origin, var_1.angles );
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price maps\_utility::forceuseweapon( "m4_grenadier", "primary" );
    thread maps\af_caves_code::_id_C9CF();
    common_scripts\utility::flag_set( "player_crossed_bridge" );
    wait 0.5;
    thread maps\_utility::autosave_by_name( "overlook" );
}

start_control_room()
{
    soundscripts\_snd::snd_message( "start_control_room_checkpoint" );
    maps\af_caves_lighting::_id_C7A6( "af_caves_indoors_skylight" );
    var_0 = getent( "control_room_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    thread maps\af_caves_backhalf::_id_C595();
    var_1 = getent( "control_room_price", "targetname" );
    level.price teleport( var_1.origin, var_1.angles );
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price maps\_utility::forceuseweapon( "m4_grenadier", "primary" );
    level.price maps\_utility::set_ignoreme( 0 );
    thread maps\af_caves_code::_id_C9CF();
    thread maps\af_caves_backhalf::_id_CB3C();
    common_scripts\utility::flag_set( "player_right_near_breach" );
    common_scripts\utility::flag_set( "player_right_near_breach" );
    wait 0.05;
    level.price maps\_utility::enable_ai_color();
    level.price allowedstances( "stand", "crouch", "prone" );
}

_id_D010()
{
    soundscripts\_snd::snd_message( "start_airstrip_checkpoint" );
    maps\af_caves_lighting::_id_C7A6( "af_caves_outdoors_airstrip" );
    var_0 = getent( "airstrip_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    thread maps\af_caves_backhalf::_id_C595();
    var_1 = getnode( "node_price_escape_cover", "targetname" );
    level.price teleport( var_1.origin, var_1.angles );
    level.price setgoalnode( var_1 );
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price maps\_utility::forceuseweapon( "m4_grenadier", "primary" );
    level.price maps\_utility::set_ignoreme( 0 );
    thread maps\af_caves_code::_id_C9CF();
    common_scripts\utility::flag_set( "location_change_control_room" );
    common_scripts\utility::flag_set( "obj_escape_complete" );
    wait 1;
    thread maps\af_caves_backhalf::_id_D576();
}

_id_CB97()
{
    var_0 = 0;
    objective_add( var_0, "active", &"AF_CAVES_LOCATE_SHEPHERD" );
    var_0 = 1;
    var_1 = level.price.origin;
    objective_add( var_0, "active", &"AF_CAVES_FOLLOW_PRICE", var_1 );
    _func_1E7( var_0, 1 );
    objective_state_nomessage( var_0, "current" );
    objective_onentity( var_0, level.price, ( 0.0, 0.0, 70.0 ) );
    common_scripts\utility::flag_wait( "price_hooksup" );
    wait 0.5;
    objective_state_nomessage( var_0, "done" );
    thread _id_AD89();
}

_id_AD89()
{
    var_0 = 1;
    objective_add( var_0, "active", &"AF_CAVES_OBJ_RAPPEL", ( 0.0, 0.0, 0.0 ) );
    objective_current( var_0 );
    objective_position( var_0, ( 3006.0, 11756.0, -1834.0 ) );
    objective_setpointertextoverride( var_0, &"AF_CAVES_HOOKUP" );
    common_scripts\utility::flag_wait( "end_of_rappel_scene" );
    wait 1;
    objective_state_nomessage( var_0, "done" );
}

_id_CE68()
{
    common_scripts\utility::flag_wait( "barracks_follow_price" );
    var_0 = 2;
    objective_add( var_0, "active", &"AF_CAVES_FOLLOW_PRICE", level.price.origin );
    objective_current( var_0 );
    objective_onentity( var_0, level.price );
    _func_1E7( var_0, 1 );
    common_scripts\utility::flag_wait( "steamroom_ambush_started" );
    objective_string( var_0, &"AF_CAVES_SUPPORT_PRICE" );
    objective_setpointertextoverride( var_0, &"AF_CAVES_OBJ_MARKER_SUPPORT" );
    objective_state( var_0, "current" );
    var_1 = getdvar( "objectiveFadeTooFar" );
    setsaveddvar( "objectiveFadeTooFar", 5 );
    common_scripts\utility::flag_wait( "steamroom_ambush_done" );
    objective_string( var_0, &"AF_CAVES_FOLLOW_PRICE" );
    objective_setpointertextoverride( var_0, "" );
    objective_state( var_0, "current" );
    setsaveddvar( "objectiveFadeTooFar", var_1 );
    common_scripts\utility::flag_wait( "shephered_ledge_dialogue_starting" );
    objective_state_nomessage( var_0, "done" );
}

_id_C508()
{
    var_0 = 4;
    var_1 = level.price.origin;
    objective_add( var_0, "active", &"AF_CAVES_REGROUP_WITH_PRICE", var_1 );
    objective_current( var_0 );
    objective_onentity( var_0, level.price, ( 0.0, 0.0, 70.0 ) );
    common_scripts\utility::flag_wait( "level_exit" );
    objective_state( var_0, "done" );
}

_id_CDCD()
{
    thread maps\af_caves_code::_id_D270();
    thread intro_player();
    thread _id_CB6F();
    thread maps\af_caves_code::_id_C8A8();
    thread intro_dialogue();
    thread _id_B369();
    thread _id_AF79();
}

_id_CB6F()
{
    maps\_utility::trigger_wait_targetname( "trig_intro_past_starting_area" );
    common_scripts\utility::flag_set( "intro_player_past_starting_area" );
}

intro_player()
{
    var_0 = common_scripts\utility::getstruct( "player_intro_spot", "targetname" );
    level.player maps\af_caves_code::_id_B21F( var_0 );
    level.player allowcrouch( 0 );
    level.player allowstand( 0 );
    level.player setstance( "prone" );
    level.player disableweapons();
    wait 0.2;
    level.player freezecontrols( 1 );
    level.player._id_A8D6 = level.player.origin;
    common_scripts\utility::flag_wait( "player_intro_unlock" );
    level.player freezecontrols( 0 );
    level.player allowcrouch( 1 );
    level.player allowstand( 1 );
    level.player enableweapons();
    thread _id_B85C();
    maps\_utility::player_speed_percent( 90 );
}

_id_B85C()
{
    var_0 = 225;

    while ( distancesquared( level.player.origin, level.player._id_A8D6 ) < var_0 )
        wait 0.05;

    common_scripts\utility::flag_set( "intro_player_moved" );
}

intro_dialogue()
{
    common_scripts\utility::flag_wait( "intro_dialogue_start" );
    maps\_utility::radio_dialogue( "afcaves_nkl_waitforyou" );
    maps\_utility::radio_dialogue( "afcaves_pri_dontbother" );
    thread _id_D019();
    maps\_utility::radio_dialogue( "afcaves_nkl_goodluck" );
    common_scripts\utility::flag_set( "price_rise_up" );
    common_scripts\utility::flag_wait( "intro_faded_in" );
    thread _id_B625();
    common_scripts\utility::flag_set( "introscreen_feed_lines" );
    wait 9.5;
    common_scripts\utility::flag_set( "introscreen_feed_lines_done" );

    if ( !common_scripts\utility::flag( "intro_player_moved" ) )
        maps\_utility::radio_dialogue( "afcaves_pri_moveout" );
}

_id_B625()
{
    common_scripts\utility::flag_wait( "player_intro_unlock" );
    thread _id_CB97();
}

_id_D019()
{
    thread _id_CFD6::_id_B2E8();
    wait 0.25;
    common_scripts\utility::flag_set( "intro_fade_in" );
}

_id_B369()
{
    level.price pushplayer( 1 );
    var_0 = getnode( "price_get_up", "targetname" );
    var_1 = maps\_utility::spawn_anim_model( "tarp", var_0.origin );
    var_2[0] = level.price;
    var_2[1] = var_1;
    var_0 maps\_anim::anim_first_frame( var_2, "rise_up" );
    common_scripts\utility::flag_wait( "price_rise_up" );
    maps\_utility::delaythread( 4, common_scripts\utility::flag_set, "player_intro_unlock" );
    level.price thread maps\_utility::play_sound_on_tag_endon_death( "scn_price_rise_up" );
    var_0 maps\_anim::anim_single( var_2, "rise_up" );
    level.price.moveplaybackrate = 1.2;
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price.goalradius = 128;
    var_3 = getnode( "node_intro_price_postgetup", "targetname" );
    level.price setgoalnode( var_3 );

    if ( !common_scripts\utility::flag( "price_goto_hillside" ) )
        level.price waittill( "goal" );

    common_scripts\utility::flag_set( "intro_price_reached_post_getup_node" );
}

_id_AF79()
{
    level.price pushplayer( 1 );
    level.price.noslopeanimation = 1;
    level.price _meth_8583();
    maps\af_caves_code::_id_D22A();
    _id_B378();
    var_0 = getent( "trig_script_color_allies_r5", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    thread _id_AFDD();
    thread _id_BE98();
    thread _id_C1AE();
    thread _id_CDEB();
    thread _id_B1DB();
    thread _id_B10F();
    thread _id_ABE4();
    thread _id_B790();
    thread _id_C4B6();
    thread _id_D182();
    thread _id_B290();
    thread _id_CA8A();
    thread _id_ACFC();
    thread _id_C740();
}

_id_B378()
{
    var_0 = [];
    var_0["ai_eventDistBullet"]["hidden"] = 256;
    var_0["ai_eventDistNewEnemy"]["spotted"] = 750;
    var_0["ai_eventDistNewEnemy"]["hidden"] = 512;
    thread maps\_stealth_utility::stealth_ai_event_dist_custom( var_0 );
    level.corpse_behavior_doesnt_require_player_sight = 1;
}

_id_BE98()
{
    level thread maps\af_caves_code::_id_C156( "intro_ambient_canyonroad_convoy_vehicle", "player_hooked_up", 12, 25 );
    level thread maps\af_caves_code::_id_C156( "intro_ambient_canyonroad_convoy_vehicle_lower", "player_hooked_up", 12, 25 );
    common_scripts\utility::flag_wait( "road_group2_startmoving" );
    wait 5.5;
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "air_convoy_road" );
    var_0[0] thread maps\_utility::play_sound_on_entity( "scn_af_caves_air_convoy_road" );
}

_id_C1AE()
{
    common_scripts\utility::flag_wait( "player_at_overlook" );
    thread maps\_utility::autosave_stealth();
}

_id_AD36()
{
    var_0 = [];
    var_0["found"] = ::_id_CAC4;
    maps\_stealth_utility::stealth_corpse_behavior_custom( var_0 );
    var_1 = [];
    var_1["explode"] = ::_id_CAC4;
    var_1["heard_scream"] = ::_id_CAC4;
    var_1["doFlashBanged"] = ::_id_CAC4;

    foreach ( var_4, var_3 in var_1 )
        maps\_stealth_event_enemy::stealth_event_mod( var_4, var_3 );

    if ( isdefined( self.script_parameters ) && issubstr( self.script_parameters, "group2" ) )
        thread _id_BE40();

    if ( maps\af_caves_code::_id_AD86() )
        return;

    if ( isdefined( self.script_noteworthy ) && issubstr( self.script_noteworthy, "cellphone_anim_model" ) )
        thread cellphone_monitor();

    self.a.disablelongdeath = 1;
    var_5["warning1"] = maps\_stealth_threat_enemy::enemy_alert_level_warning2;
    var_5["attack"] = ::_id_B3ED;
    maps\_stealth_utility::stealth_threat_behavior_replace( var_5 );
}

_id_BE40()
{
    level endon( "road_group2_alerted" );
    thread _id_B8A2();
    common_scripts\utility::waittill_any( "death", "group2_guy_alerted" );
    common_scripts\utility::flag_set( "road_group2_alerted" );
}

_id_B8A2()
{
    self endon( "death" );

    while ( maps\_utility::ent_flag( "_stealth_normal" ) )
        wait 0.05;

    self notify( "group2_guy_alerted" );
}

_id_CAC4( var_0 )
{
    self.favoriteenemy = level.player;
    wait 1;
    self notify( "enemy_awareness_reaction" );
    waitframe();
}

cellphone_monitor()
{
    level endon( "road_patrol_cleared" );
    level endon( "enemy_awareness_reaction" );
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 linkto( self, "tag_inhand", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( maps\_utility::getmodel( "com_cellphone_on_anim" ) );
    self.phone = var_0;
    thread remove_phone( var_0 );

    for (;;)
    {
        level waittill( "detach_phone_notify" );
        var_0 unlink();
        var_0 hide();
        level waittill( "attach_phone_notify" );
        var_0 show();
        var_0 linkto( self, "tag_inhand", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    }
}

remove_phone( var_0 )
{
    common_scripts\utility::waittill_any( "death", "enemy_awareness_reaction" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_B3ED()
{
    self.pathrandompercent = 200;
    thread maps\_utility::disable_cqbwalk();
    thread maps\_stealth_shared_utilities::enemy_announce_spotted( self.origin );
    self.goalradius = 1024;
    var_0 = 256;
    var_1 = 2;
    self endon( "death" );
    maps\_utility::ent_flag_set( "_stealth_override_goalpos" );

    while ( isdefined( self.enemy ) && maps\_utility::ent_flag( "_stealth_enabled" ) )
    {
        var_2 = self.goalradius - 150;

        if ( var_2 < var_0 )
            var_2 = var_0;

        self.goalradius = var_2;
        self setgoalpos( self.enemy.origin );
        wait(var_1);
    }
}

_id_CDA1()
{
    var_0["attack"] = ::_id_B1DC;
    maps\_stealth_utility::stealth_threat_behavior_custom( var_0 );
    maps\_stealth_utility::stealth_pre_spotted_function_custom( ::_id_BA9F );
}

_id_B1DC()
{
    self endon( "death" );
    maps\_utility::clear_run_anim();
    wait 5;
    self.goalradius = 6800;
    self setgoalentity( level.player );
}

_id_CB47()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    wait 4;
}

_id_C190()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    wait 3;
}

_id_BA9F()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    wait 5;
}

_id_AFDD()
{
    common_scripts\utility::flag_wait( "intro_price_reached_post_getup_node" );
    common_scripts\utility::flag_wait( "price_goto_hillside" );
    thread _id_D396( "player_moving_to_road" );
    thread _id_D396( "_stealth_spotted" );
    thread _id_D396( "player_shot_someone_in_group1" );
    level.price allowedstances( "crouch" );
    var_0 = getnode( "intro_price_hold_up_node", "targetname" );
    var_0 maps\_anim::anim_reach_solo( level.price, "intro_stop" );
    common_scripts\utility::flag_set( "price_at_hillside" );

    if ( common_scripts\utility::flag( "price_abort_intro_stop" ) )
        return;

    var_0 maps\_anim::anim_single_solo( level.price, "intro_stop" );
    level.price._id_B4F7 = level.price.goalradius;
    level.price.goalradius = 96;
    level.price pushplayer( 1 );
    level.price setgoalpos( level.price.origin );
}

_id_D396( var_0 )
{
    level endon( "price_abort_intro_stop" );
    level waittill( var_0 );
    common_scripts\utility::flag_set( "price_abort_intro_stop" );
}

_id_CDEB()
{
    level endon( "player_moving_to_road" );
    level endon( "_stealth_spotted" );
    level endon( "player_shot_someone_in_group1" );
    level endon( "road_patrol_group1" );
    thread _id_C7DA();
    level endon( "hillside_dialogue_stop" );
    common_scripts\utility::flag_wait( "price_goto_hillside" );
    maps\_utility::radio_dialogue( "pri_thermalspike" );
    common_scripts\_exploder::exploder( "birds_fly_intro" );
    common_scripts\utility::flag_wait( "player_at_overlook" );
    maps\_utility::radio_dialogue( "pri_holdup" );
    maps\_utility::radio_dialogue( "pri_enemypatrol" );
    maps\_utility::radio_dialogue( "afcaves_pri_holdyourfire" );
    maps\_utility::radio_dialogue( "afcaves_pri_intelwassolid" );
    common_scripts\utility::flag_set( "road_group2_startmoving" );
    wait 3.5;
    maps\_utility::radio_dialogue( "afcaves_pri_splittingup" );
    wait 1.5;
    maps\_utility::radio_dialogue( "afcaves_pri_decryptioncode" );
    common_scripts\utility::flag_set( "price_hillside_dialogue_done" );
}

_id_C7DA()
{
    level endon( "price_hillside_dialogue_done" );

    while ( maps\_stealth_utility::stealth_is_everything_normal() )
        wait 0.05;

    level notify( "hillside_dialogue_stop" );
}

_id_B1DB()
{
    level endon( "road_player_broke_stealth" );
    common_scripts\utility::flag_wait( "price_hillside_dialogue_done" );
    _id_AF8C();
    maps\_utility::radio_dialogue( "afcaves_schq_goahead" );
    _id_AF8C();
    maps\_utility::radio_dialogue( "afcaves_sc1_riverbedclear" );
    _id_AF8C();
    maps\_utility::radio_dialogue( "afcaves_schq_bravo" );
    _id_AF8C();
    maps\_utility::radio_dialogue( "afcaves_sc3_sandstorm" );
    _id_AF8C();
    maps\_utility::radio_dialogue( "afcaves_schq_zulu" );
    _id_AF8C();
    maps\_utility::radio_dialogue( "afcaves_sc1_startingpatrol" );
    common_scripts\utility::flag_set( "road_enemy_wiretap_dialogue_done" );
}

_id_AF8C()
{
    for (;;)
    {
        var_0 = gettime();
        common_scripts\utility::flag_waitopen( "scripted_dialogue" );
        common_scripts\utility::flag_waitopen( "stealth_kill_dialogue_running" );
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        common_scripts\utility::flag_waitopen( "_stealth_event" );

        if ( gettime() > var_0 )
        {
            wait 5;
            continue;
        }

        break;
    }
}

_id_B10F()
{
    common_scripts\utility::flag_wait( "player_at_overlook" );
    var_0 = maps\_utility::get_ai_group_ai( "road_patrol_enemies_group1" );
    var_1 = maps\_utility::get_ai_group_ai( "road_patrol_enemies_group2" );
    var_2 = common_scripts\utility::array_combine( var_0, var_1 );

    while ( maps\af_caves_code::_id_B4C6( var_2 ) )
        wait 0.05;

    common_scripts\utility::flag_set( "road_patrol_humans_cleared" );
}

_id_ABE4()
{
    level endon( "player_hooked_up" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    thread _id_B06B();
    thread _id_A96E();
    common_scripts\utility::flag_set( "road_player_broke_stealth" );
}

_id_A96E()
{
    level endon( "player_hooked_up" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    var_0 = getent( "sbmodel_hillside_brush_aiclip", "targetname" );
    var_0 maps\_utility::hide_entity();
}

_id_B790()
{
    level endon( "road_player_broke_stealth" );
    common_scripts\utility::flag_wait( "player_slid_downhill" );
    var_0 = getent( "vol_player_slidedown_axis_stealthbreak", "targetname" );
    var_1 = var_0 maps\_utility::get_ai_touching_volume( "axis" );
    var_1 = maps\_utility::array_removedead( var_1 );
    var_1 = common_scripts\utility::array_removeundefined( var_1 );
    var_1 = common_scripts\utility::get_array_of_closest( level.player.origin, var_1 );

    if ( !var_1.size )
        return;

    var_2 = undefined;

    foreach ( var_4 in var_1 )
    {
        if ( isalive( var_4 ) )
        {
            var_2 = var_4;
            break;
        }
    }

    if ( !isdefined( var_2 ) )
        return;

    var_2.favoriteenemy = level.player;
    wait 2;

    if ( isalive( var_2 ) )
        var_2.favoriteenemy = undefined;
}

_id_C4B6()
{
    level endon( "road_patrol_cleared" );
    level endon( "road_patrol_humans_cleared" );
    var_0 = [];
    var_0[0] = "afcaves_pri_ontousgoloud";
    var_0[1] = "afcaves_pri_compromisedgoloud";

    while ( !common_scripts\utility::flag( "road_patrol_cleared" ) )
    {
        common_scripts\utility::flag_wait( "_stealth_spotted" );

        if ( common_scripts\utility::flag( "road_patrol_humans_cleared" ) )
            return;

        maps\_utility::radio_dialogue( common_scripts\utility::random( var_0 ) );
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    }
}

_id_D182()
{
    common_scripts\utility::flag_wait( "price_at_hillside" );
    common_scripts\utility::flag_wait( "road_player_broke_stealth" );
    maps\_utility::battlechatter_off( "allies" );
    wait 0.5;
    level.price pushplayer( 0 );
    level.price.dontevershoot = undefined;
    level.price.maxsightdistsqrd = level._id_B074;
    level.price maps\_utility::set_ignoreme( 1 );
    thread _id_A943();
    level.price thread maps\af_caves_code::_id_CD02( "scar_h_thermal_silencer" );

    if ( isdefined( level.price._id_B4F7 ) )
    {
        while ( level.price._animactive > 0 )
            wait 0.05;

        level.price.goalradius = level.price._id_B4F7;
        level.price._id_B4F7 = undefined;
    }
}

_id_A943()
{
    var_0 = level.price.threatbias;
    level.price.threatbias = -350;
    var_1 = level.price.baseaccuracy;
    level.price.baseaccuracy = 100;

    while ( !maps\_stealth_utility::stealth_is_everything_normal() )
        wait 0.05;

    level.price.threatbias = var_0;
    level.price.baseaccuracy = var_1;
}

_id_B290()
{
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "road_group2_startmoving" );
    var_0 = maps\_utility::get_ai_group_ai( "road_patrol_enemies_group2" );
    common_scripts\utility::array_thread( var_0, ::_id_CD48, var_0 );
}

_id_D0C4()
{
    maps\_anim::anim_generic_run( self, "patrol_turn180" );
}

waituntilalertedforik()
{
    self endon( "death" );
    level common_scripts\utility::waittill_any( "_stealth_spotted", "road_group2_alerted" );
    self _meth_8582();
}

_id_CD48( var_0 )
{
    self endon( "death" );
    self endon( "_stealth_spotted" );
    level._id_B0B4 = 0;
    thread _id_BDF4();
    level thread _id_C07D( var_0 );

    if ( !maps\af_caves_code::_id_AD86() )
    {
        self _meth_8583();
        thread waituntilalertedforik();

        if ( !isdefined( self.script_pet ) )
        {
            wait(randomfloatrange( 2, 3.5 ));
            self notify( "end_patrol" );
            _id_D0C4();
        }
        else
        {
            self notify( "end_patrol" );
            wait 0.05;
        }

        thread maps\_patrol::patrol( self.script_noteworthy );
        thread _id_BB9E();
    }
    else if ( self.script_pet == 2 )
    {
        self.script_pet = -1;
        var_1 = undefined;

        foreach ( var_3 in var_0 )
        {
            if ( !var_3 maps\af_caves_code::_id_AD86() && isdefined( var_3.script_pet ) && var_3.script_pet == 2 )
            {
                var_1 = var_3;
                break;
            }
        }

        if ( !isdefined( var_1 ) )
            return;

        var_1 endon( "death" );
        var_5 = common_scripts\utility::getstruct( "relink_pet", "script_noteworthy" );
        var_5 waittill( "trigger" );
        self.script_pet = 2;
        var_1 maps\_patrol::linkpet();
    }

    var_6 = getent( "trig_road_group2_nearendpath", "targetname" );
    var_7 = 2;
    var_8 = 0;

    while ( var_8 < var_7 )
    {
        var_6 waittill( "trigger", var_9 );

        if ( var_9 == self )
        {
            var_8++;

            while ( self istouching( var_6 ) )
                wait 0.1;
        }
    }

    if ( !common_scripts\utility::flag( "road_group2_coming_back" ) )
        common_scripts\utility::flag_set( "road_group2_coming_back" );

    thread _id_ADF8();
    maps\_utility::trigger_wait_targetname( "trig_road_group2_midpath" );

    if ( !common_scripts\utility::flag( "road_group2_lastchance" ) )
        common_scripts\utility::flag_set( "road_group2_lastchance" );
}

_id_ADF8()
{
    self endon( "death" );

    while ( !maps\_utility::ent_flag( "_stealth_found_corpse" ) )
        wait 0.1;

    self.favoriteenemy = level.player;
    wait 2;
    self.favoriteenemy = undefined;
}

_id_BB9E()
{
    self.moveplaybackrate = 1.1;
    self waittill( "_stealth_spotted" );
    self.moveplaybackrate = 1;
}

_id_BDF4()
{
    self endon( "death" );
    self endon( "_stealth_spotted" );
    var_0 = 500;
    var_1 = ( 2408.0, 13424.0, -1840.0 );

    while ( distance2d( self.origin, var_1 ) < var_0 )
        wait 0.05;

    level._id_B0B4++;
}

_id_C07D( var_0 )
{
    var_1 = var_0.size;

    while ( var_0.size > level._id_B0B4 )
        wait 0.05;

    common_scripts\utility::flag_set( "road_group2_walked_away" );
}

_id_CA8A()
{
    level thread _id_B9BE();
    level thread _id_B84D();
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "road_group2_walked_away" );
    common_scripts\utility::flag_wait( "road_enemy_wiretap_dialogue_done" );

    while ( !maps\_stealth_utility::stealth_is_everything_normal() )
        wait 0.1;

    thread maps\_utility::autosave_stealth();
    level notify( "road_group1_countdown_kill_alldead_flag_stop" );
    var_0 = maps\_utility::get_ai_group_ai( "road_patrol_enemies_group1" );
    var_1 = [];
    var_2 = [];
    var_3 = undefined;

    foreach ( var_5 in var_0 )
    {
        self.dontattackme = 1;

        if ( var_5 maps\af_caves_code::_id_AD86() )
        {
            var_3 = var_5;
            continue;
        }
        else if ( level.gameskill < 2 )
            var_5 maps\_stealth_utility::stealth_pre_spotted_function_custom( ::_id_CB47 );
        else
            var_5 maps\_stealth_utility::stealth_pre_spotted_function_custom( ::_id_C190 );

        if ( isdefined( var_5.script_parameters ) )
        {
            if ( var_5.script_parameters == "leftside" )
            {
                var_1[var_1.size] = var_5;
                continue;
            }

            if ( var_5.script_parameters == "rightside" )
                var_2[var_2.size] = var_5;
        }
    }

    var_7 = var_1;
    var_8 = var_2;
    common_scripts\utility::array_thread( var_0, ::_id_D0B1, var_8 );
    level thread _id_B372();
    var_9 = level common_scripts\utility::waittill_any_return( "player_shot_someone_in_group1", "countdown_kill_dialogue_done" );
    var_10 = 0;

    if ( isdefined( var_9 ) && var_9 == "countdown_kill_dialogue_done" )
        var_10 = 1;

    if ( isdefined( level._id_C4B7 ) && !level._id_C4B7 )
    {
        var_11 = var_7;
        var_7 = var_8;
        var_8 = var_11;
    }

    maps\af_caves_code::_id_D319();
    level.price clearenemy();

    while ( !_id_AAE7( var_7 ) )
    {
        foreach ( var_5 in var_7 )
        {
            if ( !isalive( var_5 ) )
            {
                wait 0.05;
                continue;
            }

            if ( !isalive( level.price.enemy ) )
            {
                maps\af_caves_code::_id_CD41( var_5 );
                var_5 waittill( "death" );
            }

            wait 0.05;
        }
    }

    if ( isalive( var_3 ) )
        wait 1.5;

    var_14 = 1;

    if ( isalive( var_3 ) )
    {
        maps\af_caves_code::_id_CD41( var_3 );
        var_3 waittill( "death", var_15 );

        if ( var_15 == level.price )
            var_14 = 0;
    }

    common_scripts\utility::flag_wait( "road_patrol_group1" );
    wait 1;

    if ( !common_scripts\utility::flag( "road_player_broke_stealth" ) )
    {
        if ( var_10 )
            maps\_utility::radio_dialogue( "afcaves_pri_sticktoplan" );
        else if ( !level._id_C4B7 )
            maps\_utility::radio_dialogue( "afcaves_pri_closeenough" );
        else if ( var_14 )
            maps\_utility::radio_dialogue( "afcaves_pri_justlikeoldtimes" );
        else
            maps\_utility::radio_dialogue( "afcaves_pri_dogneutralized" );

        common_scripts\utility::flag_set( "road_group1_killed_without_stealthbreak" );
    }

    common_scripts\utility::flag_set( "group1_countdown_kill_done" );
}

_id_B9BE()
{
    level endon( "group1_countdown_kill_done" );
    level endon( "road_group1_countdown_kill_aborted" );
    level waittill( "_stealth_spotted" );
    common_scripts\utility::flag_set( "road_group1_countdown_kill_aborted" );
}

_id_B84D()
{
    level endon( "group1_countdown_kill_done" );
    level endon( "road_group1_countdown_kill_alldead_flag_stop" );
    level endon( "road_group1_countdown_kill_aborted" );
    common_scripts\utility::flag_wait( "road_patrol_group1" );
    common_scripts\utility::flag_set( "road_group1_countdown_kill_aborted" );
}

_id_B372()
{
    level endon( "_stealth_spotted" );
    level endon( "road_group2_alerted" );
    level endon( "player_shot_someone_in_group1" );
    common_scripts\utility::flag_set( "stealth_kill_dialogue_running" );
    maps\_utility::radio_dialogue( "afcaves_pri_grouponright" );
    maps\_utility::radio_dialogue( "afcaves_pri_twoonleft" );
    maps\_utility::radio_dialogue( "afcaves_pri_onmymark" );
    maps\_utility::radio_dialogue( "afcaves_pri_three" );
    maps\_utility::radio_dialogue( "afcaves_pri_two" );
    maps\_utility::radio_dialogue( "afcaves_pri_one" );
    maps\_utility::radio_dialogue( "afcaves_pri_mark" );
    common_scripts\utility::flag_clear( "stealth_kill_dialogue_running" );
    wait 1;
    level notify( "countdown_kill_dialogue_done" );
}

_id_AAE7( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
            return 0;
    }

    return 1;
}

_id_D0B1( var_0 )
{
    level endon( "player_shot_someone_in_group1" );
    self waittill( "damage", var_1, var_2 );

    if ( var_2 == level.player )
    {
        level._id_C4B7 = 0;

        if ( common_scripts\utility::array_contains( var_0, self ) )
            level._id_C4B7 = 1;

        level notify( "player_shot_someone_in_group1" );
    }
}

_id_BAC9()
{
    level endon( "road_patrol_group2" );
    level endon( "road_group2_alerted" );
    common_scripts\utility::flag_wait( "road_group2_lastchance" );
    maps\_utility::radio_dialogue( "afcaves_pri_findthebodies" );
}

_id_ACFC()
{
    common_scripts\utility::flag_wait( "road_patrol_group1" );

    if ( !common_scripts\utility::flag( "road_group1_countdown_kill_aborted" ) )
    {
        if ( !common_scripts\utility::flag( "group1_countdown_kill_done" ) )
            common_scripts\utility::flag_wait_any( "group1_countdown_kill_done", "road_group1_countdown_kill_aborted" );
    }

    while ( !maps\_stealth_utility::stealth_is_everything_normal() )
        wait 0.05;

    if ( !common_scripts\utility::flag( "road_patrol_group2" ) && !common_scripts\utility::flag( "road_group2_alerted" ) )
    {
        thread _id_BAC9();
        wait 0.5;

        if ( !common_scripts\utility::flag( "road_patrol_group2" ) && !common_scripts\utility::flag( "road_group2_alerted" ) )
            thread maps\_utility::radio_dialogue( "afcaves_pri_beforecomeback" );
    }

    level.price thread maps\af_caves_code::_id_CD02( "scar_h_thermal_silencer" );
    maps\af_caves_code::_id_D22A();
    level.price maps\_utility::set_ignoreme( 1 );
    thread _id_B06B();
    var_0 = getent( "trig_script_color_allies_r5", "targetname" );
    var_0 common_scripts\utility::trigger_on();
    var_0 notify( "trigger" );
    var_1 = getent( "price_slide_animent", "targetname" );
    level.price.goalradius = 24;
    var_1 maps\_anim::anim_reach_solo( level.price, "price_slide" );
    var_2 = getnode( "price_sliding_node", "targetname" );
    var_3 = distance2dsquared( level.price.origin, var_2.origin ) < 576;

    if ( var_3 )
    {
        var_1 maps\_anim::anim_single_solo( level.price, "price_slide" );
        level.price notify( "stop_slide_fx" );
    }

    if ( !common_scripts\utility::flag( "road_group2_alerted" ) )
    {
        level.price maps\_utility::disable_ai_color();
        level.price.goalradius = 256;
    }

    if ( var_3 )
    {
        var_4 = getnode( "node_price_roadspot_1", "targetname" );
        level.price setgoalnode( var_4 );
        level.price waittill( "goal" );
    }

    if ( !common_scripts\utility::flag( "player_slid_downhill" ) && !common_scripts\utility::flag( "road_patrol_group2" ) )
        thread _id_B413();

    common_scripts\utility::flag_wait( "player_slid_downhill" );
    level.price allowedstances( "stand", "crouch", "prone" );

    if ( !common_scripts\utility::flag( "road_group2_alerted" ) )
        thread maps\_utility::radio_dialogue( "afcaves_pri_taketheothers" );

    level.price maps\_utility::disable_ai_color();
    level.price.goalradius = 64;
    var_5 = getnode( "node_price_roadspot_2", "targetname" );
    level.price setgoalnode( var_5 );
    level.price waittill( "goal" );
    level.price maps\_utility::set_ignoreme( 0 );
    common_scripts\utility::flag_set( "price_done_moving_to_road" );

    if ( !common_scripts\utility::flag( "road_group2_alerted" ) )
        thread _id_D2BF();
}

_id_B413()
{
    level endon( "player_slid_downhill" );
    level endon( "road_group2_coming_back" );
    level endon( "road_group2_alerted" );
    level endon( "road_patrol_group2" );
    var_0 = [];
    var_0[var_0.size] = "afcaves_pri_downhere";
    var_0[var_0.size] = "afcaves_pri_groupsback";

    while ( !common_scripts\utility::flag( "player_slid_downhill" ) )
    {
        foreach ( var_2 in var_0 )
        {
            wait 10;

            if ( !common_scripts\utility::flag( "player_slid_downhill" ) )
                maps\_utility::radio_dialogue( var_2 );
        }
    }
}

_id_B06B()
{
    if ( isdefined( level._id_CFDA ) )
        return;
    else
        level._id_CFDA = 1;

    var_0 = getent( "price_hillside_clip", "targetname" );
    var_0 connectpaths();
    var_0 notsolid();
}

_id_D2BF()
{
    level endon( "_stealth_spotted" );
    var_0 = maps\_utility::get_ai_group_ai( "road_patrol_enemies_group2" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isalive( var_3 ) )
            var_1[var_1.size] = var_3;
    }

    thread maps\_utility::radio_dialogue( "afcaves_pri_taketheshot" );
    thread _id_BA0C( var_0 );
    var_5 = "";

    if ( !common_scripts\utility::flag( "road_group2_coming_back" ) )
        var_5 = level common_scripts\utility::waittill_any_return( "player_shot_someone_in_group1", "road_group2_coming_back" );

    if ( var_5 == "road_group2_coming_back" || common_scripts\utility::flag( "road_group2_coming_back" ) )
    {
        level notify( "price_shoot_abort" );
        thread _id_AD59();
    }
    else
        return;

    var_5 = level common_scripts\utility::waittill_any_return( "price_repositioned", "road_group2_alerted" );

    if ( var_5 == "price_repositioned" )
    {
        thread maps\_utility::radio_dialogue( "afcaves_pri_readytoshoot" );
        thread _id_BA0C( var_0 );
    }
    else
        return;
}

_id_AD59()
{
    thread maps\_utility::radio_dialogue( "afcaves_pri_repositioning" );
    level.price.goalradius = 96;
    var_0 = getnode( "node_price_roadspot_1", "targetname" );
    level.price setgoalnode( var_0 );
    level.price waittill( "goal" );
    level notify( "price_repositioned" );
}

_id_BA0C( var_0 )
{
    level endon( "price_shoot_abort" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isalive( var_3 ) && !var_3 maps\af_caves_code::_id_AD86() )
            var_1[var_1.size] = var_3;
    }

    foreach ( var_3 in var_0 )
    {
        if ( isalive( var_3 ) && !common_scripts\utility::array_contains( var_1, var_3 ) )
            var_1[var_1.size] = var_3;
    }

    var_0 = var_1;
    common_scripts\utility::array_thread( var_0, ::_id_BC63 );
    level waittill( "player_shot_someone_in_group2", var_7 );
    maps\af_caves_code::_id_D319();
    level.price clearenemy();

    while ( !_id_AAE7( var_0 ) )
    {
        foreach ( var_9 in var_0 )
        {
            if ( !isalive( var_9 ) )
            {
                wait 0.05;
                continue;
            }

            if ( !isalive( level.price.enemy ) )
            {
                maps\af_caves_code::_id_CD41( var_9 );
                var_9 waittill( "death" );
            }

            wait 0.5;
        }
    }
}

_id_BC63()
{
    level endon( "player_shot_someone_in_group2" );
    self waittill( "damage", var_0, var_1 );

    if ( var_1 == level.player )
        level notify( "player_shot_someone_in_group2", self );
}

_id_C740()
{
    level endon( "road_uav_inbound" );
    common_scripts\utility::flag_wait( "road_patrol_group1" );
    common_scripts\utility::flag_wait( "road_patrol_group2" );
    common_scripts\utility::flag_set( "road_patrol_cleared" );
    level.price.noslopeanimation = undefined;
    level.price _meth_8582();
    maps\af_caves_code::_id_D22A();
    wait 1.25;

    if ( !common_scripts\utility::flag( "road_player_broke_stealth" ) || common_scripts\utility::flag( "road_player_broke_stealth" ) && common_scripts\utility::flag( "road_group1_killed_without_stealthbreak" ) )
        thread maps\_utility::radio_dialogue( "afcaves_pri_muchtime" );
    else if ( !common_scripts\utility::flag( "road_group1_killed_without_stealthbreak" ) )
        maps\_utility::radio_dialogue( "afcaves_pri_nomistakes" );

    common_scripts\utility::flag_wait( "price_done_moving_to_road" );
    common_scripts\utility::flag_set( "rappel_threads" );
}

_id_C53F()
{
    common_scripts\utility::flag_wait( "price_dialogue_thermalspike" );
    maps\_utility::radio_dialogue( "pri_thermalspike" );
}

_id_D3EC()
{
    common_scripts\utility::flag_wait( "rappel_threads" );
    thread _id_ABCF();
    thread _id_AD78();
    thread _id_BE20();
    thread _id_C2E9();
    thread _id_BCF2();
    thread _id_C4EF();
    thread _id_C410();
    thread rappel_lighting();
    thread _id_C3EC();
    thread _id_BC79();
    thread _id_CA81();
    thread _id_D0D0();
    thread maps\af_caves_code::_id_C926();
}

_id_C3EC()
{
    common_scripts\utility::flag_wait( "player_hooking_up" );
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "veh_rappel_zodiac" );

    foreach ( var_2 in var_0 )
    {
        var_2.animname = "zodiac";
        var_2 maps\_utility::assign_animtree();
        var_2 setanim( var_2 maps\_utility::getanim( "bounce" ) );
    }
}

_id_ABCF()
{
    var_0 = getentarray( "guard_weapons", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 makeunusable();
        var_2 hide();
    }

    common_scripts\utility::flag_wait( "player_killing_guard" );
    wait 1.75;
    var_0 = getentarray( "guard_weapons", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 show();

    common_scripts\utility::flag_wait( "end_of_rappel_scene" );
    wait 1;
    var_0 = getentarray( "guard_weapons", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 makeusable();
}

_id_C410()
{
    common_scripts\utility::flag_wait( "price_hooksup" );
    wait 0.5;
    var_0 = getent( "player_rappel_trigger", "targetname" );
    var_0 thread common_scripts\utility::_id_AE1E( level.player, &"AF_CAVES_RAPPEL_HINT", &"AF_CAVES_RAPPEL_HINT_PC", "trigger" );

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( level.player isthrowinggrenade() )
            continue;

        if ( level.player isswitchingweapon() )
            continue;

        break;
    }

    soundscripts\_snd::snd_message( "start_plr_rappel_sequence" );
    var_0 delete();
    maps\af_caves_code::_id_BFDA();
}

_id_AD78()
{
    common_scripts\utility::flag_wait( "rappel_end" );
}

_id_BCF2()
{
    level.price allowedstances( "stand" );
    level.price maps\_utility::cqb_walk( "off" );
    level.price._id_A92B = getent( "rappel_animent", "targetname" );
    level thread _id_CC73( level.price._id_A92B );
    level.price._id_A92B maps\_anim::anim_reach_solo( level.price, "pri_rappel_setup" );
    level.price._id_A92B maps\_anim::anim_single_solo( level.price, "pri_rappel_setup" );

    if ( !common_scripts\utility::flag( "player_hooking_up" ) )
    {
        level.price._id_A92B thread maps\_anim::anim_loop_solo( level.price, "pri_rappel_idle" );
        level.price._id_A92B thread maps\_anim::anim_loop_solo( level._id_B9FA, "pri_rappel_idle" );
    }
}

_id_B889( var_0 )
{
    level._id_B9FA = maps\_utility::spawn_anim_model( "rope_price", level.price._id_A92B.origin, level.price._id_A92B.angles );
    level.price._id_A92B thread maps\_anim::anim_single_solo( level._id_B9FA, "rope_hookup" );
    common_scripts\utility::flag_set( "price_hooksup" );
}

_id_CC73( var_0 )
{
    common_scripts\utility::flag_wait( "player_hooking_up" );
    thread _id_B73C( var_0 );
    level endon( "player_killing_guard" );
    level.price maps\_utility::set_ignoreme( 1 );
    level.price maps\_utility::set_ignoreme( 1 );
    level._id_B9FA delete();
    level._id_B9FA = maps\_utility::spawn_anim_model( "rappel_rope_price", level.price._id_A92B.origin );
    var_1[0] = level.price;
    var_1[1] = level._id_B9FA;
    var_0 maps\_utility::anim_stopanimscripted();
    var_0 maps\_anim::anim_single( var_1, "pri_rappel_jump" );
    var_0 thread maps\_anim::anim_loop( var_1, "pri_hanging_idle", "stop_hang_idle" );
}

_id_B73C( var_0 )
{
    common_scripts\utility::flag_wait( "player_killing_guard" );
    wait 1;
    var_0 notify( "stop_hang_idle" );
    var_0 maps\_utility::anim_stopanimscripted();
    level.price maps\af_caves_code::_id_BD2C( "weapon_parabolic_knife", "TAG_INHAND" );
    var_0 thread maps\_anim::anim_single_solo( level.price, "pri_rappel_kill" );
}

_id_BE20()
{
    common_scripts\utility::flag_wait( "rappel_end" );
    level.player enableweapons();
    var_0 = 8;
    level.player lerpviewangleclamp( 0.5, 0.2, 0.2, var_0, var_0, var_0, var_0 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 4;
    maps\_utility::display_hint( "rappel_melee" );
}

_id_C341()
{
    self endon( "death" );
    self.battlechatter = 0;
    maps\_utility::set_ignoreall( 1 );
    maps\_utility::set_ignoreme( 1 );

    if ( self.script_noteworthy == "rappel_guard_1" )
    {
        // self setmodel( "body_shadow_co_smg_takedown" );
        // codescripts\character::setheadmodel( "head_shadow_co_c_takedown" );
        maps\_utility::forceuseweapon( "kriss_reflex", "primary" );
    }
    else if ( self.script_noteworthy == "rappel_guard_2" )
    {
        // self setmodel( "body_shadow_co_assault_takedown" );
        // codescripts\character::setheadmodel( "head_shadow_co_b_takedown" );
    }
}

_id_CD0E()
{
    level endon( "player_killing_guard" );
    var_0 = getent( "flick_animent", "targetname" );
    self.animname = "guard_2";
    wait 2.75;
    var_0 maps\_anim::anim_single_solo( self, "flick" );
    var_0 thread maps\_anim::anim_loop_solo( self, "guardB_idle", "stop_guardB_idle" );
}

_id_BF37()
{
    var_0 = getent( "rappel_animent", "targetname" );
    self.animname = "guard_2";
    common_scripts\utility::flag_wait( "player_killing_guard" );
    wait 1;
    thread maps\_utility::gun_remove();
    var_0 maps\_anim::anim_single_solo( self, "guard_2_death" );
    self.a.nodeath = 1;
    self.allowdeath = 1;
    self.diequietly = 1;
    _id_B190::_id_D55F( self );
    self kill();
}

_id_BFB2()
{
    level endon( "player_killing_guard" );
    var_0 = getent( "flick_animent", "targetname" );
    self.animname = "guard_2";
    common_scripts\utility::flag_wait( "rappel_end" );
    common_scripts\utility::flag_wait( "rappel_guards_react" );
    var_0 notify( "stop_guardB_idle" );
    var_0 thread maps\_anim::anim_single_solo( self, "guardB_react" );
}

_id_C33A()
{
    level endon( "player_killing_guard" );
    level.guard1 = self;
    var_0 = getent( "players_rappel_guard", "targetname" );
    self.animname = "guard_1";
    var_0 thread maps\_anim::anim_loop_solo( self, "guardA_idle", "stop_guardA_idle" );
    common_scripts\utility::flag_wait( "rappel_end" );
    wait 7.2;
    common_scripts\_exploder::exploder( "rappel_disturbance" );
    wait 0.5;
    common_scripts\utility::flag_set( "rappel_guards_react" );
    var_0 notify( "stop_guardA_idle" );
    var_0 thread maps\_anim::anim_single_solo( self, "guardA_react" );
    wait 2;
    thread maps\_utility::hint_fade();
    level.player enabledeathshield( 0 );
    level.player enablehealthshield( 0 );
    magicbullet( self.weapon, self gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 64.0 ) );
    wait 0.2;
    magicbullet( self.weapon, self gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 64.0 ) );
    wait 0.2;
    magicbullet( self.weapon, self gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 64.0 ) );
    wait 0.2;
    magicbullet( self.weapon, self gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 64.0 ) );
    level.player kill();
    common_scripts\utility::flag_set( "player_failed_rappel" );
}

_id_C4EF()
{
    common_scripts\utility::flag_wait( "price_hooksup" );
    wait 0.5;
    var_0 = getent( "rappel_hookup", "targetname" );
    var_0 hide();
    var_1 = getent( "rappel_hookup_glowing", "targetname" );
    var_1 show();
    common_scripts\utility::flag_wait( "player_hooking_up" );
    var_0 = getent( "rappel_hookup", "targetname" );
    var_0 show();
    var_1 = getent( "rappel_hookup_glowing", "targetname" );
    var_1 hide();
}

_id_BC79()
{
    common_scripts\utility::flag_wait( "pri_hook_up" );
    maps\_utility::flavorbursts_off( "axis" );
    maps\_utility::radio_dialogue( "pri_hookup" );
    thread maps\_utility::radio_dialogue( "afcaves_schq_d4whatsyourstatus" );
    common_scripts\utility::flag_wait( "player_hooking_up" );
    thread maps\_utility::radio_dialogue( "afcaves_schq_d4doyoucopy" );
    wait 5.5;
    thread maps\_utility::autosave_by_name( "rappeling" );
    maps\_utility::radio_dialogue_overlap( "pri_go" );
    thread maps\_utility::radio_dialogue( "afcaves_schq_badtransmitter" );
    level.price thread maps\_utility::play_sound_on_entity( "scn_afcaves_rappel_start_npc" );
    wait 5.3;
    maps\_utility::radio_dialogue( "pri_2inthechest" );
    common_scripts\utility::flag_wait( "rappel_end" );

    if ( !common_scripts\utility::flag( "player_killing_guard" ) )
    {
        var_0 = gettime() + maps\af_caves_code::_id_BB22( 4 );

        while ( gettime() < var_0 && !common_scripts\utility::flag( "player_killing_guard" ) )
            wait 0.05;
    }

    if ( !common_scripts\utility::flag( "player_killing_guard" ) )
        maps\_utility::radio_dialogue( "pri_doit" );
}

_id_C2E9()
{
    common_scripts\utility::flag_wait( "price_hooksup" );
    level endon( "player_hooking_up" );

    while ( !common_scripts\utility::flag( "player_hooking_up" ) )
    {
        wait(randomintrange( 24, 34 ));

        if ( common_scripts\utility::flag( "player_hooking_up" ) )
            break;

        maps\_utility::radio_dialogue( "pri_soaphookup" );
        wait(randomintrange( 20, 30 ));

        if ( common_scripts\utility::flag( "player_hooking_up" ) )
            break;

        maps\_utility::radio_dialogue( "pri_whatstheproblem" );
        wait(randomintrange( 20, 30 ));

        if ( common_scripts\utility::flag( "player_hooking_up" ) )
            break;

        maps\_utility::radio_dialogue( "pri_hookupletsgo" );
    }
}

_id_CA81()
{
    common_scripts\utility::flag_wait( "player_killing_guard" );
    wait 5;
    var_0 = getent( "player_rope", "targetname" );
    var_0 show();
    var_0 thread maps\af_caves_code::scripted_anim_props( "player_rope", "ropes" );
    level._id_B9FA delete();
    var_1 = getent( "soldier_rope", "targetname" );
    var_1 show();
    var_1 thread maps\af_caves_code::scripted_anim_props( "price_rope", "ropes" );
    common_scripts\utility::flag_wait( "steamroom_price_moveup_1" );
    var_0 hide();
    var_1 hide();
}

_id_D0D0()
{
    common_scripts\utility::flag_wait( "end_of_rappel_scene" );
    level.default_goalradius = 2048;
    level.price maps\_utility::disable_surprise();
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price maps\_utility::set_ignoreall( 1 );
    level.price maps\_utility::set_ignoreme( 1 );
    level.price.dontshootwhilemoving = undefined;
    level.price.baseaccuracy = 25;
}

rappel_lighting()
{
    common_scripts\utility::flag_wait( "descending" );
    maps\af_caves_lighting::_id_C7A6( "af_caves_rappel" );
    common_scripts\utility::flag_wait( "end_of_rappel_scene" );
    maps\af_caves_lighting::_id_C7A6( "af_caves_rappel_end" );
}

_id_BDBE()
{
    var_0 = getent( "backdoor_barracks_patroller_guy1", "targetname" );
    var_0 thread maps\_utility::add_spawn_function( ::_id_C09C );
    var_0 thread maps\_utility::add_spawn_function( ::_id_B1B7 );
    var_1 = getentarray( "barracks_biggroup", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_ABDC );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_B1B7 );
    thread barracks_biggroup_remove_flashlight_trigger();
    var_2 = getentarray( "barracks_center_stander", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\af_caves_code::_id_B54D );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_B1B7 );
    var_3 = getentarray( "backdoor_barracks_chess_player", "targetname" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, maps\af_caves_code::_id_B54D );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_B1B7 );
    var_4 = getent( "barracks_center_pacing_guy", "script_noteworthy" );
    var_4 thread maps\_utility::add_spawn_function( ::_id_B1B7 );
    var_5 = getent( "barracks_center_standing_fridge", "targetname" );
    var_5 thread maps\_utility::add_spawn_function( ::_id_B1B7 );
    var_6 = getentarray( "barracks_nearleft_guy", "targetname" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_CE93 );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_B1B7 );
    var_7 = getentarray( "barracks_stairguys", "targetname" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, ::_id_AF35 );
    common_scripts\utility::flag_wait( "end_of_rappel_scene" );
    thread maps\af_caves_code::animatecavelight();
    maps\_utility::flavorbursts_on( "axis" );
    level.corpse_behavior_doesnt_require_player_sight = undefined;
    thread _id_AAB4();
    thread maps\af_caves_code::_id_D26D();
    thread _id_CE68();
    thread _id_AE9C();
    thread _id_C6BE();
    thread _id_CB18();
    thread _id_B9B9();
    thread _id_BE7C();
    thread _id_B1F1();
    thread _id_D4AB();
    thread _id_D49D();
    thread maps\af_caves_code::_id_BD4D();
    thread maps\af_caves_code::barracks_tv_light2();
    thread maps\af_caves_code::_id_D260();
}

_id_B1B7()
{
    var_0 = [];
    var_0["found"] = ::_id_A957;
    maps\_stealth_utility::stealth_corpse_behavior_custom( var_0 );
    maps\_stealth_utility::stealth_pre_spotted_function_custom( ::_id_B3F7 );
    var_1 = [];
    var_1["explode"] = ::_id_A957;
    var_1["heard_scream"] = ::_id_A957;
    var_1["doFlashBanged"] = ::_id_A957;

    foreach ( var_4, var_3 in var_1 )
        maps\_stealth_event_enemy::stealth_event_mod( var_4, var_3 );

    self.a.disablelongdeath = 1;
    var_5["warning1"] = maps\_stealth_threat_enemy::enemy_alert_level_warning2;
    var_5["attack"] = ::_id_B3ED;
    maps\_stealth_utility::stealth_threat_behavior_replace( var_5 );
}

_id_B3F7()
{
    wait 0.5;
}

_id_A957( var_0 )
{
    self.favoriteenemy = level.player;
    wait 3;
    self.favoriteenemy = undefined;
}

_id_CE93()
{
    if ( !common_scripts\utility::flag( "barracks_biggroup_gone" ) )
    {
        wait 0.1;
        self notify( "end_patrol" );
        self.baseaccuracy = 500;
        maps\af_caves_code::_id_AAF7();
    }
    else
        thread _id_B101();
}

_id_B101()
{
    level endon( "_stealth_spotted" );
    level endon( "steamroom_entrance" );
    self waittill( "death" );
    var_0 = getaiarray( "axis" );
    var_0 = common_scripts\utility::get_array_of_closest( self.origin, var_0 );
    var_1 = 0;
    var_2 = 3;

    foreach ( var_4 in var_0 )
    {
        if ( isalive( var_4 ) && isdefined( var_4._stealth ) )
        {
            var_4 notify( "heard_scream", level.player.origin );
            var_1++;

            if ( var_1 >= var_2 )
                break;
        }
    }
}

_id_AAB4()
{
    maps\_utility::player_speed_percent( 90 );
    level.price maps\_utility::cqb_walk( "on" );
    level.price.moveplaybackrate = 1.2;
    level.price pushplayer( 1 );
    level.price.pathrandompercent = 0;
    level.price maps\_utility::disable_ai_color();
}

_id_C09C()
{
    self.moveplaybackrate = 1;
    self.diequietly = 1;
    level._id_CD9D = self;
    thread _id_A981();
    thread _id_C4C9();
}

_id_ABDC()
{
    self.combatmode = "no_cover";
    var_0 = self.script_parameters;

    if ( isdefined( var_0 ) )
    {
        if ( issubstr( var_0, "flashlight" ) )
            thread maps\af_caves_code::_id_C8E4();

        if ( issubstr( var_0, "handsignal" ) )
            thread _id_CC3C();

        if ( issubstr( var_0, "hallway_guard" ) )
            thread _id_C1C8();
    }

    self.interval = 60;
    thread maps\af_caves_code::_id_CC69();
    thread _id_B667();
}

_id_B667()
{
    self endon( "death" );
    common_scripts\utility::waittill_any( "enemy", "_stealth_spotted", "end_scan_when_idle" );
    self.combatmode = "cover";
}

_id_C1C8()
{
    self endon( "death" );
    self endon( "_stealth_spotted" );
    maps\_utility::ent_flag_init( "patroller_stop_cqbwalking" );
    maps\_utility::ent_flag_wait( "patroller_stop_cqbwalking" );
    self notify( "end_scan_when_idle" );
    maps\_utility::clear_generic_idle_anim();
    thread maps\_utility::disable_cqbwalk();
    self.moveplaybackrate = 1;
    maps\_patrol::set_patrol_run_anim_array();
}

_id_CC3C()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    self waittill( "goal" );
    maps\_utility::handsignal( "onme", 1, "_stealth_spotted" );
}

_id_C425()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    self waittill( "_patrol_reached_path_end" );
}

barracks_biggroup_remove_flashlight_trigger()
{
    var_0 = getent( "remove_flashlights_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isdefined( var_1.have_flashlight ) && var_1.have_flashlight )
            var_1 maps\af_caves_code::detach_flashlight();
    }
}

_id_AE9C()
{
    level endon( "_stealth_spotted" );
    thread _id_C7DD();
    thread maps\af_caves_aud::aud_chess_soldiers_barracks();
    thread maps\_utility::radio_dialogue( "pri_letsgo" );
    common_scripts\utility::flag_set( "barracks_follow_price" );
    thread maps\_utility::autosave_stealth();
    thread maps\af_caves_code::_id_C6F7( "node_backdoor_start_price" );
    common_scripts\utility::flag_wait( "player_entered_barracks_backdoor_hallway" );
    thread maps\af_caves_code::_id_C6F7( "node_backdoor_midpoint_price" );
    common_scripts\utility::flag_wait( "backdoor_hallway_midpoint" );
    _id_A953();
    setsaveddvar( "aim_aimAssistRangeScale", "0" );
    thread _id_AD53();
    thread maps\af_caves_code::_id_C6F7( "price_easynow_node" );
    thread maps\_utility::activate_trigger_with_targetname( "spawn_patroller_guy1" );
    thread maps\_utility::radio_dialogue( "afcaves_pri_tangoupahead" );
    common_scripts\utility::flag_wait_any( "backdoor_firstpatroller_idlespot_reached", "backdoor_firstpatroller_deathflag" );

    if ( !common_scripts\utility::flag( "backdoor_firstpatroller_deathflag" ) )
    {
        common_scripts\utility::flag_wait( "barracks_price_ready_to_dodge_biggroup" );
        common_scripts\utility::flag_wait( "backdoor_hallway_biggroup" );
    }

    if ( common_scripts\utility::flag( "backdoor_firstpatroller_deathflag" ) )
        wait 1;

    thread maps\_utility::radio_dialogue( "afcaves_pri_patrolcoming" );
    soundscripts\_snd::snd_message( "aud_start_patrol_mix" );
    thread maps\af_caves_code::_id_C6F7( "node_barracks_price_biggroup_spotted" );

    if ( common_scripts\utility::flag( "backdoor_firstpatroller_deathflag" ) )
    {
        var_0 = getentarray( "barracks_biggroup", "targetname" );
        common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_D023 );
        thread maps\_utility::radio_dialogue( "afcaves_pri_guardsknow" );
    }

    thread maps\_utility::activate_trigger_with_targetname( "trig_barracks_biggroup_spawn" );
    var_1 = level.price.moveplaybackrate;
    level.price.moveplaybackrate = 1;
    level.price maps\_utility::cqb_walk( "off" );
    level.price.neverenablecqb = 1;
    level.price common_scripts\utility::waittill_any_timeout( 7.5, "goal" );
    wait 3.5;
    common_scripts\utility::flag_set( "barracks_biggroup_passingby" );

    if ( !common_scripts\utility::flag( "backdoor_firstpatroller_deathflag" ) )
    {
        maps\_utility::radio_dialogue( "afcaves_pri_letthempass" );
        thread _id_D171();
    }

    thread _id_AAA3();
    common_scripts\utility::flag_wait( "barracks_biggroup_gone" );
    soundscripts\_snd::snd_message( "aud_stop_patrol_mix" );
    _id_BC25();
    var_2 = 0;

    if ( !common_scripts\utility::flag( "backdoor_firstpatroller_deathflag" ) && !common_scripts\utility::flag( "backdoor_firstpatroller_left_idle_area" ) )
    {
        var_2 = 1;
        level._id_CD9D.health = 5;
        thread maps\_utility::radio_dialogue( "afcaves_pri_havingasmoke" );
    }

    var_3 = common_scripts\utility::flag_wait_any_return( "backdoor_firstpatroller_deathflag", "backdoor_firstpatroller_left_idle_area" );
    level notify( "barracks_firstpatroller_catch_player_abort" );
    _id_BC25();

    if ( var_2 && var_3 == "backdoor_firstpatroller_deathflag" )
    {
        maps\_utility::radio_dialogue_stop();
        wait 0.35;
        thread maps\_utility::radio_dialogue( "pri_goodnight" );
        wait 1;
    }

    thread maps\_utility::autosave_stealth();
    setsaveddvar( "aim_aimAssistRangeScale", "1" );
    thread maps\_utility::radio_dialogue( "pri_letsgo" );
    thread _id_C105();
    level.price.moveplaybackrate = 1;
    level.price maps\_utility::cqb_walk( "on" );
    level.price.neverenablecqb = 0;
    level.price allowedstances( "prone", "crouch", "stand" );

    if ( !common_scripts\utility::flag( "player_near_price_shuffle_start" ) && !common_scripts\utility::flag( "player_near_price_at_broken_wall" ) )
    {
        thread maps\af_caves_code::_id_C6F7( "price_smoker_node" );
        common_scripts\utility::flag_wait_any( "player_near_price_shuffle_start", "player_near_price_at_broken_wall" );
    }

    thread maps\af_caves_code::_id_C6F7( "node_price_shuffle_start" );
    level.price waittill( "goal" );
    common_scripts\utility::flag_wait( "player_near_price_shuffle_start" );

    if ( distance( level.player.origin, level.price.origin ) <= 256 )
        maps\_utility::delaythread( 0.5, maps\_utility::radio_dialogue, "afcaves_pri_easynow" );

    if ( !common_scripts\utility::flag( "barracks_player_near_stair_shooting_spot" ) )
    {
        var_4 = getnode( "node_price_barracks_near_center_2", "targetname" );
        level.price._id_CC9A = var_4;
        level.price animcustom( maps\af_caves_code::_id_B8A5 );
        level.price waittill( "scripted_shuffle_done" );
    }

    thread _id_D04C();
    thread maps\af_caves_code::_id_C6F7( "price_going_left_node" );
    common_scripts\utility::flag_wait( "price_dialogue_stayleft" );

    if ( !common_scripts\utility::flag( "nearleft_guys_turnaround" ) )
    {
        var_4 = getnode( "price_going_left_node", "targetname" );
        maps\af_caves_code::_id_B853( 240, var_4 );
    }

    thread maps\af_caves_code::_id_C6F7( "node_barracks_price_countdown_kill" );
    common_scripts\utility::flag_wait( "barracks_player_near_stair_shooting_spot" );
    thread maps\_utility::autosave_stealth();
    thread _id_AEDC();
    common_scripts\utility::flag_wait_any( "barracks_stairguys_countdown_kill_done", "barracks_stairguys_countdown_kill_aborted" );
    _id_BC25();
    level.price pushplayer( 1 );
    thread maps\af_caves_code::_id_C6F7( "node_barracks_price_before_stairs" );

    if ( !common_scripts\utility::flag( "barracks_player_past_price_near_steamroomdoor_spot" ) )
    {
        var_4 = getnode( "node_barracks_price_before_stairs", "targetname" );
        maps\af_caves_code::_id_B853( 240, var_4 );
    }

    common_scripts\utility::flag_set( "steamroom_start" );
}

_id_A981()
{
    self endon( "death" );
    self.animname = "generic";
    level.player thread maps\_utility::_id_C92C( [ self ], "barracks_stealth_takedown", 140, 80, 90, 0, 0.25, ::_id_AAFC, undefined, "weapon_parabolic_knife", undefined, undefined, undefined, undefined, 5 );
    self waittill( "stealth_takedown_started" );
    childthread animation_dof_tv_takedown();
    self notify( "end_patrol" );
    self notify( "pain_death" );
    common_scripts\utility::flag_set( "backdoor_firstpatroller_deathflag" );
}

animation_dof_tv_takedown()
{
    waitframe();
    var_0 = _id_D397::_id_A97A( "stealth_takedown" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 5.6, -1, 8, 8 ) _id_D397::_id_CCA7( level.player._id_C309, "tag_dof" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 2.6 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.65 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.0 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.15 ) _id_D397::_id_B85E( 0.12, 0.6, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.2 );
    var_0 _id_D397::_id_BEA0( 1.85 ) _id_D397::_id_B85E( 0.12, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.35 );
    var_0 _id_D397::_id_BC26();
}

_id_AAFC( var_0 )
{
    var_1 = spawnstruct();
    var_1.origin = var_0[0].origin;
    var_1.angles = var_0[0].angles;
    return var_1;
}

_id_C4C9()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    level endon( "barracks_firstpatroller_catch_player_abort" );
    common_scripts\utility::flag_wait( "player_near_price_shuffle_start" );

    if ( isalive( self ) )
    {
        self.health = 150;
        self.favoriteenemy = level.player;
    }
}

_id_D023()
{
    wait 0.1;
    self notify( "heard_scream", level.player.origin );
}

_id_BC25()
{
    if ( !maps\_stealth_utility::stealth_is_everything_normal() )
    {
        thread maps\_utility::radio_dialogue( "afcaves_pri_guardsknow" );

        while ( !maps\_stealth_utility::stealth_is_everything_normal() )
            wait 0.05;
    }
}

_id_C105()
{
    level endon( "steamroom_start" );
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "price_dialogue_stayleft" );
    maps\_utility::radio_dialogue( "afcaves_pri_incorridor" );
    thread _id_B758();
}

_id_C7DD()
{
    level endon( "steamroom_start" );
    level endon( "_stealth_spotted" );
    var_0 = getent( "trig_script_color_alies_r18", "targetname" );

    for (;;)
    {
        while ( !maps\_stealth_utility::stealth_is_everything_normal() )
            wait 0.05;

        wait 0.1;
        var_0 waittill( "trigger", var_1 );

        if ( !isplayer( var_1 ) )
            continue;

        if ( !maps\_stealth_utility::stealth_is_everything_normal() )
            continue;

        maps\_utility::radio_dialogue( "afcaves_pri_avoidbeingspotted" );
        break;
    }
}

_id_A953()
{
    maps\_stealth_utility::stealth_ai_event_dist_default();
    var_0 = [];
    var_0["ai_eventDistDeath"]["hidden"] = 256;
    var_0["ai_eventDistFootstepSprint"]["hidden"] = 100;
    var_0["ai_eventDistFootstep"] = [];
    var_0["ai_eventDistFootstep"]["spotted"] = 300;
    var_0["ai_eventDistFootstep"]["hidden"] = 100;
    var_0["ai_eventDistFootstepWalk"] = [];
    var_0["ai_eventDistFootstepWalk"]["spotted"] = 300;
    var_0["ai_eventDistFootstepWalk"]["hidden"] = 100;
    thread maps\_stealth_utility::stealth_ai_event_dist_custom( var_0 );
    var_1 = [];
    var_1["prone"] = 300;
    var_1["crouch"] = 600;
    var_1["stand"] = 600;
    maps\_stealth_utility::stealth_detect_ranges_set( var_1 );
    var_2 = [];
    var_2["player_dist"] = 725;
    var_2["sight_dist"] = 400;
    maps\_stealth_utility::stealth_corpse_ranges_custom( var_2 );
    level.corpse_behavior_doesnt_require_player_sight = 1;
    level.corpse_behavior_require_distance_check_only = 1;
}

_id_AD53()
{
    level waittill( "price_at_node" );
    wait 1;
    common_scripts\utility::flag_set( "barracks_price_ready_to_dodge_biggroup" );
}

_id_D04C()
{
    level endon( "steamroom_start" );
    level endon( "barracks_player_near_stair_shooting_spot" );
    common_scripts\utility::flag_wait_all( "barracks_nearleft_patroller_comingback", "barracks_player_farleft_back_area" );
    maps\_utility::radio_dialogue( "afcaves_pri_tangosonsix" );
}

_id_B758()
{
    maps\_utility::flavorbursts_off( "axis" );

    if ( !common_scripts\utility::flag( "nearleft_guys_turnaround" ) )
    {
        maps\_utility::radio_dialogue( "afcaves_schq_sitrep" );
        wait 2;
    }

    if ( !common_scripts\utility::flag( "nearleft_guys_turnaround" ) )
        maps\_utility::radio_dialogue( "afcaves_schq_sitrepover" );

    common_scripts\utility::flag_wait( "barracks_stairguys_countdown_kill_done" );
    maps\_utility::flavorbursts_on( "axis" );
}

_id_AEDC()
{
    if ( distance2d( level.player.origin, level.price.origin ) > 670 )
    {
        level.price notify( "stop_going_to_node" );
        level.price thread _id_C713();
        var_0 = ( 5184.0, 11394.0, -3735.0 );
        var_1 = ( 0.0, 20.7, 0.0 );
        level.price forceteleport( var_0, var_1 );
        thread maps\af_caves_code::_id_C6F7( "node_barracks_price_countdown_kill" );
        level.price thread _id_CA7D();
    }

    var_2 = getentarray( "barracks_stairguys", "targetname" );
    var_3 = maps\af_caves_code::_id_B911( var_2, 1 );
    common_scripts\utility::flag_set( "barracks_stairguys_spawned" );
    var_4 = undefined;
    var_5 = undefined;

    foreach ( var_7 in var_3 )
    {
        if ( var_7.script_parameters == "left" )
        {
            var_4 = var_7;
            continue;
        }

        var_5 = var_7;
    }

    level endon( "_stealth_spotted" );
    thread _id_CBF7();
    level._id_C4B7 = undefined;
    level.player._id_C571 = 0;
    common_scripts\utility::array_thread( var_3, ::_id_B3DE, var_4 );
    thread _id_CE46();
    var_9 = level common_scripts\utility::waittill_any_return( "player_shot_someone_on_stairs", "barracks_stairguys_countdown_dialogue_done" );
    var_10 = 0;

    if ( isdefined( var_9 ) && var_9 == "barracks_stairguys_countdown_dialogue_done" )
        var_10 = 1;

    if ( isdefined( level._id_C4B7 ) && !level._id_C4B7 )
    {
        var_11 = var_5;
        var_5 = var_4;
        var_4 = var_11;
    }

    level.price.ignoreall = 0;
    maps\af_caves_code::_id_D319();
    level.price clearenemy();

    if ( isalive( var_5 ) )
    {
        maps\af_caves_code::_id_CD41( var_5 );
        var_5 waittill( "death" );
    }

    if ( isalive( var_4 ) )
        var_4 thread playervictim_killfailsetup();

    common_scripts\utility::flag_wait( "barracks_stairguys_deathflag" );
    wait 1;
    var_12 = 0;

    if ( !common_scripts\utility::flag( "barracks_stairguys_countdown_kill_aborted" ) )
    {
        if ( level.player._id_C571 == 2 )
            maps\_utility::radio_dialogue( "afcaves_pri_impressive" );
        else if ( isdefined( level._id_C4B7 ) && !level._id_C4B7 )
        {
            maps\_utility::radio_dialogue( "afcaves_pri_closeenough" );
            var_12 = 1;
        }
    }
    else
        var_12 = 1;

    if ( var_12 )
        thread maps\_utility::radio_dialogue( "afcaves_pri_move2" );
    else
        thread maps\_utility::radio_dialogue( "afcaves_pri_cleargo" );

    maps\af_caves_code::_id_D22A();
    common_scripts\utility::flag_set( "barracks_stairguys_countdown_kill_done" );
}

playervictim_killfailsetup()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "barracks_stairguys_countdown_dialogue_done" );
    wait 1.0;
    maps\_utility::disable_cqbwalk();
    self notify( "end_patrol" );
    self.favoriteenemy = level.player;
}

_id_C713()
{
    self endon( "goal" );
    level waittill( "_stealth_spotted" );
    self notify( "level_stealth_spotted" );
}

_id_CA7D()
{
    var_0 = self.moveplaybackrate;
    self.moveplaybackrate = 1.3;
    common_scripts\utility::waittill_any( "goal", "level_stealth_spotted" );
    self.moveplaybackrate = var_0;
}

_id_CBF7()
{
    level endon( "barracks_stairguys_countdown_kill_done" );
    level waittill( "_stealth_spotted" );
    common_scripts\utility::flag_set( "barracks_stairguys_countdown_kill_aborted" );
}

_id_B3DE( var_0 )
{
    self waittill( "damage", var_1, var_2 );

    if ( var_2 == level.player )
    {
        level._id_C4B7 = 0;

        if ( self == var_0 )
            level._id_C4B7 = 1;

        level.player._id_C571++;
        level notify( "player_shot_someone_on_stairs" );
    }
}

_id_CE46()
{
    level endon( "_stealth_spotted" );
    level endon( "player_shot_someone_on_stairs" );
    level endon( "barracks_stairguys_countdown_aborted" );
    maps\_utility::radio_dialogue( "afcaves_pri_tangoswithtaclights" );
    maps\_utility::radio_dialogue( "afcaves_pri_takeoneright" );
    maps\_utility::radio_dialogue( "afcaves_pri_three" );
    maps\_utility::radio_dialogue( "afcaves_pri_two" );
    maps\_utility::radio_dialogue( "afcaves_pri_one" );
    maps\_utility::radio_dialogue( "afcaves_pri_mark" );
    wait 0.5;
    common_scripts\utility::flag_set( "barracks_stairguys_countdown_dialogue_done" );
}

_id_AF35()
{
    thread maps\af_caves_code::_id_C8E4();
    self.interval = 60;
    thread maps\af_caves_code::_id_CC69();
    self.health = 5;
    self.moveplaybackrate = 0.75;
    thread _id_B05C();
}

_id_B05C()
{
    self endon( "death" );
    var_0 = getent( "trig_barracks_stairguy_seeprice", "targetname" );

    while ( !var_0 istouching( self ) )
        wait 0.05;

    self.favoriteenemy = level.player;
}

_id_D171()
{
    level endon( "_stealth_spotted" );
    maps\_utility::flavorbursts_off( "axis" );
    maps\_utility::radio_dialogue( "afcaves_schq_lostcontact2" );
    maps\_utility::radio_dialogue( "afcaves_schq_badtransmitter2" );
    maps\_utility::radio_dialogue( "afcaves_schq_sendateam2" );
    maps\_utility::radio_dialogue( "afcaves_sc2_sendvinson" );
    maps\_utility::flavorbursts_on( "axis" );
}

_id_AAA3()
{
    var_0 = getent( "trig_barracks_biggroup_pathstart_area", "targetname" );
    var_1 = "barracks_biggroup";

    for ( var_2 = []; !var_2.size; var_2 = maps\_utility::get_ai_group_ai( var_1 ) )
        wait 0.1;

    while ( var_2.size )
    {
        var_2 = maps\_utility::get_ai_group_ai( var_1 );
        var_3 = 0;

        foreach ( var_5 in var_2 )
        {
            if ( var_5 istouching( var_0 ) )
            {
                var_3 = 1;
                break;
            }
        }

        if ( !var_3 )
            break;
        else
            wait 0.05;
    }

    common_scripts\utility::flag_set( "barracks_biggroup_gone" );
    level.corpse_behavior_doesnt_require_player_sight = undefined;
    level.corpse_behavior_require_distance_check_only = undefined;
}

_id_C6BE()
{
    level endon( "steamroom_start" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_set( "barracks_stealth_broken" );
    setsaveddvar( "aim_aimAssistRangeScale", "1" );
    maps\af_caves_code::_id_D339( "trig_barracks_centergroup_walker_spawn" );
    maps\af_caves_code::_id_D339( "trig_barracks_nearleft_guys_spawn" );
    maps\af_caves_code::_id_D339( "spawn_patroller_guy1" );
    level.price.ignoreall = 0;
    level.price.dontevershoot = undefined;
    level.price.maxsightdistsqrd = level._id_B074;
    level.price.baseaccuracy = 50;
    wait 2;
    thread _id_B633();
    var_0 = getaiarray( "axis" );
    var_1 = common_scripts\utility::get_array_of_closest( level.player.origin, var_0 );

    foreach ( var_3 in var_0 )
    {
        if ( isalive( var_3 ) && isdefined( var_3._stealth ) )
        {
            wait 0.5;
            var_3 notify( "heard_scream", level.player.origin );
            break;
        }
    }

    thread _id_D271();
    thread _id_C2F4();
    thread _id_C89E();
    common_scripts\utility::flag_wait_all( "backdoor_firstpatroller_deathflag", "barracks_centergroup_deathflag", "barracks_nearleft_guys_deathflag" );

    if ( !common_scripts\utility::flag( "player_at_stairs_before_steamroom" ) )
        thread maps\af_caves_code::_id_C6F7( "node_barracks_stealthbreak_price_nearexit" );

    common_scripts\utility::flag_wait( "barracks_steamroom_defenders_deathflag" );
    common_scripts\utility::flag_set( "barracks_stealthbreak_survived" );
    maps\_utility::radio_dialogue( "pri_keepmoving" );
    var_5 = getent( "steamroom_price", "targetname" );
    level.price notify( "price_goto_node" );
    level.price setgoalpos( maps\_utility::groundpos( var_5.origin ) );
    thread maps\_utility::autosave_by_name( "barracks_stealthbreak_survived" );
    common_scripts\utility::flag_set( "steamroom_start" );
}

_id_B633()
{
    var_0 = getentarray( "barracks_steamroom_defenders", "targetname" );

    if ( !common_scripts\utility::flag( "player_pre_steamroom_stairs" ) )
        var_1 = maps\af_caves_code::_id_B911( var_0 );
    else
        common_scripts\utility::array_call( var_0, ::delete );
}

_id_D271()
{
    level endon( "barracks_stealthbreak_survived" );
    var_0 = getent( "trig_player_on_backdoor_ledge", "targetname" );
    var_1 = gettime() + 5000;
    var_2 = gettime() + 12000;
    var_3 = 0;

    for (;;)
    {
        var_0 waittill( "trigger", var_4 );

        if ( !isplayer( var_4 ) )
        {
            wait 0.05;
            continue;
        }

        while ( level.player istouching( var_0 ) && !common_scripts\utility::flag( "barracks_stealthbreak_survived" ) && gettime() < var_1 )
            wait 0.05;

        if ( !level.player istouching( var_0 ) || common_scripts\utility::flag( "barracks_stealthbreak_survived" ) )
        {
            wait 0.05;
            continue;
        }

        if ( !var_3 )
        {
            maps\_utility::radio_dialogue( "afcaves_pri_getbackhere" );
            var_3 = 1;
        }

        while ( level.player istouching( var_0 ) && !common_scripts\utility::flag( "barracks_stealthbreak_survived" ) && gettime() < var_2 )
            wait 0.05;

        if ( !level.player istouching( var_0 ) || common_scripts\utility::flag( "barracks_stealthbreak_survived" ) )
        {
            wait 0.05;
            continue;
        }

        setdvar( "ui_deadquote", "@AF_CAVES_DEADQUOTE_ABANDONED_PRICE" );
        maps\_utility::missionfailedwrapper();
    }
}

_id_C2F4()
{
    level endon( "_stealth_normal" );
    level endon( "steamroom_start" );
    wait 20;
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_0, maps\af_caves_code::_id_D2EE );
    common_scripts\utility::array_thread( var_0, maps\af_caves_code::_id_AAF7 );
}

_id_C89E()
{
    var_0 = 3;
    var_1 = getaiarray( "axis" );

    while ( var_1.size > var_0 && !common_scripts\utility::flag( "player_at_stairs_before_steamroom" ) )
    {
        wait 0.1;
        var_1 = getaiarray( "axis" );
        var_1 = maps\_utility::array_removedead( var_1 );
        var_1 = common_scripts\utility::array_removeundefined( var_1 );
        var_2 = 0;

        foreach ( var_4 in var_1 )
        {
            if ( !isalive( var_4 ) )
                continue;

            if ( var_4 maps\_utility::doinglongdeath() )
                continue;

            var_2++;
        }

        if ( var_2 <= var_0 )
            break;
    }

    var_1 = maps\_utility::array_removedead( var_1 );
    var_1 = common_scripts\utility::array_removeundefined( var_1 );
    common_scripts\utility::array_thread( var_1, ::_id_C8D6 );
    common_scripts\utility::array_thread( var_1, ::_id_AA4C );
}

_id_AA4C()
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    var_0 = 65536;

    while ( maps\_utility::_id_D325( self.origin + ( 0.0, 0.0, 48.0 ), undefined, 1 ) || distancesquared( level.player.origin, self.origin ) <= var_0 )
    {
        if ( !common_scripts\utility::flag( "steamroom_entrance" ) )
        {
            wait(randomfloatrange( 0.5, 2 ));
            continue;
        }

        wait 0.05;
    }

    if ( !common_scripts\utility::flag( "steamroom_entrance" ) )
    {
        self.diequietly = 1;
        self kill();
    }
    else
        self delete();
}

_id_CB18()
{
    level endon( "steamroom_start" );
    level.player endon( "death" );
    var_0 = [];
    var_0[0] = "afcaves_pri_ontousgoloud";
    var_0[1] = "afcaves_pri_compromisedgoloud";
    var_1 = [];
    var_1[0] = "afcaves_pri_gotlucky";
    var_1[1] = "afcaves_pri_thatwasclose";

    while ( !common_scripts\utility::flag( "steamroom_start" ) )
    {
        common_scripts\utility::flag_wait( "_stealth_spotted" );
        _id_CB83();

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        {
            maps\_utility::radio_dialogue( common_scripts\utility::random( var_0 ) );
            common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        }

        if ( level.player.health > 0 )
            maps\_utility::radio_dialogue( common_scripts\utility::random( var_1 ) );
    }
}

_id_CB83()
{
    var_0 = [];
    var_0[0] = "afcaves_sc1_iseehim";
    var_0[1] = "afcaves_sc1_spotted";
    var_0[2] = "afcaves_sc1_hostilemyloc";
    maps\_utility::radio_dialogue_stop();
    var_1 = getaiarray( "axis" );
    var_2 = common_scripts\utility::get_array_of_closest( level.player.origin, var_1 );

    foreach ( var_4 in var_1 )
    {
        if ( isalive( var_4 ) && isdefined( var_4._stealth ) )
        {
            var_4 thread maps\_utility::radio_dialogue( common_scripts\utility::random( var_0 ) );
            wait 0.05;
            break;
        }
    }
}

_id_B9B9()
{
    maps\_utility::activate_trigger_with_targetname( "trig_backdoor_barracks_center_group_spawn" );
}

_id_B1F1()
{
    var_0 = getent( "barracks_center_standing_fridge", "targetname" );
    var_1 = var_0 maps\_utility::spawn_ai();
    var_1.ignoreall = 1;
    var_1 endon( "death" );
    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 maps\_stealth_utility::stealth_ai_idle_and_react( var_1, "fridge_idle", "fridge_react" );

    if ( isalive( var_1 ) )
        var_1.ignoreall = 0;
}

_id_BE7C()
{
    var_0 = maps\_utility::_id_CC1D( "chess_guy_1" );
    var_1 = maps\_utility::_id_CC1D( "chess_guy_2" );
    var_2 = [];
    var_2[var_2.size] = var_0;
    var_2[var_2.size] = var_1;
    var_0.animname = "chess_guy1";
    var_1.animname = "chess_guy2";
    var_0.deathanim = var_0 maps\_utility::getanim( "chess_death_1" );
    var_1.deathanim = var_1 maps\_utility::getanim( "chess_death_2" );
    common_scripts\utility::array_thread( var_2, ::_id_AC7D, "chess_players_broken" );
    common_scripts\utility::array_thread( var_2, maps\_utility::set_allowdeath, 1 );
    var_3 = getent( "chess_ent", "targetname" );
    var_4 = spawn( "script_origin", var_3.origin );
    var_4.angles = var_3.angles;
    var_3 thread maps\_stealth_utility::stealth_ai_idle_and_react( var_0, "chess_idle_1", "chess_surprise_1" );
    var_4 thread maps\_stealth_utility::stealth_ai_idle_and_react( var_1, "chess_idle_2", "chess_surprise_2" );
    common_scripts\utility::array_thread( var_2, ::_id_B70B );
}

_id_AC7D( var_0 )
{
    self endon( "death" );
    level endon( var_0 );
    maps\_utility::ent_flag_waitopen( "_stealth_normal" );
    level notify( var_0 );
}

_id_B70B()
{
    maps\_stealth_utility::stealth_enemy_waittill_alert();
    thread maps\_stealth_shared_utilities::enemy_announce_spotted_bring_group( level.player.origin );
    maps\_utility::set_ignoreall( 0 );
    self.deathanim = undefined;
}

_id_D49D()
{
    var_0 = getent( "radio_backdoor_emitter", "targetname" );
    var_1 = "mus_emt_afcaves_radio_music1";
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( var_1 );
    maps\_utility::trigger_wait_targetname( "trig_radio_damage_backdoor" );
    var_0 common_scripts\utility::stop_loop_sound_on_entity( var_1 );
    var_0 delete();
}

_id_D4AB()
{
    common_scripts\utility::flag_wait( "steamroom_entrance" );
    _id_B92D();
}

_id_B92D()
{
    var_0 = [];
    var_0 = maps\_utility::get_ai_group_ai( "backdoor_firstpatroller" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_ai_group_ai( "barracks_centergroup" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_ai_group_ai( "barracks_biggroup" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_ai_group_ai( "barracks_nearleft_guys" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_ai_group_ai( "barracks_stairguys" ) );

    if ( !var_0.size )
        return;

    thread maps\_utility::ai_delete_when_out_of_sight( var_0, 256 );
}

_id_B721()
{
    thread _id_C249();
    common_scripts\utility::flag_wait( "steamroom_start" );

    if ( !common_scripts\utility::flag( "barracks_stealth_broken" ) && !common_scripts\utility::flag( "player_pre_steamroom_stairs" ) )
    {
        thread _id_B74D();
        thread _id_B083();
    }

    thread _id_ACD8();
    thread _id_BD62();
}

_id_C249()
{
    common_scripts\utility::flag_wait( "player_at_stairs_before_steamroom" );
    common_scripts\_exploder::exploder( "steamroom_steamclouds" );
    common_scripts\_exploder::exploder( "steamroom_steamclouds_grp_01" );
    common_scripts\_exploder::exploder( "steamroom_steamclouds_grp_02" );
    thread _id_D09F();
    thread _id_B21B();
}

_id_C2BB()
{
    var_0 = 9200;
    var_1 = 512;

    for (;;)
    {
        wait 0.05;

        if ( level.player.origin[1] > var_0 )
            continue;

        if ( level.price.origin[1] > var_0 )
            continue;

        break;
    }

    level._id_B686 playsound( "gate_iron_open" );
    level._id_B686 movez( -84, 2 );
    var_2 = getent( "steamroom_door_closed_col", "targetname" );
    var_2 solid();
    var_2 disconnectpaths();
}

_id_B21B()
{
    var_0 = getent( "smodel_steamroom_c4_plant", "targetname" );
    var_0 hide();
}

_id_ACD8()
{
    level.price maps\_utility::disable_ai_color();
    maps\af_caves_code::_id_D22A();
    common_scripts\utility::flag_wait( "steamroom_door_blown" );
    level.price maps\_utility::cqb_walk( "off" );
    level.price.neverenablecqb = 1;
    level.price thread maps\af_caves_code::_id_CD02( "masada_eotech" );
}

_id_BD62()
{
    thread _id_AA5A();
    thread _id_B064();
    thread _id_D595();
    common_scripts\utility::flag_wait( "steamroom_going_dark" );
    thread _id_B86E();
    common_scripts\utility::flag_wait( "steamroom_price_moveup_2" );
    thread maps\_utility::autosave_by_name( "barracks_doorbreach" );
    _id_D544();
    thread _id_B594();
    maps\af_caves_lighting::_id_C7A6( "af_caves_steamroom_breach" );
    thread steamroom_exit_light();
    maps\_utility::delaythread( 2, ::_id_C592 );
    common_scripts\utility::flag_wait_any( "steamroom_ambush_started", "steamroom_player_spotted" );

    if ( !common_scripts\utility::flag( "steamroom_ambush_started" ) )
        common_scripts\utility::flag_set( "steamroom_ambush_started" );

    thread maps\af_caves_code::_id_C9CF();
    thread _id_AE05();
    thread _id_B2C4();
    thread _id_BEE6();
    common_scripts\utility::flag_wait_all( "steamroom_patrollers_deathflag", "steamroom_patrollers_group2_deathflag" );

    if ( !common_scripts\utility::flag( "player_clear_steamroom" ) )
        thread maps\af_caves_code::_id_C6F7( "node_steamroom_price_near_door" );

    common_scripts\utility::flag_wait( "steamroom_patrollers_doorguard_deathflag" );
    thread _id_CE4C();
    common_scripts\utility::flag_set( "steamroom_ambush_done" );

    if ( !common_scripts\utility::flag( "player_clear_steamroom" ) )
        maps\af_caves_code::_id_C55E( "node_steamroom_price_exit_bodyup", 320 );

    common_scripts\utility::flag_set( "steamroom_done" );
}

_id_B2C4()
{
    maps\_utility::trigger_wait_targetname( "trig_steamroom_near_door" );
    common_scripts\utility::flag_set( "steamroom_patrollers_protect_door" );
}

_id_BEE6()
{
    var_0 = 3;
    common_scripts\utility::flag_wait( "steamroom_door_blown" );
    wait 1;
    var_1 = getaiarray( "axis" );

    while ( var_1.size > var_0 && !common_scripts\utility::flag( "steamroom_exit" ) )
    {
        wait 0.1;
        var_1 = getaiarray( "axis" );
        var_1 = maps\_utility::array_removedead( var_1 );
        var_1 = common_scripts\utility::array_removeundefined( var_1 );
        var_2 = 0;

        foreach ( var_4 in var_1 )
        {
            if ( !isalive( var_4 ) )
                continue;

            if ( var_4 maps\_utility::doinglongdeath() )
                continue;

            var_2++;
        }

        if ( var_2 <= var_0 )
            break;
    }

    var_1 = maps\_utility::array_removedead( var_1 );
    var_1 = common_scripts\utility::array_removeundefined( var_1 );
    common_scripts\utility::array_thread( var_1, ::_id_C8D6 );
    common_scripts\utility::array_thread( var_1, ::_id_C6B1 );
}

_id_C8D6()
{
    if ( !isalive( self ) )
        return;

    self.health = 1;
    self.attackeraccuracy = 1;
}

_id_C6B1()
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    var_0 = 65536;

    while ( maps\_utility::_id_D325( self.origin + ( 0.0, 0.0, 48.0 ), undefined, 1 ) || distancesquared( level.player.origin, self.origin ) <= var_0 )
    {
        if ( !common_scripts\utility::flag( "steamroom_exit" ) )
        {
            wait(randomfloatrange( 0.5, 2 ));
            continue;
        }

        wait 0.05;
    }

    if ( !common_scripts\utility::flag( "steamroom_exit" ) )
    {
        self.diequietly = 1;
        self kill();
    }
    else
        self delete();
}

_id_AE05()
{
    level.price.ignoreall = 0;
    level.price.dontevershoot = undefined;
    level.price.baseaccuracy = 2;
    level.price.maxsightdistsqrd = level._id_B074;
    level.price.ignoresuppression = 1;
    level.price.ignoreme = 1;
    common_scripts\utility::flag_wait_or_timeout( "steamroom_ambush_done", 5 );
    level.price.ignoresuppression = 0;
    level.price.ignoreme = 0;

    if ( !common_scripts\utility::flag( "steamroom_ambush_done" ) )
        level.price thread maps\_utility::enable_ai_color();

    common_scripts\utility::flag_wait( "steamroom_ambush_done" );
    level.price maps\_utility::disable_ai_color();
    var_0 = getentarray( "trig_steamroom_allies_color", "script_noteworthy" );
    common_scripts\utility::array_call( var_0, ::delete );
}

_id_CA52()
{
    common_scripts\utility::flag_wait( "price_at_steamroom_stairs" );
    level.price maps\_utility::cqb_walk( "on" );
}

_id_B064()
{
    level endon( "steamroom_ambush_started" );
    thread _id_CA52();

    if ( !common_scripts\utility::flag( "barracks_stealth_broken" ) && !common_scripts\utility::flag( "player_pre_steamroom_stairs" ) )
    {
        common_scripts\utility::flag_set( "steamroom_price_knifekill_sequencestart" );
        common_scripts\utility::flag_wait( "steamroom_price_knifekill_done" );
    }

    thread maps\af_caves_code::_id_C6F7( "node_steamroom_price_1" );
    common_scripts\utility::flag_wait( "steamroom_price_moveup_1" );
    thread maps\af_caves_code::_id_C6F7( "node_steamroom_price_2" );
    common_scripts\utility::flag_wait( "steamroom_price_moveup_2" );
    thread maps\af_caves_code::_id_C6F7( "node_steamroom_price_3" );
}

_id_D544()
{
    if ( level.price.origin[1] < 9750 )
        return;

    var_0 = maps\_utility::groundpos( ( 4563.0, 9222.0, -3565.0 ) );
    var_1 = ( 5207.0, 9566.0, -3499.0 );
    level.price notify( "scripted_teleport" );
    level.price forceteleport( var_0, var_1 );
}

_id_B74D()
{
    var_0 = getent( "steamroom_price_stealthkill_animref", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = var_1 maps\_utility::spawn_ai( 1 );
    var_2.ignoreme = 0;
    var_2.ignoreall = 1;
    var_2.allowdeath = 0;
    var_2.grenadeammo = 0;
    var_2 animmode( "gravity" );
    var_2 setgoalpos( var_2.origin );
    level._id_C569 = var_0;
    level._id_B733 = var_2;
    common_scripts\utility::flag_set( "steamroom_knifekill_setup_done" );
}

_id_B083()
{
    common_scripts\utility::flag_wait_all( "steamroom_knifekill_setup_done", "steamroom_price_knifekill_sequencestart" );
    var_0 = level._id_B733;

    if ( !isalive( var_0 ) )
    {
        common_scripts\utility::flag_set( "steamroom_price_knifekill_done" );
        return;
    }

    thread maps\_utility::radio_dialogue( "afcaves_pri_topofstairs" );
    var_0.ignoreall = 0;
    var_0.allowdeath = 1;
    var_0.health = 5;
    var_1 = level._id_C569;
    var_2 = level.price;
    var_3 = "steamroom_knifekill_price";
    var_4 = "steamroom_knifekill_guard";
    var_5 = "steamroom_knifekill_guard_idle";
    var_6 = "steamroom_knifekill_guard_reaction";
    var_0 thread _id_C694( var_6 );
    var_0 animmode( "gravity" );
    var_1 thread maps\_anim::anim_generic_loop( var_0, var_5 );
    var_0 thread _id_D1D2( var_1, var_6 );
    level thread _id_BC72( var_0 );
    maps\af_caves_code::_id_C55E( "node_steamroom_price_mid_stairs", 300 );
    var_2.dontevershoot = 1;
    var_2.ignoreall = 1;
    var_2 maps\_utility::setflashbangimmunity( 1 );
    var_2 maps\_utility::disable_surprise();
    var_1 thread maps\_anim::anim_generic_reach( var_2, var_3 );
    _id_C59F();

    if ( isalive( var_0 ) && !common_scripts\utility::flag( "steamroom_price_knifekill_abort" ) )
    {
        if ( level._id_A87F._id_C5B4 && var_0.magic_bullet_shield )
            var_0 maps\_utility::stop_magic_bullet_shield();

        common_scripts\utility::flag_set( "steamroom_price_knifekill_started" );
        var_0 thread _id_BC12( var_1 );
        thread _id_C8D0( var_3, var_0 );
        var_2 thread _id_B9A2( var_3 );
        var_2.anim_start_at_groundpos = 1;
        var_2 thread _id_BDD0();
        var_2 common_scripts\utility::delaycall( 0.1, ::pushplayer, 1 );
        var_0 common_scripts\utility::delaycall( 0.1, ::pushplayer, 1 );
        var_1 thread maps\_anim::anim_generic( var_0, var_4 );
        var_1 maps\_anim::anim_generic_gravity( var_2, var_3 );
        var_2.anim_start_at_groundpos = undefined;
    }
    else if ( isalive( var_0 ) )
    {
        var_2 notify( "new_anim_reach" );
        var_2 setgoalpos( var_2.origin );
        var_2 thread _id_AB8E();
        var_0 pushplayer( 0 );
    }
    else if ( !common_scripts\utility::flag( "steamroom_price_moveup_1" ) )
        thread _id_C63D();

    var_2.dontevershoot = undefined;
    var_2.ignoreall = 0;
    var_2 maps\_utility::setflashbangimmunity( 0 );
    var_2 maps\_utility::delaythread( 5, maps\_utility::enable_surprise );
    var_2 pushplayer( 0 );

    if ( common_scripts\utility::flag( "steamroom_price_knifekill_abort" ) && isalive( var_0 ) )
    {
        var_2.favoriteenemy = var_0;
        var_0 waittill( "death" );
        var_2.favoriteenemy = undefined;
    }

    common_scripts\utility::flag_set( "steamroom_price_knifekill_done" );
}

_id_BDD0()
{
    var_0 = spawn( "script_origin", level.price.origin );
    var_0 linkto( level.price );
    var_0 playsound( "scn_afcaves_knife_kill_behind" );
    common_scripts\utility::flag_wait_any( "steamroom_price_knifekill_abort", "steamroom_price_knifekill_walkup_abort", "steamroom_price_knifekill_done" );
    var_0 playrumbleonentity();
    wait 0.05;
    var_0 delete();
}

_id_C63D()
{
    thread maps\_utility::radio_dialogue( "afcaves_pri_nevermind" );
}

_id_BC12( var_0 )
{
    level endon( "steamroom_price_knifekill_committed" );
    self waittill( "death" );
    common_scripts\utility::flag_set( "steamroom_price_knifekill_walkup_abort" );
    level.price notify( "stop_animmode" );
    level.price maps\_utility::anim_stopanimscripted();
    var_0 maps\_utility::anim_stopanimscripted();
    thread _id_C63D();
}

_id_C59F()
{
    level endon( "steamroom_price_knifekill_abort" );
    level.price waittill( "anim_reach_complete" );
}

_id_AB8E()
{
    level endon( "steamroom_price_knifekill_done" );
    level.price endon( "scripted_teleport" );
    wait 5;
    level.price setgoalpos( maps\_utility::groundpos( ( 5207.0, 9566.0, -3499.0 ) ) );
}

_id_BC72( var_0 )
{
    level endon( "steamroom_price_knifekill_abort" );
    var_1 = var_0.a.weaponpos["right"];
    common_scripts\utility::flag_wait( "steamroom_price_knifekill_started" );
    wait 3;
    var_2 = "weapon_" + var_1;
    spawn( var_2, maps\_utility::groundpos( level.price gettagorigin( "tag_inhand" ) ) );
}

_id_C694( var_0 )
{
    var_1 = "com_cellphone_on_anim";
    var_2 = "tag_inhand";
    self attach( var_1, var_2 );
    var_3 = common_scripts\utility::flag_wait_any_return( "steamroom_price_knifekill_abort", "steamroom_price_knifekill_started" );

    if ( var_3 == "steamroom_price_knifekill_abort" )
    {
        var_4 = getanimlength( maps\_utility::getanim_generic( var_0 ) );
        var_5 = var_4 * 0.04;
        wait(var_5);
    }
    else
        self waittillmatch( "single anim", "end_reaction" );

    self detach( var_1, var_2 );
}

_id_D1D2( var_0, var_1 )
{
    self endon( "death" );
    level endon( "steamroom_price_knifekill_started" );
    thread _id_B305();
    thread _id_B2DF();
    thread _id_BB74();
    common_scripts\utility::waittill_any( "playerclose", "bulletwhizby", "bullethit", "damage", "flashbang", "grenade danger", "explode" );
    common_scripts\utility::flag_set( "steamroom_price_knifekill_abort" );
    var_0 maps\_utility::anim_stopanimscripted();
    self.health = 150;
    self.ignoreall = 0;
    self.favoriteenemy = level.player;
    maps\_utility::disable_surprise();
    var_0 maps\_anim::anim_generic_gravity( self, var_1 );
    wait 2;
    self.favoriteenemy = undefined;
    wait 3;

    if ( isalive( self ) )
    {
        var_2 = getent( "goalvolume_steamroom_patrollers", "targetname" );
        self setgoalvolumeauto( var_2 );
    }
}

_id_BB74()
{
    level endon( "steamroom_price_knifekill_abort" );
    level endon( "steamroom_price_knifekill_started" );
    self addaieventlistener( "gunshot" );

    for (;;)
    {
        self waittill( "ai_event", var_0 );

        if ( var_0 == "gunshot" )
        {
            self notify( "playerclose" );
            break;
        }
    }
}

_id_B2DF()
{
    level endon( "steamroom_price_knifekill_abort" );
    level endon( "steamroom_price_knifekill_started" );
    common_scripts\utility::flag_wait( "steamroom_knifekill_guard_playerclose" );
    self notify( "playerclose" );
}

_id_B305()
{
    level endon( "steamroom_price_knifekill_abort" );
    level endon( "steamroom_price_knifekill_started" );
    common_scripts\utility::flag_init( "player_jumping" );
    thread _id_AA6E();
    thread _id_B815();

    for (;;)
    {
        wait 0.05;

        if ( !common_scripts\utility::flag( "steamroom_stealthkill_player_in_awareness_zone" ) )
            continue;

        if ( common_scripts\utility::flag( "player_jumping" ) )
            self notify( "playerclose" );

        var_0 = get_player_speed();

        if ( var_0 > 200 )
            self notify( "playerclose" );
    }
}

_id_AA6E()
{
    level endon( "player_jump_watcher_stop" );
    var_0 = "player_jumping";

    if ( !common_scripts\utility::flag_exist( var_0 ) )
        common_scripts\utility::flag_init( var_0 );
    else
        common_scripts\utility::flag_clear( var_0 );

    notifyoncommand( "playerjump", "+gostand" );
    notifyoncommand( "playerjump", "+moveup" );

    for (;;)
    {
        level.player waittill( "playerjump" );
        wait 0.1;

        if ( !level.player isonground() )
            common_scripts\utility::flag_set( var_0 );

        while ( !level.player isonground() )
            wait 0.05;

        common_scripts\utility::flag_clear( var_0 );
    }
}

_id_B815()
{
    level common_scripts\utility::waittill_any( "steamroom_price_knifekill_abort", "steamroom_price_knifekill_started" );
    level notify( "player_jump_watcher_stop" );
}

get_player_speed()
{
    var_0 = level.player getvelocity();
    var_1 = distance( ( var_0[0], var_0[1], 0 ), ( 0.0, 0.0, 0.0 ) );
    return var_1;
}

_id_C8D0( var_0, var_1 )
{
    var_2 = getanimlength( maps\_utility::getanim_generic( var_0 ) );
    var_3 = var_2 * 0.31;
    wait(var_2);
    common_scripts\utility::flag_set( "steamroom_price_knifekill_committed" );

    if ( isalive( var_1 ) )
    {
        var_1.allowdeath = 1;
        var_1.a.nodeath = 1;
        var_1 maps\_utility::set_battlechatter( 0 );
        var_1 kill();
    }
}

_id_B9A2( var_0 )
{
    var_1 = "weapon_parabolic_knife";
    var_2 = "tag_inhand";
    var_3 = getanimlength( maps\_utility::getanim_generic( var_0 ) );
    var_4 = var_3 * 0.48;
    var_5 = var_3 * 0.78;
    var_6 = gettime();
    thread _id_C3EA( var_4 );
    self waittillmatch( "custom_animmode", "knife pullout" );
    self attach( var_1, var_2 );
    var_7 = var_5 - maps\af_caves_code::_id_AB14( gettime() - var_6 );
    common_scripts\utility::flag_wait_or_timeout( "steamroom_price_knifekill_walkup_abort", var_7 );
    self detach( var_1, var_2 );
}

_id_C3EA( var_0 )
{
    level endon( "steamroom_price_knifekill_walkup_abort" );
    var_1 = common_scripts\utility::getfx( "knife_stab" );
    var_2 = "tag_knife_fx";
    wait(var_0);
    playfx( var_1, level.price gettagorigin( var_2 ) );
}

_id_AA5A()
{
    maps\_utility::radio_dialogue( "afcaves_schq_lostcontact" );

    if ( !common_scripts\utility::flag( "steamroom_entrance" ) )
        maps\_utility::radio_dialogue( "afcaves_sc3_oncatwalk" );

    common_scripts\utility::flag_wait( "steamroom_entrance" );

    if ( !common_scripts\utility::flag( "steamroom_price_moveup_1" ) )
    {
        maps\_utility::radio_dialogue( "afcaves_schq_godark" );
        thread maps\_utility::radio_dialogue( "afcaves_pri_getready" );
    }

    common_scripts\utility::flag_set( "steamroom_going_dark" );

    if ( !common_scripts\utility::flag( "steamroom_price_moveup_2" ) )
        maps\_utility::radio_dialogue( "afcaves_sc3_chargeplanted" );
}

_id_B594()
{
    common_scripts\utility::flag_set( "steamroom_door_preblow" );
    maps\_utility::radio_dialogue( "afcaves_scl_hitit" );
    thread maps\_utility::radio_dialogue( "afcaves_sc3_breaching" );
    wait 0.8;
    common_scripts\_exploder::exploder( 200 );
    maps\_utility::delaythread( 0.5, ::_id_C2BB );
    var_0 = getent( "smodel_steamroom_c4_plant", "targetname" );
    thread common_scripts\utility::play_sound_in_space( "scn_steamroom_blow_door", var_0.origin );
    earthquake( 0.2, 1.75, level.player.origin, 350 );
    level.player playrumblelooponentity( "damage_heavy" );
    setblur( 3, 0.1 );
    var_1 = [];
    var_1[0] = var_0;
    var_1 = common_scripts\utility::array_combine( var_1, getentarray( "steamroom_fake_c4_spot", "targetname" ) );

    foreach ( var_3 in var_1 )
    {
        playfx( level._effect["c4_explosion"], var_3.origin );
        var_3 radiusdamage( var_3.origin, 256, 200, 50 );
    }

    common_scripts\utility::flag_set( "steamroom_door_blown" );
    wait 1;
    setblur( 0, 3 );
}

steamroom_exit_light()
{
    var_0 = getent( "ledge_light", "targetname" );
    var_0 setlightintensity( 1 );
    var_0 hide();
    var_1 = getent( "ledge_light1", "targetname" );
    var_1 setlightintensity( 1 );
    var_1 hide();
    var_2 = getent( "ledge_light2", "targetname" );
    var_2 setlightintensity( 1 );
    var_2 hide();
    var_3 = getent( "shadow_breach", "targetname" );
    var_3 castshadows();
    var_3 disconnectpaths();
    common_scripts\utility::flag_wait( "steamroom_door_blown" );
    var_0 show();
    var_0 setlightintensity( 15000 );
    var_1 show();
    var_1 setlightintensity( 5000 );
    var_2 show();
    var_2 setlightintensity( 5000 );
    var_3 dontcastshadows();
    var_3 connectpaths();
    var_3 delete();
}

_id_CE4C()
{
    if ( !common_scripts\utility::flag( "steamroom_exit" ) )
        maps\_utility::radio_dialogue( "afcaves_pri_move2" );

    if ( !common_scripts\utility::flag( "steamroom_exit" ) )
        maps\_utility::radio_dialogue( "afcaves_schq_flatlined" );

    if ( !common_scripts\utility::flag( "steamroom_exit" ) )
    {
        thread maps\_utility::radio_dialogue( "afcaves_sc3_notpossible" );
        wait 3.6;
        maps\_utility::radio_dialogue_interupt( "afcaves_shp_itsprice" );
    }

    if ( common_scripts\utility::flag( "player_awayfrom_steamroom_exit" ) )
        maps\_utility::radio_dialogue( "afcaves_shp_burntherest" );

    common_scripts\utility::flag_set( "steamroom_ambush_finish_dialogue_ended" );
}

_id_C592()
{
    level endon( "steamroom_ambush_started" );
    wait 8;
    thread maps\_utility::radio_dialogue( "afcaves_pri_goloud" );
    common_scripts\utility::flag_set( "steamroom_ambush_started" );
}

_id_D595()
{
    common_scripts\utility::flag_wait( "steamroom_door_preblow" );
    var_0 = getentarray( "steamroom_patroller_extraguy", "targetname" );
    var_1 = maps\af_caves_code::_id_B911( var_0, 1 );
    common_scripts\utility::array_thread( var_1, ::_id_B4FC );
    common_scripts\utility::flag_wait( "steamroom_door_blown" );
    var_2 = [];
    var_3 = [];
    var_2 = getentarray( "steamroom_patroller", "targetname" );
    var_3 = maps\af_caves_code::_id_B911( var_2, 1 );
    common_scripts\utility::array_thread( var_3, ::_id_B4FC );

    if ( !common_scripts\utility::flag( "steamroom_ambush_started" ) )
        thread _id_AD4A();

    var_4 = getentarray( "steamroom_patroller_group2", "targetname" );
    var_5 = maps\af_caves_code::_id_B911( var_4, 1 );
    common_scripts\utility::array_thread( var_5, ::_id_AEBA );
    var_6 = getentarray( "steamroom_patroller_doorguard", "targetname" );
    var_7 = maps\af_caves_code::_id_B911( var_6, 1 );
    common_scripts\utility::array_thread( var_7, ::enablelaser );
    common_scripts\utility::array_thread( var_7, ::_id_C976 );
    common_scripts\utility::flag_wait_any( "steamroom_ambush_started", "steamroom_patrollers_deathflag" );

    if ( !common_scripts\utility::flag( "steamroom_ambush_started" ) )
        common_scripts\utility::flag_set( "steamroom_player_spotted" );

    thread _id_C02E();
}

_id_AEBA()
{
    self endon( "death" );
    var_0 = self.goalradius;
    self setgoalpos( self.origin );
    common_scripts\utility::flag_wait_any( "steamroom_ambush_started", "steamroom_patrollers_deathflag" );
    self.goalradius = var_0;
    var_1 = getent( "goalvolume_steamroom_patrollers", "targetname" );
    self setgoalvolumeauto( var_1 );
    thread _id_B4FC();
}

_id_AD4A()
{
    level endon( "steamroom_ambush_started" );
    thread maps\_utility::battlechatter_off( "axis" );
    maps\_utility::radio_dialogue( "scl_movein" );
    maps\_utility::radio_dialogue( "afcaves_scl_foxtrotelement" );
    maps\_utility::radio_dialogue( "afcaves_scl_patternecho" );
    maps\_utility::radio_dialogue( "afcaves_sc3_areaclear" );
    maps\_utility::radio_dialogue( "afcaves_scl_checkcorners" );
}

_id_C02E()
{
    level endon( "steamroom_patrollers_group2_deathflag" );
    maps\_utility::radio_dialogue( "afcaves_scl_theyrehere" );
    wait 5;
    maps\_utility::radio_dialogue( "afcaves_scl_huntthemdown" );
    wait 2.5;
    maps\_utility::battlechatter_on( "axis" );
}

_id_B4FC()
{
    if ( !common_scripts\utility::flag( "steamroom_ambush_started" ) )
        thread _id_CBDD();

    thread _id_CE1D();
    self endon( "death" );
    enablelaser();
    _id_C976();

    if ( !common_scripts\utility::flag( "steamroom_ambush_started" ) )
    {
        var_0 = self.maxsightdistsqrd;
        self.maxsightdistsqrd = 250000;
        var_1 = self.goalradius;
        self.goalradius = 64;
        common_scripts\utility::flag_wait( "steamroom_door_blown" );
        thread maps\_patrol::patrol( self.target );
        wait 0.1;
        thread maps\af_caves_code::_id_CC69();
        common_scripts\utility::flag_wait( "steamroom_ambush_started" );
        wait 0.05;
        self notify( "end_patrol" );
        maps\_utility::clear_generic_idle_anim();
        self.goalradius = var_1;
        self.maxsightdistsqrd = var_0;
    }

    common_scripts\utility::flag_wait( "steamroom_patrollers_protect_door" );
    maps\_utility::delaythread( 0.1, maps\af_caves_code::_id_AAF7 );
}

_id_C976()
{
    switch ( level.gameskill )
    {
        case 0:
            self.baseaccuracy = 0.9;
            break;
        case 1:
            self.baseaccuracy = 1.1;
            break;
        case 2:
            self.baseaccuracy = 1.25;
            break;
        case 3:
            self.baseaccuracy = 1.5;
            break;
    }
}

_id_CE1D()
{
    var_0 = "steamroom_player_spotted";
    level endon( var_0 );
    self endon( "death" );
    self waittill( "enemy" );

    if ( !common_scripts\utility::flag( var_0 ) )
        common_scripts\utility::flag_set( var_0 );
}

_id_CBDD()
{
    level endon( "steamroom_ambush_started" );
    self waittill( "death" );
    common_scripts\utility::flag_set( "steamroom_ambush_started" );
}

_id_D09F()
{
    var_0 = getentarray( "lights_off_grp1", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_setlightintensity, 900 );
    var_1 = getentarray( "security_lights_off_grp1", "targetname" );
    common_scripts\utility::array_call( var_1, ::hide );
    var_2 = getentarray( "security_lights_on_grp1", "targetname" );
    common_scripts\utility::array_thread( var_2, ::_id_CEF1 );
    var_3 = getentarray( "lights_on_grp1", "targetname" );
    common_scripts\utility::array_thread( var_3, ::steamroom_redlight_off );
    var_4 = getentarray( "lights_off_grp2", "targetname" );
    common_scripts\utility::array_thread( var_4, maps\_utility::_setlightintensity, 900 );
    var_5 = getentarray( "security_lights_off_grp2", "targetname" );
    common_scripts\utility::array_call( var_5, ::hide );
    var_6 = getentarray( "security_lights_on_grp2", "targetname" );
    common_scripts\utility::array_thread( var_6, ::_id_CEF1 );
    var_7 = getentarray( "lights_on_grp2", "targetname" );
    common_scripts\utility::array_thread( var_7, ::steamroom_redlight_off );
    var_8 = getentarray( "lights_off_grp3", "targetname" );
    common_scripts\utility::array_thread( var_8, maps\_utility::_setlightintensity, 900 );
    var_9 = getentarray( "security_lights_off_grp3", "targetname" );
    common_scripts\utility::array_call( var_9, ::hide );
    var_10 = getentarray( "security_lights_on_grp3", "targetname" );
    common_scripts\utility::array_thread( var_10, ::_id_CEF1 );
    var_11 = getentarray( "lights_on_grp3", "targetname" );
    common_scripts\utility::array_thread( var_11, ::steamroom_redlight_off );
    var_12 = getentarray( "lights_off_grp4", "targetname" );
    common_scripts\utility::array_thread( var_12, maps\_utility::_setlightintensity, 900 );
    var_13 = getentarray( "security_lights_off_grp4", "targetname" );
    common_scripts\utility::array_call( var_13, ::hide );
    var_14 = getentarray( "security_lights_on_grp4", "targetname" );
    common_scripts\utility::array_thread( var_14, ::_id_CEF1 );
}

_id_CEF1()
{
    if ( self.model == "dt_light_on" || self.model == "com_utility_light_on" )
        playfxontag( common_scripts\utility::getfx( "light_glow_white_bulb" ), self, "tag_fx" );
}

steamroom_redlight_off()
{
    self._id_B357 = self getlightintensity();
    self setlightintensity( 0 );
}

_id_B1AD()
{
    var_0 = getentarray( "cavedoor", "targetname" );
    level._id_B106 = var_0[0];
}

_id_AE16()
{
    wait 0.25;
    level.player playsound( "scn_blackout_breaker_box" );
    var_0 = common_scripts\utility::getstructarray( "cave_red_light_glowspot", "targetname" );

    foreach ( var_2 in var_0 )
        playfx( common_scripts\utility::getfx( "redlight_glow" ), var_2.origin );
}

_id_B86E()
{
    thread _id_BBF8();
    level.player playsound( "scn_blackout_breaker_box" );
    var_0 = getentarray( "lights_off_grp1", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_setlightintensity, 0 );
    maps\af_caves_lighting::_id_C7A6( "af_caves_steamroom_grp1" );
    var_1 = getentarray( "security_lights_on_grp1", "targetname" );
    common_scripts\utility::array_call( var_1, ::delete );
    var_2 = getentarray( "security_lights_model_off", "script_noteworthy" );

    foreach ( var_4 in var_2 )
        var_4 setmodel( "com_two_light_fixture_off" );

    var_6 = getentarray( "utility_light_off", "script_noteworthy" );

    foreach ( var_8 in var_6 )
        var_8 setmodel( "com_utility_light_off" );

    var_10 = getentarray( "security_lights_off_grp1", "targetname" );
    common_scripts\utility::array_call( var_10, ::show );
    common_scripts\_exploder::kill_exploder( "steamroom_steamclouds_grp_01" );
    var_11 = getentarray( "lights_on_grp1", "targetname" );

    foreach ( var_13 in var_11 )
        var_13 setlightintensity( var_13._id_B357 );

    wait 0.75;
    level.player playsound( "scn_blackout_breaker_box" );
    var_15 = getentarray( "lights_off_grp2", "targetname" );
    common_scripts\utility::array_thread( var_15, maps\_utility::_setlightintensity, 0 );
    maps\af_caves_lighting::_id_C7A6( "af_caves_steamroom_grp2" );
    var_16 = getentarray( "security_lights_on_grp2", "targetname" );
    common_scripts\utility::array_call( var_16, ::delete );
    var_17 = getentarray( "security_lights_off_grp2", "targetname" );
    common_scripts\utility::array_call( var_17, ::show );
    common_scripts\_exploder::kill_exploder( "steamroom_steamclouds_grp_02" );
    var_18 = getentarray( "lights_on_grp2", "targetname" );

    foreach ( var_13 in var_18 )
        var_13 setlightintensity( var_13._id_B357 );

    wait 0.75;
    level.player playsound( "scn_blackout_breaker_box" );
    var_21 = getentarray( "lights_off_grp3", "targetname" );
    common_scripts\utility::array_thread( var_21, maps\_utility::_setlightintensity, 0 );
    maps\af_caves_lighting::_id_C7A6( "af_caves_steamroom_grp3" );
    var_22 = getentarray( "security_lights_on_grp3", "targetname" );
    common_scripts\utility::array_call( var_22, ::delete );
    var_23 = getentarray( "security_lights_off_grp3", "targetname" );
    common_scripts\utility::array_call( var_23, ::show );
    var_24 = getentarray( "lights_on_grp3", "targetname" );

    foreach ( var_13 in var_24 )
        var_13 setlightintensity( var_13._id_B357 );

    wait 0.75;
    level.player playsound( "scn_blackout_breaker_box" );
    var_27 = getentarray( "lights_off_grp4", "targetname" );
    common_scripts\utility::array_thread( var_27, maps\_utility::_setlightintensity, 0 );
    var_28 = getentarray( "security_lights_on_grp4", "targetname" );
    common_scripts\utility::array_call( var_28, ::delete );
    var_29 = getentarray( "security_lights_off_grp4", "targetname" );
    common_scripts\utility::array_call( var_29, ::show );
    thread _id_AE16();
    common_scripts\utility::flag_set( "steamroom_lights_out" );
}

_id_BBF8()
{
    common_scripts\_exploder::exploder( "steamroom_steamclouds_dark" );
    maps\_utility::pauseexploder( "steamroom_steamclouds" );
    level._id_B2CA = level._pipes._effect["steam"];
    level._pipes._effect["steam"] = common_scripts\utility::getfx( "pipe_steam_dark" );
}

enablelaser()
{
    self.a.laseron = 1;
    self.has_no_ir = undefined;
    self.custom_laser_function = ::_id_C72B;
    _id_C72B();
}

_id_C72B()
{
    if ( self.a.weaponpos["right"] == "none" )
        return;

    if ( canuselaser() )
        maps\_utility::_id_D295();
    else
        self laseroff();
}

canuselaser()
{
    return self.a.laseron && isalive( self );
}

startexploderfx()
{
    common_scripts\_exploder::exploder( "start_tv_glow" );
}

night_vision_no_tesselation()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "night_vision_on" );
        setsaveddvar( "r_tessellation", 0 );
        self waittill( "night_vision_off" );
        setsaveddvar( "r_tessellation", 1 );
    }
}
