// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_CCBB( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_2.health = var_1;
    var_3 = common_scripts\utility::getstruct( var_2.target, "targetname" );
    var_4 = spawnturret( "misc_turret", var_3.origin, "heli_spotlight" );
    var_4.angles = var_3.angles + ( 0.0, 0.0, 180.0 );
    var_4 setmodel( "com_blackhawk_spotlight_on_mg_setup_small_off" );
    var_4 setturretteam( "axis" );
    var_4 setmode( "manual" );
    var_4 setconvergencetime( 1, "yaw" );
    var_4 setconvergencetime( 1, "pitch" );
    var_4.target = var_3.target;
    var_4._id_D363 = var_2;
    var_4.spotlight_is_dead = 0;
    var_5 = common_scripts\utility::getstruct( var_4.target, "targetname" );
    var_4._id_BB18 = spawn( "script_origin", var_5.origin );
    var_4 settargetentity( var_4._id_BB18 );
    return var_4;
}

_id_BA68()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_0.ent = spawn( "script_origin", var_0.origin );
    self settargetentity( var_0.ent );
    self waittill( "turret_on_target" );
    self._id_BB18 delete();
    self._id_D363 setcandamage( 1 );
    self setmodel( "com_blackhawk_spotlight_on_mg_setup_small_on" );
    thread _id_D535();
    thread _id_BD1D();
    thread _id_AA07( var_0 );
}

_id_AA07( var_0 )
{
    self endon( "death" );
    var_1 = var_0.ent;

    for (;;)
    {
        if ( isdefined( var_0.script_speed ) )
        {
            var_2 = var_0.script_speed / 1000;
            self setconvergencetime( var_2, "yaw" );
            self setconvergencetime( var_2, "pitch" );
        }

        var_1 delete();
        var_1 = spawn( "script_origin", var_0.origin );
        self settargetentity( var_1 );
        self waittill( "turret_on_target" );

        if ( isdefined( var_0.script_flag_set ) )
            common_scripts\utility::flag_set( var_0.script_flag_set );

        var_0 maps\_utility::script_delay();

        if ( isdefined( var_0.script_flag_wait ) )
            common_scripts\utility::flag_wait( var_0.script_flag_wait );

        if ( !isdefined( var_0.target ) )
            break;

        var_3 = common_scripts\utility::getstructarray( var_0.target, "targetname" );
        var_0 = common_scripts\utility::random( var_3 );
    }
}

_id_D535()
{
    self endon( "death" );
    playfxontag( level._effect["_attack_heli_spotlight"], self, "tag_light" );
    wait 0.15;
    killfxontag( level._effect["_attack_heli_spotlight"], self, "tag_light" );
    wait 0.08;
    playfxontag( level._effect["_attack_heli_spotlight"], self, "tag_light" );
    wait 0.3;
    killfxontag( level._effect["_attack_heli_spotlight"], self, "tag_light" );
    wait 0.08;
    playfxontag( level._effect["_attack_heli_spotlight"], self, "tag_light" );
    wait 0.05;
    killfxontag( level._effect["_attack_heli_spotlight"], self, "tag_light" );
    wait 0.08;
    playfxontag( level._effect["_attack_heli_spotlight"], self, "tag_light" );
    wait 0.1;
    killfxontag( level._effect["_attack_heli_spotlight"], self, "tag_light" );
    wait 0.05;
    playfxontag( level._effect["_attack_heli_spotlight"], self, "tag_light" );
}

_id_BD1D()
{
    self endon( "spotlight_delete" );
    var_0 = self._id_D363.health;
    self._id_D363 _id_BBB4( var_0 );
    thread maps\_utility::play_sound_on_entity( "scn_dcwhitehouse_spotlight_destroy" );
    self setmodel( "com_blackhawk_spotlight_on_mg_setup_small_off" );
    killfxontag( level._effect["_attack_heli_spotlight"], self, "tag_light" );
    self notify( "death" );
    self.spotlight_is_dead = 1;
    playfxontag( level._effect["spotlight_spark"], self, "tag_light" );
    wait 0.5;
    playfxontag( level._effect["spotlight_spark"], self, "tag_light" );
}

_id_BCAB( var_0 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        wait(randomint( 3 ));

    thread _id_C68F();
    self setmode( "auto_nonai" );
    self setturretteam( "axis" );
    self setbottomarc( 35 );
    self setleftarc( 90 );
    self setrightarc( 90 );
    thread _id_B8CA();

    if ( level._id_C5AD > 0 )
    {
        if ( isdefined( self.target ) )
            thread _id_D058();
    }

    level._id_C5AD--;

    if ( isdefined( self.script_group ) )
    {
        level waittill( "sandbag_group_" + self.script_group );
        thread _id_BB7B();
    }
}

_id_C68F()
{
    self endon( "death" );
    var_0 = common_scripts\utility::get_linked_ent();
    self.drone = var_0 maps\_utility::spawn_ai( 1 );
    self.drone.health = 250;
    self.drone waittill( "death" );
    level notify( "sandbag_group_" + self.script_group );
}

_id_B8CA()
{
    self endon( "stop_firing" );

    for (;;)
    {
        var_0 = randomfloatrange( 1, 2.5 ) * 20;

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            self shootturret();
            wait 0.05;
        }

        wait(randomfloatrange( 1, 3 ));
    }
}

