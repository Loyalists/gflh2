// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_C2B0()
{
    level._id_AA79 = maps\cliffhanger_stealth::_id_AA79;
    maps\_load::set_player_viewhand_model( "h2_gfl_st_ar15_viewhands_player" );
    _id_AF69::_id_C09A( "h2_gfl_st_ar15_viewhands_player", "vehicle_snowmobile_player" );
    precacheitem( "hind_turret_penetration" );
    precacheitem( "hind_FFAR" );
    precacheitem( "zippy_rockets" );
    precacheitem( "rpg_straight" );
    precachemodel( "com_computer_keyboard_obj" );
    precacheitem( "c4" );
    precacheshader( "overhead_obj_icon_world" );
    precacheshader( "hud_icon_heartbeat" );
    precacheshader( "hud_dpad" );
    precacheshader( "hud_arrow_left" );
    precachemodel( "weapon_ak47_clip" );
    precachemodel( "accessories_windsock_animated" );
    precachemodel( "h2_ch_megaphone_rig" );
    precachemodel( "com_roofvent1_snow_animated" );
    precachemodel( "ch_campfire_equipment_animated" );
    precachemodel( "head_hero_soap_arctic_interior" );
    precachestring( &"CLIFFHANGER_LINE1" );
    precachestring( &"CLIFFHANGER_LINE2" );
    precachestring( &"CLIFFHANGER_LINE3" );
    precachestring( &"CLIFFHANGER_LINE4" );
    precachestring( &"CLIFFHANGER_LINE5" );
    precachestring( &"SCRIPT_WAYPOINT_COVER" );
    precachestring( &"AUTOSAVE_AUTOSAVE" );
    precachestring( &"SCRIPT_WAYPOINT_COVER" );
    precachestring( &"SCRIPT_PLATFORM_HINT_STANDKEY" );
    precachestring( &"CLIFFHANGER_RUN_OVER" );
    precachestring( &"CLIFFHANGER_BOARD" );
    precachestring( &"CLIFFHANGER_E3_NOT_AS_PLANNED" );
    precachestring( &"CLIFFHANGER_HOW_TO_CLIMB" );
    precachestring( &"CLIFFHANGER_HOLD_ON_TIGHT" );
    precachestring( &"CLIFFHANGER_MAKES_FIRST_JUMP" );
    precachestring( &"CLIFFHANGER_E3_INTEREST_OF_TIME" );
    precachestring( &"CLIFFHANGER_E3_NOT_AS_PLANNED" );
    precachestring( &"CLIFFHANGER_LEFT_ICEPICK" );
    precachestring( &"CLIFFHANGER_RIGHT_ICEPICK" );
    precachestring( &"CLIFFHANGER_LEFT_ICEPICK_PC" );
    precachestring( &"CLIFFHANGER_RIGHT_ICEPICK_PC" );
    precachestring( &"CLIFFHANGER_HOW_TO_CLIMB_PC" );

    precachemodel( "h2_gfl_st_ar15_viewbody" );
    precachemodel( "h2_gfl_st_ar15_viewhands" );
    precachemodel( "h2_gfl_st_ar15_viewhands_player" );

    level._id_B41F = maps\_utility::_id_CBD7;
    level._id_D24F = "kriss";
    _id_C0E7::main();
    _id_D11A::main();
    _id_C162::main();
    var_0 = getentarray( "destructible_tree", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_C419 );
    vehicle_scripts\_empty::main( "tag_origin" );
    maps\_load::main();
    maps\_idle::idle_main();
    maps\_compass::setupminimap( "compass_map_cliffhanger" );
    maps\_utility::add_hint_string( "hint_heartbeat_sensor", &"CLIFFHANGER_SWITCH_HEARTBEAT", ::_id_C4AD, undefined, "medium_background" );
    _id_B2D2::main();
    _id_AAAB::main();
    _id_BC61::main();
    maps\_idle_smoke::main();
    _id_A9F5::main();
    maps\_idle_phone::main();
    _id_B881::main();
    maps\cliffhanger_anim::_id_A902();
    maps\_stealth::main();
    maps\cliffhanger_stealth::_id_B4B4();
    maps\_patrol_anims::main();
    _id_BB6C::_id_B143();
    thread _id_BA7B();
    maps\cliffhanger_aud::main();
    soundscripts\_snd::snd_message( "aud_turnoff_hanger_door_transition" );
    level._id_B3CA = [];
    thread maps\cliffhanger_snowmobile_code::_id_B914();
    var_1 = getentarray( "cliff_death_spawner", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\cliffhanger_snowmobile_code::_id_CCB8 );
    var_2 = getentarray( "high_threat_spawner", "targetname" );
    common_scripts\utility::array_thread( var_2, ::_id_B015 );
    level._id_BEBF = [];
    var_3 = getentarray( "tarmac_snowmobile", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, ::_id_AD61 );
    var_4 = getentarray( "wind_blown_object", "targetname" );
    common_scripts\utility::array_thread( var_4, ::_id_BD75 );
    var_5 = getentarray( "end_camp_spawner", "targetname" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, maps\cliffhanger_snowmobile_code::_id_C021 );
    var_6 = getentarray( "speedy_littlebird_spawner", "script_noteworthy" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, maps\cliffhanger_snowmobile_code::_id_AC4E );
    var_7 = getent( "ending_heli", "script_noteworthy" );
    var_7 maps\_utility::add_spawn_function( maps\cliffhanger_snowmobile_code::_id_C652 );
    var_8 = getentarray( "magic_bullet_spawner", "script_noteworthy" );
    common_scripts\utility::array_thread( var_8, maps\cliffhanger_snowmobile_code::_id_AFE9 );
    var_9 = getentarray( "god_vehicle_spawner", "script_noteworthy" );
    common_scripts\utility::array_thread( var_9, maps\cliffhanger_snowmobile_code::_id_C884 );
    common_scripts\utility::array_thread( getentarray( "start_crate_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BE21 );
    common_scripts\utility::array_thread( getentarray( "start_crate_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C020 );
    common_scripts\utility::array_thread( getentarray( "start_quonset_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BE21 );
    common_scripts\utility::array_thread( getentarray( "right_side_start_guy", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_CE0B );
    common_scripts\utility::array_thread( getentarray( "2story_leaner", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C76B );
    common_scripts\utility::array_thread( getentarray( "2story_sitter", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_AB06 );
    common_scripts\utility::array_thread( getentarray( "container_leaner", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C76B );
    common_scripts\utility::array_thread( getentarray( "fence_walker", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C385 );
    common_scripts\utility::array_thread( getentarray( "satbuilding_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C385 );
    common_scripts\utility::array_thread( getentarray( "ridge_patroler", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C385 );
    common_scripts\utility::array_thread( getentarray( "start_crate_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C385 );
    var_10 = getentarray( "ridge_guy_left", "script_noteworthy" );
    common_scripts\utility::array_thread( var_10, maps\_utility::add_spawn_function, ::_id_C385 );
    common_scripts\utility::array_thread( var_10, maps\_utility::add_spawn_function, ::_id_BAFA, "ridge_guy_left_first_alert" );
    var_11 = getentarray( "ridge_guy_right", "script_noteworthy" );
    common_scripts\utility::array_thread( var_11, maps\_utility::add_spawn_function, ::_id_BAFA, "ridge_guy_right_first_alert" );
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "price_target_start", "script_noteworthy" ), ::_id_B957 );
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "price_target_stop", "script_noteworthy" ), ::_id_CA1A );
    common_scripts\utility::array_thread( getentarray( "blue_building_smoker", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_A927 );
    common_scripts\utility::array_thread( getentarray( "blue_building_loader", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_A927 );
    common_scripts\utility::array_thread( getentarray( "blue_building_smoker", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C577 );
    common_scripts\utility::array_thread( getentarray( "blue_building_loader", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C577 );
    common_scripts\utility::array_thread( getentarray( "round_building_loader", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_D01C );
    common_scripts\utility::array_thread( getentarray( "fence_walker", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BB1D, "fence_walker_dead" );
    common_scripts\utility::array_thread( getentarray( "satbuilding_smoker", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BB1D, "satbuilding_smoker_dead" );
    common_scripts\utility::array_thread( getentarray( "southeast_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BB1D, "southeast_patroller_dead" );
    common_scripts\utility::array_thread( getentarray( "satbuilding_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BB1D, "satbuilding_patroller_dead" );
    var_12 = getentarray( "script_vehicle_mig29", "classname" );
    common_scripts\utility::array_thread( var_12, maps\_utility::add_spawn_function, ::_id_C680 );
    _id_BA65();
    thread _id_A99D();
    thread _id_CCDD();
    thread _id_BA04();
    thread _id_D284();
    thread _id_CFBC();
    thread _id_CFF5();
    thread _id_C435();
    thread _id_C6B6();
    thread _id_CEB0();
    thread _id_D58D();
    thread _id_B390();
    thread _id_C939();
    thread _id_AACA( "blizzard_start", "blizzard_bmp", "keyboard_used" );
    thread _id_AACA( "player_detonate", "tarmac_bmp", "player_starts_snowmobile_trip" );
    thread _id_ABBF();
    thread _id_D038();
    thread _id_AA1D();
    thread h2_delete_icicles();
    thread snowmobile_visionset_setup();
    thread _id_D40F();
    thread _id_CEE6();
    level._id_B586 = [];
    level._id_C3CD = spawn( "script_origin", level.player.origin );
    level._id_C3CD linkto( level.player );
    level._id_BC53 = spawn( "script_origin", level.player.origin );
    level._id_BC53 linkto( level.player );
    level._id_AAA7["sleep"] = ::_id_D070;
    var_13 = getent( "ending_heli_fly_off_trigger", "targetname" );
    var_13 thread maps\cliffhanger_snowmobile_code::_id_C0CC();
    var_14 = getentarray( "end_heli_trigger", "targetname" );
    thread _id_B663();
    thread maps\cliffhanger_lighting::_id_AB73();
    thread _id_CE7A();
    thread _id_C5DE();
    thread _id_B175();
    var_15 = getent( "pan_metal", "targetname" );
    var_15 maps\_utility::assign_animtree( "pan_metal" );
    var_15 thread maps\_anim::anim_loop_solo( var_15, "idle" );
    thread cliffhanger_polygonoffscale_override( 6, "blizzard_start" );
    var_16 = getentarray( "pan_copper", "targetname" );

    foreach ( var_18 in var_16 )
    {
        var_19 = randomint( 3 );
        var_18 maps\_utility::assign_animtree( "pan_copper" );
        var_18 maps\_utility::delaythread( var_19, maps\_anim::anim_loop_solo, var_18, "idle" );
    }

    maps\_vehicle::_id_CCF4( "script_vehicle_uaz_winter_destructible", _id_C782::setanims, ::_id_ADD5 );
}

_id_D070( var_0 )
{
    var_1 = anglestoforward( self.angles );
    var_2 = level.player.origin - self.origin;

    if ( vectordot( var_1, var_2 ) < 0 && isdefined( self._stealth.behavior.event.custom_animation ) )
        self._stealth.behavior.event.custom_animation.anime = "sleep_react_back";

    if ( !level.player._id_B3CE )
    {
        var_3 = 250;
        self.stealth_grace_window_end_in_ms = gettime() + var_3;
        maps\_utility::delaythread( var_3 / 1000, maps\_utility::_id_B0A0, 1 );
        maps\_stealth_shared_utilities::enemy_animation_custom( var_0 );
    }
    else
        level.player waittill( "stealth_takedown_ended" );

    return 1;
}

_id_BB1D( var_0 )
{
    self waittill( "death" );
    common_scripts\utility::flag_set( var_0 );
}

_id_D038()
{
    level endon( "start_busted_music" );
    common_scripts\utility::flag_wait( "dialog_take_point" );
    var_0 = getentarray( "base_loudspeaker", "targetname" );
    var_1 = [];
    var_1[var_1.size] = "cliff_ru2_stolesandwich";
    var_1[var_1.size] = "cliff_ru3_competrov";
    var_1[var_1.size] = "cliff_ru3_indoctrination";
    var_1[var_1.size] = "cliff_ru3_ltpavlov";
    var_1[var_1.size] = "cliff_ru3_repteams";
    var_1[var_1.size] = "cliff_ru3_spareparts";
    var_1[var_1.size] = "cliff_ru3_cptkonovalov";
    var_1[var_1.size] = "cliff_ru4_ptborodin";
    var_2 = 0;
    var_3 = [];
    var_3[var_3.size] = "cliff_ru3_redalert";
    var_3[var_3.size] = "cliff_ru3_enemyforces";
    var_3[var_3.size] = "cliff_ru3_hostiletroops";
    var_3[var_3.size] = "cliff_ru3_cutthemoff";
    var_4 = 0;

    for (;;)
    {
        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        {
            var_5 = var_1[var_4];
            var_4++;

            if ( var_4 >= var_3.size )
                var_4 = 0;
        }
        else
        {
            var_5 = var_1[var_2];
            var_2++;

            if ( var_2 >= var_1.size )
                var_2 = 0;
        }

        foreach ( var_7 in var_0 )
            var_7 playsound( var_5 );

        wait(randomintrange( 16, 35 ));
    }
}

_id_C939()
{
    wait 1;
    common_scripts\utility::flag_wait( "blizzard_start" );
    setsaveddvar( "aim_aimAssistRangeScale", ".3" );
    setsaveddvar( "aim_autoAimRangeScale", ".3" );
    common_scripts\utility::flag_wait( "done_with_stealth_camp" );
    setsaveddvar( "aim_aimAssistRangeScale", "1" );
    setsaveddvar( "aim_autoAimRangeScale", "1" );
}

_id_AACA( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait( var_0 );
    var_3 = maps\_vehicle::spawn_vehicles_from_targetname( var_1 );

    foreach ( var_5 in var_3 )
    {
        if ( var_1 == "blizzard_bmp" )
            var_5 thread _id_CDCE();

        var_5 thread maps\_vehicle_code::damage_hints();
        var_5 maps\_vehicle::godon();
        var_5 setmotiontrackervisible( 1 );
        var_5 thread _id_BB47();
        var_5 thread _id_B085();
    }

    common_scripts\utility::flag_wait( var_2 );

    foreach ( var_5 in var_3 )
        var_5 delete();
}

_id_B621( var_0, var_1 )
{
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( var_0 );
    var_2 thread maps\_vehicle_code::damage_hints();
    var_2 maps\_vehicle::godon();
    var_2 setmotiontrackervisible( 1 );
    var_2 thread _id_BB47();
    var_2 thread _id_B085( 1 );
    common_scripts\utility::flag_wait( var_1 );
    var_2 delete();
}

_id_CDCE( var_0 )
{
    playfxontag( level._effect["lighthaze_snow_headlights"], self, "tag_front_light_left" );
    playfxontag( level._effect["lighthaze_snow_headlights"], self, "tag_front_light_right" );
    playfxontag( level._effect["lighthaze_snow_spotlight"], self, "tag_turret_light" );
    self waittill( "death" );
}

_id_B085( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    self endon( "death" );
    thread _id_AE8B();
    maps\_utility::waittill_entity_in_range( level.player, 980 );
    self notify( "bmp_aim_at_player" );
    self setturrettargetent( level.player );
    maps\_utility::waittill_entity_in_range( level.player, 600 );

    for (;;)
    {
        var_1 = distance2d( self.origin, level.player.origin );
        var_2 = var_1 - abs( self.origin[2] - level.player.origin[2] );

        if ( var_2 < 40 )
            self clearturrettargetent();
        else
        {
            self setturrettargetent( level.player );
            var_3 = randomintrange( 4, 7 );

            for ( var_4 = 0; var_4 < var_3; var_4++ )
            {
                self fireweapon();
                wait 0.35;
            }

            wait(randomfloatrange( 0.2, 0.5 ));
            var_3 = randomintrange( 4, 7 );

            for ( var_4 = 0; var_4 < var_3; var_4++ )
            {
                self fireweapon();
                wait 0.35;
            }

            if ( var_0 )
            {
                var_5 = level.player geteye();
                var_6 = ( self.origin[0], self.origin[1], var_5[2] );
                var_7 = bullettrace( self.origin, level.player geteye(), 0 );

                if ( var_1 > 600 || var_7["fraction"] < 1 )
                {
                    maps\_utility::waittill_entity_in_range( level.player, 600 );
                    continue;
                }
            }

            level.player dodamage( level.player.health + 1000, self.origin );
        }

        wait(randomfloatrange( 0.2, 0.5 ));
    }
}

_id_BB47()
{
    self endon( "death" );
    self endon( "bmp_aim_at_player" );
    var_0 = getentarray( "bmp_blizzard_target", "targetname" );

    for (;;)
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            self setturrettargetent( var_0[var_1] );
            self waittill( "turret_on_target" );
            wait(randomfloatrange( 10, 15 ));
        }
    }
}

_id_D323()
{
    if ( isdefined( self.script_noteworthy ) )
    {
        if ( self.script_noteworthy == "truck_guys" )
            return;
    }

    if ( !isdefined( self.script_stealth ) )
        return;

    self endon( "death" );
    level.price maps\_utility::waittill_entity_in_range( self, 300 );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    if ( maps\_utility::_id_B0A0( 1 ) )
        thread _id_B4AA();
}

_id_B4AA()
{
    level.player endon( "stealth_takedown_started" );
    level endon( "said_lets_split_up" );
    self.ignoreme = 0;
    self.dontattackme = undefined;
    self.health = 1;
    level.price.fixednode = 0;
    level.price maps\_utility::disable_ai_color();
    level.price setgoalpos( level.price.origin );
    level.price.goalradius = 8;
    self.dontattackme = undefined;

    if ( !isdefined( level.price._id_CA55 ) )
        level.price._id_CA55 = 1;
    else
        level.price._id_CA55++;

    self waittill( "death" );
    level.price._id_CA55--;

    if ( level.price._id_CA55 < 1 )
    {
        level.price.fixednode = 1;
        level.price maps\_utility::enable_ai_color();
    }
}

_id_CE4F()
{
    var_0[3] = spawnstruct();
    var_0[3]._id_D1FD = "west_base_guys_trigger";
    var_0[3]._id_B11C = "ridge_patroler_dead";
    common_scripts\utility::array_thread( var_0, ::_id_D4F8 );
    var_1 = [];
    var_1[var_1.size] = "north_patroler";
    var_1[var_1.size] = "north_patroler_buddy";
    var_1[var_1.size] = "north_patroler2";
    var_1[var_1.size] = "north_patroler_buddy2";

    if ( common_scripts\utility::flag( "truckguys_dead" ) )
    {
        var_1[var_1.size] = "center_road_patrol";
        var_1[var_1.size] = "center_road_patrol_buddy";
        var_1[var_1.size] = "center_road_patrol2";
        var_1[var_1.size] = "center_road_patrol_buddy2";
    }

    foreach ( var_3 in var_1 )
    {
        var_4 = getent( var_3, "script_noteworthy" );

        if ( isdefined( var_4 ) )
        {
            var_4.count = 1;
            var_4 = var_4 maps\_utility::spawn_ai();
        }
    }
}

_id_D4F8()
{
    if ( common_scripts\utility::flag( self._id_B11C ) )
        getent( self._id_D1FD, "targetname" ) notify( "trigger" );
}

_id_A99D()
{
    createthreatbiasgroup( "player" );
    level.player setthreatbiasgroup( "player" );
    setthreatbias( "player", "axis", 500 );
    common_scripts\utility::flag_wait( "done_with_stealth_camp" );
    setthreatbias( "player", "axis", 0 );
}

_id_C0D2( var_0 )
{
    level endon( "starting_hanger_backdoor_path" );
    level endon( "kill_variable_blizzard" );
    level endon( "custom_blizzard" );
    common_scripts\utility::flag_set( "blizzard_start" );
    var_1 = 1;
    var_2 = 1;

    for (;;)
    {
        var_3 = randomfloatrange( 2, 5 );

        if ( var_1 )
        {
            var_1 = !var_1;

            if ( isdefined( var_0 ) )
                var_3 = var_0;
        }

        while ( common_scripts\utility::flag( "player_indoors" ) )
            wait 0.25;

        _id_C0CF::_id_BC13( var_2 );
        wait(var_3);

        if ( randomint( 2 ) == 0 || common_scripts\utility::flag( "blizzard_intensity_extreme" ) )
            wait(randomfloatrange( 1, 3 ));
        else
            wait(randomfloatrange( 7, 9 ));

        if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
        {
            var_3 = randomfloatrange( 1, 3 );

            while ( common_scripts\utility::flag( "player_indoors" ) )
                wait 0.25;

            _id_C0CF::_id_CE01( var_2 );

            if ( common_scripts\utility::flag( "blizzard_intensity_extreme" ) )
            {
                wait(randomfloatrange( 4, 6 ));
                continue;
            }

            wait(var_3);
        }
    }
}

_id_CCB3( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait( var_0 );
    var_3 = maps\_utility::get_closest_player( level.price.origin );
    var_4 = distance( var_3.origin, level.price.origin );

    if ( var_4 > var_2 )
    {
        var_1 = getent( var_1, "targetname" );
        level.price teleport( var_1.origin, var_1.angles );
    }
    else
    {

    }
}

_id_CCDD()
{
    common_scripts\utility::flag_wait( "satbuilding_smoker_dead" );
    common_scripts\utility::flag_wait( "satbuilding_patroller_dead" );
    common_scripts\utility::flag_wait( "southeast_patroller_dead" );
    common_scripts\utility::flag_wait( "fence_walker_dead" );
    common_scripts\utility::flag_set( "satbuilding_area_guys_dead" );
}

_id_ABBF()
{
    waittillframeend;
    waittillframeend;

    if ( !common_scripts\utility::flag( "player_rides_snowmobile" ) )
    {
        if ( !common_scripts\utility::flag( "player_in_hanger" ) )
        {
            thread _id_BEA3();
            common_scripts\utility::flag_wait( "player_in_hanger" );
            maps\_utility::music_stop( 1 );
            wait 1.5;
        }

        if ( !common_scripts\utility::flag( "start_busted_music" ) )
        {
            thread _id_A9E7();
            common_scripts\utility::flag_wait( "start_busted_music" );
            wait 0.5;
            maps\_utility::music_stop( 1 );
            wait 1.25;
            maps\_utility::musicplaywrapper( "mus_cliffhanger_satellite_busted" );
        }

        if ( !common_scripts\utility::flag( "start_big_explosion" ) )
        {
            common_scripts\utility::flag_wait( "start_big_explosion" );
            maps\_utility::music_stop( 0.5 );
            wait 0.75;
            common_scripts\utility::flag_wait( "hanger_slowmo_ends" );
        }

        thread _id_CBA1();
        common_scripts\utility::flag_wait( "player_rides_snowmobile" );
        maps\_utility::music_stop( 2 );
        wait 2.25;
    }

    thread _id_CC46();
    common_scripts\utility::flag_wait( "snowmobile_fog_clears" );
    wait 2.25;
    maps\_utility::music_stop( 2 );
    soundscripts\_snd::snd_message( "aud_start_mix_snowmobile_descent" );
    level.player thread maps\_utility::play_sound_on_entity( "mus_cliffhanger_snowmobile_descent" );
}

_id_CC46()
{
    level endon( "snowmobile_fog_clears" );
    var_0 = "mus_cliffhanger_snowmobile";
    var_1 = maps\_utility::musiclength( var_0 );

    for (;;)
    {
        maps\_utility::musicplaywrapper( var_0 );
        wait(var_1);
    }
}

_id_CBA1()
{
    level endon( "player_rides_snowmobile" );
    var_0 = "mus_cliffhanger_escape";
    var_1 = maps\_utility::musiclength( var_0 );

    for (;;)
    {
        maps\_utility::musicplaywrapper( var_0 );
        wait(var_1);
    }
}

_id_A9E7()
{
    level endon( "start_busted_music" );
    var_0 = "mus_cliffhanger_satellite";
    var_1 = maps\_utility::musiclength( var_0 );

    for (;;)
    {
        maps\_utility::musicplaywrapper( var_0 );
        wait(var_1);
    }
}

_id_BEA3()
{
    level endon( "player_in_hanger" );
    common_scripts\utility::flag_wait( "first_two_guys_in_sight" );

    for (;;)
    {
        thread _id_BECE();
        common_scripts\utility::flag_wait( "_stealth_spotted" );
        maps\_utility::music_stop( 0.2 );
        wait 0.5;
        thread _id_CB2A();
        soundscripts\_snd::snd_message( "aud_start_mix_stealth_busted" );
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        soundscripts\_snd::snd_message( "aud_stop_mix_stealth_busted" );
        maps\_utility::music_stop( 3 );
        wait 3.25;
    }
}

_id_BECE()
{
    level endon( "player_in_hanger" );
    level endon( "_stealth_spotted" );
    var_0 = "mus_cliffhanger_stealth";
    var_1 = maps\_utility::musiclength( var_0 );

    if ( var_1 > 0 )
    {
        for (;;)
        {
            maps\_utility::musicplaywrapper( var_0 );
            wait(var_1);
        }
    }
}

_id_CB2A()
{
    level endon( "player_in_hanger" );
    level endon( "_stealth_spotted" );
    var_0 = "mus_cliffhanger_stealth_busted";
    var_1 = maps\_utility::musiclength( var_0 );

    for (;;)
    {
        maps\_utility::musicplaywrapper( var_0 );
        wait(var_1);
    }
}

_id_AA1D()
{
    var_0 = getent( "welding_light", "targetname" );
    var_0 setlightintensity( 0 );
    common_scripts\utility::flag_wait( "starting_hanger_backdoor_path" );
    var_1 = getent( "mig_origin", "targetname" );
    var_2 = maps\_utility::_id_CC1D( "welder_wing" );
    var_2.animname = "welder_wing";
    var_2 maps\_utility::gun_remove();
    var_2.cheat._id_BDF2 = 1;
    var_2.allowdeath = 1;
    var_2.ignoreme = 1;
    var_2 attach( "machinery_welder_handle", "tag_inhand" );
    var_2 attach( "h2_civ_work_headgear_earmuffs" );
    var_2.hatmodel = "h2_civ_work_headgear_earmuffs";
    var_2.health = 6;
    var_2 maps\_utility::set_deathanim( "death_back" );
    var_1 thread maps\_anim::anim_loop_solo( var_2, "welding", "stop_welding" );
    var_3 = maps\_utility::_id_CC1D( "welder_engine" );
    var_3.animname = "welder_engine";
    var_3 maps\_utility::gun_remove();
    var_3.cheat._id_BDF2 = 1;
    var_3.allowdeath = 1;
    var_3.ignoreme = 1;
    var_3 attach( "machinery_welder_handle", "tag_inhand" );
    var_3 attach( "h2_civ_work_headgear_earmuffs" );
    var_3.hatmodel = "h2_civ_work_headgear_earmuffs";
    var_3.health = 6;
    var_3 maps\_utility::set_deathanim( "death_back" );
    var_1 thread maps\_anim::anim_loop_solo( var_3, "welding", "stop_welding" );
    thread _id_D561( var_3, "tag_tip_fx" );
    thread _id_D21D( var_3 );
    thread flashing_welding( var_2, "tag_tip_fx" );
    thread flashing_welding_death_handler( var_2 );
}

flashing_welding_death_handler( var_0 )
{
    var_1 = getent( "welding_light", "targetname" );
    var_0 waittill( "death" );
    var_1 common_scripts\utility::stop_loop_sound_on_entity( "scn_cliffhanger_welders_loop" );
    var_1 setlightintensity( 0 );
}

_id_D21D( var_0 )
{
    var_0 waittill( "death" );
}

_id_D561( var_0, var_1 )
{
    var_0 endon( "death" );
    var_2 = 0.2;
    var_3 = 1.5;
    var_4 = 0;

    for (;;)
    {
        var_4 = randomintrange( 1, 10 );

        while ( var_4 )
        {
            wait(randomfloatrange( 0.05, 0.1 ));
            playfxontag( level._effect["welding_runner"], var_0, var_1 );
            var_0 playsound( "elec_spark_welding_bursts" );
            var_4--;
            wait(randomfloatrange( 0.05, 0.1 ));
        }

        wait(randomfloatrange( var_2, var_3 ));
    }
}

flashing_welding( var_0, var_1 )
{
    var_0 endon( "death" );
    var_2 = getent( "welding_light", "targetname" );
    var_2 setlightcolor( ( 0.909804, 0.482353, 0.2 ) );
    var_2 thread common_scripts\utility::play_loop_sound_on_entity( "scn_cliffhanger_welders_loop" );
    var_3 = 0.2;
    var_4 = 1.5;
    var_5 = 2;
    var_6 = 0;
    var_7 = var_5;
    var_8 = 0;
    var_9 = undefined;
    var_10 = undefined;
    var_11 = 0;

    for (;;)
    {
        var_8 = randomintrange( 1, 10 );

        while ( var_8 )
        {
            wait(randomfloatrange( 0.05, 0.1 ));
            playfxontag( level._effect["welding_runner"], var_0, var_1 );
            var_0 playsound( "elec_spark_welding_bursts" );

            if ( var_11 )
                var_9 show();

            var_2 setlightintensity( var_5 );
            var_8--;
            wait(randomfloatrange( 0.05, 0.1 ));
            var_2 setlightintensity( var_6 );
        }

        var_2 setlightintensity( var_6 );

        if ( var_11 )
            var_9 hide();

        wait(randomfloatrange( var_3, var_4 ));
    }
}

_id_C281()
{
    common_scripts\utility::flag_wait( "mig_landing" );
    soundscripts\_snd::snd_message( "aud_mix_jet_landing" );
    var_0 = getent( "mig1", "targetname" );
    var_1 = var_0 maps\_utility::spawn_vehicle();
    var_1 notify( "stop_contrails" );
    var_1 maps\_vehicle_code::_id_BD08( 1 );
    var_1 common_scripts\utility::delay_script_call( 10, maps\_vehicle_code::_id_BD08, 0 );
    var_1.animname = "mig";
    var_2 = getnode( "jet_landing", "targetname" );
    var_1 thread maps\_utility::play_sound_on_entity( "scn_cliffhanger_jet_landing" );
    var_2 maps\_anim::anim_single_solo( var_1, "mig_landing1" );
    var_1 notify( "stop_engineeffects" );
    common_scripts\utility::flag_wait( "give_c4_obj" );
    var_1 delete();
}

_id_C21D()
{
    common_scripts\utility::flag_init( "climb_group_flag" );
    common_scripts\utility::flag_init( "snow_doors" );
    common_scripts\utility::flag_init( "light_storm" );
    common_scripts\utility::flag_init( "found_fueling_station" );
    common_scripts\utility::flag_init( "brought_friends" );
    common_scripts\utility::flag_init( "script_attack_override" );
    common_scripts\utility::flag_init( "mission_fail" );
    common_scripts\utility::flag_init( "cliffhanger_player_has_put_his_snowgoggles" );
    common_scripts\utility::flag_init( "clifftop_fire_position" );
    common_scripts\utility::flag_init( "clifftop_firefight" );
    common_scripts\utility::flag_init( "clifftop_area_done" );
    common_scripts\utility::flag_init( "clifftop_patrollers_spawned" );
    common_scripts\utility::flag_init( "clifftop_patrol1_dead" );
    common_scripts\utility::flag_init( "clifftop_patrol2_dead" );
    common_scripts\utility::flag_init( "hk_gives_chase" );
    common_scripts\utility::flag_init( "soap_cliff_climb_finished" );
    common_scripts\utility::flag_init( "tent1_patrollers_dead" );
    common_scripts\utility::flag_init( "tent1_lookouts_dead" );
    common_scripts\utility::flag_init( "blue_bldg_guys_dead" );
    common_scripts\utility::flag_init( "2story_roof_guys_dead" );
    common_scripts\utility::flag_init( "2story_slackers_dead" );
    common_scripts\utility::flag_init( "party_guys_dead" );
    common_scripts\utility::flag_init( "radar_bldg_guys_dead" );
    common_scripts\utility::flag_init( "container_guys_dead" );
    common_scripts\utility::flag_init( "clifftop_guys_move" );
    common_scripts\utility::flag_init( "delay_weapon_switch" );
    common_scripts\utility::flag_init( "first_encounter_dialog_starting" );
    common_scripts\utility::flag_init( "second_encounter_dialog_starting" );
    common_scripts\utility::flag_init( "said_two_tangos_in_front" );
    common_scripts\utility::flag_init( "c4_plant" );
    common_scripts\utility::flag_init( "blizzard_start" );
    common_scripts\utility::flag_init( "conversation_active" );
    common_scripts\utility::flag_init( "someone_became_alert" );
    common_scripts\utility::flag_init( "said_lets_split_up" );
    common_scripts\utility::flag_init( "dialog_danger_interupt" );
    common_scripts\utility::flag_init( "player_has_been_seen" );
    common_scripts\utility::flag_init( "player_on_runway_said_4_warnings" );
    common_scripts\utility::flag_init( "kill_variable_blizzard" );
    common_scripts\utility::flag_init( "said_thermal" );
    common_scripts\utility::flag_init( "player_killed_someone" );
    common_scripts\utility::flag_init( "one_c4_planted" );
    common_scripts\utility::flag_init( "mig_c4_planted" );
    common_scripts\utility::flag_init( "fuel_c4_planted" );
    common_scripts\utility::flag_init( "said_they_are_respawning" );
    common_scripts\utility::flag_init( "truck_guys_alerted" );
    common_scripts\utility::flag_init( "said_path_clear" );
    common_scripts\utility::flag_init( "soap_is_back" );
    common_scripts\utility::flag_init( "whiteout_started" );
    common_scripts\utility::flag_init( "done_with_stealth_camp" );
    common_scripts\utility::flag_init( "satbuilding_area_guys_dead" );
    common_scripts\utility::flag_init( "player_detonate" );
    common_scripts\utility::flag_init( "fence_walker_dead" );
    common_scripts\utility::flag_init( "satbuilding_smoker_dead" );
    common_scripts\utility::flag_init( "southeast_patroller_dead" );
    common_scripts\utility::flag_init( "satbuilding_patroller_dead" );
    common_scripts\utility::flag_init( "jeep_blown_up" );
    common_scripts\utility::flag_init( "jeep_stopped" );
    common_scripts\utility::flag_init( "price_moving_to_hanger" );
    common_scripts\utility::flag_init( "start_big_explosion" );
    common_scripts\utility::flag_init( "end_big_explosion" );
    common_scripts\utility::flag_init( "player_reloading" );
    common_scripts\utility::flag_init( "capture_enemies_dead" );
    common_scripts\utility::flag_init( "cliffhanger_soap_told_player_to_go_upstairs" );
    common_scripts\utility::flag_init( "cliffhanger_soap_told_player_to_get_to_hangar" );
    common_scripts\utility::flag_init( "base_c4_order" );
    common_scripts\utility::flag_init( "base_c4_planted" );
    common_scripts\utility::flag_init( "base_c4_price_done" );
    common_scripts\utility::flag_init( "icepick_noturningback" );
    common_scripts\utility::flag_init( "icepick_fight_stopshort" );
    common_scripts\utility::flag_init( "icepick_guys_driver_dead" );
    common_scripts\utility::flag_init( "icepick_guys_passenger_dead" );
    common_scripts\utility::flag_init( "icepick_brawl_stopshort" );
    common_scripts\utility::flag_init( "locker_room_noturningback" );
    common_scripts\utility::flag_init( "lockerroom_moment" );
    common_scripts\utility::flag_init( "lockerroom_defender_dead" );
    common_scripts\utility::flag_init( "locker_room_brawl_stopshort" );
    common_scripts\utility::flag_init( "locker_brawl_becomes_uninteruptable" );
    common_scripts\utility::flag_init( "start_busted_music" );
    common_scripts\utility::flag_init( "hanger_slowmo_ends" );
    common_scripts\utility::flag_init( "truckride_players_in_truck" );
    common_scripts\utility::flag_init( "escape_with_soap" );
    common_scripts\utility::flag_init( "tarmac_escape" );
    common_scripts\utility::flag_init( "hanger_reinforcements" );
    common_scripts\utility::flag_init( "tarmac_snowmobiles_spawned" );
    common_scripts\utility::flag_init( "price_ditches_player" );
    common_scripts\utility::flag_init( "player_gets_on_snowmobile" );
    common_scripts\utility::flag_init( "avalanche_begins" );
    common_scripts\utility::flag_init( "stay_away_from_bmp" );
    common_scripts\utility::flag_init( "first_two_guys_in_sight" );
    common_scripts\utility::flag_init( "check_heart_beat_sensor" );
    common_scripts\utility::flag_init( "price_starts_moving" );
    common_scripts\utility::flag_init( "clifftop_snowmobile_guys_die" );
    common_scripts\utility::flag_init( "player_snowmobile_available" );
    common_scripts\utility::flag_init( "price_enters_heli" );
    common_scripts\utility::flag_init( "avalanche_ride_starts" );
    common_scripts\utility::flag_init( "ending_heli_flies_in" );
    common_scripts\utility::flag_init( "bad_heli_missile_killed" );
    common_scripts\utility::flag_init( "player_boards" );
    common_scripts\utility::flag_init( "player_survived_minijump" );
    common_scripts\utility::flag_init( "h2_ending_begins" );
    common_scripts\utility::flag_init( "h2_ending_ends" );
}

_id_BE21()
{
    self endon( "death" );
    self setgoalpos( self.origin );
    self.goalradius = 64;
    common_scripts\utility::flag_wait( "near_camp_entrance" );
    maps\_utility::ent_flag_wait( "_stealth_normal" );
    maps\_patrol::patrol();
}

_id_C020()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getstruct( "struct_crate_patroller_enterhut", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == self )
            break;
    }

    maps\cliffhanger_stealth::_id_B727();
}

_id_CE0B()
{
    self endon( "death" );
    self setgoalpos( self.origin );
    self.goalradius = 64;
    common_scripts\utility::flag_wait( "dialog_take_point" );
    maps\_utility::ent_flag_wait( "_stealth_normal" );
    maps\_patrol::patrol();
}

_id_C577()
{
    self endon( "death" );
    self endon( "enemy" );

    for (;;)
    {
        if ( distancesquared( self.origin, level.player.origin ) < squared( self.footstepdetectdistsprint ) )
        {
            self.fovcosine = 0.01;
            return;
        }

        wait 0.5;
    }
}

_id_A927()
{
    self.footstepdetectdistwalk = 90;
    self.footstepdetectdist = 90;
    self.footstepdetectdistsprint = 90;
}

_id_C635()
{
    self waittill( "death", var_0 );

    if ( !isdefined( var_0 ) )
        return;

    if ( isplayer( var_0 ) )
        common_scripts\utility::flag_set( "player_killed_one_first_two_encounters" );
}

_id_D2ED()
{
    self endon( "death" );

    if ( self.script_noteworthy == "patrollers_1_rightguy" )
        setheadmodel( "head_opforce_arctic_b" );

    var_0 = maps\_stealth_utility::stealth_get_group_spotted_flag();

    if ( common_scripts\utility::flag( var_0 ) )
        return;

    level endon( var_0 );
    common_scripts\utility::flag_wait( "clifftop_guys_move" );
    waittillframeend;
    maps\_utility::ent_flag_wait( "_stealth_normal" );
    self notify( "stop_idle_proc" );
    self.script_patroller = 1;
    self.target = self.script_parameters;
    thread maps\_patrol::patrol();
}

setheadmodel( var_0 )
{
    if ( isdefined( self.headmodel ) )
        self detach( self.headmodel );

    self attach( var_0, "", 1 );
    self.headmodel = var_0;
}

_id_B988()
{
    var_0 = [];
    var_0["stand"] = 0;
    var_0["crouch"] = -800;
    var_0["prone"] = -500;
    var_1 = [];
    var_1["stand"] = 200;
    var_1["crouch"] = 0;
    var_1["prone"] = 0;
    var_2 = [];
    var_2["stand"] = 200;
    var_2["crouch"] = 0;
    var_2["prone"] = 0;
    maps\_stealth_utility::stealth_friendly_stance_handler_distances_set( var_0, var_1, var_2 );
}

_id_A8D9()
{
    var_0 = [];
    var_0[var_0.size] = "scoutsniper_ru1_passcig";
    var_0[var_0.size] = "scoutsniper_ru2_whoseturnisit";
    var_0[var_0.size] = "scoutsniper_ru1_wakeup";
    var_0[var_0.size] = "scoutsniper_ru2_buymotorbike";
    var_0[var_0.size] = "scoutsniper_ru1_tooexpensive";
    var_0[var_0.size] = "scoutsniper_ru2_illtakecareofit";
    var_0[var_0.size] = "scoutsniper_ru1_otherteam";
    var_0[var_0.size] = "scoutsniper_ru2_notwandering";
    var_0[var_0.size] = "scoutsniper_ru1_wandering";
    var_0[var_0.size] = "scoutsniper_ru2_zahkaevspayinggood";
    var_0[var_0.size] = "scoutsniper_ru1_wasteland";
    var_0[var_0.size] = "scoutsniper_ru2_whoseturnisit";
    var_0[var_0.size] = "scoutsniper_ru1_onourway";
    var_0[var_0.size] = "scoutsniper_ru1_passcig";
    var_0[var_0.size] = "scoutsniper_ru2_youidiot";
    var_0[var_0.size] = "scoutsniper_ru1_wakeup";
    var_0[var_0.size] = "scoutsniper_ru2_call";
    var_0[var_0.size] = "scoutsniper_ru1_tooexpensive";
    var_0[var_0.size] = "scoutsniper_ru2_americagoingtostartwar";
    var_0[var_0.size] = "scoutsniper_ru4_raise";
    var_0[var_0.size] = "scoutsniper_ru2_sendsomeonetocheck";
    var_0[var_0.size] = "scoutsniper_ru4_ifold";
    var_0[var_0.size] = "scoutsniper_ru2_andreibringingfood";
    var_0[var_0.size] = "scoutsniper_ru4_thisonesheavy";
    var_0[var_0.size] = "scoutsniper_ru2_quicklyaspossible";
    var_0[var_0.size] = "scoutsniper_ru4_didnteatbreakfast";
    var_0[var_0.size] = "scoutsniper_ru2_yescomrade";
    var_0[var_0.size] = "scoutsniper_ru4_takenzakhaevsoffer";
    var_0[var_0.size] = "scoutsniper_ru2_clearrotorblades";
    var_0[var_0.size] = "scoutsniper_ru2_radiationdosimeters";
    var_0[var_0.size] = "scoutsniper_ru4_canceltransactions";
    var_0[var_0.size] = "scoutsniper_ru2_dontbelieveatall";
    var_0[var_0.size] = "scoutsniper_ru4_cantwaitforshiftend";
    var_0[var_0.size] = "scoutsniper_ru2_ok";
    var_0[var_0.size] = "scoutsniper_ru4_hopeitdoesntrain";
    var_0[var_0.size] = "scoutsniper_ru2_professionaljob";
    level._id_CA2B = var_0;
}

_id_BA04()
{
    level._id_B361 = undefined;
    var_0 = undefined;
    _id_A8D9();
    var_1 = getspawnerteamarray( "axis" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_ADB6 );
    level._id_C036 = randomint( level._id_CA2B.size );

    while ( !common_scripts\utility::flag( "done_with_stealth_camp" ) )
    {
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        var_2 = undefined;
        var_3 = undefined;
        var_4 = getaiarray( "axis" );
        var_5 = common_scripts\utility::get_array_of_closest( maps\_utility::getaverageplayerorigin(), var_4 );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            if ( isdefined( var_5[var_6].script_chatgroup ) )
            {
                var_7 = var_5[var_6].script_chatgroup;
                var_2 = var_5[var_6];

                if ( var_2 maps\_utility::ent_flag_exist( "_stealth_normal" ) )
                {
                    if ( !var_2 maps\_utility::ent_flag( "_stealth_normal" ) )
                        continue;
                }

                var_3 = _id_D342( var_5, var_6, var_7 );

                if ( !isdefined( var_3 ) )
                    continue;

                if ( var_3 maps\_utility::ent_flag_exist( "_stealth_normal" ) )
                {
                    if ( !var_3 maps\_utility::ent_flag( "_stealth_normal" ) )
                        continue;
                }

                var_8 = distance( var_3.origin, var_2.origin );

                if ( var_8 > 220 )
                    continue;
                else
                    break;
            }
        }

        if ( isdefined( var_3 ) )
        {
            if ( isdefined( level._id_B361 ) )
            {
                if ( level._id_B361 == var_2 )
                    var_0 = var_3;
                else
                    var_0 = var_2;
            }
            else
                var_0 = var_2;

            var_0 _id_B85A( level._id_CA2B[level._id_C036] );
            level._id_C036++;

            if ( level._id_C036 >= level._id_CA2B.size )
                level._id_C036 = 0;

            level._id_B361 = var_0;
            wait 0.5;
            continue;
        }

        wait 2;
    }
}

_id_ADB6()
{
    if ( !isdefined( self.script_chatgroup ) )
        return;

    self endon( "death" );
    maps\_utility::ent_flag_init( "mission_dialogue_kill" );
    _id_BBF6();
    maps\_utility::ent_flag_set( "mission_dialogue_kill" );
}

_id_BBF6()
{
    self endon( "death" );
    self endon( "event_awareness" );
    self endon( "enemy" );
    common_scripts\utility::flag_wait_any( "_stealth_spotted", "_stealth_found_corpse" );
}

_id_B85A( var_0 )
{
    if ( maps\_utility::is_dead_sentient() )
        return;

    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1 endon( "death" );
    thread maps\_utility::delete_on_death_wait_sound( var_1, "sounddone" );
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_1 linkto( self );
    var_1 playsound( var_0, "sounddone" );
    _id_D5B6( var_1 );

    if ( isalive( self ) )
        self notify( "play_sound_done" );

    var_1 playrumbleonentity();
    wait 0.05;
    var_1 delete();
}

_id_D5B6( var_0 )
{
    self endon( "death" );
    self endon( "mission_dialogue_kill" );
    var_0 waittill( "sounddone" );
}

_id_D342( var_0, var_1, var_2 )
{
    for ( var_3 = var_1 + 1; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_0[var_3].script_chatgroup ) )
        {
            if ( var_0[var_3].script_chatgroup == var_2 )
                return var_0[var_3];
        }
    }

    return undefined;
}

_id_BA46()
{
    var_0 = [];
    var_0["stand"] = 0;
    var_0["crouch"] = -300;
    var_0["prone"] = -500;
    var_1 = [];
    var_1["stand"] = 0;
    var_1["crouch"] = 0;
    var_1["prone"] = 0;
    var_2 = [];
    var_2["stand"] = 200;
    var_2["crouch"] = 0;
    var_2["prone"] = 0;
    maps\_stealth_utility::stealth_friendly_stance_handler_distances_set( var_0, var_1, var_2 );
}

_id_C76B()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_0 maps\_stealth_utility::stealth_ai_idle_and_react( self, "lean_balcony", "lean_react" );
}

_id_AB06()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_0 maps\_stealth_utility::stealth_ai_idle_and_react( self, "sit_idle", "sit_react" );
}

_id_C2E7( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    thread _id_B487();
}

_id_B487()
{
    level notify( "camp_save" );
    maps\_utility::autosave_stealth();
}

_id_C5DE()
{
    var_0 = getent( "force_ik_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isplayer( var_1 ) && !var_1 animscripts\utility::isincombat() )
            var_1 _meth_85AB( 1 );
    }
}

_id_B175()
{
    var_0 = getent( "force_off_ik_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !_func_2A5( var_1 ) )
            var_1 _meth_85AB( 0 );
    }
}

_id_C5C1( var_0 )
{
    if ( common_scripts\utility::flag( "mission_fail" ) )
        return;

    common_scripts\utility::flag_set( "mission_fail" );
    setdvar( "ui_deadquote", level.strings[var_0] );
    maps\_utility::missionfailedwrapper();
}

_id_B0BC()
{
    if ( !isdefined( level._id_D137 ) )
        level._id_D137 = 0;

    level._id_D137++;
    self.script_flag = "base_c4_num_" + level._id_D137;
    common_scripts\utility::flag_init( self.script_flag );
    waittillframeend;

    if ( self.script_noteworthy == "mig_c4" )
        thread _id_CB14();
    else
    {
        self show();
        thread maps\_utility::add_c4_glow( self.script_flag );
    }

    self makeusable();
    thread maps\_utility::_id_AB48( 0.86, [ "trigger" ] );
    self setcursorhint( "HINT_ACTIVATE" );
    thread common_scripts\utility::_id_AE1E( level.player, level.strings["hint_c4_plant"], level.strings["hint_c4_plant_keyboard_mouse"], "trigger" );
    self waittill( "trigger" );
    self makeunusable();
    level.player thread _id_D1EB();
    common_scripts\utility::flag_wait( "c4_placed" );
    thread maps\_utility::play_sound_on_entity( "detpack_plant" );
    common_scripts\utility::flag_set( self.script_flag );
    level._id_D137--;

    if ( self.script_noteworthy == "mig_c4" )
        common_scripts\utility::flag_set( "mig_c4_planted" );
    else
        common_scripts\utility::flag_set( "fuel_c4_planted" );

    common_scripts\utility::flag_set( "one_c4_planted" );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "actionSlotsHide", 0 );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "ammoCounterHide", 0 );
    common_scripts\utility::flag_set( "base_c4_planted" );
    common_scripts\utility::flag_wait( "player_detonate" );
    var_0 = getentarray( "possible_c4_models", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

_id_CB14()
{
    var_0 = getentarray( "possible_c4_models", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 hide();

    var_4 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_4 show();
    var_4 setmodel( "weapon_c4_obj" );
    self.origin = var_4.origin;

    for ( var_5 = undefined; !common_scripts\utility::flag( "mig_c4_planted" ); var_4 = var_5 )
    {
        var_5 = common_scripts\utility::getclosest( level.player.origin, var_0 );

        if ( var_4 != var_5 )
        {
            var_4 hide();
            var_5 show();
            var_5 setmodel( "weapon_c4_obj" );
            self.origin = var_5.origin;
        }

        wait 0.05;
    }

    var_5 setmodel( "weapon_c4" );
    var_5 thread _id_AAAB::playc4effects();
}

_id_A934( var_0 )
{
    self notify( "follow_player" );
    self endon( "follow_player" );
    self endon( "stop_following_player" );
    self.goalradius = var_0 * 0.9;

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );

        if ( distance( level.player.origin, self.origin ) > var_0 )
            self setgoalpos( level.player.origin );

        wait 0.5;
    }
}

_id_D3E3( var_0 )
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

    level.player setorigin( var_2[0].origin );
    level.player setplayerangles( var_2[0].angles );
}

_id_C8C9()
{
    wait 2;
    _id_BD26( "obj_satellite", &"CLIFFHANGER_OBJ_COMPUTER", ( 0.0, 0.0, 0.0 ) );
    _id_C7C7( "obj_satellite", "active", 0 );
}

_id_CB97()
{
    wait 4;
    _id_BD26( "obj_follow_price", &"CLIFFHANGER_OBJ_FOLLOW", ( 0.0, 0.0, 0.0 ) );
    _id_C7C7( "obj_follow_price", "current", 0 );
    _id_B333( "obj_follow_price", 1 );
    common_scripts\utility::flag_wait( "reached_top" );
    _id_BC20( "obj_follow_price", level.price, ( 0.0, 0.0, 60.0 ) );
    common_scripts\utility::flag_wait( "price_go_to_climb_ridge" );
    _id_C7C7( "obj_follow_price", "done" );
}

_id_BD15()
{
    var_0 = maps\_utility::getentwithflag( "give_c4_obj" );
    var_1 = ( -5164.0, -24502.5, 999.5 );
    _id_BD26( "obj_enter", &"CLIFFHANGER_OBJ_BASE", var_1 );
    _id_C7C7( "obj_enter", "current" );
    _id_B333( "obj_enter", 1 );
    common_scripts\utility::flag_wait( "give_c4_obj" );
    _id_C7C7( "obj_enter", "done" );
}

_id_D0CE()
{
    var_0 = getent( "fuel_tank_c4", "script_noteworthy" );
    var_1 = var_0.origin;
    _id_BD26( "obj_fuel", &"CLIFFHANGER_OBJ_C4", var_1 );
    _id_C7C7( "obj_fuel", "current" );
    _id_B333( "obj_fuel", 1 );
    var_2 = getent( "mig_c4", "script_noteworthy" );
    var_1 = var_2.origin;
    _id_BD26( "obj_mig", &"CLIFFHANGER_OBJ_C4_MIG", var_1 );
    _id_B333( "obj_mig", 1 );
    _id_C7C7( "obj_mig", "current" );
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "fuel_c4_planted" );
    level maps\_utility::add_func( ::_id_C7C7, "obj_fuel", "done" );
    thread maps\_utility::do_wait();
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "mig_c4_planted" );
    level maps\_utility::add_func( ::_id_C7C7, "obj_mig", "done" );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "base_c4_planted" );
}

_id_CD7E()
{
    var_0 = getent( "fuel_tank_c4", "script_noteworthy" );
    var_1 = var_0.origin;
    _id_BD26( "obj_fuel", &"CLIFFHANGER_OBJ_C4", var_1 );
    _id_C7C7( "obj_fuel", "current" );
    _id_B333( "obj_fuel", 1 );
    common_scripts\utility::flag_wait( "fuel_c4_planted" );
    _id_C7C7( "obj_fuel", "done" );
}

_id_B7F1()
{
    var_0 = getent( "mig_c4", "script_noteworthy" );
    var_1 = var_0.origin;
    _id_BD26( "obj_mig", &"CLIFFHANGER_OBJ_C4_MIG", var_1 );
    _id_B333( "obj_mig", 1 );

    if ( !common_scripts\utility::flag( "mig_c4_planted" ) )
        _id_C7C7( "obj_mig", "current" );

    common_scripts\utility::flag_wait( "mig_c4_planted" );
    _id_C7C7( "obj_mig", "done" );
}

_id_C889()
{
    var_0 = getent( "mig_c4", "script_noteworthy" );
    var_1 = var_0.origin;
    _id_BD26( "obj_mig", &"CLIFFHANGER_OBJ_FUEL_STATION", var_1 );
    _id_B333( "obj_mig", 1 );

    if ( !common_scripts\utility::flag( "mig_c4_planted" ) )
        _id_C7C7( "obj_mig", "current" );

    thread hide_snow_decals();
    common_scripts\utility::flag_wait( "mig_c4_planted" );
    _id_C7C7( "obj_mig", "done" );
}

_id_C8F7()
{
    common_scripts\utility::flag_wait( "cliffhanger_soap_told_player_to_get_to_hangar" );
    var_0 = maps\_utility::getentwithflag( "at_hanger_entrance" );
    var_1 = var_0.origin;
    _id_BD26( "obj_goto_hanger", &"CLIFFHANGER_OBJ_GOTO_HANGER", var_1 );
    _id_C7C7( "obj_goto_hanger", "current" );
    _id_B333( "obj_goto_hanger", 1 );
    common_scripts\utility::flag_wait( "at_hanger_entrance" );
    _id_C7C7( "obj_goto_hanger", "done" );
}

_id_AC1F()
{
    common_scripts\utility::flag_wait( "player_on_backdoor_path" );
    common_scripts\utility::flag_wait( "player_in_hanger" );
    common_scripts\utility::flag_wait( "cliffhanger_soap_told_player_to_go_upstairs" );
    _id_B2F2( "obj_satellite", &"CLIFFHANGER_OBJ_COMPUTER" );
    _id_C7C7( "obj_satellite", "current" );
    _id_BC20( "obj_satellite", level.price );
    var_0 = getent( "dsm", "targetname" );
    _id_D393( "obj_satellite", var_0.origin );
    common_scripts\utility::flag_wait( "keyboard_used" );
    _id_C7C7( "obj_satellite", "done" );
}

_id_CF61()
{
    common_scripts\utility::flag_wait( "escape_with_soap" );

    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    _id_BD26( "obj_exfiltrate", &"CLIFFHANGER_OBJ_EVACUATE", ( 0.0, 0.0, 0.0 ) );
    _id_BC20( "obj_exfiltrate", level.price );
    _id_C7C7( "obj_exfiltrate", "current" );
    common_scripts\utility::flag_wait( "player_slides_down_hill" );
    _id_BC20( "obj_exfiltrate", level.price );
    wait 2.1;
    _id_BC20( "obj_exfiltrate", level.price );
    common_scripts\utility::flag_wait( "player_snowmobile_available" );
    _id_C7C7( "obj_exfiltrate", "active", 0 );
}

_id_AAD5()
{
    if ( !isalive( level.price ) )
        return;

    _id_BD26( "obj_snowmobile", &"CLIFFHANGER_OBJ_SNOWMOBILE", level._id_BE57.origin + ( 0.0, 0.0, 48.0 ) );
    _id_C7C7( "obj_snowmobile", "current" );
    _id_B333( "obj_snowmobile", 1 );
    common_scripts\utility::flag_wait( "player_rides_snowmobile" );
    soundscripts\_snd::snd_message( "aud_start_mix_snowmobile_ride" );
    _id_C7C7( "obj_snowmobile", "current" );
    _id_C7C7( "obj_snowmobile", "done", 0 );
    var_0 = getent( "objective_end_org", "targetname" );
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1 thread maps\cliffhanger_snowmobile_code::_id_D259();
    objective_add( 9, "current", &"CLIFFHANGER_OBJ_EXTRACT", ( 0.0, 0.0, 0.0 ) );
    objective_current( 9 );
    _func_1E7( 9, 1 );
    maps\cliffhanger_snowmobile_code::_id_B0B3( 9, "obj_1" );
    common_scripts\utility::flag_wait( "player_starts_snowmobile_trip" );
    maps\cliffhanger_snowmobile_code::_id_B0B3( 9, "player_starts_snowmobile_trip" );
    common_scripts\utility::flag_wait( "obj_2" );
    maps\cliffhanger_snowmobile_code::_id_B0B3( 9, "obj_2" );
    common_scripts\utility::flag_wait( "obj_3" );
    maps\cliffhanger_snowmobile_code::_id_B0B3( 9, "obj_3" );
    common_scripts\utility::flag_wait( "obj_4" );
    maps\cliffhanger_snowmobile_code::_id_B0B3( 9, "obj_4" );
    common_scripts\utility::flag_wait( "obj_5" );
    maps\cliffhanger_snowmobile_code::_id_B0B3( 9, "obj_5" );
    common_scripts\utility::flag_wait( "enemy_snowmobiles_wipe_out" );
    maps\cliffhanger_snowmobile_code::_id_B0B3( 9, "enemy_snowmobiles_wipe_out" );
    common_scripts\utility::flag_wait( "player_reaches_hilltop" );
    objective_position( 9, var_1.origin );
    objective_position( 9, var_0.origin );
    common_scripts\utility::flag_wait( "there_is_chopper" );
    maps\_utility::objective_complete( 9 );
    _id_C7C7( "obj_exfiltrate", "done", 0 );
    setsaveddvar( "compass", "0" );
}

_id_BD26( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_init( var_0 );
    var_3 = maps\_utility::obj( var_0 );
    var_4 = spawnstruct();
    var_4.name = var_0;
    var_4.id = var_3;
    var_4.state = "invisible";
    var_4.text = var_1;
    var_4.origin = var_2;
    var_4._id_BB0E = 0;
    level.objectives[var_0] = var_4;
    return var_4;
}

_id_C7C7( var_0, var_1, var_2 )
{
    var_3 = level.objectives[var_0];
    var_3.state = var_1;

    if ( isdefined( var_2 ) )
        var_3._id_AA6F = var_2;
    else
        var_3._id_AA6F = 1;

    if ( !var_3._id_BB0E )
    {
        objective_add( var_3.id, var_3.state, var_3.text, var_3.origin );
        var_3._id_BB0E = 1;
    }
    else if ( var_3._id_AA6F )
        objective_state( var_3.id, var_3.state );
    else
        objective_state_nomessage( var_3.id, var_3.state );

    if ( var_3.state == "done" )
        common_scripts\utility::flag_set( var_0 );
}

_id_B333( var_0, var_1 )
{
    var_2 = level.objectives[var_0];
    var_2._id_BF8A = var_1;
    _func_1E7( maps\_utility::obj( var_0 ), var_2._id_BF8A );
}

_id_B2F2( var_0, var_1 )
{
    var_2 = level.objectives[var_0];
    var_2.text = var_1;
    objective_string( var_2.id, var_1 );
}

_id_D393( var_0, var_1 )
{
    var_2 = level.objectives[var_0];
    var_2._id_BA07 = var_1;
    objective_position( var_2.id, var_2._id_BA07 );
    objective_setpointertextoverride( var_2.id, "" );
}

_id_D309( var_0, var_1 )
{
    var_2 = level.objectives[var_0];
    objective_setpointertextoverride( var_2.id, var_1 );
}

_id_C1A3( var_0, var_1, var_2 )
{
    var_3 = level.objectives[var_0];

    if ( !var_2 )
        objective_string( var_3.id, var_1 );
    else
        objective_string( var_3.id, var_1, var_2 );
}

_id_BC20( var_0, var_1, var_2 )
{
    var_3 = maps\_utility::obj( var_0 );

    if ( isdefined( var_2 ) )
        objective_onentity( var_3, var_1, var_2 );
    else
        objective_onentity( var_3, var_1 );
}

_id_AB67()
{
    return undefined;
}

_id_B70A()
{
    precachemodel( "machinery_welder_handle" );
    precachemodel( "h2_civ_work_headgear_earmuffs" );
    precachemodel( "com_propane_tank02_des_decal" );
    precachemodel( "h2_acs_module_obj" );
    precacheshader( "h2_overlay_frozen_l" );
    precacheshader( "h2_overlay_frozen_r" );
    precacheshader( "h2_overlays_snowgoggles_distortion_l" );
    precacheshader( "h2_overlays_snowgoggles_distortion_r" );
    precacheshader( "h2_overlays_snowgoggles_shadow_l" );
    precacheshader( "h2_overlays_snowgoggles_shadow_r" );
    precacheshader( "h2_overlays_snowgoggles_put" );
    precacheshader( "h1_hud_overlay_eyelids_vignette_blur" );
    precacheshader( "h2_overlays_snowgoggles_corner_blur_l" );
    precacheshader( "h2_overlays_snowgoggles_corner_blur_r" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    level.strings["fuel_station_obj"] = &"CLIFFHANGER_OBJ_FUEL_STATION";
    level.strings["use_satelite_obj"] = &"CLIFFHANGER_OBJ_USE_SATELITE";
    level.strings["goto_hanger_obj"] = &"CLIFFHANGER_OBJ_GOTO_HANGER";
    level.strings["obj_package"] = &"CLIFFHANGER_OBJ_PACKAGE";
    level.strings["obj_base"] = &"CLIFFHANGER_OBJ_BASE";
    level.strings["obj_c4"] = &"CLIFFHANGER_OBJ_C4";
    level.strings["obj_fuel"] = &"CLIFFHANGER_OBJ_FIND_FUEL";
    level.strings["obj_c4_mig"] = &"CLIFFHANGER_OBJ_C4_MIG";
    level.strings["hint_c4_plant"] = &"SCRIPT_PLATFORM_HINTSTR_PLANTEXPLOSIVES";
    level.strings["hint_c4_plant_keyboard_mouse"] = &"SCRIPT_PLATFORM_HINTSTR_PLANTEXPLOSIVES_KBM";
    level.strings["obj_snowmobile"] = &"CLIFFHANGER_OBJ_EVACUATE";

    foreach ( var_1 in level.strings )
        precachestring( var_1 );
}

_id_C734()
{
    var_0 = getentarray( "base_c4_models", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 hide();
}

player_init()
{
    level.player maps\cliffhanger_stealth::_id_BD60();
    level.player thread maps\_utility::_id_B43E();
    maps\_utility::player_speed_percent( 90 );
    _id_B8D6();
}

_id_B8D6()
{
    level.player takeallweapons();
    level._id_B703 = "alt_masada_silencer_mt_camo_on_h2";
    level._id_ABE5 = "masada_silencer_mt_camo_on_h2";
    level.player giveweapon( level._id_ABE5 );
    level.player switchtoweapon( level._id_B703 );
    level._id_C350 = "usp_silencer";
    level.player giveweapon( level._id_C350 );
    level.player setoffhandprimaryclass( "fraggrenade" );
    level.player giveweapon( "fraggrenade" );
    level.player setoffhandsecondaryclass( "flash_grenade" );
    level.player giveweapon( "flash_grenade" );
}

enemy_init()
{
    wait 0.5;
    anim.shootenemywrapper_func = ::_id_CE8C;
}

do_nothing()
{

}

_id_B928()
{
    level endon( "stop_price_shield" );

    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) > 1300 )
        {
            maps\_utility::stop_magic_bullet_shield();

            while ( distance( level.player.origin, self.origin ) > 1300 )
                wait 0.1;

            thread maps\_utility::magic_bullet_shield();
        }

        wait 0.1;
    }
}

_id_C0CD()
{
    self waittill( "death" );
    thread _id_C5C1( "fail_price_dead" );
}

_id_CF73()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "animscript_shot" );

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
            continue;
    }
}

_id_CE8C( var_0 )
{
    self notify( "animscript_shot" );
    animscripts\utility::shootenemywrapper_normal( var_0 );
}

_id_AB89()
{
    level._id_D1C4 = getent( "price_a", "targetname" );
    level._id_D1C4 maps\_utility::make_hero();
    level._id_D1C4.animname = "price_a";
    level._id_AC83 = getent( "price_b", "targetname" );
    level._id_AC83 maps\_utility::make_hero();
    level._id_AC83.animname = "price_b";
    level._id_AA67 = getent( "price_c", "targetname" );
    level._id_AA67 maps\_utility::make_hero();
    level._id_AA67.animname = "price_c";
    level._id_CAFF = getent( "price_d", "targetname" );
    level._id_CAFF maps\_utility::make_hero();
    level._id_CAFF.animname = "price_d";
    level._id_BAB0 = getent( "cake_a", "targetname" );
    level._id_BAB0 maps\_utility::make_hero();
    level._id_BAB0.animname = "cake_a";
    level._id_C594 = getent( "cake_b", "targetname" );
    level._id_C594 maps\_utility::make_hero();
    level._id_C594.animname = "cake_b";
    level._id_B8AE = getent( "cake_c", "targetname" );
    level._id_B8AE maps\_utility::make_hero();
    level._id_B8AE.animname = "cake_c";
    level._id_ACCC = getent( "cake_d", "targetname" );
    level._id_ACCC maps\_utility::make_hero();
    level._id_ACCC.animname = "cake_d";
    level._id_CBE0 = getent( "price_jump", "targetname" );
    level._id_CBE0 maps\_utility::make_hero();
    level._id_CBE0.animname = "price_jump";
    var_0 = getent( "climbing_ref", "targetname" );
    var_1 = [];
    var_1[var_1.size] = level._id_D1C4;
    var_1[var_1.size] = level._id_AC83;
    var_1[var_1.size] = level._id_AA67;
    var_1[var_1.size] = level._id_CAFF;
    var_1[var_1.size] = level._id_BAB0;
    var_1[var_1.size] = level._id_C594;
    var_1[var_1.size] = level._id_B8AE;
    var_1[var_1.size] = level._id_ACCC;
    var_2 = [];
    var_2[var_2.size] = level._id_CBE0;
    level._id_D1C4 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_inhand" );
    level._id_D1C4 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_weapon_left" );
    level._id_AC83 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_inhand" );
    level._id_AC83 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_weapon_left" );
    level._id_AA67 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_inhand" );
    level._id_AA67 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_weapon_left" );
    level._id_CAFF maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_inhand" );
    level._id_CAFF maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_weapon_left" );
    level._id_BAB0 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_inhand" );
    level._id_BAB0 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_weapon_left" );
    level._id_C594 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_inhand" );
    level._id_C594 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_weapon_left" );
    level._id_B8AE maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_inhand" );
    level._id_B8AE maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_weapon_left" );
    level._id_ACCC maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_inhand" );
    level._id_ACCC maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_weapon_left" );
    level._id_CBE0 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_inhand" );
    level._id_CBE0 maps\_anim::anim_spawn_tag_model( "weapon_ice_picker", "tag_weapon_left" );
    var_0 maps\_anim::anim_first_frame( var_1, "climbing_test_scene" );

    for (;;)
    {
        var_0 maps\_anim::anim_single_solo( level._id_CBE0, "climbing_test_jump1" );
        wait 3;
        var_0 maps\_anim::anim_single_solo( level._id_CBE0, "climbing_test_jump2" );
        wait 3;
        var_0 maps\_anim::anim_single_solo( level._id_CBE0, "climbing_test_jump3" );
        wait 3;
        var_0 maps\_anim::anim_single_solo( level._id_CBE0, "climbing_test_jump4" );
        wait 3;
        var_0 maps\_anim::anim_single_solo( level._id_CBE0, "climbing_test_jump5" );
        wait 3;
        var_0 maps\_anim::anim_single_solo( level._id_CBE0, "climbing_test_jump6" );
        wait 3;
    }
}

_id_CEB0()
{
    level.player endon( "death" );
    level endon( "price_moving_to_hanger" );
    var_0 = [];
    var_0[var_0.size] = "cliff_pri_notsneaky";
    var_0[var_0.size] = "cliff_pri_dontalertthem";
    var_0[var_0.size] = "cliff_pri_sloppy";
    var_0[var_0.size] = "cliff_pri_silencers";
    var_1 = randomint( var_0.size );
    var_2 = [];
    var_2[var_2.size] = "cliff_pri_theygoingback";
    var_2[var_2.size] = "cliff_pri_youreclear";
    var_2[var_2.size] = "cliff_pri_resthavegivenup";

    for (;;)
    {
        common_scripts\utility::flag_wait( "_stealth_spotted" );
        wait 1;
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        wait 1;
        _id_AF47( var_0[var_1] );
        var_1++;

        if ( var_1 >= var_0.size )
            var_1 = 0;

        if ( common_scripts\utility::flag( "said_lets_split_up" ) )
        {
            wait 1;
            _id_AF47( var_2[randomint( var_2.size )] );
        }
    }
}

_id_C6B6()
{
    common_scripts\utility::flag_wait( "price_go_to_climb_ridge" );
    level endon( "start_big_explosion" );
    var_0 = [];
    var_0[var_0.size] = "cliff_pri_takecover";
    var_0[var_0.size] = "cliff_pri_beenspotted";
    var_0[var_0.size] = "cliff_pri_foundyou";
    var_0[var_0.size] = "cliff_pri_multipledirections";
    var_0 = common_scripts\utility::array_randomize( var_0 );
    var_1 = 0;

    for (;;)
    {
        common_scripts\utility::flag_wait( "_stealth_spotted" );
        _id_C5EC( var_0[var_1] );
        var_1++;

        if ( var_1 >= var_0.size )
            var_1 = 0;

        wait 1;
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        wait 1;
    }
}

_id_D58D()
{
    var_0 = [];
    var_0[var_0.size] = "cliff_pri_tangoleft";
    var_0[var_0.size] = "cliff_pri_targetleft";
    var_1 = [];
    var_1[var_1.size] = "cliff_pri_hostileright";
    var_1[var_1.size] = "cliff_pri_targetright";
    var_2 = [];
    var_2[var_2.size] = "cliff_pri_tangosix";
    var_2[var_2.size] = "cliff_pri_targetbehindyou";
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;
    var_6 = 2;
    var_7 = 5000;
    level endon( "price_moving_to_hanger" );

    while ( !common_scripts\utility::flag( "done_with_stealth_camp" ) && !common_scripts\utility::flag( "price_moving_to_hanger" ) )
    {
        for (;;)
        {
            wait 0.5;
            var_8 = getaiarray( "axis" );
            var_8 = common_scripts\utility::get_array_of_closest( level.player.origin, var_8, undefined, undefined, 800, undefined );

            if ( var_8.size == 0 )
                continue;

            foreach ( var_10 in var_8 )
            {
                if ( !var_10 cansee( level.player ) )
                    continue;

                if ( var_10 maps\_utility::doinglongdeath() )
                    continue;

                var_11 = level.player.origin;
                var_12 = level.player.angles;
                var_13 = var_10.origin;
                var_14 = vectornormalize( var_13 - var_11 );
                var_15 = anglestoforward( var_12 );
                var_16 = vectordot( var_15, var_14 );

                if ( var_16 >= 0.77 )
                    continue;

                var_17 = gettime();

                if ( var_16 < -0.77 )
                {
                    if ( var_17 > var_5 + var_7 )
                    {
                        var_5 = var_17;
                        var_18 = var_2[randomint( var_2.size )];
                        thread _id_AF47( var_18 );
                        wait(var_6);
                        break;
                    }
                    else
                        continue;
                }

                var_19 = anglestoright( var_12 );
                var_20 = vectordot( var_19, var_14 );

                if ( var_20 < 0 )
                {
                    if ( var_17 > var_3 + var_7 )
                    {
                        var_3 = var_17;
                        var_18 = var_0[randomint( var_0.size )];
                        thread _id_AF47( var_18 );
                        wait(var_6);
                        break;
                    }
                    else
                        continue;

                    continue;
                }

                if ( var_17 > var_4 + var_7 )
                {
                    var_4 = var_17;
                    var_18 = var_1[randomint( var_1.size )];
                    thread _id_AF47( var_18 );
                    wait(var_6);
                    break;
                }
                else
                    continue;
            }
        }
    }
}

_id_B056()
{
    self waittill( "death", var_0, var_1 );

    if ( !isdefined( var_0 ) )
        return;

    if ( isplayer( var_0 ) )
        common_scripts\utility::flag_set( "player_killed_someone" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    if ( common_scripts\utility::flag( "conversation_active" ) )
        return;

    if ( !maps\_stealth_utility::stealth_is_everything_normal() )
        return;

    if ( common_scripts\utility::flag( "price_moving_to_hanger" ) )
        return;

    if ( isplayer( var_0 ) )
    {
        wait 1;

        if ( !maps\_stealth_utility::stealth_is_everything_normal() )
            return;

        if ( !isdefined( level._id_B36B ) )
            level._id_B36B = gettime();
        else if ( gettime() < level._id_B36B + 15000 )
            return;

        level._id_B36B = gettime();

        if ( var_1 != "MOD_RIFLE_BULLET" && var_1 != "MOD_PISTOL_BULLET" )
            _id_AF47( "cliff_pri_melee_plyr" );
        else
            _id_AF47( "cliff_pri_killfirm_plyr" );
    }
}

_id_B957()
{
    self waittill( "trigger", var_0 );
    var_0 notify( "target_stop" );
    var_0 thread _id_C385();
}

_id_CA1A()
{
    self waittill( "trigger", var_0 );
    var_0 notify( "target_stop" );
}

_id_C385()
{
    level endon( "price_moving_to_hanger" );
    self endon( "death" );
    self endon( "target_stop" );

    for (;;)
    {
        maps\_utility::waittill_entity_in_range( level.player, 650 );
        maps\_utility::waittill_player_lookat_for_time( 0.4 );

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
            return;

        if ( maps\cliffhanger_stealth::_id_BC18() )
        {
            if ( !isdefined( level._id_C46E ) )
                level._id_C46E = 0;

            thread _id_C139();
            return;
        }

        wait 3;
    }
}

_id_C139()
{
    var_0 = [];
    var_0[var_0.size] = "cliff_pri_hesmine";
    var_0[var_0.size] = "cliff_pri_takethisone";
    var_0[var_0.size] = "cliff_pri_ivegothim";
    var_0[var_0.size] = "cliff_pri_onesmine";
    var_0[var_0.size] = "cliff_pri_illtakehim";
    var_1 = _id_AF47( var_0[level._id_C46E] );

    if ( !var_1 )
        return;

    level._id_C46E++;

    if ( level._id_C46E >= var_0.size )
        level._id_C46E = 0;

    if ( isalive( self ) )
    {
        var_2 = self geteye();
        var_3 = vectornormalize( level.price.origin - var_2 );
        var_3 *= 20;
        var_4 = var_2 + var_3;
        magicbullet( level.price.weapon, var_4, var_2 );

        if ( isalive( self ) )
        {
            if ( isdefined( self.magic_bullet_shield ) && self.magic_bullet_shield )
                maps\_utility::stop_magic_bullet_shield();

            self kill();
            return;
        }
    }
    else
    {
        wait 0.5;

        if ( common_scripts\utility::cointoss() )
            _id_AF47( "cliff_pri_nevermind" );
        else
            _id_AF47( "cliff_pri_maybenot" );
    }
}

_id_AAB6()
{
    level endon( "price_moving_to_hanger" );
    self waittill( "death", var_0 );

    if ( !isdefined( var_0 ) )
        return;

    if ( level.price == var_0 )
        _id_AF47( "UK_pri_inform_killfirm_generic_s" );
}

_id_D284()
{
    var_0 = [];
    var_0[var_0.size] = "cliff_pri_foundabody";
    var_0[var_0.size] = "cliff_pri_keepquiet";
    var_0[var_0.size] = "cliff_pri_staycalm";
    level endon( "price_moving_to_hanger" );
    var_1 = 0;

    while ( !common_scripts\utility::flag( "done_with_stealth_camp" ) )
    {
        common_scripts\utility::flag_wait( "_stealth_found_corpse" );

        if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
        {
            _id_AF47( var_0[var_1] );
            var_1++;

            if ( var_1 >= var_0.size )
                var_1 = 0;
        }

        common_scripts\utility::flag_waitopen( "_stealth_found_corpse" );
    }
}

_id_B192()
{
    var_0 = [];
    var_0[var_0.size] = "cliff_pri_outofsight";
    var_0[var_0.size] = "cliff_pri_hidealerted";
    var_0[var_0.size] = "cliff_pri_sightalertedone";
    self endon( "death" );
    maps\_utility::ent_flag_waitopen( "_stealth_normal" );

    if ( common_scripts\utility::flag( "someone_became_alert" ) )
        return;

    common_scripts\utility::flag_set( "someone_became_alert" );
    self endon( "jumpedout" );
    level maps\_utility::add_wait( ::wait_till_every_thing_stealth_normal_for, 3 );
    level maps\_utility::add_func( common_scripts\utility::flag_clear, "someone_became_alert" );
    thread maps\_utility::do_wait();
    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    wait 2;

    if ( common_scripts\utility::flag( "price_moving_to_hanger" ) )
        return;

    var_1 = var_0[randomint( var_0.size )];
    _id_C4F8();
    maps\_utility::radio_dialogue( var_1 );
}

wait_till_every_thing_stealth_normal_for( var_0 )
{
    for (;;)
    {
        if ( maps\_stealth_utility::stealth_is_everything_normal() )
        {
            wait(var_0);

            if ( maps\_stealth_utility::stealth_is_everything_normal() )
                return;
        }

        wait 1;
    }
}

_id_AE79()
{
    common_scripts\utility::flag_wait( "give_c4_obj" );
    level.player endon( "death" );
    level endon( "one_c4_planted" );
    var_0 = getent( "base_c4_models", "targetname" ).origin;
    level.player maps\_utility::waittill_in_range( var_0, 600 );
    _id_AF47( "cliff_pri_fuelingstation", 1, 2 );
    level.player maps\_utility::waittill_in_range( var_0, 180 );
    common_scripts\utility::flag_set( "found_fueling_station" );
    _id_AF47( "cliff_pri_foundit", 1, 2 );
}

_id_AE28()
{
    common_scripts\utility::flag_wait( "give_c4_obj" );
    level endon( "one_c4_planted" );
    var_0 = 1;

    for (;;)
    {
        wait 50;

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        {
            common_scripts\utility::flag_waitopen( "_stealth_spotted" );
            continue;
        }

        if ( common_scripts\utility::flag( "found_fueling_station" ) )
        {
            _id_AF47( "cliff_pri_goback", 1 );
            continue;
        }

        if ( var_0 )
        {
            _id_AF47( "cliff_pri_necorner", 0 );
            var_0 = 0;
            continue;
        }

        _id_AF47( "cliff_pri_searchntheast", 0 );
        var_0 = 1;
    }
}

_id_C078()
{
    level endon( "player_on_backdoor_path" );
    wait 25;
    var_0 = 1;

    for (;;)
    {
        wait 40;

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        {
            common_scripts\utility::flag_waitopen( "_stealth_spotted" );
            continue;
        }

        if ( var_0 )
        {
            _id_AF47( "cliff_pri_behindhangars", 1, 2 );
            var_0 = 0;
            continue;
        }

        _id_AF47( "cliff_pri_meetme", 1, 2 );
        var_0 = 1;
    }
}

_id_AA00()
{
    self endon( "driver dead" );
    level endon( "jeep_stopped" );
    level endon( "price_moving_to_hanger" );
    level endon( "jeep_blown_up" );
    _id_AF47( "cliff_pri_truckcoming", 1, 7 );
    wait 15;

    for (;;)
    {
        maps\_utility::waittill_entity_in_range( level.player, 1200 );
        var_0 = common_scripts\utility::within_fov( self.origin, self.angles, level.player.origin, cos( 45 ) );

        if ( var_0 )
        {
            if ( common_scripts\utility::cointoss() )
                _id_AF47( "cliff_pri_truckcomingback", 1, 2 );
            else
                _id_AF47( "cliff_pri_truckiscoming", 1, 2 );

            wait 10;
            continue;
        }

        wait 1;
    }
}

_id_CFBC()
{
    common_scripts\utility::flag_wait( "stay_away_from_bmp" );

    if ( common_scripts\utility::flag( "done_with_stealth_camp" ) )
        return;

    _id_AF47( "cliff_pri_avoidarea", 1 );
}

_id_AE8B()
{
    level.player endon( "death" );
    self waittill( "bmp_aim_at_player" );
    _id_C5EC( "cliff_pri_getoutofthere", 0 );
}

_id_C966()
{
    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
        _id_AF47( "cliff_pri_holdup", 1 );

    _id_AF47( "cliff_pri_activityonrunway", 1 );
    _id_AF47( "cliff_pri_footmobiles", 1 );
    wait 5;
}

_id_BA2C()
{
    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
        wait 4;

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        _id_AF47( "cliff_pri_radiotraffic", 1 );
        wait 3;
    }

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        _id_AF47( "cliff_pri_infarhangar", 1 );
        _id_AF47( "cliff_pri_oscarmike" );
    }
    else
        _id_AF47( "cliff_pri_getthereasap", 1 );

    common_scripts\utility::flag_set( "cliffhanger_soap_told_player_to_get_to_hangar" );
}

_id_CFF5()
{
    common_scripts\utility::flag_wait( "first_two_guys_in_sight" );
    level endon( "done_with_stealth_camp" );
    level.player endon( "death" );

    for (;;)
    {
        wait 1;
        var_0 = level.player getcurrentweapon();

        if ( var_0 != level._id_B703 && var_0 != level._id_ABE5 && var_0 != level._id_C350 && var_0 != "h2_cheatpickaxe" && var_0 != "none" )
            break;
    }

    if ( isdefined( level.price.function_stack ) )
    {
        while ( level.price.function_stack.size > 0 )
            wait 0.5;
    }

    _id_AF47( "cliff_pri_attractattn", 1 );
}

_id_C435()
{
    level endon( "player_killed_someone" );
    level endon( "_stealth_spotted" );
    level endon( "someone_became_alert" );
    common_scripts\utility::flag_wait( "base_c4_planted" );
    maps\_utility::giveachievement_wrapper( "GHOST" );
    _id_AF47( "cliff_pri_prettysneaky", 1 );
}

_id_CF57()
{
    level endon( "price_moving_to_hanger" );
    common_scripts\utility::flag_wait( "jeep_blown_up" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    wait 1;

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    _id_AF47( "cliff_pri_flamingwreck" );
}

_id_C48D()
{
    level endon( "price_moving_to_hanger" );
    self waittill( "unloading" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    _id_AF47( "cliff_pri_headsup", 1 );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    var_0 = getentarray( "truck_guys", "script_noteworthy" );
    var_1 = 0;

    foreach ( var_3 in var_0 )
    {
        if ( isalive( var_3 ) )
            var_1++;
    }

    if ( var_1 == 4 )
        _id_AF47( "cliff_pri_lookingaround", 1, 5 );
}

_id_B2A9( var_0, var_1 )
{
    if ( common_scripts\utility::flag( "tarmac_escape" ) )
        return;

    return maps\_utility::radio_dialogue( var_0, var_1 );
}

_id_AF47( var_0, var_1, var_2 )
{
    if ( common_scripts\utility::flag( "tarmac_escape" ) )
        return;

    if ( isdefined( var_1 ) && var_1 == 1 )
        return maps\_utility::radio_dialogue( var_0, var_2 );
    else
        return maps\_utility::radio_dialogue_safe( var_0 );
}

_id_C5EC( var_0, var_1 )
{
    if ( common_scripts\utility::flag( "tarmac_escape" ) )
        return;

    maps\_utility::radio_dialogue_stop();
    maps\_utility::radio_dialogue( var_0 );
}

_id_C4F8()
{
    maps\_utility::radio_dialogue_clear_stack();
}

_id_CCE1()
{
    wait 0.05;
    var_0 = spawn( "trigger_radius", ( -12266.0, -31591.0, 400.0 ), 0, 410, 700 );
    thread maps\_load::trigger_slide( var_0 );
}

_id_ADD6()
{
    level endon( "start_big_explosion" );
    var_0 = level.player.origin;

    for (;;)
    {
        if ( distance( var_0, level.player.origin ) > 64 )
            break;

        wait 0.05;
    }

    level.price.ignoreme = 1;
    level.player enabledeathshield( 0 );
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
    {
        var_4 = randomfloatrange( 0.1, 0.3 );
        var_3 maps\_utility::delaythread( var_4, ::_id_D257 );
    }

    wait 2;
    level.player kill();
}

_id_D257()
{
    self.dontevershoot = undefined;
}

_id_C4AD()
{
    var_0 = level.player getweaponslistprimaries();
    var_1 = 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == level._id_ABE5 )
        {
            var_1 = 1;
            break;
        }
    }

    if ( !var_1 )
        return 1;

    if ( level.player getcurrentweapon() == level._id_ABE5 )
        return 1;

    return 0;
}

_id_D52E( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "start_dynamic_run_speed" );
    self endon( "death" );
    self endon( "stop_dynamic_run_speed" );
    self endon( "start_dynamic_run_speed" );

    if ( maps\_utility::ent_flag_exist( "_stealth_custom_anim" ) )
        maps\_utility::ent_flag_waitopen( "_stealth_custom_anim" );

    if ( !isdefined( self.ent_flag["dynamic_run_speed_stopped"] ) )
    {
        maps\_utility::ent_flag_init( "dynamic_run_speed_stopped" );
        maps\_utility::ent_flag_init( "dynamic_run_speed_stopping" );
    }
    else
    {
        maps\_utility::ent_flag_clear( "dynamic_run_speed_stopping" );
        maps\_utility::ent_flag_clear( "dynamic_run_speed_stopped" );
    }

    self.run_speed_state = "";
    thread _id_C067();
    maps\_anim::set_custom_move_start_transition( level.price, "casual_crouch_exit_clifftop" );
    self.permanentcustommovetransition = 1;
    var_5 = var_1 * var_1;

    for (;;)
    {
        wait 0.2;
        var_6 = level.players[0];

        foreach ( var_8 in level.players )
        {
            if ( distancesquared( var_6.origin, self.origin ) > distancesquared( var_8.origin, self.origin ) )
                var_6 = var_8;
        }

        var_10 = anglestoforward( self.angles );
        var_11 = vectornormalize( var_6.origin - self.origin );
        var_12 = vectordot( var_10, var_11 );
        var_13 = distancesquared( self.origin, var_6.origin );

        if ( isdefined( self.cqbwalking ) && self.cqbwalking )
            self.moveplaybackrate = 1;

        if ( var_13 > 22500 && var_12 > -0.25 )
        {
            _id_AA98( "run" );
            continue;
        }

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        {
            _id_AA98( "cqb" );
            continue;
        }

        _id_AA98( "crouch" );
    }
}

_id_C067()
{
    self endon( "start_dynamic_run_speed" );
    self endon( "death" );
    self.moveplaybackrate = 1;
    maps\_utility::clear_run_anim();
    self allowedstances( "stand", "crouch", "prone" );
    self notify( "stop_loop" );
    maps\_utility::ent_flag_clear( "dynamic_run_speed_stopping" );
    maps\_utility::ent_flag_clear( "dynamic_run_speed_stopped" );
}

_id_AA98( var_0 )
{
    if ( self.run_speed_state == var_0 )
        return;

    self.run_speed_state = var_0;

    switch ( var_0 )
    {
        case "sprint":
            if ( isdefined( self.cqbwalking ) && self.cqbwalking )
                self.moveplaybackrate = 1;
            else
                self.moveplaybackrate = 1.15;

            maps\_utility::set_generic_run_anim( "DRS_sprint" );
            self allowedstances( "stand", "crouch", "prone" );
            maps\_utility::disable_cqbwalk();
            self notify( "stop_loop" );
            maps\_utility::ent_flag_clear( "dynamic_run_speed_stopped" );
            break;
        case "run":
            self.moveplaybackrate = 1;
            maps\_utility::clear_run_anim();
            self allowedstances( "stand", "crouch", "prone" );
            maps\_utility::disable_cqbwalk();
            self notify( "stop_loop" );
            maps\_utility::ent_flag_clear( "dynamic_run_speed_stopped" );
            break;
        case "jog":
            self.moveplaybackrate = 1;
            maps\_utility::set_generic_run_anim( "DRS_combat_jog" );
            self allowedstances( "stand", "crouch", "prone" );
            maps\_utility::disable_cqbwalk();
            self notify( "stop_loop" );
            maps\_utility::ent_flag_clear( "dynamic_run_speed_stopped" );
            break;
        case "crouch":
            self.moveplaybackrate = 1;
            maps\_utility::clear_run_anim();
            self allowedstances( "crouch" );
            maps\_utility::disable_cqbwalk();
            self notify( "stop_loop" );
            maps\_utility::ent_flag_clear( "dynamic_run_speed_stopped" );
            break;
        case "cqb":
            self.moveplaybackrate = 1;
            maps\_utility::enable_cqbwalk();
            self allowedstances( "stand", "crouch", "prone" );
            self notify( "stop_loop" );
            maps\_utility::ent_flag_clear( "dynamic_run_speed_stopped" );
            break;
    }
}

_id_B390()
{
    common_scripts\utility::flag_wait( "player_climbs_past_safe_point" );
    common_scripts\_exploder::exploder( 1 );
}

_id_BA7B()
{
    var_0 = getentarray( "extra_tarmac_migs", "script_noteworthy" );
    var_1 = getentarray( "extra_tarmac_mig_delayed", "script_noteworthy" );
    var_2 = var_0;
    var_2 = common_scripts\utility::array_combine( var_2, var_1 );
    wait 1;

    foreach ( var_4 in var_2 )
    {
        var_4.origin += ( 0.0, 0.0, -5000.0 );
        var_4 hide();
    }

    common_scripts\utility::flag_wait( "player_in_hanger" );

    foreach ( var_4 in var_2 )
    {
        var_4.origin += ( 0.0, 0.0, 5000.0 );
        var_4 show();
    }

    common_scripts\utility::flag_wait( "start_big_explosion" );

    foreach ( var_4 in var_0 )
    {
        if ( var_4.code_classname == "script_model" )
            var_4 thread maps\_utility::destructible_force_explosion();
    }

    common_scripts\utility::flag_wait( "jet_defenders_die" );

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( var_4.code_classname == "script_model" )
            var_4 thread maps\_utility::destructible_force_explosion();
    }

    _id_B2F6( "destructible_oilrig_1" );
    maps\_utility::pauseexploder( 56 );
    common_scripts\_exploder::exploder( 55 );
}

_id_B2F6( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3.code_classname != "script_model" )
            continue;

        var_3 maps\_utility::destructible_force_explosion();
        soundscripts\_snd::snd_message( "aud_handle_explosion", var_0, var_3 );
        wait(randomfloatrange( 0.15, 0.25 ));
    }
}

