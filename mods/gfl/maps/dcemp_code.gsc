// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_CDF9()
{
    var_0 = getent( "iss_player_link", "targetname" );
    var_1 = maps\_utility::spawn_anim_model( "iss_satellite", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 linkto( var_0 );

    foreach ( var_3 in level._id_B752["satellite"] )
        var_3 linkto( var_1 );

    return var_1;
}

_id_B63E( var_0 )
{
    for (;;)
    {
        self moveto( var_0.origin, 0.1 );
        self rotateto( var_0.angles, 0.1 );
        wait 0.05;
    }
}

_id_B7A4()
{
    setsaveddvar( "ui_hidemap", 1 );
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player freezecontrols( 1 );
    var_0 = getent( "iss_player_link2", "targetname" );
    var_1 = maps\_utility::spawn_anim_model( "iss_rig", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 linkto( var_0 );
    var_1.node = var_0;

    if ( getdvarint( "attach_space_helmet", 0 ) )
        var_1 attach( "hud_space_helmet_overlay", "tag_camera" );

    level.player playerlinktodelta( var_1, "tag_player", 1, 0, 0, 0, 0 );
    level.player playersetgroundreferenceent( var_1 );
    var_0 maps\_anim::anim_first_frame_solo( var_1, "ISS_animation" );
    return var_1;
}

_id_B3BD()
{
    var_0 = _id_C95A();
    setsaveddvar( "r_spotlightstartradius", "16" );
    setsaveddvar( "r_spotlightEndradius", "500" );
    setsaveddvar( "r_spotlightfovinnerfraction", ".1" );
    setsaveddvar( "r_spotlightexponent", "5" );
    setsaveddvar( "r_spotlightBrightness", "2" );
    var_1 = self.origin + var_0;
    var_2 = spawn( "script_model", var_1 );
    var_2 setmodel( "TAG_ORIGIN" );
    var_2.angles = level.player getplayerangles();
    playfxontag( level._effect["space_helmet_spot_light"], var_2, "TAG_ORIGIN" );

    while ( !common_scripts\utility::flag( "iss_destroy_blast_wave" ) )
    {
        var_0 = _id_C95A();
        var_2.origin = self.origin + var_0;
        var_2.angles = level.player getplayerangles() + self.angles;
        wait 0.05;
    }

    var_2 delete();
}

_id_C95A()
{
    var_0 = anglestoup( self.angles );
    var_1 = anglestoright( self.angles );
    var_2 = anglestoforward( self.angles );
    var_3 = var_0 * 64 + var_1 * 16 + var_2 * -2;
    return var_3;
}

_id_B5CC()
{
    var_0 = _id_CDF9();
    var_1 = ( -348.0, -290.0, -32.0 );
    var_2 = getent( "iss_player_link", "targetname" );
    var_3 = spawn( "script_origin", var_2.origin );
    var_3.angles = var_2.angles;
    var_3.targetname = "iss_player_link2";
    var_3 linkto( var_0 );
    var_4 = _id_B7A4();
    var_5 = [];
    var_5["model"] = var_0;
    var_5["node"] = var_2;
    var_5["camera"] = var_4;
    return var_5;
}

_id_D013()
{
    level._id_B752 = [];
    var_0 = common_scripts\utility::getstructarray( "iss_group_node", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_AD1E );
    common_scripts\utility::flag_set( "iss_organize_ents" );
}

_id_AD1E()
{
    var_0 = getentarray( "iss_entity", "targetname" );
    level._id_B752[self.script_noteworthy] = [];
    var_1 = common_scripts\utility::getstruct( "iss_blast_node", "targetname" );
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        if ( distancesquared( var_4 getorigin(), self.origin ) > squared( self.radius ) )
            continue;

        var_4._id_C619 = distance( var_1.origin, var_4 getorigin() );
        var_5 = level._id_B752[self.script_noteworthy].size;
        level._id_B752[self.script_noteworthy][var_5] = var_4;
        var_2++;

        if ( var_2 == 50 )
        {
            wait 0.05;
            var_2 = 0;
        }
    }

    self notify( "done_organizing" );
}

_id_B275()
{
    level._id_B447 = 0;
    var_0 = level._id_B752["iss"];
    common_scripts\utility::flag_init( "temp" );
}

_id_B05A()
{
    var_0 = level._id_B752["satellite"];
    common_scripts\utility::array_thread( var_0, ::_id_BED1 );
}

_id_D2A8()
{
    var_0 = 0.0012;
    var_1 = var_0 * self._id_C619;
    var_1 -= 3;
    common_scripts\utility::flag_wait_or_timeout( "iss_destroy_blast_wave", var_1 );
    common_scripts\utility::flag_set( "iss_destroy_first_wave" );
    thread maps\_utility::flag_set_delayed( "iss_destroy_blast_wave", 1.5 );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "delete" )
    {
        self delete();
        return;
    }

    if ( common_scripts\utility::flag( "iss_destroy_blast_wave" ) && self.script_type == "small" )
    {
        level._id_B447++;

        if ( level._id_B447 > 1 )
        {
            self delete();
            level._id_B447 = 0;
            return;
        }
    }

    var_2 = [];
    var_2["small"] = 55000;
    var_2["medium"] = 25000;
    var_2["large"] = 16000;
    var_3 = [];
    var_3["small"] = 500;
    var_3["medium"] = 200;
    var_3["large"] = 100;
    var_4 = 1;
    var_5 = 1;

    if ( common_scripts\utility::cointoss() )
        var_4 = -1;

    if ( common_scripts\utility::cointoss() )
        var_5 = -1;

    var_6 = common_scripts\utility::getstruct( "iss_blast_node", "targetname" );
    var_7 = common_scripts\utility::getstruct( var_6.target, "targetname" );
    var_1 = 30;
    var_8 = ( randomfloatrange( 0.75, 1 ) * var_4, 0, randomfloatrange( 0.75, 1 ) * var_5 );
    var_9 = vectornormalize( var_7.origin - var_6.origin );
    var_10 = self getorigin() + var_9 * var_2[self.script_type] * randomfloatrange( 0.8, 1.2 );
    var_11 = var_8 * var_3[self.script_type] * randomfloatrange( 0.8, 1.2 );
    self moveto( var_10, var_1 );
    self rotatevelocity( var_11, var_1 );
}

_id_BED1()
{
    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "delete" )
    {
        self delete();
        return;
    }

    if ( self.script_type == "small" )
    {
        level._id_B447++;

        if ( level._id_B447 > 10 )
        {
            self delete();
            level._id_B447 = 0;
            return;
        }

        wait 0.5;
    }

    self unlink();
    var_0 = [];
    var_0["small"] = 40000;
    var_0["medium"] = 20000;
    var_0["large"] = 15000;
    var_1 = [];
    var_1["small"] = 500;
    var_1["medium"] = 200;
    var_1["large"] = 100;
    var_2 = 1;
    var_3 = 1;

    if ( common_scripts\utility::cointoss() )
        var_2 = -1;

    if ( common_scripts\utility::cointoss() )
        var_3 = -1;

    var_4 = common_scripts\utility::getstruct( "iss_blast_node", "targetname" );
    var_5 = common_scripts\utility::getstruct( var_4.target, "targetname" );
    var_6 = 30;
    var_7 = ( randomfloatrange( 0.75, 1 ) * var_2, 0, randomfloatrange( 0.75, 1 ) * var_3 );
    var_8 = vectornormalize( var_5.origin - var_4.origin );
    var_9 = self getorigin() + var_8 * var_0[self.script_type] * randomfloatrange( 0.8, 1.2 );
    var_10 = var_7 * var_1[self.script_type] * randomfloatrange( 0.8, 1.2 );
    self moveto( var_9, var_6 );
    self rotatevelocity( var_10, var_6 );
}

_id_A972()
{
    var_0 = level._id_B415["camera"];
    var_0.node unlink();
    var_1 = common_scripts\utility::getstruct( "iss_blast_node", "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_3 = 30;
    var_4 = vectornormalize( var_2.origin - var_1.origin );
    var_5 = var_0.origin + var_4 * 25000;
    var_6 = ( 0.0, 0.0, 80.0 );
    var_0.node moveto( var_5, var_3 );
    var_3 = 4;
    var_7 = spawn( "script_model", level.player geteye() + var_4 * -2000 );
    var_7 setmodel( "iss_sail_center" );
    var_7 rotatevelocity( ( 195.0, 0.0, -215.0 ), var_3 );

    while ( var_3 > 0 )
    {
        var_7 moveto( level.player geteye() + var_4 * 256, var_3 );
        var_3 -= 0.05;
        wait 0.05;
    }
}

_id_B1CC()
{
    level endon( "iss_done" );

    for (;;)
    {
        earthquake( 0.35, 0.2, level.player.origin, 1024 );
        wait 0.05;
    }
}

_id_BF11()
{
    var_0 = getent( "earth_model", "targetname" );
    var_1 = spawn( "script_model", var_0.origin + ( 0.0, 0.0, 300.0 ) );
    var_1.angles = var_0.angles;
    var_1.targetname = "iss_lights";
    wait 1;

    for ( var_2 = 1; var_2 <= level._id_C985; var_2++ )
    {
        var_3 = "bg_iss_dark0";

        if ( var_2 > 9 )
            var_3 = "bg_iss_dark";

        var_1 setmodel( var_3 + var_2 );
        wait(randomfloatrange( 0.2, 0.4 ));
    }
}

_id_B3F0()
{
    var_0 = level.player.origin + ( 0.0, 0.0, 1024.0 );

    for ( var_1 = 1; var_1 <= level._id_C985; var_1++ )
    {
        var_2 = "bg_iss_dark0";

        if ( var_1 > 9 )
            var_2 = "bg_iss_dark";

        var_3 = spawn( "script_model", var_0 );
        var_3.targetname = "iss_lights";
        var_3 setmodel( var_2 + var_1 );
    }
}

_id_CD9F()
{
    common_scripts\utility::flag_wait( "crash_cut_to_black" );
    thread maps\_utility::battlechatter_off();
    common_scripts\utility::flag_wait( "emp_entity_cleanup_done" );
    var_0 = getaiarray( "axis" );
    var_0 = maps\_utility::array_removedead_or_dying( var_0 );
    common_scripts\utility::array_thread( var_0, ::_id_BCB1 );
}

_id_BCB1()
{
    self endon( "death" );
    self endon( "long_death" );
    self.allowdeath = 1;
    self.diequietly = 1;
    thread maps\_anim::anim_generic_loop( self, "covercrouch_hide_idle" );
    common_scripts\utility::flag_wait( "emp_back_from_whiteout" );
    var_0 = common_scripts\utility::getstruct( "emp_center", "targetname" );
    var_1 = spawnstruct();
    var_1.origin = self.origin;
    var_2 = var_1.origin - var_0.origin;
    var_1.angles = vectortoangles( var_2 );
    var_3 = [];
    var_3[var_3.size] = "cqb_stand_react_A";
    var_3[var_3.size] = "cqb_stand_react_B";
    var_3[var_3.size] = "cqb_stand_react_C";
    var_3[var_3.size] = "cqb_stand_react_D";
    var_3[var_3.size] = "cqb_stand_react_E";
    self notify( "stop_loop" );
    maps\_utility::anim_stopanimscripted();
    var_1 maps\_anim::anim_generic_gravity( self, common_scripts\utility::random( var_3 ) );
    self setgoalnode( getnode( "intro_enemy_node", "targetname" ) );
    self.goalradius = 100;
    maps\_utility::add_wait( maps\_utility::waittill_msg, "goal" );
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "street_player_hide" );
    maps\_utility::do_wait_any();
    self delete();
}

_id_C5B8()
{
    switch ( self.targetname )
    {
        case "emp_delete":
            _id_D477();

            if ( isdefined( self.script_noteworthy ) )
            {
                switch ( self.script_noteworthy )
                {
                    case "lamp":
                        thread common_scripts\utility::play_sound_in_space( "glass_pane_blowout", self getorigin() );
                        break;
                    case "window":
                        playfx( level._effect["dcemp_glass_74x44"], self getorigin(), anglestoforward( ( 0.0, 270.0, 0.0 ) ) );
                        thread common_scripts\utility::play_sound_in_space( "glass_pane_blowout", self getorigin() );
                        break;
                }
            }

            self delete();
            break;
        case "emp_swap":
            if ( isdefined( self.target ) )
            {
                var_0 = getent( self.target, "targetname" );
                var_0 hide();
                _id_D477();
                var_0 show();
                self delete();
            }
            else
                _id_B2C1();

            break;
        case "emp_light":
            self setlightintensity( self getlightintensity() );

            if ( isdefined( self.script_noteworthy ) )
            {
                var_1 = undefined;

                switch ( self.script_noteworthy )
                {
                    case "emp_light_column":
                        var_1 = "spotlight_column_dcemp";
                        break;
                    case "emp_light_window":
                        _id_D477();
                        break;
                    case "emp_light_window_high":
                        var_1 = "spotlight_window_dcemp";
                        break;
                    case "emp_light_window_low":
                        var_1 = "spotlight_window_dcemp";
                        break;
                    case "emp_light_ground":
                        var_1 = "spotlight_ground_dcemp";
                        break;
                    case "emp_light_door":
                        var_1 = "lighthaze_dcemp";
                        break;
                }

                if ( isdefined( var_1 ) )
                    play_emp_ents_fx( var_1 );
            }

            self setlightintensity( 0 );
            break;
        case "emp_show":
            self hide();
            _id_D477();
            self show();
            thread common_scripts\utility::play_sound_in_space( "glass_pane_blowout", self getorigin() );
            break;
        case "fx_flare":
            play_emp_ents_fx( "lighthaze_dcemp" );
            playfx( level._effect["powerline_runner_oneshot"], self.origin );
    }
}

