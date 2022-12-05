// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_B7A7()
{
    common_scripts\utility::flag_wait( "wait_for_player" );
    var_0 = spawn( "trigger_radius", self gettagorigin( "tag_passenger" ), 0, 72, 64 );
    var_0 enablelinkto();
    var_0 linkto( self, "tag_passenger", ( 0.0, -48.0, -48.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "uaz_mounted" );
    var_0 delete();
}

_id_CF05()
{
    level.player endon( "death" );
    level endon( "c130_takeoff_missed" );
    level endon( "uaz_park_crash" );
    common_scripts\utility::flag_wait( "uaz_mounted" );
    level.player enableinvulnerability();
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player allowstand( 1 );
    maps\_utility::enableplayerweapons( 0 );
    level.player.rig = maps\_utility::spawn_anim_model( "player_rig" );
    level.player.rig hide();
    level.player.rig linkto( self, "tag_body" );
    thread maps\_anim::anim_single_solo( level.player.rig, "boneyard_uaz_mount", "tag_body" );
    thread _id_CF42();
    level.player playerlinktoblend( level.player.rig, "tag_player", 0.5 );
    wait 0.5;
    level.player.rig show();
    level.player playerlinktodelta( level.player.rig, "tag_player", 1, 10, 10, 35, 20, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    self waittill( "boneyard_uaz_mount" );
    level.player playerlinktodelta( level.player.rig, "tag_player", 0.75, 180, 180, 75, 25, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    level.player disableinvulnerability();
    thread _id_AEB2();
    level.player.rig hide();
    maps\_utility::enableplayerweapons( 1 );
    childthread _id_CDBB();
    level.player lerpviewangleclamp( 0.5, 0.5, 0, 180, 180, 75, 35 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    common_scripts\utility::flag_wait( "uaz_player_control" );
    common_scripts\utility::flag_set( "uaz_player_in_control" );
    level.price maps\_utility::stop_magic_bullet_shield();
    level.player lerpviewangleclamp( 0.5, 0.5, 0, 15, 15, 75, 5 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    level.player.rig setmodel( "h2_gfl_m4_sopmod_ii_viewbody_uaz" );
    wait 0.5;
    maps\_utility::enableplayerweapons( 0 );
    level.player.rig common_scripts\utility::delaycall( 0.2, ::show );
    maps\_anim::anim_single_solo( level.player.rig, "grab_wheel", "tag_body" );
    common_scripts\utility::flag_set( "lighting_do_uaz_control_dof" );
    thread _id_BE30();
    common_scripts\utility::flag_wait( "uaz_park" );
    wait 0.25;
    self playsound( "scn_bone_uaz_hits_ramp" );
    earthquake( 0.5, 2, level.player.origin, 1024 );
    thread _id_D538();
}

_id_AEB2()
{
    level endon( "uaz_player_control" );
    var_0 = 0;

    for (;;)
    {
        var_1 = anglestoforward( level.player.angles );
        var_2 = anglestoforward( self.angles );
        var_3 = anglestoright( self.angles );
        var_4 = vectordot( var_1, var_2 );
        var_5 = vectordot( var_1, var_3 );
        var_6 = common_scripts\utility::ter_op( var_5 >= 0, -0.4, 0.65 );

        if ( var_4 < var_6 )
        {
            if ( !var_0 )
            {
                maps\_anim::anim_single_solo( level.player.rig, "boneyard_uaz_stand", "tag_body" );
                var_0 = 1;
            }
        }
        else if ( var_0 )
        {
            maps\_anim::anim_single_solo( level.player.rig, "boneyard_uaz_sit", "tag_body" );
            var_0 = 0;
        }

        if ( var_4 < 0 )
            level.player _meth_85A8( "h2_boneyard_player_death_back", 1 );
        else
            level.player _meth_85A8( "h2_boneyard_player_death_front", 1 );

        wait 0.05;
    }
}

_id_BE30()
{
    level endon( "uaz_stop_player_control" );
    level endon( "uaz_park" );
    level endon( "uaz_park_crash" );
    self notify( "newpath" );
    level.player setstance( "stand" );
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player allowstand( 1 );
    maps\_utility::enableplayerweapons( 0 );
    thread _id_C42E();
    var_0 = 200;
    var_1 = vectortoangles( level._id_AC2D.origin - self.origin )[1];
    var_2 = self.angles[1];
    var_3 = var_1 - var_2;
    var_4 = tan( var_3 ) * var_0;
    thread _id_A8D1();
    var_5 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_4 = 0;
    var_6 = 5;
    var_7 = 3;
    var_8 = 544;
    var_9 = gettime();
    var_10 = 1.5;
    var_10 *= 1000;
    var_11 = 2.0;
    var_11 *= 1000;
    var_12 = 0.78;
    var_13 = 0.78;
    var_14 = 50;
    var_15 = 95;
    var_16 = 8.0;
    var_17 = ( var_15 - var_14 ) / var_16 * 20;
    var_18 = var_17 * 0.5;
    var_17 *= 4;
    var_19 = var_18;

    for (;;)
    {
        var_20 = level.player getnormalizedmovement()[1];
        var_20 *= -1;
        var_4 += var_20 * var_6;
        var_4 = clamp( var_4, var_7 * -1, var_7 );
        var_21 = vectortoangles( ( 0.0, 100.0, 0.0 ) );
        var_22 = anglestoforward( var_21 );
        var_23 = anglestoforward( self.angles );
        var_24 = vectordot( var_23, var_22 );
        var_25 = anglestoright( self.angles );

        if ( vectordot( var_25, var_22 ) > 0 )
        {
            if ( var_24 < var_12 )
                var_4 = var_7 * -1;
        }
        else if ( var_24 < var_13 )
            var_4 = var_7;

        var_5.angles = ( 0, self.angles[1], 0 );
        var_5 addyaw( var_4 );
        var_26 = anglestoforward( var_5.angles );
        var_27 = self.origin + var_26 * var_0;

        if ( self.origin[0] < level._id_AC2D.origin[0] - 360 )
            var_27 = level._id_AC2D._id_B473.origin;

        if ( common_scripts\utility::flag( "player_loses_control_of_uaz" ) )
        {
            var_28 = gettime() - level._id_B5FF;
            var_28 /= var_11;
            var_28 = clamp( var_28, 0, 1 );
            var_27 = level._id_AC2D._id_B473.origin * var_28 + var_27 * ( 1 - var_28 );
        }
        else
        {
            var_29 = vectortoangles( level._id_AC2D.origin + ( var_8, 0, 0 ) - self.origin );
            var_30 = anglestoforward( var_29 );
            var_31 = self.origin + var_30 * var_0;
            var_28 = gettime() - var_9;
            var_28 /= var_10;
            var_28 = clamp( var_28, 0, 1 );
            var_27 = var_27 * var_28 + var_31 * ( 1 - var_28 );
        }

        if ( var_14 >= 60 )
            var_19 = var_17;

        var_14 += var_19;
        var_14 = clamp( var_14, 0, var_15 );
        self vehicledriveto( var_27, var_14 );
        wait 0.05;
    }
}

_id_A8D1()
{
    self endon( "death" );
    self endon( "dying" );
    self vehphys_enablecrashing();
    wait 2;
    self vehphys_disablecrashing();

    for (;;)
    {
        if ( abs( level._id_BE0D.origin[0] - level._id_AC2D.origin[0] ) > 450 )
            self vehphys_enablecrashing();
        else
            self vehphys_disablecrashing();

        wait 0.05;
    }
}

_id_C42E()
{
    level endon( "uaz_park" );
    level endon( "uaz_park_crash" );
    var_0 = 0;

    for (;;)
    {
        var_1 = level.player getnormalizedmovement()[1] * -1;
        var_1 += self vehicle_getsteering() * 0.25;
        var_1 = clamp( var_1, -1, 1 );
        var_0 += var_1 * 0.1;

        if ( abs( var_0 ) > abs( var_1 ) )
            var_0 = var_1;

        var_2 = abs( var_0 );
        level.player.rig setanim( level.scr_anim["player_rig"]["steer_straight"], 1 - var_2, 0.1, 1 );
        level._id_BE0D setanim( level.scr_anim["generic"]["steer_straight"], 1 - var_2 / 2, 0.1, 1 );
        level._id_BE0D clearanim( level.scr_anim["generic"]["old_steering"], 0 );

        if ( var_0 < 0 )
        {
            level.player.rig setanim( level.scr_anim["player_rig"]["steer_right"], var_2, 0.1, 1 );
            level.player.rig setanim( level.scr_anim["player_rig"]["steer_left"], 0, 0.1, 1 );
            level._id_BE0D setanim( level.scr_anim["generic"]["steer_right"], var_2 / 2, 0.1, 1 );
            level._id_BE0D setanim( level.scr_anim["generic"]["steer_left"], 0, 0.1, 1 );
        }
        else
        {
            level.player.rig setanim( level.scr_anim["player_rig"]["steer_right"], 0, 0.1, 1 );
            level.player.rig setanim( level.scr_anim["player_rig"]["steer_left"], var_2, 0.1, 1 );
            level._id_BE0D setanim( level.scr_anim["generic"]["steer_right"], 0, 0.1, 1 );
            level._id_BE0D setanim( level.scr_anim["generic"]["steer_left"], var_2 / 2, 0.1, 1 );
        }

        wait 0.05;
    }
}

_id_B7CA()
{
    self endon( "death" );

    for (;;)
    {
        var_0 = getaiarray( "axis" );

        if ( var_0.size == 0 )
            break;

        var_0 = common_scripts\utility::array_randomize( var_0 );
        var_1 = randomintrange( 5, 15 );
        var_2 = var_0[0] geteye();

        for ( var_3 = 0; var_3 < var_1; var_3++ )
        {
            if ( isalive( var_0[0] ) )
                var_2 = var_0[0] geteye();

            magicbullet( self.weapon, level.price geteye() + ( 0.0, 0.0, 16.0 ), var_2 );
            wait 0.1;
        }

        wait(randomfloatrange( 1.5, 3 ));
    }
}
#using_animtree("vehicles");

ride_uaz_vehicle()
{
    var_0 = maps\_vehicle_aianim::getanimatemodel();
    var_1 = level.scr_anim["generic"]["jeep_ride_vehicle"];
    var_0 setanim( var_1, 0.01, 0.0, 1.0 );
    var_0 waittillmatch( "uaz_door_anim", "end" );
    var_0 setanim( var_1, 1.0, 0.2, 1.0 );
    var_0 clearanim( %uaz_driver, 0 );
}

hide_uaz_windshield()
{
    self hidepart( "tag_glass_attach" );
    self hidepart( "tag_glass_animate_01" );
}

_id_CF42()
{
    var_0 = maps\_vehicle_aianim::getanimatemodel();
    var_0 setflaggedanim( "uaz_door_anim", level.scr_anim["generic"]["boneyard_UAZ_door"], 1, 0.2, 1 );
    var_0 waittillmatch( "uaz_door_anim", "end" );
    var_0 setanim( level.scr_anim["generic"]["boneyard_UAZ_door"], 0.0, 0.2, 1.0 );
    var_0 hide_uaz_windshield();
}

_id_D538()
{
    var_0 = getent( "uaz_park", "script_noteworthy" );
    var_0 setmodel( "tag_origin" );
    var_1 = var_0 common_scripts\utility::spawn_tag_origin();
    var_1 linkto( var_0, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_2 = anglestoforward( var_0.angles );
    var_3 = self.origin + var_2 * 500;
    self vehicledriveto( var_3, 60 );
    self.riders = common_scripts\utility::array_add( self.riders, level._id_ADB5 );
    var_4 = maps\_vehicle::vehicle_to_dummy();
    var_4 hidepart( "tag_glass_front_d" );
    var_4 hidepart( "tag_mirror_left" );
    var_4 hidepart( "tag_mirror_right" );
    var_4 hide_uaz_windshield();
    self._id_AB09 = var_4;
    level.player.rig linkto( var_4, "tag_body" );
    var_4 dontinterpolate();
    level.player dontinterpolate();
    level.player.rig dontinterpolate();
    var_4 linkto( var_1, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 animscripted( "uaz_parked", var_1.origin, var_1.angles, level.scr_anim["generic"]["boneyard_jeep_evac"] );
    thread _id_AC8E();
    soundscripts\_snd::snd_message( "aud_start_evac_sequence" );
    level.player.rig setanimknob( level.scr_anim["player_rig"]["jeep_evac"] );
    var_4 setanim( level.scr_anim["generic"]["jeep_evac_vehicle"] );
    var_4 thread maps\_anim::anim_single_solo( level._id_BE0D.driver, "jeep_evac_driver", "tag_driver" );
}

_id_AC8E()
{
    level.player playrumblelooponentity( "artillery_rumble" );
    wait 0.5;
    level.player playrumblelooponentity( "damage_heavy" );
    wait 0.2;
    level.player playrumblelooponentity( "damage_light" );
    wait 0.2;
    level.player playrumblelooponentity( "damage_light" );
    wait 0.2;
    level.player playrumblelooponentity( "damage_light" );
}

ride_global_shake()
{
    self endon( "death" );
    var_0 = 0.0;

    for ( var_1 = 0.05; var_0 < 5.0; var_0 += var_1 )
    {
        if ( common_scripts\utility::flag( "uaz_mounted" ) )
            break;

        wait(var_1);
    }

    common_scripts\utility::flag_wait( "uaz_mounted" );
    var_2 = _id_D397::_id_A97A( "roadkill_ride" );
    var_3 = 0.8;
    var_4 = 10000;
    var_5 = level.player;
    var_6 = 66.5 - var_0;

    for ( var_7 = 0.0; var_7 <= var_6; var_7 += 0.35 )
    {
        if ( var_7 > 6.85 - var_0 && var_7 <= 8.5 - var_0 )
            var_8 = 0.14;
        else if ( var_7 > 8.5 - var_0 && var_7 <= 9.15 - var_0 )
            var_8 = 0.06;
        else if ( var_7 > 43.8 - var_0 && var_7 <= 44.35 - var_0 )
            var_8 = 0.22;
        else if ( var_7 > 45.5 - var_0 && var_7 <= 46.35 - var_0 )
            var_8 = 0.18;
        else if ( var_7 > 46.35 - var_0 && var_7 <= 47.35 - var_0 )
            var_8 = 0.06;
        else if ( var_7 > 47.35 - var_0 && var_7 <= 49.5 - var_0 )
            var_8 = 0.14;
        else
            var_8 = 0.1;

        var_2 _id_D397::_id_BEA0( var_7 ) _id_D397::_id_B85E( var_8, var_3, var_5, var_4 );
    }

    var_2 _id_D397::_id_BC26();
}

_id_C126()
{
    self endon( "death" );
    common_scripts\utility::array_thread( getvehiclenodearray( "jolt_node", "script_noteworthy" ), ::_id_CF50 );
    self._id_C679 = 0.1;
    var_0 = 80;
    var_1 = [];
    var_1[0] = ( 23.0, 33.0, 64.0 );
    var_1[1] = ( -23.0, -33.0, 64.0 );

    for (;;)
    {
        var_2 = min( self.veh_speed, var_0 );
        var_3 = self._id_C679 / var_0;

        if ( var_2 > 0 && self._id_C679 > 0 )
        {
            var_4 = var_2 * var_3;
            self joltbody( self.origin + var_1[randomint( 2 )], var_4 );
        }

        var_5 = ( var_0 - var_2 ) / 100 + 0.1;
        wait(0.2 + randomfloat( var_5 ));
    }
}

_id_CF50()
{
    self waittill( "trigger", var_0 );
    var_0._id_C679 = self.script_physicsjolt / 1000;
}

_id_BF34()
{
    var_0 = getentarray( "rumble_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_BE2C );
}

_id_BE2C()
{
    self waittill( "trigger" );
    var_0 = "grenade_rumble";

    if ( isdefined( self.script_rumble ) )
        var_0 = self.script_rumble;

    level.player playrumblelooponentity( var_0 );
}

_id_C3DA()
{
    var_0 = getvehiclenodearray( "vehicle_event", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_C73F );
}

_id_C7FE()
{
    self waittill( "trigger" );

    if ( common_scripts\utility::flag( "ride_minigun_gunner_dead" ) && self.script_soundalias == "byard_pri_thedrivers" )
        return;

    level.price maps\_utility::dialogue_queue( self.script_soundalias );
}

_id_C73F()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 notify( "event", self.script_parameters );

        if ( isdefined( self.script_vehicleaianim ) )
            var_0 maps\_vehicle::vehicle_ai_event( self.script_vehicleaianim );
    }
}

_id_ADE2()
{
    self endon( "death" );
    var_0 = self;

    for (;;)
    {
        self waittill( "event", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        switch ( var_1 )
        {
            case "enable_crashing":
                var_0 vehphys_enablecrashing();
                continue;
            case "disable_crashing":
                var_0 vehphys_disablecrashing();
                continue;
            case "allow_frontal":
                var_0 vehphys_enablecrashing();
                var_0 thread _id_CFA6();
                continue;
            case "end_induced_death":
                var_0 notify( "end_induced_death" );
                continue;
            case "start_induced_death":
                var_0 thread _id_B711();
                continue;
            case "frontal":
                var_0 notify( "dying" );
                var_0.dontunloadonend = 1;
                common_scripts\utility::array_thread( var_0.riders, ::_id_B9E8, var_0 );
                var_2 = _id_CC8D( ( 0.0, 0.0, 50.0 ), var_0.angles );
                var_0 vehphys_launch( var_2, 0 );
                wait(randomfloatrange( 0, 0.2 ));
                var_0 maps\_vehicle::godoff();
                var_0 maps\_vehicle::force_kill();
                continue;
            case "crash":
                var_0 notify( "dying" );
                var_0.dontunloadonend = 1;

                if ( issubstr( var_0.classname, "pickup" ) )
                {
                    common_scripts\utility::array_thread( var_0.riders, ::_id_B54A, var_0 );
                    var_0 thread _id_C87D();
                    var_0 thread maps\_utility::play_sound_on_entity( "scn_boneyard_pickup_crashing" );
                }
                else
                    var_0 maps\_vehicle::vehicle_ai_event( "idle" );

                var_0 vehphys_enablecrashing();
                var_2 = _id_CC8D( ( 64.0, -256.0, 0.0 ), var_0.angles );
                var_0 vehphys_launch( var_2, 0 );
                var_0 _id_B9E9( 4, 200 );
                var_0 maps\_vehicle::godoff();
                var_0 maps\_vehicle::force_kill();
                continue;
        }
    }
}

_id_B54A( var_0 )
{
    if ( self.vehicle_position == 0 )
        return;

    self.deathanim = undefined;
    self.noragdoll = undefined;
    var_0.riders = common_scripts\utility::array_remove( var_0.riders, self );
    self.ragdoll_immediate = 1;
    self kill();
}

_id_C87D()
{
    wait 0.1;
    var_0 = self gettagorigin( "tag_guy1" );
    physicsexplosioncylinder( var_0, 300, 300, 2 );
}

_id_B9E8( var_0 )
{
    if ( self.vehicle_position == 0 )
        return;

    self.deathanim = undefined;
    self.noragdoll = undefined;
    var_0.riders = common_scripts\utility::array_remove( var_0.riders, self );
    var_0 waittill( "death" );
    wait 0.05;
    self unlink();

    if ( isalive( self ) )
        self kill( level.player.origin, level.player );
}

_id_B711()
{
    self endon( "death" );
    self endon( "dying" );
    self endon( "end_induced_death" );
    var_0 = [];
    var_0[0] = 2500;
    var_0[1] = 2500;
    var_0[2] = 3000;
    var_0[3] = 3500;
    var_1 = level.gameskill;
    var_2 = var_0[var_1];
    var_3 = 0;

    while ( var_3 < var_2 )
    {
        self waittill( "damage", var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 );

        if ( var_5 != level.player )
            continue;

        if ( var_8 == "MOD_PROJECTILE" )
            break;

        var_3 += var_4;
    }

    thread _id_AEDE();
}

_id_CFA6()
{
    self endon( "death" );
    self endon( "dying" );
    var_0 = 5000;

    for (;;)
    {
        self waittill( "veh_jolt", var_1 );
        var_2 = abs( var_1[0] ) + abs( var_1[1] ) + abs( var_1[2] );

        if ( var_2 > var_0 )
            self notify( "event", "frontal" );
    }
}

_id_AEDE( var_0, var_1 )
{
    var_2 = ( 64.0, -256.0, 16.0 );
    var_3 = ( 64.0, 256.0, 0.0 );

    if ( isdefined( var_0 ) )
    {
        var_2 = ( 64.0, 256.0, 16.0 );
        var_3 = ( 64.0, -256.0, 0.0 );
    }

    var_2 = _id_CC8D( var_2, self.angles );
    var_4 = self.origin + var_2;
    self notify( "newpath" );
    self notify( "dying" );
    self.dontunloadonend = 1;

    if ( issubstr( self.classname, "pickup" ) )
    {
        common_scripts\utility::array_thread( self.riders, ::_id_B54A, self );
        thread _id_C87D();
    }
    else
        maps\_vehicle::vehicle_ai_event( "idle" );

    self vehphys_enablecrashing();
    self vehicledriveto( var_4, self.veh_speed );

    while ( abs( self vehicle_getsteering() ) < 1 )
        wait 0.05;

    var_3 = _id_CC8D( var_3, self.angles );
    self vehphys_launch( var_3, 0 );

    if ( !isdefined( var_1 ) )
        var_1 = 4;

    _id_B9E9( var_1, 200 );
    maps\_vehicle::godoff();
    maps\_vehicle::force_kill();
}

_id_B9E9( var_0, var_1 )
{
    _id_AEF6( var_0 ) endon( "timeout" );

    if ( !isdefined( var_1 ) )
        var_1 = 50;

    var_2 = self vehicle_getvelocity();
    var_2 = abs( var_2[0] ) + abs( var_2[1] ) + abs( var_2[2] );

    while ( var_2 > var_1 )
    {
        var_2 = self vehicle_getvelocity();
        var_2 = abs( var_2[0] ) + abs( var_2[1] ) + abs( var_2[2] );
        wait 0.05;
    }
}

_id_B188()
{
    common_scripts\utility::array_thread( getentarray( "launch_object", "targetname" ), ::_id_BF7F );
}

_id_BF7F()
{
    var_0 = getentarray( self.target, "targetname" );
    self waittill( "trigger", var_1 );
    var_2 = [];
    var_2["com_trafficcone01"] = 2;
    var_2["bc_military_tire04"] = 25;
    var_2["bc_military_tire05"] = 25;
    var_2["com_junktire"] = 25;
    var_2["road_barrier_post"] = 4;

    foreach ( var_4 in var_0 )
    {
        if ( var_1 == level._id_BE0D )
            level.player playrumblelooponentity( "damage_light" );

        var_5 = var_1 vehicle_getvelocity();
        var_6 = vectortoangles( var_4.origin + ( 0.0, 0.0, 6.0 ) - var_1.origin );
        var_7 = vectortoangles( var_5 );

        if ( var_0.size > 2 )
        {
            var_8 = ( 0, randomint( 30 ) - 15, 0 );
            var_6 += var_8;
        }

        var_9 = var_6 - var_7;
        var_5 = _id_CC8D( var_5, var_9 );
        var_10 = 2;

        if ( isdefined( var_2[var_4.model] ) )
            var_10 = var_2[var_4.model];

        if ( isdefined( var_4.script_accel ) )
            var_10 *= var_4.script_accel;

        if ( isdefined( var_4.script_soundalias ) )
            level thread common_scripts\utility::play_sound_in_space( var_4.script_soundalias, var_4.origin );

        var_5 *= var_10;
        var_11 = vectornormalize( var_5 * -1 );
        var_12 = var_4.origin + var_11 * 16;
        var_4 physicslaunchclient( var_12, var_5 );
        var_13 = vectornormalize( var_5 );
    }
}

_id_AEF6( var_0 )
{
    var_1 = spawnstruct();
    var_1 maps\_utility::delaythread( var_0, maps\_utility::send_notify, "timeout" );
    return var_1;
}

_id_B8D3()
{
    common_scripts\utility::flag_wait( "wing_fall" );
    common_scripts\_exploder::exploder( "wing_fall" );
    var_0 = getent( "wing", "targetname" );
    var_1 = getent( "pivot_1", "targetname" );
    var_2 = getent( "pivot_2", "targetname" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_boneyard_wing_explosion" );
    var_1.angles = vectortoangles( var_2.origin - var_1.origin );
    var_2.angles = vectortoangles( var_1.origin - var_2.origin );
    var_0 linkto( var_1 );
    var_2 linkto( var_1 );
    var_3 = physicstrace( var_2.origin + ( 0.0, 0.0, -64.0 ), var_2.origin + ( 0.0, 0.0, -256.0 ) );
    var_4 = physicstrace( var_1.origin + ( 0.0, 0.0, -65.0 ), var_1.origin + ( 0.0, 0.0, -256.0 ) );
    var_5 = vectortoangles( var_3 - var_1.origin );
    var_1 rotateto( var_5, 0.4, 0.3, 0 );
    var_1 waittill( "rotatedone" );
    var_5 = vectortoangles( var_3 + ( 0.0, 0.0, 40.0 ) - var_1.origin );
    var_1 rotateto( var_5, 0.25, 0, 0.25 );
    var_1 waittill( "rotatedone" );
    var_5 = vectortoangles( var_3 - var_1.origin );
    var_1 rotateto( var_5, 0.25, 0.25, 0 );
    var_1 waittill( "rotatedone" );
    var_5 = vectortoangles( var_3 + ( 0.0, 0.0, 10.0 ) - var_1.origin );
    var_1 rotateto( var_5, 0.1, 0, 0.1 );
    var_1 waittill( "rotatedone" );
    var_5 = vectortoangles( var_3 - var_1.origin );
    var_1 rotateto( var_5, 0.1, 0.1, 0 );
    var_1 waittill( "rotatedone" );
    var_0 unlink();
    var_2 unlink();
    var_0 linkto( var_2 );
    var_5 = vectortoangles( var_4 - var_2.origin );
    var_2 rotateto( var_5, 0.3, 0.2, 0 );
    var_2 waittill( "rotatedone" );
    var_5 = vectortoangles( var_4 + ( 0.0, 0.0, 20.0 ) - var_2.origin );
    var_2 rotateto( var_5, 0.2, 0, 0.2 );
    var_2 waittill( "rotatedone" );
    var_5 = vectortoangles( var_4 - var_2.origin );
    var_2 rotateto( var_5, 0.2, 0.2, 0 );
    var_2 waittill( "rotatedone" );
    var_5 = vectortoangles( var_4 + ( 0.0, 0.0, 5.0 ) - var_2.origin );
    var_2 rotateto( var_5, 0.1, 0, 0.1 );
    var_2 waittill( "rotatedone" );
    var_5 = vectortoangles( var_4 - var_2.origin );
    var_2 rotateto( var_5, 0.1, 0.1, 0 );
    var_2 waittill( "rotatedone" );
}

_id_BA8A()
{
    var_0 = getent( "c130_flight", "targetname" );
    var_1 = getent( "lower_hatch", "targetname" );
    var_2 = getent( "upper_hatch", "targetname" );
    var_3 = getentarray( "hinge", "targetname" );
    var_4 = getent( "lower_hatch_origin", "targetname" );
    var_5 = getent( "upper_hatch_origin", "targetname" );
    var_6 = getentarray( "hinge_origin", "targetname" );
    var_7 = getent( "c130_nikolai", "targetname" );
    var_8 = getent( "nikolai_origin", "script_noteworthy" );
    var_9 = var_7 spawndrone();
    var_9 linkto( var_0 );
    var_9.origin = var_8.origin;
    var_9 maps\_utility::assign_animtree( "nikolai" );
    var_9 character\gfl\_utility::detach_all_attachments();
    var_9 character\gfl\character_gfl_dima::main();

    var_8 thread maps\_anim::anim_loop_solo( var_9, "nikolai_idle" );
    common_scripts\utility::array_call( getentarray( var_0.target, "targetname" ), ::linkto, var_0 );
    common_scripts\utility::array_call( getentarray( var_1.target, "targetname" ), ::linkto, var_1 );
    common_scripts\utility::array_call( getentarray( var_2.target, "targetname" ), ::linkto, var_2 );
    common_scripts\utility::array_call( getentarray( var_3[0].target, "targetname" ), ::linkto, var_3[0] );
    common_scripts\utility::array_call( getentarray( var_3[1].target, "targetname" ), ::linkto, var_3[1] );
    var_0 thread _id_B8C6();
    var_3[0].angles = ( 175.0, 90.0, 0.0 );
    var_3[1].angles = ( 170.0, 90.0, 0.0 );
    var_1 thread _id_D4D6( var_3[0], var_6[0].origin, 0.25, 1.85, 12.1 );
    var_1 thread _id_D4D6( var_3[1], var_6[1].origin, 0.3, 1.5, 11.5 );
    var_10 = 4.9;
    var_0 thread _id_D4D6( var_1, var_4.origin, 0.015, 5.9, 3 );
    var_0 thread _id_D4D6( var_2, var_5.origin, 0.01, var_10 );
    var_0._id_B473 = getent( "ramp_trigger", "targetname" );
    var_0._id_B473 enablelinkto();
    var_0._id_B473 linkto( var_0 );
    common_scripts\utility::array_thread( getentarray( "ramp_death_trigger", "targetname" ), ::_id_D3CC, var_0 );
    common_scripts\utility::array_thread( getentarray( "c130_propeller", "script_noteworthy" ), ::_id_AB26 );
    return var_0;
}

_id_C43D( var_0 )
{
    for (;;)
    {
        level waittill( "hinge_stopped", var_1 );

        if ( var_1 == var_0 )
            break;
    }

    var_2 = getentarray( "hinge", "targetname" );
    var_2[0] playloopsound( "veh_c130_ramp_scrape_loop" );
    var_3 = level._id_AC2D.origin[2];

    for (;;)
    {
        if ( level._id_AC2D.origin[2] > var_3 + 50 )
        {
            var_2[0] stopsounds();
            return;
        }

        var_4 = randomintrange( 0, 2 );

        for ( var_5 = 0; var_5 < var_4; var_5++ )
            thread _id_A96A( var_2 );

        wait 0.05;
    }
}

_id_A96A( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_2 = randomfloat( 1.3 );
    var_1.origin = var_0[0].origin * var_2 + var_0[1].origin * ( 1 - var_2 );
    var_1.origin += ( 0.0, -10.0, -14.0 );
    var_1.angles = ( 308.0, 270.0, 0.0 );
    var_1 linkto( var_0[0] );
    var_3 = common_scripts\utility::getfx( "scrape_sparks" );
    playfxontag( var_3, var_1, "tag_origin" );
    var_4 = 4;
    var_4 *= 20;

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;

    wait 4;
    var_1 delete();
}

_id_D3CC( var_0 )
{
    level endon( "uaz_park" );
    self enablelinkto();
    self linkto( var_0 );
    common_scripts\utility::flag_wait( "uaz_player_in_control" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( var_1 == level._id_BE0D )
            break;
    }

    level notify( "uaz_park_crash" );
    level._id_BE0D _id_AEDE( self.script_parameters, 1.5 );
    level.player kill();
}

_id_C8FD()
{
    var_0 = ( -300.0, 600.0, 500.0 );
    maps\_utility::enableplayerweapons( 0 );
    level.player.rig unlink();
    level.player.rig rotatevelocity( ( 300.0, 300.0, 300.0 ), 10 );
    level.player.rig movegravity( var_0, 1 );
    level.player.rig hide();
}

ride_uaz_crash_player_death()
{
    level.player _meth_85A8( "h2_boneyard_player_death_front", 1 );
    level.player enabledeathshield( 1 );
    level.player.rig hide();
    maps\_utility::enableplayerweapons( 1 );
    wait 0.1;
    level.player enabledeathshield( 0 );
    level.player kill();
}

_id_D4D6( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 5;
    var_6 = spawn( "script_model", var_1 );
    var_6.angles = ( 0.0, 0.0, 0.0 );
    var_6 setmodel( "tag_origin" );
    var_6 linkto( self );
    var_0.origin = var_1;
    var_0 linkto( var_6 );
    common_scripts\utility::flag_wait( "c130_hatch_open" );
    wait(var_5);

    if ( isdefined( var_4 ) )
        wait(var_4);

    var_6.animname = "c130_propeller";
    var_6 maps\_utility::assign_animtree();
    var_7 = level.scr_anim["c130_propeller"]["rotate"][0];
    var_6 animscripted( "rotate_hatch", var_6.origin, var_6.angles, var_7 );
    var_6 setflaggedanim( "rotate_hatch", var_7, 1, 0, var_2 );
    wait(var_3);
    var_6 setflaggedanim( "rotate_hatch", var_7, 1, 0, 0 );
    level notify( "hinge_stopped", var_0 );
}

_id_AB26()
{
    wait(randomfloat( 2 ));
    self.animname = "c130_propeller";
    maps\_utility::assign_animtree();
    maps\_anim::anim_loop_solo( self, "rotate" );
}

_id_B8C6()
{
    common_scripts\utility::flag_wait( "c130_hatch_open" );
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_0 linkto( self );
    common_scripts\utility::_id_C203( common_scripts\utility::getfx( "h2_c130_interior_light" ), var_0, "tag_origin", ( 575.0, 0.0, 165.0 ), ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::_id_C203( common_scripts\utility::getfx( "c138_takeoff_dust" ), var_0, "tag_origin", ( -340.0, 0.0, 6.0 ), ( 0.0, 180.0, 90.0 ) );
    wait 13.85;
    common_scripts\utility::_id_C203( common_scripts\utility::getfx( "scrape_sparks" ), var_0, "tag_origin", ( -340.0, 0.0, 6.0 ), ( 0.0, 180.0, 90.0 ) );
    self playloopsound( "veh_c130_ramp_scrape_loop" );
    wait 4.15;
    common_scripts\utility::_id_C203( common_scripts\utility::getfx( "scrape_sparks_right" ), var_0, "tag_origin", ( -411.0, -37.5, 2.0 ), ( 0.0, 180.0, 90.0 ) );
    wait 0.9;
    common_scripts\utility::_id_C203( common_scripts\utility::getfx( "scrape_sparks_left" ), var_0, "tag_origin", ( -411.0, 35.0, 2.0 ), ( 0.0, 180.0, 90.0 ) );
}

_id_D3BB( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_4 = var_1 * 10;
    var_5 = var_2 * 10;

    if ( var_5 > 0 )
        var_6 = var_0 / var_5;
    else
        var_6 = var_0;

    var_7 = var_3 * 10;
    var_8 = var_4 - var_7;

    if ( var_7 > 0 )
        var_9 = var_0 / var_7;
    else
        var_9 = var_0;

    var_10 = 0.1;
    var_0 = 0;

    for ( var_11 = 0; var_11 < var_4; var_11++ )
    {
        if ( var_11 <= var_5 )
            var_0 += var_6;

        if ( var_11 > var_8 )
            var_0 -= var_9;

        earthquake( var_0, var_10, level.player.origin, 500 );
        wait(var_10);
    }
}

_id_D05F( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "angel_flare_swirl" ), self, "tag_flash_flares" );
    self playsound( "ac130_flare_burst" );

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        thread _id_BF97();
        wait(randomfloatrange( 0.1, 0.25 ));
    }
}

_id_BF97()
{
    if ( !isdefined( level._id_D33F ) )
        level._id_D33F = 0;

    var_0 = maps\_utility::spawn_anim_model( "angel_flare_rig" );
    var_0.origin = self gettagorigin( "tag_flash_flares" );
    var_0.angles = self gettagangles( "tag_flash_flares" );
    var_1 = level._effect["angel_flare_geotrail"];
    var_2 = level.scr_anim["angel_flare_rig"]["ac130_angel_flares"].size;
    var_3 = level.scr_anim["angel_flare_rig"]["ac130_angel_flares"][level._id_D33F % var_2];
    level._id_D33F++;
    var_0 setflaggedanim( "flare_anim", var_3, 1, 0, 1 );
    wait 0.1;
    playfxontag( var_1, var_0, "flare_left_top" );
    playfxontag( var_1, var_0, "flare_right_top" );
    wait 0.05;
    playfxontag( var_1, var_0, "flare_left_bot" );
    playfxontag( var_1, var_0, "flare_right_bot" );
    var_0 waittillmatch( "flare_anim", "end" );
    stopfxontag( var_1, var_0, "flare_left_top" );
    stopfxontag( var_1, var_0, "flare_right_top" );
    stopfxontag( var_1, var_0, "flare_left_bot" );
    stopfxontag( var_1, var_0, "flare_right_bot" );
}

_id_A7FC()
{
    maps\_utility::add_global_spawn_function( "axis", ::_id_C1A1 );
    maps\_utility::add_global_spawn_function( "team3", ::_id_C1A1 );
    level._id_B578["axis"] = 15;
    level._id_B578["team3"] = 15;
    level._id_B578["axis_alive"] = 0;
    level._id_B578["team3_alive"] = 0;
    level thread _id_C7D4();
}

_id_C1A1()
{
    if ( !isai( self ) )
        return;

    var_0 = "default";

    if ( isdefined( self.script_noteworthy ) )
        var_0 = self.script_noteworthy;

    var_1 = level.gameskill;

    if ( var_1 == 0 )
        var_1 = 1;

    waittillframeend;

    switch ( var_0 )
    {
        case "scripted_guy":
            break;
        case "enemy_dog":
            thread _id_C75D();
            break;
        case "struggle_guy":
            thread _id_BFDB();
            break;
        case "rpg_guy":
            thread _id_AFA2();
            break;
        case "spray_guy":
            thread _id_C366();
            break;
        case "minigun_guy":
            self.health *= var_1;

            if ( level.gameskill >= 2 )
                self setthreatbiasgroup( "aware_of_player" );
        default:
            if ( level._id_B578[self.team] < level._id_B578[self.team + "_alive"] && !isdefined( self.ridingvehicle ) )
            {
                self waittill( "finished spawning" );
                self delete();
                return;
            }

            thread _id_CF52();
            _id_AD71();
            return;
    }
}

_id_AD71()
{
    _id_A917();
    thread _id_CCCA();
    thread _id_C5DA();
    thread _id_B819();

    if ( self.team == "team3" && randomint( 4 ) == 0 )
        maps\_utility::enable_heat_behavior( 1 );
}

_id_CF52()
{
    var_0 = self.team;
    level._id_B578[var_0 + "_alive"]++;
    common_scripts\utility::waittill_any( "death", "tobedeleted", "long_death" );
    level._id_B578[var_0 + "_alive"]--;
}

_id_C75D()
{

}

_id_B819()
{
    self endon( "death" );
    self endon( "tobedeleted" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "delay_awareness" )
    {
        if ( isdefined( self.ridingvehicle ) )
        {
            self setthreatbiasgroup( "ignore_player" );
            self waittill( "jumpedout" );
            wait 2;
            self setthreatbiasgroup( self.team );
        }
        else
        {
            self setthreatbiasgroup( "ignore_player" );
            common_scripts\utility::waittill_any_timeout( 3, "damage", "goal" );
            self setthreatbiasgroup( self.team );
        }
    }
}

_id_CCCA()
{
    self endon( "death" );
    self endon( "tobedeleted" );

    for (;;)
    {
        _id_B2E4( "bulletwhizby" );
        _id_B2E4( "damage" );
        self waittill( "waittill_stack", var_0 );

        if ( var_0 == "bulletwhizby" && self._id_AEAF.a == level.player || var_0 == "damage" && self._id_AEAF.b == level.player )
            break;
    }

    _id_C646();
    self setthreatbiasgroup( "aware_of_player" );
}

_id_C5DA()
{
    level.advancetoenemyinterval = 120000;
    var_0 = self.engagemaxdist;
    var_1 = self.engagemaxfalloffdist;
    self endon( "death" );
    self endon( "tobedeleted" );

    for (;;)
    {
        self waittill( "enemy" );

        if ( isplayer( self.enemy ) )
        {
            self setengagementmaxdist( var_0, var_1 );
            continue;
        }

        self setengagementmaxdist( var_0 * 2, var_1 * 2 );
    }
}

_id_A917()
{
    self endon( "death" );
    self.attackeraccuracy = 0.1;
}

_id_BFDB()
{
    self endon( "death" );
    var_0 = self.maxsightdistsqrd;
    self.maxsightdistsqrd = 9216;
    self.dontevershoot = 1;
    wait 1;
    self.maxsightdistsqrd = var_0;
    self.dontevershoot = undefined;
    _id_AD71();
}

_id_B7DC( var_0, var_1 )
{
    var_1 thread _id_CE98();
    var_2 = var_0 getturretowner();
    var_2 endon( "death" );
    var_1 endon( "death" );
    self endon( "death" );

    for (;;)
    {
        var_3 = common_scripts\utility::random( var_1._id_CE98 );
        var_0 animscripts\laatpv_turret\common::set_manual_target( var_3, 3, 5 );
        var_2.ignoreall = 1;
        var_0 animscripts\laatpv_turret\common::set_manual_target( var_3, 1, 3 );
        var_2.ignoreall = 0;
    }
}

_id_CE98()
{
    self._id_CE98 = [];
    var_0 = anglestoright( self.angles );
    var_1 = var_0 * 320;
    self._id_CE98[0] = spawn( "script_origin", self.origin + var_1 );
    self._id_CE98[0] linkto( self );
    var_1 = var_0 * -320;
    self._id_CE98[1] = spawn( "script_origin", self.origin + var_1 );
    self._id_CE98[1] linkto( self );
    self waittill( "death" );
    self._id_CE98[0] delete();
    self._id_CE98[1] delete();
}

_id_CD43( var_0 )
{
    self endon( "death" );
    self endon( "reaction_end" );
    var_1 = getentarray( var_0, "script_noteworthy" );
    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        common_scripts\utility::flag_wait( "littlebird_react" );
        _id_B2E4( "damage" );
        _id_B2E4( "reached_dynamic_path_end" );
        _id_B2E4( "react" );
        self waittill( "waittill_stack", var_4 );

        if ( var_4 == "damage" )
        {
            var_5 = self._id_AEAF.a;
            var_6 = self._id_AEAF.b;

            if ( !common_scripts\utility::flag( "littlebird_react" ) )
                continue;

            var_2 += var_5;

            if ( var_2 < 400 )
                continue;
        }

        var_2 = 0;
        var_7 = var_1[var_3];
        var_3++;

        if ( var_3 > var_1.size )
        {
            var_1 = common_scripts\utility::array_randomize( var_1 );
            var_3 = 0;
        }

        self setmaxpitchroll( 25, 25 );
        maps\_vehicle::_id_B2F5( "fast" );
        self vehicle_setspeed( 65, 25, 25 );
        thread maps\_vehicle::vehicle_paths( var_7 );
        common_scripts\utility::waittill_either( "goal", "near_goal" );
        wait 2;
        thread _id_B0C7();
    }
}

_id_B0C7()
{
    self endon( "reaction_end" );
    self endon( "react" );
    self endon( "death" );
    wait 3;
    var_0 = 5000;
    var_1 = gettime();

    for (;;)
    {
        wait 0.05;

        if ( isdefined( self.mgturret[0] getturrettarget( 0 ) ) || isdefined( self.mgturret[1] getturrettarget( 0 ) ) )
        {
            var_1 = gettime();
            continue;
        }

        if ( var_1 + var_0 < gettime() )
            break;
    }

    self notify( "react" );
}

_id_B084()
{
    self endon( "death" );
    self waittill( "rpg_guy_done" );
    self.ignoreme = 0;
    self.health = 25;
    thread _id_B113();
}

_id_AFA2()
{
    self endon( "death" );
    maps\_utility::disable_ai_color();
    maps\_utility::set_ignoreme( 1 );
    self.combatmode = "no_cover";
    self._id_AFA2 = 1;
    var_0 = getnode( self.target, "targetname" );

    if ( isdefined( var_0 ) )
        self setgoalnode( var_0 );
    else
    {
        var_0 = getent( self.target, "targetname" );
        self setgoalpos( var_0.origin );
    }

    if ( isdefined( var_0.radius ) )
        self.goalradius = var_0.radius;
    else
        self.goalradius = 32;

    var_1 = 10;

    if ( !isdefined( var_0.script_shotcount ) || var_0.script_shotcount == 0 )
        var_0.script_shotcount = 1;

    self.a.rockets = var_0.script_shotcount;

    for ( var_2 = 0; var_2 < var_0.script_shotcount; var_2++ )
    {
        if ( isdefined( var_0.target ) )
        {
            var_3 = getentarray( var_0.target, "targetname" );
            var_4 = common_scripts\utility::random( var_3 );
        }
        else if ( isdefined( self._id_AB99 ) )
        {
            var_4 = self._id_AB99;
            var_1 = 30;
        }
        else
            return;

        if ( isdefined( var_4.script_parameters ) && var_4.script_parameters == "straight" )
            self setstablemissile( 1 );

        if ( issentient( var_4 ) )
        {
            var_5 = spawn( "script_origin", var_4.origin );
            var_5 linkto( var_4 );
            self setentitytarget( var_5, 1 );
        }
        else
            self setentitytarget( var_4, 1 );

        common_scripts\utility::waittill_notify_or_timeout( "missile_fire", var_1 );
        var_4 notify( "rpg_fired" );
    }

    wait 2;
    self clearentitytarget();
    maps\_utility::enable_ai_color();
    maps\_utility::set_ignoreme( 0 );
    self.combatmode = "cover";
    self._id_AFA2 = undefined;
    _id_AD71();
    self notify( "rpg_guy_done" );
}

_id_C366()
{
    self endon( "death" );
    maps\_utility::disable_ai_color();
    self._id_C366 = 1;
    var_0 = getnode( self.target, "targetname" );

    if ( isdefined( var_0.radius ) )
        self.goalradius = var_0.radius;
    else
        self.goalradius = 32;

    self setgoalnode( var_0 );
    self.no_pistol_switch = 1;
    self.ignoresuppression = 1;
    self.norunreload = 1;
    self.disablebulletwhizbyreaction = 1;
    self.combatmode = "no_cover";
    self setthreatbiasgroup( "lowthreat" );
    var_1 = getentarray( var_0.target, "targetname" );
    var_1 = common_scripts\utility::array_randomize( var_1 );
    self setentitytarget( var_1[0], 1 );

    if ( isdefined( self.script_wait ) )
        var_2 = self.script_wait;
    else
        var_2 = randomfloatrange( 1, 2.5 );

    common_scripts\utility::waittill_notify_or_timeout( "goal", 5 );
    var_1[0] moveto( var_1[1].origin, var_2, var_2 / 2, var_2 / 4 );
    wait(var_2);
    self clearentitytarget();
    maps\_utility::enable_ai_color();
    self.no_pistol_switch = undefined;
    self.ignoresuppression = 0;
    self.norunreload = undefined;
    self.disablebulletwhizbyreaction = undefined;
    self.combatmode = "cover";
    self setthreatbiasgroup( self.team );
    self._id_C366 = undefined;
    _id_AD71();
}

smoke()
{
    var_0 = getentarray( self.target, "targetname" );
    var_1 = common_scripts\utility::random( var_0 );
    var_2 = var_1.origin - self.origin + ( 0.0, 0.0, 200.0 );
    magicgrenademanual( "smoke_grenade_american", self.origin + ( 0.0, 0.0, 80.0 ), var_2, 1.5 );
}

_id_C553()
{
    common_scripts\utility::array_thread( getentarray( "delete_excess", "targetname" ), ::_id_AF94 );
    level thread _id_AACD();
}

_id_AF94()
{
    self waittill( "trigger" );
    level._id_B479 = undefined;

    if ( isdefined( self.target ) )
        level._id_B479 = getent( self.target, "targetname" );

    common_scripts\utility::flag_set( "delete_excess" );
    waittillframeend;
    common_scripts\utility::flag_clear( "delete_excess" );
}

_id_C3BA( var_0 )
{
    if ( isdefined( var_0.ridingvehicle ) )
        return 1;

    if ( isdefined( var_0._id_C366 ) )
        return 1;

    if ( isdefined( var_0._id_AFA2 ) )
        return 1;

    return 0;
}

_id_AACD()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "delete_excess" );
        var_0 = level._id_B479;
        var_1 = getaiarray( "axis", "team3" );
        var_2 = 2560000;

        foreach ( var_4 in var_1 )
        {
            if ( _id_C3BA( var_4 ) )
                continue;

            if ( isdefined( var_0 ) && var_4 istouching( var_0 ) )
                continue;
            else if ( !isdefined( var_0 ) && distancesquared( var_4.origin, level.player.origin ) < var_2 )
                continue;

            var_4 thread _id_B113( 1 );
        }

        common_scripts\utility::flag_waitopen( "delete_excess" );
    }
}

_id_D256( var_0 )
{
    self endon( "stop_hunt" );
    self endon( "death" );
    level._id_AC64 endon( "death" );
    self setlookatent( level._id_AC64 );
    var_1 = getentarray( var_0, "targetname" );
    var_2 = undefined;

    for (;;)
    {
        var_3 = vectornormalize( level._id_AC64.origin - level.player.origin );
        var_4 = undefined;
        var_5 = -1;

        foreach ( var_7 in var_1 )
        {
            var_8 = vectornormalize( var_7.origin - level.player.origin );
            var_9 = vectordot( var_3, var_8 );

            if ( var_9 > var_5 )
            {
                var_5 = var_9;
                var_4 = var_7;
            }
        }

        if ( !isdefined( var_2 ) || var_4 != var_2 )
        {
            self vehicle_setspeed( 50, 20, 20 );
            self setmaxpitchroll( 25, 25 );
            var_2 = var_4;
            common_scripts\utility::flag_clear( "littlebird_at_goal" );
            thread maps\_vehicle::vehicle_paths( var_4 );
            thread _id_B0CF();
        }

        wait 0.1;
    }
}

_id_B0CF()
{
    level endon( "littlebird_at_goal" );

    while ( self.veh_speed > 15 )
        common_scripts\utility::waittill_either( "goal", "near_goal" );

    common_scripts\utility::flag_set( "littlebird_at_goal" );
}

_id_C495( var_0 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        level endon( var_0 );

    for (;;)
    {
        common_scripts\utility::flag_wait( "littlebird_at_goal" );
        var_1 = level._id_AC64.origin + ( 0.0, 0.0, 128.0 );
        var_2 = self.origin + ( 0.0, 0.0, -56.0 );

        if ( maps\_utility::player_looking_at( var_2, 0.85, 1, self ) && maps\_utility::player_looking_at( var_1, 0.7, 1, level._id_AC64 ) )
            break;

        wait 0.5;

        if ( common_scripts\utility::flag( "no_align" ) )
            break;
    }
}

_id_C1C3()
{
    self endon( "death" );
    var_0 = getent( "btr80_miss_target", "targetname" );
    var_1 = getentarray( var_0.target, "targetname" );
    var_1 = maps\_utility::array_index_by_script_index( var_1 );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = spawn( "script_origin", var_1[var_3].origin );
        var_2[var_3] = var_4;
    }

    var_5 = vectortoangles( self.origin - level._id_AC64.origin );
    var_6 = level._id_AC64.origin - var_0.origin;

    foreach ( var_4 in var_2 )
        var_4 _id_BEB3( var_5, var_0.origin, var_6 );

    fire_missile( var_2, 3 );
    maps\_utility::delaythread( 2, common_scripts\utility::array_call, var_2, ::delete );
}

_id_CFFD()
{
    var_0 = [];
    var_0["driver"] = [];
    var_0["all"] = [];
    var_1 = "driver";
    var_0[var_1][var_0[var_1].size] = 0;
    var_1 = "all";
    var_0[var_1][var_0[var_1].size] = 0;
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_0["default"] = var_0["all"];
    return var_0;
}

_id_B2DA()
{
    level.vehicle_aianimthread["hide_attack_forward"] = ::_id_C809;
    level.vehicle_aianimcheck["hide_attack_forward"] = ::_id_CB7B;
    level.vehicle_aianimthread["idle"] = ::guy_attack_forward_2_hide;
    level.vehicle_aianimthread["hidetoback_attack"] = ::_id_C61F;
    level.vehicle_aianimcheck["hidetoback_attack"] = ::_id_AAEA;
    level.vehicle_aianimthread["back_attack"] = ::_id_D4B9;
    level.vehicle_aianimcheck["back_attack"] = ::_id_AAEA;
    level.vehicle_aianimthread["hide_attack_left"] = ::_id_A87D;
    level.vehicle_aianimcheck["hide_attack_left"] = ::_id_B09D;
    level.vehicle_aianimthread["hide_attack_left_standing"] = ::_id_B705;
    level.vehicle_aianimcheck["hide_attack_left_standing"] = ::_id_AAEA;
    level.vehicle_aianimthread["hide_attack_back"] = ::_id_D042;
    level.vehicle_aianimcheck["hide_attack_back"] = ::_id_AA9E;
    level.vehicle_aianimthread["hide_starting_back"] = ::_id_C7C6;
    level.vehicle_aianimcheck["hide_starting_back"] = ::_id_AAEA;
    level.vehicle_aianimthread["hide_starting_left"] = ::_id_D2C2;
    level.vehicle_aianimcheck["hide_starting_left"] = ::_id_BC76;
    level.vehicle_aianimthread["backtohide"] = ::_id_CD4D;
    level.vehicle_aianimcheck["backtohide"] = ::_id_BC76;
    level.vehicle_aianimthread["react"] = ::_id_ADEC;
    level.vehicle_aianimcheck["react"] = ::_id_B76B;
    level.vehicle_aianimthread["free_attack"] = ::_id_D45F;
    level.vehicle_aianimcheck["free_attack"] = ::_id_BAD8;
    level.vehicle_aianimthread["hide_attack_right"] = ::_id_CBF8;
    level.vehicle_aianimcheck["hide_attack_right"] = ::_id_D099;
}
#using_animtree("generic_human");

_id_D45F( var_0, var_1 )
{
    var_0 endon( "newanim" );
    var_0 endon( "death" );
    var_0 notify( "animontag_thread" );
    var_0 stopanimscripted();
    var_0.noragdoll = 1;
    thread _id_C6AD( var_0 );
    var_0.deathanim = %boneyard_crouch_exposed_death_twist;
    var_2 = getanimlength( var_0.deathanim );
    var_0 thread _id_D591( var_2 );
    var_3 = "";
    var_4 = level.cosine["20"];

    for (;;)
    {
        if ( common_scripts\utility::within_fov( self.origin, self.angles, level.player.origin, var_4 ) )
            var_5 = "stand";
        else
            var_5 = "crouch";

        if ( var_5 != var_3 )
        {
            var_3 = var_5;
            var_0 allowedstances( var_5 );
        }

        wait 1;
    }
}

_id_D591( var_0 )
{
    self endon( "newanim" );
    self waittill( "death" );
    wait(var_0 * 0.6);
    self delete();
}

_id_C6AD( var_0 )
{
    var_0 endon( "death" );
    var_0 waittill( "animontag_thread" );
    var_0 allowedstances( "stand", "crouch", "prone" );
}

_id_BAD8( var_0, var_1 )
{
    if ( var_0 == level.price && isdefined( var_0.no_ai ) )
        return 0;

    return self.vehicletype == "truck_physics" && var_1 >= 1;
}

_id_AAEA( var_0, var_1 )
{
    if ( var_0 == level.price && isdefined( var_0.no_ai ) )
        return 0;

    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 )._id_D3D7 );
}

