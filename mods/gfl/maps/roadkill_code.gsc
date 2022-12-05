// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_C2FE()
{
    wait 0.2;
    var_0 = self.ridingvehicle;
    var_1 = var_0.angles;
    var_1 = ( 0, var_1[1], 0 );
    var_2 = anglestoforward( var_1 );
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3.origin = var_0.origin + var_2 * 250 + ( 0.0, 0.0, 120.0 );
    var_3 linkto( var_0 );
    self.ignoreall = 1;
    var_4 = self getturret();
    var_4 setmode( "manual" );
    var_4 settargetentity( var_3 );
}

_id_A84B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isalive( var_1 ) )
        return;

    if ( var_1 != level.player )
        return;

    var_7 = self.ridingvehicle;

    if ( isdefined( var_7 ) )
    {
        if ( var_7 maps\_utility::ent_flag( "can_shoot_the_baddies" ) )
            return;
    }

    wait 1;
    setdvar( "ui_deadquote", &"SCRIPT_MISSIONFAIL_KILLTEAM_AMERICAN" );
    maps\_utility::missionfailedwrapper();
}

_id_C0DE()
{
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self.ridingvehicle ) )
            break;

        wait 0.05;
    }

    var_0 = self.ridingvehicle;
    maps\_utility::add_damage_function( ::_id_A84B );

    if ( var_0.script_index == 0 )
        var_0._id_AC8F = "turret_aim_target_first";

    var_1 = var_0.angles;
    var_1 = ( 0, var_1[1], 0 );
    var_2 = anglestoforward( var_1 );
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3.origin = var_0.origin + var_2 * 250 + ( 0.0, 0.0, 120.0 );
    var_3 linkto( var_0 );
    var_4 = undefined;

    for (;;)
    {
        var_4 = self getturret();

        if ( isdefined( var_4 ) )
            break;

        if ( !isdefined( self.ridingvehicle ) )
            return;

        wait 0.05;
    }

    var_4 setmode( "manual" );
    var_4 settargetentity( var_3 );
    var_5 = self.maxsightdistsqrd;
    self.maxsightdistsqrd = 0;
    var_4.dontshoot = 1;
    var_4 thread _id_D2FC( var_3, self.ridingvehicle );
    common_scripts\utility::flag_wait( "latvees_spin_up" );
    self.maxsightdistsqrd = var_5;
    thread _id_B558( var_0, var_4 );
    wait(randomfloat( 1.5 ));
    var_4 maps\_utility::play_sound_on_entity( "minigun_gatling_spinup_npc" );
    var_4 startbarrelspin();
    var_4 startfiring();
    var_0 maps\_utility::ent_flag_wait( "start_aiming_at_badguys" );
    var_4 notify( "stop_aiming_at_targets" );
}

_id_B558( var_0, var_1 )
{
    var_1 setmode( "auto_ai" );
    var_1 cleartargetentity();
    var_0 maps\_utility::ent_flag_wait( "can_shoot_the_baddies" );
    var_1.dontshoot = undefined;
}

_id_D2FC( var_0, var_1 )
{
    self endon( "stop_aiming_at_targets" );
    self endon( "death" );
    var_2 = "turret_aim_target";

    if ( isdefined( var_1._id_AC8F ) )
        var_2 = var_1._id_AC8F;

    var_3 = getentarray( var_2, "targetname" );

    foreach ( var_5 in var_3 )
    {
        if ( !isdefined( var_5.script_noteworthy ) )
            var_5.script_noteworthy = "";
    }

    level._id_D57E++;

    for (;;)
    {
        var_7 = common_scripts\utility::get_array_of_closest( self.origin, var_3, undefined, 5, 2000, 500 );
        var_8 = var_0;
        var_9 = var_1.angles;
        var_10 = undefined;

        foreach ( var_12 in var_7 )
        {
            if ( var_12.script_noteworthy == "priority" )
            {
                var_13 = maps\_utility::get_dot( self.origin, var_9, var_12.origin );

                if ( var_13 > 0.7 )
                {
                    var_10 = var_12;
                    break;
                }
            }
        }

        if ( isdefined( var_10 ) )
            var_8 = var_10;
        else
        {
            for ( var_15 = 0; var_15 < var_7.size; var_15++ )
            {
                var_12 = var_7[var_15];
                var_13 = maps\_utility::get_dot( self.origin, var_9, var_12.origin );

                if ( var_13 > 0.8 )
                {
                    var_8 = var_12;
                    break;
                }
            }
        }

        if ( var_1 == level._id_CE62["detour"] )
        {
            if ( common_scripts\utility::flag( "shot_rings_out" ) )
                return;
        }

        self settargetentity( var_8 );

        if ( var_8 == var_0 )
        {
            wait 0.15;
            continue;
        }

        for (;;)
        {
            var_9 = var_1.angles;
            var_13 = maps\_utility::get_dot( self.origin, var_9, var_8.origin );

            if ( var_13 < 0 )
                break;

            wait 0.1;
        }
    }
}

_id_CDB8( var_0 )
{
    self notify( "stop" );
    self endon( "stop" );

    for (;;)
        wait 0.05;
}

_id_BD78()
{
    self.animname = "hargrove";
    maps\_utility::gun_remove();
}

_id_CBD0()
{
    var_0 = spawnstruct();
    var_1 = 10;

    if ( getdvarint( "newintro" ) )
        var_1 = 18;

    var_0 thread maps\_utility::notify_delay( "timeout", var_1 );
    var_0 endon( "timeout" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_hangs_with_commanders" );
        maps\_utility::set_player_attacker_accuracy( 0 );
        level.player.ignorerandombulletdamage = 1;
        common_scripts\utility::flag_waitopen( "player_hangs_with_commanders" );
        maps\_gameskill::updatealldifficulty();
        level.player.ignorerandombulletdamage = 0;
    }
}

_id_D372()
{
    _id_CBD0();
    maps\_gameskill::updatealldifficulty();
    level.player.ignorerandombulletdamage = 0;
}

_id_C80F()
{
    common_scripts\utility::flag_wait( "h2_intro_done" );
    waittillframeend;
    level._id_B416 thread _id_B5F9( "shepherd_path" );
    thread _id_D372();
    var_0 = common_scripts\utility::getstruct( "roadkill_shepherd_scene", "targetname" );
    var_1 = [];
    var_1["foley"] = level.foley;

    if ( !getdvarint( "use_old_foley_intro" ) )
    {
        var_2 = getnode( "foley_walk_node", "targetname" );
        level.foley.a.movement = "run";
        level.foley setgoalnode( var_2 );
        level.foley.goalradius = 16;
        level.foley _id_D11F();
        var_0 maps\_anim::anim_single_solo_run( level.foley, "roadkill_riverbank_intro" );
        level.foley maps\_utility::anim_stopanimscripted();
        return;
    }

    var_0 thread maps\_anim::anim_first_frame_solo( level.foley, "roadkill_riverbank_intro" );
    wait 1.5;
    var_0 thread maps\_anim::anim_single_solo_run( level.foley, "roadkill_riverbank_intro" );
    wait 0.05;
    var_3 = 2;
    var_4 = level.foley maps\_utility::getanim( "roadkill_riverbank_intro" );
    var_5 = getanimlength( var_4 );
    var_6 = var_3 / var_5;
    level.foley setanimtime( var_4, var_6 );
    var_2 = getnode( "foley_walk_node", "targetname" );
    level.foley.a.movement = "run";
    level.foley setgoalnode( var_2 );
    level.foley.goalradius = 16;
    level.foley _id_D11F();

    for (;;)
    {
        var_7 = level.foley getanimtime( var_4 );

        if ( var_7 >= 0.975 )
            break;

        wait 0.05;
    }

    level.foley maps\_utility::anim_stopanimscripted();
}

_id_B7CD()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !maps\_utility::first_touch( var_0 ) )
            continue;

        var_0 maps\_utility::ent_flag_set( self.script_flag );
    }
}

_id_B701()
{
    level.foley = self;
    self.animname = "foley";
    maps\_utility::make_hero();

    if ( !common_scripts\utility::flag( "player_rolls_into_town" ) )
    {
        common_scripts\utility::flag_wait( "player_rolls_into_town" );
        _id_CECF();
    }
}

_id_CECF()
{
    if ( !isalive( self ) )
        return;

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self delete();
}

_id_C349()
{
    level._id_ACC0 = self;
    self.animname = "dunn";
    maps\_utility::make_hero();
}

_id_C564()
{
    level._id_B416 = self;
    self.animname = "shepherd";
    maps\_utility::make_hero();
    thread precognitive_paranoia_watch_damage();
    thread precognitive_paranoia_watch_death();

    if ( !common_scripts\utility::flag( "player_rolls_into_town" ) )
    {
        common_scripts\utility::flag_wait( "player_rolls_into_town" );
        _id_CECF();
    }
}

precognitive_paranoia_watch_death()
{
    self waittill( "death", var_0 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
    {
        maps\_utility::giveachievement_wrapper( "PRECOGNITIVE_PARANOIA" );
        setdvar( "ui_deadquote", &"SCRIPT_MISSIONFAIL_KILLTEAM_AMERICAN" );
        maps\_utility::missionfailedwrapper();
    }
}

precognitive_paranoia_watch_damage()
{
    self endon( "death" );
    level.damagedonetoshepherd = 0;

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( isdefined( var_1 ) && isplayer( var_1 ) )
        {
            level.damagedonetoshepherd += var_0;

            if ( level.damagedonetoshepherd >= 100 )
            {
                if ( maps\_utility::is_hero() )
                    maps\_utility::unmake_hero();

                if ( isdefined( self.magic_bullet_shield ) && self.magic_bullet_shield == 1 )
                    maps\_utility::stop_magic_bullet_shield();

                if ( isai( self ) )
                {
                    self stopanimscripted();
                    self startragdoll();
                }
                else
                {
                    var_2 = level.scr_anim["shepherd"]["shepherd_drone_killed_by_player"];
                    self animscripted( "drone_anim", self.origin, self.angles, var_2, "deathplant" );
                }

                self kill( self.origin, level.player );
                break;
            }
        }
    }
}

_id_BA6B()
{
    self.dontdisconnectpaths = 1;
    level._id_BA6B = self;
    level._id_BA6B.animname = "player_latvee";

    if ( level.start_point == "intro" || level.start_point == "getout" )
    {
        var_0 = maps\_utility::player_rides_shotgun_in_humvee( 170, 170, 45, 15 );
        common_scripts\utility::flag_wait( "slam_hood" );
        wait 1.5;
        var_0 maps\_utility::player_leaves_humvee();
        level.player allowcrouch( 1 );
        level.player allowprone( 1 );
    }
}

_id_BD4A()
{
    self.dontdisconnectpaths = 1;
    level._id_BA6B = self;
    level._id_BA6B.animname = "player_latvee";
    _id_AA05();
}

_id_AA05()
{
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ui_ignoreTurretCompassHide", 1 );
    thread _id_C821();
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player playerlinktodelta( self, "tag_player", 0.35, 360, 360, 45, 30, 1 );
    var_0 = self.mgturret[0];
    var_0 makeusable();
    var_0 setmode( "manual" );
    var_0 useby( level.player );
    var_0 makeunusable();
    level._id_AD0D = var_0;
    level.player disableturretdismount();
    thread _id_CB27::_id_B19D( var_0 );
    var_0 _meth_841A( 1 );
}

_id_C820()
{
    self.dontdisconnectpaths = 1;

    if ( maps\_utility::is_first_start() )
    {
        common_scripts\utility::flag_wait( "player_latvee_stops_for_officers" );
        wait 3;
        self vehicle_setspeed( 0, 10, 10 );
    }

    common_scripts\utility::flag_wait( "slam_hood" );
    wait 1.5;
    maps\_vehicle::vehicle_unload( "passengers" );
}

_id_BCF7()
{
    self.dontunloadonend = 1;
    self.dontdisconnectpaths = 1;
    self waittill( "reached_end_node" );
    level._id_D0BE[level._id_D0BE.size] = self;
}

_id_B218()
{
    self.dontunloadonend = 1;
    self.dontdisconnectpaths = 1;
    self waittill( "reached_end_node" );
    maps\_vehicle::vehicle_unload( "rear_driver_side" );
}

_id_A9C2()
{
    level._id_A9C2 = self;
    self.dontunloadonend = 1;
    self.dontdisconnectpaths = 1;

    if ( maps\_utility::is_first_start() )
    {
        common_scripts\utility::flag_wait( "player_latvee_stops_for_officers" );
        wait 3;
    }

    common_scripts\utility::flag_wait( "slam_hood" );
    wait 1.5;
    maps\_vehicle::vehicle_unload( "passengers" );
}

_id_D298()
{
    self.dontdisconnectpaths = 1;

    if ( maps\_utility::is_first_start() )
    {
        common_scripts\utility::flag_wait( "player_latvee_stops_for_officers" );

        for (;;)
        {
            var_0 = level._id_BA6B.veh_speed;
            var_1 = var_0;

            if ( var_1 <= 5 )
                var_1 = 5;

            self vehicle_setspeed( var_0, var_1, var_1 );

            if ( common_scripts\utility::flag( "slam_hood" ) )
                break;

            wait 0.05;
        }
    }

    wait 1.5;
    maps\_vehicle::vehicle_unload( "passengers" );
}

_id_B49A()
{
    maps\_utility::ent_flag_init( "convoy_stops_for_bridge" );
}

_id_C6E5( var_0 )
{
    common_scripts\utility::flag_wait( "h2_intro_done" );
    maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "ride_vehicle_starts_spawned" );
    var_1 = getent( "bridge_layer_spawner", "targetname" );
    var_1.animname = "bridge_layer";

    if ( _id_B406() )
    {
        var_2 = common_scripts\utility::getstruct( "bridge_layer_org", "targetname" );
        var_2 maps\_anim::anim_teleport_solo( var_1, "bridge_driveup" );
    }
    else
    {
        var_2 = common_scripts\utility::getstruct( "bridge_layer_org", "targetname" );
        var_2 maps\_anim::anim_teleport_solo( var_1, "bridge_cross" );
        var_3 = getvehiclenode( "bridge_layer_path_1", "targetname" );
        var_1.origin = var_3.origin;
    }

    var_1 maps\_utility::add_spawn_function( ::_id_B28F );
    var_1 maps\_utility::spawn_vehicle();
}

_id_AEFC()
{
    self.pathrandompercent = 200;
}

_id_B406()
{
    if ( level.start_point == "intro" )
        return 1;

    return level.start_point == "riverbank";
}

_id_B28F()
{
    self.dontdisconnectpaths = 1;
    level._id_ADA7 = self;
    self.animname = "bridge_layer";
    level._id_AF2D = gettime();
    var_0 = common_scripts\utility::getstruct( "bridge_layer_org", "targetname" );
    maps\_utility::assign_animtree();
    var_1 = self._id_BC77;
    var_1.animname = "bridge_layer_bridge";
    var_1 maps\_utility::assign_animtree();
    var_2 = getent( "bridge_clip", "targetname" );
    var_2 maps\_utility::add_target_pivot();
    var_2.pivot linkto( var_1, "origin_animate_jnt", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 180.0 ) );
    var_2 hide();
    thread maps\roadkill_aud::bridge_layer_impact_snd();
    thread _id_BC47( var_1 );
    var_3 = [];
    var_3["vehicle"] = self;
    var_3["bridge"] = var_1;

    if ( _id_B406() )
    {
        var_1 unlink();
        var_0 thread maps\_anim::anim_single( var_3, "bridge_up" );
        var_4 = getanimlength( var_3["vehicle"] maps\_utility::getanim( "bridge_up" ) );
        wait 0.05;
        wait(var_4);
        wait 17.5;
        wait 25;
        common_scripts\utility::flag_set( "bridge_layer_attacked_by_bridge_baddies" );
        var_5 = gettime();
        common_scripts\utility::flag_wait( "bridge_baddies_retreat" );
        wait 1;
        var_0 thread maps\_anim::anim_single( var_3, "bridge_lower" );
        var_4 = getanimlength( var_3["vehicle"] maps\_utility::getanim( "bridge_lower" ) );
        var_1 thread maps\roadkill_aud::bridge_lower_end();
        wait(var_4);
        common_scripts\utility::flag_set( "riverbank_baddies_retreat" );
        common_scripts\utility::flag_set( "leaving_riverbank" );
        setsaveddvar( "compass", 1 );
        level notify( "tanks_stop_firing" );
    }
    else
    {
        var_0 thread maps\_anim::anim_single( var_3, "bridge_lower" );
        var_1 unlink();
        wait 0.05;
        var_6 = var_1 maps\_utility::getanim( "bridge_lower" );
        var_1 setanimtime( var_6, 0.99 );
        wait 1;
    }

    var_7 = getent( "player_bridge_clip", "targetname" );
    var_7 delete();
    common_scripts\utility::flag_set( "bridgelayer_complete" );
    level._id_C538 = gettime() - level._id_AF2D;
    maps\_utility::delaythread( 4, common_scripts\utility::flag_set, "bridgelayer_crosses" );
    var_0 thread maps\_anim::anim_single_solo( self, "bridge_cross" );
    var_4 = getanimlength( maps\_utility::getanim( "bridge_cross" ) );
    thread maps\roadkill_aud::_id_D102();
    wait(var_4);
    common_scripts\utility::flag_wait( "player_gets_in" );
    maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "lead_vehicle_spawner" );
}

_id_B170()
{
    wait 0.05;
    var_0 = maps\_utility::getanim( "bridge_lower" );
}

_id_A9B0( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isalive( var_1 ) )
        return;

    if ( var_1 != level.player )
        return;

    common_scripts\utility::flag_set( "player_attacked_bridge_enemy" );
}

_id_BA9B()
{
    var_0 = self.origin;
    self endon( "death" );
    self setthreatbiasgroup( "bridge_attackers" );
    maps\_utility::add_damage_function( ::_id_A9B0 );
    self.attackeraccuracy = 0.05;
    self.ignorerandombulletdamage = 1;
    common_scripts\utility::flag_wait( "bridge_baddies_retreat" );
    wait(randomfloat( 1.5 ));
    var_1 = getnode( self.target, "targetname" );
    self setgoalnode( var_1 );
    self.goalradius = var_1.radius;
    self waittill( "goal" );
    self setgoalpos( var_0 );
    self.goalradius = 16;
    self waittill( "goal" );
    self delete();
}

_id_A83F()
{
    common_scripts\utility::flag_wait( "bridge_truck_waits" );
    _id_ACA1();
    common_scripts\utility::flag_set( "bridge_truck_leaves" );
}

_id_ACA1()
{
    level endon( "bridge_baddies_retreat" );

    for (;;)
    {
        var_0 = maps\_utility::get_dot( level.player geteye(), level.player getplayerangles(), self.origin );

        if ( var_0 > 0.998 && level.player playerads() >= 1.0 )
            break;

        wait 0.05;
    }

    wait 2.5;
}

_id_BC47( var_0 )
{
    if ( !maps\_utility::is_default_start() )
        return;

    common_scripts\utility::flag_wait( "bridge_layer_attacked_by_bridge_baddies" );
    maps\_utility::array_spawn_function_targetname( "enemy_bridge_vehicle_spawner", ::_id_A83F );
    maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "enemy_bridge_vehicle_spawner" );
    thread maps\roadkill_aud::_id_B4F1();
    wait 1;
    maps\_utility::array_spawn_function_targetname( "bridge_defender_spawner", ::_id_B604 );
    maps\_utility::delaythread( 2, maps\_utility::array_spawn_targetname, "bridge_defender_spawner" );
    maps\_utility::array_spawn_targetname( "enemy_bridge_spawner" );
    wait 2;
    thread _id_C2A6();
    thread _id_AA8E();

    if ( level.gameskill >= 2 )
        setthreatbias( "just_player", "bridge_attackers", 3000 );

    common_scripts\utility::flag_wait( "player_attacked_bridge_enemy" );
    setthreatbias( "just_player", "bridge_attackers", 0 );
    wait 7;
    common_scripts\utility::flag_set( "bridge_baddies_retreat" );
    wait 2.5;
    level.foley thread maps\_utility::play_sound_on_entity( "roadkill_fly_keephitting" );
}

_id_C2A6()
{
    soundscripts\_audio_mix_manager::mm_clear_submix( "intro_fight_part_a_mix" );
    soundscripts\_audio_mix_manager::mm_add_submix( "intro_fight_part_b_mix" );
    wait 3;
    thread _id_B2D4( "roadkill_fly_10oclockhigh" );
    wait 3.2;
    _id_C24A( "roadkill_cpd_farside" );

    if ( common_scripts\utility::flag( "player_attacked_bridge_enemy" ) )
        return;

    level endon( "player_attacked_bridge_enemy" );
    wait 2.2;
    thread _id_B2D4( "roadkill_fly_makingapush" );
    wait 2.8;
    _id_C24A( "roadkill_cpd_bridgelayer" );
    wait 1.8;
    _id_B2D4( "roadkill_fly_onthebridge" );
}

_id_AA8E()
{
    level endon( "player_attacked_bridge_enemy" );

    if ( common_scripts\utility::flag( "player_attacked_bridge_enemy" ) )
        return;

    wait 20;
    thread _id_CB05();
}

_id_CB05()
{
    setdvar( "ui_deadquote", &"ROADKILL_BRIDGELAYER_DESTROYED" );
    maps\_utility::delaythread( 3, maps\_utility::missionfailedwrapper );
    level._id_ADA7 playsound( "scn_roadkill_bridge_tank_explode" );
    var_0 = common_scripts\utility::getfx( "bmp_explosion" );

    for (;;)
    {
        var_1 = common_scripts\utility::randomvector( 200 );
        var_2 = var_1[2];
        var_2 *= 0.5;
        var_2 = abs( var_2 );
        var_1 = maps\_utility::set_z( var_1, var_2 );
        playfx( var_0, level._id_ADA7.origin + var_1 );
        var_3 = randomfloatrange( 0.4, 0.8 );
        wait(var_3);
    }
}

_id_B604()
{
    self endon( "death" );
    self.attackeraccuracy = 0;
    self.ignorerandombulletdamage = 1;
    common_scripts\utility::flag_wait( "player_climbs_stairs" );
    self delete();
}

_id_CC6C( var_0 )
{
    var_1 = var_0 maps\_utility::getanim( "bridge_lower" );

    for (;;)
    {
        var_2 = var_0 getanimtime( var_1 );

        if ( var_2 > 0.75 )
            break;

        wait 0.05;
    }
}

_id_AC2E( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        var_5 = spawnstruct();
        var_5.origin = var_4.origin;
        var_5.radius = var_4.radius;
        var_2[var_2.size] = var_5;

        if ( !isdefined( var_1 ) )
            var_4 delete();
    }

    return var_2;
}

_id_BEF6()
{
    self endon( "death" );
    level endon( "tanks_stop_firing" );

    if ( !maps\_utility::is_default_start() )
        return;

    var_0 = common_scripts\utility::get_linked_ents();
    var_1 = _id_AC2E( var_0 );
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_2.origin = var_1[0].origin;
    self setturrettargetent( var_2 );
    self.target_ent = var_2;
    intro_hide_entity();

    if ( !isdefined( self.is_moving_tank ) )
        wait(randomfloat( 4 ));

    var_3 = self.script_firelink;
    var_4 = [];
    var_4["fire_often"] = ::_id_D4AD;
    var_4["fire_rarely"] = ::_id_A80F;
    var_4["fire_never"] = ::_id_C283;
    var_4["stryker_fire"] = ::_id_AC6C;
    var_4["bmp_fire"] = ::tank_bmp_fire;
    var_5 = var_4[var_3];
    [[ var_5 ]]( var_1 );
}

_id_C283( var_0 )
{
    var_1 = self.target_ent;

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_3 in var_0 )
        {
            var_1.origin = var_3.origin;

            if ( isdefined( var_3.radius ) )
                var_1.origin += common_scripts\utility::randomvector( var_3.radius );

            if ( self vehicle_canturrettargetpoint( var_1.origin ) )
            {
                self waittill( "turret_on_target" );
                wait(randomfloatrange( 2, 3 ));
                continue;
            }

            wait(randomfloatrange( 3, 5 ));
        }
    }
}

_id_C72D( var_0 )
{
    var_1 = self.origin + ( 0.0, 0.0, 60.0 );
    var_2 = vectortoangles( var_0.origin - var_1 );
    var_3 = anglestoforward( var_2 );
    var_0.origin = var_1 + var_3 * 400;
}

_id_A80F( var_0 )
{
    var_1 = self.target_ent;
    wait(randomfloat( 10 ));

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_3 in var_0 )
        {
            var_1.origin = var_3.origin;

            if ( isdefined( var_3.radius ) )
                var_1.origin += common_scripts\utility::randomvector( var_3.radius );

            _id_C72D( var_1 );

            if ( self vehicle_canturrettargetpoint( var_1.origin ) )
            {
                self waittill( "turret_on_target" );
                wait(randomfloatrange( 0.5, 2 ));
                var_4 = randomint( 4 ) - 1;

                for ( var_5 = 0; var_5 < var_4; var_5++ )
                {
                    self fireweapon();
                    wait(randomfloatrange( 5, 8 ));
                }

                wait 15;
                continue;
            }

            wait(randomfloatrange( 3, 5 ));
        }
    }
}

_id_AC6C( var_0 )
{
    if ( !maps\_utility::is_default_start() )
    {
        radiusdamage( level._id_B079.origin, 128, 5000, 5000 );
        return;
    }

    thread _id_D4AD( var_0 );
    common_scripts\utility::flag_wait( "h2_intro_done" );
    wait 20;
    level._id_B079 maps\_utility::waittill_player_lookat( 0.98, 0.1, 1, 20 );
    self notify( "stop_tank_fire" );
    _id_D0FF();
    _id_D4AD( var_0 );
}

_id_D0FF()
{
    self.target_ent.origin = level._id_B079.origin + ( 0.0, 0.0, 32.0 );
    self waittill( "turret_on_target" );
    wait 0.25;
    var_0 = randomint( 4 ) - 1;

    for (;;)
    {
        if ( !isalive( level._id_B079 ) )
            break;

        self fireweapon();
        wait(randomfloatrange( 1, 1.5 ));
    }
}

_id_D4AD( var_0 )
{
    self endon( "stop_tank_fire" );
    var_1 = self.target_ent;

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_3 in var_0 )
        {
            var_1.origin = var_3.origin;

            if ( isdefined( var_3.radius ) )
                var_1.origin += common_scripts\utility::randomvector( var_3.radius );

            _id_C72D( var_1 );

            if ( self vehicle_canturrettargetpoint( var_1.origin ) )
            {
                self waittill( "turret_on_target" );
                wait(randomfloatrange( 0.5, 2 ));
                var_4 = randomint( 4 ) - 1;

                for ( var_5 = 0; var_5 < var_4; var_5++ )
                {
                    self fireweapon();
                    wait(randomfloatrange( 1, 3 ));
                }

                wait 3;
                continue;
            }

            wait 0.5;
        }
    }
}

tank_bmp_fire( var_0 )
{
    self endon( "stop_tank_fire" );
    var_1 = self.target_ent;

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_3 in var_0 )
        {
            var_1.origin = var_3.origin;

            if ( isdefined( var_3.radius ) )
                var_1.origin += common_scripts\utility::randomvector( var_3.radius );

            _id_C72D( var_1 );

            if ( self vehicle_canturrettargetpoint( var_1.origin ) )
            {
                self waittill( "turret_on_target" );
                wait(randomfloatrange( 0.5, 1 ));
                var_4 = 3;

                for ( var_5 = 0; var_5 < var_4; var_5++ )
                {
                    self fireweapon();
                    wait 0.4;
                }

                wait(randomfloatrange( 0.5, 1 ));
                continue;
            }

            wait 0.5;
        }
    }
}

