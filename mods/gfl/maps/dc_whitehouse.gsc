// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" )
    {
        maps\dc_whitehouse_beautiful_corner::_id_C662();
        return;
    }

    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\dc_whitehouse_mission_select_cam::_id_C490();
        return;
    }

    thread maps\dc_whitehouse_code::whitehouse_fx_volumes();
    setsaveddvar( "fx_cast_shadow", 0 );
    maps\_utility::default_start( ::_id_C201 );
    maps\_utility::add_start( "tunnels", ::_id_C201, "[tunnels] -> make you way to WH", ::_id_B414 );
    maps\_utility::add_start( "oval_office", ::_id_C20E, "[oval_office] -> Will only work for testing anims" );
    maps\_utility::add_start( "flare", ::_id_BACD, "[flare] -> pop the flare" );
    _id_B4B2();
    _id_C2B0();
    var_0 = getentarray( "ceilling_light_flickering", "script_noteworthy" );
    common_scripts\utility::array_thread( getentarray( "lantern_animate", "targetname" ), maps\dc_whitehouse_code::h2_wh_animated_lantern );
    common_scripts\utility::array_thread( getentarray( "lantern_flicker", "targetname" ), maps\dc_whitehouse_code::h2_wh_flickering_lantern, var_0 );
    thread play_rain_in_hole();
    thread maps\dc_whitehouse_code::h2_wh_static_model_groups();
    level._id_B6F5 = [];
    level._id_B6F5["water_waist"] = 1;
    level.player thread maps\_utility::_id_B43E();
    thread maps\dc_whitehouse_code::delete_weapon_in_volume();
}

play_rain_in_hole()
{
    level endon( "player_outside" );
    thread watch_player_exit();
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = ( -8090.0, 6280.0, -80.0 );
    var_0.angles = ( -90.0, 0.0, 0.0 );
    common_scripts\utility::flag_wait( "player_weather_enabled" );

    while ( common_scripts\utility::flag( "player_weather_enabled" ) )
    {
        if ( level.rainlevel > 8 )
            playfxontag( level._effect["rain_hole_" + level.rainlevel], var_0, "tag_origin" );

        wait 0.4;
    }
}

watch_player_exit()
{
    common_scripts\utility::flag_wait( "outside_tunnels" );
    level notify( "player_outside" );
    level._effect["rain_10"] = loadfx( "fx/weather/rain_heavy_mist" );
    level._effect["rain_9"] = loadfx( "fx/weather/rain_9_lite" );
    level._effect["rain_hole_10"] = loadfx( "fx/misc/blank" );
    level._effect["rain_hole_9"] = loadfx( "fx/misc/blank" );
    thread maps\_weather::rainmedium( 1 );
    wait 8.0;
    thread maps\_weather::rainlight( 24 );
}

_id_C2B0()
{
    _id_C683::main();
    _id_C8A6::main();
    maps\dc_whitehouse_lighting::main();
    _id_C246::main();
    _id_D491::main();
    _id_D245::main();
    maps\_load::main();
    precacheitem( "flare" );
    precachemodel( "picture_frame_07_animated" );
    precachemodel( "h2_wh_oval_office_secret_door_anim" );
    precacheshellshock( "minor" );
    precachemodel( "mil_sandbag_plastic_white_single_flat" );
    precachemodel( "mil_sandbag_plastic_white_single_bent" );
    precachemodel( "rappelrope100_ri" );
    precachemodel( "mil_emergency_flare" );
    precachemodel( "h2_light_chandelier_vintage_04" );
    precachemodel( "h2_light_chandelier_vintage_04_on" );
    precacheturret( "heli_spotlight" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup_small_on" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup_small_off" );
    precacheitem( "rpg_straight" );
    precachemodel( "com_door_01_handleleft2" );
    precachemodel( "weapon_binocular" );
    precachemodel( "head_us_army_g" );
    precachemodel( "head_us_army_a" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );

    precachemodel( "h2_gfl_ump9_viewbody" );
    precachemodel( "h2_gfl_ump9_viewhands" );
    precachemodel( "h2_gfl_ump9_viewhands_player" );

    maps\_utility::add_hint_string( "how_to_pop_flare", &"SCRIPT_PLATFORM_HINTSTR_POPFLARE", maps\dc_whitehouse_code::_id_CD1C, undefined, "medium_background" );
    level.default_goalheight = 72;
    maps\dc_whitehouse_anim::main();
    maps\_drone_ai::init();
    setsaveddvar( "compassMaxRange", 4500 );
    maps\dc_whitehouse_aud::main();
    level.player setempjammed( 1 );
    maps\_compass::setupminimap( "compass_map_dcemp_static" );
    maps\_utility::add_global_spawn_function( "allies", maps\dc_whitehouse_code::_id_B5C9 );
    common_scripts\utility::array_thread( getvehiclenodearray( "plane_sound", "script_noteworthy" ), _id_B596::plane_sound_node );
    createthreatbiasgroup( "ignore_player" );
    createthreatbiasgroup( "player" );
    setignoremegroup( "player", "ignore_player" );
    level.player setthreatbiasgroup( "player" );
    maps\_utility::delaythread( 1, maps\_utility::flavorbursts_off, "allies" );
    common_scripts\utility::array_thread( getentarray( "flickerlight1", "script_noteworthy" ), maps\dc_whitehouse_code::_id_BC0F );
    level thread music();
    common_scripts\utility::array_thread( getentarray( "animated_hanging_model", "targetname" ), maps\dc_whitehouse_code::_id_A802 );
    common_scripts\utility::array_thread( getentarray( "rotating_fan", "targetname" ), maps\dc_whitehouse_code::_id_C3F2 );
    common_scripts\utility::array_thread( getentarray( "player_usable_turret", "script_noteworthy" ), maps\dc_whitehouse_code::player_usable_turret_init );
    common_scripts\utility::array_thread( getentarray( "pan_metal_idle", "targetname" ), maps\dc_whitehouse_code::metal_pan_scripted_anim, "pan_metal_idle" );
    common_scripts\utility::array_thread( getentarray( "pan_copper_idle", "targetname" ), maps\dc_whitehouse_code::metal_pan_scripted_anim, "pan_copper_idle" );
    thread maps\dc_whitehouse_code::h2_marshall_dialogue_foley_ignore_damage();
}

music()
{
    maps\_utility::music_loop( "mus_dc_whitehouse_tunneldrone", 140 );
    common_scripts\utility::flag_wait( "music_cue" );
    wait 2.1;
    maps\_utility::music_loop( "mus_dc_whitehouse_attack", 328, 1 );
    common_scripts\utility::flag_wait( "whitehouse_entrance_clear" );
    maps\_utility::music_loop( "mus_dc_whitehouse_attack_int", 328, 7 );
    common_scripts\utility::flag_wait( "whitehouse_2min" );
    maps\_utility::music_play( "mus_dc_whitehouse_endrun", 5 );
    soundscripts\_snd::snd_message( "start_endrun_mix" );
}

