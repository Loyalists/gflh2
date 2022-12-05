// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" )
    {
        maps\favela_beautiful_corner::main();
        return;
    }

    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\favela_mission_select_cam::_id_C490();
        return;
    }

    common_scripts\utility::array_call( getentarray( "ammo_crate_part", "targetname" ), ::delete );
    common_scripts\utility::array_call( getentarray( "ammo_crate_clip", "targetname" ), ::delete );
    common_scripts\utility::array_call( getentarray( "ammo_cache", "targetname" ), ::delete );
    setdynamicdvar( "favela_trailer", "0" );
    setsaveddvar( "fx_cast_shadow", 0 );
    setsaveddvar( "r_lightGridEnableTweaks", 1 );
    setsaveddvar( "r_lightGridIntensity", 1.5 );
    setsaveddvar( "r_lightGridContrast", 0 );
    maps\_utility::default_start( ::_id_C7F9 );
    maps\_utility::add_start( "street", ::_id_C7F9 );
    maps\_utility::add_start( "chase", ::_id_CCA5 );
    maps\_utility::add_start( "favela", ::_id_C29F );
    maps\_utility::add_start( "torture", ::_id_B3C4 );
    maps\_utility::add_start( "soccer", ::_id_AAB8 );
    maps\_utility::add_start( "hilltop", ::_id_C110 );
    maps\_utility::add_start( "trailer1", ::_id_C1B4 );
    maps\_utility::add_start( "trailer2", ::_id_BEF4 );
    maps\_utility::add_start( "trailer3", ::_id_CFEB );
    maps\_utility::add_start( "end", ::_id_C578 );
    _id_B183::main();
    _id_C8A2::main();
    common_scripts\_destructible::_id_BDEC( "vehicle_coupe_gold", "fx/explosions/small_vehicle_explosion", "fx/explosions/small_vehicle_explosion_favela" );
    _id_B61E::main();
    _id_C8D3::main();
    maps\favela_lighting::main();
    maps\_drone_ai::init();
    animscripts\dog\dog_init::initdoganimations();
    _id_CDB1::main();
    maps\_load::set_player_viewhand_model( "h2_gfl_st_ar15_viewhands_player" );
    maps\_load::main();
    _id_B0E5::_id_C2BC();
    maps\favela_anim::main();
    maps\_compass::setupminimap( "compass_map_favela" );
    maps\favela_aud::main();
    thread _id_AB52::main();
    level._id_B6C6 = getdvarfloat( "ai_friendlyFireBlockDuration" );
    level.advancetoenemyinterval = 30000;
    level.advancetoenemygroupmax = 1;
    level._id_AA03 = gettime();
    level._id_CB67[0] = "trash_container_big2";
    level._id_CB67[1] = "com_milk_carton";
    level._id_CB67[2] = "com_bottle4";
    level._id_CB67[3] = "trash_cup_tall3";
    level._id_CB67[4] = "trash_plate1";
    level._id_CB67[5] = "trash_can1";
    level._id_CB67[6] = "trash_can2";
    level._id_CB67[7] = "trash_can3";
    level._id_CB67[8] = "trash_can4";

    foreach ( var_1 in level._id_CB67 )
        precachemodel( var_1 );

    precachestring( &"FAVELA_OBJ_FIND_ROJAS" );
    precachestring( &"FAVELA_OBJ_CATCH_RUNNER" );
    precachestring( &"FAVELA_OBJ_REACH_TOP" );
    precachestring( &"FAVELA_OBJ_CAPTURE" );
    precachestring( &"FAVELA_KILLED_RUNNER" );
    precachestring( &"FAVELA_RUNNER_GOT_AWAY" );
    precachestring( &"FAVELA_ROJAS_KILLED" );
    precachestring( &"FAVELA_DUCK_HINT" );
    precachestring( &"FAVELA_DUCK_HINT_KEYBOARD" );
    precachestring( &"FAVELA_DEADQUOTE_KILL_ASSISTANT_TORTURE" );
    precachestring( &"FAVELA_OBJ_CAPTURE_ROJAS" );
    precachestring( &"FAVELA_OBJ_INTERCEPT" );
    precacheshader( "black" );
    precacherumble( "tank_rumble" );
    precacheitem( "rpg_straight" );
    precacheitem( "flash_grenade" );
    precachemodel( "com_bike_animated" );
    precachemodel( "h2_curtain_torn01_animated" );
    precachemodel( "machinery_car_battery" );
    precachemodel( "body_slum_civ_male_aa" );
    precachemodel( "h2_soccer_ball" );
    precachemodel( "h2_weapon_masada_grenadier_acog_black" );
    precachemodel( "h2_viewbody_stoccom" );
    precachemodel( "h2_body_vil_faust_assist_shot" );
    precachemodel( "h2_german_sheperd_dog_dark" );
    precachemodel( "h2_german_sheperd_dog_gray" );
    precachemodel( "h2_head_seal_soccom_e" );
    precachemodel( "hat_militia_bb_blk" );
    precachemodel( "body_seal_soccom_assault_b_blk_bloody" );
    precachemodel( "head_seal_soccom_e_bloody" );

    precachemodel( "h2_gfl_st_ar15_viewbody" );
    precachemodel( "h2_gfl_st_ar15_viewhands" );
    precachemodel( "h2_gfl_st_ar15_viewhands_player" );

    maps\_utility::array_spawn_function_noteworthy( "delete_at_path_end", maps\favela_code::_id_C236 );
    maps\_utility::array_spawn_function_noteworthy( "civilian_run_to_grid", maps\favela_code::_id_B04D );
    maps\_utility::array_spawn_function_noteworthy( "delete_at_path_end_no_choke", maps\favela_code::_id_AB43 );
    maps\_utility::array_spawn_function_noteworthy( "seek_player", maps\favela_code::_id_ACC8 );
    maps\_utility::array_spawn_function_noteworthy( "dog_seek_player", maps\favela_code::_id_B0B1 );
    maps\_utility::array_spawn_function_noteworthy( "delete_at_goal", maps\favela_code::_id_D053 );
    maps\_utility::array_spawn_function_noteworthy( "dont_see_player_no_choke", maps\favela_code::_id_C9F0 );
    maps\_utility::array_spawn_function_noteworthy( "ignore_and_delete_on_goal_nosight", maps\favela_code::_id_B58C, 1 );
    maps\_utility::array_spawn_function_noteworthy( "window_smasher", maps\favela_code::_id_C31D );
    maps\_utility::array_spawn_function_noteworthy( "ignored_until_goal", maps\favela_code::_id_C9FA );
    maps\_utility::array_spawn_function_noteworthy( "desert_eagle_guy", maps\favela_code::_id_C6B3 );
    maps\_utility::array_spawn_function_noteworthy( "faust", maps\favela_code::_id_C8BA );
    maps\_utility::array_spawn_function_noteworthy( "civilian_driver", maps\favela_code::_id_ADFA );
    var_3 = getspawnerteamarray( "axis" );
    var_4 = [];

    foreach ( var_6 in var_3 )
    {
        if ( var_6.classname == "actor_enemy_dog" )
            var_6 maps\_utility::add_spawn_function( maps\favela_code::random_dog_model_swap );

        if ( !isdefined( var_6.script_parameters ) )
            continue;

        var_4[var_4.size] = var_6;
    }

    maps\_utility::array_spawn_function( var_4, maps\favela_code::_id_B761 );
    maps\_utility::array_spawn_function( getspawnerteamarray( "neutral" ), maps\favela_code::_id_AF15 );
    common_scripts\utility::array_thread( getentarray( "play_sound", "targetname" ), maps\favela_code::_id_AE1B );
    common_scripts\utility::array_thread( getentarray( "trigger_chance", "targetname" ), maps\favela_code::_id_D503 );
    common_scripts\utility::array_thread( getentarray( "physics_drop", "targetname" ), maps\favela_code::_id_D0DB );
    common_scripts\utility::array_thread( getentarray( "trigger_cleanup", "targetname" ), maps\favela_code::_id_B947 );
    common_scripts\utility::array_thread( getentarray( "potted_plant", "targetname" ), maps\favela_code::_id_C842 );
    common_scripts\utility::array_thread( getentarray( "play_fx_trig", "targetname" ), maps\favela_code::_id_CCE2 );
    common_scripts\utility::array_thread( getentarray( "retreat_trigger", "targetname" ), maps\favela_code::_id_AA87 );
    common_scripts\utility::array_thread( getentarray( "curtain_pulldown", "script_noteworthy" ), maps\favela_code::_id_B52F );
    common_scripts\utility::array_thread( getentarray( "curtain_pulldown_insun", "script_noteworthy" ), maps\favela_code::_id_B52F, 0, 1 );
    common_scripts\utility::array_thread( getentarray( "curtain_pulldown_playerwait", "script_noteworthy" ), maps\favela_code::_id_B52F, 1, 1 );
    common_scripts\utility::array_thread( getentarray( "curtain_pulldown_insun_cantsee", "script_noteworthy" ), maps\favela_code::_id_B52F, 0, 1, 1 );
    common_scripts\utility::array_thread( getvehiclenodearray( "car_screech_node", "script_noteworthy" ), maps\favela_code::_id_AB28 );
    maps\_utility::add_global_spawn_function( "axis", maps\favela_code::_id_C2EA );
    common_scripts\utility::flag_init( "favela_gate_dialog_done" );
    common_scripts\utility::flag_init( "car_getting_shot" );
    common_scripts\utility::flag_init( "driver_dead" );
    common_scripts\utility::flag_init( "player_is_ducking" );
    common_scripts\utility::flag_init( "soccer_start" );
    common_scripts\utility::flag_init( "torture_outro_started" );
    common_scripts\utility::flag_init( "torture_outro_done" );
    common_scripts\utility::flag_init( "player_is_unducking" );
    common_scripts\utility::flag_init( "player_dies_in_vehicle" );
    common_scripts\utility::flag_init( "player_starts_exiting_vehicle" );
    common_scripts\utility::flag_init( "favela_music" );
    common_scripts\utility::flag_init( "faust_music" );
    common_scripts\utility::flag_init( "opening_scene_started" );
    common_scripts\utility::flag_init( "favela_enemies_spawned" );
    common_scripts\utility::flag_init( "start_chase" );
    common_scripts\utility::flag_init( "block_alley" );
    common_scripts\utility::flag_init( "favela_move_friendlies" );
    common_scripts\utility::flag_init( "favela_civilians_fleeing" );
    common_scripts\utility::flag_init( "allow_meat_death" );
    common_scripts\utility::flag_init( "allow_royce_death" );
    common_scripts\utility::flag_init( "civilians_walla" );
    common_scripts\utility::flag_init( "torture_sequence_done" );
    common_scripts\utility::flag_init( "van_skid" );
    common_scripts\utility::flag_init( "makarov_alley_wounded" );
    common_scripts\utility::flag_init( "favela_civilians_alerted" );
    common_scripts\utility::flag_init( "favela_civilians_spawned" );
    common_scripts\utility::flag_init( "ending_sequence_ready" );
    common_scripts\utility::flag_init( "ending_sequence_started" );
    common_scripts\utility::flag_init( "ending_sequence_dialog" );
    common_scripts\utility::flag_init( "start_final_dialog" );
    common_scripts\utility::flag_init( "shutter_closed" );
    common_scripts\utility::flag_init( "soap_exits_car" );
    common_scripts\utility::flag_init( "faust_appearance_1_end" );
    common_scripts\utility::flag_init( "faust_appearance_2_end" );
    common_scripts\utility::flag_init( "faust_appearance_3_end" );
    common_scripts\utility::flag_init( "skipped_faust_appearance_2" );
    common_scripts\utility::flag_init( "skipped_faust_appearance_3" );
    common_scripts\utility::trigger_off( "favela_opening_civilians_spawn", "targetname" );
    level._id_C3BB = getdvar( "cg_cinematicFullScreen" );
    thread maps\favela_code::_id_BF8B();
    thread maps\favela_code::_id_BD53();
    thread _id_C421();
    thread _id_D037();
    thread _id_C7DC();
    thread _id_CF83();
    thread _id_D3D9();
    thread _id_CFFF();
    thread _id_AE8F();
    thread _id_D584();
    thread _id_ADBB();
    thread _id_C5C4();
    thread maps\favela_code::_id_B02C();
    thread _id_CE6B();
    thread _id_C545();
    thread _id_CCAD();
    thread maps\favela_code::static_model_groups_setup();
    thread maps\_utility::disable_trigger_with_targetname( "favela_cancel_royce_anim" );
    thread maps\_utility::disable_trigger_with_targetname( "favela_move_friendlies" );
    objective_add( 1, "current", &"FAVELA_OBJ_FIND_ROJAS" );
    var_8 = maps\_utility::getdifficulty();

    if ( var_8 != "hard" && var_8 != "fu" )
    {
        setsaveddvar( "ai_accuracy_attackerCountMax", 4 );
        setsaveddvar( "ai_accuracy_attackerCountDecrease", 0.6 );
    }

    thread _id_D3A9();

    if ( getdvarint( "limited_mode" ) )
    {
        level.start_point = "torture";
        level._id_C9A9 = maps\favela_code::_id_AF21;
        maps\favela_code::_id_CE80();
    }

    common_scripts\utility::array_thread( getentarray( "animated_flag1", "targetname" ), maps\favela_code::_id_C155, "flag1" );
    common_scripts\utility::array_thread( getentarray( "animated_flag2", "targetname" ), maps\favela_code::_id_C155, "flag2" );
    common_scripts\utility::array_thread( getentarray( "animated_chicken", "targetname" ), maps\favela_code::_id_A8E1 );
    var_9 = getent( "spawn_allies_left_side_of_bus", "targetname" );
    var_9 thread maps\favela_code::sync_left_side_of_bus_spawning();
    maps\favela_code::hide_destructible_vehicles( 1, "hiding_car" );
    var_10 = getent( "fire_hydrant", "script_noteworthy" );
    var_10 _meth_848A( var_10.origin );
}