_id_CA0A()
{
    wait 3;
    var_0 = getentarray( "hanger_late_spawner", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_B015()
{
    self.threatbias = 1000;
}

_id_AD61()
{
    self waittill( "spawned", var_0 );
    var_0 _meth_85A2( 0 );
    var_0 thread maps\_vehicle_code::vehicle_becomes_crashable();
    var_0 vehphys_disablecrashing();
    common_scripts\utility::flag_set( "tarmac_snowmobiles_spawned" );
    var_0 thread _id_BDBD();
    var_0 waittill( "unloading" );
    level notify( "tarmac_snowmobile_unload" );
}

_id_BDBD()
{
    self endon( "death" );
    self endon( "unloading" );
    level waittill( "tarmac_snowmobile_unload" );
    self vehicle_setspeed( 0, 45 );
    wait 1.75;
    thread maps\_vehicle::vehicle_unload();
}

_id_CFFB( var_0, var_1 )
{
    level.player playerlinktodelta( var_0, var_1, 0.0, 90, 90, 90, 30 );
}

_id_CCB2()
{
    self endon( "death" );
    common_scripts\utility::waittill_either( "veh_collision", "driver_died" );
    var_0 = getent( "avalanche_progress_org", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = vectornormalize( var_1.origin - var_0.origin );
    maps\_utility::delaythread( 13, maps\_utility::self_delete );

    for (;;)
    {
        self waittill( "driver_died", var_3 );
        var_4 = level._id_C89B vehicle_getspeed();
        var_5 = var_2 * var_4;
        var_5 = ( var_5[0], var_5[1], 10.0 );
        self vehphys_launch( var_5, randomfloatrange( 0.4, 0.8 ) );
        wait(randomfloatrange( 0.05, 0.15 ));
    }
}

_id_B119()
{
    _id_BB6C::_id_B27B( level.price );
    var_0 = level._id_B8ED;
    var_0.count = 1;
    var_1 = var_0 stalingradspawn();
    level.price = var_1;
    maps\_utility::spawn_failed( var_1 );
    var_1.animname = "price";
    var_1 thread maps\_utility::magic_bullet_shield();
    var_1 maps\_utility::add_damage_function( ::_id_C517 );
    return var_1;
}

_id_C517( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_1 ) )
        return;

    var_7 = var_1.classname;

    if ( !isdefined( var_7 ) )
        return;

    if ( var_7 != "script_vehicle_snowmobile" )
        return;

    foreach ( var_9 in var_1.riders )
    {
        if ( !isalive( var_9 ) )
            continue;

        var_9 dodamage( 1000, self.origin, self );
    }
}

_id_BD75()
{
    var_0 = "flag_square";

    if ( isdefined( self.script_noteworthy ) )
        var_0 = self.script_noteworthy;

    var_1 = maps\_utility::spawn_anim_model( var_0 );
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    self delete();
    var_2 = vectortoangles( var_1.angles );
    var_3 = anglestoforward( var_2 );
    var_1 thread _id_ADC1();
}

_id_ADC1()
{
    level endon( "player_in_hanger" );
    childthread _id_B496();
    waittillframeend;
    self._id_BFF8 = self._id_C979;
    var_0 = 1;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        if ( self._id_C979 == "fast" )
            var_1 = randomfloatrange( 1.0, 1.4 );
        else
            var_1 = randomfloatrange( 0.5, 0.8 );

        var_2 = "wind_animation_" + self._id_BFF8 + "_to_" + self._id_C979;
        var_3 = "wind_animation_" + self._id_C979 + "_looped";

        if ( self._id_C979 != self._id_BFF8 )
        {
            var_4 = level.scr_anim[self.animname][var_2];
            self setanim( var_4, 1, 0, var_0 );
            wait(getanimlength( var_4 ) * var_0);
            self._id_BFF8 = self._id_C979;
        }

        var_5 = randomint( level.scr_anim[self.animname][var_3].size );
        var_6 = level.scr_anim[self.animname][var_3][var_5];
        var_7 = 0.1;
        self setanim( var_6, 1, var_7, var_0 );
        var_8 = var_1 - var_0;
        var_9 = var_8 * var_7;

        while ( self._id_C979 == self._id_BFF8 )
        {
            wait(var_7);

            if ( var_0 != var_1 )
            {
                var_0 += var_9;
                var_10 = self getanimtime( var_6 );
                self setanim( var_6, 1, var_7, var_0 );
                self setanimtime( var_6, var_10 );
            }
        }

        self clearanim( var_6, 0.1 );
    }
}

