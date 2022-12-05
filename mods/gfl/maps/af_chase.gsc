// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" || getdvar( "beautiful_corner_hdr_demo" ) == "1" )
    {
        maps\af_chase_beautiful_corner::_id_C662();
        return;
    }

    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\af_chase_mission_select_cam::_id_C490();
        return;
    }

    maps\af_chase_knife_fight_code::_id_B410();
    level._id_CB4C = 0;
    precachestring( &"AF_CHASE_PURSUE" );
    precachestring( &"AF_CHASE_MISSION_FAILED_IN_THE_OPEN" );
    precachestring( &"AF_CHASE_MISSION_FAILED_KEEP_UP" );
    precachestring( &"AF_CHASE_FAILED_TO_SHOOT_DOWN" );
    precachestring( &"AF_CHASE_PRESS_USE" );
    precachestring( &"AF_CHASE_PRESS_USE_KEYBOARD" );
    precachestring( &"AF_CHASE_HINT_CRAWL_RIGHT" );
    precachestring( &"AF_CHASE_HINT_CRAWL_LEFT" );
    precachestring( &"AF_CHASE_KILL_SHEPHERD" );
    precachestring( &"SCRIPT_WAYPOINT_SHEPHERD" );
    precachestring( &"AF_CHASE_FAILED_TO_CRAWL" );
    precachestring( &"AF_CHASE_FAILED_TO_PULL_KNIFE" );
    precacheitem( "m203" );
    precacherumble( "steady_rumble" );
    precacherumble( "smg_fire" );
    precacheitem( "m16_grenadier" );
    precacheitem( "rpg_straight_af_chase" );
    precacheitem( "rpg_af_chase" );
    precacheitem( "rpd" );
    precacheitem( "uzi" );
    precacheitem( "littlebird_FFAR" );
    precacheitem( "minigun_littlebird_spinnup" );
    precachemodel( "weapon_commando_knife" );
    precachemodel( "weapon_commando_knife_bloody" );
    precachemodel( "viewmodel_commando_knife" );
    precachemodel( "viewmodel_commando_knife_bloody" );
    precachemodel( "zodiac_head_roller" );
    precachemodel( "weapon_colt_anaconda" );
    precachemodel( "vehicle_pickup_destroyed" );
    precachemodel( "weapon_colt_anaconda_animated" );
    precachemodel( "fx_rifle_shell" );
    precachemodel( "body_desert_tf141_zodiac" );
    precachemodel( "vehicle_little_bird_bench_afghan" );
    precachemodel( "vehicle_little_bird_minigun_right" );
    precachemodel( "hat_opforce_arab_d" );
    precacherumble( "heavy_1s" );
    precacherumble( "heavy_2s" );
    precacherumble( "heavy_3s" );
    precacherumble( "light_1s" );
    precacherumble( "light_2s" );
    precacherumble( "light_3s" );
    precachemodel( "body_vil_shepherd_no_gun" );
    precachemodel( "prop_misc_literock_small_01" );
    precachemodel( "prop_misc_literock_small_02" );
    precachemodel( "prop_misc_literock_small_03" );
    precachemodel( "prop_misc_literock_small_04" );
    precachemodel( "prop_misc_literock_small_05" );
    precachemodel( "prop_misc_literock_small_06" );
    precachemodel( "prop_misc_literock_small_07" );
    precachemodel( "prop_misc_literock_small_08" );
    precachemodel( "viewbody_tf141" );
    precachemodel( "h2_vehicle_pavelow_low" );
    precachemodel( "body_desert_tf141_zodiac_wet" );
    precachemodel( "head_hero_price_zodiac_wet" );
    precacheshellshock( "af_chase_boatdrive_end" );
    precacheshader( "overlay_hunted_black" );
    precacheitem( "ending_knife" );
    precacheitem( "alt_ending_knife" );
    precacheshader( "hud_icon_commando_knife" );
    precacheshader( "reticle_center_throwingknife" );
    precacherumble( "tank_rumble" );
    precacherumble( "damage_light" );
    precacherumble( "damage_heavy" );

    precachemodel( "h2_gfl_m4_sopmod_ii_body" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );

    level._id_D1DC = gettime();
    _id_BDA4::main();
    _id_CC30::main();
    _id_D557::main();
    setsaveddvar( "physVeh_limitTopSpeedWithBrakingFactor", 1 );
    maps\_utility::add_start( "boatdrive_nofail", ::_id_D0EF, "", ::empty );
    maps\_utility::add_start( "boatdrive_begin", ::_id_A99C, "", ::empty );
    maps\_utility::add_start( "boatdrive_lake", ::_id_D395, "", ::empty );
    maps\_utility::add_start( "boatdrive_lake_mid", ::_id_BA4A, "", ::empty );
    maps\_utility::add_start( "boatdrive_rapids", ::_id_C9EE, "", ::empty );
    maps\_utility::add_start( "boatdrive_below_rapids", ::_id_B895, "", ::empty );
    maps\_utility::add_start( "boatdrive_end", ::_id_C05C, "", maps\af_chase_knife_fight::_id_BD4B );
    maps\_utility::add_start( "debug_boatdrive", ::_id_B21A, "", ::empty );
    maps\_utility::default_start( ::_id_B972 );
    maps\af_chase_knife_fight::_id_D080();
    _id_D1E4();
    maps\_load::main();
    thread _id_AC5A();
    maps\af_chase_anim::_id_A902();
    thread maps\af_chase_knife_fight::_id_B068();
    _id_BE1D::_id_CD39( "h2_gfl_m4_sopmod_ii_viewhands_player" );
    _id_B257::main();
    var_0 = getentarray( "script_vehicle_zodiac_player", "classname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, _id_BE1D::_id_C525 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\af_chase_code::_id_BCEC );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\af_chase_code::_id_ACA8 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\af_chase_code::_id_D05C );
    var_1 = getentarray( "rpg_bridge_guy", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\af_chase_code::_id_AF8B );
    var_2 = getentarray( "actor_enemy_afghan_RPG", "classname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\af_chase_code::_id_B9CE );
    var_3 = 9000000;

    foreach ( var_5 in var_2 )
        var_5.script_sightrange = var_3;

    thread maps\af_chase_code::_id_BB55();
    var_7 = getentarray( "rope_splashers", "script_noteworthy" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, maps\af_chase_code::_id_D56F );
    var_8 = getent( "enemy_chase_boat", "targetname" );
    var_8 maps\_utility::add_spawn_function( maps\af_chase_code::_id_AE42 );
    var_9 = getent( "rapids_trigger", "targetname" );
    var_9 thread maps\af_chase_code::_id_B21C();
    var_9 thread maps\af_chase_code::_id_B7F5( "bump_small_after_rapids", "bump_big_after_rapids" );
    var_9 thread maps\af_chase_code::_id_AC04();
    var_10 = [ "helicopterFireHill01_trigger", "helicopterFireHill02_trigger", "helicopterFireHill03_trigger", "helicopterFireHill04_trigger", "helicopterFireHill05_trigger" ];

    foreach ( var_12 in var_10 )
    {
        var_13 = getent( var_12, "targetname" );
        var_13 thread maps\af_chase_code::_id_B859();
    }

    var_15 = getent( "on_river_trigger", "targetname" );
    var_15 thread maps\af_chase_code::_id_BDF5();
    var_16 = getent( "boat_mount", "targetname" );
    var_16 thread maps\af_chase_code::_id_B944();
    var_17 = getent( "increase_enemy_boats_mid_lake", "script_noteworthy" );
    var_17 thread maps\af_chase_code::_id_B7F8( 2 );
    var_18 = getentarray( "trigger_multiple_speed", "classname" );
    common_scripts\utility::array_thread( var_18, maps\af_chase_code::_id_B4BA );
    var_19 = getent( "enter_rapids", "targetname" );
    var_19 thread maps\af_chase_code::_id_AD51();
    var_20 = getentarray( "script_vehicle_littlebird_armed", "classname" );
    common_scripts\utility::array_thread( var_20, maps\_utility::add_spawn_function, maps\_vehicle::godon );
    var_21 = getentarray( "script_vehicle_zodiac", "classname" );
    var_22 = getentarray( "script_vehicle_zodiac_physics", "classname" );
    common_scripts\utility::array_thread( var_22, maps\_utility::add_spawn_function, maps\af_chase_code::_id_ACA8 );
    var_23 = common_scripts\utility::array_combine( var_21, var_22 );
    common_scripts\utility::array_thread( var_23, maps\_utility::add_spawn_function, maps\af_chase_code::_id_CAC1 );
    common_scripts\utility::array_thread( var_23, maps\_utility::add_spawn_function, maps\af_chase_code::_id_B141 );
    common_scripts\utility::array_thread( var_23, maps\_utility::add_spawn_function, maps\af_chase_code::_id_D05C );
    var_24 = getentarray( "script_vehicle_pavelow", "classname" );
    common_scripts\utility::array_thread( var_24, maps\_utility::add_spawn_function, maps\af_chase_code::_id_B34E );
    maps\_utility::add_global_spawn_function( "axis", maps\af_chase_code::_id_B6E4 );
    maps\_utility::add_global_spawn_function( "axis", maps\af_chase_code::_id_B422 );
    maps\_utility::add_global_spawn_function( "axis", maps\af_chase_code::_id_C9A3 );
    thread maps\af_chase_code::_id_C4E4();
    var_25 = getentarray( "destructible_fake", "script_noteworthy" );
    common_scripts\utility::array_thread( var_25, maps\af_chase_code::_id_D4C6 );
    thread _id_CD17();
    var_26 = getent( "end_caves_trigger", "targetname" );
    var_26 thread maps\af_chase_code::_id_C295();
    var_26 thread maps\af_chase_code::_id_B21C();
    var_27 = getent( "helicopterFireAtHill01", "targetname" );
    var_27 maps\_utility::add_spawn_function( maps\af_chase_code::new_helicopter_setup );
    var_28 = getent( "seaknight_fly_over", "targetname" );
    var_28 maps\_utility::add_spawn_function( ::seaknight_fly_over_model );
    var_29 = common_scripts\utility::getstructarray( "heli_attack_player_idle", "script_noteworthy" );
    common_scripts\utility::array_thread( var_29, maps\af_chase_code::_id_BBD3 );
    var_29 = getentarray( "heli_attack_player_idle", "script_noteworthy" );
    common_scripts\utility::array_thread( var_29, maps\af_chase_code::_id_BBD3 );
    var_30 = getentarray( "kill_destructibles_and_barrels_in_volume", "targetname" );
    common_scripts\utility::array_thread( var_30, maps\af_chase_code::_id_AEB4 );
    maps\_utility::add_extra_autosave_check( "boat_check_trailing", maps\af_chase_code::_id_D462, "trailing too far behind the enemy boat." );
    thread maps\af_chase_code::_id_CDF1( "river_flow" );
    thread maps\af_chase_zodiac::_id_D5CF();
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    setsaveddvar( "ragdoll_max_life", 20000 );
    setsaveddvar( "r_volumeLightScatterNeedsPrepass", 1 );
    var_31 = getentarray( "price_position_switch", "targetname" );
    common_scripts\utility::array_thread( var_31, maps\af_chase_code::_id_B352 );
    var_32 = getentarray( "bobbing_boat", "script_noteworthy" );
    common_scripts\utility::array_thread( var_32, maps\_utility::add_spawn_function, maps\af_chase_code::_id_A8C2 );
    var_33 = getentarray( "crashable_whizby_boats", "script_noteworthy" );
    common_scripts\utility::array_thread( var_33, maps\_utility::add_spawn_function, maps\af_chase_code::_id_B5AF );
    var_34 = getent( "enemy_zodiacs_wipe_out", "targetname" );
    var_34 thread maps\af_chase_zodiac::_id_CAED();
    var_35 = getentarray( "neutral_enemies", "targetname" );
    common_scripts\utility::array_thread( var_35, maps\af_chase_code::_id_B631 );
    var_36 = getent( "dialog_cave", "targetname" );
    var_36 thread maps\af_chase_code::_id_CD35();
    thread maps\af_chase_code::_id_B3DB();
    thread maps\af_chase_code::_id_B307();
    thread maps\af_chase_code::_id_CCEE();
    thread maps\af_chase_code::_id_B7F6();

    if ( maps\_utility::is_default_start() || issubstr( level.start_point, "boat" ) )
        thread maps\af_chase_waterfall::main();

    var_37 = getent( "trigger_out_of_caves", "targetname" );

    if ( isdefined( var_37 ) )
        var_37 thread maps\af_chase_code::_id_D46D();

    var_38 = getentarray( "open_area", "targetname" );
    common_scripts\utility::array_thread( var_38, maps\af_chase_code::_id_A901 );
    maps\_utility::battlechatter_off();
    var_39 = getentarray( "sentry_technical", "script_noteworthy" );
    common_scripts\utility::array_thread( var_39, maps\_utility::add_spawn_function, maps\af_chase_code::_id_CE6A );
    var_40 = getentarray( "explode_barrels_in_radius", "targetname" );
    common_scripts\utility::array_thread( var_40, maps\af_chase_code::_id_B8BE );
    thread _id_B593();
    thread _id_B0E6();
    setsaveddvar( "r_reactiveMotionVehicleEnabled", 1 );
    setsaveddvar( "r_reactiveMotionVehicleRadius", 200.0 );
    setsaveddvar( "r_reactiveMotionVehicleZOffset", -60.0 );
    setsaveddvar( "r_reactiveMotionEffectorStrengthScale", 1000 );
    maps\af_chase_code::_id_AFB0();
    var_41 = getent( "heli_spawner", "targetname" );
    var_41 maps\_utility::add_spawn_function( ::add_target_name );
    thread maps\af_chase_code::lod_scale_setup();
}

_id_D1E4()
{
    common_scripts\utility::flag_init( "no_more_physics_effects" );
    common_scripts\utility::flag_init( "player_in_open" );
    common_scripts\utility::flag_init( "zodiac_catchup" );
    common_scripts\utility::flag_init( "player_in_sight_of_boarding" );
    common_scripts\utility::flag_init( "player_on_boat" );
    common_scripts\utility::flag_init( "exit_caves" );
    common_scripts\utility::flag_init( "enemy_zodiacs_wipe_out" );
    common_scripts\utility::flag_init( "on_river" );
    common_scripts\utility::flag_init( "zodiac_boarding" );
    common_scripts\utility::flag_init( "enemy_heli_takes_off" );
    common_scripts\utility::flag_init( "price_anim_on_boat" );
    common_scripts\utility::flag_init( "rapids_head_bobbing" );
    common_scripts\utility::flag_init( "heli_firing" );
    common_scripts\utility::flag_init( "player_zodiac_on_ground" );
    common_scripts\utility::flag_init( "price_is_soaked" );
    common_scripts\utility::flag_init( "shepherd_got_away" );
    common_scripts\utility::flag_init( "startPoint_boatDrive" );
    _id_B485();

    foreach ( var_1 in level.ai_array )
        common_scripts\utility::flag_init( "despawn_" + var_1 );

    setsaveddvar( "vehNotifyHitEntityWithVehContactEvent", 1 );
    level.player maps\_utility::ent_flag_init( "disable_shooting" );
    level.player maps\_utility::ent_flag_init( "zodiac_aim_helicopter" );
}

empty()
{

}

add_target_name()
{
    self.targetname = "heli_no_turret";
}

_id_B485()
{
    level.ai_array = [ "ai_group_01", "ai_group_02", "ai_group_03", "ai_group_04", "ai_group_05", "ai_group_06", "ai_group_07", "ai_group_08", "ai_group_09", "ai_group_10", "ai_group_11" ];
}

_id_B0E6()
{
    foreach ( var_1 in level.ai_array )
    {
        maps\_utility::array_spawn_function_noteworthy( var_1, ::_id_B25F, "despawn_" + var_1 );
        maps\_utility::array_spawn_function_noteworthy( var_1, ::_id_D1F9, "despawn_" + var_1 );
    }
}

_id_B25F( var_0 )
{
    for ( var_1 = 1; var_1 <= level.ai_array.size; var_1++ )
    {
        if ( isdefined( self.spawner.targetname ) && self.spawner.targetname == "H2_New_AI_" + var_1 )
        {
            self.accuracy = 0;
            self.baseaccuracy = 0;
            break;
        }
    }

    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self ) && isalive( self ) )
        self delete();
}

