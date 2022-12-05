// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" )
    {
        maps\cliffhanger_beautiful_corner::_id_C662();
        return;
    }

    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\cliffhanger_mission_select_cam::_id_C490();
        return;
    }

    var_0 = getentarray();

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( var_2.classname, "trigger_multiple_bcs" ) )
            var_2 delete();
    }

    var_0 = undefined;
    setsaveddvar( "com_cinematicEndInWhite", 1 );
    var_4 = getent( "price", "script_noteworthy" );
    var_4.script_friendname = "Capt. MacTavish";
    level._id_AFD9 = 500;
    level._id_C6AC = 200;
    level._id_B65E = 1;
    level._id_CC42 = 1;
    setsaveddvar( "r_subdomainlimit", 0 );
    setsaveddvar( "vehNotifyHitEntityWithVehContactEvent", 0 );
    _id_C0E7::main();
    maps\cliffhanger_lighting::main();
    _id_AAAF::main();
    setsaveddvar( "r_useLightGridDefaultFXLightingLookup", "1" );
    setsaveddvar( "r_lightGridDefaultFXLightingLookup", "-1519 -29658 1252" );
    setsaveddvar( "fx_cast_shadow", 0 );
    maps\cliffhanger_code::_id_C21D();
    maps\_utility::default_start( ::_id_D17D );
    maps\_utility::add_start( "cave", ::_id_D17D, "With soap", ::_id_C9AE );
    maps\_utility::add_start( "e3", ::_id_D3E6, "E3", ::_id_C9AE );
    maps\_utility::add_start( "climb", ::start_climb, "Icepicks", ::_id_C9AE );
    maps\_utility::add_start( "jump", ::_id_B347, "Make the jump", ::_id_C9AE );
    maps\_utility::add_start( "clifftop", ::_id_AF51, "Learn heartbeat sensor", ::_id_B454 );
    maps\_utility::add_start( "camp", ::_id_B855, "sneak through", ::_id_CCF3 );
    maps\_utility::add_start( "c4", ::_id_D07C, "plant it on the tanks", ::_id_C613 );
    maps\_utility::add_start( "goto_hanger", ::_id_B0DA, "Go there", ::_id_BD73 );
    maps\_utility::add_start( "hangerpath", ::_id_D4AE, "Find it", ::_id_C5D7 );
    maps\_utility::add_start( "hanger", ::_id_CF87, "Be there", ::_id_B469 );
    maps\_utility::add_start( "satellite", ::_id_D3A3, "Got DSM", ::_id_CE5F );
    maps\_utility::add_start( "tarmac", ::_id_B1A4, "escape", ::_id_D104 );
    maps\_utility::add_start( "icepick", maps\cliffhanger_snowmobile::_id_C644, "Watch Soap stab", maps\cliffhanger_snowmobile::_id_CD09 );
    maps\_utility::add_start( "snowmobile", maps\cliffhanger_snowmobile::_id_B606, "Ride it to the finish", maps\cliffhanger_snowmobile::_id_CD09 );
    maps\_utility::add_start( "ending", maps\cliffhanger_snowmobile::_id_B606, "Jump over the cliff", maps\cliffhanger_snowmobile::_id_CD09 );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    thread _id_CFBA();
    maps\cliffhanger_code::_id_C2B0();

    if ( getdvarint( "limited_mode" ) )
        level._id_C9A9 = maps\cliffhanger_code::_id_AB29;

    waittillframeend;

    if ( maps\_utility::is_default_start() || level.start_point == "cave" || level.start_point == "climb" || level.start_point == "jump" || level.start_point == "clifftop" )
        level._id_A87F.greenberet_disabled = 1;

    common_scripts\utility::array_thread( getentarray( "snow_fuel_tank", "script_noteworthy" ), maps\cliffhanger_code::swap_decals_on_propane_tank );
    thread _id_CF02();
}

_id_C9AE()
{
    thread maps\_introscreen::_id_D28C();
    common_scripts\utility::flag_set( "climb_group_flag" );
    var_0 = getentarray( "player_climb", "targetname" );
    var_0 = common_scripts\utility::array_randomize( var_0 );
    var_1 = getvehiclenodearray( "plane_sound", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, vehicle_scripts\_mig29::plane_sound_node );
    var_2 = getvehiclenode( "cliff_plane_sound", "script_noteworthy" );
    var_2 thread maps\cliffhanger_aud::_id_B938();
    common_scripts\_exploder::exploder( 256 );

    foreach ( var_5, var_4 in level.players )
        var_4 thread _id_BB6C::_id_CA71( var_0[var_5].origin, var_0[var_5].angles );

    common_scripts\utility::array_thread( var_0, maps\_utility::self_delete );
    _id_BB6C::_id_BC1E();
}

