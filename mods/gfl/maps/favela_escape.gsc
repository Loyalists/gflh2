// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\favela_escape_mission_select_cam::_id_C490();
        return;
    }

    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" )
    {
        maps\favela_escape_beautiful_corner::main();
        return;
    }

    setsaveddvar( "fx_cast_shadow", 0 );
    level._id_BF72 = 0.5;
    level.respawn_friendlies_force_vision_check = 1;
    level.destructible_badplace_radius_multiplier = 0.75;
    level.destructible_health_drain_amount_multiplier = 1.75;
    setsaveddvar( "compassHideVehicles", "1" );
    var_0 = [];
    var_1 = [];
    var_0[var_0.size] = "ak47_drone_sound";
    var_1["ak47_drone_sound"] = "h2_solorun_ak47_npc_close";
    var_0[var_0.size] = "uzi_drone_sound";
    var_1["uzi_drone_sound"] = "h2_solorun_uzi_npc_close";
    var_0[var_0.size] = "glock_drone_sound";
    var_1["glock_drone_sound"] = "h2_solorun_g18_npc_close";
    var_0[var_0.size] = "fal_drone_sound";
    var_1["fal_drone_sound"] = "h2_solorun_fal_npc_close";
    level._id_CD18 = var_0;
    level._id_B4CE = var_1;
    level.cosine["45"] = cos( 45 );
    _id_C7FC::main();
    _id_D216::main();
    _id_CA8F::main();
    _id_D55C::main();
    _id_CA3D::main();
    _id_C051();
    precacherumble( "airliner_flyby" );
    precacherumble( "heli_loop" );
    precacherumble( "warbird_flyby" );
    precacherumble( "tank_rumble" );
    maps\_hud_util::_id_D3F5();
    init_level_flags();
    _id_C0F3();

    if ( isdefined( level.start_point ) && level.start_point == "no_game" )
    {
        common_scripts\utility::flag_set( "portalgroup1" );
        common_scripts\utility::flag_set( "portalgroup2" );
        common_scripts\utility::flag_set( "portalgroup2_farside" );
        common_scripts\utility::flag_set( "portalgroup3_facade" );
        common_scripts\utility::flag_set( "portalgroup3" );
        common_scripts\utility::flag_set( "portalgroup4" );
        common_scripts\utility::flag_set( "portalgroup5" );
        common_scripts\utility::flag_set( "portalgroup5_soccerfield" );
        common_scripts\utility::flag_set( "portalgroup6" );
        common_scripts\utility::flag_set( "portalgroup7" );
        common_scripts\utility::flag_set( "portalgroup_sidebuildings1" );
        common_scripts\utility::flag_set( "portalgroup_sidebuildings2" );
        common_scripts\utility::flag_set( "portalgroup_vistaEast" );
    }

    _id_BA34();
    _id_CDB1::main();
    maps\_rambo::main();
    level._id_BC7B = maps\favela_escape_code::_id_AEF0();
    level.friendly_startup_thread = maps\favela_escape_code::_id_C826;
    maps\favela_escape_code::_id_ACBF();
    maps\_drone_ai::init();
    maps\favela_escape_anim::main();
    maps\_load::main();
    _id_B0E5::_id_C2BC();
    thread _id_AB52::main();
    common_scripts\utility::flag_set( "respawn_friendlies" );
    thread maps\favela_escape_code::_id_D546();
    thread _id_CBAC();
    thread _id_C24B();
    thread setup_vehicles();
    thread maps\favela_escape_code::_id_BE88();
    level.player thread _id_B348();
    thread maps\favela_escape_code::init_fx_alphathreshold();
    thread maps\favela_escape_code::helicopter_soccerfield_exploder();
    thread maps\favela_escape_code::playerjump_roof_fx();
    maps\favela_escape_aud::main();
    thread _id_B461();
    thread maps\favela_escape_code::_id_D3ED();
    thread _id_CA3D::_id_AC66();
    thread maps\favela_escape_code::_id_D086();
    maps\_compass::setupminimap( "compass_map_favela_escape" );
    thread _id_D45E();
    thread maps\favela_escape_code::_id_C116();
    thread _id_CB4B();
    thread maps\favela_escape_code::animated_airconditioners_setup();
    thread static_model_group_setup();
    thread hide_objects_in_market( "killfunc_hide_objects_in_market", "objects_to_hide_in_market", "hide_objects_in_market_flag" );
    thread hide_objects_in_market( "killfunc_hide_objects_in_market", "cars_to_hide_in_market", "cars_to_hide_in_market" );
    thread hide_objects_in_market( "killfunc_hide_objects_in_market", "marketA", "objects_marketA" );
    thread hide_objects_in_market( "killfunc_hide_objects_in_market", "marketB", "objects_marketB" );
    thread hide_objects_in_market( "killfunc_hide_objects_in_market", "marketC", "objects_marketC" );
    maps\favela_escape_lighting::main();
    var_2 = getent( "vista_end", "targetname" );
    var_3 = getentarray( "vista_end_water", "targetname" );
    var_3 = common_scripts\utility::array_add( var_3, var_2 );

    foreach ( var_5 in var_3 )
        var_5 hide();

    level.sunshadowworldheight = getdvar( "sm_sunShadowWorldHeight" );
    setsaveddvar( "sm_sunShadowWorldHeight", "900" );
    var_7 = getentarray( "keep_door", "script_noteworthy" );

    foreach ( var_9 in var_7 )
        var_9 _meth_848A( var_9.origin );

    level.tanksquishdamageimmunity = "MOD_EXPLOSIVE";
}

_id_B348()
{
    self endon( "death" );
    var_0 = getent( "market_mantle", "targetname" );
    var_1 = 110;
    var_2 = 60;

    for (;;)
    {
        var_0 waittill( "trigger" );

        for (;;)
        {
            var_3 = abs( angleclamp180( self.angles[1] - var_1 ) ) < var_2;

            if ( self istouching( var_0 ) && var_3 && level.player getstance() == "stand" )
            {
                setsaveddvar( "hud_forceMantleHint", var_3 );
                self _meth_830F( 0 );
                self allowjump( 0 );

                if ( self _meth_85A3() && self jumpbuttonpressed() && !self _meth_83C0() )
                    break;
            }
            else
            {
                setsaveddvar( "hud_forceMantleHint", 0 );
                self _meth_830F( 1 );
                self allowjump( 1 );
            }

            waitframe();
        }

        setsaveddvar( "hud_forceMantleHint", 0 );
        self allowjump( 1 );
        self disableweapons( 1 );
        level.player playsound( "scn_favela_escape_rooftop_mantle_player" );
        self setmovespeedscale( 0 );
        self _meth_830F( 0 );
        self allowcrouch( 0 );
        self allowprone( 0 );
        var_4 = 10000;

        while ( length2dsquared( level.player getvelocity() ) > var_4 )
            waitframe();

        maps\_utility::_id_C0F0( "rooftop_mantle", undefined, 0, 0.5, 1, undefined, undefined, undefined, undefined, undefined, undefined, 1 );
        self setmovespeedscale( 1 );
        self _meth_830F( 1 );
        self allowcrouch( 1 );
        self allowprone( 1 );
        self enableweapons();
        waitframe();
    }
}

_id_CB4B()
{
    level._id_AA4A = [];
    var_0 = getentarray( "destructible_toy", "targetname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( issubstr( var_3.destructible_type, "toy_chicken" ) )
            var_1[var_1.size] = var_3;
    }

    common_scripts\utility::array_thread( var_1, ::_id_A8C0 );
}

_id_A8C0()
{
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

    if ( !isplayer( var_1 ) )
        return;

    level._id_AA4A[level._id_AA4A.size] = gettime();

    if ( level._id_AA4A.size < 7 )
        return;

    var_9 = level._id_AA4A[level._id_AA4A.size - 7];
    var_10 = level._id_AA4A[level._id_AA4A.size - 1];

    if ( var_10 - var_9 > 10000 )
        return;

    maps\_utility::giveachievement_wrapper( "COLONEL_SANDERSON" );
}

