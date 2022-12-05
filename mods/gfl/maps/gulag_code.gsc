// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_B123()
{
    level.player_repulsor = missile_createrepulsorent( level.player, 10000, 800 );
    var_0 = getent( "looker_guy", "script_noteworthy" );
    var_0 maps\_utility::add_spawn_function( ::_id_D3C1 );
    level._id_ABFD = [];
    level.player.ignorerandombulletdamage = 1;
    maps\_utility::player_cant_be_shot();
    level._id_CB62 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_intro_player" );

    if ( !isdefined( level.helis ) )
        level.helis = [];

    level.helis = common_scripts\utility::array_add( level.helis, level._id_CB62 );
    thread _id_B535();
    level._id_CB62 thread maps\gulag_aud::_id_CE86();
    level._id_CB62 thread _id_C98D();
    level._id_CB62 setmaxpitchroll( 10, 10 );
    level._id_CB62 thread _id_AD3C();
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player _meth_830F( 0 );
    level.player allowjump( 0 );
    level._id_CB62 thread _id_B044();
    thread _id_AA8A();
    level._id_CB62 thread maps\_vehicle::godon();
    level._id_CB62 thread _id_B9C7();
    var_1 = maps\_utility::get_player_view_controller( level._id_CB62, "tag_guy2", ( 0.0, 0.0, -8.0 ) );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2 linkto( level._id_CB62, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.ground_ref = var_2;
    level.player playersetgroundreferenceent( var_2 );
    var_3 = getent( "gulag_center", "targetname" );
    level.view_org = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    level.view_org.origin = var_3.origin;
    level._id_C2E3 = var_3.origin;
    level._id_CC0B = var_1;
    var_1 settargetentity( level.view_org );
    var_4 = 1;
    var_5 = level._id_CB62 gettagorigin( "tag_guy2" );
    level.player setorigin( var_5 );
    thread _id_B63B();
    wait 0.1;
    level.player playerlinktodelta( var_1, "TAG_aim", var_4, -16.95, 16.95, -9.6, 9.6, 1 );
    thread _id_C033();
    thread gulag_heli_intro_rumbles_seq();
    var_6 = 0.05;
    wait(var_6);
    wait(3 - var_6);
    common_scripts\utility::flag_wait( "approach_dialogue" );
    common_scripts\utility::flag_wait( "player_goes_in_for_landing" );
    var_1 cleartargetentity();
    var_1 settargetentity( var_3 );
    common_scripts\utility::flag_wait( "player_goes_in_for_landing" );
    var_7 = 45;
    var_8 = 45;
    var_9 = 15;
    var_10 = 45;
    wait 1;
    level.player playerlinktodelta( var_1, "TAG_aim", var_4, var_7, var_8, var_9, var_10, 1 );
}

gulag_heli_intro_rumbles_seq()
{
    wait 0.5;
    var_0 = _id_D397::_id_A97A( "gulag_heli_intro_rumbles" );
    var_0 _id_D397::_id_BEA0( 15.6 ) _id_D397::_id_B85E( 0.1, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 16.25 ) _id_D397::_id_B85E( 0.08, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 19.95 ) _id_D397::_id_B85E( 0.1, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 20.7 ) _id_D397::_id_B85E( 0.15, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 20.86 ) _id_D397::_id_B85E( 0.12, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 30.3 ) _id_D397::_id_B85E( 0.12, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 46.75 ) _id_D397::_id_B85E( 0.12, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BC26();
}

_id_B63B()
{
    thread _id_CA06( 52.8 );
    thread _id_B288( 55, 0.07 );
    level.player _meth_84B8();
    var_0 = _id_BFA0( 26.0, 32, 1.5, 1.5 );
    var_1 = _id_BFA0( 12.0, 1000, 2.5, 2.5 );
    var_2 = _id_BFA0( 16.0, 1000, 3.0, 3.0 );
    level.player _meth_84BA( var_1._id_C6DE, var_1._id_CF89, 64, 64 );
    thread _id_BB4C( var_0, var_1, "stabilize", 999 );
    common_scripts\utility::flag_wait( "stabilize" );
    level.player _meth_84B9();
    common_scripts\utility::flag_wait( "stab1_clear" );
    common_scripts\utility::flag_wait( "stab1_shift" );
    wait 0.5;
    thread _id_B288( 5, 0.06 );
    common_scripts\utility::flag_wait( "stabilize" );
    common_scripts\utility::flag_wait( "stab2_clear" );
    wait 0.5;
    thread _id_B288( 6.5, 0.06 );
    wait 0.5;
    wait 6.0;
    wait 2.5;
    wait 2.5;
    thread _id_B288( 12, 0.07 );
    wait 12.0;
    thread _id_B288( 12.5, 0.05 );
    wait 7.5;
    wait 5.0;
}

_id_BB4C( var_0, var_1, var_2, var_3 )
{
    var_4 = ( 0.0, 0.0, 0.0 );
    var_5 = ( 0.0, 0.0, 0.0 );
    var_6 = 0;
    var_7 = var_3;
    var_8 = -31;

    while ( var_6 < var_7 )
    {
        var_9 = level._id_CB62 gettagorigin( "tag_guy2" );
        var_9 = anglestoforward( vectornormalize( var_9 ) );
        var_10 = level.player getplayerangles();
        var_10 = anglestoforward( var_10 );
        var_11 = _func_1FA( var_9[1], var_9[0] ) - _func_1FA( var_10[1], var_10[0] );

        if ( var_11 < var_8 )
        {
            var_12 = var_1._id_C6DE;
            var_13 = var_1._id_CF89;
            var_14 = var_1._id_C416;
            var_15 = var_1._id_BE00;
        }
        else
        {
            var_12 = var_0._id_C6DE;
            var_13 = var_0._id_CF89;
            var_14 = var_0._id_C416;
            var_15 = var_0._id_BE00;
        }

        level.player _meth_84BA( var_12, var_13, var_14, var_15 );
        wait 0.05;
        var_6 += 0.05;

        if ( var_2 != "" && common_scripts\utility::flag( var_2 ) )
            break;
    }

    level.player _meth_84BA( var_1._id_C6DE, var_1._id_CF89, var_1._id_C416, var_1._id_BE00 );
}

_id_BFA0( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_C6DE = var_0;
    var_4._id_CF89 = var_1;
    var_4._id_C416 = var_2;
    var_4._id_BE00 = var_3;
    return var_4;
}

_id_CA06( var_0 )
{
    setsaveddvar( "r_mbEnable", 2 );
    wait(var_0);
    setsaveddvar( "r_mbEnable", 0 );
}

_id_C033()
{
    wait 0.5;
    level.player lerpviewangleclamp( 0, 0, 0, 0, 0, -6, 6 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 0.5;
    var_0 = 22;
    var_1 = 90;
    var_2 = 15;
    var_3 = 45;
    level.player lerpviewangleclamp( 0, 0, 0, var_0, var_1, var_2, var_3 );
    level.player _meth_85AA( 90, 0, 0, 145 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    common_scripts\utility::flag_wait( "approach_dialogue" );
    var_0 = 27;
    var_1 = 85;
    var_2 = 15;
    var_3 = 45;
    level.player lerpviewangleclamp( 0.0, 0.0, 0.0, var_0, var_1, var_2, var_3 );
    level.player _meth_85AA( 90, 0, 0, 145 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    common_scripts\utility::flag_wait( "clear_dof" );
    wait 2.15;
    var_0 = 35;
    var_1 = -30;
    var_2 = 0;
    var_3 = 3;
    level.player lerpviewangleclamp( 1.9, 0.25, 0.75, var_0, var_1, var_2, var_3 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 2.0;
    wait 1.15;
    var_0 = 32;
    var_1 = -32;
    var_2 = 20;
    var_3 = -20;
    level.player lerpviewangleclamp( 1.15, 0.25, 0.25, var_0, var_1, var_2, var_3 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 1.25;
    wait 0.55;
    var_0 = 35;
    var_1 = 40;
    var_2 = 15;
    var_3 = 45;
    level.player lerpviewangleclamp( 1.0, 0.5, 0.25, var_0, var_1, var_2, var_3 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 5.2;
    var_0 = 35;
    var_1 = 10;
    var_2 = 15;
    var_3 = 40;
    level.player lerpviewangleclamp( 6.0, 0.25, 0.25, var_0, var_1, var_2, var_3 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 6.0;
    var_0 = 35;
    var_1 = 35;
    var_2 = 15;
    var_3 = 40;
    level.player lerpviewangleclamp( 6.0, 0.25, 0.25, var_0, var_1, var_2, var_3 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 12.0;
    var_0 = 5;
    var_1 = 10;
    var_2 = 10;
    var_3 = 5;
    level.player lerpviewangleclamp( 1.4, 0.25, 0.25, var_0, var_1, var_2, var_3 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 1.65;
    var_0 = -5;
    var_1 = 5;
    var_2 = 5;
    var_3 = 5;
    level.player lerpviewangleclamp( 0.5, 0.15, 0.15, var_0, var_1, var_2, var_3 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_B288( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0; var_2 += 0.25 )
    {
        earthquake( var_1, 3.0, level.player.origin, 4096 );
        wait 0.25;
    }
}

_id_B096( var_0 )
{
    var_1 = 45;
    var_2 = 45;
    var_3 = 15;
    var_4 = 45;
    var_5 = 2;
    level.player playerlinktodelta( var_0, "tag_origin", 1, var_1, var_2, var_3, var_4, 1 );
}

_id_BC43( var_0 )
{
    for (;;)
        wait 0.05;
}

_id_CAE1()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0 linkto( level._id_CB62, "tag_guy2", ( 0.0, 0.0, -16.0 ), ( 0.0, 90.0, 0.0 ) );
    level.player lerpviewangleclamp( 1, 0.25, 0.25, 25, 25, 15, 25 );
    wait 1;
    var_1 = 1;
    var_2 = 45;
    var_3 = 45;
    var_4 = 15;
    var_5 = 45;
    level.player playerlinktodelta( var_0, "tag_origin", var_1, var_2, var_3, var_4, var_5, 1 );
}

_id_BB52( var_0, var_1 )
{
    var_2 = [ "head_seal_udt_d_lifesaver_gulag_intro", "head_seal_udt_a_gulag_intro", "head_seal_udt_c_gulag_intro", "head_seal_udt_d_gulag_intro", "head_seal_udt_e_gulag_intro", "h2_head_seal_udt_b_c_gulag_intro" ];

    foreach ( var_4 in var_0 )
    {
        var_5 = getentarray( var_4.target, "targetname" );

        // foreach ( var_7 in var_5 )
        // {
        //     var_7.count = 1;
        //     var_7 maps\_utility::add_spawn_function( ::_id_C9A7, var_2 );
        // }
    }

    var_10 = [];
    var_11 = 0;

    foreach ( var_13 in var_0 )
    {
        var_14 = var_13 maps\_utility::spawn_vehicle();
        var_14 thread maps\_vehicle::gopath();
        var_14 thread maps\gulag::_id_B54B( var_1[var_11] );
        var_14 thread _id_AE04();
        var_10[var_10.size] = var_14;
        var_11++;
    }

    common_scripts\utility::array_thread( var_10, maps\_vehicle::godon );
    common_scripts\utility::array_thread( var_10, ::_id_D353 );

    foreach ( var_14 in var_10 )
    {
        var_14 thread _id_B044();
        var_14 thread _id_CE60();

        if ( !issubstr( var_14.classname, "armed" ) )
            continue;

        level._id_B880 = var_14;
    }

    level._id_C70C = var_10;
}

_id_AFB6()
{
    for (;;)
        wait 0.05;
}

_id_A8AC()
{
    self endon( "death" );
    wait 10;
    self.ignorerandombulletdamage = 0;
}

_id_CEE5()
{
    self endon( "death" );
    self waittill( "unload" );
    waittillframeend;
    wait 60;
    self.ignorerandombulletdamage = 0;
    self.attackeraccuracy = 1.0;
    self.health = 50;
    self.threatbias = 200;

    for (;;)
    {
        wait 3;
        self.attackeraccuracy += 0.2;
        self.threatbias += 40;
    }
}

_id_CE9B( var_0 )
{
    self endon( "death" );
    self endon( "new_color_being_set" );
    self.qsetgoalpos = 0;

    if ( !isdefined( self.magic_bullet_shield ) )
        self.health = 280;

    self.baseaccuracy = 2;
    self.attackeraccuracy = 0.0;
    self.ignorerandombulletdamage = 1;
    self waittill( "unload" );
    self.attackeraccuracy = 0.1;
}

_id_B044()
{
    maps\_utility::ent_flag_wait( "prep_unload" );
    common_scripts\utility::flag_set( "a_heli_landed" );
    waittillframeend;
    var_0 = spawnstruct();
    var_0._id_C7EE = undefined;

    foreach ( var_2 in self.riders )
    {
        if ( isai( var_2 ) )
        {
            if ( !isdefined( var_0._id_C7EE ) && var_2 != level._id_D13B )
                var_0._id_C7EE = var_2;

            var_2 thread _id_CE9B( var_0 );
            if ( var_2.animname != "soap" && var_2.animname != "ghost" ) 
            {
                var_2 character\gfl\randomizer_seal::main();
            }
        }
    }
}

_id_ABB4()
{
    level endon( "player_progresses_passed_ext_area" );
    maps\_utility::activate_trigger_with_targetname( "friendlies_leave_courtyard" );

    for ( var_0 = 1; var_0 <= 5; var_0++ )
    {
        if ( var_0 == 4 )
        {
            var_1 = getaiarray( "allies" );

            foreach ( var_3 in var_1 )
                var_3.ignoresuppression = 0;
        }

        var_5 = "ext_progress_" + var_0;
        var_6 = getent( var_5, "targetname" );

        if ( common_scripts\utility::flag_exist( var_5 ) )
            common_scripts\utility::flag_wait( var_5 );

        var_7 = var_6 maps\_utility::get_color_volume_from_trigger();
        var_7 maps\_utility::waittill_volume_dead_or_dying();

        if ( var_5 == "ext_progress_5" )
        {
            wait 0.7;
            level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_upahead" );
            wait 0.6;
        }

        var_6 maps\_utility::activate_trigger();
    }
}

_id_C151()
{
    if ( common_scripts\utility::flag( "leaving_bathroom_vol2" ) )
        return;

    level endon( "leaving_bathroom_vol2" );

    for ( var_0 = 1; var_0 <= 5; var_0++ )
    {
        var_1 = "bathroom_int" + var_0;
        var_2 = getent( var_1, "targetname" );
        common_scripts\utility::flag_wait( var_1 );
        var_3 = var_2 maps\_utility::get_color_volume_from_trigger();

        if ( isdefined( var_3 ) )
            var_3 maps\_utility::waittill_volume_dead_or_dying();

        var_2 maps\_utility::activate_trigger();
    }
}

_id_AD3C()
{
    level._id_ABFD[self.target] = [];
    var_0 = gettime();

    for (;;)
    {
        var_1 = gettime();
        self waittill( "reached_current_node", var_2, var_3 );
        var_4 = [];
        var_4["name"] = var_2.targetname;
        var_4["time"] = ( gettime() - var_1 ) * 0.001;
        var_4["total_time"] = ( gettime() - var_0 ) * 0.001;
        var_4["flag"] = var_3;
        level._id_ABFD[self.target][level._id_ABFD[self.target].size] = var_4;
    }
}

_id_CF04()
{
    foreach ( var_5, var_1 in level._id_ABFD )
    {
        foreach ( var_4, var_3 in var_1 )
        {
            if ( isdefined( var_3["flag"] ) )
                continue;
        }
    }
}

_id_A7FF()
{
    wait 2;
    level.player playerlinktoblend( level._id_ADDC, "tag_origin", 2, 0, 0 );
}

_id_CE60()
{
    thread _id_AE6D();
    maps\_utility::ent_flag_init( "start_attack_run" );
    maps\_utility::ent_flag_wait( "start_attack_run" );
    maps\_utility::ent_flag_set( "unlock_pitch" );
    maps\_vehicle::mgon();
    maps\_utility::ent_flag_clear( "unlock_pitch" );
}

_id_AA8A()
{
    waittillframeend;
    level._id_CB62 thread maps\_vehicle::vehicle_ai_event( "idle_alert_to_casual" );
}

_id_CFC4()
{
    self endon( "death" );
    maps\_utility::ent_flag_init( "force_fire" );
    maps\_utility::ent_flag_wait( "force_fire" );
    var_0 = self.currentnode;
    var_1 = var_0.script_forcefire_delay;
    var_2 = var_0.script_forcefire_duration;
    var_2 = 10;
    var_3 = self.mgturret;

    for (;;)
    {
        if ( isdefined( var_1 ) )
            wait(var_1);

        maps\_vehicle::mgon();
        wait(var_2);
        maps\_utility::ent_flag_clear( "force_fire" );
        maps\_vehicle::mgoff();
        maps\_utility::ent_flag_wait( "force_fire" );
    }
}

_id_AE6D()
{
    self endon( "death" );
    maps\_utility::ent_flag_init( "force_fire" );

    for (;;)
    {
        maps\_utility::ent_flag_wait( "force_fire" );
        _id_BFE9();
        self._id_D5B1 delete();
    }
}

_id_BFE9()
{
    self endon( "force_fire" );
    var_0 = self.turrets;

    if ( !isdefined( var_0 ) )
        var_0 = self.mgturret;

    var_1 = self.currentnode;

    if ( isdefined( var_1.script_forcefire_delay ) )
        wait(var_1.script_forcefire_delay);

    maps\_utility::delaythread( var_1.script_forcefire_duration, maps\_utility::ent_flag_clear, "force_fire" );
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_3 = anglestoforward( self.angles );
    var_4 = anglestoup( self.angles );
    var_2.origin = self.origin + var_3 * 400 + var_4 * -400;
    var_2 linkto( self );
    self._id_D5B1 = var_2;

    foreach ( var_6 in var_0 )
        var_6 settargetentity( var_2 );

    for (;;)
    {
        foreach ( var_6 in var_0 )
        {
            var_6 show();

            if ( !var_6 isfiringturret() )
                var_6 shootturret();
        }

        wait 0.1;
    }
}

_id_C981()
{
    self endon( "death" );
    var_0 = self.origin;

    for (;;)
    {
        var_0 = self.origin;
        wait 0.05;
    }
}

_id_D353()
{
    self endon( "death" );
    maps\_utility::ent_flag_init( "unlock_pitch" );
    maps\_utility::ent_flag_init( "lock_pitch" );
    maps\_utility::ent_flag_set( "lock_pitch" );
    var_0 = 10;
    var_1 = 60;
    self setmaxpitchroll( var_0, var_1 );

    for (;;)
    {
        if ( maps\_utility::ent_flag( "lock_pitch" ) )
            self setmaxpitchroll( 5, 60 );
        else if ( maps\_utility::ent_flag( "unlock_pitch" ) )
            self setmaxpitchroll( 100, 100 );
        else
            self setmaxpitchroll( var_0, var_1 );

        common_scripts\utility::waittill_either( "unlock_pitch", "lock_pitch" );
    }
}

_id_C917( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    foreach ( var_4 in var_2 )
        var_4.targetname = var_1;
}

_id_C98D()
{
    for (;;)
    {
        self sethoverparams( 50, 1, 0.5 );
        common_scripts\utility::flag_wait( "stabilize" );
        self sethoverparams( 0, 0, 0 );
        common_scripts\utility::flag_waitopen( "stabilize" );
    }
}

_id_A8A7()
{
    var_0 = common_scripts\utility::getfx( "missile_explosion" );
    self endon( "death" );

    for (;;)
    {
        var_1 = getentarray( "rocket", "classname" );

        foreach ( var_3 in var_1 )
        {
            if ( var_3.model != "projectile_stinger_missile" )
                continue;

            if ( distance( self.origin, var_3.origin ) < 100 )
            {
                common_scripts\utility::flag_set( "aa_hit" );
                playfx( var_0, var_3.origin );
                var_3 delete();
            }
        }

        wait 0.05;
    }
}

_id_B9C7()
{
    level endon( "player_heli_uses_modified_yaw" );

    if ( common_scripts\utility::flag( "player_heli_uses_modified_yaw" ) )
        return;

    var_0 = common_scripts\utility::getstruct( "yaw_progress_ent", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = common_scripts\utility::getstruct( "pitch_target", "targetname" );
    var_3 = spawn( "script_origin", var_2.origin );
    self setlookatent( var_3 );
    var_4 = common_scripts\utility::getstruct( "fly_in_progress", "targetname" );
    var_5 = common_scripts\utility::getstruct( var_4.target, "targetname" );
    var_6 = distance( var_4.origin, var_5.origin );

    for (;;)
    {
        var_7 = _id_C4A7::get_progression_between_points( self.origin, var_4.origin, var_5.origin );
        var_8 = var_7["progress"];
        var_9 = var_8 / var_6;

        if ( var_9 < 0 )
            var_9 = 0;

        if ( var_9 > 1 )
            var_9 = 1;

        level.progress = var_9;
        var_3.origin = var_0.origin * ( 1 - var_9 ) + var_1.origin * var_9;
        wait 0.05;
    }
}

_id_CFCA( var_0 )
{
    var_1 = 80;
    var_2 = 70;
    var_3 = -125;
    var_4 = 125;
    var_5 = var_1 - var_2;
    var_6 = var_4 - var_3;
    waittillframeend;
    var_7 = self.progress - level._id_CB62.progress;
    var_7 *= 5;
    self._id_B9EC = var_7;

    for (;;)
    {
        var_8 = self.progress - var_7;
        var_8 -= 50;
        var_9 = level._id_CB62.progress - var_8;

        if ( var_9 < var_3 )
            var_9 = var_3;
        else if ( var_9 > var_4 )
            var_9 = var_4;

        var_9 += var_3 * -1;
        var_10 = var_9 * var_5 / var_6;
        var_10 += var_2;
        var_10 += randomfloat( 4 ) - 2;
        self vehicle_setspeed( var_10, 15, 15 );
        wait 0.05;
    }
}

_id_CA42( var_0, var_1, var_2 )
{
    if ( self != level._id_CB62 )
        thread _id_CFCA( var_2 );

    self._id_B9EC = 0;

    for (;;)
    {
        var_3 = _id_C4A7::get_progression_between_points( self.origin, var_0.origin, var_1.origin );
        self.progress = var_3["progress"];
        wait 0.05;
    }
}

_id_C929()
{
    wait 1;
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    common_scripts\utility::flag_wait( "player_near_tv" );
    cinematicingameloopresident( "h2_gulag_securitycam", 1.0, 1 );
}

_id_B228()
{
    stopcinematicingame();
    level notify( "stop_tv_loop" );
}

_id_B7E3()
{
    var_0 = level._id_B880;
    var_1 = getent( "armed_target_1", "targetname" );

    foreach ( var_3 in var_0.mgturret )
        var_3 settargetentity( var_1 );
}

_id_BC60()
{
    var_0 = common_scripts\utility::getfx( "glassy_pain" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    var_1 = vectortoangles( common_scripts\utility::randomvector( 10 ) );
    var_2 = anglestoforward( var_1 );
    var_3 = anglestoup( var_1 );
    playfx( var_0, self.origin + ( 0.0, 0.0, 40.0 ), var_2, var_3 );
}

_id_CC72()
{
    level endon( "stop_moving_gulag_center" );
    var_0 = getent( "gulag_center", "targetname" );
    var_1 = var_0.origin;
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    self setlookatent( var_2 );
    thread _id_A995( var_0, var_2 );
    common_scripts\utility::flag_wait( "stab2_clear" );
    var_3 = getent( var_0.target, "targetname" );
    var_4 = getent( var_3.target, "targetname" );
    level.view_org moveto( var_3.origin, 4, 1, 1 );
    level.player.ignoreme = 1;
    level._id_D13B.ignoreme = 1;
    common_scripts\utility::flag_wait( "f15_gulag_explosion" );
    common_scripts\utility::flag_set( "clear_dof" );
    level.player.ignoreme = 0;
    level._id_D13B.ignoreme = 0;
    maps\_utility::delaythread( 2.5, common_scripts\_exploder::exploder, 93 );
    maps\_utility::delaythread( 2, ::_id_BA52 );
    var_5 = common_scripts\utility::getstruct( "player_heli_landing_path", "targetname" );
    level._id_CB62 maps\_utility::delaythread( 1.5, maps\_vehicle::vehicle_paths, var_5 );
    wait 1.5;
    wait 1;
    var_0 moveto( var_4.origin, 2, 1, 1 );
    level.view_org moveto( var_4.origin, 1.5, 0.5, 0.5 );
    soundscripts\_snd::snd_message( "start_heli_bullet_impact_mix" );
    level._id_CB62 maps\_utility::delaythread( 2.7, maps\_utility::play_sound_on_entity, "scn_gulag_heli_atlitude_alarm" );
    level.player maps\_utility::delaythread( 2.7, maps\_utility::play_sound_on_entity, "scn_gulag_heli_shakes" );
    common_scripts\utility::noself_delaycall( 0.5, ::earthquake, 0.25, 2.5, level.player.origin, 5000 );
    common_scripts\utility::noself_delaycall( 2.0, ::earthquake, 0.35, 2.5, level.player.origin, 5000 );
    common_scripts\utility::noself_delaycall( 2.35, ::earthquake, 0.2, 1, level.player.origin, 5000 );
    common_scripts\utility::noself_delaycall( 2.75, ::earthquake, 0.4, 4.5, level.player.origin, 5000 );
    level maps\_utility::delaythread( 1.8, maps\_utility::send_notify, "f15_smoke" );
    level maps\_utility::delaythread( 2.1, maps\_utility::send_notify, "afterburner" );
    wait 1;
    wait 1;
    maps\_utility::delaythread( 2, ::_id_BAE5 );
    thread _id_C665();
    var_6 = getent( "f15_hli_target_ent", "targetname" );
    var_0 moveto( var_6.origin, 3, 0.5, 0.5 );
    level.view_org moveto( var_6.origin, 3, 0.5, 0.5 );
    maps\_utility::delaythread( 3.5, common_scripts\utility::flag_clear, "clear_dof" );
    wait 5;
    var_0 moveto( var_1, 3, 0.5, 0.5 );
    level.view_org moveto( var_1, 3, 0.5, 0.5 );
    common_scripts\utility::flag_wait( "stop_rotating_around_gulag" );
    level notify( "stop_rotating_around_gulag_break" );
    var_7 = getent( "fly_in_lookat_ent", "targetname" );
    self setlookatent( var_7 );
    wait 2;
    var_7 moveto( ( 40280.0, 28549.0, 1900.0 ), 20 );
    self setlookatent( var_7 );
    common_scripts\utility::flag_wait( "player_lands" );
    common_scripts\utility::flag_set( "clear_dof" );
}

_id_B9A5( var_0, var_1 )
{
    wait 4.9;
    var_2 = getent( "f15_hli_target_ent", "targetname" );
    var_3 = var_0.origin;
    var_4 = level.view_org.origin;
    var_0 moveto( var_2.origin, 2, 1, 1 );
    level.view_org moveto( var_2.origin, 2, 1, 1 );
    wait 3;
    var_0 moveto( var_3, 2, 1, 1 );
    level.view_org moveto( var_4, 2, 1, 1 );
    wait 2;
    var_0.origin = var_3;
    level.view_org.origin = var_4;
}

_id_C665()
{
    var_0 = level.ground_ref;
    var_0 unlink();
    var_1 = 4;
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.angles = var_0.angles;
    var_2 addpitch( 15 * var_1 );
    var_2 addroll( 25 * var_1 );
    var_0 rotateto( var_2.angles, 1, 0.4, 0.4 );
    wait 1.5;
    var_2 addpitch( -35 * var_1 );
    var_2 addroll( -55 * var_1 );
    var_0 rotateto( var_2.angles, 1, 0.4, 0.4 );
    var_0.angles += ( 0.0001, 0.0, 0.0 );
    wait 1;
    var_0 rotateto( level._id_CB62.angles, 1, 0.4, 0.4 );
    wait 1;
    var_0 linkto( level._id_CB62, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
}

_id_A995( var_0, var_1 )
{
    level endon( "stop_rotating_around_gulag_break" );

    for (;;)
    {
        var_2 = vectortoangles( self.origin - var_0.origin );
        var_3 = anglestoright( var_2 );
        var_4 = distance( var_0.origin, self.origin );
        var_3 *= ( var_4 * level._id_C1CE * -1 );
        var_1.origin = var_0.origin + var_3;
        wait 0.05;
    }
}

_id_A853( var_0 )
{
    self endon( "death" );
    var_1 = -1;

    for (;;)
    {
        var_2 = getdvarint( "f15" );

        if ( var_2 != var_1 )
        {
            if ( var_2 == var_0 || var_2 == 2 )
                self show();
            else
                self hide();
        }

        var_1 = var_2;
        wait 0.05;
    }
}

_id_B4AE( var_0, var_1 )
{
    var_2 = getent( var_0 + "_f15", "targetname" );
    var_3 = var_2 maps\_utility::spawn_vehicle();
    waittillframeend;
    var_3.animname = "f15";
    var_3 maps\_utility::assign_animtree();
    var_3 maps\_utility::ent_flag_clear( "contrails" );
    var_3._id_C2CF = var_0;

    if ( var_1 )
        level._id_BE03 = var_3;

    level._id_B3B0[var_0] = var_3;
    var_4 = getent( "plane_org", "targetname" );
    var_4 thread maps\_anim::anim_single_solo( var_3, var_0 );
    var_5 = maps\_utility::spawn_anim_model( var_0 + "_missile" );
    var_6 = maps\_utility::spawn_anim_model( var_0 + "_missile" );
    var_7 = [];
    var_7[0] = var_5;
    var_7[1] = var_6;
    var_3.missiles = var_7;

    foreach ( var_9 in var_7 )
        var_9 hide();

    var_4 thread maps\_anim::anim_single_solo( var_5, "missile_fire_a" );
    var_4 thread maps\_anim::anim_single_solo( var_6, "missile_fire_b" );
    var_3 thread _id_CCD8();
    var_5 thread _id_CCD8();
    var_6 thread _id_CCD8();
    var_11 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_11.origin = var_3.origin;
    var_11.angles = var_3.angles;
    var_11.animname = "pilot";
    var_11 maps\_utility::assign_animtree();
    var_11 _id_C86A::main();
    var_11 linkto( var_3, "tag_body", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_3 thread maps\_anim::anim_loop_solo( var_11, "idle", "stop_idle", "tag_body" );
    var_3 waittill( "death" );
    var_11 delete();
}

_id_CCD8()
{
    self waittillmatch( "single anim", "end" );
    self delete();
}

_id_CA97( var_0 )
{
    var_1 = maps\_utility::spawn_anim_model( var_0 );
    var_2 = getent( "plane_org", "targetname" );
    var_2 thread maps\_anim::anim_single_solo( var_1, "intro" );
}

_id_CF5D()
{
    common_scripts\utility::flag_set( "f15s_spawn" );
    level._id_B3B0 = [];
    thread _id_B4AE( "intro_1", 1 );
    thread _id_B4AE( "intro_2", 0 );
    thread maps\gulag_aud::_id_ABC2();
    thread maps\_utility::flag_set_delayed( "rockslide_event", 20 );
    maps\_utility::delaythread( 20.6, common_scripts\_exploder::exploder, 20 );
    maps\_utility::delaythread( 21.2, common_scripts\_exploder::exploder, 21 );
    maps\_utility::delaythread( 24.0, common_scripts\_exploder::exploder, 22 );
}

_id_C15F()
{
    level._id_B8D7 = self;
    self.animname = "ghost";
    thread maps\_utility::magic_bullet_shield();
    maps\_utility::make_hero();
}

_id_D3C1()
{
    self endon( "death" );
    level endon( "player_lands" );
    self.baseaccuracy = 60;
    self.accuracy = 60;
    _id_CF3D();

    if ( maps\_utility::is_default_start() )
    {
        maps\_utility::forceuseweapon( "m14_scoped_arctic", "primary" );
        wait 0.05;
        level waittill( "switch_look" );
        level._id_BE03 waittill( "death" );
    }
    else if ( level.start_point == "approach" )
        maps\_utility::forceuseweapon( "m14_scoped_arctic", "primary" );

    _id_D27C( 0 );
}

_id_B3F8()
{
    self endon( "death" );
    level endon( "player_lands" );
    self.baseaccuracy = 60;
    self.accuracy = 60;
    _id_CF3D();

    if ( maps\_utility::is_default_start() )
    {
        maps\_utility::forceuseweapon( "m14_scoped_arctic", "primary" );
        wait 0.05;
        var_0 = common_scripts\utility::spawn_tag_origin();
        var_0 linkto( level._id_BE03, "tag_origin", ( 0.0, 0.0, 250.0 ), ( 0.0, 0.0, 0.0 ) );
        self setlookatentity( var_0 );
        level waittill( "switch_look" );
        var_0 delete();
        self setlookatentity( level._id_BE03 );
        level._id_BE03 waittill( "death" );
        self setlookatentity();
    }
    else if ( level.start_point == "approach" )
        maps\_utility::forceuseweapon( "m14_scoped_arctic", "primary" );

    var_1 = getent( "gulag_center", "targetname" );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_1.origin + ( 0.0, 0.0, 1000.0 );
    level._id_C3FF = var_2;
    self setlookatentity( var_2 );
    _id_D27C();
    wait 1.1;
    var_3 = getent( "soap_tower_lookat", "targetname" );
    self setlookatentity( var_3 );
    var_2 delete();
    common_scripts\utility::flag_wait( "final_tower_died" );
    wait 1.2;
    self setlookatentity( level._id_AC4D );
    wait 3;
    self setlookatentity();
}

_id_D27C( var_0 )
{
    level endon( "gulag_perimeter" );

    if ( common_scripts\utility::flag( "gulag_perimeter" ) )
        return;

    for (;;)
    {
        common_scripts\utility::flag_wait( "soap_snipes_tower" );
        _id_C1CC();
        common_scripts\utility::flag_waitopen( "soap_snipes_tower" );

        if ( !isdefined( var_0 ) || var_0 )
            self setlookatentity( level._id_C3FF );
    }
}

_id_C1CC()
{
    level endon( "soap_snipes_tower" );
    wait 4.4;

    for (;;)
    {
        if ( isalive( self.enemy ) )
        {
            self setanimknobrestart( level.scr_anim["soap"]["soap_intro_sniping"], 1, 0, 1 );
            self shoot();
            self playsound( "scn_gulag_mctavish_m14" );
            wait 0.05;
            wait(randomfloatrange( 2.5, 3 ));
        }

        wait 0.1;
    }
}

_id_B01A()
{
    self._id_C5A6 = 1;
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "vehicle_slamraam_launcher_no_spike" );
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1 setmodel( "vehicle_slamraam_missiles" );
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    self._id_BDFE = var_1;
    self._id_C25E = var_0;
    self.angles += ( 0.0, 90.0, 0.0 );
    self.guys = [];
    var_2 = maps\_utility::spawn_anim_model( "tarp" );
    thread maps\_anim::anim_loop_solo( var_2, "idle", "stop_idle" );
    self._id_AD62 = var_2;
}

_id_AEAB()
{
    self endon( "stop_tracking" );
    self endon( "death" );
    maps\_utility::delaythread( 12, maps\_utility::send_notify, "stop_tracking" );
    var_0 = 1;

    for (;;)
    {
        var_1 = vectortoangles( level.player.origin - self.origin );
        var_2 = var_1[1];
        var_3 = self.angles[1];
        var_4 = anglestoforward( ( 0, var_2, 0 ) );
        var_5 = anglestoforward( ( 0, var_3, 0 ) );
        var_6 = vectordot( var_4, var_5 );
        var_7 = 0;

        if ( var_6 < 1 )
            var_7 = acos( var_6 );

        var_8 = var_7 * 0.025;

        if ( var_8 > 0.05 || var_0 )
        {
            if ( var_0 )
            {
                var_8 = var_7 * 0.011;
                var_0 = 0;
                self rotateto( ( 0, var_2, 0 ), var_8, var_8 * 0.25, var_8 * 0.25 );
            }
            else
                self rotateto( ( 0, var_2, 0 ), var_8, 0, 0 );

            wait(var_8);
            continue;
        }

        self.angles = ( 0, var_2, 0 );
        wait 0.05;
    }
}

_id_CFBD( var_0, var_1 )
{
    var_2 = [];
    var_2[var_2.size] = "tag_missle1";
    var_2[var_2.size] = "tag_missle2";
    var_2[var_2.size] = "tag_missle3";
    var_2[var_2.size] = "tag_missle4";
    var_2[var_2.size] = "tag_missle5";
    var_2[var_2.size] = "tag_missle6";
    var_2[var_2.size] = "tag_missle7";
    var_2[var_2.size] = "tag_missle8";
    var_3 = [];
    var_4 = self._id_C25E;
    var_4 thread _id_AEAB();
    self._id_BDFE linkto( var_4 );
    self endon( "lose_operation" );

    for (;;)
    {
        if ( maps\_utility::within_fov_2d( var_4.origin, var_4.angles, level.player.origin, 0.96 ) )
            break;

        wait 0.05;
    }

    if ( isdefined( var_0 ) )
        wait(var_0);

    foreach ( var_8, var_6 in var_2 )
    {
        var_7 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_7.origin = var_4 gettagorigin( var_6 );
        var_7.angles = var_4 gettagangles( var_6 );
        var_7 setmodel( "projectile_slamraam_missile" );
        var_7 linkto( var_4 );
        var_3[var_8] = var_7;
    }

    self._id_BDFE delete();

    for ( var_8 = 0; var_8 < 4; var_8++ )
    {
        var_6 = var_2[var_8];
        var_4 _id_A9AB( var_6, var_3[var_8] );
    }

    if ( isdefined( var_1 ) )
        wait(var_1);

    for ( var_8 = 4; var_8 < var_2.size; var_8++ )
    {
        var_6 = var_2[var_8];
        var_4 _id_A9AB( var_6, var_3[var_8] );
    }
}

_id_A9AB( var_0, var_1 )
{
    var_2 = self gettagorigin( var_0 );
    var_3 = self gettagangles( var_0 );
    var_4 = anglestoforward( var_3 );
    magicbullet( level._id_B178, var_2, var_2 + var_4 * 5000 );
    wait 0.05;
    var_1 delete();
    wait 0.2;
}

_id_B033()
{
    self.animname = self.script_parameters;
    var_0 = self.origin;

    if ( isdefined( self.target ) )
    {
        var_1 = common_scripts\utility::get_target_ent();
        var_0 = var_1.origin;
    }

    var_2 = getentarray( "tarp_pull_org", "targetname" );
    var_3 = common_scripts\utility::getclosest( var_0, var_2, 1000 );
    var_3.guys[var_3.guys.size] = self;

    if ( var_3.guys.size == 1 )
        return;

    var_4 = var_3.guys;
    _id_CD1F( var_3, var_4 );
}

_id_CD1F( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
    {
        var_3.allowdeath = 1;
        var_3.goalradius = 16;
        var_3.ignoreall = 1;
        var_3.ignoreme = 1;
        var_3.allowdeath = 1;
        var_3.health = 5;
        var_3.nododgemove = 1;
    }

    var_0 maps\_anim::anim_reach( var_1, "pulldown" );

    if ( !var_0._id_C5A6 )
        return 0;

    var_1 = maps\_utility::remove_dead_from_array( var_1 );
    var_1[var_1.size] = var_0._id_AD62;

    if ( isdefined( var_0._id_CAD1 ) )
    {
        var_5 = 0;

        foreach ( var_3 in var_1 )
        {
            if ( isalive( var_3 ) )
                var_5++;
        }

        if ( !var_5 )
            return 0;
    }

    level notify( "tarp_activate" );
    var_0 maps\_utility::delaythread( 3.15, maps\_utility::send_notify, "tarp_activate" );
    var_0._id_AD62._id_CFF6 = 1;
    thread _id_CE2E( var_0, var_1 );
    return 1;
}

_id_CE2E( var_0, var_1 )
{
    thread _id_BDF6( var_1 );
    var_0 notify( "stop_idle" );
    var_0 maps\_anim::anim_single_run( var_1, "pulldown" );
    var_1 = maps\_utility::remove_dead_from_array( var_1 );

    if ( var_1.size )
        thread _id_B066( var_0, var_1 );
}

_id_BDF6( var_0 )
{
    wait 1.6;
    var_1 = 0;

    foreach ( var_3 in var_0 )
    {
        if ( isalive( var_3 ) )
            return;
    }

    var_0[var_0.size - 1] stopanimscripted();
}

_id_B066( var_0, var_1 )
{
    var_2 = undefined;
    var_1 = maps\_utility::remove_dead_from_array( var_1 );

    foreach ( var_4 in var_1 )
    {
        if ( isalive( var_4 ) )
            var_4 setgoalpos( var_4.origin );

        if ( var_4.animname == "operator" )
            var_2 = var_4;
    }

    if ( isdefined( var_2 ) )
        var_0 thread maps\_anim::anim_loop_solo( var_2, "idle" );

    wait 3;
    var_1 = maps\_utility::remove_dead_from_array( var_1 );

    foreach ( var_4 in var_1 )
    {
        var_4.ignoreme = 0;
        var_4.goalradius = 750;
    }
}

_id_CF14( var_0 )
{
    var_0 thread _id_A853( 0 );
    self endon( "death" );
    var_1 = 1.0;
    var_2 = 2.0;
    var_3 = 1;
    var_4 = var_2 - var_1;
    var_5 = var_3 * 20;
    var_6 = 0;
    var_7 = 0.35;

    for ( var_8 = 0; var_8 < var_5; var_8++ )
    {
        var_9 = var_1 + var_8 * var_4 / var_5;
        var_0 setanim( level._id_C212["x_right"], 1, 10, var_9 );
        wait 0.05;
    }

    wait 10;
}

_id_BE28()
{
    level._id_ABB6 = 0;
    level.dronecallbackthread = ::_id_B9CA;
    common_scripts\utility::flag_wait( "approach_dialogue" );
    var_0 = getentarray( "gulag_top_gate", "targetname" );
    common_scripts\utility::array_call( var_0, ::notsolid );
    common_scripts\utility::array_call( var_0, ::hide );
    var_1 = getentarray( "gulag_ring_drone", "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_B47C );
    var_2 = getentarray( "gulag_top_drone", "targetname" );
    common_scripts\utility::array_thread( var_2, ::_id_CCC6 );
}

_id_C570()
{
    var_0 = getent( self.target, "targetname" );
    self waittill( "trigger" );
    var_0 _id_A9DF();
    wait 0.3;
    var_0 _id_A9DF();
    wait 0.2;
    var_0 _id_A9DF();
    wait 0.4;
    var_0 _id_A9DF();
    wait 0.1;
    var_0 _id_A9DF();
    wait 0.2;
    var_0 _id_A9DF();
}

_id_A9DF()
{
    var_0 = 56;

    if ( getdvarint( "r_gulag_lessdrones" ) )
        var_0 = 10;

    if ( level._id_ABB6 >= var_0 )
        return;

    self.count = 1;
    maps\_utility::spawn_ai();
}

_id_B9CA()
{
    level._id_ABB6++;
    _id_D08E();
    level._id_ABB6--;
}

_id_D08E()
{
    self waittill( "goal" );
    self delete();
}

_id_B47C()
{
    _id_AF27( 1, 3 );
}

_id_CCC6()
{
    _id_AF27( 1, 3 );
}

_id_C276()
{
    self endon( "death" );
    level waittill( "stop_gulag_drones" );
    wait(randomfloatrange( 1, 6 ));
    self kill();
}

_id_AF27( var_0, var_1 )
{
    maps\_utility::add_spawn_function( ::_id_C276 );
    level endon( "stop_gulag_drones" );

    for (;;)
    {
        var_2 = randomintrange( var_0, var_1 );

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            _id_A9DF();
            wait(randomfloatrange( 0.4, 0.7 ));
        }

        wait(var_2 * 2);
    }
}

_id_D578( var_0 )
{
    var_1 = level.dofdefault;
    var_2["nearStart"] = 1;
    var_2["nearEnd"] = 1;
    var_2["nearBlur"] = 4;
    var_2["farStart"] = 5000;
    var_2["farEnd"] = 10000;
    var_2["farBlur"] = 2;

    for (;;)
    {
        maps\_utility::_id_B75A( var_1, var_2, var_0 );
        common_scripts\utility::flag_wait( "clear_dof" );
        maps\_utility::_id_B75A( var_2, var_1, 1 );
        common_scripts\utility::flag_waitopen( "clear_dof" );
    }
}

_id_D405()
{
    common_scripts\utility::flag_wait( "blow_up_first_tower_soon" );
    wait 1.5;
    common_scripts\utility::flag_set( "control_tower_event" );
    wait 0.15;
    common_scripts\_exploder::exploder( "tower_explosion" );
    wait 0.15;
    common_scripts\_exploder::exploder( "tower_explosion_fx" );
}

_id_BFF5()
{
    common_scripts\utility::flag_wait( "remove_rpgs" );
    var_0 = getent( "tower_height_ent", "targetname" );
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
    {
        var_3.bulletsinclip = 0;
        var_3.a.rockets = 0;

        if ( var_3.origin[2] > var_0.origin[2] )
        {
            _id_B190::_id_D55F( var_3 );
            var_3 kill();
        }
    }
}

_id_C387( var_0, var_1 )
{
    var_2 = getnode( var_0, var_1 );
    var_3 = [];

    for (;;)
    {
        var_3[var_3.size] = var_2;

        if ( !isdefined( var_2.target ) )
            break;

        var_2 = getnode( var_2.target, var_1 );
    }

    return var_3;
}

_id_BB19( var_0, var_1 )
{
    level notify( "new_ai_move_command" );
    level endon( "new_ai_move_command" );
    var_2 = _id_C387( var_1, "targetname" );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_3 >= var_2.size )
            break;

        var_4 = var_0[var_3];
        var_5 = var_2[var_3];

        if ( !isalive( var_4 ) )
            continue;

        var_4 setgoalnode( var_5 );
        var_4.goalradius = 64;
        wait(randomfloatrange( 0.1, 0.25 ));
    }
}

_id_D08F( var_0 )
{
    var_1 = _id_D02C();
    _id_BB19( var_1, var_0 );
}

_id_D45B()
{
    level notify( "new_ai_move_command" );
    var_0 = getent( "friendly_reinforcement_trigger", "targetname" );
    var_0 thread _id_B5FC();
    var_1 = _id_C387( "control_room_chain", "targetname" );
    level._id_BBD8 = var_1;
    var_2 = getaiarray( "allies" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = var_1[var_3];
        var_4._id_D3F2 = 0;

        if ( var_3 >= 1 && var_3 <= 4 )
            var_4._id_D129 = 1;
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_1[var_3];
        var_4._id_D3F2 = 1;
        var_2[var_3] thread _id_C83E( var_4 );
    }
}

_id_C83E( var_0 )
{
    var_0._id_D3F2 = 1;
    self setgoalnode( var_0 );
    self cleargoalvolume();
    self.goalradius = 64;
    self.fixednode = 1;
    self._id_D129 = var_0._id_D129;

    if ( isdefined( self._id_D129 ) )
    {
        self endon( "death" );
        self waittill( "goal" );
        self.ignoreme = 1;
        self.dontevershoot = 1;
    }
}

_id_AEFA()
{
    var_0 = _id_D02C();

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.magic_bullet_shield ) )
            return var_2;
    }
}

_id_C2EC( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3.magic_bullet_shield ) )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_BBBB( var_0 )
{
    level notify( "new_ai_move_command" );

    if ( !isdefined( var_0 ) )
        var_0 = level._id_CDCB;

    level._id_CDCB = var_0;
    var_1 = getnodearray( "cell_goalnode", "targetname" );
    var_2 = undefined;

    foreach ( var_2 in var_1 )
    {
        if ( var_2.script_goalvolume == var_0 )
            break;
    }

    var_5 = getent( var_2.target, "targetname" );
    var_6 = _id_D02C();

    foreach ( var_8 in var_6 )
    {
        var_8 setgoalnode( var_2 );
        var_8.fixednode = 0;
        var_8.goalradius = var_2.radius;
        var_8 setgoalvolume( var_5 );
    }
}

_id_B5FC()
{
    self waittill( "trigger" );
    var_0 = getaiarray( "allies" );
    var_1 = getentarray( self.target, "targetname" );
    var_2 = 0;

    for ( var_3 = var_0.size; var_3 < 7; var_3++ )
    {
        var_4 = var_1[var_2];
        var_4 maps\_utility::spawn_ai();
        var_2++;

        if ( var_2 >= var_1.size )
            return;
    }
}

_id_B60E( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    var_2 = undefined;
    var_3 = undefined;
    var_4 = [];

    foreach ( var_6 in var_1 )
    {
        if ( var_6.code_classname == "script_brushmodel" )
        {
            var_2 = var_6;
            continue;
        }

        if ( var_6.code_classname == "script_model" )
        {
            var_4[var_4.size] = var_6;
            continue;
        }

        if ( var_6.code_classname == "script_origin" )
            var_3 = var_6;
    }

    var_8 = [];

    foreach ( var_12, var_10 in var_4 )
    {
        var_11 = [];
        var_11["origin"] = var_10.origin;
        var_11["angles"] = var_10.angles;
        var_11["model"] = var_10.model;
        var_8[var_12] = var_11;
        var_10 delete();
    }

    common_scripts\utility::flag_wait( "gulag_cell_doors_enabled" );

    foreach ( var_11 in var_8 )
    {
        if ( var_11["model"] != "metal_prison_door" && var_11["model"] != "h2_gulag_prison_door_sliding" )
            continue;

        var_10 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_10.origin = var_11["origin"];
        var_10.angles = var_11["angles"];
        var_10 setmodel( var_11["model"] );
        var_10 linkto( var_2 );
    }

    var_2.org = var_3;
    var_15 = getentarray( "door_light", "targetname" );
    var_16 = common_scripts\utility::get_array_of_closest( var_2.origin, var_15, undefined, 2, 100 );
    var_2.lights = [];

    for ( var_17 = 0; var_17 < var_16.size; var_17++ )
    {
        var_18 = var_16[var_17];
        var_2.lights[var_2.lights.size] = var_18;
        var_18.targetname = undefined;
    }

    var_2 thread _id_BB2D();
}

_id_ACE8()
{
    var_0 = getentarray( "cell_door_weapons", "targetname" );
    var_1 = var_0[0].origin;
    wait 1.2;
    maps\_utility::delaythread( 1.8, common_scripts\utility::flag_set, "open_cell_door_weapons" );
    wait 2.9;
}

_id_CDDF( var_0 )
{
    common_scripts\utility::flag_set( "armory_attack_sounds" );
    thread common_scripts\utility::play_sound_in_space( "scn_gulag_jail_door_buzzer", level.player.origin + ( 0, var_0, 500 ) );
    wait 1.2;
    thread common_scripts\utility::play_sound_in_space( "scn_gulag_jail_door_unlock", level.player.origin + ( 0, var_0, 500 ) );
    thread common_scripts\utility::play_sound_in_space( "scn_gulag_armory_door_open", level.player.origin + ( 0, var_0, 500 ) );
    wait 2.0;
    thread common_scripts\utility::play_sound_in_space( "scn_gulag_jail_door_unlock", level.player.origin + ( 0, var_0, 500 ) );
    thread common_scripts\utility::play_sound_in_space( "scn_gulag_armory_door_open", level.player.origin + ( 0, var_0, 500 ) );
}

spawn_light_fx( var_0, var_1 )
{
    var_2 = spawnfx( var_0, var_1 );
    triggerfx( var_2 );
    return var_2;
}

_id_BB2D()
{
    common_scripts\utility::flag_init( "open_" + self.targetname );
    self.closed = 1;
    self.start_pos = self.origin;
    var_0 = anglestoforward( self.org.angles );
    var_1 = anglestoright( self.org.angles );
    var_2 = 3;
    var_3 = 0.5;
    var_4 = 0.2;

    if ( self.lights.size )
    {
        foreach ( var_6 in self.lights )
        {
            var_7 = anglestoup( var_6.angles );
            var_6._id_D4DC = var_6.origin + var_7 * 8;

            if ( var_6.model != "h1_cs_light_alarm_on" )
                var_6 setmodel( "h1_cs_light_alarm_on" );

            var_8 = _id_CB06( "light_red_steady_FX_origin_int" );
            var_6.looper = spawn_light_fx( var_8, var_6._id_D4DC );
        }
    }

    self disconnectpaths();
    var_10 = self.origin + var_1 * 128 + var_0 * -64 + ( 0.0, 0.0, 32.0 );

    for (;;)
    {
        common_scripts\utility::flag_wait( "open_" + self.targetname );
        thread common_scripts\utility::play_sound_in_space( "scn_gulag_jail_door_buzzer", var_10 );
        maps\_utility::delaythread( 1.2, common_scripts\utility::play_sound_in_space, "scn_gulag_jail_door_unlock", self.origin );

        if ( self.lights.size )
        {
            foreach ( var_6 in self.lights )
            {
                var_6 setmodel( "h1_cs_light_alarm_blue_on" );
                var_8 = _id_CB06( "light_blue_steady_FX_origin_int" );
                var_6.looper delete();
                var_6.looper = spawn_light_fx( var_8, var_6._id_D4DC );
            }
        }

        wait 2;

        if ( self.targetname == "cell_door_weapons" )
        {
            self playsound( "scn_gulag_armory_door_open" );
            self moveto( self.start_pos + var_0 * 16, var_2 * 0.25, var_3, 0 );
            wait(var_2 * 0.25);
            self playsound( "door_bounce" );
            common_scripts\_exploder::exploder( "door_dies" );
            maps\_utility::delaythread( 1, common_scripts\_exploder::exploder, "door_dies" );
            maps\_utility::delaythread( 1.3, common_scripts\_exploder::exploder, "door_dies" );
            maps\_utility::delaythread( 2, common_scripts\_exploder::exploder, "door_dies" );

            foreach ( var_6 in self.lights )
            {
                var_6 setmodel( "h1_cs_light_alarm_blue" );

                if ( isdefined( var_6.looper ) )
                    var_6.looper delete();
            }

            if ( isdefined( self.looper ) )
                self.looper delete();

            wait 1;

            foreach ( var_6 in self.lights )
                var_6 thread _id_B0B7();

            maps\_utility::delaythread( 1, common_scripts\_exploder::exploder, "door_dies" );
            maps\_utility::delaythread( 1.3, common_scripts\_exploder::exploder, "door_dies" );
            maps\_utility::delaythread( 2, common_scripts\_exploder::exploder, "door_dies" );
            level waittill( "force_door_open" );

            foreach ( var_6 in self.lights )
            {
                var_6 notify( "stop_flickering" );
                var_6 setmodel( "h1_cs_light_alarm_blue_on" );

                if ( isdefined( var_6.looper ) )
                    var_6.looper delete();

                var_8 = _id_CB06( "light_blue_steady_FX_origin_int" );
                var_6.looper = spawn_light_fx( var_8, var_6._id_D4DC );
            }

            self playsound( "scn_gulag_armory_door_open2" );
            self moveto( self.start_pos + var_0 * 48, var_2 * 0.75, var_3, 0 );
            wait(var_2 * 0.75);
        }
        else
        {
            self playsound( "scn_gulag_jail_door_open" );
            self moveto( self.start_pos + var_0 * 64, var_2, var_3, var_4 );
            wait(var_2);
        }

        self connectpaths();
        level notify( "opened_" + self.targetname );
        level notify( "cell_door_opens" );
        common_scripts\utility::flag_waitopen( "open_" + self.targetname );

        foreach ( var_6 in self.lights )
        {
            var_6 setmodel( "h1_cs_light_alarm_on" );
            var_8 = _id_CB06( "light_red_steady_FX_origin_int" );
            var_6.looper delete();
            var_6.looper = spawn_light_fx( var_8, var_6._id_D4DC );
        }

        wait 0.5;
        self moveto( self.start_pos, var_2, var_3, var_4 );
        wait(var_2);
        self disconnectpaths();
    }
}

_id_C1A5( var_0 )
{
    var_0 = 0.5;
    var_1 = var_0 * 20;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        self setmodel( "h1_cs_light_alarm_blue_on" );
        wait 0.055;
        self setmodel( "h1_cs_light_alarm_blue" );
        wait 0.095;

        if ( randomint( 100 ) > 75 )
            common_scripts\_exploder::exploder( "door_dies" );
    }
}

_id_B0B7()
{
    self endon( "stop_flickering" );
    var_0 = common_scripts\utility::getfx( "dlight_blue_flicker" );

    for (;;)
    {
        self.looper = spawn_light_fx( var_0, self._id_D4DC );
        _id_C1A5( 0.5 );
        self.looper delete();
        wait 1.3;
        self.looper = spawn_light_fx( var_0, self._id_D4DC );
        _id_C1A5( 0.35 );
        self.looper delete();
        wait 0.7;
        self.looper = spawn_light_fx( var_0, self._id_D4DC );
        _id_C1A5( 1.1 );
        self.looper delete();
        wait 1.4;
        self.looper = spawn_light_fx( var_0, self._id_D4DC );
        _id_C1A5( 0.5 );
        self.looper delete();
        wait 0.9;
    }
}

_id_D48A()
{
    level endon( "stop_cellblock_respawn" );
    level._id_D09D = getent( "friendly_cellblock_spawner", "targetname" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "cellblock_respawn" );

        for (;;)
        {
            wait 1;

            if ( !common_scripts\utility::flag( "cellblock_respawn" ) )
                break;

            if ( getaiarray( "allies" ).size >= 7 )
                continue;

            var_0 = level._id_D09D;
            var_0.count = 1;
            var_1 = var_0 maps\_utility::spawn_ai();
            var_1 _meth_8170( 1 );
        }
    }
}

_id_B7BE( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    var_2 = undefined;
    var_3 = undefined;
    var_4 = [];

    foreach ( var_6 in var_1 )
    {
        if ( var_6.code_classname == "script_brushmodel" )
        {
            var_2 = var_6;
            continue;
        }

        if ( var_6.code_classname == "script_model" )
        {
            var_4[var_4.size] = var_6;
            continue;
        }

        if ( var_6.code_classname == "script_origin" )
            var_3 = var_6;
    }

    foreach ( var_9 in var_4 )
        var_9 linkto( var_2 );

    var_2 linkto( var_3 );
    var_3 rotateyaw( -115, 5, 0, 3 );
}

_id_D02C()
{
    var_0 = getaiarray( "allies" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3._id_D129 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_C231()
{
    var_0 = _id_D02C();

    foreach ( var_2 in var_0 )
        var_2.grenadeawareness = 0;

    wait 3;
    var_0 = _id_D02C();

    foreach ( var_2 in var_0 )
        var_2.grenadeawareness = 0.9;
}

_id_BCEF()
{
    var_0 = getnode( "rappel_room_node", "targetname" );
    self cleargoalvolume();
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self.fixednode = 0;
}

_id_D22C()
{
    var_0 = getaiarray( "axis" );

    if ( var_0.size )
    {
        foreach ( var_2 in var_0 )
        {
            var_3 = randomfloat( 2 );
            var_2 common_scripts\utility::delaycall( var_3, ::kill );
        }

        wait 4;
    }
}

_id_BAC2()
{
    var_0 = getent( "h2_rappel_node", "targetname" );
    self.fixednode = 1;
    _id_AA56();
    var_0 maps\_anim::anim_reach_solo( self, "rappel_start" );
    self._id_BDB9 = 1;
    level._id_B8BC show();
    var_1 = [];
    var_1["rope"] = level._id_B8BC;
    var_1["soap"] = self;
    var_1["object"] = level._id_BB90;
    var_0 maps\_anim::anim_single( var_1, "rappel_start" );
    maps\_utility::set_force_color( "green" );
    maps\_utility::enable_ai_color();
    self._id_BDB9 = undefined;
}

_id_BEE9()
{
    var_0 = spawnstruct();
    var_0._id_A94E = level._id_CB33;
    var_0.rope = level._id_C8DA;
    var_0._id_AD84 = "player_rappels";
    var_0._id_A94E show();
    var_0._id_D48F = getent( "h2_rappel_node", "targetname" );
    var_0._id_C2CF = "rappel_start";
    _id_B2D6( var_0 );
    common_scripts\utility::flag_set( "cellblock_player_starts_rappel" );
    wait 1.8;
    maps\_utility::radio_dialogue( "gulag_tf1_captainlastfloor" );
}

_id_B2D6( var_0 )
{
    var_1 = getent( "rappel_trigger", "script_noteworthy" );
    var_1 thread common_scripts\utility::_id_AE1E( level.player, &"GULAG_RAPPEL_HINT", &"GULAG_RAPPEL_HINT_PC", "trigger" );
    common_scripts\utility::flag_wait( var_0._id_AD84 );
    var_1 delete();

    if ( level.player getstance() != "stand" )
    {
        level.player setstance( "stand" );

        if ( level.player isonground() )
            wait 0.4;
    }

    if ( isdefined( var_0._id_A94E ) )
        var_0._id_A94E delete();

    var_0.rope show();
    maps\_utility::_id_C636();
    var_2 = maps\_utility::spawn_anim_model( "player_rappel", var_0._id_D48F.origin );
    var_3 = [];
    var_3[0] = var_0.rope;
    var_3[1] = var_2;
    level._id_AF3D = gettime();
    var_0._id_D48F thread maps\_anim::anim_single( var_3, var_0._id_C2CF );
    var_0._id_D3F8 = getanimlength( var_2 maps\_utility::getanim( var_0._id_C2CF ) );
    level.player common_scripts\utility::delaycall( var_0._id_D3F8 - 0.35, ::unlink );
    level.player common_scripts\utility::delaycall( var_0._id_D3F8 - 0.35, ::enableweapons );
    level.player common_scripts\utility::delaycall( var_0._id_D3F8 - 0.35, ::allowcrouch, 1 );
    level.player common_scripts\utility::delaycall( var_0._id_D3F8 - 0.35, ::allowprone, 1 );
    level thread maps\_utility::notify_delay( "spotlights_off", var_0._id_D3F8 );
    setsaveddvar( "actionSlotsHide", 1 );
    setomnvar( "ui_expireHUD", 1 );
    common_scripts\utility::noself_delaycall( var_0._id_D3F8, ::setsaveddvar, "actionSlotsHide", 0 );
    common_scripts\utility::noself_delaycall( 3, ::_func_31B, 6 );
    common_scripts\utility::noself_delaycall( var_0._id_D3F8, ::_func_31C, 4 );
    var_2 common_scripts\utility::delaycall( var_0._id_D3F8, ::delete );
    thread _id_D54F( var_2 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player disableweapons();
    level.player playerlinktoblend( var_2, "tag_player", 0.5, 0.2, 0.2 );
}

_id_D54F( var_0 )
{
    var_1 = _id_D397::_id_A97A( "rappel" );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 5.6, -1, 5.0, 5.0, "rappel" ) _id_D397::_id_B059( 1, "rappel" ) _id_D397::_id_CCA7( var_0, "tag_dof", "rappel" ) _id_D397::_id_AE01( 1.0, "rappel" ) _id_D397::_id_AF9C();
    var_1 _id_D397::_id_BEA0( 7.5 ) _id_D397::_id_C491( 12.0, -1, 5.0, 5.0, "rappel" );
    var_1 _id_D397::_id_BEA0( 9.0 ) _id_D397::_id_BF3F();
    var_1 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_BAE4( 2 );
    var_1 _id_D397::_id_BEA0( 8.65 ) _id_D397::_id_BAE4( 0 );
    var_1 _id_D397::_id_BEA0( 1.4 ) _id_D397::_id_BC21( "damage_light" );
    var_1 _id_D397::_id_BEA0( 6.1 ) _id_D397::_id_BC21( "damage_light" );
    var_1 _id_D397::_id_BEA0( 7.3 ) _id_D397::_id_BC21( "damage_heavy" );
    var_1 _id_D397::_id_BC26();
}

_id_BAC3()
{
    var_0 = self getweaponslistprimaries();

    foreach ( var_2 in var_0 )
    {
        self switchtoweapon( var_2 );
        break;
    }
}

_id_CF9A()
{
    var_0 = getent( "h2_rappel_node", "targetname" );
    level._id_B8BC = maps\_utility::spawn_anim_model( "ai_rope" );
    var_1 = [];
    var_1[0] = level._id_B8BC;
    var_0 maps\_anim::anim_first_frame( var_1, "rappel_start" );
    level._id_C8DA = maps\_utility::spawn_anim_model( "player_rope" );
    level._id_CB33 = maps\_utility::spawn_anim_model( "player_rope_obj" );
    level._id_CB33 hide();
    var_0 maps\_anim::anim_first_frame_solo( level._id_C8DA, "rappel_start" );
    var_0 maps\_anim::anim_last_frame_solo( level._id_CB33, "rappel_start" );
    level._id_B8BC hide();
    level._id_C8DA hide();
    level._id_BB90 = maps\_utility::spawn_anim_model( "rappel_obj" );
    var_0 maps\_anim::anim_first_frame_solo( level._id_BB90, "rappel_start" );
}

_id_D5A3()
{
    if ( maps\_utility::is_specialop() )
        return;

    level._id_A87F.greenberet_disabled = undefined;
    level.player giveweapon( "m14_scoped_arctic" );
    level.player setoffhandprimaryclass( "fraggrenade" );
    level.player giveweapon( "fraggrenade" );
    level.player setoffhandsecondaryclass( "flash_grenade" );
    level.player giveweapon( "flash_grenade" );
    level.player setviewmodel( "h2_gfl_st_ar15_viewhands" );

    if ( maps\_utility::is_default_start() || level.start_point == "approach" )
    {
        level.player switchtoweapon( "m14_scoped_arctic" );
        thread _id_C0C3::weapons_specialfeatures();
        return;
    }

    if ( level.start_point == "perimeter" )
    {
        level.player giveweapon( "m4m203_reflex_arctic" );
        level.player switchtoweapon( "m4m203_reflex_arctic" );
        thread _id_C0C3::weapons_specialfeatures();
        return;
    }

    level.player setactionslot( 1, "nightvision" );
    level.player giveweapon( "claymore" );
    level.player setactionslot( 4, "weapon", "claymore" );
    level.player givemaxammo( "claymore" );
    level.player giveweapon( "m4m203_reflex_arctic" );
    level.player switchtoweapon( "m4m203_reflex_arctic" );
    thread _id_C0C3::weapons_specialfeatures();
}

_id_B5BD( var_0, var_1 )
{
    var_2 = common_scripts\utility::get_array_of_closest( var_1, var_0, undefined, 3, 750 );

    foreach ( var_4 in var_2 )
    {
        var_4 thread common_scripts\utility::activate_individual_exploder();
        wait 0.05;
    }
}

_id_ACEA()
{
    thread _id_C655();
    self.ignorerandombulletdamage = 1;
    self.suppressionwait = 0;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isalive( var_1 ) )
            continue;

        if ( var_1 == level.player )
            common_scripts\utility::flag_set( "force_bhd_start" );

        if ( !isalive( self ) )
            return;
    }
}

_id_C655()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "overlook_attack" );
    self.threatbias = 1500;
}

_id_A876()
{
    common_scripts\utility::flag_wait( "force_bhd_start" );
    thread _id_BBC1();
    wait 3;
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "bhd_spawner" );

    foreach ( var_2 in var_0 )
        var_2 setanim( level.scr_anim["littlebird"]["bhd_spawner_additive"] );
}

_id_B961()
{
    if ( common_scripts\utility::flag( "overlook_cleared" ) )
        return;

    self setyawspeed( 80, 60, 60, 0 );
    self setturningability( 1 );
    var_0 = common_scripts\utility::getstruct( "bhd_heli_rotate_node", "script_noteworthy" );
    var_1 = var_0.angles[1];
    common_scripts\_exploder::exploder( 3501 );
    thread _id_AB63();
    var_2 = maps\_utility::get_exploder_array( "110" );

    foreach ( var_0 in var_2 )
        var_0.origin = var_0.v["origin"];

    thread _id_C3F7( self );
    wait 3;
    maps\_utility::delaythread( 6, maps\_utility::kill_deathflag, "overlook_cleared", 2 );
    wait 8;
    common_scripts\_exploder::exploder( "3500" );
    wait 2.5;
    common_scripts\utility::flag_set( "stop_shooting_right_side" );
    self.mgturret[0] setmode( "auto_nonai" );
    self.mgturret[1] setmode( "manual" );
    self setgoalyaw( var_1 + 30 );
    var_5 = getaiarray( "axis" );
    var_6 = 1;
    var_7 = undefined;

    foreach ( var_9 in var_5 )
    {
        var_10 = maps\_utility::get_dot( self.origin, ( 0, var_1 + 30, 0 ), var_9.origin );

        if ( var_10 >= var_6 )
            continue;

        var_6 = var_10;
        var_7 = var_9;
    }

    if ( isdefined( var_7 ) )
    {
        foreach ( var_13 in self.mgturret )
            var_13 settargetentity( var_7 );
    }

    wait 4;
    thread _id_A807( var_1 + 40 );
    wait 9;
    self.threatbias = 0;
    common_scripts\utility::flag_set( "bhd_heli_flies_off" );

    foreach ( var_13 in self.mgturret )
        var_13 turretfiredisable();
}

_id_B040( var_0 )
{
    level endon( "stop_shooting_right_side" );

    if ( common_scripts\utility::flag( "stop_shooting_right_side" ) )
        return;

    _id_D321( var_0 );
}

_id_A807( var_0 )
{
    level endon( "bhd_heli_flies_off" );

    if ( common_scripts\utility::flag( "bhd_heli_flies_off" ) )
        return;

    _id_D321( var_0 );
}

_id_D321( var_0 )
{
    var_1 = 12;

    for (;;)
    {
        self setgoalyaw( var_0 - var_1 );
        wait 1.5;
        self setgoalyaw( var_0 + var_1 );
        wait 1.5;
    }
}

_id_C3F7( var_0 )
{
    var_1 = common_scripts\utility::getstructarray( "heli_grenade_struct", "targetname" );

    foreach ( var_3 in var_1 )
        var_3.time = 0;

    var_5 = 1;
    var_6 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_6.script_ghettotag = 1;
    var_7 = getent( "h2_gulag_littlebird_break_a", "script_noteworthy" );
    var_6 linkto( var_7, "tag_gun_aim", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    self.mgturret[0] thread _id_CE97( var_0, var_5, var_6 );
    common_scripts\utility::flag_wait( "stop_shooting_right_side" );
    var_6 delete();
}

_id_ADA4()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "physics_jump", var_0 );
        var_1 = ( 30.0, -30.0, 160.0 );
        physicsjolt( var_0, 256, 256, var_1 );
        wait 1.0;
    }
}

_id_C108()
{
    var_0 = common_scripts\utility::getstructarray( "heli_grenade_struct", "targetname" );
    var_1 = common_scripts\utility::getfx( "grenade_wood" );

    for (;;)
    {
        wait 0.05;

        if ( common_scripts\utility::flag( "stop_shooting_right_side" ) )
            break;

        if ( self isfiringturret() )
        {
            var_2 = maps\_utility::get_highest_dot( self.origin, self.origin + self.forward, var_0 );

            if ( var_2.time > gettime() )
                continue;

            var_2.time = gettime() + 250;
            var_3 = common_scripts\utility::randomvector( 8 );
            var_4 = abs( var_3[2] ) * -1;
            var_3 = ( var_3[0], var_3[1], var_4 );
            level notify( "physics_jump", var_2.origin );
            wait 0.25;
        }
    }
}

_id_CE97( var_0, var_1, var_2 )
{
    self setmode( "manual" );
    self settargetentity( var_2 );
    self startfiring();
    var_3 = maps\_utility::get_exploder_array( "110" );
    self._id_A9E0 = 1;
    self waittill( "turret_fire" );
    thread _id_C890();
    wait 0.5;
    self.forward = ( 0.0, 0.0, 0.0 );
    thread _id_C108();

    for (;;)
    {
        if ( common_scripts\utility::flag( "stop_shooting_right_side" ) )
            break;

        var_4 = var_0.angles;
        var_5 = anglestoforward( var_0.angles );
        self.forward = var_5;
        var_6 = maps\_utility::get_highest_dot( self.origin, self.origin + var_5, var_3 );
        var_7 = level.deathflags["overlook_cleared"]["ai"];

        foreach ( var_9 in var_7 )
        {
            if ( common_scripts\utility::within_fov( self.origin, var_0.angles, var_9.origin, 0.98 ) )
            {
                _id_B190::_id_D55F( var_9 );
                var_9 kill();
            }
        }

        _id_B5BD( var_3, var_6.origin );
        wait 0.2;
    }

    self stopfiring();
    self notify( "stop_setting_off_exploders" );
}

_id_C890()
{
    common_scripts\utility::flag_set( "balcony_event" );
    var_0 = getent( "balcony_sandbag", "targetname" );
    var_0 maps\_utility::assign_animtree( "sandbag" );
    var_0 thread maps\_anim::anim_single_solo( var_0, "destruction" );
    soundscripts\_snd::snd_message( "start_balcony_destruction" );
}

_id_BBC1()
{
    maps\_utility::kill_deathflag( "first_second_story_guys_dead", 4 );
    maps\_utility::radio_dialogue( "gulag_lbp1_gunrun" );
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_lasingtarget" );
    maps\_utility::radio_dialogue( "gulag_lbp1_gotatally" );
    common_scripts\utility::flag_wait( "ext_progress_4" );
    common_scripts\utility::flag_clear( "player_shot_at_m203_guys" );
    common_scripts\utility::flag_wait( "player_shot_at_m203_guys" );

    if ( _id_C7EA() )
        return;

    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_usem203" );
    maps\_utility::kill_deathflag( "upper_balcony_deathflag", 12 );
}

_id_B904()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getfx( "minigun_shell_eject" );
    self._id_AA93 = 0;

    for (;;)
    {
        if ( self isfiringturret() )
        {
            wait 2;

            for (;;)
            {
                if ( !self isfiringturret() )
                    break;

                playfxontag( var_0, self, "tag_brass" );
                thread _id_D39E();
                wait 0.05;
            }

            wait 0.75;
            continue;
        }

        wait 0.05;
    }
}