_id_A8CD()
{
    var_0 = common_scripts\utility::getstruct( "intro_orders", "targetname" );
    var_1 = maps\_utility::_id_CA38( "intro_friendly_spawner" );
    level._id_B726 = var_1;

    foreach ( var_3 in var_1 )
    {
        var_3 maps\_utility::set_run_anim( "walk" );
        var_3.pathrandompercent = 0;
        var_3.moveplaybackrate = 1;
        var_3.goalradius = 8;
        var_3.walkdist = 0;
        var_3.disablearrivals = 1;
    }

    if ( maps\_utility::is_first_start() )
    {
        wait 8;

        foreach ( var_3 in var_1 )
        {
            var_6 = common_scripts\utility::getstruct( var_3.target, "targetname" );
            var_3 thread maps\_spawner::go_to_node( var_6, "struct" );
        }

        wait 5;
        var_0 maps\_anim::anim_reach_together( var_1, "roadkill_intro_orders" );
        maps\_utility::delaythread( 2.95, common_scripts\_exploder::exploder, "intro_boom" );
        maps\_utility::delaythread( 0.5, maps\_vehicle::spawn_vehicle_from_targetname_and_drive, "early_f15_flyby" );
    }

    var_0 maps\_anim::anim_single( var_1, "roadkill_intro_orders" );
}

_id_C22F()
{
    if ( isdefined( self._id_D0CB ) )
        self detach( "weapon_binocular", "tag_inhand" );

    self._id_D0CB = undefined;
}

_id_C46C()
{
    common_scripts\utility::flag_wait( "h2_intro_done" );
    var_0 = common_scripts\utility::getstruct( "binoc_scene", "targetname" );
    var_0 thread _id_B320();
    var_0 = common_scripts\utility::getstruct( "binoc_scene_spotter", "targetname" );
    var_0 thread _id_B320();
}

_id_B320()
{
    var_0 = getentarray( self.target, "targetname" );
    var_1 = maps\_utility::array_spawn( var_0, 1 );
    var_2 = var_1[0];
    var_2.animname = var_2.script_noteworthy;
    var_2.animnode = self;
    var_2._id_AAE2 = 1;
    var_2 _id_D11F();
    thread _id_A8EB( var_2 );
    var_2 maps\_utility::forceuseweapon( "m4_grunt", "primary" );
}

_id_A8EB( var_0 )
{
    self.origin = ( -2155.06, -4010.0, -71.0 );
    self.angles = ( 0.0, 0.0, 0.0 );
    maps\_anim::anim_first_frame_solo( var_0, "binoc_scene" );
    common_scripts\utility::flag_wait( "player_enters_riverbank" );
    wait 0.75;
    maps\_anim::anim_single_solo( var_0, "binoc_scene" );

    if ( !common_scripts\utility::flag( "player_gets_in" ) )
        thread maps\_anim::anim_loop_solo( var_0, "idle" );

    common_scripts\utility::flag_wait( "player_gets_in" );
    self notify( "stop_loop" );
}

_id_C0AA()
{
    common_scripts\utility::flag_wait( "time_to_go" );
    var_0 = getentarray( self.target, "targetname" );
    var_1 = maps\_utility::array_spawn( var_0 );
    var_1[0].animname = "candy_bar";
    var_2 = var_1[0];
    var_3 = "mil_mre_chocolate01";
    var_2 attach( var_3, "tag_inhand" );
    var_2 maps\_utility::gun_remove();
    var_2.weapon = "m16_basic";
    var_2 maps\_utility::gun_recall();

    foreach ( var_5 in var_1 )
        var_5.allowdeath = 1;

    thread maps\_anim::anim_loop( var_1, "idle" );
    common_scripts\utility::flag_wait( "player_gets_in" );

    if ( isalive( var_2 ) )
        var_2 delete();
}

_id_CC5D()
{
    var_0 = getentarray( self.target, "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::new_cover_guys, self );
    common_scripts\utility::flag_wait( "get_on_the_line" );
    var_1 = maps\_utility::array_spawn( var_0 );
    waittillframeend;
}

new_cover_guys( var_0 )
{
    maps\_utility::forceuseweapon( "m4_grunt", "primary" );
    self.goalradius = 16;
    self.animname = self.animation;
    var_0 thread maps\_anim::anim_loop_solo( self, "idle" );
    common_scripts\utility::flag_wait( "time_to_go" );
    self waittillmatch( "looping anim", "end" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::anim_single_solo( self, "out" );
    wait 10;
    _id_CECF();
}

_id_B4C9()
{
    self endon( "death" );
    self.weaponsound = "h2_wpn_m4a1_npc_close";

    for (;;)
    {
        self waittill( "fire" );
        thread maps\_drone::drone_shoot_fx();
    }
}

_id_C0A3()
{
    for (;;)
        wait 0.05;
}

_id_BA6D()
{
    var_0 = common_scripts\utility::getstruct( "radio_scene", "targetname" );
    var_1 = getentarray( var_0.target, "targetname" );
    var_2 = [];

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = var_4 maps\_utility::spawn_ai( 1 );

    var_2[0].animname = "cover_radio2";
    var_2[1].animname = "cover_radio1";
    var_2[2].animname = "cover_radio3";
    var_6 = var_2[2];
    var_6 _id_D11F();
    var_7 = [];
    var_7["1"] = var_2[1];
    var_7["2"] = var_2[2];
    var_0 thread maps\_anim::anim_loop( var_2, "idle" );

    foreach ( var_9 in var_2 )
        var_9 maps\_utility::forceuseweapon( "m4_grunt", "primary" );

    common_scripts\utility::flag_wait( "time_to_go" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::anim_single( var_2, "out" );
    common_scripts\utility::flag_wait( "player_gets_in" );
    var_0 notify( "stop_loop" );

    foreach ( var_9 in var_7 )
    {
        if ( isdefined( var_9.magic_bullet_shield ) )
            var_9 maps\_utility::stop_magic_bullet_shield();

        var_9 delete();
    }
}

_id_B321()
{
    common_scripts\utility::flag_wait( "h2_intro_done" );

    if ( !getdvarint( "use_old_radio_scene" ) )
    {
        thread _id_BA6D();
        return;
    }

    var_0 = [];
    var_0["1"] = common_scripts\utility::getstruct( "radio_scene1", "targetname" );
    var_0["2"] = common_scripts\utility::getstruct( "radio_scene2", "targetname" );
    var_0["3"] = common_scripts\utility::getstruct( "radio_scene3", "targetname" );
    var_1 = [];

    foreach ( var_5, var_3 in var_0 )
    {
        var_4 = getent( var_3.target, "targetname" );
        var_1[var_5] = var_4 maps\_utility::spawn_ai();
    }

    var_1["1"].animname = "cover_radio1";
    var_1["2"].animname = "cover_radio2";
    var_1["3"].animname = "cover_radio3";
    var_6 = var_1["3"];
    var_7 = "mil_mre_chocolate01";
    var_6 attach( var_7, "tag_inhand" );
    var_6._id_BD68 = ::_id_AFFB;
    var_6._id_B71C = var_7;
    var_6._id_AAE2 = 1;
    var_6 _id_D11F();
    var_8 = [];
    var_8["1"] = var_1["1"];
    var_8["2"] = var_1["2"];
    var_1["2"] maps\_utility::gun_remove();

    foreach ( var_5, var_3 in var_0 )
        var_3 thread maps\_anim::anim_loop_solo( var_1[var_5], "idle" );

    common_scripts\utility::flag_wait( "leaving_riverbank" );
    level.scr_anim["cover_radio1"]["idle"][0] = level.scr_anim["cover_radio1"]["idle_noshoot"][0];
    common_scripts\utility::flag_wait( "player_gets_in" );

    foreach ( var_5, var_3 in var_0 )
        var_3 notify( "stop_loop" );

    foreach ( var_12 in var_8 )
    {
        if ( isdefined( var_12.magic_bullet_shield ) )
            var_12 maps\_utility::stop_magic_bullet_shield();

        var_12 delete();
    }
}

_id_AFFB()
{
    self detach( self._id_B71C, "tag_inhand" );
}

_id_CEF2( var_0 )
{
    self.dontshootwhilemoving = var_0;
}

_id_CDFD()
{
    var_0 = getent( self.target, "targetname" );
    var_1 = var_0 maps\_utility::spawn_ai();
    var_1 endon( "death" );
    var_2 = spawn( "script_origin", ( -2498.91, -3490.86, 175.0 ) );
    var_2.angles = ( 0.0, 158.145, 0.0 );
    var_1.animname = self.script_noteworthy;
    var_2 maps\_anim::anim_first_frame_solo( var_1, "video_film_complete" );
    level waittill( "continue_film_explosion_h2" );

    if ( isdefined( var_1.script_delay ) )
        var_1 maps\_utility::script_delay();

    var_2 maps\_anim::anim_single_solo( var_1, "video_film_complete" );

    if ( isdefined( var_1.magic_bullet_shield ) )
        var_1 maps\_utility::stop_magic_bullet_shield();

    var_1.fixednode = 0;
    var_3 = getnode( "bridge_delete_node", "targetname" );
    var_1.goalradius = 8;

    if ( isdefined( var_1.target ) )
    {
        var_1 setgoalnode( getnode( var_1.target, "targetname" ) );
        wait 20;
    }

    var_1 setgoalnode( var_3 );
    var_1 waittill( "goal" );
    var_1 delete();
    var_2 delete();
}

_id_C8C4()
{
    if ( !getdvarint( "use_old_videotaping_anims" ) )
    {
        thread _id_CDFD();
        return;
    }

    if ( self.script_noteworthy == "film5" )
        return;

    var_0 = getent( self.target, "targetname" );
    var_1 = var_0 maps\_utility::spawn_ai();
    var_1 endon( "death" );
    var_1.animname = self.script_noteworthy;
    var_2 = level.scr_model[var_1.animname];
    var_1 attach( var_2, "tag_inhand" );

    if ( isdefined( var_1.script_delay ) )
    {
        maps\_anim::anim_first_frame_solo( var_1, "video_film_start" );
        var_1 maps\_utility::script_delay();
    }

    maps\_anim::anim_single_solo( var_1, "video_film_start" );
    thread maps\_anim::anim_loop_solo( var_1, "video_film_idle" );
    common_scripts\utility::flag_wait( "video_tapers_react" );
    self notify( "stop_loop" );
    var_3 = gettime();
    var_4 = 6.4;

    if ( var_1.animname == "film4" )
        var_4 = 8.5;

    if ( var_1.animname == "film3" )
        var_4 = 6.2;

    if ( var_1.animname == "film2" )
        var_4 = 6.9;

    if ( var_1.animname == "film1" )
        var_4 = 6.4;

    var_1.noteleport = 1;
    var_1 maps\_utility::disable_pain();
    var_1.anim_blend_time_override = 0.5;

    if ( var_1 maps\_utility::hasanim( "video_film_end" ) )
    {
        thread maps\_anim::anim_custom_animmode_solo( var_1, "gravity", "video_film_react" );
        wait 4;
        var_1.anim_blend_time_override = 1;
        var_1 thread maps\_anim::anim_custom_animmode_solo( var_1, "gravity", "video_film_end" );
    }
    else
        thread maps\_anim::anim_custom_animmode_solo( var_1, "gravity", "video_film_react" );

    maps\_utility::wait_for_buffer_time_to_pass( var_3, var_4 );
    var_1 stopanimscripted();
    var_1 notify( "killanimscript" );

    if ( isdefined( var_1.magic_bullet_shield ) )
        var_1 maps\_utility::stop_magic_bullet_shield();

    var_1.fixednode = 0;
    var_5 = getnode( "bridge_delete_node", "targetname" );
    var_1 setgoalnode( var_5 );
    var_1.goalradius = 8;
    var_1 waittill( "goal" );
    var_1 delete();
}

_id_B341()
{
    self endon( "death" );
    var_0 = getentarray( "bridge_target", "targetname" );

    for (;;)
    {
        var_1 = common_scripts\utility::random( var_0 );
        var_1.health = 1;
        self setentitytarget( var_1 );
        var_2 = randomfloatrange( 1, 3 );
        wait(var_2);
    }
}

_id_D2DB()
{
    self endon( "death" );

    for (;;)
        wait 0.05;
}

_id_AFC3( var_0 )
{
    if ( common_scripts\utility::flag( "riverbank_baddies_retreat" ) )
        return;

    level endon( "riverbank_baddies_retreat" );

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_2 in var_0 )
        {
            for (;;)
            {
                var_3 = getaiarray( "axis" );

                if ( var_3.size < 6 )
                {
                    var_2.count = 1;
                    var_2 maps\_utility::spawn_ai();
                    wait 2;
                    break;
                }

                wait 2;
            }
        }
    }
}

_id_BD1C( var_0 )
{
    if ( common_scripts\utility::flag( "riverbank_baddies_retreat" ) )
        return;

    level endon( "riverbank_baddies_retreat" );

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_2 in var_0 )
        {
            for (;;)
            {
                var_3 = getaiarray();

                if ( var_3.size < 31 )
                {
                    var_2.count = 1;
                    var_2 maps\_utility::spawn_ai();
                    wait 1;
                    break;
                }

                wait 1;
            }
        }
    }
}

_id_C8AE( var_0, var_1 )
{
    if ( common_scripts\utility::flag( "riverbank_baddies_retreat" ) )
        return;

    level endon( "riverbank_baddies_retreat" );
    self endon( "death" );
    wait(randomfloat( 1 ));

    for (;;)
    {
        self.count = 1;
        var_2 = maps\_utility::spawn_ai();

        if ( !isalive( var_2 ) )
        {
            wait 1;
            continue;
        }

        var_2 waittill( "death" );
        var_3 = randomfloatrange( var_0, var_1 );
        wait(var_3);
    }
}

_id_D161()
{
    common_scripts\utility::hide_notsolid();
}

_id_B111()
{
    common_scripts\utility::show_solid();
}

_id_AE14()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "riverbank_baddies_retreat" );
    var_0 = randomfloat( 3 );
    wait(var_0);
    _id_B190::_id_D55F( self );
    self kill();
}

_id_ABF7()
{
    self endon( "death" );
    self.startpos = self.origin;
    common_scripts\utility::flag_wait( "riverbank_baddies_retreat" );
    var_0 = randomfloat( 6 );
    wait(var_0);
    self setgoalpos( self.startpos );
    self.goalradius = 8;
    self waittill( "goal" );
    self delete();
}

_id_CA41()
{
    var_0 = getentarray( "script_vehicle", "code_classname" );

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( var_2.classname, "technical" ) )
            continue;

        var_2 maps\_vehicle::mgoff();
    }
}

_id_AA85()
{
    if ( !isdefined( self.magic_bullet_shield ) )
        thread maps\_utility::magic_bullet_shield();

    _id_B3AB::_id_BEBA( "head", level.player, 300, 45, 45, 30, 45, 0, 0, 10, 0 );

    if ( !getdvarint( "use_old_getinlaatpv_anims" ) )
    {
        var_0 = spawn( "script_origin", ( -2528.93, -3742.23, 212.02 ) );
        var_0.angles = ( 0.0, 74.4716, 0.0 );
        var_0 thread maps\_anim::anim_loop_solo( self, "waiting_to_getin", "stop_waiting_to_getin" );
    }

    common_scripts\utility::flag_wait( "convoy_moment" );
    wait 3.9;

    if ( getdvarint( "use_old_getinlaatpv_anims" ) )
    {
        var_1 = ( -2474.0, -3765.0, 178.0 );
        self setgoalpos( var_1 );
        self.goalradius = 8;
        self waittill( "goal" );
    }
    else
    {
        wait 1.75;
        self notify( "stop_waiting_to_getin" );
    }

    _id_B3AB::_id_B0AC();
    thread maps\_utility::guy_runtovehicle_load( self, level._id_BA6B );

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    wait 0.4;
}

_id_C6E8()
{
    self.qsetgoalpos = 0;
    level._id_BD77 maps\_anim::anim_single_solo( self, "getin", "tag_origin", undefined, self.script_noteworthy );
    self linkto( level._id_BD77, "tag_origin" );
    level._id_BD77 maps\_anim::anim_single_solo( self, "wait4demo", "tag_origin", undefined, self.script_noteworthy );
    level._id_BD77 thread maps\_anim::anim_loop_solo( self, "idle", "stop", "tag_origin", self.script_noteworthy );
}

_id_C967()
{
    var_0 = getent( "latvee_rider_spawner", "script_noteworthy" );
    var_0 waittill( "drone_spawned", var_1 );
    var_0 delete();
    var_1 thread _id_C618();
}

_id_C618()
{
    self endon( "death" );
    maps\_utility::gun_remove();
    wait 0.05;
    self attach( "weapon_m16", "tag_weapon_chest" );
    self.ridingvehicle maps\_anim::anim_generic_first_frame( self, "help_player_getin", "tag_guy0" );
    common_scripts\utility::flag_wait( "convoy_moment" );
    wait 1.3;
    self.ridingvehicle maps\_anim::anim_generic( self, "help_player_getin", "tag_guy0" );
    self notify( "animontagdone", "end" );
    common_scripts\utility::flag_wait( "player_gets_in" );

    if ( !getdvarint( "use_old_getinlaatpv_anims" ) )
    {
        foreach ( var_1 in self.ridingvehicle.riders )
            var_1 thread _id_B2DC();
    }

    level.backseat_face = self.headmodel;
    level.backseat_model = self _meth_83C5();
    wait 3;

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self delete();
}

_id_B2DC()
{
    self endon( "death" );
    var_0 = maps\_vehicle_aianim::anim_pos( self.ridingvehicle, self.vehicle_position );
    self.ridingvehicle maps\_anim::anim_generic_first_frame( self, var_0._id_B099, var_0.sittag );
    self.ridingvehicle maps\_anim::anim_generic( self, var_0._id_B099, var_0.sittag );
    self notify( "animontagdone", "end" );
}

_id_A9A3()
{
    level._id_BA6B = self;
    self.dontdisconnectpaths = 1;
    var_0 = "vehicle_laatpv_seat_rb_obj";
    self hidepart( "tag_seat_rb_hide" );
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level._id_D3D4 = var_1;
    var_1 setmodel( var_0 );
    var_1 linkto( self, "tag_seat_rb_attach", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 makeusable();
    var_2 = self.mgturret[0];
    var_2 setmodel( "weapon_suburban_minigun_viewmodel" );
    common_scripts\utility::flag_wait( "convoy_moment" );
    thread maps\_vehicle::gopath();
    wait 1.3;
    self.animname = "player_latvee";
    var_3 = maps\_utility::getanim( "roadkill_player_door_open" );
    self setflaggedanim( "other_anim_flag", var_3, 1, 0, 1 );
    level thread maps\_anim::start_notetrack_wait( self, "other_anim_flag" );
    var_4 = maps\_utility::spawn_anim_model( "player_rig" );
    var_4 setmodel( "h2_gfl_ump45_viewhands_player" );
    var_4 linkto( self, "tag_body", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 hide();
    wait 3;
    common_scripts\utility::flag_set( "player_latvee_stops" );
    var_1 thread _id_B3CF();
    var_1 waittill( "trigger" );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ui_hidemap", 1 );
    level.player disableweapons();
    thread _id_ACB5();
    self showpart( "tag_seat_rb_hide" );
    var_1 delete();
    common_scripts\utility::flag_set( "player_gets_in" );
    var_2.animname = "turret";
    var_2 maps\_utility::assign_animtree();
    var_2 dontcastshadows();
    var_5 = [];
    var_5["player"] = var_4;
    var_5["turret"] = var_2;
    level.player setstance( "stand" );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    maps\_anim::anim_first_frame_solo( var_4, "player_getin", "tag_body" );
    level.player playerlinktoblend( var_4, "tag_player", 0.4, 0.2, 0.2 );
    var_4 common_scripts\utility::delaycall( 0.4, ::show );
    var_2 maps\_utility::delaythread( 1, animscripts\laatpv_turret\common::lerp_out_drop_pitch, 1.5 );
    var_4 maps\_utility::delaythread( 0.0, maps\_utility::play_sound_on_entity, "scn_roadkill_enter_latvee_plr" );
    soundscripts\_snd::snd_message( "start_interior_vehicle_context" );
    maps\_anim::anim_single( var_5, "player_getin", "tag_body" );
    var_4 delete();
    var_2 clearanim( var_2 maps\_utility::getanim( "player_getin" ), 0 );
    self clearanim( var_3, 1, 0, 1 );
    level.player enableweapons();
    _id_AA05();

    if ( level.pc )
        setsaveddvar( "cg_viewModelFov", 55 );

    wait 0.1;
    setsaveddvar( "cg_fov", 65 );

    if ( level.pc )
        setsaveddvar( "cg_viewModelFov", 65 );
}

_id_B3CF()
{
    if ( common_scripts\utility::flag( "player_gets_in" ) )
        return;

    level endon( "player_gets_in" );
    self endon( "death" );

    for (;;)
    {
        if ( isalive( level.player ) && distance( self.origin, level.player.origin ) < 80 )
            self notify( "trigger" );

        wait 0.05;
    }
}

_id_ACB5()
{
    wait 1;
    maps\_utility::lerp_fov_overtime( 2, 55 );
}

_id_B8F1()
{
    self.dontdisconnectpaths = 1;
    common_scripts\utility::flag_wait( "player_gets_in" );
    thread maps\_vehicle::gopath();
}

_id_B8E5()
{
    thread _id_CD3F();
    thread _id_B83F();
    intro_hide_entity();
    common_scripts\utility::flag_wait( "convoy_moment" );
    thread maps\_vehicle::gopath();
}

_id_B83F()
{
    self.dontdisconnectpaths = 1;
}

_id_CD3F()
{
    if ( !isdefined( self.script_parameters ) )
        return;

    switch ( self.script_parameters )
    {
        case "picks_up_riders":
            level._id_AECC[level._id_AECC.size] = self;
            break;
    }
}

_id_B80E()
{
    if ( !isdefined( self.target ) )
        return;

    var_0 = getnode( self.target, "targetname" );
    var_1 = getent( var_0.script_linkto, "script_linkname" );
    var_1 waittill( "spawned", var_2 );
    var_0.vehicle = var_2;
}

_id_C668( var_0 )
{
    var_1 = level.player getplayerangles();
    var_2 = anglestoforward( var_1 );
    var_3 = level.player geteye();

    foreach ( var_5 in var_0 )
    {
        if ( isdefined( var_5.script_noteworthy ) )
        {
            if ( var_5.script_noteworthy == "soldier" )
                return var_5;
        }
    }

    foreach ( var_5 in var_0 )
    {
        var_8 = var_5 geteye();
        var_9 = vectortoangles( var_8 - var_3 );
        var_10 = anglestoforward( var_9 );
        var_11 = vectordot( var_10, var_2 );

        if ( var_11 < 0.75 )
            continue;

        var_12 = isdefined( var_5._animactive ) && var_5._animactive;

        if ( var_12 && var_11 >= 0.85 )
            continue;

        return var_5;
    }

    return undefined;
}

_id_CDC9()
{
    if ( common_scripts\utility::flag( "player_gets_in" ) )
        return;

    level endon( "player_gets_in" );
    var_0 = [];

    foreach ( var_2 in level._id_AB11 )
        var_0[var_2.unique_id] = var_2;

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            if ( !isalive( var_2 ) )
                var_0[var_2.unique_id] = undefined;
        }

        var_2 = _id_C668( var_0 );

        if ( isalive( var_2 ) )
        {
            if ( !getdvarint( "use_old_stairblock_anims" ) )
            {
                common_scripts\utility::flag_wait( "time_to_go" );

                if ( isdefined( var_2.export ) && var_2.export == 213 )
                    wait 1.5;
            }

            var_0[var_2.unique_id] = undefined;
            var_2 thread _id_CE8E();

            if ( level._id_CC04 >= level._id_BFF7.size )
                return;

            wait 4;

            if ( isdefined( var_2.script_noteworthy ) )
            {
                if ( var_2.script_noteworthy == "soldier" )
                    wait 3;
            }
        }

        if ( !var_0.size )
            break;

        wait 0.15;
    }
}

get_in_moving_vehicle()
{
    self.get_in_moving_vehicle = 1;
}

_id_D11F()
{
    level._id_AB11[level._id_AB11.size] = self;
    _id_CF91();
}

_id_CF91()
{
    maps\_utility::ent_flag_init( "go_to_convoy" );
    maps\_utility::ent_flag_init( "got_in_vehicle" );
}

_id_C793()
{
    self endon( "death" );
    _id_D11F();
    common_scripts\utility::flag_wait( "time_to_go" );
    self.ignoreall = 1;
}

_id_CE8E()
{
    level._id_CC04++;

    if ( isdefined( self.script_noteworthy ) )
    {
        if ( self.script_noteworthy == "soldier" )
        {
            var_0 = level.scr_anim["soldier"]["idle"][0];
            var_1 = self getanimtime( var_0 );

            if ( var_1 > 0.01 && var_1 < 0.12 )
                wait(( 0.12 - var_1 ) * getanimlength( var_0 ));
            else if ( var_1 > 0.51 && var_1 < 0.64 )
                wait(( 0.64 - var_1 ) * getanimlength( var_0 ));
        }

        if ( self.script_noteworthy == "spotter" || self.script_noteworthy == "soldier" )
        {
            self notify( "stop_loop" );
            self.animnode maps\_anim::anim_single_solo( self, "out" );
        }
    }

    maps\_utility::anim_stopanimscripted();

    if ( isdefined( self._id_AAE2 ) )
        self.remove_from_animloop = 1;

    if ( isdefined( self._id_BD68 ) )
    {
        self thread [[ self._id_BD68 ]]();
        self._id_BD68 = undefined;
    }

    self.moveplaybackrate = 1;
    self.pathrandompercent = 0;
    var_2 = getnode( "riverbank_run_node", "targetname" );
    self.fixednode = 0;
    self setgoalnode( var_2 );
    self.goalradius = 16;
}

_id_C05E()
{
    level._id_B4B8 = self;
    level._id_BFF7 = getnodearray( self.target, "targetname" );

    foreach ( var_1 in level._id_BFF7 )
        var_1 thread _id_B80E();

    level._id_BFF7 = maps\_utility::array_index_by_script_index( level._id_BFF7 );
    self.index = 0;
    _id_AB04();
    level._id_AB11 = maps\_utility::remove_dead_from_array( level._id_AB11 );

    foreach ( var_7 in level._id_AB11 )
    {
        var_7 thread _id_AE74();

        if ( isdefined( var_7._id_BD41 ) )
            continue;

        if ( self.index >= level._id_BFF7.size )
        {
            if ( isdefined( var_7.magic_bullet_shield ) )
                var_7 maps\_utility::stop_magic_bullet_shield();

            var_7 delete();
            continue;
        }

        var_8 = level._id_BFF7[self.index];
        self.index++;
        var_7 thread _id_B5B4( var_8 );
    }
}

_id_AE74()
{
    self endon( "death" );

    for ( var_0 = 0; var_0 < 5; var_0++ )
    {
        self notify( "goal" );
        wait 0.05;
    }
}