_id_B4B2()
{
    common_scripts\utility::flag_init( "team_initialized" );
    common_scripts\utility::flag_init( "mg_threat" );
    common_scripts\utility::flag_init( "oval_office_foley_react" );
    common_scripts\utility::flag_init( "oval_office_done" );
    common_scripts\utility::flag_init( "oval_office_door_open" );
    common_scripts\utility::flag_init( "oval_office_moveout" );
    common_scripts\utility::flag_init( "oval_office_dunn_ready" );
    common_scripts\utility::flag_init( "oval_office_foley_ready" );
    common_scripts\utility::flag_init( "oval_office_anim_started" );
    common_scripts\utility::flag_init( "oval_office_foley_inplace" );
    common_scripts\utility::flag_init( "whitehouse_kitchen_open" );
    common_scripts\utility::flag_init( "whitehouse_interior" );
    common_scripts\utility::flag_init( "whitehouse_radio_done" );
    common_scripts\utility::flag_init( "whitehouse_hammerdown" );
    common_scripts\utility::flag_init( "whitehouse_hammerdown_stopped" );
    common_scripts\utility::flag_init( "whitehouse_briefing_start" );
    common_scripts\utility::flag_init( "whitehouse_briefing_end" );
    common_scripts\utility::flag_init( "whitehouse_hammerdown_started" );
    common_scripts\utility::flag_init( "whitehouse_flare_breach" );
    common_scripts\utility::flag_init( "whitehouse_wrapup" );
    common_scripts\utility::flag_init( "whitehouse_completed" );
    common_scripts\utility::flag_init( "broadcast" );
    common_scripts\utility::flag_init( "broadcast_pause" );
    common_scripts\utility::flag_init( "broadcast_end" );
    common_scripts\utility::flag_init( "countdown" );
    common_scripts\utility::flag_init( "whitehouse_hammerdown_jets" );
    common_scripts\utility::flag_init( "whitehouse_hammerdown_jets_fly" );
    common_scripts\utility::flag_init( "remove_use_hint" );
    common_scripts\utility::flag_init( "flare_end_fx" );
    common_scripts\utility::flag_init( "whitehouse_2min" );
    common_scripts\utility::flag_init( "whitehouse_90sec" );
    common_scripts\utility::flag_init( "whitehouse_1min" );
    common_scripts\utility::flag_init( "whitehouse_30sec" );
    common_scripts\utility::flag_init( "player_flare" );
    common_scripts\utility::flag_init( "player_flare_popped" );
    common_scripts\utility::flag_init( "player_flare_abort" );
    common_scripts\utility::flag_init( "marshallTakeBackWeapon" );
    common_scripts\utility::flag_init( "remove_flare_hint" );
    common_scripts\utility::flag_init( "player_looking_at_flareguy" );
    common_scripts\utility::flag_init( "music_cue_endrun_ending" );
    common_scripts\utility::flag_init( "stop_rain" );
    common_scripts\utility::flag_init( "whitehouse_entrance_clear" );
    common_scripts\utility::flag_init( "whitehouse_marshall_dialogue" );
    common_scripts\utility::flag_init( "start_ending_dialog" );
}

_id_C201()
{
    soundscripts\_snd::snd_message( "start_tunnels_checkpoint" );
    maps\dc_whitehouse_code::_id_B080();
    maps\_utility::activate_trigger_with_targetname( "tunnels_init_color_trigger" );
    level waittill( "introscreen_complete" );
    thread maps\dc_whitehouse_code::check_trigger();
    var_0 = getent( "intro_scripted_node", "targetname" );
    common_scripts\utility::array_thread( level.intro_guys, maps\dc_whitehouse_code::intro_scripted_anim, var_0 );
    thread _id_CBC9();
    maps\_utility::activate_trigger_with_targetname( "tunnels_start_color_trigger" );
    level thread objectives();
}

_id_B414()
{
    maps\_weather::rainhard( 1 );
    maps\_utility::array_spawn_function_noteworthy( "tunnels_wave_guy", ::_id_BA31 );
    maps\_utility::array_spawn_function_noteworthy( "tunnels_twirl_guy", ::_id_B41E );
    maps\dc_whitehouse_code::_id_D04E();
    maps\_utility::battlechatter_off( "allies" );
    level.foley thread _id_C99D();
    level._id_ACC0 thread _id_ABD3();
    common_scripts\utility::flag_wait( "tunnels_wave_guy" );
    thread maps\_weather::rainmedium( 15 );
    common_scripts\utility::flag_wait( "whitehouse_init" );
    var_0 = _id_D245::lightning_normal;
    var_1 = _id_D245::lightning_flash;
    thread maps\_weather::lightningflash( var_0, var_1 );
    level thread _id_D5C7();
}

_id_CBC9()
{
    common_scripts\utility::flag_wait( "tunnel_dialogue" );
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_partystarted" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_rogerstayfrosty" );
}

_id_BA31()
{
    self endon( "death" );
    thread wave_guy_deleter( self );
    // codescripts\character::setheadmodel( "head_us_army_a" );
    character\gfl\randomizer_us_army::main();
    maps\_utility::forceuseweapon( "m4_grunt", "primary" );
    var_0 = getent( self.target, "targetname" );
    var_0 thread maps\_anim::anim_generic_loop( self, "wave_idle", "stop_loop" );
    common_scripts\utility::flag_wait( "tunnels_wave_guy" );
    var_1 = [];
    var_1[0] = "wave_whiskey";
    var_1[1] = "wave_come_on";
    var_1[2] = "wave_move";
    var_2 = 0;

    for (;;)
    {
        if ( !common_scripts\utility::flag( "tunnel_dialogue" ) )
        {
            var_0 notify( "stop_loop" );
            var_0 maps\_anim::anim_generic( self, var_1[var_2] );
            var_0 thread maps\_anim::anim_generic_loop( self, "wave_idle", "stop_loop" );
        }

        wait(randomfloatrange( 7, 10 ));

        if ( var_2 == 2 )
            wait 10;

        var_2 = ( var_2 + 1 ) % var_1.size;
    }
}

wave_guy_deleter( var_0 )
{
    common_scripts\utility::flag_wait( "whitehouse_init" );
    var_0 delete();
}

_id_B41E()
{
    var_0 = getent( "tunnels_twirl_animent", "targetname" );
    maps\_utility::walkdist_zero();
    var_0 maps\_anim::anim_generic_reach( self, "combatwalk_F_spin" );
    var_0 maps\_anim::anim_generic( self, "combatwalk_F_spin" );
    maps\_utility::enable_ai_color();
    maps\_utility::walkdist_reset();
}

