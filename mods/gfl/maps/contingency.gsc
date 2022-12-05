// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\contingency_mission_select_cam::_id_C490();
        return;
    }

    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" )
    {
        maps\contingency_beautiful_corner::main();
        return;
    }

    level.campaign = "delta";
    level._id_D3DC = 0;
    setsaveddvar( "sm_sunShadowScale", 0.5 );
    setsaveddvar( "r_lightGridEnableTweaks", 1 );
    setsaveddvar( "r_lightGridIntensity", 1.24 );
    setsaveddvar( "r_lightGridContrast", 0 );
    precachemodel( "h2_foliage_contingency_pine_snow_lg_c_animated" );
    level._id_B34F = 400;
    level._id_D335 = 1500;
    level.default_goalradius = 7200;
    level._id_B964 = 62500;
    level.corpse_behavior_doesnt_require_player_sight = 1;
    level.attackhelirange = 7000;
    level._id_C60F = 24000;
    level._id_C5C3 = 1;
    precacheitem( "remote_missile_snow" );
    level._id_BE71 = 1;
    level._id_B429 = "body_tf141_assault_a";
    level._id_C073 = "head_tf141_arctic_a";
    level._id_B67E = 5000;
    level.visionthermaldefault = "contingency_thermal_inverted";
    level._id_A91C = "contingency_thermal_inverted";
    level.cosine["60"] = cos( 60 );
    level.cosine["70"] = cos( 70 );
    setthermalbodymaterial( "thermalbody_snowlevel" );
    level.friendly_thermal_reflector_effect = loadfx( "fx/misc/thermal_tapereflect" );
    level._id_CAAA = 1;
    precacheshader( "h1_ac130_screen_overlay" );
    precacheshader( "h1_ac130_distort" );
    precacherumble( "tank_rumble" );
    precacheitem( "remote_missile_not_player" );
    precachemodel( "com_computer_keyboard_obj" );
    precachemodel( "h2_foliage_contingency_pine_snow_lg_clean_animated" );
    precachemodel( "foliage_contingency_snow_tall_react_animated" );
    precachemodel( "h2_foliage_contingency_pine_snow_sm_b_animated" );
    precachemodel( "h2_prop_npc_cigar" );

    precachemodel( "h2_gfl_st_ar15_viewbody" );
    precachemodel( "h2_gfl_st_ar15_viewhands" );
    precachemodel( "h2_gfl_st_ar15_viewhands_player" );

    precachenightvisioncodeassets();
    maps\_utility::default_start( ::_id_CFE5 );
    maps\_utility::add_start( "start", ::_id_CFE5, "Start" );
    maps\_utility::add_start( "slide", ::_id_A8A9, "Slide" );
    maps\_utility::add_start( "woods", ::_id_CCCF, "Woods" );
    maps\_utility::add_start( "midwoods", ::_id_BB39, "mid woods" );
    maps\_utility::add_start( "ridge", ::_id_D297, "ridge" );
    maps\_utility::add_start( "base", ::_id_B1D4, "Base" );
    maps\_utility::add_start( "defend_sub", ::_id_C460, "defend_sub" );
    _id_CD80::main();
    _id_C9A4::main();
    maps\contingency_lighting::main();
    _id_C10B::main();
    maps\contingency_anim::_id_A902();
    level._id_A9C5 = "contingency_uav";
    vehicle_scripts\_attack_heli::preload();
    maps\_vehicle::build_light_override( "script_vehicle_btr80", "spotlight", "TAG_FRONT_LIGHT_RIGHT", "fx/misc/spotlight_btr80_daytime", "spotlight", 0.2 );
    maps\_vehicle::build_light_override( "script_vehicle_btr80", "spotlight_turret", "TAG_TURRET_LIGHT", "fx/misc/spotlight_btr80_daytime", "spotlight_turret", 0.0 );
    maps\_vehicle::build_light( "script_vehicle_uaz_winter_physics", "headlight_right", "TAG_LIGHT_RIGHT_FRONT", "fx/misc/lighthaze_snow_headlights", "headlights" );
    maps\_vehicle::build_light( "script_vehicle_uaz_winter_physics", "headlight_left", "TAG_LIGHT_LEFT_FRONT", "fx/misc/lighthaze_snow_headlights", "headlights" );
    maps\_vehicle::build_light( "script_vehicle_uaz_winter_physics", "taillight_right", "TAG_LIGHT_LEFT_TAIL", "fx/misc/car_taillight_uaz_l", "brakelights" );
    maps\_vehicle::build_light( "script_vehicle_uaz_winter_physics", "taillight_left", "TAG_LIGHT_RIGHT_TAIL", "fx/misc/car_taillight_uaz_l", "brakelights" );
    level._id_ADED = [];
    precachestring( &"CONTINGENCY_TIME_TO_ENTER_SUB" );
    precachestring( &"CONTINGENCY_LINE1" );
    precachestring( &"CONTINGENCY_LINE2" );
    precachestring( &"CONTINGENCY_LINE3" );
    precachestring( &"CONTINGENCY_LINE4" );
    precachestring( &"CONTINGENCY_LINE5" );
    precachestring( &"CONTINGENCY_OBJ_SUB_BASE" );
    precachestring( &"CONTINGENCY_OBJ_SUB_DOCK" );
    precachestring( &"CONTINGENCY_OBJ_DEFEND_SUB" );
    precachestring( &"CONTINGENCY_OBJ_ENTER_SUB" );
    precachestring( &"CONTINGENCY_OBJ_CONTROL_SUB" );
    precachestring( &"CONTINGENCY_OBJ_TURN_KEY" );
    precachestring( &"CONTINGENCY_OBJ_EXIT_SUB" );
    precachestring( &"CONTINGENCY_OBJ_DEFEND" );
    precachestring( &"CONTINGENCY_SUB_TIMER_EXPIRED" );
    precachestring( &"CONTINGENCY_OBJ_ENTER_BASE" );
    precachestring( &"CONTINGENCY_OBJ_PRICE" );
    precachestring( &"CONTINGENCY_USE_DRONE" );
    precachestring( &"CONTINGENCY_TURN_KEY" );
    precachestring( &"CONTINGENCY_DONT_LEAVE" );
    precachestring( &"CONTINGENCY_DONT_LEAVE_FAILURE" );
    maps\_hud_util::_id_D3F5();
    maps\_load::main();
    _id_C471::main();
    maps\_load::set_player_viewhand_model( "h2_gfl_st_ar15_viewhands_player" );
    thread maps\contingency_aud::main();
    _id_C630::init();
    maps\_compass::setupminimap( "compass_map_contingency" );
    createthreatbiasgroup( "bridge_guys" );
    createthreatbiasgroup( "truck_guys" );
    createthreatbiasgroup( "bridge_stealth_guys" );
    createthreatbiasgroup( "dogs" );
    createthreatbiasgroup( "price" );
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "end_patrol" );
    level.player setthreatbiasgroup( "player" );
    setignoremegroup( "price", "dogs" );
    setthreatbias( "player", "bridge_stealth_guys", 1000 );
    setthreatbias( "player", "truck_guys", 1000 );
    precacheitem( "at4_straight" );
    precacheitem( "rpg_straight" );
    precacheitem( "zippy_rockets" );
    precacheitem( "zippy_rockets_inverted" );
    precacheitem( "zippy_rockets_persistent" );
    precacheitem( "facemask" );
    _id_C21D();
    init_scope_fov_setup();
    setsaveddvar( "r_umbraAccurateOcclusionThreshold", 3100 );
    maps\_idle::idle_main();
    _id_BC61::main();
    maps\_idle_smoke::main();
    _id_A9F5::main();
    maps\_idle_phone::main();
    _id_B881::main();
    _id_B2D2::main();
    animscripts\dog\dog_init::initdoganimations();
    maps\_patrol_anims::main();
    _id_B1D6::main();
    maps\_stealth::main();
    _id_B4B4();
    thread _id_BEA3();
    thread _id_AD50();
    thread _id_CA60();
    thread _id_AAB6();
    thread _id_BD0A();
    thread _id_B43C();
    thread _id_ACAA();
    thread _id_B129();
    thread _id_B0CD();
    thread _id_C84D();
    thread _id_BCC0();
    thread _id_C5B5();
    thread _id_B067();
    thread _id_C847();
    common_scripts\utility::array_thread( getentarray( "bush_trigger", "targetname" ), ::bush_trigger_manager );
    thread change_zfar_by_fov();
    thread reset_zfar_by_fov_to_default();
    thread static_model_group_think( "dynamic_zfar_flag", 1 );
    thread static_model_group_think( "starting_area_trees_flag", 6 );
    thread change_remote_missile_zfar();
    thread swap_to_base_uav();
    thread animated_trees_setup();
    thread animated_bushes_setup();
    thread safe_from_btr_failproof();
    level.player.remotemissile_actionslot = 4;
    level.player.remotemissile_lowerbound_limit = ( -26160.0, -14240.0, -1000.0 );
    level.player.remotemissile_upperbound_limit = ( 5032.0, 12984.0, 11660.0 );
    level.player thread _id_BCA1::_id_AB5A();
    level.player maps\_stealth_utility::stealth_plugin_basic();
    level.player thread maps\_utility::_id_B43E();
    maps\_utility::player_speed_percent( 90 );
    var_0 = getentarray( "trigger_tree_explosion", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_ADFF();

    var_4 = getentarray( "truck_patrol", "targetname" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::_id_CD03 );
    var_5 = getentarray( "truck_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::_id_CB92 );
    var_6 = getentarray( "rasta", "script_noteworthy" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_B6AE );
    var_7 = getentarray( "bricktop", "script_noteworthy" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, ::_id_C319 );
    var_8 = getentarray( "village_redshirt", "script_noteworthy" );

    if ( isdefined( var_8 ) )
        common_scripts\utility::array_thread( var_8, maps\_utility::add_spawn_function, ::_id_C23C );

    var_9 = getentarray( "start_of_base_redshirt", "script_noteworthy" );

    if ( isdefined( var_9 ) )
        common_scripts\utility::array_thread( var_9, maps\_utility::add_spawn_function, ::_id_A880 );

    level._id_B0EE = 0;
    var_10 = getentarray( "village_defenders", "targetname" );
    common_scripts\utility::array_thread( var_10, maps\_utility::add_spawn_function, ::_id_B573 );
    var_11 = getentarray( "base_starting_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_11, maps\_utility::add_spawn_function, ::_id_ACB8 );
    var_12 = getentarray( "base_vehicles", "script_noteworthy" );
    common_scripts\utility::array_thread( var_12, maps\_utility::add_spawn_function, ::_id_B896 );
    var_13 = getent( "base_troop_transport1", "targetname" );
    var_13 maps\_utility::add_spawn_function( ::_id_B948 );
    var_13 maps\_utility::add_spawn_function( ::_id_CA36, "cont_cmt_goodkilltruck" );
    var_14 = getent( "base_troop_transport2", "targetname" );
    var_14 maps\_utility::add_spawn_function( ::_id_B948 );
    var_14 maps\_utility::add_spawn_function( ::_id_CA36, "cont_cmt_goodkilltruck" );
    var_15 = getent( "base_truck2", "targetname" );
    var_15 maps\_utility::add_spawn_function( ::_id_B948 );
    var_15 maps\_utility::add_spawn_function( ::_id_CA36, "cont_cmt_directhitjeep" );
    var_16 = getent( "price", "script_noteworthy" );
    var_16 maps\_utility::add_spawn_function( ::_id_CDB4 );
    var_16 maps\_utility::add_spawn_function( ::_id_C368, "price" );
    maps\_utility::add_global_spawn_function( "axis", ::_id_D2CF );
    maps\_utility::add_global_spawn_function( "axis", ::_id_B127 );
    thread _id_CF6C();
    common_scripts\utility::flag_init( "base_troop_transport2_spawned" );
    var_14 = getent( "base_troop_transport2", "targetname" );
    var_14 maps\_utility::add_spawn_function( common_scripts\utility::flag_set, "base_troop_transport2_spawned" );
    var_17 = getentarray( "village_truck_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_17, maps\_utility::add_spawn_function, ::_id_C535 );
    var_18 = getent( "sub_ladder", "targetname" );
    var_18.realorigin = var_18.origin;
    var_18.origin += ( 0.0, 0.0, -10000.0 );
    thread setup_dont_leave_failure();
    thread setup_dont_leave_hint();
    maps\_utility::add_hint_string( "hint_dont_leave_price", &"CONTINGENCY_DONT_LEAVE", ::should_break_dont_leave, undefined, "small_background" );
    maps\_utility::add_hint_string( "hint_predator_drone", &"HELLFIRE_USE_DRONE", ::_id_BEDE );
    maps\_utility::add_hint_string( "hint_steer_drone", &"SCRIPT_PLATFORM_STEER_DRONE", ::_id_B34D );
    thread _id_D516();
    maps\_vehicle::_id_CCF4( "script_vehicle_uaz_winter_physics", _id_C782::setanims, ::_id_ADD5 );
}

_id_C21D()
{
    common_scripts\utility::flag_init( "saying_base_on_alert" );
    common_scripts\utility::flag_init( "said_second_uav_in_position" );
    common_scripts\utility::flag_init( "everyone_set_green" );
    common_scripts\utility::flag_init( "said_convoy_coming" );
    common_scripts\utility::flag_init( "saying_patience" );
    common_scripts\utility::flag_init( "stop_stealth_music" );
    common_scripts\utility::flag_init( "price_starts_moving" );
    common_scripts\utility::flag_init( "truckguys_dead" );
    common_scripts\utility::flag_init( "cross_bridge_patrol_dead" );
    common_scripts\utility::flag_init( "first_stragglers_dead" );
    common_scripts\utility::flag_init( "rightside_patrol_dead" );
    common_scripts\utility::flag_init( "all_bridge_guys_dead" );
    thread _id_AA20();
    thread _id_C6EF();
    common_scripts\utility::flag_init( "second_group_of_stragglers_are_dead" );
    common_scripts\utility::flag_init( "saying_contact" );
    common_scripts\utility::flag_init( "said_follow_me" );
    common_scripts\utility::flag_init( "someone_became_alert" );
    common_scripts\utility::flag_init( "price_is_hiding" );
    common_scripts\utility::flag_init( "truck_guys_alerted" );
    common_scripts\utility::flag_init( "jeep_stopped" );
    common_scripts\utility::flag_init( "convoy_hide_section_complete" );
    common_scripts\utility::flag_init( "attach_rocket" );
    common_scripts\utility::flag_init( "fire_rocket" );
    common_scripts\utility::flag_init( "drop_rocket" );
    common_scripts\utility::flag_init( "done_with_exploding_trees" );
    common_scripts\utility::flag_init( "first_uav_spawned" );
    common_scripts\utility::flag_init( "first_uav_destroyed" );
    common_scripts\utility::flag_init( "second_uav_in_position" );
    common_scripts\utility::flag_init( "rasta_and_bricktop_dialog_done" );
    common_scripts\utility::flag_init( "player_turned_key" );
    common_scripts\utility::flag_init( "player_in_uaz" );
    common_scripts\utility::flag_init( "incoming_btr" );
    common_scripts\utility::flag_init( "time_to_use_UAV" );
    common_scripts\utility::flag_init( "allowDestructionOfUAV" );
    common_scripts\utility::flag_init( "both_gauntlets_destroyed" );
    common_scripts\utility::flag_init( "time_to_race_to_submarine" );
    common_scripts\utility::flag_init( "player_key_rdy" );
    common_scripts\utility::flag_init( "close_sub_hatch" );
    initialize_portal_flags();
    initialize_zfar_flags();
}

_id_D550()
{
    self.health = 100000;
}

_id_CFE5()
{
    soundscripts\_snd::snd_message( "start_start_checkpoint" );
    maps\contingency_lighting::_id_AED9( "start" );
    thread _id_CF7E();
}

_id_B1D4()
{
    soundscripts\_snd::snd_message( "start_base_checkpoint" );
    maps\contingency_lighting::_id_AED9( "base" );
    var_0 = common_scripts\utility::getstruct( "base_start_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "start_friendly", "targetname" );
    var_2 = getentarray( "rasta_and_bricktop", "targetname" );
    var_1 = common_scripts\utility::array_combine( var_1, var_2 );
    var_3 = common_scripts\utility::getstructarray( "base_start_friendly", "targetname" );

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_1[var_4].origin = var_3[var_4].origin;
        var_1[var_4].angles = var_3[var_4].angles;
        var_1[var_4] maps\_utility::spawn_ai();
    }

    wait 0.1;
    level.price.colornode_func = ::_id_A91F;
    level.price maps\_utility::forceuseweapon( "aug_scope_arctic", "primary" );
    thread _id_BA79();
    common_scripts\utility::flag_set( "player_on_ridge" );
    common_scripts\utility::flag_set( "leaving_village" );
    thread _id_C5DF();
}

_id_C460()
{
    soundscripts\_snd::snd_message( "start_defend_sub_checkpoint" );
    maps\contingency_lighting::_id_AED9( "defend_sub" );
    var_0 = common_scripts\utility::getstruct( "defend_sub_start_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "start_friendly", "targetname" );
    var_2 = getentarray( "rasta_and_bricktop", "targetname" );
    var_1 = common_scripts\utility::array_combine( var_1, var_2 );
    var_3 = common_scripts\utility::getstructarray( "defend_sub_start_friendly", "targetname" );

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_1[var_4].origin = var_3[var_4].origin;
        var_1[var_4].angles = var_3[var_4].angles;
        var_1[var_4] maps\_utility::spawn_ai();
    }

    common_scripts\utility::flag_set( "stop_stealth_music" );
    maps\_utility::music_stop();
    level.player takeallweapons();
    level.player giveweapon( "aa12" );
    level.player giveweapon( "m240_heartbeat_reflex_arctic" );
    level.player switchtoweapon( "m240_heartbeat_reflex_arctic" );
    level.player setoffhandprimaryclass( "fraggrenade" );
    level.player giveweapon( "fraggrenade" );
    level.player setoffhandsecondaryclass( "flash_grenade" );
    level.player giveweapon( "flash_grenade" );
    wait 0.1;
    level._id_D040 maps\_utility::set_force_color( "g" );
    level._id_D040 maps\_utility::enable_ai_color();
    level._id_BB6F maps\_utility::set_force_color( "g" );
    level._id_BB6F maps\_utility::enable_ai_color();
    level.price maps\_utility::set_force_color( "g" );
    level.price maps\_utility::enable_ai_color();
    level.price maps\_utility::forceuseweapon( "aug_scope_arctic", "primary" );
    maps\_stealth_utility::disable_stealth_system();
    var_1 = getaiarray( "allies" );

    foreach ( var_6 in var_1 )
        var_6 thread _id_B639();

    thread _id_BA79();
    common_scripts\utility::flag_set( "player_on_ridge" );
    common_scripts\utility::flag_set( "leaving_village" );
    common_scripts\utility::flag_set( "base_alerted" );
    thread _id_D3A0();
    thread _id_C0A2();
}

_id_B805()
{
    wait 4;
    thread maps\_utility::radio_dialogue( "cont_cmt_barelysee" );
    soundscripts\_snd::snd_message( "aud_start_mix_price_arriving" );
}

_id_CF7E()
{
    thread _id_B805();
    maps\_introscreen::_id_C414();
    var_0 = getent( "price", "script_noteworthy" );
    var_0 maps\_utility::spawn_ai();
    thread _id_BC70();
    thread _id_A948();
    setsaveddvar( "cg_gunDownAnimDelayTime", 250 );
    thread _id_BD66();
    thread _id_BF2A();
    common_scripts\utility::flag_wait( "start_first_patrol" );
    soundscripts\_snd::snd_message( "aud_stop_mix_price_arriving" );
    maps\_utility::autosave_by_name( "start_first_patrol" );
    var_1 = getentarray( "first_patrol", "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( var_3.classname == "actor_enemy_dog" )
            var_3.slowdog = 1;

        var_3 thread _id_D2F8();
    }

    common_scripts\utility::flag_wait( "price_starts_moving" );
    common_scripts\utility::flag_wait( "patrol_in_sight" );
    thread _id_C146();
    thread _id_B047();
    thread _id_C46F();
    common_scripts\utility::flag_wait( "start_truck_patrol" );
    soundscripts\_snd::snd_message( "aud_start_mix_jeep_convoy" );

    if ( !common_scripts\utility::flag( "cross_bridge_patrol_dead" ) && !common_scripts\utility::flag( "first_stragglers_dead" ) && !common_scripts\utility::flag( "rightside_patrol_dead" ) )
        thread maps\_utility::autosave_stealth();

    level.price.ignoreall = 1;
    var_5 = thread maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "truck_patrol" );
    var_5 thread maps\contingency_aud::_id_AD54();
    wait 1;
    thread _id_AC0F();
    thread maps\contingency_aud::_id_B037();
    common_scripts\utility::flag_wait_any( "last_truck_left", "player_is_crossing_bridge", "all_bridge_guys_dead" );
    level.price _meth_8583();
    level.price notify( "stop_smart_path_following" );
    var_6 = getnode( "price_rdy_vs_stragglers", "targetname" );
    level.price thread _id_AB1E( var_6 );
    level.price thread _id_D3A5();
    common_scripts\utility::flag_wait( "price_slide_prep" );
    level.price.ignoreall = 0;
    thread _id_C83A();
}

_id_A8A9()
{
    soundscripts\_snd::snd_message( "start_slide_checkpoint" );
    maps\contingency_lighting::_id_AED9( "slide" );
    var_0 = common_scripts\utility::getstruct( "slide_start_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "start_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "slide_start_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    wait 0.1;
    level.price maps\_utility::enable_cqbwalk();
    thread _id_C83A();
}

_id_C83A()
{
    var_0 = level._id_D3DC;
    thread _id_AA8C();
    level.price notify( "stop_smart_path_following" );
    thread _id_CA7C();
    common_scripts\utility::flag_wait( "start_btr_slide" );
    soundscripts\_snd::snd_message( "aud_start_mix_tank_attacks" );
    maps\_utility::autosave_stealth();
    level.price notify( "stop_adjust_movement_speed" );
    thread _id_B6FD();
    level._id_CD81 = maps\_vehicle::spawn_vehicle_from_targetname( "btr_slider" );
    level._id_CD81 thread maps\_vehicle::vehicle_lights_on( "spotlight spotlight_turret" );
    level._id_CD81 thread maps\_vehicle_code::damage_hints();
    level._id_CD81 thread _id_AD02();
    level._id_CD81.animname = "contingency_btr_slide";
    var_1 = common_scripts\utility::getstruct( "btr81_slide_node", "targetname" );
    var_1 thread maps\_anim::anim_single_solo( level._id_CD81, "contingency_btr_slide" );
    level._id_CD81 thread btr_slider_check_collision_with_player();
    level._id_CD81 _meth_85C3( 0 );
    level._id_CD81 thread maps\contingency_aud::_id_CA32();
    var_2 = 2.8;
    wait(var_2);
    thread _id_D1C9();
    thread _id_BE63();
    thread _id_C43E();
}

btr_slider_check_collision_with_player()
{
    self endon( "death" );
    var_0 = gettime() + 7000;

    while ( gettime() < var_0 )
    {
        var_1 = distance2dsquared( self.origin, level.player.origin );

        if ( var_1 < 32400 )
        {
            var_2 = vectornormalize( level.player.origin - self.origin );
            var_3 = vectordot( var_2, anglestoforward( self.angles ) );
            var_4 = 60 + abs( var_3 ) * 120;

            if ( var_1 < var_4 * var_4 )
            {
                level.player dodamage( level.player.health + 1000, self.origin, self );
                return;
            }
        }

        waitframe();
    }
}

_id_CA7C()
{
    var_0 = getent( "price_fire_loc_2", "targetname" );
    var_0 maps\_anim::anim_reach_solo( level.price, "pre_BTR" );
    level.price.run_overrideanim = level.scr_anim["price"]["price_new_running"];
    level.price thread maps\_utility::disable_cqbwalk();
    level.price _meth_8583();

    if ( !common_scripts\utility::flag( "safe_from_btrs" ) )
    {
        if ( !common_scripts\utility::flag( "start_btr_slide" ) )
        {
            var_0 thread maps\_anim::anim_single_solo( level.price, "pre_BTR" );
            waitframe();

            if ( common_scripts\utility::flag( "pre_start_btr_slide" ) )
                level.price _meth_83D4( level.price maps\_utility::getanim( "pre_BTR" ), 2 );

            level.price waittillmatch( "single anim", "end" );

            if ( !common_scripts\utility::flag( "start_btr_slide" ) )
            {
                var_0 thread maps\_anim::anim_loop_solo( level.price, "pre_BTR_idle", "run_to_woods" );
                common_scripts\utility::flag_wait( "start_btr_slide" );
                wait 0.5;
                var_0 notify( "run_to_woods" );
                var_0 maps\_anim::anim_single_solo( level.price, "price_run_in_wood" );
            }
            else
                var_0 maps\_anim::anim_single_solo( level.price, "price_run_in_wood" );
        }
        else
        {
            var_1 = getnode( "price_into_the_woods_path", "targetname" );
            thread _id_B9E6();
            level.price setgoalnode( var_1 );
        }

        level.price _meth_8582();
        level.price pushplayer( 1 );
        level.price.sprint = 1;
        level.price.moveplaybackrate = 0.9;
        level.price thread _id_C5E0();
        var_2 = getnode( "price_into_the_woods_path", "targetname" );
        level.price thread maps\_utility::follow_path( var_2 );
    }
    else
        level.price _meth_8582();
}

_id_CCCF()
{
    soundscripts\_snd::snd_message( "start_woods_checkpoint" );
    maps\contingency_lighting::_id_AED9( "woods" );
    var_0 = common_scripts\utility::getstruct( "woods_start_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "start_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "woods_start_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    wait 0.1;
    level.price thread maps\_utility::disable_cqbwalk();
    level.price.moveplaybackrate = 1.2;
    level.price.goalradius = 64;
    level.price setgoalpos( ( -28257.9, -8877.1, 840.5 ) );
    thread _id_C43E();
}

_id_BB39()
{
    soundscripts\_snd::snd_message( "start_midwoods_checkpoint" );
    maps\contingency_lighting::_id_AED9( "midwoods" );
    var_0 = common_scripts\utility::getstruct( "midwoods_start_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "start_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "midwoods_start_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    wait 0.1;
    common_scripts\utility::flag_set( "safe_from_btrs" );
    level.price thread maps\_utility::enable_cqbwalk();
    var_4 = getnode( "price_overlook_stream", "targetname" );
    level.price thread _id_AB1E( var_4 );
    level._id_AA5B = 1600;
    thread _id_CF9C();
    thread _id_CC17();
}

_id_C43E()
{
    common_scripts\utility::flag_wait( "safe_from_btrs" );
    thread hanging_parachute();
    level.price maps\_utility::clear_run_anim();
    soundscripts\_snd::snd_message( "aud_stop_mix_tank_attacks" );
    thread _id_B1D5();
    var_0 = getaispeciesarray( "axis", "all" );

    foreach ( var_2 in var_0 )
    {
        if ( distance( level.player.origin, var_2.origin ) > 1500 )
            var_2 delete();
    }

    thread _id_CF9C();
    level.price notify( "_utility::follow_path" );
    level.price notify( "stop_going_to_node" );
    level.price.moveplaybackrate = 1;
    level.price pushplayer( 1 );
    _id_AA35();
    level._id_AA5B = 1600;
    level.price.maxsightdistsqrd = level._id_AA5B;
    level.price thread maps\_utility::dialogue_queue( "cont_pri_slowdown" );
    maps\_utility::autosave_stealth();
    level.price.sprint = undefined;
    level.price thread maps\_utility::enable_cqbwalk();
    var_4 = getnode( "price_woods_path_start", "targetname" );
    level.price thread _id_AB1E( var_4 );
    thread _id_CC17();
}

_id_CC17()
{
    _id_AA35();
    thread _id_BD63();
    thread _id_AE15();
    thread _id_BE1C();
    thread _id_D367();
    thread _id_D0D5();
    thread _id_D33E();
    thread _id_B8E3();
}

_id_D297()
{
    soundscripts\_snd::snd_message( "start_ridge_checkpoint" );
    maps\contingency_lighting::_id_AED9( "ridge" );
    var_0 = common_scripts\utility::getstruct( "ridge_start_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "start_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "ridge_start_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    wait 0.1;
    thread _id_B8E3();
}

angel_savior_achievement_think()
{
    level endon( "first_uav_destroyed" );
    level waittill( "both_gauntlets_destroyed" );
    maps\_utility::giveachievement_wrapper( "ANGEL_SAVIOR" );
}

_id_BEFB()
{
    level._id_C005 = 13;

    if ( isalive( level._id_C4CB ) && isalive( level._id_CD07 ) )
    {
        common_scripts\utility::flag_set( "first_uav_spawned" );
        thread _id_A9AA();
        thread angel_savior_achievement_think();
        level._id_C176 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "first_uav" );
        level._id_C176 playloopsound( "uav_engine_loop" );
        level.uavrig = spawn( "script_model", level._id_C176.origin );
        level.uavrig setmodel( "tag_origin" );
        thread _id_C09D();
        level.uav_target = spawn( "script_origin", level._id_C176.origin );
        level.uav_target linkto( level._id_C176 );
    }

    common_scripts\utility::flag_wait( "player_on_ridge" );

    if ( maps\_stealth_utility::stealth_is_everything_normal() )
    {
        var_0 = getaispeciesarray( "axis", "all" );

        foreach ( var_2 in var_0 )
        {
            if ( !var_2 cansee( level.player ) )
                var_2 delete();
        }

        maps\_stealth_utility::disable_stealth_system();
    }
    else
    {
        maps\_stealth_utility::disable_stealth_system();
        var_0 = getaispeciesarray( "axis", "all" );

        foreach ( var_2 in var_0 )
        {
            if ( distance( var_2.origin, level.player.origin ) > 2300 )
            {
                var_2 delete();
                continue;
            }

            var_2 thread _id_AECB();
        }

        var_0 = getaispeciesarray( "axis", "all" );
        level._id_AE58 = var_0.size;

        while ( level._id_AE58 > 0 )
            wait 1;
    }

    common_scripts\utility::flag_wait( "price_on_ridge" );

    if ( isalive( level._id_C4CB ) && isalive( level._id_CD07 ) )
    {
        level._id_C7B9 = gettime();

        if ( !common_scripts\utility::flag( "going_down_ridge" ) )
            wait 3;

        if ( !common_scripts\utility::flag( "going_down_ridge" ) && !isdefined( level.player.is_controlling_uav ) )
            wait 3;
    }
    else
    {
        level._id_C7B9 = gettime();
        level.player._id_B48F = 1;
        level.player giveweapon( "remote_missile_detonator" );
        level.player setactionslot( 4, "weapon", "remote_missile_detonator" );
        setomnvar( "ui_updateactionslot", 1 );
    }

    if ( isalive( level._id_C4CB ) && isalive( level._id_CD07 ) )
    {
        common_scripts\utility::flag_wait( "allowDestructionOfUAV" );
        common_scripts\utility::flag_set( "first_uav_destroyed" );
        var_6 = getent( "gauntlet_west", "targetname" );
        var_7 = spawn( "script_origin", var_6.origin + ( 0.0, 0.0, 220.0 ) );
        var_8 = getent( "gauntlet_east", "targetname" );
        var_9 = spawn( "script_origin", var_8.origin + ( 0.0, 0.0, 220.0 ) );
        _id_C9E7( var_7, var_9 );
    }
}

_id_ABA2()
{
    var_0 = getent( "ridge_price_overlook_org", "targetname" );
    var_0 maps\_anim::anim_reach_solo( level.price, "ridge_in" );

    if ( common_scripts\utility::flag( "leaving_village" ) )
        return;

    if ( common_scripts\utility::flag( "going_down_ridge" ) )
    {
        level.price.a.pose = "prone";
        level.price _meth_8582();
        var_0 maps\_anim::anim_reach_solo( level.price, "running_slide" );

        if ( common_scripts\utility::flag( "leaving_village" ) && distance2dsquared( var_0.origin, level.price.origin ) > 100 )
            return;

        var_0 maps\_anim::anim_single_solo( level.price, "running_slide" );
    }
    else
    {
        level.price.ignoreme = 1;
        var_0 maps\_anim::anim_single_solo( level.price, "ridge_in" );

        if ( !common_scripts\utility::flag( "player_on_ridge" ) )
        {
            var_0 thread maps\_anim::anim_loop_solo( level.price, "ridge_idle", "play_dialogue" );
            common_scripts\utility::flag_wait( "player_on_ridge" );
            var_0 notify( "play_dialogue" );
        }

        var_0 maps\_anim::anim_single_solo( level.price, "ridge_dialogue" );
        level.price.ignoreme = 0;
        var_0 maps\_anim::anim_single_solo( level.price, "slide" );
    }

    level.price thread maps\_utility::disable_cqbwalk();

    if ( !common_scripts\utility::flag( "everyone_set_green" ) )
        level.price maps\_utility::set_force_color( "r" );

    level.price maps\_utility::enable_ai_color();
    maps\_utility::activate_trigger_with_targetname( "price_in_village_start" );
}

_id_BBF5( var_0 )
{
    level.player._id_B48F = 1;
    level.player giveweapon( "remote_missile_detonator" );
    level.player setactionslot( 4, "weapon", "remote_missile_detonator" );
    setomnvar( "ui_updateactionslot", 1 );
    level.player thread maps\_utility::display_hint( "hint_predator_drone" );
    wait 5;
    common_scripts\utility::flag_set( "allowDestructionOfUAV" );
}

_id_B8E3()
{
    var_0 = getentarray( "rasta", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_C656 );
    var_1 = getentarray( "bricktop", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_B87B );
    level.price thread maps\_utility::enable_cqbwalk();
    common_scripts\utility::flag_wait( "approaching_ridge" );
    level._id_C4CB = maps\_vehicle::spawn_vehicle_from_targetname( "gauntlet_east" );
    wait 1;
    level._id_CD07 = maps\_vehicle::spawn_vehicle_from_targetname( "gauntlet_west" );
    level.price maps\_utility::disable_ai_color();
    level.price notify( "stop_smart_path_following" );
    level.price notify( "stop_dynamic_run_speed" );
    thread _id_ABA2();
    thread _id_BEFB();
    common_scripts\utility::flag_wait( "player_slid_down" );
    common_scripts\utility::flag_set( "stop_stealth_music" );
    soundscripts\_snd::snd_message( "aud_start_mix_sam_explosion" );
    thread _id_BD4F();

    if ( isalive( level._id_CD81 ) )
        level._id_CD81 delete();

    if ( isalive( level._id_AF06 ) )
        level._id_AF06 delete();

    thread _id_B148();
    maps\_utility::autosave_by_name( "village_fight" );
    thread _id_AF86();
    var_2 = getentarray( "first_villagers", "targetname" );

    foreach ( var_4 in var_2 )
        var_4 maps\_utility::spawn_ai();

    maps\_stealth_utility::disable_stealth_system();
    common_scripts\utility::flag_clear( "_stealth_spotted" );
    thread _id_CBE7();

    if ( isalive( level._id_C4CB ) )
    {
        level._id_C4CB waittill( "death" );
        level._id_C4CB playloopsound( "fire_metal_large" );
    }

    if ( isalive( level._id_CD07 ) )
    {
        level._id_CD07 waittill( "death" );
        level._id_CD07 playloopsound( "fire_metal_large" );
    }

    common_scripts\utility::flag_set( "both_gauntlets_destroyed" );
    var_6 = getent( "ai_missile_prevention", "targetname" );
    maps\_utility::deleteent( var_6 );
    soundscripts\_snd::snd_message( "aud_stop_mix_sam_explosion" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "second_uav_in_position" );
    maps\_utility::add_func( ::_id_BA79 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( maps\_utility::_wait, 30 );
    maps\_utility::add_func( common_scripts\utility::flag_set, "start_village_fight" );
    thread maps\_utility::do_wait();
    _id_C5B2();
    common_scripts\utility::flag_set( "rasta_and_bricktop_dialog_done" );
    common_scripts\utility::flag_set( "second_uav_in_position" );
    common_scripts\utility::flag_set( "start_village_fight" );
    maps\_utility::autosave_by_name( "village_fight2" );
    wait 1;
    level.price thread _id_B639();
    var_7 = getentarray( "village_defenders", "targetname" );

    foreach ( var_4 in var_7 )
        var_4 maps\_utility::spawn_ai();

    common_scripts\utility::flag_wait( "leaving_village" );
    level.price maps\_utility::disable_cqbwalk();
    thread _id_C5DF();
}

_id_C5DF()
{
    level._id_CC22 = 1;
    level.price thread _id_C8B0();
    level._id_D040 thread _id_C8B0();
    common_scripts\utility::array_thread( getentarray( "ice_chunk", "targetname" ), ::activate_ice_chunk );
    common_scripts\utility::array_thread( getentarray( "animated_buoy", "targetname" ), ::animated_buoy );
    var_0 = 0;
    var_1 = getaiarray( "allies" );

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == level._id_D040 || var_3 == level.price )
            continue;

        var_0++;
        var_3 thread maps\_utility::replace_on_death();
    }

    var_5 = 3 - var_0;
    var_6 = getentarray( "start_of_base_redshirt", "targetname" );

    for ( var_7 = 0; var_7 < var_5; var_7++ )
        var_6[var_7] maps\_utility::spawn_ai();

    thread _id_BA6C();
    thread _id_CC26();
    thread _id_B283();
    var_8 = common_scripts\utility::getstruct( "village_enemies_retreat_pos", "targetname" ).origin;
    var_9 = getaiarray( "axis" );

    foreach ( var_11 in var_9 )
        var_11 thread _id_B54C( var_8 );

    _id_AA35();
    var_13 = getentarray( "base_starting_guys", "targetname" );

    foreach ( var_15 in var_13 )
        var_15 maps\_utility::spawn_ai();

    thread _id_C241();
    thread _id_BD09();
    maps\_utility::add_wait( ::_id_BE8C );
    maps\_utility::add_func( common_scripts\utility::flag_set, "base_alerted" );
    thread maps\_utility::do_wait();
    thread _id_B835();
    common_scripts\utility::flag_wait( "base_alerted" );
    thread _id_D3A0();
    maps\_stealth_utility::disable_stealth_system();
    thread _id_B89A();
    wait 1;
    thread _id_C432();
    thread _id_CBED();
    maps\_utility::activate_trigger_with_targetname( "friendlies_enter_base" );
    thread _id_CAD2();
    var_17 = getaiarray( "allies" );

    foreach ( var_19 in var_17 )
        var_19 thread _id_B639();

    if ( isalive( level._id_CC47 ) )
    {
        var_21 = 0;
        var_22 = 0;
        level._id_CC47 thread _id_C649( var_21, var_22 );
    }

    if ( isalive( level._id_CACC ) )
        level._id_CACC thread _id_CB9C();

    wait 2;

    if ( isalive( level._id_C0C6 ) )
    {
        level._id_C0C6 thread maps\contingency_aud::_id_D261();
        thread maps\_vehicle::gopath( level._id_C0C6 );
        level._id_C0C6.circling = 1;
        level._id_C0C6.no_attractor = 1;
        level._id_C0C6 = thread vehicle_scripts\_attack_heli::begin_attack_heli_behavior( level._id_C0C6 );
    }

    thread _id_C0A2();
}

_id_C0A2()
{
    common_scripts\utility::flag_wait( "price_splits_off" );
    thread _id_D2E3();

    if ( isalive( level._id_CC47 ) )
    {
        level._id_CC47 kill();
        wait 3;
    }

    common_scripts\utility::flag_clear( "respawn_friendlies" );
    maps\_utility::autosave_by_name( "defend" );
    thread _id_D52F( "gate1" );
    thread _id_D52F( "gate2" );
    level.price.colornode_func = undefined;
    level notify( "reached_sub" );
    killtimer();
    thread _id_C81F();
    level.price maps\_utility::disable_ai_color();
    var_0 = getent( "submarine_node", "targetname" );
    var_0 maps\_anim::anim_reach_solo( level.price, "submarine" );
    var_0 thread maps\_anim::anim_single_solo( level.price, "submarine" );
    var_1 = getent( "hatch_model", "targetname" );
    level.hatch = var_1;
    var_2 = getent( "hatch_anim_org", "targetname" );
    var_1 maps\_utility::assign_animtree( "hatch" );
    var_2 thread maps\_anim::anim_single_solo( var_1, "hatch_anim" );
    var_3 = getent( "price_key_pos", "targetname" );
    level.price setgoalpos( var_3.origin );
    level.price.goalradius = 64;
    wait 4;
    var_4 = maps\_utility::get_force_color_guys( "allies", "g" );
    common_scripts\utility::array_thread( var_4, maps\_utility::set_force_color, "b" );
    maps\_utility::activate_trigger_with_targetname( "friendlies_go_to_guardhouse" );
    thread _id_AA6B();
    var_5 = getaiarray( "axis" );

    foreach ( var_7 in var_5 )
    {
        var_7.combatmode = "cover";
        var_7 setgoalpos( level.player.origin );
    }

    common_scripts\utility::flag_wait( "price_inside_sub" );
    maps\_utility::radio_dialogue( "cont_pri_insidesub" );
    common_scripts\utility::flag_wait_or_timeout( "defend_sub_vehicle_guys_dead", 50 );
    common_scripts\utility::flag_wait( "player_on_guardhouse" );
    thread open_door();
    var_9 = common_scripts\utility::getstruct( "sub_obj_enemies_flee", "targetname" ).origin;
    var_5 = getaiarray( "axis" );

    foreach ( var_7 in var_5 )
        var_7 thread _id_CE1B( var_9 );

    var_12 = getent( "defend_sub_stinger_source", "targetname" );
    _id_C9E7( var_12 );
    thread _id_BBE5();
    wait 1;
    maps\_utility::autosave_by_name( "defend2" );
    var_13 = getentarray( "defend_sub_final_guys", "targetname" );

    foreach ( var_7 in var_13 )
        var_7 maps\_utility::spawn_ai();

    wait 5;
    maps\_utility::activate_trigger_with_targetname( "contacts_south" );
    level._id_D040 maps\_utility::disable_ai_color();
    var_16 = getnode( "ghost_final", "targetname" );
    level._id_D040 setgoalnode( var_16 );
    level._id_D040 maps\_utility::dialogue_queue( "cont_gst_nexttosub" );
    common_scripts\utility::flag_set( "close_sub_hatch" );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    wait 14;
    thread _id_C7C9();
    var_9 = common_scripts\utility::getstruct( "contacts_south_flee_pos", "targetname" ).origin;
    var_5 = getaiarray( "axis" );

    foreach ( var_7 in var_5 )
    {
        if ( isdefined( var_7.targetname ) && issubstr( var_7.targetname, "defend_sub_final_guys" ) )
            var_7 thread _id_CE1B( var_9 );
    }

    var_19 = getent( "ending_sequence", "targetname" );
    var_19 thread maps\_anim::anim_single_solo( level._id_D040, "nuke_ending" );
    wait 6.4;
    wait 2.4;
    wait 3.9;
    wait 2;
    wait 9.6;
    wait 1;
    maps\_utility::radio_dialogue( "cont_pri_good2" );
    thread _id_BABD();
    wait 2.9;
    wait 2;
    wait 5;
    wait 1;
    maps\_utility::nextmission();
}

_id_D3A0()
{
    common_scripts\utility::flag_set( "stop_stealth_music" );
    maps\_utility::music_stop( 0.5 );
    wait 1;
    level endon( "stop_base_arrival_music" );
    var_0 = maps\_utility::musiclength( "mus_contingency_base_arrival" );

    for (;;)
    {
        maps\_utility::musicplaywrapper( "mus_contingency_base_arrival" );
        wait(var_0);
    }
}

_id_BBE5()
{
    common_scripts\utility::flag_set( "stop_stealth_music" );
    level notify( "stop_base_arrival_music" );
    maps\_utility::music_stop( 1 );
    level.player playsound( "mus_contingency_breakforsub" );
}

_id_AF86()
{
    var_0 = level._id_CC81;
    var_1 = 20 + var_0;

    while ( level._id_CC81 < var_1 )
        wait 1;

    maps\_utility::autosave_by_name( "x_killed" );
}

_id_C873()
{
    common_scripts\utility::flag_wait( "magic_break_stealth" );
    var_0 = getaispeciesarray( "axis", "all" );

    if ( var_0.size > 0 )
        var_0[0].favoriteenemy = level.player;
}

_id_BD4F()
{
    wait 4;
    var_0 = level.player getcurrentweapon();

    if ( var_0 == level._id_A8D0 || var_0 == level._id_CF8D )
        level.price maps\_utility::dialogue_queue( "cont_pri_grabweapon" );
}

_id_CBE7()
{
    var_0 = getent( "bricktop", "script_noteworthy" );
    var_0 maps\_utility::spawn_ai();
    var_1 = getent( "rasta", "script_noteworthy" );
    var_1 maps\_utility::spawn_ai();

    if ( isalive( level._id_C4CB ) )
        level._id_C4CB waittill( "death" );

    var_2 = getentarray( "village_redshirt", "script_noteworthy" );

    foreach ( var_4 in var_2 )
        var_4 maps\_utility::spawn_ai();
}

_id_BA6C()
{
    level.price maps\_utility::dialogue_queue( "cont_pri_rastaandbricktop" );
    maps\_utility::radio_dialogue( "cont_cmt_2nduav" );
    common_scripts\utility::flag_set( "said_second_uav_in_position" );
}

_id_AD02()
{
    self notify( "kill_treads_forever" );
    self endon( "death" );
    self endon( "kill_treads_forever" );
    common_scripts\utility::flag_wait( "incoming_btr" );
    var_0 = gettime() + getanimlength( maps\_utility::getanim( "contingency_btr_slide" ) ) * 1000;
    var_1 = "tag_origin";
    var_2 = self gettagorigin( var_1 );
    var_3 = 0.05;

    while ( gettime() + var_3 <= var_0 )
    {
        wait(var_3);
        var_4 = self gettagorigin( var_1 );
        var_5 = distance( var_4, var_2 ) / var_3;

        if ( var_5 < 20.0 )
        {
            var_2 = var_4;
            var_3 = 0.1;
            continue;
        }

        var_3 = 1 / var_5;
        var_3 = clamp( var_3 * 35, 0.1, 0.3 );
        maps\_vehicle_code::tread( self, 1.0, "tag_wheel_back_left", "back_left", 0 );
        maps\_vehicle_code::tread( self, 1.0, "tag_wheel_back_right", "back_right", 0 );
        var_2 = var_4;
    }
}

_id_C5E0()
{
    level.player endon( "death" );
    level endon( "safe_from_btrs" );

    for (;;)
    {
        wait 0.1;

        if ( distance( level.player.origin, level.price.origin ) < 400 )
        {
            level.price.moveplaybackrate = 1;
            continue;
        }

        var_0 = vectornormalize( level.player.origin - level.price.origin );
        var_1 = anglestoforward( level.price.angles );
        var_2 = vectordot( var_1, var_0 );

        if ( var_2 > 0 )
            level.price.moveplaybackrate = 1;
        else
            level.price.moveplaybackrate = 0.9;
    }
}

_id_C81F()
{
    level.price maps\_utility::dialogue_queue( "cont_pri_goingforsub" );
    level.price maps\_utility::dialogue_queue( "cont_pri_coverme" );
    level._id_D040 maps\_utility::dialogue_queue( "cont_gst_rogerthat" );
    level._id_D040 maps\_utility::dialogue_queue( "cont_gst_guardhouse" );

    while ( !common_scripts\utility::flag( "player_on_guardhouse" ) )
    {
        wait 20;

        if ( common_scripts\utility::flag( "player_on_guardhouse" ) )
            return;

        level.price maps\_utility::dialogue_queue( "cont_pri_coverme" );
        wait 20;

        if ( common_scripts\utility::flag( "player_on_guardhouse" ) )
            return;

        level._id_D040 maps\_utility::dialogue_queue( "cont_gst_guardhouse" );
    }
}

_id_AA6B()
{
    wait 24;
    level._id_B315 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "defend_sub_truck2" );
    level._id_B315 thread _id_B5B7();
    level._id_B315 thread _id_CA36( "cont_cmt_goodkilltruck" );
    wait 1;
    level._id_AC2B = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "defend_sub_truck3" );
    level._id_AC2B thread _id_B5B7();
    level._id_AC2B thread _id_CA36( "cont_cmt_goodkilltruck" );
    wait 3;
    level._id_D040 thread maps\_utility::dialogue_queue( "cont_gst_twotruckseast" );
    wait 15;
    level._id_D531 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "defend_sub_truck1" );
    level._id_D531 thread _id_B5B7();
    level._id_D531 thread _id_CA36( "cont_cmt_goodkilltruck" );
    wait 3.25;
    level._id_CEC9 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "defend_sub_jeep1" );
    level._id_CEC9 thread _id_B5B7();
    level._id_CEC9 thread _id_CA36( "cont_cmt_goodkilltruck" );
    level._id_CEC9 _meth_85C1( 0.5 );
    wait 1.75;
    level._id_D040 thread maps\_utility::dialogue_queue( "cont_gst_morevehicleseast" );
}

