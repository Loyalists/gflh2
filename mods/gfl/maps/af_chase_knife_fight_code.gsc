// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_C87C()
{
    if ( level.start_point == "turnbuckle" )
        level.player maps\_utility::blend_movespeedscale( 0.45, 0.1 );
    else
    {
        level.player maps\_utility::blend_movespeedscale( 0.25, 0.1 );
        level.player maps\_utility::delaythread( 3, maps\_utility::blend_movespeedscale, 0.45, 10 );
    }
}

_id_BFB5()
{
    soundscripts\_snd::snd_message( "start_fade_in_from_crash" );
    var_0 = get_black_overlay();
    var_0.alpha = 1;
    var_1 = 4;
    wait 2;
    var_0 fadeovertime( var_1 );
    var_0.alpha = 0;
}

_id_B876()
{
    self.health = 1;
    self.ignoreexplosionevents = 1;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.ignorerandombulletdamage = 1;
    self.grenadeawareness = 0;
    self.no_pain_sound = 1;
    self.dropweapon = 0;
    self.skipbloodpool = 1;
    maps\_utility::disable_surprise();
    animscripts\shared::dropallaiweapons();
    self forceteleport( ( 27115.7, 32538.7, -9883.9 ), ( 0.0, 273.875, 0.0 ) );
    self.a.pose = "prone";
    self.a.crawl_fx = "blood_smear_decal_ending";
    self.a._id_C299 = "j_spine4";
    self.cheat.attachheadlast = 1;
    self endon( "death" );
    self allowedstances( "prone" );
    var_0 = self.angles;
    var_0 = maps\_utility::set_y( ( 0.0, 0.0, 0.0 ), var_0[1] + 10 );
    var_1 = anglestoforward( var_0 );
    var_2 = self.origin + var_1 * 200;
    self teleport( var_2, var_0 );
    level._id_CA22 = self;
    self endon( "stealth_takedown_started" );
    maps\_anim::anim_generic_first_frame( self, "civilian_crawl_1" );
    maps\_utility::force_crawling_death( self.angles[1] + 10, 1, level.scr_anim["crawl_death_1"], 1 );
    self.deathanim = common_scripts\utility::random( level.scr_anim["crawl_death_1"]["death"] );
    self.nomeleedeathorient = 1;
    self._id_BC2E = 1;
    childthread _id_AD2E();
    var_3 = maps\_utility::getanim_generic( "civilian_crawl_1" );
    wait 0.05;
    self setanimtime( var_3, 0.4 );
    common_scripts\utility::flag_wait( "crawling_guy_starts" );
    var_0 = vectortoangles( level.player.origin - self.origin );
    var_0 = maps\_utility::set_y( ( 0.0, 0.0, 0.0 ), var_0[1] );
    var_0 = ( var_0[0], clamp( var_0[1], 260, 300 ), var_0[2] );
    self teleport( self.origin, var_0 );
    self.a.force_crawl_angle = var_0[1];
    _id_A84A( 470 );
    self._id_A87F.martyr_ignore = 1;
    _id_B190::_id_D55F( self );
    self dodamage( 1, level.player.origin );
    self.noragdoll = 1;
    wait 1;
    self.diequietly = 1;
}

_id_B250( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self ) )
        return;

    if ( !isalive( var_1 ) )
        return;

    if ( var_1 != level.player )
        return;

    common_scripts\utility::play_sound_in_space( "scn_afchase_crawling_guy_death", self.origin );
}

_id_AD2E()
{
    for (;;)
    {
        self waittill( "crawling", var_0 );

        if ( var_0 == "scn_afchase_dying_crawl" )
            self playsound( "scn_afchase_dying_crawl" );
    }
}

_id_A84A( var_0 )
{
    var_1 = var_0;
    var_1 += 44;
    var_2 = 16;
    var_3 = 2;
    var_4 = var_2 / var_1 * var_3;
    var_5 = spawn( "script_origin", self.origin );
    var_5.angles = self.angles;
    var_6 = anglestoforward( self.angles );
    var_6 = vectornormalize( var_6 ) * var_1;
    var_7 = vectornormalize( var_6 ) * var_0;
    var_8 = self.origin + var_6;
    var_9 = self.origin + var_7;
    var_5 moveto( var_8, var_3 );
    var_5 thread _id_BB29( var_4 );
    var_5 common_scripts\utility::delaycall( var_3, ::delete );
    self.a.crawl_fx_rate = 0.3;
    self forceteleport( common_scripts\utility::drop_to_ground( var_9 ), self.angles );
}

_id_BB29( var_0 )
{
    var_1 = level._effect["blood_smear_decal_ending"];
    self endon( "death" );
    var_2 = self.origin;

    while ( var_0 )
    {
        var_3 = common_scripts\utility::flat_origin( common_scripts\utility::randomvectorrange( -5, 5 ) );
        var_4 = self.origin + var_3;
        var_4 = common_scripts\utility::drop_to_ground( var_4 ) + ( 0.0, 0.0, 5.0 );
        var_5 = vectortoangles( self.origin - var_2 );
        var_6 = anglestoright( var_5 );
        var_7 = anglestoforward( ( 270.0, 0.0, 0.0 ) );
        playfx( var_1, var_4, var_7, var_6 );
        wait(var_0);
    }
}

_id_A8F1( var_0 )
{
    var_1 = get_black_overlay();

    if ( var_0 )
        var_1 fadeovertime( var_0 );

    var_1.alpha = 1;
    thread _id_B433( 0.5, var_0 );
}

_id_B433( var_0, var_1 )
{

}

_id_B3EA( var_0 )
{
    if ( level.missionfailed )
        return;

    level notify( "now_fade_in" );
    var_1 = get_black_overlay();

    if ( var_0 )
        var_1 fadeovertime( var_0 );

    var_1.alpha = 0;
    thread _id_B433( 0.0, var_0 );
}

_id_C6A4()
{
    if ( !isdefined( level._id_D327 ) )
    {
        level._id_D327 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        var_0 = common_scripts\utility::getstruct( "end_scene_org", "targetname" );
        level._id_D327.origin = var_0.origin;
        level._id_D327.angles = var_0.angles;
    }

    return level._id_D327;
}

_id_BC19()
{
    if ( 1 )
        return _id_C6A4();

    return common_scripts\utility::getstruct( "end_scene_org_new", "targetname" );
}

_id_B16A()
{
    if ( common_scripts\utility::flag( "startPoint_boatDrive" ) )
        return;

    var_0 = getent( "boatrider0", "targetname" );
    var_0.count = 1;
    var_1 = var_0 maps\_utility::spawn_ai( 1 );
    var_1 maps\_utility::gun_remove();
    level.price = maps\_vehicle_aianim::convert_guy_to_drone( var_1 );
    level.price.animname = "price";
}

_id_BDAE()
{
    var_0 = getent( "nikolai", "targetname" );
    var_0.count = 1;
    level._id_C942 = var_0 maps\_utility::spawn_ai( 1 );
    level._id_C942.animname = "nikolai";
    level._id_C942.ignoreall = 1;
    level._id_C942.ignoreme = 1;
    level._id_C942 maps\_utility::make_hero();
}

_id_AD9B()
{
    var_0 = _id_C6C5();
    var_0 show();
    level.player playerlinktodelta( var_0, "tag_player", 1, 0, 0, 0, 0, 1 );
}

_id_AF54()
{
    var_0 = _id_C6C5();
    var_1 = gettime() - level._id_B46E;

    if ( var_1 > 0 )
        var_1 /= 1000;

    var_2 = 0.37 - var_1;

    if ( common_scripts\utility::flag( "player_touched_shepherd" ) )
    {
        var_3 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
        var_2 = 0.33;
        var_3 maps\_anim::anim_first_frame_solo( var_0, "turn_buckle_alt" );
        level.player disableweapons();
    }

    level.player playerlinktoblend( var_0, "tag_player", var_2, 0, 0 );
    thread _id_C406( var_2 + 0.4 );
    wait(var_2);
    level.player takeallweapons();
    var_0 show();
    level.player playerlinktodelta( var_0, "tag_player", 1, 0, 0, 0, 0, 1 );
}

_id_C406( var_0 )
{
    var_1 = var_0 / 0.05;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        level._id_B416 playrumbleonentity();
        wait 0.05;
    }
}

_id_BEC4()
{
    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
}