_id_D5C7()
{
    maps\_utility::autosave_by_name( "tunnel_exit" );
    maps\_utility::array_spawn_function_noteworthy( "whitehouse_drone", ::_id_ACBD );
    maps\_utility::array_spawn_function_noteworthy( "drone_war_drone", ::_id_C39D );
    var_0 = getent( "marshall", "script_noteworthy" );
    var_0 maps\_utility::add_spawn_function( ::_id_D52B );
    var_0 maps\_utility::spawn_ai();
    maps\dc_whitehouse_code::_id_B9CD();
    maps\dc_whitehouse_code::_id_AD1A();
    maps\dc_whitehouse_code::_id_AAE6();
    maps\dc_whitehouse_code::_id_CABF( "sandbag_group" );
    maps\dc_whitehouse_code::_id_CABF( "westwing_sandbag_group" );
    maps\dc_whitehouse_code::_id_CCD0();
    maps\dc_whitehouse_code::_id_D1DA();
    level thread _id_CB11();
    level thread _id_C56A();
    level thread _id_D2A0();
    common_scripts\utility::array_thread( level.team, ::_id_BE52 );
    level thread _id_AEE3();
    level thread _id_AC26();
    level thread _id_BBAE();
    level.player.ignoreme = 1;
    common_scripts\utility::flag_wait( "whitehouse_moveout" );
    level.player.ignoreme = 0;
    thread maps\dc_whitehouse_code::calm_down_courtyard_heroes();
    maps\_utility::autosave_by_name( "moveout" );
    maps\_utility::activate_trigger_with_targetname( "whitehouse_moveout_color_trigger" );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_wait( "whitehouse_spotlight" );
    thread maps\_weather::rainnone( 20 );
    maps\_utility::delaythread( 19.0, common_scripts\utility::flag_set, "stop_rain" );
    level thread maps\dc_whitehouse_code::_id_BE7E();
    _id_B78A();
}

_id_CB11()
{
    var_0 = maps\dc_whitehouse_code::_id_CCBB( "whitehouse_spotlight", 400 );
    var_1 = maps\dc_whitehouse_code::_id_CCBB( "westwing_spotlight", 600 );
    common_scripts\utility::flag_wait( "whitehouse_spotlight" );
    var_0 thread maps\dc_whitehouse_code::_id_BA68();
    var_0 thread _id_B24F();
    common_scripts\utility::flag_wait( "whitehouse_entrance_init" );

    if ( isdefined( var_0 ) )
        var_0._id_D363 notify( "damage", 1000, level.player );

    var_1 thread maps\dc_whitehouse_code::_id_BA68();
    common_scripts\utility::flag_wait( "whitehouse_radio_start" );
    wait 30;

    if ( isdefined( var_1 ) )
        var_1._id_D363 notify( "damage", 1000, level.player );
}

_id_B24F()
{
    common_scripts\utility::flag_wait( "whitehouse_entrance_moveup" );
    wait 8;

    if ( self.spotlight_is_dead )
        return;
    else
    {
        level._id_ACC0 setentitytarget( self );
        self waittill( "death" );
        level._id_ACC0 clearentitytarget();
    }
}

objectives()
{
    wait 2;

    switch ( level.start_point )
    {
        case "tunnels":
        case "flare":
            objective_add( 11, "current", &"DC_WHITEHOUSE_OBJ_DEPLOY_FLARE" );
            objective_onentity( 11, level.foley, ( 0.0, 0.0, 70.0 ) );
            thread _id_CB73();
            common_scripts\utility::flag_wait( "whitehouse_flare_breach" );
            setsaveddvar( "objectiveFadeTimeWaitOff", 0.5 );
            setsaveddvar( "objectiveFadeTooFar", 0.1 );
            objective_onentity( 11, level._id_AF81, ( 0.0, 0.0, 70.0 ) );
            thread _id_CB73();
            common_scripts\utility::flag_wait( "whitehouse_hammerdown_jets_safe" );
            wait 2;
            objective_position( 11, ( 0.0, 0.0, 0.0 ) );
            level common_scripts\utility::waittill_any( "player_flare_abort", "player_flare_popped" );
            objective_state( 11, "done" );
            common_scripts\utility::flag_set( "remove_flare_hint" );
        default:
            objective_add( 8, "active", &"DC_WHITEHOUSE_OBJ_GET_TO_WH" );
            objective_add( 9, "invisible", &"DC_WHITEHOUSE_OBJ_FOLLOW" );
            objective_state_nomessage( 9, "current" );
            _func_1E7( 9, 1 );
            objective_onentity( 9, level.foley, ( 0.0, 0.0, 70.0 ) );
            thread _id_CB73();
            common_scripts\utility::flag_wait( "whitehouse_moveout" );
            wait 5;
            objective_state( 9, "active" );
            objective_state_nomessage( 9, "done" );
            var_0 = common_scripts\utility::getstruct( "objective_entrance", "targetname" );
            objective_add( 10, "current", &"DC_WHITEHOUSE_OBJ_BREACH_WH", var_0.origin );
            _func_1E7( 10, 1 );
            common_scripts\utility::flag_wait( "oval_office_scene" );
            level thread _id_C30F();
            wait 0.5;
            objective_state( 10, "done" );
            objective_state_nomessage( 8, "current" );
            wait 1;
            objective_onentity( 8, level._id_ACC0, ( 0.0, 0.0, 70.0 ) );
            common_scripts\utility::flag_wait( "oval_office_done" );
            objective_state( 8, "done" );
    }

    common_scripts\utility::flag_wait( "whitehouse_completed" );
    wait 3;
    soundscripts\_snd::snd_message( "start_fade_out_mix" );
    maps\dc_whitehouse_code::fade_out_level( 3.5 );

    if ( maps\_utility::is_default_start() )
        maps\_utility::nextmission();
    else
        iprintlnbold( "DEVELOPER: END OF SCRIPTED LEVEL" );
}

_id_CB73()
{
    var_0 = getdvarfloat( "objectiveFadeTimeWaitOff" );
    var_1 = getdvarfloat( "objectiveFadeTooFar" );
    setsaveddvar( "objectiveFadeTimeWaitOff", 2 );
    setsaveddvar( "objectiveFadeTooFar", 0.1 );
    wait 2;
    setsaveddvar( "objectiveFadeTimeWaitOff", var_0 );
    setsaveddvar( "objectiveFadeTooFar", var_1 );
}

_id_C30F()
{
    var_0 = getdvarfloat( "objectiveFadeTimeWaitOff" );
    var_1 = getdvarfloat( "objectiveFadeTooFar" );
    setsaveddvar( "objectiveFadeTimeWaitOff", 0.5 );
    setsaveddvar( "objectiveFadeTooFar", 0.1 );
    wait 2;
    setsaveddvar( "objectiveFadeTimeWaitOff", 2 );
    setsaveddvar( "objectiveFadeTooFar", 0.1 );
    wait 2;
    setsaveddvar( "objectiveFadeTimeWaitOff", var_0 );
    setsaveddvar( "objectiveFadeTooFar", var_1 );
}

