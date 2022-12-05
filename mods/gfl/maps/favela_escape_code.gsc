// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_D546()
{
    _id_CFC3();
    var_0 = getentarray();

    while ( !isdefined( level.struct_class_names ) )
        wait 0.05;

    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3.code_classname ) )
            continue;

        if ( issubstr( var_3.code_classname, "trigger" ) )
            var_1[var_1.size] = var_3;
    }

    foreach ( var_6 in var_1 )
    {
        if ( !isdefined( var_6.target ) )
            continue;

        var_7 = common_scripts\utility::getstructarray( var_6.target, "targetname" );

        foreach ( var_9 in var_7 )
        {
            if ( isdefined( var_9.script_noteworthy ) && var_9.script_noteworthy == "hostile_burst" )
                var_6 thread _id_AC4B( var_9 );
        }
    }
}

_id_CFC3()
{
    var_0 = [];
    var_0[var_0.size] = "favesc_pe1_youhearme";
    var_0[var_0.size] = "favesc_pe2_callthetruck";
    var_0[var_0.size] = "favesc_pe3_killslowly";
    var_0[var_0.size] = "favesc_pe3_cantstop";
    var_0[var_0.size] = "favesc_pe4_wellfindyou";
    var_0[var_0.size] = "favesc_pe3_mginalley";
    var_0[var_0.size] = "favesc_pe3_afterthem";
    var_0[var_0.size] = "favesc_pe3_blockexits";
    var_0[var_0.size] = "favesc_pe4_killthemall";
    var_0[var_0.size] = "favesc_pe4_wellfindyou";
    var_0[var_0.size] = "favesc_pe4_chasethem";
    var_0[var_0.size] = "favesc_pe4_huntthem";
    var_0[var_0.size] = "favesc_pe2_limbbylimb";
    var_0[var_0.size] = "favesc_pe4_neveragain";
    var_0[var_0.size] = "favesc_pe1_nohonor";
    var_0[var_0.size] = "favesc_pe2_wait2seconds";
    var_0[var_0.size] = "favesc_pe1_keepthemalive";
    var_0[var_0.size] = "favesc_pe2_morebandages";
    var_0[var_0.size] = "favesc_pe1_avengemybrother";
    var_0[var_0.size] = "favesc_pe3_cantstop";
    var_0[var_0.size] = "favesc_pe1_goingtodie";
    var_0 = common_scripts\utility::array_randomize( var_0 );
    level._id_C5B7 = var_0;
    level._id_C6D6 = undefined;
}

_id_AC4B( var_0 )
{
    self waittill( "trigger" );

    if ( !maps\_utility::script_delay() )
        wait(randomfloatrange( 0.5, 1.25 ));

    var_1 = undefined;

    if ( isdefined( var_0.script_parameters ) )
        var_1 = var_0.script_parameters;

    if ( !isdefined( var_1 ) )
    {
        if ( !isdefined( level._id_C6D6 ) )
            level._id_C6D6 = 0;

        var_1 = level._id_C5B7[level._id_C6D6];
        level._id_C6D6++;

        if ( level._id_C6D6 >= level._id_C5B7.size - 1 )
            level._id_C6D6 = 0;
    }

    level thread common_scripts\utility::play_sound_in_space( var_1, var_0.origin );
}

_id_D529()
{
    thread _id_BD5E();
    var_0 = "mus_favelaescape_combat";
    var_1 = maps\_utility::musiclength( var_0 );

    while ( !common_scripts\utility::flag( "market_evac_insidepath_start" ) )
    {
        maps\_utility::musicplaywrapper( var_0 );
        wait(var_1);
        maps\_utility::music_stop( 1 );
        wait 3;
    }
}

_id_BD5E()
{
    common_scripts\utility::flag_wait( "market_evac_insidepath_start" );
    maps\_utility::music_stop( 7.5 );
}

_id_D5C8()
{
    maps\_utility::music_loop( "mus_favelaescape_waveoff", 72 );
}

_id_C1F2()
{
    maps\_utility::music_stop( 3 );
    level.player maps\_utility::play_sound_on_entity( "mus_favelaescape_fixedfall", "fixedfall_music_done" );
}

_id_CB76()
{
    maps\_utility::music_stop( 3 );
    wait 3;
    maps\_utility::musicplaywrapper( "mus_favelaescape_finalrun" );
    common_scripts\utility::flag_wait( "solorun_player_boarded_chopper" );
    maps\_utility::music_stop( 10 );
    level.player maps\_utility::play_sound_on_entity( "mus_favelaescape_ending" );
}

_id_CD0A()
{
    var_0 = ( 3712.0, 576.0, 1211.0 );
    maps\_utility::delaythread( 5, common_scripts\utility::play_sound_in_space, "favesc_pgm_wellfindyou", var_0 );
    maps\_utility::delaythread( 20, common_scripts\utility::play_sound_in_space, "favesc_pgm_huntthem", var_0 );
    maps\_utility::delaythread( 0.5, common_scripts\utility::play_sound_in_space, "wlla_favela_escape_start", var_0 );
}

_id_A974()
{
    var_0 = ( 1972.0, -1340.0, 734.0 );
    maps\_utility::delaythread( 5, common_scripts\utility::play_sound_in_space, "favesc_pgm_blockexits", var_0 );
    common_scripts\utility::play_sound_in_space( "wlla_favela_escape_vista1", var_0 );
}

_id_C328()
{
    common_scripts\utility::flag_wait( "uphill_advance_3" );
    var_0 = ( -1156.0, 1796.0, 1124.0 );
    maps\_utility::delaythread( 5, common_scripts\utility::play_sound_in_space, "favesc_pgm_killthemall", var_0 );
    maps\_utility::delaythread( 20, common_scripts\utility::play_sound_in_space, "favesc_pgm_nohonor", var_0 );
    common_scripts\utility::play_sound_in_space( "wlla_favela_escape_vista2", var_0 );
}

_id_C2B9()
{
    var_0 = getent( "walla_escape_soccer", "targetname" );
    var_0 maps\_utility::play_sound_on_entity( "wlla_favela_escape_soccer" );
}

_id_CDA6()
{
    level.player maps\_utility::play_sound_on_entity( "wlla_favela_escape_running1" );
}

_id_C472()
{
    var_0 = ( -5588.0, -1852.0, 912.0 );
    maps\_utility::delaythread( 5, common_scripts\utility::play_sound_in_space, "favesc_pgm_wellfindyou", var_0 );
    common_scripts\utility::play_sound_in_space( "wlla_favela_escape_fallen_right", var_0 );
}

_id_C843()
{
    var_0 = ( -5704.0, -376.0, 814.0 );
    maps\_utility::delaythread( 10, common_scripts\utility::play_sound_in_space, "favesc_pgm_huntthem", var_0 );
    common_scripts\utility::play_sound_in_space( "wlla_favela_escape_fallen_left", var_0 );
}

_id_BAA8()
{
    var_0 = "runpath_dialogue_continue";
    common_scripts\utility::flag_init( var_0 );
    thread _id_AAC6( var_0 );
    common_scripts\utility::flag_wait( var_0 );
    common_scripts\utility::flag_wait( "runpath_resume_dialogue" );
    level._id_BAD2 dialogue( "favesc_cmt_surrounded" );
    maps\_utility::radio_dialogue( "favesc_nkl_ontheway" );
    level._id_BAD2 dialogue( "favesc_cmt_lockandload" );
    level._id_C947 dialogue( "favesc_gst_letsdothis" );
    common_scripts\utility::flag_set( "radiotower_runpath_dialogue_done" );
}

_id_AAC6( var_0 )
{
    maps\_utility::trigger_wait_targetname( "trig_script_color_allies_b0" );
    common_scripts\utility::flag_set( var_0 );
}

_id_C000()
{
    var_0 = 5;
    var_1 = getentarray( "spawner_radiotower_wave1", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_AB6C );

    if ( !isdefined( level._id_BE67 ) )
        level._id_BE67 = 0;

    while ( level._id_BE67 < var_0 )
        wait 0.1;

    _id_B082( "trig_killspawner_7" );
}

_id_AB6C()
{
    self waittill( "death", var_0 );

    if ( maps\_spawner::player_saw_kill( self, var_0 ) )
        level._id_BE67++;
}

_id_BD7D()
{
    var_0 = getent( "radiotower_path_scout", "targetname" );
    var_1 = var_0.animation;
    var_2 = getnode( var_0.target, "targetname" );
    var_3 = var_0 maps\_utility::spawn_ai();
    var_3 thread maps\_utility::magic_bullet_shield( 1 );
    var_3 ignore_everything();
    var_3.ignoreme = 1;
    var_0 maps\_anim::anim_generic_first_frame( var_3, var_1 );
    maps\_utility::trigger_wait_targetname( "trig_radiotower_brushpath_start" );
    var_3 maps\_utility::stop_magic_bullet_shield();
    var_3 endon( "death" );
    var_3.allowdeath = 1;
    var_3 thread maps\_utility::play_sound_on_entity( "favesc_pe1_heretheycome" );
    var_0 maps\_anim::anim_generic( var_3, var_1 );
    var_3.goalradius = 64;
    var_3 setgoalnode( var_2 );
    var_3 waittill( "goal" );

    if ( isdefined( var_3 ) )
    {
        var_3 _id_B97F();
        var_3.ignoreme = 0;
        var_3.fixednode = 0;
        var_3.goalradius = 1024;
        var_3.combatmode = "ambush";
    }
}

_id_C823()
{
    common_scripts\utility::array_thread( level._id_C2F8, ::_id_B2D0, 1 );
    maps\_utility::trigger_wait_targetname( "trig_radiotower_brushpath_start" );
    wait 2.25;
    common_scripts\utility::array_thread( level._id_C2F8, ::_id_B2D0, 0 );
}

_id_CD3C()
{
    maps\_utility::trigger_wait_targetname( "trig_radiotower_forcecolor_change_1" );
    level._id_BAD2 maps\_utility::set_force_color( "b" );
}

_id_ADE1()
{
    maps\_utility::trigger_wait_targetname( "trig_radiotower_doorkick_1" );
    var_0 = common_scripts\utility::getstruct( "struct_radiotower_doorkick_1_sighttracer", "targetname" );
    var_0 maps\_utility::waittill_player_lookat_for_time( 1, 0.7 );
    var_1 = getentarray( "spawner_radiotower_doorkick_1", "targetname" );
    var_2 = getent( "sbmodel_radiotower_doorkick_1", "targetname" );
    var_3 = common_scripts\utility::getstruct( "struct_radiotower_doorkick_1_animref", "targetname" );
    thread _id_ACE3( var_1, var_2, var_3 );

    if ( common_scripts\utility::flag( "radiotower_runpath_dialogue_done" ) )
        level._id_C947 maps\_utility::delaythread( 1, ::dialogue, "favesc_gst_shackonleft" );

    wait 5;
    var_4 = getent( "sbmodel_radiotower_doorkick_1_backdoor_blocker", "targetname" );
    var_4 delete();
}

_id_CDEF()
{
    var_0 = getent( "radiotower_curtainpull1_animref", "targetname" );
    _id_AF07( var_0 );
    var_0._id_A9D3 = common_scripts\utility::getstruct( "radiotower_curtainpull1_sighttracer", "targetname" );
    var_1 = getent( "spawner_radiotower_curtainpull_1", "targetname" );
    var_1 thread _id_B52F( 1, ::_id_BA3F );
    level endon( "radiotower_exit" );
    maps\_utility::trigger_wait( "trig_radiotower_rooftop_spawn", "script_noteworthy" );
    var_1 maps\_utility::spawn_ai();
}

_id_BA3F( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 maps\_utility::waittill_player_lookat( 0.6, undefined, 1, 5.0 );
}

_id_C5D4()
{
    var_0 = getent( "trig_killspawner_radiotower_hiding_door_guy", "targetname" );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = ( 4374.0, 1252.0, 1060.0 );
    var_4 = getentarray( "hiding_door_spawner", "script_noteworthy" );
    var_1 = common_scripts\utility::getclosest( var_3, var_4 );
    var_5 = level._id_C07A;
    var_6 = common_scripts\utility::getclosest( var_3, var_5 );
    thread _id_CF7F( var_1, var_0 );
    level endon( "radiotower_hiding_door_guy_cleanup_cancel" );
    var_0 waittill( "trigger" );
    var_6 delete();
}

_id_CF7F( var_0, var_1 )
{
    var_1 endon( "trigger" );
    var_0 waittill( "trigger" );
    level notify( "radiotower_hiding_door_guy_cleanup_cancel" );
}

_id_D206( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( var_0 )
    {
        common_scripts\_exploder::exploder( "fence_ambient" );
        thread _id_D0BD();
    }
}

_id_AADB()
{
    common_scripts\utility::flag_wait( "radiotower_vehicles_start" );
    thread _id_D0A6();
}

_id_D0A6()
{
    var_0 = maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 0 );
    var_1 = var_0[0];
    common_scripts\_exploder::exploder( 110 );
    common_scripts\_exploder::exploder( 120 );
    var_1 thread _id_B41D();
    var_1 thread _id_C742();
    var_2 = getvehiclenode( "node_technical_bust_gate", "script_noteworthy" );
    var_2 waittill( "trigger" );
    common_scripts\utility::flag_set( "radiotower_escape_technical_1_arrival" );
    level thread _id_D206();
    maps\_utility::delaythread( 2, ::_id_C8C1 );
    maps\_utility::delaythread( 5, ::_id_C867 );
}

_id_C742()
{
    _id_B6D4();
    var_0 = [];
    var_0 = common_scripts\utility::getstructarray( "struct_radiotower_vehicle1_road_badplaceRef", "targetname" );
    var_0[var_0.size] = common_scripts\utility::getstruct( "struct_radiotower_vehicle1_donut_badplaceRef", "targetname" );
    var_1 = [];

    foreach ( var_5, var_3 in var_0 )
    {
        var_4 = "vehicle1_badplace_" + var_5;
        badplace_cylinder( var_4, -1, maps\_utility::groundpos( var_3.origin ), var_3.radius, 128, "axis", "allies" );
        var_1[var_1.size] = var_4;
    }

    while ( !common_scripts\utility::flag( "radiotower_vehicle1_donut_done" ) && self.health > 0 && self vehicle_getspeed() > 1 )
        wait 0.1;

    foreach ( var_7 in var_1 )
        badplace_delete( var_7 );
}

_id_C8C1()
{
    var_0 = maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 1 );
    var_1 = var_0[0];
    common_scripts\utility::flag_set( "pickup2_spawned" );
    var_1 thread _id_B41D();
    var_2 = getvehiclenode( "vnode_technical2_arrival", "script_noteworthy" );
    var_2 waittill( "trigger" );
    common_scripts\utility::flag_set( "radiotower_escape_technical_2_arrival" );
}

_id_B41D()
{
    waittillframeend;
    maps\_utility::ent_flag_init( "reached_end_node" );
    maps\_utility::ent_flag_init( "stopped" );
    thread _id_B3E4();
    thread _id_CF36();
    var_0 = _id_BBA4();
    var_0 _meth_8583();
    maps\_utility::ent_flag_init( "godoff" );
    thread _id_CD32( var_0 );
    var_1 = self.mgturret[0];
    var_1 thread _id_D567( self, var_0 );
}

_id_B3E4()
{
    self endon( "death" );
    self waittill( "reached_end_node" );
    maps\_utility::ent_flag_set( "reached_end_node" );
}

_id_CF36()
{
    self endon( "death" );
    _id_B6D4();

    while ( self vehicle_getspeed() > 0 )
        wait 0.05;

    maps\_utility::ent_flag_set( "stopped" );
}

_id_BBA4()
{
    var_0 = undefined;

    foreach ( var_2 in self.riders )
    {
        var_3 = maps\_vehicle_aianim::anim_pos( self, var_2.vehicle_position );

        if ( maps\_vehicle_aianim::guy_should_man_turret( var_3 ) )
        {
            var_0 = var_2;
            break;
        }
    }

    return var_0;
}

_id_CD32( var_0 )
{
    self._id_C9B8 = 0;
    var_1 = self.riders;
    common_scripts\utility::array_thread( var_1, maps\_utility::magic_bullet_shield, 1 );

    foreach ( var_3 in var_1 )
    {
        var_3.health = 10000000;
        var_3.threatbias = -2500;
        var_3.attackeraccuracy = 0.5;
        var_3 thread _id_B4DD( self, var_0 );
    }

    thread maps\_vehicle::godon();
    _id_B6D4();
    thread _id_BDA5();
    thread _id_C50B();

    while ( isdefined( self ) && !self._id_C9B8 && !maps\_utility::ent_flag( "godoff" ) )
        wait 0.05;

    if ( isdefined( self ) )
    {
        thread maps\_vehicle::godoff();
        vehicle_set_health( 1500 );
        self notify( "technical_health_reset" );
    }
}

_id_B4DD( var_0, var_1 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0 maps\_utility::ent_flag_wait( "godoff" );
    self.allowdeath = 1;

    if ( isdefined( var_1 ) && self == var_1 )
        self.health = 1;
    else
        self.health = 150;

    thread _id_AB1C();
}

vehicle_set_health( var_0 )
{
    self.health = var_0 + self.healthbuffer;
    self.currenthealth = self.health;
}

_id_BDA5()
{
    self endon( "death" );
    self endon( "technical_health_reset" );
    _id_B5F8();
    self._id_C9B8 = 1;
}

_id_C50B()
{
    self endon( "death" );
    self endon( "technical_health_reset" );
    _id_B82E();
    self._id_C9B8 = 1;
}

_id_B5F8()
{
    self endon( "death" );
    self waittill( "reached_end_node" );
}

_id_B82E()
{
    self endon( "death" );
    self endon( "technical_health_reset" );

    while ( self vehicle_getspeed() > 2 )
        wait 0.1;
}

_id_B6D4()
{
    self endon( "death" );
    self endon( "technical_health_reset" );

    while ( self vehicle_getspeed() < 1 )
        wait 0.1;
}

_id_D567( var_0, var_1 )
{
    self endon( "death" );
    var_1 thread _id_B79A();
    var_1 waittill( "death" );
    var_0 maps\_utility::ent_flag_wait_either( "reached_end_node", "stopped" );
    self makeusable();
}

_id_BCC1( var_0, var_1 )
{
    self endon( "death" );
    var_1 endon( "death" );
    self turretfiredisable();
    var_0 waittillmatch( "noteworthy", "vnode_technical_turret_activate" );
    self turretfireenable();
}

_id_B79A()
{
    self endon( "death" );
    level waittill( "kill_technical_gunners" );
    _id_AB1C();
    self kill();
}

_id_C867()
{
    var_0 = getent( "sbmodel_technical_jump_helper", "targetname" );
    var_0 common_scripts\utility::trigger_off();
}

_id_B5DF()
{
    thread _id_AA04();
    thread _id_BB72();
    level._id_C947 dialogue( "favesc_gst_deadahead" );
    level._id_BAD2 dialogue( "favesc_cmt_thrugate" );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_wait( "radiotower_escape_technical_1_arrival" );
    maps\_utility::battlechatter_off( "allies" );
    level._id_C947 dialogue( "favesc_gst_technical" );
    common_scripts\utility::flag_wait( "radiotower_escape_technical_2_arrival" );
    level._id_BAD2 dialogue( "favesc_cmt_technical" );
    maps\_utility::battlechatter_on( "allies" );
}

_id_AA04()
{
    level endon( "radiotower_exit" );
    maps\_utility::trigger_wait( "trig_radiotower_rooftop_spawn", "script_noteworthy" );
    level._id_C947 dialogue( "favesc_gst_onrooftops" );
}

_id_BB72()
{
    level endon( "radiotower_exit" );
    maps\_utility::trigger_wait_targetname( "trig_radiotower_walljumper_spawn" );
    level._id_BAD2 dialogue( "favesc_cmt_lowfromse" );
}

