// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::flag_init( "obj_heli_ride_complete" );
    common_scripts\utility::flag_init( "player_crash_done" );
    common_scripts\utility::flag_init( "obj_crash_site_given" );
    common_scripts\utility::flag_init( "obj_crash_site_complete" );
    common_scripts\utility::flag_init( "crash_actors_ready" );
    common_scripts\utility::flag_init( "crash_fade_up" );
    common_scripts\utility::flag_init( "crash_redshirt_speaks" );
    common_scripts\utility::flag_init( "macey_last_mag_dialogue" );
    common_scripts\utility::flag_init( "give_player_weapon" );
    common_scripts\utility::flag_init( "redshirt_headshot" );
    common_scripts\utility::flag_init( "player_ran_out_of_first_clip" );
    common_scripts\utility::flag_init( "macey_clip_to_player" );
    common_scripts\utility::flag_init( "macey_wont_throw_clip_to_player" );
    common_scripts\utility::flag_init( "macey_should_throw_clip_to_player" );
    common_scripts\utility::flag_init( "end_sequence_music" );
    common_scripts\utility::flag_init( "end_sequence_starting" );
    common_scripts\utility::flag_init( "friendly_02_injured" );
    common_scripts\utility::flag_init( "crash_cut_to_black" );
    common_scripts\utility::flag_init( "notetrack_player_upright" );
    common_scripts\utility::flag_init( "notetrack_player_raisehands" );
    common_scripts\utility::flag_init( "notetrack_player_lowerhands" );
    common_scripts\utility::flag_init( "emp_entity_cleanup_done" );
    common_scripts\utility::flag_init( "emp_back_from_whiteout" );
    common_scripts\utility::flag_init( "first_wave_done" );
    common_scripts\utility::flag_init( "can_talk_crashsite" );
    common_scripts\utility::flag_set( "can_talk_crashsite" );
    common_scripts\utility::flag_init( "emp_happening" );
    precacheshellshock( "dcburning" );
    precachemodel( "weapon_m4_clip" );
    precachemodel( "viewhands_player_us_army" );
    precacheturret( "heli_spotlight" );
    precachemodel( "weapon_m4" );
    precachemodel( "viewbody_us_army_injured" );
    precachemodel( "head_us_army_b" );

    precachemodel( "h2_gfl_ump9_viewbody" );
    precachemodel( "h2_gfl_ump9_viewhands" );
    precachemodel( "h2_gfl_ump9_viewhands_player" );

    _id_BC93();
    _id_ABAD();
    _id_D2EB();
    crash_script_model_anims();
    common_scripts\utility::array_thread( getvehiclenodearray( "plane_sound", "script_noteworthy" ), vehicle_scripts\_mig29::plane_sound_node );
    _id_B626::main();
    maps\dcburning_lighting::main();
}

_id_BFC4()
{
    maps\_utility::array_spawn_function_noteworthy( "axis_crash", ::_id_CB8A );
    thread _id_B0C4();
    thread _id_C6B2();
    thread _id_C386();
    thread _id_B658();
    thread _id_BAD1();
    thread _id_C20D();
    thread traffic_signal_animated();
}

player_crash_site_cinematic()
{
    waitframe();
    var_0 = _id_D397::_id_A97A( "crash_site_cinematic" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 2.8, -1, 8, 8 ) _id_D397::_id_CCA7( level.player._id_C309, "tag_dof" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 14.0 ) _id_D397::_id_C491( 4.5, -1, 8, 8 ) _id_D397::_id_CCA7( level.player._id_C309, "tag_dof" ) _id_D397::_id_AE01( 1 );
    var_0 _id_D397::_id_BEA0( 17.2 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_init", 1 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_play", 3 ) _id_D397::_id_A970( ::setsaveddvar, undefined, "ui_consciousnessVignetteDarkness", 0.2 );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 12.2 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 0.15 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.0, 0.0, 0.0, 2, 2, 1, 1 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 3.3 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 2.0, 0.9, 0.9, 5, 5, 3, 3 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 5.3 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 2.0, 0.9, 0.9, 2, 2, 1, 1 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 7.5 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.3, 0.6, 0.6, 10, 10, 7, 7 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 9.85 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.6, 0.8, 0.8, 2, 2, -5, 7 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 12.5 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.1, 1.0, 1.0, 10, 10, 7, 7 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 14.3 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.0, 0.5, 0.5, 0, 0, 0, 0 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( 55, 0.05, 0 );
    var_0 _id_D397::_id_BEA0( 0.1 ) _id_D397::_id_A9EC( 5.5, 0 );
    var_0 _id_D397::_id_BEA0( 9.65 ) _id_D397::_id_AC9F( 60, 2.1, 0 );
    var_0 _id_D397::_id_BEA0( 12.0 ) _id_D397::_id_A9EC( 2.65, 0 );
    var_0 _id_D397::_id_BEA0( 3.6 ) _id_D397::_id_B85E( 0.05, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 4.75 ) _id_D397::_id_B85E( 0.05, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 5.5 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 7.35 ) _id_D397::_id_B85E( 0.1, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 15.3 ) _id_D397::_id_B85E( 0.08, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 16.0 ) _id_D397::_id_B85E( 0.1, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BC26();
    setomnvar( "ui_consciousness_play", 0 );
}

_id_C386()
{
    var_0 = getent( "crash_chatter_org_left", "targetname" );
    var_1 = getent( "crash_chatter_org_right", "targetname" );
    common_scripts\utility::flag_wait( "crash_actors_ready" );
    maps\_utility::radio_dialogue( "dcburn_hqr_doyoucopy" );
    wait 1;
    maps\_utility::radio_dialogue( "dcburn_hqr_howcopy" );
    wait 1;
    var_0 common_scripts\utility::delaycall( 1.5, ::playsound, "dcburn_ar3_twomags" );
    level._id_C280 maps\_utility::dialogue_queue( "dcburn_cpd_target2" );
    wait 2;
    level._id_AC03 maps\_utility::dialogue_queue( "dcburn_mcy_talktome" );
    var_1 common_scripts\utility::delaycall( 0, ::playsound, "dcburn_ar4_watch3" );
    wait 1;
    level._id_C280 thread maps\_utility::dialogue_queue( "dcburn_cpd_target11" );
    common_scripts\utility::flag_wait( "crash_redshirt_speaks" );
    level._id_BBBD._id_C034 = common_scripts\utility::spawn_tag_origin();
    level._id_BBBD._id_C034.origin = level.player.origin;
    level._id_BBBD._id_C034 linkto( level.player );
    level._id_BBBD._id_C034 thread _id_C59B( "redshirt_headshot" );
    level._id_BBBD._id_C034 thread maps\_utility::play_sound_on_tag_endon_death( "dcburn_gr1_hangon", "tag_origin" );
    common_scripts\utility::flag_wait( "redshirt_headshot" );
    wait 1;
    var_0 common_scripts\utility::delaycall( 1, ::playsound, "dcburn_ar1_reloadingcover" );
    level._id_AC03 maps\_utility::dialogue_queue( "dcburn_mcy_wadesdown" );
    common_scripts\utility::flag_set( "obj_crash_site_given" );
    wait 2;
    var_1 common_scripts\utility::play_sound_in_space( "dcburn_ar2_mccordcovering" );
    wait 4;
    var_0 common_scripts\utility::delaycall( 0, ::playsound, "dcburn_ar2_lastmag" );
    common_scripts\utility::flag_wait( "macey_last_mag_dialogue" );
    level._id_AC03 maps\_utility::play_sound_on_entity( "dcburn_mcy_lastone" );
    wait 0.5;
    level._id_AC03 maps\_utility::dialogue_queue( "dcburn_mcy_ammocheck" );
    var_1 common_scripts\utility::delaycall( 0.3, ::playsound, "dcburn_ar4_imgood" );
    wait 1.5;
    level._id_C280 maps\_utility::dialogue_queue( "dcburn_cpd_toomany" );
    var_1 common_scripts\utility::play_sound_in_space( "dcburn_ar2_seanlast" );
    level._id_AC03 thread maps\_utility::dialogue_queue( "dcburn_mcy_soundoff" );
    common_scripts\utility::flag_wait( "end_sequence_starting" );
    var_0 = getent( "crash_chatter_org_left", "targetname" );
    var_1 = getent( "crash_chatter_org_right", "targetname" );
    var_1 common_scripts\utility::delaycall( 0, ::playsound, "dcburn_ar1_newtarget" );
    wait 1;
    wait 1;
    var_0 common_scripts\utility::delaycall( 0.6, ::playsound, "dcburn_ar2_gotitgotit" );
}

_id_C59B( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self ) )
        self delete();
}