_id_C61F( var_0, var_1 )
{
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_D3D7 );
    thread _id_D4B9( var_0, var_1 );
}

_id_D4B9( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_C042 );
}

_id_BC76( var_0, var_1 )
{
    if ( var_0 == level.price && isdefined( var_0.no_ai ) )
        return 0;

    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 )._id_D1EA );
}

_id_C7C6( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );
    maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_D1EA );
    thread _id_D042( var_0, var_1 );
}

_id_D2C2( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    if ( !isdefined( var_2._id_D1EA ) )
        return maps\_vehicle_aianim::guy_idle( var_0, var_1 );

    maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_D1EA );
    thread _id_A87D( var_0, var_1 );
}

_id_CD4D( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );
    maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_D1EA );
    thread maps\_vehicle_aianim::guy_idle( var_0, var_1 );
}

_id_ADEC( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );
    maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_A8AA );
    thread maps\_vehicle_aianim::guy_idle( var_0, var_1 );
}

_id_B76B( var_0, var_1 )
{
    if ( var_0 == level.price && isdefined( var_0.no_ai ) )
        return 0;

    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 )._id_A8AA );
}

_id_AA9E( var_0, var_1 )
{
    if ( var_0 == level.price && isdefined( var_0.no_ai ) )
        return 0;

    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 )._id_B2CF );
}