_id_C051()
{
    precacheitem( "uzi" );
    precacheitem( "smoke_grenade_american" );
    precacheitem( "rpg_straight" );
    precacheitem( "rpg_straight_short_life" );
    precacheitem( "freerunner" );
    precacheitem( "ak47_drone_sound" );
    precacheitem( "uzi_drone_sound" );
    precacheitem( "glock_drone_sound" );
    precacheitem( "fal_drone_sound" );
    precacheshellshock( "favela_escape_player_recovery" );
    precachestring( &"FAVELA_ESCAPE_SOLORUN_KEEP_MOVING" );
    precachestring( &"FAVELA_ESCAPE_HINT_SPRINT" );
    precachestring( &"FAVELA_ESCAPE_HINT_SPRINT_PC" );
    precachestring( &"FAVELA_ESCAPE_HINT_SPRINT_PC_ALT" );
    precachestring( &"FAVELA_ESCAPE_CHOPPER_TIMER" );
    precachestring( &"FAVELA_ESCAPE_CHOPPER_TIMER_EXPIRED" );
    precachestring( &"FAVELA_ESCAPE_DEADQUOTE_FAILED_CHOPPER_JUMP" );
    precachemodel( "hat_militia_bb_blk" );

    precachemodel( "h2_gfl_st_ar15_viewbody" );
    precachemodel( "h2_gfl_st_ar15_viewhands" );
    precachemodel( "h2_gfl_st_ar15_viewhands_player" );
}

init_level_flags()
{
    common_scripts\utility::flag_init( "friends_setup" );
    common_scripts\utility::flag_init( "introscreen_start_dialogue" );
    common_scripts\utility::flag_init( "pickup2_spawned" );
    common_scripts\utility::flag_init( "radiotower_runpath_dialogue_done" );
    common_scripts\utility::flag_init( "runpath_resume_dialogue" );
    common_scripts\utility::flag_init( "radiotower_start" );
    common_scripts\utility::flag_init( "radiotower_vehicles_start" );
    common_scripts\utility::flag_init( "radiotower_escape_technical_1_arrival" );
    common_scripts\utility::flag_init( "radiotower_escape_technical_2_arrival" );
    common_scripts\utility::flag_init( "radiotower_vehicle1_donut_done" );
    common_scripts\utility::flag_init( "radiotower_enemies_retreat" );
    common_scripts\utility::flag_init( "radiotower_exit" );
    common_scripts\utility::flag_init( "start_truck_break" );
    common_scripts\utility::flag_init( "hind_turret_shutdown" );
    common_scripts\utility::flag_init( "hind_fire" );
    common_scripts\utility::flag_init( "hind_reveal_rpg_dodge" );
    common_scripts\utility::flag_init( "hind_reveal_dodgestop" );
    common_scripts\utility::flag_init( "hind_reveal_bugout" );
    common_scripts\utility::flag_init( "market_introdialogue_done" );
    common_scripts\utility::flag_init( "market_chopper_spawned" );
    common_scripts\utility::flag_init( "market_evac_chopper_spawned" );
    common_scripts\utility::flag_init( "market_evac_chopper_bugout" );
    common_scripts\utility::flag_init( "market_evac_player_near_soccerfield" );
    common_scripts\utility::flag_init( "market_evac_chopper_incoming" );
    common_scripts\utility::flag_init( "market_evac_ambush_start" );
    common_scripts\utility::flag_init( "market_evac_enemies_depleted" );
    common_scripts\utility::flag_init( "market_evac_chopper_leaves_scene" );
    common_scripts\utility::flag_init( "market_evac_follow_sarge_climb" );
    common_scripts\utility::flag_init( "market_evac_soap_climbed_up" );
    common_scripts\utility::flag_init( "market_evac_player_mantled" );
    common_scripts\utility::flag_init( "market_evac_player_on_roof" );
    common_scripts\utility::flag_init( "roofrun_done" );
    common_scripts\utility::flag_init( "roofrun_sarge_bigjumped" );
    common_scripts\utility::flag_init( "roofrun_player_bigjump_start" );
    common_scripts\utility::flag_init( "player_jump_watcher_stop" );
    common_scripts\utility::flag_init( "player_fell_normally" );
    common_scripts\utility::flag_init( "bigjump_sargeplayer_interact_start" );
    common_scripts\utility::flag_init( "player_bigjump_done" );
    common_scripts\utility::flag_init( "player_recovery_blackscreen" );
    common_scripts\utility::flag_init( "player_recovery_done" );
    common_scripts\utility::flag_init( "solorun_objective_display" );
    common_scripts\utility::flag_init( "solorun_start" );
    common_scripts\utility::flag_init( "solorun_mob_start_shooting" );
    common_scripts\utility::flag_init( "solorun_player_at_balcony" );
    common_scripts\utility::flag_init( "solorun_player_progression_stalled" );
    common_scripts\utility::flag_init( "solorun_timer_start" );
    common_scripts\utility::flag_init( "timer_expired" );
    common_scripts\utility::flag_init( "chopperjump_player_jump" );
    common_scripts\utility::flag_init( "solorun_player_boarded_chopper" );
    common_scripts\utility::flag_init( "level_faded_to_black" );
    common_scripts\utility::flag_init( "runpath_dialogue_continue" );
    common_scripts\utility::flag_init( "no_wobble_roof" );
    common_scripts\utility::flag_init( "market_respawn_trigger" );
    common_scripts\utility::flag_init( "portalgroup1" );
    common_scripts\utility::flag_init( "portalgroup2" );
    common_scripts\utility::flag_init( "portalgroup2_farside" );
    common_scripts\utility::flag_init( "portalgroup3_facade" );
    common_scripts\utility::flag_init( "portalgroup3" );
    common_scripts\utility::flag_init( "portalgroup4" );
    common_scripts\utility::flag_init( "portalgroup5" );
    common_scripts\utility::flag_init( "portalgroup5_soccerfield" );
    common_scripts\utility::flag_init( "portalgroup6" );
    common_scripts\utility::flag_init( "portalgroup7" );
    common_scripts\utility::flag_init( "portalgroup_sidebuildings1" );
    common_scripts\utility::flag_init( "portalgroup_sidebuildings2" );
    common_scripts\utility::flag_init( "portalgroup_vistaEast" );
}

_id_C0F3()
{
    level._id_C830 = [];
    level._id_C830[0] = "weapon_ak47_tactical_clip";
    level._id_C830[1] = "weapon_rpd_clip";
    level._id_C830[2] = "weapon_m16_clip";
    level._id_C830[3] = "weapon_skorpion_clip";
    level._id_C830[4] = "weapon_saw_clip";
}

_id_B461()
{
    level._id_C058 = getentarray( "sbmodel_market_evac_helperclip", "targetname" );

    foreach ( var_1 in level._id_C058 )
        var_1 connectpaths();

    badplace_cylinder( "street_uphill_alley", -1, ( -388.0, 524.0, 1016.0 ), 90, 128, "allies" );
}

_id_CBAC()
{
    var_0 = getentarray( "starting_allies", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.targetname ) )
        {
            if ( var_2.targetname == "sarge" )
            {
                var_2.animname = "sarge";
                var_2._id_CC3F = 1;
                level._id_BAD2 = var_2;
            }
            else if ( var_2.targetname == "hero1" )
            {
                var_2.animname = "hero1";
                var_2._id_CC3F = 1;
                level._id_C947 = var_2;
            }
        }

        if ( isdefined( var_2._id_CC3F ) )
            var_2 thread maps\_utility::magic_bullet_shield();
        else
            var_2 thread maps\_utility::replace_on_death();

        var_2 maps\favela_escape_code::_id_BFD0( level._id_BF72 );
        var_2 maps\favela_escape_code::_id_CDBA( 1 );
        var_2 maps\favela_escape_code::_id_CF21();
        var_2 maps\favela_escape_code::_id_BA72();
    }

    maps\_utility::add_global_spawn_function( "allies", maps\favela_escape_code::_id_CDBA, 1 );
    common_scripts\utility::flag_set( "friends_setup" );
}

