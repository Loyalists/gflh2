// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\oilrig_mission_select_cam::_id_C490();
        return;
    }

    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" )
    {
        maps\oilrig_beautiful_corner::_id_C662();
        return;
    }

    pre_load();
    maps\_load::main();
    post_load();
}

pre_load()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    setdvar( "breach_debug", "0" );
    setdvar( "breach_weapons", "1" );
    setdvar( "breach_requires_friendlies_in_position", "0" );
    setdvar( "hostage_missionfail", "1" );
    _id_B2C8();
    setdvar( "disable_ambush_slowmo", "1" );
    setdvar( "use_node_script_flag_wait_in_color_system", 1 );
    setsaveddvar( "ai_force_combat_close", 1 );
    setsaveddvar( "ai_stairsPerfectFriendlyAimInMeleeRange", 1 );
    level.slowmo_viewhands = "h2_gfl_st_ar15_viewhands_player";
    level._id_B522 = 3;
    level.dronecallbackthread = ::_id_B6A2;
    setdynamicdvar( "oilrig_debug", "0" );
    level._id_B964 = 262144;
    level._id_CF6F = 0;
    level.pipesdamage = 0;
    level._id_AB98 = 0;
    level.underwater = 0;
    level._id_C209 = 6;
    level.spawnercallbackthread = ::_id_D148;
    level._id_C063 = undefined;
    level._id_AC30 = [];
    level._id_BFEC = 0;
    level._id_B589 = [];
    level._id_B18C = 3;
    level.hostages = 8;
    level._id_C1F0 = [];
    level.cosine["25"] = cos( 25 );
    level.cosine["35"] = cos( 35 );
    level.cosine["45"] = cos( 45 );
    level.cosine["60"] = cos( 60 );
    level.cosine["65"] = cos( 65 );
    level._id_A933 = 262144;
    var_0 = getentarray( "trigger_multiple", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_noteworthy ) && getsubstr( var_2.script_noteworthy, 0, 10 ) == "colornodes" )
            level._id_B589 = common_scripts\utility::array_add( level._id_B589, var_2 );
    }

    maps\_utility::add_start( "debug", ::_id_B584, "debug" );
    maps\_utility::add_start( "underwater", ::_id_C9B6, "underwater" );
    maps\_utility::add_start( "surface", ::_id_CB65, "surface" );
    maps\_utility::add_start( "rig", ::_id_C376, "rig" );
    maps\_utility::add_start( "deck1", ::_id_BC3E, "deck1" );
    maps\_utility::add_start( "heli", ::_id_AE2A, "ambush" );
    maps\_utility::add_start( "deck2", ::_id_CFE3, "deck2" );
    maps\_utility::add_start( "deck3", ::_id_AE62, "deck3" );
    maps\_utility::add_start( "escape", ::start_escape, "escape" );
    maps\_utility::default_start( ::_id_B972 );
    level._id_C830 = [];
    level._id_C830[0] = "weapon_g36_clip";
    level._id_C830[1] = "weapon_mini_uzi_clip";
    level._id_C830[2] = "weapon_mp5_clip";
    level._id_C830[3] = "weapon_g3_clip";
    level._id_C830[4] = "weapon_ump45_clip";
    level._id_C830[5] = "weapon_m16_clip";
    level._id_C830[6] = "weapon_fn2000_clip";
    level._id_C830[7] = "weapon_kriss_clip";
    level._id_C830[8] = "weapon_rpd_clip";
    level._id_C830[9] = "weapon_ak74u_clip";
    level._id_C830[10] = "weapon_ak47_tactical_clip";
    level._id_C830[11] = "weapon_dragunov_clip";
    level._id_C830[12] = "weapon_saw_clip";
    level._id_C830[13] = "weapon_famas_clip";
    level._id_B8AB = "h2_gfl_st_ar15_viewbody";
    level.scr_model["worldbody"] = "h2_gfl_st_ar15_viewbody";
    _id_AAAB::main();
    maps\_drone_civilian::init();
    vehicle_scripts\_attack_heli::preload();
    _id_CA20::main();
    _id_AA61::main();
    _id_D31E::main();
    _id_CE2B::main();
    thread _id_AB52::main();
    maps\oilrig_anim::main();
}

