// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\airport_mission_select_cam::_id_C490();
        return;
    }

    if ( maps\airport_beautiful_corner::_id_C662() )
        return;

    _id_C21D();
    level._id_CB4C = 0;
    maps\_utility::default_start( ::start_intro );
    maps\_utility::add_start( "intro", ::start_intro, "[intro] -> assault the security checkpoint", ::intro_main );
    maps\_utility::add_start( "stairs", ::_id_C34E, "[stairs] -> proceed up the escalaters", ::_id_AFD4 );
    maps\_utility::add_start( "massacre", ::_id_AF85, "[massacre] -> massacre the remaing civilians", ::_id_B8A1 );
    maps\_utility::add_start( "gate", ::_id_ACF9, "[gate] -> walk through the sea of dead bodies", ::_id_D163 );
    maps\_utility::add_start( "basement", ::_id_D554, "[basement] -> move through the basement", ::_id_C945 );
    maps\_utility::add_start( "tarmac", ::_id_CC35, "[tarmac] -> assault the tarmac", ::_id_D3A6 );
    maps\_utility::add_start( "escape", ::start_escape, "[escape] -> escape from the airport", ::_id_A7F6 );
    maps\_utility::add_start( "player_nofail", ::_id_BC44, "[intro] -> assault the security checkpoint", ::intro_main );
    maps\_utility::add_start( "grigs", ::_id_CEBE, "[grigsby test]" );
    maps\airport_challenge::_id_CC24();
    thread airport_fx_volume_groups_setup();
    setsaveddvar( "fx_cast_shadow", 0 );
    _id_C2B0();
    maps\_compass::setupminimap( "compass_map_airport" );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", " 1173 4033  3 " );
    thread maps\airport_code::h2_solarsystem_rotating();
    maps\airport_code::h2_security_cameras_setup();
    setsaveddvar( "ai_turnAnim_detectLowerAngleTurns", 1 );
    setsaveddvar( "xanim_disableFootIK", 1 );
    setsaveddvar( "r_corpseRemovalThreshold", "0.75" );
}

_id_C21D()
{
    common_scripts\utility::flag_init( "do_not_save" );
    common_scripts\utility::flag_init( "friendly_fire_good_kill_line" );
    common_scripts\utility::flag_init( "friendly_fire_good_kill_line2" );
    common_scripts\utility::flag_init( "friendly_fire_no_kill_line" );
    common_scripts\utility::flag_init( "friendly_fire_checkfire_line" );
    common_scripts\utility::flag_init( "friendly_fire_dist_check" );
    common_scripts\utility::flag_init( "friendly_fire_kill_check" );
    common_scripts\utility::flag_init( "friendly_fire_pause_flash" );
    common_scripts\utility::flag_init( "friendly_fire_pause_fire" );
    common_scripts\utility::flag_init( "player_dynamic_move_speed" );
    common_scripts\utility::flag_init( "player_DMS_allow_sprint" );
    common_scripts\utility::flag_init( "team_initialized" );
    common_scripts\utility::flag_init( "elevator_up_done" );
    common_scripts\utility::flag_init( "lobby_scene_animate" );
    common_scripts\utility::flag_init( "lobby_scene_pre_animate" );
    common_scripts\utility::flag_init( "intro_slowmo_start" );
    common_scripts\utility::flag_init( "start_civilians" );
    common_scripts\utility::flag_init( "lobby_open_fire" );
    common_scripts\utility::flag_init( "lobby_to_stairs_go" );
    common_scripts\utility::flag_init( "stairs_go_up" );
    common_scripts\utility::flag_init( "lobby_cleanup_spray" );
    common_scripts\utility::flag_init( "lobby_cleanup" );
    common_scripts\utility::flag_init( "lobby_to_stairs_flow" );
    common_scripts\utility::flag_init( "lobby_ai_peeps_dead" );
    common_scripts\utility::flag_init( "team_at_top_of_stairs" );
    common_scripts\utility::flag_init( "yuri_ee_playing" );
    common_scripts\utility::flag_init( "stairs_upperdeck_civs_dead" );
    common_scripts\utility::flag_init( "upperdeck_flow1" );
    common_scripts\utility::flag_init( "upperdeck_flow1b" );
    common_scripts\utility::flag_init( "upperdeck_flow1c" );
    common_scripts\utility::flag_init( "upperdeck_flow3" );
    common_scripts\utility::flag_init( "upperdeck_flow4" );
    common_scripts\utility::flag_init( "massacre_play_sounds" );
    common_scripts\utility::flag_init( "massacre_rentacop_stop" );
    common_scripts\utility::flag_init( "massacre_rentacop_stop_dead" );
    common_scripts\utility::flag_init( "massacre_rentacop_rush" );
    common_scripts\utility::flag_init( "massacre_kill_rush" );
    common_scripts\utility::flag_init( "massacre_rentacop_runaway_go" );
    common_scripts\utility::flag_init( "massacre_rentacop_row1_fighter_go" );
    common_scripts\utility::flag_init( "massacre_rentacop_row1_runner_go" );
    common_scripts\utility::flag_init( "massacre_rentacop_rambo" );
    common_scripts\utility::flag_init( "massacre_rentacop_rambo_dead" );
    common_scripts\utility::flag_init( "massacre_runners1_dead" );
    common_scripts\utility::flag_init( "massacre_runners2_dead" );
    common_scripts\utility::flag_init( "massacre_runners3_dead" );
    common_scripts\utility::flag_init( "massacre_rentacops_rear_dead" );
    common_scripts\utility::flag_init( "massacre_nadethrow" );
    common_scripts\utility::flag_init( "massacre_decided_nader" );
    common_scripts\utility::flag_init( "massacre_makarov_point_at_rambo" );
    common_scripts\utility::flag_init( "massacre_elevator_start" );
    common_scripts\utility::flag_init( "massacre_elevator_down" );
    common_scripts\utility::flag_init( "massacre_elevator_up" );
    common_scripts\utility::flag_init( "massacre_eleveator_should_come_up" );
    common_scripts\utility::flag_init( "massacre_elevator_prepare_nade" );
    common_scripts\utility::flag_init( "massacre_elevator_at_top" );
    common_scripts\utility::flag_init( "massacre_elevator_guys_ready" );
    common_scripts\utility::flag_init( "massacre_elevator_grenade_ready" );
    common_scripts\utility::flag_init( "massacre_elevator_grenade_throw" );
    common_scripts\utility::flag_init( "massacre_elevator_grenade_exp" );
    common_scripts\utility::flag_init( "massacre_line_of_fire_done" );
    common_scripts\utility::flag_init( "gate_main" );
    common_scripts\utility::flag_init( "gate_canned_deaths" );
    common_scripts\utility::flag_init( "gate_heli_moveon" );
    common_scripts\utility::flag_init( "basement_mak_speach" );
    common_scripts\utility::flag_init( "basement_moveout2" );
    common_scripts\utility::flag_init( "basement_mak_saw_riot" );
    common_scripts\utility::flag_init( "basement_near_entrance" );
    common_scripts\utility::flag_init( "tarmac_pre_heat_fight" );
    common_scripts\utility::flag_init( "tarmac_too_far" );
    common_scripts\utility::flag_init( "tarmac_killed_security" );
    common_scripts\utility::flag_init( "tarmac_open_fire" );
    common_scripts\utility::flag_init( "tarmac_retreat1" );
    common_scripts\utility::flag_init( "tarmac_retreat2" );
    common_scripts\utility::flag_init( "tarmac_retreat3" );
    common_scripts\utility::flag_init( "tarmac_advance4" );
    common_scripts\utility::flag_init( "tarmac_retreat4" );
    common_scripts\utility::flag_init( "tarmac_advance6" );
    common_scripts\utility::flag_init( "tarmac_retreat5" );
    common_scripts\utility::flag_init( "tarmac_retreat6" );
    common_scripts\utility::flag_init( "tarmac_advance8" );
    common_scripts\utility::flag_init( "tarmac_bcs" );
    common_scripts\utility::flag_init( "tarmac_kill_friendly_bsc" );
    common_scripts\utility::flag_init( "tarmac_2ndfloor_move_back" );
    common_scripts\utility::flag_init( "tarmac_van_guys_far_enough" );
    common_scripts\utility::flag_init( "tarmac_van_guys_spawn" );
    common_scripts\utility::flag_init( "tarmac_van_guys2_spawn" );
    common_scripts\utility::flag_init( "tarmac_van_mid_path" );
    common_scripts\utility::flag_init( "tarmac_van_almost_end_path" );
    common_scripts\utility::flag_init( "tarmac_van_end_path" );
    common_scripts\utility::flag_init( "tarmac_clear_out_2nd_floor" );
    common_scripts\utility::flag_init( "tarmac_enemies_2ndfloor" );
    common_scripts\utility::flag_init( "escape_van_ready" );
    common_scripts\utility::flag_init( "escape_doorkick" );
    common_scripts\utility::flag_init( "escape_sequence_reach" );
    common_scripts\utility::flag_init( "escape_hold_your_fire" );
    common_scripts\utility::flag_init( "escape_main" );
    common_scripts\utility::flag_init( "escape_sequence_go" );
    common_scripts\utility::flag_init( "escape_player_get_in" );
    common_scripts\utility::flag_init( "escape_player_is_in" );
    common_scripts\utility::flag_init( "escape_sequence_over" );
    common_scripts\utility::flag_init( "escape_player_shot" );
    common_scripts\utility::flag_init( "escape_player_realdeath" );
    common_scripts\utility::flag_init( "end_player_ready" );
    common_scripts\utility::flag_init( "start_ending_sequence" );
    common_scripts\utility::flag_init( "player_is_busted" );
    common_scripts\utility::flag_init( "ambulance_close_door" );
    common_scripts\utility::flag_init( "ambulance_ready_to_leave" );
    common_scripts\utility::flag_init( "cops_arrive" );
    common_scripts\utility::flag_init( "end_makarov_in_place" );
    common_scripts\utility::flag_init( "player_ready_for_proper_ending" );
    common_scripts\utility::flag_init( "player_no_fail" );
    common_scripts\utility::flag_init( "h2_rotating_turbine" );
    common_scripts\utility::flag_init( "elevator_destroyed" );
    common_scripts\utility::flag_init( "delete_massacre_dummies" );
    common_scripts\utility::flag_init( "delete_corpses_back_only" );
}