_id_CE50()
{
    common_scripts\utility::flag_wait( "radiotower_escape_technical_2_arrival" );

    while ( _id_D02E().size >= 6 )
        wait 0.1;

    var_0 = getentarray( "trig_radiotower_cleanup_at_exit", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_off );
    _id_B082( "trig_killspawner_7" );
    var_1 = _id_D02E();
    var_2 = [];
    var_3 = [];

    foreach ( var_5 in var_1 )
    {
        if ( var_5.origin[0] > 3600 )
        {
            if ( var_5.origin[2] > 1140 )
            {
                var_3[var_3.size] = var_5;
                continue;
            }

            var_2[var_2.size] = var_5;
        }
    }

    common_scripts\utility::flag_set( "radiotower_enemies_retreat" );
    level thread _id_C540( var_3, 10 );
    level notify( "kill_technical_gunners" );

    foreach ( var_5 in var_2 )
        var_5 setgoalpos( var_5.origin );

    wait 0.05;
    var_9 = getent( "goalvolume_52", "targetname" );
    var_2 = common_scripts\utility::array_removeundefined( var_2 );
    var_2 = maps\_utility::array_removedead( var_2 );
    thread common_scripts\utility::array_call( var_2, ::setgoalvolumeauto, var_9 );
    level._id_BAD2 dialogue( "favesc_cmt_thruthatgate" );
    level._id_C947 dialogue( "favesc_gst_gogogo" );
    common_scripts\utility::flag_set( "radiotower_escape_moveup" );
    var_10 = getentarray( "trig_radiotower_escape_removeAtExit", "targetname" );
    common_scripts\utility::array_thread( var_10, common_scripts\utility::trigger_off );
    _id_B082( "trig_radiotower_forcecolor_change_1" );

    if ( !common_scripts\utility::flag( "market_respawn_trigger" ) )
    {
        var_11 = getent( "trig_script_color_allies_b5", "targetname" );

        if ( isdefined( var_11 ) )
            var_11 notify( "trigger" );
    }
}

_id_B683()
{
    thread _id_C5A9();
    thread _id_CB4A();
    common_scripts\utility::flag_wait( "vista1_dialogue_start" );
    level._id_BAD2 dialogue( "favesc_cmt_pushthrustreets" );
    common_scripts\utility::flag_wait( "multipath_dialogue_start" );
    level._id_BAD2 dialogue( "favesc_cmt_flankingroutes" );
    common_scripts\utility::flag_wait( "almostatmarket_dialogue_start" );
    level._id_BAD2 dialogue( "favesc_cmt_almostatmarket" );
}

_id_C5A9()
{
    level endon( "playerabove_dialogue_cancel" );
    common_scripts\utility::flag_wait( "playerabove_dialogue_start" );
    level._id_BAD2 dialogue( "favesc_cmt_laydownfire" );
}

_id_CB4A()
{
    common_scripts\utility::flag_wait( "leftalley_dialogue_start" );
    level._id_BAD2 thread dialogue( "favesc_cmt_alleyonleft" );
}

init_fx_alphathreshold()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "alphathreshold_activate" );
        common_scripts\utility::flag_clear( "alphathreshold_deactivate" );
        setsaveddvar( "fx_alphathreshold", 3 );
        common_scripts\utility::flag_wait( "alphathreshold_deactivate" );
        common_scripts\utility::flag_clear( "alphathreshold_activate" );
        setsaveddvar( "fx_alphathreshold", 0 );
    }
}

_id_AA21()
{
    maps\_utility::trigger_wait_targetname( "trig_vista1_doorkick1" );
    var_0 = common_scripts\utility::getstruct( "struct_vista1_doorkick1_sighttracer", "targetname" );
    var_0 maps\_utility::waittill_player_lookat_for_time( 1.5, 0.7 );
    var_1 = getent( "sbmodel_vista1_door1", "targetname" );
    var_2 = common_scripts\utility::getstruct( "struct_vista1_door1_animref", "targetname" );
    var_3 = getentarray( "spawner_vista1_door1_houseguy", "targetname" );
    thread _id_ACE3( var_3, var_1, var_2 );
}

_id_B61B()
{
    level endon( "multipath_dialogue_start" );
    common_scripts\utility::flag_wait( "street_advance_1" );
    var_0 = common_scripts\utility::getstruct( "struct_vista1_wavingguy_animref", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = "favela_run_and_wave";
    var_3 = var_1 maps\_utility::spawn_ai();
    var_3.ignoreme = 1;
    var_3.ignoreall = 1;
    var_3 thread maps\_utility::magic_bullet_shield();
    var_0 maps\_anim::anim_generic_first_frame( var_3, var_2 );
    var_3 thread _id_AC75();
    maps\_utility::trigger_wait_targetname( "trig_vista1_wavingguy" );
    thread _id_ABFE( "trig_vista1_wavingguy_spawngroup" );
    var_3 maps\_utility::stop_magic_bullet_shield();
    var_3.allowdeath = 1;
    var_3 notify( "wavingguy_activated" );
    var_3 thread maps\_utility::play_sound_on_entity( "favesc_pe1_attack" );
    var_0 maps\_anim::anim_generic( var_3, var_2 );

    if ( isalive( var_3 ) )
    {
        var_3.ignoreme = 0;
        var_3.ignoreall = 0;
        var_4 = getnode( var_3.target, "targetname" );
        var_3 setgoalnode( var_4 );
    }
}

_id_AC75()
{
    self endon( "death" );
    self endon( "wavingguy_activated" );
    common_scripts\utility::flag_wait( "multipath_dialogue_start" );
    maps\_utility::stop_magic_bullet_shield();
    self delete();
}

_id_B7E2()
{
    _id_AF01( "trig_street_roof1_doorkick" );
    var_0 = getentarray( "spawner_street_roof1_doorkick", "targetname" );
    var_1 = getent( "sbmodel_street_roof1_doorkick", "targetname" );
    var_2 = common_scripts\utility::getstruct( "struct_street_roof1_doorkick_animref", "targetname" );
    thread _id_ACE3( var_0, var_1, var_2 );
}

_id_D293()
{
    common_scripts\utility::flag_wait( "uphill_advance_3" );
    thread _id_D3C8();
    var_0 = getentarray( "volume_enemies_street_mid_intersection", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_AF0B );
}

_id_D3C8()
{
    var_0 = maps\_utility::get_ai_group_ai( "street_mid_inside_guys" );
    common_scripts\utility::array_thread( var_0, ::kill_when_player_not_looking );
}

_id_AF0B()
{
    level endon( "market_evac_start" );
    var_0 = _id_BB22( 5 );

    for (;;)
    {
        wait(randomfloatrange( 0.5, 1 ));
        var_1 = maps\_utility::get_ai_touching_volume( "axis", "human" );

        foreach ( var_3 in var_1 )
        {
            if ( !isalive( var_3 ) )
                continue;

            if ( var_3 maps\_utility::doinglongdeath() )
                continue;

            if ( isdefined( var_3._id_C4B5 ) )
            {
                if ( gettime() > var_3._id_C4B5 + var_0 && !isdefined( var_3._id_C27C ) )
                {
                    var_3._id_C27C = 1;
                    var_3 thread kill_when_player_not_looking();
                }

                continue;
            }

            var_3._id_C4B5 = gettime();
            var_3.health = 1;
            var_3.attackeraccuracy = 1;
        }
    }
}

kill_when_player_not_looking()
{
    self endon( "death" );

    while ( common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), self.origin, level.cosine["45"] ) )
        wait(randomfloatrange( 0.5, 2 ));

    _id_B190::_id_D55F( self );
    self kill();
}

_id_ABD0()
{
    maps\_utility::trigger_wait_targetname( "trig_vista2_truckstart" );
    thread _id_D237();
}

_id_D237()
{
    var_0 = maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 3 );
    var_1 = var_0[0];
    var_1 thread _id_B41D();
}

_id_C647()
{
    maps\_utility::trigger_wait_targetname( "trig_vista2_endhouse_clearout" );
    var_0 = getent( "vista2_endhouse_goalvolume", "targetname" );
    var_1 = getaiarray( "axis" );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( var_4 istouching( var_0 ) )
            var_2[var_2.size] = var_4;
    }

    if ( !var_2.size )
        return;

    var_6 = var_2[0];
    var_7 = getnode( "node_vista2_endhouse_firespot", "targetname" );
    var_8 = getent( "org_vista2_endhouse_nadetarget", "targetname" );
    var_9 = common_scripts\utility::getstruct( "street_vista2_jumpthru_animref", "targetname" );
    var_10 = getnode( "node_vista2_endhouse_windowjumper_target", "targetname" );
    var_11 = level._id_C947;
    var_12 = var_11.primaryweapon;
    var_11 thread maps\_utility::forceuseweapon( "m79", "primary" );
    var_13 = var_11 maps\_utility::get_force_color();
    var_11 _id_B92A( 64 );
    var_11 ignore_everything();
    var_11 maps\_utility::clear_force_color();
    var_11 allowedstances( "stand" );
    var_11 setgoalnode( var_7 );
    var_11 waittill( "goal" );

    if ( isalive( var_6 ) )
    {
        var_6 thread maps\_utility::magic_bullet_shield( 1 );
        var_9 = common_scripts\utility::getstruct( "street_vista2_jumpthru_animref", "targetname" );
        var_14 = "traverse_window_M_2_dive";
        var_6.animname = "generic";
        var_15 = var_6 maps\_utility::getanim( var_14 );
        var_16 = getstartorigin( var_9.origin, var_9.angles, var_15 );
        var_17 = getstartangles( var_9.origin, var_9.angles, var_15 );
        var_6 forceteleport( var_16, var_17 );
        var_11 setentitytarget( var_8 );
        wait 1;
        var_11 shoot( 1.0, var_8.origin );
        var_6 maps\_utility::delaythread( 1.5, maps\_utility::stop_magic_bullet_shield );
        var_6 maps\_utility::delaythread( 2, maps\_utility::set_allowdeath, 1 );
        var_9 thread maps\_anim::anim_generic( var_6, var_14 );
        wait(getanimlength( var_15 ));
    }

    if ( isalive( var_6 ) )
        var_6 setgoalnode( var_10 );

    var_11 clearentitytarget();
    var_11 allowedstances( "stand", "crouch", "prone" );
    var_11 maps\_utility::set_force_color( var_13 );
    var_11 _id_B97F();
    var_11 _id_BB10();
    var_11 maps\_utility::delaythread( 5, maps\_utility::forceuseweapon, var_12, "primary" );
}

_id_D4A3()
{
    var_0 = getent( "volume_vista2_retreat", "targetname" );
    maps\_utility::trigger_wait_targetname( "trig_vista2_truckstart" );
    var_1 = maps\_utility::get_ai_group_ai( "vista2_firsthalf_enemies" );

    foreach ( var_3 in var_1 )
        var_3 setgoalvolumeauto( var_0 );
}

_id_C6E9()
{
    level endon( "vista2_leftbalcony_deathflag" );
    common_scripts\utility::flag_wait( "market_advance_1" );
    var_0 = [];
    var_0[0] = ( -1064.0, 1340.0, 1254.0 );
    var_0[1] = ( -1156.0, 1380.0, 1254.0 );

    foreach ( var_2 in var_0 )
        magicgrenade( "fraggrenade", var_2, maps\_utility::groundpos( var_2 ), randomfloat( 0.25 ) );
}

_id_B7B4()
{
    thread _id_BC65();
    thread _id_CCC9();
    common_scripts\utility::flag_wait( "market_dialogue_start" );
    wait 2;
    level._id_BAD2 dialogue( "favesc_cmt_splitup" );
    common_scripts\utility::flag_set( "market_introdialogue_done" );
}

_id_BC65()
{
    maps\_utility::trigger_wait_targetname( "trig_market_chaoticaboves_1" );
    common_scripts\utility::flag_wait( "market_introdialogue_done" );
    level._id_C947 dialogue( "favesc_gst_firingblind" );
}

_id_CCC9()
{
    maps\_utility::trigger_wait_targetname( "trig_market_door1" );

    if ( !common_scripts\utility::flag( "market_introdialogue_done" ) )
        common_scripts\utility::flag_wait( "market_introdialogue_done" );
    else
        wait 2;

    level._id_BAD2 dialogue( "favesc_cmt_shackonright" );
}

_id_D0F7()
{
    maps\_utility::trigger_wait_targetname( "trig_market_door1" );
    level notify( "kill_hidden_reinforcement_waiting" );
    var_0 = _id_B562();
    var_1 = var_0[0];

    if ( isdefined( var_1 ) )
        var_1 maps\_utility::set_force_color( "p" );

    if ( var_0.size > 1 )
    {
        var_0 = common_scripts\utility::array_remove( var_0, var_1 );
        common_scripts\utility::array_thread( var_0, ::_id_AD97 );
        common_scripts\utility::array_thread( var_0, maps\_utility::disable_replace_on_death );
        common_scripts\utility::array_thread( var_0, ::_id_ACC7, 1 );
        common_scripts\utility::array_thread( var_0, ::_id_B7AF, 10, 10 );
        maps\_utility::trigger_wait_targetname( "trig_market_redshirts_remove_failsafe" );
        var_0 = maps\_utility::array_removedead( var_0 );
        common_scripts\utility::array_thread( var_0, maps\_utility::disable_ai_color );
    }
}

_id_CC88()
{
    maps\_utility::trigger_wait_targetname( "trig_market_redshirts_remove_failsafe" );
    level._id_C947 maps\_utility::set_force_color( "b" );
}

_id_C6E6()
{
    maps\_utility::trigger_wait_targetname( "trig_market_door1" );
    var_0 = getentarray( "spawner_market_door_1", "targetname" );
    var_1 = getent( "sbmodel_market_door_1", "targetname" );
    var_2 = common_scripts\utility::getstruct( "struct_physicsref_market_door1", "targetname" );
    var_3 = common_scripts\utility::getstruct( "struct_animref_market_door1_kick", "targetname" );
    _id_ACE3( var_0, var_1, var_3, var_2 );
}

_id_C41D()
{
    common_scripts\utility::flag_wait( "market_evac_insidepath_start" );
    maps\_utility::battlechatter_off( "allies" );
    level._id_BAD2 dialogue( "favesc_cmt_immediatedustoff" );
    maps\_utility::radio_dialogue( "favesc_nkl_notfastenough" );
    level._id_BAD2 dialogue( "favesc_cmt_pickuppace" );
    common_scripts\utility::flag_wait( "market_evac_chopper_incoming" );
    maps\_utility::radio_dialogue( "favesc_nkl_toohot" );
    maps\_utility::delaythread( 2, ::_id_D5C8 );
    level._id_BAD2 dialogue( "favesc_cmt_waveoff" );
    maps\_utility::radio_dialogue( "favesc_nkl_meetyouthere" );
}

_id_AC95( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = [];

    if ( var_1 )
        var_2 = maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( var_0 );
    else
        var_2 = maps\_vehicle::scripted_spawn( var_0 );

    var_3 = var_2[0];
    var_3.health = 2000000;
    missile_createrepulsorent( var_3, 1150, 850 );
    return var_3;
}

_id_CACA()
{
    var_0 = _id_AC95( 4 );
    level.chopper = var_0;
    thread _id_B4CA( 0, "heli_loop", 10 );
    common_scripts\utility::flag_set( "market_chopper_spawned" );
    var_0 setmaxpitchroll( 30, 40 );
    var_0 thread maps\favela_escape_aud::_id_D230();
    common_scripts\utility::flag_wait( "market_evac_player_near_soccerfield" );
    level.chopper delete();
    var_0 = _id_AC95( 6, 0 );
    level.chopper = var_0;
    thread _id_B4CA( 0, "warbird_flyby", 6 );
    thread _id_B4CA( 6, "heli_loop", 9 );
    common_scripts\utility::flag_set( "market_evac_chopper_spawned" );
    var_1 = common_scripts\utility::getstruct( "struct_market_evac_chopper_path2", "targetname" );
    var_0 thread _id_C97F( var_1 );
}

_id_C97F( var_0 )
{
    thread maps\favela_escape_aud::_id_C1C9();
    common_scripts\utility::flag_set( "market_evac_chopper_incoming" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_3 = common_scripts\utility::getstruct( var_2.target, "targetname" );
    var_4 = common_scripts\utility::getstruct( var_3.target, "targetname" );
    self vehicle_setspeedimmediate( 30 );
    self vehicle_setspeed( 30, 15, 5 );
    self setvehgoalpos( var_1.origin, 1 );
    self setmaxpitchroll( 30, 25 );
    self neargoalnotifydist( 256 );
    self waittill( "near_goal" );
    self setgoalyaw( var_1.angles[1] );
    self waittill( "goal" );
    thread maps\_utility::play_sound_on_entity( "scn_favela_escape_heli_leave" );
    wait 1;
    common_scripts\utility::flag_set( "market_evac_chopper_bugout" );
    self setvehgoalpos( var_2.origin );
    self vehicle_setspeed( 60, 10 );
    self neargoalnotifydist( 600 );
    self waittill( "near_goal" );
    self setvehgoalpos( var_3.origin );
    common_scripts\utility::flag_set( "market_evac_chopper_leaves_scene" );
    maps\_utility::delaythread( 4, ::_id_C2B9 );
    self waittill( "near_goal" );
    self setvehgoalpos( var_4.origin );
    self waittill( "goal" );
    self notify( "death" );
    self delete();
    level.chopper = undefined;
}

_id_A9FB()
{
    common_scripts\utility::flag_wait( "market_evac_insidepath_start" );
    var_0 = "market_evac_ambush_start";
    var_1 = [];
    var_1[var_1.size] = "favesc_pe1_youhearme";
    var_1[var_1.size] = "favesc_pe2_callthetruck";
    var_1[var_1.size] = "favesc_pe3_killslowly";
    var_1[var_1.size] = "favesc_pe3_cantstop";
    var_1[var_1.size] = "favesc_pe2_morerockets";
    var_1[var_1.size] = "favesc_pe4_wellfindyou";
    var_1[var_1.size] = "favesc_pe1_keepthemalive";
    var_2 = 3.5;
    var_3 = 8;
    var_4 = 13;
    var_5 = common_scripts\utility::getstructarray( "struct_market_evac_foreshadow_dialoguespot", "targetname" );
    var_6 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    wait(randomfloat( var_2 ));

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        var_1 = common_scripts\utility::array_randomize( var_1 );
        var_5 = common_scripts\utility::array_randomize( var_5 );
        var_7 = 0;

        foreach ( var_9 in var_1 )
        {
            if ( common_scripts\utility::flag( var_0 ) )
                break;

            var_6.origin = var_5[var_7].origin;
            var_6 playsound( var_9, "sound_done" );
            var_6 waittill( "sound_done" );

            if ( var_7 == var_5.size - 1 )
                var_7 = 0;
            else
                var_7++;

            wait(randomfloatrange( var_3, var_4 ));
        }
    }

    var_6 delete();
}

_id_C12F()
{
    var_0 = common_scripts\utility::getstructarray( "market_evac_ambush_rpg_firespot", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_C518, "market_evac_chopper_leaves_scene" );
}

_id_C518( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self.script_flag ) )
            var_0 = self.script_flag;
    }

    if ( var_0 == "none" )
        return;

    var_1 = self;
    var_2 = level._id_CD18;
    var_3 = 5;
    var_4 = 12;
    var_5 = 0.1;
    var_6 = 0.15;
    var_7 = 0.5;
    var_8 = 1;
    var_9 = var_1.origin;

    while ( !common_scripts\utility::flag( var_0 ) && isdefined( level.chopper ) )
    {
        var_10 = _id_D5AF( var_2 );
        var_11 = randomintrange( 5, 12 );

        for ( var_12 = 0; var_12 < var_11; var_12++ )
        {
            if ( !isdefined( level.chopper ) )
                break;

            var_13 = level.chopper.origin[0] + randomintrange( -256, 256 );
            var_14 = level.chopper.origin[1] + randomintrange( -256, 256 );
            var_15 = level.chopper.origin[2] + randomintrange( -256, 0 );
            var_16 = ( var_13, var_14, var_15 );
            var_17 = vectortoangles( var_16 - var_9 );
            var_18 = anglestoforward( var_17 );
            var_19 = var_18 * 12;
            var_20 = var_9 + var_19;
            var_21 = bullettrace( var_1.origin, var_20, 1 );
            var_22 = var_21["entity"];

            if ( isdefined( var_22 ) )
            {
                if ( isdefined( level._id_BAD2 ) )
                {
                    if ( var_22 == level._id_BAD2 )
                        continue;
                }

                if ( isplayer( var_22 ) )
                    continue;
            }

            magicbullet( var_10, var_1.origin, var_20 );
            wait(randomfloatrange( var_5, var_6 ));
        }

        wait(randomfloatrange( var_7, var_8 ));
    }
}

