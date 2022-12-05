// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_B1D8( var_0 )
{
    var_0["left"].close_pos = var_0["left"].origin;
    var_0["right"].close_pos = var_0["right"].origin;
    var_1 = ( -38.0, 0.0, 0.0 );
    var_0["left"]._id_C47D = var_0["left"].origin - var_1;
    var_0["right"]._id_C47D = var_0["right"].origin + var_1;
}

_id_B17A( var_0, var_1, var_2 )
{
    var_1 playsound( "elev_door_close" );
    var_0["left"] disconnectpaths();
    var_0["right"] disconnectpaths();

    if ( !isdefined( var_2 ) )
        var_2 = 14;

    var_3 = var_0["left"].close_pos;
    var_4 = abs( distance( var_0["left"]._id_C47D, var_3 ) );
    var_5 = var_4 / var_2;
    var_0["left"] moveto( var_3, var_5, var_5 * 0.1, var_5 * 0.25 );
    var_0["right"] moveto( var_3, var_5, var_5 * 0.1, var_5 * 0.25 );
    var_0["left"] waittill( "movedone" );
}

_id_AEF9( var_0, var_1 )
{
    var_1 playsound( "elev_door_open" );
    var_0["left"] connectpaths();
    var_0["right"] connectpaths();
    var_2 = 14;
    var_3 = var_0["left"].close_pos;
    var_4 = abs( distance( var_0["left"]._id_C47D, var_3 ) );
    var_5 = var_4 / var_2 * 0.5;
    var_0["left"] moveto( var_0["left"]._id_C47D, var_5, var_5 * 0.1, var_5 * 0.25 );
    var_0["right"] moveto( var_0["right"]._id_C47D, var_5, var_5 * 0.1, var_5 * 0.25 );
    var_0["left"] waittill( "movedone" );
}

_id_CB22()
{
    common_scripts\utility::flag_init( "player_DMS_disable_auto_sprint" );
    var_0 = 0.75;
    var_1 = 250;
    var_2 = 750;
    level.player._id_B13E = 0;
    setdynamicdvar( "debug_playerDMS", 0 );

    for (;;)
    {
        var_3 = common_scripts\utility::ter_op( isdefined( level.player.baseline_speed_scale_max ), level.player.baseline_speed_scale_max, 1.1 );
        var_4 = min( level.player._id_B3A6 * level.player._id_BC6E, var_3 );
        var_5 = level.player._id_BC6E > 1.65 && !common_scripts\utility::flag( "player_DMS_disable_auto_sprint" ) || common_scripts\utility::flag( "player_DMS_allow_sprint" );
        level.player _meth_830F( var_5 );

        if ( var_4 < var_0 )
        {
            if ( var_5 && level.player issprinting() )
            {
                var_4 = var_0;
                level.player._id_B13E = gettime();
            }
            else
            {
                var_6 = gettime() - level.player._id_B13E;

                if ( var_6 < var_1 + var_2 )
                {
                    if ( var_6 < var_1 )
                        var_4 = var_0;
                    else
                        var_4 = maps\_utility::linear_interpolate( ( var_6 - var_1 ) / var_2, var_0, var_4 );
                }
            }
        }

        if ( !isdefined( level.player._id_D52D ) || var_4 != level.player._id_D52D )
        {
            level.player setmovespeedscale( var_4 );
            level.player._id_D52D = var_4;
        }

        waitframe();
    }
}

_id_CF9B( var_0, var_1 )
{
    var_2 = self;

    if ( !isplayer( var_2 ) )
        var_2 = level.player;

    var_2 notify( "blend_movespeedscale_custom" );
    var_2 endon( "blend_movespeedscale_custom" );

    if ( !isdefined( var_2._id_B3A6 ) )
        var_2._id_B3A6 = 1.0;

    var_3 = var_0 * 0.01;
    var_4 = var_2._id_B3A6;

    if ( isdefined( var_1 ) )
    {
        var_5 = var_3 - var_4;
        var_6 = 0.05;
        var_7 = var_1 / var_6;
        var_8 = var_5 / var_7;

        while ( abs( var_3 - var_4 ) > abs( var_8 * 1.1 ) )
        {
            var_4 += var_8;
            var_2._id_B3A6 = var_4;
            wait(var_6);
        }
    }

    var_2._id_B3A6 = var_3;
}

_id_D2EA()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    level endon( "player_enter_ambulance" );
    common_scripts\utility::flag_clear( "player_DMS_allow_sprint" );
    common_scripts\utility::flag_set( "player_dynamic_move_speed" );
    var_0 = 1;
    var_1 = undefined;

    foreach ( var_3 in level.team )
        var_3._id_B6EE = spawnstruct();

    while ( common_scripts\utility::flag( "player_dynamic_move_speed" ) )
    {
        var_5 = common_scripts\utility::getclosest( level.player.origin, level.team );
        var_6 = 0;
        var_7 = ( level.player.origin[0], level.player.origin[1], 0 );
        var_8 = ( var_5.origin[0], var_5.origin[1], 0 );

        if ( distancesquared( var_7, var_8 ) < squared( 200 ) )
        {
            var_6 = var_5 _id_A915();
            var_5._id_B6EE.origin = var_5 _id_B235();
            var_1 = var_5._id_B6EE;
        }
        else
        {
            foreach ( var_3 in level.team )
            {
                var_6 = var_3 _id_A915();

                if ( var_6 )
                    break;
            }

            var_11 = [];

            foreach ( var_3 in level.team )
            {
                var_3._id_B6EE.origin = var_3 _id_B235();
                var_11[var_11.size] = var_3._id_B6EE;
            }

            var_1 = common_scripts\utility::getclosest( level.player.origin, var_11 );
        }

        if ( distancesquared( level.player.origin, var_1.origin ) > squared( 100 ) && var_6 )
        {
            if ( var_0 > 0.55 )
                var_0 -= 0.015;
        }
        else if ( distancesquared( level.player.origin, var_1.origin ) < squared( 50 ) || var_6 )
        {
            if ( var_0 < 0.78 )
                var_0 += 0.015;

            if ( var_0 > 0.8 )
                var_0 -= 0.015;
        }
        else if ( distancesquared( level.player.origin, var_1.origin ) > squared( 300 ) )
        {
            if ( var_0 < 1.75 )
                var_0 += 0.02;
        }
        else if ( distancesquared( level.player.origin, var_1.origin ) > squared( 100 ) )
        {
            if ( var_0 < 1.35 )
                var_0 += 0.01;
        }
        else if ( distancesquared( level.player.origin, var_1.origin ) < squared( 85 ) )
        {
            if ( var_0 > 1.0 )
                var_0 -= 0.01;

            if ( var_0 < 1.0 )
                var_0 += 0.01;
        }

        level.player._id_BC6E = var_0;
        wait 0.05;
    }
}

_id_B235()
{
    var_0 = level.player.origin;
    var_1 = self.origin + anglestoright( self.angles ) * -500;
    var_2 = self.origin + anglestoright( self.angles ) * 500;
    return pointonsegmentnearesttopoint( var_1, var_2, var_0 );
}

_id_A915()
{
    var_0 = 0;

    if ( isdefined( self.last_set_goalent ) )
        var_0 = self [[ level.drs_ahead_test ]]( self.last_set_goalent, 50 );
    else if ( isdefined( self.last_set_goalnode ) )
        var_0 = self [[ level.drs_ahead_test ]]( self.last_set_goalnode, 50 );
    else if ( common_scripts\utility::flag( "player_set_speed_stairs" ) && !common_scripts\utility::flag( "stairs_go_up" ) )
        var_0 = 1;
    else
    {
        var_1 = anglestoforward( self.angles );

        foreach ( var_3 in level.players )
        {
            var_4 = var_3.origin - self.origin;

            if ( vectordot( var_4, var_1 ) > 50 )
            {
                var_0 = 1;
                break;
            }
        }
    }

    return var_0;
}

_id_BD2D()
{
    var_0 = getent( "intro_security_sign", "targetname" );
    var_1 = 1;
    var_2 = 1;
    var_3 = 0.5;
    playfx( common_scripts\utility::getfx( "sign_fx" ), var_0.origin + ( 0.0, 120.0, 5.0 ) );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_airport_security_sign_falling" );
    var_0 rotatepitch( -45, var_2, var_2 * 0.5, var_2 * 0.5 );
    playfx( common_scripts\utility::getfx( "sign_fx" ), var_0.origin );
    var_0 physicslaunchclient( var_0.origin + ( 0.0, 5.0, -25.0 ), ( 1000.0, 5000.0, 0.1 ) );
}

h2_secrutiy_sign_se()
{
    var_0 = getent( "Sign_01", "targetname" );
    var_1 = getent( "Sign_02", "targetname" );
    var_0.animname = "sign";
    var_1.animname = "sign";
    var_0 maps\_anim::setanimtree();
    var_1 maps\_anim::setanimtree();
    common_scripts\_exploder::exploder( "vfx_add_bullets_2" );
    wait 0.8;
    common_scripts\_exploder::exploder( "vfx_add_bullets_3" );
    wait 0.25;
    maps\_utility::_radiusdamage( var_0.origin, 50, 10, 5 );
    var_0 thread maps\_anim::anim_single_solo( var_0, "security_sign_anim_01" );
    wait 1.8;
    common_scripts\_exploder::exploder( "vfx_add_bullets_1" );
    wait 0.45;
    maps\_utility::_radiusdamage( var_1.origin, 100, 10, 5 );
    var_1 thread maps\_anim::anim_single_solo( var_1, "security_sign_anim_02" );
}

_id_C282()
{
    var_0 = getentarray( "elev_num", "targetname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
        var_1[var_3.script_noteworthy] = var_3;

    var_5 = [];
    var_5["left"] = getent( "intro_elevator_door_left", "targetname" );
    var_5["right"] = getent( "intro_elevator_door_right", "targetname" );
    _id_B1D8( var_5 );
    var_6 = spawn( "script_origin", var_5["left"].close_pos );
    var_7 = spawn( "script_origin", var_5["left"].close_pos );
    var_6 playsound( "elev_run_start" );
    thread common_scripts\utility::play_sound_in_space( "scn_airport_elevator_opening_long", level.player.origin + ( 0.0, 0.0, 70.0 ) );
    wait 5.5;
    wait 4.5;
    var_6 playsound( "elevator_pass_floor_beep" );
    wait 6.5;
    var_6 playsound( "elevator_pass_floor_beep" );
    wait 4.5;
    var_6 playsound( "elevator_pass_floor_beep" );
    wait 2;
    level.team["makarov"] thread maps\_utility::dialogue_queue( "airport_mkv_snamibog" );
    wait 2;
    thread common_scripts\utility::play_sound_in_space( "elev_run_end", var_6.origin );
    wait 1;
    var_6 playsound( "elev_bell_ding" );
    wait 0.5;
    _id_AEF9( var_5, var_6 );
    common_scripts\utility::flag_set( "elevator_up_done" );
    wait 1;
    var_6 delete();
    var_7 delete();
    maps\_utility::delaythread( 1, ::_id_BC3A );
}

_id_C8E1()
{
    maps\_utility::enableplayerweapons( 0 );
    thread _id_B989();
    wait 5;
    wait 5.5;
    wait 2.55;
    maps\_utility::enableplayerweapons( 1 );
    setsaveddvar( "ammoCounterHide", "1" );
    level.player takeweapon( "m4_grenadier_airport" );
    level.player takeweapon( "ump45" );
    level.player takeweapon( "fraggrenade" );
    level.player takeweapon( "flash_grenade" );
    wait 4.7;

    if ( !isdefined( level._id_A87F.tactical_greenberet ) || !level._id_A87F.tactical_greenberet )
    {
        level.player giveweapon( "saw_airport" );
        level.player switchtoweapon( "saw_airport" );
    }

    wait 22;
    level.player takeweapon( "saw_airport" );
    level.player enableoffhandweapons();
    maps\_utility::enableplayerweapons( 0 );
    setsaveddvar( "ammoCounterHide", "0" );

    if ( !isdefined( level._id_A87F.tactical_greenberet ) || !level._id_A87F.tactical_greenberet )
    {
        level.player giveweapon( "m4_grenadier_airport" );
        level.player giveweapon( "ump45" );
        level.player setoffhandprimaryclass( "fraggrenade" );
        level.player giveweapon( "fraggrenade" );
        level.player setoffhandsecondaryclass( "flash_grenade" );
        level.player giveweapon( "flash_grenade" );
        level.player givemaxammo( "ump45" );
        level.player setweaponammoclip( "ump45", 30 );
        level.player switchtoweapon( "ump45" );
    }

    maps\_utility::enableplayerweapons( 1 );
}

_id_B989()
{
    wait 22;
    var_0 = _id_D397::_id_A97A( "airport_intro" );
    var_0 _id_D397::_id_BC26();
}

_id_CAAE( var_0 )
{
    var_1 = var_0[self.targetname];

    foreach ( var_3 in var_1 )
    {
        var_4 = getent( var_3["model"], "targetname" );
        var_4.count = 1;

        if ( var_3["anime"] == "airport_civ_in_line_6_C" )
        {
            var_4.target = "lobby_girl_run_node";
            var_4.script_moveoverride = 1;
        }
        else
        {
            var_4.target = undefined;
            var_4.script_moveoverride = undefined;
        }

        var_5 = maps\_utility::dronespawn( var_4 );
        var_5._id_C97A = self;
        var_5.anime = var_3["anime"];
        var_5.script_delay = var_3["delay"];
        var_5._id_CA5A = var_3["deathanim"];
        var_5.deathtime = var_3["deathtime"];

        if ( isdefined( var_3["body"] ) ) {
            var_5 setmodel( var_3["body"] );
        }

        if ( isdefined( var_3["deleteme"] ) )
            var_5.deleteme = var_3["deleteme"];

        var_5.dontdonotetracks = 1;
        var_5.nocorpsedelete = 1;
        var_5 thread _id_AE45();
    }
}
#using_animtree("generic_human");

_id_C08D()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.team = "neutral";
    maps\_utility::gun_remove();
    var_0 = spawnstruct();
    var_0.angles = self.angles;
    var_0.origin = self.origin;
    var_0 maps\_anim::anim_generic_first_frame( self, self.animation );
    self.dontdonotetracks = 1;
    self.nocorpsedelete = 1;
    common_scripts\utility::flag_wait( "lobby_scene_pre_animate" );

    if ( self.animation == "airport_civ_in_line_13_C" )
    {
        self.deathanim = %exposed_death_falltoknees;
        wait 0.7;
    }
    else
        self.deathanim = %exposed_death_twist;

    self.health = 1;
    var_0 thread maps\_anim::anim_generic( self, self.animation );
    maps\_utility::set_allowdeath( 1 );
    self.noragdoll = 1;
    common_scripts\utility::flag_wait( "lobby_open_fire" );
    wait(randomfloatrange( 0.15, 0.25 ));
    self kill();
}

_id_AE45()
{
    level.entities_to_delete_before_massacre[level.entities_to_delete_before_massacre.size] = self;
    thread _id_C2D3();

    if ( !isdefined( level._id_AD88 ) )
        level._id_AD88 = 0;

    level._id_AD88++;
    var_0 = common_scripts\utility::getstruct( "intro_elevator_anim_node", "targetname" );
    var_0 thread maps\_anim::anim_generic( self, self.anime );
    wait 0.05;
    self stopanimscripted();
    var_0 maps\_anim::anim_generic_first_frame( self, self.anime );
    thread _id_B177();

    if ( self.anime == "h2_airport_intro_policeman1" || self.anime == "h2_airport_intro_policeman2" )
        maps\_utility::gun_remove();

    common_scripts\utility::flag_wait( "start_civilians" );
    thread _id_BCC2();
    self.health = 1000000;

    if ( isdefined( self._id_CA5A ) )
    {
        var_0 thread maps\_anim::anim_generic( self, self.anime );
        wait(self.deathtime);
        self stopanimscripted();
        maps\_anim::anim_generic( self, self._id_CA5A );
    }
    else if ( self.anime == "airport_civ_in_line_6_C" )
    {
        var_0 thread maps\_anim::anim_generic( self, self.anime );
        var_1 = getanimlength( maps\_utility::getgenericanim( self.anime ) );
        var_1 -= 0.2;
        wait(var_1);
        var_0 = spawnstruct();
        var_0.origin = self.origin;
        var_0.angles = self.angles + ( 0.0, 180.0, 0.0 );
        var_0 maps\_anim::anim_generic( self, "run_death3" );
    }
    else
        var_0 maps\_anim::anim_generic( self, self.anime );

    self.noragdoll = 1;
    self.skipdeathanim = 1;
    self kill();

    if ( isdefined( self.deleteme ) )
    {
        var_2[0] = self;
        childthread maps\_utility::ai_delete_when_out_of_sight( var_2, 60 );
    }
}

_id_C2D3()
{
    self waittill( "death" );
    level._id_AD88--;

    if ( !level._id_AD88 )
        common_scripts\utility::flag_set( "lobby_to_stairs_go" );
}

_id_CA65()
{
    self.drone_reaction_delay = randomfloatrange( 0.0, 1.0 );
    _id_D57B();

    if ( isdefined( self ) )
        self notify( "move" );

    while ( !common_scripts\utility::flag( "player_set_speed_stairs" ) )
    {
        wait 0.2;

        if ( !isdefined( self ) )
            break;

        if ( distancesquared( self.origin, level.player.origin ) < squared( 2048 ) )
            continue;

        if ( maps\_utility::player_looking_at( self.origin + ( 0.0, 0.0, 48.0 ) ) )
            continue;

        break;
    }

    if ( isdefined( self ) )
        self delete();
}

_id_D57B()
{
    level.entities_to_delete_before_massacre[level.entities_to_delete_before_massacre.size] = self;
    self endon( "death" );
    self.maxhealth = 1;
    self.health = 1;
    self.ignoreexplosionevents = 1;
    self.ignoreme = 1;

    if ( issentient( self ) )
        self.ignorerandombulletdamage = 1;
    else
        maps\_utility::enable_ignorerandombulletdamage_drone();

    self.grenadeawareness = 0;
    maps\_utility::disable_surprise();
    var_0 = self.script_animation;

    if ( !isdefined( var_0 ) )
        var_0 = "civilian_stand_idle";

    maps\_utility::set_allowdeath( 1 );
    maps\_utility::delaythread( randomfloatrange( 0, 3 ), maps\_anim::anim_generic_loop, self, var_0 );

    if ( isdefined( self.script_noteworthy ) && ( self.script_noteworthy == "crawler" || self.script_noteworthy == "crawler2" ) )
        _id_D225();
    else
        _id_D0D6();
}

_id_D0D6()
{
    if ( isai( self ) )
    {
        thread maps\_utility::deletable_magic_bullet_shield();
        self.a.disablepain = 1;
    }

    common_scripts\utility::flag_wait( "lobby_open_fire" );
    wait 0.5;

    if ( isdefined( self.drone_reaction_delay ) )
        wait(self.drone_reaction_delay);

    self notify( "stop_loop" );
    self stopanimscripted();
}

_id_D225()
{
    if ( self.script_noteworthy == "crawler" )
    {
        self.oldcontents = self setcontents( 0 );
        maps\_utility::force_crawling_death( 180, 5 );
    }
    else if ( self.script_noteworthy == "crawler2" )
        maps\_utility::force_crawling_death( 110, 2, level.scr_anim["crawl_death_1"] );

    common_scripts\utility::flag_wait( "lobby_open_fire" );
    wait 0.5;

    if ( isdefined( self.drone_reaction_delay ) )
        wait(self.drone_reaction_delay);

    self notify( "stop_loop" );
    self stopanimscripted();

    if ( self.script_noteworthy == "crawler2" )
        self dodamage( 1, level.player.origin );
    else if ( self.script_noteworthy == "crawler" )
    {
        self dodamage( 1, level.player.origin );
        wait 8;
        self setcontents( self.oldcontents );
        wait 11;
        self setcontents( 0 );
        wait 5;
        self setcontents( self.oldcontents );
    }
}

_id_D12C()
{
    common_scripts\utility::flag_wait( "lobby_to_stairs_flow" );
    common_scripts\utility::flag_waitopen( "lobby_to_stairs_flow" );
    common_scripts\utility::flag_wait( "lobby_to_stairs_flow" );
    wait 11;
    var_0 = getent( "upperdeck_terror", "targetname" );
    var_0 playloopsound( "scn_airport_crowd_stairs_loop" );
    common_scripts\utility::flag_wait_or_timeout( "stairs_top_open_fire", 16.5 );
    var_0 stopsounds();
    var_0 playsound( "scn_airport_crowd_stairs_end" );
}

_id_D1C7()
{
    self waittill( "spawned" );
    wait 1;
    common_scripts\utility::flag_clear( "lobby_to_stairs_flow" );
    level._id_B435 = undefined;
    wait 8;
    self.count = 1;
    maps\_utility::spawn_ai();
}

_id_AC0B( var_0 )
{
    common_scripts\utility::flag_wait( "lobby_to_stairs_flow" );
    wait 0.1;
    thread _id_C8F2( level._id_B435, var_0 );
}

_id_B435()
{
    self endon( "death" );
    self.interval = 50;
    self.health = 1;

    if ( !isdefined( level._id_B435 ) )
        level._id_B435 = [];

    level._id_B435[level._id_B435.size] = self;
    common_scripts\utility::flag_set( "lobby_to_stairs_flow" );
    thread _id_C8A4();
    maps\_utility::add_wait( maps\_utility::waittill_msg, "reached_path_end" );
    maps\_utility::add_call( ::delete );
    thread maps\_utility::do_wait();

    while ( !common_scripts\utility::flag( "stairs_top_open_fire" ) )
    {
        wait 0.2;

        if ( distancesquared( self.origin, level.player.origin ) < squared( 2048 ) )
            continue;

        if ( maps\_utility::player_looking_at( self.origin + ( 0.0, 0.0, 48.0 ) ) )
            continue;

        self delete();
    }

    wait 1;
    self kill();
}

_id_C8A4()
{
    self endon( "death" );
    self waittill( "goal" );
    wait 0.5;
    maps\_utility::set_generic_run_anim_array( "stairs_up", "stairs_up_weights" );
    self waittill( "goal" );
    maps\_utility::set_generic_run_anim_array( "civ_run_array" );
}

_id_C8F2( var_0, var_1 )
{
    var_0 = maps\_utility::array_removedead( var_0 );
    var_2 = maps\_utility::get_average_origin( var_0 );
    var_3 = spawn( "script_origin", var_2 + ( 0.0, 0.0, 64.0 ) );
    var_3 playsound( var_1 );

    for ( var_4 = 0.1; var_0.size; var_0 = maps\_utility::array_removedead( var_0 ) )
    {
        var_2 = maps\_utility::get_average_origin( var_0 );
        var_3 moveto( var_2 + ( 0.0, 0.0, 64.0 ), var_4 );
        wait(var_4);
    }

    var_3 playrumbleonentity();
    wait 0.05;
    var_3 delete();
}

_id_C57A()
{
    self endon( "death" );
    self setgoalpos( self.origin );
    self.goalradius = 16;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.ignoresuppression = 1;
    maps\_utility::disable_surprise();
    self.disablebulletwhizbyreaction = 1;
    self.a.disablepain = 1;
    thread maps\_utility::deletable_magic_bullet_shield();
    self.noreload = 1;
    maps\_utility::enable_dontevershoot();
    wait 1.8;

    switch ( self.script_animation )
    {
        case "airport_security_guard_2":
            self.deathanim = %airport_security_guard_2_reaction;
            wait 1.75;
            break;
        case "airport_security_guard_4":
            self.deathanim = %airport_security_guard_4_reaction;
            break;
        case "airport_security_guard_3":
            self.deathanim = %airport_security_guard_3_reaction;
            wait 1.75;
            break;
    }

    maps\_utility::gun_remove();
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, self.script_animation );

    if ( self.script_animation == "airport_security_guard_4" )
    {
        thread _id_B794();
        thread intro_security_cleanup();
    }

    self.a.nodeath = 1;
    self.noragdoll = 1;

    if ( self.script_animation == "airport_security_guard_2" )
    {
        var_1 = getent( "lobby_security_door", "targetname" );
        var_2 = getent( "lobby_security_door_model", "targetname" );
        var_2 linkto( var_1 );
        wait 0.3;
        maps\_utility::_radiusdamage( var_1.origin, 50, 10, 5 );
        wait 0.9;
        var_1 maps\_utility::_rotateyaw( 60, 0.5, 0.05, 0.35 );
    }

    if ( self.script_animation == "airport_security_guard_4" )
        maps\_utility::forceuseweapon( self.sidearm, "primary" );

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self.a.nodeath = 0;
    self.noragdoll = undefined;
    self.a.disablepain = 0;
    self.health = 100000;
    thread _id_CC92();
    var_0 maps\_anim::anim_generic( self, self.script_animation );
    self kill();
}

_id_B794()
{
    wait 0.9;
    setsaveddvar( "cg_hudGrenadeIconMaxRangeFrag", 0 );
    level._id_D41B.grenadeammo++;
    var_0 = ( 0.0, 0.0, -1.0 );
    var_1 = 1;
    level._id_D41B magicgrenademanual( ( 5902.0, 2208.0, 96.0 ), var_0, var_1 );
}

intro_security_cleanup()
{
    wait 1.5;
    setsaveddvar( "cg_hudGrenadeIconMaxRangeFrag", level.grenadeiconmaxrange );
}

_id_CC92()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( isplayer( var_1 ) )
            break;
    }

    self.allowdeath = 1;
    self kill();
}

_id_C807()
{
    self endon( "death" );
    _id_D57B();

    if ( !isdefined( level._id_C05F ) )
        level._id_C05F = 0;

    if ( !isdefined( self.script_noteworthy ) || self.script_noteworthy != "crawler2" )
        level._id_C05F++;

    thread _id_CBB3();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "new_lobby_people" )
        thread _id_C317();
    else
        thread _id_BB30();
}

_id_CBB3()
{
    self waittill( "death" );
    level._id_C05F--;

    if ( level._id_C05F == 0 )
        common_scripts\utility::flag_set( "lobby_ai_peeps_dead" );
}

_id_C317()
{
    common_scripts\utility::flag_wait( "lobby_to_stairs_go" );
    wait 0.5;

    if ( !isalive( self ) )
        return;

    self endon( "death" );
    self.a.disablepain = 0;
    maps\_utility::stop_magic_bullet_shield();

    switch ( self.animation )
    {
        case "unarmed_cowercrouch_react_B":
            thread maps\_anim::anim_generic_loop( self, "unarmed_cowercrouch_idle" );
            break;
        case "airport_civ_cellphone_hide":
            thread maps\_anim::anim_generic_first_frame( self, self.animation );
            self.deathanim = %airport_civ_cellphone_death;
            break;
        case "coup_civilians_interrogated_civilian_v3":
            thread _id_D28D();
        default:
            thread maps\_anim::anim_generic_loop( self, self.animation );
            break;
    }

    common_scripts\utility::flag_wait( "lobby_cleanup" );

    switch ( self.animation )
    {
        case "unarmed_cowercrouch_react_B":
            wait 1.5;
            thread maps\_anim::anim_generic( self, self.animation );
            break;
        case "airport_civ_cellphone_hide":
            wait 0.65;
            maps\_anim::anim_generic( self, self.animation );
            _id_C9AB( "killshot" );
            self kill();
            break;
    }

    common_scripts\utility::flag_wait( "lobby_cleanup_spray" );

    switch ( self.animation )
    {
        case "cliffhanger_capture_Price_idle":
            wait(randomfloatrange( 0.5, 3.0 ));
            self notify( "stop_loop" );
            self stopanimscripted();
            self.health = 1;
            self.allowdeath = 1;
            thread maps\_anim::anim_generic( self, "civ_stand_2_run_l" );
            self.deathanim = %run_death_facedown;
            var_0 = getanimlength( maps\_utility::getanim_generic( "civ_stand_2_run_l" ) );
            wait(var_0 - 0.2);
            self stopanimscripted();
            _id_C9AB( "bodyshot" );
            thread maps\_anim::anim_generic( self, "civ_fallon_knee" );
            wait 1.25;
            self.noragdoll = 1;
            _id_C9AB( "killshot" );
            self kill();
            break;
        case "unarmed_cowercrouch_react_B":
            wait 2.75;
            _id_C9AB( "killshot" );
            self kill();
            break;
        case "coup_civilians_interrogated_civilian_v3":
            wait 0.25;
            _id_C9AB( "killshot" );
            self kill();
            break;
    }
}

_id_D28D()
{
    if ( getdvarint( "ragdoll_enable" ) )
        self.a.nodeath = 1;

    self waittill( "damage" );

    if ( getdvarint( "ragdoll_enable" ) )
        self startragdoll();
    else
        self kill();
}

_id_BB30()
{
    if ( isdefined( self.script_noteworthy ) && ( self.script_noteworthy == "crawler" || self.script_noteworthy == "crawler2" ) )
        return;

    self endon( "death" );
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    maps\_utility::set_generic_run_anim_array( "civ_run_array" );
    var_1 = var_0.script_animation + "_reach";
    var_0 maps\_anim::anim_generic_reach( self, var_1 );
    var_0 thread maps\_anim::anim_generic_loop( self, var_0.script_animation );
    common_scripts\utility::flag_wait( "lobby_to_stairs_go" );
    wait 0.5;
    self.a.disablepain = 0;
    maps\_utility::stop_magic_bullet_shield();
    self.allowdeath = 1;
    common_scripts\utility::flag_wait( "lobby_cleanup" );
    self.ignorerandombulletdamage = 1;
    self.health = 1;

    if ( var_0.script_animation == "unarmed_cowercrouch_idle" )
    {
        var_0 notify( "stop_loop" );
        maps\_anim::anim_generic( self, "unarmed_cowercrouch_react_A" );
        thread maps\_anim::anim_generic_loop( self, "unarmed_cowerstand_pointidle" );
        wait 0.4;
    }

    common_scripts\utility::flag_wait( "lobby_cleanup_spray" );

    switch ( var_0.script_animation )
    {
        case "cliffhanger_capture_Price_idle":
            var_0 notify( "stop_loop" );
            self notify( "stop_loop" );
            self stopanimscripted();
            self.health = 1;
            self.allowdeath = 1;
            thread maps\_anim::anim_generic( self, "civ_stand_2_run_l" );
            wait 1;
            self.deathanim = %run_death_roll;
            self.noragdoll = 1;
            _id_C9AB( "killshot" );
            self kill();
            break;
        case "exposed_squat_idle_grenade_F":
            wait 0.5;
            var_0 notify( "stop_loop" );
            self notify( "stop_loop" );
            self stopanimscripted();
            self.health = 1;
            self.allowdeath = 1;
            thread maps\_anim::anim_generic( self, "crouch_2run_L" );
            wait 1;
            self.deathanim = %run_death_facedown;
            self.noragdoll = 1;
            _id_C9AB( "killshot" );
            self kill();
            break;
        case "unarmed_cowercrouch_idle":
            var_0 notify( "stop_loop" );
            self notify( "stop_loop" );
            self stopanimscripted();
            self.health = 1;
            var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
            var_0 maps\_anim::anim_generic_reach( self, var_0.script_animation );
            self.ignorerandombulletdamage = 1;
            var_0 thread maps\_anim::anim_generic( self, var_0.script_animation );
            thread _id_D28D();
            wait 1;
            _id_C9AB( "killshot" );
            self kill();
            break;
        case "coup_civilians_interrogated_civilian_v1":
            var_0 notify( "stop_loop" );
            self notify( "stop_loop" );
            self stopanimscripted();
            self.health = 1;
            self.allowdeath = 1;
            maps\_utility::enable_exits();
            var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
            var_0 maps\_anim::anim_generic_reach( self, var_0.script_animation );
            self.ignorerandombulletdamage = 1;
            var_0 thread maps\_anim::anim_generic( self, var_0.script_animation );
            break;
    }
}

_id_C043( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    _id_ADC9();
    self.combatmode = "cover";
    self.noreload = 1;
    thread _id_C832( var_0 );
}

_id_C832( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    common_scripts\utility::flag_wait( "lobby_open_fire" );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = 7.5;

    switch ( self.script_noteworthy )
    {
        case "saw":
            var_2 = 1.25;
            var_3 = 1;
            var_1 = 0.05;
            var_4 += 0.5;
            break;
        case "shotgun":
            var_2 = 0.85;
            var_3 = 0;
            var_1 = 0.5;
            var_4 += 0.1;
            break;
        case "makarov":
            var_2 = 1.05;
            var_3 = 1;
            var_1 = 0.25;
            var_4 += 0.15;
            break;
        case "m4":
            var_2 = 1.45;
            var_3 = 0;
            var_1 = 0.3;
            var_4 += 0.25;
            break;
    }

    self.combatstandanims = undefined;
    _id_AD44( var_1, "Stop_Shooting" );
}

_id_D280( var_0 )
{
    self.combatstandanims = anim.archetypes["casual_killer_makarov"]["default_stand"];
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    _id_C8C8();

    if ( common_scripts\utility::flag( "player_set_speed_stairs" ) )
        return;

    level endon( "player_set_speed_stairs" );
    maps\_utility::enable_arrivals();
    maps\_utility::enable_exits();

    if ( !common_scripts\utility::flag( "lobby_ai_peeps_dead" ) )
    {
        thread _id_AD69();
        thread _id_AD44( 0.1, "stop_spray_and_pray" );
        common_scripts\utility::flag_wait( "lobby_ai_peeps_dead" );
        self notify( "stop_spray_and_pray" );
    }

    common_scripts\utility::flag_wait( "stairs_go_up" );
    maps\_utility::set_run_anim( "casual_killer_jog_A" );
}