_id_B2C1()
{
    _id_D477();

    switch ( self.model )
    {
        case "h2_ch_street_light_01_bulb_on":
            self setmodel( "h2_ch_street_light_01_bulb_off" );
            break;
    }
}

_id_D477( var_0 )
{
    common_scripts\utility::flag_wait( "iss_done" );
    wait 2;
    var_1 = common_scripts\utility::getstruct( "emp_center", "targetname" );
    var_2 = 0;
    var_3 = 0.0004;

    if ( !isdefined( var_0 ) )
        var_0 = self.targetname;

    switch ( var_0 )
    {
        case "emp_delete":
            var_2 = distance( self getorigin(), var_1.origin );
            break;
        case "emp_swap":
            var_2 = distance( self.origin, var_1.origin );
            break;
        case "emp_light":
            var_2 = distance( self.origin, var_1.origin );
            break;
        case "emp_show":
            var_2 = distance( self.origin, var_1.origin );
            break;
        case "fx_flare":
            var_2 = distance( self.origin, var_1.origin );
            break;
    }

    var_4 = var_2 * var_3 - 13;

    if ( var_4 < 0 )
        var_4 = 0;

    wait(var_4);
}

play_emp_ents_fx( var_0 )
{
    var_1 = spawnfx( common_scripts\utility::getfx( var_0 ), self.origin );
    triggerfx( var_1, -15 );
    _id_D477();
    var_1 delete();
}

_id_AA7B()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "emp_entity_cleanup_done" );
    var_0 = self vehicle_getspeed();
    self notify( "newpath" );
    self vehicle_setspeedimmediate( 0, 100, 100 );
    var_1 = undefined;

    if ( level.start_point != "emp" )
        var_1 = common_scripts\utility::getstruct( self.currentnode.target, "targetname" );

    common_scripts\utility::flag_wait( "iss_done" );
    self vehicle_setspeedimmediate( var_0, 100, 100 );

    if ( level.start_point != "emp" )
        thread maps\_vehicle::vehicle_paths( var_1 );
}

_id_D38F()
{
    level._id_D38F = self;
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "emp_entity_cleanup_done" );
    maps\_utility::add_func( vehicle_scripts\_attack_heli::heli_spotlight_off );
    thread maps\_utility::do_wait();
    thread _id_AA7B();
    wait 2;
    common_scripts\utility::flag_wait( "iss_done" );
    var_0 = common_scripts\utility::getstruct( "emp_anim_heli_spot", "targetname" );
    var_1 = maps\_utility::spawn_anim_model( "emp_mi28", self.origin );
    var_1 maps\_vehicle::vehicle_lights_on( "running" );
    level._effect["_attack_heli_spotlight"] = loadfx( "vfx/map/dcemp/spotlight_medium_flicker_dcemp" );
    var_1 vehicle_scripts\_attack_heli::heli_spotlight_on( "tag_spotlight", 0 );
    var_1 thread common_scripts\utility::play_loop_sound_on_entity( "scn_dcemp_cobra_shutdown_hover", undefined, undefined, 1 );
    self delete();
    var_0 thread maps\_anim::anim_single_solo( var_1, "crash" );
    var_1 waittillmatch( "single anim", "emp" );
    var_1 common_scripts\utility::stop_loop_sound_on_entity( "scn_dcemp_cobra_shutdown_hover" );
    var_1 maps\_utility::delaythread( 0.1, ::play_cobra_shutdown_sfx, "scn_dcemp_cobra_shutdown" );
    common_scripts\utility::flag_set( "emp_heli_crash_go" );
    var_1 thread _id_AE21();
    var_1 vehicle_scripts\_attack_heli::heli_spotlight_off();
    var_1 thread _id_AECE();
    var_1 maps\_vehicle::vehicle_lights_off( "running" );
    var_1 waittillmatch( "single anim", "explode" );
    var_1 notify( "stop_heli_spark_effects" );
    var_1 playsound( "scn_dcemp_cobra_shutdown_crash" );
    common_scripts\utility::flag_set( "emp_heli_crash" );
    common_scripts\utility::_id_C203( level._effect["helicopter_crash"], var_1, "tag_deathfx", ( 0.0, 0.0, 500.0 ), ( 90.0, 0.0, 0.0 ) );
    var_1 setmodel( "vehicle_mi-28_d_animated" );
    var_2 = 0;
    level.player common_scripts\utility::delaycall( var_2, ::_meth_80B5, "tank_rumble" );
    level.player common_scripts\utility::delaycall( 1.5 + var_2, ::_meth_80B6, "tank_rumble" );
    common_scripts\utility::noself_delaycall( var_2, ::earthquake, 0.25, 1.5, level.player.origin, 5000 );
    var_0 waittill( "crash" );
}

play_cobra_shutdown_sfx( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1 linkto( self );
    var_1 playsound( var_0 );
    self waittillmatch( "single anim", "explode" );
    var_1 playrumbleonentity();
    wait 0.05;
    var_1 delete();
}

_id_AE21()
{
    self endon( "stop_heli_spark_effects" );

    for (;;)
    {
        playfxontag( level._effect["heli_emp_sparks"], self, "tag_origin" );
        wait(randomfloatrange( 0.15, 0.25 ));
    }
}

_id_AECE()
{
    self endon( "death" );
    var_0 = randomintrange( 3, 5 );

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        playfxontag( level._effect["_attack_heli_spotlight_flicker"], self, "tag_flash" );
        wait(randomfloatrange( 0.05, 0.15 ));
        waittillframeend;
        stopfxontag( level._effect["_attack_heli_spotlight_flicker"], self, "tag_flash" );
        wait(randomfloatrange( 0.05, 0.15 ));
        waittillframeend;
    }
}
#using_animtree("vehicles");

_id_A9FE()
{
    if ( !isdefined( level._id_B157 ) )
        level._id_B157 = [];

    level._id_B157[level._id_B157.size] = self;
    thread _id_AA7B();
    common_scripts\utility::flag_wait( "emp_heli_crash_go" );
    wait 0.25;

    if ( isdefined( level._id_A9FE ) )
        wait 0.5;

    level._id_A9FE = 1;
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 setmodel( self.model );
    var_0.animname = "emp_heli_rappel";
    var_0 useanimtree( #animtree );
    self delete();
    var_0 thread _id_AE21();
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = ( 0, var_0.angles[1], 0 );
    var_0 linkto( var_1 );
    var_1 thread maps\_anim::anim_single_solo( var_0, "crash" );
    var_2 = 6.5;
    var_1 movez( -400, var_2, var_2, 0 );
    wait(var_2);
    var_0 notify( "stop_heli_spark_effects" );
    playfx( level._effect["helicopter_explosion"], var_0.origin );
    thread common_scripts\utility::play_sound_in_space( "mi17_helicopter_crash_dist", var_0.origin );
    var_2 = 1;
    level.player common_scripts\utility::delaycall( var_2, ::_meth_80B5, "tank_rumble" );
    level.player common_scripts\utility::delaycall( 1.0 + var_2, ::_meth_80B6, "tank_rumble" );
    common_scripts\utility::noself_delaycall( var_2, ::earthquake, 0.2, 1, level.player.origin, 5000 );
    var_0 delete();
    var_1 delete();
}

_id_D240()
{
    if ( !isdefined( level._id_BC29 ) )
        level._id_BC29 = [];

    level._id_BC29[level._id_BC29.size] = self;
    thread _id_AA7B();
    _id_D477( "emp_swap" );
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 setmodel( self.model );
    var_0.animname = "emp_heli_distant";
    var_0 useanimtree( #animtree );
    self delete();
    var_0 maps\_anim::anim_single_solo( var_0, "crash" );
    var_0 delete();
}

_id_BEF8()
{
    level._id_BE65 = self;
    common_scripts\utility::flag_wait( "emp_heli_crash_go" );
    wait 0.35;
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 setmodel( self.model );
    playfxontag( level._effect["powerline_runner_oneshot"], self, "tag_engine_left" );
    self delete();
    wait 2;
    var_0 notify( "stop_heli_spark_effects" );
}

_id_CBF2()
{
    common_scripts\utility::flag_wait( "iss_done" );
    wait 4;
    wait(level._id_B39B);
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "emp_jet_crasher" );
    wait 0.1;
    var_0 maps\_utility::ent_flag_clear( "engineeffects" );
    wait 5.15;
    common_scripts\utility::flag_set( "emp_jet_crash" );
    level.player _meth_80B5( "tank_rumble" );
    level.player common_scripts\utility::delaycall( 1, ::_meth_80B6, "tank_rumble" );
    earthquake( 0.15, 1, level.player.origin, 2000 );
    common_scripts\_exploder::exploder( "emp_jet_crash" );
    wait 0.25;
    var_0 delete();
}

_id_B109()
{
    var_0 = getent( "emp_heli_crash_last", "targetname" );
    var_0 hide();
    common_scripts\utility::flag_wait( "iss_done" );
    wait(level._id_B39B);
    var_1 = getentarray( "emp_heli_crash_guys", "targetname" );
    var_2 = maps\_utility::array_spawn( var_1, 1 );
    var_2[0] thread _id_C37C( var_0, "WHEEL_FRONT_L_JNT" );
    var_2[1] thread _id_C37C( var_0, "WHEEL_FRONT_R_JNT" );
    wait 0.5;
    var_3 = spawnstruct();
    var_3.origin = var_0.origin;
    var_3.angles = var_0.angles;
    var_0.animname = "emp_heli_last";
    var_0 useanimtree( #animtree );
    var_3 maps\_anim::anim_first_frame_solo( var_0, "crash" );
    wait 3.5;
    var_0 show();
    var_0 common_scripts\utility::delaycall( 3, ::playsound, "scn_dcemp_emp_heli_last_shutdown" );
    var_3 thread maps\_anim::anim_single_solo( var_0, "crash" );
    common_scripts\utility::flag_set( "intro_heli_crashing" );
    var_2[0] maps\_utility::delaythread( 7.5, ::_id_B795 );
    var_2[1] maps\_utility::delaythread( 8.5, ::_id_B795 );
    var_0 thread _id_AE21();
    wait 9.65;
    var_0 notify( "stop_heli_spark_effects" );
    playfx( level._effect["helicopter_explosion"], var_0.origin + ( 0.0, 0.0, -100.0 ) );
    var_0 _meth_8561( "scn_dcemp_emp_heli_last_shutdown" );
    thread common_scripts\utility::play_sound_in_space( "scn_dcemp_emp_heli_last_explo", var_0.origin );
    var_4 = 900;
    var_5 = 600;
    radiusdamage( var_0.origin + ( 0.0, 0.0, 10.0 ), var_4, var_5, 20, var_0 );
    var_6 = 0.25;
    level.player common_scripts\utility::delaycall( var_6, ::_meth_80B5, "tank_rumble" );
    level.player common_scripts\utility::delaycall( 1.0 + var_6, ::_meth_80B6, "tank_rumble" );
    common_scripts\utility::noself_delaycall( var_6, ::earthquake, 0.2, 1, level.player.origin, 5000 );
}

_id_C37C( var_0, var_1 )
{
    self hide();
    self.ignoreme = 1;
    self.ignoreall = 1;
    var_0 maps\_anim::anim_generic_first_frame( self, "fastrope_fall", var_1 );
    wait 0.1;
    self linkto( var_0 );
}
#using_animtree("generic_human");

_id_B795()
{
    self show();
    var_0 = spawn( "script_origin", self.origin );
    var_0.angles = self.angles;
    self linkto( var_0 );
    var_1 = getgroundposition( var_0.origin, 0, 1000, 64 );
    var_2 = getangledelta( maps\_utility::getanim_generic( "fastrope_fall" ), 0, 1 );
    var_3 = var_0.origin + var_2;
    var_4 = abs( var_2[2] );
    var_5 = var_0.origin[2] - var_1[2];
    var_6 = var_3[2] - var_1[2];
    var_7 = getanimlength( maps\_utility::getanim_generic( "fastrope_fall" ) );
    var_8 = var_7 * var_5 / var_4;
    var_8 -= 0.25;
    var_9 = var_7 / var_8;
    self playsound( "generic_death_falling_scream" );
    var_0 thread maps\_anim::anim_generic( self, "fastrope_fall" );
    var_0 movez( var_6 * -1, var_8 );
    var_0 rotatevelocity( ( 0, randomfloatrange( -100, 100 ), 0 ), var_8 );
    wait 0.05;
    self setanimknoball( maps\_utility::getanim_generic( "fastrope_fall" ), %body, 1, 0, var_9 );
    wait(var_8 - 0.2);
    self.skipdeathanim = 1;
    self kill();
    self startragdoll();
    wait 0.1;
    playfx( level._effect["bodyfall_dust_high"], var_1 );
}

_id_B717()
{
    common_scripts\utility::flag_wait( "street_player_hide" );
    common_scripts\utility::flag_set( "street_safe" );
    common_scripts\utility::flag_wait( "squadReadyToLeave" );
    thread handlesquadexitingshelter();
    maps\dcemp_aud::street_crash_heli_building();
    common_scripts\utility::flag_wait( "street_crash_hide" );
    wait 0.25;
    wait 0.1;
    common_scripts\_exploder::exploder( "hide_heli_crash" );
    var_0 = getent( "hide_clip", "targetname" );
    var_0 disconnectpaths();
    var_0 solid();
    var_1 = getent( "street_player_hide_trigger", "targetname" );

    if ( isalive( level.player ) && !level.player istouching( var_1 ) )
        level.player kill();

    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_reset );
    level.player shellshock( "default", 3 );
    soundscripts\_snd::snd_message( "start_building_shellshock_filter" );
    level.player _meth_85A0();
    objective_onentity( level._id_CD9B, level.foley, ( 0.0, 0.0, 70.0 ) );
    level._id_A8A0 delete();
    common_scripts\utility::array_call( getaiarray( "axis" ), ::delete );
    var_2 = getent( "light_entry_lobby", "script_noteworthy" );
    var_2 setlightintensity( 3500 );
    var_3 = getglassarray( "street_hide_glass" );
    var_4 = anglestoforward( ( 0.0, 345.0, 0.0 ) );

    foreach ( var_6 in var_3 )
        destroyglass( var_6, var_4 * 200 );

    wait 4;
    thread _id_C0C3::weapons_specialfeatures_reset();
    common_scripts\utility::flag_set( "allow_ammo_pickups" );
    level.player giveweapon( "Beretta" );
    level.player setweaponammoclip( "Beretta", 30 );
    level.player setweaponammostock( "Beretta", 90 );
    level.player setweaponammostock( "m4m203_eotech", 300 );
    level.player setweaponammostock( "m203_m4_eotech", 9 );
    level.player setweaponammostock( "fraggrenade", 4 );
    level.player setweaponammostock( "flash_grenade", 4 );
    thread _id_C0C3::weapons_specialfeatures();

    if ( isalive( level.player ) )
        thread maps\_utility::autosave_by_name( "street_hide_moment" );

    wait 1;
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "ui_hideAmmoStatus", 0 );
    var_8 = 1.25;
    wait(var_8);
    thread _id_AA88( level.suncolor["moonrise"], 6 );
    wait(6.25 - var_8);
    level._id_ACC0 common_scripts\utility::delaycall( 0.5, ::playrumbleonentity );
    common_scripts\utility::flag_wait( "corner_start_crash_scene" );
    wait 0.4;
    level.foley playrumbleonentity();
    wait 0.5;
    common_scripts\utility::array_thread( level.team, maps\_utility::walkdist_zero );
}

