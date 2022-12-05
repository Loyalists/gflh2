// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_CDF6()
{
    maps\_utility::add_start( "wakeup", ::_id_A859, "", ::_id_BD4B );
    maps\_utility::add_start( "wakefast", ::_id_A859, "", ::_id_BD4B );
    maps\_utility::add_start( "turnbuckle", ::_id_C8EC, "", ::_id_B33A );
    maps\_utility::add_start( "gun_fight", ::_id_B734, "", ::_id_A99A );
    maps\_utility::add_start( "crawl", ::_id_B5E6, "", ::_id_CB2E );
    maps\_utility::add_start( "gun_kick", ::_id_B8CE, "", ::_id_AEB5 );
    maps\_utility::add_start( "wounded", ::_id_C542, "Watch Price/Shep fight", ::_id_C2B2 );
    maps\_utility::add_start( "pullout", ::_id_A84F, "", ::_id_CF7C );
    maps\_utility::add_start( "kill", ::_id_C639, "", ::_id_ABC0 );
    maps\_utility::add_start( "endgame", ::_id_D25F, "", ::endgame );
    maps\_utility::add_start( "museum_freeroam", ::_id_D441 );
    maps\_utility::add_start( "museum_credits", ::_id_D441 );
}

_id_D441()
{

}

_id_D080()
{
    maps\_utility::add_hint_string( "knife", &"AF_CHASE_PRESS_USE", maps\af_chase_knife_fight_code::_id_BBD7, undefined, "small_background" );
    maps\_utility::add_control_based_hint_strings( "hint_crawl_right", &"AF_CHASE_HINT_CRAWL_RIGHT", maps\af_chase_knife_fight_code::_id_BDCE, &"AF_CHASE_HINT_CRAWL_RIGHT_PC", undefined, "small_background" );
    maps\_utility::add_control_based_hint_strings( "hint_crawl_left", &"AF_CHASE_HINT_CRAWL_LEFT", maps\af_chase_knife_fight_code::_id_C15B, &"AF_CHASE_HINT_CRAWL_LEFT_PC", undefined, "small_background" );
    maps\_utility::add_hint_string( "hint_melee", &"AF_CHASE_HINT_MELEE_EMPTY", maps\af_chase_knife_fight_code::_id_C00E, undefined, "small_background" );
    common_scripts\utility::flag_init( "player_learned_melee" );
    common_scripts\utility::flag_init( "stop_heart" );
    common_scripts\utility::flag_init( "fell_off_waterfall" );
    common_scripts\utility::flag_init( "shepherd_spawned" );
    common_scripts\utility::flag_init( "wakeup_start" );
    common_scripts\utility::flag_init( "player_standing" );
    common_scripts\utility::flag_init( "focused_on_knife" );
    common_scripts\utility::flag_init( "player_looks_at_knife" );
    common_scripts\utility::flag_init( "helicopter_sound_played" );
    common_scripts\utility::flag_init( "player_uses_knife" );
    common_scripts\utility::flag_init( "player_aims_knife_at_shepherd" );
    common_scripts\utility::flag_init( "stop_aftermath_player" );
    common_scripts\utility::flag_init( "two_hand_pull_begins" );
    common_scripts\utility::flag_init( "price_shepherd_fight_e_flag" );
    common_scripts\utility::flag_init( "gloat_fade_in" );
    common_scripts\utility::flag_init( "dialog_all_finished" );
    common_scripts\utility::flag_init( "fog_pulse_window_for_spawn" );
    common_scripts\utility::flag_init( "player_near_shepherd" );
    common_scripts\utility::flag_init( "turn_buckle_fadeout" );
    common_scripts\utility::flag_init( "steady_boat_participating" );
    common_scripts\utility::flag_init( "trigger_over_waterfall" );
    common_scripts\utility::flag_init( "shepherd_stumbles_by" );
    common_scripts\utility::flag_init( "shepherd_killed" );
    common_scripts\utility::flag_init( "player_throws_knife" );
    common_scripts\utility::flag_init( "fade_away_idle_crawl_fight" );
    common_scripts\utility::flag_init( "price_told_player_to_hold_steady" );
    common_scripts\utility::flag_init( "stop_boat_dialogue" );
    common_scripts\utility::flag_init( "af_chase_nextmission" );
    common_scripts\utility::flag_init( "shepherd_should_do_idle_b" );
    common_scripts\utility::flag_init( "player_touched_shepherd" );
    common_scripts\utility::flag_init( "bloody_player_rig" );
    common_scripts\utility::flag_init( "end_heli_crashed" );
    common_scripts\utility::flag_init( "end_heli_nearly_crashed" );
    common_scripts\utility::flag_init( "player_gets_up_after_waterfall" );
    common_scripts\utility::flag_init( "water_cliff_jump_splash_sequence" );
    common_scripts\utility::flag_init( "killed_pickup_heli" );
    common_scripts\utility::flag_init( "fog_out_stumble_shepherd" );
    common_scripts\utility::flag_init( "blinder_effect" );
    common_scripts\utility::flag_init( "goodtime_for_fog_blast" );
    common_scripts\utility::flag_init( "sandstorm_fully_masked" );
    common_scripts\utility::flag_init( "fight_objective_positioned" );
    common_scripts\utility::flag_init( "turn_buckle_start" );
    common_scripts\utility::flag_init( "af_chase_final_ending" );
    common_scripts\utility::flag_init( "af_chase_ending_credits" );
    common_scripts\utility::flag_init( "af_chase_final_fight" );
    common_scripts\utility::flag_init( "af_chase_see_shepherd" );
    common_scripts\utility::flag_init( "special_kill_anim_playing" );
    common_scripts\utility::flag_init( "price_was_killed" );
    common_scripts\utility::flag_init( "crawl_gameplay_started" );
    common_scripts\utility::flag_init( "crawl_gameplay_complete" );
    common_scripts\utility::flag_init( "shepherd_fights_price_sequence_start" );
    common_scripts\utility::flag_init( "throw_knife_pulled_out" );
    common_scripts\utility::flag_init( "throw_knife_gameplay_started" );
    common_scripts\utility::flag_init( "crawl_gameplay_player_input" );
    thread _id_C77B::main();
    level._id_C88C = &"AF_CHASE_FAILED_TO_PULL_KNIFE";
    setdynamicdvar( "enable_heartbeat_overlay", 1 );
}

_id_B068()
{
    _func_2F1( 0, "xy", 1.5, 0.3 );
    maps\af_chase_knife_fight_code::_id_B4E8( "bump_small_start", "bump_big_start" );
    level._id_AFD9 = 2500;
    level._id_C6AC = 1200;
    maps\_compass::setupminimap( "compass_map_afghan_chase" );

    if ( level.script == "ending" )
        maps\ending_aud::main();
    else
        maps\af_chase_aud::main();

    waittillframeend;

    if ( isdefined( level.stop_load ) && level.stop_load )
        return;
}

empty()
{

}