_id_B454()
{
    level.price pushplayer( 1 );
    level.price.dontchangepushplayer = 1;

    if ( maps\cliffhanger_code::_id_CF75() )
        return;

    common_scripts\utility::flag_set( "climb_group_flag" );
    level.friendlyfiredisabled = 0;
    setsaveddvar( "g_friendlyfiredist", 175 );
    var_0 = common_scripts\utility::getstruct( "price_clifftopstart", "targetname" );
    level.price.moveplaybackrate = 0.6;
    level.price.goalradius = 16;
    maps\_utility::activate_trigger_with_targetname( "price_start_clifftop" );
    maps\_utility::autosave_by_name( "clifftop" );
    maps\cliffhanger_code::tarped_mig_monitor();
    maps\cliffhanger_stealth::_id_CEDC();
    level.price maps\_utility::set_battlechatter( 0 );
    common_scripts\utility::flag_set( "delay_weapon_switch" );
    level._id_A87F.greenberet_disabled = undefined;
    maps\cliffhanger_code::_id_B8D6();
    thread _id_C0C3::weapons_specialfeatures( 1 );
    common_scripts\utility::array_thread( getentarray( "patrollers_1_leftguy", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\cliffhanger_code::_id_D2ED );
    common_scripts\utility::array_thread( getentarray( "patrollers_1_rightguy", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\cliffhanger_code::_id_D2ED );
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "clifftop_patrol2_dead" );
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "clifftop_patrol1_dead" );
    level maps\_utility::add_func( common_scripts\utility::flag_set, "clifftop_area_done" );
    thread maps\_utility::do_wait();
    thread maps\cliffhanger_code::_id_C2E7( "clifftop_patrol1_dead" );
    thread maps\cliffhanger_code::_id_C2E7( "clifftop_patrol2_dead" );
    thread maps\cliffhanger_code::_id_C281();
    thread _id_C9FF();
    level.price.customidleanimset = [];
    level.price.customidleanimset["crouch"] = level.scr_anim["price"]["soap_cliff_crouch_idle"];
    thread maps\cliffhanger_code::_id_B17C();
    thread maps\cliffhanger_code::_id_A920();
    common_scripts\utility::array_thread( getentarray( "clifftop_guys", "targetname" ), maps\_utility::add_spawn_function, maps\cliffhanger_code::_id_D323 );
    common_scripts\utility::flag_init( "player_killed_one_first_two_encounters" );
    common_scripts\utility::array_thread( getentarray( "clifftop_guys", "targetname" ), maps\_utility::add_spawn_function, maps\cliffhanger_code::_id_C635 );
    common_scripts\utility::flag_init( "said_dont_alert_them" );
    common_scripts\utility::flag_init( "said_nicely_done" );
    common_scripts\utility::flag_init( "interupt_first_encounter" );
    common_scripts\utility::flag_init( "first_encounter_dialog_finished" );
    thread maps\cliffhanger_code::_id_AC5C();
    thread maps\cliffhanger_code::_id_B0F6();
    thread maps\cliffhanger_code::_id_D236();
    common_scripts\utility::flag_init( "blizzard_halfway" );
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "airfield_in_sight" );
    level maps\_utility::add_func( maps\cliffhanger_code::_id_C59C );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_init( "said_storm_brewing" );
    common_scripts\utility::flag_init( "player_react_to_storm" );
    thread _id_AD90();
    thread maps\cliffhanger_code::_id_CE6F();
    common_scripts\utility::flag_init( "interupt_second_encounter" );
    common_scripts\utility::flag_init( "second_encounter_dialog_finished" );
    thread maps\cliffhanger_code::_id_B924();
    thread maps\cliffhanger_code::_id_C7AF();
    thread maps\cliffhanger_code::_id_CAE0();
    thread maps\cliffhanger_code::_id_AE06();
    common_scripts\utility::flag_wait( "first_two_guys_in_sight" );
    common_scripts\utility::flag_set( "clifftop_guys_move" );
    maps\_utility::autosave_by_name( "first_encounter" );
    common_scripts\utility::flag_wait( "dialog_take_point" );
}

_id_C9FF()
{
    level.player endon( "stealth_takedown_started" );
    level common_scripts\utility::waittill_any( "clifftop_patrol1_dead", "clifftop_patrol_alerted" );

    if ( !common_scripts\utility::flag( "mig_landing" ) )
        common_scripts\utility::flag_set( "mig_landing" );
}

_id_AD90()
{
    common_scripts\utility::flag_wait( "player_react_to_storm" );
    wait 0.5;
    maps\cliffhanger_code::_id_CBA0( "on" );
}

_id_CCF3()
{
    maps\_utility::autosave_stealth();
    thread maps\cliffhanger_code::_id_C5A5();
    thread maps\cliffhanger_stealth::_id_CFE8();
    maps\_utility::player_speed_percent( 90, 2 );
    thread maps\cliffhanger_code::_id_C2E7( "give_c4_obj" );
    thread maps\cliffhanger_stealth::_id_B68B();
}