post_load()
{
    maps\oilrig_lighting::main();

    if ( !maps\_utility::is_specialop() )
        maps\oilrig_aud::main();

    _id_B564::init();
    maps\_slowmo_breach::slowmo_breach_init();
    maps\_slowmo_breach::add_breach_func( ::_id_B6F3 );
    level.friendly_breach = 0;
    common_scripts\utility::flag_init( "sdv_01_passing" );
    common_scripts\utility::flag_init( "oilrig_mission_failed" );
    common_scripts\utility::flag_init( "player_attached_to_sdv" );
    common_scripts\utility::flag_init( "difficulty_initialized" );
    common_scripts\utility::flag_init( "player_broke_stealth" );
    common_scripts\utility::flag_init( "heli_safezones_setup" );
    common_scripts\utility::flag_init( "intro_anim_sequence_starting" );
    common_scripts\utility::flag_init( "open_dds_door" );
    common_scripts\utility::flag_init( "sdv_02_at_end_of_path" );
    common_scripts\utility::flag_init( "sdv_01_at_end_of_path" );
    common_scripts\utility::flag_init( "player_is_surfacing" );
    common_scripts\utility::flag_init( "player_is_done_swimming" );
    common_scripts\utility::flag_init( "start_underwater_heli" );
    common_scripts\utility::flag_init( "player_turn_rate_slowed" );
    common_scripts\utility::flag_init( "obj_stealthkill_given" );
    common_scripts\utility::flag_init( "obj_stealthkill_complete" );
    common_scripts\utility::flag_init( "obj_hostages_secure_given" );
    common_scripts\utility::flag_init( "obj_hostages_secure_complete" );
    common_scripts\utility::flag_init( "obj_c4_ambush_plant_given" );
    common_scripts\utility::flag_init( "obj_c4_ambush_plant_complete" );
    common_scripts\utility::flag_init( "obj_ambush_given" );
    common_scripts\utility::flag_init( "obj_ambush_complete" );
    common_scripts\utility::flag_init( "obj_explosives_locate_given" );
    common_scripts\utility::flag_init( "obj_explosives_locate_complete" );
    common_scripts\utility::flag_init( "player_has_started_planting_c4" );
    common_scripts\utility::flag_init( "obj_escape_given" );
    common_scripts\utility::flag_init( "obj_escape_complete" );
    common_scripts\utility::flag_init( "player_approaching_oilrig_legs" );
    common_scripts\utility::flag_init( "player_breaks_surface" );
    common_scripts\utility::flag_init( "player_slitting_throat" );
    common_scripts\utility::flag_init( "sdv_01_arriving" );
    common_scripts\utility::flag_init( "player_pulled_halfway_out_of_water" );
    common_scripts\utility::flag_init( "player_removing_mask" );
    common_scripts\utility::flag_init( "player_looking_at_gear_friendlies" );
    common_scripts\utility::flag_init( "enemy_lull_in_conversation" );
    common_scripts\utility::flag_init( "player_looking_at_grate_guard" );
    common_scripts\utility::flag_init( "start_surface_sequences" );
    common_scripts\utility::flag_init( "player_in_position_for_stealth_kill" );
    common_scripts\utility::flag_init( "player_performing_underwater_kill" );
    common_scripts\utility::flag_init( "player_ready_to_be_helped_from_water" );
    common_scripts\utility::flag_init( "player_looking_at_floating_body" );
    common_scripts\utility::flag_init( "player_starting_stealth_kill" );
    common_scripts\utility::flag_init( "player_done_being_helped_from_water" );
    common_scripts\utility::flag_init( "lower_decks_closed_off" );
    common_scripts\utility::flag_init( "player_dealing_with_rail" );
    common_scripts\utility::flag_init( "player_looking_at_railing" );
    common_scripts\utility::flag_init( "railing_patroller_dead" );
    common_scripts\utility::flag_init( "lower_room_breached" );
    common_scripts\utility::flag_init( "start_nagging_to_go_to_deck1" );
    common_scripts\utility::flag_init( "heli_flyby_finished" );
    common_scripts\utility::flag_init( "friendly1_lower_breach_done" );
    common_scripts\utility::flag_init( "friendly2_lower_breach_done" );
    common_scripts\utility::flag_init( "follow_team_in_stairs_after_deck1_breach" );
    common_scripts\utility::flag_init( "upper_room_breached" );
    common_scripts\utility::flag_init( "trig_prisoner_sequence_failsafe" );
    common_scripts\utility::flag_init( "friendlies_had_to_plant_C4" );
    common_scripts\utility::flag_init( "ambush_c4_triggered" );
    common_scripts\utility::flag_init( "ambush_enemies_spawned" );
    common_scripts\utility::flag_init( "ambush_enemies_alerted" );
    common_scripts\utility::flag_init( "ambush_enemies_alerted_prematurely" );
    common_scripts\utility::flag_init( "ambush_enemies_approaching" );
    common_scripts\utility::flag_init( "ambush_gate_opened" );
    common_scripts\utility::flag_init( "enemies_discovered_bodies" );
    common_scripts\utility::flag_init( "soap_reached_scaffold" );
    common_scripts\utility::flag_init( "deck1_postbreach_color_nodes_activated" );
    common_scripts\utility::flag_init( "deck_2_heli_is_finished_intimidating" );
    common_scripts\utility::flag_init( "player_shoots_or_aims_rocket_at_intimidating_heli" );
    common_scripts\utility::flag_init( "deck_2_sync_ais_before_3rd_floor" );
    common_scripts\utility::flag_init( "zodiacs_evaced" );
    common_scripts\utility::flag_init( "need_to_check_axis_death" );
    common_scripts\utility::flag_init( "done_with_smoke_dialogue" );
    common_scripts\utility::flag_init( "heli_not_killed_in_time" );
    common_scripts\utility::flag_init( "smoke_thrown" );
    common_scripts\utility::flag_init( "stop_smoke" );
    common_scripts\utility::flag_init( "smoke_firefight" );
    common_scripts\utility::flag_init( "top_deck_room_breached" );
    common_scripts\utility::flag_init( "player_detonated_explosives" );
    common_scripts\utility::flag_init( "derrick_room_getting_breached" );
    common_scripts\utility::flag_init( "player_got_deck3_autosave" );
    common_scripts\utility::flag_init( "left_deck3_dudes_spawned" );
    common_scripts\utility::flag_init( "player_on_board_littlebird" );
    common_scripts\utility::flag_init( "littlebird_escape_lifted_off" );
    common_scripts\utility::flag_init( "littlebird_escape_spawned" );
    common_scripts\utility::flag_init( "sub_comes_through_ice" );
    common_scripts\utility::flag_init( "littlebird_escape_moving" );
    common_scripts\utility::flag_init( "escape_littlebird_landed" );
    common_scripts\utility::flag_init( "stair_in_use" );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    thread _id_C516();
    initialize_portal_flags();
    common_scripts\utility::array_thread( getentarray( "redshirt_trigger", "targetname" ), ::_id_BF40 );
    common_scripts\utility::array_thread( getentarray( "compassTriggers", "targetname" ), ::_id_BD74 );
    setsaveddvar( "r_specularColorScale", "1.4" );
    thread _id_D0F0();
    level._id_AF1A = 0.8;
    level._id_C02A = 0.1;
    level.playerspeed = level._id_AF1A;
    level.player _id_B3BA( level._id_AF1A );
    thread _id_ABDF();
    thread _id_BB44();
    _id_B6CD();
    thread maps\jake_tools::hideall();
    _id_C71C();
    var_0 = [];
    var_0[0] = "heli_ambush";
    var_0[1] = "heli_deck2";
    var_0[2] = "heli_patrol_02";
    thread _id_AE24( var_0 );
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "ignored" );
    createthreatbiasgroup( "oblivious" );
    level.player setthreatbiasgroup( "player" );
    setignoremegroup( "allies", "oblivious" );
    setignoremegroup( "axis", "oblivious" );
    setignoremegroup( "player", "oblivious" );
    setignoremegroup( "oblivious", "allies" );
    setignoremegroup( "oblivious", "axis" );
    setignoremegroup( "oblivious", "oblivious" );
    common_scripts\utility::array_thread( getentarray( "hostiles_ambush", "targetname" ), maps\_utility::add_spawn_function, ::_id_C198 );
    common_scripts\utility::array_thread( getentarray( "patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_D31D );
    common_scripts\utility::array_thread( getentarray( "rappel", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_B1AE );
    common_scripts\utility::array_thread( getentarray( "army", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_CCB7 );
    maps\_utility::array_spawn_function_noteworthy( "turret_guys", ::_id_CD3D );
    maps\_utility::array_spawn_function_noteworthy( "left_deck3_dudes", ::_id_B2B9 );
    common_scripts\utility::array_thread( getvehiclenodearray( "plane_sound", "script_noteworthy" ), vehicle_scripts\_mig29::plane_sound_node );
    maps\_utility::array_spawn_function_targetname( "hostiles_deck2_smoke", ::ai_dont_change_floor_spawn );
    thread player_death();

    if ( maps\_utility::is_specialop() )
    {
        var_1 = getentarray( "sub_dds_01", "targetname" );
        var_2 = getentarray( "dds_door_01", "targetname" );
        common_scripts\utility::array_thread( var_1, maps\_utility::hide_entity );
        common_scripts\utility::array_thread( var_2, maps\_utility::hide_entity );
        var_1 = getentarray( "sub_dds_02", "targetname" );
        var_2 = getentarray( "dds_door_02", "targetname" );
        common_scripts\utility::array_thread( var_1, maps\_utility::hide_entity );
        common_scripts\utility::array_thread( var_2, maps\_utility::hide_entity );
    }

    common_scripts\utility::flag_set( "init_gameplay_lighting" );
    var_3 = getent( "oilr_water_plane_01", "targetname" );
    var_3 hide();
    var_4 = getent( "oilr_water_plane_02", "targetname" );
    var_4 hide();
    var_5 = getent( "water_plane_distortion", "targetname" );
    var_5 hide();
    thread dof_water_takedown_and_climb();
    thread deck_2_monitor_and_sync_ais_before_3rd_floor();
    thread info_volume_objects_hide();
    init_custom_death_anim();
    common_scripts\utility::array_thread( getentarray( "breach_custom_death", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_utility::set_generic_deathanim, "stand_death_shoulder_stumble" );
    var_6 = getent( "ai_sync_before_entering_breach_room", "script_noteworthy" );
    var_6 maps\_utility::add_spawn_function( ::manhandler_first_breach_right_door_spawn_func );
    thread maps\_utility::add_global_spawn_function( "allies", ::replacemodelforwetallies );
    thread h2_intro_zodiac_wibble();
}

player_death()
{
    level.player waittill( "death", var_0 );

    if ( isdefined( var_0 ) && var_0.code_classname == "misc_turret" )
    {
        if ( issubstr( var_0.model, "little_bird" ) )
        {
            level notify( "new_quote_string" );
            setdvar( "ui_deadquote", &"OILRIG_MISSIONFAIL_HELI_DEATH" );
        }
    }
}

_id_B972()
{
    _id_C9B6();
}

_id_B584()
{
    common_scripts\utility::flag_set( "above_water_visuals" );
    _id_B351( "Rig" );
    thread maps\_slowmo_breach::delete_breach( 0 );
    thread maps\_slowmo_breach::delete_breach( 1 );
    thread maps\_slowmo_breach::delete_breach( 2 );
    thread maps\_slowmo_breach::delete_breach( 3 );
    thread maps\_slowmo_breach::delete_breach( 4 );
    thread maps\_slowmo_breach::delete_breach( 5 );
    thread _id_AFCD( 1 );
    level.player _id_B3BA( 1 );
    var_0 = getent( "org_stealth_kill", "targetname" );
    var_1 = _id_BDC3( "02", var_0 );
    var_1.origin = level.player.origin + ( 0.0, 0.0, 100.0 );
    var_1 thread _id_AA61::_id_ABCA();
    wait 3;
    var_0 maps\_anim::anim_first_frame_solo( var_1, "intro_sequence" );
}

_id_C9B6()
{
    soundscripts\_snd::snd_message( "start_underwater_checkpoint" );
    _id_AABF();
}

_id_CB65()
{
    soundscripts\_snd::snd_message( "start_surface_checkpoint" );
    common_scripts\utility::flag_set( "sdv_01_arriving" );
    _id_D56C();
    common_scripts\utility::flag_set( "player_is_done_swimming" );
    common_scripts\utility::flag_set( "player_breaks_surface" );
    var_0 = getent( "org_stealth_kill", "targetname" );
    _id_D32B();
    level.player setorigin( var_0.origin + ( 0.0, -65.0, 0.0 ) );
    level.player setplayerangles( var_0.angles );
    level.player disableweapons();
    thread _id_A833();
    thread _id_CA63();
    wait 0.05;
    _id_BF09();
    thread _id_CEB9();
}

_id_CA63()
{
    wait 1;
    var_0 = 0;
    var_1 = maps\_utility::array_merge( level._id_A815, level._id_C977 );

    for (;;)
    {
        wait 0.05;

        foreach ( var_3 in var_1 )
            var_3 notify( "finished_swim_animation" );

        var_0++;
    }
}

_id_C376( var_0 )
{
    soundscripts\_snd::snd_message( "start_rig_checkpoint" );
    _id_B351( "Rig", var_0 );
    thread _id_B295();
    common_scripts\utility::flag_set( "player_slitting_throat" );
    common_scripts\utility::flag_set( "player_ready_to_be_helped_from_water" );
    thread _id_D46B();
    thread _id_BD07();
}

_id_BC3E()
{
    soundscripts\_snd::snd_message( "start_deck1_checkpoint" );
    thread _id_BD07();
    common_scripts\utility::flag_set( "above_water_visuals" );
    maps\jake_tools::triggersenable( "colornodes_deck1", "script_noteworthy", 1 );
    _id_B351( "Deck1" );
    thread _id_D174();
    thread garage_door_think();
    var_0 = getent( "door_deck1", "targetname" );
    var_0 delete();
    var_1 = getent( "door_deck1_animated", "targetname" );
    var_1 hide();
    maps\_utility::musicplaywrapper( "mus_oilrig_suspense_01_music_alt" );
    common_scripts\utility::flag_set( "player_ready_to_be_helped_from_water" );
    common_scripts\utility::flag_set( "obj_hostages_secure_given" );
    common_scripts\utility::flag_set( "player_at_lower_breach" );
    common_scripts\utility::flag_set( "railing_patroller_dead" );
    common_scripts\utility::flag_set( "lower_room_breached" );
    common_scripts\utility::flag_set( "lower_room_cleared" );
    thread _id_B581();
}

_id_AE2A()
{
    soundscripts\_snd::snd_message( "start_heli_checkpoint" );
    thread _id_BD07();
    common_scripts\utility::flag_set( "above_water_visuals" );
    _id_B351( "Heli" );
    thread maps\_slowmo_breach::delete_breach( 0 );
    thread maps\_slowmo_breach::delete_breach( 1 );
    thread maps\_slowmo_breach::delete_breach( 2 );
    thread maps\_slowmo_breach::delete_breach( 3 );
    thread _id_AFCD( 1 );
    maps\_utility::musicplaywrapper( "mus_oilrig_fight_music_01" );
    thread _id_B50A();
    level.player _id_B3BA( 1 );
    maps\_utility::battlechatter_on( "axis" );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_set( "player_ready_to_be_helped_from_water" );
}

_id_CFE3()
{
    soundscripts\_snd::snd_message( "start_deck2_checkpoint" );
    thread _id_BD07();
    common_scripts\utility::flag_set( "player_at_stairs_to_deck_2" );
    common_scripts\utility::flag_set( "player_approaching_deck_2" );
    maps\jake_tools::triggersenable( "colornodes_deck2", "script_noteworthy", 1 );
    common_scripts\utility::flag_set( "above_water_visuals" );
    _id_B351( "Deck2" );
    thread _id_CB17();
    level.player _id_B3BA( 1 );
    maps\_utility::battlechatter_on( "axis" );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_set( "player_ready_to_be_helped_from_water" );
}

_id_AE62()
{
    soundscripts\_snd::snd_message( "start_deck3_checkpoint" );
    thread _id_BD07();
    common_scripts\utility::flag_set( "player_at_stairs_to_top_deck" );
    common_scripts\utility::flag_set( "above_water_visuals" );
    _id_B351( "Deck3" );
    thread _id_C671();
    level.player _id_B3BA( 1 );
    maps\_utility::battlechatter_on( "axis" );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_set( "player_ready_to_be_helped_from_water" );
    common_scripts\utility::flag_set( "obj_explosives_locate_given" );
    thread _id_D318();
}

start_escape()
{
    soundscripts\_snd::snd_message( "start_escape_checkpoint" );
    thread maps\_slowmo_breach::delete_breach( 0 );
    thread maps\_slowmo_breach::delete_breach( 1 );
    thread maps\_slowmo_breach::delete_breach( 2 );
    thread maps\_slowmo_breach::delete_breach( 3 );
    thread maps\_slowmo_breach::delete_breach( 4 );
    thread maps\_slowmo_breach::delete_breach( 5 );
    thread _id_AFCD( 1 );
    thread _id_BD07();
    common_scripts\utility::flag_set( "above_water_visuals" );
    _id_B351( "Escape" );
    common_scripts\utility::flag_set( "barracks_cleared" );
    level.player _id_B3BA( 1 );
    thread _id_AAAA();
    common_scripts\utility::flag_set( "player_ready_to_be_helped_from_water" );
    thread _id_C4EE();
    wait 0.5;
    level notify( "A door in breach group 300 has been activated." );
}

portal_group_start_point_initializer()
{
    var_0 = [];
    var_1 = [];
    var_2 = [ "portal_base_flag", "portal_firstfloor_flag" ];
    var_3 = [ "portal_base_flag", "portal_firstfloor_flag", "portal_firstbreach_flag" ];
    var_4 = [ "portal_base_flag", "portal_firstfloor_flag", "portal_secondfloor_flag" ];
    var_5 = [ "portal_base_flag", "portal_firstfloor_flag", "portal_secondfloor_flag", "portal_thirdfloor_flag", "portal_secondbreach_flag" ];
    var_6 = [ "portal_secondfloor_flag", "portal_thirdfloor_flag", "portal_topfloor_flag" ];
    var_7 = [ "portal_thirdfloor_flag", "portal_topfloor_flag" ];
    var_8 = [ "portal_thirdfloor_flag", "portal_topfloor_flag", "portal_topfloorbreach_flag" ];

    switch ( level.start_point )
    {
        case "underwater":
            var_9 = var_1;
            break;
        case "surface":
            var_9 = var_2;
            break;
        case "rig":
            var_9 = var_3;
            break;
        case "deck1":
            var_9 = var_4;
            break;
        case "heli":
            var_9 = var_5;
            break;
        case "deck2":
            var_9 = var_6;
            break;
        case "deck3":
            var_9 = var_7;
            break;
        case "escape":
            var_9 = var_8;
            break;
        default:
            var_9 = var_0;
            break;
    }

    return var_9;
}

initialize_portal_flags()
{
    var_0 = portal_group_start_point_initializer();

    foreach ( var_2 in var_0 )
        common_scripts\utility::flag_set( var_2 );
}

_id_AABF()
{
    enableforcedsunshadows();
    level.underwater = 1;
    _id_D56C();
    thread _id_BF09();
    thread _id_C2D6();
    thread underwater_sequence();
    thread _id_C567();
    thread _id_D32B();
    thread _id_A833();
    thread _id_AFB9( level.player );
    thread hide_show_props();
    thread vision_set_change_underwater();
    common_scripts\utility::flag_wait( "start_surface_sequences" );
    thread _id_CEB9();
}

underwater_sequence()
{
    thread _id_B391( 0, 6500 );
    var_0 = getent( "underwater_box", "targetname" );
    var_0 show();
    var_1 = getent( "org_stealth_kill", "targetname" );
    common_scripts\utility::flag_set( "underwater_sequence_lighting" );
    thread bring_back_rig();
    var_2 = getent( "ally_submarine", "targetname" );
    var_2 maps\_utility::assign_animtree( "submarine_02" );
    var_2 thread submarine_02_dds();
    var_2 thread _id_BAF2();
    var_3 = _id_BDC3( "01", var_1 );
    var_4 = _id_BDC3( "02", var_1 );
    var_2 thread _id_AA61::_id_AD74();
    var_3 thread _id_AA61::_id_D06F();
    var_4 thread _id_AA61::_id_ABCA();
    var_5 = [];
    var_5[0] = var_2;
    var_5[1] = var_3;
    var_5[2] = var_4;
    var_1 maps\_anim::anim_first_frame( var_5, "intro_sequence" );
    var_3 thread _id_AA61::_id_B8DB();
    wait 1;
    level.player thread _id_B9B8( var_3, var_1 );
    thread h2_sub_intro_cin();
    wait 0.5;
    common_scripts\utility::array_thread( level._id_A815, ::_id_AD2F, var_3, var_1 );
    common_scripts\utility::array_thread( level._id_C977, ::_id_AD2F, var_4, var_1 );
    wait 1;
    common_scripts\utility::array_thread( level._id_BF0A, common_scripts\utility::pauseeffect );
    common_scripts\utility::array_thread( level._id_D47A, common_scripts\utility::pauseeffect );
    var_6 = getent( "dds_door_01", "targetname" );
    var_6._id_CADF = getent( "dds_door_01_seal", "targetname" );
    var_6._id_CADF linkto( var_6 );
    common_scripts\utility::flag_wait( "player_attached_to_sdv" );
    common_scripts\utility::array_thread( level.players, maps\_underwater::player_scuba );
    common_scripts\utility::flag_wait( "open_dds_door" );
    var_6 _id_C455();
    wait 1;
    level.player playrumblelooponentity( "light_3s" );
    wait 3.5;
    thread h2_tweak_cull_dist();
    common_scripts\utility::flag_set( "intro_anim_sequence_starting" );
    var_1 maps\_anim::anim_single( var_5, "intro_sequence" );
    common_scripts\utility::flag_wait( "sdv_01_passing" );
    common_scripts\utility::flag_wait( "sdv_01_arriving" );
    thread _id_B391( 3, 2500 );
    common_scripts\utility::flag_wait( "player_ready_to_be_helped_from_water" );
    thread _id_B391( 0, 0 );
    var_2 delete();
    var_4 delete();
    var_7 = getent( "player_submarine", "targetname" );
    var_7 delete();
    var_0 hide();
}

h2_sub_intro_cin()
{
    var_0 = _id_D397::_id_A97A( "sub_ride" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 98.65 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 72.5 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 12.0, 4.0, 8.0, 55, 43, 22, 20 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 20.5 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 21.4 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 23.15 ) _id_D397::_id_B85E( 0.1, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 26.2 ) _id_D397::_id_B85E( 0.06, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 35.0 ) _id_D397::_id_B85E( 0.04, 0.3, level.player, 10000 );
    var_0 _id_D397::_id_BEA0( 89.5 ) _id_D397::_id_B85E( 0.06, 0.6, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 98.65 ) _id_D397::_id_B85E( 0.08, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BC26();
}

h2_tweak_cull_dist()
{
    wait 30;
    setculldist( 3000 );
    wait 21;
    var_0 = 3000;
}

_id_B959()
{
    level endon( "player_breaks_surface" );

    while ( !common_scripts\utility::flag( "player_breaks_surface" ) )
    {
        level.player shellshock( "slowview", 0.1 );
        wait 0.1;
    }
}

_id_BF09()
{
    _id_B351( "Rig", 0, 1 );
    common_scripts\utility::array_call( level._id_C8BC, ::hide );
    level._id_A815 = [];
    level._id_A815[0] = maps\_utility::spawn_script_noteworthy( "sdv01_pilot" );
    level._id_A815[0].animname = "sdv01_pilot";
    level._id_A815[1] = maps\_utility::spawn_script_noteworthy( "sdv01_copilot" );
    level._id_A815[1].animname = "sdv01_copilot";
    level._id_A815[2] = maps\_utility::spawn_script_noteworthy( "sdv01_swimmer1" );
    level._id_A815[2].animname = "sdv01_swimmer1";
    level._id_C977 = [];
    level._id_C977[0] = maps\_utility::spawn_script_noteworthy( "sdv02_pilot" );
    level._id_C977[0].animname = "sdv02_pilot";
    level._id_C977[1] = maps\_utility::spawn_script_noteworthy( "sdv02_copilot" );
    level._id_C977[1].animname = "sdv02_copilot";
    level._id_C977[2] = maps\_utility::spawn_script_noteworthy( "sdv02_swimmer1" );
    level._id_C977[2].animname = "sdv02_swimmer1";
    level._id_C977[3] = maps\_utility::spawn_script_noteworthy( "sdv02_swimmer2" );
    level._id_C977[3].animname = "sdv02_swimmer2";
    common_scripts\utility::array_thread( level._id_C977, maps\_underwater::friendly_bubbles );
    common_scripts\utility::array_thread( level._id_A815, maps\_underwater::friendly_bubbles );
    common_scripts\utility::flag_wait( "sdv_01_arriving" );
    common_scripts\utility::array_thread( level._id_C977, maps\_underwater::friendly_bubbles_stop );
    common_scripts\utility::array_thread( level._id_A815, maps\_underwater::friendly_bubbles_stop );
}

_id_D32B()
{
    var_0 = getent( "org_stealth_kill", "targetname" );
    level._id_BA99 = spawn( "script_origin", var_0.origin );
    level._id_BA99.origin = var_0.origin;
    level._id_BA99.angles = var_0.angles;
    level._id_C177 = maps\_utility::spawn_targetname( "hostile_stealthkill_player" );
    level._id_C177 maps\_props::attach_cig_self();
    level._id_D489 = maps\_utility::spawn_targetname( "hostile_stealthkill_friendly" );
    level._id_C177.animname = "hostile_stealthkill_player";
    level._id_D489.animname = "hostile_stealthkill_friendly";
    level._id_C177 thread _id_AB74();
    level._id_D489 thread _id_AB74();
    level._id_C177 thread disable_weapon_in_wolfmode();
    level._id_D489 thread disable_weapon_in_wolfmode();
    level._id_BA99 thread _id_A8E4( "lower_room_breached" );
}

disable_weapon_in_wolfmode()
{
    self.cheat._id_BDF2 = 1;
}

_id_A8E4( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self ) )
        self delete();
}

_id_AB74()
{
    self.ignoreme = 1;
    level._id_BA99 thread maps\_anim::anim_loop_solo( self, "grate_idle", "stop_idle" );
}

_id_A82D()
{
    common_scripts\utility::flag_wait( "start_underwater_heli" );
    common_scripts\utility::flag_wait( "sdv_02_arriving" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "heli_patrol_01" );
    var_0 thread _id_C53D();
    thread maps\_vehicle::gopath( var_0 );
    var_0 waittill( "reached_dynamic_path_end" );
    var_0 delete();
}

_id_B976()
{
    wait 1;
    var_0 = 10;
    var_1 = 20;
    self moveto( self.origin + ( 0, 0, var_1 ), var_0, 1, 1 );
    wait(var_0);
    self delete();
}

_id_BAF2()
{
    self endon( "death" );
    var_0 = spawn( "script_origin", self.origin + ( 0.0, -900.0, -1800.0 ) );
    var_0 linkto( self );

    while ( !common_scripts\utility::flag( "player_ready_to_be_helped_from_water" ) )
    {
        var_0 playrumblelooponentity( "mig_rumble" );
        wait 0.4;
    }

    var_0 delete();
}

_id_C567()
{
    wait 8;
    maps\_utility::radio_dialogue( "oilrig_sbc_drydock" );
    wait 2;
    maps\_utility::radio_dialogue( "oilrig_sbo_fullpressure" );
    maps\_utility::radio_dialogue( "oilrig_sbc_deployment" );
    common_scripts\utility::flag_set( "open_dds_door" );
    wait 10;
    maps\_utility::radio_dialogue( "oilrig_sbo_tm1away" );
    wait 5;
    maps\_utility::radio_dialogue( "oilrig_sbo_zerooneniner" );
    common_scripts\utility::flag_wait( "sdv_01_passing" );
    maps\_utility::radio_dialogue( "oilrig_sbc_ussdallas" );
    wait 3;
    common_scripts\utility::flag_set( "player_approaching_oilrig_legs" );
    common_scripts\utility::flag_set( "start_underwater_heli" );
    wait 3;
    maps\_utility::radio_dialogue( "oilrig_sbo_depth20" );
    common_scripts\utility::flag_wait( "sdv_02_arriving" );
    common_scripts\utility::flag_set( "start_surface_sequences" );
    maps\_utility::radio_dialogue( "oilrig_sbc_tm2objective" );
    wait 3;
    thread maps\_introscreen::_id_B013();
    common_scripts\utility::flag_wait( "sdv_01_stopping" );
    wait 5;
}

_id_B9B8( var_0, var_1 )
{
    level.player disableweapons();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player _meth_830F( 0 );
    level.player allowjump( 0 );
    var_2 = maps\_utility::spawn_anim_model( "player_rig" );
    var_2 thread _id_B209();
    var_0 maps\_anim::anim_first_frame_solo( var_2, "underwater_player_start", "origin_animate_jnt" );
    var_2 linkto( var_0, "origin_animate_jnt" );
    level.player setorigin( var_2 gettagorigin( "tag_player" ) );
    level.player setplayerangles( var_2 gettagangles( "tag_player" ) );
    wait 1;
    level.player playerlinktodelta( var_2, "tag_player", 1, 55, 43, 5, 20, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    common_scripts\utility::flag_set( "player_attached_to_sdv" );
    common_scripts\utility::flag_wait( "intro_anim_sequence_starting" );
    var_0 thread maps\_anim::anim_single_solo( var_2, "underwater_player_start", "origin_animate_jnt" );
    common_scripts\utility::flag_wait( "sdv_01_arriving" );
    wait 4;
    wait 15.5;
    common_scripts\utility::flag_set( "player_breaks_surface" );
    var_3 = getent( "water_plane_distortion", "targetname" );
    var_3 show();
    _id_B6D5( 0 );
    thread maps\_utility::waterfx( "player_ready_to_be_helped_from_water", undefined );
    thread _id_D105();
    var_2 hide();
    common_scripts\utility::flag_wait( "player_is_done_swimming" );
    var_2 delete();
}

_id_D105()
{
    self endon( "death" );
    var_0 = 1;
    var_1 = 5;
    var_2 = 5;
    var_3 = 30;
    var_4 = 50;
    var_5 = 90;
    var_6 = 260;
    var_7 = ( var_3 - var_1 ) / var_0 * 20;
    var_8 = ( var_4 - var_2 ) / var_0 * 20;
    var_9 = var_1;
    var_10 = var_2;
    var_11 = 0;
    common_scripts\utility::flag_set( "player_turn_rate_slowed" );

    while ( common_scripts\utility::flag( "player_turn_rate_slowed" ) )
    {
        var_12 = level.player getnormalizedcameramovement();
        var_13 = var_12[0];
        var_14 = var_12[1];
        var_15 = common_scripts\utility::ter_op( abs( var_13 ) > 0.001, 1, -3 );
        var_16 = common_scripts\utility::ter_op( abs( var_14 ) > 0.001, 1, -3 );
        var_9 = clamp( var_9 + var_7 * var_15, var_1, var_3 );
        var_10 = clamp( var_10 + var_8 * var_16, var_2, var_4 );

        if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
        {
            setsaveddvar( "aim_turnrate_yaw", var_10 );
            setsaveddvar( "aim_turnrate_pitch", var_9 );
            level.player disableslowaim();
            var_11 = 0;
        }
        else
        {
            if ( !var_11 )
                level.player enableslowaim();

            var_11 = 1;
        }

        var_17 = var_13;
        var_18 = var_14;
        waitframe();
    }

    setsaveddvar( "aim_turnrate_yaw", var_6 );
    setsaveddvar( "aim_turnrate_pitch", var_5 );
    level.player disableslowaim();
}

_id_B6D5( var_0 )
{
    var_1 = getentarray( "water_plane", "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( var_0 )
        {
            var_3 show();
            continue;
        }

        var_3 hide();
    }
}

_id_A833()
{
    var_0 = getent( "org_stealth_kill", "targetname" );
    var_1 = getent( "grate_blocker", "targetname" );
    var_1 hide();
    var_1 notsolid();
    common_scripts\utility::flag_wait( "sdv_01_arriving" );
    common_scripts\utility::array_thread( level.players, maps\_underwater::stop_player_scuba );
    common_scripts\utility::flag_wait( "player_breaks_surface" );
    _id_B391( 0, 0 );
    thread _id_B187();
}

_id_B187()
{
    var_0 = getent( "org_water_level", "targetname" );
    var_0.origin += ( 0.0, 0.0, 0.0 );
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1.origin = level.player.origin + ( 0.0, 0.0, 10.0 );
    var_1.angles = var_0.angles;
    var_2 = spawn( "script_model", var_1.origin );
    var_2 setmodel( "tag_origin" );
    var_2.origin = var_1.origin;
    var_2.angles = var_1.angles;
    var_1 thread _id_CF31();
    var_1 thread _id_C71A();
    var_2 thread _id_B9C1( var_1 );
    var_3 = 1;
    var_4 = 9;
    var_2.origin = level.player.origin + ( 0, 0, var_4 );
    var_1.origin = level.player.origin + ( 0, 0, var_4 );
    var_2 maps\_utility::lerp_player_view_to_tag_oldstyle( level.player, "tag_origin", var_3, 1, 90, 90, 50, 4 );
    maps\_utility::delaythread( 0, ::_id_CFFB, var_2, "tag_origin" );
}

_id_CFFB( var_0, var_1 )
{
    level.player playerlinktodelta( var_0, var_1, 0.0, 90, 90, 50, 4, 1 );
}

_id_CF31()
{
    self endon( "death" );
    var_0 = 2.4;
    var_1 = 3.2;
    self moveto( self.origin + ( 0, 0, var_1 / 2 ), var_0, 1, 1 );
    wait(var_0);

    while ( isdefined( self ) )
    {
        self moveto( self.origin + ( 0, 0, var_1 * -1 ), var_0, 1, 1 );
        wait(var_0);
        self moveto( self.origin + ( 0, 0, var_1 ), var_0, 1, 1 );
        wait(var_0);
    }
}

_id_C71A()
{
    self endon( "death" );
    var_0 = 4;
    var_1 = 6;
    self rotateroll( var_0 / 2, var_1, var_1 / 2, var_1 / 2 );
    wait(var_1);

    while ( isdefined( self ) )
    {
        self rotateroll( var_0 * -1, var_1, var_1 / 2, var_1 / 2 );
        wait(var_1);
        self rotateroll( var_0, var_1, var_1 / 2, var_1 / 2 );
        wait(var_1);
    }
}

_id_B9C1( var_0 )
{
    var_1 = 1;
    var_2 = 0.05;
    var_3 = getent( "org_grate_top_left", "targetname" );
    var_4 = getent( "org_grate_bot_right", "targetname" );
    var_5 = var_3.origin[0];
    var_6 = var_4.origin[1];
    var_7 = var_4.origin[0];
    var_8 = var_3.origin[1];
    var_9 = undefined;
    var_10 = undefined;

    for ( var_11 = undefined; !common_scripts\utility::flag( "player_ready_to_be_helped_from_water" ); self.origin = var_15 )
    {
        wait(var_2);
        var_12 = level.player getnormalizedmovement();
        var_13 = anglestoforward( level.player.angles );
        var_14 = anglestoright( level.player.angles );
        var_13 *= ( var_12[0] * var_1 );
        var_14 *= ( var_12[1] * var_1 );
        var_15 = self.origin + var_13 + var_14;
        var_15 = ( var_15[0], var_15[1], var_0.origin[2] );
        var_9 = common_scripts\utility::_id_D0EA( var_15[0], var_7, var_5 );
        var_10 = common_scripts\utility::_id_D0EA( var_15[1], var_8, var_6 );
        var_11 = var_0.origin[2];
        var_15 = ( var_9, var_10, var_11 );
        self.angles = ( level.player.angles[0], level.player.angles[1], var_0.angles[2] );
    }

    if ( isdefined( var_0 ) )
        var_0 delete();

    if ( isdefined( self ) )
        self delete();
}

_id_B209()
{
    self waittillmatch( "single anim", "end" );
    common_scripts\utility::flag_set( "player_is_done_swimming" );
}

_id_AD2F( var_0, var_1 )
{
    var_0 maps\_anim::anim_first_frame_solo( self, "sdv_ride_in", "origin_animate_jnt" );
    self linkto( var_0, "origin_animate_jnt" );
    common_scripts\utility::flag_wait( "intro_anim_sequence_starting" );
    var_0 thread maps\_anim::anim_single_solo( self, "sdv_ride_in", "origin_animate_jnt" );
    self waittillmatch( "single anim", "end" );
    self notify( "finished_swim_animation" );
}

_id_CEB9()
{
    thread change_light_set_surface();
    thread animated_crane_hooks();
    thread _id_C9F3();
    thread _id_ACF7();
    thread _id_B295();
    thread _id_B0B9();
    thread _id_D45D();
    thread _id_ADBE();
    level.player thread _id_AF6A();
    common_scripts\utility::array_thread( level._id_A815, ::_id_CD1D );
    common_scripts\utility::array_thread( level._id_C977, ::_id_CD1D );
    thread _id_BB4F();
    thread _id_C46B();
    thread _id_B3F9();
    common_scripts\utility::flag_wait( "obj_stealthkill_complete" );
    thread _id_D46B();
    thread _id_BBCE( "animated_chains" );
}

_id_AFB9( var_0 )
{
    if ( !isdefined( level.player ) )
        level waittill( "level.players initialized" );

    setomnvar( "ui_divinggoggles", 1 );
    level waittill( "open_dds_door" );
    setomnvar( "ui_divinggoggles", 2 );
    common_scripts\utility::flag_wait( "player_removing_mask" );
    setomnvar( "ui_divinggoggles", 3 );
}

_id_D45D()
{
    level endon( "obj_stealthkill_complete" );
    var_0 = getent( "org_water_level", "targetname" );
    var_1 = var_0.origin[2];
    common_scripts\utility::flag_wait( "player_starting_stealth_kill" );

    for (;;)
    {
        wait 0.05;
        var_2 = level.player geteye();

        if ( var_2[2] < var_1 )
        {
            level notify( "player_is_below_water" );
            continue;
        }

        level notify( "player_is_above_water" );
    }
}

_id_BB4F()
{
    var_0 = getent( "org_stealth_kill", "targetname" );
    var_1 = [];
    var_1[0] = _id_A908( "allies", "water_helper_01" );
    var_1[1] = _id_A908( "allies", "water_helper_02" );
    var_1[0].animname = "water_helper_01";
    var_1[1].animname = "water_helper_02";
    // var_1[0] codescripts\character::setheadmodel( "h2_head_seal_udt_f_lifesaver" );
    // var_1[1] codescripts\character::setheadmodel( "h2_head_seal_udt_i_lifesaver" );
    var_0 maps\_anim::anim_first_frame( var_1, "surface_helpout" );
    common_scripts\utility::flag_wait( "player_ready_to_be_helped_from_water" );
    var_0 maps\_anim::anim_single( var_1, "surface_helpout" );
    common_scripts\utility::flag_wait( "lower_room_breached" );
    common_scripts\utility::array_thread( var_1, ::_id_BA48 );
}

_id_C46B()
{
    common_scripts\utility::flag_wait( "player_looking_at_floating_body" );
    common_scripts\utility::array_call( level._id_C8BC, ::show );
}

_id_B0B9()
{
    level endon( "player_starting_stealth_kill" );
    common_scripts\utility::flag_wait( "player_breaks_surface" );
    level._id_D489 maps\jake_tools::dialogue_execute( "oilrig_mrc1_killyou" );
    maps\_utility::flag_set_delayed( "enemy_lull_in_conversation", 1 );
    wait 0.75;
    level._id_D489 thread maps\jake_tools::dialogue_execute( "oilrig_mrc1_givemeone" );
    wait 1.5;
    level._id_C177 maps\jake_tools::dialogue_execute( "oilrig_mrc2_foff" );
    common_scripts\utility::flag_wait( "obj_stealthkill_given" );
    wait 0.4;
    level._id_D489 maps\jake_tools::dialogue_execute( "oilrig_mrc1_limoallday" );
    level._id_C177 maps\jake_tools::dialogue_execute( "oilrig_mrc2_complain" );
    level._id_D489 maps\jake_tools::dialogue_execute( "oilrig_mrc1_theitalians" );
    level._id_C177 maps\jake_tools::dialogue_execute( "oilrig_mrc2_noclue" );
}

_id_B3F9()
{
    level._id_C177 thread _id_BE77();
    level._id_D489 thread _id_BE77();
}

_id_BE77()
{
    common_scripts\utility::flag_wait( "player_starting_stealth_kill" );
    _id_B6D5( 1 );
    self waittillmatch( "single anim", "grab" );
    self playrumbleonentity();
    wait 0.05;

    if ( self.animname == "hostile_stealthkill_player" )
        thread maps\_utility::play_sound_on_entity( "grate_enemy_grabbed_grunt_01" );
    else
        thread maps\_utility::play_sound_on_entity( "grate_enemy_grabbed_grunt_02" );

    self waittillmatch( "single anim", "end" );
    self delete();
}

_id_C9F3()
{
    common_scripts\utility::flag_wait( "player_is_done_swimming" );
    common_scripts\utility::flag_wait( "enemy_lull_in_conversation" );
    _id_BAE6();
    common_scripts\utility::flag_set( "obj_stealthkill_given" );
}

_id_AF6A()
{
    var_0 = getent( "org_water_exit", "targetname" );
    var_0.origin += ( 0.0, 0.0, 10.0 );
    var_1 = getent( "org_stealth_kill", "targetname" );
    common_scripts\utility::flag_wait( "player_is_done_swimming" );
    setsaveddvar( "compass", "1" );
    level.player _id_B3BA( level._id_C02A );
    var_2 = maps\_utility::spawn_anim_model( "player_rig" );
    var_2 thread _id_C4F5();
    var_2 hide();
    var_1 maps\_anim::anim_first_frame_solo( var_2, "player_stealth_kill" );
    thread _id_B831();
    thread _id_BAB7();
    _id_C26C();
    setsaveddvar( "compass", "0" );
    level._id_C177.useable = 0;
    level.player playerlinktoblend( var_2, "tag_player", 1, 0, 0 );
    wait 0.5;
    common_scripts\utility::flag_set( "player_starting_stealth_kill" );
    var_1 thread maps\_anim::anim_single_solo( var_2, "player_stealth_kill" );
    var_2 show();
    thread water_planes_changes();
    thread drop_weapon_ai();
    var_2 waittillmatch( "single anim", "throat" );
    common_scripts\utility::flag_set( "player_slitting_throat" );
    var_2 waittillmatch( "single anim", "teleport" );
    common_scripts\utility::flag_set( "player_looking_at_floating_body" );
    soundscripts\_snd::snd_message( "aud_start_stealth_kill_amb_transition" );
    var_2 waittillmatch( "single anim", "help" );
    common_scripts\utility::flag_set( "player_ready_to_be_helped_from_water" );
    maps\_utility::flag_set_delayed( "player_pulled_halfway_out_of_water", 2 );
    maps\_utility::flag_set_delayed( "player_removing_mask", 3.15 );
    _id_B6D5( 0 );
    var_2 waittillmatch( "single anim", "end" );
    level.player unlink();
    thread maps\_utility::autosave_by_name( "rig_start" );
    var_2 delete();
    common_scripts\utility::flag_set( "player_done_being_helped_from_water" );
    thread maps\_underwater::underwater_hud_enable( 0 );
    common_scripts\utility::array_thread( level._id_C315, common_scripts\utility::pauseeffect );
    var_3 = getent( "mantle_platform", "targetname" );
    var_3 show();
    var_3 solid();
    thread _id_CBFA();
    common_scripts\utility::flag_set( "obj_stealthkill_complete" );
}

_id_BAB7()
{
    level endon( "player_starting_stealth_kill" );
    var_0 = undefined;
    var_1 = getent( "trig_player_near_grate_guard", "script_noteworthy" );
    var_2 = getent( var_1.target, "targetname" );

    for (;;)
    {
        wait 0.05;

        if ( common_scripts\utility::flag( "player_near_grate_guard" ) )
        {
            var_0 = common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), var_2.origin, level.cosine["25"] );

            if ( var_0 )
                common_scripts\utility::flag_set( "player_looking_at_grate_guard" );
            else
                common_scripts\utility::flag_clear( "player_looking_at_grate_guard" );

            continue;
        }

        common_scripts\utility::flag_clear( "player_looking_at_grate_guard" );
    }
}

_id_B831()
{
    level endon( "player_starting_stealth_kill" );
    var_0 = &"SCRIPT_PLATFORM_OILRIG_HINT_STEALTH_KILL";
    var_1 = level._id_C177;
    thread _id_CE00();

    while ( !common_scripts\utility::flag( "player_starting_stealth_kill" ) )
    {
        common_scripts\utility::flag_wait( "player_looking_at_grate_guard" );
        thread maps\_utility::hint( var_0, undefined, 100, undefined, "medium_background" );
        objective_position( 1, ( 0.0, 0.0, 0.0 ) );
        common_scripts\utility::flag_set( "player_in_position_for_stealth_kill" );

        while ( common_scripts\utility::flag( "player_looking_at_grate_guard" ) )
            wait 0.05;

        common_scripts\utility::flag_clear( "player_in_position_for_stealth_kill" );
        thread maps\_utility::hint_fade();
        objective_position( 1, var_1.origin );
    }

    thread maps\_utility::hint_fade();
}

_id_CE00()
{
    common_scripts\utility::flag_wait( "player_starting_stealth_kill" );
    thread maps\_utility::hint_fade();
}

_id_C26C()
{
    while ( !common_scripts\utility::flag( "player_starting_stealth_kill" ) )
    {
        wait 0.05;

        if ( common_scripts\utility::flag( "player_looking_at_grate_guard" ) && level.player meleebuttonpressed() )
            break;
    }
}

_id_CBFA()
{
    level notify( "player_in_water" );
    level endon( "player_out_of_water" );
    thread _id_D56C();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player _meth_830F( 0 );
    level.player allowjump( 0 );
    level.player _id_B3BA( level._id_C02A );
    level.player disableweapons();
    var_0 = getent( "trig_out_of_water", "targetname" );
    var_0 waittill( "trigger" );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player _meth_830F( 1 );
    level.player allowjump( 1 );
    level.player _id_B3BA( level._id_AF1A );
    level.player enableweapons();
    common_scripts\utility::flag_clear( "player_turn_rate_slowed" );
    var_1 = getent( "trig_in_water", "targetname" );

    while ( level.player istouching( var_1 ) )
        wait 0.05;

    thread _id_B916();
}

_id_B916()
{
    level notify( "player_out_of_water" );
    level endon( "player_in_water" );
    level endon( "lower_decks_closed_off" );
    thread _id_BD07();
    var_0 = getent( "trig_in_water", "targetname" );
    var_0 waittill( "trigger" );
    level.player thread common_scripts\utility::play_sound_in_space( "splash_player_water_enter" );
    thread _id_CBFA();
}

_id_C4F5()
{
    common_scripts\utility::flag_wait( "player_starting_stealth_kill" );
    wait 2.8;
}

_id_CD1D()
{
    var_0 = getent( "org_stealth_kill", "targetname" );
    self waittill( "finished_swim_animation" );
    self unlink();

    if ( self.animname == "sdv02_pilot" )
        level._id_BA99 thread maps\_anim::anim_loop_solo( self, "surface_idle", "stop_idle" );
    else
        var_0 thread maps\_anim::anim_loop_solo( self, "surface_idle", "stop_idle" );

    if ( self.animname == "sdv02_pilot" )
        thread _id_C0BF();
    else
    {
        common_scripts\utility::flag_wait( "player_looking_at_floating_body" );
        self delete();
    }
}

_id_ADBE()
{
    common_scripts\utility::flag_wait( "player_ready_to_be_helped_from_water" );
    var_0 = getent( "node_gear_takeoff", "targetname" );
    var_0 maps\_anim::anim_generic_first_frame( level._id_C280, "oilrig_seal_surface_rebreather_off_guy2" );
    var_0 maps\_anim::anim_generic_first_frame( level._id_BBBD, "oilrig_seal_surface_rebreather_off_guy1" );
    var_1 = undefined;

    foreach ( var_3 in level.team2 )
    {
        if ( isdefined( var_3.script_noteworthy ) && var_3.script_noteworthy == "mask_remove_guy" )
        {
            var_1 = var_3;
            break;
        }
    }

    var_1 maps\_anim::anim_generic_first_frame( var_1, "oilrig_seal_surface_mask_off" );
    var_5 = spawn( "script_origin", var_1 gettagorigin( "TAG_ORIGIN" ) );
    var_5.angles = var_1 gettagangles( "TAG_ORIGIN" );
    thread maps\oilrig_anim::_id_AD4E( "mask_off_oilrig_seal_surface_mask_off", "oilrig_seal_surface_mask_off_prop", var_5, "player_pulled_halfway_out_of_water" );
    var_1 setgoalpos( var_1.origin );
    level._id_C280.disableexits = 1;
    level._id_BBBD.disableexits = 1;
    level._id_C280.disablearrivals = 1;
    level._id_BBBD.disablearrivals = 1;
    level._id_BBBD._id_D056 = level._id_BBBD.interval;
    level._id_BBBD.interval = 40;
    level._id_C280._id_D056 = level._id_BBBD.interval;
    level._id_C280.interval = 40;
    var_0 maps\_anim::anim_generic_first_frame( level._id_C280, "oilrig_seal_surface_rebreather_off_guy2" );
    var_0 maps\_anim::anim_generic_first_frame( level._id_BBBD, "oilrig_seal_surface_rebreather_off_guy1" );
    thread maps\oilrig_anim::_id_AD4E( "rebreather_off_oilrig_seal_surface_rebreather_off_guy2", "oilrig_seal_surface_rebreather_off_guy2_prop", var_0, "player_done_being_helped_from_water" );
    thread maps\oilrig_anim::_id_AD4E( "rebreather_off_oilrig_seal_surface_rebreather_off_guy1", "oilrig_seal_surface_rebreather_off_guy1_prop", var_0, "player_done_being_helped_from_water" );
    common_scripts\utility::flag_wait( "player_pulled_halfway_out_of_water" );
    var_1 thread maps\_utility::play_sound_on_entity( "oilrig_seal_surface_mask_off" );
    var_1 thread maps\_anim::anim_generic( var_1, "oilrig_seal_surface_mask_off" );
    common_scripts\utility::flag_wait( "player_done_being_helped_from_water" );
    var_0 thread maps\_anim::anim_generic( level._id_C280, "oilrig_seal_surface_rebreather_off_guy2" );
    var_0 maps\_anim::anim_generic( level._id_BBBD, "oilrig_seal_surface_rebreather_off_guy1" );
    wait 2;
    level._id_C280.disableexits = 0;
    level._id_BBBD.disableexits = 0;
    level._id_C280.disablearrivals = 0;
    level._id_BBBD.disablearrivals = 0;
    common_scripts\utility::flag_wait( "player_at_lower_breach" );
    level._id_C280.interval = level._id_C280._id_D056;
    level._id_BBBD.interval = level._id_BBBD._id_D056;
    common_scripts\utility::flag_wait( "lower_room_breached" );
    var_1 thread _id_BA48();
    var_5 delete();
}

_id_B03A( var_0 )
{
    level endon( "player_approaching_gear_friendlies" );
    level endon( "player_looking_at_gear_friendlies" );
    var_1 = undefined;

    for (;;)
    {
        wait 0.05;
        var_1 = common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), var_0.origin, level.cosine["25"] );

        if ( var_1 )
            common_scripts\utility::flag_set( "player_looking_at_gear_friendlies" );
    }
}