handlesquadexitingshelter()
{
    var_0 = getent( "safeZoneAnimationNode", "targetname" );
    var_0 notify( "FoleyCanGo" );
    waitframe();
    var_0 thread maps\_anim::anim_single_solo( level.foley, "safe_zone_out" );
    level.foley waittillmatch( "single anim", "start_out_anim" );
    var_0 notify( "exit_shelter" );
    waitframe();
    var_1 = [];
    var_1[var_1.size] = level._id_ACC0;
    var_1[var_1.size] = level.team["marine1"];
    var_1[var_1.size] = level.team["marine2"];
    var_1[var_1.size] = level.team["marine3"];
    var_0 maps\_anim::anim_single( var_1, "safe_zone_out" );
}

animatedoor()
{
    var_0 = getent( "safeZoneAnimationNode", "targetname" );
    var_1 = getent( "corner_door", "targetname" );
    var_1.animname = "door2";
    var_1 maps\_anim::setanimtree();
    var_0 maps\_anim::anim_first_frame_solo( var_1, "safe_zone_out" );
    var_0 waittill( "FoleyCanGo" );
    var_0 maps\_anim::anim_single_solo( var_1, "safe_zone_out" );
}

_id_B1E2()
{
    var_0 = 0.001;
    var_1 = 22;
    var_2 = var_1 / var_0;
    var_3 = spawn( "script_model", level.player.origin + ( 0, 0, var_2 + 60 ) );
    var_3 setmodel( "vehicle_little_bird_landed" );
    var_3 rotatevelocity( ( 0.0, 100.0, 0.0 ), var_1 + 1 );
    var_4 = 0.1;
    var_5 = int( var_1 / var_4 );
    var_6 = var_2 / var_5 * -1;
    var_1 = 1;

    while ( !common_scripts\utility::flag( "street_safe" ) && var_5 > 0 )
    {
        if ( !common_scripts\utility::flag( "street_insta_death" ) )
        {
            var_7 = ( var_3.origin[0] + ( level.player.origin[0] - var_3.origin[0] ) * 0.25, var_3.origin[1] + ( level.player.origin[1] - var_3.origin[1] ) * 0.25, var_3.origin[2] + var_6 );
            var_3 moveto( var_7, var_4 );
            wait(var_4);
            var_5--;
            continue;
        }

        var_7 = ( var_3.origin[0] + ( level.player.origin[0] - var_3.origin[0] ) * 0.25, var_3.origin[1] + ( level.player.origin[1] - var_3.origin[1] ) * 0.25, level.player.origin[2] + 50 );
        var_3 moveto( var_7, var_1 );
        wait(var_4);
        var_1 -= var_4;

        if ( var_1 <= 0 )
        {
            var_5 = 0;
            continue;
        }

        var_5--;
    }

    var_8 = level.player.origin + ( 0.0, 0.0, 80.0 );
    var_3 delete();

    if ( common_scripts\utility::flag( "street_safe" ) )
        return;

    var_9 = 300;
    physicsexplosionsphere( var_8, var_9, 0, var_9 * 0.01 );
    playfx( level._effect["helicopter_explosion"], var_8 );
    thread common_scripts\utility::play_sound_in_space( "exp_armor_vehicle", var_8 );
    wait 0.2;
    level.player kill();
}

_id_AB83()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    self playsound( "generic_death_falling_scream" );
    var_0 maps\_anim::anim_generic( self, "fastrope_fall" );
    self.skipdeathanim = 1;
    self kill();
    self startragdoll();
    common_scripts\utility::flag_set( "street_guy_fall" );
}

_id_CE3F()
{
    var_0 = getent( "street_heli", "targetname" );
    var_1 = getent( "street_heli_target", "targetname" );
    var_2 = getent( "street_btr_slide_1", "targetname" );
    var_3 = getent( "street_btr_slide_2", "targetname" );
    var_0 hide();
    var_1 hide();
    var_2 hide();
    var_3 hide();
    var_1 notsolid();
    var_2 notsolid();
    var_3 notsolid();
    var_4 = getent( "btr_dmg_trig", "targetname" );
    var_4 common_scripts\utility::trigger_off();
    var_5 = getent( "street_btr80_d_clip", "targetname" );
    var_5 notsolid();
    var_5 connectpaths();
    maps\_vehicle::mgoff();
    self playrumbleonentity();
    var_6 = _id_AC86();
    level._id_A9A5 = self.origin;

    if ( level.start_point != "corner" )
    {
        common_scripts\utility::flag_wait( "street_crash_btr_first" );
        _id_C3AE();
        common_scripts\utility::flag_set( "street_btr_death" );
        waittillframeend;
        earthquake( 0.5, 1.25, level.player.origin, 2048 );
        level.player _meth_80B5( "tank_rumble" );
        level.player common_scripts\utility::delaycall( 1.25, ::_meth_80B6, "tank_rumble" );
        var_4 common_scripts\utility::trigger_on();
        var_7 = _id_CF78();
        thread _id_BF92( var_7 );
        common_scripts\utility::array_call( getentarray( "street_heli_destroyed", "targetname" ), ::show );
        var_6 thread _id_C321();
        var_7 _id_BB71();
    }
    else
    {
        var_7 = _id_CF78();
        var_7.origin = var_3.origin;
        var_7.angles = var_3.angles;
    }

    var_5 solid();
    var_5 disconnectpaths();
    common_scripts\utility::flag_set( "street_btr_scene_done" );
}

_id_C377()
{
    var_0 = common_scripts\utility::array_combine( getentarray( self.target, "targetname" ), common_scripts\utility::getstructarray( self.target, "targetname" ) );
    var_1 = [];
    var_1["fx"] = [];
    var_1["light"] = [];

    foreach ( var_3 in var_0 )
    {
        switch ( var_3.script_noteworthy )
        {
            case "fire_fx":
                var_1["fx"][var_1["fx"].size] = var_3;
                continue;
            case "light":
                var_3._id_B5AB = var_3 getlightintensity();
                var_3 setlightintensity( 0 );
                var_1["light"][var_1["light"].size] = var_3;
                continue;
            case "start":
                self._id_C0FF = getent( self.target, "targetname" ).origin;
                self._id_D4D7 = getent( self.target, "targetname" ).angles;
                var_3 delete();
                continue;
        }
    }

    if ( level.start_point == "corner" )
    {
        maps\_vehicle::force_kill();

        if ( isdefined( self._id_C0FF ) )
        {
            self.origin = self._id_C0FF;
            self.angles = self._id_D4D7;
        }
    }
    else
    {
        common_scripts\utility::flag_wait( self.script_flag_wait );
        maps\_vehicle::force_kill();
        wait 0.25;
        _id_D1E3( self.origin );

        if ( isdefined( self._id_C0FF ) )
        {
            var_5 = 0.005;
            var_6 = distance( self.origin, self._id_C0FF ) * var_5;
            self moveto( self._id_C0FF, var_6 );
            self rotateto( self._id_D4D7, var_6 );
            wait(var_6);
        }
    }

    foreach ( var_8 in var_1["fx"] )
    {
        playfx( level._effect["me_dumpster_fire_FX"], var_8.origin, anglestoforward( var_8.angles ), anglestoup( var_8.angles ) );
        thread common_scripts\utility::play_loopsound_in_space( "fire_dumpster_medium", var_8.origin );
    }

    foreach ( var_11 in var_1["light"] )
        var_11 setlightintensity( var_11._id_B5AB );

    wait 0.05;
    common_scripts\utility::array_thread( var_1["light"], ::_id_B360 );
}

_id_B77C()
{
    var_0 = common_scripts\utility::array_combine( getentarray( self.target, "targetname" ), common_scripts\utility::getstructarray( self.target, "targetname" ) );
    var_1 = [];
    var_2 = [];
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;

    foreach ( var_7 in var_0 )
    {
        switch ( var_7.script_noteworthy )
        {
            case "end":
                var_4 = var_7.origin;
                var_5 = var_7.angles;
                var_7 delete();
                continue;
            case "destroy":
                var_7 hide();
                var_1[var_1.size] = var_7;
                continue;
            case "fire_fx":
                var_2[var_2.size] = var_7;
                continue;
            case "clip":
                var_3 = var_7;
                var_3 notsolid();
                continue;
        }
    }

    if ( level.start_point != "corner" && level.start_point != "meetup" )
    {
        self hide();

        if ( self.script_flag_wait == "street_crash_heli_first" )
            self.origin += ( 0.0, 0.0, 5500.0 );

        common_scripts\utility::flag_wait( self.script_flag_wait );
        self show();
        var_9 = distance( self.origin, var_4 );
        var_10 = 0.001;
        var_11 = var_9 * var_10;
        var_12 = var_11 - 2;

        if ( var_12 >= 0 )
            maps\_utility::delaythread( var_12, ::play_heli_shutdown_sfx, "scn_dcemp_heli_shutdown" );

        self moveto( var_4, var_11, var_11 );
        self rotateto( var_5, var_11 );

        if ( isdefined( self.script_flag_set ) )
            thread maps\_utility::flag_set_delayed( self.script_flag_set, var_11 - 0.25 );

        self waittill( "movedone" );
        _id_D1E3( self.origin );
        var_13 = 300;
        var_14 = 300;

        if ( !common_scripts\utility::flag( "street_safe" ) )
            radiusdamage( self.origin + ( 0.0, 0.0, 10.0 ), var_13, var_14, 20, self );

        physicsexplosionsphere( self.origin, var_13, 0, var_13 * 0.01 );
        playfx( level._effect["helicopter_explosion"], var_4 + ( 0.0, 0.0, -128.0 ) );
        thread common_scripts\utility::play_sound_in_space( "scn_dcemp_heli_explo", var_4 );
    }

    self delete();

    if ( isdefined( var_3 ) )
    {
        var_3 solid();
        common_scripts\utility::flag_set( "player_and_squad_safe" );
    }

    if ( var_1.size )
        common_scripts\utility::array_call( var_1, ::show );

    foreach ( var_16 in var_2 )
    {
        playfx( level._effect["me_dumpster_fire_FX"], var_16.origin, anglestoforward( var_16.angles ), anglestoup( var_16.angles ) );
        thread common_scripts\utility::play_loopsound_in_space( "scn_dcemp_heli_crashed_fire", var_16.origin );
    }
}

play_heli_shutdown_sfx( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1 linkto( self );
    var_1 playsound( var_0 );
    self waittill( "movedone" );
    var_1 playrumbleonentity();
    wait 0.05;
    var_1 delete();
}
#using_animtree("vehicles");