_id_D52F( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = -160;

        if ( var_3.script_noteworthy == "left" )
            var_4 = 160;

        var_3 movex( var_4, 2, 1, 0 );
    }

    for (;;)
    {
        common_scripts\utility::flag_clear( var_0 );
        wait 0.2;

        if ( !common_scripts\utility::flag( var_0 ) )
            break;
    }

    foreach ( var_3 in var_1 )
    {
        var_4 = 160;

        if ( var_3.script_noteworthy == "left" )
            var_4 = -160;

        var_3 movex( var_4, 2, 1, 0 );
    }
}

_id_B51E()
{
    var_0 = getent( "sub_hatch_th", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    var_1 = getent( "hatch_model", "targetname" );
    var_2 = getent( "hatch_model_collision", "targetname" );
    var_2 linkto( var_1 );
    var_1 rotatepitch( 120, 0.05 );
    common_scripts\utility::flag_wait( "close_sub_hatch" );
    var_1 rotatepitch( -120, 5 );
    wait 2;
    var_0 common_scripts\utility::trigger_on();
    wait 4;
    var_0 common_scripts\utility::trigger_off();
}

_id_C7C9()
{
    soundscripts\_snd::snd_message( "aud_start_mix_silo_doors" );
    var_0 = 5;
    var_1 = 0.1;
    var_2 = 3;
    var_3 = "sub_missile_door_";
    var_4 = 700;

    for ( var_5 = 1; var_5 <= 8; var_5++ )
    {
        var_6 = getentarray( var_3 + var_5, "targetname" );
        common_scripts\utility::array_thread( var_6, ::_id_A96D, var_0, var_1 );
        common_scripts\_exploder::exploder( var_4 );
        var_4++;
        wait(var_2);
    }
}

_id_A96D( var_0, var_1 )
{
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 1.0 ) );
    var_2.origin = self.origin;
    var_2 playsound( "missile_hatch_slams_open", "sounddone" );
    var_3 = self;
    var_3 rotateroll( -60, var_0, 0.2 );
    wait(var_0);
    var_3 rotateroll( -1, var_1 );
    wait(var_1);
    var_3 rotateroll( 1, var_1 );
    wait(var_1);
    wait 1;
    var_2 playrumbleonentity();
    wait 1;
    var_2 delete();
}