_id_AB04()
{
    if ( common_scripts\utility::flag( "player_gets_in" ) )
        return;

    level endon( "player_gets_in" );
    var_0 = [];

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isalive( var_1 ) )
            continue;

        if ( isdefined( var_0[var_1.unique_id] ) )
            continue;

        var_0[var_1.unique_id] = 1;
        var_2 = level._id_BFF7[self.index];
        self.index++;
        var_1 thread _id_B5B4( var_2 );
    }
}

_id_B5B4( var_0 )
{
    self.fixednode = 1;
    self._id_BD41 = 1;
    self.attackeraccuracy = 0;

    if ( !isdefined( self.magic_bullet_shield ) )
        thread maps\_utility::magic_bullet_shield();

    self setgoalnode( var_0 );
    self.goalradius = 16;

    if ( !common_scripts\utility::flag( "convoy_moment" ) )
    {
        level maps\_utility::add_wait( maps\_utility::waittill_msg, "player_got_in" );
        maps\_utility::add_wait( maps\_utility::waittill_msg, "goal" );
        level maps\_utility::add_endon( "convoy_moment" );
        maps\_utility::do_wait_any();
        common_scripts\utility::flag_wait( "convoy_moment" );
    }

    if ( !common_scripts\utility::flag( "guys_get_in_convoy_vehicles" ) )
    {
        common_scripts\utility::flag_wait( "guys_get_in_convoy_vehicles" );
        _id_C342( var_0.script_index );
    }

    if ( !isdefined( var_0.target ) )
    {
        common_scripts\utility::flag_wait( "safe_to_delete_bridge_allies" );
        _id_CECF();
        return;
    }

    var_1 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_1 );
    self.disablearrivals = 1;
    level maps\_utility::add_wait( maps\_utility::waittill_msg, "player_got_in" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "goal" );
    maps\_utility::do_wait_any();
    self.script_startingposition = var_1.script_startingposition;
    thread maps\_utility::guy_runtovehicle_load( self, var_1.vehicle );
    self waittill( "boarding_vehicle" );
    maps\_utility::ent_flag_set( "got_in_vehicle" );

    if ( self.script_startingposition == 4 )
        thread _id_D419();
}

_id_C342( var_0 )
{
    if ( common_scripts\utility::flag( "player_gets_in" ) )
        return;

    level endon( "player_gets_in" );
    wait(var_0 * 0.35);
}

_id_BD77()
{
    level._id_BD77 = self;
    self waittill( "reached_end_node" );
    var_0 = getnode( "house_node", "targetname" );

    foreach ( var_2 in self.riders )
    {
        if ( !isalive( var_2 ) )
            continue;

        if ( !isai( var_2 ) )
            continue;

        var_2 setgoalpos( var_0.origin );
    }
}

_id_CFA2()
{
    var_0 = [];
    var_1 = self.script_timer;

    if ( !isdefined( var_1 ) )
        var_1 = 0.3;

    var_2 = self.script_brake;

    if ( !isdefined( var_2 ) )
        var_2 = 0.3;

    for (;;)
    {
        self waittill( "trigger", var_3 );

        if ( isdefined( var_0[var_3.unique_id] ) )
            continue;

        var_0[var_3.unique_id] = 1;
        var_3 thread _id_C3D4( var_1, var_2 );
    }
}

_id_C3D4( var_0, var_1 )
{
    self.veh_brake = var_1;
    wait(var_0);
    self.veh_brake = 0;
}

_id_B243()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = vectortoangles( var_0.origin - self.origin );
    level._id_B9A9[self.script_parameters] = var_1;
}

_id_BCEE()
{
    var_0 = getent( self.target, "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = var_0.origin;
    var_3 = var_1.origin;
    var_0 delete();
    var_1 delete();
    var_4 = [];
    var_5 = 0;

    if ( isdefined( self.script_noteworthy ) )
    {
        switch ( self.script_noteworthy )
        {
            case "technical_only":
                var_5 = 1;
                break;
        }
    }

    var_6 = undefined;

    if ( isdefined( self.script_parameters ) )
        var_6 = level._id_B9A9[self.script_parameters];

    for (;;)
    {
        self waittill( "trigger", var_7 );

        if ( isdefined( var_4[var_7.unique_id] ) )
            continue;

        if ( var_5 )
        {
            if ( isdefined( level._id_CBAB ) )
            {
                if ( var_7 != level._id_CBAB )
                    continue;
            }
            else
                continue;
        }

        var_4[var_7.unique_id] = 1;
        var_7 thread _id_ABB2( var_2, var_3, var_6 );
    }
}

_id_ABB2( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::getfx( "vehicle_scrape_sparks" );
    var_4 = randomint( 4 );
    var_5 = isdefined( level._id_CBAB ) && self == level._id_CBAB;
    var_6 = var_2;

    for (;;)
    {
        var_7 = self.origin;

        if ( isdefined( self._id_D096 ) )
            var_7 += self._id_D096;

        var_8 = pointonsegmentnearesttopoint( var_0, var_1, var_7 );

        if ( var_8 == var_1 )
            return;

        var_4--;

        if ( var_4 && var_8 != var_0 )
        {
            var_9 = randomfloatrange( -85, -55 );

            if ( !isdefined( var_2 ) )
            {
                var_6 = vectortoangles( var_8 - self.origin );
                var_6 = ( var_9, var_6[1], 0 );
            }

            var_10 = anglestoup( var_6 );
            var_11 = anglestoforward( var_6 );
            var_12 = var_5 || self.veh_speed > 2;

            if ( var_12 )
                playfx( var_3, var_8, var_11, var_10 );
        }

        if ( !var_4 )
            var_4 = _id_C1E9();

        wait 0.05;
    }
}

_id_C1E9()
{
    if ( getdvarint( "r_roadkill_less_sparks" ) )
        return randomint( 2 ) + 1;

    return randomint( 3 ) + 4;
}

_id_B412( var_0, var_1 )
{
    level endon( "player_gets_in" );
    var_2 = [];
    var_2["latvee_turret_bounce"] = 1;
    var_2["latvee_turret_idle_lookbackB"] = 1;
    var_2["latvee_turret_idle_signal_forward"] = 1;
    var_2["latvee_turret_idle_signal_side"] = 1;
    var_2["latvee_turret_radio"] = 1;
    var_2["latvee_turret_flinchA"] = 1;
    var_2["latvee_turret_flinchB"] = 1;

    foreach ( var_5, var_4 in var_2 )
    {
        wait 2;
        level.anime = var_5;
        var_0 animscripts\laatpv_turret\common::turret_gunner_custom_anim( var_1, var_5 );

        if ( common_scripts\utility::flag( "shot_rings_out" ) )
            return;
    }
}

_id_BB38()
{
    var_0 = undefined;
    var_1 = undefined;
    var_1 = self.mgturret[0];

    for (;;)
    {
        var_0 = var_1 getturretowner();

        if ( isalive( var_0 ) )
            break;

        wait 0.05;
    }

    var_0 endon( "death" );
    level._id_B41B = var_0;

    if ( !isdefined( var_0.magic_bullet_shield ) )
        var_0 thread maps\_utility::magic_bullet_shield();

    if ( !common_scripts\utility::flag( "player_gets_in" ) )
    {
        _id_B412( var_0, var_1 );
        wait 1.5;
    }

    if ( !common_scripts\utility::flag( "100ton_bomb_goes_off" ) )
    {
        var_0 thread animscripts\laatpv_turret\common::turret_gunner_custom_anim( var_1, "latvee_turret_rechamber" );
        common_scripts\utility::flag_wait( "100ton_bomb_goes_off" );
        wait 3.5;
        var_0 notify( "special_anim", "end" );
        var_0 animscripts\laatpv_turret\common::turret_gunner_custom_anim( var_1, "latvee_turret_flinchA" );
    }

    thread _id_A848( var_0, var_1 );
    common_scripts\utility::flag_wait( "shot_rings_out" );
    var_2 = common_scripts\utility::getstruct( "frantic_look_target_struct", "targetname" );
    var_3 = spawn( "script_origin", var_2.origin );
    var_1 settargetentity( var_3 );
    var_4 = 0;

    for (;;)
    {
        var_0 notify( "special_anim", "end" );
        var_2 = common_scripts\utility::getstruct( var_2.target, "targetname" );
        var_5 = distance( var_3.origin, var_2.origin );
        var_6 = var_5 / 5000;
        var_7 = gettime();
        var_3 moveto( var_2.origin, var_6, var_6 * 0.2, var_6 * 0.2 );

        if ( !isdefined( var_2.target ) )
            break;

        level common_scripts\utility::waittill_notify_or_timeout( "shot_rings_out", 1.5 );
        maps\_utility::wait_for_buffer_time_to_pass( var_7, 2 );
        wait 0.1;
    }

    var_3 delete();
}

_id_C930( var_0 )
{
    var_0 endon( "death" );

    for (;;)
        wait 0.05;
}

_id_A848( var_0, var_1 )
{
    var_2 = [];
    var_2["latvee_turret_bounce"] = 1;
    var_2["latvee_turret_idle_lookbackB"] = 1;
    var_2["latvee_turret_idle_signal_forward"] = 1;
    var_2["latvee_turret_idle_signal_side"] = 1;
    var_2["latvee_turret_radio"] = 1;
    var_2["latvee_turret_flinchA"] = 1;
    var_2["latvee_turret_flinchB"] = 1;

    foreach ( var_5, var_4 in var_2 )
    {
        wait 2;
        level.anime = var_5;
        var_0 animscripts\laatpv_turret\common::turret_gunner_custom_anim( var_1, var_5 );

        if ( common_scripts\utility::flag( "shot_rings_out" ) )
            return;
    }
}

_id_C29E()
{
    var_0 = self.mgturret[0];
    var_0 setdefaultdroppitch( 0 );
    var_0 animscripts\laatpv_turret\minigun_stand::setup_turret_anims();
    var_0 animscripts\laatpv_turret\common::turret_animfirstframe( var_0.passenger2turret_anime );
}

_id_C057()
{
    switch ( self.script_index )
    {
        case 0:
            level._id_CE62["lead"] = self;
            break;
        case 1:
            level._id_CE62["player"] = self;
            break;
        case 2:
            level._id_CE62["rear"] = self;
            thread _id_C29E();
            break;
        case 3:
            level._id_CE62["detour"] = self;
            thread _id_C29E();
            thread _id_BB38();
            thread _id_D1C2();
            break;
        default:
            break;
    }

    maps\_utility::ent_flag_init( "can_shoot_the_baddies" );
    maps\_utility::ent_flag_init( "start_aiming_at_badguys" );
    level._id_CE62[self.script_index] = self;
    waittillframeend;
    common_scripts\utility::flag_wait( "player_gets_in" );
    common_scripts\utility::flag_wait( "start_runner" );

    if ( level._id_CE62["player"] == self )
        self vehicle_setspeed( 8.79, 1, 1 );

    if ( level._id_CE62["rear"] == self )
        self vehicle_setspeed( 8.79, 1, 1 );

    common_scripts\utility::flag_wait( "player_closes_gap" );
    self resumespeed( 5 );
    common_scripts\utility::flag_wait( "ambush_auto_adjust_speed" );
    self resumespeed( 5 );

    if ( self != level._id_CE62["rear"] )
        return;

    var_0 = self.script_index - 1;
    var_1 = level._id_CE62[var_0];
    _id_D066( var_1 );
}

_id_D066( var_0 )
{
    var_1 = 0;

    for (;;)
    {
        if ( distance( var_0.origin, self.origin ) < 300 )
        {
            self vehicle_setspeed( var_0.veh_speed, 5, 5 );
            var_1 = 1;
        }
        else if ( var_1 )
        {
            var_1 = 0;
            self resumespeed( 5 );
        }

        wait 0.05;
    }
}

_id_D419()
{
    level._id_B271[self.unique_id] = self;
    thread _id_C0DE();
    self waittill( "death" );
    wait 1.5;

    if ( !isdefined( self ) )
        return;

    self startragdoll();
    self unlink();
}

_id_B1BB()
{
    common_scripts\utility::array_thread( level._id_B271, ::_id_CE47 );
}

_id_CE47()
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );

    for (;;)
    {
        _id_BF7B();
        _id_AF97();
        wait 0.05;
    }
}

_id_BF7B()
{
    var_0 = maps\_utility::within_fov_2d( level.player geteye(), level.player getplayerangles(), self.origin, 0.85 );

    if ( var_0 )
    {
        self.ignorerandombulletdamage = 0;
        self.attackeraccuracy = 1;

        if ( self.health > 100 )
            self.health = 100;
    }
    else
    {
        self.ignorerandombulletdamage = 1;
        self.attackeraccuracy = 0;
        self.health = 5000;
    }
}

_id_AF97()
{
    var_0 = self.enemy;

    if ( !isalive( var_0 ) )
        return;

    if ( var_0.ignoreme )
        return;

    var_1 = vectortoangles( level.player.origin - self.origin );

    if ( var_0 maps\_utility::within_fov_2d( level.player.origin, var_1, var_0.origin, 0.85 ) )
    {
        var_0.ignoreme = 1;
        var_0 maps\_utility::delaythread( 1, maps\_utility::set_ignoreme, 0 );
    }
}

_id_D49E( var_0, var_1 )
{
    var_0 endon( "death" );
    var_1 endon( "death" );
    var_2 = 5;
    var_3 = var_2 * 20;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
        wait 0.05;
}

_id_D586()
{
    level endon( "player_knocked_down" );

    for (;;)
    {
        var_0 = getaiarray( "axis" );

        foreach ( var_2 in var_0 )
        {
            if ( !isalive( var_2 ) )
                continue;

            if ( var_2.weapon == "rpg" )
                continue;

            if ( maps\_utility::within_fov_2d( level.player.origin, level._id_BA6B.angles, var_2.origin, 0.8 ) )
                var_2.baseaccuracy = 0.2;
            else
                var_2.baseaccuracy = 0;

            wait 0.02;
        }

        wait 0.05;
    }
}

_id_CBAB()
{
    level._id_CBAB = self;
    self.vehicle_keeps_going_after_driver_dies = 1;
    self.dontunloadonend = 1;
    self._id_D096 = ( -64.0, 0.0, 0.0 );
    maps\_vehicle::godon();
    self.vehicle_stays_alive = 1;
    soundscripts\_snd::snd_message( "start_technical_pickup_blocking_path" );
}

_id_B4C2( var_0 )
{
    var_1 = getentarray( "ride_vehicle_spawner", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_3 maps\_utility::getlinkedvehiclenodes();
        var_5 = 0;

        foreach ( var_7 in var_4 )
        {
            if ( var_7.script_noteworthy != var_0 )
                continue;

            var_5 = 1;

            if ( isdefined( var_3.target ) )
                _id_C917( var_3.target, var_7.targetname );

            var_3.target = var_7.targetname;
            break;
        }
    }
}

_id_C917( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    foreach ( var_4 in var_2 )
        var_4.targetname = var_1;
}

_id_C388()
{
    var_0 = level._id_D2A2;
    wait 7.5;

    foreach ( var_2 in var_0 )
    {
        var_2.count = 1;
        var_2 maps\_utility::spawn_ai();
    }
}

_id_BE39()
{
    level._id_BE39 = self;
    maps\_utility::disable_pain();
    self.ignoreme = 1;
    thread maps\_utility::magic_bullet_shield();
    var_0 = getent( "missile_target", "targetname" );
    self setentitytarget( var_0 );
    self waittill( "shooting" );
    thread maps\_utility::play_sound_on_entity( "scn_ride_killer_rpg_shoot" );
    common_scripts\utility::flag_wait( "player_knocked_down" );
    maps\_utility::stop_magic_bullet_shield();
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.magic_bullet_shield ) )
            var_3 maps\_utility::stop_magic_bullet_shield();

        if ( !isdefined( var_3._id_D130 ) )
            var_3 kill();
    }
}

_id_D1B4()
{
    self waittill( "anim_reach_complete" );
    level._id_B576++;

    if ( level._id_B576 == 4 )
    {
        common_scripts\utility::flag_set( "sweep_dismount_building" );
        maps\_utility::battlechatter_on( "allies" );
    }
}

_id_CB96()
{
    if ( self.animation == "exposed_flashbang_v6" )
    {
        if ( isdefined( level.backseat_model ) )
        {
            self setmodel( level.backseat_model );
            codescripts\character::setheadmodel( level.backseat_face );
        }

        self.script_friendly_fire_disable = 1;
        self setcontents( 0 );
        maps\_utility::gun_remove();
        self.animname = "generic";
        self.ignoreall = 1;
        thread maps\_utility::magic_bullet_shield();
        waittillframeend;
        level._id_C18F thread maps\_anim::anim_loop_solo( self, "exit_latvee" );
        common_scripts\utility::flag_wait( "eyes_on_school" );
        thread maps\_utility::stop_magic_bullet_shield();
        self delete();
        return;
    }

    level._id_CD82[level._id_CD82.size] = self;
    thread maps\_utility::magic_bullet_shield();
    self setthreatbiasgroup( "ally_with_player" );
    maps\_utility::disable_pain();
    self.ignoresuppression = 1;
    self endon( "death" );
    self.animname = self.animation;
    level._id_C18F maps\_anim::anim_single_solo( self, "exit_latvee" );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_wait( "player_enters_ambush_house" );
    maps\_utility::enable_ai_color();
    maps\_utility::enable_pain();

    if ( self.script_forcecolor == "g" )
    {
        if ( !maps\_utility::is_hero() )
        {
            maps\_utility::stop_magic_bullet_shield();
            thread maps\_utility::replace_on_death();
        }
    }

    common_scripts\utility::flag_wait( "eyes_on_school" );
    self.ignoresuppression = 0;
}

_id_B355()
{
    if ( isdefined( self.script_linkto ) )
    {
        var_0 = common_scripts\utility::getstruct( self.script_linkto, "script_linkname" );
        self.origin = var_0.origin;
        self.angles = var_0.angles;
    }

    wait 0.25;
    maps\_utility::spawn_ai();
}

_id_AA44()
{
    level._id_AA44 = self;
}

_id_BA53()
{
    common_scripts\utility::flag_wait( "kill_drones" );
    var_0 = getentarray( "angry_drone", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
        {
            var_2 kill();
            continue;
        }

        var_2 delete();
    }
}

_id_A897()
{
    self endon( "death" );
    var_0 = randomfloatrange( 25, 35 );
    wait(var_0);
    self kill();
}

_id_AF70()
{
    self endon( "death" );
    var_0 = 1.0;
    var_1 = var_0 * 20;
    var_2 = 1;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        self vehicle_setspeedimmediate( var_2, 2, 2 );
        var_2 += 0.6;
        wait 0.05;
    }

    self resumespeed( 1 );
}

_id_CC99()
{
    var_0 = common_scripts\utility::getstruct( "crash_physics_struct", "targetname" );
    var_1 = common_scripts\utility::getstruct( "physics_spawner", "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_3 = 0;
    var_4 = [];
    var_4[0] = "com_soup_can";
    var_4[1] = "com_bottle1";
    var_4[2] = "com_soup_can";
    var_4[3] = "com_bottle1";
    var_4[4] = "com_bottle1";
    var_5 = vectortoangles( var_2.origin - var_1.origin );
    var_6 = anglestoright( var_5 );

    for ( var_7 = 0; var_7 < 14; var_7++ )
    {
        var_8 = var_2.origin + common_scripts\utility::randomvector( 200 );
        var_5 = vectortoangles( var_8 - var_1.origin );
        var_9 = anglestoforward( var_5 );
        var_10 = var_9 * randomfloatrange( 4000, 8500 );
        var_11 = var_4[var_3];
        var_3++;

        if ( var_3 >= var_4.size )
            var_3 = 0;

        var_12 = spawn( "script_model", var_1.origin );
        var_12.origin += var_6 * randomfloatrange( -40, 40 );
        var_12 setmodel( var_11 );
        var_12 physicslaunchclient( var_12.origin, var_10 );
    }

    physicsexplosionsphere( var_0.origin, var_0.radius, var_0.radius, 0.4 );
}

_id_D483( var_0 )
{
    self attachpath( var_0 );
    wait 0.1;
    maps\_vehicle::godoff();

    foreach ( var_2 in self.riders )
    {
        if ( !isalive( var_2 ) )
            continue;

        var_2 _id_CECF();
    }

    radiusdamage( self.origin, 128, 5000, 5000 );
}

_id_C77A()
{
    self endon( "death" );
    self waittill( "goal" );
    wait 3;
    var_0 = common_scripts\utility::getstruct( self.script_linkto, "script_linkname" );
    self setgoalpos( var_0.origin );
    self.goalradius = 4;
    self waittill( "goal" );
    self kill();
}

_id_C2CB()
{
    level endon( "ride_ends" );

    for (;;)
    {
        if ( level.player maps\_utility::ent_flag( "player_has_red_flashing_overlay" ) )
            level.player.attackeraccuracy = 0;

        wait 0.05;
    }
}

_id_B834()
{
    if ( common_scripts\utility::flag( "shepherd_moves_out" ) )
        return;

    level endon( "shepherd_moves_out" );
    var_0 = getentarray( "school_target", "targetname" );

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_2 in var_0 )
        {
            self setentitytarget( var_2 );
            var_3 = randomfloatrange( 3, 6 );
            wait(var_3);
        }
    }
}

_id_CA5E()
{
    if ( issubstr( self.classname, "shepherd" ) )
    {
        thread precognitive_paranoia_watch_damage();
        thread precognitive_paranoia_watch_death();
    }

    level._id_D049++;
    self endon( "death" );
    self setthreatbiasgroup( "ally_outside_school" );
    thread maps\_utility::magic_bullet_shield();
    common_scripts\utility::flag_wait( "friendlies_suppress_school" );
    self.suppressionwait = 0;
    thread _id_B834();
    common_scripts\utility::flag_wait( "shepherd_moves_out" );
    var_0 = common_scripts\utility::getclosest( self.origin, level._id_A86D );
    self.ignoreall = 1;
    self.ignoresuppression = 1;
    self.ignorerandombulletdamage = 1;

    if ( var_0.runningtovehicle.size >= 4 )
    {
        foreach ( var_2 in level._id_A86D )
        {
            if ( var_2 != var_0 )
            {
                var_0 = var_2;
                break;
            }
        }
    }

    maps\_utility::guy_runtovehicle_load( self, var_0 );
    maps\_utility::stop_magic_bullet_shield();
    level._id_D049--;

    if ( !level._id_D049 )
        common_scripts\utility::flag_set( "shepherd_vehicles_leave" );

    self.ignoreall = 0;
    self.ignoresuppression = 0;
    self.ignorerandombulletdamage = 0;
    common_scripts\utility::flag_wait( "the_end" );
    _id_CECF();
}

_id_D103()
{
    var_0 = 0;

    if ( isdefined( self.script_noteworthy ) )
        var_0 = self.script_noteworthy == "school_unreachable_spawner";

    if ( var_0 )
        self setthreatbiasgroup( "axis_school_unreachable" );
    else
        self setthreatbiasgroup( "axis_school" );

    maps\_utility::add_damage_function( ::_id_AA66 );
}

_id_AA66( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isalive( var_1 ) )
        return;

    if ( var_1 != level.player )
        return;

    wait 3;
    level.player setthreatbiasgroup( "allies" );
}

_id_B685()
{
    self setthreatbiasgroup( "axis_ambush_house" );
}

_id_D35B()
{
    for ( var_0 = 1; var_0 <= 20; var_0++ )
    {
        var_1 = "roadkill_school_" + var_0;
        var_2 = getent( var_1, "targetname" );

        if ( common_scripts\utility::flag_exist( var_1 ) )
        {
            common_scripts\utility::flag_wait( var_1 );

            if ( var_1 == "roadkill_school_7" )
            {
                foreach ( var_4 in [ level._id_ACC0, level.foley ] )
                {
                    if ( distance2dsquared( var_4.origin, ( -7825.7, 9885.8, 658.0 ) ) < 100 )
                    {
                        var_4.custommovetransition = animscripts\cover_arrival::custommovetransitionfunc;
                        var_4.startmovetransitionanim = var_4 animscripts\utility::lookuptransitionanim( "cover_exit", "left_crouch_cqb", 8 );
                        break;
                    }
                }
            }

            if ( var_1 == "roadkill_school_10" )
                common_scripts\utility::flag_wait_either( "school_back_baddies_dead", "roadkill_near_crossroads" );

            var_6 = var_2 maps\_utility::get_color_volume_from_trigger();

            if ( isdefined( var_6 ) )
                var_6 maps\_utility::waittill_volume_dead_or_dying();

            var_2 maps\_utility::activate_trigger();
        }
    }
}

_id_B6D7()
{
    common_scripts\utility::flag_wait( "hidden_guy_opens_fire" );
    wait 1.3;
    var_0 = getent( "dunn_clear_volume", "targetname" );
    var_0 maps\_utility::waittill_volume_dead();
    _id_C24A( "roadkill_cpd_clear" );
    wait 1;
    var_1 = [];
    var_1["player"] = level.player;
    var_1["foley"] = level.foley;
    var_1["dunn"] = level._id_ACC0;
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( var_4 istouching( var_0 ) )
            var_2++;
    }

    if ( var_2 == 2 )
        _id_C24A( "roadkill_cpd_2cominout" );
    else if ( var_2 == 3 )
        _id_C24A( "roadkill_cpd_3cominout" );
}

_id_C084()
{
    self endon( "death" );
    maps\_utility::set_force_cover( 1 );
    maps\_utility::add_wait( ::can_see_player );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "hidden_guy_opens_fire" );
    maps\_utility::do_wait_any();
    maps\_utility::set_force_cover( 0 );
}

can_see_player()
{
    self endon( "death" );

    for (;;)
    {
        if ( self cansee( level.player ) )
            return;

        wait 0.05;
    }
}

_id_C41C()
{
    common_scripts\utility::flag_wait( "cutting_through_history" );

    for (;;)
    {
        waittillframeend;

        if ( !level._id_D3A2.function_stack.size )
            break;

        wait 0.05;
    }

    _id_C24A( "roadkill_cpd_historyclass" );
    _id_B2D4( "roadkill_fly_rogerthat" );
}

_id_D21F()
{
    self.moveplaybackrate = 0.76;
    self.attackeraccuracy = 1000;
}

_id_B489()
{
    earthquake( 0.25, 0.8, level.player.origin, 5000 );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player _meth_80B5( "damage_light" );
    common_scripts\utility::flag_wait( "player_goes_in_reverse" );
    level.player _meth_80B6( "damage_light" );
}

_id_B1F9( var_0 )
{
    level notify( "new_force_player_speed" );
    level endon( "new_force_player_speed" );
    var_1 = level._id_CE62[1];
    level endon( "stop_updating_player_vehicle_speed" );

    for (;;)
    {
        var_1 vehicle_setspeedimmediate( var_0, 2, 2 );
        wait 0.05;
    }
}

_id_CF77()
{
    level endon( "stop_updating_player_vehicle_speed" );
    common_scripts\utility::flag_wait( "push_hurts_technical" );
    level._id_CBAB maps\_vehicle::godoff();
    var_0 = 60;

    for (;;)
    {
        radiusdamage( level._id_CBAB.origin, 25, var_0, var_0, level.player );

        if ( level._id_CBAB.health < 18000 )
            level._id_CBAB.health = 18000;

        wait 0.05;
    }
}