_id_B671()
{
    var_0 = _id_C6C5();
    var_1 = 0.3;
    _id_BEC4();
    level.player playerlinktoblend( var_0, "tag_player", var_1, 0, 0 );
    wait(var_1);
    level.player takeallweapons();
    var_0 show();
    level.player playerlinktodelta( var_0, "tag_player", 1, 5, 5, 5, 5, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_AA63()
{
    var_0 = _id_C6C5();
    var_1 = 0.4;
    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player playerlinktoblend( var_0, "tag_player", var_1, 0, 0 );
    wait(var_1);
    level.player takeallweapons();
    var_0 show();
    level.player playerlinktodelta( var_0, "tag_player", 1, 10, 10, 10, 10, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_D354()
{
    var_0 = "ending_knife";
    level.player giveweapon( var_0 );
    level.player setweaponammostock( var_0, 0 );
    level.player setweaponammoclip( var_0, 0 );
    level.player switchtoweapon( var_0 );
    level.player freezecontrols( 0 );
}

_id_B849()
{
    wait 0.05;
    var_0 = [];
    var_0["shepherd"] = getent( "shepard", "targetname" );
    var_0["price"] = getent( "boatrider0", "targetname" );
    var_1 = [];

    foreach ( var_5, var_3 in var_0 )
    {
        var_3.count = 1;
        var_4 = var_3 stalingradspawn();

        if ( maps\_utility::spawn_failed( var_4 ) )
            return;

        var_1[var_5] = var_4;
    }

    level._id_CB36 = var_1;

    foreach ( var_5, var_4 in var_1 )
    {
        var_4 maps\_utility::gun_remove();
        var_4.ignoreme = 1;
        var_4.ignoreall = 1;
        var_4 common_scripts\utility::hide_notsolid();
        var_4.animname = var_5;
    }

    var_7 = "fight_D3_swapped";
    var_8 = common_scripts\utility::spawn_tag_origin();
    var_9 = common_scripts\utility::getstruct( "endorg_new_fight", "targetname" );
    var_8.origin = var_9.origin;
    var_8.angles = var_9.angles;
    var_9 thread maps\_anim::anim_first_frame( var_1, var_7 );

    foreach ( var_4 in var_1 )
        var_4 linkto( var_8 );

    common_scripts\utility::flag_wait( "price_shepherd_fight_e_flag" );
    var_12 = level.player geteye();
    var_13 = var_1["price"] geteye();
    var_14 = vectortoangles( var_12 - var_13 );
    var_15 = anglestoright( var_14 );
    var_16 = anglestoforward( var_14 );
    var_8.origin += ( var_15 * 15 + var_16 * -50 );
    _id_C73A( 1.2 );
    wait 0.05;
    var_17 = 1.2;
    var_8 moveto( var_9.origin, var_17, 0, var_17 );

    foreach ( var_4 in var_1 )
        var_4 common_scripts\utility::show_solid();

    level.price playrumbleonentity();
    level._id_B416 playrumbleonentity();
    var_8 thread maps\_anim::anim_single( var_1, var_7 );
    maps\af_chase_anim::_id_B212();
    wait 1.2;
    _id_C38C( 1.2 );
    level waittill( "knife_pulled_out" );
    wait 1.2;

    foreach ( var_4 in var_1 )
        var_4 delete();
}

_id_BF4D()
{
    var_0 = getent( "shepard", "targetname" );
    var_1 = var_0 stalingradspawn( 0, "spawned_shepherd" );
    var_2 = maps\_utility::spawn_failed( var_1 );
    level._id_B416 = var_1;
    // var_1 setmodel( "body_vil_shepherd_dmg" );
    common_scripts\utility::flag_set( "shepherd_spawned" );
    var_1 thread maps\_utility::magic_bullet_shield();
    var_1.ignoreme = 1;
    var_1.ignoreall = 1;
    var_1.fixednode = 0;
    var_1.animname = "shepherd";
    var_1 maps\_utility::gun_remove();
    var_1 maps\_utility::disable_surprise();
    var_1 maps\_utility::disable_arrivals();
    var_1 maps\_utility::disable_exits();
    var_1 maps\_utility::set_battlechatter( 0 );
    var_1 maps\_utility::make_hero();
    var_1 maps\_utility::set_goal_pos( var_1.origin );
    var_1.cheat.ignoredamageinpineapplemode = 1;
}

_id_C6C5()
{
    if ( !isdefined( level.player_rig ) )
        level.player_rig = maps\_utility::spawn_anim_model( "player_rig" );

    if ( common_scripts\utility::flag( "bloody_player_rig" ) )
        level.player_rig setmodel( "h2_gfl_m4_sopmod_ii_viewbody" );

    return level.player_rig;
}

_id_C1F8()
{
    if ( !isdefined( level._id_B405 ) )
        level._id_B405 = maps\_utility::spawn_anim_model( "player_body" );

    return level._id_B405;
}

_id_B7B3()
{
    if ( !isdefined( level._id_CAC6 ) )
        level._id_CAC6 = maps\_utility::spawn_anim_model( "gun_model" );

    return level._id_CAC6;
}

_id_C5B9()
{
    var_0 = getent( "shepherd_stumble_spawner", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_BC51 );
    var_0 maps\_utility::spawn_ai();
}

_id_B66C()
{
    if ( common_scripts\utility::flag( "helicopter_sound_played" ) )
        return;

    var_0 = getent( "shepherd_stumble_spawner", "targetname" );
    common_scripts\utility::flag_set( "helicopter_sound_played" );
    thread common_scripts\utility::play_sound_in_space( "helicopter_door_slams", var_0.origin );
}

_id_C54A()
{
    var_0 = level.player.origin + ( 0.0, 0.0, 32.0 );
    var_1 = 0;

    for ( var_2 = 0; var_2 <= 3; var_2++ )
    {
        var_3 = self geteye() + ( 0, 0, var_1 );
        var_1 += 16;
        var_4 = bullettrace( var_0, var_3, 0, undefined );

        if ( var_4["fraction"] >= 1 )
            return 1;

        if ( var_4["surfacetype"] == "none" )
            return 1;
    }

    return 0;
}

_id_D190()
{
    setsaveddvar( "objectiveFadeTooFar", 100 );
    level._id_D242 = self;

    for (;;)
    {
        if ( isdefined( level.ground_ref_ent ) )
            break;

        wait 0.05;
    }

    common_scripts\utility::flag_wait( "player_standing" );
    _id_BA32();
}

_id_BA32()
{
    level endon( "player_touched_shepherd" );
    var_0 = common_scripts\utility::flag( "af_chase_see_shepherd" );

    for (;;)
    {
        var_1 = common_scripts\utility::flag( "af_chase_see_shepherd" );

        if ( var_1 != var_0 )
        {
            var_0 = var_1;
            setsaveddvar( "objectiveHide", 0 );
            setsaveddvar( "objectiveFadeTooFar", 0.1 );
            common_scripts\utility::noself_delaycall( 0.1, ::setsaveddvar, "objectiveFadeTooFar", 100 );
            var_2 = getdvarint( "objectiveFadeTimeWaitOff" );
            wait(var_2);
            var_3 = getdvarint( "objectiveFadeTimeGoingOff" );
            common_scripts\utility::noself_delaycall( var_3, ::objective_setpointertextoverride, 3, &"SCRIPT_WAYPOINT_SHEPHERD" );
        }

        var_4 = level.player geteye();
        var_5 = level.player getplayerangles();
        var_5 = ( 0, var_5[1], 0 );
        var_6 = anglestoforward( var_5 );
        var_7 = var_4 + var_6 * 100 + ( 0.0, 0.0, -16.0 );
        var_8 = var_4 + var_6 * 100 + ( 0.0, 0.0, 16.0 );
        var_9 = 0;

        if ( !common_scripts\utility::flag( "special_kill_anim_playing" ) )
            var_9 = !common_scripts\utility::within_fov( var_4, var_5, level._id_D242.origin, 0.35 );

        setsaveddvar( "objectiveHide", !var_9 );
        wait 0.05;
    }
}

_id_C602( var_0, var_1 )
{
    [ var_3, var_4 ] = common_scripts\utility::ter_op( var_0, [ "J_Ball_LE", -1.0 ], [ "J_Ball_RI", 1.0 ] );
    var_5 = self gettagorigin( var_3 );
    var_6 = anglestoforward( self gettagangles( var_3 ) ) * var_4;
    var_7 = self.angles;
    var_8 = anglestoup( var_7 );
    var_9 = common_scripts\utility::ter_op( var_1, "footstep_dust_sandstorm_runner_sheperd", "footstep_dust_sandstorm_small_runner_sheperd" );
    playfx( common_scripts\utility::getfx( var_9 ), var_5, var_8, var_6 );
    thread common_scripts\utility::play_sound_in_space( "scn_shp_step_run_sand", var_5 );
}

_id_BC51()
{
    thread _id_D190();
    objective_onentity( 3, self, ( 0.0, 0.0, 90.0 ) );
    self.animname = "shepherd";
    thread _id_CFB6();
    self setcontents( 0 );
    self.ignoreall = 1;
    maps\_utility::gun_remove();
    self.health = 5000;
    self.allowpain = 0;
    maps\_utility::set_run_anim( "run" );
    maps\_utility::disable_arrivals();
    maps\_utility::set_battlechatter( 0 );
    self.playfootstepoverride = ::_id_C602;
    level._id_B416 hide();
    level._id_D0C2 = self;
    var_0 = common_scripts\utility::getstruct( "shepherd_spawncheck_struct", "targetname" );
    var_1 = "flee";
    var_2 = "prone_stand";
    self allowedstances( "prone" );
    self teleport( self.origin, ( 0.0, 50.0, 0.0 ) );
    self.prone_anim_override = maps\_utility::getanim( "prone_stand" );
    self.prone_rate_override = 2;

    for (;;)
    {
        var_3 = _id_C54A();

        if ( common_scripts\utility::flag( "never_shepherd_stumble" ) )
            break;

        if ( var_3 && common_scripts\utility::flag( "shepherd_can_run" ) )
            break;

        wait 0.05;
    }

    level notify( "run_shep_run" );
    self allowedstances( "stand" );
    thread _id_B66C();
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_0.origin = ( 27387.9, 31743.7, -9962.98 );
    var_0.angles = ( 0.0, 0.0, 0.0 );
    level notify( "shepherd_runs" );
    var_4 = common_scripts\utility::getstruct( "start_player_turnbuckle", "targetname" );
    self setgoalpos( var_4.origin );
    thread _id_D530( var_4 );
    maps\_utility::delaythread( 3, common_scripts\utility::flag_set, "fog_out_stumble_shepherd" );
    var_5 = maps\_utility::getanim( "flee" );
    var_6 = getanimlength( var_5 );
    var_7 = gettime();
    var_0 thread maps\_anim::anim_custom_animmode_solo( self, "gravity", "flee" );
    self playsound( "scn_afchase_shepherd_runoff" );
    common_scripts\utility::flag_set( "af_chase_see_shepherd" );
    maps\_utility::wait_for_buffer_time_to_pass( var_7, var_6 - 2.4 );
    maps\_utility::wait_for_buffer_time_to_pass( var_7, var_6 - 0.2 );
    var_8 = common_scripts\utility::getstruct( "stumble_path", "targetname" );
    thread maps\_spawner::go_to_node( var_8, "struct" );
    var_9 = var_8;

    for (;;)
    {
        if ( !isdefined( var_9.target ) )
            break;

        var_9 = common_scripts\utility::getstruct( var_9.target, "targetname" );
    }

    var_9.radius = 86.7;
    maps\_utility::wait_for_buffer_time_to_pass( var_7, var_6 - 0.8 );
    self.a.pose = "stand";
    self.custommovetransition = animscripts\shared::returntrue;
    self notify( "stop_animmode" );
    maps\_utility::anim_stopanimscripted();
    common_scripts\utility::flag_set( "stop_being_stunned" );
    self waittill( "reached_path_end" );
    var_5 = level.scr_anim["shepherd"]["turn_buckle_idle"][0];
    self setanimknoball( var_5, level._id_D572, 1, 0.8, 1 );
    self animcustom( ::_id_AF04 );
    var_10 = common_scripts\utility::spawn_tag_origin();
    var_10.origin = self.origin;
    var_10.angles = self.angles;
    self linkto( var_10 );
    var_6 = 1.1;
    var_10 moveto( level._id_B416.origin, var_6, 0, var_6 );
    wait(var_6);
    objective_position( 3, level._id_B416.origin + ( 0.0, 0.0, 90.0 ) );
    level._id_D242 = level._id_B416;
    level._id_B416 show();
    var_10 delete();
    self delete();
}

_id_AF04()
{
    self endon( "death" );
    wait 0.75;
    self orientmode( "face angle", level._id_B416.angles[1] );
    wait 5000;
}

_id_CFB6()
{
    self endon( "death" );
    var_0 = 250;
    var_1 = 700;
    var_2 = 0.05;
    var_3 = 0.6;
    var_4 = 0;

    for (;;)
    {
        var_5 = distance( level.player.origin, self.origin );

        if ( !var_4 && var_5 < 300 )
        {
            thread maps\af_chase_knife_fight::_id_BBB9( 0.75 );
            var_6 = "dizzy_stumble_" + ( level._id_ADC3 % 3 + 1 );
            level._id_ADC3++;
            var_7 = getanimlength( level.scr_anim["dizzy_stumble"][var_6] );
            level.player _meth_84C4( level.scr_viewanim[var_6] );
            common_scripts\utility::flag_set( "player_is_in_dizzy_stumble" );
            thread _id_BAAF();
            maps\_utility::delaythread( 5, common_scripts\utility::flag_clear, "player_is_in_dizzy_stumble" );
            level.player thread maps\_utility::play_sound_on_entity( "scn_" + var_6 );
            level.player thread _id_C77B::_id_CFD1( var_7 );
            level.player playrumblelooponentity( "damage_light" );
            common_scripts\utility::noself_delaycall( 0.5, ::setblur, 4, 0.25 );
            common_scripts\utility::noself_delaycall( 1.2, ::setblur, 0, 1 );
            var_4 = 1;
        }

        var_8 = maps\_utility::graph_position( var_5, var_0, var_2, var_1, var_3 );
        level.player.movespeedscale = clamp( var_8, var_2, var_3 );
        wait 0.05;
    }
}

_id_BAAF()
{
    var_0 = _id_D397::_id_A97A( "stumble_shep" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( 50, 0.55, 0 );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_A970( ::shellshock, level.player, "af_chase_ending_wakeup", 11 );
    var_0 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_A9EC( 1.0, 0 );
    var_0 _id_D397::_id_BC26();
}

_id_D530( var_0 )
{
    for (;;)
    {
        if ( distance( self.origin, var_0.origin ) < 700 )
            break;

        wait 0.05;
    }

    thread _id_C120();
}

_id_C120()
{
    var_0 = 0;
    var_1 = self.origin;
    var_2 = 0.07;
    _func_45( 1 );

    for (;;)
    {
        if ( isalive( self ) )
            var_1 = self.origin;

        if ( var_0 >= 3.5 )
            playfx( level._effect["sand_storm_player_semi_opaque"], var_1 + ( 0.0, 0.0, 100.0 ) );
        else
            playfx( level._effect["sand_storm_player_opaque"], var_1 + ( 0.0, 0.0, 100.0 ) );

        if ( isalive( self ) )
            var_0 += 0.4;
        else
            var_0 += 0.6;

        if ( var_0 >= 6 )
            break;

        if ( var_0 <= 1.75 )
            var_0 = 1.75;

        var_3 = var_0 * 0.6;
        var_3 = clamp( var_3, var_2, 100 );
        wait(var_3);
    }

    wait 3;
    _func_45( 0 );
}

_id_BB55()
{
    var_0 = getentarray( "ending_animated_window01", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2.animname = "window";
        var_2 maps\_anim::setanimtree();
        var_2 thread maps\_anim::anim_loop_solo( var_2, "idle1" );
    }

    var_4 = getentarray( "ending_animated_window02", "targetname" );

    foreach ( var_2 in var_4 )
    {
        var_2.animname = "window";
        var_2 maps\_anim::setanimtree();
        var_2 thread maps\_anim::anim_loop_solo( var_2, "idle2" );
    }

    var_7 = getent( "ending_animated_fence01", "targetname" );
    var_7.animname = "fence";
    var_7 maps\_anim::setanimtree();
    var_7 thread maps\_anim::anim_loop_solo( var_7, "idle1" );
    var_8 = getent( "ending_animated_crane01", "targetname" );
    var_8.animname = "crane";
    var_8 maps\_anim::setanimtree();
    var_8 thread maps\_anim::anim_loop_solo( var_8, "idle1" );
}

_id_B330()
{
    for (;;)
    {
        wait 0.05;

        if ( !isalive( level._id_B416 ) )
            continue;

        if ( distance( level.player.origin, level._id_B416.origin ) > 650 )
            continue;

        _id_CC30::_id_B003();
        return;
    }
}

get_black_overlay()
{
    if ( !isdefined( level.black_overlay ) )
        level.black_overlay = maps\_hud_util::create_client_overlay( "black", 0, level.player );

    level.black_overlay.sort = -1;
    level.black_overlay.foreground = 0;
    return level.black_overlay;
}

get_white_overlay()
{
    if ( !isdefined( level.white_overlay ) )
        level.white_overlay = maps\_hud_util::create_client_overlay( "white", 0, level.player );

    level.white_overlay.sort = -1;
    return level.white_overlay;
}

_id_B668()
{
    if ( !isdefined( level._id_BA05 ) )
        level._id_BA05 = maps\_hud_util::create_client_overlay( "white", 0, level.player );

    level._id_BA05.sort = -1;
    level._id_BA05.color = ( 1.0, 0.0, 0.0 );
    return level._id_BA05;
}

_id_CED7( var_0 )
{
    if ( var_0 >= 40 )
        return 0;

    common_scripts\utility::flag_set( "player_touched_shepherd" );
    return 1;
}

_id_C730( var_0 )
{
    if ( var_0 >= 100 )
        return 0;

    var_1 = level.player getplayerangles();
    var_2 = level._id_B416 gettagorigin( "tag_eye" );
    var_3 = 0.6428;
    var_4 = maps\_utility::within_fov_2d( level.player.origin, var_1, var_2, var_3 );

    if ( !var_4 )
        return 0;

    var_5 = maps\_utility::get_dot( level._id_B416.origin, level._id_B416.angles, level.player.origin );

    if ( var_5 < -0.173648 )
        return 0;

    var_6 = gettime() - level._id_B46E <= 50;
    return var_6;
}

_id_CA72()
{
    var_0 = _id_CF10();
    var_0 waittillmatch( "single anim", "blood" );
    soundscripts\_snd::snd_message( "aud_start_mix_plr_knife_stab" );
    level notify( "knife_in_player" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_afchase_tbuckle_stab_front" );
    wait 0.1;
    level._id_C781 = _id_CC30::_id_CFE1;
    level._id_B96D = 1.4;
    level.player dodamage( 50 / level.player.damagemultiplier, level.player.origin );
}

_id_CF10()
{
    if ( !isdefined( level.knife ) )
        level.knife = maps\_utility::spawn_anim_model( "knife" );

    return level.knife;
}

_id_B991()
{
    if ( !isdefined( level._id_B8A6 ) )
        level._id_B8A6 = _id_B26A();

    level._id_B8A6 unlink();
    return level._id_B8A6;
}

_id_B26A()
{
    level notify( "new_dof_targetent" );
    level endon( "new_dof_targetent" );
    level endon( "kill_dof_management" );
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 endon( "death" );
    level._id_B8A6 = var_0;
    childthread _id_BD40( var_0 );
    return var_0;
}

_id_BD40( var_0 )
{
    var_0._id_AB7F = 64;
    var_0._id_C52E = 64;
    var_0._id_C80B = 4.5;
    var_0._id_BED9 = 1.05;
    level._id_AC5E = [];

    foreach ( var_3, var_2 in level.dofdefault )
        level._id_AC5E[var_3] = var_2;

    for (;;)
    {
        var_4 = distance( level.player geteye(), var_0.origin );
        level.dofdefault["nearStart"] = var_4 - var_0._id_AB7F;

        if ( level.dofdefault["nearStart"] <= 0 )
            level.dofdefault["nearStart"] = 1;

        level.dofdefault["nearEnd"] = var_4;
        level.dofdefault["farStart"] = var_4;
        level.dofdefault["farEnd"] = var_4 + var_0._id_C52E;
        level.dofdefault["nearBlur"] = var_0._id_C80B;
        level.dofdefault["farBlur"] = var_0._id_BED9;
        wait 0.05;
    }
}

_id_D49F()
{
    level notify( "kill_dof_management" );

    foreach ( var_2, var_1 in level._id_AC5E )
        level.dofdefault[var_2] = var_1;
}

_id_D01F()
{
    if ( !isdefined( level._id_B9A0 ) )
        level._id_B9A0 = spawn( "script_origin", ( 29142.2, 36233.9, -9973.2 ) );

    var_0 = level._id_B9A0;
    var_0 thread maps\_anim::anim_generic_first_frame( self, "standby" );
}

_id_BF04()
{
    self.alignx = "center";
    self.aligny = "middle";
    self.horzalign = "center";
    self.vertalign = "middle";
    self.hidewhendead = 1;
    self.hidewheninmenu = 1;
    self.sort = 205;
    self.foreground = 1;
    self.alpha = 0;
}

_id_C38C( var_0 )
{
    level notify( "kill_dof_management" );
    level endon( "kill_dof_management" );
    var_1 = level.dofdefault;
    var_2 = [];
    var_2["nearStart"] = 1;
    var_2["nearEnd"] = 1;
    var_2["nearBlur"] = 6;
    var_2["farStart"] = 40;
    var_2["farEnd"] = 70;
    var_2["farBlur"] = 6;
    maps\_utility::_id_B75A( var_1, var_2, var_0 );
}

_id_C73A( var_0 )
{
    level notify( "kill_dof_management" );
    level endon( "kill_dof_management" );
    var_1 = level.dofdefault;
    var_2 = [];
    var_2["nearStart"] = 1;
    var_2["nearEnd"] = 1;
    var_2["nearBlur"] = 10;
    var_2["farStart"] = 40;
    var_2["farEnd"] = 70;
    var_2["farBlur"] = 10;
    maps\_utility::_id_B75A( var_1, var_2, var_0 );
}

_id_BB6A( var_0 )
{
    level notify( "kill_dof_management" );
    level endon( "kill_dof_management" );
    var_1 = level.dofdefault;
    var_2 = [];
    var_2["nearStart"] = 60;
    var_2["nearEnd"] = 130;
    var_2["nearBlur"] = 6;
    var_2["farStart"] = 200;
    var_2["farEnd"] = 300;
    var_2["farBlur"] = 6;
    maps\_utility::_id_B75A( var_1, var_2, var_0 );
}

_id_C765( var_0 )
{
    level notify( "kill_dof_management" );
    level endon( "kill_dof_management" );
    var_1 = level.dofdefault;
    var_2 = [];
    var_2["nearStart"] = 60;
    var_2["nearEnd"] = 130;
    var_2["nearBlur"] = 4;
    var_2["farStart"] = 1400;
    var_2["farEnd"] = 1600;
    var_2["farBlur"] = 4;
    maps\_utility::_id_B75A( var_1, var_2, var_0 );
}

_id_C914( var_0 )
{
    level notify( "kill_dof_management" );
    level endon( "kill_dof_management" );
    var_1 = level.dofdefault;
    var_2 = [];
    var_2["nearStart"] = 13;
    var_2["nearEnd"] = 23;
    var_2["nearBlur"] = 4;
    var_2["farStart"] = 600;
    var_2["farEnd"] = 3000;
    var_2["farBlur"] = 4;
    maps\_utility::_id_B75A( var_1, var_2, var_0 );
}

_id_C458( var_0 )
{
    level notify( "kill_dof_management" );
    level endon( "kill_dof_management" );
    var_1 = level.dofdefault;
    var_2 = [];
    var_2["nearStart"] = 5;
    var_2["nearEnd"] = 15;
    var_2["nearBlur"] = 6;
    var_2["farStart"] = 600;
    var_2["farEnd"] = 3000;
    var_2["farBlur"] = 6;
    maps\_utility::_id_B75A( var_1, var_2, var_0 );
}

_id_C1D0()
{
    if ( !isdefined( level._id_AFE4 ) )
        return 0;

    foreach ( var_1 in level._id_AFE4 )
        return var_1.alpha > 0.8;

    return 0;
}

_id_AACC( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1.5;

    if ( !isdefined( level._id_AFE4 ) )
        _id_C1BA();

    foreach ( var_2 in level._id_AFE4 )
    {
        var_2 fadeovertime( var_0 );
        var_2.alpha = 0.95;
    }
}

_id_B6DC()
{
    if ( !isdefined( level._id_B144 ) )
    {
        var_0 = maps\_hud_util::createicon( "reticle_center_throwingknife", 32, 32 );
        var_0.x = 0;
        var_0.y = 0;
        var_0 _id_BF04();
        level._id_B144 = var_0;
    }

    return level._id_B144;
}

_id_C1BA()
{
    var_0 = 90;
    var_1 = 35;
    var_2 = [ "+activate", "+usereload" ];
    var_3 = !level.player common_scripts\utility::is_player_gamepad_enabled();
    thread maps\_utility::_id_BD5A( &"AF_CHASE_PRESS_USE", &"AF_CHASE_PRESS_USE_KEYBOARD", var_0, var_3, var_2 );
    level.player thread maps\_utility::_id_BD6E( "death" );
}

knife_hint_blinks_anim_selector()
{
    level endon( "clear_quick_hint" );

    for (;;)
    {
        waitframe();

        if ( isdefined( level.player._id_B628.state ) )
            level waittill( "other_anim_complete" );

        if ( !isdefined( level.player.quickhintwantedanim ) )
            continue;

        if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
        {
            if ( level.player.quickhintwantedanim == "idle" )
                thread maps\_utility::_id_AF53();
            else
                thread maps\_utility::_id_D3BA();
        }
        else if ( level.player.quickhintwantedanim == "idle" )
            thread maps\_utility::quick_hint_mash_idle_anim_kbm();
        else
            thread maps\_utility::quick_hint_mash_active_anim_kbm();

        level.player.quickhintwantedanim = undefined;
    }
}

_id_A88F()
{
    level endon( "clear_quick_hint" );

    if ( !isdefined( level.player._id_B1FD ) )
        _id_C1BA();

    thread knife_hint_blinks_anim_selector();
    waitframe();
    var_0 = 1;
    var_1 = 0;
    var_2 = 5;

    if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
        thread maps\_utility::_id_C2BA();
    else
        thread maps\_utility::quick_hint_mash_idle_anim_kbm();

    while ( isdefined( level.occumulator ) )
    {
        var_3 = common_scripts\utility::ter_op( isdefined( maps\_utility::_id_B9E2() ), maps\_utility::_id_B9E2(), "" );

        if ( level.occumulator.presses.size < var_0 )
        {
            if ( var_3 == "active" )
            {
                var_1++;

                if ( var_1 > 1 )
                {
                    level.player.quickhintwantedanim = "idle";
                    var_1 = 0;
                }

                wait 0.05;
                continue;
            }
        }
        else if ( var_3 == "idle" )
        {
            var_1++;

            if ( var_1 > var_2 )
            {
                level.player.quickhintwantedanim = "active";
                var_1 = 0;
            }

            wait 0.05;
            continue;
        }

        var_1 = 0;
        wait 0.05;
    }
}

_id_D501( var_0 )
{
    level notify( "fade_out_knife_hint" );

    if ( !isdefined( var_0 ) )
        var_0 = 1.5;

    if ( !isdefined( level._id_AFE4 ) )
        _id_C1BA();

    foreach ( var_2 in level._id_AFE4 )
    {
        var_2 fadeovertime( var_0 );
        var_2.alpha = 0;
    }
}

use_pressed()
{
    if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
        return level.player usebuttonpressed();
    else
        return level.player _meth_85D0();
}

_id_AA22( var_0 )
{
    var_1 = spawnstruct();
    var_1.angles = var_0[0].angles;
    var_2 = level.scr_anim["crawl_death_1"]["crawl"];
    var_3 = getangledelta( var_2, 0, 1 );
    var_4 = getanimlength( var_2 );
    var_5 = var_3 / var_4 * 0.3;
    var_6 = anglestoforward( var_1.angles );
    var_1.origin = var_0[0].origin + var_6 * length( var_5 );
    var_0[0].a.doinglongdeath = undefined;
    thread _id_AF17();
    return var_1;
}

_id_AE5F( var_0 )
{
    var_1 = spawnstruct();
    var_1.origin = var_0[0].origin;
    var_1.angles = var_0[0].angles;
    var_0[0] notify( "stop_aim" );
    var_2 = var_0[0] maps\_utility::getanim( "aim_controller" );
    var_0[0] clearanim( var_2, 1 );
    thread _id_BA9A();
    return var_1;
}

_id_AF17()
{
    var_0 = _id_D397::_id_A97A( "kill pilot 01" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 5.6, -1, 8, 8 ) _id_D397::_id_ADE6( -0.5 ) _id_D397::_id_CCA7( level._id_CA22, "tag_eye" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 4.0 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 1.6 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 3.25 ) _id_D397::_id_B85E( 0.12, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.25 );
    var_0 _id_D397::_id_BC26();
}

_id_BA9A()
{
    var_0 = _id_D397::_id_A97A( "kill pilot 02" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 5.6, -1, 8, 8 ) _id_D397::_id_ADE6( -1 ) _id_D397::_id_CCA7( level._id_A969, "tag_eye" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 3.6 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 1.1 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.55 ) _id_D397::_id_B85E( 0.12, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.25 );
    var_0 _id_D397::_id_BEA0( 2.8 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BC26();
}

_id_C7CF()
{
    self.animname = "generic";
    self.disabledamagefeedbacksnd = 1;
    self.skipdeathsound = 1;
    level.player thread maps\_utility::_id_C92C( [ self ], "crawl_takedown", 145, 60, 90, 180, 0.25, ::_id_AA22, undefined, "viewmodel_commando_knife", undefined, undefined, 0.5, 0.5, 6, 1 );
    thread _id_CEF6();
}

_id_B7D5()
{
    maps\_utility::ai_ignore_everything();
    self.disabledamagefeedbacksnd = 1;
    self.skipdeathsound = 1;
    level.player thread maps\_utility::_id_C92C( [ self ], "impaled_takedown", 145, 60, 45, 180, 0.25, ::_id_AE5F, undefined, "viewmodel_commando_knife", undefined, undefined, 0.5, 0.5, 7 );
    thread _id_CEF6();
}

_id_CEF6()
{
    self waittill( "stealth_takedown_started" );
    common_scripts\utility::flag_set( "special_kill_anim_playing" );
    self waittill( "stealth_takedown_ended" );
    common_scripts\utility::flag_clear( "special_kill_anim_playing" );
}

impaled_takedown_additive_reset()
{
    self endon( "death" );
    var_0 = maps\_utility::getanim( "aim_controller_left" );
    var_1 = maps\_utility::getanim( "aim_controller_right" );
    self waittill( "stealth_takedown_started" );
    self setanimlimited( var_0, 0, 0.2, 1 );
    self setanimlimited( var_1, 0, 0.2, 1 );
}

_id_CE4B()
{
    maps\_utility::array_spawn_function_targetname( "impaled_spawner", ::_id_BCA4 );
    maps\_utility::array_spawn_function_targetname( "impaled_spawner", ::_id_B7D5 );
    maps\_utility::array_spawn_targetname( "impaled_spawner" );
}

_id_BCA4()
{
    level._id_A969 = self;
    self endon( "death" );
    self._id_AC61 = 0;
    self.animname = "impaled";
    maps\_utility::set_deathanim( "death" );
    self.health = 5;
    self.diequietly = 1;
    self.noragdoll = 1;
    self.allowdeath = 1;
    self.dropweapon = 0;
    self._id_A87F.martyr_ignore = 1;
    self.cheat._id_BDF2 = 1;
    self.cheat.attachheadlast = 1;
    maps\_utility::gun_remove();
    var_0 = spawn( "weapon_glock", ( 0.0, 0.0, 0.0 ), 1 );
    level._id_D0D2 = var_0;
    var_0 itemweaponsetammo( 0, 0 );
    var_0.origin = ( 27195.4, 32486.0, -9922.01 );
    var_0.angles = ( 14.9096, 214.163, -108.396 );
    thread _id_CCC3();
    var_1 = common_scripts\utility::getstruct( "impaled_guy", "targetname" );
    var_1 thread maps\_anim::anim_loop_solo( self, "idle" );
    var_0 linkto( self, "tag_weapon_chest", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    _id_CF9E();
    var_1 notify( "stop_loop" );
    self endon( "player_anim_started" );
    var_1 maps\_anim::anim_single_solo( self, "react" );
    var_1 thread maps\_anim::anim_loop_solo( self, "react_loop" );
    _id_A8B8();
    wait 5;
    self.alertlevel = "alert";
    self setlookatentity();
    self notify( "auto" );
    self.a.nodeath = 1;
    self.team = "neutral";
    var_2 = maps\_utility::getanim( "react_death" );
    var_3 = getanimlength( var_2 );
    var_1 thread maps\_anim::anim_single_solo( self, "react_death" );
    self notify( "stop_aim" );
    wait(var_3 - 0.2);
    self setcontents( 0 );
    self setanim( var_2, 1, 0, 0 );
    _id_C861();
}

_id_C666( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self ) )
        return;

    if ( !isalive( var_1 ) )
        return;

    if ( var_1 != level.player )
        return;

    common_scripts\utility::play_sound_in_space( "scn_afchase_dryfire_guy_death", self.origin );
}

_id_CF9E()
{
    if ( common_scripts\utility::flag( "impaled_guy_twitches" ) )
        return;

    level endon( "impaled_guy_twitches" );
    level endon( "run_shep_run" );

    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) < 480 )
            break;

        wait 0.05;
    }
}

_id_A8B8()
{
    var_0 = spawnstruct();
    var_0 maps\_utility::delaythread( 100, maps\_utility::send_notify, "stop" );
    var_0 endon( "stop" );

    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) < 300 )
            break;

        wait 0.05;
    }

    var_0 maps\_utility::delaythread( 5, maps\_utility::send_notify, "stop" );

    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) < 140 )
            break;

        wait 0.05;
    }
}

