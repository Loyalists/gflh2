// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

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

_id_C00A()
{
    level.price = self;
    level.price.animname = "price";
    level.price thread maps\_utility::magic_bullet_shield();
    level.price maps\_utility::cqb_walk( "on" );
    level.price allowedstances( "prone" );
    level.price maps\_utility::gun_remove();
    level.price maps\_utility::forceuseweapon( "cheytac_silencer_desert", "primary" );
}

_id_C9CF()
{
    maps\_stealth_utility::disable_stealth_system();
    waittillframeend;
    level.player maps\_utility::player_speed_percent( 100 );
    setsaveddvar( "ai_friendlyFireBlockDuration", "2000" );
    level.price.maxsightdistsqrd = 67108864;
    level.price maps\_utility::cqb_walk( "off" );
    level.price.neverenablecqb = 1;
    level.price pushplayer( 0 );
    level.price.ignoreall = 0;
    level.price.moveplaybackrate = 1.0;
    level.price.dontevershoot = undefined;
    maps\_utility::battlechatter_on( "allies" );
}

_id_D22A()
{
    level.price.dontevershoot = 1;
    level.price.baseaccuracy = 1;
    level.price.maxsightdistsqrd = level._id_BD3C;
}

_id_D319()
{
    level.price.dontevershoot = undefined;
    level.price.baseaccuracy = 5000000;
    level.price.maxsightdistsqrd = level._id_B074;
}

_id_CD41( var_0 )
{
    var_0.dontattackme = undefined;
    var_0.threatbias = 5000;
    var_0.health = 1;
    level.price.favoriteenemy = var_0;
}

_id_C55E( var_0, var_1 )
{
    level.price notify( "price_goto_node_and_wait_for_player" );
    level.price endon( "price_goto_node_and_wait_for_player" );
    thread _id_C6F7( var_0 );
    var_2 = getnode( var_0, "targetname" );
    _id_B853( var_1, var_2 );
}

_id_B853( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 150;

    if ( isdefined( var_1 ) )
    {
        while ( distance( var_1.origin, level.player.origin ) > var_0 )
            wait 0.05;
    }
    else
    {
        while ( distance( level.price.origin, level.player.origin ) > var_0 )
            wait 0.05;
    }

    level notify( "player_near_price" );
}

_id_C6F7( var_0, var_1 )
{
    level.price notify( "stop_going_to_node" );
    level.price notify( "price_goto_node" );
    level.price endon( "price_goto_node" );

    if ( !isdefined( var_1 ) )
        var_1 = 24;

    level.price.goalradius = var_1;
    var_2 = getnode( var_0, "targetname" );
    level.price setgoalnode( var_2 );
    level.price waittill( "goal" );
    level notify( "price_at_node" );
}

_id_B54D()
{
    self endon( "death" );
    self.fovcosine = 0.95;
    common_scripts\utility::flag_wait_either( "_stealth_spotted", "playerEntersBarrack" );

    if ( !isalive( self ) )
        return;

    self.fovcosine = 0.76;
}

_id_D26D()
{
    if ( common_scripts\utility::flag( "unsuppressed_weapon_warning_played" ) )
        return;

    level notify( "player_unsuppressed_weapon_warning" );
    level endon( "player_unsuppressed_weapon_warning" );
    level endon( "_stealth_spotted" );
    level endon( "steamroom_start" );

    for (;;)
    {
        wait 0.25;

        while ( isdefined( level.player_radio_emitter ) && isdefined( level.player_radio_emitter.function_stack ) && level.player_radio_emitter.function_stack.size > 0 )
            wait 0.05;

        var_0 = level.player getcurrentweapon();

        if ( var_0 != level.primaryweapon && var_0 != level.secondaryweapon && var_0 != "mp5_silencer_reflex" && var_0 != "rappel_knife" && var_0 != "none" )
            break;
    }

    common_scripts\utility::flag_set( "unsuppressed_weapon_warning_played" );
    maps\_utility::radio_dialogue( "afcaves_pri_suppressedweapon" );
}

_id_CB64()
{
    var_0 = getentarray( "player_falling_kill", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_BC17 );
}

_id_BC17()
{
    self waittill( "trigger" );

    if ( common_scripts\utility::flag( "descending" ) )
        return;

    var_0 = "player_falling_kill_in_progress";

    if ( common_scripts\utility::flag( var_0 ) )
        return;
    else
        common_scripts\utility::flag_set( var_0 );

    soundscripts\_snd::snd_message( "start_player_fall_death" );
    var_1 = 1.0;
    setomnvar( "ui_go_black", var_1 );
    wait(var_1);
    level.player kill();
}

player_falling_to_death()
{
    var_0 = getentarray( "slide_to_death_triggers", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_BFE4 );
}

_id_BFE4()
{
    level endon( "player_falling_to_death" );
    self waittill( "trigger" );
    level.player disableweapons();
    common_scripts\utility::flag_clear( "can_save" );
    level notify( "player_falling_to_death" );
}

_id_C0B0( var_0 )
{
    self.neverenablecqb = var_0;
}

set_threatbiasgroup( var_0 )
{
    self setthreatbiasgroup( var_0 );
}

_id_AAF7()
{
    self cleargoalvolume();
    self setgoalentity( level.player );
}

_id_D2EE()
{
    self.aggressivemode = 1;
    self.doorflashchance = 0.5;
}

_id_AD86()
{
    return self.type == "dog";
}

_id_B4C6( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) && !var_2 _id_AD86() )
            return 1;
    }

    return 0;
}

_id_C8E4()
{
    self endon( "death" );
    maps\_utility::cqb_walk( "on" );
    _id_B986();
}