_id_D415()
{
    wait 0.75;
    self vehicle_setspeed( 16, 2, 2 );
    self.veh_brake = 0;
}

_id_B3A4()
{
    var_0 = level._id_CE62[1];
    var_1 = level._id_CE62[2];
    var_2 = level._id_CE62[0];

    for (;;)
    {
        self waittill( "trigger", var_3 );

        if ( !isdefined( level._id_CBAB ) )
            continue;

        if ( var_3 == level._id_CBAB )
            break;
    }

    var_0 maps\roadkill_aud::_id_B95A();
    common_scripts\utility::flag_set( "we're cut off" );
    var_4 = gettime();
    var_0 vehicle_setspeed( 0, 10, 10 );
    wait 0.25;
    var_1.veh_brake = 0.5;
    var_2 maps\_utility::delaythread( 2, maps\_utility::set_brakes, 0.5 );
    level._id_CBAB.veh_brake = 0.5;
    level._id_CBAB maps\_utility::waittill_player_lookat( 0.6, 1.0, undefined, 8 );
    maps\_utility::delaythread( 0, ::_id_C06E );
    wait 0.2;
    common_scripts\utility::flag_set( "push_through" );
    wait 0.5;
    var_0.veh_brake = 0;
    var_0 vehicle_setspeed( 1.5, 10, 10 );
    var_1.veh_brake = 0;
    var_2 thread _id_B5AA();
    wait 0.65;
    common_scripts\utility::flag_set( "resume_the_path" );
    wait 1.1;
    maps\_utility::wait_for_buffer_time_to_pass( var_4, 5.5 );
}

_id_B5AA()
{
    wait 3.5;
    self.veh_brake = 0;
    self vehicle_setspeed( 12, 1, 1 );
}

_id_C31B()
{
    var_0 = gettime();

    for (;;)
    {
        var_1 = self gettagorigin( "tag_origin" );
        var_2 = self gettagangles( "tag_origin" );
        var_3 = self gettagorigin( "tag_body" );
        var_4 = self gettagangles( "tag_body" );
        var_5 = gettime() - var_0;
        wait 0.05;
    }
}

delete_on_goal()
{
    self endon( "death" );
    self waittill( "goal" );
    self delete();
}

_id_CE58()
{
    return level.player getcurrentweapon() == "javelin";
}

_id_A823()
{
    for (;;)
    {
        if ( level.player getcurrentweapon() == "javelin" )
            break;

        wait 0.05;
    }

    common_scripts\utility::flag_set( "player_switched_to_javelin" );
}

_id_C3E9()
{
    var_0 = [];
    var_0[0] = "roadkill_fly_switchtojavelin";
    var_0[1] = "roadkill_fly_takeoutarmor";
    var_1 = 0;

    for (;;)
    {
        var_2 = 9 + randomintrange( 2, 5 );
        var_3 = var_2 * 20;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            if ( level.player getcurrentweapon() == "javelin" )
                return;

            wait 0.05;
        }

        var_5 = var_0[var_1];
        var_1++;
        var_1 %= var_0.size;

        while ( level._id_D3A2.function_stack.size )
            wait 0.05;

        if ( level.player getcurrentweapon() == "javelin" )
            return;

        _id_B2D4( var_5 );
    }
}

_id_C4F6()
{
    if ( gettime() <= level._id_CC83 + 19000 )
        return 0;

    return !level._id_D3A2.function_stack.size;
}

_id_BE06()
{
    wait 11;
    thread maps\_utility::autosave_by_name( "riverbank" );
    wait 3;
    _id_B2D4( "roadkill_fly_wereswimming" );
    wait 1;
    common_scripts\utility::flag_set( "intro_lines_complete" );
}

_id_B9B6()
{
    wait 6;
}

_id_B2E0()
{
    if ( !maps\_utility::is_default_start() )
        return;

    maps\_utility::battlechatter_off( "allies" );
    wait 0.74;
    _id_B27C( "roadkill_cpd_airstrike" );
    _id_BE3C( "roadkill_auc_ontheline" );
    wait 0.9;
    _id_BE3C( "roadkill_fp1_devil11" );
    _id_BE3C( "roadkill_fp1_standingby" );
    _id_B27C( "roadkill_cpd_levelbuilding" );
    _id_BE3C( "roadkill_fp1_targetacquired" );
}

_id_D135()
{
    level._id_A86D[level._id_A86D.size] = self;
    self vehphys_disablecrashing();
    common_scripts\utility::flag_wait( "shepherd_vehicles_leave" );
    var_0 = getvehiclenode( self.target, "targetname" );
    var_1 = distance( self.origin, var_0.origin );

    if ( self.script_index > 1 )
        var_2 = 1;
    else
        var_2 = var_1 * 0.005;

    wait(var_2);
    maps\_vehicle::gopath();
    maps\roadkill_aud::school_latvee_sounds();
}

_id_C761()
{
    level._id_C1F6[self.script_noteworthy] = self;
}

_id_B3A9( var_0 )
{
    if ( isalive( level._id_C1F6[var_0] ) )
        return level._id_C1F6[var_0];

    var_1 = 0;
    var_2 = getaiarray( "allies" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( !isalive( var_5 ) )
            continue;

        if ( var_5 maps\_utility::is_hero() )
            continue;

        if ( isdefined( var_5._id_C0E6 ) )
            continue;

        var_5._id_C0E6 = 1;
        level._id_C1F6[var_0] = var_5;
        return var_5;
    }
}

_id_CFBE( var_0, var_1 )
{
    var_2 = _id_B3A9( var_1 );
    var_2 maps\_utility::generic_dialogue_queue( var_0 );
    wait 0.25;
}

printer()
{
    var_0 = int( 50.0 );

    for ( var_1 = 0; var_1 < var_0; var_1++ )
        wait 0.05;
}

_id_CF27( var_0 )
{
    return level.player.origin + ( 0, var_0 * -1, 0 );
}

_id_D26F( var_0 )
{
    var_1 = level.player.origin;

    if ( common_scripts\utility::flag( "100ton_bomb_goes_off" ) )
        var_1 = level._id_AB2D;

    var_2 = 128;

    switch ( var_0 )
    {
        case "ar1":
            return var_1 + ( var_2, 0, 0 );
        case "ar2":
            return var_1 + ( var_2, var_2, 0 );
        case "ar3":
            return var_1 + ( var_2 * -1, 0, 0 );
        case "ar4":
            return var_1 + ( var_2 * -1, var_2 * -0.5, 0 );
        case "ar5":
            return var_1 + ( var_2, var_2 * -0.5, 0 );
        case "farguy":
            return var_1 + ( var_2 * 15, var_2 * 15, 0 );
        case "left":
            return var_1 + ( var_2 * -2, 0, 0 );
        case "left_back":
            return var_1 + ( var_2 * -2, -1000, 0 );
        case "left_back_more":
            return var_1 + ( var_2 * -2, -3000, 0 );
        case "right_forward":
            return var_1 + ( var_2 * 2, 1000, 0 );
        case "right_forward_more":
            return var_1 + ( var_2 * 2, 1500, 0 );
        case "right_rear_back":
            return var_1 + ( var_2 * 2, -3800, 0 );
        case "cpd":
            return var_1 + ( var_2 * 0.5, var_2 * 0.5, var_2 * -0.2 );
        default:
            return var_1 + ( 0.0, 0.0, 0.0 );
    }
}

_id_BE86()
{
    var_0 = 2.5;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar1_10seconds", _id_CF27( 5000 ) );
    var_0 += 1.1;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar2_10seconds", _id_CF27( 3500 ) );
    var_0 += 0.8;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar3_10seconds", _id_CF27( 1200 ) );
    var_0 += 2.9;
    var_0 += 1.6;
    var_0 += 1.4;
    var_0 += 1.4;
    var_0 += 4.6;
    var_0 += 1.2;
    maps\_utility::delaythread( var_0, maps\_vehicle::spawn_vehicle_from_targetname_and_drive, "bomber_spawner" );
    var_0 += 0.7;
    level._id_BA6B maps\_utility::delaythread( 17, maps\_utility::play_sound_on_tag_endon_death, "roadkill_ar3_dangerclose", "tag_driver" );
    var_0 += 2.1;
    level._id_ACC0 maps\_utility::delaythread( 19, maps\_utility::play_sound_on_tag_endon_death, "roadkill_cpd_sincewhen", undefined );
    var_0 += 1.8;
    var_1 = 0.75;
    wait(var_0 - var_1);
    common_scripts\utility::flag_set( "video_tapers_react" );
    wait(var_1);
    common_scripts\_exploder::exploder( "100ton_bomb" );
    thread _id_CDEC();
    thread _id_C361();
    thread _id_AA1A();
    level.player maps\_utility::delaythread( 3.6, maps\_gameskill::grenade_dirt_on_screen, "left" );
    level._id_AB2D = level.player.origin;
    common_scripts\utility::flag_set( "100ton_bomb_goes_off" );
    var_2 = gettime();
    wait 0.25;
    maps\_utility::delaythread( 10.65, common_scripts\utility::play_sound_in_space, "roadkill_cpd_looklook", _id_D26F( "cpd" ) );
    var_0 = 1.3;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar1_boom", _id_D26F( "ar1" ) );
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar3_woo", _id_D26F( "ar1" ) );
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar1_yeah", _id_D26F( "ar4" ) );
    var_0 += 0.2;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar2_catcalls", _id_D26F( "ar2" ) );
    var_0 += 1.1;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar3_catcalls", _id_D26F( "ar3" ) );
    var_0 += 0.9;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_cpd_getsome", _id_D26F( "cpd" ) );
    var_0 += 0.2;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar2_yeah", _id_D26F( "ar2" ) );
    var_0 += 0.8;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar5_hotman", _id_D26F( "right_rear_back" ) );
    var_0 += 0.4;
    var_0 += 0.5;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar1_4thofjuly", _id_D26F( "right_rear_back" ) );
    var_0 += 2.05;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar4_oscarmike", _id_D26F( "ar1" ) );
    var_0 += 1.0;
    maps\_utility::delaythread( var_0 + 2, common_scripts\utility::flag_set, "convoy_oscar_mike_after_explosion" );
    maps\_utility::delaythread( var_0 + 0.5, common_scripts\utility::play_sound_in_space, "roadkill_cpd_oscarmike", _id_D26F( "cpd" ) );
    var_0 += 0.9;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar3_onthemove", _id_D26F( "right_rear_back" ) );
    var_0 += 1.15;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar4_rogerthat", _id_D26F( "right_rear_back" ) );
    var_0 += 2.0;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_cpd_paybig", _id_D26F( "left_back" ) );
    var_0 += 1.8;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_ar2_keepdreamin", _id_D26F( "left_back" ) );
    var_0 += 1.1;
    maps\_utility::delaythread( var_0, common_scripts\utility::play_sound_in_space, "roadkill_cpd_extreme", _id_D26F( "left_back" ) );
    maps\_utility::wait_for_buffer_time_to_pass( var_2, 7.15 );
}

_id_B66F()
{
    if ( !maps\_utility::is_default_start() )
        return;

    _id_B2D4( "roadkill_fly_bridgecomplete" );
    _id_C24A( "roadkill_cpd_movinout" );
    var_0 = 0.05;
    maps\_utility::delaythread( var_0, ::_id_CFBE, "roadkill_ar3_backinvehicle", "ar3" );
    var_0 += 1.3;
    wait(var_0);
    maps\_utility::delaythread( var_0, ::_id_B2D4, "roadkill_fly_oscarmike" );
    var_0 += 0.6;
    var_0 += 0.6;
    var_0 += 3.2;
    wait(var_0);

    if ( common_scripts\utility::flag( "player_gets_in" ) )
        return;

    level endon( "player_gets_in" );
    wait 1.2;
    thread _id_B2D4( "roadkill_fly_mountup" );
    wait 0.5;
    thread _id_CFBE( "roadkill_ar2_oscarmike", "ar2" );
}

_id_C687( var_0 )
{
    var_1 = getaiarray( "allies" );
    var_1 = common_scripts\utility::get_array_of_closest( level.player.origin, var_1, undefined, 5 );
    var_2 = common_scripts\utility::random( var_1 );

    if ( !isalive( var_2 ) )
        return;

    var_2 maps\_utility::generic_dialogue_queue( var_0 );
}

_id_C821()
{
    if ( common_scripts\utility::flag( "ambush_spawn" ) )
        return;

    level endon( "ambush_spawn" );
    var_0 = [];
    var_0[var_0.size] = "roadkill_fly_nothingthere";
    var_0[var_0.size] = "roadkill_fly_ceasefire";
    var_1 = 0;

    for (;;)
    {
        if ( _id_D3E5() )
            wait 1.5;

        if ( _id_D3E5() )
        {
            var_2 = var_0[var_1];
            var_1++;
            var_1 %= var_0.size;
            _id_B2D4( var_2 );
            wait 1;
        }

        wait 0.05;
    }
}

_id_D3E5()
{
    if ( !level.player attackbuttonpressed() )
        return 0;

    var_0 = getaiarray( "axis" );
    var_1 = level.player getplayerangles();
    var_2 = anglestoforward( var_1 );
    var_3 = level.player geteye();

    foreach ( var_5 in var_0 )
    {
        var_1 = vectortoangles( var_5.origin - var_3 );
        var_6 = anglestoforward( var_1 );
        var_7 = vectordot( var_2, var_6 );

        if ( var_7 > 0.86 )
            return 0;
    }

    return 1;
}

_id_CE0A()
{
    if ( common_scripts\utility::flag( "ambush_spawn" ) )
        return;

    level endon( "ambush_spawn" );
    var_0 = 0;
    var_1 = 5;
    var_2 = var_1 * 20;

    for (;;)
    {
        if ( level.player attackbuttonpressed() )
            var_0 += 1;
        else
            var_0 -= 0.25;

        if ( var_0 <= 0 )
            var_0 = 0;

        if ( var_0 > var_2 )
            break;

        wait 0.05;
    }

    setdvar( "ui_deadquote", &"ROADKILL_SHOT_TOO_MUCH" );
    maps\_utility::missionfailedwrapper();
}

_id_D25E()
{
    level._id_D06C = self;
    self.veh_pathtype = "constrained";
    common_scripts\utility::flag_wait( "player_gets_in" );
    self.veh_pathtype = "follow";
}

_id_D5CB()
{
    var_0 = getent( "animated_bridge_fence_pivot", "targetname" );
    wait 3.25;
    var_1 = getentarray( "animated_bridge_fence", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 notsolid();
        var_3 setcontents( 0 );
        var_3 linkto( var_0 );
    }

    var_5 = var_0.angles;
    var_6 = -25;

    for (;;)
    {
        var_7 = abs( var_6 ) * 0.0475;

        if ( var_7 < 0.75 )
            var_7 = 0.75;

        var_0 rotateto( ( 0, 90, var_6 ), var_7, var_7 * 0.5, var_7 * 0.5 );
        var_6 *= -0.65;
        wait(var_7);

        if ( abs( var_6 ) <= 2 )
            break;
    }

    var_0 rotateto( var_5, 0.2 );
    wait 0.5;
    var_0 delete();
}

_id_AA1A()
{
    wait 1.1;
    level.player playrumblelooponentity( "collapsing_building" );
    earthquake( 0.3, 2, ( -2556.2, -702.2, 1446.0 ), 15000 );
    wait 2.4;
    earthquake( 0.15, 0.6, ( -2556.2, -702.2, 1446.0 ), 15000 );
}