_id_D39E()
{
    if ( gettime() < self._id_AA93 + 2500 )
        return;

    self._id_AA93 = gettime();
    var_0 = self.origin;
    var_0 = maps\_utility::set_z( var_0, level._id_D13B.origin[2] );
    common_scripts\utility::play_sound_in_space( "scn_gulag_gattling_shells", var_0 );
}

_id_BF49()
{
    wait 2;
    common_scripts\utility::flag_wait( "overlook_cleared" );
    common_scripts\utility::flag_set( "overlook_cleared_with_safe_time" );
}

_id_BA8C()
{
    level.helis = common_scripts\utility::array_add( level.helis, self );
    common_scripts\utility::array_thread( self.mgturret, ::_id_B904 );
    self.mgturret[1] _meth_8140( self.mgturret[0] );
    common_scripts\utility::array_call( self.mgturret, ::_meth_857D, 30 );
    thread maps\gulag_aud::_id_C8B4();
    common_scripts\utility::flag_wait( "bhd_attack" );
    var_0 = level.deathflags["overlook_cleared"]["ai"];
    var_1 = undefined;

    foreach ( var_1 in var_0 )
        break;

    foreach ( var_5 in self.mgturret )
    {
        var_5 setmode( "manual" );

        if ( isalive( var_1 ) )
            var_5 settargetentity( var_1 );
    }

    wait 1.5;
    self makeentitysentient( "allies" );
    self.threatbias = 1500;
    self.attackeraccuracy = 5;
    common_scripts\utility::flag_wait( "overlook_heli_rotates" );
    thread _id_B961();
    common_scripts\utility::flag_wait( "overlook_attack" );
    thread _id_BF49();
    wait 3;
    maps\_spawner::killspawner( 0 );
    wait 15;
    var_7 = getent( "bhd_kill_trigger", "targetname" );
    var_0 = getaiarray( "axis" );

    foreach ( var_1 in var_0 )
    {
        if ( var_1 istouching( var_7 ) )
            var_1 kill();
    }
}