_id_C916()
{
    common_scripts\utility::flag_clear( "player_dynamic_move_speed" );
    wait 0.05;
    common_scripts\utility::flag_set( "player_DMS_allow_sprint" );
    common_scripts\utility::flag_wait( "player_set_speed_upperstairs" );
    thread _id_D2EA();
}

_id_C854( var_0 )
{
    self.combatstandanims = anim.archetypes["casual_killer_saw"]["default_stand"];
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    maps\_utility::enable_exits();
    maps\_utility::set_moveplaybackrate( 1.0 );

    if ( !common_scripts\utility::flag( "lobby_ai_peeps_dead" ) )
    {
        thread _id_AD69();
        thread _id_AD44( 0.1, "stop_spray_and_pray" );
        common_scripts\utility::flag_wait( "lobby_ai_peeps_dead" );
        self notify( "stop_spray_and_pray" );
    }

    _id_C8C8();

    if ( common_scripts\utility::flag( "player_set_speed_stairs" ) )
        return;

    maps\_utility::set_run_anim( "casual_killer_jog_A" );
}

_id_B3B1( var_0 )
{
    self.combatstandanims = anim.archetypes["casual_killer"]["default_stand"];
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    maps\_utility::enable_exits();
    common_scripts\utility::flag_wait( "lobby_cleanup_spray" );

    if ( !common_scripts\utility::flag( "lobby_ai_peeps_dead" ) )
    {
        thread _id_AD69();
        thread _id_AD44( 0.1, "stop_spray_and_pray" );
        common_scripts\utility::flag_wait( "lobby_ai_peeps_dead" );
        self notify( "stop_spray_and_pray" );
    }

    _id_C8C8();

    if ( common_scripts\utility::flag( "player_set_speed_stairs" ) )
        return;

    maps\_utility::set_run_anim( "casual_killer_jog_A" );
}

_id_D4B2( var_0 )
{
    self.combatstandanims = anim.archetypes["casual_killer_shotgun"]["default_stand"];
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    common_scripts\utility::flag_set( "lobby_cleanup" );
    common_scripts\utility::flag_set( "lobby_cleanup_spray" );
    maps\_utility::enable_exits();
    common_scripts\utility::flag_wait( "lobby_cleanup_spray" );

    if ( !common_scripts\utility::flag( "lobby_ai_peeps_dead" ) )
    {
        thread _id_AD69( 0.1, 0.25, 0 );
        common_scripts\utility::flag_wait( "lobby_ai_peeps_dead" );
        self notify( "stop_spray_and_pray" );
    }

    _id_C8C8();

    if ( common_scripts\utility::flag( "player_set_speed_stairs" ) )
        return;

    maps\_utility::set_run_anim( "casual_killer_jog_A" );
}

_id_C8C8()
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    maps\_utility::ent_flag_set( "prestairs_nodes" );
    level._id_CAE2++;

    if ( level._id_CAE2 == 4 )
    {
        if ( !common_scripts\utility::flag( "player_set_speed_stairs" ) )
            thread maps\_utility::flag_set_delayed( "stairs_go_up", 1 );
        else
            common_scripts\utility::flag_set( "stairs_go_up" );
    }

    if ( common_scripts\utility::flag( "player_set_speed_stairs" ) )
        maps\_utility::clear_run_anim();
}

_id_CBB1( var_0 )
{
    var_1 = [];
    var_1["makarov"] = ::_id_D280;
    var_1["shotgun"] = ::_id_D4B2;
    var_1["m4"] = ::_id_B3B1;
    var_1["saw"] = ::_id_C854;
    self [[ var_1[self.script_noteworthy] ]]( var_0 );
}

_id_AAE4( var_0 )
{
    self setgoalnode( var_0 );
    self.goalradius = 16;
}

update_climb_stairs( var_0, var_1 )
{
    wait 0.1;
    self _meth_83D4( var_0, var_1 );
}

_id_C050( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    common_scripts\utility::flag_wait( "stairs_go_up" );
    self notify( "stop_spray_and_pray" );
    self.ignoreall = 0;
    self.ignoreme = 0;
    self.moveplaybackrate = 1.0;
    self.noreload = 1;

    switch ( self.script_noteworthy )
    {
        case "saw":
            wait 1.25;
            self.animationrate = 1.1;
            break;
        case "shotgun":
            wait 1;
            self.animationrate = 1.1;
            break;
        case "m4":
            wait 0.25;
            self.animationrate = 1.1;
            break;
        case "makarov":
            self.animationrate = 1.1;
            wait 0.25;
            break;
    }

    maps\_utility::disable_arrivals();
    _id_BB70::_id_B4C7();
    maps\_utility::walkdist_zero();
    waittillframeend;
    maps\_utility::clear_run_anim();
    maps\_utility::delaythread( 1, maps\_utility::enable_arrivals );
    var_1 = getent( "se_climb_stairs", "targetname" );
    thread update_climb_stairs( maps\_utility::getanim( "climb_stairs" ), self.animationrate );
    var_1 maps\_anim::anim_single_solo( self, "climb_stairs" );
    self setgoalpos( self.origin );
    maps\_utility::delaythread( 0.5, maps\_utility::activate_trigger, "upperdeck_civ", "target" );
    _id_BB70::_id_ADD2();
    wait 1;
    common_scripts\utility::flag_set( "stairs_top_open_fire" );
    common_scripts\utility::flag_set( "team_at_top_of_stairs" );

    if ( !common_scripts\utility::flag( "yuri_ee_playing" ) )
        common_scripts\utility::flag_clear( "player_DMS_disable_auto_sprint" );

    maps\_utility::ent_flag_set( "stairs_at_top" );

    if ( common_scripts\utility::flag( "stairs_upperdeck_civs_dead" ) )
        return;

    if ( self == level._id_D41B )
    {
        var_2 = getglass( "upperdeck_glass_roof_1" );
        maps\_utility::add_func( common_scripts\utility::noself_delaycall, 1, ::destroyglass, var_2, ( 0.0, 0.0, -1.0 ) );
        thread maps\_utility::do_wait();
    }

    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;
    self stopanimscripted();
    var_0 = getnode( var_0.target, "targetname" );
    self orientmode( "face angle", var_0.angles[1] );

    switch ( self.script_noteworthy )
    {
        case "saw":
        case "shotgun":
            wait 0.25;
            break;
        default:
            wait 0.75;
            break;
    }

    thread _id_AD69( var_4, var_3, var_5 );
    common_scripts\utility::flag_wait( "stairs_upperdeck_civs_dead" );
    self notify( "stop_spray_and_pray" );
    _id_BB70::_id_D157( "player_set_speed_stairs" );
}

_id_BA0D( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    maps\_utility::ent_flag_wait( "stairs_at_top" );
    maps\_utility::clear_run_anim();
    maps\_utility::disable_arrivals();
    _id_BB70::_id_ADD2();

    switch ( self.script_noteworthy )
    {
        case "makarov":
            self.moveplaybackrate = 1;
            _id_CE24( var_0 );
            break;
        case "m4":
            wait 1;
            self.moveplaybackrate = 1.45;
            break;
        case "shotgun":
            wait 0.5;
            self.moveplaybackrate = 1.35;
            break;
        case "saw":
            self.moveplaybackrate = 1.34;
            break;
    }

    if ( self.script_noteworthy == "makarov" )
        return;

    maps\_utility::follow_path( var_0, 5000 );
    thread maps\_utility::ent_flag_set_delayed( "massacre_ready", 0.15 );
    _id_BB70::_id_D157( "massacre_rentacop_stop_dead" );
}

_id_CE24( var_0 )
{
    thread maps\_utility::follow_path( var_0, 5000 );
    wait 2.5;
    maps\_utility::disable_exits();
    maps\_utility::disable_dynamic_run_speed();
    maps\_anim::anim_generic_run( self, "casual_killer_walk_wave" );
    wait 0.2;
    maps\_utility::enable_exits();

    if ( common_scripts\utility::flag( "massacre_rentacop_stop" ) )
        return;

    maps\_utility::set_moveplaybackrate( 0.9, 2 );
    common_scripts\utility::flag_wait( "upperdeck_mak_spray" );
    maps\_utility::disable_arrivals();
    maps\_utility::set_moveplaybackrate( 1, 0.5 );
    maps\_anim::anim_single( [ self ], "casual_killer_walk_stop", undefined, 0, "makarov" );
    self notify( "_utility::follow_path" );
    self setgoalpos( self.origin );
    self.goalradius = 20;
    self._id_AC52++;
    thread _id_AD69();
    self notify( "upperdeck_canned_deaths_execute_fire" );
    _id_BB70::_id_A8CA( "straight" );
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    wait 3;
    self notify( "stop_spray_and_pray" );
    self._id_AC52--;
    var_0 = common_scripts\utility::getstruct( "stairs_mak_point", "script_noteworthy" );
    maps\_utility::ent_flag_clear( "massacre_ready" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "reached_path_end" );
    maps\_utility::add_func( maps\_utility::ent_flag_set_delayed, "massacre_ready", 0.15 );
    thread maps\_utility::do_wait();
    thread _id_ABAE( var_0 );
    var_0 waittill( "trigger" );

    if ( common_scripts\utility::flag( "massacre_rentacop_stop" ) )
        return;

    maps\_utility::disable_dynamic_run_speed();
    maps\_utility::set_moveplaybackrate( 1.35 );
    wait 0.2;
    maps\_utility::enable_exits();
    maps\_utility::disable_arrivals();
}

_id_ABAE( var_0 )
{
    maps\_utility::follow_path( var_0 );
    _id_BB70::_id_D157( "massacre_rentacop_stop_dead" );
}

_id_BAAD()
{
    self waittill( "trigger", var_0 );

    if ( var_0 == level._id_D41B )
        return;

    var_0 maps\_utility::enable_arrivals();
}

_id_A881()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    var_0 = 3;
    var_1 = "upperdeck_flow1";
    self.ignorerandombulletdamage = 1;
    thread _id_C037( var_1, var_0 );
    common_scripts\utility::flag_wait( var_1 );
    wait(var_0);
    wait 1.5;

    if ( !isalive( self ) )
        return;

    self.ignorerandombulletdamage = 0;
    level.team["saw"] clearentitytarget();
    level.team["shotgun"] clearentitytarget();
    var_2 = self.origin + ( 0.0, 0.0, 40.0 );
    var_3 = anglestoforward( self.angles );
    var_2 += var_3 * 20;
    var_4 = spawn( "script_origin", var_2 );
    var_4.health = 100;
    level.team["saw"] setentitytarget( var_4 );
    level.team["shotgun"] setentitytarget( var_4 );
    self waittill( "death" );
    wait 1;

    if ( isdefined( level.team["saw"]._id_C911 ) )
        level.team["saw"] setentitytarget( level.team["saw"]._id_C911 );

    if ( isdefined( level.team["shotgun"]._id_C911 ) )
        level.team["shotgun"] setentitytarget( level.team["shotgun"]._id_C911 );

    var_4 delete();
}

_id_C1A6()
{
    self.health = 1;
    self.ignoreexplosionevents = 1;
    self.ignoreme = 1;
    self.ignorerandombulletdamage = 1;
    self.grenadeawareness = 0;
    maps\_utility::disable_surprise();
    self.a.pose = "prone";
    self endon( "death" );

    switch ( self.script_noteworthy )
    {
        case "upperdeck_crawlers_1":
            maps\_anim::anim_generic_first_frame( self, "civilian_crawl_1" );
            maps\_utility::force_crawling_death( self.angles[1], 5, level.scr_anim["crawl_death_1"], 1 );
            break;
        case "upperdeck_crawlers_wait":
            maps\_anim::anim_generic_first_frame( self, "civilian_crawl_2" );
            maps\_utility::force_crawling_death( self.angles[1], 3, level.scr_anim["crawl_death_2"], 1 );
            break;
        case "upperdeck_crawlers2":
            maps\_anim::anim_generic_first_frame( self, "civilian_crawl_2" );
            maps\_utility::force_crawling_death( self.angles[1], 5, level.scr_anim["crawl_death_2"], 1 );
            break;
        default:
            maps\_anim::anim_generic_first_frame( self, "dying_crawl" );
            maps\_utility::force_crawling_death( self.angles[1], 5, undefined, 1 );
            break;
    }

    if ( self.script_noteworthy == "upperdeck_crawlers_wait" )
    {
        maps\_utility::add_wait( maps\_utility::waittill_entity_in_range, level.player, 550 );
        level maps\_utility::add_wait( maps\_utility::_wait, 16 );
        maps\_utility::do_wait_any();
    }
    else
        wait(randomfloat( 1.5 ));

    self dodamage( 1, level.player.origin );
    self.noragdoll = 1;
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    common_scripts\utility::flag_wait( "stairs_upperdeck_civs_dead" );

    if ( isdefined( self.script_parameters ) )
    {
        var_0 = level.team[self.script_parameters];

        while ( distance( self.origin, var_0.origin ) > 250 )
            wait 0.1;

        self.script_delay = 1.5;
        var_0 thread _id_CA10( self, "down" );
        wait 0.5;
        self.ignorerandombulletdamage = 0;
        wait 1.5;
        magicbullet( var_0.weapon, var_0 gettagorigin( "tag_flash" ), self geteye() );
    }
}

_id_B9AB()
{
    self endon( "death" );
    _id_BB6B();
    common_scripts\utility::flag_wait( "stairs_top_open_fire" );

    if ( !common_scripts\utility::flag( "player_set_speed_stairs" ) )
    {
        common_scripts\utility::flag_wait_or_timeout( "player_set_speed_stairs", 5 );
        wait 1.5;
    }

    thread _id_D425();
    common_scripts\utility::flag_set( "upperdeck_flow1" );
    _id_C73D();
}

_id_D425()
{
    wait 6.5;
    common_scripts\utility::flag_wait( "stairs_cop_dead" );
    common_scripts\utility::flag_set( "stairs_upperdeck_civs_dead" );
}

_id_BAA6()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "massacre_rentacop_stop_dead" );
    wait 2.0;
    self.usechokepoints = 0;
    common_scripts\utility::flag_set( "upperdeck_flow3" );

    if ( !isdefined( level._id_CEB8 ) )
    {
        level._id_CEB8 = [];
        level._id_CEB8[level._id_CEB8.size] = self;
        wait 0.1;
        thread _id_C8F2( level._id_CEB8, "scn_airport_running_screams2" );
    }
    else
        level._id_CEB8[level._id_CEB8.size] = self;

    _id_C73D();
}

_id_B4A0( var_0 )
{
    self endon( "death" );
    _id_BB6B();
    common_scripts\utility::flag_set( var_0 );
    wait 1;
    _id_C73D();
}

_id_BB6B()
{
    waittillframeend;
    self.allowdeath = 1;
    self.health = 1;
    self.interval = 0;
    self.disablebulletwhizbyreaction = 1;
    self.ignoreall = 1;
    maps\_utility::disable_surprise();
    maps\_utility::set_generic_run_anim_array( "civ_run_array" );
    self notify( "killanimscript" );

    if ( issubstr( self.classname, "female" ) )
        self.animname = "female_civ_" + randomintrange( 1, 2 );
    else
        self.animname = "male_civ_" + randomintrange( 1, 2 );

    if ( self.script_animation == "airport_civ_cellphone_hide" )
        thread maps\_anim::anim_generic_first_frame( self, self.script_animation );
    else
        thread maps\_anim::anim_generic_loop( self, self.script_animation );
}

_id_C73D()
{
    self.health = 1;

    if ( self.script_animation != "null" )
        wait(randomfloat( 1 ));

    self notify( "stop_loop" );
    self stopanimscripted();

    if ( self.script_animation == "airport_civ_cellphone_hide" )
        thread maps\_anim::anim_generic_run( self, "crouch_2run_L" );

    var_0 = getnode( "upperdeck_escape_node", "targetname" );

    if ( isdefined( self.target ) )
        var_0 = getnode( self.target, "targetname" );

    maps\_utility::follow_path( var_0 );
    wait(randomfloat( 1.5 ));
    _id_C9AB( "killshot" );
    self kill();
}

upperdeck_update_enemy_targets()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    level endon( "massacre_elevator_start" );

    foreach ( var_1 in level.team )
    {
        var_1.upperdeck_enemy_targets = [];
        var_1.upperdeck_enemy_target_add_index = 0;
    }

    for (;;)
    {
        foreach ( var_1 in level.team )
        {
            var_4 = undefined;
            var_5 = undefined;

            foreach ( var_7 in var_1.upperdeck_enemy_targets )
            {
                if ( isalive( var_7.enemyentity ) && isdefined( var_7.targetentity ) )
                {
                    if ( !isdefined( var_4 ) || var_7.endtime < var_4.endtime )
                        var_4 = var_7;
                }
            }

            if ( isdefined( var_4 ) )
                var_5 = var_4.targetentity;

            if ( isdefined( var_5 ) != isdefined( var_1.upperdeck_active_target ) || isdefined( var_5 ) && var_5 != var_1.upperdeck_active_target )
            {
                var_1.upperdeck_active_target = var_5;

                if ( isdefined( var_1.upperdeck_active_target ) )
                {
                    var_1 setentitytarget( var_1.upperdeck_active_target );
                    var_9 = var_4.aimtype;
                }
                else
                {
                    var_1 clearentitytarget();
                    var_9 = "straight";
                }

                var_1 _id_BB70::_id_A8CA( var_9 );
            }

            wait 0.2;
        }
    }
}

_id_AE63( var_0 )
{
    if ( isdefined( self.target ) )
    {
        var_1 = getent( self.target, "targetname" );
        var_1 thread _id_AE63( var_0 );
    }

    var_2 = undefined;
    common_scripts\utility::flag_wait( var_0 );

    if ( isspawner( self ) )
        var_2 = maps\_utility::spawn_ai( 1 );
    else
    {
        var_3 = undefined;

        if ( issubstr( self.model, "female" ) )
            var_3 = "civilian_female_suit";
        else
            var_3 = "civilian_male_suit";

        var_4 = getent( var_3, "targetname" );
        var_4.count = 1;
        var_2 = maps\_utility::dronespawn( var_4 );
    }

    var_2 _id_D4EC( self );
    var_2 thread _id_D3F1();
}

_id_D4EC( var_0 )
{
    waittillframeend;
    self.ignoreme = 1;
    self.allowdeath = 1;
    self.noragdoll = 1;
    self.nocorpsedelete = 1;
    self.dontdonotetracks = 1;
    self.script_noteworthy = var_0.script_noteworthy;
    self.radius = var_0.radius;
    self._id_B9F9 = var_0;
    self.targetname = var_0.targetname + "_drone";
    self.animname = "generic";
    self.script_soundalias = var_0.script_soundalias;
    self.script_linkto = var_0.script_linkto;
    self.script_parameters = var_0.script_parameters;
    self.health = 1;

    if ( issentient( self ) )
        self.ignorerandombulletdamage = 1;
    else
        maps\_utility::enable_ignorerandombulletdamage_drone();

    if ( isdefined( var_0.script_wait ) )
        self.script_wait = var_0.script_wait;
    else
        self.script_wait = 0;

    if ( isdefined( var_0.target ) )
        self.target = var_0.target + "_drone";

    if ( isdefined( var_0.script_delay ) )
        self.script_delay = var_0.script_delay;
    else
        self.script_delay = getanimlength( maps\_utility::getgenericanim( var_0.animation ) ) - 0.5;

    if ( isdefined( var_0.script_flag_set ) )
    {
        self.script_flag_set = var_0.script_flag_set;
        common_scripts\utility::flag_init( self.script_flag_set );
        maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
        maps\_utility::add_func( common_scripts\utility::flag_set, self.script_flag_set );
        thread maps\_utility::do_wait();
    }
}

_id_D3F1()
{
    self endon( "death" );
    thread _id_AF99();
    thread _id_B177();
    waittillframeend;

    switch ( self._id_B9F9.animation )
    {
        case "airport_civ_dying_groupB_pull":
            _id_A92E();
            break;
        case "airport_civ_dying_groupA_kneel":
            _id_AF52();
            break;
        case "airport_civ_cellphone_hide":
            _id_B52E();
            break;
        case "airport_civ_pillar_exit":
            _id_C4FE();
            break;
        case "dying_crawl_back":
            _id_B041();
            break;
        case "bleedout_crawlB":
            _id_B041();
            break;
        case "DC_Burning_bunker_stumble":
            _id_BB24();
            break;
        case "unarmed_cowercrouch_react_B":
            _id_C1A9();
            break;
        case "airport_civ_dying_groupA_lean":
            if ( self._id_B9F9.targetname == "upperdeck_canned_deaths" )
                _id_C837();

            break;
        case "civilian_leaning_death":
            _id_C96A();
            break;
    }
}

_id_A92E()
{
    var_0 = getent( self.target, "targetname" );
    self.deathanim = %airport_civ_dying_groupb_pull_death;
    var_0.deathanim = %airport_civ_dying_groupb_wounded_death;
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    var_0 maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
    var_0 maps\_utility::add_func( maps\_utility::_kill );
    thread maps\_utility::do_wait();
    var_0 maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_func( maps\_utility::_kill );
    thread maps\_utility::do_wait();
    _id_C786( var_0 );
    self kill();
}

_id_AF52()
{
    var_0 = getent( self.target, "targetname" );
    var_0.skipdeathanim = 1;
    var_0.noragdoll = 1;
    self.deathanim = %coverstand_death_right;
    _id_C786( var_0 );
}

_id_B52E()
{
    self.deathanim = %airport_civ_cellphone_death;
    _id_B570( "down" );
}

_id_C837()
{
    self.skipdeathanim = 1;
    self.noragdoll = 1;
    _id_D2D0();
}

_id_C96A()
{
    self.deathanim = %civilian_leaning_death_shot;
    self.noragdoll = 1;
    _id_D2D0();
}

_id_C4FE()
{
    self.deathanim = %airport_civ_pillar_exit_death;
    _id_B570();
}

_id_B041()
{
    self.deathanim = %dying_back_death_v1;
    _id_B570( "down" );
}

_id_BB24()
{
    self.deathanim = %corner_standr_deathb;
    _id_B570();
}

_id_C1A9()
{
    self.deathanim = %exposed_death_blowback;
    _id_B570();
}

_id_C786( var_0, var_1 )
{
    thread _id_C199();
    var_0 _id_C199();
    wait 0.05;
    var_2 = upperdeck_canned_deaths_loop_wait_animate();

    if ( var_2.size )
        common_scripts\utility::array_thread( var_2, ::_id_CA10, self, var_1 );

    if ( issentient( self ) )
        self.ignorerandombulletdamage = 0;
    else
        maps\_utility::disable_ignorerandombulletdamage_drone();

    var_0 maps\_utility::disable_ignorerandombulletdamage_drone();

    if ( isdefined( self.script_soundalias ) )
        maps\_utility::delaythread( self.script_wait, maps\_utility::play_sound_on_tag_endon_death, self.script_soundalias );

    if ( var_0.health > 0 )
    {
        if ( isdefined( var_0.script_soundalias ) )
            var_0 maps\_utility::delaythread( var_0.script_wait, maps\_utility::play_sound_on_tag_endon_death, var_0.script_soundalias );

        self._id_B9F9 maps\_utility::add_wait( maps\_anim::anim_generic, var_0, var_0._id_B9F9.animation );
        var_0 maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
        var_0 maps\_utility::add_func( maps\_utility::_kill );
        thread maps\_utility::do_wait();
    }

    if ( self._id_B9F9.animation == "airport_civ_dying_groupA_kneel" )
        maps\_utility::delaythread( 3.25, maps\_utility::set_deathanim, "airport_civ_dying_groupA_kneel_death" );

    self._id_B9F9 maps\_anim::anim_generic( self, self._id_B9F9.animation );

    if ( issentient( self ) )
    {
        self notify( "stop_loop" );
        self stopanimscripted();
        maps\_utility::follow_path( getnode( "upperdeck_escape_node", "targetname" ) );
    }

    self kill();
}

_id_C886( var_0 )
{
    self.skipdeathanim = var_0;
}

_id_D2D0()
{
    _id_C199();
    maps\_utility::add_wait( ::_id_BC33 );
    maps\_utility::add_wait( ::_id_B923 );
    maps\_utility::do_wait_any();
    self._id_B9F9 maps\_anim::anim_generic( self, self._id_B9F9.animation );
    self.skipdeathanim = 1;
    self.timeddeath = 1;
    self notify( "nocleanup" );
    self kill();
    self._id_B9F9 delete();
}

upperdeck_canned_deaths_loop_wait_animate( var_0 )
{
    switch ( self._id_B9F9.animation )
    {
        case "unarmed_cowercrouch_react_B":
            thread maps\_anim::anim_generic_loop( self, "unarmed_cowercrouch_idle" );
            break;
        case "airport_civ_dying_groupA_kneel":
            thread maps\_anim::anim_generic_loop( self, "h2_airport_civ_dying_groupa_kneel_idle" );
            break;
        case "airport_civ_pillar_exit":
            thread maps\_anim::anim_generic_loop( self, "h2_airport_civ_pillar_exit_idle" );
            break;
        case "dc_burning_bunker_stumble":
            thread maps\_anim::anim_generic_loop( self, "h2_dcburning_bunker_stumble_idle" );
            break;
    }

    var_1 = _id_B9FD();
    self notify( "stop_loop" );
    return var_1;
}

_id_B570( var_0 )
{
    _id_C199();
    var_1 = upperdeck_canned_deaths_loop_wait_animate();

    if ( var_1.size )
        common_scripts\utility::array_thread( var_1, ::_id_CA10, self, var_0 );

    if ( issentient( self ) )
        self.ignorerandombulletdamage = 0;
    else
        maps\_utility::disable_ignorerandombulletdamage_drone();

    if ( isdefined( self.script_soundalias ) )
        maps\_utility::delaythread( self.script_wait, maps\_utility::play_sound_on_tag_endon_death, self.script_soundalias );

    self._id_B9F9 maps\_anim::anim_generic( self, self._id_B9F9.animation );

    if ( issentient( self ) )
    {
        self notify( "stop_loop" );
        self stopanimscripted();
        maps\_utility::follow_path( getnode( "upperdeck_escape_node", "targetname" ) );
    }

    self kill();
}

_id_C199()
{
    self._id_B9F9 thread maps\_anim::anim_generic( self, self._id_B9F9.animation );
    wait 0.05;
    self stopanimscripted();
    self._id_B9F9 maps\_anim::anim_generic_first_frame( self, self._id_B9F9.animation );
}

_id_B9FD()
{
    var_0 = [];
    var_1 = strtok( self.script_noteworthy, ", " );

    foreach ( var_4, var_3 in var_1 )
    {
        if ( isalive( level.team[var_3] ) )
            var_0[var_0.size] = level.team[var_3];
    }

    if ( !var_0.size )
        return var_0;

    common_scripts\utility::flag_wait( "upperdeck_flow1" );

    while ( var_0.size )
    {
        var_5 = var_0[0];

        if ( distance( var_5.origin, self.origin ) < self.radius )
            return var_0;

        wait 0.1;
        var_0 = maps\_utility::array_removedead( var_0 );
    }

    return var_0;
}

_id_BC33()
{
    level.player endon( "death" );

    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) < 600 )
            return;

        wait 0.1;
    }
}

_id_B923()
{
    level.player endon( "death" );

    for (;;)
    {
        maps\_utility::waittill_player_lookat( undefined, 0.25, undefined, undefined, self );

        if ( distance( level.player.origin, self.origin ) < 800 )
            return;

        wait 0.1;
    }
}

_id_C7D1( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );

    if ( common_scripts\utility::flag( "massacre_rentacop_stop" ) )
        return;

    level endon( "massacre_rentacop_stop" );
    common_scripts\utility::flag_wait_or_timeout( "stairs_upperdeck_civs_dead", 2 );
    var_1 = var_0.origin;
    var_2 = "enemy at " + var_1 + "ready to execute";
    var_3 = var_0.script_delay - 2;

    if ( var_3 < 0 )
        return;

    self endon( var_2 );
    thread maps\_utility::notify_delay( var_2, var_3 );

    while ( var_0.health > 0 )
    {
        if ( distance( var_0.origin, self.origin ) < 200 )
            return;

        wait 0.1;
    }
}

_id_AF29( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );

    if ( common_scripts\utility::flag( "massacre_rentacop_stop" ) )
        return;

    level endon( "massacre_rentacop_stop" );
    self endon( "upperdeck_canned_deaths_execute_fire" );
    var_1 = self getanimweight( level.scr_anim["generic"]["casual_killer_walk_wave"] );

    if ( isdefined( var_1 ) && var_1 != 0 )
        return;

    var_2 = var_0 maps\_utility::get_linked_structs();

    foreach ( var_4 in var_2 )
        maps\_utility::delaythread( randomfloat( 0.25 ), maps\_utility::_radiusdamage, var_4.origin, 8, 1000, 1000 );

    var_6 = 0.1;

    if ( self == level.team["shotgun"] )
        var_6 = 0.25;

    _id_AD44( var_6, "upperdeck_canned_deaths_execute_fire" );
}

_id_AD44( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( var_1 );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    var_3 = undefined;

    if ( isdefined( var_2 ) )
        var_3 = var_2;
    else if ( isdefined( self.combatstandanims ) )
        var_3 = self.combatstandanims["fire"];

    if ( self == level.team["shotgun"] && !isdefined( var_3 ) )
        var_3 = %h2_casual_killer_stand_shotgun_add;

    if ( isdefined( var_3 ) )
        self setanimknobrestart( var_3, 1, 0.2, 1.0 );

    maps\_utility::add_wait( maps\_utility::waittill_msg, var_1 );

    if ( isdefined( var_3 ) )
        maps\_utility::add_call( ::clearanim, var_3, 0.2 );

    thread maps\_utility::do_wait();

    for (;;)
    {
        self shoot();
        wait(var_0);
    }
}

_id_CA10( var_0, var_1 )
{
    self endon( "death" );

    if ( common_scripts\utility::flag( "massacre_rentacop_stop" ) )
        return;

    level endon( "massacre_rentacop_stop" );

    if ( var_0.health <= 0 )
        return;

    var_2 = spawnstruct();
    var_2.enemyentity = var_0;
    var_2.endtime = gettime() + var_0.script_delay * 1000;
    var_2.aimtype = var_1;
    self.upperdeck_enemy_targets[self.upperdeck_enemy_target_add_index] = var_2;
    self.upperdeck_enemy_target_add_index++;
    maps\_utility::add_wait( maps\_utility::_wait, var_0.script_delay );
    var_0 maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_func( ::_id_AF29, var_0 );
    thread maps\_utility::do_wait();
    _id_C7D1( var_0 );
    self.dontevershoot = 1;
    maps\_utility::disable_dynamic_run_speed();
    maps\_utility::ent_flag_set( "aiming_at_civ" );

    if ( isdefined( var_0.script_flag_set ) )
        common_scripts\utility::flag_set( var_0.script_flag_set );

    self._id_AC52++;
    var_3 = spawn( "script_origin", var_0 gettagorigin( "tag_eye" ) );
    var_3.health = 100;
    var_2.targetentity = var_3;
    thread _id_B1EA( var_0, var_3 );
    wait 0.5;

    if ( isdefined( var_0 ) && isdefined( var_0.health ) && var_0.health > 0 )
        var_0 waittill( "death" );

    self._id_AC52--;
    wait 0.25;
    self notify( "upperdeck_canned_deaths_execute_fire" );
    wait 0.25;
    var_3 delete();

    if ( self._id_AC52 )
        return;

    maps\_utility::ent_flag_clear( "aiming_at_civ" );
}

_id_B1EA( var_0, var_1 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_1 endon( "death" );

    for (;;)
    {
        var_2 = self gettagorigin( "j_elbow_ri" );
        var_3 = var_0 gettagorigin( "tag_eye" );
        var_4 = vectornormalize( var_3 - var_2 );
        var_4 *= 80;
        var_5 = var_2 + var_4;
        var_1.origin = var_5;
        wait 0.05;
    }
}

_id_AF99()
{
    self endon( "nocleanup" );
    var_0 = self._id_B9F9;
    self waittill( "death" );

    if ( isdefined( self ) )
    {
        _id_C9AB( "killshot" );
        self playsound( "generic_death_russian_" + randomintrange( 1, 8 ) );
    }

    var_0 delete();
}

_id_C01F()
{
    self waittill( "trigger" );
    var_0 = getent( self.target, "targetname" );
    var_1 = anglestoforward( var_0.angles );
    var_2 = var_0.origin + var_1 * 512;
    var_3 = 8;
    var_0 playsound( self.script_soundalias );
    var_0 moveto( var_2, var_3 );
    wait(var_3);
    var_0 delete();
    self delete();
}

_id_CB44()
{
    common_scripts\utility::flag_set( "massacre_rentacop_stop" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "massacre_rentacop_stop_dead" );
    thread maps\_utility::do_wait();
    maps\_utility::delaythread( 0.25, maps\_utility::set_ignoreme, 0 );
    common_scripts\utility::array_thread( level.team, maps\_utility::enable_dontevershoot );

    foreach ( var_1 in level.team )
    {
        level maps\_utility::add_wait( maps\_utility::_wait, 1.5 );
        var_1 maps\_utility::add_func( maps\_utility::disable_dontevershoot );
        maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
        thread maps\_utility::do_wait();
    }

    _id_C037();
}

_id_C037( var_0, var_1 )
{
    self endon( "death" );
    self.allowdeath = 1;
    self.health = 1;
    self.noragdoll = 1;
    self.ignoreme = 1;
    maps\_utility::gun_remove();
    animscripts\shared::placeweaponon( self.sidearm, "right" );

    if ( isdefined( var_0 ) || isdefined( var_1 ) )
    {
        maps\_anim::anim_generic_first_frame( self, self.animation );

        if ( isdefined( var_0 ) )
            common_scripts\utility::flag_wait( var_0 );

        if ( isdefined( var_1 ) )
            wait(var_1);
    }

    if ( self.animation == "airport_security_guard_pillar_react_L" )
        self.deathanim = %airport_security_guard_pillar_death_l;
    else
        self.deathanim = %airport_security_guard_pillar_death_r;

    thread maps\_utility::play_sound_on_tag_endon_death( "airport_rac_freeze" );
    maps\_anim::anim_generic( self, self.animation );
    self kill();
}