_id_C0BF()
{
    var_0 = [];
    var_0[0] = self;
    var_0[1] = level._id_C177;
    var_0[2] = level._id_D489;
    common_scripts\utility::flag_wait( "player_starting_stealth_kill" );
    level._id_BA99 notify( "stop_idle" );
    level._id_BA99 maps\_anim::anim_single( var_0, "stealth_kill" );
    self waittillmatch( "single anim", "end" );

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self delete();
    var_1 = undefined;

    foreach ( var_3 in level.team2 )
    {
        if ( isdefined( var_3.script_noteworthy ) && var_3.script_noteworthy == "fin_remove_guy" )
        {
            var_1 = var_3;
            break;
        }
    }

    level._id_BA99 maps\_anim::anim_generic_first_frame( var_1, "oilrig_seal_surface_fins_off" );
    thread maps\oilrig_anim::_id_AD4E( "fins_off_oilrig_seal_surface_fins_off", "oilrig_seal_surface_fins_off_prop", level._id_BA99, "player_ready_to_be_helped_from_water" );
    var_1 setgoalpos( var_1.origin );
    common_scripts\utility::flag_wait( "player_ready_to_be_helped_from_water" );
    var_1 thread maps\_utility::play_sound_on_entity( "oilrig_seal_surface_fins_off" );
    level._id_BA99 maps\_anim::anim_generic( var_1, "oilrig_seal_surface_fins_off" );
    var_1 maps\_utility::enable_ai_color();
    common_scripts\utility::flag_wait( "lower_room_breached" );
    var_1 thread _id_BA48();
}

_id_D46B()
{
    level.slomobasevision = "oilrig";
    maps\jake_tools::triggersenable( "colornodes_rig", "script_noteworthy", 1 );
    thread _id_B233( 1 );
    thread _id_B581();
    thread _id_BFE5();
    thread _id_CD97();
    thread _id_CE03();
    thread _id_B03B();
    thread _id_D555();
    thread _id_CB54();
    thread _id_CECE();
    thread _id_C25D();
    thread _id_BFFD( "lower_room_breached", "lower_room_cleared" );
    thread friendlies_pushplayer_until( [ "railing_patroller_dead", "player_at_lower_breach", "player_looking_at_railing" ] );
    var_0 = _id_A908( "allies", "water_helper_01" );
    var_0 common_scripts\utility::delaycall( 10, ::pushplayer, 0 );
    thread breach_a_hide_objects();
    common_scripts\utility::flag_wait( "lower_room_cleared" );
    thread friendlies_pushplayer_until( "player_above_first_breach_room" );
    thread garage_door_think();
    thread animated_palette();
    disableforcedsunshadows();
    thread _id_D174();
}

friendlies_pushplayer_until( var_0 )
{
    var_1 = maps\_utility::array_removedead( level._id_C8BC );
    common_scripts\utility::array_call( var_1, ::pushplayer, 1 );

    if ( isarray( var_0 ) )
        common_scripts\utility::flag_wait_any_in_array( var_0 );
    else
        common_scripts\utility::flag_wait( var_0 );

    var_1 = maps\_utility::array_removedead( var_1 );
    common_scripts\utility::array_call( var_1, ::pushplayer, 0 );
}

_id_C25D()
{
    common_scripts\utility::flag_wait( "player_at_lower_breach" );
    common_scripts\utility::flag_wait( "follow_team_in_stairs_after_deck1_breach" );
    _id_C43C();
    common_scripts\utility::flag_wait( "lower_room_breached" );
    _id_C79E();
}

_id_BFE5()
{
    common_scripts\utility::flag_wait( "lower_room_breached" );
    var_0 = getent( "volume_first_room", "script_noteworthy" );
    wait 2;
    var_1 = getnode( "node_deck1_door", "targetname" );
    level._id_AC03 maps\_utility::disable_ai_color();
    common_scripts\utility::flag_wait( "lower_room_cleared" );
    wait 0.5;
    level._id_AC03 setgoalnode( var_1 );
    var_2 = getent( "door_deck1", "targetname" );
    var_2 delete();
    var_3 = getent( "door_deck1_animated", "targetname" );
    var_3 hide();
    var_4 = getent( "breachB_hide_vent", "targetname" );
    var_4 notsolid();
    var_4 hide();
    common_scripts\utility::flag_wait( "player_approaching_deck1" );
    level._id_AC03 maps\_utility::enable_ai_color();
}

_id_B509( var_0 )
{
    for (;;)
    {
        wait 0.05;

        while ( common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), self.origin, level.cosine["45"] ) )
            wait 0.1;

        if ( distance( self.origin, level.player.origin ) > 512 )
            break;
    }

    self forceteleport( var_0.origin, var_0.angles );
    self setgoalpos( self.origin );
    self setgoalnode( var_0 );
}

_id_CD97()
{
    common_scripts\utility::flag_wait( "player_at_lower_breach" );
    var_0 = getent( "origin_breach1_dialogue", "targetname" );
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "oilrig_muffled_1st_breach_voices" );
    var_1 = getentarray( "hostiles_ambient_breach1", "targetname" );
    var_2 = maps\_utility::array_spawn( var_1 );
    common_scripts\utility::array_thread( var_2, ::_id_ABE3, var_0 );
    level waittill( "A door in breach group 100 has been activated." );
    thread _id_B151();
    thread maps\oilrig_aud::_id_D59D();
    common_scripts\utility::array_call( var_2, ::delete );
    level waittill( "breach_explosion" );
    common_scripts\utility::flag_set( "lower_room_breached" );
    var_0 notify( "stop soundoilrig_muffled_1st_breach_voices" );
    thread _id_D510( var_0, 100 );
}

_id_AFD8()
{
    level endon( "player_at_lower_breach" );
    wait(randomfloatrange( 4, 6 ));

    while ( common_scripts\utility::flag( "player_dealing_with_rail" ) )
        wait 0.5;

    maps\_utility::radio_dialogue( "oilrig_nsl_keepittight" );
    wait(randomfloatrange( 6, 8 ));

    while ( common_scripts\utility::flag( "player_dealing_with_rail" ) )
        wait 0.5;

    maps\_utility::radio_dialogue( "oilrig_nsl_readyweapons" );
    wait(randomfloatrange( 6, 8 ));

    while ( common_scripts\utility::flag( "player_dealing_with_rail" ) )
        wait 0.5;

    maps\_utility::radio_dialogue( "oilrig_nsl_moveup2" );
}

_id_CB54()
{
    level endon( "mission failed" );
    maps\_utility::radio_dialogue( "oilrig_nsl_sect1alpha" );
    maps\_utility::radio_dialogue( "oilrig_sbc_rogerhtlsix" );
    common_scripts\utility::flag_set( "obj_hostages_secure_given" );
    thread _id_BBC9();
    thread _id_AFD8();
    common_scripts\utility::flag_wait( "railing_patroller_dead" );
    wait 2;
    maps\_utility::radio_dialogue( "oilrig_roomclear_ghost_03" );
    common_scripts\utility::flag_wait( "player_at_lower_breach" );
    maps\_utility::radio_dialogue( "oilrig_sbc_civilhostages" );
    maps\_utility::radio_dialogue( "oilrig_nsl_tm1tobreach" );
    thread _id_BF10( 100 );
    common_scripts\utility::flag_wait( "lower_room_cleared" );
    maps\_utility::radio_dialogue( "oilrig_roomclear_ghost_05" );
    maps\_utility::radio_dialogue( "oilrig_nsl_wereclear" );
    var_0 = randomint( 2 );
    maps\_utility::radio_dialogue( "oilrig_hostsec_0" + var_0 );
    common_scripts\utility::flag_set( "lower_room_cleared" );
    maps\_utility::radio_dialogue( "oilrig_sbc_secandevac" );
    maps\_utility::radio_dialogue( "oilrig_deck2_movenag_start" );
    common_scripts\utility::flag_set( "start_nagging_to_go_to_deck1" );
    common_scripts\utility::flag_wait( "player_above_first_breach_room" );
    maps\_utility::radio_dialogue( "oilrig_nsl_eyesopen" );
}

_id_CECE()
{
    level endon( "upper_room_breached" );
    common_scripts\utility::flag_wait( "start_nagging_to_go_to_deck1" );
    var_0 = getent( "volume_first_room", "script_noteworthy" );

    while ( !common_scripts\utility::flag( "upper_room_breached" ) )
    {
        if ( level.player istouching( var_0 ) )
            _id_BCF6();

        wait(randomfloatrange( 8, 14 ));
    }
}

_id_BCF6()
{
    var_0 = randomint( 4 );
    maps\_utility::radio_dialogue( "room1_manhandler_nag_0" + var_0 );
}

_id_BBC9()
{
    level endon( "mission failed" );
    level endon( "railing_patroller_dead" );
    common_scripts\utility::array_thread( level.players, ::_id_BE0C );
    common_scripts\utility::flag_wait_either( "player_looking_at_railing", "player_at_lower_breach" );

    if ( !common_scripts\utility::flag( "railing_patroller_dead" ) )
    {
        common_scripts\utility::flag_set( "player_dealing_with_rail" );
        maps\_utility::radio_dialogue( "oilrig_ns1_visbyrailing" );
        common_scripts\utility::flag_clear( "player_dealing_with_rail" );
    }

    if ( !common_scripts\utility::flag( "railing_patroller_dead" ) )
    {
        common_scripts\utility::flag_set( "player_dealing_with_rail" );
        maps\_utility::radio_dialogue( "oilrig_nsl_suppweapons" );
        common_scripts\utility::flag_clear( "player_dealing_with_rail" );
    }
}

_id_BE0C()
{
    self endon( "death" );
    level endon( "railing_patroller_dead" );
    level endon( "player_at_lower_breach" );
    level endon( "player_looking_at_railing" );
    var_0 = getent( "railing_org", "targetname" );

    for (;;)
    {
        wait 0.25;

        if ( self adsbuttonpressed() )
        {
            var_1 = self geteye();

            if ( common_scripts\utility::within_fov( var_1, self getplayerangles(), var_0.origin, level.cosine["25"] ) )
                common_scripts\utility::flag_set( "player_looking_at_railing" );
        }
    }
}

_id_D5B0( var_0 )
{
    var_1 = var_0[0];
    _id_A80B( var_1 );
    var_2 = spawnstruct();
    var_2.origin = var_1.origin;
    var_2.angles = var_1.angles;
    return var_2;
}

_id_A80B( var_0 )
{
    var_0._id_A8BA = 1;

    if ( isdefined( var_0.magic_bullet_shield ) )
        var_0 maps\_utility::stop_magic_bullet_shield();

    common_scripts\utility::flag_set( "railing_patroller_dead" );
}

_id_AB46( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self.alertlevel = var_0;
        waitframe();
    }
}

_id_B03B()
{
    level endon( "stealth_broken" );
    var_0 = getentarray( "hostile_railing", "targetname" );
    var_1 = var_0[randomintrange( 0, 2 )];
    var_2 = var_1 maps\_utility::spawn_ai();
    var_2.ignoreme = 1;
    var_2.animname = "generic";
    var_2 maps\_props::attach_cig_self();
    thread delete_railing_guy( var_2 );
    var_2._id_A8BA = 0;
    var_2 thread _id_AB46( "noncombat" );
    var_2 thread dof_takedown_smoking_guy();
    level.player thread maps\_utility::_id_C92C( [ var_2 ], "smoker_takedown", 130, 45, 60, 0, 0.25, ::_id_D5B0, undefined, "weapon_parabolic_knife", undefined, undefined, undefined, undefined, 4 );
    var_2 thread _id_C503();
    level._id_C29C = var_2;
    var_3 = getnode( var_2.target, "targetname" );
    var_3 thread maps\_anim::anim_generic_loop( var_2, "oilrig_balcony_smoke_idle", "stop_idle" );
    var_2 thread maps\_utility::magic_bullet_shield();
    thread _id_AED6( var_2 );
    var_2 thread _id_AD25( var_3 );
    var_2 thread _id_CA0D();
    var_2 waittill( "damage" );

    if ( var_2._id_A8BA == 0 )
    {
        var_2 setcontents( 0 );
        var_2._id_D4A8 = 1;
        level.player._id_CD51 = 0;
        common_scripts\utility::flag_set( "railing_patroller_dead" );
        thread _id_CB3F();
        var_3 notify( "stop_idle" );
        var_3 thread common_scripts\utility::play_sound_in_space( "railing_death_sound" );

        if ( isdefined( var_2.magic_bullet_shield ) )
            var_2 maps\_utility::stop_magic_bullet_shield();

        var_2._id_CB51 = 1;
        var_3 maps\_anim::anim_generic( var_2, "railing_death" );
        level.player._id_CD51 = undefined;
    }
}

_id_CA0D()
{
    self endon( "stealth_takedown_started" );
    self endon( "death" );
    level endon( "railing_patroller_dead" );
    self endon( "stealth_takedown_started" );
    var_0 = 90000;
    var_1 = 1225;

    for (;;)
    {
        var_2 = distancesquared( self.origin, level.player.origin );

        if ( level.player issprinting() && var_2 < var_0 || var_2 < var_1 )
            break;

        waitframe();
    }

    level notify( "stealth_broken" );
    var_3 = getnode( self.target, "targetname" );
    var_3 notify( "stop_idle" );
    self notify( "stop_idle" );
    maps\_utility::anim_stopanimscripted();
    maps\_utility::battlechatter_on( "axis" );
    _id_D432();
}

_id_CB3F()
{
    var_0 = getentarray( "first_breach_safe_volumes", "targetname" );

    foreach ( var_2 in var_0 )
        var_2.origin += ( 0.0, 0.0, 20000.0 );
}

_id_AD25( var_0 )
{
    if ( !isdefined( self ) )
        return;

    level endon( "railing_patroller_dead" );
    level waittill( "stealth_broken" );
    var_0 notify( "stop_idle" );
    self notify( "stop_idle" );
    thread maps\_utility::play_sound_on_tag_endon_death( "RU_1_resp_ack_co_gnrc_affirm_custom", "j_head" );
    maps\_utility::anim_stopanimscripted();
    maps\_utility::battlechatter_on( "axis" );
    _id_D432();
}

_id_C503()
{
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    self waittill( "damage" );

    if ( isdefined( self ) && !_func_2A5( self ) )
        self.ignore_safe_volume = 1;

    self waittillmatch( "single anim", "splash" );
    var_0.origin = self.origin;
    playfx( common_scripts\utility::getfx( "body_splash_railing" ), var_0.origin );
    var_0 maps\_utility::play_sound_on_entity( "scn_body_splash" );
    wait 10;
    var_0 delete();
}

_id_A81A()
{
    self._id_BAEC = 1;
    wait 0.5;
    self waittill( "goal" );
    level waittill( "A door in breach group 100 has been activated." );
    self pushplayer( 0 );
    thread maps\_anim::anim_single_solo( self, "breach_react" );
    self._id_BAEC = undefined;
}

_id_D555()
{
    common_scripts\utility::flag_wait( "player_at_lower_breach" );
    common_scripts\utility::flag_wait( "railing_patroller_dead" );
    maps\jake_tools::triggersenable( "colornodes_lower_breach", "script_noteworthy", 1 );
    maps\_utility::activate_trigger_with_noteworthy( "colornodes_lower_breach" );
    wait 1.5;
    var_0 = getnode( "node_railing_friendly", "targetname" );
    var_0 notify( "stop_idle" );
    level._id_AC03 notify( "stop_idle" );
    level._id_AC03 maps\_utility::enable_ai_color();
    level._id_AC03.goalradius = 8;
    level._id_AC03 maps\_slowmo_breach::add_slowmo_breacher();
    thread maps\_utility::autosave_by_name( "lower_breach" );
    level._id_AC03 thread _id_A81A();
    level waittill( "A door in breach group 100 has been activated." );
    var_1 = getent( "volume_first_room", "script_noteworthy" );
    level._id_CCFA = getnodearray( "node_hostage_bottom", "targetname" );
    level waittill( "slowmo_breach_friendlies_assigned" );
    var_2 = [];

    if ( isdefined( var_1.breaching_friendly1 ) )
    {
        var_2[var_2.size] = var_1.breaching_friendly1;
        var_1.breaching_friendly1.friendly_breach_finished_flag = "friendly1_lower_breach_done";
    }

    if ( isdefined( var_1.breaching_friendly2 ) )
    {
        var_2[var_2.size] = var_1.breaching_friendly2;
        var_1.breaching_friendly2.friendly_breach_finished_flag = "friendly2_lower_breach_done";
    }

    common_scripts\utility::flag_wait( "lower_room_cleared" );
    common_scripts\utility::array_thread( level._id_BF0A, maps\_utility::restarteffect );
    wait 1;

    foreach ( var_4 in var_2 )
    {
        if ( isalive( var_4 ) && isdefined( var_4.friendly_breach_finished_flag ) )
        {
            common_scripts\utility::flag_wait( var_4.friendly_breach_finished_flag );
            var_4.friendly_breach_finished_flag = undefined;
        }
    }

    var_6 = getent( "deck1_after_breach_stairs_transition", "script_noteworthy" );
    var_6 thread sync_allies_in_deck1_stairs_after_breach();
    var_6 common_scripts\utility::trigger_on();
    maps\jake_tools::triggersenable( "colornodes_after_lower_breach", "script_noteworthy", 1 );
    maps\jake_tools::triggersenable( "colornodes_deck1", "script_noteworthy", 1 );
    maps\_utility::activate_trigger_with_noteworthy( "colornodes_after_lower_breach" );
    thread maps\_utility::autosave_by_name( "lower_breach_finished" );
}

sync_allies_in_deck1_stairs_after_breach()
{
    self endon( "death" );
    var_0 = [];

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( common_scripts\utility::array_contains( var_0, var_1 ) )
            continue;

        var_0[var_0.size] = var_1;

        if ( var_0.size >= 2 )
        {
            common_scripts\utility::flag_set( "follow_team_in_stairs_after_deck1_breach" );
            self delete();
        }
    }
}

_id_AED6( var_0 )
{
    level endon( "railing_patroller_dead" );
    var_0 endon( "stealth_takedown_started" );
    var_1 = getnode( "node_railing_friendly", "targetname" );
    level._id_AC03 maps\_utility::disable_ai_color();
    level._id_AC03 pushplayer( 1 );
    level._id_AC03 setgoalnode( var_1 );
    level._id_AC03 maps\_slowmo_breach::remove_slowmo_breacher();
    var_1 maps\_anim::anim_generic_reach( level._id_AC03, "railing_execute_reach" );
    var_1 maps\_anim::anim_generic( level._id_AC03, "railing_execute_reach" );
    var_1 thread maps\_anim::anim_generic_loop( level._id_AC03, "railing_execute_idle", "stop_idle" );
    common_scripts\utility::flag_wait_either( "player_alerted_railing", "player_broke_stealth" );
    wait 5;
    level._id_AC03 thread _id_B29D( var_0, var_1 );
}

_id_B29D( var_0, var_1 )
{
    self notify( "stop_idle" );
    var_1 notify( "stop_idle" );
    var_1 thread maps\_anim::anim_generic( self, "railing_execute_shoot" );
    var_2 = var_0 gettagorigin( "tag_eye" );
    magicbullet( self.weapon, self gettagorigin( "tag_flash" ), var_2 );
    thread common_scripts\utility::play_sound_in_space( "bullet_impact_headshot", var_2 );
    bullettracer( self gettagorigin( "tag_flash" ), var_2, 1 );
    self waittillmatch( "single anim", "end" );
    var_1 thread maps\_anim::anim_generic_loop( level._id_AC03, "railing_execute_idle", "stop_idle" );
}

_id_D174()
{
    common_scripts\utility::array_thread( getentarray( "triggers_deck1_hall", "targetname" ), common_scripts\utility::trigger_on );
    thread _id_BFFD( "upper_room_breached", "upper_room_cleared" );
    thread _id_C8E6();
    thread _id_A8C7();
    thread _id_D24E();
    thread _id_B1B0();
    thread _id_C39C();
    thread _id_CB45();
    thread _id_C37E();
    thread _id_BB17();
    thread _id_D2C4();
    thread _id_CCC1();
    thread _id_AB96();
    thread _id_D360();
    thread _id_B8A9();
    thread _id_B57B();
    thread _id_C1A8();
    thread _id_D26C();
    thread _id_B2DB();
    thread friendly_c4_react();
    thread breach_b_hide_objects();
}

friendly_c4_react()
{
    var_0 = getent( "c4_origin", "targetname" );
    var_1 = level.squad;
    common_scripts\utility::flag_wait( "ambush_c4_triggered" );

    foreach ( var_3 in var_1 )
    {
        if ( distancesquared( var_0.origin, var_3.origin ) < 250000 )
        {
            var_3 maps\_utility::setflashbangimmunity( 0 );
            var_4 = randomfloatrange( 4.5, 6.5 );
            var_3 thread maps\_utility::flashbangstart( var_4 );
            var_3 maps\_utility::setflashbangimmunity( 1 );
        }
    }
}

_id_C8E6()
{
    common_scripts\utility::flag_wait( "lower_room_cleared" );
    _id_C43C();
    thread _id_BF62();
    common_scripts\utility::flag_wait( "upper_room_breached" );
    _id_C79E();
    thread _id_D432();
}

_id_B1B0()
{
    common_scripts\utility::flag_wait( "player_ignoring_heli_flyby" );
    var_0 = getent( "origin_ambush_discovery_dialogue", "targetname" );
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "oilrig_muffled_2nd_breach_voices" );
    var_1 = getentarray( "hostiles_ambient_deckbreach", "targetname" );
    var_2 = maps\_utility::array_spawn( var_1 );
    common_scripts\utility::array_thread( var_2, ::_id_ABE3, var_0 );
    level waittill( "A door in breach group 200 has been activated." );
    thread _id_A9D6();
    thread _id_B151();
    thread maps\oilrig_aud::_id_CC29();
    common_scripts\utility::array_call( var_2, ::delete );
    level waittill( "breach_explosion" );
    common_scripts\utility::flag_set( "upper_room_breached" );
    var_0 notify( "stop soundoilrig_muffled_2nd_breach_voices" );
    thread _id_D510( var_0, 200 );
}

_id_A9D6()
{
    var_0 = getent( "volume_first_room", "script_noteworthy" );
    var_1 = var_0 maps\_utility::get_ai_touching_volume();

    if ( var_1.size )
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3 != level._id_AC03 )
            {
                if ( isdefined( var_3.magic_bullet_shield ) )
                    var_3 maps\_utility::stop_magic_bullet_shield();

                var_3 delete();
            }
        }
    }
}

_id_C39C()
{
    common_scripts\utility::flag_wait( "player_approaching_deck1" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "heli_patrol_02" );
    var_0 thread _id_C53D();
    var_0 thread maps\oilrig_aud::vehicle_turn_engine_off();
    common_scripts\utility::flag_wait( "player_at_door_to_deck1" );
    thread maps\_vehicle::gopath( var_0 );
    var_0 thread maps\oilrig_aud::heli_patrol_02_flyby();
    common_scripts\_exploder::exploder( 200 );
    thread _id_B233( 1 );
    var_0 waittill( "reached_dynamic_path_end" );
    var_0 delete();
}

_id_BB17()
{
    level endon( "mission failed" );
    level endon( "player_at_door_to_deck1" );
    common_scripts\utility::flag_wait( "player_approaching_deck1" );
    maps\_utility::radio_dialogue( "oilrig_sbc_lowprofile" );
    maps\_utility::radio_dialogue( "oilrig_nsl_rogerthat" );
}

_id_D2C4()
{
    level endon( "mission failed" );
    common_scripts\utility::flag_wait( "player_at_door_to_deck1" );
    thread maps\oilrig_aud::deck_1_disable_enemy_battlechatter();
    _id_D28F();
    level endon( "player_ignoring_heli_flyby" );
    wait 4.5;
    common_scripts\utility::flag_set( "heli_flyby_finished" );
    level endon( "player_at_last_breach_building" );

    if ( !common_scripts\utility::flag( "player_at_last_breach_building" ) )
        _id_AECF();
}

_id_CB45()
{
    level waittill( "A door in breach group 200 has been activated." );
    level.player _id_B3BA( 1 );
}

_id_C37E()
{
    common_scripts\utility::flag_wait_either( "heli_flyby_finished", "player_ignoring_heli_flyby" );
    level.slomobasevision = "oilrig";
    maps\jake_tools::triggersenable( "colornodes_upper_room_setup", "script_noteworthy", 1 );
    maps\_utility::activate_trigger_with_noteworthy( "colornodes_upper_room_setup" );
    var_0 = getentarray( "breach_upper_desk", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_AC1B );
    var_1 = getentarray( "ambush_damage_triggers", "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_C064 );
}

_id_C064()
{
    common_scripts\utility::flag_wait( "ambush_c4_triggered" );
    wait 2;
    thread _id_A8DE();
}

_id_AC1B()
{
    level endon( "upper_room_cleared" );

    while ( !common_scripts\utility::flag( "upper_room_cleared" ) )
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( var_0.team ) && var_0.team == "axis" )
        {
            radiusdamage( self.origin, self.radius, 500, 500 );
            break;
        }
    }
}

_id_CCC1()
{
    level endon( "mission failed" );
    var_0 = getent( "volume_ambush_room", "script_noteworthy" );
    var_0 endon( "breached" );
    common_scripts\utility::flag_wait( "player_at_last_breach_building" );
    thread maps\_utility::autosave_by_name( "deck1_breach" );
    maps\_utility::radio_dialogue( "oilrig_sbc_hostatposition" );
    level._id_AC03 maps\jake_tools::dialogue_execute( "oilrig_nsl_copythat" );
    wait 4;
    thread _id_BF10( 200 );
}

_id_B8A9()
{
    level endon( "mission failed" );
    level endon( "missionfailed" );
    thread _id_B980();
    var_0 = level.player;
    var_1 = getent( "volume_ambush_room", "script_noteworthy" );
    level waittill( "A door in breach group 200 has been activated." );
    common_scripts\utility::array_thread( level._id_B077, common_scripts\utility::pauseeffect );
    common_scripts\utility::array_thread( level._id_C315, common_scripts\utility::pauseeffect );
    common_scripts\utility::array_thread( level._id_D47A, common_scripts\utility::pauseeffect );
    common_scripts\utility::flag_wait( "upper_room_breached" );
    var_2 = [];
    var_2[0] = getent( "origin_c4_friendly", "targetname" );
    var_2[1] = getent( "origin_c4_friendly2", "targetname" );
    var_3 = [];
    var_3[0] = getnode( "ambush_guard_01", "targetname" );
    var_3[1] = getnode( "ambush_guard_02", "targetname" );
    var_4 = common_scripts\utility::getfarthest( level.player.origin, var_2 );
    var_5 = common_scripts\utility::getfarthest( level.player.origin, var_3 );
    common_scripts\utility::flag_set( "lower_decks_closed_off" );
    var_6 = getent( "door_deck1_animated", "targetname" );
    var_6 show();
    var_6.animname = "door";
    var_6 maps\_anim::setanimtree();
    var_7 = getent( "breachB_hide_vent", "targetname" );
    var_7 show();
    var_8 = getentarray( "bottom_deck_destructibles", "script_noteworthy" );
    common_scripts\utility::array_thread( var_8, ::_id_D079 );
    var_9 = getnodearray( "node_team2_scaffolding", "targetname" );
    level.team2 = maps\_utility::array_spawn( getentarray( "team2_escort", "targetname" ), 1 );
    level.team2[0] thread maps\_utility::teleport_ai( var_9[0] );
    level.team2[1] thread maps\_utility::teleport_ai( var_9[1] );
    common_scripts\utility::flag_wait( "upper_room_cleared" );
    common_scripts\utility::array_thread( level._id_D47A, maps\_utility::restarteffect );
    thread maps\_utility::autosave_by_name( "deck1_breach_finished" );
    var_10 = [];
    var_10[0] = level._id_C280;
    var_10[1] = level._id_BBBD;
    var_11 = common_scripts\utility::getfarthest( level.player.origin, var_10 );
    var_11 thread _id_B5D1( var_4, var_5 );
    common_scripts\utility::flag_set( "obj_hostages_secure_complete" );
    maps\_utility::radio_dialogue( "oilrig_roomclear_ghost_05" );
    maps\_utility::radio_dialogue( "oilrig_nsl_clear" );
    level._id_AC03 maps\jake_tools::dialogue_execute( "oilrig_nsl_strongholdsec" );
    level._id_AC03 maps\_utility::cqb_walk( "off" );
    level._id_AC03 clearenemy();
    level._id_C280 maps\_utility::cqb_walk( "off" );
    level._id_C280 clearenemy();
    level._id_BBBD maps\_utility::cqb_walk( "off" );
    level._id_BBBD clearenemy();
    level._id_AC03.alertlevel = "noncombat";
    level._id_C280.alertlevel = "noncombat";
    level._id_BBBD.alertlevel = "noncombat";
    var_12 = getent( "pa_speaker", "targetname" );
    var_12 maps\_utility::play_sound_on_entity( "oilrig_enc_maerhoffer" );
    maps\_utility::radio_dialogue( "oilrig_ns1_havecompany" );
    level._id_AC03 thread maps\jake_tools::dialogue_execute( "oilrig_nsl_goingloud" );
    var_12 maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "oilrig_enc_team5" );
    wait 2;
    thread _id_A8C1( var_1 );
    common_scripts\utility::flag_set( "obj_c4_ambush_plant_given" );
    thread maps\_utility::autosave_by_name( "obj_c4_ambush_plant_given" );
    wait 2;
    level._id_AC03 thread _id_BD9E();
    common_scripts\utility::flag_wait( "player_has_started_planting_c4" );
    level._id_AC03.alertlevel = "alert";
    level._id_C280.alertlevel = "alert";
    level._id_BBBD.alertlevel = "alert";
    level._id_C280 maps\_utility::cqb_walk( "on" );
    level._id_BBBD maps\_utility::cqb_walk( "on" );
    common_scripts\utility::flag_wait_or_timeout( "obj_c4_ambush_plant_complete", 6 );

    if ( !common_scripts\utility::flag( "obj_c4_ambush_plant_complete" ) )
        common_scripts\utility::flag_set( "obj_c4_ambush_plant_complete" );

    thread _id_BA8F();
    thread maps\_utility::autosave_by_name( "c4_planted" );
    thread _id_C0EC();
    maps\_utility::radio_dialogue( "oilrig_ns2_c4placed" );
    maps\jake_tools::triggersenable( "colornodes_ambush_setup", "script_noteworthy", 1 );
    maps\_utility::activate_trigger_with_noteworthy( "colornodes_ambush_setup" );
    thread _id_D4D5();
    thread maps\_utility::radio_dialogue( "oilrig_nsl_ambushthem" );
    common_scripts\utility::flag_set( "obj_ambush_given" );
    thread _id_CF35();
    common_scripts\utility::flag_wait( "ambush_enemies_spawned" );
    level._id_AC03 thread _id_CD02( "m4m203_reflex" );
    level._id_C280 thread _id_CD02( "mp5_reflex" );
    level._id_BBBD thread _id_CD02( "mp5_reflex" );
    thread _id_B233();
    _id_BF62();
    common_scripts\utility::flag_wait_either( "ambush_enemies_alerted", "ambush_enemies_alerted_prematurely" );
    thread _id_B151();
    wait 1;
    _id_D432();
    _id_BA1D( "dummy_spawner_ballsout_intro" );
    thread _id_B50A();
    common_scripts\utility::flag_wait( "player_passing_ambush_gate" );
    thread maps\_utility::autosave_by_name( "past_ambush_gate" );
}