_id_AC57()
{
    maps\_utility::activate_trigger( "bhd_scene", "targetname" );
    var_0 = getent( "bhd_scene", "targetname" );
    var_0 delete();
    maps\_utility::activate_trigger( "bhd_spawner_trigger", "script_noteworthy" );
}

_id_CA93( var_0 )
{

}

_id_CFDC()
{
    return getent( "find_pow_org", "targetname" ).origin;
}

_id_CE69()
{
    return getent( "control_room_org", "targetname" ).origin;
}

_id_BE12()
{
    return getent( "cellblock_sweep_org", "targetname" ).origin;
}

_id_C270()
{
    return getent( "pipe_breach_org", "targetname" ).origin;
}

_id_C754()
{
    return getent( "breach_rescue_org", "targetname" ).origin;
}

_id_CE25()
{
    return common_scripts\utility::getstruct( "false_objective", "script_noteworthy" ).origin + ( 0.0, 0.0, 100.0 );
}

_id_ABBB()
{
    return getent( "evac_obj_org", "targetname" ).origin;
}

_id_CF29()
{
    self endon( "death" );
    self.disableexits = 1;
    self.attackeraccuracy = 0;
    self.ignorerandombulletdamage = 1;
    wait 1;
    self.disableexits = 0;
    maps\_utility::add_wait( maps\_utility::_wait, 8 );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "damage" );
    maps\_utility::do_wait_any();
    self.attackeraccuracy = 1;
    self.ignorerandombulletdamage = 0;
}

