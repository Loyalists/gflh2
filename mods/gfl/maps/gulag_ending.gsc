// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_AD05()
{
    level._id_D536 = getdvar( "player_sprintSpeedScale" );
    maps\_utility::add_start( "run", ::_id_AA26, "run", ::_id_A852 );
    maps\_utility::add_start( "cafe", ::_id_D1A2, "cafe", ::_id_B7B0 );
    maps\_utility::add_start( "evac", ::_id_CF62, "evac", ::_id_C18E );
    waittillframeend;
    var_0 = getentarray( "cafe_ceiling_chunk", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::self_delete );
    var_1 = getentarray( "cafe_ceiling_chunk_small", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::self_delete );
    var_2 = getentarray( "cafe_ceiling_pristine", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::self_delete );
    var_3 = getent( "cafeteria_hallway_rubble", "targetname" );
    var_3 thread maps\gulag_ending_code::_id_B0EA();
    maps\gulag_ending_anim::_id_BC6F();
    level._effect["breach_door"] = loadfx( "fx/explosions/breach_wall_concrete" );
    level._pipe_fx_time = 2.5;
    var_4 = getent( "hookup_rope_ent", "targetname" );

    if ( isdefined( var_4 ) )
        var_4 delete();

    common_scripts\utility::flag_init( "player_approaches_rescue_breach" );
    common_scripts\utility::flag_init( "intro_helis_go" );
    common_scripts\utility::flag_init( "player_near_tv" );
    common_scripts\utility::flag_init( "stop_tv_loop" );
    common_scripts\utility::flag_init( "f15s_spawn" );
    common_scripts\utility::flag_init( "anti_air_missiles_fire" );
    common_scripts\utility::flag_init( "aa_hit" );
    common_scripts\utility::flag_init( "f15s_attack" );
    common_scripts\utility::flag_init( "player_heli_uses_modified_yaw" );
    common_scripts\utility::flag_init( "intro_helis_spawned" );
    common_scripts\utility::flag_init( "player_lands" );
    common_scripts\utility::flag_init( "cell_door1" );
    common_scripts\utility::flag_init( "cell_door2" );
    common_scripts\utility::flag_init( "cell_door3" );
    common_scripts\utility::flag_init( "cell_door4" );
    common_scripts\utility::flag_init( "cell_door_weapons" );
    common_scripts\utility::flag_init( "access_control_room" );
    common_scripts\utility::flag_init( "going_in_hot" );
    common_scripts\utility::flag_init( "gulag_cell_doors_enabled" );
    common_scripts\utility::flag_init( "player_exited_bathroom" );
    common_scripts\utility::flag_init( "player_rappels_from_bathroom" );
    common_scripts\utility::flag_init( "rope_drops_now" );
    common_scripts\utility::flag_init( "cell_duty" );
    common_scripts\utility::flag_init( "cellblock_player_starts_rappel" );
    common_scripts\utility::flag_init( "bathroom_second_wave_trigger" );
    common_scripts\utility::flag_init( "player_died_to_cave_in" );
    common_scripts\utility::flag_init( "chase_brush_kill_volume_2_activates" );
    common_scripts\utility::flag_init( "match_up_for_final_room" );
    common_scripts\utility::flag_init( "rescue_begins" );
    common_scripts\utility::flag_init( "time_to_evac" );
    common_scripts\utility::flag_init( "enable_interior_fx" );
    common_scripts\utility::flag_init( "enable_endlog_fx" );
    common_scripts\utility::flag_init( "player_falls_down" );
    common_scripts\utility::flag_init( "player_evac" );
    common_scripts\utility::flag_init( "controlled_player_rumble" );
    common_scripts\utility::flag_init( "evac_begins" );
    common_scripts\utility::flag_init( "do_cafeteria_anims" );
    common_scripts\utility::flag_init( "cafeteria_lights_off" );
    precacheitem( "smoke_grenade_american" );
    precacheitem( "m4m203_reflex_arctic" );
    precacheitem( "f15_sam" );
    precacheitem( "sam" );
    precacheitem( "cobra_seeker" );
    precacheitem( "rpg_straight" );
    precacheitem( "cobra_Sidewinder" );
    precacheitem( "claymore" );
    precacheitem( "mp5_silencer_reflex" );
    precacheturret( "player_view_controller" );
    precacherumble( "heavy_1s" );
    precacherumble( "heavy_2s" );
    precacherumble( "heavy_3s" );
    precacherumble( "light_1s" );
    precacherumble( "light_2s" );
    precacherumble( "light_3s" );
    precacheitem( "m14_scoped_arctic" );
    precacheitem( "fraggrenade" );
    precacheitem( "flash_grenade" );
    precacheitem( "claymore" );
    precachemodel( "h1_cs_light_alarm_blue_on" );
    precachemodel( "h1_cs_light_alarm_on" );
    precacheitem( "m4m203_acog" );

    precachemodel( "h2_gfl_st_ar15_viewbody" );
    precachemodel( "h2_gfl_st_ar15_viewhands" );
    precachemodel( "h2_gfl_st_ar15_viewhands_player" );

    thread maps\gulag_ending_code::_id_C22A();
    var_5 = getentarray( "turnaround_trigger", "targetname" );
    common_scripts\utility::array_thread( var_5, maps\gulag_ending_code::_id_B622 );
    var_6 = getentarray( "ceiling_collapse", "targetname" );
    common_scripts\utility::array_thread( var_6, maps\gulag_ending_code::_id_C510 );
    var_7 = getent( "chase_brush", "targetname" );
    var_7 hide();
    var_7 connectpaths();
    var_8 = getent( "price_spawner", "targetname" );
    var_8 thread maps\_utility::add_spawn_function( maps\gulag_ending_code::_id_AE55 );
    var_9 = common_scripts\utility::getstruct( "set_friendly_endpoint", "targetname" );
    var_9 thread maps\gulag_ending_code::_id_CA95();
    maps\_utility::array_spawn_function_targetname( "endlog_redshirt_spawner", maps\gulag_ending_code::_id_AE17 );
    var_10 = getent( "ending_window_littlebird", "script_noteworthy" );
    var_10 maps\_utility::add_spawn_function( maps\gulag_ending_code::_id_B9E5 );
    var_11 = getentarray( "delete_tree", "targetname" );
    common_scripts\utility::array_thread( var_11, maps\gulag_ending_code::_id_BB13 );
    thread maps\gulag_ending_code::_id_B56C();
    common_scripts\utility::flag_wait( "rescue_begins" );
    var_12 = getent( "evac_rock", "targetname" );
    var_12 notsolid();
    thread maps\gulag_ending_code::_id_AEBC();
    maps\_utility::remove_global_spawn_function( "allies", maps\_utility::enable_cqbwalk );
    thread maps\gulag_ending_code::_id_B9A6();
    var_13 = getentarray( "trigger_damage", "targetname" );
    common_scripts\utility::array_thread( var_13, maps\gulag_ending_code::_id_D421 );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    common_scripts\utility::flag_wait( "escape_the_gulag" );
    var_14 = getentarray( "stumble_trigger", "targetname" );
    common_scripts\utility::array_thread( var_14, maps\gulag_ending_code::_id_A913 );
}