_id_D1F9( var_0 )
{
    self endon( var_0 );

    for (;;)
    {
        self waittill( "veh_contact", var_1 );

        if ( !isdefined( level.player.vehicle ) )
            break;

        if ( var_1 == level.player || var_1 == level.player.vehicle )
        {
            if ( !_func_2A5( self ) )
            {
                self.skipdeathanim = 1;
                self kill();
                return;
            }

            var_2 = vectornormalize( self.origin - var_1.origin );
            var_2 *= 8000;
            self startragdollfromimpact( "torso_lower", var_2 );
            break;
        }
    }
}

_id_C663()
{
    level endon( "stop_music_at_splash" );
    musicstop( 0.4 );
    wait 1.5;
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_0 endon( "death" );
    level._id_AF65 = var_0;

    for (;;)
    {
        var_0 playsound( "mus_af_chase_startinboat", "sounddone" );
        var_0 waittill( "sounddone" );
    }
}

_id_B972()
{
    soundscripts\_snd::snd_message( "start_default_checkpoint" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "players_boat" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "enemy_chase_boat" );
    maps\af_chase_code::_id_C039();
    thread maps\af_chase_code::_id_CE0C();
    thread maps\af_chase_code::_id_D00F();
    thread maps\af_chase_code::_id_B17B( 15 );
    objective_onentity( maps\_utility::obj( "pursue" ), var_1 );
    thread maps\_introscreen::_id_AC9D();
    var_1 thread maps\af_chase_aud::_id_B169();
    thread maps\_hud_util::fade_in( 0.75 );
    wait 3;
    common_scripts\utility::flag_wait( "player_on_boat" );
    maps\_friendlyfire::turnoff();
    maps\af_chase_aud::_id_C66D();
    thread maps\af_chase_code::_id_B17B( 10, 30 );
}