_id_D220()
{
    maps\_utility::battlechatter_off( "axis" );
    maps\_utility::battlechatter_off( "allies" );
    maps\af_chase_knife_fight_code::_id_D545();
    level.player allowjump( 0 );
    thread maps\af_chase_knife_fight_code::_id_C87C();
    thread maps\af_chase_knife_fight_code::_id_B61C();
    anim.fire_notetrack_functions["empty_script"] = ::empty;
    var_0 = common_scripts\utility::spawn_tag_origin();
    level._id_C381 = var_0;
    var_1 = getdvarint( "cg_fov" );
    var_0.origin = ( var_1, 0, 0 );
    maps\_utility::delaythread( 0.05, maps\af_chase_knife_fight_code::_id_AE90 );
    thread _id_C77B::_id_BD5C();
    maps\af_chase_knife_fight_code::_id_AA11();
    setsaveddvar( "g_friendlyNameDist", 0 );
    setsaveddvar( "sm_sunSampleSizeNear", 0.25 );
    maps\af_chase_knife_fight_code::_id_BF4D();
    maps\af_chase_knife_fight_code::_id_B16A();
    level._id_BB65 = spawnstruct();
    level._id_BB65.min = 0.5;
    level._id_BB65._id_59F9 = 0.8;
    maps\_utility::remove_extra_autosave_check( "boat_check_trailing" );
    maps\_utility::remove_extra_autosave_check( "boat_check_player_speeding_along" );
    maps\_utility::set_wind( 100, 0.7, 0.4 );
    setsaveddvar( "cg_fov", 65 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "hud_showstance", 0 );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ui_hideCompassTicker", 1 );
    setsaveddvar( "actionSlotsHide", 1 );
    level.player _meth_830F( 0 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player disableoffhandweapons();
    thread _id_CC30::_id_BCE4();
    thread maps\af_chase_knife_fight_code::_id_BE9D();
    level.player takeallweapons();
    level._id_A87F.greenberet_disabled = 1;
    objective_add( 1, "invisible", &"AF_CHASE_PURSUE" );
    objective_state_nomessage( 1, "done" );
    thread knife_fight_culldist();
}

_id_A859()
{
    soundscripts\_snd::snd_message( "start_wakeup_after_crash_checkpoint" );
}

_id_D142()
{
    var_0 = animscripts\utility::array( 11, 9.5, 8 );
    var_1 = animscripts\utility::array( 9, 7.5, 6 );
    var_2 = _func_46();

    for ( var_3 = ( var_2[0], var_2[1], var_2[2] ); !common_scripts\utility::flag( "do_museum_credits" ); var_3 = var_6 )
    {
        if ( common_scripts\utility::flag( "h2_sunintensity_intense" ) )
        {
            var_4 = common_scripts\utility::random( var_1 );
            var_5 = randomfloatrange( 3, 4 );
        }
        else
        {
            var_4 = common_scripts\utility::random( var_0 );
            var_5 = randomfloatrange( 1, 2 );
        }

        var_5 = maps\_utility::round_float( var_5, 1, 0 );
        var_6 = ( var_4, var_4, var_4 );

        for ( var_7 = 0; var_7 < var_5; var_7 += 0.05 )
        {
            var_8 = vectorlerp( var_3, var_6, var_7 / var_5 );
            _func_47( var_8[0], var_8[1], var_8[2] );
            wait 0.05;
        }
    }

    _func_48();
}

_id_CD28()
{
    var_0 = newclienthudelem( level.player );
    var_0._id_BC2F = 648;
    var_0._id_AA7E = 486;
    var_0._id_C271 = 640;
    var_0._id_C3A3 = 480;
    setsaveddvar( "cg_altDamageBrightness", 0 );
    setsaveddvar( "cg_altDamageAlpha", "1" );
    setsaveddvar( "cg_altDamageFlashColor", ".125 0 0" );
    setsaveddvar( "cg_bloodThickColor", "100 0 0 100" );
    var_1 = "overlay_low_health";
    var_0.x = 320;
    var_0.y = 240;
    var_0 setshader( var_1, var_0._id_C271, var_0._id_C3A3 );
    var_0.splatter = 1;
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.sort = 1;
    var_0.foreground = 0;
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 0;
    wait 1.4;
    var_0 fadeovertime( 0.5 );
    var_0.alpha = 0;
    var_2 = 0.1;
    var_3 = 0.5;
    var_4 = 0.1;
    var_5 = 0.025;
    var_6 = 0.575;
    var_7 = 0.6;
    var_8 = 0;
    var_9 = 0.1;
    var_0.alpha = var_7;
    var_10 = max( var_2, var_5 );
    var_10 += max( var_4, var_9 );
    var_11 = max( var_3, var_6 );
    var_11 += max( var_4, var_9 );
    var_11 += 1.2;
    var_12 = "breathing_heartbeat";

    for ( var_13 = 0; var_13 < 6; var_13++ )
    {
        var_0 scaleovertime( var_3, var_0._id_BC2F, var_0._id_AA7E );
        var_0 fadeovertime( var_6 );
        var_0.alpha = var_8;
        wait(var_11);
        var_0 scaleovertime( var_2, var_0._id_C271, var_0._id_C3A3 );
        var_0 fadeovertime( var_5 );
        var_0.alpha = var_7;
        wait(var_10);
        var_7 -= 0.1;
        thread _id_BBB9( 1 - var_13 * 0.1 );
        level.player playlocalsound( var_12 );
    }

    var_0 fadeovertime( 2 );
    var_0.alpha = 0;
    wait 2;
    var_0 destroy();
}

_id_BBB9( var_0 )
{
    level notify( "new_pulse" );
    level endon( "new_pulse" );
    level._id_D4DE = 0.1 * var_0;
    wait 0.05;
    level._id_D4DE = 0.15 * var_0;
    wait 0.05;
    level._id_D4DE = 0.2 * var_0;
    wait 0.05;
    level._id_D4DE = 0.25 * var_0;
    wait 0.05;
    level._id_D4DE = 0.3 * var_0;
    wait 0.05;
    level._id_D4DE = 0.35 * var_0;
    wait 0.05;
    level._id_D4DE = 0.4 * var_0;
    wait 0.05;
    level._id_D4DE = 0.4 * var_0;
    wait 0.05;
    level._id_D4DE = 0.35 * var_0;
    wait 0.05;
    level._id_D4DE = 0.3 * var_0;
    wait 0.05;
    level._id_D4DE = 0.25 * var_0;
    wait 0.05;
    level._id_D4DE = 0.2 * var_0;
    wait 0.05;
    level._id_D4DE = 0.15 * var_0;
    wait 0.05;
    level._id_D4DE = 0.1 * var_0;
    wait 0.05;
    level._id_D4DE = 0;
}

_id_CDE6()
{
    level.player endon( "death" );
    level endon( "stop_drunk_walk" );
    _id_D5A0();
    _id_C355( 0.6, 0 );
    wait 2;
    level._id_D4DE = 0;
    var_0 = 0.4;
    var_1 = 14;
    var_2 = 0.05;
    var_3 = var_1 / var_2;
    var_4 = 0;
    var_5 = var_0 / var_3;
    var_6 = 1;

    for (;;)
    {
        var_0 -= var_5;
        var_0 = clamp( var_0, 0, 1 );
        var_7 = var_0 + level._id_D4DE;
        _id_C355( var_7, 0.05 );
        var_4++;
        wait(var_2);
    }
}

_id_BD4B()
{
    var_0 = level.start_point != "wakefast";
    common_scripts\utility::flag_wait( "fell_off_waterfall" );
    thread _id_D142();
    maps\af_chase_knife_fight_code::_id_CE3C( "af_chase_ending_wakeup" );
    thread maps\af_chase_knife_fight_code::_id_C5B9();
    thread maps\af_chase_knife_fight_code::_id_BB55();
    thread maps\af_chase_knife_fight_code::_id_B330();
    thread maps\af_chase_knife_fight_code::_id_CE4B();
    _id_D220();

    if ( var_0 )
    {
        thread maps\af_chase_knife_fight_code::_id_BFB5();
        thread _id_C5DB();
    }

    setblur( 20, 0 );
    setblur( 0, 8 );
    var_1 = "wakeup";
    var_2 = common_scripts\utility::getstruct( "end_scene_org", "targetname" );
    var_3 = maps\_utility::spawn_anim_model( "player_rig" );
    var_2 maps\_anim::anim_first_frame_solo( var_3, var_1 );
    level.player playerlinktodelta( var_3, "tag_player", 1, 0, 0, 0, 0, 1 );

    if ( getdvarint( "lastMissionPassCheatStatus" ) == 1 )
        common_scripts\utility::flag_set( "has_cheated" );

    savegame( var_1, &"AUTOSAVE_LEVELSTART", "shot", 1 );
    level.player freezecontrols( 1 );
    maps\_utility::array_spawn_function_targetname( "crawling_spawner", maps\af_chase_knife_fight_code::_id_B876 );
    maps\_utility::array_spawn_function_targetname( "crawling_spawner", maps\af_chase_knife_fight_code::_id_C7CF );
    maps\_utility::array_spawn_targetname( "crawling_spawner" );
    var_4 = getent( "damaged_pavelow", "targetname" );
    var_4 thread maps\_utility::play_sound_on_entity( "scn_afchase_heli_cookoff" );

    if ( var_0 )
    {
        level.player maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "scn_afchase_wakeup_player" );
        level.player maps\_utility::delaythread( 12.5, maps\_utility::play_sound_on_entity, "scn_afchase_wakeup_player_cough" );

        if ( getdvar( "enable_heartbeat_overlay" ) == "1" )
        {
            thread _id_CD28();
            thread _id_CDE6();
        }

        var_2 maps\_anim::anim_single_solo( var_3, var_1 );
    }
    else
    {
        var_2 thread maps\_anim::anim_single_solo( var_3, var_1 );
        var_5 = var_3 maps\_utility::getanim( var_1 );
        var_3 setanim( var_5, 1, 0, 25 );

        for (;;)
        {
            var_6 = var_3 getanimtime( var_5 );

            if ( var_6 >= 0.95 )
                break;

            wait 0.05;
        }
    }

    maps\_utility::delaythread( 5, maps\af_chase_knife_fight_code::_id_CC49 );
    var_3 delete();
    objective_add( 2, "current", &"AF_CHASE_OBJ_CRASH" );
    objective_onentity( 2, level._id_D242, ( 0.0, 0.0, 90.0 ) );
    objective_setpointertextoverride( 2, &"SCRIPT_WAYPOINT_SHEPHERD" );
    common_scripts\utility::flag_set( "player_standing" );
    common_scripts\utility::flag_set( "start_doing_aftermath_walk" );
}

_id_C5DB()
{
    var_0 = _id_D397::_id_A97A( "ending_wakeup_intro" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 3.0, 1000, 32, 32 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 3.5 ) _id_D397::_id_C491( 5.0, 25, 0.8, 1.0 );
    var_0 _id_D397::_id_BEA0( 6.15 ) _id_D397::_id_C491( 8.0, 16.5, 3.0, 3.0 );
    var_0 _id_D397::_id_BEA0( 9.65 ) _id_D397::_id_C491( 4.0, 16, 2.0, 2.0 );
    var_0 _id_D397::_id_BEA0( 11.5 ) _id_D397::_id_C491( 4.0, 13, 4.0, 4.0 );
    var_0 _id_D397::_id_BEA0( 13.5 ) _id_D397::_id_C491( 8.0, 55, 2.0, 2.0 );
    var_0 _id_D397::_id_BEA0( 15.0 ) _id_D397::_id_C491( 16.0, 1000, 2.0, 2.0 );
    var_0 _id_D397::_id_BEA0( 16.5 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( 54, 0.0, 0 );
    var_0 _id_D397::_id_BEA0( 0.05 ) _id_D397::_id_A9EC( 7.0, 0 );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 16.0 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 6.55 ) _id_D397::_id_B85E( 0.14, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.8 );
    var_0 _id_D397::_id_BEA0( 8.8 ) _id_D397::_id_B85E( 0.08, 0.6, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 10.25 ) _id_D397::_id_B85E( 0.06, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 11.75 ) _id_D397::_id_B85E( 0.14, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.5 );
    thread _id_B9CB();
    var_0 _id_D397::_id_BC26();
    setsaveddvar( "ui_consciousnessVignetteDarkness", 1.0 );
}

_id_B9CB()
{
    wait 0.5;
    setomnvar( "ui_consciousness_init", 1 );
    setomnvar( "ui_consciousness_play", 1 );
    setsaveddvar( "ui_consciousnessVignetteDarkness", 0.5 );
}

_id_C8EC()
{
    soundscripts\_snd::snd_message( "start_turnbuckle_checkpoint" );
    maps\af_chase_knife_fight_code::_id_C99B();
    maps\af_chase_knife_fight_code::_id_CE3C( "af_chase_ending_wakeup" );
}

_id_C0DB()
{
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    level endon( "no_more_shepherd_idle" );

    for (;;)
    {
        var_0 thread maps\_anim::anim_loop_solo( level._id_B416, "turn_buckle_idle", "player_arrived" );
        common_scripts\utility::flag_wait( "shepherd_should_do_idle_b" );
        var_0 notify( "player_arrived" );
        var_0 thread maps\_anim::anim_loop_solo( level._id_B416, "turn_buckle_idleb", "player_arrived" );
        common_scripts\utility::flag_waitopen( "shepherd_should_do_idle_b" );
        var_0 notify( "player_arrived" );
    }
}