_id_CCC3()
{
    self endon( "auto" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self setlookatentity();
    _id_C861();
}

_id_C861()
{
    wait 1.5;
    _id_B66C();
    wait 2.0;
}

_id_BBD7()
{
    return 0;
}

_id_BC8F()
{
    var_0 = _id_C6C5();
    var_1 = 0;
    var_2 = 40;

    for (;;)
    {
        var_3 = var_0 gettagangles( "tag_player" );
        var_4 = level.player getplayerangles();
        var_4 = ( 0, var_4[1] + 8.9, 0 );
        var_5 = anglestoforward( var_4 );
        var_3 = ( 0, var_3[1], 0 );
        var_6 = anglestoforward( var_3 );
        var_7 = anglestoright( var_3 );
        var_8 = var_0 gettagorigin( "tag_player" );
        var_9 = var_8 + var_6 * 100 + var_7 * 8;
        var_10 = vectortoangles( var_9 - var_8 );
        var_11 = anglestoforward( var_10 );
        var_12 = vectordot( var_5, var_11 );

        if ( var_12 > 0.991 )
            var_1 += 2;
        else
        {
            if ( getdvarint( "x" ) )
            {

            }

            var_1 -= 1;
        }

        if ( var_1 >= var_2 )
            break;

        var_1 = clamp( var_1, 0, var_2 );
        wait 0.05;
    }
}

_id_AF45( var_0 )
{
    level._id_B416 endon( "death" );
    var_1 = var_0 gettagangles( "tag_player" );
    var_2 = anglestoforward( var_1 );
    var_3 = anglestoright( var_1 );
    var_4 = var_0 gettagorigin( "tag_player" );
    var_5 = var_4 + var_2 * 100 + var_3 * -40 + ( 0.0, 0.0, 32.0 );

    for (;;)
    {
        var_5 = level._id_B416 gettagorigin( "tag_eye" );

        if ( level.player worldpointinreticle_circle( var_5, 45, 90 ) )
            common_scripts\utility::flag_set( "player_aims_knife_at_shepherd" );
        else
        {
            if ( getdvarint( "x" ) )
            {

            }

            common_scripts\utility::flag_clear( "player_aims_knife_at_shepherd" );
        }

        wait 0.05;
    }
}

_id_B491( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0.5;

    var_2 = common_scripts\utility::getfx( "no_effect" );

    if ( isdefined( self._id_A9D9 ) )
        var_2 = common_scripts\utility::getfx( self._id_A9D9 );

    var_3 = _id_CF10();
    playfxontag( var_2, var_3, "TAG_FX" );
    level notify( "new_hurt" );
    level endon( "new_hurt" );

    if ( isdefined( self.override_anim_time ) )
        var_1 = self.override_anim_time;

    var_4 = level.player.origin + common_scripts\utility::randomvector( 1000 );
    var_5 = var_0 * 2.9;
    var_6 = var_0 * 0.25;
    setblur( var_5, 0 );
    setblur( 0, var_6 );
    var_7 = var_0 * 0.05;
    var_7 = clamp( var_7, 0, 0.4 );
    var_8 = var_0 * 0.02;
    var_8 = clamp( var_8, 0, 0.25 );
    var_9 = clamp( var_0, 0, 0.85 );
    var_10 = 0.2;
    var_11 = 1.5;
    var_12 = abs( var_10 - var_11 );
    var_13 = 1 - var_1;
    var_14 = var_13 * var_12 + var_10;
    var_15 = var_1 * 2;
    var_15 = clamp( var_15, 0.5, 2.0 );
    var_16 = randomfloatrange( 0.2, 0.6 );
}

new_pull_earthquake( var_0 )
{
    if ( isdefined( self.override_anim_time ) )
        var_0 = self.override_anim_time;

    var_1 = var_0 + 0.37;
    var_1 *= 0.22;
    earthquake( var_1, 5, level.player.origin, 5000 );
}

_id_C949()
{
    level endon( "player_throws_knife" );
    common_scripts\utility::flag_wait_or_timeout( "player_aims_knife_at_shepherd", 8 );
    wait 3;
    var_0 = 6;
    var_1 = get_black_overlay();
    var_1 fadeovertime( var_0 );
    var_1.alpha = 0;
    wait(var_0);
    var_2 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_3 = _id_C6C5();
    var_4 = _id_CF10();
    var_5 = [];
    var_5["knife"] = var_4;
    var_5["player_rig"] = var_3;
    var_2 thread maps\_anim::anim_single( var_5, "knifepull_throw_passout" );
    level.player lerpviewangleclamp( 2, 0.5, 0.5, 0, 0, 0, 0 );
    common_scripts\utility::flag_set( "missionfailed" );
    var_6 = _id_B6DC();
    var_6 fadeovertime( 1 );
    var_6.alpha = 0;
    maps\_utility::missionfailedwrapper( level._id_C88C );
}

_id_B6AF( var_0 )
{
    level.occumulator endon( "stop" );
    wait 3;
    var_1 = get_black_overlay();
    var_2 = 0;
    var_3 = -80;
    var_4 = -100;

    for (;;)
    {
        var_5 = level.occumulator.presses.size >= 2;

        if ( var_5 )
            var_2 += 2;
        else
            var_2 -= 1;

        if ( var_2 <= var_3 )
            break;

        var_2 = clamp( var_2, var_3, 20 );
        var_6 = var_2;
        var_6 /= var_4;
        var_6 = clamp( var_6, 0, 1 );
        var_1 fadeovertime( 0.2 );
        var_1.alpha = var_6;
        wait 0.05;
    }

    if ( isdefined( var_0 ) )
        level.player _meth_80B6( var_0 );

    thread maps\_utility::_id_CBD8();
    var_1 fadeovertime( 0.2 );
    var_1.alpha = 1;
    wait 0.2;
    maps\_utility::missionfailedwrapper( level._id_C88C );
}

_id_C7D3()
{
    level endon( "fight_C_is_over" );

    for (;;)
    {
        if ( isdefined( level.occumulator ) && isdefined( level.occumulator.presses ) )
            maps\af_chase_knife_fight::_id_C355( level.occumulator.presses.size / 6 * level.additive_pull_weight, 0.05 );

        wait 0.05;
    }
}

_id_CA9B( var_0 )
{
    level endon( "missionfailed" );
    var_1 = _id_C6C5();
    var_2 = _id_CF10();
    var_3 = [];
    var_3["knife"] = var_2;
    var_3["player_rig"] = var_1;
    var_1 = _id_C6C5();
    var_4 = use_pressed();
    var_5 = 0;
    var_6 = 0;

    if ( !isdefined( level.occumulator ) )
        var_7 = spawnstruct();
    else
        var_7 = level.occumulator;

    var_7 thread occumulate_player_use_presses( self );
    level.occumulator = var_7;
    thread _id_B6AF( self.rumble_loop );
    var_8 = 0;
    var_9 = 500;
    var_10 = 0;
    var_11 = abs( var_9 - var_10 );
    var_12 = spawnstruct();
    var_13 = 2;
    var_14 = 5;
    var_15 = 0;
    var_16 = var_1 maps\_utility::getanim( var_0 );
    var_17 = 0;
    var_18 = 0;
    var_19 = 0;

    for (;;)
    {
        var_20 = use_pressed();
        var_21 = 0;
        var_6 = 0;

        if ( var_20 && !var_4 )
        {
            if ( !var_19 )
            {
                var_19 = 1;
                level.player _meth_80B5( self.rumble_loop );
            }

            if ( randomint( 100 ) > self.min_heavy )
                level.player playrumblelooponentity( "damage_heavy" );
            else if ( randomint( 100 ) > self.min_light )
                level.player playrumblelooponentity( "damage_light" );

            var_7.presses[var_7.presses.size] = gettime();
            var_5 = gettime();
            var_6 = ( sin( gettime() * 0.2 ) + 1 ) * 0.5;
            var_6 *= self.range;
            var_6 += self.rate;
            var_21 = 1;

            if ( var_1 getanimtime( var_16 ) > 0.05 )
            {
                if ( self._id_BCBC && gettime() > var_8 )
                {
                    var_8 = gettime() + randomintrange( 450, 850 );
                    var_22 = randomfloatrange( var_13, var_14 );
                    var_22 = clamp( var_22, 1, 50 );
                    var_13 *= 1.15;
                    var_14 *= 1.15;

                    if ( isdefined( self._id_CE34 ) )
                        var_22 = self._id_CE34;

                    thread _id_B491( var_22, var_18 );
                }
            }
        }

        if ( var_19 && gettime() > var_5 + 300 )
        {
            var_19 = 0;
            level.player _meth_80B6( self.rumble_loop );
        }

        var_4 = var_20;
        var_23 = 0;
        var_18 = undefined;

        foreach ( var_25 in var_3 )
        {
            var_16 = var_25 maps\_utility::getanim( var_0 );
            var_25 _meth_83D4( var_16, var_6 );
            var_18 = var_25 getanimtime( var_16 );

            if ( var_18 >= 0.95 )
                var_23 = 1;
        }

        if ( isdefined( self.set_pull_weight ) )
            level.additive_pull_weight = var_18;

        if ( isdefined( self.auto_occumulator_base ) )
        {
            var_7.occumulator_base = 1 - var_18;
            var_7.occumulator_base *= 7;
            var_7.occumulator_base = clamp( var_7.occumulator_base, 7, 1 );
        }

        var_27 = abs( var_17 - var_18 );

        if ( var_27 > 0.05 )
        {
            new_pull_earthquake( var_18 );
            var_17 = var_18;
        }

        if ( var_23 )
            break;

        wait 0.05;
    }

    level notify( "new_hurt" );
    var_7 notify( "stop" );

    if ( var_0 != "knifepull_pull_01" )
        level.occumulator = undefined;

    _id_B3EA( 1 );

    if ( var_19 )
        level.player _meth_80B6( self.rumble_loop );

    foreach ( var_25 in var_3 )
    {
        var_16 = var_25 maps\_utility::getanim( var_0 );
        var_25 setanim( var_16, 1, 0, 0.06 );
    }

    if ( var_0 == "knifepull_pull_02" )
        thread maps\_utility::_id_BA76();
}

_id_C88E( var_0 )
{
    level endon( "knife_pulled_out" );
    var_1 = use_pressed();
    var_2 = var_0 maps\_utility::getanim( "pull_additive_root" );
    var_3 = var_0 maps\_utility::getanim( "pull_additive_02" );
    var_4 = 0;
    var_5 = getanimlength( var_3 );
    var_0 setanimrestart( var_3, 1, 0, 1 );

    for (;;)
    {
        var_6 = use_pressed();

        if ( var_6 && !var_1 )
        {
            var_7 = level.additive_pull_weight;

            if ( !var_4 && common_scripts\utility::flag( "two_hand_pull_begins" ) )
            {
                var_0 clearanim( var_3, 0 );
                var_4 = 1;
                var_3 = var_0 maps\_utility::getanim( "pull_additive_03" );
            }

            var_0 setanim( var_2, var_7, 0.1, 1 );
            var_0 setanim( var_3, var_7, 0, 1 );
            thread _id_B336( var_2, var_0, var_5 );
        }

        var_1 = var_6;
        wait 0.05;
    }
}

_id_B336( var_0, var_1, var_2 )
{
    level notify( "new_blend_out_pull_additive" );
    level endon( "new_blend_out_pull_additive" );
    wait(var_2);
    var_1 setanim( var_0, 0, 0.2, 1 );
}

_id_BB1F( var_0 )
{
    var_1 = var_0 gettagangles( "tag_player" );
    var_2 = anglestoforward( var_1 );
    var_3 = anglestoright( var_1 );
    var_4 = var_0 gettagorigin( "tag_player" );
    var_5 = var_4 + var_2 * 100 + var_3 * 32 + ( 0.0, 0.0, 32.0 );
    var_6 = _id_B991();
    var_6.origin = var_4 + var_2 * 250 + var_3 * -75;
}

_id_B6DE()
{
    level endon( "stop_track_melee" );
    level._id_B46E = gettime();

    for (;;)
    {
        if ( level.player ismeleeing() )
        {
            level._id_B46E = gettime();

            while ( level.player ismeleeing() )
                wait 0.05;

            continue;
        }

        wait 0.05;
    }
}

_id_C2C1( var_0 )
{
    level notify( "no_more_shepherd_idle" );
    level endon( "no_more_shepherd_idle" );
    level._id_C4C6 = 1;
    var_1 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );

    for ( var_2 = distance( level.player.origin, level._id_B416.origin ); var_2 < 500 && level._id_C5D3 < var_0.size; var_2 = distance( level.player.origin, level._id_B416.origin ) )
    {
        var_1 maps\_anim::anim_single_solo( level._id_B416, var_0[level._id_C5D3] );
        level._id_C5D3++;
    }

    level._id_C4C6 = undefined;
    var_1 notify( "player_arrived" );
    thread maps\af_chase_knife_fight::_id_C0DB();
}