_id_C613()
{
    thread maps\cliffhanger_code::_id_AE28();
    thread maps\cliffhanger_code::_id_AE79();
    common_scripts\utility::array_thread( getentarray( "base_c4_models", "targetname" ), maps\cliffhanger_code::_id_B0BC );
    common_scripts\utility::flag_wait( "player_halfway_to_c4" );
    maps\_utility::autosave_stealth();
    thread maps\cliffhanger_code::_id_C966();
    thread maps\cliffhanger_code::_id_CE4F();
    thread _id_B3DF();
    common_scripts\utility::flag_wait( "one_c4_planted" );
    maps\_utility::autosave_stealth();
}

_id_BD73()
{
    level maps\_utility::add_wait( maps\cliffhanger_code::_id_BA2C );
    level maps\_utility::add_func( common_scripts\utility::flag_set, "price_moving_to_hanger" );
    thread maps\_utility::do_wait();
    thread maps\cliffhanger_code::_id_C078();
    thread maps\cliffhanger_code::_id_C2E7( "player_halfway_to_hanger" );
    thread maps\_utility::player_speed_percent( 90, 2 );
    common_scripts\utility::flag_wait( "starting_hanger_backdoor_path" );
    thread _id_A9AE();
    thread _id_B51D();
}

_id_C5D7()
{
    common_scripts\utility::flag_set( "price_moving_to_hanger" );
    level.price maps\_utility::stop_magic_bullet_shield();
    level.price delete();
    var_0 = getent( "price_hanger_start", "targetname" );
    level._id_B8ED.script_stealth = undefined;
    level._id_B8ED.origin = var_0.origin;
    level.price = maps\cliffhanger_code::_id_B119();
    level.price maps\_utility::disable_ai_color();
    level.price maps\_utility::forceuseweapon( "ak47_arctic", "primary" );
    // level.price maps\cliffhanger_code::setheadmodel( "head_hero_soap_arctic_interior" );
    maps\_utility::autosave_stealth();
    var_1 = getent( "soap_waiting_node", "targetname" );
    var_1 thread maps\_anim::anim_loop_solo( level.price, "hangar_waiting_loop", "stop_loop" );
    maps\_utility::player_speed_percent( 90, 2 );
    common_scripts\utility::flag_wait( "player_on_backdoor_path" );
    var_1 notify( "stop_loop" );
    thread maps\cliffhanger_code::_id_BD9B();
    var_2 = getaispeciesarray( "axis", "all" );
    var_3 = maps\_utility::get_living_ai( "welder_wing", "script_noteworthy" );

    if ( isalive( var_3 ) )
        var_2 = common_scripts\utility::array_remove( var_2, var_3 );

    var_4 = maps\_utility::get_living_ai( "welder_engine", "script_noteworthy" );

    if ( isalive( var_4 ) )
        var_2 = common_scripts\utility::array_remove( var_2, var_4 );

    if ( isalive( level._id_BCD4 ) )
        level._id_BCD4 vehicle_setspeed( 0, 15 );

    common_scripts\utility::flag_set( "script_attack_override" );
    common_scripts\utility::flag_set( "done_with_stealth_camp" );
    var_5 = level.price;
    var_5 maps\_utility::disable_ai_color();
    var_6 = getnode( "price_behind_barrel", "targetname" );
    var_5 setgoalnode( var_6 );
    var_5.goalradius = 20;
    var_5.fixednode = 1;
    var_7 = [];

    foreach ( var_9 in var_2 )
    {
        var_10 = distance( var_9.origin, level.player.origin );

        if ( var_10 > 1000 )
        {
            var_9 delete();
            continue;
        }

        if ( isdefined( var_9.ridingvehicle ) )
        {
            var_9 delete();
            continue;
        }

        var_7[var_7.size] = var_9;
    }

    maps\_stealth_utility::disable_stealth_system();

    if ( var_7.size > 0 )
    {
        foreach ( var_9 in var_7 )
            var_9 thread maps\cliffhanger_code::_id_AECB();

        for (;;)
        {
            var_14 = 1;

            foreach ( var_9 in var_7 )
            {
                if ( isalive( var_9 ) )
                {
                    if ( var_9 maps\_utility::doinglongdeath() )
                        continue;

                    var_9.goalradius = 400;
                    var_9.favoriteenemy = level.player;
                    var_9 setgoalentity( level.player );
                    var_14 = 0;
                }
            }

            if ( var_14 )
                break;
            else
            {
                if ( common_scripts\utility::flag( "player_on_backdoor_path" ) )
                    common_scripts\utility::flag_set( "brought_friends" );

                wait 1;
            }
        }
    }
}