_id_C7F9()
{
    soundscripts\_snd::snd_message( "start_street_checkpoint" );
    thread maps\_utility::battlechatter_off( "allies" );
    thread maps\_utility::battlechatter_off( "axis" );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "hud_showStance", 0 );
    thread maps\favela_code::_id_C6F4( 3.5, "traffic_car_groupA_1", "traffic_car_groupA_2" );
    thread maps\favela_code::_id_C6F4( 5.0, "traffic_car_groupB_1", "traffic_car_groupB_2" );
    common_scripts\utility::array_thread( getentarray( "street_civilian", "targetname" ), maps\_utility::spawn_ai, 1 );
    maps\_utility::delaythread( 8.0, maps\favela_code::bike_rider, "bike_path_1" );
    maps\_utility::delaythread( 13.0, maps\favela_code::bike_rider, "bike_path_2" );
    thread _id_BED0();
    thread _id_C8A8();
}

_id_C8A8()
{
    thread maps\_utility::music_play( "mus_favela_intro" );
    level waittill( "runner_shot" );
    maps\_utility::music_stop( 2.0 );
}

_id_CCA5()
{
    soundscripts\_snd::snd_message( "start_chase_checkpoint" );
    thread maps\_utility::battlechatter_off( "allies" );
    thread maps\_utility::battlechatter_off( "axis" );
    maps\favela_code::_id_BC5D( "playerstart_chase" );
    setsaveddvar( "player_sprintUnlimited", "1" );
    setsaveddvar( "player_sprintSpeedScale", 1.4 );
    common_scripts\utility::flag_set( "start_chase" );
    maps\favela_lighting::_id_CFC9( "favela_chase" );
}

_id_B3C4()
{
    soundscripts\_snd::snd_message( "start_torture_checkpoint" );
    setdvar( "favela_trailer", 1 );
    thread _id_C29F();
}

delayed_autosave_torture()
{
    wait 0.4;
    thread maps\_utility::autosave_now();
    thread maps\favela_code::_id_ADA5();
}

_id_C29F()
{
    thread maps\favela_code::_id_C83B( 1 );
    soundscripts\_snd::snd_message( "start_favela_checkpoint" );
    thread maps\favela_code::_id_B5C5();
    thread maps\_utility::battlechatter_off( "allies" );
    thread maps\_utility::battlechatter_off( "axis" );
    thread _id_B971( 0.2, 1.3, 1.5 );
    level waittill( "black_screen_start" );
    level.player _meth_830F( 0 );

    if ( !isdefined( level._id_C70E ) || !level._id_C70E )
    {
        level.player setoffhandprimaryclass( "fraggrenade" );
        level.player giveweapon( "fraggrenade" );
    }

    if ( !isdefined( level._id_CE78 ) || !level._id_CE78 )
    {
        level.player setoffhandsecondaryclass( "flash_grenade" );
        level.player giveweapon( "flash_grenade" );
    }

    level notify( "stop_monitoring_makarov_damage" );
    thread maps\favela_code::_id_C055();
    common_scripts\utility::array_call( getcorpsearray(), ::delete );

    if ( isdefined( level._id_B624 ) )
        level._id_B624 delete();

    maps\favela_lighting::_id_CFC9( "favela_torture" );

    if ( !getdvarint( "limited_mode" ) )
        level maps\_utility::delaythread( 1.2, ::_id_AC9B );

    level.player cancelmantle();
    maps\favela_code::_id_BC5D( "playerstart_favela" );
    maps\_utility::activate_trigger( "favela_vision", "script_noteworthy" );
    thread maps\_utility::enable_trigger_with_targetname( "favela_cancel_royce_anim" );
    thread maps\_utility::enable_trigger_with_targetname( "favela_move_friendlies" );
    common_scripts\utility::flag_set( "civilians_walla" );
    level.disable_destructible_bad_places = undefined;
    level.player setstance( "stand" );
    setsaveddvar( "player_sprintUnlimited", "0" );
    setsaveddvar( "player_sprintSpeedScale", 1.5 );
    setsaveddvar( "ai_friendlyFireBlockDuration", level._id_B6C6 );
    common_scripts\utility::flag_clear( "player_near_stairs" );
    common_scripts\utility::flag_set( "block_alley" );
    level waittill( "black_screen_finish" );
    thread delayed_autosave_torture();
    thread maps\favela_aud::_id_C848();
    _id_C93F();
    thread _id_BED2();
    common_scripts\utility::flag_clear( "give_favela_warning" );
    common_scripts\utility::trigger_on( "favela_opening_civilians_spawn", "targetname" );
    getent( "favela_enter_player_clip", "targetname" ) delete();

    if ( getdvarint( "limited_mode" ) )
    {
        level.player setorigin( ( -35.1303, -962.725, 640.078 ) );
        level.player setplayerangles( ( 0.200222, 147.73, 0.0 ) );
        common_scripts\utility::flag_set( "torture_sequence_done" );
        common_scripts\utility::flag_set( "favela_move_friendlies" );
        common_scripts\utility::flag_set( "player_near_stairs" );
    }

    wait 0.05;
    thread maps\favela_code::_id_C27A();
    level.player thread common_scripts\utility::delaycall( 1, ::freezecontrols, 0 );
    common_scripts\utility::flag_wait( "favela_move_friendlies" );
    common_scripts\utility::flag_set( "favela_music" );
    setsaveddvar( "compass", 1 );
    thread maps\favela_code::_id_D304();
    thread _id_D0C1();
    thread _id_D1FA();
    thread _id_AD9F();
    thread _id_BF63();
    thread _id_D1F1();
    thread _id_B747();
    thread _id_B4B1();
    thread maps\favela_code::_id_CFC2();
    thread maps\favela_code::animated_soccer_goals();
    thread maps\favela_code::_id_C288();
}

_id_AAB8()
{
    soundscripts\_snd::snd_message( "start_soccer_checkpoint" );
    thread maps\favela_code::_id_C288();
    thread _id_D0C1();
    common_scripts\utility::array_call( getentarray( "delete_for_start_soccer", "script_noteworthy" ), ::delete );
    maps\favela_code::_id_BC5D( "playerstart_soccer" );
    maps\_utility::activate_trigger( "vision_shanty", "script_noteworthy" );
    common_scripts\utility::flag_set( "cleared_favela" );
    common_scripts\utility::flag_set( "civilians_walla" );
    thread maps\favela_code::_id_AFD1();
}

_id_C110()
{
    soundscripts\_snd::snd_message( "start_hilltop_checkpoint" );
    thread _id_D0C1();
    maps\favela_code::_id_BC5D( "playerstart_hilltop" );
    maps\_utility::activate_trigger( "favela_hill", "script_noteworthy" );
    common_scripts\utility::flag_set( "civilians_walla" );
}

_id_C1B4()
{
    soundscripts\_snd::snd_message( "start_trailer1_checkpoint" );
    _id_C90A( "trailer_talkers_1" );
    level.player maps\_utility::set_ignoreme( 1 );
    maps\favela_code::_id_BC5D( "trailer_talkers_1_player" );
}

_id_BEF4()
{
    soundscripts\_snd::snd_message( "start_trailer2_checkpoint" );
    _id_C90A( "trailer_talkers_2" );
    level.player maps\_utility::set_ignoreme( 1 );
    maps\favela_code::_id_BC5D( "trailer_talkers_2_player" );
}

_id_CFEB()
{
    soundscripts\_snd::snd_message( "start_trailer3_checkpoint" );
    _id_C90A( "trailer_talkers_3" );
    level.player maps\_utility::set_ignoreme( 1 );
    maps\favela_code::_id_BC5D( "trailer_talkers_3_player" );
}

_id_C90A( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_3 maps\_utility::spawn_ai( 1 );
        var_4 maps\_utility::set_ignoreall( 1 );
        var_4.goalradius = 16;
        var_4 setgoalpos( var_4.origin );

        if ( !isdefined( var_3.animation ) )
            continue;

        var_4.animname = "trailer";
        var_4 thread maps\_anim::anim_loop_solo( var_4, var_3.animation );
    }
}

_id_C578()
{
    soundscripts\_snd::snd_message( "start_end_checkpoint" );
    thread _id_D0C1();
    maps\favela_code::_id_BC5D( "playerstart_end" );
    maps\_utility::activate_trigger( "favela_vision", "script_noteworthy" );
}

_id_D1FA()
{
    thread _id_AD66();
}

_id_AD66()
{
    common_scripts\utility::flag_wait( "torture_sequence_done" );
    common_scripts\utility::flag_wait( "player_near_stairs" );
    level._id_B0E8 maps\_anim::anim_single_solo( level._id_B0E8, "favela_ryc_watchyourbg" );
    common_scripts\utility::flag_set( "favela_gate_dialog_done" );
}

