// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_BC5D( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    level.player setorigin( var_1.origin );
    var_2 = undefined;

    if ( isdefined( var_1.target ) )
        var_2 = getent( var_1.target, "targetname" );

    if ( isdefined( var_2 ) )
        level.player setplayerangles( vectortoangles( var_2.origin - var_1.origin ) );
    else
        level.player setplayerangles( var_1.angles );
}

_id_C27A()
{
    var_0 = 0.25;
    wait 0.1;
    anim.eventactionminwait["threat"]["self"] *= var_0;
    anim.eventactionminwait["threat"]["squad"] *= var_0;
    anim.eventactionminwait["order"]["self"] *= var_0;
    anim.eventactionminwait["order"]["squad"] *= var_0;
    anim.eventactionminwait["inform"]["self"] *= var_0;
    anim.eventactionminwait["inform"]["squad"] *= var_0;
    anim.eventtypeminwait["inform"]["reloading"] *= var_0;
    anim.eventpriority["inform"]["killfirm"] *= var_0;
    anim.eventtypeminwait["reaction"]["casualty"] *= var_0;
    anim.eventtypeminwait["reaction"]["taunt"] *= var_0;
}

_id_C2EA()
{
    self endon( "death" );
    wait 0.2;
    self.baseaccuracy = 0.6;

    if ( common_scripts\utility::flag( "cleared_favela" ) )
        return;

    switch ( level.gameskill )
    {
        case 0:
            self.baseaccuracy *= 0.8;
            self.meleechargedistsq = 10000;
            self.nextgrenadetrydelayminmax = [ 6000, 8000 ];
            break;
        case 1:
            self.baseaccuracy *= 0.75;
            self.meleechargedistsq = 15625;
            self.nextgrenadetrydelayminmax = [ 4000, 6000 ];
            break;
    }
}

_id_C6F4( var_0, var_1, var_2, var_3 )
{
    level endon( "stop_street_traffic" );
    var_4[0] = var_1;

    if ( isdefined( var_2 ) )
        var_4[1] = var_2;

    if ( isdefined( var_3 ) )
        var_4[2] = var_3;

    for (;;)
    {
        thread _id_B3E5( var_4[randomint( var_4.size )] );
        wait(var_0);
    }
}

_id_D0E6()
{
    level notify( "stop_street_traffic" );
    thread _id_D494();
}

_id_D494()
{
    var_0 = getentarray( "script_vehicle", "code_classname" );

    foreach ( var_2 in var_0 )
    {
        if ( !var_2 maps\_utility::ent_flag_exist( "dont_delete_me" ) )
            continue;

        if ( var_2 maps\_utility::ent_flag( "dont_delete_me" ) )
            continue;

        var_2 delete();
    }
}

_id_B3E5( var_0 )
{
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( var_0 );
    var_1 maps\_utility::ent_flag_init( "dont_delete_me" );
    var_1 maps\favela_aud::_id_BB79();
    var_1 waittill( "reached_end_node" );
    var_1 delete();
}

_id_B04D()
{
    var_0 = getnode( self.target, "targetname" );
    thread _id_C236();
    thread maps\_utility::follow_path( var_0, 0, ::_id_B8EB );
}

_id_C236()
{
    self endon( "death" );
    self waittill( "reached_path_end" );
    delete_ai( self );
}

delete_ai( var_0 )
{
    var_1[0] = var_0;
    level thread maps\_utility::ai_delete_when_out_of_sight( var_1, 512 );
}

_id_AB43()
{
    self.usechokepoints = 0;
    thread _id_C236();
}

_id_D053( var_0 )
{
    self endon( "death" );
    self waittill( "goal" );

    if ( isdefined( var_0 ) && var_0 )
    {
        if ( isdefined( self.magic_bullet_shield ) )
            maps\_utility::stop_magic_bullet_shield();

        self delete();
    }
    else
        delete_ai( self );
}

_id_B0B1()
{
    self endon( "death" );

    if ( isdefined( self.target ) )
        self waittill( "goal" );

    self setgoalentity( level.player );
    self.goalradius = 300;
}

_id_ACC8()
{
    self endon( "death" );

    if ( isdefined( self.target ) )
        self waittill( "goal" );

    self setgoalentity( level.player );
    self.goalradius = 1000;
}

_id_BF8B()
{
    common_scripts\utility::flag_wait( "cleared_favela" );
    var_0 = getent( "fence_dog_spawner", "targetname" );
    var_1 = var_0 stalingradspawn();
    maps\_utility::spawn_failed( var_1 );
    var_1 endon( "death" );
    var_1.animname = "dog";
    var_1 maps\_utility::ai_ignore_everything();
    var_2 = var_1.maxsightdistsqrd;
    var_1.maxsightdistsqrd = 0;
    var_1 maps\_utility::set_ignoreall( 1 );
    maps\_utility::trigger_wait( "fence_dog_gag", "targetname" );
    var_3 = getent( "fence_dog_node", "targetname" );
    var_1 setlookatentity( level.player );
    var_3 maps\_anim::anim_reach_solo( var_1, "fence_attack" );
    var_1.allowdeath = 1;
    thread _id_B297( var_1 );
    var_3 maps\_anim::anim_single_solo( var_1, "fence_attack" );
    var_1.maxsightdistsqrd = var_2;
    var_1 maps\_utility::set_ignoreall( 0 );
    var_1 thread _id_B0B1();
    wait 1;
    var_1 setlookatentity();
}

_id_C9F0()
{
    self endon( "death" );
    self addaieventlistener( "bulletwhizby" );
    self.usechokepoints = 0;
    self.interval = 0;
    self.fovcosine = 0.7;
    self.pathenemyfightdist = 512;
    common_scripts\utility::waittill_either( "damage", "bulletwhizby" );
    self.goalradius = level.default_goalradius;
    self setgoalpos( self.origin );
}

_id_C31D()
{
    self endon( "death" );

    if ( isdefined( self.script_parameters ) )
        thread _id_CB60();

    self.dontevershoot = 1;
    var_0 = getentarray( "h2_fav_windows_left_open", "targetname" );
    var_1 = getentarray( "h2_fav_windows_right_open", "targetname" );
    var_2 = common_scripts\utility::getclosest( self.origin, var_0, 100 );
    var_2.animname = "window";
    var_2 maps\_utility::assign_animtree( "window" );
    var_3 = common_scripts\utility::getclosest( self.origin, var_1, 100 );
    var_3.animname = "window";
    var_3 maps\_utility::assign_animtree( "window" );
    var_4 = _id_C2F0();
    self.goalradius = 16;
    self setgoalnode( var_4 );
    var_4 thread maps\_anim::anim_generic( self, "window_smash" );
    thread open_window( var_2, var_3, 0.1 );
    self playsound( "scn_enemy_open_shutters" );
    wait 0.3;
    self stopanimscripted();
    wait 0.3;
    self.dontevershoot = undefined;
    wait 1.0;
    self.goalradius = 75;
}

_id_C2F0()
{
    var_0 = getnodearray( "window_smash_node", "targetname" );
    var_1 = maps\_utility::get_closest_index( self.origin, var_0 );
    return var_0[var_1];
}

_id_D100()
{
    var_0 = getentarray( "window_smash", "targetname" );
    var_1 = maps\_utility::get_closest_index( self.origin + ( 0.0, 0.0, 48.0 ), var_0 );
    var_2 = var_0[var_1];
    var_3 = getentarray( var_2.target, "targetname" );
    var_4 = undefined;
    var_5 = undefined;

    foreach ( var_7 in var_3 )
    {
        if ( var_7.script_noteworthy == "left" )
        {
            var_4 = var_7;
            continue;
        }

        if ( var_7.script_noteworthy == "right" )
            var_5 = var_7;
    }

    var_9 = [];
    var_9["left"] = var_4;
    var_9["right"] = var_5;
    return var_9;
}