_id_B469()
{
    common_scripts\utility::flag_wait( "player_on_backdoor_path" );

    if ( common_scripts\utility::flag( "brought_friends" ) )
        level.price maps\cliffhanger_code::_id_AD56( "cliff_pri_broughtfriends", 0, 1 );
    else
    {
        level.price _id_B3AB::_id_BEBA( "head", level.player, 200, 30, 30, 30, 45, 0, 1 );
        var_0 = getent( "soap_waiting_node", "targetname" );
        var_0 maps\_anim::anim_single_solo( level.price, "hangar_waiting" );
        level.price _id_B3AB::_id_B0AC();
        var_0 maps\_anim::anim_first_frame_solo( level.price, "hunted_open_barndoor" );
    }

    for (;;)
    {
        if ( distance( level.player.origin, level.price.origin ) < 350 )
            break;

        wait 0.25;
    }

    var_1 = getent( "locker_brawl", "targetname" );
    var_2 = getent( "hangar_satellite", "targetname" );
    var_2 maps\_utility::assign_animtree( "satellite" );
    var_1 thread maps\_anim::anim_loop_solo( var_2, "satellite_loop", "satellite_stop" );
    maps\cliffhanger_code::_id_CD21();
    var_3 = getent( "solar_panel", "targetname" );
    var_3 _meth_848A( ( -8860.0, -25895.0, 950.0 ) );
    level.player thread maps\cliffhanger_code::_id_C622();
    var_4 = getnode( "price_prep_for_locker_brawl_node", "targetname" );
    wait 0.05;
    level.price setgoalnode( var_4 );
    level.price.goalradius = 8;
    level.price maps\_utility::disable_ai_color();
    level.price maps\_utility::forceuseweapon( "ak47_arctic", "primary" );
    common_scripts\utility::flag_clear( "locker_brawl_breaks_out" );
    common_scripts\utility::flag_wait( "locker_brawl_breaks_out" );
    maps\cliffhanger_code::_id_B8C9();
    thread maps\cliffhanger_code::_id_C769( var_2 );
    wait 2;
    var_5 = maps\_utility::getentwithflag( "keyboard_used" );
    var_5 common_scripts\utility::trigger_off();
    maps\_utility::player_speed_percent( 100, 2 );
    level.price maps\_utility::enable_cqbwalk();
    common_scripts\utility::flag_wait( "player_in_hanger" );
    thread error_screen();
    wait 2;
    common_scripts\utility::flag_set( "cliffhanger_soap_told_player_to_go_upstairs" );
    thread maps\cliffhanger_code::_id_CF26();
    var_6 = getent( "dsm", "targetname" );
    var_6 makeusable();
    var_6 thread common_scripts\utility::_id_AE1E( level.player, &"CLIFFHANGER_USE_SATELITE", &"CLIFFHANGER_USE_SATELITE_PC", "trigger" );
    common_scripts\utility::flag_clear( "keyboard_used" );
    var_6 waittill( "trigger" );
    var_6 makeunusable();
    var_7 = getent( "acs_node", "targetname" );
    var_7 notify( "start_anims" );
    common_scripts\utility::flag_wait( "acs_picked_up" );

    if ( maps\_autosave::autosavecheck() )
        savegame( "keyboard_used", &"CLIFFHANGER_USE_SATELITE", "keyboard_used", 0 );

    thread common_scripts\utility::play_sound_in_space( "dsm_pickup", var_6.origin );
    common_scripts\utility::flag_set( "keyboard_used" );
    level.price _id_B3AB::_id_B0AC();
    var_5 delete();
    wait 2.2;
}

_id_D3A3()
{
    soundscripts\_snd::snd_message( "start_satellite_checkpoint" );
    common_scripts\utility::flag_set( "done_with_stealth_camp" );
    common_scripts\utility::flag_set( "base_c4_price_done" );
    common_scripts\utility::flag_set( "price_moving_to_hanger" );
    _id_B358();
    maps\cliffhanger_stealth::_id_AA79();
    var_0 = getent( "start_satellite_player", "targetname" );
    level.player maps\_utility::teleport_ent( var_0 );
    var_1 = getent( "price_hanger_start", "targetname" );
    level.price forceteleport( var_1.origin, var_1.angles );
    level.price maps\_utility::forceuseweapon( "ak47_arctic", "primary" );
    _id_C0CF::_id_BBE8();
    thread maps\cliffhanger_code::_id_A835();
    common_scripts\utility::flag_set( "player_in_hanger" );
    common_scripts\utility::flag_set( "reached_top" );
}