_id_B0C4()
{
    level.player enableinvulnerability();
    level._id_AD0F = 1;
    level._id_C1BE = ( 0.0, 0.0, 0.0 );
    level._effect["mortar"]["dirt"] = loadfx( "fx/explosions/grenadeExp_dirt" );
    var_0 = getent( "crash_node", "targetname" );
    var_1 = _id_CEDB();
    common_scripts\utility::flag_wait( "player_crash_done" );

    if ( level.script == "dcburning" )
        thread maps\_utility::autosave_now( 1 );

    if ( level.script == "dc_burning" )
    {
        setsaveddvar( "sm_sunSampleSizeNear", 0.25 );
        setsaveddvar( "sm_sunShadowScale", 1 );
    }

    if ( level.script == "dc_burning" )
        maps\dcburning_lighting::_id_CA84( "dcburning_crash" );

    if ( getdvarint( "r_dcburning_culldist" ) == 1 )
    {
        level._id_C4E1 = _func_44();
        setculldist( 23000 );
    }

    maps\_utility::music_stop();

    if ( level.script == "dc_burning" )
    {
        common_scripts\utility::array_thread( level._id_CE63, common_scripts\utility::pauseeffect );
        common_scripts\utility::array_thread( level._id_D02D, common_scripts\utility::pauseeffect );
        common_scripts\utility::array_thread( level._id_AE31, common_scripts\utility::pauseeffect );
    }

    if ( !isdefined( level.black_overlay ) )
    {
        level.black_overlay = maps\_hud_util::create_client_overlay( "black", 1 );
        level.black_overlay.foreground = 0;
    }

    var_2 = [];
    level._id_AC03 = maps\_utility::spawn_targetname( "teamLeaderCrash", 1 );
    level._id_C280 = maps\_utility::spawn_targetname( "friendly02Crash", 1 );
    level._id_BBBD = maps\_utility::spawn_targetname( "friendly03Crash", 1 );
    // level._id_BBBD codescripts\character::setheadmodel( "head_us_army_b" );
    level._id_AC03 hide();
    level._id_C280 hide();
    level._id_BBBD hide();
    level._id_AC03.animname = "crash_leader";
    level._id_C280.animname = "crash_dunn";
    level._id_BBBD.animname = "crash_redshirt";
    level._id_AC03 thread _id_C238();
    level._id_C280 thread _id_C238();
    level._id_BBBD thread _id_C238();
    level._id_AC03 thread maps\_utility::magic_bullet_shield( 1 );
    level._id_C280 thread maps\_utility::magic_bullet_shield( 1 );
    level._id_AC03 maps\_utility::set_flavorbursts( 0 );
    level._id_C280 maps\_utility::set_flavorbursts( 0 );
    level._id_BBBD maps\_utility::set_flavorbursts( 0 );
    var_0 = getent( "crash_node", "targetname" );
    var_3 = maps\_utility::spawn_anim_model( "player_rig" );
    level.player._id_C309 = var_3;
    var_2[0] = var_3;
    var_2[1] = level._id_BBBD;
    level._id_CE77 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level._id_CE77 setmodel( "weapon_m4" );
    level._id_CE77 hidepart( "TAG_THERMAL_SCOPE" );
    level._id_CE77 hidepart( "TAG_FOREGRIP" );
    level._id_CE77 hidepart( "TAG_ACOG_2" );
    level._id_CE77 hidepart( "TAG_HEARTBEAT" );
    level._id_CE77 hidepart( "TAG_RED_DOT" );
    level._id_CE77 hidepart( "TAG_SHOTGUN" );
    level._id_CE77 hidepart( "TAG_SILENCER" );
    level._id_CE77 maps\_utility::assign_animtree( "weapon_m4" );
    var_2[2] = level._id_CE77;
    var_0 maps\_anim::anim_first_frame( var_2, "dcburning_BHrescue" );
    level.player freezecontrols( 1 );
    level.player playerlinktodelta( var_3, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    thread _id_B888( var_1["top_left"], var_1["bot_right"], var_3 );
    common_scripts\utility::flag_set( "crash_actors_ready" );
    wait 3;
    common_scripts\utility::flag_set( "obj_heli_ride_complete" );
    thread crash_remove_vehicles();
    wait 4;
    _id_B985( "dummy_spawner_axis_crash_flood" );
    var_4 = getentarray( "axis_crash_drones", "targetname" );
    thread _id_BD01( var_4, "axis_crash_drones" );
    common_scripts\utility::flag_set( "crash_fade_up" );

    if ( level.script == "dcburning" || level.script == "dcemp" )
        soundscripts\_snd::snd_message( "stop_heli_crash_black_screen" );

    maps\_utility::delaythread( 8, _id_D301::_id_AADA, 3 );
    level.black_overlay fadeovertime( 2 );
    level.black_overlay.alpha = 0;
    level._id_BBBD show();
    var_5 = maps\_utility::array_spawn( getentarray( "hostiles_drones_crash_site_01", "targetname" ) );
    level._id_BBBD.dropweapon = 0;
    level._id_BBBD.script_looping = 0;
    level._id_BBBD setcontents( 0 );
    level._id_BBBD.skipdeathanim = 1;
    level._id_BBBD.noragdoll = 1;
    level._id_BBBD.a.nodeath = 1;
    level._id_BBBD.no_ai = 1;
    var_0 thread maps\_anim::anim_single( var_2, "dcburning_BHrescue" );
    thread player_crash_site_cinematic();
    level._id_CE77 common_scripts\utility::delaycall( getanimlength( level._id_CE77 maps\_utility::getanim( "dcburning_BHrescue" ) ), ::delete );
    var_6 = [];
    var_6[0] = level._id_AC03;
    var_6[1] = level._id_C280;
    level._id_AC03 show();
    level._id_C280 show();
    var_0 maps\_anim::anim_single( var_6, "vehicle_cover" );
    common_scripts\utility::flag_set( "first_wave_done" );
    common_scripts\utility::flag_set( "macey_should_throw_clip_to_player" );
    thread _id_B57E();
    var_7 = getanimlength( level._id_AC03 maps\_utility::getanim( "dcburning_BHrescue_throwclip" ) ) - 5.0;
    thread maps\_utility::flag_set_delayed( "end_sequence_music", var_7 );
    var_0 maps\_anim::anim_single( var_6, "dcburning_BHrescue_throwclip" );
    common_scripts\utility::flag_set( "end_sequence_starting" );
    maps\_utility::delaythread( 2, _id_D301::_id_C303, 3 );
    var_0 thread maps\_anim::anim_single( var_6, "dcburning_BHrescue_laststand" );
    level._id_C280 maps\_utility::delaythread( 4, maps\_utility::play_sound_on_entity, "dcburn_cpd_tracer3rounds" );

    foreach ( var_9 in var_6 )
        var_9._id_BA50 = 1;

    level.player.ignoreme = 1;
    common_scripts\utility::flag_wait( "crash_cut_to_black" );
    level.black_overlay destroy();
    _id_A9E9();
}

_id_A8E4( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self ) )
        self delete();
}

