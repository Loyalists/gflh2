// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" || getdvar( "beautiful_corner_hdr_demo" ) == "1" || getdvar( "beautiful_corner_security_cameras" ) == "1" )
    {
        maps\gulag_beautiful_corner::main();
        return;
    }

    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\gulag_mission_select_cam::_id_C490();
        return;
    }

    setsaveddvar( "com_cinematicEndInWhite", 1 );
    setomnvar( "ui_consciousness_init", 1 );
    level.default_goalheight = 128;
    common_scripts\utility::create_dvar( "f15", 1 );
    setsaveddvar( "g_friendlyNameDist", 0 );
    _id_BEE0::main();
    precachestring( &"GULAG_SPIE_HINT" );
    precachestring( &"GULAG_SPIE_HINT_PC" );
    precachestring( &"GULAG_RAPPEL_HINT" );
    precachestring( &"GULAG_RAPPEL_HINT_PC" );
    precachestring( &"SCRIPT_LEARN_GRENADE_LAUNCHER" );
    precachestring( &"SCRIPT_NIGHTVISION_USE" );
    precachestring( &"SCRIPT_NIGHTVISION_STOP_USE" );
    precachestring( &"GULAG_HINT_MELEE" );
    precachestring( &"GULAG_INTROSCREEN_LINE_4" );
    precachestring( &"GULAG_INTROSCREEN_LINE_3" );
    precachestring( &"GULAG_INTROSCREEN_LINE_2" );
    precachestring( &"GULAG_INTROSCREEN_LINE_1" );
    precachestring( &"AUTOSAVE_AUTOSAVE" );
    precachestring( &"GULAG_INTROSCREEN_1" );
    precachestring( &"GULAG_INTROSCREEN_2" );
    precachestring( &"GULAG_INTROSCREEN_3" );
    precachestring( &"GULAG_INTROSCREEN_4" );
    precachestring( &"GULAG_INTROSCREEN_5" );
    precachestring( &"GULAG_FIND_POW" );
    precachestring( &"GULAG_FOLLOW_SOAP" );
    precachestring( &"GULAG_CONTROL_ROOM" );
    precachestring( &"GULAG_CELL_DUTY" );
    precachestring( &"GULAG_BREACH_THE_BATHROOM" );
    precachestring( &"GULAG_ESCAPE" );
    precachestring( &"GULAG_INTROSCREEN_LINE_1" );
    precachestring( &"GULAG_INFILTRATE_THE_GULAG" );
    precachestring( &"SCRIPT_MANTLE" );
    _func_260( "gulag_global" );
    _func_260( "gulag_global_nvg_laser" );
    _func_260( "gulag_showers" );
    _func_260( "gulag_showers_nvg_laser" );
    precacherumble( "tank_rumble" );
    maps\_utility::add_start( "intro", ::_id_C0E1, "Intro", ::_id_C4A4 );
    maps\_utility::add_start( "approach", ::_id_D548, "Approach", ::_id_B785 );
    maps\_utility::add_start( "f15", ::_id_C025, "f15", ::_id_AA5F );
    maps\_utility::add_start( "unload", ::_id_C025, "Unload", ::_id_AA5F );
    maps\_utility::add_start( "control_room", ::start_control_room, "Control Room", ::_id_B793 );
    maps\_utility::add_start( "armory", ::_id_CF32, "Armory", ::_id_BFC1 );
    maps\_utility::add_start( "rappel", ::_id_B80C, "Rappel", ::_id_D113 );
    maps\_utility::add_start( "tunnel", ::start_tunnel, "tunnel", ::_id_D57A );
    maps\_utility::add_start( "bathroom", ::_id_BB68, "Bathroom", ::_id_C5E4 );
    maps\_utility::add_start( "rescue", ::_id_CA0F, "Rescue", ::_id_BD04 );
    var_0 = getentarray( "falling_rib_chunk", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::self_delete );
    var_1 = getentarray( "top_hall_exploder", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::self_delete );
    var_2 = getentarray( "top_hall_chunk", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::self_delete );
    var_2 = getentarray( "top_hall_chunk", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::self_delete );
    level._id_D43F = 4000;
    level._id_CDB5 = 0.05;
    level._id_A874 = 0.4;
    level._id_C767 = 1;
    level._id_AF87 = maps\_animatedmodels::_id_B29E;
    level.disable_interactive_tv_use_triggers = 1;
    level.custom_no_game_setupfunc = ::_id_C52F;
    maps\_drone_ai::init();
    _id_B708::main();
    vehicle_scripts\_littlebird::main( "vehicle_little_bird_bench", undefined, "script_vehicle_littlebird_bench_allylanding_1" );
    vehicle_scripts\_littlebird::main( "vehicle_little_bird_bench", undefined, "script_vehicle_littlebird_bench_allylanding_2" );
    var_3 = getentarray( "gulag_destructible_volume", "targetname" );
    maps\_utility::mask_destructibles_in_volumes( var_3 );
    maps\_utility::mask_interactives_in_volumes( var_3 );
    _id_C71F::main();
    maps\gulag_lighting::main();
    _id_C1F5::main();
    _id_C789::main();
    thread maps\gulag_ending::_id_AD05();
    thread _id_AD60();
    maps\gulag_anim::main();
    maps\_load::main();
    maps\_compass::setupminimap( "compass_map_gulag" );
    thread maps\gulag_code::_id_A8C5();
    setdvar( "use_improved_breaches", 1 );
    level._id_CA75 = "mil_frame_charge";
    // set up custom vm for breaching
    level.slowmo_viewhands = "h2_gfl_st_ar15_viewhands_player";
    level._id_B8AB = "h2_gfl_st_ar15_viewbody";
    maps\_slowmo_breach::slowmo_breach_init();
    level._effect["breach_door"] = loadfx( "fx/explosions/breach_wall_concrete" );
    maps\_nightvision::main( level.players );
    level.player setactionslot( 1, "" );
    maps\_utility::add_global_spawn_function( "allies", maps\gulag_code::no_grenades );
    common_scripts\utility::run_thread_on_targetname( "helper_model", maps\_utility::self_delete );
    maps\_utility::add_hint_string( "grenade_launcher", &"SCRIPT_LEARN_GRENADE_LAUNCHER", maps\gulag_code::_id_C7EA );
    maps\_utility::add_hint_string( "nvg", &"SCRIPT_NIGHTVISION_USE", maps\_nightvision::shouldbreaknvghintprint, undefined, "medium_background" );
    maps\_utility::add_hint_string( "disable_nvg", &"SCRIPT_NIGHTVISION_STOP_USE", maps\_nightvision::should_break_disable_nvg_print, undefined, "medium_background" );
    maps\_utility::add_hint_string( "riot_bash", &"GULAG_HINT_MELEE", maps\gulag_code::_id_D312, undefined, "small_background" );
    level._id_D498 = 1000;
    level._pipe_fx_time = 2.5;
    _id_C21D();
    thread maps\gulag_code::_id_B60E( "cell_door2" );
    thread maps\gulag_code::_id_B60E( "cell_door3" );
    thread maps\gulag_code::_id_B60E( "cell_door4" );
    thread maps\gulag_code::_id_B60E( "cell_door_weapons" );
    precacheitem( "smoke_grenade_american" );
    precacheitem( "m4m203_reflex_arctic" );
    precacheitem( "f15_sam" );
    precacheitem( "sam" );
    precacheitem( "slamraam_missile" );
    precacheitem( "slamraam_missile_guided" );
    precacheitem( "cobra_seeker" );
    precacheitem( "rpg_straight" );
    precacheitem( "cobra_Sidewinder" );
    precacheitem( "m14_scoped_arctic" );
    precacheitem( "claymore" );
    precacheitem( "mp5_silencer_reflex" );
    precacheturret( "player_view_controller" );
    precacheitem( "fraggrenade" );
    precacheitem( "flash_grenade" );
    precacheitem( "claymore" );
    precachemodel( "viewhands_udt" );
    precachemodel( "h1_cs_light_alarm_on" );
    precachemodel( "h1_cs_light_alarm_blue_on" );
    precachemodel( "h1_cs_light_alarm_blue" );
    precachemodel( "gulag_price_ak47" );
    precachemodel( "vehicle_slamraam_launcher_no_spike" );
    precachemodel( "vehicle_slamraam_missiles" );
    precachemodel( "projectile_slamraam_missile" );
    precachemodel( "tag_turret" );
    precachemodel( "me_lightfluohang_double_destroyed" );
    precachemodel( "me_lightfluohang_single_destroyed" );
    precachemodel( "ma_flatscreen_tv_wallmount_broken_01" );
    precachemodel( "ma_flatscreen_tv_wallmount_broken_02" );
    precachemodel( "com_tv2_d" );
    precachemodel( "com_tv1" );
    precachemodel( "com_tv2" );
    precachemodel( "com_locker_double_destroyed" );
    precachemodel( "dt_mirror_dam" );
    precachemodel( "dt_mirror_des" );
    precachemodel( "tag_laser" );
    precachemodel( "viewbody_udt" );
    precachemodel( "h2_gulag_cellblock2_intact_wall_01" );
    precachemodel( "trq_tree_pine_snow_045_02_static" );
    precachemodel( "trq_tree_pine_snow_060_02_static" );
    precachemodel( "trq_tree_pine_snow_070_02_static" );
    precachemodel( "trq_tree_pine_snow_080_02_static" );
    precachemodel( "trq_tree_pine_snow_090_02_static" );
    precachemodel( "trq_tree_pine_snow_105_02_static" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup_3x_cold" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup_3x_cold_off" );
    precachemodel( "h2_com_laptop_rugged_open_gulag" );
    precachemodel( "h2_gulag_rappel_rope_player_60ft" );
    precachemodel( "h2_gulag_rappel_rope_player_60ft_standard" );
    precachemodel( "body_seal_udt_smg_gulag_intro" );
    precachemodel( "body_seal_udt_assault_a_gulag_intro" );
    precachemodel( "head_seal_udt_d_lifesaver_gulag_intro" );
    precachemodel( "head_seal_udt_a_gulag_intro" );
    precachemodel( "head_seal_udt_c_gulag_intro" );
    precachemodel( "head_seal_udt_d_gulag_intro" );
    precachemodel( "head_seal_udt_e_gulag_intro" );
    precachemodel( "h2_head_seal_udt_b_c_gulag_intro" );
    precachemodel( "h2_vehicle_sa15_gauntlet_destroy_snow" );
    precachemodel( "com_tv1_pho_zombie" );
    precachemodel( "hat_opforce_merc_b" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "h1_hud_tutorial_blur" );
    loadfx( "fx/explosions/tv_flatscreen_explosion" );
    loadfx( "fx/misc/light_fluorescent_single_blowout_runner" );
    loadfx( "fx/misc/light_fluorescent_blowout_runner" );
    loadfx( "fx/props/locker_double_des_01_left" );
    loadfx( "fx/props/locker_double_des_02_right" );
    loadfx( "fx/props/locker_double_des_03_both" );
    loadfx( "fx/misc/no_effect" );
    loadfx( "fx/misc/light_blowout_swinging_runner" );
    loadfx( "fx/props/mirror_dt_panel_broken" );
    loadfx( "fx/props/mirror_shatter" );
    loadfx( "fx/misc/tower_light_blue_steady" );
    precacheshellshock( "gulag_attack" );
    precacheshellshock( "nosound" );
    precachemodel( "rat" );

    precachemodel( "h2_gfl_st_ar15_viewbody" );
    precachemodel( "h2_gfl_st_ar15_viewhands" );
    precachemodel( "h2_gfl_st_ar15_viewhands_player" );

    thread maps\gulag_code::_id_C122();
    maps\gulag_code::_id_D2BC();
    thread maps\gulag_code::ambient_snowing();
    level._id_C536 = -0.5;
    level.breakables_fx["tv_explode"] = loadfx( "fx/explosions/tv_explosion" );
    thread _id_D1F7();
    thread maps\gulag_code::_id_B2B5();
    maps\gulag_aud::main();
    thread maps\gulag_code::_id_C523();
    level thread maps\gulag_code::_id_C929();
    level._id_D1F5 = [];
    var_4 = getentarray( "tarp_pull_org", "targetname" );
    common_scripts\utility::array_thread( var_4, maps\gulag_code::_id_B01A );
    var_5 = common_scripts\utility::getstruct( "start_approach", "script_noteworthy" );
    var_6 = common_scripts\utility::getstructarray( "start_approach_friendly", "script_noteworthy" );
    var_6["p"] = var_5;
    thread maps\gulag_code::_id_D405();
    enablepg( "hide_interior_portal_group", 0 );
    thread maps\gulag_code::_id_BFF5();
    setignoremegroup( "team3", "axis" );
    setignoremegroup( "axis", "team3" );
    var_7 = getent( "endlog_soap_spawner", "targetname" );
    var_7 thread maps\_utility::add_spawn_function( maps\gulag_code::_id_CF3D );
    var_7 = getent( "ghost", "script_noteworthy" );
    var_7 thread maps\_utility::add_spawn_function( maps\gulag_code::_id_C15F );
    maps\_utility::array_spawn_function_noteworthy( "overlook_spawner", maps\gulag_code::_id_ACEA );
    maps\_utility::array_spawn_function_targetname( "bhd_spawner", maps\gulag_code::_id_BA8C );
    maps\_utility::array_spawn_function_noteworthy( "breach_death_spawner", maps\gulag_code::_id_AD2D );
    maps\_utility::array_spawn_function_noteworthy( "riot_shield_spawner", maps\gulag_code::_id_BEEC );
    maps\_utility::array_spawn_function_noteworthy( "flee_armory_spawner", maps\gulag_code::_id_A941 );
    maps\_utility::array_spawn_function_noteworthy( "tarp_spawner", maps\gulag_code::_id_B033 );
    maps\_utility::array_spawn_function_noteworthy( "close_fighter_spawner", maps\gulag_code::_id_B871 );
    maps\_utility::array_spawn_function_noteworthy( "bathroom_balcony_spawner", maps\gulag_code::_id_CC7B );
    maps\_utility::array_spawn_function_noteworthy( "riot_escort_spawner", maps\gulag_code::_id_A820 );
    maps\_utility::array_spawn_function_noteworthy( "catwalk_spawner", maps\gulag_code::_id_D582 );
    maps\_utility::array_spawn_function_noteworthy( "dies_fast_to_explosive", maps\gulag_code::_id_C794 );
    maps\_utility::array_spawn_function_noteworthy( "ignore_then_dies_fast_to_explosive", maps\gulag_code::_id_B512 );
    common_scripts\utility::run_thread_on_noteworthy( "low_health_destructible", maps\gulag_code::_id_ADC4 );
    common_scripts\utility::run_thread_on_targetname( "challenge_only", maps\_utility::self_delete );
    var_8 = getentarray( "ally_gets_missed_trigger", "targetname" );
    common_scripts\utility::array_thread( var_8, maps\gulag_code::_id_AE95 );
    var_9 = getentarray( "ally_can_get_hit_trigger", "targetname" );
    common_scripts\utility::array_thread( var_9, maps\gulag_code::_id_D212 );
    var_10 = getentarray( "ally_in_armory", "targetname" );
    common_scripts\utility::array_thread( var_10, maps\gulag_code::_id_B37C );
    var_11 = getentarray( "damage_targ_trigger", "targetname" );
    common_scripts\utility::array_thread( var_11, maps\gulag_code::_id_C268 );
    var_12 = getentarray( "friendlies_ditch_riot_shields_trigger", "targetname" );
    common_scripts\utility::array_thread( var_12, maps\gulag_code::_id_B2FB );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_moves_into_gulag" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "gulag_cell_doors_enabled" );
    thread maps\_utility::do_wait();
    thread maps\gulag_code::_id_CB9D();
    level._id_C01D = 0;
    level._id_C353 = 0;
    level._id_B178 = "slamraam_missile_guided";
    thread _id_A9C4();
    thread _id_CF67();
    thread _id_B544();
    var_13 = getent( "ai_field_blocker", "targetname" );
    var_13 connectpaths();
    var_13 notsolid();
    var_14 = getentarray( "deprecated_traverse", "targetname" );
    common_scripts\utility::array_thread( var_14, maps\_utility::self_delete );
    thread maps\gulag_code::_id_C4D0( "control_tower_event", "controltower" );
    thread maps\gulag_code::_id_C4D0( "last_tower_event", "castletower_1" );
    thread maps\gulag_code::_id_C4D0( "castle_tower_event", "castletower_2" );
    thread maps\gulag_code::_id_C4D0( "balcony_event", "balcony" );
    thread maps\gulag_code::_id_C4D0( "rockslide_event", "rockslide" );
    thread maps\gulag_code::_id_B887();
    thread maps\gulag_code::_id_AA59();
    thread maps\gulag_code::_id_CBAD();
    thread maps\gulag_code::_id_C641();
    var_15 = getentarray( "anti_air_gun", "targetname" );
    common_scripts\utility::array_thread( var_15, maps\gulag_code::_id_A841 );
    thread maps\gulag_code::_id_B85F();
    _id_C247();
    thread maps\gulag_code::_id_D446();

    if ( getdvarint( "limited_mode" ) )
        level._id_C9A9 = maps\gulag_code::_id_B525;

    setsaveddvar( "r_reactiveMotionVehicleEnabled", 1 );
    setsaveddvar( "r_reactiveMotionHelicopterLimit", 1 );
    setsaveddvar( "r_reactiveMotionHelicopterRadius", 1000 );
    setsaveddvar( "r_reactiveMotionVehicleZOffset", -120.0 );
    setsaveddvar( "r_reactiveMotionHelicopterStrength", 5 );
    setsaveddvar( "fx_cast_shadow", 0 );
    setsaveddvar( "r_umbraAccurateOcclusionThreshold", 512 );
    thread _id_C2C9();
    thread maps\gulag_code::_id_CF1F();
    thread maps\gulag_code::_id_BE46();
    thread maps\gulag_code::surprise();
    thread maps\gulag_code::gulag_entrance_portal_group();
    thread maps\gulag_code::hide_courtyard_models();
    _func_31C( 1 );
    _func_31C( 3 );
    _func_31C( 4 );
    _func_31C( 5 );
    _func_31C( 6 );
    level._id_A87F.greenberet_disabled = 1;
    thread maps\gulag_code::exterior_interior_lightgrid();
    level.cellblock_spawning_door = getent( "cellblock_spawning_door", "targetname" );
    level.cellblock_spawning_door notsolid();
    level.cellblock_spawning_door hide();
    level.cellblock_spawning_door_coll = getent( "cellblock_spawning_door_coll", "targetname" );
    level.cellblock_spawning_door_coll connectpaths();
    level.cellblock_spawning_door_coll notsolid();
}