_id_D042( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
    {
        if ( isdefined( var_2._id_BE1A ) )
        {
            var_3 = maps\_vehicle_aianim::randomoccurrance( var_0, var_2._id_BE1A );
            maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_B2CF[var_3] );
            continue;
        }

        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_B2CF );
    }
}

_id_CB7B( var_0, var_1 )
{
    if ( var_0 == level.price && isdefined( var_0.no_ai ) )
        return 0;

    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 )._id_B94E );
}

_id_C809( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_B94E );
}

_id_B09D( var_0, var_1 )
{
    if ( var_0 == level.price && isdefined( var_0.no_ai ) )
        return 0;

    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 )._id_D077 );
}

guy_attack_forward_2_hide( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );

    if ( var_0 == level.price && isdefined( var_0.no_ai ) )
        return;

    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    if ( var_1 == 2 && isdefined( var_2._id_B94E ) )
    {
        var_3 = var_0 getanimtime( var_2._id_B94E );

        if ( var_3 > 0 )
        {
            var_4 = getanimlength( var_2._id_B94E );
            wait(var_4 * ( 1 - var_3 ));
        }
    }

    maps\_vehicle_aianim::guy_idle( var_0, var_1 );
}

_id_A87D( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
    {
        if ( isdefined( var_2._id_ABD8 ) )
        {
            var_3 = maps\_vehicle_aianim::randomoccurrance( var_0, var_2._id_ABD8 );
            maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_D077[var_3] );
            continue;
        }

        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_D077 );
    }
}