_id_B57E()
{

}

_id_BAD1()
{
    common_scripts\utility::flag_wait( "player_crash_done" );
    level.player takeallweapons();
    level.player disableweapons();

    if ( level.script == "dcburning" )
    {
        level._id_A87F.greenberet_currentweapon = "m4m203_eotech";
        level._id_A87F.greenberet_previousweapons = [];
        level._id_A87F.greenberet_previousweapons["m4m203_eotech"] = [];
        level._id_A87F.greenberet_previousweapons["m4m203_eotech"]["ammoClip"] = 30;
        level._id_A87F.greenberet_previousweapons["m4m203_eotech"]["ammoStock"] = 0;
        level._id_A87F.greenberet_previousweapons["m4m203_eotech"]["akimbo"] = 0;
    }

    common_scripts\utility::flag_wait( "give_player_weapon" );
    thread maps\_utility::autosave_now( 1 );
    setsaveddvar( "hud_showStance", "1" );
    setsaveddvar( "ui_hidemap", 0 );
    setsaveddvar( "hud_drawhud", "1" );
    setsaveddvar( "hud_showStance", "1" );
    setsaveddvar( "compass", "1" );
    setdvar( "old_compass", "1" );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "actionSlotsHide", "0" );
    level.player allowcrouch( 1 );
    level.player disableoffhandweapons();
    level.player giveweapon( "m4m203_eotech" );
    level.player setweaponammoclip( "m4m203_eotech", 0 );
    level.player setweaponammostock( "m4m203_eotech", 0 );
    level.player setweaponammoclip( "m203_m4_eotech", 0 );
    level.player setweaponammostock( "m203_m4_eotech", 0 );
    level.player switchtoweapon( "m4m203_eotech" );
    level.player enableweapons();

    if ( level.script == "dcemp" )
    {
        if ( !level._id_C70E )
        {
            level.player setoffhandprimaryclass( "fraggrenade" );
            level.player giveweapon( "fraggrenade" );
            level.player setweaponammostock( "fraggrenade", 0 );
        }

        if ( !level._id_CE78 )
        {
            level.player setoffhandsecondaryclass( "flash_grenade" );
            level.player giveweapon( "flash_grenade" );
            level.player setweaponammostock( "flash_grenade", 0 );
        }

        level.player enableoffhandweapons();
    }

    level.player setweaponammoclip( "m4m203_eotech", 30 );
    level.player setweaponammostock( "m4m203_eotech", 0 );
    thread _id_C467();
    common_scripts\utility::flag_wait_either( "macey_wont_throw_clip_to_player", "macey_should_throw_clip_to_player" );

    if ( common_scripts\utility::flag( "macey_should_throw_clip_to_player" ) )
    {
        common_scripts\utility::flag_wait( "macey_clip_to_player" );
        level.player playsound( "scn_dcemp_player_receive_ammo" );
        level.player setweaponammostock( "m4m203_eotech", 30 );
        level.player _meth_8440();
    }
    else
    {

    }
}

_id_D4CD()
{
    self waittillmatch( "single anim", "end" );
    var_0 = getweaponmodel( self.weapon );
    var_1 = self.weapon;

    if ( isdefined( var_0 ) )
        self detach( var_0, "tag_weapon_right" );

    self kill();
}

