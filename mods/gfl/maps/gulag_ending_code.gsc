// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_CC76()
{
    level._id_D13B = self;
    self.animname = "soap";
    maps\_utility::make_hero();
}

_id_AE55()
{
    level.price = self;
    self.health = 5000;
    self.animname = "price";
    thread maps\_utility::magic_bullet_shield();
    maps\_utility::make_hero();
    self.attackeraccuracy = 0;
    self.ignorerandombulletdamage = 1;
    maps\_utility::gun_remove();
    self.has_no_ir = 1;
    self notify( "saved" );
    self waittill( "change_to_regular_weapon" );
    maps\_utility::forceuseweapon( "ak47", "primary" );
}

_id_AE17()
{
    self.animname = "redshirt";
    level._id_B71B = self;
    thread maps\_utility::magic_bullet_shield();
    maps\_utility::make_hero();
}

_id_C065()
{
    level endon( "cafeteria_sequence_begins" );
    var_0 = getaiarray( "allies" );
    var_1 = 1.0;
    var_2 = 50;
    var_3 = 1.0;
    var_4 = 200;
    var_5 = 1;
    var_6 = 1.5;
    var_7 = 100;
    var_8 = 200;
    var_9 = var_4 - var_2;
    var_10 = var_3 - var_1;
    var_11 = var_6 - var_5;
    var_12 = var_8 - var_7;

    if ( common_scripts\utility::flag( "match_up_for_final_room" ) )
        return;

    level endon( "match_up_for_final_room" );
    var_13 = 0.45;
    var_14 = 200;
    var_15 = [];
    var_15["soap"] = 20;
    var_15["redshirt"] = -40;
    var_15["price"] = -10;

    for (;;)
    {
        var_0 = [];
        var_0["soap"] = level._id_D13B;
        var_0["price"] = level.price;
        var_0["redshirt"] = level._id_B71B;

        if ( common_scripts\utility::flag( "exit_collapses" ) )
        {
            var_15["soap"] = 75;
            var_15["redshirt"] = -25;
            var_15["price"] = -40;
        }

        var_16 = ( 0.0, 0.0, 0.0 );
        var_17 = [];

        foreach ( var_21, var_19 in var_0 )
        {
            var_16 += var_19.origin;
            var_20 = distance( var_19.origin, level._id_D3B7 );
            var_17[var_21] = var_20 + var_15[var_21];
        }

        var_16 /= var_0.size;
        var_22 = 99999999;

        foreach ( var_20 in var_17 )
        {
            if ( var_20 < var_22 )
                var_22 = var_20;
        }

        var_25 = [];

        foreach ( var_21, var_20 in var_17 )
            var_17[var_21] -= var_22;

        var_27 = 0;

        foreach ( var_20 in var_17 )
        {
            if ( var_20 > var_27 )
                var_27 = var_20;
        }

        var_30 = var_27 * var_13 / var_14;
        var_30 *= 0.5;

        if ( var_30 > var_13 )
            var_30 = var_13;

        var_31 = var_27 * 0.5;
        var_25 = [];

        foreach ( var_21, var_20 in var_17 )
        {
            var_20 -= var_31;
            var_20 /= abs( var_31 );
            var_25[var_21] = var_20 * var_30;
        }

        var_33 = distance( var_16, level._id_D3B7 );
        var_34 = distance( level.player.origin, level._id_D3B7 );
        var_20 = var_34 - var_33;
        level notify( "player_dist_from_squad", var_20 );
        var_35 = var_20;
        var_20 -= var_2;
        var_36 = var_20 / var_9;

        if ( var_36 < 0 )
            var_36 = 0;
        else if ( var_36 > 1 )
            var_36 = 1;

        var_36 = 1 - var_36;
        var_37 = var_1 + var_10 * var_36;
        var_20 = var_35 - var_7;
        var_36 = var_20 / var_12;

        if ( var_36 < 0 )
            var_36 = 0;
        else if ( var_36 > 1 )
            var_36 = 1;

        var_38 = var_5 + var_11 * var_36;

        if ( !common_scripts\utility::flag( "exit_collapses" ) )
            setsaveddvar( "player_sprintSpeedScale", var_38 );

        if ( common_scripts\utility::flag( "modify_ai_moveplaybackrate" ) )
        {
            foreach ( var_21, var_19 in var_0 )
            {
                var_19.moveplaybackrate = var_37 + var_25[var_21];

                if ( var_19.moveplaybackrate > 1.15 )
                    var_19.moveplaybackrate = 1.15;
            }
        }

        wait 0.05;
    }
}

_id_C2CA( var_0 )
{
    var_1 = level._id_BDA3[self.animname][var_0.animname];
    var_2 = distance( self.origin, var_0.origin );
    var_3 = undefined;
    var_4 = maps\_utility::get_dot( self.origin, self.angles, var_0.origin );

    if ( var_4 < 0.8 )
        var_3 = -0.15;
    else
    {
        var_5 = var_1 - var_2;
        var_6 = 50;
        var_7 = 0.15;
        var_3 = var_5 * var_7 / var_6;

        if ( var_3 > var_7 )
            var_3 = var_7;
        else if ( var_3 < var_7 * -1 )
            var_3 = var_7 * -1;
    }

    self.moveplaybackrate = 1 + var_3;
    var_8 = self.moveplaybackrate;
    var_9 = var_3;
    var_8 = int( var_8 * 100 ) * 0.01;
    var_9 = int( var_9 * 100 ) * 0.01;
}

_id_C047( var_0 )
{
    var_1 = level._id_BDA3[self.animname][var_0.animname];
    var_2 = distance( self.origin, var_0.origin );
    var_3 = maps\_utility::get_dot( self.origin, self.angles, var_0.origin );

    if ( var_3 > 0 )
        var_2 *= -1;

    var_4 = var_1 - var_2;
    var_5 = 50;
    var_6 = 0.15;
    var_7 = var_4 * var_6 / var_5;

    if ( var_7 > var_6 )
        var_7 = var_6;
    else if ( var_7 < var_6 * -1 )
        var_7 = var_6 * -1;

    self.moveplaybackrate = 1 + var_7;
    var_8 = self.moveplaybackrate;
    var_9 = var_7;
    var_8 = int( var_8 * 100 ) * 0.01;
    var_9 = int( var_9 * 100 ) * 0.01;
}

_id_AE30( var_0 )
{
    self endon( "death" );
    var_1 = self.origin;

    for (;;)
    {
        var_1 = self.origin;
        wait 0.05;
    }
}

_id_AAF1()
{
    if ( getdvar( "no_escape" ) == "1" )
        return;

    level endon( "stop_minor_earthquakes" );
    var_0 = 0.15;
    var_1 = 0.25;
    var_2 = var_1 - var_0;
    var_3 = 0.2;
    var_4 = 0.3;
    var_5 = var_4 - var_3;
    var_6 = 1;

    for (;;)
    {
        var_7 = randomfloat( 1 );

        if ( var_6 )
        {
            var_6 = 0;
            var_7 = 1;
        }

        var_8 = var_0 + var_7 * var_2;
        var_9 = var_3 + var_7 * var_5;

        if ( randomint( 100 ) < 35 )
            _id_A8A1();

        _id_ABDA( var_8, 3 + var_7 * 2, level.player.origin + common_scripts\utility::randomvector( 1000 ), 5000 );
        var_10 = level.player getplayerangles();
        var_11 = anglestoforward( var_10 );
        var_12 = level.player.origin + var_11 * 180;
        var_12 = maps\_utility::set_z( var_12, level.player.origin[2] + 64 );
        var_13 = common_scripts\utility::randomvector( var_9 );

        if ( var_13[2] < 0 )
            var_13 = maps\_utility::set_z( var_13, var_13[2] * -1 );

        physicsjolt( var_12, 350, 250, var_13 );
        wait(randomfloatrange( 1, 5 ));
    }
}

_id_D5A3()
{
    level.player takeallweapons();
    level.player giveweapon( "m4m203_reflex_arctic" );
    level.player setviewmodel( "h2_gfl_st_ar15_viewhands" );
    level.player switchtoweapon( "m4m203_reflex_arctic" );
    level.player switchtoweapon( "m14_scoped_arctic" );
}