_id_B986()
{
    playfxontag( level._effect["flashlight"], self, "tag_flash" );
    self.have_flashlight = 1;
}

detach_flashlight()
{
    killfxontag( level._effect["flashlight"], self, "tag_flash" );
    self.have_flashlight = 0;
}

_id_CC69()
{
    if ( isdefined( self.script_patroller ) )
    {
        wait 0.05;
        maps\_utility::clear_run_anim();
    }

    thread maps\_utility::enable_cqbwalk();
    self.alertlevel = "alert";
    self.disablearrivals = undefined;
    self.disableexits = undefined;
    self.moveplaybackrate = 0.8;
    thread _id_C2E0();
}

_id_C2E0()
{
    self endon( "death" );
    self endon( "enemy" );
    self endon( "end_scan_when_idle" );
    self endon( "end_patrol" );

    for (;;)
    {
        maps\_utility::set_generic_idle_anim( "cqb_stand_idle_scan" );
        self waittill( "clearing_specialIdleAnim" );
    }
}

_id_CD02( var_0 )
{
    self endon( "death" );

    while ( common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), level.price.origin, level.cosine["45"] ) )
        wait 1;

    maps\_utility::forceuseweapon( var_0, "primary" );
}

_id_B911( var_0, var_1, var_2 )
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
#using_animtree("generic_human");

_id_B8A5()
{
    thread _id_B770( "barracks_player_near_stair_shooting_spot", level );
    level endon( "barracks_player_near_stair_shooting_spot" );
    var_0 = self._id_CC9A;
    var_1 = 20;
    var_2 = 0.05;
    var_3 = "Cover Crouch";
    var_4 = var_0.angles[1];
    var_5 = var_0.origin - self.origin;
    var_6 = %covercrouch_hide_2_shufflel;
    var_7 = %covercrouch_shufflel;
    var_8 = %covercrouch_shufflel_2_hide;
    var_9 = 0.4;
    var_10 = getnotetracktimes( var_6, "finish" )[0];
    var_11 = length( getangledelta( var_6, 0, var_10 ) );
    var_12 = length( getangledelta( var_7, 0, 1 ) );
    var_13 = length( getangledelta( var_8, 0, 1 ) );
    self clearanim( %body, var_9 );
    self animmode( "zonly_physics", 0 );
    var_14 = distance( self.origin, var_0.origin );

    if ( var_14 > var_11 )
    {
        self orientmode( "face angle", var_4 );
        self setflaggedanimrestart( "shuffle_start", var_6, 1, var_9 );
        animscripts\shared::donotetracks( "shuffle_start" );
        self clearanim( var_6, 0.2 );
        var_14 -= var_11;
        var_9 = 0.2;
    }
    else
        self orientmode( "face angle", var_0.angles[1] );

    var_15 = 0;

    if ( var_14 > var_13 )
    {
        var_15 = 1;
        var_14 -= var_13;
    }

    var_16 = getanimlength( var_7 );
    var_17 = var_16 * var_14 / var_12 * 0.9;
    var_17 = floor( var_17 * var_1 ) * var_2;
    self setflaggedanim( "shuffle", var_7, 1, var_9, 0.75 );
    animscripts\notetracks::donotetracksfortime( var_17, "shuffle" );

    for ( var_18 = 0; var_18 < 2; var_18++ )
    {
        var_14 = distance( self.origin, var_0.origin );

        if ( var_15 )
            var_14 -= var_13;

        if ( var_14 < 4 )
            break;

        var_17 = var_16 * var_14 / var_12 * 0.9;
        var_17 = floor( var_17 * var_1 ) * var_2;

        if ( var_17 < 0.05 )
            break;

        animscripts\notetracks::donotetracksfortime( var_17, "shuffle" );
    }

    if ( var_15 )
    {
        var_9 = 0.2;
        self clearanim( var_7, var_9 );
        self setflaggedanim( "shuffle_end", var_8, 1, var_9 );
        animscripts\shared::donotetracks( "shuffle_end" );
    }

    self safeteleport( var_0.origin );
    self animmode( "normal" );
    self clearanim( %cover_shuffle, 0.2 );
    self.shufflemoveinterrupted = undefined;
    self animmode( "none", 0 );
    self orientmode( "face default" );
    self notify( "scripted_shuffle_done" );
    level.scr_anim[self.animname]["scripted_covercrouch_shuffle_exit"] = %covercrouch_run_out_ml;
    maps\_anim::anim_single_run_solo( self, "scripted_covercrouch_shuffle_exit" );
}

_id_B770( var_0, var_1 )
{
    self endon( "scripted_shuffle_done" );

    if ( !isdefined( var_1 ) )
        var_1 = self;

    var_1 waittill( var_0 );
    self notify( "scripted_shuffle_done" );
}

_id_AEED()
{
    if ( isdefined( self.script_parameters ) )
    {
        if ( issubstr( self.script_parameters, "difficultymedium" ) )
        {
            if ( level.gameskill > 1 )
            {
                self delete();
                return;
            }
        }
    }

    self endon( "death" );
    common_scripts\utility::flag_wait( self.script_flag );
    thread _id_C82C();
    self setcandamage( 1 );
    _id_AFED();
    self delete();
}

_id_AFED()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    self waittill( "damage" );
}

_id_C82C()
{
    self endon( "death" );
    common_scripts\utility::flag_wait_either( "_stealth_spotted", "_stealth_found_corpse" );
    self delete();
}

_id_D2C7()
{
    wait 0.2;
    level.player lerpviewangleclamp( 1, 0.5, 0.5, 45, 45, 45, 45 );
}