_id_C027()
{
    common_scripts\utility::flag_wait( "massacre_rentacop_rush" );
    var_0 = common_scripts\utility::getstruct( level._id_D0F9["cop"].target, "targetname" );
    level._id_D0F9["cop"] maps\_utility::gun_remove();
    level._id_D0F9["cop"] animscripts\shared::placeweaponon( level._id_D0F9["cop"].sidearm, "right" );
    level._id_D0F9["cop"] maps\_utility::delaythread( 0.5, maps\_utility::set_ignoreme, 0 );
    level._id_D0F9["fem"] maps\_utility::delaythread( 0.5, maps\_utility::play_sound_on_tag_endon_death, "airport_rfc1_scream4" );
    wait 0.1;
    var_0 thread _id_D4F1( level._id_D0F9["cop"], "airport_security_civ_rush_guard" );
    var_0 thread _id_D4F1( level._id_D0F9["male1"], "airport_security_civ_rush_civA" );
    var_0 thread _id_D4F1( level._id_D0F9["male2"], "airport_security_civ_rush_civC" );
    var_0 thread _id_D4F1( level._id_D0F9["fem"], "airport_security_civ_rush_civB" );
}

_id_D4F1( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 notify( "stop_loop" );
    var_0 stopanimscripted();
    wait 0.2;
    maps\_anim::anim_generic( var_0, var_1 );

    switch ( var_0.script_noteworthy )
    {
        case "cop":
            var_0.noragdoll = 1;
            var_0.deathanim = %pistol_death_2;
            var_0 _id_C9AB( "headshot" );
            var_0 kill();
            break;
        case "fem":
            var_0.deathanim = %run_death_roll;
            var_0 _id_C9AB( "killshot" );
            var_0 kill();
            break;
        default:
            var_0 setgoalnode( getnode( "upperdeck_escape_node", "targetname" ) );
            var_0.goalradius = 100;
            var_0 waittill( "goal" );
            var_0 _id_C9AB( "killshot" );
            var_0 kill();
            break;
    }
}

_id_BCAD()
{
    self endon( "death" );
    waittillframeend;
    self.allowdeath = 1;
    self.ignoreme = 1;
    self.health = 1;

    if ( !isdefined( level._id_D0F9 ) )
        level._id_D0F9 = [];

    level._id_D0F9[self.script_noteworthy] = self;

    if ( level._id_D0F9.size == 4 )
        common_scripts\utility::flag_set( "massacre_rentacop_rush" );

    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );

    switch ( self.script_noteworthy )
    {
        case "cop":
            var_0 maps\_anim::anim_generic_first_frame( self, "airport_security_civ_rush_guard" );
            break;
        case "male1":
            var_1 = spawnstruct();
            var_1.origin = getstartorigin( var_0.origin, var_0.angles, maps\_utility::getanim_generic( "airport_security_civ_rush_civA" ) );
            var_1.angles = getstartangles( var_0.origin, var_0.angles, maps\_utility::getanim_generic( "airport_security_civ_rush_civA" ) );
            var_1 thread maps\_anim::anim_generic_loop( self, "CornerCrR_alert_idle" );
            break;
        case "fem":
            var_1 = spawnstruct();
            var_1.origin = getstartorigin( var_0.origin, var_0.angles, maps\_utility::getanim_generic( "airport_security_civ_rush_civB" ) );
            var_1.angles = getstartangles( var_0.origin, var_0.angles, maps\_utility::getanim_generic( "airport_security_civ_rush_civB" ) );
            var_1 thread maps\_anim::anim_generic_loop( self, "CornerCrR_alert_idle" );
            break;
        case "male2":
            var_1 = spawnstruct();
            var_1.origin = getstartorigin( var_0.origin, var_0.angles, maps\_utility::getanim_generic( "airport_security_civ_rush_civC" ) );
            var_1.angles = getstartangles( var_0.origin, var_0.angles, maps\_utility::getanim_generic( "airport_security_civ_rush_civC" ) );
            var_1 thread maps\_anim::anim_generic_loop( self, "CornerCrR_alert_idle" );
            break;
    }
}

_id_B81F()
{
    self endon( "death" );
    waittillframeend;
    self.ignoreme = 1;
    self.health = 1;
    self.allowdeath = 1;
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = spawnstruct();
    var_1.origin = getstartorigin( var_0.origin, var_0.angles, maps\_utility::getanim_generic( "airport_security_guard_4" ) );
    var_1.angles = getstartangles( var_0.origin, var_0.angles, maps\_utility::getanim_generic( "airport_security_guard_4" ) );
    var_1 thread maps\_anim::anim_generic_loop( self, "covercrouch_hide_idle" );
    common_scripts\utility::flag_wait( "massacre_rentacop_rush" );
    wait 6;
    var_1 notify( "stop_loop" );
    self stopanimscripted();
    self.deathanim = %airport_security_guard_4_reaction;
    self.noragdoll = 1;
    self.ignoreme = 0;
    self._id_B0FE = self.primaryweapon;
    maps\_utility::forceuseweapon( self.sidearm, "primary" );
    common_scripts\utility::flag_set( "massacre_rentacop_runaway_go" );
    var_0 maps\_anim::anim_generic( self, "airport_security_guard_4" );
    maps\_utility::forceuseweapon( self._id_B0FE, "primary" );
}

_id_BC9A()
{
    self endon( "death" );
    waittillframeend;
    self.ignoreme = 1;
    self.health = 1;
    self.allowdeath = 1;
    self.ignorerandombulletdamage = 1;
    self.pathrandompercent = 0;
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    thread maps\_anim::anim_generic_loop( self, "CornerCrL_alert_idle" );
    common_scripts\utility::flag_wait( "massacre_rentacop_rush" );
    wait 12;
    self notify( "stop_loop" );
    self stopanimscripted();
    self._id_B0FE = self.primaryweapon;
    maps\_utility::forceuseweapon( self.sidearm, "primary" );
    common_scripts\utility::flag_set( "massacre_rentacop_row1_fighter_go" );
    var_0 thread maps\_anim::anim_generic( self, "airport_security_guard_4" );
    var_0 maps\_utility::add_wait( maps\_utility::waittill_msg, "airport_security_guard_4" );
    maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
    level._id_D41B maps\_utility::add_abort( maps\_utility::waittill_msg, "m79_shot" );
    maps\_utility::add_func( maps\_utility::forceuseweapon, self._id_B0FE, "primary" );
    thread maps\_utility::do_wait();
    level._id_D41B waittill( "m79_shot2" );
    var_1 = "death_explosion_run_L_v2";
    var_0 = spawnstruct();
    var_0.angles = self.angles + ( 0.0, 0.0, 15.0 );
    var_0.origin = self.origin;
    thread _id_C95D( var_0, var_1, 0.6 );
}

_id_AAF0()
{
    self endon( "death" );
    waittillframeend;
    self.ignorerandombulletdamage = 1;
    self.ignoreme = 1;
    self.health = 1;
    self.allowdeath = 1;
    self.pathrandompercent = 0;
    var_0 = common_scripts\utility::getstruct( "massacre_rentacop_row1_defender_node", "targetname" );
    thread maps\_anim::anim_generic_loop( self, "CornerCrR_alert_idle" );
    common_scripts\utility::flag_wait( "massacre_rentacop_rush" );
    wait 8;
    self notify( "stop_loop" );
    self stopanimscripted();
    self._id_B0FE = self.primaryweapon;
    maps\_utility::forceuseweapon( self.sidearm, "primary" );
    common_scripts\utility::flag_set( "massacre_rentacop_row1_runner_go" );
    var_0 thread maps\_anim::anim_generic( self, "react_stand_2_run_180" );
    var_0 maps\_utility::add_wait( maps\_utility::waittill_msg, "react_stand_2_run_180" );
    maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
    level._id_D41B maps\_utility::add_abort( maps\_utility::waittill_msg, "m79_shot" );
    maps\_utility::add_func( maps\_utility::forceuseweapon, self._id_B0FE, "primary" );
    thread maps\_utility::do_wait();
    level._id_D41B waittill( "m79_shot" );
    var_1 = "death_explosion_run_R_v1";

    if ( common_scripts\utility::cointoss() )
        var_1 = "death_explosion_run_R_v2";

    var_0 = spawnstruct();
    var_0.angles = self.angles + ( 0.0, 0.0, -20.0 );
    var_0.origin = self.origin;
    thread _id_C95D( var_0, var_1 );
}

_id_BA5D()
{
    self endon( "death" );
    waittillframeend;
    self.ignoreme = 1;
    self.health = 1;
    self.allowdeath = 1;
    self.ignorerandombulletdamage = 1;
    self.pathrandompercent = 0;
    var_0 = getnode( self.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 16;
    var_0 thread maps\_anim::anim_generic_loop( self, self.animation );
    common_scripts\utility::flag_wait( "massacre_rentacop_rush" );
    wait 9.5;
    var_0 notify( "stop_loop" );
    self stopanimscripted();
    self.favoriteenemy = level.team["saw"];
    self.ignoresuppression = 1;
    self allowedstances( "stand" );
    maps\_utility::disable_surprise();
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    wait 1;
    self allowedstances( "stand", "crouch" );
    wait 1.5;
    self.ignoreall = 1;
    level._id_D41B waittill( "m79_shot2" );
    var_1 = common_scripts\utility::getstruct( "massacre_m79_impact_2", "targetname" );

    if ( distancesquared( self.origin, var_1.origin ) > squared( 100 ) )
        return;

    var_2 = "death_explosion_run_B_v1";

    if ( common_scripts\utility::cointoss() )
        var_2 = "death_explosion_run_B_v2";

    var_0 = spawnstruct();
    var_0.angles = vectortoangles( var_1.origin - self.origin ) + ( 5.0, 0.0, 0.0 );
    var_0.origin = self.origin;
    thread _id_C95D( var_0, var_2, getanimlength( level.scr_anim["generic"][var_2] ) - 0.75 );
}

_id_ABFB()
{
    self endon( "death" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "massacre_rentacop_rambo_dead" );
    thread maps\_utility::do_wait();
    self.pathrandompercent = 0;
    self.allowdeath = 1;
    self.ignoreme = 1;
    self.health = 1;
    var_0 = undefined;

    if ( common_scripts\utility::cointoss() )
        var_0 = "corner_standL_rambo_jam";
    else
        var_0 = "corner_standL_rambo_set";

    thread maps\_anim::anim_generic( self, var_0 );
    wait 2;
    common_scripts\utility::flag_set( "massacre_rentacop_rambo" );
    self.goalradius = 80;
    self.ignoreme = 0;
}

_id_C720()
{
    self endon( "death" );
    self endon( "long_death" );
    self.goalradius = 8;
    self.accuracy = 1;
    self.baseaccuracy = 1;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.nogrenadereturnthrow = 1;
    self.allowdeath = 1;
    self.ignorerandombulletdamage = 1;
    self.noreload = 1;
    self allowedstances( "crouch" );
    self.pathrandompercent = 0;
    wait 1;
    thread maps\_anim::anim_generic_loop( self, "covercrouch_hide_idle" );

    if ( self.script_parameters == "center" )
    {
        maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_rentacop_stop" );
        maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
        maps\_utility::add_func( maps\_utility::delaythread, 5.5, maps\_utility::play_sound_on_tag_endon_death, "airport_rac_handsup" );
        thread maps\_utility::do_wait();
    }

    common_scripts\utility::flag_wait( "massacre_nadethrow" );

    if ( self.script_parameters != "center" )
    {
        self.ignoreall = 0;
        self allowedstances( "stand" );
        self notify( "stop_loop" );
        self stopanimscripted();
        self.baseaccuracy *= 0.3;
        self.accuracy *= 0.3;
    }

    wait 1;
    thread maps\_utility::notify_delay( "switch_to_nade_death", level._id_CA5B - 0.05 );
    wait(randomfloatrange( 1, 1.5 ));

    if ( self.script_parameters == "center" )
    {
        self.ignoreall = 0;
        self allowedstances( "stand" );
        self notify( "stop_loop" );
        self stopanimscripted();
        self.baseaccuracy *= 0.3;
        self.accuracy *= 0.3;
    }

    var_0 = undefined;
    var_1 = undefined;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;

    switch ( self.script_parameters )
    {
        case "center":
            var_0 = "exposed_backpedal";
            var_1 = "death_explosion_stand_B_v1";
            var_4 = 5;
            var_2 = 285;
            var_3 = 0;
            break;
        case "right":
            var_0 = "react_stand_2_run_180";
            var_1 = "death_explosion_stand_R_v1";
            var_2 = 290;
            var_3 = -10;
            break;
        case "left":
            var_0 = "walk_backward";
            var_1 = "death_explosion_stand_L_v3";
            var_2 = 260;
            var_3 = 10;
            break;
    }

    var_5 = spawn( "script_origin", self.origin );
    var_5.angles = ( 0, var_2, 0 );
    var_5 thread maps\_anim::anim_generic( self, var_0 );
    self waittill( "switch_to_nade_death" );
    var_5.angles = ( var_4, var_2, var_3 );

    if ( self.script_parameters == "center" )
    {
        var_6 = getanimlength( maps\_utility::getgenericanim( var_1 ) ) - 0.2;
        var_7 = var_6 - 0.4;
        var_6 -= 0.45;
        var_8 = common_scripts\utility::getstruct( "massacre_glass_shatter", "targetname" );
        level thread maps\_utility::delaythread( var_7, maps\_utility::_radiusdamage, var_8.origin, 32, 2000, 2000 );
        thread _id_C95D( var_5, var_1, var_6 );
    }
    else
        thread _id_C95D( var_5, var_1 );
}

_id_C95D( var_0, var_1, var_2 )
{
    self.maxhealth = 100000;
    self.health = 100000;
    self.allowdeath = 0;
    self.skipdeathanim = 1;
    self.noragdoll = 1;
    wait 0.05;
    self stopanimscripted();
    var_0.origin = self.origin;
    var_0 thread maps\_anim::anim_generic( self, var_1 );
    animscripts\shared::dropallaiweapons();

    if ( !isdefined( var_2 ) )
    {
        var_2 = getanimlength( maps\_utility::getgenericanim( var_1 ) ) - 0.2;
        maps\_utility::delaythread( 0.05, maps\_utility::_kill );
    }
    else
        maps\_utility::delaythread( var_2, maps\_utility::_kill );

    wait(var_2);
    self startragdoll();
}

_id_AE26()
{
    self endon( "stop_blindfire" );
    self endon( "death" );

    for (;;)
    {
        wait(randomfloatrange( 1.5, 3 ));
        self notify( "stop_loop" );
        self stopanimscripted();
        maps\_anim::anim_generic( self, "covercrouch_blindfire_1" );
        thread maps\_anim::anim_generic_loop( self, "covercrouch_hide_idle" );
    }
}

_id_B0C6()
{
    self endon( "death" );
    self.nogrenadereturnthrow = 1;
    self.grenadeawareness = 0;
    self setgoalpos( self.origin );
    self.goalradius = 16;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.ignoresuppression = 1;
    maps\_utility::disable_surprise();
    self.disablebulletwhizbyreaction = 1;
    self.allowdeath = 1;
    self.interval = 0;
    self kill();
    
    switch ( self.script_noteworthy )
    {
        case "1":
            _id_B4F4();
            break;
        case "2":
            _id_A95F();
            break;
        case "3":
            _id_A93C();
            break;
    }
}

_id_B4F4()
{
    maps\_utility::magic_bullet_shield();
    self endon( "death" );
    thread maps\_anim::anim_generic_loop( self, "corner_standL_alert_idle" );
    common_scripts\utility::flag_wait( "massacre_elevator_down" );
    var_0 = getnode( self.target, "targetname" );
    wait 1;
    self notify( "stop_loop" );
    self stopanimscripted();
    self setgoalnode( var_0 );
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "massacre_elevator_up" );
    maps\_utility::stop_magic_bullet_shield();
    self.ignoreall = 0;
    self linkto( level._id_A8FE.e["housing"]["mainframe"][0] );
    common_scripts\utility::flag_wait( "massacre_elevator_at_top" );
    self.goalradius = 100;
    wait 0.5;
    self unlink();
    var_0 = common_scripts\utility::getstruct( "massacre_elevator_jump_node", "targetname" );
    var_0.angles = ( 0.0, 90.0, 0.0 );
    self.oldcontents = self setcontents( 0 );
    var_0 maps\_anim::anim_generic_reach( self, "corner_standL_alert_idle_reach" );
    var_0 thread maps\_anim::anim_generic_loop( self, "corner_standL_alert_idle" );
    common_scripts\utility::flag_wait( "massacre_elevator_grenade_throw" );
    var_0.angles = ( 0.0, 0.0, 0.0 );
    self setcontents( self.oldcontents );
    self.allowdeath = 1;
    var_0 notify( "stop_loop" );
    self stopanimscripted();
    self playsound( "airport_rmc2_scream1" );
    var_0 thread maps\_anim::anim_generic( self, "corner_standL_explosion_B" );
    wait 1;
    self.a.pose = "prone";
    common_scripts\utility::flag_wait( "massacre_elevator_grenade_exp" );
    wait 1;
    self.nogrenadereturnthrow = 0;
    self.grenadeawareness = 1;
    self.ignoreme = 0;
    self.ignoreall = 0;
    self.goalradius = 512;
    level._id_D41B.ignoreall = 0;
    level.team["shotgun"].ignoreall = 0;
    level._id_D41B.ignoreme = 0;
    level.team["shotgun"].ignoreme = 0;
}

_id_A95F()
{
    maps\_utility::magic_bullet_shield();
    self allowedstances( "stand" );
    thread maps\_anim::anim_generic_loop( self, "corner_standR_alert_idle" );
    common_scripts\utility::flag_wait( "massacre_elevator_down" );
    var_0 = getnode( self.target, "targetname" );
    wait 2;
    self notify( "stop_loop" );
    self stopanimscripted();
    self setgoalnode( var_0 );
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "massacre_elevator_up" );
    maps\_utility::stop_magic_bullet_shield();
    self.ignoreall = 0;
    self.goalradius = 32;
    self linkto( level._id_A8FE.e["housing"]["mainframe"][0] );
    thread maps\_anim::anim_generic_loop( self, "corner_standL_alert_idle" );
    common_scripts\utility::flag_wait( "massacre_elevator_grenade_throw" );
    self unlink();
    self notify( "stop_loop" );
    self stopanimscripted();
    var_0 = spawnstruct();
    var_0.origin = self.origin;
    var_0.angles = ( 0.0, 100.0, 0.0 );
    maps\_utility::gun_remove();
    var_0 thread maps\_anim::anim_generic( self, "unarmed_cowerstand_react" );
    self playsound( "airport_rmc2_scream3" );
    common_scripts\utility::flag_wait( "massacre_elevator_grenade_exp" );
    var_0.origin = self.origin;
    thread _id_C95D( var_0, "death_explosion_stand_B_v2", getanimlength( maps\_utility::getgenericanim( "death_explosion_stand_B_v2" ) ) - 1 );
    playfxontag( common_scripts\utility::getfx( "glass_dust_trail" ), self, "J_SpineLower" );
}

_id_A93C()
{
    maps\_utility::magic_bullet_shield();
    self allowedstances( "stand" );
    thread maps\_anim::anim_generic_loop( self, "corner_standL_alert_idle" );
    common_scripts\utility::flag_wait( "massacre_elevator_down" );
    var_0 = getnode( self.target, "targetname" );
    wait 3;
    self notify( "stop_loop" );
    self stopanimscripted();
    self setgoalnode( var_0 );
    self waittill( "goal" );
    wait 0.5;
    common_scripts\utility::flag_set( "massacre_elevator_guys_ready" );
    common_scripts\utility::flag_wait( "massacre_elevator_up" );
    maps\_utility::stop_magic_bullet_shield();
    self.ignoreall = 0;
    self linkto( level._id_A8FE.e["housing"]["mainframe"][0] );
    thread maps\_anim::anim_generic_loop( self, "corner_standR_alert_idle" );
    common_scripts\utility::flag_wait( "massacre_elevator_at_top" );
    self.goalradius = 100;
    self setgoalpos( self.origin );
    self unlink();
    self notify( "stop_loop" );
    self stopanimscripted();
    common_scripts\utility::flag_wait( "massacre_elevator_grenade_throw" );
    var_0 = spawnstruct();
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_1 = spawnstruct();
    var_1.origin = self.origin;
    var_1.angles = ( 0.0, 90.0, 0.0 );
    var_0 thread maps\_anim::anim_generic( self, "exposed_backpedal" );
    waitframe();
    thread maps\_anim::_id_B6DB( undefined, var_0, var_1, 1 );
    wait 1.3;
    self stopanimscripted();
    thread maps\_anim::anim_generic( self, "stand_2_run_F_2" );
    common_scripts\utility::flag_wait( "massacre_elevator_grenade_exp" );
    var_0.origin = self.origin;

    if ( !isalive( self ) )
        return;

    maps\_utility::set_allowdeath( 0 );
    self stopanimscripted();
    thread maps\_anim::anim_generic( self, "exposed_death_blowback" );
    wait 1.55;

    if ( !isalive( self ) )
        return;

    self startragdoll();
    thread _id_B970( "gate_player_off_stairs" );
    self endon( "death" );
    wait 3;
    self kill();
}

_id_A8FE()
{
    var_0 = _id_D3B5();
    level._id_A8FE = var_0;
    common_scripts\utility::flag_wait( "massacre_elevator_start" );
    var_0 common_scripts\_elevator::call_elevator( 0 );
    var_0 waittill( "elevator_moved" );
    var_1 = var_0 common_scripts\_elevator::get_outer_leftdoor( 0 );
    var_2 = var_0 common_scripts\_elevator::get_outer_rightdoor( 0 );
    var_1 connectpaths();
    var_2 connectpaths();
    common_scripts\utility::flag_set( "massacre_elevator_down" );
    common_scripts\utility::flag_wait( "massacre_elevator_guys_ready" );
    common_scripts\utility::flag_wait( "massacre_eleveator_should_come_up" );
    var_0 common_scripts\_elevator::call_elevator( 1 );
    var_0 waittill( "closed_inner_doors" );
    common_scripts\utility::flag_set( "massacre_elevator_up" );
    thread maps\_utility::flag_set_delayed( "massacre_elevator_prepare_nade", 2.5 );
    var_0 waittill( "elevator_moved" );
    var_1 = var_0 common_scripts\_elevator::get_outer_leftdoor( 1 );
    var_2 = var_0 common_scripts\_elevator::get_outer_rightdoor( 1 );
    var_1 connectpaths();
    var_2 connectpaths();
    common_scripts\utility::flag_set( "massacre_elevator_at_top" );
    common_scripts\utility::flag_wait( "massacre_elevator_grenade_exp" );
    var_0.e["housing"]["mainframe"][0] playsound( "elevator_shake_groan" );
    var_0.e["housing"]["mainframe"][0] thread maps\_utility::play_sound_on_entity( "scn_airport_elevator_fall" );
    wait 0.05;
    common_scripts\_exploder::exploder( 1 );
    var_3 = common_scripts\utility::getstruct( "elevator_pick", "targetname" );
    var_4 = getentarray( "elevator_casing_glass", "targetname" );

    if ( var_4.size )
    {
        var_5 = common_scripts\utility::getclosest( var_3.origin, var_4 );
        var_5 delete();
    }

    var_4 = getentarray( "elevator_housing_glass", "script_noteworthy" );

    if ( var_4.size )
    {
        var_5 = common_scripts\utility::getclosest( var_3.origin, var_4 );
        var_5 delete();
    }

    wait 0.5;
    var_6 = ( 0.0, 0.0, 1000.0 );
    var_7 = ( 0.0, 0.0, -1000.0 );
    var_0 maps\_utility::delaythread( 0.95, ::_id_B772, var_0._id_D2B9, var_0.e["housing"]["mainframe"][0], 1.05, var_6, var_7 );
    wait 1;
    var_1 = var_0 common_scripts\_elevator::get_outer_leftdoor( 0 );
    var_2 = var_0 common_scripts\_elevator::get_outer_rightdoor( 0 );
    level.elevators = common_scripts\utility::array_remove( level.elevators, var_0 );
    maps\_utility::delaythread( 0.1, ::_id_C95F, 80 );
    maps\_utility::delaythread( 0.6, ::_id_C95F, 70 );
    maps\_utility::delaythread( 0.75, ::_id_C95F, 60 );
    var_0.e["housing"]["inside_trigger"] delete();
    var_0.e["housing"]["mainframe"][0] movegravity( ( 0.0, 0.0, 0.0 ), 1 );
    wait 1;
    var_0.e["housing"]["mainframe"][0] playsound( "elevator_crash" );
    common_scripts\_exploder::exploder( 2 );
    thread elevator_crash_earthquake();
    var_1 delete();
    var_2 delete();
    wait 0.5;
    var_0 notify( "elevator_moved" );
    common_scripts\utility::flag_set( "elevator_destroyed" );
    level._id_CA48 = 94;
}

_id_C95F( var_0 )
{
    level._id_CA48 = var_0;
}