error_screen()
{
    level endon( "player_slides_down_hill" );
    var_0 = getent( "error_screen", "targetname" );
    var_0 hide();
    var_0.is_visible = 0;
    common_scripts\utility::flag_wait( "acs_picked_up" );

    for (;;)
    {
        if ( isdefined( var_0.is_visible ) && var_0.is_visible )
        {
            var_0 hide();
            var_0.is_visible = 0;
        }
        else
        {
            var_0 show();
            var_0.is_visible = 1;
        }

        wait 1;
    }
}

_id_CE5F()
{
    common_scripts\utility::flag_set( "start_busted_music" );
    thread maps\cliffhanger_code::_id_C134();
    thread maps\cliffhanger_code::_id_CCF7();
    thread maps\cliffhanger_code::_id_CD50();
    setsaveddvar( "r_corpseRemovalThreshold", "0.75" );
    var_0 = getscriptablearray( "hangar_lamp", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setscriptablepartstate( 0, 1 );

    common_scripts\_exploder::exploder( 333 );

    if ( isdefined( level.price._stealth ) )
        level.price maps\_stealth_utility::stealth_basic_states_default();

    maps\_stealth_utility::disable_stealth_system();
    level.player.ignoreme = 1;
    thread maps\cliffhanger_code::_id_AB4C();
    maps\cliffhanger_code::_id_C360();
    level.player.ignoreme = 0;
    common_scripts\utility::flag_wait( "player_detonate" );
    var_4 = savegamenocommit( "player_detonate", &"CLIFFHANGER_USE_SATELITE", "player_detonate", 0 );
    thread maps\cliffhanger_code::_id_C6C8( var_4 );
    wait 0.1;
    level._id_CD65 = getaiarray( "axis" );
    common_scripts\utility::flag_set( "start_big_explosion" );
    maps\_utility::delaythread( 1, common_scripts\utility::flag_set, "hanger_reinforcements" );
    level.player setmovespeedscale( 0.3 );
    level.player common_scripts\utility::delaycall( 1.5, ::freezecontrols, 0 );
    thread maps\cliffhanger_code::_id_BBE6();
    thread maps\cliffhanger_code::_id_C01E();
    thread maps\cliffhanger_code::_id_D38A();
}

_id_B1A4( var_0 )
{
    soundscripts\_snd::snd_message( "start_tarmac_checkpoint" );
    level notify( "kill_variable_blizzard" );
    maps\cliffhanger_code::_id_C98F();
    common_scripts\utility::flag_set( "done_with_stealth_camp" );
    common_scripts\utility::flag_set( "base_c4_price_done" );
    common_scripts\utility::flag_set( "price_moving_to_hanger" );
    common_scripts\utility::flag_set( "start_big_explosion" );

    if ( !isdefined( var_0 ) )
    {
        _id_B358();
        maps\cliffhanger_stealth::_id_AA79();
    }
    else
    {
        level._id_B8ED.script_stealth = undefined;
        level.price = maps\cliffhanger_code::_id_B119();
        level.price maps\_utility::disable_ai_color();
        level.price maps\_utility::forceuseweapon( "ak47_arctic", "primary" );
    }

    if ( isdefined( level.price._stealth ) )
        level.price maps\_stealth_utility::stealth_basic_states_default();

    maps\_stealth_utility::disable_stealth_system();
    var_1 = getent( "price_capture_node", "targetname" );
    level.player maps\_utility::teleport_ent( var_1 );
    level.player playerlinkto( var_1, undefined, 1, 0, 0, 0, 0 );
    var_2 = getnode( "price_tarmac_path", "targetname" );
    level.price forceteleport( var_2.origin, var_2.angles );
    level.price maps\_utility::forceuseweapon( "ak47_arctic", "primary" );
    _id_C0CF::_id_BBE8();
    common_scripts\utility::flag_set( "player_in_hanger" );
    common_scripts\utility::flag_set( "reached_top" );
    common_scripts\utility::flag_set( "hanger_reinforcements" );
    common_scripts\utility::flag_set( "hanger_slowmo_ends" );
    common_scripts\utility::flag_set( "start_busted_music" );
    var_3 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_3.alpha = 1;

    if ( isdefined( level._id_CC09 ) )
        level._id_CC09.alpha = 1;

    maps\_utility::delaythread( 1.75, maps\cliffhanger_code::_id_D38A );
    wait 3.75;
    var_3 fadeovertime( 2 );
    var_3.alpha = 0;

    if ( isdefined( level._id_CC09 ) )
    {
        level._id_CC09 fadeovertime( 2 );
        level._id_CC09.alpha = 0;
    }

    var_1 delete();
    wait 0.8;
    wait 1.2;
    var_3 destroy();

    if ( isdefined( level._id_CC09 ) )
        level._id_CC09 destroy();
}

_id_D104()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    setdvar( "player_has_witnessed_capture", "" );
    common_scripts\utility::flag_set( "tarmac_escape" );
    common_scripts\utility::flag_init( "price_reaches_bottom" );
    common_scripts\utility::flag_wait( "hanger_reinforcements" );
    maps\_utility::add_global_spawn_function( "axis", maps\cliffhanger_code::_id_D0FB );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "destroy_tarmac_jeeps" );
    maps\_utility::add_func( maps\cliffhanger_code::_id_B2F6, "destructible_tarmac_jeep_center" );
    maps\_utility::add_func( maps\cliffhanger_code::_id_B2F6, "destructible_oilrig_2" );
    thread maps\_utility::do_wait();
    thread maps\cliffhanger_snowmobile::_id_D12A();
    level.price.maxfaceenemydist = 200;
    level.price maps\_utility::set_force_color( "g" );
    common_scripts\_exploder::exploder( 54 );
    common_scripts\_exploder::exploder( 56 );
    thread maps\cliffhanger_code::_id_B621( "tarmac_bmp_spawner", "player_starts_snowmobile_trip" );
    var_0 = getentarray( "hanger_reinforce_spawner", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    thread _id_B07E();
    thread maps\cliffhanger_code::_id_CA0A();
    level.player maps\_utility::ent_flag_clear( "_stealth_enabled" );
    level.player.maxvisibledist = 8000;
    var_1 = getentarray( "blue_house_bottom_door", "targetname" );
    maps\_utility::array_delete( var_1 );
    var_2 = getentarray( "blue_house_top_door", "targetname" );
    maps\_utility::array_delete( var_2 );
    _id_C4A7::_id_B750();
    level notify( "stop_price_shield" );

    if ( !isdefined( level.price.magic_bullet_shield ) )
        level.price thread maps\_utility::magic_bullet_shield();

    common_scripts\utility::run_thread_on_noteworthy( "tarmac_hanger_gate", maps\cliffhanger_code::_id_BD9F );
    common_scripts\utility::flag_wait( "hanger_slowmo_ends" );
    level.price.ignorerandombulletdamage = 1;
    level.price.attackeraccuracy = 0;
    level.price.baseaccuracy = 1.8;
    level.price.ignoresuppression = 1;
    level.price.pathenemyfightdist = 350;
    level.price.pathenemylookahead = 350;
    level.price maps\_utility::set_battlechatter( 0 );
    maps\cliffhanger_code::_id_B9DC();
    maps\cliffhanger_snowmobile::_id_CF7A();
    thread maps\cliffhanger_snowmobile::_id_BCBA();
    common_scripts\utility::flag_wait( "player_slides_down_hill" );
    setsaveddvar( "r_corpseRemovalThreshold", "0.55" );
    common_scripts\utility::flag_wait( "price_reaches_bottom" );
    maps\_utility::autosave_by_name( "slide_down_hill" );
    common_scripts\_exploder::kill_exploder( 333 );
    thread _id_B081();
    thread maps\cliffhanger_snowmobile_code::_id_B04A();
    maps\cliffhanger_snowmobile::_id_CA1B();
}

