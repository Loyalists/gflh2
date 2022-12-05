// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_B4BA()
{
    var_0 = self.script_speed;

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isdefined( var_1.vehicle ) )
            continue;

        if ( var_1.vehicle == level.player.vehicle )
        {
            var_1.vehicle._id_CA5C = var_0;

            if ( common_scripts\utility::flag( "player_zodiac_on_ground" ) && isdefined( self._id_B495 ) )
                var_1.vehicle.veh_topspeed = self._id_B495;
            else
                var_1.vehicle.veh_topspeed = var_1.vehicle._id_CA5C;

            continue;
        }

        var_1.vehicle.veh_topspeed = var_0;
    }
}

_id_AD51()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( var_0 maps\_utility::ent_flag_exist( "in_rapids" ) )
            var_0 maps\_utility::ent_flag_set( "in_rapids" );
    }
}

_id_B32C( var_0 )
{
    var_0 maps\_utility::ent_flag_init( "in_rapids" );

    if ( common_scripts\utility::flag( "rapids_trigger" ) )
        var_0 maps\_utility::ent_flag_set( "in_rapids" );

    var_1 = common_scripts\utility::ter_op( var_0.classname == "script_vehicle_zodiac_player", "_player", "" );

    if ( !var_0 maps\_utility::ent_flag( "in_rapids" ) )
        playfxontag( common_scripts\utility::getfx( "zodiac_wake_geotrail" + var_1 ), self, "tag_origin" );

    self._id_B7CE = common_scripts\utility::spawn_tag_origin();
    self._id_B7CE linkto( self, "tag_origin", ( 30.0, 0.0, 0.0 ), ( -90.0, 180.0, 0.0 ) );
    playfxontag( common_scripts\utility::getfx( "zodiac_splash_front" + var_1 ), self._id_B7CE, "tag_origin" );
    self notsolid();
    self hide();
    self endon( "death" );
    var_0 endon( "death" );
    thread _id_BB43( var_0 );
    self._id_B7CE thread _id_BB43( var_0 );
    var_0 maps\_utility::ent_flag_init( "in_air" );
    var_0 maps\_utility::ent_flag_init( "on_water" );
    childthread _id_D373( var_0 );
    childthread _id_BD93( var_0 );
    childthread _id_D4A1( var_0 );
    childthread _id_CBA9( var_0 );
    childthread _id_B66E( var_0 );
    self linkto( var_0, "tag_origin" );
}

_id_BB55()
{
    var_0 = getent( "ending_animated_chain01", "targetname" );
    var_0.animname = "chain";
    var_0 maps\_anim::setanimtree();
    var_0 thread maps\_anim::anim_loop_solo( var_0, "idle1" );
    var_1 = getent( "ending_animated_lamp01", "targetname" );
    var_1.animname = "light";
    var_1 maps\_anim::setanimtree();
    var_1 thread maps\_anim::anim_loop_solo( var_1, "idle1" );
}

_id_D373( var_0 )
{
    var_1 = 0;

    for (;;)
    {
        var_2 = var_0 gettagangles( "tag_origin" );
        var_3 = var_0 gettagorigin( "tag_origin" );
        var_4 = anglestoup( var_2 );
        var_5 = anglestoforward( var_2 );
        var_6 = var_3 + var_4 * 40 + var_5 * 80;
        var_7 = var_3 - var_4 * 10 + var_5 * 80;
        var_8 = bullettrace( var_6, var_7, 0, var_0, 0, 0, 0, 1, 0, 1, 0, 0 );

        if ( var_8["surfacetype"] == "water_waist" || var_8["surfacetype"] == "water_ankle" )
        {
            if ( !var_1 )
                var_0 maps\_utility::ent_flag_set( "on_water" );

            var_1 = 1;
        }
        else if ( var_1 )
        {
            var_0 maps\_utility::ent_flag_clear( "on_water" );
            var_1 = 0;
        }

        waitframe();
    }
}

_id_BD93( var_0 )
{
    for (;;)
    {
        var_0 waittill( "veh_leftground" );
        var_0 maps\_utility::ent_flag_set( "in_air" );
        var_0 waittill( "veh_landed" );
        var_0 maps\_utility::ent_flag_clear( "in_air" );
    }
}

_id_CBA9( var_0 )
{
    var_1 = common_scripts\utility::ter_op( var_0.classname == "script_vehicle_zodiac_player", "_player", "" );

    for (;;)
    {
        var_0 waittill( "zodiac_treadfx_stop" );
        var_0 _id_C49F( "StopFXOnTag", "zodiac_wake_geotrail" + var_1, self, "tag_origin" );
        var_0 waittill( "zodiac_treadfx_go" );
        var_0 _id_C49F( "PlayFXOnTag", "zodiac_wake_geotrail" + var_1, self, "tag_origin" );
    }
}

_id_B66E( var_0 )
{
    var_1 = common_scripts\utility::ter_op( var_0.classname == "script_vehicle_zodiac_player", "_player", "" );

    for (;;)
    {
        var_0 waittill( "zodiac_splash_front_stop" );
        var_0 _id_C49F( "StopFXOnTag", "zodiac_splash_front" + var_1, self._id_B7CE, "tag_origin" );
        var_0 waittill( "zodiac_splash_front_go" );
        var_0 _id_C49F( "PlayFXOnTag", "zodiac_splash_front" + var_1, self._id_B7CE, "tag_origin" );
    }
}

_id_D4A1( var_0 )
{
    for (;;)
    {
        var_1 = var_0 vehicle_getvelocity();
        var_2 = anglestoaxis( var_0.angles );
        var_3 = vectordot( var_2["forward"], var_1 );
        var_4 = var_3 * 0.0568182;

        if ( var_4 < 4 || !var_0 maps\_utility::ent_flag( "on_water" ) || var_0 maps\_utility::ent_flag( "in_air" ) )
        {
            var_0 notify( "zodiac_treadfx_stop" );
            var_0 notify( "zodiac_splash_front_stop" );
        }
        else
        {
            if ( var_0 maps\_utility::ent_flag( "in_rapids" ) )
                var_0 notify( "zodiac_treadfx_stop" );
            else
                var_0 notify( "zodiac_treadfx_go" );

            var_0 notify( "zodiac_splash_front_go" );
        }

        wait 0.05;
    }
}

_id_BB43( var_0 )
{
    var_0 common_scripts\utility::waittill_any( "stop_bike", "death", "kill_treadfx" );
    self delete();
}

_id_CAC1()
{
    var_0 = spawn( "script_model", self.origin );
    var_0 setmodel( self.model );
    var_0.angles = ( 0, self.angles[1], 0 );
    var_0 thread _id_B32C( self );
}

_id_C7EB()
{
    var_0 = spawnstruct();
    var_0.origin = self.origin;
    var_0.angles = common_scripts\utility::flat_angle( self.angles );
    var_0.spawn_time = gettime();
    level._id_A855[level._id_A855.size] = var_0;
}

_id_C5BD()
{
    var_0 = getentarray( "script_vehicle", "code_classname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isspawner( var_3 ) )
            continue;

        var_4 = spawnstruct();
        var_4.classname = var_3.classname;
        var_4.origin = var_3.origin;
        var_4.angles = var_3.angles;
        var_4._id_C697 = var_3 vehicle_getspeed();
        var_4.script_vehiclespawngroup = var_3.script_vehiclespawngroup;
        var_4.script_vehiclestartmove = var_3.script_vehiclestartmove;
        var_4.model = var_3.model;
        var_4.angles = var_3.angles;

        if ( isdefined( level._id_C860 ) && var_3 == level._id_C860 )
            var_4._id_C860 = 1;

        var_1[var_1.size] = var_4;
    }

    common_scripts\utility::fileprint_launcher_start_file();
    common_scripts\utility::fileprint_map_start();

    foreach ( var_9, var_3 in var_1 )
    {
        var_7 = common_scripts\utility::fileprint_radiant_vec( var_3.origin );
        var_8 = common_scripts\utility::fileprint_radiant_vec( var_3.angles );
        common_scripts\utility::fileprint_map_entity_start();
        common_scripts\utility::fileprint_map_keypairprint( "classname", "script_struct" );
        common_scripts\utility::fileprint_map_keypairprint( "model", var_3.model );
        common_scripts\utility::fileprint_map_keypairprint( "origin", var_7 );
        common_scripts\utility::fileprint_map_keypairprint( "angles", var_8 );

        if ( isdefined( var_3._id_C697 ) )
            common_scripts\utility::fileprint_map_keypairprint( "current_speed", var_3._id_C697 );

        if ( isdefined( var_3.script_vehiclespawngroup ) )
            common_scripts\utility::fileprint_map_keypairprint( "script_vehiclespawngroup", var_3.script_vehiclespawngroup );

        if ( isdefined( var_3.script_vehiclestartmove ) )
            common_scripts\utility::fileprint_map_keypairprint( "script_vehiclestartmove", var_3.script_vehiclestartmove );

        common_scripts\utility::fileprint_map_entity_end();
    }

    var_10 = level.script + "_veh_ref.map";
    common_scripts\utility::fileprint_launcher_end_file( "/map_source/" + var_10 );
    common_scripts\utility::launcher_write_clipboard( var_10 );
}

_id_CB39( var_0, var_1, var_2 )
{
    if ( !common_scripts\utility::flag( "debug_crumbs" ) )
        return;

    var_3 = var_0.origin + anglestoright( var_0.angles ) * -1000;
    var_4 = var_0.origin + anglestoright( var_0.angles ) * 1000;
    var_5 = ( var_2, 1 - var_2, 0 );

    if ( !isdefined( var_1 ) )
        return;

    var_6 = var_1.origin + anglestoright( var_1.angles ) * -1000;
    var_7 = var_1.origin + anglestoright( var_1.angles ) * 1000;
}

_id_ACA8()
{
    self._id_CB26 = 500;
    self._id_CD15 = -1;
    self.event = [];
    self.event["jump"] = [];
    self.event["jump"]["driver"] = 0;
    self.event["jump"]["passenger"] = 0;
    self.event["bump"] = [];
    self.event["bump"]["driver"] = 0;
    self.event["bump"]["passenger"] = 0;
    self.event["bump_big"] = [];
    self.event["bump_big"]["driver"] = 0;
    self.event["bump_big"]["passenger"] = 0;
    self.event["sway_left"] = [];
    self.event["sway_left"]["driver"] = 0;
    self.event["sway_left"]["passenger"] = 0;
    self.event["sway_right"] = [];
    self.event["sway_right"]["driver"] = 0;
    self.event["sway_right"]["passenger"] = 0;
    childthread _id_D16E();
    childthread _id_D29D();
    childthread _id_CDF7();
    childthread _id_D4F9();
    childthread _id_C610();
    childthread _id_BF25();

    if ( self.classname == "script_vehicle_zodiac_player" )
        childthread _id_D112();
}

_id_B2A6( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 && !maps\_utility::ent_flag( "on_water" ) )
        return;

    var_2 = "tag_origin";

    if ( isdefined( level._id_C5CC[var_0] ) )
        var_2 = level._id_C5CC[var_0];

    if ( isdefined( level._effect[var_0] ) )
        _id_C49F( "PlayFXOnTag", var_0, self, var_2 );

    if ( var_0 == "player_zodiac_bumpbig" )
        wet_price();

    if ( isdefined( level._id_AD4D[var_0] ) )
        _id_C49F( "play_sound_on_entity", var_0 );
}