open_window( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        wait(var_2);

    thread common_scripts\utility::play_sound_in_space( "scn_favela_npc_open_shutters", var_0.origin );
    var_0 thread maps\_anim::anim_single_solo( var_0, "h2_fav_windows_left_open" );
    var_1 maps\_anim::anim_single_solo( var_1, "h2_fav_windows_right_open" );
}

_id_AE1B()
{
    var_0 = getent( self.target, "targetname" );
    self waittill( "trigger" );
    thread common_scripts\utility::play_sound_in_space( self.script_noteworthy, var_0.origin );
}

_id_BD53()
{
    maps\_utility::trigger_wait( "gag_civilian_window_1", "targetname" );
    var_0 = getent( "window_civilian_spawner_1", "targetname" );
    var_1 = getent( "window_shutter_r", "targetname" );
    var_2 = getent( "window_shutter_l", "targetname" );
    var_3 = var_0 maps\_utility::spawn_ai( 1 );
    var_3 endon( "death" );
    var_3.animname = "generic";
    var_2.animname = "shutter";
    var_1.animname = "shutter";
    var_2 maps\_utility::assign_animtree( "shutter" );
    var_1 maps\_utility::assign_animtree( "shutter" );
    var_4 = getent( "civilian_window_node1", "targetname" );
    var_4 maps\_anim::anim_first_frame_solo( var_3, "h2_civilian_close_shutter" );
    var_2 maps\_anim::anim_first_frame_solo( var_2, "h2_civilian_close_shutter_l" );
    var_1 maps\_anim::anim_first_frame_solo( var_1, "h2_civilian_close_shutter_r" );
    thread player_lookat_shutter_watcher( var_3 );
    thread window_guy_watcher( var_3, var_1, var_2 );
    common_scripts\utility::flag_wait( "start_shutter_anim" );
    var_1 thread maps\_anim::anim_single_solo( var_1, "h2_civilian_close_shutter_r" );
    var_2 thread maps\_anim::anim_single_solo( var_2, "h2_civilian_close_shutter_l" );
    var_4 thread maps\_anim::anim_single_solo( var_3, "h2_civilian_close_shutter" );
    var_5 = getanimlength( level.scr_anim["generic"]["h2_civilian_close_shutter"] );
    wait(var_5 - 3);
    common_scripts\utility::flag_set( "shutter_closed" );
    wait 3;
    var_6 = getnode( "window_civilian_spawner_runto_node", "targetname" );
    var_3.goalradius = 16;
    var_3 setgoalnode( var_6 );
    delete_ai( self );
    var_3 thread _id_D053();
}

_id_C9FA()
{
    self endon( "death" );
    self.ignoreme = 1;
    self waittill( "goal" );
    wait(randomfloatrange( 1.0, 2.0 ));
    self.ignoreme = 0;
}

_id_B58C( var_0 )
{
    thread maps\_utility::set_ignoreme( 1 );
    thread maps\_utility::set_ignoreall( 1 );
    thread _id_D053( var_0 );
}

_id_C8BA()
{
    if ( isdefined( level._id_D5B2 ) )
    {
        if ( isdefined( level._id_D5B2.magic_bullet_shield ) )
        {
            level._id_D5B2 maps\_utility::stop_magic_bullet_shield();
            wait 0.05;
        }

        level._id_D5B2 delete();
        level._id_D5B2 = undefined;
    }

    level._id_D5B2 = self;
    level._id_D5B2 endon( "death" );
    level._id_D5B2 maps\_utility::set_ignoreall( 1 );
    level._id_D5B2 maps\_utility::set_ignoreme( 1 );
    level._id_D5B2 thread maps\_utility::magic_bullet_shield();
    level._id_D5B2 thread _id_D123();
    level._id_D5B2 thread _id_AF38();
    level._id_D5B2 waittill( "reached_path_end" );

    if ( isdefined( level._id_D5B2.magic_bullet_shield ) )
        level._id_D5B2 maps\_utility::stop_magic_bullet_shield();

    wait 0.05;
    level._id_D5B2 delete();
    level._id_D5B2 = undefined;
}

_id_D123()
{
    self endon( "death" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "cash_trail" ), self, "J_Hip_LE" );
        wait(randomfloatrange( 0.2, 0.5 ));
    }
}

_id_AF38()
{
    self endon( "reached_path_end" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 != level.player )
            continue;

        if ( var_0 <= 1 )
            continue;

        break;
    }

    maps\_utility::stop_magic_bullet_shield();
    wait 0.05;
    self kill( self.origin, level.player );
    setdvar( "ui_deadquote", "@FAVELA_ROJAS_KILLED" );
    maps\_utility::missionfailedwrapper();
}