_id_B496()
{
    for (;;)
    {
        if ( isdefined( level._id_B553 ) && ( level._id_B553 == "hard" || level._id_B553 == "extreme" ) )
            self._id_C979 = "fast";
        else
            self._id_C979 = "slow";

        level waittill( "blizzard_level_change" );
        self._id_BFF8 = self._id_C979;
    }
}

_id_C253()
{
    common_scripts\utility::flag_wait( "player_slides_down_hill" );

    for ( var_0 = 0; var_0 < level.createfxent.size; var_0++ )
    {
        var_1 = level.createfxent[var_0];

        if ( isdefined( var_1.v["soundalias"] ) )
        {
            if ( var_1.v["soundalias"] == "velocity_whitenoise_loop" )
                continue;
        }

        if ( isdefined( var_1.looper ) )
            var_1.looper delete();
    }

    var_2 = getentarray( "script_model", "code_classname" );

    foreach ( var_4 in var_2 )
        var_4 delete();

    foreach ( var_7 in level._id_CF2A )
    {
        var_4 = spawn( "script_model", var_7["origin"] );
        var_4.angles = var_7["angles"];
        var_4 setmodel( var_7["model"] );
        var_7["owner"]._id_AF60 = var_4;
    }
}

_id_C419()
{
    var_0 = undefined;
    var_1 = getentarray( self.target, "targetname" );
    var_2 = undefined;

    foreach ( var_4 in var_1 )
    {
        if ( var_4.code_classname == "script_brushmodel" )
        {
            var_0 = var_4;
            continue;
        }

        var_2 = var_4;
    }

    var_1 = undefined;
    self waittill( "damage" );
    var_0 delete();

    if ( isdefined( self._id_AF60 ) )
    {
        var_6 = common_scripts\utility::randomvector( 100 );
        var_6 = maps\_utility::set_z( var_6, abs( var_6[2] ) );
        var_2 physicslaunchclient( var_2.origin, var_6 + ( 0.0, 0.0, 50.0 ) );
    }

    self delete();
}