_id_C467()
{
    while ( level.player getweaponammoclip( "m4m203_eotech" ) > 0 )
        wait 0.05;

    common_scripts\utility::flag_set( "player_ran_out_of_first_clip" );
}

_id_B255()
{
    while ( !level.player attackbuttonpressed() )
        wait 0.05;
}

_id_CEDB()
{
    var_0 = getent( "crash_node", "targetname" );
    level.player allowstand( 1 );
    level.player allowprone( 0 );
    level.player _meth_830F( 0 );
    level.player allowjump( 0 );
    level.player allowcrouch( 0 );
    var_1 = getent( "crash_site", "targetname" );
    var_2 = getent( "heli_top_propeller", "targetname" );
    var_3 = var_1;
    var_4 = getent( "crash_site_clip", "targetname" );
    var_5 = getent( "intro_heli_after_emp_clip", "targetname" );
    var_6 = getent( "crash_site_top_bar", "targetname" );
    var_7 = getent( "crash_site_bot_bar", "targetname" );
    var_8 = getent( "movement_grid_top_left", "targetname" );
    var_9 = getent( "movement_grid_bot_right", "targetname" );
    var_10 = getent( "movement_grid_exit", "targetname" );
    var_4 show();
    var_5 notsolid();
    var_4 linkto( var_3 );
    var_8 linkto( var_3 );
    var_9 linkto( var_3 );
    var_10 linkto( var_3 );
    var_5 linkto( var_3 );
    level.plank = maps\_utility::spawn_anim_model( "plank", var_6 getorigin() );
    level.plank maps\_utility::assign_animtree( "plank" );

    if ( level.script == "dcburning" )
    {
        var_6 linkto( var_3 );
        var_7 linkto( var_3 );
        var_0 maps\_anim::anim_first_frame_solo( level.plank, "dcemp_BHrescue" );
    }
    else
    {
        level._id_B145 = maps\_utility::spawn_anim_model( "plank2", var_6 getorigin() );
        level._id_AFFC = maps\_utility::spawn_anim_model( "plank1", var_7 getorigin() );
        level._id_BBF1 = [];
        level._id_BBF1[0] = level._id_AFFC;
        level._id_BBF1[1] = level._id_B145;
        level._id_BBF1[2] = level.plank;
        var_6 linkto( level._id_B145 );
        var_7 linkto( level._id_AFFC );
        var_0 maps\_anim::anim_first_frame( level._id_BBF1, "dcemp_BHrescue" );
    }

    var_1.animname = "crash_blackhawk";
    var_1 maps\_utility::assign_animtree();
    var_0 maps\_anim::anim_first_frame_solo( var_1, "rotors_start" );
    var_2.animname = "crash_blackhawk";
    var_2 maps\_utility::assign_animtree();
    var_0 maps\_anim::anim_first_frame_solo( var_2, "rotors_start" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_crash_done" );
    maps\_utility::add_func( ::_id_C384 );
    var_0 maps\_utility::add_func( maps\_anim::anim_loop_solo, var_2, "rotors" );
    thread maps\_utility::do_wait();
    var_11 = [];
    var_11["top_left"] = var_8;
    var_11["bot_right"] = var_9;
    return var_11;
}

_id_A9E9()
{
    if ( level.script == "dcburning" )
    {
        var_0 = _id_BA4C();
        wait 1;
        _id_C11E();
        var_1 = getaiarray();
        common_scripts\utility::array_thread( var_1, ::_id_CFB1 );
        wait 2;
        maps\_utility::nextmission();
    }
    else
    {
        var_0 = _id_BA4C();
        level.white_overlay = var_0;

        if ( level.start_point != "emp" )
        {
            var_2 = [];
            var_2[var_2.size] = level._id_D38F;
            var_2[var_2.size] = level._id_BE65;
            var_2 = common_scripts\utility::array_combine( var_2, level._id_B157 );
            var_2 = common_scripts\utility::array_combine( var_2, level._id_BC29 );
            _id_C11E( var_2 );
            common_scripts\utility::array_thread( getaiarray( "neutral", "allies" ), ::_id_CFB1 );
            common_scripts\utility::array_call( getentarray( "axis_crash_flood", "targetname" ), ::delete );
            level notify( "stop_drone_floodaxis_crash_drones" );
            var_3 = getentarray( "axis_crash_drone", "script_noteworthy" );
            common_scripts\utility::array_call( var_3, ::delete );
        }

        common_scripts\utility::flag_set( "emp_entity_cleanup_done" );
        level.player disableinvulnerability();

        if ( getdvarint( "r_dcburning_culldist" ) == 1 )
            setculldist( level._id_C4E1 );
    }
}

_id_BA4C()
{
    var_0 = maps\_hud_util::create_client_overlay( "white", 0 );
    wait 0.6;
    var_0 fadeovertime( 0.2 );
    var_0.alpha = 1;
    wait 0.3;
    return var_0;
}

_id_B153()
{
    var_0 = 0.25;
    ambientstop( var_0 );
}

_id_C20D()
{
    common_scripts\utility::flag_wait( "crash_redshirt_speaks" );
    maps\_utility::delaythread( 0, maps\_vehicle::spawn_vehicles_from_targetname_and_drive, "jets_crash_site_01" );
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "helis_crash_rappel" );
    common_scripts\utility::array_thread( var_0, maps\_vehicle::godon );
    common_scripts\utility::flag_wait( "end_sequence_starting" );
    var_1 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "btr80s_end" );
    common_scripts\utility::array_thread( var_1, maps\_vehicle::godon );
    common_scripts\utility::array_thread( var_1, ::_id_C85C );
    common_scripts\utility::array_thread( var_1, ::_id_B28B );
    thread _id_B04B( var_1 );
}

_id_C85C()
{
    maps\_utility::ent_flag_init( "stop_btr" );
    maps\_utility::ent_flag_wait( "stop_btr" );
    self vehicle_setspeed( 0, 3, 3 );
    self setturrettargetvec( level.player.origin + ( 0.0, 0.0, 32.0 ) );
}