_id_C21D()
{
    common_scripts\utility::flag_init( "intro_helis_go" );
    common_scripts\utility::flag_init( "stop_tv_loop" );
    common_scripts\utility::flag_init( "f15s_spawn" );
    common_scripts\utility::flag_init( "anti_air_missiles_fire" );
    common_scripts\utility::flag_init( "aa_hit" );
    common_scripts\utility::flag_init( "f15s_attack" );
    common_scripts\utility::flag_init( "player_heli_uses_modified_yaw" );
    common_scripts\utility::flag_init( "intro_helis_spawned" );
    common_scripts\utility::flag_init( "player_lands" );
    common_scripts\utility::flag_init( "a_heli_landed" );
    common_scripts\utility::flag_init( "overlook_cleared_with_safe_time" );
    common_scripts\utility::flag_init( "start_armory_music" );
    common_scripts\utility::flag_init( "spotlight_turns_on" );
    common_scripts\utility::flag_init( "cell_door2" );
    common_scripts\utility::flag_init( "cell_door3" );
    common_scripts\utility::flag_init( "cell_door4" );
    common_scripts\utility::flag_init( "cell_door_weapons" );
    common_scripts\utility::flag_init( "access_control_room" );
    common_scripts\utility::flag_init( "going_in_hot" );
    common_scripts\utility::flag_init( "armory_attack_sounds" );
    common_scripts\utility::flag_init( "gulag_cell_doors_enabled" );
    common_scripts\utility::flag_init( "player_exited_bathroom" );
    common_scripts\utility::flag_init( "player_rappels_from_bathroom" );
    common_scripts\utility::flag_init( "rope_drops_now" );
    common_scripts\utility::flag_init( "cell_duty" );
    common_scripts\utility::flag_init( "cellblock_player_starts_rappel" );
    common_scripts\utility::flag_init( "bathroom_second_wave_trigger" );
    common_scripts\utility::flag_init( "soap_snipes_tower" );
    common_scripts\utility::flag_init( "slamraam_gets_players_attention" );
    common_scripts\utility::flag_init( "slamraam_killed_2" );
    common_scripts\utility::flag_init( "stop_rotating_around_gulag" );
    common_scripts\utility::flag_init( "player_goes_in_for_landing" );
    common_scripts\utility::flag_init( "enable_endlog_fx" );
    common_scripts\utility::flag_init( "escape_the_gulag" );
    common_scripts\utility::flag_init( "friendlies_use_riotshield" );
    common_scripts\utility::flag_init( "checking_to_sweep_cells" );
    common_scripts\utility::flag_init( "lets_sweep_the_nvg_cells" );
    common_scripts\utility::flag_init( "soap_finishes_talking_about_going_in" );
    common_scripts\utility::flag_init( "nvg_moveup2" );
    common_scripts\utility::flag_init( "nvg_moveup3" );
    common_scripts\utility::flag_init( "nvg_moveup4" );
    common_scripts\utility::flag_init( "gulag_perimeter" );
    common_scripts\utility::flag_init( "pre_boats_attack" );
    common_scripts\utility::flag_init( "clear_dof" );
    common_scripts\utility::flag_init( "player_heli_backs_up" );
    common_scripts\utility::flag_init( "stop_shooting_right_side" );
    common_scripts\utility::flag_set( "player_can_rappel" );
    common_scripts\utility::flag_init( "background_explosion" );
    common_scripts\utility::flag_init( "ghost_goes_to_laptop" );
    common_scripts\utility::flag_init( "ghost_uses_laptop" );
    common_scripts\utility::flag_init( "castle_tower_event" );
    common_scripts\utility::flag_init( "last_tower_event" );
    common_scripts\utility::flag_init( "control_tower_event" );
    common_scripts\utility::flag_init( "balcony_event" );
    common_scripts\utility::flag_init( "rockslide_event" );
    common_scripts\utility::flag_init( "bombardment_immersion" );
    common_scripts\utility::flag_init( "activate_guns" );
    common_scripts\utility::flag_init( "kill_guns" );
    common_scripts\utility::flag_init( "dont_flash_me_pls" );
    common_scripts\utility::flag_init( "kill_heli_light_fx" );
    common_scripts\utility::flag_init( "shower_balcony_spawned" );
    common_scripts\utility::flag_init( "disable_intro_heli_treadfx_hack" );
    common_scripts\utility::flag_init( "soap_is_waiting" );
    common_scripts\utility::flag_init( "too_late" );
    common_scripts\utility::flag_init( "guy_is_waiting" );
    common_scripts\utility::flag_init( "playing_armory_anim" );
    common_scripts\utility::flag_init( "out_of_armory" );
    common_scripts\utility::flag_init( "first_squad_spawned" );
    common_scripts\utility::flag_init( "player_fx_slide_end" );
    common_scripts\utility::flag_init( "bathroom_breach_objective_dialog" );
}

_id_C2C9()
{
    thread _id_CEA1::_id_B31E( 1, "start_is_set", "exterior", 1, 0 );

    if ( !isdefined( level.helis ) )
        level.helis = [];

    level.helis = common_scripts\utility::array_add( level.helis, getent( "heli_intro_player", "targetname" ) );
    level.helis = maps\_utility::array_merge( level.helis, getentarray( "heli_respawn_spawner", "script_noteworthy" ) );
    common_scripts\utility::flag_wait( "bhd_heli_flies_off" );
    wait 4;
    level notify( "wibble_heli_check_stop" );
}

_id_D1F7()
{
    if ( !maps\_utility::is_specialop() )
    {
        var_0 = getent( "so_weapon_tarp", "targetname" );
        var_0 delete();
    }
}

_id_CBCE()
{
    level.player freezecontrols( 1 );
    var_0 = maps\_hud_util::create_client_overlay( "black", 1, level.player );
    wait 0.5;
    var_1 = [];
    var_1[var_1.size] = &"GULAG_INTROSCREEN_LINE_4";
    var_1[var_1.size] = &"GULAG_INTROSCREEN_LINE_3";
    var_1["date"] = &"GULAG_INTROSCREEN_LINE_2";
    var_1[var_1.size] = &"GULAG_INTROSCREEN_LINE_1";
    level thread maps\_introscreen::introscreen_feed_lines( var_1 );
    wait 2;
    var_0 fadeovertime( 4 );
    var_0.alpha = 0;
    wait 1;
    level.player freezecontrols( 0 );
    wait 3;
    var_0 destroy();
}

_id_C52F()
{
    maps\_loadout::init_loadout();
    level.spawn_funcs = [];
    level.spawn_funcs["allies"] = [];
    level.spawn_funcs["axis"] = [];
    level.spawn_funcs["neutral"] = [];
    maps\_nightvision::main( level.players );
    level.player setactionslot( 1, "nightvision" );
}

_id_C0E1()
{
    soundscripts\_snd::snd_message( "start_empty_checkpoint" );
}

_id_C62B()
{
    if ( common_scripts\utility::flag( "disable_intro_heli_treadfx_hack" ) )
        return;

    var_0 = [ "script_vehicle_littlebird_armed", "script_vehicle_littlebird_bench", "script_vehicle_littlebird_bench_allylanding_1", "script_vehicle_littlebird_bench_allylanding_2", "script_vehicle_littlebird_player" ];
    var_1 = [];
    var_2 = maps\_vehicle::get_surface_types();

    foreach ( var_4 in var_0 )
    {
        var_1[var_4] = level._vehicle_effect[var_4];

        foreach ( var_6 in var_2 )
        {
            if ( var_6 == "water" )
                continue;

            level._vehicle_effect[var_4][var_6] = undefined;
            var_7 = maps\_treadfx::_id_B702( var_6 );

            foreach ( var_9 in var_7 )
                level._vehicle_effect[var_4][var_9] = undefined;
        }
    }

    common_scripts\utility::flag_wait( "disable_intro_heli_treadfx_hack" );

    foreach ( var_4 in var_0 )
        level._vehicle_effect[var_4] = var_1[var_4];
}

_id_C4A4()
{
    level.player disableweapons();
    thread maps\gulag_code::_id_C78D();
    level.treadfx_maxheight = 5000;
    level._id_D24D = 1;
    enablepg( "hide_interior_portal_group", 0 );
    thread _id_C62B();
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "hud_drawhud", 1 );
    maps\_utility::array_spawn_function_noteworthy( "goal_delete_spawner", maps\gulag_code::_id_B6A1 );
    thread maps\gulag_code::_id_B9BA();
    var_0 = getentarray( "heli_smoke_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\gulag_code::_id_AB03 );
    thread maps\gulag_code::_id_BE28();
    thread maps\gulag_code::_id_CF5D();
    thread maps\_introscreen::_id_C3B5( 0.7, 1 );
    var_1 = gettime();
    level._id_B349 = gettime();
    var_2 = getent( "going_in_hot", "script_noteworthy" );
    var_2 maps\_utility::add_spawn_function( maps\gulag_code::_id_CD94 );
    thread maps\gulag_code::_id_B123();
    var_3 = getentarray( "intro_heli_1", "targetname" );
    var_4 = level.scr_anim["littlebird"]["spawn"];
    thread maps\gulag_code::_id_BB52( var_3, var_4 );
    var_5 = level._id_CB62;
    thread maps\gulag_code::_id_CCE4();
    wait 1.2;
    thread maps\gulag_code::_id_CF6E();
}