_id_CF26()
{
    common_scripts\utility::flag_waitopen( "keyboard_used" );
    level endon( "keyboard_used" );
    level waittill( "price_enter" );

    for (;;)
    {
        wait(randomfloatrange( 2, 8 ));
        var_0 = getent( "locker_brawl", "targetname" );
        var_0 notify( "stop_satellite_idle" );
        level.price waittillmatch( "looping anim", "end" );
        var_0 maps\_anim::anim_single_solo( level.price, "satellite_idle_breaker" );
        var_0 thread maps\_anim::anim_loop_solo( level.price, "satellite_idle", "stop_satellite_idle" );
    }
}

_id_BA65()
{
    var_0 = getentarray( "slope_tree", "targetname" );
    var_1 = common_scripts\utility::getstruct( "top_of_hill", "targetname" );
    var_0 = common_scripts\utility::get_array_of_closest( var_1.origin, var_0 );

    if ( level.gameskill == 0 )
        var_0 = maps\_utility::array_delete_evenly( var_0, 2, 3 );
    else if ( level.gameskill == 1 )
        var_0 = maps\_utility::array_delete_evenly( var_0, 1, 2 );

    var_2 = getentarray( "slope_tree_clip", "targetname" );

    foreach ( var_5, var_4 in var_0 )
    {
        var_4.clip = var_2[var_5];
        var_2[var_5] = undefined;
    }

    foreach ( var_7 in var_2 )
        var_7 delete();

    common_scripts\utility::array_thread( var_0, maps\cliffhanger_snowmobile_code::_id_D59A );
}