_id_D0E1()
{
    if ( common_scripts\utility::flag( "rappel_end" ) )
        return 1;

    return common_scripts\utility::flag( "player_braked" );
}

_id_BCD3( var_0 )
{
    level.player playersetgroundreferenceent( var_0 );
    wait 3.8;
    maps\_utility::_id_C3A2( 0.5, var_0, "tag_origin", 20, 20, 12, 12 );
    var_0 waittill( "open_fov" );
    maps\_utility::_id_C3A2( 0.5, var_0, "tag_origin", 25, 25, 15, 15 );
}

_id_BFDA()
{
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "actionSlotsHide", 1 );
    setsaveddvar( "hud_showStance", 0 );
    level.player disableweapons();
    level.player disableoffhandweapons();
    level.player disableweaponswitch();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level._id_A87F.greenberet_disabled = 1;
    var_0 = level.player getstance();
    level.player setstance( "stand" );

    if ( var_0 != "stand" )
        wait 0.5;

    var_1 = level.player getcurrentweapon();
    var_2 = "rappel_knife";
    level.player giveweapon( var_2 );
    level.player switchtoweapon( var_2 );
    var_3 = getent( "rappel_animent", "targetname" );
    var_4 = maps\_utility::spawn_anim_model( "player_rig" );
    var_4 hide();
    var_5 = maps\_utility::spawn_anim_model( "player_rig" );
    var_5 hide();
    var_5 dontcastshadows();
    var_6 = getent( "guard_assassinate", "script_noteworthy" );
    var_6 maps\_anim::anim_first_frame_solo( var_5, "rappel_kill" );
    var_7 = maps\_utility::spawn_anim_model( "rope" );
    var_7 hide();
    var_8[0] = var_4;
    var_8[1] = var_7;
    var_3 maps\_anim::anim_first_frame( var_8, "rappel_hookup" );
    level.player_rig = var_4;
    var_9 = common_scripts\utility::spawn_tag_origin();
    var_9 linkto( var_4, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_10 = 0.5;
    var_11 = common_scripts\utility::spawn_tag_origin();
    var_11.angles = level.player getplayerangles();
    var_11.origin = level.player.origin;
    level.player playerlinkto( var_11 );
    wait 0.05;
    level.player playerlinktoblend( var_9, "tag_origin", var_10, 0.2, 0.2 );
    maps\_utility::delaythread( var_10, ::_id_BCD3, var_9 );
    var_11 delete();
    maps\_utility::array_spawn_function_noteworthy( "rappel_guard_2", maps\af_caves::_id_CD0E );
    maps\_utility::array_spawn_function_noteworthy( "rappel_guard_2", maps\af_caves::_id_BFB2 );
    maps\_utility::array_spawn_function_noteworthy( "rappel_guard_2", maps\af_caves::_id_BF37 );
    maps\_utility::array_spawn_function_noteworthy( "rappel_guard_1", maps\af_caves::_id_C33A );
    maps\_utility::array_spawn_function_noteworthy( "rappel_guard_2", maps\af_caves::_id_C341 );
    maps\_utility::array_spawn_function_noteworthy( "rappel_guard_1", maps\af_caves::_id_C341 );
    var_12 = getentarray( "rappel_baddie_spawner", "targetname" );
    maps\_utility::array_spawn( var_12 );
    maps\_utility::delaythread( 6, maps\_utility::display_hint, "begin_descent" );
    var_4 common_scripts\utility::delaycall( 0.6, ::show );
    var_7 common_scripts\utility::delaycall( 0.6, ::show );
    var_4 dontcastshadows();
    common_scripts\utility::flag_set( "player_hooking_up" );
    common_scripts\_exploder::exploder( "birds_fly_rappel" );
    thread animation_dof_rappel_down( var_4 );
    var_3 maps\_anim::anim_single( var_8, "rappel_hookup" );
    var_9 notify( "open_fov" );
    common_scripts\utility::flag_set( "player_hooked_up" );
    var_4 hide();
    common_scripts\utility::flag_set( "descending" );
    var_13 = var_4 maps\_utility::getanim( "rappel_root" );
    var_4 setanim( var_13, 0, 0, 1 );
    var_14 = var_4 maps\_utility::getanim( "rappel_far" );
    var_15 = var_4 maps\_utility::getanim( "rappel_far_node" );
    var_16 = var_4 maps\_utility::getanim( "rappel_close" );
    var_17 = var_4 maps\_utility::getanim( "rappel_close_node" );
    var_18 = getstartorigin( var_3.origin, var_3.angles, var_14 );
    var_19 = getstartangles( var_3.origin, var_3.angles, var_14 );
    var_4 setanimlimited( var_16, 1, 0, 1 );
    var_4 setanimlimited( var_17, 1, 0, 1 );
    var_4 setanimlimited( var_14, 0.01, 0, 1 );
    var_4 setanimlimited( var_15, 0.01, 0, 1 );
    var_4 setanimknob( var_13, 1, 1, 1 );
    var_20 = var_4 maps\_utility::getanim( "rappel_hookup" );
    wait 0.05;
    var_4 clearanim( var_20, 0.2 );
    level.player_rig = var_4;
    var_21 = 0.3;
    var_22 = 3.5;
    var_23 = 1;
    var_24 = 0.8;
    var_25 = var_22;
    var_26 = 0.9;
    var_27 = 1.5;
    var_28 = 0.13;
    var_29 = 0.375;
    var_30 = 0.006;
    var_31 = 0.12;
    var_32 = 0.08;
    var_33 = var_32;
    var_34 = 100;
    var_35 = 0.1;
    var_36 = 0.1;
    var_37 = 50;
    var_38 = 1;
    var_39 = level.player.origin;
    var_40 = 20000;

    if ( level.gameskill >= 2 )
        var_40 = 1500;

    var_41 = 0;
    var_42 = 0;
    var_43 = 0;
    var_44 = 0;
    var_45 = 0;
    var_46 = 0;
    var_47 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_47.origin = level.player.origin;
    var_47 linkto( level.player );
    var_48 = undefined;
    var_47 playsound( "scn_afcaves_rappel_start_plr" );
    var_49 = gettime() + 1500;

    for (;;)
    {
        if ( var_4 getanimtime( var_14 ) >= 0.94 )
            common_scripts\utility::flag_set( "rappel_end" );

        var_50 = level.player adsbuttonpressed() || level.player attackbuttonpressed() && !common_scripts\utility::flag( "rappel_end" );

        if ( var_50 )
            common_scripts\utility::flag_set( "player_braked" );

        if ( common_scripts\utility::flag( "rappel_end" ) )
        {
            if ( level.player ismeleeing() )
                break;
        }

        if ( var_50 && gettime() > var_46 + 5 && gettime() > var_49 )
        {
            var_33 = var_32;
            var_23 -= var_29;

            if ( var_23 < var_21 )
                var_23 = var_21;

            var_4 setanimlimited( var_16, 1, 0, var_23 );
            var_4 setanimlimited( var_14, 1, 0, var_23 );
            var_35 -= var_38 * 3;

            if ( var_35 <= var_36 )
                var_35 = var_36;

            if ( !var_41 )
            {
                var_41 = 1;
                var_48 = undefined;
                var_43 = 90;
                var_44 = 180;
                var_42 = var_43;
                var_47 playrumbleonentity();

                if ( !common_scripts\utility::flag( "rappel_end" ) )
                    var_47 playsound( "scn_afcaves_rappel_stop_plr" );
            }
        }
        else
        {
            var_51 = var_4 getanimtime( var_14 );
            var_33 += var_30;

            if ( var_33 > var_31 )
                var_33 = var_31;

            var_23 += var_33;

            if ( var_23 > var_22 )
            {
                if ( !isdefined( var_48 ) )
                    var_48 = gettime();

                var_23 = var_22;

                if ( gettime() > var_48 + var_40 )
                {
                    if ( !common_scripts\utility::flag( "rappel_end" ) )
                    {
                        if ( var_51 >= 0.65 && var_51 < var_24 )
                        {
                            var_45 = 1;
                            break;
                        }
                    }
                }
            }

            if ( common_scripts\utility::flag( "rappel_end" ) )
            {
                var_52 = 0.15;
                var_23 = var_28 * var_52 + var_23 * ( 1 - var_52 );
            }

            var_4 setanimlimited( var_16, 1, 0, var_23 );
            var_4 setanimlimited( var_14, 1, 0, var_23 );

            if ( var_41 )
            {
                var_47 playrumbleonentity();

                if ( !common_scripts\utility::flag( "rappel_end" ) )
                    var_47 playsound( "scn_afcaves_rappel_start_plr" );

                var_46 = gettime();
                var_41 = 0;
                var_43 = 0;
                var_44 = 90;
                var_42 = var_43;
            }

            if ( !common_scripts\utility::flag( "rappel_end" ) )
            {
                var_35 += var_38;

                if ( var_35 >= var_37 )
                    var_35 = var_37;
            }
            else
            {
                var_35 -= var_38 * 3;

                if ( var_35 <= var_36 )
                    var_35 = var_36;
            }
        }

        var_4 setanimlimited( var_17, var_34, 0, var_23 );
        var_4 setanimlimited( var_15, var_35, 0, var_23 );
        var_39 = level.player.origin;
        wait 0.05;
        var_51 = var_4 getanimtime( var_14 );
        var_22 = maps\_utility::graph_position( var_51, var_24, var_25, var_26, var_27 );
        var_22 = clamp( var_22, var_27, var_25 );

        if ( var_51 >= 0.98 )
            break;
    }

    var_47 delete();
    var_53 = var_4 getanimtime( var_14 );

    if ( var_45 )
    {
        for (;;)
        {
            var_35 += var_38;
            var_34 -= var_38;
            var_23 += var_33;
            var_4 setanimlimited( var_17, var_34, 0, var_23 );
            var_4 setanimlimited( var_15, var_35, 0, var_23 );

            if ( var_4 getanimtime( var_14 ) >= 0.78 )
                break;

            wait 0.05;
        }

        var_54 = var_9.angles;
        var_54 = ( 0, var_54[1], 0 );
        var_55 = anglestoforward( var_54 );
        var_56 = anglestoup( var_54 );
        var_57 = var_55 * 750;
        var_9 unlink();
        setomnvar( "ui_go_black", 1 );
        var_9 moveslide( ( 0.0, 0.0, 0.0 ), 32, var_57 );
        thread _id_C163();
        wait 1.5;
        level.player kill();
    }
    else
    {
        for (;;)
        {
            if ( !isalive( level.player ) )
                break;

            if ( level.player ismeleeing() )
                break;

            wait 0.05;
        }

        if ( common_scripts\utility::flag( "player_failed_rappel" ) )
            return;

        wait 0.1;
        common_scripts\utility::flag_set( "player_killing_guard" );
        soundscripts\_snd::snd_message( "start_rappel_killing_guard" );

        if ( !isalive( level.player ) )
            return;

        level.player endon( "death" );
        var_58 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_58 setmodel( "weapon_parabolic_knife" );
        var_58 hide();
        var_58 dontcastshadows();
        var_58 linkto( var_5, "tag_weapon_left", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        thread maps\_utility::hint_fade();
        var_6 = getent( "guard_assassinate", "script_noteworthy" );
        var_59 = maps\_utility::get_living_ai_array( "rappel_guard_1", "script_noteworthy" );
        var_60 = var_59[0];
        var_60.animname = "guard_1";
        maps\_utility::disable_damagefeedback_hud();
        maps\_utility::disable_damagefeedback_snd();
        var_61 = [];
        var_61[0] = var_4;
        var_61[1] = var_60;
        var_60.a.nodeath = 1;
        var_5 _id_C10C( var_53 );
        var_5 show();
        var_58 show();
        var_6._id_AA0D = var_60;
        var_60 maps\_utility::gun_remove();
        thread maps\_utility::lerp_saveddvar( "sm_sunSampleSizeNear", 0.0156, 0.5 );
        maps\_utility::delaythread( 6.1, maps\_utility::lerp_saveddvar, "sm_sunSampleSizeNear", 0.25, 1 );
        thread animation_dof_rappel_kill( var_5 );
        var_6 maps\_anim::anim_single_solo( var_5, "rappel_kill" );
        common_scripts\utility::flag_clear( "descending" );
        var_5 waittillmatch( "single anim", "end" );
        var_5 moveto( var_5.origin + ( 0.0, 0.0, 12.0 ), 0.4, 0.2, 0.2 );

        if ( var_1 != level.secondaryweapon )
        {
            var_62 = level.player getweaponslistall();

            foreach ( var_64 in var_62 )
            {
                if ( var_64 == level.secondaryweapon )
                    var_1 = level.secondaryweapon;
            }
        }

        level.player playersetgroundreferenceent( undefined );
        var_58 delete();
        level._id_A87F.greenberet_disabled = undefined;
        common_scripts\utility::flag_set( "end_of_rappel_scene" );
        wait 0.8;
        soundscripts\_snd::snd_message( "end_of_rappel_sequence" );
        level.player switchtoweapon( var_1 );
        level.player unlink();
        var_5 delete();
        var_4 delete();
        maps\_utility::enable_damagefeedback_hud();
        maps\_utility::enable_damagefeedback_snd();
        setsaveddvar( "compass", 1 );
        setsaveddvar( "ammoCounterHide", 0 );
        setsaveddvar( "actionSlotsHide", 0 );
        setsaveddvar( "hud_showStance", 1 );
        setsaveddvar( "hud_drawhud", 1 );
        level.player enableoffhandweapons();
        level.player enableweaponswitch();
        level.player allowcrouch( 1 );
        level.player allowprone( 1 );
    }
}

animation_dof_rappel_down( var_0 )
{
    waitframe();
    var_1 = _id_D397::_id_A97A( "rappel_hook" );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 4.0, 500, 8, 8 ) _id_D397::_id_AF9C();
    var_1 _id_D397::_id_BEA0( 0.7 ) _id_D397::_id_C491( 4.8, -1, 8, 8 ) _id_D397::_id_CCA7( var_0, "tag_dof" ) _id_D397::_id_AE01( 1 );
    var_1 _id_D397::_id_BEA0( 8.7 ) _id_D397::_id_C491( 10.0, -1, 12, 12 ) _id_D397::_id_CCA7( level.guard1, "tag_eye" ) _id_D397::_id_AE01( 1 );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_1 thread _id_D397::_id_BC26();
    common_scripts\utility::flag_wait( "rappel_end" );
    var_1 = _id_D397::_id_A97A( "rappel_hook_end" );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 0 );
    var_1 thread _id_D397::_id_BC26();
}