_id_C49F( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();

    if ( isdefined( var_2 ) )
        var_5 = var_2 getentitynumber();
    else
        var_5 = self getentitynumber();

    if ( !isdefined( self._id_C9E5[var_5] ) )
        self._id_C9E5[var_5] = [];

    var_4._id_BE05 = var_0;
    var_4._id_B9B5 = var_2;
    var_4._id_AFBD = var_3;

    if ( var_0 != "play_sound_on_entity" )
        var_4._id_CD88 = common_scripts\utility::getfx( var_1 );
    else
        var_4._id_CD88 = level._id_AD4D[var_1];

    self._id_C9E5[var_5] = common_scripts\utility::array_add( self._id_C9E5[var_5], var_4 );
}

_id_D05C()
{
    self endon( "death" );
    self._id_C9E5 = [];

    for (;;)
    {
        var_0 = 0;

        while ( self._id_C9E5.size )
        {
            foreach ( var_4, var_2 in self._id_C9E5 )
            {
                var_3 = common_scripts\utility::array_first( var_2 );

                switch ( var_3._id_BE05 )
                {
                    case "PlayFXOnTag":
                        playfxontag( var_3._id_CD88, var_3._id_B9B5, var_3._id_AFBD );
                        break;
                    case "StopFXOnTag":
                        stopfxontag( var_3._id_CD88, var_3._id_B9B5, var_3._id_AFBD );
                        break;
                    case "play_sound_on_entity":
                        thread maps\_utility::play_sound_on_entity( var_3._id_CD88 );
                        break;
                    default:
                        break;
                }

                var_2 = common_scripts\utility::array_remove( var_2, var_3 );
                self._id_C9E5[var_4] = common_scripts\utility::ter_op( var_2.size, var_2, undefined );
            }

            var_0++;

            if ( var_0 >= 3 )
            {
                var_0 = 0;
                waitframe();
            }
        }

        waitframe();
    }
}

_id_D29D()
{
    self endon( "death" );
    self endon( "zodiac_fall_over_waterfall" );
    common_scripts\utility::flag_wait( "player_on_boat" );

    for (;;)
    {
        self waittill( "veh_leftground" );
        self._id_CD15 = gettime();
        self.event["jump"]["driver"] = 1;
        self.event["jump"]["passenger"] = 1;
        thread maps\af_chase_aud::_id_BB8C();
    }
}

_id_CDF7()
{
    self endon( "death" );
    wait 2;
    common_scripts\utility::flag_wait( "player_on_boat" );

    for (;;)
    {
        self waittill( "veh_landed" );
        self.event["jump"]["driver"] = 0;
        self.event["jump"]["passenger"] = 0;

        if ( self._id_CD15 + self._id_CB26 < gettime() )
        {
            self.event["bump_big"]["driver"] = 1;
            self.event["bump_big"]["passenger"] = 1;

            if ( !common_scripts\utility::flag( "player_in_sight_of_boarding" ) )
                thread _id_AB5C( "bump_big" );

            if ( self == level._id_B538 )
                _id_B2A6( "player_zodiac_bumpbig" );
            else
                _id_B2A6( "zodiac_bumpbig" );

            continue;
        }

        self.event["bump"]["driver"] = 1;
        self.event["bump"]["passenger"] = 1;

        if ( !common_scripts\utility::flag( "player_in_sight_of_boarding" ) )
            thread _id_AB5C( "bump" );

        if ( self == level._id_B538 )
        {
            _id_B2A6( "player_zodiac_bump" );
            continue;
        }

        _id_B2A6( "zodiac_bump" );
    }
}

_id_B7F5( var_0, var_1 )
{
    self waittill( "trigger" );
    _id_B4E8( var_0, var_1 );
}

_id_B4E8( var_0, var_1 )
{
    level._id_D3F6["bump"] = level._id_D3F6[var_0];
    level._id_D3F6["bump_big"] = level._id_D3F6[var_1];
}

_id_AB5C( var_0 )
{
    if ( !isdefined( level._id_B538 ) || self != level._id_B538 )
        return;

    level endon( "missionfailed" );

    if ( common_scripts\utility::flag( "missionfailed" ) )
        return;

    if ( var_0 == "bump_big" )
        level.player playrumblelooponentity( "damage_heavy" );
    else
        level.player playrumblelooponentity( "damage_light" );

    thread _id_C2A5( var_0 );
}

_id_C2A5( var_0 )
{
    if ( common_scripts\utility::flag( "rapids_head_bobbing" ) )
        return;

    if ( common_scripts\utility::flag( "price_anim_on_boat" ) )
        return;

    if ( level.price maps\_utility::ent_flag( "transitioning_positions" ) )
        return;

    var_1 = level.price.a._id_CE90 + "_react_" + var_0;
    level.price maps\_utility::ent_flag_set( "transitioning_positions" );
    _id_D1EF( var_1 );
    level.price maps\_utility::ent_flag_clear( "transitioning_positions" );
}

_id_D4F9()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_on_boat" );

    for (;;)
    {
        self waittill( "veh_jolt", var_0 );

        if ( var_0[1] >= 0 )
        {
            self.event["sway_left"]["driver"] = 1;
            self.event["sway_left"]["passenger"] = 1;
            _id_B2A6( "zodiac_sway_left", 1 );
            continue;
        }

        self.event["sway_right"]["driver"] = 1;
        self.event["sway_right"]["passenger"] = 1;
        _id_B2A6( "zodiac_sway_right", 1 );
    }
}

_id_D112()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_on_boat" );

    for (;;)
    {
        self waittill( "veh_wall_hit" );
        thread _id_C2A5( "bump_big" );
    }
}

_id_C610()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_on_boat" );

    for (;;)
    {
        self waittill( "veh_boatbounce", var_0 );

        if ( var_0 < 50.0 )
            continue;

        if ( var_0 < 65.0 )
        {
            _id_B2A6( "zodiac_bounce_small_left" );
            _id_B2A6( "zodiac_bounce_small_right" );
            continue;
        }

        _id_B2A6( "zodiac_bounce_large_left" );
        _id_B2A6( "zodiac_bounce_large_right" );
    }
}

_id_BF25()
{
    self endon( "death" );
    var_0 = common_scripts\utility::ter_op( self.classname == "script_vehicle_zodiac_player", "_player", "" );

    for (;;)
    {
        var_1 = self vehicle_getbodyvelocity();

        if ( self vehicle_getspeed() > 10 )
        {
            if ( var_1[1] < -30.0 )
                _id_B2A6( "zodiac_sway_right_light" + var_0, 1 );
            else if ( var_1[1] > 30.0 )
                _id_B2A6( "zodiac_sway_left_light" + var_0, 1 );
        }
        else if ( self vehicle_getspeed() > 70 )
        {
            if ( var_1[1] < -70.0 )
                _id_B2A6( "zodiac_sway_right" + var_0, 1 );
            else if ( var_1[1] > 70.0 )
                _id_B2A6( "zodiac_sway_left" + var_0, 1 );
        }

        wait 0.05;
    }
}

_id_CE7F()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "veh_collision", var_0, var_1 );

        foreach ( var_3 in self.riders )
        {
            if ( isalive( var_3 ) && !isdefined( var_3.magic_bullet_shield ) )
                var_3 kill();
        }

        _id_B2A6( "zodiac_collision" );
    }
}

_id_D16E()
{
    self endon( "death" );
    var_0 = self vehicle_getvelocity();

    for (;;)
    {
        self.prevframevelocity = var_0;
        var_0 = self vehicle_getvelocity();
        wait 0.05;
    }
}

_id_B21C()
{
    self waittill( "trigger" );

    if ( isdefined( self.targetname ) )
        maps\_utility::autosave_by_name( self.targetname );
    else
        maps\_utility::autosave_by_name( "boat_chase" );
}

_id_D462()
{
    return _id_C15C() < 0.5;
}

_id_C15E()
{
    return level._id_B538 vehicle_getspeed() > 20;
}

_id_C15C()
{
    if ( !level._id_A855.size )
        return 0;

    var_0 = level._id_A855[0];
    var_1 = ( gettime() - var_0.spawn_time ) / 1000;
    return var_1 / level._id_C4FA.fail_time;
}

_id_B523()
{
    var_0 = gettime();
    var_1 = undefined;
    var_2 = [];
    var_3 = 0;

    for ( var_4 = 0; var_4 < level._id_A855.size; var_4++ )
    {
        var_5 = level._id_A855[var_4];
        var_6 = ( var_0 - var_5.spawn_time ) / 1000;
        var_7 = var_6 / level._id_C4FA.fail_time;

        if ( var_7 > 1 )
            _id_AB10();

        if ( !var_3 )
            _id_C072( var_7 );

        if ( var_3 < level._id_C4FA._id_B29A )
            var_2[var_3] = var_5;

        if ( _id_C67F() )
            _id_CB39( var_5, var_1, var_7 );

        var_1 = var_5;
        var_3++;
    }

    foreach ( var_5 in var_2 )
    {
        var_9 = anglestoforward( var_5.angles );
        var_10 = vectornormalize( level.player.origin - var_5.origin );
        var_11 = vectordot( var_9, var_10 );

        if ( var_11 > 0 )
            level._id_A855 = common_scripts\utility::_id_AC53( level._id_A855, var_5 );
    }
}

_id_C072( var_0 )
{
    if ( var_0 < 0.25 )
        common_scripts\utility::flag_set( "zodiac_catchup" );
    else
        common_scripts\utility::flag_clear( "zodiac_catchup" );
}

_id_AB10()
{
    if ( !isalive( level.player ) )
        return;

    level notify( "stop_deadquote_for_gettingout_of_bounds" );
    common_scripts\utility::flag_set( "shepherd_got_away" );
    setdvar( "ui_deadquote", &"AF_CHASE_MISSION_FAILED_KEEP_UP" );

    if ( level.start_point != "test_boat_current" )
        maps\_utility::missionfailedwrapper();
}

_id_C67F()
{
    return getdvarint( "scr_debug_breadcrumbs" );
}

_id_B3A0()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_on_boat" );

    for (;;)
    {
        level waittill( "zodiac_catchup" );

        if ( common_scripts\utility::flag( "zodiac_boarding" ) )
            return;

        if ( common_scripts\utility::flag( "zodiac_catchup" ) )
        {
            var_0 = level._id_B538 vehicle_getspeed() + 5;

            if ( self vehicle_getspeed() < var_0 )
                self vehicle_setspeed( var_0, 15, 15 );

            var_0 = undefined;
            continue;
        }

        self resumespeed( 15 );
    }
}

_id_CEB3()
{
    var_0 = level._id_B538 vehicle_getspeed() + 5;

    if ( self vehicle_getspeed() < var_0 )
        self vehicle_setspeed( var_0, 15, 15 );
}

_id_B857()
{
    if ( !isdefined( self.targetname ) )
        return 0;

    return self.targetname == "enemy_chase_boat";
}