_id_D548()
{
    soundscripts\_snd::snd_message( "start_approach_checkpoint" );
    maps\_utility::array_spawn_function_noteworthy( "goal_delete_spawner", maps\gulag_code::_id_B6A1 );
    thread maps\gulag_code::_id_BE28();
    common_scripts\utility::flag_set( "display_introscreen_text" );
}

_id_B785()
{
    maps\_utility::battlechatter_off( "allies" );
    maps\gulag_code::_id_D5A3();
    level.player disableweapons();
    enablepg( "hide_interior_portal_group", 0 );
    level._id_D13B setsurfacetype( "default" );
    common_scripts\utility::flag_wait( "display_introscreen_text" );
    wait 2.2;
    savegame( "approach", &"AUTOSAVE_AUTOSAVE", " ", 1 );
    var_19 = [];
    var_19[var_19.size] = &"GULAG_INTROSCREEN_1";
    var_19[var_19.size] = &"GULAG_INTROSCREEN_2";
    var_19[var_19.size] = &"GULAG_INTROSCREEN_3";
    var_19[var_19.size] = &"GULAG_INTROSCREEN_4";
    var_19[var_19.size] = &"GULAG_INTROSCREEN_5";
    thread maps\_introscreen::introscreen_feed_lines( var_19 );
    common_scripts\utility::flag_wait( "approach_dialogue" );
    wait 1;
    thread maps\gulag_code::_id_CE74();
    maps\_utility::radio_dialogue_stop();
    thread maps\_utility::radio_dialogue( "gulag_lbp2_goinghot" );
    common_scripts\utility::flag_set( "going_in_hot" );
    thread maps\_utility::radio_dialogue( "gulag_lbp1_roger" );
    wait 3.65;
    maps\_utility::delaythread( 7, maps\gulag_code::_id_D578, 11 );
    maps\_utility::flag_set_delayed( "disable_intro_heli_treadfx_hack", 0.5 );
    wait 2;
    thread maps\_utility::radio_dialogue( "gulag_lbp2_guns" );
    wait 0.35;
    wait 1;
    thread maps\_utility::radio_dialogue( "gulag_lbp2_guns2" );
    wait 1.9;
    maps\_utility::delaythread( 2, maps\_utility::kill_deathflag, "first_tower" );
    common_scripts\utility::flag_set( "player_heli_uses_modified_yaw" );
    thread maps\_utility::flag_set_delayed( "activate_guns", 3.5 );
    wait 1;
    maps\_utility::delaythread( 1, maps\_utility::radio_dialogue_overlap, "gulag_lbp1_goodeffect" );

    foreach ( var_21 in level._id_C70C )
    {
        var_21 maps\_vehicle::mgon();

        foreach ( var_23 in var_21.mgturret )
            var_23 setmode( "auto_nonai" );
    }

    level._id_C1CE = 3;
    level._id_CB62 thread maps\gulag_code::_id_CC72();
    wait 3.2;
    maps\_utility::delaythread( 2, maps\gulag_code::_id_C844 );
    wait 3;
    wait 0.65;
    thread maps\gulag_code::_id_CD59( "player_shoot_start" );
    common_scripts\utility::flag_wait( "stabilize" );
    wait 0.75;
    maps\_utility::delaythread( 2, common_scripts\utility::flag_set, "soap_snipes_tower" );
    thread maps\_utility::radio_dialogue( "gulag_lbp1_roger2" );
    maps\_utility::delaythread( 8, maps\_utility::kill_deathflag, "stab1_clear", 6 );
    var_26 = gettime();
    common_scripts\utility::flag_wait( "stab1_clear" );
    common_scripts\utility::flag_clear( "stabilize" );
    common_scripts\utility::flag_clear( "soap_snipes_tower" );
    wait 0.75;
    wait 0.75;
    thread maps\gulag_code::_id_C4C2();
    wait 1.25;
    common_scripts\utility::flag_set( "stab1_shift" );
    common_scripts\utility::flag_wait( "stabilize" );
    maps\_utility::delaythread( 2, common_scripts\utility::flag_set, "soap_snipes_tower" );
    var_27 = getentarray( "second_tower_guard", "script_noteworthy" );
    common_scripts\utility::array_thread( var_27, maps\gulag_code::_id_C3FA );
    wait 4;
    var_28 = getent( "car_blows_up", "script_noteworthy" );
    radiusdamage( var_28.origin, 800, 5000, 5000 );
    var_29 = getentarray( "tarp_puller_spawner", "targetname" );
    common_scripts\utility::array_thread( var_29, maps\_utility::spawn_ai );
    level waittill( "tarp_activate" );
    maps\_utility::delaythread( 4, maps\_utility::kill_deathflag, "sam_cleared", 2.5 );
    common_scripts\utility::flag_wait( "sam_cleared" );
    common_scripts\utility::flag_clear( "soap_snipes_tower" );
    wait 0.5;
    maps\_utility::delaythread( 1, common_scripts\_exploder::exploder, "main_building" );
    thread maps\_utility::flag_set_delayed( "castle_tower_event", 2 );
    thread maps\gulag_code::_id_B615();
    wait 1.5;
    common_scripts\utility::flag_set( "stab2_clear" );
    common_scripts\utility::flag_clear( "stabilize" );
    level._id_D13B setsurfacetype( "flesh" );
}

_id_BB67()
{
    maps\_utility::array_spawn_function_noteworthy( "goal_delete_spawner", maps\gulag_code::_id_B6A1 );
    thread maps\gulag_code::_id_BE28();
    var_0 = getent( "heli_intro_player", "targetname" );
    var_1 = common_scripts\utility::getstruct( "start_player_perimeter", "script_noteworthy" );
    var_0.origin = var_1.origin;
    var_0.angles = var_1.angles;
    maps\gulag_code::_id_C917( var_0.target, var_1.targetname );
    var_0.target = var_1.targetname;
    thread maps\gulag_code::_id_B123();
    level.player setplayerangles( ( 0.0, -163.0, 0.0 ) );
    var_2 = 24;
    level._id_CB62 vehicle_setspeedimmediate( var_2, var_2 / 4, var_2 / 4 );
    level._id_C1CE = 3;
    level._id_CB62 thread maps\gulag_code::_id_CC72();
    maps\gulag_code::_id_D578( 3 );
}

_id_C025()
{
    soundscripts\_snd::snd_message( "start_f15_checkpoint" );
    maps\_utility::array_spawn_function_noteworthy( "goal_delete_spawner", maps\gulag_code::_id_B6A1 );
    maps\gulag_lighting::_id_B3E6( "gulag_flight" );
    var_0 = getent( "heli_intro_player", "targetname" );
    var_1 = common_scripts\utility::getstruct( "f15_attack_start", "script_noteworthy" );
    var_0.origin = var_1.origin;
    var_0.angles = var_1.angles;
    maps\gulag_code::_id_C917( var_0.target, var_1.targetname );
    var_0.target = var_1.targetname;
    thread maps\gulag_code::_id_B123();
    var_2 = 40;
    level._id_CB62 vehicle_setspeedimmediate( var_2, var_2 / 4, var_2 / 4 );
    level._id_C1CE = 3;
    level._id_CB62 thread maps\gulag_code::_id_CC72();
    maps\gulag_code::_id_D578( 3 );
}

_id_AA5F()
{
    common_scripts\_exploder::exploder( "heli_landing_fx" );
    level.treadfx_maxheight = undefined;
    level._id_D24D = undefined;
    level notify( "stop_special_treadfx" );
    common_scripts\utility::flag_set( "first_squad_spawned" );
    enablepg( "hide_interior_portal_group", 0 );
    thread maps\gulag_code::_id_CFB7();
    common_scripts\utility::flag_set( "gulag_perimeter" );
    thread maps\gulag_code::_id_AAB2();
    common_scripts\utility::flag_wait( "f15_gulag_explosion" );
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_set( "kill_guns" );
    wait 2;
    thread maps\_utility::flag_set_delayed( "last_tower_event", 3 );
    maps\_utility::autosave_by_name( "gulag_perimeter" );
    level.player giveweapon( "m4m203_reflex_arctic" );

    if ( isdefined( level._id_A87F.tactical_greenberet ) && level._id_A87F.tactical_greenberet == 1 )
    {
        level._id_A87F.greenberet_previousweapons["m4m203_reflex_arctic"]["ammoClip"] = 30;
        level._id_A87F.greenberet_previousweapons["m4m203_reflex_arctic"]["ammoStock"] = 600;
        level._id_A87F.greenberet_previousweapons["m4m203_reflex_arctic"]["akimbo"] = 0;
    }

    setomnvar( "ui_expireHUD", 1 );
    level notify( "stop_tarp_idle" );
    level notify( "stop_gulag_drones" );
    thread maps\gulag_code::_id_B918();
    wait 3.5;
    thread maps\gulag_code::_id_B7DB();
    _func_31B( 1 );
    clearallcorpses();
    wait 2.9;
    maps\gulag_code::_id_CA93( "Hargrove, get the navy to cease fire immediately! That was too close!" );
    common_scripts\utility::flag_set( "kill_heli_light_fx" );
    thread maps\gulag_code::_id_A876();
    thread maps\gulag_code::_id_AF34();
    common_scripts\utility::noself_delaycall( 11, ::setsaveddvar, "g_friendlyNameDist", 15000 );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::delaythread( 41, maps\_utility::battlechatter_on, "allies" );
    thread maps\gulag_code::_id_ABB4();
    maps\gulag_code::_id_CA93( "The navy doesn't care about one man in a Gulag. I'll try to buy you some time but I can't promise much." );
    thread maps\gulag_code::_id_D1B6();
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::pathrandompercent_set( 200 );

    level._id_CB62 waittill( "nearing_landing" );
    wait 0.3;
    setsaveddvar( "ammoCounterHide", 1 );
    level.player disableweapons( 0, 500, 0.2 );
    soundscripts\_snd::snd_message( "start_helicopter_landing" );
    thread maps\_utility::radio_dialogue( "gulag_lbp1_touchdown" );
    thread maps\_utility::radio_dialogue( "gulag_lbp1_deployed" );
    thread maps\_utility::radio_dialogue( "gulag_lbp3_snipercover" );
    thread maps\_utility::radio_dialogue( "gulag_lbp1_solidcopy" );
    level._id_D13B maps\_utility::set_force_color( "cyan" );
    level._id_D13B stoplookat();
    thread maps\gulag_code::_id_C745();
    level._id_CB62 waittill( "stable_for_unlink" );
    level.player setactionslot( 1, "nightvision" );
    level.player giveweapon( "claymore" );
    level.player setactionslot( 4, "weapon", "claymore" );
    level.player givemaxammo( "claymore" );
    setsaveddvar( "ammoCounterHide", 0 );
    level.player thread maps\_utility::_id_B43E( "disable_exterior_fx" );
    level.player playersetgroundreferenceent( undefined );
    missile_deleteattractor( level.player_repulsor );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2.ignoresuppression = 1;
        var_2 maps\_utility::pathrandompercent_set( 200 );
    }

    var_6 = level._id_CC0B gettagangles( "tag_aim" );
    var_6 = ( 0, var_6[1], 0 );
    var_7 = anglestoforward( var_6 );
    var_7 *= 32;
    var_8 = common_scripts\utility::spawn_tag_origin();
    var_8.origin = level._id_CC0B.origin;
    var_8.angles = level._id_CC0B.angles;
    level._id_CC0B linkto( var_8 );
    var_9 = 0.2;
    var_8 moveto( var_8.origin + var_7 + ( 0.0, 0.0, 4.0 ), var_9, 0.1, 0.1 );
    wait(var_9);
    level._id_CC0B delete();
    var_8 delete();
    maps\gulag_code::_id_D313();
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
    level.player _meth_830F( 1 );
    level.player allowjump( 1 );
    maps\_utility::autosave_by_name( "player_lands" );
    level._id_D13B maps\_utility::forceuseweapon( "m4m203_reflex_arctic", "primary" );
    common_scripts\utility::flag_set( "access_control_room" );
    level._id_CB62 setanim( level.scr_anim["littlebird"]["player_additive"] );
}

start_control_room()
{
    soundscripts\_snd::snd_message( "start_control_room_checkpoint" );
    maps\gulag_lighting::_id_B3E6( "gulag_entrance" );
    var_0 = common_scripts\utility::getstruct( "ghost_spawner_struct", "targetname" );
    var_1 = getent( "ghost", "script_noteworthy" );
    var_1.script_drone = undefined;
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    var_2 = getentarray( "start_controlroom_spawner", "targetname" );
    var_2 = maps\gulag_code::_id_BEA5( var_2 );
    var_2[var_2.size] = var_1;
    common_scripts\utility::array_thread( var_2, maps\_utility::spawn_ai );
    _func_31B( 1 );
    _func_31C( 2 );
    var_3 = getent( "start_controlroom_player", "targetname" );
    level.player setorigin( var_3.origin );
    level.player setplayerangles( var_3.angles );
}