_id_B705( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
    {
        if ( isdefined( var_2._id_B304 ) )
        {
            var_3 = maps\_vehicle_aianim::randomoccurrance( var_0, var_2._id_B304 );
            maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_C8B2[var_3] );
            continue;
        }

        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_C8B2 );
    }
}

_id_D099( var_0, var_1 )
{
    if ( var_0 == level.price && isdefined( var_0.no_ai ) )
        return 0;

    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 )._id_D077 );
}

_id_CBF8( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2._id_D077 );
}

_id_B4FF()
{
    common_scripts\utility::array_thread( getentarray( "player_stray_trigger", "targetname" ), ::_id_BBDB );
}

_id_BBDB()
{
    level.player endon( "death" );
    var_0 = getentarray( self.target, "targetname" );
    var_1 = 0;

    for (;;)
    {
        self waittill( "trigger" );

        if ( var_1 > 8 )
            break;

        var_1++;
        wait 1;
    }

    var_2 = var_0[0];
    var_3 = var_0[1];
    var_4 = level.cosine["60"];

    if ( common_scripts\utility::within_fov( level.player.origin, level.player.angles, var_2.origin, var_4 ) )
    {
        var_2 = var_0[1];
        var_3 = var_0[0];
    }

    var_5 = getent( "killer_bird", "targetname" );
    var_5.origin = var_2.origin;
    var_5.angles = var_2.angles;
    var_6 = var_5 maps\_utility::spawn_vehicle();
    var_6 setvehgoalpos( var_3.origin, 1 );
    var_6 vehicle_setspeedimmediate( 100, 40, 30 );
    var_6 neargoalnotifydist( 4000 );
    var_6 thread _id_AABB( var_3.origin );
    var_6 common_scripts\utility::waittill_either( "goal", "near_goal" );
    var_6 setlookatent( level.player );
    var_6 waittill( "goal" );
    var_4 = level.cosine["20"];

    while ( !common_scripts\utility::within_fov( var_6.origin, var_6.angles, level.player.origin, var_4 ) )
        wait 0.05;

    var_6 notify( "killing_player" );
    var_7 = [];
    var_7[0] = level.player;
    var_6 thread fire_missile( var_7, 5 );
    wait 2;
    level.player kill();
}