_id_AEBB( var_0 )
{
    if ( !isai( self ) )
        return;

    self notify( "newanim" );
    self.desired_anim_pose = "crouch";
    self allowedstances( "crouch" );
    thread animscripts\utility::updateanimpose();
    self allowedstances( "crouch" );
    self.baseaccuracy = 0;
    self.accuracystationarymod = 0.5;
}

_id_BBD3()
{
    self waittill( "trigger", var_0 );
    level._id_B538 endon( "death" );
    var_0 thread maps\_vehicle::mgoff();
    var_0 endon( "death" );
    var_0 thread _id_BEF7();

    while ( distance( level.player.origin, self.origin ) > 8500 )
        wait 0.05;

    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "scn_helicopter_01_lp" );

    if ( !isdefined( var_0.targetname ) || var_0.targetname != "heli_no_turret" )
        var_0 thread maps\_vehicle::mgon();

    foreach ( var_2 in var_0.mgturret )
    {
        var_2 setaispread( 2 );
        var_2 setconvergencetime( 5 );
        var_2.accuracy = 0.5;
    }

    if ( !common_scripts\utility::flag( "rapids_trigger" ) )
        level notify( "dialog_helicopter_ahead" );

    var_0 setlookatent( level.player );

    while ( _id_A958( level._id_B538, var_0 ) )
        wait 0.05;

    if ( !common_scripts\utility::flag( "rapids_trigger" ) )
        level notify( "dialog_helicopter_six" );

    foreach ( var_2 in var_0.mgturret )
    {
        var_2 setaispread( 20 );
        var_2 setconvergencetime( 7 );
        var_2.accuracy = 0;
    }

    wait 3;
    var_0 thread maps\_vehicle::mgoff();
}

new_helicopter_setup()
{
    foreach ( var_1 in self.mgturret )
    {
        var_1 setaispread( 20 );
        var_1 setconvergencetime( 7 );
        var_1.accuracy = 0;
    }
}

_id_CD33()
{
    var_0 = maps\_utility::get_rumble_ent();
    var_1 = 3.4;
    var_2 = 0.01;
    var_3 = 0;
    var_4 = 0.13;

    for (;;)
    {
        var_5 = self vehicle_getthrottle();
        var_3 += 0.05;

        if ( var_5 < 0.5 )
        {
            var_3 = 0;
            var_6 = 1;
        }
        else
            var_6 = 1 - var_3 / var_1;

        var_0.intensity = var_5 * var_4 * var_6;

        if ( var_3 > var_1 || self vehicle_getspeed() > 43 )
        {
            var_3 = var_1;
            var_0.intensity = 0;
        }

        wait 0.05;

        if ( common_scripts\utility::flag( "player_in_sight_of_boarding" ) )
            break;
    }

    var_0 delete();
}

_id_C4B8()
{
    var_0 = getent( self.target, "targetname" );
    self waittill( "trigger" );
    var_1 = getaiarray();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 istouching( var_0 ) && !var_3 maps\_utility::is_hero() )
            var_3 delete();
    }

    var_5 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_6 = 0;

    foreach ( var_8 in level.createfxent )
    {
        var_6++;

        if ( isdefined( var_8.looper ) )
        {
            level.createfxent = common_scripts\utility::array_remove( level.createfxent, var_8 );
            var_5.origin = var_8.v["origin"];

            if ( var_5 istouching( var_0 ) )
                var_8.looper delete();
        }

        if ( var_6 > 3 )
        {
            var_6 = 0;
            wait 0.05;
        }
    }

    var_5 delete();
}

_id_BE9D()
{
    var_0 = getentarray( "kill_ai_in_volume", "targetname" );

    foreach ( var_2 in var_0 )
    {
        wait 0.1;
        var_2 notify( "trigger", level.player );
    }
}

_id_AEB4()
{
    var_0 = getent( self.target, "targetname" );
    self waittill( "trigger" );
    var_1 = getentarray( "destructible_toy", "targetname" );
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        var_4 _id_C0B6( var_0 );
        var_2++;

        if ( var_2 > 3 )
        {
            var_2 = 0;
            wait 0.05;
        }
    }

    var_1 = getentarray( "explodable_barrel", "targetname" );

    foreach ( var_4 in var_1 )
    {
        var_4 _id_C0B6( var_0 );
        var_2++;

        if ( var_2 > 3 )
        {
            var_2 = 0;
            wait 0.05;
        }
    }
}

_id_C0B6( var_0 )
{
    if ( !self istouching( var_0 ) )
        return;

    self notify( "delete_destructible" );
    self delete();
}

_id_B34E()
{
    self.originheightoffset = undefined;
}

_id_D4C6()
{
    self waittill( "trigger" );
    var_0 = getent( self.target, "targetname" );
    var_1 = 600;

    if ( isdefined( var_0.radius ) )
        var_1 = var_0.radius;

    var_2 = 3;
    _id_AF37( var_2, var_1, var_0.origin );
}

_id_AF37( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::get_array_of_closest( var_2, getentarray( "destructible_toy", "targetname" ), undefined, var_0, var_1, 0 );

    foreach ( var_5 in var_3 )
    {
        wait(randomfloatrange( 0.1, 0.4 ));
        thread _id_C1AA( var_5 );
    }
}

_id_C1AA( var_0 )
{
    for ( var_1 = 0; var_1 < 5; var_1++ )
    {
        var_0 notify( "damage", 160, level.player, self.origin, var_0.origin, "MOD_PISTOL_BULLET", "", "" );
        wait(randomfloatrange( 0.1, 0.2 ));
    }
}

_id_A976()
{
    common_scripts\utility::flag_wait( "player_on_boat" );
    level._id_B538 endon( "death" );

    for (;;)
    {
        _id_A875();
        wait 0.05;
    }
}

_id_A875( var_0, var_1 )
{
    var_2 = getentarray( "script_vehicle_zodiac_physics", "classname" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( var_5 == level._id_B538 )
            continue;

        if ( isspawner( var_5 ) )
            continue;

        if ( !_id_C0C8( var_5 ) )
            continue;

        var_5 thread _id_A9BB();
    }

    return var_3;
}

_id_A9BB()
{
    self notify( "raise_attacker_accuracy_while_in_range" );
    self endon( "raise_attacker_accuracy_while_in_range" );
    self endon( "death" );

    foreach ( var_1 in self.riders )
    {
        var_1.baseaccuracy = 6;
        var_1.suppressionwait = 1000;
    }

    while ( _id_C0C8( self ) )
        wait 0.05;

    foreach ( var_1 in self.riders )
        var_1.baseaccuracy = 0;
}

_id_C0C8( var_0 )
{
    if ( common_scripts\utility::flag( "player_in_open" ) )
        return 1;

    if ( distancesquared( var_0.origin, level._id_B538.origin ) > 1960000 )
        return 0;

    var_1 = maps\_utility::get_dot( level._id_B538.origin, level._id_B538.angles, var_0.origin );

    if ( var_1 < 0.642787 )
        return 0;

    return 1;
}

_id_C575( var_0, var_1, var_2 )
{
    level._id_B7A5 = var_0;
    var_3 = var_1 - level._id_C98C;

    if ( var_3 == 0 )
        return;

    var_4 = abs( var_3 / var_2 );
    level notify( "conveyerbelt_speed" );
    level endon( "conveyerbelt_speed" );
    var_5 = int( var_4 / 0.05 );
    var_6 = 0;

    if ( var_5 != 0 )
        var_6 = var_3 / var_5;
    else
        return;

    for ( var_7 = 0; var_7 < var_5; var_7++ )
    {
        wait 0.05;
        level._id_C98C += var_6;
    }

    level._id_C98C = var_1;
}

_id_B382()
{
    var_0 = 1;
    var_1 = 20;
    var_2 = level._id_B538 vehicle_getvelocity();
    var_3 = distance( var_2, ( 0.0, 0.0, 0.0 ) ) / 17.6;
    var_2 = common_scripts\utility::flat_origin( var_2 );
    var_4 = vectornormalize( var_2 );
    var_5 = anglestoforward( ( 0, level._id_B7A5, 0 ) );
    var_6 = vectordot( var_5, var_4 );

    if ( common_scripts\utility::flag( "enemy_heli_takes_off" ) )
        var_0 = 1;

    if ( var_3 > 40 )
        var_0 = 0;
    else if ( var_3 < 20 )
        var_0 = 1;
    else
    {
        var_7 = var_3 - 20;
        var_0 = 1 - var_7 / var_1;
    }

    level._id_B382 = level._id_C98C * var_0;
    level._id_B382 *= level._id_BAFC;
    self vehphys_setconveyorbelt( level._id_B7A5, level._id_B382 );
}

_id_BEA2( var_0, var_1 )
{
    level notify( "conveyerbelt_set_speed_fraction" );
    level endon( "conveyerbelt_set_speed_fraction" );

    if ( var_1 == 0 )
    {
        level._id_BAFC = var_0;
        return;
    }

    var_2 = level._id_BAFC;
    var_3 = int( var_1 * 20 );
    var_4 = ( var_0 - var_2 ) / var_3;

    for ( var_5 = 0; var_5 < var_3; var_5++ )
    {
        level._id_BAFC += var_4;
        wait 0.05;
    }

    level._id_BAFC = var_0;
}

_id_C596()
{
    _id_BEA2( 1 );
}

_id_B6E4()
{
    self endon( "death" );

    if ( issubstr( self.classname, "shepherd" ) )
        return;

    while ( !self cansee( level.player ) && distance( self.origin, level.player.origin ) > 3500 )
        wait 0.1;

    self.fixednode = 1;
    self.pathenemyfightdist = 0;
    self.pathenemylookahead = 0;
}

_id_CDF1( var_0 )
{
    level notify( "new_river_current" );
    level endon( "new_river_current" );
    var_1 = common_scripts\utility::getstruct( var_0, "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_3 = cos( 35 );
    var_4 = 45;
    var_5 = var_4;
    var_6 = cos( 3 );
    var_7 = 10;

    if ( isdefined( var_1.script_speed ) )
        var_7 = var_1.script_speed;

    var_8 = _id_C5F6( var_2 );
    level._id_C98C = 4;
    common_scripts\utility::flag_wait( "player_on_boat" );
    level._id_B538 endon( "death" );
    level endon( "player_over_the_waterfall" );
    level endon( "water_cliff_jump_splash_sequence" );
    childthread _id_CF3F();
    var_9 = ( 0.0, 0.0, 0.0 );

    for (;;)
    {
        var_10 = maps\_utility::get_dot( var_2.origin, var_8, level._id_B538.origin );

        if ( var_10 < 0 )
        {
            var_10 = maps\_utility::get_dot( var_1.origin, common_scripts\utility::flat_angle( vectortoangles( var_2.origin - var_1.origin ) ), level._id_B538.origin );

            if ( var_10 > 0 )
            {
                wait 0.05;
                continue;
            }
            else
            {
                var_1 = common_scripts\utility::getstruct( var_1.targetname, "target" );

                if ( !isdefined( var_1 ) )
                {
                    var_1 = common_scripts\utility::getstruct( var_2.targetname, "target" );
                    level._id_B538 thread _id_C575( var_9[1], 0, 4 );
                }
            }
        }
        else
            var_1 = var_2;

        if ( isdefined( var_1.script_speed ) )
            var_7 = var_1.script_speed;

        if ( !isdefined( var_1.target ) )
            break;

        if ( var_7 > var_5 )
            var_4 = var_7 + 20;
        else
            var_4 = var_5;

        var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );

        if ( !isdefined( var_2 ) )
        {
            var_2 = var_1;
            var_1 = common_scripts\utility::getstruct( var_2.targetname, "target" );
            wait 0.05;
            continue;
        }

        if ( isdefined( var_2.target ) )
            var_8 = _id_C5F6( var_2 );

        var_11 = var_7;
        var_9 = common_scripts\utility::flat_angle( vectortoangles( var_2.origin - var_1.origin ) );
        var_10 = maps\_utility::get_dot( var_1.origin, var_9, var_2.origin );
        var_10 = abs( var_10 );

        if ( var_10 > var_6 )
            var_11 = var_7;
        else if ( var_10 < var_3 )
            var_11 = var_4;
        else
            var_11 = var_3 / var_10 * var_4;

        level._id_AA19 = var_11;
        level._id_B538 childthread _id_C575( var_9[1], var_11, 4 );
        wait 0.05;
    }

    level._id_B538 childthread _id_C575( 0, 0, 4 );
}