_id_BD63()
{
    common_scripts\utility::flag_wait( "first_patrol_cqb" );
    var_0 = getentarray( "first_patrol_cqb", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::spawn_ai();

    wait 6;
    maps\_utility::radio_dialogue( "cont_pri_searchingforus" );
}

_id_BABD()
{
    soundscripts\_snd::snd_message( "aud_stop_mix_silo_doors" );
    soundscripts\_snd::snd_message( "aud_start_mix_nuclear_launch" );
    var_0 = getent( "icbm_missile01", "targetname" );
    var_1 = getent( "missile01_start", "targetname" );
    var_2 = getent( "missile01_end", "targetname" );
    earthquake( 0.3, 12, var_0.origin, 8000 );
    level.player _meth_80B5( "tank_rumble" );
    level.player common_scripts\utility::delaycall( 8.0, ::_meth_80B6, "tank_rumble" );
    var_0 playsound( "scn_con_icbm_ignition" );
    var_0 linkto( var_1 );
    var_1 moveto( var_2.origin, 50, 10, 0 );
    playfxontag( level._effect["smoke_geotrail_icbm"], var_0, "TAG_NOZZLE" );
    common_scripts\_exploder::exploder( "icbm_launch" );
    wait 1;

    if ( distance( level.player.origin, var_1.origin ) < 1000 )
        level.player dodamage( level.player.health + 1000, var_1.origin );

    var_0 playloopsound( "scn_con_icbm_rocket_loop" );
    maps\contingency_lighting::_id_AED9( "contingency_nukelaunch" );
    maps\_utility::delaythread( 3.5, maps\contingency_lighting::_id_AED9, "contingency_post_nuke" );
    var_1 waittill( "movedone" );
    var_0 delete();
    soundscripts\_snd::snd_message( "aud_stop_mix_nuclear_launch" );
}

_id_CF05()
{
    var_0 = spawn( "trigger_radius", self gettagorigin( "tag_passenger" ) + ( 0.0, 0.0, -48.0 ), 0, 72, 72 );
    var_0 enablelinkto();
    var_0 linkto( self );
    var_0 waittill( "trigger" );
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player allowstand( 1 );
    maps\_utility::enableplayerweapons( 0 );
    level.player.rig = maps\_utility::spawn_anim_model( "player_rig" );
    level.player.rig hide();
    level.player.rig linkto( self, "tag_body" );
    thread maps\_anim::anim_single_solo( level.player.rig, "boneyard_uaz_mount", "tag_body" );
    thread maps\contingency_anim::_id_CF42();
    level.player playerlinktoblend( level.player.rig, "tag_player", 0.5 );
    wait 0.5;
    level.player.rig show();
    level.player playerlinktodelta( level.player.rig, "tag_player", 0.5, 180, 180, 75, 25, 1 );
    self waittill( "boneyard_uaz_mount" );
    level.player.rig hide();
    level.player lerpviewangleclamp( 0.5, 0.5, 0, 180, 180, 75, 35 );
    common_scripts\utility::flag_set( "player_in_uaz" );
}

_id_B1BD()
{
    level endon( "stop_sub_enemies" );
    var_0 = getentarray( "sub_enemies", "targetname" );

    for (;;)
    {
        for ( var_1 = 1 + randomint( 3 ); var_1 > 0; var_1-- )
            var_0[var_1 - 1] maps\_utility::spawn_ai();

        wait(randomintrange( 4, 14 ));
    }
}

_id_B3E1()
{
    common_scripts\utility::flag_wait( "player_on_sub" );
    var_0 = getent( "sub_ladder", "targetname" );
    var_0.realorigin = var_0.origin;
    var_0.origin += ( 0.0, 0.0, -10000.0 );
    common_scripts\utility::flag_wait( "player_turned_key" );
    var_0.origin = var_0.realorigin;
}

_id_BCF5()
{
    self.shootstyle = "single";
}

_id_AA17()
{
    common_scripts\utility::flag_set( "player_key_rdy" );
    var_0 = getent( "players_key", "targetname" );
    var_0 maps\_utility::glow();
    var_0 setcursorhint( "HINT_NOICON" );
    var_0 sethintstring( &"CONTINGENCY_TURN_KEY" );
    var_0 makeusable();
    var_0 waittill( "trigger", var_1 );
    common_scripts\utility::flag_set( "player_turned_key" );
    var_0 maps\_utility::stopglow();
    var_0 makeunusable();
}

_id_B60D()
{
    wait 10;
    var_0 = 1;

    while ( !common_scripts\utility::flag( "player_turned_key" ) )
    {
        if ( var_0 )
        {
            level.price maps\_utility::dialogue_queue( "cont_pri_runningout" );
            var_0 = 0;
        }
        else
        {
            level.price maps\_utility::dialogue_queue( "cont_pri_trustme" );
            var_0 = 1;
        }

        wait 10;
    }
}

_id_B1FC()
{
    common_scripts\utility::flag_wait( "player_dropping_into_sub" );
    var_0 = getentarray( "tear_gas_nodes", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        var_3 = getent( var_2.target, "targetname" );
        var_4 = var_2.script_animation;
        var_3 maps\_utility::add_spawn_function( ::_id_B691, var_4, var_2 );
        var_3 maps\_utility::spawn_ai();
    }
}

_id_CD1E()
{
    common_scripts\utility::flag_wait( "player_dropping_into_sub" );
    common_scripts\_exploder::exploder( "tear_gas_submarine" );
}

_id_B691( var_0, var_1 )
{
    self.health = 1;
    self.allowdeath = 1;
    self.ragdoll_immediate = 1;
    var_1 thread maps\_anim::anim_generic( self, var_0 );
}

debug_timer()
{
    for ( var_0 = 0; var_0 < 70; var_0 += 0.05 )
        wait 0.05;
}

_id_ADFE()
{
    level.player disableweapons();
    level.player giveweapon( "facemask" );
    level.player switchtoweapon( "facemask" );
    level.player _meth_80FA( "facemask", "nvg_down" );
    wait 2.0;
    level.player thread maps\_utility::play_loop_sound_on_tag( "gas_mask_breath" );
    setsaveddvar( "hud_gasMaskOverlay", 1 );
    wait 2.5;
    level.player takeweapon( "facemask" );
    level.player enableweapons();
}

_id_BD09()
{
    level endon( "base_btr2_dead" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "nag_player_to_destroy_btr" );
        level.price maps\_utility::dialogue_queue( "cont_pri_armoredvehicle" );
        wait 10;
    }
}

_id_CB9C()
{
    level._id_CACC endon( "death" );
    level._id_CACC vehicle_setspeed( 0, 15 );
    level._id_CACC maps\_vehicle::vehicle_unload();
    wait 1;

    if ( isdefined( level._id_CACC._id_C192 ) )
    {
        level._id_CACC._id_C192 = undefined;
        target_remove( level._id_CACC );
    }

    if ( isdefined( level._id_BD18 ) )
        level._id_BD18 = common_scripts\utility::array_remove( level._id_BD18, level._id_CACC );
}

_id_B639()
{
    maps\_stealth_utility::disable_stealth_for_ai();
    self.no_pistol_switch = undefined;
    self.ignoreall = 0;
    self.fixednode = 1;
    thread maps\_utility::set_battlechatter( 1 );
    maps\_utility::set_friendlyfire_warnings( 1 );
    self.dontevershoot = undefined;
    self.grenadeammo = 3;
    self.ignoreme = 0;
    self pushplayer( 0 );
    self.ignoresuppression = 0;
}

_id_B89A()
{
    var_0 = [];
    var_0[var_0.size] = "cont_bpa_underattack";
    var_0[var_0.size] = "cont_bpa_prejudice";
    var_0[var_0.size] = "cont_bpa_2ndplatoon";
    var_0[var_0.size] = "cont_bpa_alert";
    var_0[var_0.size] = "cont_bpa_battlestations";
    var_1 = 0;
    var_2 = getent( "base_pa", "targetname" );
    var_3 = getentarray( "base_alarm_sound", "targetname" );
    wait 2.0;

    while ( !common_scripts\utility::flag( "price_splits_off" ) )
    {
        for (;;)
        {
            var_2 maps\_utility::play_sound_on_entity( var_0[var_1] );
            var_1 = ( var_1 + 1 ) % var_0.size;
            wait 0.8;

            foreach ( var_5 in var_3 )
            {
                var_5 playloopsound( "emt_alarm_base_alert_echo" );
                var_5.playing = 1;
            }

            wait 10.5;

            foreach ( var_5 in var_3 )
            {
                var_5 stopsounds();
                var_5.playing = undefined;
            }

            wait 0.8;
        }
    }

    foreach ( var_5 in var_3 )
    {
        if ( isdefined( var_5.playing ) )
            var_5 stopsounds();
    }
}

_id_BE8C()
{
    level endon( "base_alerted" );
    level endon( "_stealth_spotted" );
    level.player waittill( "projectile_impact", var_0, var_1, var_2 );
}

_id_D2CF()
{
    if ( isdefined( self.ridingvehicle ) )
    {
        self endon( "death" );
        self waittill( "jumpedout" );
    }

    thread _id_BCA1::_id_CFA0();
}

_id_CA36( var_0 )
{
    self endon( "unloaded" );
    self waittill( "death" );
    wait 0.05;

    if ( !isdefined( level._id_C845 ) )
        level._id_C845 = 1;
    else
        level._id_C845++;

    level._id_C0E8 = var_0;
}

_id_B127()
{
    self waittill( "death" );

    if ( isdefined( self.ridingvehicle ) )
        return;

    wait 0.05;

    if ( !isdefined( level._id_CC81 ) )
        level._id_CC81 = 1;
    else
        level._id_CC81++;
}

_id_CF6C()
{
    var_0 = [];
    var_0[var_0.size] = "cont_cmt_mutlipleconfirmed";
    var_0[var_0.size] = "cont_cmt_3kills";
    var_0[var_0.size] = "cont_cmt_theyredown";
    var_1 = 0;
    var_2 = 0;
    level._id_CC81 = 0;
    level._id_C845 = 0;
    var_3 = 0;
    var_4 = 0;

    for (;;)
    {
        level waittill( "remote_missile_exploded" );
        var_5 = level._id_CC81;
        var_6 = level._id_C845;
        wait 0.3;
        var_7 = level._id_C845 - var_6;

        if ( isdefined( level._id_BF44["ai"] ) )
            var_4 = level._id_BF44["ai"];

        wait 1.2;

        if ( common_scripts\utility::flag( "saying_base_on_alert" ) )
            continue;

        if ( var_7 == 1 )
        {
            maps\_utility::radio_dialogue( level._id_C0E8 );
            continue;
        }

        if ( var_7 > 1 )
        {
            if ( var_3 )
            {
                maps\_utility::radio_dialogue( "cont_cmt_goodhitvehicles" );
                var_3 = 0;
            }
            else
            {
                maps\_utility::radio_dialogue( "cont_cmt_goodeffectkia" );
                var_3 = 1;
            }

            continue;
        }

        if ( var_4 == 0 )
            continue;

        if ( var_4 == 1 )
        {
            if ( var_2 )
            {
                maps\_utility::radio_dialogue( "cont_cmt_hesdown" );
                var_2 = 0;
            }
            else
            {
                maps\_utility::radio_dialogue( "cont_cmt_directhit" );
                var_2 = 1;
            }

            continue;
        }

        if ( var_4 > 5 )
        {
            maps\_utility::radio_dialogue( "cont_cmt_fivepluskias" );
            continue;
        }
        else
        {
            maps\_utility::radio_dialogue( var_0[var_1] );
            var_1++;

            if ( var_1 >= var_0.size )
                var_1 = 0;

            continue;
        }
    }
}

_id_B896()
{
    self endon( "death" );
    thread _id_B6F7();
    thread _id_AFF3();
    thread _id_BCA1::_id_CFA0();
    self waittill( "unloaded" );

    if ( isdefined( self._id_C192 ) )
    {
        self._id_C192 = undefined;
        target_remove( self );
    }

    level._id_BD18 = common_scripts\utility::array_remove( level._id_BD18, self );
}

_id_C8B0()
{
    var_0 = 0;
    var_1 = -10000;

    for (;;)
    {
        self waittill( "bad_path" );

        if ( gettime() - var_1 < 5000 )
            var_0++;
        else
        {
            var_0 = 0;
            var_1 = gettime();
        }

        if ( var_0 >= 9 )
        {
            var_0 = 0;

            foreach ( var_3 in level._id_ADED )
            {
                if ( isdefined( var_3 ) && !isalive( var_3 ) && distancesquared( var_3.origin, self.origin ) < 90000 )
                    var_3 thread _id_D512();
            }
        }
    }
}

_id_D512()
{
    self notify( "stop_vehicle_enabled_paths" );
    self endon( "stop_vehicle_enabled_paths" );
    self._id_C73B = 1;
    self connectpaths();
    wait 5;
    self disconnectpaths();
    self._id_C73B = undefined;
}

_id_B6F7()
{
    self endon( "delete" );
    self waittill( "kill_badplace_forever" );
    level._id_ADED[level._id_ADED.size] = self;
    var_0 = 2500;
    var_1 = self.origin;

    while ( isdefined( self ) )
    {
        if ( isdefined( self._id_C73B ) )
        {
            wait 0.5;
            continue;
        }

        if ( distancesquared( self.origin, var_1 ) > var_0 )
        {
            var_1 = self.origin;
            self connectpaths();

            for (;;)
            {
                if ( isdefined( self._id_C73B ) )
                {
                    wait 0.5;
                    continue;
                }

                wait 0.05;

                if ( !isdefined( self ) )
                    return;

                if ( distancesquared( self.origin, var_1 ) < 1 )
                    break;

                var_1 = self.origin;
            }

            self disconnectpaths();
        }

        wait 0.05;
    }
}

_id_AFF3()
{
    self endon( "unloading" );
    self endon( "death" );

    for (;;)
    {
        wait 2;

        if ( self vehicle_getspeed() < 2 )
        {
            self vehicle_setspeed( 0, 15 );
            self.dontunloadonend = 1;
            thread maps\_vehicle::vehicle_unload();
            return;
        }
    }
}

_id_B948()
{
    self endon( "unloading" );
    self endon( "death" );
    maps\_utility::waittill_entity_in_range( level.player, 1000 );
    self vehicle_setspeed( 0, 15 );
    self.dontunloadonend = 1;
    thread maps\_vehicle::vehicle_unload();
}