_id_C2B0()
{
    level._id_ACFA = 1.5;
    setdvar( "scr_elevator_speed", "64" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    _id_B354::main();
    _id_B94F::main();
    _id_B864::main();
    var_0 = [];
    var_1 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( var_3.model == "vehicle_policecar_russia_destructible" )
            var_0 = common_scripts\utility::array_add( var_0, var_3 );
    }

    common_scripts\utility::array_thread( var_0, ::_id_C3B7 );
    _id_A8A4::main();
    _id_BEEE::main();
    _id_D19C::main();
    maps\airport_anim::main();
    maps\_load::main();
    _id_B1D6::main();
    maps\airport_lighting::main();
    maps\_drone_civilian::init();
    maps\_drone_ai::init();
    level.drone_lookahead_value = 60;
    level._id_CA5B = 2.75;
    level._id_CBD2 = 1;
    maps\airport_aud::main();
    thread _id_B9BD();
    thread maps\airport_code::_id_CA14();
    common_scripts\utility::array_thread( getentarray( "glass_delete", "targetname" ), maps\airport_code::_id_CFE6 );
    precachemodel( "h2_airport_restaurant_destruction_final_a" );
    precachemodel( "projectile_us_smoke_grenade" );
    precachemodel( "com_cellphone_on" );
    precachemodel( "com_metal_briefcase" );
    precachemodel( "electronics_pda" );
    precachemodel( "tag_origin" );
    precachemodel( "body_airport_com_e" );
    precachemodel( "head_airport_yuri" );
    precacheitem( "m203_m4" );
    precacheitem( "usp_airport" );
    precacheitem( "m4_grunt_airport" );
    precacheitem( "saw_airport" );
    precacheitem( "rpg_straight" );
    precacherumble( "tank_rumble" );
    precacherumble( "damage_heavy" );
    precacherumble( "light_2s" );
    precacheshader( "overlay_airport_death" );
    precacheshader( "white" );
    precacheshellshock( "airport" );
    precachestring( &"AIRPORT_FAIL_POLICE_BARRICADE" );
    precachestring( &"disturbing_content_in_game_popup" );
    precacheitem( "colt45" );
    precachemodel( "h2_viewbody_airport" );
    precachemodel( "body_urban_civ_female_b_a" );
    precachemodel( "body_urban_civ_female_b_b" );
    precachemodel( "body_urban_civ_female_a_b" );
    precachemodel( "body_urban_civ_female_a_g" );
    precachemodel( "body_urban_civ_female_a_p" );
    precachemodel( "body_urban_civ_female_a_y" );
    precachemodel( "body_urban_civ_male_aa_a" );
    precachemodel( "body_urban_civ_male_aa_b" );
    precachemodel( "body_urban_civ_male_aa_c" );
    precachemodel( "body_urban_civ_male_ab_a" );
    precachemodel( "body_urban_civ_male_ab_b" );
    precachemodel( "body_urban_civ_male_ab_c" );
    precachemodel( "body_urban_civ_male_ac_a" );
    precachemodel( "body_urban_civ_male_ac_b" );
    precachemodel( "body_urban_civ_male_ac_c" );
    precachemodel( "body_urban_civ_male_ba_a" );
    precachemodel( "body_urban_civ_male_ba_b" );
    precachemodel( "body_urban_civ_male_bb_a" );
    precachemodel( "body_urban_civ_male_bb_b" );
    precachemodel( "body_urban_civ_male_bc_blue" );
    precachemodel( "body_urban_civ_male_bc_gray" );
    precachemodel( "body_urban_civ_male_bc_red" );
    precachemodel( "body_urban_civ_male_bc_white" );
    precachemodel( "body_secret_service_smg" );

    precachemodel( "h2_gfl_ump45_viewbody" );
    precachemodel( "h2_gfl_ump45_viewhands" );
    precachemodel( "h2_gfl_ump45_viewhands_player" );

    thread maps\airport_code::_id_AA37();
    common_scripts\utility::array_thread( getentarray( "jet_engine", "targetname" ), maps\airport_code::_id_AA14 );
    maps\_vehicle::build_light_override( "script_vehicle_policecar_russia", "police_light", "tag_origin", "vfx/lights/light_sedan_police_airport", "police_lights", 0 );
    level.default_goalheight = 128;
    maps\_utility::add_hint_string( "grenade_launcher", &"SCRIPT_LEARN_GRENADE_LAUNCHER", maps\airport_code::_id_C7EA );
    thread maps\airport_code::h2_elevator_destruction_swap();
    var_5 = getentarray( "widescreen_monitor", "targetname" );
    common_scripts\utility::array_thread( var_5, ::handle_widescreen_monitor );
    level.entities_to_delete_before_massacre = [];
    common_scripts\utility::array_call( getentarray( "h2_intro_dead_people", "targetname" ), ::hide );
    thread maps\airport_code::corpse_deletion_monitor();
}

handle_widescreen_monitor()
{
    self setcandamage( 1 );
    var_0 = getent( self.target, "targetname" );
    self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

    if ( isdefined( var_0 ) )
        var_0 delete();

    if ( var_5 != "MOD_GRENADE_SPLASH" )
        var_1 *= 3;

    self physicslaunchclient( var_4, var_1 * var_3 );
}