_id_CF3F()
{
    if ( !isdefined( level._id_BAFC ) )
        level._id_BAFC = 1;

    while ( !isdefined( level._id_B7A5 ) )
        wait 0.05;

    level._id_B538 endon( "death" );

    for (;;)
    {
        level._id_B538 _id_B382();
        wait 0.05;
    }
}

_id_C5F6( var_0, var_1 )
{
    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    return vectortoangles( var_2.origin - var_0.origin );
}

_id_D00F()
{
    var_0 = spawnstruct();
    var_0._id_B29A = 3;
    var_0.fail_time = 10;
    level endon( "quit_bread_crumb" );
    level._id_C4FA = var_0;
    level._id_A855 = [];

    for (;;)
    {
        _id_B523();
        wait 0.05;
    }
}

_id_B17B( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
    {
        level._id_C4FA.fail_time = var_0;
        return;
    }

    level notify( "set_breadcrumb_fail_time" );
    level endon( "set_breadcrumb_fail_time" );
    var_2 = level._id_C4FA.fail_time;
    var_3 = var_0 - var_2;
    var_4 = var_1 * 20;
    var_5 = var_3 / var_4;

    for ( var_6 = 0; var_6 < var_4; var_6++ )
    {
        level._id_C4FA.fail_time += var_5;
        wait 0.05;
    }

    level._id_C4FA.fail_time = var_0;
}

_id_D38D()
{
    for (;;)
    {
        while ( !level.player buttonpressed( "BUTTON_Y" ) )
            wait 0.05;

        if ( common_scripts\utility::flag( "debug_crumbs" ) )
            common_scripts\utility::flag_clear( "debug_crumbs" );
        else
            common_scripts\utility::flag_set( "debug_crumbs" );

        while ( level.player buttonpressed( "BUTTON_Y" ) )
            wait 0.05;
    }
}

_id_B20D()
{
    level.price endon( "death" );

    while ( !common_scripts\utility::flag( "exit_caves" ) )
    {
        var_0 = level.price gettagorigin( "tag_flash" );
        var_1 = level.price gettagangles( "tag_flash" );

        if ( level.price _id_CAF0( var_0, var_1 ) )
        {
            playfxontag( level._effect["fx/muzzleflashes/m203_flshview"], level.price, "tag_flash" );
            var_2 = level.price.enemy getshootatpos() + ( 0.0, 0.0, 150.0 );

            if ( distance( level.price.origin, level.price.enemy.origin ) > 1700 )
                var_2 += ( 0.0, 0.0, 150.0 );

            magicbullet( "m203", var_0, var_2 );
            wait 2.5;
        }

        wait 0.05;
    }
}

_id_CB3A()
{
    level.price endon( "death" );

    for (;;)
    {
        var_0 = level.price gettagorigin( "tag_flash" );
        var_1 = level.price gettagangles( "tag_flash" );

        if ( level.price _id_CAF0( var_0, var_1 ) )
        {
            playfxontag( level._effect["fx/muzzleflashes/m203_flshview"], level.price, "tag_flash" );
            var_2 = level.price.enemy getshootatpos() + ( 0.0, 0.0, 190.0 );

            if ( distance( level.price.origin, level.price.enemy.origin ) > 1700 )
                var_2 += ( 0.0, 0.0, 120.0 );

            magicbullet( "m203", var_0, var_2 );
            wait 2.5;
        }

        wait 0.05;
    }
}

_id_CAF0( var_0, var_1 )
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( !distancesquared( var_0, self.enemy.origin ) > 422500 )
        return 0;

    if ( !common_scripts\utility::within_fov( var_0, var_1, self.enemy getshootatpos(), 0.965925 ) )
        return 0;

    var_2 = common_scripts\utility::getstructarray( "good_spot_for_grenade_launcher", "targetname" );

    foreach ( var_4 in var_2 )
    {
        if ( distance( var_4.origin, self.enemy.origin ) < var_4.radius )
        {
            if ( !_id_B53D( var_4 ) )
                return 1;
        }
    }

    return 0;
}

_id_B53D( var_0 )
{
    var_1 = getentarray( "explodable_barrel", "targetname" );
    var_2 = var_0.radius * var_0.radius;

    foreach ( var_4 in var_1 )
    {
        if ( distancesquared( var_0.origin, var_4.origin ) > var_2 )
            continue;

        if ( var_4.damagetaken )
            return 1;
    }

    return 0;
}

_id_B352()
{
    self waittill( "trigger" );
    level.price._id_C294 = self.script_noteworthy;
}

_id_A8C2()
{
    self vehphys_crash();
}

_id_A958( var_0, var_1 )
{
    return maps\_utility::get_dot( var_0.origin, var_0.angles, var_1.origin ) > 0;
}

_id_AE91( var_0, var_1 )
{
    return maps\_utility::get_dot( var_0.origin, vectortoangles( var_0 vehicle_getvelocity() ), var_1.origin ) > 0;
}

_id_AE85()
{
    var_0 = cos( 55 );

    while ( maps\_utility::within_fov_of_players( self.origin, var_0 ) )
        wait 0.05;

    self delete();
}

_id_C7E5( var_0, var_1, var_2, var_3 )
{
    self notify( "newmove" );
    self endon( "newmove" );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self._id_C20A = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 200;

    var_4 = distance( self.origin, var_0 );
    var_5 = var_4 / var_1;
    var_6 = vectornormalize( var_0 - self.origin );
    var_7 = 0;
    var_8 = 0;

    if ( var_2 > 0 )
        var_7 = var_5 * var_2;

    if ( var_3 > 0 )
        var_8 = var_5 * var_3;

    self moveto( var_0, var_5, var_7, var_8 );
    wait(var_5);

    if ( !isdefined( self ) )
        return;

    self.velocity = var_6 * var_4 / var_5;
    self._id_C20A = 1;
}

_id_D1EF( var_0, var_1 )
{
    self endon( "death" );
    self endon( "waterfall_sequence" );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    level.price notify( "new_price_anim_single_on_boat" );
    level.price endon( "new_price_anim_single_on_boat" );
    level.price endon( "death" );

    if ( isdefined( level.price.last_queue_time ) )
        maps\_utility::wait_for_buffer_time_to_pass( level.price.last_queue_time, 0.5 );

    maps\_utility::function_stack( ::_id_CC27, var_0, var_1 );
    level.price.last_queue_time = gettime();
}

_id_CC27( var_0, var_1 )
{
    level._id_B538 endon( "death" );
    level.price endon( "death" );
    level.price endon( "waterfall_sequence" );
    common_scripts\utility::flag_set( "price_anim_on_boat" );
    level.price linkto( level._id_B538, "tag_guy2" );
    level.price _meth_859D( 0 );
    level._id_B538 maps\_anim::anim_single_solo( level.price, var_0, "tag_guy2", 0, "generic" );
    level.price _meth_859D();

    if ( !var_1 )
        return;

    _id_BE70();
    common_scripts\utility::flag_clear( "price_anim_on_boat" );
}

_id_AF82( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    level.price notify( "new_price_anim_single_on_boat" );
    level.price endon( "new_price_anim_single_on_boat" );
    level._id_B538 thread maps\_anim::anim_generic_loop( level.price, var_0, var_1, "tag_guy2" );
    level._id_B538 waittill( var_1 );

    if ( var_2 )
        _id_BE70();

    common_scripts\utility::flag_clear( "price_anim_on_boat" );
}

_id_C986( var_0 )
{
    self linktoblendtotag( var_0, "tag_guy2", 0 );
}

_id_C091( var_0 )
{
    _id_C986( var_0 );
    self allowedstances( "crouch" );
    self.vehicle = var_0;
    self._id_B1F2 = 1;
    thread _id_B1E1();
    self._id_CE3D = 4000000;
    self.highlyawareradius = 2048;
    self animcustom( _id_B257::think );
}

_id_B1E1()
{
    level.price endon( "stop_boatrider_targets" );
    level.price endon( "death" );

    for (;;)
    {
        wait 0.05;
        var_0 = level.price _id_BE1D::_id_A8AF( level._id_B538, level.player geteye(), 1 );

        if ( !isdefined( var_0.obj ) )
        {
            level.price clearentitytarget();
            continue;
        }

        if ( !isai( var_0.obj ) )
        {
            level.price setentitytarget( var_0.obj );
            level.price.favoriteenemy = undefined;

            if ( isdefined( var_0._id_AC56 ) )
                var_0.obj thread _id_A8EE();

            continue;
        }

        level.price clearentitytarget();
        level.price.favoriteenemy = var_0.obj;
    }
}

_id_A8EE()
{
    self notify( "enable_shoot_driver" );
    self endon( "enable_shoot_driver" );
    self.allowdeath = 1;
    self setcandamage( 1 );
    self waittill( "damage" );
    _id_BE1D::_id_BDD8( self );
}

_id_BE70()
{
    level.price _id_C986( level._id_B538 );
    level.price animcustom( _id_B257::think );
}

_id_B4D3( var_0 )
{
    var_1 = var_0.time;
    var_2 = var_0.ent;
    var_3 = var_0.tag;
    var_4 = var_0._id_A8E9;
    var_5 = var_0._id_CB69;
    level.player freezecontrols( 1 );
    var_6 = var_1 * 20;
    var_7 = var_4;
    var_8 = var_5 - var_4;
    var_9 = var_8 / var_6;
    var_6 = int( var_6 );

    for ( var_10 = 0; var_10 < var_6; var_10++ )
    {
        var_7 += var_9;
        level.player playerlinktodelta( var_2, var_3, 1, var_7, var_7, var_7, var_7 );
        wait 0.05;
    }

    level.player freezecontrols( 0 );
}