_id_BD58()
{
    var_0 = [];
    var_1 = [];
    var_2 = undefined;
    var_3 = undefined;

    if ( isdefined( self.target ) )
        var_0 = common_scripts\utility::array_combine( getentarray( self.target, "targetname" ), common_scripts\utility::getstructarray( self.target, "targetname" ) );

    foreach ( var_5 in var_0 )
    {
        switch ( var_5.script_noteworthy )
        {
            case "fire_fx":
                var_1[var_1.size] = var_5;
                continue;
            case "clip":
                var_2 = var_5;
                var_2 notsolid();
                continue;
            case "damage":
                var_3 = var_5;
                var_3 common_scripts\utility::trigger_off();
                continue;
        }
    }

    var_7 = "street_mi28";
    var_8 = undefined;

    switch ( self.script_flag_set )
    {
        case "street_crash_cop":
            var_7 = "street_mi28a";
            var_8 = "scn_dcemp_street_mi28a_shutdown";
            break;
        case "street_crash_left":
            var_7 = "street_bh";
            var_8 = "scn_dcemp_street_bh_shutdown";
            break;
        case "street_crash_left2":
            var_7 = "street_mi28b";
            var_8 = "scn_dcemp_street_mi28b_shutdown";
            break;
    }

    if ( level.start_point != "corner" && level.start_point != "meetup" )
    {
        common_scripts\utility::flag_wait( self.script_flag_wait );

        switch ( self.script_flag_set )
        {
            case "street_crash_left":
                var_9 = getent( "street_cars_blackhawk_bounce", "targetname" );
                var_10 = getent( "street_blackhawk_car_clip", "targetname" );
                var_10 linkto( var_9 );
                var_9.animname = "street_car";
                var_9 useanimtree( #animtree );
                thread maps\_anim::anim_single_solo( var_9, "crash" );
                break;
        }
    }

    var_11 = maps\_utility::spawn_anim_model( var_7, self.origin );

    if ( isdefined( var_8 ) )
        var_11 playloopsound( var_8 );

    thread maps\_anim::anim_single_solo( var_11, "crash" );

    if ( level.start_point != "corner" && level.start_point != "meetup" )
    {
        var_11 waittillmatch( "single anim", "pre_explode" );
        thread common_scripts\utility::flag_set( self.script_flag_set );
        var_11 waittillmatch( "single anim", "explode" );

        if ( isdefined( var_8 ) )
            var_11 stopsounds();

        switch ( self.script_flag_set )
        {
            case "street_crash_cop":
                var_7 = "vehicle_mi-28_d_animated";
                break;
            case "street_crash_left":
                thread _id_CD66();
                var_7 = "vehicle_blackhawk_crash";
                break;
            case "street_crash_left2":
                thread _id_C42C();
                var_7 = "vehicle_mi-28_d_animated";
                break;
        }

        var_3 common_scripts\utility::trigger_on();
        var_11 setmodel( var_7 );
        _id_D1E3( self.origin );
        var_12 = 300;
        var_13 = 300;

        if ( !common_scripts\utility::flag( "street_safe" ) )
            radiusdamage( var_11 gettagorigin( "TAG_DEATHFX" ), var_12, var_13, 20, var_11 );

        physicsexplosionsphere( var_11 gettagorigin( "TAG_DEATHFX" ), var_12, 0, var_12 * 0.01 );

        switch ( self.script_flag_set )
        {
            case "street_crash_left":
                common_scripts\utility::_id_C203( level._effect["helicopter_crash"], var_11, "tag_deathfx", ( 0.0, 0.0, 0.0 ), ( 90.0, 0.0, 0.0 ) );
                break;
            case "street_crash_cop":
            case "street_crash_left2":
                common_scripts\utility::_id_C203( level._effect["helicopter_crash"], var_11, "tag_deathfx", ( 0.0, 0.0, 0.0 ), ( 90.0, 0.0, 0.0 ) );
                break;
        }

        thread common_scripts\utility::play_sound_in_space( "scn_dcemp_heli_explo", var_11 gettagorigin( "TAG_DEATHFX" ) );

        if ( isdefined( var_2 ) )
            var_2 solid();

        var_11 waittillmatch( "single anim", "end" );
    }
    else
    {
        var_11 waittillmatch( "single anim", "explode" );

        if ( isdefined( var_8 ) )
            var_11 stopsounds();

        switch ( self.script_flag_set )
        {
            case "street_crash_cop":
                var_7 = "vehicle_mi-28_d_animated";
                break;
            case "street_crash_left":
                thread _id_CD66();
                var_7 = "vehicle_blackhawk_crash";
                break;
            case "street_crash_left2":
                thread _id_C42C();
                var_7 = "vehicle_mi-28_d_animated";
                break;
        }

        thread common_scripts\utility::play_sound_in_space( "scn_dcemp_heli_explo", var_11 gettagorigin( "TAG_DEATHFX" ) );
        var_11 setmodel( var_7 );
    }

    var_3 delete();

    if ( isdefined( var_2 ) )
        var_2 solid();

    foreach ( var_15 in var_1 )
    {
        playfx( level._effect["me_dumpster_fire_FX"], var_15.origin, anglestoforward( var_15.angles ), anglestoup( var_15.angles ) );
        thread common_scripts\utility::play_loopsound_in_space( "fire_dumpster_medium", var_15.origin );
    }
}

_id_CD66()
{
    var_0 = getentarray( "street_blackhawk_tree", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_B6A4 );
    var_1 = common_scripts\utility::getstructarray( "street_damage_node_2", "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_B394 );
}

_id_C42C()
{
    var_0 = getentarray( "street_heli3_tree", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_B6A4 );
    var_1 = common_scripts\utility::getstructarray( "street_damage_node_3", "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_B394 );
}

_id_B394()
{
    radiusdamage( self.origin, self.radius, 1000, 1000 );
}

_id_B6A4()
{
    var_0 = [];
    var_0[0] = anglestoforward( ( 0, 160 - randomfloatrange( 50, 90 ), 0 ) );
    var_0[1] = anglestoforward( ( 0.0, 160.0, 0.0 ) );
    var_0[2] = anglestoforward( ( 0, 160 + randomfloatrange( 50, 90 ), 0 ) );
    var_1 = 2;
    var_2 = getentarray( self.target, "targetname" );
    self delete();
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        var_6 = getent( var_5.target, "targetname" );
        var_5 linkto( var_6 );
        var_3[var_3.size] = var_6;
    }

    foreach ( var_13, var_5 in var_3 )
    {
        var_9 = var_0[var_13];
        var_10 = randomfloatrange( 100, 150 );
        var_11 = randomfloatrange( 100, 150 );

        if ( common_scripts\utility::cointoss() )
            var_10 *= -1;

        if ( common_scripts\utility::cointoss() )
            var_11 *= -1;

        var_9 += ( 0, 0, randomfloat( 0.5 ) + 0.75 );
        var_9 *= randomfloatrange( 300, 400 );
        var_12 = ( var_10, 0, var_11 );
        var_5 movegravity( var_9, var_1 );
        var_5 rotatevelocity( var_12, var_1, 0, var_1 );
    }

    wait(var_1);
    common_scripts\utility::array_call( var_2, ::delete );
    common_scripts\utility::array_call( var_3, ::delete );
}

_id_C344()
{
    common_scripts\utility::flag_wait( self.script_noteworthy );
    wait(randomfloatrange( 0.2, 0.4 ));
    var_0 = randomfloatrange( 15, 24 );
    var_1 = randomfloatrange( 0.5, 0.75 );
    var_2 = 5;
    var_3 = 10;
    var_4 = ( randomfloatrange( var_2, var_3 ), randomfloatrange( var_2, var_3 ), randomfloatrange( var_2, var_3 ) );
    var_5 = self.angles;
    var_6 = self.origin;
    self movez( var_0, var_1, 0, var_1 * 0.5 );
    self rotateto( self.angles + var_4, var_1, 0, var_1 );
    wait(var_1 * 0.6);
    common_scripts\utility::delaycall( var_1 * 0.5, ::rotateto, var_5, var_1 * 0.5 );
    self moveto( var_6, var_1, var_1, 0 );
    wait(var_1);
    var_1 *= 0.2;
    var_0 *= 0.1;
    var_4 *= 0.1;
    self movez( var_0, var_1, 0, var_1 );
    self rotateto( self.angles + var_4, var_1, 0, var_1 );
    wait(var_1 * 0.85);
    common_scripts\utility::delaycall( var_1 * 0.5, ::rotateto, var_5, var_1 * 0.5 );
    self moveto( var_6, var_1, var_1, 0 );
}

_id_A98E()
{
    var_0 = getent( self.target, "targetname" );
    var_0 delete();
    self.animname = "moto";
    maps\_anim::setanimtree();
    var_1 = getent( "safeZoneAnimationNode", "targetname" );
    var_1 maps\_anim::anim_first_frame_solo( self, "safe_zone_in" );
    playfxontag( level._effect["veh_fire_trail"], self, "tag_death_fx" );
    self playloopsound( "fire_dumpster_medium" );
    playfx( level._effect["small_vehicle_explosion"], self.origin );
    self playsound( "car_explode" );
    common_scripts\utility::flag_wait( "Sandler_can_jump" );
    var_1 maps\_anim::anim_single_solo( self, "safe_zone_in" );
}

_id_AC86()
{
    var_0 = getentarray( "street_heli_destroyed", "targetname" );
    common_scripts\utility::array_call( var_0, ::hide );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_1[var_3.script_noteworthy] = var_3;
        var_3 notsolid();
    }

    var_5 = var_1["back"];
    var_5.parts = var_1;
    return var_5;
}

_id_C3AE()
{
    var_0 = getent( "street_heli", "targetname" );
    var_1 = getent( "street_heli_target", "targetname" );
    var_0 show();
    var_2 = distance( var_0.origin, var_1.origin );
    var_3 = 0.001;
    var_4 = var_2 * var_3;
    var_0 moveto( var_1.origin, var_4, var_4 );
    var_0 rotatevelocity( ( 0.0, 105.0, 0.0 ), var_4 );
    wait(var_4);
    var_0 delete();
    var_1 delete();
}

_id_CF78()
{
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 setmodel( "vehicle_btr80_d" );
    var_0.vehicletype = self.vehicletype;
    var_0.modeldummyon = 0;
    var_0._id_D569 = self.classname;
    var_0 thread maps\_vehicle::kill_fx( "vehicle_btr80_low", 0 );
    self delete();
    var_1 = 300;
    radiusdamage( var_0.origin + ( 0.0, 0.0, 10.0 ), var_1, 300, 20, var_0 );
    physicsexplosionsphere( var_0.origin, var_1, 0, var_1 * 0.01 );
    return var_0;
}

_id_B0F0()
{
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 setmodel( self.model );
    var_0.vehicletype = self.vehicletype;
    var_0.modeldummyon = 0;
    var_0 thread maps\_vehicle::kill_fx( self.model, 0 );
    self delete();
    var_1 = 300;
    radiusdamage( var_0.origin + ( 0.0, 0.0, 10.0 ), var_1, 300, 20, var_0 );
    physicsexplosionsphere( var_0.origin, var_1, 0, var_1 * 0.01 );
    return var_0;
}

_id_BB71()
{
    var_0 = getent( "street_btr_slide_1", "targetname" );
    var_1 = getent( "street_btr_slide_2", "targetname" );
    var_2 = getent( "btr_dmg_trig", "targetname" );
    var_2 thread _id_B88C( self );
    var_3 = 1.5;
    self moveto( var_0.origin, var_3, 0, var_3 );
    self rotateto( var_0.angles, var_3, 0, var_3 );
    self playsound( "scn_dcemp_btr_slide" );
    wait(var_3);
    var_3 = 0.65;
    self moveto( var_1.origin, var_3, var_3, 0 );
    self rotateto( var_1.angles, var_3, var_3, 0 );
    wait(var_3);
    earthquake( 0.2, 0.5, level.player.origin, 2048 );
    var_0 delete();
    var_1 delete();
}

_id_BF92( var_0 )
{
    if ( !maps\_utility::player_looking_at( var_0.origin, undefined, 1 ) )
        return;

    setblur( 4, 0 );
    wait 0.1;
    setblur( 0, 0.5 );
}

_id_B88C( var_0 )
{
    var_1 = var_0.origin;
    var_2 = self.origin;

    while ( !common_scripts\utility::flag( "street_btr_scene_done" ) )
    {
        var_3 = var_0.origin - var_1;
        self.origin = var_2 + ( var_3[0], var_3[1], 0 );
        wait 0.05;
    }

    self delete();
}

_id_C321()
{
    var_0 = common_scripts\utility::getstruct( "street_physics_launch_point", "targetname" );
    var_1 = self.parts;

    foreach ( var_3 in var_1 )
    {
        var_4 = vectornormalize( var_3.origin + ( 0.0, 0.0, 32.0 ) - var_0.origin );
        var_4 *= randomfloatrange( 800, 900 );
        var_3 movegravity( var_4, 5 );
        var_3 rotatevelocity( ( randomfloatrange( 150, 250 ), randomfloatrange( 150, 250 ), randomfloatrange( 150, 250 ) ), 5, 0, 5 );
    }

    wait 5;

    foreach ( var_3 in var_1 )
        var_3 delete();
}

_id_D1E3( var_0 )
{
    if ( common_scripts\utility::flag( "do_player_crash_fx" ) )
        return;

    common_scripts\utility::flag_set( "do_player_crash_fx" );
    thread maps\_utility::flag_clear_delayed( "do_player_crash_fx", 0.25 );
    var_1 = distancesquared( level.player.origin, var_0 );

    if ( var_1 < squared( 1500 ) )
    {
        level.player _meth_80B5( "tank_rumble" );
        level.player common_scripts\utility::delaycall( 1.0, ::_meth_80B6, "tank_rumble" );
        earthquake( 0.5, 1, var_0, 2000 );
        level.player setvelocity( anglestoup( level.player.angles ) * 210 );

        if ( var_1 < squared( 650 ) )
        {
            level.player allowstand( 0 );
            level.player allowprone( 0 );
            level.player setstance( "crouch" );
            level.player maps\_utility::blend_movespeedscale( 0.5 );
            level.player maps\_utility::delaythread( 0.1, maps\_utility::playlocalsoundwrapper, "breathing_hurt" );
            var_2 = 1;
            level.player maps\_utility::delaythread( 0.5, maps\_utility::blend_movespeedscale, 0.8, 1.0 );
            level.player maps\_utility::delaythread( var_2 + 0.25, maps\_utility::playlocalsoundwrapper, "breathing_better" );
            level.player common_scripts\utility::delaycall( var_2, ::allowstand, 1 );
            level.player common_scripts\utility::delaycall( var_2, ::allowprone, 1 );
            level.player common_scripts\utility::delaycall( var_2, ::setstance, "stand" );
        }
    }
}

_id_CF15()
{
    var_0 = _id_C88B();
    common_scripts\utility::array_call( var_0["lights"], ::setlightintensity, 0.0 );
}

_id_BD06()
{
    var_0 = _id_C88B();
    common_scripts\utility::array_call( var_0["lights"], ::setlightintensity, 2.0 );
    wait 0.05;
    common_scripts\utility::array_thread( var_0["lights"], ::_id_B360 );
    common_scripts\_exploder::exploder( "plane_crash_aftermath" );
}

_id_C88B()
{
    var_0 = [];
    var_0["lights"] = getentarray( "light_crash_fire", "script_noteworthy" );
    return var_0;
}

_id_B5C1( var_0, var_1 )
{
    var_2 = getent( "corner_door", "targetname" );
    var_3 = getent( "corner_door_clip", "targetname" );
    var_3 linkto( var_2 );

    if ( isdefined( var_1 ) )
        var_2 playsound( var_1 );
    else
        var_2 playsound( "door_wood_slow_open" );
}

_id_B019()
{
    wait(randomfloat( 2 ));
    var_0 = [];
    var_0[var_0.size] = "vehicle_van_white_door_rb";
    var_0[var_0.size] = "bc_military_tire01";
    var_0[var_0.size] = "vehicle_van_white_hood";
    var_0[var_0.size] = "rubble_large_slab_02";
    var_0[var_0.size] = "727_seats_row_left";

    if ( !isdefined( level._id_C5F7 ) )
        level._id_C5F7 = 0;

    level._id_C5F7++;

    if ( level._id_C5F7 == var_0.size )
        level._id_C5F7 = 0;

    var_1 = var_0[level._id_C5F7];
    var_2 = spawn( "script_model", self.origin );
    var_2 setmodel( var_1 );
    var_3 = anglestoforward( self.angles ) * randomfloatrange( 1300, 1500 );
    var_4 = 1;
    var_5 = 1;
    var_6 = 1;

    if ( common_scripts\utility::cointoss() )
        var_4 = -1;

    if ( common_scripts\utility::cointoss() )
        var_5 = -1;

    if ( common_scripts\utility::cointoss() )
        var_6 = -1;

    var_7 = spawn( "script_model", var_2.origin );
    var_7 setmodel( "tag_origin" );
    var_7 linkto( var_2 );
    playfxontag( level._effect["aircraft_fire_streak"], var_7, "TAG_ORIGIN" );
    var_8 = 1.0;
    var_2 movegravity( var_3, var_8 );
    var_2 rotatevelocity( ( randomfloatrange( 50, 100 ) * var_4, randomfloatrange( 50, 100 ) * var_5, randomfloatrange( 50, 100 ) * var_6 ), var_8 );
    var_9 = common_scripts\utility::getstruct( "corner_anim1", "targetname" );
    wait(var_8 - 0.05);
    var_0 = [];
    var_0[var_0.size] = "wood_door_kick";
    var_0[var_0.size] = "explo_tree";
    var_0[var_0.size] = "door_wood_double_kick";
    var_0[var_0.size] = "door_wood_fence_post_kick";
    var_0[var_0.size] = "door_cargo_container_burst_open";
    var_0[var_0.size] = "bullet_ap_metal";
    thread common_scripts\utility::play_sound_in_space( common_scripts\utility::random( var_0 ), var_7.origin );
    wait 0.05;
    var_7 delete();
    var_2 delete();
}

_id_CC34()
{
    _id_A863();
    common_scripts\utility::flag_wait( "corner_engine_hit" );
    level._id_AA41 linkto( self );
    maps\_utility::delaythread( 0.25, ::_id_CAE9 );
    var_0 = common_scripts\utility::getstruct( "corner_engine_fx_sparks", "targetname" );
    var_1 = spawn( "script_model", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 setmodel( "tag_origin" );
    var_1 linkto( self );
    wait 0.45;
    playfxontag( level._effect["turbine_scrape_ground"], var_1, "tag_origin" );
    wait 2.08;
    stopfxontag( level._effect["turbine_scrape_ground"], var_1, "tag_origin" );
    playfx( level._effect["turbine_fire_linger"], var_1.origin );
    wait 3.0;
    common_scripts\utility::flag_set( "corner_look_outside" );
    var_1 delete();
}

_id_A863()
{
    thread _id_C344();
    var_0 = getentarray( self.target, "targetname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
        var_1[var_3.script_noteworthy] = var_3;

    var_1["clip"] linkto( self );
    var_1["clip"] disconnectpaths();
    self.clip = var_1["clip"];
    self._id_C0FF = var_1["target"].origin;
    self._id_D4D7 = var_1["target"].angles;
    var_1["target"] delete();
}

_id_C2BD()
{
    self hide();
    var_0 = getent( self.target, "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = var_0.origin;
    var_3 = var_0.angles;
    var_4 = var_1.origin;
    var_5 = var_1.angles;
    var_0 delete();
    var_1 delete();
    common_scripts\utility::flag_wait( "corner_engine_crash" );
    self show();
    var_6 = common_scripts\utility::getstruct( "corner_engine_fx_fire", "targetname" );
    self playloopsound( "fire_dumpster_medium" );
    var_7 = 0.001;
    var_8 = distance( self.origin, var_2 ) * var_7;
    self moveto( var_2, var_8 );
    self rotateto( var_3, var_8 );
    wait(var_8);
    self playsound( "scn_dcemp_plane_crash_engine_slide" );
    var_8 = 0.5;
    earthquake( 0.5, var_8, self.origin, 3000 );
    var_9 = spawn( "script_origin", level.player.origin + ( 0.0, 0.0, 200.0 ) );
    var_9 _meth_80B5( "steady_rumble" );
    var_9 common_scripts\utility::delaycall( var_8, ::_meth_80B6, "steady_rumble" );
    var_7 = 0.001;
    var_8 = distance( self.origin, var_4 ) * var_7;
    self moveto( var_4, var_8 );
    self rotateto( var_5, var_8 );
    wait(var_8);
    level._id_AA41 = self;
    self playsound( "exp_armor_vehicle" );
    var_8 = 1.5;
    earthquake( 0.5, var_8 * 0.5, self.origin, 3000 );
    var_9.origin += ( 0.0, 0.0, 50.0 );
    var_9 _meth_80B5( "steady_rumble" );
    var_9 movez( 700, var_8 );
    var_9 common_scripts\utility::delaycall( var_8, ::_meth_80B6, "steady_rumble" );
    var_9 common_scripts\utility::delaycall( var_8 + 0.1, ::delete );
    common_scripts\utility::flag_set( "corner_engine_hit" );
}

h2_corner_plane_crash_sound( var_0 )
{
    var_1 = getent( "corner_crash_plane_link", "targetname" );
    var_1 playsound( "scn_dcemp_jet_crash_offscreen" );
    soundscripts\_snd::snd_message( "start_jet_crash_mix" );
}

h2_corner_plane_crash_rumble( var_0 )
{
    var_1 = getent( "corner_crash_plane_link", "targetname" );
    earthquake( 0.25, 1.5, var_1.origin, 5000 );
    var_2 = spawn( "script_origin", level.player.origin + ( 0.0, 0.0, 500.0 ) );
    var_2 _meth_80B5( "steady_rumble" );
    var_2 movez( 400, 1.5 );
    var_2 common_scripts\utility::delaycall( 2, ::delete );
    common_scripts\utility::noself_delaycall( 1.5, ::stopallrumbles );
}

h2_corner_plane_crash_fx( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "corner_plane_fx_light", "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = var_1.angles;
    var_2 setmodel( "tag_origin" );
    playfxontag( level._effect["planecrash_spotlight"], var_2, "TAG_ORIGIN" );
    common_scripts\_exploder::exploder( "planecrash_light" );
    var_2 common_scripts\utility::delaycall( 3.75, ::delete );
    wait 0.25;
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "corner_plane_launch", "targetname" ), ::_id_B019 );
    wait 1.0;
    common_scripts\_exploder::exploder( "corner_fire_streaks" );
    maps\_utility::delaythread( 0.75, common_scripts\_exploder::exploder, "corner_fire_streaks" );
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "corner_plane_launch", "targetname" ), ::_id_B019 );
}