_id_A99C()
{
    soundscripts\_snd::snd_message( "start_boatdrive_begin_checkpoint" );
    maps\af_chase_code::_id_AB45( "enemy_chase_boat", "enemy_boat_pos_boatdrive_begin" );
    maps\af_chase_code::_id_C039();
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "players_boat" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "enemy_chase_boat" );
    waittillframeend;
    level.player playerlinktoblend( var_0, "tag_player", 0.2, 0.1, 0.1 );
    var_0 useby( level.player );
    level.player.drivingvehicle = var_0;
    thread maps\af_chase_code::_id_D00F();
    _id_CFE7();
}

_id_B21A()
{
    common_scripts\utility::flag_set( "startPoint_boatDrive" );
    soundscripts\_snd::snd_message( "start_debug_boatdrive_checkpoint" );
    maps\af_chase_code::_id_C039();
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "players_boat" );
    level.player playerlinktoblend( var_0, "tag_player", 0.2, 0.1, 0.1 );
    var_0 useby( level.player );
    level.player.drivingvehicle = var_0;
    common_scripts\utility::array_thread( getentarray( "trigger_multiple", "code_classname" ), common_scripts\utility::trigger_off );
}

_id_BA4A()
{
    soundscripts\_snd::snd_message( "start_boatdrive_lake_mid_checkpoint" );
    maps\af_chase_code::_id_AB45( "enemy_chase_boat", "enemy_boat_pos_mid_lake" );
    maps\af_chase_code::_id_C039();
    common_scripts\utility::flag_set( "exit_caves" );
    var_0 = getent( "players_boat", "targetname" );
    var_1 = common_scripts\utility::getstruct( "lake_mid_start_pose", "targetname" );
    var_0.origin = var_1.origin;
    var_0.angles = var_1.angles;
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname( "players_boat" );
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "enemy_chase_boat" );
    waittillframeend;
    level.player playerlinktoblend( var_2, "tag_player", 0.2, 0.1, 0.1 );
    var_2 useby( level.player );
    level.player.drivingvehicle = var_2;
    level.player.drivingvehicle _meth_85A2( 1 );
    var_2 vehicle_setspeedimmediate( 60, 90, 90 );
    thread maps\af_chase_code::_id_D00F();
    thread maps\af_chase_code::_id_CDF1( "river_current_start_boatdrive_lake" );
    _id_CFE7();
}

