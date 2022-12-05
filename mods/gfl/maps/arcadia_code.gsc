// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_BC5D( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles );
}

_id_A99F()
{
    if ( common_scripts\utility::flag( "used_laser" ) )
        return;

    if ( common_scripts\utility::flag( "laser_hint_print" ) )
        return;

    common_scripts\utility::flag_set( "laser_hint_print" );
    thread maps\_utility::display_hint( "use_laser" );
}

_id_BCBF()
{
    common_scripts\utility::flag_wait( "laser_golf_hint_print" );
    wait 10;

    if ( common_scripts\utility::flag( "used_laser_golf" ) )
        return;

    thread maps\_utility::display_hint( "use_laser_golf" );
}

_id_C221()
{
    thread _id_CF4A();
    thread _id_BFA8();
}

_id_CF4A()
{
    level endon( "golf_course_mansion" );
    self endon( "death" );
    var_0 = [];
    var_0[var_0.size] = "arcadia_str_wererollin";
    var_0[var_0.size] = "arcadia_str_standclear";
    var_0[var_0.size] = "arcadia_str_oscarmike";

    for (;;)
    {
        self waittill( "resuming speed" );

        if ( randomint( 100 ) < 25 )
        {
            if ( !common_scripts\utility::flag( "disable_stryker_dialog" ) && !_func_1FB() )
                thread maps\_utility::radio_dialogue( var_0[randomint( var_0.size )] );
        }
    }
}

_id_BFA8()
{
    level endon( "golf_course_mansion" );
    self endon( "death" );
    var_0 = [];
    var_0[var_0.size] = "arcadia_str_holdingposition";

    for (;;)
    {
        self waittill( "wait for gate" );

        if ( randomint( 100 ) < 25 )
        {
            if ( !common_scripts\utility::flag( "disable_stryker_dialog" ) && !_func_1FB() )
                thread maps\_utility::radio_dialogue( var_0[randomint( var_0.size )] );
        }
    }
}

_id_B761()
{
    if ( !isdefined( self.script_parameters ) )
        return;

    var_0 = strtok( self.script_parameters, ":;, " );

    foreach ( var_2 in var_0 )
    {
        var_2 = tolower( var_2 );

        if ( var_2 == "playerseek" )
        {
            thread _id_D097();
            continue;
        }

        if ( var_2 == "ignoreme" )
        {
            maps\_utility::set_ignoreme( 1 );
            continue;
        }

        if ( var_2 == "rpg_enemy" )
        {
            thread _id_BF7C();
            continue;
        }
    }
}

_id_BBBA()
{
    self waittill( "spawned", var_0 );

    if ( !isalive( var_0 ) )
        return;

    var_0 endon( "death" );
    var_0 maps\_utility::set_ignoreme( 1 );
    var_0 waittill( "jumpedout" );
    var_0 maps\_utility::set_ignoreme( 0 );
}

_id_BF7C()
{
    if ( !isalive( level._id_C7A3 ) )
        return;

    self endon( "death" );
    maps\_utility::set_ignoreme( 1 );
    wait 0.05;
    self.goalheight = 64;
    self.goalradius = 64;
    self waittill( "goal" );

    if ( !isalive( level._id_C7A3 ) )
    {
        maps\_utility::set_ignoreme( 0 );
        return;
    }

    self setentitytarget( level._id_C7A3 );
    maps\_utility::delaythread( 3.0, maps\_utility::set_ignoreme, 0 );
    common_scripts\utility::delaycall( 15.0, ::clearenemy );
}

_id_D097()
{
    self endon( "death" );

    if ( isdefined( self.target ) )
        self waittill( "goal" );

    self setgoalentity( level.player );
    self.goalradius = 2000;
}

_id_BE80()
{
    maps\_utility::ent_flag_init( "start_drop" );
    maps\_utility::ent_flag_wait( "start_drop" );
}

_id_C5E9( var_0, var_1 )
{
    self.animname = var_1 + "_guy";
    maps\_utility::assign_animtree();
    var_2 = maps\_utility::spawn_anim_model( var_1 );
    self linkto( var_0 );
    var_2 linkto( var_0 );
    var_3 = [];
    var_3[var_3.size] = self;
    var_3[var_3.size] = var_2;
    var_4 = "drop1";

    if ( common_scripts\utility::cointoss() )
        var_4 = "drop2";

    var_0 maps\_anim::anim_single( var_3, var_4 );
    var_2 delete();

    if ( isalive( self ) )
        self delete();
}

_id_D199()
{
    var_0 = common_scripts\utility::get_linked_ent();
    var_0 _id_D2A4::_id_A907();
    self waittill( "trigger" );

    if ( var_0.health < var_0.healthbuffer )
        return;

    var_0 _id_D2A4::_id_CB00();
    var_0 endon( "death" );
    wait 5;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_sentryguns" );
    wait 15;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_takeoutsgun" );
}

_id_A964()
{
    var_0 = getentarray( "checkpoint_fake_chopper", "targetname" );
    common_scripts\utility::array_call( var_0, ::hide );
    common_scripts\utility::flag_wait( "checkpoint_fake_choppers" );

    if ( getdvarint( "r_arcadia_culldist" ) == 1 )
        return;

    common_scripts\utility::array_thread( var_0, ::_id_A9B1 );
}

_id_B1C0()
{
    var_0 = getentarray( "fake_creek_chopper", "targetname" );
    common_scripts\utility::array_call( var_0, ::hide );
    maps\_utility::trigger_wait_targetname( "fake_creek_choppers_start" );
    common_scripts\utility::array_thread( var_0, ::_id_A9B1 );
}

_id_A9B1()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = var_0.origin;
    var_2 = distance( self.origin, var_1 );
    var_3 = var_2 / 1200;

    for (;;)
    {
        thread _id_C9B5( var_3, var_1 );

        if ( !isdefined( self.script_count ) )
            break;

        self.script_count--;

        if ( self.script_count <= 0 )
            break;

        wait(randomfloatrange( 3.0, 5.0 ));
    }

    self delete();
}
#using_animtree("vehicles");