_id_C384()
{
    setsaveddvar( "ui_hidemap", 1 );
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "compass", "0" );
    var_0 = getanimlength( level.scr_anim["player_rig"]["dcburning_BHrescue"] );
    var_1 = var_0 + 2;
    level.player shellshock( "dcburning", var_1 );
    var_2 = level.dofdefault;
    common_scripts\utility::flag_wait( "notetrack_player_upright" );
    common_scripts\utility::flag_wait( "notetrack_player_raisehands" );
    var_3 = [];
    var_3["nearStart"] = 0;
    var_3["nearEnd"] = 0;
    var_3["nearBlur"] = 6;
    var_3["farStart"] = 30;
    var_3["farEnd"] = 70;
    var_3["farBlur"] = 2.5;
    var_4 = 3;
    thread maps\_utility::_id_B75A( var_2, var_3, 3 );
    maps\_art::dof_enable_script( var_3["nearStart"], var_3["nearEnd"], var_3["nearBlur"], var_3["farStart"], var_3["farEnd"], var_3["farBlur"], var_4, undefined );
    setblur( 0, 3 );
    common_scripts\utility::flag_wait( "notetrack_player_lowerhands" );
    var_5 = [];
    var_5["nearStart"] = 4.7;
    var_5["nearEnd"] = 56;
    var_5["nearBlur"] = 6;
    var_5["farStart"] = 1000;
    var_5["farEnd"] = 7000;
    var_5["farBlur"] = 0;
    var_4 = 6;
    thread maps\_utility::_id_B75A( var_3, var_2, 6 );
    maps\_art::dof_enable_script( var_5["nearStart"], var_5["nearEnd"], var_5["nearBlur"], var_5["farStart"], var_5["farEnd"], var_5["farBlur"], var_4, undefined );
}

_id_B5E8()
{
    setblur( 3, 0.5 );
    wait 0.5;
    setblur( 0, 0.5 );
    wait 0.5;
    setblur( 3, 0.5 );
}

_id_B658()
{
    common_scripts\utility::flag_wait( "end_sequence_music" );
    thread maps\_utility::musicplaywrapper( "mus_dcburning_crashsite_01" );
    soundscripts\_snd::snd_message( "start_space_transition_in_mix" );
    common_scripts\utility::flag_wait( "end_sequence_starting" );
    wait 11.5;
    common_scripts\utility::flag_set( "crash_cut_to_black" );
    maps\_utility::battlechatter_off( "axis" );
}

_id_B587()
{
    var_0 = gettime();
    var_1 = var_0 - level._id_CC7E;

    if ( var_0 == level._id_CC7E )
        return 1;
    else if ( var_1 > 5000 )
        return 0;
    else
        return 1;
}

_id_C836( var_0 )
{
    while ( !common_scripts\utility::flag( "end_sequence_starting" ) )
    {
        playfxontag( common_scripts\utility::getfx( "dlight_blue" ), var_0, "tag_player" );
        wait 1;
        stopfxontag( common_scripts\utility::getfx( "dlight_blue" ), var_0, "tag_player" );
        wait 0.3;
        playfxontag( common_scripts\utility::getfx( "dlight_blue" ), var_0, "tag_player" );
        wait 0.5;
        stopfxontag( common_scripts\utility::getfx( "dlight_blue" ), var_0, "tag_player" );
        wait 0.3;
        playfxontag( common_scripts\utility::getfx( "dlight_blue" ), var_0, "tag_player" );
        wait 0.2;
        stopfxontag( common_scripts\utility::getfx( "dlight_blue" ), var_0, "tag_player" );
        wait 0.4;
        playfxontag( common_scripts\utility::getfx( "dlight_blue" ), var_0, "tag_player" );
        wait 0.6;
        stopfxontag( common_scripts\utility::getfx( "dlight_blue" ), var_0, "tag_player" );
        wait 0.4;
    }

    stopfxontag( common_scripts\utility::getfx( "dlight_blue" ), var_0, "tag_player" );
}

_id_B888( var_0, var_1, var_2 )
{
    level endon( "player_shot" );
    level endon( "player_unlinked" );
    common_scripts\utility::flag_wait( "crash_fade_up" );
    common_scripts\utility::flag_wait( "redshirt_headshot" );
    var_2 hide();
    var_3 = ( 0.0, 0.0, 0.0 );
    var_4 = getent( "crash_node", "targetname" );
    var_5 = common_scripts\utility::spawn_tag_origin();
    var_6 = getent( "crash_site", "targetname" );
    var_6 delete();
    var_5.origin = level.player.origin + var_3;
    var_5.angles = var_2.angles + ( 0.0, 0.0, 0.0 );

    if ( level.script != "dcemp" || level.start_point != "iss" )
    {
        level.player unlink();
        level.player playerlinktoblend( var_5, "tag_player", 0.5 );
        wait 0.5;
        level.player playerlinktodelta( var_5, "tag_player", 1, 50, 60, 20, 15, 1 );
        level.player setviewangleresistance( 50, 50, 20, 20 );
    }

    level.player._id_B0D8 = var_5;
    var_7 = 3;
    var_8 = 0.05;
    var_9 = var_0.origin[0];
    var_10 = var_1.origin[1];
    var_11 = var_1.origin[0];
    var_12 = var_0.origin[1];
    var_13 = undefined;
    var_14 = undefined;
    var_15 = undefined;

    for (;;)
    {
        wait(var_8);
        var_16 = level.player getnormalizedmovement();
        var_17 = anglestoforward( level.player.angles );
        var_18 = anglestoright( level.player.angles );
        var_17 *= ( var_16[0] * var_7 );
        var_18 *= ( var_16[1] * var_7 );
        var_19 = var_5.origin + var_17 + var_18;
        var_19 = ( var_19[0], var_19[1], var_4.origin[2] );
        var_13 = common_scripts\utility::_id_D0EA( var_19[0], var_11, var_9 );
        var_14 = common_scripts\utility::_id_D0EA( var_19[1], var_12, var_10 );
        var_15 = var_5.origin[2];
        var_19 = ( var_13, var_14, var_15 );
        var_5.origin = var_19;
    }
}