_id_D3B5()
{
    var_0 = common_scripts\utility::getstruct( "elevator_pick", "targetname" );
    var_1 = level.elevators[0];
    var_2 = distance( var_1.e["housing"]["mainframe"][0] getorigin(), var_0.origin );

    foreach ( var_4 in level.elevators )
    {
        var_5 = distance( var_4.e["housing"]["mainframe"][0] getorigin(), var_0.origin );

        if ( var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

_id_B20E()
{
    self endon( "death" );
    wait 0.05;
    self.allowdeath = 1;
    thread maps\_anim::anim_generic_loop( self, self.animation );
    self.ignorerandombulletdamage = 1;
    common_scripts\utility::flag_wait( "massacre_rentacop_rush" );
    wait 5;
    self notify( "stop_loop" );
    self stopanimscripted();
    self.ignorerandombulletdamage = 0;
    self.usechokepoints = 0;

    if ( !isdefined( level._id_B20E ) )
    {
        level._id_B20E = [];
        level._id_B20E[level._id_B20E.size] = self;
        wait 0.1;
        thread _id_C8F2( level._id_B20E, "scn_airport_running_screams3" );
    }
    else
        level._id_B20E[level._id_B20E.size] = self;

    thread _id_B51C();

    if ( isdefined( self.target ) )
    {
        if ( self.target == "massacre_civ_runner_node" )
        {
            thread maps\_anim::anim_generic_loop( self, self.animation );
            self.ignorerandombulletdamage = 1;
            wait 1;
            self notify( "stop_loop" );
            self stopanimscripted();
            var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
            var_0 maps\_anim::anim_generic( self, "civilian_run_hunched_flinch" );
        }
        else
        {
            var_0 = getnode( self.target, "targetname" );
            self.ignorerandombulletdamage = 1;
            maps\_utility::follow_path( var_0 );
            self.ignorerandombulletdamage = 0;
        }
    }

    self.target = undefined;
    _id_C73D();
}

_id_B363( var_0 )
{
    self endon( "death" );
    wait 0.05;
    self.allowdeath = 1;
    thread maps\_anim::anim_generic_loop( self, self.animation );
    self.ignorerandombulletdamage = 1;

    if ( !isdefined( level._id_B363 ) )
    {
        level._id_B363 = [];
        level._id_B363[level._id_B363.size] = self;
        wait 0.1;
        thread _id_C8F2( level._id_B363, var_0 );
        wait 0.05;
        level._id_B363 = undefined;
    }
    else
        level._id_B363[level._id_B363.size] = self;

    self notify( "stop_loop" );
    self stopanimscripted();
    self.ignorerandombulletdamage = 0;
    self.usechokepoints = 0;

    if ( isdefined( self.target ) )
    {
        var_1 = getnode( self.target, "targetname" );
        maps\_utility::follow_path( var_1 );
    }

    self.target = undefined;
    _id_C73D();
}

_id_B51C()
{
    self endon( "death" );
    level._id_D41B waittill( "m79_shot2" );
    var_0 = common_scripts\utility::getstruct( "massacre_m79_impact_2", "targetname" );

    if ( distancesquared( self.origin, var_0.origin ) > squared( 100 ) )
        return;

    var_1 = undefined;
    var_2 = var_0.origin - self.origin;
    var_3 = vectordot( var_2, anglestoforward( self.angles ) );
    var_4 = vectordot( var_2, anglestoright( self.angles ) );
    var_5 = ( 0.0, 0.0, 0.0 );

    if ( var_3 > 0.5 )
    {
        var_1 = "death_explosion_run_B_v1";

        if ( common_scripts\utility::cointoss() )
            var_1 = "death_explosion_run_B_v2";

        var_5 = ( 10.0, 0.0, 0.0 );
    }
    else if ( var_3 < -0.5 )
    {
        var_1 = "death_explosion_run_F_v1";

        if ( common_scripts\utility::cointoss() )
            var_1 = "death_explosion_run_F_v2";

        var_5 = ( -10.0, 0.0, 0.0 );
    }
    else if ( var_4 > 0.6 )
    {
        var_1 = "death_explosion_run_L_v1";

        if ( common_scripts\utility::cointoss() )
            var_1 = "death_explosion_run_L_v2";

        var_5 = ( 0.0, 0.0, 10.0 );
    }
    else
    {
        var_1 = "death_explosion_run_R_v1";

        if ( common_scripts\utility::cointoss() )
            var_1 = "death_explosion_run_R_v2";

        var_5 = ( 0.0, 0.0, -10.0 );
    }

    var_6 = spawnstruct();
    var_6.angles = self.angles;
    var_6.origin = self.origin;
    thread _id_C95D( var_6, var_1, 0.5 );
}

_id_AE46()
{
    self endon( "death" );
    wait 0.05;
    self.allowdeath = 1;
    maps\_anim::anim_generic_first_frame( self, "dying_crawl" );
    self.ignorerandombulletdamage = 1;
    maps\_utility::force_crawling_death( self.angles[1], 2, undefined, 1 );
    common_scripts\utility::flag_wait( "massacre_elevator_grenade_exp" );
    self stopanimscripted();
    self dodamage( 1, level.player.origin );
}

_id_CCFB()
{
    var_0 = undefined;

    switch ( self.script_noteworthy )
    {
        case "male":
            var_0 = "civilian_male_suit_low_LOD";
            break;
        case "female":
            var_0 = "civilian_female_suit_low_LOD";
            break;
    }

    var_1 = getent( var_0, "targetname" );
    var_1.count = 1;
    var_2 = maps\_utility::dronespawn( var_1 );
    var_2._id_C97A = self;
    var_2.anime = self.animation;
    var_2.script_delay = self.script_delay;
    var_2.maxhealth = 1;
    var_2.health = 1;
    var_2.ignoreexplosionevents = 1;
    var_2.ignoreme = 1;
    var_2 maps\_utility::enable_ignorerandombulletdamage_drone();
    var_2.grenadeawareness = 0;
    var_2 maps\_utility::disable_surprise();
    var_2 thread maps\_utility::magic_bullet_shield( 1 );
    var_2.dontdonotetracks = 1;
    var_2.nocorpsedelete = 1;
    var_2 thread _id_C362();
    level._id_A8EC = 0;
}

_id_C362()
{
    var_0 = self._id_C97A;
    waittillframeend;
    wait 0.5;
    var_0 maps\_anim::anim_generic_first_frame( self, self.anime );
    self setanimtime( maps\_utility::getanim_generic( self.anime ), 0.2 );
    thread _id_B177();
    common_scripts\utility::flag_wait( "massacre_civ_animate" );

    if ( isalive( level.team["m4"] ) )
        level.team["m4"] maps\_utility::ent_flag_wait( "massacre_firing_into_crowd" );

    var_1 = common_scripts\utility::getstruct( "massacre_random_timing", "targetname" );
    var_1.origin = ( 2570.0, 3777.0, 144.0 );
    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_3 = squared( var_1.radius );
    var_4 = distancesquared( var_1.origin, var_2.origin );
    var_5 = 1 - ( var_3 - var_4 ) / var_3;
    var_6 = 0.25 * var_5;

    if ( distancesquared( var_1.origin, var_2.origin ) < squared( 128 ) )
        var_6 = 0.1 * var_5;

    wait(var_6);
    maps\_utility::script_delay();
    thread _id_BCC2();
    maps\_utility::stop_magic_bullet_shield();
    var_0 thread maps\_anim::anim_generic( self, self.anime );
    self setanimtime( maps\_utility::getanim_generic( self.anime ), 0.2 );
    var_0 waittill( self.anime );

    if ( var_0.animation != "airport_civ_in_line_6_C_reaction" )
    {
        self.noragdoll = 1;
        self.skipdeathanim = 1;
    }

    var_0 delete();
    level._id_A8EC++;

    if ( level._id_A8EC > 2 )
        level._id_A8EC = 0;

    self kill();
    common_scripts\utility::flag_wait( "delete_massacre_dummies" );
    self delete();
}

_id_A872()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    common_scripts\utility::flag_wait( "massacre_rentacop_stop_dead" );
    wait 0.75;
}

_id_CDF0( var_0 )
{
    maps\_utility::ent_flag_init( "massacre_node_end" );

    while ( isdefined( var_0.target ) )
        var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );

    var_0 waittill( "trigger" );
    maps\_utility::ent_flag_set( "massacre_node_end" );
}

_id_B0D5( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    common_scripts\utility::flag_wait( "massacre_rentacop_stop" );
    waittillframeend;
    _id_BB70::_id_AF1D();
    self pushplayer( 1 );
    self clearentitytarget();
    self.ignoreall = 0;
    self.a.disablepain = 1;
    maps\_utility::ent_flag_clear( "aiming_at_civ" );
    common_scripts\utility::flag_wait( "massacre_rentacop_stop_dead" );
    maps\_utility::enable_dontevershoot();

    if ( self.script_noteworthy == "m4" )
        maps\_utility::ent_flag_set( "massacre_ready" );
    else
    {
        foreach ( var_2 in level.team )
            var_2 maps\_utility::ent_flag_wait( "massacre_ready" );

        maps\_utility::delaythread( 4, maps\_utility::activate_trigger, "massacre_rentacop_rush_guy", "target" );
    }

    if ( self.script_noteworthy == "makarov" )
        thread _id_CDF0( var_0 );

    thread maps\_utility::follow_path( var_0 );
    maps\_utility::disable_arrivals();
    maps\_utility::delaythread( 3, maps\_utility::disable_exits );

    switch ( self.script_noteworthy )
    {
        case "saw":
            thread _id_D4E8( var_0 );
            self waittill( "reached_path_end" );
            self notify( "cleanup_killers_saw" );
            self.moveplaybackrate = 1.3;
            thread _id_BAB3();
            thread monitor_runners_death();
            maps\_utility::enable_arrivals();
            maps\_utility::enable_exits();
            self waittill( "stop_killers_saw2" );
            self notify( "stop_spray_and_pray" );
            self.combatmode = "cover";
            self.moveplaybackrate = 1.0;
            self.ignoreall = 0;
            self clearentitytarget();
            maps\_utility::disable_dontevershoot();
            break;
        case "m4":
            _id_A888();
            break;
        case "shotgun":
            _id_C617( var_0 );
            break;
        case "makarov":
            _id_AF93( var_0 );
            thread _id_D152();
            var_0 = getnode( "massacre_elevator_nade_node", "targetname" );
            _id_D444( var_0 );
            break;
    }

    self.a.disablepain = 0;
    wait 1;
    maps\_utility::ent_flag_set( "gate_ready_to_go" );
    wait 4;
    _id_BB70::_id_D157( "gate_player_ready" );
}

monitor_runners_death()
{
    common_scripts\utility::flag_wait( "massacre_runners1_dead" );
    common_scripts\utility::flag_wait( "massacre_runners2_dead" );
    common_scripts\utility::flag_wait( "massacre_runners3_dead" );
    wait 3;
    self notify( "stop_killers_saw2" );
}

_id_D247( var_0 )
{
    common_scripts\utility::flag_wait( "massacre_kill_rush" );

    if ( common_scripts\utility::flag( "massacre_rentacop_rush_dead" ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 0.1;

    var_1 = maps\_utility::get_living_ai( "cop", "script_noteworthy" );

    if ( isalive( var_1 ) )
    {
        var_1.ignoreme = 0;
        self.favoriteenemy = var_1;
    }

    thread _id_AD44( var_0, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 0.5 );
}

_id_B863( var_0 )
{
    common_scripts\utility::flag_wait( "massacre_rentacop_runaway_go" );
    wait 2;

    if ( common_scripts\utility::flag( "massacre_rentacop_runaway_dead" ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 0.1;

    var_1 = maps\_utility::get_living_ai( "massacre_rentacop_runaway_guy", "script_noteworthy" );

    if ( isalive( var_1 ) )
    {
        var_1.ignoreme = 0;
        self.favoriteenemy = var_1;
    }

    thread _id_AD44( var_0, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 0.5 );
}

_id_D51F( var_0 )
{
    common_scripts\utility::flag_wait_any( "massacre_rentacop_rambo_dead", "massacre_rentacop_rambo" );

    if ( common_scripts\utility::flag( "massacre_rentacop_rambo_dead" ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 0.1;

    thread _id_AD44( var_0, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 0.5 );
}

_id_A888()
{
    self.ignoreall = 1;
    self.moveplaybackrate = 1.1;
    maps\_utility::enable_arrivals();
    maps\_utility::set_run_anim( "casual_killer_jog_A" );
    maps\_utility::disable_dontevershoot();
    var_0 = getnode( "massacre_nodes2", "targetname" );
    self.forceapproachyaw = var_0.angles[1];
    self.overridearrival = %h2_casual_killer_jog_2_heat;
    maps\_utility::follow_path( var_0 );
    self.forceapproachyaw = undefined;
    maps\_utility::clear_run_anim();
    self.exitnode_overridetranstime = 0.5;
    _id_D328( var_0 );
    _id_BB70::_id_B4C7();
    waittillframeend;
    _id_BB70::_id_ADD2();
    waittillframeend;
    self.combatmode = "cover";
    self.moveplaybackrate = 0.85;
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_makarov_point_at_rambo" );
    maps\_utility::add_func( maps\_utility::set_run_anim, "casual_killer_jog_A" );
    maps\_utility::add_abort( maps\_utility::waittill_msg, "reached_path_end" );
    thread maps\_utility::do_wait();
    maps\_utility::enable_exits();
    maps\_utility::enable_arrivals();
    self.disablecoverarrivalsonly = undefined;
    self.overrideexitanim = %h2_casual_killer_heat_2_walk;
    var_0 = getnode( "massacre_elevator_secondary_nodes_m4", "targetname" );
    maps\_utility::follow_path( var_0 );
    self.exitnode_overridetranstime = undefined;
    maps\_utility::clear_run_anim();
    self.moveplaybackrate = 1.0;
    wait 1;
    self.disablecoverarrivalsonly = 1;

    if ( common_scripts\utility::flag( "massacre_runners1_dead" ) && common_scripts\utility::flag( "massacre_runners2_dead" ) && common_scripts\utility::flag( "massacre_runners3_dead" ) )
        return;

    thread _id_AD69( 0, 0.25, 1 );
    common_scripts\utility::flag_wait( "massacre_runners1_dead" );
    common_scripts\utility::flag_wait( "massacre_runners2_dead" );
    common_scripts\utility::flag_wait( "massacre_runners3_dead" );
    wait 1;
    self notify( "stop_spray_and_pray" );
}

_id_D4E8( var_0 )
{
    self endon( "cleanup_killers_saw" );
    thread _id_D247();
    self.moveplaybackrate = 1.5;
    wait 8;
    maps\_utility::disable_turnanims();
    wait 2;
    self.moveplaybackrate = 1.1;
    wait 0.1;
    self.ignoreall = 1;
    self clearanim( %run_n_gun, 0.2 );
    self._id_BD51["F"] = %casual_killer_walk_shoot_f_aimdown_m240;
    self.run_and_gun_current_type = undefined;
    wait 0.5;
    self._id_AD11 = %casual_killer_walk_shoot_l_m240;
    self._id_BA16 = 0.4;
    self._id_C398 = 0.5;
    self animcustom( ::_id_B7F2 );
    wait 1;
    self.moveplaybackrate = 1.0;
    self._id_AD11 = %casual_killer_walk_shoot_l_m240;
    self._id_BA16 = 0.4;
    self._id_C398 = 0.2;
    self animcustom( ::_id_B7F2 );
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 2 );
    wait 0.5;
    self._id_AD11 = %casual_killer_walk_shoot_l_m240;
    self._id_BA16 = 0.4;
    self._id_C398 = 0.2;
    self animcustom( ::_id_B7F2 );
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 0.5 );
    wait 0.5;
    self._id_AD11 = %casual_killer_walk_shoot_l_m240;
    self._id_BA16 = 0.4;
    self._id_C398 = 0.2;
    self animcustom( ::_id_B7F2 );
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 1 );
    wait 1.0;
    self.ignoreall = 0;
    self animcustom( ::_id_B5E2 );
    maps\_utility::enable_turnanims();
    wait 0.2;
    _id_BB70::_id_A8CA( "straight" );
    level._id_D41B waittill( "m79_shot2" );
    thread maps\_anim::anim_generic_run( self, "casual_killer_flinch2" );
    self.moveplaybackrate = 1.2;
}

_id_BAB3()
{
    self endon( "stop_killers_saw2" );
    var_0 = getnode( "massacre_elevator_secondary_nodes_saw", "targetname" );
    thread maps\_utility::follow_path( var_0 );
    self.moveplaybackrate = 1;
    var_1 = getent( "massacre_civ_aim_node", "targetname" );
    var_1.health = 100;
    wait 2;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 1 );
    wait 0.5;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 0.5 );
    self setentitytarget( var_1 );
    self.ignoreall = 0;
    self.moveplaybackrate = 1.0;
    wait 1;
    self.moveplaybackrate = 0.85;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 1 );
    wait 0.5;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 1.5 );
    wait 0.25;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 1.25 );
    maps\_utility::disable_arrivals();
    maps\_utility::disable_exits();
    wait 0.2;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 1.75 );
    maps\_utility::disable_arrivals();
    maps\_utility::disable_exits();
    _id_CDA0();
    wait 0.5;
    self.ignoreall = 0;
    self clearentitytarget();
    maps\_utility::disable_dontevershoot();

    if ( common_scripts\utility::flag( "massacre_runners1_dead" ) && common_scripts\utility::flag( "massacre_runners2_dead" ) && common_scripts\utility::flag( "massacre_runners3_dead" ) )
        return;

    thread _id_AD69( 0, 0.5, 1, undefined, 2 );
    common_scripts\utility::flag_wait( "massacre_runners1_dead" );
    common_scripts\utility::flag_wait( "massacre_runners2_dead" );
    common_scripts\utility::flag_wait( "massacre_runners3_dead" );
    wait 1.5;
    self notify( "stop_spray_and_pray" );
}

_id_C617( var_0 )
{
    thread _id_B863( 0.25 );
    thread _id_D51F( 0.25 );
    self.moveplaybackrate = 1.0;
    wait 11;
    self.moveplaybackrate = 1.1;
    level._id_D41B waittill( "m79_shot2" );
    self.moveplaybackrate = 1.0;
    thread maps\_anim::anim_generic_run( self, "casual_killer_flinch" );
    self.moveplaybackrate = 1.35;
    self waittill( "reached_path_end" );
    maps\_utility::enable_arrivals();
    common_scripts\utility::flag_wait( "massacre_rentacop_rambo_dead" );
    maps\_anim::anim_single( [ self ], "casual_killer_walk_stop", undefined, 0, "shotgun" );
    self.moveplaybackrate = 1;
    wait 1.5;
    maps\_utility::set_run_anim( "casual_killer_jog_A" );
    maps\_utility::enable_exits();
    maps\_utility::enable_arrivals();
    var_0 = getnode( "massacre_elevator_support_node", "targetname" );
    maps\_utility::follow_path( var_0 );
    maps\_utility::clear_run_anim();
    self.moveplaybackrate = 1.0;
    wait 1;
    var_1 = getent( "massacre_line_of_fire_trig", "targetname" );
    var_1 thread _id_AE00( "massacre_line_of_fire_done", level.team );
    maps\_utility::add_wait( maps\_utility::trigger_wait_targetname, "massacre_line_of_fire_trig_final" );
    maps\_utility::add_abort( common_scripts\utility::flag_wait, "massacre_line_of_fire_done" );
    level.player maps\_utility::add_call( ::kill );
    thread maps\_utility::do_wait();
    self.ignoreall = 0;
    maps\_utility::disable_dontevershoot();
    thread _id_AD69( 0, 0.25, 0, -1, 15 );
    common_scripts\utility::flag_wait( "massacre_runners1_dead" );
    common_scripts\utility::flag_wait( "massacre_runners2_dead" );
    common_scripts\utility::flag_wait( "massacre_runners3_dead" );
    wait 0.5;
    self notify( "stop_spray_and_pray" );
    common_scripts\utility::flag_set( "massacre_line_of_fire_done" );
}

_id_BED7()
{
    var_0 = getent( "massacre_post_roof", "script_noteworthy" );
    var_1 = getentarray( "massacre_post_post_exp", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = getentarray( var_3.target, "targetname" );

        foreach ( var_6 in var_4 )
            var_6 hide();

        var_3 hide();
    }

    level._id_D41B waittill( "m79_shot2" );
    wait 0.05;
    var_1 = getentarray( "massacre_post_post_exp", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = getentarray( var_3.target, "targetname" );

        foreach ( var_6 in var_4 )
        {
            var_6 show();
            var_6 linkto( var_3 );
        }

        var_3 show();
        var_12 = 10;

        if ( isdefined( var_3.script_noteworthy ) )
            var_12 = -10;

        var_13 = 0.1;
        var_3 rotatepitch( var_12, var_13, 0, var_13 );
    }

    var_3 = getent( "massacre_post_pre_exp", "targetname" );
    var_3 delete();
    var_15 = anglestoforward( ( 0.0, 180.0, 0.0 ) );
    var_15 *= 500;
    var_16 = getglassarray( "massacre_glass_exp_1" );
    common_scripts\utility::array_levelcall( var_16, ::destroyglass, var_15 );
    var_0 playsound( "storefront_glass_pane_blowout" );
    var_3 = getent( "massacre_post_top", "script_noteworthy" );
    var_3 playsound( "storefront_wood_break" );
    var_17 = getent( "massacre_sign", "script_noteworthy" );
    var_17 physicslaunchclient( var_17.origin + ( 0.0, 50.0, 5.0 ), ( 50.0, 500.0, -100.0 ) );
    wait 1;
    var_0 playsound( "storefront_wood_collapse" );
    var_3 linkto( var_0 );
    var_18 = ( -2.306, 3.01101, -13.3077 );
    var_13 = 0.7;
    var_0 rotateto( var_18, var_13, var_13 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.script_noteworthy ) )
            continue;

        var_20 = 0.25;
        var_3 rotateroll( -4, var_20, 0, var_20 );
    }

    wait(var_13);
    var_13 = 0.35;
    var_0 rotateto( var_18 * 0.7, var_13, 0, var_13 );
    wait(var_13 - 0.05);
    var_0 rotateto( var_18, var_13, var_13 );
    wait(var_13);
    var_13 = 0.2;
    var_0 rotateto( var_18 * 0.9, var_13, 0, var_13 );
    wait(var_13);
    var_0 rotateto( var_18, var_13, var_13 );
}

_id_AF93( var_0 )
{
    thread _id_D247();
    self.moveplaybackrate = 1.37;
    wait 9.85;
    maps\_utility::enable_dontevershoot();
    self.ignoreall = 1;
    wait 3.15;
    var_1 = ( 0.0, 0.0, 10.0 );
    thread maps\_utility::notify_delay( "m79_shot", 0.15 );
    var_0 = common_scripts\utility::getstruct( "massacre_m79_target_1", "targetname" );
    thread fire_m203( var_0, var_1 );
    wait 1.5;
    wait 2.5;
    maps\_utility::disable_turnanims();
    self.ignoreall = 1;
    self._id_AD11 = %casual_killer_walk_shoot_r_makarov;
    self._id_BA16 = 1.0;
    self._id_C398 = 0.5;
    self animcustom( ::_id_B7F2 );
    wait 0.5;
    var_1 = ( 0.0, 0.0, 15.0 );
    thread maps\_utility::notify_delay( "m79_shot2", 0.15 );
    var_0 = common_scripts\utility::getstruct( "massacre_m79_target_2", "targetname" );
    thread fire_m203( var_0, var_1 );
    wait 0.5;
    wait 0.2;
    self animcustom( ::_id_B5E2 );
    self.moveplaybackrate = 1.15;
    wait 1.5;
    self.ignoreall = 0;
    common_scripts\utility::flag_set( "massacre_nadethrow" );
    wait 2.5;
    self.ignoreall = 1;
    self._id_AD11 = %casual_killer_walk_shoot_r_makarov;
    self._id_BA16 = 0.25;
    self._id_C398 = 0.5;
    self animcustom( ::_id_B7F2 );
    wait 1.05;
    common_scripts\utility::flag_set( "massacre_elevator_start" );
    var_1 = ( 0.0, 0.0, 8.0 );
    thread maps\_utility::notify_delay( "m79_shot3", 0.2 );
    var_0 = common_scripts\utility::getstruct( "massacre_m79_target_3", "targetname" );
    thread fire_m203( var_0, var_1 );
    wait 0.5;
    self.moveplaybackrate = 1.1;
    wait 0.5;
    maps\_utility::enable_turnanims();
    wait 0.65;
    wait 2.1;
    self animcustom( ::_id_B5E2 );
    self.ignoreall = 0;
    common_scripts\utility::flag_set( "massacre_makarov_point_at_rambo" );
    thread maps\_anim::anim_generic_run( self, "casual_killer_walk_point" );
    wait 0.25;
    self.moveplaybackrate = 1.35;
    maps\_utility::ent_flag_wait( "massacre_node_end" );
    common_scripts\utility::flag_set( "massacre_eleveator_should_come_up" );
}

_id_D344( var_0, var_1 )
{
    magicbullet( self.secondaryweapon, self gettagorigin( "tag_flash" ), var_0.origin + var_1 );
    playfxontag( common_scripts\utility::getfx( "m79_muzzleflash" ), self, "tag_flash" );
    var_2 = %pistol_stand_fire_a;
    self setanimknobrestart( var_2, 1, 0.2, 1.0 );
    common_scripts\utility::delaycall( getanimlength( var_2 ), ::clearanim, var_2, 0.2 );
}

fire_m203( var_0, var_1 )
{
    magicbullet( "m203_m4", self gettagorigin( "tag_flash" ), var_0.origin + var_1 );
    playfxontag( common_scripts\utility::getfx( "m79_muzzleflash" ), self, "tag_flash" );
    maps\_anim::anim_generic_run( self, "grenadier_fire_and_reload" );
}

_id_D152()
{
    wait 2;
    var_0 = getent( "massacre_civ_aim_node", "targetname" );
    var_0.health = 100;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 0.75 );
    wait 0.5;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 0.5 );
    self setentitytarget( var_0 );
    self.ignoreall = 0;
    wait 0.5;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 0.8 );
    wait 0.5;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 0.5 );
    wait 0.3;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 0.5 );
    wait 0.25;
    thread _id_AD44( 0.1, "stop_spray_and_pray" );
    maps\_utility::notify_delay( "stop_spray_and_pray", 1.5 );
    wait 0.2;
    _id_CDA0( 1 );
    wait 1;
    maps\_utility::disable_dontevershoot();
    self clearentitytarget();
    thread _id_AD69( 0, 0.25, 0 );
    maps\_utility::add_wait( common_scripts\utility::flag_wait_all, "massacre_runners1_dead", "massacre_runners2_dead", "massacre_runners3_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "massacre_elevator_prepare_nade" );
    maps\_utility::do_wait_any();
    self notify( "stop_spray_and_pray" );
}

_id_CDA0( var_0 )
{
    maps\_utility::enable_arrivals();
    maps\_utility::enable_exits();
    self.combatmode = "cover";
    self.moveplaybackrate = 1.0;

    if ( !isdefined( var_0 ) || var_0 == 0 )
        self waittill( "reached_path_end" );

    maps\_utility::enable_exits();
}

_id_B7F2()
{
    self notify( "aim_stop" );
    self endon( "aim_stop" );
    var_0 = self._id_AD11;
    var_1 = self._id_BA16;
    var_2 = self._id_C398;
    self._id_BA16 = undefined;
    self._id_C398 = undefined;
    var_3 = animscripts\utility::lookupanim( "run_n_gun", "F" );
    self setanimlimited( var_3, 1 - var_1, var_2 );
    self setanimlimited( var_0, var_1, var_2 );
    self setflaggedanimknob( "runanim", %run_n_gun, 1, var_2 );

    for (;;)
        wait 1;
}

_id_B5E2()
{
    self notify( "aim_stop" );
    self endon( "aim_stop" );
    var_0 = self._id_AD11;
    var_1 = self._id_C398;

    if ( !isdefined( var_1 ) )
        var_1 = 0.25;

    var_2 = animscripts\utility::lookupanim( "run_n_gun", "F" );
    self setanimlimited( var_2, 1, var_1 );
    self setanimlimited( var_0, 0, var_1 );
    self setflaggedanimknob( "runanim", %run_n_gun, 1, var_1 );
    wait(var_1);
}

_id_D444( var_0 )
{
    level._id_C699 = self;
    self.goalradius = var_0.radius;
    self setgoalnode( var_0 );
    self waittill( "goal" );
    common_scripts\utility::flag_wait_either( "massacre_elevator_prepare_nade", "massacre_rentacops_stairs_dead" );
    common_scripts\utility::flag_set( "massacre_elevator_grenade_ready" );

    if ( common_scripts\utility::flag( "massacre_rentacops_stairs_dead" ) )
        return;

    var_0 maps\_anim::anim_generic( self, "exposed_grenadeThrowB" );
}

_id_D328( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    self.ignoreall = 1;
    maps\_utility::enable_dontevershoot();
    self.noreload = 1;
    self.ignoreall = 0;
    waittillframeend;
    var_1 = anim.animsets.defaultstand;
    var_2 = anim.animsets._id_C62A;

    while ( self getanimweight( %h2_casual_killer_jog_2_heat ) != 0 && self getanimtime( %h2_casual_killer_jog_2_heat ) < 0.98 )
        waitframe();

    thread force_orientation_for_lean_massacre( var_0 );
    thread _id_C67B();
    var_0 = common_scripts\utility::getstruct( "massacre_civ_lobby_aim_node", "targetname" );
    thread _id_D00E( 0, 4, var_0 );
    maps\_utility::delaythread( 1.5, ::_id_B9F8 );
    maps\_utility::ent_flag_set_delayed( "massacre_firing_into_crowd", 1 );
    common_scripts\utility::flag_wait( "massacre_civ_animate" );
    wait 10.5;
    self notify( "stop_burst_fire" );
    self notify( "stop_fire_full_auto" );
    wait 0.25;
    self notify( "stop_spray_and_pray" );
    self.overridearrival = undefined;
    maps\_utility::disable_dontevershoot();
    self.covercrouchlean_aimmode = undefined;
    self.custommoveanimset = undefined;
    self.combatstandanims = undefined;
    self.combatcrouchanims = undefined;
    waittillframeend;
}

force_orientation_for_lean_massacre( var_0 )
{
    self endon( "stop_spray_and_pray" );

    for (;;)
    {
        if ( abs( self.angles[1] - var_0.angles[1] ) > 5 )
            self orientmode( "face angle", 180 );

        wait 0.1;
    }
}

_id_B9F8()
{
    self endon( "stop_spray_and_pray" );
    self endon( "stop_burst_fire" );

    for (;;)
    {
        thread _id_AD44( 0.1, "stop_fire_full_auto", level.scr_anim["m4"]["recoil"] );
        wait(randomfloatrange( 2, 3 ));
        self notify( "stop_fire_full_auto" );
        wait(randomfloatrange( 0.2, 0.4 ));
    }
}

_id_C67B()
{
    self.covercrouchlean_aimmode = 1;
    var_0 = anim.animsets.defaultstand;
    var_0["add_aim_up"] = %exposed_aim_8;
    var_0["add_aim_down"] = %exposed_aim_2;
    var_0["add_aim_left"] = %exposed_aim_4;
    var_0["add_aim_right"] = %exposed_aim_6;
    var_0["straight_level"] = %covercrouch_lean_aim5;
    animscripts\animset::init_animset_complete_custom_stand( var_0 );
    animscripts\animset::init_animset_complete_custom_crouch( var_0 );
}

_id_BA3D( var_0 )
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    maps\_utility::ent_flag_wait( "gate_ready_to_go" );
    waittillframeend;
    common_scripts\utility::flag_wait( "gate_main" );
    common_scripts\utility::flag_wait( "gate_player_ready" );
    self pushplayer( 1 );
    maps\_utility::disable_arrivals();
    self.noreload = undefined;
    self.moveplaybackrate = 1.15;
    _id_ADC9();
    self.interval = 50;
    self.bulletsinclip = weaponclipsize( self.weapon );
    var_1 = getent( "gate_moveup_node_animation", "targetname" );

    switch ( self.script_noteworthy )
    {
        case "saw":
            wait 4;
            var_1 maps\_anim::anim_reach_solo( self, "going_down_stairs" );
            common_scripts\utility::flag_wait( "gate_heli_moveon" );
            var_1 maps\_anim::anim_single_solo( self, "going_down_stairs" );
            self pushplayer( 1 );
            self.moveplaybackrate = 1.05;
            maps\_utility::disable_exits();
            thread maps\_utility::follow_path( var_0 );
            thread _id_B408();
            break;
        case "makarov":
            wait 0.25;
            var_1 maps\_anim::anim_reach_solo( self, "going_down_stairs" );
            thread _id_B408();
            _id_AD4F( var_0 );
            break;
        case "shotgun":
            wait 0.5;
            self.overrideexitanim = level.scr_anim["shotgun"]["walk_start_after_elevator_massacre"];
            var_1 maps\_anim::anim_reach_solo( self, "going_down_stairs" );
            common_scripts\utility::flag_wait( "gate_heli_moveon" );
            var_1 maps\_anim::anim_single_solo( self, "going_down_stairs" );
            self pushplayer( 1 );
            maps\_utility::disable_exits();
            thread maps\_utility::follow_path( var_0 );
            thread _id_B408();
            break;
        case "m4":
            wait 0.15;
            var_1 maps\_anim::anim_reach_solo( self, "going_down_stairs" );
            common_scripts\utility::flag_wait( "gate_heli_moveon" );
            var_1 maps\_anim::anim_single_solo( self, "going_down_stairs" );
            self pushplayer( 1 );
            self.moveplaybackrate = 1.1;
            maps\_utility::disable_exits();
            thread maps\_utility::follow_path( var_0 );
            thread _id_B408();
            break;
    }
}

_id_C500( var_0 )
{
    self.moveplaybackrate = 0.9;
    maps\_utility::set_run_anim( "casual_killer_jog_A" );
    var_0 = getnode( var_0.target, "targetname" );
    var_0 waittill( "trigger" );

    if ( self.script_noteworthy == "saw" )
    {
        var_0 = getnode( var_0.target, "targetname" );
        var_0 waittill( "trigger" );
    }

    wait 0.5;
    maps\_utility::clear_run_anim();
    var_0 = getnode( var_0.target, "targetname" );
    var_0 waittill( "trigger" );
    wait 0.5;

    if ( self.script_noteworthy != "m4" )
        maps\_utility::set_run_anim( "casual_killer_jog_A" );

    switch ( self.script_noteworthy )
    {
        case "makarov":
            wait 0.75;
        case "shotgun":
            wait 0.5;
        case "saw":
            wait 1;
        case "m4":
            wait 0.15;
            break;
    }

    if ( self.script_noteworthy == "saw" )
        wait 0.55;

    maps\_utility::clear_run_anim();
    self.moveplaybackrate = 1.2;
}

_id_B408()
{
    var_0 = "basement_start_" + self.script_noteworthy;
    var_1 = getnode( var_0, "targetname" );
    var_1 waittill( "trigger" );
    maps\_utility::enable_arrivals();
    maps\_utility::enable_exits();
    maps\_utility::set_run_anim( "casual_killer_jog_A" );
    self.moveplaybackrate = 1.0;
    self.bulletsinclip = weaponclipsize( self.weapon );
    common_scripts\utility::flag_set( "basement_near_entrance" );
}

_id_AD4F( var_0 )
{
    self.moveplaybackrate = 1.35;
    self.moveplaybackrate = 1.27;
    self.moveplaybackrate = 1.2;
    common_scripts\utility::flag_set( "gate_heli_moveon" );
    var_1 = getent( "gate_moveup_node_animation", "targetname" );
    var_1 maps\_anim::anim_single_solo( self, "going_down_stairs" );
    self.moveplaybackrate = 1.25;
    self pushplayer( 1 );
    maps\_utility::disable_exits();
    thread maps\_utility::follow_path( var_0 );

    if ( !common_scripts\utility::flag( "gate_player_off_stairs" ) )
    {
        common_scripts\utility::flag_set( "player_DMS_allow_sprint" );
        maps\_utility::add_wait( common_scripts\utility::flag_wait, "gate_player_off_stairs" );
        maps\_utility::add_func( maps\_utility::flag_clear_delayed, "player_DMS_allow_sprint", 1.0 );
        thread maps\_utility::do_wait();
    }

    wait 0.5;
    thread _id_BF76();
}

_id_C8C6( var_0, var_1 )
{
    self endon( "death" );

    if ( var_0.health <= 0 )
        return;

    maps\_utility::add_wait( maps\_utility::_wait, var_0.script_delay );
    var_0 maps\_utility::add_abort( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_func( ::_id_AF29, var_0 );
    thread maps\_utility::do_wait();
    _id_C7D1( var_0 );
    _id_BB70::_id_ADD2();
    _id_BB70::_id_A8CA( var_1 );
    self.dontevershoot = 1;
    maps\_utility::disable_dynamic_run_speed();
    maps\_utility::ent_flag_set( "aiming_at_civ" );
    var_2 = var_0;

    if ( isai( var_0 ) )
    {
        var_2 = spawn( "script_origin", var_0.origin + ( 0.0, 0.0, 35.0 ) );
        var_2.health = 100;
        var_2 linkto( var_0 );
    }

    self setentitytarget( var_2 );
    wait 0.5;

    if ( var_0.health > 0 )
        var_0 waittill( "death" );

    wait 0.25;
    self notify( "upperdeck_canned_deaths_execute_fire" );
    wait 0.25;
    self clearentitytarget();

    if ( var_2 != var_0 )
        var_2 delete();

    maps\_utility::disable_dontevershoot();
    maps\_utility::enable_dynamic_run_speed( undefined, undefined, undefined, undefined, level.team, 1 );
    maps\_utility::ent_flag_clear( "aiming_at_civ" );
    _id_BB70::_id_A8CA( "straight" );
    _id_BB70::_id_B4C7();
    maps\_utility::walkdist_zero();
}

_id_C9C6( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( distancesquared( var_3.origin, self.origin ) < squared( var_1 ) )
            return 1;
    }

    return 0;
}

_id_CABC()
{
    common_scripts\utility::flag_wait( "basement_moveout" );
    self delete();
}

_id_BB7E()
{
    self.health = 1;
    self.ignoreexplosionevents = 1;
    self.ignoreme = 1;
    self.ignorerandombulletdamage = 1;
    self.grenadeawareness = 0;
    maps\_utility::disable_surprise();
    self endon( "death" );

    switch ( self.animation )
    {
        case "civilian_crawl_1":
            maps\_anim::anim_generic_first_frame( self, "civilian_crawl_1" );
            maps\_utility::force_crawling_death( self.angles[1], 3, level.scr_anim["crawl_death_1"], 1 );
            break;
        case "civilian_crawl_2":
            maps\_anim::anim_generic_first_frame( self, "civilian_crawl_1" );
            maps\_utility::force_crawling_death( self.angles[1], 3, level.scr_anim["crawl_death_1"], 1 );
            break;
        case "dying_crawl":
            maps\_anim::anim_generic_first_frame( self, "dying_crawl" );
            maps\_utility::force_crawling_death( self.angles[1], 4, undefined, 1 );
            break;
    }

    self dodamage( 1, level.player.origin );
    self.noragdoll = 1;
    common_scripts\utility::flag_set( "delete_massacre_dummies" );
}

_id_BB01()
{
    wait 0.05;
    self.allowdeath = 1;
    thread maps\_anim::anim_generic_loop( self, self.animation );
    self.usechokepoints = 0;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.ignorerandombulletdamage = 1;
    self.ignoreexplosionevents = 1;
    self.grenadeawareness = 0;
    self.ignoresuppression = 1;
    self.disablebulletwhizbyreaction = 1;
    maps\_utility::disable_surprise();
}

_id_C810()
{
    self endon( "death" );
    _id_BB01();

    if ( !isdefined( level._id_B363 ) )
    {
        level._id_B363 = [];
        level._id_B363[level._id_B363.size] = self;
        wait 0.1;
        thread _id_C8F2( level._id_B363, "scn_airport_running_screams1" );
        wait 0.05;
        level._id_B363 = undefined;
    }
    else
        level._id_B363[level._id_B363.size] = self;

    wait(randomfloat( 1 ));
    self notify( "stop_loop" );
    self stopanimscripted();
    self.interval = 50;
    self.ignorerandombulletdamage = 0;
    var_0 = getnode( self.target, "targetname" );
    maps\_utility::follow_path( var_0 );
    wait 0.25;
    self delete();
}

_id_D1AB()
{
    self endon( "death" );
    _id_BB01();
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = undefined;
    var_2 = undefined;

    switch ( var_0.targetname )
    {
        case "gate_civ_slide":
            self.moveplaybackrate = 1.0;
            var_1 = "civilian_run_hunched_turnR90_slide";
            var_2 = "civilian_run_hunched_A";
            wait 0.25;
            break;
        case "gate_civ_slide2":
            var_1 = "airport_civilian_run_turnR_90";
            var_2 = "civilian_run_hunched_C";
            self.moveplaybackrate = 1.15;
            break;
    }

    wait 5.5;
    self notify( "stop_loop" );
    self stopanimscripted();
    self.interval = 50;
    self.ignorerandombulletdamage = 0;
    maps\_utility::set_generic_run_anim( var_2, 1 );
    var_0 maps\_anim::anim_generic_reach( self, var_1 );
    var_0 maps\_anim::anim_generic_run( self, var_1 );
    maps\_utility::follow_path( getnode( "gate_civ_node", "targetname" ) );
    wait 0.25;
    self delete();
}