_id_C4D6()
{
    var_0 = 13;
    var_1 = 10;
    var_2 = 14;
    var_3 = 0;
    level._id_C5D3 = 0;
    var_4 = [];
    var_4[var_4.size] = "nearcar_monologue_1";
    var_4[var_4.size] = "nearcar_monologue_2";
    var_4[var_4.size] = "nearcar_monologue_3";
    var_4[var_4.size] = "nearcar_monologue_4";
    var_4[var_4.size] = "nearcar_monologue_5";
    var_4[var_4.size] = "nearcar_monologue_6";
    var_5 = gettime() + 11000;
    var_6 = gettime() + 4000;
    thread _id_B6DE();
    var_7 = 0;
    var_8 = 250;
    var_9 = 100;
    level.player disableweaponswitch();

    for (;;)
    {
        var_10 = distance( level.player.origin, level._id_B416.origin );

        if ( var_10 < var_8 && !var_7 && level.player _meth_8599() )
        {
            var_7 = 1;
            level.player thread maps\_utility::play_sound_on_entity( "scn_afchase_tbuckle_pullknife_mono" );
        }
        else if ( var_10 > var_8 + var_9 && var_7 && level.player _meth_8599() )
        {
            var_7 = 0;
            level.player thread maps\_utility::play_sound_on_entity( "scn_afchase_tbuckle_holster_knife" );
        }

        if ( var_10 < 500 )
            common_scripts\utility::flag_set( "shepherd_should_do_idle_b" );
        else
            common_scripts\utility::flag_clear( "shepherd_should_do_idle_b" );

        if ( _id_CED7( var_10 ) )
            break;

        if ( _id_C730( var_10 ) )
            break;
        else if ( var_10 < 300 && gettime() > var_5 )
        {
            if ( !common_scripts\utility::flag( "player_near_shepherd" ) )
            {
                common_scripts\utility::flag_set( "player_near_shepherd" );
                var_5 = gettime() + var_0 * 1000;
            }
            else if ( var_10 < 500 && !isdefined( level._id_C4C6 ) && level._id_C5D3 < var_4.size )
                thread _id_C2C1( var_4 );
        }
        else if ( _id_ABFA( var_10, var_6 ) )
        {
            level._id_B416 thread maps\_utility::play_sound_on_entity( "shepherd_cough" );
            var_6 = gettime() + randomintrange( 4000, 7000 );
        }

        wait 0.05;
    }

    level notify( "stop_track_melee" );
    level.player playrumbleonentity();
}