_id_C24B()
{
    maps\_utility::add_global_spawn_function( "axis", maps\favela_escape_code::_id_CDBA, 1 );
    var_0 = getentarray( "delete_at_path_end", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\favela_escape_code::delete_at_path_end );
    var_1 = getentarray( "ignore_til_pathend_or_damage", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\favela_escape_code::_id_C4B1 );
    var_2 = getentarray( "ignore_and_delete_at_path_end", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\favela_escape_code::_id_C8E9 );
    var_3 = getentarray( "playerseek_at_path_end", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, maps\favela_escape_code::_id_C2FC );
    var_4 = getentarray( "window_smash_stop_inside", "script_noteworthy" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, maps\favela_escape_code::_id_A87B );
    var_5 = getentarray( "chaotic_above_shooter", "script_noteworthy" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, maps\favela_escape_code::_id_C31F );
    var_6 = getentarray( "solorun_chaser_spawner", "script_noteworthy" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, maps\favela_escape_code::_id_A910 );
    var_7 = getentarray( "dont_shoot_player_in_back", "script_noteworthy" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, maps\favela_escape_code::_id_CA23 );
    var_8 = getent( "spawner_vista2_endhouse", "script_noteworthy" );
    var_8 thread maps\_utility::add_spawn_function( maps\favela_escape_code::_id_BA0A );
    var_9 = getentarray( "solorun_roofrunner", "script_noteworthy" );
    common_scripts\utility::array_thread( var_9, maps\_utility::add_spawn_function, maps\favela_escape_code::_id_CA23 );
    common_scripts\utility::array_thread( var_9, maps\_utility::add_spawn_function, maps\favela_escape_code::delete_at_path_end );
}

setup_vehicles()
{
    var_0 = getentarray( "solorun_chopper", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\favela_escape_code::_id_C0B3 );
}

_id_D45E()
{
    common_scripts\utility::flag_wait( "introscreen_complete" );
    var_0 = 0;
    var_1 = getdvar( "objectiveFadeTooFar" );

    if ( isdefined( level._id_BAD2 ) )
    {
        common_scripts\utility::flag_wait( "runpath_dialogue_continue" );
        objective_add( 1, "current", &"FAVELA_ESCAPE_OBJ_1ST_LZ" );
        objective_onentity( 1, level._id_BAD2 );
        common_scripts\utility::flag_wait( "radiotower_runpath_dialogue_done" );
        objective_state( 1, "active" );
        objective_add( 2, "current", &"FAVELA_ESCAPE_OBJ_SUPPORT_SQUAD" );
        _func_1E7( 2, 1 );
        objective_onentity( 2, level._id_BAD2 );
        objective_setpointertextoverride( 2, &"FAVELA_ESCAPE_OBJ_FOLLOW_MARKER" );
        setsaveddvar( "objectiveFadeTooFar", 5 );
        var_0 = 1;
    }

    common_scripts\utility::flag_wait( "market_introdialogue_done" );

    if ( var_0 )
    {
        objective_state( 2, "active" );
        objective_state_nomessage( 2, "done" );
        objective_add( 3, "current", &"FAVELA_ESCAPE_OBJ_THROUGH_MARKET" );
        _func_1E7( 3, 1 );
        objective_position( 3, ( -3154.0, -1875.0, 1096.0 ) );
        objective_setpointertextoverride( 3, "" );
        setsaveddvar( "objectiveFadeTooFar", var_1 );
    }

    common_scripts\utility::flag_wait( "market_evac_chopper_incoming" );
    wait 4;
    maps\_utility::objective_complete( 1 );
    objective_state_nomessage( 3, "done" );
    wait 5;
    objective_add( 4, "current", &"FAVELA_ESCAPE_OBJ_2ND_LZ", ( -3937.0, -1051.0, 1241.0 ) );

    if ( isdefined( level.chopper ) )
        objective_onentity( 4, level.chopper );

    thread _id_D290( 4 );
    common_scripts\utility::flag_wait( "player_bigjump_done" );
    maps\_utility::objective_complete( 4, 1 );
    objective_state_nomessage( 4, "active" );
    common_scripts\utility::flag_wait( "solorun_objective_display" );
    objective_add( 5, "current", &"FAVELA_ESCAPE_OBJ_GET_BACK_TO_ROOF", ( -5924.0, -870.0, 816.0 ) );
    _func_1E7( 5, 1 );
    thread _id_B191( 5 );
    common_scripts\utility::flag_wait( "solorun_player_at_balcony" );
    objective_state( 5, "active" );
    maps\_utility::objective_complete( 5, 1 );
    objective_add( 6, "current", &"FAVELA_ESCAPE_OBJ_GET_TO_CHOPPER", ( -8354.0, 2045.0, 704.0 ) );
    _func_1E7( 6, 1 );
    thread _id_B467( 6 );
    common_scripts\utility::flag_wait( "solorun_player_boarded_chopper" );
    wait 1.5;
    maps\_utility::objective_complete( 6 );
    objective_state_nomessage( 4, "done" );
}

_id_BABC()
{
    maps\_utility::trigger_wait( "solorun_houses_obj_update_0", "script_noteworthy" );
    setsaveddvar( "compass", 0 );
    common_scripts\utility::flag_wait( "solorun_player_at_balcony" );
    setsaveddvar( "compass", 1 );
}

_id_D290( var_0 )
{
    level endon( "solorun_start" );
    common_scripts\utility::flag_wait( "market_evac_chopper_leaves_scene" );
    objective_onentity( var_0, level._id_BAD2 );
    common_scripts\utility::flag_wait( "roofrun_player_at_start_loc" );

    while ( isdefined( level.chopper ) )
        wait 0.05;

    for ( var_1 = undefined; !isdefined( var_1 ); var_1 = maps\_utility::get_vehicle( "veh_chopper_roofrun", "targetname" ) )
        wait 0.05;

    objective_onentity( var_0, var_1 );
    common_scripts\utility::flag_wait( "player_jump_watcher_stop" );
    objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "player_recovery_blackscreen" );
    objective_position( var_0, ( -6370.5, -944.0, 1044.0 ) );
}

_id_B191( var_0 )
{
    level endon( "solorun_player_at_balcony" );
    maps\_utility::trigger_wait( "solorun_houses_obj_update_0", "script_noteworthy" );
    objective_position( var_0, ( -4756.0, -384.0, 808.0 ) );
    maps\_utility::trigger_wait( "solorun_houses_obj_update_2", "script_noteworthy" );
    objective_position( var_0, ( -4760.0, 880.0, 804.0 ) );
    maps\_utility::trigger_wait( "solorun_houses_obj_update_3", "script_noteworthy" );
    objective_position( var_0, ( -5112.0, 864.0, 944.0 ) );
}

_id_B467( var_0 )
{
    level endon( "solorun_player_boarded_chopper" );
    maps\_utility::trigger_wait( "objective_breadcrumb_update_1", "script_noteworthy" );
    objective_position( var_0, ( -8442.0, 1409.0, 416.0 ) );
    maps\_utility::trigger_wait( "objective_breadcrumb_update_2", "script_noteworthy" );
    objective_position( var_0, ( -9108.0, 1522.0, 353.0 ) );
    maps\_utility::trigger_wait( "objective_breadcrumb_update_3", "script_noteworthy" );
    objective_position( var_0, ( -9086.0, 2224.0, -152.0 ) );
    maps\_utility::trigger_wait_targetname( "trig_end_glass_break" );
    objective_onentity( var_0, level._id_C924, ( 0.0, 0.0, -85.0 ) );
}

_id_BA34()
{
    maps\_utility::default_start( ::_id_B448 );
    maps\_utility::add_start( "intro", ::_id_B448, "map start" );
    maps\_utility::add_start( "street", ::start_street, "street after radiotower" );
    maps\_utility::add_start( "street_mid", ::_id_B034, "street after first chopper reveal" );
    maps\_utility::add_start( "street_vista2", ::_id_D267, "street second vista area" );
    maps\_utility::add_start( "market", ::_id_A97E, "market start" );
    maps\_utility::add_start( "market_evac", ::_id_C49B, "market evac goes wrong" );
    maps\_utility::add_start( "market_evac_escape", ::_id_D31F, "friendlies climb up to rooftops" );
    maps\_utility::add_start( "roofrun", ::_id_B032, "roofrun start" );
    maps\_utility::add_start( "roofrun_bigjump", ::_id_AE3B, "roofrun player jump" );
    maps\_utility::add_start( "solorun", ::_id_C1C2, "player solo run" );
    maps\_utility::add_start( "solorun_rooftops", ::_id_C403, "player solo run rooftops" );
    maps\_utility::add_start( "solorun_chopper", ::_id_B350, "player jump to chopper" );
    maps\_utility::add_start( "test", ::_id_B34C, "[dev test]" );
}