_id_BF5A()
{
    common_scripts\utility::flag_wait( "gate_do_status" );
    wait 1;
    var_0 = getentarray( "snd_departure_board", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 playsound( var_2.script_soundalias );

    var_4 = common_scripts\utility::array_randomize( level._id_B6AA );

    foreach ( var_7, var_6 in var_4 )
        var_6 maps\_utility::delaythread( var_7 * 0.1, ::_id_AA4B, "delayed" );
}

_id_C910()
{
    wait(randomfloat( 0.5 ));
    var_0 = randomfloatrange( 1, 1.15 );

    for (;;)
    {
        self rotateyaw( 360, var_0 );
        self waittill( "rotatedone" );
    }
}

_id_D209()
{
    var_0 = 85;
    var_1 = getent( "gate_gate_closing", "targetname" );
    var_2 = getent( "gate_gate_closing2", "targetname" );
    var_2 connectpaths();
    var_1 movez( var_0, 0.25 );
    var_2 movez( var_0 * 2, 0.25 );
}

_id_B3F6()
{
    var_0 = 85;
    var_1 = getent( "gate_gate_closing", "targetname" );
    var_2 = getent( "gate_gate_closing2", "targetname" );
    var_3 = 1.5;
    var_1 movez( var_0 * -1, 1 );
    var_2 movez( var_0 * -2, 1 );
    var_1 playsound( "scn_airport_sec_gate_close" );
    wait(var_3 * 2);
    var_2 disconnectpaths();
    var_3 = 0.1;
    var_1 movez( 2, 1 );
    var_2 movez( 2, 1 );
    wait(var_3);
    var_1 movez( -2, 1 );
    var_2 movez( -2, 1 );
}

gate_player_sprint()
{
    common_scripts\utility::flag_wait( "gate_player_off_stairs" );
    common_scripts\utility::flag_set( "player_DMS_disable_auto_sprint" );
    wait 5.0;
    common_scripts\utility::flag_clear( "player_DMS_disable_auto_sprint" );
}

_id_CAD7()
{
    common_scripts\utility::flag_wait( "gate_heli_moveon" );
    common_scripts\utility::flag_clear( "player_dynamic_move_speed" );
    wait 0.05;
    common_scripts\utility::flag_set( "player_DMS_allow_sprint" );
    common_scripts\utility::flag_wait( "gate_player_off_stairs" );
    thread _id_D2EA();
}

_id_B898()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    maps\_utility::add_wait( maps\_utility::waittill_msg, "damage" );
    maps\_utility::add_func( maps\_utility::set_ignoreall, 0 );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( maps\_utility::waittill_msg, "goal" );
    maps\_utility::add_wait( maps\_utility::trigger_wait, "tarmac_security", "target" );
    maps\_utility::do_wait_any();
    self delete();
}

_id_C14A()
{
    self endon( "death" );
    self notify( "move" );
    maps\_utility::trigger_wait( "tarmac_security", "target" );
    self delete();
}

_id_C66A()
{
    var_0 = getnodearray( "basement_moveup1", "targetname" );
    var_1 = undefined;
    var_2 = common_scripts\utility::getstruct( "tarmac_breach_origin", "targetname" );

    foreach ( var_4 in var_0 )
    {
        switch ( var_4.script_noteworthy )
        {
            case "saw":
                var_2 maps\_utility::delaythread( 0.5, maps\_anim::anim_single_solo, level.team["saw"], "lev_first_breach" );
                level.team[var_4.script_noteworthy] maps\_utility::delaythread( 0.8, maps\_utility::follow_path, var_4 );
                level.team[var_4.script_noteworthy].nocornertwitchanim = 1;
                continue;
            default:
                var_2 maps\_anim::anim_reach_solo( level._id_D41B, "makarov_first_breach" );
                var_2 thread maps\_anim::anim_single_solo( level._id_D41B, "makarov_first_breach" );
                level.team[var_4.script_noteworthy] maps\_utility::enable_cqbwalk();
                level.team[var_4.script_noteworthy] thread maps\_utility::follow_path( var_4 );
                var_1 = var_4;
                continue;
        }
    }

    level._id_D41B waittill( "reached_path_end" );
    maps\_utility::delaythread( 1, maps\_utility::radio_dialogue, "airport_mkv_thisway" );
    level.team["saw"].nodeexitignoreactors = 1;
    level.team["saw"].exitnode_overridetranstime = 0.4;
    level._id_D41B maps\_utility::disable_exits();
    var_1 thread maps\_anim::anim_generic_run( level._id_D41B, "doorkick_basement" );
    level._id_D41B waittillmatch( "single anim", "kick" );
    level._id_D41B maps\_utility::delaythread( 2, maps\_utility::enable_exits );
    level.team["saw"] maps\_utility::delaythread( 2, ::basement_saw_reset_node_exit_ignore_actors );
}

basement_saw_reset_node_exit_ignore_actors()
{
    level.team["saw"].nodeexitignoreactors = undefined;
    level.team["saw"].exitnode_overridetranstime = undefined;
    level.team["saw"].nocornertwitchanim = undefined;
}

_id_ADE4()
{
    common_scripts\utility::flag_wait( "basement_mak_speach" );
    var_0 = level._id_D41B.last_set_goalnode;
    level._id_D41B maps\_utility::delaythread( 2.25, maps\_utility::dialogue_queue, "airport_mkv_forzakhaev" );
    var_0 thread maps\_anim::anim_generic_gravity( level._id_D41B, "bog_a_start_briefing" );
    wait 3.75;
    level._id_D41B notify( "stop_animmode" );
    level._id_D41B stopanimscripted();
}

_id_B517()
{
    self endon( "basement_moveout" );
    common_scripts\utility::flag_wait( "gate_heli_moveon" );
    self.nododgemove = 1;
    self.approachtypefunc = undefined;
    self waittill( "reached_path_end" );
    self.nododgemove = 0;
    _id_CA4A();
    maps\_utility::enable_arrivals();
    self.moveplaybackrate = 1.0;
    self.combatmode = "cover";
    var_0 = self.last_set_goalnode;
    var_1 = var_0.script_noteworthy;
    var_2 = common_scripts\utility::getstruct( "tarmac_breach_origin", "targetname" );
    var_2 maps\_anim::anim_reach_solo( level.team[var_1], "first_breach_arrival" );
    var_2 maps\_anim::anim_single_solo( level.team[var_1], "first_breach_arrival" );
    self.goalradius = 32;
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self.goalradius = 4;

    if ( self.script_noteworthy == "makarov" )
        common_scripts\utility::flag_set( "basement_mak_speach" );

    maps\_utility::enable_exits();
    maps\_utility::clear_run_anim();
    level notify( self.script_noteworthy + "_ready" );
    var_2 maps\_anim::anim_loop_solo( level.team[var_1], "first_breach_loop", "basement_moveout" );
}

_id_B704()
{
    foreach ( var_1 in level.team )
        var_1 maps\_utility::enable_cqbwalk();

    var_3 = getnodearray( "basement_moveup2", "targetname" );
    var_4 = common_scripts\utility::getstruct( "tarmac_breach_origin", "targetname" );

    foreach ( var_6 in var_3 )
    {
        var_7 = var_6.script_noteworthy;

        if ( var_7 == "makarov" )
        {
            level.team[var_7] thread maps\_utility::follow_path( var_6 );
            continue;
        }

        if ( var_7 == "saw" )
        {
            level.team[var_7].nododgemove = 1;
            level.team[var_7] maps\_utility::delaythread( 0.95, maps\_utility::follow_path, var_6 );
            continue;
        }

        if ( var_7 == "m4" )
        {
            var_4 thread maps\_anim::anim_single_solo( level.team[var_7], "viktor_first_breach" );
            level.team[var_7] maps\_utility::delaythread( 0.25, maps\_utility::follow_path, var_6 );
            continue;
        }

        thread basement_moveup_shotgun( var_4, var_6 );
    }

    level.team["shotgun"] pushplayer( 0 );
    level.team["m4"] pushplayer( 0 );
    level._id_D41B waittill( "reached_path_end" );
    common_scripts\utility::flag_set( "basement_mak_saw_riot" );
    level._id_D41B thread maps\_anim::anim_generic( level._id_D41B, "CornerStndR_alert_signal_enemy_spotted" );
}

basement_moveup_shotgun( var_0, var_1 )
{
    wait 0.5;
    var_0 thread maps\_anim::anim_single_solo( level.team["shotgun"], "kiril_first_breach" );
    level.team["shotgun"] maps\_utility::delaythread( 0.25, maps\_utility::follow_path, var_1 );
}

_id_BDB0()
{
    var_0 = self getlightintensity();

    for (;;)
    {
        self setlightintensity( var_0 * randomfloatrange( 0.5, 1.25 ) );
        wait 0.1;
    }
}

_id_B1C4()
{
    if ( isdefined( self.script_drone ) )
        return;

    var_0 = maps\_gameskill::get_skill_from_index( level.player.gameskill );

    switch ( var_0 )
    {
        case "easy":
            self.grenadeammo = 0;

            if ( isdefined( self.baseaccuracy ) )
                self.baseaccuracy *= 0.5;

            break;
        case "normal":
            self.grenadeammo = 0;

            if ( isdefined( self.baseaccuracy ) )
                self.baseaccuracy *= 0.5;

            break;
    }
}

_id_B466( var_0 )
{
    common_scripts\utility::flag_set( var_0 );
    self endon( "death" );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self waittill( "unload" );
    self.ignoreme = 0;
    self.ignoreall = 0;

    if ( isdefined( self.script_noteworthy ) && issubstr( self.script_noteworthy, "tarmac_van_riotshield_guys" ) )
        return;

    if ( isdefined( self.target ) )
    {
        var_1 = getnode( self.target, "targetname" );
        self setgoalnode( var_1 );
        self.goalradius = var_1.radius;
        maps\_utility::trigger_wait_targetname( "tarmac_advance5" );
    }

    maps\_utility::set_force_color( "blue" );
}

_id_C7F8()
{
    var_0 = self;
    var_1 = getvehiclenode( "tarmac_van_mid_path", "script_noteworthy" );
    var_1 maps\_utility::add_wait( maps\_utility::waittill_msg, "trigger" );
    var_0 maps\_utility::add_func( maps\_utility::delaythread, 0.1, maps\_utility::play_sound_on_entity, "airport_tire_skid" );
    var_1 maps\_utility::add_func( common_scripts\utility::flag_set, "tarmac_van_mid_path" );
    maps\_utility::add_func( maps\airport::_id_A983 );
    thread maps\_utility::do_wait();
    var_1 = getvehiclenode( "tarmac_van_almost_end_path", "script_noteworthy" );
    var_1 maps\_utility::add_wait( maps\_utility::waittill_msg, "trigger" );
    var_1 maps\_utility::add_func( maps\_utility::flag_set_delayed, "tarmac_van_almost_end_path", 1 );
    thread maps\_utility::do_wait();
    var_1 = getvehiclenode( "tarmac_van_end_path", "targetname" );
    var_1 maps\_utility::add_wait( maps\_utility::waittill_msg, "trigger" );
    var_1 maps\_utility::add_func( common_scripts\utility::flag_set, "tarmac_van_end_path" );
    maps\_utility::do_wait();
}