_id_C241()
{
    level._id_C0C6 = maps\_vehicle::spawn_vehicle_from_targetname( "base_heli" );
    level._id_C0C6.helicopter_predator_target_shader = 1;
    level._id_C0C6.enablerocketdeath = 1;
    level._id_C0C6 thread _id_BCA1::_id_CFA0();
    level._id_C0C6 thread maps\_vehicle_code::damage_hint_bullet_only();
    level._id_C0C6 thread _id_CA36( "cont_cmt_directhitshelo" );
    level._id_CC47 = maps\_vehicle::spawn_vehicle_from_targetname( "base_btr2" );
    level._id_CC47 thread _id_BCA1::_id_CFA0();
    level._id_CC47 thread maps\_vehicle::vehicle_lights_on( "spotlight spotlight_turret" );
    level._id_CC47 thread _id_CA36( "cont_cmt_btrdestroyed" );
    level._id_CACC = maps\_vehicle::spawn_vehicle_from_targetname( "base_truck1" );
    level._id_CACC thread _id_BCA1::_id_CFA0();
    level._id_CACC thread _id_CA36( "cont_cmt_directhitjeep" );
    thread _id_AF63();
}

_id_B283()
{
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::enable_ai_color();
        var_2 maps\_utility::set_force_color( "g" );
        var_2.pathrandompercent = 200;
        var_2.dontevershoot = 1;
        var_2 maps\_utility::set_battlechatter( 0 );
        var_2 maps\_utility::set_friendlyfire_warnings( 0 );
    }

    level.price maps\_utility::set_force_color( "r" );
    common_scripts\utility::flag_wait( "obj_base_entrance" );
    common_scripts\utility::flag_set( "everyone_set_green" );
    level.price maps\_utility::set_force_color( "g" );
    common_scripts\utility::flag_wait( "base_alerted" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2.dontevershoot = undefined;
        var_2 maps\_utility::set_battlechatter( 1 );
        var_2 maps\_utility::set_friendlyfire_warnings( 1 );
    }
}

_id_AF63()
{
    while ( !isdefined( level.player.is_controlling_uav ) && !common_scripts\utility::flag( "obj_base_entrance" ) )
        wait 0.05;

    thread maps\_vehicle::gopath( level._id_CC47 );
    thread maps\_vehicle::gopath( level._id_CACC );
}

_id_D1C9()
{
    var_0["ai_eventDistExplosion"] = [];
    var_0["ai_eventDistExplosion"]["spotted"] = 0;
    var_0["ai_eventDistExplosion"]["hidden"] = 0;
    maps\_stealth_utility::stealth_ai_event_dist_custom( var_0 );
    common_scripts\utility::flag_wait( "done_with_exploding_trees" );
    wait 1;
    var_0["ai_eventDistExplosion"] = [];
    var_0["ai_eventDistExplosion"]["spotted"] = level._id_D335;
    var_0["ai_eventDistExplosion"]["hidden"] = level._id_D335;
    maps\_stealth_utility::stealth_ai_event_dist_custom( var_0 );
}

_id_A91F( var_0 )
{
    if ( !isdefined( level._id_AB35 ) )
        level._id_AB35 = gettime();
    else if ( gettime() < level._id_AB35 + 15000 )
        return;

    level._id_AB35 = gettime();
    var_1 = getaiarray( "allies" );
    var_1[randomint( var_1.size )] maps\_utility::custom_battlechatter( "order_move_combat" );
}

_id_CE1B( var_0 )
{
    self endon( "death" );
    self setgoalpos( var_0 );
    self.diequietly = 1;
    self.ignoreme = 1;
    self.goalradius = 96;
    self waittill( "goal" );

    while ( self cansee( level.player ) )
        wait 1;

    self kill();
}

_id_B54C( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "leaving_village" );
    self setgoalpos( var_0 );
    self.diequietly = 1;
    self.ignoreme = 1;
    self.goalradius = 32;
    self waittill( "goal" );

    while ( self cansee( level.player ) )
        wait 1;

    self kill();
}

_id_AB34( var_0, var_1, var_2 )
{
    self notify( "stop_barney" );
    self endon( "stop_barney" );
    self endon( "death" );
    self cleargoalvolume();
    thread _id_D3A5();
    self.goalheight = 200;
    self.goalradius = 300;
    self.fixednode = 0;

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        var_3 = level.player.origin;
        var_4 = vectornormalize( var_1 - var_3 );
        var_5 = var_4 * 400;
        var_6 = var_5 + var_3;
        self setgoalpos( var_6 );
        wait 0.5;
    }

    self notify( "stop_adjust_movement_speed" );
    self.moveplaybackrate = 1.0;
    self setgoalpos( var_1 );

    if ( isdefined( var_2 ) )
        self setgoalvolume( var_2 );
}

_id_B148()
{
    common_scripts\utility::flag_wait( "going_down_ridge" );
    var_0 = 60;
    var_1 = var_0;
    var_2 = 0.9;
    var_3 = 1;

    for (;;)
    {
        var_4 = level.price geteye();

        if ( !maps\_utility::player_looking_at( var_4, var_2, var_3 ) )
        {
            var_0--;

            if ( var_0 <= 0 )
                break;
        }
        else
            var_0 = var_1;

        wait 0.05;
    }

    level.price maps\_utility::forceuseweapon( "aug_scope_arctic", "primary" );
}

_id_B6B2()
{

}

_id_B5B7()
{
    self makeentitysentient( "axis" );
    common_scripts\utility::waittill_either( "unloaded", "death" );
    self.ignoreme = 1;
}

_id_AE65()
{
    level endon( "price_starts_moving" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    level.price maps\_utility::anim_stopanimscripted();
}

_id_A948()
{
    var_0 = common_scripts\utility::getstruct( "price_intro_talk_struct", "script_noteworthy" );
    var_0 thread _id_AE65();
    var_0 maps\_anim::anim_reach_solo( level.price, "intro" );
    level.price _meth_8583();
    var_0 maps\_anim::anim_single_solo( level.price, "intro" );
    level.price _meth_8582();
    common_scripts\utility::flag_set( "price_starts_moving" );
    level.price notify( "_utility::follow_path" );
    level.price notify( "stop_going_to_node" );
    level.price maps\_utility::disable_ai_color();
    level.price thread maps\_utility::enable_cqbwalk();
    var_1 = getnode( "price_smart_path_to_road", "targetname" );
    level.price thread _id_AB1E( var_1 );
}

_id_AC59()
{
    common_scripts\utility::flag_wait( "price_on_ridge" );
    wait 3;
    common_scripts\utility::flag_wait( "going_down_ridge" );
    var_0 = getent( "ridge_price_overlook_org", "targetname" );
    var_0 maps\_anim::anim_single_solo( level.price, "slide" );
    level.price thread maps\_utility::disable_cqbwalk();

    if ( !common_scripts\utility::flag( "everyone_set_green" ) )
        level.price maps\_utility::set_force_color( "r" );

    level.price maps\_utility::enable_ai_color();
    maps\_utility::activate_trigger_with_targetname( "price_in_village_start" );
}

_id_D2E3()
{
    common_scripts\utility::flag_wait( "price_splits_off" );
    wait 2;

    if ( !isalive( level._id_C0C6 ) )
        return;

    var_0 = ( -13500.0, 876.0, 749.0 );
    var_1 = common_scripts\utility::getstruct( "kill_heli_fail_safe", "targetname" );

    if ( isdefined( var_1 ) )
        var_0 = var_1.origin;

    var_2 = magicbullet( "zippy_rockets", var_0, level._id_C0C6.origin );
    var_2 missile_settargetent( level._id_C0C6 );
}

_id_C5E8( var_0 )
{
    if ( !isdefined( level._id_C176 ) )
        return;

    var_1 = anglestoforward( level._id_C176.angles );
    var_2 = var_1 * 10000;
    var_3 = var_2 + level._id_C176.origin;

    if ( isdefined( level.player.is_controlling_uav ) )
    {
        playfx( common_scripts\utility::getfx( "thermal_missle_flash_inverted" ), var_0.origin );
        var_4 = magicbullet( "zippy_rockets_persistent", var_0.origin, var_3 );
    }
    else
    {
        playfx( common_scripts\utility::getfx( "missle_flash" ), var_0.origin );
        var_4 = magicbullet( "zippy_rockets_persistent", var_0.origin, var_3 );
    }

    var_0 playsound( "gauntlet_fires" );
    var_0 playsound( "gauntlet_ignition" );
    var_4 missile_settargetent( level.uav_target );
    thread stinger_think( var_4 );
    return var_4;
}

setup_dont_leave_hint()
{
    level endon( "mission failed" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_leaving_map" );
        maps\_utility::display_hint_timeout( "hint_dont_leave_price", 5 );
        wait 5;
    }
}

setup_dont_leave_failure()
{
    common_scripts\utility::flag_wait( "player_left_map" );
    level notify( "mission failed" );
    setdvar( "ui_deadquote", &"CONTINGENCY_DONT_LEAVE_FAILURE" );

    if ( isdefined( level.current_hint ) )
    {
        level.current_hint destroy();
        maps\_hud_util::_id_C22D();
    }

    maps\_utility::missionfailedwrapper();
}

_id_AA20()
{
    common_scripts\utility::flag_wait( "truckguys_dead" );
    common_scripts\utility::flag_wait( "cross_bridge_patrol_dead" );
    common_scripts\utility::flag_wait( "first_stragglers_dead" );
    common_scripts\utility::flag_wait( "rightside_patrol_dead" );
    common_scripts\utility::flag_set( "all_bridge_guys_dead" );
}

should_break_dont_leave()
{
    if ( common_scripts\utility::flag( "player_returning_to_map" ) )
        return 1;
    else
        return 0;
}

_id_BEDE()
{
    var_0 = 0;

    if ( isdefined( level._id_B1DF ) )
        var_0 = 1;

    if ( !isalive( level._id_C176 ) )
        var_0 = 1;

    if ( isdefined( level.player._id_CA3B ) )
        var_0 = 1;

    if ( common_scripts\utility::flag( "base_alerted" ) )
        var_0 = 1;

    if ( level.player getcurrentweapon() == "remote_missile_detonator" )
        var_0 = 1;

    return var_0;
}

_id_B34D()
{
    var_0 = 0;

    if ( level.player getcurrentweapon() == "remote_missile_detonator" )
        var_0 = 1;

    if ( level._id_B8E6 + 5000 < gettime() )
        var_0 = 1;

    return var_0;
}

_id_C9E7( var_0, var_1 )
{
    soundscripts\_snd::snd_message( "aud_start_mix_missile_uav" );

    if ( isdefined( var_1 ) )
    {
        var_2 = 184960000;
        var_3 = distancesquared( var_0.origin, level._id_C176.origin );
        var_4 = clamp( var_3 / var_2, 0.1, 1 );
        maps\_utility::delaythread( var_4, ::_id_C5E8, var_1 );
    }

    _id_C5E8( var_0 );
}

stinger_think( var_0 )
{
    var_1 = level.uav_target.origin;
    var_2 = 999999999;

    for (;;)
    {
        var_3 = distance( var_0.origin, level.uav_target.origin );

        if ( var_3 <= 300 )
            break;

        var_1 = level.uav_target.origin;
        wait 0.05;
    }

    var_0 delete();
    playfx( common_scripts\utility::getfx( "uav_explosion" ), var_1 );
    level.uav_target thread maps\_utility::play_sound_on_tag( "uav_explode" );
    level._id_B1DF = 1;
    level.player _id_C630::_id_C563( 0, 1 );

    if ( isdefined( level._id_C176 ) )
        level notify( "uav_destroyed" );

    soundscripts\_snd::snd_message( "aud_stop_mix_missile_uav" );

    if ( isdefined( level._id_C176 ) )
        level._id_C176 delete();
}

_id_C09D()
{
    if ( !isalive( level._id_C176 ) )
        return;

    if ( isdefined( level._id_B1DF ) )
        return;

    var_0 = getentarray( "uav_focus_point", "targetname" );
    var_1 = getent( "village_focus_point", "script_noteworthy" );
    level endon( "uav_destroyed" );
    level._id_C176 endon( "death" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "leaving_village" ) )
        {
            var_2 = common_scripts\utility::getclosest( level.player.origin, var_0 );
            var_3 = var_2.origin;
        }
        else
            var_3 = var_1.origin;

        var_4 = vectortoangles( var_3 - level._id_C176.origin );
        level.uavrig moveto( level._id_C176.origin, 0.1, 0, 0 );
        level.uavrig rotateto( var_4, 0.1, 0, 0 );
        wait 0.05;
    }
}

_id_BA79()
{
    level._id_B1DF = undefined;
    level.player _id_C630::_id_D47F( 0, "remote_missile_detonator" );
    level._id_ABDD = 0;
    level._id_C005 = 14;
    var_0 = 0;

    if ( !isalive( level._id_C176 ) )
    {
        var_0 = 1;
        level._id_C176 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "second_uav" );
        level._id_C176 playloopsound( "uav_engine_loop" );
    }

    if ( !isdefined( level.uavrig ) )
    {
        level.uavrig = spawn( "script_model", level._id_C176.origin );
        level.uavrig setmodel( "tag_origin" );
    }

    if ( !isdefined( level.uav_target ) )
        level.uav_target = spawn( "script_origin", level._id_C176.origin );

    level.uav_target.origin = level._id_C176.origin;
    level.uav_target linkto( level._id_C176 );

    if ( var_0 )
        thread _id_C09D();

    var_1 = level.player getweaponslistall();
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( var_4 == "remote_missile_detonator" )
            var_2 = 1;
    }

    if ( !var_2 )
    {
        level.player giveweapon( "remote_missile_detonator" );
        level.player setactionslot( 4, "weapon", "remote_missile_detonator" );
        setomnvar( "ui_updateactionslot", 1 );
    }
}

_id_CF9C()
{
    var_0 = [];
    var_0[var_0.size] = "cont_ru0_woods";
    var_0[var_0.size] = "cont_ru1_woods";
    var_0[var_0.size] = "cont_ru2_woods";
    var_0[var_0.size] = "cont_ru3_woods";
    var_0[var_0.size] = "cont_ru4_woods";

    while ( !common_scripts\utility::flag( "approaching_ridge" ) )
    {
        wait(randomfloatrange( 2, 4 ));
        var_1 = getentarray( "cqb_patrol", "script_noteworthy" );
        var_1 = common_scripts\utility::array_randomize( var_1 );

        foreach ( var_3 in var_1 )
        {
            if ( isalive( var_3 ) && !common_scripts\utility::flag( "_stealth_spotted" ) && !var_3 maps\_utility::ent_flag( "_stealth_attack" ) )
            {
                var_4 = var_0[randomint( var_0.size )];
                var_3 playsound( var_4 );
                break;
            }
        }
    }
}

_id_A9AA()
{
    if ( !maps\_stealth_utility::stealth_is_everything_normal() )
        return;

    level endon( "someone_became_alert" );
    level.price maps\_utility::dialogue_queue( "cont_pri_airsupport" );
    wait 1;
    maps\_utility::radio_dialogue( "cont_cmt_almostinpos" );
    level.price maps\_utility::dialogue_queue( "cont_pri_rogerthat" );
}

_id_B0ED()
{
    level._id_CC22 = 1;
    wait 2;
    level.price maps\_utility::dialogue_queue( "cont_pri_bollocks" );
    maps\_utility::radio_dialogue( "cont_cmt_whathappened" );
    level.price maps\_utility::dialogue_queue( "cont_pri_mobilesaminvillage" );
    level.price maps\_utility::dialogue_queue( "cont_pri_uavsharpish" );
    level._id_CC22 = undefined;
}

_id_C5B2()
{
    if ( common_scripts\utility::flag( "start_village_fight" ) )
        return;

    level endon( "start_village_fight" );

    while ( !isalive( level._id_D040 ) )
        wait 1;

    level.price maps\_utility::waittill_entity_in_range( level._id_D040, 300 );
    level.price maps\_utility::waittill_entity_in_range( level.player, 600 );
    level.price maps\_utility::dialogue_queue( "cont_pri_nicework" );
    level._id_D040 maps\_utility::dialogue_queue( "cont_rst_getmoving" );
}

_id_C535()
{
    self endon( "death" );
    self waittill( "jumpedout" );
    self.goalradius = 8000;
}

_id_AB1E( var_0 )
{
    self endon( "stop_smart_path_following" );
    self._id_BBB3 = var_0;
    self setgoalnode( var_0 );

    if ( !isdefined( var_0.target ) )
        return;

    var_1 = getnode( var_0.target, "targetname" );

    for (;;)
    {
        var_2 = undefined;
        var_3 = undefined;
        var_4 = getentarray( var_1.script_linkto, "script_linkname" );

        foreach ( var_6 in var_4 )
        {
            if ( var_6.classname == "trigger_multiple_flag_set" )
                var_2 = var_6;

            if ( var_6.classname == "info_volume" )
                var_3 = var_6;
        }

        common_scripts\utility::flag_wait( var_2.script_flag );
        var_3 maps\_utility::waittill_volume_dead();
        level notify( var_1.targetname );

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
            common_scripts\utility::flag_waitopen( "_stealth_spotted" );

        self setgoalnode( var_1 );
        self._id_BBB3 = var_1;

        if ( !isdefined( var_1.target ) )
            break;

        var_1 = getnode( var_1.target, "targetname" );
    }
}

_id_ABDE( var_0 )
{
    var_1 = var_0;

    for (;;)
    {
        if ( isdefined( var_1.script_linkto ) )
        {
            var_2 = getent( var_1.script_linkto, "script_linkname" );
            var_2 notify( "explode" );
        }

        wait 0.2;

        if ( isdefined( var_1.script_delay ) )
            wait(var_1.script_delay);

        if ( isdefined( var_1.target ) )
        {
            var_3 = common_scripts\utility::getstruct( var_1.target, "targetname" );
            var_1 = var_3;
            continue;
        }

        break;
    }
}

_id_B6FD()
{
    wait 3;
    level._id_AF06 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "btr_tree_destroyer" );
    level._id_AF06 maps\_vehicle::vehicle_lights_on( "spotlight spotlight_turret" );
    level._id_AF06 thread _id_D0C9();
    level._id_AF06 thread maps\_vehicle_code::damage_hints();
    level._id_AF06 _meth_85C1( 0.1 );
    level._id_AF06 _meth_85C5( 3.0 );
    level._id_AF06 _meth_85C7( 0.3 );
    level._id_AF06 thread maps\_utility::play_sound_on_entity( "scn_con_bmp2_skid" );
}

_id_D3A5()
{
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
    }
}

_id_CFAC()
{
    if ( distancesquared( self.origin, self.goalpos ) <= level._id_B964 )
        return 0;

    if ( common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), self.origin, level.cosine["70"] ) )
        return 0;

    return 1;
}

_id_B1D5()
{
    level endon( "player_slid_down" );
    common_scripts\utility::flag_wait( "returning_to_btrs" );
    level._id_AF06 setturrettargetent( level.player );
    var_0 = randomintrange( 2, 5 );

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        level._id_AF06 fireweapon();
        wait 0.35;
    }

    level._id_CD81 setturrettargetent( level.player );
    wait(randomfloatrange( 0.2, 0.5 ));
    var_0 = randomintrange( 2, 4 );

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        level._id_CD81 fireweapon();
        level._id_AF06 fireweapon();
        wait 0.35;
    }

    level.player dodamage( level.player.health + 1000, level._id_AF06.origin );
}

_id_D0C9()
{
    wait 10;
    level endon( "safe_from_btrs" );

    for (;;)
    {
        level.player maps\_utility::waittill_entity_out_of_range( level.price, 1000 );
        var_0 = vectornormalize( level.player.origin - level.price.origin );
        var_1 = anglestoforward( level.price.angles );
        var_2 = vectordot( var_1, var_0 );

        if ( var_2 < 0 )
            break;

        wait 0.1;
    }

    level notify( "shoot_at_player" );
    self setturrettargetent( level.player );
    var_3 = randomintrange( 2, 5 );

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        self fireweapon();
        wait 0.35;
    }

    level._id_CD81 setturrettargetent( level.player );
    wait(randomfloatrange( 0.2, 0.5 ));
    var_3 = randomintrange( 2, 4 );

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        level._id_CD81 fireweapon();
        self fireweapon();
        wait 0.35;
    }

    level.player dodamage( level.player.health + 1000, self.origin );
}

_id_BE63()
{
    level endon( "shoot_at_player" );
    common_scripts\utility::flag_wait( "end_of_tree_explosions" );
    wait 2;
    var_0 = getentarray( "trigger_tree_explosion", "targetname" );
    thread _id_C81B( var_0 );
    level._id_AF06 fireweapon();
    wait 0.2;
    thread _id_C81B( var_0 );
    level._id_AF06 fireweapon();
    wait 0.2;
    thread _id_C81B( var_0 );
    level._id_AF06 fireweapon();
    wait 1;
    thread _id_C81B( var_0 );
    level._id_AF06 fireweapon();
    wait 0.5;
    level._id_AF06 fireweapon();
    wait 1;
    thread _id_C81B( var_0 );
    level._id_AF06 fireweapon();
    wait 0.2;
    thread _id_C81B( var_0 );
    level._id_AF06 fireweapon();
    wait 0.2;
    level._id_AF06 fireweapon();
    wait 0.5;
    thread _id_C81B( var_0 );
    level._id_AF06 fireweapon();
    wait 0.8;
    level._id_AF06 fireweapon();
    wait 1;
    level._id_AF06 fireweapon();
    wait 1;
    level._id_AF06 fireweapon();
    wait 2;
    level._id_AF06 fireweapon();
    common_scripts\utility::flag_set( "done_with_exploding_trees" );
}

_id_C81B( var_0 )
{
    var_1 = var_0[randomint( var_0.size )];
    var_1 playsound( "contingency_tree_impact" );
    var_1 playsound( "contingency_tree_fall" );
}

_id_ADFF()
{
    level endon( "shoot_at_player" );
    var_0 = getent( self.target, "targetname" );

    if ( _id_C4F4( var_0 ) )
        return;
}