_id_B34C()
{
    common_scripts\utility::flag_set( "portalgroup1" );
    common_scripts\utility::flag_set( "portalgroup2" );
    common_scripts\utility::flag_set( "portalgroup2_farside" );
    common_scripts\utility::flag_set( "portalgroup3" );
    common_scripts\utility::flag_set( "portalgroup3_facade" );
    level.player.ignoreme = 1;
    level.player maps\favela_escape_code::_id_B205( ( 4892.0, 292.0, 1134.0 ), ( 0.0, 180.0, 0.0 ) );
    thread maps\favela_escape_code::_id_D0A6();
}

_id_B448()
{
    soundscripts\_snd::snd_message( "start_intro_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup1" );
    common_scripts\utility::flag_set( "portalgroup2" );
    common_scripts\utility::flag_set( "portalgroup2_farside" );
    common_scripts\utility::flag_set( "portalgroup3" );
    common_scripts\utility::flag_set( "portalgroup3_facade" );
    maps\favela_escape_lighting::_id_C584( "favela_escape" );
    level thread _id_C17B();
}

start_street()
{
    soundscripts\_snd::snd_message( "start_street_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup1" );
    common_scripts\utility::flag_set( "portalgroup2" );
    common_scripts\utility::flag_set( "portalgroup2_farside" );
    common_scripts\utility::flag_set( "portalgroup3" );
    common_scripts\utility::flag_set( "portalgroup3_facade" );
    common_scripts\utility::flag_set( "radiotower_start" );
    common_scripts\utility::flag_set( "radiotower_enemies_retreat" );
    common_scripts\utility::flag_set( "radiotower_escape_technical_2_arrival" );
    maps\favela_escape_lighting::_id_C584( "favela_escape_radiotower" );
    thread maps\favela_escape_code::_id_D206( 0 );
    level._id_BAD2 maps\_utility::set_force_color( "b" );
    maps\favela_escape_code::_id_AC5F( "struct_start_street" );
    maps\favela_escape_code::_id_ABFE( "trig_script_color_allies_b5" );
    thread _id_CC67();
    thread maps\_utility::autosave_by_name( "street_start" );
}

_id_B034()
{
    soundscripts\_snd::snd_message( "start_street_mid_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup3_facade" );
    common_scripts\utility::flag_set( "portalgroup3" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings1" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings2" );
    common_scripts\utility::flag_set( "portalgroup_vistaEast" );
    common_scripts\utility::flag_set( "hide_objects_in_market_flag" );
    common_scripts\utility::flag_set( "cars_to_hide_in_market" );
    maps\favela_escape_lighting::_id_C584( "favela_escape_street" );
    common_scripts\utility::flag_set( "radiotower_start" );
    level._id_BAD2 maps\_utility::set_force_color( "b" );
    maps\favela_escape_code::_id_AC5F( "struct_start_street_mid" );
    thread _id_CC67();
}

_id_D267()
{
    soundscripts\_snd::snd_message( "start_street_vista2_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup3_facade" );
    common_scripts\utility::flag_set( "portalgroup3" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings1" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings2" );
    common_scripts\utility::flag_set( "portalgroup_vistaEast" );
    common_scripts\utility::flag_set( "hide_objects_in_market_flag" );
    common_scripts\utility::flag_set( "cars_to_hide_in_market" );
    common_scripts\utility::flag_set( "radiotower_start" );
    maps\favela_escape_lighting::_id_C584( "favela_escape_street" );
    level._id_BAD2 maps\_utility::set_force_color( "b" );
    maps\favela_escape_code::_id_AC5F( "struct_start_street_vista2" );
    maps\favela_escape_code::_id_ABFE( "uphill_advance_3" );
    thread _id_CC67( "vista2" );
}

_id_A97E()
{
    soundscripts\_snd::snd_message( "start_market_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup3" );
    common_scripts\utility::flag_set( "portalgroup4" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings1" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings2" );
    common_scripts\utility::flag_set( "hide_objects_in_market_flag" );
    common_scripts\utility::flag_set( "cars_to_hide_in_market" );
    common_scripts\utility::flag_set( "radiotower_start" );
    level._id_BAD2 maps\_utility::set_force_color( "b" );
    maps\favela_escape_lighting::_id_C584( "favela_escape_street" );
    maps\favela_escape_code::_id_AC5F( "struct_start_market" );
    maps\favela_escape_code::_id_ABFE( "trig_spawn_market_start" );
    maps\favela_escape_code::_id_ABFE( "uphill_advance_6" );
    thread _id_BE59( "market" );
    thread _id_B061();
    common_scripts\utility::trigger_off( "market_advance_1", "targetname" );
    wait 10;
    common_scripts\utility::trigger_on( "market_advance_1", "targetname" );
    maps\favela_escape_code::_id_B082( "market_advance_1" );
}

_id_C49B()
{
    soundscripts\_snd::snd_message( "start_market_evac_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup4" );
    common_scripts\utility::flag_set( "portalgroup5" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings1" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings2" );
    common_scripts\utility::flag_set( "radiotower_start" );
    common_scripts\utility::flag_set( "market_introdialogue_done" );
    maps\favela_escape_lighting::_id_C584( "favela_escape_market" );
    maps\favela_escape_code::_id_C905( 1 );
    var_0 = maps\favela_escape_code::_id_B562();
    var_1 = var_0[0];
    level._id_BAD2 maps\_utility::set_force_color( "b" );
    level._id_C947 maps\_utility::set_force_color( "b" );
    var_1 maps\_utility::disable_replace_on_death();
    var_1 notify( "death" );
    var_1 delete();
    common_scripts\utility::flag_set( "market_advance_4" );
    thread _id_AD2C();
    maps\favela_escape_code::_id_AC5F( "struct_start_market_evac" );
    thread _id_AAC2();
}

_id_D31F()
{
    soundscripts\_snd::snd_message( "start_market_evac_escape_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup4" );
    common_scripts\utility::flag_set( "portalgroup5" );
    common_scripts\utility::flag_set( "portalgroup5_soccerfield" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings1" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings2" );
    common_scripts\utility::flag_set( "radiotower_start" );
    maps\favela_escape_lighting::_id_C584( "favela_escape_soccerfield" );
    maps\favela_escape_code::_id_C905( 1 );
    var_0 = maps\favela_escape_code::_id_B562();
    var_1 = var_0[0];
    var_2 = common_scripts\utility::getstruct( "struct_start_market_evac_escape_player", "targetname" );
    level.player maps\favela_escape_code::_id_B205( var_2.origin, var_2.angles );
    var_3 = getnode( "node_sarge_preclimb", "targetname" );
    var_4 = getnode( "node_hero1_preclimb", "targetname" );
    var_5 = getnode( "node_redshirt_preclimb", "targetname" );
    common_scripts\utility::array_thread( level._id_C2F8, maps\favela_escape_code::_id_B92A, 128 );
    var_1 = maps\favela_escape_code::_id_B997();
    level._id_BAD2 forceteleport( var_3.origin, var_3.angles );
    level._id_C947 forceteleport( var_4.origin, var_4.angles );
    var_1 forceteleport( var_5.origin, var_5.angles );
    level._id_BAD2 setgoalnode( var_3 );
    level._id_C947 setgoalnode( var_4 );
    var_1 setgoalnode( var_5 );
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::ent_flag_init, "climbing_ok" );
    waittillframeend;
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::ent_flag_set, "climbing_ok" );
    thread maps\favela_escape_code::_id_D5C8();
    thread _id_C6EB();
}

_id_B032()
{
    soundscripts\_snd::snd_message( "start_roofrun_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup4" );
    common_scripts\utility::flag_set( "portalgroup5" );
    common_scripts\utility::flag_set( "portalgroup5_soccerfield" );
    common_scripts\utility::flag_set( "portalgroup6" );
    common_scripts\utility::flag_set( "portalgroup_sidebuildings2" );
    common_scripts\utility::flag_set( "radiotower_start" );
    maps\favela_escape_lighting::_id_C584( "favela_escape_rooftops" );
    maps\favela_escape_code::_id_C905( 1 );
    var_0 = maps\favela_escape_code::_id_B562();
    var_1 = var_0[0];
    var_1 thread maps\_utility::magic_bullet_shield();
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::clear_force_color );
    var_2 = getnode( "node_roofrun_sarge_waitforplayer", "targetname" );
    var_3 = getnode( "node_roofrun_hero1_waitforplayer", "targetname" );
    var_4 = getnode( "node_roofrun_redshirt_waitforplayer", "targetname" );
    level._id_BAD2 thread maps\favela_escape_code::_id_B205( var_2.origin, var_2.angles );
    level._id_C947 thread maps\favela_escape_code::_id_B205( var_3.origin, var_3.angles );
    var_1 thread maps\favela_escape_code::_id_B205( var_4.origin, var_4.angles );
    level.player maps\favela_escape_code::_id_B205( ( -3552.0, -992.0, 1194.0 ), ( 0.0, 180.0, 0.0 ) );
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::ent_flag_init, "roofrun_start" );
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::ent_flag_init, "climbing_ok" );
    waittillframeend;
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::ent_flag_set, "roofrun_start" );
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::ent_flag_set, "climbing_ok" );
    waittillframeend;
    thread maps\favela_escape_code::_id_D5C8();
    thread _id_C53B();
}