_id_D51A()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    self waittill( "trigger" );
    var_1 = vectornormalize( self.origin - var_0.origin );
    var_2 = vectornormalize( level._id_B538 vehicle_getvelocity() );
    var_3 = vectordot( var_2, var_1 );

    if ( var_3 > 0.984807 )
        level.price maps\_utility::radio_dialogue( "afchase_pri_threadtheneedle", 1 );
}

_id_D39B( var_0, var_1 )
{
    objective_onentity( var_0, var_1, ( 0.0, 0.0, 80.0 ) );
    var_1 waittill( "death" );
    objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
}

_id_B5AF()
{
    self.veh_pathtype = "follow";
    self vehphys_enablecrashing();

    for (;;)
    {
        self waittill( "veh_jolt" );

        if ( distance( self.origin, level.player.origin ) < 512 )
            break;
    }

    self vehphys_crash();
}

_id_C736( var_0, var_1 )
{
    if ( var_1.size < 1 )
        return;

    var_2 = distancesquared( var_1[0].origin, var_0 );
    var_3 = var_1[0];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = distancesquared( var_1[var_4].origin, var_0 );

        if ( var_5 < var_2 )
            continue;

        var_2 = var_5;
        var_3 = var_1[var_4];
    }

    return var_3;
}

_id_AD10( var_0 )
{
    var_1 = var_0.team;
    var_0 endon( "death" );
    var_0.ignoreall = 1;

    while ( var_0 istouching( self ) )
        wait 0.05;

    var_0.ignoreall = 0;
}

_id_ADBC()
{
    for (;;)
    {
        while ( !level.player buttonpressed( "BUTTON_B" ) )
            wait 0.05;

        _id_C5BD();

        while ( level.player buttonpressed( "BUTTON_B" ) )
            wait 0.05;
    }
}

_id_AB8B( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5.time = var_0;
    var_5.ent = var_1;
    var_5.tag = var_2;
    var_5._id_A8E9 = var_3;
    var_5._id_CB69 = var_4;
    return var_5;
}

_id_BA12()
{
    return level.player.health / level.player.maxhealth == 1;
}

_id_B631()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( !maps\_utility::first_touch( var_0 ) )
            continue;

        thread _id_AD10( var_0 );
    }
}

_id_C5E2()
{
    self endon( "death" );

    for (;;)
    {
        common_scripts\utility::draw_arrow( self.origin, self.origin + anglestoforward( self.angles ) * 200, ( 0.0, 0.0, 1.0 ) );
        wait 0.05;
    }
}

_id_B307()
{
    if ( !getdvarint( "scr_zodiac_test" ) )
        return;

    wait 3;
    iprintlnbold( "you will need to reset scr_zodiac_test to play the level normally again ( restart the game )" );
}

_id_B3BB( var_0 )
{
    if ( !isdefined( level._id_CDC7 ) )
        level._id_CDC7 = [];
    else if ( isdefined( level._id_CDC7[var_0] ) )
        return level._id_CDC7[var_0];

    level._id_CDC7[var_0] = maps\_utility::spawn_targetname( var_0, 1 );
    level._id_CDC7[var_0] thread maps\_utility::magic_bullet_shield();
    level._id_CDC7[var_0] maps\_utility::disable_pain();
    level._id_CDC7[var_0].ignoresuppression = 1;
    level._id_CDC7[var_0] maps\_utility::set_battlechatter( 0 );
    return level._id_CDC7[var_0];
}

_id_BDA8()
{
    level.price._id_C294 = undefined;
    level.price._id_C787 = 1;
}

_id_B141()
{
    self _meth_85A2( 1 );
    thread _id_BE1D::_id_D466( self );
    self.dontunloadonend = 1;

    foreach ( var_1 in self.riders )
        var_1 thread _id_AEBB( self );

    common_scripts\utility::flag_wait( "player_on_boat" );
    self endon( "death" );
    level._id_B538 endon( "death" );

    for (;;)
    {
        var_3 = level._id_B538.origin;
        var_4 = self.origin;

        if ( distancesquared( self.origin, level._id_B538.origin ) > 9000000 )
        {
            wait 0.05;
            continue;
        }

        level._id_B18E = animscripts\battlechatter::getdirectionfacingclock( level._id_B538.angles, var_3, var_4 );
        level notify( "dialog_direction" );
        wait 0.05;
    }
}