_id_D395()
{
    soundscripts\_snd::snd_message( "start_boatdrive_lake_checkpoint" );
    maps\af_chase_code::_id_AB45( "enemy_chase_boat", "enemy_boat_pos_lake" );
    maps\af_chase_code::_id_C039();
    var_0 = getent( "players_boat", "targetname" );
    var_1 = common_scripts\utility::getstruct( "lake_start_pose", "targetname" );
    var_0.origin = var_1.origin;
    var_0.angles = var_1.angles;
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname( "players_boat" );
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "enemy_chase_boat" );
    waittillframeend;
    level.player playerlinktoblend( var_2, "tag_player", 0.2, 0.1, 0.1 );
    var_2 useby( level.player );
    level.player.drivingvehicle = var_2;
    level.player.drivingvehicle _meth_85A2( 1 );
    var_2 vehicle_setspeedimmediate( 48, 90, 90 );
    thread maps\af_chase_code::_id_D00F();
    thread maps\af_chase_code::_id_CDF1( "river_current_start_boatdrive_lake" );
    _id_CFE7();
}

_id_C9EE()
{
    soundscripts\_snd::snd_message( "start_boatdrive_rapids_checkpoint" );
    maps\af_chase_code::_id_AB45( "enemy_chase_boat", "enemy_boat_pos_rapids" );
    maps\af_chase_code::_id_CD19( "seaknight_fly_over", "enemy_heli_pos_rapids" );
    maps\af_chase_code::_id_C039();
    common_scripts\utility::flag_set( "exit_caves" );
    var_0 = getent( "players_boat", "targetname" );
    var_1 = common_scripts\utility::getstruct( "rapids_start_position", "targetname" );
    var_0.origin = var_1.origin;
    var_0.angles = var_1.angles;
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname( "players_boat" );
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "enemy_chase_boat" );
    var_4 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "seaknight_fly_over" );
    waittillframeend;
    level.player playerlinktoblend( var_2, "tag_player", 0.2, 0.1, 0.1 );
    var_2 useby( level.player );
    level.player.drivingvehicle = var_2;
    level.player.drivingvehicle _meth_85A2( 1 );
    var_2 vehicle_setspeedimmediate( 78, 90, 90 );
    thread maps\af_chase_code::_id_D00F();
    thread maps\af_chase_code::_id_CDF1( "river_current_start_rapids" );
    _id_CFE7();
}