_id_B3AC()
{
    var_0 = common_scripts\utility::getstructarray( "market_evac_ambush_rpg_firespot", "targetname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3.script_start ) )
            var_1[var_1.size] = var_3;
    }

    var_5 = var_1.size - 1;

    for ( var_6 = 0; var_6 < var_5; var_6++ )
    {
        for ( var_7 = 0; var_7 < var_5 - var_6; var_7++ )
        {
            if ( var_1[var_7 + 1].script_start < var_1[var_7].script_start )
            {
                var_8 = var_1[var_7];
                var_1[var_7] = var_1[var_7 + 1];
                var_1[var_7 + 1] = var_8;
            }
        }
    }

    var_0 = common_scripts\utility::array_remove_array( var_0, var_1 );
    var_0 = common_scripts\utility::array_randomize( var_0 );

    foreach ( var_3 in var_0 )
        var_1[var_1.size] = var_3;

    foreach ( var_3 in var_1 )
    {
        var_12 = common_scripts\utility::getstruct( var_3.target, "targetname" );
        var_13 = magicbullet( "rpg_straight", var_3.origin, var_12.origin );
        var_13 thread maps\_utility::play_loop_sound_on_tag( "scn_evac_rpg_loop", undefined, 1 );
        wait(randomfloatrange( 0.8, 1.5 ));
    }

    while ( !common_scripts\utility::flag( "market_evac_chopper_leaves_scene" ) && isdefined( level.chopper ) )
    {
        var_1 = common_scripts\utility::array_randomize( var_1 );

        foreach ( var_3 in var_1 )
        {
            if ( common_scripts\utility::flag( "market_evac_chopper_leaves_scene" ) || !isdefined( level.chopper ) )
                break;

            if ( player_can_see( var_3.origin ) )
            {
                wait 0.05;
                continue;
            }

            var_12 = level.chopper;
            var_13 = magicbullet( "rpg_straight", var_3.origin, var_12.origin );
            var_13 thread maps\_utility::play_loop_sound_on_tag( "scn_evac_rpg_loop", undefined, 1 );
            wait(randomfloatrange( 0.8, 1.5 ));
        }
    }

    soundscripts\_snd::snd_message( "stop_evac_fakefire_rpgs" );
}

_id_B6B5()
{
    var_0 = level._id_C058;

    foreach ( var_2 in var_0 )
    {
        var_2 disconnectpaths();
        var_2 delete();
    }
}

_id_AA08()
{
    var_0 = getentarray( "ai_market_evac_ambusher", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_AE54 );
    wait 1.5;
    _id_ABFE( "trig_market_evac_spawn1" );
    common_scripts\utility::flag_init( "housespawners_done" );
    maps\_utility::delaythread( 9, ::_id_AABA );
    common_scripts\utility::flag_wait( "housespawners_done" );
    wait 0.05;
    var_1 = 2;

    for (;;)
    {
        var_2 = _id_C13D();
        var_3 = 0;

        foreach ( var_5 in var_2 )
        {
            if ( isalive( var_5 ) && !var_5 maps\_utility::doinglongdeath() )
                var_3++;
        }

        if ( var_3 <= var_1 )
            break;
        else
            wait 0.1;
    }

    var_7 = _id_C13D();
    level thread _id_C540( var_7, 4 );
    common_scripts\utility::flag_set( "market_evac_enemies_depleted" );
}

_id_C13D()
{
    var_0 = getaiarray( "axis" );
    var_0 = maps\_utility::array_removedead( var_0 );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3.script_noteworthy ) && var_3.script_noteworthy == "ai_market_evac_ambusher" )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_AE54()
{
    self endon( "death" );
    self.baseaccuracy *= 0.35;

    if ( isdefined( level.chopper ) )
        self setentitytarget( level.chopper, 0.4 );

    wait 15;
    _id_AAF7();
}

_id_AABA()
{
    var_0 = getentarray( "spawner_market_evac_door1", "targetname" );
    var_1 = getentarray( "spawner_market_evac_door2", "targetname" );
    var_2 = getentarray( "spawner_market_evac_door3", "targetname" );
    var_3 = getent( "sbmodel_market_evac_door1", "targetname" );
    var_4 = getent( "sbmodel_market_evac_door2", "targetname" );
    var_5 = getent( "sbmodel_market_evac_door3", "targetname" );
    var_6 = common_scripts\utility::getstruct( "struct_animref_market_evac_kick_door1", "targetname" );
    var_7 = common_scripts\utility::getstruct( "struct_animref_market_evac_kick_door2", "targetname" );
    var_8 = common_scripts\utility::getstruct( "struct_animref_market_evac_kick_door3", "targetname" );
    thread _id_ACE3( var_2, var_5, var_8 );
    maps\_utility::delaythread( 2, ::_id_ACE3, var_0, var_3, var_6 );
    maps\_utility::delaythread( 4, ::_id_ACE3, var_1, var_4, var_7 );
    wait 6;
    common_scripts\utility::flag_set( "housespawners_done" );
}

_id_AB78()
{
    var_0 = "market_evac_player_on_roof";
    level endon( var_0 );
    var_1 = [];
    var_1[var_1.size] = "favesc_cmt_getuphere";
    var_1[var_1.size] = "favesc_cmt_climbup";
    var_1[var_1.size] = "favesc_cmt_climbuphere";

    while ( !common_scripts\utility::flag( var_0 ) && isdefined( level._id_BAD2 ) )
    {
        var_1 = common_scripts\utility::array_randomize( var_1 );

        foreach ( var_3 in var_1 )
        {
            while ( distance( level.player.origin, level._id_BAD2.origin ) < 256 )
                wait 1;

            if ( !common_scripts\utility::flag( var_0 ) )
            {
                level._id_BAD2 dialogue( var_3 );
                wait 20;
            }
        }
    }
}

_id_ADCB( var_0 )
{
    while ( level.player.origin[2] < var_0 )
        wait 0.05;

    common_scripts\utility::flag_set( "market_evac_player_mantled" );
}

_id_D3AC( var_0 )
{
    var_1 = getent( "trig_market_evac_mantlehelper", "targetname" );
    notifyoncommand( "mantle", "+gostand" );
    notifyoncommand( "mantle", "+moveup" );

    for (;;)
    {
        if ( level.player istouching( var_1 ) && !level.player canmantle() && level.player.origin[2] < var_0 )
        {
            thread _id_B45C( var_1 );

            while ( level.player istouching( var_1 ) )
            {
                level.player _id_CC63( var_1 );
                level.player forcemantle();
                setsaveddvar( "hud_forceMantleHint", 0 );

                while ( !level.player isonground() )
                    wait 0.05;

                break;
            }
        }
        else
            setsaveddvar( "hud_forceMantleHint", 0 );

        wait 0.05;
    }
}

_id_CC63( var_0 )
{
    self endon( "left_trigger" );
    thread _id_AC6B( var_0 );
    self waittill( "mantle" );
}

_id_AC6B( var_0 )
{
    self endon( "mantle" );

    while ( self istouching( var_0 ) )
        wait 0.05;

    self notify( "left_trigger" );
}

_id_AC08()
{
    level._id_BAD2 dialogue( "favesc_cmt_letsgoletsgo" );
    maps\_utility::radio_dialogue( "favesc_nkl_wholevillage" );
    level._id_BAD2 dialogue( "favesc_cmt_pickusup" );
    level._id_C947 dialogue( "favesc_gst_runoutofroof" );
    level.scr_sound["freerunner"]["favela_escape_bigjump_ghost"] = "favesc_gst_jumpsfx";
    level._id_BAD2 dialogue( "favesc_cmt_makeitgogo" );
    level.scr_sound["freerunner"]["favela_escape_bigjump_soap"] = "favesc_cmt_jumpsfx";

    if ( !common_scripts\utility::flag( "player_jump_watcher_stop" ) && !common_scripts\utility::flag( "player_fell_normally" ) )
        thread _id_B325();
}

_id_B325()
{
    level endon( "player_fell_normally" );
    level endon( "player_jump_watcher_stop" );
    var_0 = [];
    var_0[0] = "favesc_cmt_gettochopper";
    var_0[1] = "favesc_cmt_whatsholdup";
    var_0[2] = "favesc_cmt_getoutta";
    var_1 = 0;
    var_2 = 10000;
    var_3 = -1;

    for (;;)
    {
        wait 0.1;
        var_4 = 0;
        var_5 = 0;
        var_6 = level.player getvelocity();
        var_7 = distance( ( var_6[0], var_6[1], 0 ), ( 0.0, 0.0, 0.0 ) );

        if ( var_7 < 125 )
            var_4 = 1;

        if ( gettime() >= var_3 )
            var_5 = 1;

        if ( !var_4 || !var_5 )
            continue;

        level._id_BAD2 dialogue( var_0[var_1] );
        var_3 = gettime() + var_2;
        var_1++;

        if ( var_1 >= var_0.size )
            var_1 = 0;
    }
}

_id_BD67()
{
    while ( level._id_C958 < level._id_C2F8.size )
        wait 0.05;

    common_scripts\utility::flag_set( "roofrun_done" );
}

_id_C4F0()
{
    level._id_A87F.greenberet_disabled = 1;
    var_0 = level.player;
    var_1 = getent( "trig_roofrun_player_bigjump_start", "targetname" );
    var_2 = common_scripts\utility::getstruct( "struct_player_bigjump_edge_reference", "targetname" );
    var_3 = getnode( "big_jump_node", "targetname" );
    _id_C3B4( var_3 );
    var_4 = anglestoforward( var_2.angles );
    thread _id_AA6E();
    thread _id_BA94();
    level endon( "player_fell_normally" );

    for (;;)
    {
        var_5 = 0;

        while ( level.player istouching( var_1 ) )
        {
            common_scripts\utility::flag_wait( "player_jumping" );

            if ( _id_C180( var_1, var_4, 0.915, 1 ) )
            {
                var_5 = 1;
                break;
            }

            wait 0.05;
        }

        if ( var_5 )
            break;

        wait 0.05;
    }

    common_scripts\utility::flag_set( "player_jump_watcher_stop" );
    thread _id_C1F2();
    var_6 = getent( "trig_roofrun_playerjump_falltrig", "targetname" );
    var_6 delete();
    common_scripts\utility::flag_set( "roofrun_player_bigjump_start" );
    var_7 = getnode( "big_jump_node", "targetname" );
    var_8 = _id_D0A4( var_0, var_7 );
    thread _id_B4FD( var_8, var_3 );
    thread _id_A88A();
    setsaveddvar( "compass", 0 );
    setsaveddvar( "hud_showStance", 0 );
    var_8 waittillmatch( "single anim", "start_soap" );
    level.player freezecontrols( 1 );
    level.player allowcrouch( 1 );
    level._id_BAD2 thread _id_AA7D( 1 );

    if ( common_scripts\utility::flag( "roofrun_sarge_bigjumped" ) )
    {
        thread _id_B943();
        common_scripts\utility::flag_set( "bigjump_sargeplayer_interact_start" );

        if ( isdefined( level._id_BAD2._id_D34B ) )
            level._id_BAD2._id_D34B notify( "stop_loop" );

        var_7 thread maps\_anim::anim_single_solo( level._id_BAD2, "favela_escape_bigjump_soap_reach" );
    }

    thread _id_A979( var_8, var_3 );

    if ( common_scripts\utility::flag( "roofrun_sarge_bigjumped" ) )
    {
        level._id_BAD2 waittillmatch( "single anim", "end" );
        wait 1;
    }
    else
        wait 5;
}

_id_D0A4( var_0, var_1 )
{
    var_2 = "player_bigjump";
    var_3 = "jump";
    soundscripts\_snd::snd_message( "start_player_bigjump" );
    var_4 = maps\_utility::spawn_anim_model( var_2 );
    var_5 = var_4 maps\_utility::getanim( var_3 );
    var_6 = getstartorigin( var_1.origin, var_1.angles, var_5 );
    var_7 = getstartangles( var_1.origin, var_1.angles, var_5 ) - var_0.angles;
    var_8 = spawnstruct();
    var_8.angles = var_1.angles - var_7;
    var_9 = var_6 - var_0.origin;
    var_10 = var_1.origin - var_6;
    var_11 = var_10[0] * cos( var_7[1] ) - var_10[1] * sin( var_7[1] );
    var_12 = var_10[0] * sin( var_7[1] ) + var_10[1] * cos( var_7[1] );
    var_13 = var_10 - ( var_11, var_12, var_10[2] );
    var_8.origin = var_1.origin - var_9 + var_13;
    var_4 hide();
    var_8 maps\_anim::anim_first_frame_solo( var_4, var_3 );
    var_0 disableweapons( 1, 500 );
    var_0 allowcrouch( 0 );
    thread _id_AB9E();
    var_4 thread handle_player_big_jump_notetrack();
    var_0 playerlinktoblend( var_4, "tag_player", 0.5, 0.25, 0.25 );
    var_14 = "single anim";
    var_4 animscripted( var_14, var_8.origin, var_8.angles, var_5 );
    var_15 = getnotetracktimes( var_5, "start_roof_collapse" );
    var_16 = getanimlength( var_5 ) * var_15[0];
    var_4 thread maps\_anim::_id_B6DB( undefined, var_8, var_1, var_16 );
    wait 0.5;
    var_0 takeallweapons();
    var_0 playerlinktodelta( var_4, "tag_player", 1.0, 0, 0, 0, 0, 1 );
    var_4 show();
    return var_4;
}

handle_player_big_jump_notetrack()
{
    for (;;)
    {
        self waittill( "single anim", var_0 );

        if ( isdefined( var_0 ) )
        {
            var_1 = getsubstr( var_0, 0, 3 );

            if ( var_1 == "ps_" )
            {
                var_2 = getsubstr( var_0, 3 );
                self playsound( var_2 );
            }
            else if ( var_0 == "end" )
                return;
            else if ( var_0 == "webble" )
                common_scripts\utility::flag_set( "no_wobble_roof" );
        }
    }
}

_id_A88A()
{
    wait 1.25;
    level.player playrumblelooponentity( "artillery_rumble" );
    wait 0.25;
    var_0 = gettime() + _id_BB22( 0.4 );

    while ( gettime() < var_0 )
    {
        level.player playrumblelooponentity( "damage_light" );
        wait 0.115;
    }

    wait 0.1;
    level.player playrumblelooponentity( "artillery_rumble" );
}

_id_B943()
{
    wait 0.5;
    maps\_utility::slowmo_start();
    maps\_utility::slowmo_setspeed_slow( 0.3 );
    maps\_utility::slowmo_setlerptime_in( 0.15 );
    maps\_utility::slowmo_lerp_in();
    thread maps\favela_escape_aud::_id_AB0E();
    wait 0.6;
    maps\_utility::slowmo_setlerptime_out( 0.15 );
    maps\_utility::slowmo_lerp_out();
    maps\_utility::slowmo_end();
    thread maps\favela_escape_aud::_id_CE9D();
}

_id_BA94()
{
    level endon( "player_jump_watcher_stop" );
    var_0 = getent( "trig_roofrun_playerjump_falltrig", "targetname" );
    var_0 waittill( "trigger" );
    var_0 delete();
    common_scripts\utility::flag_set( "player_fell_normally" );
    var_1 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_1 fadeovertime( 0.2 );
    var_1.alpha = 1.0;
    soundscripts\_snd::snd_message( "start_player_normal_fall" );
    thread _id_A979();
    var_1 common_scripts\utility::delaycall( 2.0, ::destroy );
}

_id_A979( var_0, var_1 )
{
    var_2 = getent( "vista_end", "targetname" );
    var_3 = getentarray( "vista_end_water", "targetname" );
    var_3 = common_scripts\utility::array_add( var_3, var_2 );

    foreach ( var_5 in var_3 )
        var_5 show();

    var_7 = getent( "sky_favela_escape", "targetname" );
    var_7 delete();
    common_scripts\_exploder::exploder( "cloud_mountain_vista_favela_s" );
    common_scripts\_exploder::exploder( "cloud_mountain_vista_02_favela_s" );
    common_scripts\_exploder::exploder( "mist_ocean_vista_02_favela_s" );
    common_scripts\_exploder::exploder( "mist_ocean_vista_favela_s" );
    level.player disableoffhandweapons();

    if ( isdefined( var_0 ) )
        var_0 waittillmatch( "single anim", "blackout" );
    else
    {
        level.player enableinvulnerability();

        while ( !level.player isonground() )
            wait 0.05;

        maps\_utility::music_stop();
        level.player freezecontrols( 1 );
        level.player disableinvulnerability();
    }

    level.player _meth_80B5( "artillery_rumble" );
    level.player common_scripts\utility::delaycall( 1, ::_meth_80B6, "artillery_rumble" );
    var_8 = 6.5;
    thread _id_C5D6( var_8 );
    thread _id_A842( var_8 );
    var_9 = "favela_escape_player_recovery";
    level.player shellshock( var_9, var_8 + 0.1 );

    if ( !isdefined( var_1 ) )
        var_1 = getnode( "big_jump_node", "targetname" );

    setsaveddvar( "objectiveHide", 1 );
    level thread _id_CB76();
    var_10 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_10 fadeovertime( 0.1 );
    var_10.alpha = 1;
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player setstance( "stand" );
    common_scripts\utility::flag_set( "player_recovery_blackscreen" );
    level.player takeallweapons();
    var_11 = "player_bigjump";
    var_12 = "recover";
    var_13 = level.scr_anim[var_11][var_12];
    var_14 = getstartorigin( var_1.origin, var_1.angles, var_13 );
    var_15 = getstartangles( var_1.origin, var_1.angles, var_13 );

    if ( !isdefined( var_0 ) )
    {
        var_0 = maps\_utility::spawn_anim_model( "player_bigjump", var_14 );
        var_0.angles = var_15;
        level.player playerlinktoblend( var_0, "tag_player", 0.05 );
    }

    foreach ( var_17 in level._id_C2F8 )
    {
        var_17 notify( "stop_loop" );

        if ( isdefined( var_17._id_D34B ) )
            var_17._id_D34B notify( "stop_loop" );
    }

    maps\_utility::delaythread( 0.05, ::_id_CAF6 );
    var_19 = maps\_utility::get_vehicle( "veh_chopper_roofrun", "targetname" );

    if ( isdefined( var_19 ) )
        var_19 delete();

    thread maps\favela_escape_lighting::_id_C584( "favela_escape_playerfall_recovery" );
    wait(var_8);
    common_scripts\utility::flag_set( "player_bigjump_done" );
    var_1 thread maps\_anim::anim_single_solo( var_0, var_12 );
    var_20 = getanimlength( level.scr_anim["player_bigjump"]["recover"] );
    thread _id_BC7C( var_20 );
    thread _id_D16F( var_20, var_9 );
    thread _id_BC4F( level.player_rig );
    wait 0.3;
    setomnvar( "ui_consciousness_init", 1 );
    setsaveddvar( "ui_consciousnessVignetteDarkness", 0.5 );
    setomnvar( "ui_consciousness_play", 1 );
    maps\_utility::delaythread( var_20 - 2, ::_id_B632 );
    wait 0.25;
    var_10 fadeovertime( 0.5 );
    var_10.alpha = 0;
    var_0 waittillmatch( "single anim", "end" );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    thread maps\favela_escape_lighting::_id_C584( "favela_escape" );
    common_scripts\utility::flag_set( "player_recovery_done" );
    soundscripts\_snd::snd_message( "start_player_recovery_done" );
    var_10 destroy();
    level.player unlink();
    level.player freezecontrols( 0 );
    var_0 delete();
    setsaveddvar( "compass", 1 );
    setsaveddvar( "hud_showStance", 1 );
}