_id_D311()
{
    common_scripts\utility::flag_wait( "player_inside_gulag" );
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_getout" );
    common_scripts\utility::flag_set( "start_armory_music" );
    level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_checkcorners" );
    wait 1.5;
    common_scripts\utility::flag_set( "soap_finishes_talking_about_going_in" );
}

_id_B793()
{
    common_scripts\utility::flag_set( "gulag_enable_transition_fx_vol" );
    common_scripts\utility::flag_wait( "player_progresses_passed_ext_area" );
    maps\_utility::kill_deathflag( "upper_balcony_deathflag", 4 );
    thread maps\gulag_code::_id_A8E3();

    if ( !common_scripts\utility::flag( "player_nears_cell_door1" ) )
    {
        maps\_utility::activate_trigger_with_targetname( "ext_finished" );
        thread maps\gulag_code::_id_BDDC();
    }

    common_scripts\utility::flag_wait( "postup_outside_gulag" );
    thread _id_D311();

    if ( isalive( level._id_B8D7 ) )
    {
        level.currentcolorforced[level._id_B8D7 maps\_colors::get_team()]["l"] = "l0";
        level._id_B8D7 maps\_utility::set_force_color( "l" );
    }

    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.old_pathrandompercent ) )
            var_2 maps\_utility::pathrandompercent_reset();
    }

    maps\_utility::add_global_spawn_function( "axis", maps\gulag_code::_id_AA2E );
    maps\_utility::add_global_spawn_function( "allies", maps\_utility::enable_cqbwalk );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2.baseaccuracy = 1;
        var_2.attackeraccuracy = 1;
    }

    common_scripts\utility::flag_wait_either( "last_outside_guys", "player_moves_into_gulag" );
    level._id_D13B maps\_utility::set_force_color( "cyan" );

    if ( !common_scripts\utility::flag( "player_nears_cell_door1" ) )
        maps\_utility::activate_trigger_with_targetname( "outside_gulag_postup" );

    common_scripts\utility::flag_wait( "player_moves_into_gulag" );
    maps\gulag_code::_id_B6F0();
    _func_31B( 3 );
    _func_31B( 4 );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
        var_2.ignoresuppression = 1;

    var_8 = getent( "friendly_reinforcement_trigger", "targetname" );
    var_8 thread maps\gulag_code::_id_B5FC();
    var_9 = getent( "purple_friendlies_priority_volume", "targetname" );
    var_0 = getaiarray( "allies" );
    var_0 = maps\_utility::remove_heroes_from_array( var_0 );
    var_10 = 0;

    foreach ( var_12, var_2 in var_0 )
    {
        if ( var_2 istouching( var_9 ) )
        {
            var_10++;
            var_2 maps\_utility::set_force_color( "p" );
            var_0[var_12] = undefined;
        }
    }

    var_0 = maps\_utility::remove_dead_from_array( var_0 );

    for ( var_13 = var_10; var_13 < 2; var_13++ )
    {
        if ( !isalive( var_0[var_13] ) )
            continue;

        var_0[var_13] maps\_utility::set_force_color( "p" );
        var_0[var_13] = undefined;
    }

    var_0 = maps\_utility::remove_dead_from_array( var_0 );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::set_force_color( "o" );

    if ( !common_scripts\utility::flag( "player_nears_cell_door1" ) )
        maps\_utility::activate_trigger_with_targetname( "pre_controlroom_postup" );

    charge_in_gulag();
    thread disable_turn_in_gulag_stair();
    thread enable_turn_in_gulag_stair();
    common_scripts\utility::flag_wait( "soap_finishes_talking_about_going_in" );
    var_9 = getent( "control_room_hallway_volume", "targetname" );
    var_9 maps\_utility::waittill_volume_dead_or_dying();

    if ( isalive( level._id_B8D7 ) )
        level._id_B8D7 maps\_utility::disable_ai_color();
    else
    {

    }

    if ( !common_scripts\utility::flag( "player_nears_cell_door1" ) )
    {
        maps\_utility::activate_trigger_with_targetname( "control_room_postup" );
        var_16 = getnode( "h2_ghost_node", "targetname" );
        level._id_B8D7 maps\_utility::set_goal_node( var_16 );
    }

    common_scripts\utility::flag_wait( "disable_exterior_fx" );
    maps\gulag_code::_id_AE9B( "gulag_gst_controlroom" );
    thread maps\gulag_code::_id_CB8E();
    common_scripts\utility::flag_wait( "control_room" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
        var_2.ignoresuppression = 0;

    thread maps\gulag_code::_id_C4D1();
    var_0 = getaiarray( "allies" );
    var_19 = [];
    var_19[0] = level._id_D13B;
    var_19[1] = level._id_B8D7;
    var_0 = common_scripts\utility::get_array_of_closest( level.player.origin, var_0, var_19 );
    var_20 = 2;

    for ( var_13 = 0; var_13 < var_20; var_13++ )
    {
        var_2 = var_0[var_13];

        if ( !isalive( var_2 ) )
            continue;

        var_2 maps\_utility::set_force_color( "g" );
        var_2 maps\gulag_code::_id_D382();
        var_2 _meth_8170( 1 );
    }

    for ( var_13 = var_20; var_13 < var_0.size; var_13++ )
        var_0[var_13] maps\_utility::disable_ai_color();

    maps\_utility::add_global_spawn_function( "allies", maps\gulag_code::_id_D382 );
    maps\gulag_code::_id_C777();
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_set( "ghost_goes_to_laptop" );

    if ( isalive( level._id_B8D7 ) )
        level._id_B8D7 maps\_utility::set_battlechatter( 0 );

    maps\gulag_code::_id_AE9B( "gulag_cmt_tapinto" );
    common_scripts\utility::flag_set( "cell_duty" );
    thread maps\gulag_code::_id_D48A();

    if ( !common_scripts\utility::flag( "player_nears_cell_door1" ) )
        maps\_utility::activate_trigger_with_targetname( "first_cell_postup" );

    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_cellduty" );
    level._id_D13B _meth_8170( 1 );
    common_scripts\utility::flag_wait( "player_nears_cell_door1" );
    thread maps\gulag_code::_id_C26D();
    thread maps\gulag_code::_id_D0F2();
    common_scripts\utility::flag_wait( "cellblock_clear1" );
    wait 0.5;
    maps\_utility::radio_dialogue( "gulag_tf1_cellclear" );
    wait 0.4;
    common_scripts\utility::flag_wait( "ghost_uses_laptop" );
    maps\_utility::radio_dialogue( "gulag_gst_patchedin" );
    thread maps\gulag_code::_id_C417( "hacking_vo1" );
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_location" );
    maps\_utility::delaythread( 1.5, common_scripts\utility::flag_set, "spotlight_turns_on" );
    level.spotlights["a"] maps\_utility::delaythread( 2.5, maps\gulag_code::_id_C606, getent( "spotlight_volume_a1", "targetname" ) );
    level.spotlights["b"] maps\_utility::delaythread( 2.5, maps\gulag_code::_id_C606, getent( "spotlight_volume_b1", "targetname" ) );
    maps\_utility::radio_dialogue( "gulag_gst_jobeasier" );
    thread maps\gulag_code::_id_C417( "hacking_vo2" );
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_staysharp" );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_wait( "player_nears_cell_door2" );
    thread maps\gulag_code::_id_C38D();
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_secdoor" );
    thread maps\_utility::radio_dialogue( "gulag_cmt_ancient" );
    thread maps\gulag_code::_id_C417( "hacking_vo3" );
    wait 2.5;
    common_scripts\utility::flag_set( "open_cell_door3" );
    wait 3;
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_wrongdoor" );
    thread maps\_utility::radio_dialogue( "gulag_gst_standby" );
    thread maps\gulag_code::_id_C417( "hacking_vo4" );
    wait 3;
    common_scripts\utility::flag_set( "open_cell_door2" );
    thread maps\gulag_code::_id_CB49( "mid_door_rambo" );
    maps\_utility::radio_dialogue( "gulag_gst_gotit2" );
    thread maps\gulag_code::_id_C417( "hacking_vo5" );
    maps\_utility::activate_trigger_with_targetname( "mid_door_opens" );
    wait 1;
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_thatsbetter" );
    var_21 = getent( "soap_securitydoor", "targetname" );
    var_22 = distance( level._id_D13B.origin, var_21.origin );

    if ( var_22 < 8 )
        var_21 thread maps\_anim::anim_single_solo( level._id_D13B, "securitydoor_soap_enter" );

    common_scripts\utility::flag_wait( "cell_clear_1" );
    maps\_utility::radio_dialogue( "gulag_tf1_cell4dclear" );
    common_scripts\utility::flag_wait( "cell_clear_2" );
    maps\_utility::radio_dialogue( "gulag_tf1_cellsclear" );
    common_scripts\utility::flag_wait( "player_nears_cell_door4" );
    maps\_utility::delaythread( 3.5, common_scripts\utility::flag_set, "open_cell_door4" );
    thread maps\gulag_code::_id_CB49( "pre_armory_rambo" );
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_talktome" );
    maps\gulag_code::_id_A87A();
    maps\_utility::radio_dialogue( "gulag_gst_eastwing" );
    level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_armorydownthere" );
    level._id_D13B _meth_8170( 0 );

    foreach ( var_0 in getaiarray( "allies" ) )
    {
        if ( isalive( var_0 ) )
            var_0 _meth_8170( 0 );
    }

    maps\_utility::activate_trigger_with_targetname( "pre_armory" );
    thread maps\gulag_code::_id_A9EE();
    wait 2.3;
    common_scripts\utility::flag_set( "pre_armory_open" );
    maps\_utility::activate_trigger_with_noteworthy( "pre_armory" );
    common_scripts\utility::flag_wait( "player_approaches_armory" );
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_0, maps\gulag_code::_id_C260 );
}

_id_CF32()
{
    soundscripts\_snd::snd_message( "start_armory_checkpoint" );
    maps\gulag_lighting::_id_B3E6( "gulag_cellblock_01" );
    thread maps\gulag_code::_id_C4D1();
    common_scripts\utility::flag_set( "player_nears_cell_door1" );
    common_scripts\utility::flag_set( "pre_armory_open" );
    maps\_utility::activate_trigger_with_noteworthy( "pre_armory" );
    thread maps\gulag_code::_id_A9EE();
    var_0 = getentarray( "start_armory_spawner", "targetname" );
    var_0 = maps\gulag_code::_id_BEA5( var_0 );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    _func_31B( 1 );
    _func_31C( 2 );
    _func_31B( 3 );
    _func_31B( 4 );
    var_1 = getent( "start_armory_player", "targetname" );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles );
    maps\_utility::_id_C636( "0.5 12 2 2" );
    wait 0.05;
    level._id_D13B maps\_utility::set_force_color( "cyan" );
}