_id_D503()
{
    var_0 = getentarray( self.target, "targetname" );
    self waittill( "trigger" );
    var_1 = 25;

    if ( isdefined( self.script_noteworthy ) )
        var_1 = int( self.script_noteworthy );

    if ( randomint( 100 ) > var_1 )
        return;

    var_0 = common_scripts\utility::array_removeundefined( var_0 );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_C6B3()
{
    self endon( "death" );
    maps\_utility::forceuseweapon( "deserteagle", "sidearm" );
    anim.shootenemywrapper_func = animscripts\utility::shootenemywrapper_shootnotify;
    self.weapon = self.sidearm;
    self.favoriteenemy = level.player;
    self.disablearrivals = 1;
    self.disableexits = 1;
    self.animname = "desert_eagle_guy";
    self.baseaccuracy = 1;
    self.noattackeraccuracymod = 1;
    self.accuracy = 1;
    self.goalradius = 16;
    thread maps\_utility::delaythread( 3.0, maps\_utility::set_goalradius, 300 );
    thread maps\_utility::delaythread( 3.0, ::_id_C066 );
    self playsound( "generic_meleecharge_russian_" + randomintrange( 1, 8 ) );

    while ( level.player.health > 0 )
    {
        level waittill( "an_enemy_shot", var_0 );

        if ( var_0 != self )
            continue;

        for ( var_1 = 1; var_1; var_1-- )
        {
            wait 0.25;
            self shoot();
        }
    }

    self.ignoreme = 1;
}

_id_C066()
{
    if ( !isalive( self ) )
        return;

    if ( !isalive( level.player ) )
        return;

    self setgoalpos( level.player.origin );
}

_id_B761()
{
    if ( !isdefined( self.script_parameters ) )
        return;

    var_0 = strtok( self.script_parameters, ":;, " );

    foreach ( var_2 in var_0 )
    {
        var_2 = tolower( var_2 );

        if ( var_2 == "balcony" )
            self.deathfunction = ::try_balcony_death;
    }
}
#using_animtree("generic_human");

try_balcony_death()
{
    if ( !isdefined( self ) )
        return 0;

    if ( self.a.pose == "prone" )
        return 0;

    if ( !isdefined( self.prevnode ) )
        return 0;

    if ( !isdefined( self.prevnode.script_balcony ) )
        return 0;

    var_0 = self.angles[1];
    var_1 = self.prevnode.angles[1];
    var_2 = abs( var_0 - var_1 );

    if ( var_2 > 15 )
        return 0;

    var_3 = distance( self.origin, self.prevnode.origin );

    if ( var_3 > 16 )
        return 0;

    if ( !isdefined( level.last_balcony_death ) )
        level.last_balcony_death = gettime();

    var_4 = gettime() - level.last_balcony_death;

    if ( var_4 < 5000 )
        return 0;

    var_5 = [];
    var_5[0] = %h2_favela_backalleys_death_rooftop_a;
    var_5[1] = %h2_favela_backalleys_death_rooftop_b;
    var_5[2] = %h2_favela_backalleys_death_rooftop_c;
    var_5[3] = %h2_favela_backalleys_death_rooftop_d;
    self.deathanim = var_5[randomint( var_5.size )];
    return 0;
}

_id_C5B1()
{
    level endon( "runner_shot" );
    self endon( "death" );
    var_0 = undefined;
    common_scripts\utility::flag_wait( "soap_control_run_speed" );
}

_id_CFCB()
{
    var_0 = distance( self.origin, self.last_set_goalnode.origin );
    var_1 = distance( level.player.origin, self.last_set_goalnode.origin );
    var_2 = var_0 - var_1;
    var_3 = 1.0;
    var_4 = 1.5;
    var_5 = -450;
    var_6 = 0;
    var_2 = clamp( var_2, var_5, var_6 );

    if ( var_2 < var_5 )
        return var_3;

    if ( var_2 >= var_6 )
        return var_4;

    var_7 = _id_B91B( var_2, var_5, var_6 );
    var_8 = var_4 - ( var_4 - var_3 ) * var_7;
    return var_8;
}

_id_B072( var_0 )
{
    self.moveplaybackrate = var_0;
}

_id_B91B( var_0, var_1, var_2 )
{
    var_3 = abs( ( var_0 - var_1 ) / ( var_1 - var_2 ) );
    var_3 = abs( 1 - var_3 );
    var_3 = clamp( var_3, 0.0, 1.0 );
    return var_3;
}

_id_D0DB()
{
    var_0 = getentarray( self.target, "targetname" );
    self waittill( "trigger" );
    common_scripts\utility::array_thread( var_0, ::_id_C74E );
}

_id_C74E()
{
    var_0 = spawn( "script_model", self.origin );
    var_0 setmodel( level._id_CB67[randomint( level._id_CB67.size )] );
    var_1 = anglestoforward( self.angles );
    var_1 *= 2000;
    var_0 physicslaunchclient( var_0.origin + ( 0.0, 0.0, 0.0 ), var_1 );
}

_id_B02C()
{
    var_0 = getentarray( "forklift_before", "targetname" );
    var_1 = getent( "forklift_before_clip", "targetname" );
    var_2 = getentarray( "forklift_after", "targetname" );
    var_3 = getent( "forklift_after_clip", "targetname" );
    common_scripts\utility::array_call( var_2, ::hide );
    var_3 notsolid();
    common_scripts\utility::flag_wait( "block_alley" );
    common_scripts\utility::array_call( var_2, ::show );
    var_3 solid();
    common_scripts\utility::array_call( var_0, ::delete );
    var_1 delete();
}

_id_B36A()
{
    self waittill( "reached_end_node" );
    wait 1.55;
    common_scripts\utility::flag_wait( "soap_exits_car" );
    self waittill( "door_open" );
    thread maps\_utility::play_sound_on_tag( "scn_favela_player_door_open", "front_door_right_jnt" );
}

_id_B5C0()
{
    var_0 = _id_B6CC();
    var_0 thread maps\_hud_util::_id_CC64( ::_id_BA61, "Merlin", "allies" );
    // var_0 codescripts\character::setheadmodel( "h2_head_seal_soccom_e" );
    var_0 character\gfl\randomizer_tf_141::main();
    var_0 linkto( self, "tag_driver" );
    thread maps\_anim::anim_single_solo( var_0, "drive_and_die", "tag_driver" );
}

_id_BA61()
{
    var_0 = level.player geteye();
    var_1 = level.player getplayerangles();
    var_2 = self.origin + ( 0.0, 0.0, 25.0 );
    return common_scripts\utility::within_fov( var_0, var_1, var_2, cos( 25 ) );
}

_id_B6CC()
{
    var_0 = maps\_utility::spawn_targetname( "car_driver" );
    var_1 = spawn( "script_model", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 setmodel( var_0.model );
    var_1.animname = "driver";
    var_1 useanimtree( #animtree );
    var_0 delete();
    return var_1;
}

_id_B947()
{
    var_0 = getentarray( self.target, "targetname" );
    self waittill( "trigger" );

    foreach ( var_2 in var_0 )
        common_scripts\utility::array_thread( var_2 maps\_utility::get_ai_touching_volume( "axis" ), ::_id_BD19 );
}

_id_BD19()
{
    if ( isdefined( self.magic_bullet_shield ) )
        return;

    self delete();
}

bike_rider( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = getent( var_1.target, "targetname" );
    var_3 = spawn( "script_model", var_1.origin );
    var_3 setmodel( "com_bike_animated" );
    var_3 useanimtree( level.scr_animtree["bike"] );
    var_4 = spawn( "script_model", var_3.origin );
    var_4 useanimtree( #animtree );

    if ( !isdefined( level.spawned_bike_rider ) )
    {
        level.spawned_bike_rider = 1;
        var_4 _id_A471::main();
    }
    else
        var_4 _id_A473::main();

    var_4.origin = var_3 gettagorigin( "j_frame" );
    var_4.origin += ( -12.0, 0.0, -30.0 );
    var_4.angles = var_3 gettagangles( "j_frame" );
    var_4.angles += ( 0.0, 180.0, 0.0 );
    var_4 linkto( var_3, "j_frame" );
    var_5 = vectortoangles( var_1.origin - var_2.origin );
    var_3.angles = ( 0, var_5[1], 0 );
    var_3 setanim( level.scr_anim["bike"]["pedal"] );
    var_4 setanim( level.scr_anim["generic"]["bike_rider"] );
    var_6 = 10;
    var_3 moveto( var_2.origin, var_6, 0, 0 );
    wait(var_6);
    var_4 delete();
    var_3 delete();
}

_id_C842()
{
    var_0 = anglestoforward( self.angles );
    var_1 = anglestoup( self.angles );
    var_2 = self.origin;
    var_3 = undefined;

    if ( isdefined( self.target ) )
        var_3 = getent( self.target, "targetname" );

    thread _id_ACFE();

    if ( isdefined( var_3 ) )
        thread _id_D553( var_3 );

    self waittill( "fall" );
    var_4 = undefined;

    switch ( self.model )
    {
        case "com_potted_plant_small":
            var_4 = common_scripts\utility::getfx( "plant_small_thrower" );
            break;
        case "com_potted_plant_medium":
            var_4 = common_scripts\utility::getfx( "plant_medium_thrower" );
            break;
        case "com_potted_plant_large":
            var_4 = common_scripts\utility::getfx( "plant_large_thrower" );
            break;
    }

    self delete();
    playfx( var_4, var_2, var_0, var_1 );
}

_id_ACFE()
{
    self endon( "fall" );
    self setcandamage( 1 );
    self waittill( "damage" );
    self notify( "fall" );
}

_id_D553( var_0 )
{
    self endon( "fall" );
    var_0 waittill( "trigger" );
    wait(randomfloatrange( 0.0, 0.2 ));
    self notify( "fall" );
}

_id_CCE2()
{
    var_0 = self.script_noteworthy;
    var_1 = getent( self.target, "targetname" );
    var_2 = common_scripts\utility::getfx( var_0 );

    for (;;)
    {
        self waittill( "trigger" );
        playfx( var_2, var_1.origin );
        wait 1.0;
    }
}

_id_AF15()
{
    self endon( "death" );

    if ( !common_scripts\utility::flag( "civilians_walla" ) )
        return;

    wait 0.05;

    while ( self.alertlevelint <= 1 )
        wait 0.05;

    if ( !isdefined( level._id_B6BF ) )
        level._id_B6BF = 0;

    var_0 = gettime() - level._id_AA03;

    if ( var_0 < 5000 )
        return;

    level._id_AA03 = gettime();
    var_1 = level._id_BE90[level._id_B6BF];
    self.allowdeath = 1;
    thread maps\_anim::anim_generic( self, var_1 );
    level._id_B6BF++;

    if ( level._id_B6BF >= level._id_BE90.size )
        var_2 = 0;
}

_id_D31B()
{
    common_scripts\_exploder::exploder( "10" );
}

_id_C288()
{
    common_scripts\utility::flag_wait( "cleared_favela" );
    common_scripts\_exploder::exploder( "20" );
}

_id_B930( var_0 )
{
    common_scripts\_exploder::exploder( "car_crush_cash" );
    wait 0.1;
    common_scripts\_exploder::exploder( "car_crush" );
    playfxontag( common_scripts\utility::getfx( "car_crush_glass_med" ), var_0, "tag_window_left_glass_fx" );
    playfxontag( common_scripts\utility::getfx( "car_crush_glass_med" ), var_0, "tag_window_right_glass_fx" );
    playfxontag( common_scripts\utility::getfx( "car_crush_glass_large" ), var_0, "tag_windshield_back_glass_fx" );
    playfxontag( common_scripts\utility::getfx( "car_crush_glass_large" ), var_0, "tag_windshield_front_glass_fx" );
}

_id_B692( var_0 )
{
    wait 0.1;
    common_scripts\_exploder::exploder( "ending_tackling_fx" );
}

_id_B8CC( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "glass_dust_trail" ), var_0, "J_SpineLower" );
    var_0 thread maps\favela::_id_B298();
}

_id_C055()
{
    var_0 = getaiarray();

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.magic_bullet_shield ) )
            var_2 maps\_utility::stop_magic_bullet_shield();

        var_2 notify( "deleted" );
    }

    common_scripts\utility::array_call( getaiarray(), ::delete );
}