_id_CB8A()
{
    self.interval = 0;
    self.neverenablecqb = 1;
    self.grenadeawareness = 0;
    self.ignoresuppression = 1;
    self.aggressivemode = 1;
    self.cheat.ignorewolfthink = 1;
    self.cheat._id_BDF2 = 1;
    self waittill( "death", var_0 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
        level._id_CC7E = gettime();
}

_id_B530( var_0 )
{
    level.player freezecontrols( 0 );
    level.player playerlinktodelta( var_0, "tag_player", 1, 25, 25, 15, 10, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_B04B( var_0 )
{
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_crash_site_spotlight" );
    var_1 endon( "death" );
    var_1 thread maps\_vehicle::godon();
    var_1 vehicle_setspeed( 30 );
    var_1 setmaxpitchroll( 20, 20 );
    var_1 crashsite_heli_spotlight();
    wait 5;
    var_1 setlookatent( level.player );
    wait 2.5;
    var_1 thread vehicle_scripts\_attack_heli::heli_spotlight_on( "tag_spotlight", 0 );
    var_1 setturrettargetent( var_0[0] );
    wait 1.5;
    var_2 = getent( "btr80s_old_end", "targetname" );
    var_1 setturrettargetent( var_2 );
    var_1 setlookatent( level.player );
    wait 2;
    var_1 vehicle_setspeed( 10 );
    var_1 notify( "stop_spotlight_random_targets" );
    wait 0.1;
    var_1 setturrettargetent( level.player );
    wait 2;
}

_id_C6B2()
{
    common_scripts\utility::flag_wait( "obj_crash_site_given" );

    if ( level.script == "dcburning" )
    {
        var_0 = 10;
        objective_add( var_0, "active", &"DCBURNING_OBJ_CRASH_SITE" );
        objective_current( var_0 );
        common_scripts\utility::flag_wait( "obj_crash_site_complete" );
        objective_state( var_0, "done" );
    }
    else
    {
        objective_add( level._id_CD9B, "active", &"DCEMP_OBJ_CRASH_SITE" );
        objective_current( level._id_CD9B );
        common_scripts\utility::flag_wait( "iss_fx" );
        objective_delete( level._id_CD9B );
    }
}

_id_BB3A()
{
    var_0 = level.player.gs.longregentime;
    var_1 = level.player.deathinvulnerabletime;
    var_2 = getdvar( "bg_viewKickScale" );
    var_3 = getdvar( "bg_viewKickMax" );
    var_4 = getdvar( "bg_viewKickMin" );
    level.player maps\_utility::ent_flag_clear( "near_death_vision_enabled" );
    level.player.gs.longregentime = 500;
    level.player.baseignorerandombulletdamage = 1;
    level.ignorerandombulletdamage = 1;
    level.player.deathinvulnerabletime = 7000;
    setsaveddvar( "bg_viewKickScale", 0.1 );
    setsaveddvar( "bg_viewKickMax", "5" );
    setsaveddvar( "bg_viewKickMin", "1" );
    common_scripts\utility::flag_wait( "player_crash_done" );
    level.player.gs.longregentime = var_0;
    level.player.deathinvulnerabletime = var_1;
    setsaveddvar( "bg_viewKickScale", var_2 );
    setsaveddvar( "bg_viewKickMax", var_3 );
    setsaveddvar( "bg_viewKickMin", var_4 );
    level.player maps\_utility::ent_flag_set( "near_death_vision_enabled" );
}
#using_animtree("generic_human");

_id_BC93()
{
    level.scr_radio["dcburn_hqr_doyoucopy"] = "dcburn_hqr_doyoucopy";
    level.scr_radio["dcburn_hqr_howcopy"] = "dcburn_hqr_howcopy";
    level.scr_radio["dcburn_hqr_doyoureadme"] = "dcburn_hqr_doyoureadme";
    level.scr_sound["crash_redshirt"]["dcburn_gr1_ramirez1"] = "dcburn_gr1_ramirez1";
    level.scr_sound["crash_redshirt"]["dcburn_gr1_ramirez2"] = "dcburn_gr1_ramirez2";
    level.scr_sound["dcburn_gr1_hangon"] = "dcburn_gr1_hangon";
    level.scr_sound["crash_leader"]["dcburn_mcy_wadesdown"] = "dcburn_mcy_wadesdown";
    level.scr_sound["crash_dunn"]["dcburn_cpd_toomany"] = "dcburn_cpd_toomany";
    level.scr_sound["crash_leader"]["dcburn_mcy_defendthispos"] = "dcburn_mcy_defendthispos";
    level.scr_sound["crash_dunn"]["dcburn_cpd_lastmag"] = "dcburn_cpd_lastmag";
    level.scr_sound["crash_leader"]["dcburn_mcy_lastone"] = "dcburn_mcy_lastone";
    level.scr_sound["crash_dunn"]["dcburn_cpd_imout"] = "dcburn_cpd_imout";
    level.scr_sound["crash_leader"]["dcburn_mcy_getdown"] = "dcburn_mcy_getdown";
    level.scr_sound["generic"]["dcburn_ar1_reloadingcover"] = "dcburn_ar1_reloadingcover";
    level.scr_sound["generic"]["dcburn_ar2_mccordcovering"] = "dcburn_ar2_mccordcovering";
    level.scr_sound["generic"]["dcburn_ar1_loading"] = "dcburn_ar1_loading";
    level.scr_sound["generic"]["dcburn_ar2_seanlast"] = "dcburn_ar2_seanlast";
    level.scr_sound["crash_dunn"]["dcburn_cpd_target2"] = "dcburn_cpd_target2";
    level.scr_sound["crash_leader"]["dcburn_mcy_ammocheck"] = "dcburn_mcy_ammocheck";
    level.scr_sound["generic"]["dcburn_ar4_imgood"] = "dcburn_ar4_imgood";
    level.scr_sound["crash_leader"]["dcburn_mcy_soundoff"] = "dcburn_mcy_soundoff";
    level.scr_sound["generic"]["dcburn_ar3_twomags"] = "dcburn_ar3_twomags";
    level.scr_sound["crash_leader"]["dcburn_mcy_mccord"] = "dcburn_mcy_mccord";
    level.scr_sound["generic"]["dcburn_ar2_lastmag"] = "dcburn_ar2_lastmag";
    level.scr_sound["crash_leader"]["dcburn_mcy_talktome"] = "dcburn_mcy_talktome";
    level.scr_sound["generic"]["dcburn_ar4_watch3"] = "dcburn_ar4_watch3";
    level.scr_sound["generic"]["dcburn_ar1_newtarget"] = "dcburn_ar1_newtarget";
    level.scr_sound["generic"]["dcburn_ar2_gotitgotit"] = "dcburn_ar2_gotitgotit";
    level.scr_sound["crash_dunn"]["dcburn_cpd_target11"] = "dcburn_cpd_target11";
    level.scr_sound["crash_dunn"]["dcburn_cpd_pain"] = "dcburn_cpd_pain";
    level.scr_sound["crash_leader"]["dcburn_mcy_hangon"] = "dcburn_mcy_hangon";
    level._effect["mortar"]["bunker_ceiling"] = loadfx( "fx/dust/ceiling_dust_bunker" );
    level._effect["mortar"]["bunker_ceiling_green"] = loadfx( "fx/dust/ceiling_dust_bunker_green" );
    level._effect["mortar"]["dirt_large"] = loadfx( "fx/explosions/artilleryExp_dirt_brown_2_dcburning" );
    level._effect["mortar"]["dirt"] = loadfx( "fx/explosions/grenadeExp_dirt" );
    level._effect["mortar"]["concrete"] = loadfx( "vfx/explosion/frag_grenade_concrete_dcemp" );
    level.scr_sound["mortar"]["incomming"] = "mortar_incoming";
    level.scr_sound["mortar"]["dirt"] = "mortar_explosion_dirt";
    level.scr_sound["mortar"]["dirt_large"] = "mortar_explosion_dirt";
    level.scr_sound["mortar"]["concrete"] = "mortar_explosion_dirt";
    level.scr_sound["mortar"]["mud"] = "mortar_explosion_water";
    level._effect["nuke_flash"] = loadfx( "fx/explosions/nuke_flash" );
    level.scr_anim["crash_redshirt"]["dcburning_BHrescue"] = %h2_dcburning_bhrescue_soldier_wakeup;
    maps\_anim::addnotetrack_customfunction( "crash_redshirt", "dialogue", ::_id_BF26, "dcburning_BHrescue" );
    maps\_anim::addnotetrack_customfunction( "crash_redshirt", "detachgun", ::_id_CA2C, "dcburning_BHrescue" );
    maps\_anim::addnotetrack_customfunction( "crash_redshirt", "headshot", ::_id_BA75, "dcburning_BHrescue" );
    level.scr_anim["crash_leader"]["vehicle_cover"] = %h2_dcburning_bhrescue_soldier1_fighting;
    level.scr_anim["crash_dunn"]["vehicle_cover"] = %h2_dcburning_bhrescue_soldier2_fighting;
    level.scr_anim["crash_leader"]["vehicle_cover_loop"] = %h2_dcburning_bhrescue_soldier1_loop;
    level.scr_anim["crash_dunn"]["vehicle_cover_loop"] = %h2_dcburning_bhrescue_soldier2_loop;
    level.scr_anim["crash_leader"]["dcburning_BHrescue_throwclip"] = %h2_dcburning_bhrescue_soldier1_giveammo;
    maps\_anim::addnotetrack_customfunction( "crash_leader", "dialogue", ::_id_CFC5, "dcburning_BHrescue_throwclip" );
    level.scr_anim["crash_dunn"]["dcburning_BHrescue_throwclip"] = %h2_dcburning_bhrescue_soldier2_giveammo;
    maps\_anim::addnotetrack_attach( "crash_leader", "clipattach", "weapon_m4_clip", "tag_inhand", "dcburning_BHrescue_throwclip" );
    maps\_anim::addnotetrack_detach( "crash_leader", "clipdetach", "weapon_m4_clip", "tag_inhand", "dcburning_BHrescue_throwclip" );
    level.scr_anim["crash_leader"]["dcburning_BHrescue_laststand"] = %h2_dcburning_bhrescue_soldier1_wounded;
    level.scr_anim["crash_dunn"]["dcburning_BHrescue_laststand"] = %h2_dcburning_bhrescue_soldier2_wounded;
    maps\_anim::addnotetrack_customfunction( "crash_dunn", "wounded", ::_id_BC94, "dcburning_BHrescue_laststand" );
}

_id_CFC5( var_0 )
{
    common_scripts\utility::flag_set( "macey_last_mag_dialogue" );
    wait 2.2;
    common_scripts\utility::flag_set( "macey_clip_to_player" );
}

_id_BF26( var_0 )
{
    common_scripts\utility::flag_set( "crash_redshirt_speaks" );
    wait 1.0;
    level.player playsound( "scn_dcemp_player_handed_gun" );
}

_id_CA2C( var_0 )
{
    common_scripts\utility::flag_set( "give_player_weapon" );
}

_id_BA75( var_0 )
{
    common_scripts\utility::flag_set( "redshirt_headshot" );
    thread common_scripts\utility::play_sound_in_space( "h2_wpn_desert_eagle_npc_close", var_0.origin );
    thread common_scripts\utility::play_sound_in_space( "bullet_large_flesh", var_0.origin );
    playfxontag( common_scripts\utility::getfx( "killshot" ), var_0, "TAG_EYE" );
}

_id_BC94( var_0 )
{
    common_scripts\utility::flag_set( "friendly_02_injured" );
    thread common_scripts\utility::play_sound_in_space( "h2_wpn_desert_eagle_npc_close", var_0.origin );
    thread common_scripts\utility::play_sound_in_space( "bullet_large_flesh", var_0.origin );
    playfxontag( common_scripts\utility::getfx( "headshot3" ), var_0, "J_Shoulder_RI" );
    wait 1;
    level._id_AC03 thread maps\_utility::dialogue_queue( "dcburn_mcy_hangon" );
    var_1 = getent( "crash_chatter_org_right", "targetname" );
    var_1 maps\_utility::delaythread( 1, common_scripts\utility::play_sound_in_space, "dcburn_ar1_loading" );
    wait 2;
    level._id_AC03 thread maps\_utility::dialogue_queue( "dcburn_mcy_defendthispos" );

    if ( level.script == "dcburning" )
        maps\_utility::delaythread( 2.3, common_scripts\utility::play_sound_in_space, "scn_dcemp_space_transition_in", level.player.origin + ( 0.0, 0.0, 100.0 ), 1 );
    else
        thread common_scripts\utility::play_sound_in_space( "scn_dcemp_space_transition_in", level.player.origin + ( 0.0, 0.0, 100.0 ), 1 );
}

_id_B116( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_player_upright" );
}

_id_C42F( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_player_raisehands" );
}

_id_D299( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_player_lowerhands" );
}
#using_animtree("player");

_id_ABAD()
{
    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_ump9_viewbody";
    level.scr_anim["player_rig"]["dcburning_BHrescue"] = %h2_dcburning_bhrescue_player_wakeup;
    level.scr_anim["player_rig"]["dcburning_BHrescue_throwclip"] = %h2_dcburning_bhrescue_player_takeammo;
    maps\_anim::addnotetrack_customfunction( "player_rig", "upright", ::_id_B116, "dcburning_BHrescue" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "handsup", ::_id_C42F, "dcburning_BHrescue" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "handsdown", ::_id_D299, "dcburning_BHrescue" );
}
#using_animtree("script_model");

_id_D2EB()
{
    level.scr_anim["crash_blackhawk"]["rotors_start"] = %dcburning_bhrescue_bh;
    level.scr_anim["crash_blackhawk"]["rotors"][0] = %dcburning_bhrescue_bh;
    level.scr_animtree["crash_blackhawk"] = #animtree;
}

_id_CFB1( var_0 )
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

_id_C11E( var_0 )
{
    var_1 = level.vehicles["axis"];
    var_2 = level.vehicles["allies"];
    var_3 = maps\_utility::array_merge( var_1, var_2 );

    foreach ( var_5 in var_3 )
    {
        if ( !isdefined( var_5 ) )
            continue;

        if ( isdefined( var_0 ) && var_0.size > 0 )
        {
            if ( maps\_utility::is_in_array( var_0, var_5 ) )
                continue;
        }

        var_5 maps\_vehicle::godoff();
        var_5 _id_B3C6();
    }
}

_id_B3C6()
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );

    if ( isdefined( self.riders ) && self.riders.size )
        common_scripts\utility::array_thread( self.riders, ::_id_CFB1 );

    if ( isdefined( self.mgturret ) )
    {
        foreach ( var_1 in self.mgturret )
        {
            if ( isdefined( var_1 ) )
                var_1 delete();
        }
    }

    self delete();
}

_id_BD01( var_0, var_1 )
{
    level endon( "stop_drone_flood" + var_1 );

    for (;;)
    {
        foreach ( var_3 in var_0 )
        {
            var_3.script_noteworthy = "axis_crash_drone";
            maps\_utility::add_wait( maps\_utility::_wait, randomfloatrange( 5, 6 ) );
            var_3 maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
            maps\_utility::add_func( maps\_utility::dronespawn, var_3 );
            thread maps\_utility::do_wait();
        }

        wait(randomfloatrange( 5, 6 ));
    }
}

_id_B985( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = getent( var_1.script_linkto, "script_linkname" );
    var_2 notify( "trigger", level.player );
}

_id_C238()
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
}