_id_C4F4( var_0 )
{
    level endon( "shoot_at_player" );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    [ var_1, var_2, var_3 ] = _id_CEBD( var_0 );

    if ( !isdefined( var_1 ) || !isdefined( var_2 ) )
        return 0;

    var_0 maps\_utility::assign_animtree();
    var_5 = [];

    if ( isdefined( var_0.target ) )
        var_5 = getentarray( var_0.target, "targetname" );

    var_0.collision_ground = undefined;
    var_6 = [];

    foreach ( var_8 in var_5 )
    {
        var_8.animname = "tree_snow_react";
        var_8 maps\_anim::setanimtree();

        if ( var_8.classname == "script_model" )
        {
            var_6[var_6.size] = var_8;
            continue;
        }

        if ( var_8.classname == "script_brushmodel" )
            var_0.collision_ground = var_8;
    }

    foreach ( var_11 in var_6 )
    {
        var_12 = undefined;
        [ var_12, var_14 ] = _id_CEBD( var_11 );

        if ( !isdefined( var_12 ) )
            continue;

        var_11 thread maps\_anim::anim_loop_solo( var_11, var_12, "stop idle" );
    }

    var_16 = 0;

    if ( isdefined( var_0.script_noteworthy ) && var_0.script_noteworthy == "hits_the_ground" )
        var_16 = 1;

    if ( var_16 )
        var_0.collision_ground notsolid();

    var_0 thread maps\_anim::anim_loop_solo( var_0, var_1, "stop idle" );
    self waittill( "trigger" );
    var_17 = level.player geteye();
    thread common_scripts\utility::play_sound_in_space( "scn_cont_btr_gun_whizby", var_17 );
    var_0 notify( "stop idle" );
    maps\_utility::array_notify( var_6, "stop idle" );
    var_0 setmodel( var_3 );
    var_0 maps\_anim::anim_first_frame_solo( var_0, var_2 );

    if ( maps\_utility::hastag( var_0.model, "tag_target" ) )
    {
        var_18 = var_0 gettagorigin( "tag_attack" );

        if ( isalive( level._id_CD81 ) )
        {
            level._id_CD81 setturrettargetvec( var_18 );
            level._id_CD81 fireweapon();
        }

        if ( isalive( level._id_AF06 ) )
        {
            level._id_AF06 setturrettargetvec( var_18 );
            level._id_AF06 fireweapon();
        }
    }

    var_0 playsound( "contingency_tree_impact" );
    var_0 playsound( "contingency_tree_fall" );

    foreach ( var_11 in var_6 )
    {
        wait 1;
        var_20 = undefined;
        [ var_14, var_20, var_14 ] = _id_CEBD( var_11 );

        if ( !isdefined( var_20 ) )
            continue;

        var_11 thread maps\_anim::anim_single_solo( var_11, var_20 );
    }

    var_0 maps\_anim::anim_single_solo( var_0, var_2 );
    waittillframeend;
    return 1;
}

h2_tree_hit_ground_check( var_0 )
{
    level endon( "shoot_at_player" );

    if ( level.player istouching( var_0.collision_ground ) )
        level.player kill();

    var_0.collision_ground solid();
    var_0 playsound( "contingency_tree_ground" );
}

_id_CEBD( var_0 )
{
    switch ( var_0.model )
    {
        case "foliage_contingency_snow_tall_animated":
            var_0.animname = "tree_snow_tall";
            return [ "idle_slow", "fall_broken", undefined ];
        case "h2_foliage_contingency_pine_snow_sm_b":
            var_0.animname = "tree_snow_mid";
            return [ "idle_slow", var_0.animation, "h2_foliage_contingency_pine_snow_sm_b" ];
        case "h2_foliage_contingency_pine_snow_lg_c":
            var_0.animname = "tree_snow_tall";
            return [ "idle_slow", var_0.animation, "h2_foliage_contingency_pine_snow_lg_c_animated" ];
        case "foliage_contingency_pine_snow_lg_b":
            var_0.animname = "tree_snow_react";
            return [ "idle_slow", var_0.animation, "h2_foliage_contingency_pine_snow_lg_clean_animated" ];
        case "foliage_contingency_snow_tall":
            var_0.animname = "tree_snow_react";
            return [ "idle_slow", var_0.animation, "foliage_contingency_snow_tall_react_animated" ];
        default:
            return [ undefined, undefined, undefined ];
    }
}

_id_ACAA()
{
    var_0 = 1;

    for (;;)
    {
        level waittill( "_stealth_saw_corpse" );
        wait 2;

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
            continue;
    }

    if ( var_0 )
    {
        maps\_utility::radio_dialogue( "cont_pri_foundabody" );
        var_0 = 0;
    }
    else
    {
        maps\_utility::radio_dialogue( "cont_pri_foundabody2" );
        var_0 = 1;
    }

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    wait 10;
    maps\_utility::radio_dialogue( "cont_pri_sametime" );
}

_id_B056()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    wait 3;

    if ( !maps\_stealth_utility::stealth_is_everything_normal() )
        return;

    if ( !isdefined( level._id_ACDA ) )
        level._id_ACDA = gettime();
    else if ( gettime() < level._id_ACDA + 15000 )
        return;

    level._id_ACDA = gettime();
    level notify( "player kill dialog" );
}

_id_B43C()
{
    var_0 = [];
    var_0[var_0.size] = "cont_pri_good";
    var_0[var_0.size] = "cont_pri_beautiful";
    var_0[var_0.size] = "cont_pri_nicelydone";
    var_0[var_0.size] = "cont_pri_welldone";
    var_0[var_0.size] = "cont_pri_goodwork";
    var_0[var_0.size] = "cont_pri_impressive";
    var_1 = 0;

    for (;;)
    {
        level waittill( "player kill dialog" );
        maps\_utility::radio_dialogue( var_0[var_1] );
        var_1++;

        if ( var_1 >= var_0.size )
            var_1 = 0;
    }
}

_id_AAB6()
{
    var_0 = 0;
    var_1 = [];
    var_1[var_1.size] = "cont_pri_gotone";
    var_1[var_1.size] = "cont_pri_hesdown2";
    var_1[var_1.size] = "cont_pri_tangodown";
    var_1[var_1.size] = "cont_pri_goodnight";
    var_1[var_1.size] = "cont_pri_targeteliminated";
    var_1[var_1.size] = "cont_pri_targetdown";

    for (;;)
    {
        level waittill( "dialog_price_kill" );
        wait 1.5;

        if ( isdefined( level._id_BB9A ) )
        {
            if ( gettime() < level._id_BB9A + 15000 )
                continue;
        }

        if ( !isdefined( level._id_ACDA ) )
            level._id_ACDA = gettime();
        else if ( gettime() < level._id_ACDA + 3000 )
            continue;

        level._id_ACDA = gettime();
        var_2 = var_1[var_0];
        maps\_utility::radio_dialogue( var_2 );
        var_0++;

        if ( var_0 >= var_1.size )
            var_0 = 0;
    }
}

_id_BD0A()
{
    var_0 = 0;
    var_1 = [];
    var_1[var_1.size] = "cont_pri_naptime";
    var_1[var_1.size] = "cont_pri_downboy";

    for (;;)
    {
        level waittill( "dialog_price_kill_dog" );
        wait 1.5;

        if ( isdefined( level._id_BB9A ) )
        {
            if ( gettime() < level._id_BB9A + 15000 )
                continue;
        }

        if ( !isdefined( level._id_ACDA ) )
            level._id_ACDA = gettime();
        else if ( gettime() < level._id_ACDA + 3000 )
            continue;

        level._id_ACDA = gettime();
        var_2 = var_1[var_0];
        maps\_utility::radio_dialogue( var_2 );
        var_0++;

        if ( var_0 >= var_1.size )
            var_0 = 0;
    }
}

_id_C81C()
{
    self waittill( "damage", var_0, var_1 );

    if ( !isdefined( var_1 ) )
        return;

    if ( isplayer( var_1 ) && isdefined( self.script_deathflag ) )
    {
        if ( self.script_deathflag != "blocking_stationary_dead" )
            thread _id_CE5B( self.script_deathflag );
    }
}

_id_BBAD()
{
    self waittill( "death", var_0 );

    if ( !isdefined( var_0 ) )
        return;

    if ( isplayer( var_0 ) )
    {
        thread _id_B056();
        return;
    }

    if ( level.price == var_0 && !isdefined( self._id_B2EE ) )
    {
        if ( self.type == "dog" )
            level notify( "dialog_price_kill_dog" );
        else
            level notify( "dialog_price_kill" );
    }
}

_id_CA60()
{
    if ( common_scripts\utility::flag( "player_on_ridge" ) )
        return;

    level endon( "player_on_ridge" );
    var_0 = [];
    var_0[var_0.size] = "cont_pri_giveawayposition";
    var_0[var_0.size] = "cont_pri_lowprofile";
    var_0[var_0.size] = "cont_pri_getuskilled";
    var_0[var_0.size] = "cont_pri_thewordstealth";
    var_1 = 0;

    for (;;)
    {
        common_scripts\utility::flag_wait( "_stealth_spotted" );
        wait 1;
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        wait 1;
        maps\_utility::radio_dialogue( var_0[var_1] );
        var_1++;

        if ( var_1 >= var_0.size )
            var_1 = 0;
    }
}

_id_AD50()
{
    var_0 = [];
    var_0[var_0.size] = "cont_pri_goloud";
    var_0[var_0.size] = "cont_pri_ontous";
    var_0[var_0.size] = "cont_pri_werespotted";
    var_0 = common_scripts\utility::array_randomize( var_0 );
    var_1 = 0;

    for (;;)
    {
        common_scripts\utility::flag_wait( "_stealth_spotted" );
        maps\_utility::radio_dialogue_stop();
        maps\_utility::radio_dialogue( var_0[var_1] );
        var_1++;

        if ( var_1 >= var_0.size )
            var_1 = 0;

        wait 1;
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        wait 1;
    }
}

_id_C46F()
{
    wait 0.5;
    level.price thread maps\_utility::disable_cqbwalk();
    level.price setlookatentity();

    if ( common_scripts\utility::flag( "someone_became_alert" ) )
        return;

    level endon( "someone_became_alert" );

    if ( common_scripts\utility::flag( "saying_patience" ) )
        return;

    level endon( "saying_patience" );
    common_scripts\utility::flag_set( "saying_contact" );
    maps\_utility::radio_dialogue( "cont_pri_30metersfront" );
    wait 2;
    maps\_utility::radio_dialogue( "cont_pri_fivemen" );
    wait 0.1;
    maps\_utility::radio_dialogue( "cont_cmt_hatedogs" );
    wait 0.4;
    maps\_utility::radio_dialogue( "cont_pri_russiandogs" );
    maps\_utility::radio_dialogue( "cont_cmt_haveyouback" );
    maps\_utility::radio_dialogue( "cont_pri_rogerthat2" );
    common_scripts\utility::flag_clear( "saying_contact" );
    level.price thread maps\_utility::enable_cqbwalk();
}

_id_B3C0()
{
    wait 6;

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    if ( common_scripts\utility::flag( "someone_became_alert" ) )
        return;

    level endon( "someone_became_alert" );
    level.price maps\_utility::dialogue_queue( "cont_pri_intelwasoff" );
    maps\_utility::radio_dialogue( "cont_cmt_rogerthat" );
    level.price maps\_utility::dialogue_queue( "cont_pri_foundtransport" );
    maps\_utility::radio_dialogue( "cont_cmt_workingonit" );
}

_id_BF2A()
{
    level endon( "_stealth_spotted" );
    level endon( "someone_became_alert" );
    level waittill( "price_starts_following" );

    if ( common_scripts\utility::flag( "saying_contact" ) )
        common_scripts\utility::flag_waitopen( "saying_contact" );

    if ( common_scripts\utility::flag( "said_convoy_coming" ) )
        return;

    maps\_utility::radio_dialogue( "cont_pri_pickoffstragglers" );
}

_id_C6EF()
{
    common_scripts\utility::flag_wait( "cross_bridge_patrol_dead" );
    common_scripts\utility::flag_wait( "rightside_patrol_dead" );
    common_scripts\utility::flag_set( "second_group_of_stragglers_are_dead" );
}

_id_B047()
{
    if ( common_scripts\utility::flag( "second_group_of_stragglers_are_dead" ) )
        return;

    level endon( "second_group_of_stragglers_are_dead" );
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "price_in_position_remaining_group" );
    thread _id_B905();
    maps\_utility::radio_dialogue( "cont_pri_imready" );

    if ( common_scripts\utility::flag( "cross_bridge_patrol_dead" ) || common_scripts\utility::flag( "rightside_patrol_dead" ) )
        return;

    maps\_utility::radio_dialogue( "cont_pri_twoonleft" );
}

_id_D2F8()
{
    if ( isdefined( self.script_delay ) )
        wait(self.script_delay);

    maps\_utility::spawn_ai();
}

_id_C146()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "patience" );
    common_scripts\utility::flag_set( "saying_patience" );
    level notify( "saying_patience" );
    level.price thread maps\_utility::enable_cqbwalk();
    maps\_utility::radio_dialogue( "cont_pri_patience" );
    wait 0.5;

    if ( !common_scripts\utility::flag( "start_truck_patrol" ) )
        maps\_utility::radio_dialogue( "cont_pri_sametime" );

    common_scripts\utility::flag_wait( "price_in_position_first_group" );
    common_scripts\utility::flag_wait( "first_stragglers_stopped" );
    common_scripts\utility::flag_wait( "last_truck_left" );
    wait_till_every_thing_stealth_normal_for( 1 );
    maps\_utility::autosave_by_name( "first_stragglers" );

    if ( common_scripts\utility::flag( "someone_became_alert" ) )
        return;

    level endon( "someone_became_alert" );

    if ( common_scripts\utility::flag( "first_stragglers_dead" ) )
        return;

    level endon( "first_stragglers_dead" );
    thread _id_A96F();
    wait 1;
    common_scripts\utility::flag_wait( "they_have_split_up" );
    maps\_utility::radio_dialogue( "cont_pri_forasmoke" );
}

_id_B905()
{
    var_0 = getaispeciesarray( "axis", "all" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "rightside_patrol" )
            var_2.threatbias = 20000;
    }

    level.price.ignoreall = 0;
    level.player waittill( "weapon_fired" );
    wait 0.2;
    level.price.dontevershoot = undefined;
    level.price.baseaccuracy = 5000000;
    var_0 = getaispeciesarray( "axis", "all" );

    foreach ( var_2 in var_0 )
    {
        var_2._id_B2EE = 1;
        var_2.dontattackme = undefined;
        var_2.health = 1;
    }

    common_scripts\utility::flag_wait( "second_group_of_stragglers_are_dead" );
    _id_AD9E();
}

_id_A96F()
{
    level.price.ignoreall = 0;
    level.player waittill( "weapon_fired" );
    wait 0.2;
    level.price.dontevershoot = undefined;
    level.price.baseaccuracy = 5000000;
    var_0 = getaispeciesarray( "axis", "all" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "first_stragglers" )
        {
            var_2._id_B2EE = 1;
            var_2.dontattackme = undefined;
            level.price.favoriteenemy = var_2;
            var_2.health = 1;
        }
    }

    common_scripts\utility::flag_wait( "first_stragglers_dead" );
    _id_AD9E();
}

_id_AD9E()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level.price.dontevershoot = 1;
    level.price.baseaccuracy = 1;
    level.price.ignoreall = 1;
}

_id_CE5B( var_0 )
{
    level endon( "_stealth_spotted" );
    level.price.maxsightdistsqrd = 64000000;
    wait 0.2;
    level.price.dontevershoot = undefined;
    level.price.baseaccuracy = 5000000;
    var_1 = getaispeciesarray( "axis", "all" );

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( !isalive( var_3 ) )
                continue;

            if ( isdefined( var_3.script_deathflag ) && var_3.script_deathflag == var_0 )
            {
                var_3.dontattackme = undefined;
                var_3.threatbias = 5000;

                if ( !isalive( level.price.enemy ) )
                    level.price.favoriteenemy = var_3;

                var_3.health = 1;
            }
        }

        wait 0.1;
    }

    _id_CCB0();
}

_id_CCB0()
{
    if ( common_scripts\utility::flag( "player_on_ridge" ) )
        return;

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level.price.dontevershoot = 1;
    level.price.baseaccuracy = 1;
    level.price.maxsightdistsqrd = level._id_AA5B;
}

_id_B3D6()
{
    thread _id_D205();
    level.price.ignoreall = 1;
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait_or_timeout( "last_jeep_arrived", 20 );
    wait 4;
    wait_till_every_thing_stealth_normal_for( 1 );
    maps\_utility::radio_dialogue( "cont_pri_yourparachute" );
    common_scripts\utility::flag_set( "convoy_hide_section_complete" );
    maps\_utility::autosave_stealth();
    thread _id_B4D6();
    level.price.ignoreall = 0;
    level.price thread maps\_utility::enable_cqbwalk();
    var_0 = getnode( "price_goes_halfway_across_bridge", "targetname" );
    level.price thread _id_AB1E( var_0 );
}

_id_B4D6()
{
    thread maps\_utility::radio_dialogue( "cont_pri_keepmoving" );
}

_id_D205()
{
    level endon( "convoy_hide_section_complete" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    wait 1;
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    wait 2;
    level.price thread maps\_utility::enable_cqbwalk();
    var_0 = getnode( "price_goes_halfway_across_bridge", "targetname" );
    level.price thread _id_AB1E( var_0 );
}

_id_BBCD()
{
    maps\_utility::radio_dialogue( "cont_pri_waitposition" );
}

_id_B06D()
{
    level.player waittill( "weapon_fired" );
    wait 0.2;
    level.price.dontevershoot = undefined;
    level.price.baseaccuracy = 5000000;
    level.price.ignoreall = 0;
    var_0 = getaispeciesarray( "axis", "all" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "cross_bridge_patrol" )
        {
            var_2._id_B2EE = 1;
            var_2.dontattackme = undefined;
            level.price.favoriteenemy = var_2;
            var_2.health = 1;
        }
    }
}

_id_AE15()
{
    level.player endon( "weapon_fired" );
    common_scripts\utility::flag_wait( "dialog_woods_first_patrol" );

    if ( common_scripts\utility::flag( "someone_became_alert" ) )
        return;

    level.price maps\_utility::radio_dialogue( "cont_pri_letpass" );
}

_id_BE1C()
{
    common_scripts\utility::flag_wait( "dialog_woods_first_dog_patrol" );

    if ( common_scripts\utility::flag( "someone_became_alert" ) )
        return;

    maps\_utility::autosave_stealth();
    level.price maps\_utility::radio_dialogue( "cont_pri_dogpatrol" );
}

_id_D0D5()
{
    common_scripts\utility::flag_wait( "dialog_woods_first_stationary" );

    if ( common_scripts\utility::flag( "someone_became_alert" ) )
        return;

    if ( common_scripts\utility::flag( "first_stationary_dead" ) )
        return;

    maps\_utility::autosave_stealth();
    level endon( "someone_became_alert" );
    level.price maps\_utility::radio_dialogue( "cont_pri_3manpatrol" );
    var_0 = level.player getcurrentweapon();

    if ( var_0 != level._id_A8D0 && var_0 != level._id_CF8D )
        level.price maps\_utility::radio_dialogue( "cont_pri_alertenemies" );

    level.price maps\_utility::radio_dialogue( "cont_pri_yourcall" );
    level._id_BB9A = gettime();
}

_id_AE33()
{
    var_0 = getaispeciesarray( "axis", "all" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.script_noteworthy ) )
            continue;

        if ( var_2.script_noteworthy == "blocking_group_left_two" )
            var_2.threatbias = 20000;
    }

    level.player waittill( "weapon_fired" );
    level.price.maxsightdistsqrd = 64000000;
    wait 0.2;
    level.price.dontevershoot = undefined;
    level.price.baseaccuracy = 5000000;
    var_0 = getaispeciesarray( "axis", "all" );

    while ( !common_scripts\utility::flag( "blocking_stationary_dead" ) )
    {
        foreach ( var_2 in var_0 )
        {
            if ( !isalive( var_2 ) )
                continue;

            if ( !isdefined( var_2.script_noteworthy ) )
                continue;

            if ( var_2.script_noteworthy == "blocking_group_left_two" )
            {
                if ( !isalive( level.price.enemy ) )
                    level.price.favoriteenemy = var_2;

                var_2.dontattackme = undefined;
                var_2.health = 1;
            }
        }

        foreach ( var_2 in var_0 )
        {
            if ( !isalive( var_2 ) )
                continue;

            if ( !isdefined( var_2.script_noteworthy ) )
                continue;

            if ( var_2.script_noteworthy == "two_on_right" )
            {
                var_2.dontattackme = undefined;
                var_2.health = 1;
            }
        }

        wait 0.1;
    }

    _id_CCB0();
}

_id_D33E()
{
    common_scripts\utility::flag_wait( "dialog_woods_blocking_stationary" );

    if ( common_scripts\utility::flag( "someone_became_alert" ) )
        return;

    if ( common_scripts\utility::flag( "blocking_stationary_dead" ) )
        return;

    maps\_utility::autosave_stealth();
    level endon( "someone_became_alert" );
    thread _id_AE33();
    level.price maps\_utility::radio_dialogue( "cont_pri_largepatrol12" );
    level.price maps\_utility::radio_dialogue( "cont_pri_cantslipby" );
    level.price maps\_utility::radio_dialogue( "cont_pri_twoonright" );
    level._id_BB9A = gettime();
}

_id_D367()
{
    common_scripts\utility::flag_wait( "dialog_woods_second_dog_patrol" );

    if ( common_scripts\utility::flag( "someone_became_alert" ) )
        return;

    maps\_utility::autosave_stealth();
    var_0 = getentarray( "end_patrol", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
            var_2.threatbias = 10000;
    }

    level.price maps\_utility::radio_dialogue( "cont_pri_anotherdogpatrol" );
    level.price maps\_utility::radio_dialogue( "cont_pri_slippast" );
}

_id_AC0F()
{
    level endon( "_stealth_spotted" );
    level endon( "someone_became_alert" );
    common_scripts\utility::flag_set( "said_convoy_coming" );
    level notify( "said_convoy_coming" );
    level.price maps\_utility::radio_dialogue( "cont_pri_convoycoming" );
    wait 2;
    level.price maps\_utility::radio_dialogue( "cont_pri_letthempass" );
}