_id_C9B5( var_0, var_1 )
{
    var_2 = spawn( "script_model", self.origin );
    var_2 thread _id_C17E();
    var_2 endon( "delete" );
    var_2.angles = self.angles;
    var_3[0] = "vehicle_blackhawk_low";
    var_3[1] = "vehicle_pavelow_low";
    var_2 setmodel( var_3[randomint( var_3.size )] );
    var_2 useanimtree( #animtree );
    var_2 setanim( %bh_rotors, 1, 0.2, 1 );

    if ( randomint( 2 ) == 0 )
        var_2 maps\arcadia_aud::ambient_chopper_snd();

    var_2 moveto( var_1, var_0, 0, 0 );
    wait(var_0);
    var_2 delete();
}

_id_C17E()
{
    self endon( "death" );
    level waittill( "delete_all_fake_choppers" );

    if ( !isdefined( self ) )
        return;

    self notify( "delete" );
    self delete();
}

laser_targeting_device( var_0 )
{
    var_0 endon( "remove_laser_targeting_device" );
    var_0.lastusedweapon = undefined;
    var_0.laserforceon = 0;
    var_0 setweaponhudiconoverride( "actionslot4", "dpad_laser_designator" );
    var_0 notifyonplayercommand( "use_laser", "+actionslot 4" );

    if ( !var_0 maps\_utility::ent_flag_exist( "disable_stryker_laser" ) )
        var_0 maps\_utility::ent_flag_init( "disable_stryker_laser" );

    var_1 = undefined;
    level.player setactionslot( 4, "weapon", "usp_laserdesignator" );

    for (;;)
    {
        var_0 waittill( "use_laser" );

        if ( isdefined( var_0.disable_laser_designator ) && var_0.disable_laser_designator )
            continue;

        if ( var_0.laserforceon )
        {
            var_0 notify( "cancel_laser" );
            var_0 laseroff();

            if ( var_0 getcurrentweapon() == "usp_laserdesignator" )
            {
                if ( isdefined( var_1 ) )
                    var_0 switchtoweapon( var_1 );
                else
                {

                }

                var_0 disableweaponswitch();
                var_1 = undefined;

                while ( var_0 getcurrentweapon() == "usp_laserdesignator" )
                    waitframe();
            }

            if ( isdefined( var_0.previousdontallowcache ) )
            {
                var_0.dont_allow_ammo_cache = var_0.previousdontallowcache;
                var_0.previousdontallowcache = undefined;
            }
            else
                var_0.dont_allow_ammo_cache = undefined;

            var_0.laserforceon = 0;
            var_0 takeweapon( "usp_laserdesignator" );
            var_0 enableweaponpickup();
            var_0 enableweaponswitch();
        }
        else
        {
            var_0.laserforceon = 1;
            var_1 = var_0 getcurrentweapon();
            var_0 giveweapon( "usp_laserdesignator" );
            var_0 switchtoweapon( "usp_laserdesignator" );
            var_0 disableweaponswitch();
            var_0 disableweaponpickup();

            while ( var_0 getcurrentweapon() != "usp_laserdesignator" )
                waitframe();

            var_0 childthread _id_C950();
            var_0 childthread _id_CEDA( 0.2 );
            wait 0.1;
            wait(var_0 _meth_859B() / 1000 - 0.1);
            var_0 enableweaponswitch();
            var_0 thread laser_designate_target();

            if ( isdefined( var_0.dont_allow_ammo_cache ) )
                var_0.previousdontallowcache = var_0.dont_allow_ammo_cache;

            var_0.dont_allow_ammo_cache = 1;
        }

        wait 0.05;
    }
}

_id_CEDA( var_0 )
{
    self endon( "cancel_laser" );
    wait(var_0);
    var_1 = 0;

    while ( self.laserforceon )
    {
        var_2 = length2dsquared( self getvelocity() );

        if ( self issprinting() || self getstance() == "prone" && var_2 > 25 )
        {
            if ( var_1 )
            {
                self laseroff();
                var_1 = 0;
            }
        }
        else if ( !var_1 )
        {
            wait 0.2;
            maps\_utility::_id_D295();
            var_1 = 1;
        }

        waitframe();
    }
}

_id_C950()
{
    self endon( "use_laser" );
    self endon( "cancel_laser" );

    for (;;)
    {
        if ( self getcurrentweapon() != "usp_laserdesignator" )
        {
            self notify( "use_laser" );
            break;
        }

        waitframe();
    }
}

_id_CDBC( var_0, var_1 )
{
    var_2 = getentarray( "stryker_target_location", "targetname" );
    var_3 = spawn( "script_origin", var_0 );

    foreach ( var_5 in var_2 )
    {
        if ( !var_3 istouching( var_5 ) )
            continue;

        var_3 delete();
        return var_5.script_noteworthy;
    }

    var_3 delete();

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_1.vehicletype ) || isdefined( var_1.destructibleinfo ) )
        {
            if ( isdefined( var_1.vehicletype ) && var_1.vehicletype == "mi17" )
                return "chopper";
            else
                return "vehicle";
        }

        if ( isai( var_1 ) )
            return "ai";
    }

    return "generic";
}