_id_D4D5()
{
    var_0 = spawn( "script_origin", ( 1553.33, 208.546, -1055.5 ) );
    var_0 maps\_anim::anim_reach_solo( level._id_AC03, "soap_go_up_scaffolding" );
    common_scripts\utility::flag_set( "soap_reached_scaffold" );
    var_0 = spawn( "script_origin", ( 1642.48, 135.2, -1055.5 ) );
    var_0 maps\_anim::anim_generic( level._id_AC03, "soap_go_up_scaffolding" );
}

_id_BA8F()
{
    level endon( "ambush_enemies_alerted" );
    level endon( "ambush_enemies_alerted_prematurely" );
    level.player endon( "death" );
    var_0 = 0;
    var_1 = 0;

    for (;;)
    {
        if ( var_0 == 1 && var_1 == 1 )
            break;

        wait 1;
        var_2 = level.player getweaponslistprimaries();
        var_3 = level.player getcurrentweapon();

        foreach ( var_5 in var_2 )
        {
            if ( var_5 == "scar_h_thermal_silencer" && var_3 != "scar_h_thermal_silencer" && var_0 == 0 )
            {
                level.player takeweapon( "scar_h_thermal_silencer" );
                level.player giveweapon( "scar_h_thermal" );
                var_0 = 1;

                if ( isdefined( level.player.old_weapon ) && level.player.old_weapon == "scar_h_thermal_silencer" )
                    level.player.old_weapon = "scar_h_thermal";
            }

            if ( var_5 == "m4m203_silencer_reflex" && var_3 != "m4m203_silencer_reflex" && var_1 == 0 )
            {
                level.player takeweapon( "m4m203_silencer_reflex" );
                level.player giveweapon( "m4m203_reflex" );
                var_1 = 1;

                if ( isdefined( level.player.old_weapon ) && level.player.old_weapon == "m4m203_silencer_reflex" )
                    level.player.old_weapon = "m4m203_reflex";
            }
        }
    }
}

_id_C2F2()
{
    var_0 = getent( "prison_sequence_dummies_walk", "script_noteworthy" );
    var_1 = getent( "prison_sequence_dummies_run", "script_noteworthy" );
    var_2 = var_0;
    var_3 = var_1;
    var_4 = var_3.origin + ( 0.0, 0.0, 36.0 );
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_given" );
    var_5 = getent( "volume_ambush_room", "script_noteworthy" );
    var_6 = var_5 maps\_utility::get_ai_touching_volume( "neutral" );
    var_7 = [];
    var_7[0] = level.team2[0];
    var_7[1] = var_6[0];
    var_7[0].animname = "manhandle_soldier_walk";
    var_7[1].animname = "manhandle_prisoner_walk";
    var_8 = [];
    var_8[0] = level.team2[1];
    var_8[1] = var_6[1];
    var_8[0].animname = "manhandle_soldier_run";
    var_8[1].animname = "manhandle_prisoner_run";
    common_scripts\utility::flag_wait( "player_has_started_planting_c4" );

    while ( common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), var_6[0].origin, level.cosine["45"] ) )
        wait 0.1;

    foreach ( var_10 in var_6 )
        var_10 hide();

    if ( isdefined( level.manhandler ) )
    {
        if ( level.manhandler istouching( var_5 ) )
        {
            if ( isdefined( level.manhandler.magic_bullet_shield ) )
                level.manhandler maps\_utility::stop_magic_bullet_shield();

            level.manhandler delete();
        }
    }

    var_2 maps\_anim::anim_first_frame( var_7, "prisoner_manhandle_walk" );
    var_3 maps\_anim::anim_first_frame( var_8, "prisoner_manhandle_run" );

    foreach ( var_10 in var_6 )
        var_10 show();

    var_14 = getent( "player_looking_at_prisoner_sequence", "targetname" );
    var_14 common_scripts\utility::trigger_on();
    thread _id_C0C1();
    common_scripts\utility::flag_wait_either( "player_looking_at_prisoner_sequence", "trig_prisoner_sequence_failsafe" );
    common_scripts\utility::array_thread( var_7, ::play_anim_and_delete, var_2, "prisoner_manhandle_walk" );
    common_scripts\utility::array_thread( var_8, ::play_anim_and_delete, var_3, "prisoner_manhandle_run" );
}

play_anim_and_delete( var_0, var_1 )
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    var_0 maps\_anim::anim_single_solo( self, var_1 );

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self delete();
}

_id_C0C1()
{
    var_0 = getent( "trig_prisoner_sequence_failsafe", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "trig_prisoner_sequence_failsafe" );
}

_id_BAEF()
{
    self endon( "death" );
}

_id_B5D1( var_0, var_1 )
{
    self endon( "death" );
    level.player endon( "death" );
    level.player endon( "death" );
    var_2 = getent( var_0.target, "targetname" );
    var_3 = getent( var_2.target, "targetname" );
    maps\_utility::disable_ai_color();
    maps\_utility::cqb_walk( "on" );
    self setgoalnode( var_1 );
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_given" );
    wait(randomfloatrange( 2, 4 ));
    var_0 maps\_anim::anim_generic_reach( self, "C4_plant_start" );
    self setgoalpos( self.origin );

    while ( level.player istouching( var_3 ) )
        wait 0.05;

    var_0 thread maps\_anim::anim_generic( self, "C4_plant" );
    thread c4_in_hand( var_2 );
    wait 2;
    self setgoalnode( var_1 );
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_complete" );
    maps\_utility::enable_ai_color();
    common_scripts\utility::flag_wait( "ambush_c4_triggered" );
    var_2 delete();
}

_id_C0EC()
{
    level endon( "ambush_c4_triggered" );
    level endon( "obj_explosives_locate_given" );
    wait 2;
    thread _id_B299();
    var_0 = getent( "ambush_area", "targetname" );
    var_1 = 0;
    var_2 = 0;

    for (;;)
    {
        wait 0.05;

        if ( level.player getcurrentweapon() != "c4" && var_1 == 0 && !common_scripts\utility::flag( "player_on_ladder" ) )
        {
            wait 0.5;
            maps\_utility::hint_fade();
            thread maps\_utility::hint( &"OILRIG_HINT_C4_SWITCH" );
            var_1 = 1;
            var_2 = 0;
        }
        else if ( level.player getcurrentweapon() == "c4" && var_1 == 1 )
        {
            maps\_utility::hint_fade();
            var_1 = 0;
        }

        if ( !level.player istouching( var_0 ) && var_2 == 0 && var_1 == 0 )
        {
            maps\_utility::hint_fade();
            var_2 = 1;
            var_1 = 0;
        }

        if ( level.player istouching( var_0 ) && var_2 == 1 && var_1 == 0 )
        {
            maps\_utility::hint_fade();
            var_2 = 0;
        }
    }
}

_id_B299()
{
    common_scripts\utility::flag_wait_either( "ambush_c4_triggered", "obj_explosives_locate_given" );
    thread maps\_utility::hint_fade();
}

_id_CF35()
{
    level endon( "ambush_enemies_alerted_prematurely" );
    level endon( "ambush_c4_triggered" );
    var_0 = getent( "ambush_area", "targetname" );
    var_0 endon( "trigger" );
    wait(randomintrange( 14, 18 ));
    thread maps\_utility::radio_dialogue( "oilrig_nsl_elevatedposwait" );
}

_id_BD9E()
{
    level endon( "obj_ambush_complete" );
    var_0 = getnode( "node_guard_scaffolding", "targetname" );
    maps\_utility::disable_ai_color();
    self setgoalnode( var_0 );
    self.alertlevel = "alert";
    level._id_AC03 maps\_utility::cqb_walk( "on" );
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_complete" );
    var_1 = getnodearray( "friendlyStartHeli", "targetname" );
    var_0 = undefined;

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.script_noteworthy ) && var_3.script_noteworthy == "nodePrice" )
        {
            var_0 = var_3;
            break;
        }
    }

    var_5 = getent( "ambush_area", "targetname" );
    var_5 waittill( "trigger" );
    common_scripts\utility::flag_wait( "soap_reached_scaffold" );
    self.goalradius = 182;
    self setgoalnode( var_0 );
    self pushplayer( 1 );
    var_6 = getent( "colornodes_heli_deck1", "script_noteworthy" );
    var_6 waittill( "trigger" );
    self pushplayer( 0 );
}

_id_A8C1( var_0 )
{
    level endon( "obj_c4_ambush_plant_complete" );
    level endon( "player_has_started_planting_c4" );
    level endon( "c4_placement_started" );
    wait(randomintrange( 4, 6 ));
    maps\_utility::radio_dialogue( "oilrig_nsl_donthavetime" );
    wait(randomintrange( 4, 6 ));
    maps\_utility::radio_dialogue( "oilrig_nsl_plantc4" );
    wait(randomintrange( 4, 6 ));
    maps\_utility::radio_dialogue( "oilrig_nsl_donthavetime" );
    wait 4;
    common_scripts\utility::flag_set( "friendlies_had_to_plant_C4" );
    thread _id_CA6B();
}

_id_CA6B()
{
    common_scripts\utility::flag_set( "oilrig_mission_failed" );
    setdvar( "ui_deadquote", &"OILRIG_MISSIONFAIL_EXPLOSIVES_NOTPLANTED" );
    level notify( "mission failed" );
    maps\_utility::missionfailedwrapper();
}

_id_A8C7( var_0 )
{
    common_scripts\utility::flag_wait( "upper_room_breached" );
    var_1 = getentarray( "c4_hostiles", "targetname" );
    var_2 = getentarray( "c4_hostiles2", "targetname" );
    var_3 = common_scripts\utility::getfarthest( level.player.origin, var_1 );
    var_4 = common_scripts\utility::getfarthest( level.player.origin, var_2 );
    level._id_CEB4 = [];
    var_3 thread _id_BD1A( "execution_slamwall_hostage_death", "c4bodywall", undefined, ::return_deadbody_pos );
    var_4 thread _id_BD1A( "execution_hostile2_death", undefined, ::choose_body_ground_anim, ::return_deadbody_pos );
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_given" );
    level._id_AC03 thread force_m4_weapon();
    level._id_AC03 notify( "stop personal effect" );
    common_scripts\utility::flag_wait( "ambush_c4_triggered" );
    level._id_AC03 thread animscripts\utility::personalcoldbreath();
}

choose_body_ground_anim( var_0, var_1 )
{
    var_2 = anglestoforward( var_1.angles );
    var_3 = anglestoforward( level.player.angles );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 > 0 )
        return "c4bodyground2";
    else
        return "c4bodyground";
}

return_deadbody_pos( var_0 )
{
    return var_0;
}

_id_BD1A( var_0, var_1, var_2, var_3 )
{
    var_4 = level.scr_anim["generic"][var_0];
    var_5 = self;
    var_6 = maps\_utility::spawn_ai();
    var_6 maps\_utility::gun_remove();
    var_7 = getent( var_6.target, "targetname" );
    var_5 maps\_anim::anim_generic_first_frame( var_6, var_0 );
    var_8 = maps\_vehicle_aianim::convert_guy_to_drone( var_6 );
    var_8 setanim( var_4, 1, 0.2 );
    var_8 notsolid();
    var_8._id_B44D = var_1;
    var_8.animname = "generic";
    level._id_CEB4[level._id_CEB4.size] = var_8;
    var_9 = var_1;

    if ( isdefined( var_2 ) )
        var_9 = level.player [[ var_2 ]]( var_7, var_8 );

    var_7 thread dof_hiding_c4( var_9 );
    var_8 thread playfirstframeplantanim( getanimlength( var_4 ), var_9, var_4 );
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_given" );
    thread _id_CC05( var_7, var_1, var_8, var_2, var_3 );
    common_scripts\utility::flag_wait( "ambush_c4_triggered" );
    var_7 notify( "clear_c4" );
    var_8 delete();
}

playfirstframeplantanim( var_0, var_1, var_2 )
{
    wait(var_0);
    self clearanim( var_2, 0 );
    maps\_anim::anim_first_frame_solo( self, var_1 );
}

_id_CC05( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_0 _id_AAAB::_id_D2A9( undefined, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), var_0.origin, undefined, undefined, var_1, undefined, undefined, undefined, 1, undefined, var_2, var_3, var_4 );
    var_0 thread disable_hud_c4_plant();
    var_0 thread _id_C364();
    var_0 thread _id_C515( var_5 );
    var_0 waittill( "c4_detonation" );

    if ( !common_scripts\utility::flag( "ambush_c4_triggered" ) )
        common_scripts\utility::flag_set( "ambush_c4_triggered" );
}

_id_C515( var_0 )
{
    self endon( "c4_planted" );
    level endon( "ambush_c4_triggered" );
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_complete" );
    var_0 thread _id_B1A3();
}

_id_B1A3()
{
    self endon( "death" );
    self hide();
    wait 0.15;
    stopfxontag( common_scripts\utility::getfx( "c4_light_blink" ), self, "tag_fx" );
}

_id_B57B()
{
    var_0 = getent( "volume_ambush_room_exterior_front", "script_noteworthy" );
    var_1 = getent( "volume_ambush_room_exterior_side", "script_noteworthy" );
    var_2 = getent( "volume_ambush_room", "script_noteworthy" );
    var_3 = getent( "volume_c4_ambush", "targetname" );
    common_scripts\utility::flag_wait( "ambush_c4_triggered" );
    common_scripts\utility::flag_set( "ambush_enemies_alerted" );
    maps\_utility::fail_on_friendly_fire();
    thread common_scripts\utility::play_sound_in_space( "oilrig_ambush_explosion", var_2.origin );
    thread maps\oilrig_aud::breach_2_fire_sounds();

    if ( getdvarint( "disable_ambush_slowmo" ) == 1 )
        earthquake( 0.6, 2, level.player.origin, 1500 );

    level.player playrumblelooponentity( "damage_heavy" );
    common_scripts\_exploder::exploder( 1 );

    if ( level.player istouching( var_2 ) )
    {
        playfx( common_scripts\utility::getfx( "player_death_explosion" ), level.player.origin );
        level.player kill();
    }
    else if ( level.player istouching( var_0 ) || level.player istouching( var_1 ) )
    {
        playfx( common_scripts\utility::getfx( "player_death_explosion" ), level.player.origin );
        radiusdamage( level.player.origin, 500, 75, 50 );
        level.player _meth_859F( var_2.origin );
    }

    thread _id_B2ED();
    physicsexplosionsphere( var_2.origin, 300, 300, 10.0, 0 );
    var_4 = var_2 maps\_utility::get_ai_touching_volume();

    foreach ( var_6 in var_4 )
    {
        if ( isdefined( var_6.magic_bullet_shield ) )
            var_6 maps\_utility::stop_magic_bullet_shield();

        if ( var_6 maps\_utility::is_in_array( level.squad, var_6 ) )
        {
            level thread maps\_friendlyfire::missionfail();
            return;
        }

        var_6 dodamage( var_6.health + 1000, var_6.origin, level.player );
    }

    var_4 = var_3 maps\_utility::get_ai_touching_volume();

    foreach ( var_6 in var_4 )
    {
        if ( isdefined( var_6 ) && isalive( var_6 ) )
        {
            var_6.flashingteam = "allies";
            var_6 maps\_utility::flashbangstart( 5 );
        }
    }

    wait 1;
    thread _id_BF85();
    wait 5;
    maps\_utility::normal_friendly_fire_penalty();
}

_id_B980()
{
    var_0 = getent( "ambush_room_anchor", "targetname" );
    var_1 = getent( "ambush_room_anchor_destroyed", "targetname" );
    var_2 = var_0.origin - var_1.origin;
    var_3 = getentarray( "ambush_office_destroyed", "script_noteworthy" );

    foreach ( var_5 in var_3 )
    {
        if ( var_5.classname == "light_spot" || var_5.classname == "light_omni" )
        {
            var_5._id_D06A = var_5 getlightintensity();
            var_5 setlightintensity( 0 );
            continue;
        }

        var_5 hide();
    }

    common_scripts\utility::flag_wait( "ambush_c4_triggered" );
    var_3 = getentarray( "ambush_office_destroyed", "script_noteworthy" );

    foreach ( var_5 in var_3 )
        var_5.origin += var_2;

    wait 0.5;
    var_3 = getentarray( "ambush_office_destroyed", "script_noteworthy" );

    foreach ( var_5 in var_3 )
    {
        if ( var_5.classname == "light_spot" || var_5.classname == "light_omni" )
        {
            var_5 setlightintensity( var_5._id_D06A );
            continue;
        }

        var_5 show();
    }

    var_11 = getentarray( "ambush_office", "script_noteworthy" );

    foreach ( var_5 in var_11 )
    {
        if ( var_5.classname == "light_spot" || var_5.classname == "light_omni" )
        {
            var_5 setlightintensity( 0 );
            continue;
        }

        var_5.origin -= var_2;
        var_5 setcontents( 0 );
        var_5 hide();
    }
}

_id_BF85()
{
    common_scripts\_exploder::exploder( "exploder_ambush_afterfx" );
    common_scripts\utility::flag_set( "ambush_aftermath" );
    var_0 = getent( "volume_ambush_room", "script_noteworthy" );
    var_1 = getentarray( "com_vending_can_new2_destroyed", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        if ( ispointinvolume( var_3.origin, var_0 ) )
            var_3 setmodel( "com_vending_can_new2_destroyed" );
    }

    wait 2;
    var_5 = getentarray( "breach_room_2_destructible_triggers", "script_noteworthy" );
    common_scripts\utility::array_thread( var_5, ::_id_A8DE );
}

_id_A8DE()
{
    if ( !isdefined( self ) )
        return;

    if ( level.player istouching( self ) )
        return;

    radiusdamage( self.origin, self.radius, 500, 500 );
    self delete();
}

_id_C1A8()
{
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_complete" );
    common_scripts\utility::flag_wait_or_timeout( "player_in_ambush_position", 8 );
    wait 5;
    thread _id_AFCD();
    var_0 = getentarray( "hostiles_ambush", "targetname" );
    var_1 = maps\_utility::array_spawn( var_0 );
    common_scripts\utility::flag_set( "ambush_enemies_spawned" );

    foreach ( var_3 in var_1 )
        var_3.cheat._id_BDF2 = 1;

    level endon( "ambush_enemies_alerted_prematurely" );
    var_5 = getent( "ambush_enemies_approaching", "targetname" );
    var_5 waittill( "trigger" );
    common_scripts\utility::flag_set( "ambush_enemies_approaching" );
    var_5 = getent( "enemies_discovered_bodies", "targetname" );
    var_5 waittill( "trigger" );
    common_scripts\utility::flag_set( "enemies_discovered_bodies" );
}

_id_B4FE()
{
    level endon( "ambush_enemies_alerted" );
    _id_AFEA();
    common_scripts\utility::flag_set( "ambush_enemies_alerted_prematurely" );
}

_id_AFEA()
{
    self endon( "death" );
    common_scripts\utility::waittill_any( "damage", "enemy", "alerted", "bulletwhizby", "flashbang", "grenade danger", "explode", "pain_death" );
}

_id_D26C()
{
    level endon( "ambush_enemies_alerted_prematurely" );
    level endon( "ambush_c4_triggered" );
    common_scripts\utility::flag_wait( "ambush_enemies_approaching" );
    wait 0.5;
    common_scripts\utility::flag_wait( "ambush_gate_opened" );
    wait 1;
    var_0 = getaiarray( "axis" );
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_2 = var_1.origin + ( 0.0, 0.0, -512.0 );
    thread _id_C8BD( var_2 );
    wait 2;
    var_3 = level._id_AC03 maps\_utility::getanim( "oilrig_nsl_standby2" );
    level._id_AC03 setanim( var_3 );
    maps\_utility::radio_dialogue( "oilrig_nsl_standby2" );
    thread _id_C8BD( var_2 );
    common_scripts\utility::flag_wait( "enemies_discovered_bodies" );
    wait 1;
    thread _id_B25E();
    wait 1;
    var_3 = level._id_AC03 maps\_utility::getanim( "oilrig_nsl_doit" );
    level._id_AC03 setanim( var_3 );
    maps\_utility::radio_dialogue( "oilrig_nsl_doit" );
    common_scripts\utility::flag_set( "ambush_enemies_alerted" );
}

_id_B25E()
{
    var_0 = getent( "origin_ambush_discovery_dialogue", "targetname" );
    var_0 thread maps\_utility::play_sound_on_tag_endon_death( "temp_vo_alarm" );

    if ( !common_scripts\utility::flag( "ambush_c4_triggered" ) )
    {
        common_scripts\utility::flag_wait( "ambush_c4_triggered" );
        var_0 delete();
    }
}

_id_D510( var_0, var_1 )
{
    var_2 = randomint( 2 );
    var_3 = "oilrig_mrc_killhostages_room_" + var_1 + "_0" + var_2;
    wait 0.5;
    var_4 = maps\_utility::get_closest_ai( level.player.origin, "axis" );

    if ( isdefined( var_4 ) )
        var_4 thread maps\_utility::play_sound_on_tag_endon_death( level.scr_sound[var_3], "tag_origin" );
}

_id_B2DB()
{
    common_scripts\utility::flag_wait_either( "ambush_enemies_alerted", "ambush_enemies_alerted_prematurely" );
    maps\_utility::battlechatter_on( "axis" );
    maps\_utility::battlechatter_on( "allies" );
    wait 1.5;
    common_scripts\utility::flag_set( "obj_ambush_complete" );
    thread maps\oilrig_aud::aud_handle_alarm();
}

_id_D128()
{
    self.deathanim = level.scr_anim["generic"]["guy_blown_out_door_death"];
    self kill();
    wait 0.1;
    var_0 = 8000;
    self startragdollfromimpact( "torso_lower", var_0 * ( 0.0, -1.0, 0.5 ) );
}

_id_B2ED()
{
    var_0 = getent( "hostile_c4_blowup", "targetname" );
    var_1 = var_0 maps\_utility::spawn_ai();
    var_2 = var_1.origin + ( 0.0, 20.0, 35.0 );
    var_1 thread _id_D128();

    if ( getdvarint( "disable_ambush_slowmo" ) != 1 )
        maps\_utility::_id_B139( 0.15, 0.2, 0.4, 10 );
}

_id_B50A()
{
    thread _id_D318();
    thread _id_B8B3();
    thread _id_C0BE();
    common_scripts\utility::flag_wait( "player_at_stairs_to_deck_2" );
    thread _id_CB17();
}

_id_C0BE()
{
    maps\jake_tools::triggersenable( "colornodes_deck1_postbreach", "script_noteworthy", 1 );
    thread deck1_postbreach_color_nodes_monitor();
    common_scripts\utility::flag_wait( "obj_explosives_locate_given" );
    level._id_BBBD maps\_utility::setflashbangimmunity( 0 );
    level._id_BBBD maps\_slowmo_breach::remove_slowmo_breacher();
    level._id_BBBD thread maps\_utility::stop_magic_bullet_shield();
}

deck1_postbreach_color_nodes_monitor()
{
    var_0 = getentarray( "colornodes_deck1_postbreach", "script_noteworthy" );
    common_scripts\utility::waittill_any_ent_in_array_is_notified( var_0, "trigger" );
    common_scripts\utility::flag_set( "deck1_postbreach_color_nodes_activated" );
}

_id_B8B3()
{
    maps\_utility::battlechatter_off( "allies" );
    wait 2;
    maps\_utility::radio_dialogue( "oilrig_nsl_coverblown" );
    maps\_utility::radio_dialogue( "oilrig_sbc_possibleexpl" );
    maps\_utility::radio_dialogue( "oilrig_sbc_secthatloc" );
    maps\_utility::radio_dialogue( "oilrig_nsl_callforexfil" );
    common_scripts\utility::flag_set( "obj_explosives_locate_given" );
    thread maps\_utility::radio_dialogue( "oilrig_nsl_centcom" );
    _id_BA1D( "dummy_spawner_ballsout" );
    common_scripts\utility::array_thread( level.squad, maps\_utility::enable_ai_color );
    common_scripts\utility::array_thread( level.squad, maps\_utility::cqb_walk, "off" );
    wait 2;

    if ( common_scripts\utility::flag( "deck1_postbreach_color_nodes_activated" ) )
        level._id_AC03 pushplayer( 0 );
    else
    {
        maps\jake_tools::triggersenable( "colornodes_heli_deck1", "script_noteworthy", 1 );
        maps\_utility::activate_trigger_with_noteworthy( "colornodes_heli_deck1" );
    }

    wait 3;
    maps\_utility::battlechatter_on( "allies" );
    wait 3;
    maps\_utility::radio_dialogue( "oilrig_nsl_move2" );
}

_id_BCF3( var_0 )
{
    if ( level.gameskill > 1 )
        return;

    var_1 = 1.25;
    var_2 = 20;

    if ( level.gameskill == 0 )
    {
        var_1 = 2.5;
        var_2 = 40;
    }

    var_3 = 0;

    while ( isdefined( var_0 ) && var_3 < var_2 )
    {
        level.player waittill( "damage", var_4, var_5 );

        if ( !isdefined( var_0 ) )
            break;

        if ( !isdefined( var_0.mgturret ) )
            break;

        if ( isdefined( var_5 ) && isdefined( var_0.mgturret ) && maps\_utility::is_in_array( var_0.mgturret, var_5 ) )
        {
            level.player enableinvulnerability();
            wait(var_1);
            var_3++;
            var_1 /= 1.3;
            level.player disableinvulnerability();
        }
    }

    level.player disableinvulnerability();
}