animation_dof_rappel_kill( var_0 )
{
    var_1 = _id_D397::_id_A97A( "rappel_kill" );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 2.8, -1, 8, 8 ) _id_D397::_id_CCA7( var_0, "tag_dof" ) _id_D397::_id_AE01( 1 );
    var_1 _id_D397::_id_BEA0( 5.7 ) _id_D397::_id_BF3F();
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_1 _id_D397::_id_BEA0( 5.7 ) _id_D397::_id_BAE4( 0 );
    var_1 _id_D397::_id_BEA0( 0.3 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 0.65 ) _id_D397::_id_B85E( 0.1, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.25 );
    var_1 _id_D397::_id_BEA0( 1.15 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 2.35 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 3.35 ) _id_D397::_id_B85E( 0.06, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 _id_D397::_id_BEA0( 3.6 ) _id_D397::_id_B85E( 0.1, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.25 );
    var_1 _id_D397::_id_BEA0( 4.15 ) _id_D397::_id_B85E( 0.06, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 5.65 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BC26();
}

animatecavelight()
{
    var_0 = getent( "cave_wired_lights", "targetname" );
    var_0.animname = "light";
    var_0 maps\_anim::setanimtree();
    var_1 = var_0 maps\_utility::getanim( "idle" );
    var_0 setanim( var_1 );
}

_id_B11E( var_0 )
{
    var_1 = spawn( "script_origin", var_0 geteye() );
    var_1 linkto( var_0 );
    var_1 playsound( "scn_afcaves_rappel_kill_npc_dx", "sounddone" );
    var_1 waittill( "sounddone" );
    var_1 unlink();
    var_1 delete();
}

_id_C163()
{
    level notify( "new_quote_string" );
    setdvar( "ui_deadquote", &"AF_CAVES_FELL_TO_DEATH" );
    maps\_utility::missionfailedwrapper();
}

_id_C10C( var_0 )
{
    waittillframeend;
    var_1 = 0.4;
    level.player playerlinktoblend( self, "tag_player", var_1, var_1 * 0.5, var_1 * 0.5 );
    wait(var_1);
    level.player takeweapon( "rappel_knife" );
}

_id_B40B()
{
    if ( !isalive( level.player ) )
        return;

    level.player endon( "death" );
    var_0 = self.origin;
    var_1 = 0;
    var_2 = level.player.maxhealth;

    for (;;)
    {
        var_3 = self.origin - var_0;
        var_4 = length( var_3 );

        if ( var_4 < var_1 - 10 )
        {
            var_5 = common_scripts\utility::randomvector( 1000 );
            level.player dodamage( var_2 * 0.35, var_5 );
            level.player kill();
        }

        if ( var_4 > var_1 )
            var_1 = var_4;

        var_0 = self.origin;
        wait 0.05;
    }
}

_id_BD2C( var_0, var_1 )
{
    var_2 = 0;
    var_3 = self getattachsize();

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        if ( self getattachmodelname( var_4 ) != var_0 )
            continue;

        var_2 = 1;
        break;
    }

    if ( !var_2 )
        self attach( var_0, var_1 );
}