_id_ABFA( var_0, var_1 )
{
    if ( var_0 < 400 )
        return 0;

    if ( var_0 > 700 )
        return 0;

    if ( gettime() < var_1 )
        return 0;

    if ( isalive( level._id_D0C2 ) )
        return 0;

    if ( isdefined( level._id_C4C6 ) )
        return 0;

    return 1;
}

_id_BDCE()
{
    if ( common_scripts\utility::flag( "price_was_killed" ) )
        return 1;

    if ( common_scripts\utility::is_player_gamepad_enabled() )
        return level.player _meth_8109();
    else
        return level.player adsbuttonpressed();
}

_id_C15B()
{
    if ( common_scripts\utility::flag( "price_was_killed" ) )
        return 1;

    if ( common_scripts\utility::is_player_gamepad_enabled() )
        return level.player vehicleattackbuttonpressed();
    else
        return level.player attackbuttonpressed();
}

_id_C99B()
{
    var_0 = common_scripts\utility::getstruct( "turnbuckle_start", "targetname" );
    level.player maps\_utility::teleport_ent( var_0 );
}

_id_AC4C()
{
    var_0 = level.player getnormalizedmovement();
    var_1 = abs( var_0[0] );
    var_2 = abs( var_0[1] );

    if ( var_1 > var_2 )
        return var_1;

    return var_2;
}