_id_D407( var_0, var_1 )
{
    level endon( var_1 );
    level endon( "player_at_end_of_deck2" );
    var_2 = 1;
    var_3 = 1;
    var_4 = 1;
    var_5 = 1;

    while ( !common_scripts\utility::flag( var_1 ) )
    {
        wait(randomfloatrange( 15, 25 ));

        if ( isdefined( var_0 ) && isdefined( var_0.firingguns ) && var_0.firingguns == 1 )
        {
            while ( isdefined( var_0.firingguns ) && var_0.firingguns == 1 )
                wait 0.5;
        }

        if ( !level.player maps\_utility::player_using_missile() )
        {
            while ( var_2 == var_3 )
            {
                wait 0.05;
                var_2 = randomint( 5 );
            }

            if ( common_scripts\utility::flag( var_1 ) )
                break;

            maps\_utility::radio_dialogue( "oilrig_nsl_takeoutbird_0" + var_2 );
            var_3 = var_2;
            continue;
        }

        while ( var_4 == var_5 )
        {
            wait 0.05;
            var_4 = randomint( 4 );
        }

        if ( common_scripts\utility::flag( var_1 ) )
            break;

        maps\_utility::radio_dialogue( "oilrig_nsl_takeoutbird_withrocket_0" + var_4 );
        var_5 = var_4;
    }
}

_id_CB17()
{
    thread _id_AA57();
    thread _id_D5C4();
    thread _id_D164();
    thread _id_AFA1();
    thread _id_ACD3();
    thread _id_BF55();
    thread soap_stairs_anim();
    common_scripts\utility::flag_wait( "player_at_end_of_deck2" );
    thread _id_D5C4();
    thread _id_C671();
}

_id_D164()
{
    common_scripts\utility::flag_wait( "player_at_deck1_midpoint" );
    maps\_utility::battlechatter_off( "allies" );
    thread maps\_utility::autosave_by_name( "deck2_start" );
    wait(randomfloatrange( 1, 2 ));
    maps\_utility::radio_dialogue( "oilrig_sbc_gettolz" );
    thread maps\_utility::radio_dialogue( "oilrig_nsl_copythat2" );
    common_scripts\utility::flag_set( "zodiacs_evaced" );
    wait 4;
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_wait( "player_approaching_deck2_flank_path" );
    maps\_utility::radio_dialogue( "oilrig_nsl_splitup" );
    thread maps\_utility::autosave_by_name( "split_up" );
    common_scripts\utility::flag_wait( "player_at_end_of_deck2" );
    maps\_utility::radio_dialogue( "oilrig_nsl_rescuethemselves" );
    wait 2;

    if ( !common_scripts\utility::flag( "player_on_right_top_deck" ) )
        maps\_utility::radio_dialogue( "oilrig_nsl_moveup" );
}

_id_AFA1()
{
    common_scripts\utility::flag_wait( "player_at_stairs_to_deck_2" );
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "zodiacs_evac" );
    var_0[0] thread maps\oilrig_aud::aud_zodiac_hostage_extraction();
    var_1 = getentarray( "zodiacs_grate", "targetname" );
    common_scripts\utility::array_call( var_1, ::delete );
    common_scripts\utility::array_thread( var_0, ::_id_C39F );
}

_id_C39F()
{
    playfxontag( common_scripts\utility::getfx( "zodiac_wake_geotrail_oilrig" ), self, "tag_origin" );
}

_id_BF55()
{
    var_0 = getentarray( "hostiles_rappel_deck2", "targetname" );
    common_scripts\utility::flag_wait( "player_approaching_deck_2" );
    maps\jake_tools::triggersenable( "colornodes_deck2", "script_noteworthy", 1 );
    common_scripts\utility::flag_wait( "player_at_deck_2" );
    thread maps\_utility::autosave_by_name( "rappel_firefight" );
    thread _id_ABA1();
    var_1 = _id_C5AE( var_0 );
}

_id_ABA1()
{
    level.player.ignoreme = 1;
    common_scripts\utility::flag_wait_or_timeout( "rappel_dudes_failsafe", 5 );
    level.player.ignoreme = 0;
}

_id_CE29()
{
    self setcontents( 0 );
}

hot_potato_achievement_think()
{
    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
    {
        if ( isdefined( var_2 ) && var_2 == "fraggrenade" )
            maps\_utility::giveachievement_wrapper( "HOT_POTATO" );
    }
}

_id_ACD3()
{
    level endon( "heli_not_killed_in_time" );
    common_scripts\utility::flag_wait( "player_deck2_littlebird" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "heli_deck2" );
    level.heli = var_0;
    var_0 thread hot_potato_achievement_think();
    common_scripts\utility::array_thread( var_0.riders, ::_id_CE29 );
    common_scripts\utility::flag_wait_either( "player_looking_deck2_littlebird", "player_deck2_littlebird_failsafe" );
    maps\_utility::delaythread( 2, ::_id_AAD6 );
    thread maps\_vehicle::gopath( var_0 );
    var_0 vehicle_setspeed( 10 );
    var_0 thread maps\oilrig_aud::heli_deck2_audio();
    soundscripts\_snd::snd_message( "aud_start_mix_lbs_reveal" );

    foreach ( var_2 in var_0.mgturret )
    {
        var_2 maps\_vehicle_code::turret_set_default_on_mode( "manual" );
        var_2 setmode( "manual" );
    }

    var_0.dontwaitforpathend = 1;
    thread _id_BCF3( var_0 );
    thread _id_B731( var_0 );
    var_0 setlookatent( level.player );
    var_0 thread _id_ACAF();
    var_0 maps\_utility::delaythread( 3, vehicle_scripts\_attack_heli::heli_spotlight_on, "tag_barrel", 1 );
    thread _id_A975( var_0 );
    thread _id_C625( var_0 );
    common_scripts\utility::flag_wait_either( "player_shoots_or_aims_rocket_at_intimidating_heli", "deck_2_heli_is_finished_intimidating" );
    var_0 = vehicle_scripts\_attack_heli::begin_attack_heli_behavior( var_0 );
    wait 1;
    thread _id_D407( var_0, "heli_deck2_shot_down" );
    common_scripts\utility::flag_wait( "heli_deck2_shot_down" );
    var_0 thread heli_additive_animations();
    thread maps\_utility::autosave_by_name( "heli_deck2_dead" );
    wait 1.5;
    thread _id_D1B7();
    wait 2;
    maps\_utility::radio_dialogue( "oilrig_nsl_clocksticking" );
}

_id_C625( var_0 )
{
    level endon( "heli_deck2_shot_down" );
    common_scripts\utility::flag_wait( "top_deck_room_breached" );
    common_scripts\utility::flag_set( "heli_not_killed_in_time" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    wait 0.5;
    common_scripts\utility::flag_set( "heli_deck2_shot_down" );
}

_id_ACAF()
{
    wait 5;
    common_scripts\utility::flag_set( "deck_2_heli_is_finished_intimidating" );
}

_id_A975( var_0 )
{
    level endon( "deck_2_heli_is_finished_intimidating" );
    level endon( "player_shoots_or_aims_rocket_at_intimidating_heli" );

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( !isdefined( var_2 ) || !isplayer( var_2 ) )
            continue;
        else
        {
            common_scripts\utility::flag_set( "player_shoots_or_aims_rocket_at_intimidating_heli" );
            break;
        }
    }
}

_id_C291( var_0 )
{
    var_1 = "derrick_room_getting_breached";
    var_2 = "stop_smoke";

    foreach ( var_4 in var_0 )
    {
        var_5 = spawn( "script_model", var_4.origin );
        var_5 setmodel( "weapon_us_smoke_grenade_burnt" );
        var_5.angles = ( 0.0, 0.0, 90.0 );
    }

    for (;;)
    {
        var_7 = undefined;

        foreach ( var_4 in var_0 )
        {
            var_4 thread common_scripts\utility::play_sound_in_space( "h1_wpn_smoke_pop" );
            wait(randomfloatrange( 0.1, 0.3 ));
        }

        foreach ( var_4 in var_0 )
            playfx( common_scripts\utility::getfx( "smokescreen" ), var_4.origin );

        wait 28;

        if ( common_scripts\utility::flag( var_1 ) || common_scripts\utility::flag( var_2 ) )
        {
            wait 4;

            foreach ( var_4 in var_0 )
                playfx( common_scripts\utility::getfx( "smokescreen_oilrig_fadeout" ), var_4.origin );

            break;
        }
    }
}

deck_2_monitor_and_sync_ais_before_3rd_floor()
{
    common_scripts\utility::flag_set( "deck_2_sync_ais_before_3rd_floor" );
    level.deck2_to_deck3_allies_in_zone = [];
    var_0 = getent( "deck2_to_deck3_allies_monitor", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( common_scripts\utility::array_contains( level.deck2_to_deck3_allies_in_zone, var_1 ) )
            continue;

        level.deck2_to_deck3_allies_in_zone[level.deck2_to_deck3_allies_in_zone.size] = var_1;

        if ( common_scripts\utility::flag( "deck_2_sync_ais_before_3rd_floor" ) )
            thread deck_2_ais_before_3rd_floor_inside_zone( var_0 );
    }
}

deck_2_ais_before_3rd_floor_inside_zone( var_0 )
{
    common_scripts\utility::flag_clear( "deck_2_sync_ais_before_3rd_floor" );

    while ( level.deck2_to_deck3_allies_in_zone.size )
    {
        waitframe();

        for ( var_1 = level.deck2_to_deck3_allies_in_zone.size - 1; var_1 >= 0; var_1-- )
        {
            var_2 = level.deck2_to_deck3_allies_in_zone[var_1];

            if ( isalive( var_2 ) && var_2 istouching( var_0 ) )
                continue;

            var_3 = level.deck2_to_deck3_allies_in_zone.size - 1;
            level.deck2_to_deck3_allies_in_zone[var_1] = level.deck2_to_deck3_allies_in_zone[var_3];
            level.deck2_to_deck3_allies_in_zone[var_3] = undefined;
        }
    }

    common_scripts\utility::flag_set( "deck_2_sync_ais_before_3rd_floor" );
}

_id_C671()
{
    common_scripts\utility::flag_set( "need_to_check_axis_death" );
    level.slomobasevision = "oilrig";
    thread _id_C464();
    thread _id_CF56();
    level.slomobreachplayerspeed = 1;
    thread _id_B25D();
    thread _id_BFFD( "top_deck_room_breached", "barracks_cleared" );
    thread _id_D234();
    thread _id_BE89();
    thread _id_B6E8();
    thread _id_C426();
    thread maps\_utility::autosave_by_name( "deck3_start" );
    thread _id_B344();
    thread _id_C4EE();
    common_scripts\utility::flag_wait( "barracks_cleared" );
    thread _id_AAAA();
}

_id_CF56()
{
    common_scripts\utility::flag_wait( "player_at_stairs_to_top_deck" );
    var_0 = getentarray( "breach_save_deck3", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_A804 );
}

_id_A804()
{
    level endon( "breach_deck3_autosave_threaded" );
    level endon( "A door in breach group 300 has been activated." );
    var_0 = undefined;
    var_1 = getent( self.script_linkto, "script_linkname" );
    var_2 = 0;

    for (;;)
    {
        self waittill( "trigger" );
        var_3 = 0;

        if ( var_2 == 0 )
        {
            var_2 = 1;
            var_4 = var_1 maps\_utility::get_ai_touching_volume( "axis" );
            thread maps\_utility::ai_delete_when_out_of_sight( var_4, 128 );
        }

        var_0 = getaiarray( "axis" );

        foreach ( var_6 in var_0 )
        {
            if ( var_6 istouching( self ) )
            {
                var_3 = 1;
                break;
            }
        }

        if ( var_3 == 0 )
        {
            thread maps\_utility::autosave_by_name( "deck3_breach" );
            level notify( "breach_deck3_autosave_threaded" );
            break;
        }
        else
            wait 2;
    }
}

_id_C464()
{
    common_scripts\utility::flag_wait( "player_at_stairs_to_top_deck" );
    var_0 = getentarray( "samsite_turret", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_CB9E );
}

_id_CB9E()
{
    self.missiletags = [];
    self.missiletags[0] = "tag_missle1";
    self.missiletags[1] = "tag_missle2";
    self.missiletags[2] = "tag_missle3";
    self.missiletags[3] = "tag_missle4";
    self.missiletags[4] = "tag_missle5";
    self.missiletags[5] = "tag_missle6";
    self.missiletags[6] = "tag_missle7";
    self.missiletags[7] = "tag_missle8";

    foreach ( var_1 in self.missiletags )
        self attach( "projectile_slamraam_missile", var_1, 1 );

    var_3 = 4.4;
    wait(randomfloatrange( 0, 1.5 ));
    var_4 = getent( self.target, "targetname" );

    while ( !common_scripts\utility::flag( "top_deck_room_breached" ) )
    {
        self detach( "projectile_slamraam_missile", self.missiletags[0] );
        earthquake( 0.3, 0.5, self.origin, 1600 );
        magicbullet( "slamraam_missile_dcburning", self gettagorigin( self.missiletags[0] ), var_4.origin );
        self.missiletags = common_scripts\utility::array_remove( self.missiletags, self.missiletags[0] );

        if ( self.missiletags.size < 1 )
            break;

        self rotateyaw( 45, var_3, var_3 / 2, var_3 / 2 );
        wait(var_3);
        wait(randomfloatrange( 0, 2 ));
        self rotateyaw( -45, var_3, var_3 / 2, var_3 / 2 );
        wait(var_3);
        wait(randomfloatrange( 0, 1.5 ));
    }
}

_id_B25D()
{
    common_scripts\utility::flag_wait_either( "player_near_breach_topdeck_right", "player_near_breach_topdeck_left" );
    _id_C43C();
    common_scripts\utility::flag_wait( "top_deck_room_breached" );
    _id_C79E();
}

_id_B8E9()
{
    var_0 = 0;

    for (;;)
    {
        level waittill( "player_killed_an_enemy" );
        var_0++;

        if ( common_scripts\utility::flag( "player_got_deck3_autosave" ) )
        {
            common_scripts\utility::flag_clear( "need_to_check_axis_death" );
            break;
        }

        if ( var_0 > 5 )
        {
            thread maps\_utility::autosave_by_name( "deck3" );
            var_0 = 0;
        }
    }
}

_id_D234()
{
    common_scripts\utility::flag_wait( "player_at_stairs_to_top_deck" );
    thread _id_B8E9();

    if ( !maps\_utility::is_specialop() )
    {
        foreach ( var_1 in level.squad )
        {
            if ( !isdefined( var_1 ) )
                continue;

            var_1.disabledamageshieldpain = 1;
        }
    }

    if ( !maps\_utility::is_specialop() )
        thread maps\_utility::autosave_by_name( "deck3_firefight_start" );

    common_scripts\utility::flag_wait( "player_on_right_top_deck" );
    var_3 = getentarray( "smoke_deck3", "targetname" );
    thread _id_C291( var_3 );
    wait 1;
    common_scripts\utility::flag_set( "smoke_thrown" );
    wait 2;

    if ( !maps\_utility::is_specialop() )
    {
        foreach ( var_1 in level.squad )
        {
            if ( !isdefined( var_1 ) )
                continue;

            var_1.disabledamageshieldpain = undefined;
        }
    }

    common_scripts\utility::flag_set( "smoke_firefight" );

    if ( !maps\_utility::is_specialop() )
        thread _id_A973();

    common_scripts\utility::flag_wait_or_timeout( "player_approaching_topdeck_building", 28 );

    if ( !common_scripts\utility::flag( "player_approaching_topdeck_building" ) )
    {
        if ( !maps\_utility::is_specialop() )
        {
            if ( !common_scripts\utility::flag( "player_approaching_topdeck_building" ) )
                thread _id_AA75();
        }
    }

    common_scripts\utility::flag_wait_or_timeout( "player_approaching_topdeck_building", 28 );

    if ( !common_scripts\utility::flag( "player_approaching_topdeck_building" ) )
        thread _id_B919();

    common_scripts\utility::flag_wait_either( "player_near_breach_topdeck_right", "player_near_breach_topdeck_left" );

    if ( !maps\_utility::is_specialop() )
    {
        thread maps\_utility::autosave_by_name( "deck3_breach_approach" );
        common_scripts\utility::flag_set( "player_got_deck3_autosave" );
        thread _id_BF10( 300 );
    }

    common_scripts\utility::flag_wait( "derrick_room_getting_breached" );
    thread maps\oilrig_aud::_id_B59C();
    maps\_utility::battlechatter_off( "allies" );

    if ( !common_scripts\utility::flag( "stop_smoke" ) )
        common_scripts\utility::flag_set( "stop_smoke" );

    common_scripts\utility::array_thread( level._id_BF0A, common_scripts\utility::pauseeffect );
    common_scripts\utility::array_thread( level._id_C315, common_scripts\utility::pauseeffect );
    common_scripts\utility::array_thread( level._id_B077, common_scripts\utility::pauseeffect );
    var_6 = getaiarray();
    thread _id_B929();
    common_scripts\utility::array_thread( var_6, ::_id_CE06 );
    level waittill( "breach_explosion" );
    common_scripts\utility::flag_set( "top_deck_room_breached" );
}

_id_A973()
{
    _id_B78C();
    wait 1;
    thread _id_AA75();
    common_scripts\utility::flag_set( "done_with_smoke_dialogue" );
}

_id_BE89()
{
    level endon( "top_deck_room_breached" );
    common_scripts\utility::flag_wait( "player_approaching_topdeck_building" );

    if ( !common_scripts\utility::flag( "top_deck_room_breached" ) )
        maps\_utility::radio_dialogue( "oilrig_sbc_hostconfirmed" );

    if ( !common_scripts\utility::flag( "top_deck_room_breached" ) )
        maps\_utility::radio_dialogue( "oilrig_nsl_behinddoors" );
}

_id_CE06()
{
    if ( !isdefined( self ) )
        return;

    if ( isdefined( self.script_slowmo_breach ) )
        return;

    if ( !maps\_utility::is_specialop() )
    {
        if ( maps\_utility::is_in_array( level.squad, self ) )
            return;
    }

    if ( isdefined( self ) )
    {
        if ( isdefined( self.magic_bullet_shield ) )
            maps\_utility::stop_magic_bullet_shield();

        self delete();
    }
}

_id_B919()
{
    maps\jake_tools::triggeractivate( "smoke_flankers" );
}

_id_B929()
{
    maps\_spawner::kill_spawnernum( 17 );
    maps\_spawner::kill_spawnernum( 18 );
    maps\_spawner::kill_spawnernum( 19 );
    maps\_spawner::kill_spawnernum( 20 );
}

_id_B344()
{
    maps\jake_tools::triggersenable( "colornodes_deck3", "script_noteworthy", 1 );
}

_id_C4EE()
{
    var_0 = getentarray( "c4_barrel", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_C7B4 );
    var_1 = getentarray( "c4barrelPacks", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, ::_id_C00C );
    level waittill( "A door in breach group 300 has been activated." );
    common_scripts\utility::flag_set( "derrick_room_getting_breached" );
}

_id_C7B4()
{
    if ( maps\_utility::is_specialop() )
        level endon( "special_op_terminated" );

    level endon( "mission failed" );
    level endon( "missionfailed" );
    level endon( "player_detonated_explosives" );
    var_0 = self;
    var_0 setcandamage( 1 );
    var_0._id_B8FD = undefined;

    switch ( level.gameskill )
    {
        case 0:
            var_0._id_B8FD = 5;
            break;
        case 1:
            var_0._id_B8FD = 4;
            break;
        case 2:
            var_0._id_B8FD = 2;
            break;
        case 3:
            var_0._id_B8FD = 1;
            break;
    }

    common_scripts\utility::flag_wait( "derrick_room_getting_breached" );

    while ( !common_scripts\utility::flag( "player_detonated_explosives" ) )
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( var_2 ) && isplayer( var_2 ) )
        {
            if ( var_9 & 8 )
                continue;

            if ( isdefined( var_5 ) && ( issubstr( var_5, "MOD_GRENADE" ) || issubstr( var_5, "MOD_EXPLOSIVE" ) || issubstr( var_5, "MOD_PROJECTILE" ) ) )
                break;

            if ( var_0._id_B8FD > 0 )
                var_0._id_B8FD -= 1;

            if ( var_0._id_B8FD == 0 )
                break;
        }
    }

    thread _id_BF84();
    common_scripts\utility::flag_set( "player_detonated_explosives" );
}

_id_BF84()
{
    level notify( "c4_barrels_exploding" );
    level endon( "c4_barrels_exploding" );
    level.player playlocalsound( "oilrig_ambush_explosion" );
    playfx( common_scripts\utility::getfx( "player_death_explosion" ), level.player.origin );
    earthquake( 1, 1, level.player.origin, 100 );
    setdvar( "ui_deadquote", &"OILRIG_MISSIONFAIL_EXPLOSIVES" );
    level notify( "mission failed" );
    maps\_utility::missionfailedwrapper();
}

_id_C00C()
{
    common_scripts\utility::flag_wait( "derrick_room_getting_breached" );
    self show();
    self notsolid();
    wait(randomfloatrange( 0, 0.6 ));
    playfxontag( common_scripts\utility::getfx( "light_c4_blink_nodlight" ), self, "tag_fx" );
    common_scripts\utility::flag_wait( "player_on_board_littlebird" );
    self delete();
}

_id_AAAA()
{
    maps\_utility::battlechatter_on( "allies" );
    thread _id_B6F2();
    thread _id_C200();
    thread _id_A8C3();
    thread _id_B4B6();
    thread obj_escape();
    thread play_fx_on_chopper();
    enableforcedsunshadows();
}

_id_B4B6()
{
    level endon( "mission failed" );
    common_scripts\utility::flag_wait( "barracks_cleared" );
    common_scripts\utility::flag_set( "obj_explosives_locate_complete" );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    wait 0.5;
    soundscripts\_snd::snd_message( "aud_start_mix_room_clear" );
    maps\_utility::radio_dialogue( "oilrig_roomclear_ghost_05" );
    maps\_utility::radio_dialogue( "oilrig_nsl_roomclear" );
    maps\_utility::radio_dialogue( "oilrig_nsl_allhostsec" );
    common_scripts\utility::flag_set( "obj_escape_given" );
    maps\_utility::radio_dialogue( "oilrig_sbc_phase2" );
    soundscripts\_snd::snd_message( "aud_stop_mix_room_clear" );

    if ( !common_scripts\utility::flag( "player_on_board_littlebird" ) )
        maps\_utility::radio_dialogue( "oilrig_rmv_goplat" );

    if ( !common_scripts\utility::flag( "player_on_board_littlebird" ) )
        maps\_utility::radio_dialogue( "oilrig_gm1_copies" );

    if ( !common_scripts\utility::flag( "player_on_board_littlebird" ) )
        maps\_utility::radio_dialogue( "oilrig_f15_twof15s" );

    if ( !common_scripts\utility::flag( "player_on_board_littlebird" ) )
        maps\_utility::radio_dialogue( "oilrig_rmv_bluesky" );

    if ( !common_scripts\utility::flag( "player_on_board_littlebird" ) )
        maps\_utility::radio_dialogue( "oilrig_f15_copies" );

    common_scripts\utility::flag_wait( "littlebird_escape_lifted_off" );
    maps\_utility::radio_dialogue( "oilrig_rmv_localairspace" );
    maps\_utility::radio_dialogue( "oilrig_gm1_hunteractual" );
    maps\_utility::radio_dialogue( "oilrig_rmv_samsitesneut" );
}

_id_C200()
{
    common_scripts\utility::flag_wait( "barracks_cleared" );
    thread maps\_utility::autosave_by_name( "escape" );
    var_0 = getaiarray( "axis" );
    thread maps\_utility::ai_delete_when_out_of_sight( var_0, 512 );
    thread _id_C43C();
    var_1 = "tag_player_attach_right";
    wait 1;
    maps\jake_tools::triggersenable( "colornodes_escape", "script_noteworthy", 1 );
    maps\jake_tools::triggersenable( "colornodes_escape_start", "script_noteworthy", 1 );
    maps\_utility::activate_trigger_with_noteworthy( "colornodes_escape_start" );
    var_2 = maps\_utility::array_spawn( getentarray( "littlebird_riders_left", "targetname" ) );

    foreach ( var_4 in var_2 )
        var_4 thread handleleftsoldier();

    var_6 = maps\_utility::array_spawn( getentarray( "littlebird_riders_right", "targetname" ) );
    var_6 = common_scripts\utility::array_add( var_6, level._id_AC03 );
    level._id_AC03.script_startingposition = 4;
    level._id_D1AC = maps\_vehicle::spawn_vehicle_from_targetname( "littlebird_escape" );
    thread maps\_friendlyfire::friendly_fire_think( level._id_D1AC );
    var_7 = getent( "obj_escape", "targetname" );
    common_scripts\utility::flag_set( "littlebird_escape_spawned" );
    thread spawn_weapon_m14();
    level._id_D1AC thread maps\oilrig_aud::_id_B6E1();
    common_scripts\utility::flag_wait( "player_headed_out_of_barracks" );
    soundscripts\_snd::snd_message( "aud_start_mix_escape" );
    level._id_AC03 maps\_utility::disable_ai_color();
    var_8 = common_scripts\utility::getstruct( "pickup_node_before_stage", "script_noteworthy" );
    level._id_D1AC thread soap_gets_on_littlebird();

    foreach ( var_4 in var_2 )
    {
        var_4 maps\_utility::disable_ai_color();

        if ( !isdefined( var_4.magic_bullet_shield ) )
            var_4 thread maps\_utility::magic_bullet_shield();

        var_4 maps\_utility::setflashbangimmunity( 1 );
        var_4.ignoreme = 1;
        var_4.grenadeawareness = 0;
        var_4 setthreatbiasgroup( "oblivious" );
    }

    common_scripts\utility::flag_wait( "player_approaching_derrick_building_exit" );
    level._id_D1AC maps\_vehicle::gopath();
    common_scripts\utility::flag_set( "littlebird_escape_moving" );

    foreach ( var_4 in level.squad )
    {
        if ( isdefined( var_4 ) && isalive( var_4 ) )
        {
            var_4.neverenablecqb = 1;
            var_4 maps\_utility::disable_cqbwalk();
            var_4._id_CE92 = "run";
        }
    }

    setsaveddvar( "cg_gunDownAnimDelayTime", 250 );
    thread _id_C585();
    level._id_D1AC waittill( "touch_down" );
    common_scripts\utility::flag_set( "escape_littlebird_landed" );
    level._id_D1AC thread _id_CC8C( var_1 );
    level._id_D1AC thread player_gets_weapon_from_soap_on_littlebird( var_1 );
    thread helicopter_objects_hide();
    level._id_AC03 maps\_utility::ent_flag_wait( "on_board_littlebird" );

    while ( level._id_D1AC.riders.size < 2 )
        wait 0.1;

    wait 1;
    level._id_D1AC maps\_vehicle::vehicle_ai_event( "idle_alert_to_casual" );
    common_scripts\utility::flag_wait( "player_on_board_littlebird" );
    common_scripts\utility::flag_set( "obj_escape_complete" );
    common_scripts\utility::array_thread( level._id_BF0A, common_scripts\utility::pauseeffect );
    common_scripts\_exploder::exploder( "ride_smoke" );
    var_13 = common_scripts\utility::getstruct( "heli_escape_path", "targetname" );
    level._id_D1AC thread maps\_vehicle::vehicle_paths( var_13 );
    level._id_D1AC setmaxpitchroll( 50, 50 );
    common_scripts\utility::flag_set( "littlebird_escape_lifted_off" );
    thread _id_C79E();
    level._id_D1AC maps\_vehicle::vehicle_ai_event( "idle_alert_to_casual" );
    level._id_D1AC vehicle_setspeed( 17 );
    common_scripts\utility::flag_wait( "heli_escape_path_01" );
    var_14 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "blackhawk_main_deck" );
    var_15 = getent( "view_derrick_building_01", "targetname" );
    common_scripts\utility::flag_wait( "heli_escape_path_03" );
    var_16 = maps\_utility::array_spawn( getentarray( "friendlies_deck3_stairs", "targetname" ) );
    common_scripts\utility::flag_wait( "heli_escape_path_04" );
    var_17 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "littlebird_wingman_01_drone" );
    var_17 maps\_vehicle::vehicle_ai_event( "idle_alert_to_casual" );
    var_17 vehicle_setspeed( 28 );
    common_scripts\utility::flag_wait( "heli_escape_path_05" );
    level._id_D1AC vehicle_setspeed( 22 );
    common_scripts\utility::flag_wait( "heli_escape_path_06" );
    var_18 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "littlebird_wingman_02_drone" );
    var_18 maps\_vehicle::vehicle_ai_event( "idle_alert_to_casual" );
    var_18 vehicle_setspeed( 33 );
    var_17 vehicle_setspeed( 33 );
    maps\_treadfx::setallvehiclefx( "script_vehicle_littlebird_bench", "vfx/unique/no_fx" );
    var_19 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "jets_escape_flight_03" );
    level._id_D1AC vehicle_setspeed( 28 );
    common_scripts\utility::flag_wait( "heli_escape_path_07" );
    common_scripts\utility::flag_wait( "heli_escape_path_09" );
    var_18 vehicle_setspeed( 30 );
    var_17 vehicle_setspeed( 31 );
    wait 4.5;
    _id_C9E6();
}