_id_B179( var_0, var_1, var_2 )
{
    var_3 = [];

    if ( var_0 )
    {
        common_scripts\utility::flag_set( "used_laser_attack" );
        var_4 = _id_CDBC( var_1, var_2 );
        level.player thread maps\_utility::play_sound_on_entity( "wpn_plr_laser_target_acquired" );
        wait 0.4;

        switch ( var_4 )
        {
            case "house":
                var_3[var_3.size] = "arcadia_str_havealock";
                var_3[var_3.size] = "arcadia_str_badgeronecopies";
                break;
            case "yellowhouse":
                var_3[var_3.size] = "arcadia_str_engyellowhouse";
                break;
            case "greyhouse":
                var_3[var_3.size] = "arcadia_str_targgreyhouse";
                break;
            case "firetruck":
                var_3[var_3.size] = "arcadia_str_engfiretruck";
                break;
            case "policecar":
                var_3[var_3.size] = "arcadia_str_confpolicecar";
                break;
            case "apartment_office":
                var_3[var_3.size] = "arcadia_str_apartmentoffice";
                break;
            case "security_station":
                var_3[var_3.size] = "arcadia_str_securitystation";
                break;
            case "checkpoint":
                var_3[var_3.size] = "arcadia_str_checkpoint";
                break;
            case "vehicle":
                var_3[var_3.size] = "arcadia_str_attackingvehicle";
                var_3[var_3.size] = "arcadia_str_engagingvehicle";
                break;
            case "chopper":
                var_3[var_3.size] = "arcadia_str_engchopper";
                break;
            case "ai":
                var_3[var_3.size] = "arcadia_str_engaginginfantry";
                break;
            case "generic":
                var_3[var_3.size] = "arcadia_str_wehavelock";
                var_3[var_3.size] = "arcadia_str_engaging";
                var_3[var_3.size] = "arcadia_str_attacking";
                var_3[var_3.size] = "arcadia_str_solidcopyeng";
                break;
            default:
                break;
        }
    }
    else
    {
        var_3[var_3.size] = "arcadia_str_uhnegative";
        var_3[var_3.size] = "arcadia_str_invalidtarget";
        var_3[var_3.size] = "arcadia_str_outtarange";
        var_3[var_3.size] = "arcadia_str_outofrange";
    }

    if ( common_scripts\utility::flag( "disable_stryker_dialog" ) || _func_1FB() )
        return;

    thread maps\_utility::radio_dialogue( var_3[randomint( var_3.size )] );
}

laser_designate_target()
{
    self endon( "cancel_laser" );

    if ( !common_scripts\utility::flag( "used_laser" ) )
    {
        common_scripts\utility::flag_set( "used_laser" );
        thread maps\_utility::display_hint( "use_laser_attack" );
    }

    self waittill( "weapon_fired" );
    var_0 = get_laser_designated_trace();
    var_1 = var_0["position"];
    var_2 = var_0["entity"];
    level notify( "laser_coordinates_received" );
    var_3 = undefined;

    if ( common_scripts\utility::flag( "golf_course_mansion" ) )
        var_3 = _id_D5AC( var_1 );

    if ( isdefined( var_3 ) )
        thread laser_artillery( var_3 );
    else if ( !common_scripts\utility::flag( "disable_stryker_laser" ) && !maps\_utility::ent_flag( "disable_stryker_laser" ) )
    {
        if ( isalive( level._id_C7A3 ) )
        {
            var_4 = distance( level._id_C7A3.origin, var_1 );
            var_5 = var_4 >= 200 && var_4 <= 3500;
            thread _id_B179( var_5, var_1, var_2 );

            if ( var_5 )
                level._id_C7A3 thread maps\arcadia_stryker::_id_C0D7( var_1 );
        }
    }

    wait 0.5;
    self notify( "use_laser" );
}

_id_D5AC( var_0 )
{
    var_1 = getentarray( "stealth_laser_zone", "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( level._id_C240[var_3.script_group] )
            continue;

        var_4 = distance( var_0, var_3.origin );

        if ( var_4 <= var_3.radius )
            return var_3.script_group;
    }

    return undefined;
}

get_laser_designated_trace()
{
    var_0 = self geteye();
    var_1 = self getplayerangles();
    var_2 = anglestoforward( var_1 );
    var_3 = var_0 + var_2 * 7000;
    var_4 = bullettrace( var_0, var_3, 1, self );
    var_5 = var_4["entity"];

    if ( isdefined( var_5 ) )
        var_4["position"] = var_5.origin;

    return var_4;
}

_id_D1FE()
{
    return common_scripts\utility::flag( "used_laser" );
}

_id_C37B()
{
    return common_scripts\utility::flag( "used_laser_attack" ) || !level.player.laserforceon;
}

_id_CFEC()
{
    return common_scripts\utility::flag( "used_laser_golf" );
}