_id_CB5D()
{
    self endon( "death" );
    var_0 = getent( "h2_hanger_enemies_enter", "targetname" );
    childthread _id_BB5E( var_0 );
    thread _id_BCD2();

    if ( self.script_noteworthy == "hanger_capture_petrov" )
        thread _id_B7FF();

    level waittill( "kill_price" );
    wait(randomfloatrange( 0.3, 0.5 ));
    self setgoalpos( self.origin );
    self.goalradius = 20;
    self stopanimscripted();
    self setlookatentity( level.price );
    self.ignoreall = 0;

    for (;;)
    {
        self shoot();
        wait(randomfloatrange( 0.1, 0.2 ));
    }
}

_id_BB5E( var_0 )
{
    level.player endon( "player_shot" );
    var_0 maps\_anim::anim_single_solo( self, "runin_in" );

    if ( getdvar( "player_has_witnessed_capture" ) == "1" )
    {
        common_scripts\utility::flag_set( "player_can_see_capture" );
        waittillframeend;
    }

    _id_B6CE( var_0 );

    if ( common_scripts\utility::flag( "player_can_see_capture" ) )
        var_0 maps\_anim::anim_single_solo( self, "runin_comply" );

    if ( self.animname == "petrov" )
        thread _id_B7A2();

    if ( common_scripts\utility::flag( "player_can_see_capture" ) )
        var_0 maps\_anim::anim_single_solo( self, "runin_comply_wait" );

    var_0 maps\_anim::anim_single_solo( self, "runin_out" );
}

_id_B6CE( var_0 )
{
    if ( common_scripts\utility::flag( "player_can_see_capture" ) )
        return;

    var_0 thread maps\_anim::anim_single_solo( self, "runin_optional" );

    if ( self.animname == "petrov" )
    {
        var_1 = [];
        var_1[var_1.size] = "cliff_pet_capturedcomrade";
        var_1[var_1.size] = "cliff_pet_surrender";
        var_1[var_1.size] = "cliff_pet_willdie";
        var_1[var_1.size] = "cliff_pet_handsup";
        var_1[var_1.size] = "cliff_pet_verywell";

        foreach ( var_3 in var_1 )
        {
            if ( common_scripts\utility::flag( "player_can_see_capture" ) )
            {
                level notify( "petrov_optional_encouragement_lines" );
                return;
            }

            maps\_utility::dialogue_queue( var_3 );
        }
    }
    else
    {
        level endon( "petrov_optional_encouragement_lines" );
        var_0 waittill( "runin_optional" );
    }
}

_id_BCD2()
{
    self endon( "death" );
    self setnormalhealth( 3 );
    self waittill( "damage" );
    common_scripts\utility::flag_set( "drop_megaphone" );
    level notify( "kill_price" );
    self stopanimscripted();
}

_id_B7FF()
{
    while ( !common_scripts\utility::flag( "drop_megaphone" ) )
        waitframe();

    common_scripts\utility::flag_clear( "drop_megaphone" );
    self detach( "h2_ch_megaphone_rig", "TAG_INHAND" );
    var_0 = spawn( "script_model", self gettagorigin( "TAG_INHAND" ) );
    var_0.angles = self gettagangles( "TAG_INHAND" );
    var_0 setmodel( "h2_ch_megaphone_rig" );
    var_0 physicslaunchclient();
    self waittill( "delete" );
    var_0 delete();
}