_id_B52F( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = _id_C704();
    var_4 = maps\_utility::spawn_anim_model( "curtain" );

    if ( var_1 )
        var_4 _meth_848A( ( -2176.0, -1069.0, 728.0 ) );
    else
        var_4 _meth_848A( ( -2476.0, -1744.0, 738.0 ) );

    var_3 thread maps\_anim::anim_first_frame_solo( var_4, "pulldown" );
    self waittill( "spawned", var_5 );

    if ( maps\_utility::spawn_failed( var_5 ) )
        return;

    var_5 endon( "death" );
    var_5.animname = "curtain_pull";
    var_5.disablepain = 1;
    var_5 maps\_utility::set_ignoreme( 1 );
    var_5.usechokepoints = 0;
    wait 0.05;
    var_6[0] = var_5;
    var_6[1] = var_4;
    var_3 maps\_anim::anim_reach_solo( var_5, "pulldown" );

    if ( var_0 )
    {
        var_3 maps\_anim::anim_first_frame_solo( var_5, "pulldown" );
        maps\_utility::waittill_player_lookat( 0.9, undefined, 1, 5.0 );
    }

    if ( var_2 && maps\_utility::player_looking_at( var_5 geteye(), 0.7 ) )
        return;

    var_5.allowdeath = 0;
    var_5 thread _id_C62E( 1.5 );
    var_4 thread removewooble();
    var_3 maps\_anim::anim_single( var_6, "pulldown" );
    var_5 endon( "death" );
    var_5 maps\_utility::set_ignoreme( 0 );
    var_5.goalradius = 1000;
    var_5 setgoalpos( var_5.origin );
    var_5.usechokepoints = 1;
}

removewooble()
{
    wait 1.4;
    self _meth_847B( "mtl_h2_curtain_torn01", "mc/mtl_h2_curtain_torn01_no_flag" );
}

_id_C62E( var_0 )
{
    wait(var_0);

    if ( isdefined( self ) )
        self.allowdeath = 1;
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

_id_AB28()
{
    self waittill( "trigger", var_0 );
    var_1[0] = "scn_favela_car_traffic_skid1";
    var_1[1] = "scn_favela_car_traffic_skid2";
    var_1[2] = "scn_favela_car_traffic_skid3";

    if ( !isdefined( level._id_B613 ) )
        level._id_B613 = 0;

    var_0 playsound( var_1[level._id_B613] );
    level._id_B613++;

    if ( level._id_B613 >= var_1.size )
        level._id_B613 = 0;
}

_id_AA87()
{
    var_0 = getnode( self.target, "targetname" );
    var_1 = getent( self.target, "targetname" );
    self waittill( "trigger" );
    var_2 = var_1 maps\_utility::get_ai_touching_volume( "axis" );

    foreach ( var_4 in var_2 )
    {
        var_4.goalradius = var_0.radius;
        var_4 maps\_utility::set_goal_node( var_0 );
    }
}

_id_ADA5()
{
    common_scripts\utility::flag_wait( "player_entered_favela" );

    while ( !common_scripts\utility::flag( "cleared_favela" ) )
    {
        wait 60;

        if ( common_scripts\utility::flag( "cleared_favela" ) )
            return;

        thread maps\_utility::autosave_by_name( "lower_favela" );
    }
}

_id_ADFA()
{
    self.disablepain = 1;
    self.a.nodeath = 1;
    self.health = 1000000000;
}

_id_B529()
{
    self endon( "death" );
    var_0 = 160000;
    var_1 = cos( 90 );

    for (;;)
    {
        wait 0.05;
        var_2 = distancesquared( self.origin, level.player.origin );

        if ( var_2 > var_0 )
            continue;

        var_3 = common_scripts\utility::within_fov( self.origin, self.angles, level.player.origin, var_1 );

        if ( !var_3 )
            continue;

        thread _id_B16E();
        return;
    }
}

_id_B16E()
{
    self endon( "death" );
    level.player endon( "death" );
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "makarov" );
    level.player setthreatbiasgroup( "player" );
    self setthreatbiasgroup( "makarov" );
    setthreatbias( "makarov", "player", 100000 );
    self.maxsightdistsqrd = 64000000;
    maps\_utility::set_ignoreall( 0 );
    maps\_utility::set_ignoreme( 1 );
    self.goalradius = 16;
    self setgoalpos( self.origin );
    level.player.health = 1;
    self waittill( "shooting" );
    wait 0.05;

    if ( isalive( level.player ) )
        level.player kill();
}

_id_AFD1()
{
    var_0 = getent( "soccerfield_dog1", "targetname" );
    var_1 = getent( "soccerfield_dog2", "targetname" );
    var_2 = getent( "soccerfield_dogs_wake", "targetname" );
    var_3 = var_0 stalingradspawn();
    var_4 = var_1 stalingradspawn();
    var_4._id_AEFE = 1;
    var_5 = [ var_3, var_4 ];
    thread _id_C178( var_5 );
    waitframe();

    foreach ( var_7 in var_5 )
    {
        if ( isdefined( var_7 ) && !_func_2A5( var_7 ) )
        {
            var_7 maps\_utility::ai_ignore_everything();
            var_7.animname = "dog";
        }
    }

    if ( isdefined( var_4 ) && !_func_2A5( var_4 ) )
        var_4 thread maps\_anim::anim_loop_solo( var_4, "german_shepherd_eating_loop" );

    var_2 waittill( "trigger" );

    foreach ( var_7 in var_5 )
    {
        if ( isdefined( var_7 ) && !_func_2A5( var_7 ) )
        {
            if ( isalive( var_7 ) )
            {
                if ( isdefined( var_7._id_AEFE ) && var_7._id_AEFE )
                    var_7 stopanimscripted();

                var_7 maps\_utility::ai_unignore_everything();
                var_7 thread _id_B0B1();
                var_5 = common_scripts\utility::array_remove( var_5, var_7 );
            }
        }
    }
}