handleleftsoldier()
{
    var_0 = getnode( self.target, "targetname" );
    self setgoalnode( var_0 );
    var_1 = getent( "littlebird_riders_left_node", "targetname" );
    common_scripts\utility::flag_wait( "escape_littlebird_landed" );
    self.animname = "generic";
    var_1 maps\_anim::anim_single_solo( self, self.animation );
    var_1 thread maps\_anim::anim_loop_solo( self, self.animation + "_idle" );
    common_scripts\utility::flag_wait( "player_on_board_littlebird" );
    maps\_utility::stop_magic_bullet_shield();
    self delete();
}

_id_C585()
{
    common_scripts\utility::flag_wait( "player_on_board_littlebird" );
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "jets_escape_flight_01a" );
    common_scripts\utility::flag_wait( "littlebird_escape_lifted_off" );
    wait 12;
    var_1 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "jets_escape_flight_01" );
}

_id_B1E5()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = getentarray( "submarine_03", "targetname" );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4.script_parameters ) && var_4.script_parameters == "sub" )
        {
            var_0 = var_4;
            continue;
        }

        var_1 = var_4;
    }

    level._id_C9D8 = spawn( "script_origin", var_0.origin );
    level._id_C9D8.origin = var_0.origin;
    level._id_C9D8.angles = var_0.angles;
    var_1 linkto( var_0 );
    var_0 linkto( level._id_C9D8 );
    var_6 = 12;
    var_7 = 1024;
    level._id_C9D8 moveto( level._id_C9D8.origin + ( 0, 0, -1 * var_7 ), 0.1 );
    var_0 show();
    var_1 show();
    common_scripts\utility::flag_wait( "sub_comes_through_ice" );
    level._id_C9D8 moveto( var_0.origin + ( 0, 0, var_7 ), var_6, var_6 / 3, var_6 / 3 );
}

_id_ACEE( var_0 )
{
    for (;;)
        wait 0.05;
}

_id_CC8C( var_0 )
{
    var_1 = self gettagorigin( var_0 );
    var_2 = 30;
    var_3 = 50;
    var_4 = 0;
    var_5 = spawn( "trigger_radius", var_1, var_4, var_2, var_3 );
    var_6 = common_scripts\utility::spawn_tag_origin();
    var_6.origin = self gettagorigin( var_0 );
    var_6.angles = self gettagangles( var_0 );
    var_6.angles += ( 0.0, 0.0, 0.0 );
    var_6 linkto( self, var_0, ( 0.0, 0.0, 0.0 ), ( 0.0, -90.0, 0.0 ) );
    var_5 waittill( "trigger" );
    thread dof_climb_in_heli();
    soundscripts\_snd::snd_message( "aud_start_player_inside_helicopter" );
    level.player freezecontrols( 1 );
    setsaveddvar( "ui_hidemap", 1 );
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "actionSlotsHide", 1 );
    var_7 = level.player getstance();
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player _meth_830F( 0 );
    level.player allowjump( 0 );
    level.player disableweapons();
    var_8 = 1.0;
    var_9 = 5;
    var_10 = 5;
    var_11 = 5;
    var_12 = 5;
    level.player.worldbody_rig = maps\_utility::spawn_anim_model( "worldbody" );
    level.player.worldbody_rig hide();
    maps\_anim::anim_first_frame_solo( level.player.worldbody_rig, "escape_in", var_0 );
    var_13 = 0.7;
    var_14 = spawn( "script_origin", level.player.origin );
    var_14.angles = level.player getplayerangles();
    level.player playerlinkto( var_14, undefined, 1.0, 0.0, 0.0, 0.0, 0.0 );
    var_14 moveto( level.player.worldbody_rig gettagorigin( "tag_camera" ) - ( 0.0, 0.0, 60.0 ), var_13, var_13 * 0.2, var_13 * 0.2 );
    var_14 rotateto( level.player.worldbody_rig gettagangles( "tag_camera" ), var_13, var_13 * 0.2, var_13 * 0.2 );
    wait(var_13);
    level.player playerlinktodelta( level.player.worldbody_rig, "tag_player", var_8, var_9, var_10, var_11, var_12, 1 );
    level.player.worldbody_rig show();
    maps\_anim::anim_single_solo( level.player.worldbody_rig, "escape_in", var_0 );
    thread maps\_anim::anim_loop_solo( level.player.worldbody_rig, "escape_idle", undefined, var_0 );
    level.player lerpviewangleclamp( 0.5, 0.1, 0.1, 40, 40, 10, 20 );
    level.player.worldbody_rig linkto( self, "tag_origin" );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    level.player freezecontrols( 0 );
    level.player enableweapons();
    common_scripts\utility::flag_set( "player_on_board_littlebird" );
}

soap_gets_on_littlebird()
{
    level._id_AC03 maps\_utility::ent_flag_init( "on_board_littlebird" );
    var_0 = common_scripts\utility::getstruct( "gag_stage_littlebird_load", "script_noteworthy" );
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles;
    var_1.origin = common_scripts\utility::drop_to_ground( var_1.origin, 40.0, -40.0 );
    thread final_stair_animation_monitoring();
    thread handleghostmovement( var_1 );
    var_1 maps\_anim::anim_reach_solo( level._id_AC03, "escape_in" );
    common_scripts\utility::flag_wait( "escape_littlebird_landed" );

    while ( common_scripts\utility::flag( "stair_in_use" ) )
        waitframe();

    var_1 maps\_anim::anim_single_solo( level._id_AC03, "escape_in" );
    level._id_AC03 linkto( self );
    level._id_AC03 maps\_utility::ent_flag_set( "on_board_littlebird" );
    thread maps\_anim::anim_loop_solo( level._id_AC03, "escape_idle", undefined, "tag_detach_right" );
    level._id_AC03 thread handle_soap_headtracking();
}

handle_soap_headtracking()
{
    _id_B3AB::_id_BEBA( "head", undefined, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\utility::flag_wait( "player_on_board_littlebird" );
    _id_B3AB::_id_B0AC();
}

handleghostmovement( var_0 )
{
    level._id_C280.animname = "generic";
    var_0 maps\_anim::anim_reach_solo( level._id_C280, "escape_in" );

    while ( common_scripts\utility::flag( "stair_in_use" ) )
        waitframe();

    var_0 maps\_anim::anim_single_solo( level._id_C280, "escape_in" );
    var_0 = getnode( "ghost_end_node", "targetname" );
    level._id_C280 setgoalnode( var_0 );
}

player_gets_weapon_from_soap_on_littlebird( var_0 )
{
    common_scripts\utility::flag_wait( "player_on_board_littlebird" );
    level._id_AC03 maps\_utility::ent_flag_wait( "on_board_littlebird" );
    var_1 = maps\_utility::spawn_anim_model( "weapon_m14", self.origin );
    var_1 linkto( self );
    waitframe();
    thread maps\_anim::anim_single_solo( var_1, "escape_departure", var_0 );
    thread maps\_anim::anim_single_solo( level._id_AC03, "escape_departure", "tag_detach_right" );
    thread maps\_anim::anim_single_solo( level.player.worldbody_rig, "escape_departure", var_0 );
    thread dof_departure_and_heli_ride();
    level.player lerpviewangleclamp( 0.75, 0.3, 0.3, 0, 0, 0, 0 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    level.player disableweapons();
    common_scripts\utility::flag_wait( "player_switches_weapon_on_littlebird" );
    var_1 delete();
    level.player takeallweapons();
    level.player giveweapon( "m14_scoped_arctic" );
    level.player switchtoweapon( "m14_scoped_arctic" );
    level.player enableweapons();
    level.player lerpviewangleclamp( 0.5, 0.1, 0.1, 60, 40, 10, 30 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    level.player _meth_85AA( 180, -5, -10, 180 );
}

_id_A8C3()
{
    common_scripts\utility::flag_wait( "barracks_cleared" );
    common_scripts\utility::flag_wait( "player_exiting_derrick_building" );
    var_0 = common_scripts\utility::getstruct( "samsite1_heli_unload", "targetname" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "blackhawk_samsite_01" );
    var_1 waittill( "reached_dynamic_path_end" );
    common_scripts\utility::flag_wait( "littlebird_escape_lifted_off" );
    var_2 = var_1.riders;
    var_1 maps\_vehicle::vehicle_paths( var_0 );
    wait 4.5;
    var_3 = common_scripts\utility::getclosest( level.player.origin, var_2 );
    var_3 thread maps\_utility::play_sound_on_entity( "oilrig_gm1_samssecure" );
}

_id_D320()
{
    common_scripts\utility::flag_wait( "littlebird_escape_lifted_off" );
    var_0 = maps\_utility::array_spawn( getentarray( "friendlies_samsite_02", "targetname" ) );
}

_id_BF67()
{
    common_scripts\utility::flag_wait( "littlebird_escape_lifted_off" );
    var_0 = maps\_utility::array_spawn( getentarray( "friendlies_samsite_03", "targetname" ) );
}

_id_C9E6()
{
    var_0 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_0 fadeovertime( 3 );
    var_0.alpha = 1;
    wait 3;
    maps\_utility::nextmission();
}

_id_ACF7()
{
    common_scripts\utility::flag_wait( "obj_stealthkill_given" );
    var_0 = 1;
    var_1 = level._id_C177;
    objective_add( var_0, "active", &"OILRIG_OBJ_STEALTHKILL", var_1.origin );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "obj_stealthkill_complete" );
    soundscripts\_snd::snd_message( "aud_stop_mix_stealth_kill" );
    objective_state( var_0, "done" );
}

_id_B581()
{
    var_0 = getentarray( "obj_breach1", "targetname" );
    var_1 = 2;
    common_scripts\utility::flag_wait( "obj_hostages_secure_given" );
    objective_add( var_1, "invisible", &"OILRIG_OBJ_HOSTAGES_SECURE" );
    objective_onentity( var_1, level._id_AC03 );
    objective_state( var_1, "current" );
    objective_string( var_1, &"OILRIG_OBJ_HOSTAGES_SECURE", level._id_C209 );
    common_scripts\utility::flag_wait( "player_at_lower_breach" );
    common_scripts\utility::flag_wait( "railing_patroller_dead" );
    maps\_slowmo_breach::objective_breach( var_1, 0, 1 );
    objective_string( var_1, &"OILRIG_OBJ_HOSTAGES_SECURE", level._id_C209 );
    common_scripts\utility::flag_wait( "lower_room_breached" );
    maps\_utility::objective_clearadditionalpositions( var_1 );
    objective_setpointertextoverride( var_1 );
    common_scripts\utility::flag_wait( "lower_room_cleared" );
    objective_string( var_1, &"OILRIG_OBJ_HOSTAGES_SECURE", level._id_C209 - 4 );
    objective_onentity( var_1, level._id_C280 );
    common_scripts\utility::flag_wait( "player_at_last_breach_building" );
    maps\_slowmo_breach::objective_breach( var_1, 2, 3 );
    common_scripts\utility::flag_wait( "upper_room_breached" );
    maps\_utility::objective_clearadditionalpositions( var_1 );
    objective_setpointertextoverride( var_1 );
    common_scripts\utility::flag_wait( "obj_hostages_secure_complete" );
    objective_state( var_1, "done" );
    objective_string( var_1, &"OILRIG_OBJ_HOSTAGES_SECURE_DONE" );
}

_id_AB96()
{
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_given" );
    var_0 = 3;
    objective_add( var_0, "invisible", &"OILRIG_OBJ_C4_AMBUSH_PLANT" );
    objective_state( var_0, "current" );
    objective_string( var_0, &"OILRIG_OBJ_C4_AMBUSH_PLANT" );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_complete" );
    objective_state( var_0, "done" );
}

_id_C364()
{
    level._id_BFEC++;
    var_0 = level._id_BFEC;
    level._id_AC30[level._id_AC30.size] = self;
    objective_string( 3, &"OILRIG_OBJ_C4_AMBUSH_PLANT" );
    objective_additionalposition( 3, var_0, self.origin );
    objective_string( 3, &"OILRIG_OBJ_C4_AMBUSH_PLANT" );
    self waittill( "c4_planted" );

    if ( !common_scripts\utility::flag( "player_has_started_planting_c4" ) )
        common_scripts\utility::flag_set( "player_has_started_planting_c4" );

    level._id_AC30 = common_scripts\utility::array_remove( level._id_AC30, self );
    waittillframeend;
    objective_additionalposition( 3, var_0, ( 0.0, 0.0, 0.0 ) );

    if ( level._id_AC30.size < 2 )
        common_scripts\utility::flag_set( "obj_c4_ambush_plant_complete" );

    objective_string( 3, &"OILRIG_OBJ_C4_AMBUSH_PLANT" );
}

_id_D360()
{
    common_scripts\utility::flag_wait( "obj_ambush_given" );
    var_0 = 4;
    objective_add( var_0, "active", &"OILRIG_OBJ_AMBUSH" );
    objective_current( var_0 );
    objective_onentity( var_0, level._id_AC03 );
    common_scripts\utility::flag_wait( "obj_ambush_complete" );
    objective_state( var_0, "done" );
}

_id_D318()
{
    common_scripts\utility::flag_wait( "obj_explosives_locate_given" );
    var_0 = 5;
    objective_add( var_0, "active", &"OILRIG_OBJ_EXPLOSIVES_LOCATE" );
    objective_current( var_0 );
    objective_onentity( var_0, level._id_AC03 );
    common_scripts\utility::flag_wait( "player_on_right_top_deck" );
    objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
    var_1 = getentarray( "obj_breach3", "targetname" );
    maps\_slowmo_breach::objective_breach( var_0, 4, 5 );
    common_scripts\utility::flag_wait( "top_deck_room_breached" );
    maps\_utility::objective_clearadditionalpositions( var_0 );
    objective_setpointertextoverride( var_0 );
    common_scripts\utility::flag_wait( "obj_explosives_locate_complete" );
    objective_state( var_0, "done" );
}

obj_escape()
{
    common_scripts\utility::flag_wait( "obj_escape_given" );
    var_0 = 6;
    objective_add( var_0, "active", &"OILRIG_OBJ_ESCAPE" );
    objective_current( var_0 );
    objective_onentity( var_0, level._id_AC03 );
    common_scripts\utility::flag_wait( "player_at_helipad_stairs" );
    common_scripts\utility::flag_wait( "escape_littlebird_landed" );
    objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
    var_1 = getent( "obj_escape", "targetname" );
    var_1.origin = level._id_D1AC gettagorigin( "tag_guy3" );
    var_1.origin += ( 0.0, 0.0, 30.0 );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "obj_escape_complete" );
    objective_state( var_0, "done" );
}

_id_D35D()
{

}

_id_C2D6()
{
    common_scripts\utility::flag_wait( "player_approaching_oilrig_legs" );
    maps\_utility::musicplaywrapper( "mus_oilrig_underwater_music" );
}

_id_B295()
{
    level endon( "lower_room_breached" );
    common_scripts\utility::flag_wait( "player_slitting_throat" );
    musicstop();
    var_0 = maps\_utility::musiclength( "mus_oilrig_sneak_music" );

    while ( !common_scripts\utility::flag( "lower_room_breached" ) )
    {
        maps\_utility::musicplaywrapper( "mus_oilrig_sneak_music" );
        wait(var_0);
        maps\_utility::music_stop( 1 );
        wait 1.1;
    }
}

_id_CE03()
{
    level endon( "upper_room_breached" );
    common_scripts\utility::flag_wait( "lower_room_breached" );
    musicstop();
    common_scripts\utility::flag_wait( "lower_room_cleared" );
    var_0 = maps\_utility::musiclength( "mus_oilrig_suspense_01_music_alt" );

    while ( !common_scripts\utility::flag( "upper_room_breached" ) )
    {
        maps\_utility::musicplaywrapper( "mus_oilrig_suspense_01_music_alt" );
        wait(var_0);
        maps\_utility::music_stop( 1 );
        wait 1.1;
    }
}

_id_D24E()
{
    level endon( "player_at_stairs_to_deck_2" );
    common_scripts\utility::flag_wait( "upper_room_breached" );
    musicstop();
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_given" );
    maps\_utility::musicplaywrapper( "mus_oilrig_suspense_01_music_alt" );
    common_scripts\utility::flag_wait_either( "ambush_enemies_alerted", "ambush_enemies_alerted_prematurely" );
    musicstop();
    wait 0.05;
    var_0 = maps\_utility::musiclength( "mus_oilrig_fight_music_01" );

    while ( !common_scripts\utility::flag( "player_at_stairs_to_deck_2" ) )
    {
        maps\_utility::musicplaywrapper( "mus_oilrig_fight_music_01" );
        wait(var_0);
        maps\_utility::music_stop( 1 );
        wait 1.1;
    }
}

_id_AA57()
{
    common_scripts\utility::flag_wait( "player_at_stairs_to_deck_2" );
    maps\_utility::music_stop( 5 );
    common_scripts\utility::flag_wait( "zodiacs_evaced" );
    level endon( "smoke_thrown" );
    var_0 = maps\_utility::musiclength( "mus_oilrig_fight_music_01" );

    while ( !common_scripts\utility::flag( "smoke_thrown" ) )
    {
        maps\_utility::musicplaywrapper( "mus_oilrig_fight_music_01" );
        wait(var_0);
        maps\_utility::music_stop( 1 );
        wait 1.1;
    }
}

_id_B6E8()
{
    level endon( "top_deck_room_breached" );
    common_scripts\utility::flag_wait( "smoke_thrown" );
    maps\_utility::music_stop( 4 );
    wait 4.1;
    var_0 = maps\_utility::musiclength( "mus_oilrig_top_deck_music_01" );

    while ( !common_scripts\utility::flag( "top_deck_room_breached" ) )
    {
        maps\_utility::musicplaywrapper( "mus_oilrig_top_deck_music_01" );
        wait(var_0);
        maps\_utility::music_stop( 1 );
        wait 1.1;
    }
}

_id_C426()
{
    common_scripts\utility::flag_wait( "top_deck_room_breached" );
    musicstop();
}

_id_B6F2()
{
    common_scripts\utility::flag_wait( "barracks_cleared" );
    musicstop();
    wait 0.5;
    maps\_utility::musicplaywrapper( "mus_oilrig_victory_music" );
}

_id_AA38()
{

}

_id_CCB7()
{
    maps\_utility::set_battlechatter( 0 );
}

_id_D148( var_0 )
{
    if ( var_0.team == "axis" )
        var_0 thread _id_CCE9();

    if ( var_0.team == "allies" )
        var_0 thread _id_B2D5();
}

_id_B2D5()
{
    common_scripts\utility::flag_wait( "player_ready_to_be_helped_from_water" );
    thread animscripts\utility::personalcoldbreath();
}

_id_CCE9()
{
    self endon( "death" );

    if ( maps\_utility::has_shotgun() )
        maps\_utility::cqb_walk( "on" );

    if ( level._id_CF6F == 1 )
        thread _id_B53B();

    var_0 = undefined;
    var_1 = undefined;

    switch ( level.gameskill )
    {
        case 0:
            var_0 = 1;
            var_1 = 1.5;
            break;
        case 1:
            var_0 = 1.5;
            var_1 = 1.5;
            break;
        case 2:
            var_0 = 2;
            var_1 = 1;
            break;
        case 3:
            var_0 = 2;
            var_1 = 1;
            break;
    }

    self.baseaccuracy *= var_1;

    while ( !isdefined( self.doorflashchance ) )
        wait 0.05;

    self.doorflashchance *= var_0;

    if ( common_scripts\utility::flag( "need_to_check_axis_death" ) && level.gameskill < 2 )
        thread _id_C38B();
}

_id_C38B()
{
    self waittill( "death", var_0 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
        level notify( "player_killed_an_enemy" );
}

_id_B1AE()
{
    self endon( "death" );
    self.animname = "generic";
    var_0 = self.spawner;
    var_1 = undefined;
    var_2 = undefined;
    self hide();
    self.ignoreme = 1;
    var_0 maps\_anim::anim_first_frame_solo( self, self.animation );
    var_3 = spawn( "script_origin", self.spawner.origin );
    thread common_scripts\utility::delete_on_death( var_3 );
    var_3.angles = self.spawner.angles;

    switch ( self.animation )
    {
        case "oilrig_rappel_over_rail_R":
            var_1 = "oilrig_rappelrope_50ft";
            var_2 = "oilrig_rappelrope_over_rail_R";
            break;
        case "oilrig_rappel_2_crouch":
            var_1 = "oilrig_rappelrope_80ft";
            var_2 = "oilrig_rappelrope_2_crouch";
            break;
        default:
            break;
    }

    var_4 = spawn( "script_model", var_3.origin );
    var_4 setmodel( var_1 );
    var_4.animname = "rope";
    var_4 maps\_utility::assign_animtree();
    var_3 maps\_anim::anim_first_frame_solo( var_4, var_2 );
    self._id_CEA0 = self.health;
    self.health = 3;
    self show();
    self.allowdeath = 1;
    thread _id_C6C4();
    var_3 thread _id_AD75( var_4, var_2 );
    var_0 thread maps\_anim::anim_generic( self, self.animation );
    wait 1.5;
    self.ignoreme = 0;
    self waittill( "over_solid_ground" );
    self.health = self._id_CEA0;
}

_id_AD75( var_0, var_1 )
{
    maps\_anim::anim_single_solo( var_0, var_1 );
    common_scripts\utility::flag_wait( "player_at_stairs_to_top_deck" );

    if ( isdefined( self ) )
        self delete();

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_C6C4()
{
    self endon( "over_solid_ground" );

    if ( !isdefined( self ) )
        return;

    maps\_utility::set_deathanim( "fastrope_fall" );
    self waittill( "death" );
    thread common_scripts\utility::play_sound_in_space( "generic_death_falling" );
}

_id_B0CB( var_0 )
{
    var_0 endon( "death" );
    var_0 notify( "over_solid_ground" );
    var_0 maps\_utility::clear_deathanim();
}

_id_A88B( var_0 )
{
    var_0 endon( "death" );
    var_0 maps\_utility::clear_deathanim();
}

_id_AF59()
{
    level endon( "obj_hostages_secure_complete" );
}

_id_C53D()
{
    self endon( "death" );

    if ( isdefined( self.riders ) )
    {
        foreach ( var_1 in self.riders )
        {
            var_1.ignoreme = 1;
            var_1 setthreatbiasgroup( "oblivious" );
        }
    }

    thread vehicle_scripts\_attack_heli::heli_spotlight_on( undefined, 1 );
    self waittill( "damage" );
    self.dontwaitforpathend = 1;
    vehicle_scripts\_attack_heli::begin_attack_heli_behavior( self );
    wait 2;
    thread _id_BD80();
}

_id_AE24( var_0 )
{
    foreach ( var_2 in var_0 )
        thread _id_AA84( var_2 );
}

_id_AA84( var_0 )
{
    common_scripts\utility::flag_init( var_0 + "_shot_down" );
    var_1 = maps\_vehicle::_id_C28A( var_0 );
    level._id_C063 = var_1;
    level._id_C063.enablerocketdeath = 1;
    common_scripts\utility::array_thread( var_1.mgturret, ::_id_B904 );
    wait 1;
    var_1 common_scripts\utility::waittill_either( "death", "crash_done" );
    common_scripts\utility::flag_set( var_0 + "_shot_down" );
}

_id_B904()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getfx( "minigun_shell_eject" );

    for (;;)
    {
        if ( self isfiringturret() )
        {
            for (;;)
            {
                if ( !self isfiringturret() )
                    break;

                wait 0.05;
            }
        }

        wait 0.05;
    }
}

_id_ABDF()
{
    var_0 = getent( "derrick_thing", "targetname" );
    var_1 = 2;
    var_2 = 300;
    var_0 thread rotating_drill( var_2, var_1 );
}

_id_CEC0()
{
    common_scripts\utility::flag_set( "player_broke_stealth" );
}

_id_BAA2()
{
    level endon( "mission failed" );

    while ( !isdefined( self.breachfinished ) )
        wait 0.1;

    while ( self.breachfinished == 0 )
        wait 0.1;

    wait(randomfloatrange( 1, 2 ));
    var_0 = level._id_CCFA[0];
    level._id_CCFA = common_scripts\utility::array_remove( level._id_CCFA, var_0 );
    self endon( "death" );
    self notify( "stop_idle" );
    self setgoalnode( var_0 );
    self.goalradius = 64;
    self.alertlevel = "noncombat";
    self waittill( "goal" );
}

_id_C8BD( var_0 )
{
    var_1 = randomint( 21 );

    if ( var_1 < 10 )
        var_2 = "oilrig_merc_chatter_0" + var_1;
    else
        var_2 = "oilrig_merc_chatter_" + var_1;

    thread common_scripts\utility::play_sound_in_space( level.scr_sound[var_2], var_0 );
}

_id_B270()
{

}

_id_BAE6()
{
    var_0 = randomint( 4 );
    maps\_utility::radio_dialogue( "oilrig_nsl_outtogether_0" + var_0 );
}

_id_B99C()
{
    var_0 = randomint( 3 );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::radio_dialogue( "oilrig_ns2_fireat4_0" + var_0 );
    maps\_utility::battlechatter_on( "allies" );
}

_id_D1B7()
{
    var_0 = randomint( 6 );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::radio_dialogue( "oilrig_heli_grats_0" + var_0 );
    maps\_utility::battlechatter_on( "allies" );
}

_id_B78C()
{
    maps\_utility::battlechatter_off( "allies" );
    var_0 = randomint( 5 );
    maps\_utility::radio_dialogue( "oilrig_enemy_smoke_0" + var_0 );
    maps\_utility::battlechatter_on( "allies" );
}

_id_AA75()
{
    level endon( "player_approaching_topdeck_building" );

    if ( level.player maps\_utility::player_has_thermal() )
    {
        var_0 = randomint( 2 );
        maps\_utility::radio_dialogue( "oilrig_use_thermal_0" + var_0 );
    }
    else
    {
        var_0 = randomint( 2 );
        maps\_utility::radio_dialogue( "oilrig_find_thermal_0" + var_0 );
    }

    _id_C451( 7 );
}

_id_C451( var_0 )
{
    level endon( "oilrig_timeout_func" );
    level endon( "player_approaching_topdeck_building" );
    thread _id_B159( var_0 );

    for (;;)
    {
        wait 0.1;

        while ( !level.player maps\_utility::player_has_thermal() )
            wait 0.5;

        if ( level.player adsbuttonpressed() )
            break;
    }
}

_id_B159( var_0 )
{
    wait(var_0);
    level notify( "oilrig_timeout_func" );
}

_id_D28F()
{
    var_0 = randomint( 4 );
    maps\_utility::radio_dialogue( "oilrig_heloapproach_0" + var_0 );
}

_id_AAD6()
{
    var_0 = randomint( 3 );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::radio_dialogue( "oilrig_ambush_helo_alert_0" + var_0 );
    maps\_utility::battlechatter_on( "allies" );
}

_id_AECF()
{
    var_0 = randomint( 3 );
    maps\_utility::radio_dialogue( "dialogue_heli_all_clear_0" + var_0 );
}

_id_BD61( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        var_1 = var_3 maps\_utility::get_ai_touching_volume( "axis" );

        if ( var_1.size )
            return 0;
    }

    return 1;
}

_id_BF10( var_0 )
{
    level notify( "breach_nag_called" );
    level endon( "breach_nag_called" );
    level endon( "lower_room_cleared" );
    level endon( "upper_room_cleared" );
    level endon( "A door in breach group " + var_0 + " has been activated." );
    var_1 = 0;

    for (;;)
    {
        if ( var_0 == 300 )
            wait(randomfloatrange( 5, 8 ));
        else
            wait(randomfloatrange( 12, 18 ));

        if ( var_0 == 300 )
        {
            var_2 = getentarray( "breach_safe_volume", "targetname" );

            if ( !_id_BD61( var_2 ) || !common_scripts\utility::flag( "left_deck3_dudes_spawned" ) )
            {
                wait 3;
                continue;
            }
        }

        maps\_utility::radio_dialogue( "breach_nag_0" + var_1 );
        var_1++;

        if ( var_1 > 3 )
            var_1 = 0;
    }
}

_id_BB44()
{
    var_0 = undefined;

    switch ( level.gameskill )
    {
        case 0:
            var_0 = 500;
            break;
        case 1:
            var_0 = 500;
            break;
        case 2:
            var_0 = 500;
            break;
        case 3:
            var_0 = 500;
            break;
    }

    var_1 = getentarray( "easy", "script_noteworthy" );

    if ( level.gameskill > 0 )
        common_scripts\utility::array_call( var_1, ::delete );

    level.player.old_threatbias = level.player.threatbias;
    level.player.threatbias += var_0;
    common_scripts\utility::flag_set( "difficulty_initialized" );
}

_id_BA1D( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = getent( var_1.script_linkto, "script_linkname" );
    var_2 notify( "trigger", level.player );
}

_id_B6CD()
{
    common_scripts\utility::array_thread( level._id_B589, common_scripts\utility::trigger_off );
}

_id_AFCD( var_0, var_1 )
{
    var_2 = getent( "gate_01", "targetname" );
    var_2 connectpaths();

    if ( isdefined( var_0 ) )
        var_2 moveto( var_2.origin - ( 0.0, -170.0, 0.0 ), 1 );
    else
    {
        if ( !isdefined( var_1 ) )
            common_scripts\utility::flag_wait_either( "ambush_enemies_approaching", "ambush_enemies_alerted_prematurely" );

        var_2 thread maps\_utility::play_sound_on_entity( "scn_oilrig_fence_open" );
        var_2 moveto( var_2.origin - ( 0.0, -170.0, 0.0 ), 8, 3, 3 );
        wait 8;
    }

    common_scripts\utility::flag_set( "ambush_gate_opened" );
}

_id_B2C8()
{
    precacheitem( "slamraam_missile_dcburning" );
    precachemodel( "h2_prop_npc_cigar" );
    precachemodel( "com_floodlight" );
    precachemodel( "tag_turret" );
    precachemodel( "prop_seal_udt_flippers" );
    precachemodel( "prop_seal_udt_goggles" );
    precachemodel( "prop_seal_udt_draeger" );
    precachemodel( "furniture_chair_metal01" );
    precachemodel( "com_restaurantchair_2" );
    precachemodel( "furniture_long_desk_animate" );
    maps\_props::add_smoking_prop_assets( "cigarette" );
    precachemodel( "h2_head_seal_udt_f_lifesaver" );
    precachemodel( "h2_head_seal_udt_i_lifesaver" );
    precachemodel( "body_hero_seal_udt_ghost_wet" );
    precachemodel( "body_hero_seal_udt_soap_wet" );
    precachemodel( "body_seal_udt_assault_a_wet" );
    precachemodel( "body_seal_udt_assault_b_wet" );
    precachemodel( "body_seal_udt_smg_wet" );
    precachemodel( "head_hero_ghost_udt_wet" );
    precachemodel( "head_hero_soap_udt_wet" );
    precachemodel( "head_seal_udt_d_lifesaver_wet" );
    precachemodel( "head_seal_udt_f_lifesaver_wet" );
    precachemodel( "head_seal_udt_i_lifesaver_wet" );
    precachemodel( "head_seal_udt_asia_lifesaver_wet" );
    precachemodel( "head_seal_udt_a_wet" );
    precachemodel( "head_seal_udt_c_wet" );
    precachemodel( "head_seal_udt_d_wet" );
    precachemodel( "head_seal_udt_e_wet" );
    precachemodel( "head_seal_udt_f_wet" );
    precachemodel( "head_seal_udt_i_wet" );
    precachemodel( "head_seal_udt_asia_wet" );
    precachemodel( "viewhands_udt" );
    precachemodel( "viewhands_udt_wet" );
    precachemodel( "viewbody_udt" );
    precachemodel( "viewbody_udt_wet" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup" );
    precacheturret( "heli_spotlight" );
    precacheturret( "player_view_controller" );
    precacheitem( "rpg_nodamage" );
    precacheitem( "m14_scoped_arctic" );
    precacheitem( "m4m203_reflex" );
    precacheitem( "scar_h_thermal" );
    precacheitem( "mp5_reflex" );
    precacheitem( "mp5_silencer_reflex" );
    precachemodel( "weapon_rpd_MG_Setup" );
    precachemodel( "furniture_chair_metal01" );
    precachemodel( "com_restaurantchair_2" );
    precachemodel( "oilrig_rappelrope_80ft" );
    precachemodel( "oilrig_rappelrope_50ft" );
    precachemodel( "viewhands_player_udt" );
    precacherumble( "light_3s" );
    precacherumble( "damage_heavy" );
    precacherumble( "tank_rumble" );
    precacherumble( "pistol_fire" );
    precacherumble( "mig_rumble" );
    precachemodel( "weapon_parabolic_knife" );
    precachemodel( "weapon_us_smoke_grenade_burnt" );
    precachemodel( "com_vending_can_new2_destroyed" );
    precachemodel( "h2_head_opforce_merc_f" );
    precacheitem( "missile_mi28" );
    precachestring( &"OILRIG_MISSIONFAIL_HELI_DEATH" );
    precachestring( &"OILRIG_MISSIONFAIL_EXPLOSIVES_NOTPLANTED" );
    precachestring( &"SCRIPT_DEBUG_LEVEL_END" );
    precachestring( &"OILRIG_OBJ_STEALTHKILL" );
    precachestring( &"OILRIG_OBJ_HOSTAGES_SECURE" );
    precachestring( &"OILRIG_OBJ_C4_AMBUSH_PLANT" );
    precachestring( &"OILRIG_OBJ_AMBUSH" );
    precachestring( &"OILRIG_OBJ_EXPLOSIVES_LOCATE" );
    precachestring( &"OILRIG_HINT_AMBUSH_COVER" );
    precachestring( &"OILRIG_HINT_C4_SWITCH" );
    precachestring( &"OILRIG_MISSIONFAIL_ENEMIES_ALERTED_HOSTAGES_KILLED" );
    precachestring( &"OILRIG_HINT_C4_DETONATE" );
    precachestring( &"SCRIPT_PLATFORM_OILRIG_HINT_STEALTH_KILL" );
    precachestring( &"OILRIG_HINT_THERMAL_WEAPON_USE" );
    precachestring( &"OILRIG_HINT_THERMAL_WEAPON_FIND" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );

    precachemodel( "h2_gfl_st_ar15_viewbody" );
    precachemodel( "h2_gfl_st_ar15_viewhands" );
    precachemodel( "h2_gfl_st_ar15_viewhands_player" );

}

_id_B351( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    waittillframeend;

    if ( isdefined( var_1 ) && var_1 != 1 )
    {
        var_3 = getentarray( "team2", "targetname" );
        level.team2 = maps\_utility::array_spawn( var_3 );
        common_scripts\utility::array_thread( level.team2, ::_id_CE4E );
        level.squad = [];
        level._id_AC03 = maps\_utility::spawn_script_noteworthy( "price" );
        level._id_AC03.animname = "soap";
        level._id_C280 = maps\_utility::spawn_script_noteworthy( "friendly02" );
        level._id_BBBD = maps\_utility::spawn_script_noteworthy( "friendly03" );
        level._id_AC03 maps\_utility::forceuseweapon( "mp5_silencer_reflex", "primary" );
        level._id_C280 maps\_utility::forceuseweapon( "mp5_silencer_reflex", "primary" );
        level._id_BBBD maps\_utility::forceuseweapon( "mp5_silencer_reflex", "primary" );
        level.squad[0] = level._id_AC03;
        level.squad[1] = level._id_C280;
        level.squad[2] = level._id_BBBD;
        common_scripts\utility::array_thread( level.squad, maps\_slowmo_breach::add_slowmo_breacher );
        common_scripts\utility::array_thread( level.squad, ::_id_B5DB );
    }

    level._id_C8BC = [];
    level._id_C8BC = maps\_utility::array_merge( level.squad, level.team2 );

    if ( maps\_utility::is_default_start() )
        return;

    var_4 = level.squad;
    var_5 = getnodearray( "friendlyStart" + var_0, "targetname" );

    while ( var_4.size > 0 )
    {
        wait 0.05;

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            if ( isdefined( var_5[var_6].script_noteworthy ) )
            {
                switch ( var_5[var_6].script_noteworthy )
                {
                    case "nodePrice":
                        level._id_AC03 maps\_utility::teleport_ai( var_5[var_6] );
                        var_4 = common_scripts\utility::array_remove( var_4, level._id_AC03 );
                        var_5 = common_scripts\utility::array_remove( var_5, var_5[var_6] );
                        continue;
                    case "nodeFriendly02":
                        level._id_C280 maps\_utility::teleport_ai( var_5[var_6] );
                        var_4 = common_scripts\utility::array_remove( var_4, level._id_C280 );
                        var_5 = common_scripts\utility::array_remove( var_5, var_5[var_6] );
                        continue;
                    case "nodeFriendly03":
                        level._id_BBBD maps\_utility::teleport_ai( var_5[var_6] );
                        var_4 = common_scripts\utility::array_remove( var_4, level._id_BBBD );
                        var_5 = common_scripts\utility::array_remove( var_5, var_5[var_6] );
                        continue;
                    default:
                        continue;
                }
            }
        }
    }

    if ( isdefined( var_2 ) && var_2 == 1 )
    {
        var_7 = getnodearray( "playerStart" + var_0, "targetname" );
        maps\_utility::teleport_players( var_7 );
    }
}

_id_CE4E()
{
    wait 0.5;
    maps\_utility::cqb_walk( "on" );
    thread maps\_utility::magic_bullet_shield();
    maps\_utility::setflashbangimmunity( 1 );
    self setthreatbiasgroup( "oblivious" );
    self.ignoreme = 1;
}

_id_B5DB()
{
    maps\_utility::cqb_walk( "on" );
    thread maps\_utility::magic_bullet_shield();
    maps\_utility::setflashbangimmunity( 1 );
    wait 0.05;

    if ( self == level._id_AC03 || self == level._id_C280 )
    {
        self.attackeraccuracy = 0.5;
        self.baseaccuracy *= 0.7;
    }
}

_id_B6F3( var_0 )
{
    level notify( "breach_explosion" );
}

_id_C198()
{
    self endon( "death" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "body_discover" )
        self.usechokepoints = 0;

    self.ignoreme = 1;
    var_0 = self.moveplaybackrate;
    self.moveplaybackrate = 0.7;
    self setthreatbiasgroup( "oblivious" );
    self.animname = "generic";
    maps\_utility::cqb_walk( "on" );
    wait 0.5;
    thread _id_B4FE();
    thread _id_B5EB();
    common_scripts\utility::flag_wait_either( "ambush_enemies_alerted", "ambush_enemies_alerted_prematurely" );
    wait 1;
    self.ignoreme = 0;
    self setthreatbiasgroup( "axis" );
    maps\_utility::cqb_walk( "off" );
    self.moveplaybackrate = var_0;
}

_id_D31D()
{
    self endon( "death" );
    self.ignoreme = 1;
    self setthreatbiasgroup( "oblivious" );
    maps\jake_tools::set_walkdist( 1000 );
    self.disablearrivals = 1;
    self setthreatbiasgroup( "oblivious" );
    self clearenemy();
    wait 0.1;
    thread maps\_patrol::patrol();
}

_id_ABE3( var_0 )
{
    level endon( "breach_explosion" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2 );

        if ( isplayer( var_2 ) )
            thread _id_B662( var_0 );
    }
}