_id_AC9B()
{
    var_0 = getent( "torture_node", "targetname" );
    var_1 = "torture_enemy_spawner";
    var_2[0] = maps\_utility::spawn_targetname( var_1 );
    // var_2[0] setmodel( "h2_body_vil_faust_assist_shot" );
    var_2[0].animname = "torture_enemy";
    var_2[0].cheat._id_D4B8 = 1;
    var_2[0] thread maps\favela_code::_id_CFED();
    var_2[1] = maps\_utility::spawn_targetname( "torture_friendly_1_spawner" );
    var_2[1].animname = "torture_friend1";
    var_2[2] = maps\_utility::spawn_targetname( "torture_friendly_2_spawner" );
    var_2[2].animname = "torture_friend2";
    var_2[3] = maps\_utility::spawn_anim_model( "torture_torch" );
    var_2[3].animname = "torture_torch";
    var_2[4] = maps\_utility::spawn_anim_model( "pliers" );
    var_2[4].animname = "pliers";
    var_3 = getent( "garage_door_static", "targetname" );
    var_3 delete();
    var_4 = maps\_utility::spawn_anim_model( "torture_door" );
    var_4.animname = "torture_door";
    thread maps\favela_code::_id_BBCE( "animated_chains" );
    level._id_B0E8 = maps\_utility::spawn_targetname( "royce_spawner", 1 );
    level._id_B0E8 thread maps\_utility::magic_bullet_shield();
    level._id_B0E8.animname = "royce";
    // level._id_B0E8 maps\favela_code::setheadmodel( "head_seal_soccom_b" );
    level._id_B0E8 maps\_utility::forceuseweapon( "m4_grenadier", "primary" );
    thread _id_C8D1( var_2[2] );
    setsaveddvar( "cg_gunDownAnimDelayTime", 250 );

    foreach ( var_6 in var_2 )
    {
        if ( isai( var_6 ) )
        {
            var_6 maps\_utility::gun_remove();
            var_6 maps\_utility::set_ignoreme( 1 );
            var_6 maps\_utility::set_ignoreall( 1 );
        }
    }

    var_0 maps\_anim::anim_first_frame( var_2, "torture" );
    var_8 = var_0 maps\_anim::get_anim_position( undefined, "tortureOutro" );
    maps\_anim::anim_first_frame_on_guy( var_4, "tortureOutro", var_8["origin"], var_8["angles"] );
    var_9 = var_2[0].origin;
    thread _id_C65A( var_2[3] );
    var_0 thread _id_C9CD( var_2[2], var_4 );
    var_0 thread maps\_anim::anim_single_solo( level._id_B0E8, "torture" );
    var_2[2] _id_B3AB::_id_BEBA( "head", level.player, 200, 45, 45, 45, 30, 0, 1 );
    var_0 thread maps\_anim::anim_single( var_2, "torture" );
    var_10 = getanimlength( level.scr_anim["torture_friend2"]["torture"] );
    wait(var_10);

    if ( !common_scripts\utility::flag( "torture_outro_started" ) )
        var_0 _id_C806( var_2[2], var_4 );

    common_scripts\utility::flag_wait( "torture_outro_done" );
    setsaveddvar( "cg_gunDownAnimDelayTime", -1 );
    common_scripts\utility::array_call( var_2, ::delete );
    common_scripts\utility::flag_set( "torture_sequence_done" );
    common_scripts\utility::flag_set( "favela_move_friendlies" );
}

_id_C806( var_0, var_1 )
{
    common_scripts\utility::flag_set( "torture_outro_started" );
    var_2 = getent( "lightsoapfill", "targetname" );
    var_2 thread _id_BEA8( 3 );
    var_3[0] = var_0;
    var_3[1] = var_1;
    maps\_anim::anim_single( var_3, "tortureOutro" );
    common_scripts\utility::flag_set( "torture_outro_done" );
}

_id_BEA8( var_0 )
{
    common_scripts\utility::flag_wait( "drop_door" );
    var_1 = self getlightintensity();
    var_2 = var_1 / var_0;

    while ( var_1 > 0 )
    {
        var_1 = common_scripts\utility::_id_D0EA( var_1 - var_2, 0 );
        self setlightintensity( var_1 );
        waitframe();
    }
}

_id_C9CD( var_0, var_1 )
{
    level endon( "torture_outro_done" );
    common_scripts\utility::flag_wait( "favela_move_friendlies" );

    if ( common_scripts\utility::flag( "torture_outro_started" ) )
        return;

    _id_C806( var_0, var_1 );
}

_id_B45B( var_0 )
{
    var_1 = var_0.origin;
    var_2 = var_0.origin + ( 0.0, 0.0, 45.0 );
    var_0.origin = var_2;
    common_scripts\utility::flag_wait( "drop_door" );
    var_0 playsound( "scn_favela_garage_door" );
    var_0 moveto( var_1, 1.3, 0.1, 0.0 );
}

_id_BED0()
{
    thread _id_D1CD();
    var_0 = maps\_utility::spawn_anim_model( "player_rig" );
    thread maps\favela_code::_id_CF5F();
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "player_vehicle" );
    var_1 _meth_848A( getent( "van_light_origin", "targetname" ).origin );
    var_1 hidepart( "TAG_GLASS_FRONT_D" );
    var_2 = var_1._id_AB3E["vehicle_luxurysedan_2009_viewmodel_interior"];
    var_2 hidepart( "TAG_BROKEN_GLASS" );
    var_2 hidepart( "TAG_BLOOD" );
    var_2 hidepart( "TAG_STEERING_WHEEL_BLOOD" );
    var_2 hidepart( "TAG_KEY_CHAIN_BLOOD" );
    var_2 hidepart( "TAG_SHIFTER_BLOOD" );
    var_2 hidepart( "TAG_SUN_SHADE_BLOOD" );
    var_1 thread maps\favela_code::_id_B36A();
    var_1 thread maps\favela_code::_id_B5C0();
    var_1 thread maps\_utility::play_sound_on_entity( "scn_favela_driveup" );
    thread _id_BD71( var_1, var_0 );
    thread _id_B1E6( var_1 );
    thread maps\favela_code::_id_C6F9();
    thread maps\favela_code::_id_C628( var_1, var_2 );
    playfxontag( level._effect["steam_coffee_slow"], var_1, "body_animate_jnt" );
    playfxontag( level._effect["spotlight_favela_player_car"], var_1, "body_animate_jnt" );
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "van" );
    var_3 maps\_vehicle::godon();
    var_3 thread _id_C8BE();
    var_3.animname = "van";
    var_3 maps\_anim::setanimtree();
    playfxontag( level._effect["van_intro_fake_shadow"], var_3, "tag_origin" );
    var_4 = getent( "opening_scene_node", "targetname" );
    var_5 = getent( "makarov_spawner", "targetname" );
    var_6 = getent( "opening_driver_spawner", "targetname" );
    var_7 = getent( "opening_gunner1_spawner", "targetname" );
    var_8 = getent( "opening_gunner2_spawner", "targetname" );
    var_9 = var_5 maps\_utility::spawn_ai( 1 );
    var_9.animname = "makarov";
    var_9 thread maps\_utility::magic_bullet_shield();
    var_9.ignorerandombulletdamage = 1;
    var_9.grenadeawareness = 0;
    var_9.cheat._id_D4B8 = 1;
    var_9 thread maps\favela_code::bullet_holes_hood();
    var_10 = var_6 maps\_utility::spawn_ai( 1 );
    var_10.animname = "driver";
    var_10 thread _id_C2D7();
    var_10 thread _id_C0C3::addspecialmonitors();
    var_10.cheat._id_BDF2 = 1;
    var_11 = var_7 maps\_utility::spawn_ai( 1 );
    var_11.animname = "gunner1";
    var_11 thread _id_C2D7();
    var_11 thread _id_C0C3::addspecialmonitors();
    var_11.cheat._id_BDF2 = 1;
    var_12 = var_8 maps\_utility::spawn_ai( 1 );
    var_12.animname = "gunner2";
    var_12 thread _id_C2D7();
    var_12 thread _id_C0C3::addspecialmonitors();
    var_12.cheat._id_BDF2 = 1;
    var_13[0] = var_9;
    var_13[1] = var_11;
    var_13[2] = var_12;
    thread maps\favela_code::_id_D08B( var_4, var_13 );
    var_1 setflaggedanim( "car_intro", level.scr_anim["car"]["intro"] );
    var_2 maps\_utility::assign_animtree( "car" );
    var_2 setflaggedanim( "car_intro", level.scr_anim["car"]["intro"] );
    var_1 thread animscripts\shared::donotetracks( "car_intro" );
    var_3 setanim( level.scr_anim["van"]["opening_scene"] );
    var_10 linkto( var_3, "tag_driver" );
    var_3 thread maps\_anim::anim_single_solo( var_10, "opening_scene", "tag_driver" );
    var_1 vehicle_setspeed( 3, 5.0, 5.0 );
    var_3 vehicle_setspeed( 3, 5.0, 5.0 );
    wait 4;
    var_0 attach( "h2_weapon_masada_grenadier_acog_black", "TAG_WEAPON_LEFT", 1 );
    thread _id_BEEF( var_1 );
    var_1 resumespeed( 2.5 );
    var_3 resumespeed( 2.5 );
    var_14 = getvehiclenode( "van_last_node", "script_noteworthy" );
    var_14 waittill( "trigger" );
    var_13[0] thread maps\favela_code::_id_C762();

    foreach ( var_16 in var_13 )
        var_16 show();

    var_18 = getent( "street_civilian_clip", "targetname" );
    var_18 connectpaths();
    var_18 delete();
    common_scripts\utility::flag_set( "opening_scene_started" );
    var_19 = var_9 maps\_utility::getanim( "opening_scene" );
    var_20 = getanimlength( var_19 );
    level thread maps\_utility::notify_delay( "shootout_started", var_20 - 24 );
    var_3 thread _id_C1AF();
    wait 12;
    thread maps\favela_code::_id_D0E6();
    var_9 thread _id_C100( var_1 );
    thread _id_CCBE( var_2 );
    var_9 maps\_utility::waittill_notetrack_or_damage( "shoot_car" );
    var_1 maps\_utility::delaythread( 0.7, maps\_utility::play_sound_on_tag, "scn_favela_npc_door_open", "rear_door_left_jnt" );
    wait 3;
    var_9 maps\_utility::anim_stopanimscripted();
    var_21 = getnode( "runner_first_node", "targetname" );
    var_9.goalradius = 32;
    var_9 thread maps\favela_code::_id_D053( 1 );
    var_9 maps\_utility::set_ignoreall( 1 );
    var_9 setgoalnode( var_21 );
    thread maps\_utility::delaythread( 1.0, common_scripts\utility::flag_set, "start_chase" );
    wait 2;
    thread _id_BE2B( var_1, var_0 );
    maps\favela_lighting::_id_CFC9( "favela_chase" );
}