_id_BFC1()
{
    common_scripts\utility::flag_set( "gulag_enable_cellblock_fx_vol" );
    common_scripts\utility::flag_clear( "gulag_enable_exterior_fx_vol" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::disable_heat_behavior();
        var_2 maps\_utility::delaythread( 3, maps\_utility::enable_dontevershoot );
    }

    thread maps\_utility::battlechatter_off( "axis" );
    thread maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_wait( "player_in_armory" );
    _func_31C( 3 );
    _func_31B( 5 );
    level notify( "cancel_surprise" );
    level notify( "stop_exterior_alarm" );

    foreach ( var_5 in level.spotlights )
        var_5 notify( "stop_searching" );

    level._id_C69C = 0;
    maps\_utility::add_global_spawn_function( "axis", maps\gulag_code::_id_CD44 );
    thread maps\gulag_code::_id_CDDF( 4000 );
    common_scripts\utility::flag_wait( "playing_armory_anim" );
    maps\_utility::delaythread( 7.5, ::_id_BD8A );
    level waittill( "door_open" );
    common_scripts\utility::flag_set( "open_cell_door_weapons" );
    var_7 = getaiarray( "allies" );

    foreach ( var_2 in var_7 )
    {
        var_2.baseaccuracy = 10;
        var_2 maps\_utility::disable_surprise();
    }

    maps\_utility::set_player_attacker_accuracy( 0.85 );
    maps\_utility::activate_trigger_with_targetname( "armory_attacked_postup" );
    level.spotlights["a"] thread maps\gulag_code::_id_C606( getent( "spotlight_volume_a2", "targetname" ) );
    level.spotlights["b"] thread maps\gulag_code::_id_C606( getent( "spotlight_volume_b2", "targetname" ) );
    level waittill( "wave1_start" );
    thread maps\gulag_code::_id_C379();
    waitframe();
    wait 4;

    foreach ( var_2 in var_7 )
        var_2 _meth_8170( 1 );

    maps\gulag_code::_id_CBA4();
    var_12 = gettime();
    maps\_utility::set_player_attacker_accuracy( 0 );
    level.player.ignorerandombulletdamage = 1;
    maps\_utility::autosave_by_name_thread( "armory_fight", 10 );
    maps\_utility::wait_for_buffer_time_to_pass( var_12, 3 );
    wait 0.5;
    maps\_gameskill::updatealldifficulty();
    level.player.ignorerandombulletdamage = 0;
    thread maps\_utility::radio_dialogue( "gulag_gst_gotmoretangos" );
    var_7 = getaiarray( "allies" );

    foreach ( var_2 in var_7 )
        var_2.baseaccuracy = 0;

    wait 2.35;
    var_15 = [];
    var_15[0] = 5;
    var_15[1] = 4;
    var_15[2] = 2.5;
    var_15[3] = 1.5;
    var_16 = var_15[level.gameskill];
    maps\_utility::delaythread( var_16, maps\gulag_code::_id_CE6E );
    thread maps\gulag_code::_id_B1E9();
    level._id_ACE4 = [];
    var_0 = level._id_C7D7;
    common_scripts\utility::array_thread( var_0, maps\gulag_code::_id_CF6A );
    common_scripts\utility::flag_set( "friendlies_use_riotshield" );
    wait 9.5;

    if ( !maps\_utility::player_has_weapon( "riotshield" ) )
        maps\_utility::set_player_attacker_accuracy( 1.5 );

    thread maps\gulag_code::_id_B3EB();
    wait 5;
    wait 1.5;
    maps\_utility::activate_trigger_with_targetname( "take_cover_at_armory_door" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
        var_2 _meth_8170( 0 );

    wait 4.5;
    level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_openthedoor" );
    wait 2.0;
    thread maps\_utility::radio_dialogue( "gulag_gst_gotit" );
    wait 2.5;
    level notify( "force_door_open" );
    level waittill( "cell_door_opens" );
    thread maps\gulag_code::_id_B33C();
    maps\_utility::activate_trigger_with_targetname( "post_armory" );
    common_scripts\utility::flag_wait( "run_from_armory" );
    var_19 = getent( "run_from_armory_kill_volume", "targetname" );
    var_0 = var_19 maps\_utility::get_ai_touching_volume( "axis" );

    foreach ( var_2 in var_0 )
        var_2 thread maps\gulag_code::_id_C260();

    maps\_utility::remove_global_spawn_function( "axis", maps\gulag_code::_id_CD44 );
    var_0 = getaiarray( "axis" );
    thread maps\gulag_code::_id_B5CB( var_0 );
    maps\_gameskill::updatealldifficulty();
    maps\gulag_code::_id_CF9A();
    thread maps\gulag_code::_id_BEE9();
    level notify( "stop_cellblock_respawn" );
    thread maps\gulag_code::_id_C231();
    var_7 = getaiarray( "allies" );

    foreach ( var_2 in var_7 )
    {
        var_2.baseaccuracy = 1;
        var_2 maps\_utility::enable_surprise();
    }

    level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_gogogo1" );
    level._id_ACE4 = maps\_utility::remove_dead_from_array( level._id_ACE4 );

    foreach ( var_2 in level._id_ACE4 )
        var_2 maps\_utility::enable_dontevershoot();

    maps\_utility::battlechatter_on( "axis" );
    common_scripts\utility::flag_wait( "use_your_riotshield" );
    level.cellblock_spawning_door_coll disconnectpaths();
    level.cellblock_spawning_door_coll solid();
    level.cellblock_spawning_door show();
    level.cellblock_spawning_door solid();

    if ( level.player getcurrentweapon() == "riotshield" )
    {
        common_scripts\utility::flag_clear( "friendlies_use_riotshield" );
        level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_usesheild" );
        var_0 = getaiarray( "allies" );

        foreach ( var_2 in var_0 )
            var_2 maps\gulag_code::_id_AA56();
    }
    else
    {
        common_scripts\utility::flag_set( "friendlies_use_riotshield" );
        level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_illdrawfire" );
    }

    maps\_utility::delaythread( 3.5, maps\_utility::battlechatter_on, "allies" );
    common_scripts\utility::flag_wait( "last_cellblock_guys_flee" );
    maps\gulag_code::_id_D588();
    common_scripts\utility::flag_wait( "rappel_time" );
    var_7 = getaiarray( "allies" );

    foreach ( var_2 in var_7 )
        var_2 maps\_utility::enable_surprise();

    thread _id_BFAD();
}

_id_BD8A()
{
    if ( !isdefined( level._id_C7D7 ) || level._id_C7D7.size < 2 )
        maps\_utility::activate_trigger_with_targetname( "stand_at_armory_door" );
}

_id_BFAD()
{
    maps\_utility::radio_dialogue( "gulag_gst_bypassfloors" );
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_roachfollow" );
}

_id_B80C()
{
    soundscripts\_snd::snd_message( "start_rappel_checkpoint" );
    maps\gulag_lighting::_id_B3E6( "gulag_cellblock_01" );
    maps\gulag_code::_id_CF9A();
    var_0 = getentarray( "start_rappel_spawner", "targetname" );
    var_0 = maps\gulag_code::_id_BEA5( var_0 );

    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        var_0[var_1] maps\_utility::add_spawn_function( maps\_utility::replace_on_death );

    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    _func_31B( 1 );
    _func_31C( 2 );
    _func_31B( 4 );
    _func_31B( 5 );
    var_2 = getent( "start_rappel_player", "targetname" );
    level.player setorigin( var_2.origin );
    level.player setplayerangles( var_2.angles );
    maps\_utility::_id_C636( "0.5 12 2 2" );
    maps\gulag_code::_id_BEE9();
}

_id_CF88()
{
    wait 1.8;
    maps\_utility::radio_dialogue( "gulag_gst_feedisdead" );
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_switchnv" );
}

_id_D113()
{
    common_scripts\utility::flag_set( "gulag_enable_cellblock_fx_vol" );
    common_scripts\utility::flag_clear( "gulag_enable_exterior_fx_vol" );
    common_scripts\utility::flag_set( "access_control_room" );
    common_scripts\utility::flag_set( "control_room" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2.baseaccuracy = 1;
        var_2.attackeraccuracy = 1;
    }

    maps\gulag_code::_id_D22C();
    level._id_D13B thread maps\gulag_code::_id_BAC2();
    common_scripts\utility::flag_wait( "cellblock_player_starts_rappel" );
    enablepg( "hide_interior_portal_group", 1 );
    thread maps\gulag_aud::_id_D478();
    var_4 = getent( "gulag_hallway_destructibles", "script_noteworthy" );
    var_4 maps\_utility::activate_destructibles_in_volume();
    var_4 maps\_utility::activate_interactives_in_volume();
    wait 5;
    maps\_utility::activate_trigger_with_targetname( "cellblock_exit_postup" );
    thread _id_CF88();
    thread maps\gulag_code::_id_C876();
    var_5 = getentarray( "friendly_cellhall_spawner", "targetname" );
    maps\_utility::array_spawn_function( var_5, maps\_utility::replace_on_death );
    common_scripts\utility::array_thread( var_5, maps\_utility::spawn_ai );
    common_scripts\utility::flag_wait( "leaving_cellblock" );
    maps\_utility::activate_trigger_with_targetname( "friendly_nvg_hallway_trigger" );
    maps\gulag_lighting::_id_B14F( "exploding_wall" );
    level.player maps\_utility::delaythread( 0.8, maps\_utility::display_hint, "nvg", undefined, undefined, undefined, undefined, 15 );
    common_scripts\utility::flag_wait( "nvg_zone" );
    var_6 = getentarray( "hallway_runner_spawner", "script_noteworthy" );
    var_7 = getnodearray( "nvg_ambush_node", "targetname" );
    var_7 = common_scripts\utility::array_randomize( var_7 );
    common_scripts\utility::array_thread( var_7, maps\gulag_code::_id_D2C0 );

    foreach ( var_10, var_9 in var_6 )
        var_9.origin = var_7[var_10].origin;

    maps\_utility::activate_trigger_with_targetname( "friendly_nvg_cell_hall_postup" );
    thread maps\gulag_code::_id_B6B9();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "lets_sweep_the_nvg_cells" );
    maps\_utility::add_func( maps\gulag_code::_id_B484 );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "nvg_leave_cellarea" );
    var_11 = getent( "h2_explosion_trigger", "targetname" );
    var_11 thread maps\gulag_code::_id_D5B9();
    var_11 waittill( "trigger" );
    maps\_utility::delaythread( 7.2, maps\gulag_code::_id_C85B, "moving_chain_hook_cellblock2" );
    disableforcedsunshadows();
    common_scripts\_exploder::exploder( "hall_attack_explosion" );
    soundscripts\_snd::snd_message( "start_hallway_attack" );
    level.player common_scripts\utility::delaycall( 0.5, ::shellshock, "gulag_attack", 5, 0 );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "actionSlotsHide", 1 );
    setsaveddvar( "hud_showStance", 0 );
    var_12 = getent( "explosion_ref", "targetname" );
    var_13 = level.player getplayerangles();
    var_14 = angleclamp180( var_13[1] - var_12.angles[1] );
    var_15 = "front";

    if ( var_14 > 45 && var_14 <= 135 )
        var_15 = "right";
    else if ( var_14 > 135 || var_14 <= -135 )
        var_15 = "back";
    else if ( var_14 > -135 && var_14 <= -45 )
        var_15 = "left";

    var_16 = "explosion_" + var_15;
    var_17 = getent( "explosion_scripted_node", "targetname" );
    var_18 = var_17.origin - level.player.origin;
    var_18 = ( cos( var_17.angles[1] ), sin( var_17.angles[1] ), 0 ) * length2d( var_18 );
    var_17.origin -= var_18;
    level.player enabledeathshield( 1 );
    level.player disableweapons( 1 );
    level.player setstance( "stand" );
    level.player freezecontrols( 1 );
    var_19 = maps\_utility::spawn_anim_model( "worldbody" );
    var_19.origin = level.player getorigin();
    var_19.angles = var_13;

    if ( level.player _meth_85D1() )
        var_19 hide();

    level.player playerlinktoabsolute( var_19, "tag_player" );
    var_20 = spawn( "script_model", level.player.origin );
    var_20.angles = ( 0, var_13[1], var_13[2] );
    var_20 setmodel( "tag_origin" );
    var_19 linkto( var_20, "tag_origin" );
    var_21 = maps\_utility::spawn_anim_model( "worldbody" );
    var_21 hide();
    var_17 maps\_anim::anim_first_frame_solo( var_21, var_16 );
    waitframe();
    var_22 = var_21 gettagorigin( "tag_player" );
    var_21 delete();
    earthquake( 0.3, 3, level.player.origin, 5000 );
    level.player _meth_80B5( "damage_heavy" );
    level.player common_scripts\utility::delaycall( 2, ::_meth_80B6, "damage_heavy" );
    var_23 = getaiarray( "axis" );

    foreach ( var_2 in var_23 )
    {
        if ( distance( level.player.origin, var_2.origin ) < 350 )
            var_2 common_scripts\utility::delaycall( 0.5, ::kill );
    }

    var_26 = getaiarray( "allies" );

    foreach ( var_2 in var_26 )
    {
        var_28 = randomfloatrange( 2.5, 3.5 );
        var_2 thread maps\_utility::flashbangstart( var_28 );
    }

    maps\_utility::delaythread( 1.5, common_scripts\_exploder::exploder, "hall_attack" );
    level thread maps\_utility::notify_delay( "hall_attack", 1.5 );
    thread maps\gulag_code::_id_AD55();
    common_scripts\utility::noself_delaycall( 0.5, ::clearallcorpses );
    var_30 = getanimlength( var_19 maps\_utility::getanim( var_16 ) );
    var_20 thread maps\_anim::anim_single_solo( var_19, var_16 );
    var_20 moveto( var_22, 1 );
    wait(var_30);
    level notify( "stop_hallway_attack" );
    level.player unlink();
    level.player freezecontrols( 0 );
    var_19 delete();
    level.player enableweapons();
    level.player enabledeathshield( 0 );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "actionSlotsHide", 0 );
    setsaveddvar( "hud_showStance", 1 );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "nvg_disable_night_vision" );
    maps\_utility::add_func( maps\_utility::display_hint, "disable_nvg" );
    thread maps\_utility::do_wait();
    maps\_utility::vision_set_changes( "gulag_hallways", 4 );
    wait 5;
    thread maps\gulag_code::_id_D07F();
    common_scripts\utility::flag_wait( "nvg_disable_night_vision" );
}

start_tunnel()
{
    soundscripts\_snd::snd_message( "start_tunnel_checkpoint" );
    _func_31B( 1 );
    _func_31C( 2 );
    _func_31B( 5 );
    _func_31B( 6 );
    var_0 = getentarray( "friendly_tunnel_spawner", "targetname" );
    var_0 = maps\gulag_code::_id_BEA5( var_0 );

    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        var_0[var_1] maps\_utility::add_spawn_function( maps\_utility::replace_on_death );

    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_2 = common_scripts\utility::getstruct( "start_tunnel_player", "targetname" );
    level.player setorigin( var_2.origin );
    level.player setplayerangles( var_2.angles );
}

_id_D57A()
{
    common_scripts\utility::flag_set( "gulag_enable_interior_fx_vol" );
    common_scripts\utility::flag_clear( "gulag_enable_exterior_fx_vol" );
    enablepg( "hide_interior_portal_group", 1 );
    maps\_utility::activate_trigger_with_targetname( "pipe_tunnel_fight_nodes" );
    thread maps\gulag_code::_id_AD31();
    common_scripts\utility::flag_wait( "go_to_pipearea_postup" );
    thread maps\gulag_code::_id_D379();
    wait 0.5;
    var_0 = getent( "tunnel_pre_hallway_volume", "targetname" );
    var_0 maps\_utility::add_wait( maps\_utility::waittill_volume_dead_or_dying );
    maps\_utility::add_wait( maps\_utility::_wait, 15 );
    level maps\_utility::add_wait( maps\_utility::waittill_msg, "flashed_room" );
    maps\_utility::do_wait_any();
    var_1 = getaiarray( "allies" );
    maps\_utility::_id_D29A( var_1, 1 );
    level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_gogogo1" );
    wait 0.15;
    level._id_D13B maps\_utility::set_force_color( "cyan" );
    maps\_utility::activate_trigger_with_targetname( "pipe_tunnel_postup" );
    var_2 = getaiarray( "allies" );

    foreach ( var_4 in var_2 )
        var_4 thread maps\gulag_code::_id_BC48();

    maps\_utility::battlechatter_on( "axis" );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_wait( "advance_through_pipearea" );
    var_1 = maps\_utility::remove_dead_from_array( var_1 );
    maps\_utility::_id_D29A( var_1, 0 );
    enableforcednosunshadows();
    level notify( "stop_music" );
    common_scripts\utility::flag_wait( "friendlies_follow_pipe_area" );
    level._id_D13B maps\_utility::set_force_color( "green" );
    level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_gogogo1" );
    maps\_utility::activate_trigger_with_targetname( "breach_bathroom_postup" );
    common_scripts\utility::flag_wait( "nearing_bathroom_breach" );
    var_2 = getaiarray( "allies" );

    foreach ( var_4 in var_2 )
        var_4.fixednode = 1;

    thread maps\_utility::radio_dialogue( "gulag_gst_30ftonleft" );
    thread maps\gulag_aud::pipe_room_breach_dialog_flag();
}