_id_BC37( var_0 )
{
    var_1 = [];
    var_1[var_1.size] = "cliff_ru1_gogogo";
    var_1[var_1.size] = "cliff_ru1_freezedropit";
    var_1[var_1.size] = "cliff_ru1_handsup";
    var_1[var_1.size] = "cliff_ru2_movemove";
    var_1[var_1.size] = "cliff_ru2_doitnow";
    var_1[var_1.size] = "cliff_ru2_handsintheair";
    var_1[var_1.size] = "cliff_ru3_letsgoletsgo";
    var_1[var_1.size] = "cliff_ru3_dropitdropit";
    var_1[var_1.size] = "cliff_ru3_stopdontmove";
    var_1[var_1.size] = "cliff_ru4_dropitmfer";
    var_1[var_1.size] = "cliff_ru4_dropyourweapon";
    var_1[var_1.size] = "cliff_ru4_dropitnow";
    var_1[var_1.size] = "cliff_ru4_shutupdropit";
    var_1[var_1.size] = "cliff_ru4_shutmouth";
    var_1 = common_scripts\utility::array_randomize( var_1 );
    var_2 = 0;
    var_3 = gettime();
    var_4 = var_3 + 4000;
    var_5 = var_3 + 8000;

    while ( !common_scripts\utility::flag( "start_big_explosion" ) )
    {
        var_6 = gettime();
        var_7 = 1;

        if ( var_6 > var_4 )
            var_7 = 0.5;

        if ( var_6 > var_5 )
            var_7 = 0;

        wait(randomfloatrange( 1, 3 ));
        wait(var_7);
        var_8 = var_0[randomint( var_0.size )];

        if ( isalive( var_8 ) )
        {
            var_9 = var_1[var_2];
            var_8 maps\_anim::anim_generic( var_8, var_9 );
        }
        else
            wait 0.5;

        var_2++;

        if ( var_2 >= var_1.size )
            var_2 = 0;
    }
}

_id_CC9D()
{
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

_id_C58F( var_0, var_1 )
{
    level endon( "locker_brawl_becomes_uninteruptable" );
    var_1 waittill( "death" );
    var_0 notify( "single anim", "end" );
    var_0 stopanimscripted();
    var_0 _meth_85B4( 0, 0.5 );
    var_0._id_B287 = 1;
    var_2 = getent( "locker_brawl", "targetname" );

    foreach ( var_4 in level._id_C932 )
    {
        var_4 notify( "single anim", "end" );
        var_2 maps\_anim::anim_first_frame( level._id_C932, "locker_brawl" );
    }
}

_id_B8C9()
{
    _id_CC9D();

    if ( isdefined( level._id_BCD4 ) )
    {
        level._id_BCD4 maps\cliffhanger_stealth::_id_B676();
        level._id_BCD4 delete();
    }

    var_0 = getent( "locker_brawl_spawner", "targetname" );
    var_1 = getent( "locker_brawl", "targetname" );
    var_1 maps\_anim::anim_reach_solo( level.price, "locker_brawl" );
    level.price._id_B287 = 1;
    var_2 = var_0 maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_2 ) )
        return;

    var_2 maps\_utility::set_battlechatter( 0 );
    level.price._id_B287 = undefined;
    var_2.grenadeawareness = 0;
    var_2.animname = "defender";
    var_2.allowdeath = 1;
    var_2.health = 1;
    var_2 maps\_utility::gun_remove();
    var_2.nodrop = 1;
    thread _id_C58F( level.price, var_2 );
    var_3 = [];
    var_3[0] = var_2;
    var_3[1] = level.price;
    var_3 = common_scripts\utility::array_combine( var_3, level._id_C932 );
    var_4 = getent( "price_locker_brawl_end_dest", "targetname" );
    level.price setgoalpos( var_4.origin );
    var_1 thread maps\_anim::anim_single( var_3, "locker_brawl" );
    level.price waittillmatch( "single anim", "end" );
    level.price detach( "weapon_parabolic_knife", "TAG_INHAND", 0 );
}

_id_C769( var_0 )
{
    var_1 = getent( "locker_brawl", "targetname" );
    thread _id_B38B( var_0 );
    common_scripts\utility::flag_wait( "keyboard_used" );
    var_1 notify( "stop_satellite_idle" );
    _id_A835();
}

_id_A835()
{
    level.price endon( "death" );
    var_0 = getent( "h2_hanger_enemies_enter", "targetname" );
    level.price maps\_utility::set_deathanim( "capture_death" );
    var_0 maps\_anim::anim_single_solo( level.price, "capture_intro" );
    var_0 thread maps\_anim::anim_loop_solo( level.price, "capture_idle", "stop_capture_idle" );
    common_scripts\utility::flag_wait( "start_big_explosion" );
    var_0 notify( "stop_capture_idle" );
    level.price animscripts\shared::placeweaponon( level.price.weapon, "chest" );
    var_0 maps\_anim::anim_single_solo( level.price, "capture_pullout" );
    level.price.forcesidearm = 1;
    level.price.fixednode = 1;
    level.price.goalradius = 2000;
    common_scripts\utility::flag_wait( "capture_enemies_dead" );
    level.price.forcesidearm = undefined;
    level.price maps\_utility::disable_cqbwalk();
}

_id_B38B( var_0 )
{
    if ( common_scripts\utility::flag( "keyboard_used" ) )
        return;

    level endon( "keyboard_used" );
    var_1 = getent( "locker_brawl", "targetname" );

    if ( isdefined( level.price._id_B287 ) )
        var_1 maps\_anim::anim_reach_solo( level.price, "enter" );

    var_2["price"] = level.price;
    var_1 notify( "satellite_stop" );
    var_1 thread maps\_anim::anim_single_solo( var_0, "price_enter" );
    level.price _id_B3AB::_id_BEBA( "head", level.player, 200, 45, 20, 30, 45, 1, 1 );
    var_1 maps\_anim::anim_single( var_2, "enter" );
    var_1 thread maps\_anim::anim_loop_solo( var_0, "satellite_loop" );
    var_1 thread maps\_anim::anim_loop_solo( level.price, "satellite_idle", "stop_satellite_idle" );
    level notify( "price_enter" );
}

_id_BAFA( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    self.stealth_first_alert_new_patrol_path = var_1;
}

_id_C680()
{
    maps\_vehicle::vehicle_lights_on( "running" );
    maps\_vehicle::vehicle_lights_on( "landing" );
}

_id_A920()
{
    common_scripts\utility::flag_wait( "price_starts_moving" );
    level.price.moveplaybackrate = 1;

    if ( isdefined( level.price.node ) && abs( level.price.node.angles[1] - level.price.angles[1] ) < 5 )
    {
        level.price orientmode( "face current" );
        maps\_anim::set_custom_move_start_transition( level.price, "casual_crouch_exit" );
    }

    getent( "price_starts_moving", "targetname" ) notify( "trigger" );
    level.price.fixednode = 0;
    level.price.customidleanimset = undefined;
    level.price _id_B3AB::_id_B0AC();
    level.price maps\_utility::disable_cqbwalk();
    level.price allowedstances( "crouch" );
    maps\_utility::player_speed_percent( 90, 2 );
    common_scripts\utility::flag_wait( "first_two_guys_in_sight" );
    level.price thread _id_D52E( undefined, 300 );
}

_id_C89F()
{
    level endon( "first_two_guys_in_sight" );
    common_scripts\utility::flag_wait( "soap_cliff_climb_finished" );

    if ( !common_scripts\utility::flag( "price_starts_moving" ) )
        level.price _id_B3AB::_id_BEBA( ::_id_B430, level.player, 400, 70, 55, 30, 45, 1, 0, 22.5 );
}

_id_B430()
{
    return level.scr_anim["price"]["soap_cliff_crouch_idle_look_add"];
}

_id_B17C()
{
    level endon( "first_two_guys_in_sight" );
    common_scripts\utility::flag_wait( "check_heart_beat_sensor" );
    maps\_utility::_id_B630();
    thread _id_C89F();
    level.price _id_AD56( "cliff_pri_checksensor", 1, 1 );
    level.player thread maps\_utility::display_hint_timeout( "hint_heartbeat_sensor", 30 );

    while ( level.player getcurrentweapon() != level._id_ABE5 )
        wait 0.5;

    level.price _id_AD56( "cliff_pri_seeme", 1, 1 );
    level.price _id_AD56( "cliff_pri_bluedot", 1, 1 );
    wait 0.1;
    level.price _id_AD56( "cliff_pri_whitedots", 1, 1 );
    common_scripts\utility::flag_set( "price_starts_moving" );
    maps\_utility::_id_C402();
}

_id_C367()
{
    setsaveddvar( "cg_drawcrosshair", "0" );
    level.iconelem = maps\_hud_util::createicon( "hud_dpad", 32, 32 );
    level.iconelem.hidewheninmenu = 1;
    level.iconelem maps\_hud_util::setpoint( "TOP", undefined, 0, 175 );
    level.iconelem2 = maps\_hud_util::createicon( "hud_icon_heartbeat", 32, 32 );
    level.iconelem2.hidewheninmenu = 1;
    level.iconelem2 maps\_hud_util::setpoint( "TOP", undefined, -32, 175 );
    level.iconelem3 = maps\_hud_util::createicon( "hud_arrow_left", 24, 24 );
    level.iconelem3.hidewheninmenu = 1;
    level.iconelem3 maps\_hud_util::setpoint( "TOP", undefined, 0, 179 );
    level.iconelem3.sort = 1;
    level.iconelem3.color = ( 1.0, 1.0, 0.0 );
    level.iconelem3.alpha = 0.7;

    while ( !level.player _id_C4AD() )
        wait 0.5;

    level.iconelem maps\_hud_util::setpoint( "CENTER", "BOTTOM", 320, -20, 2 );
    level.iconelem2 maps\_hud_util::setpoint( "CENTER", "BOTTOM", 288, -20, 2 );
    level.iconelem3 maps\_hud_util::setpoint( "CENTER", "BOTTOM", 320, -20, 2 );
    level.iconelem scaleovertime( 2, 20, 20 );
    level.iconelem2 scaleovertime( 2, 20, 20 );
    level.iconelem3 scaleovertime( 2, 15, 15 );
    wait 1.7;
    level.iconelem fadeovertime( 0.3 );
    level.iconelem.alpha = 0;
    level.iconelem2 fadeovertime( 0.3 );
    level.iconelem2.alpha = 0;
    level.iconelem3 fadeovertime( 0.3 );
    level.iconelem3.alpha = 0;
    level.iconelem destroy();
    level.iconelem2 destroy();
    level.iconelem3 destroy();
    setsaveddvar( "cg_drawcrosshair", "1" );
}

_id_D5B0( var_0 )
{
    var_1 = spawnstruct();
    var_1.origin = var_0[0].origin;
    var_1.angles = var_0[0].angles;
    var_2 = undefined;

    foreach ( var_4 in var_0[0].anim_props )
    {
        if ( var_4.animname == "chair" )
        {
            var_2 = var_4;
            break;
        }
    }

    var_0[0].anim_props_animated = 1;
    var_1 maps\_anim::anim_first_frame_solo( var_2, "throatstab" );
    var_1 maps\_utility::delaythread( 0.25, maps\_anim::anim_single_solo, var_2, "throatstab" );
    return var_1;
}

_id_BDD3( var_0 )
{
    var_1 = spawnstruct();
    var_1.angles = var_0[1].angles;
    var_2 = level.scr_anim["generic"]["patrol_cold_crossed"][0];
    var_3 = getangledelta( var_2, 0, 1 );
    var_4 = getanimlength( var_2 );
    var_5 = var_3 / var_4 * 0.3;
    var_6 = anglestoforward( var_1.angles );
    var_1.origin = var_0[1].origin + var_6 * length( var_5 );
    return var_1;
}

_id_D55D()
{
    level endon( "clifftop_patrol1_dead" );
    level.player waittill( "stealth_takedown_started" );
    level.price setgoalpos( level.price.origin );
    soundscripts\_snd::snd_message( "aud_mix_stealth_takedown" );

    if ( !common_scripts\utility::flag( "mig_landing" ) )
        common_scripts\utility::flag_set( "mig_landing" );
}

_id_AC7F( var_0, var_1, var_2 )
{
    level.player._id_C309 waittillmatch( "single anim", "right_soldier_start" );
    thread maps\_anim::anim_single_solo( var_1, var_0 );
    wait 0.05;
    var_1 setanimtime( var_1 maps\_utility::getanim( var_0 ), level.player._id_C309 getanimtime( level.player._id_C309 maps\_utility::getanim( var_0 ) ) );
}

_id_AC5C()
{
    level.player endon( "stealth_takedown_started" );
    level endon( "clifftop_patrol1_dead" );
    level endon( "clifftop_patrol_alerted" );
    common_scripts\utility::flag_wait( "first_two_guys_in_sight" );
    level.price._id_C1C6 = 1;
    var_0 = maps\_utility::get_living_ai( "patrollers_1_rightguy", "script_noteworthy" );
    var_1 = maps\_utility::get_living_ai( "patrollers_1_leftguy", "script_noteworthy" );
    var_0 _id_A927();
    var_1 _id_A927();
    var_0.animname = "rightguy";
    var_1.animname = "leftguy";
    thread double_takedown_cinematic( var_0, var_1 );
    level.player thread maps\_utility::_id_C92C( [ var_0, var_1 ], "double_takedown", 145, 45, 60, 0, 0.25, ::_id_BDD3, "viewmodel_ice_picker_03", "viewmodel_ice_picker", undefined, [ ::_id_AC7F ], undefined, 0.5, 1 );
    level.price thread _id_D55D();
    childthread _id_C63A( [ var_0, var_1 ] );
    common_scripts\utility::flag_wait( "price_two_guys_in_sight" );
    level endon( "interupt_first_encounter" );
    thread _id_CCDA();
    thread _id_D21E();
    level.player maps\_utility::waittill_entity_in_range( level.price, 300 );
    common_scripts\utility::flag_set( "first_encounter_dialog_starting" );
    level.price _id_AD56( "cliff_pri_noidea", 0, 1 );
    common_scripts\utility::flag_set( "mig_landing" );
    level.price _id_AD56( "cliff_pri_youtakeleft", 0, 1 );
    thread _id_A85C();
    level.price playsound( "Cliff_pri_onthree" );
    wait 1;
    level.price playsound( "Cliff_pri_one" );
    wait 1;
    level.price playsound( "Cliff_pri_two" );
    wait 1;
    level.price playsound( "Cliff_pri_three" );
    wait 0.2;
    common_scripts\utility::flag_set( "first_encounter_dialog_finished" );

    if ( isalive( var_0 ) && maps\_utility::_id_B0A0( 1 ) )
        var_0 thread maps\cliffhanger_stealth::_id_B20F( var_1 );
    else if ( isalive( var_1 ) && maps\_utility::_id_B0A0( 1 ) )
        var_1 thread maps\cliffhanger_stealth::_id_B20F( var_0 );
    else
        thread _id_AFAE();
}

double_takedown_cinematic( var_0, var_1 )
{
    level endon( "clifftop_patrol1_dead" );
    level.player waittill( "stealth_takedown_started" );
    var_2 = _id_D397::_id_A97A( "double_takedown" );
    var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 3.5, -1, 16, 16 ) _id_D397::_id_CCA7( var_1, "tag_eye" ) _id_D397::_id_AF9C();
    var_2 _id_D397::_id_BEA0( 2.8 ) _id_D397::_id_C491( 3.5, -1, 16, 16 ) _id_D397::_id_CCA7( var_0, "tag_eye" ) _id_D397::_id_AE01( 1 );
    var_2 _id_D397::_id_BEA0( 4.8 ) _id_D397::_id_C491( 3.5, -1, 16, 16 ) _id_D397::_id_CCA7( var_0, "tag_eye" ) _id_D397::_id_ADE6( 1 ) _id_D397::_id_AE01( 1 );
    var_2 _id_D397::_id_BEA0( 6.5 ) _id_D397::_id_BF3F();
    var_2 _id_D397::_id_BEA0( 2.4 ) _id_D397::_id_B85E( 0.12, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.2 );
    var_2 _id_D397::_id_BEA0( 3.35 ) _id_D397::_id_B85E( 0.1, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_2 _id_D397::_id_BEA0( 4.25 ) _id_D397::_id_B85E( 0.12, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.3 );
    var_2 _id_D397::_id_BC26();
}

_id_C63A( var_0 )
{
    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            if ( var_2.alertlevel == "alert" || var_2.alertlevel == "combat" )
            {
                level notify( "clifftop_patrol_alerted" );
                return;
            }
        }

        waitframe();
    }
}

_id_AE06()
{
    common_scripts\utility::flag_wait( "price_go_to_climb_ridge" );
    var_0 = getent( "price_ledgeclimb", "targetname" );
    var_1 = 250000;
    var_2 = distance2dsquared( var_0.origin, level.price.origin );

    if ( common_scripts\utility::flag( "price_at_climbing_spot" ) || var_2 < var_1 )
    {
        var_0 maps\_anim::anim_reach_solo( level.price, "soap_separation" );
        var_0 maps\_anim::anim_single_solo( level.price, "soap_separation" );
    }
    else
    {
        var_0 maps\_anim::anim_reach_solo( level.price, "soap_separation_run" );
        var_0 maps\_anim::anim_single_solo( level.price, "soap_separation_run" );
    }

    var_0 maps\_anim::anim_single_solo( level.price, "ledge_climb" );
    level.price.custommovetransition = undefined;
    level.price.startmovetransitionanim = undefined;
    level.price.permanentcustommovetransition = undefined;
    level.price.dontchangepushplayer = undefined;
    level.price pushplayer( 0 );
    level.price maps\_utility::enable_ai_color();
    getent( "price_position_on_ridge", "targetname" ) notify( "trigger" );
}

_id_AFAE()
{
    wait 2;
    level.price.fixednode = 1;
    level.price maps\_utility::enable_ai_color();
}

_id_A85C()
{
    level.price.fixednode = 0;
    level.price maps\_utility::disable_ai_color();
    var_0 = anglestoforward( level.price.angles );
    level.price setgoalpos( level.price.origin + 24 * var_0 );
    level.price.goalradius = 64;
}

_id_D21E()
{
    level endon( "first_encounter_dialog_starting" );
    level endon( "second_encounter_dialog_starting" );
    level endon( "interupt_first_encounter" );
    level endon( "interupt_second_encounter" );
    wait 3;
    level.price maps\_utility::dialogue_queue( "cliff_pri_getoverhere" );
}

_id_CCDA()
{
    level endon( "first_encounter_dialog_finished" );
    maps\cliffhanger_stealth::_id_AFCF( "airfield_in_sight", "clifftop_patrol1_dead" );
    wait 0.5;

    if ( !common_scripts\utility::flag( "first_encounter_dialog_finished" ) )
        level.price playrumbleonentity();

    common_scripts\utility::flag_set( "interupt_first_encounter" );
    common_scripts\utility::flag_set( "mig_landing" );
    var_0 = maps\_utility::get_living_ai( "patrollers_1_rightguy", "script_noteworthy" );
    var_1 = maps\_utility::get_living_ai( "patrollers_1_leftguy", "script_noteworthy" );

    if ( isalive( var_0 ) )
        var_0.dontattackme = undefined;

    if ( isalive( var_1 ) )
        var_1.dontattackme = undefined;

    level.price maps\_utility::disable_ai_color();
    level.price.fixednode = 0;
    level.price setgoalpos( level.price.origin );
    common_scripts\utility::flag_wait( "clifftop_patrol1_dead" );
    level.price.fixednode = 0;
    level.price maps\_utility::enable_ai_color();
}

_id_D01C()
{
    self.animname = "generic";
    setheadmodel( "head_opforce_arctic_b" );
    thread stealth_takedown_cinematic();
    level.player thread maps\cliffhanger_aud::aud_setup_sitter_takedown();
    level.player thread maps\_utility::_id_C92C( [ self ], "throatstab", 130, 45, 60, 0, 0.25, ::_id_D5B0, undefined, "weapon_parabolic_knife", undefined, undefined, undefined, 0.5, 2 );
    self waittill( "stealth_takedown_started" );
    self notify( "pain_death" );
}