_id_A913()
{
    if ( getdvar( "no_escape" ) == "1" )
        return;

    level endon( "skip_stumble_trigger_think" );
    wait 3;
    var_0 = getent( "eq_view_roller", "targetname" );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = var_1.origin;
    var_1 linkto( var_0 );
    level.player playersetgroundreferenceent( var_1 );
    var_2 = common_scripts\utility::spawn_tag_origin();

    if ( !common_scripts\utility::flag( "exit_collapses" ) )
    {
        self waittill( "trigger", var_3 );
        thread _id_C345();
        _id_ABDA( 0.25, 4, self.origin, 5000 );
        var_4 = common_scripts\utility::randomvector( 0.6 );
        var_5 = level.player.origin;
        physicsjolt( var_5, 350, 250, var_4 );
        var_6 = var_0.angles;
        level.player thread _id_D54C();
        common_scripts\utility::flag_wait( "exit_collapses" );
        common_scripts\utility::flag_set( "controlled_player_rumble" );
        level.player playrumblelooponentity( "heavy_3s" );
        maps\_utility::delaythread( 3.0, common_scripts\utility::flag_clear, "controlled_player_rumble" );
        thread _id_B1BF();
        thread _id_BBAA();
    }

    if ( !common_scripts\utility::flag( "big_earthquake_hits" ) )
    {
        common_scripts\utility::flag_wait( "big_earthquake_hits" );
        var_7 = maps\_utility::getentwithflag( "big_earthquake_hits" );
        var_0 = getent( var_7.target, "targetname" );
        var_5 = var_0.origin;
        var_6 = var_0.angles;
        var_0.origin = var_1.origin;
        var_1 linkto( var_0 );
        _id_ABDA( 0.25, 4, self.origin, 5000 );
        var_4 = common_scripts\utility::randomvector( 0.6 );
        physicsjolt( var_5, 350, 250, var_4 );
    }

    common_scripts\utility::flag_wait( "player_falls_down" );
    _id_ABDA( 0.35, 4, self.origin, 5000 );
    var_4 = common_scripts\utility::randomvector( 0.6 );
    var_5 = level.player.origin;
    physicsjolt( var_5, 350, 250, var_4 );
    common_scripts\utility::flag_set( "controlled_player_rumble" );
    level.player playrumblelooponentity( "light_3s" );
    level.player common_scripts\utility::delaycall( 1.5, ::playrumblelooponentity, "heavy_2s" );
    maps\_utility::delaythread( 3.5, common_scripts\utility::flag_clear, "controlled_player_rumble" );
    var_6 = var_0.angles;
    var_0.origin = var_1.origin;
    var_8 = level.player getplayerangles();
    var_0.angles = ( 0, var_8[1], 0 );
    var_2.angles = var_0.angles;
    var_1 linkto( var_0 );
    var_9 = anglestoforward( var_0.angles );
    var_10 = anglestoright( var_0.angles );
    var_11 = level.player.origin + ( 0.0, 0.0, 100.0 ) + var_9 * 50;
    level.player enabledeathshield( 1 );
    level.player setmovespeedscale( 0.25 );
    level.player dodamage( ( level.player.health - 5 ) / level.player.damagemultiplier, var_11 );
    level.player thread _id_ADD1();
    level.player disableweapons();
    soundscripts\_snd::snd_message( "start_evac_rock_falling" );

    if ( getdvar( "use_old_cafeteria_behavior" ) != "1" )
    {
        thread maps\_utility::flag_set_delayed( "cafeteria_lights_off", 2 );
        thread _id_D551();
    }

    var_12 = 1.9;

    if ( getdvar( "use_old_cafeteria_behavior" ) != "1" )
        level.player playersetgroundreferenceent( undefined );

    var_2 addyaw( 20 );
    var_2 addpitch( 35 );
    var_2 addroll( 25 );
    var_13 = 0.2;
    var_0 rotateto( var_2.angles, var_13, var_13 * 0.5, var_13 * 0.5 );
    wait(var_13);
    thread _id_BFEF( var_0.angles );

    if ( getdvar( "use_old_cafeteria_behavior" ) == "1" )
    {
        wait 0.75;
        var_13 = 0.5;
        var_2 addpitch( -35 );
        var_2 addroll( -25 );
        var_0 rotateto( var_2.angles, var_13, var_13 * 0.5, var_13 * 0.5 );
        wait(var_13);
        var_13 = 0.5;
        var_2 addpitch( 5 );
        var_2 addroll( -15 );
        var_0 rotateto( var_2.angles, var_13, 0, var_13 );
        wait(var_13);
        var_13 = 0.55;
        var_2 addpitch( 15 );
        var_2 addroll( -60 );
        var_0 rotateto( var_2.angles, var_13, 0, 0 );
        level.player setstance( "prone" );
        wait 0.65;
    }

    if ( getdvar( "use_old_cafeteria_behavior" ) != "1" )
        wait 2.1;

    setomnvar( "ui_consciousness_init", 1 );
    setsaveddvar( "ui_consciousnessVignetteDarkness", 0.3 );
    setomnvar( "ui_consciousness_play", 2 );
    soundscripts\_snd::snd_message( "start_evac_rock_falling_black_screen" );
    level.player nightvisiongogglesforceoff();
    level.player allowcrouch( 1 );
    level.player allowstand( 1 );
    common_scripts\utility::flag_clear( "player_falls_down" );
    wait 1;
}

_id_ADD1()
{
    level endon( "time_to_evac" );
    level.player maps\_utility::ent_flag_set( "player_no_auto_blur" );
    level.player setblurforplayer( 12, 0.05 );
    var_0 = 0.8;
    var_1 = 0.4;
    var_2 = 7;
    var_3 = 1;

    for (;;)
    {
        level.player setblurforplayer( var_1, var_0 );
        wait(var_0);
        level.player setblurforplayer( var_2, var_3 );
        wait(var_3);
        var_2 *= 1.5;
    }
}

_id_BFEF( var_0 )
{
    var_1 = anglestoforward( var_0 );
    var_2 = anglestoright( var_0 );
    var_3 = level.player.origin + ( 0.0, 0.0, 100.0 ) + var_1 * 50;
    var_4 = level.player.origin + var_1 * 35 + var_2 * -10 + ( 0.0, 0.0, 32.0 );
    var_5 = common_scripts\utility::getfx( "hallway_collapsing_huge" );

    for ( var_6 = 0; var_6 < 10; var_6++ )
    {
        var_4 = level.player.origin + var_1 * 35 + var_2 * -10 + ( 0.0, 0.0, 180.0 );
        common_scripts\utility::noself_delaycall( 0.05, ::playfx, var_5, var_4 );
        wait(randomfloatrange( 0.1, 0.25 ));
    }
}

_id_B879( var_0 )
{
    var_0 = maps\_utility::getgenericanim( var_0 );
    self.run_overrideanim = var_0;
    self setflaggedanimknob( "stumble_run", var_0, 1, 0.2, 1, 1 );
    wait 1.5;
    var_1 = maps\_utility::getgenericanim( "run_root" );
    var_2 = 0;

    for (;;)
    {
        if ( self getanimtime( var_1 ) < var_2 )
            break;

        var_2 = self getanimtime( var_1 );
        wait 0.05;
    }

    self.run_overrideanim = undefined;
    self notify( "movemode" );
}

_id_B622()
{
    var_0 = [];
    var_1 = [];
    var_1[var_1.size] = "reaction_180";
    var_1[var_1.size] = "reaction_180";
    var_1[var_1.size] = "run_180";
    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        self waittill( "trigger", var_4 );

        if ( !isalive( var_4 ) )
            return;

        if ( isdefined( var_0[var_4.unique_id] ) )
            continue;

        var_0[var_4.unique_id] = 1;
        var_5 = var_1[var_2];
        var_2++;

        if ( var_2 >= var_1.size )
            var_2 = 0;

        var_4 thread _id_B049( var_5 );
    }
}

_id_B049( var_0 )
{
    var_1 = getentarray( "friendly_changedirection_org", "targetname" );
    var_1 = maps\_utility::array_index_by_parameters( var_1 );
    thread maps\_spawner::go_to_node( var_1[self.animname], "struct" );
    maps\_anim::anim_generic( self, var_0 );
}

_id_B264()
{
    wait 0.3;
    _id_ABDA( 0.25, 4, self.origin, 5000 );
}