_id_BB68()
{
    soundscripts\_snd::snd_message( "start_bathroom_checkpoint" );
    maps\gulag_lighting::_id_B3E6( "gulag_showers" );
    _func_31B( 1 );
    _func_31C( 2 );
    _func_31B( 5 );
    _func_31B( 6 );
    var_0 = getentarray( "friendly_bathroom_spawner", "targetname" );
    var_0 = maps\gulag_code::_id_BEA5( var_0 );

    if ( level.start_point == "bathroom" )
    {
        for ( var_1 = 1; var_1 < var_0.size; var_1++ )
            var_0[var_1] maps\_utility::add_spawn_function( maps\_utility::replace_on_death );
    }

    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_2 = getent( "start_bathroom_player", "targetname" );
    level.player setorigin( var_2.origin );
    level.player setplayerangles( var_2.angles );
    maps\_utility::activate_trigger_with_targetname( "breach_bathroom_postup" );
}

_id_B3C2()
{
    var_0 = getent( "player_rappels_from_bathroom", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "player_exited_bathroom" );
    maps\gulag_code::_id_BEE3();
    maps\gulag_lighting::_id_B14F( "bathroom_out" );
}

_id_C5E4()
{
    common_scripts\utility::flag_set( "gulag_enable_interior_fx_vol" );
    common_scripts\utility::flag_clear( "gulag_enable_exterior_fx_vol" );
    enablepg( "hide_interior_portal_group", 1 );
    common_scripts\utility::flag_wait( "leaving_pipe_area" );
    var_0 = getentarray( "flickering_model_off", "script_noteworthy" );
    var_1 = getentarray( "flickering_model_on", "script_noteworthy" );
    var_2 = undefined;
    var_3 = undefined;
    var_4 = common_scripts\utility::array_combine( var_0, var_1 );

    foreach ( var_6 in var_4 )
    {
        if ( isdefined( var_6.script_parameters ) )
        {
            if ( var_6.script_parameters == "bathroom_exploding_light_off" )
            {
                var_2 = var_6;
                continue;
            }

            if ( var_6.script_parameters == "delay_flickering" )
                var_3 = var_6;
        }
    }

    var_3 thread maps\gulag_code::_id_C779( var_2 );
    maps\_utility::add_global_spawn_function( "axis", maps\gulag_code::_id_C378 );
    maps\_utility::add_global_spawn_function( "axis", maps\gulag_code::_id_AFF9 );
    level notify( "activate_shower_breach" );
    level waittill( "breaching" );
    maps\_utility::delaythread( 0.05, maps\_utility::remove_global_spawn_function, "axis", maps\gulag_code::_id_AFF9 );
    var_8 = getaiarray( "allies" );

    foreach ( var_10 in var_8 )
    {
        var_10._id_C8A7 = var_10._id_909A;
        var_10._id_AA29 = var_10.coversearchinterval;
        var_10._id_909A = 2000;
        var_10.coversearchinterval = 6000;
    }

    thread maps\gulag_aud::_id_CC62();
    var_12 = getaiarray( "axis" );

    foreach ( var_14 in var_12 )
    {
        if ( !isdefined( var_14.spawn_time ) || var_14.spawn_time != gettime() )
            var_14 thread maps\gulag_code::_id_C260();
    }

    var_16 = getent( "gulag_shower_destructibles", "script_noteworthy" );
    var_16 maps\_utility::activate_destructibles_in_volume();
    var_16 maps\_utility::activate_interactives_in_volume();
    level.player.attackeraccuracy = 0;
    level.player maps\_utility::delaythread( 6, maps\_gameskill::update_player_attacker_accuracy );
    common_scripts\utility::flag_clear( "gulag_enable_interior_fx_vol" );
    common_scripts\utility::flag_set( "gulag_enable_shower_fx_vol" );
    maps\_utility::delaythread( 3, maps\gulag_code::_id_C868, "shower_hanging_lamp", "shower_hanging_light", 1 );
    common_scripts\utility::flag_wait( "player_enters_bathroom" );
    maps\_art::sunflare_changes( "shower", 0 );
    maps\gulag_lighting::_id_B14F( "bathroom_in" );
    maps\_utility::activate_trigger_with_noteworthy( "first_friendly_bathroom_trigger" );
    thread maps\gulag_code::_id_D005();
    thread _id_B3C2();
    level._id_D13B maps\_utility::delaythread( 3.5, maps\_utility::dialogue_queue, "gulag_cmt_spreadout" );
    maps\_utility::activate_trigger_with_targetname( "bathroom_initial_enemies" );
    maps\_utility::delaythread( 5, maps\gulag_code::_id_CBC5 );
    var_17 = 15;
    maps\_utility::delaythread( var_17, maps\_utility::activate_trigger_with_targetname, "bathroom_balcony_room1_trigger" );
    thread maps\_utility::flag_set_delayed( "shower_balcony_spawned", var_17 + 4 );
    level._id_D13B maps\_utility::delaythread( var_17 + 3, maps\_utility::dialogue_queue, "gulag_cmt_hostiles2ndfloor" );
    common_scripts\utility::flag_wait( "bathroom_start_second_wave" );
    maps\gulag_code::_id_CE1F();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "use_lockers_for_cover" );
    level._id_D13B maps\_utility::add_func( maps\_utility::dialogue_queue, "gulag_cmt_uselockers" );
    thread maps\_utility::do_wait();
    var_18 = getent( "riot_shield_detector", "targetname" );
    var_18 thread maps\gulag_code::_id_C095();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "bathroom_room2_enemies_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "leaving_bathroom_vol2" );
    maps\_utility::do_wait_any();
    thread maps\gulag_code::_id_CC21();
    maps\_utility::autosave_by_name( "bathroom_cleared" );
    common_scripts\utility::flag_wait( "leaving_bathroom_vol2" );
    thread maps\gulag_code::_id_C85B( "moving_chain_hook_sewers" );
    level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_holeinfloor" );
    level._id_C591 = getdvarfloat( "ai_pathNegotiationOverlapCost" );
    setsaveddvar( "ai_pathNegotiationOverlapCost", 5000 );
    var_19 = getaiarray( "allies" );
    var_19 = common_scripts\utility::array_remove( var_19, level._id_D13B );

    if ( var_19.size > 1 )
    {
        for ( var_20 = 1; var_20 < var_19.size; var_20++ )
            var_19[var_20] maps\_utility::disable_ai_color();
    }

    maps\_utility::activate_trigger_with_targetname( "cistern_friendly_trigger" );
    level._id_D13B maps\_utility::delaythread( 2.5, maps\_utility::dialogue_queue, "gulag_cmt_gogogo1" );
    var_21 = getaiarray( "allies" );

    foreach ( var_14 in var_21 )
        var_14.attackeraccuracy = 0;

    thread maps\gulag_code::_id_BDDE();
    common_scripts\utility::flag_wait( "player_exited_bathroom" );
    maps\_utility::add_global_spawn_function( "allies", maps\_utility::waterfx, "rescue_begins" );
    var_21 = getaiarray( "allies" );

    foreach ( var_10 in var_21 )
    {
        if ( isdefined( var_10._id_C8A7 ) )
            var_10._id_909A = var_10._id_C8A7;

        if ( isdefined( var_10._id_AA29 ) )
            var_10.coversearchinterval = var_10._id_AA29;
    }

    common_scripts\utility::array_thread( var_21, maps\_utility::waterfx, "rescue_begins" );
    level.player thread maps\_utility::waterfx( "rescue_begins" );
    maps\_utility::remove_global_spawn_function( "axis", maps\gulag_code::_id_C378 );
    common_scripts\utility::run_thread_on_targetname( "slide_trigger", maps\gulag_code::_id_B610 );
    var_21 = getaiarray( "bad_guys" );
    common_scripts\utility::array_thread( var_21, maps\gulag_code::_id_C260 );
    maps\_utility::autosave_by_name( "reached_sewers" );
    thread _id_B63F();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "friendly_rappels_from_bathroom" );
    level._id_D13B maps\_utility::add_func( maps\_utility::set_force_color, "red" );
    maps\_utility::add_func( maps\_utility::activate_trigger_with_targetname, "breach_rescue_trigger" );
    thread maps\_utility::do_wait();
}

_id_BF90()
{
    physicsexplosionsphere( level.player.origin, 700, 300, 1 );
}

_id_B63F()
{
    if ( common_scripts\utility::flag( "player_approaches_rescue_breach" ) )
        return;

    level endon( "player_approaches_rescue_breach" );
    common_scripts\utility::flag_wait( "friendly_rappels_from_bathroom" );
    wait 1.5;
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_whichway" );
    maps\_utility::radio_dialogue( "gulag_gst_50meters" );
    wait 3;
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_startfiring" );
    maps\_utility::radio_dialogue( "gulag_gst_cistern" );
}

_id_CA0F()
{
    soundscripts\_snd::snd_message( "start_rescue_checkpoint" );
    maps\gulag_lighting::_id_B3E6( "gulag_sewers_slide" );
    _func_31B( 1 );
    _func_31C( 2 );
    _func_31B( 5 );
    _func_31B( 6 );
    var_0 = getentarray( "start_rescue_spawner", "targetname" );
    var_0 = maps\gulag_code::_id_BEA5( var_0 );

    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        var_0[var_1] maps\_utility::add_spawn_function( maps\_utility::magic_bullet_shield );

    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_2 = getent( "start_rescue_player", "targetname" );
    level.player setorigin( var_2.origin );
    level.player setplayerangles( var_2.angles );
    maps\_utility::activate_trigger_with_targetname( "breach_rescue_trigger" );
    common_scripts\utility::flag_set( "player_near_tv" );
}