_id_CAE9()
{
    self.clip connectpaths();
    var_0 = 0.0025;
    var_1 = distance( self.origin, self._id_C0FF ) * var_0;
    self moveto( self._id_C0FF, var_1, 0, var_1 );
    self rotateto( self._id_D4D7, var_1, 0, var_1 );
    wait(var_1 + 0.2);
    self.clip disconnectpaths();
}

_id_B72A()
{
    var_0 = getent( "meepup_dead_guy", "targetname" );
    var_1 = maps\_utility::dronespawn_bodyonly( var_0 );
    // var_1 setmodel( "body_us_army_assault_a_dead_elevator" );
    // var_1 codescripts\character::setheadmodel( "head_us_army_d_dead_elevator" );
    level._id_BEE1 = var_1;
    var_1.animname = "dead_guy";
    wait 0.05;
    var_1 maps\_utility::gun_remove();
    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 thread maps\_anim::anim_loop_solo( var_1, "hunted_woundedhostage_idle_start" );
    common_scripts\utility::flag_wait( "parking_main" );
    var_1 delete();
}

_id_C9E4()
{
    level.foley maps\_utility::delaythread( 0, ::_id_AC33, "meetup_runner_foley" );
    level.team["marine1"] maps\_utility::delaythread( 3, ::_id_AFE5, "meetup_runner_2" );
    level.team["marine3"] maps\_utility::delaythread( 2, ::_id_AC33, "meetup_runner_3" );
    level.team["marine2"] maps\_utility::delaythread( 1.5, ::_id_AFE5, "meetup_runner_1" );
    level._id_ACC0 _id_C50A();
}

_id_C50A()
{
    var_0 = getent( "meetup_scripted_node", "targetname" );
    var_0.origin = self.origin;
    maps\_utility::disable_exits();
    maps\_utility::disable_arrivals();
    self setlookatentity( level._id_B624 );
    self clearentitytarget();
    maps\_utility::set_ignoreall( 1 );
    maps\_utility::disable_dontevershoot();
    maps\_anim::anim_generic_run( self, "exposed_crouch_2_stand" );
    maps\_anim::anim_reach_solo( self, "DCemp_run_sequence_meetup_dunn" );
    self.alertlevel = "noncombat";
    self allowedstances( "stand" );
    common_scripts\utility::flag_wait( "meetup_do_scripted_scene" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "DCemp_run_sequence_guy1" ) );
    var_1 *= 0.62;
    thread common_scripts\utility::delaycall( var_1, ::setlookatentity );
    var_0 maps\_anim::anim_generic_gravity( self, "DCemp_run_sequence_meetup_dunn" );
    self setgoalpos( self.origin );
}

_id_AC33( var_0 )
{
    _id_BF45();
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_2 = spawn( "script_origin", self.origin );
    var_2.angles = self.angles;
    self linkto( var_2 );
    var_3 = 0.75;
    var_2 rotateto( vectortoangles( var_1.origin - var_2.origin ), var_3, var_3 );
    var_2 thread maps\_anim::anim_generic_run( self, "casual_killer_jog_start" );
    var_2 waittill( "rotatedone" );
    self unlink();
    var_2 delete();
    thread _id_BE84();
    maps\_utility::set_generic_run_anim_array( "casual_killer_jog" );
    var_1 maps\_anim::anim_generic_reach( self, "casual_killer_jog_stop" );

    if ( self.script_noteworthy == "foley" )
        self setlookatentity( level._id_B624 );

    var_1 _id_D4EA( self, "casual_killer_jog_stop" );
    self setgoalpos( self.origin );
    maps\_utility::ent_flag_set( "meetup_runner_end" );
}

_id_AFE5( var_0 )
{
    if ( self == level.team["marine2"] )
    {
        var_1 = getent( "meetup_scripted_node", "targetname" );
        var_1 maps\_anim::anim_reach_solo( self, "DCemp_run_sequence_meetup_mccord" );
        var_1 maps\_anim::anim_single_solo( self, "DCemp_run_sequence_meetup_mccord" );
        self setgoalpos( self.origin );
    }
    else
    {
        _id_BF45();
        var_2 = common_scripts\utility::getstruct( var_0, "targetname" );
        var_3 = spawn( "script_origin", self.origin );
        var_3.angles = self.angles;
        self linkto( var_3 );
        var_4 = 0.5;
        var_3 rotateto( vectortoangles( var_2.origin - var_3.origin ) + ( 0.0, 10.0, 0.0 ), var_4, var_4 );
        var_3 thread maps\_anim::anim_generic_run( self, "patrol_bored_2_walk" );
        var_3 waittill( "rotatedone" );
        self unlink();
        var_3 delete();
        thread _id_BE84();
        maps\_utility::set_generic_run_anim_array( "patrol_bored_patrolwalk" );

        if ( distance( var_2.origin, self.origin ) > 48 )
            var_2 maps\_anim::anim_generic_reach( self, "patrol_bored_walk_2_bored" );
        else
            var_2 = self;

        var_2 _id_D4EA( self, "patrol_bored_walk_2_bored" );
        self setgoalpos( self.origin );
        maps\_utility::ent_flag_set( "meetup_runner_end" );
    }
}