_id_ACEE()
{
    for (;;)
        wait 0.05;
}

_id_B867()
{
    var_0 = level._id_B106;
    var_1 = -50;
    var_2 = var_1 * -1;
    var_3 = 0.25;
    var_0 playsound( "door_cargo_container_push_open" );
    var_0 rotateto( var_0.angles + ( 0, var_1, 0 ), var_3 );
    var_0 waittill( "rotatedone" );
    common_scripts\utility::flag_wait( "steamroom_flash_out" );
    wait 1;
    var_0 rotateto( var_0.angles + ( 0, var_2, 0 ), var_3 );
    var_0 waittill( "rotatedone" );
}

_id_A8CC()
{
    var_0 = level._id_B106;
    var_1 = -90;
    var_2 = 0.5;
    var_0 connectpaths();
    var_0 playsound( "door_cargo_container_burst_open" );
    var_0 rotateto( var_0.angles + ( 0, var_1, 0 ), var_2 );
    var_0 waittill( "rotatedone" );
    var_0 disconnectpaths();
}

_id_D054()
{
    common_scripts\utility::array_thread( getentarray( "explodable_barrel", "targetname" ), ::_id_AFF8 );
    level thread _id_BE9E();
}

_id_AFF8()
{
    self waittill( "exploding" );
    level notify( "explosion_earthquake", self.origin );
    var_0 = self.origin + ( 0.0, 0.0, 96.0 );
    var_1 = self.origin + ( 0.0, 0.0, 1024.0 );
    var_2 = physicstrace( var_0, var_1 );

    if ( var_2 != var_1 )
    {
        var_3 = common_scripts\utility::getfx( "hallway_collapsing_big" );
        playfx( var_3, var_2 );
    }
}