_id_BA21( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait( var_0 );
    wait 0.1;
    var_3 = maps\_utility::get_living_ai_array( var_2, "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, ::tarmac_hide_until_ride_end, var_1 );

    if ( !var_3.size )
    {
        level notify( "tarmac_riotshield_group_van_ready" );
        return;
    }

    var_4 = common_scripts\utility::getstruct( var_3[0].target, "targetname" );
    var_5 = anglestoforward( var_4.angles );
    var_6 = maps\_riotshield::group_create( var_3 );
    var_6 thread _id_BA02( var_3 );
    var_6 endon( "break_group" );

    foreach ( var_8 in var_3 )
        var_8 maps\_utility::disable_exits();

    var_6 maps\_riotshield::group_sprint_on();
    var_6 maps\_riotshield::group_lock_angles( var_5 );
    var_6 maps\_riotshield::group_initialize_formation( var_5 );
    var_6 maps\_riotshield::group_move( var_4.origin, var_5 );
    var_6 waittill( "goal" );
    var_6 maps\_riotshield::group_sprint_off();

    foreach ( var_8 in var_3 )
        var_8 maps\_utility::enable_exits();

    level notify( "tarmac_riotshield_group_van_ready" );
}

get_van2()
{
    level.van2 = self;
}

tarmac_hide_until_ride_end( var_0 )
{
    if ( isdefined( var_0 ) && var_0 != "tarmac_swat_van2" )
        return;

    self hide();
    level.van2 waittill( "reached_end_node" );
    common_scripts\utility::delaycall( 0.2, ::show );
}

_id_D348()
{
    level waittill( "tarmac_riotshield_group_van_ready" );
    level notify( "redoing_riot_groups" );
    level endon( "tarmac_riotshield_group_last_stand" );
    var_0 = maps\_utility::get_living_ai_array( "tarmac_van_riotshield_guys", "script_noteworthy" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_living_ai_array( "tarmac_van_riotshield_guys2", "script_noteworthy" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_living_ai_array( "riotshield_group_1", "script_noteworthy" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_living_ai_array( "riotshield_group_2", "script_noteworthy" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_living_ai_array( "riotshield_group_3", "script_noteworthy" ) );
    var_1 = maps\_riotshield::group_create( var_0 );

    if ( var_1.ai_array.size < 9 )
        var_1.fleethreshold = 2;
    else
        var_1.fleethreshold = floor( var_1.ai_array.size * 0.25 );

    var_1 thread _id_D272( var_0 );
    var_1 endon( "break_group" );
    var_1 maps\_riotshield::group_sprint_off();

    foreach ( var_3 in var_0 )
        var_3 maps\_utility::enable_exits();

    var_5 = common_scripts\utility::getstruct( "tarmac_riot_node_retreat1_group_van", "targetname" );
    var_6 = anglestoforward( var_5.angles );
    var_1 maps\_riotshield::group_lock_angles( var_6 );
    var_1 maps\_riotshield::group_initialize_formation( var_6 );
    var_1 maps\_riotshield::group_move( var_5.origin, var_6 );
    var_1 thread _id_D42E();
    var_1 common_scripts\utility::waittill_notify_or_timeout( "goal", 5 );
    common_scripts\utility::flag_set( "tarmac_van_guys_far_enough" );
}

_id_C7C2()
{
    maps\_utility::trigger_wait( "tarmac_advance6", "targetname" );
    var_0 = maps\_utility::get_living_ai_array( "tarmac_van_riotshield_guys", "script_noteworthy" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_living_ai_array( "tarmac_van_riotshield_guys2", "script_noteworthy" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_living_ai_array( "riotshield_group_1", "script_noteworthy" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_living_ai_array( "riotshield_group_2", "script_noteworthy" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::get_living_ai_array( "riotshield_group_3", "script_noteworthy" ) );
    var_1 = [];
    var_1["weak"] = common_scripts\utility::getstruct( "tarmac_riotshield_van2_retreat1", "targetname" );
    var_1["center"] = common_scripts\utility::getstruct( "tarmac_riotshield_consolodate_node", "targetname" );
    var_1["strong"] = common_scripts\utility::getstruct( "tarmac_riotshield_van1_retreat1", "targetname" );
    _id_D3F7( var_0, var_1 );
    maps\_utility::trigger_wait( "tarmac_retreat5", "targetname" );
    var_0 = maps\_utility::array_removedead( var_0 );
    var_1 = [];
    var_1["weak"] = common_scripts\utility::getstruct( "tarmac_riotshield_last_stand_right", "targetname" );
    var_1["center"] = common_scripts\utility::getstruct( "tarmac_riotshield_last_stand_center", "targetname" );
    var_1["strong"] = common_scripts\utility::getstruct( "tarmac_riotshield_last_stand_left", "targetname" );
    var_2 = _id_D3F7( var_0, var_1 );
    maps\_utility::trigger_wait( "tarmac_retreat6", "targetname" );

    if ( !isdefined( var_2 ) )
        return;

    foreach ( var_4 in var_2 )
        var_4.fleethreshold = 10;
}

_id_D3F7( var_0, var_1 )
{
    level notify( "tarmac_riotshield_group_last_stand" );
    level notify( "redoing_riot_groups" );
    var_2 = [];
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        if ( var_5.combatmode != "no_cover" )
            continue;

        var_3[var_3.size] = var_5;
    }

    var_0 = var_3;

    switch ( var_0.size )
    {
        case 0:
            return;
        case 1:
        case 2:
        case 3:
        case 4:
            var_2["center"] = var_0;
            break;
        case 5:
        case 6:
            var_2["center"] = common_scripts\utility::get_array_of_farthest( var_1["strong"].origin, var_0, undefined, 3 );
            var_2["strong"] = common_scripts\utility::array_remove_array( var_0, var_2["center"] );
            break;
        default:
            var_7 = var_0.size / 3 - 0.2;
            var_8 = ceil( var_7 );
            var_9 = ceil( var_7 * 2 );
            var_2["strong"] = common_scripts\utility::get_array_of_closest( var_1["strong"].origin, var_0, undefined, var_0.size - var_9 );
            var_0 = common_scripts\utility::array_remove_array( var_0, var_2["strong"] );
            var_2["weak"] = common_scripts\utility::get_array_of_closest( var_1["weak"].origin, var_0, undefined, var_0.size - var_8 );
            var_2["center"] = common_scripts\utility::array_remove_array( var_0, var_2["weak"] );
            break;
    }

    var_10 = [];

    foreach ( var_18, var_12 in var_2 )
    {
        foreach ( var_5 in var_12 )
            var_5 maps\_utility::enable_exits();

        var_15 = var_1[var_18];
        var_16 = anglestoforward( var_15.angles );
        var_17 = maps\_riotshield::group_create( var_12 );

        if ( var_17.ai_array.size > 3 )
            var_17.fleethreshold = 2;

        var_17 thread _id_D272( var_12 );
        var_17 maps\_riotshield::group_sprint_off();
        var_17 maps\_riotshield::group_lock_angles( var_16 );
        var_17 maps\_riotshield::group_initialize_formation( var_16 );
        var_17 maps\_riotshield::group_move( var_15.origin, var_16 );
        var_17 thread _id_D42E();
        var_10[var_10.size] = var_17;
    }

    return var_10;
}

_id_BA02( var_0 )
{
    level endon( "redoing_riot_groups" );
    self waittill( "break_group" );
    var_0 = maps\_utility::array_removedead( var_0 );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::riotshield_unlock_orientation();
        var_2 maps\_riotshield::riotshield_sprint_off();
        var_2.goalradius = 1024;
        var_2 maps\_utility::set_force_color( "blue" );
    }
}

_id_D450()
{
    self endon( "death" );
    self setgoalpos( self.origin );
    self.goalradius = 16;
    maps\_utility::disable_exits();
    common_scripts\utility::flag_wait( "tarmac_heat_fight" );
    wait 1.3;
    var_0 = getnode( self.target, "targetname" );

    if ( !isdefined( var_0 ) )
        var_0 = common_scripts\utility::getstruct( self.target, "targetname" );

    var_1 = undefined;

    if ( !isdefined( var_0.classname ) )
    {
        if ( !isdefined( var_0.type ) )
            var_1 = "struct";
        else
            var_1 = "node";
    }
    else
        var_1 = "origin";

    var_2 = 300;
    thread maps\_spawner::go_to_node( var_0, var_1, undefined, var_2 );
    wait 1;
    maps\_utility::enable_exits();
}

_id_BC8B()
{
    self endon( "death" );
    self.dontevershoot = 1;
    self.targetname = "tarmac_enemies_wave1";
    thread maps\_utility::enable_teamflashbangimmunity();
    maps\_utility::enable_teamflashbangimmunity();
    maps\_utility::add_wait( maps\_utility::waittill_msg, "damage" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "bullet_hitshield" );
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_open_fire" );
    maps\_utility::do_wait_any();
    common_scripts\utility::flag_set( "tarmac_open_fire" );
    wait(randomfloatrange( 0.75, 1.25 ));
    self.dontevershoot = undefined;

    if ( !isdefined( self.script_noteworthy ) || !issubstr( self.script_noteworthy, "riotshield_group" ) )
        self.goalradius = 1500;
    else
        return;

    maps\_utility::trigger_wait_targetname( "tarmac_retreat1" );
    maps\_utility::set_force_color( "blue" );
}

_id_AD7C()
{
    self endon( "death" );
    self waittill( "goal" );
    wait 0.1;
    self.goalradius = 1024;
    common_scripts\utility::flag_wait( "tarmac_advance4" );
    maps\_utility::set_force_color( "blue" );
}

_id_C113( var_0 )
{
    common_scripts\utility::flag_wait( "tarmac_heat_fight" );
    level endon( "tarmac_riotshield_group_van_ready" );
    level endon( "redoing_riot_groups" );
    wait 0.05;
    var_1 = anglestoforward( ( 0.0, 360.0, 0.0 ) );
    var_2 = maps\_utility::get_living_ai_array( var_0, "script_noteworthy" );

    foreach ( var_4 in var_2 )
        var_4 maps\_utility::riotshield_lock_orientation( 360 );

    var_6 = maps\_riotshield::group_create( var_2 );

    if ( var_6.ai_array.size > 3 )
        var_6.fleethreshold = 2;

    var_6 maps\_riotshield::group_initialize_formation( var_1 );
    var_6 endon( "break_group" );
    var_6 thread _id_D272( var_2 );
    var_7 = undefined;
    var_8 = undefined;

    switch ( var_0 )
    {
        case "riotshield_group_1":
            var_8 = "group1";
            break;
        case "riotshield_group_2":
            var_8 = "group2";
            break;
    }

    wait 10;
    common_scripts\utility::flag_wait( "tarmac_retreat1" );
    var_7 = common_scripts\utility::getstruct( "tarmac_riot_node_retreat1_" + var_8, "targetname" );
    var_6 maps\_riotshield::group_move( var_7.origin, var_1 );
    var_6 thread _id_D42E();
    common_scripts\utility::flag_wait( "tarmac_retreat2" );
    var_7 = common_scripts\utility::getstruct( "tarmac_riot_node_retreat2_" + var_8, "targetname" );
    var_6 maps\_riotshield::group_move( var_7.origin, var_1 );
    var_6 thread _id_D42E();
    common_scripts\utility::flag_wait( "tarmac_retreat3" );
    var_7 = common_scripts\utility::getstruct( "tarmac_riot_node_retreat3_" + var_8, "targetname" );
    var_6 maps\_riotshield::group_move( var_7.origin, var_1 );
    var_6 thread _id_D42E();
}

_id_D42E()
{
    var_0 = maps\_utility::array_removedead( self.ai_array );

    if ( !var_0.size )
        return;

    maps\_riotshield::group_fastwalk_on();

    foreach ( var_2 in var_0 )
    {
        var_2 notify( "tarmac_retreat_logic" );
        var_2 maps\_utility::add_wait( maps\_utility::waittill_msg, "goal" );
        level maps\_utility::add_endon( "redoing_riot_groups" );
        maps\_utility::add_endon( "break_group" );
        var_2 maps\_utility::add_endon( "damage" );
        var_2 maps\_utility::add_endon( "bad_path" );
        var_2 maps\_utility::add_abort( maps\_utility::waittill_msg, "tarmac_retreat_logic" );
        var_2 maps\_utility::add_func( maps\_riotshield::riotshield_fastwalk_off );
        thread maps\_utility::do_wait();
    }
}

_id_D272( var_0 )
{
    level endon( "redoing_riot_groups" );
    self waittill( "break_group" );
    var_0 = maps\_utility::array_removedead( var_0 );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::set_force_color( "blue" );
}

_id_A919()
{
    level endon( "tarmac_riotshield_group_van_ready" );
    maps\_utility::trigger_wait( "tarmac_enemies_wave2", "target" );
    var_0 = common_scripts\utility::getstruct( "tarmac_riot_node_group3", "targetname" );
    wait 0.05;
    var_1 = anglestoforward( var_0.angles );
    var_2 = maps\_utility::get_living_ai_array( "riotshield_group_3", "script_noteworthy" );
    var_3 = maps\_riotshield::group_create( var_2 );
    var_3.fleethreshold = 2;
    var_3 maps\_riotshield::group_lock_angles( anglestoforward( ( 0.0, 360.0, 0.0 ) ) );
    var_3 maps\_riotshield::group_initialize_formation( var_1 );
    var_3 thread _id_BD8D( var_2 );
    var_3 maps\_riotshield::group_move( var_0.origin, var_1 );
    var_3 maps\_riotshield::group_sprint_on();
    var_3 maps\_utility::add_wait( maps\_utility::waittill_msg, "goal" );
    var_3 maps\_utility::add_wait( maps\_utility::waittill_msg, "break_group" );
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_advance4" );
    maps\_utility::do_wait_any();
    var_3 maps\_riotshield::group_sprint_off();
    level notify( "redoing_riot_groups" );
    var_2 = maps\_utility::get_living_ai_array( "riotshield_group_3", "script_noteworthy" );
    var_2 = common_scripts\utility::array_combine( var_2, maps\_utility::get_living_ai_array( "riotshield_group_1", "script_noteworthy" ) );
    var_2 = common_scripts\utility::array_combine( var_2, maps\_utility::get_living_ai_array( "riotshield_group_2", "script_noteworthy" ) );
    var_3 = maps\_riotshield::group_create( var_2 );
    var_3.fleethreshold = 2;
    var_3 maps\_riotshield::group_lock_angles( var_1 );
    var_3 maps\_riotshield::group_initialize_formation( var_1 );
    var_3 thread _id_BD8D( var_2 );
    var_3 maps\_riotshield::group_move( var_0.origin, var_1 );
    var_3 thread _id_D42E();
    common_scripts\utility::flag_wait( "tarmac_advance4" );
    var_0 = common_scripts\utility::getstruct( "tarmac_riot_node_group3_retreat1", "targetname" );
    var_1 = anglestoforward( var_0.angles );
    var_3 maps\_riotshield::group_lock_angles( var_1 );
    var_3 maps\_riotshield::group_initialize_formation( var_1 );
    var_3 maps\_riotshield::group_move( var_0.origin, var_1 );
    var_3 thread _id_D42E();
}

_id_BD8D( var_0 )
{
    level endon( "redoing_riot_groups" );
    self waittill( "break_group" );
    var_0 = maps\_utility::array_removedead( var_0 );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_riotshield::riotshield_sprint_off();
        var_2 maps\_utility::riotshield_unlock_orientation();
        var_2 maps\_utility::set_force_color( "blue" );
    }
}

_id_CD13()
{
    self endon( "death" );
    self endon( "long_death" );
    self.ignoreme = 1;
    self.interval = 0;
    self.disablearrivals = 1;
    maps\_utility::disable_surprise();
    self.disablebulletwhizbyreaction = 1;
    maps\_utility::set_generic_run_anim( "sprint_loop_distant" );
    self waittill( "reached_path_end" );
    self delete();
}

_id_BE19()
{
    self endon( "death" );
    self endon( "long_death" );
    common_scripts\utility::flag_set( "tarmac_enemies_2ndfloor" );
    self.interval = 0;
    self setthreatbiasgroup( "2ndfloorenemies" );
    maps\_utility::disable_surprise();
    self waittill( "goal" );
    self.ignoreall = 0;
    var_0 = getnode( self.target, "targetname" );

    if ( isdefined( var_0.script_noteworthy ) && var_0.script_noteworthy == "flash_throw" )
    {
        waittillframeend;
        self.goalradius = 8;
        self.ignoreall = 1;
        wait(randomfloatrange( 0.5, 1 ));
        self.allowdeath = 1;

        if ( common_scripts\utility::cointoss() )
            maps\_anim::anim_generic( self, "coverstand_grenadeA" );
        else
            maps\_anim::anim_generic( self, "coverstand_grenadeB" );

        self.goalradius = 512;
        self.ignoreall = 0;
    }

    common_scripts\utility::flag_wait_either( "tarmac_advance6", "tarmac_2ndfloor_move_back" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    var_1 = getnodearray( "floor2_covernodes2", "targetname" );

    foreach ( var_0 in var_1 )
    {
        if ( isdefined( var_0._id_C0FC ) )
            continue;

        self.goalradius = 8;
        var_0._id_C0FC = self;
        self setgoalnode( var_0 );
        break;
    }

    self waittill( "goal" );
    self.goalradius = 512;
    self.ignoreall = 0;
    self.ignoreme = 0;
    common_scripts\utility::flag_wait( "tarmac_clear_out_2nd_floor" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.goalradius = 64;
    var_0 = getnode( "tarmac_2ndfloor_clearout", "targetname" );
    self setgoalpos( var_0.origin );
    self waittill( "goal" );
    self delete();
}

_id_AD42( var_0, var_1 )
{
    level notify( "spawned" + var_1 );
    thread maps\airport_aud::start_tarmac_swat_van( var_0 );
}

_id_D208( var_0 )
{
    var_1 = spawn( "script_model", self.origin );
    var_1.angles = self.angles;
    var_1 setmodel( self.model );
    level waittill( "spawned" + var_0 );
    var_1 delete();
}

_id_B4BD()
{
    self waittill( "drone_spawned", var_0 );
    var_0 waittill( "death" );

    for (;;)
    {
        wait 8;
        self.count = 1;
        var_0 = maps\_utility::spawn_ai();
        var_0 waittill( "death" );
    }
}

_id_B4EA()
{
    self endon( "death" );
    wait 0.1;
    self.allowdeath = 1;
    _id_CC37();
    maps\_utility::ent_flag_init( "moving" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "tarmac_killed_security" );
    thread maps\_utility::do_wait();
    self._id_BF36 = level.player;
    self.ref = spawn( "script_origin", self.origin );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    self.ref maps\_utility::add_call( ::delete );
    thread maps\_utility::do_wait();

    if ( isdefined( self.script_noteworthy ) )
        thread _id_B3D2();
    else
        thread _id_BE82();

    for (;;)
    {
        self notify( "tarmac_police_fire" );
        common_scripts\utility::flag_wait_either( "tarmac_too_far", "tarmac_killed_security" );
        wait(randomfloat( 1 ));
        thread _id_B3CC();
        common_scripts\utility::flag_waitopen( "tarmac_too_far" );
        common_scripts\utility::flag_waitopen( "tarmac_killed_security" );
    }
}

_id_BE82()
{
    self endon( "death" );
    self._id_BF36 endon( "death" );
    _id_B436();

    for (;;)
    {
        _id_BEBC();
        wait 0.1;
    }
}

_id_B3D2()
{
    self endon( "death" );
    self._id_BF36 endon( "death" );
    self._id_BF32["stand"] = ::_id_ADF5;
    self._id_BF32["walk"] = ::_id_C68A;
    self._id_BF32["run"] = ::_id_B50E;
    self.radius = 16;
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = "walk";

    for (;;)
    {
        if ( var_0.script_noteworthy == "stand" )
            _id_C8C7( var_0, var_1 );

        var_1 = var_0.script_noteworthy;
        _id_C8C7( var_0, var_1 );
        var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    }
}

_id_ADF5( var_0 )
{
    _id_B436();
    var_1 = 0.1;

    for ( var_2 = randomfloatrange( 5, 10 ); var_2 > 0; var_2 -= var_1 )
    {
        _id_BEBC();
        wait(var_1);
    }

    self.ref notify( "stop_loop" );
    self stopanimscripted();
    self unlink();
}

_id_B436()
{
    self.ref.origin = self.origin;
    self.ref.angles = self.angles;
    self linkto( self.ref );
    self clearanim( %body, 0.2 );
    self stopanimscripted();
    self setflaggedanimknoballrestart( "drone_anim", %pistol_stand_aim_5, %body, 1, 0.2, 1 );
}

_id_BEBC()
{
    var_0 = ( self._id_BF36.origin[0], self._id_BF36.origin[1], self.origin[2] );
    var_1 = vectortoangles( var_0 - self.origin );
    self.ref rotateto( var_1, 0.05 );
}

_id_C68A( var_0 )
{
    var_1 = ( self._id_BF36.origin[0], self._id_BF36.origin[1], self.origin[2] );
    var_2 = var_1 - self.origin;
    var_3 = anglestoright( vectortoangles( var_2 ) );
    var_4 = var_0.origin - self.origin;

    if ( vectordot( var_2, var_4 ) > 0.4 )
        self._id_AF55 = "pistol_walk";
    else if ( vectordot( var_3, var_4 ) >= 0.6 )
        self._id_AF55 = "pistol_walk_left";
    else if ( vectordot( var_3, var_4 ) <= 0.6 )
        self._id_AF55 = "pistol_walk_right";
    else
        self._id_AF55 = "pistol_walk_back";

    self._id_CBDA = 1.0;
    _id_C533( var_0 );
}

_id_B50E( var_0 )
{
    self._id_AF55 = "pistol_sprint";
    self._id_CBDA = 0.8;
    _id_C533( var_0 );
}

_id_C533( var_0 )
{
    thread _id_C912( var_0 );
    _id_ACBA( var_0 );
    self clearanim( %body, 0.2 );
    self stopanimscripted();
}

_id_C912( var_0 )
{
    self endon( "death" );
    self endon( "goal" );
    self._id_BF36 endon( "death" );
    self clearanim( %body, 0.2 );
    self stopanimscripted();
    self setflaggedanimknoballrestart( "drone_anim", maps\_utility::getanim_generic( self._id_AF55 ), %body, 1, 0.2, self.moveplaybackrate * self._id_CBDA );
    var_1 = _id_CBF3( var_0 );
    self rotateto( var_1, 0.2 );
    wait 0.2;

    for (;;)
    {
        var_1 = _id_CBF3( var_0 );
        self rotateto( var_1, 0.2 );
        wait 0.2;
    }
}

_id_CBF3( var_0 )
{
    var_1 = undefined;

    switch ( self._id_AF55 )
    {
        case "pistol_walk_left":
            var_1 = vectortoangles( anglestoright( vectortoangles( self.origin - var_0.origin ) ) );
            break;
        case "pistol_walk_right":
            var_1 = vectortoangles( anglestoright( vectortoangles( var_0.origin - self.origin ) ) );
            break;
        case "pistol_walk":
            var_1 = vectortoangles( var_0.origin - self.origin );
            break;
        case "pistol_walk_back":
            var_1 = vectortoangles( self.origin - var_0.origin );
            break;
        case "pistol_sprint":
            var_1 = vectortoangles( vectornormalize( var_0.origin - self.origin ) );
            break;
    }

    return var_1;
}

_id_ACBA( var_0 )
{
    maps\_utility::ent_flag_set( "moving" );

    while ( distancesquared( self.origin, var_0.origin ) > squared( self.radius ) )
        wait 0.05;

    maps\_utility::ent_flag_clear( "moving" );
    self notify( "goal" );
}

_id_C8C7( var_0, var_1 )
{
    var_2 = self._id_BF32[var_1];
    self [[ var_2 ]]( var_0 );
}

_id_C3B8( var_0 )
{
    self notify( "debug_goal" );
    thread maps\_utility::draw_line_from_ent_to_ent_until_notify( self, var_0, 1, 1, 1, self, "debug_goal" );
    thread maps\_utility::draw_circle_until_notify( var_0.origin, self.radius, 1, 1, 1, self, "debug_goal" );
}

_id_CC37()
{
    maps\_utility::gun_remove();
    self.weapon = "beretta";
    var_0 = getweaponmodel( self.weapon );
    self attach( var_0, "tag_weapon_right" );
    self hidepart( "TAG_SILENCER" );
}

_id_B963()
{
    self endon( "death" );
    self.ignoreme = 1;
    self.favoriteenemy = level.player;

    for (;;)
    {
        self.dontevershoot = 1;
        self notify( "tarmac_sniper_fire" );
        common_scripts\utility::flag_wait_either( "tarmac_too_far", "tarmac_killed_security" );
        thread maps\_utility::flag_clear_delayed( "tarmac_killed_security", 6 );
        self.dontevershoot = undefined;
        thread _id_AB92();
        common_scripts\utility::flag_waitopen( "tarmac_too_far" );
        common_scripts\utility::flag_waitopen( "tarmac_killed_security" );
    }
}

_id_D50D()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "tarmac_open_fire" );
    wait 0.5;
    maps\_utility::set_battlechatter( 0 );
}

_id_AB92()
{
    self endon( "death" );
    self endon( "tarmac_sniper_fire" );

    for (;;)
    {
        if ( self cansee( level.player ) )
            _id_B376();

        wait(randomfloatrange( 1.4, 3 ));
    }
}

_id_B3CC()
{
    self endon( "tarmac_police_fire" );
    self endon( "death" );

    for (;;)
    {
        if ( !maps\_utility::ent_flag( "moving" ) )
            _id_B376();

        wait(randomfloatrange( 0.3, 0.5 ));
    }
}

_id_B376()
{
    if ( isai( self ) )
        self shoot();
    else
    {
        var_0 = %pistol_stand_fire_a;
        self setanimknobrestart( var_0, 1, 0.2, 1.0 );
        common_scripts\utility::delaycall( 0.25, ::clearanim, var_0, 0 );
        playfxontag( common_scripts\utility::getfx( "pistol_muzzleflash" ), self, "tag_flash" );
    }

    var_1 = maps\_gameskill::get_skill_from_index( level.player.gameskill );

    if ( var_1 == "easy" )
        magicbullet( self.weapon, self gettagorigin( "tag_flash" ), level.player geteye() + ( randomfloat( 32 ), randomfloat( 32 ), randomfloat( 32 ) ) );
    else
        magicbullet( self.weapon, self gettagorigin( "tag_flash" ), level.player geteye() + ( randomfloat( 64 ), randomfloat( 64 ), randomfloat( 64 ) ) );
}

_id_C4C3()
{
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    var_0 = getent( "tarmac_player_too_far", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        common_scripts\utility::flag_set( "tarmac_too_far" );
        var_1 = level._id_D162;
        level._id_D162 = &"AIRPORT_FAIL_POLICE_BARRICADE";
        thread _id_C9AF();

        while ( level.player istouching( var_0 ) )
            wait 0.1;

        common_scripts\utility::flag_clear( "tarmac_too_far" );
        level._id_D162 = var_1;
    }
}

_id_C9AF()
{
    level endon( "friendly_fire_warning" );
    level endon( "tarmac_too_far" );
    level.player waittill( "death" );
    setdvar( "ui_deadquote", level._id_D162 );
    maps\_utility::missionfailedwrapper();
}

_id_B1C1( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    self.dontevershoot = 1;
    self.ignoreall = 0;
    self.ignoreme = 0;
    self.moveplaybackrate = 1.0;
    self.combatmode = "cover";
    self.interval = 0;
    self.nododgemove = 0;
    maps\_utility::enable_arrivals();

    if ( self.script_noteworthy == "makarov" )
        maps\_utility::delaythread( 0.5, maps\_utility::radio_dialogue, "airport_mkv_go" );

    _id_ABF6( var_0 );
    self stopanimscripted();
    thread maps\_utility::follow_path( var_0 );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "tarmac_pre_heat_fight" );
    maps\_utility::disable_cqbwalk();
    maps\_utility::clear_run_anim();
    self pushplayer( 0 );
    common_scripts\utility::flag_wait( "tarmac_heat_fight" );
    maps\_utility::enable_heat_behavior();
    _id_BB70::casual_killer_setup_custom_turns( 0 );
    self waittill( "reached_path_end" );

    if ( self.script_noteworthy == "shotgun" || self.script_noteworthy == "saw" )
        self.custommovetransition = undefined;

    common_scripts\utility::flag_wait( "tarmac_open_fire" );
    self.dontevershoot = undefined;
    common_scripts\utility::flag_wait( "tarmac_retreat1" );
    maps\_utility::set_force_color( "red" );
}

tarmac_moveout_custom_heatexit()
{
    if ( self.angles[1] > 140 && self.angles[1] < 220 )
        animscripts\exit_node::donodeexitanimation( "heat_right", 8 );
    else
    {
        self.custommovetransition = undefined;
        animscripts\exit_node::startmovetransition();
    }
}

_id_C389( var_0, var_1 )
{
    var_2 = 80;
    var_3 = _id_B973();

    while ( distance2d( self.origin, var_3.origin ) > var_2 )
        wait 0.05;

    var_4 = 850;

    while ( isdefined( var_1 ) && distance2d( var_1.origin, var_0.origin ) > var_4 )
        wait 0.05;
}

_id_B89B()
{
    var_0 = [];
    var_0["makarov"] = "saw";
    var_0["shotgun"] = "makarov";
    var_0["m4"] = "shotgun";
    return var_0;
}

_id_B973()
{
    var_0 = getnodearray( "basement_moveup2", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.script_noteworthy == self.script_noteworthy )
            return var_2;
    }
}

_id_ABF6( var_0 )
{
    var_1 = _id_B89B();
    var_2 = var_1[self.script_noteworthy];

    if ( isdefined( var_2 ) )
        var_2 = level.team[var_2];

    _id_C389( var_0, var_2 );
}

_id_CEA4()
{
    self endon( "death" );
    thread _id_C2DF();
    maps\_utility::unmake_hero();

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self.maxhealth = 250;
    self.health = 250;
    self.grenadeawareness = 0;
    self.nogrenadereturnthrow = 1;
    maps\_utility::trigger_wait_targetname( "tarmac_advance8" );
    thread _id_C645();
}

_id_C2DF()
{
    self waittill( "death" );
    common_scripts\utility::flag_waitopen( "tarmac_bcs" );
    var_0 = level._id_D41B;
    var_1 = level.team["m4"];
    wait(randomfloat( 0.1 ));

    if ( common_scripts\utility::flag( "tarmac_kill_friendly_bsc" ) )
        return;

    common_scripts\utility::flag_set( "tarmac_kill_friendly_bsc" );
    common_scripts\utility::flag_set( "tarmac_bcs" );
    var_1 maps\_utility::dialogue_queue( "man_down" );
    var_0 maps\_utility::dialogue_queue( "man_down" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_C645()
{
    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self kill();
}

_id_AD3A()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 setthreatbiasgroup( "underpass_guys" );
        var_0 thread _id_B38A( self );
    }
}

_id_B38A( var_0 )
{
    self endon( "death" );

    if ( isdefined( self._id_B38A ) )
        return;

    self._id_B38A = 1;

    while ( self istouching( var_0 ) )
        wait 0.1;

    self._id_B38A = undefined;
    self setthreatbiasgroup();
}

_id_B31C()
{
    createthreatbiasgroup( "2ndfloorenemies" );
    createthreatbiasgroup( "underpass_guys" );
    setignoremegroup( "2ndfloorenemies", "underpass_guys" );
    setignoremegroup( "underpass_guys", "2ndfloorenemies" );
    getent( "tarmac_threatbias_group", "targetname" ) thread _id_AD3A();
}

_id_D125()
{
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_enemies_wave1_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_enemies_wave2_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_van_guys_dead" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "tarmac_van_guys2_dead" );
    maps\_utility::add_abort( common_scripts\utility::flag_wait, "do_not_save" );
    maps\_utility::add_func( maps\_utility::autosave_or_timeout, "tarmac_left_underpass", 4 );
    thread maps\_utility::do_wait();

    if ( !common_scripts\utility::flag( "do_not_save" ) )
        thread maps\_utility::autosave_by_name( "tarmac_heat_fight" );

    maps\_utility::trigger_wait( "tarmac_enemies_wave2", "target" );

    if ( !common_scripts\utility::flag( "do_not_save" ) )
        thread maps\_utility::autosave_or_timeout( "tarmac_wave2launch", 4 );

    maps\_utility::trigger_wait( "tarmac_advance5", "targetname" );

    if ( !common_scripts\utility::flag( "do_not_save" ) )
        thread maps\_utility::autosave_or_timeout( "tarmac_at_underpass", 4 );

    maps\_utility::trigger_wait( "tarmac_advance8", "targetname" );

    if ( !common_scripts\utility::flag( "do_not_save" ) )
        thread maps\_utility::autosave_or_timeout( "tarmac_left_underpass", 4 );
}

_id_A91B()
{
    maps\_utility::trigger_wait( "tarmac_advance8", "targetname" );
    var_0 = getaiarray( "axis" );
    var_1 = maps\_utility::get_living_ai_array( "tarmac_enemies_2ndfloor", "script_noteworthy" );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::get_living_ai_array( "tarmac_littlebird_sniper", "script_noteworthy" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::get_living_ai_array( "tarmac_littlebird_sniper2", "script_noteworthy" ) );
    var_0 = common_scripts\utility::array_remove_array( var_0, var_1 );

    if ( var_0.size > 4 )
        maps\_utility::waittill_dead_or_dying( var_0, var_0.size - 4 );

    common_scripts\utility::flag_set( "tarmac_clear_out_2nd_floor" );
    _id_B6F2();
}

_id_B176()
{
    var_0 = getnode( "tarmac_makarov_last_node", "targetname" );
    maps\_utility::trigger_wait( "tarmac_advance8", "targetname" );
    var_1 = getaiarray( "axis" );
    var_2 = maps\_utility::get_living_ai_array( "tarmac_enemies_2ndfloor", "script_noteworthy" );
    var_2 = common_scripts\utility::array_combine( var_2, maps\_utility::get_living_ai_array( "tarmac_littlebird_sniper", "script_noteworthy" ) );
    var_2 = common_scripts\utility::array_combine( var_2, maps\_utility::get_living_ai_array( "tarmac_littlebird_sniper2", "script_noteworthy" ) );
    var_1 = common_scripts\utility::array_remove_array( var_1, var_2 );

    if ( var_1.size > 3 )
        maps\_utility::waittill_dead_or_dying( var_1, var_1.size - 3 );

    level._id_D41B maps\_utility::disable_ai_color();
    level._id_D41B setgoalnode( var_0 );
    level._id_D41B.radius = var_0.radius;
}

_id_C2EF()
{
    var_0 = getentarray( "elevator_housing", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 hide();
        var_2 notsolid();
    }
}

_id_B9A3()
{
    var_0 = getaiarray( "axis" );
    var_1 = maps\_utility::get_living_ai_array( "tarmac_enemies_2ndfloor", "script_noteworthy" );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::get_living_ai_array( "tarmac_littlebird_sniper", "script_noteworthy" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::get_living_ai_array( "tarmac_littlebird_sniper2", "script_noteworthy" ) );
    var_0 = common_scripts\utility::array_remove_array( var_0, var_1 );
    return var_0;
}

_id_BAB6( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    _id_B74E();
    common_scripts\utility::array_thread( getentarray( var_1.target, "targetname" ), maps\_utility::add_spawn_function, ::_id_B920, self );
    var_1 delete();
    common_scripts\utility::waittill_any( "reached_end_node", "death" );
    wait 1;
    self notify( "hack_unload" );
}

_id_B920( var_0 )
{
    if ( self.script_noteworthy == "escape_van_mate" )
        return;

    if ( isdefined( self.script_startingposition ) && var_0._id_C4DE[self.script_startingposition]["free"] )
        _id_B87D( var_0, self.script_startingposition );
    else
    {
        foreach ( var_3, var_2 in var_0._id_C4DE )
        {
            if ( !var_2["free"] )
                continue;

            _id_B87D( var_0, var_3 );
            return;
        }
    }
}

_id_B87D( var_0, var_1 )
{
    var_0._id_C4DE[var_1]["free"] = 0;
    self linkto( var_0._id_C4DE[var_1]["node"] );

    if ( var_1 == 0 )
        var_0._id_C4DE[var_1]["node"] thread maps\_anim::anim_generic_loop( self, "bm21_driver_idle" );
    else
        var_0._id_C4DE[var_1]["node"] thread maps\_anim::anim_generic_loop( self, "riotshield_idle" );

    var_0._id_C4DE[var_1]["guy"] = self;
    self._id_B9AF = var_0._id_C4DE[var_1]["node"];
}

_id_D386()
{
    self waittill( "hack_unload" );

    foreach ( var_2, var_1 in self._id_C4DE )
    {
        if ( isalive( var_1["guy"] ) )
            thread _id_BFA2( var_2, var_1 );
    }
}

_id_BFA2( var_0, var_1 )
{
    var_2 = var_1["guy"];
    thread _id_C8C0( var_0, var_2 );
    var_2 endon( "death" );

    if ( isdefined( var_2._id_ADE3 ) )
    {
        wait 0.1;
        var_2 notify( "hack_unloaded" );
        return;
    }

    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = 0;
    var_7 = 0;

    switch ( var_0 )
    {
        case 0:
            var_7 = 0;
            var_3 = self._id_C4DE[0]["node"];
            var_5 = "bm21_driver_climbout";
            break;
        case 1:
        case 3:
        case 5:
        case 7:
            var_7 = var_0 - 1;
            var_3 = self._id_C4DE[1]["node"];
            var_5 = "traverse_jumpdown_40";
            break;
        case 2:
        case 4:
        case 6:
        case 8:
            var_7 = var_0 - 2;
            var_3 = self._id_C4DE[2]["node"];
            var_5 = "traverse_jumpdown_40";
            wait(randomfloatrange( 0.1, 0.4 ));
            break;
    }

    wait(var_7 * 0.5);
    self._id_C4DE[var_0]["node"] notify( "stop_loop" );
    var_2 stopanimscripted();
    var_2.allowdeath = 1;
    var_8 = getanimlength( maps\_utility::getgenericanim( var_5 ) );

    if ( var_0 == 0 )
    {
        var_4 = spawn( "script_origin", var_3.origin );
        var_4.angles = self.angles;
        var_2 linkto( var_4 );
        var_4 thread maps\_anim::anim_generic( var_2, var_5 );
        wait 0.25;
        var_4 movez( 8, 0.25 );
    }
    else
    {
        var_9 = anglestoforward( var_3.angles );
        var_4 = spawn( "script_origin", var_3.origin + var_9 * 16 );
        var_4.angles = self.angles;
        var_2 linkto( var_4 );
        var_2.moveplaybackrate = randomfloatrange( 0.9, 1.1 );
        var_4 thread maps\_anim::anim_generic( var_2, var_5 );
        var_2 maps\_utility::delaythread( var_8 - 0.2, maps\_utility::anim_stopanimscripted );
        wait 0.25;
        var_4 movez( 12, 0.25 );
        wait 0.25;
        var_2 unlink();
    }

    var_2 waittill( "single anim" );
    var_2.moveplaybackrate = 1;
    var_4 delete();
    var_2 notify( "hack_unloaded" );
}

_id_C8C0( var_0, var_1 )
{
    var_1 common_scripts\utility::waittill_either( "death", "hack_unloaded" );
    self._id_C4DE[var_0]["free"] = 1;

    foreach ( var_3 in self._id_C4DE )
    {
        if ( !self._id_C4DE[var_0]["free"] )
            return;
    }

    self notify( "finished_unloading" );
}

_id_B74E()
{
    var_0 = self;
    var_1 = anglestoforward( var_0.angles );
    var_2 = anglestoright( var_0.angles );
    var_3 = vectortoangles( var_1 * -1 );
    var_4 = ( 0.0, 0.0, 28.0 );
    var_0._id_C4DE = [];
    var_0.guys = [];
    var_5 = 0;
    var_6 = var_0.origin + var_1 * 44 + var_2 * -24 + ( 0.0, 0.0, 48.0 );
    var_0._id_C4DE[var_5] = [];
    var_0._id_C4DE[var_5]["node"] = spawn( "script_origin", var_6 );
    var_0._id_C4DE[var_5]["node"].angles = var_0.angles;
    var_0._id_C4DE[var_5]["node"] linkto( var_0 );
    var_0._id_C4DE[var_5]["free"] = 1;
    var_5 = 1;
    var_6 = var_0.origin + var_1 * -88 + var_2 * -16 + var_4;
    var_0._id_C4DE[var_5] = [];
    var_0._id_C4DE[var_5]["node"] = spawn( "script_origin", var_6 );
    var_0._id_C4DE[var_5]["node"].angles = var_3;
    var_0._id_C4DE[var_5]["node"] linkto( var_0 );
    var_0._id_C4DE[var_5]["free"] = 1;
    var_5 = 2;
    var_6 = var_0.origin + var_1 * -88 + var_2 * 16 + var_4;
    var_0._id_C4DE[var_5] = [];
    var_0._id_C4DE[var_5]["node"] = spawn( "script_origin", var_6 );
    var_0._id_C4DE[var_5]["node"].angles = var_3;
    var_0._id_C4DE[var_5]["node"] linkto( var_0 );
    var_0._id_C4DE[var_5]["free"] = 1;
    var_5 = 3;
    var_6 = var_0.origin + var_1 * -56 + var_2 * -16 + var_4;
    var_0._id_C4DE[var_5] = [];
    var_0._id_C4DE[var_5]["node"] = spawn( "script_origin", var_6 );
    var_0._id_C4DE[var_5]["node"].angles = var_3;
    var_0._id_C4DE[var_5]["node"] linkto( var_0 );
    var_0._id_C4DE[var_5]["free"] = 1;
    var_5 = 4;
    var_6 = var_0.origin + var_1 * -56 + var_2 * 16 + var_4;
    var_0._id_C4DE[var_5] = [];
    var_0._id_C4DE[var_5]["node"] = spawn( "script_origin", var_6 );
    var_0._id_C4DE[var_5]["node"].angles = var_3;
    var_0._id_C4DE[var_5]["node"] linkto( var_0 );
    var_0._id_C4DE[var_5]["free"] = 1;
    var_5 = 5;
    var_6 = var_0.origin + var_1 * -24 + var_2 * -16 + var_4;
    var_0._id_C4DE[var_5] = [];
    var_0._id_C4DE[var_5]["node"] = spawn( "script_origin", var_6 );
    var_0._id_C4DE[var_5]["node"].angles = var_3;
    var_0._id_C4DE[var_5]["node"] linkto( var_0 );
    var_0._id_C4DE[var_5]["free"] = 1;
    var_5 = 6;
    var_6 = var_0.origin + var_1 * -24 + var_2 * 16 + var_4;
    var_0._id_C4DE[var_5] = [];
    var_0._id_C4DE[var_5]["node"] = spawn( "script_origin", var_6 );
    var_0._id_C4DE[var_5]["node"].angles = var_3;
    var_0._id_C4DE[var_5]["node"] linkto( var_0 );
    var_0._id_C4DE[var_5]["free"] = 1;
    var_5 = 7;
    var_6 = var_0.origin + var_1 * 8 + var_2 * -16 + var_4;
    var_0._id_C4DE[var_5] = [];
    var_0._id_C4DE[var_5]["node"] = spawn( "script_origin", var_6 );
    var_0._id_C4DE[var_5]["node"].angles = var_3;
    var_0._id_C4DE[var_5]["node"] linkto( var_0 );
    var_0._id_C4DE[var_5]["free"] = 1;
    var_5 = 8;
    var_6 = var_0.origin + var_1 * 8 + var_2 * 16 + var_4;
    var_0._id_C4DE[var_5] = [];
    var_0._id_C4DE[var_5]["node"] = spawn( "script_origin", var_6 );
    var_0._id_C4DE[var_5]["node"].angles = var_3;
    var_0._id_C4DE[var_5]["node"] linkto( var_0 );
    var_0._id_C4DE[var_5]["free"] = 1;
    var_0 thread _id_D386();
}

_id_B554()
{
    magicgrenademanual( "smoke_grenade_american", self.origin, ( 0.0, 0.0, -1.0 ), randomfloat( 1 ) );
}

_id_B82C()
{
    if ( !common_scripts\utility::flag_exist( "tarmac_bcs_enemy" ) )
        common_scripts\utility::flag_init( "tarmac_bcs_enemy" );

    if ( !common_scripts\utility::flag_exist( "bsc_nade" ) )
        common_scripts\utility::flag_init( "bsc_nade" );

    level endon( "escape_main" );
    common_scripts\utility::flag_wait( "tarmac_open_fire" );
    wait 2;

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( common_scripts\utility::flag( "tarmac_bcs_enemy" ) )
            continue;

        if ( common_scripts\utility::flag( "tarmac_bcs" ) )
            continue;

        if ( common_scripts\utility::flag( "bsc_nade" ) )
            continue;

        if ( !isdefined( var_0 ) )
            continue;

        if ( !isdefined( var_0.origin ) )
            continue;

        if ( distancesquared( var_0.origin, level.player.origin ) > squared( 1024 ) )
            continue;

        common_scripts\utility::flag_set( "tarmac_bcs_enemy" );
        common_scripts\utility::flag_set( "tarmac_bcs" );

        if ( common_scripts\utility::cointoss() && self.script_soundalias != "enemy_bus" || self.script_soundalias == "enemy_underplane" )
            level._id_D41B maps\_utility::dialogue_queue( self.script_soundalias );
        else
            level.team["m4"] maps\_utility::dialogue_queue( self.script_soundalias );

        common_scripts\utility::flag_clear( "tarmac_bcs" );
        wait 5;
        common_scripts\utility::flag_clear( "tarmac_bcs_enemy" );
        wait 15;
    }
}

_id_AF16()
{
    self._id_ADE3 = 1;
    thread _id_C35B();
}

_id_D226()
{
    self endon( "death" );
    thread _id_C35B();
    self.animname = "van_mate";
    self.allowdeath = 1;
    self.health = 1;
    self.maxhealth = 1;
    self setgoalpos( self.origin );
    self.goalradius = 16;
    maps\_utility::gun_remove();
    level._id_AA36 = self;
    common_scripts\utility::flag_wait( "escape_van_ready" );
    level._id_C0BA maps\_anim::anim_first_frame_solo( self, "end_open_door" );
    wait 0.05;
    var_0 = level._id_C0BA;
    self linkto( var_0, "tag_body" );
}

_id_C086( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    _id_B74E();
    common_scripts\utility::array_thread( getentarray( var_1.target, "targetname" ), maps\_utility::add_spawn_function, ::_id_B920, self );
    var_1 delete();
    var_2 = getent( "ambulance_light", "targetname" );
    var_3 = getent( "ambulance_light_interior", "targetname" );

    if ( isdefined( var_2 ) )
        self _meth_848A( var_2.origin );

    if ( isdefined( var_3 ) )
        self._id_AB3E["h2_vehicle_ambulance_russian_interior"] _meth_848A( var_3.origin );

    level._id_C0BA = self;
    self.animname = "ambulance";
    maps\_anim::setanimtree();
    self _meth_85C3( 0 );
    maps\_anim::anim_first_frame_solo( self, "end_open_door" );
    thread maps\airport_aud::start_scripted_escape_van();
    common_scripts\utility::flag_set( "escape_van_ready" );
}

_id_AB53()
{
    self endon( "escape_enter_van" );
    self endon( "death" );

    if ( common_scripts\utility::flag( "escape_sequence_go" ) )
        return;

    level endon( "escape_sequence_go" );
    self waittill( "anim_reach_complete" );

    if ( self == level._id_D41B )
        self waittill( "stand_exposed_wave_halt_v2" );

    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    var_0 = undefined;
    var_1 = undefined;

    switch ( self.a.pose )
    {
        case "crouch":
            maps\_anim::anim_generic( self, "exposed_crouch_2_stand" );
        case "stand":
            maps\_anim::anim_generic( self, "casual_stand_idle_trans_in" );
            thread maps\_anim::anim_generic_loop( self, "casual_stand_idle" );
            break;
    }
}

_id_CF0D()
{
    level.scr_anim["generic"]["DRS_sprint"] = %heat_run_loop;
    level.scr_anim["generic"]["DRS_combat_jog"] = %combat_jog;
    level.scr_anim["generic"]["DRS_run_2_stop"] = %run_2_stand_f_6;
    level.scr_anim["generic"]["DRS_stop_idle"][0] = %exposed_aim_5;
    level.scr_anim["generic"]["signal_go"] = undefined;
    level.scr_anim["generic"]["DRS_run"] = undefined;
    level notify( "friendly_fire_stop_checking_for_player_fire" );
    var_0 = getent( "ambulance_door_right", "targetname" );
    var_1 = getent( "ambulance_door_left", "targetname" );
    var_1 connectpaths();
    var_0 connectpaths();
    wait 2;
    var_1 delete();
    var_0 delete();
    common_scripts\utility::flag_clear( "friendly_fire_pause_flash" );
    common_scripts\utility::flag_clear( "friendly_fire_pause_fire" );
    level.player.participation = 0;
}

_id_BAC1( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
    {
        if ( !isalive( level._id_BA78[var_3.script_noteworthy] ) )
            continue;

        var_4 = 0;
        level._id_BA78[var_3.script_noteworthy] maps\_utility::delaythread( var_4, maps\_utility::follow_path, var_3, var_1 );
    }
}

_id_BD21()
{
    level._id_BA78 = [];
    var_0 = 0;

    foreach ( var_2 in level.team )
    {
        if ( var_2 == level._id_D41B )
            continue;

        var_0++;
        level._id_BA78[maps\_utility::string( var_0 )] = var_2;
    }

    level._id_BA78["makarov"] = level._id_D41B;
}

_id_B901()
{
    level.player allowjump( 0 );
    var_0 = level.player _id_CA39();
    _id_B03D( var_0 );
    level.player maps\_utility::enableplayerweapons( 0 );
}

_id_B03D( var_0 )
{
    level._id_C02C = getweaponmodel( var_0 );
}

_id_CA39()
{
    var_0 = undefined;

    if ( weaponclass( self getcurrentweapon() ) == "pistol" )
    {
        var_1 = self getweaponslistprimaries();

        foreach ( var_3 in var_1 )
        {
            if ( weaponclass( var_3 ) == "pistol" )
                continue;

            var_0 = var_3;
        }
    }
    else
        var_0 = self getcurrentweapon();

    if ( !isdefined( var_0 ) || var_0 == "riotshield" )
        var_0 = "m4_grenadier_airport";

    return var_0;
}

_id_C813()
{
    var_0 = level._id_C0BA;
    var_1 = maps\_utility::spawn_anim_model( "player_ending" );
    var_1 hide();
    var_0 maps\_anim::anim_first_frame_solo( var_1, "end_player_shot", "origin_animate_jnt" );
    var_2 = var_1 gettagorigin( "tag_player" );
    var_1 delete();
    return var_2;
}

_id_C4B4( var_0 )
{
    if ( !_id_D16C() )
        return 0;

    return distance( var_0, level.player.origin ) < 45;
}

_id_C125()
{
    common_scripts\utility::flag_assert( "end_makarov_in_place" );
    level endon( "end_makarov_in_place" );
    var_0 = 0.5;
    var_1 = _id_C813();
    var_2 = 0.05;

    for (;;)
    {
        if ( _id_C4B4( var_1 ) )
            break;

        wait 0.05;
    }

    common_scripts\utility::flag_set( "player_ready_for_proper_ending" );
    common_scripts\utility::flag_clear( "player_dynamic_move_speed" );
    thread _id_B915();
}

_id_B915()
{
    _id_CF9B( 0, 0.5 );
}

_id_A978()
{
    var_0 = _id_C813();

    while ( distance( var_0, level.player.origin ) > 350 )
        wait 0.05;
}

_id_B41A()
{
    common_scripts\utility::flag_set( "escape_player_realdeath" );
    level.player takeweapon( "flash_grenade" );
    level.player takeweapon( "fraggrenade" );
    var_0 = level.player getcurrentweapon();

    switch ( weaponclass( var_0 ) )
    {
        case "none":
        case "item":
            var_0 = "ump45";
            var_1 = level.player getweaponslistall();

            foreach ( var_3 in var_1 )
            {
                var_4 = weaponclass( var_3 );

                if ( var_4 != "none" && var_4 != "item" )
                {
                    var_0 = var_3;
                    break;
                }
            }

            break;
    }

    level.player takeallweapons();
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "hud_showStance", 0 );
    level.player freezecontrols( 1 );
    var_6 = level._id_C0BA;
    var_7 = maps\_utility::spawn_anim_model( "player_ending" );
    var_8 = spawn( "script_model", var_7.origin );
    var_8.animname = "player_weapon";
    var_8 maps\_utility::assign_animtree();
    var_9 = spawn( "weapon_" + var_0, var_7.origin );
    var_8 setmodel( var_9.model );
    var_9 delete();
    var_7 hide();
    var_8 hide();
    level._id_B499 = var_7;
    var_10 = [];
    var_10[var_10.size] = var_7;
    var_10[var_10.size] = var_8;
    var_6 maps\_anim::anim_first_frame( var_10, "end_player_shot" );
    level.player playsound( "scn_airport_end_player_shot" );
    var_11 = 0.5;
    level.player playerlinktoblend( var_7, "tag_player", var_11, var_11 * 0.5, var_11 * 0.5 );
    common_scripts\utility::array_thread( var_10, common_scripts\utility::delaycall, 0.5, ::show );
    var_7 notsolid();
    common_scripts\utility::flag_wait( "end_makarov_in_place" );
    var_6 thread maps\_anim::anim_single( var_10, "end_player_shot" );
    var_7 thread _id_BF4A();
}

_id_CF4B()
{
    self waittillmatch( "single anim", "dialog" );
    self waittillmatch( "single anim", "dialog" );
}

_id_C100()
{
    self animmode( "zonly_physics" );
    self clearanim( %root, 0.2 );
    self setflaggedanimrestart( "shoot_anim", %h2_airport_ending_shoot_makarov, 1, 0, 1 );
    thread maps\_anim::start_notetrack_wait( self, "shoot_anim", "end_alt", "makarov" );
    animscripts\shared::donotetracks( "shoot_anim" );
    self clearanim( %airport_ending_makarov, 0.2 );
    self notify( "done_shoot_player" );
}

_id_B9ED()
{
    level endon( "player_enter_ambulance" );
    var_0 = _id_C813();
    var_1 = level._id_C0BA;
    level._id_D41B stopanimscripted();
    level._id_AA36 stopanimscripted();
    level._id_AA36 maps\_utility::add_wait( maps\_utility::_waittillmatch, "single anim", "end" );
    var_1 maps\_utility::add_func( maps\_anim::anim_loop_solo, level._id_AA36, "end_get_in_idle", "Player_is_close_enough" );
    thread maps\_utility::do_wait();
    var_1 thread maps\_anim::anim_single_solo( level._id_AA36, "end_get_in_idle_in" );
    var_1 maps\_anim::anim_single_solo( level._id_D41B, "end_get_in_idle_in" );
    var_1 thread maps\_anim::anim_loop_solo( level._id_D41B, "end_get_in_idle", "Player_is_close_enough" );
    childthread _id_C732();

    for (;;)
    {
        if ( _id_C4B4( var_0 ) && !common_scripts\utility::flag( "player_is_busted" ) )
        {
            var_1 notify( "Player_is_close_enough" );
            var_1 thread maps\_anim::anim_single_solo( level._id_D41B, "end_player_shot" );
            var_1 thread maps\_anim::anim_single_solo( level._id_AA36, "end_player_shot" );
            common_scripts\utility::flag_set( "end_makarov_in_place" );
            thread _id_B41A();
            level notify( "player_enter_ambulance" );
            break;
        }
        else if ( distance( var_0, level.player.origin ) > 700 )
            _id_BB0D();

        wait 0.05;
    }
}