_id_BD04()
{
    common_scripts\utility::flag_set( "gulag_enable_shower_fx_vol" );
    common_scripts\utility::flag_clear( "gulag_enable_exterior_fx_vol" );
    enablepg( "hide_interior_portal_group", 1 );
    level._effect["breach_door"] = level._effect["breach_price"];
    common_scripts\utility::flag_wait( "player_approaches_rescue_breach" );

    if ( isdefined( level._id_C591 ) )
    {
        setsaveddvar( "ai_pathNegotiationOverlapCost", level._id_C591 );
        level._id_C591 = undefined;
    }

    level.slowmo_breach_disable_stancemod = 1;
    level._id_BD96 = 1;
    maps\_utility::remove_global_spawn_function( "allies", maps\_utility::enable_cqbwalk );
    maps\_utility::remove_global_spawn_function( "allies", maps\_utility::waterfx );
    var_0 = getaiarray( "bad_guys" );
    common_scripts\utility::array_thread( var_0, maps\gulag_code::_id_C260 );
    common_scripts\utility::flag_set( "rescue_begins" );
    level.player.dont_unlink_after_breach = 1;
    level.forced_slowmo_breach_slowdown = 1;
    maps\_utility::autosave_by_name( "end_breach" );
    thread maps\_utility::radio_dialogue( "gulag_gst_8tangos" );
    var_1 = level.breach_groups[3].trigger;
    var_2 = level.breach_groups[4].trigger;
    level.skip_breach = [];
    level.skip_breach[3] = 1;
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3.origin = level.breach_groups[3]._id_567E.origin;
    var_3.angles = level.breach_groups[3]._id_567E.angles;
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_5 = var_1.origin;
    var_6 = var_1.angles;
    var_0 = getaiarray( "allies" );

    for (;;)
    {
        var_1 waittill( "trigger" );

        if ( !level.player maps\_slowmo_breach::breach_failed_to_start() )
            break;
    }

    setsaveddvar( "g_friendlynamedist", 0 );
    setsaveddvar( "actionSlotsHide", 1 );
    level.dopickyautosavechecks = 0;
    var_7 = getentarray( "ending_room_spawner", "targetname" );
    waittillframeend;
    level.player dontinterpolate();
    var_4.origin = level.player.origin;
    var_4.angles = level.player.angles;
    var_4 linkto( var_3 );
    level.player playerlinkto( var_4, "tag_origin", 1, 0, 0, 90, 90, 0 );
    var_3.origin = level.breach_groups[4]._id_567E.origin;
    var_3.angles = level.breach_groups[4]._id_567E.angles;
    thread _id_CBD6( var_2, var_0 );

    if ( level.start_point == "ending" )
        wait 0.05;

    disableforcedsunshadows();
    setsaveddvar( "ai_friendlysuppression", 0 );
    setsaveddvar( "ai_friendlyfireblockduration", 0 );
    maps\_utility::delaythread( 0.05, common_scripts\_exploder::exploder, "rock_glass" );
    var_8 = getent( "trash_sound", "script_noteworthy" );
    var_8 thread maps\gulag_ending_code::_id_BF5F();
    thread maps\_utility::set_ambient( "gulag_exit" );
    level waittill( "breaching" );
    maps\_utility::delaythread( 2.5, maps\gulag_code::_id_C85B, "moving_chain_hook_pricescell" );
    maps\_utility::delaythread( 2.5, maps\gulag_code::_id_C868, "escape_hanging_lamp", "escape_hanging_light", 1 );
    maps\gulag_code::_id_C48B( "emergency_rotating light_orange", "emergency_light_gulag" );
    thread maps\gulag_aud::_id_B6B8();
    level.player setstance( "stand" );
    level.player enableinvulnerability();
    level.player disableweaponswitch();
    level.player disableoffhandweapons();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player _meth_830F( 0 );
    level.player allowjump( 0 );
    level.player.attackeraccuracy = 0;
    level.player.ignorerandombulletdamage = 1;
    level.player maps\_utility::delaythread( 15, maps\_gameskill::update_player_attacker_accuracy );
    var_9 = getent( "price_spawner", "targetname" );
    var_9 maps\_utility::spawn_ai();
    var_9 = getent( "price_choke_spawner", "targetname" );
    var_10 = var_9 maps\_utility::spawn_ai();
    var_10.animname = "chokey";
    var_10 maps\_utility::gun_remove();
    var_10.health = 5000;
    var_10.cheat._id_BDF2 = 1;
    var_10 maps\_utility::add_damage_function( maps\gulag_code::_id_B5BE );
    var_11 = common_scripts\utility::getstruct( "ending_breach_org", "targetname" );
    level._id_CB3B = var_11;
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3.origin = var_11.origin;
    var_3.angles = var_11.angles;
    var_12 = common_scripts\utility::getstruct( "anim_node", "targetname" );
    var_13 = level.player.prebreachcurrentweapon;
    var_14 = spawnstruct();
    var_14.entity = var_3;
    var_14.forward = -38;
    var_14.right = -24;
    var_14 maps\_utility::translate_local();
    var_15 = maps\_utility::spawn_anim_model( "player_rig" );
    var_15 hide();
    var_16 = maps\_utility::spawn_anim_model( "strangle_chain" );
    level._id_B5D9 = var_16;
    var_17 = [];
    var_17[var_17.size] = level.price;
    var_17[var_17.size] = var_10;
    var_17[var_17.size] = var_15;
    var_17[var_17.size] = var_16;

    foreach ( var_19 in var_17 )
        var_19 linkto( var_3 );

    level.price_breach_ent = var_3;
    var_21 = level.price maps\_utility::getanim( "price_breach" );
    var_22 = getanimlength( var_21 );
    var_23 = getnotetracktimes( var_21, "punch" );
    var_24 = 3.45;
    maps\_utility::delaythread( var_22 * var_23[0] - 2.8 + var_24, maps\gulag_ending_code::_id_B331, var_15 );
    var_12 maps\_anim::anim_first_frame( var_17, "price_breach" );
    wait(var_24);
    thread maps\gulag_code::_id_D0D7();
    soundtime( "weapons_plr", 0 );
    level.price thread maps\_utility::play_sound_on_entity( "scn_gulag_price_rescue_chain" );
    maps\_utility::delaythread( 3.45, common_scripts\utility::play_sound_in_space, "scn_gulag_price_rescue_punch", level.player geteye() );
    maps\_utility::delaythread( 4.35, common_scripts\utility::play_sound_in_space, "scn_gulag_price_rescue_bodyfall", level.player geteye() );
    var_25 = getent( "price_chair", "targetname" );
    thread maps\gulag_code::_id_BCA2( var_25, var_12 );
    var_12 maps\_anim::anim_single( var_17, "price_breach" );
    level.player setmovespeedscale( 1 );
    var_26 = getaiarray( "axis" );

    foreach ( var_19 in var_26 )
    {
        if ( var_19 != var_10 )
            var_19 delete();
    }

    var_9 = getent( "endlog_soap_spawner", "targetname" );
    var_9.count = 1;
    var_9 maps\_utility::spawn_ai();
    var_9 = getentarray( "endlog_redshirt_spawner", "targetname" )[0];
    var_9.count = 1;
    var_9 maps\_utility::spawn_ai();
    var_29 = maps\_utility::spawn_anim_model( "1911" );
    var_17 = [];
    var_17[var_17.size] = level.price;
    var_30 = level.price maps\_utility::getanim( "price_rescue_intro" );
    var_22 = getanimlength( var_30 );
    var_3 maps\_utility::delaythread( var_22, maps\gulag_code::_id_AA55 );
    var_17["player"] = var_15;
    var_17[var_17.size] = level._id_B71B;
    var_17[var_17.size] = level._id_D13B;
    var_17[var_17.size] = var_10;
    var_17[var_17.size] = var_16;
    var_17["gun"] = var_29;
    level.price unlink();
    var_12 thread maps\_anim::anim_single( var_17, "price_rescue" );
    thread _id_C4EB( var_10, var_12 );
    var_30 = level._id_D13B maps\_utility::getanim( "price_rescue" );
    var_22 = getanimlength( var_30 );
    var_31 = 1.5;
    wait(var_22 - var_31);
    var_32 = getent( "pricecell_stagelight", "targetname" );
    var_32 thread maps\_utility::notify_delay( "staging_off", 1 );
    maps\gulag_lighting::_id_B14F( "ending_rappel" );
    level._id_D13B maps\_utility::forceuseweapon( "m4_grunt", "primary" );
    setsaveddvar( "actionSlotsHide", 0 );
    level.price notify( "change_to_regular_weapon" );
    common_scripts\utility::flag_set( "escape_the_gulag" );
    var_29 delete();
    setsaveddvar( "g_friendlynamedist", 196 );
    thread _id_B035( var_31, var_13 );
    wait(var_31);
    var_15 hide();
    thread maps\gulag_code::_id_C868( "cafeteria_hanging_lamp", "cafeteria_hanging_light" );
}

_id_BEC3()
{
    self._id_B5E9 thread maps\_anim::anim_last_frame_solo( self, "price_rescue" );
}

_id_C4EB( var_0, var_1 )
{
    var_2 = var_0 maps\_utility::getanim( "price_rescue" );
    var_3 = getanimlength( var_2 );
    wait(var_3);
    var_4 = var_1;
    var_4.origin += ( 40.0, -45.0, 0.0 );
    var_0.deathfunction = ::_id_BEC3;
    var_0._id_B5E9 = var_4;
    var_0 kill();
}

_id_CBD6( var_0, var_1 )
{
    wait 0.1;
    var_0 notify( "trigger", level.player );
    wait 2.5;
    level notify( "kill_color_replacements" );
    level waittill( "sp_slowmo_breachanim_done" );
    var_2 = getaiarray( "allies" );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 maps\_utility::is_hero() )
            continue;

        if ( isdefined( var_4.magic_bullet_shield ) )
            var_4 maps\_utility::stop_magic_bullet_shield();

        var_4 delete();
    }

    foreach ( var_4 in var_1 )
    {
        if ( !isalive( var_4 ) )
            continue;

        if ( isdefined( var_4.magic_bullet_shield ) )
            var_4 maps\_utility::stop_magic_bullet_shield();

        var_4 delete();
    }
}

_id_B035( var_0, var_1 )
{
    wait(var_0 + 0.5);
    level.player enableweapons();
    var_2 = level.player getweaponslistprimaries();

    foreach ( var_4 in var_2 )
    {
        if ( issubstr( var_4, "riot" ) )
            continue;

        if ( var_1 == var_4 )
        {
            level.player switchtoweapon( var_4 );
            break;
        }
    }

    level.player unlink();
    level.player disableinvulnerability();
    level.player enableweaponswitch();
    level.player enableoffhandweapons();
    level.player _meth_830F( 1 );
    level.player allowjump( 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    setsaveddvar( "ammoCounterHide", 0 );
    var_6 = 1.7;
    var_7 = var_6 / 20;

    for ( var_8 = 0; var_8 <= 1; var_8 += var_7 )
    {
        level.player setmovespeedscale( var_8 );
        wait 0.05;
    }
}

_id_A9C4()
{
    waittillframeend;

    if ( maps\_utility::is_default_start() )
    {
        setsaveddvar( "ui_hidemap", 1 );
        wait 2;
        common_scripts\utility::flag_wait( "display_introscreen_text" );
        wait 11.2;
    }
    else
        waittillframeend;

    objective_add( 1, "current", &"GULAG_FIND_POW", maps\gulag_code::_id_CFDC() );
    objective_onentity( 1, level._id_D13B );
    common_scripts\utility::flag_wait( "stabilize" );
    objective_state( 1, "active" );
    objective_add( 2, "current", &"GULAG_INFILTRATE_THE_GULAG", ( 0.0, 0.0, 0.0 ) );
    _func_1E7( 2, 1 );

    switch ( level.start_point )
    {
        case "default":
        case "f15":
        case "unload":
        case "intro":
        case "approach":
            if ( !maps\_utility::is_default_start() )
                setsaveddvar( "ui_hidemap", 1 );

            common_scripts\utility::flag_wait( "player_lands" );
            setsaveddvar( "ui_hidemap", 0 );
            maps\_utility::objective_complete( 2 );
            objective_add( 3, "current", &"GULAG_FOLLOW_SOAP", ( 0.0, 0.0, 0.0 ) );
            objective_current( 3 );
            objective_onentity( 3, level._id_D13B );
            _func_1E7( 3, 1 );
            common_scripts\utility::flag_wait( "postup_outside_gulag" );
            maps\_utility::objective_complete( 3 );
        case "control_room":
            objective_current( 1 );
            common_scripts\utility::flag_wait( "cell_duty" );
            maps\_utility::remove_global_spawn_function( "allies", maps\gulag_code::no_grenades );
        case "armory":
            objective_add( 4, "current", &"GULAG_CELL_DUTY", maps\gulag_code::_id_BE12() );
            objective_onentity( 4, level._id_D13B );
            objective_current( 4 );
            _func_1E7( 4, 1 );
            common_scripts\utility::flag_wait( "leaving_cellblock" );
            maps\_utility::objective_complete( 4 );
            objective_current( 1 );
            objective_onentity( 1, level._id_D13B );
        case "rappel":
        case "tunnel":
        case "bathroom":
            common_scripts\utility::flag_wait( "advance_through_pipearea" );
            var_0 = common_scripts\utility::getstruct( "hallway_obj_struct", "targetname" );
            objective_position( 1, var_0.origin );
            common_scripts\utility::flag_wait( "nearing_bathroom_breach" );
            setsaveddvar( "compass", "0" );
            maps\_utility::battlechatter_off( "axis" );
            musicstop( 3 );
            wait 4;
            level notify( "stop_objective_updating" );
            objective_add( 5, "current", &"GULAG_BREACH_THE_BATHROOM", maps\gulag_code::_id_C270() );
            objective_current( 5 );
            setsaveddvar( "compass", "1" );
            _func_1E7( 5, 1 );
            maps\_slowmo_breach::objective_breach( 5, 2 );
            maps\gulag_code::_id_D2A3();
            level waittill( "slowmo_breach_ending" );
            maps\_utility::objective_complete( 5 );
            objective_current( 1 );
            objective_onentity( 1, level._id_D13B );
            common_scripts\utility::flag_wait( "leaving_bathroom_vol2" );
            wait 2;
        case "rescue":
            objective_onentity( 1, level._id_D13B );
            common_scripts\utility::flag_wait( "player_approaches_rescue_breach" );
            objective_state_nomessage( 1, "active" );
            objective_state( 5, "current" );
            maps\_slowmo_breach::objective_breach( 5, 3 );
            level waittill( "breaching" );
            common_scripts\utility::flag_wait( "price_rescued" );
            common_scripts\utility::flag_wait( "escape_the_gulag" );
            setsaveddvar( "compass", 1 );
            level._id_BD96 = 0;
            maps\_utility::objective_complete( 1 );
            objective_state_nomessage( 5, "done" );
        case "run":
        case "cafe":
        case "evac":
        case "ending":
            objective_add( 6, "current", &"GULAG_ESCAPE", ( 0.0, 0.0, 0.0 ) );
            objective_onentity( 6, level._id_D13B );
            objective_current( 6 );
            thread _id_C3AF();
            common_scripts\utility::flag_wait( "exit_collapses" );
            wait 0.25;
            setsaveddvar( "compass", 0 );
            objective_position( 6, ( 0.0, 0.0, 0.0 ) );
            break;
        default:
    }
}

_id_B544()
{
    waittillframeend;
    var_0 = level.start_point;

    if ( maps\_utility::is_default_start() )
        return;

    thread maps\gulag_code::_id_B9BA();

    if ( var_0 == "intro" )
        return;

    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "hud_drawhud", 1 );

    if ( var_0 == "approach" )
        return;

    common_scripts\utility::flag_set( "player_heli_uses_modified_yaw" );
    maps\gulag_code::_id_D5A3();
    wait 0.05;
    var_1 = getent( "car_blows_up", "script_noteworthy" );
    radiusdamage( var_1.origin, 800, 5000, 5000 );
    common_scripts\utility::flag_set( "approach_dialogue" );
    common_scripts\utility::flag_set( "slamraam_gets_players_attention" );
    common_scripts\utility::flag_set( "stab2_clear" );

    if ( var_0 == "unload" )
        return;

    if ( var_0 == "f15" )
        return;

    thread maps\gulag_code::_id_C745();
    setsaveddvar( "g_friendlyNameDist", 15000 );
    setsaveddvar( "compass", "1" );
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "hud_drawhud", 1 );
    common_scripts\utility::flag_set( "stop_rotating_around_gulag" );
    common_scripts\utility::flag_set( "player_heli_uses_modified_yaw" );
    common_scripts\utility::flag_set( "player_lands" );
    wait 0.05;

    if ( var_0 == "bhd" )
        return;

    common_scripts\utility::flag_set( "access_control_room" );
    common_scripts\utility::flag_set( "player_progresses_passed_ext_area" );

    if ( var_0 == "control_room" )
        return;

    maps\_utility::remove_global_spawn_function( "allies", maps\gulag_code::no_grenades );
    maps\_compass::setupminimap( "compass_map_gulag_2" );
    maps\_utility::add_global_spawn_function( "axis", maps\gulag_code::_id_AA2E );
    maps\_utility::add_global_spawn_function( "allies", maps\_utility::enable_cqbwalk );
    common_scripts\utility::flag_set( "gulag_cell_doors_enabled" );
    common_scripts\utility::flag_set( "enable_interior_fx" );
    common_scripts\utility::flag_set( "disable_exterior_fx" );
    common_scripts\utility::flag_set( "pre_armory_open" );
    common_scripts\utility::flag_set( "spotlight_turns_on" );
    common_scripts\utility::flag_set( "start_armory_music" );

    if ( var_0 == "armory" )
        return;

    thread maps\gulag_code::_id_B1E9();
    common_scripts\utility::flag_set( "access_control_room" );
    common_scripts\utility::flag_set( "run_from_armory" );

    if ( var_0 == "rappel" )
        return;

    common_scripts\utility::flag_set( "cell_duty" );
    common_scripts\utility::flag_set( "go_to_pipearea_postup" );

    if ( var_0 == "tunnel" )
        return;

    common_scripts\utility::flag_set( "nearing_bathroom_breach" );
    common_scripts\utility::flag_set( "leaving_pipe_area" );
    common_scripts\utility::flag_set( "advance_through_pipearea" );
    common_scripts\utility::flag_set( "access_control_room" );
    common_scripts\utility::flag_set( "control_room" );
    common_scripts\utility::flag_set( "leaving_pipe_area" );

    if ( var_0 == "bathroom" )
        return;

    if ( var_0 == "so_showers" )
        return;

    common_scripts\utility::flag_set( "player_enters_bathroom" );
    maps\gulag_ending::_id_B045();
}