_id_D058( var_0, var_1 )
{
    self endon( "stop_path" );
    self setconvergencetime( 4, "yaw" );
    self setconvergencetime( 2, "pitch" );
    self setaispread( 0.4 );
    self setmode( "manual" );

    if ( isdefined( var_0 ) )
        self.current_target = var_0;
    else
        self.current_target = common_scripts\utility::getstruct( self.target, "targetname" );

    var_2 = spawn( "script_origin", self.current_target.origin );

    for (;;)
    {
        if ( isdefined( self.current_target.script_speed ) )
        {
            var_3 = self.current_target.script_speed / 1000;
            self setconvergencetime( var_3, "yaw" );
            self setconvergencetime( var_3, "pitch" );
        }

        var_2 delete();
        var_2 = spawn( "script_origin", self.current_target.origin );
        self settargetentity( var_2 );
        turret_on_target( self.current_target );

        if ( isdefined( self.current_target.target ) )
        {
            self.current_target = common_scripts\utility::getstruct( self.current_target.target, "targetname" );
            continue;
        }

        if ( isdefined( self.target ) )
        {
            self.current_target = common_scripts\utility::getstruct( self.target, "targetname" );
            continue;
        }

        break;
    }

    var_2 delete();
}

_id_BB7B( var_0 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
    {
        var_0 *= 3;
        wait(randomfloatrange( var_0, var_0 + 2 ));
    }

    if ( isdefined( self ) )
    {
        self notify( "stop_path" );
        self notify( "stop_firing" );
    }

    if ( isalive( self.drone ) )
        self.drone kill();

    self delete();
}

_id_C3EE( var_0 )
{
    level endon( "whitehouse_breached" );
    self waittill( "trigger" );

    if ( common_scripts\utility::flag( "mg_threat" ) )
        return;

    var_0 setmode( "manual" );
    var_0 setturretteam( "axis" );
    var_0 setbottomarc( 45 );
    var_0 setconvergencetime( 0.25, "yaw" );
    var_0 setconvergencetime( 0.25, "pitch" );
    common_scripts\utility::flag_set( "mg_threat" );
    var_1 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_2 = spawn( "script_origin", var_1.origin );
    var_0 settargetentity( var_2 );
    var_0 waittill( "turret_on_target" );
    var_2 delete();
    var_0 thread _id_B8CA();
    var_0 _id_D058( var_1 );
    var_0 notify( "stop_firing" );
    common_scripts\utility::flag_clear( "mg_threat" );
}

_id_AD1A()
{
    var_0 = getentarray( "magic_rpg_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_CB77 );
}

_id_CB77()
{
    self waittill( "trigger" );
    var_0 = common_scripts\utility::getstructarray( self.target, "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = common_scripts\utility::getstructarray( var_2.target, "targetname" );
        common_scripts\utility::array_thread( var_3, ::_id_CA29, var_2 );
    }
}

_id_CA29( var_0 )
{
    maps\_utility::script_delay();
    var_1 = magicbullet( "rpg_straight", var_0.origin, self.origin );
}

_id_CABF( var_0 )
{
    _id_CF1A( var_0 );
    var_1 = getentarray( var_0, "targetname" );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        var_5 = var_4.script_group;

        if ( !isdefined( var_2[var_5] ) )
            var_2[var_5] = [];

        var_6 = var_2[var_5].size;
        var_2[var_5][var_6] = var_4;
    }

    var_8 = common_scripts\utility::getstruct( var_0, "script_noteworthy" );

    foreach ( var_10 in var_2 )
        level thread _id_B1B3( var_10, var_8 );
}

_id_CF1A( var_0 )
{
    var_1 = common_scripts\utility::getstructarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = spawn( "script_model", var_3.origin );
        var_4.angles = var_3.angles;
        var_4 setmodel( var_3.script_modelname );
        var_4.script_group = var_3.script_group;
        var_4.script_index = var_3.script_index;
        var_4.script_parameters = var_3.script_parameters;
        var_4.targetname = var_3.targetname;
        var_3 = undefined;
    }
}

_id_B1B3( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_D0BF = 0;
    common_scripts\utility::array_thread( var_0, ::_id_AC0D, var_2 );
    var_3 = anglestoforward( var_1.angles );
    var_4 = var_3 * 3000;

    while ( var_0.size )
    {
        var_2 waittill( "damage", var_5, var_6 );
        waittillframeend;

        if ( var_6 > 500 )
        {
            var_2._id_D0BF = max( var_2._id_D0BF, int( var_0.size * 0.75 ) );
            level notify( "sandbag_group_" + var_5.script_group );
        }

        for ( var_7 = 0; var_7 < var_2._id_D0BF; var_7++ )
        {
            if ( var_7 == 0 )
            {
                var_8 = _id_A9F6( var_0, var_5 );

                if ( isdefined( var_8.script_parameters ) )
                {
                    var_2._id_D0BF = var_0.size;
                    level notify( "sandbag_group_" + var_8.script_group );
                }
            }
            else
                var_8 = _id_A9F6( var_0 );

            var_8 notify( "thrown" );
            var_0 = common_scripts\utility::array_remove( var_0, var_8 );
            var_8 physicslaunchclient( var_8.origin, var_4 );
        }

        var_2._id_D0BF = 0;
        var_2 notify( "throw_done" );
    }
}

_id_A9F6( var_0, var_1 )
{
    var_2 = 1000000;
    var_3 = undefined;

    foreach ( var_5 in var_0 )
    {
        if ( var_5.script_index > var_2 )
            continue;

        var_2 = var_5.script_index;
        var_3 = var_5;
    }

    if ( isdefined( var_1 ) && var_3.script_index == var_1.script_index )
        return var_1;

    return var_3;
}

_id_AC0D( var_0 )
{
    self endon( "thrown" );
    self.health = 10000;
    self setcandamage( 1 );

    for (;;)
    {
        var_1 = _id_BBB4( 100 );
        var_0._id_D0BF++;
        var_0 notify( "damage", self, var_1 );
        var_0 waittill( "throw_done" );
    }
}