_id_AE3B()
{
    soundscripts\_snd::snd_message( "start_roofrun_bigjump_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup4" );
    common_scripts\utility::flag_set( "portalgroup5_soccerfield" );
    common_scripts\utility::flag_set( "portalgroup6" );
    common_scripts\utility::flag_set( "portalgroup7" );
    common_scripts\utility::flag_set( "radiotower_start" );
    common_scripts\utility::flag_set( "market_introdialogue_done" );
    common_scripts\utility::flag_set( "market_evac_chopper_incoming" );
    common_scripts\utility::flag_set( "market_evac_player_on_roof" );
    thread maps\favela_escape_code::early_fall_kill_trig_remove();
    maps\favela_escape_lighting::_id_C584( "favela_escape_rooftops" );
    maps\favela_escape_code::_id_C905( 1 );
    var_0 = maps\favela_escape_code::_id_B562();
    var_1 = var_0[0];
    level._id_C958 = 0;
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::ent_flag_init, "roofrun_start" );
    var_2 = common_scripts\utility::getstruct( "roofrun_sarge_waitforplayer", "targetname" );
    level._id_BAD2 maps\favela_escape_code::_id_B205( var_2.origin, var_2.angles );
    var_3 = common_scripts\utility::getstruct( "struct_start_roofrun_player_jump_player", "targetname" );
    level.player maps\favela_escape_code::_id_B205( var_3.origin, var_3.angles );
    wait 0.05;
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::ent_flag_set, "roofrun_start" );
    waittillframeend;
    level._id_BAD2 thread maps\favela_escape_code::_id_B58A( 1 );
    var_1 thread maps\favela_escape_code::_id_AB7D( 1 );
    level._id_C947 thread maps\favela_escape_code::_id_CCED( 1 );
    thread maps\favela_escape_code::_id_C4F0();
    common_scripts\utility::flag_wait( "player_recovery_done" );
    thread _id_BF69();
}

_id_C1C2()
{
    soundscripts\_snd::snd_message( "start_solorun_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup4" );
    common_scripts\utility::flag_set( "portalgroup6" );
    common_scripts\utility::flag_set( "portalgroup7" );
    common_scripts\utility::flag_set( "solorun_objective_display" );
    common_scripts\utility::flag_set( "radiotower_start" );
    common_scripts\utility::flag_set( "market_introdialogue_done" );
    common_scripts\utility::flag_set( "market_evac_chopper_incoming" );
    common_scripts\utility::flag_set( "market_evac_player_on_roof" );
    thread maps\favela_escape_code::early_fall_kill_trig_remove();
    maps\favela_escape_lighting::_id_C584( "favela_escape" );
    maps\favela_escape_code::_id_CAF6();
    level.player takeallweapons();
    var_0 = common_scripts\utility::getstruct( "struct_solorun_beginning_start_player", "targetname" );
    level.player thread maps\favela_escape_code::_id_B205( var_0.origin, var_0.angles );
    thread maps\favela_escape_code::_id_CB76();
    thread _id_BF69();
}

_id_C403()
{
    soundscripts\_snd::snd_message( "start_solorun_rooftops_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup4" );
    common_scripts\utility::flag_set( "portalgroup6" );
    common_scripts\utility::flag_set( "portalgroup7" );
    common_scripts\utility::flag_set( "solorun_objective_display" );
    common_scripts\utility::flag_set( "radiotower_start" );
    common_scripts\utility::flag_set( "market_introdialogue_done" );
    common_scripts\utility::flag_set( "market_evac_chopper_incoming" );
    common_scripts\utility::flag_set( "market_evac_player_on_roof" );
    common_scripts\utility::flag_set( "solorun_start" );
    maps\favela_escape_lighting::_id_C584( "favela_escape_solorun_buildings" );
    maps\favela_escape_code::_id_CAF6();
    level.player takeallweapons();
    var_0 = common_scripts\utility::getstruct( "struct_solorun_rooftops_start_player", "targetname" );
    level.player maps\favela_escape_code::_id_B205( var_0.origin, var_0.angles );
    thread _id_BF69( "rooftops" );
}

_id_B350()
{
    soundscripts\_snd::snd_message( "start_solorun_chopper_checkpoint" );
    common_scripts\utility::flag_set( "portalgroup7" );
    common_scripts\utility::flag_set( "radiotower_start" );
    common_scripts\utility::flag_set( "market_evac_player_on_roof" );
    common_scripts\utility::flag_set( "solorun_player_at_balcony" );
    maps\favela_escape_lighting::_id_C584( "favela_escape_solorun_nearend" );
    maps\favela_escape_code::_id_CAF6();
    level.player takeallweapons();
    var_0 = common_scripts\utility::getstruct( "struct_solorun_chopper_start_player", "targetname" );
    level.player maps\favela_escape_code::_id_B205( var_0.origin, var_0.angles );
    thread _id_BF69( "chopperjump" );
}

_id_C17B()
{
    thread _id_BFCE();
    thread maps\favela_escape_code::_id_D529();
    thread maps\favela_escape_code::_id_CD0A();
    thread maps\favela_escape_code::_id_BD7D();
    thread maps\favela_escape_code::_id_C823();
    thread maps\favela_escape_code::_id_CD3C();
    thread maps\favela_escape_code::_id_ADE1();
    thread maps\favela_escape_code::_id_CDEF();
    thread maps\favela_escape_code::_id_C5D4();
    thread maps\favela_escape_code::_id_C000();
    thread maps\favela_escape_code::destroyed_car_no_burn();
    common_scripts\utility::flag_set( "portalgroup1" );
    common_scripts\utility::flag_set( "portalgroup2" );
    common_scripts\utility::flag_set( "radiotower_start" );
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::array_thread( maps\favela_escape_code::_id_B562(), maps\_utility::magic_bullet_shield );
    thread maps\favela_escape_code::_id_BAA8();

    if ( getdvar( "introscreen" ) != "0" )
        level waittill( "introscreen_complete" );
    else
        common_scripts\utility::flag_set( "introscreen_start_dialogue" );

    common_scripts\utility::array_thread( getentarray( "animated_chicken", "targetname" ), maps\favela_escape_code::_id_A8E1 );
    thread maps\favela_escape_code::_id_CB9F();
    common_scripts\utility::flag_wait( "player_start_moving" ) maps\_utility::trigger_wait_targetname( "trig_radiotower_brushpath_end" );
    common_scripts\utility::array_thread( maps\favela_escape_code::_id_B562(), maps\favela_escape_code::_id_AB1C );
    thread maps\favela_escape_code::_id_AADB();
    maps\_utility::delaythread( 0.75, maps\favela_escape_code::_id_B5DF );
    thread maps\favela_escape_code::_id_CE50();
    maps\_utility::trigger_wait_targetname( "trig_radiotower_exit" );
    common_scripts\utility::flag_set( "radiotower_exit" );
    thread maps\_utility::autosave_by_name( "street_start" );
    thread maps\favela_escape_code::_id_A974();
    thread _id_CC67();
}
#using_animtree("generic_human");