_id_B28B()
{
    wait 0.1;
    self vehicle_turnengineoff();
    self.script_disablevehicleaudio = 1;
}

crashsite_heli_spotlight()
{
    thread _id_B28B();
    self playsound( "scn_dcemp_heli_spotlight" );
}

crash_remove_vehicles()
{
    var_0 = getentarray( "crash_hide_model", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

crash_script_model_anims()
{
    level.scr_model["weapon_m4"] = "weapon_m4";
    level.scr_animtree["weapon_m4"] = #animtree;
    level.scr_anim["weapon_m4"]["dcburning_BHrescue"] = %h2_dcburning_bhrescue_weapon_wakeup;
    level.scr_animtree["traffic_light"] = #animtree;
    level.scr_anim["traffic_light"]["traffic_light_shock"] = %h2_dcb_traffic_light_crash_shock;
    level.scr_anim["traffic_light"]["traffic_light_idle"][0] = %h2_dcb_traffic_light_crash_idle;
    level._effect["traffic_red_light"] = loadfx( "fx/misc/usa_traffic_light_red_dcemp" );
}

traffic_signal_animated()
{
    var_0 = getent( "animated_traffic_light", "targetname" );
    var_0 maps\_utility::assign_animtree( "traffic_light" );
    var_0 thread blinking_light_fx();
    var_0 thread maps\_anim::anim_loop_solo( var_0, "traffic_light_idle", "stop_idle" );

    if ( level.script != "dcburning" )
    {
        common_scripts\utility::flag_wait( "intro_heli_crashing" );
        wait 2;
        var_0 notify( "stop_idle" );
        var_0 maps\_anim::anim_single_solo( var_0, "traffic_light_shock" );
        var_0 thread maps\_anim::anim_loop_solo( var_0, "traffic_light_idle", "stop_idle" );
        common_scripts\utility::flag_wait( "player_and_squad_safe" );
        var_0 notify( "stop_idle" );
        var_0 delete();
    }
}

blinking_light_fx()
{
    var_0 = [];
    var_1 = common_scripts\utility::_id_B6EF( "tag_light_fx_01", ( -25.0, 0.0, 0.0 ), ( -90.0, 0.0, -90.0 ) );
    var_2 = common_scripts\utility::_id_B6EF( "tag_light_fx_02", ( -25.0, 0.0, 0.0 ), ( -90.0, 0.0, -90.0 ) );
    var_3 = common_scripts\utility::_id_B6EF( "tag_light_fx_03", ( -25.0, 0.0, 0.0 ), ( 0.0, -90.0, 0.0 ) );
    var_0 = [ var_1, var_2, var_3 ];

    if ( level.script != "dcburning" )
        thread traffic_light_spark( var_0 );

    while ( !common_scripts\utility::flag( "emp_happening" ) )
    {
        foreach ( var_5 in var_0 )
            playfxontag( level._effect["traffic_red_light"], var_5, "tag_origin" );

        wait 0.75;

        foreach ( var_5 in var_0 )
            killfxontag( level._effect["traffic_red_light"], var_5, "tag_origin" );

        wait 0.75;
    }

    foreach ( var_5 in var_0 )
        killfxontag( level._effect["traffic_red_light"], var_5, "tag_origin" );
}

traffic_light_spark( var_0 )
{
    common_scripts\utility::flag_wait( "intro_heli_crashing" );
    wait 2;
    common_scripts\utility::flag_set( "emp_happening" );

    foreach ( var_2 in var_0 )
        playfxontag( level._effect["powerline_runner_oneshot"], var_2, "tag_origin" );
}