_id_A98A()
{
    var_0 = maps\_utility::get_ai_group_ai( "allied_mg" );

    foreach ( var_2 in var_0 )
        var_2 kill();

    var_4 = maps\_utility::get_ai_group_ai( "whitehouse_approach_enemies" );
    common_scripts\utility::array_thread( var_4, ::_id_B7EF, 10, 15 );
    common_scripts\utility::array_call( var_4, ::setthreatbiasgroup, "ignore_player" );
    common_scripts\utility::flag_wait( "whitehouse_entrance_init" );
    var_5 = getentarray( "manual_mg", "script_noteworthy" );
    var_5 = common_scripts\utility::array_add( var_5, getent( "west_side_mg", "script_noteworthy" ) );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        var_5[var_6] thread _id_BB7B( var_6 + 1 );

    common_scripts\utility::flag_wait( "whitehouse_entrance_clear" );
    var_4 = maps\_utility::get_ai_group_ai( "westwing_roof_enemies" );
    common_scripts\utility::array_thread( var_4, ::_id_B7EF, 5, 15 );
    common_scripts\utility::flag_wait( "whitehouse_breached" );
    var_7 = getaiarray( "axis" );
    common_scripts\utility::array_call( var_7, ::kill );
    common_scripts\utility::flag_wait( "whitehouse_path_kitchen" );
    var_8 = getaiarray( "allies" );

    foreach ( var_2 in var_8 )
    {
        if ( var_2 maps\_utility::is_hero() )
            continue;

        var_2 _id_B7EF( 4, 10, 1 );
    }
}

_id_CCD0()
{
    level._id_C5AD = level.gameskill - 1;
    var_0 = getentarray( "manual_mg", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_BCAB, 1 );
    var_1 = getent( "threat_mg", "targetname" );
    var_2 = getentarray( "mg_threat_trigger", "targetname" );
    common_scripts\utility::array_thread( var_2, ::_id_C3EE, var_1 );
    var_1 makeunusable();
}

_id_D1DA()
{
    var_0 = 2;
    var_1 = 1.5;

    switch ( level.gameskill )
    {
        case 0:
            var_0 = 5;
            var_1 = 2;
            break;
        case 1:
            var_0 = 4;
            var_1 = 2;
            break;
    }

    var_2 = getentarray( "westwing_mg", "script_noteworthy" );

    foreach ( var_4 in var_2 )
    {
        var_4 setaispread( var_0 );
        var_4 setconvergencetime( var_1 );
    }
}

_id_D140()
{
    common_scripts\utility::flag_wait( "whitehouse_breached" );
    self delete();
}

_id_BE7E()
{
    common_scripts\utility::flag_wait( "whitehouse_silhouette_ready" );
    var_0 = getentarray( "drone_rocket_source", "targetname" );
    var_1 = maps\_utility::array_removedead( level._id_C11F );

    for ( var_2 = 0; var_1.size; var_2++ )
    {
        var_3 = var_0[var_2 % var_0.size];
        magicbullet( "rpg_straight", var_3.origin, common_scripts\utility::random( var_1 ).origin );
        wait(randomfloat( 2 ));
        var_1 = maps\_utility::array_removedead( level._id_C11F );
    }

    common_scripts\utility::flag_set( "whitehouse_silhouette_over" );
}

_id_AAE6()
{
    maps\_utility::array_spawn_function_noteworthy( "whitehouse_rappel_ai", ::_id_B402 );
}

_id_B402( var_0 )
{
    self endon( "death" );
    var_1 = getent( self.target, "targetname" );
    maps\_utility::enable_achievement_harder_they_fall();
    var_2 = maps\_utility::spawn_anim_model( "rope", var_1.origin );
    var_2 thread _id_B76E();
    var_3 = [];
    var_3[0] = self;
    var_3[1] = var_2;

    switch ( self.classname )
    {
        case "actor_enemy_airborne_AR":
            var_4 = 1;
            break;
        case "actor_enemy_airborne_RPG":
            var_4 = 2;
            break;
        case "actor_enemy_airborne_SMG":
            var_4 = 3;
            break;
        default:
            var_4 = randomintrange( 1, 3 );
            break;
    }

    self.animname = "rappel_guy";
    self.allowdeath = 1;
    self.ignoreme = 1;
    var_1 thread maps\_anim::anim_loop( var_3, "rappel_stand_idle_" + var_4, "stop_loop" );
    var_1 maps\_utility::script_delay();
    var_1 maps\_utility::anim_stopanimscripted();
    var_1 maps\_anim::anim_single( var_3, "rappel_drop", undefined, 4.3 );
    maps\_utility::disable_achievement_harder_they_fall();
    var_5 = getent( "rappel_goal", "targetname" );
    self setgoalpos( var_5.origin );
    self.goalradius = 1024;
    self.goalheight = 128;
    self.ignoreme = 0;
}

_id_B76E()
{
    maps\_utility::waittill_match_or_timeout( "single anim", "end", 10 );
    common_scripts\utility::flag_wait( "whitehouse_rappel_delete_rope" );
    self delete();
}

_id_CF80( var_0, var_1, var_2, var_3 )
{
    wait(var_0);
    var_4 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_4 setmodel( "mil_emergency_flare" );
    var_4 linkto( self, var_1, var_2, var_3 );
    playfxontag( level._effect["green_flare"], var_4, "tag_fire_fx" );
    wait 12;
    stopfxontag( level._effect["green_flare"], var_4, "tag_fire_fx" );
    wait 0.5;
    var_4 delete();
}