_id_BEEF( var_0 )
{
    var_1 = 105;
    var_2 = 75;
    var_3 = 35;
    var_4 = 25;
    var_5 = 32;
    var_6 = -20;
    var_7 = 16;
    var_8 = -7;
    var_9 = var_1 + var_2;
    var_10 = var_1 - var_9 / 2;
    level.player lerpviewangleclamp( 0.05, 0, 0, var_2, var_1, var_3, var_4 );
    level.player _meth_85AA( var_3, 5, var_10, var_9 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    var_11 = -48;
    var_12 = 9.8;
    var_13 = 12.5;
    var_14 = 0.0;
    var_15 = 0.05;
    var_16 = 0;
    var_17 = 0;
    var_18 = 500;
    var_19 = 32;
    var_20 = 24;
    var_21 = _id_D397::_id_A97A( "favela_intro" );
    var_21 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 8.0, var_18, 3.0, 3.0 );
    var_21 _id_D397::_id_BEA0( 0.05 ) _id_D397::_id_AF9C();
    thread h2_favela_introshakes();
    var_21 _id_D397::_id_BC26();

    for (;;)
    {
        var_22 = var_0 gettagorigin( "tag_passenger" );
        var_22 = anglestoforward( vectornormalize( var_22 ) );
        var_23 = level.player getplayerangles();
        var_23 = anglestoforward( var_23 );
        var_24 = _func_1FA( var_22[1], var_22[0] ) - _func_1FA( var_23[1], var_23[0] );
        var_24 -= 90;

        if ( var_14 > var_12 )
            var_24 -= 20;

        var_24 = angleclamp180( var_24 );

        if ( var_24 < var_11 )
        {
            var_16 = 5.6;
            var_17 = var_19;
        }
        else if ( var_23[2] > -0.27 )
        {
            var_16 = 8.0;
            var_17 = var_18;
        }
        else
        {
            var_16 = 8.0;
            var_17 = var_20;
        }

        var_21 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687() _id_D397::_id_C491( var_16, var_17, 3.0, 3.0 );
        var_21 _id_D397::_id_BC26();

        if ( common_scripts\utility::flag( "player_is_ducking" ) || common_scripts\utility::flag( "player_dies_in_vehicle" ) )
            break;

        wait(var_15);
        var_14 += var_15;
    }

    var_25 = 0;
    var_26 = 0;

    for (;;)
    {
        var_25 = var_26;

        if ( common_scripts\utility::flag( "player_is_unducking" ) )
            var_26 = 1;
        else if ( common_scripts\utility::flag( "player_is_ducking" ) )
            var_26 = 2;

        if ( common_scripts\utility::flag( "player_dies_in_vehicle" ) )
        {
            var_21 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687() _id_D397::_id_C491( 2.0, 28, 5.0, 5.0 );
            var_21 _id_D397::_id_BC26();
            wait 15;
        }

        if ( var_25 != var_26 )
        {
            if ( var_26 == 1 )
            {
                var_16 = 8.0;
                var_17 = var_18;
                level.player lerpviewangleclamp( 0.6, 0.2, 0.4, 10, 10, 5, 5 );
                wait 0.6;
                level.player lerpviewangleclamp( 0.1, 0, 0, var_2, var_1, var_3, var_4 );
                level.player _meth_85AA( var_3, 5, var_10, var_9 );
            }

            if ( var_26 == 2 )
            {
                var_16 = 12.0;
                var_17 = var_19;
                level.player lerpviewangleclamp( 0.6, 0.2, 0.4, -28, 28, 13, -13 );
                wait 0.6;
                level.player lerpviewangleclamp( 0.1, 0, 0, var_6, var_5, var_7, var_8 );
            }

            level.player setviewangleresistance( 50, 50, 20, 20 );
        }

        if ( common_scripts\utility::flag( "player_starts_exiting_vehicle" ) )
            break;

        var_21 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687() _id_D397::_id_C491( var_16, var_17, 2.0, 2.0 );
        var_21 _id_D397::_id_BC26();
        wait(var_15);
        var_14 += var_15;
    }

    common_scripts\utility::flag_clear( "player_starts_exiting_vehicle" );
    common_scripts\utility::flag_clear( "player_is_unducking" );
    common_scripts\utility::flag_clear( "player_dies_in_vehicle" );
    level.player lerpviewangleclamp( 1.2, 0.5, 0.25, 0, 0, 0, 0 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    var_21 = _id_D397::_id_A97A( "favela_exit_car" );
    var_21 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687() _id_D397::_id_C491( 5.6, 500, 2.0, 2.0 ) _id_D397::_id_BAE4( 2 ) _id_D397::_id_AF9C();
    var_21 _id_D397::_id_BEA0( 0.85 ) _id_D397::_id_C491( 48, 500, 3.0, 3.0 );
    var_21 _id_D397::_id_BEA0( 2.5 ) _id_D397::_id_BAE4( 0 ) _id_D397::_id_BF3F();
    var_21 _id_D397::_id_BEA0( 0.2 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_21 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_21 _id_D397::_id_BEA0( 1.1 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_21 _id_D397::_id_BEA0( 2.15 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_21 _id_D397::_id_BC26();
}

h2_favela_introshakes()
{
    var_0 = _id_D397::_id_A97A( "favela_intro_shakes" );
    var_1 = 0.05;
    var_2 = 1.0;
    var_3 = 10000;
    var_4 = level.player;
    var_0 _id_D397::_id_BEA0( 10.6 ) _id_D397::_id_B85E( 0.11, 1.2, var_4, var_3 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 11.4 ) _id_D397::_id_B85E( 0.1, 0.8, var_4, var_3 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 12.65 ) _id_D397::_id_B85E( 0.05, 1.8, var_4, var_3 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 16.1 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 23.9 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_5 = 12.6;

    for ( var_6 = 0.0; var_6 <= var_5; var_6 += 0.25 )
        var_0 _id_D397::_id_BEA0( var_6 ) _id_D397::_id_B85E( var_1, var_2, var_4, var_3 );

    var_0 _id_D397::_id_BC26();
}

_id_BD71( var_0, var_1 )
{
    level endon( "exiting_vehicle" );
    thread maps\favela_code::_id_AAD2();
    maps\_utility::enableplayerweapons( 0 );
    var_2 = 90;
    var_1.origin = var_0 gettagorigin( "tag_passenger" );
    var_1.angles = var_0 gettagangles( "tag_passenger" );
    var_1 linkto( var_0, "tag_passenger" );
    var_1 thread maps\favela_code::intro_player();
    var_1 thread _id_A9B3( var_0, var_1 );
    level.player playerlinktodelta( var_1, "tag_player", 1.0, 0, 0, 0, 0 );
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player allowstand( 1 );
    common_scripts\utility::flag_clear( "player_is_ducking" );
    level.player endon( "death" );
    level.player setstance( "stand" );
    notifyoncommand( "go_crouch", "+movedown" );
    notifyoncommand( "go_crouch", "+prone" );
    notifyoncommand( "go_crouch", "+stance" );
    notifyoncommand( "go_crouch", "lowerstance" );
    notifyoncommand( "go_crouch", "togglecrouch" );
    notifyoncommand( "go_crouch", "toggleprone" );
    notifyoncommand( "go_crouch", "goprone" );
    notifyoncommand( "go_crouch", "gocrouch" );
    notifyoncommand( "go_stand", "+stance" );
    notifyoncommand( "go_stand", "raisestance" );
    notifyoncommand( "go_stand", "togglecrouch" );
    notifyoncommand( "go_stand", "toggleprone" );
    notifyoncommand( "go_stand", "+moveup" );
    notifyoncommand( "go_stand", "+gostand" );

    if ( !level.console )
    {
        notifyoncommand( "go_crouch", "+togglecrouch" );
        notifyoncommand( "go_stand", "+togglecrouch" );
    }

    level waittill( "shootout_started" );

    for (;;)
    {
        level.player waittill( "go_crouch" );
        var_1 notify( "stop_intro_idle" );
        common_scripts\utility::flag_set( "player_is_ducking" );
        common_scripts\utility::flag_clear( "player_is_unducking" );
        level.player enableinvulnerability();
        level.player thread maps\_utility::play_sound_on_entity( "scn_favela_player_ducking" );
        var_1 maps\_anim::anim_single_solo( var_1, "duck_down", "tag_passenger" );
        var_1 thread maps\_anim::anim_loop_solo( var_1, "duck_down_idle", "stop_down_idle", "tag_passenger" );
        level.player waittill( "go_stand" );
        common_scripts\utility::flag_set( "player_is_unducking" );
        level.player thread maps\_utility::play_sound_on_entity( "scn_favela_player_unducking" );
        var_1 notify( "stop_down_idle" );
        var_1 maps\_anim::anim_single_solo( var_1, "duck_up", "tag_passenger" );
        var_1 thread maps\_anim::anim_loop_solo( var_1, "idle", "stop_intro_idle", "tag_passenger" );
        common_scripts\utility::flag_clear( "player_is_ducking" );
        level.player disableinvulnerability();
    }
}

_id_A9B3( var_0, var_1 )
{
    level endon( "exiting_vehicle" );
    level.player waittill( "shot_next_frame" );
    common_scripts\utility::flag_set( "player_dies_in_vehicle" );
    level.player playerlinktoblend( var_1, "tag_player", 2, 0.5, 0.5 );
    var_0 thread maps\_anim::anim_single_solo( self, "die", "tag_passenger" );
    wait 1.5;
    level._id_D13B stopanimscripted();
    level._id_D13B maps\_utility::ai_ignore_everything();
    level._id_D13B maps\_utility::stop_magic_bullet_shield();
    level._id_D13B kill();
}

_id_BE2B( var_0, var_1 )
{
    wait 1.2;
    level notify( "exiting_vehicle" );
    maps\favela_code::hide_destructible_vehicles( 0, "hiding_car" );
    var_0 notify( "door_open" );
    soundscripts\_snd::snd_message( "start_player_exit_vehicle" );

    if ( isalive( level.player ) )
    {
        common_scripts\utility::flag_set( "player_starts_exiting_vehicle" );
        var_1 maps\_anim::anim_single_solo( var_1, "getout" );
        level.player unlink();
        var_1 hide();
        level.player disableinvulnerability();
        maps\_utility::enableplayerweapons( 1 );
        level.player allowprone( 1 );
        level.player allowcrouch( 1 );
        level.player allowstand( 1 );
        level.player setstance( "stand" );
        setsaveddvar( "player_sprintUnlimited", "1" );
        setsaveddvar( "player_sprintSpeedScale", 1.4 );
        var_1 delete();
    }

    if ( isdefined( level._id_D13B ) )
        objective_onentity( 1, level._id_D13B, ( 0.0, 0.0, 70.0 ) );

    setsaveddvar( "objectiveFadeTooFar", 0.1 );
    wait 1;
    var_2 = common_scripts\utility::ter_op( level.gameskill < 2, 10, 25 );
    setsaveddvar( "objectiveFadeTooFar", var_2 );
    stopfxontag( level._effect["spotlight_favela_player_car"], var_0, "body_animate_jnt" );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "hud_showStance", 1 );
}

_id_C8BE()
{
    common_scripts\utility::flag_wait( "van_skid" );
    thread maps\_utility::play_sound_on_entity( "scn_favela_van_skid2stop" );
}

_id_C1AF()
{
    thread maps\_utility::delaythread( 2.3, maps\_utility::play_sound_on_entity, "scn_favela_van_driverdoor_open" );
    thread maps\_utility::delaythread( 4.0, maps\_utility::play_sound_on_entity, "scn_favela_van_driverdoor_close" );
}

_id_CC36()
{
    wait 2.0;
    maps\_utility::radio_dialogue( "favela_cmt_ready2move" );
    maps\_utility::radio_dialogue( "favela_gst_good2go" );
    maps\_utility::radio_dialogue( "favela_cmt_rogerthat" );
    common_scripts\utility::flag_wait( "van_in_position" );
    thread maps\_utility::autosave_now_silent();
    wait 0.5;
    maps\_utility::radio_dialogue( "favela_cmt_inposition" );
    wait 2.5;
    maps\_utility::radio_dialogue( "favela_cmt_insight" );
    wait 0.9;
    maps\_utility::radio_dialogue( "favela_cmt_needhimalive" );
    wait 0.2;
    maps\_utility::radio_dialogue( "favela_cmt_getdown" );
}

_id_B1E6( var_0 )
{
    level._id_D13B = maps\_utility::spawn_targetname( "soap_spawner", 1 );
    level._id_D13B maps\_utility::set_ignoreall( 1 );
    level._id_D13B.usechokepoints = 0;
    level._id_D13B.fixednode = 0;
    level._id_D13B.disablebulletwhizbyreaction = 1;
    level._id_D13B.a.disablepain = 1;
    level._id_D13B.maxsightdistsqrd = 0;
    level._id_D13B.ignoresuppression = 1;
    level._id_D13B.animname = "mactavish";
    level._id_D13B.pathrandompercent = 0;
    level._id_D13B thread maps\_utility::magic_bullet_shield();
    level._id_D13B linkto( var_0, "tag_guy0" );
    var_0 thread maps\_anim::anim_single_solo( level._id_D13B, "intro", "tag_guy0" );
    common_scripts\utility::flag_wait( "start_chase" );
    common_scripts\utility::flag_clear( "runner_gets_away" );
    thread maps\_utility::player_speed_set( 180, 1 );
    level._id_D13B unlink();
    level._id_D13B thread maps\favela_code::_id_C2F6( 550, 400, undefined, undefined, 1 );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    thread maps\_utility::autosave_now();
    thread _id_B07D();
    level.disable_destructible_bad_places = 1;
    objective_state_nomessage( 1, "done" );
    objective_add( 1, "current", &"FAVELA_OBJ_CATCH_RUNNER" );
    objective_state( 1, "current" );
    common_scripts\utility::flag_set( "soap_exits_car" );
    thread _id_AE64();
    level._id_D13B thread maps\favela_code::_id_C5B1();
    wait 6;
    var_1 = maps\_utility::spawn_targetname( "makarov_street_spawner", 1 );
    level._id_D41B = var_1;
    var_1 maps\_utility::set_ignoreall( 1 );
    var_1 maps\_utility::set_ignoreme( 1 );
    var_1.disablebulletwhizbyreaction = 1;
    var_1.a.disablepain = 1;
    var_1.maxsightdistsqrd = 0;
    var_1.ignoresuppression = 1;
    var_1.usechokepoints = 0;
    var_1.skipbloodpool = 1;
    var_1.cheat._id_C46A = 1;
    var_1.cheat._id_D4B8 = 1;
    var_1 thread maps\_utility::magic_bullet_shield();
    var_1 thread maps\favela_code::_id_B529();
    var_1 thread _id_CC43();
    var_1 thread _id_CAEC();
    var_1 thread _id_ABD6();
    var_1 thread _id_BD29();
    var_1 thread _id_C5C9();
    var_1 thread _id_BDA2();
    var_1 thread _id_B027();
    var_1 thread _id_C394();
}

_id_C394()
{
    level endon( "runner_shot" );
    common_scripts\utility::flag_wait( "take_the_shot" );
    objective_onentity( 1, self, ( 0.0, 0.0, 70.0 ) );
    objective_setpointertextoverride( 1, &"FAVELA_OBJ_CAPTURE" );
    setsaveddvar( "objectiveFadeTooFar", 0.1 );
}

_id_BDA2()
{
    level endon( "take_the_shot" );
    self endon( "death" );
    self endon( "runner_shot" );
    var_0 = 500;
    var_1 = 2500;
    var_2 = 1.0;
    var_3 = 1.6;

    for (;;)
    {
        var_4 = distance( level.player.origin, self.origin );

        if ( var_4 > var_1 )
        {
            setdvar( "ui_deadquote", "@FAVELA_RUNNER_GOT_AWAY" );
            maps\_utility::missionfailedwrapper();
            return;
        }

        var_5 = self.moveplaybackrate;

        if ( var_4 < var_0 )
            var_5 += 0.1;
        else
            var_5 -= 0.1;

        self.moveplaybackrate = clamp( var_5, var_2, var_3 );
        wait 0.1;
    }
}

_id_B07D()
{
    level._id_D13B endon( "death" );
    level endon( "runner_shot" );
    var_0 = getent( "soapCarHitStart", "targetname" );
    var_1 = getent( "carHittingSoap", "targetname" );
    var_1.animname = "car";
    var_1 maps\_anim::setanimtree();
    var_2 = getent( "carHittingSoap2", "targetname" );
    var_2.animname = "car2";
    var_2 maps\_anim::setanimtree();
    var_3 = getent( "driverHittingSoap", "targetname" );
    var_3.animname = "driver";
    var_4 = getent( "driverHittingSoap2", "targetname" );
    var_4.animname = "driver2";
    var_5 = getent( "RunningCivilian", "targetname" );
    var_5.animname = "generic";
    var_6 = getnode( "SoapNewObjective", "targetname" );
    var_7 = getnode( "civilianEndingNode", "targetname" );
    var_8 = [ var_1, var_2 ];
    var_0 maps\_anim::anim_first_frame( var_8, "hit_by_car" );

    if ( isdefined( var_5 ) )
        var_0 maps\_anim::anim_first_frame_solo( var_5, "hit_by_car" );

    var_3 linkto( var_1, "tag_driver" );
    var_4 linkto( var_2, "tag_driver" );
    var_8[var_8.size] = level._id_D13B;
    var_0 maps\_anim::anim_reach_solo( level._id_D13B, "hit_by_car" );

    if ( isdefined( var_5 ) )
        var_0 thread maps\_anim::anim_single_solo( var_5, "hit_by_car" );

    var_1 thread maps\_anim::anim_single_solo( var_3, "hit_by_car", "tag_driver" );
    var_2 thread maps\_anim::anim_single_solo( var_4, "hit_by_car", "tag_driver" );
    var_0 maps\_anim::anim_single( var_8, "hit_by_car" );

    if ( isdefined( var_5 ) )
        var_5 setgoalnode( var_7 );

    if ( isdefined( level._id_D13B ) )
    {
        level._id_D13B notify( "stop_dynamic_run_speed" );
        level._id_D13B.moveplaybackrate = 1;
        level._id_D13B setgoalnode( var_6 );
    }

    var_9 = getent( "chase_objective_location", "targetname" );
    objective_position( 1, var_9.origin );
    setsaveddvar( "objectiveFadeTooFar", 0.1 );
}

_id_AE64()
{
    level endon( "runner_shot" );
    wait 7;
    maps\_utility::delaythread( 1.5, maps\_utility::radio_dialogue, "favela_gst_onmyway" );
    common_scripts\utility::flag_wait( "runner_in_alley" );
    maps\_utility::radio_dialogue( "favela_gst_hesfast" );
    common_scripts\utility::flag_wait( "take_the_shot" );
    thread _id_AB5D();
    level._id_D13B maps\_utility::dialogue_queue( "favela_cmt_takeshot" );
}

_id_AB5D()
{
    level endon( "runner_shot" );
    wait 0.75;
    thread maps\_utility::music_stop( 0.25 );
    level.player thread maps\_utility::play_sound_on_entity( "mus_favela_legshot_pre_stinger" );
}

_id_CC43()
{
    self endon( "death" );
    var_0 = getent( "teleport_runner_1", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_0 waittill( "trigger" );

    if ( !common_scripts\utility::flag( "runner_in_alley" ) )
        return;

    self forceteleport( var_1.origin, var_1.angles );
}

_id_CAEC()
{
    self endon( "death" );
    maps\_utility::forceuseweapon( "ak47", "primary" );
    var_0 = getent( "teleport_runner_2", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = getnode( "back_alley_shooting_back", "targetname" );
    var_0 waittill( "trigger" );

    if ( !common_scripts\utility::flag( "runner_in_alley2" ) )
        return;

    self forceteleport( var_1.origin, var_1.angles );
    var_2 thread maps\_anim::anim_single_solo( self, "rojas_assistant_run_gun_alley" );
}

_id_ABD6()
{
    level endon( "stop_monitoring_makarov_damage" );
    maps\_utility::set_generic_deathanim( "alley_death_fall" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 != level.player && var_1 != level._id_D13B )
            continue;

        if ( var_0 <= 1 )
            continue;

        if ( !isdefined( var_4 ) )
            continue;

        if ( issubstr( var_4, "GRENADE" ) )
        {
            thread _id_B504( var_3 );
            return;
        }

        if ( _id_ABC3() )
        {
            thread _id_B504( var_3 );
            return;
        }

        thread _id_D2F7();
    }
}

_id_ABC3()
{
    if ( isdefined( self._id_BB91 ) )
        return 0;

    if ( !isdefined( self.damagelocation ) )
        return 1;

    switch ( self.damagelocation )
    {
        case "none":
            if ( common_scripts\utility::flag( "makarov_alley_wounded" ) )
                return 0;

            return 1;
        case "head":
        case "helmet":
        case "neck":
        case "torso_upper":
        case "torso_lower":
            return 1;
        default:
            return 0;
    }
}

_id_D2F7()
{
    level notify( "runner_shot" );

    if ( common_scripts\utility::flag( "makarov_alley_wounded" ) )
        return;

    common_scripts\utility::flag_set( "makarov_alley_wounded" );
    thread _id_C853();
    wait 1.0;
    level._id_D13B thread maps\_anim::anim_single_solo( level._id_D13B, "favela_cmt_hesdown" );
    wait 1.0;
    level notify( "makarov_wounded_successfully" );
    objective_state_nomessage( 1, "done" );
    thread _id_C29F();
}

_id_C853()
{
    self endon( "deleted" );
    self endon( "death" );

    if ( common_scripts\utility::flag( "runner_disable_crawl" ) )
        maps\_utility::set_generic_deathanim( "alley_death_fall_too_late" );

    maps\_utility::stop_magic_bullet_shield();
    level._id_B624 = self;
    level._id_B624 thread common_scripts\utility::play_sound_in_space( "scn_favela_death_crawl", level._id_B624.origin );
    self.nodrop = 1;
    self._id_B2B3 = 1;
    self kill();
}

_id_B504( var_0 )
{
    level notify( "runner_shot" );

    if ( !common_scripts\utility::flag( "makarov_alley_wounded" ) )
    {
        maps\_utility::clear_deathanim();
        maps\_utility::stop_magic_bullet_shield();
        self kill( var_0, level.player );
    }

    setdvar( "ui_deadquote", "@FAVELA_KILLED_RUNNER" );
    maps\_utility::missionfailedwrapper();
}

_id_BD29()
{
    self endon( "runner_shot" );
    self waittill( "reached_path_end" );
    setdvar( "ui_deadquote", "@FAVELA_RUNNER_GOT_AWAY" );
    maps\_utility::missionfailedwrapper();
}

_id_C5C9()
{
    self endon( "runner_shot" );
    common_scripts\utility::flag_wait( "runner_gets_away" );
    setdvar( "ui_deadquote", "@FAVELA_RUNNER_GOT_AWAY" );
    maps\_utility::missionfailedwrapper();
}

_id_B971( var_0, var_1, var_2 )
{
    setomnvar( "ui_expireHUD", 1 );
    setsaveddvar( "compass", 0 );
    thread maps\favela_aud::_id_D534();
    level.player playlocalsound( "scn_favela_legshot_stinger" );
    var_3 = newhudelem();
    var_3.x = 0;
    var_3.y = 0;
    var_3 setshader( "black", 640, 480 );
    var_3.alignx = "left";
    var_3.aligny = "top";
    var_3.horzalign = "fullscreen";
    var_3.vertalign = "fullscreen";
    var_3.foreground = 1;
    var_3.alpha = 0;

    if ( var_0 > 0 )
        var_3 fadeovertime( var_0 );

    var_3.alpha = 1;
    wait(var_0);
    wait 0.05;
    level.player freezecontrols( 1 );
    level notify( "black_screen_start" );
    wait(var_2);
    level notify( "black_screen_finish" );

    if ( var_1 > 0 )
        var_3 fadeovertime( var_1 );

    var_3.alpha = 0;
    wait(var_1);
    var_3 destroy();
    thread maps\favela_code::animated_sheet();
}

_id_D1CD()
{
    var_0 = 110;
    var_1 = getent( "hotel_door_left", "targetname" );
    var_2 = getent( "hotel_door_right", "targetname" );
    var_1 rotateyaw( var_0 * -1, 0.05 );
    var_2 rotateyaw( var_0, 0.05 );
    common_scripts\utility::flag_wait( "car_getting_shot" );
    common_scripts\utility::flag_wait( "player_is_ducking" );
    wait 1;
    var_1 rotateyaw( var_0, 0.05 );
    var_2 rotateyaw( var_0 * -1, 0.05 );
}

_id_CCBE( var_0 )
{
    common_scripts\utility::flag_wait( "driver_dead" );
    soundscripts\_snd::snd_message( "start_interior_vehicle_open" );
    var_0 thread maps\_utility::play_sound_on_tag( "scn_favela_car_glass_shatter", "TAG_GLASS_FRONT_D" );
    var_0 showpart( "TAG_GLASS_FRONT_D" );
    var_0 showpart( "TAG_BLOOD" );
    var_0 showpart( "TAG_STEERING_WHEEL_BLOOD" );
    var_0 showpart( "TAG_KEY_CHAIN_BLOOD" );
    var_0 showpart( "TAG_SHIFTER_BLOOD" );
    var_0 showpart( "TAG_SUN_SHADE_BLOOD" );
    wait 2.1;
    var_0 showpart( "TAG_BROKEN_GLASS" );
    var_0 hidepart( "TAG_GLASS_FRONT" );
    var_0 thread maps\_utility::play_sound_on_tag( "scn_favela_car_glass_explode", "TAG_GLASS_FRONT_D" );
    earthquake( 0.7, 0.75, var_0.origin, 72 );
    playfxontag( common_scripts\utility::getfx( "car_glass_interior" ), var_0, "TAG_GLASS_FRONT_FX" );

    foreach ( var_2 in level._id_B216 )
    {
        if ( isdefined( var_2 ) )
            var_2 delete();
    }
}

_id_BDED( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "bullet_head_blood_cam" ), var_0, "J_Head" );
    playfxontag( common_scripts\utility::getfx( "blood_dashboard_splatter" ), var_0, "J_Head" );
    common_scripts\_exploder::exploder( "car_smoking" );
    common_scripts\_exploder::exploder( "road_ambient" );
    wait 0.1;
    var_0 maps\_utility::ent_flag_set( "kill_custom_nameplate" );
    // var_0 setmodel( "body_seal_soccom_assault_b_blk_bloody" );
    // var_0 codescripts\character::setheadmodel( "head_seal_soccom_e_bloody" );
    common_scripts\utility::flag_set( "driver_dead" );
}

_id_C6D8( var_0 )
{
    var_1 = "scn_favela_merc_horn_loop";
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( var_1, ( -40.0, -75.0, 10.0 ) );
    wait 60;
    var_0 notify( "stop sound" + var_1 );
}

_id_BA7C()
{
    wait 6.6;
    playfxontag( common_scripts\utility::getfx( "blood" ), self, "J_Hip_RI" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "blood" ), self, "J_SpineLower" );
}

_id_C2B1()
{
    wait 7.1;
    playfxontag( common_scripts\utility::getfx( "blood" ), self, "J_Hip_RI" );
    wait 0.2;
    playfxontag( common_scripts\utility::getfx( "blood" ), self, "J_SpineLower" );
    wait 1.2;
    playfxontag( common_scripts\utility::getfx( "blood" ), self, "J_Head" );
}

_id_BEF2()
{
    wait 9.5;
    playfxontag( common_scripts\utility::getfx( "blood" ), self, "J_Shoulder_RI" );
}

_id_C100( var_0 )
{
    self endon( "death" );
    var_1 = 15;
    var_2 = 10;
    var_3 = 15;
    var_4 = 29;
    var_5 = 8;
    var_6 = 0.1;
    var_7 = 0.3;
    var_8 = var_0 gettagorigin( "tag_glass_front_fx" );
    var_9 = var_0 gettagangles( "tag_glass_front_fx" );
    var_10 = anglestoright( var_9 );
    var_11 = anglestoup( var_9 );
    var_12 = var_8 - var_10 * var_4;
    var_13 = var_8 + var_10 * var_4;
    var_14 = var_8 + var_11 * var_5;
    var_15 = var_8 - var_11 * var_5;
    common_scripts\utility::flag_set( "car_getting_shot" );
    var_16 = [];

    for ( var_17 = 0; var_17 < var_1; var_17++ )
    {
        var_18 = randomfloatrange( var_4 * -1, var_4 );
        var_19 = randomfloatrange( var_5 * -1, var_5 );
        var_20 = var_8;
        var_20 += var_10 * var_18;
        var_20 += var_11 * var_19;
        var_16[var_16.size] = var_20;
    }

    for ( var_17 = 0; var_17 < var_1; var_17++ )
    {
        self shoot( 100.0, var_16[var_17] );
        var_21 = var_16[var_17];
        var_22 = vectornormalize( var_21 - self gettagorigin( "tag_flash" ) );
        level._id_B216[var_17] = spawnfx( common_scripts\utility::getfx( "glass_exit" ), var_21, var_22 );
        _func_15E( level._id_B216[var_17], 1 );
        triggerfx( level._id_B216[var_17] );

        if ( !common_scripts\utility::flag( "player_is_ducking" ) )
        {
            if ( isalive( level.player ) && var_17 >= var_2 && var_17 <= var_3 )
                thread _id_A8AD();
        }

        wait(randomfloatrange( var_6, var_7 ));
    }

    foreach ( var_24 in level._id_B216 )
    {
        if ( isdefined( var_24 ) )
            var_24 delete();
    }
}

_id_A8AD()
{
    level.player notify( "shot_next_frame" );
    wait 0.05;
    level.player enabledeathshield( 0 );
    level.player enablehealthshield( 0 );
    level.player disableinvulnerability();
    level.player dodamage( level.player.health + 50000, level.player geteye() );
    wait 0.05;

    if ( isalive( level.player ) )
        level.player kill();
}

_id_C2D7()
{
    level waittill( "end_scene" );
    self.allowdeath = 1;
    self.a.nodeath = 1;
    self.noragdoll = 1;
    self setcontents( 0 );
    self kill();
}

_id_D0C1()
{
    var_0 = getent( "mission_objective_location_1", "targetname" );
    objective_add( 2, "invisible", &"FAVELA_OBJ_CAPTURE_ROJAS", ( 0.0, 0.0, 0.0 ) );
    objective_state_nomessage( 2, "active_waypoint" );
    objective_add( 3, "current", &"FAVELA_OBJ_SEARCH", var_0.origin );
    _func_1E7( 3, 1 );
    common_scripts\utility::flag_wait( "cleared_favela" );
    wait 7;
    objective_state( 3, "done" );
    var_0 = getent( "mission_objective_location_end", "targetname" );
    objective_add( 4, "current", &"FAVELA_OBJ_REACH_TOP", var_0.origin );
    _func_1E7( 4, 1 );
}

_id_C93F()
{
    level._id_C904 = maps\_utility::spawn_targetname( "meat_spawner", 1 );
    level._id_C904 thread maps\_utility::magic_bullet_shield();
    level._id_C904.animname = "meat";
    // level._id_C904 maps\favela_code::setheadmodel( "head_seal_soccom_c" );
    // level._id_C904 setmodel( "body_seal_soccom_assault_d" );
    
    // if ( isdefined( level._id_C904.headmodel ) )
    //     level._id_C904 detach( level._id_C904.headmodel );

    level._id_C904 character\gfl\randomizer_tf_141::main();
    level._id_C904.ignoresuppression = 1;
    level._id_C904._id_909A = 1000;
    level._id_B0E8.ignoresuppression = 1;
    level._id_B0E8._id_909A = 1000;
}

_id_BED2()
{
    var_0 = getentarray( "fav_animated_chain", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2.animname = "chain";
        var_2 maps\_anim::setanimtree();
        var_2 thread maps\_anim::anim_loop_solo( var_2, "idle" );
        var_3 = var_2 maps\_utility::getanim( "idle" );
        var_4 = randomfloat( 1 );
        var_2 setanimtime( var_3[0], var_4 );
    }
}

_id_C421()
{
    maps\_utility::trigger_wait( "favela_opening_civilians_spawn", "targetname" );
    var_0 = getentarray( "favela_opening_civilian_spawner", "targetname" );
    thread maps\favela_code::_id_AD8B();
    common_scripts\utility::array_thread( var_0, ::_id_C875 );
    common_scripts\utility::array_thread( var_0, maps\favela_code::_id_C445 );
    thread maps\favela_code::_id_B757();
    thread maps\favela_code::_id_BC0B();
    thread _id_C5BF();
    common_scripts\utility::flag_set( "favela_civilians_spawned" );
}

_id_C875()
{
    if ( isdefined( self.script_noteworthy ) )
        return;

    var_0 = maps\_utility::spawn_ai( 1 );
    var_0 endon( "death" );

    if ( !isdefined( level._id_C204 ) )
        level._id_C204 = [];

    level._id_C204[level._id_C204.size] = var_0;
    wait 0.05;
    var_0.alertlevel = "noncombat";

    if ( !isdefined( self.animation ) )
    {
        var_0 waittill( "combat" );
        var_1 = getnode( "favela_civ_flee_node_opening", "targetname" );
        var_0 thread maps\_utility::follow_path( var_1, 0, maps\favela_code::_id_B8EB );
        var_0 thread maps\favela_code::_id_C236();
        var_0.usechokepoints = 0;
        return;
    }

    var_2 = undefined;

    if ( isdefined( self.script_linkto ) )
        var_2 = common_scripts\utility::get_linked_ent();
    else
    {
        var_2 = spawn( "script_origin", self.origin );
        var_2.angles = self.angles;
    }

    var_3 = self.animation;
    var_2 thread maps\_anim::anim_generic_loop( var_0, var_3, "stop_idle_anim" );
    var_0 waittill( "combat" );
    common_scripts\utility::flag_set( "favela_civilians_fleeing" );
    wait(randomfloat( 1.5 ));
    var_2 notify( "stop_idle_anim" );
    var_0 notify( "stop_idle_anim" );
    var_0 stopanimscripted();
    var_0.usechokepoints = 1;
    var_1 = getnode( "favela_civ_flee_node_opening", "targetname" );
    var_0 thread maps\_utility::follow_path( var_1, 0, maps\favela_code::_id_B8EB );
    var_0 thread maps\favela_code::_id_C236();
}

_id_C5BF()
{
    var_0 = getent( "favela_civilians_scream_ent", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    common_scripts\utility::flag_wait( "favela_civilians_fleeing" );
    var_0 playsound( "scn_favela_civ_outofhere_screams" );
    var_0 moveto( var_1.origin, 6.0, 4.0, 2.0 );
}

_id_D037()
{
    common_scripts\utility::flag_wait( "favela_music" );
    level endon( "favela_music" );
    thread _id_BCA8();
    var_0 = "mus_favela_tension";
    var_1 = maps\_utility::musiclength( var_0 );

    while ( common_scripts\utility::flag( "favela_music" ) )
    {
        thread maps\_utility::music_play( var_0 );
        wait(var_1);
    }
}

_id_BCA8()
{
    common_scripts\utility::flag_waitopen( "favela_music" );
    maps\_utility::music_stop( 3 );
}

_id_CF83()
{
    common_scripts\utility::flag_wait( "upper_village_music" );
    level endon( "faust_appearance_1" );
    maps\_utility::radio_dialogue( "favela_cmt_theirterritory" );
    var_0 = "mus_favela_uppervillage_start";
    var_1 = maps\_utility::musiclength( var_0 );

    while ( !common_scripts\utility::flag( "faust_appearance_1" ) )
    {
        thread maps\_utility::music_play( var_0, 2.0 );
        wait(var_1);
    }
}

_id_BB06()
{
    level endon( "faust_music" );
    thread _id_B736();
    var_0 = "mus_favela_moneyrun";
    var_1 = maps\_utility::musiclength( var_0 );

    while ( common_scripts\utility::flag( "faust_music" ) )
    {
        thread maps\_utility::music_play( var_0 );
        wait(var_1);
    }
}

_id_B736()
{
    common_scripts\utility::flag_waitopen( "faust_music" );
    maps\_utility::music_stop( 3 );
}

_id_D3D9()
{
    level endon( "cleared_favela" );
    var_0 = getentarray( "random_favela_background_runner", "targetname" );
    common_scripts\utility::flag_wait( "favela_enemies_spawned" );

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_2 in var_0 )
        {
            if ( common_scripts\utility::flag( "cleared_favela" ) )
                return;

            var_2.count = 1;
            var_2 thread maps\_utility::spawn_ai( 1 );
            wait(randomintrange( 4, 8 ));
        }
    }
}

_id_CFFF()
{
    common_scripts\utility::flag_wait( "faust_appearance_1" );
    thread maps\_utility::autosave_by_name( "faust_appearance_1" );
    thread _id_B1C3();
    var_0 = maps\_utility::spawn_targetname( "faust_spawner_1", 1 );
    var_0.name = "Rojas";
    var_0.cheat._id_D4B8 = 1;
    var_0 thread maps\favela_code::_id_B2E3( "faust", "run" );
    var_0 thread _id_C0EE( 2 );
    var_0 thread maps\favela_code::monitor_faust_run( "faust_appearance_1_end" );
    thread maps\_utility::music_stop( 3.0 );
    wait 3.2;
    common_scripts\utility::flag_set( "faust_music" );
    thread _id_BB06();
}

_id_C0EE( var_0 )
{
    level notify( "objective_on_faust" );
    level endon( "objective_on_faust" );
    objective_onentity( 2, self, ( 0.0, 0.0, 70.0 ) );
    objective_setpointertextoverride( 2, &"FAVELA_OBJ_INTERCEPT" );
    setsaveddvar( "objectiveFadeTooFar", 0.1 );
    self waittill( "death" );
    objective_position( 2, ( 0.0, 0.0, 0.0 ) );
    objective_setpointertextoverride( 2 );
    setsaveddvar( "objectiveFadeTooFar", 25 );
}

_id_B1C3()
{
    maps\_utility::radio_dialogue( "favela_cmt_spottedfaust" );
    maps\_utility::radio_dialogue( "favela_cmt_unharmed" );
    wait 5.0;
    maps\_utility::radio_dialogue( "favela_cmt_cutoff" );
}

_id_AE8F()
{
    common_scripts\utility::flag_wait( "faust_appearance_2" );

    while ( !common_scripts\utility::flag( "faust_appearance_1_end" ) )
    {
        if ( common_scripts\utility::flag( "faust_appearance_3" ) || common_scripts\utility::flag( "faust_appearance_4" ) )
        {
            common_scripts\utility::flag_set( "skipped_faust_appearance_2" );
            return;
        }

        wait 0.5;
    }

    var_0 = maps\_utility::spawn_targetname( "faust_spawner_2", 1 );
    var_0.name = "Rojas";
    var_0.cheat._id_D4B8 = 1;
    var_0 thread maps\favela_code::_id_B2E3( "faust", "run" );
    var_0 thread _id_C0EE( 3 );
    var_0 thread maps\favela_code::monitor_faust_run( "faust_appearance_2_end" );
}

_id_D584()
{
    common_scripts\utility::flag_wait( "faust_appearance_3" );
    thread _id_A8FF();

    while ( !common_scripts\utility::flag( "faust_appearance_2_end" ) && !common_scripts\utility::flag( "skipped_faust_appearance_2" ) )
    {
        if ( common_scripts\utility::flag( "faust_appearance_4" ) )
        {
            common_scripts\utility::flag_set( "skipped_faust_appearance_3" );
            return;
        }

        wait 0.5;
    }

    var_0 = maps\_utility::spawn_targetname( "faust_spawner_3", 1 );
    var_0.name = "Rojas";
    var_0.cheat._id_D4B8 = 1;
    var_0 thread maps\favela_code::_id_B2E3( "faust", "run" );
    var_0 thread _id_C0EE( 4 );
    var_0 thread maps\favela_code::monitor_faust_run( "faust_appearance_3_end" );
}

_id_A8FF()
{
    level endon( "ending_sequence_dialog" );
    level endon( "player_approaching_final_stairs" );
    level endon( "stop_all_misc_dialog" );
    maps\_utility::radio_dialogue( "favela_cmt_backtowards" );

    if ( common_scripts\utility::flag( "ending_sequence_dialog" ) )
        return;

    maps\_utility::radio_dialogue( "favela_cmt_doubleback" );
}

_id_ADBB()
{
    common_scripts\utility::flag_wait( "faust_appearance_4" );

    while ( !common_scripts\utility::flag( "faust_appearance_3_end" ) && !common_scripts\utility::flag( "skipped_faust_appearance_3" ) )
        wait 0.5;

    var_0 = maps\_utility::spawn_targetname( "faust_spawner_4", 1 );
    var_0.name = "Rojas";
    var_0.cheat._id_D4B8 = 1;
    var_0 thread maps\favela_code::_id_B2E3( "faust", "run" );
    var_0 thread _id_C0EE( "end" );
}

_id_C5C4()
{
    common_scripts\utility::flag_wait( "start_street_sequences_1" );
    thread _id_D198();
    thread _id_CD2F();
    thread _id_ACF3();
}

_id_D198()
{
    var_0 = getent( "civilian_180_runaway", "targetname" );
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles;
    var_2 = var_0.animation;
    var_3 = getnode( var_0.target, "targetname" );
    var_4 = var_0 maps\_utility::spawn_ai( 1 );
    var_4 endon( "death" );
    var_4.allowdeath = 1;
    var_4 _id_B3AB::_id_BEBA( "upperbody" );
    var_1 maps\_anim::anim_generic( var_4, var_2 );
    var_4.goalradius = 32;
    var_4 thread maps\favela_code::_id_D053();
    var_4 setgoalnode( var_3 );
}

_id_CD2F()
{
    var_0 = getent( "wounded_guy_1", "targetname" );
    var_1 = getent( "wounded_guy_helper_1", "targetname" );
    var_2 = var_0.animation;
    var_3 = var_1.animation;
    var_4 = var_0 common_scripts\utility::get_linked_ent();
    var_5 = getnode( var_1.target, "targetname" );
    var_6 = var_0 maps\_utility::spawn_ai( 1 );
    var_7 = var_1 maps\_utility::spawn_ai( 1 );
    var_6.a.nodeath = 1;
    var_4 thread maps\_anim::anim_generic_first_frame( var_6, var_2 );
    var_4 thread maps\_anim::anim_generic_first_frame( var_7, var_3 );
    var_7 endon( "death" );
    maps\_utility::trigger_wait( "wounded_guy_1_proximity", "targetname" );
    var_4 thread maps\_anim::anim_generic( var_6, var_2 );
    var_4 maps\_anim::anim_generic( var_7, var_3 );
    var_4 thread maps\_anim::anim_generic_first_frame( var_6, var_2 );
    var_7.goalradius = 32;
    var_7 thread maps\favela_code::_id_D053();
    var_7 setgoalnode( var_5 );
}

_id_ACF3()
{
    var_0 = getent( "destroyed_tanker", "targetname" );
    var_1 = getent( "force_explosion_car_2", "script_noteworthy" );
    level._id_D41B thread maps\_utility::delaythread( 0.0, ::_id_D25A );
    level._id_D41B maps\_utility::delaythread( 2.5, ::_id_D25A );
    var_1 thread maps\_utility::delaythread( 3.2, maps\_utility::destructible_force_explosion );
    level._id_D41B maps\_utility::delaythread( 4.0, ::_id_D25A );
    level._id_D41B maps\_utility::delaythread( 5.0, ::_id_D25A );
}

_id_D25A( var_0 )
{
    var_1 = randomintrange( 5, 10 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        thread maps\_utility::play_sound_on_entity( "scn_wpn_ak47_npc_close_flee" );
        wait(randomfloatrange( 0.1, 0.3 ));
    }
}

_id_AD9F()
{
    level._id_C904.goalradius = 32;
    level._id_B0E8.goalradius = 32;
    level._id_C904 maps\_utility::set_goal_node_targetname( "meat_first_node" );
    level._id_B0E8 maps\_utility::set_goal_node_targetname( "royce_first_node" );
    thread _id_D132();
    thread _id_C788();
    common_scripts\utility::flag_wait( "favela_gate_dialog_done" );
    common_scripts\utility::flag_wait_either( "soccer_start", "favela_civilians_fleeing" );
    var_0 = getnode( "favela_warning_node", "targetname" );

    if ( !common_scripts\utility::flag( "favela_civilians_alerted" ) )
    {
        level._id_B0E8 maps\_anim::anim_single_solo( level._id_B0E8, "favela_ryc_warning" );
        level._id_C904 thread maps\_anim::anim_single_solo( level._id_C904, "favela_met_rogerthat" );
        var_0 maps\_anim::anim_reach_solo( level._id_C904, "favela_warning_jump" );
    }

    level._id_C904 thread maps\_utility::set_goal_node_targetname( "favela_warning_guy_first_node" );
    level._id_B0E8 thread maps\_utility::set_goal_node_targetname( "favela_other_guy_first_node" );
    level._id_C904 maps\_utility::enable_ai_color();
    level._id_B0E8 maps\_utility::enable_ai_color();

    if ( !common_scripts\utility::flag( "favela_civilians_alerted" ) )
    {
        var_0 maps\_anim::anim_single_solo( level._id_C904, "favela_warning_jump" );
        var_0 maps\_anim::anim_single_solo( level._id_C904, "favela_warning_landing" );
    }

    common_scripts\utility::flag_set( "favela_enemies_spawned" );
    thread maps\favela_code::_id_D31B();
    thread maps\_utility::activate_trigger( "favela_spawn_trigger", "script_noteworthy", level.player );
    thread maps\_utility::battlechatter_on( "allies" );
    thread maps\_utility::battlechatter_on( "axis" );
}

_id_C788()
{
    level waittill( "soccer_start" );
    common_scripts\utility::flag_set( "soccer_start" );
}

_id_D132()
{
    common_scripts\utility::flag_wait( "favela_civilians_spawned" );
    thread _id_ABB5();
    thread _id_B8CD();
}

_id_ABB5()
{
    level endon( "favela_civilians_alerted" );
    level.player common_scripts\utility::waittill_any( "grenade_fire", "weapon_fired" );
    thread _id_C43B();
}

_id_B8CD()
{
    level endon( "favela_civilians_alerted" );
    common_scripts\utility::flag_wait( "player_entered_favela" );
    thread _id_C43B();
}

_id_C43B()
{
    common_scripts\utility::flag_set( "favela_civilians_alerted" );
    wait 1.5;

    foreach ( var_1 in level._id_C204 )
    {
        if ( isdefined( var_1 ) )
            var_1.alertlevel = "alert";
    }
}

_id_BF63()
{
    common_scripts\utility::flag_wait( "favela_enemies_spawned" );
    wait 7.0;
    maps\_utility::radio_dialogue( "favela_cmt_fullbattalion" );
    maps\_utility::radio_dialogue( "favela_ryc_withyou" );
    common_scripts\utility::flag_wait( "player_in_lower_favela_shanty" );
    maps\_utility::radio_dialogue( "favela_cmt_doingok" );
    maps\_utility::radio_dialogue( "favela_ryc_nosign" );
    maps\_utility::radio_dialogue( "favela_cmt_keepsearching" );
    wait 2.5;
    maps\_utility::radio_dialogue( "favela_ryc_moveup" );
    common_scripts\utility::flag_set( "allow_meat_death" );
}

_id_D1F1()
{
    common_scripts\utility::flag_wait( "cleared_favela" );
    thread maps\favela_code::_id_AFD1();
    maps\_utility::radio_dialogue( "favela_cmt_cuthimoff" );
    maps\_utility::radio_dialogue( "favela_cmt_keepgoing" );
    wait 1.0;
    maps\_utility::radio_dialogue( "favela_cmt_notime" );
}

_id_B747()
{
    common_scripts\utility::flag_wait( "allow_meat_death" );
    common_scripts\utility::flag_wait( "player_midway_through_lower_favela" );
    level._id_C904 thread _id_D4D4();
    level._id_C904 maps\_utility::stop_magic_bullet_shield();
    wait 0.05;
    level._id_C904.health = 1;
    level._id_C904 thread _id_C643();
}

_id_C643()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "force_meat_death" );
    magicbullet( "dragunov", ( -5427.0, -77.0, 1790.0 ), self geteye() );
    wait 0.1;
    self kill();
}