_id_B192()
{
    var_0 = 0;
    var_1 = [];
    var_1[var_1.size] = "cont_pri_hideinwoods";
    var_1[var_1.size] = "cont_pri_getintowoods";
    var_1[var_1.size] = "cont_pri_theyrealerted";

    for (;;)
    {
        level waittill( "dialog_someone_is_alert" );
        var_2 = var_1[var_0];
        maps\_utility::radio_dialogue_clear_stack();
        maps\_utility::radio_dialogue( var_2 );

        if ( var_0 >= var_1.size )
            var_0 = 0;
    }
}

_id_C104()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "someone_became_alert" );

        if ( !common_scripts\utility::flag( "price_is_hiding" ) )
        {
            level.price.fixednode = 1;
            level.price maps\_utility::enable_ai_color();
            level.price maps\_utility::set_force_color( "y" );
            common_scripts\utility::flag_set( "price_is_hiding" );
        }

        common_scripts\utility::flag_waitopen( "someone_became_alert" );
    }
}

_id_C609()
{
    self endon( "death" );
    maps\_utility::ent_flag_waitopen( "_stealth_normal" );
    self.ignoreme = 0;

    if ( common_scripts\utility::flag( "someone_became_alert" ) )
        return;

    common_scripts\utility::flag_set( "someone_became_alert" );
    thread _id_AA31();
    wait 1;

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level notify( "dialog_someone_is_alert" );
}

_id_AA31()
{
    wait_till_every_thing_stealth_normal_for( 3 );
    common_scripts\utility::flag_clear( "someone_became_alert" );
}

wait_till_every_thing_stealth_normal_for( var_0 )
{
    for (;;)
    {
        if ( maps\_stealth_utility::stealth_is_everything_normal() )
        {
            wait(var_0);

            if ( maps\_stealth_utility::stealth_is_everything_normal() )
                return;
        }

        wait 1;
    }
}

_id_B9E6()
{
    level.price maps\_utility::dialogue_queue( "cont_pri_incoming" );
    level.price maps\_utility::dialogue_queue( "cont_pri_followme" );
    wait 2;
    level.price maps\_utility::dialogue_queue( "cont_pri_intothewoods" );
}

_id_B835()
{
    level endon( "base_alerted" );
    common_scripts\utility::flag_wait( "said_second_uav_in_position" );
    wait 1;
    common_scripts\utility::flag_wait( "obj_base_entrance" );
    level.price maps\_utility::dialogue_queue( "cont_pri_belowcrane" );
    level.price maps\_utility::dialogue_queue( "cont_pri_softendefenses" );
    maps\_utility::autosave_by_name( "base" );
    wait 1;
    level.player thread maps\_utility::display_hint_timeout( "hint_predator_drone", 6 );
    level.price maps\_utility::dialogue_queue( "cont_pri_strobes" );
}

_id_C432()
{
    common_scripts\utility::flag_set( "saying_base_on_alert" );
    maps\_utility::radio_dialogue( "cont_cmt_gotattention" );
    maps\_utility::radio_dialogue( "cont_cmt_baseonalert" );
    maps\_utility::radio_dialogue( "cont_cmt_betterhurry" );
    level._id_CC22 = undefined;
    level.price maps\_utility::dialogue_queue( "cont_pri_weremoving" );
    common_scripts\utility::flag_clear( "saying_base_on_alert" );
}

_id_CBED()
{
    common_scripts\utility::flag_wait( "player_is_halfway_to_sub" );
    maps\_utility::radio_dialogue( "cont_cmt_halwaythere" );

    if ( isalive( level._id_C0C6 ) )
    {
        level.price maps\_utility::dialogue_queue( "cont_pri_takeoutheli" );
        level._id_C0C6 makeentitysentient( "axis" );
    }

    common_scripts\utility::flag_wait( "base_troop_transport2_spawned" );
    wait 2;
    level.price maps\_utility::dialogue_queue( "cont_pri_usehellfire" );
}

_id_A906( var_0 )
{
    level.player endon( "death" );
    level endon( "kill_timer" );
    var_1 = 0;
    var_2 = [];
    var_2[var_2.size] = "cont_pri_subwontwait";
    var_2[var_2.size] = "cont_pri_gogogo";
    var_2[var_2.size] = "cont_pri_gettosub";
    var_2 = common_scripts\utility::array_randomize( var_2 );
    var_3 = 0;
    var_4 = 30;

    if ( var_0 % var_4 != 0 )
        var_4 = var_0 % var_4;

    for (;;)
    {
        wait(var_4);
        var_1 += var_4;
        var_4 = 30;
        var_5 = var_0 - var_1;

        if ( var_5 == 90 )
        {
            maps\_utility::radio_dialogue( "cont_cmt_90secs" );
            continue;
        }

        if ( var_5 == 60 )
        {
            maps\_utility::radio_dialogue( "cont_cmt_60secs" );
            continue;
        }

        if ( var_5 == 30 )
        {
            maps\_utility::radio_dialogue( "cont_cmt_30secs" );
            continue;
        }

        if ( var_5 == 0 )
            break;

        if ( common_scripts\utility::cointoss() )
        {
            level.price maps\_utility::dialogue_queue( var_2[var_3] );
            var_3++;

            if ( var_3 >= var_2.size )
                var_3 = 0;
        }
    }
}

_id_B1D1()
{
    level.price maps\_utility::dialogue_queue( "cont_pri_reachedsub" );
    maps\_utility::radio_dialogue( "cont_cmt_rogerthat2" );
}

_id_C45A( var_0 )
{
    var_1 = gettime();
    var_0 waittill( "death" );

    if ( gettime() > var_1 + 2000 )
        return;

    self setmodel( "vehicle_btr80_snow_d" );
    playfx( common_scripts\utility::getfx( "btr_explosion" ), self.origin );
    stopfxontag( common_scripts\utility::getfx( "btr_spotlight" ), self, "TAG_FRONT_LIGHT_RIGHT" );
    stopfxontag( common_scripts\utility::getfx( "btr_spotlight" ), self, "TAG_TURRET_LIGHT" );
}

_id_BB48()
{
    level endon( "saying_contact" );
    level.price setlookatentity( level.player );
    maps\_utility::radio_dialogue( "cont_cmt_barelysee" );
    level.price setlookatentity();
    level.price maps\_utility::radio_dialogue( "cont_pri_foundroach" );
    level.price maps\_utility::radio_dialogue( "cont_pri_headnw" );
    wait 1;
    maps\_utility::radio_dialogue( "cont_cmt_fareast" );
    level.price maps\_utility::radio_dialogue( "cont_pri_proceed" );
    wait 1;
    common_scripts\utility::flag_set( "said_follow_me" );
    maps\_utility::radio_dialogue( "cont_pri_outofsight" );
}

_id_BEA3()
{
    if ( common_scripts\utility::flag( "stop_stealth_music" ) )
        return;

    level endon( "stop_stealth_music" );

    for (;;)
    {
        thread _id_BECE();
        common_scripts\utility::flag_wait( "_stealth_spotted" );
        maps\_utility::music_stop( 0.2 );
        wait 0.5;
        thread _id_CB2A();
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        maps\_utility::music_stop( 3 );
        wait 3.25;
    }
}

_id_BECE()
{
    var_0 = maps\_utility::musiclength( "mus_contingency_stealth" );
    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "stop_stealth_music" ) )
        return;

    level endon( "stop_stealth_music" );

    for (;;)
    {
        maps\_utility::musicplaywrapper( "mus_contingency_stealth" );
        wait(var_0);
        wait 10;
    }
}

_id_CB2A()
{
    var_0 = maps\_utility::musiclength( "mus_contingency_stealth_busted" );
    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "stop_stealth_music" ) )
        return;

    level endon( "stop_stealth_music" );

    for (;;)
    {
        maps\_utility::musicplaywrapper( "mus_contingency_stealth_busted" );
        wait(var_0);
        wait 3;
    }
}

_id_AA8C()
{
    var_0 = getentarray( "cargo_heli_group2", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = getentarray( var_2.script_noteworthy, "targetname" );

        foreach ( var_5 in var_3 )
            var_5 hide();

        var_2._id_BD88 = var_3;
    }

    common_scripts\utility::flag_wait( "cargo_choppers_2" );
    soundscripts\_snd::snd_message( "aud_start_mix_2nd_heli_flyby" );
    thread _id_B3C0();
    var_8 = 0;

    for ( var_9 = 1; var_9 > 0; var_9-- )
    {
        for ( var_10 = var_0.size; var_10 > 0; var_10-- )
        {
            if ( var_8 >= var_0.size )
                var_8 = 0;

            thread _id_ADCD( var_0[var_8] );
            var_8++;
            wait(randomfloatrange( 1.3, 1.8 ));
        }
    }
}

_id_BC70()
{
    soundscripts\_snd::snd_message( "aud_start_heli_flyby_echo" );
    var_0 = getentarray( "cargo_heli", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = getentarray( var_2.script_noteworthy, "targetname" );

        foreach ( var_5 in var_3 )
            var_5 hide();

        var_2._id_BD88 = var_3;
    }

    var_8 = 0;

    for ( var_9 = 1; var_9 > 0; var_9-- )
    {
        for ( var_10 = var_0.size; var_10 > 0; var_10-- )
        {
            if ( var_8 >= var_0.size )
                var_8 = 0;

            thread _id_ADCD( var_0[var_8] );
            var_8++;
            wait(randomfloatrange( 1.3, 1.8 ));
        }
    }
}

_id_ADCD( var_0 )
{
    var_1 = maps\_vehicle::vehicle_spawn( var_0 );
    wait 0.1;
    var_2 = var_0._id_BD88;
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_3[var_4] = spawn( var_2[var_4].classname, var_2[var_4].origin );
        var_3[var_4].angles = var_2[var_4].angles;

        if ( var_3[var_4].classname == "script_model" )
            var_3[var_4] setmodel( var_2[var_4].model );

        var_3[var_4] linkto( var_1 );
    }

    wait 0.1;
    thread maps\_vehicle::gopath( var_1 );
    var_1 waittill( "death" );

    foreach ( var_6 in var_3 )
        var_6 delete();
}

_id_B577( var_0, var_1, var_2, var_3 )
{
    var_4 = "TAG_WEAPON_CHEST";
    var_5 = [];
    var_5[var_5.size] = self;
    var_0 maps\_anim::anim_reach_and_plant( var_5, "at4_fire" );
    self.allowpain = 0;
    self notify( "finished_anim_reach" );
    var_0 thread maps\_anim::anim_custom_animmode( var_5, "gravity", "at4_fire" );
    self waittill( "attach rocket" );
    maps\_utility::place_weapon_on( "at4", "chest" );
    self waittill( "fire rocket" );
    var_6 = self gettagorigin( var_4 );
    var_7 = magicbullet( "at4_straight", var_6, var_1.origin + var_2 );
    self waittill( "drop rocket" );
    var_8 = self gettagorigin( var_4 );
    var_9 = self gettagangles( var_4 );
    maps\_utility::place_weapon_on( "at4", "none" );

    if ( self.script_noteworthy == "rasta" )
    {
        var_10 = spawn( "script_model", var_8 + ( 0.0, 0.0, -3.0 ) );
        var_10 setmodel( "h2_weapon_at4" );
        var_10.angles = var_9 + ( 8.0, 0.0, 0.0 );
    }
    else
    {
        var_10 = spawn( "script_model", var_8 + ( 0.0, 0.0, -10.0 ) );
        var_10 setmodel( "h2_weapon_at4" );
        var_10.angles = var_9 + ( 10.0, 0.0, 0.0 );
    }

    var_0 waittill( "at4_fire" );
    self.allowpain = 1;

    if ( isalive( var_1 ) )
        var_1 kill();
}

_id_B573()
{
    self waittill( "death" );
    level._id_B0EE++;
}

_id_C319()
{
    level._id_BB6F = self;
    self.animname = "bricktop";
}

_id_A880()
{
    thread maps\_utility::replace_on_death();
}

_id_C23C()
{

}

_id_B87B()
{
    thread maps\_utility::magic_bullet_shield();

    if ( isalive( level._id_C4CB ) )
    {
        maps\_utility::place_weapon_on( "at4", "back" );
        var_0 = getent( self.target, "targetname" );
        var_1 = level._id_C4CB;
        var_2 = ( 0.0, 0.0, 64.0 );
        thread _id_B577( var_0, var_1, var_2 );
        self waittill( "finished_anim_reach" );
        level._id_D040 maps\_utility::dialogue_queue( "cont_rst_standback" );
        var_0 waittill( "at4_fire" );
    }

    thread maps\_utility::stop_magic_bullet_shield();
    maps\_utility::set_force_color( "g" );
    maps\_utility::enable_ai_color();
}

_id_B6AE()
{
    self.animname = "rasta";
    level._id_D040 = self;
    thread maps\_utility::magic_bullet_shield();
}

_id_C656()
{
    if ( isalive( level._id_CD07 ) )
    {
        maps\_utility::place_weapon_on( "at4", "back" );
        var_0 = getent( self.target, "targetname" );
        var_1 = level._id_CD07;
        var_2 = ( 0.0, 0.0, 64.0 );
        thread _id_B577( var_0, var_1, var_2 );
        self waittill( "finished_anim_reach" );
        level._id_D040 maps\_utility::dialogue_queue( "cont_rst_getback" );
        var_0 waittill( "at4_fire" );
    }

    maps\_utility::set_force_color( "g" );
    maps\_utility::enable_ai_color();
    level._id_D040 maps\_utility::dialogue_queue( "cont_rst_checkfire" );
}

_id_CDB4()
{
    level.price = self;
    level.price.animname = "price";

    if ( level._id_D3DC )
        level.price maps\_utility::place_weapon_on( "at4", "back" );

    level.price maps\_utility::enable_ai_color();
    level.price.pathrandompercent = 0;
    level.price thread maps\_utility::magic_bullet_shield();
    level.price maps\_utility::make_hero();
    level.price.allowdeath = 0;
    thread animscripts\utility::personalcoldbreath();
}

_id_B4B4()
{
    maps\_stealth_utility::stealth_set_default_stealth_function( "bridge_area", ::_id_D4A0 );
    maps\_stealth_utility::stealth_set_default_stealth_function( "woods", ::_id_C25F );
    maps\_stealth_utility::stealth_set_default_stealth_function( "base", ::_id_B338 );
    var_0 = [];
    var_0["ai_eventDistNewEnemy"] = [];
    var_0["ai_eventDistNewEnemy"]["spotted"] = 512;
    var_0["ai_eventDistNewEnemy"]["hidden"] = 256;
    var_0["ai_eventDistExplosion"] = [];
    var_0["ai_eventDistExplosion"]["spotted"] = level._id_D335;
    var_0["ai_eventDistExplosion"]["hidden"] = level._id_D335;
    var_0["ai_eventDistDeath"] = [];
    var_0["ai_eventDistDeath"]["spotted"] = 512;
    var_0["ai_eventDistDeath"]["hidden"] = 512;
    var_0["ai_eventDistPain"] = [];
    var_0["ai_eventDistPain"]["spotted"] = 256;
    var_0["ai_eventDistPain"]["hidden"] = 256;
    var_0["ai_eventDistBullet"] = [];
    var_0["ai_eventDistBullet"]["spotted"] = 96;
    var_0["ai_eventDistBullet"]["hidden"] = 96;
    var_0["ai_eventDistFootstep"] = [];
    var_0["ai_eventDistFootstep"]["spotted"] = 300;
    var_0["ai_eventDistFootstep"]["hidden"] = 300;
    var_0["ai_eventDistFootstepWalk"] = [];
    var_0["ai_eventDistFootstepWalk"]["spotted"] = 300;
    var_0["ai_eventDistFootstepWalk"]["hidden"] = 300;
    var_0["ai_eventDistFootstepSprint"] = [];
    var_0["ai_eventDistFootstepSprint"]["spotted"] = 400;
    var_0["ai_eventDistFootstepSprint"]["hidden"] = 400;
    maps\_stealth_utility::stealth_ai_event_dist_custom( var_0 );
    var_1 = [];
    var_1["prone"] = 800;
    var_1["crouch"] = 1200;
    var_1["stand"] = 1600;
    var_2 = [];
    var_2["prone"] = 8192;
    var_2["crouch"] = 8192;
    var_2["stand"] = 8192;
    maps\_stealth_utility::stealth_detect_ranges_set( var_1, var_2 );
    maps\_stealth_utility::stealth_alert_level_duration( 0.5 );
    maps\_stealth_utility::stealth_ai_event_dist_custom( var_0 );
    var_3 = [];
    var_3["sight_dist"] = 400;
    var_3["detect_dist"] = 200;
    maps\_stealth_utility::stealth_corpse_ranges_custom( var_3 );
}

_id_AA35()
{
    var_0["ai_eventDistFootstep"] = [];
    var_0["ai_eventDistFootstep"]["spotted"] = 120;
    var_0["ai_eventDistFootstep"]["hidden"] = 120;
    var_0["ai_eventDistFootstepWalk"] = [];
    var_0["ai_eventDistFootstepWalk"]["spotted"] = 60;
    var_0["ai_eventDistFootstepWalk"]["hidden"] = 60;
    var_0["ai_eventDistFootstepSprint"] = [];
    var_0["ai_eventDistFootstepSprint"]["spotted"] = 400;
    var_0["ai_eventDistFootstepSprint"]["hidden"] = 400;
    maps\_stealth_utility::stealth_ai_event_dist_custom( var_0 );
    var_1 = [];
    var_1["prone"] = 250;
    var_1["crouch"] = 450;
    var_1["stand"] = 500;
    var_2 = [];
    var_2["prone"] = 500;
    var_2["crouch"] = 500;
    var_2["stand"] = 600;
    maps\_stealth_utility::stealth_detect_ranges_set( var_1, var_2 );
    var_3 = [];
    var_3[0] = 1;
    var_3[1] = 1;
    var_3[2] = 1;
    var_3[3] = 0.75;
    maps\_stealth_utility::stealth_alert_level_duration( var_3[level.gameskill] );
}

_id_B0AE()
{
    wait 3;
}

_id_C25F()
{
    maps\_stealth_utility::stealth_plugin_basic();

    if ( isplayer( self ) )
        return;

    switch ( self.team )
    {
        case "axis":
            if ( self.type == "dog" )
            {
                thread _id_BE4E();
                _id_C368( "dogs" );
            }
            else
            {
                thread _id_B986();
                self.preplaceweapononfunc = ::weaponswapcheckdetachflashlight;
                self.postplaceweapononfunc = ::weaponswapcheckattachflashlight;
                self.cheat._id_BDF2 = 1;
                self.cheat.wolfmode_presetmodelfunc = ::detach_flashlight_wolfmode;
                self.cheat.wolfmode_postsetmodelfunc = ::attach_flashlight_wolfmode;
            }

            self.pathrandompercent = 0;
            maps\_stealth_utility::stealth_plugin_threat();
            maps\_stealth_utility::stealth_pre_spotted_function_custom( ::_id_B0AE );
            var_0["warning1"] = maps\_stealth_threat_enemy::enemy_alert_level_warning2;
            var_0["attack"] = ::_id_B3ED;
            maps\_stealth_utility::stealth_threat_behavior_custom( var_0 );
            maps\_stealth_utility::stealth_enable_seek_player_on_spotted();
            maps\_stealth_utility::stealth_plugin_corpse();
            maps\_stealth_utility::stealth_plugin_event_all();
            self.baseaccuracy = 2;
            self.fovcosine = 0.5;
            self.fovcosinebusy = 0.1;
            thread _id_C609();
            thread _id_BBAD();
            thread _id_C81C();
            _id_B669();

            if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "cqb_patrol" )
            {
                if ( isdefined( self.script_patroller ) )
                {
                    wait 0.05;
                    maps\_utility::clear_run_anim();
                }

                thread maps\_utility::enable_cqbwalk();
                self.alertlevel = "alert";
                self.disablearrivals = undefined;
                self.disableexits = undefined;
                self.moveplaybackrate = 0.8;
                thread _id_C2E0();
            }

            break;
        case "allies":
    }
}

weaponswapcheckdetachflashlight( var_0, var_1 )
{
    if ( !( isdefined( self.have_flashlight ) && self.have_flashlight ) )
        return;

    if ( var_0 == self.primaryweapon && var_1 != "right" )
        detach_flashlight();
}

weaponswapcheckattachflashlight( var_0, var_1 )
{
    if ( isdefined( self.have_flashlight ) && self.have_flashlight )
        return;

    if ( var_0 == self.primaryweapon && var_1 == "right" )
        _id_B986();
}

_id_C2E0()
{
    self endon( "death" );

    for (;;)
    {
        maps\_utility::set_generic_idle_anim( "cqb_stand_idle_scan" );
        self waittill( "clearing_specialIdleAnim" );
    }
}

_id_D4A0()
{
    maps\_stealth_utility::stealth_plugin_basic();

    if ( isplayer( self ) )
        return;

    switch ( self.team )
    {
        case "axis":
            if ( self.type == "dog" )
            {
                thread _id_BE4E();
                _id_C368( "dogs" );
            }

            if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "truck_guys" )
                _id_C368( "truck_guys" );
            else
                _id_C368( "bridge_stealth_guys" );

            maps\_stealth_utility::stealth_plugin_threat();
            self.pathrandompercent = 0;
            var_0["warning1"] = maps\_stealth_threat_enemy::enemy_alert_level_warning2;
            var_0["attack"] = ::_id_B3ED;
            maps\_stealth_utility::stealth_threat_behavior_custom( var_0 );
            maps\_stealth_utility::stealth_enable_seek_player_on_spotted();
            maps\_stealth_utility::stealth_plugin_corpse();
            maps\_stealth_utility::stealth_plugin_event_all();
            self.baseaccuracy = 3;
            self.fovcosine = 0.86;
            self.fovcosinebusy = 0.1;
            thread _id_BBAD();
            thread _id_C609();

            if ( isdefined( self.script_type ) && self.script_type == "cold_patrol" )
                _id_B669();

            break;
        case "allies":
            var_1 = [];
            var_1["hidden"] = ::_id_C1E6;
            var_1["spotted"] = ::_id_AC6A;
            maps\_stealth_utility::stealth_basic_states_custom( var_1 );
    }
}