_id_B94B( var_0 )
{
    var_0 endon( "death" );

    if ( !common_scripts\utility::flag( "player_looking_at_flareguy" ) )
        return 0;

    var_0 thread maps\_utility::play_sound_on_tag_endon_death( "scn_dcwhite_npc_flare_start", "J_Wrist_RI" );
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1 setmodel( "mil_emergency_flare" );
    var_1 linkto( var_0, "tag_weapon_left", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 thread _id_CF4D( var_0 );
    var_0 thread _id_CF4D( var_0 );
    common_scripts\utility::flag_wait( "flare_guy_drop_flares" );
    var_0 notify( "stop_flare_fx" );
    var_1 notify( "stop_flare_fx" );
    var_1 unlink();
    var_1 delete();
    var_0 detach( "mil_emergency_flare", "tag_inhand" );
}

_id_CF4D( var_0 )
{
    var_0 endon( "death" );
    playfxontag( common_scripts\utility::getfx( "green_flare_ignite" ), self, "tag_fire_fx" );
    level endon( "whitehouse_hammerdown" );
    self endon( "stop_flare_fx" );

    for (;;)
    {
        wait 0.1;
        playfxontag( common_scripts\utility::getfx( "green_flare" ), self, "tag_fire_fx" );
    }
}

_id_C660()
{
    self endon( "remove_flare" );
    var_0 = level.player getweaponslistprimaries();

    if ( var_0.size > 0 )
    {
        self.old_weapon = var_0[0];
        var_1 = level.player getcurrentweapon();

        if ( weaponinventorytype( var_1 ) == "altmode" )
        {
            var_2 = level.player getweaponslistall();

            if ( var_2.size > 1 && var_2[0] == var_0[0] && var_2[1] == var_1 )
                self.old_weapon = var_1;
        }
    }
    else
        self.old_weapon = self getcurrentprimaryweapon();

    level.player allowfire( 0 );
    level.player giveweapon( "flare" );
    level.player switchtoweapon( "flare" );
    level.player disableweaponswitch();
    level.player disableoffhandweapons();
    level.player disableweaponpickup();
    setsaveddvar( "actionSlotsHide", 1 );
    wait 0.5;
    maps\_utility::display_hint( "how_to_pop_flare" );
    level.player allowfire( 1 );
    var_3 = common_scripts\utility::waittill_any_return( "drop_flare", "weapon_fired" );

    if ( var_3 == "weapon_fired" )
    {
        common_scripts\utility::flag_set( "player_flare_popped" );
        level thread maps\_utility::music_stop( 7 );
        level.player thread maps\_utility::play_sound_on_entity( "mus_dc_whitehouse_endrun_ending" );
        thread _id_B886();
        self waittill( "end_firing" );
    }

    self.old_weapon = _id_BE49( self.old_weapon );
    level.player switchtoweapon( self.old_weapon );

    if ( var_3 == "drop_flare" )
        self waittill( "weapon_change" );

    level.player takeweapon( "flare" );
    level.player enableweaponswitch();
    level.player enableoffhandweapons();
    level.player enableweaponpickup();
    setsaveddvar( "cg_gunDownAnimDelayTime", 250 );
    setsaveddvar( "actionSlotsHide", 0 );
}
#using_animtree("generic_human");

_id_B886()
{
    self waittill( "flare_lookup" );
    var_0 = 30.0;

    if ( common_scripts\utility::flag( "whitehouse_flare_lookup" ) && abs( self getplayerangles()[0] ) < var_0 )
    {
        self _meth_84C7( "h2_dcwhitehouse_flare_add" );
        var_1 = gettime() + getanimlength( %h2_dcwhitehouse_flare_add ) * 1000;

        while ( gettime() < var_1 && abs( self getplayerangles()[0] ) < var_0 )
            waitframe();

        self _meth_84C7( 0 );
    }
}

_id_CD1C()
{
    return common_scripts\utility::flag( "player_flare_popped" ) || common_scripts\utility::flag( "remove_flare_hint" );
}

_id_BE49( var_0 )
{
    var_1 = self getweaponslistprimaries()[0];

    if ( !isdefined( var_0 ) )
        return var_1;

    if ( !self hasweapon( var_0 ) )
        return var_1;

    return var_0;
}

_id_D207()
{
    wait 0.4;
    self playsound( "scn_windowed_door_kick" );

    foreach ( var_1 in self.parts )
        var_1 connectpaths();

    self rotateto( self.angles + ( 0.0, 90.0, 0.0 ), 0.5, 0.1, 0 );
    self waittill( "rotatedone" );
    self rotateto( self.angles + ( 0.0, -10.0, 0.0 ), 0.3, 0, 0.3 );
    self waittill( "rotatedone" );
    self rotateto( self.angles + ( 0.0, 5.0, 0.0 ), 0.3, 0.15, 0.15 );
}

_id_CC25( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = 0;

    for ( var_2 = 0; !var_1; var_1 = var_2 > var_0 )
    {
        self waittill( "damage", var_3, var_4 );

        if ( var_4 == level.player )
            var_2 += var_3;
    }

    return var_2;
}

_id_BBB4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = 0;

    for ( var_2 = 0; !var_1; var_1 = var_2 > var_0 )
    {
        self waittill( "damage", var_3, var_4 );

        if ( isdefined( var_4.team ) && var_4.team == "allies" )
            var_2 += var_3;
    }

    return var_2;
}

turret_on_target( var_0 )
{
    self waittill( "turret_on_target" );

    for (;;)
    {
        var_1 = anglestoforward( self gettagangles( "tag_flash" ) );
        var_2 = vectornormalize( var_0.origin - self.origin );
        var_3 = vectordot( var_1, var_2 );

        if ( var_3 > 0.9999 )
            return;

        wait 0.05;
    }
}

_id_B7EF( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3["allies"] = "axis";
    var_3["axis"] = "allies";
    self endon( "death" );

    for (;;)
    {
        wait(randomfloatrange( var_0, var_1 ));

        if ( isdefined( var_2 ) && self cansee( level.player ) )
            continue;

        var_4 = getaiarray( var_3[self.team] );
        var_4 = sortbydistance( var_4, self.origin );
        var_5 = var_4[0];

        if ( isdefined( var_5 ) )
        {
            self kill( var_5 geteye(), var_5 );
            continue;
        }

        self kill( self geteye() );
    }
}