_id_C25B( var_0 )
{
    var_1 = _id_B7B3();
    var_0 = _id_B991();
    level notify( "dof_target_to_gun_crawl" );
    var_0._id_AB7F = 300;
    var_0._id_C52E = 128;
    var_0._id_C80B = 4.5;
    var_0._id_BED9 = 2.5;
    var_0 _id_C5EA( var_1, "J_Cylinder_Rot", 1 );
}

_id_ADA3()
{
    level._id_BD82 moveto( level._id_BD82.origin + ( 100.0, 0.0, 0.0 ), 4.7, 0, 0 );
}

_id_B7EB()
{
    self endon( "stop_loop" );
    maps\_anim::anim_single_solo( level.price, "gun_kick_price" );
    maps\_anim::anim_loop_solo( level.price, "gun_kick_price_loop" );
}

_id_B404()
{
    level endon( "stop_idle_crawl_fight" );
    common_scripts\utility::flag_set( "fade_away_idle_crawl_fight" );
    var_0 = 1;
    wait(var_0);
    level._id_B416 unlink();
    level.price unlink();
    var_1 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_2 = _id_C3AA();
    var_2.angles = ( 0.0, 0.0, 0.0 );
    var_2.origin = ( 27883.7, 33797.1, -9954.29 );
    level._id_AFDA = var_2;
    var_3 = var_2.origin;
    var_4 = "gun_kick_price";
    var_5 = level.price maps\_utility::getanim( var_4 );
    var_6 = getanimlength( var_5 );
    thread _id_C413( var_4, var_6 );
    level.price thread maps\_utility::play_sound_on_entity( "scn_afchase_collapse_foley_stereo" );
    var_2 thread _id_B7EB();
    wait 0.05;
    var_2 moveto( var_3, 0.5, 0, 0 );
    level notify( "stop_idle_crawl_fight_just_the_fight" );
    var_1 maps\_anim::anim_first_frame_solo( level._id_B416, "turn_buckle" );
    wait 10;
    wait(var_6);
    level notify( "stop_idle_crawl_fight" );
}

_id_C8F9()
{
    level endon( "stop_idle_crawl_fight" );
    level endon( "stop_idle_crawl_fight_just_the_fight" );
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_1 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_2 = [];
    var_2["shepherd"] = level._id_B416;
    var_2["price"] = level.price;
    var_3 = 0.06;
    var_4 = 0.56;
    var_5 = level._id_B416 maps\_utility::getanim( "crawl" );
    var_6 = getanimlength( var_5 );
    var_7 = ( var_4 - var_3 ) * var_6;
    var_1 thread maps\_anim::anim_single( var_2, "crawl" );
    wait 0.05;
    level.price playsound( "scn_afchase_b_longoff_price_foley" );
    level._id_B416 playsound( "scn_afchase_b_longoff_shep_foley" );
    level.price common_scripts\utility::delaycall( 0.5, ::playsound, "scn_afchase_b_longoff_block1" );
    level._id_B416 common_scripts\utility::delaycall( 2, ::playsound, "scn_afchase_b_longoff_lifthead2" );
    level._id_B416 common_scripts\utility::delaycall( 3.25, ::playsound, "scn_afchase_b_longoff_headbutt3" );
}

_id_BFA9()
{
    level waittill( "stop_idle_crawl_fight" );
    self delete();
}

_id_B37D()
{
    level endon( "dof_target_to_gun_crawl" );
    var_0 = _id_C6C5();
    var_1 = _id_B991();
    var_1 _id_C5EA( var_0, "J_Wrist_LE", 1.5 );
}

_id_AED8( var_0, var_1, var_2, var_3 )
{
    var_4 = gettime();
    var_5 = var_4 + 300;
    var_6 = var_4 + 2150;
    var_7 = var_4 + 4000;
    var_8 = 0;
    var_9 = 0;

    if ( var_2 == 0 )
    {
        var_5 = var_4 + 1400;
        var_6 = var_4 + 4150;
        var_7 = var_4 + 7000;
    }

    if ( var_2 > 2 )
    {
        var_5 = var_4 + 1400;
        var_6 = var_4 + 2150;
        var_7 = var_4 + 4000;
    }

    for (;;)
    {
        var_10 = level.player [[ var_0[var_2] ]]();
        var_11 = _id_B07F( var_1, var_2 );

        if ( var_3 && var_5 < gettime() && !var_8 )
        {
            var_8 = 1;
            level.player maps\_utility::hintdisplayhandler( var_1._id_C211[var_2] );
        }

        if ( var_6 < gettime() && !var_9 )
        {
            var_9 = 1;
            thread _id_CB6E();
        }

        if ( var_7 < gettime() )
        {
            common_scripts\utility::flag_set( "price_was_killed" );
            maps\_utility::missionfailedwrapper( level._id_C88C );
            level waittill( "never" );
        }

        if ( var_10 && !var_11 )
        {
            level notify( "clear_hurt_pulses" );
            return;
        }

        wait 0.05;
    }
}

_id_CB6E()
{
    _id_A8F1( 2 );
    setblur( 4, 4 );
    thread _id_D51D();
    level waittill( "clear_hurt_pulses" );
    thread _id_AC96();
    setblur( 0, 0.5 );
    _id_B3EA( 0.23 );
}

_id_D51D()
{
    level endon( "crawl_breath_recover" );
    level.player maps\_utility::play_sound_on_entity( "breathing_hurt_start" );

    for (;;)
    {
        wait(randomfloatrange( 0.76, 1.7 ));
        level.player maps\_utility::play_sound_on_entity( "breathing_hurt" );
    }
}

_id_AC96()
{
    level notify( "crawl_breath_recover" );
    level.player thread maps\_utility::play_sound_on_entity( "breathing_better" );
}

_id_B4E2()
{

}

_id_B07F( var_0, var_1 )
{
    var_2 = gettime() - var_0._id_B59D[var_1];
    return var_2 > 750;
}

_id_C159( var_0, var_1, var_2 )
{
    var_3 = [];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
        var_3[var_4] = gettime();

    var_0._id_B59D = var_3;
    var_0._id_C211 = var_2;

    for (;;)
    {
        foreach ( var_7, var_6 in var_1 )
        {
            if ( !level.player [[ var_6 ]]() )
                var_0._id_B59D[var_7] = gettime();
        }

        wait 0.05;
    }
}

_id_B492( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3 linkto( var_0, var_1, ( 0.0, 0.0, 0.0 ), ( 0, var_2, 0 ) );
    level.player playerlinktodelta( var_3, "tag_origin", 1, 0, 0, 0, 0, 1 );
}

_id_C5EA( var_0, var_1, var_2 )
{
    thread _id_B5C2( var_0, var_1, var_2 );
}

_id_B5C2( var_0, var_1, var_2 )
{
    self notify( "new_move_to_tag" );
    self endon( "new_move_to_tag" );
    var_3 = gettime() + var_2 * 1000;
    var_4 = var_0 gettagorigin( var_1 );
    self unlink();
    self moveto( var_4, var_2 );

    while ( gettime() < var_3 )
    {
        var_5 = var_0 gettagorigin( var_1 );

        if ( var_5 != var_4 )
        {
            var_4 = var_5;
            var_2 = ( var_3 - gettime() ) / 1000;
            self moveto( var_4, var_2 );
        }

        wait 0.05;
    }

    self linktoblendtotag( var_0, var_1 );
}

_id_C3AA()
{
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles;
    return var_1;
}

_id_B135()
{
    common_scripts\utility::flag_wait_or_timeout( "player_looks_at_knife", 3.5 );
    var_0 = 1.2;

    if ( !common_scripts\utility::flag( "player_looks_at_knife" ) )
        var_0 = 3.0;

    var_1 = _id_CF10();
    var_2 = var_1 gettagorigin( "tag_knife" );
    childthread _id_C38C( var_0 );
    wait(var_0);
    common_scripts\utility::flag_set( "focused_on_knife" );
    wait 6;
    common_scripts\utility::flag_set( "player_looks_at_knife" );
}