_id_B895()
{
    soundscripts\_snd::snd_message( "start_boatdrive_river_below_rapids_checkpoint" );
    maps\af_chase_code::_id_AB45( "enemy_chase_boat", "enemy_boat_pos_below_rapids" );
    maps\af_chase_code::_id_CD19( "seaknight_fly_over", "enemy_heli_pos_rapids" );
    maps\af_chase_code::_id_C039();
    common_scripts\utility::flag_set( "exit_caves" );
    common_scripts\utility::flag_set( "on_river" );
    var_0 = getent( "players_boat", "targetname" );
    var_1 = common_scripts\utility::getstruct( "below_rapids_start_position", "targetname" );
    var_0.origin = var_1.origin;
    var_0.angles = var_1.angles;
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname( "players_boat" );
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "enemy_chase_boat" );
    waittillframeend;
    level.player playerlinktoblend( var_2, "tag_player", 0.2, 0.1, 0.1 );
    var_2 useby( level.player );
    level.player.drivingvehicle = var_2;
    level.player.drivingvehicle _meth_85A2( 1 );
    var_2 vehicle_setspeedimmediate( 78, 90, 90 );
    thread maps\af_chase_code::_id_D00F();
    thread maps\af_chase_code::_id_CDF1( "river_current_start_rapids" );
    _id_CFE7();
}