_id_C6D0()
{
    wait 5.9;
    level._id_D41B _id_B3AB::_id_BEBA( "upperbody", level.player, 250, 179, 179, 89, 89, 1, 0, 0, 180 );
    common_scripts\utility::flag_wait( "end_makarov_in_place" );
    level._id_D41B _id_B3AB::_id_B0AC();
    var_0 = _id_D397::_id_A97A( "airport_makarov_intro" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 4.0, -1, 16.0, 16.0 ) _id_D397::_id_AE01( 2.0 ) _id_D397::_id_CCA7( level._id_D41B, "tag_eye" ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BC26();
    common_scripts\utility::flag_wait( "escape_player_shot" );
    level.player enablehealthshield( 1 );
    level.player dodamage( level.player.health, level.player.origin );
    var_1 = _id_D397::_id_A97A( "airport_makarov_kills_allen" );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_1 _id_D397::_id_BEA0( 6.0 ) _id_D397::_id_C491( 2.0, 150, 1.0, 1.0 );
    var_1 _id_D397::_id_BEA0( 7.5 ) _id_D397::_id_C491( 4.0, 150, 0.5, 0.5 );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( 50, 0.0, 1 );
    var_1 _id_D397::_id_BEA0( 0.05 ) _id_D397::_id_A9EC( 17.5, 1 );
    var_1 _id_D397::_id_BEA0( 1.0 ) _id_D397::_id_B85E( 0.1, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.4 );
    var_1 _id_D397::_id_BEA0( 1.55 ) _id_D397::_id_B85E( 0.1, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.2 );
    var_1 _id_D397::_id_BEA0( 16.05 ) _id_D397::_id_B85E( 0.12, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_1 _id_D397::_id_BEA0( 17.8 ) _id_D397::_id_B85E( 0.04, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 _id_D397::_id_BEA0( 19.75 ) _id_D397::_id_B85E( 0.04, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 20.05 ) _id_D397::_id_B85E( 0.05, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 _id_D397::_id_BC26();
}

_id_C732()
{
    wait 15;
    common_scripts\utility::flag_set( "player_is_busted" );
    _id_BB0D();
}

_id_BB0D()
{
    setdvar( "ui_deadquote", &"AIRPORT_FAIL_BLEW_COVER_WANDER" );
    level notify( "mission failed" );
    maps\_utility::missionfailedwrapper();
}

_id_CE05()
{
    var_0 = level._id_C0BA;
    var_1 = [];
    var_1[var_1.size] = level._id_AA36;
    common_scripts\utility::flag_wait( "end_makarov_in_place" );
    var_2 = level._id_D41B geteye();

    while ( !maps\_utility::player_looking_at( var_2, undefined, undefined, level._id_D41B ) )
        wait 0.1;

    var_0 notify( "stop_loop" );
    var_0 thread maps\_anim::anim_single( var_1, "end_player_shot", "origin_animate_jnt" );
    level._id_D41B stopanimscripted();
    level._id_D41B animcustom( ::_id_C100 );
    common_scripts\utility::flag_wait( "escape_player_shot" );
    level.player takeallweapons();
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "hud_showStance", 0 );
    level.player freezecontrols( 1 );
    var_3 = common_scripts\utility::getstruct( "escape_ending_node", "targetname" );
    var_4 = ( level.player.origin[0], level.player.origin[1], var_3.origin[2] ) + ( 0.0, 0.0, 4.5 );
    var_5 = spawn( "script_origin", var_4 );
    var_5.angles = level.player.angles;
    var_6 = maps\_utility::spawn_anim_model( "player_ending" );
    level._id_B499 = var_6;
    var_6 linkto( var_5 );
    var_6 notsolid();
    var_7 = vectortoangles( level._id_D41B.origin - level.player.origin );
    var_5 rotateto( ( 0, var_7[1], 0 ), 1.5 );
    var_8 = 0.1;
    level.player playerlinktoblend( var_6, "tag_player", var_8, var_8 * 0.5, var_8 * 0.5 );
    var_5 thread maps\_anim::anim_single_solo( var_6, "end_player_shot_alt" );
    var_6 thread _id_BF4A();
    physicsexplosioncylinder( var_5.origin, 96, 2, 3 );
    level._id_D41B waittill( "done_shoot_player" );
}

_id_BF4A()
{
    self waittillmatch( "single anim", "blood_start" );
    level.player setcontents( 0 );
    wait 1;
    var_0 = self gettagorigin( "tag_torso" );
    var_1 = spawn( "script_model", var_0 + ( -15.0, 10.0, -7.5 ) );
    var_1.angles = ( -90.0, 135.0, 0.0 );
    var_1 setmodel( "tag_origin" );
    var_1 hide();
    common_scripts\utility::_id_C203( common_scripts\utility::getfx( "deathfx_bloodpool_airport_escape" ), var_1, "tag_origin", ( 0.0, 20.0, 0.0 ) );
}

_id_D16C()
{
    var_0 = level._id_C0BA;
    var_1 = level.player getplayerangles();
    var_1 = ( 0, var_1[1], 0 );
    var_2 = ( var_0.origin[0], var_0.origin[1], 0 );
    var_3 = ( level.player.origin[0], level.player.origin[1], 0 );
    var_4 = anglestoforward( var_1 );
    var_5 = vectornormalize( var_2 - var_3 );
    var_6 = vectordot( var_4, var_5 ) > 0.75;
    return var_6;
}

_id_CECA()
{
    self endon( "death" );
    self.favoriteenemy = level.player;
    self.dontevershoot = 1;
    var_0 = getnode( self.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
}

_id_C225()
{
    self.animname = "generic";
    common_scripts\utility::flag_wait( "start_ending_sequence" );
    var_0 = spawn( "script_origin", level._id_C0BA.origin );
    var_0.angles = level._id_C0BA.angles;
    var_0 maps\_anim::anim_first_frame_solo( self, self.animation );
    common_scripts\utility::flag_wait( "cops_arrive" );
    var_0 maps\_anim::anim_single_solo( self, self.animation );
    var_0 delete();
}

_id_B15C()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    self waittill( "goal" );
    self delete();
}

player_init()
{
    _id_CF9B( 15 );
    level.player _meth_830F( 0 );
    level.player allowjump( 0 );
    var_0 = level.player getplayerangles();
    level.player setplayerangles( ( var_0[0] + 7.25, var_0[1], var_0[2] ) );
    level.player._id_BC6E = 1.0;
    thread _id_CB22();
    common_scripts\utility::flag_set( "player_DMS_disable_auto_sprint" );
}

_id_BF1D()
{
    thread maps\_utility::magic_bullet_shield();
    thread maps\_utility::make_hero();
    maps\_utility::ent_flag_init( "massacre_ready" );
    maps\_utility::ent_flag_init( "massacre_firing_into_crowd" );
    maps\_utility::ent_flag_init( "massacre_at_node" );
    maps\_utility::ent_flag_init( "massacre_throw_nade" );
    maps\_utility::ent_flag_init( "gate_ready_to_go" );
    maps\_utility::ent_flag_init( "prestairs_nodes" );
    maps\_utility::ent_flag_init( "aiming_at_civ" );
    maps\_utility::ent_flag_init( "stairs_at_top" );
    self.ignorerandombulletdamage = 1;
    self.ignoreall = 1;
    self pushplayer( 1 );
    maps\_utility::pathrandompercent_zero();
    maps\_utility::walkdist_zero();
    var_0 = spawn( "script_origin", self.origin );
    var_0.angles = self.angles;
    self._id_C97A = var_0;
    self._id_AC52 = 0;

    if ( !isdefined( level.team ) )
        level.team = [];

    level.team[self.script_noteworthy] = self;
    self.animname = self.script_noteworthy;
    self.targetname = self.script_noteworthy;

    if ( self.script_noteworthy == "makarov" )
        level._id_D41B = self;

    self waittill( "death" );
    level.team = maps\_utility::array_removedead_keepkeys( level.team );
}

_id_BEDD()
{
    var_0 = _id_C103();
    common_scripts\utility::array_thread( var_0, ::_id_BF9D );
    level._id_B6AA = var_0;
}

_id_C103()
{
    var_0 = getentarray( "sign_departure_status", "targetname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = 1;
        var_5 = var_3.origin;

        foreach ( var_7 in var_1 )
        {
            if ( var_7.origin != var_5 )
                continue;

            var_4 = 0;
            var_7._id_C59E[var_3.script_noteworthy] = var_3;
            break;
        }

        if ( !var_4 )
            continue;

        var_9 = spawnstruct();
        var_9.origin = var_5;
        var_9._id_C59E = [];
        var_9._id_C59E[var_3.script_noteworthy] = var_3;
        var_1[var_1.size] = var_9;
    }

    return var_1;
}

_id_BF9D()
{
    self.status["angles"] = [];
    self.status["angles"]["bottom"] = self._id_C59E["ontime"].angles;
    self.status["angles"]["top"] = self._id_C59E["boarding"].angles;
    self.status["angles"]["waiting"] = self._id_C59E["delayed"].angles;
    self.status["order"] = [];
    self.status["order"]["ontime"] = "arriving";
    self.status["order"]["arriving"] = "boarding";
    self.status["order"]["boarding"] = "delayed";
    self.status["order"]["delayed"] = "ontime";
    self.status["ontime"] = [];
    self.status["ontime"]["bottom"] = "ontime";
    self.status["ontime"]["top"] = "arriving";
    self.status["arriving"] = [];
    self.status["arriving"]["bottom"] = "arriving";
    self.status["arriving"]["top"] = "boarding";
    self.status["boarding"] = [];
    self.status["boarding"]["bottom"] = "boarding";
    self.status["boarding"]["top"] = "delayed";
    self.status["delayed"] = [];
    self.status["delayed"]["bottom"] = "delayed";
    self.status["delayed"]["top"] = "ontime";
    self._id_B748 = "ontime";
    self._id_C59E["arriving"].angles = self.status["angles"]["top"];
    self._id_C59E["boarding"].angles = self.status["angles"]["waiting"];
    self._id_C59E["boarding"] hide();
    self._id_C59E["delayed"] hide();
}

_id_AA4B( var_0 )
{
    for ( var_1 = 0.2; self._id_B748 != var_0; self._id_B748 = var_2 )
    {
        var_2 = self.status["order"][self._id_B748];
        var_3 = self.status[self._id_B748]["top"];
        var_4 = self.status[self._id_B748]["bottom"];
        var_5 = self.status[var_2]["top"];
        var_6 = self._id_C59E[var_3];
        var_7 = self._id_C59E[var_4];
        var_8 = self._id_C59E[var_5];
        var_6 rotatepitch( 180, var_1 );
        var_8.angles = self.status["angles"]["top"];
        wait 0.05;
        var_8 show();
        wait(var_1 - 0.1);
        var_7 hide();
        var_7.angles = self.status["angles"]["waiting"];
        wait 0.05;
    }
}

_id_CFE6()
{
    var_0 = self.target;
    var_1 = getglass( var_0 );

    if ( isdefined( var_1 ) )
    {
        level waittillmatch( "glass_destroyed", var_1 );
        self delete();
    }
}

_id_B177()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( getdvarint( "cg_blood" ) == 0 )
            continue;

        if ( !isplayer( var_1 ) )
            continue;

        self.iskilledbyplayer = isplayer( var_1 );
        playfx( common_scripts\utility::getfx( "killshot" ), var_3 );
    }
}

_id_BCC2()
{
    self endon( "death" );
    var_0 = "empty";

    while ( var_0 != "end" )
    {
        self waittill( "single anim", var_0 );

        if ( getdvarint( "cg_blood" ) == 0 )
            continue;

        switch ( var_0 )
        {
            case "bodyshot":
                _id_C9AB( "bodyshot" );
                continue;
            case "killshot":
                _id_C9AB( "killshot" );
                continue;
            case "headshot":
                var_1 = self gettagorigin( "tag_eye" );
                var_2 = common_scripts\utility::random( level.team );
                var_3 = vectornormalize( var_1 - var_2.origin );
                playfx( common_scripts\utility::getfx( "headshot" ), var_1, var_3 );
                continue;
        }
    }
}

_id_C9AB( var_0 )
{
    if ( getdvarint( "cg_blood" ) == 0 )
        return;

    var_1 = self gettagorigin( "J_SpineUpper" );
    var_2 = common_scripts\utility::random( level.team );
    var_3 = vectornormalize( var_2.origin - var_1 );
    var_3 *= 10;
    playfx( common_scripts\utility::getfx( var_0 ), var_1 + var_3 );
}

_id_B1A7( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_0.origin );
    var_3 playsound( var_1 );

    while ( isdefined( var_0.target ) )
    {
        var_4 = common_scripts\utility::getstruct( var_0.target, "targetname" );
        var_5 = distance( var_0.origin, var_4.origin );
        var_6 = var_5 / var_2;
        var_3 moveto( var_4.origin, var_6 );
        wait(var_6);
        var_0 = var_4;
    }

    wait 4;
    var_3 delete();
}

_id_C468( var_0, var_1, var_2, var_3 )
{
    level endon( "stop_explode_targets" );
    var_0 = common_scripts\utility::array_randomize( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = 4;

    if ( !isdefined( var_2 ) )
        var_2 = 0.75;

    if ( !isdefined( var_3 ) )
        var_3 = var_2 + 0.75;

    foreach ( var_5 in var_0 )
    {
        radiusdamage( var_5.origin, var_1, 500, 500 );
        wait(randomfloatrange( var_2, var_3 ));
    }
}

_id_D00E( var_0, var_1, var_2 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    var_3 = "stop_spray_and_pray";
    self endon( var_3 );
    var_4 = _id_C604( var_0, var_1, var_2 );
    thread _id_AEFB( var_4["target"], var_3 );
    self._id_C911 = var_4["target"];
    self setentitytarget( self._id_C911 );
    self._id_A887 = self.no_pistol_switch;
    self.no_pistol_switch = 1;
    _id_B7DE( var_4 );
}

_id_AD69( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    var_6 = "stop_spray_and_pray";
    self endon( var_6 );
    var_7 = _id_D3DB( var_0, var_1, var_2, var_3, var_4, var_5 );
    thread _id_AEFB( var_7["target"], var_6 );
    self._id_C911 = var_7["target"];
    self setentitytarget( self._id_C911 );
    self._id_A887 = self.no_pistol_switch;
    self.no_pistol_switch = 1;
    _id_B601( var_7 );
}

_id_B601( var_0 )
{
    for (;;)
    {
        var_1 = distance( var_0["node_origin"], var_0["target"].origin );
        var_2 = var_1 / var_0["speed"];
        var_0["target"] moveto( var_0["node_origin"], var_2, var_2 * 0.1, var_2 * 0.1 );
        wait(var_2);

        if ( var_0["node_origin"] == var_0["start_origin"] )
        {
            var_0["node_origin"] = var_0["end_origin"];
            continue;
        }

        var_0["node_origin"] = var_0["start_origin"];
    }
}

_id_B7DE( var_0 )
{
    var_1 = var_0["node"];

    for (;;)
    {
        var_1 = common_scripts\utility::getstruct( var_1.target, "targetname" );
        var_2 = distance( var_1.origin, var_0["target"].origin );
        var_3 = var_2 / var_0["speed"];
        var_0["target"] moveto( var_1.origin, var_3, var_3 * 0.1, var_3 * 0.1 );
        wait(var_3);
    }
}

_id_C604( var_0, var_1, var_2 )
{
    var_3 = [];

    if ( !isdefined( var_0 ) )
        var_0 = 0.05;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    wait(var_0);
    var_3["speed"] = 50 * var_1;
    var_3["node"] = var_2;
    var_3["target"] = spawn( "script_origin", var_2.origin );
    return var_3;
}

_id_D3DB( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = [];

    if ( !isdefined( var_0 ) )
        var_0 = 0.05;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 38;

    if ( !isdefined( var_5 ) )
        var_5 = 128;

    wait(var_0);
    var_7 = self gettagorigin( "tag_flash" );
    var_6["speed"] = 50 * var_1;
    var_8 = ( self.origin[0], self.origin[1], var_7[2] );
    var_9 = var_8 + anglestoforward( self.angles ) * var_5 + ( 0, 0, var_3 );
    var_6["start_origin"] = var_8 + anglestoforward( self.angles + ( 0, var_4, 0 ) ) * var_5 + ( 0, 0, var_3 );
    var_6["end_origin"] = var_8 + anglestoforward( self.angles + ( 0, var_4 * -1, 0 ) ) * var_5 + ( 0, 0, var_3 );

    if ( var_2 )
        var_6["node_origin"] = var_6["end_origin"];
    else
        var_6["node_origin"] = var_6["start_origin"];

    var_6["target"] = spawn( "script_origin", var_9 );
    return var_6;
}

_id_AEFB( var_0, var_1 )
{
    self waittill( var_1 );
    self.no_pistol_switch = self._id_A887;
    self clearentitytarget();
    var_0 delete();
}

_id_AE13( var_0 )
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

_id_B47A( var_0 )
{
    common_scripts\utility::flag_wait( "team_initialized" );

    foreach ( var_2 in var_0 )
    {
        if ( !isalive( level.team[var_2.script_noteworthy] ) )
            continue;

        var_3 = level.team[var_2.script_noteworthy];
        var_3 thread _id_AFEF( var_2 );
    }
}

_id_AFEF( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1.angles = self.angles;
    self linkto( var_1 );
    var_1 moveto( var_0.origin, 0.05 );

    if ( isdefined( var_0.angles ) )
        var_1 rotateto( var_0.angles, 0.05 );

    var_1 waittill( "movedone" );
    wait 0.05;
    self setgoalpos( var_0.origin );
    self unlink();
    var_1 delete();
    self orientmode( "face angle", var_0.angles[1] );
}

_id_BC3A()
{
    common_scripts\utility::flag_set( "airport_alternate" );
}

_id_AC5B()
{
    maps\_utility::music_loop( "mus_airport_stalk", 164 );
}

_id_BF76()
{
    common_scripts\utility::flag_set( "airport_anticipation" );
}

_id_B6F2()
{
    common_scripts\utility::flag_set( "airport_escape" );
}

_id_C551()
{
    maps\_utility::music_play( "mus_airport_doublecross" );
}

_id_B8F7( var_0, var_1 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );

    if ( !maps\_utility::ent_flag_exist( "side_step" ) )
        maps\_utility::ent_flag_init( "side_step" );

    maps\_utility::ent_flag_set( "side_step" );
    self._id_B07A = 1;

    while ( self._id_B07A )
    {
        self._id_C97A.origin = self.origin;
        self._id_C97A.angles = var_1;
        self._id_C97A maps\_anim::anim_generic( self, var_0 );
    }

    maps\_utility::ent_flag_clear( "side_step" );
}

_id_B4EF()
{
    self._id_B07A = 0;
    self stopanimscripted();
}

_id_A8AD()
{
    common_scripts\utility::flag_wait( "trigger_kill_player" );
    level.player enabledeathshield( 0 );
    level.player enablehealthshield( 0 );
    level.player kill();
}

_id_C85A()
{
    for (;;)
    {
        common_scripts\utility::flag_wait_any( "friendly_fire_dist_check", "friendly_fire_kill_check", "friendly_fire_warning" );
        level.savehere = 0;
        common_scripts\utility::flag_set( "do_not_save" );

        while ( common_scripts\utility::flag( "do_not_save" ) )
        {
            common_scripts\utility::flag_waitopen( "friendly_fire_dist_check" );
            common_scripts\utility::flag_waitopen( "friendly_fire_kill_check" );
            common_scripts\utility::flag_waitopen( "friendly_fire_warning" );

            if ( common_scripts\utility::flag( "friendly_fire_dist_check" ) || common_scripts\utility::flag( "friendly_fire_kill_check" ) || common_scripts\utility::flag( "friendly_fire_warning" ) )
                continue;

            common_scripts\utility::flag_clear( "do_not_save" );
        }
    }
}

_id_BEB4()
{
    switch ( int( self.script_noteworthy ) )
    {
        case 2:
            wait 2.25;
            break;
        case 3:
            wait 1.75;
            break;
        case 6:
            wait 1.5;
            break;
        case 7:
            wait 1.7;
            break;
        case 5:
            wait 1.6;
            break;
        default:
            wait 1;
            break;
    }

    self physicslaunchclient( self.origin + ( 0.0, 0.0, 32.0 ), anglestoforward( self.angles ) * 1000 );
}

_id_AE00( var_0, var_1 )
{
    var_2 = 0.8 / var_1.size;
    var_3 = 1.6 / var_1.size;

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        if ( distance( self.origin, level.player.origin ) < self.radius )
        {
            var_4 = common_scripts\utility::random( var_1 );

            foreach ( var_6 in var_1 )
            {
                var_7 = anglestoforward( var_4 gettagangles( "tag_flash" ) );
                var_8 = anglestoforward( var_6 gettagangles( "tag_flash" ) );
                var_9 = vectornormalize( level.player.origin - var_4.origin );
                var_10 = vectornormalize( level.player.origin - var_6.origin );

                if ( vectordot( var_7, var_9 ) < vectordot( var_8, var_10 ) )
                    var_4 = var_6;
            }

            magicbullet( var_4.weapon, var_4 gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 12.0 ) );
        }

        wait(randomfloatrange( var_2, var_3 ));
    }
}

_id_ADC9()
{
    if ( isdefined( self._id_C264 ) )
        return;

    self._id_C264 = 1;
    self._id_D056 = self.interval;
    self.interval = 1;
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    self._id_CD3B = self.accuracy;
    self._id_AF77 = self.baseaccuracy;
    self.accuracy = 1000;
    self.baseaccuracy = 1000;
    self.fixednode = 0;
    maps\_utility::setflashbangimmunity( 1 );
    _id_BB70::_id_ADD2();
}

_id_CA4A()
{
    if ( !isdefined( self._id_C264 ) )
        return;

    self._id_C264 = undefined;
    self.accuracy = self._id_CD3B;
    self.baseaccuracy = self._id_AF77;
    self.interval = self._id_D056;
    _id_BB70::_id_B4C7();
    self.no_pistol_switch = undefined;
}

_id_BB88()
{
    level.player endon( "death" );
    precachestring( &"AIRPORT_FAIL_BLEW_COVER_FIRE" );
    precachestring( &"AIRPORT_FAIL_BLEW_COVER_WANDER" );
    level._id_A9F7 = 0;
    level._id_B163 = [];
    level._id_B163["no_kill_line_num"] = 0;
    level._id_B163["no_kill_line"] = [];
    level._id_B163["no_kill_line"][0] = "airport_mkv_thesesheep";
    level._id_B163["no_kill_line"][1] = "airport_mkv_doubtyou";
    level._id_B163["no_kill_line"][2] = "airport_mkv_openfire";
    level._id_B163["no_kill_line"][3] = "airport_mkv_cowards";
    level._id_B163["no_dist_line_num"] = 0;
    level._id_B163["no_dist_line"] = [];
    level._id_B163["no_dist_line"][0] = "airport_mkv_letsmoveup";
    level._id_B163["no_dist_line"][1] = "airport_mkv_letsgo2";
    level._id_B163["no_dist_line"][2] = "airport_mkv_keepmoving";
    level._id_B163["no_dist_line"][3] = "airport_mkv_cowards";
    level._id_B163["ff_line"] = "airport_mkv_checkfire";
    wait 0.05;
    thread _id_B68D();
    common_scripts\utility::array_thread( level.team, ::_id_C35B );

    if ( maps\_utility::is_default_start() )
    {
        wait 16;
        level.player thread _id_A8BF();
        maps\_utility::add_wait( common_scripts\utility::flag_wait, "lobby_open_fire" );
        level.player maps\_utility::add_func( ::_id_D241 );
        thread maps\_utility::do_wait();
    }
    else
    {
        wait 0.05;
        level.player thread _id_D241();
        level.player thread _id_A8BF();
    }

    common_scripts\utility::flag_wait( "friendly_fire_warning" );

    if ( !isdefined( level._id_D162 ) )
    {
        level._id_D162 = &"AIRPORT_FAIL_BLEW_COVER_FIRE";
        level.custom_friendly_fire_message = &"AIRPORT_FAIL_BLEW_COVER_FIRE";
    }

    thread _id_CAFE();
    level thread maps\_utility::notify_delay( "friendly_fire_watch_player", 0.1 );
    level.player enabledeathshield( 0 );
    level.player enablehealthshield( 0 );
    common_scripts\utility::array_thread( level.team, ::_id_C473 );
    var_0 = 0;

    switch ( level.team.size )
    {
        case 4:
            var_0 = 2;
            break;
        case 3:
            var_0 = 1;
            break;
        case 2:
            var_0 = 2;
            break;
        case 1:
            var_0 = 1;
            break;
    }

    maps\_utility::waittill_dead_or_dying( level.team, var_0, 20 );
    var_1 = level._id_D41B;
    magicbullet( var_1.weapon, var_1 gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 64.0 ) );
    wait 0.2;
    magicbullet( var_1.weapon, var_1 gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 64.0 ) );
    wait 0.2;
    magicbullet( var_1.weapon, var_1 gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 64.0 ) );
    wait 0.2;
    magicbullet( var_1.weapon, var_1 gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 64.0 ) );
    level.player kill();
}

_id_D241()
{
    level endon( "friendly_fire_warning" );
    self endon( "death" );
    level endon( "friendly_fire_stop_checking_for_player_dist" );
    var_0 = "friendly_fire_not_in_range";
    common_scripts\utility::flag_init( var_0 );
    thread _id_CF46( var_0 );

    while ( level._id_B163["no_dist_line_num"] < 4 )
    {
        common_scripts\utility::flag_wait( var_0 );

        while ( level._id_B163["no_dist_line_num"] < 4 )
        {
            common_scripts\utility::flag_waitopen_or_timeout( var_0, 25 );

            if ( common_scripts\utility::flag( var_0 ) )
            {
                var_1 = level._id_B163["no_dist_line_num"];
                level._id_D41B thread maps\_utility::radio_dialogue( level._id_B163["no_dist_line"][var_1] );
                level._id_B163["no_dist_line_num"]++;

                if ( level._id_B163["no_dist_line_num"] == 3 )
                    common_scripts\utility::flag_set( "friendly_fire_dist_check" );

                continue;
            }

            break;
        }

        common_scripts\utility::flag_clear( "friendly_fire_dist_check" );

        if ( level._id_B163["no_dist_line_num"] == 3 )
            level._id_B163["no_dist_line_num"] = 2;
    }

    level._id_D162 = &"AIRPORT_FAIL_BLEW_COVER_WANDER";
    common_scripts\utility::flag_set( "friendly_fire_warning" );
}

_id_CF46( var_0 )
{
    for (;;)
    {
        if ( distance( level._id_ACB4, self.origin ) > 600 )
        {
            if ( !common_scripts\utility::flag( var_0 ) )
                common_scripts\utility::flag_set( var_0 );
        }
        else if ( common_scripts\utility::flag( var_0 ) )
            common_scripts\utility::flag_clear( var_0 );

        wait 0.25;
    }
}

_id_A866()
{
    level endon( "friendly_fire_warning" );
    level endon( "friendly_fire_stop_checking_for_player_fire" );
    self endon( "death" );
    var_0 = "friendly_fire_is_attacking";
    common_scripts\utility::flag_init( var_0 );
    thread _id_D4D8( var_0 );

    while ( level._id_B163["no_kill_line_num"] < 4 )
    {
        common_scripts\utility::flag_wait_or_timeout( var_0, 25 );

        if ( common_scripts\utility::flag( "gate_main" ) )
        {
            common_scripts\utility::flag_wait( "tarmac_open_fire" );
            common_scripts\utility::flag_clear( "gate_main" );
            continue;
        }

        if ( common_scripts\utility::flag( var_0 ) )
        {
            if ( level._id_B163["no_kill_line_num"] == 3 )
                level._id_B163["no_kill_line_num"] = 2;

            common_scripts\utility::flag_clear( var_0 );
            common_scripts\utility::flag_clear( "friendly_fire_kill_check" );
            thread maps\_utility::flag_clear_delayed( "friendly_fire_no_kill_line", 5 );
            continue;
        }

        var_1 = level._id_B163["no_kill_line_num"];
        level._id_D41B thread maps\_utility::radio_dialogue( level._id_B163["no_kill_line"][var_1] );
        level._id_B163["no_kill_line_num"]++;
        common_scripts\utility::flag_set( "friendly_fire_no_kill_line" );

        if ( level._id_B163["no_kill_line_num"] == 3 )
            common_scripts\utility::flag_set( "friendly_fire_kill_check" );
    }

    level._id_D162 = &"AIRPORT_FAIL_BLEW_COVER_WANDER";
    common_scripts\utility::flag_set( "friendly_fire_warning" );
}

_id_D4D8( var_0 )
{
    self endon( "death" );
    level endon( "friendly_fire_warning" );
    notifyoncommand( "attack", "+frag" );
    notifyoncommand( "attack", "+attack" );

    for (;;)
    {
        self waittill( "attack" );
        common_scripts\utility::flag_set( var_0 );
        common_scripts\utility::flag_waitopen( var_0 );
    }
}

_id_A8BF()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0 );
        var_0._id_BD39 = self;
    }
}

_id_CAFE()
{
    level.player waittill( "death" );

    if ( isdefined( level._id_D162 ) )
        setdvar( "ui_deadquote", level._id_D162 );

    maps\_utility::missionfailedwrapper();
}

_id_C18C()
{
    wait 10;
    level._id_A9F7--;
}

_id_AF9E()
{
    if ( isdefined( level.player.participation ) && isdefined( level.friendlyfire ) && isdefined( level.friendlyfire["min_participation"] ) && level.player.participation <= level.friendlyfire["min_participation"] )
        level._id_A9F7 = 2;
    else
        level._id_A9F7++;

    if ( level._id_A9F7 >= 2 )
        common_scripts\utility::flag_set( "friendly_fire_warning" );
    else
        thread _id_C18C();
}

_id_C04F()
{
    level endon( "friendly_fire_watch_player" );
    self endon( "friendly_fire_new_watch_cycle" );

    for (;;)
    {
        self waittill( "ai_event", var_0, var_1 );
        waittillframeend;

        if ( common_scripts\utility::flag( "friendly_fire_pause_flash" ) )
            continue;

        if ( var_0 != "grenade danger" )
            continue;

        if ( !isdefined( var_1._id_BD39 ) )
            continue;

        if ( !isdefined( self.grenade ) )
            continue;

        self._id_CFD5 = var_1._id_BD39;

        if ( !isplayer( self._id_CFD5 ) )
            continue;

        common_scripts\utility::flag_set( "friendly_fire_warning" );
        level._id_D162 = &"AIRPORT_FAIL_BLEW_COVER_FIRE";
        level.custom_friendly_fire_message = &"AIRPORT_FAIL_BLEW_COVER_FIRE";
        break;
    }
}

_id_CFAE()
{
    level endon( "friendly_fire_watch_player" );
    self endon( "friendly_fire_new_watch_cycle" );

    for (;;)
    {
        self waittill( "flashbang", var_0, var_1, var_2, var_3, var_4 );
        waittillframeend;

        if ( common_scripts\utility::flag( "friendly_fire_pause_flash" ) )
            continue;

        self._id_CFD5 = var_3;

        if ( !isplayer( self._id_CFD5 ) )
            continue;

        _id_AF9E();

        if ( common_scripts\utility::flag( "friendly_fire_warning" ) )
        {
            level._id_D162 = &"AIRPORT_FAIL_BLEW_COVER_FIRE";
            level.custom_friendly_fire_message = &"AIRPORT_FAIL_BLEW_COVER_FIRE";
        }

        break;
    }
}

_id_D1A8()
{
    level endon( "friendly_fire_watch_player" );
    self endon( "friendly_fire_new_watch_cycle" );
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
    waittillframeend;
    self._id_CFD5 = var_1;

    if ( isplayer( self._id_CFD5 ) && !common_scripts\utility::flag( "friendly_fire_pause_fire" ) )
    {
        _id_AF9E();

        if ( common_scripts\utility::flag( "friendly_fire_warning" ) )
        {
            level._id_D162 = &"AIRPORT_FAIL_BLEW_COVER_FIRE";
            level.custom_friendly_fire_message = &"AIRPORT_FAIL_BLEW_COVER_FIRE";
        }
    }
}

_id_C35B()
{
    level endon( "friendly_fire_watch_player" );
    self endon( "death" );
    var_0 = 0;
    self addaieventlistener( "grenade danger" );

    for (;;)
    {
        self notify( "friendly_fire_new_watch_cycle" );
        maps\_utility::add_wait( ::_id_D1A8 );
        maps\_utility::add_wait( ::_id_CFAE );
        maps\_utility::add_wait( ::_id_C04F );
        maps\_utility::do_wait_any();

        if ( isplayer( self._id_CFD5 ) && common_scripts\utility::flag( "friendly_fire_warning" ) )
        {
            maps\_utility::radio_dialogue_stop();
            level._id_D41B thread maps\_utility::radio_dialogue( "airport_mkv_youtraitor" );
            break;
        }
        else if ( isplayer( self._id_CFD5 ) && !common_scripts\utility::flag( "friendly_fire_checkfire_line" ) )
        {
            common_scripts\utility::flag_set( "friendly_fire_checkfire_line" );
            thread maps\_utility::flag_clear_delayed( "friendly_fire_checkfire_line", 2.5 );

            if ( !common_scripts\utility::flag( "friendly_fire_pause_fire" ) )
            {
                maps\_utility::radio_dialogue_stop();
                level._id_D41B thread maps\_utility::radio_dialogue( level._id_B163["ff_line"] );
                continue;
            }

            if ( common_scripts\utility::cointoss() )
            {
                level._id_D41B playrumbleonentity();

                if ( common_scripts\utility::cointoss() )
                    level._id_D41B thread maps\_utility::dialogue_queue( "check_fire1" );
                else
                    level._id_D41B thread maps\_utility::dialogue_queue( "check_fire2" );

                continue;
            }

            level.team["m4"] playrumbleonentity();

            if ( common_scripts\utility::cointoss() )
            {
                level.team["m4"] thread maps\_utility::dialogue_queue( "check_fire1" );
                continue;
            }

            level.team["m4"] thread maps\_utility::dialogue_queue( "check_fire2" );
        }
    }

    if ( var_0 < 80 || self.script_noteworthy == "makarov" )
        return;

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self kill();
}