_id_BFCE()
{
    level endon( "radiotower_exit" );
    level endon( "cleaning_up_rojas" );
    var_0 = getent( "intro_anim_node", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_1.script_drone = undefined;
    var_2 = var_1 maps\_utility::spawn_ai( 1 );
    level.rojas = var_2;
    var_3 = maps\_utility::spawn_anim_model( "rojas_restraints" );
    var_4 = "intro_rojas_idle";
    var_5 = "intro_rojas_death";
    var_0 thread maps\_anim::anim_generic_loop( var_2, var_4, "stop_idle_rojas" );
    var_0 thread maps\_anim::anim_loop_solo( var_3, "idle" );
    level thread _id_C53A( var_2, var_0, var_3 );
    var_2.name = "Rojas";
    var_2.grenadeammo = 0;
    var_2.dropweapon = 0;
    var_2 maps\_utility::set_battlechatter( 0 );
    var_2.cheat._id_D4B8 = 1;
    var_2.allowdeath = 1;
    var_2.deathanim = %h2_favela_escape_crucified_death;
    var_2.noragdoll = 1;
    var_2.takedamage = 1;
    var_2.animname = "generic";
    var_2.health = 5000;
    var_2 maps\_utility::disable_pain();
    var_2 maps\_utility::magic_bullet_shield( 1 );
    var_2 maps\_utility::ai_ignore_everything();
    var_2._id_CB51 = 1;
    var_2 maps\_utility::add_damage_function( maps\favela_escape_code::_id_B5BE );

    for (;;)
    {
        var_2 waittill( "damage", var_6 );

        if ( var_6 <= 1 )
            continue;

        break;
    }

    var_0 notify( "stop_idle_rojas" );
    thread maps\favela_escape_aud::crucified_rojas_death();
    level.player thread maps\_damagefeedback::updatedamagefeedbackhud( 0, var_2 );
    level.player thread maps\_damagefeedback::updatedamagefeedbacksnd( var_2 );
    var_2.team = "neutral";
    var_2.name = undefined;
    var_2 maps\_utility::remove_damage_function( maps\favela_escape_code::_id_B5BE );
    var_0 maps\_anim::anim_single_solo( var_2, var_5 );
    var_0 maps\_anim::anim_last_frame_solo( var_2, var_5 );
}

_id_C53A( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait( "radiotower_exit" );
    level notify( "cleaning_up_rojas" );

    if ( isdefined( var_0 ) )
        var_0 maps\_utility::anim_stopanimscripted();

    var_1 maps\_utility::anim_stopanimscripted();
    var_2 maps\_utility::anim_stopanimscripted();
    wait 0.05;

    if ( isdefined( var_0 ) )
        var_0 delete();

    var_1 delete();
    var_2 delete();
}

_id_CC67( var_0 )
{
    thread _id_BE59( var_0 );
    thread maps\favela_escape_code::_id_B683();
    thread maps\favela_escape_code::_id_AA21();
    thread maps\favela_escape_code::_id_B61B();
    thread maps\favela_escape_code::_id_B7E2();
    thread maps\favela_escape_code::_id_D293();
    thread maps\favela_escape_code::_id_C328();
    thread maps\favela_escape_code::_id_ABD0();
    thread maps\favela_escape_code::_id_C647();
    thread maps\favela_escape_code::_id_D4A3();
    thread maps\favela_escape_code::_id_C6E9();
    thread _id_B061();
}

_id_BE59( var_0 )
{
    var_1 = "street_advance";
    var_2 = 5;
    var_3 = "uphill_advance";
    var_4 = 6;
    var_5 = "market_advance";
    var_6 = 6;

    if ( !isdefined( var_0 ) )
    {
        thread maps\favela_escape_code::_id_CC6E( var_1, var_2 );
        common_scripts\utility::flag_wait( var_1 + "_" + var_2 );
        thread maps\favela_escape_code::_id_CC6E( var_3, var_4 );
        common_scripts\utility::flag_wait( var_3 + "_" + var_4 );
        thread maps\favela_escape_code::_id_CC6E( var_5, var_6 );
        common_scripts\utility::flag_wait( var_5 + "_" + var_6 );
    }
    else
    {
        if ( var_0 == "vista2" )
        {
            thread maps\favela_escape_code::_id_CC6E( var_3, var_4, 3 );
            common_scripts\utility::flag_wait( var_3 + "_" + var_4 );
            thread maps\favela_escape_code::_id_CC6E( var_5, var_6 );
            common_scripts\utility::flag_wait( var_5 + "_" + var_6 );
        }

        if ( var_0 == "market" )
        {
            thread maps\favela_escape_code::_id_CC6E( var_3, var_4, 6 );
            common_scripts\utility::flag_wait( var_3 + "_" + var_4 );
            thread maps\favela_escape_code::_id_CC6E( var_5, var_6 );
            common_scripts\utility::flag_wait( var_5 + "_" + var_6 );
        }
    }
}

_id_B061()
{
    thread maps\favela_escape_code::_id_B7B4();
    thread _id_AD2C();

    foreach ( var_1 in level._id_C2F8 )
        var_1 maps\favela_escape_code::_id_AA25( 1 );

    common_scripts\utility::array_thread( level._id_C2F8, maps\favela_escape_code::_id_CDBA, 0 );
    maps\_utility::remove_global_spawn_function( "allies", maps\favela_escape_code::_id_CDBA );
    thread maps\favela_escape_code::_id_CC88();
    thread maps\favela_escape_code::_id_D0F7();
    thread maps\favela_escape_code::_id_C6E6();
    thread _id_AAC2();
}

_id_AD2C()
{
    common_scripts\utility::flag_wait( "market_advance_4" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "vehicle_market_fake_chopper_1" );
    var_0 vehicle_turnengineoff();
    common_scripts\utility::flag_wait( "market_chopper_spawned" );
    wait 1;
    var_0 delete();
    common_scripts\utility::flag_wait( "market_chopper_leaving_scene" );
    wait 5;
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "vehicle_market_fake_chopper_2" );
    var_0 vehicle_turnengineoff();
    common_scripts\utility::flag_wait( "market_evac_chopper_spawned" );
    wait 4;
    var_0 delete();
}

_id_AAC2()
{
    common_scripts\utility::flag_wait( "market_evac_start" );
    thread maps\favela_escape_code::animated_soccer_goals();
    thread maps\favela_escape_code::_id_C41D();
    thread maps\favela_escape_code::soccerfield_animated_wires();

    foreach ( var_1 in level._id_C2F8 )
        var_1 maps\favela_escape_code::_id_AA25( 0 );

    level notify( "color_flags_advance_stop" );
    var_3 = common_scripts\utility::getstructarray( "struct_market_evac_friendly_warp", "targetname" );
    common_scripts\utility::flag_set( "market_respawn_trigger" );

    foreach ( var_6, var_5 in level._id_C2F8 )
        var_5 thread _id_ADDF( var_3[var_6] );

    var_7 = maps\favela_escape_code::_id_B562();
    var_8 = undefined;

    if ( !_id_D28B( var_7 ) )
    {
        if ( var_7.size )
        {
            foreach ( var_5 in var_7 )
            {
                var_5 maps\favela_escape_code::_id_AD97();
                var_5 maps\_utility::disable_ai_color();
                var_10 = [];
                var_10[0] = var_5;
                thread maps\_utility::ai_delete_when_out_of_sight( var_10, 1000 );
            }
        }

        var_12 = getent( "market_evac_redshirt_spawner", "targetname" );
        var_5 = var_12 maps\_utility::spawn_ai();
        var_5 maps\favela_escape_code::_id_CF21();
        var_5 maps\favela_escape_code::_id_BA72();
        var_8 = var_5;
    }
    else
        var_8 = var_7[0];

    maps\_colors::kill_color_replacements();
    var_8 maps\favela_escape_code::_id_B286();
    var_8 maps\_utility::set_force_color( "p" );
    maps\_utility::player_speed_percent( 85, 1 );
    common_scripts\utility::array_thread( level._id_C2F8, maps\favela_escape_code::_id_ABA5, 1.25 );
    maps\_utility::battlechatter_off( "allies" );
    level thread maps\favela_escape_code::_id_CACA();
    level thread maps\favela_escape_code::_id_A9FB();
    level._id_BAD2 maps\_utility::delaythread( 2, maps\favela_escape_code::dialogue, "favesc_cmt_therespavelow" );
    thread _id_BEAB();
    common_scripts\utility::flag_wait( "market_evac_chopper_incoming" );
    maps\_utility::autosave_by_name( "market_evac_chopper_incoming" );
    var_7 = maps\favela_escape_code::_id_B562();

    foreach ( var_5 in var_7 )
        var_5 maps\favela_escape_code::_id_B286();

    soundscripts\_snd::snd_message( "start_evac_fakefire_rpgs" );
    maps\_utility::delaythread( 0.5, maps\favela_escape_code::_id_B3AC );
    maps\_utility::delaythread( 4, maps\favela_escape_code::_id_C12F );
    thread maps\favela_escape_code::_id_AA08();
    common_scripts\utility::flag_set( "market_evac_ambush_start" );
    maps\_utility::player_speed_percent( 90, 1 );
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    common_scripts\utility::flag_wait( "market_evac_enemies_depleted" );
    thread _id_C6EB();
}