_id_C178( var_0 )
{
    var_1 = 1;
    var_2 = 1;
    level endon( "dogs_dead" );

    for (;;)
    {
        if ( var_0.size == 0 )
            level notify( "dogs_dead" );

        var_3 = level.player common_scripts\utility::waittill_any_return( "weapon_fired", "grenade_fire" );

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 == "weapon_fired" )
        {
            var_4 = level.player getcurrentweapon();

            if ( var_4 == "c4" )
                continue;
        }
        else if ( var_3 == "grenade_fire" && isdefined( var_1 ) && isdefined( var_2 ) )
        {
            var_5 = level.player getcurrentoffhand();

            if ( var_5 == "flash_grenade" || var_5 == "fraggrenade" )
            {
                if ( !level.player isthrowinggrenade() )
                    continue;

                wait 1;
            }
        }

        var_6 = 0;

        foreach ( var_8 in var_0 )
        {
            if ( isalive( var_8 ) )
            {
                if ( var_8.health != var_8.maxhealth )
                    var_6 = 1;

                var_9 = common_scripts\utility::within_fov( level.player.origin, level.player.angles, var_8.origin, cos( 12 ) );
                var_10 = distance( level.player.origin, var_8.origin );

                if ( var_9 && var_10 < 800 )
                {
                    var_6 = 1;
                    break;
                }
            }
        }

        if ( var_6 )
        {
            foreach ( var_8 in var_0 )
            {
                if ( isalive( var_8 ) )
                {
                    if ( isdefined( var_8._id_AEFE ) && var_8._id_AEFE )
                        var_8 stopanimscripted();

                    var_8 maps\_utility::ai_unignore_everything();
                    var_8 thread _id_B0B1();
                    var_0 = common_scripts\utility::array_remove( var_0, var_8 );
                }
            }
        }
    }
}

_id_AD8B()
{
    var_0 = getent( "favela_dog1", "targetname" );
    var_1 = getent( "favela_dog2", "targetname" );
    var_2 = getnode( "favela_dog_end", "script_noteworthy" );
    var_3 = getent( "favela_dog_node1", "targetname" );
    var_4 = getent( "favela_dog_node2", "targetname" );
    var_5 = var_0 stalingradspawn();
    var_6 = var_1 stalingradspawn();
    var_7 = [ var_5, var_6 ];
    waitframe();

    foreach ( var_9 in var_7 )
    {
        var_9 maps\_utility::ai_ignore_everything();
        var_9.animname = "dog";
        var_9 setlookatentity( level.player );
    }

    common_scripts\utility::flag_wait( "favela_civilians_fleeing" );

    if ( isalive( var_6 ) )
        var_6 thread _id_AE0F( var_4, var_2 );

    wait 0.5;

    if ( isalive( var_5 ) )
        var_5 thread _id_AE0F( var_3, var_2 );
}

_id_AE0F( var_0, var_1 )
{
    self endon( "death" );
    self.allowdeath = 1;
    var_0 maps\_anim::anim_single_solo( self, "fence_attack" );
    thread maps\_utility::follow_path( var_1 );
    thread _id_C236();
}

_id_C445()
{
    var_0 = getent( "soccer_origin", "script_noteworthy" );

    if ( isdefined( self.script_noteworthy ) )
    {
        var_1 = self stalingradspawn();
        var_1 endon( "death" );
        var_1.alertlevel = "noncombat";
        var_2 = self;
        waitframe();

        if ( isalive( var_1 ) )
        {
            var_1.animname = "civilian_custom";
            var_0 thread _id_B860( var_1, var_2.script_noteworthy );
            var_0 thread maps\_anim::anim_single_solo( var_1, var_2.script_noteworthy );
            _id_B91C( var_1 );
        }
    }
}

_id_B860( var_0, var_1 )
{
    var_0 endon( "death" );
    self waittill( var_1 );
    var_0.alertlevel = "combat";
}

_id_B757()
{
    var_0 = getent( "favela_soccerball_2", "targetname" );
    var_0.noragdoll = 1;
    var_0.animname = "soccerball";
    var_0 maps\_utility::assign_animtree( "soccerball" );
    var_1 = getent( "soccer_origin", "script_noteworthy" );
    var_1 thread maps\_anim::anim_single_solo( var_0, "soccerball_single_guy" );
    level common_scripts\utility::waittill_either( "single_soccerball", "favela_civilians_fleeing" );
    var_0 stopanimscripted();
    var_0 physicslaunchclient();
}

_id_BC0B()
{
    var_0 = getent( "favela_soccerball_1", "targetname" );
    var_0.noragdoll = 1;
    var_0.animname = "soccerball";
    var_0 maps\_utility::assign_animtree( "soccerball" );
    var_1 = getent( "soccer_origin", "script_noteworthy" );
    var_1 thread maps\_anim::anim_single_solo( var_0, "soccerball_for_guys" );
    level common_scripts\utility::waittill_either( "multi_soccerball", "favela_civilians_fleeing" );
    var_0 stopanimscripted();
    var_0 physicslaunchclient();
}

_id_B91C( var_0 )
{
    var_0 waittill( "combat" );
    common_scripts\utility::flag_set( "favela_civilians_fleeing" );
    wait(randomfloat( 1.5 ));
    var_0 stopanimscripted();
    var_0.usechokepoints = 1;
    var_1 = getnode( "favela_civ_flee_node_opening", "targetname" );
    var_0 thread maps\_utility::follow_path( var_1, 0, ::_id_B8EB );
    var_0 thread _id_C236();
}

_id_B8EB( var_0 )
{
    if ( !isdefined( var_0.targetname ) || var_0.targetname != "favela_civ_flee_node" )
        return;

    self endon( "death" );
    self endon( "traverse_finish" );
    var_1 = var_0.targetname;

    if ( !isdefined( level._id_C7FA ) )
        level._id_C7FA = [];

    if ( !isdefined( level._id_C7FA[var_1] ) )
        level._id_C7FA[var_1] = _id_CFDE( [ "queue_flee_left_begin", "queue_flee_right_begin" ] );

    self.goalradius = 10;
    var_2 = _id_B6B0( level._id_C7FA[var_1] );
    thread _id_AD06( level._id_C7FA[var_1] );
    _id_AC07( var_2 );
}

_id_AC07( var_0 )
{
    _id_D435( var_0 );

    for (;;)
    {
        var_0 = _id_D4BF( var_0 );

        if ( !isdefined( var_0.next ) )
        {
            _id_CAD3( var_0 );
            return;
        }
    }
}

_id_AD06( var_0 )
{
    level notify( "queue_node_cleaner" );
    level endon( "queue_node_cleaner" );

    for (;;)
    {
        var_1 = 0;

        foreach ( var_3 in var_0.begin )
        {
            for (;;)
            {
                if ( isdefined( var_3.owner ) )
                {
                    var_1 = 1;

                    if ( !isalive( var_3.owner ) )
                        var_3.owner = undefined;
                }

                if ( !isdefined( var_3.next ) )
                    break;

                var_3 = var_3.next;
            }
        }

        wait 1;

        if ( !var_1 )
            return;
    }
}