_id_B337( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( var_5.script_group == var_1 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

laser_artillery( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    common_scripts\utility::flag_set( "used_laser_golf" );
    maps\_utility::flavorbursts_off( "allies" );
    level._id_C240[var_0] = 1;
    var_2 = undefined;

    if ( var_0 == 0 )
    {
        common_scripts\utility::flag_set( "lazed_targets_0" );
        level.player thread maps\_utility::play_sound_on_entity( "wpn_plr_laser_target_acquired" );
        var_2 = getent( "artillery_soundent_0", "targetname" );

        if ( !var_1 )
            thread maps\_utility::radio_dialogue( "arcadia_art_missionrec" );
    }

    if ( var_0 == 1 )
    {
        common_scripts\utility::flag_set( "lazed_targets_1" );
        level.player thread maps\_utility::play_sound_on_entity( "wpn_plr_laser_target_acquired" );
        var_2 = getent( "artillery_soundent_1", "targetname" );

        if ( !var_1 )
            thread maps\_utility::radio_dialogue( "arcadia_art_confirmed" );
    }

    if ( common_scripts\utility::flag( "lazed_targets_0" ) && common_scripts\utility::flag( "lazed_targets_1" ) )
        level notify( "stop_laze_golf_course_dialog" );

    var_3[0] = 4;
    var_3[1] = 4;

    if ( !var_1 )
    {
        wait(var_3[var_0]);
        wait 3;
    }

    common_scripts\_exploder::exploder( var_0 );
    wait 1;
    playrumbleonposition( "arcadia_artillery_rumble", var_2.origin );
    var_4 = _id_B337( "golf_before", var_0 );
    common_scripts\utility::array_call( var_4, ::hide );
    var_5 = _id_B337( "golf_after", var_0 );
    common_scripts\utility::array_call( var_5, ::show );

    if ( var_0 == 0 )
    {
        common_scripts\utility::flag_set( "stealth_bombed_0" );
        objective_additionalposition( 0, 0, ( 0.0, 0.0, 0.0 ) );
    }

    if ( var_0 == 1 )
    {
        common_scripts\utility::flag_set( "stealth_bombed_1" );
        objective_additionalposition( 0, 1, ( 0.0, 0.0, 0.0 ) );
    }
}

_id_BEF5()
{
    thread _id_B568();
    common_scripts\utility::flag_wait( "golf_course_battle" );
    level._id_C7A3 connectpaths();
    level._id_C7A3 delete();
    thread maps\arcadia::_id_CAD9();
    thread _id_BAC6();
    level.player thread maps\_utility::waterfx();
    common_scripts\utility::array_thread( getentarray( "golf_course_enemy_spawner", "targetname" ), ::_id_C4B0 );
}

_id_BAC6()
{
    level endon( "second_bridge" );
    level endon( "stop_laze_golf_course_dialog" );

    for (;;)
    {
        level.foley maps\_utility::dialogue_queue( "arcadia_fly_laserdes" );
        wait 20;
        level.foley maps\_utility::dialogue_queue( "arcadia_fly_callartillery" );
        wait 20;
    }
}

_id_B568()
{
    common_scripts\utility::flag_wait( "golf_course_vehicles" );
    var_0 = maps\_utility::getvehiclespawnerarray( "golf_course_vehicle" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 maps\_utility::spawn_vehicle();
        var_3.targets = var_2 common_scripts\utility::get_linked_ents();

        if ( var_3.vehicletype == "bmp" )
            var_3 thread _id_B397();

        var_3 thread _id_D075();
    }

    common_scripts\utility::array_thread( getentarray( "golf_course_zpu", "targetname" ), ::_id_AF92 );
}

_id_D075()
{
    var_0 = "stealth_bombed_" + self.script_group;
    common_scripts\utility::flag_wait( var_0 );
    wait 1;

    if ( isalive( self ) )
        self kill();

    if ( isdefined( self ) )
        self notify( "death" );
}

_id_B6F1()
{
    var_0 = getentarray( "fake_golf_course_chopper", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 hide();

    common_scripts\utility::flag_wait( "golf_course_vehicles" );
    thread _id_BAF9();
    var_4 = 27.0833;
    level endon( "delete_all_fake_choppers" );
    var_5 = 0;
    var_6 = randomintrange( 8, 16 );

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        foreach ( var_2 in var_0 )
        {
            var_8 = common_scripts\utility::getstruct( var_2.target, "targetname" );
            var_2 thread _id_C9B5( var_4, var_8.origin );
            var_5++;

            if ( var_5 >= var_6 )
            {
                var_5 = 0;
                var_6 = randomintrange( 8, 16 );
                wait(randomfloatrange( 24.0, 34.0 ));
                continue;
            }

            wait(randomfloatrange( 0.5, 1.5 ));
        }
    }
}

_id_BAF9()
{
    common_scripts\utility::flag_wait( "golf_course_vehicles_stop" );
    level notify( "delete_all_fake_choppers" );
}

_id_AF92()
{
    var_0 = self.script_group;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = getentarray( self.target, "targetname" );

    foreach ( var_5 in var_3 )
    {
        if ( issubstr( var_5.classname, "actor" ) )
        {
            var_1 = var_5;
            continue;
        }

        if ( issubstr( var_5.classname, "trigger" ) )
            var_2 = var_5;
    }

    var_7 = var_1 maps\_utility::spawn_ai();
    var_7.animname = "zpu_gunner";
    var_8 = maps\_utility::spawn_anim_model( "zpu_turret", self.origin );
    var_8.angles = self.angles;
    var_8.script_group = var_0;
    self delete();
    var_7 linkto( var_8, "tag_driver" );
    thread _id_C3A1( var_8, var_7, var_2 );
    thread _id_CBDE( var_8, var_7, var_2 );

    if ( isdefined( var_2 ) )
        thread _id_CEEB( var_8, var_7, var_2 );

    var_8 thread _id_D075();
    var_8 endon( "death" );
    var_7 endon( "death" );
    var_8 endon( "stop_shooting" );
    var_7 endon( "stop_shooting" );
    var_9 = undefined;

    for (;;)
    {
        var_10 = "fire_a";

        if ( common_scripts\utility::cointoss() )
            var_10 = "fire_b";

        if ( !isdefined( var_9 ) || var_9 != var_10 )
        {
            var_8 notify( "stop_fire_loop" );
            waittillframeend;
            var_8 thread maps\_anim::anim_loop_solo( var_7, var_10, "stop_fire_loop", "tag_driver" );
            var_8 thread maps\_anim::anim_loop_solo( var_8, var_10, "stop_fire_loop" );
            wait(getanimlength( var_8 maps\_utility::getanim( var_10 )[0] ));
        }

        var_9 = var_10;
    }
}

_id_C3A1( var_0, var_1, var_2 )
{
    var_0 waittill( "death" );
    _id_C092( var_0, var_1 );
    thread common_scripts\utility::play_sound_in_space( "exp_armor_vehicle", var_0.origin );
    var_0 setmodel( "vehicle_zpu4_burn" );
}

_id_CBDE( var_0, var_1, var_2 )
{
    var_1 endon( "dismount" );
    var_1 waittill( "damage_notdone" );
    _id_C092( var_0, var_1 );
    var_0 maps\_anim::anim_single_solo( var_1, "gunnerdeath", "tag_driver" );
    var_0 thread maps\_anim::anim_loop_solo( var_1, "death_idle", "stop_death_loop", "tag_driver" );
}

_id_CEEB( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_1 endon( "death" );
    var_2 waittill( "trigger" );
    var_1 notify( "dismount" );
    _id_C092( var_0, var_1 );
    var_1.allowdeath = 1;
    var_1.noragdoll = 1;
    var_1 unlink();
    var_0 maps\_anim::anim_single_solo( var_1, "dismount", "tag_driver" );
}

_id_C092( var_0, var_1 )
{
    var_0 notify( "stop_shooting" );
    var_0 notify( "stop_fire_loop" );
    var_0 maps\_utility::anim_stopanimscripted();
    var_0 playrumbleonentity();

    if ( isalive( var_1 ) )
    {
        var_1 notify( "stop_shooting" );
        var_1 notify( "stop_fire_loop" );
        var_1 maps\_utility::anim_stopanimscripted();
    }

    var_0 setanim( level.scr_anim[var_0.animname]["idle"], 1.0, 0, 1 );
}

_id_B40A( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "zpu_muzzle" ), var_0, "tag_flash" );
    playfxontag( common_scripts\utility::getfx( "zpu_muzzle" ), var_0, "tag_flash2" );
    var_0 playsound( "zpu_fire1" );
}