_id_BE9E()
{
    var_0 = [];
    var_0[0] = "ceiling_rock_break";
    var_0[1] = "ceiling_rock_break";
    var_0[2] = "ceiling_rock_break";
    var_0[3] = "ceiling_rock_break";
    var_0[4] = "ceiling_rock_break";
    var_0[5] = "hallway_collapsing_big";
    var_0[6] = "hallway_collapsing_big";
    var_0[7] = "hallway_collapsing_big";
    var_0[8] = "hallway_collapsing_huge";
    var_0[9] = "hallway_collapsing_huge";
    var_1 = [];
    var_1[0] = ( 90.0, 154.0, 11.0 );
    var_1[1] = ( 90.0, 154.0, 11.0 );
    var_1[2] = ( 90.0, 154.0, 11.0 );
    var_1[3] = ( 90.0, 154.0, 11.0 );
    var_1[4] = ( 90.0, 154.0, 11.0 );
    var_1[5] = ( 0.0, 0.0, 0.0 );
    var_1[6] = ( 0.0, 0.0, 0.0 );
    var_1[7] = ( 0.0, 0.0, 0.0 );
    var_1[8] = ( 0.0, 0.0, 0.0 );
    var_1[9] = ( 0.0, 0.0, 0.0 );

    for (;;)
    {
        level waittill( "explosion_earthquake", var_2 );
        var_3 = var_0.size - 1;
        var_4 = 1500;
        var_5 = distance( level.player.origin, var_2 );
        var_6 = ( var_4 - var_5 ) / var_4;

        if ( var_6 < 0 )
            var_6 = 0.01;

        var_6 = int( ceil( var_3 * var_6 ) );
        var_7 = var_6 / 2.5;
        earthquake( 0.25, var_7, level.player.origin, 1024 );

        for ( var_8 = 0; var_8 <= var_6; var_8++ )
        {
            var_9 = common_scripts\utility::flat_angle( level.player.angles ) + ( 0, randomint( 80 ) - 40, 0 );
            var_10 = anglestoforward( var_9 );
            var_11 = level.player.origin + var_10 * 256 + ( 0.0, 0.0, 72.0 );
            var_12 = var_11 + ( 0.0, 0.0, 1024.0 );
            var_13 = physicstrace( var_11, var_12 );

            if ( var_13 == var_12 )
                continue;

            var_14 = var_6 - var_8;
            var_10 = anglestoforward( var_1[var_14] );
            var_15 = anglestoup( var_1[var_14] );
            var_16 = common_scripts\utility::getfx( var_0[var_14] );
            playfx( var_16, var_13, var_10, var_15 );
            wait(randomfloat( 0.5 ));
        }
    }
}