_id_B338()
{
    maps\_stealth_utility::stealth_plugin_basic();

    if ( isplayer( self ) )
        return;

    switch ( self.team )
    {
        case "axis":
            maps\_stealth_utility::stealth_plugin_threat();
            self.pathrandompercent = 0;
            var_0["attack"] = ::_id_D0F5;
            maps\_stealth_utility::stealth_threat_behavior_custom( var_0 );
            maps\_stealth_utility::stealth_plugin_event_all();
            self.fovcosine = 0.76;
            self.fovcosinebusy = 0.1;
            maps\_stealth_event_enemy::stealth_event_mod( "doFlashBanged", ::base_flash_event_override_func );

            if ( isdefined( self.script_type ) && self.script_type == "cold_patrol" )
                _id_B669();

            break;
        case "allies":
            var_1 = [];
            var_1["hidden"] = ::_id_C1E6;
            var_1["spotted"] = ::_id_AC6A;
            maps\_stealth_utility::stealth_basic_states_custom( var_1 );
    }
}

base_flash_event_override_func( var_0 )
{
    self.favoriteenemy = level.player;
    wait 1;
    self notify( "enemy_awareness_reaction" );
    waitframe();
}

_id_B3D9()
{
    self endon( "death" );

    if ( maps\_utility::ent_flag( "dynamic_run_speed_stopped" ) )
        return;

    if ( maps\_utility::ent_flag( "dynamic_run_speed_stopping" ) )
        return;

    self endon( "stop_dynamic_run_speed" );
    maps\_utility::ent_flag_set( "dynamic_run_speed_stopping" );
    maps\_utility::ent_flag_set( "dynamic_run_speed_stopped" );
    var_0 = "DRS_run_2_stop";
    maps\_anim::anim_generic_custom_animmode( self, "gravity", var_0 );
    maps\_utility::ent_flag_clear( "dynamic_run_speed_stopping" );

    if ( !maps\_utility::ent_flag( "dynamic_run_speed_stopped" ) )
        return;

    self endon( "dynamic_run_speed_stopped" );

    if ( isdefined( self.loops ) && self.loops > 0 )
        return;

    while ( maps\_utility::ent_flag( "dynamic_run_speed_stopped" ) )
    {
        var_1 = "DRS_stop_idle";
        thread maps\_anim::anim_generic_loop( self, var_1 );

        if ( isdefined( level.scr_anim["generic"]["signal_go"] ) )
            maps\_utility::handsignal( "go" );

        wait(randomfloatrange( 12, 20 ));

        if ( maps\_utility::ent_flag_exist( "_stealth_stance_handler" ) )
            maps\_utility::ent_flag_waitopen( "_stealth_stance_handler" );

        self notify( "stop_loop" );

        if ( !maps\_utility::ent_flag( "dynamic_run_speed_stopped" ) )
            return;

        if ( isdefined( level.dynamic_run_speed_dialogue ) )
        {
            var_2 = common_scripts\utility::random( level.dynamic_run_speed_dialogue );
            level thread maps\_utility::radio_dialogue_queue( var_2 );
        }

        if ( isdefined( level.scr_anim["generic"]["signal_go"] ) )
            maps\_utility::handsignal( "go" );
    }
}

_id_BE4E()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "master_reached_patrol_end" );
        self.fovcosine = 0.99;
        self notify( "end_patrol" );
        self waittill( "_stealth_normal" );
        self.fovcosine = 0.76;
    }
}

_id_AECB()
{
    self.pathrandompercent = 200;
    thread maps\_utility::disable_cqbwalk();

    if ( isdefined( self.script_stealthgroup ) )
        thread maps\_stealth_shared_utilities::enemy_announce_spotted( self.origin );

    self.goalradius = 400;
    self.favoriteenemy = level.player;
    self setgoalentity( level.player );
    self waittill( "death" );
    level._id_AE58--;
}

_id_B3ED()
{
    self.pathrandompercent = 200;
    thread maps\_utility::disable_cqbwalk();
    thread maps\_stealth_shared_utilities::enemy_announce_spotted( self.origin );
    self.goalradius = 400;
    self endon( "death" );
    maps\_utility::ent_flag_set( "_stealth_override_goalpos" );

    while ( isdefined( self.enemy ) && maps\_utility::ent_flag( "_stealth_enabled" ) )
    {
        self setgoalpos( self.enemy.origin );
        wait 4;
    }
}

_id_ACB8()
{
    self endon( "death" );
    self.ignoreme = 1;
    self.maxsightdistsqrd = 360000;
    common_scripts\utility::flag_wait( "base_alerted" );
    self.ignoreme = 0;
    self.maxsightdistsqrd = 64000000;
    self.favoriteenemy = level.player;
    wait 1;
    self.favoriteenemy = undefined;
    self.pathrandompercent = 200;
    thread maps\_utility::disable_cqbwalk();
    self.combatmode = "ambush";
    self setgoalpos( self.origin );
    self.goalradius = 4000;
    self.maxsightdistsqrd = 64000000;
}

_id_D0F5()
{

}

_id_C1E6()
{
    common_scripts\utility::flag_clear( "price_is_hiding" );
    self.no_pistol_switch = 1;

    if ( !common_scripts\utility::flag( "player_on_ridge" ) && common_scripts\utility::flag( "safe_from_btrs" ) )
        self.maxsightdistsqrd = level._id_AA5B;

    self.ignoreclosefoliage = 1;

    if ( !common_scripts\utility::flag( "approaching_ridge" ) )
    {
        maps\_utility::disable_ai_color();

        if ( isdefined( self._id_BBB3 ) )
        {
            thread maps\_utility::enable_cqbwalk();
            thread _id_AB1E( self._id_BBB3 );
        }
    }

    self pushplayer( 1 );
    self.fixednode = 1;
    thread maps\_utility::set_battlechatter( 0 );
    maps\_utility::set_friendlyfire_warnings( 0 );
    self.dontevershoot = 1;
    self.grenadeammo = 0;
    self.forcesidearm = undefined;
    self.ignoreme = 1;
    self.ignoresuppression = 1;
    setsaveddvar( "ai_friendlyfireblockduration", 0 );
    setsaveddvar( "ai_friendlysuppression", 0 );
}

_id_AC6A()
{
    self notify( "stop_dynamic_run_speed" );
    self.no_pistol_switch = undefined;
    self.ignoreall = 0;
    self.fixednode = 1;
    self.ignoreclosefoliage = 1;

    if ( !common_scripts\utility::flag( "approaching_ridge" ) && !common_scripts\utility::flag( "safe_from_btrs" ) && !common_scripts\utility::flag( "base_alerted" ) )
    {
        maps\_utility::enable_ai_color();
        maps\_utility::set_force_color( "y" );
    }

    thread maps\_utility::set_battlechatter( 0 );
    maps\_utility::set_friendlyfire_warnings( 1 );
    self.dontevershoot = undefined;
    self.maxsightdistsqrd = 64000000;
    self.grenadeammo = 0;
    self.ignoreme = 0;
    self pushplayer( 0 );
    self.ignoresuppression = 0;
    setsaveddvar( "ai_friendlyfireblockduration", 2000 );
    setsaveddvar( "ai_friendlysuppression", 1 );
}

_id_B669()
{
    if ( !isdefined( level._id_C0FD ) )
        level._id_C0FD = "none";

    if ( level._id_C0FD != "huddle" )
    {
        self.patrol_walk_anim = "patrol_cold_huddle";
        self.patrol_walk_twitch = "patrol_twitch_weights";
        self.patrol_scriptedanim["pause"][0] = "patrol_cold_huddle_pause";
        self.patrol_stop["pause"] = "patrol_cold_huddle_stop";
        self.patrol_start["pause"] = "patrol_cold_huddle_start";
        self.patrol_stop["path_end_idle"] = "patrol_cold_huddle_stop";
        self.patrol_end_idle[0] = "patrol_cold_huddle_pause";
        level._id_C0FD = "huddle";
    }
    else
    {
        self.patrol_walk_anim = "patrol_cold_crossed";
        self.patrol_walk_twitch = "patrol_twitch_weights";
        self.patrol_scriptedanim["pause"][0] = "patrol_cold_crossed_pause";
        self.patrol_stop["pause"] = "patrol_cold_crossed_stop";
        self.patrol_start["pause"] = "patrol_cold_crossed_start";
        self.patrol_stop["path_end_idle"] = "patrol_cold_crossed_stop";
        self.patrol_end_idle[0] = "patrol_cold_crossed_pause";
        level._id_C0FD = "crossed";
    }
}

_id_CD03()
{
    self endon( "death" );
    thread maps\_vehicle::vehicle_lights_on( "headlights" );
    thread maps\_vehicle::vehicle_lights_on( "brakelights" );
    thread maps\contingency_aud::_id_BA59();
    common_scripts\utility::flag_wait( "truck_guys_alerted" );
    common_scripts\utility::flag_wait( "convoy_half_way_across_bridge" );
    var_0 = maps\_utility::get_living_ai_array( "truck_guys", "script_noteworthy" );

    if ( var_0.size == 0 )
    {
        self vehicle_setspeed( 0, 15 );
        return;
    }

    var_1 = common_scripts\utility::random( var_0 );
    var_1 maps\_stealth_shared_utilities::enemy_announce_wtf();
    self vehicle_setspeed( 0, 15 );
    wait 1;
    maps\_vehicle::vehicle_unload();
    common_scripts\utility::flag_set( "jeep_stopped" );
}

_id_CB92()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    self endon( "_stealth_attack" );
    maps\_utility::ent_flag_init( "jumped_out" );
    maps\_utility::ent_flag_init( "not_first_attack" );
    thread _id_C982();
    maps\_stealth_shared_utilities::ai_create_behavior_function( "animation", "wrapper", ::_id_B6D9 );
    var_0 = [];
    var_0["attack"] = ::_id_C6A6;
    maps\_stealth_utility::stealth_threat_behavior_custom( var_0 );
    var_1 = [];
    var_1["explode"] = ::_id_BD55;
    var_1["heard_scream"] = ::_id_BD55;
    var_1["doFlashBanged"] = ::_id_BD55;

    foreach ( var_4, var_3 in var_1 )
        maps\_stealth_event_enemy::stealth_event_mod( var_4, var_3 );

    maps\_utility::ent_flag_set( "_stealth_behavior_reaction_anim" );
}

_id_A99E()
{
    self endon( "death" );
    self endon( "_stealth_attack" );
    level endon( "_stealth_spotted" );
    wait 2;
    self waittill( "_stealth_bad_event_listener" );
    maps\_stealth_shared_utilities::enemy_reaction_state_alert();
    maps\_utility::ent_flag_set( "not_first_attack" );
}

_id_CFFE( var_0 )
{
    self endon( "_stealth_enemy_alert_level_change" );
    level endon( "_stealth_spotted" );
    self endon( "_stealth_attack" );
    self endon( "death" );
    self endon( "pain_death" );
    thread _id_A99E();
    self.disablearrivals = 0;
    self.disableexits = 0;
    var_1 = distance( var_0.origin, self.origin );
    self setgoalnode( var_0 );
    self.goalradius = var_1 * 0.5;
    wait 0.05;
    maps\_utility::set_generic_run_anim( "_stealth_patrol_cqb" );
    self waittill( "goal" );
    maps\_utility::set_generic_run_anim( "patrol_cold_gunup_search", 1 );
    self.disablearrivals = 1;
    self.disableexits = 1;
    maps\_stealth_shared_utilities::enemy_runto_and_lookaround( var_0 );
}

_id_C982()
{
    self endon( "death" );
    self endon( "pain_death" );

    for (;;)
    {
        self waittill( "jumpedout" );
        self._stealth.behavior.last_spot = self.origin;
        self._id_C36E = self.origin;
        maps\_utility::ent_flag_set( "jumped_out" );
        self waittill( "enteredvehicle" );
        wait 0.15;
        maps\_utility::ent_flag_clear( "jumped_out" );
        maps\_utility::ent_flag_set( "_stealth_behavior_reaction_anim" );
    }
}

_id_B6D9( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    common_scripts\utility::flag_set( "truck_guys_alerted" );
    maps\_utility::ent_flag_wait( "jumped_out" );
    maps\_stealth_shared_utilities::enemy_animation_wrapper( var_0 );
}

_id_D1F8( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_spotted" );
    self endon( "_stealth_attack" );
    common_scripts\utility::flag_set( "truck_guys_alerted" );
    maps\_utility::ent_flag_wait( "jumped_out" );

    if ( !common_scripts\utility::flag( "truck_guys_alerted" ) )
        return;

    if ( common_scripts\utility::flag_exist( "truck_guys_not_going_back" ) && common_scripts\utility::flag( "truck_guys_not_going_back" ) )
        return;

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) && !maps\_utility::ent_flag( "_stealth_attack" ) )
    {
        var_1 = maps\_utility::get_closest_player( self.origin );
        var_2 = maps\_stealth_shared_utilities::enemy_find_free_pathnode_near( var_1.origin, 1500, 128 );

        if ( isdefined( var_2 ) )
            thread _id_CFFE( var_2 );
    }

    var_3 = maps\_stealth_shared_utilities::group_get_flagname( "_stealth_spotted" );

    if ( common_scripts\utility::flag( var_3 ) )
        common_scripts\utility::flag_waitopen( var_3 );
    else
        self waittill( "normal" );
}

_id_BD55( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_spotted" );
    self endon( "_stealth_attack" );
    common_scripts\utility::flag_set( "truck_guys_alerted" );
    maps\_utility::ent_flag_wait( "jumped_out" );

    if ( !common_scripts\utility::flag( "truck_guys_alerted" ) )
        return;

    if ( common_scripts\utility::flag_exist( "truck_guys_not_going_back" ) && common_scripts\utility::flag( "truck_guys_not_going_back" ) )
        return;

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) && !maps\_utility::ent_flag( "_stealth_attack" ) )
    {
        var_1 = self._stealth.logic.event.awareness_param[var_0];
        var_2 = maps\_stealth_shared_utilities::enemy_find_free_pathnode_near( var_1, 300, 40 );
        thread maps\_stealth_shared_utilities::enemy_announce_wtf();

        if ( isdefined( var_2 ) )
            thread _id_CFFE( var_2 );
    }

    var_3 = maps\_stealth_shared_utilities::group_get_flagname( "_stealth_spotted" );

    if ( common_scripts\utility::flag( var_3 ) )
        common_scripts\utility::flag_waitopen( var_3 );
    else
        self waittill( "normal" );
}

_id_C6A6( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    common_scripts\utility::flag_set( "truck_guys_alerted" );
    maps\_utility::ent_flag_wait( "jumped_out" );
    _id_B3ED();
}

_id_D364( var_0, var_1 )
{
    var_2 = level.objectives[var_0];

    if ( isdefined( var_1 ) )
        objective_setpointertextoverride( var_2.id, var_1 );
    else
        objective_setpointertextoverride( var_2.id );
}

_id_BD26( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::flag_init( var_0 );

    if ( !isdefined( level.objectives ) )
        level.objectives = [];

    var_4 = level.objectives.size;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = spawnstruct();
    var_5.name = var_0;
    var_5.id = var_4;
    var_5.state = "invisible";
    var_5.text = var_1;
    var_5.origin = var_2;
    var_5._id_BB0E = 0;
    var_5._id_BF8A = var_3;
    level.objectives[var_0] = var_5;
    return var_5;
}

_id_C7C7( var_0, var_1, var_2 )
{
    var_3 = level.objectives[var_0];
    var_3.state = var_1;

    if ( !var_3._id_BB0E )
    {
        objective_add( var_3.id, var_3.state, var_3.text, var_3.origin );
        var_3._id_BB0E = 1;
        _func_1E7( var_3.id, var_3._id_BF8A );
    }
    else if ( isdefined( var_2 ) && var_2 )
        objective_state_nomessage( var_3.id, var_3.state );
    else
        objective_state( var_3.id, var_3.state );

    if ( var_3.state == "done" )
        common_scripts\utility::flag_set( var_0 );
}

_id_B2F2( var_0, var_1 )
{
    var_2 = level.objectives[var_0];
    var_2.text = var_1;
    objective_string( var_2.id, var_1 );
}

_id_D393( var_0, var_1 )
{
    var_2 = level.objectives[var_0];
    var_2._id_BA07 = var_1;
    objective_position( var_2.id, var_2._id_BA07 );
}

_id_BDC5( var_0, var_1, var_2 )
{
    level notify( "moving " + var_0 );
    level endon( "moving " + var_0 );
    var_3 = level.objectives[var_0];
    objective_onentity( var_3.id, var_1, var_2 );
}

_id_C1A3( var_0, var_1, var_2 )
{
    var_3 = level.objectives[var_0];

    if ( !var_2 )
        objective_string( var_3.id, var_1 );
    else
        objective_string( var_3.id, var_1, var_2 );
}

_id_D516()
{
    switch ( level.start_point )
    {
        case "start":
        case "default":
            _id_C82A();
        case "slide":
        case "woods":
        case "midwoods":
        case "ridge":
        case "base":
        case "village":
            _id_C210();
            _id_BD7A();
        case "defend_sub":
            _id_A8B4();
    }
}

_id_C82A()
{
    wait 15;
    _id_BD26( "obj_sub_base", &"CONTINGENCY_OBJ_SUB_BASE", ( 0.0, 0.0, 0.0 ) );
    _id_C7C7( "obj_sub_base", "current" );
    common_scripts\utility::flag_wait( "price_starts_moving" );
}

_id_C210()
{
    while ( !isdefined( level.price ) )
        wait 0.1;

    if ( level.start_point != "default" && level.start_point != "start" )
        _id_BD26( "obj_sub_base", &"CONTINGENCY_OBJ_SUB_BASE", ( 0.0, 0.0, 0.0 ) );

    _id_C7C7( "obj_sub_base", "active", 1 );
    _id_BD26( "obj_price", &"CONTINGENCY_OBJ_PRICE", level.price.origin, 1 );
    _id_C7C7( "obj_price", "current" );
    thread _id_BDC5( "obj_price", level.price, ( 0.0, 0.0, 70.0 ) );
    common_scripts\utility::flag_wait( "base_entrance" );
    _id_C7C7( "obj_price", "done" );
    _id_C7C7( "obj_sub_base", "done", 1 );
}

_id_BD7A()
{
    common_scripts\utility::flag_wait( "base_alerted" );
    wait 5;
    var_0 = ( -11742.0, 2368.0, 643.0 );
    var_1 = common_scripts\utility::getstruct( "obj_reach_split_off", "targetname" );

    if ( isdefined( var_1 ) )
        var_0 = var_1.origin;

    _id_BD26( "obj_reach", &"CONTINGENCY_OBJ_SUB_DOCK", var_0 );
    _id_C7C7( "obj_reach", "current" );
    common_scripts\utility::flag_wait( "price_splits_off" );
    _id_C7C7( "obj_reach", "done" );
}

_id_A8B4()
{
    common_scripts\utility::flag_wait( "price_splits_off" );
    var_0 = common_scripts\utility::getstruct( "obj_guard_house", "targetname" ).origin;
    _id_BD26( "obj_sub", &"CONTINGENCY_OBJ_DEFEND_SUB", var_0 + ( 0.0, 0.0, 48.0 ) );
    _id_C7C7( "obj_sub", "current" );
    _id_D364( "obj_sub", &"CONTINGENCY_OBJ_DEFEND" );
    common_scripts\utility::flag_wait( "close_sub_hatch" );
    _id_C7C7( "obj_sub", "done" );
}

_id_CC26()
{
    var_0 = 1;
    common_scripts\utility::flag_wait( "base_entrance" );

    if ( isdefined( level._id_BA3E ) )
    {
        var_1 = ( gettime() - level._id_BA4E ) / 1000;
        var_2 = level._id_BA3E - var_1;

        if ( var_2 < 90 )
            var_0 = 0;
        else
            var_0 = 1;
    }

    if ( var_0 )
        maps\_utility::autosave_by_name( "partway1" );

    common_scripts\utility::flag_wait( "player_is_halfway_to_sub" );

    if ( isdefined( level._id_BA3E ) )
    {
        var_1 = ( gettime() - level._id_BA4E ) / 1000;
        var_2 = level._id_BA3E - var_1;

        if ( var_2 < 80 )
            var_0 = 0;
        else
            var_0 = 1;
    }

    if ( var_0 )
        maps\_utility::autosave_by_name( "partway2" );

    common_scripts\utility::flag_wait( "base_ending" );

    if ( isdefined( level._id_BA3E ) )
    {
        var_1 = ( gettime() - level._id_BA4E ) / 1000;
        var_2 = level._id_BA3E - var_1;

        if ( var_2 < 40 )
            var_0 = 0;
        else
            var_0 = 1;
    }

    if ( var_0 )
        maps\_utility::autosave_by_name( "partway3" );
}

_id_CAD2()
{
    if ( getdvar( "notimer" ) == "1" )
        return;

    var_0 = undefined;
    level._id_BA3E = undefined;

    switch ( level.gameskill )
    {
        case 0:
            return;
        case 1:
            return;
        case 2:
            level._id_BA3E = 180;
            break;
        case 3:
            level._id_BA3E = 120;
            break;
    }

    if ( isdefined( level._id_C7A5 ) )
        level._id_BA3E -= level._id_C7A5;

    thread _id_A906( level._id_BA3E );
    level thread _id_BFFA( level._id_BA3E, &"CONTINGENCY_TIME_TO_ENTER_SUB" );
    level._id_BA4E = gettime();
}

_id_BFFA( var_0, var_1, var_2 )
{
    if ( getdvar( "notimer" ) == "1" )
        return;

    thread _id_C94A();
    level thread _id_A831( &"CONTINGENCY_SUB_TIMER_EXPIRED" );
    var_3 = 0;
    var_4 = common_scripts\utility::_id_D5D2();

    switch ( var_4 )
    {
        case "LANGUAGE_PORTUGUESE":
        case "LANGUAGE_ITALIAN":
        case "LANGUAGE_FRENCH":
        case "LANGUAGE_RUSSIAN":
        case "LANGUAGE_RUSSIAN_PARTIAL":
            var_3 = 1;
            break;
    }

    maps\_hud_util::_id_B8DF( var_0, var_1, var_2, var_3 );
}