_id_AABB( var_0 )
{
    self endon( "killing_player" );
    var_1 = distance2d( level.player.origin, var_0 );
    var_2 = var_0[2];

    for (;;)
    {
        var_3 = anglestoforward( level.player.angles );
        var_4 = level.player.origin + var_1 * var_3 + ( 0, 0, var_2 );
        var_3 = vectornormalize( var_4 - level.player.origin );

        if ( sighttracepassed( level.player geteye(), var_4, 0, self ) )
            self setvehgoalpos( var_4, 1 );

        wait 2;
    }
}

_id_D587( var_0 )
{
    self makeentitysentient( var_0 );
    self waittill( "death" );

    if ( isdefined( self ) )
        self freeentitysentient();
}

_id_B44E( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        _id_AEF6( var_3 ) endon( "timeout" );

    if ( isstring( var_0 ) )
    {
        var_4 = [];
        var_4[tolower( var_0 )] = 1;
        var_0 = var_4;
    }

    if ( isdefined( var_2 ) && var_2 )
        self endon( "death" );

    var_5 = 0;

    while ( !var_5 )
    {
        self waittill( "damage", var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14 );

        if ( isdefined( var_0 ) )
            var_5 = isdefined( var_0[tolower( var_10 )] );

        if ( var_5 && isdefined( var_1 ) )
            var_5 = var_1 == var_7;
    }
}