_id_C0CE( var_0, var_1 )
{
    self endon( "death" );
    var_2 = maps\_utility::getgenericanim( "run_root" );
    var_3 = self getanimtime( var_2 );

    for (;;)
    {
        if ( self getanimtime( var_2 ) < var_3 )
            break;

        var_3 = self getanimtime( var_2 );
        wait 0.05;
    }

    if ( isdefined( var_1 ) && !var_1._id_C4C5 )
    {
        var_1._id_C4C5 = 1;
        _id_ABDA( 0.25, 4, self.origin, 5000 );
    }

    self.run_overrideanim = maps\_utility::getgenericanim( var_0 );
    var_3 = self getanimtime( var_2 );

    for (;;)
    {
        if ( self getanimtime( var_2 ) < var_3 )
            break;

        var_3 = self getanimtime( var_2 );
        wait 0.05;
    }

    self.run_overrideanim = undefined;
    self notify( "movemode" );
}

_id_BFEE()
{
    var_0 = "com_floodlight";
    var_1 = "com_floodlight_on";
    var_2 = self;
    var_3 = getent( var_2.target, "targetname" );

    if ( !isdefined( var_3 ) )
        return;

    var_4 = var_3 getlightintensity();

    for (;;)
    {
        var_5 = randomint( 3 ) + 2;

        for ( var_6 = 0; var_6 < var_5; var_6++ )
        {
            var_3 setlightintensity( 0 );
            var_2 setmodel( var_0 );
            wait(randomfloatrange( 0.05, 0.1 ));
            var_3 setlightintensity( var_4 );
            var_2 setmodel( var_1 );
            wait 0.05;
        }

        var_3 setlightintensity( var_4 );
        var_2 setmodel( var_1 );
        wait(randomfloatrange( 1.2, 2 ));
    }
}

_id_B9E5()
{
    maps\_vehicle::godon();
    var_0 = 50;
    self setyawspeed( 140, 80, 80 );
    self sethoverparams( 5, 5, var_0 );
    thread maps\gulag_aud::_id_CC9B();
}

_id_B221()
{
    for (;;)
    {
        var_0 = level.player getplayerangles();
        var_1 = anglestoforward( var_0 );
        var_2 = level.player.origin + var_1 * 180;
        var_2 = maps\_utility::set_z( var_2, level.player.origin[2] + 64 );
        var_3 = common_scripts\utility::randomvector( 0.3 );
        physicsjolt( var_2, 350, 250, var_3 );
        wait 0.5;
    }
}

_id_BB32( var_0 )
{
    wait 10.3;

    if ( distance( level.player.origin, var_0 ) > 700 )
        common_scripts\_exploder::exploder( "first_hallway_collapse" );
}

_id_BBAA( var_0 )
{
    wait 9.5;
    common_scripts\_exploder::exploder( "first_hallway_collapse" );
    common_scripts\utility::flag_set( "chase_brush_kill_volume_activates" );
}

_id_B1BF()
{
    var_0 = getent( "stumble_baddie_spawner", "targetname" );

    if ( maps\_utility::within_fov_of_players( var_0.origin, 0.7 ) )
        return;

    if ( distance( var_0.origin, level.player.origin ) < 500 )
        return;

    var_1 = var_0 stalingradspawn();
    var_1.animname = "stumble_baddie";
    var_1 thread maps\gulag_aud::_id_B02A();
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_1 maps\_utility::gun_remove();
    var_1.allowdeath = 1;
    var_1 endon( "death" );
    var_1.health = 1;
    var_1.ignoreme = 1;
    var_1.diequietly = 1;
    setsaveddvar( "ragdoll_explode_force", 0 );
    var_2 thread maps\_anim::anim_loop_solo( var_1, "idle" );
    wait 8;
    var_2 maps\_anim::anim_single_solo( var_1, "stumble" );
    var_1 kill();
}

_id_BF5F()
{
    self waittill( "trigger" );
    common_scripts\utility::play_sound_in_space( "scn_gulag_exp_trashcan_debris", self.org );
}

_id_B56C()
{
    var_0 = getentarray( "file_cabinet_anim", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_BD10 );
    var_0 = maps\_utility::array_index_by_parameters( var_0 );
    common_scripts\utility::flag_wait( "enter_final_room" );
    wait 3;
    var_0["1"] _id_CFE4( 0.2 );
    wait 0.1;
    var_0["1"] _id_CFE4( 0.1 );
    var_0["2"] _id_CFE4( 0.1 );
    wait 0.1;
    var_0["1"] _id_CFE4( 0.3 );
    var_0["2"] _id_CFE4( 0.3 );
    var_0["3"] _id_CFE4( 0.3 );
}

_id_BD10()
{
    self._id_AD5D = _id_AE6B();
    self._id_BE31 = 0;
}

_id_CFE4( var_0, var_1, var_2 )
{
    var_3 = self._id_AD5D[self._id_BE31];

    if ( !isdefined( var_3 ) )
        return;

    self._id_BE31++;

    if ( isdefined( var_1 ) )
    {
        self moveto( var_3["origin"], var_0, var_1, var_2 );
        self rotateto( var_3["angles"], var_0, var_1, var_2 );
    }
    else
    {
        self moveto( var_3["origin"], var_0 );
        self rotateto( var_3["angles"], var_0 );
    }
}

_id_C371()
{
    var_0 = getentarray( "pillar_anim", "targetname" );
    var_0 = maps\_utility::array_index_by_parameters( var_0 );
    var_1 = getent( var_0["1"].target, "targetname" );
    var_2 = getent( var_0["2"].target, "targetname" );
    var_0["1"] linkto( var_1 );
    var_0["2"] linkto( var_0["1"] );
    var_2 linkto( var_1 );
    common_scripts\utility::flag_wait( "enter_final_room" );
    wait 1;
    var_3 = getent( var_1.target, "targetname" );
    var_1 moveto( var_3.origin, 5, 1, 2 );
    var_1 rotateto( var_3.angles, 5, 1, 2 );
    wait 5;
    var_4 = getent( "pillar_rotater", "targetname" );
    var_1 linkto( var_4 );
    var_5 = getent( var_4.target, "targetname" );
    var_4 rotateto( var_5.angles, 2, 2, 0 );
    var_4 moveto( var_5.origin, 2, 2, 0 );
    wait 2;
    var_4 = getent( var_4.target, "targetname" );
    var_1 linkto( var_4 );
    var_6 = 0.75;
    var_5 = getent( var_4.target, "targetname" );
    var_4 rotateto( var_5.angles, var_6 );
    var_4 moveto( var_5.origin, var_6 );
    wait(var_6);
    var_7 = getentarray( var_5.target, "targetname" );
    var_7 = maps\_utility::array_index_by_classname( var_7 );
    var_0["2"] linkto( var_2 );
    var_2 linkto( var_7["script_origin_pillar2"] );
    var_0["1"] linkto( var_1 );
    var_1 linkto( var_7["script_origin_pillar1"] );
    var_6 = 0.4;
    var_1 unlink();
    var_1 rotateto( var_7["script_origin_pillar1"].angles, var_6 );
    var_1 moveto( var_7["script_origin_pillar1"].origin, var_6 );
    var_6 = 1.5;
    var_2 unlink();
    var_2 rotateto( var_7["script_origin_pillar2"].angles, var_6, 0, var_6 );
    var_2 moveto( var_7["script_origin_pillar2"].origin, var_6, 0, var_6 );
}

_id_BB13()
{
    var_0 = self;

    for (;;)
    {
        if ( !isdefined( var_0.target ) )
            break;

        var_1 = getent( var_0.target, "targetname" );
        var_0 delete();
        var_0 = var_1;
    }

    var_0 delete();
}

_id_AA94()
{
    ambientstop( 0.5 );
}

_id_B3D1( var_0 )
{
    if ( getdvar( "no_escape" ) == "1" )
        return;

    if ( common_scripts\utility::flag( "player_died_to_cave_in" ) )
        return;

    level.player _meth_80B5( "damage_light" );
    common_scripts\utility::flag_set( "player_died_to_cave_in" );
    level.player enabledeathshield( 0 );
    var_1 = [];
    var_1[var_1.size] = "hallway_collapsing";
    var_1[var_1.size] = "hallway_collapsing_big";
    var_1[var_1.size] = "hallway_collapsing_huge";
    var_1[var_1.size] = "hallway_collapsing_huge";
    var_2 = var_0;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = [];
    var_3[0] = 12;
    var_3[1] = 15;
    var_3[2] = 10;
    var_3[3] = 20;
    thread _id_D012();
    var_4 = level.player.origin;

    for (;;)
    {
        for ( var_5 = 0; var_5 < var_3[var_2]; var_5++ )
        {
            var_6 = level.player getplayerangles();
            var_7 = anglestoforward( var_6 );
            var_8 = level.player.origin - var_4;
            var_9 = level.player.origin + var_7 * 100 + var_8 * 10;
            var_9 = maps\_utility::set_z( var_9, level.player.origin[2] );
            var_10 = bullettrace( var_9, var_9 + ( 0.0, 0.0, 3000.0 ), 0, undefined );
            var_11 = common_scripts\utility::getfx( var_1[var_2] );
            playfx( var_11, var_10["position"] );
            var_4 = level.player.origin;

            if ( randomint( 100 ) > 40 )
            {
                var_12 = common_scripts\utility::randomvector( 20 ) + level.player.origin;

                if ( var_2 == 1 )
                    level.player dodamage( 5 / level.player.damagemultiplier, var_12 );

                if ( var_2 > 1 )
                    level.player dodamage( 15 / level.player.damagemultiplier, var_12 );

                level.player playrumblelooponentity( "damage_heavy" );
            }

            wait 0.05;
        }

        if ( var_2 == 2 )
            level.player kill();

        var_2++;

        if ( var_2 >= var_1.size )
            break;
    }
}