_id_D4BF( var_0 )
{
    if ( !isdefined( var_0.next ) )
        return var_0;

    _id_BF6C( var_0.next );
    _id_CAD3( var_0 );
    _id_D435( var_0.next );
    return var_0.next;
}

_id_BF6C( var_0 )
{
    while ( isdefined( var_0.owner ) )
        wait(randomfloat( 1 ));

    var_0.owner = self;
    wait 0.05;

    if ( var_0.owner != self )
        _id_BF6C( var_0 );
}

_id_D435( var_0 )
{
    self setgoalpos( var_0.origin );

    while ( distance2dsquared( self.origin, var_0.origin ) > 6400 )
        wait 0.05;
}

_id_CAD3( var_0 )
{
    var_0.owner = undefined;
}

_id_B6B0( var_0 )
{
    var_1 = var_0.begin[_id_ACD1( var_0 )];

    for (;;)
    {
        if ( !isdefined( var_1.next ) )
        {
            if ( !isdefined( var_1.owner ) )
            {
                var_1.owner = self;
                return var_1;
            }

            break;
        }

        if ( isdefined( var_1.next.owner ) )
        {
            var_1.owner = self;
            return var_1;
        }

        var_1 = var_1.next;
    }

    self setgoalpos( self.origin );
    wait(randomint( 2 ));
    return _id_B6B0( var_0 );
}

_id_ACD1( var_0 )
{
    var_1 = var_0._id_BF8E;
    var_0._id_BF8E = common_scripts\utility::mod( var_0._id_BF8E + 1, var_0.begin.size );
    return var_1;
}

_id_CFDE( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_BF8E = 0;
    var_2 = [];

    foreach ( var_4 in var_0 )
        var_2 = common_scripts\utility::array_combine( var_2, getnodearray( var_4, "targetname" ) );

    var_1.begin = [];
    var_6 = [];

    foreach ( var_8 in var_2 )
    {
        var_9 = getnode( var_8.target, "targetname" );
        var_10 = spawnstruct();
        var_1.begin = common_scripts\utility::add_to_array( var_1.begin, var_10 );

        for (;;)
        {
            var_10.name = var_9.targetname;
            var_10.origin = var_9.origin;
            var_10.owner = undefined;
            var_6[var_9.targetname] = var_10;

            if ( !isdefined( var_9.target ) )
                break;

            var_11 = var_6[var_9.target];

            if ( isdefined( var_11 ) )
            {
                var_10.next = var_11;
                break;
            }

            var_9 = getnode( var_9.target, "targetname" );
            var_10.next = spawnstruct();
            var_10 = var_10.next;
        }
    }

    return var_1;
}

_id_B2E3( var_0, var_1 )
{
    self.animname = var_0;
    maps\_utility::set_run_anim( var_1 );
}

intro_player()
{
    level endon( "exiting_vehicle" );
    self.animname = "player_rig";
    maps\_anim::anim_single_solo( self, "intro", "tag_passenger" );
    wait(getanimlength( level.scr_anim["player_rig"]["intro"] ));
}

_id_CB60()
{
    self.grenadeawareness = 0;
    self.dontmelee = 1;
    self.animname = "enemy_death";
    var_0 = getnode( self.script_parameters, "targetname" );
    thread maps\_utility::magic_bullet_shield( 1 );
    self waittill( "damage", var_1, var_2, var_3 );
    self.noragdoll = undefined;
    var_4 = anglestoforward( self gettagangles( "tag_eye" ) );
    var_5 = var_0.origin - self.origin;
    var_4 = ( var_4[0], var_4[1], 0 );
    var_5 = ( var_5[0], var_5[1], 0 );
    var_4 = vectornormalize( var_4 );
    var_5 = vectornormalize( var_5 );
    var_6 = vectordot( var_4, var_5 );

    if ( var_6 > 0.9 || self.script_parameters == "window_fall_anim" )
    {
        switch ( self.script_parameters )
        {
            case "window_anim":
                self.deathanim = %h2_favela_backalleys_death_window_b;
                self.skipdeathsound = 1;
                thread _id_BAB1( var_0 );
                self.damageshield = 0;
                self.specialdeathfunc = ::_id_ABBA;
                self kill( var_3, var_2 );
                break;
            case "window_fall_anim":
                if ( getdvar( "ragdoll_enable" ) != "0" )
                {
                    self.deathanim = undefined;
                    self.skipdeathsound = 1;
                    var_0 thread maps\_anim::anim_single_solo( self, "enemy_window_death_a" );
                    thread _id_BAB1( var_0 );
                    wait(getanimlength( %h2_favela_backalleys_death_window_a ) - 0.05);
                    self.specialdeathfunc = ::_id_ABBA;
                }

                self.damageshield = 0;
                self kill( self.origin, var_2 );
                break;
        }
    }

    if ( isalive( self ) )
        maps\_utility::stop_magic_bullet_shield();
}

_id_ABBA()
{
    var_0 = "_large";
    var_1 = "dirt";
    var_2 = self.origin + ( 0.0, 0.0, 30.0 );
    var_3 = bullettrace( var_2, var_2 - ( 0.0, 0.0, 500.0 ), 0, self );

    if ( var_3["surfacetype"] != "none" )
        var_1 = var_3["surfacetype"];

    var_4 = "bodyfall_" + var_1 + var_0;

    if ( !soundexists( var_4 ) )
        var_4 = "bodyfall_default" + var_0;

    thread common_scripts\utility::play_sound_in_space( var_4, self.origin );
    return 1;
}

_id_BAB1( var_0 )
{
    var_1 = 0.25;
    var_2 = 0;

    while ( var_2 != var_1 )
    {
        var_3 = vectorlerp( self.angles, var_0.angles, var_2 / var_1 );
        self teleport( self.origin, var_3 );
        var_2 += 0.05;
        waitframe();
    }
}

_id_A8EA( var_0, var_1 )
{
    if ( self.dist < var_1 )
    {
        if ( self.run_speed_state == "sprint" )
            return;

        self.run_speed_state = "sprint";
        maps\_utility::clear_run_anim();

        if ( self.moveplaybackrate < self._id_AB84 )
            self.moveplaybackrate = self._id_AB84;
    }
    else if ( self.dist < var_0 )
    {
        if ( self.run_speed_state == "run" )
            return;

        self.run_speed_state = "run";
        maps\_utility::clear_run_anim();
        self.moveplaybackrate = 1;
    }
    else if ( self.dist < var_0 * 2 )
    {
        if ( self.run_speed_state == "jog" )
            return;

        self.run_speed_state = "jog";
        maps\_utility::clear_run_anim();

        if ( self.moveplaybackrate > self._id_CCDF )
            self.moveplaybackrate = self._id_CCDF;
    }
}

_id_C2F6( var_0, var_1, var_2, var_3, var_4 )
{
    level._id_D13B endon( "death" );
    level endon( "stop_monitoring_makarov_damage" );
    common_scripts\utility::flag_wait( "soap_exits_car" );
    self notify( "stop_dynamic_run_speed" );
    self endon( "stop_dynamic_run_speed" );
    self.oldwalkdist = self.walkdist;
    self.old_moveplaybackrate = self.moveplaybackrate;
    self.run_speed_state = "run";
    self.oldanimname = self.animname;
    self.dist = 0;

    if ( !isdefined( var_1 ) )
        var_1 = var_0 * 0.5;

    self._id_CD9C = 150;
    self._id_CC1C = 75;

    if ( isdefined( var_2 ) )
        self._id_AB84 = var_2;
    else
        self._id_AB84 = 1.35;

    self._id_CCDF = 0.85;

    for (;;)
    {
        wait 0.05;
        self.dist = distance( self.origin, level.player.origin );
        _id_A8EA( var_0, var_1 );
    }
}