_id_C361()
{
    var_0 = getent( "h2_rk_build_a", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 thread maps\_utility::play_sound_on_entity( "scn_roadkill_building_collapse_01" );

    wait 4.0;
    common_scripts\_exploder::exploder( "building_collapse" );
    level notify( "building_collapse" );
    thread start_buildings_deleter();
    maps\_utility::delaythread( 0.5, maps\_utility::vision_set_fog_changes, "roadkill_First_building_explosion", 2 );
}

_id_CDEC()
{
    wait 1.3;
    var_0 = getent( "physics_explosion_line", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_3 = var_0.radius;
    var_4 = distance( var_0.origin, var_1.origin );
    var_5 = var_4 / var_3;
    var_6 = 3;
    var_0 moveto( var_2.origin, var_6, 2, 0 );
    var_7 = gettime() + var_6 * 1000;
    var_8 = var_1.origin - var_0.origin;
    var_8 /= var_5;
    var_9 = ( -45.0, -55.0, 72.0 );
    var_10 = vectortoangles( var_9 );
    var_11 = anglestoforward( var_10 );
    var_9 = var_11 * 0.14;
    var_12 = 0;

    for (;;)
    {
        if ( gettime() > var_7 )
            break;

        var_13 = var_0.origin;

        for ( var_14 = 0; var_14 < var_5; var_14++ )
        {
            var_12++;

            if ( var_12 <= 3 )
                physicsexplosioncylinder( var_13, var_3, var_3, 0.3 );
            else
            {
                physicsjolt( var_13, var_3, var_3, var_9 );
                var_12 = 0;
            }

            var_13 += var_8;
        }

        wait 0.05;
    }
}

_id_B0CE()
{
    maps\_utility::array_spawn_function_targetname( "street_walk_scene", ::_id_C6CB );
    common_scripts\utility::flag_wait( "convoy_oscar_mike_after_explosion" );
    wait 8.5;
    maps\_utility::array_spawn_targetname( "street_walk_scene" );
}

_id_C6CB()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    self setgoalpos( self.origin );
    self.moveplaybackrate = 1;
    self.pathrandompercent = 0;
    var_0 = common_scripts\utility::getstruct( self.script_linkto, "script_linkname" );
    var_1 = [];
    var_1["street_walk_scene1"] = 1.7;
    var_1["street_walk_scene2"] = 0.9;
    var_1["street_walk_scene3"] = 0;
    var_2 = var_1[var_0.targetname];
    var_2 *= 1.3;
    wait(var_2);
    maps\_utility::enable_cqbwalk();
    var_0 maps\_anim::anim_generic_reach( self, "combat_walk" );
    var_0 maps\_anim::anim_generic_gravity( self, "combat_walk" );
    self notify( "killanimscript" );
    var_3 = getnode( self.target, "targetname" );
    self setgoalnode( var_3 );
    self.fixednode = 0;
    self.goalradius = 8;
    self waittill( "goal" );
    _id_CECF();
}

_id_AF3F()
{
    if ( !level.console )
        return;

    if ( !level.ps3 )
        return;

    var_0 = getentarray( "ps3_hide", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 hide();

    common_scripts\utility::flag_wait( "roadkill_town_dialogue" );

    foreach ( var_2 in var_0 )
        var_2 show();
}

_id_B50C()
{
    var_0 = getentarray( self.target, "targetname" );

    foreach ( var_2 in var_0 )
        var_2 linkto( self );

    var_4 = getent( self.script_linkto, "script_linkname" );
    maps\_utility::add_target_pivot( var_4 );
    var_5 = getent( "broken_wall_start_org", "targetname" );
    var_6 = var_4.origin;
    var_7 = var_4.angles;
    var_4.origin = var_5.origin;
    var_4.angles = var_5.angles;
    common_scripts\utility::flag_wait( "roadkill_town_dialogue" );
    common_scripts\utility::flag_wait( "building_face_falloff" );
    var_4 thread maps\_utility::play_sound_on_entity( "scn_roadkill_building_crumble_01" );
    var_8 = 4;
    var_4 rotateto( var_7, var_8, 3, 1 );
    var_4 moveto( var_6, var_8, 3, 1 );
    common_scripts\_exploder::exploder( "building_crumble" );
}

_id_B777()
{
    var_0 = getent( "h2_rk_split_build", "targetname" );

    if ( isdefined( var_0 ) )
    {
        common_scripts\utility::flag_wait( "building_face_falloff" );
        var_0 thread maps\_utility::play_sound_on_entity( "scn_roadkill_building_crumble_01" );
        common_scripts\_exploder::exploder( "facade_building" );
        wait 2.0;
        earthquake( 0.2, 2.0, level.player.origin, 850 );
    }
}

_id_B6C1()
{
    thread _id_A823();
    waittillframeend;
    common_scripts\utility::flag_wait( "get_on_the_line" );
    objective_add( maps\_utility::obj( "bridge_layer" ), "current", &"ROADKILL_OBJECTIVE_BRIDGELAYER", ( 0.0, 0.0, 0.0 ) );
    objective_onentity( maps\_utility::obj( "bridge_layer" ), level.foley );
    objective_setpointertextoverride( maps\_utility::obj( "bridge_layer" ), &"SCRIPT_WAYPOINT_TARGETS" );
    objective_position( maps\_utility::obj( "bridge_layer" ), ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "bridge_layer_attacked_by_bridge_baddies" );
    wait 4.5;
    objective_position( maps\_utility::obj( "bridge_layer" ), ( -2519.0, -2457.0, 288.0 ) );
    setsaveddvar( "compass", 1 );
    common_scripts\utility::flag_wait( "bridge_baddies_retreat" );
    objective_position( maps\_utility::obj( "bridge_layer" ), ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "bridgelayer_crosses" );
    maps\_utility::objective_complete( maps\_utility::obj( "bridge_layer" ) );
    wait 1.5;
    var_0 = ( -2488.0, -3755.0, 182.0 );
    objective_add( maps\_utility::obj( "convoy" ), "current", &"ROADKILL_OBJECTIVE_LATVEE", var_0 );

    for (;;)
    {
        if ( isdefined( level._id_D3D4 ) )
            break;

        wait 0.05;
    }

    objective_onentity( maps\_utility::obj( "convoy" ), level._id_D3D4 );
    common_scripts\utility::flag_wait( "player_gets_in" );
    objective_position( maps\_utility::obj( "convoy" ), ( 0.0, 0.0, 0.0 ) );
    wait 3;
    objective_string( maps\_utility::obj( "convoy" ), &"ROADKILL_OBJECTIVE_AIRSTRIKE" );
    common_scripts\utility::flag_wait( "convoy_oscar_mike_after_explosion" );
    objective_state( maps\_utility::obj( "convoy" ), "current" );
    maps\_utility::objective_complete( maps\_utility::obj( "convoy" ), 1 );
}

_id_B0F5()
{
    objective_add( maps\_utility::obj( "ride" ), "current", &"ROADKILL_OBJECTIVE_SCAN", ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "shot_rings_out" );
    wait 4.5;
    objective_add( maps\_utility::obj( "ride" ), "current", &"ROADKILL_OBJECTIVE_TARGETS", ( 0.0, 0.0, 0.0 ) );
    objective_current( maps\_utility::obj( "ride" ) );
    common_scripts\utility::flag_wait( "player_knocked_down" );
}

_id_CD40()
{
    if ( !maps\_utility::is_default_start() )
        objective_add( maps\_utility::obj( "ride" ), "current", &"ROADKILL_OBJECTIVE_TARGETS", ( 0.0, 0.0, 0.0 ) );

    wait 0.5;

    for (;;)
    {
        if ( isalive( level.foley ) )
            break;

        wait 0.05;
    }

    objective_onentity( maps\_utility::obj( "ride" ), level.foley );
    var_0 = getnode( "dismount_obj_node", "targetname" );
    maps\_utility::objective_complete( maps\_utility::obj( "ride" ), 1 );
    common_scripts\utility::flag_wait( "player_enters_ambush_house" );
    wait 8;
    objective_add( maps\_utility::obj( "school" ), "current", &"ROADKILL_OBJECTIVE_SECURE_TOP_FLOOR", var_0.origin );
    common_scripts\utility::flag_wait( "ambush_house_deathflag" );
    maps\_utility::objective_complete( maps\_utility::obj( "school" ) );
}

_id_C068()
{
    var_0 = maps\_utility::getentwithflag( "roadkill_school_14" );
    objective_add( maps\_utility::obj( "school" ), "current", &"ROADKILL_OBJECTIVE_SCHOOL", var_0.origin );
    objective_state( maps\_utility::obj( "school" ), "current" );

    for (;;)
    {
        if ( isalive( level.foley ) )
            break;

        wait 0.05;
    }

    objective_onentity( maps\_utility::obj( "school" ), level.foley );
    common_scripts\utility::flag_wait( "roadkill_school_14" );
}

_id_BFC8()
{
    maps\_utility::objective_complete( maps\_utility::obj( "school" ) );
    common_scripts\utility::flag_wait( "final_objective" );
    var_0 = common_scripts\utility::getstruct( "roadkill_shepherd_ending_scene", "targetname" );
    objective_add( maps\_utility::obj( "exfil" ), "current", &"ROADKILL_OBJECTIVE_REPORT", var_0.origin );
}

_id_CF90()
{
    level endon( "time_to_go" );
    var_0 = self;
    var_1 = [];
    var_1[var_1.size] = var_0;

    for (;;)
    {
        if ( !isdefined( var_0.target ) )
            break;

        var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
        var_1[var_1.size] = var_0;
    }

    var_2 = [];
    var_2[0] = 0.3;
    var_2[1] = 1.1;
    var_2[2] = 0.5;
    var_2[3] = 0.0;
    var_2[4] = 1.3;
    var_2[5] = 2.3;
    var_2[6] = 1.6;
    var_2[7] = 0.0;
    wait 0.35;

    foreach ( var_0 in var_1 )
        var_0.water = isdefined( var_0.script_noteworthy ) && var_0.script_noteworthy == "water";

    var_5 = common_scripts\utility::getfx( "mortar_large" );
    var_6 = common_scripts\utility::getfx( "mortar_water" );
    level._id_B7C5 = maps\_utility::get_exploder_array( "building_mortar" );
    var_7 = 0;

    for (;;)
    {
        var_7 %= var_1.size;
        var_0 = var_1[var_7];

        if ( var_0.water )
        {
            var_0.fx = var_6;
            var_0.sound = "mortar_explosion_water";
        }
        else
        {
            var_0.fx = var_5;
            var_0.sound = "mortar_explosion_dirt";
        }

        thread _id_C5C2( var_0 );
        var_8 = var_7 % var_2.size;
        wait(var_2[var_8]);
        var_2[var_8] += 0.75;
        var_7++;
    }
}

_id_C5C2( var_0 )
{
    var_1 = common_scripts\utility::random( level._id_B7C5 );
    var_1 common_scripts\utility::activate_individual_exploder();
    wait 2;
    thread common_scripts\utility::play_sound_in_space( "mortar_incoming", var_0.origin );
    wait 1;
    playfx( var_0.fx, var_0.origin );
    radiusdamage( var_0.origin, 200, 300, 50 );
    thread common_scripts\utility::play_sound_in_space( var_0.sound, var_0.origin );
}

_id_D4F6()
{
    level endon( "player_gets_in" );
    common_scripts\utility::flag_wait( "player_tries_to_cross_bridge" );
    thread _id_AD7F();
}

_id_AD7F()
{
    wait 2;
    level.player endon( "death" );
    level.player common_scripts\utility::delaycall( 3, ::enablehealthshield, 0 );
    var_0 = level.player geteye();
    var_1 = undefined;
    setdvar( "ui_deadquote", &"ROADKILL_GOT_SNIPED" );

    foreach ( var_1 in level._id_ACC9 )
    {
        if ( bullettracepassed( var_0, var_1, 1, undefined ) )
            break;
    }

    for (;;)
    {
        thread common_scripts\utility::play_sound_in_space( "scn_h2_wpn_dragunov_npc_mid", var_1 );
        wait 0.05;
        level.player thread maps\_utility::play_sound_on_entity( "scn_oob_bullet_hit_plr" );
        level.player dodamage( 45 / level.player.damagemultiplier, var_1 );
        var_4 = randomfloatrange( 0.4, 0.7 );
        wait(var_4);
    }
}

_id_C871()
{
    level._id_ACC9 = [];
    var_0 = getentarray( "attack_point", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        level._id_ACC9[level._id_ACC9.size] = var_2.origin;
}

_id_C4E3()
{
    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "delayed_targeting" )
    {
        if ( level.start_point != "move_out" )
            wait 10;
    }

    wait 1;
    var_0 = ( 0.0, 0.0, 60.0 );
    target_set( self, var_0 );
    target_setattackmode( self, "top" );
    target_setjavelinonly( self, 1 );
    thread _id_C318();
    self.health = 20000;
    maps\_vehicle::godon();
    _id_B78D();

    if ( isdefined( self ) )
        target_remove( self );
}

_id_C318()
{
    self endon( "death" );
    wait 1.5;
    self._id_AC68 = 1;
}

_id_C841()
{
    level._id_B079 = self;
}

_id_AB9D()
{
    var_0 = getent( "bmp_destroyed", "targetname" );
    var_0 thread _id_BDC4();
    maps\_utility::array_spawn_function_targetname( "riverbank_bmp", ::_id_C841 );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname( "riverbank_bmp" );
    var_1 waittill( "death" );
    common_scripts\_exploder::exploder( "bmp_explosion" );
    wait 0.5;
    var_0 notify( "destroyed" );
    var_1 delete();
    common_scripts\_exploder::exploder( "bmp" );
}

_id_B78D()
{
    self endon( "death" );

    for (;;)
    {
        if ( !isalive( self ) )
            break;

        var_0 = self.health;
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( isdefined( var_2.classname ) && !isplayer( var_2 ) )
        {
            self.health = var_0;
            continue;
        }

        if ( var_5 != "MOD_PROJECTILE" )
            continue;

        if ( var_1 < 800 )
            continue;

        maps\_vehicle::godoff();
        radiusdamage( self.origin, 150, self.health + 500, self.health + 500 );
    }
}

_id_BDC4()
{
    self hide();
    var_0 = getent( self.target, "targetname" );
    var_1 = var_0.angles;
    var_2 = var_0.origin;
    var_0 delete();
    self waittill( "destroyed" );
    wait 0.5;
    self show();
    self.origin = var_2;
    self.angles = var_1;
}

_id_AE37()
{
    var_0 = getentarray( self.target, "targetname" );
    var_1 = maps\_utility::array_spawn( var_0 );
    var_1[0].animname = "hargrove";
    var_1[1].animname = "foley";
    thread maps\_anim::anim_single( var_1, "roadkill_intro_orders" );
    wait 0.05;
    var_2 = undefined;

    foreach ( var_2 in var_1 )
    {
        var_4 = var_2 maps\_utility::getanim( "roadkill_intro_orders" );
        var_2 setanim( var_4, 1, 0, 0 );
        var_2 setanimtime( var_4, 0.25 );
    }

    common_scripts\utility::flag_wait( "player_climbs_stairs" );

    foreach ( var_2 in var_1 )
    {
        var_4 = var_2 maps\_utility::getanim( "roadkill_intro_orders" );
        var_2 setanim( var_4, 1, 0, 1 );
    }

    for (;;)
    {
        var_4 = var_2 maps\_utility::getanim( "roadkill_intro_orders" );

        if ( var_2 getanimtime( var_4 ) >= 0.78 )
            break;

        wait 0.05;
    }

    foreach ( var_2 in var_1 )
        var_2 maps\_utility::anim_stopanimscripted();
}

_id_A9A0()
{
    if ( isdefined( self.script_drone ) )
        return;

    if ( isdefined( self.script_godmode ) )
        return;

    if ( !isdefined( self.magic_bullet_shield ) )
        thread maps\_utility::magic_bullet_shield();

    self.attackeraccuracy = 0;
    self.ignorerandombulletdamage = 1;
}

_id_ADC8()
{
    common_scripts\utility::flag_wait( "100ton_bomb_goes_off" );
    wait 1;
    radiusdamage( self.origin, 128, 5000, 5000 );
}

_id_B548()
{
    var_0 = getentarray( "bridge_target", "targetname" );
    var_1 = _id_AC2E( var_0, 1 );
    common_scripts\utility::flag_wait( "leaving_riverbank" );
    common_scripts\utility::flag_wait( "bridgelayer_crosses" );

    foreach ( var_3 in level._id_B359 )
        var_3 thread _id_CE8E();

    var_5 = getent( "player_stair_blocker", "targetname" );
    var_5 delete();
    common_scripts\utility::flag_clear( "player_climbs_stairs" );
}

_id_B7E4( var_0 )
{
    self endon( "death" );
    self waittill( "reached_end_node" );
    self endon( "death" );
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1.origin = var_0[0].origin;
    self setturrettargetent( var_1 );
    self.target_ent = var_1;
    _id_D4AD( var_0 );
}

_id_BEDB()
{
    thread maps\_utility::magic_bullet_shield();
}

_id_AA3A()
{
    level.foley = self;
    maps\_utility::make_hero();
}

_id_C63F()
{
    level._id_ACC0 = self;
    maps\_utility::make_hero();
}

_id_B2D4( var_0 )
{
    level._id_D3A2 maps\_utility::function_stack( ::_id_B2BD, var_0 );
}

_id_B2BD( var_0 )
{
    if ( !common_scripts\utility::flag( "player_gets_in" ) )
    {
        level.foley maps\_utility::generic_dialogue_queue( var_0 );
        return;
    }

    if ( !common_scripts\utility::flag( "player_enters_ambush_house" ) )
    {
        if ( isdefined( level._id_CE62["lead"] ) && !common_scripts\utility::flag( "player_is_dismounted" ) )
            level._id_CE62["lead"] maps\_utility::generic_dialogue_queue( var_0 );
        else if ( isalive( level.foley ) )
            level.foley maps\_utility::generic_dialogue_queue( var_0 );
        else
            level.player maps\_utility::generic_dialogue_queue( var_0 );

        return;
    }

    level.foley maps\_utility::generic_dialogue_queue( var_0 );
}

_id_A873( var_0 )
{
    level._id_D3A2 maps\_utility::function_stack( ::_id_C311, var_0 );
}

_id_C311( var_0 )
{
    _id_C401( var_0, ( -100.0, 100.0, -80.0 ) );
}

_id_C405( var_0 )
{
    level._id_D3A2 maps\_utility::function_stack( ::_id_BE47, var_0 );
}

_id_BE47( var_0 )
{
    _id_C401( var_0, ( -100.0, 0.0, -80.0 ) );
}

_id_C401( var_0, var_1 )
{
    var_2 = level._id_CE62["player"].angles;
    var_3 = ( 0, var_2[1], 0 );
    var_4 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_4 linkto( level._id_CE62["player"], "tag_body", var_1, ( 0.0, 0.0, 0.0 ) );
    var_4 maps\_utility::play_sound_on_entity( var_0 );
    var_4 delete();
}

_id_C24A( var_0 )
{
    level._id_D3A2 maps\_utility::function_stack( ::_id_BD99, var_0 );
}

_id_BD99( var_0 )
{
    if ( !common_scripts\utility::flag( "player_gets_in" ) )
    {
        if ( isalive( level._id_ACC0 ) )
            level._id_ACC0 maps\_utility::generic_dialogue_queue( var_0 );
        else
            _id_CFBE( var_0, "ar3" );

        return;
    }

    if ( !common_scripts\utility::flag( "player_enters_ambush_house" ) )
    {
        if ( isdefined( level._id_CE62["player"] ) && !common_scripts\utility::flag( "player_is_dismounted" ) )
            level._id_CE62["player"] maps\_utility::generic_dialogue_queue( var_0 );
        else if ( isalive( level._id_ACC0 ) )
            level._id_ACC0 maps\_utility::generic_dialogue_queue( var_0 );
        else
            level.player maps\_utility::generic_dialogue_queue( var_0 );

        return;
    }

    level._id_ACC0 maps\_utility::generic_dialogue_queue( var_0 );
}

_id_B27C( var_0 )
{
    level._id_D3A2 maps\_utility::function_stack( ::_id_C78B, var_0 );
}

_id_C78B( var_0 )
{
    if ( isalive( level._id_B416 ) )
        level._id_B416 maps\_utility::generic_dialogue_queue( var_0 );
    else
    {
        if ( !isdefined( level.scr_radio[var_0] ) )
            level.scr_radio[var_0] = level.scr_sound["generic"][var_0];

        maps\_utility::radio_dialogue( var_0 );
    }
}

_id_AE0A()
{
    for (;;)
    {
        var_0 = getaiarray( "axis" );
        var_1 = common_scripts\utility::getclosest( level.player.origin, var_0, 600 );

        if ( !isalive( var_1 ) )
            break;

        wait 0.2;
    }

    wait 0.75;
}

_id_CE82()
{
    var_0 = [];
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
        var_0[var_3.export] = 1;

    foreach ( var_6 in level._id_BB8E )
    {
        if ( !isdefined( var_0[var_6.export] ) )
        {
            var_6.count = 1;
            var_6 maps\_utility::spawn_ai();
        }
    }
}

_id_BE3C( var_0 )
{
    level._id_D3A2 maps\_utility::function_stack( maps\_utility::radio_dialogue, var_0 );
}

_id_B59A()
{
    level._id_B27E = self;
    self endon( "death" );
    thread maps\_utility::magic_bullet_shield();

    if ( !getdvarint( "use_old_rangers_before_finale" ) )
        return;

    var_0 = getnode( self.target, "targetname" );
    var_0 thread maps\_anim::anim_generic( self, "exposed_reload" );
    wait 0.05;
    var_1 = maps\_utility::getgenericanim( "exposed_reload" );
    self setanim( var_1, 1, 0, 0 );
    self setanimtime( var_1, 0.3 );
    common_scripts\utility::flag_wait( "player_rounds_end_corner" );
    self setanim( var_1, 1, 0, 1 );
    self.a.pose = "crouch";

    for (;;)
    {
        if ( self getanimtime( var_1 ) > 0.9 )
            break;

        wait 0.05;
    }

    self.a.pose = "stand";
    self notify( "killanimscript" );
    var_0 = getnode( "outside_node", "targetname" );
    self setgoalnode( var_0 );
    maps\_utility::disable_cqbwalk();
}

_id_B4DB()
{
    self.flashbangimmunity = 1;
    self.ignoreall = 1;
    self.ignoreme = 1;
    self endon( "death" );
    maps\_utility::disable_pain();
    self.health = 10000;
    maps\_utility::forceuseweapon( "glock", "primary" );
    maps\_utility::add_damage_function( ::_id_C859 );
    thread _id_BFD8();
    var_0 = common_scripts\utility::getstruct( "backwards_struct", "targetname" );
    var_0 thread maps\_anim::anim_generic_custom_animmode( self, "gravity", "pistol_walk_back" );
    maps\_utility::set_generic_deathanim( "pistol_death" );
    common_scripts\utility::waittill_notify_or_timeout( "damage", 1.5 );
    thread _id_CC23();
    wait 0.15;
    thread maps\_anim::anim_generic_custom_animmode( self, "gravity", "pistol_death" );
    var_1 = maps\_utility::getgenericanim( "pistol_death" );
    var_2 = getanimlength( var_1 );
    maps\_utility::delaythread( 0.5, animscripts\shared::dropaiweapon );
    thread maps\_utility::play_sound_on_entity( "generic_death_kbp_enemy_4" );
    wait 0.9;
    self.a.nodeath = 1;
    _id_B190::_id_D55F( self );
    self kill();
}

_id_BFD8()
{
    self endon( "death" );
    self.baseaccuracy = 0;
    wait 0.4;
    self shoot();
    wait 0.8;
    self shoot();
    wait 0.2;
    self shoot();
    wait 0.45;
    self shoot();
    wait 2;
    self shoot();
}

_id_C859( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = var_2 + ( 0.0, 180.0, 0.0 );
    var_8 = anglestoforward( var_7 );
    var_9 = anglestoup( var_7 );
    var_10 = common_scripts\utility::getfx( "headshot" );
    playfx( var_10, var_3, var_8, var_9 );
}

_id_CC23()
{
    var_0 = common_scripts\utility::getstruct( "pistol_bullet_spawner", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = var_0.origin - var_1.origin;
    var_3 = [];
    var_3[0] = 0.1;
    var_3[1] = 0.1;
    var_3[2] = 0.1;
    var_3[3] = 0.2;
    var_3[4] = 0.1;
    var_3[5] = 0.1;
    var_3[6] = 0.1;
    var_3[7] = 0.25;
    var_4 = 12;

    for ( var_5 = 0; var_5 < var_4; var_5++ )
    {
        var_6 = var_1.origin + common_scripts\utility::randomvector( 40 );
        magicbullet( "m4m203_eotech", var_0.origin, var_6 );

        if ( isdefined( var_3[var_5] ) )
        {
            wait(var_3[var_5]);
            continue;
        }

        wait 0.1;
    }
}

_id_AE71()
{
    _id_D4C8();
    common_scripts\utility::flag_set( "retreaters_run" );
    level.player.threatbias = 5000;
    wait 2;
    level.player.threatbias = 150;
}

_id_D4C8()
{
    if ( common_scripts\utility::flag( "roadkill_school_9" ) )
        return;

    level endon( "roadkill_school_9" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_forces_enemy_to_flee" );
    maps\_utility::add_wait( ::_id_B812 );
    maps\_utility::do_wait();
}

_id_B812()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( var_0 == level.player )
            break;
    }
}

_id_CC5F()
{
    self endon( "death" );
    self.neverenablecqb = 1;
    common_scripts\utility::flag_wait( "retreaters_run" );
    self setlookatentity( level.player );
    var_0 = randomfloatrange( 0.3, 0.9 );
    wait(var_0);
    common_scripts\utility::delaycall( 3, ::setlookatentity );
    var_1 = common_scripts\utility::getstruct( "school_flee_struct", "targetname" );
    maps\_spawner::go_to_node( var_1, "struct" );
}

_id_CDC0()
{
    maps\_utility::disable_cqbwalk();
    self.neverenablecqb = 1;

    if ( !common_scripts\utility::flag( "detour_convoy_slows_down" ) )
    {
        self endon( "death" );
        self.ignoreall = 1;
        self.ignoreme = 1;
        common_scripts\utility::flag_wait( "detour_convoy_slows_down" );
        self.ignoreall = 0;
        self.ignoreme = 0;
        return;
    }

    self.attackeraccuracy = 0.2;
    level._id_AE2F[level._id_AE2F.size] = self;
    self waittill( "death" );
    level notify( "school_spawner_death" );
}

_id_C2E1()
{
    level waittill( "school_spawner_death" );
    var_0 = level._id_AE2F;
    var_0 = maps\_utility::array_removedead( var_0 );
    var_1 = getnode( "class_flee_node", "targetname" );
    var_2 = common_scripts\utility::getclosest( var_1.origin, var_0 );

    if ( isalive( var_2 ) )
    {
        var_2.combatmode = "cover";
        var_2 endon( "death" );
        var_2 setgoalnode( var_1 );
        var_2.goalradius = 64;
        var_2 waittill( "goal" );
        var_2.goalradius = 2000;
    }
}

_id_A816()
{
    self endon( "death" );
    self.attackeraccuracy = 0;
    self.ignorerandombulletdamage = 1;
    var_0 = self.pathenemyfightdist;
    var_1 = self.pathenemylookahead;
    self.pathenemyfightdist = 0;
    self.pathenemylookahead = 0;
    self.maxfaceenemydist = 32;
    maps\_utility::enable_sprint();
    maps\_utility::disable_cqbwalk();
    self.neverenablecqb = 1;
    self waittill( "goal" );
    wait 1.5;
    self.neverenablecqb = 0;
    maps\_utility::enable_cqbwalk();
    self.attackeraccuracy = 1;
    self.ignorerandombulletdamage = 0;
    self.pathenemyfightdist = var_0;
    self.pathenemylookahead = var_1;
}

_id_C227()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( maps\_utility::first_touch( var_0 ) )
            var_0 maps\_utility::delaythread( 1.4, maps\_utility::disable_heat_behavior );
    }
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

        var_7 = common_scripts\utility::getstruct( self.target, "targetname" );
        radiusdamage( var_7.origin, 30, 5000, 5000 );
    }

    self delete();
}

_id_ABCD()
{
    self.neverenablecqb = 1;
    level._id_C815++;

    if ( level._id_C815 == 1 )
        maps\_utility::play_sound_on_entity( "AB_2_order_action_suppress" );
    else if ( level._id_C815 == 2 )
    {
        wait 0.15;
        maps\_utility::play_sound_on_entity( "AB_3_order_action_coverme" );
    }
}

_id_D20C()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( var_0 == level.foley )
            break;
    }

    thread _id_B2D4( "roadkill_fly_sawone" );

    if ( common_scripts\utility::flag( "roadkill_near_crossroads" ) )
    {
        maps\_utility::add_wait( common_scripts\utility::flag, "school_back_baddies_dead" );
        maps\_utility::add_wait( common_scripts\utility::flag, "roadkill_school_12" );
        maps\_utility::do_wait_any();

        if ( common_scripts\utility::flag( "roadkill_school_12" ) )
        {
            common_scripts\utility::flag_set( "roadkill_school_11" );
            return;
        }
    }

    var_1 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 maps\_anim::anim_generic_reach( var_0, "cqb_wave" );

    if ( isalive( var_0 ) )
        var_1 thread maps\_anim::anim_generic( var_0, "cqb_wave" );

    wait 0.9;
    var_0 maps\_utility::enable_ai_color();
    common_scripts\utility::flag_set( "roadkill_school_11" );
}

_id_BFD1()
{
    common_scripts\utility::flag_wait( "staircase_grenade" );
    var_0 = maps\_utility::getentwithflag( "staircase_grenade" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_3 = var_2.origin - var_1.origin;
    var_4 = vectortoangles( var_3 );
    var_5 = anglestoforward( var_4 );
    var_6 = var_5 * 450;
    magicgrenademanual( "fraggrenade", var_1.origin, var_6, 5 );
}

_id_D21C()
{
    if ( !isdefined( self.hand_tag ) )
        self.hand_tag = "tag_inhand";

    self detach( level.scr_model[self.animname], self.hand_tag );
}

_id_CBA8()
{
    level._id_B359[level._id_B359.size] = self;
    _id_CF91();
    self endon( "death" );
    var_0 = spawn( "script_origin", ( -2356.06, -4159.92, -60.541 ) );
    var_1 = common_scripts\utility::getstruct( self.script_linkto, "script_linkname" );
    self.animname = var_1.targetname;
    self._id_AAE2 = 1;

    if ( isdefined( level.scr_model[self.animname] ) )
    {
        if ( issubstr( self.animname, "1" ) )
            self.hand_tag = "tag_weapon_left";
        else
            self.hand_tag = "tag_inhand";

        self attach( level.scr_model[self.animname], self.hand_tag );
    }

    var_0 thread maps\_anim::anim_loop_solo( self, "sit_around" );
    common_scripts\utility::flag_wait( "time_to_go_stair_guys" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::anim_single_solo( self, "time_to_go" );
}

_id_AF89()
{
    if ( !getdvarint( "use_old_stairblock_anims" ) )
    {
        common_scripts\utility::flag_set( "time_to_go_stair_guys" );
        wait 3;
    }

    common_scripts\utility::flag_set( "time_to_go" );
}

_id_BE4B()
{
    if ( !getdvarint( "use_old_stairblock_anims" ) )
    {
        thread _id_CBA8();
        return;
    }

    level._id_B359[level._id_B359.size] = self;
    _id_CF91();
    self endon( "death" );
    var_0 = common_scripts\utility::getstruct( self.script_linkto, "script_linkname" );
    self.animname = var_0.targetname;
    maps\_utility::gun_remove();
    self._id_AAE2 = 1;

    if ( isdefined( level.scr_model[self.animname] ) )
    {
        self attach( level.scr_model[self.animname], "tag_inhand" );
        self._id_BD68 = ::_id_D21C;
    }

    var_0 thread maps\_anim::anim_loop_solo( self, "sit_around" );
    common_scripts\utility::flag_wait( "time_to_go" );
    maps\_utility::gun_recall();
    var_0 notify( "stop_loop" );
}

_id_BF4C()
{
    var_0 = common_scripts\utility::getstruct( self.script_linkto, "script_linkname" );
    self.animname = "generic";
    var_1 = ( 0.0, 0.0, 100.0 );
    var_0.origin -= var_1;
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0.origin;
    var_2.angles = var_0.angles;
    self linkto( var_2, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_2 moveto( var_2.origin + var_1, 1, 0.5, 0.5 );
    var_0 maps\_anim::anim_generic( self, "rooftop_turn" );
    var_2 delete();
    self delete();
}

_id_D23A()
{

}

_id_BD2B()
{
    self endon( "death" );
    var_0 = level.destructible_type[self.destructibleinfo].parts[0][0].v;
    var_1 = var_0["animation"][0]["anim"];

    for (;;)
    {
        var_2 = randomfloatrange( 0.01, 0.04 );
        self setanim( var_1, 1, 0, var_2 );
        var_3 = randomfloatrange( 1.0, 2.5 );
        wait(var_3);
        var_2 = randomfloatrange( 0.01, 0.15 );
        self setanim( var_1, 1, 0, var_2 );
        var_3 = randomfloatrange( 1.0, 3 );
        wait(var_3);
        var_2 = randomfloatrange( 0.05, 0.2 );
        self setanim( var_1, 1, 0, var_2 );
        var_3 = randomfloatrange( 1.0, 3 );
        wait(var_3);
    }
}

_id_C86B()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( !maps\_utility::first_touch( var_0 ) )
            continue;

        if ( !isdefined( var_0._id_B395 ) )
            continue;

        var_0 thread _id_D58A();
    }
}

_id_D58A()
{
    self endon( "death" );
    var_0 = undefined;
    level._id_D0BE = common_scripts\utility::array_randomize( level._id_D0BE );

    foreach ( var_2 in level._id_D0BE )
    {
        var_3 = 0;

        foreach ( var_5 in var_2.usedpositions )
        {
            if ( !var_5 )
                var_3++;
        }

        if ( var_3 )
        {
            var_0 = var_2;
            break;
        }
    }

    if ( !isdefined( var_0 ) )
        return;

    thread maps\_utility::guy_runtovehicle_load( self, var_0 );
}

_id_B511()
{
    self._id_B395 = 1;
    self.fixednode = 0;
    var_0 = getnode( "friendly_exit_node", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 64;
}

_id_C6C0()
{
    level._id_B416 = self;
    thread precognitive_paranoia_watch_damage();
    thread precognitive_paranoia_watch_death();
    thread _id_B039();
    self.animname = "shepherd";
    self.disablearrivals = 1;
    self.disableexits = 1;
    maps\_utility::gun_remove();
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = ( -9429.55, 13924.5, 510.582 );
    var_0.angles = ( 0.0, -101.196, 0.0 );
    objective_onentity( maps\_utility::obj( "exfil" ), self );
    objective_setpointertextoverride( maps\_utility::obj( "exfil" ), &"ROADKILL_OBJ_REACH" );
    var_0 maps\_anim::anim_single_solo( self, "ending" );

    if ( isalive( self ) )
    {
        if ( !common_scripts\utility::flag( "start_shepherd_end" ) )
        {
            var_0 thread maps\_anim::anim_loop_solo( self, "ending_idle", "stop_anim" );
            common_scripts\utility::flag_wait( "start_shepherd_end" );
            var_0 notify( "stop_anim" );
        }

        if ( isalive( self ) )
        {
            thread _id_C2ED();
            _id_B3AB::_id_BEBA( "upperbody", level.player, 200, 90, 90, 30, 45, 0, 1, 10, 0 );
            var_0 thread maps\_anim::anim_single_solo( self, "ending_end" );
            thread _id_A929();
        }
    }
}

_id_B039()
{
    self endon( "death" );
    level.player endon( "death" );

    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) < 200 )
            break;

        wait 0.05;
    }

    for (;;)
    {
        var_0 = self geteye();

        if ( level.player worldpointinreticle_circle( var_0, 65, 75 ) )
            break;

        wait 0.05;
    }

    level.player disableweapons();
}

_id_C2ED()
{
    wait 5;
    objective_state( maps\_utility::obj( "exfil" ), "done" );
    wait 4.8;
    wait 0.4;
    wait 0.3;
}

_id_C6C3()
{
    self.animname = "generic";
    var_0 = undefined;
    maps\_utility::set_generic_run_anim( "walk" );

    if ( self.export == 293 )
    {
        var_0 = "ending1";
        maps\_utility::forceuseweapon( "scar_h_reflex", "primary" );
    }
    else if ( self.export == 294 )
    {
        var_0 = "ending2";
        maps\_utility::forceuseweapon( "m4_grunt", "primary" );
    }
    else if ( self.export == 295 )
    {
        var_0 = "ending3";
        maps\_utility::forceuseweapon( "m240", "primary" );
    }
    else
        return;

    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = ( -9429.55, 13924.5, 510.582 );
    var_1.angles = ( 0.0, -101.196, 0.0 );
    var_1 maps\_anim::anim_single_solo( self, var_0 );

    if ( !common_scripts\utility::flag( "start_shepherd_end" ) )
    {
        var_1 thread maps\_anim::anim_loop_solo( self, var_0 + "_idle", "stop_anim" );
        common_scripts\utility::flag_wait( "start_shepherd_end" );
        var_1 notify( "stop_anim" );
    }

    var_1 maps\_anim::anim_single_solo( self, var_0 + "_end" );
}

ending_wounded_spawner()
{
    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "3" )
    {
        self attach( "h2_com_clipboard_wpaper_anim", "TAG_INHAND", 1 );
        self attach( "h2_characters_accessories_pencil", "TAG_WEAPON_RIGHT", 1 );
    }

    maps\_utility::gun_remove();
    self.animname = "generic";
    var_0 = "wounded_" + self.script_noteworthy;
    maps\_anim::anim_loop_solo( self, var_0 );
}

_id_A8FB()
{

}

_id_CEAD()
{
    self endon( "death" );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self waittill( "goal" );
    wait 0.5;
    self waittill( "goal" );
    self delete();
}

_id_C5C5()
{
    if ( !isdefined( self.function_stack ) )
        return;

    while ( self.function_stack.size > 0 )
        wait 0.05;
}

_id_C4D2( var_0 )
{
    level endon( "dunn_no_commento" );
    wait(var_0 + 0.1);
    level._id_D3A2 _id_C5C5();

    if ( !common_scripts\utility::flag( "jumper_died" ) )
        return;

    _id_C24A( "roadkill_cpd_handledit" );
}

_id_D54D()
{
    if ( common_scripts\utility::flag( "ride_looking_forward" ) )
        return;

    level endon( "ride_looking_forward" );
    wait 3;
    _id_B2D4( "roadkill_fly_eyesforward" );
}

_id_D1C2()
{
    var_0 = self.mgturret[0];

    for (;;)
    {
        var_1 = var_0 getturretowner();

        if ( isalive( var_1 ) )
        {
            if ( !isdefined( var_1.magic_bullet_shield ) )
                var_1 thread maps\_utility::magic_bullet_shield();

            return;
        }

        wait 0.05;
    }
}