_id_B9CD()
{
    var_0 = getentarray( "lamp_coll", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 notsolid();

    var_4 = getentarray( "chandelier", "targetname" );
    common_scripts\utility::array_thread( var_4, ::_id_BC11 );
}

_id_BC11()
{
    self._id_C0D5 = 0;

    if ( isdefined( self.script_noteworthy ) )
    {
        self.lights = getentarray( "chandelier_light_" + self.script_noteworthy, "targetname" );

        foreach ( var_1 in self.lights )
            var_1._id_B357 = var_1 getlightintensity();

        thread _id_C128();
    }

    thread _id_D252();
}

_id_D252()
{
    self setcandamage( 1 );
    self setcanradiusdamage( 1 );
    self.animname = "chandelier";
    maps\_utility::assign_animtree();
    var_0 = randomfloatrange( 0.5, 1 );
    var_1 = maps\_utility::getanim( "idle" );
    self _meth_83D4( var_1, var_0 );
    wait(randomfloat( 3 ));
    thread maps\_anim::anim_single_solo( self, "idle" );

    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( !self._id_C0D5 && common_scripts\_destructible::getdamagetype( var_6 ) != "splash" )
            continue;

        if ( isdefined( self.lights ) )
            thread _id_D282();

        if ( isdefined( self.script_parameters ) )
        {
            thread _id_D088();
            return;
        }
        else
            thread _id_D2B0( var_0 );
    }
}

_id_D2B0( var_0 )
{
    self._id_C0D5 = 1;
    self notify( "chandelier_swing" );
    self stopanimscripted();
    waitframe();
    var_1 = maps\_utility::getanim( "swing" );
    self _meth_83D4( var_1, var_0 );
    thread maps\_utility::play_sound_on_tag( "emt_chandelier_swing", "TAG_LIGHT" );
    maps\_anim::anim_single_solo( self, "swing" );
    thread maps\_anim::anim_single_solo( self, "idle" );
    self._id_CB78 = 0;
}

_id_D282()
{
    self endon( "chandelier_fall" );
    self endon( "chandelier_swing" );
    wait 0.5;

    for ( var_0 = 0; var_0 < 14; var_0++ )
    {
        _id_B8A4( 0 );
        self setmodel( "h2_light_chandelier_vintage_04" );
        wait(randomfloatrange( 0.05, 0.2 ));
        _id_B8A4( maps\_utility::round_float( randomfloatrange( 0.4, 0.8 ), 1, 0 ) );
        self setmodel( "h2_light_chandelier_vintage_04_on" );
        wait(randomfloatrange( 0.15, 0.3 ));
    }

    _id_B8A4( 1 );
}

_id_B8A4( var_0 )
{
    foreach ( var_2 in self.lights )
        var_2 setlightintensity( common_scripts\utility::_id_B9AA( var_0, var_2._id_B357 ) );
}

_id_D088()
{
    common_scripts\_exploder::exploder( "chandelier" );
    thread chandelier_fall_flicker();
    thread maps\_utility::play_sound_on_tag( "emt_chandelier_fall", "TAG_LIGHT" );
    maps\_anim::anim_single_solo( self, "swing_fall" );
    thread maps\_anim::anim_single_solo( self, "idle_fall" );
    var_0 = getentarray( "lamp_coll", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 solid();
}

chandelier_fall_flicker()
{
    wait(randomfloatrange( 1, 4 ));
    _id_B8A4( 0.4 );
    self setmodel( "h2_light_chandelier_vintage_04_on" );
    wait 0.05;
    _id_B8A4( 0 );
    self setmodel( "h2_light_chandelier_vintage_04" );
    self notify( "chandelier_fall" );
    playfx( level._effect["wire_spark"], self.origin );
}

_id_C128()
{
    self endon( "chandelier_fall" );

    foreach ( var_1 in self.lights )
    {
        var_1.node = spawn( "script_origin", var_1.origin );
        var_1.node linkto( self, "tag_light" );
    }

    for (;;)
    {
        self waittill( "chandelier_swing" );

        while ( self._id_C0D5 )
        {
            foreach ( var_1 in self.lights )
                var_1 moveto( var_1.node.origin, 0.1 );

            wait 0.1;
        }
    }
}

_id_B03C( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );
    var_2 = undefined;

    foreach ( var_2 in var_1 )
    {
        if ( var_2.targetname == "chandelier" )
            break;
    }

    return var_2;
}

_id_C0CA( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 10.0, 10.0, 0.0 );

    self notify( "damage", var_0, undefined, var_1, undefined, "mod_grenade_splash" );
}

_id_B259( var_0 )
{
    var_1 = spawn( "script_origin", level.player.origin + ( 0.0, 0.0, 32.0 ) );
    var_1 makeusable();
    var_1 sethintstring( var_0 );
    var_1 linkto( level.player );
    level thread maps\_utility::set_flag_on_trigger( var_1, "remove_use_hint" );
    common_scripts\utility::flag_wait( "remove_use_hint" );
    var_1 delete();
}

_id_C098( var_0 )
{
    return int( ( gettime() - var_0 ) / 1000 );
}

_id_CC8D( var_0, var_1 )
{
    var_2 = anglestoright( var_1 ) * -1;
    var_3 = anglestoforward( var_1 );
    var_4 = anglestoup( var_1 );
    var_5 = var_3 * var_0[0] + var_2 * var_0[1] + var_4 * var_0[2];
    return var_5;
}