_id_C94A()
{
    level endon( "timer_expired" );
    level endon( "reached_sub" );
    level.player endon( "death" );

    if ( level.gameskill == 3 )
    {
        while ( level.gameskill == 3 )
            waitframe();

        level._id_C7A5 = gettime() - level.start_time;
        level._id_C7A5 = int( level._id_C7A5 * 0.001 );
        killtimer();
        thread _id_CAD2();
        return;
    }

    while ( level.gameskill > 1 )
        waitframe();

    killtimer();
}

killtimer()
{
    maps\_hud_util::_id_CB55();
}

_id_A831( var_0 )
{
    level.player endon( "death" );
    level endon( "kill_timer" );
    level waittill( "timer_expired" );
    level notify( "mission failed" );
    level.player freezecontrols( 1 );
    musicstop( 1 );
    setdvar( "ui_deadquote", var_0 );
    maps\_utility::missionfailedwrapper();
    level notify( "kill_timer" );
}

_id_C368( var_0 )
{
    self setthreatbiasgroup( var_0 );
}

_id_CAAC()
{
    self endon( "death" );
    maps\_utility::ent_flag_waitopen( "_stealth_normal" );
    wait(randomfloatrange( 0.2, 0.8 ));
    playfxontag( level._effect["flashlight"], self, "tag_flash" );
    self.have_flashlight = 1;
}

_id_B986()
{
    playfxontag( level._effect["flashlight"], self, "tag_flash" );
    self.have_flashlight = 1;
}

detach_flashlight()
{
    killfxontag( level._effect["flashlight"], self, "tag_flash" );
    self.have_flashlight = undefined;
}

attach_flashlight_wolfmode()
{
    if ( isdefined( self.have_flashlight ) && self.have_flashlight )
    {
        waitframe();
        self.preplaceweapononfunc = ::weaponswapcheckdetachflashlight;
        self.postplaceweapononfunc = ::weaponswapcheckattachflashlight;
        playfxontag( level._effect["flashlight"], self, "tag_flash" );
    }
}

detach_flashlight_wolfmode()
{
    if ( isdefined( self.have_flashlight ) && self.have_flashlight )
    {
        self.preplaceweapononfunc = undefined;
        self.postplaceweapononfunc = undefined;
        killfxontag( level._effect["flashlight"], self, "tag_flash" );
        waitframe();
    }
}

_id_C649( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self endon( "stop_shooting" );
    self endon( "death" );

    for (;;)
    {
        var_2 = maps\_utility::get_closest_player( self.origin );
        wait(randomfloatrange( 0.8, 1.3 ));

        while ( !can_see_player( var_2 ) )
            wait(randomfloatrange( 0.2, 0.6 ));

        if ( !var_1 )
        {
            miss_player( var_2 );
            wait(randomfloatrange( 0.8, 2.4 ));
            miss_player( var_2 );
            wait(randomfloatrange( 0.8, 2.4 ));
        }

        while ( can_see_player( var_2 ) )
        {
            _id_C450( var_2 );
            wait(randomfloatrange( 2, 3 ));
        }

        if ( var_0 )
        {
            if ( !can_see_player( var_2 ) )
            {
                self clearturrettargetent();
                self._id_BF01 = 0;
                self notify( "stop_shooting" );
            }
        }
    }
}

can_see_player( var_0 )
{
    if ( distance( self.origin, level.player.origin ) < level._id_B34F )
        return 0;

    var_1 = self gettagorigin( "tag_flash" );
    var_2 = var_0 geteye();

    if ( sighttracepassed( var_1, var_2, 0, self ) )
    {
        if ( isdefined( level.debug ) )
        {

        }

        return 1;
    }
    else
        return 0;
}

_id_C450( var_0 )
{
    var_1 = randomintrange( 3, 5 );
    var_2 = 0.2;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        self setturrettargetent( var_0, common_scripts\utility::randomvector( 20 ) + ( 0.0, 0.0, 32.0 ) );
        self fireweapon();
        wait(var_2);
    }
}

miss_player( var_0 )
{
    var_1 = anglestoforward( level.player.angles );
    var_2 = var_1 * 100;
    var_3 = var_2 + common_scripts\utility::randomvector( 50 );
    var_4 = randomintrange( 4, 6 );
    var_5 = 0.2;

    for ( var_6 = 0; var_6 < var_4; var_6++ )
    {
        var_7 = common_scripts\utility::randomvector( 15 ) + var_3 + ( 0.0, 0.0, 64.0 );
        self setturrettargetent( var_0, var_7 );
        self fireweapon();
        wait(var_5);
    }
}

open_door()
{
    var_0 = getent( "back_door_left", "targetname" );
    var_1 = getent( "door_clip_left", "targetname" );
    var_1 linkto( var_0 );
    var_2 = getent( "back_door_right", "targetname" );
    var_3 = getent( "door_clip_right", "targetname" );
    var_3 linkto( var_2 );
    var_0 rotateyaw( -125, 0.75, 0.25 );
    var_2 rotateyaw( 125, 0.75, 0.25 );
    var_1 connectpaths();
    var_3 connectpaths();
}

_id_B129()
{
    common_scripts\utility::flag_wait( "open_hangar" );
    var_0 = getent( "door_l_1", "targetname" );
    var_1 = getent( "door_l_2", "targetname" );
    var_2 = getent( "door_r_1", "targetname" );
    var_3 = getent( "door_r_2", "targetname" );
    var_4 = getent( "col_l_1", "targetname" );
    var_5 = getent( "col_l_2", "targetname" );
    var_6 = getent( "col_r_1", "targetname" );
    var_7 = getent( "col_r_2", "targetname" );
    var_4 linkto( var_0 );
    var_5 linkto( var_1 );
    var_6 linkto( var_2 );
    var_7 linkto( var_3 );
    var_8 = 75;
    var_9 = -75;
    var_10 = -75;
    var_11 = 75;
    var_0 movey( var_8, 2, 0.5, 0.5 );
    var_2 movey( var_9, 2, 0.5, 0.5 );
    wait 2.5;
    var_0 linkto( var_1 );
    var_2 linkto( var_3 );
    var_1 movey( var_8, 2, 0.5, 0.5 );
    var_3 movey( var_9, 2, 0.5, 0.5 );
    common_scripts\utility::flag_wait( "player_close" );
    var_12 = var_1.origin + ( 0, var_10 * 2, 75 );
    thread common_scripts\utility::play_sound_in_space( "scn_con_base_doors_close", var_12 );
    var_1 movey( var_10, 2, 0.5, 0.5 );
    var_3 movey( var_11, 2, 0.5, 0.5 );
    wait 2.5;
    var_0 unlink( var_1 );
    var_2 unlink( var_3 );
    var_0 movey( var_10, 2, 0.5, 0.5 );
    var_2 movey( var_11, 2, 0.5, 0.5 );
}

_id_B0CD()
{
    common_scripts\utility::flag_wait( "turn_sat" );
    var_0 = getent( "sat_dish", "targetname" );

    for (;;)
    {
        var_0 rotateyaw( 360, 25, 0.05, 0.05 );
        wait 25;
    }
}

_id_BD66()
{
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "gun_up" );
    setsaveddvar( "cg_gunDownAnimDelayTime", -1 );
}

_id_BCC0()
{
    common_scripts\utility::flag_wait( "turn_sat" );
    var_0 = getent( "propeller", "targetname" );

    for (;;)
    {
        var_0 rotateby( ( 360.0, 0.0, 0.0 ), 1 );
        wait 1;
    }
}

_id_C5B5()
{
    common_scripts\utility::flag_wait( "turn_sat" );
    var_0 = getent( "gyro", "targetname" );

    for (;;)
    {
        var_0 rotateyaw( 360, 1 );
        wait 1;
    }
}

_id_B067()
{
    common_scripts\utility::flag_wait( "turn_sat" );
    var_0 = getent( "intel_fan", "targetname" );

    for (;;)
    {
        var_0 rotateby( ( 360.0, 0.0, 0.0 ), 0.75 );
        wait 0.75;
    }
}

_id_C84D()
{
    common_scripts\utility::flag_wait( "player_on_ridge" );
    thread _id_CAAD();
    thread _id_B025();
    thread _id_A95D();
}

_id_CAAD()
{
    var_0 = getent( "cabin1", "targetname" );
    var_1 = getent( "motor1", "targetname" );
    var_2 = getent( "animated_cable", "targetname" );
    var_2 linkto( var_0 );
    var_1 linkto( var_0 );
    wait 4;
    var_0 rotateyaw( -100, 10 );
    common_scripts\utility::flag_wait( "base_entrance" );
    var_2 unlink( var_0 );
    var_2.animname = "animated_cable";
    var_2 maps\_anim::setanimtree();
    var_2 maps\_anim::anim_loop_solo( var_2, "crane_idle" );
}

_id_B025()
{
    var_0 = getent( "cabin2", "targetname" );
    var_1 = getent( "motor2", "targetname" );
    var_2 = getent( "hook2", "targetname" );
    var_3 = getent( "animated_cable_2", "targetname" );
    var_3 linkto( var_0 );
    var_1 linkto( var_0 );
    var_2 movez( 360, 7 );
    wait 13;
    var_2 linkto( var_0 );
    var_0 rotateyaw( -180, 27 );
    wait 35;
    var_0 rotateyaw( 180, 16 );
}

_id_A95D()
{
    var_0 = getent( "cabin3", "targetname" );
    var_1 = getent( "motor3", "targetname" );
    var_2 = getent( "hook3", "targetname" );
    var_3 = getent( "animated_cable_3", "targetname" );
    var_3 linkto( var_0 );
    var_1 linkto( var_0 );
    var_2 linkto( var_0 );
    var_0 rotateyaw( -140, 19 );
    wait 19;
    var_2 unlink( var_0 );
    var_2 movez( -360, 7 );
    wait 14;
    var_2 movez( 360, 7 );
    var_2 linkto( var_0 );
    wait 10;
    var_0 rotateyaw( 140, 10 );
}

_id_C847()
{
    common_scripts\utility::flag_wait( "turn_sat" );
    var_0 = getentarray( "roof_fan", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = randomfloatrange( 0.5, 1.0 );
        var_2 thread _id_BE11( var_3 );
    }
}

_id_BE11( var_0 )
{
    for (;;)
    {
        self rotateyaw( 360, var_0 );
        wait(var_0);
    }
}

activate_ice_chunk()
{
    common_scripts\utility::flag_wait( "player_close" );
    self.animname = "ice_chunk";
    maps\_anim::setanimtree();
    var_0 = "h2_gulag_ice_chunk_01_idle";

    if ( isdefined( self.animation ) )
        var_0 = self.animation;

    var_1 = 0;

    if ( isdefined( self.script_noteworthy ) )
        var_1 = float( self.script_noteworthy );

    wait(var_1);
    maps\_anim::anim_loop_solo( self, var_0 );
}

animated_buoy()
{
    common_scripts\utility::flag_wait( "player_close" );
    self.animname = "animated_buoy";
    maps\_anim::setanimtree();
    var_0 = "h2_contingency_buoy_idle";

    if ( isdefined( self.animation ) )
        var_0 = self.animation;

    var_1 = 0;

    if ( isdefined( self.script_noteworthy ) )
        var_1 = float( self.script_noteworthy );

    wait(var_1);
    maps\_anim::anim_loop_solo( self, var_0 );
}

bush_trigger_manager()
{
    var_0 = getent( self.target, "targetname" );
    var_0 maps\_utility::assign_animtree( "bushes" );
    var_1 = var_0 maps\_utility::getanim( "bushes_idle" );
    var_0 setanim( var_1 );
    var_2 = randomfloat( 1 );
    var_0 setanimtime( var_1, var_2 );
    var_0 thread restoreidleanimation( var_1 );
    var_0 setanimlimited( var_0 maps\_utility::getanim( "bushes_shuffle_add_loop_anim" ), 1.0, 0.0, 1.0 );
    var_3 = 75;
    var_4 = var_0 maps\_utility::getanim( "bushes_shuffle_add_loop" );

    for (;;)
    {
        var_5 = undefined;
        self waittill( "trigger", var_5 );

        if ( isplayer( var_5 ) || isai( var_5 ) )
        {
            playfx( common_scripts\utility::getfx( "bushes_snow_reaction" ), self.origin );
            var_6 = 0.0;

            while ( var_5 istouching( self ) )
            {
                if ( isplayer( var_5 ) )
                    var_7 = length( var_5 getvelocity() );
                else
                    var_7 = length( var_5.velocity );

                var_6 = max( var_6 - 0.025, clamp( var_7, 0, var_3 ) / var_3 );
                var_0 setanim( var_4, var_6, 0.1 );
                waitframe();
            }
        }

        var_0 setanim( var_4, 0.0, 3.0 );
    }
}

restoreidleanimation( var_0 )
{
    for (;;)
    {
        self waittillmatch( "single anim", "end" );
        self setanim( var_0 );
    }
}

portal_group_start_point_initializer()
{
    var_0 = [ "portal_starting_area_flag", "portal_bridge_A_flag" ];
    var_1 = [ "portal_starting_area_flag", "portal_bridge_A_flag" ];
    var_2 = [ "portal_vista_flag", "portal_forest_A_flag" ];
    var_3 = [ "portal_vista_flag", "portal_forest_A_flag" ];
    var_4 = [ "portal_vista_flag", "portal_forest_A_flag", "portal_forest_B_flag" ];
    var_5 = [ "portal_vista_flag", "portal_forest_A_flag", "portal_forest_B_flag" ];
    var_6 = [];
    var_7 = [];

    switch ( level.start_point )
    {
        case "start":
            var_8 = var_1;
            break;
        case "slide":
            var_8 = var_2;
            break;
        case "woods":
            var_8 = var_3;
            break;
        case "midwoods":
            var_8 = var_4;
            break;
        case "ridge":
            var_8 = var_5;
            break;
        case "base":
            var_8 = var_6;
            break;
        case "defend_sub":
            var_8 = var_7;
            break;
        default:
            var_8 = var_0;
            break;
    }

    return var_8;
}

initialize_portal_flags()
{
    common_scripts\utility::flag_init( "portal_starting_area_flag" );
    common_scripts\utility::flag_init( "portal_curve_A_flag" );
    common_scripts\utility::flag_init( "portal_curve_B_flag" );
    common_scripts\utility::flag_init( "portal_bridge_A_flag" );
    common_scripts\utility::flag_init( "portal_bridge_B_flag" );
    common_scripts\utility::flag_init( "portal_vista_flag" );
    common_scripts\utility::flag_init( "portal_forest_A_flag" );
    common_scripts\utility::flag_init( "portal_forest_B_flag" );
    common_scripts\utility::flag_set( "portal_group_base_building_33_flag" );
    var_0 = portal_group_start_point_initializer();

    foreach ( var_2 in var_0 )
        common_scripts\utility::flag_set( var_2 );
}

change_zfar_by_flags( var_0, var_1, var_2, var_3 )
{
    level endon( var_3 );

    for (;;)
    {
        common_scripts\utility::flag_wait( var_0 );
        setculldist( var_1 );
        common_scripts\utility::flag_waitopen( var_0 );
        setculldist( var_2 );
    }
}

reset_zfar_by_fov_to_default()
{
    common_scripts\utility::flag_wait( "zfar_restore_default_flag" );
    level endon( "player_slid_down" );
    setsaveddvar( "r_lodFOVFixedScale", 1 );
    setculldist( 0 );
}

change_zfar_by_fov()
{
    common_scripts\utility::flag_wait( "dynamic_zfar_flag" );
    level endon( "zfar_restore_default_flag" );
    setsaveddvar( "r_lodFOVFixedScale", 1.3 );
    var_0 = 11000;
    var_1 = 7000;
    var_2 = 3000;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = common_scripts\utility::getstruct( "dynamic_zfar_origin", "targetname" );

    for (;;)
    {
        while ( common_scripts\utility::flag( "dynamic_zfar_flag" ) )
        {
            if ( common_scripts\utility::flag( "mid_forest_zfar_flag" ) )
                var_2 = 4500;
            else
                var_2 = 3000;

            var_3 = anglestoforward( level.player getplayerangles() );
            var_4 = var_5.origin - level.player.origin;
            var_3 = vectornormalize( maps\_utility::set_z( var_3, 0 ) );
            var_4 = vectornormalize( maps\_utility::set_z( var_4, 0 ) );
            var_6 = vectordot( var_3, var_4 );
            var_6 = float( ( var_6 + 1.0 ) * 0.5 );

            if ( var_6 >= 0.5 )
                var_7 = var_1;
            else
                var_7 = maps\_utility::linear_interpolate( var_6, var_2, var_0 );

            setculldist( var_7 );
            waitframe();
        }

        setculldist( var_1 );
        common_scripts\utility::flag_wait( "dynamic_zfar_flag" );
    }
}

initialize_zfar_flags()
{
    common_scripts\utility::flag_init( "mid_forest_zfar_flag" );
    common_scripts\utility::flag_init( "end_forest_zfar_flag" );
    common_scripts\utility::flag_init( "dynamic_zfar_flag" );
    common_scripts\utility::flag_init( "zfar_restore_default_flag" );
}

init_scope_fov_setup()
{
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 15 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 0 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.75 );
}

change_remote_missile_zfar()
{
    level endon( "death" );

    for (;;)
    {
        level.player waittill( "player_is_controlling_UAV" );
        setsaveddvar( "r_lodFOVFixedScale", 0.2 );
        common_scripts\utility::flag_clear( "portal_group_base_building_33_flag" );

        if ( common_scripts\utility::flag( "leaving_village" ) )
        {
            _func_31C( 1 );
            _func_31C( 5 );
            _func_31C( 6 );
        }

        _func_31C( 2 );
        _func_31C( 3 );
        var_0 = getentarray( "hanging_object", "targetname" );

        foreach ( var_2 in var_0 )
        {
            if ( isdefined( var_2.script_wtf ) && var_2.script_wtf == "icicle_hide" )
                var_2 hide();
        }

        level.player waittill( "exiting_uav_control" );
        setsaveddvar( "r_lodFOVFixedScale", 1 );
        common_scripts\utility::flag_set( "portal_group_base_building_33_flag" );
        _func_31B( 2 );
        _func_31B( 3 );
        var_0 = getentarray( "hanging_object", "targetname" );

        foreach ( var_2 in var_0 )
        {
            if ( isdefined( var_2.script_wtf ) && var_2.script_wtf == "icicle_hide" )
                var_2 show();
        }
    }
}
#using_animtree("vehicles");

_id_ADD5( var_0 )
{
    var_0[0].vehicle_getoutanim = %h2_uaz_driver_exit_into_stand_door_winter;
    var_0[1].vehicle_getoutanim = %h2_uaz_passenger_exit_into_stand_door_winter;
    var_0[2].vehicle_getoutanim = %h2_uaz_rear_driver_exit_into_stand_door_winter;
    var_0[3].vehicle_getoutanim = %h2_uaz_passenger2_exit_into_stand_door_winter;
    return var_0;
}

static_model_group_think( var_0, var_1 )
{
    _func_31C( var_1 );
    common_scripts\utility::flag_wait( var_0 );
    _func_31B( var_1 );
}

hanging_parachute()
{
    var_0 = getent( "hanging_parachute", "targetname" );
    var_0.animname = "parachute";
    var_0 maps\_anim::setanimtree();
    var_1 = var_0 maps\_utility::getanim( "hanging_idle" );
    var_0 setanim( var_1 );
}

swap_to_base_uav()
{
    common_scripts\utility::flag_wait( "leaving_village" );
    level.player waittill( "starting_predator_drone_control" );
    level._id_C176 delete();
    level._id_C176 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "third_uav" );
    level._id_C176 playloopsound( "uav_engine_loop" );

    if ( !isdefined( level.uavrig ) )
    {
        level.uavrig = spawn( "script_model", level._id_C176.origin );
        level.uavrig setmodel( "tag_origin" );
    }

    thread _id_C09D();

    if ( !isdefined( level.uav_target ) )
        level.uav_target = spawn( "script_origin", level._id_C176.origin );

    level.uav_target.origin = level._id_C176.origin;
    level.uav_target linkto( level._id_C176 );
}

animated_bushes_setup()
{
    level endon( "player_slid_down" );
    var_0 = getentarray( "animated_bushes_start", "script_noteworthy" );
    var_1 = getentarray( "animated_bushes_forest", "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3 hide();

    for (;;)
    {
        common_scripts\utility::flag_wait( "animated_bushes_flag" );

        foreach ( var_3 in var_0 )
            var_3 hide();

        foreach ( var_3 in var_1 )
            var_3 show();

        common_scripts\utility::flag_waitopen( "animated_bushes_flag" );

        foreach ( var_3 in var_0 )
            var_3 show();

        foreach ( var_3 in var_1 )
            var_3 hide();
    }
}

animated_trees_setup()
{
    level endon( "player_slid_down" );
    var_0 = [];
    var_1 = getentarray( "script_model", "classname" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.script_parameters ) && var_3.script_parameters == "animated_trees" )
            var_0 = common_scripts\utility::array_add( var_0, var_3 );
    }

    foreach ( var_6 in var_0 )
        var_6 hide();

    for (;;)
    {
        common_scripts\utility::flag_wait( "animated_trees_flag" );

        foreach ( var_6 in var_0 )
            var_6 show();

        common_scripts\utility::flag_waitopen( "animated_trees_flag" );

        foreach ( var_6 in var_0 )
            var_6 hide();
    }
}

safe_from_btr_failproof()
{
    var_0 = getent( "btr_hurt", "targetname" );
    var_1 = var_0.origin;
    var_0.origin += ( 0.0, 0.0, -1000.0 );
    common_scripts\utility::flag_wait( "btr_hurt_flag" );
    var_0.origin = var_1;
}