_id_D2C5( var_0, var_1 )
{
    self notify( "exp_fade_overlay" );
    self endon( "exp_fade_overlay" );
    var_2 = 4;
    var_3 = 90 / var_2;
    var_4 = 0;
    var_5 = var_1 / var_2;
    var_6 = self.alpha;
    var_7 = var_6 - var_0;

    for ( var_8 = 0; var_8 < var_2; var_8++ )
    {
        var_4 += var_3;
        self fadeovertime( var_5 );

        if ( var_0 > var_6 )
        {
            var_9 = 1 - cos( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }
        else
        {
            var_9 = sin( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }

        wait(var_5);
    }
}

_id_BEF7()
{
    self endon( "death" );
    level._id_B538 endon( "death" );

    for (;;)
    {
        var_0 = 1;
        var_1 = _id_B042( level._id_B538 vehicle_getvelocity() );

        if ( !maps\_utility::within_fov_2d( self.origin, self.angles, var_1, 0.984808 ) )
            var_0 = 0;

        if ( distance( self.origin, var_1 ) < 2000 )
            var_0 = 0;

        if ( distance( self.origin, var_1 ) > 5000 )
            var_0 = 0;

        if ( !_id_BA12() )
            var_0 = 0;

        if ( var_0 )
        {
            thread _id_AAFA();
            common_scripts\utility::flag_waitopen( "heli_firing" );
            wait(randomfloatrange( 1.2, 2.4 ));
        }

        wait 0.05;
    }
}

_id_B042( var_0 )
{
    return level._id_B538.origin + var_0 * 1.5;
}

_id_B229( var_0 )
{
    if ( common_scripts\utility::flag( "rapids_trigger" ) )
        return;

    var_1 = vectornormalize( var_0 - level._id_B538.origin );
    var_2 = anglestoright( level._id_B538.angles );
    var_3 = vectordot( var_2, var_1 );

    if ( var_3 < 0 )
    {
        if ( common_scripts\utility::cointoss() )
            _id_C1CF( "afchase_pri_rightright", 0.5 );
        else
            _id_C1CF( "afchase_pri_right", 0.5 );
    }
    else if ( common_scripts\utility::cointoss() )
        _id_C1CF( "afchase_pri_leftleft", 0.5 );
    else
        _id_C1CF( "afchase_pri_left", 0.5 );
}

_id_AAFA()
{
    if ( !isalive( self ) )
        return;

    if ( common_scripts\utility::flag( "heli_firing" ) )
        return;

    common_scripts\utility::flag_set( "heli_firing" );
    var_0 = gettime() + 3000;

    if ( !isalive( self ) )
    {
        common_scripts\utility::flag_clear( "heli_firing" );
        return;
    }

    var_1 = randomintrange( 4, 5 );
    var_2 = level._id_B538 vehicle_getvelocity();
    var_3 = _id_B042( var_2 );
    var_3 += common_scripts\utility::flat_origin( common_scripts\utility::randomvectorrange( -120, 120 ) );
    _id_B229( var_3 );
    var_4 = var_3;
    var_5 = [];
    var_6 = spawn( "script_origin", level._id_B538.origin );
    var_6 thread _id_B894( level._id_B538 );

    for ( var_7 = 0; var_7 < var_1; var_7++ )
    {
        var_5[var_7] = spawn( "script_origin", var_4 );
        var_5[var_7] linkto( var_6 );
        var_4 += var_2 * 0.1;
    }

    var_8 = [];
    var_8[0] = "tag_missile_right";
    var_8[1] = "tag_missile_left";
    var_9 = [];

    for ( var_7 = 0; var_7 < var_1; var_7++ )
    {
        if ( !isalive( self ) )
            break;

        self setvehweapon( "littlebird_FFAR" );
        self setturrettargetent( var_5[var_7] );
        var_10 = self fireweapon( var_8[var_7 % var_8.size], var_5[var_7], ( 0.0, 0.0, 0.0 ) );
        var_10 missile_setflightmodedirect();
        var_10 missile_settargetent( var_5[var_7] );
        var_10 thread _id_B6EB();
        wait(randomfloatrange( 0.2, 0.3 ));
    }

    var_6 notify( "balls" );
    common_scripts\utility::flag_clear( "heli_firing" );
    wait 15;

    foreach ( var_12 in var_5 )
        var_12 delete();

    var_6 delete();
}

_id_B894( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_1 = self.origin - var_0.origin;

    for (;;)
    {
        self moveto( var_0.origin + var_1, 0.05, 0, 0 );
        wait 0.05;
    }
}

_id_D426( var_0 )
{
    return level.scr_anim["generic"][var_0];
}

_id_CD4C()
{
    level._id_B538 notify( "cleanup" );

    if ( isdefined( level._id_B538._id_B4DE ) )
    {
        level._id_B538 detach( level._id_A9F4, "tag_weapon_left" );
        level._id_B538._id_B4DE = undefined;
    }
}

_id_C075()
{
    level endon( "water_cliff_jump_splash_sequence" );

    if ( !0 )
        level.player waittill( "death" );

    if ( 0 )
    {
        while ( !level.player buttonpressed( "BUTTON_B" ) )
            wait 0.05;

        wait 0.5;
        level.player kill();
    }

    thread maps\_utility::radio_dialogue_stop();
    _id_B4E8( "bump_small_player_dies", "bump_big_player_dies" );
    _id_CD4C();
}

_id_BD30( var_0 )
{
    var_1 = getnodesinradius( level.player.origin, 800, 500, 1000, "path" );
    var_2 = anglestoforward( level.player.angles );

    foreach ( var_4 in var_1 )
    {
        var_5 = vectornormalize( var_4.origin - level.player.origin );
        var_6 = vectordot( var_2, var_5 );

        if ( var_6 > cos( 15 ) )
        {
            level._id_A9ED = var_4;
            return 1;
        }
    }

    return 0;
}

_id_D1CE()
{
    var_0 = getnodesinradius( level.player.origin, 230, 100, 1000, "path" );
    var_1 = anglestoforward( level.player.angles );

    foreach ( var_3 in var_0 )
    {
        var_4 = vectornormalize( var_3.origin - level.player.origin );
        var_5 = vectordot( var_1, var_4 );

        if ( var_5 < cos( 45 ) && var_5 > 0 && _id_BD30( var_3 ) )
            return var_3;
    }
}

_id_B422()
{
    self endon( "death" );
    var_0 = self.baseaccuracy;
    wait 0.1;

    if ( !isdefined( level._id_B538 ) )
        return;

    level._id_B538 endon( "death" );

    if ( isdefined( self.ridingvehicle ) && issubstr( self.ridingvehicle.classname, "zodiac" ) )
        return;

    if ( issubstr( self.classname, "shepherd" ) )
        return;

    for (;;)
    {
        while ( _id_C0C8( self ) )
            wait 0.05;

        self.baseaccuracy = 0;
        self.ignoresuppression = 0;

        while ( !_id_C0C8( self ) )
            wait 0.05;

        self.baseaccuracy = var_0;
    }
}

_id_BCEC()
{
    self vehicle_turnengineoff();
    maps\_vehicle::godon();
    self makeunusable();
    level._id_B538 = self;
    level._id_B538 startusingheroonlylighting();
    self setmodel( "vehicle_zodiac" );
    self waittill( "vehicle_mount", var_0 );
    self playsound( "zodiac_player_startup" );
    level.dofdefault["nearStart"] = 10;
    level.dofdefault["nearEnd"] = 20;
    setsaveddvar( "hud_showstance", 0 );
    self setmodel( "vehicle_zodiac_viewmodel" );
    self vehicle_turnengineon();
    common_scripts\utility::flag_set( "player_on_boat" );
    thread maps\_utility::autosave_by_name_silent( "mount_boat" );
    maps\_utility::delaythread( 4, maps\_utility::add_extra_autosave_check, "boat_check_player_speeding_along", ::_id_C15E, "players boat not moving fast enough!" );
    level.player maps\_utility::ent_flag_clear( "near_death_vision_enabled" );
    thread _id_C29A();
    thread _id_C5F3();
    thread _id_A976();
    thread _id_CD33();
    thread _id_C075();
    thread _id_CAC1();
    var_1 = _id_B3BB( "boatrider0" );

    if ( !var_1 maps\_utility::ent_flag_exist( "price_animated_into_boat" ) )
        var_1 thread _id_C091( self );
    else
    {
        var_1 maps\_utility::ent_flag_wait( "price_animated_into_boat" );
        level notify( "stop_animate_price_into_boat" );
        level.price stopanimscripted();
        level.price thread _id_C091( level._id_B538 );
    }

    self vehphys_disablecrashing();
    level._id_B538 thread af_chase_update_wibble_on_price();
}

_id_BD6C( var_0 )
{
    var_0.attackeraccuracy = 0;
    var_0.baseaccuracy = 0.1;
    var_0.ignoresuppression = 1;
    var_0.dontavoidplayer = 1;
    var_0.takedamage = 0;
    var_0.suppressionwait = 0;
    var_0.pathrandompercent = 0;
    var_0.ignoreexplosionevents = 1;
    var_0 maps\_utility::disable_surprise();
    var_0.grenadeawareness = 0;
    var_0.ignoreme = 1;
    var_0.ignorerandombulletdamage = 1;
    var_0.disablebulletwhizbyreaction = 1;
    common_scripts\utility::flag_wait( "player_on_boat" );
    var_0.baseaccuracy = 25;
}

_id_B538()
{

}

_id_AB45( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_3 = getvehiclenode( var_1, "targetname" );
    var_2.target = var_3.targetname;
}

_id_CD19( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_3 = getent( var_1, "targetname" );
    var_2.target = var_3.targetname;
    var_2.origin = var_3.origin;
    var_2.angles = var_3.angles;
    var_2.speed = var_3.speed;
}

_id_AE42()
{
    level._id_A855 = [];
    level._id_BD76 = self;
    self endon( "death" );
    self vehphys_disablecrashing( 1 );
    self.veh_pathtype = "constrained";
    thread _id_B3A0();

    foreach ( var_1 in self.riders )
    {
        if ( isdefined( var_1.magic_bullet_shield ) && var_1.magic_bullet_shield )
            continue;

        var_1 thread maps\_utility::magic_bullet_shield();
    }

    for (;;)
    {
        wait 0.25;
        _id_C7EB();
    }
}

_id_C039()
{
    if ( !maps\_utility::is_default_start() )
        maps\_friendlyfire::turnoff();

    var_0 = _id_B3BB( "boatrider0" );
    level.price = var_0;
    thread _id_BD6C( var_0 );
    thread _id_B20D();
    var_1 = getentarray( "kill_ai_in_volume", "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_C4B8 );
}

_id_AF8B()
{
    var_0 = spawn( "trigger_radius", self.origin + ( 0.0, 0.0, -2000.0 ), 0, 4500, 2000 );
    var_0 waittill( "trigger" );
    level notify( "dialog_rpg_bridge_guy" );
}

_id_B9CE()
{
    self endon( "death" );
    var_0 = spawn( "script_origin", level._id_B538.origin );
    maps\_utility::ent_flag_init( "first_player_sighting" );
    maps\_utility::disable_long_death();
    self setentitytarget( var_0 );
    self.favoriteenemy = var_0;
    self.ignoreall = 1;
    self._id_B2C2 = gettime() + randomintrange( 1000, 2000 );
    var_1 = common_scripts\utility::flat_origin( common_scripts\utility::randomvectorrange( -64, 64 ) );
    var_2 = 3000;

    while ( isalive( self ) )
    {
        var_3 = level._id_B538 vehicle_getvelocity() * 1.4;
        var_4 = level._id_B538.origin + var_3;
        var_4 = maps\_utility::set_z( var_4, level._id_B538.origin[2] + 24 );

        if ( !bullettracepassed( level.player geteye() + ( 0.0, 0.0, 16.0 ), var_4, 0, self ) )
        {
            var_5 = distance( ( 0.0, 0.0, 0.0 ), var_3 );
            var_0.origin = _id_C83C::_id_BBA5( level.player._id_AAAC, level.player.progress + var_5 - level._id_C6AC, level.player.offset );
            var_0.origin = maps\_utility::set_z( var_0.origin, level._id_B538.origin[2] + 24 );
            var_0.origin = ( var_0.origin + var_4 ) / 2;
        }
        else
            var_0.origin = var_4;

        self orientmode( "face point", var_0.origin );
        var_6 = 0;

        if ( isdefined( self.weapon ) && self.weapon != "none" && bullettracepassed( self gettagorigin( "tag_flash" ), level.player geteye(), 0, self ) )
        {
            var_6 = 1;

            if ( !maps\_utility::ent_flag( "first_player_sighting" ) )
                maps\_utility::ent_flag_set( "first_player_sighting" );
        }

        if ( !maps\_utility::ent_flag( "first_player_sighting" ) )
            self._id_B2C2 = gettime() + randomintrange( 1000, 2000 );

        if ( gettime() > self._id_B2C2 )
        {
            if ( var_6 )
            {
                if ( isdefined( self.weapon ) && self.weapon != "none" && bullettracepassed( self gettagorigin( "tag_flash" ), var_0.origin + var_1, 0, self ) )
                {
                    if ( distance( self.origin, level.player.origin ) < var_2 )
                    {
                        if ( gettime() > level._id_D1DC )
                            break;
                    }
                }
            }
        }

        wait 0.05;
    }

    var_7 = "rpg_straight_af_chase";

    if ( isdefined( self ) && isdefined( self.weapon ) && self.weapon != "none" && isdefined( self gettagorigin( "tag_flash" ) ) )
    {
        var_8 = magicbullet( var_7, self gettagorigin( "tag_flash" ), var_0.origin + var_1 );
        var_8 thread _id_B6EB();
    }

    level._id_D1DC = gettime() + randomintrange( 300, 500 );
    var_0 delete();
}

_id_B6EB()
{
    level._id_B538 endon( "death" );
    self endon( "death" );

    while ( _id_A958( level.player, self ) )
        wait 0.05;

    thread common_scripts\utility::play_sound_in_space( "wpn_exp_water_lyr_behind" );
    self delete();
}

_id_CCEE()
{
    common_scripts\utility::flag_wait( "exit_caves" );
    _id_BDA8();
}

_id_CCD2( var_0 )
{
    level endon( "end_teleport_price_on_mount" );
    level._id_B538 waittill( "vehicle_mount" );
    level.price _id_B6A8( var_0 );
}

_id_B6A8( var_0 )
{
    self forceteleport( var_0.origin, var_0.angles );
    self setgoalpos( self.origin );
}

_id_B3DB()
{
    var_0 = [];
    var_0 = common_scripts\utility::array_add( var_0, "TF_pri_callout_targetclock_" );
    var_1 = [];
    var_1 = common_scripts\utility::array_add( var_1, "afchase_pri_evasive" );
    var_1 = common_scripts\utility::array_add( var_1, "afchase_pri_shakeemoff" );
    var_1 = common_scripts\utility::array_add( var_1, "afchase_pri_miniguns" );
    var_2 = [];
    var_2 = common_scripts\utility::array_add( var_2, "afchase_pri_dodgeheli" );
    var_2 = common_scripts\utility::array_add( var_2, "afchase_pri_gunsspinup" );
    var_2 = common_scripts\utility::array_add( var_2, "afchase_pri_steerclear" );
    var_3 = [];
    var_3 = common_scripts\utility::array_add( var_3, "afchase_pri_rpgsonbridge" );
    var_4 = [];
    var_4["dialog_direction"] = var_0;
    var_4["dialog_helicopter_six"] = var_1;
    var_4["dialog_helicopter_ahead"] = var_2;
    var_4["dialog_rpg_bridge_guy"] = var_3;
    var_5["dialog_direction"] = 0.5;
    var_5["dialog_helicopter_six"] = 1;
    var_5["dialog_helicopter_ahead"] = 1;
    var_5["dialog_rpg_bridge_guy"] = 0.7;
    var_6["dialog_direction"] = 5500;
    var_6["dialog_helicopter_six"] = 9300;
    var_6["dialog_helicopter_ahead"] = 2000;
    var_6["dialog_rpg_bridge_guy"] = 10000;
    var_7["dialog_direction"] = gettime();
    var_7["dialog_helicopter_six"] = gettime();
    var_7["dialog_helicopter_ahead"] = gettime();
    var_7["dialog_rpg_bridge_guy"] = gettime();
    var_8 = var_4;
    var_9 = undefined;
    wait 1;
    level endon( "price_stops_talking_about_helicopters" );
    level.player endon( "death" );
    self endon( "death" );
    common_scripts\utility::flag_wait( "exit_caves" );

    for (;;)
    {
        var_10 = level common_scripts\utility::waittill_any_return( "dialog_direction", "dialog_helicopter_six", "dialog_helicopter_ahead", "dialog_rpg_bridge_guy" );

        if ( common_scripts\utility::flag( "price_anim_on_boat" ) )
            continue;

        if ( common_scripts\utility::flag( "rapids_head_bobbing" ) )
            continue;

        var_9 = common_scripts\utility::random( var_8[var_10] );

        if ( gettime() - var_7[var_10] < var_6[var_10] )
            continue;

        var_7[var_10] = gettime();

        if ( var_10 == "dialog_direction" )
        {
            if ( level._id_B18E == "12" )
                _id_C1CF( var_9 + level._id_B18E, var_5[var_10] );
            else
                level.price thread maps\_utility::generic_dialogue_queue( var_9 + level._id_B18E, var_5[var_10] );
        }
        else
            _id_C1CF( var_9, var_5[var_10] );

        var_8[var_10] = common_scripts\utility::array_remove( var_8[var_10], var_9 );

        if ( !var_8[var_10].size )
        {
            var_8[var_10] = var_4[var_10];

            if ( var_4[var_10].size > 1 )
                var_8[var_10] = common_scripts\utility::array_remove( var_8[var_10], var_9 );
        }

        wait 0.05;

        if ( common_scripts\utility::flag( "player_in_sight_of_boarding" ) )
            return;
    }
}

_id_C1CF( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = level.price.a._id_CE90;
    var_3 = 0;

    if ( level.price.a.lastshoottime > gettime() - 2000 && !_id_BA12() || isdefined( level.price._id_D37C ) && level.price._id_D37C || level.price maps\_utility::ent_flag( "transitioning_positions" ) )
        var_3 = 1;

    if ( var_3 )
        level.price thread _id_B0C0( maps\_utility::generic_dialogue_queue, var_0, var_1 );
    else
        level.price thread _id_B0C0( ::_id_D1EF, var_2 + "_" + var_0 );
}

_id_B0C0( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_BF47 ) && !level._id_BF47 )
    {
        level._id_BF47 = 1;
        level.price [[ var_0 ]]( var_1, var_2 );
        wait 0.5;
        level._id_BF47 = 0;
    }
}

_id_C29A()
{
    var_0 = 8000;
    var_1 = gettime() + var_0;
    var_2 = [];
    var_2 = common_scripts\utility::array_add( var_2, "afchase_pri_gettingaway" );
    var_2 = common_scripts\utility::array_add( var_2, "afchase_pri_gogogo" );
    var_2 = common_scripts\utility::array_add( var_2, "afchase_pri_cantlet" );
    var_2 = common_scripts\utility::array_add( var_2, "afchase_pri_losinghim" );
    var_2 = common_scripts\utility::array_add( var_2, "afchase_pri_drivingtheboat" );
    var_2 = common_scripts\utility::array_add( var_2, "afchase_pri_fullpower" );
    var_3 = var_2;
    var_4 = undefined;
    self endon( "death" );
    level.price endon( "death" );

    for (;;)
    {
        if ( _id_C15C() > 0.5 && var_1 < gettime() && !level.price maps\_utility::ent_flag( "transitioning_positions" ) )
        {
            var_4 = common_scripts\utility::random( var_3 );

            if ( common_scripts\utility::flag( "rapids_head_bobbing" ) )
            {
                wait 0.05;
                continue;
            }

            _id_C1CF( var_4 );
            var_3 = common_scripts\utility::array_remove( var_3, var_4 );
            var_1 = gettime() + var_0;

            if ( !var_3.size )
                var_3 = var_2;
        }

        wait 0.05;

        if ( common_scripts\utility::flag( "stop_boat_dialogue" ) )
            return;
    }
}

_id_CD35()
{
    level.player endon( "death" );
    self waittill( "trigger" );
    _id_C1CF( "afchase_pri_thrucave" );
}

_id_B253()
{
    level.price thread maps\_utility::generic_dialogue_queue( "afchase_pri_aroundcorner" );
    wait 4;
    level.price thread maps\_utility::generic_dialogue_queue( "afchase_pri_getonboat" );
    wait 2;
}

_id_C5F3()
{
    var_0 = 4000;
    var_1 = gettime() + var_0;
    var_2 = 2;
    var_3 = 0;
    var_4 = [];
    var_4 = common_scripts\utility::array_add( var_4, "afchase_pri_wrongway" );
    var_4 = common_scripts\utility::array_add( var_4, "afchase_pri_turntoobjective" );
    var_4 = common_scripts\utility::array_add( var_4, "afchase_pri_wheregoing" );
    var_5 = var_4;
    var_6 = undefined;
    wait 1;
    self endon( "death" );
    level._id_BD76 endon( "death" );
    level.player endon( "death" );

    for (;;)
    {
        if ( !_id_AE91( level._id_B538, level._id_BD76 ) && var_1 < gettime() )
            var_3 += 0.05;
        else
            var_3 = 0;

        if ( common_scripts\utility::flag( "price_anim_on_boat" ) )
        {
            wait 0.05;
            continue;
        }

        if ( var_3 > var_2 )
        {
            var_6 = common_scripts\utility::random( var_5 );
            level.price thread maps\_utility::generic_dialogue_queue( var_6 );
            var_5 = common_scripts\utility::array_remove( var_5, var_6 );
            var_1 = gettime() + var_0;

            if ( !var_5.size )
                var_5 = var_4;
        }

        wait 0.05;

        if ( common_scripts\utility::flag( "stop_boat_dialogue" ) )
            return;
    }
}

_id_B4C8()
{
    level endon( "stop_animate_price_into_boat" );
    waittillframeend;
    var_0 = getnode( self.target, "targetname" );
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    level.price maps\_utility::ent_flag_init( "price_animated_into_boat" );
    var_1 common_scripts\utility::delaycall( 2, ::linkto, level._id_B538 );
    thread _id_CCD2( var_1 );
    var_1 maps\_anim::anim_generic_reach( level.price, "price_into_boat" );
    level notify( "end_teleport_price_on_mount" );
    level.price linkto( var_1 );
    level.price maps\_utility::delaythread( 1.5, maps\_utility::ent_flag_set, "price_animated_into_boat" );
    level._id_B538 common_scripts\utility::delaycall( 1, ::joltbody, level.price.origin, 0.15 );
    level._id_B538 maps\_utility::delaythread( 1, common_scripts\utility::play_sound_in_space, "water_boat_splash_small", level._id_B538.origin );
    var_1 maps\_anim::anim_generic( level.price, "price_into_boat" );
    level.price thread _id_C091( level._id_B538 );
}

_id_B7F6()
{
    getent( "damaged_pavelow", "targetname" ) hide();
    common_scripts\utility::flag_wait( "end_heli_crashed" );
    common_scripts\_exploder::exploder( "heli_fire" );
    var_0 = getent( "damaged_pavelow", "targetname" );
    wait 0.5;
    var_0 show();
    var_1 = spawn( "trigger_radius", var_0.origin + ( 0.0, 0.0, -100.0 ), 0, 670, 600 );
    var_1 waittill( "trigger" );
}

_id_D46D()
{
    self waittill( "trigger" );
    level.price thread maps\_utility::generic_dialogue_queue( "afchase_pri_openareas" );
}

_id_B859()
{
    var_0 = common_scripts\utility::getfx( "cliff_rocket_explosion" );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;

    switch ( self.targetname )
    {
        case "helicopterFireHill01_trigger":
            self waittill( "trigger" );
            var_2 = getent( "helicopterExplosionHillOrigin01_Left", "targetname" );
            var_3 = getent( "helicopterExplosionHillOrigin01_Right", "targetname" );
            var_1 = maps\_vehicle::_id_AEE5( "helicopterFireAtHill01" );
            soundscripts\_snd::snd_message( "stop_heli_passby_submix" );
            break;
        case "helicopterFireHill02_trigger":
            self waittill( "trigger" );
            var_2 = getent( "helicopterExplosionHillOrigin02_Left", "targetname" );
            var_3 = getent( "helicopterExplosionHillOrigin02_Right", "targetname" );
            var_1 = maps\_vehicle::_id_AEE5( "helicopterFireAtHill01" );
            soundscripts\_snd::snd_message( "stop_heli_passby_submix" );
            break;
        case "helicopterFireHill03_trigger":
            self waittill( "trigger" );
            var_2 = getent( "helicopterExplosionHillOrigin03_Left", "targetname" );
            var_3 = getent( "helicopterExplosionHillOrigin03_Right", "targetname" );
            var_1 = maps\_vehicle::_id_AEE5( "helicopterFireAtHill01" );
            soundscripts\_snd::snd_message( "stop_heli_passby_submix" );
            break;
        case "helicopterFireHill04_trigger":
            self waittill( "trigger" );
            var_2 = getent( "helicopterExplosionHillOrigin04_Left", "targetname" );
            var_3 = getent( "helicopterExplosionHillOrigin04_Right", "targetname" );
            var_1 = maps\_vehicle::_id_AEE5( "helicopterFireAtHill01" );
            soundscripts\_snd::snd_message( "stop_heli_passby_submix" );
            break;
        case "helicopterFireHill05_trigger":
            self waittill( "trigger" );
            var_2 = getent( "helicopterExplosionHillOrigin05_Left", "targetname" );
            var_3 = getent( "helicopterExplosionHillOrigin05_Right", "targetname" );
            var_1 = maps\_vehicle::_id_AEE5( "helicopterFireAtHill01" );
            soundscripts\_snd::snd_message( "stop_heli_passby_submix" );
            break;
        default:
            return;
    }

    var_1 setvehweapon( "littlebird_FFAR" );
    var_1 setturrettargetent( var_2 );
    var_4 = var_1 fireweapon( "tag_missile_left", var_2, ( 0.0, 0.0, 0.0 ) );
    var_4 missile_setflightmodedirect();
    var_4 missile_settargetent( var_2 );
    wait 0.25;
    var_1 setturrettargetent( var_3 );
    var_5 = var_1 fireweapon( "tag_missile_right", var_3, ( 0.0, 0.0, 0.0 ) );
    var_5 missile_setflightmodedirect();
    var_5 missile_settargetent( var_3 );
    wait 0.5;
    playfx( var_0, var_2.origin );
    thread common_scripts\utility::play_sound_in_space( "scn_cliff_rocket_explosion", var_2.origin );
    wait 0.25;
    playfx( var_0, var_3.origin );
    thread common_scripts\utility::play_sound_in_space( "scn_cliff_rocket_explosion", var_3.origin );
}

_id_B944()
{
    self waittill( "trigger" );
    setsaveddvar( "hud_showStance", 0 );

    if ( common_scripts\utility::flag( "player_on_boat" ) )
        return;

    var_0 = level._id_B538 gettagorigin( "tag_player" );
    var_1 = level._id_B538 gettagangles( "tag_player" );
    thread _id_BCC3();
    level.player _id_CC86( level._id_B538 );
    level._id_B538 makeusable();
    level._id_B538 useby( level.player );
    level.player.drivingvehicle = level._id_B538;
    _id_BD6A();
    level.price _meth_859D();
    level.price _meth_8583();
}

af_chase_update_wibble_on_price()
{
    self endon( "death" );
    var_0 = 0;

    for (;;)
    {
        var_1 = self vehicle_getspeed();

        if ( common_scripts\utility::flag_exist( "player_in_position_for_boarding_sequence" ) && common_scripts\utility::flag( "player_in_position_for_boarding_sequence" ) )
        {
            var_0 += self.veh_topspeed / 300.0;
            var_1 -= var_0;
        }

        var_1 = clamp( var_1 / self.veh_topspeed, 0, 1 );
        _func_2F1( 0, "xy", var_1 * 0.7, var_1 * 0.5 );
        waitframe();
    }
}

_id_BCC3()
{
    var_0 = _id_D397::_id_A97A( "enter_zodiac" );
    var_0 _id_D397::_id_BEA0( 0.85 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.1 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 1.55 ) _id_D397::_id_B85E( 0.06, 0.9, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BC26();
}

_id_BD6A()
{
    var_0 = getentarray( "vehicle_clip_boat_only_1", "targetname" );

    foreach ( var_2 in var_0 )
        var_2.origin += ( 0.0, 0.0, 256.0 );
}

_id_B425()
{
    self.origin += ( 0.0, 0.0, -50.0 );
    self waittill( "trigger" );
    level.price thread maps\_utility::generic_dialogue_queue( "afchase_pri_right" );
}

_id_D316()
{
    return _id_BD33();
}

_id_C295()
{
    self waittill( "trigger" );
    common_scripts\utility::flag_set( "exit_caves" );
    wait 1.1;
    wait 3;
    setsaveddvar( "sm_sunSampleSizeNear", "2" );

    if ( isdefined( level.price ) )
        level.price dontcastshadows();

    level.player.drivingvehicle _meth_85A2( 1 );
}

_id_D56F()
{
    self endon( "death" );
    wait 0.5;
    var_0 = self.origin[2];

    while ( self.origin[2] == var_0 )
        wait 0.1;

    self kill();
}

_id_B7F8( var_0 )
{
    self waittill( "trigger" );
    level._id_AD92 = var_0;
}

_id_AC04()
{
    level.player endon( "death" );
    self waittill( "trigger" );
    common_scripts\utility::flag_set( "rapids_trigger" );
    level.player._id_BF88 = 1;
    level._id_AD92 = 1;
    common_scripts\utility::flag_set( "rapids_head_bobbing" );
    level.price maps\_utility::generic_dialogue_queue( "afchase_pri_rapidsahead" );
    thread _id_AF82( "rapids_loop", "end_the_rapids_loop", 0 );
    var_0 = getent( "end_price_crazy", "targetname" );
    var_0 waittill( "trigger" );
    level._id_B538 notify( "end_the_rapids_loop" );
    level._id_AD92 = 2;
    _id_D1EF( "rapids_out" );
    common_scripts\utility::flag_clear( "rapids_head_bobbing" );
    _id_BDA8();
    wait 9;
    level._id_AD92 = 1;
}

_id_BDF5()
{
    self waittill( "trigger" );
    common_scripts\utility::flag_set( "on_river" );
}

_id_A901()
{
    common_scripts\utility::flag_wait( "exit_caves" );
    level endon( "stop_deadquote_for_gettingout_of_bounds" );
    level.player endon( "death" );
    var_0 = gettime() + 30000;

    for (;;)
    {
        setdvar( "ui_deadquote", "" );
        common_scripts\utility::flag_clear( "player_in_open" );
        self waittill( "trigger" );

        while ( level.player istouching( self ) )
        {
            if ( gettime() > var_0 )
            {
                var_0 = gettime() + randomfloatrange( 20000, 22000 );
                level.price thread maps\_utility::generic_dialogue_queue( "afchase_pri_openareas" );
            }

            common_scripts\utility::flag_set( "player_in_open" );
            level notify( "new_quote_string" );
            setdvar( "ui_deadquote", &"AF_CHASE_MISSION_FAILED_IN_THE_OPEN" );
            wait 0.05;
        }
    }
}

_id_CE6A()
{
    wait 0.5;
    var_0 = self.mgturret[0];
    var_0 setmode( "manual_ai" );
    var_0 settargetentity( level.player );

    foreach ( var_2 in self.riders )
    {
        var_2.favoriteenemy = level.player;
        var_2.maxsightdistsqrd = 400000000;
    }
}

_id_C9A3()
{
    if ( isdefined( level.notanksquish ) )
        return;

    if ( isdefined( level.levelhasvehicles ) && !level.levelhasvehicles )
        return;

    maps\_utility::add_damage_function( ::_id_BAD9 );
    maps\_utility::remove_damage_function( maps\_spawner::tanksquish_damage_check );
}

_id_BAD9( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self ) )
        return;

    if ( isalive( self ) )
        return;

    if ( !isalive( var_1 ) )
        return;

    if ( !isdefined( var_1.vehicletype ) )
        return;

    if ( var_1 maps\_vehicle::ishelicopter() )
        return;

    if ( abs( self.origin[2] - level._id_B538.origin[2] ) > 64 )
        self delete();

    thread _id_CD7A();

    if ( !isdefined( self ) )
        return;

    maps\_utility::remove_damage_function( ::_id_BAD9 );
}