_id_C51F()
{
    self useanimtree( #animtree );
    self setcandamage( 1 );
}

_id_B832( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_3 = var_2 istouching( var_1 );
    var_2 delete();
    return var_3;
}

_id_CECD()
{
    var_0 = self getattachsize();

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = self getattachmodelname( var_1 );
        var_3 = self getattachtagname( var_1 );

        if ( issubstr( var_2, "weapon" ) )
            self detach( var_2, var_3 );
    }
}

_id_D04E()
{
    var_0 = getentarray( "force_flash", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_CDA3 );
}

_id_CDA3()
{
    self waittill( "trigger" );
    thread maps\_weather::lightningflash( _id_D245::lightning_normal, _id_D245::lightning_flash );

    if ( isdefined( self.script_noteworthy ) )
        common_scripts\_exploder::exploder( "lightning_strike" );
}

_id_B080()
{
    var_0 = getentarray( "team", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_BF1D, var_0.size );
    maps\_utility::activate_trigger_with_targetname( "team_trigger" );
    common_scripts\utility::flag_wait( "team_initialized" );
}

_id_BF1D( var_0 )
{
    _id_C743( self );

    if ( isdefined( self.script_noteworthy ) )
    {
        if ( self.script_noteworthy == "foley" )
        {
            thread maps\_utility::magic_bullet_shield();
            maps\_utility::make_hero();
            level.foley = self;
        }

        if ( self.script_noteworthy == "dunn" )
        {
            thread maps\_utility::magic_bullet_shield();
            maps\_utility::make_hero();
            level._id_ACC0 = self;
        }
    }

    if ( !isdefined( level.intro_guys ) )
        level.intro_guys = [];

    level.intro_guys[level.intro_guys.size] = self;

    if ( level.team.size == var_0 )
        common_scripts\utility::flag_set( "team_initialized" );
}

_id_C743( var_0 )
{
    var_1 = [];

    if ( !isarray( var_0 ) )
        var_1[var_1.size] = var_0;
    else
        var_1 = var_0;

    common_scripts\utility::array_thread( var_1, ::_id_B507 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.script_noteworthy ) )
        {
            var_3.animname = var_3.script_noteworthy;
            level.team[var_3.script_noteworthy] = var_3;
            continue;
        }

        level.team[level.team.size] = var_3;
    }
}

_id_B507()
{
    self notify( "remove_team" );
    self endon( "remove_team" );
    self waittill( "death" );
    level.team = maps\_utility::array_removedead_keepkeys( level.team );
}

_id_B5C9()
{
    self.colornode_func = ::_id_A829;
}

_id_A829( var_0 )
{
    self endon( "stop_going_to_node" );
    self endon( "stop_color_move" );
    self endon( "death" );
    self waittill( "goal" );

    if ( isdefined( var_0.script_flag_set ) )
        common_scripts\utility::flag_set( var_0.script_flag_set );

    var_0 notify( "trigger", self );
}

_id_AD8F( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level.start_point;

    var_1 = common_scripts\utility::getstructarray( "start_point", "targetname" );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( var_4.script_noteworthy != var_0 )
            continue;

        var_2[var_2.size] = var_4;
    }

    maps\_utility::teleport_players( var_2 );
}

_id_CA03( var_0, var_1 )
{
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        var_4 thread _id_C235( var_1[var_2] );
        var_2++;
    }
}

_id_C235( var_0 )
{
    self forceteleport( var_0.origin, var_0.angles );
    self setgoalpos( self.origin );
}

_id_B8F4()
{
    self endon( "death" );
    self.baseaccuracy = 0.1;
    self.health = 200;
    common_scripts\utility::flag_wait( "whitehouse_path_office" );
    self kill( level.player.origin );
}