_id_C73C()
{
    foreach ( var_1 in self.riders )
    {
        if ( !isalive( var_1 ) )
            continue;

        if ( !issentient( var_1 ) )
            continue;

        if ( isdefined( var_1 getturret() ) )
            return var_1;
    }
}

_id_B6A5()
{
    for (;;)
    {
        var_0 = common_scripts\utility::getstruct( "mortar_school_chain", "targetname" );
        var_0 maps\_utility::delaythread( 1, ::_id_C482 );
        var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
        var_0 maps\_utility::delaythread( 1.3, ::_id_C482 );
        var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
        var_0 maps\_utility::delaythread( 1.6, ::_id_C482 );
        wait 5;
    }
}

_id_C482()
{
    thread common_scripts\utility::play_sound_in_space( "mortar_incoming", self.origin );
    wait 1;
    var_0 = common_scripts\utility::getfx( "mortar_large" );
    playfx( var_0, self.origin );
    radiusdamage( self.origin, 100, 500, 500, level.player );
    thread common_scripts\utility::play_sound_in_space( "mortar_explosion_dirt", self.origin );
    physicsexplosionsphere( self.origin, 100, 100, 2 );
}

_id_A992()
{
    wait 2.5;
    self._id_BC5B += 0.05;
    wait 1;
    self._id_BC5B += 0.05;
    wait 1;
    self._id_BC5B += 0.05;
    wait 1;
    self notify( "done" );
}

_id_BF93()
{
    var_0 = spawnstruct();
    var_0 endon( "done" );
    var_0._id_BC5B = 0;
    var_0 thread _id_A992();
    level endon( "kaboom_to_detour_vehicle" );
    var_1 = common_scripts\utility::getfx( "minigun_burnout" );

    for (;;)
    {
        playfxontag( var_1, self, "j_spin" );
        var_2 = 0;

        if ( var_0._id_BC5B > 0 )
            var_2 += randomfloat( var_0._id_BC5B );

        var_2 += 0.035;
        wait(var_2);
    }
}

_id_CFE2()
{
    if ( common_scripts\utility::flag( "convoy_slows_down_again" ) )
        return;

    level endon( "convoy_slows_down_again" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !maps\_utility::first_touch( var_0 ) )
            continue;

        var_0 vehicle_setspeed( 8.2, 5, 5 );
    }
}

_id_C175()
{
    var_0 = getent( "vehicle_resumespeed_trigger", "targetname" );
    var_0 thread _id_CFE2();
    var_1 = level._id_CE62["player"];
    var_2 = level._id_CE62["detour"];
    var_3 = level._id_CE62["lead"];
    var_4 = level._id_CE62["rear"];
    var_5 = var_2 _id_C73C();
    common_scripts\utility::flag_wait( "shot_rings_out" );
    wait 1.5;
    var_6 = 10.2;
    var_3 common_scripts\utility::delaycall( 0, ::vehicle_setspeed, var_6, 10, 10 );
    var_2 common_scripts\utility::delaycall( 0.45, ::vehicle_setspeed, var_6, 10, 10 );
    var_4 common_scripts\utility::delaycall( 0.8, ::vehicle_setspeed, var_6, 10, 10 );
    var_1 common_scripts\utility::delaycall( 1.2, ::vehicle_setspeed, var_6, 10, 10 );
    common_scripts\utility::flag_wait( "haggerty_rechambers" );
    maps\_utility::delaythread( 1.1, ::_id_C960 );
    var_7 = var_2;
    var_8 = getvehiclenode( "detour_vehicle_path", "targetname" );
    var_7 thread maps\_vehicle::vehicle_paths( var_8 );
    var_7 startpath( var_8 );
    var_8 = getvehiclenode( "player_detour_vehicle_path", "targetname" );
    var_1 thread maps\_vehicle::vehicle_paths( var_8 );
    var_1 startpath( var_8 );
    level notify( "convoy_continues_to_ambush" );
    common_scripts\utility::flag_wait( "detour_convoy_slows_down" );

    if ( getdvarint( "stop_player_vehicle_in_front_of_school" ) == 1 )
        return;

    var_4 common_scripts\utility::delaycall( 2.5, ::vehicle_setspeed, 0, 10, 10 );
    var_3 common_scripts\utility::delaycall( 2.5, ::vehicle_setspeed, 0, 10, 10 );
    var_9 = missile_createattractorent( level._id_CE62["detour"], 25000, 1024 );
    var_10 = 6;
    var_2 vehicle_setspeed( var_10, 10, 10 );
    wait 0.1;
    var_1 vehicle_setspeed( var_10, 10, 10 );
    common_scripts\utility::flag_wait( "gunner_dies" );

    if ( isalive( var_5 ) )
    {
        if ( isdefined( var_5.magic_bullet_shield ) )
            var_5 maps\_utility::stop_magic_bullet_shield();

        var_11 = var_5 geteye();
        magicbullet( "ak47", var_11 + ( 0.0, 0.0, 35.0 ), var_11 + ( 0.0, 0.0, -35.0 ) );
    }

    common_scripts\utility::flag_wait( "rpg_super_ambush" );
    var_12 = getaiarray( "axis" );

    foreach ( var_14 in var_12 )
        var_14.a.rockets = 0;

    var_0 = maps\_utility::getentwithflag( "rpg_ambush" );
    var_16 = getent( var_0.target, "targetname" );
    var_17 = getent( var_16.target, "targetname" );
    var_18 = gettime();
    var_4.veh_brake = 0.1;
    var_4 maps\_utility::delaythread( 1.5, maps\_utility::set_brakes, 1 );
    var_19 = var_2.angles;
    var_20 = anglestoforward( var_19 );
    var_21 = anglestoright( var_19 );
    var_22 = common_scripts\utility::getstruct( "ambush_impact_vector", "targetname" );
    var_23 = common_scripts\utility::getstruct( var_22.target, "targetname" );
    var_24 = vectortoangles( var_23.origin - var_22.origin );
    var_25 = anglestoforward( var_24 );
    var_26 = var_25 * 1;
    var_27 = var_21 * -30 + var_20 * -30 + ( 0.0, 0.0, -10.0 );
    physicsexplosionsphere( var_2.origin + var_27, 48, 32, 3 );
    level notify( "kaboom_to_detour_vehicle" );
    var_28 = common_scripts\utility::getfx( "mortar_large" );
    playfx( var_28, var_2.origin + var_27 );
    var_2 maps\_vehicle::godoff();
    radiusdamage( var_2.origin, 64, 50000, 50000 );
    var_2.veh_brake = 0.15;
    common_scripts\utility::flag_set( "ambush" );
    missile_deleteattractor( var_9 );
    var_29 = missile_createrepulsorent( level.player, 700, 1500 );
    wait 0.7;
    var_1.veh_brake = 0.05;
    var_1.dontunloadonend = 1;
    wait 0.5;
    var_1 _meth_85C0( 1 );
    var_1 vehicle_setspeed( 0 );
    var_1 maps\_utility::delaythread( 0.7, maps\_utility::set_brakes, 1 );
    var_30 = 3.2;
    maps\_utility::delaythread( 2.0 + var_30, ::_id_C006 );
    var_3 common_scripts\utility::delaycall( 5.0, ::resumespeed, 5 );
    wait(1.25 + var_30);
    var_1 _meth_85C0( 0 );
    var_1.veh_transmission = "reverse";
    var_1.veh_pathdir = "reverse";
    var_1 vehicle_setspeed( 16, 5, 5 );
    var_1.veh_brake = 0;
    var_1 startpath();
    var_1 maps\roadkill_aud::_id_AC2A();
    wait 1.8;
    var_1.veh_brake = 1;
    var_1 maps\roadkill_aud::_id_AEF5();
    wait 0.7;
    var_1 vehicle_setspeed( 16, 5, 5 );
    var_1.veh_brake = 0;
    var_1.veh_transmission = "forward";
    var_1.veh_pathdir = "forward";
    var_8 = getvehiclenode( "player_gets_back_on_path", "targetname" );
    var_1 thread maps\_vehicle::vehicle_paths( var_8 );
    var_1 startpath( var_8 );
    var_1 resumespeed( 5 );
    var_4 resumespeed( 5 );
    common_scripts\utility::noself_delaycall( 2, ::missile_deleteattractor, var_29 );
    wait 0.8;
    var_4.veh_brake = 0;
    var_1.dontunloadonend = undefined;
}

_id_C960()
{
    maps\_utility::array_spawn_function_targetname( "window_rpg_hydrant", ::_id_B329 );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "window_rpg_hydrant" );
    var_0 waittill( "death" );
    thread _id_B104();
}

_id_C006()
{
    maps\_utility::array_spawn_function_targetname( "window_rpg_vehicle", ::_id_B329 );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "window_rpg_vehicle" );
    var_0 waittill( "death" );
    var_1 = common_scripts\utility::getstruct( "dyn_explosion_struct", "targetname" );
    level.player maps\_utility::delaythread( 3, maps\_gameskill::grenade_dirt_on_screen, "left" );
    var_1 = common_scripts\utility::getstruct( "dyn_spawner_struct", "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_3 = [];
    var_3[0] = "me_woodcrateclosed";
    var_3[1] = "com_cardboardboxshortclosed_2";
    var_4 = [];
    var_4[0] = ( 0.0, 0.0, 8.0 );
    var_4[1] = ( 0.0, 0.0, 4.5 );
    var_5 = [];
    var_5[0] = 4;
    var_5[1] = 1;
    var_6 = common_scripts\utility::getfx( "rocket_explode" );
    playfx( var_6, var_1.origin );
    thread common_scripts\utility::play_sound_in_space( "rocket_explode_dirt", var_1.origin );
    physicsexplosionsphere( var_1.origin, 320, 280, 4 );
    radiusdamage( var_1.origin, 320, 50, 50 );

    for ( var_7 = 0; var_7 < 14; var_7++ )
    {
        var_8 = var_2.origin + common_scripts\utility::randomvector( 128 );
        var_9 = var_8 - var_1.origin;
        var_10 = vectortoangles( var_9 );
        var_11 = anglestoforward( var_10 );
        var_12 = randomint( var_3.size );
        var_13 = spawn( "script_model", var_1.origin );
        var_13 setmodel( var_3[var_12] );
        var_14 = var_11;
        var_14 *= 18000;
        var_14 *= var_5[var_12];
        var_14 *= randomfloatrange( 0.9, 1.6 );
        var_15 = var_4[var_12] + common_scripts\utility::randomvector( 1.2 );
        var_13 physicslaunchclient( var_13.origin + var_15, var_14 );
    }
}

_id_D470()
{
    var_0 = getent( "rpg_physics", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = getent( "rpg_physics_dest", "targetname" );
    var_3 = getent( var_2.target, "targetname" );
    var_4 = 0.3;
    var_0 moveto( var_2.origin, var_4 );
    var_1 moveto( var_3.origin, var_4 );
    var_5 = gettime();
    var_4 *= 1000;
    var_6 = 6.25;
    var_7 = var_1.origin - var_0.origin;
    var_8 = vectortoangles( var_7 );
    var_9 = anglestoforward( var_8 );
    var_7 = var_9 * var_6;
    var_6 *= 0.35;
    level._id_CE62["detour"] vehphys_launch( var_7, 1.0 );
}

_id_D0F6()
{
    var_0 = getent( "reverse_force", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = var_1.origin - var_0.origin;
    var_3 = vectortoangles( var_2 );
    var_4 = anglestoforward( var_3 );
    var_2 = var_4 * 3.5;
    physicsjolt( var_0.origin, 350, 350, var_2 );
}

_id_B329()
{
    self setmodel( "projectile_rpg7" );
    var_0 = common_scripts\utility::getfx( "rpg_trail" );
    playfxontag( var_0, self, "tag_origin" );
    var_0 = common_scripts\utility::getfx( "rpg_muzzle" );
    playfxontag( var_0, self, "tag_origin" );
    self waittill( "reached_end_node" );
    common_scripts\utility::flag_set( "rpg_end" );
    self delete();
}

_id_C55B()
{
    thread _id_A996();
    thread _id_D50B();
    thread _id_C2C3();

    if ( !getdvarint( "use_old_garage_scene" ) )
        thread _id_B7D8();
    else
        thread _id_B941();

    thread _id_C335();
    thread _id_C21F();
    maps\_utility::array_spawn_function_noteworthy( "flee_if_seen", ::_id_B641 );
    maps\_utility::array_spawn_function_noteworthy( "run_and_delete", ::_id_D15B );
}

_id_D15B()
{
    self.ignoreme = 1;
    self.ignoreall = 1;
    self endon( "death" );

    if ( isdefined( self.script_delay ) )
    {
        self setgoalpos( self.origin );
        self.goalradius = 8;
        maps\_utility::script_delay();
        thread maps\_spawner::go_to_node();
    }

    self waittill( "reached_path_end" );
    self delete();
}

_id_B641()
{
    self.ignoreme = 1;
    self.ignoreall = 1;
    self endon( "death" );
    var_0 = self.origin;
    self waittill( "goal" );
    wait 0.5;
    maps\_utility::add_wait( ::_id_AE92 );
    maps\_utility::add_wait( maps\_utility::_wait, 4 );
    maps\_utility::do_wait_any();
    self setgoalpos( var_0 );
    self.goalradius = 8;
    self waittill( "goal" );
    self delete();
}

_id_AE92()
{
    self endon( "death" );

    for (;;)
    {
        if ( maps\_utility::within_fov_of_players( self.origin, 0.75 ) )
            return;

        wait 0.05;
    }
}

_id_CC4B()
{
    maps\_utility::array_spawn_function_noteworthy( "corner_hider_spawner", ::_id_BC4D );
}

_id_B5BE( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = common_scripts\utility::getfx( "headshot" );
    var_8 = anglestoforward( var_2 );
    var_9 = anglestoup( var_2 );
    playfx( var_7, var_3, var_8, var_9 );
}

_id_BC4D()
{
    self endon( "death" );
    maps\_utility::set_generic_deathanim( "facedown_death" );
    maps\_utility::add_damage_function( ::_id_C859 );
    self.health = 5000;
    var_0 = level._id_CE62["detour"].mgturret[0];
    var_0 setmode( "manual" );
    var_0 settargetentity( self );
    var_0.dontshoot = 1;
    var_1 = var_0 getturretowner();

    if ( isalive( var_1 ) )
        var_1.ignoreall = 1;

    var_2 = getent( "detour_shoots_alley_guy_trigger", "targetname" );

    for (;;)
    {
        var_2 waittill( "trigger", var_3 );

        if ( var_3 == level._id_CE62["detour"] )
            break;

        wait 0.05;
    }

    common_scripts\utility::flag_set( "trapper_spawners_ignoreme" );
    var_0.dontshoot = undefined;
    wait 0.5;
    var_4 = common_scripts\utility::getstruct( "run_death_facedown", "targetname" );
    var_4 thread maps\_anim::anim_generic_gravity( self, "facedown_death" );
    wait 1;
    self.a.nodeath = 1;
    self kill();
}

_id_AF42()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getstruct( "jumper_fx", "targetname" );
    var_1 = common_scripts\utility::getfx( "car_dirt" );
    var_2 = common_scripts\utility::getfx( "car_spark" );
    var_3 = 0;

    for (;;)
    {
        self waittillmatch( "custom_animmode", "fire_spray" );
        var_3++;
        var_4 = common_scripts\utility::getstruct( var_0.script_linkto, "script_linkname" );
        var_5 = vectortoangles( var_4.origin - var_0.origin );
        var_6 = anglestoforward( var_5 );
        var_7 = var_1;
        var_8 = "bullet_large_dirt";

        if ( var_3 > 6 )
        {
            var_7 = var_2;
            var_8 = "bullet_large_metal";
        }
        else
        {

        }

        thread common_scripts\utility::play_sound_in_space( var_8, var_0.origin );
        playfx( var_7, var_0.origin, var_6 );

        if ( !isdefined( var_0.target ) )
            break;

        var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );

        if ( var_3 > 9 )
            level.player dodamage( 20 / level.player.damagemultiplier, self.origin, self, self );
    }

    for (;;)
    {
        level.player dodamage( 20 / level.player.damagemultiplier, self.origin, self, self );
        self waittillmatch( "custom_animmode", "fire_spray" );
    }
}

_id_C21F()
{
    maps\_utility::array_spawn_function_noteworthy( "alley_runner_spawner_first", ::_id_B009 );
    maps\_utility::array_spawn_function_noteworthy( "alley_runner_spawner", ::_id_C7B7 );
}

_id_B009()
{
    self endon( "death" );
    self.ignoreme = 1;
    self.ignoreall = 1;
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = var_0.animation;
    var_0 maps\_anim::anim_generic( self, var_1 );
    self delete();
}

_id_B4D0( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( var_1 != level.player )
        return;

    self startragdoll();
    maps\_utility::remove_damage_function( ::_id_B4D0 );
}

_id_C7B7()
{
    self endon( "death" );
    maps\_utility::add_damage_function( ::_id_B4D0 );
    maps\_utility::disable_pain();
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.disablebulletwhizbyreaction = 1;
    self.ignoresuppression = 1;
    self.ignoreall = 1;
    var_0 = [];
    var_0["unarmed_climb_wall"] = 1.2;
    var_0["unarmed_climb_wall_v2"] = 0;
    var_1 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_2 = var_1.animation;
    var_3 = var_0[var_2];
    wait(var_3);
    var_1 maps\_anim::anim_generic_reach( self, var_2 );
    var_1 maps\_anim::anim_generic( self, var_2 );
    var_4 = getnode( "alley_runner_node", "targetname" );
    self setgoalnode( var_4 );
    self.goalradius = 8;
    self waittill( "goal" );
    self delete();
}

_id_A996()
{
    maps\_utility::array_spawn_function_targetname( "favela_hide_spawner", ::_id_B600 );
    common_scripts\utility::flag_wait( "start_runner" );
    maps\_utility::array_spawn_targetname( "favela_hide_spawner" );
}

_id_B600()
{
    self endon( "death" );
    self.animname = "flee_alley";
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_0 thread maps\_anim::anim_loop_solo( self, "idle" );
    wait 5;
    var_0 notify( "stop_loop" );
    var_0 thread maps\_anim::anim_custom_animmode_solo( self, "gravity", "round_corner" );
    var_1 = maps\_utility::getanim( "round_corner" );

    for (;;)
    {
        if ( self getanimtime( var_1 ) > 0.8 )
            break;

        wait 0.05;
    }

    self setlookatentity( level.player );
    var_0 = common_scripts\utility::getstruct( "hide_house_scene", "targetname" );
    var_0 maps\_anim::anim_first_frame_solo( self, "hands_up" );
    wait 1.5;
    var_0 maps\_anim::anim_single_solo( self, "hands_up" );
    _id_CECF();
}

_id_C335()
{
    common_scripts\utility::flag_wait( "garage_door_scene" );
    wait 10;
    var_0 = getent( "window_wave_loop_spawner", "targetname" );
    var_0.script_drone_override = 1;
}

_id_B6AD()
{
    self endon( "death" );
    self setlookatentity( level.player );
    var_0 = self.origin;
    var_1 = self.script_noteworthy;
    var_2 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_2 thread maps\_anim::anim_generic_loop( self, var_1 );
    wait 13.4;
    var_2 notify( "stop_loop" );
    maps\_utility::anim_stopanimscripted();
    self setgoalpos( var_0 );
    self.goalradius = 5;
    wait 5;
    self delete();
}

_id_D411( var_0 )
{
    self.animname = var_0;
    var_1 = getent( "garage_animation_node", "targetname" );
    var_1 maps\_anim::anim_single_solo( self, "run_garage" );
    _id_CECF();
}

_id_B7D8()
{
    thread h2_garage_pull_struct();
    common_scripts\utility::flag_wait( "garage_door_scene" );
    var_0 = getent( "garage_spawner_left", "script_noteworthy" );
    var_1 = getent( "garage_spawner_right", "script_noteworthy" );
    var_0 maps\_utility::add_spawn_function( ::_id_D411, "civ_garage_runner1" );
    var_1 maps\_utility::add_spawn_function( ::_id_D411, "civ_garage_runner2" );
    var_0 maps\_utility::spawn_ai( 1, 1 );
    var_1 maps\_utility::spawn_ai( 1, 1 );
}

_id_B941()
{
    common_scripts\utility::flag_wait( "garage_door_scene" );
    common_scripts\utility::run_thread_on_targetname( "garage_pull_struct", ::_id_CACB );
    maps\_utility::array_spawn_function_targetname( "garage_spawner", ::_id_C93D );
    var_0 = getent( "garage_spawner_right", "script_noteworthy" );
    var_1 = getent( "garage_spawner_left", "script_noteworthy" );
    var_2 = getent( "garage_spawner", "script_noteworthy" );
    var_0 maps\_utility::delaythread( 0, maps\_utility::spawn_ai );
    var_2 maps\_utility::delaythread( 6.4, maps\_utility::spawn_ai );
    var_1 maps\_utility::delaythread( 3.4, maps\_utility::spawn_ai );
}

_id_C93D()
{
    self endon( "death" );
    var_0 = self.script_noteworthy;
    var_1 = self.origin;
    var_2 = [];
    var_2["garage_spawner_right"] = "garage_door_scene";
    var_2["garage_spawner_left"] = "garage_door_scene_left";
    var_2["garage_spawner"] = "garage_door_scene";
    var_2["garage_window_shouter_spawner"] = self.target;
    self.moveplaybackrate = 1;

    if ( var_0 == "garage_spawner_right" )
        self.force_civilian_hunched_run = 1;
    else if ( var_0 == "garage_spawner_left" )
        self.force_civilian_stand_run = 1;

    if ( isdefined( level.scr_anim["generic"][var_0 + "_run"] ) )
        maps\_utility::set_generic_run_anim( var_0 + "_run", 0 );

    var_3 = var_2[var_0];
    var_4 = common_scripts\utility::getstruct( var_3, "targetname" );
    var_4 maps\_anim::anim_generic_reach( self, var_0 );

    if ( var_0 == "garage_spawner" )
    {
        level._id_BE7F = self;
        maps\_utility::disable_pain();
        thread maps\_utility::magic_bullet_shield();
        maps\_utility::delaythread( 1.75, common_scripts\utility::flag_set, "pull_garage" );
    }

    var_4 maps\_anim::anim_generic( self, var_0 );
    var_5 = [];
    var_5["garage_spawner_right"] = 0;
    var_5["garage_spawner_left"] = 0;
    var_5["garage_window_shouter_spawner"] = 1;
    var_5["garage_spawner"] = 0;

    if ( !var_5[var_0] )
    {
        self setgoalpos( self.origin );
        wait 5;
        _id_CECF();
        return;
    }

    self setgoalpos( var_1 );
    self.goalradius = 4;
    self waittill( "goal" );
    _id_CECF();
}

h2_garage_pull_struct()
{
    level.garagedoor = getent( "h2_garage_door", "targetname" );
    level.garagedoor.animname = "door";
    level.garagedoor maps\_anim::setanimtree();
    var_0 = getent( "garage_animation_node", "targetname" );
    var_0 maps\_anim::anim_first_frame_solo( level.garagedoor, "run_garage" );
    common_scripts\utility::flag_wait( "pull_garage" );
    var_0 maps\_anim::anim_single_solo( level.garagedoor, "run_garage" );
}

_id_CACB()
{
    var_0 = self;
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_2.origin += ( 0.0, 0.0, 10.0 );
    var_3 = [];
    var_4 = var_2;

    for (;;)
    {
        var_5 = getent( var_4.target, "targetname" );
        var_3[var_3.size] = var_5;

        if ( !isdefined( var_5.target ) )
            break;

        var_4 = var_5;
    }

    var_6 = var_1.origin[2] - var_0.origin[2];

    foreach ( var_4 in var_3 )
    {
        var_4.start_origin = var_4.origin;
        var_4.origin += ( 0, 0, var_6 );

        if ( var_4.origin[2] > var_2.origin[2] )
            var_4 common_scripts\utility::hide_notsolid();
    }

    common_scripts\utility::flag_wait( "pull_garage" );
    thread common_scripts\utility::play_sound_in_space( "scn_roadkill_garage_close", var_3[0].origin );
    level maps\_utility::delaythread( 0.95, maps\_utility::send_notify, "stop_pulling" );
    var_9 = [];
    var_9[var_9.size] = ( 0.0, 0.0, 420.637 );
    var_9[var_9.size] = ( 0.0, 0.0, 420.62 );
    var_9[var_9.size] = ( 0.0, 0.0, 419.686 );
    var_9[var_9.size] = ( 0.0, 0.0, 418.499 );
    var_9[var_9.size] = ( 0.0, 0.0, 415.63 );
    var_9[var_9.size] = ( 0.0, 0.0, 413.791 );
    var_9[var_9.size] = ( 0.0, 0.0, 412.708 );
    var_9[var_9.size] = ( 0.0, 0.0, 411.595 );
    var_9[var_9.size] = ( 0.0, 0.0, 411.204 );
    var_9[var_9.size] = ( 0.0, 0.0, 410.838 );
    var_9[var_9.size] = ( 0.0, 0.0, 411.314 );
    var_9[var_9.size] = ( 0.0, 0.0, 411.756 );
    var_9[var_9.size] = ( 0.0, 0.0, 412.38 );
    var_9[var_9.size] = ( 0.0, 0.0, 412.633 );
    var_9[var_9.size] = ( 0.0, 0.0, 409.838 );
    var_9[var_9.size] = ( 0.0, 0.0, 401.405 );
    var_9[var_9.size] = ( 0.0, 0.0, 388.418 );
    thread _id_B356( var_3, var_0, var_9 );

    for (;;)
    {
        if ( !var_3.size )
            break;

        foreach ( var_11, var_4 in var_3 )
        {
            if ( var_4.origin[2] < var_2.origin[2] )
            {
                var_4 common_scripts\utility::show_solid();
                var_3[var_11] = undefined;
            }
        }

        wait 0.05;
    }
}

_id_B356( var_0, var_1, var_2 )
{
    level endon( "stop_pulling" );
    var_3 = 0;

    for (;;)
    {
        var_4 = var_2[var_3];
        var_3++;
        var_5 = var_4[2] - var_1.origin[2];

        foreach ( var_7 in var_0 )
            var_7 moveto( var_7.start_origin + ( 0, 0, var_5 ), 0.1, 0, 0 );

        if ( var_3 >= var_2.size )
            break;

        wait 0.05;
    }

    foreach ( var_7 in var_0 )
        var_7 moveto( var_7.start_origin, 0.2, 0.1, 0.1 );
}

_id_CA58()
{
    common_scripts\utility::flag_wait( "start_runner" );
    var_0 = common_scripts\utility::getstruct( "street_runner_scene", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = var_1 maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_2 ) )
        return;

    var_2.animname = "street_runner";
    var_3 = var_2 maps\_utility::getanim( "scene" );
    var_0 thread maps\_anim::anim_custom_animmode_solo( var_2, "gravity", "scene" );
    wait 0.05;
    var_2 setanimtime( var_3, 0.18 );
    var_2 endon( "death" );
    var_2.allowpain = 1;
    var_2.allowdeath = 1;
    var_2 maps\_utility::add_damage_function( ::_id_A84B );

    for (;;)
    {
        if ( var_2 getanimtime( var_3 ) > 0.95 )
            break;

        wait 0.05;
    }

    var_4 = getnode( var_2.target, "targetname" );
    var_2 setgoalnode( var_4 );
    var_2.goalradius = 8;
    var_2 waittill( "goal" );
    var_2 delete();
}