_id_D4D9()
{
    if ( common_scripts\utility::flag( "player_uses_knife" ) )
        return;

    level endon( "player_uses_knife" );
    var_0 = "fight_C";
    var_1 = level._id_B416 maps\_utility::getanim( var_0 );

    for (;;)
    {
        if ( level._id_B416 getanimtime( var_1 ) >= 0.57 )
            break;

        wait 0.05;
    }

    maps\_utility::_id_CBD8();
    maps\_utility::missionfailedwrapper( level._id_C88C );
}

_id_B40C()
{
    level endon( "fight_C_is_over" );
    var_0 = "fight_C";
    var_1 = level._id_B416 maps\_utility::getanim( var_0 );

    for (;;)
    {
        if ( level._id_B416 getanimtime( var_1 ) >= 0.6 )
            break;

        wait 0.05;
    }
}

_id_D47E( var_0 )
{
    self notify( "stop_loop" );
    level notify( "throw_soon" );
    level endon( "throw_soon" );
    level endon( "missionfailed" );
    var_1 = var_0["player_rig"] getanimtime( var_0["player_rig"] maps\_utility::getanim( "knifepull_pullout_flip_idle" )[0] );
    maps\_anim::anim_single( var_0, "prethrow" );
    thread maps\_anim::anim_loop( var_0, "knifepull_pullout_flip_idle" );

    foreach ( var_3 in var_0 )
        var_3 setanimtime( var_3 maps\_utility::getanim( "knifepull_pullout_flip_idle" )[0], var_1 );
}

_id_BE34()
{
    if ( common_scripts\utility::flag( "missionfailed" ) )
        return;

    level endon( "missionfailed" );
    level endon( "player_throws_knife" );
    var_0 = common_scripts\utility::getstruct( "end_scene_org_02", "targetname" );
    var_1 = _id_C6C5();
    var_2 = _id_CF10();
    var_3 = [];
    var_3["player_rig"] = var_1;
    var_3["knife"] = var_2;
    var_4 = 0;

    for (;;)
    {
        level.player waittill( "throw" );

        if ( common_scripts\utility::flag( "player_aims_knife_at_shepherd" ) )
        {
            common_scripts\utility::flag_set( "player_throws_knife" );
            continue;
        }

        if ( gettime() > var_4 + 1000 )
        {
            var_0 thread _id_D47E( var_3 );
            var_4 = gettime();
        }
    }
}

_id_B8B1( var_0 )
{
    level endon( "player_throws_knife" );
    level.player notifyonplayercommand( "throw", "+attack" );
    level.player notifyonplayercommand( "throw", "+melee" );
    setomnvar( "ui_consciousness_play", 0 );
    thread _id_BE34();
    var_1 = 1;
    var_2 = _id_CF10();

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "player_aims_knife_at_shepherd" );
        var_0.color = ( 1.0, 1.0, 1.0 );
        thread _id_C38C( 1 );
        common_scripts\utility::flag_wait( "player_aims_knife_at_shepherd" );
        var_0.color = ( 1.0, 0.0, 0.0 );
        var_3 = level._id_B416 gettagorigin( "tag_eye" );
        thread _id_BB6A( 1 );
    }
}

_id_C725( var_0 )
{
    common_scripts\utility::flag_wait( "turn_buckle_fadeout" );
    setblur( 3.5, var_0 * 0.75 );
    _id_A8F1( var_0 );
    wait(var_0);
}

_id_CA1C( var_0 )
{
    wait 3.5;
    var_1 = gettime() - var_0 * 1000;
    maps\_utility::stop_exploder( "waterfall_ending" );
    maps\_utility::wait_for_buffer_time_to_pass( var_1, 5.7 );
    level._id_B416 maps\_utility::delaythread( 7.5, maps\_utility::play_sound_on_entity, "afchase_shp_fiveyearsago_b" );
    level._id_B416 maps\_utility::play_sound_on_tag( "afchase_shp_fiveyearsago", "J_Jaw" );
    var_2 = 2.1;
    wait(var_2);

    // if ( isdefined( level._id_B416._id_A87F.polterghostmode ) && level._id_B416._id_A87F.polterghostmode )
    //     level._id_B416._id_A87F.polterghostmode_previousmodel = "body_vil_shepherd_no_gun_dmg";
    // else
    //     level._id_B416 setmodel( "body_vil_shepherd_no_gun_dmg" );

    common_scripts\utility::flag_set( "gloat_fade_in" );
    maps\_utility::wait_for_buffer_time_to_pass( var_1, 16.8 + var_2 );
    soundscripts\_snd::snd_message( "aud_start_gun_monologue" );
}

_id_CDF8()
{
    wait 15.1;
    wait 3;
    wait 4;
    wait 2.8;
    level notify( "stop_blinding" );
}

_id_C587()
{
    var_0 = getentarray( "fence_remove_at_heli_landing", "targetname" );
    common_scripts\utility::array_call( var_0, ::delete );
}

_id_CE71( var_0 )
{
    var_1 = common_scripts\utility::getfx( "heli_blinds_player" );
    level endon( "stop_blinding" );
    var_2 = ( var_0.origin + level.player.origin ) / 2;
    var_2 = maps\_utility::set_z( var_2, level.player.origin[2] );

    for (;;)
    {
        var_3 = common_scripts\utility::randomvectorrange( -255, 255 );
        var_3 = common_scripts\utility::flat_origin( var_3 );
        playfx( var_1, var_2 + var_3 );
        wait 0.4;
    }
}

_id_AC22( var_0 )
{
    var_1 = _id_B991();
    var_2 = _id_B7B3();
    var_1 _id_C5EA( var_2, "TAG_FLASH", 0.7 );
}

_id_AC39()
{
    var_0 = _id_B7B3();
    var_1 = common_scripts\utility::getfx( "shepherd_anaconda" );
    var_2 = "TAG_FLASH";
    playfxontag( var_1, var_0, var_2 );
    var_3 = var_0 gettagorigin( var_2 );
    thread common_scripts\utility::play_sound_in_space( "weap_anaconda_fire_plr", var_3 );
    soundscripts\_snd::snd_message( "aud_shepherd_gloat_shot_tinnitus" );
}