fade_out_level( var_0 )
{
    soundscripts\_snd::snd_message( "aud_start_level_fadeout" );
    setsaveddvar( "compass", 0 );
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

_id_C4E2( var_0, var_1 )
{
    level endon( "release_objective" );

    for (;;)
    {
        objective_position( var_0, var_1.origin );
        wait 0.05;
    }
}

_id_D151( var_0, var_1 )
{
    self waittill( var_1 );
    common_scripts\utility::flag_set( var_0 );
}

_id_BEB3( var_0, var_1, var_2 )
{
    var_3 = transformmove( level._id_AC64.origin, level._id_AC64.angles, var_1, ( 0.0, 0.0, 0.0 ), self.origin, ( 0.0, 0.0, 0.0 ) );
    var_4 = self.origin - var_1;
    var_5 = anglestoright( var_0 ) * -1;
    var_6 = anglestoforward( var_0 );
    var_7 = anglestoup( var_0 );
    var_8 = var_6 * var_4[0] + var_5 * var_4[1] + var_7 * var_4[2];
    self.origin = var_1 + var_8 + var_2;
}

_id_CC8D( var_0, var_1 )
{
    var_2 = anglestoright( var_1 ) * -1;
    var_3 = anglestoforward( var_1 );
    var_4 = anglestoup( var_1 );
    var_5 = var_3 * var_0[0] + var_2 * var_0[1] + var_4 * var_0[2];
    return var_5;
}

_id_AF96( var_0, var_1 )
{
    level endon( var_0 );
    self waittill( var_1 );
    common_scripts\utility::flag_set( var_0 );
}

_id_BDB7()
{
    maps\_utility::ent_flag_init( "hold_fire" );
    maps\_utility::ent_flag_init( "have_target" );
    maps\_utility::ent_flag_init( "allow_stop" );
    maps\_utility::ent_flag_set( "allow_stop" );
    self._id_A838 = [];
    self._id_C160 = 0;
}

_id_D471( var_0 )
{
    self endon( "death" );
    var_1 = undefined;

    for (;;)
    {
        var_2 = self._id_A838;
        var_2 = common_scripts\utility::array_combine( var_2, _id_B3CB() );
        var_3 = undefined;

        foreach ( var_5 in var_2 )
        {
            if ( issentient( var_5 ) && !isalive( var_5 ) )
                continue;

            if ( isdefined( var_5.ridingvehicle ) )
                continue;

            if ( self vehicle_canturrettargetpoint( var_5.origin + ( 0.0, 0.0, 20.0 ), 1, var_5 ) )
            {
                if ( isplayer( var_5 ) || isai( var_5 ) && !self._id_C160 )
                {
                    maps\_utility::ent_flag_set( "hold_fire" );
                    maps\_vehicle::mgon();
                }
                else
                {
                    maps\_utility::ent_flag_clear( "hold_fire" );
                    maps\_vehicle::mgoff();
                }

                var_3 = var_5;
                break;
            }
        }

        if ( !isdefined( var_3 ) )
        {
            wait 0.5;
            continue;
        }

        var_1 = var_3;
        maps\_utility::ent_flag_set( "have_target" );
        _id_B1C6( var_3, ( 0.0, 0.0, 20.0 ), 0, 5 );
        maps\_utility::ent_flag_clear( "have_target" );
    }
}

_id_B1C6( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self notify( "clear_turret_target" );
    self endon( "clear_turret_target" );

    if ( isalive( var_0 ) )
        thread _id_A9B6( var_0 );

    if ( !isdefined( var_0._id_CE98 ) )
        self setturrettargetent( var_0, var_1 );
    else
        self setturrettargetent( var_0._id_CE98, var_1 );

    self waittill( "turret_on_target" );

    if ( isdefined( var_3 ) )
        _id_AEF6( var_3 ) endon( "timeout" );

    if ( !isdefined( var_2 ) )
        thread _id_B4AD( var_0, var_1 );

    var_4 = gettime();

    for (;;)
    {
        maps\_utility::ent_flag_waitopen( "hold_fire" );
        self fireweapon();
        wait 0.2;
    }
}

_id_A9B6( var_0 )
{
    self endon( "clear_turret_target" );

    if ( isdefined( var_0._id_CE98 ) )
        var_0._id_CE98 maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );

    var_0 maps\_utility::add_wait( common_scripts\utility::waittill_either, "death", "pain_death" );
    maps\_utility::do_wait_any();
    wait(randomfloat( 1 ));

    if ( maps\_utility::is_in_array( self._id_A838, var_0 ) && !isalive( var_0 ) )
        self._id_A838 = common_scripts\utility::array_remove( self._id_A838, var_0 );

    self notify( "clear_turret_target" );
}