_id_BF45()
{
    maps\_utility::disable_exits();
    maps\_utility::disable_arrivals();

    if ( self.script_noteworthy != "foley" )
        self setlookatentity( level._id_B624 );

    switch ( self.script_noteworthy )
    {
        case "foley":
            maps\_anim::anim_generic_run( self, "exposed_crouch_2_stand" );
            break;
        case "marine1":
            maps\_anim::anim_generic_run( self, "coverstand_hide_2_aim" );
            break;
    }

    self.alertlevel = "noncombat";
    maps\_anim::anim_generic_run( self, "casual_stand_idle_trans_in" );
    self allowedstances( "stand" );
}

_id_BE84()
{
    maps\_utility::ent_flag_init( "meetup_runner_end" );
    common_scripts\utility::flag_wait( "meetup_runner_leave" );
    var_0 = 0;

    switch ( self.script_noteworthy )
    {
        case "marine3":
            wait 4;
            var_0 = 80;
            break;
        case "marine2":
            wait 0.2;
            var_0 = 65;
            break;
        case "foley":
            wait 3.8;
            var_0 = 70;
            break;
    }

    if ( !var_0 )
        return;

    maps\_utility::ent_flag_wait( "meetup_runner_end" );
    _id_C70F( var_0 );
    maps\_anim::anim_generic_run( self, "casual_stand_idle_trans_in" );
}

_id_AD96()
{
    level endon( "office_enemy_suppressive_fire" );
    level thread maps\_utility::notify_delay( "office_enemy_suppressive_fire", 5 );
    var_0 = common_scripts\utility::getstruct( "office_magic_bullet_target2", "targetname" );
    var_1 = spawnstruct();
    var_1.origin = self geteye();

    for (;;)
    {
        var_2 = "ak47";

        if ( common_scripts\utility::cointoss() )
            var_2 = "rpd";

        var_3 = randomintrange( 10, 25 );

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            magicbullet( var_2, var_0.origin, var_1.origin + ( randomfloatrange( -64, 64 ), 0, randomfloat( 10 ) - 10 ) );
            wait 0.1;
        }

        wait(randomfloatrange( 0.5, 1.5 ));
    }
}

_id_BB57()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.oldgrenadeammo = self.grenadeammo;
    self.grenadeammo = 0;
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "lobby_robo_death" );
    level maps\_utility::add_wait( maps\_utility::waittill_msg, "office_enemies_wave1_hurt" );
    maps\_utility::do_wait_any();
    level notify( "office_enemies_wave1_hurt" );
    self.ignoreall = 0;
    maps\_utility::trigger_wait( "office_enemies_wave2", "target" );
    self.grenadeammo = self.oldgrenadeammo;
}

_id_BBD4()
{
    self.ignoreall = 1;
    level maps\_utility::delaythread( 2, ::_id_A91D, "double" );
    thread maps\_utility::flag_set_delayed( "_weather_lightning_enabled", 4 );
    self endon( "death" );
    self waittill( "goal" );
    self.ignoreall = 0;
}

_id_B5B2()
{
    var_0 = getent( "parkinglot_drone", "targetname" );
    var_1 = maps\_utility::dronespawn_bodyonly( var_0 );
    var_1 maps\_utility::gun_remove();
    var_0 maps\_anim::anim_generic( var_1, "death_pose_on_desk" );
}

_id_C57C()
{
    var_0 = getent( "parking_dead_check_guy", "targetname" );
    var_1 = maps\_utility::dronespawn_bodyonly( var_0 );
    level._id_A966 = var_1;
    var_1.animname = "dead_guy";
    wait 0.05;
    var_1 maps\_utility::gun_remove();
    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 thread maps\_anim::anim_loop_solo( var_1, "hunted_woundedhostage_idle_start" );
    common_scripts\utility::flag_wait( "tunnels_main" );
    var_1 delete();
}

_id_CFF2()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "parking_high_spec" );
        common_scripts\utility::flag_waitopen( "parking_high_spec" );
    }
}

_id_CCC4()
{
    thread maps\_anim::anim_generic_loop( self, "coverstand_hide_idle" );

    while ( !common_scripts\utility::flag( "parking_open_fire" ) && distancesquared( self.origin, level.player.origin ) > squared( 1250 ) )
        wait 0.1;

    self notify( "stop_loop" );
    maps\_utility::anim_stopanimscripted();
}
#using_animtree("generic_human");

_id_A8FD()
{
    var_0 = getent( "office_to_parking_jump_down", "targetname" );
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 maps\_anim::anim_generic_reach( self, "h2_traverse_jumpdown_96_dcemp" );
    self clearanim( %root, 0.1 );

    if ( common_scripts\utility::flag( "parking_player_jumped_down" ) )
    {
        if ( distance2dsquared( self.origin, var_1.origin ) > 100 )
            return;
    }

    var_1 thread maps\_anim::anim_generic( self, "h2_traverse_jumpdown_96_dcemp" );
    var_2 = getanimlength( maps\_utility::getanim_generic( "h2_traverse_jumpdown_96_dcemp" ) );
    wait(var_2 * 0.66);
    maps\_utility::anim_stopanimscripted();
    var_0 = getent( "office_to_parking_hop", "targetname" );
    var_2 = getanimlength( maps\_utility::getanim_generic( "traverse40" ) );
    var_3 = 25;
    var_4 = -14;
    var_5 = var_2 * 0.34;
    var_6 = var_2 * 0.75;
    var_7 = var_2 - var_6 - 0.25;
    var_1.origin = var_0.origin + ( 0, 0, var_3 );
    var_1.angles = var_0.angles;
    self linkto( var_1 );
    var_1 thread maps\_anim::anim_generic_run( self, "traverse40" );
    var_1 movez( var_3 * -1, var_5 );
    wait(var_6);
    var_1 movez( var_4, var_7 );
    wait(var_7);
    self unlink();
}

_id_B0D6()
{
    var_0 = getent( "street_flare", "targetname" );
    var_0._id_B399 = getent( var_0.target, "targetname" );
    var_0._id_B399 linkto( var_0 );
}

_id_D590()
{
    self endon( "death" );
    self endon( "long_death" );
    self.ignoreall = 1;
    maps\_utility::add_wait( maps\_utility::waittill_msg, "damage" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "plaza_open_fire" );
    thread maps\_utility::do_wait_any();
    maps\_utility::set_allowdeath( 1 );
    maps\_utility::walkdist_zero();
    maps\_utility::pathrandompercent_zero();
    thread maps\_anim::anim_generic_loop( self, "covercrouch_hide_idle" );
    thread _id_B343();
    thread _id_D0E7();
    level endon( "plaza_open_fire" );
    level endon( "plaza_throw_react" );
    common_scripts\utility::flag_wait( "plaza_show_enemies" );
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_0 maps\_utility::script_delay();
    self notify( "stop_loop" );
    maps\_utility::anim_stopanimscripted();
    var_0 maps\_anim::anim_generic_reach( self, var_0.script_animation );
    var_0 _id_D4EA( self, var_0.script_animation );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 80;
}

_id_D0E7()
{
    level endon( "plaza_open_fire" );
    level.player endon( "death" );

    while ( distancesquared( level.player.origin, self.origin ) > squared( 300 ) )
        wait 0.25;

    common_scripts\utility::flag_set( "plaza_open_fire" );
}

_id_B343()
{
    self endon( "death" );
    self endon( "long_death" );
    common_scripts\utility::flag_wait_any( "plaza_open_fire", "plaza_throw_react" );
    var_0 = spawnstruct();
    var_0.origin = self.origin;
    var_0.angles = ( 0.0, 270.0, 0.0 );

    if ( !isdefined( level._id_B343 ) )
        level._id_B343 = 0;

    self._id_D0A5 = level._id_B343;
    level._id_B343++;
    var_1 = [];
    var_1[var_1.size] = "patrol_bored_react_look_retreat";
    var_1[var_1.size] = "exposed_idle_reactB";
    var_1[var_1.size] = "exposed_idle_reactB";
    var_2 = [];
    var_2[var_2.size] = 0;
    var_2[var_2.size] = 0;
    var_2[var_2.size] = 0.5;

    if ( !common_scripts\utility::flag( "plaza_open_fire" ) )
        wait 0.5;

    wait(var_2[self._id_D0A5]);
    maps\_utility::anim_stopanimscripted();
    self.ignoreall = 0;
    maps\_utility::walkdist_reset();
    maps\_utility::pathrandompercent_reset();
    var_0 _id_D4EA( self, var_1[self._id_D0A5] );
}

_id_AA50( var_0, var_1 )
{
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        var_5 = var_1[var_2];
        var_5._id_C0FC = var_4;
        var_4 thread maps\_utility::follow_path( var_5 );
        var_2++;
    }
}

_id_CE32( var_0, var_1 )
{
    var_2 = getnodearray( var_0, var_1 );

    if ( !var_2.size )
        var_2 = getentarray( var_0, var_1 );

    if ( !var_2.size )
        var_2 = common_scripts\utility::getstructarray( var_0, var_1 );

    foreach ( var_4 in var_2 )
    {
        var_0 = var_4.script_noteworthy;

        if ( !isalive( level.team[var_0] ) )
            continue;

        level.team[var_0] thread maps\_utility::follow_path( var_4 );
    }
}

_id_BB1C( var_0 )
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

_id_AF03( var_0, var_1 )
{
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        var_4 thread _id_AFEF( var_1[var_2] );
        var_2++;
    }
}

_id_C862( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
        level.team[var_3.script_noteworthy] thread _id_AFEF( var_3 );
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

_id_B360()
{
    wait(randomfloatrange( 0.05, 0.5 ));
    var_0 = self getlightintensity();
    var_1 = self getlightcolor();
    var_2 = self.origin;

    for (;;)
    {
        for ( var_3 = 0; var_3 < randomintrange( 2, 8 ); var_3++ )
        {
            var_4 = randomfloatrange( 4, 10 );
            _id_CA57( var_1, var_0, var_2, var_4 );
        }

        for ( var_3 = 0; var_3 < randomintrange( 25, 60 ); var_3++ )
        {
            var_4 = randomfloatrange( 0.5, 1 );
            _id_CA57( var_1, var_0, var_2, var_4 );
        }
    }
}

_id_CA57( var_0, var_1, var_2, var_3 )
{
    var_4 = randomfloatrange( 0.05, 0.1 );
    self setlightintensity( var_1 * randomfloatrange( 0.9, 1.1 ) );
    self setlightcolor( ( var_0[0] + randomfloatrange( -0.05, 0.05 ), var_0[1], var_0[2] ) );
    self moveto( var_2 + ( randomfloatrange( var_3 * -1, var_3 ), randomfloatrange( var_3 * -1, var_3 ), randomfloatrange( var_3 * -1, var_3 ) ), var_4 );
    wait(var_4);
}

_id_D41C( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait( "lobby_robo_death" );

    for ( var_3 = var_1; var_3 <= var_2; var_3++ )
    {
        var_4 = var_0 + var_3;
        var_5 = getent( var_4, "targetname" );
        common_scripts\utility::flag_wait( var_4 );
        var_6 = var_5 maps\_utility::get_color_volume_from_trigger();
        var_6 maps\_utility::waittill_volume_dead_or_dying();
        var_5 maps\_utility::activate_trigger();
    }
}

_id_BE83( var_0, var_1, var_2 )
{
    for ( var_3 = var_1; var_3 <= var_2; var_3++ )
    {
        var_4 = var_0 + var_3;
        var_5 = getent( var_4, "targetname" );
        common_scripts\utility::flag_wait( var_4 );
        var_6 = var_5 maps\_utility::get_color_volume_from_trigger();
        var_6 maps\_utility::waittill_volume_dead_or_dying();
        var_7 = var_5 maps\_utility::get_color_nodes_from_trigger();
        _id_C1FC( var_7 );
    }
}

_id_B520()
{
    self._id_C19F = 1;
}

_id_BD9A( var_0 )
{
    self._id_C19F = undefined;
}

_id_C1FC( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in level.team )
    {
        if ( !isdefined( var_3._id_C19F ) )
            continue;

        var_1[var_4] = var_3;
    }

    if ( !var_1.size )
        return;

    foreach ( var_6 in var_0 )
    {
        var_7 = var_1[var_6.script_noteworthy];

        if ( !isdefined( var_7 ) )
            continue;

        var_7 thread maps\_utility::follow_path( var_6 );
    }
}