_id_B33A()
{
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_1 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_1 hide();
    var_0 maps\_anim::anim_first_frame_solo( var_1, "turn_buckle" );
    thread _id_C0DB();
    maps\af_chase_knife_fight_code::_id_D354();
    var_2 = spawn( "script_model", level.player.origin + ( 0.0, 0.0, 32.0 ) );
    var_2 setmodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    var_2 hide();
    var_2 linkto( level.player );
    maps\af_chase_knife_fight_code::_id_C4D6();

    if ( isdefined( level._id_D2D2 ) )
    {
        level._id_D2D2 rotateto( ( 0.0, 0.0, 0.0 ), 0.5, 0.25, 0.25 );
        level.player _meth_85B5( undefined );
        level._id_D2D2 delete();
    }

    level notify( "stop_random_breathing_sounds" );
    level notify( "stop_drunk_walk" );
    level notify( "kill_limp" );
    setsaveddvar( "compass", 0 );
    level notify( "do_staged_pain_pulse" );
    level notify( "kill_limp" );
    common_scripts\utility::flag_set( "stop_aftermath_player" );
    maps\af_chase_knife_fight_code::_id_B3EA( 1 );

    if ( isdefined( level._id_B416.function_stack ) )
        level._id_B416 maps\_utility::function_stack_clear();

    level._id_B416 playrumbleonentity();
    maps\af_chase_knife_fight_code::_id_BEC4();
    common_scripts\utility::flag_set( "turn_buckle_start" );
    thread _id_CE81( "start_turnbuckle" );
    level notify( "no_more_shepherd_idle" );
    var_0 notify( "player_arrived" );
    thread maps\af_chase_knife_fight_code::_id_AF54();
    var_1 attach( "weapon_commando_knife", "TAG_WEAPON_LEFT" );
    var_3 = maps\af_chase_knife_fight_code::_id_CF10();
    var_4 = [];
    var_4["shepherd"] = level._id_B416;
    var_4["player"] = var_1;
    var_4["knife"] = var_3;
    var_5 = var_1 maps\_utility::getanim( "turn_buckle" );
    var_6 = 1.15;
    thread maps\af_chase_knife_fight_code::_id_C725( var_6 );
    maps\_utility::delaythread( 9, common_scripts\utility::flag_set, "turn_buckle_fadeout" );
    level.player thread maps\af_chase_knife_fight_code::_id_CA72();
    var_7 = "turn_buckle";
    var_8 = "scn_afchase_plr_tbuckle_lyr_front";
    var_9 = "scn_afchase_shepherd_tbuckle";

    if ( common_scripts\utility::flag( "player_touched_shepherd" ) )
    {
        var_7 = "turn_buckle_alt";
        var_8 = "scn_afchase_plr_tbuckle_alt_lyr_front";
        var_9 = "scn_afchase_shepherd_tbuckle_alt";
    }

    var_0 maps\_anim::anim_first_frame( var_4, var_7 );
    var_0 thread maps\_anim::anim_single( var_4, var_7 );
    level.player playsound( var_8 );
    level._id_B416 thread maps\_utility::play_sound_on_entity( var_9 );
    common_scripts\utility::flag_wait( "turn_buckle_fadeout" );
    wait(var_6);
    wait 0.5;
    var_3 show();
}