_id_D4D4()
{
    self waittill( "death" );
    maps\_utility::radio_dialogue( "favela_ryc_meatisdown" );
    common_scripts\utility::flag_set( "allow_royce_death" );
}

_id_B4B1()
{
    common_scripts\utility::flag_wait( "force_meat_death" );
    common_scripts\utility::flag_wait( "allow_royce_death" );
    level._id_B0E8 thread _id_A857();
    level._id_B0E8 maps\_utility::stop_magic_bullet_shield();
    wait 0.05;
    level._id_B0E8.health = 1;
    level._id_B0E8 thread _id_CB0F();
}

_id_CB0F()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "force_kill_royce" );
    magicbullet( "dragunov", ( -5427.0, -77.0, 1790.0 ), self geteye() );
    wait 0.1;
    self kill();
}

_id_A857()
{
    self waittill( "death" );
    var_0 = 0;

    if ( isdefined( self ) && isdefined( self.origin ) )
        var_0 = level.player maps\_utility::player_looking_at( self.origin, cos( 45 ) );

    if ( !var_0 )
        maps\_utility::radio_dialogue( "favela_ryc_imhit" );
}

_id_C7DC()
{
    level endon( "faust_appearance_1" );
    common_scripts\utility::flag_wait( "dialog_watch_rooftops" );
    maps\_utility::radio_dialogue( "favela_cmt_watchrooftops" );
    wait 4.0;
    maps\_utility::radio_dialogue( "favela_cmt_stilltracking" );
    maps\_utility::radio_dialogue( "favela_gst_duffelbag" );
    maps\_utility::radio_dialogue( "favela_cmt_intercept" );
    wait 12;
    maps\_utility::radio_dialogue( "favela_cmt_yourside" );
    maps\_utility::radio_dialogue( "favela_gst_pinyoudown" );
    maps\_utility::radio_dialogue( "favela_cmt_lostsightagain" );
    maps\_utility::radio_dialogue( "favela_gst_alleysbelow" );
    maps\_utility::radio_dialogue( "favela_cmt_stayonhim" );
    wait 6;
    common_scripts\utility::flag_wait( "dialog_faust_through_market" );
    maps\_utility::radio_dialogue( "favela_gst_cuttingthru" );
    maps\_utility::radio_dialogue( "favela_cmt_headforrooftops" );
    wait 3.0;
    maps\_utility::radio_dialogue( "favela_gst_wayaround" );
    wait 6;
    common_scripts\utility::flag_wait( "dialog_faust_in_sights" );
    maps\_utility::radio_dialogue( "favela_gst_halfklick" );
    maps\_utility::radio_dialogue( "favela_cmt_eyeopen" );
    wait 8;
    maps\_utility::radio_dialogue( "favela_gst_legshot" );
    maps\_utility::radio_dialogue( "favela_cmt_donotengage" );
    maps\_utility::radio_dialogue( "favela_gst_rogerthat2" );
    wait 12;
    maps\_utility::radio_dialogue( "favela_cmt_nowheretogo" );
    maps\_utility::radio_dialogue( "favela_cmt_traphimuphere" );
    wait 12;
    maps\_utility::radio_dialogue( "favela_gst_jumpedfence" );
    maps\_utility::radio_dialogue( "favela_cmt_goingleft" );
    wait 12;
    maps\_utility::radio_dialogue( "favela_cmt_closertoyourpart" );
}