_id_C473()
{
    self endon( "death" );
    wait 0.05;
    maps\_utility::disable_dynamic_run_speed();
    waittillframeend;
    _id_BB70::_id_B4C7();
    maps\_utility::clear_run_anim();
    self.ignoreme = 1;
    self.ignoreall = 0;
    self.dontevershoot = undefined;
    self.team = "axis";
    self.favoriteenemy = level.player;
    self.baseaccuracy = 1000;
    self.accuracy = 1000;
    self.combatmode = "cover";
    self.moveplaybackrate = 1.1;
    self notify( "stop_spray_and_pray" );
    self notify( "stop_loop" );
    self stopanimscripted();
    self pushplayer( 0 );
    self.fixednode = 0;
    self.fixednodewason = 0;
    maps\_utility::setflashbangimmunity( 1 );

    if ( self.script_noteworthy != "makarov" )
    {
        if ( isdefined( self.magic_bullet_shield ) )
            maps\_utility::stop_magic_bullet_shield();

        self.maxhealth = 300;

        if ( self.health > 300 )
            self.health = 300;
    }
    else
    {
        self.a.disablepain = 1;
        self.primaryweapon = "m4_grunt";
        maps\_utility::forceuseweapon( self.primaryweapon, "primary" );
    }

    self.goalradius = 400;

    for (;;)
    {
        self setgoalentity( level.player );
        wait 1;
    }
}

_id_B000()
{
    if ( common_scripts\utility::flag( "friendly_fire_warning" ) )
        return;

    level endon( "friendly_fire_warning" );

    if ( common_scripts\utility::flag( "tarmac_moveout" ) )
        return;

    level endon( "tarmac_moveout" );
    self waittill( "death", var_0 );

    if ( !isplayer( var_0 ) )
        return;

    if ( common_scripts\utility::flag( "friendly_fire_no_kill_line" ) && !common_scripts\utility::flag( "friendly_fire_good_kill_line" ) )
    {
        common_scripts\utility::flag_set( "friendly_fire_good_kill_line" );
        thread maps\_utility::flag_clear_delayed( "friendly_fire_good_kill_line", 20 );

        if ( !common_scripts\utility::flag( "friendly_fire_good_kill_line2" ) )
        {
            common_scripts\utility::flag_set( "friendly_fire_good_kill_line2" );
            thread maps\_utility::flag_clear_delayed( "friendly_fire_good_kill_line2", 20 );
        }

        level._id_D41B maps\_utility::radio_dialogue( "airport_mkv_welldone" );
    }
    else if ( !common_scripts\utility::flag( "friendly_fire_good_kill_line2" ) && common_scripts\utility::flag( "stairs_upperdeck_civs_dead" ) )
    {
        common_scripts\utility::flag_set( "friendly_fire_good_kill_line2" );
        level._id_D41B maps\_utility::radio_dialogue( "airport_mkv_nice" );
    }
}

_id_B68D()
{
    while ( !common_scripts\utility::flag( "escape_player_get_in" ) )
    {
        var_0 = ( 0.0, 0.0, 0.0 );
        var_1 = 0;

        foreach ( var_3 in level.team )
        {
            if ( !isalive( var_3 ) )
                continue;

            var_1++;
            var_0 += var_3.origin;
        }

        level._id_ACB4 = var_0 * 1.0 / var_1;
        wait 0.1;
    }
}

_id_B4F6()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_1 = level.player.angles;
    var_0.angles = var_1;
    thread _id_C4DB( var_0, var_1 );
    wait 0.5;
    maps\airport_lighting::_id_CC52( "airport_start" );
    level.player playerlinkto( var_0, undefined, 1, 0, 0, 0, 0, 0 );
    wait 26.2;
    var_0.angles = ( 0.0, 0.0, 0.0 );
    level.player unlink();
    level.player setplayerangles( var_1 );
}

_id_C4DB( var_0, var_1 )
{
    var_2 = 26.5;
    var_3 = 1.5;
    var_4 = newhudelem();
    var_4.x = 0;
    var_4.y = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.foreground = 1;
    var_4 setshader( "black", 640, 480 );

    if ( getdvar( "alt_intro" ) == "" )
        setdvar( "alt_intro", "" );

    if ( !isdefined( getdvar( "alt_intro" ) ) )
        setdvar( "alt_intro", "" );

    if ( getdvar( "alt_intro" ) != "" )
    {
        maps\_utility::delaythread( 4.25, ::_id_CC45, var_4, var_0, var_1 );
        maps\_utility::delaythread( 8.25, ::_id_AD4C, var_4, var_0, var_1 );
        maps\_utility::delaythread( 13.75, ::_id_AFE6, var_4, var_0, var_1 );
        maps\_utility::delaythread( 14.65, ::_id_A825, var_4, var_0, var_1 );
        maps\_utility::delaythread( 19.75, ::_id_C650, var_4, var_0, var_1 );
    }

    wait(var_2);
    var_4 fadeovertime( var_3 );
    var_4.alpha = 0;
}

_id_CC45( var_0, var_1, var_2 )
{
    var_1.angles = var_2 + ( 10.0, 20.0, 0.0 );
    var_1 rotateyaw( 7, 2 );
    var_3 = 0.25;
    var_0 fadeovertime( var_3 );
    var_0.alpha = 0.75;
    wait 0.5;
    var_0 fadeovertime( var_3 );
    var_0.alpha = 1;
}

_id_AD4C( var_0, var_1, var_2 )
{
    var_1.angles = var_2 + ( 10.0, -7.0, 0.0 );
    var_1 rotateyaw( -7, 2 );
    var_3 = 0.25;
    var_0 fadeovertime( var_3 );
    var_0.alpha = 0.85;
    wait 0.35;
    var_0 fadeovertime( var_3 );
    var_0.alpha = 1;
}

_id_AFE6( var_0, var_1, var_2 )
{
    var_1.angles = var_2 + ( 15.0, -27.0, 0.0 );
    var_1 rotateyaw( 6, 2 );
    var_3 = 0.05;
    var_0 fadeovertime( var_3 );
    var_0.alpha = 0.75;
    wait 0.2;
    var_0 fadeovertime( var_3 );
    var_0.alpha = 1;
}

_id_A825( var_0, var_1, var_2 )
{
    var_1.angles = var_2 + ( 7.0, 23.0, 0.0 );
    var_1 rotateyaw( -5, 2 );
    var_3 = 0.05;
    var_0 fadeovertime( var_3 );
    var_0.alpha = 0.75;
    wait 0.2;
    var_0 fadeovertime( var_3 );
    var_0.alpha = 1;
}

_id_C650( var_0, var_1, var_2 )
{
    setsaveddvar( "cg_fovscale", 0.2 );
    var_1.angles = var_2 + ( 0.0, 29.0, 0.0 );
    var_1 rotateyaw( 3, 2 );
    var_3 = 0.25;
    var_0 fadeovertime( var_3 );
    var_0.alpha = 0.9;
    wait 0.65;
    var_0 fadeovertime( var_3 * 2 );
    var_0.alpha = 1;
}

_id_D288( var_0 )
{
    if ( !isdefined( var_0 ) )
        maps\_utility::trigger_wait( "intro_vision_set", "targetname" );

    var_1 = 6;
    maps\_utility::set_vision_set( "airport_intro", var_1 );
    setexpfog( 619.914, 2540.24, 0.357315, 0.371612, 0.314966, 0.75818, var_1, 0.862745, 0.807843, 0.596078, ( -0.834131, 0.375308, -0.404189 ), 18.8429, 49.858, 1.22086 );
}

_id_B78B( var_0 )
{
    if ( !isdefined( var_0 ) )
        common_scripts\utility::flag_wait( "player_set_speed_stairs" );

    var_1 = 2;
    maps\_utility::set_vision_set( "airport_stairs", var_1 );
    setexpfog( 619.914, 2540.24, 0.356863, 0.372549, 0.313726, 0.629246, var_1, 0.862745, 0.807843, 0.596078, ( -0.894864, 0.44208, -0.0615121 ), 0, 20.1783, 1.22086 );
}

_id_B88B( var_0 )
{
    if ( !isdefined( var_0 ) )
        common_scripts\utility::flag_wait( "tarmac_hear_fsb" );

    var_1 = 12;
    setexpfog( 619.914, 3914.89, 0.584314, 0.623529, 0.635294, 0.710723, var_1 );
}

_id_B5A9( var_0 )
{
    if ( !isdefined( var_0 ) )
        common_scripts\utility::flag_wait( "basement_set_vision" );

    var_1 = 5;
    maps\_utility::set_vision_set( "airport", var_1 );
    setexpfog( 619.914, 3914.89, 0.584314, 0.623529, 0.635294, 0.710723, var_1 );
}

_id_A8E8( var_0 )
{
    if ( !isdefined( var_0 ) )
        maps\_utility::trigger_wait( "escape_vision_set", "targetname" );

    var_1 = 3.0;
    maps\_utility::set_vision_set( "airport_intro", var_1 );
    setexpfog( 521.672, 2540.24, 0.441339, 0.532734, 0.533566, 0.629246, var_1, 0.862745, 0.807843, 0.596078, ( -0.700556, -0.712205, -0.0445665 ), 0, 23.7759, 0.644149 );
}

_id_CEA6( var_0 )
{
    if ( !isdefined( var_0 ) )
        common_scripts\utility::flag_wait( "escape_mak_grab_hand" );

    var_1 = 1.0;
    maps\_utility::set_vision_set( "airport_intro", var_1 );
}

_id_AA14()
{
    self endon( "death" );
    _id_BA7E();
    _id_BBF4();
    thread _id_CF4E();
    thread _id_D1BF();

    for (;;)
    {
        self waittill( "took_damage", var_0 );
        self.script_health -= var_0;
        _id_BBF4();
        wait 0.05;
    }
}

_id_BBF4()
{
    var_0 = "idle";

    if ( self.script_health < 0 )
        var_0 = "death";
    else if ( self.script_health < self.max_health * 0.8 )
        var_0 = "burning";
    else if ( self.script_health < self.max_health )
        var_0 = "damaged";

    if ( var_0 == self.state )
        return;

    self.state = var_0;
    thread _id_BE38();
}

_id_CF4E()
{
    self endon( "death" );

    while ( distancesquared( level.player.origin, self.origin ) > squared( 500 ) || self.script_health > self.max_health * 0.5 )
        wait 0.1;

    common_scripts\utility::flag_waitopen( "tarmac_bcs" );
    common_scripts\utility::flag_set( "tarmac_bcs" );
    level._id_D41B maps\_utility::dialogue_queue( "engine_warn" );
    common_scripts\utility::flag_clear( "tarmac_bcs" );
}

_id_BE38()
{
    self notify( self.state );
    self endon( "death" );

    switch ( self.state )
    {
        case "idle":
            _id_D4A2();
            self playloopsound( "dst_jet_engine_close" );
            break;
        case "burning":
            self.idle_org delete();
            _id_BF00();
            _id_BD7F();
            self stopsounds();
            self playloopsound( "dst_jet_engine_burn" );
            thread _id_CC01();
            break;
        case "death":
            _id_ADB1();
            var_0 = 300;
            radiusdamage( self.fx.origin + ( 0.0, 0.0, -40.0 ), var_0, 300, 20, self._id_A803 );
            physicsexplosionsphere( self.fx.origin, var_0, 0, var_0 * 0.01 );
            self stopsounds();
            self playrumbleonentity();
            self playsound( "dst_jet_engine_explosion" );
            self._id_CB6C delete();
            self.new delete();
            self._id_A803 show();
            self._id_A803 solid();
            common_scripts\utility::delaycall( 0.5, ::delete );
            break;
    }
}

_id_D4A2()
{
    self.idle_org = spawn( "script_model", self.fx.origin );
    var_0 = anglestoforward( self.fx.angles );
    var_0 *= 135.5;
    self.idle_org.origin += var_0;
    self.idle_org setmodel( "tag_origin" );
    self.idle_org hide();
    self.idle_org.angles = self.fx.angles;
    playfxontag( common_scripts\utility::getfx( "jet_engine_737" ), self.idle_org, "tag_origin" );
}

_id_BF00()
{
    self._id_CB6C = spawn( "script_model", self.fx.origin );
    var_0 = anglestoforward( self.fx.angles );
    var_0 *= 31;
    self._id_CB6C.origin += var_0;
    self._id_CB6C setmodel( "tag_origin" );
    self._id_CB6C hide();
    self._id_CB6C.angles = self.fx.angles;
    playfxontag( common_scripts\utility::getfx( "jet_fire" ), self._id_CB6C, "tag_origin" );
}

_id_ADB1()
{
    self._id_A947 = spawn( "script_model", self.fx.origin );
    var_0 = anglestoforward( self.fx.angles );
    var_0 *= 31;
    self._id_A947.origin += var_0;
    self._id_A947 setmodel( "tag_origin" );
    self._id_A947 hide();
    self._id_A947.angles = self.fx.angles;
    playfxontag( common_scripts\utility::getfx( "jet_explosion" ), self._id_A947, "tag_origin" );
    self._id_A947 common_scripts\utility::delaycall( 1, ::delete );
}

_id_BD7F()
{
    self._id_CBDF = spawnstruct();
    var_0 = anglestoforward( self.fx.angles );
    var_0 *= -31;
    self._id_CBDF.origin = self.fx.origin + var_0;
    self._id_CBDF.angles = self.fx.angles + ( 0.0, 180.0, 0.0 );
    common_scripts\utility::array_thread( getentarray( "jet_engine_debri", "targetname" ), ::_id_AEA7, self );
}

_id_AEA7( var_0 )
{
    var_0 endon( "death" );
    var_1 = 64;
    var_2 = 386;
    var_3 = 150;
    var_4 = 96;
    var_5 = squared( var_1 );
    var_6 = squared( var_2 );
    var_7 = squared( var_3 );
    var_8 = var_0._id_CBDF.origin - ( 0.0, 0.0, 76.0 );
    var_9 = ( self.origin[0], self.origin[1], var_8[2] );
    var_10 = vectornormalize( self.origin - var_0._id_CBDF.origin );

    if ( vectordot( var_10, anglestoforward( var_0._id_CBDF.angles ) ) < 0.4 )
        return;

    if ( distancesquared( var_0._id_CBDF.origin, self.origin ) < var_5 )
        return;

    if ( distancesquared( var_0._id_CBDF.origin, self.origin ) > var_6 )
        return;

    while ( distancesquared( var_0._id_CBDF.origin, self.origin ) > squared( var_4 ) )
    {
        var_4 += 3;
        wait 0.1;
    }

    var_11 = vectornormalize( var_8 - var_9 );
    var_12 = 1;

    while ( distancesquared( var_0._id_CBDF.origin, self.origin ) > var_7 )
    {
        var_12 *= 1.5;

        if ( var_12 > 40 )
            var_12 = 40;

        var_10 = var_11 * var_12;
        self moveto( self.origin + var_10, 0.1 );
        self rotatevelocity( ( 0.0, 300.0, 0.0 ), 0.1 );
        wait 0.05;
    }

    thread _id_B9CF( var_0 );
}

_id_B9CF( var_0 )
{
    var_1 = 400;
    var_2 = distance( var_0._id_CBDF.origin, self.origin ) / var_1;
    self moveto( var_0._id_CBDF.origin + ( randomfloatrange( -10, 10 ), randomfloatrange( -10, 10 ), randomfloat( 10 ) ), var_2 );
    self rotatevelocity( ( randomintrange( -650, -550 ), randomintrange( 350, 450 ), randomintrange( 50, 150 ) ), var_2 );
    wait(var_2);
    playfx( common_scripts\utility::getfx( "jet_engine_fire_debris" ), self.origin, anglestoforward( var_0._id_CBDF.angles ), anglestoup( var_0._id_CBDF.angles ) );
    self delete();
}

_id_CC01()
{
    self endon( "death" );
    var_0 = int( self.script_health / 60 );

    for (;;)
    {
        self notify( "damage", var_0 );
        badplace_cylinder( "jet_engine_burn" + self.fx.targetname, 1, self.fx.origin + ( 0.0, 0.0, -76.0 ), 190, 150, "allies", "axis", "neutral" );
        wait 1;
    }
}

_id_C50C( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( isdefined( var_5 ) && var_5 == "MOD_CRUSH" )
        {
            wait 0.1;
            continue;
        }

        if ( isdefined( var_2 ) && !isplayer( var_2 ) && distancesquared( level.player.origin, self getorigin() ) < 1500 )
        {
            wait 0.1;
            continue;
        }

        var_0 notify( "took_damage", var_1, var_2, var_3, var_4, var_5 );
    }
}

_id_BA7E()
{
    self.max_health = 1300;
    self.script_health = self.max_health;
    self.state = "new";
    self.new = getent( self.target, "targetname" );
    self.new setcandamage( 1 );
    self._id_A803 = getent( self.new.target, "targetname" );
    self._id_A803.destructible_type = "jet_engine";
    self._id_A803 hide();
    self._id_A803 notsolid();
    self.fx = common_scripts\utility::getstruct( self._id_A803.target, "targetname" );
    thread _id_C50C( self );
    self.new thread _id_C50C( self );
}

_id_AA37()
{
    precachestring( &"AIRPORT_EXPLODING_JET_ENGINE_DEATH" );
    precacheshader( "hud_burningjetengineicon" );
    level.player waittill( "death", var_0, var_1, var_2 );

    if ( var_1 != "MOD_EXPLOSIVE" )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0.destructible_type ) )
        return;

    if ( var_0.destructible_type != "jet_engine" )
        return;

    wait 0.05;
    setdvar( "ui_deadquote", "@AIRPORT_EXPLODING_JET_ENGINE_DEATH" );
}

_id_D1BF()
{
    var_0 = getentarray( "trigger_multiple_fire_react", "classname" );
    var_1 = common_scripts\utility::getclosest( self.origin, var_0, 512 );

    if ( !isdefined( var_1 ) )
        return;

    for (;;)
    {
        if ( isdefined( self ) && isdefined( var_1.trigger_off ) )
            var_1 common_scripts\utility::trigger_on();
        else if ( !isdefined( self ) && !isdefined( var_1.trigger_off ) )
        {
            var_1 common_scripts\utility::trigger_off();
            return;
        }

        wait 0.05;
    }
}

_id_CA14()
{
    var_0 = getentarray( "elevator_housing_glass", "script_noteworthy" );
    var_1 = getentarray( "airport_glass_elevator", "script_noteworthy" );
    var_2 = getentarray( "airport_glass_elevator_door", "script_noteworthy" );
    var_3 = getentarray( "elevator_doors", "script_noteworthy" );
    var_4 = getentarray( "elevator_housing", "targetname" );
    var_5 = getentarray( "elevator_cable", "targetname" );
    var_6 = getentarray( "elevator_wheels", "targetname" );

    foreach ( var_8 in var_0 )
    {
        var_9 = common_scripts\utility::getclosest( var_8 getorigin(), var_4 );
        var_8 linkto( var_9 );
    }

    foreach ( var_8 in var_1 )
    {
        var_9 = common_scripts\utility::getclosest( var_8.origin, var_4 );
        var_8 linkto( var_9 );
    }

    foreach ( var_8 in var_2 )
    {
        var_14 = common_scripts\utility::getclosest( var_8.origin, var_3 );
        var_8 linkto( var_14 );
    }

    wait 0.05;

    foreach ( var_17 in level.elevators )
    {
        var_18 = var_17.e["housing"]["mainframe"][0];
        var_19 = common_scripts\utility::getclosest( var_18 getorigin(), var_5 );
        var_19._id_ADCE = var_18;
        var_19.elevator = var_17;
        var_20 = common_scripts\utility::get_array_of_closest( var_18 getorigin(), var_6, undefined, 2 );
        var_19._id_CFD2 = [];

        foreach ( var_22 in var_20 )
        {
            var_23 = spawn( "script_origin", var_22.origin );
            var_22 linkto( var_23 );
            var_19._id_CFD2[var_22.script_noteworthy] = var_23;
        }
    }

    common_scripts\utility::array_thread( var_5, ::_id_BB33 );
}

_id_BB33()
{
    var_0 = self;

    while ( isdefined( var_0.target ) )
    {
        var_0 = getent( var_0.target, "targetname" );
        var_0 hide();
    }

    var_1 = self.elevator;

    if ( !isdefined( var_1 ) )
        return;

    var_1._id_D2B9 = self;
    var_0 = self;
    var_2 = self._id_ADCE;
    var_0._id_CFD2 = self._id_CFD2;
    level._id_C795 = ( 0.0, 0.0, 200.0 );
    level._id_BB69 = ( 0.0, 0.0, -200.0 );
    level._id_CA48 = 94;
    var_3 = 0;
    var_4 = var_1 common_scripts\_elevator::get_housing_mainframe();
    var_5 = var_1.e["floor" + var_3 + "_pos"] - var_4.origin;
    var_6 = level.elevator_speed;
    var_7 = abs( distance( var_1.e["floor" + var_3 + "_pos"], var_4.origin ) );
    var_8 = var_7 / var_6;

    for (;;)
    {
        var_1 waittill( "elevator_moving" );
        var_1 _id_BF60( var_0, var_2, var_8 );
        var_1 waittill( "elevator_moved" );
        var_1 waittill( "elevator_moving" );
        var_1 _id_D32A( var_0, var_2, var_8 );
        var_1 waittill( "elevator_moved" );
    }
}

_id_BF60( var_0, var_1, var_2 )
{
    var_3 = var_0._id_CFD2;
    var_0 thread _id_C603( var_1, self );
    var_3["top"] rotatevelocity( level._id_C795, var_2, 1, 1 );
    var_3["bottom"] rotatevelocity( level._id_BB69, var_2, 1, 1 );
}

_id_B772( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_0._id_CFD2;
    var_0 thread _id_C603( var_1, self );
    var_5["top"] rotatevelocity( var_3, var_2, var_2 );
    var_5["bottom"] rotatevelocity( var_4, var_2, var_2 );
}

_id_D32A( var_0, var_1, var_2 )
{
    var_3 = var_0._id_CFD2;
    var_1.last_cable thread _id_B272( var_1, self );
    var_3["top"] rotatevelocity( level._id_BB69, var_2, 1, 1 );
    var_3["bottom"] rotatevelocity( level._id_C795, var_2, 1, 1 );
}

_id_C603( var_0, var_1 )
{
    attach_housing( var_0 );
    var_1 endon( "elevator_moved" );

    while ( distancesquared( self.og, self getorigin() ) < squared( level._id_CA48 ) )
        wait 0.05;

    if ( !isdefined( self.target ) )
        return;

    var_2 = getent( self.target, "targetname" );
    var_2 thread _id_C603( var_0, var_1 );
}

attach_housing( var_0 )
{
    self.og = self getorigin();
    self linkto( var_0 );
    var_0.last_cable = self;

    if ( !isdefined( self.target ) )
        return;

    var_1 = getent( self.target, "targetname" );
    var_1 show();
}

_id_B272( var_0, var_1 )
{
    var_1 endon( "elevator_moved" );

    while ( distancesquared( self.og, self getorigin() ) > squared( 2 ) )
        wait 0.05;

    thread detach_housing( var_0 );

    if ( self.targetname == "elevator_cable" )
        return;

    var_2 = getent( self.targetname, "target" );
    var_2 thread _id_B272( var_0, var_1 );
}

detach_housing( var_0 )
{
    if ( self.targetname == "elevator_cable" )
        return;

    self unlink();
    var_1 = 0.5;
    self moveto( self.og, var_1 );
    wait(var_1);
    self hide();
}

_id_B542()
{
    if ( !common_scripts\utility::flag_exist( "bsc_nade" ) )
        common_scripts\utility::flag_init( "bsc_nade" );

    level endon( "escape_main" );

    for (;;)
    {
        self waittill( "grenade danger", var_0 );

        if ( common_scripts\utility::flag( "bsc_nade" ) )
            continue;

        if ( !isdefined( var_0 ) || var_0.model != "projectile_m67fraggrenade" )
            continue;

        if ( distance( var_0.origin, level.player.origin ) < 512 )
        {
            common_scripts\utility::flag_set( "bsc_nade" );
            var_1 = level._id_D41B;

            if ( common_scripts\utility::cointoss() )
                var_1 = level.team["m4"];

            var_1 playrumbleonentity();

            if ( common_scripts\utility::cointoss() )
                var_1 maps\_utility::dialogue_queue( "grenade1" );
            else
                var_1 maps\_utility::dialogue_queue( "grenade2" );

            wait 4;
            common_scripts\utility::flag_clear( "bsc_nade" );
        }
    }
}

_id_C5BE()
{
    var_0 = 0.1;
    var_1 = 5;

    while ( var_1 > 0 )
    {
        if ( _id_C7EA() )
            return;

        var_1 -= var_0;
        wait(var_0);
    }

    maps\_utility::display_hint_timeout( "grenade_launcher", 5 );
}

_id_C7EA( var_0 )
{
    var_1 = maps\_utility::get_player_from_self();
    var_2 = var_1 getcurrentweapon();
    var_3 = getsubstr( var_2, 0, 4 );

    if ( var_3 == "m203" )
        return 1;

    var_4 = var_1 getweaponslistall();

    foreach ( var_2 in var_4 )
    {
        var_6 = var_1 getweaponammoclip( var_2 );

        if ( !issubstr( var_2, "m203" ) )
            continue;

        if ( var_6 > 0 )
            return 0;
    }

    return 1;
}
#using_animtree("vehicles");

_id_D437()
{
    self useanimtree( #animtree );
    self setanim( %h2_airport_ending_open_doors );
}

_id_AE84()
{
    self useanimtree( #animtree );
    self clearanim( %h2_airport_ending_open_doors, 0.2 );
    self setanim( %h2_airport_ending_close_doors );
}

_id_C5C7( var_0, var_1, var_2, var_3 )
{
    level endon( "stop_music" );
    var_4 = spawn( "script_origin", level.player.origin );
    var_4 linkto( level.player );
    var_4 playsound( var_0 + "_sfx" );
    var_4 thread _id_A990();
    wait(var_3);
    maps\_utility::music_loop( var_0, var_1, var_2 );
    wait 0.1;
    var_4 delete();
}

_id_A990()
{
    level waittill( "stop_music" );
    self endon( "death" );
    self playrumbleonentity();
    wait 0.05;
    self delete();
}

_id_AD03()
{
    var_0 = getentarray( "h2_rotating_turbine", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 rotatevelocity( ( 400.0, 0.0, 0.0 ), 500 );

    common_scripts\utility::array_thread( var_0, ::h2_turbine_rotating_destruct );
}

h2_turbine_rotating_destruct()
{
    var_0 = getentarray( "jet_engine", "targetname" );
    var_1 = common_scripts\utility::getclosest( self.origin, var_0, 512 );

    for (;;)
    {
        if ( isdefined( var_1 ) && isdefined( var_1.state ) && var_1.state == "death" )
            break;

        wait 0.05;
    }

    self rotatevelocity( ( 0.0, 0.0, 0.0 ), 1000000 );
}

_id_D07D()
{
    var_0 = getglassarray( "italian_glass_delete" );
    var_1 = getentarray( "italian_destruction_impulse", "targetname" );
    level._id_D41B waittill( "m79_shot2" );
    wait 0.1;

    foreach ( var_3 in var_0 )
        deleteglass( var_3 );

    common_scripts\_exploder::exploder( "destruction_1" );

    foreach ( var_6 in var_1 )
        physicsexplosionsphere( var_6.origin, 150, 50, 1, 0 );
}

_id_D508()
{
    level.player.baseline_speed_scale_max = 0.4;
    common_scripts\utility::flag_set( "yuri_ee_playing" );
    common_scripts\utility::flag_set( "player_DMS_disable_auto_sprint" );
    // self setmodel( "body_airport_com_e" );

    // if ( isdefined( self.headmodel ) )
    //     self detach( self.headmodel );

    // self attach( "head_airport_yuri", "", 1 );
    maps\_utility::forceuseweapon( "colt45", "primary" );
    self.animname = "generic";
    var_0 = spawn( "script_origin", ( 6528.0, 2260.0, 62.75 ) );
    var_0 maps\_anim::anim_single_solo( self, "yuri_elevator_ee" );
    var_0 maps\_anim::anim_last_frame_solo( self, "yuri_elevator_ee" );
    self forceteleport( ( 5687.15, 1892.92, 62.8406 ), ( 0.0, 180.0, 0.0 ) );
    level.player.baseline_speed_scale_max = undefined;
    common_scripts\utility::flag_clear( "yuri_ee_playing" );

    if ( common_scripts\utility::flag( "team_at_top_of_stairs" ) )
        common_scripts\utility::flag_clear( "player_DMS_disable_auto_sprint" );
}

h2_enemies_2ndfloor_explosion()
{
    self waittill( "death", var_0, var_1 );

    if ( !isdefined( self ) || _func_2A5( self ) )
        return;

    self.ragdoll_immediate = 1;
}

h2_solarsystem_rotating()
{
    waitframe();
    var_0 = getent( "h2_solarsystem_rotating", "targetname" );
    var_0 rotatevelocity( ( 0.0, 5.0, 0.0 ), 20000 );
}

elevator_crash_earthquake()
{
    var_0 = getent( "elevator_earthquake", "targetname" );

    if ( level.player istouching( var_0 ) )
    {
        earthquake( 0.1, 2, var_0.origin, 800 );
        level.player playrumblelooponentity( "light_2s" );
    }
}

h2_security_cameras_setup()
{
    var_0 = getentarray( "security_camera_intact", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::h2_security_camera_destroy );
}

h2_security_camera_destroy()
{
    var_0 = self;
    var_1 = getent( var_0.target, "targetname" );
    var_2 = common_scripts\utility::getfx( "electrical_sparks" );
    var_3 = getent( var_1.target, "targetname" );
    var_3 linkto( var_1 );
    var_1 hide();
    var_0 setcandamage( 1 );
    var_0 waittill( "damage" );
    var_0 hide();
    var_1 show();
    var_1.angles -= ( randomfloatrange( 10, 30 ), randomfloatrange( -20, 20 ), randomfloatrange( -5, 5 ) );
    playfx( var_2, var_3.origin );
    wait(randomfloatrange( 1, 3 ));
    var_4 = ( randomintrange( -335, -300 ), var_1.angles[1], var_1.angles[2] );
    var_5 = randomfloatrange( 1.5, 5 );
    var_1 rotateto( var_4, var_5, var_5 );
}

h2_elevator_destruction_swap()
{
    var_0 = getent( "elevator_destroyed", "targetname" );
    var_0 hide();
    common_scripts\utility::flag_wait( "elevator_destroyed" );
    var_0 show();
}

h2_intro_lugage_se()
{
    var_0 = getentarray( "lugage_se", "targetname" );
    var_1 = spawnstruct();
    var_1.origin = ( 5915.0, 1693.0, 64.0 );

    foreach ( var_3 in var_0 )
    {
        var_3.animname = "luggage";
        var_3 maps\_utility::assign_animtree( "luggage" );
        var_1 maps\_anim::anim_first_frame_solo( var_3, var_3.script_noteworthy );
    }

    common_scripts\utility::flag_wait( "conveyor_animate" );

    foreach ( var_3 in var_0 )
        var_1 thread maps\_anim::anim_single_solo( var_3, var_3.script_noteworthy );
}

h2_ambulance_light()
{
    var_0 = getent( "h2_outro_outside_light", "script_noteworthy" );
    var_1 = getent( "h2_outro_inside_light", "script_noteworthy" );
    common_scripts\utility::flag_wait( "end_player_ready" );

    if ( isdefined( var_1 ) )
        var_1 thread h2_light_turupp( 1, 90 );

    if ( isdefined( var_0 ) )
        var_0 thread h2_light_turupp( 25000, 90 );
}

h2_light_turupp( var_0, var_1 )
{
    var_2 = var_0 / var_1;
    var_3 = self getlightintensity();

    while ( var_0 > var_3 )
    {
        var_3 = common_scripts\utility::_id_D0EA( var_3 + var_2, 0, var_0 );
        self setlightintensity( var_3 );
        waitframe();
    }
}

corpse_deletion_monitor()
{
    level endon( "gate_player_off_stairs" );
    setsaveddvar( "ai_corpseCount", 28 );
    thread reset_allowed_corpses();
    thread elevator_weapon_delete();
    var_0 = getent( "delete_corpses_elevator_all", "targetname" );
    var_1 = getent( "delete_corpses_elevator_back", "targetname" );
    common_scripts\utility::flag_clear( "delete_corpses_back_only" );

    for (;;)
    {
        var_2 = getcorpsearray();

        foreach ( var_4 in var_2 )
        {
            if ( common_scripts\utility::flag( "delete_corpses_back_only" ) )
            {
                if ( var_4 istouching( var_1 ) )
                    var_4 delete();

                continue;
            }

            if ( var_4 istouching( var_0 ) )
                var_4 delete();
        }

        var_2 = getcorpsearray();

        if ( var_2.size >= 25 )
        {
            var_6 = common_scripts\utility::getfarthest( level.player.origin, var_2, 10000 );
            var_6 delete();
        }

        waitframe();
    }
}

reset_allowed_corpses()
{
    common_scripts\utility::flag_wait( "basement_player_at_stairs" );
    setsaveddvar( "ai_corpseCount", 16 );
}

_id_B970( var_0 )
{
    level endon( var_0 );

    while ( isdefined( self ) )
    {
        ragdollwakeup( self.origin, 300 );
        waitframe();
    }
}

elevator_weapon_delete()
{
    level endon( "gate_player_off_stairs" );
    common_scripts\utility::flag_wait( "delete_corpses_back_only" );
    var_0 = getent( "delete_weapons_elevator", "targetname" );

    for (;;)
    {
        var_1 = getweaponarray();

        foreach ( var_3 in var_1 )
        {
            if ( var_3 istouching( var_0 ) )
                var_3 delete();
        }

        waitframe();
    }
}
