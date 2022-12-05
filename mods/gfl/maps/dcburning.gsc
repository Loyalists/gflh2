// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\dcburning_mission_select_cam::_id_C490();
        return;
    }

    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" )
    {
        maps\dcburning_beautiful_corner::main();
        return;
    }

    maps\_vehicle::build_light_override( "script_vehicle_btr80_low", "spotlight", "TAG_FRONT_LIGHT_RIGHT", "fx/misc/spotlight_btr80_dcburning", "spotlight", 0.2 );
    _id_ACB9();
    setsaveddvar( "fx_cast_shadow", 0 );
    var_0 = undefined;
    setdynamicdvar( "cheap_spot", "1" );
    _id_B2C8();
    _id_B64C::main();
    _id_D3D6::main( "h2_vehicle_blackhawk_minigun_hero_exterior", undefined, "script_vehicle_blackhawk_minigun" );
    level._id_B063 = [];
    level._id_ACEF = getentarray( "interior_bcs", "targetname" );
    level._id_BF38 = getentarray( "exterior_bcs", "targetname" );
    common_scripts\utility::array_thread( level._id_BF38, common_scripts\utility::trigger_off );
    common_scripts\utility::array_thread( level._id_ACEF, common_scripts\utility::trigger_off );
    level._id_D0F1 = getent( "monument_target", "targetname" );
    level._id_AD23 = getentarray( "latvee_spotlight_targets", "targetname" );
    level._id_C771 = [];
    level._id_C702 = 4;
    level._id_A9CD = 0;
    level._id_AF9D = 6000;
    level._id_C3F1 = level._id_AF9D * level._id_AF9D;
    level._id_B847 = 1;
    level._id_B522 = 3;
    level._id_C408 = 100;
    level._id_B964 = 90000;
    level._id_C8A5 = 0;
    level._id_B951 = 1;
    level._id_BF3D = 0;
    level._id_CE89 = [];
    level._id_C248 = 3;
    level._id_B7B2 = [];
    level._id_BFB9 = [];
    level._id_C3CA = [];
    setdynamicdvar( "bog_camerashake", "1" );
    level.spawnercallbackthread = ::_id_D148;
    level.dronecallbackthread = ::_id_B6A2;
    level._id_A933 = 262144;
    setdynamicdvar( "dc_debug", "0" );
    setdynamicdvar( "dc_dialog", "1" );
    level.cosine["25"] = cos( 25 );
    level.cosine["35"] = cos( 35 );
    level.cosine["45"] = cos( 45 );
    level.cosine["60"] = cos( 60 );
    level.cosine["90"] = cos( 90 );
    level.cosine["180"] = cos( 180 );
    level._id_BE29 = level.cosine["35"];
    var_1 = getentarray( "trigger_multiple", "classname" );
    level._id_B589 = [];

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.script_noteworthy ) && getsubstr( var_3.script_noteworthy, 0, 10 ) == "colornodes" )
            level._id_B589 = common_scripts\utility::array_add( level._id_B589, var_3 );
    }

    _id_B6CD();
    level._id_D43F = 2000;
    level._id_CDB5 = 0.05;
    level._id_A874 = 0.4;
    level._id_C767 = 1;
    level._id_AF87 = maps\_animatedmodels::_id_B29E;
    maps\_utility::add_start( "debug", ::_id_B584, "debug" );
    maps\_utility::add_start( "elevator_bottom", ::_id_AF78, "elevator_bottom" );
    maps\_utility::add_start( "elevator_top", ::_id_AAF2, "elevator_top" );
    maps\_utility::add_start( "crows_nest", ::_id_A8C8, "crows_nest" );
    maps\_utility::add_start( "crows_nest_armor", ::_id_BAE3, "crows_nest_armor" );
    maps\_utility::add_start( "barrett", ::_id_D2D3, "barrett" );
    maps\_utility::add_start( "to_roof", ::_id_ABE6, "to_roof" );
    maps\_utility::add_start( "roof", ::start_roof, "roof" );
    maps\_utility::add_start( "heliride2", ::_id_AB5F, "heliride2" );
    maps\_utility::add_start( "crash", ::start_crash, "crash" );
    maps\_utility::default_start( ::_id_B972 );
    maps\dc_crashsite::main();
    _id_D29E::main();
    maps\_breach::main();
    maps\_drone_ai::init();
    _id_B626::main();
    maps\dcburning_lighting::main();
    _id_AD17::main();
    _id_D388::main();
    _id_B0FA::main();
    _id_CDB1::main();
    _id_AAAB::main();
    maps\_load::main();
    _id_B0E5::_id_C2BC();
    maps\_nightvision::main();
    _id_AC65::init();
    _id_B564::init();
    maps\dcburning_aud::main();
    thread _id_B1EF::_id_C96E();
    maps\dcburning_anim::main();
    thread _id_D301::_id_C09E( "explosion_mortar" );
    thread _id_D301::_id_D23F();
    common_scripts\utility::array_thread( getentarray( "animated_vehicle", "script_noteworthy" ), ::_id_D0A7 );
    common_scripts\utility::array_thread( getentarray( "vehicles_crowsnest_defend", "targetname" ), ::vehicles_crowsnest_defend_animated_think );
    common_scripts\utility::array_thread( getvehiclenodearray( "plane_bomb", "script_noteworthy" ), vehicle_scripts\_mig29::plane_bomb_cluster );
    _id_C21D();
    achievement_bird_hunter_init();
    thread performance_interior_exterior_transition();
    thread heli_ride_perf_helpers();
    thread misc_model_group_think();
    thread cloth_wibble_think();
    setsaveddvar( "r_corpseRemovalThreshold", "0.65" );
    maps\_utility::add_hint_string( "grenade_launcher", &"SCRIPT_LEARN_GRENADE_LAUNCHER", ::_id_C7EA );
    maps\_utility::add_hint_string( "javelin_pickup", &"DCBURNING_HINT_JAVELIN_PICKUP", ::_id_BB80 );
    maps\_utility::add_hint_string( "javelin_switch", &"DCBURNING_HINT_JAVELIN_SWITCH", ::_id_A8D2, undefined, "medium_background" );
    maps\_utility::add_hint_string( "javelin_shoot", &"DCBURNING_HINT_JAVELIN_FIRE", ::_id_C816, undefined, "medium_background" );
    common_scripts\utility::array_thread( getentarray( "destructible_trigger", "targetname" ), ::_id_BBEE );
    thread _id_ACB3();
    hideall();
    _id_C71C();
    setsaveddvar( "r_lightGridEnableTweaks", 0 );
    setsaveddvar( "r_lightGridIntensity", 1.2 );
    setsaveddvar( "r_lightGridContrast", 0 );
    thread _id_BB44();
    thread lights();
    _id_D0F0();
    common_scripts\utility::array_thread( getentarray( "ai_cleanup_trigger", "targetname" ), ::_id_AB21 );
    common_scripts\utility::array_thread( getentarray( "redshirt_trigger", "targetname" ), ::_id_BF40 );
    common_scripts\utility::array_thread( getentarray( "rpg_targets", "targetname" ), ::_id_C5CD );
    common_scripts\utility::array_thread( getentarray( "dest_cheap", "targetname" ), ::_id_BDE3 );
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
    common_scripts\utility::array_thread( getentarray( "compassTriggers", "targetname" ), ::_id_BD74 );
    var_5 = maps\_vehicle_code::_getvehiclespawnerarray();
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::_id_B90C );
    common_scripts\utility::array_thread( getentarray( "ai_ambient", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_D0A1 );
    common_scripts\utility::array_thread( getentarray( "ai_ambient_prop", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BAA7 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct1", "targetname" ), ::_id_B640 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct2", "targetname" ), ::_id_D513 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_on1", "targetname" ), ::_id_BE79 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_on2", "targetname" ), ::_id_A9AD );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_on3", "targetname" ), ::_id_C677 );
    common_scripts\utility::array_thread( getentarray( "wired_light", "targetname" ), ::scripted_anim_props, "light_idle", "wired_light" );
    common_scripts\utility::array_thread( getentarray( "wired_light_broken", "targetname" ), ::scripted_anim_props, "light_idle_broken", "wired_light" );
    getent( "suspended_light1", "targetname" ) thread scripted_anim_props( "light_idle1", "suspended_light" );
    getent( "suspended_light2", "targetname" ) thread scripted_anim_props( "light_idle2", "suspended_light" );
    getent( "suspended_light3", "targetname" ) thread scripted_anim_props( "light_idle3", "suspended_light" );
    getent( "suspended_light4", "targetname" ) thread scripted_anim_props( "light_idle4", "suspended_light" );
    getent( "suspended_light5", "targetname" ) thread scripted_anim_props( "light_idle5", "suspended_light" );
    common_scripts\utility::array_thread( getentarray( "curtain_red_wind", "targetname" ), ::scripted_anim_props, "curtains_wind", "curtains" );
    common_scripts\utility::array_thread( getentarray( "curtain_closed_wind", "targetname" ), ::scripted_anim_props, "curtains_closed_wind_calm", "curtains" );
    common_scripts\utility::array_thread( getentarray( "curtain_open_idle", "targetname" ), ::scripted_anim_props, "curtains_wind_calm", "curtains" );
    maps\_utility::array_spawn_function_noteworthy( "door_breaker", ::_id_AD73 );
    maps\_utility::array_spawn_function_targetname( "hostiles_commerce_samsite", ::_id_ADF3 );
    maps\_utility::array_spawn_function_targetname( "commerce_sector_2_guys", ::_id_C1D3 );
    maps\_utility::array_spawn_function_targetname( "crowsnest_assault_guys_wave1", ::_id_D18B );
    maps\_utility::array_spawn_function_targetname( "commerce_flare_guys", ::_id_CCEA );
    maps\_utility::array_spawn_function_targetname( "ww2_heli", ::_id_CA68 );
    maps\_utility::array_spawn_function_noteworthy( "no_suppress", ::_id_AD09 );
    maps\_utility::array_spawn_function_noteworthy( "friendly_fodder", ::_id_B142 );
    maps\_utility::array_spawn_function_noteworthy( "enemy_spotter_prone", ::_id_BD6B );
    maps\_utility::array_spawn_function_noteworthy( "enemy_spotter_crouched", ::_id_BD6B );
    maps\_utility::array_spawn_function_noteworthy( "enemy_javelin", ::_id_BD6B );
    maps\_utility::array_spawn_function_noteworthy( "enemy_stinger", ::_id_BD6B );
    maps\_utility::array_spawn_function_noteworthy( "waittill_damaged_and_set_flag", ::_id_BDB6 );
    maps\_utility::array_spawn_function_noteworthy( "invisible_patrol_fodder", ::_id_B767 );
    maps\_utility::array_spawn_function_noteworthy( "at4_friendly", ::_id_BF14 );
    maps\_utility::array_spawn_function_noteworthy( "player_seek", ::_id_AB23 );
    maps\_utility::array_spawn_function_noteworthy( "roof_escape_redshirts", ::_id_B96B );
    maps\_utility::array_spawn_function_noteworthy( "redshirt", ::_id_B310 );
    maps\_utility::array_spawn_function_noteworthy( "glass_building_enemies", ::_id_C2E4 );
    maps\_utility::array_spawn_function_noteworthy( "ambush", ::_id_D291 );
    maps\_utility::array_spawn_function_noteworthy( "laatpv_gunner", ::_id_B9A1 );
    maps\_utility::array_spawn_function_targetname( "commerce_rpg_upper", ::_id_C0F4 );
    maps\_utility::array_spawn_function_targetname( "hostiles_courtyard", ::ai_hostiles_courtyard );
    var_6 = getspawnerteamarray( "axis" );
    var_7 = [];

    foreach ( var_9 in var_6 )
    {
        if ( !isdefined( var_9.script_parameters ) )
            continue;

        var_7[var_7.size] = var_9;
    }

    maps\_utility::array_spawn_function( var_7, ::_id_D0E5 );
    thread ai_force_ignore_supression();
    thread ai_restore_ignore_supression();
    thread setsunlight_dcburning();
    thread moving_fire_lights_setup();
}

_id_C21D()
{
    common_scripts\utility::flag_init( "slamraam_c4_detonated" );
    common_scripts\utility::flag_init( "stop_elevator_doors" );
    common_scripts\utility::flag_init( "difficulty_initialized" );
    common_scripts\utility::flag_init( "can_talk" );
    common_scripts\utility::flag_set( "can_talk" );
    maps\_compass::setupminimap( "compass_map_dcburning" );
    common_scripts\utility::flag_init( "obj_follow_sgt_macey_given" );
    common_scripts\utility::flag_init( "obj_follow_sgt_macey_complete" );
    common_scripts\utility::flag_init( "obj_commerce_given" );
    common_scripts\utility::flag_init( "obj_commerce_complete" );
    common_scripts\utility::flag_init( "obj_commerce_defend_snipe_given" );
    common_scripts\utility::flag_init( "obj_commerce_defend_snipe_complete" );
    common_scripts\utility::flag_init( "obj_commerce_defend_crow_given" );
    common_scripts\utility::flag_init( "obj_commerce_defend_crow_complete" );
    common_scripts\utility::flag_init( "obj_commerce_defend_javelin_given" );
    common_scripts\utility::flag_init( "obj_commerce_defend_javelin_complete" );
    common_scripts\utility::flag_init( "obj_rooftop_given" );
    common_scripts\utility::flag_init( "obj_rooftop_complete" );
    common_scripts\utility::flag_init( "obj_heli_mount_given" );
    common_scripts\utility::flag_init( "obj_heli_mount_complete" );
    common_scripts\utility::flag_init( "obj_heli_ride_given" );
    common_scripts\utility::flag_init( "bunker_door_closed" );
    common_scripts\utility::flag_init( "delete_bunker_mortars" );
    common_scripts\utility::flag_init( "seaknight_drones_loaded" );
    common_scripts\utility::flag_init( "seaknight_drones2_loaded" );
    common_scripts\utility::flag_init( "bradley_can_start_firing" );
    common_scripts\utility::flag_init( "latvee_commerce_left_done_with_spotlight" );
    common_scripts\utility::flag_init( "javelin_is_owning_fools" );
    common_scripts\utility::flag_init( "second_abrams_killed" );
    common_scripts\utility::flag_init( "commerce_rappelers_inserting" );
    common_scripts\utility::flag_init( "commerce_rappelers_rappeling" );
    common_scripts\utility::flag_init( "commerce_rappelers_done" );
    common_scripts\utility::flag_init( "trenches_dialogue_done" );
    common_scripts\utility::flag_init( "lav_is_suppressing" );
    common_scripts\utility::flag_init( "leader_orders_everyone_across_street" );
    common_scripts\utility::flag_init( "atrium_guys_at_end_of_anim" );
    common_scripts\utility::flag_init( "commerce_first_floor_enemies_dead" );
    common_scripts\utility::flag_init( "courtyard_has_been_cleared" );
    common_scripts\utility::flag_init( "ask_bradley_to_stop_firing" );
    common_scripts\utility::flag_init( "mezzanine_top_has_been_cleared" );
    common_scripts\utility::flag_init( "floor_four_has_been_cleared" );
    common_scripts\utility::flag_init( "player_shot_at_samsite_guys" );
    common_scripts\utility::flag_init( "commerce_samsite_revealed" );
    common_scripts\utility::flag_init( "dead_tarp_guys" );
    common_scripts\utility::flag_init( "samsite_allow_C4_spawn" );
    common_scripts\utility::flag_init( "fifth_floor_guys_damaged" );
    common_scripts\utility::flag_init( "start_music_to_crowsnest" );
    common_scripts\utility::flag_init( "macey_tells_you_to_move_to_crows" );
    common_scripts\utility::flag_init( "foley_is_done_talking" );
    common_scripts\utility::flag_init( "player_shot_at_crowsnest_guys" );
    common_scripts\utility::flag_init( "crowsnest_has_been_cleared" );
    common_scripts\utility::flag_init( "make_seaknights_take_off" );
    common_scripts\utility::flag_init( "can_start_crow_nags" );
    common_scripts\utility::flag_init( "only_2_sniper_enemies_remaining" );
    common_scripts\utility::flag_init( "player_killed_enough" );
    common_scripts\utility::flag_init( "latvee_spotlight_deleted" );
    common_scripts\utility::flag_init( "perimeter_enemies_have_retreated" );
    common_scripts\utility::flag_init( "start_crow_armor_sequence" );
    common_scripts\utility::flag_init( "player_has_javelin" );
    common_scripts\utility::flag_init( "only_1_javelin_enemies_remaining" );
    common_scripts\utility::flag_init( "only_2_javelin_enemies_remaining" );
    common_scripts\utility::flag_init( "monument_dummy_target_setup" );
    common_scripts\utility::flag_init( "crowsnest_sequence_finished" );
    common_scripts\utility::flag_init( "player_has_killed_at_least_one_javelin_target" );
    common_scripts\utility::flag_init( "roof_breach_complete" );
    common_scripts\utility::flag_init( "roof_littlebird_lifted_off" );
    common_scripts\utility::flag_init( "player_heli_spawned" );
    common_scripts\utility::flag_init( "player_heli_ready_to_take_off" );
    common_scripts\utility::flag_init( "roof_heli_about_to_be_owned" );
    common_scripts\utility::flag_init( "roof_heli_owned" );
    common_scripts\utility::flag_init( "player_getting_on_minigun" );
    common_scripts\utility::flag_init( "player_has_used_minigun" );
    common_scripts\utility::flag_init( "blackhawk_landed" );
    common_scripts\utility::flag_init( "rooftop_run_dialogue_finished" );
    common_scripts\utility::flag_init( "littlebird_crash_path_end" );
    common_scripts\utility::flag_init( "littlebird_crash_path_end2" );
    common_scripts\utility::flag_init( "player_starting_fastrope" );
    common_scripts\utility::flag_init( "player_fastroped_out" );
    common_scripts\utility::flag_init( "player_facing_blackhawk" );
    common_scripts\utility::flag_init( "player_crash_starting" );
    common_scripts\utility::flag_init( "achievement_bird_hunter_done" );
    common_scripts\utility::flag_init( "flag_reduce_sunlight" );
}

_id_ACB9()
{
    var_0 = getentarray();

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( var_2.classname, "trigger_multiple_bcs" ) )
            var_2 delete();
    }
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

    if ( getdvar( "dc_debug" ) == "1" )
        thread maps\_utility::debug_message( self.script_flag, self.origin, 9999 );

    self waittill( "trigger" );
    common_scripts\utility::flag_set( self.script_flag );

    if ( getdvar( "dc_debug" ) == "1" )
        iprintlnbold( "flag: " + self.script_flag + " has been set" );
}

_id_B972()
{
    soundscripts\_snd::snd_message( "start_debug_checkpoint" );
    maps\dcburning_lighting::_id_CA84( "dcburning_bunker" );
    thread _id_BC95();
}

_id_B584()
{
    soundscripts\_snd::snd_message( "start_debug_checkpoint" );
    _id_B351( "elevator_bottom" );
    maps\dcburning_lighting::_id_CA84( "dcburning_bunker" );
}

_id_AF78()
{
    soundscripts\_snd::snd_message( "start_elevator_bottom_checkpoint" );
    maps\dcburning_lighting::_id_CA84( "dcburning_commerce" );
    _id_B351( "elevator_bottom" );
    thread _id_BFCB();
    common_scripts\utility::flag_set( "obj_commerce_given" );
    common_scripts\utility::array_thread( level.squad, maps\_utility::cqb_walk, "on" );
    triggersenable( "colornodes_commerce_bot_to_top", "script_noteworthy", 1 );
    thread _id_AB51();
}

_id_AAF2()
{
    soundscripts\_snd::snd_message( "start_elevator_top_checkpoint" );
    maps\dcburning_lighting::_id_CA84( "dcburning_commerce" );
    _id_B351( "elevator_top" );
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::array_thread( level.squad, maps\_utility::cqb_walk, "on" );
    common_scripts\utility::flag_set( "player_at_commerce_crows_floor" );
    thread _id_B45F();
    common_scripts\_exploder::exploder( "battlefield_smk" );
    common_scripts\utility::flag_set( "flag_reduce_sunlight" );
}

_id_A8C8()
{
    soundscripts\_snd::snd_message( "start_crows_nest_checkpoint" );
    maps\dcburning_lighting::_id_CA84( "dcburning_rooftops" );
    _id_B351( "crows_nest" );
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::array_thread( level.squad, maps\_utility::cqb_walk, "on" );
    common_scripts\utility::flag_set( "player_approaching_crowsnest" );
    common_scripts\utility::flag_set( "player_approaching_crowsnest2" );
    thread _id_A999();
    common_scripts\_exploder::exploder( "battlefield_smk" );
    common_scripts\utility::flag_set( "flag_reduce_sunlight" );
}

_id_BAE3()
{
    soundscripts\_snd::snd_message( "start_crows_nest_armor_checkpoint" );
    maps\dcburning_lighting::_id_CA84( "dcburning_rooftops" );
    _id_B351( "crows_nest" );
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::array_thread( level.squad, maps\_utility::cqb_walk, "on" );
    common_scripts\utility::flag_set( "start_crow_armor_sequence" );
    common_scripts\utility::flag_set( "player_approaching_crowsnest" );
    common_scripts\utility::flag_set( "player_approaching_crowsnest2" );
    thread _id_CAB2();
    common_scripts\_exploder::exploder( "battlefield_smk" );
    common_scripts\utility::flag_set( "flag_reduce_sunlight" );
}

_id_D2D3()
{
    soundscripts\_snd::snd_message( "start_barrett_checkpoint" );
    maps\dcburning_lighting::_id_CA84( "dcburning_rooftops" );
    _id_B351( "crows_nest" );
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::array_thread( level.squad, maps\_utility::cqb_walk, "on" );
    [ var_1, var_2 ] = _id_C90D();
    thread _id_B949( var_1, var_2 );
    common_scripts\_exploder::exploder( "battlefield_smk" );
    common_scripts\utility::flag_set( "flag_reduce_sunlight" );
}

_id_ABE6()
{
    soundscripts\_snd::snd_message( "start_to_roof_checkpoint" );
    maps\dcburning_lighting::_id_CA84( "dcburning_rooftops" );
    _id_B351( "to_roof" );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::array_thread( level.squad, maps\_utility::cqb_walk, "on" );
    common_scripts\utility::flag_set( "only_2_javelin_enemies_remaining" );
    common_scripts\utility::flag_set( "crowsnest_sequence_finished" );
    thread _id_AAB9();
    common_scripts\_exploder::exploder( "battlefield_smk" );
    common_scripts\utility::flag_set( "flag_reduce_sunlight" );
}

start_roof()
{
    soundscripts\_snd::snd_message( "start_roof_checkpoint" );
    maps\dcburning_lighting::_id_CA84( "dcburning_rooftops" );
    _id_B351( "Roof" );
    common_scripts\utility::array_thread( level.squad, maps\_utility::cqb_walk, "off" );
    common_scripts\utility::flag_set( "player_headed_to_roof" );
    common_scripts\utility::flag_set( "player_approaching_outer_balcony" );
    _id_B983( "trigger_dummy_roof_colornode" );
    thread _id_C442();
    common_scripts\_exploder::exploder( "battlefield_smk" );
    common_scripts\utility::flag_set( "flag_reduce_sunlight" );
}

_id_AB5F()
{
    soundscripts\_snd::snd_message( "start_heli_ride2_checkpoint" );
    maps\dcburning_lighting::_id_CA84( "dcburning_heliride_takeoff" );
    var_0 = common_scripts\utility::getstruct( "player_heli_ww2_end", "script_noteworthy" );
    var_0.angles = ( 0.0, 256.0, 0.0 );
    _id_BFA3( var_0 );
    level._id_CED1._id_C4C4 = level.player;
    level._id_CED1._id_C4C4 disableweapons( 1 );
    level._id_CED1 attach( level.scr_model["viewhands"], "tag_barrel" );
    level._id_CED1 thread _id_D3D6::_id_A8E6();
    level._id_CED1.modeldummy = maps\_utility::spawn_anim_model( "minigun_dummy", level._id_CED1.origin, level._id_CED1.angles );
    level._id_CED1.modeldummy attach( level.scr_model["viewhands"], "", 1 );
    level._id_CED1.modeldummy hide();
    level._id_CED1.modeldummy linkto( level._id_CED1 );
    level._id_CED1 thread _id_B0FA::_id_C0E2();
    thread _id_D2B3();
    common_scripts\_exploder::exploder( "battlefield_smk" );
    common_scripts\utility::flag_set( "flag_reduce_sunlight" );
}

start_crash()
{
    soundscripts\_snd::snd_message( "start_crash_checkpoint" );
    maps\dcburning_lighting::_id_CA84( "dcburning_helicrash" );
    thread maps\dc_crashsite::_id_BFC4();
    thread maps\dcburning_aud::intro_heli_sequence_snd();
    wait 0.1;
    common_scripts\utility::flag_set( "player_crash_done" );
    common_scripts\utility::flag_set( "flag_reduce_sunlight" );
}

_id_BC95()
{
    var_0 = getent( "player_gun_down", "targetname" );
    var_0 thread _id_B7CB();
    thread _id_AD30();
    _id_B351( "Bunker" );
    thread _id_CB68();
    thread _id_A846();
    thread _id_B8D2();
    thread _id_CC93();
    thread _id_D1F6();
    thread _id_BFCB();
    thread _id_AC93();
    thread _id_C856();
    thread _id_D5C5();
    thread _id_A83B();
    thread _id_A89E();
    thread _id_C6B8();
    thread _id_AA3B();
    thread _id_B327();
    thread _id_D559();
    thread _id_B9BF();
    thread _id_A843();
    thread animate_wires();
    thread monitor_bunker_exit_no_team_move();
    common_scripts\utility::flag_wait( "player_commerce_trench_02" );
    thread _id_AB51();
}

monitor_bunker_exit_no_team_move()
{
    common_scripts\utility::flag_wait( "player_bunker_walk_03" );
    level._id_AC03.noteammove = 1;
    level._id_C280.noteammove = 1;
    level._id_BBBD.noteammove = 1;
    common_scripts\utility::flag_wait( "player_leaving_bunker" );
    level._id_AC03.noteammove = 0;
    level._id_C280.noteammove = 0;
    level._id_BBBD.noteammove = 0;
}

_id_B7CB()
{
    level endon( "bunker_door_closed" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "bunker_gun_down" );
        setsaveddvar( "cg_gunDownAnimDelayTime", 250 );
        common_scripts\utility::flag_waitopen( "bunker_gun_down" );
        setsaveddvar( "cg_gunDownAnimDelayTime", -1 );
    }
}

_id_A846()
{
    thread maps\_utility::music_loop( "mus_dcburning_intropad", 87 );
    common_scripts\utility::flag_wait( "player_bunker_walk_03" );
    maps\_utility::music_stop( 5 );
    wait 5.1;
    maps\_utility::musicplaywrapper( "mus_dcburning_intropeak" );
    soundscripts\_snd::snd_message( "start_music_intropeak_mix" );
}

_id_B8D2()
{
    common_scripts\utility::flag_wait( "player_commerce_past_desks" );
    level._id_CD45 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "vehicles_commerce_ambient" );
}

_id_CC93()
{
    if ( getdvarint( "r_dcburning_culldist" ) == 1 )
        setculldist( 28500 );

    thread _id_BF62();
    maps\_utility::flavorbursts_off( "allies" );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    level._id_AC03 thread _id_C74D( "bunker_radio_door_guy" );
    level._id_C280 thread _id_C74D( "gun_toss_guy2" );
    level._id_BBBD thread _id_C74D( "gun_toss_guy1" );
    var_0 = maps\_utility::array_spawn( getentarray( "bunker_laptop_guys", "targetname" ) );
    thread _id_B14B();
    var_1 = maps\_utility::array_spawn( getentarray( "bunker_hallway_injured_guys", "targetname" ) );
    var_2 = maps\_utility::array_spawn( getentarray( "bunker_hallway_injured_guys2", "targetname" ) );
    var_3 = maps\_utility::array_spawn( getentarray( "bunker_sleeping_guys", "targetname" ) );
    var_4 = maps\_utility::array_spawn( getentarray( "bunker_doctor_and_patient", "targetname" ) );
    thread create_medic_props( var_4 );
    var_5 = getent( "bunker_hallway_injured_carrier", "targetname" );
    var_6 = var_5 maps\_utility::spawn_ai();
    var_7 = maps\_utility::array_spawn( getentarray( "bunker_sitting_guys", "targetname" ) );
    var_8 = maps\_utility::array_spawn( getentarray( "bunker_injured_soldier", "targetname" ) );
    var_9 = maps\_utility::array_spawn( getentarray( "bunker_wounded_check", "targetname" ) );
    common_scripts\utility::flag_wait( "introscreen_complete" );
    common_scripts\utility::flag_wait( "player_bunker_comm_room" );
    triggersenable( "colornodes_trenches", "script_noteworthy", 1 );
    common_scripts\utility::flag_wait( "player_approaching_bunker_exit_hall" );
    thread _id_C57E();
    var_10 = getentarray( "drones_flood_monument", "targetname" );
    thread _id_CBDC( var_10, "drones_flood_monument" );
    thread _id_AF4B();

    if ( getdvarint( "r_dcburning_culldist" ) != 1 )
    {
        level._id_CEBC = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "helis_ambient_trenches" );
        level._id_B44F = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "helis_ambient_capitol" );
    }

    level._id_C729 = 8;
    level._id_C3D0 = 10;
    thread _id_D301::_id_AADA( 2 );
    thread _id_D301::_id_AADA( 3 );
    thread _id_D301::_id_AADA( 4 );
    var_11 = maps\_utility::dronespawn( getent( "drone_warrior_hydrant", "targetname" ) );
    var_11 thread _id_AC40();
    var_12 = getent( "seaknight_loader_start", "targetname" );
    var_12 notify( "spawn" );
    var_13 = getent( "seaknight_loader_start2", "targetname" );
    var_13 notify( "spawn" );
    var_12 thread maps\dcburning_aud::_id_B67D( "scn_seaknight_loader_taking_off_02" );
    var_13 thread maps\dcburning_aud::_id_B67D( "scn_seaknight_loader_taking_off_01" );
    var_14 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "littlebird_monument" );
    var_15 = maps\_utility::array_spawn( getentarray( "littlebird_monument_riders_left", "targetname" ) );
    var_14 thread maps\dcburning_aud::littlebird_monument_idle_sound();
    common_scripts\utility::array_thread( var_15, ::_id_BCCC );
    common_scripts\utility::array_thread( var_15, maps\_utility::magic_bullet_shield );
    var_16 = maps\_utility::array_spawn( getentarray( "littlebird_monument_riders_right", "targetname" ) );
    common_scripts\utility::array_thread( var_16, ::_id_BCCC );
    common_scripts\utility::array_thread( var_16, maps\_utility::magic_bullet_shield );
    var_17 = common_scripts\utility::getstruct( "pickup_node_before_stage_monument", "script_noteworthy" );
    var_14 maps\_vehicle::set_stage( var_17, var_15, "left" );
    var_14 maps\_vehicle::set_stage( var_17, var_16, "right" );
    var_18 = getentarray( "littlebird_monument_riders_pilot", "script_noteworthy" );
    common_scripts\utility::array_thread( var_18, maps\_utility::magic_bullet_shield );
    var_19 = [];
    var_20 = getentarray( "monument_spotters", "targetname" );
    var_21 = maps\_utility::array_spawn( var_20, 1 );
    var_19 = maps\_utility::array_merge( var_19, var_21 );
    common_scripts\utility::flag_wait( "player_approaching_monument" );
    var_5 = getent( "drones_seaknight", "targetname" );
    thread _id_B7C2( var_5, "seaknight_drones_loaded", "player_exiting_start_trench2" );
    var_5 = getent( "drones_seaknight2", "targetname" );
    thread _id_B7C2( var_5, "seaknight_drones2_loaded", "player_exiting_start_trench" );
    common_scripts\utility::flag_wait( "player_exiting_start_trench" );
    thread ch46_takeoff_fire();
    thread _id_BDCF();
    var_12 thread _id_BAD4( "seaknight_drones_loaded", "load_riders" );
    var_12 thread _id_BF66( "riders_loaded", "play_anim" );
    var_13 thread _id_BAD4( "seaknight_drones2_loaded", "load_riders" );
    var_13 thread _id_BF66( "riders_loaded", "play_anim" );
    var_22 = getentarray( "spot_targets", "script_noteworthy" );
    common_scripts\utility::array_thread( var_22, ::_id_B5F0 );
    var_23 = getentarray( "bunker_door_up", "targetname" );

    foreach ( var_25 in var_23 )
        var_25 maps\_utility::hide_entity();

    var_27 = getentarray( "bunker_door", "targetname" );
    common_scripts\utility::array_thread( var_27, maps\_utility::show_entity );
    common_scripts\utility::flag_set( "bunker_door_closed" );
    var_28 = common_scripts\utility::getstructarray( "mortar_bunker", "targetname" );
    var_29 = getentarray( "mortar_bunker", "targetname" );
    common_scripts\utility::array_call( var_29, ::delete );
    thread _id_CFA5( var_28, "delete_bunker_mortars" );
    var_30 = getent( "bunker_radio_org_room2", "targetname" );
    var_30 delete();
    var_31 = getent( "volume_bunker", "targetname" );
    var_32 = var_31 _id_ABB7();
    var_33 = var_31 maps\_utility::get_drones_touching_volume( "allies" );
    var_32 = maps\_utility::array_merge( var_32, var_33 );
    common_scripts\utility::array_thread( var_32, ::_id_BA48 );
    common_scripts\utility::array_thread( level._id_BF08, common_scripts\utility::pauseeffect );
    var_5 = getent( "monument_waver", "targetname" );
    var_34 = var_5 maps\_utility::spawn_ai( 1 );
    var_20 = getentarray( "friendlies_commerce_street", "targetname" );
    var_35 = [];

    foreach ( var_5 in var_20 )
        var_35[var_35.size] = var_5 maps\_utility::spawn_ai( 1 );

    common_scripts\utility::array_thread( var_35, ::_id_C35C );
    var_20 = getentarray( "friendlies_commerce_wall", "targetname" );
    var_38 = [];

    foreach ( var_5 in var_20 )
        var_38[var_38.size] = var_5 maps\_utility::spawn_ai( 1 );

    thread ai_commerce_reduce_sightrace( common_scripts\utility::array_flatten( [ var_35, var_38 ] ) );
    level.battlechattermaxcanseeperframe = 5;
    common_scripts\utility::flag_wait( "player_exiting_start_trench2" );
    var_20 = getentarray( "monument_mortarguys", "targetname" );
    var_41 = maps\_utility::array_spawn( var_20, 1 );
    common_scripts\utility::flag_wait( "commerce_enemy_javeling_failsafe" );
    var_19 = common_scripts\utility::array_add( var_19, var_34 );
    thread maps\_utility::ai_delete_when_out_of_sight( var_19, 1024 );
    var_14 thread maps\_vehicle::load_side( "left", var_15 );
    var_14 thread maps\_vehicle::load_side( "right", var_16 );
    var_42 = common_scripts\utility::getstruct( "littlebird_monument_path", "targetname" );
    var_14 thread _id_C9AA( "player_exiting_start_trench", var_42 );
    var_43 = getentarray( "drones_flood_monument2", "targetname" );
    thread _id_CBDC( var_43, "drones_flood_monument2" );
    common_scripts\utility::flag_wait( "player_trench_capitol_failsafe" );
    var_44 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_trench" );
    var_45 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_commerce_front" );
    var_44 thread maps\dcburning_aud::_id_C60D();
    var_45 thread maps\dcburning_aud::_id_B4A4( "scn_mi28_commerce_01" );
    common_scripts\utility::flag_wait( "player_commerce_trench_01" );
    level.player.ignoreme = 0;
    level.player set_threatbias( 1500 );
    common_scripts\utility::flag_wait( "player_commerce_trench_03" );
    common_scripts\utility::flag_wait_either( "player_touching_commerce_wall_left", "player_touching_commerce_wall_right" );
    thread maps\_utility::autosave_by_name( "commerce_wall" );
    thread _id_D432();
    thread bradley_commerce_targets();
    level._id_A89E._id_C17D = 1;
    common_scripts\utility::array_thread( var_35, maps\_utility::stop_magic_bullet_shield );
    common_scripts\utility::array_thread( var_35, ::_id_B310 );
    common_scripts\utility::flag_wait_or_timeout( "player_approaching_commerce", 5 );
    triggersenable( "colornodes_commerce_approach", "script_noteworthy", 1 );
    var_46 = getentarray( "colornodes_commerce_approach", "script_noteworthy" );
    thread _id_D0CF();
    common_scripts\utility::flag_set( "lav_is_suppressing" );
    var_47 = getaiarray( "axis" );

    foreach ( var_49 in var_47 )
    {
        if ( !isdefined( var_49 ) )
            continue;

        var_49.ignoresuppression = 0;
        var_49.aggressivemode = 0;
    }

    common_scripts\utility::flag_wait_any( "leader_orders_everyone_across_street", "player_entered_commerce_right", "player_entered_commerce_left" );

    if ( !common_scripts\utility::flag( "player_crossing_street" ) )
    {
        var_51 = common_scripts\utility::getclosest( level.player.origin, var_46 );
        var_51 notify( "trigger", level.player );
    }

    level.squad = maps\_utility::remove_dead_from_array( level.squad );
    common_scripts\utility::array_thread( level.squad, ::_id_BCCC );
    thread ai_commerce_entrance_ignore_suppression();
    common_scripts\utility::flag_wait( "player_entering_commerce" );
    level.battlechattermaxcanseeperframe = undefined;
    setdvar( "ai_GrenadeThrowAllowedInStairs", 0 );
    level.squad = maps\_utility::remove_dead_from_array( level.squad );
    common_scripts\utility::array_thread( level.squad, ::_id_A8CE );

    foreach ( var_49 in level.squad )
        var_49 maps\_utility::disable_surprise();

    var_54 = getent( "commerce_blocker_right", "targetname" );
    var_55 = getent( "commerce_blocker_left", "targetname" );
    var_56 = [];
    var_56[0] = var_54;
    var_56[1] = var_55;
    var_57 = common_scripts\utility::getfarthest( level.player.origin, var_56 );
    var_57 show();
    var_57 solid();
    var_57 disconnectpaths();
    common_scripts\utility::flag_wait_either( "player_entered_commerce_left", "player_entered_commerce_right" );
    thread _id_BBAF( "drones_flood_monument" );
    thread _id_BBAF( "drones_flood_monument2" );
    common_scripts\utility::array_thread( level._id_BF38, common_scripts\utility::trigger_off );
    common_scripts\utility::array_thread( level._id_ACEF, common_scripts\utility::trigger_on );
    triggersenable( "colornodes_commerce_bot_to_top", "script_noteworthy", 1 );
    common_scripts\utility::flag_clear( "lav_is_suppressing" );
    var_47 = getaiarray( "axis" );

    foreach ( var_49 in var_47 )
    {
        if ( !isdefined( var_49 ) )
            continue;

        var_49.ignoresuppression = 1;
        var_49.aggressivemode = 1;
    }

    thread maps\_utility::autosave_by_name( "commerce_entered" );
    common_scripts\utility::flag_set( "obj_follow_sgt_macey_complete" );
    triggersenable( "colornodes_elevators", "script_noteworthy", 1 );
    thread maps\_utility::ai_delete_when_out_of_sight( var_35, 1024 );
    thread _id_B8FF();
    var_60 = getent( "volume_commerce_lobby_upper", "targetname" );
    var_61 = var_60 maps\_utility::get_ai_touching_volume( "axis" );

    if ( isdefined( var_61 ) && var_61.size > 0 )
        level._id_BEB9 = var_61;

    wait 1;
    thread _id_BFAF();
    level._id_A89E._id_AB3F = 0;
    maps\_utility::delaythread( 4, ::_id_C5BE );
    common_scripts\utility::flag_wait_either( "commerce_first_floor_enemies_dead", "player_middle_commerce_first_floor" );
    level.squad = maps\_utility::remove_dead_from_array( level.squad );

    foreach ( var_49 in level.squad )
        var_49 maps\_utility::enable_surprise();

    level.player _id_B7C6();

    if ( !common_scripts\utility::flag( "player_middle_commerce_first_floor" ) )
    {
        var_51 = getent( "colornodes_elevators", "script_noteworthy" );
        var_51 notify( "trigger", level.player );
    }

    common_scripts\utility::flag_wait( "player_heading_up_to_mezzanine" );
    thread _id_B933( "all", 1024, 1 );
    level._id_BEB9 = undefined;
    level._id_A89E._id_C17D = 1;
    level._id_A89E._id_AB3F = 1;
    var_64 = getentarray( "mezzanine_blockers", "targetname" );
    common_scripts\utility::array_thread( var_64, maps\_utility::show_entity );
    common_scripts\utility::flag_wait( "ask_bradley_to_stop_firing" );
    level._id_A89E._id_AB3F = 0;
    common_scripts\utility::flag_wait( "player_entering_top_elevator_area" );
    thread _id_CC2C( "all", 128 );
}

ai_commerce_reduce_sightrace( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_2.sightlatency = 1000;
        var_2.defaultsightlatency = 1000;
    }

    common_scripts\utility::flag_wait_any( "leader_orders_everyone_across_street", "player_entered_commerce_right", "player_entered_commerce_left" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2 ) || !isalive( var_2 ) )
            continue;

        var_2.sightlatency = 100;
        var_2.defaultsightlatency = 250;
    }
}

create_medic_props( var_0 )
{
    level.medic_clipboard = getent( "medic_clipboard", "targetname" );
    level.medic_pen = getent( "medic_pen", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.code_classname == "actor_ally_us_army_paramedic" )
        {
            level.medic = var_2;
            break;
        }
    }
}

detach_syringe( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 gettagorigin( var_1 ) );
    var_2.angles = var_0 gettagangles( var_1 );
    var_2 setmodel( "h2_adrenaline_syringe_phys" );
    var_2 physicslaunchclient( var_2.origin, ( -500.0, 500.0, 0.0 ) );
}

attach_clipboard( var_0, var_1 )
{
    level.medic_clipboard delete();
    var_0 attach( "h2_com_clipboard_wpaper_anim", var_1 );
}

attach_pen( var_0, var_1 )
{
    level.medic_pen delete();
    var_0 attach( "h2_characters_accessories_pencil_anim", var_1 );
}

bradley_commerce_targets()
{
    var_0 = getent( "volume_commerce_lobby", "targetname" );
    var_1 = var_0 maps\_utility::get_ai_touching_volume( "axis" );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        level._id_BEB9 = var_1;
}

ai_commerce_entrance_ignore_suppression()
{
    foreach ( var_1 in level.squad )
        var_1.ignoresuppression = 1;

    common_scripts\utility::flag_wait( "player_crossing_street" );
    var_3 = getaiarray( "allies" );

    foreach ( var_1 in var_3 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1.ignoresuppression = 1;
    }

    common_scripts\utility::flag_wait( "player_commerce_past_desks" );

    foreach ( var_1 in var_3 )
    {
        if ( !isdefined( var_1 ) || !isalive( var_1 ) )
            continue;

        var_1.ignoresuppression = 0;
    }
}

_id_C0F4()
{
    self endon( "death" );
    self.a.disablelongdeath = 1;
    maps\_utility::set_ignoresuppression( 1 );
    level endon( "player_approaching_commerce" );
    common_scripts\utility::flag_wait( "player_commerce_trench_03" );
    var_0 = getnodearray( "commerce_lobby_teleport_nodes", "targetname" );
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    self forceteleport( var_1.origin, var_1.angles );
    maps\_utility::set_ignoresuppression( 0 );
    self setgoalpos( self.origin );
    self.attackeraccuracy = 0;
    var_2 = getent( "volume_commerce_front", "targetname" );
    self setgoalvolumeauto( var_2 );
    common_scripts\utility::flag_wait_either( "player_crossing_street", "leader_orders_everyone_across_street" );
    wait(randomfloatrange( 0, 1 ));
    thread _id_CDA5( self.origin );
    self kill();
}

_id_C5BE()
{

}

_id_B7C2( var_0, var_1, var_2 )
{
    var_3 = 1;

    while ( !common_scripts\utility::flag( var_2 ) )
    {
        var_4 = var_0 maps\_utility::dronespawn();
        wait(randomfloatrange( 1, 2.5 ));
    }

    var_5 = maps\_utility::get_drones_with_targetname( var_0.targetname );
    var_5 = maps\_utility::remove_dead_from_array( var_5 );
    maps\_utility::waittill_dead( var_5 );
    common_scripts\utility::flag_set( var_1 );
}

_id_C9AA( var_0, var_1 )
{
    while ( self.riders.size < 6 )
        wait 0.1;

    common_scripts\utility::flag_wait( var_0 );
    thread maps\_vehicle::vehicle_paths( var_1 );
    thread maps\dcburning_aud::littlebird_monument_taking_off_sound();
    self setmaxpitchroll( 20, 50 );
    wait 2;
    maps\_vehicle::vehicle_ai_event( "idle_alert_to_casual" );
    self vehicle_setspeed( 25 );
    self.script_vehicle_selfremove = 1;
    wait 5;
    common_scripts\utility::array_thread( self.riders, maps\_utility::stop_magic_bullet_shield );
    thread _id_C3B0();
}

_id_AC40()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_mid_trench" );
    common_scripts\utility::play_sound_in_space( "mortar_incoming", self.origin );
    playfx( level._effect["mortar"]["dirt"], self.origin );
    earthquake( 0.25, 0.75, self.origin, 1250 );
    thread common_scripts\utility::play_sound_in_space( level.scr_sound["mortar"]["dirt"], self.origin );
    self notify( "stop_drone_fighting" );
    thread common_scripts\utility::play_sound_in_space( "generic_death_american_1", self.origin );
    self.deathanim = level.scr_anim["generic"]["deathanim_mortar_00"];
    self kill();
}

_id_B5F0()
{
    var_0 = 2.4;
    var_1 = 50;
    var_2 = 50;
    wait(var_0);

    while ( !common_scripts\utility::flag( "obj_commerce_defend_snipe_given" ) )
    {
        self moveto( self.origin + ( 0, 0, var_1 ), var_0, 1, 1 );
        wait(var_0);
        self moveto( self.origin + ( var_2, 0, 0 ), var_0, 1, 1 );
        wait(var_0);
        self moveto( self.origin + ( 0, 0, var_1 * -1 ), var_0, 1, 1 );
        wait(var_0);
        self moveto( self.origin + ( var_2 * -1, 0, 0 ), var_0, 1, 1 );
        wait(var_0);
    }

    self delete();
}

_id_CB68()
{
    var_0 = 0;

    while ( !common_scripts\utility::flag( "bunker_door_closed" ) )
    {
        if ( !common_scripts\utility::flag( "player_inside_bunker" ) )
        {
            _id_D301::_id_A8BC( 0 );
            var_0 = 0;
        }
        else if ( var_0 == 0 )
        {
            _id_D301::_id_BC8A( 0 );
            var_0 = 1;
        }

        wait 3;
    }

    _id_D301::_id_A8BC( 0 );
    common_scripts\utility::flag_set( "delete_bunker_mortars" );
}

_id_B14B()
{
    level._id_BEBB = spawn( "script_origin", level.player.origin );
    level._id_BEBB linkto( level.player );
    level._id_BEBB.linked = 1;
    level endon( "javelin_is_owning_fools" );
    _id_C9C8( "dcburn_rm1_report1dash3" );
    _id_C9C8( "dcburn_rm2_sendtraffic" );
    _id_C9C8( "dcburn_rm1_40personnel" );
    _id_C9C8( "dcburn_rm1_lineyankee" );
    _id_C9C8( "dcburn_rm1_linezulu" );
    _id_C9C8( "dcburn_rm1_linealpha" );
    _id_C9C8( "dcburn_rm2_sayagain" );
    _id_C9C8( "dcburn_rm1_sayagain" );
    _id_C9C8( "dcburn_rm2_remarks" );
    _id_C9C8( "dcburn_rm1_noremarks" );
    _id_C9C8( "dcburn_rm2_needintel" );
    _id_C9C8( "dcburn_rm3_engparatroop" );
    _id_C9C8( "dcburn_rm4_footmobiles" );
    _id_C9C8( "dcburn_rm5_thermlaws" );
    _id_C9C8( "dcburn_rm4_whattarget" );
    _id_C9C8( "dcburn_rm5_dropbuilding" );
    _id_C9C8( "dcburn_rm4_fedresbuild" );
    _id_C9C8( "dcburn_rm5_allover" );
    _id_C9C8( "dcburn_rm4_checkin" );
    _id_C9C8( "dcburn_rm5_roger" );
    _id_C9C8( "dcburn_rm4_thermlaws" );
    _id_C9C8( "dcburn_rm6_copiesall" );
    _id_C9C8( "dcburn_rm4_stndingby" );
    _id_C9C8( "dcburn_rm6_thermlawsauth" );
    _id_C9C8( "dcburn_rm4_approved" );
    _id_C9C8( "dcburn_rm5_solidcopy" );
    _id_C9C8( "dcburn_rm5_apprengage" );
    _id_C9C8( "dcburn_rm1_engagingtarg" );
    _id_C9C8( "dcburn_rm1_targetsupp" );
    _id_C9C8( "dcburn_rm4_saddleup" );
    _id_C9C8( "dcburn_rm5_btr60" );
    _id_C9C8( "dcburn_rm6_lawrocket" );
    _id_C9C8( "dcburn_rm1_logancircpark" );
    _id_C9C8( "dcburn_rm2_22isdown" );
    _id_C9C8( "dcburn_rm3_airsupport" );
    _id_C9C8( "dcburn_rm5_mark19down" );
    _id_C9C8( "dcburn_rm4_retrograde" );
    _id_C9C8( "dcburn_rm3_lowammo" );
    _id_C9C8( "dcburn_rm3_5btr60s" );
    _id_C9C8( "dcburn_rm2_callingitin" );
    _id_C9C8( "dcburn_ra2_standingby" );
    _id_C9C8( "dcburn_rm2_gridtomark" );
    _id_C9C8( "dcburn_ra2_gridtosuppress" );
    _id_C9C8( "dcburn_rm2_reqsplash" );
    _id_C9C8( "dcburn_ra2_dangerclose" );
    _id_C9C8( "dcburn_ra2_mess2ob" );
    _id_C9C8( "dcburn_rm2_2gunseffect" );
    _id_C9C8( "dcburn_ra2_shot" );
    _id_C9C8( "dcburn_rm2_shot" );
    _id_C9C8( "dcburn_rm2_splash" );
    _id_C9C8( "dcburn_ra2_splash" );
    _id_C9C8( "dcburn_rm3_takeitout" );
    _id_C9C8( "dcburn_rm2_linkup" );
    _id_C9C8( "dcburn_rm4_dugin" );
    _id_C9C8( "dcburn_rm2_sitrep" );
    _id_C9C8( "dcburn_rm4_brokenarrow" );
    _id_C9C8( "dcburn_rm2_brokearrow" );
    _id_C9C8( "dcburn_rm5_sitrep" );
    _id_C9C8( "dcburn_rm6_kia" );
    _id_C9C8( "dcburn_rm5_tacfreq" );
    _id_C9C8( "dcburn_rm6_switching" );
    _id_C9C8( "dcburn_rm1_12klicksnorth" );
    _id_C9C8( "dcburn_rm2_contactleft" );
    _id_C9C8( "dcburn_rm3_takingfire" );
    _id_C9C8( "dcburn_rm4_tookahit" );
    _id_C9C8( "dcburn_rm5_status" );
    _id_C9C8( "dcburn_rm1_heavyfire" );
    _id_C9C8( "dcburn_rm2_ambush" );
    _id_C9C8( "dcburn_rm3_contactleft" );
    _id_C9C8( "dcburn_rm4_rpg" );
    _id_C9C8( "dcburn_rm5_coversector" );
    _id_C9C8( "dcburn_rp1_tasking" );
    _id_C9C8( "dcburn_fac_pushtoipbuick" );
    _id_C9C8( "dcburn_rp1_mapgrid" );
    _id_C9C8( "dcburn_fac_2a10s" );
    _id_C9C8( "dcburn_rm2_stalkercopies" );
    _id_C9C8( "dcburn_rm2_standby" );
    _id_C9C8( "dcburn_rp1_stndingby" );
    _id_C9C8( "dcburn_rm2_talktotarg" );
    _id_C9C8( "dcburn_rp1_goahead" );
    _id_C9C8( "dcburn_rm2_ovaltrack" );
    _id_C9C8( "dcburn_rp1_contact" );
    _id_C9C8( "dcburn_rm2_ewaxis" );
    _id_C9C8( "dcburn_rp1_contact" );
    _id_C9C8( "dcburn_rm2_logancircpark" );
    _id_C9C8( "dcburn_rp1_contact" );
    _id_C9C8( "dcburn_rm2_yourtarget" );
    _id_C9C8( "dcburn_rp1_rollingin" );
    _id_C9C8( "dcburn_rm2_bringrain" );
    _id_C9C8( "dcburn_rp1_offsafe" );
    _id_C9C8( "dcburn_rp1_guns" );
    _id_C9C8( "dcburn_rp2_offsafe" );
    _id_C9C8( "dcburn_rp1_ejecting" );
    _id_C9C8( "dcburn_rp2_cantseeit" );
    _id_C9C8( "dcburn_rm2_onechute" );
    _id_C9C8( "dcburn_fac_southkstreet" );
}

_id_BF1A()
{
    level endon( "bunker_door_closed" );
    common_scripts\utility::flag_wait( "player_bunker_walk_01" );
    var_0 = getent( "bunker_radio_org_room2", "targetname" );
    var_1 = common_scripts\utility::getstruct( "bunker_radio_org_room1", "targetname" );
    var_0 endon( "death" );
    var_1 endon( "death" );
    var_0 common_scripts\utility::play_sound_in_space( "dcburn_gm5_gotwounded" );
    wait 1;
    var_1 common_scripts\utility::play_sound_in_space( "dcburn_gm3_allyoursdoc" );
    common_scripts\utility::flag_wait( "player_bunker_walk_01a" );
    var_0 common_scripts\utility::play_sound_in_space( "dcburn_gm1_keepstill" );
    var_0 common_scripts\utility::play_sound_in_space( "dcburn_gm1_wherescanteen" );
    wait 1;
    var_0 common_scripts\utility::play_sound_in_space( "dcburn_gm2_righthere" );
    wait 2;
    var_1 common_scripts\utility::play_sound_in_space( "dcburn_gm6_stablefornow" );
    var_1 common_scripts\utility::play_sound_in_space( "dcburn_gm4_2stretchers" );
}

_id_C9C8( var_0 )
{
    if ( !isdefined( level._id_BEBB ) )
        return;

    if ( isdefined( level._id_BEBB.deleteme ) )
        level._id_BEBB delete();

    level._id_BEBB playsound( var_0, "done" );
    level._id_BEBB waittill( "done" );
}

_id_D0CF()
{
    level endon( "player_entered_commerce_right" );
    level endon( "player_entered_commerce_left" );
    common_scripts\utility::flag_wait( "trenches_dialogue_done" );

    for (;;)
    {
        if ( !common_scripts\utility::flag( "player_crossing_street" ) )
            level._id_AC03 dialogue_execute( "dcburn_mcy_latveesupp" );

        if ( !common_scripts\utility::flag( "player_crossing_street" ) )
        {
            level._id_AC03 dialogue_execute( "dcburn_mcy_ready" );
            level._id_AC03 dialogue_execute( "dcburn_mcy_gomoveup" );
        }

        common_scripts\utility::flag_set( "leader_orders_everyone_across_street" );
        wait(randomintrange( 7, 11 ));

        if ( common_scripts\utility::flag( "player_entering_commerce" ) )
            break;

        maps\_utility::radio_dialogue( "dcburn_mcy_lineoffire" );
        wait(randomintrange( 7, 11 ));

        if ( common_scripts\utility::flag( "player_entering_commerce" ) )
            break;

        maps\_utility::radio_dialogue( "dcburn_mcy_movemove" );
        wait(randomintrange( 7, 11 ));

        if ( common_scripts\utility::flag( "player_entering_commerce" ) )
            break;

        maps\_utility::radio_dialogue( "dcburn_mcy_50calsupp" );
        wait(randomintrange( 7, 11 ));

        if ( common_scripts\utility::flag( "player_entering_commerce" ) )
            break;

        maps\_utility::radio_dialogue( "dcburn_mcy_sittingducks" );
        wait(randomintrange( 7, 11 ));

        if ( common_scripts\utility::flag( "player_entering_commerce" ) )
            break;

        maps\_utility::radio_dialogue( "dcburn_mcy_blownoff" );
        wait(randomintrange( 7, 11 ));

        if ( common_scripts\utility::flag( "player_entering_commerce" ) )
            break;

        maps\_utility::radio_dialogue( "dcburn_mcy_moveup" );
        wait(randomintrange( 7, 11 ));

        if ( common_scripts\utility::flag( "player_entering_commerce" ) )
            break;

        maps\_utility::radio_dialogue( "dcburn_mcy_intotargbuilding" );
    }
}

_id_B8FF()
{
    var_0 = 0;
    level._id_AC03 dialogue_execute( "dcburn_mcy_lobby_move_nag_00" );
    common_scripts\utility::flag_set( "obj_commerce_given" );
    level endon( "player_approaching_bottom_elevators" );
    level endon( "stop_nag_get_to_elevator" );

    while ( !common_scripts\utility::flag( "player_approaching_bottom_elevators" ) )
    {
        wait(randomintrange( 5, 8 ));

        if ( common_scripts\utility::flag( "player_approaching_bottom_elevators" ) )
            break;

        if ( var_0 == 0 )
        {
            level._id_AC03 dialogue_execute( "dcburn_mcy_grenadelaunch" );
            var_0 = 1;
            wait(randomintrange( 7, 11 ));
        }

        if ( common_scripts\utility::flag( "player_approaching_bottom_elevators" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_lobby_move_nag_01" );
        wait(randomintrange( 7, 11 ));

        if ( common_scripts\utility::flag( "player_approaching_bottom_elevators" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_lobby_move_nag_02" );
        wait(randomintrange( 7, 11 ));

        if ( common_scripts\utility::flag( "player_approaching_bottom_elevators" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_lobby_move_nag_03" );
        wait(randomintrange( 7, 11 ));

        if ( common_scripts\utility::flag( "player_approaching_bottom_elevators" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_lobby_move_nag_04" );
        wait(randomintrange( 7, 11 ));
    }
}

_id_BFAF()
{
    var_0 = getent( "volume_commerce_lobby_lower", "targetname" );

    for ( var_1 = var_0 maps\_utility::get_ai_touching_volume( "axis" ); var_1.size > 0; var_1 = var_0 maps\_utility::get_ai_touching_volume( "axis" ) )
        wait 0.5;

    common_scripts\utility::flag_set( "commerce_first_floor_enemies_dead" );
}

_id_AC93()
{
    var_0 = getent( "bunker_radio_org_room2", "targetname" );
    common_scripts\utility::flag_wait( "player_bunker_walk_02" );
    common_scripts\utility::flag_wait( "player_bunker_walk_03" );
    common_scripts\utility::flag_wait( "player_approaching_bunker_exit_hall" );
    common_scripts\utility::flag_set( "obj_follow_sgt_macey_given" );
    common_scripts\utility::flag_wait( "player_leaving_bunker" );
    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::battlechatter_on( "axis" );
    common_scripts\utility::array_thread( level._id_BF38, common_scripts\utility::trigger_on );
    maps\_utility::radio_dialogue( "dcburn_hqr_uncoverengage" );
    thread maps\_utility::radio_dialogue( "dcburn_cpd_opticsonus" );
    common_scripts\utility::flag_wait( "javelin_is_owning_fools" );
    maps\_utility::flavorbursts_on( "allies" );
    level._id_BEBB.deleteme = 1;
    wait 2;
    level._id_AC03 dialogue_execute( "dcburn_mcy_reqairstrike" );
    maps\_utility::radio_dialogue( "dcburn_hqr_alongpotomac" );
    wait 2;
    thread _id_C488();
    wait 0.75;
    thread maps\_utility::autosave_by_name( "trench_start" );
    level._id_AC03 dialogue_execute( "dcburn_mcy_buytime" );
    common_scripts\utility::flag_wait( "player_trench_capitol_failsafe" );
    level._id_AC03 dialogue_execute( "dcburn_mcy_haulingpastus" );
    thread maps\_utility::radio_dialogue( "dcburn_hqr_latvee" );
    wait 3;
    common_scripts\utility::flag_set( "bradley_can_start_firing" );
    common_scripts\utility::flag_wait( "commerce_rappelers_inserting" );
    wait 1;

    if ( !common_scripts\utility::flag( "player_commerce_trench_03" ) )
        maps\_utility::radio_dialogue( "dcburn_hqr_linkup" );

    if ( !common_scripts\utility::flag( "player_commerce_trench_03" ) )
        level._id_AC03 dialogue_execute( "dcburn_mcy_firelow" );

    common_scripts\utility::flag_set( "trenches_dialogue_done" );
}

_id_C856()
{
    common_scripts\utility::flag_wait( "player_approaching_bunker_exit" );
    thread maps\_utility::autosave_by_name( "javelins_trench" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "m1a1_trench" );
    common_scripts\utility::flag_wait( "player_leaving_bunker" );
    maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "apache_01" );
    thread _id_ABCC();
    var_1 = getent( "javelin_source_org", "targetname" );
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname( "monument_heli_owned" );
    var_2 vehicle_turnengineoff();
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname( "m1a1_owned" );
    var_3 thread tank_player_collisions();
    var_4 = maps\_vehicle::spawn_vehicle_from_targetname( "m1a1_owned2" );
    var_4 maps\_vehicle::godon();
    var_5 = getentarray( "javelin_vehicle_targets", "targetname" );
    common_scripts\utility::array_thread( var_5, ::_id_B674 );
    var_3 thread maps\dcburning_aud::_id_BA1C();
    common_scripts\utility::flag_wait( "player_exiting_start_trench" );
    maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "jets_monument_01" );
    wait 2;
    thread maps\_vehicle::gopath( var_3 );
    var_3 thread maps\dcburning_aud::_id_B614();
    common_scripts\utility::flag_wait_either( "looking_commerce_enemy_javelin", "commerce_enemy_javeling_failsafe" );
    var_6 = magicbullet( "javelin_noimpact", var_1.origin, var_2.origin );
    playfx( common_scripts\utility::getfx( "javelin_muzzle" ), var_1.origin );
    var_6 thread _id_CD38();
    var_6 missile_settargetpos( var_2.origin );
    var_6 missile_setflightmodetop();
    var_7 = maps\_utility::get_vehicle( "seaknight_monument_takeoff_01", "script_noteworthy" );
    var_8 = common_scripts\utility::getstruct( "heli_monument_path_01", "targetname" );
    var_7 thread maps\_vehicle::vehicle_paths( var_8 );
    var_7 thread maps\_utility::play_loop_sound_on_tag( "scn_seaknight_loader_taking_off_03", undefined, 1 );
    thread maps\_utility::flag_set_delayed( "javelin_is_owning_fools", 1 );
    wait 2.5;
    thread maps\_vehicle::gopath( var_4 );
    var_4 maps\_vehicle::godoff();
    var_3 setturrettargetent( var_1 );
    var_3 thread _id_C882( var_1 );
    var_3 thread _id_B9D2();

    for (;;)
    {
        var_2 waittill( "damage", var_9, var_10 );

        if ( isdefined( var_10 ) && !isplayer( var_10 ) )
            break;
    }

    thread _id_AD17::_id_C03A( var_2 );
    wait 10;
    var_4 setturrettargetent( var_1 );
    var_4 thread _id_C882( var_1 );
    var_4 maps\_utility::delaythread( 0, ::_id_CA9D, var_1 );
    wait 8;
    var_0 maps\_utility::delaythread( 0, ::_id_CA9D, var_1 );
    common_scripts\utility::flag_set( "second_abrams_killed" );
    wait 8;
    var_11 = common_scripts\utility::getstructarray( "javelin_targets_trench", "targetname" );
    var_12 = var_5;
    var_13 = undefined;
    var_14 = undefined;
    var_15 = 1;
    var_16 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    while ( !common_scripts\utility::flag( "player_entering_top_elevator_area" ) )
    {
        wait(randomfloatrange( 5, 8 ));
        var_17 = randomint( var_11.size );
        var_14 = var_11[var_17];
        var_16.origin = var_14.origin;
        var_6 = magicbullet( "javelin_dcburn", var_1.origin, var_16.origin );
        playfx( common_scripts\utility::getfx( "javelin_muzzle" ), var_1.origin );
        var_6 thread _id_CD38();
        var_6 missile_settargetent( var_16 );
        var_6 missile_setflightmodetop();
        var_15 = 1;
        wait(randomfloatrange( 5, 10 ));
    }

    var_16 delete();
}

_id_ABCC()
{
    wait 2.0;
    var_0 = getentarray( "apache_rumble", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( distance( var_2.origin, level.player.origin ) < 2000 )
            level.player _meth_80B5( "Heli_pass_above" );
    }

    wait 4.0;
    stopallrumbles();
}

_id_B9D2()
{
    wait 2;
    var_0 = getent( "javelin_source_org", "targetname" );
    self setturrettargetent( var_0, ( 0.0, 0.0, -60.0 ) );
    common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", 1.0 );
    self notify( "turret_fire" );

    if ( distance( self.origin, level.player.origin ) < 1500 )
        level.player playrumblelooponentity( "damage_heavy" );

    common_scripts\_exploder::exploder( "m1a1_fires" );
    common_scripts\utility::flag_wait_either( "player_trench_capitol_failsafe", "blow_up_abrams" );
    thread _id_B9D7();
    maps\_utility::delaythread( 0, ::_id_CA9D, var_0 );
}

_id_B9D7()
{
    self waittill( "death" );

    if ( distance( self.origin, level.player.origin ) < 1024 )
        level.player dodamage( 50 / level.player.damagemultiplier, level.player.origin );
}

_id_AEFF()
{

}

_id_C882( var_0 )
{
    self endon( "death" );
    var_1 = self.mgturret[0];

    while ( isdefined( self ) )
    {
        var_1 settargetentity( var_0 );
        var_2 = randomfloatrange( 1.5, 3 );
        var_1 startfiring();
        wait(var_2);
        var_1 stopfiring();
        wait(randomfloatrange( 3, 6 ));
    }
}

_id_B59B( var_0 )
{
    self endon( "death" );
    self notify( "stop_firing_turret" );
    self endon( "stop_firing_turret" );
    var_1 = 0.1;

    while ( isdefined( self ) )
    {
        var_2 = randomintrange( 10, 20 );

        if ( !self.firingmissiles )
        {
            for ( var_3 = 0; var_3 < var_2; var_3++ )
            {
                self setturrettargetent( var_0, common_scripts\utility::randomvector( 50 ) + ( 0.0, 0.0, 32.0 ) );
                self fireweapon();
                wait(var_1);
            }
        }
        else
            wait 0.5;

        wait(randomfloatrange( 2, 3 ));
    }
}

_id_C57E()
{
    var_0 = getent( "obelisk_chunk", "targetname" );
    common_scripts\utility::flag_wait( "obelisk_destruction" );
    common_scripts\_exploder::exploder( "obelisk_falling_dirt" );
    var_0 hide();
    var_1 = spawn( "script_model", var_0.origin );
    var_1.animname = "obelisk";
    var_1 maps\_anim::setanimtree();
    var_1 setmodel( "h2_dcburning_obelisk_break_a" );
    var_1.angles = var_0.angles;
    var_1 thread maps\_anim::anim_single_solo( var_1, "h2_dcburning_obelisk_break_a_anim" );
    var_2 = spawn( "script_model", var_0.origin );
    var_2.animname = "obelisk";
    var_2 maps\_anim::setanimtree();
    var_2 setmodel( "h2_dcburning_obelisk_break_b" );
    var_2.angles = var_0.angles;
    var_2 thread maps\_anim::anim_single_solo( var_2, "h2_dcburning_obelisk_break_b_anim" );
    thread common_scripts\utility::play_sound_in_space( "scn_obelisk_destruction_a", var_1.origin );
    var_0 delete();
    wait 10;
    var_1 delete();
    var_2 delete();
}

_id_BDCF()
{
    level endon( "leader_orders_everyone_across_street" );
    var_0 = getent( "destructible_trigger", "targetname" );
    var_1 = level.squad;
    var_0 waittill( "trigger" );

    foreach ( var_3 in var_1 )
    {
        var_3 maps\_utility::setflashbangimmunity( 0 );
        var_4 = randomfloatrange( 4.5, 6.5 );

        if ( distancesquared( var_0.origin, var_3.origin ) < 90000 )
            var_3 thread maps\_utility::flashbangstart( var_4 );

        var_3 maps\_utility::setflashbangimmunity( 0 );
    }
}

ch46_takeoff_fire()
{
    wait 11;
    common_scripts\_exploder::exploder( "ch46_takeoff_transition" );
}

_id_AA3B()
{
    common_scripts\utility::flag_wait( "player_leaving_bunker" );
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname( "helisquad_monument" );
    common_scripts\utility::flag_wait( "player_approaching_monument" );
    common_scripts\utility::array_call( var_0, ::vehicle_setspeed, 100 );
    common_scripts\utility::array_thread( var_0, maps\_vehicle::gopath );
    common_scripts\utility::array_thread( var_0, maps\dcburning_aud::heli_array_scripted_sound );
}

_id_B327()
{
    common_scripts\utility::flag_wait( "player_leaving_bunker" );
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname( "helisquad_monument_ground" );
    common_scripts\utility::array_thread( var_0, maps\dcburning_aud::_id_C803 );
    common_scripts\utility::array_thread( var_0, maps\_vehicle::godon );
}

_id_D559()
{
    common_scripts\utility::flag_wait( "player_leaving_bunker" );
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname( "helis_monument_cargo" );
    var_1 = maps\_vehicle::spawn_vehicles_from_targetname( "helis_monument_cargo_noliftoff" );
    common_scripts\utility::array_thread( var_0, maps\dcburning_aud::heli_array_scripted_sound );
    common_scripts\utility::array_thread( var_1, maps\dcburning_aud::heli_array_scripted_sound );
    common_scripts\utility::flag_wait( "player_approaching_monument" );
    common_scripts\utility::array_thread( var_0, ::_id_BA77 );
    common_scripts\utility::array_thread( var_1, maps\_vehicle::gopath );
}

_id_A843()
{
    common_scripts\utility::flag_wait_either( "player_trench_looking_capitol", "player_trench_capitol_failsafe" );
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "jets_capitol_01" );
}

_id_D5C5()
{
    common_scripts\utility::flag_wait( "player_approaching_bunker_exit" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "latvee_spotlight_left" );
    common_scripts\utility::flag_set( "latvee_commerce_left_done_with_spotlight" );
    var_0 thread maps\_vehicle::gopath();
    var_0 waittill( "reached_end_node" );
    var_0 _id_AEA1();
}

_id_A83B()
{
    common_scripts\utility::flag_wait( "player_approaching_bunker_exit" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "latvee_spotlight" );
    var_0 maps\_vehicle::godon();
    var_1 = var_0.mgturret[0];
    var_2 = var_0.attachedguys[1];
    var_2.ignoreall = 0;
    var_2.ignoreme = 1;
    var_2._id_D5D7 = 1;
    var_3 = getentarray( "ai_mezzanine_target", "targetname" );
    var_0 thread latvee_shoot( var_2, var_3, "player_entering_courtyard2" );
    common_scripts\utility::flag_wait( "player_entering_top_elevator_area" );
    common_scripts\utility::flag_wait( "player_in_crowsnest_room" );
    var_4 = var_0.riders;
    common_scripts\utility::array_thread( var_4, ::_id_BA48 );
    var_0 _id_AEA1();
    common_scripts\utility::flag_set( "latvee_spotlight_deleted" );
}

_id_A89E()
{
    common_scripts\utility::flag_wait( "player_approaching_bunker_exit" );
    level._id_A89E = maps\_vehicle::spawn_vehicle_from_targetname( "bradley_commerce" );
    level._id_A89E maps\_vehicle::godon();
    common_scripts\utility::flag_wait( "bradley_can_start_firing" );
    var_0 = getentarray( "bradley_default_targets", "targetname" );
    level._id_A89E thread bradley_shoot( var_0, "player_entering_commerce" );
    common_scripts\utility::flag_wait( "player_entering_top_elevator_area" );
    level._id_A89E _id_AEA1();
}

_id_CDAF( var_0 )
{
    var_0 endon( "death" );

    if ( !isdefined( var_0 ) || !isalive( var_0 ) )
        return;

    var_1 = var_0 gettagorigin( "tag_eye" );
    magicbullet( "m14_scoped", self.origin, var_1 );
    bullettracer( self.origin, var_1, 1 );
    playfxontag( common_scripts\utility::getfx( "headshot" ), var_0, "tag_eye" );
}

_id_AFDE()
{
    var_0 = undefined;

    switch ( self.vehicletype )
    {
        case "zpu_antiair":
            var_0 = self._id_AB2C[randomint( self._id_AB2C.size )];
            break;
        case "bradley":
            var_0 = maps\_helicopter_globals::getenemytarget( self._id_AC76, level.cosine["180"], 1, 0, 0, 1 );
            break;
        case "btr80":
            var_0 = maps\_helicopter_globals::getenemytarget( level._id_AF9D, level.cosine["180"], 1, 1, 0, 1 );
            break;
    }

    if ( isdefined( var_0 ) )
        return var_0;
}

_id_B9BF()
{
    common_scripts\utility::flag_wait( "player_commerce_trench_01" );

    if ( getdvarint( "r_dcburning_culldist" ) == 1 )
    {
        common_scripts\utility::flag_set( "commerce_rappelers_inserting" );
        common_scripts\utility::flag_set( "commerce_rappelers_rappeling" );
        common_scripts\utility::flag_set( "commerce_rappelers_done" );
    }
    else
    {
        var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "blackhawk_commerce_rappel" );
        level._id_AE3D = var_0.riders;
        common_scripts\utility::array_thread( level._id_AE3D, ::_id_CA28 );
        common_scripts\utility::flag_set( "commerce_rappelers_inserting" );
        common_scripts\utility::flag_wait( "commerce_rappelers_rappeling" );
        var_0 thread maps\dcburning_aud::_id_B4A4( "scn_blackhawk_commerce_01" );
        wait 6;
        common_scripts\utility::flag_set( "commerce_rappelers_done" );
    }
}

_id_CA28()
{
    self endon( "death" );
    self setthreatbiasgroup( "oblivious" );
    self._id_D5D7 = 1;
    var_0 = getent( self.target, "targetname" );
    var_1 = var_0.animation;
    self._id_D481 = undefined;

    if ( isdefined( var_0.target ) )
    {
        var_2 = getentarray( var_0.target, "targetname" );

        foreach ( var_4 in var_2 )
        {
            if ( isdefined( var_4.script_exploder ) )
            {
                self.iexplodernum = var_4.script_exploder;
                self._id_ADB0 = var_4.origin;
                break;
            }
        }
    }

    self waittill( "jumpedout" );
    var_0 maps\_anim::anim_generic_first_frame( self, var_1 );

    if ( !common_scripts\utility::flag( "commerce_rappelers_rappeling" ) )
        common_scripts\utility::flag_set( "commerce_rappelers_rappeling" );

    var_0 maps\_anim::anim_generic( self, var_1 );
    self delete();
}

_id_C580( var_0 )
{
    var_1 = var_0._id_ADB0;
    common_scripts\_exploder::exploder( var_0.iexplodernum );
    thread common_scripts\utility::play_sound_in_space( "glass_break", var_1 );
    playfx( common_scripts\utility::getfx( "commerce_window_shatter" ), var_1 );
}

_id_B244()
{
    self endon( "death" );
    self._id_BA5A = undefined;
    thread _id_BFA1( self );
    common_scripts\utility::flag_wait_either( "player_touching_commerce_lobby_right", "player_touching_commerce_lobby_left" );
    var_0 = getent( "volume_commerce_lobby_lower", "targetname" );
    var_1 = getent( "volume_commerce_lobby_upper", "targetname" );
    var_2 = var_0 maps\_utility::get_ai_touching_volume( "axis" );
    var_3 = var_1 maps\_utility::get_ai_touching_volume( "axis" );

    for ( var_4 = undefined; isdefined( self ) && !common_scripts\utility::flag( "player_entering_top_elevator_area" ); var_2 = var_0 maps\_utility::get_ai_touching_volume( "axis" ) )
    {
        var_4 = maps\_utility::array_merge( var_2, var_3 );
        var_4 = maps\_utility::remove_dead_from_array( var_4 );

        if ( isdefined( level._id_B6B3 ) && maps\_utility::is_in_array( var_4, level._id_B6B3 ) )
            self._id_BA5A = level._id_B6B3;
        else if ( var_4.size > 0 )
            self._id_BA5A = common_scripts\utility::getclosest( level.player.origin, var_4 );

        if ( isdefined( self._id_BA5A ) )
        {
            wait(randomfloatrange( 3, 5 ));
            continue;
        }

        wait 0.5;
    }

    common_scripts\utility::flag_wait( "player_entering_top_elevator_area" );
    var_5 = getentarray( "latvee_spotlight_targets_upper", "targetname" );

    for ( var_4 = undefined; isdefined( self ); self._id_BA5A = var_5[randomint( var_5.size )] )
        wait(randomfloatrange( 2, 4 ));
}

_id_BFA1( var_0 )
{
    self endon( "death" );
    level._id_B6B3 = undefined;

    while ( isdefined( self ) )
    {
        level.player waittill( "damage", var_1, var_2 );

        if ( !isdefined( var_2 ) )
            continue;

        if ( isdefined( var_2.team ) && var_2.team == "axis" )
        {
            level._id_B6B3 = var_2;
            _id_B677( 4 );

            if ( level._id_B6B3 == self )
                level._id_B6B3 = undefined;
        }
    }
}

_id_B208( var_0, var_1 )
{
    self endon( "death" );

    while ( isdefined( var_1 ) )
    {
        foreach ( var_3 in var_0 )
        {
            var_1._id_D134 = var_3;
            wait(randomfloatrange( 3, 6 ));
        }
    }

    foreach ( var_3 in var_0 )
        var_3 delete();
}

_id_C6B8()
{
    common_scripts\utility::flag_wait( "player_approaching_bunker_exit" );
    var_0 = getentarray( "latvee_convoy_00", "targetname" );

    if ( getdvarint( "r_dcburning_culldist" ) == 1 )
        thread _id_C681( var_0, "latvee_convoy_00", 7, 10, 1 );
    else
        thread _id_C681( var_0, "latvee_convoy_00", 3.1, 4.8, 1 );

    common_scripts\utility::flag_wait( "approaching_main_trench" );
    wait 2.5;
    _id_AEC6( "latvee_convoy_00" );
    wait 7.0;
    thread _id_AE7C();
    thread _id_D331();
    thread bradley_side();
    thread latvee_side();
}

_id_D5A7( var_0, var_1, var_2 )
{
    var_3 = magicbullet( "javelin_noimpact", var_0.origin, var_1.origin );
    playfx( common_scripts\utility::getfx( "javelin_muzzle" ), var_0.origin );
    var_3 thread _id_CD38();
    var_3 missile_settargetent( var_2 );
    var_3 missile_setflightmodetop();
    var_2 waittill( "damage" );

    if ( isdefined( var_2 ) )
        var_2 notify( "death" );
}

_id_AE7C()
{
    level endon( "player_headed_to_atrium_side_hall" );
    var_0 = getent( "convoy_javelin_source_org", "targetname" );
    var_1 = getent( "latvee_goal1", "targetname" );
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "latvee_convoy_owned1" );
    wait 26.0;
    _id_D5A7( var_0, var_1, var_2 );
}

_id_D331()
{
    level endon( "player_headed_to_atrium_side_hall" );
    var_0 = getent( "convoy_javelin_source_org", "targetname" );
    var_1 = getent( "latvee_goal2", "targetname" );
    wait 5.0;
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "latvee_convoy_owned2" );
    wait 24.0;
    _id_D5A7( var_0, var_1, var_2 );
}

bradley_side()
{
    level endon( "player_headed_to_atrium_side_hall" );
    var_0 = getentarray( "tank_targets", "targetname" );
    wait 5;
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "tank_convoy_shoot" );
    var_1 waittill( "reached_end_node" );
    wait 3.0;
    var_1 thread bradley_shoot( var_0, "player_entering_commerce" );
}

bradley_shoot( var_0, var_1 )
{
    if ( common_scripts\utility::flag( var_1 ) )
        return;

    level endon( var_1 );
    var_2 = spawn( "script_origin", ( -20919.0, 6628.0, -110.0 ) );
    self setturrettargetent( var_2 );

    for (;;)
    {
        var_3 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_5 in var_3 )
        {
            var_2 moveto( var_5.origin, 2 );
            wait 2.0;
            var_6 = randomintrange( 2, 6 );

            for ( var_7 = 0; var_7 < var_6; var_7++ )
            {
                var_8 = weaponfiretime( "bradley_turret" );
                wait(var_8);
                self fireweapon( undefined, undefined, undefined, 0.1 );
                earthquake( 0.25, 0.13, self.origin, 1024 );
            }

            wait(randomfloatrange( 1.5, 5 ));
        }
    }
}

latvee_side()
{
    level endon( "player_headed_to_atrium_side_hall" );
    wait 8.0;
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "latvee_convoy_shoot" );
    var_1 = var_0.attachedguys[0];
    var_0 waittill( "reached_end_node" );
    var_0 maps\_vehicle::vehicle_unload( "passengers_and_driver" );
    var_2 = getentarray( "ai_mezzanine_target", "targetname" );
    var_1.ignoreall = 0;
    var_1.ignoreme = 1;
    var_1._id_D5D7 = 1;
    var_0 thread latvee_shoot( var_1, var_2, "player_entering_courtyard2" );
}

latvee_shoot( var_0, var_1, var_2 )
{
    if ( common_scripts\utility::flag( var_2 ) )
        return;

    level endon( var_2 );
    var_3 = self.mgturret[0];

    for (;;)
    {
        var_1 = common_scripts\utility::array_randomize( var_1 );

        foreach ( var_5 in var_1 )
        {
            var_3 setmode( "manual" );
            var_3 settargetentity( var_5 );
            wait 1;
            var_0.ignoreall = 0;
            wait(randomintrange( 3, 5 ));
            var_0.ignoreall = 1;
            wait(randomintrange( 3, 5 ));
        }
    }
}

_id_AB51()
{
    thread _id_C855();
    thread _id_AE10();
    thread _id_B65F();
    thread _id_C313();
    thread _id_D2BA();
    common_scripts\utility::flag_wait( "player_entering_top_elevator_area" );
    thread _id_B45F();
}

_id_C855()
{
    common_scripts\utility::flag_wait( "capitol_building_reveal" );
    _id_CC2C( "allies", 128 );
}

remove_latvee_gunners()
{
    var_0 = getentarray( "laatpv_gunner", "script_noteworthy" );

    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in var_0 )
        {
            if ( isdefined( var_2.magic_bullet_shield ) )
                var_2 maps\_utility::stop_magic_bullet_shield();

            var_2 delete();
        }
    }
}

_id_C313()
{
    level endon( "player_entering_top_elevator_area" );
    common_scripts\utility::flag_wait( "player_near_samsite" );
    maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "jets_samsite" );
}

_id_D2BA()
{
    common_scripts\utility::flag_wait_either( "player_touching_commerce_lobby_right", "player_touching_commerce_lobby_left" );
    thread _id_CCAB();
    var_0 = [];
    var_1 = undefined;

    if ( common_scripts\utility::flag( "player_touching_commerce_lobby_left" ) )
        var_1 = getentarray( "friendlies_commerce_lobby_left", "targetname" );
    else
        var_1 = getentarray( "friendlies_commerce_lobby_right", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_3 maps\_utility::spawn_ai( 1 );

        if ( isdefined( var_4 ) )
            var_0 = common_scripts\utility::array_add( var_0, var_4 );
    }

    common_scripts\utility::array_thread( var_0, ::_id_C8EA );
    common_scripts\utility::array_thread( var_0, ::_id_C35C );

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        var_4.attackeraccuracy = 0;
    }

    thread _id_AD91();
    common_scripts\utility::flag_wait( "player_approaching_bottom_elevators" );
    setdvar( "ai_GrenadeThrowAllowedInStairs", 1 );
    thread maps\_utility::autosave_by_name( "bottom_elevators" );
    common_scripts\utility::array_thread( var_0, maps\_utility::stop_magic_bullet_shield );

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        var_4.attackeraccuracy = 0.1;
    }

    common_scripts\utility::array_thread( var_0, ::_id_B310 );
    common_scripts\utility::flag_wait( "player_entering_courtyard" );

    if ( getdvarint( "r_dcburning_culldist" ) == 1 )
        setculldist( 0 );

    thread _id_A89A( "volume_commerce_lobby_upper", "axis" );
    thread _id_A89A( "volume_commerce_lobby_lower", "axis" );
    common_scripts\utility::flag_wait( "player_headed_to_atrium_side_hall" );
    var_10 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_10, ::_id_D291 );
    common_scripts\utility::flag_wait( "player_entering_commerce_side_hall" );
    thread ceiling_tile_fall();
    common_scripts\utility::flag_set( "stop_elevator_doors" );
    wait 8;
    thread maps\_utility::waittill_targetname_volume_dead_then_set_flag( "volume_courtyard_windows", "courtyard_has_been_cleared" );
    common_scripts\utility::flag_wait( "player_heading_up_to_mezzanine" );
    common_scripts\utility::flag_wait( "player_entering_mezzanine_top" );
    thread maps\_utility::waittill_targetname_volume_dead_then_set_flag( "volume_commerce_lobby_upper", "mezzanine_top_has_been_cleared" );
    maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "jets_mezz_01" );
    thread _id_AE07();
    common_scripts\utility::flag_wait( "player_approaching_pavlov_hole" );
    maps\_utility::delaythread( 0, maps\_vehicle::spawn_vehicles_from_targetname_and_drive, "helis_mezzanine" );
    common_scripts\_exploder::exploder( 60 );
    common_scripts\utility::flag_wait( "player_at_bottom_of_pavlovs_ramp" );
    thread _id_D5C4( "axis" );
    thread remove_latvee_gunners();
    thread _id_BC9E();
    maps\_utility::battlechatter_off( "allies" );
    var_11 = maps\_utility::array_spawn( getentarray( "commerce_allied_fodder_4", "targetname" ), 1 );
    var_12 = maps\_utility::array_spawn( getentarray( "hostiles_commerce_samsite", "targetname" ), 1 );
    var_13 = _id_BE4C( "samsite_commerce_01", "player_at_top_of_pavlovs_ramp", "commerce_samsite_revealed" );
    var_14 = getnodearray( "commerce_samsite_nodes", "targetname" );
    var_15 = common_scripts\utility::getclosest( var_13._id_C484.origin, var_14 );
    var_14 = common_scripts\utility::array_remove( var_14, var_15 );
    var_13._id_C484 thread _id_A844( var_15 );
    var_13._id_CD87 thread _id_A844( var_14[0] );
    var_13.turret thread _id_CB9E();
    var_13 thread _id_B107();
    common_scripts\utility::flag_wait_any( "player_entering_fourth_floor", "player_shot_at_samsite_guys", "player_gawking_at_fourth_floor_guys" );
    common_scripts\utility::flag_set( "player_shot_at_samsite_guys" );
    maps\_utility::battlechatter_on( "allies" );

    if ( !common_scripts\utility::flag( "player_entering_fourth_floor" ) )
    {
        thread _id_B983( "dummy_colornodes_pavlov_end" );
        maps\_utility::activate_trigger( "spawner_hostiles_commerce_floor4", "targetname", level.player );
    }

    common_scripts\utility::array_thread( var_11, ::_id_BA48 );
    wait 4;
    thread maps\_utility::waittill_targetname_volume_dead_then_set_flag( "volume_commerce_fourth_floor", "floor_four_has_been_cleared" );
    common_scripts\utility::flag_wait_either( "floor_four_has_been_cleared", "player_headed_to_fifth_floor" );
    common_scripts\utility::flag_wait( "player_headed_to_fifth_floor" );
    maps\_utility::battlechatter_off( "allies" );
    thread _id_CC2C( "all" );
}

ceiling_tile_fall()
{
    var_0 = getent( "ceiling_tile01", "targetname" );
    common_scripts\utility::flag_wait( "ceiling_tile_trigger" );
    var_0 physicslaunchclient( var_0.origin, ( 0.0, 0.0, 0.0 ) );
}

_id_AE07()
{
    var_0 = getentarray( "mezzanine_trenches", "targetname" );
    var_1 = getentarray( "ai_mezzanine_target", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_C8CA, var_1 );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    _id_CE7D();
    thread _id_D1D3( var_0 );
}

_id_C8CA( var_0 )
{
    level endon( "player_at_top_of_pavlovs_ramp" );
    var_1 = undefined;
    var_2 = var_0[randomint( var_0.size )];
    var_3 = 1;

    for (;;)
    {
        if ( !var_3 )
        {
            while ( var_2 == var_1 )
                var_2 = var_0[randomint( var_0.size )];
        }
        else
            var_3 = 0;

        if ( isalive( self ) )
            self setentitytarget( var_2 );

        var_1 = var_2;
        wait(randomintrange( 5, 8 ));
    }
}

_id_CE7D()
{
    var_0 = getentarray( "mezzanine_trenches_run", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    thread _id_D1D3( var_0 );
}

_id_D1D3( var_0 )
{
    common_scripts\utility::flag_wait( "player_at_top_of_pavlovs_ramp" );
    maps\_utility::ai_delete_when_out_of_sight( var_0, 512 );
}

_id_B107()
{
    common_scripts\utility::flag_wait( "samsite_allow_C4_spawn" );
    var_0 = getent( "tarp_collision", "script_noteworthy" );
    var_0 notsolid();
    var_0 connectpaths();
    var_1 = common_scripts\utility::getstructarray( "c4_slamraam", "script_noteworthy" );
    level._id_B743 = self.base;

    foreach ( var_3 in var_1 )
        level._id_B063[level._id_B063.size] = self.base _id_AAAB::_id_D2A9( undefined, undefined, undefined, var_3.origin, undefined, undefined, var_3.animation, ::_id_BB46, var_3.script_dot, 30, undefined, var_3.angles );

    self.base waittill( "c4_detonation" );
    self.base notify( "death" );
    common_scripts\utility::flag_set( "slamraam_c4_detonated" );
    self.base setmodel( "vehicle_slamraam_destroyed" );
    playfx( common_scripts\utility::getfx( "c4_slamraam_explosion" ), self.base.origin );
    thread common_scripts\utility::play_sound_in_space( "exp_slamraam_destroyed", self.base.origin );
    self.turret delete();
    radiusdamage( self.base.origin + ( 0.0, 0.0, 96.0 ), 180, 1000, 50 );
    var_5 = common_scripts\utility::getstructarray( "damage_window", "targetname" );

    foreach ( var_7 in var_5 )
        radiusdamage( var_7.origin, 50, 35, 35, level.player );

    var_9 = spawnfx( common_scripts\utility::getfx( "fire_tarp_dcburning" ), self.base.origin );
    triggerfx( var_9 );
    earthquake( 0.6, 1.2, self.base.origin, 1600 );

    if ( distance( self.base.origin, level.player.origin ) < 2048 )
        level.player playrumblelooponentity( "damage_heavy" );

    common_scripts\utility::flag_wait( "player_entering_top_elevator_area" );
    var_9 delete();
}

_id_BB46()
{
    return level._id_B743;
}

_id_AE10()
{
    common_scripts\utility::flag_wait( "player_approaching_bottom_elevators" );
    var_0 = getentarray( "atrium_guys", "targetname" );
    var_1 = [];
    var_2 = undefined;
    var_3 = undefined;

    foreach ( var_5 in var_0 )
    {
        var_2 = var_5 maps\_utility::dronespawn();
        var_2 thread maps\_utility::magic_bullet_shield( 1 );
        var_2.noragdoll = 1;
        var_2.nocorpsedelete = 1;
        var_2.ignoreme = 1;
        var_2.reference = var_5;
        var_2.dontdonotetracks = 1;
        var_2.script_looping = 0;
        var_2 maps\_utility::gun_remove();
        var_2.deathanim = level.scr_anim["generic"][var_5.animation + "_death"];
        var_1[var_1.size] = var_2;
        var_2._id_CD87 = 0;

        if ( var_5.animation == "airport_civ_dying_groupB_pull" )
            var_3 = var_2;

        var_2.animation = var_5.animation;
        var_2.reference maps\_anim::anim_generic_first_frame( var_2, var_2.animation );
    }

    common_scripts\utility::flag_wait( "player_entering_courtyard" );
    var_1[0].reference thread maps\_anim::anim_generic( var_1[0], var_1[0].animation );
    var_1[1].reference thread maps\_anim::anim_generic( var_1[1], var_1[1].animation );
    var_3 thread maps\_utility::play_sound_on_tag_endon_death( "scn_dcburning_soldier_pull_wounded", "J_Head" );
    wait 0.05;
    var_1[0] setanimtime( level.scr_anim["generic"][var_1[0].animation], 0.5 );
    var_1[1] setanimtime( level.scr_anim["generic"][var_1[1].animation], 0.5 );
    common_scripts\utility::array_thread( var_1, ::_id_CCE6 );
    common_scripts\utility::flag_wait_either( "atrium_guys_at_end_of_anim", "player_entering_courtyard2" );
    var_7 = getent( "atrium_bullet", "targetname" );
    var_8 = var_3 gettagorigin( "tag_eye" );
    thread common_scripts\utility::play_sound_in_space( "scn_dcburning_soldier_death", var_8 );
    var_9 = vectornormalize( var_8 - var_7.origin );
    thread common_scripts\utility::play_sound_in_space( "scn_dcburning_gunshot_npc_close", var_7.origin );
    playfx( common_scripts\utility::getfx( "headshot" ), var_8, var_9 );
    magicbullet( "m14_scoped", var_7.origin, var_8 );
    bullettracer( var_7.origin, var_8, 1 );

    foreach ( var_2 in var_1 )
    {
        var_2 maps\_utility::stop_magic_bullet_shield();
        var_2 kill();
    }

    var_12 = getent( "atrium_drag_blocker", "targetname" );
    var_12 maps\_utility::hide_entity();
    var_13 = undefined;
    var_14 = getentarray( "hostiles_courtyard", "targetname" );

    foreach ( var_16 in var_14 )
    {
        if ( ( var_16.classname == "actor_enemy_airborne_SMG" || var_16.classname == "actor_enemy_airborne_AR" ) && !maps\_utility::player_can_see_ai( var_16 ) )
        {
            var_13 = var_16;
            break;
        }
    }

    var_18 = getnode( "teleport_node", "script_noteworthy" );

    if ( isdefined( var_13 ) )
        var_13 maps\_utility::teleport_ai( var_18 );
}

ai_hostiles_courtyard()
{
    self.targetname = "hostiles_courtyard";
}

_id_CCE6()
{
    level endon( "player_entering_courtyard2" );
    level endon( "atrium_guys_at_end_of_anim" );
    self waittillmatch( "single anim", "end" );
    common_scripts\utility::flag_set( "atrium_guys_at_end_of_anim" );
}

_id_BC9E()
{
    var_0 = getent( "samsite_chater_org", "targetname" );
    var_1 = var_0.origin;
    var_2 = "player_shot_at_samsite_guys";
    level endon( var_2 );

    while ( !common_scripts\utility::flag( var_2 ) )
    {
        _id_AC7A( "dcburn_ra1_acquiredtwo", var_1, var_2 );
        _id_AC7A( "dcburn_ra2_lockon", var_1, var_2 );
        wait 1;
        _id_AC7A( "dcburn_ra3_missilelocked", var_1, var_2 );
        wait 0.5;
        _id_AC7A( "dcburn_ra1_2moresouthbound", var_1, var_2 );
        _id_AC7A( "dcburn_ra2_firemissile", var_1, var_2 );
        _id_AC7A( "dcburn_ra3_firingmissile", var_1, var_2 );
        wait 1.5;
        _id_AC7A( "dcburn_ra1_movingnorth", var_1, var_2 );
        wait 1;
        _id_AC7A( "dcburn_ra2_10degrees", var_1, var_2 );
    }
}

_id_A844( var_0 )
{
    self endon( "death" );
    self.ignorerandombulletdamage = 1;
    thread _id_ADF3();
    common_scripts\utility::waittill_either( "damage", "alerted" );
    maps\_utility::anim_stopanimscripted();
    self.ignorerandombulletdamage = 0;
    self.ignoreme = 0;
    self.ignoreme = 0;
    self notify( "alerted" );
    self setgoalnode( var_0 );
}

_id_CB9E()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "commerce_samsite_revealed" );
    thread maps\dcburning_aud::_id_BE95();
    wait 2.5;

    if ( common_scripts\utility::flag( "dead_tarp_guys" ) )
        return;

    common_scripts\utility::flag_set( "samsite_allow_C4_spawn" );
    var_0 = 4.5;
    self rotateto( self.angles + ( 0.0, -50.0, 0.0 ), var_0, 2, 2 );
    thread maps\dcburning_aud::_id_B884();
    wait(var_0 / 2);
    var_1 = getent( "slamraam_missile_target", "targetname" );

    while ( !common_scripts\utility::flag( "player_approaching_fourth_floor_sam" ) )
    {
        self detach( "projectile_slamraam_missile", self.missiletags[0] );
        earthquake( 0.3, 0.5, self.origin, 1600 );
        var_2 = magicbullet( "slamraam_missile_dcburning", self gettagorigin( self.missiletags[0] ), var_1.origin );
        thread maps\dcburning_aud::_id_D186( var_2 );
        self.missiletags = common_scripts\utility::array_remove( self.missiletags, self.missiletags[0] );

        if ( self.missiletags.size < 1 )
            break;

        wait(randomfloatrange( 0.3, 2 ));
    }
}

_id_BE4C( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, "targetname" );
    var_4 = undefined;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = [];

    foreach ( var_9 in var_3 )
    {
        if ( isspawner( var_9 ) )
        {
            var_7[var_7.size] = var_9;
            continue;
        }

        if ( var_9.code_classname == "script_model" )
        {
            switch ( var_9.model )
            {
                case "slamraam_tarp":
                    var_5 = var_9;
                    continue;
                case "vehicle_slamraam_launcher_no_spike":
                    var_6 = var_9;
                    continue;
                case "vehicle_slamraam_base":
                    var_4 = var_9;
                    continue;
            }
        }
    }

    var_11 = maps\_utility::array_spawn( var_7, 1 );

    foreach ( var_13 in var_11 )
    {
        var_13.allowdeath = 1;
        var_13.ignoreme = 1;
        var_13.ignoreall = 1;
    }

    var_5.animname = "tarp";
    var_5 maps\_utility::assign_animtree();
    var_11[0].animname = "operator";
    var_11[1].animname = "puller";
    var_15 = var_11;
    var_6.missiletags = [];
    var_6.missiletags[0] = "tag_missle1";
    var_6.missiletags[1] = "tag_missle2";
    var_6.missiletags[2] = "tag_missle3";
    var_6.missiletags[3] = "tag_missle4";
    var_6.missiletags[4] = "tag_missle5";
    var_6.missiletags[5] = "tag_missle6";
    var_6.missiletags[6] = "tag_missle7";
    var_6.missiletags[7] = "tag_missle8";

    foreach ( var_17 in var_6.missiletags )
        var_6 attach( "projectile_slamraam_missile", var_17, 1 );

    var_19 = spawnstruct();
    var_19._id_C484 = var_11[0];
    var_19._id_CD87 = var_11[1];
    var_19.turret = var_6;
    var_19.base = var_4;
    var_20 = getent( "tarp_anim_node", "targetname" );
    var_20 thread _id_ABEA( var_15, var_1, var_2, var_5 );
    return var_19;
}

_id_ABEA( var_0, var_1, var_2, var_3 )
{
    var_4 = getent( "tarp_guys_anim_node", "targetname" );
    thread maps\_anim::anim_first_frame_solo( var_3, "pulldown" );
    var_4 maps\_anim::anim_first_frame( var_0, "pulldown" );
    common_scripts\utility::flag_wait( var_1 );
    var_3 maps\_utility::delaythread( 2, maps\_utility::send_notify, "no_return_tarp_removal" );
    thread maps\_anim::anim_single_solo( var_3, "pulldown" );
    var_4 thread maps\_anim::anim_single( var_0, "pulldown" );
    thread _id_BDF6( var_3, var_0 );
    common_scripts\utility::flag_set( var_2 );
}

_id_BDF6( var_0, var_1 )
{
    var_0 endon( "no_return_tarp_removal" );
    common_scripts\utility::flag_wait( "player_shot_at_samsite_guys" );
    common_scripts\utility::flag_set( "dead_tarp_guys" );
    var_0 stopanimscripted();

    foreach ( var_3 in var_1 )
        var_3 stopanimscripted();
}

_id_ADF3()
{
    self endon( "death" );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.old_goalradius = self.goalradius;
    self.goalradius = 16;
    thread _id_B66D( "player_shot_at_samsite_guys" );
    thread _id_B6E6();
    self waittill( "alerted" );
    self.goalradius = self.old_goalradius;
    self.combatmode = "ambush";
    self.ignoreall = 0;
    self.ignoreme = 0;
}

_id_B6E6()
{
    self endon( "death" );
    self endon( "alerted" );
    common_scripts\utility::flag_wait_any( "player_entering_fourth_floor", "player_shot_at_samsite_guys", "player_gawking_at_fourth_floor_guys" );
    common_scripts\utility::flag_set( "player_shot_at_samsite_guys" );
    thread _id_BE2F();
}

_id_D3AD( var_0 )
{
    var_1 = "dcburning_elevator_corpse_idle_A";
    var_2 = "dcburning_elevator_corpse_bump_A";
    self.allowdeath = 0;
    self.dontdonotetracks = 1;
    self.script_looping = 0;
    maps\_utility::gun_remove();
    self setcontents( 0 );
    self.ignoreme = 1;
    self setlookattext( "", &"" );
    var_3 = var_0;
    var_4 = 0;
    self stopanimscripted();

    while ( !common_scripts\utility::flag( "stop_elevator_doors" ) )
    {
        var_3 thread maps\_anim::anim_generic_loop( self, var_1, "stop_idle" );
        self waittill( "doors_closing" );
        var_3 notify( "stop_idle" );

        if ( common_scripts\utility::flag( "player_looking_at_elevator" ) && isdefined( var_4 ) )
        {
            var_4 = undefined;
            var_3 maps\_anim::anim_generic( self, "dcburning_elevator_corpse_trans_A_2_B" );
            var_1 = "dcburning_elevator_corpse_idle_B";
            var_2 = "dcburning_elevator_corpse_bump_B";
        }

        var_3 maps\_anim::anim_generic( self, var_2 );
    }

    self delete();
}

_id_AD91()
{
    var_0 = getent( "elevator_dude", "targetname" );
    var_1 = var_0 maps\_utility::dronespawn();
    var_1 thread _id_D3AD( var_0 );
    var_2 = getent( "elevator_door_left", "targetname" );
    var_3 = getent( "elevator_door_right", "targetname" );
    var_2.startpos = var_2.origin;
    var_3.startpos = var_3.origin;
    var_4 = getent( "elevator_clip_left", "targetname" );
    var_5 = getent( "elevator_clip_right", "targetname" );
    var_4.startpos = var_4.origin;
    var_5.startpos = var_5.origin;
    var_6 = 28;
    var_7 = -28;
    var_8 = 2;
    var_9 = getent( "musak_org", "targetname" );
    var_9 playloopsound( "elev_musak_loop" );

    while ( !common_scripts\utility::flag( "stop_elevator_doors" ) )
    {
        thread common_scripts\utility::play_sound_in_space( "elev_bell_ding", var_2.origin );
        thread common_scripts\utility::play_sound_in_space( "elev_door_close", var_2.origin );
        var_2 movey( var_6, var_8, var_8 / 2 );
        var_3 movey( var_7, var_8, var_8 / 2 );
        var_4 movey( var_6, var_8, var_8 / 2 );
        var_5 movey( var_7, var_8, var_8 / 2 );
        wait(var_8 - 0.25);
        var_1 notify( "doors_closing" );
        wait 0.25;
        thread common_scripts\utility::play_sound_in_space( "elev_door_open", var_2.origin );
        var_2 moveto( var_2.startpos, var_8, var_8 / 2, var_8 / 2 );
        var_3 moveto( var_3.startpos, var_8, var_8 / 2, var_8 / 2 );
        var_4 moveto( var_4.startpos, var_8, var_8 / 2, var_8 / 2 );
        var_5 moveto( var_5.startpos, var_8, var_8 / 2, var_8 / 2 );
        wait(var_8);
        wait 1.25;
    }

    var_9 stopsounds();
    var_9 delete();
}

_id_B65F()
{
    common_scripts\utility::flag_wait( "player_approaching_bottom_elevators" );
    maps\_utility::radio_dialogue( "dcburn_mcy_upperfloors" );
    maps\_utility::radio_dialogue( "dcburn_hqr_copiesall" );
    common_scripts\utility::flag_wait_either( "courtyard_has_been_cleared", "player_heading_up_to_mezzanine" );

    if ( common_scripts\utility::flag( "courtyard_has_been_cleared" ) )
    {
        maps\_utility::radio_dialogue( "dcburn_mcy_alldeadcourtyard" );
        maps\_utility::radio_dialogue( "dcburn_hqr_solidcopy" );
    }

    thread maps\_utility::autosave_by_name( "courtyard_has_been_cleared" );
    common_scripts\utility::flag_wait( "player_heading_up_to_mezzanine" );
    maps\_utility::radio_dialogue( "dcburn_mcy_tomezzanine" );
    maps\_utility::radio_dialogue( "dcburn_hqr_goodhunt" );
    common_scripts\utility::flag_set( "ask_bradley_to_stop_firing" );
    common_scripts\utility::flag_wait( "player_entering_mezzanine_top" );
    common_scripts\utility::flag_wait_either( "mezzanine_top_has_been_cleared", "capitol_building_reveal" );

    if ( common_scripts\utility::flag( "mezzanine_top_has_been_cleared" ) )
    {
        maps\_utility::radio_dialogue( "dcburn_mcy_alldeadmezzanine" );
        maps\_utility::radio_dialogue( "dcburn_hqr_rogerthat" );
    }

    maps\_utility::flavorbursts_off( "allies" );
    level._id_C280 dialogue_execute( "dcburn_cpd_capitolbuild" );
    maps\_utility::radio_dialogue( "dcburn_ar1_lincolnmemorial" );
    maps\_utility::flavorbursts_on( "allies" );
    common_scripts\utility::flag_wait( "player_at_bottom_of_pavlovs_ramp" );
    maps\_utility::radio_dialogue( "dcburn_hqr_crownag" );
    maps\_utility::radio_dialogue( "dcburn_mcy_omwtofifth" );
    common_scripts\utility::flag_wait( "player_at_top_of_pavlovs_ramp" );

    if ( !common_scripts\utility::flag( "player_shot_at_samsite_guys" ) )
    {
        thread maps\_utility::autosave_by_name( "crow_sneak" );
        maps\_utility::radio_dialogue( "dcburn_mcy_sby2engage" );
    }

    common_scripts\utility::flag_wait_either( "floor_four_has_been_cleared", "player_headed_to_fifth_floor" );

    if ( common_scripts\utility::flag( "floor_four_has_been_cleared" ) )
    {
        maps\_utility::radio_dialogue( "dcburn_mcy_alldeadfourth" );
        maps\_utility::radio_dialogue( "dcburn_hqr_copythat" );
    }

    maps\_utility::flavorbursts_off( "allies" );
    maps\_utility::flavorbursts_on( "allies" );
}

_id_ACB3()
{
    thread _id_D01E();
}

_id_D01E()
{
    common_scripts\utility::flag_wait( "obj_commerce_defend_snipe_complete" );
    var_0 = getentarray( "bmp_flood_south", "targetname" );
    thread _id_B9EE( var_0 );
    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_complete" );
}

_id_B9EE( var_0 )
{
    level endon( "obj_commerce_defend_javelin_complete" );

    for (;;)
    {
        foreach ( var_2 in var_0 )
            thread _id_CD08( var_2 );

        wait(randomfloatrange( 40, 41 ));
    }
}

_id_CD08( var_0 )
{
    if ( !common_scripts\utility::flag( "obj_commerce_defend_javelin_complete" ) )
        return;

    level endon( "obj_commerce_defend_javelin_complete" );
    wait(randomfloatrange( 40, 41 ));
    var_1 = var_0 maps\_vehicle::spawn_vehicle_and_gopath();
    target_set( var_1, ( 0.0, 0.0, 0.0 ) );
    target_setjavelinonly( var_1, 1 );
    target_setattackmode( var_1, "top" );
    var_1 thread _id_C5EF();
    var_1 endon( "death" );
    var_1 waittill( "reached_end_node" );
    var_1 notify( "deleted_through_script" );
    var_1 delete();
}

_id_B45F()
{
    thread _id_B3A5();
    thread _id_CA8D();
    thread _id_AC72();
    common_scripts\utility::flag_wait( "player_approaching_crowsnest" );
    thread _id_A999();
}

_id_B3A5()
{
    common_scripts\utility::flag_wait( "start_music_to_crowsnest" );
    thread maps\_utility::music_loop( "mus_dcburning_evilcrowsnest_approach", 198 );
}

_id_AC72()
{
    common_scripts\utility::flag_wait( "player_at_commerce_crows_floor" );
    triggersenable( "colornodes_commerce_to_crowsnest", "script_noteworthy", 1 );
    common_scripts\_exploder::exploder( "battlefield_smk" );
    common_scripts\utility::flag_wait( "player_entering_top_elevator_area" );
    thread maps\_utility::autosave_by_name( "elevator_top" );
    thread _id_CC2C( "all" );

    if ( isdefined( level._id_CEBC ) )
        common_scripts\utility::array_thread( level._id_CEBC, ::_id_AEA1 );

    if ( isdefined( level._id_CD45 ) )
        common_scripts\utility::array_thread( level._id_CD45, ::_id_AEA1 );

    var_0 = getent( "volume_commerce_sector_2", "targetname" );
    var_1 = getent( "volume_commerce_sector_3", "targetname" );
    var_2 = getent( "flare_dynamic_01", "targetname" );
    common_scripts\utility::flag_wait_either( "player_approaching_flare_moment", "player_looking_at_flare_moment" );
    var_3 = maps\_utility::array_spawn( getentarray( "commerce_flare_guys", "targetname" ), 1 );
    common_scripts\utility::flag_wait( "player_approaching_crowsnest" );
    thread _id_AA8F();
    var_4 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "helis_ambient_crowsnest" );
    var_5 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "helis_crows_snipe" );
    common_scripts\utility::array_thread( var_5, ::_id_D0DF );

    if ( isdefined( level._id_B44F ) )
        common_scripts\utility::array_thread( level._id_B44F, ::_id_C12A );

    thread _id_CC2C( "allies", 128 );
}

animate_wires()
{
    self endon( "death" );
    var_0 = getentarray( "animated_wires", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        var_2.animname = "wire";
        var_2 maps\_anim::setanimtree();
        var_2 thread maps\_anim::anim_loop_solo( var_2, var_2.model );
    }
}

_id_D0DF()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "obj_commerce_defend_crow_given" );
    thread _id_AE5E( "start" );
    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_given" );
    thread _id_D593();
}

_id_C12A()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_shot_at_crowsnest_guys" );
    thread _id_AE5E( "start" );
}

_id_AA8F()
{
    var_0 = common_scripts\utility::getstruct( "obj_commerce_sector_3", "targetname" );
    var_1 = var_0.origin;
    var_2 = "player_shot_at_crowsnest_guys";
    level endon( var_2 );

    while ( !common_scripts\utility::flag( var_2 ) )
    {
        _id_AC7A( "dcburn_ra3_gridsquare", var_1, var_2 );
        _id_AC7A( "dcburn_ra1_dontworry", var_1, var_2 );
        wait 0.5;
        _id_AC7A( "dcburn_ra2_60kph", var_1, var_2 );
        _id_AC7A( "dcburn_ra3_standbyforlaunch", var_1, var_2 );
        wait 0.5;
        _id_AC7A( "dcburn_ra1_bygreencar", var_1, var_2 );
        _id_AC7A( "dcburn_ra2_trackingitnow", var_1, var_2 );
        wait 0.75;
        _id_AC7A( "dcburn_ra3_tooeasy", var_1, var_2 );
        _id_AC7A( "dcburn_ra1_confirmhostile", var_1, var_2 );
        _id_AC7A( "dcburn_ra2_25kph", var_1, var_2 );
        _id_AC7A( "dcburn_ra3_range572meters", var_1, var_2 );
        _id_AC7A( "dcburn_ra1_destroyit", var_1, var_2 );
        _id_AC7A( "dcburn_ra2_clearedtoengage", var_1, var_2 );
        _id_AC7A( "dcburn_ra3_runfromus", var_1, var_2 );
    }
}

_id_C1D3()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "fifth_floor_guys_damaged" );
    self.combatmode = "ambush";
}

_id_CA8D()
{
    common_scripts\utility::flag_wait( "player_entering_top_elevator_area" );
    common_scripts\utility::flag_set( "start_music_to_crowsnest" );
    maps\_utility::radio_dialogue( "dcburn_mcy_onfifth" );

    if ( common_scripts\utility::flag( "player_approaching_flare_moment" ) || common_scripts\utility::flag( "player_approaching_flare_moment" ) )
    {

    }
    else
        maps\_utility::radio_dialogue( "dcburn_hqr_copy21" );

    common_scripts\utility::flag_wait_either( "player_approaching_flare_moment", "player_looking_at_flare_moment" );
    wait 0.2;
    maps\_utility::radio_dialogue( "dcburn_cdn_movement" );
    wait 1;

    if ( !common_scripts\utility::flag( "fifth_floor_guys_damaged" ) )
        maps\_utility::radio_dialogue( "dcburn_mcy_watchsectors" );

    wait 3;

    if ( !common_scripts\utility::flag( "fifth_floor_guys_damaged" ) )
        maps\_utility::radio_dialogue( "dcburn_mcy_checkcorners" );

    common_scripts\utility::flag_wait( "player_approaching_crowsnest2" );
    maps\_utility::radio_dialogue( "dcburn_mcy_visoncrow" );
    maps\_utility::flavorbursts_off( "allies" );
    level.player maps\_utility::play_sound_on_entity( "dcburn_ar4_centcom" );
    maps\_utility::flavorbursts_on( "allies" );
    common_scripts\utility::flag_set( "macey_tells_you_to_move_to_crows" );
    wait 0.5;

    if ( !common_scripts\utility::flag( "player_shot_at_crowsnest_guys" ) )
    {
        thread maps\_utility::autosave_by_name( "crow_sneak" );
        maps\_utility::radio_dialogue( "dcburn_mcy_sby2engage" );
    }

    maps\_utility::flavorbursts_off( "allies" );
    maps\_utility::flavorbursts_on( "allies" );
}

_id_A999()
{
    thread _id_B79E();
    thread _id_B82D();
    thread _id_BACB();
    thread _id_BB25();
    thread _id_C459();
    common_scripts\utility::flag_wait( "start_crow_armor_sequence" );
    thread _id_CAB2();
}

_id_B79E()
{
    triggersenable( "colornodes_crowsnest", "script_noteworthy", 1 );
    var_0 = getent( "volume_crowsnest", "targetname" );
    common_scripts\utility::flag_wait( "player_approaching_crowsnest" );
    var_1 = maps\_utility::array_spawn( getentarray( "hostiles_crowsnest", "targetname" ), 1 );
    thread _id_AF4A();
    thread _id_B720( var_1, "crowsnest_has_been_cleared" );
    common_scripts\utility::array_thread( var_1, ::_id_B66D, "player_shot_at_crowsnest_guys" );
    common_scripts\utility::array_thread( var_1, ::_id_AC32 );
    common_scripts\utility::array_thread( level.squad, ::_id_B5CE );
    common_scripts\utility::flag_wait( "player_shot_at_crowsnest_guys" );
    thread _id_B820();
    var_2 = maps\_vehicle::spawn_vehicles_from_targetname( "tanks_crowsnest_wave1" );
    thread _id_C8E2( var_2 );
    common_scripts\utility::array_thread( var_2, ::_id_BDAD );
    common_scripts\utility::array_thread( level.squad, ::_id_C26B, "crowsnest_has_been_cleared" );
    common_scripts\utility::flag_wait( "crowsnest_has_been_cleared" );
    thread maps\_utility::flag_set_delayed( "obj_commerce_complete", 1 );
    var_3 = getent( "colornodes_crowsnest", "script_noteworthy" );
    var_3 notify( "trigger", level.player );
    thread _id_B983( "dummy_colornodes_crows1" );
    thread _id_B983( "dummy_colornodes_crows2" );
    common_scripts\utility::flag_wait( "latvee_spotlight_deleted" );
    common_scripts\utility::flag_wait( "obj_commerce_defend_snipe_given" );
    var_4 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "jets_crow_01" );
}

_id_B820()
{
    var_0 = getnode( "foley_crowsnest_radio", "script_noteworthy" );
    var_1 = common_scripts\utility::getstruct( "foley_anim_origin", "targetname" );
    level._id_AC03 setgoalnode( var_0 );
    level._id_AC03 waittill( "goal" );
    common_scripts\utility::flag_wait( "crowsnest_has_been_cleared" );
    var_1 thread maps\_anim::anim_single_solo( level._id_AC03, "h2_dc_burning_crowsnest_foley_enter" );
    level._id_AC03 maps\_anim::talk_for_time( 10.5 );
    wait 11.0;
    level._id_AC03 maps\_anim::talk_for_time( 5 );

    if ( !common_scripts\utility::flag( "player_is_on_turret" ) )
    {
        var_1 thread maps\_anim::anim_single_solo( level._id_AC03, "h2_dc_burning_crowsnest_foley_enter_instr" );
        level._id_AC03 maps\_anim::talk_for_time( 6 );
    }
    else
    {
        level._id_AC03 thread dialogue_execute( "dcburn_mcy_scanfortargets" );
        level._id_AC03 thread maps\_anim::talk_for_time( 6 );
    }

    common_scripts\utility::flag_set( "foley_is_done_talking" );
}

_id_B5CE()
{
    self endon( "death" );
    level endon( "player_shot_at_crowsnest_guys" );
    common_scripts\utility::flag_wait( "player_approaching_crowsnest_door" );
    var_0 = getent( "player_in_crowsnest_room", "targetname" );

    while ( !common_scripts\utility::flag( "player_shot_at_crowsnest_guys" ) )
    {
        wait 0.1;

        if ( !isdefined( self ) )
            return;

        if ( self istouching( var_0 ) )
            break;
    }

    thread _id_AB32();
    common_scripts\utility::flag_set( "player_shot_at_crowsnest_guys" );
}

_id_AB32()
{
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_2.ignoreme = 0;
    }
}

_id_C90D()
{
    var_0 = getent( "model_barrett", "targetname" );
    level._id_D0B4 = spawn( "script_origin", var_0.origin );
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "weapon_m82_MG_Setup_obj" );
    var_1.angles = var_0.angles;
    var_0.animname = "barrett";
    var_0 maps\_anim::setanimtree();
    var_1.animname = "barrett";
    var_1 maps\_anim::setanimtree();
    level._id_D0B4 maps\_anim::anim_first_frame_solo( var_0, "barrett_in" );
    level._id_D0B4 maps\_anim::anim_first_frame_solo( var_1, "barrett_in" );
    var_1 hide();
    return [ var_0, var_1 ];
}

_id_B82D()
{
    common_scripts\utility::flag_wait( "player_approaching_crowsnest2" );
    thread _id_AB3B();
    [ var_1, var_2 ] = _id_C90D();
    level._id_BFB9 = getentarray( "vehicles_crowsnest_defend", "targetname" );
    common_scripts\utility::array_thread( level._id_BFB9, ::_id_AC63 );
    thread _id_CCC7();
    level._id_B7B2 = maps\_utility::array_spawn( getentarray( "hostiles_ww2_barret", "targetname" ), 1 );
    common_scripts\utility::array_thread( level._id_B7B2, ::_id_D445 );
    common_scripts\utility::array_thread( level._id_B7B2, ::_id_B0BA );

    foreach ( var_4 in level._id_B7B2 )
    {
        if ( !isdefined( var_4.magic_bullet_shield ) || !var_4.magic_bullet_shield )
            var_4 maps\_utility::magic_bullet_shield();
    }

    common_scripts\utility::flag_wait( "crowsnest_has_been_cleared" );
    common_scripts\utility::array_thread( level._id_B7B2, maps\_utility::stop_magic_bullet_shield );
    common_scripts\utility::flag_wait( "obj_commerce_defend_snipe_given" );
    thread _id_B952();
    thread _id_B949( var_1, var_2 );
    thread _id_CB7E();
    common_scripts\utility::flag_wait_or_timeout( "player_is_on_turret", 5 );
    thread _id_C48F();
    common_scripts\utility::flag_wait( "only_2_sniper_enemies_remaining" );
    thread _id_AE97();
    common_scripts\utility::flag_clear( "can_talk" );
    maps\_utility::radio_dialogue( "dcburn_hqr_stayfrosty" );
    common_scripts\utility::flag_set( "can_talk" );
    common_scripts\utility::flag_wait( "obj_commerce_defend_snipe_complete" );
    thread _id_B7D1();
    thread maps\_utility::autosave_now( 1 );
    thread maps\_utility::flag_set_delayed( "obj_commerce_defend_crow_given", 3 );
    common_scripts\utility::array_thread( level.squad, ::_id_C26B, "perimeter_enemies_have_retreated" );
    maps\_utility::battlechatter_on( "allies" );
    thread _id_BA1D( "dummy_spawner_crowsnest_assault_guys_wave1" );
    thread _id_D253();
    thread _id_B10D();
    level._id_B680 = 0;
    triggersenable( "colornodes_crowsnest_surrounded", "script_noteworthy", 1 );
    var_6 = getent( "colornodes_crowsnest_surrounded", "script_noteworthy" );
    var_6 notify( "trigger", level.player );
    common_scripts\utility::flag_wait( "player_killed_enough" );
    common_scripts\utility::flag_set( "start_crow_armor_sequence" );
    common_scripts\utility::flag_set( "obj_commerce_defend_crow_complete" );
    thread maps\_utility::autosave_by_name( "defend_crow_complete" );
    killspawner( 12 );
    var_7 = getaiarray( "axis" );
    thread maps\_utility::ai_delete_when_out_of_sight( var_7, 512 );
    common_scripts\utility::array_thread( var_7, ::_id_D274 );
}

_id_AE97()
{
    level endon( "player_getting_on_minigun" );
    common_scripts\utility::flag_wait( "player_abandoning_crowsnest" );
    setdvar( "ui_deadquote", &"DCBURNING_MISSIONFAIL_CROWSNEST_SNIPE" );
    level notify( "mission failed" );
    maps\_utility::missionfailedwrapper();
}

_id_AF4A()
{
    level endon( "crowsnest_has_been_cleared" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "player_is_on_turret" ) )
        {
            level.player dodamage( 20 / level.player.damagemultiplier, level.player.origin );
            level.player playsound( "bullet_large_flesh_plr" );
        }

        wait(randomfloatrange( 2, 3 ));
    }
}

_id_B10D()
{
    wait 3;
    var_0 = 0;

    while ( common_scripts\utility::flag( "player_is_on_turret" ) )
    {
        level.player dodamage( 20 / level.player.damagemultiplier, level.player.origin );
        level.player playsound( "bullet_large_flesh_plr" );
        wait(randomfloatrange( 1, 2 ));
        var_0++;

        if ( var_0 > 3 )
            break;
    }

    if ( common_scripts\utility::flag( "player_is_on_turret" ) )
    {
        var_1 = common_scripts\utility::getstruct( "obj_commerce_defend_javelin", "targetname" );
        magicgrenade( "fraggrenade", var_1.origin + ( 0.0, 0.0, 144.0 ), var_1.origin + ( 0.0, 0.0, 32.0 ) );
    }
}

_id_D274()
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    self notify( "stop_seeking" );
    var_0 = common_scripts\utility::getstruct( "obj_commerce_sector_1d", "targetname" );
    self setgoalpos( var_0.origin );
}

_id_D18B()
{
    level endon( "player_killed_enough" );

    if ( !isalive( self ) )
        return;

    while ( isalive( self ) )
    {
        self waittill( "death", var_0 );

        if ( isdefined( var_0 ) && isplayer( var_0 ) )
        {
            level._id_B680++;

            if ( level._id_B680 > 3 )
            {
                common_scripts\utility::flag_set( "player_killed_enough" );
                continue;
            }

            break;
        }
    }
}

_id_CAE8()
{
    var_0 = [];
    var_0[0] = level._id_AC03;
    var_0[1] = level._id_C280;
    var_1 = getentarray( "friendlies_crowsnest_stage", "targetname" );
    var_0[0] thread _id_C7AB( var_1[0] );
    var_0[1] thread _id_C7AB( var_1[1] );
}

_id_C7AB( var_0 )
{
    self._id_C5D5 = [];
    var_1 = var_0 common_scripts\utility::get_linked_ents();
    var_2 = var_0 maps\_utility::get_linked_structs();
    common_scripts\utility::array_thread( var_2, ::_id_A92A, self );
    var_3 = 0;

    while ( !common_scripts\utility::flag( "only_1_javelin_enemies_remaining" ) )
    {
        wait 1;

        if ( common_scripts\utility::within_fov( level.player.origin, level.player.angles, var_0.origin + ( 0.0, 0.0, 32.0 ), level.cosine["90"] ) )
            continue;

        if ( common_scripts\utility::within_fov( level.player.origin, level.player.angles, self.origin + ( 0.0, 0.0, 32.0 ), level.cosine["90"] ) )
            continue;

        break;
    }

    _id_ADE0();

    if ( common_scripts\utility::flag( "only_1_javelin_enemies_remaining" ) )
        return;

    var_4 = undefined;
    self.reference = var_0;
    var_5 = "stinger";
    var_6 = "weapon_stinger";
    var_7 = "javelin_muzzle";

    if ( var_0.animation == "stinger_idle" )
    {
        var_4 = getent( "volume_stinger_safezone", "targetname" );
        _id_B86A();
    }
    else
    {
        var_4 = getent( "volume_javelin_safezone", "targetname" );
        var_3 = 1;
        self.animation = var_0.animation;
        _id_B609();
        var_5 = "javelin_dcburn";
        var_7 = "javelin_muzzle";
        var_6 = "weapon_javelin_sp";
    }

    self hide();
    self.reference maps\_anim::anim_generic_first_frame( self, self._id_AFA4 );
    self show();
    var_8 = undefined;
    var_9 = undefined;
    var_10 = undefined;
    self attach( var_6, "TAG_INHAND", 1 );
    var_11 = 8;
    self.ignoreme = 1;

    while ( !common_scripts\utility::flag( "only_1_javelin_enemies_remaining" ) )
    {
        var_11 = randomfloatrange( 6, 9 );
        self.reference thread maps\_anim::anim_generic_loop( self, self._id_C0B7, "stop_idle" );
        common_scripts\utility::waittill_notify_or_timeout( "new_target", var_11 );
        self.reference notify( "stop_idle" );
        self.reference thread maps\_anim::anim_generic( self, self._id_C67D );
        self waittillmatch( "single anim", "fire_weapon" );
        var_8 = _id_AACF( var_1 );

        if ( isdefined( var_8 ) && !level.player istouching( var_4 ) )
        {
            var_10 = self gettagorigin( "tag_inhand" );
            var_9 = magicbullet( var_5, var_10, var_8.origin );
            var_9 missile_settargetent( var_8 );

            if ( var_3 )
            {
                var_9 missile_setflightmodetop();
                playfxontag( common_scripts\utility::getfx( var_7 ), self, "TAG_FLASH" );
            }
        }

        self waittillmatch( "single anim", "end" );

        if ( common_scripts\utility::flag( "only_1_javelin_enemies_remaining" ) || common_scripts\utility::flag( "obj_commerce_defend_javelin_complete" ) )
            break;
    }

    self.ignoreme = 0;
    self notify( "stop_shooting_stingers_and_javs" );
    self notify( "stop_first_frame" );
    self.reference notify( "stop_idle" );
    maps\_utility::anim_stopanimscripted();
    self detach( var_6, "TAG_INHAND" );
    self.reference = undefined;
    self._id_C5D5 = undefined;
}

_id_BBE1( var_0 )
{
    if ( distance( var_0, level.player.origin ) > 64 )
        return 1;
    else
        return 0;
}

_id_AFF0()
{

}

_id_AACF( var_0 )
{
    if ( !isdefined( self._id_C5D5 ) )
        return var_0[randomint( var_0.size )];

    if ( self._id_C5D5.size == 0 )
        return var_0[randomint( var_0.size )];

    self._id_C5D5 = maps\_utility::remove_dead_from_array( self._id_C5D5 );

    if ( level._id_D1D5 > 0 && level._id_C8A5 && self._id_C5D5.size > 0 )
        return self._id_C5D5[0];
    else
        return var_0[randomint( var_0.size )];
}

_id_A92A( var_0 )
{
    level endon( "obj_commerce_defend_javelin_complete" );
    var_0 endon( "stop_shooting_stingers_and_javs" );
    self endon( "death" );

    while ( !common_scripts\utility::flag( "only_1_javelin_enemies_remaining" ) && isdefined( var_0._id_C5D5 ) )
    {
        self waittill( "trigger", var_1 );

        if ( !isdefined( var_1 ) )
            break;

        if ( !isdefined( var_0._id_C5D5 ) )
            break;

        var_0._id_C5D5 = common_scripts\utility::array_add( var_0._id_C5D5, var_1 );
        var_0 notify( "new_target" );
        wait 2;

        if ( isdefined( var_1 ) )
            var_0._id_C5D5 = common_scripts\utility::array_remove( var_0._id_C5D5, var_1 );

        if ( common_scripts\utility::flag( "only_1_javelin_enemies_remaining" ) || common_scripts\utility::flag( "obj_commerce_defend_javelin_complete" ) )
            break;
    }
}

_id_B952()
{
    var_0 = getnodearray( "crow_nodes_drone_fire", "targetname" );
    var_1 = getent( "hostiles_fodder_crowsnest", "targetname" );
    level._id_BB93 = var_1 maps\_utility::spawn_ai();
    var_2 = [];
    var_2[0] = level._id_AC03;
    var_2[1] = level._id_C280;

    foreach ( var_4 in var_2 )
    {
        var_4 maps\_utility::disable_ai_color();
        var_5 = common_scripts\utility::getfarthest( level.player.origin, var_0 );
        var_0 = common_scripts\utility::array_remove( var_0, var_5 );
        var_4.fixednode = 0;
        var_4.goalradius = 16;
        var_4 setgoalnode( var_5 );
    }

    common_scripts\utility::array_thread( var_2, ::_id_C519 );
}

_id_C519()
{
    self endon( "stop_shooting_at_drones" );

    for (;;)
    {
        wait(randomfloatrange( 3, 6 ));
        self.ignoreall = 1;
        wait(randomfloatrange( 3, 6 ));
        self.ignoreall = 0;
    }
}

_id_B7D1()
{
    if ( isdefined( level._id_BB93 ) )
        level._id_BB93 _id_BA48();

    var_0 = [];
    var_0[0] = level._id_AC03;
    var_0[1] = level._id_C280;
    common_scripts\utility::array_thread( var_0, ::_id_ADE0 );
}

_id_ADE0()
{
    self notify( "stop_shooting_at_drones" );
    wait 0.05;
    maps\_utility::enable_ai_color();
    self.fixednode = 1;
    self.ignoreall = 0;
}

_id_D253()
{
    level endon( "player_killed_enough" );

    while ( !common_scripts\utility::flag( "player_killed_enough" ) )
    {
        if ( common_scripts\utility::flag( "player_killed_enough" ) )
            break;

        level._id_C280 dialogue_execute( "dcburn_cpd_inperimeter" );
        wait(randomfloatrange( 8, 14 ));

        if ( common_scripts\utility::flag( "player_killed_enough" ) )
            break;

        level._id_C280 dialogue_execute( "dcburn_cpd_takingfire" );
        wait(randomfloatrange( 8, 14 ));

        if ( common_scripts\utility::flag( "player_killed_enough" ) )
            break;

        level._id_C280 dialogue_execute( "dcburn_cpd_hostatsix" );
        wait(randomfloatrange( 8, 14 ));
    }
}

_id_B66D( var_0 )
{
    self endon( "alerted" );
    thread _id_B84B();
    wait 0.5;
    common_scripts\utility::waittill_any( "damage", "death", "shot_at" );
    common_scripts\utility::flag_set( var_0 );

    if ( isdefined( self ) )
        thread _id_BE2F();
}

_id_B84B()
{
    var_0 = 262144;
    self endon( "death" );
    self endon( "alerted" );
    self addaieventlistener( "grenade danger" );
    self addaieventlistener( "gunshot" );
    self addaieventlistener( "silenced_shot" );
    self addaieventlistener( "bulletwhizby" );
    self addaieventlistener( "projectile_impact" );
    wait 0.5;

    while ( isalive( self ) )
    {
        self waittill( "ai_event", var_1 );

        if ( var_1 == "grenade danger" || var_1 == "damage" || var_1 == "projectile_impact" || var_1 == "explode" )
            break;

        if ( distancesquared( self.origin, level.player.origin ) > var_0 )
            continue;

        if ( var_1 == "grenade danger" || var_1 == "damage" || var_1 == "gunshot" || var_1 == "bulletwhizby" || var_1 == "projectile_impact" || var_1 == "explode" )
            break;
    }

    self notify( "shot_at" );
}

_id_AC32()
{
    self endon( "death" );
    self endon( "alerted" );
    common_scripts\utility::flag_wait_any( "player_entering_wall_hole", "player_shot_at_crowsnest_guys", "player_gawking_at_crowsnest_guys" );
    common_scripts\utility::flag_set( "player_shot_at_crowsnest_guys" );
    thread _id_BE2F();
}

_id_C48F()
{
    level endon( "obj_commerce_defend_snipe_complete" );
    var_0 = 4;

    if ( level.gameskill == 2 || level.gameskill == 3 )
        var_0 = 0.1;

    foreach ( var_2 in level._id_B7B2 )
    {
        if ( isalive( var_2 ) )
        {
            var_2._id_D107 = 1;
            wait(var_0);
        }
    }
}

_id_CB7E()
{
    var_0 = getent( "volume_crowsnest", "targetname" );
    level._id_CC7E = gettime();
    var_1 = 0;
    var_2 = 2;
    var_3 = 0;
    var_4 = 2;
    var_5 = 0;
    var_6 = 1;
    wait 0.5;

    while ( !common_scripts\utility::flag( "obj_commerce_defend_snipe_complete" ) )
    {
        if ( var_1 > var_2 )
            var_1 = 0;

        if ( var_3 > var_4 )
            var_3 = 0;

        if ( var_5 > var_6 )
            var_5 = 0;

        _id_C19B();
        common_scripts\utility::flag_wait( "can_start_crow_nags" );

        if ( common_scripts\utility::flag( "obj_commerce_defend_snipe_complete" ) )
            break;

        if ( !level.player istouching( var_0 ) && common_scripts\utility::flag( "can_talk" ) && !common_scripts\utility::flag( "player_is_on_turret" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            level._id_AC03 dialogue_execute( "stay_in_nest_nag_" + var_3 );
            var_3++;
            common_scripts\utility::flag_set( "can_talk" );
            continue;
        }

        if ( !common_scripts\utility::flag( "player_is_on_turret" ) && common_scripts\utility::flag( "can_talk" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            level._id_AC03 dialogue_execute( "barret_nag_" + var_1 );
            var_1++;
            common_scripts\utility::flag_set( "can_talk" );
            continue;
        }

        if ( !_id_BD17() && common_scripts\utility::flag( "can_talk" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            level._id_AC03 dialogue_execute( "barret_shoot_nag_" + var_5 );
            var_5++;
            common_scripts\utility::flag_set( "can_talk" );
        }
    }
}

_id_AB3B()
{
    var_0 = getent( "crowsnest_seaknight_01", "targetname" );
    var_1 = getent( "crowsnest_seaknight_02", "targetname" );
    var_0 notify( "spawn" );
    var_1 notify( "spawn" );
    common_scripts\utility::flag_wait( "player_in_crowsnest_room" );
    common_scripts\utility::flag_wait( "make_seaknights_take_off" );
    var_0 notify( "play_anim" );
    var_0 thread maps\_utility::play_sound_on_tag_endon_death( "scn_dcburning_crowsnest_heli_01" );
    wait 3;
    var_1 notify( "play_anim" );
    var_1 thread maps\_utility::play_sound_on_tag_endon_death( "scn_dcburning_crowsnest_heli_02" );
}

_id_CCC7()
{
    var_0 = undefined;
    var_1 = ( 1.0, 1.0, 0.0 );
    level._id_C897 = level._id_BFB9.size;
    var_2 = maps\_hud_util::createfontstring( "default", 1.5 );
    var_2 maps\_hud_util::setpoint( "TOP", undefined, -41, 30 );
    var_2.color = var_1;
    var_2.alpha = 0;
    common_scripts\utility::flag_wait( "obj_commerce_defend_snipe_given" );
    var_2 settext( &"DCBURNING_INFO_EVAC_SITE_HEALTH" );
    var_3 = maps\_hud_util::createfontstring( "default", 1.5 );
    var_3 maps\_hud_util::setpoint( "TOP", undefined, 45, 30 );
    var_3.color = var_1;
    var_3.alpha = 0;

    if ( getdvar( "dc_debug" ) == "1" )
    {
        var_3 fadeovertime( 1 );
        var_2 fadeovertime( 1 );
        var_2.alpha = 1;
        var_3.alpha = 1;
    }

    thread _id_AD08();

    while ( !common_scripts\utility::flag( "obj_commerce_defend_snipe_complete" ) )
    {
        var_0 = _id_CB46();

        if ( common_scripts\utility::flag( "obj_commerce_defend_snipe_complete" ) )
            break;

        level common_scripts\utility::waittill_either( "evac_vehicle_owned", "obj_commerce_defend_snipe_complete" );

        if ( common_scripts\utility::flag( "obj_commerce_defend_snipe_complete" ) )
            break;

        if ( level._id_BFB9.size < 2 )
            thread _id_B017();
    }

    var_2 fadeovertime( 1 );
    var_3 fadeovertime( 1 );
    var_2.alpha = 0;
    var_3.alpha = 0;
    var_2 maps\_hud_util::destroyelem();
    var_3 maps\_hud_util::destroyelem();
}

_id_AD08()
{
    var_0 = 0;
    common_scripts\utility::flag_wait( "can_start_crow_nags" );

    while ( !common_scripts\utility::flag( "obj_commerce_defend_snipe_complete" ) )
    {
        common_scripts\utility::flag_wait( "can_talk" );
        level waittill( "evac_vehicle_owned" );

        if ( level._id_BF3D == 100 )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            maps\_utility::radio_dialogue( "dcburn_evc_damage_fail" );
            common_scripts\utility::flag_set( "can_talk" );
            return;
        }
        else
        {
            if ( level._id_BF3D > 25 && level._id_BF3D < 50 && var_0 < 25 )
            {
                common_scripts\utility::flag_clear( "can_talk" );
                maps\_utility::radio_dialogue( "dcburn_evc_damage_00" );
                var_0 = 25;
                common_scripts\utility::flag_set( "can_talk" );
                continue;
            }

            if ( level._id_BF3D > 50 && level._id_BF3D < 75 && var_0 < 50 )
            {
                common_scripts\utility::flag_clear( "can_talk" );
                maps\_utility::radio_dialogue( "dcburn_evc_damage_01" );
                var_0 = 50;
                common_scripts\utility::flag_set( "can_talk" );
                continue;
            }

            if ( level._id_BF3D > 75 && level._id_BF3D < 90 && var_0 < 75 )
            {
                common_scripts\utility::flag_clear( "can_talk" );
                maps\_utility::radio_dialogue( "dcburn_evc_damage_02" );
                var_0 = 75;
                common_scripts\utility::flag_set( "can_talk" );
                continue;
            }

            if ( level._id_BF3D > 90 && level._id_BF3D < 100 && var_0 < 90 )
            {
                common_scripts\utility::flag_clear( "can_talk" );
                maps\_utility::radio_dialogue( "dcburn_evc_damage_03" );
                var_0 = 90;
                common_scripts\utility::flag_set( "can_talk" );
            }
        }
    }
}

_id_B017()
{
    level._id_BFB9 = maps\_utility::remove_dead_from_array( level._id_BFB9 );
}

_id_A8AE()
{
    setdvar( "ui_deadquote", &"DCBURNING_MISSIONFAIL_CROWSNEST_SNIPE" );
    level notify( "mission failed" );
    maps\_utility::missionfailedwrapper();
}

_id_CE95()
{
    setdvar( "ui_deadquote", &"DCBURNING_MISSIONFAIL_CROWSNEST_SNIPE" );
    level notify( "mission failed" );
    maps\_utility::missionfailedwrapper();
}

_id_CB46()
{
    var_0 = level._id_BFB9.size / level._id_C897 * 100;
    var_0 = maps\_utility::rounddecimalplaces( var_0, 0 );
    var_1 = 100 - var_0;
    level._id_BF3D = var_1;
    var_2 = maps\_utility::string( var_1 ) + " percent";
    return var_2;
}

_id_B949( var_0, var_1 )
{
    if ( !common_scripts\utility::flag( "player_get_on_turret" ) && !common_scripts\utility::flag( "only_2_sniper_enemies_remaining" ) )
    {
        var_0 hide();
        var_1 show();
        common_scripts\utility::flag_wait( "player_get_on_turret" );
        var_1 hide();
        var_0 show();
    }
}

_id_C459()
{
    common_scripts\utility::flag_wait( "crowsnest_has_been_cleared" );
    thread maps\_utility::autosave_by_name( "crowsnest_cleared" );
    wait 1;
    common_scripts\utility::flag_set( "make_seaknights_take_off" );
    soundscripts\_snd::snd_message( "start_crowsnest_dialog_mix" );
    common_scripts\utility::flag_wait( "foley_is_done_talking" );
    wait 2;
    common_scripts\utility::flag_set( "obj_commerce_defend_snipe_given" );

    if ( !common_scripts\utility::flag( "player_is_on_turret" ) )
        wait 4;

    maps\_utility::radio_dialogue( "dcburn_evc_glassedenemieswest" );
    common_scripts\utility::flag_set( "can_start_crow_nags" );
    soundscripts\_snd::snd_message( "stop_crowsnest_dialog_mix" );
}

_id_AC63()
{
    level endon( "obj_commerce_defend_snipe_complete" );
    self setcandamage( 1 );
    var_0 = self.origin;

    while ( isdefined( self ) )
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( !isdefined( var_5 ) )
            continue;

        if ( !isdefined( var_2 ) )
            continue;

        if ( isdefined( var_2.code_classname ) && var_2.code_classname == "misc_turret" )
            continue;

        if ( !isdefined( var_1 ) )
            continue;

        if ( isplayer( var_2 ) )
            continue;

        if ( isdefined( var_2.team ) && var_2.team != "axis" )
            continue;

        if ( var_5 == "MOD_PROJECTILE" && var_1 > 999 )
            break;

        if ( var_5 == "MOD_PROJECTILE_SPLASH" && var_1 >= 3000 )
            break;
    }

    if ( maps\_utility::is_in_array( level._id_BFB9, self ) )
        level._id_BFB9 = common_scripts\utility::array_remove( level._id_BFB9, self );

    if ( maps\_utility::is_in_array( level._id_CE89, self ) )
        level._id_CE89 = common_scripts\utility::array_remove( level._id_CE89, self );

    self.dead = 1;
    level notify( "evac_vehicle_owned" );
    var_6 = undefined;
    var_7 = "large_vehicle_explosion";
    var_8 = "exp_tanker_vehicle";

    if ( isdefined( self.script_linkto ) )
    {
        var_6 = getent( self.script_linkto, "script_linkname" );
        var_6 show();
        self delete();
    }
    else
    {
        switch ( self.model )
        {
            case "vehicle_laatpv":
                var_6 = "vehicle_laatpv_destroyed";
                var_8 = "exp_armor_vehicle";
                break;
            case "vehicle_bradley_static_low":
            case "vehicle_bradley_static":
                var_6 = "vehicle_bradley_destroyed";
                var_8 = "exp_armor_vehicle";
                break;
            case "vehicle_ch46e_low":
                var_6 = "vehicle_ch46e_crash_site_dcburning";
                var_8 = "exp_armor_vehicle";
                break;
            default:
        }

        self setmodel( var_6 );
    }

    playfx( common_scripts\utility::getfx( var_7 ), var_0 );
    thread common_scripts\utility::play_sound_in_space( var_8, var_0 );
}

_id_B674()
{
    self endon( "death" );
    self setcandamage( 1 );

    while ( isdefined( self ) )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !isdefined( var_4 ) )
            continue;

        if ( !isdefined( var_1 ) )
            continue;

        if ( !isdefined( var_0 ) )
            continue;

        if ( isplayer( var_1 ) )
            continue;

        if ( var_4 == "MOD_PROJECTILE" && var_0 > 999 )
            break;

        if ( var_4 == "MOD_PROJECTILE_SPLASH" && var_0 == 4000 )
            break;
    }

    var_5 = undefined;
    var_6 = "large_vehicle_explosion";
    var_7 = "exp_tanker_vehicle";
    var_8 = "tanker_fire";
    var_9 = 0;

    if ( isdefined( self.script_linkto ) )
    {
        var_5 = getent( self.script_linkto, "script_linkname" );
        var_5 show();
        self delete();
    }
    else
    {
        switch ( self.model )
        {
            case "vehicle_laatpv":
                var_5 = "vehicle_laatpv_destroyed";
                var_7 = "exp_armor_vehicle";
                var_8 = undefined;
                break;
            case "vehicle_bradley":
                var_5 = "vehicle_bradley";
                var_7 = "exp_armor_vehicle";
                var_8 = undefined;
                break;
            case "vehicle_m1a1_abrams":
                var_5 = "vehicle_m1a1_abrams_dmg";
                var_7 = "exp_armor_vehicle";
                var_8 = undefined;
                break;
            default:
        }

        self setmodel( var_5 );
    }

    playfx( common_scripts\utility::getfx( var_6 ), self.origin );
    thread common_scripts\utility::play_sound_in_space( var_7 );

    if ( isdefined( var_8 ) )
    {
        var_10 = spawn( "script_origin", self.origin + ( 0.0, 0.0, 0.0 ) );
        var_10.angles = self.angles;
        var_11 = spawnfx( common_scripts\utility::getfx( var_8 ), var_10.origin );
        triggerfx( var_11 );
        common_scripts\utility::flag_wait( "player_heli_19" );
        var_11 delete();
        var_10 delete();
    }
}

_id_CAB2()
{
    thread _id_B0A4();
    thread _id_ABDB();
    thread _id_BFE6();
    thread _id_D2CA();
    thread _id_AFD5();
    thread _id_BD65();
    thread _id_D243();
    common_scripts\utility::flag_wait( "crowsnest_sequence_finished" );
    thread _id_AAB9();
}

_id_ABDB()
{
    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_given" );
    wait 5;

    if ( common_scripts\utility::flag( "player_has_killed_at_least_one_javelin_target" ) )
        return;

    while ( !common_scripts\utility::flag( "player_has_killed_at_least_one_javelin_target" ) )
    {
        wait 20;

        if ( _id_D40B() )
            wait 10;

        if ( common_scripts\utility::flag( "player_has_killed_at_least_one_javelin_target" ) )
            return;

        if ( !_id_D40B() )
        {
            level.player thread maps\_utility::display_hint( "javelin_pickup" );
            continue;
        }

        if ( _id_D40B() && _id_ABB0() )
        {
            level.player thread maps\_utility::display_hint( "javelin_shoot" );
            continue;
        }

        level.player thread maps\_utility::display_hint( "javelin_switch" );
    }
}

_id_C816()
{
    if ( common_scripts\utility::flag( "player_has_killed_at_least_one_javelin_target" ) )
        return 1;

    if ( !_id_D40B() )
        return 1;

    if ( !_id_ABB0() )
        return 1;

    return _id_AC65::_id_BCBD();
}

_id_A8D2()
{
    if ( common_scripts\utility::flag( "player_has_killed_at_least_one_javelin_target" ) )
        return 1;

    return _id_ABB0();
}

_id_BB80()
{
    if ( common_scripts\utility::flag( "player_has_killed_at_least_one_javelin_target" ) )
        return 1;

    if ( _id_ABB0() )
        return 1;

    var_0 = level.player getweaponslistprimaries();
    var_1 = 0;
    return _id_D40B();
}

_id_D40B()
{
    var_0 = level.player getweaponslistall();

    if ( !isdefined( var_0 ) )
        return 0;

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( var_2, "javelin" ) )
            return 1;
    }

    return 0;
}

_id_ABB0()
{
    var_0 = level.player getcurrentweapon();

    if ( issubstr( var_0, "javelin" ) )
        return 1;
    else
        return 0;
}

_id_D2CA()
{
    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_given" );
    maps\_utility::music_stop();
    wait 0.1;
    thread maps\_utility::music_loop( "mus_dcburning_ordnance_and_run", 140 );
}

_id_BFE6()
{
    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_given" );
    thread _id_BFA6();
    wait 1;

    if ( level._id_C771.size < 5 )
    {
        var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "tanks_crowsnest_wave2" );
        common_scripts\utility::array_thread( var_0, ::_id_C45D );
    }
}

_id_BFA6()
{
    if ( level.gameskill > 1 )
        return;

    level.player enableinvulnerability();
    common_scripts\utility::flag_wait( "player_has_killed_at_least_one_javelin_target" );
    level.player disableinvulnerability();
}

_id_B0A4()
{
    common_scripts\utility::flag_wait( "start_crow_armor_sequence" );
    var_0 = getent( "barrett_trigger", "targetname" );
    var_0.origin += ( 0.0, 0.0, -20.0 );
    var_0 usetriggerrequirelookat();
    var_0 notify( "stop_hint_text" );
    level._id_D0F1 thread _id_CB38();
    var_1 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "helis_crowsnest" );
    var_2 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "helis_crowsnest_respawners" );
    common_scripts\utility::array_thread( var_1, ::_id_D593 );
    common_scripts\utility::array_thread( var_2, ::_id_D593 );
    thread _id_BB16();
    var_3 = getent( "perimeter_enemies", "targetname" );
    thread _id_C6EA( var_3, "perimeter_enemies_have_retreated" );
    wait 25;
    level._id_C8A5 = 1;
    common_scripts\utility::flag_wait( "only_2_javelin_enemies_remaining" );
    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_complete" );
    thread maps\_utility::autosave_now();
    common_scripts\utility::flag_set( "crowsnest_sequence_finished" );
    _id_CE3B();
}

_id_BB16()
{
    common_scripts\utility::flag_wait( "perimeter_enemies_have_retreated" );
    thread _id_B952();
    thread _id_CAE8();
}

_id_CE3B()
{
    if ( !_id_D40B() )
        return;

    var_0 = 0;
    var_1 = 0;
    var_2 = level.player getweaponslistprimaries();
    var_3 = 0;

    foreach ( var_5 in var_2 )
    {
        if ( issubstr( var_5, "avelin" ) )
        {
            var_1 = 1;

            if ( issubstr( level.player getcurrentweapon(), "avelin" ) )
            {
                var_3 = 1;
                level.player disableweapons();
                wait 1.5;
            }

            level.player takeweapon( var_5 );
            continue;
        }

        if ( var_5 == "m4m203_eotech" )
            var_0 = 1;
    }

    if ( !var_1 )
        return;

    level.player enableweapons();

    if ( !var_0 )
        level.player giveweapon( "m4m203_eotech" );

    if ( var_3 )
        level.player switchtoweapon( "m4m203_eotech" );
}

_id_BD65()
{
    common_scripts\utility::flag_wait( "start_crow_armor_sequence" );
    maps\_utility::radio_dialogue( "dcburn_hqr_clearout" );
    level._id_AC03 dialogue_execute( "dcburn_mcy_negative" );
    common_scripts\utility::flag_set( "obj_commerce_defend_javelin_given" );
    level._id_AC03 dialogue_execute( "dcburn_mcy_useordnance" );
    thread _id_C27B();
    thread _id_BE24();
}

_id_B211( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "h2_weapon_javelin_base_obj" );
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    var_1 show();

    for (;;)
    {
        if ( _id_D40B() )
            break;

        wait 0.1;
    }

    common_scripts\utility::flag_set( "player_has_javelin" );
    var_1 delete();
}

_id_C27B()
{
    var_0 = getent( "volume_crowsnest", "targetname" );
    level._id_CC7E = gettime();
    var_1 = 0;
    var_2 = 3;
    var_3 = 0;
    var_4 = 2;
    var_5 = 0;
    var_6 = 2;
    wait 0.5;

    while ( !common_scripts\utility::flag( "obj_commerce_defend_javelin_complete" ) )
    {
        if ( var_1 > var_2 )
            var_1 = 0;

        if ( var_3 > var_4 )
            var_3 = 0;

        if ( var_5 > var_6 )
            var_5 = 0;

        _id_C19B();

        if ( common_scripts\utility::flag( "obj_commerce_defend_javelin_complete" ) )
            break;

        if ( !level.player istouching( var_0 ) && common_scripts\utility::flag( "can_talk" ) && !common_scripts\utility::flag( "player_is_on_turret" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            level._id_AC03 dialogue_execute( "stay_in_nest_nag_" + var_3 );
            var_3++;
            common_scripts\utility::flag_set( "can_talk" );
            continue;
        }

        if ( !level.player maps\_utility::player_using_missile() && common_scripts\utility::flag( "can_talk" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            level._id_AC03 dialogue_execute( "rocket_nag_" + var_1 );
            var_1++;
            common_scripts\utility::flag_set( "can_talk" );
            continue;
        }

        if ( !_id_BD17() && common_scripts\utility::flag( "can_talk" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            level._id_AC03 dialogue_execute( "rocket_shoot_nag_" + var_5 );
            var_5++;
            common_scripts\utility::flag_set( "can_talk" );
        }
    }
}

_id_CB38()
{
    level._id_BF3D = 0;
    level endon( "mission failed" );
    level endon( "missionfailed" );
    self setcandamage( 1 );
    self._id_B8FD = undefined;

    switch ( level.gameskill )
    {
        case 0:
            self._id_B8FD = 5000;
            break;
        case 1:
            self._id_B8FD = 5000;
            break;
        case 2:
            self._id_B8FD = 5000;
            break;
        case 3:
            self._id_B8FD = 5000;
            break;
    }

    self._id_AAC8 = self._id_B8FD;
    common_scripts\utility::flag_set( "monument_dummy_target_setup" );

    while ( !common_scripts\utility::flag( "obj_commerce_defend_javelin_complete" ) )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !isdefined( var_0 ) )
            continue;

        if ( isplayer( var_1 ) )
            continue;

        if ( isdefined( var_1.team ) && var_1.team != "axis" )
            continue;

        if ( !isdefined( var_4 ) )
            continue;

        if ( var_4 == "MOD_PROJECTILE" )
        {
            _id_AF6C( 100 );

            if ( self._id_B8FD < 1 )
                break;
        }

        if ( var_4 == "MOD_PROJECTILE_SPLASH" )
        {
            _id_AF6C( 50 );

            if ( self._id_B8FD < 1 )
                break;
        }
    }

    if ( !common_scripts\utility::flag( "obj_commerce_defend_javelin_complete" ) )
        thread _id_CE95();
}

_id_AF6C( var_0 )
{
    self._id_B8FD -= var_0;
    var_1 = self._id_B8FD / self._id_AAC8 * 100;
    var_1 = maps\_utility::rounddecimalplaces( var_1, 0 );
    var_2 = 100 - var_1;
    level._id_BF3D = var_2;
    level notify( "monument_dummy_hit" );

    if ( getdvar( "dc_debug" ) == "1" )
        return;
}

_id_BE24()
{
    common_scripts\utility::flag_wait( "monument_dummy_target_setup" );
    var_0 = 0;
    var_1 = level._id_D0F1._id_B8FD;

    while ( !common_scripts\utility::flag( "obj_commerce_defend_javelin_complete" ) )
    {
        common_scripts\utility::flag_wait( "can_talk" );
        level waittill( "monument_dummy_hit" );

        if ( level._id_BF3D == 100 )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            maps\_utility::radio_dialogue( "dcburn_evc_damage_fail" );
            common_scripts\utility::flag_set( "can_talk" );
            return;
        }
        else
        {
            if ( level._id_BF3D > 25 && level._id_BF3D < 50 && var_0 < 25 )
            {
                common_scripts\utility::flag_clear( "can_talk" );
                maps\_utility::radio_dialogue( "dcburn_evc_damage_00" );
                var_0 = 25;
                common_scripts\utility::flag_set( "can_talk" );
                continue;
            }

            if ( level._id_BF3D > 50 && level._id_BF3D < 75 && var_0 < 50 )
            {
                common_scripts\utility::flag_clear( "can_talk" );
                maps\_utility::radio_dialogue( "dcburn_evc_damage_01" );
                var_0 = 50;
                common_scripts\utility::flag_set( "can_talk" );
                continue;
            }

            if ( level._id_BF3D > 75 && level._id_BF3D < 90 && var_0 < 75 )
            {
                common_scripts\utility::flag_clear( "can_talk" );
                maps\_utility::radio_dialogue( "dcburn_evc_damage_02" );
                var_0 = 75;
                common_scripts\utility::flag_set( "can_talk" );
                continue;
            }

            if ( level._id_BF3D > 90 && level._id_BF3D < 100 && var_0 < 90 )
            {
                common_scripts\utility::flag_clear( "can_talk" );
                maps\_utility::radio_dialogue( "dcburn_evc_damage_03" );
                var_0 = 90;
                common_scripts\utility::flag_set( "can_talk" );
            }
        }
    }
}

_id_C8E2( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        wait 5;
        thread maps\_vehicle::gopath( var_2 );
    }
}

_id_D593()
{
    self endon( "death" );
    thread _id_D17F();
    thread _id_C5EF();
    var_0 = maps\_vehicle::vehicle_get_path_array();
    common_scripts\utility::array_thread( var_0, ::_id_AAE1, self );
}

_id_D17F()
{
    if ( isdefined( self.script_noteworthy ) && issubstr( self.script_noteworthy, "crow_heli_respawner_" ) )
    {
        var_0 = self.script_noteworthy;
        self waittill( "death" );
        wait 1;
        var_1 = getentarray( var_0, "script_noteworthy" );

        foreach ( var_3 in var_1 )
        {
            if ( !isdefined( var_3.vehicle_spawner ) )
            {
                if ( !common_scripts\utility::flag( "obj_commerce_defend_javelin_complete" ) )
                {
                    var_4 = maps\_vehicle::vehicle_spawn( var_3 );
                    thread maps\_vehicle::gopath( var_4 );
                    var_4 thread _id_D593();
                    break;
                }
            }
        }
    }
}

_id_AAE1( var_0 )
{
    var_0 endon( "death" );

    if ( !isdefined( self.script_noteworthy ) )
        return;

    var_1 = undefined;
    var_2 = undefined;

    switch ( self.script_noteworthy )
    {
        case "target_nothing":
            var_1 = undefined;
            break;
        case "target_evac":
            var_1 = getent( "monument_target", "targetname" );
            var_2 = var_1;
            break;
        case "target_crowsnest":
            var_1 = getent( "javelin_source_org", "targetname" );
            var_2 = level.player;
            break;
        default:
            return;
    }

    while ( isdefined( var_0 ) )
    {
        self waittill( "trigger" );

        if ( !isdefined( var_1 ) )
            var_0 clearlookatent();
        else
            var_0 setlookatent( var_1 );

        if ( isdefined( var_2 ) )
        {
            var_0 thread _id_B59B( var_2 );
            continue;
        }

        var_0 notify( "stop_firing_turret" );
    }
}

_id_BDAD()
{
    self endon( "death" );
    maps\_utility::ent_flag_init( "start_firing" );
    maps\_utility::ent_flag_wait( "start_firing" );
    thread _id_B220();
    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_given" );
    thread _id_C5EF();
}

_id_C45D()
{
    self endon( "death" );
    maps\_utility::ent_flag_init( "start_firing" );
    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_given" );
    thread _id_C5EF();
    maps\_utility::ent_flag_wait( "start_firing" );
    thread _id_B220();
}

_id_B220()
{
    self endon( "death" );
    maps\_vehicle::vehicle_turret_scan_off();
    thread _id_C882( level._id_D0F1 );

    while ( isdefined( self ) )
    {
        self setturrettargetent( level._id_D0F1 );
        wait(randomfloatrange( 3, 6 ));
        self fireweapon();
    }
}

_id_AAB9()
{
    thread _id_D3C4();
    thread _id_CFB3();
    common_scripts\utility::flag_wait( "player_approaching_outer_balcony" );
    thread _id_C442();
}

_id_CD7D()
{
    common_scripts\utility::flag_wait( "roof_door_kicked" );
    var_0 = getent( "door_to_roof_swing", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_1 linkto( var_0 );
    var_0._id_BCA9 = self.origin;
    var_0._id_AC23 = self.angles;
    var_0 rotateyaw( -170, 0.5 );
    var_0 moveto( var_0.origin + ( 11.0, 0.0, 0.0 ), 0.1 );
    var_1 connectpaths();
}

_id_A821()
{
    self endon( "death" );
    thread _id_C35C();
    self.neverenablecqb = 1;
    self.goalradius = 16;
    self.baseaccuracy = 1000;
    self.attackeraccuracy = 0;
    common_scripts\utility::flag_wait( "player_roof_stairs_00" );
    self.health = 1;
    self.baseaccuracy = 0.01;
    self.attackeraccuracy = 10;
    thread maps\_utility::stop_magic_bullet_shield();
}

_id_D243()
{
    common_scripts\utility::flag_wait( "spawn_door_allies" );
    var_0 = getent( "trigger_volume_breach_stairwell", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    var_1 = getent( "volume_breach_stairwell", "targetname" );
    thread _id_D08C( var_1 );
    var_2 = maps\_utility::array_spawn( getentarray( "crowsnest_breachers", "targetname" ) );
    var_3 = maps\_utility::array_spawn( getentarray( "friendlies_breach_defend", "targetname" ) );
    common_scripts\utility::array_thread( var_3, ::_id_A821 );
    var_4 = "shotgunhinges_breach_left";
    var_1 thread maps\_breach::breach_think( var_2, var_4 );

    foreach ( var_6 in var_2 )
    {
        var_6._id_B9F9 = getnode( var_6.target, "targetname" );
        var_6 thread _id_BCCC();
    }

    common_scripts\utility::flag_wait( "crowsnest_sequence_finished" );
    triggersenable( "colornodes_start_to_roof", "script_noteworthy", 1 );
    var_8 = getent( "colornodes_start_to_roof", "script_noteworthy" );
    var_8 notify( "trigger", level.player );
    level.squad = maps\_utility::remove_dead_from_array( level.squad );
    thread _id_CD7D();
    var_0 common_scripts\utility::trigger_on();
    maps\_utility::delaythread( 3, ::_id_BA1D, "dummy_spawner_roof_wave_01" );
    common_scripts\utility::flag_wait( "obj_rooftop_given" );

    if ( isdefined( level._id_C771 ) && level._id_C771.size > 0 )
        common_scripts\utility::array_thread( level._id_C771, ::_id_B50D );

    var_9 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_9, maps\_utility::cqb_walk, "off" );

    foreach ( var_6 in var_9 )
        var_6.neverenablecqb = 1;

    common_scripts\utility::flag_wait( "roof_breach_complete" );

    foreach ( var_6 in var_2 )
    {
        var_6 setgoalnode( var_6._id_B9F9 );
        var_6.goalradius = 64;
    }

    triggersenable( "colornodes_to_roof", "script_noteworthy", 1 );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );

    foreach ( var_6 in level.squad )
    {
        if ( !isalive( var_6 ) )
            continue;

        var_6.a.disablepain = 1;
        var_6.ignoresuppression = 1;
        var_6.disabledamageshieldpain = 1;
        var_6.grenadeawareness = 0;
        var_6.goalradius = 32;

        if ( var_6 == level._id_AC03 || var_6 == level._id_C280 )
        {
            self.attackeraccuracy = 0.01;
            self.baseaccuracy = 1000;
        }
    }

    wait 2;
    common_scripts\utility::array_thread( var_2, ::_id_B96B );

    foreach ( var_6 in var_2 )
        var_6 thread _id_A8CE();

    _id_BA1D( "dummy_spawner_roof_wave_02" );

    if ( !common_scripts\utility::flag( "player_roof_stairs_00" ) )
        thread _id_B983( "dummy_colornodes_to_roof" );

    common_scripts\utility::flag_wait( "player_roof_stairs_01" );

    if ( isdefined( level._id_B7B2 ) && level._id_B7B2.size > 0 )
        common_scripts\utility::array_thread( level._id_B7B2, ::_id_BA48 );

    thread _id_BBAF( "hostiles_drones_comm_south" );
    thread _id_AE1F();
    thread _id_B933( "all", 1024, 1 );
    common_scripts\utility::flag_wait( "player_roof_stairs_02" );
    var_18 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "jets_tenches_01" );
    var_19 = getnode( "node_roof_leader", "targetname" );
    var_20 = getnode( "node_roof_friendly02", "targetname" );
    level._id_AC03 thread _id_BDE1( var_19 );
    level._id_C280 thread _id_BDE1( var_20 );
    common_scripts\utility::flag_wait( "player_top_floor_commerce" );
    level._id_C591 = getdvarfloat( "ai_pathNegotiationOverlapCost" );
    setsaveddvar( "ai_pathNegotiationOverlapCost", 5000 );
    var_21 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "jets_tenches_02" );
    common_scripts\utility::flag_wait( "player_outer_balcony_top_commerce" );
    var_22 = maps\_vehicle::spawn_vehicle_from_targetname( "heli_deck2" );
    thread maps\_vehicle::gopath( var_22 );
    var_22 thread _id_D48B();
    var_22 thread _id_BB35();
    common_scripts\utility::flag_wait( "player_at_commerce_rooftop" );
    setsaveddvar( "ai_pathNegotiationOverlapCost", level._id_C591 );

    if ( isdefined( var_22 ) )
        var_22 delete();

    common_scripts\utility::flag_set( "obj_rooftop_complete" );
    thread maps\_utility::autosave_by_name( "rooftop" );
}

_id_D48B()
{
    self endon( "death" );
    self setlookatent( level.player );
    common_scripts\utility::flag_wait( "balcony_heli_raised_up" );
    self clearlookatent();
    common_scripts\utility::flag_wait( "player_at_commerce_rooftop" );

    if ( isdefined( self ) )
        self delete();
}

_id_BB35()
{
    var_0 = 2200;
    var_1 = 600;
    var_2 = 0.03;
    var_3 = 0.25;
    var_4 = 0.05;
    var_5 = 0.4;
    var_6 = 0.04;
    var_7 = 0.4;
    var_8 = 0.5;
    var_9 = var_3 - var_2;
    var_10 = var_5 - var_4;
    var_11 = var_7 - var_6;
    wait 0.8;

    while ( isdefined( self ) )
    {
        var_12 = distance( level.player.origin, self.origin );

        if ( var_12 < var_1 )
            var_13 = 1;
        else if ( var_12 > var_0 )
            var_13 = 0;
        else
            var_13 = ( var_12 - var_0 ) / ( var_1 - var_0 );

        var_9 = var_2 + var_9 * var_13;
        var_10 = var_4 + var_10 * var_13;
        var_11 = var_6 + var_11 * var_13;
        screenshake( level.player.origin, var_9, var_10, var_11, var_8, 0, 0, 0, 9, 11, 10 );
        wait 0.1;
    }
}

_id_B50D()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_roof_stairs_01" );

    if ( isdefined( self ) )
        _id_AEA1();
}

_id_B96B()
{
    self endon( "death" );
    self.neverenablecqb = 1;
    self.health = 1;
    self.goalradius = 32;
    self.baseaccuracy = 0.01;
}

_id_B983( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = getent( var_1.script_linkto, "script_linkname" );

    if ( isdefined( var_2 ) )
        var_2 notify( "trigger", level.player );
}

_id_D08C( var_0 )
{
    var_0 waittill( "breach_complete" );
    common_scripts\utility::flag_set( "roof_breach_complete" );
}

_id_D3C4()
{
    common_scripts\utility::flag_wait( "crowsnest_sequence_finished" );
    maps\_utility::radio_dialogue( "dcburn_hqr_roofasap" );
    common_scripts\utility::flag_set( "obj_rooftop_given" );
    level._id_AC03 dialogue_execute( "dcburn_mcy_rooftop" );
    thread _id_CF3A( 90 );
    maps\_utility::radio_dialogue( "dcburn_hqr_urgentsurgicals" );

    while ( !common_scripts\utility::flag( "roof_breach_complete" ) )
    {
        level._id_AC03 dialogue_execute( "dcburn_mcy_rvwithseals" );
        wait(randomfloatrange( 8, 12 ));

        if ( common_scripts\utility::flag( "roof_breach_complete" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_crawlin" );
        wait(randomfloatrange( 8, 12 ));

        if ( common_scripts\utility::flag( "roof_breach_complete" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_letsmoveout" );
        wait(randomfloatrange( 8, 12 ));

        if ( common_scripts\utility::flag( "roof_breach_complete" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_gettoroofnow" );
        wait(randomfloatrange( 8, 12 ));

        if ( common_scripts\utility::flag( "roof_breach_complete" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_overrunningpos" );
        wait(randomfloatrange( 8, 12 ));

        if ( common_scripts\utility::flag( "roof_breach_complete" ) )
            break;
    }

    maps\_utility::radio_dialogue( "dcburn_ar5_triplea" );
    maps\_utility::radio_dialogue( "dcburn_ar2_backinseats" );

    while ( !common_scripts\utility::flag( "player_roof_stairs_00" ) )
    {
        level._id_AC03 dialogue_execute( "dcburn_mcy_outnumbered" );
        wait(randomfloatrange( 8, 12 ));

        if ( common_scripts\utility::flag( "player_roof_stairs_00" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_upthestairsgo" );
        wait(randomfloatrange( 8, 12 ));

        if ( common_scripts\utility::flag( "player_roof_stairs_00" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_waitallday" );
        wait(randomfloatrange( 8, 12 ));

        if ( common_scripts\utility::flag( "player_roof_stairs_00" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_gettingoverrun" );
    }

    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", "1" );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", "-21956 1185 -235" );
    wait 2;
    level._id_AC03 dialogue_execute( "dcburn_mcy_outoftimego" );
    wait 2;
    level._id_C280 dialogue_execute( "dcburn_cpd_closingin" );
    common_scripts\utility::flag_wait( "player_roof_stairs_02" );
    level._id_AC03 dialogue_execute( "dcburn_mcy_lobby_move_nag_00" );
    maps\_utility::flavorbursts_off( "allies" );
    level.player maps\_utility::play_sound_on_entity( "dcburn_ar3_gottatouchdown" );
    maps\_utility::flavorbursts_on( "allies" );
    common_scripts\utility::flag_wait( "player_outer_balcony_top_commerce" );

    while ( !common_scripts\utility::flag( "player_headed_to_roof" ) )
    {
        level._id_AC03 dialogue_execute( "dcburn_mcy_lobby_move_nag_02" );
        wait 2;
        level._id_AC03 dialogue_execute( "dcburn_mcy_notime" );

        if ( common_scripts\utility::flag( "player_headed_to_roof" ) )
            break;

        wait 2;

        if ( common_scripts\utility::flag( "player_headed_to_roof" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_keepmoving" );
        wait 2;
    }

    common_scripts\utility::flag_wait( "player_headed_to_roof" );
    maps\_utility::radio_dialogue( "dcburn_bhp_whatsyourstatus" );
    level._id_AC03 dialogue_execute( "dcburn_mcy_hostilesclose" );

    while ( !common_scripts\utility::flag( "player_at_commerce_rooftop" ) )
    {
        wait 1;

        if ( common_scripts\utility::flag( "player_at_commerce_rooftop" ) )
            break;

        wait 1;

        if ( common_scripts\utility::flag( "player_at_commerce_rooftop" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_overrun" );
        wait 1;

        if ( common_scripts\utility::flag( "player_at_commerce_rooftop" ) )
            break;

        wait 1;

        if ( common_scripts\utility::flag( "player_at_commerce_rooftop" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_lobby_move_nag_00" );
        wait 1;

        if ( common_scripts\utility::flag( "player_at_commerce_rooftop" ) )
            break;

        wait 1;

        if ( common_scripts\utility::flag( "player_at_commerce_rooftop" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_outoftimego" );
        wait 1;

        if ( common_scripts\utility::flag( "player_at_commerce_rooftop" ) )
            break;

        wait 1;

        if ( common_scripts\utility::flag( "player_at_commerce_rooftop" ) )
            break;

        level._id_AC03 dialogue_execute( "dcburn_mcy_outnumbered" );
    }

    common_scripts\utility::flag_set( "rooftop_run_dialogue_finished" );
}

_id_C442()
{
    thread _id_C995();
    thread _id_D41E();
    thread _id_C93E();
    thread _id_CD70();
    thread _id_CA19();
    thread _id_B214();
    thread _id_BB50();
    thread _id_D196();
    thread enter_smoke_column();
    common_scripts\utility::flag_wait( "player_heli_18" );
    _id_D2B3();
}

_id_C93E()
{
    common_scripts\utility::flag_wait( "roof_heli_about_to_be_owned" );
    common_scripts\utility::flag_wait_or_timeout( "roof_heli_owned", 1.65 );
    maps\_utility::musicplaywrapper( "mus_dcburning_heli_ride3" );
}

_id_D41E()
{
    common_scripts\utility::flag_wait( "player_at_commerce_rooftop" );
    common_scripts\utility::flag_wait( "blackhawk_landed" );
    common_scripts\utility::flag_set( "obj_heli_mount_given" );
    thread _id_D07B();
    common_scripts\utility::flag_wait( "player_getting_on_minigun" );
    setsaveddvar( "actionSlotsHide", "1" );
    level.player setactionslot( 1, "" );
    level.player nightvisiongogglesforceoff();

    while ( !common_scripts\utility::flag( "can_talk" ) )
        wait 0.5;

    maps\_utility::radio_dialogue( "dcburn_mcy_bunkerevac" );
    maps\_utility::radio_dialogue( "dcburn_hqr_stillpinned" );
    maps\_utility::radio_dialogue( "dcburn_mcy_fromtheair" );
    common_scripts\utility::flag_set( "obj_heli_ride_given" );
    thread maps\_utility::autosave_now( 1 );
    maps\_utility::radio_dialogue( "dcburn_hqr_firstwave" );
    common_scripts\utility::flag_wait( "player_heli_05" );
    maps\_utility::radio_dialogue_overlap( "dcburn_lbp1_breakleftbreakleft" );
    common_scripts\utility::flag_wait( "player_heli_07" );
    maps\_utility::radio_dialogue( "dcburn_mcy_hitgoingdown" );
    common_scripts\utility::flag_wait( "player_heli_09" );
    wait 1;
    maps\_utility::radio_dialogue( "dcburn_bhp_dontgetup" );
    maps\_utility::radio_dialogue( "dcburn_hqr_fallbacknow" );
    common_scripts\utility::flag_set( "player_has_used_minigun" );

    if ( !common_scripts\utility::flag( "player_has_used_minigun" ) )
        maps\_utility::radio_dialogue( "dcburn_mcy_spinherup" );

    common_scripts\utility::flag_wait( "player_heli_10c" );
    maps\_utility::radio_dialogue( "dcburn_lbp1_gunshipliftingoff" );
    maps\_utility::radio_dialogue( "dcburn_ar2_leavebehind" );
    common_scripts\utility::flag_wait( "player_heli_14" );
    maps\_utility::radio_dialogue( "dcburn_evc_mainroad" );
    maps\_utility::radio_dialogue( "dcburn_hqr_orderirene" );
    maps\_utility::radio_dialogue( "dcburn_ar1_weareleaving" );
    maps\_utility::radio_dialogue( "dcburn_ar4_wearegoingdown" );
}

_id_D07B()
{
    common_scripts\utility::flag_wait( "rooftop_run_dialogue_finished" );
    common_scripts\utility::flag_set( "can_talk" );

    while ( !common_scripts\utility::flag( "player_getting_on_minigun" ) )
    {
        common_scripts\utility::flag_clear( "can_talk" );
        level._id_AC03 dialogue_execute( "dcburn_mcy_moveminigun" );
        common_scripts\utility::flag_set( "can_talk" );

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        wait 30;

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        common_scripts\utility::flag_clear( "can_talk" );
        level._id_AC03 dialogue_execute( "dcburn_mcy_getonminigun" );
        common_scripts\utility::flag_set( "can_talk" );

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        wait 30;

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        common_scripts\utility::flag_clear( "can_talk" );
        level._id_AC03 dialogue_execute( "dcburn_mcy_getinchopper" );
        common_scripts\utility::flag_set( "can_talk" );

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        wait 30;

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        common_scripts\utility::flag_clear( "can_talk" );
        level._id_AC03 dialogue_execute( "dcburn_mcy_wayoutnumbered" );
        common_scripts\utility::flag_set( "can_talk" );

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        wait 30;

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        common_scripts\utility::flag_clear( "can_talk" );
        level._id_AC03 dialogue_execute( "dcburn_mcy_forgetaboutit" );
        common_scripts\utility::flag_set( "can_talk" );

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        wait 30;

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        common_scripts\utility::flag_clear( "can_talk" );
        level._id_AC03 dialogue_execute( "dcburn_mcy_brassontitanic" );
        common_scripts\utility::flag_set( "can_talk" );

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;

        wait 30;

        if ( common_scripts\utility::flag( "player_getting_on_minigun" ) )
            break;
    }
}

_id_C26B( var_0 )
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    self.old_baseaccuracy = self.baseaccuracy;
    self.baseaccuracy = 1000;
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self ) )
        self.baseaccuracy = self.old_baseaccuracy;
}

_id_CCE3()
{
    self endon( "death" );
    thread _id_C35C();
    self.neverenablecqb = 1;
    self.goalradius = 16;
    self.baseaccuracy = 1000;
    self.attackeraccuracy = 0;
    common_scripts\utility::flag_wait( "player_getting_on_minigun" );
    self.health = 1;
    self.baseaccuracy = 0.01;
    self.attackeraccuracy = 10;
    thread maps\_utility::stop_magic_bullet_shield();
}

_id_CA19()
{
    common_scripts\utility::flag_wait( "player_headed_to_roof" );
    level._id_B094 = [];
    var_0 = getent( "rooftop_helirider", "targetname" );
    var_1 = var_0 maps\_utility::spawn_ai();

    if ( isdefined( var_1 ) )
        var_1 thread _id_B2FF();

    var_0 = getent( "rooftop_defender", "targetname" );
    var_2 = var_0 maps\_utility::spawn_ai();

    if ( isdefined( var_2 ) )
        var_2 thread _id_CCE3();

    var_3 = getent( "turret2", "targetname" );

    if ( isdefined( var_3 ) )
        var_3 delete();

    triggersenable( "colornodes_roof", "script_noteworthy", 1 );
    var_4 = getentarray( "allied_drones_heliride_01", "targetname" );
    var_5 = getentarray( "allied_drones_heliride_02", "targetname" );
    var_6 = getentarray( "allied_drones_heliride_03", "targetname" );
    var_6 = getentarray( "allied_drones_heliride_04", "targetname" );
    thread _id_CBDC( var_4, "allied_drones_heliride_01" );
    thread _id_CBDC( var_5, "allied_drones_heliride_02" );
    thread _id_CBDC( var_6, "allied_drones_heliride_03" );
    thread _id_CBDC( var_6, "allied_drones_heliride_04" );
    _id_BFA3();
    level._id_CED1 vehicle_setspeed( 5, 20 );
    var_7 = getent( "heli_roof_approach_01_end", "targetname" );
    level._id_CED1 setlookatent( var_7 );
    level._id_CED1.rooftop_helirider = var_1;
    common_scripts\utility::flag_wait( "roof_littlebird_lifted_off" );
    thread heliblackhawk_deathvolume();
    level._id_CED1 clearlookatent();
    var_8 = getent( "heli_roof_approach_01", "targetname" );
    level._id_CED1 thread maps\_vehicle::vehicle_paths( var_8 );
    level._id_CED1 vehicle_setspeed( 100 );
    level._id_CED1 thread _id_A9A2( getent( "heli_roof_land_01", "script_noteworthy" ) );
    level._id_CED1 waittill( "landed" );
    common_scripts\utility::flag_set( "blackhawk_landed" );
    var_9 = level._id_CED1 gettagorigin( "tag_player" );
    var_10 = 160;
    var_11 = 100;
    var_12 = 0;
    var_13 = spawn( "trigger_radius", var_9, var_12, var_10, var_11 );
    thread _id_AD5E( var_13 );
    var_9 = level._id_CED1 gettagorigin( "tag_player" );
    var_10 = 40;
    var_11 = 100;
    var_12 = 0;
    level._id_CED1.trigger = spawn( "trigger_radius", var_9, var_12, var_10, var_11 );
    var_14 = level._id_CED1 gettagorigin( "TAG_ORIGIN" );

    for (;;)
    {
        level._id_CED1.trigger waittill( "trigger" );

        if ( common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), var_14, level.cosine["90"] ) )
            break;
    }

    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    common_scripts\utility::flag_set( "player_getting_on_minigun" );

    if ( getdvarint( "r_dcburning_culldist" ) == 1 )
        setculldist( 20000 );

    common_scripts\utility::flag_set( "obj_heli_mount_complete" );
    maps\_hud_util::_id_CB55();
    thread _id_BB3A();
    level._id_CED1 thread maps\dcburning_aud::_id_D517();
    maps\dcburning_lighting::_id_CA84( "dcburning_heliride" );
    maps\_friendlyfire::turnoff();
    level.disable_destructible_bad_places = 1;
    killspawner( 7 );
    killspawner( 8 );
    killspawner( 10 );
    var_15 = getent( "volume_roof", "targetname" );
    var_16 = var_15 maps\_utility::get_ai_touching_volume( "axis" );
    common_scripts\utility::array_thread( var_16, ::_id_BA48 );
    maps\_utility::delaythread( 1.5, ::_id_CBCA );
    var_17 = getent( "roof_seaknight_01", "targetname" );
    var_18 = getent( "roof_seaknight_02", "targetname" );
    var_17 notify( "spawn" );
    var_18 notify( "spawn" );
    var_17 thread maps\_utility::notify_delay( "play_anim", 1 );
    var_18 thread maps\_utility::notify_delay( "play_anim", 1 );
    _id_AB5E();
    maps\_utility::music_stop( 5 );
    common_scripts\utility::flag_wait( "roof_heli_about_to_be_owned" );
    common_scripts\utility::flag_set( "player_heli_ready_to_take_off" );
    thread maps\_utility::autosave_by_name( "heli_ride_01" );
    var_19 = maps\_vehicle::spawn_vehicle_from_targetname( "ww2_heli" );
    var_20 = common_scripts\utility::getstruct( "path_player_heli", "targetname" );
    level._id_CED1 maps\_utility::vehicle_liftoff( 76 );
    level._id_CED1 _id_D3C0();
    level._id_CED1 thread _id_D3C0();
    level._id_CED1 thread maps\_vehicle::vehicle_paths( var_20 );
    var_21 = getent( "abrams_street", "targetname" );
    var_21 delete();
    var_22 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "m1a1_heliride_01" );
    var_23 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "m1a1_heliride_02" );
    var_24 = getent( var_22.script_linkto, "script_linkname" );
    var_25 = magicbullet( "javelin_dcburn", var_24.origin, var_22.origin );
    var_25 thread _id_CD38();
    var_25 missile_settargetent( var_22 );
    var_25 missile_setflightmodetop();
    var_26 = maps\_vehicle::spawn_vehicle_from_targetname( "latvee_heliride_01" );
    common_scripts\utility::flag_wait( "player_heli_02" );
    level._id_CED1 vehicle_setspeed( 75 );
    level._id_B9D9 vehicle_setspeed( 70 );
    common_scripts\utility::array_thread( level._id_AE31, common_scripts\utility::pauseeffect );
    common_scripts\utility::array_thread( level._id_BF08, common_scripts\utility::pauseeffect );
    var_27 = common_scripts\utility::getstruct( "helipath_to_ww2_littlebird_wingman_armed", "targetname" );
    var_28 = "littlebird_wingman_armed";
    level._id_CDD7 = level._id_CDD7 _id_B0FB( var_28, var_27 );
    level._id_CDD7 vehicle_setspeed( 100 );
    level._id_B9D9 _id_AEA1();
    level._id_B9D9 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "littlebird_wingman_02_drone_roof" );
    var_27 = common_scripts\utility::getstruct( "helipath_to_ww2_littlebird_wingman_01", "targetname" );
    var_28 = "littlebird_wingman_01";
    level._id_BCF9 = level._id_BCF9 _id_B0FB( var_28, var_27 );
    level._id_BCF9 vehicle_setspeed( 55 );
    var_29 = getentarray( "axis_ww2_drones_01", "targetname" );
    var_30 = getentarray( "axis_ww2_drones_02", "targetname" );
    var_31 = getentarray( "axis_ww2_drones_03", "targetname" );
    var_32 = getentarray( "axis_ww2_drones_04", "targetname" );
    thread _id_CBDC( var_29, "axis_ww2_drones_01" );
    thread _id_CBDC( var_30, "axis_ww2_drones_02" );
    thread _id_CBDC( var_31, "axis_ww2_drones_03" );
    thread _id_CBDC( var_32, "axis_ww2_drones_04" );
    waittillframeend;
    var_33 = getaiarray();
    var_34 = level._id_B9D9.riders;
    var_34[var_34.size] = var_1;
    common_scripts\utility::array_thread( var_33, ::_id_BA48, var_34 );
    maps\_utility::activate_trigger( "spawner_ww2_guys", "targetname", level.player );
    _id_BA1D( "dummy_spawner_ww2_street_guys" );
    level._id_AD0F = 1;
    level._id_C1BE = ( 0.0, 40.0, 0.0 );
    level._effect["mortar"]["dirt"] = loadfx( "fx/explosions/artilleryExp_dirt_brown_2_dcburning" );
    maps\_utility::delaythread( 3, _id_D301::_id_AADA, 2 );
    common_scripts\utility::flag_wait( "player_heli_03a" );
    var_25 = magicbullet( "javelin_dcburn", var_24.origin, var_26.origin );
    var_25 thread _id_CD38();
    var_25 missile_settargetent( var_26 );
    var_25 missile_setflightmodetop();
    var_35 = common_scripts\utility::getstruct( "sam_launch_ww2", "targetname" );
    maps\_utility::delaythread( 1.5, ::_id_B2A0, 8, var_35, level._id_B9D9 );
    common_scripts\utility::flag_wait( "player_heli_05" );
    level._id_CED1 vehicle_setspeed( 90 );
    thread maps\_vehicle::gopath( var_26 );
    level._id_BCF9 vehicle_setspeed( 100 );
    level._id_B9D9 vehicle_setspeed( 100 );
    level._id_CDD7 vehicle_setspeed( 150 );
    var_36 = common_scripts\utility::getstruct( "javelin_littlebird_monument", "targetname" );
    var_37 = magicbullet( "javelin_dcburn", var_36.origin, level._id_B9D9.origin );
    var_37 missile_settargetent( level._id_B9D9 );
    var_38 = common_scripts\utility::getstruct( "littlebird_monument_crash", "targetname" );
    level._id_B9D9 thread _id_AD17::_id_B672( var_38 );
    level._id_B9D9 thread maps\dcburning_aud::_id_C56D();
    var_27 = common_scripts\utility::getstruct( "helipath_to_ww2_strafing_littlebird_wingman_armed", "targetname" );
    var_28 = "littlebird_wingman_armed";
    level._id_CDD7 = level._id_CDD7 _id_B0FB( var_28, var_27 );
    level._id_CDD7 vehicle_setspeed( 90 );
    common_scripts\utility::flag_wait( "player_heli_06" );
    thread _id_BBAF( "allied_drones_heliride_01" );
    thread _id_BBAF( "allied_drones_heliride_02" );
    thread _id_BBAF( "allied_drones_heliride_03" );
    thread _id_BBAF( "allied_drones_heliride_04" );
    common_scripts\utility::flag_wait( "player_heli_10" );
    level.player.ignoreme = 1;
    level._id_CED1 vehicle_setspeed( 25 );
    maps\_utility::activate_trigger( "spawner_ww2_guys_middle", "targetname", level.player );
    level._id_CDD7 vehicle_setspeed( 120 );
    common_scripts\utility::flag_wait( "player_heli_10a" );
    level.createrpgrepulsors = 0;
    var_39 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "bmps_heli_ride_ww2_02" );
    maps\_utility::activate_trigger( "spawner_ww2_guys_end", "targetname", level.player );
    common_scripts\utility::flag_wait( "player_heli_10b" );
    level.player.ignoreme = 0;
    common_scripts\utility::flag_wait( "player_heli_10c" );
    common_scripts\utility::array_thread( level._id_D02D, common_scripts\utility::pauseeffect );

    if ( isdefined( var_19 ) )
        var_19 thread maps\_utility::notify_delay( "liftoff", 3 );

    common_scripts\utility::flag_wait( "player_heli_14" );
    wait 0.5;
    level._id_CED1 vehicle_setspeed( 50 );
    var_40 = maps\_utility::get_vehicle_array( "crows_nest_bmps", "script_noteworthy" );

    foreach ( var_42 in var_40 )
    {
        if ( isdefined( var_42 ) )
        {
            var_42 maps\_vehicle::godoff();
            var_42 _id_AEA1();
        }
    }

    common_scripts\utility::flag_wait( "player_heli_15" );
    level._id_CED1 vehicle_setspeed( 30 );
    killspawner( 11 );
    thread _id_BBAF( "axis_ww2_drones_01" );
    thread _id_BBAF( "axis_ww2_drones_02" );
    thread _id_BBAF( "axis_ww2_drones_03" );
    thread _id_BBAF( "axis_ww2_drones_04" );
    common_scripts\utility::flag_wait( "player_heli_16" );
    level._id_CED1 vehicle_setspeed( 20 );
}

_id_B2A0( var_0, var_1, var_2 )
{
    var_2 endon( "death" );
    var_3 = ( 0.0, 0.0, 250.0 );
    var_4 = spawn( "script_origin", var_2.origin );
    var_2 thread common_scripts\utility::delete_on_death( var_4 );
    var_4.origin = var_2.origin;
    var_4.angles = var_2.angles;
    var_4 linkto( var_2, "tag_origin", var_3, ( 0.0, 0.0, 0.0 ) );
    var_4 thread _id_C865( var_2 );

    for ( var_5 = missile_createattractorent( var_4, 8000, 3000 ); var_0 > 0; var_0-- )
    {
        var_6 = magicbullet( "slamraam_missile_dcburning", var_1.origin, var_2.origin );
        var_1 thread maps\dcburning_aud::_id_D186( var_6 );
        wait 0.25;
    }

    if ( isdefined( var_4 ) )
        var_4 delete();
}

_id_CBCA()
{
    common_scripts\utility::array_thread( level.squad, ::_id_BA48 );
}

_id_AD5E( var_0 )
{
    level._id_AC03 endon( "death" );
    wait 2;
    var_1 = spawn( "script_origin", level._id_CED1.origin );
    var_1.origin = level._id_CED1.origin;
    var_1.angles = level._id_CED1.angles;
    var_2 = spawnstruct();
    var_2.entity = var_1;
    var_2.up = -100;
    var_2.right = -72;
    var_2.forward = -50;
    var_2.yaw = 180;
    var_2 maps\_utility::translate_local();
    var_1 linkto( level._id_CED1 );
    level._id_AC03 notify( "stop_teleport_hack" );
    var_1 maps\_anim::anim_generic_reach( level._id_AC03, "leader_blackhawk_getin" );
    level._id_AC03 setgoalpos( level._id_AC03.origin );
    level._id_AC03.goalradius = 16;
    var_0 waittill( "trigger" );
    var_1 maps\_anim::anim_generic_reach( level._id_AC03, "leader_blackhawk_getin" );
    level._id_AC03 linkto( var_1 );
    var_1 maps\_anim::anim_generic( level._id_AC03, "leader_blackhawk_getin" );
    var_1 thread maps\_anim::anim_generic_loop( level._id_AC03, "leader_blackhawk_idle", "stop_idle" );
}

_id_B2FF()
{
    self endon( "death" );
    thread _id_C35C();
    self.neverenablecqb = 1;
    self.goalradius = 16;
    self.baseaccuracy = 1000;
    self.attackeraccuracy = 0;
    common_scripts\utility::flag_wait( "blackhawk_landed" );
    wait 1;
    var_0 = spawn( "script_origin", level._id_CED1.origin );
    var_0.origin = level._id_CED1.origin;
    var_0.angles = level._id_CED1.angles;
    var_1 = spawnstruct();
    var_1.entity = var_0;
    var_1.up = -100;
    var_1.right = 78;
    var_1.forward = 21;
    var_1 maps\_utility::translate_local();
    var_0 linkto( level._id_CED1 );
    var_0 maps\_anim::anim_generic_reach( self, "redshirt_blackhawk_getin" );
    self linkto( var_0 );
    var_0 maps\_anim::anim_generic( self, "redshirt_blackhawk_getin" );
    var_0 thread maps\_anim::anim_generic_loop( self, "redshirt_blackhawk_idle", "stop_idle" );
}

_id_AB5E( var_0 )
{
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player _meth_830F( 0 );
    level.player allowjump( 0 );
    level.player thread maps\_utility::play_sound_on_entity( "scn_player_mount_bh_minigun" );
    level._id_CED1 maps\_utility::delaythread( 0.5, ::blackhawk_play_rotors_anim );
    level._id_CED1 _id_D3D6::_id_C24F( var_0 );
    setsaveddvar( "r_reactiveMotionHelicopterLimit", 0 );
    level._id_A9CD = 1;
}

_id_BDE1( var_0 )
{
    level endon( "player_getting_on_minigun" );
    self endon( "death" );
    self endon( "stop_teleport_hack" );
    var_1 = 90000;

    while ( isdefined( self ) )
    {
        wait 0.1;

        if ( distancesquared( level.player.origin, self.origin ) < var_1 )
            continue;

        var_2 = level.player geteye();

        if ( common_scripts\utility::within_fov( var_2, level.player.angles, self.origin + ( 0.0, 0.0, 32.0 ), level.cosine["90"] ) )
            continue;
        else
            break;
    }

    self forceteleport( var_0.origin, var_0.angles );
    self notify( "end_melee" );
    maps\_utility::disable_ai_color();
    self setgoalnode( var_0 );
}

_id_BFA3( var_0 )
{
    level._id_CED1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_player" );
    level._id_CED1.spawn_extra_bullet = 1;
    level._id_CED1 thread _id_B7E1();
    level._id_CED1 thread maps\dcburning_aud::_id_C6DA();

    if ( isdefined( var_0 ) )
    {
        level._id_CED1 vehicle_teleport( var_0.origin, var_0.angles );
        level._id_CED1 thread maps\_vehicle::vehicle_paths( var_0 );
        level._id_CED1 useby( level.player );
        level._id_CED1 _id_D3C0();
    }
}

_id_D3C0()
{
    level._id_CED1 cleargoalyaw();
    level._id_CED1 vehicle_setspeed( 30 );
    level._id_CED1 sethoverparams( 32, 10, 3 );
    level._id_CED1 setmaxpitchroll( 5, 10 );
}

_id_CA68()
{
    self endon( "death" );
    var_0 = maps\_vehicle_code::get_unused_crash_locations();
    var_1 = common_scripts\utility::getclosest( self.origin, var_0 );
    var_1.origin = self.origin;
    self.perferred_crash_location = var_1;
    self waittill( "liftoff" );
    thread _id_BF58();
    var_2 = common_scripts\utility::getstruct( self.script_linkto, "script_linkname" );
    var_3 = distance( self.origin, var_2.origin );
    self vehicle_setspeed( 10 );
    maps\_utility::vehicle_liftoff( var_3 );
    self vehicle_setspeed( 50 );
    thread maps\_vehicle::vehicle_paths( var_2 );
}

_id_BF58()
{
    self endon( "death" );
    level.player endon( "death" );
    maps\_utility::ent_flag_init( "stop_firing" );

    while ( isalive( self ) && !maps\_utility::ent_flag( "stop_firing" ) )
    {
        wait 0.5;
        self setlookatent( level.player );

        if ( !common_scripts\utility::within_fov( self.origin, self.angles, level.player.origin + ( 0.0, 0.0, 32.0 ), level.cosine["35"] ) )
        {
            self notify( "stop_firing_turret" );
            continue;
        }

        thread _id_B59B( level.player );
    }

    self notify( "stop_firing_turret" );
    self clearlookatent();
}

_id_CD70()
{
    common_scripts\utility::flag_wait( "player_getting_on_minigun" );
    thread heli_ride_cinematic();
    var_0 = getent( "roof_rocket_guy", "targetname" );
    var_1 = var_0 maps\_utility::spawn_ai( 1 );
    var_1 thread _id_BCCC();
    var_1 thread _id_C35C();
    var_2 = var_0;
    var_2 maps\_anim::anim_generic_first_frame( var_1, var_1.animation );
    var_1 attach( "weapon_stinger", "TAG_INHAND" );
    var_2 thread maps\_anim::anim_generic( var_1, var_1.animation );
    var_1 setanimtime( level.scr_anim["generic"][var_1.animation], 0.6 );
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_roof" );
    var_3 thread _id_A851();
    var_3 setlookatent( level.player );
    var_4 = spawn( "script_origin", var_3.origin + ( 0.0, 0.0, -20.0 ) );
    var_4 linkto( var_3 );
    var_4 thread _id_C865( var_3 );
    var_5 = missile_createattractorent( var_4, 2000, 10000, var_1 );
    var_1 waittillmatch( "single anim", "fire" );
    earthquake( 0.3, 0.5, level.player.origin, 1600 );
    var_6 = var_1 gettagorigin( "TAG_INHAND" );
    magicbullet( "stinger", var_6, var_4.origin );
    common_scripts\utility::flag_set( "roof_heli_about_to_be_owned" );
    var_3 thread _id_B552();
    var_1 waittillmatch( "single anim", "end" );
    var_6 = var_1 gettagorigin( "TAG_INHAND" );
    var_7 = var_1 gettagangles( "TAG_INHAND" );
    var_1 detach( "weapon_stinger", "TAG_INHAND" );
    var_8 = spawn( "script_model", var_6 );
    var_8 setmodel( "weapon_stinger" );
    var_1 thread common_scripts\utility::delete_on_death( var_8 );
    var_8.angles = var_7;
    var_9 = getnode( "at4_guy_retreat", "targetname" );
    var_1 setgoalnode( var_9 );
    var_1 thread maps\_utility::stop_magic_bullet_shield();
    var_1 thread _id_A8CE();
    var_1.health = 1;
}

heli_ride_cinematic()
{
    var_0 = _id_D397::_id_A97A( "heli_ride_intro" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 22.0, 400, 32, 32 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 8.0 ) _id_D397::_id_C491( 5.8, 400, 2.0, 2.0 );
    var_0 _id_D397::_id_BEA0( 103.0 ) _id_D397::_id_C491( 22.0, 400, 2.0, 2.0 );
    var_0 _id_D397::_id_BEA0( 104.0 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.25 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 10.75 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 0.45 ) _id_D397::_id_B85E( 0.04, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 0.7 ) _id_D397::_id_B85E( 0.04, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.8 ) _id_D397::_id_B85E( 0.04, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 2.0 ) _id_D397::_id_B85E( 0.04, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 2.25 ) _id_D397::_id_B85E( 0.04, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BC26();
}

_id_A851()
{
    self._id_CDF2 = 1;
    self waittill( "death" );
    common_scripts\utility::flag_set( "roof_heli_owned" );
    earthquake( 0.6, 1.2, level.player.origin, 1600 );
    level.player playrumblelooponentity( "damage_heavy" );
}

_id_B552()
{
    self endon( "death" );
    wait 1.5;
    self kill();
}

_id_B7E1()
{
    common_scripts\utility::flag_set( "player_heli_spawned" );
    maps\_vehicle::godon();
}

_id_B214()
{
    common_scripts\utility::flag_wait( "player_approaching_outer_balcony" );
    var_0 = maps\_utility::array_spawn( getentarray( "littlebird_roof_riders_left", "targetname" ) );
    common_scripts\utility::array_thread( var_0, ::_id_BCCC );
    common_scripts\utility::array_thread( var_0, maps\_utility::magic_bullet_shield );
    var_1 = maps\_utility::array_spawn( getentarray( "littlebird_roof_riders_right", "targetname" ) );
    common_scripts\utility::array_thread( var_1, ::_id_BCCC );
    common_scripts\utility::array_thread( var_1, maps\_utility::magic_bullet_shield );
    level._id_B9D9 = maps\_vehicle::spawn_vehicle_from_targetname( "littlebird_wingman_02" );
    level._id_B9D9 thread maps\_vehicle::gopath();
    var_2 = common_scripts\utility::getstruct( "pickup_node_before_stage", "script_noteworthy" );
    level._id_B9D9 maps\_vehicle::set_stage( var_2, var_0, "left" );
    level._id_B9D9 maps\_vehicle::set_stage( var_2, var_1, "right" );
    level._id_B9D9 waittill( "touch_down" );
    level._id_B9D9 thread maps\_vehicle::load_side( "left", var_0 );
    level._id_B9D9 thread maps\_vehicle::load_side( "right", var_1 );
    common_scripts\utility::flag_wait( "player_approach_commerce_roof_01" );
    level._id_BCF9 = maps\_vehicle::spawn_vehicle_from_targetname( "littlebird_wingman_01" );
    level._id_BCF9 thread maps\_vehicle::vehicle_ai_event( "idle_alert_to_casual" );
    thread maps\_vehicle::gopath( level._id_BCF9 );

    while ( level._id_B9D9.riders.size < 6 )
        wait 0.1;

    thread common_scripts\utility::flag_set( "roof_littlebird_lifted_off" );
    level._id_B9D9 thread maps\_utility::vehicle_liftoff( 3 );
    level._id_B9D9 thread maps\_utility::play_sound_on_tag_endon_death( "scn_dcburn_roof_ai_heli_liftoff" );
    var_3 = common_scripts\utility::getstruct( "heli_roof_loop_01", "targetname" );
    wait 1;
    level._id_B9D9 thread maps\_vehicle::vehicle_paths( var_3 );
    level._id_B9D9 setmaxpitchroll( 20, 50 );
    wait 2;
    level._id_B9D9 maps\_vehicle::vehicle_ai_event( "idle_alert_to_casual" );
    level._id_B9D9 vehicle_setspeed( 25 );
}

_id_BB50()
{
    common_scripts\utility::flag_wait( "player_approach_commerce_roof_02" );
    level._id_CDD7 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "littlebird_wingman_armed" );
    level._id_CDD7 vehicle_setspeed( 25 );
    var_0 = common_scripts\utility::getstruct( "wingman_roof_node_01", "script_noteworthy" );
    var_0 waittill( "trigger" );
    var_1 = getent( "roof_target_for_helis", "targetname" );
    level._id_CDD7 setlookatent( var_1 );
    level._id_CDD7 vehicle_setspeed( 10 );
    waittillframeend;

    foreach ( var_3 in level._id_CDD7.mgturret )
        var_3 setmode( "auto_nonai" );

    common_scripts\utility::flag_wait( "player_getting_on_minigun" );

    foreach ( var_3 in level._id_CDD7.mgturret )
    {
        var_3 setmode( "manual" );
        var_3 stopfiring();
    }
}

_id_D2B3()
{
    thread _id_C768();
    thread _id_CBB0();
    common_scripts\utility::flag_wait( "player_crash_starting" );
    thread maps\dc_crashsite::_id_BFC4();
    common_scripts\utility::flag_wait( "player_crash_done" );
    _func_31C( 7 );
    level.player setviewmodel( "h2_gfl_ump9_viewhands" );
}

_id_CBB0()
{
    common_scripts\utility::flag_wait( "player_heli_18a" );
    maps\_utility::radio_dialogue_overlap( "dcburn_bhp_incoming" );
    common_scripts\utility::flag_wait( "player_heli_18d" );
    maps\_utility::radio_dialogue( "dcburn_mcy_stillintheair" );
    common_scripts\utility::flag_wait( "player_heli_19" );
    maps\_utility::radio_dialogue( "dcburn_bhp_attitudecontrol" );
    maps\_utility::radio_dialogue( "dcburn_mcy_takeusup" );
    common_scripts\utility::flag_wait( "player_heli_20" );
    maps\_utility::radio_dialogue( "dcburn_lbp1_samlaunch" );
    common_scripts\utility::flag_wait( "player_crash_starting" );
    wait 0.3;
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0 linkto( level.player );
    var_0 thread maps\_utility::play_sound_on_tag_endon_death( "dcburn_lbp1_maydaymayday", "tag_origin" );
    common_scripts\utility::flag_wait( "player_heli_crash" );
    var_0 notify( "death" );
    var_0 delete();
}

_id_C768()
{
    common_scripts\utility::flag_wait( "player_heli_18" );
    thread maps\_utility::autosave_now();
    level._id_CED1 vehicle_setspeed( 70 );

    if ( isdefined( level._id_CDD7 ) )
        level._id_CDD7 _id_AEA1();

    if ( isdefined( level._id_BCF9 ) )
        level._id_BCF9 _id_AEA1();

    if ( isdefined( level._id_B9D9 ) )
        level._id_B9D9 _id_AEA1();

    var_0 = getentarray( "vehicles_crowsnest_defend", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) )
            var_2 delete();
    }

    var_4 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "littlebird_wingman_02_drone_crash" );
    var_4 vehicle_setspeed( 70 );
    var_5 = ( 0.0, 0.0, 250.0 );
    var_6 = spawn( "script_origin", var_4.origin );
    var_6.origin = var_4.origin;
    var_6.angles = var_4.angles;
    var_6 linkto( var_4, "tag_origin", var_5, ( 0.0, 0.0, 0.0 ) );
    var_6 thread _id_C865( var_4 );
    var_7 = missile_createattractorent( var_6, 8000, 3000 );
    var_8 = getent( "missile_org_lincoln", "targetname" );
    var_9 = magicbullet( "slamraam_missile_dcburning", var_8.origin, var_6.origin );
    var_8 thread maps\dcburning_aud::_id_D186( var_9 );
    wait 0.5;
    var_10 = magicbullet( "slamraam_missile_dcburning", var_8.origin, var_6.origin );
    var_8 thread maps\dcburning_aud::_id_D186( var_10 );
    wait 0.5;
    var_11 = magicbullet( "slamraam_missile_dcburning", var_8.origin, var_6.origin );
    var_8 thread maps\dcburning_aud::_id_D186( var_11 );
    wait 0.5;
    var_12 = magicbullet( "slamraam_missile_dcburning", var_8.origin, var_6.origin );
    var_8 thread maps\dcburning_aud::_id_D186( var_12 );
    wait 0.5;
    var_13 = magicbullet( "slamraam_missile_dcburning", var_8.origin, var_6.origin );
    var_8 thread maps\dcburning_aud::_id_D186( var_13 );
    var_14 = magicbullet( "javelin_dcburn", var_8.origin, var_4.origin );
    var_14 missile_settargetent( var_4 );
    var_15 = common_scripts\utility::getstruct( "littlebird_crash_ww2", "targetname" );
    var_4 thread _id_AD17::_id_B672( var_15 );
    common_scripts\utility::flag_wait( "player_heli_18b" );
    wait 2;
    earthquake( 0.5, 1.5, level.player.origin, 1600 );
    level._id_CED1 thread maps\dcburning_aud::_id_D0B5();
    common_scripts\utility::_id_C203( level._effect["heli_hit"], level._id_CED1, "side_door_r_jnt", ( -20.0, -10.0, 0.0 ) );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player dodamage( 10, level.player.origin );
    thread _id_B68A();
    thread _id_BB05();
    level._id_CED1 thread _id_AF2B();
    level._id_CED1 thread _id_C755( "smoke_trail_black_heli" );
    wait 0.5;
    common_scripts\utility::flag_wait( "player_heli_18d" );
    level._id_CED1 vehicle_setspeed( 25, 60, 60 );
    common_scripts\utility::array_thread( level._id_CE63, common_scripts\utility::pauseeffect );
    thread _id_B933( "axis", undefined, 1 );
    thread _id_D5C4( "axis", undefined, 1 );
    var_16 = getentarray( "axis_window_drones_01", "targetname" );
    thread _id_CBDC( var_16, "axis_window_drones_01" );
    var_16 = getentarray( "axis_window_drones_02", "targetname" );
    thread _id_CBDC( var_16, "axis_window_drones_02" );
    maps\_utility::activate_trigger( "spawner_enemies_glass_02", "targetname", level.player );
    maps\_utility::activate_trigger( "spawner_enemies_glass_03", "targetname", level.player );
    var_16 = getentarray( "axis_lincoln_drones_01", "targetname" );
    thread _id_CBDC( var_16, "axis_lincoln_drones_01" );
    var_16 = getentarray( "axis_lincoln_drones_02", "targetname" );
    thread _id_CBDC( var_16, "axis_lincoln_drones_02" );
    var_16 = getentarray( "axis_lincoln_drones_03", "targetname" );
    thread _id_CBDC( var_16, "axis_lincoln_drones_03" );
    var_16 = getentarray( "axis_lincoln_drones_04", "targetname" );
    thread _id_CBDC( var_16, "axis_lincoln_drones_04" );
    common_scripts\utility::flag_wait( "player_heli_19a" );
    _id_AF40();
    thread _id_A89A( "volume_enemies_glass_02", "axis" );
    thread _id_BBAF( "axis_window_drones_01" );
    maps\_utility::activate_trigger( "spawner_enemies_glass_04", "targetname", level.player );
    common_scripts\utility::flag_wait( "player_heli_19b" );
    thread _id_A89A( "volume_enemies_glass_03", "axis" );
    common_scripts\utility::flag_wait( "player_heli_19c" );
    var_17 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "littlebird_wingman_armed_lincoln" );
    var_17 vehicle_setspeed( 90 );
    thread _id_A89A( "volume_enemies_glass_04a", "axis" );
    thread _id_A89A( "volume_enemies_glass_04", "axis" );
    maps\_utility::activate_trigger( "spawner_enemies_balcony_01", "targetname", level.player );
    var_18 = maps\_vehicle::spawn_vehicles_from_targetname( "slamraam_lincoln" );
    maps\_utility::activate_trigger( "spawner_axis_lincoln_01", "targetname", level.player );
    common_scripts\utility::flag_wait( "player_heli_19d" );
    level._id_CED1 vehicle_setspeed( 80, 20, 20 );
    common_scripts\utility::flag_wait( "player_heli_20" );
    var_18 = common_scripts\utility::get_array_of_closest( level.player.origin, var_18 );
    var_19 = 0;

    foreach ( var_21 in var_18 )
    {
        if ( isdefined( var_21 ) )
        {
            var_21 thread maps\_utility::notify_delay( "fire", var_19 );
            var_19 += 0.25;
        }
    }

    common_scripts\utility::flag_wait( "player_heli_21" );
    var_18 = common_scripts\utility::get_array_of_closest( level.player.origin, var_18 );
    var_19 = 0;

    foreach ( var_21 in var_18 )
    {
        if ( isdefined( var_21 ) )
        {
            var_21 thread maps\_utility::notify_delay( "fire", var_19 );
            var_19 += 0.25;
        }
    }

    common_scripts\utility::flag_wait( "player_heli_22" );
    _id_BBAF( "axis_lincoln_drones_01" );
    _id_BBAF( "axis_lincoln_drones_02" );
    _id_BBAF( "axis_lincoln_drones_03" );
    _id_BBAF( "axis_lincoln_drones_04" );
    common_scripts\utility::flag_set( "player_crash_starting" );
    level._id_CED1 thread maps\_utility::play_sound_on_entity( "scn_dcburning_plr_heli_missile_hit_02" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_player_heli_hit_vo" );
    level._id_CED1 vehicle_turnengineoff();
    level._id_CED1 thread common_scripts\utility::play_loop_sound_on_entity( "scn_dcburning_plr_heli_dying_loop" );
    level._id_CED1 thread maps\dcburning_aud::_id_B08F();
    level._id_CED1 vehicle_setspeed( 150, 50, 50 );
    common_scripts\utility::_id_C203( level._effect["heli_hit_2"], level._id_CED1, "side_door_r_jnt", ( -20.0, -10.0, 0.0 ) );
    level._id_CED1 thread _id_C755( "smoke_trail_black_heli_fire" );
    level.player playrumblelooponentity( "damage_heavy" );
    level._id_CED1 useby( level.player );
    level.player unlink();
    level.player disableweapons();
    level._id_CED1 makeunusable();
    common_scripts\utility::flag_clear( "player_on_minigun" );
    common_scripts\utility::flag_set( "player_off_minigun" );
    level notify( "player_off_blackhawk_gun" );
    level._id_CED1 thread _id_BCA3();
    level._id_CED1 thread _id_AEF1();
    earthquake( 0.7, 2.5, level.player.origin, 1600 );
    level._id_CED1 thread _id_CBB9();
    wait 1;
    maps\_utility::flavorbursts_off( "allies" );
    thread _id_D5C4( "all", undefined, 1 );
    thread _id_B933( "axis", undefined, 1 );
    common_scripts\utility::flag_wait( "player_heli_crash" );
    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::battlechatter_on( "axis" );
    earthquake( 0.7, 2.5, level.player.origin, 1600 );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player notify( "stop sounddcburning_heli_alarm" );
    wait 0.1;
    var_17 _id_AEA1();
    wait 0.3;
    maps\_utility::music_stop();
    soundscripts\_snd::snd_message( "start_heli_crash_black_screen" );
    thread maps\dcburning_aud::crashsite_heli_rappel();
    level.black_overlay = maps\_hud_util::create_client_overlay( "black", 1 );
    level.player unlink();
    wait 0.1;
    level._id_CED1 _id_AEA1();
    wait 2;
    maps\dcburning_lighting::_id_CA84( "dcburning_helicrash" );
    var_25 = "-42263 6917 183";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_25 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_25 );
    common_scripts\utility::flag_set( "player_crash_done" );
    level.player setactionslot( 1, "nightvision" );

    if ( getdvarint( "sm_enable" ) && getdvar( "r_zfeather" ) != "0" )
        level._effect["_attack_heli_spotlight"] = loadfx( "fx/misc/spotlight_large_dcburning" );
    else
        level._effect["_attack_heli_spotlight"] = loadfx( "fx/misc/spotlight_large" );
}

_id_AF2B()
{
    thread first_impact_cinematic();
    common_scripts\utility::flag_clear( "player_on_minigun" );
    common_scripts\utility::flag_set( "player_off_minigun" );
    level.player freezecontrols( 1 );
    self useby( level.player );
    level.player playerlinktodelta( self.modeldummy, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player dontinterpolate();
    self hide();
    self.modeldummy show();
    self.modeldummy blackhawk_play_rotors_anim();
    var_0 = self.modeldummy maps\_utility::getanim( "minigun_first_impact" );
    self.modeldummy setflaggedanim( "minigun_first_impact", var_0, 1, 0 );
    self.modeldummy waittill( "minigun_first_impact" );
    self.modeldummy clearanim( var_0, 0.1 );
    self setanim( maps\_utility::getanim( "minigun_idle" ), 0.1 );
    wait 0.05;
    self.modeldummy hide();
    self show();
    self useby( level.player );
    level.player dontinterpolate();
    level.player freezecontrols( 0 );
    common_scripts\utility::flag_clear( "player_off_minigun" );
    common_scripts\utility::flag_set( "player_on_minigun" );
    level._id_CED1 thread _id_B0FA::_id_C0E2();
}

first_impact_cinematic()
{
    var_0 = _id_D397::_id_A97A( "helicopter_first_impact" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BC26();
}

_id_BCA3()
{
    thread second_impact_cinematic();
    level.player freezecontrols( 1 );
    level.player playerlinktodelta( self.modeldummy, "tag_player", 1, 0, 0, 0, 0 );
    level.player dontinterpolate();
    self hide();
    self.modeldummy show();
    self.modeldummy blackhawk_play_rotors_anim();

    if ( isdefined( self.rooftop_helirider ) )
        self.rooftop_helirider hide();

    var_0 = self.modeldummy maps\_utility::getanim( "minigun_second_impact" );
    self.modeldummy setanim( var_0, 1, 0 );
    wait(getanimlength( var_0 ));

    if ( isdefined( self.modeldummy ) )
        self.modeldummy clearanim( var_0, 0 );

    level.player unlink();
    level.player freezecontrols( 0 );
}

second_impact_cinematic()
{
    var_0 = _id_D397::_id_A97A( "helicopter_second_impact" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 7.5 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 22.0, 30, 32, 32 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 0.05 ) _id_D397::_id_C491( 14.0, 30, 2.0, 2.0 );
    var_0 _id_D397::_id_BEA0( 7.5 ) _id_D397::_id_B687() _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_init", 1 );
    var_0 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_play", 1 );
    var_0 _id_D397::_id_BC26();
}

_id_B68A()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0 linkto( level._id_CED1, "tag_guy5", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );

    while ( !common_scripts\utility::flag( "player_crash_done" ) )
    {
        playfxontag( common_scripts\utility::getfx( "dlight_red" ), var_0, "tag_origin" );
        wait 1;
        stopfxontag( common_scripts\utility::getfx( "dlight_red" ), var_0, "tag_origin" );
        wait 0.5;
    }

    var_0 unlink();
    var_0 delete();
}

_id_BB05()
{
    while ( !common_scripts\utility::flag( "player_crash_starting" ) )
    {
        earthquake( 0.18, 0.05, level.player.origin, 80000 );
        wait 0.05;
    }
}

_id_C755( var_0 )
{
    self notify( "blackhawk_smoke_stop" );
    self endon( "blackhawk_smoke_stop" );
    self endon( "death" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( var_0 ), level._id_CED1, "tag_gun_r" );
        wait 0.05;
    }
}

_id_AEF1()
{
    while ( !common_scripts\utility::flag( "player_heli_crash" ) )
    {
        playfxontag( common_scripts\utility::getfx( "heat_shimmer_door" ), self, "tag_player" );
        wait 0.1;
    }
}

_id_CBB9()
{
    self setmaxpitchroll( 50, 100 );
    self setturningability( 1 );
    var_0 = 1400;
    var_1 = 200;
    var_2 = undefined;

    while ( isdefined( self ) )
    {
        var_2 = self.angles[1] + 100;
        self setyawspeed( var_0, var_1 );
        self settargetyaw( var_2 );
        wait 0.1;
    }
}

_id_D291()
{
    if ( !issentient( self ) )
        return;

    self.combatmode = "ambush";
}

_id_B9A1()
{
    self endon( "death" );
    thread maps\_utility::magic_bullet_shield();
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.maxsightdistsqrd = 0;
    wait 0.2;
}

_id_C2E4()
{
    self.interval = 0;
    self.neverenablecqb = 1;
    self.grenadeawareness = 0;
    self.ignoresuppression = 1;
    self.aggressivemode = 1;
}

_id_D0E5()
{
    if ( !isdefined( self.script_parameters ) )
        return;

    self.animname = "enemy_death";
    thread _id_C2E4();

    if ( self.script_parameters == "windows" )
    {
        var_0 = [];
        var_0[0] = "h2_favela_backalleys_death_rooftop_A";
        var_0[1] = "h2_favela_backalleys_death_rooftop_B";
        var_0[2] = "h2_favela_backalleys_death_rooftop_C";
        var_0[3] = "h2_favela_backalleys_death_rooftop_D";
        maps\_utility::set_deathanim( var_0[randomintrange( 0, 3 )] );
    }
    else
        thread _id_B3B2();
}

_id_B3B2()
{
    var_0 = getnode( self.script_parameters, "targetname" );
    thread maps\_utility::magic_bullet_shield( 1 );
    self waittill( "damage" );
    self.noragdoll = undefined;

    if ( isdefined( self.script_parameters ) )
    {
        switch ( self.script_parameters )
        {
            case "balcony_fall1":
            case "balcony_fall3":
                maps\_utility::set_deathanim( "h2_favela_backalleys_death_window_B" );
                thread _id_BAB1( var_0 );
                self.damageshield = 0;
                self.specialdeathfunc = ::_id_ABBA;
                self kill();
                break;
            case "balcony_fall2":
            case "balcony_fall4":
            case "balcony_fall6":
                self.deathanim = undefined;
                thread _id_BAB1( var_0 );
                var_0 thread maps\_anim::anim_single_solo( self, "h2_favela_backalleys_death_window_A" );
                wait 0.8;
                self.damageshield = 0;
                self.specialdeathfunc = ::_id_ABBA;
                self kill();
                break;
        }
    }

    if ( isalive( self ) )
        maps\_utility::stop_magic_bullet_shield();
}

_id_ABBA()
{
    return 1;
}

_id_BAB1( var_0 )
{
    var_1 = 0.25;
    var_2 = 0;

    while ( var_2 != var_1 )
    {
        var_3 = vectorlerp( self.angles, var_0.angles, var_2 / var_1 );
        self teleport( self.origin, var_3 );
        var_2 += 0.05;
        waitframe();
    }
}

_id_AD30()
{
    wait 6;
    var_0 = 1;
    objective_add( var_0, "current", &"DCBURNING_OBJ_REGROUP_WITH_TEAM" );
}

_id_D1F6()
{
    common_scripts\utility::flag_wait( "obj_follow_sgt_macey_given" );
    objective_string_nomessage( 1, &"DCBURNING_OBJ_MACRO_SECURE_DEPARTMENT_OF_COMMERCE_BUILDING" );
    var_0 = 2;
    var_1 = level._id_AC03;
    objective_add( var_0, "active", &"DCBURNING_OBJ_FOLLOW_SGT_MACEY" );
    objective_current( var_0 );
    objective_onentity( var_0, level._id_AC03, ( 0.0, 0.0, 70.0 ) );
    _func_1E7( var_0, 1 );
    common_scripts\utility::flag_wait( "obj_follow_sgt_macey_complete" );
    objective_state_nomessage( var_0, "done" );
}

_id_BFCB()
{
    common_scripts\utility::flag_wait( "obj_commerce_given" );
    var_0 = 2;
    var_1 = common_scripts\utility::getstruct( "obj_commerce_sector_1", "targetname" );
    objective_add( var_0, "active", &"DCBURNING_OBJ_COMMERCE" );
    objective_current( var_0 );
    objective_onentity( var_0, level._id_AC03, ( 0.0, 0.0, 70.0 ) );
    _func_1E7( var_0, 1 );
    common_scripts\utility::flag_wait( "player_around_corner_to_crows_nest" );
    objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
    var_1 = common_scripts\utility::getstruct( "obj_commerce_sector_3", "targetname" );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "obj_commerce_complete" );
    objective_state( var_0, "done" );
}

_id_BACB()
{
    common_scripts\utility::flag_wait( "obj_commerce_defend_snipe_given" );
    objective_add( 3, "invisible", &"DCBURNING_OBJ_COMMERCE_SUPPORT_EVAC_SITE" );
    objective_state_nomessage( 3, "active" );
    var_0 = 4;
    var_1 = common_scripts\utility::getstruct( "obj_commerce_defend_snipe", "targetname" );
    var_2 = ( 19.0, 0.0, -5.0 );
    var_3 = var_1.origin + var_2;
    objective_add( var_0, "active", &"DCBURNING_OBJ_COMMERCE_DEFEND_SNIPE", var_3 );
    objective_current( var_0 );
    _func_1E7( var_0, 1 );
    common_scripts\utility::flag_wait( "obj_commerce_defend_snipe_complete" );
    objective_state( var_0, "done" );
}

_id_D445()
{
    level endon( "obj_commerce_defend_snipe_complete" );
    self waittill( "death" );
    level._id_CC7E = gettime();
    level._id_C702 -= 1;

    if ( level._id_C702 < 3 )
        common_scripts\utility::flag_set( "only_2_sniper_enemies_remaining" );

    if ( level._id_C702 == 0 )
        common_scripts\utility::flag_set( "obj_commerce_defend_snipe_complete" );
}

_id_BB25()
{
    common_scripts\utility::flag_wait( "obj_commerce_defend_crow_given" );
    objective_delete( 3 );
    objective_delete( 4 );
    objective_add( 4, "invisible", &"DCBURNING_OBJ_COMMERCE_SUPPORT_EVAC_SITE" );
    objective_add( 5, "invisible", &"DCBURNING_OBJ_COMMERCE_DEFEND_SNIPE" );
    _func_1E7( 4, 0 );
    _func_1E7( 5, 1 );
    objective_state_nomessage( 4, "active" );
    objective_state_nomessage( 5, "done" );
    var_0 = 3;
    objective_add( var_0, "active", &"DCBURNING_OBJ_COMMERCE_DEFEND_CROW" );
    var_1 = getent( "crow_defend_obj1", "targetname" );
    var_2 = getent( "crow_defend_obj2", "targetname" );
    objective_additionalposition( var_0, 0, var_1.origin );
    objective_additionalposition( var_0, 1, var_2.origin );
    objective_setpointertextoverride( var_0, &"DCBURNING_OBJ_TEXT_DEFEND" );
    objective_state( var_0, "current" );
    _func_1E7( var_0, 1 );
    common_scripts\utility::flag_wait( "obj_commerce_defend_crow_complete" );
    objective_state( var_0, "done" );
    objective_state_nomessage( 1, "done" );
}

_id_D0CC()
{
    var_0 = getent( "javelin_obj", "script_noteworthy" );

    if ( !isdefined( var_0 ) )
    {
        var_1 = getentarray( "javelins_crowsnest", "targetname" );

        if ( var_1.size )
            var_0 = common_scripts\utility::getclosest( level.player getorigin(), var_1, 300 );
    }

    return var_0;
}

_id_AFD5()
{
    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_given" );
    wait 0.5;
    var_0 = 6;
    var_1 = common_scripts\utility::getstruct( "obj_defend_javelin", "targetname" );
    objective_add( var_0, "active", &"DCBURNING_OBJ_COMMERCE_DEFEND_JAVELIN" );
    objective_current( var_0 );
    _func_1E7( var_0, 1 );

    if ( !_id_ABB0() )
    {
        var_2 = _id_D0CC();

        if ( isdefined( var_2 ) )
        {
            var_3 = var_2.origin + ( 0.0, 0.0, 25.0 );
            thread _id_B211( var_2 );
            var_1.origin = var_3;
            objective_position( var_0, var_1.origin );
        }

        common_scripts\utility::flag_wait( "player_has_javelin" );
        objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
    }

    var_4 = level.player getcurrentweapon();

    if ( !issubstr( var_4, "javelin" ) )
        level.player thread maps\_utility::display_hint( "javelin_switch" );

    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_complete" );
    objective_state( var_0, "done" );
}

_id_C5EF()
{
    level endon( "obj_commerce_defend_javelin_complete" );
    self endon( "deleted_through_script" );
    self endon( "killed_by_friendly" );
    self endon( "deleted_through_script" );
    common_scripts\utility::flag_wait( "obj_commerce_defend_javelin_given" );
    level._id_C771 = common_scripts\utility::array_add( level._id_C771, self );
    self waittill( "death", var_0 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
    {
        level._id_CC7E = gettime();

        if ( !common_scripts\utility::flag( "player_has_killed_at_least_one_javelin_target" ) )
            common_scripts\utility::flag_set( "player_has_killed_at_least_one_javelin_target" );

        level._id_D24C -= 1;

        if ( level._id_D24C < 3 )
            common_scripts\utility::flag_set( "only_2_javelin_enemies_remaining" );

        if ( level._id_D24C < 2 )
            common_scripts\utility::flag_set( "only_1_javelin_enemies_remaining" );

        if ( level._id_D24C == 0 )
            common_scripts\utility::flag_set( "obj_commerce_defend_javelin_complete" );
    }

    level._id_C771 = common_scripts\utility::array_remove( level._id_C771, self );
    level._id_C771 = maps\_utility::remove_dead_from_array( level._id_C771 );
}

_id_CFB3()
{
    common_scripts\utility::flag_wait( "obj_rooftop_given" );
    objective_state_nomessage( 1, "done" );
    var_0 = 7;
    var_1 = common_scripts\utility::getstruct( "obj_commerce_roof", "targetname" );
    objective_add( var_0, "active", &"DCBURNING_OBJ_ROOFTOP", var_1.origin );
    objective_current( var_0 );
    _func_1E7( var_0, 1 );
    _func_1E7( 7, 1 );
    common_scripts\utility::flag_wait( "player_roof_stairs_00" );
    var_1 = common_scripts\utility::getstruct( "obj_commerce_roof02", "targetname" );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "player_roof_stairs_01" );
    var_1 = common_scripts\utility::getstruct( "obj_commerce_roof03", "targetname" );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "player_roof_stairs_02" );
    var_1 = common_scripts\utility::getstruct( "obj_commerce_roof03a", "targetname" );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "player_outer_balcony_top_commerce" );
    var_1 = common_scripts\utility::getstruct( "obj_commerce_roof03b", "targetname" );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "player_headed_to_roof" );
    var_1 = common_scripts\utility::getstruct( "obj_commerce_roof03c", "targetname" );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "player_approach_commerce_roof_01" );
    var_1 = common_scripts\utility::getstruct( "obj_commerce_roof03d", "targetname" );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "player_approach_commerce_roof_02" );
    var_1 = common_scripts\utility::getstruct( "obj_commerce_roof04", "targetname" );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "obj_rooftop_complete" );
    objective_state( var_0, "done" );
}

_id_C995()
{
    common_scripts\utility::flag_wait( "obj_rooftop_complete" );
    var_0 = 8;
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1.origin = level._id_CED1 gettagorigin( "tag_player" );
    var_1 linkto( level._id_CED1, "tag_player", ( 0.0, 0.0, 25.0 ), ( 0.0, 0.0, 0.0 ) );
    objective_add( var_0, "active", &"DCBURNING_OBJ_HELI_MOUNT", var_1.origin );
    objective_current( var_0 );
    _func_1E7( var_0, 1 );

    while ( !common_scripts\utility::flag( "blackhawk_landed" ) )
    {
        objective_position( var_0, var_1.origin );
        wait 0.05;
    }

    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "obj_heli_mount_complete" );
    objective_state( var_0, "done" );
}

_id_D196()
{
    common_scripts\utility::flag_wait( "obj_heli_ride_given" );
    var_0 = 9;
    objective_add( var_0, "active", &"DCBURNING_OBJ_HELI_RIDE", level.player.origin );
    objective_current( var_0 );
    _func_1E7( 9, 1 );
    common_scripts\utility::flag_wait( "obj_heli_ride_complete" );
    objective_state_nomessage( var_0, "done" );
    objective_state_nomessage( 4, "done" );
}

enter_smoke_column()
{
    common_scripts\utility::flag_wait( "player_heli_07" );
    common_scripts\_exploder::exploder( "smoke_column_cam" );
}

_id_D35D()
{

}

_id_C150( var_0, var_1, var_2, var_3, var_4 )
{
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_5, var_6, var_7, var_8, var_9, var_10, var_11 );

        if ( var_5 <= 0 )
            continue;

        if ( isdefined( var_4 ) && var_4 )
        {
            var_12 = getent( self.target, "targetname" );
            var_12 delete();
        }

        if ( isdefined( var_3 ) && var_3 )
            self physicslaunchclient( self.origin, var_7 * var_5 );

        self setmodel( var_0 );
        var_13 = self getorigin();
        var_14 = var_13 + var_2;
        playfx( common_scripts\utility::getfx( var_1 ), var_14 );
        break;
    }
}

_id_B640()
{
    _id_C150( "h1_mwr_com_widescreen_monitor_des", "tv_explosion", ( 0.0, 0.0, 25.0 ), 1, 1 );
}

_id_D513()
{
    _id_C150( "h1_mwr_com_widescreen_monitor_2_des", "tv_explosion", ( 0.0, 0.0, 30.0 ), 1 );
}

_id_BE79()
{
    _id_C150( "com_widescreen_monitor_on_1_des", "tv_explosion", ( 0.0, 0.0, 25.0 ), 1, 1 );
}

_id_A9AD()
{
    _id_C150( "com_widescreen_monitor_on_2_des", "tv_explosion", ( 0.0, 0.0, 30.0 ), 1, 1 );
}

_id_C677()
{
    _id_C150( "com_widescreen_monitor_on_3_des", "tv_explosion", ( 0.0, 0.0, 28.0 ), 1, 1 );
}

_id_AA38()
{

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

}

_id_CCE9()
{

}

_id_B0BA()
{
    while ( isalive( self ) )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3 );

        if ( isdefined( var_1 ) && ( isdefined( var_1.classname ) && var_1.classname == "misc_turret" ) )
        {
            if ( !isdefined( var_3 ) )
                break;

            if ( !isdefined( var_2 ) )
                var_2 = ( 0.0, 0.0, 1.0 );

            playfx( common_scripts\utility::getfx( "thermal_body_gib" ), var_3 );
        }
    }
}

_id_AD09()
{
    self endon( "death" );

    if ( common_scripts\utility::flag( "lav_is_suppressing" ) )
        return;

    self.ignoresuppression = 1;
    self.aggressivemode = 1;
}

_id_B310()
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    thread _id_C35C( 1 );
    self.baseaccuracy = 0.01;
    self.attackeraccuracy = 10;
    self.aggressivemode = 1;
    var_0 = undefined;
    var_1 = undefined;

    while ( isalive( self ) )
    {
        self waittill( "damage", var_2, var_0, var_3, var_1, var_4, var_5 );

        if ( isdefined( var_0 ) && isplayer( var_0 ) )
            continue;

        if ( common_scripts\utility::within_fov( level.player.origin, level.player.angles, self.origin + ( 0.0, 0.0, 32.0 ), level.cosine["90"] ) )
            break;
    }

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self kill( var_1, var_0 );
}

_id_C35C( var_0 )
{
    self endon( "death" );

    while ( isdefined( self.melee ) )
        wait 0.1;

    thread maps\_utility::magic_bullet_shield( var_0 );
}

_id_BCCC()
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self.code_classname ) && self.code_classname == "script_model" )
        return;

    maps\_utility::setflashbangimmunity( 1 );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.grenadeawareness = 0;
    self setthreatbiasgroup( "oblivious" );
}

_id_A8CE()
{
    if ( !isdefined( self ) )
        return;

    if ( isdefined( self.code_classname ) && self.code_classname == "script_model" )
        return;

    self endon( "death" );
    maps\_utility::setflashbangimmunity( 0 );
    self.ignoreme = 0;
    self.ignoreall = 0;
    self.grenadeawareness = 1;
    self setthreatbiasgroup( "allies" );
}

_id_C8EA()
{
    if ( !isdefined( self ) )
        return;

    self.fixednode = 0;
}

_id_A89B()
{
    if ( !isdefined( self ) )
        return;

    self.fixednode = 1;
}

_id_CCEA()
{
    self endon( "death" );
    self.ignoreme = 1;
    self.disableexits = 1;
    maps\_utility::cqb_walk( "on" );
    var_0 = getnode( self.target, "targetname" );
    self.goalradius = 16;
    self setgoalnode( var_0 );
    wait 1;
    common_scripts\utility::waittill_either( "goal", "damage" );
    self.ignoreme = 0;
    self.disableexits = 0;
    thread _id_D291();
    var_1 = [];
    var_1[0] = self;
    thread maps\_utility::ai_delete_when_out_of_sight( var_1, 512 );
}

_id_BD6B()
{
    self endon( "death" );
    self.allowdeath = 1;
    self.ignoreme = 1;
    self.reference = self.spawner;
    self._id_AFA4 = undefined;
    self._id_C0B7 = undefined;
    self._id_C67D = undefined;
    self._id_CB21 = undefined;
    self._id_D185 = undefined;
    self._id_D094 = undefined;
    self._id_D107 = 0;
    self._id_D3B9 = 0;
    self._id_CC65 = undefined;
    self.old_goalradius = self.goalradius;
    self.goalradius = 16;
    var_0 = undefined;
    var_1 = undefined;

    if ( isdefined( self.target ) )
    {
        self.grenadeawareness = 0;
        self.ignoreall = 1;
        self._id_CC65 = [];
        self._id_CC65[0] = getnode( self.target, "targetname" );
        var_0 = self._id_CC65[0] common_scripts\utility::get_linked_ents();
        var_2 = 1;

        for (;;)
        {
            if ( isdefined( self._id_CC65[var_2 - 1].target ) )
            {
                var_1 = getnode( self._id_CC65[var_2 - 1].target, "targetname" );
                self._id_CC65[var_2] = var_1;
                var_2++;
                continue;
            }

            break;
        }
    }
    else
        var_0 = common_scripts\utility::get_linked_ents();

    self._id_C3D1 = var_0;
    self._id_BE33 = [];

    foreach ( var_4 in var_0 )
    {
        if ( var_4.code_classname == "script_origin" )
        {
            self._id_C3D1 = common_scripts\utility::array_remove( self._id_C3D1, var_4 );
            self._id_BE33 = common_scripts\utility::array_add( self._id_BE33, var_4 );
        }
    }

    if ( self._id_C3D1.size > 0 )
        level._id_CE89 = maps\_utility::array_merge( level._id_CE89, self._id_C3D1 );

    switch ( self.script_noteworthy )
    {
        case "enemy_javelin":
            maps\_utility::gun_remove();
            _id_B609();
            thread _id_B9A4();
            break;
        case "enemy_stinger":
            _id_B86A();
            thread _id_A8A5();
            break;
        case "enemy_spotter_prone":
            maps\_utility::gun_remove();
            self._id_C0B7 = "enemy_spotter_prone_idle";
            self._id_D094 = "enemy_spotter_prone_react";
            thread _id_D0F4();
            break;
        case "enemy_spotter_crouched":
            maps\_utility::gun_remove();
            self._id_C0B7 = "enemy_spotter_crouched_idle";
            self._id_D094 = "enemy_spotter_crouched_react";
            thread _id_D0F4();
            break;
    }
}

_id_B86A()
{
    self._id_AFA4 = "stinger_idle_start";
    self._id_C0B7 = "stinger_idle";
    self._id_C67D = "stinger_fire";
    self._id_D094 = "stinger_react_stand";
}

_id_B609()
{
    var_0 = "";

    if ( self.animation == "javelin_idle_B" )
        var_0 = "2";

    self._id_AFA4 = "javelin_idle_start" + var_0;
    self._id_C0B7 = "javelin_idle" + var_0;
    self._id_C67D = "javelin_fire" + var_0;
    self._id_D094 = "javelin_react" + var_0;
    self._id_CE31 = level.scr_anim["generic"]["javelin_death" + var_0];
    self._id_BFBA = level.scr_anim["generic"]["javelin_death_reloading" + var_0];

    if ( isdefined( self._id_CC65 ) )
    {
        self._id_C67D = "javelin_fire_short";
        self._id_CE31 = level.scr_anim["generic"]["javelin_death_barrett"];
        self._id_BFBA = level.scr_anim["generic"]["javelin_death_barrett"];
    }
}

_id_A8A5()
{
    self endon( "death" );
    thread _id_D5D4();
    thread _id_AEFD();
    self endon( "alerted" );
    self.reference maps\_anim::anim_generic_first_frame( self, self._id_AFA4 );
    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;
    self attach( "weapon_stinger", "TAG_INHAND", 1 );
    self._id_D474 = 1;

    while ( isalive( self ) )
    {
        self.reference thread maps\_anim::anim_generic_loop( self, self._id_C0B7, "stop_idle" );
        wait(randomfloatrange( 2, 5 ));
        self.reference notify( "stop_idle" );
        self.reference thread maps\_anim::anim_generic( self, self._id_C67D );
        self waittillmatch( "single anim", "fire_weapon" );
        var_0 = _id_D307();

        if ( isdefined( var_0 ) )
        {
            var_2 = self gettagorigin( "tag_inhand" );
            var_1 = magicbullet( "stinger", var_2, var_0.origin );
            var_1 missile_settargetent( var_0 );
        }

        self waittillmatch( "single anim", "end" );
    }
}

_id_AEFD()
{
    self waittill( "death" );
    self endon( "weapon_detached" );

    if ( isdefined( self._id_BE1B ) && !isdefined( self._id_CD7B ) )
        maps\_utility::waittill_match_or_timeout( "deathanim", "end", 4 );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_D474 ) )
    {
        if ( isdefined( self ) )
        {
            self detach( "weapon_stinger", "TAG_INHAND" );
            self._id_D474 = undefined;
        }
    }
    else if ( isdefined( self._id_BE1B ) )
    {
        if ( isdefined( self ) )
        {
            self detach( "weapon_javelin_sp", "TAG_INHAND" );
            self._id_BE1B = undefined;
        }
    }
}

_id_B9A4()
{
    self endon( "death" );
    thread _id_D5D4();
    thread _id_AEFD();
    self endon( "alerted" );
    var_0 = getnodearray( "javelin_death_node", "targetname" );

    if ( !isdefined( self._id_CC65 ) )
        self.reference maps\_anim::anim_generic_first_frame( self, self._id_AFA4 );

    var_1 = undefined;
    var_2 = undefined;
    self attach( "weapon_javelin_sp", "TAG_INHAND", 1 );
    self._id_BE1B = 1;
    var_3 = 0;

    while ( isalive( self ) )
    {
        if ( isdefined( self._id_CC65 ) )
        {
            self.deathanim = undefined;

            if ( var_3 + 1 > self._id_CC65.size )
                var_3 = 0;

            self.goalradius = 16;

            if ( common_scripts\utility::flag( "obj_commerce_defend_snipe_complete" ) && !isdefined( self.script_parameters ) )
            {
                var_4 = common_scripts\utility::getclosest( self.origin, var_0 );
                self setgoalnode( var_4 );
                self waittill( "goal" );
                self delete();
                return;
            }

            self setgoalnode( self._id_CC65[var_3] );
            self.reference = self._id_CC65[var_3];
            var_3++;
            self waittill( "goal" );
        }

        if ( common_scripts\utility::flag( "obj_commerce_defend_snipe_complete" ) && isdefined( self.script_parameters ) )
        {
            var_5 = [];
            var_5[0] = self;
            thread maps\_utility::ai_delete_when_out_of_sight( var_5, 512 );
        }

        self.reference thread maps\_anim::anim_generic_loop( self, self._id_C0B7, "stop_idle" );
        self.deathanim = self._id_CE31;

        if ( isdefined( self._id_CC65 ) )
            wait 0.25;
        else
            wait(randomfloatrange( 2, 7 ));

        self.reference notify( "stop_idle" );
        thread maps\_anim::anim_generic( self, self._id_C67D );
        self waittillmatch( "single anim", "fire_weapon" );
        var_1 = _id_D307();

        if ( isdefined( var_1 ) )
        {
            var_2 = magicbullet( "javelin_dcburn", self gettagorigin( "tag_inhand" ), var_1.origin );
            playfxontag( common_scripts\utility::getfx( "javelin_muzzle" ), self, "TAG_FLASH" );
            var_2 missile_settargetent( var_1 );
            var_2 missile_setflightmodetop();
        }

        self waittillmatch( "single anim", "end" );
    }
}

_id_D307()
{
    self endon( "death" );
    self endon( "alerted" );
    self._id_C3D1 = _id_CCE7( self._id_C3D1 );
    level._id_CE89 = _id_CCE7( level._id_CE89 );
    var_0 = undefined;

    if ( self._id_D3B9 == 1 && self._id_D107 == 1 )
    {
        if ( self._id_C3D1.size > 0 )
            var_0 = self._id_C3D1[randomint( self._id_C3D1.size )];
        else if ( level._id_CE89.size > 0 )
            var_0 = level._id_CE89[randomint( level._id_CE89.size )];
        else
            var_0 = self._id_BE33[randomint( self._id_BE33.size )];

        self._id_D3B9 = 0;
    }
    else
    {
        var_0 = self._id_BE33[randomint( self._id_BE33.size )];
        self._id_D3B9 = 1;
    }

    return var_0;
}

_id_D0F4()
{
    self endon( "death" );
    thread _id_D5D4();
    self endon( "alerted" );
    self.reference maps\_anim::anim_generic_loop( self, self._id_C0B7, "stop_idle" );
}

_id_D5D4()
{
    if ( isdefined( self.team ) && self.team == "allies" )
        return;

    self endon( "death" );
    self waittill( "alerted" );
    self.goalradius = self.old_goalradius;

    if ( isdefined( self._id_D474 ) )
    {
        if ( isdefined( self.a.pose ) && self.a.pose == "crouch" )
            self._id_D094 = "stinger_react_crouch";
    }

    if ( isdefined( self.reference ) )
        self.reference notify( "stop_idle" );

    self notify( "stop_idle" );
    maps\_utility::anim_stopanimscripted();
    maps\_anim::anim_generic( self, self._id_D094 );
    self.deathanim = undefined;

    if ( isdefined( self._id_D474 ) )
    {
        self detach( "weapon_stinger", "TAG_INHAND" );
        self notify( "weapon_detached" );
        self._id_D474 = undefined;
    }
    else if ( isdefined( self._id_BE1B ) )
    {
        self detach( "weapon_javelin_sp", "TAG_INHAND" );
        self notify( "weapon_detached" );
        self._id_BE1B = undefined;
    }

    maps\_utility::gun_recall();
}

_id_BE2F()
{
    self endon( "death" );

    if ( isdefined( self ) && isalive( self ) && !isdefined( self._id_D4A8 ) )
    {
        self notify( "alerted" );
        wait 1;
        self.ignoreme = 0;
    }
}

_id_BDB6()
{
    self endon( "death" );
    level endon( self.script_flag );

    if ( !common_scripts\utility::flag_exist( self.script_flag ) )
        common_scripts\utility::flag_init( self.script_flag );

    while ( isalive( self ) )
    {
        if ( common_scripts\utility::flag( self.script_flag ) )
            break;

        self waittill( "damage" );

        if ( !common_scripts\utility::flag( self.script_flag ) )
        {
            common_scripts\utility::flag_set( self.script_flag );
            break;
        }
    }
}

_id_B6A2()
{
    self endon( "death" );
    thread _id_D287( 1 );
    self endon( "stop_default_drone_mi" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "drone_warrior_fodder" )
        self.nocorpsedelete = 1;

    if ( isdefined( self.nocorpsedelete ) )
        thread _id_B8C5();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "ai_ambient" )
    {
        self.dontdonotetracks = 1;
        self.script_looping = 0;
    }

    self waittill( "goal" );

    if ( isdefined( self.script_noteworthy ) )
    {
        switch ( self.script_noteworthy )
        {
            case "death_by_mortar":
                thread _id_B260();
                break;
            case "drone_warrior":
                thread _id_CB7F();
                break;
            case "drone_warrior_fodder":
                thread _id_CB8B();
                break;
            default:
                self delete();
        }
    }
    else
        self delete();
}

_id_B8C5()
{
    if ( !isdefined( self ) )
        return;

    thread maps\_drone::drone_drop_real_weapon_on_death();
    self waittill( "death" );
    wait 10;

    while ( isdefined( self ) )
    {
        if ( !common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), self.origin, level.cosine["90"] ) )
            break;

        wait 5;
    }

    if ( isdefined( self ) )
        self delete();
}

_id_CB7F()
{

}

_id_CB8B()
{
    self endon( "death" );
    var_0 = self.origin;
    var_1 = 100;
    var_2 = 0;
    var_3 = undefined;

    if ( common_scripts\utility::cointoss() )
    {
        var_4 = 720;
        var_3 = spawn( "trigger_radius", var_0, var_2, var_4, var_1 );
        thread _id_B260( var_3 );
    }
    else
    {
        var_4 = randomintrange( 400, 512 );
        var_3 = spawn( "trigger_radius", var_0, var_2, var_4, var_1 );
        thread _id_A8FC( var_3 );
    }
}

_id_A8FC( var_0 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "trigger" );

    var_1 = common_scripts\utility::random( level._id_AD23 ).origin;
    thread common_scripts\utility::play_sound_in_space( "h2_wpn_desert_eagle_npc_close", self.origin );
    thread common_scripts\utility::play_sound_in_space( "bullet_large_flesh", self.origin );
    var_2 = self gettagorigin( "tag_eye" );
    var_3 = vectornormalize( var_2 - var_1 );
    playfx( common_scripts\utility::getfx( "headshot" ), var_2, var_3 );
    playfxontag( common_scripts\utility::getfx( "bodyshot" ), self, "tag_eye" );
    self notify( "stop_drone_fighting" );

    if ( common_scripts\utility::cointoss() )
        thread common_scripts\utility::play_sound_in_space( "generic_death_american_1", self.origin );

    self kill();
}

_id_B260( var_0 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "trigger" );

    if ( !level._id_A9CD )
        common_scripts\utility::play_sound_in_space( "mortar_incoming", self.origin );

    thread _id_CDA5( self.origin );
    self notify( "stop_drone_fighting" );

    if ( common_scripts\utility::cointoss() )
        thread common_scripts\utility::play_sound_in_space( "generic_death_american_1", self.origin );

    if ( !isdefined( self.animset ) )
        var_1 = level.scr_anim["generic"]["deathanim_mortar_0" + randomint( 2 )];
    else if ( issubstr( self.animset, "stand" ) || issubstr( self.animset, "crouch" ) )
        var_1 = level.scr_anim["generic"]["deathanim_mortar_01"];
    else
        var_1 = level.scr_anim["generic"]["deathanim_mortar_0" + randomint( 2 )];

    if ( isdefined( self.deathanim ) )
    {
        if ( common_scripts\utility::cointoss() )
            var_1 = self.deathanim;
    }

    self.deathanim = var_1;
    self kill();
}

_id_D287( var_0 )
{
    self waittill( "death", var_1, var_2 );

    if ( !isdefined( var_1 ) )
        return;

    if ( isdefined( var_1.targetname ) && var_1.targetname == "heli_player" && common_scripts\utility::flag( "player_on_minigun" ) )
    {
        self.skipdeathanim = 1;

        if ( isdefined( var_0 ) && var_0 == 1 )
            maps\_utility::_id_D4F3( self.origin, "explosive", 50 );
    }
}

_id_ADF6()
{
    self.ignoreme = 1;
    self.goalradius = 16;
    thread maps\_utility::magic_bullet_shield();
    self.battlechatter = 1;
}

_id_B2C8()
{
    precacherumble( "crash_heli_rumble" );
    precacherumble( "Heli_pass_above" );
    precacheitem( "missile_attackheli_dcburn" );
    precachemodel( "viewhands_us_army_dmg" );
    precacheitem( "slamraam_missile_dcburning" );
    precachemodel( "vehicle_slamraam_destroyed" );
    precachemodel( "vehicle_bradley_destroyed" );
    precachemodel( "mil_mre_chocolate01" );
    precachemodel( "weapon_binocular" );
    precacheitem( "slamraam_missile_dcburning" );
    precachemodel( "weapon_bullet_02" );
    precachemodel( "weapon_m82_MG_Setup_obj" );
    precachemodel( "projectile_cbu97_clusterbomb" );
    precachemodel( "weapon_m4m203_acog" );
    precachemodel( "weapon_stinger" );
    precachemodel( "weapon_javelin_sp" );
    precachemodel( "h2_weapon_javelin_base_obj" );
    precachemodel( "h2_dcburning_obelisk_break_a" );
    precachemodel( "h2_dcburning_obelisk_break_b" );
    precachemodel( "h2_dcburning_crutch_animated" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup" );
    precachestring( &"DCBURNING_INFO_EVAC_SITE_HEALTH" );
    precachestring( &"DCBURNING_OBJ_FOLLOW_SGT_MACEY" );
    precachestring( &"DCBURNING_OBJ_COMMERCE" );
    precachestring( &"DCBURNING_OBJ_ROOFTOP" );
    precachestring( &"DCBURNING_OBJ_HELI_RIDE" );
    precachestring( &"DCBURNING_OBJ_LINCOLN" );
    precachestring( &"DCBURNINGINFO_EVAC_SITE_HEALTH" );
    precachestring( &"DCBURNING_MISSIONFAIL_LEFT_CHOPPER" );
    precachestring( &"DCBURNING_RAN_OUT_OF_TIME" );
    precachestring( &"DCBURNING_TIME_REMAINING" );
    precachestring( &"DCBURNING_OBJ_REGROUP_WITH_TEAM" );
    precachestring( &"DCBURNING_OBJ_COMMERCE_SUPPORT_EVAC_SITE" );
    precachemodel( "adrenaline_syringe_animated" );
    precachemodel( "clotting_powder_animated" );
    precachemodel( "com_folding_chair" );
    precachemodel( "com_laptop_rugged_open" );
    precachemodel( "vehicle_mack_truck_short_destroy" );
    precachemodel( "vehicle_uaz_fabric_dsr" );
    precachemodel( "vehicle_luxurysedan_2008_destroy" );
    precacheitem( "javelin_dcburn" );
    precacheitem( "javelin_noimpact" );
    precacheitem( "stinger" );
    maps\_hud_util::_id_D3F5();
    precachemodel( "h1_mwr_com_widescreen_monitor_des" );
    precachemodel( "h1_mwr_com_widescreen_monitor_2_des" );
    precachemodel( "com_widescreen_monitor_on_1_des" );
    precachemodel( "com_widescreen_monitor_on_2_des" );
    precachemodel( "com_widescreen_monitor_on_3_des" );
    precachemodel( "h2_adrenaline_syringe_phys" );

    precachemodel( "h2_gfl_ump9_viewbody" );
    precachemodel( "h2_gfl_ump9_viewhands" );
    precachemodel( "h2_gfl_ump9_viewhands_player" );
}

_id_BB44()
{
    level._id_D1D5 = undefined;
    level._id_D24C = undefined;

    switch ( level.gameskill )
    {
        case 0:
            level._id_D24C = 3;
            level._id_D1D5 = 1;
            break;
        case 1:
            level._id_D24C = 4;
            level._id_D1D5 = 1;
            break;
        case 2:
            level._id_D24C = 4;
            level._id_D1D5 = 1;
            break;
        case 3:
            level._id_D24C = 4;
            level._id_D1D5 = 1;
            break;
    }

    common_scripts\utility::flag_set( "difficulty_initialized" );
}

_id_B6CD()
{
    common_scripts\utility::array_thread( level._id_B589, common_scripts\utility::trigger_off );
}

_id_D139()
{
    for (;;)
    {
        wait(randomfloatrange( 0.05, 0.1 ));
        self setlightintensity( randomfloatrange( 1, 1.5 ) );
    }
}

_id_BC28()
{
    for (;;)
    {
        wait(randomfloatrange( 0.05, 0.1 ));
        self setlightintensity( randomfloatrange( 0.8, 1.1 ) );
    }
}

_id_B8E4()
{
    for (;;)
    {
        self setlightintensity( 0 );
        wait 1;
        self setlightintensity( 1.4 );
        wait 0.1;
    }
}

lights()
{
    var_0 = getentarray( "firelight_flicker", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_CB02 );
    var_1 = getentarray( "flickerlight1", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 thread _id_B906();

    var_5 = getentarray( "fluorescentFlicker", "targetname" );

    foreach ( var_7 in var_5 )
        var_7 thread _id_D139();

    var_5 = getentarray( "fluorescentFlickerBig", "targetname" );

    foreach ( var_7 in var_5 )
        var_7 thread _id_BC28();

    var_11 = getentarray( "strobe1", "targetname" );

    foreach ( var_13 in var_11 )
        var_13 thread _id_B8E4();
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
        level.squad = [];
        level._id_AC03 = maps\_utility::spawn_targetname( "teamLeader" );
        level._id_C280 = maps\_utility::spawn_targetname( "friendly02" );
        level._id_BBBD = maps\_utility::spawn_targetname( "friendly03" );
        level.squad[0] = level._id_AC03;
        level.squad[1] = level._id_C280;
        level.squad[2] = level._id_BBBD;
        common_scripts\utility::array_thread( level.squad, ::_id_B5DB );
        level.excludedai = [];
        level.excludedai[0] = level._id_AC03;
    }

    level._id_B8B6 = level.squad;

    if ( var_0 == "Bunker" )
        return;

    if ( isdefined( var_2 ) && var_2 == 1 )
    {
        var_3 = getnodearray( "playerStart" + var_0, "targetname" );
        maps\_utility::teleport_players( var_3 );
    }

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
                    case "nodeLeader":
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
}

_id_B5DB()
{
    self.animname = "generic";

    if ( self == level._id_AC03 || self == level._id_C280 )
    {
        thread maps\_utility::magic_bullet_shield();
        maps\_utility::setflashbangimmunity( 1 );
    }
}

_id_CCAB()
{
    level.fixednodesaferadius_default = 128;

    foreach ( var_1 in level.squad )
    {
        if ( isdefined( self ) )
            self.fixednodesaferadius = level.fixednodesaferadius_default;
    }
}

_id_AE40()
{
    level.fixednodesaferadius_default = undefined;

    foreach ( var_1 in level.squad )
    {
        if ( isdefined( self ) )
            self.fixednodesaferadius = 64;
    }
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

_id_BA77()
{
    var_0 = common_scripts\utility::getstruct( self.script_noteworthy, "script_noteworthy" );
    var_1 = distance( self.origin, var_0.origin );
    maps\_utility::vehicle_liftoff( var_1 );
    thread maps\_vehicle::vehicle_paths( var_0 );
}

_id_B0FB( var_0, var_1 )
{
    _id_AEA1();
    var_2 = maps\_utility::getvehiclespawner( var_0 );
    var_2.target = var_1.targetname;
    var_2.origin = var_1.origin;

    if ( isdefined( var_1.angles ) )
        var_2.angles = ( var_1.angles[0], var_1.angles[1], var_2.angles[2] );

    var_3 = maps\_vehicle::spawn_vehicle_from_targetname( var_0 );
    var_3 thread maps\_vehicle::vehicle_paths( var_1 );
    var_3 maps\_vehicle::vehicle_ai_event( "idle_alert_to_casual" );
    return var_3;
}

achievement_bird_hunter_init()
{
    level.birdhunterkill = 0;
    thread achievement_bird_hunter_manager();
}

achievement_bird_hunter_manager()
{
    while ( level.birdhunterkill < 10 )
        waitframe();

    maps\_utility::giveachievement_wrapper( "BIRD_HUNTER" );
    common_scripts\utility::flag_set( "achievement_bird_hunter_done" );
    level notify( "achievement_bird_hunter_done" );
}

achievement_bird_hunter()
{
    level endon( "achievement_bird_hunter_done" );
    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
    {
        if ( isdefined( var_1 ) && var_1 == "MOD_PROJECTILE" )
        {
            if ( isdefined( var_2 ) && var_2 == "javelin_dcburn" )
                level.birdhunterkill++;
        }
    }
}

_id_B90C()
{
    if ( getdvar( "dc_debug" ) == "1" && isdefined( self.spawner.targetname ) )
        thread maps\_utility::debug_message( self.spawner.targetname, self.origin, 9999, self );

    if ( maps\_vehicle_code::ischeap() )
        thread maps\_vehicle_code::friendlyfire_shield();

    if ( maps\_vehicle::ishelicopter() && !common_scripts\utility::flag( "achievement_bird_hunter_done" ) )
        thread achievement_bird_hunter();

    switch ( self.vehicletype )
    {
        case "latvee":
        case "laatpv_minigun":
        case "laatpv":
            thread _id_D227();
            break;
        case "mi17":
            thread _id_A946();
            break;
        case "littlebird":
            thread _id_BB07();
            break;
        case "m1a1":
            thread _id_BD2E();
            break;
        case "btr80":
            thread _id_D33C();
            break;
        case "cobra":
            thread _id_AC1C();
            break;
        case "mi28":
            thread _id_B1DD();
            break;
        case "slamraam":
            thread _id_D3C2();
            break;
    }
}

_id_D3C2()
{
    self endon( "death" );
    self setturrettargetent( level.player );

    foreach ( var_1 in self.missiletags )
        self attach( self.missilemodel, var_1 );

    self._id_C7E2 = 3;
    thread _id_C766();
    var_3 = undefined;
    var_1 = undefined;
    var_4 = level.player;

    while ( isdefined( self ) && self.missiletags.size > 0 )
    {
        self waittill( "fire" );
        var_1 = common_scripts\utility::random( self.missiletags );
        self.missiletags = common_scripts\utility::array_remove( self.missiletags, var_1 );
        self detach( self.missilemodel, var_1 );
        var_3 = magicbullet( "slamraam_missile_dcburning", self gettagorigin( var_1 ), var_4.origin );
        thread maps\dcburning_aud::_id_D186( var_3 );

        if ( self.missiletags.size < 1 )
            break;
    }

    self clearturrettargetent();
}

_id_B6D8()
{
    var_0 = spawn( "script_origin", self.origin + ( 0.0, 0.0, 0.0 ) );
    var_0 linkto( self );

    while ( isdefined( self ) )
    {
        var_0 playrumblelooponentity( "crash_heli_rumble" );
        wait 0.4;
    }

    var_0 delete();
}

_id_B1DD()
{
    self setmaxpitchroll( 20, 40 );

    if ( isdefined( self.script_parameters ) && self.script_parameters == "custom_rumble" )
        thread _id_B6D8();

    if ( isdefined( self.targetname ) && issubstr( self.targetname, "ambient" ) )
    {
        thread _id_CED0();
        return;
    }

    self.firingmissiles = 0;
    self.enablerocketdeath = 1;
    self.defaultweapon = "havoc_turret";
    self._id_C7E2 = 3;
    thread vehicle_scripts\_attack_heli::heli_default_missiles_on( "missile_attackheli_dcburn" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "ambient" )
    {

    }
    else if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "ambient_attacker" )
    {

    }
    else
    {
        target_set( self, ( 0.0, 0.0, -80.0 ) );
        target_setjavelinonly( self, 1 );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "regular" )
        return;

    thread _id_C766();
}

_id_CED0()
{
    self.firingmissiles = 0;
    self.defaultweapon = "havoc_turret";
    thread vehicle_scripts\_attack_heli::heli_default_missiles_on( "missile_attackheli_dcburn" );
}

_id_D227()
{
    self endon( "death" );
}

_id_A946()
{
    self endon( "death" );
}

_id_BB07()
{
    self endon( "death" );
    maps\_vehicle::godon();

    if ( self.classname == "script_vehicle_littlebird_armed" )
    {
        thread vehicle_scripts\_attack_heli::heli_default_missiles_on( "missile_attackheli_dcburn" );
        waittillframeend;

        foreach ( var_1 in self.mgturret )
        {
            var_1 setmode( "manual" );
            var_1 stopfiring();
        }
    }
}

_id_AEA1()
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );

    if ( isdefined( self.riders ) && self.riders.size )
        common_scripts\utility::array_thread( self.riders, ::_id_BA48 );

    if ( isdefined( self.mgturret ) )
    {
        foreach ( var_1 in self.mgturret )
        {
            if ( isdefined( var_1 ) )
                var_1 delete();
        }
    }

    maps\_vehicle::godoff();
    self delete();
}

_id_BD2E()
{
    self endon( "death" );
}

_id_D33C()
{
    if ( isdefined( self.targetname ) && self.targetname == "btr80s_end" )
        return;

    self._id_C7E2 = 3;
    target_set( self, ( 0.0, 0.0, 0.0 ) );
    target_setjavelinonly( self, 1 );
    target_setattackmode( self, "top" );
    thread _id_C766();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "no_ai" )
        return;

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "crows_nest_bmps" )
        return;

    if ( !level._id_A9CD )
        return;
    else
        thread _id_AD9A();
}

_id_AC1C()
{
    self endon( "death" );
}

_id_CFDD()
{
    self endon( "death" );
}

_id_C766()
{
    self endon( "death" );
    maps\_vehicle::godon();
    var_0 = undefined;
    var_1 = undefined;

    while ( isdefined( self ) )
    {
        self waittill( "damage", var_2, var_0, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( isstring( var_0 ) )
            continue;

        if ( isdefined( var_0.code_classname ) && var_0.code_classname == "misc_turret" )
            continue;

        if ( isdefined( var_0.script_team ) && var_0.script_team == "axis" )
            continue;

        if ( isdefined( var_0.team ) && var_0.team == "axis" )
            continue;

        if ( isdefined( level._id_CED1 ) && var_0 == level._id_CED1 )
        {
            if ( isdefined( self._id_CDF2 ) )
                continue;

            self._id_C7E2--;

            if ( self._id_C7E2 <= 0 )
                break;
            else
                continue;
        }

        if ( !isdefined( var_5 ) || !isdefined( var_10 ) )
            continue;

        if ( var_5 == "MOD_PROJECTILE" && issubstr( var_10, "javelin" ) )
        {
            if ( isplayer( var_0 ) )
            {
                var_1 = 1;
                self.attackerweaponname = var_10;
                self.attackertype = var_5;
            }

            break;
        }
    }

    if ( isdefined( level._id_CED1 ) && var_0 == level._id_CED1 )
    {

    }
    else if ( !isplayer( var_0 ) )
    {
        self notify( "killed_by_friendly" );

        if ( getdvar( "dc_debug" ) == "1" )
            iprintlnbold( "friendly just owned a vehicle" );

        level._id_D1D5--;
        thread _id_C6A8();
    }

    thread vehicle_death( var_1 );
}

_id_AD9A()
{
    self endon( "death" );
    thread maps\_vehicle::mgoff();
    self._id_BF51 = 0;
    var_0 = undefined;

    while ( isdefined( self ) )
    {
        if ( level.player.ignoreme )
        {
            wait 1;
            continue;
        }

        wait 0.05;

        if ( distancesquared( level.player.origin, self.origin ) > level._id_C3F1 )
            var_0 = undefined;
        else
            var_0 = level.player;

        if ( isdefined( var_0 ) && isplayer( var_0 ) )
        {
            var_1 = 0;
            var_1 = sighttracepassed( self.origin, level.player.origin + ( 0.0, 0.0, 0.0 ), 0, self );

            if ( !var_1 )
                var_0 = undefined;
        }

        if ( !isdefined( var_0 ) )
            var_0 = _id_AFDE();

        if ( isdefined( var_0 ) && isalive( var_0 ) )
        {
            var_2 = var_0.origin + ( 0.0, 0.0, 32.0 );
            self setturrettargetvec( var_2 );
            var_3 = randomfloatrange( 2, 3 );
            common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", var_3 );

            if ( isdefined( var_0 ) && isplayer( var_0 ) )
            {
                var_4 = level.player geteye();
                var_5 = common_scripts\utility::within_fov( var_4, level._id_CED1.angles + ( 0.0, -90.0, 0.0 ), self.origin, level.cosine["45"] );

                if ( var_5 )
                {
                    if ( !self._id_BF51 )
                        thread _id_B002();
                }
            }

            if ( isdefined( var_0 ) && !isplayer( var_0 ) )
            {
                if ( !self._id_BF51 )
                    thread _id_B002();
            }
        }
    }
}

_id_B002()
{
    self endon( "death" );
    var_0 = undefined;
    var_1 = undefined;

    switch ( self.vehicletype )
    {
        case "btr80":
            var_0 = 0.5;
            var_1 = randomintrange( 3, 6 );
            break;
        default:
    }

    self._id_BF51 = 1;
    var_2 = 0;

    while ( var_2 < var_1 )
    {
        var_2++;
        wait(var_0);
        self fireweapon();
    }

    self._id_BF51 = 0;
}

_id_C6A8()
{
    if ( common_scripts\utility::flag( "obj_commerce_defend_javelin_complete" ) )
    {
        level._id_C8A5 = undefined;
        return;
    }

    self notify( "cooldown_started" );
    self endon( "cooldown_started" );
    level._id_C8A5 = 0;
    wait 10;
    level._id_C8A5 = 1;
}

vehicle_death( var_0 )
{
    if ( !level._id_A9CD )
    {
        if ( target_istarget( self ) )
            target_remove( self );
    }

    maps\_vehicle::godoff();
    self notify( "death", level.player, self.attackertype, self.attackerweaponname );

    if ( isdefined( var_0 ) )
    {
        earthquake( 0.25, 0.75, level.player.origin, 1250 );
        level.player playrumblelooponentity( "damage_light" );
    }
}

_id_BAA7()
{
    self endon( "death" );
    var_0 = getent( self.target, "targetname" );
    thread common_scripts\utility::delete_on_death( var_0 );
    var_1 = self.animation;
    self.eaniment = spawn( "script_origin", var_0.origin );
    thread common_scripts\utility::delete_on_death( self.eaniment );
    var_2 = undefined;

    switch ( var_0.model )
    {
        case "com_folding_table":
            if ( isdefined( self.script_parameters ) )
                self.eaniment.origin += ( 0.0, -40.0, 0.0 );

            self.eaniment.angles = var_0.angles + ( 0.0, 0.0, 0.0 );
            self.eaniment maps\_anim::anim_generic_first_frame( self, var_1 + "_start" );
            var_3 = spawn( "script_model", self.origin );
            var_3 setmodel( "weapon_uav_control_unit" );
            thread common_scripts\utility::delete_on_death( var_3 );
            var_3.angles = self.angles + ( 0.0, 0.0, 0.0 );
            var_4 = spawnstruct();
            var_4.entity = var_3;
            var_4.forward = 23;
            var_4.up = 33.5;
            var_4.right = 1;
            var_4.yaw = 0;
            var_4 maps\_utility::translate_local();
            var_5 = spawn( "script_model", self.origin );
            var_5 setmodel( "com_folding_chair" );
            var_5.angles = self.angles + ( 0.0, 0.0, 0.0 );
            thread common_scripts\utility::delete_on_death( var_5 );
            var_4 = spawnstruct();
            var_4.entity = var_5;
            var_4.forward = -5;
            var_4 maps\_utility::translate_local();

            if ( var_1 == "laptop_officer_idle" )
            {
                var_5 delete();
                var_3 delete();
            }

            break;
        case "mil_bunker_bed2":
            maps\_utility::gun_remove();
            self.eaniment.angles = var_0.angles + ( 0.0, 90.0, 0.0 );
            var_4 = spawnstruct();
            var_4.entity = self.eaniment;
            var_4.up = 28;
            var_4 maps\_utility::translate_local();
            self.eaniment maps\_anim::anim_generic_first_frame( self, var_1 + "_start" );
            break;
        case "bc_cot":
            maps\_utility::gun_remove();
            var_4 = spawnstruct();
            var_4.entity = self.eaniment;

            if ( var_1 == "cargoship_sleeping_guy_idle_1" || var_1 == "cargoship_sleeping_guy_idle_2" )
            {
                var_4.up = 22;
                var_4.yaw = 180;
                var_4.forward = 4;
                var_4 maps\_utility::translate_local();
            }
            else if ( var_1 == "afgan_caves_sleeping_guard_idle" )
            {
                var_4.yaw = 180;
                var_4 maps\_utility::translate_local();
            }
            else if ( var_1 == "DC_Burning_CPR_wounded" || var_1 == "DC_Burning_CPR_medic" )
            {
                var_2 = "player_bunker_walk_01";
                var_4.yaw = 195;
                var_4 maps\_utility::translate_local();
            }
            else
            {
                var_4.yaw = 90;
                var_4 maps\_utility::translate_local();
            }

            break;
        case "stretcher_animated":
            maps\_utility::gun_remove();
            self.eaniment.angles = var_0.angles + ( 0.0, 90.0, 0.0 );
            var_4 = spawnstruct();
            var_4.entity = self.eaniment;
            var_4.up = -1;
            var_4 maps\_utility::translate_local();
            self.eaniment maps\_anim::anim_generic_first_frame( self, var_1 + "_start" );
            break;
        case "bc_stretcher":
            maps\_utility::gun_remove();
            self.eaniment.angles = var_0.angles + ( 0.0, 0.0, 0.0 );

            if ( var_1 == "afgan_caves_sleeping_guard_idle" )
            {
                var_4 = spawnstruct();
                var_4.entity = self.eaniment;
                var_4.up = -12;
                var_4.right = 2;
                var_4 maps\_utility::translate_local();
            }
            else
            {
                var_4 = spawnstruct();
                var_4.entity = self.eaniment;
                var_4.up = 8;
                var_4 maps\_utility::translate_local();
            }

            self.eaniment maps\_anim::anim_generic_first_frame( self, var_1 + "_start" );
            break;
        default:
            maps\_utility::gun_remove();
            self.eaniment.angles = var_0.angles;
            break;
    }

    thread _id_BBA1( var_1, var_2 );
}

_id_C858()
{
    self waittill( "death" );

    if ( isdefined( self.eaniment ) && !isspawner( self.eaniment ) )
        self.eaniment delete();
}

_id_C74D( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    self.script_flag = var_1.script_flag;
    self.animation = var_1.animation;
    self.eaniment = var_1;
    self.target = var_1.target;
    var_2 = self.animation;
    var_3 = undefined;
    thread _id_BBA1( var_2, var_3 );
}

_id_D0A1()
{
    self endon( "death" );
    var_0 = self.animation;
    var_1 = 0;

    if ( !isdefined( self.eaniment ) )
        self.eaniment = self.spawner;

    var_2 = "player_bunker_walk_01";

    switch ( var_0 )
    {
        case "death_explosion_run_F_v1":
        case "civilian_run_2_crawldeath":
            maps\_utility::gun_remove();
            self.skipdeathanim = 1;
            self.noragdoll = 1;
            break;
        case "DC_Burning_artillery_reaction_v1_idle":
        case "DC_Burning_artillery_reaction_v2_idle":
        case "DC_Burning_artillery_reaction_v3_idle":
        case "DC_Burning_artillery_reaction_v4_idle":
        case "h2_dc_burning_bunker_stumble":
        case "training_latvee_wounded":
        case "training_latvee_soldier":
            var_2 = "player_bunker_walk_01";
            maps\_utility::gun_remove();
            break;
        case "bunker_toss_idle_guy1":
            maps\_utility::cqb_walk( "on" );
            break;
        case "unarmed_panickedrun_loop_V2":
            maps\_utility::set_generic_run_anim( "unarmed_panickedrun_loop_V2" );
            maps\_utility::gun_remove();
            self.disablearrivals = 1;
            self.disableexits = 1;
            self.goalradius = 16;
            self waittill( "goal" );
            maps\_utility::clear_run_anim();
            wait 1;
            maps\_utility::gun_recall();
            var_1 = 1;
            return;
        case "roadkill_cover_radio_soldier2":
            break;
        case "roadkill_cover_spotter":
            self attach( "weapon_binocular", "TAG_INHAND", 1 );
            break;
        case "roadkill_cover_radio_soldier3":
            self.eaniment.origin += ( 0.0, 0.0, 8.0 );
            self attach( "mil_mre_chocolate01", "TAG_INHAND", 1 );
            break;
        case "favela_run_and_wave":
            break;
        case "h2_dcburning_controlroom_ranger05":
            self.eaniment maps\_anim::anim_generic_first_frame( self, var_0 );
            wait 9.5;
            break;
        case "h2_dcburning_controlroom_ranger06":
            maps\_utility::gun_remove();
            self.eaniment maps\_anim::anim_generic_first_frame( self, var_0 );
            wait 9.5;
            break;
        case "h2_dcburning_medicalbay_soldier_B":
            maps\_utility::gun_remove();
            // setheadmodel( "head_us_army_d" );
            break;
        case "h2_dc_burning_carrying_Injured_wounded":
            maps\_utility::gun_remove();
            // setheadmodel( "head_us_army_a" );
            break;
        case "h2_dcburning_medicalbay_soldier_J_idle":
            maps\_utility::gun_remove();
            self attach( "h2_weapon_m4_base", "tag_weapon_left" );
            break;
        case "h2_dcburning_controlroom_ranger01":
            maps\_utility::gun_remove();
            self attach( "h2_dcburning_crutch_animated", "tag_weapon_right" );
            break;
        default:
            maps\_utility::gun_remove();
            break;
    }

    thread _id_BBA1( var_0, var_2 );
}

setheadmodel( var_0 )
{
    if ( isdefined( self.headmodel ) )
        self detach( self.headmodel );

    self attach( var_0, "", 1 );
    self.headmodel = var_0;
}

scripted_anim_props( var_0, var_1 )
{
    self.animname = var_1;
    maps\_utility::assign_animtree();
    var_2 = randomint( 3 );
    maps\_utility::delaythread( var_2, maps\_anim::anim_loop_solo, self, var_0 );
}

_id_D24A( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        thread common_scripts\utility::play_sound_in_space( var_0 );
        self waittillmatch( "looping anim", "end" );
    }
}

_id_BBA1( var_0, var_1 )
{
    self endon( "death" );
    _id_BCCC();
    var_2 = undefined;
    var_3 = undefined;
    var_4 = 0;

    if ( isdefined( self.target ) )
        var_2 = getnode( self.target, "targetname" );

    thread _id_C858();

    if ( isarray( level.scr_anim["generic"][var_0] ) )
    {
        var_4 = 1;
        self.eaniment thread maps\_anim::anim_generic_loop( self, var_0, "stop_idle" );
        var_3 = var_0 + "_go";

        if ( anim_exists( var_3 ) )
            var_0 = var_3;
        else
            var_3 = undefined;
    }
    else
        self.eaniment maps\_anim::anim_generic_first_frame( self, var_0 );

    if ( isdefined( self.script_flag ) )
    {
        if ( isdefined( var_1 ) )
            common_scripts\utility::flag_wait_either( self.script_flag, var_1 );
        else
            common_scripts\utility::flag_wait( self.script_flag );
    }

    switch ( var_0 )
    {
        case "death_explosion_run_F_v1":
        case "civilian_run_2_crawldeath":
            thread _id_CDA5( self.origin );
            break;
    }

    if ( isdefined( var_2 ) )
    {
        self.disablearrivals = 1;
        self.disableexits = 1;
    }

    if ( !var_4 )
        self.eaniment maps\_anim::anim_generic( self, var_0 );

    if ( isdefined( var_3 ) )
    {
        self.eaniment notify( "stop_idle" );
        self.eaniment maps\_anim::anim_generic( self, var_3 );
    }

    switch ( var_0 )
    {
        case "civilian_run_2_crawldeath":
            self kill();
            break;
    }

    if ( isdefined( var_2 ) )
    {
        self setgoalnode( var_2 );
        wait 1;
        self.disablearrivals = 0;
        self.disableexits = 0;
        self waittill( "goal" );

        if ( isdefined( self.cqbwalking ) && self.cqbwalking )
            maps\_utility::cqb_walk( "off" );
    }
    else if ( isdefined( level.scr_anim["generic"][var_0 + "_idle"] ) )
        self.eaniment thread maps\_anim::anim_generic_loop( self, var_0 + "_idle", "stop_idle" );

    if ( anim_exists( var_0 + "_react" ) )
    {
        if ( !var_4 )
            var_0 += "_idle";

        var_5 = var_0 + "_react";

        if ( anim_exists( var_0 + "_react2" ) )
            var_6 = var_0 + "_react2";
        else
            var_6 = var_5;

        while ( isdefined( self ) )
        {
            level waittill( "mortar_hit" );
            self.eaniment notify( "stop_idle" );
            self notify( "stop_idle" );
            waittillframeend;

            if ( randomint( 100 ) > 50 )
                self.eaniment maps\_anim::anim_generic( self, var_5 );
            else
                self.eaniment maps\_anim::anim_generic( self, var_6 );

            self.eaniment thread maps\_anim::anim_generic_loop( self, var_0, "stop_idle" );
        }
    }
}

_id_CDA5( var_0 )
{
    playfx( level._effect["mortar"]["dirt"], var_0 );
    thread common_scripts\utility::play_sound_in_space( level.scr_sound["mortar"]["dirt"], var_0 );
    earthquake( 0.25, 0.75, var_0, 1250 );
}

_id_C488()
{
    var_0 = randomint( 2 );
    _id_ACF6( "dcburn_javelins_incoming_0" + var_0 );
}

_id_CD38()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0 linkto( self );
    self waittill( "death" );
    earthquake( 1.2, 1.5, var_0.origin, 1600 );
    wait 0.05;
    var_0 delete();
}

_id_CA9D( var_0 )
{
    var_1 = magicbullet( "javelin_noimpact", var_0.origin, self.origin );
    playfx( common_scripts\utility::getfx( "javelin_muzzle" ), var_0.origin );
    var_1 thread _id_CD38();
    var_1 missile_settargetent( self );
    var_1 missile_setflightmodetop();

    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( isdefined( var_3.classname ) && var_3.classname == "worldspawn" && isdefined( var_2 ) && var_2 > 24 )
            break;
    }

    if ( isdefined( self ) )
        self notify( "death" );
}

_id_BF62()
{
    level.player.ignoreme = 1;
    level.squad = maps\_utility::remove_dead_from_array( level.squad );

    for ( var_0 = 0; var_0 < level.squad.size; var_0++ )
    {
        if ( !isdefined( level.squad[var_0] ) )
            continue;

        level.squad[var_0].ignoreme = 1;
        level.squad[var_0] setthreatbiasgroup( "oblivious" );
    }
}

_id_D432()
{
    level.player.ignoreme = 0;
    level.squad = maps\_utility::remove_dead_from_array( level.squad );

    for ( var_0 = 0; var_0 < level.squad.size; var_0++ )
    {
        if ( !isdefined( level.squad[var_0] ) )
            continue;

        level.squad[var_0].ignoreme = 0;
        level.squad[var_0] setthreatbiasgroup( "allies" );
    }
}

_id_B142()
{
    thread _id_C35C();
    maps\_utility::setflashbangimmunity( 1 );
    self.baseaccuracy = 0.1;
    self.ignoreall = 1;
    var_0 = getnode( self.target, "targetname" );

    if ( isdefined( var_0 ) )
    {
        self setgoalnode( var_0 );
        self.goalradius = 16;
    }
}

_id_B906()
{
    while ( isdefined( self ) )
    {
        wait(randomfloatrange( 0.05, 0.1 ));
        self setlightintensity( randomfloatrange( 0.6, 1.8 ) );
    }
}

_id_CB02()
{
    while ( isdefined( self ) )
    {
        wait(randomfloatrange( 0.05, 0.1 ));
        self setlightintensity( randomfloatrange( 1.2, 2.2 ) );
    }
}

_id_B02E( var_0, var_1, var_2 )
{
    var_3 = getent( self.target, "targetname" );
    playfxontag( common_scripts\utility::getfx( "flare_ambient" ), self, "TAG_FIRE_FX" );
    thread common_scripts\utility::play_sound_in_space( "flare_ignite", self.origin );
    var_3 _id_CF7D( var_0, var_2 );
    var_3 _id_BA88( var_1 );
    thread _id_BE10();
}

_id_CF7D( var_0, var_1 )
{
    self setlightintensity( 0 );
    var_2 = 0;
    var_3 = ( var_1 - 0 ) / ( var_0 / 0.05 );
    var_4 = 0;
    var_5 = undefined;

    while ( var_4 < var_0 )
    {
        var_2 += var_3;
        var_5 = randomfloatrange( -0.05, 0.05 );
        var_2 += var_5;

        if ( var_2 < 0 )
            break;

        self setlightintensity( var_2 );
        var_4 += 0.05;
        wait 0.05;
    }
}

_id_BA88( var_0 )
{
    var_1 = self getlightintensity();
    var_2 = ( var_1 - 0 ) / ( var_0 / 0.05 );
    var_3 = 0;
    var_4 = undefined;

    while ( var_3 < var_0 )
    {
        var_1 -= var_2;
        var_4 = randomfloatrange( -0.05, 0.05 );
        var_1 += var_4;

        if ( var_1 < 2 )
            break;

        self setlightintensity( var_1 );
        var_3 += 0.05;
        wait 0.05;
    }
}

_id_BE10( var_0, var_1 )
{
    var_2 = getent( self.target, "targetname" );

    if ( !isdefined( var_0 ) )
        var_0 = 0.6;

    if ( !isdefined( var_1 ) )
        var_1 = 1.8;

    thread common_scripts\utility::play_loop_sound_on_entity( "flare_burn_loop" );

    while ( isdefined( self ) )
    {
        wait(randomfloatrange( 0.05, 0.1 ));
        var_2 setlightintensity( randomfloatrange( var_0, var_1 ) );
    }
}

anim_exists( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "generic";

    if ( isdefined( level.scr_anim[var_1][var_0] ) )
        return 1;
    else
        return 0;
}

_id_ACF6( var_0 )
{
    var_1 = maps\_utility::get_closest_ai_exclude( level.player.origin, "allies", level.excludedai );

    if ( isdefined( var_1 ) )
        var_1 common_scripts\utility::play_sound_in_space( level.scr_sound[var_0] );
    else
        iprintln( "unable to play random friendly dialogue " + var_0 + " because couldn't find an AI" );
}

triggersenable( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, var_1 );

    if ( var_2 == 1 )
        common_scripts\utility::array_thread( var_3, common_scripts\utility::trigger_on );
    else
        common_scripts\utility::array_thread( var_3, common_scripts\utility::trigger_off );
}

hideall( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = getentarray( "hide", "script_noteworthy" );

    common_scripts\utility::array_thread( var_0, maps\_utility::hide_entity );
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

set_threatbias( var_0 )
{
    self._id_C9B4 = level.player.threatbias;
    self.threatbias = var_0;
}

_id_B7C6()
{
    if ( isdefined( self._id_C9B4 ) )
        self.threatbias = self._id_C9B4;
}

_id_B720( var_0, var_1 )
{
    maps\_utility::waittill_dead_or_dying( var_0 );
    common_scripts\utility::flag_set( var_1 );
}

dialogue_execute( var_0 )
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );
    maps\_utility::dialogue_queue( var_0 );
}

_id_C172( var_0 )
{
    if ( getdvar( "dc_dialog" ) == "1" )
        _id_CEAE( level.scr_sound[var_0], level._id_C248 );
}

_id_CEAE( var_0, var_1 )
{
    var_2 = 0.5;
    level endon( "clearing_hints" );

    if ( isdefined( level._id_BED3 ) )
        level._id_BED3 maps\_hud_util::destroyelem();

    level._id_BED3 = maps\_hud_util::createfontstring( "default", 1.5 );
    level._id_BED3 maps\_hud_util::setpoint( "BOTTOM", undefined, 0, -40 );
    level._id_BED3.color = ( 1.0, 1.0, 1.0 );
    level._id_BED3 settext( var_0 );
    level._id_BED3.alpha = 0;
    level._id_BED3 fadeovertime( 0.5 );
    level._id_BED3.alpha = 1;
    level._id_BED3.sort = 1;
    wait 0.5;
    level._id_BED3 endon( "death" );

    if ( isdefined( var_1 ) )
        wait(var_1);
    else
        return;

    level._id_BED3 fadeovertime( var_2 );
    level._id_BED3.alpha = 0;
    wait(var_2);
    level._id_BED3 maps\_hud_util::destroyelem();
}

vehicles_crowsnest_defend_animated_think()
{
    if ( !isdefined( self.model ) || self.model != "vehicle_ch46e_low" )
        return;

    maps\_utility::assign_animtree( "seaknight" );
    self _meth_8571();
    thread _id_AE2E();
}

_id_D0A7()
{
    self hide();
    var_0 = undefined;

    if ( isdefined( self.target ) )
        var_0 = getentarray( self.target, "targetname" );

    var_1 = spawn( "script_origin", self.origin );
    thread common_scripts\utility::delete_on_death( var_1 );
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_2 = undefined;
    var_3 = "sniper_escape_ch46_take_off_idle";
    var_4 = spawn( "script_origin", self.origin );
    var_1 thread _id_C865( self );
    var_4 thread _id_C865( self );
    var_5 = undefined;
    var_6 = undefined;
    var_7 = 0;

    switch ( self.animation )
    {
        case "h2_sniper_escape_ch46_takeoff":
            self.animname = "seaknight";
            var_5 = self._id_A95C;
            var_6 = "ch46_take_off";
            var_7 = 1;
            break;
    }

    maps\_utility::assign_animtree( self.animname );
    var_1 maps\_anim::anim_first_frame_solo( self, self.animation );
    self waittill( "spawn" );

    if ( isdefined( var_0 ) )
    {
        var_8 = [];

        foreach ( var_10 in var_0 )
            var_8[var_8.size] = thread maps\_utility::dronespawn( var_10 );

        maps\_utility::delaythread( 0.05, ::_id_C292, var_8 );
    }

    self show();

    if ( anim_exists( var_3, self.animname ) )
        var_1 thread maps\_anim::anim_loop_solo( self, var_3, "stop_idle" );

    if ( var_7 )
        thread _id_AE2E();

    if ( isdefined( var_5 ) )
        thread common_scripts\utility::play_loop_sound_on_entity( var_5, undefined, 0.5, 3 );

    if ( isdefined( var_6 ) )
        thread _id_AA52( var_4, var_6 );

    self waittill( "play_anim" );
    maps\_utility::notify_delay( "taking_off", 4 );
    var_1 notify( "stop_idle" );

    if ( isdefined( self.targetname ) && self.targetname == "seaknight_loader_start2" )
    {
        self linkto( var_1 );
        var_1 thread _id_BFF0();
    }

    var_1 maps\_anim::anim_single_solo( self, self.animation );
    self delete();
}

_id_BFF0()
{
    wait 5;
    self moveto( self.origin + ( 0.0, 0.0, 550.0 ), 10 );
}

_id_C292( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in var_0 )
    {
        var_1++;
        var_3.dontdonotetracks = 1;
        var_3._id_BA86 = var_1;
        maps\_anim::anim_generic_first_frame( var_3, "ch46_load_" + var_3._id_BA86, "tag_detach" );
    }

    self waittill( "load_riders" );
    var_5 = undefined;
    self notify( "stop_rider_idle" );

    foreach ( var_3 in var_0 )
    {
        thread maps\_anim::anim_generic( var_3, "ch46_load_" + var_3._id_BA86, "tag_detach" );
        var_3 thread _id_D4CD();
        var_5 = "ch46_load_" + var_3._id_BA86;
    }

    var_8 = getanimlength( level.scr_anim["generic"][var_5] );
    wait(var_8 - 2);
    self notify( "riders_loaded" );
}

_id_D4CD()
{
    self endon( "death" );
    self waittillmatch( "single anim", "end" );
    _id_BA48();
}

_id_AA52( var_0, var_1 )
{
    self endon( "death" );
    self endon( "taking_off" );

    while ( isdefined( var_0 ) )
    {
        playfx( common_scripts\utility::getfx( var_1 ), var_0.origin );
        wait 0.1;
    }
}

_id_AE2E()
{
    self endon( "death" );
    var_0 = maps\_utility::getanim( "rotors" );
    var_1 = getanimlength( var_0 );

    for (;;)
    {
        if ( !isdefined( self ) )
            break;

        self setanim( var_0 );
        wait(var_1);
    }
}

_id_B677( var_0 )
{
    self endon( "death" );
    wait(var_0);
}

_id_D5C4( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( var_0 == "all" )
        var_3 = getaiarray();
    else
        var_3 = getaiarray( var_0 );

    if ( isdefined( var_2 ) )
        common_scripts\utility::array_thread( var_3, ::_id_BA48 );
    else
    {
        if ( !isdefined( var_1 ) )
            var_1 = 1024;

        thread maps\_utility::ai_delete_when_out_of_sight( var_3, var_1 );
    }
}

_id_B933( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "all";

    var_3 = [];

    if ( var_0 == "all" )
    {
        var_3 = maps\_utility::array_merge( level.drones["allies"].array, level.drones["axis"].array );
        var_3 = maps\_utility::array_merge( var_3, level.drones["neutral"].array );
    }
    else
        var_3 = level.drones[var_0].array;

    if ( isdefined( var_2 ) )
        common_scripts\utility::array_thread( var_3, ::_id_BA48 );
    else
    {
        if ( !isdefined( var_1 ) )
            var_1 = 1024;

        thread maps\_utility::ai_delete_when_out_of_sight( var_3, var_1 );
    }
}

_id_AD73()
{
    self endon( "death" );
    thread maps\_utility::magic_bullet_shield();
    self setgoalpos( self.origin );
    var_0 = getentarray( "roof_door", "targetname" );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = getnode( self.target, "targetname" );
    var_5 = undefined;

    foreach ( var_7 in var_0 )
    {
        if ( var_7.code_classname == "script_origin" )
        {
            var_2 = var_7;
            continue;
        }
        else if ( var_7.code_classname == "trigger_multiple" )
        {
            var_1 = var_7;
            continue;
        }
        else if ( var_7.code_classname == "script_brushmodel" )
        {
            var_5 = var_7;
            continue;
        }
        else if ( var_7.code_classname == "script_model" )
        {
            var_3 = var_7;
            continue;
        }
        else
            var_4 = var_7;
    }

    for (;;)
    {
        wait 0.05;

        if ( level.player istouching( var_1 ) )
            continue;

        if ( common_scripts\utility::flag( "door_being_blocked" ) )
            continue;

        break;
    }

    var_5 linkto( var_3 );
    var_5 connectpaths();
    var_2.angles = var_3.angles;
    self playsoundatviewheight( "scn_npc_scream", "dialogue_done", 1 );
    var_3 thread door_fall_over( var_2 );
    thread maps\_utility::stop_magic_bullet_shield();
    self.goalradius = 16;
    self setgoalnode( var_4 );
    wait 4;
    thread _id_AB23();
}

door_fall_over( var_0 )
{
    var_1 = anglestoforward( var_0.angles );
    thread common_scripts\utility::play_sound_in_space( "door_wood_double_kick" );
    playfx( common_scripts\utility::getfx( "door_kick_dust" ), var_0.origin, var_1 );
    earthquake( 0.2, 0.75, self.origin, 1024 );
    maps\_utility::assign_animtree( "breakable_door" );
    var_0 thread maps\_anim::anim_single_solo( self, "door_breaking" );
}

_id_AB23()
{
    self endon( "death" );
    self endon( "stop_seeking" );
    maps\_utility::enable_danger_react( 3 );
    self.neverenablecqb = 1;
    self.grenadeawareness = 0;
    self.ignoresuppression = 1;
    self.goalheight = 100;
    self.aggressivemode = 1;
    var_0 = distance( self.origin, level.player.origin );

    while ( isalive( self ) )
    {
        wait 1;
        self.goalradius = var_0;
        self setgoalentity( level.player );
        var_0 -= 175;

        if ( var_0 < 512 )
        {
            var_0 = 512;
            return;
        }
    }
}

_id_CC2C( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1024;

    if ( var_0 == "all" )
        var_2 = getaiarray();
    else
        var_2 = getaiarray( var_0 );

    if ( var_0 == "allies" || var_0 == "all" )
    {
        foreach ( var_4 in level.squad )
        {
            if ( maps\_utility::is_in_array( var_2, var_4 ) )
                var_2 = common_scripts\utility::array_remove( var_2, var_4 );
        }

        foreach ( var_4 in var_2 )
        {
            if ( isdefined( var_4.script_noteworthy ) && var_4.script_noteworthy == "laatpv_gunner" )
                var_2 = common_scripts\utility::array_remove( var_2, var_4 );
        }
    }

    thread maps\_utility::ai_delete_when_out_of_sight( var_2, var_1 );
}

_id_A89A( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1024;

    var_3 = getent( var_0, "targetname" );
    var_4 = var_3 maps\_utility::get_ai_touching_volume( var_1 );

    if ( var_1 != "axis" )
    {
        level.squad = maps\_utility::remove_dead_from_array( level.squad );

        foreach ( var_6 in level.squad )
        {
            if ( maps\_utility::is_in_array( var_4, var_6 ) )
                var_4 = common_scripts\utility::array_remove( var_4, var_6 );
        }
    }

    thread maps\_utility::ai_delete_when_out_of_sight( var_4, var_2 );
}

_id_C865( var_0 )
{
    var_0 waittill( "death" );
    var_0 endon( "death" );

    if ( isdefined( self ) )
        self delete();
}

_id_C19B()
{
    wait(randomfloatrange( 13, 19 ));
}

_id_BD17()
{
    var_0 = gettime();
    var_1 = var_0 - level._id_CC7E;

    if ( var_0 == level._id_CC7E )
        return 1;
    else if ( var_1 > 10000 )
        return 0;
    else
        return 1;
}

_id_CBDC( var_0, var_1 )
{
    level endon( "stop_drone_flood" + var_1 );

    for (;;)
    {
        foreach ( var_3 in var_0 )
            maps\_utility::delaythread( randomfloatrange( 5, 6 ), maps\_utility::dronespawn, var_3 );

        wait(randomfloatrange( 5, 6 ));
    }
}

_id_BBAF( var_0 )
{
    level notify( "stop_drone_flood" + var_0 );
}

_id_C681( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "stop_drone_vehicle_flood" + var_1 );
    var_5 = undefined;

    for (;;)
    {
        foreach ( var_7 in var_0 )
        {
            var_5 = var_7 thread maps\_vehicle::spawn_vehicle_and_gopath();
            var_5 = undefined;
            wait(randomfloatrange( var_2, var_3 ));
        }

        var_0 = common_scripts\utility::array_randomize( var_0 );
    }
}

_id_AEC6( var_0 )
{
    level notify( "stop_drone_vehicle_flood" + var_0 );
}

_id_B767()
{
    self endon( "death" );
    self hide();
    thread maps\_utility::magic_bullet_shield();
    self.a.disablepain = 1;
    self.ignoreall = 1;
    self.walkdist = 1000;
    self.disablearrivals = 1;
    self clearenemy();
    wait 0.1;
    thread maps\_patrol::patrol();
}

_id_BF14()
{

}

_id_BA1D( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = getent( var_1.script_linkto, "script_linkname" );
    var_2 notify( "trigger", level.player );
}

_id_C43C()
{
    level.squad = maps\_utility::remove_dead_from_array( level.squad );
    common_scripts\utility::array_thread( level.squad, ::_id_D3A5 );
}

_id_C79E()
{
    level.squad = maps\_utility::remove_dead_from_array( level.squad );

    foreach ( var_1 in level.squad )
    {
        var_1 notify( "stop_adjust_movement_speed" );
        var_1.moveplaybackrate = 1.0;
    }
}

_id_D3A5()
{
    self notify( "stop_adjust_movement_speed" );
    self endon( "death" );
    self endon( "stop_adjust_movement_speed" );

    while ( isalive( self ) )
    {
        wait(randomfloatrange( 0.5, 1.5 ));

        while ( _id_CFAC() )
        {
            self.moveplaybackrate = 3.5;
            wait 0.05;
        }

        self.moveplaybackrate = 1.0;
    }
}

_id_CFAC()
{
    self endon( "death" );

    if ( !isdefined( self.goalpos ) )
        return 0;

    if ( distancesquared( self.origin, self.goalpos ) <= level._id_B964 )
        return 0;

    if ( common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), self.origin, level.cosine["90"] ) )
        return 0;

    return 1;
}

_id_ABB7()
{
    var_0 = maps\_utility::get_ai_touching_volume();

    foreach ( var_2 in level.squad )
    {
        if ( maps\_utility::is_in_array( var_0, var_2 ) )
            var_0 = common_scripts\utility::array_remove( var_0, var_2 );
    }

    return var_0;
}

_id_AB21()
{
    var_0 = common_scripts\utility::get_linked_ents();
    self waittill( "trigger" );
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        var_1 = var_3 maps\_utility::get_ai_touching_volume( "axis" );

        if ( !var_1.size )
            continue;

        common_scripts\utility::array_call( var_1, ::delete );
    }

    self delete();
}

_id_BF40()
{
    for (;;)
    {
        self waittill( "trigger" );
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
                var_2 = var_1[var_3] maps\_utility::spawn_ai();

                if ( isdefined( var_2 ) )
                {
                    var_2 maps\_utility::set_force_color( "p" );
                    level.squad = common_scripts\utility::array_add( level.squad, var_2 );
                    var_2 thread _id_B5DB();
                }
            }
        }

        wait 10;
    }
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

killspawner( var_0 )
{
    thread maps\_spawner::kill_spawnernum( var_0 );
}

_id_C5CD()
{
    var_0 = getent( self.script_linkto, "script_linkname" );
    var_1 = getent( self.target, "targetname" );
    var_2 = self.script_flag;
    level endon( var_2 );

    while ( !common_scripts\utility::flag( var_2 ) )
    {
        var_0 waittill( "trigger" );

        if ( level._id_B847 == 0 )
        {
            wait 1;
            continue;
        }

        if ( common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), self.origin, level.cosine["60"] ) )
        {
            magicbullet( "rpg", var_1.origin, self.origin );
            level._id_B847 = 0;
            wait 4;
            level._id_B847 = 1;
            break;
        }
        else
            wait 1;
    }
}

_id_C71C()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    level._id_AE31 = [];
    level._id_D02D = [];
    level._id_BF08 = [];
    level._id_CE63 = [];
    level._id_B164 = [];
    var_0 = getentarray( "triggered_fx_volumes", "targetname" );

    foreach ( var_2 in var_0 )
        var_2.fx = [];

    var_4 = getent( "effects_commerce", "script_noteworthy" );
    var_5 = getent( "effects_trenches", "script_noteworthy" );
    var_6 = getent( "effects_bunker", "script_noteworthy" );
    var_7 = getent( "effects_ww2", "script_noteworthy" );
    var_8 = getent( "effects_lincoln", "script_noteworthy" );
    var_9 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    for ( var_10 = 0; var_10 < level.createfxent.size; var_10++ )
    {
        var_11 = level.createfxent[var_10];
        var_9.origin = var_11.v["origin"];

        foreach ( var_2 in var_0 )
        {
            if ( var_9 istouching( var_2 ) )
                var_2.fx[var_2.fx.size] = var_11;
        }

        if ( var_9 istouching( var_4 ) )
        {
            level._id_AE31[level._id_AE31.size] = var_11;
            continue;
        }

        if ( var_9 istouching( var_5 ) )
        {
            level._id_D02D[level._id_D02D.size] = var_11;
            continue;
        }

        if ( var_9 istouching( var_6 ) )
        {
            level._id_BF08[level._id_BF08.size] = var_11;
            continue;
        }

        if ( var_9 istouching( var_7 ) )
        {
            level._id_CE63[level._id_CE63.size] = var_11;
            continue;
        }

        if ( var_9 istouching( var_8 ) )
        {
            level._id_B164[level._id_B164.size] = var_11;
            continue;
        }
    }

    var_9 delete();

    foreach ( var_2 in var_0 )
    {
        var_15 = getentarray( var_2.target, "targetname" );

        if ( var_15[0].script_noteworthy == "stopFx" )
        {
            var_15[0] thread _id_BA08( var_2 );
            var_15[1] thread _id_AE03( var_2 );
            continue;
        }

        var_15[1] thread _id_BA08( var_2 );
        var_15[0] thread _id_AE03( var_2 );
    }
}

restarteffectsafe()
{
    if ( !isdefined( self.looper ) || _func_2A5( self.looper ) )
        maps\_utility::restarteffect();
}

pauseeffectsafe()
{
    if ( isdefined( self.looper ) )
        common_scripts\utility::pauseeffect();
}

_id_AE03( var_0 )
{
    for (;;)
    {
        self waittill( "trigger" );
        common_scripts\utility::array_thread( var_0.fx, ::restarteffectsafe );
        wait 1;
    }
}

_id_BA08( var_0 )
{
    wait 1;
    common_scripts\utility::array_thread( var_0.fx, ::pauseeffectsafe );

    for (;;)
    {
        self waittill( "trigger" );
        common_scripts\utility::array_thread( var_0.fx, ::pauseeffectsafe );
        wait 1;
    }
}

_id_BDE3()
{
    common_scripts\utility::flag_wait( "player_heli_10a" );
    self setcandamage( 1 );
    var_0 = 5;
    var_1 = "cheap_vehicle_explosion";
    var_2 = undefined;
    var_3 = 0;
    var_4 = "car_explode";
    var_5 = undefined;
    var_6 = ( 0.0, 0.0, 0.0 );
    var_7 = 0;

    switch ( self.model )
    {
        case "vehicle_mack_truck_short_green":
            var_0 = 10;
            var_2 = "vehicle_mack_truck_short_destroy";
            var_1 = "cheap_mack_truck_explosion";
            var_4 = "exp_tanker_vehicle";
            var_5 = "tanker_fire";
            var_6 = ( 0.0, 0.0, 110.0 );
            var_3 = 1;
            break;
        case "vehicle_uaz_fabric_static":
            var_2 = "vehicle_uaz_fabric_dsr";
            break;
        case "vehicle_luxurysedan_2008_destructible":
            var_2 = "vehicle_luxurysedan_2008_destroy";
            break;
        case "vehicle_pickup_technical":
            var_2 = "vehicle_pickup_technical_destroyed";
            break;
    }

    for (;;)
    {
        self waittill( "damage", var_8, var_9 );

        if ( !isdefined( var_9 ) )
            continue;

        if ( isdefined( level._id_CED1 ) && var_9 != level._id_CED1 )
            continue;

        var_0--;

        if ( var_0 <= 0 )
            break;
    }

    playfx( common_scripts\utility::getfx( var_1 ), self.origin );
    thread common_scripts\utility::play_sound_in_space( var_4 );

    if ( var_3 )
        earthquake( 0.4, 1.53, self.origin, 1024 );

    if ( isdefined( var_2 ) )
        self setmodel( var_2 );
    else
        self delete();

    if ( isdefined( var_5 ) )
    {
        var_10 = spawn( "script_origin", self.origin + var_6 );
        var_10.angles = self.angles;
        var_11 = spawnfx( common_scripts\utility::getfx( var_5 ), var_10.origin );
        triggerfx( var_11 );
        common_scripts\utility::flag_wait( "player_heli_19" );
        var_11 delete();
        var_10 delete();
    }
}

_id_AF40()
{
    var_0 = level.vehicles["axis"];
    var_1 = level.vehicles["allies"];
    var_1 = common_scripts\utility::array_remove( var_1, level._id_CED1 );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( isdefined( var_3.vehicletype ) && getsubstr( var_3.vehicletype, 0 ) == "littlebird" )
            var_1 = common_scripts\utility::array_remove( var_1, var_3 );
    }

    var_5 = maps\_utility::array_merge( var_0, var_1 );
    var_5 = maps\_utility::remove_dead_from_array( var_5 );

    foreach ( var_3 in var_5 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_3 maps\_vehicle::godoff();
        var_3 delete();
    }
}

_id_AE1F()
{
    var_0 = level.vehicles["axis"];
    var_1 = level.vehicles["allies"];
    var_2 = maps\_utility::array_merge( var_0, var_1 );

    foreach ( var_4 in var_2 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        var_4 maps\_vehicle::godoff();
        var_4 _id_AEA1();
    }
}

_id_B693()
{
    var_0 = level.vehicles["axis"];

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_2 maps\_vehicle::godoff();
        var_2 _id_AEA1();
    }
}

_id_C7EA( var_0 )
{
    var_1 = maps\_utility::get_player_from_self();

    if ( gettime() > level._id_BA15 )
        return 1;

    var_2 = var_1 getcurrentweapon();
    var_3 = getsubstr( var_2, 0, 4 );

    if ( var_3 == "m203" )
        return 1;

    var_4 = var_1 getweaponslistall();

    foreach ( var_2 in var_4 )
    {
        var_3 = getsubstr( var_2, 0, 4 );

        if ( var_3 != "m203" )
            continue;

        var_6 = var_1 getweaponammoclip( var_2 );

        if ( var_6 > 0 )
            return 0;
    }

    return 1;
}

_id_AF4B()
{
    var_0 = getentarray( "drone_warriors_trenches", "targetname" );

    foreach ( var_2 in var_0 )
        thread maps\_utility::dronespawn( var_2 );
}

_id_CFA5( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_1 );

    foreach ( var_3 in var_0 )
        var_3 = undefined;
}

_id_AC7A( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3.origin = var_1;
    var_3 thread kill_me_on_flag( var_2 );
    var_3 maps\_utility::play_sound_on_tag_endon_death( var_0, "tag_origin" );

    if ( isdefined( var_3 ) )
        var_3 delete();
}

kill_me_on_flag( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self ) )
        self delete();
}

_id_CCE7( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( !isdefined( var_3.dead ) )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_BBEE()
{
    self waittill( "trigger" );
    playfx( level._effect["mortar"]["dirt"], self.origin );
    earthquake( 0.25, 0.75, self.origin, 1250 );
    thread common_scripts\utility::play_sound_in_space( level.scr_sound["mortar"]["dirt"], self.origin );
    radiusdamage( self.origin, self.fixednodesaferadius, 1000, 1000 );
}

_id_CF3A( var_0 )
{
    level endon( "obj_heli_mount_complete" );
    level endon( "kill_timer" );
    level.timer = maps\_hud_util::_id_B8DF( var_0, &"DCBURNING_TIME_REMAINING", 1, 1 );
    level thread _id_A831();
}

_id_A831()
{
    level.player endon( "death" );
    level endon( "kill_timer" );
    level notify( "mission failed" );
    musicstop( 1 );
    setdvar( "ui_deadquote", &"DCBURNING_RAN_OUT_OF_TIME" );
    maps\_utility::missionfailedwrapper();
    level notify( "kill_timer" );
}

_id_AE5E( var_0 )
{
    self endon( "death" );
    var_1 = maps\_vehicle::vehicle_get_path_array();
    var_2 = undefined;

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4.script_noteworthy ) && var_4.script_noteworthy == var_0 )
        {
            var_2 = var_4;
            break;
        }
    }

    var_2 waittill( "trigger" );
    self notify( "deleted_through_script" );
    wait 0.05;
    thread _id_AEA1();
}

_id_C3B0()
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );

    while ( isdefined( self ) )
    {
        wait 2;

        if ( common_scripts\utility::within_fov( level.player.origin, level.player.angles, self.origin, level.cosine["90"] ) )
            continue;

        break;
    }

    thread _id_AEA1();
}

_id_BF66( var_0, var_1 )
{
    self endon( "death" );
    self waittill( var_0 );
    self notify( var_1 );
}

_id_BAD4( var_0, var_1 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_0 );
    self notify( var_1 );
}

_id_BB3A()
{
    level.player enableinvulnerability();
}

_id_C6EA( var_0, var_1 )
{
    for (;;)
    {
        wait 1;
        var_2 = var_0 maps\_utility::get_ai_touching_volume( "axis" );

        if ( !isdefined( var_2 ) )
            break;

        if ( var_2.size )
            continue;
        else
            break;
    }

    common_scripts\utility::flag_set( var_1 );
}

ai_force_ignore_supression()
{
    var_0 = getent( "force_supression_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1.team == "allies" && !isplayer( var_1 ) )
            var_1.ignoresuppression = 1;
    }
}

ai_restore_ignore_supression()
{
    var_0 = getent( "remove_force_supression_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1.team == "allies" && !isplayer( var_1 ) )
            var_1.ignoresuppression = 0;
    }
}

performance_interior_exterior_transition()
{
    level endon( "player_getting_on_minigun" );

    for (;;)
    {
        level waittill( "player_interior_transition" );
        setsaveddvar( "fx_marks_nearlimit", "1" );

        while ( common_scripts\utility::flag( "player_interior_transition" ) )
        {
            waitframe();
            continue;
        }

        setsaveddvar( "fx_marks_nearlimit", "5" );
    }
}

heli_ride_perf_helpers()
{
    _func_31C( 2 );
    common_scripts\utility::flag_wait( "player_getting_on_minigun" );
    setsaveddvar( "fx_marks_nearlimit", "1" );
    _func_31B( 2 );
    _func_31C( 9 );
    common_scripts\utility::flag_wait( "player_crash_done" );
    _func_31C( 2 );
}

misc_model_group_think()
{
    level endon( "player_getting_on_minigun" );
    var_0 = getentarray( "misc_model_group_togglers", "targetname" );
    level.static_model_group_states = [];

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2.script_noteworthy;

        if ( !isdefined( level.static_model_group_states[var_3] ) )
            level.static_model_group_states[var_3] = 0;

        thread static_model_group_trigger_count( var_3, var_2 );
    }

    foreach ( var_3, var_6 in level.static_model_group_states )
    {
        _func_31C( int( var_3 ) );
        common_scripts\utility::flag_init( "static_model_group_flag_" + var_3 );
        thread misc_model_group_monitor( var_3 );
    }

    for (;;)
    {
        self waittill( "model_group_count_changed" );

        foreach ( var_3, var_6 in level.static_model_group_states )
        {
            if ( var_6 == 0 )
            {
                common_scripts\utility::flag_clear( "static_model_group_flag_" + var_3 );
                continue;
            }

            common_scripts\utility::flag_set( "static_model_group_flag_" + var_3 );
        }
    }
}

misc_model_group_monitor( var_0 )
{
    level endon( "player_getting_on_minigun" );
    var_1 = "static_model_group_flag_" + var_0;

    for (;;)
    {
        common_scripts\utility::flag_wait( var_1 );
        _func_31B( int( var_0 ) );
        common_scripts\utility::flag_waitopen( var_1 );
        _func_31C( int( var_0 ) );
    }
}

static_model_group_trigger_count( var_0, var_1 )
{
    for (;;)
    {
        var_2 = undefined;

        while ( !isplayer( var_2 ) )
            var_1 waittill( "trigger", var_2 );

        level.static_model_group_states[var_0]++;
        level notify( "model_group_count_changed" );

        while ( var_2 istouching( var_1 ) )
            waitframe();

        level.static_model_group_states[var_0]--;
        level notify( "model_group_count_changed" );
        waitframe();
    }
}

setsunlight_dcburning()
{
    var_0 = _func_46();
    var_1 = 0.04;
    var_2 = var_0[0] * var_1;
    var_3 = var_0[1] * var_1 * 0.6;
    var_4 = var_0[2] * var_1 * 0.4;
    var_5 = "-23057 3727 -213";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_5 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_5 );
    common_scripts\utility::flag_wait( "flag_reduce_sunlight" );
    _func_47( var_2, var_3, var_4 );
    common_scripts\utility::flag_waitopen( "flag_reduce_sunlight" );
    _func_48();
    setsunlight_dcburning();
}
#using_animtree("vehicles");

blackhawk_play_rotors_anim()
{
    self setanim( %bh_rotors, 1, 0, 1 );
}

heliblackhawk_deathvolume()
{
    wait 3.9;
    var_0 = getent( "blackhawk_deathvolume", "targetname" );

    while ( !common_scripts\utility::flag( "blackhawk_landed" ) )
    {
        if ( level.player istouching( var_0 ) )
        {
            level.player kill();
            level._id_CED1 vehicle_setspeed( 0.05 );
            break;
        }

        waitframe();
    }
}

cloth_wibble_think()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "player_roof_wibble" );
        _id_CEA1::_id_D39C( 1.0 );

        for (;;)
        {
            if ( !common_scripts\utility::flag( "player_roof_wibble" ) )
            {
                _id_CEA1::_id_D39C( 0.0 );
                break;
            }
            else if ( common_scripts\utility::flag( "player_crash_done" ) )
            {
                _id_CEA1::_id_D39C( 0.0 );
                return;
            }

            waitframe();
        }
    }
}

moving_fire_lights_setup()
{
    var_0 = common_scripts\utility::getstructarray( "moving_fire_lights", "script_noteworthy" );
    common_scripts\utility::flag_wait( "player_middle_commerce_first_floor" );

    foreach ( var_2 in var_0 )
        common_scripts\utility::array_thread( getentarray( var_2.target, "targetname" ), ::move_fire_light );
}

move_fire_light()
{
    var_0 = self.origin;
    var_1 = self.angles;
    var_2 = 0.05;
    var_3 = 0.28;

    for (;;)
    {
        var_4 = randomfloatrange( var_2, var_3 );
        var_5 = randomfloatrange( 0.1, 1 );
        var_6 = randomfloatrange( 0.045, 1.35 );
        var_7 = randomfloatrange( 0.035, 0.95 );
        var_8 = randomfloatrange( 0.25, 1.45 );
        var_9 = var_0 + ( var_6, var_7, var_8 );
        self moveto( var_9, var_4, 0.018, 0.027 );
        wait(var_4);
    }
}

tank_player_collisions()
{
    var_0 = getent( "tank_turret_clip", "targetname" );
    var_0.origin = self gettagorigin( "tag_turret" ) + ( 15.0, -25.0, -10.0 );
    var_0.angles = self gettagangles( "tag_turret" );
    var_0 linkto( self, "tag_turret" );
    var_1 = getent( "tank_gun_clip", "targetname" );
    var_1.origin = self gettagorigin( "tag_barrel" ) + ( -45.0, 75.0, 0.0 );
    var_1.angles = self gettagangles( "tag_barrel" );
    var_1 linkto( self, "tag_barrel" );
    self waittill( "death" );
    var_0 unlink();
    var_1 unlink();
}