_id_CE6B()
{
    level endon( "ending_sequence_dialog" );
    level endon( "player_approaching_final_stairs" );
    level endon( "stop_all_misc_dialog" );
    common_scripts\utility::flag_wait( "player_at_final_bend" );
    maps\_utility::radio_dialogue( "favela_cmt_motorcycle" );
    var_0 = getent( "nohesnot_location", "targetname" );
    var_0 common_scripts\utility::play_sound_in_space( "favela_gst_nohesnot" );
    maps\_utility::radio_dialogue( "favela_cmt_dontshoothim" );
    wait 0.3;
    maps\_utility::radio_dialogue( "favela_cmt_onthemove" );
    wait 4.0;
    maps\_utility::radio_dialogue( "favela_cmt_anotherfence" );
    wait 4.0;
    maps\_utility::radio_dialogue( "favela_cmt_corraling" );
    wait 10;
    maps\_utility::radio_dialogue( "favela_gst_whereishe" );
    wait 0.2;
    maps\_utility::radio_dialogue( "favela_cmt_slidingrooftops" );
    wait 0.2;
    maps\_utility::radio_dialogue( "favela_gst_anotherlegshot" );
    wait 0.2;
    maps\_utility::radio_dialogue( "favela_cmt_carryhimback" );
}

_id_C545()
{
    common_scripts\utility::flag_wait( "player_approaching_final_stairs" );

    if ( common_scripts\utility::flag( "ending_sequence_dialog" ) )
        return;

    level endon( "ending_sequence_dialog" );
    maps\_utility::radio_dialogue_stop();
    maps\_utility::radio_dialogue( "favela_cmt_farright" );
    maps\_utility::radio_dialogue( "favela_gst_rogerthat" );
}