_id_BC7C( var_0 )
{
    var_1 = var_0 * 0.75;
    wait(var_1);
    common_scripts\utility::flag_set( "solorun_objective_display" );
    setsaveddvar( "objectiveHide", 0 );
}

_id_B3EE()
{
    setsaveddvar( "cg_fov", 30 );
    wait 5;
    maps\_utility::lerp_fov_overtime( 2, 40 );
    wait 2.2;
    maps\_utility::lerp_fov_overtime( 2, 65 );
}

_id_AB9E()
{
    var_0 = _id_D397::_id_A97A( "favela_escape_player_failjump" );
    var_0 _id_D397::_id_BEA0( 3.15 ) _id_D397::_id_AC9F( 53, 0.7, 0 );
    var_0 _id_D397::_id_BEA0( 4.0 ) _id_D397::_id_A9EC( 0.65, 0 );
    var_0 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 6.3 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 1.15 ) _id_D397::_id_C491( 8.0, 18, 32.0, 32.0 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 1.5 ) _id_D397::_id_C491( 6.0, -1, 8.0, 8.0 ) _id_D397::_id_AE01( 2.0 ) _id_D397::_id_CCA7( level._id_BAD2, "tag_eye" );
    var_0 _id_D397::_id_BEA0( 2.15 ) _id_D397::_id_C491( 4.0, 16, 6.0, 6.0 );
    var_0 _id_D397::_id_BEA0( 2.85 ) _id_D397::_id_C491( 3.0, -1, 3.0, 3.0 ) _id_D397::_id_AE01( 2.0 ) _id_D397::_id_CCA7( level._id_BAD2, "tag_eye" );
    var_0 _id_D397::_id_BEA0( 6.3 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 1.05 ) _id_D397::_id_B85E( 0.25, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.4 );
    var_0 _id_D397::_id_BEA0( 1.8 ) _id_D397::_id_B85E( 0.25, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 4.5 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BC26();
}

_id_BC4F( var_0 )
{
    var_1 = _id_D397::_id_A97A( "favela_escape_player_wakeup" );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( 40, 0.0, 0 );
    var_1 _id_D397::_id_BEA0( 2.85 ) _id_D397::_id_AC9F( 26, 1.3, 0 );
    var_1 _id_D397::_id_BEA0( 5.5 ) _id_D397::_id_AC9F( 35, 1.3, 0 );
    var_1 _id_D397::_id_BEA0( 8.3 ) _id_D397::_id_AC9F( 40, 0.85, 0 );
    var_1 _id_D397::_id_BEA0( 9.5 ) _id_D397::_id_A9EC( 2.0, 0 );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 5.0, 27, 16.0, 16.0 ) _id_D397::_id_AF9C();
    var_1 _id_D397::_id_BEA0( 2.85 ) _id_D397::_id_C491( 2.0, 1000, 3.0, 3.0 );
    var_1 _id_D397::_id_BEA0( 5.5 ) _id_D397::_id_C491( 2.0, 1100, 3.0, 3.0 );
    var_1 _id_D397::_id_BEA0( 8.3 ) _id_D397::_id_C491( 2.0, 1000, 3.0, 3.0 );
    var_1 _id_D397::_id_BEA0( 10.0 ) _id_D397::_id_C491( 16.0, 250, 0.7, 0.7 );
    var_1 _id_D397::_id_BEA0( 11.6 ) _id_D397::_id_BF3F();
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_1 _id_D397::_id_BEA0( 11.6 ) _id_D397::_id_BAE4( 0 );
    var_1 _id_D397::_id_BEA0( 2.2 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 2.6 ) _id_D397::_id_B85E( 0.08, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 _id_D397::_id_BEA0( 8.55 ) _id_D397::_id_B85E( 0.06, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 11.6 ) _id_D397::_id_B85E( 0.08, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BC26();
}

_id_B632()
{
    savegame( "bigjump_recovery", &"AUTOSAVE_AUTOSAVE" );
}

_id_AAB1( var_0 )
{
    var_1 = 175;
    var_2 = 300;
    var_3 = 425;
    var_4 = 80;
    var_5 = 90;
    var_6 = 95;
    var_7 = 1.2;
    var_8 = 1.4;
    var_9 = 1.5;
    var_10 = 0.5;
    var_11 = 850;
    var_12 = 75;

    while ( !common_scripts\utility::flag( "roofrun_done" ) )
    {
        var_13 = _id_CAAB( var_0 );
        var_14 = var_5;
        var_15 = var_8;

        if ( var_13 > var_3 )
        {
            var_14 = var_6;
            var_15 = var_9;
        }
        else
        {
            var_16 = _id_B91B( var_13, var_1, var_2 );
            var_17 = var_5 - var_4;
            var_18 = var_17 * ( 1 - var_16 );
            var_14 = var_5 - var_18;
            var_19 = var_8 - var_7;
            var_20 = var_19 * ( 1 - var_16 );
            var_15 = var_8 - var_20;

            if ( var_13 >= var_2 )
            {

            }
            else if ( var_13 <= var_1 )
            {

            }
        }

        maps\_utility::player_speed_percent( var_14, var_10 );
        _id_C1F3( var_15, var_10 );
        wait(var_10);
    }
}

_id_CAAB( var_0 )
{
    var_1 = level.player.origin;
    var_2 = var_0.origin + anglestoright( var_0.angles ) * -5000;
    var_3 = var_0.origin + anglestoright( var_0.angles ) * 5000;
    var_4 = pointonsegmentnearesttopoint( var_2, var_3, var_1 );
    return distance( var_1, var_4 );
}

_id_B91B( var_0, var_1, var_2 )
{
    if ( var_0 >= var_2 )
        return 1.0;

    if ( var_0 <= var_1 )
        return 0.0;

    var_3 = ( var_0 - var_1 ) / ( var_2 - var_1 );
    var_3 = clamp( var_3, 0.0, 1.0 );
    return var_3;
}

_id_C1F3( var_0, var_1 )
{
    var_2 = getdvarfloat( "player_sprintSpeedScale" );

    if ( isdefined( var_1 ) )
    {
        var_3 = var_0 - var_2;
        var_4 = 0.05;
        var_5 = var_1 / var_4;
        var_6 = var_3 / var_5;

        while ( abs( var_0 - var_2 ) > abs( var_6 * 1.1 ) )
        {
            var_2 += var_6;
            setsaveddvar( "player_sprintSpeedScale", var_2 );
            wait(var_4);
        }
    }

    setsaveddvar( "player_sprintSpeedScale", var_0 );
}

_id_B58A( var_0 )
{
    self endon( "death" );
    maps\_utility::ent_flag_wait( "roofrun_start" );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    maps\_utility::set_generic_run_anim( "freerunnerA_run" );

    if ( !var_0 )
    {
        var_1 = common_scripts\utility::getstruct( "roofrun_jump1", "targetname" );
        var_2 = "freerunnerA_sideslope";
        var_1 maps\_anim::anim_reach_solo( self, var_2 );
        var_1 maps\_anim::anim_single_run_solo( self, var_2 );
        _id_CCF1();
        var_3 = common_scripts\utility::getstruct( "roofrun_sarge_waitforplayer", "targetname" );
        self setgoalpos( var_3.origin );
        self waittill( "goal" );
    }
    else
        _id_CCF1();

    common_scripts\utility::flag_wait( "player_near_bigjump" );
    thread _id_B4CA( 0, "heli_loop", 5 );
    var_1 = getnode( "big_jump_node", "targetname" );
    var_2 = "favela_escape_bigjump_soap";
    self.a._id_C55F = 8;
    var_1 maps\_anim::anim_reach_solo( self, var_2 );
    self.a._id_C55F = undefined;
    self pushplayer( 0 );

    if ( !common_scripts\utility::flag( "roofrun_player_bigjump_start" ) )
    {
        common_scripts\utility::flag_set( "roofrun_sarge_bigjumped" );
        var_1 maps\_anim::anim_single_solo( self, var_2 );
        self setgoalpos( self.origin );

        if ( !common_scripts\utility::flag( "bigjump_sargeplayer_interact_start" ) )
        {
            var_2 = "favela_escape_bigjump_soap_loop";
            self._id_D34B = var_1;
            var_1 thread maps\_anim::anim_loop_solo( self, var_2, "stop_loop" );
        }
    }

    level._id_C958++;
}

_id_CCED( var_0 )
{
    self endon( "death" );
    var_1 = common_scripts\utility::getstruct( "roofrun_jump2", "targetname" );
    var_2 = "roofrun_laundry_2";
    var_3 = getent( "smodel_roofrun_sheet_right", "targetname" );
    thread _id_C04A( var_1, var_3, var_2 );
    maps\_utility::ent_flag_wait( "roofrun_start" );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    maps\_utility::set_generic_run_anim( "freerunnerB_run" );

    if ( !var_0 )
    {
        var_2 = "freerunnerB_mid";
        var_1 maps\_anim::anim_reach_solo( self, var_2 );
        var_1 maps\_anim::anim_single_run_solo( self, var_2 );
    }

    _id_CCF1();
    var_1 = getnode( "big_jump_node", "targetname" );
    var_2 = "favela_escape_bigjump_ghost";

    if ( !var_0 )
    {
        self.a._id_C55F = 8;
        var_1 maps\_anim::anim_reach_solo( self, var_2 );
        self.a._id_C55F = undefined;
    }

    self pushplayer( 0 );
    var_1 maps\_anim::anim_single_run_solo( self, var_2 );
    self._id_D34B = var_1;
    var_2 = "favela_escape_bigjump_ghost_loop";
    var_1 thread maps\_anim::anim_loop_solo( self, var_2, "stop_loop" );
    level._id_C958++;
}

_id_AB7D( var_0 )
{
    self endon( "death" );
    var_1 = common_scripts\utility::getstruct( "roofrun_jump2", "targetname" );
    var_2 = "roofrun_laundry_1";
    var_3 = getent( "smodel_roofrun_sheet_left", "targetname" );
    thread _id_C04A( var_1, var_3, var_2 );
    maps\_utility::ent_flag_wait( "roofrun_start" );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    maps\_utility::set_generic_run_anim( "freerunnerA_run" );

    if ( !var_0 )
    {
        var_2 = "freerunnerA_left";
        var_1 maps\_anim::anim_reach_solo( self, var_2 );
        var_1 maps\_anim::anim_single_run_solo( self, var_2 );
    }

    _id_CCF1();
    var_1 = getnode( "big_jump_node", "targetname" );
    var_2 = "favela_escape_bigjump_faust";

    if ( !var_0 )
    {
        self.a._id_C55F = 8;
        var_1 maps\_anim::anim_reach_solo( self, var_2 );
        self.a._id_C55F = undefined;
    }

    self pushplayer( 0 );
    var_1 maps\_anim::anim_single_run_solo( self, var_2 );
    self._id_D34B = var_1;
    var_2 = "favela_escape_bigjump_faust_loop";
    var_1 thread maps\_anim::anim_loop_solo( self, var_2, "stop_loop" );
    level._id_C958++;
}

_id_C04A( var_0, var_1, var_2 )
{
    var_3 = maps\_utility::spawn_anim_model( "laundry", var_1.origin );
    var_3.angles = var_1.angles;
    var_1 delete();
    var_0 thread maps\_anim::anim_first_frame_solo( var_3, var_2 );
    self waittillmatch( "single anim", "start_laundry" );
    var_0 maps\_anim::anim_single_solo( var_3, var_2 );
}

_id_B2CC()
{
    _id_CCF1();
    self waittill( "roofrun_reset" );
    _id_BB10();
    self setgoalpos( self.origin );
    _id_C273();
}

_id_CCF1()
{
    self pushplayer( 1 );
    maps\_utility::disable_cqbwalk();
    self.dontavoidplayer = 1;
    self.disablearrivals = 1;
    self.disableexits = 1;
    self.usechokepoints = 0;
    ignore_everything();
    _id_B92A( 32 );
    _id_ABA5( 1 );

    if ( !isdefined( self._id_AB13 ) )
        self._id_C50F = self.walkdistfacingmotion;

    self.walkdistfacingmotion = 0;

    if ( !isdefined( self._id_AB13 ) )
        self._id_D2D6 = self.maxsightdistsqrd;

    self.maxsightdistsqrd = 0;

    if ( !isdefined( self._id_AB13 ) )
        self._id_CB63 = self.pathrandompercent;

    self.pathrandompercent = 0;

    if ( !isdefined( self._id_AB13 ) )
        self._id_C193 = self.animname;

    self.animname = "freerunner";
    self._id_AB13 = 1;
}

_id_C273()
{
    self notify( "roofrun_friendly_cleanup" );
    self.moveplaybackrate = 1;
    self.animplaybackrate = 1;
    self.movetransitionrate = 1;
    self pushplayer( 0 );
    self.dontavoidplayer = 0;
    self.disablearrivals = 0;
    self.disableexits = 0;
    self.usechokepoints = 1;
    self.walkdistfacingmotion = self._id_C50F;
    _id_B97F();
    _id_BB10();
    self.maxsightdistsqrd = self._id_D2D6;
    self.pathrandompercent = self._id_CB63;
    self.animname = self._id_C193;
}

_id_C180( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0.965;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !level.player istouching( var_0 ) )
        return 0;

    if ( level.player getstance() != "stand" )
        return 0;

    if ( var_3 && level.player isonground() )
        return 0;

    var_4 = level.player getplayerangles();
    var_4 = ( 0, var_4[1], 0 );
    var_5 = anglestoforward( var_4 );
    var_6 = vectordot( var_5, var_1 );

    if ( var_6 < var_2 )
        return 0;

    var_7 = level.player getvelocity();
    var_8 = distance( ( var_7[0], var_7[1], 0 ), ( 0.0, 0.0, 0.0 ) );

    if ( var_8 < 162 )
        return 0;

    return 1;
}

_id_B4FD( var_0, var_1 )
{
    var_2 = "breakaway";
    var_0 waittillmatch( "single anim", "start_roof_collapse" );
    level._id_D4B5._id_AA33 hide();
    level._id_D4B5.node maps\_anim::anim_single_solo( level._id_D4B5.rig, var_2 );
}

_id_C3B4( var_0 )
{
    var_1 = _id_B54E();
    var_2 = maps\_utility::spawn_anim_model( "roof_rig" );
    var_3 = "breakaway";
    var_4 = level.scr_anim[var_2.animname][var_3];
    var_2.origin = getstartorigin( var_0.origin, var_0.angles, var_4 );
    var_2.angles = getstartangles( var_0.origin, var_0.angles, var_4 );
    var_1 linkto( var_2 );
    level._id_D4B5 = spawnstruct();
    level._id_D4B5.node = var_0;
    level._id_D4B5.rig = var_2;
    level._id_D4B5._id_AA33 = var_1;
}

_id_B54E()
{
    var_0 = getentarray( "roof_fall", "targetname" );
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        if ( var_3.code_classname == "script_brushmodel" )
        {
            var_1 = var_3;
            break;
        }
    }

    var_0 = common_scripts\utility::array_remove( var_0, var_1 );

    foreach ( var_3 in var_0 )
    {
        var_3 linkto( var_1 );
        var_3 hide();
    }

    return var_1;
}

_id_C256( var_0 )
{
    wait 0.3;
    level.player playerlinktoblend( var_0, "tag_player", 0.6, 0.2, 0.4 );
}

_id_D16F( var_0, var_1 )
{
    var_2 = var_0 * 0.75;
    var_3 = gettime() + _id_BB22( var_2 );
    level.player shellshock( var_1, var_2 + 1.5 );
}

_id_D433( var_0 )
{
    var_1 = 1.5;
    var_2 = gettime() + _id_BB22( var_0 );

    while ( gettime() < var_2 )
    {
        common_scripts\utility::play_sound_in_space( "breathing_heartbeat", level.player.origin );

        if ( gettime() < var_2 )
            wait(var_1);
    }

    var_1 = 1;
    common_scripts\utility::play_sound_in_space( "breathing_hurt_start", level.player.origin, 1 );
    wait(var_1);
    var_3 = 0;

    while ( !common_scripts\utility::flag( "player_recovery_done" ) )
    {
        var_4 = "breathing_hurt";

        if ( var_3 % 2 != 0 )
            var_4 = "breathing_heartbeat";

        common_scripts\utility::play_sound_in_space( var_4, level.player.origin, 1 );
        var_3++;
        wait(var_1);
    }

    common_scripts\utility::play_sound_in_space( "breathing_better", level.player.origin, 1 );
}

_id_A842( var_0 )
{
    wait 5.5;
    maps\_utility::radio_dialogue( "favesc_cmt_wakeup" );
    wait 0.5;
    maps\_utility::radio_dialogue( "favesc_gst_comingforyou" );
    wait 0.5;
    thread maps\_utility::radio_dialogue( "favesc_cmt_toomany" );
}

_id_C5D6( var_0 )
{
    if ( isdefined( var_0 ) )
        wait(var_0);

    thread _id_C472();
    thread _id_C843();
    thread _id_A8B7();
    maps\_utility::delaythread( 3.5, ::_id_CFA3 );
    maps\_utility::delaythread( 7.75, ::_id_CE8F );
}

_id_CFA3()
{
    wait 1;
    var_0 = common_scripts\utility::getstruct( "struct_mob_roof_2", "targetname" );
    var_1 = common_scripts\utility::getstruct( "struct_mob_roof_1", "targetname" );
    var_2 = common_scripts\utility::getstruct( "struct_mob_roof_3", "targetname" );
    var_3 = getentarray( "spawner_mob_left_roof", "targetname" );
    var_4 = spawn_group( var_3, 1, 0 );
    var_4[0].animref = var_0;
    var_4[0].anime = "favela_escape_rooftop_mob1";
    var_4[1].animref = var_0;
    var_4[1].anime = "favela_escape_rooftop_mob2";
    var_4[2].animref = var_2;
    var_4[2].anime = "favela_escape_rooftop_mob4";
    var_4[3].animref = var_1;
    var_4[3].anime = "favela_escape_rooftop_mob3";
    common_scripts\utility::array_thread( var_4, ::_id_AB3C );
}

_id_CE8F()
{
    var_0 = getent( "animref_mob_left", "targetname" );
    var_1 = getentarray( "spawner_mob_left", "targetname" );
    var_2 = [];
    var_2[var_2.size] = "mob_left_A";
    var_2[var_2.size] = "mob_left_B";
    var_2[var_2.size] = "mob_left_C";
    var_2[var_2.size] = "mob_left_D";
    var_3 = spawn_group( var_1, 1, 0 );

    foreach ( var_8, var_5 in var_3 )
    {
        var_5.ignoreall = 1;
        var_5.ignoreme = 1;
        var_6 = var_2[var_8];
        var_7 = level.scr_anim["generic"][var_6];
        var_0 thread maps\_anim::anim_generic_gravity( var_5, var_6 );
        var_5 thread _id_BF24( var_7, var_0 );
    }
}

_id_A8B7()
{
    var_0 = getent( "animref_mob_right", "targetname" );
    var_1 = getentarray( "spawner_mob_right", "targetname" );
    var_2 = [];
    var_2[var_2.size] = "mob2_arc_A";
    var_2[var_2.size] = "mob2_arc_B";
    var_2[var_2.size] = "mob3_arc_C";
    var_2[var_2.size] = "mob2_arc_D";
    var_2[var_2.size] = "mob2_arc_E";
    var_2[var_2.size] = "mob2_arc_F";
    var_2[var_2.size] = "mob2_arc_G";
    var_2[var_2.size] = "mob2_arc_H";
    var_3 = spawn_group( var_1, 1, 0 );

    foreach ( var_8, var_5 in var_3 )
    {
        var_5.ignoreall = 1;
        var_5.ignoreme = 1;
        var_6 = var_2[var_8];
        var_7 = level.scr_anim["generic"][var_6];
        var_0 thread maps\_anim::anim_generic_gravity( var_5, var_6 );
        var_5 thread _id_BF24( var_7, var_0 );
    }
}