_id_AC79()
{
    level endon( "stop_cavein" );
    var_0 = common_scripts\utility::getfx( "player_cavein" );
    var_1 = 1.5;

    for (;;)
    {
        wait(var_1);
        playfx( var_0, level.player.origin + ( 0.0, 0.0, 60.0 ) );
        var_1 -= 0.75;

        if ( var_1 <= 0.2 )
            var_1 = 0.2;
    }
}

_id_D012()
{
    wait 4.5;
    var_0 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_0 fadeovertime( 2.5 );
    var_0.alpha = 1;
    var_0.foreground = 0;
    level waittill( "stop_cavein" );
    wait 0.05;
    var_0 destroy();
}

_id_D421()
{
    self waittill( "trigger" );
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    radiusdamage( var_0.origin + ( 0.0, 0.0, 16.0 ), 32, 500, 500, level.player );

    if ( isdefined( var_0.script_index ) )
        common_scripts\_exploder::exploder( var_0.script_index );

    wait 0.2;
    radiusdamage( var_0.origin - ( 0.0, 0.0, 16.0 ), 32, 500, 500, level.player );
}

_id_CE59()
{
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "chase_brush_kill_volume_activates" );
    maps\_utility::delaythread( 4, common_scripts\utility::flag_set, "chase_brush_kill_volume_2_activates" );
    var_0 = getent( "player_cavein_kill_volume", "targetname" );
    var_1 = getent( "player_cavein_kill_volume_later", "targetname" );

    for (;;)
    {
        if ( level.player istouching( var_0 ) || common_scripts\utility::flag( "chase_brush_kill_volume_2_activates" ) && level.player istouching( var_1 ) )
        {
            thread _id_B3D1( 2 );
            return;
        }

        wait 0.05;
    }
}

_id_C65E( var_0, var_1 )
{
    level endon( "stop_chase_fx" );
    var_2 = 6.0;
    var_3 = 16;
    var_4 = var_0;
    var_5 = var_0 + 75;
    var_6 = var_3 - var_2;
    var_7 = var_5 - var_4;
    level._id_B9AD[var_1] = [];

    for (;;)
    {
        var_8 = getaiarray( "allies" );
        var_9 = common_scripts\utility::getclosest( self.origin, var_8 );
        var_0 = distance( self.origin, var_9.origin );
        level._id_B9AD[var_1]["dist"] = var_0;
        var_0 -= var_4;
        var_10 = var_0 / var_7;

        if ( var_10 < 0 )
            var_10 = 0;
        else if ( var_10 > 1 )
            var_10 = 1;

        var_11 = var_2 + var_6 * var_10;
        level._id_B9AD[var_1]["speed"] = var_11;
        self vehicle_setspeed( var_11, 5, 5 );
        wait 0.05;
    }
}

_id_BDBF( var_0, var_1, var_2 )
{
    var_3 = var_1 * 20;

    for ( var_4 = 0; var_4 <= var_3; var_4++ )
    {
        var_5 = var_4 / var_3;
        var_6 = var_2 * var_5;

        if ( var_6 <= 0 )
            var_6 = 0.1;

        var_0 vehicle_setspeedimmediate( var_6, var_6, var_6 );
        wait 0.05;
    }

    wait(var_1);
}

_id_D2AB()
{
    if ( getdvar( "no_escape" ) == "1" )
        return;

    level notify( "collapse_fx_stop" );
    var_0 = 190;
    var_0 = 270;
    var_0 /= 19.76;
    var_0 = 6;
    var_1 = getent( "chase_brush_vehicle", "targetname" );
    var_2 = var_1 vehicle_dospawn();
    level._id_D443 = var_2;
    var_2 thread _id_CA2A();
    var_2 thread common_scripts\utility::play_loop_sound_on_entity( "scn_tunnel_collapsing_loop", undefined, 0.5, 3 );
    var_3 = getvehiclenode( var_2.target, "targetname" );
    var_2 attachpath( var_3 );
    var_2 startpath();
    var_4 = 4;
    thread _id_BDBF( var_2, var_4, var_0 );
    thread _id_CE59();
    level._id_B9AD = [];
    var_2 thread _id_C65E( 400, 1 );
    wait 3.5;
    var_5 = getent( "chase_brush", "targetname" );
    var_5 show();
    var_1 = getent( "chase_brush_vehicle", "targetname" );
    var_6 = var_1 vehicle_dospawn();
    var_6 thread _id_CB56();
    level._id_C0B5 = var_6;
    var_6 attachpath( var_3 );
    var_6 startpath();
    var_5 linkto( var_6 );
    var_6 thread _id_C65E( 900, 0 );
    level waittill( "stop_tunnel_collapsing_sfx" );
    var_2 thread common_scripts\utility::stop_loop_sound_on_entity( "scn_tunnel_collapsing_loop" );
    level waittill( "stop_chase_fx" );
    var_6 delete();
}

_id_CA2A()
{
    level endon( "stop_chase_fx" );
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_1 = common_scripts\utility::getfx( "hallway_collapsing_chase" );
    var_0 linkto( self, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, -90.0 ) );
    var_2 = 5;

    for (;;)
    {
        var_3 = self.angles;
        var_4 = anglestoforward( var_3 );
        var_2--;

        if ( var_2 <= 0 )
        {
            var_5 = common_scripts\utility::randomvector( 0.125 );
            physicsjolt( level.player.origin + var_4 * 250, 250, 250, var_5 );
            var_2 = randomint( 10 );
        }

        playfxontag( var_1, var_0, "tag_origin" );
        wait 0.1;
    }
}

_id_CB56()
{
    level endon( "stop_chase_fx" );
    black_screen();
    var_0 = 400;
    var_1 = 700;
    var_2 = abs( var_0 - var_1 );

    for (;;)
    {
        var_3 = level.player.origin;
        var_3 = maps\_utility::set_z( var_3, 0 );
        var_4 = self.origin;
        var_4 = maps\_utility::set_z( var_4, 0 );
        level._id_B5FB = distance( var_3, var_4 );
        var_5 = level._id_B5FB;
        var_6 = 1 - ( var_5 - var_0 ) / var_2;
        var_6 = clamp( var_6, 0, 1 );
        level.black_overlay.alpha = var_6;
        level.black_overlay fadeovertime( 0.2 );

        if ( var_5 < 260 )
            thread _id_B3D1( 2 );

        wait 0.1;
    }
}

black_screen( var_0 )
{
    if ( isdefined( level.black_overlay ) )
    {
        level.black_overlay destroy();
        return;
    }

    var_1 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_1.alpha = 1;
    var_1.foreground = 0;
    level.black_overlay = var_1;
}

_id_C510()
{
    common_scripts\utility::flag_wait( "rescue_begins" );
    var_0 = self.origin;
    self.origin += ( 0.0, 0.0, 300.0 );
    common_scripts\utility::flag_wait( "exit_collapses" );
    self castshadows();
    maps\_utility::script_delay();

    if ( getdvar( "no_escape" ) == "1" )
        return;

    self moveto( var_0, 1, 0.2, 0 );
    earthquake( 1.0, 4, var_0, 1000 );
}