_id_C2F7( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "zpu_muzzle" ), var_0, "tag_flash1" );
    playfxontag( common_scripts\utility::getfx( "zpu_muzzle" ), var_0, "tag_flash3" );
    var_0 playsound( "zpu_fire2" );
}

_id_B397()
{
    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "bmp" )
        level._id_BA28 = self;

    self endon( "death" );
    self endon( "attacking_player" );

    for (;;)
    {
        self setturrettargetvec( self.targets[randomint( self.targets.size )].origin );
        wait(randomfloatrange( 0.5, 1.5 ));
        var_0 = randomintrange( 2, 7 );

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            self fireweapon();
            wait 0.3;
        }
    }
}

_id_C4B0()
{
    var_0 = maps\_utility::spawn_ai( 1 );

    if ( !isdefined( var_0 ) || !isalive( var_0 ) )
        return;

    var_0.goalradius = 16;
    var_0 endon( "death" );
    var_1 = getnode( self.target, "targetname" );
    var_0 setgoalnode( var_1 );
    var_2 = getentarray( "golf_enemy_target", "targetname" );
    var_0 setentitytarget( var_2[randomint( var_2.size )] );

    if ( !isdefined( var_1.target ) )
        return;

    var_3 = getnode( var_1.target, "targetname" );
    wait(randomfloatrange( 9.0, 11.0 ));
    var_0 setgoalnode( var_3 );
}