_id_C05C()
{
    soundscripts\_snd::snd_message( "start_boatdrive_end_checkpoint" );
    maps\af_chase_code::_id_AB45( "enemy_chase_boat", "enemy_boat_pos_end" );
    var_0 = getent( "seaknight_pickup_boat_spot", "script_noteworthy" );
    thread maps\af_chase_code::_id_BE9D();
    maps\af_chase_code::_id_C039();
    common_scripts\utility::flag_set( "exit_caves" );
    common_scripts\utility::flag_set( "enemy_zodiacs_wipe_out" );
    var_1 = getent( "players_boat", "targetname" );
    var_2 = common_scripts\utility::getstruct( "end_start_position", "targetname" );
    var_1.origin = var_2.origin;
    var_1.angles = var_2.angles;
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname( "players_boat" );
    var_4 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "enemy_chase_boat" );
    var_5 = maps\_vehicle::spawn_vehicle_from_targetname( "enemy_pickup_heli" );
    waittillframeend;
    level.player playerlinktoblend( var_3, "tag_player", 0.2, 0.1, 0.1 );
    var_3 useby( level.player );
    level.player.drivingvehicle = var_3;
    var_3 vehicle_setspeedimmediate( 57, 90, 90 );
    thread maps\af_chase_code::_id_D00F();
    thread maps\af_chase_code::_id_CDF1( "river_current_start_boatdrive_end" );
    _id_CFE7();
}