_id_AD2D()
{
    self endon( "death" );
    maps\_utility::gun_remove();
    self.a.disablepain = 1;
    self.health = 5000;
    self waittillmatch( "single anim", "start_ragdoll" );
    wait 0.1;
    waittillframeend;
    self.a.nodeath = 1;
    self kill();
}

_id_BEEC()
{
    self endon( "death" );
    character\gfl\randomizer_merc_lmg::main();
    maps\_riotshield::riotshield_sprint_on();
    wait(randomfloatrange( 1.8, 2.2 ));
    maps\_riotshield::riotshield_sprint_off();
}

_id_C984()
{
    if ( self.primaryweapon != "mp5" || self.weapon != self.primaryweapon )
        maps\_utility::forceuseweapon( "mp5", "primary" );

    if ( self != level._id_D13B )
    {
        var_0 = getent( "guy_riotshield", "targetname" );
        var_0.animname = "shield";
        var_0 maps\_anim::setanimtree();
        var_1 = getent( "node_armory_scriptedevent", "targetname" );
        var_1 maps\_anim::anim_reach_solo( self, "riotshield_pickup" );
        maps\_utility::enable_ai_color();
        var_1 thread maps\_anim::anim_single_solo( var_0, "guy_shield" );
        var_1 maps\_anim::anim_single_solo( self, "riotshield_pickup" );

        if ( isdefined( var_0 ) )
            var_0 delete();
    }

    self._id_AA7F = 1;
    self.threatbias += level._id_D498;
    animscripts\init::initweapon( "riotshield" );
    self.secondaryweapon = "riotshield";
    maps\_riotshield::subclass_riotshield();
    self.goalradius = 64;
    self.grenadeawareness = 0;
    animscripts\combat::setup();
}

_id_BDDE()
{
    common_scripts\utility::flag_init( "hole_rappel_failsafe" );
    var_0 = getentarray( "ai_hole_rappel_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_CEF7 );
    common_scripts\utility::flag_wait( "hole_rappel_failsafe" );
    wait 4;
    var_0 = getentarray( "ai_hole_rappel_trigger", "targetname" );

    if ( !var_0.size )
        return;

    var_1 = getaiarray( "allies" );
    var_2 = undefined;

    foreach ( var_2 in var_1 )
    {
        if ( isdefined( var_2._id_C1E8 ) )
            continue;

        break;
    }

    if ( !isalive( var_2 ) )
        return;

    var_0[0] notify( "trigger", var_2 );
}

_id_CEF7()
{
    var_0 = undefined;
    var_1 = self.script_index;

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( var_0.team != "allies" )
            continue;

        break;
    }

    common_scripts\utility::flag_set( "hole_rappel_failsafe" );
    var_0._id_C1E8 = 1;
    self delete();
    var_0 endon( "death" );
    var_2 = getent( "bathroom_rappel_" + var_1, "targetname" );
    var_2 maps\_anim::anim_generic_reach( var_0, "hole_rappel_start" + var_1 );
    var_0._id_BDB9 = 1;
    var_0 maps\_utility::delaythread( 6.3, maps\_utility::anim_stopanimscripted );
    var_0 maps\_utility::delaythread( 6.3, ::_id_BE6D );
    level._id_D42F[var_1] = gettime();
    var_3 = level._id_BBD5[var_1];
    var_2 thread maps\_anim::anim_single_solo( var_3, "hole_rappel_start" );
    var_2 maps\_anim::anim_generic( var_0, "hole_rappel_start" + var_1 );
    var_2 thread maps\_anim::anim_single_solo( var_3, "hole_rappel" );
    var_2 maps\_anim::anim_generic( var_0, "hole_rappel" + var_1 );
    var_0 maps\_utility::enable_ai_color();
    var_0._id_BDB9 = undefined;
}

_id_BE6D()
{
    self._id_BDB9 = undefined;
}

_id_C8B9()
{
    level._id_BBD5 = [];
    level._id_BBD5[1] = maps\_utility::spawn_anim_model( "ai_rope1" );
    level._id_BBD5[2] = maps\_utility::spawn_anim_model( "ai_rope2" );
    var_0 = getent( "bathroom_rappel_2", "targetname" );
    var_0 maps\_anim::anim_first_frame_solo( level._id_AC7C, "hole_rappel_start" );
    var_0 = getent( "bathroom_rappel_1", "targetname" );
    var_0 maps\_anim::anim_first_frame_solo( level._id_C462, "hole_rappel_start" );
}

_id_CCF5()
{
    var_0 = spawnstruct();
    var_0.rope = level._id_BECB;
    var_0._id_A94E = level._id_CDE2;
    var_0._id_AD84 = "player_hole_rappel";
    var_0._id_A94E show();
    var_0._id_D48F = getent( "bathroom_rappel_player", "targetname" );
    var_0._id_C2CF = "hole_rappel_start";
    var_0._id_D3F8 = 1.55;
    _id_B2D6( var_0 );
    common_scripts\utility::flag_set( "player_exited_bathroom" );
}

_id_C02F()
{
    level.price = self;
    self.animname = "price";
    self.attackeraccuracy = 0;
    self.ignorerandombulletdamage = 1;
    self.health = 200;
    common_scripts\utility::waittill_any_timeout( 5, "death" );

    if ( !isalive( self ) )
    {
        setdvar( "ui_deadquote", "@GULAG_PRICE_KILLED" );
        return;
    }

    self notify( "saved" );
    thread maps\_utility::magic_bullet_shield();
}

_id_B3EF()
{
    level endon( "lift_off" );

    for (;;)
    {
        earthquake( 0.2, 4, level.player.origin + common_scripts\utility::randomvector( 1000 ), 5000 );
        wait(randomfloatrange( 6, 8 ));
    }
}

_id_BE66()
{
    var_0 = level.start_point == "ending";
    var_1 = getent( "hookup_rope_ent", "targetname" );
    var_1.origin += ( 0.0, 0.0, 12.0 );
    var_1 hide();
    level._id_BE66 = var_1;
    var_2 = var_1.origin;
    var_1.origin += ( 0.0, 0.0, 600.0 );

    if ( !var_0 )
        common_scripts\utility::flag_wait( "rope_drops_now" );

    var_1 show();
    var_1 moveto( var_2, 1, 1, 0 );
    wait 1.1;
    var_1 makeusable();
    var_1 maps\_utility::glow();
    var_3 = maps\_utility::getentwithflag( "player_ropes" );
    var_3 thread common_scripts\utility::_id_AE1E( level.player, &"GULAG_RAPPEL_HINT", &"GULAG_RAPPEL_HINT_PC", "trigger" );
    var_4 = maps\_vehicle::spawn_vehicle_from_targetname( "escape_lift" );
    var_5 = common_scripts\utility::spawn_tag_origin();
    var_5 linkto( var_4, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 180.0, 0.0 ) );
    var_6 = getent( "evac_obj_org", "targetname" );
    var_7 = maps\_utility::get_player_view_controller( var_4, "tag_origin", ( 0.0, 0.0, -16.0 ) );
    var_7 settargetentity( var_6 );
    var_8 = 1.0;
    var_9 = 10;
    var_10 = 10;
    var_11 = 10;
    var_12 = 10;
    common_scripts\utility::flag_wait( "player_ropes" );
    level.player disableweapons();
    var_4 startpath();
    level.player playerlinktoblend( var_5, "tag_origin", 2, 1.5, 0 );
}

_id_CF3D()
{
    level._id_D13B = self;
    self.animname = "soap";

    if ( !isdefined( self.magic_bullet_shield ) )
        thread maps\_utility::magic_bullet_shield();

    maps\_utility::make_hero();
}

_id_CD94()
{
    var_0 = getent( "fly_in_attack_org", "targetname" );
    var_1 = getent( "fly_in_attack_org_end", "targetname" );
    common_scripts\utility::flag_wait( "going_in_hot" );
    wait 3.5;

    foreach ( var_3 in self.mgturret )
        var_3 startfiring();

    wait 4.8;

    foreach ( var_3 in self.mgturret )
    {
        var_3 settargetentity( var_0 );
        var_3 setmode( "manual" );
    }

    var_0 moveto( var_1 getorigin(), 3 );
    wait 3;
    maps\_vehicle::mgoff();

    foreach ( var_3 in self.mgturret )
        var_3 stopfiring();
}

_id_B537()
{
    if ( isdefined( level.intel_items ) )
    {
        var_0 = getentarray( "intelligence_item", "targetname" );

        foreach ( var_2 in var_0 )
        {
            var_2.script_ghettotag = 1;
            var_2.item.script_ghettotag = 1;
        }
    }

    var_4 = getent( "interior_entity_volume", "targetname" );
    var_5 = getentarray();
    var_6 = [];
    var_6["script_model"] = 1;
    var_6["script_brushmodel"] = 1;
    var_6["choose_light"] = 1;
    var_6["script_vehicle_collmap"] = 1;
    var_6["info_volume_breachroom"] = 1;
    var_6["actor_ally_hero_soap_udt"] = 1;
    var_6["stage"] = 1;
    var_6["portal_group"] = 1;
    var_6["trigger_multiple_compass"] = 1;

    foreach ( var_8 in var_5 )
    {
        if ( isalive( var_8 ) )
            continue;

        if ( isdefined( var_8.script_ghettotag ) )
            continue;

        if ( var_8.origin[2] < 1850 )
            continue;

        if ( !isdefined( var_8.classname ) )
        {
            if ( !var_8 istouching( var_4 ) )
                var_8 delete();

            continue;
        }

        if ( isdefined( var_6[var_8.classname] ) )
            continue;

        if ( isdefined( var_6[var_8.code_classname] ) )
            continue;

        if ( var_8 _id_C0A1() )
        {
            var_9 = spawn( "script_origin", var_8.origin );

            if ( !var_9 istouching( var_4 ) )
                var_8 delete();

            var_9 delete();
            continue;
        }

        if ( !var_8 istouching( var_4 ) )
            var_8 delete();
    }

    var_11 = [];

    foreach ( var_13 in anim.bcs_locations )
    {
        if ( !isdefined( var_13 ) )
            continue;

        var_11[var_11.size] = var_13;
    }

    anim.bcs_locations = var_11;
}

_id_C0A1()
{
    if ( issubstr( self.code_classname, "trigger" ) )
        return 1;

    return self.code_classname == "info_volume";
}

_id_B2B5()
{
    var_0 = 1;

    for (;;)
    {
        common_scripts\utility::flag_wait( "disable_exterior_fx" );

        if ( var_0 )
        {
            var_0 = 0;
            _id_B537();
        }

        enableforcednosunshadows();
        common_scripts\utility::flag_waitopen( "disable_exterior_fx" );
        disableforcedsunshadows();
    }
}

_id_D361()
{
    level endon( "player_enters_bathroom" );
    level endon( "breaching" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_tries_door_that_cant_open" );
        level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_hurryup" );
        wait 6;
        common_scripts\utility::flag_wait( "player_tries_door_that_cant_open" );
        level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_forgetthatdoor" );
        wait 6;
    }
}

_id_D2A3()
{
    level endon( "breaching" );

    if ( common_scripts\utility::flag( "player_enters_bathroom" ) )
        return;

    level endon( "player_enters_bathroom" );
    common_scripts\utility::flag_wait( "tunnel_guys_die" );
    thread _id_D361();

    for (;;)
    {
        if ( !common_scripts\utility::flag( "bathroom_breach_objective_dialog" ) )
            level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_plantbreach" );

        wait 20;
    }
}

_id_D476()
{
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_0, ::_id_BA2B );
}

_id_BA2B()
{
    self endon( "death" );
    self.grenadeweapon = "armory_grenade";

    for (;;)
    {
        anim.grenadetimers["AI_armory_grenade"] = 0;
        level.player.grenadetimers["armory_grenade"] = 0;
        self.grenadeammo = 5;
        maps\_utility::throwgrenadeatplayerasap();
        wait 0.05;
    }
}

_id_C031()
{
    if ( randomint( 100 ) > 60 )
        return;

    wait(randomfloat( 3 ));
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = randomfloatrange( 11.5, 13.5 );
    magicgrenade( "fraggrenade", self.origin, var_0.origin, var_1 );
}

_id_C777()
{
    if ( common_scripts\utility::flag( "player_nears_cell_door1" ) )
        return;

    level endon( "player_nears_cell_door1" );

    for (;;)
    {
        var_0 = getaiarray( "axis" );
        var_1 = 0;

        foreach ( var_3 in var_0 )
        {
            if ( distance( var_3.origin, level.player.origin ) > 600 )
                continue;

            var_1 = 1;
            break;
        }

        if ( !var_1 )
            return;

        wait 1;
    }
}

_id_B871()
{
    self setengagementmindist( 0, 0 );
    self setengagementmaxdist( 400, 800 );
}

_id_CB87()
{
    common_scripts\utility::flag_wait( "heli_strike" );
    maps\_utility::activate_trigger_with_targetname( "heli_strike_badguy_trigger" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_strike_heli" );

    foreach ( var_2 in var_0.mgturret )
        var_2 startfiring();

    wait 2.6;
    common_scripts\_exploder::exploder( 110 );
}

_id_C260()
{
    self endon( "death" );
    wait(randomfloat( 3 ));
    self.diequietly = 1;
    self kill();
}

_id_BA43()
{
    self.usechokepoints = 1;
}

_id_CD44()
{
    self endon( "death" );
    level._id_C69C += 0.35;

    if ( level._id_C69C > 1.5 )
        level._id_C69C = 1.5;

    wait(level._id_C69C);
    thread _id_B0FC();
    wait(randomfloatrange( 2, 2.5 ));
}

_id_B0FC()
{
    if ( self.health <= 1 )
        return;

    self.combatmode = "no_cover";
    self.has_no_ir = undefined;
    self.custom_laser_function = ::_id_C72B;
    _id_C72B();
}

_id_C937()
{
    if ( self.health <= 1 )
        return;

    self.combatmode = "cover";
    self.has_no_ir = 1;
    self.custom_laser_function = undefined;
    self laseroff();
}

_id_C72B()
{
    if ( self.a.weaponpos["right"] == "none" )
        return;

    if ( animscripts\shared::canuselaser() )
        maps\_utility::_id_D295();
    else
        self laseroff();
}

_id_B5CB( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !isalive( var_2 ) )
            continue;

        var_2 _id_C937();
        wait(randomfloatrange( 0.5, 0.8 ));
    }
}

_id_B9C8()
{
    var_0 = getentarray( "cellblock_smoke_grenade_org", "targetname" );

    foreach ( var_2 in var_0 )
        magicgrenademanual( "smoke_grenade_american", var_2.origin, var_2.origin + ( 0.0, 0.0, 20.0 ), 0 );
}

_id_A941()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "open_cell_door_weapons" );
    var_0 = getnode( "armory_flee_node", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
}

_id_AA2E()
{
    if ( !issentient( self ) )
        return;

    if ( self.subclass == "riotshield" )
        return;

    self.combatmode = "ambush";
}

_id_BCB3()
{
    level._id_C01D++;

    if ( level._id_C353 < level._id_C01D )
        level._id_C353 = level._id_C01D;

    thread _id_CF4C();
    self waittill( "death" );
    level._id_C01D--;
    level notify( "ending_flee_death" );
}

_id_CF4C()
{
    self endon( "death" );
    level waittill( "ending_flee_death" );
    waittillframeend;
    var_0 = 1 - level._id_C01D / level._id_C353;
    var_0 += 0.2;

    if ( randomfloat( 1 ) > var_0 )
        return;

    var_1 = getnode( "ending_flee_node", "targetname" );
    self setgoalnode( var_1 );
    self.goalradius = var_1.radius;
}

_id_D2C0()
{
    if ( common_scripts\utility::flag( "nvg_leave_cellarea" ) )
        return;

    level endon( "nvg_leave_cellarea" );

    if ( common_scripts\utility::flag( "checking_to_sweep_cells" ) )
        return;

    level endon( "checking_to_sweep_cells" );
    wait 5;

    for (;;)
    {
        var_0 = randomfloatrange( 3, 7 );
        wait(var_0);
        badplace_cylinder( "", 2, self.origin, 16, 64, "axis" );
    }
}

_id_CC7B()
{
    self.team = "team3";
    self setthreatbiasgroup( "team3" );
}

_id_CC21()
{
    if ( common_scripts\utility::flag( "player_exited_bathroom" ) )
        return;

    level endon( "player_exited_bathroom" );

    if ( common_scripts\utility::flag( "bathroom_room2_enemies_dead" ) )
        return;

    level endon( "bathroom_room2_enemies_dead" );
    var_0 = getent( "bathroom_nosave_volume", "targetname" );

    for (;;)
    {
        wait 45;

        if ( !level.player istouching( var_0 ) )
            maps\_utility::autosave_by_name( "bathroom_autosave" );
    }
}

_id_A820()
{
    self endon( "death" );
    waittillframeend;
    self waittill( "goal" );
    var_0 = getentarray( self.script_linkto, "script_linkname" );
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        if ( !isalive( var_3 ) )
            continue;

        var_1 = var_3;
        break;
    }

    if ( !isalive( var_1 ) )
        return;

    self.goalradius = 128;

    for (;;)
    {
        if ( !isalive( var_1 ) )
            break;

        self setgoalpos( var_1.origin );
        wait 1;
    }

    self setgoalvolumeauto( self getgoalvolume() );
}

_id_CE1F()
{
    if ( common_scripts\utility::flag( "bathroom_second_wave_trigger" ) )
        return;

    common_scripts\utility::flag_set( "bathroom_second_wave_trigger" );
    var_0 = 8;
    maps\_utility::delaythread( var_0, maps\_utility::activate_trigger_with_targetname, "bathroom_balcony_room2_trigger" );
    maps\_utility::activate_trigger_with_targetname( "bathroom_second_wave_trigger" );
}

_id_AF56( var_0 )
{
    for (;;)
        wait 0.05;
}

_id_A936()
{
    level endon( "stop_moving_gulag_center" );
    var_0 = [];
    var_1 = [];
    var_1["time"] = 2;
    var_1["in"] = 0.2;
    var_1["out"] = 0.2;
    var_1["delay"] = 7;
    var_0[var_0.size] = var_1;
    var_1 = [];
    var_1["pre_delay"] = 4;
    var_1["time"] = 11;
    var_1["in"] = 0.2;
    var_1["out"] = 0.2;
    var_0[var_0.size] = var_1;
    var_1 = [];
    var_1["flag"] = "heli_rotates_to_face_center";
    var_1["time"] = 4.8;
    var_1["in"] = 2;
    var_1["out"] = 2;
    var_0[var_0.size] = var_1;
    var_1 = [];
    var_1["flag"] = "heli_roller_coaster";
    var_1["time"] = 1.8;
    var_1["in"] = var_1["time"] - 0.5;
    var_1["out"] = 0.5;
    var_1["delay"] = var_1["time"];
    var_0[var_0.size] = var_1;
    var_1 = [];
    var_1["time"] = 2.6;
    var_1["in"] = var_1["time"] * 0.5;
    var_1["out"] = var_1["time"] * 0.5;
    var_1["delay"] = var_1["time"];
    var_0[var_0.size] = var_1;
    var_1 = [];
    var_1["time"] = 1.5;
    var_1["in"] = var_1["time"] * 0.5;
    var_1["out"] = var_1["time"] * 0.5;
    var_1["delay"] = var_1["time"];
    var_0[var_0.size] = var_1;
    var_1 = [];
    var_1["pre_delay"] = 3;
    var_1["flag"] = "slamraam_killed_0";
    var_1["time"] = 3;
    var_1["in"] = var_1["time"] * 0.25;
    var_1["out"] = var_1["time"] * 0.25;
    var_0[var_0.size] = var_1;
    var_1 = [];
    var_1["flag"] = "slamraam_killed_1";
    var_1["time"] = 3;
    var_1["in"] = var_1["time"] * 0.25;
    var_1["out"] = var_1["time"] * 0.25;
    var_0[var_0.size] = var_1;
    var_1 = [];
    var_1["flag"] = "slamraam_killed_2";
    var_1["time"] = 3;
    var_1["in"] = var_1["time"] * 0.25;
    var_1["out"] = var_1["time"] * 0.25;
    var_0[var_0.size] = var_1;
    common_scripts\utility::flag_wait( "slamraam_gets_players_attention" );
    var_2 = getent( "gulag_center", "targetname" );
    var_3 = var_2;

    if ( !isdefined( level._id_CC0B ) )
        return;

    level._id_CC0B cleartargetentity();
    level._id_CC0B settargetentity( var_2 );
    level._id_B4E9 = [];
    var_4 = 0;

    if ( level.start_point == "perimeter" )
    {
        var_0[1]["time"] = 1;
        var_5 = getent( var_2.target, "targetname" );
        var_3 = var_5;
        var_2.origin = var_3.origin;
        var_4 = 1;
    }

    for (;;)
    {
        level._id_B4E9[var_4] = gettime();
        var_5 = getent( var_3.target, "targetname" );
        var_1 = var_0[var_4];

        if ( isdefined( var_1["flag"] ) )
            common_scripts\utility::flag_wait( var_1["flag"] );

        if ( isdefined( var_1["pre_delay"] ) )
            wait(var_1["pre_delay"]);

        var_2 moveto( var_5.origin, var_1["time"], var_1["in"], var_1["out"] );

        if ( isdefined( var_1["delay"] ) )
            wait(var_1["delay"]);

        var_3 = var_5;
        var_4++;

        if ( var_4 >= var_0.size )
            break;

        if ( !isdefined( var_3.target ) )
            break;
    }
}

_id_D4BD( var_0 )
{
    self notify( "new_debug_print" );
    self endon( "new_debug_print" );

    for (;;)
        wait 0.05;
}

_id_B1EB()
{
    if ( common_scripts\utility::flag( "second_tower_clear" ) )
        return;

    level endon( "second_tower_clear" );
    wait 2.5;
    maps\_utility::radio_dialogue( "gulag_rpt_stabilize2" );
    maps\_utility::radio_dialogue( "gulag_lbp1_ready" );
    maps\_utility::radio_dialogue( "gulag_wrm_ontarget" );
}