_id_AB3C()
{
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.animref maps\_anim::anim_generic( self, self.anime );
    self setgoalpos( self.origin );
}

_id_BF24( var_0, var_1 )
{
    var_2 = getanimlength( var_0 );
    var_3 = gettime() + _id_BB22( var_2 );
    level common_scripts\utility::waittill_any_timeout( var_2, "solorun_mob_start_shooting" );

    if ( gettime() < var_3 )
        self stopanimscripted();

    if ( !common_scripts\utility::flag( "solorun_mob_start_shooting" ) )
    {
        maps\_utility::set_generic_run_anim( "intro_casual_walk", 1 );
        self._id_B2E1 = 1;
    }

    self.goalradius = 512;
    self setgoalentity( level.player );
    common_scripts\utility::flag_wait( "solorun_mob_start_shooting" );
    self notify( "stop_animmode" );

    if ( isdefined( self._id_B2E1 ) )
        maps\_utility::clear_run_anim();

    self.ignoreall = 0;
}

_id_A910()
{
    if ( !isdefined( level._id_B9AD ) )
        level._id_B9AD = [];

    level._id_B9AD[level._id_B9AD.size] = self;
    maps\_utility::set_generic_run_anim( "chase_run", 0, 0 );
}

_id_C307()
{
    common_scripts\utility::flag_wait( "solorun_player_off_balcony" );

    if ( !isdefined( level._id_B9AD ) )
        return;

    level._id_B9AD = maps\_utility::array_removedead( level._id_B9AD );
    level._id_B9AD = common_scripts\utility::array_removeundefined( level._id_B9AD );
    common_scripts\utility::array_thread( level._id_B9AD, ::_id_D438 );
}

_id_CA23()
{
    self endon( "death" );
    level.player endon( "death" );

    for (;;)
    {
        var_0 = level.player getplayerangles();
        var_1 = anglestoforward( var_0 );
        var_2 = vectornormalize( self.origin - level.player geteye() );
        var_3 = vectortoangles( var_2 );
        var_4 = anglestoforward( var_3 );
        var_5 = vectordot( var_1, var_4 );

        if ( var_5 > 0.75 || common_scripts\utility::flag( "solorun_player_progression_stalled" ) )
        {
            if ( isdefined( self.dontevershoot ) )
                self.dontevershoot = undefined;
        }
        else if ( !isdefined( self.dontevershoot ) )
            self.dontevershoot = 1;

        wait 0.05;
    }
}

_id_D438()
{
    self endon( "death" );

    while ( maps\_utility::player_can_see_ai( self ) )
        wait 0.1;

    self delete();
}

_id_C35E()
{
    var_0 = getdvarint( "timer_off" );

    if ( isdefined( var_0 ) && var_0 > 0 )
        return;

    common_scripts\utility::flag_wait( "solorun_timer_start" );
    var_1 = 30;
    var_2 = &"FAVELA_ESCAPE_CHOPPER_TIMER";
    thread _id_BF87( var_1 );
    thread _id_AB95( var_1, var_2, 1 );
    thread _id_D383( var_1, var_2 );
    common_scripts\utility::flag_wait( "chopperjump_player_jump" );
    maps\_hud_util::_id_CB55();
}

_id_BF87( var_0 )
{
    level endon( "chopperjump_player_jump" );
    level._id_C018 = var_0;

    for (;;)
    {
        wait 1;
        level._id_C018 -= 1;
    }
}

_id_D383( var_0, var_1 )
{
    if ( level.gameskill == 3 )
        return;

    common_scripts\utility::flag_wait( "trig_solorun_player_on_slide" );

    if ( level._id_C018 >= 10 )
        thread maps\_utility::autosave_by_name( "chopperjump" );
}

_id_AB95( var_0, var_1, var_2 )
{
    level endon( "kill_timer" );
    level.timer = maps\_hud_util::_id_B8DF( var_0, var_1, var_2 );
    common_scripts\utility::flag_set( "timer_expired" );
    level thread _id_B08A();
}

_id_B08A()
{
    var_0 = &"FAVELA_ESCAPE_CHOPPER_TIMER_EXPIRED";
    level.player endon( "death" );
    level endon( "kill_timer" );
    level notify( "mission failed" );
    level.player freezecontrols( 1 );
    setdvar( "ui_deadquote", var_0 );
    maps\_utility::missionfailedwrapper();
}

_id_D030( var_0 )
{
    level endon( "solorun_player_off_balcony" );
    thread maps\_utility::radio_dialogue( "favesc_cmt_runforit" );
    var_1 = -6074;
    var_2 = 900;
    var_3 = getent( "trig_solorun_start_playersafezone", "targetname" );
    var_4 = level.player.maxhealth;
    thread _id_B2A8( var_0 );
    thread _id_B28C( var_3 );

    for (;;)
    {
        if ( _id_D05E( var_1, var_3, "solorun_mob_start_shooting" ) )
        {
            var_5 = level.player.origin;
            var_6 = getaiarray( "axis" );

            if ( var_6.size )
            {
                var_7 = _id_D5AF( var_6 );
                var_5 = var_7.origin;
            }

            level.player dodamage( var_4 * 0.25, var_5 );

            if ( !common_scripts\utility::flag( "solorun_mob_start_shooting" ) )
                common_scripts\utility::flag_set( "solorun_mob_start_shooting" );
        }

        wait 0.5;
    }
}

_id_D05E( var_0, var_1, var_2 )
{
    if ( level.player.origin[0] < var_0 && !level.player istouching( var_1 ) )
        return 1;

    if ( level.player istouching( var_1 ) && common_scripts\utility::flag( var_2 ) )
        return 1;

    return 0;
}

_id_B2A8( var_0 )
{
    level endon( "solorun_mob_start_shooting" );
    wait(var_0);
    common_scripts\utility::flag_set( "solorun_mob_start_shooting" );
}

_id_B28C( var_0 )
{
    level endon( "solorun_mob_start_shooting" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isplayer( var_1 ) )
            break;

        wait 0.05;
    }

    while ( level.player istouching( var_0 ) )
        wait 0.05;

    common_scripts\utility::flag_set( "solorun_mob_start_shooting" );
}

_id_A879()
{
    var_0 = getent( "trig_solorun_civilian_doorshut", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = common_scripts\utility::getstruct( "struct_solorun_civilian_doorshut_animref", "targetname" );
    var_3 = maps\_utility::spawn_anim_model( "civ_door" );
    var_4 = var_1 maps\_utility::spawn_ai();
    var_4.animname = "default_civilian";
    var_4.ignoreme = 1;
    var_4 ignore_everything();
    var_4 thread maps\_utility::magic_bullet_shield( 1 );
    var_5[0] = var_3;
    var_5[1] = var_4;
    var_2 thread maps\_anim::anim_loop( var_5, "run_and_slam_idle", "stop_loop" );
    var_0 waittill( "trigger" );
    var_3 notify( "stop_loop" );
    var_4 notify( "stop_loop" );
    var_2 maps\_anim::anim_single( var_5, "run_and_slam" );
    var_4 setgoalpos( var_4.origin );
    var_4 thread maps\_anim::anim_loop_solo( var_4, "run_and_slam_endidle", "stop_loop" );
    common_scripts\utility::flag_wait( "solorun_player_at_balcony" );
    var_4 maps\_utility::stop_magic_bullet_shield();
    var_4 notify( "stop_loop" );
    wait 0.05;
    var_4 delete();
}

_id_B47F()
{
    common_scripts\utility::flag_wait( "trig_solorun_player_on_slide" );
    common_scripts\_exploder::exploder( "roof_slide" );
}

rooftop_slide_dust_exploder()
{
    common_scripts\utility::flag_wait( "trig_solorun_player_on_slide" );
    common_scripts\_exploder::exploder( "roof_slide_dust" );
}

_id_AADD()
{
    maps\_utility::trigger_wait_targetname( "trig_end_glass_break" );
    level notify( "glass_break", level.player );
    level.player playrumblelooponentity( "artillery_rumble" );
    thread common_scripts\utility::play_sound_in_space( "scn_favela_escape_player_window", level.player.origin );
    common_scripts\_exploder::exploder( "window_glass_interior_favela_s" );
    soundscripts\_audio_zone_manager::azm_start_zone( "interior_stone" );
}

_id_C87E()
{
    maps\_utility::trigger_wait_targetname( "trig_end_glass_break" );
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_call( var_0, ::delete );
}

_id_C1FA()
{
    var_0 = 170;
    var_1 = 0;
    var_2 = 0;
    var_3 = getent( "trig_solorun_start_playersafezone", "targetname" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "solorun_player_outside_first_house" ) && !level.player istouching( var_3 ) && !var_2 )
        {
            var_2 = 1;
            level.player.noplayerinvul = 1;
            maps\_utility::set_custom_gameskill_func( ::_id_C6D9 );
        }
        else if ( ( !common_scripts\utility::flag( "solorun_player_outside_first_house" ) || level.player istouching( var_3 ) ) && var_2 )
        {
            var_2 = 0;
            level.player.noplayerinvul = undefined;
            maps\_utility::set_custom_gameskill_func( ::_id_CA5D );
        }

        var_4 = level.player getvelocity();
        var_5 = distance( ( var_4[0], var_4[1], 0 ), ( 0.0, 0.0, 0.0 ) );

        if ( var_5 >= var_0 && !var_1 )
        {
            var_1 = 1;
            maps\_utility::set_custom_gameskill_func( ::_id_C79C );
        }
        else if ( var_5 < var_0 && var_1 )
        {
            var_1 = 0;
            maps\_utility::set_custom_gameskill_func( ::_id_D24B );
        }

        wait 0.5;
    }
}

_id_C6D9()
{
    level.difficultysettings["playerDifficultyHealth"]["easy"] = 100;
    level.difficultysettings["playerDifficultyHealth"]["normal"] = 100;
    level.difficultysettings["playerDifficultyHealth"]["hardened"] = 100;
    level.difficultysettings["playerDifficultyHealth"]["veteran"] = 100;
    level.difficultysettings["longRegenTime"]["easy"] = 20000;
    level.difficultysettings["longRegenTime"]["normal"] = 20000;
    level.difficultysettings["longRegenTime"]["hardened"] = 20000;
    level.difficultysettings["longRegenTime"]["veteran"] = 20000;
    level.difficultysettings["player_deathInvulnerableTime"]["easy"] = 0;
    level.difficultysettings["player_deathInvulnerableTime"]["normal"] = 0;
    level.difficultysettings["player_deathInvulnerableTime"]["hardened"] = 0;
    level.difficultysettings["player_deathInvulnerableTime"]["veteran"] = 0;
    level.difficultysettings["base_enemy_accuracy"]["easy"] = 50000;
    level.difficultysettings["base_enemy_accuracy"]["normal"] = 50000;
    level.difficultysettings["base_enemy_accuracy"]["hardened"] = 50000;
    level.difficultysettings["base_enemy_accuracy"]["veteran"] = 50000;
    level.difficultysettings["invulTime_preShield"]["easy"] = 0;
    level.difficultysettings["invulTime_preShield"]["normal"] = 0;
    level.difficultysettings["invulTime_preShield"]["hardened"] = 0;
    level.difficultysettings["invulTime_preShield"]["veteran"] = 0;
    level.difficultysettings["invulTime_onShield"]["easy"] = 0;
    level.difficultysettings["invulTime_onShield"]["normal"] = 0;
    level.difficultysettings["invulTime_onShield"]["hardened"] = 0;
    level.difficultysettings["invulTime_onShield"]["veteran"] = 0;
    level.difficultysettings["invulTime_postShield"]["easy"] = 0;
    level.difficultysettings["invulTime_postShield"]["normal"] = 0;
    level.difficultysettings["invulTime_postShield"]["hardened"] = 0;
    level.difficultysettings["invulTime_postShield"]["veteran"] = 0;
}

_id_CA5D()
{
    level.difficultysettings["player_deathInvulnerableTime"]["easy"] = 4000;
    level.difficultysettings["player_deathInvulnerableTime"]["normal"] = 2500;
    level.difficultysettings["player_deathInvulnerableTime"]["hardened"] = 600;
    level.difficultysettings["player_deathInvulnerableTime"]["veteran"] = 100;
    level.difficultysettings["base_enemy_accuracy"]["easy"] = 0.9;
    level.difficultysettings["base_enemy_accuracy"]["normal"] = 1.0;
    level.difficultysettings["base_enemy_accuracy"]["hardened"] = 1.15;
    level.difficultysettings["base_enemy_accuracy"]["veteran"] = 1.15;
    level.difficultysettings["invulTime_preShield"]["easy"] = 0.6;
    level.difficultysettings["invulTime_preShield"]["normal"] = 0.5;
    level.difficultysettings["invulTime_preShield"]["hardened"] = 0.3;
    level.difficultysettings["invulTime_preShield"]["veteran"] = 0.0;
    level.difficultysettings["invulTime_onShield"]["easy"] = 1.6;
    level.difficultysettings["invulTime_onShield"]["normal"] = 1.0;
    level.difficultysettings["invulTime_onShield"]["hardened"] = 0.5;
    level.difficultysettings["invulTime_onShield"]["veteran"] = 0.25;
    level.difficultysettings["invulTime_postShield"]["easy"] = 0.5;
    level.difficultysettings["invulTime_postShield"]["normal"] = 0.4;
    level.difficultysettings["invulTime_postShield"]["hardened"] = 0.3;
    level.difficultysettings["invulTime_postShield"]["veteran"] = 0.0;
}

_id_C79C()
{
    level.difficultysettings["playerDifficultyHealth"]["easy"] = 900;
    level.difficultysettings["playerDifficultyHealth"]["normal"] = 550;
    level.difficultysettings["playerDifficultyHealth"]["hardened"] = 330;
    level.difficultysettings["playerDifficultyHealth"]["veteran"] = 230;
    level.difficultysettings["longRegenTime"]["easy"] = 1000;
    level.difficultysettings["longRegenTime"]["normal"] = 1000;
    level.difficultysettings["longRegenTime"]["hardened"] = 1000;
    level.difficultysettings["longRegenTime"]["veteran"] = 1000;
}

_id_D24B()
{
    level.difficultysettings["playerDifficultyHealth"]["easy"] = 475;
    level.difficultysettings["playerDifficultyHealth"]["normal"] = 275;
    level.difficultysettings["playerDifficultyHealth"]["hardened"] = 165;
    level.difficultysettings["playerDifficultyHealth"]["veteran"] = 115;
    level.difficultysettings["longRegenTime"]["easy"] = 5000;
    level.difficultysettings["longRegenTime"]["normal"] = 5000;
    level.difficultysettings["longRegenTime"]["hardened"] = 3200;
    level.difficultysettings["longRegenTime"]["veteran"] = 3200;
}

_id_C449()
{
    wait 1;
    level.strings["take_cover"].text = &"FAVELA_ESCAPE_SOLORUN_KEEP_MOVING";
}

_id_C0DF()
{
    level endon( "trig_solorun_player_on_slide" );
    var_0 = getentarray( "trig_solorun_roof_progression", "targetname" );
    level._id_D0A9 = 0;
    thread _id_B66B();
    var_1 = 1;
    var_2 = 1;

    for (;;)
    {
        foreach ( var_4 in var_0 )
        {
            if ( level.player istouching( var_4 ) )
            {
                if ( var_4.script_count > var_1 )
                {
                    if ( level._id_D0A9 >= var_2 )
                        level._id_D0A9 = 0;

                    level._id_D0A9++;
                }
                else if ( var_4.script_count < var_1 )
                    level._id_D0A9--;

                while ( level.player istouching( var_4 ) )
                    wait 0.05;

                var_1 = var_4.script_count;
                break;
            }
        }

        wait 0.05;
    }
}

_id_B66B()
{
    level endon( "trig_solorun_player_on_slide" );
    var_0 = "solorun_player_progression_stalled";
    var_1 = 0;

    for (;;)
    {
        while ( level._id_D0A9 == var_1 )
            wait 0.1;

        if ( level._id_D0A9 < 1 )
        {
            if ( !common_scripts\utility::flag( var_0 ) )
                common_scripts\utility::flag_set( var_0 );
        }
        else if ( common_scripts\utility::flag( var_0 ) )
            common_scripts\utility::flag_clear( var_0 );

        var_1 = level._id_D0A9;
    }
}

_id_AEDB()
{
    if ( level.gameskill > 2 )
        return;

    var_0 = "solorun_player_sprinted";
    common_scripts\utility::flag_init( var_0 );
    level thread _id_AF18( var_0 );

    while ( level.player.health > level.player.maxhealth * 0.9 && !common_scripts\utility::flag( var_0 ) )
        wait 0.1;

    if ( !common_scripts\utility::flag( var_0 ) )
        level thread _id_D136( var_0 );
}

_id_D136( var_0 )
{
    var_1 = &"FAVELA_ESCAPE_HINT_SPRINT";

    if ( !level.console )
    {
        var_2 = 0;

        if ( maps\_utility::is_command_bound( "+sprint" ) )
            var_2 = 1;
        else if ( !maps\_utility::is_command_bound( "+breath_sprint" ) )
            var_2 = 1;

        if ( var_2 )
            var_1 = &"FAVELA_ESCAPE_HINT_SPRINT_PC";
    }

    maps\_utility::hint( var_1 );

    while ( !common_scripts\utility::flag( var_0 ) && level.player.health > 0 )
        wait 0.05;

    var_3 = 0.25;
    thread maps\_utility::hint_fade( var_3 );
}

_id_AF18( var_0 )
{
    notifyoncommand( var_0, "+breath_sprint" );
    notifyoncommand( var_0, "+sprint" );
    level.player waittill( var_0 );
    common_scripts\utility::flag_set( var_0 );
}