_id_AD6A( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    var_1 = [];

    foreach ( var_3 in level.team )
    {
        if ( var_3 maps\_utility::is_hero() )
            continue;

        if ( !isdefined( var_3.magic_bullet_shield ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    if ( !var_1.size )
        return;

    if ( var_1.size < var_0 )
        var_0 = var_1.size;

    for ( var_5 = 0; var_5 < var_0; var_5++ )
    {
        var_6 = common_scripts\utility::random( var_1 );
        var_1 = common_scripts\utility::array_remove( var_1, var_6 );
        var_6 maps\_utility::stop_magic_bullet_shield();
    }
}

_id_B2C3( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = [];

    foreach ( var_4 in level.team )
    {
        if ( var_4 maps\_utility::is_hero() )
            continue;

        if ( isdefined( var_4.magic_bullet_shield ) )
            continue;

        var_2[var_2.size] = var_4;
    }

    if ( !var_2.size )
        return 0;

    if ( var_2.size < var_0 )
        var_0 = var_2.size;

    var_2 = common_scripts\utility::get_array_of_farthest( level.player.origin, var_2 );

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        var_4 = var_2[var_6];

        if ( maps\_utility::player_looking_at( var_4 geteye() ) )
            continue;

        if ( var_1 )
            var_4 delete();
        else
            var_4 kill();

        var_0--;

        if ( var_0 == 0 )
            return 1;
    }

    var_2 = maps\_utility::array_removedead( var_2 );
    var_2 = common_scripts\utility::get_array_of_farthest( level.player.origin, var_2 );

    for ( var_6 = 0; var_6 < var_0; var_6++ )
    {
        var_4 = var_2[var_6];

        if ( var_1 )
            var_4 delete();
        else
            var_4 kill();

        var_0--;

        if ( var_0 == 0 )
            return 1;
    }

    return 0;
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

_id_BF1D()
{
    thread maps\_utility::magic_bullet_shield();
    _id_C743( self );

    if ( isdefined( self.script_noteworthy ) )
    {
        if ( self.script_noteworthy == "foley" )
        {
            maps\_utility::make_hero();
            level.foley = self;
        }

        if ( self.script_noteworthy == "dunn" )
        {
            maps\_utility::make_hero();
            level._id_ACC0 = self;
        }
    }

    var_0 = getentarray( "intro_team", "targetname" );

    if ( level.team.size == var_0.size )
        common_scripts\utility::flag_set( "team_initialized" );
}

_id_CAE3()
{
    level.suncolor = [];
    var_0 = 0.005;
    level.suncolor["intro"] = [];
    level.suncolor["intro"][0] = 0.1 * var_0;
    level.suncolor["intro"][1] = 0.03 * var_0;
    level.suncolor["intro"][2] = 0.01 * var_0;
    var_0 = 3;
    level.suncolor["space"] = [];
    level.suncolor["space"][0] = 1.0 * var_0;
    level.suncolor["space"][1] = 0.99 * var_0;
    level.suncolor["space"][2] = 0.99 * var_0;
    var_0 = 0.05;
    level.suncolor["helicopterstage"] = [];
    level.suncolor["helicopterstage"][0] = 1.0 * var_0;
    level.suncolor["helicopterstage"][1] = 0.85 * var_0;
    level.suncolor["helicopterstage"][2] = 0.35 * var_0;
    var_0 = 0.2;
    level.suncolor["emp"] = [];
    level.suncolor["emp"][0] = 1.0 * var_0;
    level.suncolor["emp"][1] = 0.7 * var_0;
    level.suncolor["emp"][2] = 0.6 * var_0;
    var_0 = 1.2;
    level.suncolor["sunset"] = [];
    level.suncolor["sunset"][0] = 0.02 * var_0;
    level.suncolor["sunset"][1] = 0.004 * var_0;
    level.suncolor["sunset"][2] = 0.001 * var_0;
    var_0 = 0.03;
    level.suncolor["moonrise"] = [];
    level.suncolor["moonrise"][0] = 0.498039 * var_0;
    level.suncolor["moonrise"][1] = 0.498039 * var_0;
    level.suncolor["moonrise"][2] = 0.619608 * var_0;
    level.suncolor["office"] = [];
    level.suncolor["office"][0] = 0.0;
    level.suncolor["office"][1] = 1.87451;
    level.suncolor["office"][2] = 0.1;
    level._id_D520 = level.suncolor["intro"];
    level._id_A8A0 = getent( "sky_dcburning", "targetname" );
    var_1 = undefined;
    var_1 = "-42263 6917 183";
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", 1 );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", var_1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", 1 );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", 1 );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", var_1 );
}

_id_D26E( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    thread maps\_utility::set_vision_set( "dcemp", var_0 );
    thread maps\_utility::vision_set_fog_changes( "dcemp", var_0 );
    thread _id_AA88( level.suncolor["intro"], var_0 );
}

_id_C760( var_0 )
{
    var_0 = 2;
    var_1 = common_scripts\utility::getstruct( "emp_sun_fx", "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = vectortoangles( level.player.origin - var_1.origin );
    var_2 setmodel( "tag_origin" );
    var_2 thread _id_AC5D();
    var_2 thread _id_C0C7();
    thread maps\_utility::set_vision_set( "dcemp_emp", var_0 );
    thread maps\_utility::vision_set_fog_changes( "dcemp_emp", var_0 );
    thread _id_AA88( level.suncolor["emp"], var_0 );
    wait 5;
    var_0 = 3;
    thread maps\_utility::set_vision_set( "dcemp_postemp", var_0 );
    thread maps\_utility::vision_set_fog_changes( "dcemp_postemp", var_0 );
    thread _id_AA88( level.suncolor["intro"], var_0 );
    var_0 += 1;
    wait(var_0);
    var_2 notify( "stop_sun_fx" );
    wait 1;
    var_2 delete();
}

_id_AC5D()
{
    self endon( "stop_sun_fx" );

    for (;;)
    {
        wait 0.05;
        self.angles = vectortoangles( level.player.origin - self.origin );
    }
}

_id_C0C7()
{
    self endon( "stop_sun_fx" );
    var_0 = self.origin;
    var_1 = 0.5;
    var_2 = -128;
    var_3 = 128;

    for (;;)
    {
        var_4 = ( randomfloatrange( var_2, var_3 ), randomfloatrange( var_2, var_3 ), randomfloatrange( var_2, var_3 ) );
        self moveto( var_0 + var_4, var_1, var_1 * 0.5, var_1 * 0.5 );
        wait(var_1);
        self moveto( var_0, var_1, var_1 * 0.5, var_1 * 0.5 );
        wait(var_1);
    }
}

_id_B46A( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 60;

    thread _id_AA88( level.suncolor["sunset"], var_0 );
}

_id_CA53( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 5;

    thread maps\_utility::set_vision_set( "dcemp_office", var_0 );
    thread maps\_utility::vision_set_fog_changes( "dcemp_office", var_0 );
}

_id_C187()
{
    var_0 = 3;
    maps\_utility::trigger_wait_targetname( "lobby_vision_change" );
    thread maps\_utility::set_vision_set( "dcemp_office", var_0 );
    thread maps\_utility::vision_set_fog_changes( "dcemp_office", var_0 );
}

_id_AE98( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 5;

    thread maps\_utility::set_vision_set( "dcemp_parking", var_0 );
    thread maps\_utility::vision_set_fog_changes( "dcemp_parking", var_0 );
}

_id_BBDD( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    thread maps\_utility::set_vision_set( "dcemp", var_0 );
    thread maps\_utility::vision_set_fog_changes( "dcemp", var_0 );
}

_id_CD6F()
{
    thread maps\_utility::set_vision_set( "whitehouse", 0 );
    thread maps\_utility::vision_set_fog_changes( "whitehouse", 0 );
}

_id_D579()
{
    for (;;)
    {
        maps\_utility::trigger_wait( "office_ally_color_1", "target" );
        maps\_utility::trigger_wait( "lobby_vision_change", "targetname" );
        thread _id_AA88( level.suncolor["moonrise"], 3 );
    }
}

_id_AA88( var_0, var_1 )
{
    level notify( "lerp_sunlight" );
    level endon( "lerp_sunlight" );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( maps\_utility::array_compare( var_0, level._id_D520 ) )
        return;

    var_2 = 0.05;
    var_3 = var_1 / var_2;
    var_4 = 0;
    var_5 = level._id_D520;
    var_6 = var_0[0] - var_5[0];
    var_7 = var_0[1] - var_5[1];
    var_8 = var_0[2] - var_5[2];

    while ( var_4 < var_3 )
    {
        var_9 = var_6 * var_4 / var_3;
        var_10 = var_7 * var_4 / var_3;
        var_11 = var_8 * var_4 / var_3;
        level._id_D520[0] = var_5[0] + var_9;
        level._id_D520[1] = var_5[1] + var_10;
        level._id_D520[2] = var_5[2] + var_11;
        _func_47( level._id_D520[0], level._id_D520[1], level._id_D520[2] );
        var_4++;
        wait(var_2);
    }

    level._id_D520 = var_0;
    _func_47( var_0[0], var_0[1], var_0[2] );
}

_id_BDA9( var_0, var_1 )
{
    level notify( "lerp_specular" );
    level endon( "lerp_specular" );
}

_id_D4EA( var_0, var_1, var_2 )
{
    thread maps\_anim::anim_generic_gravity( var_0, var_1, var_2 );
    var_3 = getanimlength( maps\_utility::getanim_generic( var_1 ) );
    wait(var_3 - 0.2);
    var_0 clearanim( maps\_utility::getanim_generic( var_1 ), 0.2 );
    var_0 notify( "killanimscript" );
}

_id_C3F4( var_0 )
{
    if ( var_0 )
        self.dontchangepushplayer = 1;
    else
        self.dontchangepushplayer = undefined;

    self pushplayer( var_0 );
}

_id_C70F( var_0 )
{
    self.turnthreshold = self.defaultturnthreshold;
    self.a.array["turn_left_45"] = %exposed_tracking_turn45l;
    self.a.array["turn_left_90"] = %exposed_tracking_turn90l;
    self.a.array["turn_left_135"] = %exposed_tracking_turn135l;
    self.a.array["turn_left_180"] = %exposed_tracking_turn180l;
    self.a.array["turn_right_45"] = %exposed_tracking_turn45r;
    self.a.array["turn_right_90"] = %exposed_tracking_turn90r;
    self.a.array["turn_right_135"] = %exposed_tracking_turn135r;
    self.a.array["turn_right_180"] = %exposed_tracking_turn180r;
    self.a.array["straight_level"] = %exposed_aim_5;
    animscripts\combat::turntofacerelativeyaw( var_0 );
}

_id_BF7A()
{
    var_0 = common_scripts\utility::getstruct( "rainfxnode", "targetname" );
    var_1 = squared( var_0.radius );

    foreach ( var_3 in level.createfxent )
    {
        if ( distancesquared( var_3.v["origin"], var_0.origin ) < var_1 && !isdefined( var_3.v["exploder"] ) )
            var_3 common_scripts\utility::pauseeffect();
    }
}

_id_D1BA()
{
    var_0 = common_scripts\utility::getstruct( "rainfxnode2", "targetname" );
    var_1 = squared( var_0.radius );

    foreach ( var_3 in level.createfxent )
    {
        if ( distancesquared( var_3.v["origin"], var_0.origin ) < var_1 && !isdefined( var_3.v["exploder"] ) )
            var_3 common_scripts\utility::pauseeffect();
    }
}

_id_B6AB()
{
    var_0 = common_scripts\utility::getstruct( "rainfxnode", "targetname" );
    var_1 = squared( var_0.radius );

    foreach ( var_3 in level.createfxent )
    {
        if ( distancesquared( var_3.v["origin"], var_0.origin ) < var_1 && !isdefined( var_3.v["exploder"] ) )
            var_3 maps\_utility::restarteffect();
    }
}

_id_B0D3()
{
    var_0 = common_scripts\utility::getstruct( "whitehousefxnode", "targetname" );
    var_1 = squared( var_0.radius );

    foreach ( var_3 in level.createfxent )
    {
        if ( distancesquared( var_3.v["origin"], var_0.origin ) < var_1 && !isdefined( var_3.v["exploder"] ) )
            var_3 common_scripts\utility::pauseeffect();
    }
}

_id_D575()
{
    var_0 = common_scripts\utility::getstruct( "whitehousefxnode", "targetname" );
    var_1 = squared( var_0.radius );

    foreach ( var_3 in level.createfxent )
    {
        if ( distancesquared( var_3.v["origin"], var_0.origin ) < var_1 && !isdefined( var_3.v["exploder"] ) )
            var_3 maps\_utility::restarteffect();
    }
}

_id_C919()
{
    if ( !common_scripts\utility::flag( "intro_fx" ) )
        return;

    maps\_utility::pauseexploder( "plane_crash_aftermath" );
    maps\_utility::pauseexploder( "moon" );
    var_0 = common_scripts\utility::getstruct( "introfxnode", "targetname" );
    var_1 = squared( var_0.radius );

    foreach ( var_3 in level.createfxent )
    {
        if ( distancesquared( var_3.v["origin"], var_0.origin ) < var_1 )
            var_3 common_scripts\utility::pauseeffect();
    }

    common_scripts\utility::flag_clear( "intro_fx" );
}

_id_AA9B()
{
    if ( common_scripts\utility::flag( "intro_fx" ) )
        return;

    maps\_utility::restartexploder( "plane_crash_aftermath" );
    maps\_utility::restartexploder( "moon" );
    var_0 = common_scripts\utility::getstruct( "introfxnode", "targetname" );
    var_1 = squared( var_0.radius );

    foreach ( var_3 in level.createfxent )
    {
        if ( distancesquared( var_3.v["origin"], var_0.origin ) < var_1 )
            var_3 maps\_utility::restarteffect();
    }

    common_scripts\utility::flag_set( "intro_fx" );
}

_id_CD2C()
{
    if ( !common_scripts\utility::flag( "iss_fx" ) )
        return;

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["fxid"] == "dcemp_sun" )
            var_1 common_scripts\utility::pauseeffect();
    }

    common_scripts\utility::flag_clear( "iss_fx" );
}

_id_C4A0()
{
    var_0 = spawnstruct();
    var_0.node = common_scripts\utility::getstruct( "introfxnode", "targetname" );
    var_0.radius = squared( var_0.node.radius );
    var_1 = spawnstruct();
    var_1.node = common_scripts\utility::getstruct( "rainfxnode", "targetname" );
    var_1.radius = squared( var_1.node.radius );
    var_1 = spawnstruct();
    var_1.node = common_scripts\utility::getstruct( "rainfxnode2", "targetname" );
    var_1.radius = squared( var_1.node.radius );
    var_2 = spawnstruct();
    var_2.node = common_scripts\utility::getstruct( "whitehousefxnode", "targetname" );
    var_2.radius = squared( var_2.node.radius );
    var_3 = 0;

    if ( self.v["fxid"] == "dcemp_sun" || self.v["fxid"] == "space_nuke" || self.v["fxid"] == "space_nuke_shockwave" || self.v["fxid"] == "space_emp" || self.v["fxid"] == "space_explosion" || self.v["fxid"] == "space_explosion_small" )
        var_3 = 1;

    var_4 = 0;

    if ( self.v["fxid"] == "carpetbomb" || self.v["fxid"] == "wire_spark" )
        var_4 = 1;

    if ( distancesquared( self.v["origin"], var_0.node.origin ) < var_0.radius )
        common_scripts\utility::flag_wait( "intro_fx" );
    else if ( var_3 )
        common_scripts\utility::flag_wait( "iss_fx" );
    else if ( distancesquared( self.v["origin"], var_1.node.origin ) < var_1.radius )
        common_scripts\utility::flag_wait( "rain_fx" );
    else if ( distancesquared( self.v["origin"], var_1.node.origin ) < var_1.radius )
        common_scripts\utility::flag_wait( "rain_fx2" );
    else if ( distancesquared( self.v["origin"], var_2.node.origin ) < var_2.radius || var_4 )
        common_scripts\utility::flag_wait( "end_fx" );

    common_scripts\_fx::create_triggerfx();
}

_id_B345( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 = self getlightintensity();
    var_4 = var_0 - var_3;
    var_5 = 0.05;
    var_6 = int( var_1 / var_5 );

    for ( var_7 = var_4 / var_6; var_6; var_6-- )
    {
        var_3 += var_7;
        self _meth_81ED( var_3 );
        self _meth_81EF( var_3 * var_2 );
        wait(var_5);
    }

    self _meth_81ED( var_0 );
    self _meth_81EF( var_0 * var_2 );
}

_id_A91D( var_0 )
{
    var_1 = [];
    var_1["quick"] = 0;
    var_1["double"] = 1;
    var_1["triple"] = 2;
    maps\_weather::lightningflash( _id_CD74::lightning_normal, _id_CD74::lightning_flash, var_1[var_0] );
}

_id_BFD6()
{
    self setanimknoballrestart( %cornerstndr_lean_aim_5, %body, 1, 0.2 );
    self setanimlimited( %aim_6, 0.55, 0.2 );
    self setanimknoblimited( %cornerstndr_lean_aim_6, 1, 0.2 );
    self setanimlimited( %add_idle, 1, 0.2 );
    self setanimknoblimitedrestart( %cornerstndr_lean_idle, 1, 0.2 );
    self waittill( "stop_custom_aim" );
}

_id_BC3D()
{
    self setanimlimited( %cornercrr_lean_aim_5, 1, 0.2 );
    self setanimlimited( %aim_6, 0.5, 0.2 );
    self setanimknoblimited( %cornercrr_lean_aim_6, 1, 0.2 );
    self setanimlimited( %add_idle, 1, 0.2 );
    self setanimknoblimitedrestart( %cornercrr_lean_idle, 1, 0.2 );
    self waittill( "stop_custom_aim" );
}

_id_C9AB( var_0 )
{
    var_1 = self gettagorigin( "J_SpineUpper" );
    var_2 = common_scripts\utility::random( level.team );
    var_3 = vectornormalize( var_2.origin - var_1 );
    var_3 *= 10;
    playfx( common_scripts\utility::getfx( var_0 ), var_1 + var_3 );
}

_id_CF82()
{
    var_0 = [];
    var_1 = common_scripts\utility::getstructarray( "script_to_model_swap_intro", "script_noteworthy" );
    var_1 = common_scripts\utility::array_combine( var_1, common_scripts\utility::getstructarray( "crash_cars", "targetname" ) );
    var_1 = common_scripts\utility::array_combine( var_1, common_scripts\utility::getstructarray( "street_cars_bounce", "targetname" ) );
    var_1 = common_scripts\utility::array_combine( var_1, common_scripts\utility::getstructarray( "iss_entity", "targetname" ) );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_0[var_3.script_modelname] ) )
            continue;

        var_0[var_3.script_modelname] = var_3.script_modelname;
    }

    foreach ( var_6 in var_0 )
        precachemodel( var_6 );
}