_id_D50B()
{
    common_scripts\utility::flag_wait( "start_runner" );
    wait 4;
    var_0 = common_scripts\utility::getstruct( "roof_backup_scene", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = var_1 maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_2 ) )
        return;

    var_2.animname = "roof_backup";
    var_3 = var_2 maps\_utility::getanim( "scene" );
    var_0 thread maps\_anim::anim_single_solo( var_2, "scene" );
    wait 0.05;
    var_2 setanimtime( var_3, 0.2 );
    var_2 endon( "death" );
    var_2.allowpain = 1;
    var_2.allowdeath = 1;

    for (;;)
    {
        if ( var_2 getanimtime( var_3 ) > 0.59 )
            break;

        wait 0.05;
    }

    var_2 delete();
}

_id_C2C3()
{
    common_scripts\utility::flag_wait( "start_balcony" );
    var_0 = getent( "civ_run_door", "targetname" );
    var_1 = getent( "civ_run_door_model", "targetname" );
    var_1 linkto( var_0 );
    var_2 = getent( "civ_door_trigger", "targetname" );
    var_3 = getent( "civ_balcony_spawner", "targetname" );
    var_4 = common_scripts\utility::getstruct( "civ_balcony_physics", "targetname" );
    var_0 connectpaths();
    var_0 rotateyaw( -90, 1, 0.5, 0.5 );
    var_5 = var_3 maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_5 ) )
        return;

    var_6 = getnode( var_5.target, "targetname" );
    var_7 = var_5.origin;
    var_5 endon( "death" );
    var_5 waittill( "goal" );
    var_5.goalradius = 8;
    wait 0.35;
    var_8 = anglestoforward( var_4.angles );
    var_9 = var_8 * 0.15;
    physicsjolt( var_4.origin, 32, 32, var_9 );
    wait 1.8;
    var_5 setgoalpos( var_7 );
    var_2 waittill( "trigger" );
    var_0 rotateyaw( 90, 1, 0.5, 0.5 );
    wait 0.4;
    common_scripts\utility::play_sound_in_space( "scn_doorpeek_door_slam", var_0.origin );
}

_id_C03C()
{
    var_0 = 10;
    var_1 = var_0 * 20;
    var_2 = 0;
    var_3 = common_scripts\utility::getstructarray( "grenade_dismount_spawner", "targetname" );
    var_3 = common_scripts\utility::array_randomize( var_3 );
    var_4 = 0;
    var_5 = [];
    var_5[0] = 3.2;
    var_5[1] = 1.8;
    var_5[2] = 0.5;
    var_5[3] = 3.7;
    var_5[4] = 1.3;
    var_6 = 0;

    for (;;)
    {
        if ( common_scripts\utility::flag( "player_inside_ambush_house" ) )
        {
            if ( var_2 > var_1 - 35 )
                var_2 = var_1 - 35;
        }
        else
            var_2++;

        if ( var_2 >= var_1 )
        {
            var_7 = common_scripts\utility::random( var_3 );
            var_7 _id_D27F();
            var_4++;
            var_4 %= var_3.size;
            wait(var_5[var_6]);
            var_6++;
            var_6 %= var_5.size;
        }

        wait 0.05;
    }
}

_id_AE7B()
{
    self endon( "death" );
    self setthreatbiasgroup( "axis_dismount_attackers" );
    self._id_D130 = 1;
    var_0 = self.baseaccuracy;
    self.baseaccuracy = 0;
    common_scripts\utility::flag_wait( "player_is_dismounted" );
    wait 1.5;
    self.baseaccuracy = var_0;
}

_id_D27F()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = randomfloatrange( 3, 5 );
    magicgrenade( "fraggrenade", self.origin, var_0.origin, var_1 );
}

_id_AF5E()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "player_inside_ambush_house" );
        setignoremegroup( "axis_dismount_attackers", "ally_with_player" );
        setignoremegroup( "ally_with_player", "axis_dismount_attackers" );
        common_scripts\utility::flag_waitopen( "player_inside_ambush_house" );
        setthreatbias( "axis_dismount_attackers", "ally_with_player", 0 );
        setthreatbias( "ally_with_player", "axis_dismount_attackers", 0 );
    }
}

_id_C9C4()
{
    common_scripts\utility::flag_wait( "player_exposes_on_street" );
    level.player setthreatbiasgroup( "allies" );
    thread _id_B729();

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_exposes_on_street" );
        maps\_utility::set_player_attacker_accuracy( 1000 );
        level.player.noplayerinvul = 1;
        level.player.threatbias = 50000;
        level.player enablehealthshield( 0 );
        common_scripts\utility::flag_waitopen( "player_exposes_on_street" );
        maps\_gameskill::updatealldifficulty();
        level.player.noplayerinvul = undefined;
        level.player.threatbias = 150;
        level.player enablehealthshield( 1 );
    }
}

_id_B729()
{
    common_scripts\utility::flag_clear( "player_dies_on_street" );
    common_scripts\utility::flag_wait( "player_dies_on_street" );
    thread maps\roadkill_aud::plr_oob_gunfire_aud();

    for (;;)
    {
        var_0 = getaiarray( "axis" );
        var_1 = common_scripts\utility::random( var_0 );
        var_2 = ( 0.0, 0.0, 0.0 );
        var_3 = level.player;

        if ( isalive( var_1 ) )
        {
            var_2 = var_1 geteye();
            var_3 = var_1;
        }

        level.player thread maps\_utility::play_sound_on_entity( "scn_oob_bullet_hit_plr" );
        level.player dodamage( 25, var_2 );
        var_4 = randomfloatrange( 0.1, 0.3 );
        wait(var_4);
    }
}

_id_BAD5()
{
    switch ( level.start_point )
    {
        case "ambush":
        case "default":
        case "intro":
        case "riverbank":
        case "move_out":
        case "convoy":
        case "ride":
            return;
    }

    var_0 = getentarray( "ride_vehicle_spawner", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.script_index == 3 )
            var_2 delete();
    }
}

_id_C107()
{
    level.player endon( "death" );
    var_0 = 4;
    var_1 = var_0 * 20;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        level.player.health = level.player.maxhealth;
        wait 0.05;
    }
}

_id_A8E7()
{
    var_0 = getent( "shepherd_roamer_spawner", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_BEB7 );
    var_0 maps\_utility::spawn_ai();
}

_id_BEB7()
{
    thread _id_B5F9( self.target );
}

_id_D5CD()
{
    var_0 = gettime();
    maps\_utility::wait_for_buffer_time_to_pass( var_0, 7.0 );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = ( 65.0, 0.0, 0.0 );
    var_1 thread _id_AA0E();
    var_2 = 0.5;
    maps\_utility::wait_for_buffer_time_to_pass( var_0, 9.4 );
    wait(var_2);
    var_1 delete();
}

_id_AA0E()
{
    self endon( "death" );

    for (;;)
    {
        setsaveddvar( "cg_fov", self.origin[0] );
        wait 0.05;
    }
}

_id_B5F9( var_0 )
{
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    self endon( "death" );
    self.animname = "shepherd";
    self.ignoreall = 1;
    self.disablearrivals = 1;
    self.disableexits = 1;
    self.grenadeawareness = 0;
    maps\_utility::disable_bulletwhizbyreaction();
    maps\_utility::set_run_anim( "angry_walk" );
    maps\_utility::gun_remove();
    var_1 = getent( "shepherd_lookat_target", "targetname" );
    var_2 = maps\_utility::spawn_anim_model( "player_worldbody" );
    var_2 dontcastshadows();
    self attach( "weapon_colt_anaconda_animated", "tag_weapon_right" );
    var_3 = [];
    var_3["shepherd"] = self;
    var_3["player_rig"] = var_2;
    var_4 = "player_shep_intro";
    var_5 = var_2 maps\_utility::getanim( var_4 );
    var_6 = getanimlength( var_5 );
    var_7 = common_scripts\utility::getstruct( "mortar_org", "targetname" );
    maps\_utility::delaythread( var_6 - 1.6, ::_id_C5C2, var_7 );
    level.player maps\_utility::delaythread( var_6 - 0.2, maps\_gameskill::grenade_dirt_on_screen, "right" );
    var_8 = 15;
    level.player playerlinktodelta( var_2, "tag_player", 1, 0, 0, 0, 0, 1 );
    var_9 = common_scripts\utility::getstruct( "shepherd_get_in_fight", "targetname" );
    var_9 thread maps\_anim::anim_single( var_3, var_4 );
    maps\_utility::delaythread( 0.05, ::setanim_intro_gun );
    thread h2_shepherd_wakeup_cinematic( self, var_2 );
    var_9 waittill( var_4 );
    level.player unlink();
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
    var_2 delete();
    self detach( "weapon_colt_anaconda_animated", "tag_weapon_right" );
    clearanim_intro_gun();
    common_scripts\utility::flag_set( "get_on_the_line" );
    var_10 = getnode( "shepherd_dest_node", "targetname" );
    self setgoalnode( var_10 );
    self.goalradius = 8;
    intro_show_entities();
    common_scripts\utility::flag_wait( "shepherd_leaves" );
    maps\_utility::stop_magic_bullet_shield();
    thread _id_D1B2( self );
}

h2_shepherd_wakeup_cinematic( var_0, var_1 )
{
    wait 1.0;
    var_2 = _id_D397::_id_A97A( "roadkill_shepherd_wakeup" );
    var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 8.0, 25, 32, 32 ) _id_D397::_id_AF9C();
    var_2 _id_D397::_id_BEA0( 1.8 ) _id_D397::_id_C491( 1.0, 1500, 6, 6 );
    var_2 _id_D397::_id_BEA0( 3.15 ) _id_D397::_id_C491( 2.4, -1, 5, 5 ) _id_D397::_id_CCA7( var_0, "tag_eye" ) _id_D397::_id_AE01( 1.0 );
    var_2 _id_D397::_id_BEA0( 6.5 ) _id_D397::_id_C491( 2.0, -1, 16, 16 ) _id_D397::_id_CCA7( var_0, "tag_eye" ) _id_D397::_id_AE01( 1.0 );
    var_2 _id_D397::_id_BEA0( 8.5 ) _id_D397::_id_C491( 4.0, -1, 16, 2 ) _id_D397::_id_CCA7( var_0, "tag_eye" ) _id_D397::_id_AE01( 1.0 );
    var_2 _id_D397::_id_BEA0( 9.0 ) _id_D397::_id_C491( 6.0, 85, 4, 4 );
    var_2 _id_D397::_id_BEA0( 10.1 ) _id_D397::_id_C491( 32, 500, 1, 1 );
    var_2 _id_D397::_id_BEA0( 11.9 ) _id_D397::_id_BF3F();
    var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( 40, 0.05, 0 );
    var_2 _id_D397::_id_BEA0( 1.5 ) _id_D397::_id_AC9F( 35, 1.0, 0 );
    var_2 _id_D397::_id_BEA0( 2.65 ) _id_D397::_id_A9EC( 7.8, 0 );
    var_2 _id_D397::_id_BEA0( 2.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 3.0, 0.4, 0.6, 15, 15, 8, 8 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_2 _id_D397::_id_BEA0( 7.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.5, 1.0, 0.5, 0, 0, 0, 0 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_2 _id_D397::_id_BEA0( 11.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.0, 0.5, 0.5, 90, 90, 30, 30 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_2 _id_D397::_id_BEA0( 8.15 ) _id_D397::_id_BAE4( 2 );
    var_2 _id_D397::_id_BEA0( 12.0 ) _id_D397::_id_BAE4( 0 );
    var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_play", 0 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_init", 1 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_play", 1 ) _id_D397::_id_A970( ::setsaveddvar, undefined, "ui_consciousnessVignetteDarkness", 0.15 );
    var_2 _id_D397::_id_BEA0( 13.0 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_play", 0 );
    var_2 _id_D397::_id_BEA0( 1.8 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_2 _id_D397::_id_BEA0( 8.5 ) _id_D397::_id_B85E( 0.12, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.25 );
    var_2 _id_D397::_id_BEA0( 9.7 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_2 _id_D397::_id_BEA0( 10.15 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_2 _id_D397::_id_BEA0( 10.5 ) _id_D397::_id_B85E( 0.06, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_2 _id_D397::_id_BEA0( 10.7 ) _id_D397::_id_B85E( 0.04, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_2 _id_D397::_id_BEA0( 10.95 ) _id_D397::_id_B85E( 0.04, 0.2, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_2 _id_D397::_id_BEA0( 11.2 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_2 _id_D397::_id_BEA0( 11.5 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_2 _id_D397::_id_BC26();
    setsaveddvar( "ui_consciousnessVignetteDarkness", 1.0 );
}

_id_CF74()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "bullethit", var_0 );

        if ( var_0 == level.player )
        {
            setdvar( "ui_deadquote", &"SCRIPT_MISSIONFAIL_KILLTEAM_AMERICAN" );
            maps\_utility::missionfailedwrapper();
        }
    }
}

_id_A7FB()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !isalive( var_1 ) )
            continue;

        if ( var_1 == level.player )
        {
            setdvar( "ui_deadquote", &"SCRIPT_MISSIONFAIL_KILLTEAM_AMERICAN" );
            maps\_utility::missionfailedwrapper();
        }
    }
}

_id_D1B2( var_0 )
{
    var_0 maps\_utility::gun_remove();
    var_0 = maps\_vehicle_aianim::convert_guy_to_drone( var_0 );
    var_0.script = "empty_script";
    var_0.dontdonotetracks = 1;
    var_0 setcandamage( 1 );
    var_0.health = 5000;
    var_0 thread precognitive_paranoia_watch_damage();
    var_0 thread precognitive_paranoia_watch_death();
    var_0 hide();
    var_0.animname = "shepherd";
    var_0 attach( "com_hand_radio", "tag_inhand" );
    var_1 = common_scripts\utility::getstruct( "shepherd_new_wander_struct", "targetname" );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_3 = var_1.origin + ( -200.0, 0.0, 0.0 );
    var_2.origin = var_3;
    var_2.angles = var_1.angles;
    var_2 maps\_anim::anim_first_frame_solo( var_0, "angry_wander" );
    wait 0.05;
    var_0 linkto( var_2 );
    wait 4;
    var_0 show();
    var_2 thread maps\_anim::anim_single_solo( var_0, "angry_wander" );
    var_4 = 8;
    var_2 moveto( var_1.origin, var_4, 0, var_4 );
    wait(var_4);
    var_0 _id_C509();
    var_4 = 5;
    var_2 moveto( var_3, var_4, var_4, 0 );
    wait(var_4);
    var_0 delete();
}

_id_C509()
{
    level endon( "player_starts_stairs" );
    var_0 = maps\_utility::getanim( "angry_wander" );

    for (;;)
    {
        var_1 = self getanimtime( var_0 );

        if ( var_1 > 0.8 )
            break;

        wait 0.05;
    }
}

_id_C9CB()
{
    self endon( "death" );
    self.animname = "shepherd";
    self attach( "com_hand_radio", "tag_inhand" );
    self hide();
    maps\_utility::gun_remove();
    var_0 = common_scripts\utility::getstruct( "shepherd_wander_struct", "targetname" );
    var_0 maps\_anim::anim_first_frame_solo( self, "stair_wave" );
    wait 0.05;
    var_1 = self geteye();
    var_2 = level.player maps\_utility::can_see_origin( var_1, 0 );
    var_3 = distance( level.player.origin, self.origin ) < 400;

    if ( var_2 || var_3 )
    {
        waittillframeend;
        _id_CECF();
        return;
    }

    self show();
    var_0 thread maps\_anim::anim_loop_solo( self, "stair_idle" );

    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) < 350 )
            break;

        wait 0.05;
    }

    var_0 notify( "stop_loop" );
    var_0 maps\_anim::anim_single_solo( self, "stair_wave" );
    var_0 thread maps\_anim::anim_loop_solo( self, "stair_idle" );
    common_scripts\utility::flag_wait( "player_gets_in" );
    _id_CECF();
}

_id_C14D()
{
    self endon( "death" );
    self.animname = "generic";
    maps\_utility::gun_remove();
    var_0 = spawn( "script_origin", ( -2356.06, -4159.92, -60.541 ) );
    var_1 = getent( "radio_handheld", "targetname" );
    var_1.animname = "radio_handheld";
    var_1 maps\_anim::setanimtree();
    var_2 = [ self, var_1 ];
    var_0 maps\_anim::anim_single( var_2, "stair_ranger_idle_start" );

    while ( !common_scripts\utility::flag( "leaving_riverbank" ) )
    {
        var_0 thread maps\_anim::anim_single( var_2, "stair_ranger_idle_loop" );
        animscripts\shared::donotetracks( "single anim", ::handle_stair_ranger_idle_loop_notetracks );
        wait 0.05;
    }

    var_0 maps\_anim::anim_single( var_2, "stair_ranger_idle_to_wave" );
    var_0 thread maps\_anim::anim_loop( var_2, "stair_wave" );
    common_scripts\utility::flag_wait( "player_gets_in" );
    _id_CECF();
    var_1 delete();
}

handle_stair_ranger_idle_loop_notetracks( var_0 )
{
    if ( var_0 == "loop_sync" && common_scripts\utility::flag( "bridge_baddies_retreat" ) )
        return var_0;
}

_id_BDF3( var_0 )
{
    if ( common_scripts\utility::flag( "bridgelayer_complete" ) )
        return;

    level endon( "bridgelayer_complete" );
    var_1 = var_0;

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            var_0 = var_1;

        var_2 = common_scripts\utility::getstruct( var_0, "targetname" );

        if ( isdefined( var_2.script_delay ) )
        {
            var_2 maps\_anim::anim_reach_solo( self, "idle_reach" );
            var_2 thread maps\_anim::anim_loop_solo( self, "idle" );
            wait(var_2.script_delay);
            var_2 notify( "stop_loop" );
            maps\_utility::anim_stopanimscripted();
        }
        else
        {
            self setgoalpos( var_2.origin );
            self.goalradius = var_2.radius;
            self waittill( "goal" );
        }

        var_0 = var_2.target;
    }
}

_id_AC50()
{
    var_0 = getent( "intro_runner_path_breaker", "targetname" );
    var_0 disconnectpaths();
    var_0 notsolid();
    wait 5;
    var_0 solid();
    var_0 connectpaths();
    var_0 delete();
}

_id_B62B()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "roadkill_school_14" );
    self delete();
}

_id_C044()
{
    level._id_BEF0 = self;
    self.ignoreall = 1;
    self.ignoreme = 1;
    common_scripts\utility::flag_wait( "ambush_spawner_angry" );
    self.ignoreme = 0;

    if ( isalive( self ) )
    {
        self.threatbias = 50000;
        self.ignoreall = 0;
        var_0 = getent( self.script_linkto, "script_linkname" );
        self setentitytarget( var_0 );
        wait 3;
        self clearentitytarget();
    }

    if ( isalive( self ) )
    {
        self waittill( "death" );
        wait 2;

        if ( isdefined( self ) )
            self.ignoreme = 1;
    }
}

_id_AE38()
{
    self endon( "death" );
    self.ignoreme = 1;
    self waittill( "shooting" );
    wait 0.5;
    self.ignoreme = 0;
}

_id_C1E3()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "trapper_spawners_ignoreme" );
    self.ignoreme = 1;
}

_id_AB8A()
{
    var_0 = getent( "trapper_killer_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 delete();
    }
}

no_grenades()
{
    self.grenadeammo = 0;
}

_id_AF05()
{
    var_0 = getent( "balcony_militia1", "targetname" );
    var_0.script_drone_override = 1;
    var_0 maps\_utility::add_spawn_function( ::_id_A95E, "" );
    var_0 maps\_utility::spawn_ai();
    var_0 = getent( "balcony_militia2", "targetname" );
    var_0.script_drone_override = 1;
    var_0 maps\_utility::add_spawn_function( ::_id_A95E, "1" );
    var_0 maps\_utility::spawn_ai();
    var_0 = getent( "balcony_militia3", "targetname" );
    var_0.script_drone_override = 1;
    var_0 maps\_utility::add_spawn_function( ::_id_A95E, "2" );
    var_0 maps\_utility::spawn_ai();
}

_id_A95E( var_0 )
{
    self endon( "death" );
    self setlookatentity( level.player );
    maps\_utility::gun_remove();
    self.allowdeath = 1;
    self.health = 1;
    self.ignoreall = 1;
    self.ignoresuppression = 1;
    var_1 = spawn( "script_origin", ( -8047.18, 4014.04, 512.053 ) );
    var_1 maps\_anim::anim_generic( self, "balconymilitia_civilian" + var_0 + "_intro" );
    var_1 thread maps\_anim::anim_generic_loop( self, "balconymilitia_civilian" + var_0 + "_idle" );
    self waittill( "bulletwhizby" );
    self notify( "stop_loop" );
    var_1 thread maps\_anim::anim_generic( self, "balconymilitia_civilian" + var_0 + "_out" );
    waitframe();
    self.animname = "generic";
    maps\_anim::anim_self_set_time( "balconymilitia_civilian" + var_0 + "_out", 0.41 );
    var_1 waittill( "balconymilitia_civilian" + var_0 + "_out" );
    self delete();
}

_id_C80C( var_0 )
{
    self endon( "bulletwhizby" );

    if ( !self._id_AA2C )
    {
        var_0 notify( "stop_loop" );
        var_0 maps\_anim::anim_generic( self, self._id_B326 + "_solo" );
        var_0 maps\_anim::anim_generic( self, self._id_B326 + "_solo" );
        var_0 thread maps\_anim::anim_generic_loop( self, self._id_A9B5 );
    }

    wait 60;
}

_id_C148()
{
    common_scripts\utility::flag_wait( "start_runner" );

    for (;;)
    {
        if ( distance( level._id_CE62["player"].origin, level._id_CE62["detour"].origin ) <= 320 )
            break;

        wait 0.05;
    }

    common_scripts\utility::flag_set( "player_closes_gap" );
}

_id_BAC7( var_0, var_1, var_2 )
{
    for (;;)
    {
        if ( distance( self.origin, var_1.origin ) <= var_2 )
        {
            self vehicle_setspeed( var_0, 5, 5 );
            break;
        }

        wait 0.05;
    }
}

_id_C205()
{
    self delete();
}

_id_AA78( var_0 )
{
    if ( !isdefined( level.scr_radio[var_0] ) )
        level.scr_radio[var_0] = level.scr_sound["generic"][var_0];

    maps\_utility::radio_dialogue( var_0 );
}

_id_BC58( var_0 )
{
    _id_C401( var_0, ( 0.0, 2500.0, 0.0 ) );
}

_id_AD34( var_0 )
{
    _id_C401( var_0, ( 0.0, 4000.0, 0.0 ) );
}

_id_D581()
{
    self waittill( "trigger" );
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = var_0.origin;
    var_3 = var_2;
    var_4 = var_1.origin;
    var_5 = vectortoangles( var_4 - var_2 );
    var_6 = anglestoforward( var_5 );
    var_7 = distance( var_2, var_4 );
    var_2 += var_6 * -1000;
    common_scripts\utility::flag_set( "shot_rings_out" );
    thread common_scripts\utility::play_sound_in_space( "scn_shot_fired_npc_mid", var_4 );
    var_8 = 9000;
    var_9 = var_7 / var_8;
    wait(var_9 * 0.6);
    thread common_scripts\utility::play_sound_in_space( "whizby_triggered", var_2 );
    wait(var_9 * 0.4);
    var_10 = bullettrace( var_4, var_2, 1, undefined );
    var_11 = var_10["position"];
    var_12 = common_scripts\utility::getfx( "car_dirt" );
    var_13 = "concrete";

    if ( var_10["surfacetype"] != "concrete" )
    {
        var_12 = common_scripts\utility::getfx( "car_spark" );
        var_13 = "metal";
    }

    playfx( var_12, var_11, var_6 );
    playfx( var_12, var_11, var_6 );
    var_14 = [];
    var_14[var_14.size] = "ride_bullet_brick_1";
    var_14[var_14.size] = "ride_bullet_brick_2";
    var_15 = [];
    var_15[var_15.size] = "ride_bullet_metal_1";
    var_15[var_15.size] = "ride_bullet_metal_3";
    var_15[var_15.size] = "ride_bullet_metal_2";
    var_15[var_15.size] = "ride_bullet_metal_4";
    var_15[var_15.size] = "ride_bullet_metal_5";
    var_16 = [];
    var_16["concrete"] = var_14;
    var_16["metal"] = var_15;

    if ( !isdefined( level._id_D58E ) )
        level._id_D58E = [];

    if ( !isdefined( level._id_D58E[var_13] ) )
        level._id_D58E[var_13] = 0;

    var_17 = level._id_D58E[var_13];
    var_18 = var_16[var_13][var_17];
    thread common_scripts\utility::play_sound_in_space( var_18, var_11 );
    level._id_D58E[var_13]++;
    level._id_D58E[var_13] %= var_16[var_13].size;
    wait 1.2;
}

_id_C5CF()
{
    self setentitytarget( level._id_CE62["detour"] );
    self.interval = 0;

    if ( !isdefined( self.script_delay ) )
        return;

    self setgoalpos( self.origin );
    maps\_utility::script_delay();
    maps\_spawner::go_to_node();
}

_id_B104()
{
    var_0 = common_scripts\utility::getstruct( "hydrant_struct", "targetname" );
    radiusdamage( var_0.origin, var_0.radius, 5000, 5000, level.player );
}

_id_C06E()
{
    var_0 = level._id_CBAB maps\_vehicle::vehicle_to_dummy();
    var_0 notify( "stop_model_dummy_death" );
    var_0.driver = level._id_CBAB.driver;
    var_0.turret = level._id_CBAB.mgturret[0];
    var_0.gunner = var_0.turret getturretowner();
    level._id_CBAB.riders = [];
    level._id_CBAB.mgturret = [];
    level._id_CBAB delete();
    var_0.animname = "technical";
    var_1 = [];
    var_1["technical"] = var_0;
    var_1["latvee"] = level._id_BA6B;
    var_2 = level._id_CBAB.driver;

    if ( isdefined( var_2 ) && isalive( var_2 ) )
    {
        var_2.animname = "technical_driver";
        var_2.deathanim = level.scr_anim[var_2.animname]["technical_pushed"];
        var_2 kill();
    }

    var_3 = spawnstruct();
    var_3.origin = ( 0.0, 0.0, 0.0 );
    var_3.angles = ( 0.0, 0.0, 0.0 );
    var_3 thread maps\_anim::anim_single( var_1, "technical_pushed" );
    soundscripts\_snd::snd_message( "start_pushed_truck_mix" );
    wait(getanimlength( level._id_BA6B maps\_utility::getanim( "technical_pushed" ) ));
    level._id_BA6B stopanimscripted();
    level._id_BA6B clearanim( level._id_BA6B maps\_utility::getanim( "technical_pushed" ), 0 );
    soundscripts\_snd::snd_message( "stop_pushed_truck_mix" );
}