_id_C95B()
{
    thread _id_BC4E();
    var_0 = getentarray( "solorun_dmgtrig", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_D10F );
    var_1 = getentarray( "trig_solorun_squibs", "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_BB49 );
}

_id_BC4E()
{
    level endon( "solorun_player_at_balcony" );
    var_0 = 0.07;
    var_1 = 0.1;
    var_2 = 5;
    var_3 = 9;
    var_4 = 1;
    var_5 = 2;
    var_6 = level._id_CD18;
    var_7 = level._id_B4CE;

    for (;;)
    {
        var_8 = _id_D5AF( var_6 );
        var_9 = randomintrange( var_2, var_3 );

        for ( var_10 = 0; var_10 < var_9; var_10++ )
        {
            var_11 = level.player geteye();

            if ( isdefined( level._id_B9AD ) )
            {
                var_12 = _id_D5AF( level._id_B9AD );
                var_12 thread maps\_utility::play_sound_on_entity( var_7[var_8] );
            }

            if ( common_scripts\utility::cointoss() )
                thread common_scripts\utility::play_sound_in_space( "h2_solorun_whizby_near", var_11 );

            wait(randomfloatrange( var_0, var_1 ));
        }

        wait(randomfloatrange( var_4, var_5 ));
    }
}

_id_D10F()
{
    self waittill( "trigger" );
    radiusdamage( self.origin, 32, 1000, 1000 );
}

_id_BB49()
{
    self waittill( "trigger" );
    var_0 = level._id_CD18;
    var_1 = _id_D5AF( var_0 );
    var_2 = common_scripts\utility::getfx( "squib_plaster" );
    var_3 = 0.07;
    var_4 = 0.1;
    var_5 = common_scripts\utility::getstructarray( self.target, "targetname" );

    if ( isdefined( var_5[0].target ) )
        var_5 = _id_CC68( var_5[0] );
    else
        var_5 = common_scripts\utility::array_randomize( var_5 );

    var_5[0] maps\_utility::script_delay();

    foreach ( var_7 in var_5 )
    {
        var_8 = anglestoforward( var_7.angles );
        var_9 = var_8 * 1024;
        var_10 = var_7.origin + var_9;
        magicbullet( var_1, var_7.origin, var_10 );

        if ( common_scripts\utility::cointoss() )
            thread common_scripts\utility::play_sound_in_space( "h2_solorun_whizby_near", level.player.origin );

        wait(randomfloatrange( var_3, var_4 ));
    }
}

_id_CC68( var_0 )
{
    var_1 = [];
    var_1[0] = var_0;

    for ( var_2 = var_0; isdefined( var_2.target ); var_2 = var_3 )
    {
        var_3 = common_scripts\utility::getstruct( var_2.target, "targetname" );

        if ( !isdefined( var_3 ) )
            var_3 = getent( var_2.target, "targetname" );

        if ( !isdefined( var_3 ) )
            var_3 = getnode( var_2.target, "targetname" );

        if ( isdefined( var_3 ) )
        {
            var_1[var_1.size] = var_3;
            continue;
        }

        break;
    }

    return var_1;
}

_id_CE54()
{
    var_0 = common_scripts\utility::getstructarray( self.target, "targetname" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( isplayer( var_1 ) && !common_scripts\utility::flag( "whizby_location_updating" ) )
        {
            common_scripts\utility::flag_set( "whizby_location_updating" );
            level._id_CAFB = var_0;

            while ( var_1 istouching( self ) )
                wait 0.1;

            common_scripts\utility::flag_clear( "whizby_location_updating" );
        }

        wait 0.05;
    }
}

_id_B6A3()
{
    level.player endon( "death" );
    level endon( "trig_solorun_player_on_slide" );
    common_scripts\utility::flag_wait( "solorun_player_off_balcony" );
    var_0 = 128;
    var_1 = 256;
    var_2 = 32;
    var_3 = 64;
    var_4 = 0.08;
    var_5 = 0.11;
    var_6 = 0.5;
    var_7 = 1;
    var_8 = 5;
    var_9 = 9;
    var_10 = level._id_CD18;

    for (;;)
    {
        var_11 = _id_D5AF( var_10 );
        var_12 = randomintrange( var_8, var_9 );
        var_13 = getaiarray( "axis" );
        var_14 = undefined;

        foreach ( var_16 in var_13 )
        {
            if ( var_16 cansee( level.player ) && !maps\_utility::player_can_see_ai( var_16 ) )
            {
                if ( !isdefined( var_14 ) || distance( var_16.origin, level.player.origin ) < distance( var_14.origin, level.player.origin ) )
                    var_14 = var_16;
            }
        }

        if ( !isdefined( var_14 ) )
        {
            wait 1;
            continue;
        }

        for ( var_18 = 0; var_18 < var_12; var_18++ )
        {
            if ( !isalive( var_14 ) || maps\_utility::player_can_see_ai( var_14 ) )
            {
                wait 0.05;
                continue;
            }

            var_19 = var_14 geteye() + ( 0.0, 0.0, 32.0 );
            var_20 = level.player geteye();
            var_21 = level.player.angles;
            var_22 = anglestoforward( var_21 );
            var_23 = var_20 + var_22 * 256;
            var_24 = var_23[2] + 256;
            var_25 = maps\_utility::groundpos( var_23 );
            var_26 = _id_BA51( var_25[0], var_2, var_3 );
            var_27 = _id_BA51( var_25[1], var_2, var_3 );
            var_28 = var_24;
            var_29 = maps\_utility::groundpos( ( var_26, var_27, var_28 ) );
            var_30 = bullettrace( var_19, var_29, 1 );
            var_31 = var_30["entity"];

            if ( isdefined( var_31 ) )
            {
                if ( isplayer( var_31 ) )
                    continue;
            }

            magicbullet( var_11, var_19, var_29 );
            wait(randomfloatrange( var_4, var_5 ));
        }

        wait(randomfloatrange( var_6, var_7 ));
    }
}

_id_BA51( var_0, var_1, var_2 )
{
    var_3 = randomintrange( var_1, var_2 );

    if ( common_scripts\utility::cointoss() )
        var_3 *= -1;

    var_4 = var_0 + var_3;
    return var_4;
}

_id_ABC5()
{
    maps\_utility::trigger_wait_targetname( "trig_balcony_chopper_spawn" );

    for ( var_0 = undefined; !isdefined( var_0 ); var_0 = maps\_utility::get_vehicle( "solorun_balcony_chopper", "targetname" ) )
        wait 0.05;

    var_0 thread maps\_utility::play_sound_on_entity( "scn_favela_escape_heli_flyover" );
    var_0 thread maps\favela_escape_aud::_id_AEEE();
    thread _id_B4CA( 0, "heli_loop", 5 );
}

_id_CCFD()
{
    var_0 = getentarray( "solorun_chopper_fakefire_trig", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_CA62 );
}

_id_CA62()
{
    var_0 = common_scripts\utility::getstructarray( self.target, "targetname" );
    self waittill( "trigger" );
    common_scripts\utility::array_thread( var_0, ::_id_C518 );
    common_scripts\utility::array_thread( var_0, ::_id_B200 );
}

_id_B200()
{
    if ( !maps\_utility::script_delay() )
        wait(randomfloatrange( 0.5, 1.2 ));

    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    magicbullet( "rpg_straight_short_life", self.origin, var_0.origin );
}

_id_C0B3()
{
    self.health = 2000000;
    missile_createrepulsorent( self, 1150, 1200 );
    level.chopper = self;
}

_id_C900( var_0 )
{
    var_1 = "solorun_player_at_balcony";

    if ( !isdefined( var_0 ) || var_0 )
        thread _id_A986( var_1 );

    common_scripts\utility::flag_wait( var_1 );
    maps\_utility::radio_dialogue( "favesc_cmt_meetussouth" );
    maps\_utility::radio_dialogue( "favesc_nkl_verylow" );
    common_scripts\utility::flag_set( "solorun_timer_start" );
    maps\_utility::radio_dialogue( "favesc_cmt_onfumes" );
    common_scripts\utility::flag_wait( "solorun_dialogue_4" );
    maps\_utility::radio_dialogue( "favesc_cmt_leftturnleft" );
    common_scripts\utility::flag_wait( "solorun_dialogue_5" );
    maps\_utility::radio_dialogue( "favesc_cmt_comeon" );
}

_id_A986( var_0 )
{
    level endon( var_0 );
    level.player endon( "death" );
    wait 5;
    maps\_utility::radio_dialogue( "favesc_cmt_circlingarea" );
    wait 15;
    maps\_utility::radio_dialogue( "favesc_cmt_lowonfuel" );
}

_id_BE74()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isplayer( var_0 ) )
        {
            setdvar( "ui_deadquote", "@FAVELA_ESCAPE_DEADQUOTE_FAILED_CHOPPER_JUMP" );
            maps\_utility::missionfailedwrapper();
        }

        wait 0.05;
    }
}

_id_ADD4( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 )
        common_scripts\utility::flag_wait( "trig_solorun_player_on_slide" );

    thread _id_B4CA( 4, "heli_loop", 6 );
    var_1 = getent( "trig_slide_chopperjump_ledge", "targetname" );
    var_2 = getent( "killtrig_chopperjump", "script_noteworthy" );
    var_2 thread _id_BE74();
    var_3 = common_scripts\utility::getstruct( "solorun_chopperjump_animref", "targetname" );
    var_4 = "worldbody";
    var_5 = "chopper";
    var_6 = "ladder";
    var_7 = "chopper_door_guy";
    var_8 = "tag_detach";
    var_9 = "tag_body";
    var_10 = "chopperjump_in";
    var_11 = "chopperjump_loop";
    var_12 = "chopperjump_jump";
    var_13 = "chopperjump_flyaway";
    var_14 = level.scr_anim[var_4][var_12];
    var_15 = maps\_utility::spawn_anim_model( var_4, var_3.origin );
    var_15 hide();
    var_16 = maps\_utility::spawn_anim_model( var_5, var_3.origin );
    var_16.angles = var_3.angles;
    maps\_vehicle::build_drive( var_16 maps\_utility::getanim( "rotors" ), undefined, 0 );
    var_16 thread maps\_vehicle_code::animate_drive_idle();
    var_16 thread maps\favela_escape_aud::_id_C434();
    level.chopper = var_16;
    var_17 = getent( "chopperjump_sarge", "targetname" );
    var_18 = var_17 maps\_utility::spawn_ai();
    var_18.animname = var_7;
    level._id_BAD2 = var_18;
    var_18 linkto( var_16, var_8 );
    thread _id_BFA4();
    var_19 = maps\_utility::spawn_anim_model( var_6, ( 0.0, 0.0, 0.0 ) );
    level._id_C924 = var_19;
    var_15 linkto( var_16, var_9 );
    var_19 linkto( var_16, var_9 );
    var_20 = [];
    var_20[0] = var_19;
    enableforcedsunshadows();
    thread _id_CB16( var_3, var_16, var_19, var_18, var_10, var_9, var_11, var_8 );
    var_21 = getent( "trig_player_chopperjump", "script_noteworthy" );
    var_22 = anglestoforward( ( 0.0, 90.0, 0.0 ) );
    thread _id_AA6E();
    var_23 = common_scripts\utility::getstructarray( "struct_chopperjump_alt_lookspot", "targetname" );

    for (;;)
    {
        var_24 = 0;

        while ( level.player istouching( var_21 ) )
        {
            common_scripts\utility::flag_wait( "player_jumping" );

            if ( _id_C08B( var_21, var_19, var_23, 1 ) )
            {
                var_24 = 1;
                break;
            }

            wait 0.05;
        }

        if ( var_24 )
            break;

        wait 0.05;
    }

    common_scripts\utility::flag_set( "chopperjump_player_jump" );
    thread favela_escape_jump_dof( var_15 );
    thread maps\favela_escape_lighting::_id_C584( "favela_escape_chopperjump" );
    var_2 delete();
    var_1 delete();
    var_16 notify( "stop_loop" );
    var_25 = getanimlength( var_15 maps\_utility::getanim( var_12 ) );
    level.player allowjump( 0 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    setsaveddvar( "ui_hidemap", 1 );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "hud_showStance", 0 );
    level.player disableweapons( 0, 500, 0.5 );
    var_26 = getstartorigin( var_16.origin, var_16.angles, var_14 );
    var_27 = getstartangles( var_16.origin, var_16.angles, var_14 ) - level.player.angles;
    var_28 = spawnstruct();
    var_28.angles = var_16.angles - var_27;
    var_29 = var_26 - level.player.origin;
    var_30 = var_16.origin - var_26;
    var_31 = var_30[0] * cos( var_27[1] ) - var_30[1] * sin( var_27[1] );
    var_32 = var_30[0] * sin( var_27[1] ) + var_30[1] * cos( var_27[1] );
    var_33 = var_30 - ( var_31, var_32, var_30[2] );
    var_28.origin = var_16.origin - var_29 + var_33;
    thread blend_player_anim_and_linktodelta( var_15 );
    var_34 = "player_jump";
    var_35 = getnotetracktimes( var_14, "favela_escape_end_grab" );
    var_36 = getanimlength( var_14 ) * var_35[0];
    var_37 = var_16 maps\_anim::get_anim_position( var_9, var_12 );
    var_38 = common_scripts\utility::spawn_tag_origin();
    var_38.origin = var_37["origin"];
    var_38.angles = var_37["angles"];
    var_38 maps\_anim::anim_first_frame_solo( var_15, "chopperjump_jump" );
    var_15 animscripted( var_34, var_28.origin, var_28.angles, var_14 );
    var_15 thread maps\_anim::_id_B6DB( undefined, var_28, var_38, var_36 );
    var_15 thread maps\favela_escape_aud::chopperjump_player_foley_sounds();
    var_16 thread maps\_anim::anim_single( var_20, var_12, var_9 );
    var_15 common_scripts\utility::delaycall( 0.5, ::show );
    maps\_utility::delaythread( 1, ::_id_CB89 );
    level._id_CACD = var_25 * 0.2;
    common_scripts\utility::flag_set( "solorun_player_boarded_chopper" );
    var_3 maps\_utility::delaythread( 0.05, maps\_anim::anim_single_solo, var_16, var_13 );
    var_16 maps\_utility::delaythread( 0.05, maps\_anim::anim_single_solo, var_18, var_13, var_8 );
}

favela_escape_jump_dof( var_0 )
{
    var_1 = _id_D397::_id_A97A( "player_jumps_to_ladder" );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 16.0, -1, 16.0, 16.0 ) _id_D397::_id_CCA7( var_0, "tag_dof" ) _id_D397::_id_AE01( 0.4 ) _id_D397::_id_AF9C();
    var_1 _id_D397::_id_BEA0( 0.1 ) _id_D397::_id_C491( 4.5, -1, 8.0, 4.0 ) _id_D397::_id_CCA7( var_0, "tag_dof" ) _id_D397::_id_AE01( 0.4 );
    var_1 _id_D397::_id_BEA0( 12.0 ) _id_D397::_id_BF3F();
    var_1 _id_D397::_id_BEA0( 12.1 ) _id_D397::_id_B687();
    var_1 _id_D397::_id_BEA0( 1.15 ) _id_D397::_id_BAE4( 2 );
    var_1 _id_D397::_id_BEA0( 1.35 ) _id_D397::_id_BAE4( 0 );
    var_1 _id_D397::_id_BEA0( 1.5 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.35, 0.15, 0.15, 5, 15, 5, 8 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_1 _id_D397::_id_BEA0( 3.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.65, 0.2, 0.2, 0, 0, 0, 0 );
    var_1 _id_D397::_id_BEA0( 4.35 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.5, 0.2, 0.2, 10, 12, 8, 8 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_1 _id_D397::_id_BEA0( 7.15 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.35, 0.15, 0.15, 0, 0, 0, 0 );
    var_1 _id_D397::_id_BEA0( 8.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.5, 0.2, 0.2, 5, 18, 8, 10 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_1 _id_D397::_id_BC26();
}

_id_CB89()
{
    level.player playrumblelooponentity( "artillery_rumble" );
    wait 0.5;

    while ( !common_scripts\utility::flag( "level_faded_to_black" ) )
    {
        level.player playrumblelooponentity( "damage_light" );
        wait 0.115;
    }
}

_id_C08B( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !var_0 istouching( level.player ) )
        return 0;

    if ( level.player getstance() != "stand" )
        return 0;

    if ( var_3 && level.player isonground() )
        return 0;

    var_4 = 1;
    var_5 = var_1.origin + ( 0.0, 0.0, -85.0 );
    var_6 = getdvarint( "cg_fov" );

    if ( !level.player worldpointinreticle_circle( var_5, var_6, 120 ) )
        var_4 = 0;

    if ( !var_4 )
    {
        var_7 = 0;

        foreach ( var_9 in var_2 )
        {
            if ( level.player worldpointinreticle_circle( var_9.origin, var_6, 165 ) )
            {
                var_7 = 1;
                break;
            }
        }

        if ( var_7 )
            var_4 = 1;
    }

    if ( !var_4 )
        return 0;

    var_11 = level.player getvelocity();
    var_12 = distance( ( var_11[0], var_11[1], 0 ), ( 0.0, 0.0, 0.0 ) );

    if ( var_12 < 145 )
        return 0;

    return 1;
}

_id_CB16( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_0 thread maps\_anim::anim_single_solo( var_1, var_4 );
    var_1 thread maps\_anim::anim_single_solo( var_3, var_4, var_7 );
    var_1 maps\_anim::anim_single_solo( var_2, var_4, var_5 );

    if ( !common_scripts\utility::flag( "chopperjump_player_jump" ) )
    {
        var_8 = [];
        var_9 = [];
        var_9["guy"] = var_1;
        var_9["entity"] = var_0;
        var_9["tag"] = undefined;
        var_8[var_8.size] = var_9;
        var_10 = [];
        var_10["guy"] = var_2;
        var_10["entity"] = var_1;
        var_10["tag"] = var_5;
        var_8[var_8.size] = var_10;
        var_11 = [];
        var_11["guy"] = var_3;
        var_11["entity"] = var_1;
        var_11["tag"] = var_7;
        var_8[var_8.size] = var_11;
        var_1 thread maps\_anim::anim_loop_packet( var_8, var_6 );
    }
}

_id_B173()
{
    var_0 = "pavelow_idle_high";
    var_1 = "pavelow_engine_high";
    thread common_scripts\utility::play_loop_sound_on_entity( var_0 );
    common_scripts\utility::flag_wait( "chopperjump_player_jump" );
    wait(level._id_CACD);
    thread common_scripts\utility::play_loop_sound_on_entity( var_1 );
    wait 0.25;
    self notify( "stop sound" + var_0 );
}

_id_AA6E()
{
    level endon( "player_jump_watcher_stop" );
    var_0 = "player_jumping";

    if ( !common_scripts\utility::flag_exist( var_0 ) )
        common_scripts\utility::flag_init( var_0 );
    else
        common_scripts\utility::flag_clear( var_0 );

    notifyoncommand( "playerjump", "+gostand" );
    notifyoncommand( "playerjump", "+moveup" );

    for (;;)
    {
        level.player waittill( "playerjump" );
        wait 0.1;

        if ( !level.player _meth_83C0() )
            continue;

        if ( !level.player isonground() )
            common_scripts\utility::flag_set( var_0 );

        while ( !level.player isonground() )
            wait 0.05;

        common_scripts\utility::flag_clear( var_0 );
    }
}

_id_CF30( var_0 )
{
    wait 0.3;
    level.player notify( "stop_sliding" );
    level.player _meth_8572( var_0, "tag_player", 0.5, 0.6, 0.2, 0.4, 40, 40, 60, 20 );
}

_id_BFA4()
{
    maps\_utility::trigger_wait_targetname( "chopperjump_dialogue_jumpforit" );
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior_roof" );
    level._id_BAD2 thread maps\_utility::dialogue_queue( "favesc_cmt_jump" );
    common_scripts\utility::flag_wait( "chopperjump_player_jump" );
    wait 2;
    wait 3;
    wait 1;
    maps\_utility::radio_dialogue( "favesc_nkl_whereto" );
    wait 0.4;
    maps\_utility::radio_dialogue( "favesc_cmt_tothesub" );
}

_id_B997()
{
    var_0 = _id_B562();
    var_1 = var_0[0];
    return var_1;
}

_id_ACBF()
{
    var_0 = getentarray( "color_friendly_spawner", "targetname" );
    level._id_A967 = var_0;
}

_id_C116()
{
    var_0 = getentarray( "enemy_cleanup_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_B778 );
}

_id_B778()
{
    var_0 = "Enemy cleanup trigger at origin " + self.origin + " needs to target a volume.";
    var_1 = getentarray( self.target, "targetname" );
    self waittill( "trigger" );
    var_2 = getaiarray( "axis" );

    foreach ( var_4 in var_2 )
    {
        foreach ( var_6 in var_1 )
        {
            var_7 = 0;

            if ( var_4 istouching( var_6 ) )
            {
                var_7 = 1;
                var_4 delete();
                break;
            }

            if ( var_7 )
                break;
        }
    }

    maps\_utility::array_delete( var_1 );
    self delete();
}

_id_B318( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 10;

    if ( !isdefined( var_1 ) )
        var_1 = 0.05;

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        if ( isdefined( self.forcespawn ) && self.forcespawn > 0 )
            var_3 = self stalingradspawn();
        else
            var_3 = self dospawn();

        if ( !maps\_utility::spawn_failed( var_3 ) )
            return var_3;

        wait(var_1);
    }

    return undefined;
}

_id_C5AE( var_0, var_1 )
{
    spawn_group( var_0, var_1, 1 );
}

spawn_group( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_0 = common_scripts\utility::array_randomize( var_0 );
    var_3 = [];

    foreach ( var_7, var_5 in var_0 )
    {
        var_6 = var_5 maps\_utility::spawn_ai();
        var_3[var_3.size] = var_6;

        if ( var_2 )
        {
            if ( var_7 != var_0.size - 1 )
                wait(randomfloatrange( 0.25, 1 ));
        }
    }

    if ( var_1 )
    {

    }

    return var_3;
}

_id_BA0A()
{
    self endon( "death" );

    for (;;)
    {
        if ( self.a.rockets < 3 )
            self.a.rockets = 3;

        wait 1;
    }
}

_id_B5BE( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( var_0 <= 1 )
        return;

    var_7 = vectortoangles( var_2 );
    var_8 = anglestoforward( var_7 );
    var_9 = anglestoup( var_7 );
    var_10 = vectortoangles( var_2 ) + ( 0.0, 180.0, 0.0 );
    var_11 = anglestoforward( var_10 );
    playfx( common_scripts\utility::getfx( "headshot" ), var_3, var_8, var_9 );
    playfx( common_scripts\utility::getfx( "bodyshot" ), var_3, var_11, var_9 );
}

_id_ACE3( var_0, var_1, var_2, var_3 )
{
    var_0 = common_scripts\utility::array_randomize( var_0 );
    var_4 = undefined;

    foreach ( var_6 in var_0 )
    {
        if ( isdefined( var_6.script_parameters ) && var_6.script_parameters == "kicker" )
        {
            var_4 = var_6;
            break;
        }
    }

    if ( !isdefined( var_4 ) )
        var_4 = var_0[0];

    var_0 = common_scripts\utility::array_remove( var_0, var_4 );
    var_8 = var_4 maps\_utility::spawn_ai( 1 );
    var_8 thread maps\_utility::magic_bullet_shield( 1 );

    if ( var_0.size )
        maps\_utility::delaythread( 0.15, ::spawn_group, var_0 );

    var_9 = "door_kick_in";
    var_10 = "kick";

    if ( isdefined( var_2.script_noteworthy ) )
    {
        switch ( var_2.script_noteworthy )
        {
            case "wave":
                var_9 = "doorburst_wave";
                var_10 = "door_kick";
                break;
            case "search":
                var_9 = "doorburst_search";
                var_10 = "door_kick";
                break;
            case "fall":
                var_9 = "doorburst_fall";
                var_10 = "door_kick";
                break;
        }
    }

    var_2 thread maps\_anim::anim_generic( var_8, var_9 );
    var_8 waittillmatch( "single anim", var_10 );
    thread common_scripts\utility::play_sound_in_space( "door_wood_double_kick", var_1.origin );
    var_1 thread _id_B3C7( 0.25, 1 );

    if ( isdefined( var_3 ) )
        physicsexplosioncylinder( var_3.origin, var_3.radius, var_3.radius / 2, 1.0 );

    var_8 maps\_utility::stop_magic_bullet_shield();
    var_8.allowdeath = 1;
    var_8 waittillmatch( "single anim", "end" );

    if ( isalive( var_8 ) )
    {
        if ( isdefined( var_4.script_playerseek ) && var_4.script_playerseek > 0 )
            var_8 _id_AAF7();
        else if ( isdefined( var_4.target ) )
        {
            var_11 = getnode( var_4.target, "targetname" );

            if ( isdefined( var_11 ) )
            {
                var_8 _id_B92A( 96 );
                var_8 setgoalnode( var_11 );
                var_8 common_scripts\utility::waittill_notify_or_timeout( "goal", 5 );

                if ( isalive( var_8 ) )
                    var_8 _id_BB10();
            }
        }
    }
}

_id_C31F()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = "favela_chaotic_above_through";

    if ( isdefined( var_0.script_noteworthy ) )
        var_1 = var_0.script_noteworthy;

    var_0 maps\_anim::anim_generic_reach( self, var_1 );
    self.allowdeath = 1;
    var_0 maps\_anim::anim_generic( self, var_1 );
}