fade_out_level( var_0 )
{
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

_id_BC0F()
{
    wait(randomfloatrange( 0.05, 0.5 ));
    var_0 = self getlightintensity();

    for (;;)
    {
        self setlightintensity( var_0 * randomfloatrange( 0.8, 1.1 ) );
        wait 0.05;
    }
}

_id_A802()
{
    self.animname = self.model;
    maps\_utility::assign_animtree();
    var_0 = randomfloatrange( 0.8, 1.5 );
    var_1 = maps\_utility::getanim( "idle" )[0];
    self _meth_83D4( var_1, var_0 );
    thread maps\_anim::anim_loop_solo( self, "idle" );
}

_id_C3F2()
{
    for (;;)
    {
        self addpitch( 24 );
        wait 0.05;
    }
}
#using_animtree("mg42");

player_usable_turret_init()
{
    self _meth_857F( 1 );
    self setdefaultdroppitch( 0 );
    self useanimtree( #animtree );
    self setanim( %h2_dcwhitehouse_turret_m249saw_wait );
    thread player_usable_turret_think();
}

player_usable_turret_think()
{
    for (;;)
    {
        self waittill( "turretownerchange", var_0 );

        if ( var_0 )
        {
            player_usable_turret_use();
            self _meth_841A( 1 );
        }
        else
        {
            self useanimtree( #animtree );
            self clearanim( %h2_dcwhitehouse_turret_m249saw_wait, 0.5 );
        }

        self waittill( "turretownerchange", var_0 );

        if ( var_0 && isalive( level.player ) )
        {
            player_usable_turret_drop();
            self _meth_841A( 0 );
            continue;
        }

        self useanimtree( #animtree );
        self setanim( %h2_dcwhitehouse_turret_m249saw_out );
        var_1 = getanimlength( %h2_dcwhitehouse_turret_m249saw_out );
        common_scripts\utility::delaycall( var_1, ::clearanim, %h2_dcwhitehouse_turret_m249saw_out, 0.0 );
        maps\_utility::add_wait( maps\_utility::_wait, var_1 );
        maps\_utility::add_call( ::setanim, %h2_dcwhitehouse_turret_m249saw_wait );
        maps\_utility::add_endon( "turretownerchange" );
        thread maps\_utility::do_wait();
    }
}

player_usable_turret_use()
{
    level.player freezecontrols( 1 );
    level.player disableweapons( 1 );
    level.player setstance( "crouch" );
    level.player.pre_turret_fov = getdvarfloat( "cg_fov" );
    level.player lerpfov( getstarttime(), getanimlength( %h2_dcwhitehouse_turret_m249saw_in ) );
    var_0 = angleclamp180( self.angles[1] - level.player getplayerangles()[1] );
    var_1 = distance2d( self.origin, level.player.origin );
    var_2 = abs( var_0 ) / 120.0;
    var_3 = var_1 / 150.0;
    var_4 = maps\_utility::linear_interpolate( max( var_2, var_3 ), 0.1, 0.5 );
    self useanimtree( #animtree );
    common_scripts\utility::delaycall( var_4, ::clearanim, %h2_dcwhitehouse_turret_m249saw_wait, 0.0 );
    common_scripts\utility::delaycall( var_4, ::setanim, %h2_dcwhitehouse_turret_m249saw_in );
    maps\_utility::_id_C0F0( "player_turret_in", undefined, 0, var_4, 0, 0, undefined, undefined, undefined, undefined, undefined, 1, 1 );
    var_5 = self gettagorigin( "tag_player" );
    var_6 = anglestoaxis( self gettagangles( "tag_player" ) );
    var_7 = self.origin - var_5;
    level.player.turret_anim_node_offset = ( vectordot( var_7, var_6["forward"] ), vectordot( var_7, var_6["right"] ), vectordot( var_7, var_6["up"] ) );
    level.player._id_C309 hide();
    level.player _meth_84DA( 0 );
    self _meth_8580();
    self clearanim( %h2_dcwhitehouse_turret_m249saw_in, 0.0 );
    thread player_usable_turret_fire();
}

player_usable_turret_fire()
{
    self endon( "turretownerchange" );
    var_0 = undefined;

    for (;;)
    {
        var_1 = level.player attackbuttonpressed();

        if ( !isdefined( var_0 ) || var_0 != var_1 )
        {
            var_0 = var_1;

            if ( var_0 )
            {
                self clearanim( %h2_dcwhitehouse_turret_m249saw_idle, 0.0 );
                self setanim( %h2_dcwhitehouse_turret_m249saw_fire );
            }
            else
            {
                self clearanim( %h2_dcwhitehouse_turret_m249saw_fire, 0.0 );
                self setanim( %h2_dcwhitehouse_turret_m249saw_idle );
            }
        }

        waitframe();
    }
}

player_usable_turret_drop()
{
    self _meth_857D( 75 );
    self _meth_8581();
    level.player _meth_84DB();
    level.player._id_C309 show();
    var_0 = getanimlength( %h2_dcwhitehouse_turret_m249saw_out );
    level.player lerpfov( level.player.pre_turret_fov, var_0 );
    self clearanim( %h2_dcwhitehouse_turret_m249saw_idle, 0.0 );
    self clearanim( %h2_dcwhitehouse_turret_m249saw_fire, 0.0 );
    self setanim( %h2_dcwhitehouse_turret_m249saw_out );
    var_1 = self gettagorigin( "tag_player" );
    var_2 = self gettagangles( "tag_player" );
    var_3 = anglestoaxis( var_2 );
    var_4 = var_1;
    var_4 += level.player.turret_anim_node_offset[0] * var_3["forward"];
    var_4 += level.player.turret_anim_node_offset[1] * var_3["right"];
    var_4 += level.player.turret_anim_node_offset[2] * var_3["up"];
    var_5 = spawn( "script_origin", var_4 );
    var_5.angles = var_2;
    var_5 thread maps\_utility::_id_C0F0( "player_turret_out", undefined, 0, 0.0, 1, 0 );
    wait 0.05;
    var_6 = _func_315( self.origin, self.angles, level.player._id_C309 maps\_utility::getanim( "player_turret_out" ) );
    var_7 = playerphysicstrace( var_6 + ( 0.0, 0.0, 40.0 ), var_6 + ( 0.0, 0.0, -40.0 ) );
    var_8 = spawn( "script_origin", self.origin + var_7 - var_6 );
    var_8.angles = self.angles;
    level.player._id_C309 thread maps\_anim::_id_B6DB( undefined, var_5, var_8, 0.9 * ( var_0 - 0.05 ) );
    wait(var_0 - 0.05);
    self clearanim( %h2_dcwhitehouse_turret_m249saw_out, 0.0 );
    self setanim( %h2_dcwhitehouse_turret_m249saw_wait );
    self _meth_857E();
    var_5 delete();
    var_8 delete();
}

calm_down_courtyard_heroes()
{
    var_0 = [];
    var_0[0] = level.foley;
    var_0[1] = level._id_ACC0;

    foreach ( var_2 in var_0 )
    {
        var_2._id_C8A7 = var_2._id_909A;
        var_2._id_909A = 2000;
    }

    common_scripts\utility::flag_wait( "whitehouse_entrance_init" );

    foreach ( var_2 in var_0 )
        var_2._id_909A = var_2._id_C8A7;
}

intro_scripted_anim( var_0 )
{
    var_0 maps\_anim::anim_single_solo( self, "intro" );

    if ( self == level._id_ACC0 )
    {
        if ( !level.skip_intro_goal )
        {
            var_0 thread maps\_anim::anim_loop_solo( self, "intro_loop", "stop_loop" );

            while ( !level.skip_intro_goal )
                waitframe();

            var_0 notify( "stop_loop" );
        }

        var_0 maps\_anim::anim_single_solo( self, "intro_out" );
    }
    else if ( !level.skip_intro_goal )
        self setgoalpos( self.origin );
}

metal_pan_scripted_anim( var_0 )
{
    maps\_utility::assign_animtree( "pan" );
    var_1 = randomint( 3 );
    maps\_utility::delaythread( var_1, maps\_anim::anim_loop_solo, self, var_0 );
    self setcandamage( 1 );
    self waittill( "damage", var_2, var_3, var_4 );
    maps\_utility::anim_stopanimscripted();
    waitframe();
    self physicslaunchclient( self.origin, var_4 * var_2 );
}

check_trigger()
{
    level.skip_intro_goal = 0;
    var_0 = getent( "post_intro_color_trigger", "targetname" );
    var_0 waittill( "trigger" );
    level.skip_intro_goal = 1;
}

whitehouse_fx_volumes()
{
    level common_scripts\utility::waittill_any( "createfx_common_done", "start_is_set" );

    if ( isdefined( level.createfx_enabled ) && level.createfx_enabled )
        return;

    if ( isdefined( level.start_point ) && level.start_point == "no_game" )
        return;

    var_0 = [ "tunnel", "outside_tunnels", "oval_office", "west_wing1", "west_wing2", "whitehouse_kitchen", "whitehouse_foyer", "whitehouse_top_floor", "whitehouse_penthouse", "ellipse" ];

    foreach ( var_2 in var_0 )
    {
        common_scripts\utility::flag_init( var_2 );
        maps\_utility::_id_D193( var_2, var_2 );
        maps\_utility::_id_CD67( var_2, getentarray( var_2, "targetname" ) );
    }

    switch ( level.start_point )
    {
        case "tunnels":
        case "default":
            common_scripts\utility::flag_set( "tunnel" );
            break;
        case "oval_office":
            common_scripts\utility::flag_set( "oval_office" );
            break;
        case "flare":
            common_scripts\utility::flag_set( "whitehouse_foyer" );
            break;
        default:
            break;
    }
}

h2_marshall_dialogue_foley_ignore_damage()
{
    common_scripts\utility::flag_wait( "whitehouse_marshall_dialogue" );
    level.foley.ignoreall = 1;
    common_scripts\utility::flag_wait( "whitehouse_moveout" );
    wait 6;
    level.foley.ignoreall = 0;
}

h2_wh_static_model_groups()
{
    switch ( level.start_point )
    {
        case "tunnels":
        case "default":
            _func_31C( 1 );
            _func_31C( 2 );
            _func_31C( 4 );
            _func_31C( 5 );
            _func_31C( 6 );
            _func_31C( 7 );
            break;
        case "oval_office":
            _func_31C( 1 );
            _func_31C( 4 );
            _func_31C( 5 );
            _func_31C( 6 );
            _func_31C( 7 );
            break;
        case "flare":
            _func_31C( 3 );
            break;
        default:
            break;
    }

    thread h2_wh_static_model_group_thread( 1, "west_wing_windows" );
    thread h2_wh_static_model_group_thread( 2, "smodelgroup_2" );
    thread h2_wh_static_model_group_thread( 3, "smodelgroup_3" );
    thread h2_wh_static_model_group_thread( 4, "smodelgroup_4" );
    thread h2_wh_static_model_group_thread( 5, "smodelgroup_5" );
    thread h2_wh_static_model_group_thread( 6, "smodelgroup_6" );
    thread h2_wh_static_model_group_thread( 7, "smodelgroup_7" );
}

h2_wh_static_model_group_thread( var_0, var_1 )
{
    for (;;)
    {
        common_scripts\utility::flag_wait( var_1 );
        _func_31B( var_0 );
        common_scripts\utility::flag_waitopen( var_1 );
        _func_31C( var_0 );
    }
}

h2_wh_animated_lantern()
{
    self.animname = "lantern";
    maps\_utility::assign_animtree();
    wait(randomfloatrange( 0, 3 ));
    maps\_anim::anim_set_rate( [ self ], "idle", randomfloatrange( 0.8, 1.2 ) );
    thread maps\_anim::anim_loop_solo( self, "idle", "kill_anim" );
}

h2_wh_flickering_lantern( var_0 )
{
    h2_wh_animated_lantern();
    var_1 = common_scripts\utility::getclosest( self.origin, var_0, 100 );
    playfxontag( level._effect["lamp_ceiling_dust"], self, "tag_light" );

    for (;;)
    {
        h2_wh_flickering_lantern_on( var_1 );
        wait(randomfloatrange( 0.5, 6 ));
        h2_wh_flickering_lantern_off( var_1 );
        wait(randomfloatrange( 0.05, 0.2 ));

        if ( !randomintrange( 0, 4 ) )
        {
            thread h2_wh_flickering_lantern_on( var_1 );
            wait(randomfloatrange( 0.05, 0.2 ));
            thread h2_wh_flickering_lantern_off( var_1 );
            wait(randomfloatrange( 0.05, 0.2 ));
        }
    }
}

h2_wh_flickering_lantern_on( var_0 )
{
    playfxontag( level._effect["lamp_ceiling_glow"], self, "tag_light" );

    if ( isdefined( var_0 ) )
        var_0 setlightintensity( 150 );
}

h2_wh_flickering_lantern_off( var_0 )
{
    killfxontag( level._effect["lamp_ceiling_glow"], self, "tag_light" );

    if ( isdefined( var_0 ) )
        var_0 setlightintensity( 0 );
}

delete_weapon_in_volume()
{
    var_0 = getentarray( "delete_weapons_volume", "targetname" );

    for (;;)
    {
        var_1 = getweaponarray();

        foreach ( var_3 in var_1 )
        {
            foreach ( var_5 in var_0 )
            {
                if ( isdefined( var_3 ) && !_func_2A5( var_3 ) && var_3 istouching( var_5 ) )
                {
                    var_3 delete();
                    common_scripts\utility::array_remove( var_1, var_3 );
                }
            }
        }

        waitframe();
    }
}