_id_B07E()
{
    common_scripts\utility::flag_wait( "destroy_mack" );
    maps\cliffhanger_code::_id_B2F6( "destructible_oilrig_3" );
    common_scripts\utility::flag_wait( "destroy_jeeps" );
    maps\cliffhanger_code::_id_B2F6( "destructible_jeeps" );
    wait 0.3;
    maps\cliffhanger_code::_id_B2F6( "destructible_jeeps_delayed" );
}

_id_AF39()
{
    _id_B358();
}

_id_D17D()
{
    soundscripts\_snd::snd_message( "start_cave_checkpoint" );
    _id_B358();
    soundscripts\_snd::snd_message( "aud_start_mix_mig_passby" );
    level.player common_scripts\utility::delaycall( 2, ::playsound, "scn_cliffhanger_intro_wind_front" );
    level.scr_model["worldbody"] = "h2_gfl_st_ar15_viewbody";
}

_id_D3E6()
{
    soundscripts\_snd::snd_message( "start_e3_checkpoint" );
    _id_B358();
    thread _id_B7E0();
}

_id_B7E0()
{
    wait 0.05;
    level._id_C8EB = 1;
    level.objectives = [];
    maps\cliffhanger_code::_id_CB97();
    maps\cliffhanger_code::_id_C889();
    maps\cliffhanger_code::_id_CF61();
    maps\cliffhanger_code::_id_AAD5();
}

start_climb()
{
    soundscripts\_snd::snd_message( "start_climb_checkpoint" );
    _id_B358();
}

_id_AF51()
{
    soundscripts\_snd::snd_message( "start_clifftop_checkpoint" );
    common_scripts\utility::flag_set( "reached_top" );
    _id_B358();
    maps\cliffhanger_stealth::_id_AA79();
    maps\cliffhanger_code::_id_D3E3( "clifftop" );
    var_0 = common_scripts\utility::getstruct( "price_clifftopstart", "targetname" );
    level.price forceteleport( var_0.origin, var_0.angles );
}