_id_CD7A()
{
    _id_D50F();
    var_0 = gettime() + 500;

    while ( gettime() < var_0 )
    {
        if ( !isdefined( self ) )
            return;

        if ( self isragdoll() )
            return;

        self startragdoll();
        wait 0.05;
    }

    self delete();
}

_id_D50F()
{
    var_0 = getcorpsearray();

    foreach ( var_2 in var_0 )
    {
        if ( distance( var_2.origin, level.player geteye() ) > 600 )
            var_2 delete();
    }
}

_id_B8BE()
{
    var_0 = getentarray( "explodable_barrel", "targetname" );
    var_1 = common_scripts\utility::flat_origin( self.origin );
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( distance( var_1, common_scripts\utility::flat_origin( var_4.origin ) ) < self.radius )
            var_2[var_2.size] = var_4;
    }

    self waittill( "trigger" );

    for ( var_6 = 0; var_6 < 10; var_6++ )
    {
        foreach ( var_8 in var_2 )
            var_8 notify( "damage", 50, undefined, ( 0.0, 0.0, 0.0 ), var_8.origin, "MOD_EXPLOSIVE" );

        wait 0.05;
    }
}

_id_BD33()
{
    return level.player buttonpressed( "BUTTON_B" ) || 1;
}

_id_C4E4()
{
    common_scripts\utility::flag_wait( "water_cliff_jump_splash_sequence" );
    maps\_utility::remove_global_spawn_function( "axis", ::_id_B422 );
    maps\_utility::remove_global_spawn_function( "axis", ::_id_B6E4 );
}