_id_CA95()
{
    level._id_D3B7 = self.origin;
    common_scripts\utility::flag_wait( "exit_collapses" );
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    level._id_D3B7 = var_0.origin;
    common_scripts\utility::flag_clear( "friendlies_turn_corner" );
    common_scripts\utility::flag_wait( "friendlies_turn_corner" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    level._id_D3B7 = var_1.origin;
    common_scripts\utility::flag_wait( "friendlies_turn_to_cafeteria" );
    level._id_D3B7 = self.origin;
}

_id_B0AB()
{
    if ( common_scripts\utility::flag( "enter_final_room" ) )
        return;

    level endon( "enter_final_room" );
    level endon( "stop_ending_run_fx" );
    var_0 = maps\_utility::get_exploder_array( "wall_rock" );
    level._id_D57D = 3;
    level._id_CBCC = 280;
    level._id_D524 = 700;
    level._id_B0D7 = 0.8;

    foreach ( var_2 in var_0 )
    {
        var_2.flat_origin = common_scripts\utility::flat_origin( var_2.v["origin"] );
        var_2._id_D145 = 0;
    }

    for (;;)
    {
        var_4 = common_scripts\utility::flag( "exit_collapses" );
        var_0 = common_scripts\utility::array_randomize( var_0 );
        var_5 = common_scripts\utility::flat_origin( level.player.origin );
        var_6 = level.player.angles;
        var_7 = anglestoforward( var_6 );
        var_5 += var_7 * -350;
        var_8 = [];

        foreach ( var_2 in var_0 )
        {
            if ( !var_4 && var_2.v["fxid"] == "ceiling_collapse_dirt1" )
                continue;

            if ( var_2._id_D145 > gettime() - 1000 )
                continue;

            var_10 = distance( var_2.flat_origin, var_5 );

            if ( var_10 < level._id_CBCC )
                continue;

            if ( var_10 < level._id_D524 )
                continue;

            var_11 = vectornormalize( var_2.flat_origin - var_5 );
            var_12 = vectordot( var_7, var_11 );

            if ( var_12 < level._id_B0D7 )
                continue;

            var_8[var_8.size] = var_2;

            if ( var_8.size >= level._id_D57D )
                break;
        }

        foreach ( var_2 in var_8 )
        {
            var_2 common_scripts\utility::activate_individual_exploder();
            var_2._id_D145 = gettime();
            wait 0.1;
        }

        wait 0.1;
    }
}

_id_D408()
{
    common_scripts\utility::flag_wait( "enter_final_room" );
    level endon( "stop_ending_run_fx" );
    var_0 = maps\_utility::get_exploder_array( "cafe_rock" );
    level._id_BDC6 = 0.07;

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_2 in var_0 )
        {
            var_2 common_scripts\utility::activate_individual_exploder();
            wait(level._id_BDC6);
        }

        wait 0.1;
    }
}

_id_C345()
{
    level endon( "collapse_fx_stop" );
    var_0 = common_scripts\utility::getstruct( "ceiling_collapse_org", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = vectortoangles( var_1.origin - var_0.origin );
    var_3 = distance( var_0.origin, var_1.origin );
    var_4 = anglestoforward( var_2 );
    var_5 = [];
    var_5[var_5.size] = "hallway_collapsing";
    var_5[var_5.size] = "hallway_collapsing_big";
    var_5[var_5.size] = "hallway_collapsing_huge";
    maps\_utility::delaythread( 5.5, common_scripts\utility::play_sound_in_space, "scn_gulag_heli_tunnel_collapse", var_0.origin );
    thread _id_C245( var_0.origin, var_4, var_3, var_5[0], 6 );
    wait 3.5;
    thread _id_C245( var_0.origin, var_4, var_3, var_5[1], 3 );
    wait 2.5;
    thread _id_C245( var_0.origin, var_4, 0, var_5[2], 8 );
}

_id_C245( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "collapse_fx_stop" );
    var_5 = spawnstruct();
    var_5 endon( "stop" );
    var_5 maps\_utility::delaythread( var_4, maps\_utility::send_notify, "stop" );
    var_6 = common_scripts\utility::getfx( var_3 );
    var_7 = 0.5;

    for (;;)
    {
        var_8 = var_0 + var_1 * randomfloat( var_2 );
        playfx( var_6, var_8 );
        wait(var_7);
        var_7 -= 0.35;

        if ( var_7 < 0.5 )
            var_7 = 0.5;
    }
}

_id_AE6B()
{
    var_0 = self;
    var_1 = [];

    for (;;)
    {
        if ( !isdefined( var_0.target ) )
            break;

        var_0 = getent( var_0.target, "targetname" );
        var_2 = [];
        var_2["angles"] = var_0.angles;
        var_2["origin"] = var_0.origin;
        var_2["model"] = var_0;
        var_1[var_1.size] = var_2;
    }

    foreach ( var_0 in var_1 )
        var_0["model"] delete();

    return var_1;
}

_id_D46E()
{
    var_0 = getent( self.target, "targetname" );
    var_0 thread _id_CB12();
    common_scripts\utility::flag_wait( "exit_collapses" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isalive( var_1 ) )
            continue;

        if ( var_1 == level._id_B71B )
            break;
    }

    if ( common_scripts\utility::flag( "do_not_flip_box" ) )
    {
        wait 0.35;
        wait 1.7;
        common_scripts\utility::flag_set( "match_up_for_final_room" );
        return;
    }

    var_0 notify( "topple" );
    var_0 waittill( "trigger" );
    thread _id_B67F();
}

_id_CB12()
{
    var_0 = getentarray( self.target, "targetname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
        var_1[var_3.classname] = var_3;

    var_5 = var_1["script_model"];
    var_1["script_brushmodel"] linkto( var_5 );
    var_6 = var_5 _id_AE6B();
    self waittill( "topple" );
    var_5 maps\_utility::delaythread( 0.25, maps\_utility::play_sound_on_entity, "door_cargo_container_burst_open" );
    var_1["script_brushmodel"] thread _id_B536();

    foreach ( var_8 in var_6 )
    {
        var_5 moveto( var_8["origin"], 0.1 );
        var_5 rotateto( var_8["angles"], 0.1 );
        wait 0.1;
    }

    var_1["script_brushmodel"] notify( "stop_killing" );
}

_id_B536()
{
    level._id_C0B4 = self;
    self endon( "stop_killing" );

    for (;;)
    {
        if ( level.player istouching( self ) )
        {
            level.player kill();
            return;
        }

        wait 0.05;
    }
}

_id_B67F()
{
    var_0 = common_scripts\utility::getstruct( "car_slide_org", "targetname" );
    wait 0.35;
    var_0 thread maps\_anim::anim_generic( level._id_B71B, "slide_across_car" );
    wait 1.7;
    level._id_B71B maps\_utility::anim_stopanimscripted();
    common_scripts\utility::flag_set( "match_up_for_final_room" );
    setsaveddvar( "player_sprintSpeedScale", level._id_D536 );
}

_id_BDBB()
{
    var_0 = spawnstruct();
    var_1 = getent( self.target, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    var_2["ch_street_wall_light_01_on"] = "ch_street_wall_light_01_on";
    var_2["ch_street_wall_light_01_off"] = "ch_street_wall_light_01_on";
    var_3["ch_street_wall_light_01_off"] = "ch_street_wall_light_01_off";
    var_3["ch_street_wall_light_01_on"] = "ch_street_wall_light_01_off";
    var_2["com_floodlight_on"] = "com_floodlight_on";
    var_2["com_floodlight"] = "com_floodlight_on";
    var_3["com_floodlight"] = "com_floodlight";
    var_3["com_floodlight_on"] = "com_floodlight";
    var_0._id_AB80 = var_2;
    var_0._id_B862 = var_3;
    var_0.light = var_1;
    var_4 = [];
    var_4["slow_flicker"] = ::_id_B08B;
    var_0.intensity = var_1 getlightintensity();

    if ( !isdefined( self.script_parameters ) )
        thread _id_AEE8( var_0 );
    else
        thread [[ var_4[self.script_parameters] ]]( var_0 );
}

_id_AEE8( var_0 )
{
    for (;;)
    {
        var_1 = randomint( 5 ) + 2;

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            var_0.light setlightintensity( 0 );
            self setmodel( var_0._id_B862[self.model] );
            wait 0.05;
            var_0.light setlightintensity( var_0.intensity );
            self setmodel( var_0._id_AB80[self.model] );
            wait 0.05;
        }

        var_0.light setlightintensity( 0 );
        self setmodel( var_0._id_B862[self.model] );
        wait(randomfloatrange( 0.2, 0.3 ));
        var_1 = randomint( 5 ) + 2;

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            var_0.light setlightintensity( 0 );
            self setmodel( var_0._id_B862[self.model] );
            wait 0.05;
            var_0.light setlightintensity( var_0.intensity );
            self setmodel( var_0._id_AB80[self.model] );
            wait 0.05;
        }

        var_0.light setlightintensity( var_0.intensity );
        self setmodel( var_0._id_AB80[self.model] );
        wait(randomfloatrange( 0.2, 0.3 ));
    }
}