_id_ADDF( var_0 )
{
    if ( distance( self.origin, level.player.origin ) < 800 )
        return;

    if ( self != level._id_BAD2 && self != level._id_C947 )
    {
        if ( isdefined( self.melee ) )
            return;
    }

    maps\favela_escape_code::_id_B21F( var_0 );
}

_id_D28B( var_0 )
{
    if ( !var_0.size )
        return 0;

    var_1 = var_0[0];

    if ( !isalive( var_1 ) )
        return 0;

    if ( isdefined( var_1.melee ) )
        return 0;

    return 1;
}

_id_BEAB()
{
    common_scripts\utility::flag_wait( "market_evac_friendlies_go_outside" );
    common_scripts\utility::array_thread( level._id_C2F8, ::_id_B79D );
    var_0 = getnode( "node_sarge_soccerfield_cover", "targetname" );
    var_1 = getnode( "node_hero1_soccerfield_cover", "targetname" );
    var_2 = getnode( "node_redshirt_soccerfield_cover", "targetname" );
    var_3 = maps\favela_escape_code::_id_B997();
    level._id_BAD2 thread _id_B31D( var_0 );
    level._id_C947 thread _id_B31D( var_1 );
    var_3 thread _id_B31D( var_2 );
    common_scripts\utility::flag_wait( "market_evac_enemies_depleted" );
}

_id_B79D()
{
    thread maps\_utility::clear_force_color();
    thread maps\_utility::enable_heat_behavior();
    thread maps\favela_escape_code::_id_A85F();
    thread maps\favela_escape_code::_id_B92A( 256 );
    thread maps\_utility::disable_arrivals();
    thread maps\_utility::set_fixednode_false();
    thread maps\_utility::pathrandompercent_set( 0 );
    thread maps\favela_escape_code::_id_CDBA( 0 );
}

_id_B31D( var_0 )
{
    maps\_utility::ent_flag_init( "climbing_ok" );
    var_1 = maps\favela_escape_code::_id_CC68( var_0 );
    var_1 = common_scripts\utility::array_remove( var_1, var_0 );
    self setgoalnode( var_0 );
    common_scripts\utility::flag_wait( "market_evac_enemies_depleted" );
    thread maps\favela_escape_code::_id_BABA();
    thread maps\favela_escape_code::_id_BFD0( 5.0 );

    foreach ( var_3 in var_1 )
    {
        self setgoalnode( var_3 );
        self waittill( "goal" );
    }

    maps\_utility::disable_heat_behavior();
    maps\_utility::ent_flag_set( "climbing_ok" );
}

_id_C6EB()
{
    common_scripts\utility::array_thread( level._id_C2F8, maps\favela_escape_code::_id_ABA5, 1 );
    maps\_utility::player_speed_percent( 90, 1 );
    thread maps\favela_escape_code::_id_B6B5();
    level._id_BAD2 thread maps\favela_escape_code::dialogue( "favesc_cmt_gettorooftops" );
    common_scripts\utility::flag_wait( "market_evac_friendlies_start_climbing" );
    var_0 = 1148;
    thread maps\favela_escape_code::_id_ADCB( var_0 );
    thread _id_CAEF();
    common_scripts\utility::flag_wait( "market_evac_player_on_roof" );
    thread _id_C53B();
}

_id_CAEF()
{
    var_0 = common_scripts\utility::getstruct( "market_evac_friendlies_climb_animspot", "targetname" );
    var_1 = "favela_escape_rooftop_traverse_L";
    var_2 = "favela_escape_rooftop_traverse_R";
    var_3 = "favela_escape_rooftop_traverse_M";
    var_4 = "favela_escape_rooftop_traverse_M_idle";
    var_5 = "favela_escape_rooftop_traverse_M_idle_2_run";
    var_6 = maps\favela_escape_code::_id_B997();
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::ent_flag_init, "roofrun_start" );
    var_6 maps\favela_escape_code::_id_B286();
    common_scripts\utility::array_thread( level._id_C2F8, maps\favela_escape_code::ignore_everything );
    common_scripts\utility::array_thread( level._id_C2F8, maps\favela_escape_code::_id_B92A, 32 );
    common_scripts\utility::array_thread( level._id_C2F8, maps\favela_escape_code::_id_CDC8, 16 );
    var_7 = getnode( "node_roofrun_hero1_waitforplayer", "targetname" );
    var_8 = getnode( "node_roofrun_redshirt_waitforplayer", "targetname" );
    common_scripts\utility::array_thread( level._id_C2F8, maps\_utility::clear_force_color );
    level._id_A8D5 = 0;
    level._id_C947 thread _id_C2DE( var_0, var_1, var_7 );
    var_6 thread _id_C2DE( var_0, var_2, var_8 );
    level._id_BAD2 thread _id_B2AD( var_0, var_3, var_4, var_5 );

    while ( level._id_A8D5 < level._id_C2F8.size )
        wait 0.05;

    common_scripts\utility::trigger_off( "sbmodel_market_evac_playerblock", "targetname" );
}

_id_C2DE( var_0, var_1, var_2 )
{
    self endon( "death" );
    maps\_utility::ent_flag_wait( "climbing_ok" );
    var_0 maps\_anim::anim_generic_reach( self, var_1 );
    level._id_A8D5++;
    var_0 maps\_anim::anim_generic( self, var_1 );
    self setgoalnode( var_2 );
    wait 0.05;
    maps\_utility::ent_flag_set( "roofrun_start" );
}

_id_B2AD( var_0, var_1, var_2, var_3 )
{
    maps\_utility::ent_flag_wait( "climbing_ok" );
    common_scripts\utility::flag_set( "market_evac_follow_sarge_climb" );
    var_0 maps\_anim::anim_generic_reach( self, var_1 );
    level._id_A8D5++;
    var_0 maps\_anim::anim_generic( self, var_1 );

    if ( _id_CDB2() )
    {
        _id_B3AB::_id_BEBA( "upperbody", level.player, 2000, 90, 90, 30, 30, 1, 0, 10, -70 );
        self setgoalpos( self.origin );
        var_0 thread maps\favela_escape_code::soap_random_idle_anims( self, var_2 );

        while ( _id_CDB2() )
            wait 0.05;

        _id_B3AB::_id_B0AC();
        var_0 notify( "sarge_idle_stop" );
        var_0 maps\_anim::anim_generic( self, var_3 );
    }

    var_4 = getnode( "node_roofrun_sarge_waitforplayer", "targetname" );
    self setgoalnode( var_4 );
    wait 0.05;
    maps\_utility::ent_flag_set( "roofrun_start" );
}

_id_CDB2()
{
    if ( common_scripts\utility::flag( "market_evac_player_mantled" ) )
        return 0;

    var_0 = getent( "trig_market_evac_mantlehelper", "targetname" );

    if ( level.player istouching( var_0 ) )
        return 0;

    return 1;
}

_id_C53B()
{
    maps\_utility::autosave_by_name( "roofrun_start" );
    level._id_C958 = 0;
    thread maps\favela_escape_code::_id_BD67();
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_wait( "roofrun_player_at_start_loc" );
    thread maps\favela_escape_code::_id_B4CA( 0, "heli_loop", 10 );
    thread maps\favela_escape_code::early_fall_kill_trig_remove();
    thread maps\favela_escape_code::wibble_helicopter();
    thread _id_BF28();
    maps\_utility::delaythread( 3, maps\favela_escape_code::_id_CDA6 );
    maps\_utility::player_speed_percent( 90, 1 );
    setsaveddvar( "player_sprintUnlimited", "1" );
    common_scripts\utility::array_thread( level._id_C2F8, maps\favela_escape_code::_id_AA7D, 1.135 );

    foreach ( var_2, var_1 in level._id_C2F8 )
    {
        var_1.animname = "freerunner";
        var_1 thread maps\favela_escape_code::_id_B2CC();

        if ( var_1 == level._id_BAD2 )
        {
            var_1 thread maps\favela_escape_code::_id_B58A();
            continue;
        }

        if ( var_1 == level._id_C947 )
        {
            var_1 thread maps\favela_escape_code::_id_CCED();
            continue;
        }

        var_1 thread maps\favela_escape_code::_id_AB7D();
    }

    thread maps\favela_escape_code::_id_AC08();
    thread maps\favela_escape_code::_id_C4F0();
    common_scripts\utility::flag_wait( "player_recovery_done" );
    thread _id_BF69();
}