_id_C20E()
{
    soundscripts\_snd::snd_message( "start_oval_office_checkpoint" );
    maps\dc_whitehouse_code::_id_B080();
    maps\dc_whitehouse_code::_id_CA03( level.team, common_scripts\utility::getstructarray( "oval_office_start_points", "targetname" ) );
    maps\dc_whitehouse_code::_id_AD8F();
    maps\dc_whitehouse_code::_id_B9CD();
    maps\dc_whitehouse_lighting::_id_CF0C( "dc_whitehouse_lawn" );
    level.foley thread _id_C99D();
    level._id_ACC0 thread _id_ABD3();
    level thread _id_CF96();
    maps\_utility::activate_trigger_with_targetname( "allies_lawn_trigger" );
    maps\_utility::activate_trigger_with_targetname( "whitehouse_approach_color_trigger" );
    common_scripts\utility::flag_set( "whitehouse_moveout" );
    common_scripts\utility::flag_set( "whitehouse_briefing_end" );
    common_scripts\utility::flag_set( "whitehouse_radio_start" );
    common_scripts\utility::flag_set( "whitehouse_entrance_clear" );
    level thread objectives();
    level thread _id_AC26();
    level thread _id_BBAE();
    level thread _id_C56A();
}

_id_C56A()
{
    level thread _id_C49E();
    level thread _id_C9EB();
    level thread _id_CFE9();
    common_scripts\utility::flag_wait( "oval_office_scene" );
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_wait( "oval_office_moveout" );
    maps\_utility::activate_trigger_with_targetname( "oval_office_exit_enemies_trigger" );
    maps\_utility::activate_trigger_with_targetname( "oval_office_exit_color_trigger_allies" );
    maps\_utility::battlechatter_on( "allies" );
}

_id_D598()
{
    common_scripts\utility::flag_wait( "oval_office_foley_dialogue" );
    level.foley maps\_utility::dialogue_queue( "dcwhite_fly_dunngetdoor" );
    wait 2.5;

    if ( !common_scripts\utility::flag( "oval_office_foley_inplace" ) )
    {
        level.foley maps\_utility::dialogue_queue( "dcwhite_fly_dunn" );
        wait 2;
        level.foley maps\_utility::dialogue_queue( "dcwhite_fly_thatswhy" );
    }
}

_id_C49E()
{
    var_0 = getent( "oval_office_window_closed", "targetname" );
    var_1 = getent( "oval_office_window_open", "targetname" );
    var_2 = getent( "oval_office_barrel_blocker", "targetname" );
    var_3 = getent( var_2.target, "targetname" );
    var_4 = common_scripts\utility::getstruct( var_3.target, "targetname" );
    var_2 linkto( var_3 );
    var_1 hide();
    common_scripts\utility::flag_wait( "oval_office_scene" );
    var_1 show();
    var_5 = getent( var_0.target, "targetname" );
    var_5 connectpaths();
    var_0 delete();
    var_5 delete();
    var_2 connectpaths();
    var_3.origin = var_4.origin;
}

_id_C9EB()
{
    var_0 = getent( "oval_office_animent", "targetname" );
    level.door = getent( "door", "targetname" );
    level.door.animname = "door";
    level.door maps\_utility::assign_animtree();
    var_0 maps\_anim::anim_first_frame_solo( level.door, "oval_office" );
    common_scripts\utility::flag_wait( "oval_office_door_open" );
    maps\_utility::activate_trigger_with_targetname( "oval_office_exit_color_trigger_heroes" );
    maps\_utility::autosave_by_name( "oval_office_door" );
    var_1 = getent( "oval_office_door_clip", "targetname" );
    var_1 notsolid();
    var_1 connectpaths();
    wait 4;
    common_scripts\utility::flag_set( "oval_office_moveout" );
}

_id_AEE3()
{
    level thread _id_C9F6();
    common_scripts\utility::flag_wait( "whitehouse_briefing_end" );
    common_scripts\utility::flag_wait( "whitehouse_entrance_init" );
    wait 4;
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_punchthrough" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_machineguns" );
    level thread _id_CF96();
}