stealth_takedown_cinematic()
{
    self waittill( "stealth_takedown_started" );
    var_0 = _id_D397::_id_A97A( "stealth_takedown" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 5.6, -1, 16, 16 ) _id_D397::_id_CCA7( self, "tag_eye" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 5.8 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.85 ) _id_D397::_id_B85E( 0.12, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 1.75 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 2.25 ) _id_D397::_id_B85E( 0.12, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BEA0( 3.3 ) _id_D397::_id_B85E( 0.12, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 3.75 ) _id_D397::_id_B85E( 0.08, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.3 );
    var_0 _id_D397::_id_BEA0( 4.8 ) _id_D397::_id_B85E( 0.06, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BC26();
}

_id_B0F6()
{
    level endon( "interupt_first_encounter" );
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "first_encounter_dialog_finished" );
    common_scripts\utility::flag_wait( "clifftop_patrol1_dead" );
    level.price._id_C1C6 = undefined;
    wait 0.5;

    if ( !common_scripts\utility::flag( "player_killed_one_first_two_encounters" ) )
    {
        level.price maps\_utility::dialogue_queue( "cliff_pri_doeverything" );
        level._id_D146 = 1;
    }
    else
    {
        level.price maps\_utility::dialogue_queue( "cliff_pri_nicelydone" );
        common_scripts\utility::flag_set( "said_nicely_done" );
    }
}

_id_D236()
{
    var_0 = 0;
    common_scripts\utility::flag_wait( "clifftop_patrol1_dead" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        var_0 = 1;

    level.price._id_C1C6 = undefined;
    wait 0.5;

    if ( var_0 )
    {
        level.price maps\_utility::dialogue_queue( "cliff_pri_dontalertthem" );
        common_scripts\utility::flag_set( "said_dont_alert_them" );
    }
}

_id_B924()
{
    level endon( "_stealth_spotted" );
    level endon( "clifftop_patrol2_dead" );
    common_scripts\utility::flag_wait( "second_two_guys_in_sight" );
    level endon( "interupt_second_encounter" );
    thread _id_B86B();
    thread _id_D21E();
    level.player maps\_utility::waittill_entity_in_range( level.price, 300 );
    common_scripts\utility::flag_clear( "player_killed_one_first_two_encounters" );
    common_scripts\utility::flag_set( "second_encounter_dialog_starting" );

    if ( common_scripts\utility::flag( "said_nicely_done" ) )
        level.price maps\_utility::dialogue_queue( "cliff_pri_sameplan" );
    else
        level.price maps\_utility::dialogue_queue( "cliff_pri_youtakeleft" );

    level.price playsound( "Cliff_pri_onthree" );
    wait 1;
    level.price playsound( "Cliff_pri_one" );
    wait 1;
    level.price playsound( "Cliff_pri_two" );
    wait 1;
    level.price playsound( "Cliff_pri_three" );
    wait 0.2;
    common_scripts\utility::flag_set( "second_encounter_dialog_finished" );
    var_0 = maps\_utility::get_living_ai( "patrollers_2_rightguy", "script_noteworthy" );
    var_1 = maps\_utility::get_living_ai( "patrollers_2_leftguy", "script_noteworthy" );

    if ( isalive( var_0 ) )
        var_0 thread maps\cliffhanger_stealth::_id_B20F( var_1 );
}

_id_B86B()
{
    level endon( "second_encounter_dialog_finished" );
    maps\cliffhanger_stealth::_id_AFCF( "player_passing_second_encounter" );
    wait 0.5;

    if ( !common_scripts\utility::flag( "second_encounter_dialog_finished" ) )
        level.price playrumbleonentity();

    common_scripts\utility::flag_set( "interupt_second_encounter" );
    var_0 = maps\_utility::get_living_ai( "patrollers_2_rightguy", "script_noteworthy" );
    var_1 = maps\_utility::get_living_ai( "patrollers_2_leftguy", "script_noteworthy" );

    if ( isalive( var_0 ) )
        var_0.dontattackme = undefined;

    if ( isalive( var_1 ) )
        var_1.dontattackme = undefined;

    level.price maps\_utility::disable_ai_color();
    level.price.fixednode = 0;
    level.price setgoalpos( level.price.origin );
    common_scripts\utility::flag_wait( "clifftop_patrol2_dead" );
    level.price.fixednode = 0;
    level.price maps\_utility::enable_ai_color();
}

_id_C7AF()
{
    level endon( "interupt_second_encounter" );
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "second_encounter_dialog_finished" );
    common_scripts\utility::flag_wait( "clifftop_patrol2_dead" );
    wait 0.5;

    if ( !common_scripts\utility::flag( "player_killed_one_first_two_encounters" ) )
    {
        if ( isdefined( level._id_D146 ) )
            level.price maps\_utility::dialogue_queue( "cliff_pri_somework" );
        else
            level.price maps\_utility::dialogue_queue( "cliff_pri_doeverything" );

        return;
    }

    if ( common_scripts\utility::flag( "said_nicely_done" ) )
        level.price maps\_utility::dialogue_queue( "cliff_pri_nicework" );
    else
        level.price maps\_utility::dialogue_queue( "cliff_pri_nicelydone" );

    common_scripts\utility::flag_set( "said_nicely_done" );
}

_id_D495()
{
    var_0 = 0;
    common_scripts\utility::flag_wait( "clifftop_patrol2_dead" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        var_0 = 1;

    if ( common_scripts\utility::flag( "interupt_second_encounter" ) )
        var_0 = 1;

    wait 0.5;

    if ( var_0 )
    {
        if ( common_scripts\utility::flag( "said_dont_alert_them" ) )
            level.price maps\_utility::dialogue_queue( "cliff_pri_notsneaky" );
        else
        {
            level.price maps\_utility::dialogue_queue( "cliff_pri_dontalertthem" );
            common_scripts\utility::flag_set( "said_dont_alert_them" );
        }
    }
}

_id_B5CA()
{
    common_scripts\utility::flag_wait( "price_go_to_climb_ridge" );
    var_0 = 30;
    thread _id_C0CF::_id_BC13( var_0 );
    common_scripts\utility::flag_set( "whiteout_started" );
    soundscripts\_snd::snd_message( "aud_add_snowstorm_ambience", var_0 );
    wait 2;
    common_scripts\utility::flag_set( "blizzard_halfway" );
    maps\cliffhanger_stealth::_id_B903();
    maps\_utility::wait_for_flag_or_timeout( "blizzard_finish", 20 );
    _id_C0D2( 8 );
}

_id_CE6F()
{
    common_scripts\utility::flag_wait_either( "clifftop_patrol2_dead", "price_go_to_climb_ridge" );
    wait 3;
    common_scripts\utility::flag_wait( "blizzard_halfway" );
    common_scripts\utility::flag_set( "player_react_to_storm" );

    if ( !common_scripts\utility::flag( "someone_became_alert" ) || !common_scripts\utility::flag( "_stealth_spotted" ) )
        level.price maps\_utility::dialogue_queue( "cliff_pri_stormsbrewing" );

    level.player playsound( "scn_wind_draft_start_storm" );
    common_scripts\utility::flag_set( "said_storm_brewing" );
}

_id_CAE0()
{
    common_scripts\utility::flag_wait( "price_at_climbing_spot" );
    common_scripts\utility::flag_wait( "said_storm_brewing" );

    if ( common_scripts\utility::flag( "someone_became_alert" ) || common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "someone_became_alert" );
    _id_B2A9( "cliff_pri_splitup" );
    wait 0.2;
    _id_B2A9( "cliff_pri_coverofstorm" );
    wait 0.5;
    _id_B2A9( "cliff_pri_likeaghost" );
    wait 0.2;
    _id_B2A9( "cliff_pri_keepeyeonheart" );
    common_scripts\utility::flag_set( "said_lets_split_up" );
}

_id_C5A5()
{
    level endon( "base_c4_planted" );
    common_scripts\utility::flag_wait( "give_c4_obj" );

    if ( common_scripts\utility::flag( "someone_became_alert" ) || common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    thread _id_B2A9( "cliff_pri_tappedcomms" );
    thread _id_B2A9( "cliff_pri_yourein_2" );
    thread _id_B2A9( "cliff_pri_yourein_3" );
}

_id_C59C()
{
    var_0 = 15;
    thread _id_C0CF::_id_D5AE( var_0, var_0 );
    common_scripts\utility::flag_wait( "price_go_to_climb_ridge" );
    thread _id_B5CA();
}

_id_BD9B()
{
    level notify( "kill_variable_blizzard" );
    var_0 = 10;
    thread _id_C0CF::_id_BBE8( undefined, var_0 );
    soundscripts\_snd::snd_message( "aud_remove_snowstorm_ambience", var_0 );
    wait(var_0);
    maps\cliffhanger_stealth::_id_CEDC();
}

_id_AECB()
{
    self.pathrandompercent = 200;
    thread maps\_utility::disable_cqbwalk();

    if ( isdefined( self.script_stealthgroup ) )
        thread maps\_stealth_shared_utilities::enemy_announce_spotted( self.origin );

    self.goalradius = 400;
    self.favoriteenemy = level.player;
    self setgoalentity( level.player );
}

_id_C360()
{
    level.player endon( "detonate" );
    thread _id_C6D2();
    _id_C4CD();
    thread _id_D072();
}

_id_D072()
{
    common_scripts\utility::flag_clear( "can_save" );
    level notify( "kill_price" );
    level.price.ignoreme = 0;
    level.price maps\_utility::stop_magic_bullet_shield();
    wait 0.5;

    if ( isalive( level.price ) )
    {
        level.price.allowdeath = 1;
        level.price stopanimscripted();
        level.price kill();
    }

    wait 2.5;
    setdvar( "ui_deadquote", &"CLIFFHANGER_PRICE_DIED" );
    maps\_utility::missionfailedwrapper();
    level.player waittill( "detonate" );
}

_id_C6D2()
{
    level endon( "stop_detecting_player_shot" );
    level.player endon( "detonate" );
    level.player endon( "death" );
    level.price endon( "death" );
    wait 0.1;
    var_0 = "";
    var_1 = 0;

    for (;;)
    {
        if ( common_scripts\utility::flag( "player_steps_into_view" ) || level.player isthrowinggrenade() )
        {
            level.player maps\_utility::delaythread( 1, maps\_utility::send_notify, "player_shot" );
            return;
        }

        if ( level.player isfiring() && !level.player ismeleeing() )
        {
            level.player maps\_utility::delaythread( 1, maps\_utility::send_notify, "player_shot" );
            return;
        }

        wait 0.05;
    }
}

_id_C01E()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    level.price.dontevershoot = 1;
    common_scripts\utility::flag_wait( "start_big_explosion" );
    level.price.dontevershoot = undefined;
    level.price maps\_utility::disable_cqbwalk();

    if ( level.price maps\_utility::ent_flag_exist( "_stealth_enabled" ) )
        level.price maps\_utility::ent_flag_clear( "_stealth_enabled" );

    var_0 = level.price.baseaccuracy;
    level.price.baseaccuracy = 5000;
    level.price setgoalpos( level.price.origin );
    level.price maps\_utility::disable_ai_color();
    level.price.goalradius = 64;
    common_scripts\utility::flag_wait( "capture_enemies_dead" );
    level.price.baseaccuracy = var_0;
}

_id_C4CD()
{
    level.player endon( "player_shot" );
    var_0 = getent( "h2_hanger_enemies_enter", "targetname" );
    var_0 waittill( "runin_out" );
}

_id_B7A2()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    common_scripts\utility::flag_wait( "player_can_see_capture" );
    setdvar( "player_has_witnessed_capture", 1 );
    level.price maps\_utility::dialogue_queue( "plan_b" );
    level notify( "stop_detecting_player_shot" );
    level.player giveweapon( "c4" );

    if ( getdvarint( "sf_use_ignoreammo" ) == 1 )
        setsaveddvar( "player_sustainAmmo", 0 );

    level.player setweaponammoclip( "c4", 0 );

    if ( getdvarint( "sf_use_ignoreammo" ) == 1 )
        setsaveddvar( "player_sustainAmmo", 1 );

    level.player setweaponammoclip( "c4", 0 );
    level._id_A8A3 = level.player getcurrentweapon();
    level.player switchtoweapon( "c4" );
    level.player disableweaponswitch();
    level.player disableoffhandweapons();
    setsaveddvar( "actionSlotsHide", 1 );
    level.player endon( "detonate" );
    common_scripts\utility::flag_wait( "player_steps_into_view" );
    level.player notify( "player_shot" );
}

_id_A93B()
{
    if ( common_scripts\utility::flag( "player_can_see_capture" ) )
        return;

    level endon( "player_can_see_capture" );
    level._id_D3CD maps\_utility::dialogue_queue( "cliff_pet_capturedcomrade" );
    level._id_D3CD maps\_utility::dialogue_queue( "cliff_pet_surrender" );
    level._id_D3CD maps\_utility::dialogue_queue( "cliff_pet_willdie" );
    level._id_D3CD maps\_utility::dialogue_queue( "cliff_pet_handsup" );
    level._id_D3CD maps\_utility::dialogue_queue( "cliff_pet_verywell" );
}

_id_AB4C()
{
    level.player waittill( "detonate" );
    common_scripts\utility::flag_set( "player_detonate" );
    setsaveddvar( "actionSlotsHide", 0 );
}

_id_CD21()
{
    level.price notify( "stop personal effect" );
    level.price maps\_utility::enable_cqbwalk();
    thread _id_CBA0( "off" );
    var_0 = getent( "soap_waiting_node", "targetname" );

    if ( common_scripts\utility::flag( "brought_friends" ) )
        var_0 maps\_anim::anim_reach_and_approach_solo( level.price, "hunted_open_barndoor", undefined, "Cover Right" );

    var_0 thread maps\_anim::anim_single_solo( level.price, "hunted_open_barndoor" );
    var_1 = maps\_utility::spawn_anim_model( "locker_1" );
    var_2 = maps\_utility::spawn_anim_model( "locker_2" );
    level._id_C932 = [];
    level._id_C932[level._id_C932.size] = var_1;
    level._id_C932[level._id_C932.size] = var_2;
    var_3 = getent( "locker_brawl", "targetname" );
    var_3 maps\_anim::anim_first_frame( level._id_C932, "locker_brawl" );
    var_4 = getent( "hanger_entrance_door", "targetname" );
    var_5 = getentarray( var_4.target, "targetname" );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        var_5[var_6] linkto( var_4, "jnt_door" );

    var_4 maps\_utility::assign_animtree( "door" );
    var_4 thread maps\_anim::anim_single_solo( var_4, "open_door_anim" );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        if ( var_5[var_6].classname == "script_brushmodel" )
            var_5[var_6] connectpaths();
    }

    level.price maps\_utility::disable_cqbwalk();
    thread maps\_utility::battlechatter_off( "axis" );
}

_id_CCF7()
{
    var_0 = maps\_utility::_id_CC1D( "hanger_capture_enemy1" );
    var_1 = maps\_utility::_id_CC1D( "hanger_capture_enemy2" );
    var_2 = maps\_utility::_id_CC1D( "hanger_capture_enemy3" );
    var_3 = maps\_utility::_id_CC1D( "hanger_capture_enemy4" );
    var_4 = maps\_utility::_id_CC1D( "hanger_capture_enemy5" );
    var_5 = maps\_utility::_id_CC1D( "hanger_capture_enemy6" );
    var_6 = maps\_utility::_id_CC1D( "hanger_capture_petrov" );
    var_0.animname = "guard1";
    var_1.animname = "guard2";
    var_2.animname = "guard3";
    var_3.animname = "guard4";
    var_4.animname = "guard5";
    var_5.animname = "guard6";
    var_6.animname = "petrov";
    var_7 = [];
    var_7[var_7.size] = var_0;
    var_7[var_7.size] = var_1;
    var_7[var_7.size] = var_2;
    var_7[var_7.size] = var_3;
    var_7[var_7.size] = var_4;
    var_7[var_7.size] = var_5;
    var_7[var_7.size] = var_6;
    common_scripts\utility::array_thread( var_7, ::_id_CDC3 );
    common_scripts\utility::array_thread( var_7, ::_id_D50E );
    common_scripts\utility::array_thread( var_7, ::_id_CB5D );

    foreach ( var_9 in var_7 )
    {
        var_9 maps\_utility::disable_surprise();

        if ( var_9.animname == "guard1" || var_9.animname == "guard6" )
            var_9 allowedstances( "crouch" );

        var_9.cheat._id_BDF2 = 1;
    }
}

_id_BDF9()
{
    thread _id_CDC3();
    thread _id_D18A();
    thread _id_C030();
    thread maps\_utility::enable_cqbwalk();
    self.cheat.ignorewolfthink = 1;
    self.cheat._id_BDF2 = 1;
    self allowedstances( "stand" );
}

_id_CD50()
{
    var_0 = getentarray( "hanger_capture_enemies", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_BDF9 );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_C030()
{
    self endon( "death" );
    var_0 = [];
    var_0[var_0.size] = "capture_shoutingA";
    var_0[var_0.size] = "capture_shoutingB";
    self waittill( "goal" );
    wait 1;
    maps\_anim::anim_generic( self, var_0[randomint( var_0.size )] );
}

_id_D18A()
{
    self endon( "death" );
    var_0 = [];
    var_0[var_0.size] = "explosion_reactA";
    var_0[var_0.size] = "explosion_reactB";
    var_0[var_0.size] = "explosion_reactC";
    var_0[var_0.size] = "explosion_reactD";
    var_0[var_0.size] = "explosion_reactE";
    common_scripts\utility::flag_wait( "start_big_explosion" );
    wait(randomfloatrange( 0, 0.5 ));
    self.allowdeath = 1;
    self.health = 1;
    self.a.pose = "stand";
    maps\_anim::anim_generic( self, var_0[randomint( var_0.size )] );
}

_id_D50E()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "start_big_explosion" );
    wait(randomfloatrange( 0, 0.5 ));
    self.allowdeath = 1;
    self.health = 1;
    self.a.pose = "stand";
    var_0 = spawn( "script_origin", ( -8944.6, -25958.3, 895.999 ) );
    var_0.angles = ( 0.0, -44.613, 0.0 );
    var_0 maps\_anim::anim_single_solo( self, "react" );
}

_id_C134()
{
    var_0 = getent( "hangar_leftdoor_goal", "targetname" );
    var_1 = getent( "hangar_leftdoor_start", "targetname" );
    var_2 = getentarray( "hangar_leftdoor", "targetname" );
    var_2 thread _id_BBD1( var_0, var_1 );
    var_3 = getent( "hangar_rightdoor_goal", "targetname" );
    var_4 = getent( "hangar_rightdoor_start", "targetname" );
    var_5 = getentarray( "hangar_rightdoor", "targetname" );
    var_5 thread _id_BBD1( var_3, var_4 );
    wait 0.3;
    var_6 = getent( "hanger_door_shadowbrush", "targetname" );
    var_6 delete();
    soundscripts\_snd::snd_message( "aud_change_hanger_ambience" );
    soundscripts\_snd::snd_message( "aud_activate_hanger_door_transition" );
    soundscripts\_snd::snd_message( "aud_start_mix_mactavish_trapped" );
}

_id_BBD1( var_0, var_1 )
{
    var_2 = 5.75;
    var_3 = ( var_0.origin - var_1.origin ) * ( 1.0, 1.0, 0.0 );

    foreach ( var_5 in self )
    {
        var_5 moveto( var_5.origin + var_3, var_2, 1, 0.4 );

        if ( isdefined( var_5.script_disconnectpaths ) && var_5.script_disconnectpaths )
            var_5 connectpaths();
    }

    self[0] playsound( "door_hanger_metal_open" );
    wait(var_2);

    foreach ( var_5 in self )
    {
        if ( isdefined( var_5.script_disconnectpaths ) && var_5.script_disconnectpaths )
            var_5 disconnectpaths();
    }
}

_id_C98F()
{
    var_0 = getent( "hangar_leftdoor_goal", "targetname" );
    var_1 = getentarray( "hangar_leftdoor", "targetname" );
    var_1 thread _id_D213( var_0 );
    var_2 = getent( "hangar_rightdoor_goal", "targetname" );
    var_3 = getentarray( "hangar_rightdoor", "targetname" );
    var_3 thread _id_D213( var_2 );
}

_id_D213( var_0 )
{
    var_1 = ( var_0.origin - self[0].origin ) * ( 1.0, 1.0, 0.0 );

    foreach ( var_3 in self )
    {
        var_3.origin += var_1;

        if ( isdefined( var_3.script_disconnectpaths ) && var_3.script_disconnectpaths )
            var_3 disconnectpaths();
    }
}

_id_CDC3()
{
    self endon( "death" );
    self.dontevershoot = 1;
    self.goalradius = 8;
    self.script_forcegoal = 1;
    common_scripts\utility::flag_wait( "start_big_explosion" );
    self.allowdeath = 1;
    wait 3;
    self.dontevershoot = undefined;
}

_id_BBE6( var_0, var_1 )
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    common_scripts\utility::flag_wait( "start_big_explosion" );
    soundscripts\_snd::snd_message( "aud_stop_mix_mactavish_trapped" );
    soundscripts\_snd::snd_message( "aud_start_mix_slowmo_explosion" );
    maps\_utility::slowmo_start();
    maps\_utility::slowmo_setspeed_slow( 0.3 );
    maps\_utility::slowmo_setlerptime_in( 0.05 );
    maps\_utility::slowmo_lerp_in();
    wait 0.5;
    level.player unlink();
    level.player allowfire( 0 );
    level.player _meth_80FA( "c4", "drop" );
    waitframe();
    wait(( level.player _meth_859B() - 50 ) / 1000);
    level.player _meth_84A8();
    level.player enableweapons();
    level.player takeweapon( "c4" );
    level.player enableweaponswitch();
    level.player enableoffhandweapons();
    var_2 = level._id_A8A3;

    if ( !level.player hasweapon( var_2 ) )
    {
        var_2 = level.player getweaponslistprimaries()[0];

        if ( !isdefined( var_2 ) )
            var_2 = level.player getweaponslistall()[0];
    }

    level.player switchtoweapon( var_2 );
    level.player allowfire( 1 );
    level.player setmovespeedscale( 1 );
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
    thread _id_BB04();
    common_scripts\utility::flag_wait( "end_big_explosion" );
    var_3 = getaiarray( "axis" );

    foreach ( var_5 in var_3 )
        var_5.baseaccuracy = 0;

    wait 0.5;
    maps\_utility::slowmo_setlerptime_out( 1 );
    maps\_utility::slowmo_lerp_out();
    maps\_utility::slowmo_end();
    level.price maps\_utility::gun_recall();
    var_3 = getaiarray( "axis" );

    foreach ( var_5 in var_3 )
        var_5.baseaccuracy = _id_CDA4();

    level.player playsound( "scn_cliff_c4_explosion_snowwave" );
    wait 2;
    common_scripts\utility::flag_set( "hanger_slowmo_ends" );
    soundscripts\_snd::snd_message( "aud_stop_mix_slowmo_explosion" );
    wait 1;
    soundscripts\_snd::snd_message( "aud_base_alarm_system" );
    maps\_utility::battlechatter_on( "axis" );
    wait 2;
    maps\_utility::autosave_by_name( "slowmo_ends" );
}