_id_BBE9( var_0, var_1 )
{
    var_2 = int( getdvar( "g_speed" ) );
    var_3 = var_0;

    if ( !isdefined( level.player.g_speed ) )
        level.player.g_speed = var_2;

    var_4 = var_3 - var_2;
    var_5 = 0.05;
    var_6 = var_1 / var_5;
    var_7 = var_4 / var_6;
    var_8 = abs( var_7 * 1.1 );

    while ( abs( var_3 - var_2 ) > var_8 )
    {
        var_2 += var_7;
        setsaveddvar( "g_speed", int( var_2 ) );
        wait(var_5);
    }

    setsaveddvar( "g_speed", var_3 );
}

_id_C83B( var_0 )
{
    if ( !isdefined( level.player.g_speed ) )
        return;

    _id_BBE9( level.player.g_speed, var_0 );
    level.player.g_speed = undefined;
}

_id_AF21( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            return var_0;
    }

    var_5 = [];

    foreach ( var_8, var_7 in var_5 )
    {
        if ( var_8 == var_0 )
            return var_7;
    }

    switch ( weaponclass( var_0 ) )
    {
        case "mg":
            var_9 = "rpd";
            break;
        case "pistol":
            var_9 = "beretta";
            break;
        case "rifle":
            var_9 = "masada_grenadier_acog";
            break;
        case "smg":
            var_9 = "mp5";
            break;
        case "sniper":
            var_9 = "dragunov";
            break;
        case "spread":
            var_9 = "m1014";
            break;
        default:
            var_9 = var_0;
            break;
    }

    return var_9;
}

_id_CE80()
{
    var_0 = maps\_utility::getallweapons();

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( var_2.classname, "_akimbo" ) )
            var_2 delete();
    }
}

_id_B297( var_0 )
{
    if ( isalive( var_0 ) )
    {
        var_1 = getent( "doggy_fence", "targetname" );
        var_1 maps\_utility::assign_animtree( "fence" );
        var_1 thread maps\_anim::anim_single_solo( var_1, "fence_shake" );
        var_0 common_scripts\utility::waittill_notify_or_timeout( "death", 10 );
        var_1 stopanimscripted();
    }
}

_id_C155( var_0 )
{
    maps\_utility::assign_animtree( var_0 );
    var_1 = level.scr_anim[self.animname]["flag_idle"];

    for (;;)
    {
        var_2 = randomint( var_1.size );
        self setanim( var_1[var_2] );
        wait(getanimlength( var_1[var_2] ));
    }
}

_id_A8E1()
{
    var_0 = [ "crazy01", "crazy02", "pecking", "seated" ];
    var_1 = [ "death01", "death02" ];
    var_2 = [ "h1_mwr_chicken", "h1_mwr_chicken_black_white", "h1_mwr_chicken_white" ];
    self setmodel( common_scripts\utility::random( var_2 ) );
    var_3 = common_scripts\utility::random( var_0 );
    var_4 = common_scripts\utility::random( var_1 );
    maps\_utility::assign_animtree( "chicken_anim" );
    thread maps\_anim::anim_loop_solo( self, var_3 );
    thread common_scripts\utility::play_loop_sound_on_entity( "animal_chicken_idle_loop" );
    var_5 = getent( self.target, "targetname" );
    var_5 setcandamage( 1 );
    var_5 waittill( "damage" );
    var_5 delete();
    thread common_scripts\utility::stop_loop_sound_on_entity( "animal_chicken_idle_loop" );
    thread maps\_utility::play_sound_on_entity( "animal_chicken_death" );
    maps\_anim::anim_single_solo( self, var_4 );
    wait 30;
    self delete();
}

_id_AAD2()
{
    level waittill( "shootout_started" );
    wait 5.6;

    if ( !common_scripts\utility::flag( "player_is_ducking" ) )
    {
        var_0 = 90;
        var_1 = [ "+stance", "+togglecrouch" ];
        var_2 = !level.player common_scripts\utility::is_player_gamepad_enabled();
        maps\_utility::_id_BD5A( &"FAVELA_DUCK_HINT", &"FAVELA_DUCK_HINT_KEYBOARD", var_0, var_2, var_1 );

        if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
            level.player._id_B1FD thread common_scripts\utility::_id_BAF1( level.player, &"FAVELA_DUCK_HINT", &"FAVELA_DUCK_HINT_KEYBOARD", "player_is_ducking" );
        else
            level.player._id_B1FD thread common_scripts\utility::_id_BAF1( level.player, &"FAVELA_DUCK_HINT_KEYBOARD", &"FAVELA_DUCK_HINT", "player_is_ducking" );

        if ( !level.player common_scripts\utility::is_player_gamepad_enabled() || maps\_utility::_id_C55C( var_1 ) )
        {
            level thread maps\_utility::_id_BD6E( "player_is_ducking" );
            level.player thread maps\_utility::_id_BD6E( "shot_next_frame", "death" );
            maps\_utility::_id_AAA6();
        }
        else
        {
            level thread maps\_utility::_id_BA76( "player_is_ducking" );
            level.player thread maps\_utility::_id_CBD8( "shot_next_frame", "death" );
            maps\_utility::_id_B55D();
        }
    }
}

_id_CF5F()
{
    var_0 = getent( "destroyed_tanker", "targetname" );
    var_1 = getent( "tanker_explosion", "targetname" );
    var_1 waittill( "trigger" );
    wait 0.5;
    common_scripts\_exploder::exploder( "30" );
    maps\favela_aud::_id_D571();
}

_id_D08B( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
        var_3 hide();

    var_0 maps\_anim::anim_single( var_1, "opening_scene" );
    level notify( "end_scene" );
}

_id_C762()
{
    maps\_utility::waittill_notetrack_or_damage( "pistol_pickup" );
    maps\_utility::forceuseweapon( "deserteagle", "sidearm" );
    maps\_utility::waittill_notetrack_or_damage( "assistant_spawn_ak" );
    maps\_utility::forceuseweapon( "ak47", "primary" );
}

_id_D304()
{
    var_0 = getentarray( "animated_fan", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2.animname = "fan";
        var_2 maps\_anim::setanimtree();
        var_2 thread maps\_anim::anim_loop_solo( var_2, "idle" );
    }
}

_id_C6F9()
{
    common_scripts\utility::flag_wait( "start_chase" );
    var_0 = getent( "fast_car_tanker_trigger", "targetname" );
    var_1 = getvehiclenode( "tanker_accident_start_destroy", "script_noteworthy" );
    wait 4;
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "fast_car_intro" );
    var_0 waittill( "trigger" );
    wait 0.5;
    var_3 = maps\_vehicle::_id_AEE5( "fast_car_tanker_accident" );
    var_1 waittill( "trigger" );
    wait 0.1;
    var_3 thread maps\_utility::play_sound_on_entity( "scn_favela_car_impact_01" );
    radiusdamage( var_3.origin, 50, 200, 300, level.player );
    common_scripts\_exploder::exploder( "car_hit_tanker_favela" );
    wait 2.4;
    var_3 maps\_utility::destructible_force_explosion();
}

_id_B5C5()
{
    common_scripts\utility::flag_wait( "favela_cancel_royce_anim" );
    level._id_B0E8 maps\_utility::anim_stopanimscripted();
}

setheadmodel( var_0 )
{
    if ( isdefined( self.headmodel ) )
        self detach( self.headmodel );

    self attach( var_0, "", 1 );
    self.headmodel = var_0;
}