_id_AA26()
{
    common_scripts\utility::flag_set( "rescue_begins" );
    soundscripts\_snd::snd_message( "start_run_checkpoint" );
    maps\gulag_lighting::_id_B3E6( "gulag_hallways" );
    var_0 = [];
    var_1 = getent( "price_spawner", "targetname" );
    var_0[var_0.size] = var_1;
    var_1 = getent( "endlog_soap_spawner", "targetname" );
    var_0[var_0.size] = var_1;
    var_1 = getentarray( "endlog_redshirt_spawner", "targetname" )[0];
    var_0[var_0.size] = var_1;
    var_2 = maps\_utility::array_spawn( var_0 );
    var_3 = common_scripts\utility::getstruct( "ending_breach_org", "targetname" );
    level.player setorigin( var_3.origin );
    level.player setplayerangles( var_3.angles );
    maps\gulag_ending_code::_id_D5A3();
    var_3 thread maps\_anim::anim_single( var_2, "price_rescue" );
    wait 0.05;

    foreach ( var_5 in var_2 )
    {
        var_6 = var_5 maps\_utility::getanim( "price_rescue" );
        var_5 setanimtime( var_6, 0.75 );
    }
}

_id_A852()
{
    if ( level.script == "endlog" || level.start_point == "run" )
        wait 0.05;

    maps\gulag_ending_code::_id_D564();
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    thread maps\gulag_ending_code::_id_AAF1();
    var_0 = getentarray( "hillside_brushmodel", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 hide();

    var_4 = getentarray( "hillside_model", "targetname" );

    foreach ( var_2 in var_4 )
        var_2 hide();

    var_7 = common_scripts\utility::getstructarray( "friendly_escape_org", "targetname" );
    var_7 = maps\_utility::array_index_by_parameters( var_7 );
    var_8 = getaiarray( "allies" );
    var_9 = [];
    var_9["soap"] = ( 0.0, 1.0, 1.0 );
    var_9["price"] = ( 1.0, 0.501961, 0.0 );
    var_9["redshirt"] = ( 1.0, 0.0, 0.501961 );
    thread maps\gulag_ending_code::_id_BAF0( var_8 );

    foreach ( var_11 in var_8 )
        var_11 thread maps\gulag_ending_code::_id_B33D();

    thread maps\gulag_ending_code::_id_B0AB();
    thread maps\gulag_ending_code::_id_D408();
    common_scripts\utility::flag_init( "modify_ai_moveplaybackrate" );
    maps\_utility::delaythread( 11.5, common_scripts\utility::flag_set, "modify_ai_moveplaybackrate" );
    thread maps\gulag_ending_code::_id_C065();
    maps\_utility::activate_trigger_with_targetname( "friendly_escape_trigger" );
    maps\_utility::autosave_by_name( "run_autosave" );
    wait 1;
    var_13 = getent( "ending_window_littlebird", "script_noteworthy" );
    var_14 = common_scripts\utility::getstruct( var_13.target, "targetname" );
    var_13.origin = var_14.origin;
    common_scripts\utility::flag_wait( "there_is_chopper" );
    common_scripts\utility::flag_wait( "exit_collapses" );
    common_scripts\utility::noself_delaycall( 1.5, ::setsaveddvar, "player_sprintSpeedScale", level._id_D536 );
    setsaveddvar( "player_sprintUnlimited", 1 );
    common_scripts\utility::flag_set( "soap_speed_boost" );
    level._id_D57D = 1;
    maps\gulag_ending_code::_id_ABDA( 0.25, 4, level.price.origin, 5000 );
    thread maps\gulag_ending_code::_id_D2AB();
    wait 0.2;
    wait 1;
    level._id_D57D = 4;
    maps\gulag_ending_code::_id_D564();
    common_scripts\utility::flag_wait( "enter_final_room" );
    thread maps\gulag_ending_code::_id_C0ED();
}

_id_B4A1()
{
    var_0 = getent( "endlog_soap_spawner", "targetname" );
    var_1 = var_0 maps\_utility::spawn_ai();
    var_2 = getent( "price_spawner", "targetname" );
    var_3 = var_2 maps\_utility::spawn_ai();
    var_4 = getentarray( "endlog_redshirt_spawner", "targetname" );
    var_5 = var_4[0] maps\_utility::spawn_ai();
    var_6 = maps\_utility::spawn_anim_model( "player_rig" );
    var_7 = [];
    var_7[var_7.size] = var_1;
    var_7[var_7.size] = var_3;
    var_7[var_7.size] = var_5;
    var_7[var_7.size] = var_6;
    var_1.animname = "gulag_end_animatic_soap";
    var_3.animname = "gulag_end_animatic_price";
    var_5.animname = "gulag_end_animatic_soldier";
    var_6.animname = "player_rig";
    common_scripts\utility::create_dvar( "altview", 0 );

    if ( getdvarint( "altview" ) )
    {
        level.player setorigin( ( -4594.0, -765.0, 180.0 ) );
        level.player setplayerangles( ( -21.0, -88.0, 0.0 ) );
    }
    else
        level.player playerlinktoblend( var_6, "tag_player", 0, 0, 0 );

    level.player takeallweapons();
    var_8 = getent( "mound_scene_export", "targetname" );

    for (;;)
        var_8 maps\_anim::anim_single( var_7, "ending" );
}

_id_D1A2()
{
    soundscripts\_snd::snd_message( "start_cafeteria_checkpoint" );
    maps\gulag_lighting::_id_B3E6( "gulag_ending" );
    var_0 = common_scripts\utility::getstructarray( "start_cafe_friendly", "targetname" );
    var_1 = maps\_utility::array_index_by_parameters( var_0 );
    maps\gulag_ending_code::_id_B7C8( var_1 );
    var_2 = getaiarray( "allies" );

    foreach ( var_4 in var_2 )
        var_4 thread maps\gulag_ending_code::_id_B33D();

    var_6 = common_scripts\utility::getstruct( "start_cafe_player", "targetname" );
    level.player setorigin( var_6.origin );
    level.player setplayerangles( var_6.angles );
    maps\gulag_ending_code::_id_D5A3();
    level._id_A893 = getentarray( "cafe_table", "targetname" );
    common_scripts\utility::array_thread( level._id_A893, maps\gulag_ending_code::_id_CC20 );
    var_7 = common_scripts\utility::getstructarray( "cafe_table_org", "targetname" );
    common_scripts\utility::array_thread( var_7, maps\gulag_ending_code::_id_B3FA );
    var_8 = common_scripts\utility::getstructarray( "cafe_table_eq_org", "targetname" );
    common_scripts\utility::array_thread( var_8, maps\gulag_ending_code::_id_D147 );
    thread maps\gulag_ending_code::_id_C0ED();
    var_9 = getent( "hunted_swing_light", "targetname" );
}

_id_B7B0()
{
    maps\gulag_ending_code::_id_D564();
    level._id_D13B notify( "stop_going_to_node" );
    level.price notify( "stop_going_to_node" );
    level._id_B71B notify( "stop_going_to_node" );
    var_0 = [];
    var_0["soap"] = level._id_D13B;
    var_0["price"] = level.price;
    var_0["redshirt"] = level._id_B71B;
    var_0["chains"] = level._id_B5D9;

    foreach ( var_2 in var_0 )
    {
        var_2.grenadeawareness = 0;

        if ( !isdefined( var_2.magic_bullet_shield ) )
            var_2 thread maps\_utility::magic_bullet_shield();

        var_2.ignorerandombulletdamage = 1;
        var_2.attackeraccuracy = 0;
    }

    var_4 = [];
    var_4[var_4.size] = level.price;
    var_4[var_4.size] = level._id_B71B;
    var_5 = getent( "mound_scene_export", "targetname" );
    common_scripts\utility::flag_wait( "do_cafeteria_anims" );
    level notify( "cafeteria_sequence_begins" );

    foreach ( var_2 in var_0 )
        var_2.moveplaybackrate = 1;

    maps\gulag_ending_code::_id_A8A1();
    maps\_utility::delaythread( 1.5, maps\gulag_ending_code::_id_AEB0 );
    level.timer = gettime();

    for ( var_8 = 0; var_8 < 3; var_8++ )
        maps\_utility::delaythread( 4.7, common_scripts\_exploder::exploder, "end_scene_rock" );

    maps\_utility::delaythread( 4.75, common_scripts\_exploder::exploder, "end_scene_rock" );
    maps\_utility::delaythread( 4.85, common_scripts\_exploder::exploder, "end_scene_rock" );
    var_9 = getent( "cafeteria_scriptednode", "targetname" );
    var_9 thread maps\_anim::anim_single( var_0, "cafe_entrance" );
    wait 4.2;
    maps\gulag_ending_code::_id_ABDA( 0.25, 4, level.player.origin, 5000 );
    wait 0.05;
    wait 2;
    maps\_utility::delaythread( 1, common_scripts\utility::flag_set, "player_falls_down" );
    level._id_D13B maps\_utility::delaythread( 2, maps\_utility::dialogue_queue, "gulag_cmt_roachisdown" );
    level._id_D13B maps\_utility::delaythread( 3.1, maps\_utility::dialogue_queue, "gulag_cmt_roach" );
    wait 2;
    common_scripts\utility::flag_waitopen( "player_falls_down" );
}

_id_CF62()
{
    soundscripts\_snd::snd_message( "start_evac_checkpoint" );
    maps\gulag_lighting::_id_B3E6( "gulag_ending" );
    var_0 = getent( "price_spawner", "targetname" );
    var_0 maps\_utility::spawn_ai();
    var_0 = getent( "endlog_soap_spawner", "targetname" );
    var_0 maps\_utility::spawn_ai();
    var_0 = getentarray( "endlog_redshirt_spawner", "targetname" )[0];
    var_0 maps\_utility::spawn_ai();
}

_id_B9E3( var_0, var_1 )
{
    for (;;)
    {
        foreach ( var_3 in var_0 )
        {
            var_4 = var_3 maps\_utility::getanim( var_1 );
            var_5 = var_3 getanimtime( var_4 );
        }

        wait 0.05;
    }
}

_id_C530( var_0 )
{
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "player_uses_rig" );
    var_0["ending_rope1"] waittillmatch( "single anim", "switch_rope" );
    var_0["ending_rope1"] hide();
    var_0["ending_rope"] show();
}