_id_B4AD( var_0, var_1 )
{
    self endon( "death" );
    self endon( "clear_turret_target" );
    var_2 = randomfloatrange( 1000, 2000 );
    var_3 = undefined;

    for (;;)
    {
        var_4 = common_scripts\utility::waittill_any_return( "turret_no_vis", "turret_on_vistarget" );

        if ( var_4 == "turret_no_vis" )
        {
            if ( self vehicle_canturrettargetpoint( var_0.origin + var_1, 1, var_0 ) )
                continue;

            if ( !isdefined( var_3 ) )
                var_3 = gettime();

            if ( var_3 + var_2 < gettime() )
                break;
        }
        else
            var_3 = undefined;
    }

    _id_AFA6();
    self notify( "clear_turret_target" );
}

_id_AFA6()
{
    self endon( "death" );
    maps\_utility::ent_flag_set( "hold_fire" );
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_0 linkto( self, "tag_origin", ( 500.0, 0.0, 100.0 ), ( 0.0, 0.0, 0.0 ) );
    self setturrettargetent( var_0 );
    common_scripts\utility::waittill_either( "turret_on_target", "death" );

    if ( isalive( self ) )
        self clearturrettargetent();

    var_0 delete();
    maps\_utility::ent_flag_clear( "hold_fire" );
}

_id_B6A0( var_0, var_1 )
{
    self endon( "death" );

    for (;;)
    {
        maps\_utility::ent_flag_wait( "have_target" );
        maps\_utility::ent_flag_wait( "allow_stop" );
        var_2 = randomintrange( var_0, var_1 );
        self vehicle_setspeed( var_2, 10 );
        maps\_utility::ent_flag_waitopen_either( "have_target", "allow_stop" );
        self resumespeed( 10 );
    }
}

_id_B3CB()
{
    var_0 = [];
    var_1 = "";

    if ( isdefined( self.team ) )
        var_1 = self.team;
    else if ( isdefined( self.script_team ) )
        var_1 = self.script_team;
    else
    {

    }

    switch ( var_1 )
    {
        case "axis":
            var_0 = sortbydistance( getaiarray( "allies", "team3" ), self.origin );
        case "team3":
            var_0 = sortbydistance( getaiarray( "allies", "axis" ), self.origin );
            break;
        case "allies":
            var_0 = sortbydistance( getaiarray( "team3", "axis" ), self.origin );
            break;
    }

    if ( var_1 != "allies" )
    {
        if ( var_0.size > 0 )
            var_0 = common_scripts\utility::array_insert( var_0, level.player, 0 );
        else
            var_0[0] = level.player;
    }

    return var_0;
}

vehicle_set_health( var_0 )
{
    self.health = var_0 + self.healthbuffer;
    self.currenthealth = self.health;
}

_id_C393( var_0 )
{
    common_scripts\utility::flag_wait( "flyby_rockets" );

    while ( !common_scripts\utility::flag( "flyby_c130" ) )
    {
        wait 2;
        _id_C119( var_0, "smoketrail_rpg_sp_boneyard" );
        wait(randomfloatrange( 3, 4 ));
    }
}

_id_C119( var_0, var_1 )
{
    wait(self.script_delay);
    var_2 = getent( self.target, "targetname" );
    var_3 = magicbullet( "rpg_distant_stable", self.origin, var_2.origin );

    if ( isdefined( var_1 ) )
    {
        var_3 _meth_850F();
        playfxontag( common_scripts\utility::getfx( var_1 ), var_3, "tag_fx" );
    }

    if ( isdefined( var_0 ) )
    {
        wait(var_0);

        if ( isdefined( var_3 ) )
            var_3 delete();
    }
}

_id_D1DF( var_0 )
{
    level endon( var_0 );
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2 );

        if ( isplayer( var_2 ) )
            break;
    }

    common_scripts\utility::flag_set( var_0 );
}

_id_B7EF( var_0, var_1 )
{
    var_2 = [];
    var_2["team3"] = "axis";
    var_2["axis"] = "team3";
    self endon( "death" );
    wait(randomfloatrange( var_0, var_1 ));
    var_3 = getaiarray( var_2[self.team] );
    var_3 = sortbydistance( var_3, self.origin );
    var_4 = var_3[0];

    if ( isdefined( var_4 ) )
        self kill( var_4 geteye(), var_4 );
    else
        self kill( self geteye() );
}

_id_B113( var_0 )
{
    self endon( "death" );
    self notify( "tobedeleted" );
    maps\_utility::disable_ai_color();
    _id_B7EF( 3, 7 );
}

_id_CA64( var_0 )
{
    var_1 = anglestoforward( ( 0.0, 0.0, 0.0 ) );
    var_2 = vectornormalize( var_0 - self.origin );
    var_3 = vectordot( var_1, var_2 );
    return var_3 < -0.2;
}

_id_C7D4()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "switch_color" );
        var_0 = getaiarray( "axis", "team3" );

        foreach ( var_2 in var_0 )
        {
            var_3 = var_2.script_forcecolor;
            var_4 = strtok( level._id_B64E[var_2.team], " " );

            if ( isdefined( var_3 ) )
            {
                if ( isdefined( var_3 ) && !maps\_utility::is_in_array( var_4, var_3 ) || isdefined( var_2.old_forcecolor ) )
                    var_2 maps\_utility::set_force_color( var_4[0] );

                continue;
            }

            if ( isdefined( var_2.old_forcecolor ) )
                var_2.old_forcecolor = var_4[0];
        }

        common_scripts\utility::flag_clear( "switch_color" );
    }
}

_id_B2E4( var_0, var_1 )
{
    if ( !isdefined( self._id_AEAF ) )
        self._id_AEAF = spawnstruct();

    thread _id_B79F( var_0, var_1 );
}

_id_C646()
{
    self notify( "waittill_stack" );
    self._id_AEAF = undefined;
}

_id_B79F( var_0, var_1 )
{
    self endon( "waittill_stack" );
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = self;

    var_1 waittill( var_0, var_2, var_3, var_4, var_5, var_6, var_7 );

    if ( isdefined( var_2 ) )
        self._id_AEAF.a = var_2;

    if ( isdefined( var_3 ) )
        self._id_AEAF.b = var_3;

    if ( isdefined( var_4 ) )
        self._id_AEAF.c = var_4;

    if ( isdefined( var_5 ) )
        self._id_AEAF.d = var_5;

    if ( isdefined( var_6 ) )
        self._id_AEAF.e = var_6;

    if ( isdefined( var_7 ) )
        self._id_AEAF._id_B3CD = var_7;

    self notify( "waittill_stack", var_0, var_1 );
}

_id_A8B1()
{
    common_scripts\utility::run_thread_on_noteworthy( "fire_missile", vehicle_scripts\_attack_heli::boneyard_style_heli_missile_attack );
}

fire_missile( var_0, var_1 )
{
    var_2 = [];
    var_2[0] = "tag_missile_right";
    var_2[1] = "tag_missile_left";
    self setvehweapon( "littlebird_FFAR" );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        var_4 = var_0[var_3 % var_0.size];
        self setturrettargetent( var_4 );
        var_5 = self fireweapon( var_2[var_3 % var_2.size], var_4 );
        var_5 common_scripts\utility::delaycall( 1, ::missile_cleartarget );

        if ( isdefined( var_4.script_delay ) )
        {
            wait(var_4.script_delay);
            continue;
        }

        wait(randomfloatrange( 0.2, 0.3 ));
    }
}

_id_C970( var_0 )
{
    self.origin = var_0.origin;

    if ( isdefined( var_0.angles ) )
        self.angles = var_0.angles;

    var_1 = getentarray( self.target, "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( isspawner( var_3 ) )
            var_3.targetname = var_0.targetname;
    }

    self.target = var_0.targetname;
    var_5 = thread maps\_vehicle::spawn_vehicle_and_gopath();
    return var_5;
}

_id_B89F( var_0 )
{
    if ( !maps\_vehicle::ishelicopter() )
        self startpath( var_0 );

    thread maps\_vehicle::vehicle_paths( var_0 );
}

_id_C0AD( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        var_0.ignoreall = !common_scripts\utility::flag( "minigun_fire" );

        if ( common_scripts\utility::flag( "minigun_fire" ) )
        {
            common_scripts\utility::flag_waitopen( "minigun_fire" );
            continue;
        }

        common_scripts\utility::flag_wait( "minigun_fire" );
    }
}

_id_BB00( var_0 )
{
    if ( self == level.player )
    {
        self setorigin( var_0.origin );
        self setplayerangles( var_0.angles );
    }
    else
    {
        self.origin = var_0.origin;
        self.angles = var_0.angles;
    }
}

_id_AE86()
{
    common_scripts\utility::array_thread( getentarray( "delete_not_touching", "targetname" ), ::_id_B26D );
}

_id_B26D()
{
    self waittill( "trigger" );

    while ( level.player istouching( self ) )
        wait 0.5;

    common_scripts\utility::trigger_off();
}

_id_C971()
{
    self endon( "death" );

    for (;;)
    {
        if ( self vehicle_getspeed() < 5 )
        {
            wait 0.1;
            continue;
        }

        var_0 = self.origin;
        wait 0.1;
        var_1 = anglestoforward( self.angles );
        var_2 = self.origin + var_1 * 100;
        var_1 = anglestoright( self.angles );
        var_3 = self.origin - var_1 * 30;
        var_4 = self.origin + var_1 * 30;
        _id_C9E0( var_2, var_3, var_4 );
    }
}

_id_B9F6( var_0 )
{

}

_id_C9E0( var_0, var_1, var_2 )
{

}

draw_cross( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return;

    return;
}

_id_BB37( var_0 )
{
    if ( !isdefined( level._id_BB37 ) )
    {
        level._id_BB37 = spawnstruct();
        level._id_BB37._id_5769 = 0;
    }

    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = -80 + level._id_BB37._id_5769 * 14;
    var_1 settext( var_0 );
    var_1.fontscale = 1.46;
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1.horzalign = "center";
    var_1.vertalign = "bottom";
    var_1.sort = 1;
    var_1._id_B158 = var_0;
    var_2 = level._id_BB37._id_5769;
    var_1 thread _id_B31B( var_2 );
    level._id_BB37._id_5769++;
    var_3 = ( var_0.size + 1 ) / 50 + 1;
    wait(var_3);
    var_1 fadeovertime( 0.5 );
    var_1.alpha = 0;
    level._id_BB37._id_5769--;
    wait 0.5;
    level._id_BB37 notify( "move", var_2 );
    var_1 notify( "destoyed" );
    var_1 destroy();
}

_id_B31B( var_0 )
{
    self endon( "destoyed" );

    for (;;)
    {
        level._id_BB37 waittill( "move", var_1 );

        if ( var_1 > var_0 || var_0 == 0 )
            continue;

        self moveovertime( 0.5 );
        self.y -= 14;
        var_0--;
    }
}