_id_CDA4()
{
    return 0.42;
}

_id_D38A( var_0, var_1 )
{
    common_scripts\_exploder::exploder( 8 );
    level.player playsound( "scn_hangar_explo_front" );
    wait 0.2;
    common_scripts\_exploder::exploder( 12 );
    wait 0.1;
    common_scripts\_exploder::exploder( 10 );
    wait 0.2;
    common_scripts\utility::flag_set( "end_big_explosion" );
    wait 0.2;
    _id_B2F6( "mig1" );
    wait 0.2;
    _id_B2F6( "mig2" );
    wait 0.5;

    if ( isdefined( level._id_CD65 ) )
    {
        var_2 = level._id_CD65;
        var_2 = maps\_utility::remove_dead_from_array( var_2 );
        var_2 = common_scripts\utility::get_array_of_closest( level.player.origin, var_2 );

        for ( var_3 = 6; var_3 < var_2.size; var_3++ )
        {
            var_4 = common_scripts\utility::randomvector( 10 );
            var_4 = ( var_4[0], var_4[1], abs( var_4[2] ) );
            var_4 += var_2[var_3].origin;
            _id_B190::_id_D55F( var_2[var_3] );
            var_2[var_3] kill();
            wait 0.05;
        }
    }
}

_id_BB04()
{
    level.player waittill( "reload_start" );
    common_scripts\utility::flag_set( "player_reloading" );
}

_id_B9DC()
{
    maps\_utility::add_global_spawn_function( "axis", ::no_grenades );
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
        var_2 no_grenades();
}

no_grenades()
{
    self.grenadeammo = 0;
}

_id_BD9F()
{
    if ( self.code_classname == "script_brushmodel" )
        self connectpaths();

    self delete();
}

_id_D0FB()
{
    self.baseaccuracy = _id_CDA4();
}

_id_C481( var_0 )
{
    var_1 = newhudelem();
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1.horzalign = "center";
    var_1.vertalign = "middle";
    var_1.x = 0;
    var_1.y = 0;
    var_1 settext( var_0 );
    var_1.alpha = 0;
    var_1.foreground = 1;
    var_1.sort = 150;
    var_1.fontscale = 1.75;
    return var_1;
}

_id_CF75()
{
    var_0 = [];
    var_0["e3"] = 1;
    return isdefined( var_0[level.start_point] );
}

_id_B663()
{
    common_scripts\utility::flag_init( "broke_stealth" );
    common_scripts\utility::flag_wait_any( "_stealth_spotted", "someone_became_alert" );
    common_scripts\utility::flag_set( "broke_stealth" );
}

_id_C6C8( var_0 )
{
    wait 3;

    if ( !isalive( level.price ) )
        return;

    if ( !level.price.damageshield )
        return;

    if ( !maps\_autosave::autosavecheck() )
        return;

    commitsave( var_0 );
}

_id_B81A( var_0 )
{
    self _meth_84A7( "force_off" );

    while ( isdefined( var_0 ) )
    {
        while ( isdefined( var_0 ) && common_scripts\utility::distance_2d_squared( self.origin, level.player.origin ) > 1000000 )
            wait 0.5;

        self _meth_84A7( "force_fully_on" );

        while ( isdefined( var_0 ) && common_scripts\utility::distance_2d_squared( self.origin, level.player.origin ) < 1210000 )
            wait 0.5;

        self _meth_84A7( "force_off" );
    }

    self _meth_84A7( "force_off" );
    self setlightintensity( 0 );
    wait 0.1;
    self delete();
}

_id_D40F()
{
    var_0 = getentarray( "generator_spotlight", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_B81A, thisthread );
    var_1 = getent( "generator_linkedtolight", "script_noteworthy" );
    var_1 waittill( "exploded" );
}

_id_CF12( var_0, var_1, var_2 )
{
    level notify( "wibble_changing_" + var_0 );
    level endon( "wibble_changing_" + var_0 );
    var_3 = var_2 * 10;
    var_4 = ( var_1 - level._id_B392[var_0] ) / var_3;

    while ( var_3 > 0 )
    {
        level._id_B392[var_0] += var_4;
        _func_2F1( 0, var_0, level._id_B392[var_0] );
        var_3--;
        wait 0.1;
    }
}

_id_BA3C()
{
    for (;;)
    {
        level waittill( "player_indoors", var_0, var_1 );

        if ( isdefined( var_1 ) )
        {
            if ( isdefined( var_1.script_parameters ) && var_1.script_parameters == "cliffhanger_hangar" )
                var_2 = 0;
            else
                var_2 = 0.3;

            thread _id_CF12( "x", var_2, 2 );
            thread _id_CF12( "y", var_2, 1 );
        }
    }
}

_id_CEE6()
{
    common_scripts\utility::flag_init( "wibble_changing" );
    level endon( "player_gets_on_snowmobile" );
    childthread _id_BA3C();
    level._id_B392["x"] = 0;
    level._id_B392["y"] = 0;
    wait 1;

    for (;;)
    {
        if ( isdefined( level._id_B553 ) && ( level._id_B553 == "hard" || level._id_B553 == "extreme" ) )
        {
            var_0 = 0.7;
            var_1 = 0.5;
        }
        else
        {
            var_0 = 0.5;
            var_1 = 0.3;
        }

        if ( !common_scripts\utility::flag( "player_indoors" ) )
        {
            thread _id_CF12( "x", var_0, 2 );
            thread _id_CF12( "y", var_1, 1 );
        }

        level waittill( "blizzard_level_change" );
    }
}

_id_D1EB()
{
    setsaveddvar( "actionSlotsHide", 1 );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "ammoCounterHide", 1 );
    thread _id_BA81();
    var_0 = getent( "c4_planting_node", "targetname" );
    var_1 = maps\_utility::spawn_anim_model( "worldbody" );
    var_1 hide();
    var_0 maps\_anim::anim_first_frame_solo( var_1, "planting_c4" );
    var_2 = self getstance();
    self allowstand( 1 );
    self allowcrouch( 0 );
    self allowprone( 0 );
    self enableinvulnerability();
    self disableweapons( 1, 200, 0.1 );
    var_3 = 0.2;
    var_4 = 0.5;

    if ( var_2 == "crouch" )
        var_3 = 0.25;
    else if ( var_2 == "prone" )
    {
        var_3 = 0.95;
        var_4 = 0.95;
    }

    var_5 = maps\_anim::_id_D101( var_1, 40, 100, var_3, var_4 );
    self playerlinktoblend( var_1, "tag_player", var_5, var_5 / 2, var_5 / 2 );
    wait(var_5);
    var_1 show();
    thread h2_c4_install_cin();
    var_0 maps\_anim::anim_single_solo( var_1, "planting_c4" );
    self unlink();
    var_1 delete();
    self allowcrouch( 1 );
    self allowprone( 1 );
    self enableweapons();
    self disableinvulnerability();
}

h2_c4_install_cin()
{
    var_0 = _id_D397::_id_A97A( "cin_install_c4" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 16.0, 34.0, 16.0, 16.0 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 0.35 ) _id_D397::_id_C491( 3.0, 13.0, 3.0, 3.0 );
    var_0 _id_D397::_id_BEA0( 0.85 ) _id_D397::_id_C491( 3.0, 18.5, 2.0, 2.0 );
    var_0 _id_D397::_id_BEA0( 2.15 ) _id_D397::_id_C491( 16.0, 30.0, 6.0, 6.0 );
    var_0 _id_D397::_id_BEA0( 2.65 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 2.65 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 1.05 ) _id_D397::_id_B85E( 0.12, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.2 );
    var_0 _id_D397::_id_BC26();
}

_id_BA81()
{
    var_0 = getentarray( "possible_c4_models", "targetname" );
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 hide();
}

_id_AD56( var_0, var_1, var_2 )
{
    if ( var_2 )
        thread maps\cliffhanger_anim::_id_BE61( self );

    if ( var_1 )
        maps\_anim::anim_single_queue( self, var_0 );
    else
        maps\_utility::dialogue_queue( var_0 );

    if ( var_2 )
        maps\cliffhanger_anim::_id_C6E7( self );
}

_id_C25A( var_0 )
{
    self enabledeathshield( 1 );
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles;
    var_2 = maps\_utility::spawn_anim_model( "worldbody" );
    var_2 hide();
    var_3 = [];
    var_3["left"] = spawn( "script_origin", var_0 gettagorigin( "tag_wheel_front_left" ) );
    var_3["right"] = spawn( "script_origin", var_0 gettagorigin( "tag_wheel_front_right" ) );
    var_4 = maps\_utility::get_closest_index( level.player.origin, var_3, 500 );
    var_3["left"] delete();
    var_3["right"] delete();
    var_1 maps\_anim::anim_first_frame_solo( var_2, "mounting_snowmobile_" + var_4 );
    var_5 = 0;
    var_6 = level.player getstance();

    if ( var_6 == "crouch" )
        var_5 = 0.25;
    else if ( var_6 == "prone" )
        var_5 = 0.85;

    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    wait(var_5);
    self disableweapons( 1, 200, 0.1 );
    setsaveddvar( "objectiveHide", 1 );
    var_7 = maps\_anim::_id_D101( var_2, 60, 80, 0.2, 0.75 );
    self playerlinktoblend( var_2, "tag_player", var_7, var_7 / 2, var_7 / 2 );
    wait(var_7);
    self playerlinktodelta( var_2, "tag_player", 1, 0, 0, 0, 0, 1 );
    var_8 = getdvar( "sv_znear" );
    setsaveddvar( "sv_znear", 1.0 );
    var_2 show();
    _id_B3A3( var_0 );
    var_1 thread maps\_anim::anim_single_solo( var_2, "mounting_snowmobile_" + var_4 );
    var_9 = getanimlength( var_2 maps\_utility::getanim( "mounting_snowmobile_" + var_4 ) );
    var_2 maps\_anim::_id_B6DB( "stop_lerp", var_1, var_0, var_9 );
    setsaveddvar( "sv_znear", var_8 );
    self unlink();
    var_2 delete();
    var_1 delete();
    self allowcrouch( 1 );
    self allowprone( 1 );
    self enableweapons();
    setsaveddvar( "objectiveHide", 0 );
    self enabledeathshield( 0 );
}

_id_B3A3( var_0 )
{
    var_0.animname = "snowmobile_player";
    var_0 setanim( var_0 maps\_utility::getanim( "rpm_min" ), 1 );
    var_0 setanim( var_0 maps\_utility::getanim( "rpm_max" ), 0 );
    var_0 setanim( var_0 maps\_utility::getanim( "speedometer_0" ), 1 );
}

_id_CBA0( var_0 )
{
    var_1 = getdvar( "r_znear" );
    setsaveddvar( "r_znear", 1 );
    level.player allowads( 0 );
    level.player allowfire( 0 );
    level.player allowjump( 0 );
    level.player allowsprint( 0 );
    level.player allowlean( 0 );
    level.player _meth_830E( 0 );
    level.player allowmelee( 0 );
    level.player _meth_8517( 0 );
    level.player _meth_830F( 0 );
    level.player allowstand( 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 0 );
    wait 0.5;
    var_2 = var_0 == "on";
    var_3 = "h2_vm_snowgoggle_takeoff";
    var_4 = _id_C0CF::_id_BC73;
    var_5 = 0.5;

    if ( var_2 )
    {
        var_5 = 0.35;
        var_4 = _id_C0CF::_id_BAB9;
        var_3 = "h2_vm_snowgoggle_puton";
    }

    level.player thread maps\_anim::_id_B22D( var_3 );
    level.player waittill( "viewmodelAnimStart" );
    maps\_utility::delaythread( 0.25, var_4, level.player, var_5 );
    level.player waittill( "viewmodelAnimRaiseEnd" );
    level.player allowads( 1 );
    level.player allowfire( 1 );
    level.player allowjump( 1 );
    level.player allowsprint( 1 );
    level.player allowlean( 1 );
    level.player _meth_830E( 1 );

    if ( !isdefined( level._id_C58A ) || !level._id_C58A )
        level.player allowmelee( 1 );

    level.player _meth_8517( 1 );
    level.player _meth_830F( 1 );
    level.player allowstand( 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    setsaveddvar( "r_znear", var_1 );
    setsaveddvar( "fx_alphathreshold", 0 );
}

_id_C622()
{
    var_0 = getent( "acs_node", "targetname" );
    var_1 = getent( "dsm", "targetname" );
    var_1.animname = "acs_module";
    var_1 maps\_utility::assign_animtree();
    var_2 = maps\_utility::spawn_anim_model( "acs_wires" );
    var_3 = maps\_utility::spawn_anim_model( "worldbody" );
    var_3 hide();
    var_1 maps\_utility::glow();
    var_0 maps\_anim::anim_first_frame_solo( var_3, "pickup_acs" );
    var_0 maps\_anim::anim_first_frame_solo( var_1, "pickup_acs" );
    var_0 maps\_anim::anim_first_frame_solo( var_2, "pickup_acs" );
    var_0 waittill( "start_anims" );
    setsaveddvar( "actionSlotsHide", 1 );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "hud_showStance", 0 );
    var_1 maps\_utility::stopglow();
    self allowcrouch( 0 );
    self allowprone( 0 );
    self disableweapons( 1, 200, 0.1 );
    var_4 = maps\_anim::_id_D101( var_3, 40, 100, 0.2, 0.75 );
    self playerlinktoblend( var_3, "tag_player", var_4, var_4 / 2, var_4 / 2 );
    wait(var_4);
    var_3 show();
    thread h2_pickup_acs_cin();
    var_0 thread maps\_anim::anim_single_solo( var_1, "pickup_acs" );
    var_0 thread maps\_anim::anim_single_solo( var_2, "pickup_acs" );
    var_0 maps\_anim::anim_single_solo( var_3, "pickup_acs" );
    self unlink();
    var_3 delete();
    self allowcrouch( 1 );
    self allowprone( 1 );
    self enableweapons();
    var_0 delete();
    var_1 delete();
    setsaveddvar( "compass", 1 );
    setsaveddvar( "actionSlotsHide", 0 );
    setsaveddvar( "hud_showStance", 1 );
    level.price _id_B3AB::_id_B0AC();
    var_5 = maps\_utility::getfxarraybyid( "light_godray_cliffhanger_hangar" );
    var_5 = common_scripts\utility::array_combine( var_5, maps\_utility::getfxarraybyid( "cliff_underdoor_hangar_snow" ) );

    foreach ( var_7 in var_5 )
        var_7 common_scripts\utility::pauseeffect();

    setsaveddvar( "fx_alphathreshold", 10 );
}

h2_pickup_acs_cin()
{
    var_0 = _id_D397::_id_A97A( "pickup_acs_cin" );
    var_0 _id_D397::_id_BEA0( 0.25 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 1.6 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 0.25 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 0.85 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.1 ) _id_D397::_id_B85E( 0.1, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BEA0( 1.6 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BC26();
}

_id_CE7A()
{
    waitframe();
    common_scripts\utility::flag_wait_any( "blizzard_start", "done_with_stealth_camp", "player_in_hanger" );
    var_0 = maps\_utility::getfxarraybyid( "cliff_mountain_clouds_01" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cliff_mountain_clouds_02" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cliff_mountain_clouds_03_blured" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cliff_mountain_clouds_03" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cliff_mountain_clouds_04" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cliff_mountain_clouds_05" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "snow_blowoff_ledge_runner" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "snow_blowoff_ledge_interval_runner" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cliff_ice_parts_falling_runner" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cliff_snow_ledge_xxxlarge_swirl" ) );

    foreach ( var_2 in var_0 )
        var_2 common_scripts\utility::pauseeffect();
}

_id_D4E0( var_0 )
{
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "actionSlotsHide", 1 );
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "cg_drawcrosshair", "0" );
    level.player notify( "noHealthOverlay" );
    var_1 = 1.5;
    soundscripts\_snd::snd_message( "start_fade_to_death" );
    visionsetnaked( "black_bw", var_1 );
    wait(var_1);
    wait 0.5;

    if ( isdefined( var_0 ) )
        [[ var_0 ]]();
    else
        maps\_player_death::_id_B848();

    maps\_utility::missionfailedwrapper();
}

_id_BF9B( var_0 )
{
    var_1 = getentarray( "chair_clip", "targetname" );
    maps\_utility::array_delete( var_1 );
}

_id_AB29( var_0 )
{
    var_1 = [];
    var_1["aug_reflex"] = "ak47_arctic_reflex";
    var_1["aug_scope"] = "ak47_arctic_acog";
    var_1["ump45_arctic"] = "kriss";
    var_1["ump45_reflex"] = "kriss_reflex";
    var_1["kriss_eotech"] = "kriss_reflex";

    foreach ( var_4, var_3 in var_1 )
    {
        if ( var_4 == var_0 )
            return var_3;
    }

    return var_0;
}
#using_animtree("vehicles");

_id_ADD5( var_0 )
{
    var_0[0].vehicle_getoutanim = %h2_uaz_driver_exit_into_stand_door_winter;
    var_0[1].vehicle_getoutanim = %h2_uaz_passenger_exit_into_stand_door_winter;
    var_0[2].vehicle_getoutanim = %h2_uaz_rear_driver_exit_into_stand_door_winter;
    var_0[3].vehicle_getoutanim = %h2_uaz_passenger2_exit_into_stand_door_winter;
    return var_0;
}

h2_delete_icicles()
{
    common_scripts\utility::flag_wait( "player_detonate" );
    var_0 = getentarray( "hanging_object", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_wtf ) && var_2.script_wtf == "icicle_delete" )
            var_2 delete();
    }
}

hide_snow_decals()
{
    var_0 = getentarray( "snow_door", "script_noteworthy" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "snow_doors" );

        foreach ( var_2 in var_0 )
            var_2 hide();

        common_scripts\utility::flag_waitopen( "snow_doors" );

        foreach ( var_2 in var_0 )
            var_2 show();
    }
}

swap_decals_on_propane_tank()
{
    var_0 = getentarray( self.target, "targetname" );

    for (;;)
    {
        if ( isdefined( self.exploded ) )
        {
            var_1 = spawn( "script_model", self.origin );
            var_1.angles = self.angles;
            var_1 setmodel( "com_propane_tank02_des_decal" );

            foreach ( var_3 in var_0 )
                var_3 delete();

            return;
        }

        waitframe();
    }
}

cliffhanger_polygonoffscale_override( var_0, var_1 )
{
    if ( !isdefined( level.xb3 ) || !level.xb3 )
        return;

    var_2 = getdvarfloat( "sm_polygonOffsetScale" );
    setsaveddvar( "sm_polygonOffsetScale", var_0 );
    level waittill( var_1 );
    setsaveddvar( "sm_polygonOffsetScale", var_2 );
}

tarped_mig_monitor()
{
    var_0 = getent( "tarp_to_delete1", "targetname" );
    var_1 = getent( "tarp_to_delete2", "targetname" );
    var_2 = undefined;
    var_3 = undefined;
    var_4 = getentarray( "destructible_toy", "targetname" );

    foreach ( var_6 in var_4 )
    {
        if ( isdefined( var_6.script_parameters ) && var_6.script_parameters == "tarped_mig1" )
            var_2 = var_6;

        if ( isdefined( var_6.script_parameters ) && var_6.script_parameters == "tarped_mig2" )
            var_3 = var_6;
    }

    thread wait_until_explode( var_2, var_0 );
    thread wait_until_explode( var_3, var_1 );
}

wait_until_explode( var_0, var_1 )
{
    var_0 waittill( "exploded" );
    var_1 delete();
}

snowmobile_visionset_setup()
{
    var_0 = getent( "snowmobile_visionset_trigger", "targetname" );
    var_1 = var_0.origin;
    var_0.origin += ( 0.0, 0.0, -1000.0 );
    common_scripts\utility::flag_wait( "keyboard_used" );
    var_0.origin = var_1;
}