_id_BF28()
{
    var_0 = getent( "veh_chopper_roofrun", "targetname" );
    var_1 = undefined;

    if ( isdefined( var_0.last_spawned_vehicle ) )
        var_1 = var_0.last_spawned_vehicle;
    else
        var_0 waittill( "spawned", var_1 );

    var_1.animname = "chopper";
    var_1 thread maps\favela_escape_aud::_id_A9B9();
    var_1 waittill( "reached_dynamic_path_end" );
    common_scripts\utility::flag_wait( "player_near_bigjump" );
    var_1 playsound( "pavelow_door_open" );
    var_1 setanim( var_1 maps\_utility::getanim( "cargodoor_open" ) );
}

_id_BF69( var_0 )
{
    common_scripts\utility::flag_set( "solorun_start" );
    var_1 = undefined;

    if ( !isdefined( var_0 ) )
        var_0 = "normal";

    maps\_utility::player_speed_percent( 100, 0.1 );
    maps\favela_escape_code::_id_C1F3( 1.5, 0.1 );
    setsaveddvar( "player_sprintUnlimited", "1" );
    thread maps\favela_escape_code::_id_C3F2();
    level.player enableweapons();
    level.player giveweapon( "freerunner" );
    level.player switchtoweapon( "freerunner" );
    thread player_solorun_audio();

    if ( var_0 == "chopperjump" )
    {
        thread maps\favela_escape_code::_id_B47F();
        thread maps\favela_escape_code::rooftop_slide_dust_exploder();
        thread maps\favela_escape_code::_id_AADD();
        var_1 = 0;
        thread maps\favela_escape_code::_id_ADD4( var_1 );
    }
    else if ( var_0 == "rooftops" )
    {
        thread _id_AC7B();
        thread maps\favela_escape_code::_id_C1FA();
        thread maps\favela_escape_code::_id_AEDB();
        thread maps\favela_escape_code::_id_C449();
        thread maps\favela_escape_code::_id_C0DF();
        thread maps\favela_escape_code::_id_C95B();
        thread maps\favela_escape_code::_id_C900( 0 );
        thread maps\favela_escape_code::_id_B6A3();
        thread maps\favela_escape_code::_id_C35E();
        thread maps\favela_escape_code::_id_C307();
        thread maps\favela_escape_code::_id_CCFD();
        thread maps\favela_escape_code::_id_ABC5();
        thread maps\favela_escape_code::_id_B47F();
        thread maps\favela_escape_code::rooftop_slide_dust_exploder();
        thread maps\favela_escape_code::_id_AADD();
        thread maps\favela_escape_code::_id_C87E();
        thread maps\favela_escape_code::_id_ADD4( var_1 );
    }
    else
    {
        thread maps\favela_escape_code::_id_D030( 0.75 );
        thread maps\favela_escape_code::_id_A879();
        thread _id_AC7B();
        thread maps\favela_escape_code::_id_C1FA();
        thread maps\favela_escape_code::_id_AEDB();
        thread maps\favela_escape_code::_id_C449();
        thread maps\favela_escape_code::_id_C0DF();
        thread maps\favela_escape_code::_id_C95B();
        thread maps\favela_escape_code::_id_C900();
        thread maps\favela_escape_code::_id_B6A3();
        thread maps\favela_escape_code::_id_C35E();
        thread maps\favela_escape_code::_id_C307();
        thread maps\favela_escape_code::_id_CCFD();
        thread maps\favela_escape_code::_id_ABC5();
        thread maps\favela_escape_code::_id_B47F();
        thread maps\favela_escape_code::rooftop_slide_dust_exploder();
        thread maps\favela_escape_code::_id_AADD();
        thread maps\favela_escape_code::_id_C87E();
        thread maps\favela_escape_code::_id_ADD4( var_1 );
    }

    thread maps\favela_escape_code::player_on_slide_magic_bullet();
    level.slide_minimal_duration = 0.7;
    setsaveddvar( "sm_sunShadowWorldHeight", level.sunshadowworldheight );
    common_scripts\utility::flag_wait( "solorun_player_boarded_chopper" );
    wait 9;
    var_2 = 4;
    var_3 = 3;
    soundscripts\_snd::snd_message( "start_fade_out_level" );
    var_4 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_4 fadeovertime( var_2 );
    var_4.alpha = 1;
    wait(var_2);
    common_scripts\utility::flag_set( "level_faded_to_black" );
    wait(var_3);
    maps\_utility::nextmission();
}

_id_AC7B()
{
    common_scripts\utility::flag_wait( "solorun_player_near_balcony" );

    if ( _id_C72A() )
        maps\_autosave::_autosave_game_now();
}

_id_C72A()
{
    var_0 = getent( "vol_solorun_ai_behind_player_near_balcony", "targetname" );
    var_1 = getaispeciesarray( "bad_guys", "all" );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3.enemy ) )
            continue;

        if ( !isplayer( var_3.enemy ) )
            continue;

        if ( isdefined( var_3.melee ) && isdefined( var_3.melee.target ) && isplayer( var_3.melee.target ) )
            return 0;

        if ( var_3.finalaccuracy < 0.021 && var_3.finalaccuracy > -1 )
            continue;

        if ( var_0 istouching( var_3 ) )
            return 0;

        if ( var_3.a.lastshoottime > gettime() - 500 )
        {
            if ( var_3 animscripts\utility::canseeenemy( 0 ) && var_3 canshootenemy( 0 ) )
                return 0;
        }

        if ( isdefined( var_3.a.aimidlethread ) && var_3 animscripts\utility::canseeenemy( 0 ) && var_3 canshootenemy( 0 ) )
            return 0;
    }

    if ( maps\_utility::player_is_near_live_grenade() )
        return 0;

    return 1;
}

player_solorun_audio()
{
    level.player endon( "death" );
    level endon( "chopperjump_player_jump" );
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 linkto( level.player );
    thread delete_player_breath_ent_on_death( var_0 );
    var_1 = 1200;
    var_2 = gettime() + var_1;

    for (;;)
    {
        if ( level.player issprinting() )
        {
            if ( gettime() >= var_2 )
            {
                var_0 playsound( "h2_plr_sprint_breath_vo" );
                var_2 = gettime() + var_1;
            }
        }

        if ( level.player _meth_83C0() )
        {
            var_0 playrumbleonentity();
            var_0 playsound( "h2_plr_sprint_jump_vo" );

            while ( level.player _meth_83C0() )
                wait 0.05;

            var_2 = gettime() + var_1;
        }

        wait 0.05;
    }
}

delete_player_breath_ent_on_death( var_0 )
{
    level.player waittill( "death" );
    var_0 playrumbleonentity();
    wait 0.05;
    var_0 delete();
}

static_model_group_setup()
{
    thread static_model_group_think( "static_model_group_flag_1", 1 );
    thread static_model_group_think( "objects_marketA", 2 );
    thread static_model_group_think( "objects_marketB", 3 );
    thread static_model_group_think( "objects_marketC", 4 );
}

static_model_group_think( var_0, var_1 )
{
    _func_31C( var_1 );

    for (;;)
    {
        common_scripts\utility::flag_wait( var_0 );
        _func_31B( var_1 );
        common_scripts\utility::flag_waitopen( var_0 );
        _func_31C( var_1 );
    }
}

hide_objects_in_market( var_0, var_1, var_2 )
{
    level endon( var_0 );

    for (;;)
    {
        if ( common_scripts\utility::flag( var_2 ) )
        {
            var_3 = getentarray( var_1, "script_noteworthy" );

            foreach ( var_5 in var_3 )
                var_5 show();
        }
        else
        {
            var_3 = getentarray( var_1, "script_noteworthy" );

            foreach ( var_5 in var_3 )
                var_5 hide();
        }

        level waittill( var_2 );
    }
}