_id_A87B()
{
    self endon( "death" );
    _id_AFE3( "window_smash_stop_inside" );
    var_0 = getnode( self.target, "targetname" );

    if ( isdefined( self.script_playerseek ) && self.script_playerseek )
        _id_AAF7();
    else if ( isdefined( var_0 ) )
        self setgoalnode( var_0 );
}

_id_AFE3( var_0 )
{
    self endon( "death" );
    var_1 = "window smash guy at origin " + self.origin + " needs to be targeting a script_struct that he can use as his animref.";
    var_2 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_2 maps\_anim::anim_generic_reach( self, var_0 );
    var_2 maps\_anim::anim_generic( self, var_0 );
}

_id_B52F( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_2 = _id_C704();
    var_3 = _id_AF07( var_2 );
    self waittill( "spawned", var_4 );

    if ( maps\_utility::spawn_failed( var_4 ) )
        return;

    var_4 endon( "death" );
    var_4.animname = "curtain_pull";
    var_4 maps\_utility::set_ignoreme( 1 );
    var_4.usechokepoints = 0;
    wait 0.05;
    var_5[0] = var_4;
    var_5[1] = var_3;
    var_2 maps\_anim::anim_reach_solo( var_4, "pulldown" );

    if ( var_0 )
    {
        var_2 maps\_anim::anim_first_frame_solo( var_4, "pulldown" );

        if ( isdefined( var_1 ) )
            [[ var_1 ]]( var_4, var_2 );
        else
            maps\_utility::waittill_player_lookat( 0.9, undefined, 1, 5.0 );
    }

    var_4.allowdeath = 1;
    var_2 maps\_anim::anim_single( var_5, "pulldown" );
    var_4 endon( "death" );
    var_4 maps\_utility::set_ignoreme( 0 );
    var_4.goalradius = 1000;
    var_4 setgoalpos( var_4.origin );
    var_4.usechokepoints = 1;
}

_id_AF07( var_0 )
{
    if ( isdefined( var_0._id_CCA1 ) )
        return var_0._id_CCA1;

    var_1 = maps\_utility::spawn_anim_model( "curtain" );
    var_0 thread maps\_anim::anim_first_frame_solo( var_1, "pulldown" );
    var_0._id_CCA1 = var_1;
    return var_0._id_CCA1;
}

_id_C704()
{
    var_0 = getentarray( self.target, "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.classname == "script_origin" )
            return var_2;
    }
}

dialogue( var_0 )
{
    if ( !isdefined( level._id_AB8F ) )
        level._id_AB8F = spawnstruct();

    level._id_AB8F maps\_utility::function_stack( ::_id_AAD3, self, var_0 );
}

_id_AAD3( var_0, var_1 )
{
    if ( _func_2A5( var_0 ) )
        return;

    var_0 maps\_utility::dialogue_queue( var_1 );
}

_id_B8D4( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 3;

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
    wait(var_1);
    level._id_BED3 fadeovertime( var_2 );
    level._id_BED3.alpha = 0;
    wait(var_2);
    level._id_BED3 maps\_hud_util::destroyelem();
}

_id_A921( var_0, var_1 )
{
    if ( !isarray( var_1 ) )
    {
        var_2 = [];
        var_2[0] = var_1;
        var_1 = var_2;
    }

    var_3 = spawn( "script_origin", _id_D5AF( var_1 ).origin );
    var_3 playsound( var_0, "sound_done" );
    var_3 waittill( "sound_done" );
    var_3 delete();
}

delete_at_path_end()
{
    self waittill( "reached_path_end" );

    if ( isalive( self ) )
    {
        _id_B190::_id_D55F( self );
        self kill();
    }

    wait 0.1;

    if ( isdefined( self ) )
        self delete();
}

_id_C4B1()
{
    self endon( "death" );
    ignore_everything();
    common_scripts\utility::waittill_either( "reached_path_end", "damage" );
    _id_B97F();
}

_id_D50C()
{
    self endon( "death" );
    ignore_everything();
    self waittill( "reached_path_end" );
    _id_B97F();
}

_id_C8E9()
{
    self endon( "death" );
    ignore_everything();

    for (;;)
    {
        var_0 = common_scripts\utility::waittill_any_return( "reached_path_end", "damage" );

        if ( var_0 == "damage" )
        {
            _id_B97F();
            continue;
        }

        if ( var_0 == "reached_path_end" )
            break;
    }

    wait 0.1;

    if ( isdefined( self ) )
        self delete();
}

_id_C2FC()
{
    self endon( "death" );
    self waittill( "reached_path_end" );
    _id_AAF7();
}

_id_AAF7()
{
    self setgoalentity( level.player );
}

_id_AA7D( var_0 )
{
    self.animplaybackrate = var_0;
}

_id_CDBA( var_0 )
{
    self.usechokepoints = var_0;
}

_id_BABA()
{
    self.dontshootwhilemoving = undefined;
}

_id_ABA5( var_0 )
{
    self.moveplaybackrate = var_0;
}

_id_BFD0( var_0 )
{
    self.baseaccuracy = var_0;
}

_id_C5F1( var_0 )
{
    self setgoalvolume( var_0 );
}

_id_B6BB()
{
    self cleargoalvolume();
}

_id_ACC7( var_0 )
{
    self.health = var_0;
}

_id_B2D0( var_0 )
{
    self.ignoreall = var_0;
}

_id_ADEE( var_0 )
{
    self.ignoreme = var_0;
}

_id_CDC8( var_0 )
{
    self.walkdistfacingmotion = var_0;
}

_id_B92A( var_0 )
{
    if ( !isdefined( self._id_B4F7 ) )
        self._id_B4F7 = self.goalradius;

    self.goalradius = var_0;
}

_id_BB10()
{
    if ( isdefined( self._id_B4F7 ) )
        self.goalradius = self._id_B4F7;
}

_id_C368( var_0 )
{
    self._id_B9D4 = self getthreatbiasgroup();
    self setthreatbiasgroup( var_0 );
}

_id_B8B0()
{
    self setthreatbiasgroup( self._id_B9D4 );
}

_id_B286()
{
    if ( !isdefined( self.magic_bullet_shield ) || !self.magic_bullet_shield )
        thread maps\_utility::magic_bullet_shield();
}

_id_AB1C()
{
    if ( isdefined( self.magic_bullet_shield ) && self.magic_bullet_shield )
        thread maps\_utility::stop_magic_bullet_shield();
}

ignore_everything()
{
    self.ignoreall = 1;
    self.grenadeawareness = 0;
    self.ignoreexplosionevents = 1;
    self.ignorerandombulletdamage = 1;
    self.ignoresuppression = 1;
    self.fixednode = 0;
    self.disablebulletwhizbyreaction = 1;
    maps\_utility::disable_pain();
    self.og_newenemyreactiondistsq = self.newenemyreactiondistsq;
    self.newenemyreactiondistsq = 0;
}

_id_B97F()
{
    self.ignoreall = 0;
    self.grenadeawareness = 1;
    self.ignoreexplosionevents = 0;
    self.ignorerandombulletdamage = 0;
    self.ignoresuppression = 0;
    self.fixednode = 1;
    self.disablebulletwhizbyreaction = 0;
    maps\_utility::enable_pain();

    if ( isdefined( self.og_newenemyreactiondistsq ) )
        self.newenemyreactiondistsq = self.og_newenemyreactiondistsq;
}

_id_A85F()
{
    self.grenadeawareness = 0;
    self.ignoreexplosionevents = 1;
    self.ignorerandombulletdamage = 1;
    self.ignoresuppression = 1;
    self.disablebulletwhizbyreaction = 1;
    maps\_utility::disable_pain();
    self pushplayer( 1 );
}

_id_B846( var_0 )
{
    foreach ( var_2 in var_0 )
        var_2._id_BE1F = 0;
}

_id_B364( var_0 )
{
    ignore_everything();
    _id_B92A( 32 );
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self._id_BE1F = 1;
    _id_B97F();
}

_id_B74F( var_0 )
{
    for (;;)
    {
        var_1 = 0;

        foreach ( var_3 in var_0 )
        {
            if ( isalive( var_3 ) && !var_3._id_BE1F )
            {
                var_1 = 1;
                break;
            }
        }

        if ( !var_1 )
            break;

        wait 0.05;
    }

    level notify( "group_at_scriptedgoal" );
}

_id_D02E()
{
    var_0 = getaiarray( "axis" );
    return maps\_utility::array_removedead( var_0 );
}

_id_B562()
{
    var_0 = [];

    foreach ( var_2 in level._id_C2F8 )
    {
        if ( !isdefined( var_2._id_CC3F ) )
            var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_C905( var_0 )
{
    common_scripts\utility::flag_wait( "friends_setup" );
    var_1 = _id_B562();

    if ( isdefined( var_0 ) )
        var_1 = common_scripts\utility::array_remove( var_1, var_1[0] );

    maps\_utility::battlechatter_off( "allies" );

    foreach ( var_3 in var_1 )
    {
        level._id_C2F8 = common_scripts\utility::array_remove( level._id_C2F8, var_3 );
        var_3 maps\_utility::disable_replace_on_death();
        var_3 _id_AB1C();
        var_3 kill();
    }

    maps\_utility::battlechatter_on( "allies" );
}

_id_C826()
{
    _id_BFD0( level._id_BF72 );
    _id_CF21();
    _id_BA72();
}

_id_CF21()
{
    if ( isdefined( level._id_C2F8 ) && isdefined( level._id_C2F8[0] ) )
    {
        if ( level._id_C2F8[0] _meth_816F() )
            _id_AA25( 1 );
    }
}

_id_AA25( var_0 )
{
    self _meth_8170( var_0 );
    self.enablesprint = !var_0;

    if ( var_0 )
        maps\_utility::enable_cqbwalk();
    else
        maps\_utility::disable_cqbwalk();
}

_id_BA72()
{
    if ( !isdefined( level._id_C2F8 ) )
        level._id_C2F8 = [];

    level._id_C2F8 = common_scripts\utility::array_add( level._id_C2F8, self );
    thread _id_BC82();
}

_id_AD97()
{
    level._id_C2F8 = common_scripts\utility::array_remove( level._id_C2F8, self );
}

_id_BC82()
{
    self waittill( "death" );
    _id_AD97();
}

_id_CAF6()
{
    if ( isdefined( level._id_AB8F ) )
        level._id_AB8F maps\_utility::function_stack_clear();

    maps\_utility::array_notify( level._id_C2F8, "death" );
    var_0 = _id_B562();

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::disable_replace_on_death();
        var_2 _id_AB1C();
        var_2 delete();
    }

    level._id_BAD2 maps\_utility::disable_replace_on_death();
    level._id_C947 maps\_utility::disable_replace_on_death();
    level._id_BAD2 maps\_utility::stop_magic_bullet_shield();
    level._id_C947 maps\_utility::stop_magic_bullet_shield();
    level._id_BAD2 delete();
    level._id_C947 delete();
}

_id_AC5F( var_0 )
{
    level._id_C2F8 = common_scripts\utility::array_removeundefined( level._id_C2F8 );
    level._id_C2F8 = maps\_utility::array_removedead( level._id_C2F8 );
    var_1 = common_scripts\utility::getstructarray( var_0, "targetname" );
    var_2 = common_scripts\utility::getstruct( var_0 + "_player", "targetname" );

    foreach ( var_7, var_4 in level._id_C2F8 )
    {
        var_5 = var_1[var_7].origin;
        var_6 = var_1[var_7].angles;
        var_4 thread _id_B205( var_5, var_6 );
    }

    level.player _id_B205( var_2.origin, var_2.angles );
}

_id_B21F( var_0 )
{
    _id_B205( var_0.origin, var_0.angles );
}

_id_B205( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0.0, 0.0, 0.0 );

    if ( !isplayer( self ) )
    {
        self forceteleport( maps\_utility::groundpos( var_0 ), var_1 );
        self setgoalpos( self.origin );
    }
    else
    {
        var_2 = level.player common_scripts\utility::spawn_tag_origin();
        level.player playerlinkto( var_2, "tag_origin", 1 );
        var_2 moveto( var_0, 0.05 );
        var_2 rotateto( var_1, 0.05 );
        wait 0.1;
        level.player unlink();
        var_2 delete();
    }
}

_id_C540( var_0, var_1 )
{
    if ( var_0.size < 1 )
        return;

    var_2 = var_1 / var_0.size;

    foreach ( var_5, var_4 in var_0 )
    {
        var_4 thread bloody_death( 0 );

        if ( var_5 != var_0.size - 1 )
            wait(var_2);
    }
}

_id_B7AF( var_0, var_1 )
{
    wait(var_0);
    bloody_death( var_1 );
}

bloody_death( var_0 )
{
    self endon( "death" );

    if ( !issentient( self ) || !isalive( self ) )
        return;

    if ( isdefined( self.bloody_death ) && self.bloody_death )
        return;

    self.bloody_death = 1;

    if ( isdefined( var_0 ) )
        wait(randomfloat( var_0 ));

    var_1 = [];
    var_1[0] = "j_hip_le";
    var_1[1] = "j_hip_ri";
    var_1[2] = "j_head";
    var_1[3] = "j_spine4";
    var_1[4] = "j_elbow_le";
    var_1[5] = "j_elbow_ri";
    var_1[6] = "j_clavicle_le";
    var_1[7] = "j_clavicle_ri";

    for ( var_2 = 0; var_2 < 3 + randomint( 5 ); var_2++ )
    {
        var_3 = randomintrange( 0, var_1.size );
        thread bloody_death_fx( var_1[var_3], undefined );
        wait(randomfloat( 0.1 ));
    }

    self dodamage( self.health + 50, self.origin );
}

bloody_death_fx( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level._effect["flesh_hit"];

    playfxontag( var_1, self, var_0 );
}

_id_CC6E( var_0, var_1, var_2 )
{
    thread _id_B161();
    level endon( "color_flags_advance_stop" );
    var_3 = "allies";

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    for ( var_4 = var_2; var_4 <= var_1; var_4++ )
    {
        var_5 = var_0 + "_" + var_4;
        var_6 = getent( var_5, "targetname" );
        var_7 = getent( var_6.target, "targetname" );
        common_scripts\utility::flag_wait( var_5 );
        var_8 = var_7 maps\_colors::_id_AC4A( var_7.script_color_allies, var_3 );
        var_9 = var_8["colorCodes"];
        var_10 = var_8["colorCodesByColorIndex"];
        var_11 = var_8["colors"];
        var_12 = [];

        foreach ( var_14 in var_9 )
        {
            var_15 = level.arrays_of_colorcoded_volumes[var_3][var_14];

            if ( isdefined( var_15 ) )
            {
                var_16 = spawnstruct();
                var_16._id_B9B4[0] = var_14;
                var_17 = getsubstr( var_14, 0, 1 );
                var_16.colors[0] = var_17;
                var_16._id_AD7D[var_17] = var_10[var_17];
                var_16._id_D540 = var_7;
                var_16.name = var_5;
                var_16.volume = var_15;
                var_12[var_12.size] = var_16;
            }
        }

        common_scripts\utility::array_thread( var_12, ::_id_C615 );
    }
}

_id_B161()
{
    level waittill( "color_flags_advance_stop" );
    level._id_B112 = undefined;
}

_id_CB28( var_0 )
{
    level endon( "color_flags_advance_stop" );

    for (;;)
    {
        if ( level._id_B112[var_0].size )
        {
            var_1 = level._id_B112[var_0][0];
            var_1 _id_CEC2();
            continue;
        }

        level waittill( "color_flag_advance_queue_updated" );
    }
}

_id_C615()
{
    var_0 = self.colors[0];

    if ( !isdefined( level._id_B112 ) )
        level._id_B112 = [];

    var_1 = getarraykeys( level._id_B112 );
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( var_4 == var_0 )
        {
            var_2 = 1;
            break;
        }
    }

    if ( !var_2 )
    {
        level._id_B112[var_0] = [];
        thread _id_CB28( var_0 );
    }

    level._id_B112[var_0][level._id_B112[var_0].size] = self;
    level notify( "color_flag_advance_queue_updated" );
}

_id_CA37()
{
    var_0 = self.colors[0];
    level._id_B112[var_0] = common_scripts\utility::array_remove( level._id_B112[var_0], self );
}

_id_CEC2()
{
    level endon( "color_flags_advance_stop" );
    self.volume maps\_utility::waittill_volume_dead_or_dying();
    self._id_D540 thread maps\_colors::_id_B659( self._id_B9B4, self.colors, "allies", self._id_AD7D );
    _id_CA37();
}