_id_C18E()
{
    setsaveddvar( "ui_hidemap", 1 );
    var_0 = getent( "cafeteria_stagelight", "targetname" );
    var_0 thread maps\_utility::notify_delay( "staging_on", 1 );
    level.player setmovespeedscale( 1 );
    var_1 = getaiarray( "allies" );

    foreach ( var_3 in var_1 )
        var_3 maps\_utility::anim_stopanimscripted();

    common_scripts\utility::flag_set( "time_to_evac" );
    level.player setblurforplayer( 0, 1 );
    level.player playersetgroundreferenceent( undefined );
    level notify( "stop_cavein" );
    setsaveddvar( "g_friendlyNameDist", 0 );

    if ( level.start_point == "evac" )
        wait 0.05;

    level._id_BDC6 = 0.1;
    var_5 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_5.alpha = 1;
    soundscripts\_snd::snd_message( "start_evac_rock_falling_black_screen" );

    if ( isdefined( level.black_overlay ) )
        level.black_overlay.alpha = 0;

    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    wait 5.2;
    thread maps\gulag_ending_code::_id_A9C6();
    thread maps\gulag_ending_code::_id_A903();
    var_5 fadeovertime( 0.15 );
    var_5.alpha = 0;
    soundscripts\_snd::snd_message( "stop_evac_rock_falling_black_screen" );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "actionSlotsHide", 1 );
    var_6 = maps\_utility::spawn_anim_model( "player_rig" );
    var_7 = maps\_utility::spawn_anim_model( "player_rig" );
    var_7 hide();
    level.player_rig = var_6;
    var_8 = maps\_utility::spawn_anim_model( "player_carabiner" );
    var_9 = getent( "mound_scene_export", "targetname" );
    level._id_D13B maps\_utility::forceuseweapon( "m4m203_acog", "primary" );
    var_10 = [];
    var_10["price"] = level.price;
    var_10["redshirt"] = level._id_B71B;
    var_10["player_rig"] = var_6;
    var_10["strangle_chain"] = level._id_B5D9;
    var_11 = maps\_utility::spawn_anim_model( "rock" );
    var_11 hide();
    var_10["anim_rock"] = var_11;
    var_12 = maps\_utility::spawn_anim_model( "pavelow" );
    var_10["pavelow"] = var_12;
    var_13 = maps\_utility::spawn_anim_model( "ending_rope1" );
    var_14 = maps\_utility::spawn_anim_model( "ending_rope" );
    var_14 hide();
    var_10["ending_rope1"] = var_13;
    var_10["ending_rope"] = var_14;
    thread _id_C530( var_10 );
    var_10["ending_rope1"] makeusable();
    var_13 _meth_848A( level._id_D13B.origin );
    var_8 _meth_848A( level._id_D13B.origin );
    var_15 = getent( "evac_rock", "targetname" );
    var_15 maps\_utility::add_target_pivot();
    var_15 castshadows();
    var_15.pivot linkto( var_11, "body_animate", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_16 = 15;
    var_17 = 15;
    var_18 = 15;
    var_19 = 15;
    thread maps\_autosave::_autosave_game_now_nochecks();
    level.player playerlinktodelta( var_6, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player takeallweapons();
    common_scripts\_exploder::exploder( "bomb_exploder" );
    maps\_utility::delaythread( 20, common_scripts\_exploder::exploder, "evac_exploder" );
    var_9 maps\_anim::anim_first_frame_solo( var_7, "fly_away" );
    var_9 maps\_utility::delaythread( 20.16, maps\_anim::anim_single_solo, var_7, "fly_away" );
    var_20 = gettime();
    var_9 thread maps\_anim::anim_single( var_10, "evac" );
    var_9 thread maps\_anim::anim_single_solo( level._id_D13B, "evac" );
    common_scripts\utility::flag_set( "evac_begins" );
    maps\_utility::delaythread( 6.7, maps\_utility::radio_dialogue, "gulag_plp_seeflare" );
    level._id_D13B thread _id_C7CC();
    var_6 waittillmatch( "single anim", "end" );
    var_0 notify( "staging_off" );
    level.player unlink();
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    setsaveddvar( "ui_hidemap", 0 );
    setsaveddvar( "g_friendlyNameDist", 175 );
    thread maps\gulag_ending_code::_id_B231();
    var_21 = [];
    var_21["carabiner"] = var_8;
    var_21["rig"] = var_6;
    var_9 maps\_anim::anim_first_frame( var_21, "hookup" );
    var_6 hide();
    var_8 hide();
    var_22 = common_scripts\utility::spawn_tag_origin();
    var_22 linkto( var_7, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_23 = maps\_utility::getentwithflag( "player_uses_rig" );
    var_23 thread common_scripts\utility::_id_AE1E( level.player, &"GULAG_SPIE_HINT", &"GULAG_SPIE_HINT_PC", "trigger" );
    setsaveddvar( "hud_drawhud", 1 );
    common_scripts\utility::flag_wait( "player_uses_rig" );
    thread _id_C135();
    var_23 common_scripts\utility::trigger_off();
    soundscripts\_snd::snd_message( "start_evac_player" );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );

    if ( isdefined( level._id_D13B._id_CFCC ) )
        return;

    var_24 = gettime() - var_20;
    var_24 *= 0.001;
    var_25 = 0;

    if ( var_24 < 18 )
    {
        var_25 = 1;
        var_26 = 0.5;
        level.player playerlinktoblend( var_6, "tag_player", var_26, var_26 * 0.4, var_26 * 0.4 );
        maps\_utility::delaythread( var_26, ::_id_BCD3, var_22, var_6 );
        wait(var_26);
        level.player playerlinktodelta( var_6, "tag_player", 1, 0, 0, 0, 0, 1 );
        thread _id_D34E( var_9, var_21 );
    }
    else
    {
        var_26 = 0.5;
        level.player playerlinktoblend( var_7, "tag_player", var_26, var_26 * 0.4, var_26 * 0.4 );
        level.player common_scripts\utility::delaycall( var_26, ::playersetgroundreferenceent, var_22 );
        level.player common_scripts\utility::delaycall( var_26 + 0.05, ::playerlinktodelta, var_6, "tag_player", 1, 35, 10, 55, 15, 1 );
    }

    common_scripts\utility::flag_wait( "player_gets_pulled" );
    thread _id_CA6A();
    setsaveddvar( "g_friendlyNameDist", 0 );
    var_9 notify( "stop_loop" );
    level.player notify( "stop_opening_fov" );
    level.price common_scripts\utility::delaycall( 5.05, ::playsound, "gulag_pri_yes" );
    var_9 thread maps\_anim::anim_single_solo( var_6, "fly_away" );
    var_6 thread maps\_utility::play_sound_on_entity( "scn_gulag_evac_player_leaving" );
    thread _id_B237();
    thread maps\gulag_ending_code::_id_B05F();
    maps\_utility::delaythread( 3.0, maps\gulag_lighting::_id_B3E6, "gulag_rappel" );
    var_27 = var_6 maps\_utility::getanim( "fly_away" );
    soundscripts\_snd::snd_message( "final_explosion_mix" );
    wait 7.85;
    var_5 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_5.alpha = 1;
    maps\_utility::nextmission();
}

_id_C135()
{
    var_0 = _id_D397::_id_A97A( "gulag_clip_on_rope" );
    var_0 _id_D397::_id_BEA0( 0.85 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 2.25 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 5.6, 11, 1, 1 ) _id_D397::_id_B059( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 1.85 ) _id_D397::_id_C491( 12, 300, 6, 6 );
    var_0 _id_D397::_id_BEA0( 2.35 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 2.0 ) _id_D397::_id_D3C9( 1.0, 0.15, 0.15, 35, 10, 55, 15 ) _id_D397::_id_B48E();
    var_0 _id_D397::_id_BEA0( 3.2 ) _id_D397::_id_D3C9( 1.6, 0.25, 0.25, 10, 10, 55, 10 ) _id_D397::_id_B48E();
    var_0 _id_D397::_id_BEA0( 1.05 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 2.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BC26();
}

_id_CA6A()
{
    var_0 = _id_D397::_id_A97A( "gulag_helicopter_escape_pull" );
    var_0 _id_D397::_id_BEA0( 0.65 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 8.0 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_AC9F( 80, 1.0, 0 );
    var_0 _id_D397::_id_BEA0( 3.75 ) _id_D397::_id_A9EC( 2.65, 0 );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 12, 300, 16, 16 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 0.6 ) _id_D397::_id_C491( 1.0, 300, 2, 2 );
    var_0 _id_D397::_id_BEA0( 4.5 ) _id_D397::_id_C491( 1.0, 1200, 2, 2 );
    var_0 _id_D397::_id_BEA0( 8.0 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_D3C9( 0.5, 0.15, 0.15, 10, 10, 10, 10 ) _id_D397::_id_B48E();
    var_0 _id_D397::_id_BEA0( 3.65 ) _id_D397::_id_D3C9( 2.5, 0.8, 0.8, 10, 10, 45, 10 ) _id_D397::_id_B48E();
    var_0 _id_D397::_id_BC26();
}

_id_B237()
{
    wait 1;
    playrumbleonposition( "heavy_3s", level.player.origin );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player _meth_80B5( "light_1s" );
}

_id_B328( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "player_evac" );
    _id_CC7F( var_0, var_1 );
}

_id_CC7F( var_0, var_1 )
{
    level.player playerlinktoblend( var_0, "tag_player", var_1, var_1 * 0.4, var_1 * 0.4 );
    wait(var_1);
    var_2 = 18;
    level.player playerlinktodelta( var_0, "tag_player", var_2, var_2, var_2, var_2, 1 );
}

_id_BCD3( var_0, var_1 )
{
    level.player playersetgroundreferenceent( var_0 );
    wait 1;
    maps\_utility::open_up_fov( 0.5, var_1, "tag_player", 35, 10, 55, 15 );
}

_id_BA7D( var_0, var_1 )
{
    level.player playersetgroundreferenceent( var_0 );
}

_id_D34E( var_0, var_1 )
{
    if ( common_scripts\utility::flag( "player_gets_pulled" ) )
        return;

    level endon( "player_gets_pulled" );
    var_1["carabiner"] show();
    var_1["rig"] show();
    var_0 maps\_anim::anim_single( var_1, "hookup" );
    var_0 maps\_anim::anim_loop_solo( var_1["rig"], "idle" );
}

_id_C7CC()
{
    common_scripts\utility::flag_init( "player_gets_pulled" );
    self waittillmatch( "single anim", "player" );
    common_scripts\utility::flag_set( "player_gets_pulled" );
}

_id_B045()
{
    waittillframeend;
    var_0 = level.start_point;

    if ( maps\_utility::is_default_start() )
        return;

    maps\_utility::remove_global_spawn_function( "allies", maps\_utility::enable_cqbwalk );

    if ( var_0 == "rescue" )
        return;

    common_scripts\utility::flag_clear( "enable_interior_fx" );
    common_scripts\utility::flag_set( "rescue_begins" );
    common_scripts\utility::flag_set( "escape_the_gulag" );
    wait 0.05;
    disableforcedsunshadows();

    if ( level.script != "endlog" )
    {
        var_1 = getent( "gulag_endlog_destructibles", "script_noteworthy" );
        var_1 maps\_utility::activate_destructibles_in_volume();
        var_1 maps\_utility::activate_interactives_in_volume();
    }

    if ( var_0 == "run" )
        return;

    thread maps\gulag_ending_code::_id_AAF1();
    thread maps\gulag_ending_code::_id_D408();
    maps\gulag_ending_code::_id_BC41();
    common_scripts\utility::flag_set( "enter_final_room" );
    common_scripts\utility::flag_set( "exit_collapses" );
    common_scripts\utility::flag_set( "match_up_for_final_room" );
    common_scripts\utility::flag_set( "big_earthquake_hits" );
    wait 0.05;
    level.price maps\_utility::forceuseweapon( "ak47", "primary" );
    level notify( "skip_stumble_trigger_think" );

    if ( var_0 == "cafe" )
        return;

    level notify( "stop_minor_earthquakes" );
    level.player takeallweapons();
    common_scripts\utility::flag_set( "player_falls_down" );

    if ( var_0 == "evac" )
        return;
}