_id_CCAD()
{
    maps\_utility::trigger_wait( "ending_sequence", "targetname" );
    thread _id_C96B();
    thread maps\_utility::battlechatter_off( "allies" );
    thread maps\_utility::battlechatter_off( "axis" );
    var_0 = getent( "ending_node", "targetname" );
    var_1 = maps\_utility::spawn_targetname( "ending_soap_spawner", 1 );
    var_1.animname = "mactavish";
    var_1 maps\_utility::set_ignoreme( 1 );
    var_1 maps\_utility::set_ignoreall( 1 );
    var_1 thread maps\_utility::magic_bullet_shield();
    var_2 = maps\_utility::spawn_targetname( "ending_faust_spawner", 1 );
    var_2.name = "Rojas";
    var_2.animname = "faust";
    var_2.cheat._id_D4B8 = 1;
    var_2 maps\_utility::set_ignoreme( 1 );
    var_2 maps\_utility::set_ignoreall( 1 );
    var_2 thread maps\_utility::magic_bullet_shield();
    var_2 thread maps\favela_code::_id_AF38();
    var_2 thread _id_C0EE( "end" );
    objective_position( 4, ( 0.0, 0.0, 0.0 ) );
    var_3 = getent( "ending_car", "targetname" );
    var_3 useanimtree( level.scr_animtree["car"] );
    var_3.animname = "car";
    level._id_B8D7 = maps\_utility::spawn_targetname( "ending_ghost_spawner", 1 );
    level._id_B8D7.animname = "ghost";
    level._id_B8D7 maps\_utility::set_ignoreme( 1 );
    level._id_B8D7 maps\_utility::set_ignoreall( 1 );
    level._id_B8D7 thread maps\_utility::magic_bullet_shield();
    var_4[0] = var_1;
    var_4[1] = var_2;
    var_4[2] = var_3;
    var_4[3] = level._id_B8D7;
    var_0 maps\_anim::anim_first_frame( var_4, "ending_takedown" );
    common_scripts\utility::flag_wait( "player_in_ending_area" );
    thread maps\favela_code::animated_payphone();
    var_2 maps\_utility::waittill_player_lookat( 0.65, undefined, undefined, 7.0 );
    soundscripts\_snd::snd_message( "start_ending_sequence_mix" );
    maps\favela_aud::set_ending_slowmo_timescale();
    common_scripts\utility::flag_set( "ending_sequence_started" );
    common_scripts\utility::flag_clear( "faust_music" );
    common_scripts\utility::flag_clear( "favela_music" );
    thread maps\_utility::music_stop( 1.0 );
    level.player thread maps\_utility::play_sound_on_entity( "mus_favela_moneyrun_endfall" );
    var_0 thread maps\_anim::anim_single( var_4, "ending_takedown" );
    wait 22.5;
    fade_out_level();
    maps\_utility::nextmission();
}