_id_D0B3()
{
    var_0 = common_scripts\utility::getfx( "gulag_cafe_spotlight" );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1 linkto( self._id_B018, "j_hanging_light_04", ( 0.0, 0.0, -64.0 ), ( 0.0, 0.0, 0.0 ) );
    playfxontag( var_0, var_1, "tag_origin" );
    common_scripts\utility::flag_wait( "sheppard_southwest" );
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

_id_C8A8()
{
    var_0 = "player_hooking_up";
    level endon( var_0 );
    thread _id_BF3C( var_0 );
    var_1 = "mus_af_caves_desertdrone";
    var_2 = maps\_utility::musiclength( var_1 );

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        maps\_utility::musicplaywrapper( var_1 );
        wait(var_2);
        maps\_utility::music_stop( 1 );
        wait 1;
    }
}

_id_BF3C( var_0 )
{
    common_scripts\utility::flag_wait( "player_hooking_up" );
    maps\_utility::music_stop( 5 );
    wait 5;
}

_id_C926()
{
    common_scripts\utility::flag_wait( "player_killing_guard" );
    var_0 = "steamroom_price_moveup_2";
    var_1 = "_stealth_spotted";
    var_2 = "mus_af_caves_stealth";
    var_3 = maps\_utility::musiclength( var_2 );
    var_4 = 7;

    while ( !common_scripts\utility::flag( var_0 ) && !common_scripts\utility::flag( var_1 ) )
    {
        maps\_utility::musicplaywrapper( var_2 );
        var_5 = gettime() + _id_BB22( var_3 );

        while ( gettime() < var_5 && !common_scripts\utility::flag( var_0 ) && !common_scripts\utility::flag( var_1 ) )
            wait 0.1;

        maps\_utility::music_stop( 1 );
        wait 1;
        var_5 = gettime() + _id_BB22( var_4 );

        while ( gettime() < var_5 && !common_scripts\utility::flag( var_0 ) && !common_scripts\utility::flag( var_1 ) )
            wait 0.1;
    }

    maps\_utility::music_stop( 1 );
    wait 1;
    maps\_utility::musicplaywrapper( "mus_af_caves_stealth_busted" );
}

_id_B3B9()
{
    setsaveddvar( "cg_cinematicFullScreen", "0" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "backdoor_barracks_tv" );
        thread tv_movie();
        common_scripts\utility::flag_waitopen( "backdoor_barracks_tv" );
        level notify( "stop_cinematic" );
        stopcinematicingame();
    }
}

tv_movie()
{
    level endon( "stop_cinematic" );

    for (;;)
    {
        cinematicingameloopresident( "af_caves_securitycams", 1.0, 1 );
        wait 5;

        while ( iscinematicplaying() )
            wait 1;
    }
}

_id_BD4D()
{
    var_0 = getent( "tv_light", "targetname" );
    var_1 = getent( "tv_screen1", "targetname" );
    maps\_utility::wait_for_targetname_trigger( "tv_trigger" );
    var_0 setlightintensity( 0 );
    var_1 delete();
}

barracks_tv_light2()
{
    var_0 = getent( "tv_light2", "targetname" );
    var_1 = getent( "tv_screen2", "targetname" );
    maps\_utility::wait_for_targetname_trigger( "tv_trigger2" );
    var_0 setlightintensity( 0 );
    var_1 delete();
    common_scripts\_exploder::kill_exploder( "start_tv_glow" );
}

_id_D260()
{
    common_scripts\utility::flag_wait( "destroy_tv" );
    wait(randomintrange( 2, 4 ));
    common_scripts\_exploder::exploder( "stealth_broken" );
    var_0 = getent( "tv_light", "targetname" );
    var_0 setlightintensity( 0 );
}

_id_C156( var_0, var_1, var_2, var_3 )
{
    var_4 = getentarray( var_0, "targetname" );
    thread _id_C681( var_4, "canyon_convoy", var_2, var_3 );
    common_scripts\utility::flag_wait( var_1 );
    _id_AEC6( "canyon_convoy" );
}

military_convoy_loop( var_0, var_1, var_2, var_3 )
{
    var_4 = getentarray( var_0, "targetname" );
    thread military_drone_vehicle_flood_start( var_4, "canyon_convoy", var_2, var_3 );
    common_scripts\utility::flag_wait( var_1 );
    _id_AEC6( "canyon_convoy" );
}

_id_C681( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "stop_drone_vehicle_flood" + var_1 );
    var_5 = undefined;

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_7 in var_0 )
        {
            var_5 = var_7 thread maps\_vehicle::spawn_vehicle_and_gopath();
            var_5 thread maps\_vehicle_code::friendlyfire_shield();
            var_5 maps\_vehicle::godon();

            if ( isdefined( var_4 ) )
                var_5 vehicle_turnengineoff();

            var_5 = undefined;
            wait(randomfloatrange( var_2, var_3 ));
        }
    }
}

military_drone_vehicle_flood_start( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "stop_drone_vehicle_flood" + var_1 );
    var_5 = [];

    foreach ( var_7 in var_0 )
        var_5[var_7.vehicletype] = var_7;

    var_9 = [];
    var_9[0] = [ var_5["latvee"], var_5["latvee"], var_5["bradley"], var_5["latvee"] ];
    var_9[1] = [ var_5["bradley"], var_5["m1a1"], var_5["m1a1"], var_5["latvee"] ];
    var_9[2] = [ var_5["latvee"], var_5["bm21_troops"], var_5["bm21_troops"], var_5["bm21_troops"], var_5["latvee"] ];
    var_10 = undefined;

    for (;;)
    {
        var_9 = common_scripts\utility::array_randomize( var_9 );

        foreach ( var_12 in var_9 )
        {
            foreach ( var_7 in var_12 )
            {
                var_10 = var_7 thread maps\_vehicle::spawn_vehicle_and_gopath();
                var_10 _meth_85C1( 0.05 );
                var_10 thread maps\_vehicle_code::friendlyfire_shield();
                var_10 maps\_vehicle::godon();

                if ( isdefined( var_4 ) )
                    var_10 vehicle_turnengineoff();

                var_10 = undefined;
                wait(randomfloatrange( var_2, var_3 ));
            }

            wait(randomintrange( 9, 14 ));
        }
    }
}