_id_CF69( var_0, var_1 )
{
    level.player playerlinktodelta( var_0, var_1, 1, 30, 30, 30, 20, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_AF02( var_0 )
{
    soundscripts\_snd::snd_message( "aud_start_mix_plr_curb_stomp" );
    var_1 = get_black_overlay();
    var_1.alpha = 1;
    thread _id_B433( 0.5, 0.1 );
}

_id_AA11()
{
    var_0 = [];
    var_0["b"] = common_scripts\utility::getstruct( "end_scene_org_fight_B", "targetname" );
    var_0["c"] = common_scripts\utility::getstruct( "end_scene_org_fight_C", "targetname" );
    var_1 = _id_C6A4();
    var_2 = _id_BC19();
    var_3 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_3.origin = var_1.origin;
    var_3.angles = var_1.angles;
    var_4 = [];

    foreach ( var_6 in var_0 )
    {
        var_7 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        var_7.origin = var_6.origin;
        var_7.angles = var_6.angles;
        var_7.targetname = var_6.targetname;
    }

    var_3.origin = var_2.origin;
    var_3.angles = var_2.angles;
}

_id_CD95()
{
    var_0 = 17;
    level notify( "stop_sandstorm_fog" );
}

_id_CC49()
{
    level endon( "stop_random_breathing_sounds" );
    var_0 = "scn_breath_walking";

    for (;;)
    {
        if ( !common_scripts\utility::flag( "player_is_in_dizzy_stumble" ) )
        {
            var_1 = level.player geteye();
            common_scripts\utility::play_sound_in_space( var_0, var_1 );
        }

        var_2 = randomfloatrange( 1, 3 );
        wait(var_2);
    }
}

_id_C657( var_0 )
{
    if ( level.start_point != "kill" )
    {
        var_1 = "fight_E";
        var_2 = level.price maps\_utility::getanim( var_1 );
        var_3 = getanimlength( var_2 );
        thread _id_C413( var_1, var_3 );
        maps\_anim::anim_single( var_0, var_1 );
    }

    thread maps\_anim::anim_loop( var_0, "fight_E_loop" );
}

_id_C153()
{
    self endon( "death" );

    for (;;)
    {
        setsaveddvar( "cg_fov", self.origin[0] );
        wait 0.05;
    }
}

_id_C72F( var_0 )
{
    level.player lerpviewangleclamp( var_0, var_0 * 0.75, var_0 * 0.25, 4, 4, 5, 10 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_C76A( var_0 )
{
    level waittill( "link_player" );
    waittillframeend;
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1 linkto( var_0, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 25.0, 0.0 ) );
    thread _id_B492( var_1, "tag_origin", 0 );
    wait 1;
    var_2 = 0.5;
    level.player playerlinktodelta( var_1, "tag_origin", 1, 5, 15, 15, 0, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_CF00( var_0 )
{
    level.player playerlinktodelta( var_0, "tag_player", 1, 0, 0, 0, 0 );
}

_id_C7DB()
{
    if ( common_scripts\utility::flag( "player_looks_at_knife" ) )
        return;

    level endon( "player_looks_at_knife" );
    wait 6;
    _id_C72F( 8 );
}

_id_BBA7( var_0 )
{
    var_1 = 1.5;

    if ( level.start_point == "kill" )
        var_1 = 0;

    level.player playerlinktoblend( var_0, "tag_player", var_1, var_1 * 0.3, var_1 * 0.5 );
    level waittill( "aim_at_shepherd" );
    level.player playerlinktodelta( var_0, "tag_player", 1, 30, 60, 20, 20, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    level waittill( "pull_back_knife_anim_starts" );
    var_1 = 1;
    level.player lerpviewangleclamp( var_1, 0, var_1, 0, 0, 0, 0 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    common_scripts\utility::flag_wait( "shepherd_killed" );
    soundscripts\_snd::snd_message( "aud_start_mix_sheperd_slomo_death" );
    wait 3.2;
    var_1 = 2;
    level.player lerpviewangleclamp( var_1, var_1 * 0.5, var_1 * 0.5, 10, 15, 5, 10 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 3;
    var_1 = 4;
    level.player lerpviewangleclamp( var_1, var_1 * 0.5, var_1 * 0.5, 3, 3, 3, 3 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    soundscripts\_snd::snd_message( "aud_start_mix_shepherd_is_dead" );
}

_id_AD8D()
{
    level._id_C381.origin = ( 45.0, 0.0, 0.0 );
}

_id_AABC()
{
    thread _id_B135();
    common_scripts\utility::flag_wait( "focused_on_knife" );
    level notify( "player_used_knife" );
}

_id_BC66()
{
    childthread _id_B135();
    level endon( "fail_quick_hint" );
    thread _id_C244();
    _id_C72F( 1 );
    common_scripts\utility::flag_set( "player_looks_at_knife" );
    common_scripts\utility::flag_wait( "focused_on_knife" );
    wait 7.15;
    soundscripts\_snd::snd_message( "aud_start_player_knife_pullout" );
    wait 3;
    thread _id_D4D9();

    if ( !isdefined( level.player._id_B1FD ) )
    {
        _id_C1BA();
        maps\_utility::_id_B55D();
    }

    thread _id_CF0F();

    for (;;)
    {
        if ( use_pressed() )
            break;

        wait 0.05;
    }

    _id_B3EA( 0.5 );
    level notify( "player_used_knife" );
    thread maps\_utility::_id_BA76();
}

_id_CF0F()
{
    level endon( "player_used_knife" );
    level.player endon( "pressed_use" );
    wait 4.5;
    _id_A8F1( 6 );
    wait 5;
    thread maps\_utility::_id_CBD8();
    maps\_utility::missionfailedwrapper( level._id_C88C );
}

_id_C244()
{
    var_0 = use_pressed();

    for (;;)
    {
        if ( !var_0 && use_pressed() )
            break;

        var_0 = use_pressed();
        wait 0.05;
    }

    level.player notify( "pressed_use" );
}

_id_CEF3()
{
    level._id_B836 = 800;
    level._id_BB65.min = 0.5;
    level._id_BB65._id_59F9 = 0.8;
}

occumulate_player_use_presses( var_0 )
{
    self endon( "stop" );
    var_1 = 1500;

    if ( !isdefined( self.presses ) )
        self.presses = [];
    else
    {
        var_2 = [];

        foreach ( var_4 in self.presses )
            var_2[var_2.size] = var_4 + 1000;

        self.presses = var_2;
    }

    var_6 = 7;

    for (;;)
    {
        waittillframeend;

        for ( var_7 = 0; var_7 < self.presses.size; var_7++ )
        {
            var_4 = self.presses[var_7];

            if ( var_4 < gettime() - var_1 )
                continue;

            break;
        }

        for ( var_8 = []; var_7 < self.presses.size; var_7++ )
            var_8[var_8.size] = self.presses[var_7];

        self.presses = var_8;
        var_9 = ( self.presses.size - var_0.occumulator_base ) * 0.03;
        var_9 *= 10;
        var_9 = clamp( var_9, 0, 1.0 );
        self.occumulator_scale = var_9;
        wait 0.05;
    }
}

_id_B410()
{

}

_id_A810()
{
    wait 21;
    var_0 = get_black_overlay();
    var_0 fadeovertime( 1.0 );
    var_0.alpha = 0.5;
    level.player maps\_utility::delaythread( 0.2, maps\_utility::play_sound_on_entity, "breathing_hurt_start" );
    wait 1.4;
    var_0 fadeovertime( 1.0 );
    var_0.alpha = 0.0;
}

_id_D12B()
{
    var_0 = gettime();
    wait 2.95;
    maps\_utility::slowmo_start();
    maps\_utility::slowmo_setspeed_slow( 0.2 );
    maps\_utility::slowmo_setlerptime_in( 0 );
    maps\_utility::slowmo_lerp_in();
    maps\_utility::wait_for_buffer_time_to_pass( var_0, 3.85 );
    maps\_utility::slowmo_setlerptime_out( 0.5 );
    maps\_utility::slowmo_lerp_out();
    maps\_utility::slowmo_end();
}

_id_C1D9()
{
    var_0 = _id_CF10();
    var_0 setmodel( "weapon_commando_knife_bloody" );
}

_id_BD20()
{
    if ( !isai( level._id_B416 ) )
        return;

    var_0 = level._id_B416.animname;

    if ( isdefined( level._id_B416.magic_bullet_shield ) )
        level._id_B416 maps\_utility::stop_magic_bullet_shield();

    level._id_B416 = maps\_vehicle_aianim::convert_guy_to_drone( level._id_B416 );
    objective_onentity( 3, level._id_B416 );
    level._id_D242 = level._id_B416;
    level._id_B416.animname = var_0;
    level._id_B416.script = "empty_script";
    level._id_B416.dontdonotetracks = 1;
}

_id_AE90()
{

}

_id_CE3C( var_0 )
{
    level.player shellshock( var_0, 1 );
}

_id_C92E()
{
    self.script_delay -= 3;
    maps\_utility::script_delay();
    var_0 = common_scripts\utility::getfx( "bloodpool_ending" );
    var_1 = self.angles;
    var_2 = anglestoforward( var_1 );
    var_3 = anglestoup( var_1 );
    playfx( var_0, self.origin, var_3, var_2 );
}

_id_C2F1()
{
    var_0 = 10;
    level.player lerpviewangleclamp( 0.6, 0.25, 0.25, var_0, var_0, var_0, var_0 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
}

_id_CFD0()
{
    var_0 = ( 27756.9, 33994.4, -9962.5 );
    var_1 = [];
    var_1[var_1.size] = "prop_misc_literock_small_01";
    var_1[var_1.size] = "prop_misc_literock_small_02";
    var_1[var_1.size] = "prop_misc_literock_small_03";
    var_1[var_1.size] = "prop_misc_literock_small_04";
    var_1[var_1.size] = "prop_misc_literock_small_05";
    var_1[var_1.size] = "prop_misc_literock_small_06";
    var_1[var_1.size] = "prop_misc_literock_small_07";
    var_1[var_1.size] = "prop_misc_literock_small_08";

    for ( var_2 = 0; var_2 < 24; var_2++ )
    {
        var_3 = common_scripts\utility::randomvector( 200 );
        var_3 = maps\_utility::set_z( var_3, 0 );
        var_4 = var_0 + var_3;
        var_5 = randomint( var_1.size );
        var_6 = spawn( "script_model", var_4 );
        var_6 setmodel( var_1[var_5] );
        var_6 physicslaunchclient( var_6.origin, ( 0.0, 0.0, 1.0 ) );
    }
}

_id_CE49()
{
    thread _id_AD5B( "j_ball_le", "j_ankle_le" );
    thread _id_AD5B( "j_ball_ri", "j_ankle_ri" );
}

_id_B6BE( var_0, var_1 )
{
    var_2 = self gettagorigin( var_0 );
    var_3 = self gettagorigin( var_1 );
    return var_2 * 0.5 + var_3 * 0.5;
}

_id_AD5B( var_0, var_1 )
{
    self endon( "death" );
    var_2 = _id_B6BE( var_0, var_1 );

    for (;;)
    {
        var_3 = _id_B6BE( var_0, var_1 );
        var_4 = var_3 + ( 0.0, 0.0, 6.0 );
        var_5 = vectortoangles( var_4 - var_2 );
        var_6 = anglestoforward( var_5 );
        var_7 = distance( var_2, var_3 );
        var_8 = var_7 * var_6;
        var_8 *= 0.04;
        var_2 = var_3;
        wait 0.2;
    }
}

_id_C824( var_0 )
{
    var_1 = self.script_percent * 0.01;
    var_2 = var_0 * var_1;
    wait(var_2);
    var_3 = self.radius;
    var_4 = var_3 * 0.005;
    var_5 = self.origin + ( 0.0, 0.0, 4.0 );
    physicsexplosioncylinder( var_5, var_3, var_3 * 0.75, var_4 );
}

_id_C413( var_0, var_1 )
{
    foreach ( var_3 in level._id_CD72[var_0] )
        var_3 thread _id_C824( var_1 );
}

_id_D545()
{
    var_0 = common_scripts\utility::getstructarray( "physics_struct", "targetname" );
    var_1 = [];
    var_2 = spawnstruct();
    var_2.origin = ( 27880.0, 34109.0, -9946.0 );
    var_2.script_percent = 6.1;
    var_2.radius = 15;
    var_2.script_noteworthy = "gun_kick_price";
    var_0[var_0.size] = var_2;
    var_2 = spawnstruct();
    var_2.origin = ( 27869.0, 34040.0, -9961.0 );
    var_2.script_percent = 33.9;
    var_2.radius = 15;
    var_2.script_noteworthy = "gun_kick";
    var_0[var_0.size] = var_2;

    foreach ( var_4 in var_0 )
    {
        var_5 = var_4.script_noteworthy;

        if ( !isdefined( var_1[var_5] ) )
            var_1[var_5] = [];

        var_1[var_5][var_1[var_5].size] = var_4;
    }

    level._id_CD72 = var_1;
}

_id_AA80()
{
    // level.price codescripts\character::setheadmodel( "head_hero_price_desert_beaten" );
}

_id_C454()
{
    // level._id_B416 codescripts\character::setheadmodel( "head_vil_shepherd_damaged" );
}

_id_B6A6()
{
    var_0 = "afchase_littlebird_fly";
    var_1 = "afchase_littlebird_idle";
    var_2 = "afchase_littlebird_landed";
    var_3 = spawn( "sound_blend", ( 0.0, 0.0, 0.0 ) );
    var_3 thread maps\_utility::manual_linkto( self, ( 0.0, 0.0, 0.0 ) );
    var_4 = spawn( "sound_blend", ( 0.0, 0.0, 0.0 ) );
    var_4 thread maps\_utility::manual_linkto( self, ( 0.0, 0.0, 64.0 ) );
    var_3 thread maps\_utility::mix_up( var_0 );
    wait 4;
    var_3 thread maps\_utility::mix_down( var_0 );
    var_4 thread maps\_utility::mix_up( var_1 );
    wait 13.5;
    var_3 thread maps\_utility::mix_down( var_1 );
    var_4 thread maps\_utility::mix_up( var_2 );
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

_id_B61C()
{

}

_id_B4E8( var_0, var_1 )
{
    level._id_D3F6["bump"] = level._id_D3F6[var_0];
    level._id_D3F6["bump_big"] = level._id_D3F6[var_1];
}

_id_C00E()
{
    if ( !isalive( level._id_CA22 ) )
        return 1;

    if ( !_id_B7AB() )
        return 1;

    return common_scripts\utility::flag( "player_learned_melee" );
}

_id_B11A()
{
    notifyoncommand( "player_did_melee", "+melee" );

    for (;;)
    {
        level.player waittill( "player_did_melee" );
        common_scripts\utility::flag_set( "player_learned_melee" );
        break;
    }
}

_id_B7AB()
{
    if ( !isalive( level._id_CA22 ) )
        return 0;

    var_0 = distance( level._id_CA22.origin, level.player.origin );
    return var_0 < 100;
}

_id_BB02()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 0;
    thread _id_B11A();

    for (;;)
    {
        var_2 = _id_B7AB();

        if ( var_2 )
        {
            if ( !var_0 )
                var_1 = gettime();
        }
        else
            var_1 = 0;

        var_3 = var_1 && gettime() > var_1 + 2000;
        var_4 = level.player attackbuttonpressed();

        if ( var_3 || var_4 )
            maps\_utility::display_hint( "hint_melee" );

        var_0 = var_2;
        wait 0.05;
    }
}

ending_fade_out()
{
    level endon( "now_fade_in" );
    var_0 = get_black_overlay();
    var_1 = 7;
    wait(2 + var_1);
    var_2 = 8 - var_1;
    var_0 fadeovertime( var_2 );
    var_0.alpha = 1;
}

h2_price_hat_detach( var_0 )
{
    wait 0.1;
    level.fake_hat = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    // level.fake_hat setmodel( "h2_price_arctic_hat" );
    // var_1 = level.fake_hat gettagorigin( "j_hat" );
    // var_2 = level.price gettagorigin( "j_hat" );
    // var_3 = level.price gettagangles( "j_hat" );
    // level.fake_hat.origin = var_2;
    // level.fake_hat.angles = var_3 + ( 0.0, 270.0, 0.0 );
    level.price.oldheadmodel = level.price.headmodel;
    // level.price codescripts\character::setheadmodel( "head_hero_price_desert_beaten_no_hat" );
}

h2_price_hat_reattach( var_0 )
{
    level.fake_hat hide();
    // level.price codescripts\character::setheadmodel( level.price.oldheadmodel );
}