_id_B662( var_0 )
{
    level notify( "doing_generic_mission_fail" );
    level endon( "doing_generic_mission_fail" );
    wait 0.5;
    thread _id_D442();

    if ( isdefined( var_0 ) )
        var_0 thread common_scripts\utility::play_sound_in_space( "weap_deserteagle_fire_npc" );

    wait 0.25;
    level.player thread common_scripts\utility::play_loop_sound_on_entity( "emt_oilrig_alarm_alert" );

    if ( isdefined( var_0 ) )
        var_0 thread common_scripts\utility::play_sound_in_space( "weap_deserteagle_fire_npc" );

    wait 0.5;
    thread _id_BD80();
}

_id_D442()
{
    var_0 = getentarray( "blood_spatters", "targetname" );
}

_id_BD80()
{
    common_scripts\utility::flag_set( "oilrig_mission_failed" );
    setdvar( "ui_deadquote", &"OILRIG_MISSIONFAIL_ENEMIES_ALERTED_HOSTAGES_KILLED" );
    level notify( "mission failed" );
    maps\_utility::missionfailedwrapper();
}

_id_B5EB()
{
    self endon( "death" );
    thread _id_BBF0();
    level endon( "ambush_enemies_alerted" );
    level endon( "ambush_enemies_alerted_prematurely" );
    self waittill( "enemy" );
    common_scripts\utility::flag_set( "ambush_enemies_alerted_prematurely" );
}

_id_BBF0()
{
    self endon( "death" );
    level endon( "ambush_enemies_alerted" );
    level endon( "ambush_enemies_alerted_prematurely" );
    var_0 = getent( "exposed_ambush_spot", "targetname" );

    for (;;)
    {
        wait 1.5;

        if ( self istouching( var_0 ) )
        {
            if ( common_scripts\utility::flag( "player_in_exposed_ambush_spot" ) )
                break;
        }
    }

    common_scripts\utility::flag_set( "ambush_enemies_alerted_prematurely" );
}

_id_C5AE( var_0 )
{
    var_0 = common_scripts\utility::array_randomize( var_0 );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        wait(randomfloatrange( 0.25, 1 ));
        var_4 = var_3 maps\_utility::spawn_ai();
        var_1[var_1.size] = var_4;
    }

    return var_1;
}

_id_B563()
{
    self._id_BCA9 = self.origin;
    self._id_AC23 = self.angles;
    self rotateyaw( 160, 0.5 );
    self moveto( self.origin + ( 3.0, 0.0, 0.0 ), 0.1 );
    self connectpaths();
}

_id_BB54()
{
    self._id_BCA9 = self.origin;
    self._id_AC23 = self.angles;
    self rotateyaw( -110, 0.5 );
    self moveto( self.origin + ( 3.0, 0.0, 0.0 ), 0.1 );
    self connectpaths();
}

_id_BCAF()
{
    self.origin = self._id_BCA9;
    self.angles = self._id_AC23;
}

_id_C74C()
{
    self.origin = self._id_BCA9;
    self.angles = self._id_AC23;
}

_id_D5C4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1024;

    var_1 = getaiarray( "axis" );
    thread maps\_utility::ai_delete_when_out_of_sight( var_1, var_0 );
}

_id_BD1F( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_1.origin + ( 0.0, 0.0, 0.0 ) );
    var_2 setmodel( "vehicle_submarine_nuclear" );
    var_2.origin = var_1.origin;
    var_2.angles = var_1.angles;
    var_2.body = undefined;
    var_2._id_CA94 = undefined;
    var_3 = getentarray( "submarine_" + var_0, "targetname" );

    foreach ( var_5 in var_3 )
    {
        if ( isdefined( var_5.script_parameters ) && var_5.script_parameters == "sub" )
        {
            var_2.body = var_5;
            continue;
        }

        var_2._id_CA94 = var_5;
    }

    var_2.dds = undefined;
    var_2._id_B2FE = undefined;

    if ( var_0 == "01" )
    {
        var_2._id_B2FE = getentarray( "sub_dds_01", "targetname" );

        foreach ( var_5 in var_2._id_B2FE )
        {
            if ( isdefined( var_5.script_noteworthy ) && var_5.script_noteworthy == "body" )
            {
                var_2.dds = spawn( "script_origin", var_5.origin );
                var_2.dds.angles = var_5.angles;
                var_2.dds.angles = var_5.angles;
                break;
            }
        }

        foreach ( var_5 in var_2._id_B2FE )
            var_5 linkto( var_2.dds );
    }
    else
        var_2.dds = getent( "sub_dds_" + var_0, "targetname" );

    var_2._id_C83D = getent( "dds_door_" + var_0, "targetname" );
    var_2._id_C83D._id_CADF = undefined;

    if ( var_0 == "01" )
    {
        var_2._id_C83D._id_CADF = getent( "dds_door_01_seal", "targetname" );
        var_2._id_C83D._id_CADF linkto( var_2._id_C83D );
    }

    var_2.body.origin = var_2.origin;
    var_2.body.angles = var_2.angles;
    var_2.animname = "submarine_" + var_0;

    if ( var_2.animname == "submarine_01" )
        var_2.body linkto( var_2, "TAG_ORIGIN", ( -10.0, 0.0, -324.0 ), ( 0.0, 0.0, 0.0 ) );
    else
        var_2.body linkto( var_2, "TAG_ORIGIN", ( -10.0, 0.0, -348.0 ), ( 0.0, 0.0, 0.0 ) );

    var_2.body show();
    var_2._id_C83D linkto( var_2.dds );
    var_2.dds.origin = var_2.origin;
    var_2.dds.angles = var_2.angles;
    var_2.dds linkto( var_2, "TAG_ORIGIN", ( 330.0, 0.0, 100.0 ), ( 0.0, 0.0, 0.0 ) );
    var_2 maps\_utility::assign_animtree();
    var_2 hidepart( "origin_animate_jnt" );
    var_2 thread _id_C191();
    return var_2;
}

_id_BDC3( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_1.origin + ( 0.0, 0.0, 0.0 ) );
    var_2 setmodel( "vehicle_submarine_sdv" );
    var_2.origin = var_1.origin;
    var_2.angles = var_1.angles;
    var_2.animname = "sdv_" + var_0;
    var_2 maps\_utility::assign_animtree();
    var_2 thread _id_B96C();
    return var_2;
}

_id_B96C()
{
    var_0 = self.animname + "_starting";
    var_1 = self.animname + "_stopping";
    var_2 = self.animname + "_arriving";
    common_scripts\utility::flag_init( var_0 );
    common_scripts\utility::flag_init( var_2 );
    common_scripts\utility::flag_init( var_1 );
    self waittillmatch( "single anim", "start" );
    common_scripts\utility::flag_set( var_0 );
    self.moving = 1;
    self notify( "moving" );

    switch ( self.animname )
    {
        case "sdv_01":
            self waittillmatch( "single anim", "passing" );
            common_scripts\utility::flag_set( "sdv_01_passing" );
            break;
    }

    self waittillmatch( "single anim", "arrival" );
    self notify( "arriving" );
    common_scripts\utility::flag_set( var_2 );
    self waittillmatch( "single anim", "stop" );
    self.moving = 0;
    self notify( "stopped_moving" );
    common_scripts\utility::flag_set( var_1 );
    self waittillmatch( "single anim", "end" );
}

_id_C191()
{

}

_id_C455()
{
    self rotateto( self.angles + ( 0.0, -90.0, 0.0 ), 12, 2, 2 );
    self playsound( "scn_subhatch_open" );
}

_id_D56C()
{
    var_0 = getent( "killtrigger_ocean", "targetname" );
    var_0 notify( "turn_off" );
}

_id_BD07()
{
    var_0 = getent( "killtrigger_ocean", "targetname" );
    var_0 notify( "turn_off" );
    var_0 endon( "turn_off" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isdefined( var_1 ) && isplayer( var_1 ) )
        {
            var_2 = common_scripts\utility::spawn_tag_origin();
            var_2.origin = var_1.origin;
            var_2.angles = var_1.angles;
            var_1 playerlinktoblend( var_2, "tag_origin", 0.05 );
            var_1 kill();

            if ( maps\_utility::is_specialop() )
            {
                setdvar( "ui_deadquote", &"OILRIG_MISSIONFAIL_WATER_DEATH" );
                level notify( "mission failed" );
                maps\_utility::missionfailedwrapper();
            }

            break;
        }
    }
}

_id_A908( var_0, var_1 )
{
    var_2 = getaiarray( "allies" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( var_5.script_noteworthy ) && var_5.script_noteworthy == var_1 )
            var_3 = common_scripts\utility::array_add( var_3, var_5 );
    }

    if ( var_3.size == 0 )
    {

    }

    return var_3[0];
}

_id_B3BA( var_0 )
{
    level.playerspeed = var_0;
    self setmovespeedscale( var_0 );
}

_id_B731( var_0 )
{
    var_0 endon( "death" );
    var_1 = 32;
    var_2 = 0;
    var_3 = undefined;
    var_4 = undefined;

    while ( isdefined( var_0 ) )
    {
        wait(randomfloatrange( 15, 25 ));
        var_5 = undefined;
        level.squad = maps\_utility::remove_dead_from_array( level.squad );
        var_6 = common_scripts\utility::get_array_of_farthest( level.player.origin, level.squad );

        while ( !isdefined( var_5 ) )
        {
            wait 1.5;
            var_6 = maps\_utility::remove_dead_from_array( var_6 );

            foreach ( var_4 in var_6 )
            {
                if ( !isdefined( var_4 ) )
                    continue;

                var_8 = level.player geteye();

                if ( common_scripts\utility::within_fov( var_8, level.player getplayerangles(), var_4.origin, level.cosine["45"] ) )
                    continue;
                else
                {
                    var_3 = spawn( "script_origin", var_0.origin + ( 0.0, 0.0, -200.0 ) );
                    var_0 thread common_scripts\utility::delete_on_death( var_3 );
                    var_3 linkto( var_0 );

                    if ( !bullettracepassed( var_4 gettagorigin( "tag_flash" ) + ( 0, 0, var_1 ), var_3.origin, 1, var_4 ) )
                    {
                        var_3 delete();
                        continue;
                    }
                    else
                    {
                        var_5 = var_4;
                        break;
                    }
                }
            }
        }

        if ( isdefined( var_3 ) && bullettracepassed( var_5 gettagorigin( "tag_flash" ) + ( 0, 0, var_1 ), var_3.origin, 1, var_5 ) )
        {
            if ( !isdefined( var_5 ) )
                continue;

            magicbullet( "rpg_nodamage", var_5 gettagorigin( "tag_flash" ) + ( 0, 0, var_1 ), var_3.origin );
            var_3 delete();
            var_2 = common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), var_0.origin, level.cosine["45"] );
            wait 0.5;

            if ( var_2 )
                _id_B99C();
        }
    }
}

_id_B233( var_0 )
{
    level endon( "oilrig_stealth_monitor_off" );
    level._id_CF6F = 1;
    level thread _id_B5E5();
    var_1 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_1, ::_id_B53B );
    level.player thread _id_CF25();
    level waittill( "stealth_broken" );
    level.player._id_CD51 = 0;

    if ( isdefined( var_0 ) )
        thread _id_B662();
}

_id_B53B()
{
    self endon( "death" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "not_alerted" )
        return;

    self notify( "running_stealth_monitor_on_me" );
    self endon( "running_stealth_monitor_on_me" );
    level endon( "oilrig_stealth_monitor_off" );
    thread _id_C097();
    self addaieventlistener( "grenade danger" );
    self addaieventlistener( "gunshot" );
    self addaieventlistener( "silenced_shot" );
    self addaieventlistener( "bulletwhizby" );
    self addaieventlistener( "projectile_impact" );
    wait 0.5;

    while ( isalive( self ) )
    {
        self waittill( "ai_event", var_0, var_1 );

        if ( var_0 == "grenade danger" && var_1.model != "h2_projectile_cheat_soccer_ball" || var_0 == "damage" || var_0 == "gunshot" || var_0 == "bulletwhizby" || var_0 == "projectile_impact" || var_0 == "explode" )
            break;
    }

    wait 1;

    if ( isalive( self ) )
        thread _id_BE2F();
}

_id_BE2F()
{
    if ( isdefined( self ) && isalive( self ) && !isdefined( self._id_D4A8 ) )
    {
        level notify( "stealth_broken" );
        maps\_utility::anim_stopanimscripted();
        self notify( "alerted" );
    }
}

_id_CF25()
{

}

_id_B151()
{
    level notify( "oilrig_stealth_monitor_off" );
    level._id_CF6F = 0;
}

_id_C097()
{
    self endon( "stealth_takedown_started" );
    self endon( "death" );
    level endon( "oilrig_stealth_monitor_off" );

    while ( isdefined( self ) )
    {
        wait 1;

        if ( !common_scripts\utility::within_fov( self.origin, self.angles, level.player.origin + ( 0.0, 0.0, 32.0 ), level.cosine["45"] ) )
            continue;

        if ( !sighttracepassed( self.origin + ( 0.0, 0.0, 32.0 ), level.player.origin + ( 0.0, 0.0, 32.0 ), 0, self ) )
            continue;

        if ( distancesquared( self.origin, level.player.origin ) < level._id_A933 )
            break;
    }

    thread _id_BE2F();
}

_id_B5E5()
{
    level endon( "oilrig_stealth_monitor_off" );
    level waittill( "destructible_exploded" );
    level notify( "stealth_broken" );
}

_id_BF62()
{
    level.player.ignoreme = 1;

    foreach ( var_1 in level.squad )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1.ignoreme = 1;
        var_1 setthreatbiasgroup( "oblivious" );
    }
}

_id_D432()
{
    level.player.ignoreme = 0;

    foreach ( var_1 in level.squad )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1.ignoreme = 0;
        var_1 setthreatbiasgroup( "allies" );
    }
}

_id_B391( var_0, var_1 )
{
    wait(var_0);
    setculldist( var_1 );
}

_id_A9A2( var_0 )
{
    self endon( "death" );
    var_0 waittill( "trigger" );
    self notify( "landing" );
    maps\_utility::vehicle_detachfrompath();
    self setgoalyaw( var_0.angles[1] );
    vehicle_scripts\_littlebird_landing::vehicle_land_beneath_node( undefined, var_0 );
    self notify( "landed" );
}

_id_D0F0()
{
    var_0 = getentarray( "script_origin", "classname" );
    var_1 = maps\_utility::array_merge( var_0, level.struct );
    common_scripts\utility::array_thread( var_1, ::_id_AD7E );
}

_id_AD7E()
{
    if ( !isdefined( self.script_flag ) )
        return;

    common_scripts\utility::flag_init( self.script_flag );

    if ( getdvar( "oilrig_debug" ) == "1" )
        thread maps\_utility::debug_message( self.script_flag, self.origin, 9999 );

    self waittill( "trigger" );
    common_scripts\utility::flag_set( self.script_flag );

    if ( getdvar( "oilrig_debug" ) == "1" )
        iprintlnbold( "flag: " + self.script_flag + " has been set" );
}

_id_C43C()
{
    common_scripts\utility::array_thread( level.squad, ::_id_D3A5 );
}

_id_C79E()
{
    foreach ( var_1 in level.squad )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 notify( "stop_adjust_movement_speed" );
        var_1.moveplaybackrate = 1.0;

        if ( isdefined( var_1._id_C3E3 ) )
            var_1._id_C3E3 = 1;
    }
}

_id_D3A5()
{
    if ( !isdefined( self ) )
        return;

    self notify( "stop_adjust_movement_speed" );
    self endon( "death" );
    self endon( "stop_adjust_movement_speed" );

    for (;;)
    {
        wait(randomfloatrange( 0.5, 1.5 ));

        while ( _id_CFAC() )
        {
            self.moveplaybackrate = 2.5;
            wait 0.05;
        }

        self.moveplaybackrate = 1.0;

        if ( isdefined( self._id_C3E3 ) )
            self._id_C3E3 = 1;
    }
}

_id_CFAC()
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );

    if ( !isdefined( self.goalpos ) )
        return 0;

    if ( self.lookaheadhitsstairs || self.stairsstate != "none" )
        return 0;

    if ( distancesquared( self.origin, self.goalpos ) <= level._id_B964 )
        return 0;

    if ( distance2dsquared( self.origin, level.player.origin ) <= 63504 && abs( self.origin[2] - level.player.origin[2] ) < 72 )
        return 0;

    if ( common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), self.origin, level.cosine["60"] ) )
        return 0;

    return 1;
}