_id_B08B( var_0 )
{
    for (;;)
    {
        var_1 = randomint( 5 ) + 2;

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            var_0.light setlightintensity( 0 );
            self setmodel( var_0._id_B862[self.model] );
            wait 0.1;
            var_0.light setlightintensity( var_0.intensity );
            self setmodel( var_0._id_AB80[self.model] );
            wait 0.1;
        }

        var_0.light setlightintensity( var_0.intensity );
        self setmodel( var_0._id_AB80[self.model] );
        wait(randomfloatrange( 0.2, 0.3 ));
    }
}

_id_B3FA()
{
    var_0 = maps\_utility::get_closest_index( self.origin, level._id_A893, 32 );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = level._id_A893[var_0];
    level._id_A893[var_0] = undefined;
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_2.origin = self.origin;
    var_2.angles = self.angles;
    var_1 linkto( var_2 );
    wait 1;
    var_3 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_4 = 5;
    var_2 moveto( var_3.origin, var_4, var_4 * 0.1, var_4 * 0.1 );
    var_2 rotateto( var_3.angles, var_4, var_4 * 0.1, var_4 * 0.1 );
    var_5 = var_4 * 20;
    var_6 = var_2.origin + ( 0.0, 0.0, 32.0 );

    for ( var_7 = 0; var_7 < var_5; var_7++ )
    {
        physicsjolt( var_6, 350, 250, common_scripts\utility::randomvector( 0.05 ) );
        wait 0.05;
    }
}

_id_CC20()
{
    var_0 = getent( self.target, "targetname" );
    var_0 linkto( self );
}

_id_D147()
{
    for (;;)
    {
        wait(randomfloatrange( 3, 17 ));
        var_0 = randomintrange( 4, 8 );

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            var_2 = common_scripts\utility::randomvector( 0.18 );

            if ( var_2[2] < 0 )
                var_2 = maps\_utility::set_z( var_2, var_2[2] * -1 );

            physicsjolt( self.origin, 120, 80, var_2 );
            wait 0.05;
        }
    }
}

_id_D124()
{
    wait(randomfloatrange( 7, 20 ));
    radiusdamage( self.origin, 32, 500, 500 );
}

_id_C661()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_1 = self.angles;
    var_2 = 25;
    self setlightfovrange( 50, 25 );

    for (;;)
    {
        var_0.angles = var_1;
        var_3 = randomfloatrange( var_2 * -1, var_2 );
        var_0 addpitch( var_3 );
        var_4 = randomfloatrange( var_2 * -1, var_2 );
        var_0 addyaw( var_4 );
        self rotateto( var_0.angles, 1, 0.3, 0.3 );
        var_5 = anglestoforward( var_0.angles );
        wait 1;
    }
}