_id_B9B3()
{
    level._id_C913 = [];
    var_0 = getentarray( "perimeter_tarp_spawner", "targetname" );
    maps\_utility::array_spawn_function( var_0, ::_id_D27E );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_D27E()
{
    level._id_C913[level._id_C913.size] = self;
}

_id_C7EA( var_0 )
{
    var_1 = getent( "small_balcony_volume", "targetname" );
    var_2 = var_1 maps\_utility::get_ai_touching_volume( "axis" );

    if ( var_2.size <= 0 )
        return 1;

    var_3 = maps\_utility::get_player_from_self();
    var_4 = var_3 getcurrentweapon();
    var_5 = getsubstr( var_4, 0, 4 );

    if ( var_5 == "m203" )
        return 1;

    var_6 = var_3 getweaponslistall();

    foreach ( var_4 in var_6 )
    {
        var_8 = var_3 getweaponammoclip( var_4 );

        if ( !issubstr( var_4, "m203" ) )
            continue;

        if ( var_8 > 0 )
            return 0;
    }

    return 1;
}

_id_B7A3()
{
    common_scripts\utility::flag_wait( "new_friendly_helis_spawn" );
    level._id_B178 = "slamraam_missile";
    thread _id_D570();
    maps\_utility::delaythread( 7, ::_id_B9B3 );
    wait 3.7;
    var_0 = getentarray( "intro_heli_1", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "heli_restart_path", "script_noteworthy" );

    foreach ( var_3 in var_0 )
    {
        var_4 = var_3.origin;

        foreach ( var_6 in var_1 )
        {
            if ( var_6.script_parameters != var_3.script_parameters )
                continue;

            _id_C917( var_3.target, var_6.targetname );
            var_3.target = var_6.targetname;
            var_3.origin = var_6.origin;
            break;
        }
    }

    var_0 = getentarray( "intro_heli_1", "targetname" );
}

_id_D570()
{
    var_0 = getentarray( "perimeter_slamraam", "script_noteworthy" );
    var_1 = maps\_utility::array_index_by_parameters( var_0 );
    var_2 = 20;
    var_1["0"] thread _id_AA89( var_2 );
    var_1["1"] thread _id_AA89( var_2 + 5 );
    var_1["2"] thread _id_AA89( var_2 + 7 );
}

_id_AA89( var_0 )
{
    self._id_CAD1 = 1;
    self._id_BDFE thread _id_CE67( self );
    self._id_C5A6 = 1;
    wait(var_0);
    var_1 = maps\_utility::array_removedead( level._id_C913 );

    foreach ( var_4, var_3 in var_1 )
    {
        if ( isdefined( var_3._id_C012 ) )
            var_1[var_4] = undefined;
    }

    for (;;)
    {
        var_1 = maps\_utility::array_removedead( var_1 );

        if ( !var_1.size )
            return;

        var_5 = common_scripts\utility::get_array_of_closest( self.origin, var_1, undefined, 2, 1000, 0 );

        if ( var_5.size != 2 )
            return;

        foreach ( var_3 in var_5 )
            var_3._id_C012 = 1;

        var_5[0].animname = "puller";
        var_5[1].animname = "operator";

        if ( _id_CD1F( self, var_5 ) )
        {
            if ( !self._id_C5A6 )
                return;

            thread _id_CFBD( 1.2, 0.5 );
            break;
        }

        wait 1;
    }
}

_id_CE67( var_0 )
{
    self setcandamage( 1 );
    self.health = 250;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7 );

        if ( isalive( var_2 ) && isplayer( var_2 ) )
        {
            if ( self.health <= 0 )
            {
                common_scripts\utility::flag_set( "slamraam_killed_" + var_0.script_parameters );
                var_0._id_C5A6 = 0;
                playfx( common_scripts\utility::getfx( "slamraam_explosion" ), var_0.origin );
                var_0 notify( "lose_operation" );
                var_0._id_C25E delete();
                var_0 thread _id_B76F();
                self delete();
            }
        }

        if ( !isdefined( self ) || self.health <= 0 )
            return;
    }
}

_id_B76F()
{
    var_0 = 0.5;
    var_1 = self._id_AD62 maps\_utility::getanim( "pulldown" );

    if ( isdefined( self._id_AD62._id_CFF6 ) )
    {
        if ( self._id_AD62 getanimtime( var_1 ) >= var_0 )
            return;
    }
    else
    {
        self._id_AD62._id_CFF6 = 1;
        thread maps\_anim::anim_single_solo( self._id_AD62, "pulldown" );
        wait 0.05;
    }

    self._id_AD62 setanimtime( var_1, var_0 );
}

_id_CB24()
{
    var_0 = getentarray( "later_boats", "targetname" );
    common_scripts\utility::array_call( var_0, ::hide );
    common_scripts\utility::flag_wait( "new_friendly_helis_spawn" );
    var_1 = getentarray( "early_boats", "targetname" );
    common_scripts\utility::array_call( var_1, ::delete );
    common_scripts\utility::array_call( var_0, ::show );
    common_scripts\utility::flag_wait( "pre_boats_attack" );
    var_2 = common_scripts\utility::getstructarray( "boat_artillery", "targetname" );
    common_scripts\utility::array_thread( var_2, ::_id_CC5A );
    maps\_utility::delaythread( 10.5, common_scripts\utility::flag_set, "red_goes_in_for_early_landing" );
    wait 1.8;
    common_scripts\_exploder::exploder( "boat_attack1" );
    wait 1;
    common_scripts\utility::flag_set( "player_heli_backs_up" );
    common_scripts\_exploder::exploder( "boat_attack_tracers" );
    common_scripts\_exploder::exploder( "boat_attack" );
    wait 1;
    wait 1.15;
    common_scripts\_exploder::exploder( "93" );
    common_scripts\utility::flag_wait( "player_lands" );
    common_scripts\utility::array_call( var_0, ::delete );
}

_id_CC5A()
{
    wait(randomfloat( 1.3 ));
    var_0 = vectortoangles( level.player.origin - self.origin );
    var_1 = anglestoforward( var_0 );
    var_2 = anglestoup( var_0 );
    var_3 = common_scripts\utility::getfx( "0_boat_artillery" );
    playfx( var_3, self.origin, var_1, var_2 );
}

_id_AB03()
{
    if ( !isdefined( level._id_C02B ) )
        level._id_C02B = [];

    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_1 = var_0.unique_id;

        if ( isdefined( level._id_C02B[var_1] ) )
            continue;

        level._id_C02B[var_1] = 1;

        if ( var_0 == level._id_CB62 )
            continue;

        var_0 thread _id_C1B3();
    }
}

_id_C1B3()
{
    var_0 = common_scripts\utility::getfx( "smoke_swirl_runner_dual" );
    playfxontag( var_0, self, "tag_origin" );
}

_id_C0EA()
{
    var_0 = common_scripts\utility::getfx( "f15_missile" );
    playfxontag( var_0, self, "tag_origin" );
    self playsound( "scn_gulag_f15_missile_fire3" );
}

_id_CFB7()
{
    common_scripts\utility::flag_wait( "f15_gulag_attack" );
    var_0 = getentarray( "f15_gulag_attack", "targetname" );
    var_1 = getentarray( "f15_missile_spawner", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_C0EA );
    maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "f15_missile_spawner" );
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "f15_gulag_attack" );
    var_2.animname = "f15";
    var_2 playsound( "scn_gulag_f15_overhead" );
    level._id_AC4D = var_2;
    var_3 = var_2 maps\_utility::getanim( "landing_gear" );
    var_2 setanim( var_3, 1, 0, 1 );
    level waittill( "f15_smoke" );
    level waittill( "afterburner" );
    var_2 thread _id_D59B();
}

_id_D59B()
{
    maps\gulag_anim::_id_D36D( self );
}

_id_BAE5()
{
    var_0 = getentarray( "extra_flyin_spawner", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::self_delete );
    var_1 = getentarray( "heli_respawn_spawner", "script_noteworthy" );
    var_2 = common_scripts\utility::getstructarray( "heli_landing_org", "script_noteworthy" );
    var_3 = [];

    foreach ( var_5 in var_1 )
    {
        if ( isalive( var_5 ) )
            continue;

        var_6 = var_5.origin;

        foreach ( var_8 in var_2 )
        {
            if ( var_8.script_parameters != var_5.script_parameters )
                continue;

            _id_C917( var_5.target, var_8.targetname );
            var_9 = var_8.script_parameters;
            var_5.target = var_8.targetname;
            var_5.origin = var_8.origin;
            var_5.angles = var_8.angles;
            var_3[var_3.size] = var_5;
            break;
        }
    }

    var_12 = level.scr_anim["littlebird"]["respawn"];
    thread _id_BB52( var_3, var_12 );
}

_id_B6A1()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_lands" );
    wait 4;
    self delete();
}

_id_B9BA()
{
    common_scripts\utility::flag_wait( "enable_interior_fx" );
    var_0 = getent( "gulag_cellblock_destructibles", "script_noteworthy" );
    var_0 maps\_utility::activate_destructibles_in_volume();
    var_0 maps\_utility::activate_interactives_in_volume();
    var_1 = getentarray( "gulag_endlog_destructibles", "script_noteworthy" );

    foreach ( var_0 in var_1 )
    {
        var_0 maps\_utility::activate_destructibles_in_volume();
        var_0 maps\_utility::activate_interactives_in_volume();
    }

    var_4 = getentarray( "security_tv", "script_noteworthy" );
    common_scripts\utility::array_thread( var_4, ::_id_C1F7 );
}

_id_C1F7()
{
    var_0 = undefined;

    if ( isdefined( self.target ) )
        var_0 = getent( self.target, "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    self waittill( "exploded" );
    var_0 delete();
}

_id_C268()
{
    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isalive( var_1 ) )
            continue;

        if ( distance( var_1.origin, self.origin ) > 940 )
            continue;

        break;
    }

    var_7 = common_scripts\utility::getstruct( self.target, "targetname" );
    radiusdamage( var_7.origin, 80, 5000, 5000 );
    self delete();
}

_id_D382()
{
    self.attackeraccuracy = 0.25;
}

_id_AE95()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        var_0.attackeraccuracy = 0;
        var_0.ignorerandombulletdamage = 1;
    }
}

_id_D212()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        var_0.attackeraccuracy = 1;
        var_0.ignorerandombulletdamage = 0;
    }
}

_id_B37C()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        var_0._id_B89C = 1;
    }
}

_id_B2FB()
{
    var_0 = [];

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isalive( var_1 ) )
            continue;

        if ( isdefined( var_0[var_1.unique_id] ) )
            continue;

        var_0[var_1.unique_id] = 1;
        var_1.grenadeawareness = 0.9;
        var_1 maps\_utility::delaythread( 4, maps\_utility::disable_dontevershoot );
    }
}

_id_BEA5( var_0 )
{
    var_1 = getent( "endlog_soap_spawner", "targetname" );
    var_1.origin = var_0[0].origin;
    var_0[0] delete();
    var_0[0] = var_1;
    return var_0;
}

_id_B4A8()
{
    playfx( common_scripts\utility::getfx( "sparks_e_sound" ), self.origin );
    self setlightintensity( 0 );
}

_id_BF78()
{
    self physicslaunchclient( self.origin + ( 0.0, 0.0, 5.0 ), ( 0.0, 0.0, -5.0 ) );
}

_id_AD55()
{
    if ( level.player getcurrentweapon() != "riotshield" )
        return;

    level.player takeweapon( "riotshield" );
    var_0 = level.player getweaponslistprimaries();

    foreach ( var_2 in var_0 )
    {
        level.player switchtoweapon( var_2 );
        break;
    }

    var_4 = level.player.origin + ( 0.0, 0.0, 64.0 );
    spawn( "weapon_riotshield", var_4 );
    var_5 = getentarray( "weapon_riotshield", "code_classname" );
    wait 0.05;
    var_6 = common_scripts\utility::getclosest( level.player.origin, var_5 );

    for ( var_7 = 0; var_7 < 100; var_7++ )
    {
        if ( !isdefined( var_6 ) )
            return;

        var_6.angles = ( 270.0, 180.0, 0.0 );
        wait 0.05;
    }
}

_id_D07F()
{
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_calloff" );
    wait 1;
    maps\_utility::radio_dialogue( "gulag_hqr_working" );
    maps\_utility::delaythread( 3, maps\_utility::radio_dialogue, "gulag_hqr_loosecannon" );
    level maps\_utility::notify_delay( "stop_hallway_bombardment", 6 );
}

_id_CCA6()
{
    var_0 = getent( "gulag_spotlight", "targetname" );
    var_0 setmode( "manual" );
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_0 settargetentity( var_1 );
    var_2 = common_scripts\utility::getfx( "_attack_heli_spotlight" );
    var_3 = "tag_light";
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "spotlight_turns_on" );
    maps\_utility::add_noself_call( ::playfxontag, var_2, var_0, var_3 );
    maps\_utility::add_func( common_scripts\utility::play_sound_in_space, "scn_gulag_spotlight_on", var_0.origin, 1 );
    thread maps\_utility::do_wait();
    _id_BF5C( var_1, var_0 );
    wait 2.5;
    var_1 delete();
    stopfxontag( var_2, var_0, var_3 );
}

_id_C4D1()
{
    level.spotlights = [];
    level.spotlights["a"] = getent( "gulag_spotlight_a", "targetname" );
    level.spotlights["b"] = getent( "gulag_spotlight_b", "targetname" );

    foreach ( var_1 in level.spotlights )
    {
        var_1 setmode( "manual" );
        var_1.ent = getent( var_1.targetname, "script_noteworthy" );
        var_2 = var_1.targetname[var_1.targetname.size - 1];
        var_1._id_BC7D = getent( "target_" + var_2 + "1", "targetname" );
        var_1 settargetentity( var_1.ent );
        var_1 setdefaultdroppitch( 45 );
        var_1.fx = common_scripts\utility::getfx( "jail_spotlight_gulag" );
        var_1.fx_tag = "tag_light";
        maps\_utility::add_wait( common_scripts\utility::flag_wait, "spotlight_turns_on" );
        maps\_utility::add_noself_call( ::playfxontag, var_1.fx, var_1, var_1.fx_tag );
        maps\_utility::add_func( common_scripts\utility::play_sound_in_space, "scn_gulag_spotlight_on", var_1.origin, 1 );
        var_1 maps\_utility::add_call( ::setmodel, "com_blackhawk_spotlight_on_mg_setup_3x_cold" );
        thread maps\_utility::do_wait();
    }

    level waittill( "spotlights_off" );

    foreach ( var_1 in level.spotlights )
    {
        var_1.ent delete();
        stopfxontag( var_1.fx, var_1, var_1.fx_tag );
        var_1 setmodel( "com_blackhawk_spotlight_on_mg_setup_3x_cold_off" );
    }
}

_id_BF5C( var_0, var_1 )
{
    level endon( "rappel_time" );
    var_2 = anglestoforward( var_1.angles );
    var_0.origin = var_1.origin + var_2 * 500 + ( 0.0, 0.0, -500.0 );
    var_3 = 200;

    for (;;)
    {
        var_4 = getaiarray( "axis" );
        var_5 = [];

        foreach ( var_7 in var_4 )
        {
            var_8 = abs( var_7.origin[2] - level.player.origin[2] );

            if ( var_8 > 64 )
                continue;

            var_5[var_5.size] = var_7;
        }

        var_7 = common_scripts\utility::getclosest( level.player.origin, var_5 );

        if ( !isalive( var_7 ) )
        {
            wait 0.2;
            continue;
        }

        var_10 = distance( var_7.origin, var_0.origin );
        var_11 = common_scripts\utility::randomvector( 25 );
        var_12 = randomfloatrange( -16, 16 );
        var_11 += ( 0, 0, var_12 );
        var_13 = var_10 / var_3;
        var_14 = randomfloatrange( 0.7, 1.3 );

        if ( var_13 < var_14 )
            var_13 = var_14;

        var_15 = var_7.origin + ( 0.0, 0.0, 40.0 ) + var_11;

        if ( isdefined( level._id_C8AF ) )
            var_15 = level._id_C8AF;

        var_0 moveto( var_15, var_13, var_13 * 0.4, var_13 * 0.4 );
        wait(var_13);
    }
}

_id_C606( var_0 )
{
    level endon( "spotlights_off" );
    self endon( "stop_searching" );
    var_1 = anglestoforward( self.angles );
    self.ent.origin = self.origin + var_1 * 500 + ( 0.0, 0.0, -500.0 );
    var_2 = 200;

    for (;;)
    {
        var_3 = var_0 maps\_utility::get_ai_touching_volume( "axis" );

        if ( var_3.size > 0 )
        {
            var_4 = [];

            foreach ( var_6 in var_3 )
            {
                var_7 = abs( var_6.origin[2] - level.player.origin[2] );

                if ( var_7 > 64 )
                    continue;

                var_4[var_4.size] = var_6;
            }

            var_6 = common_scripts\utility::getclosest( level.player.origin, var_4 );

            if ( !isalive( var_6 ) )
            {
                wait 0.2;
                continue;
            }
        }
        else
        {
            var_6 = self._id_BC7D;
            wait 0.2;
        }

        var_9 = distance( var_6.origin, self.ent.origin );

        if ( var_6 != self._id_BC7D )
        {
            var_10 = common_scripts\utility::randomvector( 25 );
            var_11 = randomfloatrange( -16, 16 );
            var_10 += ( 0, 0, var_11 );
            var_12 = var_6.origin + ( 0.0, 0.0, 40.0 ) + var_10;
        }
        else
            var_12 = var_6.origin;

        var_13 = var_9 / var_2;
        var_14 = randomfloatrange( 0.7, 1.3 );

        if ( var_13 < var_14 )
            var_13 = var_14;

        self.ent moveto( var_12, var_13, var_13 * 0.4, var_13 * 0.4 );
        wait(var_13);
    }
}

_id_BF30()
{
    for (;;)
        wait 0.05;
}

_id_D582()
{
    self.attackeraccuracy = 0;
    var_0 = getent( "armory_clear_enemy_volume", "targetname" );
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == self )
            continue;

        if ( !var_3 istouching( var_0 ) )
            continue;

        var_4 = randomfloatrange( 0.5, 1.5 );
        var_3 common_scripts\utility::delaycall( var_4, ::kill );
    }
}

_id_CB06( var_0 )
{
    var_1 = level.global_fx[var_0];
    return level._effect[var_1];
}

_id_C38D()
{
    level endon( "open_cell_door2" );
    var_0 = getentarray( "close_fighter_spawner", "targetname" );
    var_1 = getent( "door_guys_fight_vol", "targetname" );
    var_1 maps\_utility::waittill_volume_dead();

    foreach ( var_3 in var_0 )
        var_3.count = 1;

    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    wait 3;

    foreach ( var_3 in var_0 )
        var_3.count = 1;

    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_A87A()
{
    var_0 = maps\_utility::getentwithflag( "player_approaches_armory" );
    level._id_C8AF = var_0.origin;
    var_1 = getnode( "cellblock_delete_node", "targetname" );
    var_2 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_2, ::_id_AB54, var_1 );
}

_id_D588()
{
    var_0 = maps\_utility::getentwithflag( "player_approaches_armory" );
    level._id_C8AF = var_0.origin;
    var_1 = getnode( "cells_last_flee_node", "targetname" );
    var_2 = getaiarray( "axis" );

    foreach ( var_4 in var_2 )
    {
        if ( !isdefined( var_4.script_goalvolume ) )
            continue;

        if ( var_4.script_goalvolume == "cells_north" )
            var_4 thread _id_AB54( var_1 );
    }
}

_id_AB54( var_0 )
{
    self endon( "death" );
    var_1 = randomfloat( 6 );
    wait(var_1);
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    self delete();
}

_id_C523()
{
    level.player endon( "death" );
    var_0 = level.player.threatbias;
    thread _id_ABEB();

    for (;;)
    {
        if ( level.player getcurrentweapon() == "riotshield" )
        {
            level.player.threatbias = var_0 + 1000;
            thread _id_C574();
            soundscripts\_snd::snd_message( "start_plr_shield_mix" );
        }
        else
        {
            level.player.threatbias = var_0;
            soundscripts\_snd::snd_message( "stop_plr_shield_mix" );
        }

        level.player waittill( "weapon_change" );
    }
}

_id_C574()
{
    level.player endon( "weapon_change" );

    for (;;)
    {
        var_0 = getaiarray( "axis" );
        var_1 = common_scripts\utility::getclosest( level.player.origin, var_0, 700 );

        if ( isalive( var_1 ) )
            var_1 thread _id_C91B();

        wait 1;
    }
}

_id_C91B()
{
    self endon( "death" );
    self.attackeraccuracy = 10;
    self.threatbias = 1000;
    wait 1;
    self.attackeraccuracy = 1;
    self.threatbias = 0;
}

_id_ABEB()
{
    _id_AEEA();
    maps\_gameskill::updatealldifficulty();
    anim.shootenemywrapper_func = animscripts\utility::shootenemywrapper_shootnotify;
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
        var_2.baseaccuracy = 1;
}

_id_AEEA()
{
    level endon( "run_from_armory" );

    if ( common_scripts\utility::flag( "run_from_armory" ) )
        return;

    for (;;)
    {
        level.player waittill( "weapon_change" );

        if ( level.player getcurrentweapon() != "riotshield" )
            continue;

        anim.shootenemywrapper_func = ::_id_B9C9;
        level.player waittill( "weapon_change" );
        maps\_gameskill::updatealldifficulty();
        anim.shootenemywrapper_func = animscripts\utility::shootenemywrapper_shootnotify;
    }
}

_id_B9C9( var_0 )
{
    if ( !isalive( self.enemy ) )
        return;

    if ( !isalive( level.player ) )
        return;

    var_1 = [];
    var_1[0] = 0.85;
    var_1[1] = 0.85;
    var_1[2] = 0.83;
    var_1[3] = 0.81;
    var_2 = var_1[level.gameskill];

    if ( self.enemy == level.player )
    {
        var_3 = level.player getplayerangles();
        var_4 = anglestoforward( var_3 );
        var_5 = vectortoangles( self.origin - level.player.origin );
        var_6 = anglestoforward( var_5 );

        if ( vectordot( var_4, var_6 ) >= var_2 )
            self.baseaccuracy = 5000;
        else
            self.baseaccuracy = 0;
    }

    animscripts\utility::shootenemywrapper_shootnotify( var_0 );
}

_id_AA56()
{
    if ( !isdefined( self._id_AA7F ) )
        return;

    self.disablebulletwhizbyreaction = 0;
    self._id_AA7F = undefined;
    self.threatbias -= level._id_D498;
    self.dropshieldinplace = 1;
    self.allowpain = 0;
    maps\_utility::delaythread( 8, ::_id_B00F );
    self animcustom( animscripts\riotshield\riotshield::riotshield_flee_and_drop_shield );
    self.fixednode = 1;
}

_id_B00F()
{
    self.minpaindamage = 0;
    maps\_utility::enable_pain();
}

_id_D07A()
{
    self endon( "death" );
    wait 0.05;
    self.baseaccuracy = 5000;
    level._id_BF18[level._id_BF18.size] = self;
    var_0 = self.radius;
    self._id_C391 = 1;
    self.goalradius = 16;
    self.grenadeammo = 0;
    self.combatmode = "ambush";
    self setgoalpos( self.origin );
    self cleargoalvolume();
    self._id_A867 = 0;
    self._id_CE99 = 0;
    maps\_utility::set_battlechatter( 0 );
    _id_B89E();

    if ( !self._id_A867 && !self._id_CE99 )
        self delete();

    self.goalradius = var_0;
}

_id_B89E()
{
    level endon( "lets_sweep_the_nvg_cells" );

    if ( common_scripts\utility::flag( "lets_sweep_the_nvg_cells" ) )
        return;

    for (;;)
    {
        if ( self cansee( level.player ) )
            break;

        wait 0.05;
    }

    self._id_A867 = 1;
}

_id_B484()
{
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2.attackeraccuracy = 0.1;
        var_2.maxvisibledist = 100;
    }

    _id_AD3E();
    level notify( "stop_following_node_chain" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::enable_ai_color();
        var_2.attackeraccuracy = 1;
        var_2.maxvisibledist = 8192;
    }

    maps\_utility::activate_trigger_with_targetname( "nvg_hallway_fightnodes" );
}

_id_AD3E()
{
    if ( common_scripts\utility::flag( "nvg_leave_cellarea" ) )
        return;

    level endon( "nvg_leave_cellarea" );
    level._id_C548 = [];
    level._id_AEF3 = 0;
    common_scripts\utility::run_thread_on_targetname( "friendly_clears_cell_trigger", ::_id_A95B );
    var_0 = spawnstruct();
    var_0.index = 1;
    var_0 thread _id_CBC0();

    for (;;)
    {
        common_scripts\utility::flag_wait( "nvg_moveup" + var_0.index );
        var_0.index++;

        if ( var_0.index > 4 )
        {
            var_0 notify( "stop" );
            return;
        }
    }
}

_id_CBC0()
{
    level endon( "nvg_leave_cellarea" );
    self endon( "stop" );

    for (;;)
    {
        maps\_utility::activate_trigger_with_targetname( "friendly_nvg_cell_hall_moveup" + self.index );
        wait 0.5;
    }
}

_id_B12F( var_0 )
{
    self endon( "death" );
    level endon( "stop_following_node_chain" );

    if ( common_scripts\utility::flag( "nvg_leave_cellarea" ) )
        return;

    level endon( "nvg_leave_cellarea" );
    maps\_utility::disable_ai_color();

    for (;;)
    {
        self setgoalnode( var_0 );
        common_scripts\utility::flag_wait( var_0.script_flag );

        if ( !isdefined( var_0.target ) )
            return;

        var_0 = getnode( var_0.target, "targetname" );
    }
}