_id_BE2E()
{
    common_scripts\utility::flag_wait( "crashing_c130" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "c130_spawner" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_arcadia_c130_goingdown" );
    soundscripts\_snd::snd_message( "start_crash_mix", "c130_sequence_started" );
    thread _id_AD20();
    thread _id_B996( var_0 );
}

_id_B996( var_0 )
{
    playfxontag( level._effect["c130_engine_crashing"], var_0, "tag_prop_l_1" );
    playfxontag( level._effect["c130_engine_crashing"], var_0, "tag_prop_r_2" );
    wait 6.8;
    earthquake( 0.2, 0.25, var_0.origin, 8000 );
    playfxontag( level._effect["c130_engine_explosion"], var_0, "tag_prop_l_1" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_arcadia_c130_explosions" );
    wait 1.2;
    earthquake( 0.18, 0.25, var_0.origin, 8000 );
    playfxontag( level._effect["c130_engine_explosion_sml"], var_0, "tag_light_belly" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_arcadia_c130_explosions" );
    wait 2.1;
    earthquake( 0.18, 0.25, var_0.origin, 8000 );
    playfxontag( level._effect["c130_engine_explosion_sml"], var_0, "tag_light_top" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_arcadia_c130_explosions" );
    wait 2.0;
    common_scripts\_exploder::exploder( "c130_crash_impact" );
    common_scripts\_exploder::exploder( "c130_crash_leftovers" );
    wait 0.35;
    earthquake( 0.45, 0.7, var_0.origin, 15000 );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_arcadia_c130_crash" );
    soundscripts\_snd::snd_message( "clear_crash_mix", "c130_sequence_started" );
}

_id_AD20()
{
    var_0 = ( 13635.8, -6606.73, 2825.83 );
    var_1 = ( 270.0, 114.597, 5.40301 );
    var_2 = "airplane_crash_smoke_sun_blocker";
    wait 4;

    for (;;)
    {
        var_3 = spawn( "script_model", var_0 );
        var_3.angles = var_1;
        var_3 setmodel( "tag_origin" );
        playfxontag( common_scripts\utility::getfx( var_2 ), var_3, "tag_origin" );
        common_scripts\utility::flag_wait( "remove_sun_blocker" );
        var_3 delete();
        common_scripts\utility::flag_waitopen( "remove_sun_blocker" );
    }
}

harriers()
{
    common_scripts\utility::flag_wait( "harriers_spawn" );
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname( "harrier" );

    foreach ( var_2 in var_0 )
    {
        var_2 setgoalyaw( var_2.angles[1] );
        var_2 setvehgoalpos( var_2.origin, 1 );
        var_2 maps\_vehicle::godon();
        var_2 sethoverparams( randomintrange( 80, 120 ), randomintrange( 50, 80 ), randomintrange( 10, 20 ) );
        var_2 thread maps\arcadia_aud::_id_BE8B();
    }

    common_scripts\utility::flag_wait( "harriers_move" );

    foreach ( var_5, var_2 in var_0 )
    {
        thread maps\_vehicle::gopath( var_2 );
        var_2 thread maps\arcadia_aud::_id_C1B8();
        var_2 thread _id_C3A5( var_5 + 2 );
        wait 2.0;
    }
}

_id_C3A5( var_0 )
{
    wait 15;

    if ( !isalive( self ) )
        return;

    self setvehweapon( "harrier_FFAR" );
    var_1[0] = "tag_right_alamo_missile";
    var_1[1] = "tag_left_alamo_missile";
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        self fireweapon( var_1[var_2], undefined, ( 0.0, 0.0, -250.0 ) );
        var_2++;

        if ( var_2 >= var_1.size )
            var_2 = 0;

        wait 0.4;
    }
}

_id_B4F3()
{
    var_0 = [];
    var_1 = getentarray( self.target, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 notsolid();
        var_3.origin -= ( 0.0, 0.0, 1024.0 );
        var_0[var_0.size] = "vehicle_bad_place_brush_" + var_3 getentitynumber();
    }

    var_5 = [ level.foley, level._id_ACC0 ];

    for (;;)
    {
        self waittill( "trigger", var_6 );

        if ( !isalive( level._id_C7A3 ) )
            return;

        if ( !isdefined( var_6 ) )
            continue;

        if ( var_6 != level._id_C7A3 )
            continue;

        if ( var_6 vehicle_getspeed() == 0 )
            continue;

        foreach ( var_11, var_3 in var_1 )
        {
            if ( !isdefined( var_3._id_ACDE ) )
            {
                var_3 solid();
                badplace_brush( var_0[var_11], 0, var_3, "allies", "axis" );

                foreach ( var_9 in var_5 )
                {
                    if ( var_3 istouching( var_9 ) )
                        thread ai_leave_badplace_zone( var_9, var_3 );
                }

                var_3 notsolid();
                var_3._id_ACDE = 1;
            }

            thread _id_BE37( var_3, var_0[var_11] );
        }
    }
}

ai_leave_badplace_zone( var_0, var_1 )
{
    if ( !isdefined( var_0.leavebadplacezonecount ) )
        var_0.leavebadplacezonecount = 1;
    else
        var_0.leavebadplacezonecount += 1;

    var_0.ignoresuppression = 1;
    var_0.allowpain = 0;
    var_0.a.disablepain = 1;

    while ( isdefined( var_1 ) && var_1 istouching( var_0 ) )
        waitframe();

    var_0.leavebadplacezonecount -= 1;

    if ( var_0.leavebadplacezonecount > 0 )
        return;

    var_0.ignoresuppression = 0;
    var_0.a.disablepain = 0;
    var_0.allowpain = 1;
}

_id_BE37( var_0, var_1 )
{
    var_0 notify( "waiting_for_path_reconnection" );
    var_0 endon( "waiting_for_path_reconnection" );
    wait 0.5;
    var_0 solid();
    badplace_delete( var_1 );
    var_0 notsolid();
    var_0._id_ACDE = undefined;
}

_id_CA47()
{
    self endon( "death" );
    self.death_fx_on_self = 1;
    thread maps\arcadia_aud::_id_C0E4();
    wait 7;
    var_0 = getent( "evac_chopper_1_rpg", "targetname" );
    var_1 = distance( var_0.origin, self.origin );
    var_1 *= 1.2;
    missile_createattractorent( self, 100000, var_1 );
    var_2 = magicbullet( "rpg_straight", var_0.origin, self.origin );
    var_2 thread maps\_utility::play_sound_on_entity( "scn_rpg_shoot_01" );
    self waittill( "damage" );

    if ( isalive( self ) )
        self kill();
}

_id_D406()
{
    common_scripts\utility::flag_wait( "civilian_car" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "civilian_car" );
    var_0 endon( "death" );
    var_0 thread maps\arcadia_aud::_id_BB79();
    var_0 thread _id_AF71();
    var_1 = getent( "civilian_car_clip", "targetname" );
    badplace_brush( "civilian_car_badplace", 12, var_1, "allies", "axis" );
    var_0 waittill( "reached_end_node" );
    var_0 dodamage( 500000, var_0.origin, level.player );
}

_id_AF71()
{
    var_0 = getent( "civilian_car_dummy", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_1 linkto( var_0 );
    var_2[0] = getent( "civilian_car_luggage_1", "targetname" );
    var_2[1] = getent( "civilian_car_luggage_2", "targetname" );
    var_2[2] = getent( "civilian_car_luggage_3", "targetname" );
    var_2[3] = getent( "civilian_car_luggage_4", "targetname" );
    var_2[4] = getent( "civilian_car_luggage_5", "targetname" );
    var_2[5] = getent( "civilian_car_luggage_6", "targetname" );

    foreach ( var_4 in var_2 )
        var_4 linkto( var_0 );

    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_0 linkto( self );
    wait 6;
    var_6 = vectornormalize( var_1.origin - var_0.origin );

    foreach ( var_4 in var_2 )
    {
        wait(randomfloatrange( 0.05, 0.15 ));
        var_4 unlink();
        var_8 = randomfloatrange( 1500, 2500 );
        var_4 physicslaunchclient( var_4.origin, var_6 * var_8 );
    }

    var_0 delete();
    var_1 delete();
}

parked_civilian_car_lighting()
{
    var_0 = getent( "parked_car", "script_noteworthy" );
    var_1 = getent( "parked_car_light_org", "targetname" );

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
        var_0 _meth_848A( var_1.origin );
}

_id_C8E7()
{
    var_0 = self.health - self.healthbuffer;
    thread _id_B075( var_0 * 0.75, "smoke_1", level._effect["damaged_wheel_smoke"], "left_wheel_08_jnt", ( 105.0, -50.0, -25.0 ), ( 0.0, 180.0, 0.0 ) );
    thread _id_B075( var_0 * 0.45, "smoke_3", level._effect["badger_dmg_smk"], "tag_playerride", ( 30.0, -12.0, -5.0 ), ( -20.0, 260.0, 0.0 ) );
}

_id_B075( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "death" );
    maps\_utility::ent_flag_init( var_1 );

    for (;;)
    {
        self waittill( "damage" );
        var_6 = self.health - self.healthbuffer;

        if ( var_6 <= var_0 && !maps\_utility::ent_flag( var_1 ) )
        {
            maps\_utility::ent_flag_set( var_1 );
            common_scripts\utility::_id_C203( var_2, self, var_3, var_4, var_5 );
            break;
        }
    }
}

_id_BDAC()
{
    self waittill( "trigger" );
    var_0 = getent( self.target, "targetname" );
    var_1 = getaiarray( "axis" );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( !var_4 istouching( var_0 ) )
            continue;

        var_2[var_2.size] = var_4;
    }

    if ( var_2.size == 0 )
        return;

    common_scripts\utility::array_thread( var_2, ::_id_CC7C );
}

_id_CC7C()
{
    self endon( "death" );
    wait(randomfloatrange( 0, 1.0 ));

    if ( isalive( self ) )
        self delete();
}

_id_B103()
{
    var_0 = undefined;

    if ( issubstr( self.classname, "trigger" ) )
    {
        self waittill( "trigger" );
        var_0 = getent( self.target, "targetname" );
    }
    else
    {
        wait 6;
        var_0 = self;
    }

    for (;;)
    {
        if ( isdefined( level._id_C7A3 ) )
        {
            var_1 = magicbullet( "rpg_straight", var_0.origin, level._id_C7A3.origin + ( 0.0, 0.0, 60.0 ) );
            var_1 thread maps\arcadia_aud::_id_CC48();

            if ( !isdefined( var_0.target ) )
                return;

            var_0 = getent( var_0.target, "targetname" );
        }

        wait(randomfloatrange( 1.0, 2.0 ));
    }
}

_id_B39A()
{
    self notify( "ai_avoid_stryker" );
    self endon( "ai_avoid_stryker" );
    self endon( "death" );
    var_0 = cos( 90 );
    var_1 = 160000;

    for (;;)
    {
        wait 0.2;

        if ( !isalive( level._id_C7A3 ) )
            break;

        if ( common_scripts\utility::flag( "disable_friendly_move_checks" ) )
            break;

        var_2 = distancesquared( self.origin, level._id_C7A3.origin ) <= var_1;
        var_3 = common_scripts\utility::within_fov( self.origin, self.angles, level._id_C7A3.origin, var_0 );

        if ( var_2 && var_3 )
        {
            maps\_utility::cqb_walk( "on" );
            continue;
        }

        maps\_utility::cqb_walk( "off" );
    }

    maps\_utility::cqb_walk( "off" );
}

pool()
{
    var_0 = getent( "pool", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isplayer( var_1 ) )
            continue;

        while ( var_1 istouching( var_0 ) )
        {
            var_1 setmovespeedscale( 0.3 );
            var_1 allowstand( 1 );
            var_1 allowcrouch( 0 );
            var_1 allowprone( 0 );
            wait 0.1;
        }

        var_1 setmovespeedscale( 1 );
        var_1 allowstand( 1 );
        var_1 allowcrouch( 1 );
        var_1 allowprone( 1 );
    }
}

_id_C994()
{
    wait 0.05;
    common_scripts\utility::flag_wait( "all_enemies_low_health" );
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
            var_2.health = 1;
    }
}