_id_D0EF()
{
    soundscripts\_snd::snd_message( "start_boatdrive_nofail_checkpoint" );
    setdvar( "scr_zodiac_test", 1 );
    level.player enableinvulnerability();
    thread _id_B972();
}

_id_CD17()
{
    waittillframeend;

    switch ( level.start_point )
    {
        case "default":
        case "boatdrive_nofail":
        case "boatdrive_begin":
        case "boatdrive_lake":
        case "boatdrive_lake_mid":
        case "boatdrive_rapids":
        case "boatdrive_below_rapids":
        case "boatdrive_end":
        case "boatdrive_end_test":
            objective_add( maps\_utility::obj( "pursue" ), "current", &"AF_CHASE_PURSUE" );
            objective_onentity( maps\_utility::obj( "pursue" ), level._id_BD76, ( 0.0, 0.0, 110.0 ) );
            common_scripts\utility::flag_wait( "player_in_sight_of_boarding" );
            setsaveddvar( "objectiveHide", 1 );
            common_scripts\utility::flag_wait( "price_fired_all_his_shots_at_heli" );
            objective_state( maps\_utility::obj( "pursue" ), "done" );
        case "end":
        case "crawl":
        case "kill":
        case "debug_boatdrive":
        case "wakeup":
        case "wakefast":
        case "turnbuckle":
        case "gloat":
        case "wounded":
        case "pullout":
        case "gun_drop":
        case "gun_kick":
        case "knife_fight":
        case "price_wakeup":
        case "knife_moment":
        case "walkoff":
        case "scene_fight_loop_B":
        case "scene_fight_loop_C":
        case "scene_fight_loop_D2":
        case "scene_fight_loop_D3":
        case "scene_fight_loop_E":
        case "on_foot_art_tweak":
            thread maps\af_chase_knife_fight::_id_BFCD();
            break;
        default:
    }
}