_id_CF96()
{
    common_scripts\utility::flag_wait( "whitehouse_entrance_clear" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_ramirezgo" );
    common_scripts\utility::flag_wait( "whitehouse_2min" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_flattenthecity" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_lessthantwomins" );
    common_scripts\utility::flag_wait( "whitehouse_90sec" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_90seconds" );
    common_scripts\utility::flag_wait( "whitehouse_1min" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_60seconds" );
    common_scripts\utility::flag_wait( "whitehouse_30sec" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_30seconds" );
}

_id_AF22( var_0 )
{
    common_scripts\utility::flag_waitopen( "broadcast" );
    common_scripts\utility::flag_set( "broadcast" );
    var_1 = sortbydistance( level._id_B49E, level.player.origin );
    var_2 = 3;
    var_3 = [];
    var_4 = undefined;

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_6 = abs( level.player geteye()[2] - var_1[var_5].origin[2] );

        if ( var_6 > 150 )
            continue;

        var_4 = var_1[var_5];
        var_7 = var_0 + "_" + var_4.script_index;
        var_4 maps\dc_whitehouse_aud::play_speaker_vo( var_7 );
        var_3[var_3.size] = var_4;
        var_2--;

        if ( !var_2 )
            break;
    }

    var_8 = sortbydistance( level.ext_door_radio_array, level.player.origin );

    for ( var_5 = 0; var_5 < 6; var_5++ )
        var_8[var_5] playsound( var_0 + "_int_3d_door_ext" );

    foreach ( var_4 in var_3 )
        var_4 maps\_utility::add_wait( maps\_utility::waittill_msg, "sounddone" );

    maps\_utility::do_wait();
    common_scripts\utility::flag_clear( "broadcast" );
}

_id_BBAE()
{
    level endon( "broadcast_terminate" );
    common_scripts\utility::flag_wait( "whitehouse_radio_start" );

    for (;;)
    {
        common_scripts\utility::flag_clear( "broadcast_end" );
        common_scripts\utility::flag_waitopen( "broadcast_pause" );
        _id_AF22( "dcemp_fp1_hammerdown" );
        common_scripts\utility::flag_waitopen( "broadcast_pause" );
        _id_AF22( "dcemp_fp1_highvalue" );
        common_scripts\utility::flag_waitopen( "broadcast_pause" );
        _id_AF22( "dcemp_fp1_greenflares" );
        common_scripts\utility::flag_waitopen( "broadcast_pause" );
        _id_AF22( "dcemp_fp1_willabort" );
        common_scripts\utility::flag_set( "broadcast_end" );
        wait 0.05;
    }
}

_id_AD6D()
{
    self waittill( "trigger" );

    if ( self.script_index == level._id_ABB1 )
        common_scripts\utility::flag_set( "countdown" );
}

_id_D1BC()
{
    level endon( "countdown" );
    wait 30;
    common_scripts\utility::flag_set( "countdown" );
}

_id_AC26()
{
    level endon( "whitehouse_hammerdown" );
    level._id_B49E = getentarray( "radio_origin", "targetname" );
    level.ext_door_radio_array = getentarray( "ext_door_radio_origin", "targetname" );
    common_scripts\utility::flag_wait( "whitehouse_radio_start" );
    level._id_ABB1 = 0;
    var_0 = getentarray( "countdown_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_AD6D );
    var_1 = [];
    var_1[0] = "dcemp_fp1_2minutes";
    var_1[1] = "dcemp_fp1_90secs";
    var_1[2] = "dcemp_fp1_1minute";
    var_1[3] = "dcemp_fp1_30secs";
    var_2 = [];
    var_2[0] = "whitehouse_2min";
    var_2[1] = "whitehouse_90sec";
    var_2[2] = "whitehouse_1min";
    var_2[3] = "whitehouse_30sec";
    common_scripts\utility::flag_wait( "countdown_start" );
    common_scripts\utility::flag_set( "whitehouse_interior" );
    var_3 = gettime();

    for (;;)
    {
        level._id_ABB1++;
        common_scripts\utility::flag_set( "broadcast_pause" );
        common_scripts\utility::flag_waitopen( "broadcast" );
        level _id_AF22( var_1[level._id_ABB1 - 1] );
        var_3 = gettime();
        var_4 = 120 - ( level._id_ABB1 - 1 ) * 30;
        level._id_B18F = gettime() + var_4 * 1000;
        common_scripts\utility::flag_set( var_2[level._id_ABB1 - 1] );

        if ( level._id_ABB1 == 4 )
            break;

        level thread _id_D1BC();
        wait 6;
        common_scripts\utility::flag_clear( "broadcast_pause" );
        common_scripts\utility::flag_wait( "countdown" );
        common_scripts\utility::flag_clear( "countdown" );
    }

    common_scripts\utility::flag_set( "whitehouse_hammerdown_jets" );
    common_scripts\utility::flag_wait( "whitehouse_path_office_2" );
    level thread _id_AF22( "dcemp_fp1_beenauthorized" );
    common_scripts\utility::flag_wait( "whitehouse_hammerdown_jets_fly" );
    wait 7;
    common_scripts\utility::flag_set( "player_flare_abort" );
    level.player thread maps\_utility::notify_delay( "drop_flare", 1.0 );
    level.player thread maps\_utility::notify_delay( "flare_lookup", 3.75 );
    level.player maps\_utility::radio_dialogue( "dcemp_fp1_abortabort" );
    level.player maps\_utility::radio_dialogue( "dcemp_fp2_abortmission" );
    wait 4;
    maps\_utility::delaythread( 1.5, common_scripts\utility::flag_set, "whitehouse_wrapup" );
    level.player maps\_utility::radio_dialogue( "dcemp_fp3_rollingout" );
}

_id_C1CB()
{
    level endon( "whitehouse_hammerdown" );
    common_scripts\utility::flag_wait( "whitehouse_path_office_2" );
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
        var_2 thread whitehouse_kill_when_player_not_looking();

    var_4 = -100;

    if ( level._id_ACC0.origin[2] < var_4 && level.foley.origin[2] < var_4 )
    {
        level._id_ACC0 maps\_utility::disable_cqbwalk();
        level._id_ACC0.neverenablecqb = 1;
        level.foley maps\_utility::disable_cqbwalk();
        level.foley.neverenablecqb = 1;
    }

    maps\_utility::activate_trigger_with_targetname( "hammer_down_jet_safe_trigger" );
    maps\_utility::activate_trigger_with_targetname( "flare_ai_color_trigger" );
    wait 18;
    maps\_utility::activate_trigger_with_targetname( "h2_jet_trigger_a" );
    wait 2;
    maps\_utility::activate_trigger_with_targetname( "h2_jet_trigger_b" );
}

whitehouse_kill_when_player_not_looking()
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    var_0 = 65536;

    while ( maps\_utility::_id_D325( self.origin + ( 0.0, 0.0, 48.0 ), undefined, 1 ) || distancesquared( level.player.origin, self.origin ) <= var_0 )
        waitframe();

    self.diequietly = 1;
    self kill();
}

_id_D2A0()
{
    level endon( "whitehouse_path_roof" );
    common_scripts\utility::flag_wait( "whitehouse_30sec" );
    wait 30;
    level thread _id_D447();
}

_id_D447()
{
    common_scripts\utility::flag_set( "whitehouse_hammerdown" );
    thread maps\dc_whitehouse_aud::aud_mission_failed_jet_flyby();
    _id_AF22( "dcemp_fp1_bombsaway" );
    wait 1;
    common_scripts\_exploder::exploder( "carpetbomb" );
    earthquake( 0.1, 1, level.player.origin, 512 );
    wait 0.5;
    earthquake( 0.2, 1, level.player.origin, 512 );
    wait 0.5;
    earthquake( 0.4, 1, level.player.origin, 512 );
    wait 0.5;
    earthquake( 0.6, 3, level.player.origin, 512 );
    wait 0.75;
    playfx( level._effect["carpet_bomb_explosion_player"], level.player.origin );
    level.player playsound( "explo_metal_rand" );
    wait 0.5;
    level.foley maps\_utility::stop_magic_bullet_shield();
    level.foley kill();
    level._id_ACC0 maps\_utility::stop_magic_bullet_shield();
    level._id_ACC0 kill();

    if ( isdefined( level._id_AF81 ) )
    {
        level._id_AF81 maps\_utility::stop_magic_bullet_shield();
        level._id_AF81 kill();
    }

    var_0 = common_scripts\utility::ter_op( level.player getstance() == "stand", "h2_wpn_death_stand_explosion", "h2_wpn_death_crouch_explosion" );
    level.player _meth_85A8( var_0 );
    waittillframeend;
    level.player kill();
    waittillframeend;
    setdvar( "ui_deadquote", &"DC_WHITEHOUSE_FLARE_DEADQUOTE" );
}

_id_C9F6()
{
    level endon( "whitehouse_entrance_init" );
    common_scripts\utility::flag_wait( "whitehouse_briefing_end" );

    for (;;)
    {
        wait 30;
        level.foley maps\_utility::dialogue_queue( "dcemp_fly_workyourwayleft" );
        wait 15;
        level.foley maps\_utility::dialogue_queue( "dcemp_fly_ramirezgo" );
        wait 20;
        level.foley maps\_utility::dialogue_queue( "dcemp_fly_takeleftflank" );
        wait 15;
    }
}

_id_BE52()
{
    if ( maps\_utility::is_hero() )
        return;

    self endon( "death" );
    self.ignoreme = 1;
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( "whitehouse_moveout" );
    self.ignoreme = 0;
    self.ignoreall = 0;
}

_id_AB69( var_0 )
{
    common_scripts\utility::flag_set( "whitehouse_briefing_start" );
    var_1 = [];
    var_1[0] = level.foley;
    var_1[1] = level._id_C19E;
    var_0 notify( "stop_marshall_idle" );
    var_0 maps\_anim::anim_single( var_1, "DCemp_whitehouse_briefing" );
    common_scripts\utility::flag_set( "whitehouse_briefing_end" );
    level._id_C19E.ignoreall = 0;
    level._id_C19E allowedstances( "crouch", "stand" );
}

_id_C99D()
{
    thread _id_B751();
    thread _id_BDB1();
    thread _id_CBB6();
    thread _id_C23B();
    thread _id_CBD3();
}

_id_B751()
{
    common_scripts\utility::flag_wait( "whitehouse_init" );
    self.neverenablecqb = 1;
    maps\_utility::disable_cqbwalk();
    maps\_utility::disable_ai_color();
    self.ignoreme = 1;
    self.ignoreall = 1;
    wait 1;
    var_0 = getnode( "foley_briefing_approach_node", "targetname" );
    self.goalradius = var_0.radius;
    self setgoalnode( var_0 );
    self waittill( "goal" );
    var_1 = getent( "whitehouse_briefing_ent", "targetname" );
    var_1 maps\_anim::anim_reach_solo( self, "DCemp_whitehouse_briefing" );
    level thread _id_AB69( var_1 );
}

_id_BDB1()
{
    common_scripts\utility::flag_wait( "whitehouse_briefing_end" );
    maps\_utility::enable_ai_color();
    self.neverenablecqb = undefined;
    self.ignoreme = 0;
    self.ignoreall = 0;
}

_id_CBB6()
{
    common_scripts\utility::flag_wait( "oval_office_scene" );
    var_0 = 0;

    if ( !common_scripts\utility::flag( "whitehouse_briefing_end" ) )
    {
        common_scripts\utility::flag_wait( "whitehouse_briefing_end" );
        wait 1.0;
        var_0 = 1;
    }

    if ( distance( level.player.origin, level.foley.origin ) > 500 )
    {
        var_1 = common_scripts\utility::getstruct( "oval_office_foley_teleport", "targetname" );
        level.foley forceteleport( var_1.origin, var_1.angles );
    }

    self.neverenablecqb = 1;
    maps\_utility::disable_cqbwalk();
    self._id_CE92 = "run";
    maps\_utility::disable_ai_color();
    var_2 = getent( "oval_office_animent", "targetname" );

    if ( var_0 )
        var_2 maps\_anim::_id_B9B2( self, "oval_office_in" );
    else
        var_2 maps\_anim::anim_reach_solo( self, "oval_office_in" );

    var_2 maps\_anim::anim_single_solo( self, "oval_office_in" );
    self.neverenablecqb = 0;
    maps\_utility::enable_cqbwalk();
    self._id_CE92 = undefined;
    common_scripts\utility::flag_set( "oval_office_foley_ready" );

    if ( !common_scripts\utility::flag( "oval_office_dunn_ready" ) )
    {
        var_2 thread maps\_anim::anim_loop_solo( self, "oval_office_idle", "stop_foley_loop" );
        common_scripts\utility::flag_wait( "oval_office_dunn_ready" );
        var_2 notify( "stop_foley_loop" );
    }

    maps\_utility::enable_ai_color();
    var_2 maps\_anim::anim_single_solo( self, "oval_office" );
    common_scripts\utility::flag_set( "oval_office_done" );
    level.foley.always_use_delay_min = 1;
    level._id_ACC0.always_use_delay_min = 1;
}

_id_C23B()
{
    common_scripts\utility::flag_wait( "whitehouse_breached" );
    maps\_utility::disable_ai_color();
    var_0 = getent( "whitehouse_kitchen_door", "targetname" );
    var_0.parts = getentarray( var_0.target, "targetname" );
    common_scripts\utility::array_call( var_0.parts, ::linkto, var_0 );
    var_1 = getent( "whitehouse_kitchen_kick", "targetname" );
    var_1 maps\_anim::anim_generic_reach_and_arrive( level.foley, "doorburst_wave" );
    var_1 thread maps\_anim::anim_generic_gravity( level.foley, "doorburst_wave" );
    var_0 thread maps\dc_whitehouse_code::_id_D207();
    level.foley maps\_utility::delaythread( 1, maps\_utility::play_sound_on_entity, "dcburn_mcy_moveupgogo" );
    common_scripts\utility::flag_set( "whitehouse_kitchen_open" );
    maps\_utility::enable_heat_behavior( 1 );
    level.foley.always_use_delay_min = undefined;
    level._id_ACC0.always_use_delay_min = undefined;
    var_2 = getnode( "foley_wh_path", "targetname" );
    thread maps\_spawner::go_to_node( var_2 );
    self.neverenablecqb = undefined;
    maps\_utility::enable_cqbwalk();
    self.ignoreme = 0;
    self.ignoreall = 0;
    maps\_utility::set_ignoresuppression( 1 );
    maps\_utility::set_fixednode_false();
    common_scripts\utility::flag_wait( "whitehouse_path_elevator" );
    maps\_utility::set_ignoresuppression( 0 );
    maps\_utility::set_fixednode_true();
}

_id_CBD3()
{
    common_scripts\utility::flag_wait( "whitehouse_hammerdown_jets_safe" );
    self.neverenablecqb = 1;
    maps\_utility::disable_cqbwalk();
    maps\_utility::disable_heat_behavior();
    self pushplayer( 1 );
}

_id_ABD3()
{
    self.ignoreme = 1;
    self.ignoreall = 1;
    wait 0.8;
    thread _id_BF0C();
    thread _id_AAE8();
    thread _id_B588();
    thread _id_ACF5();
}

_id_BF0C()
{
    common_scripts\utility::flag_wait( "whitehouse_moveout" );
    self.ignoreme = 0;
    self.ignoreall = 0;
}

_id_AAE8()
{
    common_scripts\utility::flag_wait( "whitehouse_entrance_clear" );
    maps\_utility::disable_ai_color();
    maps\_utility::set_goal_node_targetname( "whitehouse_entrance_dunn_node" );
    common_scripts\utility::flag_wait( "oval_office_scene" );
    self.neverenablecqb = undefined;
    maps\_utility::enable_cqbwalk();
    var_0 = common_scripts\utility::getstruct( "oval_office_dune_start", "targetname" );
    self forceteleport( var_0.origin, var_0.angles );
    var_1 = getent( "oval_office_animent", "targetname" );
    level thread _id_B23E( var_1 );
    maps\_utility::walkdist_zero();
    var_1 maps\_anim::anim_reach_solo( self, "oval_office_in" );
    var_1 maps\_anim::anim_single_solo( self, "oval_office_in" );
    common_scripts\utility::flag_set( "oval_office_dunn_ready" );

    if ( !common_scripts\utility::flag( "oval_office_foley_ready" ) )
    {
        var_1 thread maps\_anim::anim_loop_solo( self, "oval_office_idle", "stop_dunn_loop" );
        common_scripts\utility::flag_wait( "oval_office_foley_ready" );
        var_1 notify( "stop_dunn_loop" );
    }

    var_2 = [];
    var_2[0] = self;
    var_2[1] = level._id_D264;
    var_2[2] = level.door;
    maps\_utility::enable_ai_color();
    var_1 maps\_anim::anim_single( var_2, "oval_office", undefined );
    maps\_utility::walkdist_reset();
}

_id_B23E( var_0 )
{
    var_1 = sortbydistance( getaiarray( "axis" ), var_0.origin );

    for ( var_2 = 0; var_2 < var_1.size && var_2 < 3; var_2++ )
        var_1[var_2] kill( level._id_ACC0.origin );
}

_id_CFE9()
{
    var_0 = getent( "oval_office_animent", "targetname" );
    level._id_D264 = maps\_utility::spawn_anim_model( "painting", var_0.origin );
    var_0 maps\_anim::anim_first_frame_solo( level._id_D264, "oval_office" );
}

_id_B588()
{
    common_scripts\utility::flag_wait( "whitehouse_breached" );
    maps\_utility::disable_ai_color();
    var_0 = getnode( "dunn_wh_path", "targetname" );
    thread maps\_spawner::go_to_node( var_0 );
    common_scripts\utility::flag_wait( "whitehouse_path_elevator" );
    maps\_utility::enable_heat_behavior( 1 );
    common_scripts\utility::flag_wait( "whitehouse_hammerdown_jets_safe" );
    self pushplayer( 1 );
}

_id_ACF5()
{
    common_scripts\utility::flag_wait( "whitehouse_hammerdown_jets_safe" );
    self.neverenablecqb = 1;
    maps\_utility::disable_cqbwalk();
    maps\_utility::disable_heat_behavior();
}

_id_D52B()
{
    self endon( "death" );
    self.animname = "marshall";
    self.ignoreme = 1;
    self.ignoreall = 1;
    level._id_C19E = self;
    thread maps\_utility::magic_bullet_shield();
    thread returnguntomarshall();
    // codescripts\character::setheadmodel( "head_us_army_g" );
    character\gfl\character_gfl_commander::main();
    self allowedstances( "crouch" );
    var_0 = getent( "whitehouse_briefing_ent", "targetname" );
    self attach( "weapon_binocular", "tag_inhand" );
    var_0 maps\_anim::anim_single_solo( self, "dcw_briefing_marshall_moremen" );

    if ( !common_scripts\utility::flag( "whitehouse_briefing_start" ) )
        var_0 thread maps\_anim::anim_loop_solo( self, "DCemp_whitehouse_briefing_idle", "stop_marshall_idle" );

    common_scripts\utility::flag_wait( "whitehouse_briefing_end" );
    common_scripts\utility::flag_wait( "whitehouse_spotlight" );
    maps\_utility::stop_magic_bullet_shield();
    self delete();
}

dropbinocular( var_0 )
{
    var_0 detach( "weapon_binocular", "TAG_INHAND" );
    var_1 = var_0 gettagorigin( "TAG_INHAND" );
    var_2 = spawn( "script_model", var_1 );
    var_2 setmodel( "weapon_binocular" );
}

returnguntomarshall()
{
    var_0 = getent( "marshall_gun", "targetname" );
    maps\_utility::forceuseweapon( "scar_h_reflex", "primary" );
    maps\_utility::gun_remove();
    common_scripts\utility::flag_wait( "marshallTakeBackWeapon" );
    var_0 delete();
    maps\_utility::gun_recall();
}

_id_B78A()
{
    common_scripts\utility::flag_wait( "whitehouse_entrance_moveup" );
    level thread maps\dc_whitehouse_code::_id_A98A();
    common_scripts\utility::flag_wait( "whitehouse_entrance_init" );
    maps\_utility::autosave_by_name( "entrance" );
    common_scripts\utility::flag_wait( "countdown_start" );
    maps\_utility::autosave_by_name( "countdown_started" );
    common_scripts\utility::flag_wait( "whitehouse_breached" );
    maps\_utility::activate_trigger_with_targetname( "drone_war_trigger" );
    common_scripts\utility::flag_wait( "whitehouse_kitchen_open" );
    _id_C013();
}

_id_C013()
{
    maps\_utility::set_group_advance_to_enemy_parameters( 45, 1 );
    maps\_utility::reset_group_advance_to_enemy_timer( "axis" );
    level thread _id_C1CB();
    level thread _id_B5AC();
    setsaveddvar( "ai_friendlysuppression", 0 );
    setsaveddvar( "ai_friendlyfireblockduration", 0 );
    common_scripts\utility::flag_wait( "whitehouse_path_elevator" );
    var_0 = ( level._id_B18F - gettime() ) / 1000;

    if ( var_0 > 70 )
        maps\_utility::autosave_by_name( "whitehouse_parlor" );

    common_scripts\utility::flag_wait( "whitehouse_chandelier" );
    var_1 = getent( "chandelier_grenade_source", "targetname" );
    var_2 = getent( var_1.target, "targetname" );
    magicgrenade( "fraggrenade", var_1.origin, var_2.origin, 1.5 );
    common_scripts\utility::flag_wait( "whitehouse_path_stairs" );
    maps\_utility::battlechatter_off( "allies" );
}

_id_ACBD()
{
    self endon( "death" );

    if ( !isdefined( level._id_C11F ) )
        level._id_C11F = [];

    level._id_C11F[level._id_C11F.size] = self;
    self.health = 10000;
    common_scripts\utility::flag_wait( "whitehouse_silhouette_ready" );

    if ( isdefined( self.script_animation ) )
        self.deathanim = level._id_A81B[self.script_animation];

    self.health = 200;
}

_id_C39D()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "whitehouse_path_roof" );
    wait(randomfloat( 5 ));
    self delete();
}

_id_BACD()
{
    soundscripts\_snd::snd_message( "start_flare_checkpoint" );
    maps\dc_whitehouse_code::_id_B080();
    maps\dc_whitehouse_code::_id_CA03( level.team, common_scripts\utility::getstructarray( "flare_start_points", "targetname" ) );
    maps\dc_whitehouse_code::_id_AD8F();
    thread maps\_utility::set_ambient( "dcemp_dry" );
    maps\dc_whitehouse_code::_id_B9CD();
    maps\dc_whitehouse_lighting::_id_CF0C( "dc_whitehouse_interior" );
    level._id_B18F = gettime();
    level thread _id_C013();
    level thread _id_AC26();
    common_scripts\utility::flag_set( "whitehouse_path_elevator" );
    common_scripts\utility::flag_set( "whitehouse_chandelier" );
    common_scripts\utility::flag_set( "whitehouse_radio_start" );
    common_scripts\utility::flag_set( "whitehouse_breached" );
    wait 0.1;
    level._id_ABB1 = 2;
    common_scripts\utility::flag_set( "whitehouse_radio_done" );
    common_scripts\utility::flag_set( "countdown_start" );
    common_scripts\utility::flag_clear( "broadcast" );
    level.foley thread _id_CBD3();
    level._id_ACC0 thread _id_ACF5();
    var_0 = getnode( "foley_flare_start", "script_noteworthy" );
    level.foley thread maps\_spawner::go_to_node( var_0 );
    var_0 = getnode( "dunn_flare_start", "script_noteworthy" );
    level._id_ACC0 thread maps\_spawner::go_to_node( var_0 );
    level thread objectives();
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::music_play( "mus_dc_whitehouse_endrun", 1 );
    soundscripts\_snd::snd_message( "start_endrun_mix" );
}

_id_B5AC()
{
    level thread _id_B55F();
    maps\_utility::array_spawn_function_noteworthy( "whitehouse_flare_guy", ::_id_BC98 );
    maps\_utility::array_spawn_function_noteworthy( "blind_enemies", maps\dc_whitehouse_code::_id_B8F4 );
    maps\_utility::array_spawn_function_noteworthy( "whitehouse_flare_breach_guy", ::_id_CED5 );
    thread dunnending();
    level.player thread _id_C03D();
    level thread _id_B8C0();
    common_scripts\utility::flag_wait( "whitehouse_flare_run" );
    common_scripts\_exploder::exploder( "roof_flares" );
}

dunnending()
{
    var_0 = getent( "flare_scene_upper_animent", "targetname" );
    common_scripts\utility::flag_wait( "whitehouse_path_roof" );
    level._id_ACC0 notify( "stop_going_to_node" );
    var_0 maps\_anim::anim_reach_solo( level._id_ACC0, "ending_dialogue_in" );
    var_0 maps\_anim::anim_single_solo( level._id_ACC0, "ending_dialogue_in" );
    var_0 thread maps\_anim::anim_loop_solo( level._id_ACC0, "ending_dialogue_idle", "dunn_stop_loop" );
    common_scripts\utility::flag_wait( "start_ending_dialog" );
    var_0 notify( "dunn_stop_loop" );
    var_0 maps\_anim::anim_single_solo( level._id_ACC0, "ending_dialogue_out" );
}

_id_B8C0()
{
    level endon( "whitehouse_hammerdown" );
    common_scripts\utility::flag_wait( "whitehouse_flare_run" );
    wait 1.5;
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_gettoroof" );
    common_scripts\utility::flag_wait( "whitehouse_hammerdown_jets_fly" );
    wait 2;
    common_scripts\utility::flag_set( "player_flare" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_useyourflares" );
    common_scripts\utility::flag_wait( "whitehouse_wrapup" );
    level._id_AF81 maps\_utility::dialogue_queue( "dcemp_ar1_moscow" );
    wait 5.3;
    level._id_AF81 maps\_utility::dialogue_queue( "dcwhite_ar1_huah" );
    level._id_ACC0 setlookatentity();
    common_scripts\utility::flag_set( "whitehouse_completed" );
    level.foley maps\_utility::dialogue_queue( "dcemp_fly_timeisright" );
}

_id_B55F()
{
    common_scripts\utility::flag_wait( "whitehouse_flare_breach" );
    common_scripts\_exploder::exploder( "flare_breach" );
    earthquake( 0.3, 1, ( -2011.0, 8295.5, 199.5 ), 5000 );
    level.player playrumblelooponentity( "grenade_rumble" );
    maps\dc_whitehouse_aud::flare_breach_debris_snd();
}

_id_BC98()
{
    self endon( "death" );
    maps\_utility::disable_arrivals();
    maps\_utility::disable_exits();
    maps\_utility::disable_surprise();
    maps\_utility::disable_turnanims();
    level._id_AF81 = self;
    common_scripts\utility::flag_set( "whitehouse_flare_breach" );
    self notify( "stop_going_to_node" );
    maps\_utility::magic_bullet_shield();
    self.ignoreme = 1;
    self.animname = "flare_guy";
    maps\_utility::set_run_anim( "whitehouse_ending_runuphill" );
    wait 0.1;
    var_0 = getent( "ramp_flare_animent", "targetname" );
    var_0 thread maps\_anim::anim_loop_solo( self, "dcemp_flare_reshoot_start_idle" );
    common_scripts\utility::flag_wait( "whitehouse_path_office" );
    self.a.movement = "run";
    level.player thread _id_C325();
    self.neverenablecqb = 1;
    maps\_utility::disable_cqbwalk();
    var_0 notify( "stop_loop" );
    common_scripts\utility::flag_set( "music_cue_endrun_ending" );
    var_0 thread maps\_anim::anim_single_solo_run( self, "dcemp_flare_reshoot_start" );
    wait 4;

    if ( !common_scripts\utility::flag( "whitehouse_flare_run" ) || !common_scripts\utility::flag( "player_looking_at_flareguy" ) )
    {
        maps\_utility::anim_stopanimscripted();
        var_0 maps\_anim::anim_first_frame_solo( self, "dcemp_flare_reshoot_start_short" );
        common_scripts\utility::flag_wait( "player_looking_at_flareguy" );
        level notify( "flare_spotted" );
        var_0 maps\_anim::anim_single_solo_run( self, "dcemp_flare_reshoot_start_short" );
    }
    else
    {
        level notify( "flare_spotted" );
        var_0 waittill( "dcemp_flare_reshoot_start" );
    }

    var_0 = getent( "flare_scene_upper_animent", "targetname" );
    var_0 maps\_anim::anim_reach_solo( self, "dcemp_flare_reshoot_end" );

    if ( !common_scripts\utility::flag( "whitehouse_path_roof" ) )
    {
        var_0 maps\_anim::anim_first_frame_solo( self, "dcemp_flare_reshoot_end" );
        common_scripts\utility::flag_wait( "whitehouse_path_roof" );
    }

    common_scripts\utility::flag_set( "whitehouse_hammerdown_jets_fly" );
    common_scripts\utility::flag_set( "whitehouse_hammerdown_jets_safe" );
    common_scripts\utility::flag_set( "music_cue_endrun_ending" );
    thread maps\_utility::play_sound_on_tag_endon_death( "scn_dcwhite_npc_flare_end", "J_Wrist_RI" );
    var_0 maps\_anim::anim_single_solo( self, "dcemp_flare_reshoot_end" );
    maps\_anim::anim_loop_solo( self, "dcemp_flare_idle" );
}

_id_C325()
{
    level endon( "flareguy_flare_popped" );
    level endon( "flare_spotted" );
    level._id_AF81 endon( "death" );

    for (;;)
    {
        if ( maps\_utility::player_looking_at( level._id_AF81 geteye(), 0.75 ) )
            common_scripts\utility::flag_set( "player_looking_at_flareguy" );
        else if ( common_scripts\utility::flag( "flareguy_force" ) )
            common_scripts\utility::flag_set( "player_looking_at_flareguy" );
        else
            common_scripts\utility::flag_clear( "player_looking_at_flareguy" );

        wait 0.05;
    }
}

_id_CED5()
{
    self.neverenablecqb = 1;
    maps\_utility::disable_cqbwalk();

    if ( isdefined( self.script_parameters ) && self.script_parameters == "m240_acog" )
    {
        maps\_utility::gun_remove();
        maps\_utility::forceuseweapon( "m240_acog", "primary" );
    }
}

_id_C03D()
{
    common_scripts\utility::flag_wait( "player_flare" );
    thread maps\dc_whitehouse_code::_id_C660();
}