_id_AE7E()
{
    common_scripts\utility::flag_wait( "foley_purple" );
    level.foley thread maps\_utility::set_force_color( "p" );
    common_scripts\utility::flag_waitopen( "foley_purple" );
    level.foley thread maps\_utility::set_force_color( "g" );
}

_id_D3D2()
{
    level._id_C7A3 endon( "death" );
    var_0 = cos( 35 );
    var_1 = 0;

    while ( isalive( level._id_C7A3 ) )
    {
        wait 0.1;
        var_2 = level._id_C7A3 vehicle_getspeed();

        if ( var_2 <= 1 )
            continue;

        if ( common_scripts\utility::flag( "disable_stryker_dialog" ) || _func_1FB() )
            continue;

        var_3 = distance( level.player.origin, level._id_C7A3.origin );

        if ( var_3 > 450 )
            continue;

        var_4 = common_scripts\utility::within_fov( level._id_C7A3.origin, level._id_C7A3.angles, level.player.origin, var_0 );

        if ( !var_4 )
            continue;

        if ( var_1 == 0 )
        {
            var_1 = 1;
            level.foley maps\_utility::dialogue_queue( "arcadia_fly_getrunover" );
        }
        else
        {
            var_1 = 0;
            level._id_ACC0 maps\_utility::dialogue_queue( "arcadia_cpd_getoutta" );
        }

        wait 3;
    }
}

_id_C322( var_0 )
{
    self endon( "trigger" );
    common_scripts\utility::flag_wait( var_0 );
    thread maps\_utility::activate_trigger_process( level.player );
}

_id_CDC6()
{
    common_scripts\utility::trigger_off( "friendly_trigger_at_artillery", "script_noteworthy" );
    common_scripts\utility::flag_wait( "stealth_bombed_1" );
    common_scripts\utility::trigger_on( "friendly_trigger_at_artillery", "script_noteworthy" );
}

_id_B8FB()
{
    level endon( "stealth_bombed_1" );
    common_scripts\utility::flag_wait( "bmp_kills_player" );

    if ( !isdefined( level._id_BA28 ) )
        return;

    level._id_BA28 endon( "death" );
    level._id_BA28 notify( "attacking_player" );

    for (;;)
    {
        level._id_BA28 setturrettargetent( level.player, ( 0.0, 0.0, 20.0 ) );
        wait(randomfloatrange( 0.5, 1.5 ));
        var_0 = randomintrange( 8, 15 );

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            level._id_BA28 fireweapon();
            wait 0.2;
        }
    }
}

_id_CF63()
{
    level endon( "stealth_bombed_1" );
    common_scripts\utility::flag_wait( "bmp_force_kills_player" );
    level.player kill();
}

_id_B6FE()
{
    level endon( "stealth_bombed_0" );
    common_scripts\utility::flag_wait( "force_artillery_0" );
    thread laser_artillery( 0, 1 );
}

_id_B0C8()
{
    common_scripts\utility::flag_wait( "honey_badger_threats_dead_1" );

    if ( common_scripts\utility::flag( "disable_stryker_dialog" ) || _func_1FB() )
        return;

    thread maps\_utility::radio_dialogue( "arcadia_str_thanks" );
}

_id_CFA4()
{
    common_scripts\utility::flag_wait( "honey_badger_threats_dead_2" );

    if ( common_scripts\utility::flag( "disable_stryker_dialog" ) || _func_1FB() )
        return;

    thread maps\_utility::radio_dialogue( "arcadia_str_nicework" );
}