_id_CF67()
{
    waittillframeend;

    switch ( level.start_point )
    {
        case "default":
        case "intro":
            var_0 = maps\_utility::musiclength( "mus_gulag_intro" );
            maps\_utility::musicplaywrapper( "mus_gulag_intro", 0 );
            wait(var_0);
        case "f15":
        case "unload":
        case "approach":
        case "control_room":
            var_0 = maps\_utility::musiclength( "mus_gulag_intro_repeatable" );
            maps\_utility::music_loop( "mus_gulag_intro_repeatable", var_0 );
            common_scripts\utility::flag_wait( "start_armory_music" );
            level notify( "stop_music" );
            musicstop( 3 );
            wait 3;
        case "armory":
        case "rappel":
        case "tunnel":
            var_0 = maps\_utility::musiclength( "mus_gulag_armory" );
            maps\_utility::music_loop( "mus_gulag_armory", var_0 + 5 );
            common_scripts\utility::flag_wait( "nearing_bathroom_breach" );
            level notify( "stop_music" );
            musicstop( 5 );
        case "bathroom":
            level waittill( "breaching" );
            wait 0.15;
            var_0 = maps\_utility::musiclength( "mus_gulag_showers" );
            maps\_utility::music_loop( "mus_gulag_showers", var_0 );
            common_scripts\utility::flag_wait( "player_exited_bathroom" );
            level notify( "stop_music" );
            musicstop( 3.1 );
            wait 3.15;
            var_0 = maps\_utility::musiclength( "mus_gulag_sewer_loop" );
            maps\_utility::music_loop( "mus_gulag_sewer_loop", var_0 );
        case "rescue":
            common_scripts\utility::flag_wait( "player_approaches_rescue_breach" );
            level notify( "stop_music" );
            musicstop( 5.5 );
            level waittill( "breaching" );
        case "run":
        case "cafe":
        case "ending":
            thread maps\_utility::musicplaywrapper( "mus_gulag_liftoff1of2", 0 );
        case "evac":
            common_scripts\utility::flag_wait( "player_falls_down" );
            musicstop( 1 );
            common_scripts\utility::flag_wait( "evac_begins" );
            thread maps\_utility::musicplaywrapper( "mus_gulag_liftoff2of2", 0 );
            break;
        default:
    }
}

_id_C3AF()
{
    self endon( "exit_collapses" );
    var_0 = getent( "escape_refresh_objective", "targetname" );
    var_0 waittill( "trigger" );
    objective_position( 6, maps\gulag_code::_id_CE25() );
}
#using_animtree("generic_human");

_id_C247()
{
    var_0 = level.vehicle_aianims["script_vehicle_littlebird_bench_allylanding_1"];

    for ( var_1 = 0; var_1 < var_0[2].idle.size; var_1++ )
        var_0[2].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle1_front;

    for ( var_1 = 0; var_1 < var_0[3].idle.size; var_1++ )
        var_0[3].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle1_middle;

    for ( var_1 = 0; var_1 < var_0[4].idle.size; var_1++ )
        var_0[4].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle1_back;

    for ( var_1 = 0; var_1 < var_0[5].idle.size; var_1++ )
        var_0[5].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle1_front;

    for ( var_1 = 0; var_1 < var_0[6].idle.size; var_1++ )
        var_0[6].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle1_middle;

    for ( var_1 = 0; var_1 < var_0[7].idle.size; var_1++ )
        var_0[7].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle1_back;

    var_0[2].idle_alert = %h2_gulag_intro_soldiersinheli_front;
    var_0[3].idle_alert = %h2_gulag_intro_soldiersinheli_middle;
    var_0[4].idle_alert = %h2_gulag_intro_soldiersinheli_back;
    var_0[5].idle_alert = %h2_gulag_intro_soldiersinheli_front;
    var_0[6].idle_alert = %h2_gulag_intro_soldiersinheli_middle;
    var_0[7].idle_alert = %h2_gulag_intro_soldiersinheli_back;
    var_0[2].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding1_front;
    var_0[3].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding1_middle;
    var_0[4].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding1_back;
    var_0[5].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding1_front;
    var_0[6].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding1_middle;
    var_0[7].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding1_back;
    var_0[2].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding1_front;
    var_0[3].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding1_middle;
    var_0[4].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding1_back;
    var_0[5].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding1_front;
    var_0[6].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding1_middle;
    var_0[7].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding1_back;
    var_0[2].getout = %h2_gulag_landing_soldiersinheli_dismount1_front;
    var_0[3].getout = %h2_gulag_landing_soldiersinheli_dismount1_middle;
    var_0[4].getout = %h2_gulag_landing_soldiersinheli_dismount1_back;
    var_0[5].getout = %h2_gulag_landing_soldiersinheli_dismount1_front;
    var_0[6].getout = %h2_gulag_landing_soldiersinheli_dismount1_middle;
    var_0[7].getout = %h2_gulag_landing_soldiersinheli_dismount1_back;
    var_2 = level.vehicle_aianims["script_vehicle_littlebird_bench_allylanding_2"];

    for ( var_1 = 0; var_1 < var_2[2].idle.size; var_1++ )
        var_2[2].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle2_front;

    for ( var_1 = 0; var_1 < var_2[3].idle.size; var_1++ )
        var_2[3].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle2_middle;

    for ( var_1 = 0; var_1 < var_2[4].idle.size; var_1++ )
        var_2[4].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle2_back;

    for ( var_1 = 0; var_1 < var_2[5].idle.size; var_1++ )
        var_2[5].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle2_front;

    for ( var_1 = 0; var_1 < var_2[6].idle.size; var_1++ )
        var_2[6].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle2_middle;

    for ( var_1 = 0; var_1 < var_2[7].idle.size; var_1++ )
        var_2[7].idle[var_1] = %h2_gulag_landing_soldiersinheli_alertidle2_back;

    var_2[2].idle_alert = %h2_gulag_intro_soldiersinheli_front;
    var_2[3].idle_alert = %h2_gulag_intro_soldiersinheli_middle;
    var_2[4].idle_alert = %h2_gulag_intro_soldiersinheli_back;
    var_2[5].idle_alert = %h2_gulag_intro_soldiersinheli_front;
    var_2[6].idle_alert = %h2_gulag_intro_soldiersinheli_middle;
    var_2[7].idle_alert = %h2_gulag_intro_soldiersinheli_back;
    var_2[2].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding2_front;
    var_2[3].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding2_middle;
    var_2[4].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding2_back;
    var_2[5].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding2_front;
    var_2[6].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding2_middle;
    var_2[7].pre_unload = %h2_gulag_landing_soldiersinheli_prelanding2_back;
    var_2[2].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding2_front;
    var_2[3].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding2_middle;
    var_2[4].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding2_back;
    var_2[5].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding2_front;
    var_2[6].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding2_middle;
    var_2[7].pre_unload_idle = %h2_gulag_landing_soldiersinheli_prelanding2_back;
    var_2[2].getout = %h2_gulag_landing_soldiersinheli_dismount2_front;
    var_2[3].getout = %h2_gulag_landing_soldiersinheli_dismount2_middle;
    var_2[4].getout = %h2_gulag_landing_soldiersinheli_dismount2_back;
    var_2[5].getout = %h2_gulag_landing_soldiersinheli_dismount2_front;
    var_2[6].getout = %h2_gulag_landing_soldiersinheli_dismount2_middle;
    var_2[7].getout = %h2_gulag_landing_soldiersinheli_dismount2_back;
    var_3 = level.vehicle_aianims["script_vehicle_littlebird_player"];
    var_3[6].idle = undefined;
    var_3[6].idle_alert = undefined;
    var_3[6].pre_unload = undefined;
    var_3[6].pre_unload_idle = undefined;
    var_3[6].getout = undefined;
    var_3[6].bnoanimunload = 1;
}

_id_B54B( var_0 )
{
    self endon( "death" );
    self setanim( var_0 );
}

charge_in_gulag()
{
    var_0 = getent( "entering_gulag_volume", "targetname" );
    var_1 = [];
    var_2 = 5;

    while ( var_1.size < var_2 )
    {
        if ( _func_2A5( var_0 ) )
            break;

        var_3 = getaiarray( "allies" );
        var_3 = maps\_utility::remove_dead_from_array( var_3 );

        if ( var_3.size < var_2 )
            break;

        foreach ( var_5 in var_3 )
        {
            if ( var_5 istouching( var_0 ) && !maps\_utility::is_in_array( var_1, var_5 ) )
                var_1[var_1.size] = var_5;
        }

        waitframe();
    }
}

disable_turn_in_gulag_stair()
{
    level endon( "cell_door1" );
    var_0 = getent( "no_turn_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 maps\_utility::disable_turnanims();
    }
}

enable_turn_in_gulag_stair()
{
    level endon( "cell_door1" );
    var_0 = getent( "enable_turn_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 maps\_utility::enable_turnanims();
    }
}

_id_AD60()
{
    level common_scripts\utility::waittill_any( "createfx_common_done", "start_is_set" );
    common_scripts\utility::flag_init( "enable_endlog_fx" );
    common_scripts\utility::flag_init( "player_lands" );
    common_scripts\utility::flag_init( "gulag_enable_transition_fx_vol" );
    common_scripts\utility::flag_init( "gulag_enable_exterior_fx_vol" );
    common_scripts\utility::flag_init( "gulag_enable_interior_fx_vol" );
    common_scripts\utility::flag_init( "gulag_enable_tunnel_fx_vol" );
    common_scripts\utility::flag_init( "gulag_enable_cellblock_fx_vol" );
    common_scripts\utility::flag_init( "gulag_enable_ending_fx_vol" );
    common_scripts\utility::flag_init( "gulag_enable_shower_fx_vol" );
    common_scripts\utility::flag_set( "gulag_enable_exterior_fx_vol" );
    var_0 = "interior_fx_vol";
    maps\_utility::_id_D193( var_0, "gulag_enable_interior_fx_vol" );
    maps\_utility::_id_CD67( var_0, getentarray( "gulag_interior_fx_vol_group", "targetname" ) );
    var_0 = "transition_fx_vol";
    maps\_utility::_id_D193( var_0, "gulag_enable_transition_fx_vol" );
    maps\_utility::_id_CD67( var_0, getentarray( "gulag_transition_fx_vol_group", "targetname" ) );
    var_0 = "exterior_fx_vol";
    maps\_utility::_id_D193( var_0, "gulag_enable_exterior_fx_vol" );
    maps\_utility::_id_CD67( var_0, getentarray( "gulag_exterior_fx_vol_group", "targetname" ) );
    var_0 = "endlog_fx_vol";
    maps\_utility::_id_D193( var_0, "enable_endlog_fx" );
    maps\_utility::_id_CD67( var_0, getent( "gulag_endlog_destructibles", "script_noteworthy" ) );
    var_0 = "shower_fx_vol";
    maps\_utility::_id_D193( var_0, "gulag_enable_shower_fx_vol" );
    maps\_utility::_id_CD67( var_0, getentarray( "gulag_shower_fx_vol_group", "targetname" ) );
    var_0 = "cellblock_fx_vol";
    maps\_utility::_id_D193( var_0, "gulag_enable_cellblock_fx_vol" );
    maps\_utility::_id_CD67( var_0, getentarray( "gulag_cellblock_fx_vol_group", "targetname" ) );
    var_0 = "tunnel_fx_vol";
    maps\_utility::_id_D193( var_0, "gulag_enable_tunnel_fx_vol" );
    maps\_utility::_id_CD67( var_0, getentarray( "gulag_tunnel_fx_vol_group", "targetname" ) );
    var_0 = "ending_fx_vol";
    maps\_utility::_id_D193( var_0, "gulag_enable_ending_fx_vol" );
    maps\_utility::_id_CD67( var_0, getentarray( "gulag_ending_fx_vol_group", "targetname" ) );
    maps\_utility::_id_B32F( undefined, "player_lands" );
    level notify( "fxvolume_grp_setup_done" );
}