_id_CE0C()
{
    level.price._id_C05D = level.price.model;
    // level.price setmodel( "body_desert_tf141_zodiac" );
    level.price.animname = "generic";
    var_0 = getent( "price_intro_sequence", "targetname" );
    thread intro_player();
    var_0 maps\_anim::anim_single_solo( level.price, "endgame_price_intro" );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_2 = getstartangles( level.price.origin, level.price.angles, level.price maps\_utility::getanim( "price_into_boat" ) ) - level.price.angles;
    var_1.angles = level.price.angles - var_2;
    var_3 = getstartorigin( level.price.origin, var_1.angles, level.price maps\_utility::getanim( "price_into_boat" ) ) - level.price.origin;
    var_1.origin = level.price.origin - var_3;
    level.price maps\_utility::delaythread( 0.05, maps\_anim::_id_B0F7, "stop_attach_axis", var_1, level._id_B538, "TAG_GUY2", 0.5 );
    level._id_B538 common_scripts\utility::delaycall( 0.66, ::joltbody, level.price.origin, 0.1 );
    level._id_B538 maps\_utility::delaythread( 0.66, common_scripts\utility::play_sound_in_space, "water_boat_splash_small", level._id_B538.origin );
    var_1 maps\_anim::anim_single_solo( level.price, "price_into_boat" );
    level.price notify( "stop_attach_axis" );
    var_1 delete();

    if ( common_scripts\utility::flag( "distant_explosion" ) != 1 )
        level._id_B538 maps\_anim::anim_single_solo( level.price, "price_into_boat_idle", "tag_guy2" );

    level.price thread _id_C091( level._id_B538 );
}

intro_player()
{
    level.player disableweapons( 1 );
    level.player freezecontrols( 1 );
    wait 1;
    level.player freezecontrols( 0 );
    wait 0.8;
    level.player enableweapons();

    for (;;)
    {
        waitframe();

        if ( level.player issprinting() )
            level.player maps\_utility::player_speed_percent( 60 );
        else
            level.player maps\_utility::player_speed_default();

        if ( common_scripts\utility::flag( "distant_explosion" ) )
        {
            level.player maps\_utility::player_speed_default();
            break;
        }
    }
}

_id_CC86( var_0 )
{
    var_1 = getentarray( "water", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 notify( "stop_water_think" );

    self enabledeathshield( 1 );
    var_5 = spawn( "script_origin", var_0 gettagorigin( "tag_detach" ) );
    var_5.angles = var_0.angles;
    var_6 = maps\_utility::spawn_anim_model( "worldbody" );
    var_6 hide();
    var_6 dontcastshadows();
    var_5 maps\_anim::anim_first_frame_solo( var_6, "jumpin_zodiac" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_afchase_plr_jumpin_boat" );

    while ( animscripts\utility::absyawtoangles( var_6.angles[1] ) > 90 || distance2d( self.origin, var_5.origin ) > 150 )
        waitframe();

    self freezecontrols( 1 );
    self allowcrouch( 0 );
    self allowprone( 0 );
    var_7 = self getstance();
    var_8 = 0.4;

    if ( var_7 == "crouch" )
        var_8 = 0.5;

    if ( var_7 != "stand" )
    {
        self setstance( "stand" );

        if ( var_7 == "prone" )
            wait 0.5;
    }

    self disableweapons( 1 );
    var_9 = var_6 maps\_utility::getanim( "jumpin_zodiac" );
    var_10 = getstartorigin( var_5.origin, var_5.angles, var_9 );
    var_11 = getstartangles( var_5.origin, var_5.angles, var_9 ) - self.angles;
    var_12 = spawnstruct();
    var_12.angles = var_5.angles - var_11;
    var_13 = var_10 - self.origin;
    var_14 = var_5.origin - var_10;
    var_15 = var_14[0] * cos( var_11[1] ) - var_14[1] * sin( var_11[1] );
    var_16 = var_14[0] * sin( var_11[1] ) + var_14[1] * cos( var_11[1] );
    var_17 = var_14 - ( var_15, var_16, var_14[2] );
    var_12.origin = var_5.origin - var_13 + var_17;
    var_12 maps\_anim::anim_first_frame_solo( var_6, "jumpin_zodiac" );
    self playerlinktoblend( var_6, "tag_player", var_8, 0, var_8 );
    var_18 = "jump_notify";
    var_6 animscripted( var_18, var_12.origin, var_12.angles, var_9 );
    var_19 = getnotetracktimes( var_9, "land" );
    var_20 = getanimlength( var_9 ) * var_19[0];
    var_6 thread maps\_anim::_id_B0F7( "stop_update_scripted_node_pos", var_12, var_0, "tag_detach", var_20 );
    wait(var_8);
    self playerlinktodelta( var_6, "tag_player", 1.0, 0, 0, 0, 0, 1 );
    var_6 show();
    common_scripts\_exploder::exploder( "player_enter_zodiac" );
    wait 0.1;
    self switchtoweapon( "uzi" );
    var_6 waittillmatch( var_18, "end" );
    var_6 notify( "stop_update_scripted_node_pos" );
    level.price notify( "stop_attach_axis" );
    self unlink();
    var_6 delete();
    var_5 delete();
    self allowcrouch( 1 );
    self allowprone( 1 );
    self enabledeathshield( 0 );
    self freezecontrols( 0 );
}

_id_AFB0()
{
    waittillframeend;
    var_0 = getent( "player_zodiac_tall_collision", "targetname" );
    var_0 linkto( level.vehicles["allies"][0] );
}

lod_scale_setup()
{
    level waittill( "player_over_the_waterfall" );
    setsaveddvar( "r_lodFOVFixedScale", 2 );
}

wet_price()
{
    if ( common_scripts\utility::flag( "price_is_soaked" ) )
        return;

    // level.price setmodel( "body_desert_tf141_zodiac_wet" );
    // level.price codescripts\character::setheadmodel( "head_hero_price_zodiac_wet" );
    common_scripts\utility::flag_set( "price_is_soaked" );
}