_id_C71C()
{
    level._id_C315 = [];
    level._id_B077 = [];
    level._id_BF0A = [];
    level._id_D47A = [];
    var_0 = getent( "effects_underwater", "script_noteworthy" );
    var_1 = getent( "effects_lower_rig", "script_noteworthy" );
    var_2 = getent( "effects_mid_decks", "script_noteworthy" );
    var_3 = getent( "effects_top_deck", "script_noteworthy" );
    var_4 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    for ( var_5 = 0; var_5 < level.createfxent.size; var_5++ )
    {
        var_6 = level.createfxent[var_5];
        var_4.origin = var_6.v["origin"];

        if ( var_4 istouching( var_0 ) )
        {
            level._id_C315[level._id_C315.size] = var_6;
            continue;
        }

        if ( var_4 istouching( var_1 ) )
        {
            level._id_B077[level._id_B077.size] = var_6;
            continue;
        }

        if ( var_4 istouching( var_2 ) )
        {
            level._id_BF0A[level._id_BF0A.size] = var_6;
            continue;
        }

        if ( var_4 istouching( var_3 ) )
        {
            if ( issubstr( var_6.v["fxid"], "oilrig_burnoff_fire" ) )
                continue;

            level._id_D47A[level._id_D47A.size] = var_6;
            continue;
        }
    }

    var_4 delete();
}

_id_BD74()
{
    for (;;)
    {
        wait 1;
        self waittill( "trigger" );
        setsaveddvar( "ui_hidemap", 0 );
        maps\_compass::setupminimap( self.script_noteworthy );
    }
}

_id_B6A2()
{

}

_id_BFFD( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_0 );
    level.breachfriendlies = maps\_utility::remove_dead_from_array( level.breachfriendlies );

    foreach ( var_3 in level.breachfriendlies )
    {
        var_3.disabledamageshieldpain = 1;
        var_3 maps\_utility::disable_pain();
    }

    common_scripts\utility::flag_wait( var_1 );
    level.breachfriendlies = maps\_utility::remove_dead_from_array( level.breachfriendlies );

    foreach ( var_3 in level.breachfriendlies )
    {
        var_3.disabledamageshieldpain = undefined;
        var_3 maps\_utility::enable_pain();
    }
}

_id_BF40()
{
    for (;;)
    {
        self waittill( "trigger" );
        level.breachfriendlies = maps\_utility::remove_dead_from_array( level.breachfriendlies );
        var_0 = undefined;
        var_1 = undefined;
        level.squad = maps\_utility::remove_dead_from_array( level.squad );
        var_2 = undefined;

        if ( level.squad.size < level._id_B522 )
        {
            var_1 = getentarray( self.target, "targetname" );
            var_0 = level._id_B522 - level.squad.size;

            for ( var_3 = 0; var_3 < var_0; var_3++ )
            {
                var_2 = var_1[var_3] maps\_utility::spawn_ai( 1 );

                if ( isdefined( var_2 ) )
                {
                    var_2 maps\_utility::set_force_color( "r" );
                    level.squad = common_scripts\utility::array_add( level.squad, var_2 );
                    var_2 thread _id_CF5B();
                }
            }
        }

        wait 10;
    }
}

_id_CF5B()
{
    self endon( "death" );
    level._id_BBBD = self;
}

_id_D079()
{
    if ( !isdefined( self ) )
        return;

    common_scripts\_destructible::cleanupvars();

    if ( isdefined( self ) )
        self delete();
}

_id_BA48( var_0 )
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( var_0 ) && var_0.size > 0 )
    {
        if ( maps\_utility::is_in_array( var_0, self ) )
            return;
    }

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    if ( !issentient( self ) )
    {

    }

    self delete();
}

_id_A8DA( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = var_3 maps\_utility::get_ai_touching_volume();

        if ( var_4.size )
            var_1 = maps\_utility::array_merge( var_1, var_4 );
    }

    if ( var_1.size )
        return 0;
    else
        return 1;
}

_id_CD02( var_0 )
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );

    while ( common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), self.origin, level.cosine["65"] ) || self.primaryweapon != self.a.weaponpos["right"] )
        wait 1;

    maps\_utility::forceuseweapon( var_0, "primary" );
}

_id_B2B9()
{
    if ( !common_scripts\utility::flag( "left_deck3_dudes_spawned" ) )
        common_scripts\utility::flag_set( "left_deck3_dudes_spawned" );
}

_id_CD3D()
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );
    waittillframeend;

    if ( level.gameskill == 0 )
        self delete();
}

ai_dont_change_floor_spawn()
{
    self.dontchangefloor = 1;
}

_id_C516()
{
    var_0 = getent( "white_brush_delete", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    var_0 = getent( "black_brush_delete", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_BBCE( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_C7BC );
}

_id_C7BC( var_0 )
{
    self.animname = self.model;
    maps\_utility::assign_animtree();
    var_1 = randomfloatrange( 0.8, 1.5 );
    var_2 = maps\_utility::getanim( "idle" )[0];
    self _meth_83D4( var_2, var_1 );
    thread maps\_anim::anim_loop_solo( self, "idle", "stop_looping_chains" );
}

heli_additive_animations()
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    self.animname = "attack_littlebird";
    self setanim( level.scr_anim[self.animname]["front_react"] );
}

dof_water_takedown_and_climb()
{
    common_scripts\utility::flag_wait( "player_starting_stealth_kill" );
    var_0 = _id_D397::_id_A97A( "oilrig_underwater_stealthkill" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 2.8, 60, 8.0, 8.0 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 0.45 ) _id_D397::_id_C491( 2.8, 30, 10.0, 10.0 );
    var_0 _id_D397::_id_BEA0( 0.7 ) _id_D397::_id_C491( 2.8, 220, 12.0, 12.0 );
    var_0 _id_D397::_id_BEA0( 1.95 ) _id_D397::_id_C491( 4.8, 20, 8.0, 8.0 );
    var_0 _id_D397::_id_BEA0( 2.7 ) _id_D397::_id_C491( 5.8, 20, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 3.0 ) _id_D397::_id_C491( 8.8, 10, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 5.6 ) _id_D397::_id_C491( 5.8, 40, 8.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 7.4 ) _id_D397::_id_C491( 4.8, 85, 20.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 11.0 ) _id_D397::_id_C491( 4.0, 60, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 13.0 ) _id_D397::_id_C491( 5.6, 35, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 13.8 ) _id_D397::_id_C491( 5.6, 180, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 15.0 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 15.05 ) _id_D397::_id_B687();
    var_0 _id_D397::_id_BEA0( 2.9 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 11.5 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 0.55 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 2.4 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 2.9 ) _id_D397::_id_B85E( 0.1, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BEA0( 5.6 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 7.6 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 10.65 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 11.5 ) _id_D397::_id_B85E( 0.08, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 12.65 ) _id_D397::_id_B85E( 0.04, 0.2, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 12.9 ) _id_D397::_id_B85E( 0.04, 0.2, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 14.4 ) _id_D397::_id_B85E( 0.08, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 15.6 ) _id_D397::_id_B85E( 0.04, 0.2, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BC26();
}

dof_takedown_smoking_guy()
{
    self waittill( "stealth_takedown_started" );
    var_0 = _id_D397::_id_A97A( "oilrig_takedown_smoking_guy" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 3.5, -1, 8.0, 16.0 ) _id_D397::_id_CCA7( self, "tag_eye" ) _id_D397::_id_AE01( 3 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 2.55 ) _id_D397::_id_C491( 3.5, 20, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 3.35 ) _id_D397::_id_C491( 2.8, -1, 16.0, 16.0 ) _id_D397::_id_CCA7( self, "tag_eye" ) _id_D397::_id_AE01( 3 );
    var_0 _id_D397::_id_BEA0( 3.35 ) _id_D397::_id_C491( 4.0, -1, 16.0, 16.0 ) _id_D397::_id_CCA7( self, "tag_eye" ) _id_D397::_id_AE01( 3 );
    var_0 _id_D397::_id_BEA0( 4.4 ) _id_D397::_id_C491( 3.5, 300, 16.0, 24.0 );
    var_0 _id_D397::_id_BEA0( 5.15 ) _id_D397::_id_C491( 3.5, 20, 24.0, 24.0 );
    var_0 _id_D397::_id_BEA0( 5.4 ) _id_D397::_id_C491( 3.5, 50, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 5.6 ) _id_D397::_id_C491( 3.5, 180, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 5.75 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.85 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.25 ) _id_D397::_id_B85E( 0.1, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BEA0( 2.0 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 2.9 ) _id_D397::_id_B85E( 0.08, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BC26();
}

dof_hiding_c4( var_0 )
{
    self waittill( "c4_anim_plant" );

    if ( var_0 == "c4bodywall" )
    {
        var_1 = _id_D397::_id_A97A( "oilrig_hidingC4_bodywall" );
        var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 4.0, -1, 8.0, 8.0 ) _id_D397::_id_CCA7( level.player._id_C309, "tag_dof" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
        var_1 _id_D397::_id_BEA0( 4.75 ) _id_D397::_id_BF3F();
        var_1 _id_D397::_id_BEA0( 1.35 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
        var_1 _id_D397::_id_BEA0( 2.85 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
        var_1 _id_D397::_id_BC26();
    }
    else if ( var_0 == "c4bodyground" )
    {
        var_1 = _id_D397::_id_A97A( "oilrig_hidingC4_bodyground" );
        var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 2.8, -1, 8.0, 8.0 ) _id_D397::_id_CCA7( level.player._id_C309, "tag_dof" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
        var_1 _id_D397::_id_BEA0( 3.5 ) _id_D397::_id_BF3F();
        var_1 _id_D397::_id_BEA0( 1.3 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
        var_1 _id_D397::_id_BEA0( 1.9 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
        var_1 _id_D397::_id_BEA0( 2.15 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
        var_1 _id_D397::_id_BC26();
    }
    else
    {
        var_1 = _id_D397::_id_A97A( "oilrig_hidingC4_bodyground2" );
        var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 2.8, -1, 8.0, 8.0 ) _id_D397::_id_CCA7( level.player._id_C309, "tag_dof" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
        var_1 _id_D397::_id_BEA0( 3.6 ) _id_D397::_id_BF3F();
        var_1 _id_D397::_id_BEA0( 1.3 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
        var_1 _id_D397::_id_BEA0( 1.9 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
        var_1 _id_D397::_id_BEA0( 2.15 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
        var_1 _id_D397::_id_BC26();
    }
}

dof_climb_in_heli()
{
    var_0 = _id_D397::_id_A97A( "oilrig_climb_heli" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 2.8, 50, 8.0, 8.0 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 0.6 ) _id_D397::_id_C491( 3.5, 32, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 1.0 ) _id_D397::_id_C491( 4.0, 80, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 1.5 ) _id_D397::_id_C491( 5.6, 180, 8.0, 8.0 );
    var_0 _id_D397::_id_BEA0( 2.35 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.8 ) _id_D397::_id_B85E( 0.1, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 1.15 ) _id_D397::_id_B85E( 0.1, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.6 ) _id_D397::_id_B85E( 0.1, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BC26();
}

dof_departure_and_heli_ride()
{
    var_0 = _id_D397::_id_A97A( "oilrig_heli_ride" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 2.8, 200, 16.0, 32.0 ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 0.87 ) _id_D397::_id_C491( 3.5, 30, 32.0, 32.0 ) _id_D397::_id_AE01( 1 );
    var_0 _id_D397::_id_BEA0( 2.45 ) _id_D397::_id_C491( 4.0, 22, 20.0, 20.0 );
    var_0 _id_D397::_id_BEA0( 2.8 ) _id_D397::_id_C491( 5.6, 10, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 3.05 ) _id_D397::_id_C491( 20, 250, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 3.85 ) _id_D397::_id_C491( 36, 5.0, 16.0, 16.0 );
    var_0 _id_D397::_id_BEA0( 4.45 ) _id_D397::_id_C491( 6.8, 250, 10.0, 5.0 );
    var_0 _id_D397::_id_BEA0( 47.7 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 2.45 ) _id_D397::_id_B85E( 0.1, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 = 34.0;

    for ( var_2 = 1.5; var_2 <= var_1; var_2 += 0.3 )
        var_0 _id_D397::_id_BEA0( var_2 ) _id_D397::_id_B85E( 0.08, 1.0, level.player, 10000 );

    var_0 _id_D397::_id_BC26();
}

water_planes_changes()
{
    var_0 = getent( "oilr_water_plane_01", "targetname" );
    var_1 = getent( "oilr_water_plane_02", "targetname" );
    var_2 = getent( "oilr_water_plane_near", "targetname" );
    var_3 = getent( "water_plane_distortion", "targetname" );
    common_scripts\utility::flag_wait( "player_slitting_throat" );
    wait 1.4;
    var_0 show();
    var_2 hide();
    wait 6;
    thread replacemodelforwetplayer();
    var_3 hide();
    common_scripts\utility::flag_wait( "player_has_started_planting_c4" );
    var_0 hide();
    var_1 show();
}

replacemodelforwetallies()
{
    if ( common_scripts\utility::flag( "upper_room_breached" ) || !isdefined( self ) )
        return;

    if ( !common_scripts\utility::flag( "player_slitting_throat" ) )
        common_scripts\utility::flag_wait( "player_slitting_throat" );

    self.oldmodel = self.model;
    self.oldhead = self.headmodel;

    switch ( self.headmodel )
    {
        case "head_hero_ghost_udt":
        case "head_hero_soap_udt":
        case "head_seal_udt_d_lifesaver":
        case "head_seal_udt_f_lifesaver":
        case "head_seal_udt_i_lifesaver":
        case "head_seal_udt_asia_lifesaver":
        case "head_seal_udt_a":
        case "head_seal_udt_c":
        case "head_seal_udt_d":
        case "head_seal_udt_e":
        case "head_seal_udt_f":
        case "head_seal_udt_i":
        case "head_seal_udt_asia":
            // codescripts\character::setheadmodel( self.headmodel + "_wet" );
            // break;
        default:
            break;
    }

    switch ( self.model )
    {
        case "body_hero_seal_udt_ghost":
        case "body_hero_seal_udt_soap":
        case "body_seal_udt_assault_a":
        case "body_seal_udt_assault_b":
        case "body_seal_udt_smg":
            // self setmodel( self.model + "_wet" );
            // break;
        default:
            break;
    }

    common_scripts\utility::flag_wait( "upper_room_breached" );
    wait 1.0;

    if ( isdefined( self ) )
    {
        codescripts\character::setheadmodel( self.oldhead );
        self setmodel( self.oldmodel );
    }
}

replacemodelforwetplayer()
{
    level.scr_model["player_rig"] = "h2_gfl_st_ar15_viewhands";
    level.player setviewmodel( "h2_gfl_st_ar15_viewhands" );
    common_scripts\utility::flag_wait( "obj_c4_ambush_plant_complete" );
    level.scr_model["player_rig"] = "h2_gfl_st_ar15_viewhands";
    level.player setviewmodel( "h2_gfl_st_ar15_viewhands" );
    level.scr_model["h2_active_breacher_rig"] = "h2_gfl_st_ar15_viewbody";
    level.scr_model["worldbody"] = "h2_gfl_st_ar15_viewbody";
}

soap_stairs_anim()
{
    var_0 = getnode( "stairs_anim_node", "targetname" );
    var_1 = getent( "stairs_anim_trigger", "targetname" );
    var_1 waittill( "trigger" );
    var_0 maps\_anim::anim_reach_solo( level._id_AC03, "stairs_turn" );
    var_0 maps\_anim::anim_single_solo( level._id_AC03, "stairs_turn" );
    level._id_AC03 maps\_utility::enable_ai_color();
}

drop_weapon_ai()
{
    wait 2.1;
    level._id_C177 dropweapon( level._id_C177.weapon, "right", 1 );
}

submarine_02_dds()
{
    self.dds = getent( "sub_dds_02", "targetname" );
    self._id_C83D = getent( "dds_door_02", "targetname" );
    self._id_C83D linkto( self.dds );
    self.dds.origin = self.origin;
    self.dds.angles = self.angles;
    self.dds linkto( self, "TAG_ORIGIN", ( 330.0, 0.0, 100.0 ), ( 0.0, 0.0, 0.0 ) );
}

rotating_drill( var_0, var_1 )
{
    for (;;)
    {
        self rotatevelocity( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}

garage_door_think()
{
    var_0 = getent( "door_clip_deck1", "targetname" );
    var_0 notsolid();
    common_scripts\utility::flag_wait( "upper_room_cleared" );
    var_0 solid();
}

c4_in_hand( var_0 )
{
    wait 1;
    self attach( "weapon_c4", "tag_inhand" );
    var_1 = getanimlength( level.scr_anim["generic"]["C4_plant_start"] );
    wait(var_1 - 1);
    var_0 show();
    self detach( "weapon_c4", "tag_inhand" );
    playfxontag( common_scripts\utility::getfx( "light_c4_blink_nodlight" ), var_0, "tag_fx" );
    var_0 maps\_utility::play_sound_on_entity( "c4_bounce_default" );
}

hide_show_props()
{
    var_0 = getscriptablearray( "icechunks_hide", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 hide();

    _func_31C( 1 );
    common_scripts\utility::flag_wait( "player_breaks_surface" );

    foreach ( var_2 in var_0 )
        var_2 show();

    _func_31B( 1 );
}

animated_palette()
{
    var_0 = getent( "animated_palette", "targetname" );
    var_0 maps\_utility::assign_animtree( "h2_suspended_palette" );
    var_0 maps\_anim::anim_loop_solo( var_0, "idle" );
}

force_m4_weapon()
{
    common_scripts\utility::flag_wait( "player_has_started_planting_c4" );
    maps\_utility::forceuseweapon( "m4_grenadier", "primary" );
}

change_light_set_surface()
{
    common_scripts\utility::flag_wait( "player_breaks_surface" );
    wait 0.5;
    level.player maps\_utility::_id_BF21( "oilrig_sneaky_swim" );
    common_scripts\utility::flag_wait( "player_starting_stealth_kill" );
    wait 12;
    level.player maps\_utility::_id_BF21( "oilrig" );
}

animated_crane_hooks()
{
    var_0 = getentarray( "animated_crane_hook", "targetname" );
    common_scripts\utility::array_thread( var_0, ::animated_hooks_think );
}

animated_hooks_think()
{
    maps\_utility::assign_animtree( "animated_crane_hook" );
    thread maps\_anim::anim_loop_solo( self, "idle", "stop_idle" );
    common_scripts\utility::flag_wait( "player_has_started_planting_c4" );
    self notify( "stop_idle" );
}

vision_set_change_underwater()
{
    wait 4;
    level.player maps\_utility::_id_BF21( "oilrig_sdv" );
    wait 4;
    level.player maps\_utility::set_vision_set( "oilrig_sdv", 0 );
    wait 15;
    level.player maps\_utility::set_vision_set( "oilrig_underwater", 2 );
    wait 6;
    level.player maps\_utility::_id_BF21( "oilrig_underwater" );
}

play_fx_on_chopper()
{
    common_scripts\utility::flag_wait( "littlebird_escape_spawned" );
    playfxontag( level._effect["aircraft_spotlight_cockpit_oilrig"], level._id_D1AC, "tag_origin" );
}

delete_railing_guy( var_0 )
{
    var_1 = getent( "railing_guy_trig", "targetname" );
    var_2 = var_0 common_scripts\utility::_id_B6EF( "j_mainroot" );
    var_2 = spawn( "script_model", var_0 getorigin() );
    var_2 setmodel( "tag_origin" );
    var_2 linkto( var_0, "j_mainroot" );

    while ( !var_2 istouching( var_1 ) )
        waitframe();

    var_0 kill();
    var_0 delete();
    playfx( level._effect["water_object_splash_wide_tall_oilrig"], var_2.origin );
    var_2 maps\_utility::play_sound_on_entity( "scn_oilrig_smoker_water_splash" );
    var_2 delete();
}

spawn_weapon_m14()
{
    var_0 = spawn( "script_model", level._id_D1AC.origin );
    var_0 setmodel( "h2_weapon_m14ebr_scoped_arctic" );
    var_0 linkto( level._id_D1AC, "tag_detach_left", ( -18.0, 10.0, 28.0 ), ( 286.082, 300.887, -33.5348 ) );
    common_scripts\utility::flag_wait( "littlebird_escape_lifted_off" );
    var_0 delete();
}

bring_back_rig()
{
    var_0 = getent( "oilrig_underwater_node", "targetname" );
    var_1 = getent( "oilrig_underwater_node_start", "targetname" );
    var_2 = var_1.origin - var_0.origin;
    var_3 = getentarray( "oilrig_underwater", "targetname" );

    foreach ( var_5 in var_3 )
        var_5.origin -= var_2;
}

disable_hud_c4_plant()
{
    self waittill( "c4_anim_plant" );
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "actionSlotsHide", 1 );
    wait 5;
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "actionSlotsHide", 0 );
}

breach_b_hide_objects()
{
    level endon( "player_at_deck1_midpoint" );
    var_0 = [];
    var_1 = [ "leaking", "animated_crane_hook", "com_wall_fan_blade_rotate", "derrick_thing", "animated_palette", "exploderanim, h2_oilrig_c4room_wires_anim", "ceiling_support" ];

    foreach ( var_3 in var_1 )
    {
        var_4 = getentarray( var_3, "targetname" );
        var_0 = common_scripts\utility::array_combine( var_0, var_4 );
    }

    var_6 = getentarray( "leaking", "targetname" );
    var_7 = [];

    foreach ( var_9 in var_6 )
    {
        if ( !isdefined( var_9.script_parameters ) )
            continue;

        var_7[var_7.size] = var_9;
    }

    var_0 = common_scripts\utility::array_remove_array( var_0, var_7 );

    for (;;)
    {
        common_scripts\utility::flag_wait( "breach_B" );

        foreach ( var_12 in var_0 )
            var_12 hide();

        _func_31C( 2 );
        common_scripts\utility::flag_waitopen( "breach_B" );

        foreach ( var_12 in var_0 )
            var_12 show();

        _func_31B( 2 );
    }
}

breach_a_hide_objects()
{
    level endon( "ambush_c4_triggered" );
    var_0 = getentarray( "ceiling_support", "targetname" );
    var_1 = getentarray( "leaking", "targetname" );
    var_2 = getentarray( "ambush_office", "script_noteworthy" );
    var_3 = [];

    foreach ( var_5 in var_1 )
    {
        if ( !isdefined( var_5.script_parameters ) )
            continue;

        var_3[var_3.size] = var_5;
    }

    var_7 = common_scripts\utility::array_combine( var_0, var_3 );
    var_8 = common_scripts\utility::array_combine( var_7, var_2 );

    for (;;)
    {
        common_scripts\utility::flag_wait( "breach_A_hide" );

        foreach ( var_10 in var_8 )
            var_10 hide();

        _func_31C( 4 );
        common_scripts\utility::flag_waitopen( "breach_A_hide" );

        foreach ( var_10 in var_8 )
            var_10 show();

        _func_31B( 4 );
    }
}

helicopter_objects_hide()
{
    common_scripts\utility::flag_wait( "player_on_board_littlebird" );
    _func_31C( 2 );
    _func_31C( 3 );
    _func_31C( 6 );
    var_0 = getentarray( "ambush_office_destroyed", "script_noteworthy" );
    var_1 = [ "leaking", "animated_crane_hook", "com_wall_fan_blade_rotate", "exploderanim, h2_oilrig_c4room_wires_anim", "ceiling_support", "oilrig_underwater" ];
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        var_5 = getentarray( var_4, "targetname" );
        var_2 = common_scripts\utility::array_combine( var_2, var_5 );
    }

    var_7 = getentarray( "leaking", "targetname" );
    var_8 = [];

    foreach ( var_10 in var_7 )
    {
        if ( !isdefined( var_10.script_parameters ) )
            continue;

        var_8[var_8.size] = var_10;
    }

    var_2 = common_scripts\utility::array_remove_array( var_2, var_8 );

    foreach ( var_13 in var_2 )
        var_13 hide();

    foreach ( var_16 in var_0 )
        var_16 hide();
}

final_stair_animation_monitoring()
{
    var_0 = getent( "end_stair_script_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level._id_C280 || var_1 == level._id_AC03 )
            break;
    }

    common_scripts\utility::flag_set( "stair_in_use" );
    wait 1.25;
    common_scripts\utility::flag_clear( "stair_in_use" );
}

info_volume_objects_hide()
{
    common_scripts\utility::flag_wait( "player_attached_to_sdv" );
    var_0 = getent( "base_volume", "targetname" );
    var_1 = getent( "first_volume", "targetname" );
    var_2 = getent( "second_volume", "targetname" );
    var_3 = getent( "third_volume", "targetname" );
    var_4 = getent( "top_volume", "targetname" );
    var_5 = getentarray( "script_model", "code_classname" );
    var_6 = [];

    foreach ( var_8 in var_5 )
    {
        if ( var_8.model == "mil_frame_charge" || var_8.model == "h2_oilr_door_breaching_undamaged" || var_8.model == "h2_gfl_st_ar15_viewhands_player" || var_8.model == "oilrig_water_plane" || var_8.model == "oilrig_water_plane_far" || var_8.model == "oilrig_water_plane_near" || var_8.model == "h2_oilr_water_under_top" || var_8.model == "h2_fav_garage_door_03_animated" || var_8.model == "weapon_c4" || var_8.model == "h2_oilr_water_under_02" || var_8.model == "h2_oilr_water_under" || var_8.model == "h2_oilr_water_under_top" || var_8.model == "intel_item_laptop" )
            var_6 = common_scripts\utility::array_add( var_6, var_8 );
    }

    var_10 = common_scripts\utility::array_remove_array( var_5, var_6 );
    thread floor_volume( var_10, var_0, "base_floor" );
    thread floor_volume( var_10, var_1, "first_floor" );
    thread floor_volume( var_10, var_2, "second_floor" );
    thread floor_volume( var_10, var_3, "third_floor" );
    thread floor_volume( var_10, var_4, "top_floor" );
}

floor_volume( var_0, var_1, var_2 )
{
    level endon( "death" );
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        if ( ispointinvolume( var_5.origin, var_1 ) )
            var_3[var_3.size] = var_5;
    }

    foreach ( var_5 in var_3 )
    {
        var_5 hide();
        var_5 dontcastshadows();
    }

    for (;;)
    {
        common_scripts\utility::flag_wait( var_2 );

        foreach ( var_5 in var_3 )
        {
            if ( !isdefined( var_5 ) || _func_2A5( var_5 ) )
                continue;

            var_5 show();
            var_5 castshadows();
        }

        common_scripts\utility::flag_waitopen( var_2 );

        foreach ( var_5 in var_3 )
        {
            if ( !isdefined( var_5 ) || _func_2A5( var_5 ) )
                continue;

            var_5 hide();
            var_5 dontcastshadows();
        }
    }
}

manhandler_first_breach_right_door_spawn_func()
{
    self.manhandler_additional_wait_func = ::ai_sync_before_entering_1st_breach_room_right_door;
}

ai_sync_before_entering_1st_breach_room_right_door()
{
    var_0 = [ level._id_C280, level._id_BBBD ];
    var_1 = anglestoforward( self.angles );
    var_2 = gettime();

    while ( gettime() - var_2 < 3000 )
    {
        var_3 = 1;

        foreach ( var_5 in var_0 )
        {
            if ( !isalive( var_5 ) )
                continue;

            if ( vectordot( var_5.origin - self.origin, var_1 ) > 0 )
            {
                var_3 = 0;
                break;
            }
        }

        if ( var_3 )
            return;

        wait 0.2;
    }
}

h2_intro_zodiac_wibble()
{
    common_scripts\utility::flag_wait( "player_starting_stealth_kill" );
    var_0 = getent( "zodiacs_grate", "targetname" );

    while ( !common_scripts\utility::flag( "player_at_lower_breach" ) )
    {
        var_0 rotatepitch( 1, 2 );
        wait 2;
        var_0 rotatepitch( -1, 2 );
        wait 2;
    }
}
#using_animtree("generic_human");

init_custom_death_anim()
{
    level.scr_anim["generic"]["stand_death_shoulder_stumble"] = %h2_stand_death_shoulder_stumble;
}