_id_AEC6( var_0 )
{
    level notify( "stop_drone_vehicle_flood" + var_0 );
}

_id_CB06( var_0 )
{
    var_1 = level.global_fx[var_0];
    return level._effect[var_1];
}

_id_B714( var_0 )
{
    if ( self istouching( var_0 ) )
        self delete();
}

_id_D270()
{
    if ( level.console && level.ps3 || !level.console )
        _func_45( 1 );
    else
        return;

    common_scripts\utility::flag_wait( "disable_half_buffer" );
    _func_45( 0 );
}

_id_B546( var_0 )
{
    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        var_0[var_1] endon( "trigger" );

    var_0[0] waittill( "trigger" );
}

_id_CD2A( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3 common_scripts\utility::trigger_off();
}

_id_C373( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        var_1 delete();
}

_id_D339( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    var_2 = [];
    var_3 = [];

    if ( isdefined( var_1.target ) )
        var_2 = getentarray( var_1.target, "targetname" );

    foreach ( var_5 in var_2 )
    {
        if ( issubstr( var_5.classname, "actor" ) )
            var_3[var_3.size] = var_5;
    }

    if ( var_3.size )
        common_scripts\utility::array_call( var_3, ::delete );

    var_1 delete();
}

_id_BB22( var_0 )
{
    return var_0 * 1000;
}

_id_AB14( var_0 )
{
    return var_0 / 1000;
}

dialogue( var_0 )
{
    var_1 = "scripted_dialogue";
    common_scripts\utility::flag_waitopen( var_1 );
    common_scripts\utility::flag_set( var_1 );
    maps\_utility::dialogue_queue( var_0 );
    common_scripts\utility::flag_clear( var_1 );
}

_id_CFDB( var_0, var_1 )
{
    _id_B8D4( var_0, var_1 );
}

_id_B8D4( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 3;

    var_2 = "";

    if ( !issubstr( var_0, ":" ) )
    {
        if ( self == level.player )
            var_2 = "Radio: ";
        else if ( self == level.price )
            var_2 = "Price: ";
    }

    var_0 = var_2 + var_0;
    var_3 = 0.5;
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
    level._id_BED3 fadeovertime( var_3 );
    level._id_BED3.alpha = 0;
    wait(var_3);
    level._id_BED3 maps\_hud_util::destroyelem();
}

_id_C3DC()
{
    if ( !isalive( level.player ) )
        return 1;

    return common_scripts\utility::flag( "player_failed_rappel" ) || common_scripts\utility::flag( "player_killing_guard" );
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

portal_group_start_point_initializer()
{
    var_0 = [ "flag_rappel_portal" ];
    var_1 = [ "flag_rappel_portal" ];
    var_2 = [ "flag_rappel_portal" ];
    var_3 = [ "flag_sneaky_cave_end_portal" ];
    var_4 = [ "flag_steam_room_start_portal", "flag_steam_room_window_portal", "flag_bridge_area_portal" ];
    var_5 = [ "flag_bridge_area_portal" ];
    var_6 = [ "flag_bridge_area_portal", "flag_combat_cave_portal" ];
    var_7 = [ "flag_combat_cave_portal", "flag_control_room_portal" ];
    var_8 = [ "flag_blown_out_camp_portal" ];

    switch ( level.start_point )
    {
        case "road":
            var_9 = var_1;
            break;
        case "rappel":
            var_9 = var_2;
            break;
        case "barracks":
            var_9 = var_3;
            break;
        case "steamroom":
            var_9 = var_4;
            break;
        case "ledge":
            var_9 = var_5;
            break;
        case "overlook":
            var_9 = var_6;
            break;
        case "control":
            var_9 = var_7;
            break;
        case "airstrip":
            var_9 = var_8;
            break;
        default:
            var_9 = var_0;
            break;
    }

    return var_9;
}

init_fx_alphathreshold()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "alphathreshold_activate" );
        common_scripts\utility::flag_clear( "alphathreshold_deactivate" );
        setsaveddvar( "fx_alphathreshold", 1 );
        common_scripts\utility::flag_wait( "alphathreshold_deactivate" );
        common_scripts\utility::flag_clear( "alphathreshold_activate" );
        setsaveddvar( "fx_alphathreshold", 0 );
    }
}

initialize_portal_flags()
{
    var_0 = portal_group_start_point_initializer();

    foreach ( var_2 in var_0 )
        common_scripts\utility::flag_set( var_2 );
}

vista_staticgroups()
{
    level endon( "death" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "vista_caves" );
        _func_31C( 2 );
        common_scripts\utility::flag_waitopen( "vista_caves" );
        _func_31B( 2 );
    }
}

rotate_fan_blade()
{
    var_0 = getent( "rotating_fan_blades", "targetname" );

    for (;;)
    {
        var_0 addpitch( 15, 1 );
        waitframe();
    }
}

scripted_anim_props( var_0, var_1 )
{
    self.animname = var_1;
    maps\_utility::assign_animtree();
    var_2 = randomint( 3 );
    maps\_utility::delaythread( var_2, maps\_anim::anim_loop_solo, self, var_0 );
}