_id_CE81( var_0 )
{
    switch ( var_0 )
    {
        case "start_turnbuckle":
            var_1 = _id_D397::_id_A97A( var_0 );
            level notify( "not_random_blur" );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AD68( 0, 0.5 );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AF90( 1.0 );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 3.1, -1, 64, 64 ) _id_D397::_id_CCA7( level._id_B416, "tag_eye" ) _id_D397::_id_AE01( 1.0 ) _id_D397::_id_AF9C();
            var_1 _id_D397::_id_BEA0( 1.85 ) _id_D397::_id_CFD7();
            var_2 = getent( "staging_finale_lgt01", "targetname" );
            var_1 _id_D397::_id_BEA0( 2.35 ) _id_D397::_id_A970( maps\_utility::send_notify, var_2, "staging_on" );
            var_1 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_B85E( 0.14, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 1.6 ) _id_D397::_id_B85E( 0.2, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.2 );
            var_1 _id_D397::_id_BEA0( 2.1 ) _id_D397::_id_B85E( 0.12, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 2.65 ) _id_D397::_id_B85E( 0.38, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.8 );
            var_1 _id_D397::_id_BEA0( 3.85 ) _id_D397::_id_B85E( 0.14, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BC26();
            common_scripts\utility::flag_wait( "gloat_fade_in" );
            var_1 = _id_D397::_id_A97A( "gloat_sequence" );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687();
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 3.1, -1, 64, 64 ) _id_D397::_id_CCA7( level._id_B416, "tag_eye" ) _id_D397::_id_AE01( 1.0 ) _id_D397::_id_AF9C();
            var_1 _id_D397::_id_BEA0( 13.8 ) _id_D397::_id_C491( 3.1, -1, 3.5, 3.5 ) _id_D397::_id_CCA7( level._id_CAC6, "tag_flash" ) _id_D397::_id_ADE6( 0 ) _id_D397::_id_AE01( 1.0 );
            var_1 _id_D397::_id_BEA0( 15.0 ) _id_D397::_id_C491( 3.1, -1, 4, 4 ) _id_D397::_id_CCA7( level.price, "tag_eye" ) _id_D397::_id_AE01( 1.0 );
            var_1 _id_D397::_id_BEA0( 16.5 ) _id_D397::_id_C491( 3.1, -1, 4, 4 ) _id_D397::_id_CCA7( level._id_B416, "tag_eye" ) _id_D397::_id_AE01( 1.0 );
            var_1 _id_D397::_id_BEA0( 17.7 ) _id_D397::_id_AC9F( 50, 1.4, 0 ) _id_D397::_id_BAE4( 2 );
            var_1 _id_D397::_id_BEA0( 18.5 ) _id_D397::_id_C491( 4.5, -1, 1.0, 1.0 ) _id_D397::_id_CCA7( level._id_CAC6, "tag_brass" ) _id_D397::_id_ADE6( -2 ) _id_D397::_id_AE01( 1.0 );
            var_1 _id_D397::_id_BEA0( 15.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
            var_1 _id_D397::_id_BEA0( 16.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 20.4 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BC26();
            break;
        case "crawl_gameplay_started":
            var_1 = _id_D397::_id_A97A( var_0 );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687();
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 5.5, -1, 64, 64 ) _id_D397::_id_CCA7( level._id_CAC6, "tag_brass" ) _id_D397::_id_ADE6( -2 ) _id_D397::_id_AE01( 1.0 ) _id_D397::_id_AF9C() _id_D397::_id_BAE4( 2 );
            var_2 = getent( "staging_finale_lgt01", "targetname" );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_A970( maps\_utility::send_notify, var_2, "staging_off" );
            var_1 _id_D397::_id_BC26();
            var_3 = 2.14;

            for ( var_4 = 1; var_4 <= 6; var_4++ )
            {
                common_scripts\utility::flag_wait( "crawl_gameplay_player_input" );
                common_scripts\utility::flag_clear( "crawl_gameplay_player_input" );
                var_5 = 50 + var_4 * var_3;
                var_1 = _id_D397::_id_A97A( "crawl_new_input" + var_4 );
                var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( var_5, 1.0, 0 );
                var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
                var_1 _id_D397::_id_BC26();
            }

            common_scripts\utility::flag_wait( "crawl_gameplay_complete" );
            var_1 = _id_D397::_id_A97A( "crawl_gameplay_complete" );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687() _id_D397::_id_BAE4( 0 );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( 65, 1.0, 0 );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 5.0, -1, 64, 64 ) _id_D397::_id_CCA7( level._id_CAC6, "tag_brass" ) _id_D397::_id_ADE6( -2 ) _id_D397::_id_AE01( 1.0 ) _id_D397::_id_AF9C();
            var_1 _id_D397::_id_BEA0( 2.35 ) _id_D397::_id_C491( 3.0, 23, 4, 4 );
            var_1 _id_D397::_id_BEA0( 2.65 ) _id_D397::_id_AC9F( 50, 1.15, 0 );
            var_1 _id_D397::_id_BEA0( 3.3 ) _id_D397::_id_C491( 3.1, -1, 4, 4 ) _id_D397::_id_CCA7( level._id_B416, "tag_eye" ) _id_D397::_id_ADE6( 0 ) _id_D397::_id_AE01( 1.0 ) _id_D397::_id_AF90( 1.0 );
            var_6 = getent( "staging_finale_lgt02", "targetname" );
            var_1 _id_D397::_id_BEA0( 5.0 ) _id_D397::_id_A970( maps\_utility::send_notify, var_6, "staging_on" );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 1.85 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 2.4 ) _id_D397::_id_B85E( 0.1, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
            var_1 _id_D397::_id_BC26();
            break;
        case "shepherd_fights_price_sequence_start":
            var_1 = _id_D397::_id_A97A( var_0 );
            setomnvar( "ui_consciousness_init", 1 );
            setomnvar( "ui_consciousness_play", 12 );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687();
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( 40, 0.0, 1 );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 4.1, -1, 64, 64 ) _id_D397::_id_CCA7( level._id_B416 ) _id_D397::_id_ADE6( 0 ) _id_D397::_id_AE01( 1.0 ) _id_D397::_id_AF9C() _id_D397::_id_CFD7();
            var_1 _id_D397::_id_BEA0( 11.3 ) _id_D397::_id_C491( 3.1, -1, 64, 64 ) _id_D397::_id_CCA7( level._id_B416 ) _id_D397::_id_ADE6( 0 ) _id_D397::_id_AE01( 1.0 );
            var_1 _id_D397::_id_BEA0( 17.8 ) _id_D397::_id_AC9F( 47, 0.0, 1 );
            var_1 _id_D397::_id_BEA0( 17.8 ) _id_D397::_id_C491( 3.1, -1, 64, 64 ) _id_D397::_id_CCA7( level._id_B416 ) _id_D397::_id_ADE6( 0 ) _id_D397::_id_A970( ::h2_lerp_camera_roll, level.player, 15, 0.1 ) _id_D397::_id_AE01( 1.0 );
            var_1 _id_D397::_id_BEA0( 21.3 ) _id_D397::_id_AC9F( 40, 0.0, 1 );
            var_1 _id_D397::_id_BEA0( 21.3 ) _id_D397::_id_C491( 3.1, -1, 64, 64 ) _id_D397::_id_CCA7( level._id_B416 ) _id_D397::_id_ADE6( 0 ) _id_D397::_id_A970( ::h2_lerp_camera_roll, level.player, 15, 0.1 ) _id_D397::_id_AE01( 1.0 );
            var_1 _id_D397::_id_BEA0( 1.05 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.0, 0.0, 0.0, -1, 5, -2, 6 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 2.5 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.15, 0.5, 0.5, -8, 12, 1, 3 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 3.7 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 2.3, 0.5, 0.9, -22, 26, 0, 4 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 6.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.0, 0.5, 0.5, -25, 29, -4, 8 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 8.4 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.5, 0.5, 0.9, -15, 19, -9, 13 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 11.5 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.0, 0.0, 0.0, -8, 12, -6, 10 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 12.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 3.5, 1.0, 1.0, -1, 5, -9, 13 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 17.7 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.0, 0.0, 0.0, -26, 30, -10, 14 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 19.2 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.85, 0.3, 0.3, -30, 34, -7, 11 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 21.4 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.0, 0.0, 0.0, -38, 42, -8, 12 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 1.5 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 2.4 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 3.7 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 8.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 12.3 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 13.8 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 19.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 9.3 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 12.7 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 19.75 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BC26();
            common_scripts\utility::flag_wait( "focused_on_knife" );
            var_1 = _id_D397::_id_A97A( "focused_on_knife" );
            var_1 _id_D397::_id_BEA0( 1.35 ) _id_D397::_id_AC9F( 58, 13.0, 0 );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687();
            var_1 _id_D397::_id_BEA0( 5.75 ) _id_D397::_id_A970( ::h2_lerp_camera_roll, level.player, 0, 6.15 );
            var_1 _id_D397::_id_BEA0( 6.85 ) _id_D397::_id_C491( 4.0, 11.5, 0.55, 0.55 ) _id_D397::_id_AF9C();
            var_1 _id_D397::_id_BEA0( 1.35 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.6, 0.8, 0.8, -38, 42, -11, 15 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 4.25 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 7.15, 4.0, 1.0, 7, -1, 4, 2 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_1 _id_D397::_id_BEA0( 0.25 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 1.25 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 2.15 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 4.1 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 4.9 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 7.05 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 7.85 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 9.95 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 11.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BC26();
            break;
        case "player_looks_at_knife":
            var_1 = _id_D397::_id_A97A( var_0 );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687();
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 4.0, 11.5, 2, 2 ) _id_D397::_id_AF9C();
            var_1 _id_D397::_id_BEA0( 5.15 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 5.6 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
            var_1 _id_D397::_id_BC26();
            common_scripts\utility::flag_wait( "throw_knife_pulled_out" );
            var_1 = _id_D397::_id_A97A( "throw_knife_pulled_out" );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687();
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 4.0, -1, 64, 64 ) _id_D397::_id_CCA7( level.player_rig, "tag_knife_attach2" ) _id_D397::_id_ADE6( 0 ) _id_D397::_id_AE01( 1.0 ) _id_D397::_id_AF9C();
            var_1 _id_D397::_id_BEA0( 0.6 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.5 );
            var_1 _id_D397::_id_BEA0( 3.1 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 4.15 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 5.3 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 1.5 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.2 );
            var_1 _id_D397::_id_BEA0( 1.7 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
            var_1 _id_D397::_id_BEA0( 2.35 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
            var_1 _id_D397::_id_BEA0( 2.55 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BC26();
            break;
        case "throw_knife_gameplay_started":
            var_1 = _id_D397::_id_A97A( "throw_knife_gameplay_started" );
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B687();
            var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 3.1, -1, 2, 2 ) _id_D397::_id_CCA7( level._id_B416, "tag_eye" ) _id_D397::_id_ADE6( 0 ) _id_D397::_id_AE01( 1.0 );
            var_1 _id_D397::_id_BC26();
            break;
        case "shepherd_killed":
            var_1 = _id_D397::_id_A97A( "shepherd_killed_cinematic" );
            var_1 _id_D397::_id_BEA0( 5.0 ) _id_D397::_id_B687();
            var_1 _id_D397::_id_BEA0( 5.0 ) _id_D397::_id_C491( 3.1, -1, 1, 1 ) _id_D397::_id_CCA7( level.price, "tag_eye" ) _id_D397::_id_ADE6( 0 ) _id_D397::_id_AE01( 1.0 ) _id_D397::_id_AF90( 1.0 ) _id_D397::_id_AF9C();
            var_1 _id_D397::_id_BEA0( 65.65 ) _id_D397::_id_C491( 1.4, 300, 1.5, 1.5 );
            var_1 _id_D397::_id_BEA0( 68.65 ) _id_D397::_id_C491( 3.1, -1, 2.5, 2.5 ) _id_D397::_id_CCA7( level.price, "tag_eye" ) _id_D397::_id_ADE6( 0 ) _id_D397::_id_AE01( 1.0 );
            var_1 _id_D397::_id_BEA0( 73.15 ) _id_D397::_id_AC9F( 57, 1.5, 0 ) _id_D397::_id_C491( 14.1, 150, 2, 2 );
            var_1 _id_D397::_id_BEA0( 84.65 ) _id_D397::_id_AC9F( 65, 1.5, 0 ) _id_D397::_id_C491( 14.1, 150, 2, 2 );
            var_1 _id_D397::_id_BEA0( 94.0 ) _id_D397::_id_BF3F();
            var_1 _id_D397::_id_BEA0( 94.0 ) _id_D397::_id_CFD7();
            var_1 _id_D397::_id_BEA0( 1.2 ) _id_D397::_id_AC9F( 40, 0.4, 0 );
            var_1 _id_D397::_id_BEA0( 11.3 ) _id_D397::_id_A9EC( 28.0, 0 );
            var_1 _id_D397::_id_BEA0( 7.75 ) _id_D397::_id_BAE4( 2 );
            var_1 _id_D397::_id_BEA0( 37.0 ) _id_D397::_id_BAE4( 0 );
            var_1 _id_D397::_id_BEA0( 85.0 ) _id_D397::_id_BAE4( 2 );
            var_1 _id_D397::_id_BEA0( 94.0 ) _id_D397::_id_BAE4( 0 );
            var_1 _id_D397::_id_BEA0( 85.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 8.0, 3.5, 3.5, 0, 0, 0, 0 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
            var_6 = getent( "staging_finale_lgt02", "targetname" );
            var_1 _id_D397::_id_BEA0( 80.0 ) _id_D397::_id_A970( maps\_utility::send_notify, var_6, "staging_off" );
            var_1 _id_D397::_id_BEA0( 1.2 ) _id_D397::_id_B85E( 0.04, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 1.45 ) _id_D397::_id_B85E( 0.04, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 3.5 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 60.5 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 61.4 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 65.05 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 69.75 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BEA0( 84.05 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.4 );
            var_1 _id_D397::_id_BEA0( 85.85 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_1 _id_D397::_id_BC26();
            break;
    }
}

h2_lerp_camera_roll( var_0, var_1 )
{
    var_2 = 0.05;
    var_3 = level.player getplayerangles();
    var_4 = var_0 - var_3[2];
    var_5 = var_1 / var_2;
    var_6 = var_4 / var_5;
    var_7 = 0;

    while ( var_7 <= var_5 )
    {
        level.player setplayerangles( ( var_3[0], var_3[1], var_3[2] + var_7 * var_6 ) );
        var_7 += 1;
        wait(var_2);
    }
}

_id_B734()
{
    soundscripts\_snd::snd_message( "start_shepherd_gloats_checkpoint" );
    maps\af_chase_knife_fight_code::_id_A8F1( 0 );
}

_id_AA12()
{
    soundscripts\_snd::snd_message( "start_shepherd_gloats_checkpoint" );
    maps\af_chase_knife_fight_code::_id_A8F1( 0 );
}

_id_BA36( var_0 )
{
    common_scripts\utility::flag_set( "bloody_player_rig" );
    var_0 setmodel( "h2_gfl_m4_sopmod_ii_viewbody" );
}

_id_CA99()
{
    level notify( "not_random_blur" );
    thread _id_C77B::player_heartbeat();
    level.player stopshellshock();
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_1 = maps\af_chase_knife_fight_code::_id_C6C5();
    _id_BA36( var_1 );
    var_2 = maps\af_chase_knife_fight_code::_id_B7B3();
    var_3 = maps\af_chase_knife_fight_code::_id_CF10();
    maps\af_chase_knife_fight_code::_id_BD20();
    var_4 = maps\af_chase_knife_fight_code::_id_B991();
    var_4.origin = level.player.origin;
    var_4 maps\af_chase_knife_fight_code::_id_C5EA( level._id_B416, "tag_eye", 1 );
    maps\af_chase_knife_fight_code::_id_C587();
    var_4 = maps\af_chase_knife_fight_code::_id_B991();
    var_4 linkto( level._id_B416, "tag_eye", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_5 = [];
    var_5["shepherd"] = level._id_B416;
    var_5["player_rig"] = var_1;
    var_5["gun"] = var_2;
    var_5["knife"] = var_3;
    var_0 maps\_anim::anim_first_frame( var_5, "gun_monologue" );
    level.player playerlinktodelta( var_1, "tag_player", 1, 5, 5, 5, 5, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    setblur( 0, 1.75 );
    var_6 = 6.5;
    var_7 = 4;
    var_6 -= var_7;
    thread maps\af_chase_knife_fight_code::_id_CA1C( var_7 );
    common_scripts\utility::flag_wait( "gloat_fade_in" );
    maps\af_chase_knife_fight_code::_id_B3EA( 3.5 );
    var_0 maps\_anim::anim_first_frame_solo( level.price, "gun_drop" );
    level._id_B416 thread maps\_utility::play_sound_on_entity( "h2_scn_afchase_shepherd_gloat" );
    level.player maps\_utility::delaythread( 13.45, maps\_gameskill::grenade_dirt_on_screen, "right" );
    maps\_utility::delaythread( 14.7, ::_id_CE12 );
    var_0 maps\_anim::anim_single( var_5, "gun_monologue" );
}

_id_A99A()
{
    level notify( "not_random_blur" );
    thread _id_C77B::player_heartbeat();
    level.player stopshellshock();
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_1 = maps\af_chase_knife_fight_code::_id_C6C5();
    _id_BA36( var_1 );
    var_2 = maps\af_chase_knife_fight_code::_id_B7B3();
    var_3 = maps\af_chase_knife_fight_code::_id_CF10();
    var_4 = var_1 common_scripts\utility::spawn_tag_origin();
    var_4 linkto( var_1, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( var_4 );
    maps\af_chase_knife_fight_code::_id_BD20();
    var_5 = maps\af_chase_knife_fight_code::_id_B991();
    var_5.origin = level.player.origin;
    var_5 maps\af_chase_knife_fight_code::_id_C5EA( level._id_B416, "tag_eye", 1 );
    maps\af_chase_knife_fight_code::_id_C587();
    var_5 = maps\af_chase_knife_fight_code::_id_B991();
    var_5 linkto( level._id_B416, "tag_eye", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_6 = [];
    var_6["shepherd"] = level._id_B416;
    var_6["player_rig"] = var_1;
    var_6["gun"] = var_2;
    var_6["knife"] = var_3;
    var_6["price"] = level.price;
    var_0 maps\_anim::anim_first_frame( var_6, "gun_fight" );
    level.player playerlinktodelta( var_1, "tag_player", 1, 5, 5, 5, 5, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    setblur( 0, 1.75 );
    var_7 = 6.5;
    var_8 = 4;
    var_7 -= var_8;
    thread maps\af_chase_knife_fight_code::_id_CA1C( var_8 );
    common_scripts\utility::flag_wait( "gloat_fade_in" );
    maps\af_chase_knife_fight_code::_id_B3EA( 3.5 );
    level._id_B416 thread maps\_utility::play_sound_on_entity( "h2_scn_afchase_shepherd_gloat" );
    level.player maps\_utility::delaythread( 13.45, maps\_gameskill::grenade_dirt_on_screen, "right" );
    maps\_utility::delaythread( 14.7, ::_id_CE12 );
    var_0 maps\_anim::anim_single( var_6, "gun_fight" );
    level.player playersetgroundreferenceent( undefined );
    var_4 delete();
}

_id_CE12()
{
    common_scripts\utility::flag_set( "af_chase_final_fight" );
}

_id_C819()
{
    soundscripts\_snd::snd_message( "start_gun_drop_checkpoint" );
    maps\af_chase_knife_fight_code::_id_AD9B();
}

_id_BCC5()
{
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles;
    var_2 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_3 = maps\af_chase_knife_fight_code::_id_B7B3();
    var_4 = [];
    var_4["shepherd"] = level._id_B416;
    var_4["price"] = level.price;
    var_5 = maps\af_chase_knife_fight_code::_id_B991();
    var_5 linkto( level._id_B416, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_6 = level._id_B416 maps\_utility::getanim( "gun_drop" );
    var_7 = getanimlength( var_6 );
    var_8 = var_2 maps\_utility::getanim( "gun_drop_player" );
    var_9 = getanimlength( var_8 );
    var_10 = var_9 - var_7;
    var_11 = 0.7;
    var_12 = var_7 - var_11;
    var_1 thread maps\_anim::anim_single( var_4, "gun_drop" );
    var_5 maps\af_chase_knife_fight_code::_id_C5EA( var_3, "J_Cylinder_Rot", 0.4 );
    var_0 thread maps\_anim::anim_single_solo( var_3, "gun_drop" );
    var_0 thread maps\_anim::anim_single_solo( var_2, "gun_drop_player" );
    level.player thread maps\_utility::play_sound_on_entity( "af_chase_scene_gun_drop" );
    wait 0.05;

    foreach ( var_14 in var_4 )
        var_14 linkto( var_1 );

    wait(var_12 - 0.05);
    wait(var_11 - 0.05);
}

_id_B5E6()
{
    soundscripts\_snd::snd_message( "start_gun_crawl_checkpoint" );
    maps\af_chase_knife_fight_code::_id_AD9B();
    var_0 = maps\af_chase_knife_fight_code::_id_B7B3();
    var_1 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_2 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_3 = maps\af_chase_knife_fight_code::_id_B991();
    var_3 maps\af_chase_knife_fight_code::_id_C5EA( var_0, "tag_flash", 0.1 );
    var_1 maps\_anim::anim_first_frame_solo( var_0, "gun_kick_gun" );
    var_1 maps\_anim::anim_first_frame_solo( var_2, "gun_crawl_01" );
    var_3 common_scripts\utility::delaycall( 0.1, ::linkto, var_2, "J_Wrist_LE", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
}

_id_CB2E()
{
    common_scripts\utility::flag_set( "crawl_gameplay_started" );
    thread _id_CE81( "crawl_gameplay_started" );
    savegame( "crawl", &"AUTOSAVE_LEVELSTART", "shot", 1 );
    maps\af_chase_knife_fight_code::_id_AA80();
    level._id_C381.origin = ( 40.0, 0.0, 0.0 );
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_1 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_2 = maps\af_chase_knife_fight_code::_id_B7B3();
    var_3 = [];
    var_3["player_rig"] = var_1;
    var_4 = var_1 common_scripts\utility::spawn_tag_origin();
    var_4 linkto( var_1, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( var_4 );
    var_5 = [];
    var_5[0] = maps\af_chase_knife_fight_code::_id_BDCE;
    var_5[1] = maps\af_chase_knife_fight_code::_id_C15B;
    var_6 = [];
    var_6[0] = "hint_crawl_right";
    var_6[1] = "hint_crawl_left";
    var_7 = spawnstruct();
    thread maps\af_chase_knife_fight_code::_id_C159( var_7, var_5, var_6 );
    thread maps\af_chase_knife_fight_code::_id_C8F9();

    if ( !maps\_utility::is_default_start() )
        thread maps\af_chase_knife_fight_code::_id_B671();

    level notify( "stop_heart" );
    var_8 = 0;

    for ( var_9 = 0; var_9 < 7; var_9++ )
    {
        var_0 thread maps\_anim::anim_loop( var_3, "gun_crawl_0" + var_9 + "_idle", "stop_crawl" );

        if ( var_9 == 1 )
            thread maps\af_chase_knife_fight_code::_id_B37D();

        var_10 = var_9 < 2;
        maps\af_chase_knife_fight_code::_id_AED8( var_5, var_7, var_8, var_10 );
        var_11 = "sand_crawl_right";

        if ( var_8 )
            var_11 = "sand_crawl_left";

        var_1 thread maps\_utility::play_sound_on_entity( var_11 );

        if ( var_9 == 2 )
            thread maps\af_chase_knife_fight_code::_id_C25B();

        if ( var_9 == 3 )
            thread maps\af_chase_knife_fight_code::_id_B404();

        var_0 notify( "stop_crawl" );
        var_12 = randomfloatrange( 0.9, 1.1 );
        earthquake( 0.16, var_12, level.player.origin, 5000 );
        var_13 = "gun_crawl_0" + var_9;
        var_14 = var_1 maps\_utility::getanim( var_13 );
        var_15 = getanimlength( var_14 );
        maps\_utility::delaythread( var_15 - 0.25, ::_id_B51A );

        if ( var_9 == 6 )
            break;

        var_8++;
        var_8 %= var_5.size;
        common_scripts\utility::flag_set( "crawl_gameplay_player_input" );
        var_0 maps\_anim::anim_single( var_3, var_13 );
    }

    level.player playersetgroundreferenceent( undefined );
    var_4 delete();
    common_scripts\utility::flag_set( "crawl_gameplay_complete" );
}

_id_B51A()
{
    earthquake( 0.12, 0.45, level.player.origin, 5000 );
}

_id_B8CE()
{
    soundscripts\_snd::snd_message( "start_gun_kick_checkpoint" );
    level._id_C381.origin = ( 40.0, 0.0, 0.0 );
    maps\af_chase_knife_fight_code::_id_AD9B();
}

_id_AEB5()
{
    maps\af_chase_knife_fight_code::_id_C454();
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_1 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_2 = maps\af_chase_knife_fight_code::_id_B7B3();
    var_3 = maps\af_chase_knife_fight_code::_id_C3AA();
    var_3.origin += ( 44.64, -25.73, 0.0 );
    var_0 thread maps\_anim::anim_single_solo( var_2, "gun_kick_gun" );
    var_4 = maps\af_chase_knife_fight_code::_id_B991();
    var_4 maps\af_chase_knife_fight_code::_id_C5EA( level._id_B416, "J_Ankle_RI", 1 );
    var_5 = "gun_kick";
    var_6 = var_1 maps\_utility::getanim( var_5 );
    var_7 = getanimlength( var_6 );
    thread maps\af_chase_knife_fight_code::_id_C413( var_5, var_7 );
    var_0 thread maps\_anim::anim_single_solo( level._id_B416, var_5 );
    var_0 thread maps\_anim::anim_single_solo( var_1, var_5 );
    var_8 = 0.7;
    wait(var_7 - var_8);
    wait 2;
}

_id_C542()
{
    soundscripts\_snd::snd_message( "start_wounded_show_checkpoint" );
    maps\af_chase_knife_fight_code::_id_A8F1( 0 );
}

_id_C2B2()
{
    if ( isdefined( level._id_AFDA ) )
    {
        level._id_AFDA notify( "stop_loop" );
        level._id_AFDA delete();
    }

    common_scripts\utility::flag_set( "shepherd_fights_price_sequence_start" );
    thread _id_CE81( "shepherd_fights_price_sequence_start" );
    level.price thread maps\af_chase_knife_fight_code::_id_CE49();
    level._id_B416 thread maps\af_chase_knife_fight_code::_id_CE49();
    maps\af_chase_knife_fight_code::_id_AD8D();
    maps\af_chase_knife_fight_code::_id_CEF3();
    level notify( "stop_idle_crawl_fight" );
    var_0 = getent( "end_scene_org_fight_B", "targetname" );
    var_1 = getent( "end_scene_org_fight_C", "targetname" );
    var_2 = common_scripts\utility::getstruct( "end_scene_org_wrestle_C", "targetname" );
    var_3 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_4 = maps\af_chase_knife_fight_code::_id_C1F8();
    var_5 = "price_wakeup";
    var_3 thread maps\_anim::anim_first_frame_solo( var_4, var_5 );
    var_6 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_6 delete();
    var_6 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_7 = maps\af_chase_knife_fight_code::_id_CF10();
    thread maps\af_chase_knife_fight_code::_id_C76A( var_6 );
    var_8 = [];
    var_8["knife"] = var_7;
    var_8["player_rig"] = var_6;
    var_3 maps\_anim::anim_first_frame( var_8, "knifepull_grab_idle" );
    level notify( "link_player", var_6 );
    var_9 = [];
    var_9["shepherd"] = level._id_B416;
    var_9["price"] = level.price;
    var_10 = maps\af_chase_knife_fight_code::_id_B991();
    var_10 linkto( level.price, "tag_eye", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player shellshock( "af_chase_ending_no_control_lowkick", 60 );
    var_5 = "fight_B";
    var_11 = level.price maps\_utility::getanim( var_5 );
    var_12 = getanimlength( var_11 );
    thread maps\af_chase_knife_fight_code::_id_C413( var_5, var_12 );
    var_3 thread maps\_anim::anim_single( var_9, var_5 );
    var_3 thread maps\_anim::anim_loop( var_8, "knifepull_grab_idle" );
    wait 1.0;
    soundscripts\_snd::snd_message( "aud_stop_mix_plr_curb_stomp" );
    maps\af_chase_knife_fight_code::_id_B3EA( 2.5 );

    for (;;)
    {
        if ( level.price getanimtime( var_11 ) >= 0.845 )
            break;

        wait 0.05;
    }

    soundscripts\_snd::snd_message( "start_post_curb_stomp_black_screen" );
    var_13 = var_12 * 0.11;
    maps\af_chase_knife_fight_code::_id_A8F1( var_13 );
    wait(var_13);
    wait 1.05;
    var_5 = "fight_B2";
    var_11 = level.price maps\_utility::getanim( var_5 );
    var_12 = getanimlength( var_11 );
    thread maps\af_chase_knife_fight_code::_id_C413( var_5, var_12 );
    var_3 thread maps\_anim::anim_single( var_9, var_5 );
    var_14 = gettime();
    wait 0.45;
    soundscripts\_snd::snd_message( "stop_post_curb_stomp_black_screen" );
    maps\af_chase_knife_fight_code::_id_B3EA( 1 );

    for (;;)
    {
        if ( level.price getanimtime( var_11 ) >= 0.5 )
            break;

        wait 0.05;
    }

    var_13 = var_12 * 0.1;
    soundscripts\_snd::snd_message( "start_post_curb_stomp_black_screen" );
    maps\af_chase_knife_fight_code::_id_A8F1( var_13 );
    wait(var_13);
    wait 1.5;
}

_id_A84F()
{
    soundscripts\_snd::snd_message( "start_knife_pullout_checkpoint" );
    maps\af_chase_knife_fight_code::_id_A8F1( 0 );
}

_id_CF7C()
{
    level endon( "missionfailed" );
    savegame( "pullout", &"AUTOSAVE_LEVELSTART", "shot", 1 );
    thread maps\af_chase_knife_fight_code::_id_B849();

    if ( !isdefined( level._id_CB8D ) )
        _id_D5A0();

    var_0 = getent( "end_scene_org_fight_C", "targetname" );
    var_1 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_2 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_3 = maps\af_chase_knife_fight_code::_id_CF10();
    var_4 = maps\af_chase_knife_fight_code::_id_C1F8();
    thread maps\af_chase_knife_fight_code::_id_CF00( var_2 );
    var_5 = [];
    var_5["knife"] = var_3;
    var_5["player_rig"] = var_2;
    var_6 = [];
    var_6["shepherd"] = level._id_B416;
    var_6["price"] = level.price;
    var_1 thread maps\_anim::anim_first_frame_solo( var_4, "price_wakeup" );
    var_1 notify( "stop_loop" );
    var_1 thread maps\_anim::anim_loop( var_5, "knifepull_grab_idle" );
    wait 0.5;
    level.player shellshock( "af_chase_ending_pulling_knife_later", 60 );
    level notify( "player_has_min_arc" );
    var_7 = maps\af_chase_knife_fight_code::_id_B991();
    var_7 linkto( level.price, "tag_eye", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_8 = "fight_C";
    var_9 = level.price maps\_utility::getanim( var_8 );
    var_10 = getanimlength( var_9 );
    thread maps\af_chase_knife_fight_code::_id_C413( var_8, var_10 );
    var_1 thread maps\_anim::anim_single( var_6, var_8 );
    thread maps\af_chase_knife_fight_code::_id_B40C();
    maps\_utility::delaythread( 0.3, soundscripts\_snd::snd_message, "stop_post_curb_stomp_black_screen" );
    maps\_utility::delaythread( 0.3, maps\af_chase_knife_fight_code::_id_B3EA, 1 );
    wait 1.5;
    soundscripts\_snd::snd_message( "start_post_curb_stomp_black_screen" );
    maps\af_chase_knife_fight_code::_id_A8F1( 1 );
    wait 1;
    var_1 thread maps\af_chase_knife_fight_code::_id_C657( var_6 );
    level notify( "waiting_for_player_to_look_at_knife" );
    wait 1;
    maps\_utility::delaythread( 0.3, soundscripts\_snd::snd_message, "stop_post_curb_stomp_black_screen" );
    maps\_utility::delaythread( 0.3, maps\af_chase_knife_fight_code::_id_B3EA, 1 );

    if ( getdvar( "af_chase_use_old_knife_input", 1 ) == "1" )
        maps\af_chase_knife_fight_code::_id_BC66();
    else
        maps\af_chase_knife_fight_code::_id_AABC();

    common_scripts\utility::flag_set( "player_looks_at_knife" );
    thread _id_CE81( "player_looks_at_knife" );
    maps\af_chase_knife_fight_code::_id_B3EA( 0.5 );
    common_scripts\utility::flag_set( "focused_on_knife" );
    common_scripts\utility::flag_set( "player_uses_knife" );
    level notify( "lerp_view_after_uses_knife" );
    var_1 notify( "stop_loop" );
    var_1 maps\_anim::anim_single( var_5, "knifepull_grab_01" );
    var_1 maps\_anim::anim_first_frame( var_5, "knifepull_pull_01" );
    maps\_utility::delaythread( 3, common_scripts\utility::flag_set, "price_shepherd_fight_e_flag" );
    thread maps\af_chase_knife_fight_code::_id_A88F();
    level.additive_pull_weight = 0;
    thread maps\ending_aud::_id_CB84();
    var_1 thread maps\_anim::anim_single( var_5, "knifepull_pull_01" );
    thread maps\af_chase_knife_fight_code::_id_C7D3();
    var_11 = spawnstruct();
    var_11._id_BF75 = 0;
    var_11._id_C6A1 = 6;
    var_11._id_BCBC = 1;
    var_11._id_C144 = 0.75;
    var_11.rate = 0.065;
    var_11.range = 0.03;
    var_11.occumulator_base = 4;
    var_11.auto_occumulator_base = 1;
    var_11.set_pull_weight = 1;
    var_11._id_A9D9 = "player_knife_pull_1";
    var_11.min_light = 70;
    var_11.min_heavy = 90;
    var_11.rumble_loop = "light_3s";
    var_11 maps\af_chase_knife_fight_code::_id_CA9B( "knifepull_pull_01" );
    level.additive_pull_weight = 1;
    earthquake( 0.2, 0.3, level.player.origin, 5000 );
    level notify( "second_knife_pull" );
    var_1 maps\_anim::anim_single( var_5, "knifepull_grab_02" );
    var_1 maps\_anim::anim_first_frame( var_5, "knifepull_pull_02" );
    common_scripts\utility::flag_set( "two_hand_pull_begins" );
    var_1 thread maps\_anim::anim_single( var_5, "knifepull_pull_02" );
    var_11 = spawnstruct();
    var_11._id_BF75 = 0;
    var_11._id_C6A1 = 6;
    var_11._id_BCBC = 1;
    var_11._id_C144 = 0.75;
    var_11.rate = 0.7;
    var_11.range = 0.2;
    var_11._id_CE34 = 50;
    var_11.override_anim_time = 0.9;
    var_11.occumulator_base = 2;
    var_11._id_A9D9 = "player_knife_pull_2";
    var_11.min_light = 20;
    var_11.min_heavy = 50;
    var_11.rumble_loop = "heavy_3s";
    var_11 maps\af_chase_knife_fight_code::_id_CA9B( "knifepull_pull_02" );
    level notify( "fight_C_is_over" );
    maps\_utility::delaythread( 0.65, ::_id_AE0B );
    level._id_B416 common_scripts\utility::delaycall( 3, ::show );
    level.price common_scripts\utility::delaycall( 3, ::show );
}

_id_C639()
{
    soundscripts\_snd::snd_message( "start_knife_kill_checkpoint" );
    var_0 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_1 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    level.player playerlinktodelta( var_0, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player shellshock( "af_chase_ending_pulling_knife_later", 60 );
    thread maps\af_chase_knife_fight_code::_id_C38C( 0.1 );
    var_2 = maps\af_chase_knife_fight_code::_id_C1F8();
    var_1 thread maps\_anim::anim_first_frame_solo( var_2, "price_wakeup" );
    wait 0.05;
    var_3 = [];
    var_3["shepherd"] = level._id_B416;
    var_3["price"] = level.price;
    var_1 thread maps\af_chase_knife_fight_code::_id_C657( var_3 );
}

_id_ABC0()
{
    if ( common_scripts\utility::flag( "missionfailed" ) )
    {
        wait 2;
        return;
    }

    common_scripts\utility::flag_set( "throw_knife_pulled_out" );
    maps\af_chase_anim::_id_B95F();
    common_scripts\utility::flag_set( "player_heartbeat_sound" );
    savegame( "kill", &"AUTOSAVE_LEVELSTART", "shot", 1 );
    var_0 = getent( "end_scene_org_fight_C", "targetname" );
    var_1 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_2 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_3 = maps\af_chase_knife_fight_code::_id_CF10();
    var_4 = maps\af_chase_knife_fight_code::_id_C1F8();
    thread maps\af_chase_knife_fight_code::_id_BBA7( var_2 );
    level.player disableslowaim();
    setsaveddvar( "aim_turnrate_yaw", 260 );
    setsaveddvar( "aim_turnrate_pitch", 90 );
    var_5 = [];
    var_5["knife"] = var_3;
    var_5["player_rig"] = var_2;
    var_6 = [];
    var_6["shepherd"] = level._id_B416;
    var_6["price"] = level.price;
    level notify( "knife_pulled_out" );
    var_1 maps\_anim::anim_single( var_5, "knifepull_pullout_flip" );
    level notify( "aim_at_shepherd" );
    common_scripts\utility::flag_set( "throw_knife_gameplay_started" );
    thread _id_CE81( "throw_knife_gameplay_started" );
    thread maps\af_chase_knife_fight_code::_id_AF45( var_2 );
    var_1 thread maps\_anim::anim_loop( var_5, "knifepull_pullout_flip_idle" );
    thread maps\af_chase_knife_fight_code::_id_C949();
    var_7 = maps\af_chase_knife_fight_code::_id_B6DC();
    var_7.alpha = 1;
    var_7 fadeovertime( 1 );
    maps\af_chase_knife_fight_code::_id_B8B1( var_7 );
    var_7 destroy();
    musicstop( 4 );
    level.player thread maps\_utility::play_sound_on_entity( "mus_af_chase_shepherd_death_stinger" );
    maps\af_chase_knife_fight_code::_id_B3EA( 0.5 );
    level notify( "pull_back_knife_anim_starts" );
    var_8 = 1.2;
    level._id_C381 moveto( ( 52.0, 0.0, 0.0 ), var_8, var_8 * 0.5, var_8 * 0.5 );
    var_2 thread maps\_utility::play_sound_on_entity( "scn_afchase_player_knife_breath" );
    maps\af_chase_knife_fight_code::_id_C765( 0.15 );
    var_1 notify( "stop_loop" );
    common_scripts\utility::flag_set( "shepherd_killed" );
    thread _id_CE81( "shepherd_killed" );
    level._id_B416 playrumbleonentity();
    level.price playrumbleonentity();
}

_id_D25F()
{
    soundscripts\_snd::snd_message( "start_price_wakeup_checkpoint" );
    thread maps\af_chase_knife_fight_code::_id_C914( 0.1 );
    maps\af_chase_anim::_id_C953( 0 );
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    level.player_rig = maps\_utility::spawn_anim_model( "player_rig" );
    var_1 = level.player_rig;
    var_0 thread maps\_anim::anim_first_frame_solo( var_1, "endgame" );
    level.player playerlinktodelta( var_1, "tag_player", 1, 10, 15, 5, 10 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

endgame()
{
    maps\af_chase_knife_fight_code::_id_BDAE();
    level._id_C942 animscripts\shared::dropallaiweapons();
    var_0 = maps\af_chase_knife_fight_code::_id_CF10();
    level.player fadeoutshellshock();
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname( "ending_rescue_chopper" );
    var_1 setmodel( "vehicle_little_bird_bench_afghan" );
    var_1.animname = "littlebird";
    var_1 notify( "suspend_drive_anims" );
    var_1 maps\af_chase_aud::_id_C715();
    var_2 = [];
    var_2["shepherd"] = level._id_B416;
    var_2["price"] = level.price;
    var_2["nikolai"] = level._id_C942;
    var_2["knife"] = var_0;
    var_2["player"] = level.player_rig;
    var_2["chopper"] = var_1;
    var_3 = level.player_rig;
    var_4 = var_3 common_scripts\utility::spawn_tag_origin();
    var_4 linkto( var_3, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( var_4 );
    var_5 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    common_scripts\utility::run_thread_on_targetname( "shep_blood", maps\af_chase_knife_fight_code::_id_C92E );
    var_5 thread maps\_anim::anim_single( var_2, "endgame" );
    var_6 = level.player_rig maps\_utility::getanim( "endgame" );
    var_7 = getnotetracktimes( var_6, "ps_sc_afchase_wakeup" );
    var_8 = getnotetracktimes( var_6, "ps_scn_afchase_walkoff" );
    level.player_rig waittillmatch( "single anim", "ps_sc_afchase_wakeup" );

    foreach ( var_10 in var_2 )
    {
        var_11 = var_10 maps\_utility::getanim( "endgame" );
        var_10 _meth_83D4( var_11, 0 );
    }

    thread _id_A980();
    wait 1.8;
    common_scripts\_exploder::exploder( 60 );
    var_13 = 8.5;
    maps\af_chase_knife_fight_code::_id_C914( var_13 );
    level._id_C381 moveto( ( 65.0, 0.0, 0.0 ), var_13, var_13 * 0.5, var_13 * 0.5 );
    var_14 = gettime();
    maps\_utility::wait_for_buffer_time_to_pass( var_14, 4 );
    maps\_utility::wait_for_buffer_time_to_pass( var_14, 13.5 );
    soundscripts\_snd::snd_message( "aud_start_mix_fadeout_post_sheperd_death" );
    maps\_utility::wait_for_buffer_time_to_pass( var_14, 24 );
    level.price thread maps\_utility::play_sound_on_entity( "h2_scn_afchase_wakeup_price_foley" );
    soundscripts\_snd::snd_message( "aud_start_mix_price_wakeup", 3.5 );
    var_15 = "price_wakeup";
    var_16 = level.price maps\_utility::getanim( var_15 );
    var_17 = getanimlength( var_16 );
    thread maps\af_chase_knife_fight_code::_id_C413( var_15, var_17 );

    foreach ( var_10 in var_2 )
    {
        var_11 = var_10 maps\_utility::getanim( "endgame" );
        var_10 _meth_83D4( var_11, 1 );
    }

    var_20 = getanimlength( var_6 );
    var_21 = ( var_8[0] - var_7[0] ) * 0.95 * var_20;
    maps\_utility::delaythread( var_21, maps\af_chase_knife_fight_code::_id_A8F1, 1 );
    var_22 = 2.4;
    maps\_utility::delaythread( var_22, common_scripts\utility::flag_set, "af_chase_final_ending" );
    maps\_utility::delaythread( var_22 + 54.7, ::_id_D5BD );
    maps\_utility::delaythread( var_22 + 195, common_scripts\utility::flag_set, "af_chase_ending_credits" );
    maps\_utility::delaythread( var_22 + 0.25, maps\af_chase_knife_fight_code::_id_B3EA, 1 );
    level.player_rig waittillmatch( "single anim", "ps_scn_afchase_walkoff" );
    var_23 = 0;
    level.player playerlinktodelta( var_3, "tag_player", 1, var_23, var_23, var_23, var_23, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    maps\_utility::delaythread( 0.8, maps\af_chase_knife_fight_code::_id_C2F1 );
    var_15 = "price_wakeup";
    thread maps\af_chase_knife_fight_code::_id_CD95();
    thread maps\af_chase_knife_fight_code::_id_A810();
    thread maps\af_chase_knife_fight_code::_id_C458( 3 );
    thread maps\af_chase_anim::_id_CF6D( 0.1 );
    maps\_utility::delaythread( 0.5, maps\af_chase_knife_fight_code::_id_B3EA, 1 );
    soundscripts\_snd::snd_message( "aud_start_mix_walking_to_heli" );
    var_1 maps\af_chase_aud::_id_C715();
    var_1 thread maps\ending_aud::_id_B977();
    thread maps\af_chase_knife_fight_code::_id_CDF8();
    var_24 = common_scripts\utility::getstruct( "anim_node_chopper", "targetname" );
    var_15 = "walk_off";
    var_16 = level.price maps\_utility::getanim( var_15 );
    var_17 = getanimlength( var_16 );
    thread maps\af_chase_knife_fight_code::_id_C413( var_15, var_17 );
    var_14 = gettime();
    var_16 = var_3 maps\_utility::getanim( var_15 );
    var_25 = 0.5;
    var_26 = getanimlength( var_16 ) - var_25;
    maps\_utility::wait_for_buffer_time_to_pass( var_14, var_26 - 10 );
    var_4 delete();
}

_id_A980()
{
    setomnvar( "ui_consciousness_init", 1 );
    setomnvar( "ui_consciousness_play", 10 );
    var_0 = 28.0;
    var_1 = maps\_hud_util::create_client_overlay( "black", 0.0, level.player );
    var_1 fadeovertime( var_0 );
    var_1.alpha = 0.75;
    wait(var_0 + 0.15);
    var_2 = 0.5;
    var_1 fadeovertime( var_2 );
    var_1.alpha = 0.0;
    wait(var_2 + 0.25);
    var_1 destroy();
    wait(9 - var_2);
    setomnvar( "ui_consciousness_play", 11 );
    wait 46;
    setomnvar( "ui_consciousness_play", 0 );
}

_id_C2C6()
{
    soundscripts\_snd::snd_message( "start_price_wakeup_checkpoint" );
    thread maps\af_chase_knife_fight_code::_id_C914( 0.1 );
    waittillframeend;
    waittillframeend;
    maps\af_chase_anim::_id_C953( 0 );
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    level.player_rig = maps\_utility::spawn_anim_model( "player_rig" );
    var_1 = level.player_rig;
    var_0 thread maps\_anim::anim_first_frame_solo( var_1, "price_wakeup" );
    level.player playerlinktodelta( var_1, "tag_player", 1, 10, 15, 5, 10 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_BBAB()
{
    level.player shellshock( "af_chase_ending_fakeout", 60 );
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_1 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_2 = maps\af_chase_knife_fight_code::_id_C1F8();
    wait 1.8;
    var_3 = 8.5;
    maps\af_chase_knife_fight_code::_id_C914( var_3 );
    level._id_C381 moveto( ( 65.0, 0.0, 0.0 ), var_3, var_3 * 0.5, var_3 * 0.5 );
    var_4 = [];
    var_4["shepherd"] = level._id_B416;
    var_4["price"] = level.price;

    if ( level.start_point == "price_wakeup" )
    {
        level.player playerlinktodelta( var_1, "tag_player" );
        var_0 thread maps\_anim::anim_first_frame_solo( var_1, "price_wakeup" );
        var_0 thread maps\_anim::anim_single_solo( var_1, "price_wakeup" );
        var_0 maps\_anim::anim_first_frame( var_4, "price_wakeup" );
    }

    var_5 = gettime();
    maps\_utility::wait_for_buffer_time_to_pass( var_5, 4 );
    maps\_utility::wait_for_buffer_time_to_pass( var_5, 13.5 );
    soundscripts\_snd::snd_message( "aud_start_mix_fadeout_post_sheperd_death" );
    maps\af_chase_knife_fight_code::_id_A8F1( 19.5 );
    maps\_utility::wait_for_buffer_time_to_pass( var_5, 24 );
    level.price thread maps\_utility::play_sound_on_entity( "h2_scn_afchase_wakeup_price_foley" );
    soundscripts\_snd::snd_message( "aud_start_mix_price_wakeup", 3.5 );
    var_6 = "price_wakeup";
    var_7 = level.price maps\_utility::getanim( var_6 );
    var_8 = getanimlength( var_7 );
    thread maps\af_chase_knife_fight_code::_id_C413( var_6, var_8 );
    level.player playerlinktodelta( var_1, "tag_player" );
    var_0 thread maps\_anim::anim_single_solo( var_1, var_6 );
    var_7 = level.price maps\_utility::getanim( var_6 );
    var_9 = getanimlength( var_7 );
    var_10 = var_9 * 0.75;
    maps\_utility::delaythread( var_10, maps\af_chase_knife_fight_code::_id_A8F1, 1 );
    var_11 = 2.7;
    maps\_utility::delaythread( var_11, common_scripts\utility::flag_set, "af_chase_final_ending" );
    maps\_utility::delaythread( var_11 + 55.7, ::_id_D5BD );
    maps\_utility::delaythread( var_11 + 195, common_scripts\utility::flag_set, "af_chase_ending_credits" );
    maps\_utility::delaythread( var_11 + 0.25, maps\af_chase_knife_fight_code::_id_B3EA, 1 );
    var_0 thread maps\_anim::anim_single( var_4, var_6 );
    wait(var_9 * 0.85);
}

_id_C008()
{
    soundscripts\_snd::snd_message( "start_walkoff_checkpoint" );
}

_id_B02B()
{
    var_0 = [];
    var_0["shepherd"] = level._id_B416;
    var_0["price"] = level.price;
    var_1 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_2 = maps\af_chase_knife_fight_code::_id_C6C5();
    var_3 = maps\af_chase_knife_fight_code::_id_C1F8();
    var_4 = 0;
    level.player playerlinktodelta( var_2, "tag_player", 1, var_4, var_4, var_4, var_4, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    maps\_utility::delaythread( 0.8, maps\af_chase_knife_fight_code::_id_C2F1 );
    var_5 = common_scripts\utility::spawn_tag_origin();
    var_5 linkto( var_2, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( var_5 );
    var_6 = "price_wakeup";
    var_1 thread maps\_anim::anim_first_frame_solo( var_3, var_6 );
    var_1 thread maps\_anim::anim_first_frame_solo( var_2, var_6 );
    var_1 maps\_anim::anim_first_frame( var_0, var_6 );
    thread maps\af_chase_knife_fight_code::_id_CD95();
    var_3 delete();
    var_0 = [];
    maps\af_chase_knife_fight_code::_id_BDAE();
    thread maps\af_chase_knife_fight_code::_id_A810();
    level._id_C942 animscripts\shared::dropallaiweapons();
    thread maps\af_chase_knife_fight_code::_id_C458( 3 );
    thread maps\af_chase_anim::_id_CF6D( 0.1 );
    maps\_utility::delaythread( 0.5, maps\af_chase_knife_fight_code::_id_B3EA, 1 );
    var_7 = maps\_vehicle::spawn_vehicle_from_targetname( "ending_rescue_chopper" );
    var_7 setmodel( "vehicle_little_bird_bench_afghan" );
    var_7.animname = "littlebird";
    var_7 notify( "suspend_drive_anims" );
    soundscripts\_snd::snd_message( "aud_start_mix_walking_to_heli" );
    var_7 maps\af_chase_aud::_id_C715();
    var_7 thread maps\ending_aud::_id_B977();
    var_7 maps\af_chase_aud::_id_C715();
    var_0["nikolai"] = level._id_C942;
    var_0["price"] = level.price;
    thread maps\af_chase_knife_fight_code::_id_CDF8();
    var_1 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_8 = common_scripts\utility::getstruct( "anim_node_chopper", "targetname" );
    var_6 = "walk_off";
    var_9 = level.price maps\_utility::getanim( var_6 );
    var_10 = getanimlength( var_9 );
    thread maps\af_chase_knife_fight_code::_id_C413( var_6, var_10 );
    var_8 thread maps\_anim::anim_single_solo( var_7, var_6 );
    var_1 thread maps\_anim::anim_single( var_0, var_6 );
    var_1 thread maps\_anim::anim_single_solo( var_2, var_6 );
    var_11 = gettime();
    var_9 = var_2 maps\_utility::getanim( var_6 );
    var_12 = 0.5;
    var_13 = getanimlength( var_9 ) - var_12;
    maps\_utility::wait_for_buffer_time_to_pass( var_11, var_13 - 10 );
}

_id_D5BD()
{
    level.player playersetgroundreferenceent( undefined );
    soundscripts\_snd::snd_message( "aud_stop_mix_walking_to_heli" );
    soundscripts\_snd::snd_message( "aud_start_mix_level_fadeout" );
    var_0 = 0.5;
    var_1 = maps\af_chase_knife_fight_code::get_black_overlay();
    var_1.alpha = 1;
    maps\_utility::delaythread( 4, maps\_utility::nextmission );
    common_scripts\utility::flag_set( "do_museum_credits" );
    wait 0.1;
    var_2 = getaispeciesarray();
    common_scripts\utility::array_call( var_2, ::delete );
    level._id_C381 delete();
    thread _id_CC30::_id_C14C();
}

_id_BFCD()
{
    common_scripts\utility::flag_wait( "af_chase_see_shepherd" );
    maps\_utility::objective_complete( 2 );
    objective_add( 3, "current", &"AF_CHASE_KILL_SHEPHERD" );
    objective_setpointertextoverride( 3, &"AF_CHASE_OBJ_KILL" );
    common_scripts\utility::flag_wait( "shepherd_killed" );
    wait 3.1;
    objective_state_nomessage( 3, "done" );
}

_id_CEFB()
{
    waittillframeend;
    var_0 = level.start_point;
    common_scripts\utility::flag_set( "end_heli_crashed" );
    common_scripts\utility::flag_set( "water_cliff_jump_splash_sequence" );
    common_scripts\utility::flag_set( "killed_pickup_heli" );
    common_scripts\utility::flag_set( "fell_off_waterfall" );

    if ( var_0 == "wakeup" )
        return;

    if ( var_0 == "wakefast" )
        return;

    common_scripts\utility::flag_set( "start_doing_aftermath_walk" );
    _id_D220();
    maps\af_chase_knife_fight_code::_id_C99B();
    _id_CC30::_id_B003();
    common_scripts\utility::flag_set( "player_standing" );

    if ( var_0 == "turnbuckle" )
        return;

    maps\af_chase_knife_fight_code::_id_C1D9();
    maps\af_chase_knife_fight_code::_id_BD20();
    level._id_C781 = _id_CC30::_id_CFE1;
    common_scripts\utility::flag_set( "aftermath_dont_do_wakeup" );
    level.player takeallweapons();
    common_scripts\utility::flag_set( "stop_aftermath_player" );
    maps\af_chase_knife_fight_code::_id_BEC4();
    common_scripts\utility::flag_set( "player_near_shepherd" );
    common_scripts\utility::flag_set( "turn_buckle_fadeout" );

    if ( var_0 == "gloat" )
        return;

    if ( var_0 == "gun_fight" )
        return;

    common_scripts\utility::flag_set( "bloody_player_rig" );

    if ( var_0 == "gun_drop" )
        return;

    if ( var_0 == "crawl" )
        return;

    if ( var_0 == "gun_kick" )
        return;

    maps\af_chase_knife_fight_code::_id_C454();
    var_1 = maps\af_chase_knife_fight_code::_id_AA80();
    maps\af_chase_knife_fight_code::_id_C587();

    if ( var_0 == "wounded" )
        return;

    maps\af_chase_knife_fight_code::_id_AD8D();
    maps\af_chase_knife_fight_code::_id_CEF3();

    if ( var_0 == "pullout" )
        return;

    if ( var_0 == "kill" )
        return;

    level._id_C381.origin = ( 65.0, 0.0, 0.0 );

    if ( var_0 == "endgame" )
        return;

    if ( var_0 == "price_wakeup" )
        return;

    if ( var_0 == "walkoff" )
        return;

    if ( var_0 == "debug_boatdrive" )
        return;

    if ( var_0 == "museum_free" || var_0 == "museum_credits" )
        return;
}

_id_D5A0()
{
    level.player _meth_85B6( "ending_pain", "veilstrength,veilbackgroundstrength,tonemapwhite,tonemapshoulder,tonemapcrossover,tonemaptoe,tonemapblack,tonemaphdrwhite,tonemaphdrshoulder,tonemaphdrcrossover,tonemaphdrtoe,tonemaphdrblack" );
    level.player _meth_85B9( "ending_pain" );
    level._id_CB8D = 0;
}

_id_C355( var_0, var_1 )
{
    level notify( "lerp_blood_rush" );
    level endon( "lerp_blood_rush" );
    var_2 = 0.05;
    var_3 = ceil( var_1 / var_2 );
    var_4 = ( var_0 - level._id_CB8D ) / max( var_3, 1 );

    for ( var_5 = 0; var_5 < var_3; var_5++ )
    {
        var_6 = level._id_CB8D;
        level._id_CB8D += var_4;
        setsaveddvar( "r_lightSetBlendFrac", level._id_CB8D );
        level.player _meth_85B8( var_6, level._id_CB8D );
        wait(var_2);
    }

    setsaveddvar( "r_lightSetBlendFrac", var_0 );
    level.player _meth_85B8( level._id_CB8D, var_0 );
    level._id_CB8D = var_0;
}

_id_AE0B()
{
    level.player _meth_85B7();
    level.player _meth_85BA();
    level._id_CB8D = undefined;
}

knife_fight_culldist()
{
    switch ( level.start_point )
    {
        case "wakeup":
        case "wakefast":
        case "turnbuckle":
            setculldist( 30000 );
            common_scripts\utility::flag_wait( "player_touched_shepherd" );
        case "crawl":
        case "kill":
        case "gloat":
        case "gun_drop":
        case "gun_kick":
        case "wounded":
        case "pullout":
        case "price_wakeup":
        case "walkoff":
        case "endgame":
            setculldist( 3500 );
            common_scripts\utility::flag_wait( "do_museum_credits" );
        case "museum_credits":
        case "museum_freeroam":
            setculldist( 0 );
            break;
        case "no_game":
            break;
        default:
            break;
    }
}