_id_C0D3()
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
    level.difficultysettings["player_deathInvulnerableTime"]["easy"] = 7000;
    level.difficultysettings["player_deathInvulnerableTime"]["normal"] = 4000;
    level.difficultysettings["player_deathInvulnerableTime"]["hardened"] = 3000;
    level.difficultysettings["player_deathInvulnerableTime"]["veteran"] = 3000;
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
    level.difficultysettings["health_regenRate"]["easy"] = 0.2;
    level.difficultysettings["health_regenRate"]["normal"] = 0.2;
    level.difficultysettings["health_regenRate"]["hardened"] = 0.2;
    level.difficultysettings["health_regenRate"]["veteran"] = 0.2;
    level.difficultysettings["playerDifficultyHealth"]["easy"] = 20;
    level.difficultysettings["playerDifficultyHealth"]["normal"] = 20;
    level.difficultysettings["playerDifficultyHealth"]["hardened"] = 20;
    level.difficultysettings["playerDifficultyHealth"]["veteran"] = 20;
    level.difficultysettings["longRegenTime"]["easy"] = 500;
    level.difficultysettings["longRegenTime"]["normal"] = 500;
    level.difficultysettings["longRegenTime"]["hardened"] = 500;
    level.difficultysettings["longRegenTime"]["veteran"] = 500;
    level.difficultysettings["healthOverlayCutoff"]["easy"] = 0.02;
    level.difficultysettings["healthOverlayCutoff"]["normal"] = 0.02;
    level.difficultysettings["healthOverlayCutoff"]["hardened"] = 0.02;
    level.difficultysettings["healthOverlayCutoff"]["veteran"] = 0.02;
}

_id_BE93()
{
    self waittill( "trigger" );
    var_0 = getent( self.target, "targetname" );
    var_1 = getaiarray( "axis" );
    var_2 = 0;
    var_3 = var_1.size;

    foreach ( var_5 in var_1 )
    {
        if ( var_5 istouching( var_0 ) )
            continue;

        var_5 delete();
        var_2++;
    }
}

_id_B403()
{
    if ( !isdefined( self.script_balcony ) )
        return;

    self.a.disablelongdeath = 1;
    self.deathfunction = ::try_balcony_death;
}

try_balcony_death()
{
    if ( !isdefined( self ) )
        return 0;

    if ( self.a.pose != "stand" )
        return 0;

    if ( isdefined( self.prevnode ) )
    {
        var_0 = self.angles[1];
        var_1 = self.prevnode.angles[1];
        var_2 = abs( var_0 - var_1 );

        if ( var_2 > 80 )
            return 0;

        var_3 = distance( self.origin, self.prevnode.origin );

        if ( var_3 > 92 )
            return 0;
    }

    if ( !isdefined( level.last_balcony_death ) )
        level.last_balcony_death = gettime();

    var_4 = gettime() - level.last_balcony_death;

    if ( var_4 < 3000 )
        return 0;

    var_5 = maps\_utility::getgenericanim( "balcony_death" );
    self.deathanim = var_5[randomint( var_5.size )];
    return 0;
}

_id_B7A6()
{
    level._id_C709[level._id_C709.size] = self;
    level endon( "playground_baddies_retreat" );
    self.attackeraccuracy = 0;
    self.ignorerandombulletdamage = 1;
    thread _id_AF13();
    self waittill( "damage" );
    common_scripts\utility::flag_set( "playground_baddies_retreat" );
}

_id_AF13()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "playground_baddies_retreat" );
    var_0 = getent( "lower_school_flee_volume", "targetname" );
    var_1 = randomfloat( 2 );
    wait(var_1);
    self setgoalvolumeauto( var_0 );
    self waittill( "goal" );
    self.attackeraccuracy = 1;
    self.ignorerandombulletdamage = 0;
}

_id_B0B8()
{
    wait 8.85;
    level.player maps\_gameskill::resetskill();
    level.player _id_BEB1();
    level.player maps\_utility::clear_custom_gameskill_func();
    setsaveddvar( "player_radiusdamagemultiplier", "1.0" );
}

_id_BEB1()
{
    level.player.ignorerandombulletdamage = 0;
}

_id_CD57()
{
    var_0 = getent( "safe_to_charge_school_volume", "targetname" );
    var_1 = 1;

    for (;;)
    {
        var_2 = getaiarray( "axis" );
        var_3 = 0;
        var_4 = 0;

        foreach ( var_6 in level._id_C709 )
        {
            if ( !isalive( var_6 ) )
                continue;

            if ( var_6 istouching( var_0 ) )
            {
                var_3++;

                if ( var_3 > var_1 )
                {
                    var_4 = 1;
                    break;
                }
            }
        }

        if ( !var_4 )
            return;

        wait 0.05;
    }
}

_id_B038()
{
    var_0 = common_scripts\utility::getstruct( "heli_linkup_struct", "script_noteworthy" );
    maps\_vehicle::set_stage( var_0, level._id_D4C7, "left" );
    maps\_vehicle::set_stage( var_0, level._id_AA06, "right" );
    thread maps\roadkill_aud::_id_C9EF();
    common_scripts\utility::flag_wait( "start_shepherd_end" );
    thread maps\_vehicle::load_side( "left", level._id_D4C7 );
    thread maps\_vehicle::load_side( "right", level._id_AA06 );
    wait 8;
    common_scripts\utility::flag_wait( "heli_takes_off" );
    var_1 = common_scripts\utility::getstruct( "heli_fly_node", "targetname" );
    maps\roadkill_aud::_id_CD89();
    maps\_vehicle::vehicle_paths( var_1 );
}

_id_AC51()
{
    self.goalradius = 8;
    level._id_D4C7[level._id_D4C7.size] = self;
}

_id_CEFC()
{
    self.goalradius = 8;
    level._id_AA06[level._id_AA06.size] = self;
}

_id_D4F4()
{
    var_0 = common_scripts\utility::getstruct( "heli_linkup_struct", "script_noteworthy" );
    var_1 = common_scripts\utility::getstruct( "gag_stage_littlebird_unload", "script_noteworthy" );
    var_0.target = var_1.targetname;
}

_id_D3C7()
{
    maps\_utility::add_damage_function( ::_id_C011 );
}

_id_C011( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isalive( var_1 ) )
        return;

    if ( var_1 != level.player )
        return;

    wait 1.5;
    setdvar( "ui_deadquote", &"ROADKILL_SHOT_UNARMED" );
    maps\_utility::missionfailedwrapper();
}

_id_CC0A()
{
    if ( common_scripts\utility::flag( "player_gets_in" ) )
        return;

    level endon( "player_gets_in" );
    wait 4;
    var_0 = [];
    var_0[var_0.size] = "roadkill_fly_comeongetin";
    var_0[var_0.size] = "roadkill_fly_holdingupline";
    var_0[var_0.size] = "roadkill_fly_hurryup";
    var_0[var_0.size] = "roadkill_fly_moveletsgo";
    var_1 = 0;

    for (;;)
    {
        var_2 = randomfloatrange( 5, 9 );
        wait(var_2);
        var_3 = var_0[var_1];

        if ( var_1 == 3 )
            _id_B2D4( var_3 );
        else
            _id_CFBE( var_3, "guy_" + var_1 );

        var_1++;
        var_1 %= var_0.size;
    }
}

_id_AD24()
{
    maps\_utility::array_spawn_function_targetname( "enemy_rooftop_spawner", ::_id_C0A6 );
    maps\_utility::array_spawn_targetname( "enemy_rooftop_spawner" );
}

_id_C0A6()
{
    self endon( "death" );
    var_0 = self.origin;
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.health = 10000;
    _id_AD80();
    self setgoalpos( var_0 );
    self waittill( "goal" );
    self delete();
}

_id_AD80()
{
    common_scripts\utility::flag_assert( "video_tapers_react" );
    level endon( "video_tapers_react" );
    level endon( "spy_baddies_flee" );
    thread _id_BEC6();
    self setgoalpos( self.origin );
    self.goalradius = 16;
    var_0 = randomfloat( 3 );
    wait(var_0);
    var_1 = getnode( self.target, "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    var_2 = common_scripts\utility::getstructarray( "spy_node", "script_noteworthy" );

    for (;;)
    {
        var_0 = randomfloat( 0.8 );
        wait(var_0);
        var_1 = common_scripts\utility::random( var_2 );
        self setgoalpos( var_1.origin );
        self waittill( "goal" );
    }
}

_id_BEC6()
{
    level endon( "spy_baddies_flee" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "bulletwhizby" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "damage" );
    maps\_utility::do_wait_any();
    level notify( "spy_baddies_flee" );
}

_id_A9E3()
{
    thread maps\_utility::magic_bullet_shield();
    self setgoalpos( self.origin );
    self pushplayer( 1 );
    self.dontavoidplayer = 1;
    self.goalradius = 16;
    var_0 = spawn( "script_origin", ( -2595.0, -4297.0, 184.0 ) );
    var_0 thread maps\_anim::anim_generic_loop( self, "ranger_on_the_bridge_idle" + level._id_C48C );
    level._id_C48C++;
    common_scripts\utility::flag_wait( "player_gets_in" );
    _id_CECF();
}

escape_block_spawner_middle()
{
    thread maps\_utility::magic_bullet_shield();
    self setgoalpos( self.origin );
    self pushplayer( 1 );
    self.dontavoidplayer = 1;
    self.goalradius = 16;
    self.animname = "generic";
    var_0 = getent( "rangers_blocking_road_middle", "targetname" );
    var_0 thread maps\_anim::anim_generic_loop( self, self.animation, "stop_loop" );
    common_scripts\utility::flag_wait( "player_gets_in" );
    var_0 notify( "stop_loop" );
    waitframe();
    var_0 maps\_anim::anim_single_solo( self, self.animation + "_out" );
    var_1 = getnode( self.target, "targetname" );
    self setgoalnode( var_1 );
    self.goalradius = 100;
    self waittill( "goal" );
    _id_CECF();
}

_id_C3CF()
{
    level.player._id_B618 = level.player getweaponammostock( "flash_grenade" );
    _id_B2D4( "roadkill_fly_getflashbang" );
    maps\_utility::display_hint( "learn_flash" );
}

_id_ACAE()
{
    var_0 = level.player getweaponammostock( "flash_grenade" );

    if ( var_0 <= 0 )
        return 1;

    if ( common_scripts\utility::flag( "ambush_house_player_goes_last_room" ) )
        return 1;

    return level.player._id_B618 > var_0;
}

_id_D165()
{
    var_0 = getent( "dismount_flash_volume", "targetname" );
    var_1 = var_0 _id_BDB5();

    for (;;)
    {
        if ( !isdefined( var_1 ) )
            break;

        wait 0.05;
    }

    common_scripts\utility::flag_set( "room_was_flashed" );
}

_id_BDB5()
{
    for (;;)
    {
        var_0 = getentarray( "grenade", "classname" );
        var_1 = [];

        foreach ( var_3 in var_0 )
        {
            if ( issubstr( var_3.model, "flash" ) )
                var_1[var_1.size] = var_3;
        }

        foreach ( var_6 in var_1 )
        {
            if ( var_6 istouching( self ) )
                return var_6;
        }

        wait 0.05;
    }
}

_id_D36C()
{
    if ( common_scripts\utility::flag( "leaving_riverbank" ) )
        return;

    level endon( "leaving_riverbank" );
    level endon( "bridge_layer_attacked_by_bridge_baddies" );
    common_scripts\utility::flag_wait( "player_enters_riverbank" );
    wait 20;

    if ( _id_AA6D() )
        return;

    _id_B2D4( "roadkill_fly_yourM203" );
    maps\_utility::display_hint( "learn_m203", undefined, undefined, undefined, undefined, 15 );

    for (;;)
    {
        if ( _id_AA6D() )
            break;

        wait 0.05;
    }

    wait 2;
    _id_B2D4( "roadkill_fly_acrossriver" );
}

_id_AA6D()
{
    if ( common_scripts\utility::flag( "leaving_riverbank" ) )
        return 1;

    return level.player getcurrentweapon() == "alt_m4m203_eotech";
}

_id_C499()
{
    var_0 = [];
    var_0[0] = "roadkill_ar1_huah";
    var_0[1] = "roadkill_ar2_huah2";
    var_1 = 0;
    var_2 = getaiarray( "allies" );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 maps\_utility::is_hero() )
            continue;

        var_5 = var_0[var_1];
        var_4 maps\_utility::generic_dialogue_queue( var_5 );
        var_1++;

        if ( var_1 >= var_0.size )
            return;
    }
}

_id_B838()
{
    _id_B2D4( "roadkill_fly_eyesonschool" );
    maps\_utility::delaythread( 2.6, common_scripts\utility::flag_set, "friendlies_suppress_school" );
    var_0 = gettime();
    _id_BE3C( "roadkill_ar3_ineffective" );
    maps\_utility::wait_for_buffer_time_to_pass( var_0, 3.2 );
    _id_B2D4( "roadkill_fly_keepittogether" );

    if ( common_scripts\utility::flag( "playground_baddies_retreat" ) )
        return;

    _id_C24A( "roadkill_cpd_frontofschool" );
}

_id_B33E()
{
    common_scripts\utility::flag_wait( "roadkill_school_18" );
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

_id_BBFE( var_0 )
{
    level._id_C672 maps\_utility::function_stack( ::_id_C706, var_0 );
}

_id_C706( var_0 )
{
    var_1 = common_scripts\utility::getstructarray( "arab_speaker", "targetname" );
    var_2 = common_scripts\utility::getclosest( level.player.origin, var_1 );
    common_scripts\utility::play_sound_in_space( var_0, var_2.origin );
}

_id_A929()
{
    common_scripts\utility::flag_wait( "start_shepherd_end" );
    maps\_utility::delaythread( 6, common_scripts\utility::flag_set, "heli_takes_off" );
    wait 10;
    var_0 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_0 fadeovertime( 2 );
    var_0.alpha = 1;
    wait 2;
    maps\_utility::nextmission();
}

_id_D120()
{
    self setcandamage( 1 );
    self._id_CEAB = getent( self.script_noteworthy + "_final", "script_noteworthy" );

    if ( isdefined( self._id_CEAB ) )
        self._id_CEAB hide();
    else
    {

    }

    var_0 = spawn( "script_origin", self getorigin() );
    var_0._id_C92D = self._id_CEAB.model;
    var_0.origin = self._id_CEAB getorigin();
    var_0._id_C99A = self._id_CEAB.angles;
    thread _id_B35F( var_0 );
    thread _id_C7C0( var_0 );
}

_id_B35F( var_0 )
{
    self endon( "tree_cleanup" );
    var_1 = self.script_noteworthy;
    var_2 = self.script_threshold;
    var_3 = self.script_accumulate;
    var_4 = 0;

    while ( var_2 > var_4 )
    {
        self waittill( "damage", var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( var_6 ) && isplayer( var_6 ) )
            var_4 += var_3;
    }

    self notify( "tree_killed" );
    common_scripts\_exploder::exploder( var_1 );
    common_scripts\utility::flag_wait( "player_is_pushing_truck" );
    _id_C7A8( 1, var_1, var_0 );
}

_id_C7C0( var_0 )
{
    self endon( "tree_killed" );
    common_scripts\utility::flag_wait( "player_is_pushing_truck" );
    self notify( "tree_cleanup" );
    _id_C7A8( 0, self.script_noteworthy, var_0 );
}

_id_C7A8( var_0, var_1, var_2 )
{
    if ( var_0 )
    {
        var_3 = getentarray( var_1 + "_animated", "script_noteworthy" );

        if ( isdefined( var_3 ) )
        {
            foreach ( var_5 in var_3 )
                var_5 delete();
        }
        else
        {

        }

        var_7 = spawn( "script_model", var_2.origin );
        var_7 setmodel( var_2._id_C92D );
        var_7 rotateto( var_2._id_C99A, 0.1 );
    }

    if ( !_func_2A5( self ) )
        self delete();
}

_id_C31E( var_0 )
{
    self _meth_85C1( var_0 );
}

h2_roadkill_new_intro()
{
    var_0 = getent( "h2_roadkill_intro_latvee_staged", "targetname" );
    var_0 hide();
    thread maps\_utility::battlechatter_off();
    setsaveddvar( "ui_hidemap", 1 );
    level.player common_scripts\utility::_disableweapon();
    level.player enableinvulnerability();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    wait 4.5;
    var_1 = maps\_utility::spawn_anim_model( "vehicle_latvee_camo" );
    var_2 = maps\_utility::spawn_anim_model( "player_worldbody" );
    var_3 = getent( "h2_intro_driver", "targetname" );
    var_4 = var_3 maps\_utility::spawn_ai( 1, 1 );
    var_4.animname = "driver_intro";
    var_2 linkto( var_1, "tag_passenger" );
    var_4 linkto( var_1, "tag_driver" );
    var_1 maps\_anim::anim_first_frame_solo( var_1, "h2_intro_vehicle" );
    var_1 maps\_anim::anim_first_frame_solo( var_2, "h2_intro", "tag_passenger" );
    var_1 maps\_anim::anim_first_frame_solo( var_4, "h2_intro", "tag_driver" );
    thread h2_roadkill_new_intro_fake_rpg();
    thread h2_roadkill_new_intro_cutscene( var_4, var_2 );
    level.player playerlinktodelta( var_2, "tag_player", 1, -3, 3, 0, 0, 1 );
    var_1 thread maps\_anim::anim_single_solo( var_2, "h2_intro", "tag_passenger" );
    var_1 thread maps\_anim::anim_single_solo( var_4, "h2_intro", "tag_driver" );
    var_1 maps\_anim::anim_single_solo( var_1, "h2_intro_vehicle" );
    wait 0.1;
    var_0 show();
    thread maps\_utility::battlechatter_on();
    level.player unlink();
    var_1 delete();
    var_2 delete();
    var_4 maps\_utility::stop_magic_bullet_shield();
    var_4 delete();
    level.player disableinvulnerability();
    setsaveddvar( "ui_hidemap", 0 );
    common_scripts\utility::flag_set( "h2_intro_done" );
    common_scripts\utility::flag_set( "intro_started" );
}

h2_roadkill_new_intro_fake_rpg()
{
    wait 2.55;
    var_0 = ( -966.2, -571.6, 364.7 );
    var_1 = ( -1717.9, -5048.9, 139.0 );
    thread common_scripts\utility::play_sound_in_space( "scn_mission_truck_intro_incoming_rpg", var_0 );
    var_2 = magicbullet( "rpg", var_0, var_1 );
    var_2 missile_settargetpos( var_1 );
    var_2 thread maps\roadkill_aud::scripted_sfx_intro_ride_explosion();
    var_3 = missile_createattractororigin( var_1, 15000, 5500, var_2, 1 );
    level waittill( "h2_intro_done" );
    missile_deleteattractor( var_3 );
}

h2_roadkill_new_intro_cutscene( var_0, var_1 )
{
    var_2 = _id_D397::_id_A97A( "roadkill_latvee_intro" );
    var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_A970( ::h2_roadkill_new_intro_adaptive_dof, level.player, var_0, var_1 );
    var_2 _id_D397::_id_BEA0( 9.0 ) _id_D397::_id_BF3F();
    var_2 _id_D397::_id_BEA0( 6.35 ) _id_D397::_id_BAE4( 2 );
    var_2 _id_D397::_id_BEA0( 9.0 ) _id_D397::_id_BAE4( 0 );
    var_2 _id_D397::_id_BEA0( 0.1 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.05, 0.0, 0.0, 75, 55, 12, 39 ) _id_D397::_id_A970( ::_meth_85AA, level.player, 90, -12, 0, 180 );
    var_2 _id_D397::_id_BEA0( 4.65 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.9, 0.35, 0.55, 8, 8, 8, 0 );
    var_2 _id_D397::_id_BEA0( 6.35 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.7, 0.5, 0.2, 0, 0, 0, 0 );
    var_2 _id_D397::_id_BEA0( 7.35 ) _id_D397::_id_A970( ::h2_roadkill_new_intro_blackscreen, level.player );
    var_2 _id_D397::_id_BEA0( 6.6 ) _id_D397::_id_A970( ::shellshock, level.player, "default", 3 );
    var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_init", 1 );
    var_2 _id_D397::_id_BEA0( 6.0 ) _id_D397::_id_A970( ::setomnvar, undefined, "ui_consciousness_play", 3 );
    var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AF90( 1.0 );
    var_2 _id_D397::_id_BEA0( 9.0 ) _id_D397::_id_CFD7();
    var_3 = 0.12;
    var_4 = 1.0;
    var_5 = 10000;
    var_6 = level.player;
    var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 1.0 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 1.5 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 2.0 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 2.5 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 3.0 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 3.5 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 4.0 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 4.5 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 5.0 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 5.5 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 6.0 ) _id_D397::_id_B85E( var_3, var_4, var_6, var_5 );
    var_2 _id_D397::_id_BEA0( 6.75 ) _id_D397::_id_B85E( 0.25, 2.5, var_1, 10000 );
    var_2 _id_D397::_id_BEA0( 6.0 ) _id_D397::_id_BF61( 0.5, 0.4 );
    var_2 _id_D397::_id_BEA0( 6.5 ) _id_D397::_id_BF61( 1.0, 0.1 );
    var_2 _id_D397::_id_BEA0( 2.1 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_2 _id_D397::_id_BEA0( 3.05 ) _id_D397::_id_B85E( 0.12, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.2 );
    var_2 _id_D397::_id_BEA0( 3.5 ) _id_D397::_id_B85E( 0.12, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.2 );
    var_2 _id_D397::_id_BEA0( 4.3 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_2 _id_D397::_id_BEA0( 6.3 ) _id_D397::_id_B85E( 0.2, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.75 );
    var_2 _id_D397::_id_BEA0( 7.5 ) _id_D397::_id_B85E( 0.2, 3.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 2.5 );
    var_2 _id_D397::_id_BC26();
}

h2_roadkill_new_intro_adaptive_dof( var_0, var_1 )
{
    var_2 = 1000;
    var_3 = 5.6;
    var_4 = 52;
    var_5 = 6.0;
    var_6 = 26;
    var_7 = 6.4;
    var_8 = 200;
    var_9 = 5.6;
    _id_D397::_id_ACC3();
    _id_D397::_id_C286( "outside" ) _id_D397::_id_BF77( var_3, var_2, 10, 10 );
    _id_D397::_id_C286( "right" ) _id_D397::_id_C15A( -40, 20, 30, 75, 0 ) _id_D397::_id_BF77( var_9, var_8, 10, 10 );
    _id_D397::_id_C286( "knees" ) _id_D397::_id_C15A( -38, -20, -50, 30, 0 ) _id_D397::_id_BF77( var_7, var_6, 10, 10 );
    _id_D397::_id_C286( "driver" ) _id_D397::_id_C15A( -40, 20, -75, -50, 0 ) _id_D397::_id_BF77( var_5, var_4, 10, 10 );
    thread _id_D397::_id_B9FF();
    wait 6.25;
    _id_D397::_id_C8AA();
}

h2_roadkill_new_intro_blackscreen()
{
    var_0 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_0 fadeovertime( 0.2 );
    var_0.alpha = 1.0;
    common_scripts\utility::flag_wait( "intro_latvee_complete" );
    var_0 destroy();
}
#using_animtree("generic_human");

setanim_intro_gun()
{
    self setanim( %h2_roadkill_intro_pickup_gun );
    self showallparts();
}

clearanim_intro_gun()
{
    self clearanim( %h2_roadkill_intro_pickup_gun, 0 );
}

school_weaponclips()
{
    var_0 = getentarray( "school_weaponclips", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

rotate_object()
{
    if ( isdefined( self.script_parameters ) )
        var_0 = int( self.script_parameters );
    else
        var_0 = randomintrange( 8, 14 );

    var_1 = undefined;

    if ( isdefined( self.script_noteworthy ) )
    {
        switch ( self.script_noteworthy )
        {
            case "pitch":
                var_1 = ::addpitch;
                break;
            case "yaw":
                var_1 = ::addyaw;
                break;
            case "roll":
                var_1 = ::addroll;
                break;
        }
    }
    else
        var_1 = ::addyaw;

    for (;;)
    {
        self call [[ var_1 ]]( var_0, 1 );
        wait 0.05;
    }
}

bring_back_buildings()
{
    var_0 = getent( "node_for_building_teleport_end", "targetname" );
    var_1 = getent( "node_for_building_teleport_start", "targetname" );
    var_2 = var_1.origin - var_0.origin;
    var_3 = getentarray( "building_teleport", "script_noteworthy" );

    foreach ( var_5 in var_3 )
        var_5.origin -= var_2;
}

technical_pushed_collision( var_0 )
{
    if ( isdefined( var_0.gunner ) && isalive( var_0.gunner ) )
    {
        var_0.turret turretfiredisable();
        var_0.gunner.animname = "technical_gunner";
        var_1 = var_0.gunner maps\_utility::getanim( "technical_pushed" );
        var_2 = var_0.turret maps\_utility::getanim( "technical_pushed" );
        var_0.gunner animscripts\saw\common::docustomanim( var_0.turret, var_1, var_2 );
        var_0.turret turretfireenable();
    }
}

static_model_groups_think()
{
    _func_31C( 1 );
    _func_31C( 3 );
    common_scripts\utility::flag_wait( "player_rolls_into_town" );
    _func_31B( 1 );
    _func_31B( 3 );
    common_scripts\utility::flag_wait( "start_balcony" );
    _func_31C( 2 );
    common_scripts\utility::flag_wait( "ambush_auto_adjust_speed" );
    _func_31C( 4 );
    _func_31C( 5 );
}

start_buildings_deleter()
{
    var_0 = getentarray( "fracturing_building", "script_noteworthy" );
    common_scripts\utility::flag_wait( "civie_dialogue" );
    maps\_utility::hide_exploder_models( "building_collapse" );
    maps\_utility::hide_exploder_models( "100ton_bomb" );
    common_scripts\utility::flag_wait( "garage_door_scene" );

    foreach ( var_2 in var_0 )
    {
        if ( _func_2A5( var_2 ) )
            continue;

        var_2 delete();
    }
}

intro_hide_entity()
{
    if ( !maps\_utility::is_default_start() )
        return;

    if ( !isdefined( level.intro_hidden_ents ) )
        level.intro_hidden_ents = [];

    level.intro_hidden_ents[level.intro_hidden_ents.size] = self;

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "dont_hide" )
        return;

    self hide();

    if ( isdefined( self.attachedguys ) && self.attachedguys.size > 0 )
    {
        foreach ( var_1 in self.attachedguys )
            var_1 hide();
    }

    if ( isdefined( self.mgturret ) && self.mgturret.size > 0 )
    {
        foreach ( var_4 in self.mgturret )
            var_4 hide();
    }
}

intro_show_entities()
{
    if ( !maps\_utility::is_default_start() )
        return;

    foreach ( var_1 in level.intro_hidden_ents )
    {
        var_1 show();

        if ( isdefined( var_1.attachedguys ) && var_1.attachedguys.size > 0 )
        {
            foreach ( var_3 in var_1.attachedguys )
                var_3 show();
        }

        if ( isdefined( var_1.mgturret ) && var_1.mgturret.size > 0 )
        {
            foreach ( var_6 in var_1.mgturret )
                var_6 show();
        }
    }
}

intro_moving_tank()
{
    self.is_moving_tank = 1;
    thread maps\_utility::play_sound_on_tag_endon_death( "scn_roadkill_riverbank_tank_01" );
    var_0 = getent( "new_intro_target", "targetname" );
    self setturrettargetent( var_0 );
    self.target_ent = var_0;
    wait 3.5;
    self fireweapon();
    self waittill( "reached_end_node" );
    thread _id_BEF6();
}

building_collapse_lamp_post()
{
    maps\_utility::assign_animtree( "lamp_post" );
    level waittill( "building_collapse" );
    maps\_anim::anim_single_solo( self, "lamp_post_anim_" + self.script_noteworthy );
}