_id_CFED()
{
    self waittill( "damage" );
    maps\_utility::missionfailedwrapper( &"FAVELA_DEADQUOTE_KILL_ASSISTANT_TORTURE" );
}

_id_BBCE( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_C7BC );
}

_id_C7BC( var_0 )
{
    self.animname = self.model;
    maps\_utility::assign_animtree();
    var_1 = randomfloatrange( 0.8, 1.5 );
    var_2 = maps\_utility::getanim( "idle" )[0];
    self _meth_83D4( var_2, var_1 );
    thread maps\_anim::anim_loop_solo( self, "idle", "stop_looping_chains" );
    level waittill( "torture_sequence_done" );
    self notify( "stop_looping_chains" );
}

_id_CFC2()
{
    var_0 = getent( "activate_light", "script_noteworthy" );
    var_1 = getent( "light_window_trap_secondfloor", "targetname" );
    var_0 waittill( "trigger" );
    var_1 setlightintensity( 32000 );
}

_id_C628( var_0, var_1 )
{
    level waittill( "introscreen_activate" );
    wait 5;
    setsaveddvar( "cg_cinematicFullScreen", 0 );
    cinematicingamesync( "favela_rearview_final", 0, 1 );
    wait 25.3;
    var_0 _meth_847B( "mtl_h2_cinematic_3d_rearview_mirror", "m/mtl_h2_luxurysedan_rearview_mirror" );
    var_1 _meth_847B( "mtl_h2_cinematic_3d_rearview_mirror", "m/mtl_h2_luxurysedan_rearview_mirror" );
}

animated_soccer_goals()
{
    common_scripts\utility::flag_wait( "cleared_favela" );
    var_0 = getentarray( "soccer_goal", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::assign_animtree( "goals" );
        var_2 thread maps\_anim::anim_loop_solo( var_2, "soccer_goal" );
    }
}

bullet_holes_hood()
{
    var_0 = [ ( 3768.0, -1994.0, 670.5 ), ( 3755.0, -1988.0, 670.5 ), ( 3749.0, -1971.0, 670.5 ), ( 3766.0, -1970.0, 670.5 ) ];
    common_scripts\utility::flag_wait( "car_getting_shot" );

    foreach ( var_2 in var_0 )
        magicbullet( self.weapon, self.origin, var_2 );
}

player_lookat_shutter_watcher( var_0 )
{
    level endon( "start_shutter_anim" );
    var_0 maps\_utility::waittill_player_lookat( 0.65, undefined, undefined, 10 );
    common_scripts\utility::flag_set( "start_shutter_anim" );
}

window_guy_watcher( var_0, var_1, var_2 )
{
    var_3 = [ var_1, var_2 ];

    while ( isalive( var_0 ) || isdefined( var_0 ) )
        waitframe();

    foreach ( var_5 in var_3 )
    {
        var_5 stopanimscripted();

        if ( !common_scripts\utility::flag( "shutter_closed" ) )
            var_5 maps\_anim::anim_first_frame_solo( var_5, "h2_civilian_close_shutter_" + getsubstr( var_5.model, 23, 24 ) );
    }
}

random_dog_model_swap()
{
    var_0 = [ "german_sheperd_dog", "h2_german_sheperd_dog_dark", "h2_german_sheperd_dog_gray" ];
    var_1 = common_scripts\utility::random( var_0 );
    self setmodel( var_1 );
}

static_model_groups_setup()
{
    var_0 = getentarray( "staticmodelgroup_01_hide", "targetname" );
    var_1 = getentarray( "staticmodelgroup_01_show", "targetname" );
    var_2 = getentarray( "staticmodelgroup_02_hide", "targetname" );
    var_3 = getentarray( "staticmodelgroup_02_show", "targetname" );
    var_4 = getentarray( "staticmodelgroup_03_hide", "targetname" );
    var_5 = getentarray( "staticmodelgroup_03_show", "targetname" );
    var_6 = getentarray( "staticmodelgroup_04_hide", "targetname" );
    var_7 = getentarray( "staticmodelgroup_04_show", "targetname" );
    var_8 = getentarray( "staticmodelgroup_05_hide", "targetname" );
    var_9 = getentarray( "staticmodelgroup_05_show", "targetname" );
    var_10 = getentarray( "staticmodelgroup_06_hide", "targetname" );
    var_11 = getentarray( "staticmodelgroup_06_show", "targetname" );
    var_12 = common_scripts\utility::array_combine( var_0, var_1 );
    var_13 = common_scripts\utility::array_combine( var_2, var_3 );
    var_14 = common_scripts\utility::array_combine( var_4, var_5 );
    var_15 = common_scripts\utility::array_combine( var_6, var_7 );
    var_16 = common_scripts\utility::array_combine( var_8, var_9 );
    var_17 = common_scripts\utility::array_combine( var_10, var_11 );
    var_18 = common_scripts\utility::array_combine( var_12, var_13 );
    var_19 = common_scripts\utility::array_combine( var_14, var_15 );
    var_20 = common_scripts\utility::array_combine( var_19, var_16 );
    var_21 = common_scripts\utility::array_combine( var_20, var_17 );
    var_22 = common_scripts\utility::array_combine( var_18, var_21 );
    _func_31C( 5 );
    _func_31C( 3 );
    _func_31C( 6 );
    common_scripts\utility::array_thread( var_22, ::static_model_groups_think );
}

static_model_groups_think()
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

sync_left_side_of_bus_spawning()
{
    self endon( "death" );
    self waittill( "trigger" );
    thread sync_left_side_of_bus_spawning_internal();
    self delete();
}

sync_left_side_of_bus_spawning_internal()
{
    var_0 = level.scr_anim["mactavish"]["hit_by_car"];
    var_1 = level._id_D13B getanimtime( var_0 );

    if ( var_1 > 0.0 )
    {
        if ( var_1 < 0.29 )
            wait(( 0.29 - var_1 ) * getanimlength( var_0 ));
        else if ( var_1 < 0.52 )
            wait(( 0.52 - var_1 ) * getanimlength( var_0 ));
    }

    var_2 = getentarray( "left_side_of_bus_spawners", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_spawner::trigger_spawner_spawns_guys );
}

animated_sheet()
{
    var_0 = getent( "sheet_green", "targetname" );
    var_0 maps\_utility::assign_animtree( "sheet_green" );
    var_1 = var_0 maps\_utility::getanim( "sheet_green" );
    var_0 setanim( var_1 );
}

hide_destructible_vehicles( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_1, "targetname" );
    var_4 = getentarray( "destructible_vehicle", "targetname" );
    var_5 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        return;

    foreach ( var_7 in var_4 )
    {
        foreach ( var_9 in var_3 )
        {
            if ( var_9 istouching( var_7 ) )
                var_5 = common_scripts\utility::array_add( var_5, var_7 );
        }
    }

    if ( var_0 )
    {
        foreach ( var_7 in var_5 )
            var_7 hide();
    }
    else
    {
        foreach ( var_7 in var_5 )
            var_7 show();
    }
}

animated_payphone()
{
    var_0 = getent( "end_phone", "targetname" );
    var_1 = getent( "end_phone_origin", "targetname" );
    var_0 maps\_utility::assign_animtree( "payphone" );
    var_1 maps\_anim::anim_last_frame_solo( var_0, "opening_radiotower" );
}

monitor_faust_run( var_0 )
{
    self endon( "death" );
    var_1 = getnode( var_0, "targetname" );
    var_1 waittill( "trigger" );
    common_scripts\utility::flag_set( var_0 );
}