_id_C4FD()
{
    var_0 = getallvehiclenodes();
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3.spawnflags ) && var_3.spawnflags & 1 )
            var_1[var_1.size] = var_3;
    }

    foreach ( var_3 in var_1 )
        level _id_C7C5( var_3 );
}

_id_C7C5( var_0 )
{
    for ( var_1 = ( randomfloatrange( 0, 1 ), randomfloatrange( 0, 1 ), randomfloatrange( 0, 1 ) ); isdefined( var_0.target ); var_3 = var_0.origin )
    {
        var_2 = var_0.origin;
        var_0 = getvehiclenode( var_0.target, "targetname" );
    }
}

_id_D1DD( var_0 )
{
    self notify( "new_debug" );
    self endon( "new_debug" );
    self endon( "death" );

    for (;;)
    {
        wait 0.05;

        if ( getdvarint( "debug_stance", 0 ) )
        {
            if ( var_0 == "stand" )
                continue;
        }
    }
}

_id_CE3E()
{
    level.difficultysettings["threatbias"]["easy"] = 0;
    level.difficultysettings["threatbias"]["normal"] = 0;
    level.difficultysettings["threatbias"]["hardened"] = 0;
    level.difficultysettings["threatbias"]["veteran"] = 0;
    level.difficultysettings["base_enemy_accuracy"]["easy"] = 1.0;
    level.difficultysettings["base_enemy_accuracy"]["normal"] = 1.0;
    level.difficultysettings["base_enemy_accuracy"]["hardened"] = 1.0;
    level.difficultysettings["base_enemy_accuracy"]["veteran"] = 1.0;
    level.difficultysettings["accuracyDistScale"]["easy"] = 1.0;
    level.difficultysettings["accuracyDistScale"]["normal"] = 1.0;
    level.difficultysettings["accuracyDistScale"]["hardened"] = 1.0;
    level.difficultysettings["accuracyDistScale"]["veteran"] = 1.0;
    level.difficultysettings["pain_test"]["easy"] = maps\_gameskill::always_pain;
    level.difficultysettings["pain_test"]["normal"] = maps\_gameskill::always_pain;
    level.difficultysettings["pain_test"]["hardened"] = maps\_gameskill::always_pain;
    level.difficultysettings["pain_test"]["veteran"] = maps\_gameskill::always_pain;
    level.difficultysettings["player_deathInvulnerableTime"]["easy"] = 800;
    level.difficultysettings["player_deathInvulnerableTime"]["normal"] = 600;
    level.difficultysettings["player_deathInvulnerableTime"]["hardened"] = 400;
    level.difficultysettings["player_deathInvulnerableTime"]["veteran"] = 200;
    level.difficultysettings["invulTime_preShield"]["easy"] = 0.0;
    level.difficultysettings["invulTime_preShield"]["normal"] = 0.0;
    level.difficultysettings["invulTime_preShield"]["hardened"] = 0.0;
    level.difficultysettings["invulTime_preShield"]["veteran"] = 0.0;
    level.difficultysettings["invulTime_onShield"]["easy"] = 0.5;
    level.difficultysettings["invulTime_onShield"]["normal"] = 0.5;
    level.difficultysettings["invulTime_onShield"]["hardened"] = 0.5;
    level.difficultysettings["invulTime_onShield"]["veteran"] = 0.5;
    level.difficultysettings["invulTime_postShield"]["easy"] = 0.3;
    level.difficultysettings["invulTime_postShield"]["normal"] = 0.3;
    level.difficultysettings["invulTime_postShield"]["hardened"] = 0.3;
    level.difficultysettings["invulTime_postShield"]["veteran"] = 0.3;
    level.difficultysettings["playerHealth_RegularRegenDelay"]["easy"] = 500;
    level.difficultysettings["playerHealth_RegularRegenDelay"]["normal"] = 500;
    level.difficultysettings["playerHealth_RegularRegenDelay"]["hardened"] = 500;
    level.difficultysettings["playerHealth_RegularRegenDelay"]["veteran"] = 500;
    level.difficultysettings["worthyDamageRatio"]["easy"] = 0.2;
    level.difficultysettings["worthyDamageRatio"]["normal"] = 0.2;
    level.difficultysettings["worthyDamageRatio"]["hardened"] = 0.2;
    level.difficultysettings["worthyDamageRatio"]["veteran"] = 0.2;
    level.difficultysettings["health_regenRate"]["easy"] = 0.01;
    level.difficultysettings["health_regenRate"]["normal"] = 0.008;
    level.difficultysettings["health_regenRate"]["hardened"] = 0.008;
    level.difficultysettings["health_regenRate"]["veteran"] = 0.008;
    level.difficultysettings["playerDifficultyHealth"]["easy"] = 1000;
    level.difficultysettings["playerDifficultyHealth"]["normal"] = 800;
    level.difficultysettings["playerDifficultyHealth"]["hardened"] = 600;
    level.difficultysettings["playerDifficultyHealth"]["veteran"] = 500;
    level.difficultysettings["longRegenTime"]["easy"] = 1000;
    level.difficultysettings["longRegenTime"]["normal"] = 1000;
    level.difficultysettings["longRegenTime"]["hardened"] = 1000;
    level.difficultysettings["longRegenTime"]["veteran"] = 1000;
    level.difficultysettings["healthOverlayCutoff"]["easy"] = 0.02;
    level.difficultysettings["healthOverlayCutoff"]["normal"] = 0.02;
    level.difficultysettings["healthOverlayCutoff"]["hardened"] = 0.02;
    level.difficultysettings["healthOverlayCutoff"]["veteran"] = 0.02;
}
#using_animtree("player");

_id_CDBB()
{
    var_0 = 0.1;
    var_1 = 20;
    var_2 = 80;
    level.player.rig setanimlimited( %h2_boneyard_player_turn_reaction_left_add, 1, var_0 );
    level.player.rig setanimlimited( %h2_boneyard_player_turn_reaction_right_add, 1, var_0 );
    level.player.rig setanimlimited( %player_uaz_additive_turn_left, 0.0, var_0 );
    level.player.rig setanimlimited( %player_uaz_additive_turn_right, 0.0, var_0 );

    for (;;)
    {
        var_3 = level._id_BE0D vehicle_getbodyvelocity();
        var_4 = 0;
        var_5 = 0;

        if ( abs( var_3[1] ) > var_1 )
        {
            var_6 = clamp( ( abs( var_3[1] ) - var_1 ) / ( var_2 - var_1 ), 0, 1 );

            if ( var_3[1] > var_1 )
                var_5 = var_6;
            else
                var_4 = var_6;
        }

        level.player.rig setanimlimited( %player_uaz_additive_turn_right, var_5, var_0 );
        level.player.rig setanimlimited( %player_uaz_additive_turn_left, var_4, var_0 );
        waitframe();
    }
}

portal_groups_init()
{
    var_0 = getentarray( "portal_group", "classname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( issubstr( var_3.targetname, "portal_group_" ) )
            var_1[var_1.size] = var_3;
    }

    foreach ( var_3 in var_1 )
    {
        common_scripts\utility::flag_init( var_3.targetname );

        if ( !isdefined( var_3.script_noteworthy ) || issubstr( var_3.script_noteworthy, level.start_point + "," ) || maps\_utility::is_no_game_start() )
            common_scripts\utility::flag_set( var_3.targetname );
    }

    common_scripts\utility::array_thread( var_1, ::portal_group );
}

portal_group()
{
    for (;;)
    {
        if ( common_scripts\utility::flag( self.targetname ) )
        {
            enablepg( self.targetname, 1 );
            common_scripts\utility::flag_waitopen( self.targetname );
        }
        else
        {
            enablepg( self.targetname, 0 );
            common_scripts\utility::flag_wait( self.targetname );
        }

        wait 0.05;
    }
}

viewhands_wibble_modifier()
{
    var_0 = 0.5;
    var_1 = 0.5;
    var_2 = 1;
    var_3 = 2;
    _func_2F1( 0, "xy", var_0, var_1 );
    common_scripts\utility::flag_wait( "uaz_mount_end" );
    _func_2F1( 0, "xy", var_2, var_3 );
}

bya_smodel_groups_init()
{
    if ( maps\_utility::is_no_game_start() )
        return;

    var_0 = [ 1, 2, 3, 4, 5, 6, 7 ];

    foreach ( var_2 in var_0 )
        common_scripts\utility::flag_init( "smodelgroup_" + var_2 );

    switch ( level.start_point )
    {
        case "intro":
            break;
        case "road":
            common_scripts\utility::flag_set( "smodelgroup_2" );
            common_scripts\utility::flag_set( "smodelgroup_3" );
            break;
        case "flyby":
            common_scripts\utility::flag_set( "smodelgroup_2" );
            common_scripts\utility::flag_set( "smodelgroup_3" );
            break;
        case "higround":
            common_scripts\utility::flag_set( "smodelgroup_2" );
            common_scripts\utility::flag_set( "smodelgroup_3" );
            common_scripts\utility::flag_set( "smodelgroup_4" );
            common_scripts\utility::flag_set( "smodelgroup_6" );
            common_scripts\utility::flag_set( "smodelgroup_7" );
            break;
        case "ride":
            common_scripts\utility::flag_set( "smodelgroup_1" );
            common_scripts\utility::flag_set( "smodelgroup_2" );
            common_scripts\utility::flag_set( "smodelgroup_3" );
            common_scripts\utility::flag_set( "smodelgroup_4" );
            common_scripts\utility::flag_set( "smodelgroup_5" );
            common_scripts\utility::flag_set( "smodelgroup_6" );
            common_scripts\utility::flag_set( "smodelgroup_7" );
            break;
        case "ride_end":
            common_scripts\utility::flag_set( "smodelgroup_1" );
            common_scripts\utility::flag_set( "smodelgroup_2" );
            common_scripts\utility::flag_set( "smodelgroup_3" );
            common_scripts\utility::flag_set( "smodelgroup_7" );
            break;
        default:
            break;
    }

    foreach ( var_2 in var_0 )
        thread smodel_group( var_2 );
}

smodel_group( var_0 )
{
    for (;;)
    {
        if ( common_scripts\utility::flag( "smodelgroup_" + var_0 ) )
            _func_31B( var_0 );
        else
            _func_31C( var_0 );

        level waittill( "smodelgroup_" + var_0 );
    }
}

animatevariousmodel( var_0, var_1, var_2 )
{
    self.animname = var_0;
    maps\_anim::setanimtree();

    if ( isdefined( var_1 ) )
        common_scripts\utility::flag_wait( var_1 );

    var_3 = maps\_utility::getanim( "idle" );
    self setanim( var_3 );
    var_4 = randomfloat( 1 );
    self setanimtime( var_3, var_4 );

    if ( isdefined( var_2 ) )
    {
        common_scripts\utility::flag_wait( var_2 );
        self delete();
    }
}

resetangle()
{
    self.angles = ( 0.0, 0.0, 0.0 );
}

init_scope_fov_setup()
{
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 15 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 0 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.75 );
}