_id_A95B()
{
    if ( common_scripts\utility::flag( "nvg_leave_cellarea" ) )
        return;

    level endon( "nvg_leave_cellarea" );
    var_0 = self.script_flag;

    if ( !isdefined( level._id_C548[var_0] ) )
        level._id_C548[var_0] = 0;

    level._id_C548[var_0]++;
    var_1 = getent( self.target, "targetname" );
    var_2 = getnode( self.target, "targetname" );
    var_3 = undefined;

    for (;;)
    {
        self waittill( "trigger", var_4 );

        if ( isdefined( var_2 ) )
            var_4 thread _id_B12F( var_2 );

        if ( isdefined( var_4.node ) && isdefined( var_4.node.radius ) )
            var_4.maxvisibledist = var_4.node.radius;

        var_3 = var_1 maps\_utility::waittill_volume_dead_or_dying();

        if ( isalive( var_4 ) && var_4 istouching( self ) )
            break;
    }

    var_5 = [];
    var_5[var_5.size] = "gulag_tf2_onesempty";
    var_5[var_5.size] = "gulag_tf3_emptytoo";
    var_5[var_5.size] = "gulag_tf2_clear";
    var_5[var_5.size] = "gulag_tf3_clear";
    var_6 = var_5[level._id_AEF3];

    if ( var_3 )
    {
        var_6 = "gulag_tf3_clear";
        wait 0.9;
    }
    else
    {
        level._id_AEF3++;
        level._id_AEF3 %= var_5.size;
    }

    thread maps\_utility::radio_dialogue( var_6 );
    level._id_C548[var_0]--;

    if ( !level._id_C548[var_0] )
        common_scripts\utility::flag_set( var_0 );
}

_id_B6B9()
{
    common_scripts\utility::flag_wait( "nvg_hallway_fight" );
    level._id_BF18 = [];
    maps\_utility::array_spawn_function_noteworthy( "hallway_hider_spawner", ::_id_D07A );
    maps\_utility::array_spawn_noteworthy( "hallway_hider_spawner" );
    common_scripts\utility::flag_wait( "nvg_enemy_flag" );
    wait 1.5;
    var_0 = getent( "nvg_vol", "targetname" );

    for (;;)
    {
        var_0 maps\_utility::waittill_volume_dead_or_dying();
        wait 2.8;
        maps\_utility::wait_for_buffer_time_to_pass( anim.lastteamspeaktime["axis"], 2.5 );
        var_1 = var_0 maps\_utility::get_ai_touching_volume( "axis" );

        if ( !var_1.size )
            break;
    }

    common_scripts\utility::flag_set( "checking_to_sweep_cells" );
    var_2 = getaiarray( "axis" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( var_5._id_C391 ) )
            continue;

        var_5 cleargoalvolume();
        var_5 setgoalpos( level._id_D13B.origin );
        var_5.combatmode = "no_cover";
        var_5 maps\_utility::set_battlechatter( 0 );
        var_5.grenadeammo = 0;
        var_5.goalradius = 500;
        var_3[var_3.size] = var_5;
    }

    var_7 = var_3.size;
    maps\_utility::waittill_dead_or_dying( var_3, 0, 6 );

    if ( var_7 )
        wait 1.4;

    var_8 = 1;
    level._id_BF18 = common_scripts\utility::array_randomize( level._id_BF18 );

    foreach ( var_5 in level._id_BF18 )
    {
        if ( !isalive( var_5 ) )
            continue;

        var_5._id_CE99 = 1;
        var_8--;

        if ( !var_8 )
            break;
    }

    maps\_utility::delaythread( 1.5, common_scripts\utility::flag_set, "lets_sweep_the_nvg_cells" );

    if ( !common_scripts\utility::flag( "nvg_moveup1" ) )
        level._id_D13B thread maps\_utility::dialogue_queue( "gulag_cmt_stragglers" );
}

_id_D2D9()
{
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        var_2.diequietly = 1;
        var_2 kill();
    }
}

_id_C095()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( issubstr( var_0.classname, "riot" ) )
            break;
    }

    wait 2.5;
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_hitfromside" );
    level._id_D13B maps\_utility::dialogue_queue( "gulag_cmt_cookgrenades" );
}

_id_D5A6()
{
    setsaveddvar( "compass", "1" );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "hud_drawhud", 1 );
}

_id_C844()
{
    level.player enableweapons();
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "hud_drawhud", 1 );
}

_id_D1B6()
{
    common_scripts\utility::flag_wait( "player_lands" );
    var_0 = getentarray( "gulag_top_gate", "targetname" );
    common_scripts\utility::array_call( var_0, ::solid );
    common_scripts\utility::array_call( var_0, ::show );
    _func_31C( 2 );
    maps\_utility::delaythread( 6, ::_id_D5A6 );
    maps\_utility::delaythread( 6, maps\_utility::player_can_be_shot );
    var_1 = getent( "landing_death_volume", "targetname" );
    var_2 = getaiarray( "axis" );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 istouching( var_1 ) )
        {
            _id_B190::_id_D55F( var_4 );
            var_4.diequietly = 1;
            var_4 kill();
        }
    }

    var_1 delete();
    var_2 = getaiarray( "allies" );

    foreach ( var_4 in var_2 )
    {
        if ( var_4.baseaccuracy > 2 )
            var_4.baseaccuracy = 2;
    }
}

_id_D599()
{
    var_0 = getnode( "soap_heli_node", "targetname" );
    level._id_D13B maps\_utility::disable_ai_color();
    level._id_D13B setgoalnode( var_0 );
    level._id_D13B.goalradius = var_0.radius;
    level._id_D13B waittill( "goal" );
    level._id_D13B maps\_utility::set_force_color( "g" );
}

_id_C6E4()
{
    wait 3.75;
    var_0 = level.dofdefault;
    var_1 = [];
    var_1["nearStart"] = 5;
    var_1["nearEnd"] = 10;
    var_1["nearBlur"] = 10;
    var_1["farStart"] = 25;
    var_1["farEnd"] = 30;
    var_1["farBlur"] = 10;
    var_2 = [];
    var_2["nearStart"] = 2;
    var_2["nearEnd"] = 17;
    var_2["nearBlur"] = 7;
    var_2["farStart"] = 25;
    var_2["farEnd"] = 30;
    var_2["farBlur"] = 7;
    var_3 = [];
    var_3["nearStart"] = 30;
    var_3["nearEnd"] = 36;
    var_3["nearBlur"] = 7;
    var_3["farStart"] = 100;
    var_3["farEnd"] = 120;
    var_3["farBlur"] = 7;
    var_4 = [];
    var_4["nearStart"] = 24;
    var_4["nearEnd"] = 28;
    var_4["nearBlur"] = 4;
    var_4["farStart"] = 140;
    var_4["farEnd"] = 180;
    var_4["farBlur"] = 4;
    var_5 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_5.origin = ( 65.0, 0.0, 0.0 );
    var_5 thread _id_BFB7();
    var_6 = level._id_BDD7;
    maps\_utility::_id_B75A( var_0, var_1, 0.25 );
    var_7 = 0.85;
    maps\_utility::wait_for_buffer_time_to_pass( var_6, 5.0 );
    maps\_utility::_id_B75A( var_1, var_2, 0.5 );
    var_5 common_scripts\utility::delaycall( 0.0, ::moveto, ( 45.0, 0.0, 0.0 ), 0.8, 0.4, 0.4 );
    maps\_utility::wait_for_buffer_time_to_pass( var_6, 5.85 + var_7 );
    common_scripts\utility::noself_delaycall( 2.0, ::setsaveddvar, "g_friendlynamedist", 196 );
    maps\_utility::_id_B75A( var_2, var_3, 1.0 );
    maps\_utility::wait_for_buffer_time_to_pass( var_6, 7.5 + var_7 + 2 );
    var_5 thread _id_C616();
    maps\_utility::_id_B75A( var_3, var_4, 2 );
    common_scripts\utility::flag_wait( "background_explosion" );
    maps\_utility::_id_B75A( var_4, var_0, 1 );
}

_id_D0D7()
{
    var_0 = _id_D397::_id_A97A( "gulag_price_rescue" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AF90( 1.0 );
    var_0 _id_D397::_id_BEA0( 25.5 ) _id_D397::_id_CFD7();
    var_0 _id_D397::_id_BEA0( 0.3 ) _id_D397::_id_C491( 18, -1, 16, 16, "gulag_price_rescue" ) _id_D397::_id_CCA7( level.price, "tag_eye", "gulag_price_rescue" ) _id_D397::_id_ADE6( -27, "gulag_price_rescue" ) _id_D397::_id_D150( 6.0, "gulag_price_rescue" ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 0.75 ) _id_D397::_id_C491( 6.8, -1, 3, 3, "gulag_price_rescue" );
    var_0 _id_D397::_id_BEA0( 4.5 ) _id_D397::_id_C491( 0.4, 10, 8, 8, "gulag_price_rescue" ) _id_D397::_id_ADE6( 0, "gulag_price_rescue" ) _id_D397::_id_D150( 4, "gulag_price_rescue" );
    var_0 _id_D397::_id_BEA0( 6.5 ) _id_D397::_id_C491( 0.4, 30, 2, 2, "gulag_price_rescue" );
    var_0 _id_D397::_id_BEA0( 7.5 ) _id_D397::_id_C491( 8.5, 7.0, 12, 12, "gulag_price_rescue" );
    var_0 _id_D397::_id_BEA0( 9.25 ) _id_D397::_id_C491( 1.6, -1, 6, 6, "gulag_price_rescue" ) _id_D397::_id_CCA7( level.price, "tag_eye", "gulag_price_rescue" );
    var_0 _id_D397::_id_BEA0( 12.0 ) _id_D397::_id_C491( 4.5, -1, 2, 2, "gulag_price_rescue" ) _id_D397::_id_CCA7( level.price, "tag_eye", "gulag_price_rescue" ) _id_D397::_id_ADE6( 7, "gulag_price_rescue" );
    var_0 _id_D397::_id_BEA0( 17.0 ) _id_D397::_id_C491( 4.0, -1, 0.5, 0.5, "gulag_price_rescue" ) _id_D397::_id_CCA7( level.price, "tag_eye", "gulag_price_rescue" ) _id_D397::_id_ADE6( 0, "gulag_price_rescue" );
    var_0 _id_D397::_id_BEA0( 23.3 ) _id_D397::_id_C491( 32.0, 500, 2.0, 2.0, "gulag_price_rescue" );
    var_0 _id_D397::_id_BEA0( 25.5 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 4.5 ) _id_D397::_id_AC9F( 55, 1.15, 0 );
    var_0 _id_D397::_id_BEA0( 8.0 ) _id_D397::_id_AC9F( 45, 2.5, 0 );
    var_0 _id_D397::_id_BEA0( 11.5 ) _id_D397::_id_AC9F( 50, 1.75, 0 );
    var_0 _id_D397::_id_BEA0( 17.0 ) _id_D397::_id_AC9F( 55, 3, 0 );
    var_0 _id_D397::_id_BEA0( 22.0 ) _id_D397::_id_A9EC( 3.8, 0 );
    var_0 _id_D397::_id_BEA0( 22.15 ) _id_D397::_id_B85E( 0.8, 2.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BEA0( 22.4 ) _id_D397::_id_B85E( 1.0, 2.5 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.25 );
    var_0 _id_D397::_id_BEA0( 23.25 ) _id_D397::_id_B85E( 1.0, 2.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.25 );
    var_0 _id_D397::_id_BEA0( 23.75 ) _id_D397::_id_B85E( 0.7, 2.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 24.75 ) _id_D397::_id_B85E( 1.0, 3.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.25 );
    var_0 _id_D397::_id_BEA0( 3.95 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.25 );
    var_0 _id_D397::_id_BEA0( 4.9 ) _id_D397::_id_B85E( 0.8, 2.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.2 );
    var_0 _id_D397::_id_BEA0( 5.2 ) _id_D397::_id_B85E( 0.6, 3.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.5 );
    var_0 _id_D397::_id_BEA0( 23.5 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 4.5 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 22.0 ) _id_D397::_id_C74A();
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_init", 1 );
    var_0 _id_D397::_id_BEA0( 4.5 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_play", 1 );
    var_0 _id_D397::_id_BEA0( 4.5 ) _id_D397::_id_A970( soundscripts\_snd::snd_message, undefined, "start_price_hit_unconscious" );
    var_0 _id_D397::_id_BC26();
}

_id_C616()
{
    level waittill( "background_explosion" );
    wait 0.15;
    var_0 = 0.6;
    self moveto( ( 65.0, 0.0, 0.0 ), var_0, var_0 * 0.5, var_0 * 0.5 );
    wait(var_0);
    wait 0.1;
    self delete();
}

_id_BFB7()
{
    self endon( "death" );

    for (;;)
    {
        setsaveddvar( "cg_fov", self.origin[0] );
        wait 0.05;
    }
}

_id_B610()
{
    var_0 = [];
    var_0[0] = "sewer_slide_1";
    var_0[1] = "sewer_slide_2";
    var_0[2] = "sewer_slide_soap";
    var_1 = [];
    var_1[0] = common_scripts\utility::getstruct( "sewer_slide_guy1", "targetname" );
    var_1[1] = common_scripts\utility::getstruct( "sewer_slide_guy2", "targetname" );
    var_1[2] = common_scripts\utility::getstruct( "sewer_slide_soap", "targetname" );
    level._id_C2E2 = 0;
    level.player thread _id_BAAE();
    thread _id_BB5F();

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( !isalive( var_2 ) )
            continue;

        if ( !maps\_utility::first_touch( var_2 ) )
            continue;

        var_2 thread _id_C54B( var_1, var_0 );
    }
}

_id_BB5F()
{
    var_0 = getent( "clip_player_avoid_going_back_into_slide", "targetname" );
    var_0 notsolid();
    common_scripts\utility::flag_wait( "kill_slide_trigger" );
    wait 0.5;
    var_0 solid();
}

_id_C54B( var_0, var_1 )
{
    self endon( "death" );
    self endon( "start_breach" );

    if ( self == level._id_D13B )
    {
        var_2 = var_1[2];
        var_3 = var_0[2];
    }
    else
    {
        var_2 = var_1[level._id_C2E2];
        var_3 = var_0[level._id_C2E2];
        level._id_C2E2++;
    }

    var_3 maps\_anim::anim_generic_reach( self, var_2 );
    maps\_utility::delaythread( 2, maps\_utility::enable_ai_color );
    var_3 maps\_anim::anim_single_solo( self, var_2, undefined, undefined, "generic" );
}

_id_BAAE()
{
    var_0 = getent( "sewer_slide_trigger", "targetname" );
    var_1 = [];
    var_1[var_1.size] = common_scripts\utility::getstruct( "sewer_slide_guy1", "targetname" );
    var_1[var_1.size] = common_scripts\utility::getstruct( "sewer_slide_guy2", "targetname" );
    var_1[var_1.size] = common_scripts\utility::getstruct( "sewer_slide_soap", "targetname" );
    var_2 = getent( "sewer_slide_input", "targetname" );
    var_2 waittill( "trigger" );
    var_3 = getent( "sewer_slide_hint", "targetname" );
    var_3 sethintstring( &"SCRIPT_MANTLE" );
    var_3 usetriggerrequirelookat();
    var_3 _meth_85BC();

    for (;;)
    {
        if ( self istouching( var_2 ) )
        {
            self allowjump( 0 );

            if ( self _meth_85A3() && self jumpbuttonpressed() )
                break;
        }
        else
            self allowjump( 1 );

        waitframe();
    }

    self allowjump( 1 );
    self _meth_85A4( 0 );
    var_3 sethintstring( "" );
    var_3 common_scripts\utility::trigger_off();
    var_2 common_scripts\utility::trigger_off();
    self endon( "death" );
    self endon( "cancel_sliding" );
    var_4 = common_scripts\utility::getclosest( self.origin, var_1 );
    var_5 = getstartorigin( var_4.origin, var_4.angles, level.scr_anim["worldbody"]["slide_in"] );
    var_6 = spawn( "script_origin", var_5 );
    var_6.angles = var_4.angles;
    maps\_utility::lerp_player_view_to_position( var_6.origin, var_6.angles, 0.25, 1 );
    var_7 = getanimlength( level.scr_anim["worldbody"]["slide_in"] );
    thread maps\_utility::beginsliding( ( 0.0, 0.0, -240.0 ), undefined, undefined, 1, 0, var_4, var_0.script_rumble );
    wait(var_7);

    for ( var_8 = common_scripts\utility::spawn_tag_origin(); var_8 istouching( var_0 ); var_8.angles = self.angles )
    {
        waitframe();
        var_8.origin = self.origin;
    }

    var_8 delete();
    maps\_utility::endsliding( 1, 0, 1, 0.08, var_0.script_rumble );
}

_id_AF34()
{
    common_scripts\utility::flag_wait( "a_heli_landed" );
    var_0 = getent( "ai_field_blocker", "targetname" );
    var_0 solid();
    var_0 disconnectpaths();
}

_id_D239()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0.origin = self.origin;
    var_0 setmodel( "tag_laser" );
    var_0 thread _id_B2BF( self.target );
}

_id_B2BF( var_0 )
{
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    thread _id_AA74( var_1 );
    var_1 thread _id_BA95();
    wait 1;
    var_1 notify( "stop_jitter" );
    var_2 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_1 moveto( var_2.origin, 3, 1, 2 );
    wait 3;
    var_2 = common_scripts\utility::getstruct( var_2.target, "targetname" );
    var_1 moveto( var_2.origin, 1.5, 0.5, 0.7 );
    wait 1.5;
    self notify( "stop_line" );
    self delete();
    var_1 delete();
}

_id_BA95()
{
    self endon( "stop_jitter" );
    var_0 = self.origin;

    for (;;)
    {
        var_1 = var_0 + common_scripts\utility::randomvector( 30 );
        var_2 = randomfloatrange( 0.5, 0.75 );
        self moveto( var_1, var_2 );
        wait(var_2);
    }
}

_id_AA74( var_0 )
{
    self endon( "stop_line" );
    maps\_utility::_id_D295();
    wait 0.05;
    self.angles = vectortoangles( var_0.origin - self.origin );
    wait 0.05;

    for (;;)
    {
        self rotateto( vectortoangles( var_0.origin - self.origin ), 0.1 );
        wait 0.1;
    }
}

_id_C378()
{
    if ( self.weapon == "m1014" )
        self._id_AC05 = self.maxfaceenemydist;

    self.maxfaceenemydist = 3048;
}

_id_CBC5()
{
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_AC05 ) )
            var_2.maxfaceenemydist = var_2._id_AC05;
    }
}

_id_C222()
{
    var_0 = 0.8;

    switch ( level.start_point )
    {
        case "intro":
            setsaveddvar( "sm_sunSampleSizeNear", 0.25 );
            wait 27;
            maps\_introscreen::_id_B956( 2, var_0 );
        case "f15":
        case "unload":
        case "approach":
            setsaveddvar( "sm_sunSampleSizeNear", var_0 );
            common_scripts\utility::flag_wait( "player_lands" );
            maps\_introscreen::_id_B956( 1.5 );
        default:
            setsaveddvar( "sm_sunSampleSizeNear", 0.25 );
            break;
    }
}

_id_AE04()
{
    if ( common_scripts\utility::flag( "disable_intro_heli_treadfx_hack" ) )
        return;

    self notify( "stop_kicking_up_dust" );
    var_0 = common_scripts\utility::_id_B6EF( "tag_origin", ( 2000.0, 1500.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    thread maps\_vehicle_code::aircraft_wash_thread( var_0 );
    common_scripts\utility::flag_wait( "disable_intro_heli_treadfx_hack" );
    self notify( "stop_kicking_up_dust" );
    waitframe();
    thread maps\_vehicle_code::aircraft_wash_thread();
    var_0 delete();
}

_id_B96F( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 != "water" && var_0 != "ice" )
        return;

    var_3 = gettime() * 0.001;
}

_id_D2E9( var_0, var_1 )
{
    var_0 -= 1.3;
    var_0 *= 1000;
    var_2 = var_0 - gettime();

    if ( var_2 > 0 )
        wait(var_2 * 0.001);

    playfx( level._id_CCC5, var_1 );
}

_id_C78D()
{

}

_id_B8F3()
{
    common_scripts\utility::flag_wait( "kill_slide_trigger" );
    wait 1;
    var_0 = maps\_utility::getentwithflag( "kill_slide_trigger" );
    var_1 = getent( var_0.target, "targetname" );
    var_1 common_scripts\utility::trigger_off();
}

_id_ADC4()
{
    if ( self.code_classname != "script_model" )
        return;

    thread _id_CE22();
}

_id_CE22()
{
    self waittill( "damage" );
    var_0 = 0;

    for (;;)
    {
        if ( !isdefined( self.destructible_parts ) )
            return;

        self dodamage( 500, self.origin, level.player );
        waittillframeend;
        var_0++;

        if ( var_0 >= 10 )
        {
            var_0 = 0;
            wait 0.05;
        }
    }
}

_id_B7DB()
{

}

_id_CB9D()
{
    var_0 = getentarray( "landing_blocker", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 connectpaths();
        var_2 notsolid();
    }

    common_scripts\utility::flag_wait( "player_lands" );

    foreach ( var_2 in var_0 )
    {
        var_2 solid();
        var_2 disconnectpaths();
    }
}

_id_B6F0()
{
    var_0 = common_scripts\utility::getstruct( "ghost_laptop_struct", "targetname" );
    level._id_C96D = maps\_utility::spawn_anim_model( "folding_chair" );
    var_0 thread maps\_anim::anim_first_frame_solo( level._id_C96D, "laptop_approach" );
}

_id_CB8E()
{
    level._id_B8D7 endon( "death" );
    common_scripts\utility::flag_wait( "ghost_goes_to_laptop" );
    var_0 = common_scripts\utility::getstruct( "ghost_laptop_struct", "targetname" );
    level._id_D4FF = var_0;
    var_0 thread maps\_anim::anim_reach_solo( level._id_B8D7, "laptop_approach" );
    level._id_B8D7 waittill( "goal" );
    common_scripts\utility::flag_set( "ghost_uses_laptop" );
    var_1 = [];
    var_1["ghost"] = level._id_B8D7;
    var_1["chair"] = level._id_C96D;
    var_0 maps\_anim::anim_single( var_1, "laptop_approach" );
    thread _id_C56C();
    var_2 = getent( "ghost_laptop", "targetname" );
    var_2 setmodel( "h2_com_laptop_rugged_open_gulag" );
}

_id_D0F2()
{
    if ( common_scripts\utility::flag( "ghost_uses_laptop" ) )
        return;

    level endon( "ghost_uses_laptop" );
    var_0 = common_scripts\utility::getstruct( "ghost_teleport_look_target_struct", "targetname" );

    for (;;)
    {
        if ( !maps\_utility::player_looking_at( var_0.origin, 0.7, 1 ) )
            break;

        wait 0.05;
    }

    level._id_B8D7 teleport( level._id_B8D7.goalpos );
}

_id_B512()
{
    self endon( "death" );
    maps\_utility::add_damage_function( ::_id_C0C4 );
    self.disablearrivals = 1;
    self.ignoreall = 1;
    self waittill( "goal" );
    wait 1.2;
    self.disablearrivals = 0;
    self.ignoreall = 0;
}

_id_C794()
{
    maps\_utility::add_damage_function( ::_id_C0C4 );
}

_id_C0C4( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_4 ) )
        return;

    if ( var_4 != "MOD_TRIGGER_HURT" )
        return;

    self dodamage( 50, var_3, var_1, var_1 );
}

_id_B5BE( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = var_2;
    var_8 = anglestoforward( var_7 );
    var_9 = anglestoup( var_7 );
    var_10 = common_scripts\utility::getfx( "headshot" );
    playfx( var_10, var_3, var_8, var_9 );
}

_id_D005()
{
    if ( common_scripts\utility::flag( "player_exited_bathroom" ) )
        return;

    if ( common_scripts\utility::flag( "leaving_bathroom_vol2" ) )
        return;

    level endon( "player_exited_bathroom" );
    level endon( "leaving_bathroom_vol2" );
    level._id_AB6B = -1;
    var_0 = getentarray( "bathroom_enemy_volume", "targetname" );
    var_0 = maps\_utility::array_index_by_script_index( var_0 );

    foreach ( var_2 in var_0 )
        var_2._id_C407 = getent( var_2.target, "targetname" );

    for (;;)
    {
        var_4 = getaiarray( "axis" );

        for ( var_5 = 0; var_5 < var_0.size; var_5++ )
        {
            var_2 = var_0[var_5];

            if ( var_2 _id_C91E( var_4 ) )
            {
                if ( var_2.script_index != level._id_AB6B )
                    level._id_AB6B = var_2.script_index;

                var_2._id_C407 maps\_utility::activate_trigger();
                wait 1;
                break;
            }
            else
                wait 0.1;
        }
    }
}

_id_C91E( var_0 )
{
    var_1 = isdefined( self.script_parameters );

    foreach ( var_3 in var_0 )
    {
        if ( !isalive( var_3 ) )
            continue;

        if ( var_3 maps\_utility::doinglongdeath() )
            continue;

        if ( var_1 )
        {
            if ( !issubstr( var_3.classname, self.script_parameters ) )
                continue;
        }

        if ( var_3 istouching( self ) )
            return 1;
    }

    return 0;
}

_id_C379()
{
    level._id_C8AF = undefined;
    maps\_utility::array_spawn_targetname( "cellblock_armory_first_wave_spawner" );
    wait 3;
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2.disablebulletwhizbyreaction = 1;
        var_2 maps\_utility::disable_dontevershoot();
    }
}

_id_CE6E()
{
    maps\_utility::array_spawn_targetname( "cellblock_armory_second_wave_spawner" );
    var_0 = getentarray( "cellblock_armory_attacker_spawner", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_B75C()
{
    level._id_ACE4 = [];
    var_0 = getaiarray();

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_B89C ) )
            continue;

        var_2 thread _id_C984();
        level._id_ACE4[level._id_ACE4.size] = var_2;
    }
}