_id_B347()
{
    soundscripts\_snd::snd_message( "start_jump_checkpoint" );
    _id_B358();
    level notify( "player_shimmy_stop" );
    var_0 = getent( "player_big_jump_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    thread _id_BB6C::_id_BBC4();
    thread _id_BB6C::_id_BFDE();
    thread _id_C0CF::_id_CCEF();
}

_id_B855( var_0 )
{
    soundscripts\_snd::snd_message( "start_camp_checkpoint" );
    common_scripts\utility::flag_set( "price_go_to_climb_ridge" );
    common_scripts\utility::flag_set( "reached_top" );
    common_scripts\utility::flag_set( "first_two_guys_in_sight" );
    common_scripts\utility::flag_set( "said_lets_split_up" );

    if ( !isdefined( var_0 ) )
    {
        _id_B358();
        maps\cliffhanger_stealth::_id_AA79();
    }

    maps\cliffhanger_code::_id_D3E3( "camp" );
    thread maps\cliffhanger_code::_id_C0D2( 0.05 );
    maps\cliffhanger_stealth::_id_B903();
    _id_C0CF::_id_BC13( 0.1 );
    _id_C0CF::_id_BAB9( level.player, 0.05 );
}

_id_D07C()
{
    soundscripts\_snd::snd_message( "start_c4_checkpoint" );
    common_scripts\utility::flag_set( "price_go_to_climb_ridge" );
    common_scripts\utility::flag_set( "dialog_take_point" );
    common_scripts\utility::flag_set( "reached_top" );
    common_scripts\utility::flag_set( "first_two_guys_in_sight" );
    common_scripts\utility::flag_set( "said_lets_split_up" );
    _id_B358();
    maps\cliffhanger_stealth::_id_AA79();
    maps\_utility::activate_trigger_with_targetname( "tarmac_guys_trigger" );
    common_scripts\utility::flag_set( "start_truck_patrol" );
    thread maps\cliffhanger_stealth::_id_B68B();
    maps\cliffhanger_code::_id_D3E3( "c4" );
    thread maps\cliffhanger_stealth::_id_CFE8();
    thread maps\cliffhanger_code::_id_C0D2();
    maps\cliffhanger_stealth::_id_B903();
    _id_C0CF::_id_BC13( 0.1 );
    _id_C0CF::_id_BAB9( level.player, 0.05 );
}

_id_B0DA()
{
    soundscripts\_snd::snd_message( "start_goto_hanger_checkpoint" );
    common_scripts\utility::flag_set( "price_go_to_climb_ridge" );
    common_scripts\utility::flag_set( "dialog_take_point" );
    common_scripts\utility::flag_set( "reached_top" );
    common_scripts\utility::flag_set( "first_two_guys_in_sight" );
    common_scripts\utility::flag_set( "said_lets_split_up" );
    common_scripts\utility::flag_set( "base_c4_planted" );
    _id_B358();
    maps\cliffhanger_stealth::_id_AA79();
    common_scripts\utility::flag_set( "fence_walker_dead" );
    common_scripts\utility::flag_set( "center_building_patroler_dead" );
    common_scripts\utility::flag_set( "center_building_patroler_buddy_dead" );
    common_scripts\utility::flag_set( "ridge_patroler_dead" );
    maps\_utility::activate_trigger_with_targetname( "tarmac_guys_trigger" );
    common_scripts\utility::flag_set( "start_truck_patrol" );
    thread maps\cliffhanger_stealth::_id_B68B();
    maps\cliffhanger_code::_id_D3E3();
    thread maps\cliffhanger_stealth::_id_CFE8();
    thread maps\cliffhanger_code::_id_C0D2();
    maps\cliffhanger_stealth::_id_B903();
    _id_C0CF::_id_BC13( 0.1 );
    _id_C0CF::_id_BAB9( level.player, 0.05 );
}

_id_D4AE()
{
    soundscripts\_snd::snd_message( "start_hangerpath_checkpoint" );
    common_scripts\utility::flag_set( "price_go_to_climb_ridge" );
    common_scripts\utility::flag_set( "dialog_take_point" );
    common_scripts\utility::flag_set( "reached_top" );
    common_scripts\utility::flag_set( "first_two_guys_in_sight" );
    common_scripts\utility::flag_set( "said_lets_split_up" );
    common_scripts\utility::flag_set( "base_c4_planted" );
    common_scripts\utility::flag_set( "price_moving_to_hanger" );
    _id_B358();
    maps\cliffhanger_stealth::_id_AA79();
    thread maps\cliffhanger_code::_id_C0D2();
    maps\cliffhanger_stealth::_id_B903();
    maps\cliffhanger_code::_id_D3E3();
    var_0 = getent( "price_hanger_start", "targetname" );
    level.price maps\_utility::teleport_ent( var_0 );
    _id_C0CF::_id_BC13( 0.1 );
    _id_C0CF::_id_BAB9( level.player, 0.05 );
}

_id_CF87()
{
    soundscripts\_snd::snd_message( "start_hanger_checkpoint" );
    common_scripts\utility::flag_set( "reached_top" );
    common_scripts\utility::flag_set( "dialog_take_point" );
    common_scripts\utility::flag_set( "first_two_guys_in_sight" );
    common_scripts\utility::flag_set( "done_with_stealth_camp" );
    common_scripts\utility::flag_set( "base_c4_planted" );
    common_scripts\utility::flag_set( "price_moving_to_hanger" );
    _id_B358();
    maps\cliffhanger_stealth::_id_AA79();
    var_0 = getent( "player_hanger_start", "targetname" );
    level.player maps\_utility::teleport_ent( var_0 );
    var_1 = getent( "price_hanger_start", "targetname" );
    level.price forceteleport( var_1.origin, var_1.angles );
    _id_C0CF::_id_BBE8();
    _id_C0CF::_id_BAB9( level.player, 0.05 );
}

_id_B358()
{
    level._id_B8ED = getent( "price", "script_noteworthy" );
    maps\cliffhanger_code::player_init();
    maps\cliffhanger_code::_id_B70A();
    maps\cliffhanger_code::_id_C734();
    thread maps\cliffhanger_code::enemy_init();
}

_id_CF02()
{
    level._id_C8EB = 1;
    level.objectives = [];

    if ( !maps\_utility::is_in_array( [ "tarmac", "icepick", "snowmobile" ], level.start_point ) )
        maps\cliffhanger_code::_id_C8C9();

    switch ( level.start_point )
    {
        case "default":
        case "cave":
            level waittill( "follow_price_obj" );
        case "jump":
        case "e3":
        case "climb":
        case "clifftop":
            maps\cliffhanger_code::_id_CB97();
        case "camp":
            maps\cliffhanger_code::_id_BD15();
        case "c4":
            maps\cliffhanger_code::_id_C889();
        case "goto_hanger":
        case "hangerpath":
            maps\cliffhanger_code::_id_C8F7();
        case "hanger":
            maps\cliffhanger_code::_id_AC1F();
        case "satellite":
        case "tarmac":
        case "icepick":
            maps\cliffhanger_code::_id_CF61();
        case "snowmobile":
        case "ending":
            maps\cliffhanger_code::_id_AAD5();
            break;
        default:
    }
}

_id_A9AE()
{
    var_0 = getentarray( "tarp_high", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setmodel( "h2_ch_tarpaulin1_soft_snow" );
}

_id_B51D()
{
    var_0 = getent( "moving_cable", "targetname" );
    var_0 maps\_utility::assign_animtree( "cable" );
    var_0 thread maps\_anim::anim_loop_solo( var_0, "lab_tank_assembly_cable_slow", "cable_end" );
    common_scripts\utility::flag_wait( "keyboard_used" );
    var_0 notify( "cable_end" );
    var_0 thread maps\_anim::anim_loop_solo( var_0, "lab_tank_assembly_cable_fast" );
}

_id_CFBA()
{
    common_scripts\utility::flag_wait( "light_storm" );
    thread _id_C0CF::_id_BBE8( 25 );
}

_id_B3DF()
{
    level endon( "player_on_backdoor_path" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "custom_blizzard" );
        _id_C0CF::_id_C8DE();
        common_scripts\utility::flag_wait( "heavy_blizzard" );
        _id_C0CF::_id_BC13();
        thread maps\cliffhanger_code::_id_C0D2( 8 );
    }
}

_id_B081()
{
    var_0 = getentarray( "shadow_zone", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_D187 );

    for (;;)
    {
        setsaveddvar( "r_useLightGridDefaultModelLightingLookup", "1" );
        setsaveddvar( "r_lightGridDefaultModelLightingLookup", " -58673 -1644 -7589 " );
        level.player waittill( "player_in_shadow" );
        setsaveddvar( "r_useLightGridDefaultModelLightingLookup", "1" );
        setsaveddvar( "r_lightGridDefaultModelLightingLookup", " -25970 -24856 -5137 " );
        level.player waittill( "player_out_shadow" );
        waitframe();
    }
}

_id_D187()
{
    for (;;)
    {
        var_0 = undefined;

        while ( !isplayer( var_0 ) )
            self waittill( "trigger", var_0 );

        var_0 notify( "player_in_shadow" );

        while ( var_0 istouching( self ) )
            waitframe();

        var_0 notify( "player_out_shadow" );
        waitframe();
    }
}