_id_AA3D()
{
    self hide();
    self setcontents( 0 );
    self.health = 50000;
    var_0 = common_scripts\utility::getstruct( "weapon_drop_org", "targetname" );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    self linkto( var_1, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    self.team = "neutral";
    self.ignoreme = 1;
    self.ignoreall = 1;
    var_2 = maps\_utility::getgenericanim( "gundrop_death" );
    var_1 maps\_anim::anim_generic_first_frame( self, "gundrop_death" );
    var_3 = level.player getcurrentweapon();
    maps\_utility::forceuseweapon( var_3, "primary" );
    wait 0.05;
    self unlink();
    level waittill( "dropit" );
    wait 0.3;
    self setanim( var_2, 1, 0, 0.55 );
    wait 0.05;
    self dropweapon( var_3, "right", 50000 );
    wait 0.3;
    var_1 delete();
    self delete();
    var_4 = common_scripts\utility::getstruct( "weapon_impact_org", "targetname" );
    maps\_utility::delaythread( 0.2, common_scripts\utility::play_sound_in_space, "physics_brick_default", var_4.origin );
    maps\_utility::delaythread( 0.2, common_scripts\utility::play_sound_in_space, "physics_brick_default", var_4.origin );
    maps\_utility::delaythread( 0.2, common_scripts\utility::play_sound_in_space, "physics_brick_default", var_4.origin );
    maps\_utility::delaythread( 0.2, common_scripts\utility::play_sound_in_space, "physics_brick_default", var_4.origin );
    maps\_utility::delaythread( 0.2, common_scripts\utility::play_sound_in_space, "physics_brick_default", var_4.origin );
}

_id_BF06( var_0 )
{
    wait 0.5;
    level.player playerlinktodelta( var_0, "tag_player", 1, 0, 0, 0, 0, 1 );
    wait 2.5;
    level.player lerpviewangleclamp( 1.0, 0.5, 0.5, 10, 10, 10, 4 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 2.5;
    level.player lerpviewangleclamp( 1.5, 0.5, 0.5, 17, 10, 12, 4 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 4.15;
    level.player lerpviewangleclamp( 1.5, 0.5, 0.5, 17, 17, 12, 2 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 8.5;
    level.player lerpviewangleclamp( 1.0, 0.5, 0.5, 0, 0, 0, 0 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_AEE7()
{
    level.forced_slowmo_breach_slowdown = 0;
}

_id_BDDA()
{
    var_0 = maps\_hud_util::create_client_overlay( "white", 0, level.player );
    var_0.alpha = 1;
    var_0 fadeovertime( 1 );
    var_0.alpha = 0;
    wait 1;
    var_0 destroy();
}

_id_B294()
{
    var_0 = maps\_hud_util::create_client_overlay( "black", 0.0, level.player );
    var_1 = maps\_hud_util::create_client_overlay( "white", 1.0, level.player );
    wait 0.3;
    var_0 fadeovertime( 0.4 );
    var_0.alpha = 0.9;
    var_1 fadeovertime( 0.9 );
    var_1.alpha = 0;
    wait 0.4;
    var_0 fadeovertime( 0.5 );
    var_0.alpha = 0;
    wait 0.5;
    var_1 destroy();
    var_0 destroy();
}

_id_B331( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1 linkto( var_0, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    thread _id_AD9D();
    var_2 = gettime();
    level._id_BDD7 = var_2;
    level.q = level._id_BDD7;
    wait 0.5;
    maps\_utility::delaythread( 0.5, ::_id_AEE7 );
    level.forced_slowmo_breach_lerpout = 2;
    maps\_utility::wait_for_buffer_time_to_pass( var_2, 2.8 );
    level notify( "dropit" );
    level.player common_scripts\utility::delaycall( 0.05, ::disableweapons );
    setsaveddvar( "ammoCounterHide", 1 );
    var_3 = 0.25;
    level.price_breach_ent unlink();
    level.player unlink();
    level.price_breach_ent rotateto( level._id_CB3B.angles, 0.5, 0.2, 0.2 );
    level.price_breach_ent notify( "stop_following_player" );
    common_scripts\utility::noself_delaycall( 0.1, ::earthquake, 1.0, 0.6, level.player.origin, 128 );
    maps\_utility::delaythread( 0.0, ::_id_B294 );
    level.player nightvisiongogglesforceoff();
    level.player playerlinktoblend( var_0, "tag_player", var_3, var_3 * 0.4, var_3 * 0.4 );
    var_0 show();
    var_4 = getent( "pricecell_stagelight", "targetname" );
    var_4 thread maps\_utility::notify_delay( "staging_on", 1 );
    maps\_utility::delaythread( var_3, ::_id_BF06, var_0 );
    level notify( "breach_concludes" );
    level.player dodamage( 50 / level.player.damagemultiplier, level.price.origin );
    maps\_utility::wait_for_buffer_time_to_pass( var_2, 6.7 );
    maps\_utility::wait_for_buffer_time_to_pass( var_2, 7.3 );
    maps\_utility::wait_for_buffer_time_to_pass( var_2, 24.6 );
    thread maps\_utility::radio_dialogue( "gulag_hqr_getout" );
}

_id_AD9D()
{
    var_0 = gettime();
    wait 4.2;
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1.origin = ( -4245.72, 1688.15, 167.671 );
    var_1.angles = ( 63.0343, 48.6473, -14.4095 );
    var_2 = [];
    var_2["tag_acog_2"] = 1;
    var_2["tag_heartbeat"] = 1;
    var_2["tag_m203"] = 1;
    var_2["tag_red_dot_mars"] = 1;
    var_2["tag_shotgun"] = 1;
    var_2["tag_silencer"] = 1;
    var_2["tag_flash_silenced"] = 1;
    var_2["tag_motion_tracker"] = 1;
    var_1 setmodel( "gulag_price_ak47" );

    foreach ( var_5, var_4 in var_2 )
    {

    }

    var_1 linkto( level.price, "tag_weapon_right", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    wait 1.4;
    maps\_utility::wait_for_buffer_time_to_pass( var_0, 11.3 );
    var_1 linkto( level.price, "tag_weapon_right", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.price waittill( "change_to_regular_weapon" );
    var_1 delete();
}

_id_C22A()
{
    var_0 = getentarray( "cafe_distance_tracker", "targetname" );
    var_1 = var_0;
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        foreach ( var_6 in var_1 )
        {
            if ( var_4 == var_6 )
                continue;

            var_7 = var_4.script_parameters;
            var_8 = var_6.script_parameters;
            var_9 = distance( var_4.origin, var_6.origin );
            var_2[var_7][var_8] = var_9;
        }
    }

    level._id_BDA3 = var_2;

    foreach ( var_13 in var_0 )
        var_13 delete();
}

_id_D0DE()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "enemy_cavein" );
    wait 0.5;

    for (;;)
    {
        radiusdamage( self.origin, 35, 10, 10 );
        wait 0.05;
    }
}

_id_C166()
{
    wait 10;
    self.interval = 64;
}

_id_B33D()
{
    if ( !isai( self ) )
        return;

    self.interval = 16;
    thread _id_C166();
    maps\_utility::ent_flag_init( "run_into_room" );
    self.ignoresuppression = 1;
    self.animplaybackrate = 1;
    self.movetransitionrate = 1;
    self.moveplaybackrate = 1;
    self.sidesteprate = 1.35;
    self pushplayer( 1 );
    self.dontavoidplayer = 1;
    maps\_utility::disable_ai_color();
    self.disablearrivals = 1;
    self.goalradius = 45;
    self.pathrandompercent = 0;
    self.walkdist = 16;
    self.walkdistfacingmotion = 16;

    if ( self.animname == "redshirt" )
    {
        self waittillmatch( "single anim", "end" );
        self.moveplaybackrate = 1.1;
        wait 1;
        self.moveplaybackrate = 1.0;
    }
}

_id_B629( var_0, var_1 )
{
    var_2 = var_1 * 20;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = var_3 / var_2;
        self.interval = var_0 * var_4;
        wait 0.05;
    }
}

_id_B6CA()
{
    var_0 = 0.3;
    var_1 = [];
    var_1[0] = var_0;
    var_1[1] = var_0;
    var_1[2] = var_0;
    var_1[3] = var_0;
    var_1[4] = var_0;
    var_2 = 0;
    var_3 = common_scripts\utility::getstruct( "glass_shatter_struct", "targetname" );

    for (;;)
    {
        radiusdamage( var_3.origin, 64, 350, 250 );
        var_4 = var_1[var_2];
        var_2++;

        if ( !isdefined( var_4 ) )
            var_4 = randomfloatrange( 0.3, 1.5 );

        wait(var_4);

        if ( !isdefined( var_3.target ) )
            return;

        var_3 = common_scripts\utility::getstruct( var_3.target, "targetname" );
    }
}

_id_A9C6()
{
    wait 4.5;
    maps\_utility::slowmo_start();
    soundscripts\_snd::snd_message( "start_evac_slomo" );
    maps\_utility::slowmo_setspeed_slow( 0.4 );
    maps\_utility::slowmo_setlerptime_in( 0.25 );
    maps\_utility::slowmo_lerp_in();
    wait 3;
    var_0 = 0.75;
    level notify( "blend_out_dof", var_0 );
    maps\_utility::slowmo_setlerptime_in( var_0 );
    maps\_utility::slowmo_lerp_out();
    soundscripts\_snd::snd_message( "stop_evac_slomo" );
    maps\_utility::slowmo_end();
}

_id_A903()
{
    var_0 = _id_D397::_id_A97A( "gulag_rock_remove" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( 60, 0.05, 0 );
    var_0 _id_D397::_id_BEA0( 1.8 ) _id_D397::_id_AC9F( 52, 1.75, 0 );
    var_0 _id_D397::_id_BEA0( 7.0 ) _id_D397::_id_A9EC( 4.5, 0 );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 3.0, -1, 64.0, 64.0, "gulag_rock_remove_dof" ) _id_D397::_id_CCA7( level.price, "tag_eye", "gulag_rock_remove_dof" ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 2.0 ) _id_D397::_id_C491( 4.8, -1, 2.0, 2.0, "gulag_rock_remove_dof" ) _id_D397::_id_CCA7( level._id_D13B, "tag_eye", "gulag_rock_remove_dof" );
    var_0 _id_D397::_id_BEA0( 5.8 ) _id_D397::_id_C491( 13, -1, 2.0, 2.0, "gulag_rock_remove_dof" ) _id_D397::_id_CCA7( level.price, "tag_eye", "gulag_rock_remove_dof" );
    var_0 _id_D397::_id_BEA0( 7.0 ) _id_D397::_id_C491( 4.8, -1, 2.0, 2.0, "gulag_rock_remove_dof" );
    var_0 _id_D397::_id_BEA0( 12.0 ) _id_D397::_id_C491( 64, -1, 0.5, 0.5, "gulag_rock_remove_dof" );
    var_0 _id_D397::_id_BEA0( 14.0 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 12.0 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 0.05 ) _id_D397::_id_B85E( 0.1, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.3 );
    var_0 _id_D397::_id_BEA0( 0.85 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BEA0( 11.95 ) _id_D397::_id_B85E( 0.08, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    thread _id_CAC3();
    var_0 _id_D397::_id_BC26();
}

_id_CAC3()
{
    wait 1.0;
    level.player lerpviewangleclamp( 2.0, 0.25, 0.25, 2, 8, 20, 2 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 10.0;
    level.player lerpviewangleclamp( 1.0, 0.25, 0.25, 0, 0, 0, 0 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_C260()
{
    self endon( "death" );
    wait(randomfloat( 3 ));
    self.diequietly = 1;
    self kill();
}

_id_AEB0()
{
    wait 0.5;
    wait 2.8;
    maps\_utility::radio_dialogue( "gulag_plp_cantsee" );
}

_id_BC41()
{
    level._id_CBCC = 0;
    level._id_D524 = 800;
    level._id_B0D7 = 0.3;
}

_id_CFB9()
{
    thread _id_C90B();
    thread _id_CB1F();
    maps\_utility::fog_set_changes( "gulag_cafe_falls_apart", 5 );
}

_id_CB1F()
{
    level notify( "stop_minor_earthquakes" );
    var_0 = gettime();
    maps\_utility::wait_for_buffer_time_to_pass( var_0, 2.9 );
    _id_ABDA( 0.3, 1.4, level._id_D13B.origin, 5000 );
    maps\_utility::wait_for_buffer_time_to_pass( var_0, 4.2 );
    thread _id_AC79();
    maps\_utility::wait_for_buffer_time_to_pass( var_0, 6.45 );
    _id_ABDA( 0.45, 4, level._id_D13B.origin, 5000 );
    wait 1;
    _id_ABDA( 0.45, 3, level.player.origin, 5000 );
}

_id_B6BD()
{
    if ( common_scripts\utility::flag( "controlled_player_rumble" ) )
        return;

    level.player endon( "death" );
    var_0 = [];
    var_0[var_0.size] = "heavy_1s";
    var_0[var_0.size] = "heavy_2s";
    var_0[var_0.size] = "heavy_1s";
    var_0[var_0.size] = "heavy_2s";
    var_0[var_0.size] = "heavy_3s";
    var_0[var_0.size] = "light_1s";
    var_0[var_0.size] = "light_2s";
    var_0[var_0.size] = "light_1s";
    var_0[var_0.size] = "light_2s";
    var_0[var_0.size] = "light_1s";
    var_0[var_0.size] = "light_2s";
    var_0[var_0.size] = "light_1s";
    var_0[var_0.size] = "light_2s";
    var_0[var_0.size] = "light_3s";
    var_0[var_0.size] = "light_3s";
    var_1 = common_scripts\utility::random( var_0 );
    var_2 = common_scripts\utility::randomvector( 1700 );
    playrumbleonposition( var_1, level.player.origin + var_2 );
}

_id_ABDA( var_0, var_1, var_2, var_3 )
{
    thread _id_B6BD();
    earthquake( var_0, var_1, var_2, var_3 );
    level notify( "swing", var_0 );
    var_4 = ( randomint( 360 ), randomint( 360 ), randomint( 360 ) );
    var_5 = anglestoforward( var_4 );
    var_3 = randomfloatrange( 500, 1000 );
    var_6 = level.player.origin + var_5 * var_3;
    thread common_scripts\utility::play_sound_in_space( "exp_artillery_underground", var_6 );
}

_id_C90B()
{
    var_0 = 7;
    var_1 = 0.01;
    var_2 = level._id_BDC6;
    var_3 = var_2 - var_1;
    var_4 = var_0 * 20;

    for ( var_5 = 0; var_5 < var_4; var_5++ )
    {
        var_6 = var_5 / var_4;
        var_6 = 1 - var_6;
        level._id_BDC6 = var_1 + var_3 * var_6;
        wait 0.05;
    }
}

_id_C0ED()
{
    wait 3;
    var_0 = getentarray( "light_destructible", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_D124 );
}

_id_B9A6()
{
    if ( common_scripts\utility::flag( "time_to_evac" ) )
        return;

    level endon( "time_to_evac" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_pushes_slab" );
        level.player disableweapons();
        common_scripts\utility::flag_waitopen( "player_pushes_slab" );
        level.player enableweapons();
    }
}

_id_B0EA()
{
    if ( level.start_point == "evac" )
        return;

    var_0 = 240;
    self connectpaths();
    self.origin += ( 0, 0, var_0 * -1 );
    var_1 = getentarray( self.target, "targetname" );
    var_1[var_1.size] = self;

    foreach ( var_3 in var_1 )
    {
        var_3 hide();
        var_3 notsolid();
    }

    if ( getdvar( "no_escape" ) == "1" )
        return;

    common_scripts\utility::flag_wait( "enter_final_room" );
    wait 4;
    common_scripts\_exploder::exploder( "cafeteria_collapse" );
    var_5 = getent( "chase_brush", "targetname" );
    var_5 unlink();
    thread _id_A8D8();

    foreach ( var_3 in var_1 )
    {
        var_3 show();
        var_3 solid();
    }

    self moveto( self.origin + ( 0, 0, var_0 ), 4, 1, 3 );
    var_5 moveto( var_5.origin + ( 0.0, 0.0, -300.0 ), 4, 2 );
    level notify( "stop_tunnel_collapsing_sfx" );
    wait 4;
    level notify( "stop_chase_fx" );
    var_5 delete();
    self disconnectpaths();
}

_id_A8D8()
{
    level endon( "stop_chase_fx" );

    for (;;)
    {
        if ( level.player istouching( self ) )
            radiusdamage( level.player.origin, 35, 10, 5 );

        wait 0.05;
    }
}

_id_D0B3()
{
    var_0 = common_scripts\utility::getfx( "gulag_cafe_spotlight" );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1 linkto( self._id_B018, "j_hanging_light_04", ( 0.0, 0.0, -32.0 ), ( 0.0, 0.0, 0.0 ) );
    playfxontag( var_0, var_1, "tag_origin" );
    common_scripts\utility::flag_wait( "time_to_evac" );
    stopfxontag( var_0, var_1, "tag_origin" );
}

_id_C75E()
{
    var_0 = maps\_utility::spawn_anim_model( "lamp" );
    var_0 thread _id_D1E8( self );
}

_id_B0FF()
{
    var_0 = maps\_utility::spawn_anim_model( "lamp_off" );
    var_0 thread _id_D1E8( self );
}

_id_D1E8( var_0 )
{
    var_0._id_B018 = self;
    self.animname = "lamp";
    self.origin = var_0.origin;
    self dontcastshadows();
    var_1 = 1;
    var_2 = [];
    var_2[0] = maps\_utility::getanim( "swing" );
    var_2[1] = maps\_utility::getanim( "swing_dup" );
    thread _id_D25B();

    for (;;)
    {
        level waittill( "swing", var_3 );
        var_4 = var_2[var_1];
        var_5 = !var_1;
        self setanimrestart( var_4, 1, 0.3, 1 );
        wait 2.5;
    }
}

_id_D25B()
{
    var_0 = common_scripts\utility::spawn_tag_origin();

    for (;;)
    {
        var_1 = randomfloatrange( -30, 30 );
        var_0 addyaw( var_1 );
        var_2 = randomfloatrange( 0.5, 1.5 );
        self rotateto( var_0.angles, var_2, var_2 * 0.4, var_2 * 0.4 );
        wait(var_2);
    }
}

_id_B05F()
{
    wait 3;
    common_scripts\utility::flag_clear( "enable_endlog_fx" );
    common_scripts\utility::flag_clear( "disable_exterior_fx" );
}

_id_CDE0( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = level.player.origin;
    var_1.angles = level.player.angles;
    wait 0.05;
    level.player playersetgroundreferenceent( var_1 );
    wait 5;
    wait 0.05;
    var_1 linktoblendtotag( var_0, "tag_player", 0 );
}

_id_B7C8( var_0 )
{
    var_1 = getent( "price_spawner", "targetname" );
    var_1.origin = var_0["price"].origin;
    var_1.angles = var_0["price"].angles;
    var_1 maps\_utility::spawn_ai();
    var_1 = getent( "endlog_soap_spawner", "targetname" );
    var_1.origin = var_0["soap"].origin;
    var_1.angles = var_0["soap"].angles;
    var_1 maps\_utility::spawn_ai();
    var_1 = getentarray( "endlog_redshirt_spawner", "targetname" )[0];
    var_1.origin = var_0["redshirt"].origin;
    var_1.angles = var_0["redshirt"].angles;
    var_1 maps\_utility::spawn_ai();
}

_id_D564()
{

}

_id_A8A1()
{
    if ( common_scripts\utility::flag( "time_to_evac" ) )
        return;

    var_0 = common_scripts\utility::randomvector( 16 );
    var_0 = maps\_utility::set_z( var_0, 80 );

    if ( level.player.health > 80 )
    {
        level.player dodamage( 15 / level.player.damagemultiplier, level.player.origin + var_0 );
        level.player playsound( "scn_gulag_player_gets_hit_by_rock" );
    }
}

_id_B231()
{
    var_0 = 2.5;
    var_1 = var_0 / 20;

    for ( var_2 = 0; var_2 <= 1; var_2 += var_1 )
    {
        level.player setmovespeedscale( var_2 );
        wait 0.05;
    }
}

_id_D551()
{
    level.player freezecontrols( 1 );
    level.player setstance( "stand" );
    var_0 = maps\_utility::spawn_anim_model( "worldbody" );
    var_0.origin = level.player getorigin();
    var_0.angles = level.player getplayerangles();
    level.player playerlinktodelta( var_0, "tag_player", 0, 0, 0, 0, 0, 0 );
    var_0 maps\_anim::anim_single_solo( var_0, "player_downed" );
    level.player unlink();
    level.player freezecontrols( 0 );
    var_0 delete();
}

_id_BAF0( var_0 )
{
    var_0[var_0.size] = level._id_B5D9;
    var_1 = getent( "escape_scripted_node", "targetname" );
    thread _id_C196();
    var_1 maps\_anim::anim_single( var_0, "escape" );
    common_scripts\utility::flag_set( "do_cafeteria_anims" );
}

_id_C196()
{
    var_0 = getent( "animated_barrel", "targetname" );
    var_1 = getent( "animated_barrel_col", "targetname" );
    var_1 linkto( var_0 );
    var_0 maps\_utility::assign_animtree( "barrel" );
    var_0 thread maps\_anim::anim_single_solo( var_0, "barrel_falling" );
    var_2 = getent( "animated_crate", "targetname" );
    var_3 = getent( "animated_crate_col", "targetname" );
    var_3 linkto( var_2 );
    var_2 maps\_utility::assign_animtree( "crate" );
    var_2 thread maps\_anim::anim_single_solo( var_2, "crate_falling" );
}
#using_animtree("player");

_id_D54C()
{
    self _meth_84C7( "h2_gulag_escapesequence_player_additive" );
    wait(getanimlength( %h2_gulag_escapesequence_player_additive ));
    self _meth_84C7( 0 );
}

_id_AEBC()
{
    var_0 = getent( "player_in_fake_sewer", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_clear( "enable_interior_fx" );
    common_scripts\utility::flag_set( "enable_endlog_fx" );
}