_id_C6A7( var_0, var_1 )
{
    if ( !var_0.size )
        return 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_B9B4[0] == var_1 )
            return 1;
    }

    return 0;
}

_id_D086()
{
    _id_C2AD();
    var_0 = "airliner_flyby";
    common_scripts\utility::flag_init( var_0 );
    var_1 = getentarray( "trig_airliner_flyby", "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_B6C2, var_0 );
}

_id_AEF0()
{
    var_0 = getentarray( "sbmodel_airliner_flyby", "targetname" );
    level._id_C50D = var_0;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = [];
    var_6 = [];

    foreach ( var_8 in var_0 )
    {
        if ( var_8.code_classname == "script_origin" )
        {
            switch ( var_8.script_noteworthy )
            {
                case "origin_marker":
                    var_1 = var_8;
                    continue;
                case "light_wingtip_left":
                    var_2 = var_8;
                    continue;
                case "light_belly":
                    var_3 = var_8;
                    continue;
                case "light_tail":
                    var_4 = var_8;
                    continue;
                case "light_wingtip_right":
                    var_5[var_5.size] = var_8;
                    continue;
                case "engine_exhaust":
                    var_6[var_6.size] = var_8;
                    continue;
            }
        }
    }

    var_10 = common_scripts\utility::array_remove( var_0, var_1 );
    var_2 = _id_BC2A( var_2, "airliner_wingtip_left" );
    var_3 = _id_BC2A( var_3, "airliner_belly" );
    var_4 = _id_BC2A( var_4, "airliner_tail" );
    var_5 = _id_D32D( var_5, "airliner_wingtip_right" );
    var_6 = _id_D32D( var_6, "airliner_exhaust" );
    var_10[var_10.size] = var_2;
    var_10[var_10.size] = var_3;
    var_10[var_10.size] = var_4;
    var_10 = common_scripts\utility::array_combine( var_10, var_5 );
    var_10 = common_scripts\utility::array_combine( var_10, var_6 );

    foreach ( var_8 in var_10 )
        var_8 linkto( var_1 );

    var_1._id_CBEC = var_1.angles;
    return var_1;
}

_id_BC2A( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        var_2 = var_0 common_scripts\utility::spawn_tag_origin();
        var_0 = var_2;
        playfxontag( common_scripts\utility::getfx( var_1 ), var_0, "tag_origin" );
        return var_0;
    }

    return undefined;
}

_id_D32D( var_0, var_1 )
{
    if ( var_0.size )
    {
        var_2 = [];

        foreach ( var_4 in var_0 )
        {
            var_5 = var_4 common_scripts\utility::spawn_tag_origin();
            var_2[var_2.size] = var_5;
        }

        var_0 = var_2;

        foreach ( var_4 in var_0 )
            playfxontag( common_scripts\utility::getfx( var_1 ), var_4, "tag_origin" );

        return var_0;
    }

    return undefined;
}

_id_C2AD()
{
    common_scripts\utility::array_call( level._id_C50D, ::hide );
}

_id_B4CD()
{
    common_scripts\utility::array_call( level._id_C50D, ::show );
}

_id_B6C2( var_0 )
{
    var_1 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    self waittill( "trigger" );

    if ( isdefined( self.script_flag_wait ) )
        common_scripts\utility::flag_wait( self.script_flag_wait );

    if ( isdefined( self.script_delay ) )
        wait(self.script_delay);

    level notify( "airliner_flyby" );
    var_3 = 1500;

    if ( isdefined( var_1.speed ) )
        var_3 = var_1.speed;

    common_scripts\utility::flag_waitopen( var_0 );
    common_scripts\utility::flag_set( var_0 );
    level._id_BC7B.origin = var_1.origin;

    if ( isdefined( var_1.angles ) )
        level._id_BC7B.angles = var_1.angles;
    else
        level._id_BC7B.angles = level._id_BC7B._id_CBEC;

    wait 0.05;
    _id_B4CD();
    level._id_BC7B thread _id_B309( self );
    var_4 = int( self.script_noteworthy );
    level._id_BC7B thread _id_C555( var_4 );
    var_5 = distance( var_1.origin, var_2.origin );
    var_6 = var_5 / var_3;
    level._id_BC7B moveto( var_2.origin, var_6 );
    level._id_BC7B waittill( "movedone" );
    _id_C2AD();
    common_scripts\utility::flag_clear( var_0 );
    self delete();
}

_id_B309( var_0 )
{
    if ( isdefined( var_0.script_sound ) )
    {
        maps\_utility::play_sound_on_entity( var_0.script_sound );
        return;
    }
}

stop_sound( var_0 )
{
    self notify( "stop sound" + var_0 );
}

_id_B3C7( var_0, var_1 )
{
    var_2 = undefined;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_3 = getent( self.target, "targetname" );
    self linkto( var_3 );

    if ( isdefined( var_3.target ) )
    {
        var_2 = getent( var_3.target, "targetname" );
        var_2 linkto( self );
        var_2 connectpaths();
    }
    else
        self connectpaths();

    var_3._id_CBEC = var_3.angles;
    var_3 rotateto( var_3.script_angles, var_0 );
    var_3 waittill( "rotatedone" );

    if ( isdefined( var_2 ) )
    {
        var_2 disconnectpaths();
        var_2 unlink();

        if ( var_1 )
        {
            var_2 notsolid();
            var_2 thread _id_AC15();
        }
    }
    else
        self disconnectpaths();

    self unlink();

    if ( var_1 )
    {
        self notsolid();
        thread _id_AC15();
    }

    self notify( "sbmodel_rotatedone" );
}

_id_AC15()
{
    while ( level.player istouching( self ) )
        wait 0.05;

    self solid();
}

_id_C927( var_0 )
{
    var_1 = getent( self.target, "targetname" );
    var_2 = undefined;
    self linkto( var_1 );

    if ( isdefined( var_1.target ) )
    {
        var_2 = getent( var_1.target, "targetname" );
        var_2 linkto( self );
        var_2 connectpaths();
    }
    else
        self connectpaths();

    var_1 rotateto( var_1._id_CBEC, var_0 );
    var_1 waittill( "rotatedone" );

    if ( isdefined( var_2 ) )
    {
        var_2 disconnectpaths();
        var_2 unlink();
    }
    else
        self disconnectpaths();

    self unlink();
    self notify( "sbmodel_rotatedone" );
}

_id_D5C9( var_0, var_1, var_2 )
{
    var_3 = self._id_C181;
    var_4 = common_scripts\utility::getstruct( "hind_fakefire_impactLine_start", "targetname" );
    var_5 = common_scripts\utility::getstruct( var_4.target, "targetname" );
    var_6 = var_0 / var_1;
    var_7 = distance2d( var_4.origin, var_5.origin );
    var_8 = var_7 / var_6;
    var_9 = var_4.origin;
    var_10 = vectornormalize( var_5.origin - var_4.origin );
    var_11 = vectortoangles( var_10 );
    var_12 = anglestoforward( var_11 );
    var_13 = -25;
    var_14 = 25;
    var_15 = getaiarray( "axis" );
    var_16 = 64;
    var_17 = gettime();

    for ( var_18 = 0; var_18 < var_6; var_18++ )
    {
        var_19 = maps\_utility::groundpos( var_9 );
        var_20 = randomfloatrange( var_13, var_14 );
        var_21 = randomfloatrange( var_13, var_14 );
        var_22 = ( var_19[0] + var_20, var_19[1] + var_21, var_19[2] );
        magicbullet( var_2, var_3 gettagorigin( "tag_flash" ), var_22 );

        foreach ( var_24 in var_15 )
        {
            if ( !isalive( var_24 ) )
                continue;

            if ( distance2d( var_24.origin, var_19 ) < 64 )
                var_24 kill();
        }

        wait(var_1);
        var_9 += var_12 * var_8;
    }
}

player_can_see( var_0 )
{
    if ( !level.player animscripts\battlechatter::pointinfov( var_0 ) )
        return 0;

    if ( sighttracepassed( level.player geteye(), var_0, 0, level.player ) )
        return 1;

    return 0;
}

_id_D3ED()
{
    var_0 = getentarray( "delete", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_D459 );
}

_id_D459()
{
    self waittill( "trigger" );
    wait 0.05;

    if ( isdefined( self ) )
        self delete();
}

minigun_spinup()
{
    if ( self getbarrelspinrate() == 1 )
        return;

    self startbarrelspin();

    while ( self getbarrelspinrate() < 1 )
        wait 0.05;
}

_id_B87F( var_0, var_1 )
{
    var_1 endon( "death" );
    level endon( "objective_complete" + var_0 );

    for (;;)
    {
        objective_position( var_0, var_1.origin );
        wait 0.05;
    }
}

_id_CAAF( var_0, var_1 )
{
    self endon( "death" );

    while ( isdefined( self ) && isdefined( var_0 ) )
    {
        var_0 waittill( "trigger", var_2 );

        if ( self == var_2 )
        {
            var_3 = gettime() + _id_BB22( var_1 );

            while ( gettime() < var_3 )
            {
                wait 0.1;

                if ( !self istouching( var_0 ) )
                    break;
            }

            if ( gettime() >= var_3 )
            {
                var_0 notify( "trigger_fuse", self );
                return;
            }
        }

        wait 0.05;
    }
}

_id_AF01( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( !var_1.size )
        return;

    var_2 = undefined;

    if ( var_1.size > 1 )
    {
        common_scripts\utility::array_thread( var_1, ::_id_C36D, var_0 );
        level waittill( var_0, var_2 );
    }
    else
        var_1[0] waittill( "trigger", var_2 );

    return var_2;
}

_id_C36D( var_0 )
{
    self endon( var_0 );
    self waittill( "trigger", var_1 );
    level notify( var_0, var_1 );
}

_id_B082( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        var_1 notify( "trigger" );
}

_id_ABFE( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 notify( "trigger" );
}

_id_ADF1( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_0 );
    self thread [[ var_1 ]]();
}

_id_CDCA( var_0 )
{
    while ( !isdefined( var_0 ) )
        wait 0.05;
}

_id_B172( var_0 )
{
    while ( isdefined( var_0 ) )
        wait 0.05;
}

_id_BB22( var_0 )
{
    return var_0 * 1000;
}

_id_AB14( var_0 )
{
    return var_0 / 1000;
}

fade_to_black( var_0, var_1 )
{
    level.black_overlay = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    level.black_overlay fadeovertime( var_0 );
    level.black_overlay.alpha = 1;

    if ( isdefined( var_1 ) )
        level.black_overlay.foreground = var_1;

    wait(var_0);
}

_id_CB3D( var_0 )
{
    level.black_overlay fadeovertime( var_0 );
    level.black_overlay.alpha = 0;
    wait(var_0);
    level.black_overlay destroy();
}

_id_C4DD()
{
    var_0 = getentarray( "flood_spawner", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

_id_D5AF( var_0 )
{
    if ( var_0.size == 1 )
        return var_0[0];

    return var_0[randomint( var_0.size - 1 )];
}

_id_B311()
{
    for (;;)
        wait 0.05;
}

_id_B4BF()
{
    setsaveddvar( "r_spotlightStartRadius", 36 );
    setsaveddvar( "r_spotlightEndRadius", 325 );
    setsaveddvar( "r_spotlightBrightness", 0.9 );
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = level.player geteye();
    var_0.angles = level.player getplayerangles();
    var_0 thread _id_D2D8();
    var_1 = common_scripts\utility::getfx( "flashlight" );
    playfxontag( var_1, var_0, "tag_origin" );
    level.player._id_CCF6 = var_0;
}

_id_D2D8()
{
    for (;;)
    {
        var_0 = level.player getplayerangles();
        var_1 = level.player geteye();

        if ( self.angles != var_0 )
            self.angles = var_0;

        if ( self.origin != var_1 )
            self.origin = var_1;

        wait 0.05;
    }
}

_id_C555( var_0 )
{
    self endon( "movedone" );
    var_1 = _id_B77E();

    while ( var_1 > var_0 )
    {
        var_1 = _id_B77E();
        wait 0.5;
    }

    level.player _meth_80B5( "airliner_flyby" );
    wait 4;
    level.player _meth_80B6( "airliner_flyby" );
}

_id_B77E()
{
    var_0 = level.player.origin;
    var_1 = level._id_BC7B.origin;
    var_2 = distance( var_0, var_1 );
    return var_2;
}

_id_BE88()
{
    maps\_utility::trigger_wait_targetname( "trig_alley_carstart" );
    var_0 = getent( "spawn_enemies_slope_trigger", "targetname" );

    if ( !common_scripts\utility::flag( "pickup2_spawned" ) )
    {
        wait 1.5;
        var_0 thread maps\_utility::notify_delay( "trigger", 1.5 );
    }
    else
    {
        wait 0.6;
        var_0 thread maps\_utility::notify_delay( "trigger", 1.5 );
    }

    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "fire_car_slope" );
    playfxontag( level._effect["fire_crash_jeepride"], var_1, "tag_body" );
    var_1.mgturret[0] delete();
    var_1 thread maps\favela_escape_aud::_id_D11E();
    var_1 waittill( "reached_end_node" );
    var_1 dodamage( var_1.health, var_1.origin );
}

_id_D0BD()
{
    common_scripts\_exploder::exploder( "fence_destruction_1" );
}

_id_CB9F()
{
    level endon( "move_ai_intro" );
    var_0 = getent( "intro_anim_node", "targetname" );
    var_1 = maps\_utility::spawn_anim_model( "payphone" );
    level._id_BAD2.payphone = var_1;
    var_2 = [ level._id_C947, level._id_BAD2 ];
    thread move_ai_intro( var_2 );
    var_0 maps\_anim::anim_first_frame( var_2, "opening_radiotower" );
    var_0 thread maps\_anim::anim_single_solo( var_1, "opening_radiotower" );
    var_0 maps\_anim::anim_single( var_2, "opening_radiotower" );
    var_3 = getnode( "node_sarge_post_intro_goal", "targetname" );
    level._id_BAD2 setgoalnode( var_3 );
    var_4 = getnode( "node_hero1_post_intro_goal", "targetname" );
    level._id_C947 setgoalnode( var_4 );
    common_scripts\utility::flag_wait( "player_start_moving" );
    common_scripts\utility::flag_set( "move_ai_intro" );
}

_id_A8E1()
{
    self hide();
    var_0 = getent( "chicken_box", "targetname" );
    var_0 setcandamage( 1 );
    var_1 = [ "crazy01", "crazy02" ];
    var_2 = [ "death01", "death02" ];
    var_3 = common_scripts\utility::random( var_1 );
    var_4 = common_scripts\utility::random( var_2 );
    maps\_utility::assign_animtree( "chicken_anim" );
    thread maps\_anim::anim_loop_solo( self, var_3 );
    var_0 waittill( "damage" );
    playfx( level._effect["chicken_box"], var_0.origin );
    playfx( level._effect["chicken_box_impact"], var_0.origin );
    playfx( level._effect["chicken_box_burst"], var_0.origin );
    var_0 delete();
    self show();
    wait 1.1;
    var_5 = getent( self.target, "targetname" );
    var_5 setcandamage( 1 );
    var_5 waittill( "damage" );
    var_5 delete();
    maps\_anim::anim_single_solo( self, var_4 );
    wait 30;
    self delete();
}

_id_B4CA( var_0, var_1, var_2 )
{
    wait(var_0);
    level.player _meth_80B5( var_1 );
    wait(var_2);
    level.player _meth_80B6( var_1 );
}

_id_B45C( var_0 )
{
    level.player endon( "mantle" );

    for (;;)
    {
        var_1 = level.player getstance();

        if ( level.player istouching( var_0 ) && var_1 != "crouch" && var_1 != "prone" )
            setsaveddvar( "hud_forceMantleHint", 1 );
        else
            setsaveddvar( "hud_forceMantleHint", 0 );

        wait 0.05;
    }
}

destroyed_car_no_burn()
{
    var_0 = getent( "crushed_car", "targetname" );
    var_0 maps\_utility::assign_animtree( "car" );
    var_0 maps\_anim::anim_last_frame_solo( var_0, "destroyed_car" );
}

animated_soccer_goals()
{
    var_0 = getentarray( "soccer_goal", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread animated_soccer_goals_think();
}

helicopter_soccerfield_exploder()
{
    common_scripts\utility::flag_wait( "market_evac_player_near_soccerfield" );
    common_scripts\_exploder::exploder( "heli_dust_large_soccer" );
    common_scripts\_exploder::exploder( "heli_dust_large_soccer_02" );
}

animated_soccer_goals_think()
{
    maps\_utility::assign_animtree( "goals" );
    thread maps\_anim::anim_loop_solo( self, "soccer_goal", "stop_idle" );
    common_scripts\utility::flag_wait( "market_evac_player_near_soccerfield" );
    self notify( "stop_idle" );
    maps\_anim::anim_single_solo( self, "soccer_goal_heli" );
    maps\_anim::anim_single_solo( self, "soccer_goal_heli2idle" );
    thread maps\_anim::anim_loop_solo( self, "soccer_goal" );
}

soccerfield_animated_wires()
{
    var_0 = getent( "animated_wires", "targetname" );
    var_0 maps\_utility::assign_animtree( "heavy_wires" );
    common_scripts\utility::flag_wait( "market_evac_player_near_soccerfield" );
    var_0 maps\_anim::anim_single_solo( var_0, "helicopter_wires" );
}

playerjump_roof_fx()
{
    common_scripts\utility::flag_wait( "roofrun_player_bigjump_start" );
    common_scripts\_exploder::exploder( "dust_player_jump_top_favela_s" );
    common_scripts\_exploder::exploder( "dust_player_jump_top_02_favela_s" );
    wait 0.25;
    common_scripts\_exploder::exploder( "dust_player_jump_down_favela_s" );
}

soap_random_idle_anims( var_0, var_1 )
{
    self endon( "sarge_idle_stop" );
    var_2 = [];
    var_2[0] = "favela_escape_rooftop_traverse_M_idle_dialog1";
    var_2[1] = "favela_escape_rooftop_traverse_M_idle_dialog2";
    var_2[2] = "favela_escape_rooftop_traverse_M_idle_dialog3";

    for (;;)
    {
        var_3 = common_scripts\utility::random( var_2 );
        maps\_anim::anim_single_solo( var_0, var_1 );
        maps\_anim::anim_single_solo( var_0, var_3 );
    }
}

animated_airconditioners_setup()
{
    var_0 = getentarray( "airconditioner_animated", "targetname" );
    common_scripts\utility::array_thread( var_0, ::animated_airconditioners_think );
}

animated_airconditioners_think()
{
    maps\_utility::assign_animtree( "airconditioner" );
    maps\_anim::anim_loop_solo( self, "idle" );
}

blend_player_anim_and_linktodelta( var_0 )
{
    level.player playerlinktoblend( var_0, "tag_player", 0.5, 0.25, 0.25 );
    wait 1.2;
    level.player playerlinktodelta( var_0, "tag_player", 1, 0, 0, 0, 0 );
}

player_on_slide_magic_bullet()
{
    var_0 = getentarray( "bullet_slide", "targetname" );
    var_1 = getent( "bullet_slide_start", "targetname" );
    common_scripts\utility::flag_wait( "trig_solorun_player_on_slide" );

    foreach ( var_3 in var_0 )
    {
        magicbullet( "ak47", var_1.origin, var_3.origin );
        wait 0.1;
    }
}

move_ai_intro( var_0 )
{
    common_scripts\utility::flag_wait( "move_ai_intro" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::enable_ai_color();

    _id_ABFE( "trig_script_color_allies_b0" );
}

_id_C3F2()
{
    var_0 = getent( "fan_spin", "targetname" );
    var_0 rotatevelocity( ( 0.0, 0.0, 100.0 ), 200 );
}

wibble_helicopter()
{
    _func_2F1( 0, "xy", 2.2, 2 );
}

early_fall_kill_trig_remove()
{
    var_0 = getent( "early_fall_kill", "targetname" );
    var_0 delete();
}