_id_CF6A()
{
    if ( !isdefined( self._id_B89C ) )
        return;

    if ( self == level._id_D13B )
    {
        var_0 = getent( "node_armory_scriptedevent", "targetname" );
        var_0 maps\_anim::anim_reach_solo( self, "riotshield" );
        var_0 notify( "shield_anim" );
        var_0 maps\_anim::anim_single_solo( self, "riotshield" );
        maps\_utility::enable_ai_color();
    }
    else
    {
        level waittill( "shield_dialog" );
        wait 1.5;
    }

    thread _id_C984();
    level._id_ACE4[level._id_ACE4.size] = self;
}

_id_CBA4()
{
    if ( common_scripts\utility::flag( "cellblock_first_wave" ) )
        return;

    level endon( "cellblock_first_wave" );
    var_0 = spawnstruct();
    var_0 maps\_utility::delaythread( 35, maps\_utility::send_notify, "stop" );
    var_0 endon( "stop" );
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
        var_3 maps\_utility::disable_long_death();

    for (;;)
    {
        var_1 = getaiarray( "axis" );

        if ( var_1.size <= 2 )
            return;

        wait 0.05;
    }
}

_id_B3EB()
{
    var_0 = [];
    var_0[var_0.size] = "gulag_cmt_pickupone";
    var_0[var_0.size] = "gulag_cmt_riotshield";
    var_1 = 0;

    for (;;)
    {
        if ( maps\_utility::player_has_weapon( "riotshield" ) )
            return;

        var_2 = var_0[var_1];
        var_1++;
        level._id_D13B thread maps\_utility::dialogue_queue( var_2 );

        if ( var_1 >= var_0.size )
            return;

        var_3 = randomfloatrange( 4, 5 );
        wait(var_3);
    }
}

_id_C745()
{
    if ( !isalive( level.player ) )
        return;

    if ( !isalive( level._id_D13B ) )
        return;

    level._id_D13B endon( "death" );
    var_0 = [];
    var_0[0] = "gulag_cmt_roach";
    var_0[1] = "gulag_cmt_roachisdown";
    level.player waittill( "death" );
    var_1 = common_scripts\utility::random( var_0 );
    level._id_D13B maps\_utility::function_stack( maps\_utility::_wait, 0.4 );
    level._id_D13B thread maps\_utility::dialogue_queue( var_1 );
    level._id_D13B maps\_utility::function_stack( maps\_utility::_wait, 5000 );
}

_id_B1E9()
{
    common_scripts\utility::flag_init( "player_learned_melee_bash" );
    notifyoncommand( "player_did_melee", "+melee" );
    notifyoncommand( "player_did_melee", "+melee_breath" );
    notifyoncommand( "player_did_melee", "+melee_zoom" );
    thread _id_D1D4();

    for (;;)
    {
        level.player waittill( "player_did_melee" );

        if ( _id_C4CE( "riotshield" ) )
            common_scripts\utility::flag_set( "player_learned_melee_bash" );
    }
}

_id_D1D4()
{
    for (;;)
    {
        if ( _id_C4CE( "riotshield" ) )
        {
            var_0 = getaiarray( "axis" );

            foreach ( var_2 in var_0 )
            {
                if ( !isalive( var_2 ) )
                    continue;

                if ( distance( var_2.origin, level.player.origin ) < 250 )
                {
                    maps\_utility::display_hint( "riot_bash", undefined, undefined, undefined, undefined, 15 );
                    return;
                }

                wait 0.05;
            }
        }

        wait 0.05;
    }
}

_id_D312()
{
    if ( !_id_C4CE( "riotshield" ) )
        return 1;

    return common_scripts\utility::flag( "player_learned_melee_bash" );
}

_id_C4CE( var_0 )
{
    return level.player getcurrentweapon() == var_0;
}

_id_B918()
{
    wait 1;
    level.player allowads( 0 );
    wait 2.5;
    level.player allowads( 1 );
}

_id_D379()
{
    var_0 = getent( "throw_flash_trigger", "targetname" );
    var_1 = getnode( var_0.target, "targetname" );
    var_0 waittill( "trigger", var_2 );

    if ( !isalive( var_2 ) )
        return;

    var_2 endon( "death" );
    wait 2;

    for (;;)
    {
        var_3 = distance( var_2.origin, var_1.origin );

        if ( var_3 < 8 )
            break;

        if ( var_3 > 250 )
            return;

        wait 0.05;
    }

    var_4 = getaiarray( "axis" );
    var_5 = getent( "tunnel_pre_hallway_volume", "targetname" );

    if ( !var_5 _id_AE53( var_4 ) )
        return;

    if ( common_scripts\utility::flag( "dont_flash_me_pls" ) )
    {
        wait 1;
        level notify( "flashed_room" );
        return;
    }

    var_2.allowdeath = 1;
    var_6 = spawnstruct();
    var_6.origin = var_1.origin;
    var_6.angles = var_1.angles + ( 0.0, -90.0, 0.0 );
    var_7 = var_2.grenadeweapon;
    var_2.grenadeweapon = "flash_grenade";
    var_2.grenadeammo++;
    var_6 maps\_anim::anim_generic( var_2, "grenade_throw" );
    var_2.grenadeweapon = var_7;
    level notify( "flashed_room" );
}

_id_AE53( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( var_2 istouching( self ) )
            return 1;
    }

    return 0;
}

_id_BC48()
{
    self endon( "death" );

    if ( isdefined( self.node ) )
        self.node maps\_utility::script_delay();

    self.fixednode = 0;
    maps\_utility::anim_stopanimscripted();
    wait 2;
    self.fixednode = 1;
}

_id_AA55()
{
    if ( !getdvarint( "soap" ) )
        return;

    wait 2.7;
    var_0 = getent( "endlog_soap_spawner", "targetname" );
    var_0.spawn_functions = [];
    var_0.origin = ( 0.0, 0.0, 0.0 );
    var_0.count = 1;
    var_0.script_forcespawn = 1;
    var_1 = var_0 maps\_utility::spawn_ai();
    var_1 maps\_utility::gun_remove();
    var_1.animname = "old_soap";
    maps\_anim::anim_single_solo( var_1, "price_rescue" );
    var_1 delete();
}

no_grenades()
{
    self.grenadeammo = 0;
}

_id_ADAB( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2] ) )
            continue;

        var_3 = var_0[var_2];

        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {
            if ( !isdefined( var_0[var_4] ) )
                continue;

            var_5 = var_0[var_4];

            if ( var_3 == var_5 )
                continue;

            var_6 = distance( var_3, var_5 );

            if ( var_6 < var_1 )
                var_0[var_4] = undefined;
        }
    }

    return var_0;
}

_id_A8C5()
{
    var_0 = getentarray( "aud_pa_ext", "targetname" );
    var_1 = getentarray( "aud_pa_int", "targetname" );
    waittillframeend;

    switch ( level.start_point )
    {
        case "default":
        case "intro":
        case "approach":
            common_scripts\utility::flag_wait( "stab1_clear" );
            wait 3;
            _id_A865( "gulag_rpa_ext_1", var_0 );
            wait 8;
            _id_A865( "gulag_rpa_ext_2", var_0 );
            common_scripts\utility::flag_wait( "f15_gulag_explosion" );
            wait 12;
            _id_A865( "gulag_rpa_ext_3", var_0 );
        case "f15":
        case "unload":
            common_scripts\utility::flag_wait( "stop_rotating_around_gulag" );
            _id_A865( "gulag_rpa_ext_4", var_0 );
            wait 7;
            _id_A865( "gulag_rpa_ext_5", var_0 );
            common_scripts\utility::flag_wait( "player_lands" );
            wait 10;
            _id_A865( "gulag_rpa_ext_6", var_0 );
            wait 12;
            _id_A865( "gulag_rpa_ext_7", var_0 );
            wait 12;
            _id_A865( "gulag_rpa_ext_8", var_0 );
        case "control_room":
            common_scripts\utility::flag_wait( "postup_outside_gulag" );
            wait 5;
            _id_A865( "gulag_rpa_int_1", var_0 );
            common_scripts\utility::flag_wait( "cell_duty" );
            wait 4;
            _id_A865( "gulag_rpa_int_2", var_1 );
            wait 3;
            _id_A865( "gulag_rpa_int_3", var_1 );
            wait 10;
            _id_A865( "gulag_rpa_int_4", var_1 );
        case "armory":
            common_scripts\utility::flag_wait( "armory_attack_sounds" );
            _id_A865( "gulag_rpa_int_5", var_1 );
        case "run":
        case "cafe":
        case "evac":
        case "ending":
        case "rescue":
        case "rappel":
        case "tunnel":
        case "bathroom":
            break;
        default:
    }
}

_id_A865( var_0, var_1 )
{
    var_2 = level.player geteye();
    var_3 = 182358016;
    var_4 = 3;
    var_5 = sortbydistance( var_1, var_2 );
    var_6 = min( var_4, var_1.size );

    for ( var_7 = 0; var_7 < var_6; var_7++ )
    {
        var_8 = distancesquared( var_5[var_7].origin, var_2 ) / var_3;

        if ( var_7 != var_6 - 1 )
        {
            var_5[var_7] maps\_utility::delaythread( var_8, maps\_utility::play_sound_on_entity, var_0 );
            continue;
        }

        wait(var_8);
        var_5[var_7] maps\_utility::play_sound_on_entity( var_0 );
    }
}

_id_AFF9()
{
    self.spawn_time = gettime();
}

_id_BDDC()
{
    common_scripts\utility::flag_wait( "player_nears_cell_door1" );
    maps\_utility::activate_trigger_with_targetname( "first_cell_postup" );
}

_id_AE9B( var_0 )
{
    if ( isalive( level._id_B8D7 ) )
    {
        level._id_B8D7 maps\_utility::dialogue_queue( var_0 + "_ghost" );
        return;
    }

    maps\_utility::radio_dialogue( var_0 );
}

_id_C868( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3.lights_array = getentarray( var_1, "script_noteworthy" );
    var_4 = getentarray( var_0, "targetname" );
    common_scripts\utility::array_thread( var_4, ::_id_D48E, var_3, var_2 );

    if ( var_0 == "shower_hanging_lamp" )
        thread _id_C4BC( var_4 );
}

_id_D48E( var_0, var_1 )
{
    self._id_B9B7 = undefined;

    if ( self.model == "h2_gulag_hanging_light_on_soft" || self.model == "h2_gulag_hanging_light_short_01_on_soft" )
        self._id_B9B7 = level._effect["spotlight_hanged_soft"];
    else if ( self.model == "h2_gulag_hanging_light_on" || self.model == "h2_gulag_hanging_light_short_01_on" )
        self._id_B9B7 = level._effect["spotlight_hanged"];

    if ( isdefined( self._id_B9B7 ) && !isdefined( self.script_parameters ) )
    {
        playfxontag( self._id_B9B7, self, "tag_fx" );
        thread _id_B7BC( var_0 );

        if ( self.targetname == "cafeteria_hanging_lamp" )
            thread _id_D238();
    }

    self.animname = "hanging_light";
    maps\_utility::assign_animtree();
    self.rate = randomfloatrange( 1.5, 3 );

    if ( isdefined( var_1 ) && isdefined( self.script_noteworthy ) )
    {
        var_2 = maps\_utility::getanim( self.script_noteworthy );
        self _meth_83D4( var_2, self.rate );
        maps\_anim::anim_single_solo( self, self.script_noteworthy );
    }

    thread _id_B539();
}

_id_B7BC( var_0 )
{
    var_1 = self gettagorigin( "tag_fx" );
    self.light = common_scripts\utility::getclosest( var_1, var_0.lights_array );
    var_0.lights_array = common_scripts\utility::array_remove( var_0.lights_array, self.light );
    var_2 = spawn( "script_origin", self.light.origin );
    var_2 linkto( self, "tag_fx" );

    for (;;)
    {
        self.light moveto( var_2.origin, 0.1 );
        var_3 = self gettagangles( "tag_fx" );
        self.light.angles = var_3;
        wait 0.1;
    }
}

_id_B539()
{
    for (;;)
    {
        self notify( "idle_loop_stop" );
        waitframe();
        var_0 = common_scripts\utility::ter_op( self.targetname == "cafeteria_hanging_lamp", "hanging_light_loop_cafeteria", "hanging_light_loop" );
        var_1 = maps\_utility::getanim( var_0 )[0];
        self _meth_83D4( var_1, self.rate );
        thread maps\_anim::anim_loop_solo( self, var_0, "idle_loop_stop" );
        self waittill( "idle_loop_restart" );
    }
}

_id_C4BC( var_0 )
{
    common_scripts\utility::flag_wait( "shower_balcony_spawned" );
    var_1 = [ "hanging_light_impact_1", "hanging_light_impact_2", "hanging_light_impact_3", "hanging_light_impact_4" ];
    var_2 = getentarray( "lamp_trigger", "targetname" );

    foreach ( var_4 in var_2 )
    {
        var_4._id_B018 = common_scripts\utility::getclosest( var_4.origin, var_0, 5000 );
        var_4 thread _id_C5D8( var_1 );
    }
}

_id_D5AD( var_0 )
{
    self notify( "idle_loop_stop" );
    waitframe();
    var_1 = maps\_utility::getanim( var_0 );
    playfxontag( level._effect["metalhit_tag_gulag"], self, "Tag_hit_fx" );
    thread maps\_utility::play_sound_on_tag( "scn_gulag_lamp_sway", "Tag_hit_fx" );
    maps\_anim::anim_single_solo( self, var_0 );
    self notify( "idle_loop_restart" );
}

_id_C5D8( var_0 )
{
    level endon( "player_exited_bathroom" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );
        var_6 = randomintrange( 1, 100 );

        if ( var_5 == "MOD_GRENADE" || var_5 == "MOD_GRENADE_SPLASH" )
        {
            self._id_B018 _id_D5AD( common_scripts\utility::random( var_0 ) );
            continue;
        }

        if ( var_2 != level.player && var_6 <= 30 )
        {
            self._id_B018 _id_D5AD( common_scripts\utility::random( var_0 ) );
            continue;
        }

        continue;
    }
}

_id_D238()
{
    common_scripts\utility::flag_wait( "cafeteria_lights_off" );

    if ( isdefined( self._id_B9B7 ) )
        killfxontag( self._id_B9B7, self, "tag_fx" );

    if ( isdefined( self.light ) )
    {
        self.light setlightintensity( 1 );
        self.light setlightradius( 12 );
        self.light setlightfovrange( 6, 0 );
    }
}

_id_C85B( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_A83A );
}

_id_A83A( var_0 )
{
    self.animname = self.model;
    maps\_utility::assign_animtree();
    var_1 = randomfloatrange( 0.8, 1.5 );

    if ( isdefined( self.script_noteworthy ) )
    {
        var_2 = maps\_utility::getanim( "breach" );
        self _meth_83D4( var_2, var_1 );
        maps\_anim::anim_single_solo( self, "breach" );
    }

    var_2 = maps\_utility::getanim( "idle" )[0];
    self _meth_83D4( var_2, var_1 );
    thread maps\_anim::anim_loop_solo( self, "idle", "stop_loop" );

    if ( maps\_utility::hasanim( "idle_strong" ) )
    {
        level waittill( "explosion" );
        self notify( "stop_loop" );
        waitframe();
        var_2 = maps\_utility::getanim( "idle_strong" )[0];
        self _meth_83D4( var_2, var_1 );
        thread maps\_anim::anim_loop_solo( self, "idle_strong" );
    }
}

_id_CBAD()
{
    var_0 = [ "light_1s", "light_2s", "light_3s" ];

    for (;;)
    {
        while ( common_scripts\utility::flag( "bombardment_immersion" ) )
        {
            var_1 = randomintrange( 6, 14 );
            wait(var_1);
            _id_C13B( common_scripts\utility::random( var_0 ) );
        }

        wait 0.5;
    }
}

_id_C13B( var_0 )
{
    if ( !common_scripts\utility::flag( "bombardment_immersion" ) )
        return;

    level.player playsound( "amb_bomb_explo_shakes" );
    earthquake( 0.1, 2, level.player.origin, 5000 );
    common_scripts\_exploder::exploder( "2501" );
    level.player playrumblelooponentity( var_0 );
}

_id_AB63()
{
    wait 6.2;
    var_0 = getent( "overlook_explosion_guy", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0 maps\_utility::spawn_ai( 1 );
    waitframe();
    var_1.ignoreme = 1;
    var_1 thread maps\_utility::ignoreallenemies( 1 );
    var_1 maps\_utility::gun_remove();
    var_1.animname = "guy";
    var_1 thread maps\_anim::anim_single_solo( var_1, "explosion" );

    if ( isdefined( var_1 ) )
        var_1 maps\_utility::play_sound_on_entity( "scn_bhd_guy" );

    wait(getanimlength( var_1 maps\_utility::getanim( "explosion" ) ) - 0.2);
    var_1 kill();
}

_id_A9EE()
{
    var_0 = maps\_utility::getentwithflag( "trigger_armory_scriptedevent" );
    var_1 = getent( "node_armory_scriptedevent", "targetname" );
    common_scripts\utility::flag_wait( "trigger_armory_scriptedevent" );
    level._id_C7D7 = [];

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );

        if ( var_2 != level.player && !common_scripts\utility::array_contains( level._id_C7D7, var_2 ) )
        {
            var_2 thread _id_C2DA( var_1 );
            level._id_C7D7 = common_scripts\utility::array_add( level._id_C7D7, var_2 );
        }

        if ( level._id_C7D7.size == 2 )
        {
            var_0 delete();
            break;
        }
    }
}

_id_C2DA( var_0 )
{
    self endon( "death" );

    if ( self == level._id_D13B )
    {
        var_1 = "soap";
        var_2 = "cyan";
    }
    else
    {
        var_1 = "guy";
        var_2 = "g";
        level._id_D1BE = self;
        self.animname = "generic";
    }

    maps\_utility::set_force_color( var_2 );
    var_0 maps\_anim::anim_reach_solo( self, "armory_jumpdown" );
    maps\_utility::enable_ai_color();
    var_0 maps\_anim::anim_single_solo( self, "armory_jumpdown" );
    var_0 maps\_anim::anim_single_solo( self, "armory_wait_in" );
    common_scripts\utility::flag_set( var_1 + "_is_waiting" );
    var_0 thread maps\_anim::anim_loop_solo( self, "armory_wait_idle", "stop_waiting" );
    common_scripts\utility::flag_wait( "player_in_armory" );

    if ( self == level._id_D13B )
    {
        if ( isdefined( level._id_D1BE ) && isalive( level._id_D1BE ) )
            common_scripts\utility::flag_wait( "guy_is_waiting" );
        else
            common_scripts\utility::flag_set( "too_late" );
    }
    else
        common_scripts\utility::flag_wait( "soap_is_waiting" );

    var_0 notify( "stop_waiting" );

    if ( self != level._id_D13B && common_scripts\utility::flag( "too_late" ) )
        return;
    else if ( self == level._id_D13B && isdefined( level._id_B8D7 ) )
        thread _id_C417( "voiceover" );

    common_scripts\utility::flag_set( "playing_armory_anim" );
    var_0 maps\_anim::anim_single_solo( self, "armory_wait_out" );
}

_id_BE46()
{
    var_0 = getent( "soap_riotshield", "targetname" );
    var_0.animname = "shield";
    var_0 maps\_anim::setanimtree();
    var_1 = getent( "node_armory_scriptedevent", "targetname" );
    var_1 maps\_anim::anim_first_frame_solo( var_0, "shield" );
    var_2 = getent( "guy_riotshield", "targetname" );
    var_2.animname = "shield";
    var_2 maps\_anim::setanimtree();
    var_1 maps\_anim::anim_first_frame_solo( var_2, "guy_shield" );
    var_1 waittill( "shield_anim" );
    var_1 maps\_anim::anim_single_solo( var_0, "shield" );
    var_0 delete();
}

_id_C48B( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    foreach ( var_4 in var_2 )
    {
        var_5 = common_scripts\utility::spawn_tag_origin();
        var_5.origin = var_4.origin;
        var_5.angles = var_4.angles;
        var_5 linkto( var_4 );
        playfxontag( common_scripts\utility::getfx( var_1 ), var_5, "tag_origin" );
        var_4 thread _id_BD91( anglestoup( var_4.angles ) );
    }
}

_id_BD91( var_0 )
{
    var_1 = 18;

    for (;;)
    {
        var_2 = anglestoaxis( self.angles );
        var_2["forward"] = rotatepointaroundvector( var_0, var_2["forward"], var_1 );
        var_2["right"] = rotatepointaroundvector( var_0, var_2["right"], var_1 );
        var_2["up"] = vectorcross( var_2["forward"], var_2["right"] );
        self.angles = axistoangles( var_2["forward"], var_2["right"], var_2["up"] );
        wait 0.05;
    }
}

_id_C641()
{
    var_0 = getent( "ai_01", "script_noteworthy" );
    var_1 = getent( "ai_02", "script_noteworthy" );
    var_2 = getent( "ai_11", "script_noteworthy" );
    var_3 = getent( "ai_12", "script_noteworthy" );
    var_4 = getent( "ai_21", "script_noteworthy" );
    var_5 = getent( "ai_22", "script_noteworthy" );
    var_6 = getent( "ai_31", "script_noteworthy" );
    var_7 = getent( "ai_32", "script_noteworthy" );
    var_8 = common_scripts\utility::getstruct( "wall_sequence_blast_1", "script_noteworthy" );
    var_9 = var_0.origin;
    var_10 = var_0.angles;
    var_11 = var_1.origin;
    var_12 = var_1.angles;
    var_13 = var_2.origin;
    var_14 = var_2.angles;
    var_15 = var_3.origin;
    var_16 = var_3.angles;
    var_17 = var_4.origin;
    var_18 = var_4.angles;
    var_19 = var_5.origin;
    var_20 = var_5.angles;
    var_21 = var_6.origin;
    var_22 = var_6.angles;
    var_23 = var_7.origin;
    var_24 = var_7.angles;
    var_25 = [ var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 ];

    foreach ( var_27 in var_25 )
    {
        var_27.animname = "generic";
        var_27.ignoreall = 1;
        var_27.allowdeath = 1;
        var_27.ignoreme = 1;
    }

    var_0 thread maps\_anim::anim_first_frame_solo( var_0, "ai_running_wall_01" );
    var_1 thread maps\_anim::anim_first_frame_solo( var_1, "ai_running_wall_02" );
    var_2 thread maps\_anim::anim_first_frame_solo( var_2, "ai_running_wall_11" );
    var_3 thread maps\_anim::anim_first_frame_solo( var_3, "ai_running_wall_12" );
    var_4 thread maps\_anim::anim_first_frame_solo( var_4, "ai_running_wall_21" );
    var_5 thread maps\_anim::anim_first_frame_solo( var_5, "ai_running_wall_22" );
    var_6 thread maps\_anim::anim_first_frame_solo( var_6, "ai_running_wall_31" );
    var_7 thread maps\_anim::anim_first_frame_solo( var_7, "ai_running_wall_32" );
    common_scripts\utility::flag_wait( "display_introscreen_text" );
    wait 14;
    var_0 forceteleport( var_9, var_10 );
    var_1 forceteleport( var_11, var_12 );
    var_0 thread _id_B908( var_0, "ai_running_wall_01" );
    var_1 thread _id_B908( var_1, "ai_running_wall_02" );
    wait 4;
    var_2 forceteleport( var_13, var_14 );
    var_3 forceteleport( var_15, var_16 );
    var_2 thread _id_B908( var_2, "ai_running_wall_11" );
    var_3 thread _id_B908( var_3, "ai_running_wall_12" );
    common_scripts\utility::flag_wait( "stab1_shift" );
    var_4 forceteleport( var_17, var_18 );
    var_5 forceteleport( var_19, var_20 );
    var_4 thread _id_B908( var_4, "ai_running_wall_21" );
    var_5 thread _id_B908( var_5, "ai_running_wall_22" );
    common_scripts\utility::flag_wait( "castle_tower_event" );
    wait 2;
    var_6 forceteleport( var_21, var_22 );
    var_7 forceteleport( var_23, var_24 );
    var_6 thread maps\_anim::anim_single_solo( var_6, "ai_running_wall_31" );
    var_7 thread maps\_anim::anim_single_solo( var_7, "ai_running_wall_32" );
    common_scripts\utility::flag_wait( "f15_gulag_attack" );
    wait 1.5;
    var_6 thread _id_D4F2( var_6, var_8, 4000 );
    var_7 thread _id_D4F2( var_7, var_8, 4000 );
}

_id_B908( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    maps\_anim::anim_single_solo( var_0, var_1, var_2, var_3, var_4, var_5 );

    if ( isalive( var_0 ) )
        var_0 delete();
    else
    {
        wait 30;

        if ( isdefined( var_0 ) && maps\_anim::_id_D340( var_0 ) && !_func_2A5( var_0 ) )
            var_0 delete();
    }
}

_id_D4F2( var_0, var_1, var_2, var_3 )
{
    if ( isalive( var_0 ) )
    {
        if ( !isdefined( var_2 ) )
            var_2 = distance( var_0.origin, var_1.origin ) + 5000;

        if ( !isdefined( var_3 ) )
            var_3 = 1;

        var_4 = vectornormalize( var_0.origin - var_1.origin );
        var_5 = var_2 - distance( var_0.origin, var_1.origin );
        var_5 *= var_3;
        var_5 = max( var_5, 1 );
        var_6 = var_0.origin + var_4 * var_5;
        var_0 startragdollfromimpact( "torso_lower", var_6 );
        var_0 kill();
    }
}