_id_C49A()
{
    if ( common_scripts\utility::flag( "script2model_intro" ) )
        return;

    var_0 = common_scripts\utility::getstructarray( "script_to_model_swap_intro", "script_noteworthy" );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "crash_cars", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "street_cars_bounce", "targetname" ) );

    foreach ( var_2 in var_0 )
    {
        var_3 = spawn( "script_model", var_2.origin );
        var_3.angles = var_2.angles;
        var_3.targetname = var_2.targetname;
        var_3.script_noteworthy = var_2.script_noteworthy;
        var_3 setmodel( var_2.script_modelname );
    }

    common_scripts\utility::flag_set( "script2model_intro" );
}

_id_CC14()
{
    if ( common_scripts\utility::flag( "script2model_iss" ) )
        return;

    var_0 = common_scripts\utility::getstructarray( "iss_entity", "targetname" );
    var_1 = 0;

    foreach ( var_3 in var_0 )
    {
        var_4 = spawn( "script_model", var_3.origin );
        var_4.angles = var_3.angles;
        var_4.targetname = var_3.targetname;
        var_4.script_noteworthy = var_3.script_noteworthy;
        var_4.script_type = var_3.script_type;
        var_4 setmodel( var_3.script_modelname );
        var_1++;

        if ( var_1 == 50 )
        {
            wait 0.05;
            var_1 = 0;
        }
    }

    common_scripts\utility::flag_set( "script2model_iss" );
}

_id_AEE9()
{
    if ( !common_scripts\utility::flag( "script2model_intro" ) )
        return;

    var_0 = getentarray( "script_to_model_swap_intro", "script_noteworthy" );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "crash_cars", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "street_cars_bounce", "targetname" ) );
    common_scripts\utility::array_call( var_0, ::delete );
    common_scripts\utility::flag_clear( "script2model_intro" );
}

_id_BFAA()
{
    if ( !common_scripts\utility::flag( "script2model_iss" ) )
        return;

    var_0 = getentarray( "iss_entity", "targetname" );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "iss_lights", "targetname" ) );
    common_scripts\utility::array_call( var_0, ::delete );
    var_1 = getent( "earth_model", "targetname" );
    var_1 delete();
    common_scripts\utility::flag_clear( "script2model_iss" );
}

sun_angles_change_setup()
{
    level.orig_sun_angles = getmapsunangles();
    var_0 = getent( "office1_entrance", "targetname" );
    var_1 = getent( "office1_exit", "targetname" );
    var_2 = getent( "office2_entrance", "targetname" );
    var_3 = getent( "office2_exit", "targetname" );
    var_4 = [ var_0, var_1, var_3, var_2 ];
    common_scripts\utility::array_thread( var_4, ::sun_angles_change_think );
}

sun_angles_change_think()
{
    for (;;)
    {
        self waittill( "trigger" );

        switch ( self.targetname )
        {
            case "office1_entrance":
            case "office2_exit":
                level.sunpitch = -24;
                level.sunheading = -14;
                common_scripts\utility::flag_set( "office1" );
                break;
            case "office1_exit":
            case "office2_entrance":
                level.sunpitch = -20;
                level.sunheading = 55;
                common_scripts\utility::flag_clear( "office1" );
                break;
        }

        if ( common_scripts\utility::flag( "office1" ) )
        {
            var_0 = anglestoforward( ( level.sunpitch, level.sunheading, 0 ) );
            setsundirection( var_0 );
        }
        else
            resetsundirection();

        wait 0.2;
    }
}

lightning_watcher()
{

}

dancing_lights_setup()
{
    var_0 = getentarray( "light_spot", "classname" );
    var_1 = getentarray( "light_omni", "classname" );
    var_2 = maps\_utility::array_merge( var_0, var_1 );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( var_5.script_parameters ) && var_5.script_parameters == "fire_dance" )
            var_3[var_3.size] = var_5;
    }

    common_scripts\utility::array_thread( var_3, ::_id_B360 );
}

portal_group_setup()
{
    enablepg( "street", 1 );
    enablepg( "street2", 1 );
    common_scripts\utility::flag_wait( "emp_entity_cleanup_done" );
    enablepg( "space", 1 );
    enablepg( "street", 0 );
    enablepg( "street2", 0 );
    common_scripts\utility::flag_wait( "iss_done" );
    enablepg( "space", 0 );
    enablepg( "street", 1 );
    enablepg( "street2", 1 );
}

missile_pre_launch()
{
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "iss_icbm_vehicle" );
    var_0 startpath();
    var_0 vehicle_setspeedimmediate( 55, 100 );
    level._id_B2A2 = var_0;
    wait 1.5;
    var_0 vehicle_setspeedimmediate( 0, 100 );
    common_scripts\utility::flag_wait( "iss_nag_dialogue" );
    playfxontag( level._effect["dcemp_icbm_trail"], var_0, "TAG_ORIGIN" );
}

remove_ais_after_space()
{
    wait 1.5;
    var_0 = getaiarray( "axis" );

    while ( var_0.size >= 8 )
    {
        var_0[0] delete();
        var_0 = common_scripts\utility::array_remove( var_0, var_0[0] );
        waitframe();
    }
}

hide_elements_intro()
{
    var_0 = getentarray( "hide_before_street", "script_noteworthy" );
    var_1 = getentarray( "street_heli_destroyed", "targetname" );
    var_2 = common_scripts\utility::array_combine( var_0, var_1 );

    foreach ( var_4 in var_2 )
        var_4 hide();
}

static_model_group_setup()
{
    var_0 = getent( "staticmodelgroup_05_show", "targetname" );
    var_1 = getent( "staticmodelgroup_05_hide", "targetname" );
    var_2 = getent( "staticmodelgroup_09_show", "targetname" );
    var_3 = getent( "staticmodelgroup_09_hide", "targetname" );
    var_4 = getent( "staticmodelgroup_09_show_parking", "targetname" );
    var_5 = [ var_0, var_1, var_2, var_3, var_4 ];
    common_scripts\utility::array_thread( var_5, ::static_model_group_think );
    _func_31C( 1 );
    _func_31C( 2 );
    _func_31C( 3 );
    _func_31C( 4 );
    _func_31C( 5 );
    _func_31C( 6 );
    _func_31C( 7 );
    _func_31C( 8 );
    _func_31C( 9 );
    common_scripts\utility::flag_wait( "iss_done" );
    _func_31B( 1 );
    _func_31B( 3 );
    common_scripts\utility::flag_wait( "player_and_squad_safe" );
    _func_31C( 3 );
    _func_31B( 4 );
    _func_31B( 7 );
}

static_model_group_think()
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( getsubstr( self.targetname, 20, 21 ) == "h" )
        {
            _func_31C( int( getsubstr( self.targetname, 18, 19 ) ) );
            continue;
        }

        _func_31B( int( getsubstr( self.targetname, 18, 19 ) ) );
    }
}

tunnel_door_not_solid_watcher()
{
    common_scripts\utility::flag_wait( "tunnels_door_open" );
    self notsolid();

    while ( level.player istouching( self ) )
        waitframe();

    self solid();
}

heli_falling_kill_player()
{
    var_0 = getent( "street_player_hide_trigger", "targetname" );
    var_1 = getentarray( "pushed_van_collision", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 notsolid();

    common_scripts\utility::flag_wait( "street_crash_cop" );

    if ( level.player istouching( getent( "kill_player_car_push", "targetname" ) ) )
        level.player kill();

    foreach ( var_3 in var_1 )
        var_3 solid();
}

hide_stuff_from_offices()
{
    var_0 = getentarray( "hide_from_offices", "targetname" );
    var_1 = getent( "staticmodelgroup_09_show_parking", "targetname" );

    foreach ( var_3 in var_0 )
        var_3 hide();

    var_1 waittill( "trigger" );

    foreach ( var_3 in var_0 )
        var_3 show();
}

tunnel_lamps()
{
    var_0 = getent( "activate_tunnel_lamps", "targetname" );
    var_1 = getentarray( "animated_lamp_tunnel", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 maps\_utility::assign_animtree( "tunnel_lamp" );

    var_0 waittill( "trigger" );

    foreach ( var_3 in var_1 )
        var_3 thread maps\_anim::anim_loop_solo( var_3, "dcemp_tunnel_lamp" );
}

fire_react_trigger()
{
    var_0 = getent( "trigger_shelter", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( "player_and_squad_safe" );
    var_0 common_scripts\utility::trigger_on();
}

hide_mannequins()
{
    if ( getdvar( "loc_arabic_sku" ) == "1" )
    {
        var_0 = getentarray( "mannequin", "targetname" );

        foreach ( var_2 in var_0 )
            var_2 hide();
    }
}

kill_office_enemies_with_cheat()
{
    common_scripts\utility::flag_wait( "parking_player_jumped_down" );
    var_0 = getent( "office_kill_enemies", "targetname" );
    var_1 = getaiarray( "axis" );

    if ( level._id_A87F._id_C2B7 || level._id_A87F._id_C5B4 || level._id_A87F._id_D159 )
    {
        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3 ) && !_func_2A5( var_3 ) && isalive( var_3 ) )
                var_3 delete();
        }
    }
}