intro_main()
{
    level.grenadeiconmaxrange = getdvarfloat( "cg_hudGrenadeIconMaxRangeFrag" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    common_scripts\utility::array_thread( getentarray( "intro_security_run_die", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_C57A );
    common_scripts\utility::array_thread( getentarray( "lobby_to_stairs_flow", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B435 );
    common_scripts\utility::array_thread( getentarray( "lobby_to_stairs_flow", "targetname" ), maps\airport_code::_id_D1C7 );
    thread maps\airport_code::_id_B4F6();
    thread _id_CF34();
    thread _id_C33F();
    thread _id_B418();
    thread maps\airport_code::_id_D12C();
    thread maps\airport_code::_id_AC0B( "scn_airport_running_screams2" );
    waitframe();
    var_0 = _id_AA2B();

    if ( var_0 )
    {
        setdvar( "disturbing_content_popup_status", "in_progress" );

        while ( getdvar( "disturbing_content_popup_status" ) == "in_progress" )
            waitframe();
    }

    if ( isdefined( level.nextmission ) )
        return;

    maps\_utility::add_wait( common_scripts\utility::flag_wait, "lobby_to_stairs_flow" );
    maps\_utility::add_func( maps\_utility::delaythread, 2, maps\airport_code::_id_AC0B, "scn_airport_running_screams1" );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "team_initialized" );
    thread _id_B5BF();
    common_scripts\utility::flag_wait( "elevator_up_done" );
    thread maps\airport_code::h2_intro_lugage_se();
    _id_D278();
    maps\_utility::activate_trigger( "lobby_to_stairs_flow", "target" );
    level notify( "stop_explode_targets" );

    if ( !common_scripts\utility::flag( "do_not_save" ) )
        thread maps\_utility::autosave_by_name( "lobby_to_stairs" );

    level._id_CAE2 = 0;
    var_1 = common_scripts\utility::getstruct( "intro_elevator_anim_node", "targetname" );
    var_2 = getnodearray( "lobby_moveup_nodes", "targetname" );

    foreach ( var_4 in level.team )
        var_4 thread _id_D10C( var_1, var_2 );

    var_2 = getnodearray( "prestairs_nodes", "targetname" );

    foreach ( var_7 in var_2 )
        level.team[var_7.script_noteworthy] thread maps\airport_code::_id_AAE4( var_7 );

    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_set_speed_lobby" );
    maps\_utility::add_func( maps\_utility::flag_clear_delayed, "_escalator_on", 3 );
    thread maps\_utility::do_wait();
}

_id_D10C( var_0, var_1 )
{
    self notify( "Stop_Shooting" );
    var_0 maps\_anim::anim_single_solo( self, "walking_toward_stairs" );

    foreach ( var_3 in var_1 )
    {
        if ( level.team[var_3.script_noteworthy] == self )
        {
            level.team[var_3.script_noteworthy].disableexits = 1;
            level.team[var_3.script_noteworthy] thread maps\airport_code::_id_CBB1( var_3 );
        }
    }
}

_id_AA2B()
{
    thread _id_BCEB();

    if ( level.player getlocalplayerprofiledata( "canSkipOffensiveMissions" ) != 1 )
        return 0;

    level.player openluimenu( &"disturbing_content_in_game_popup" );
    return 1;
}

_id_BCEB()
{
    setdvar( "ui_skip_graphic_material", "" );

    for (;;)
    {
        if ( getdvar( "ui_skip_graphic_material" ) == "1" )
        {
            level notify( "level_skipped" );
            maps\_utility::nextmission();
            return;
        }
        else if ( getdvar( "ui_skip_graphic_material" ) == "0" )
        {
            setdvar( "ui_skip_graphic_material", "" );
            setdvar( "disturbing_content_popup_status", "closed" );
        }

        waitframe();
    }
}

_id_C33F()
{
    common_scripts\utility::flag_wait( "elevator_up_done" );
    maps\_utility::delaythread( 1, maps\airport_code::_id_CF9B, 20, 0.25 );
    common_scripts\utility::flag_wait( "lobby_open_fire" );
    maps\airport_code::_id_CF9B( 26, 0.5 );
    common_scripts\utility::flag_wait( "lobby_to_stairs_go" );
    maps\_utility::delaythread( 1.5, maps\airport_code::_id_CF9B, 26, 2 );
    common_scripts\utility::flag_wait( "player_set_speed_lobby" );
    maps\airport_code::_id_CF9B( 42, 1.5 );
    common_scripts\utility::flag_wait( "player_set_speed_stairs" );
    maps\airport_code::_id_CF9B( 42, 0.25 );
    common_scripts\utility::flag_wait( "player_set_speed_upperstairs" );
    maps\airport_code::_id_CF9B( 35, 1 );
}

_id_CF34()
{
    var_0 = _id_BAA9();

    foreach ( var_2 in var_0 )
        var_2 hide();

    common_scripts\utility::flag_wait( "lobby_open_fire" );
    wait 7;
    var_0["stairs_dead_body3"] show();
    wait 1;
    var_0["stairs_dead_body2"] show();
    wait 1;
    var_0["stairs_dead_body"] show();
    common_scripts\utility::flag_wait( "player_set_speed_stairs" );

    foreach ( var_2 in var_0 )
        var_2 show();
}
#using_animtree("generic_human");

_id_BAA9()
{
    var_0 = getentarray( "upperdeck_dead_body", "targetname" );
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1["upperdeck_dead_body" + var_4] = var_3;

    var_1["stairs_dead_body"] = getent( "stairs_dead_body", "targetname" );
    var_1["stairs_dead_body2"] = getent( "stairs_dead_body2", "targetname" );
    var_1["stairs_dead_body3"] = getent( "stairs_dead_body3", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 attach( "head_urban_civ_male_a", "" );
        var_3 useanimtree( #animtree );
        var_3 thread maps\_anim::anim_generic( var_3, var_3.script_animation );
        var_3 setanimtime( maps\_utility::getanim_generic( var_3.script_animation ), 1 );
    }

    return var_1;
}

_id_B418()
{
    wait 24.5;
    var_0 = maps\airport_anim::_id_C909();
    var_1 = getent( "lobby_blood", "targetname" );
    var_2 = getent( "intro_rope", "targetname" );
    var_2 delete();
    var_1 hide();

    for ( var_3 = 1; var_3 <= 15; var_3++ )
    {
        var_4 = common_scripts\utility::getstruct( "intro_lobby_anim_group_" + var_3, "targetname" );

        if ( isdefined( var_4 ) )
            var_4 thread maps\airport_code::_id_CAAE( var_0 );
    }

    common_scripts\utility::array_thread( getentarray( "lobby_people", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_C807 );
    maps\_utility::delaythread( 1, maps\_utility::activate_trigger, "lobby_people_spawner", "targetname" );
    wait 3;
    wait 5.5;
    common_scripts\utility::flag_set( "lobby_scene_pre_animate" );
    wait 1.0;
    common_scripts\utility::flag_set( "lobby_scene_animate" );
    wait 3.25;
    common_scripts\utility::flag_wait( "lobby_open_fire" );
    var_5 = getent( "intro_line_of_fire_trig", "targetname" );
    var_5 thread maps\airport_code::_id_AE00( "lobby_to_stairs_go", level.team );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "intro_line_of_fire_trig_final" );
    maps\_utility::add_abort( common_scripts\utility::flag_wait, "lobby_to_stairs_go" );
    level.player maps\_utility::add_call( ::kill );
    thread maps\_utility::do_wait();
    common_scripts\utility::array_thread( getentarray( "intro_bank_poll", "targetname" ), maps\airport_code::_id_BEB4 );
    var_1 common_scripts\utility::delaycall( 4, ::show );
    wait 1;
}

_id_B5BF()
{
    thread maps\airport_code::_id_C8E1();
    thread maps\airport_code::_id_C282();
    var_0 = common_scripts\utility::getstruct( "intro_elevator_anim_node", "targetname" );
    var_1 = [];

    foreach ( var_3 in level.team )
        var_3 thread _id_D369( var_0 );

    var_5 = getent( "snd_origin_intro_crowd", "targetname" );
    var_5 common_scripts\utility::delaycall( 18.0, ::playsound, "scn_airport_crowd_opening" );
}

_id_D369( var_0 )
{
    wait 5;
    wait 10;
    var_0 thread maps\_anim::anim_single_solo( self, "elevator_scene" );
}

_id_D278()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    var_0 = getnodearray( "intro_initial_firing_positions", "targetname" );

    foreach ( var_2 in var_0 )
        level.team[var_2.script_noteworthy] thread maps\airport_code::_id_C043( var_2 );

    common_scripts\utility::flag_wait( "lobby_open_fire" );

    foreach ( var_5 in level.team )
        var_5.ignoreall = 0;

    var_7 = getent( "snd_origin_intro_crowd", "targetname" );
    var_7 playsound( "scn_airport_crowd_opening_terror" );
    var_2 = common_scripts\utility::getstruct( "lobby_scream_track", "targetname" );
    thread maps\airport_code::_id_B1A7( var_2, "scn_airport_crowd_opening_running", 150 );
    maps\_utility::delaythread( 1, maps\airport_code::h2_secrutiy_sign_se );
    wait 0.5;
    thread maps\airport_code::_id_C468( common_scripts\utility::getstructarray( "lobby_dyn_targets", "targetname" ) );
    wait 2;
    thread maps\airport_code::_id_C468( common_scripts\utility::getstructarray( "lobby_dyn_targets_lights", "targetname" ), 96, 3.5 );
    wait 5.35;
    thread maps\airport_code::_id_C468( common_scripts\utility::getstructarray( "lobby_dyn_targets_last", "targetname" ) );
}

_id_AFD4()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    thread maps\airport_code::upperdeck_update_enemy_targets();
    common_scripts\utility::array_thread( getentarray( "upperdeck_crawler", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_C1A6 );
    common_scripts\utility::array_thread( getentarray( "upperdeck_crawlers_1", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_C1A6 );
    common_scripts\utility::array_thread( getentarray( "upperdeck_crawlers2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_C1A6 );
    common_scripts\utility::array_thread( getentarray( "upperdeck_crawlers_wait", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_C1A6 );
    common_scripts\utility::array_thread( getentarray( "upperdeck_initial_runners", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B9AB );
    common_scripts\utility::array_thread( getentarray( "upperdeck_runners4", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B4A0, "upperdeck_flow4" );
    common_scripts\utility::array_thread( getentarray( "upperdeck_runners3", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_BAA6 );
    common_scripts\utility::array_thread( getentarray( "upperdeck_runners2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B4A0, "upperdeck_flow2" );
    common_scripts\utility::array_thread( getentarray( "upperdeck_runners1b", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B4A0, "upperdeck_flow1b" );
    common_scripts\utility::array_thread( getentarray( "upperdeck_runners1c", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B4A0, "upperdeck_flow1c" );
    common_scripts\utility::array_thread( getentarray( "upperdeck_canned_deaths", "targetname" ), maps\airport_code::_id_AE63, "stairs_top_open_fire" );
    common_scripts\utility::array_thread( getentarray( "upperdeck_fakesound", "targetname" ), maps\airport_code::_id_C01F );
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "upperdeck_turn_on_arrival", "script_noteworthy" ), maps\airport_code::_id_BAAD );
    getent( "stairs_cop", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_A881 );
    getent( "yuri_ee", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_D508 );
    thread maps\airport_code::_id_A872();
    var_0 = getent( "stairs_line_of_fire_trig_l", "targetname" );
    var_1 = [];
    var_1[var_1.size] = level.team["makarov"];
    var_1[var_1.size] = level.team["m4"];
    var_2 = getent( "stairs_line_of_fire_trig_r", "targetname" );
    var_3 = [];
    var_3[var_3.size] = level.team["saw"];
    var_3[var_3.size] = level.team["shotgun"];
    var_1[0] maps\_utility::add_wait( maps\_utility::ent_flag_wait, "stairs_at_top" );
    var_1[1] maps\_utility::add_wait( maps\_utility::ent_flag_wait, "stairs_at_top" );
    var_0 maps\_utility::add_func( maps\airport_code::_id_AE00, "stairs_upperdeck_civs_dead", var_1 );
    thread maps\_utility::do_wait_any();
    var_3[0] maps\_utility::add_wait( maps\_utility::ent_flag_wait, "stairs_at_top" );
    var_3[1] maps\_utility::add_wait( maps\_utility::ent_flag_wait, "stairs_at_top" );
    var_2 maps\_utility::add_func( maps\airport_code::_id_AE00, "stairs_upperdeck_civs_dead", var_3 );
    thread maps\_utility::do_wait_any();
    var_4 = common_scripts\utility::getstruct( "upperdeck_scream_track", "targetname" );
    var_5 = common_scripts\utility::getstruct( "upperdeck_scream_track2", "targetname" );
    var_6 = common_scripts\utility::getstruct( "upperdeck_scream_track1b", "targetname" );
    var_7 = common_scripts\utility::getstruct( "upperdeck_scream_track1c", "targetname" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "upperdeck_flow1" );
    maps\_utility::add_func( maps\airport_code::_id_B1A7, var_4, "scn_airport_running_screams1", 150 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "upperdeck_flow1b" );
    maps\_utility::add_func( maps\airport_code::_id_B1A7, var_6, "scn_airport_running_screams2", 150 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "upperdeck_flow1c" );
    maps\_utility::add_func( maps\airport_code::_id_B1A7, var_7, "scn_airport_running_screams3", 150 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "upperdeck_flow2" );
    maps\_utility::add_func( maps\airport_code::_id_B1A7, var_5, "scn_airport_running_screams1", 150 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "upperdeck_flow4" );
    maps\_utility::add_func( maps\airport_code::_id_B1A7, var_5, "scn_airport_running_screams2", 150 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "stairs_go_up" );
    thread maps\_utility::do_wait();
    thread _id_BFC3();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "stairs_go_up" );
    maps\_utility::add_abort( common_scripts\utility::flag_wait, "player_set_speed_stairs" );
    maps\_utility::add_func( maps\airport_code::_id_CF9B, 42, 0.25 );
    thread maps\_utility::do_wait();
    var_8 = getnodearray( "upperdeck_start_nodes", "targetname" );

    foreach ( var_10 in var_8 )
        level.team[var_10.script_noteworthy] thread maps\airport_code::_id_C050( var_10 );

    common_scripts\utility::flag_wait( "stairs_upperdeck_civs_dead" );
    common_scripts\utility::flag_wait( "player_set_speed_stairs" );
    var_8 = common_scripts\utility::getstructarray( "upperdeck_team_path", "targetname" );

    foreach ( var_10 in var_8 )
        level.team[var_10.script_noteworthy] thread maps\airport_code::_id_BA0D( var_10 );

    common_scripts\utility::flag_wait( "upperdeck_save" );

    if ( !common_scripts\utility::flag( "do_not_save" ) )
        thread maps\_utility::autosave_by_name( "upperdeck_flow2" );
}

_id_BFC3()
{
    common_scripts\utility::flag_wait( "player_set_speed_lobby" );

    if ( !common_scripts\utility::flag( "do_not_save" ) )
        thread maps\_utility::autosave_by_name( "stair_bottom" );

    common_scripts\utility::flag_wait( "player_set_speed_upperstairs" );

    if ( !common_scripts\utility::flag( "do_not_save" ) )
        thread maps\_utility::autosave_by_name( "stair_top" );
}

_id_B8A1()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    thread maps\airport_code::_id_D07D();
    var_0 = common_scripts\utility::getstructarray( "massacre_nodes", "targetname" );

    foreach ( var_2 in var_0 )
        level.team[var_2.script_noteworthy] thread maps\airport_code::_id_B0D5( var_2 );

    var_4 = getent( "massacre_rentacop_rush_guy", "target" );
    var_4.origin += ( 0.0, 0.0, -10000.0 );

    foreach ( var_6 in level.entities_to_delete_before_massacre )
    {
        if ( !_func_2A5( var_6 ) )
            var_6 delete();
    }

    level.entities_to_delete_before_massacre = undefined;
    common_scripts\utility::array_call( getentarray( "h2_intro_dead_people", "targetname" ), ::show );
    common_scripts\utility::array_thread( getentarray( "massacre_dummy", "targetname" ), maps\airport_code::_id_CCFB );
    getent( "massacre_snd", "targetname" ) thread _id_AC78();
    common_scripts\utility::array_thread( getentarray( "massacre_rentacop_stop", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_CB44 );
    common_scripts\utility::array_thread( getentarray( "massacre_rentacop_rush_guy", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_BCAD );
    common_scripts\utility::array_thread( getentarray( "massacre_rentacop_runaway_guy", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B81F );
    common_scripts\utility::array_thread( getentarray( "massacre_rentacop_row1_runner", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_AAF0 );
    common_scripts\utility::array_thread( getentarray( "massacre_rentacop_row1_fighter", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_BC9A );
    common_scripts\utility::array_thread( getentarray( "massacre_rentacop_row1_defender", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_BA5D );
    common_scripts\utility::array_thread( getentarray( "massacre_rentacops_rambo", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_ABFB );
    common_scripts\utility::array_thread( getentarray( "massacre_rentacops_rear", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_C720 );
    common_scripts\utility::array_thread( getentarray( "massacre_rentacops_stairs", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B0C6 );
    common_scripts\utility::array_thread( getentarray( "massacre_runners1", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B20E );
    common_scripts\utility::array_thread( getentarray( "massacre_runners2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B363, "scn_airport_running_screams1" );
    common_scripts\utility::array_thread( getentarray( "massacre_runners3", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B363, "scn_airport_running_screams2" );
    common_scripts\utility::array_thread( getentarray( "massacre_crawler", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_AE46 );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B963 );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B963 );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_pilot", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_utility::set_ignoreme, 1 );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D50D );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D50D );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_pilot", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D50D );
    var_8 = getent( "tarmac_littlebird", "targetname" );
    var_8 maps\_utility::add_spawn_function( ::_id_CD05 );
    thread _id_AC42();
    thread maps\airport_code::_id_A8FE();
    thread maps\airport_code::_id_C027();
    thread _id_B8FE( "massacre_runners1", "massacre_runners1_dead" );
    thread _id_B8FE( "massacre_runners2", "massacre_runners2_dead" );
    thread _id_B8FE( "massacre_runners3", "massacre_runners3_dead" );

    foreach ( var_4 in getentarray( "massacre_rentacop_stop_trigs", "targetname" ) )
    {
        var_4 maps\_utility::add_wait( maps\_utility::waittill_msg, "trigger" );
        maps\_utility::add_func( common_scripts\utility::trigger_off, "massacre_rentacop_stop_trigs", "targetname" );
        thread maps\_utility::do_wait();
    }

    foreach ( var_4 in getentarray( "massacre_rentacops_rambo_trigs", "targetname" ) )
    {
        var_4 maps\_utility::add_wait( maps\_utility::waittill_msg, "trigger" );
        maps\_utility::add_func( common_scripts\utility::trigger_off, "massacre_rentacops_rambo_trigs", "targetname" );
        thread maps\_utility::do_wait();
    }

    var_13 = getentarray( "massacre_rentacop_extras", "targetname" );
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacop_rush" );
    maps\_utility::add_func( common_scripts\utility::array_thread, var_13, maps\_utility::spawn_ai, 1 );
    thread maps\_utility::do_wait();
    level.team["m4"] maps\_utility::add_wait( maps\_utility::ent_flag_wait, "massacre_firing_into_crowd" );
    maps\_utility::add_func( maps\_utility::flag_set_delayed, "massacre_play_sounds", 1.25 );
    thread maps\_utility::do_wait_any();
    level.team["m4"] maps\_utility::add_wait( maps\_utility::ent_flag_wait, "massacre_firing_into_crowd" );
    maps\_utility::add_func( maps\_utility::flag_set_delayed, "massacre_civ_animate", 10 );
    thread maps\_utility::do_wait_any();
    maps\_utility::trigger_wait( "massacre_rentacops_rear", "target" );
    wait 0.1;
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacop_stop" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "friendly_fire_pause_flash" );
    thread maps\_utility::do_wait();
    var_14 = maps\_utility::get_living_ai_array( "massacre_rentacops_rear", "script_noteworthy" );
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_14 );
    maps\_utility::add_func( common_scripts\utility::flag_set, "massacre_rentacops_rear_dead" );
    thread maps\_utility::do_wait();

    foreach ( var_16 in var_14 )
    {
        level maps\_utility::add_wait( maps\_utility::trigger_wait, "massacre_player_too_far", "targetname" );
        var_16 maps\_utility::add_func( maps\_utility::send_notify, "stop_blindfire" );
        var_16 maps\_utility::add_func( maps\_utility::anim_stopanimscripted );
        var_16 maps\_utility::add_func( maps\_utility::set_ignoreall, 0 );
        var_16 maps\_utility::add_func( maps\_utility::set_favoriteenemy, level.player );
        var_16 maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
        level maps\_utility::add_abort( common_scripts\utility::flag_wait, "massacre_nadethrow" );
        thread maps\_utility::do_wait();
    }

    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacops_stairs_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacops_rear_dead" );
    level maps\_utility::add_abort( common_scripts\utility::flag_wait, "do_not_save" );
    maps\_utility::add_func( maps\_utility::autosave_by_name, "massacre" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacops_stairs_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacops_rear_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacop_runaway_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacop_row1_fighter_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacop_row1_runner_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacop_rambo_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_runners1_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_runners2_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_runners3_dead" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "gate_main" );
    maps\_utility::add_func( common_scripts\utility::flag_clear, "friendly_fire_pause_flash" );
    maps\_utility::add_func( common_scripts\utility::flag_clear, "friendly_fire_pause_fire" );
    thread maps\_utility::do_wait();
}

_id_CD05()
{
    common_scripts\utility::flag_wait( "littlebird_stop_threadfx" );
    self notify( "stop_kicking_up_dust" );
}

_id_B8FE( var_0, var_1 )
{
    maps\_utility::trigger_wait( var_0, "target" );
    wait 0.1;
    var_2 = maps\_utility::get_living_ai_array( var_0, "script_noteworthy" );

    if ( var_2.size )
        maps\_utility::waittill_dead_or_dying( var_2 );

    common_scripts\utility::flag_set( var_1 );
}

_id_AC42()
{
    common_scripts\utility::flag_wait( "massacre_rentacop_stop_dead" );
    maps\airport_code::_id_CF9B( 33, 1 );
    common_scripts\utility::flag_wait( "massacre_rentacops_rear_dead" );
    maps\airport_code::_id_CF9B( 35, 1 );
}

_id_AC78()
{
    common_scripts\utility::flag_wait( "massacre_play_sounds" );
    self playloopsound( "scn_airport_crowd_terminal_loop" );
    common_scripts\utility::flag_wait( "massacre_civ_animate" );
    self stopsounds();
    self playsound( "scn_airport_crowd_terminal_end" );
}

_id_D163()
{
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "gate_main" );
    maps\_utility::add_func( maps\airport_code::_id_CF9B, 27, 2 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "gate_heli_moveon" );
    maps\_utility::add_func( maps\_utility::delaythread, 1, maps\airport_code::_id_CF9B, 38, 2 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "gate_player_off_stairs" );
    maps\_utility::add_func( maps\airport_code::_id_CF9B, 27, 0.5 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( maps\_utility::trigger_wait, "gate_crawler", "target" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "gate_canned_deaths" );
    thread maps\_utility::do_wait();
    var_0 = getnodearray( "gate_moveup_nodes", "targetname" );

    foreach ( var_2 in var_0 )
        level.team[var_2.script_noteworthy] thread maps\airport_code::_id_BA3D( var_2 );

    common_scripts\utility::array_thread( getentarray( "gate_canned_deaths", "targetname" ), maps\airport_code::_id_AE63, "gate_canned_deaths" );
    common_scripts\utility::array_thread( getentarray( "gate_crawler", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_BB7E );
    common_scripts\utility::array_thread( getentarray( "gate_runners1", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_C810 );
    common_scripts\utility::array_thread( getentarray( "gate_sliders", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D1AB );
    common_scripts\utility::array_thread( getentarray( "tarmac_van_guys", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B466, "tarmac_van_guys_spawn" );
    common_scripts\utility::array_thread( getentarray( "tarmac_van_guys2", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B466, "tarmac_van_guys2_spawn" );
    getent( "tarmac_swat_van", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_C7F8 );
    getent( "tarmac_swat_van", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_AD42, "scn_airport_police_van_arrive1", "tarmac_swat_van" );
    getent( "tarmac_swat_van2", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_AD42, "scn_airport_police_van_arrive2", "tarmac_swat_van2" );
    getent( "tarmac_swat_van", "targetname" ) thread maps\airport_code::_id_D208( "tarmac_swat_van" );
    getent( "tarmac_swat_van2", "targetname" ) thread maps\airport_code::_id_D208( "tarmac_swat_van2" );
    getent( "tarmac_swat_van2", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::get_van2 );
    common_scripts\utility::array_thread( getentarray( "gate_convoy_delete", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_CABC );
    thread maps\airport_aud::start_emergency_convoy_arrival_sfx();
    thread maps\airport_code::gate_player_sprint();
    thread _id_B39D();
    thread maps\airport_code::_id_BF5A();
    common_scripts\utility::flag_wait( "massacre_rentacops_stairs_dead" );
    level.drs_ahead_test = maps\airport_code::_id_C9C6;
    level.scr_anim["generic"]["DRS_run"] = %casual_killer_jog_a;
    level.scr_anim["generic"]["DRS_sprint"] = %run_lowready_f;
    level.scr_anim["generic"]["DRS_combat_jog"] = %casual_killer_jog_a;
}

_id_B39D()
{
    common_scripts\utility::array_thread( getentarray( "gate_emerg_lights", "targetname" ), maps\airport_code::_id_C910 );
    maps\airport_code::_id_D209();
    common_scripts\utility::flag_wait( "gate_close_gate" );
    maps\_utility::activate_trigger( "gate_runners1", "target" );
    var_0 = getent( "gate_gate_closing", "targetname" );
    var_0 common_scripts\utility::delaycall( 5.75, ::playsound, "scn_airport_sec_gate_buzzer" );
    wait 8.9;
    maps\airport_code::_id_B3F6();
}

_id_C945()
{
    common_scripts\utility::array_thread( getentarray( "gate_drop_chop_guys", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B898 );
    common_scripts\utility::array_thread( getentarray( "basement_sec_runner", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_C14A );
    common_scripts\utility::array_thread( getentarray( "basement_flicker_light", "targetname" ), maps\airport_code::_id_BDB0 );

    foreach ( var_1 in level.team )
    {
        var_1.minimumcorneridletimebeforetwitch = 10000;
        var_1 thread maps\airport_code::_id_B517();
    }

    common_scripts\utility::flag_wait( "basement_near_entrance" );
    common_scripts\utility::flag_clear( "player_dynamic_move_speed" );
    maps\_utility::delaythread( 1, maps\airport_code::_id_CF9B, 42, 1.5 );
    wait 1;
    common_scripts\utility::flag_set( "player_DMS_allow_sprint" );
    var_3 = "makarov_ready";
    var_4 = "m4_ready";
    var_5 = "saw_ready";
    var_6 = "shotgun_ready";
    level common_scripts\utility::waittill_multiple( var_3, var_4, var_5, var_6 );
    common_scripts\utility::flag_wait( "basement_moveout" );

    foreach ( var_1 in level.team )
        var_1 notify( "basement_moveout" );

    setsaveddvar( "xanim_disableFootIK", 0 );
    var_9 = common_scripts\utility::getstruct( "tarmac_breach_origin", "targetname" );
    var_9 notify( "basement_moveout" );
    level.drs_ahead_test = maps\_utility_code::dynamic_run_ahead_test;
    level.scr_anim["generic"]["DRS_run"] = undefined;
    level.permanentclipflag = "permanent_clip_sequence";
    common_scripts\utility::flag_init( level.permanentclipflag );
    common_scripts\utility::flag_set( level.permanentclipflag );
    var_9 = common_scripts\utility::getstruct( "tarmac_breach_origin", "targetname" );
    var_9 maps\_anim::anim_single( level.team, "first_breach_idle" );
    level.permanentclipflag = undefined;
    thread maps\airport_code::_id_D2EA();
    thread maps\airport_code::_id_CF9B( 68, 1 );
    maps\airport_code::_id_C66A();
    common_scripts\utility::flag_clear( "permanent_clip_sequence" );
    common_scripts\utility::flag_set( "basement_moveout2" );

    foreach ( var_1 in level.team )
        var_1.minimumcorneridletimebeforetwitch = undefined;

    maps\airport_code::_id_B704();
    maps\_utility::array_delete( getscriptablearray( "h2_celling_neons", "targetname" ) );
    var_12 = getentarray( "lobby_people", "targetname" );

    foreach ( var_14 in var_12 )
        var_14 delete();

    var_12 = getentarray( "intro_lobby_crowd_2", "targetname" );

    foreach ( var_14 in var_12 )
        var_14 delete();

    clearallcorpses();
}

_id_BFF9()
{
    wait 0.5;
    level._id_D41B.bulletsinclip = 0;
    wait 1;
    level.team["saw"].bulletsinclip = 0;
    wait 0.5;
    level.team["m4"].bulletsinclip = 0;
    wait 0.25;
    level.team["shotgun"].bulletsinclip = 0;
}

_id_D3A6()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    thread maps\airport_code::_id_AD03();
    maps\_utility::add_global_spawn_function( "axis", maps\airport_code::_id_B1C4 );
    common_scripts\utility::array_thread( getentarray( "tarmac_enemies_wave1", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_BC8B );
    common_scripts\utility::array_thread( getentarray( "tarmac_enemies_wave2", "targetname" ), maps\_utility::add_spawn_function, maps\_utility::enable_teamflashbangimmunity );
    common_scripts\utility::array_thread( getentarray( "tarmac_enemies_wave2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_AD7C );
    common_scripts\utility::array_thread( getentarray( "tarmac_enemies_runners", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_CD13 );
    common_scripts\utility::array_thread( getentarray( "tarmac_enemies_2ndfloor", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_BE19 );
    common_scripts\utility::array_thread( getentarray( "riotshield_group_1", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D450 );
    common_scripts\utility::array_thread( getentarray( "riotshield_group_2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D450 );
    common_scripts\utility::array_thread( getentarray( "tarmac_wave1_moveoverride", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D450 );
    common_scripts\utility::array_thread( getentarray( "tarmac_security", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B4EA );
    common_scripts\utility::array_thread( getentarray( "tarmac_security_backup", "script_noteworthy" ), maps\airport_code::_id_B4BD );
    common_scripts\utility::array_thread( getentarray( "tarmac_enemies_2ndfloor", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::h2_enemies_2ndfloor_explosion );
    thread maps\airport_code::_id_C4C3();
    thread maps\airport_code::_id_C113( "riotshield_group_1" );
    thread maps\airport_code::_id_C113( "riotshield_group_2" );
    thread maps\airport_code::_id_A919();
    thread maps\airport_code::_id_BA21( "tarmac_van_guys_spawn", "tarmac_swat_van", "tarmac_van_riotshield_guys" );
    thread maps\airport_code::_id_BA21( "tarmac_van_guys2_spawn", "tarmac_swat_van2", "tarmac_van_riotshield_guys2" );
    thread maps\airport_code::_id_D348();
    thread maps\airport_code::_id_C7C2();
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance3" );
    level.team["saw"] maps\_utility::add_func( maps\airport_code::_id_CEA4 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance4" );
    level.team["shotgun"] maps\_utility::add_func( maps\airport_code::_id_CEA4 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance8" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "tarmac_advance8" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_moveout" );
    maps\_utility::add_func( common_scripts\utility::array_thread, common_scripts\utility::getstructarray( "tarmac_smoke_nodes", "targetname" ), maps\airport_code::_id_B554 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_hear_fsb" );
    maps\_utility::add_func( maps\_utility::flag_set_delayed, "tarmac_heat_fight", 5 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_open_fire" );
    maps\_utility::add_func( maps\airport_code::_id_C5BE );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_enemies_2ndfloor" );
    maps\_utility::add_func( ::_id_C700 );
    maps\_utility::add_func( ::_id_AC71 );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "tarmac_moveout" );

    if ( !common_scripts\utility::flag( "do_not_save" ) )
        thread maps\_utility::autosave_by_name( "tarmac_moveout" );

    var_0 = common_scripts\utility::getstructarray( "tarmac_moveout_nodes", "targetname" );
    var_0 = maps\_utility::array_merge( var_0, getnodearray( "tarmac_moveout_nodes", "targetname" ) );

    foreach ( var_2 in var_0 )
        level.team[var_2.script_noteworthy] thread maps\airport_code::_id_B1C1( var_2 );

    thread maps\airport_code::_id_B31C();
    thread _id_BB41();
    thread _id_BD8B();
    thread kill_godrays_vfx();
    common_scripts\utility::flag_wait( "tarmac_heat_fight" );
    common_scripts\utility::array_thread( level.team, maps\airport_code::_id_B542 );
    common_scripts\utility::array_thread( getentarray( "tarmac_bcs_enemy", "targetname" ), maps\airport_code::_id_B82C );
    thread _id_C69B();
    thread _id_D4DB();
    thread _id_B8E0();
    thread maps\airport_code::_id_A91B();
    maps\airport_code::_id_D125();
}

kill_godrays_vfx()
{
    var_0 = maps\_utility::getfxarraybyid( "godray_airport2_kill" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::pauseeffect();
}

_id_AC71()
{
    wait 0.1;
    var_0 = maps\_utility::get_living_ai_array( "tarmac_enemies_2ndfloor", "script_noteworthy" );
    maps\_utility::waittill_dead_or_dying( var_0, var_0.size - 3 );
    common_scripts\utility::flag_set( "tarmac_2ndfloor_move_back" );
}

_id_C69B()
{
    for ( var_0 = 1; var_0 <= 10; var_0++ )
    {
        var_1 = "tarmac_advance" + var_0 + "_flag";
        var_2 = getent( var_1, "targetname" );
        var_2 = getent( var_2.target, "targetname" );
        common_scripts\utility::flag_wait( var_1 );

        if ( isdefined( var_2.target ) )
            maps\_utility::activate_trigger_with_targetname( var_2.target );

        var_3 = var_2 maps\_utility::get_color_volume_from_trigger();
        var_3 maps\_utility::waittill_volume_dead_or_dying();
        var_2 maps\_utility::activate_trigger();
    }
}

_id_BD8B()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    common_scripts\utility::flag_wait( "tarmac_hear_fsb" );
    var_0 = common_scripts\utility::getstruct( "tarmac_riot_node_retreat1_group1", "targetname" );
    level thread maps\_utility::function_stack( common_scripts\utility::play_sound_in_space, "airport_fsb1_moveingo", var_0.origin );
    level thread maps\_utility::function_stack( common_scripts\utility::play_sound_in_space, "airport_fsbr_servicetunnels", var_0.origin );
    common_scripts\utility::flag_wait( "tarmac_heat_fight" );

    if ( !common_scripts\utility::flag( "tarmac_open_fire" ) )
        level._id_D41B thread maps\_utility::dialogue_queue( "airport_mkv_forzakhaev" );

    common_scripts\utility::flag_wait_or_timeout( "tarmac_open_fire", 1 );

    if ( !common_scripts\utility::flag( "tarmac_open_fire" ) )
        _id_B24C( "airport_fsb2_fsb" );

    common_scripts\utility::flag_wait_or_timeout( "tarmac_open_fire", 5.0 );

    if ( !common_scripts\utility::flag( "tarmac_open_fire" ) )
        level._id_D41B maps\_utility::radio_dialogue( "airport_mkv_fsb" );

    common_scripts\utility::flag_wait( "tarmac_open_fire" );
    _id_B24C( "airport_fsb3_openfire" );
    maps\_utility::battlechatter_on( "axis" );
    maps\_utility::trigger_wait_targetname( "tarmac_advance1" );
    thread _id_C085();
    maps\_utility::trigger_wait_targetname( "tarmac_advance2" );
    thread _id_A92F();
    maps\_utility::trigger_wait_targetname( "tarmac_advance3" );
    thread _id_B84E();
    maps\_utility::trigger_wait_targetname( "tarmac_advance4" );
    thread _id_BBDE();
    maps\_utility::trigger_wait_targetname( "tarmac_advance5" );
    thread _id_B501();
    maps\_utility::trigger_wait_targetname( "tarmac_advance6" );
    thread _id_B3B4();
    maps\_utility::trigger_wait_targetname( "tarmac_advance7" );
    thread _id_C085();
    maps\_utility::trigger_wait_targetname( "tarmac_advance8" );
    thread _id_A92F();
    maps\_utility::trigger_wait_targetname( "tarmac_advance9" );
    thread _id_C224();
    maps\_utility::trigger_wait_targetname( "tarmac_advance10" );
    thread _id_BBDE();
}

_id_C700()
{
    wait 3;
    common_scripts\utility::flag_waitopen( "tarmac_bcs" );
    var_0 = level._id_D41B;
    var_1 = level.team["m4"];
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_0 maps\_utility::dialogue_queue( "contact_2nd_floor" );
    var_1 maps\_utility::dialogue_queue( "contact_2nd_floor" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_A983()
{
    common_scripts\utility::flag_waitopen( "tarmac_bcs" );
    var_0 = level._id_D41B;
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_0 maps\_utility::dialogue_queue( "van_left" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_C085()
{
    common_scripts\utility::flag_waitopen_or_timeout( "tarmac_bcs", level._id_ACFA );

    if ( common_scripts\utility::flag( "tarmac_bcs" ) )
        return;

    var_0 = level._id_D41B;
    var_1 = level.team["m4"];
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_0 maps\_utility::dialogue_queue( "go1" );
    var_1 maps\_utility::dialogue_queue( "moving1" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_A92F()
{
    common_scripts\utility::flag_waitopen_or_timeout( "tarmac_bcs", level._id_ACFA );

    if ( common_scripts\utility::flag( "tarmac_bcs" ) )
        return;

    var_0 = level._id_D41B;
    var_1 = level.team["m4"];
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_0 maps\_utility::dialogue_queue( "ready1" );
    var_1 maps\_utility::dialogue_queue( "go2" );
    var_0 maps\_utility::dialogue_queue( "moving3" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_B84E()
{
    common_scripts\utility::flag_waitopen_or_timeout( "tarmac_bcs", level._id_ACFA );

    if ( common_scripts\utility::flag( "tarmac_bcs" ) )
        return;

    var_0 = level._id_D41B;
    var_1 = level.team["m4"];
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_1 maps\_utility::dialogue_queue( "ready1" );
    var_0 maps\_utility::dialogue_queue( "go2" );
    var_1 maps\_utility::dialogue_queue( "moving2" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_C224()
{
    common_scripts\utility::flag_waitopen_or_timeout( "tarmac_bcs", level._id_ACFA );

    if ( common_scripts\utility::flag( "tarmac_bcs" ) )
        return;

    var_0 = level._id_D41B;
    var_1 = level.team["m4"];
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_1 maps\_utility::dialogue_queue( "ready1" );
    var_0 maps\_utility::dialogue_queue( "go2" );
    var_1 maps\_utility::dialogue_queue( "moving2" );

    if ( !common_scripts\utility::flag( "tarmac_enemies_2ndfloor_dead" ) && !common_scripts\utility::flag( "tarmac_clear_out_2nd_floor" ) )
        var_0 maps\_utility::dialogue_queue( "airport_mkv_behindus" );

    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_BBDE()
{
    common_scripts\utility::flag_waitopen_or_timeout( "tarmac_bcs", level._id_ACFA );

    if ( common_scripts\utility::flag( "tarmac_bcs" ) )
        return;

    var_0 = level._id_D41B;
    var_1 = level.team["m4"];
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_1 maps\_utility::dialogue_queue( "go3" );
    var_0 maps\_utility::dialogue_queue( "moving1" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_B501()
{
    common_scripts\utility::flag_waitopen_or_timeout( "tarmac_bcs", level._id_ACFA );

    if ( common_scripts\utility::flag( "tarmac_bcs" ) )
        return;

    var_0 = level._id_D41B;
    var_1 = level.team["m4"];
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_0 maps\_utility::dialogue_queue( "go3" );
    var_1 maps\_utility::dialogue_queue( "moving3" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
    level endon( "tarmac_bcs" );
    var_1 waittill( "goal" );
    thread _id_B732();
}

_id_B732()
{
    var_0 = level._id_D41B;
    var_1 = level.team["m4"];
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_1 maps\_utility::dialogue_queue( "ready2" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_B3B4()
{
    common_scripts\utility::flag_waitopen_or_timeout( "tarmac_bcs", level._id_ACFA );

    if ( common_scripts\utility::flag( "tarmac_bcs" ) )
        return;

    var_0 = level._id_D41B;
    var_1 = level.team["m4"];
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_0 maps\_utility::dialogue_queue( "ready2" );
    var_1 maps\_utility::dialogue_queue( "go1" );
    var_0 maps\_utility::dialogue_queue( "moving2" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_D4DB()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    common_scripts\utility::flag_init( "tarmac_enemies_wave2" );
    var_0 = getent( "tarmac_enemies_wave2", "target" );
    thread maps\_utility::set_flag_on_trigger( var_0, "tarmac_enemies_wave2" );
    wait 0.5;
    var_1 = maps\airport_code::_id_B9A3();
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_1, 4 );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance1_flag" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_enemies_wave2" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "tarmac_advance1_flag" );
    var_1 = maps\airport_code::_id_B9A3();
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_1, 3 );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance2_flag" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_enemies_wave2" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "tarmac_advance2_flag" );
    var_1 = maps\airport_code::_id_B9A3();
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_1, 3 );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance3_flag" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_enemies_wave2" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "tarmac_advance3_flag" );
    common_scripts\utility::flag_wait( "tarmac_enemies_wave2" );
    wait 0.5;
    var_1 = maps\airport_code::_id_B9A3();
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_1, 3 );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance4_flag" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "tarmac_advance4_flag" );
    common_scripts\utility::flag_wait( "tarmac_van_guys2_spawn" );
    var_1 = maps\airport_code::_id_B9A3();
    var_2 = 3;

    if ( var_1.size > 13 )
        var_2 = var_1.size - 10;

    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_1, var_2 );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance6_flag" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "tarmac_advance6_flag" );
    var_1 = maps\airport_code::_id_B9A3();
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_1, 3 );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance7_flag" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "tarmac_advance7_flag" );
    var_1 = maps\airport_code::_id_B9A3();
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_1, 3 );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance8_flag" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "tarmac_advance8_flag" );
    var_1 = maps\_utility::array_removedead( var_1 );
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_1, 3 );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance9_flag" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "tarmac_advance9_flag" );
    var_1 = maps\_utility::array_removedead( var_1 );
    maps\_utility::add_wait( maps\_utility::waittill_dead_or_dying, var_1, 3 );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "tarmac_advance10_flag" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "tarmac_advance10_flag" );
}

_id_B8E0()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    var_0 = getent( "tarmac_advance6", "targetname" );
    thread maps\_utility::set_flag_on_trigger( var_0, "tarmac_advance6" );
    maps\_utility::trigger_wait( "tarmac_retreat1", "targetname" );
    common_scripts\utility::flag_set( "tarmac_retreat1" );
    _id_B24C( "airport_fsb2_aimforhead" );
    maps\_utility::trigger_wait( "tarmac_retreat2", "targetname" );
    common_scripts\utility::flag_set( "tarmac_retreat2" );
    _id_B24C( "airport_fsb3_aimforheads" );
    maps\_utility::trigger_wait( "tarmac_retreat3", "targetname" );
    common_scripts\utility::flag_set( "tarmac_retreat3" );
    _id_B24C( "airport_fsbr_sendingtruck" );
    maps\_utility::trigger_wait( "tarmac_retreat4", "targetname" );
    common_scripts\utility::flag_set( "tarmac_retreat4" );
    common_scripts\utility::flag_set( "tarmac_advance4" );
    maps\_utility::trigger_wait( "tarmac_retreat5", "targetname" );
    common_scripts\utility::flag_set( "tarmac_retreat5" );
    maps\_utility::trigger_wait( "tarmac_retreat6", "targetname" );
    common_scripts\utility::flag_set( "tarmac_retreat6" );
}

_id_B24C( var_0 )
{
    var_1 = maps\airport_code::_id_B9A3();

    if ( !var_1.size )
        return;

    var_2 = common_scripts\utility::random( var_1 );
    var_2.animname = "generic";
    var_2 thread maps\_utility::dialogue_queue( var_0 );
}

_id_BB41()
{
    maps\_utility::delaythread( 1, maps\airport_code::_id_CF9B, 68, 1 );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_pre_heat_fight" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "player_DMS_allow_sprint" );
    level.player maps\_utility::add_call( ::allowjump, 1 );
    maps\_utility::add_func( maps\_utility::delaythread, 0.1, maps\airport_code::_id_CF9B, 80, 1 );
    maps\_utility::add_func( common_scripts\utility::flag_clear, "player_dynamic_move_speed" );
    maps\_utility::add_abort( common_scripts\utility::flag_wait, "tarmac_heat_fight" );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "tarmac_heat_fight" );
    thread maps\airport_code::_id_CF9B( 100, 5 );
    common_scripts\utility::flag_set( "player_DMS_allow_sprint" );
    common_scripts\utility::flag_clear( "player_dynamic_move_speed" );
    thread maps\_utility::flag_set_delayed( "tarmac_open_fire", 8 );
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    common_scripts\utility::flag_set( "friendly_fire_pause_flash" );
    common_scripts\utility::flag_set( "friendly_fire_pause_fire" );
}

_id_A7F6()
{
    thread maps\airport_code::h2_ambulance_light();
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    getent( "escape_van_dummy", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_C086, "escape_van" );
    getent( "escape_van_driver", "script_noteworthy" ) maps\_utility::add_spawn_function( maps\airport_code::_id_AF16 );
    getent( "escape_van_mate", "script_noteworthy" ) maps\_utility::add_spawn_function( maps\airport_code::_id_D226 );
    common_scripts\utility::array_thread( getentarray( "escape_final_guys", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_CECA );
    common_scripts\utility::array_thread( getentarray( "escape_final_guys2", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_C225 );
    common_scripts\utility::array_thread( getentarray( "escape_police_car_guys", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B15C );
    spawn_cops();
    common_scripts\utility::trigger_off( "escape_get_in_trig", "targetname" );
    common_scripts\utility::flag_wait( "tarmac_enemies_wave1_dead" );
    common_scripts\utility::flag_wait( "tarmac_enemies_wave2_dead" );
    common_scripts\utility::flag_wait( "tarmac_van_guys_dead" );
    common_scripts\utility::flag_wait( "tarmac_van_guys2_dead" );
    maps\_utility::activate_trigger( "escape_van_spawn", "targetname" );
    maps\_utility::delaythread( 0.05, maps\_utility::activate_trigger, "escape_van_guy", "target" );
    wait 0.5;
    common_scripts\utility::flag_set( "escape_main" );
    thread maps\_utility::battlechatter_off();
    maps\airport_code::_id_CF0D();
    maps\airport_code::_id_BD21();

    foreach ( var_1 in level._id_BA78 )
    {
        var_1 maps\_utility::disable_heat_behavior();
        var_1 maps\_utility::disable_ai_color();
        var_1.ignoreall = 1;
        var_1.ignoreme = 1;
        var_1.fixednode = 0;
        var_1.fixednodewason = 0;
        var_1.prevmovemode = "none";
    }

    level._id_D41B pushplayer( 1 );
    thread maps\_utility::radio_dialogue( "airport_mkv_30secs" );
    var_3 = getnodearray( "escape_start_nodes", "targetname" );
    maps\airport_code::_id_BAC1( var_3, 10 );
    level._id_D41B waittill( "reached_path_end" );
    thread maps\_utility::radio_dialogue( "airport_mkv_thisway" );
    var_4 = common_scripts\utility::getstruct( "escape_slow_open_node", "targetname" );
    var_5 = getent( "escape_door_model", "targetname" );
    var_5.animname = "door";
    var_5 maps\_anim::setanimtree();
    var_4 maps\_anim::anim_first_frame_solo( var_5, "opening_door" );
    thread _id_B2D9( var_4 );
    var_4 maps\_anim::anim_reach_solo( level._id_D41B, "get_ready" );
    var_4 maps\_anim::anim_single_solo( level._id_D41B, "get_ready" );

    if ( !common_scripts\utility::flag( "Makarov_enters_room" ) )
    {
        var_4 thread maps\_anim::anim_loop_solo( level._id_D41B, "ready_idle", "stop_idle" );
        common_scripts\utility::flag_wait( "Makarov_enters_room" );
        var_4 notify( "stop_idle" );
    }

    foreach ( var_1 in level._id_BA78 )
        var_1 pushplayer( 1 );

    var_8 = getent( "escape_door", "targetname" );
    var_8 thread maps\_utility::play_sound_on_entity( "scn_makarov_opening_door" );
    var_9[1] = var_5;
    var_4 thread maps\_anim::anim_single_solo( var_5, "opening_door" );
    var_8 common_scripts\utility::delaycall( 2.5, ::rotateto, var_8.angles + ( 0.0, 90.0, 0.0 ), 2, 0.5, 0 );
    var_4 maps\_anim::anim_single_solo( level._id_D41B, "opening_door" );
    common_scripts\utility::flag_set( "escape_doorkick" );
    var_10 = getnode( "escape_moveup_1b", "targetname" );
    level._id_D41B maps\_utility::follow_path( var_10, 260 );
    common_scripts\utility::array_thread( level.team, maps\_utility::enable_cqbwalk );
    common_scripts\utility::array_thread( level.team, maps\_utility::delaythread, 4, maps\_utility::disable_cqbwalk );
    level._id_D41B maps\_utility::delaythread( 3.5, maps\_utility::dialogue_queue, "airport_mkv_hallway" );
    _id_B19C();
    wait 2;
    maps\_utility::activate_trigger( "escape_final_guys", "target" );
    maps\_utility::delaythread( 1.5, maps\_utility::activate_trigger, "escape_police_trig", "targetname" );
    var_11 = 18;
    thread _id_BC96( var_11 );
    wait(var_11);

    if ( maps\_utility::is_default_start() )
        maps\_utility::nextmission();
    else
        iprintlnbold( "DEVELOPER: END OF SCRIPTED LEVEL" );
}

_id_B2D9( var_0 )
{
    level._id_ABA0 = level.team["m4"];
    level._id_ABA0.animname = "comrad";
    var_0 maps\_anim::anim_reach_solo( level._id_ABA0, "get_ready" );
    var_0 maps\_anim::anim_single_solo( level._id_ABA0, "get_ready" );
    var_0 thread maps\_anim::anim_loop_solo( level._id_ABA0, "ready_idle", "stop_loop" );
    common_scripts\utility::flag_wait( "escape_sequence_reach" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::anim_single_solo( level._id_ABA0, "follow_makarov" );
}

_id_C47B( var_0 )
{
    wait 1.35;

    if ( isdefined( var_0 ) )
        self playsound( var_0 );
    else
        self playsound( "door_wood_slow_open" );

    self rotateto( self.angles + ( 0.0, 70.0, 0.0 ), 2, 0.5, 0 );
    self connectpaths();
    self waittill( "rotatedone" );
    self rotateto( self.angles + ( 0.0, 40.0, 0.0 ), 1.5, 0, 1.5 );
}

spawn_cops()
{
    var_0 = getentarray( "escape_final_guys2", "targetname" );

    foreach ( var_2 in var_0 )
        var_3 = maps\_utility::dronespawn( var_2 );
}

_id_B19C()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    level notify( "friendly_fire_stop_checking_for_player_dist" );
    common_scripts\utility::flag_set( "escape_sequence_reach" );
    level._id_ABA0.animname = "comrad";
    var_0 = [];
    var_0[var_0.size] = level._id_D41B;
    var_0[var_0.size] = level._id_ABA0;

    foreach ( var_2 in var_0 )
    {
        var_2.ignoreall = 1;
        var_2.nododgemove = 1;
        var_2 pushplayer( 1 );
        var_2.dontchangepushplayer = 1;
        var_2.grenadeawareness = 0;
        var_2.nogrenadereturnthrow = 1;
    }

    level._id_D41B maps\_utility::add_wait( maps\_utility::waittill_msg, "goal" );
    level._id_D41B maps\_utility::add_func( maps\_anim::anim_single_solo, level._id_D41B, "stand_exposed_wave_halt_v2" );
    level._id_D41B maps\_utility::add_func( maps\_utility::delaythread, 0.05, maps\_utility::dialogue_queue, "airport_mkv_holdfire" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "escape_hold_your_fire" );
    maps\_utility::add_abort( common_scripts\utility::flag_wait, "friendly_fire_warning" );
    thread maps\_utility::do_wait();
    common_scripts\utility::array_thread( var_0, maps\airport_code::_id_AB53 );
    level._id_D41B.moveplaybackrate = 1.0;
    level._id_ABA0.moveplaybackrate = 1.0;
    var_4 = level._id_C0BA;
    var_5 = common_scripts\utility::getstruct( "escape_ending_node", "targetname" );
    var_4 maps\_anim::anim_reach( var_0, "end_get_in" );
    level._id_D41B.moveplaybackrate = 1.0;
    level._id_ABA0.moveplaybackrate = 1.0;
    maps\airport_code::_id_A978();
    var_4 thread maps\_anim::anim_single_solo( level._id_AA36, "end_open_door" );
    var_4 thread maps\_anim::anim_single_solo( var_4, "end_open_door" );
    var_6 = getent( "escape_amb_door_snd", "targetname" );
    var_6 playsound( "scn_ambulance_doors_open" );
    common_scripts\utility::flag_wait( "start_ending_sequence" );
    var_7 = getent( "escape_door_behind", "targetname" );
    var_8 = getent( "escape_door_behind_model", "targetname" );
    var_8 linkto( var_7 );
    var_7 rotateyaw( 90, 3, 0, 3 );
    setsaveddvar( "r_lightGridEnableTweaks", 1 );
    thread maps\_utility::lerp_saveddvar( "r_lightGridIntensity", 0.75, 2.0 );
    common_scripts\utility::flag_set( "escape_sequence_go" );
    var_9 = getent( "escape_nojump", "targetname" );
    var_9 thread maps\airport_code::_id_B901();
    var_4 notify( "stop_loop" );
    common_scripts\utility::array_thread( var_0, maps\_utility::anim_stopanimscripted );
    level._id_ABA0 maps\_utility::add_wait( maps\_utility::_waittillmatch, "single anim", "end" );
    var_4 maps\_utility::add_func( maps\_anim::anim_loop_solo, level._id_ABA0, "end_get_in_idle", "stop_loop", "origin_animate_jnt" );
    thread maps\_utility::do_wait();
    waittillframeend;
    level._id_AA36 thread _id_B657();
    thread maps\airport_code::_id_C6D0();

    foreach ( var_11 in var_0 )
        var_11 linkto( var_4, "tag_body" );

    foreach ( var_11 in var_0 )
    {
        var_14 = getstartorigin( var_4.origin, var_4.angles, var_11 maps\_utility::getanim( "end_get_in" ) );
        var_15 = getstartangles( var_4.origin, var_4.angles, var_11 maps\_utility::getanim( "end_get_in" ) );
        var_16 = var_11.origin - var_14;
        var_17 = spawn( "script_origin", var_4.origin + var_16 );
        var_17.angles = var_4.angles;
        var_18 = var_11.angles[1] - var_15[1];
        var_19 = var_4.origin - var_14;
        var_19 = rotatevector( var_19, ( 0.0, var_18, 0.0 ) );
        var_20 = spawn( "script_origin", var_11.origin + var_19 );
        var_20.angles = var_11.angles + var_4.angles - var_15;
        var_20 thread maps\_anim::anim_single_solo( var_11, "end_get_in" );
        var_21 = common_scripts\utility::ter_op( var_11.animname == "makarov", 2.0, 1.0 );
        var_11 maps\_utility::delaythread( 0.05, maps\_anim::_id_B6DB, undefined, var_20, var_17, var_21 );
        var_11 maps\_utility::delaythread( var_21, maps\_anim::_id_B6DB, undefined, var_17, var_4, 1.0 );
    }

    var_0[var_0.size] = level._id_AA36;
    var_23 = 0.25;
    common_scripts\utility::flag_wait( "end_player_ready" );
    common_scripts\utility::flag_set( "escape_player_get_in" );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player setstance( "stand" );
    thread maps\airport_code::_id_C125();

    if ( common_scripts\utility::flag( "player_ready_for_proper_ending" ) )
        thread maps\airport_code::_id_B41A();
    else
        thread maps\airport_code::_id_B9ED();

    common_scripts\utility::flag_wait( "ambulance_close_door" );
    var_4 thread maps\_anim::anim_single_solo( var_4, "end_close_door" );
    var_6 playsound( "scn_ambulance_doors_close" );
    common_scripts\utility::flag_wait( "ambulance_ready_to_leave" );
    var_5 = getvehiclenode( "escape_van_leave_node", "targetname" );
    thread _id_CA05( var_5 );
    level._id_ABA0 maps\_utility::stop_magic_bullet_shield();
    level._id_D41B maps\_utility::stop_magic_bullet_shield();
    level._id_D41B delete();
    level._id_ABA0 delete();
    level._id_AA36 delete();
}

_id_B3B3()
{
    common_scripts\utility::flag_wait( "end_player_ready" );
    wait 1.25;
    maps\_utility::slowmo_start();
    maps\_utility::slowmo_setspeed_slow( 0.85 );
    maps\_utility::slowmo_setlerptime_in( 0 );
    maps\_utility::slowmo_lerp_in();
    wait 3;
    maps\_utility::slowmo_setlerptime_out( 0 );
    maps\_utility::slowmo_lerp_out();
    maps\_utility::slowmo_end();
}

_id_B657()
{
    self waittillmatch( "single anim", "dialog" );
    self playsound( "airport_vt_madeit" );
    self waittillmatch( "single anim", "dialog" );
    self playsound( "airport_vt_beenough" );
}

_id_CA05( var_0 )
{
    var_1 = level._id_C0BA;
    level._id_C0BA thread maps\_utility::play_sound_on_entity( "scn_ambulance_start_away" );
    common_scripts\utility::_id_C203( level._effect["light_ambulance_airport_blue"], var_1, "tag_body", ( -101.9, 0.4, 63.6 ), ( 0.0, 0.0, 0.0 ) );
    level._id_C0BA common_scripts\utility::delaycall( 0, ::attachpath, var_0 );
    level._id_C0BA common_scripts\utility::delaycall( 0, ::startpath );
}

_id_B70F( var_0 )
{
    if ( level.start_point == "grigs" )
        return;

    if ( common_scripts\utility::flag( "escape_player_shot" ) )
        return;

    common_scripts\utility::flag_set( "escape_player_shot" );
    soundscripts\_snd::snd_message( "start_escape_kill_player_sequence" );
    var_1 = 0.5;
    var_2 = 6;
    level.player maps\_utility::delaythread( 0.1, maps\_utility::play_sound_on_entity, "breathing_hurt_start" );
    level.player maps\_utility::delaythread( var_1, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 3, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 6, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 9, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 1.5, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 3, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 8, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 12, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 17, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player.health = 100;
    level.player dodamage( 90, level._id_D41B gettagorigin( "tag_flash" ), level._id_D41B );
    setomnvar( "ui_consciousness_init", 1 );
    setsaveddvar( "ui_consciousnessVignetteDarkness", 0.5 );
    setomnvar( "ui_consciousness_play", 1 );
    var_3 = maps\_hud_util::create_client_overlay( "white", 1 );
    var_3 thread maps\_hud_util::fade_over_time( 0, 0.5 );
    maps\_utility::set_vision_set( "airport_death", 10 );
}

_id_BC96( var_0 )
{
    soundscripts\_snd::snd_message( "start_fade_to_white_sequence" );
    var_1 = maps\_hud_util::create_client_overlay( "white", 0 );
    var_1 maps\_hud_util::fade_over_time( 1, var_0 - 0.25 );
}

_id_BC44()
{
    soundscripts\_snd::snd_message( "start_airport_nofail_checkpoint" );
    common_scripts\utility::flag_set( "player_no_fail" );
    _id_C32C();
}

start_intro()
{
    soundscripts\_snd::snd_message( "start_intro_checkpoint" );
    _id_C32C();
    thread maps\_utility::battlechatter_off( "allies" );
}

_id_C34E()
{
    soundscripts\_snd::snd_message( "start_stairs_checkpoint" );
    _id_C32C();
    _id_BAA9();
    thread maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::trigger_off( "lobby_to_stairs_flow", "target" );
    var_0 = getnodearray( "prestairs_nodes", "targetname" );
    maps\airport_code::_id_AE13();
    maps\airport_code::_id_B47A( var_0 );
    thread maps\airport_code::_id_CF9B( 42 );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_set_speed_stairs" );
    maps\_utility::add_func( maps\airport_code::_id_CF9B, 42, 0.25 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_set_speed_upperstairs" );
    maps\_utility::add_func( maps\airport_code::_id_CF9B, 35, 1 );
    thread maps\_utility::do_wait();

    foreach ( var_2 in var_0 )
    {
        level.team[var_2.script_noteworthy] orientmode( "face angle", var_2.angles[1] );
        level.team[var_2.script_noteworthy] maps\airport_code::_id_ADC9();
        level.team[var_2.script_noteworthy].ignoreall = 0;
        level.team[var_2.script_noteworthy] thread maps\_utility::ent_flag_set_delayed( "prestairs_nodes", 0.5 );
        level.team[var_2.script_noteworthy] thread maps\airport_code::_id_AAE4( var_2 );
    }

    thread maps\_utility::flag_set_delayed( "player_set_speed_lobby", 0.5 );
    thread maps\_utility::flag_set_delayed( "stairs_go_up", 1 );
    thread maps\_utility::flag_clear_delayed( "_escalator_on", 1 );
    maps\airport_code::_id_BC3A();
}

_id_BC89()
{
    var_0 = getglass( self.targetname );

    if ( isdefined( var_0 ) )
    {
        level waittillmatch( "glass_destroyed", var_0 );
        common_scripts\utility::play_sound_in_space( "scn_airport_skylight_glass", self.origin );
    }
}

_id_AB20()
{
    var_0 = [];
    var_0[var_0.size] = spawn( "script_origin", ( 5462.39, 2109.26, 76.125 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 5462.84, 2213.88, 160.665 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 5460.75, 2403.88, 314.567 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 5287.93, 2410.17, 316.125 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 5288.17, 2243.88, 184.175 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 5284.99, 2103.88, 68.6544 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 5104.29, 2009.68, 68.125 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 5009.83, 2106.67, 180.125 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 4889.42, 2225.57, 308.96 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 4766.84, 2102.98, 310.171 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 4871.84, 1995.85, 195.639 ) );
    var_0[var_0.size] = spawn( "script_origin", ( 4987.36, 1885.09, 64.9956 ) );

    foreach ( var_2 in var_0 )
        var_2 thread common_scripts\utility::play_loop_sound_on_entity( "emt_airport_escalator" );

    common_scripts\utility::flag_waitopen( "_escalator_on" );

    foreach ( var_2 in var_0 )
        var_2 common_scripts\utility::stop_loop_sound_on_entity( "emt_airport_escalator" );

    foreach ( var_2 in var_0 )
        var_2 thread maps\_utility::play_sound_on_entity( "emt_airport_escalator_stop" );
}

_id_AF85()
{
    soundscripts\_snd::snd_message( "start_massacre_checkpoint" );
    _id_C32C();
    _id_BAA9();
    thread maps\airport_code::_id_A872();
    common_scripts\utility::trigger_off( "upperdeck_runners2", "target" );
    common_scripts\utility::trigger_off( "upperdeck_runners4", "target" );
    common_scripts\utility::trigger_off( "upperdeck_runners1b", "target" );
    common_scripts\utility::trigger_off( "upperdeck_runners1c", "target" );
    common_scripts\utility::array_thread( getentarray( "upperdeck_runners3", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_BAA6 );
    thread maps\_utility::battlechatter_off( "allies" );
    maps\airport_code::_id_AE13();
    maps\airport_code::_id_B47A( common_scripts\utility::getstructarray( "massacre_start_nodes", "targetname" ) );
    thread maps\airport_code::_id_CF9B( 35 );

    foreach ( var_1 in level.team )
    {
        var_1 thread maps\_utility::ent_flag_set_delayed( "massacre_ready", 0.5 );
        var_1.goalradius = 8;
        var_1.moveplaybackrate = 1.3;
        var_1.ignoreall = 0;
        var_1 maps\airport_code::_id_ADC9();
        var_1 thread _id_BB70::_id_D157( "massacre_rentacop_stop_dead" );
    }

    maps\airport_code::_id_BC3A();
}

_id_ACF9()
{
    soundscripts\_snd::snd_message( "start_gate_checkpoint" );
    _id_C32C();
    _id_BAA9();
    common_scripts\utility::trigger_off( "massacre_rentacops_rear", "target" );
    common_scripts\utility::trigger_off( "massacre_rentacops_stairs", "target" );
    common_scripts\utility::trigger_off( "massacre_runners1", "target" );
    common_scripts\utility::trigger_off( "massacre_runners2", "target" );
    common_scripts\utility::trigger_off( "massacre_runners3", "target" );
    common_scripts\utility::trigger_off( "upperdeck_runners3", "target" );
    common_scripts\utility::trigger_off( "upperdeck_runners4", "target" );
    common_scripts\utility::trigger_off( "upperdeck_runners2", "target" );
    common_scripts\utility::trigger_off( "upperdeck_runners1b", "target" );
    common_scripts\utility::trigger_off( "upperdeck_runners1c", "target" );
    common_scripts\utility::flag_set( "massacre_rentacops_stairs_dead" );
    common_scripts\utility::flag_set( "massacre_rentacops_rear_dead" );
    thread maps\_utility::battlechatter_off( "allies" );
    maps\airport_code::_id_AE13();
    maps\airport_code::_id_B47A( common_scripts\utility::getstructarray( "gate_start_nodes", "targetname" ) );
    common_scripts\utility::flag_set( "gate_main" );

    foreach ( var_1 in level.team )
        var_1 thread maps\_utility::ent_flag_set_delayed( "gate_ready_to_go", 0.5 );
}

_id_D554()
{
    soundscripts\_snd::snd_message( "start_basement_checkpoint" );
    setsaveddvar( "xanim_disableFootIK", 0 );
    _id_C32C();
    thread maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B963 );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B963 );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_pilot", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_utility::set_ignoreme, 1 );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D50D );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D50D );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_pilot", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D50D );
    var_0 = getent( "tarmac_littlebird", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_CD05 );
    common_scripts\utility::array_thread( getentarray( "gate_convoy_delete", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_CABC );
    common_scripts\utility::array_thread( getentarray( "tarmac_van_guys", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B466, "tarmac_van_guys_spawn" );
    common_scripts\utility::array_thread( getentarray( "tarmac_van_guys2", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B466, "tarmac_van_guys2_spawn" );
    getent( "tarmac_swat_van", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_C7F8 );
    getent( "tarmac_swat_van", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_AD42, "scn_airport_police_van_arrive1", "tarmac_swat_van" );
    getent( "tarmac_swat_van2", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_AD42, "scn_airport_police_van_arrive2", "tarmac_swat_van2" );
    getent( "tarmac_swat_van", "targetname" ) thread maps\airport_code::_id_D208( "tarmac_swat_van" );
    getent( "tarmac_swat_van2", "targetname" ) thread maps\airport_code::_id_D208( "tarmac_swat_van2" );
    maps\airport_code::_id_AE13();
    maps\airport_code::_id_B47A( common_scripts\utility::getstructarray( "basement_start_nodes", "targetname" ) );
    thread maps\airport_code::_id_CF9B( 27 );
    level.drs_ahead_test = maps\airport_code::_id_C9C6;
    common_scripts\utility::flag_set( "gate_main" );
    common_scripts\utility::flag_set( "gate_heli_moveon" );
    maps\airport_code::_id_BF76();
    maps\_utility::activate_trigger_with_targetname( "gate_heli_1" );
    common_scripts\utility::flag_wait( "team_initialized" );
    var_1 = [];
    var_1[var_1.size] = getnode( "basement_start_makarov", "targetname" );
    var_1[var_1.size] = getnode( "basement_start_shotgun", "targetname" );
    var_1[var_1.size] = getnode( "basement_start_saw", "targetname" );
    var_1[var_1.size] = getnode( "basement_start_m4", "targetname" );
    wait 0.2;

    foreach ( var_3 in level.team )
    {
        var_3 maps\airport_code::_id_ADC9();
        var_3.ignoreall = 1;
        var_3.ignoreme = 1;
        var_3.moveplaybackrate = 1.2;
        var_3 maps\_utility::disable_arrivals();
        var_3 maps\_utility::disable_exits();
        var_3 thread maps\airport_code::_id_B408();
        var_3.goalradius = 16;
    }

    foreach ( var_6 in var_1 )
        level.team[var_6.script_noteworthy] thread maps\_utility::follow_path( var_6 );
}

_id_CC35()
{
    soundscripts\_snd::snd_message( "start_tarmac_checkpoint" );
    _id_C32C();
    _id_BAA9();
    thread maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B963 );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B963 );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_pilot", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_utility::set_ignoreme, 1 );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D50D );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_sniper2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D50D );
    common_scripts\utility::array_thread( getentarray( "tarmac_littlebird_pilot", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\airport_code::_id_D50D );
    var_0 = getent( "tarmac_littlebird", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_CD05 );
    setsaveddvar( "xanim_disableFootIK", 0 );
    common_scripts\utility::array_thread( getentarray( "tarmac_van_guys", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B466, "tarmac_van_guys_spawn" );
    common_scripts\utility::array_thread( getentarray( "tarmac_van_guys2", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_B466, "tarmac_van_guys2_spawn" );
    getent( "tarmac_swat_van", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_C7F8 );
    getent( "tarmac_swat_van", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_AD42, "scn_airport_police_van_arrive1", "tarmac_swat_van" );
    getent( "tarmac_swat_van2", "targetname" ) maps\_utility::add_spawn_function( maps\airport_code::_id_AD42, "scn_airport_police_van_arrive2", "tarmac_swat_van2" );
    getent( "tarmac_swat_van", "targetname" ) thread maps\airport_code::_id_D208( "tarmac_swat_van" );
    getent( "tarmac_swat_van2", "targetname" ) thread maps\airport_code::_id_D208( "tarmac_swat_van2" );
    maps\airport_code::_id_AE13();
    maps\airport_code::_id_B47A( common_scripts\utility::getstructarray( "tarmac_start_nodes", "targetname" ) );
    thread maps\airport_code::_id_CF9B( 27 );
    maps\_utility::flag_set_delayed( "tarmac_moveout", 0.1 );
    common_scripts\utility::flag_set( "gate_main" );
    common_scripts\utility::flag_set( "gate_heli_moveon" );
    common_scripts\utility::flag_set( "basement_moveout" );
    maps\airport_code::_id_BF76();
    maps\_utility::activate_trigger_with_targetname( "gate_heli_1" );
    maps\_utility::activate_trigger_with_targetname( "basement_heli_1" );
    maps\_utility::activate_trigger_with_targetname( "tarmac_van_dummy_spawn_trig" );
    maps\_utility::delaythread( 0.2, maps\_utility::activate_trigger, "tarmac_security", "target" );
}

start_escape()
{
    soundscripts\_snd::snd_message( "start_escape_checkpoint" );
    _id_C32C();
    _id_BAA9();
    thread maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_wait( "team_initialized" );

    foreach ( var_1 in level.team )
    {
        var_1 maps\_utility::enable_heat_behavior();
        var_1 pushplayer( 0 );
        var_1 _id_BB70::casual_killer_setup_custom_turns( 0 );
    }

    level.team["saw"] maps\_utility::stop_magic_bullet_shield();
    level.team["shotgun"] maps\_utility::stop_magic_bullet_shield();
    level.team["saw"] kill();
    level.team["shotgun"] kill();
    level.team = maps\_utility::array_removedead_keepkeys( level.team );
    maps\airport_code::_id_AE13();
    maps\airport_code::_id_B47A( common_scripts\utility::getstructarray( "escape_start_nodes", "targetname" ) );
    common_scripts\utility::flag_set( "player_DMS_allow_sprint" );
    thread maps\airport_code::_id_CF9B( 100 );
    maps\airport_code::_id_B6F2();
    common_scripts\utility::flag_set( "tarmac_enemies_wave1_dead" );
    common_scripts\utility::flag_set( "tarmac_enemies_wave2_dead" );
    common_scripts\utility::flag_set( "tarmac_van_guys_dead" );
    common_scripts\utility::flag_set( "tarmac_van_guys2_dead" );
    level.player allowjump( 1 );
    common_scripts\utility::flag_set( "player_DMS_allow_sprint" );
}

_id_CEBE()
{
    soundscripts\_snd::snd_message( "start_grigs_checkpoint" );
    _id_C32C();
    thread maps\_utility::battlechatter_off( "allies" );
    wait 0.1;
    _id_B870();
}

_id_B870()
{
    var_0 = [];
    var_0[var_0.size] = "m4_grunt";
    var_0[var_0.size] = "saw_reflex";
    var_0[var_0.size] = "saw";
    var_0[var_0.size] = "saw_acog";
    var_0[var_0.size] = "mp5";
    var_0[var_0.size] = "ump45";
    var_0[var_0.size] = "g36c";
    var_0[var_0.size] = "g36c_acog";
    var_0[var_0.size] = "g36c_grenadier";
    var_0[var_0.size] = "g36c_reflex";
    var_0[var_0.size] = "striker";
    var_1 = common_scripts\utility::getstruct( "escape_ending_node", "targetname" );
    level._id_C0BA = spawn( "script_model", var_1.origin );
    level._id_C0BA.angles = var_1.angles;
    level._id_C0BA setmodel( "vehicle_ambulance_swat" );
    level._id_AA36 = level.team["saw"];
    level._id_AA36.animname = "van_mate";
    level._id_ABA0 = level.team["m4"];
    level._id_ABA0.animname = "comrad";
    level.player maps\_utility::enableplayerweapons( 0 );

    for (;;)
    {
        foreach ( var_3 in var_0 )
        {
            maps\airport_code::_id_B03D( var_3 );
            maps\airport_code::_id_B41A();
            wait 4;
        }
    }
}

_id_C32C()
{
    thread _id_AB20();
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "glass_break_snd", "script_noteworthy" ), ::_id_BC89 );
    common_scripts\utility::array_thread( getentarray( "team", "targetname" ), maps\_utility::add_spawn_function, maps\airport_code::_id_BF1D );
    maps\_utility::activate_trigger( "team", "target" );
    thread maps\_utility::flag_set_delayed( "team_initialized", 0.05 );
    thread maps\airport_code::player_init();
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2 maps\_utility::is_hero() )
            continue;

        var_2 delete();
    }

    thread maps\_utility::battlechatter_off( "axis" );
    var_4 = getentarray( "massacre_dummy", "targetname" );

    foreach ( var_6 in var_4 )
        var_6 hide();

    var_4 = getentarray( "gate_canned_deaths", "targetname" );

    foreach ( var_6 in var_4 )
        var_6 hide();

    var_4 = getentarray( "upperdeck_canned_deaths", "targetname" );

    foreach ( var_6 in var_4 )
    {
        var_6 hide();

        if ( isdefined( var_6.target ) )
        {
            var_11 = getent( var_6.target, "targetname" );
            var_11 hide();
        }
    }

    thread objective();

    if ( common_scripts\utility::flag( "player_no_fail" ) == 0 )
        thread maps\airport_code::_id_BB88();

    common_scripts\utility::flag_init( "trigger_kill_player" );
    var_13 = getentarray( "kill_player", "targetname" );

    foreach ( var_15 in var_13 )
        thread maps\_utility::set_flag_on_trigger( var_15, "trigger_kill_player" );

    thread maps\airport_code::_id_A8AD();
    thread maps\airport_code::_id_C85A();
    maps\_utility::delaythread( 0.5, maps\airport_code::_id_D2EA );
    maps\airport_code::_id_BEDD();
    var_4 = common_scripts\utility::array_randomize( level._id_B6AA );
    var_4[0] thread maps\airport_code::_id_AA4B( "arriving" );
    var_4[1] thread maps\airport_code::_id_AA4B( "arriving" );
    var_4[2] thread maps\airport_code::_id_AA4B( "arriving" );
    var_4[3] thread maps\airport_code::_id_AA4B( "boarding" );
    var_4[4] thread maps\airport_code::_id_AA4B( "boarding" );
}

objective()
{
    level.strings["OBJ_COVER"] = &"AIRPORT_OBJ_COVER";
    level.strings["OBJ_COVER_COST"] = &"AIRPORT_OBJ_COVER_COST";
    level.strings["OBJ_COVER_TRUST"] = &"AIRPORT_OBJ_COVER_TRUST";
    level.strings["OBJ_TRUST"] = &"AIRPORT_OBJ_TRUST";
    level.strings["OBJ_TRUST_COST"] = &"AIRPORT_OBJ_TRUST_COST";
    level.strings["OBJ_GET_IN_VAN"] = &"AIRPORT_OBJ_GET_IN_VAN";
    level.strings["mantle"] = &"SCRIPT_MANTLE";

    foreach ( var_1 in level.strings )
        precachestring( var_1 );

    if ( maps\_utility::is_default_start() )
        wait 29.5;
    else
        wait 0.05;

    objective_add( 1, "active", level.strings["OBJ_TRUST_COST"] );
    objective_current_nomessage( 1 );
    _id_D3E8();
}

_id_D3E8()
{
    level endon( "escape_player_get_in" );
    objective_onentity( 1, level._id_D41B, ( 0.0, 0.0, 80.0 ) );
}

_id_C3B7()
{
    self endon( "entitydeleted" );
    wait(randomfloat( 2 ));
    playfxontag( common_scripts\utility::getfx( "light_sedan_police_airport" ), self, "tag_origin" );
    self waittill( "exploded" );
    killfxontag( level._effect["light_sedan_police_airport"], self, "tag_origin" );
}

_id_B9BD()
{
    common_scripts\utility::flag_init( "airport_alternate" );
    common_scripts\utility::flag_init( "airport_anticipation" );
    common_scripts\utility::flag_init( "airport_escape" );

    switch ( level.start_point )
    {
        case "start_intro":
        case "stairs":
        case "massacre":
        case "player_nofail":
        case "default":
            common_scripts\utility::flag_wait( "airport_alternate" );
            maps\_utility::music_loop( "mus_airport_alternate", 212 );
        case "gate":
        case "basement":
        case "tarmac":
            common_scripts\utility::flag_wait( "airport_anticipation" );
            thread maps\_utility::music_stop( 1 );
            thread maps\airport_code::_id_C5C7( "mus_airport_anticipation", 308, undefined, 306 );
        case "escape":
            common_scripts\utility::flag_wait( "airport_escape" );
            maps\_utility::music_loop( "mus_airport_escape", 150 );
            common_scripts\utility::flag_wait( "escape_hold_your_fire" );
            thread maps\_utility::music_stop( 2 );
            var_0 = spawn( "script_origin", level.player.origin );
            var_0 linkto( level.player );
            var_0 playsound( "mus_airport_doublecross_sfx" );
        case "grigs":
            break;
        default:
            break;
    }
}

airport_fx_volume_groups_setup()
{
    var_0 = 0;
    level common_scripts\utility::waittill_any( "createfx_common_done", "start_is_set" );

    if ( !var_0 )
    {
        var_1 = [ "fx_fountain", "fx_security", "fx_italian", "fx_vista_italian", "fx_italian_counter", "fx_maintenence", "fx_downstairs_booths", "fx_ceiling_lights", "fx_luggage_store", "fx_liquor_store", "fx_northwest_corner", "fx_gate_exit", "fx_gate_curvy", "fx_burger_town", "fx_downstairs_lights", "fx_gate_desk_south", "fx_ambulance", "fx_carport", "fx_east_bar", "fx_east_phones", "fx_east_phones_vista", "fx_security_counters" ];

        foreach ( var_3 in var_1 )
            common_scripts\utility::flag_init( var_3 );

        var_5 = fx_volume_start_point_initializer();

        foreach ( var_3 in var_5 )
            common_scripts\utility::flag_set( var_3 );

        foreach ( var_3 in var_1 )
        {
            maps\_utility::_id_D193( var_3, var_3 );
            maps\_utility::_id_CD67( var_3, getentarray( var_3, "targetname" ) );
        }

        maps\_utility::_id_B32F( undefined, undefined );
    }
}

fx_volume_start_point_initializer()
{
    var_0 = [ "fx_security", "fx_fountain", "fx_ceiling_lights", "fx_luggage_store", "fx_security_counters" ];
    var_1 = [ "fx_security", "fx_fountain", "fx_ceiling_lights", "fx_luggage_store", "fx_security_counters" ];
    var_2 = [ "fx_vista_italian", "fx_ceiling_lights", "fx_northwest_corner", "fx_burger_town", "fx_east_bar", "fx_east_phones", "fx_east_phones_vista", "fx_security_counters" ];
    var_3 = [ "fx_italian", "fx_italian_counter", "fx_ceiling_lights", "fx_luggage_store", "fx_liquor_store", "fx_northwest_corner", "fx_gate_exit", "fx_gate_curvy", "fx_burger_town", "fx_gate_desk_south", "fx_east_bar", "fx_east_phones" ];
    var_4 = [ "fx_italian", "fx_downstairs_booths", "fx_ceiling_lights", "fx_liquor_store", "fx_northwest_corner", "fx_gate_exit", "fx_gate_curvy", "fx_burger_town", "fx_gate_desk_south" ];
    var_5 = [ "fx_maintenence", "fx_downstairs_booths", "fx_liquor_store", "fx_gate_exit", "fx_gate_curvy", "fx_downstairs_lights", "fx_gate_desk_south" ];
    var_6 = [ "fx_ambulance", "fx_carport" ];

    switch ( level.start_point )
    {
        case "stairs":
            var_7 = var_1;
            break;
        case "massacre":
            var_7 = var_2;
            break;
        case "gate":
            var_7 = var_3;
            break;
        case "basement":
            var_7 = var_4;
            break;
        case "tarmac":
            var_7 = var_5;
            break;
        case "escape":
            var_7 = var_6;
            break;
        default:
            var_7 = var_0;
            break;
    }

    return var_7;
}