ambient_snowing()
{
    common_scripts\utility::flag_wait( "player_lands" );
    common_scripts\_exploder::exploder( "ambient_snowing" );
}

_id_D2BC()
{
    var_0 = getentarray( "rat_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_D189 );
}

_id_D189()
{
    self waittill( "trigger" );
    common_scripts\_exploder::exploder( 2601 );
}

_id_C122()
{
    var_0 = getentarray( "animated_rat", "targetname" );
    common_scripts\utility::flag_wait( "player_lands" );

    foreach ( var_2 in var_0 )
    {
        var_3 = spawn( "script_model", var_2.origin );
        var_3 setmodel( var_2.model );
        var_3.angles = var_2.angles;
        var_3.animation = var_2.animation;
        var_3.script_noteworthy = var_2.script_noteworthy;
        var_3 thread _id_C78E();
    }
}

_id_C78E()
{
    if ( !isdefined( self.script_noteworthy ) )
        return;

    switch ( self.script_noteworthy )
    {
        case "frantic":
            thread _id_C206( "frantic_idle", [ "death_02", "death_03" ] );
            break;
        case "run":
            thread _id_C70B( "run", [ "death_02", "death_03" ] );
            break;
        default:
    }
}

_id_C206( var_0, var_1 )
{
    self.animname = "rat_animations";
    maps\_utility::assign_animtree();
    self setcandamage( 1 );
    self.health = 1;
    maps\_anim::anim_loop_solo( self, var_0 );
    self waittill( "damage" );
    playfx( common_scripts\utility::getfx( "rat_bleed" ), self.origin, ( 0.0, 0.0, 1.0 ) );
    maps\_anim::anim_single_solo( self, common_scripts\utility::random( var_1 ) );
}

_id_C70B( var_0, var_1 )
{
    var_2 = getent( "rat_trigger", "targetname" );
    var_2 waittill( "trigger" );
    self.animname = "rat_animations";
    maps\_utility::assign_animtree();
    self setcandamage( 1 );
    self.health = 1;
    maps\_anim::anim_loop_solo( self, var_0 );
    self waittill( "damage" );
    playfx( common_scripts\utility::getfx( "rat_bleed" ), self.origin, ( 0.0, 0.0, 1.0 ) );
    maps\_anim::anim_single_solo( self, common_scripts\utility::random( var_1 ) );
}

_id_C417( var_0 )
{
    level._id_D4FF notify( "ghost_stop_idle" );
    level._id_B8D7 stopanimscripted();
    waitframe();
    level._id_B8D7 maps\_anim::anim_single_solo( level._id_B8D7, var_0 );
    thread _id_C56C();
}

_id_C56C()
{
    level._id_B8D7 endon( "death" );
    level._id_D4FF endon( "ghost_stop_idle" );

    for (;;)
    {
        level._id_D4FF maps\_anim::anim_single_solo( level._id_B8D7, "laptop_idle_6" );
        level._id_D4FF maps\_anim::anim_single_solo( level._id_B8D7, "laptop_idle_" + randomint( 6 ) );
    }
}

_id_CCE4()
{
    wait 0.5;
    level._id_C438 = maps\_utility::spawn_anim_model( "player_rappel" );
    level._id_C438.origin = level._id_CB62 gettagorigin( "tag_guy2" );
    level._id_C438.angles = level._id_CB62 gettagangles( "tag_guy2" );
    level._id_C438 linkto( level._id_CB62, "tag_guy2" );
    level.player playerlinktodelta( level._id_C438, "tag_player", 1 );
    level._id_CB62 thread _id_CA74();
    level._id_CB62 thread maps\_anim::anim_single_solo( level._id_D13B, "soap_intro_start", "tag_detach_left" );
    _id_CD59( "player_intro_start" );
}

_id_C4C2()
{
    level._id_CB62 endon( "death" );
    level._id_CB62 maps\_anim::anim_single_solo( level._id_D13B, "soap_intro_dialog1", "tag_detach_left" );
    level._id_CB62 notify( "stop_loop" );
    level._id_CB62 maps\_anim::anim_loop_solo( level._id_D13B, "soap_intro_2nd_tower", "stop_loop", "tag_detach_left" );
}

_id_CA74()
{
    level._id_CB62 endon( "death" );
    self waittill( "soap_intro_start" );
    level._id_CB62 maps\_anim::anim_loop_solo( level._id_D13B, "soap_intro_1st_tower", "stop_loop", "tag_detach_left" );
}

_id_B615()
{
    level._id_CB62 thread maps\_anim::anim_single_solo( level._id_D13B, "soap_intro_dialog2", "tag_detach_left" );
    level._id_CB62 notify( "stop_loop" );
}

_id_AAB2()
{
    _id_CD59( "player_dismount_start" );
    _id_D313();
}

_id_D313()
{
    if ( isdefined( level._id_C438 ) )
    {
        level.player unlink();
        level._id_C438 delete();
    }

    level.player enableweapons();
}

_id_CD59( var_0 )
{
    level._id_CB62 maps\_anim::anim_single_solo( level._id_C438, var_0, "tag_guy2" );
}

_id_A841()
{
    common_scripts\utility::flag_wait( "activate_guns" );
    var_0 = getent( self.target, "targetname" );
    var_1 = var_0 maps\_utility::spawn_ai();
    var_1.animname = "gunner";
    waitframe();
    var_2 = maps\_utility::spawn_anim_model( "turret", self.origin );
    var_2.angles = self.angles;
    self delete();
    var_1 linkto( var_2, "tag_driver" );
    var_1 thread _id_C6E2( var_2 );
    var_2 endon( "stop_shooting" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "kill_guns" ) )
            break;

        var_3 = "fire_a";

        if ( common_scripts\utility::cointoss() )
            var_3 = "fire_b";

        var_2 thread maps\_anim::anim_single_solo( var_1, var_3, "tag_driver" );
        var_2 maps\_anim::anim_single_solo( var_2, var_3 );
    }

    var_1 dodamage( 1, var_1.origin );
}

_id_B854()
{
    self notify( "stop_shooting" );
    maps\_utility::anim_stopanimscripted();
    self playrumbleonentity();
    self setanim( level.scr_anim[self.animname]["idle"], 1.0, 0, 1 );
}

_id_C6E2( var_0 )
{
    self waittill( "damage" );
    self.ignoreme = 1;
    var_0 _id_B854();
    var_0 maps\_anim::anim_single_solo( self, "gunnerdeath", "tag_driver" );
    var_0 thread maps\_anim::anim_loop_solo( self, "death_idle", "stop_death_loop", "tag_driver" );
}

_id_BA55( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "zpu_muzzle" ), var_0, "tag_flash" );
    playfxontag( common_scripts\utility::getfx( "zpu_muzzle" ), var_0, "tag_flash2" );
    var_0 thread maps\_utility::play_sound_on_tag( "h1_zpu_fire", "tag_flash" );
}

_id_B784( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "zpu_muzzle" ), var_0, "tag_flash1" );
    playfxontag( common_scripts\utility::getfx( "zpu_muzzle" ), var_0, "tag_flash3" );
}

_id_BEE3()
{
    var_0 = getent( "worm_spawner", "targetname" );
    var_0.count = 1;
    var_1 = var_0 maps\_utility::spawn_ai();
    var_1.ignoreme = 1;
}

_id_B535()
{
    var_0 = level._id_CB62;
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_2 = ( 20.0, 110.0, -40.0 );
    var_3 = ( 15.0, -90.0, 0.0 );
    var_1 linkto( var_0, "tag_origin", var_2, var_3 );
    playfxontag( level._effect["amb_snow_heli_hack"], var_0, "tag_deathfx" );
    playfxontag( level._effect["aircraft_omnilight_cockpit_gulag"], var_0, "tag_origin" );
    playfxontag( level._effect["aircraft_spotlight_cockpit_gulag"], var_1, "tag_origin" );
    common_scripts\utility::flag_wait( "control_tower_event" );
    killfxontag( level._effect["aircraft_omnilight_cockpit_gulag"], var_0, "tag_origin" );
    playfxontag( level._effect["aircraft_omnilight_cockpit_gulag_out"], var_0, "tag_origin" );
    killfxontag( level._effect["aircraft_spotlight_cockpit_gulag"], var_1, "tag_origin" );
    playfxontag( level._effect["aircraft_spotlight_cockpit_gulag_out"], var_1, "tag_origin" );
    wait 2.5;
    playfxontag( level._effect["aircraft_spotlight_cockpit_gulag_2"], var_1, "tag_origin" );
    common_scripts\utility::flag_wait( "kill_heli_light_fx" );
    killfxontag( level._effect["aircraft_spotlight_cockpit_gulag_2"], var_1, "tag_origin" );
    playfxontag( level._effect["aircraft_spotlight_cockpit_gulag_2_out"], var_1, "tag_origin" );
    common_scripts\utility::flag_wait( "access_control_room" );
    stopfxontag( level._effect["amb_snow_heli_hack"], var_0, "tag_deathfx" );
}

_id_C4D0( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_0 );
    common_scripts\_exploder::exploder( var_1 );
}

_id_B525( var_0 )
{
    var_1 = [];
    var_1["aug_reflex"] = "ak47_arctic_reflex";
    var_1["aug_scope"] = "ak47_arctic_acog";
    var_1["tavor_reflex"] = "famas_arctic_reflex";
    var_1["tavor_woodland_eotech"] = "famas_arctic_reflex";
    var_1["pp2000"] = "beretta";
    var_1["striker"] = "spas12";
    var_1["striker_reflex"] = "spas12_reflex";
    var_1["striker_woodland"] = "spas12_arctic";
    var_1["striker_woodland_reflex"] = "spas12_arctic_refex";
    var_1["ump45"] = "kriss";
    var_1["ump45_arctic"] = "kriss";
    var_1["ump45_reflex"] = "p90_reflex";
    var_1["ump45_eotech"] = "kriss_reflex";
    var_1["ump45_acog"] = "kriss_reflex";
    var_1["kriss_eotech"] = "kriss_reflex";
    var_1["mg4"] = "rpd";
    var_1["mg4_arctic"] = "rpd";

    foreach ( var_4, var_3 in var_1 )
    {
        if ( var_4 == var_0 )
            return var_3;
    }

    return var_0;
}

_id_C2DC( var_0, var_1, var_2 )
{
    if ( getdvar( "limitedmodeStart" ) != "" )
    {
        setdvar( "start", getdvar( "limitedmodeStart" ) );
        setdvar( "limitedmodeStart", "" );
        return;
    }

    common_scripts\utility::flag_wait( var_0 );

    if ( getdvar( "start" ) != var_1 )
    {
        setsaveddvar( "compass", 0 );
        setsaveddvar( "ammoCounterHide", 1 );
        setsaveddvar( "hud_showStance", 0 );
        setsaveddvar( "g_friendlyNameDist", 0 );

        if ( level.player getlocalplayerprofiledata( "subtitles" ) != 0 )
        {

        }

        level.player enableinvulnerability();
        level.player takeallweapons();
        var_3 = newhudelem();
        var_3.x = 0;
        var_3.y = 0;
        var_3 setshader( "black", 640, 480 );
        var_3.alignx = "left";
        var_3.aligny = "top";
        var_3.horzalign = "fullscreen";
        var_3.vertalign = "fullscreen";
        var_3.alpha = 0;
        var_3.foreground = 1;
        soundscripts\_snd::snd_message( "start_limited_mode_fade_out", var_2 / 2 );
        var_3 fadeovertime( var_2 / 2 );
        var_3.alpha = 1;
        wait(var_2 / 2);
        maps\_introscreen::_id_CD71( "In the interest of time..." );
        wait(var_2 / 2);
        setdynamicdvar( "limitedmodeStart", level.start_point );
        setdvar( "start", var_1 );
        fast_restart();
    }
}

_id_CF6E()
{
    var_0 = getent( "radiotower_intro_sequence", "targetname" );
    playfxontag( common_scripts\utility::getfx( "radio_tower_red_static_glow" ), var_0, "tag_fx" );
    wait 25;
    var_0.animname = "me_transmitting_tower";
    var_0 maps\_anim::setanimtree();
    var_0 thread maps\_anim::anim_single_solo( var_0, "radiotower_fall" );
    common_scripts\_exploder::exploder( "5001" );
    wait 3;
    level.player maps\_utility::_id_BF21( "gulag_flight" );
}

_id_B85F()
{
    var_0 = getent( "exploding_wall_origin", "targetname" );
    var_1 = spawn( "script_model", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 setmodel( "h2_gulag_cellblock2_intact_wall_01" );
    level waittill( "hall_attack" );
    var_1 delete();
    var_2 = getent( "cb2_stagelight", "targetname" );
    var_2 notify( "staging_on" );
}

_id_AA59()
{
    var_0 = getent( "exploding_canister", "script_noteworthy" );
    var_0.exploded = undefined;
    var_0.exploding = undefined;
    var_1 = getent( "exploding_canister2", "script_noteworthy" );
    var_1.exploded = undefined;
    var_1.exploding = undefined;
    var_2 = [ var_0, var_1 ];
    common_scripts\utility::flag_wait( "stop_shooting_right_side" );

    foreach ( var_4 in var_2 )
    {
        if ( !isdefined( var_4.exploding ) || !isdefined( var_4.exploded ) )
        {
            wait 1;
            var_4 common_scripts\_destructible::_id_B7AD( 0 );
            var_4 maps\_utility::destructible_force_explosion();
            return;
        }
    }
}

_id_CF13( var_0, var_1 )
{
    if ( var_1 )
    {
        foreach ( var_3 in var_0 )
        {
            if ( !isalive( var_3 ) )
                continue;

            var_3.ignoresuppression = 1;
            var_3.a.disablepain = 1;
            var_3.allowpain = 0;
            var_3 _meth_8579( 1 );
        }
    }
    else
    {
        foreach ( var_3 in var_0 )
        {
            if ( !isalive( var_3 ) )
                continue;

            var_3.ignoresuppression = 0;
            var_3.a.disablepain = 0;
            var_3.allowpain = 1;
            var_3 _meth_8579( 0 );
        }
    }
}

_id_BCA2( var_0, var_1 )
{
    var_0 maps\_utility::assign_animtree( "rescue_chair" );
    var_0.animname = "rescue_chair";
    var_2 = var_0 maps\_utility::getanim( "rescuea_chair" );
    var_3 = getanimlength( var_2 );
    wait 0.5;
    var_1 maps\_anim::anim_single_solo( var_0, "rescuea_chair" );
    wait(var_3 + 0.5);
    var_1 maps\_anim::anim_single_solo( var_0, "rescueb_chair" );
}

_id_C3FA()
{
    wait 8;
    var_0 = randomfloatrange( 2, 5 );
    wait(var_0);

    if ( isdefined( self ) )
    {
        if ( isalive( self ) )
        {
            _id_B190::_id_D55F( self );
            self kill();
        }

        wait 15;

        if ( !_func_2A5( self ) )
            self delete();
    }
}

_id_B887()
{
    var_0 = getent( "landslide_iceberg", "targetname" );
    var_0.animname = var_0.targetname;
    var_0 maps\_anim::setanimtree();
    common_scripts\utility::flag_wait( "rockslide_event" );
    var_0 maps\_anim::anim_single_solo( var_0, "move" );
}

_id_C779( var_0 )
{
    self.animname = "hanging_light";
    maps\_utility::assign_animtree( "hanging_light" );
    var_0.animname = "hanging_light";
    var_0 maps\_utility::assign_animtree( "hanging_light" );
    self.rate = 2;
    var_0.rate = 2;
    var_0 hide();
    var_1 = getent( "bathroom_exploding_light_trigger", "targetname" );
    var_1._id_B018 = self;
    var_0 thread _id_B539();
    var_1._id_B018 thread _id_B539();
    var_2 = getent( "bathroom_light_trigger", "targetname" );
    var_2 waittill( "trigger" );
    var_3 = [ "hanging_light_impact_1", "hanging_light_impact_2", "hanging_light_impact_3", "hanging_light_impact_4" ];
    var_4 = common_scripts\utility::random( var_3 );
    playfxontag( level._effect["bullet_spark"], self, "tag_fx" );
    var_0 thread _id_D5AD( var_4 );
    var_1._id_B018 _id_D5AD( var_4 );
    thread maps\_utility::play_sound_on_tag( "bullet_large_metal_thin", "tag_fx" );
    waitframe();
    playfxontag( level._effect["sparks"], self, "tag_fx" );
    self notify( "start_flickering" );
    var_0 show();
}

_id_BA52()
{
    var_0 = common_scripts\utility::getstruct( "f15_blast_1", "script_noteworthy" );
    var_1 = getentarray( "exploding_ignore_spawner", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        var_4 = randomfloatrange( 1, 1.5 );
        _id_D4F2( var_3, var_0, 4000, var_4 );
    }
}

_id_D5B9()
{
    var_0 = getent( "aud_scn_gulag_explo_anticipation_ent", "targetname" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_gulag_explo_anticipation" );
    wait 0.6;
    self notify( "trigger" );
}

_id_D446()
{
    var_0 = getent( "radio_tower_cleanup", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getentarray( "animated_model", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 maps\_animatedmodels::_id_C8D8();
        var_4 = spawn( "script_model", var_3.origin );
        var_4.angles = var_3.angles;
        var_5 = getsubstr( var_3.model, 19, 22 );
        var_6 = "trq_tree_pine_snow_" + var_5 + "_02_static";
        var_4 setmodel( var_6 );
        var_3 delete();
    }

    var_8 = getent( "landslide_iceberg", "targetname" );
    var_8 delete();
}

_id_C26D()
{
    var_0 = [];
    var_0[var_0.size] = getent( "first_cell_moving_on", "targetname" );
    var_0[var_0.size] = getent( "mid_door_rambo", "targetname" );
    var_0[var_0.size] = getent( "third_cell_moving_on", "targetname" );
    var_0[var_0.size] = getent( "pre_armory_rambo", "targetname" );

    foreach ( var_3, var_2 in var_0 )
        var_2 thread _id_B6D0( var_3 );
}

_id_B6D0( var_0 )
{
    self endon( "i_must_end" + var_0 );
    self waittill( "trigger" );
    level notify( "i_must_end" + var_0 - 1 );
    var_1 = getaiarray( "allies" );
    maps\_utility::_id_D29A( var_1, 1 );
    wait 4;
    maps\_utility::_id_D29A( var_1, 0 );
}

_id_CB49( var_0 )
{
    wait 3;
    maps\_utility::activate_trigger_with_targetname( var_0 );
}

_id_A8E3()
{
    var_0 = getent( "set_dof_ads_cellblock", "targetname" );
    var_1 = getent( "clear_dof_ads_cellblock", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        maps\_utility::_id_C636( "0.5 12 2 2" );
        var_1 waittill( "trigger" );
        maps\_utility::_id_C636();
    }
}

_id_AD31()
{
    var_0 = getent( "flash_postup_distributor_trigger", "targetname" );
    var_1 = [];
    var_1[var_1.size] = getnode( "flash_spot_1", "script_noteworthy" );
    var_1[var_1.size] = getnode( "flash_spot_2", "script_noteworthy" );
    var_1[var_1.size] = getnode( "flash_spot_3", "script_noteworthy" );
    var_2 = [];

    for (;;)
    {
        var_0 waittill( "trigger", var_3 );

        if ( var_3 != level.player && !common_scripts\utility::array_contains( var_2, var_3 ) )
        {
            if ( !isdefined( var_3.node.targetname ) || var_3.node.targetname != "moving_to_tunnel" )
            {
                var_0 delete();
                return;
            }

            var_3 setgoalnode( var_1[var_2.size] );
            var_2 = common_scripts\utility::array_add( var_2, var_3 );

            if ( var_2.size == 3 )
            {
                var_0 delete();
                break;
            }
        }
    }
}

_id_CE74()
{
    var_0 = getent( "tarp_idle", "targetname" );
    var_0 maps\_utility::assign_animtree( "tarp" );
    var_1 = common_scripts\utility::getstruct( "idle_tarp_struct", "targetname" );
    var_1 thread maps\_anim::anim_loop_solo( var_0, "idle" );
    level waittill( "stop_tarp_idle" );
    var_0 stopanimscripted();
}

_id_CF1F()
{
    level.breach_groups[2].trigger common_scripts\utility::trigger_off_proc();
    level waittill( "activate_shower_breach" );
    level.breach_groups[2].trigger common_scripts\utility::trigger_on_proc();
}

_id_C9A7( var_0 )
{
    if ( common_scripts\utility::flag( "first_squad_spawned" ) )
        return;

    // var_1 = self.model;
    // var_2 = self.headmodel;
    // self setmodel( var_1 + "_gulag_intro" );

    // if ( common_scripts\utility::array_contains( var_0, var_2 + "_gulag_intro" ) )
    //     setheadmodel( var_2 + "_gulag_intro" );
    // else
    //     setheadmodel( common_scripts\utility::random( var_0 ) );
}

setheadmodel( var_0 )
{
    self detach( self.headmodel );
    self attach( var_0, "", 1 );
    self.headmodel = var_0;
}

_id_B33C()
{
    var_0 = getent( "armory_exit_volume", "targetname" );
    _id_CF13( level._id_ACE4, 1 );

    foreach ( var_2 in level._id_ACE4 )
        var_2 maps\_riotshield::riotshield_fastwalk_off();

    for (;;)
    {
        var_4 = var_0 maps\_utility::get_ai_touching_volume( "axis" );

        if ( var_4.size <= 0 || common_scripts\utility::flag( "out_of_armory" ) )
        {
            foreach ( var_6 in level._id_ACE4 )
            {
                if ( !isalive( var_6 ) )
                    continue;

                var_6 maps\_utility::set_favoriteenemy( undefined );
            }

            _id_CF13( level._id_ACE4, 0 );

            foreach ( var_2 in level._id_ACE4 )
            {
                var_2 maps\_riotshield::riotshield_fastwalk_on();
                var_2 allowedstances( "stand", "crouch" );
            }

            return;
        }

        foreach ( var_6 in level._id_ACE4 )
        {
            if ( !isalive( var_6 ) )
                continue;

            if ( !isdefined( var_6.favoriteenemy ) || !isalive( var_6.favoriteenemy ) )
                var_6 maps\_utility::set_favoriteenemy( common_scripts\utility::random( var_4 ) );
        }

        wait 0.5;
    }
}

_id_C876()
{
    var_0 = getaiarray( "allies" );
    wait 1;

    foreach ( var_2 in var_0 )
    {
        if ( var_2 maps\_utility::is_hero() )
            continue;

        if ( isdefined( var_2.magic_bullet_shield ) )
            var_2 maps\_utility::stop_magic_bullet_shield();

        var_2 delete();
    }
}

surprise()
{
    level endon( "cancel_surprise" );
    var_0 = getent( "surprise_tv", "script_noteworthy" );
    var_0 thread surprise_tv();
    common_scripts\utility::flag_wait( "player_nears_cell_door3" );
    surprise_damage_trigger();
    surprise_flag_touching();
    var_0 thread maps\_utility::play_sound_on_entity( "h2_zombie_easter_egg" );
    var_0.screen = spawn( "script_model", var_0.origin );
    var_0.screen.angles = var_0.angles;
    var_0.screen setmodel( "com_tv1_pho_zombie" );
    wait 3.3;
    var_0.screen delete();
}

surprise_tv()
{
    self waittill( "off" );
    level notify( "cancel_surprise" );

    if ( isdefined( self.screen ) )
        self.screen delete();
}

surprise_damage_trigger()
{
    level endon( "cancel_surprise" );
    var_0 = getent( "surprise_damage_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( var_5 == "MOD_GRENADE" || var_5 == "MOD_GRENADE_SPLASH" )
            break;
    }
}

surprise_flag_touching()
{
    level endon( "cancel_surprise" );
    var_0 = getent( "surprise_trigger", "targetname" );

    for (;;)
    {
        var_1 = 0;

        while ( level.player istouching( var_0 ) )
        {
            if ( var_1 > 3 )
                return;

            var_1 += 0.05;
            wait 0.05;
        }

        waitframe();
    }
}

gulag_entrance_portal_group()
{
    enablepg( "gulag_entrance_portalgrp", 0 );
    common_scripts\utility::flag_wait( "player_lands" );
    enablepg( "gulag_entrance_portalgrp", 1 );
}

hide_courtyard_models()
{
    level waittill( "fxvolume_grp_setup_done" );
    var_0 = getentarray( "courtyard_hide", "script_noteworthy" );

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "gulag_enable_exterior_fx_vol" );

        foreach ( var_2 in var_0 )
            var_2 hide();

        common_scripts\utility::flag_wait( "gulag_enable_exterior_fx_vol" );

        foreach ( var_2 in var_0 )
            var_2 show();
    }
}

exterior_interior_lightgrid()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "disable_exterior_fx" );
        maps\gulag_lighting::_id_B14F( "cellblock_01" );
        common_scripts\utility::flag_waitopen( "disable_exterior_fx" );
        maps\gulag_lighting::_id_B14F( "exterior" );
    }
}