_id_AEB6()
{
    level.scr_radio["afchase_shp_stillincaves"] = "afchase_shp_stillincaves";
    level.scr_radio["afchase_shp_observe"] = "afchase_shp_observe";
    level.scr_radio["afchase_shp_uavsupport"] = "afchase_shp_uavsupport";
    wait 1;
    common_scripts\utility::flag_wait( "player_on_boat" );
    wait 10;
    level.player maps\_utility::radio_dialogue( "afchase_shp_stillincaves" );
    wait 10;
    level.player maps\_utility::radio_dialogue( "afchase_shp_observe" );
    common_scripts\utility::flag_wait( "exit_caves" );
    wait 4;
    level.player maps\_utility::radio_dialogue( "afchase_shp_uavsupport" );
}

_id_AC5A()
{
    waittillframeend;
    var_0 = level.start_point;

    if ( maps\_utility::is_default_start() )
        return;

    if ( var_0 == "boatdrive_nofail" )
        return;

    if ( var_0 == "boatdrive_begin" )
        return;

    if ( var_0 == "boatdrive_lake" )
        return;

    if ( var_0 == "boatdrive_lake_mid" )
        return;

    if ( var_0 == "boatdrive_rapids" )
        return;

    if ( var_0 == "boatdrive_below_rapids" )
        return;

    maps\_utility::remove_global_spawn_function( "axis", maps\af_chase_code::_id_B6E4 );
    maps\_utility::remove_global_spawn_function( "axis", maps\af_chase_code::_id_B422 );
    common_scripts\utility::flag_set( "stop_boat_dialogue" );

    if ( var_0 == "boatdrive_end" )
        return;

    if ( var_0 == "boatdrive_end_test" )
        return;

    thread maps\af_chase_knife_fight::_id_CEFB();
}

_id_B593()
{
    switch ( level.start_point )
    {
        case "default":
        case "boatdrive_nofail":
        case "boatdrive_begin":
        case "boatdrive_lake":
        case "boatdrive_lake_mid":
        case "boatdrive_rapids":
        case "boatdrive_below_rapids":
        case "boatdrive_end":
        case "debug_boatdrive":
            var_0 = maps\_utility::musiclength( "mus_af_chase_startinboat" );
            maps\_utility::music_loop( "mus_af_chase_startinboat", var_0 );
            common_scripts\utility::flag_wait( "test_boat_is_on_spline" );
            level notify( "stop_music" );
            musicstop( 4 );
            level.player thread maps\_utility::play_sound_on_entity( "mus_af_chase_waterfall" );
        case "wakeup":
        case "wakefast":
        case "turnbuckle":
        case "gloat":
            common_scripts\utility::flag_wait( "af_chase_final_fight" );
        case "gun_drop":
            maps\_utility::musicplaywrapper( "mus_af_chase_final_fight" );
        case "crawl":
        case "kill":
        case "wounded":
        case "pullout":
        case "gun_kick":
        case "price_wakeup":
        case "walkoff":
            common_scripts\utility::flag_wait( "af_chase_final_ending" );
            maps\_utility::musicplaywrapper( "mus_af_chase_final_ending" );
            break;
        default:
            break;
    }
}

_id_CFE7()
{
    level.price _meth_859D();
    level.price _meth_8583();
}

seaknight_fly_over_model()
{
    self setmodel( "h2_vehicle_pavelow_low" );
}