fade_out_level()
{
    soundscripts\_snd::snd_message( "start_fade_out_level" );
    var_0 = 1.0;
    setsaveddvar( "compass", 0 );
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "actionSlotsHide", 1 );
    setsaveddvar( "hud_showStance", 0 );
    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = 0;
    var_1 setshader( "black", 640, 480 );
    var_1.alignx = "left";
    var_1.aligny = "top";
    var_1.horzalign = "fullscreen";
    var_1.vertalign = "fullscreen";
    var_1.alpha = 0;
    var_1 fadeovertime( var_0 );
    var_1.alpha = 1;
    wait(var_0);
    level.player freezecontrols( 1 );
    maps\_utility::enableplayerweapons( 0 );
}

_id_C96B()
{
    common_scripts\utility::flag_set( "ending_sequence_dialog" );

    if ( !common_scripts\utility::flag( "ending_sequence_started" ) )
        maps\_utility::radio_dialogue( "favela_gst_getaway" );

    common_scripts\utility::flag_wait( "ending_sequence_started" );
    common_scripts\utility::flag_set( "start_final_dialog" );
}

_id_B298()
{
    wait 0.15;

    if ( !maps\_utility::player_looking_at( self.origin, undefined, 1 ) )
        return;

    var_0 = 0.5;
    var_1 = 0.65;
    var_2 = 0.1;
    var_3 = 0.2;
    var_4 = 2.0;
    soundscripts\_snd::snd_message( "start_ending_slowmo" );
    objective_position( 2, ( 0.0, 0.0, 0.0 ) );
    level.player thread maps\_utility::play_sound_on_entity( "slomo_whoosh" );
    maps\_utility::slowmo_start();
    maps\_utility::slowmo_setspeed_slow( var_3 );
    maps\_utility::slowmo_setlerptime_in( var_0 );
    maps\_utility::slowmo_lerp_in();
    level.player setmovespeedscale( var_2 );
    wait(var_4 * var_3);
    soundscripts\_snd::snd_message( "stop_ending_slowmo" );
    level.player thread maps\_utility::play_sound_on_entity( "slomo_whoosh" );
    maps\_utility::slowmo_setlerptime_out( var_1 );
    maps\_utility::slowmo_lerp_out();
    maps\_utility::slowmo_end();
    level.player setmovespeedscale( 1.0 );
    wait 1;
    objective_state( 2, "done" );
    objective_state_nomessage( 4, "done" );
}
#using_animtree("destructibles");

_id_D3A9()
{
    var_0 = getentarray( "destructible_toy", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.destructible_type == "toy_ceiling_fan" )
            var_2 _meth_83D4( %me_fanceil1_spin, randomfloatrange( 0.25, 0.35 ) );
    }
}

_id_B027()
{
    self endon( "death" );
    var_0 = getent( "runner_shootback", "targetname" );
    var_1 = getnode( "runner_shootingback", "targetname" );
    var_0 waittill( "trigger" );
    self.animname = "civilian_custom";
    maps\_utility::teleport_ai( var_1 );
    thread maps\_anim::anim_single_solo( self, "rojas_assistant_run_gun" );
    self waittill( "damage" );
    self stopanimscripted();
}

_id_C8D1( var_0 )
{
    wait 3;
    var_0 maps\_utility::waittill_notetrack_or_damage( "pull_start" );
    level.player _meth_830F( 1 );
}

_id_C65A( var_0 )
{
    level endon( "torture_sequence_done" );
    wait 7;
    playfxontag( level._effect["flare_ambient_favela"], var_0, "tag_fx_flame" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_favela_captive_in_chair" );
}