_id_AAEE( var_0 )
{
    if ( getdvarint( "r_arcadia_culldist" ) == 0 )
        return;

    setculldist( var_0 );
}

portal_group_start_point_initializer()
{
    var_0 = [ "portal_starting_area_flag", "portal_stryker_road_flag", "portal_first_street_flag" ];
    var_1 = [ "portal_starting_area_flag", "portal_stryker_road_flag", "portal_first_street_flag" ];
    var_2 = [ "portal_stryker_road_flag", "portal_golf_road_flag", "portal_first_street_flag", "portal_second_street_flag" ];
    var_3 = [ "portal_golf_road_flag", "portal_plane_crash_flag", "portal_first_street_flag" ];
    var_4 = [ "portal_golf_road_flag", "portal_plane_crash_flag", "portal_first_street_flag" ];
    var_5 = [ "portal_starting_area_flag", "portal_stryker_road_flag", "portal_golf_road_flag", "portal_plane_crash_flag", "portal_first_street_flag", "portal_second_street_flag" ];

    switch ( level.start_point )
    {
        case "street":
            var_6 = var_1;
            break;
        case "checkpoint":
            var_6 = var_2;
            break;
        case "golf":
            var_6 = var_3;
            break;
        case "crash":
            var_6 = var_4;
            break;
        case "no_game":
            var_6 = var_5;
            break;
        default:
            var_6 = var_0;
            break;
    }

    return var_6;
}

initialize_portal_flags()
{
    var_0 = portal_group_start_point_initializer();

    foreach ( var_2 in var_0 )
        common_scripts\utility::flag_set( var_2 );
}

act_as_ambush_combat_for_a_while( var_0, var_1 )
{
    self endon( "death" );
    wait(var_0);
    self.combatmode = "ambush";
    wait(var_1);
    self.combatmode = "cover";
}

static_model_group_setup()
{
    thread static_model_group_think( "portal_first_street_flag", 1 );
    thread static_model_group_think( "portal_second_street_flag", 2 );
    thread static_model_group_think( "portal_golf_road_flag", 3 );
    thread static_model_group_think( "misc_model_group_golf_flag", 4 );
    thread static_model_group_think( "mansions_interior_flag", 5 );
    thread static_model_group_think( "misc_model_group_security_flag", 6 );
}

static_model_group_think( var_0, var_1 )
{
    _func_31C( var_1 );

    for (;;)
    {
        common_scripts\utility::flag_wait( var_0 );
        _func_31B( var_1 );
        common_scripts\utility::flag_waitopen( var_0 );
        _func_31C( var_1 );
    }
}

mansion_ceiling_fans_setup()
{
    level endon( "golf_course_vehicles_stop" );
    common_scripts\utility::flag_wait( "portal_second_street_flag" );
    var_0 = getentarray( "mansion_ceiling_fan", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 rotatevelocity( ( 0.0, 250.0, 0.0 ), 20000 );
}

_id_C3F2()
{
    for (;;)
    {
        self addpitch( 24 );
        wait 0.05;
    }
}

plane_wire_anim_setup()
{
    common_scripts\utility::flag_wait( "golf_course_vehicles_stop" );
    var_0 = getent( "plane_wires", "targetname" );
    var_0 maps\_utility::assign_animtree( "crashed_plane_wires" );
    var_0 thread maps\_anim::anim_loop_solo( var_0, "idle" );
}

mansion_horizontal_lights_setup()
{
    common_scripts\utility::flag_wait( "golf_course_vehicles_stop" );
    var_0 = getentarray( "horizontal_lights", "targetname" );

    foreach ( var_2 in var_0 )
    {
        wait(randomfloat( 2 ));
        var_2 maps\_utility::assign_animtree( "horizontal_lights" );
        var_2 thread maps\_anim::anim_loop_solo( var_2, "idle" );
    }
}

bx_signs_setup()
{
    level endon( "portal_second_street_flag" );
    var_0 = getentarray( "office_sign", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::assign_animtree( "signs" );
        var_2 thread maps\_anim::anim_loop_solo( var_2, "office_sign_idle" );
    }

    var_2 = getent( "bx_realstate_sign", "targetname" );
    var_2 maps\_utility::assign_animtree( "signs" );
    var_2 thread maps\_anim::anim_loop_solo( var_2, "bx_sign_idle" );
    var_2 = getent( "security_sign", "targetname" );
    var_2 maps\_utility::assign_animtree( "signs" );
    var_2 thread maps\_anim::anim_loop_solo( var_2, "security_sign_idle" );
}

plane_crash_culldist_setup()
{
    common_scripts\utility::flag_wait( "golf_course_vehicles_stop" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "crash_culldist_flag" );
        setculldist( 5000 );
        common_scripts\utility::flag_waitopen( "crash_culldist_flag" );
        setculldist( 0 );
    }
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

covered_bridge_exit_manage_allies()
{
    level endon( "golf_course_vehicles" );
    var_0 = getent( "bridge_exit_allies_no_suppress", "targetname" );
    var_0.alliesinzone = [];

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( common_scripts\utility::array_contains( var_0.alliesinzone, var_1 ) )
            continue;

        var_0.alliesinzone[var_0.alliesinzone.size] = var_1;
        var_1.ignoresuppression = 1;

        if ( var_0.alliesinzone.size == 1 )
            var_0 thread covered_bridge_exit_no_suppress();
    }
}

covered_bridge_exit_no_suppress()
{
    while ( self.alliesinzone.size > 0 )
    {
        waitframe();

        for ( var_0 = self.alliesinzone.size - 1; var_0 >= 0; var_0-- )
        {
            var_1 = self.alliesinzone[var_0];

            if ( isalive( var_1 ) && var_1 istouching( self ) )
                continue;

            var_1.ignoresuppression = 0;
            self.alliesinzone[var_0] = self.alliesinzone[self.alliesinzone.size - 1];
            self.alliesinzone[self.alliesinzone.size - 1] = undefined;
        }
    }
}
