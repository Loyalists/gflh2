// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\invasion_mission_select_cam::_id_C490();
        return;
    }

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    if ( maps\invasion_beautiful_corner::_id_C662() )
        return;

    level.visionthermaldefault = "invasion_thermal_scope";
    level._id_C60F = 4000;
    level._id_D05B = undefined;
    level._id_B34F = 400;
    level.attackhelirange = 7000;
    level._id_C589 = [];
    level._id_B964 = 90000;
    level.cosine["90"] = cos( 90 );
    level.cosine["60"] = cos( 60 );
    level.cosine["25"] = cos( 25 );
    level._id_C714 = 0;
    level.dropped = 0;
    level._id_BACA = 0;
    level._id_BA7A = 3500;
    level._id_C1C1 = 1;
    level._id_B429 = "body_us_army_shotgun";
    level._id_C073 = "head_us_army_a";
    precacheitem( "remote_missile_invasion" );
    level._id_B65C = 1;
    precachestring( &"INVASION_LINE1" );
    precachestring( &"INVASION_LINE2" );
    precachestring( &"INVASION_LINE3" );
    precachestring( &"INVASION_LINE4" );
    precachestring( &"INVASION_LINE5" );
    precachestring( &"INVASION_DRONE_PICKUP" );
    precachestring( &"INVASION_DRONE_PICKUP_PC" );
    _func_260( "h2_invasion" );
    _func_260( "h2_invasion_nvg_laser" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "h1_ac130_screen_overlay" );
    precacheshader( "h1_ac130_distort" );
    level._id_C830 = [];
    level._id_C830[0] = "weapon_scar_h_clip";
    level._id_C830[1] = "weapon_ak47_clip";
    level._id_C830[2] = "weapon_ump45_clip";
    level._id_C830[3] = "weapon_fn2000_clip";
    level._id_C830[4] = "weapon_mp5_clip";
    level._id_C830[5] = "weapon_saw_clip";
    level._id_C830[6] = "weapon_mp44_clip";
    level._id_C830[7] = "weapon_m16_clip";
    maps\_vehicle::build_light_override( "script_vehicle_btr80", "spotlight", "TAG_FRONT_LIGHT_RIGHT", "fx/misc/spotlight_btr80_daytime_invasion", "spotlight", 0.2 );
    maps\_vehicle::build_light_override( "script_vehicle_btr80", "spotlight_turret", "TAG_TURRET_LIGHT", "fx/misc/spotlight_btr80_daytime_invasion", "spotlight_turret", 0.0 );
    _id_D59F::main( "vehicle_mi-28_flying", "mi28", "script_vehicle_mi28" );
    _id_D04F::main( "vehicle_ucav", "ucav", "script_vehicle_ucav" );
    _id_D4C5::main();
    _id_C75F::main();
    _id_B7D3::main();
    maps\invasion_lighting::main();
    thread _id_D179();
    precacheitem( "smoke_grenade_american" );
    precacheitem( "remote_missile_not_player_invasion" );
    precachemodel( "h1_weapon_stinger_obj" );
    precachemodel( "weapon_uav_control_unit_obj" );
    precacheitem( "flash_grenade" );
    precachemodel( "h2_arc_foliage_tree_oak_01" );
    precachemodel( "h2_foliage_tree_oak_1_burnt" );
    precacheitem( "zippy_rockets" );
    precacheitem( "stinger_speedy" );
    precacherumble( "tank_rumble" );
    precachemodel( "h1_mwr_com_widescreen_monitor_des" );
    precachemodel( "com_widescreen_monitor_on_1_des" );
    precachemodel( "com_widescreen_monitor_on_2_des" );
    precachemodel( "ma_flatscreen_tv_wallmount_broken_02" );

    precachemodel( "h2_gfl_ump9_viewbody" );
    precachemodel( "h2_gfl_ump9_viewhands" );
    precachemodel( "h2_gfl_ump9_viewhands_player" );

    _id_C21D();
    maps\_utility::default_start( ::_id_C690 );
    maps\_utility::add_start( "latvee", ::_id_C690 );
    maps\_utility::add_start( "yards", ::_id_B774 );
    maps\_utility::add_start( "bmp", ::_id_AFC1 );
    maps\_utility::add_start( "pizza", ::_id_BA14 );
    maps\_utility::add_start( "gas_station", ::_id_B773 );
    maps\_utility::add_start( "crash", ::start_crash );
    maps\_utility::add_start( "nates_roof", ::_id_BDB2 );
    maps\_utility::add_start( "attack_diner", ::_id_D0B0 );
    maps\_utility::add_start( "defend_diner", ::_id_CDCC );
    maps\_utility::add_start( "diner", ::_id_D078 );
    maps\_utility::add_start( "burgertown", ::_id_B7A1 );
    maps\_utility::add_start( "vip_escort", ::_id_D22F );
    maps\_utility::add_start( "defend_BT", ::_id_B432 );
    maps\_utility::add_start( "helis", ::_id_CB91 );
    maps\_utility::add_start( "convoy", ::_id_AF49 );
    maps\_utility::add_start( "start_btr80_smash", ::_id_AC41 );
    vehicle_scripts\_attack_heli::preload();
    maps\_drone_ai::init();
    maps\invasion_anim::_id_A902();
    maps\_load::main();
    _id_AE35::_id_ACCD();
    maps\invasion_aud::main();
    _id_D2A4::main();
    common_scripts\utility::array_thread( getvehiclenodearray( "plane_sound", "script_noteworthy" ), vehicle_scripts\_mig29::plane_sound_node );
    _id_B564::init();
    level._id_CAAA = 1;
    level._id_A91C = "invasion_uav";
    level._id_A9C5 = "invasion_uav";
    _id_C630::init();
    thread _id_CE0E();
    thread _id_B08C();
    thread _id_D0E4();
    level._id_B67E = 1500;
    level._id_BA7A = 5000;

    if ( level.start_point == "no_game" )
        return;

    thread _id_BACA();
    maps\_compass::setupminimap( "compass_map_invasion" );
    var_0 = getent( "roof_parachute_landing_guy_yards", "targetname" );
    var_1 = getent( "latvee_ride_roof_landing", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\invasion_anim::_id_C63C );
    var_1 maps\_utility::add_spawn_function( maps\invasion_anim::_id_C63C, "latvee_guy" );
    common_scripts\utility::array_thread( getentarray( "nova_tv", "targetname" ), ::_id_C150, "h1_mwr_com_widescreen_monitor_des", "tv_explosion", ( 0.0, 0.0, -15.0 ), 0, 1 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct1", "targetname" ), ::_id_C150, "h1_mwr_com_widescreen_monitor_des", "tv_explosion", ( 0.0, 0.0, 25.0 ), 1, 1 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_on1", "targetname" ), ::_id_C150, "com_widescreen_monitor_on_1_des", "tv_explosion", ( 0.0, 0.0, 25.0 ), 1, 1 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_2_on", "targetname" ), ::_id_C150, "com_widescreen_monitor_on_2_des", "tv_explosion", ( 0.0, 0.0, 30.0 ), 1, 1 );
    common_scripts\utility::array_thread( getentarray( "commander", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C3CE );
    common_scripts\utility::array_thread( getentarray( "taco", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_A8B0 );
    common_scripts\utility::array_thread( getentarray( "worm", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_B4AC );
    common_scripts\utility::array_thread( getentarray( "alley_nates_attackers", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_D357 );
    common_scripts\utility::array_thread( getentarray( "wells", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_AD65 );
    common_scripts\utility::array_thread( getentarray( "BT_nates_attackers", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BC23 );
    var_2 = getentarray( "wounded_carry_attackers", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_BBDA );
    var_3 = getentarray( "BT_enemy_defenders", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_C214 );
    var_4 = getentarray( "nates_defenders", "script_noteworthy" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::_id_B612 );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::_id_C368, "nates_defenders" );
    var_5 = getentarray( "president", "script_noteworthy" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::_id_ACBC );
    var_6 = getentarray( "truck_group_enemies", "script_noteworthy" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_A989 );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_A942 );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_D039 );
    var_7 = getentarray( "bank_nates_attackers", "targetname" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, ::_id_BAB2 );
    var_8 = getentarray( "diner_enemy_defenders_mobile", "script_noteworthy" );
    common_scripts\utility::array_thread( var_8, maps\_utility::add_spawn_function, ::_id_BD2F );
    var_9 = getentarray( "gas_station_truck_guys", "targetname" );
    common_scripts\utility::array_thread( var_9, maps\_utility::add_spawn_function, ::_id_C368, "gas_station_truck_enemies" );
    common_scripts\utility::array_thread( getentarray( "tangled_parachute_guy", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\invasion_anim::_id_AB60 );
    maps\_utility::add_global_spawn_function( "axis", ::_id_B127 );
    maps\_utility::add_global_spawn_function( "axis", ::_id_D2CF );
    var_10 = getent( "predator_drone_control", "targetname" );
    var_10 hide();
    common_scripts\utility::array_thread( getentarray( "animated_parachute", "targetname" ), ::animate_hanging_parachute );
    thread _id_C396();
    thread _id_C612();
    var_11 = getentarray( "paradrop_plane_trigger", "targetname" );
    common_scripts\utility::array_thread( var_11, ::_id_CD34 );
    thread _id_B1F5();
    level._id_C176 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "uav" );
    level._id_C176 playloopsound( "uav_engine_loop" );
    level.uavrig = spawn( "script_model", level._id_C176.origin );
    level.uavrig setmodel( "tag_origin" );
    thread _id_C09D();
    thread change_remote_missile_zfar();
    level._id_AB47 = getent( "obj_sentry", "script_noteworthy" );
    level._id_AB47 thread _id_B9AC();
    thread _id_BA25();
    createthreatbiasgroup( "nates_defenders" );
    createthreatbiasgroup( "gas_station_truck_enemies" );
    createthreatbiasgroup( "players_group" );
    level.player setthreatbiasgroup( "players_group" );
    maps\_utility::ignoreeachother( "nates_defenders", "gas_station_truck_enemies" );
    var_12 = getentarray( "friendly_redshirt_rpg", "script_noteworthy" );
    common_scripts\utility::array_thread( var_12, maps\_utility::add_spawn_function, ::_id_C80E );
    maps\_utility::add_hint_string( "hint_predator_drone_vs_bmps_4", &"HELLFIRE_USE_DRONE", ::_id_B5E3, undefined, "medium_background" );
    maps\_utility::add_hint_string( "hint_predator_drone_vs_bmps_2", &"HELLFIRE_USE_DRONE_2", ::_id_B5E3, undefined, "medium_background" );
    maps\_utility::add_control_based_hint_strings( "hint_steer_drone", &"SCRIPT_PLATFORM_STEER_DRONE", ::_id_B34D, &"SCRIPT_PLATFORM_STEER_DRONE_PC", undefined, "small_background" );
    maps\_utility::add_hint_string( "hint_throw_smoke", &"INVASION_THROW_SMOKE", ::_id_C266, undefined, "medium_background" );
    maps\_utility::add_hint_string( "hint_get_smoke", &"INVASION_GET_SMOKE", ::_id_C15D );
    maps\_utility::add_hint_string( "hint_smoke_too_far", &"INVASION_SMOKE_TOO_FAR", ::_id_B4D1, undefined, "medium_background" );
    maps\_utility::add_hint_string( "hint_ads_with_stinger", &"INVASION_ADS_WITH_STINGER", ::_id_CE85, undefined, "medium_background" );
    maps\_utility::add_hint_string( "hint_toggle_ads_with_stinger", &"INVASION_TOGGLE_ADS_WITH_STINGER", ::_id_CE85, undefined, "medium_background" );
    waittillframeend;
    level.smokegrenadesarray = [];
    level.smoke_normal = common_scripts\utility::getfx( "smoke_grenade_american" );
    level.smoke_low = common_scripts\utility::getfx( "smoke_grenade_low" );
    level.smoke_dud = common_scripts\utility::getfx( "smoke_grenade_dud" );
    level.player thread smoke_grenade_listener();
    thread staticmodelgroup_init();
    common_scripts\utility::flag_set( "flag_staticmodelgroup_5" );
    common_scripts\utility::flag_set( "flag_staticmodelgroup_7" );
    common_scripts\utility::flag_set( "flag_staticmodelgroup_8" );
    common_scripts\utility::flag_set( "flag_staticmodelgroup_10" );
    common_scripts\utility::flag_set( "player_outside_nates_killzone" );
    thread hide_destructible_vehicles( "flag_destructible_vehicles", "volume_destructible_vehicles" );
    thread hide_destructible_vehicles( "flag_vehicle_road", "volume_vehicle_road", 1 );
    thread monitor_nates_portal();
    setsaveddvar( "ai_busyEventDistDeath", "400" );
    setsaveddvar( "ai_busyEventDistGunShot", "800" );
    setsaveddvar( "r_useLightGridDefaultModelLightingLookup", "1" );
    setsaveddvar( "r_lightGridDefaultModelLightingLookup", " 2550 8000 2375 " );
    setsaveddvar( "r_useLightGridDefaultModelLightingSmoothing", "1" );
    thread _id_D516();
    thread _id_D13A();
    thread start_hides_map();
    var_13 = getent( "destructible_notify", "script_noteworthy" );
    var_13 thread exploding_car();
    thread show_tree();
    setsaveddvar( "ai_perf_disableStairsSteepMetrics", "1" );
    thread monitor_sentry_badplace();
    setsaveddvar( "missileRemoteSteerPitchRange", "9 87" );

    if ( maps\_utility::is_default_start() )
        level._id_A87F.greenberet_disabled = 1;
}

_id_C21D()
{
    common_scripts\utility::flag_init( "flag_portal_beginning_east_wall" );
    common_scripts\utility::flag_init( "flag_portal_beginning_wall" );
    common_scripts\utility::flag_init( "flag_portal_suburban_east_wall" );
    common_scripts\utility::flag_init( "flag_portal_beginning_south_wall" );
    common_scripts\utility::flag_init( "flag_portal_road_east_wall" );
    common_scripts\utility::flag_init( "notetrack_gimmesitrep" );
    common_scripts\utility::flag_init( "notetrack_status" );
    common_scripts\utility::flag_init( "notetrack_whatelse" );
    common_scripts\utility::flag_init( "notetrack_sentrygunsouth" );
    common_scripts\utility::flag_init( "notetrack_checkout" );
    common_scripts\utility::flag_init( "notetrack_meatlocker" );
    common_scripts\utility::flag_init( "notetrack_unconscious" );
    common_scripts\utility::flag_init( "notetrack_supplydrop" );
    common_scripts\utility::flag_init( "house_destroyer_moving_back" );
    common_scripts\utility::flag_init( "btr_backed_away" );
    common_scripts\utility::flag_init( "btr_smoke_starting" );
    common_scripts\utility::flag_init( "btr_smoked" );
    common_scripts\utility::flag_init( "follow_foley" );
    common_scripts\utility::flag_init( "northside_roof" );
    common_scripts\utility::flag_init( "smoke_screen_starting" );
    common_scripts\utility::flag_init( "bmp_out_of_sight" );
    common_scripts\utility::flag_init( "player_goto_roof" );
    common_scripts\utility::flag_init( "wells_intro_done" );
    common_scripts\utility::flag_init( "truck_guys_retreat" );
    common_scripts\utility::flag_init( "diner_attack" );
    common_scripts\utility::flag_init( "time_to_go_get_UAV_control" );
    common_scripts\utility::flag_init( "time_to_clear_burgertown" );
    common_scripts\utility::flag_init( "time_to_destroy_bmps" );
    common_scripts\utility::flag_init( "taco_goes_to_roof" );
    common_scripts\utility::flag_init( "player_defended_burgertown" );
    common_scripts\utility::flag_init( "player_at_convoy" );
    common_scripts\utility::flag_init( "bmp_north_left_dead" );
    common_scripts\utility::flag_init( "bmp_north_mid_dead" );
    common_scripts\utility::flag_init( "move_president_to_prep" );
    common_scripts\utility::flag_init( "bmp1_spotted_player" );
    common_scripts\utility::flag_init( "bmp2_spotted_player" );
    common_scripts\utility::flag_init( "juggernaut_dead" );
    common_scripts\utility::flag_init( "nates_bomb_incoming" );
    common_scripts\utility::flag_init( "nates_bombed" );
    common_scripts\utility::flag_init( "bank_guys_retreat" );
    common_scripts\utility::flag_init( "back_door_attack_start" );
    common_scripts\utility::flag_init( "nates_after_bombing_setup_done" );
    common_scripts\utility::flag_init( "static_model_initialized" );
    common_scripts\utility::flag_init( "bmps_from_north_dead" );
    common_scripts\utility::flag_init( "player_in_pos_to_cover_vip" );
    common_scripts\utility::flag_init( "convoy_is_here" );
    common_scripts\utility::flag_init( "threw_semtex" );
    common_scripts\utility::flag_init( "threw_smoke" );
    common_scripts\utility::flag_init( "first_attack_heli_spawned" );
    common_scripts\utility::flag_init( "second_attack_heli_spawned" );
    common_scripts\utility::flag_init( "first_attack_heli_dead" );
    common_scripts\utility::flag_init( "second_attack_heli_dead" );
    common_scripts\utility::flag_init( "time_to_goto_convoy" );
    common_scripts\utility::flag_init( "bmp_has_spotted_player" );
    common_scripts\utility::flag_init( "diner_door_opened" );
    common_scripts\utility::flag_init( "obj_regroup_nates_bombed" );
    common_scripts\utility::flag_init( "playerStartConvoy" );
    common_scripts\utility::flag_init( "sentry_in_position" );
    common_scripts\utility::flag_init( "player_has_predator_drones" );
    common_scripts\utility::flag_init( "player_in_latvee" );
}

exploding_car()
{
    var_0 = getentarray( "exploding_car_spot", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2._id_B357 = var_2 getlightintensity();
        var_2 setlightintensity( 0 );
    }

    self waittill( "exploded" );
    common_scripts\_exploder::exploder( "burning_tree" );
    thread swap_burning_tree();
    thread _id_C75F::_id_B245();

    foreach ( var_2 in var_0 )
        var_2 setlightintensity( var_2._id_B357 );

    maps\_lights::_id_B532( "h2_flickering_intense_fire", common_scripts\utility::getstructarray( "exploding_car_spot_struct", "targetname" ) );
}

_id_D179()
{
    var_0 = getentarray( "nate_dest", "script_noteworthy" );
    var_1 = getent( "nate_dest_location", "targetname" );
    var_2 = getent( "nate_dest_start_location", "targetname" );
    var_3 = var_2.origin - var_1.origin;

    foreach ( var_5 in var_0 )
    {
        var_5.origin -= var_3;

        if ( isdefined( var_5.script_parameters ) && var_5.script_parameters == "switch_light_grid" )
            var_5 retargetscriptmodellighting( var_1 );
    }
}

start_hides_map()
{
    level endon( "gas_station_truck_spawned" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "hide_map" );
        setsaveddvar( "ui_hidemap", 1 );
        common_scripts\utility::flag_waitopen( "hide_map" );
        setsaveddvar( "ui_hidemap", 0 );
    }
}

_id_B9AC()
{
    wait 0.5;
    var_0 = spawn( "script_origin", self.origin );
    var_0.targetname = "fake_sentry_owner";
    self.owner = var_0;

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( isplayer( var_1 ) )
            break;
    }

    self.owner = var_1;
}

_id_C61B()
{
    maps\_vehicle::vehicle_lights_on( "spotlight spotlight_turret" );
}

_id_C690()
{
    soundscripts\_snd::snd_message( "start_latvee_checkpoint" );
    maps\invasion_lighting::_id_BB31( "latvee" );
    thread _id_A8C4();
}

_id_BC52()
{
    soundscripts\_snd::snd_message( "start_bmp_checkpoint" );
    var_0 = common_scripts\utility::getstruct( "start_yards", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    level._id_AE9F = 1;
}

_id_B774()
{
    soundscripts\_snd::snd_message( "start_yards_checkpoint" );
    maps\invasion_lighting::_id_BB31( "yards" );
    var_0 = common_scripts\utility::getstruct( "start_yards", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "secretservice_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "start_yards_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    thread _id_C8A0();
}

_id_AFC1()
{
    soundscripts\_snd::snd_message( "start_bmp_checkpoint" );
    maps\invasion_lighting::_id_BB31( "bmp" );
    var_0 = common_scripts\utility::getstruct( "start_bmp", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "secretservice_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "start_bmp_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    thread _id_C8DC();
}

_id_BA14()
{
    soundscripts\_snd::snd_message( "start_pizza_checkpoint" );
    maps\invasion_lighting::_id_BB31( "pizza" );
    var_0 = common_scripts\utility::getstruct( "start_pizza", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "secretservice_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "start_pizza_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    common_scripts\utility::flag_set( "spawn_nates_attackers_in_alley" );
    thread _id_C9B0();
    thread _id_C9A1();
}

_id_B773()
{
    soundscripts\_snd::snd_message( "start_gas_checkpoint" );
    maps\invasion_lighting::_id_BB31( "gas_station" );
    var_0 = common_scripts\utility::getstruct( "start_gas_station", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "secretservice_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "start_gas_station_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    maps\_utility::activate_trigger_with_targetname( "BT_attackers_trigger" );
    thread _id_CDEE();
}

start_crash()
{
    soundscripts\_snd::snd_message( "start_crash_checkpoint" );
    maps\invasion_lighting::_id_BB31( "crash" );
    var_0 = common_scripts\utility::getstruct( "start_crash", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "secretservice_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "start_crash_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    thread monitor_nates_roof_interior();
    thread spawn_president();
    level._id_BD7E maps\_utility::set_force_color( "g" );
    level._id_CE19 maps\_utility::set_force_color( "y" );
    maps\_utility::activate_trigger_with_targetname( "move_to_wells_intro" );
    common_scripts\utility::flag_set( "leaving_gas_station" );
    wait 1;
    thread _id_C3C5();
}

_id_BDB2()
{
    soundscripts\_snd::snd_message( "start_nates_roof_checkpoint" );
    maps\invasion_lighting::_id_BB31( "nates_roof" );
    var_0 = common_scripts\utility::getstruct( "start_nates_roof", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "secretservice_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "start_roof_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    common_scripts\utility::flag_set( "leaving_gas_station" );
    common_scripts\utility::flag_set( "crash_objective" );
    thread spawn_president();
    thread _id_CBC4();
    thread _id_B6CB();
    thread monitor_nates_roof_interior();
}

_id_AF1B()
{
    soundscripts\_snd::snd_message( "start_nates_roof_checkpoint" );
    var_0 = common_scripts\utility::getstruct( "start_nates_roof", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "secretservice_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "start_roof_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    common_scripts\utility::flag_set( "leaving_gas_station" );
    common_scripts\utility::flag_set( "sentry_in_position" );
    common_scripts\utility::flag_set( "crash_objective" );
    thread spawn_president();
    thread _id_CBC4();
    var_4 = getentarray( "magic_smoke_grenade", "targetname" );
    common_scripts\utility::array_thread( var_4, ::_id_B14C );
    thread _id_CAB9();
    thread _id_CF48();
}

_id_D0B0()
{
    soundscripts\_snd::snd_message( "start_attack_dinner_checkpoint" );
    maps\invasion_lighting::_id_BB31( "attack_diner" );
    var_0 = common_scripts\utility::getstruct( "start_nates_roof", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "secretservice_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "start_roof_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    common_scripts\utility::flag_set( "leaving_gas_station" );
    common_scripts\utility::flag_set( "crash_objective" );
    thread spawn_president();
    thread _id_CBC4();
    common_scripts\utility::flag_set( "sentry_in_position" );
    thread _id_CAB9();
    thread monitor_nates_roof_interior();
    wait 0.1;
    thread _id_D52A();
}

_id_AC41()
{
    soundscripts\_snd::snd_message( "start_btr80_smash_checkpoint" );
    maps\invasion_lighting::_id_BB31( "start_btr80_smash" );
    var_0 = common_scripts\utility::getstruct( "start_nates_roof", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "secretservice_friendly", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "start_roof_friendly", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1[var_3].origin = var_2[var_3].origin;
        var_1[var_3].angles = var_2[var_3].angles;
        var_1[var_3] maps\_utility::spawn_ai();
    }

    common_scripts\utility::flag_set( "leaving_gas_station" );
    common_scripts\utility::flag_set( "crash_objective" );
    thread spawn_president();
    thread _id_CBC4();
    level._id_AB47 kill();
    level._id_AC0A = 1;
    common_scripts\utility::flag_set( "sentry_in_position" );
    thread _id_CAB9();
    thread _id_D52A();
}

_id_CDCC()
{
    soundscripts\_snd::snd_message( "start_diner_defend_checkpoint" );
    maps\invasion_lighting::_id_BB31( "defend_diner" );
    var_0 = common_scripts\utility::getstruct( "start_diner", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getent( "taco", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "start_diner_taco", "targetname" );
    var_1.origin = var_2.origin;
    var_1.angles = var_2.angles;
    var_1 maps\_utility::spawn_ai();
    var_3 = getent( "commander", "script_noteworthy" );
    var_4 = common_scripts\utility::getstructarray( "start_roof_friendly", "targetname" );
    var_3.origin = var_4[0].origin;
    var_3.angles = var_4[0].angles;
    var_3 maps\_utility::spawn_ai();
    thread spawn_president();
    thread _id_CBC4();
    common_scripts\utility::flag_set( "leaving_gas_station" );
    common_scripts\utility::flag_set( "crash_objective" );
    common_scripts\utility::flag_set( "sentry_in_position" );
    thread _id_BA5B();
    level._id_AB47 kill();
    thread monitor_nates_roof_interior();
    wait 0.1;
    thread _id_B26F();
    thread _id_AF73();
}

_id_D078()
{
    soundscripts\_snd::snd_message( "start_diner_checkpoint" );
    common_scripts\utility::flag_init( "player_is_near_houses" );
    maps\invasion_lighting::_id_BB31( "diner" );
    var_0 = common_scripts\utility::getstruct( "start_diner", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getent( "taco", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "start_diner_taco", "targetname" );
    var_1.origin = var_2.origin;
    var_1.angles = var_2.angles;
    var_1 maps\_utility::spawn_ai();
    var_3 = getent( "commander", "script_noteworthy" );
    var_4 = common_scripts\utility::getstructarray( "start_roof_friendly", "targetname" );
    var_3.origin = var_4[0].origin;
    var_3.angles = var_4[0].angles;
    var_3 maps\_utility::spawn_ai();
    thread spawn_president();
    thread _id_CBC4();
    common_scripts\utility::flag_set( "crash_objective" );
    common_scripts\utility::flag_set( "sentry_in_position" );
    thread _id_BA5B();
    thread _id_B6B4();
    level._id_AB47 kill();
    common_scripts\utility::flag_set( "nates_bomb_incoming" );
    maps\_utility::activate_trigger_with_targetname( "burger_town_enemy_defenders_trigger" );
    thread _id_D0B6();
    thread _id_CC91();
}

_id_B7A1()
{
    soundscripts\_snd::snd_message( "start_bergertown_checkpoint" );
    maps\invasion_lighting::_id_BB31( "burgertown" );
    var_0 = common_scripts\utility::getstruct( "start_BT", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getent( "taco", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "start_BT_taco", "targetname" );
    var_1.origin = var_2.origin;
    var_1.angles = var_2.angles;
    var_1 maps\_utility::spawn_ai();
    var_3 = getent( "commander", "script_noteworthy" );
    var_4 = common_scripts\utility::getstructarray( "start_roof_friendly", "targetname" );
    var_3.origin = var_4[0].origin;
    var_3.angles = var_4[0].angles;
    var_3 maps\_utility::spawn_ai();
    thread spawn_president();
    thread _id_CBC4();
    common_scripts\utility::flag_set( "crash_objective" );
    common_scripts\utility::flag_set( "sentry_in_position" );
    thread _id_BA5B();
    common_scripts\utility::flag_set( "nates_bomb_incoming" );
    thread _id_B6B4();
    level._id_AB47 kill();
    _id_BD23();
    common_scripts\_exploder::exploder( 333 );
    thread _id_B198();
}

_id_D22F()
{
    soundscripts\_snd::snd_message( "start_vip_escort_checkpoint" );
    maps\invasion_lighting::_id_BB31( "vip_escort" );
    var_0 = common_scripts\utility::getstruct( "start_vip_escort", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getent( "taco", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "start_BT_taco", "targetname" );
    var_1.origin = var_2.origin;
    var_1.angles = var_2.angles;
    var_1 maps\_utility::spawn_ai();
    var_3 = getent( "commander", "script_noteworthy" );
    var_4 = common_scripts\utility::getstructarray( "start_roof_friendly", "targetname" );
    var_3.origin = var_4[0].origin;
    var_3.angles = var_4[0].angles;
    var_3 maps\_utility::spawn_ai();
    thread spawn_president();
    thread _id_CBC4();
    common_scripts\utility::flag_set( "crash_objective" );
    common_scripts\utility::flag_set( "sentry_in_position" );
    thread _id_BA5B();
    _id_BD23();
    common_scripts\_exploder::exploder( 333 );
    thread _id_CBEE();
    common_scripts\utility::flag_set( "taco_goes_to_roof" );
    var_5 = getnode( "wells_in_bushes", "targetname" );
    level._id_C9E1 setgoalnode( var_5 );
    common_scripts\utility::flag_set( "nates_bomb_incoming" );
    thread _id_B6B4();
    level._id_AB47 kill();
    thread _id_B091();
}

_id_B432()
{
    soundscripts\_snd::snd_message( "start_defend_BT_checkpoint" );
    maps\invasion_lighting::_id_BB31( "defend_BT" );
    var_0 = common_scripts\utility::getstruct( "start_BT", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getent( "taco", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "start_BT_taco", "targetname" );
    var_1.origin = var_2.origin;
    var_1.angles = var_2.angles;
    var_1 maps\_utility::spawn_ai();
    var_3 = getent( "commander", "script_noteworthy" );
    var_4 = getent( "president_in_burgertown_meat_locker", "targetname" );
    var_3.origin = var_4.origin;
    var_3.angles = var_4.angles;
    var_3 maps\_utility::spawn_ai();
    var_5 = getent( "president_BT_checkpoint", "script_noteworthy" );
    var_6 = getnode( "BT_node_vip", "targetname" );
    level.president = var_5 maps\_utility::spawn_ai();
    level.president _id_AE35::_id_CC94( var_6 );
    thread _id_AD04();
    common_scripts\utility::flag_set( "crash_objective" );
    common_scripts\utility::flag_set( "sentry_in_position" );
    thread _id_BA5B();
    _id_BD23();
    common_scripts\_exploder::exploder( 333 );
    thread _id_CBEE();
    common_scripts\utility::flag_set( "taco_goes_to_roof" );
    common_scripts\utility::flag_set( "nates_bomb_incoming" );
    thread _id_B6B4();
    level._id_AB47 kill();
    common_scripts\utility::flag_set( "president_in_BT_meat_locker" );
    thread _id_C375();
}

_id_CB91()
{
    soundscripts\_snd::snd_message( "start_helis_checkpoint" );
    maps\invasion_lighting::_id_BB31( "helis" );
    var_0 = common_scripts\utility::getstruct( "start_nates_roof", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getent( "taco", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "start_BT_taco", "targetname" );
    var_1.origin = var_2.origin;
    var_1.angles = var_2.angles;
    var_1 maps\_utility::spawn_ai();
    var_3 = getent( "commander", "script_noteworthy" );
    var_4 = getent( "president_in_burgertown_meat_locker", "targetname" );
    var_3.origin = var_4.origin;
    var_3.angles = var_4.angles;
    var_3 maps\_utility::spawn_ai();
    var_5 = getent( "president_BT_checkpoint", "script_noteworthy" );
    var_6 = getnode( "BT_node_vip", "targetname" );
    level.president = var_5 maps\_utility::spawn_ai();
    level.president _id_AE35::_id_CC94( var_6 );
    thread _id_AD04();
    common_scripts\utility::flag_set( "crash_objective" );
    common_scripts\utility::flag_set( "sentry_in_position" );
    thread _id_BA5B();
    _id_BD23();
    common_scripts\_exploder::exploder( 333 );
    thread _id_CBEE();
    common_scripts\utility::flag_set( "taco_goes_to_roof" );
    common_scripts\utility::flag_set( "nates_bomb_incoming" );
    thread _id_B6B4();
    level._id_AB47 kill();
    common_scripts\utility::flag_set( "president_in_BT_meat_locker" );
    level._id_CF68 = 3;
    common_scripts\utility::flag_set( "first_attack_heli_spawned" );
    thread _id_C375();
}

_id_AF49()
{
    soundscripts\_snd::snd_message( "start_convoy_checkpoint" );
    maps\invasion_lighting::_id_BB31( "convoy" );
    var_0 = common_scripts\utility::getstruct( "start_nates_roof", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getent( "commander", "script_noteworthy" );
    var_2 = getent( "president_in_burgertown_meat_locker", "targetname" );
    var_1.origin = var_2.origin;
    var_1.angles = var_2.angles;
    var_1 maps\_utility::spawn_ai();
    var_3 = getent( "president_BT_checkpoint", "script_noteworthy" );
    var_4 = getnode( "BT_node_vip", "targetname" );
    level.president = var_3 maps\_utility::spawn_ai();
    level.president _id_AE35::_id_CC94( var_4 );
    thread _id_AD04();
    common_scripts\utility::flag_set( "crash_objective" );
    common_scripts\utility::flag_set( "sentry_in_position" );
    _id_BD23();
    common_scripts\_exploder::exploder( 333 );
    common_scripts\utility::flag_set( "taco_goes_to_roof" );
    common_scripts\utility::flag_set( "nates_bomb_incoming" );
    thread _id_B6B4();
    level._id_AB47 kill();
    common_scripts\utility::flag_set( "president_in_BT_meat_locker" );
    thread _id_C243();
}

_id_B0B0()
{
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "actionSlotsHide", 1 );
    setsaveddvar( "hud_showStance", 0 );
    level.player freezecontrols( 1 );
    thread maps\_introscreen::introscreen_generic_black_fade_in( 5.3, 1 );
    var_0 = [];
    var_0[var_0.size] = &"INVASION_LINE1";
    var_0["date"] = &"INVASION_LINE2";
    var_0[var_0.size] = &"INVASION_LINE3";
    var_0[var_0.size] = &"INVASION_LINE4";
    var_0[var_0.size] = &"INVASION_LINE5";
    maps\_introscreen::introscreen_feed_lines( var_0 );
    wait 5;
    level.player setplayerangles( ( 0.0, 180.0, 0.0 ) );
    level.player freezecontrols( 0 );
    wait 1.8;
    level notify( "introscreen_complete" );
    wait 2;
    maps\_utility::autosave_by_name( "levelstart" );
}

_id_A8C4()
{
    level.vtmodel = "vehicle_laatpv_viewmodel";
    level.vttype = "latvee";
    level.vtclassname = "script_vehicle_laatpv_viewmodel";
    maps\_vehicle::build_radiusdamage( ( 0.0, 0.0, 53.0 ), 512, 90, 20, 0 );
    thread _id_B0B0();
    maps\_utility::battlechatter_off( "allies" );
    thread _id_BB48();
    thread maps\_utility::musicplaywrapper( "mus_invasion_intro" );
    common_scripts\utility::flag_set( "flag_portal_beginning_east_wall" );
    common_scripts\utility::flag_set( "flag_portal_beginning_wall" );
    common_scripts\utility::flag_set( "flag_portal_suburban_east_wall" );
    common_scripts\utility::flag_set( "flag_portal_beginning_south_wall" );
    common_scripts\utility::flag_set( "flag_portal_road_east_wall" );
    wait 2.5;
    var_0 = getent( "first_flight", "script_noteworthy" );
    var_0 notify( "trigger" );
    var_0 common_scripts\utility::trigger_off();
    wait 1.5;
    level.player disableweapons();
    level._id_C7B1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "latvee_front" );
    level._id_C7B1.dontunloadonend = 1;
    var_1 = spawn( "script_origin", level._id_C7B1 gettagorigin( "tag_guy1" ) + ( 0.0, 0.0, 1.0 ) );
    var_1.angles = level._id_C7B1 gettagangles( "tag_guy1" );
    var_1 linkto( level._id_C7B1, "tag_guy1" );
    var_2 = spawn( "script_origin", level._id_C7B1 gettagorigin( "tag_passenger" ) + ( 0.0, 0.0, 1.0 ) );
    var_2.angles = level._id_C7B1 gettagangles( "tag_passenger" );
    var_2 linkto( level._id_C7B1, "tag_passenger" );
    var_3 = getent( "shotgun", "script_noteworthy" );
    var_3 maps\_utility::add_spawn_function( maps\invasion_anim::_id_AB25, var_1 );
    var_4 = getent( "backseat_right", "script_noteworthy" );
    var_4 maps\_utility::add_spawn_function( maps\invasion_anim::_id_D0C7, var_2 );
    var_5 = getentarray( "latvee_blows_up_riders", "targetname" );
    common_scripts\utility::array_thread( var_5, maps\_utility::spawn_ai );
    level._id_CA77 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "latvee_player" );
    level._id_CA77.dontunloadonend = 1;
    level._id_CA77 thread maps\invasion_aud::_id_CA7A();
    level._id_CA77 thread maps\invasion_aud::_id_BE55( "scn_invasion_plr_laatpv_explode_01" );
    level._id_C7B1 thread maps\invasion_aud::_id_BE55( "scn_invasion_npc_laatpv_explode_01" );
    thread jeep_ride_intro_vehicle();
    thread jeep_ride_intro_team_members();
    thread jeep_ride_intro_player();
    thread jeep_ride_intro_unlink();
    thread jeep_ride_intro_cinematic();
    common_scripts\utility::flag_wait( "latvee_ride_roof_landing" );
    thread _id_B152();
    common_scripts\utility::flag_wait( "start_latvee_destroyer" );
    level._id_CE19 pushplayer( 1 );
    level._id_BD7E pushplayer( 1 );
    level._id_BBCC pushplayer( 1 );
    level._id_BBCC thread maps\_utility::magic_bullet_shield();
    level._id_D1BB = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "latvee_destroyer" );
    level._id_D1BB.veh_pathtype = "constrained";
    level._id_D1BB thread _id_C7A1();
    level._id_D1BB thread maps\invasion_aud::_id_CA7A();
    wait 2;
    level._id_CE19 thread maps\_utility::dialogue_queue( "inv_six_gotbmp" );
    level._id_CA77 vehicle_setspeed( 0, 10 );
    soundscripts\_snd::snd_message( "stop_plr_latvee_engine" );
    wait 1;
    maps\_utility::activate_trigger_with_targetname( "flee_latvee" );
    wait 1;
    level._id_CE19 pushplayer( 1 );
    level._id_BD7E pushplayer( 1 );
    level._id_BBCC pushplayer( 1 );
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior0" );
    thread _id_AEBE();
    wait 1;
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "actionSlotsHide", 0 );
    setsaveddvar( "hud_showStance", 1 );
    level._id_CE19 pushplayer( 1 );
    level._id_BD7E pushplayer( 1 );
    level._id_BBCC pushplayer( 1 );
    thread _id_C8A0();
}

jeep_ride_intro_cinematic()
{
    var_0 = _id_D397::_id_A97A( "jeep_ride_intro" );
    var_0 _id_D397::_id_BEA0( 24.0 ) _id_D397::_id_C491( 3.5, -1, 8.0, 8.0 ) _id_D397::_id_CCA7( level.player.m_player_rig1, "tag_dof" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 29.5 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 0.1 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.0, 0.0, 0.0, -7, 7, 2, -2 );
    var_0 _id_D397::_id_BEA0( 1.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.0, 0.0, 0.0, 70, 88, 17, 30 ) _id_D397::_id_A970( ::_meth_85AA, level.player, 90, -6, 0, 180 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_0 _id_D397::_id_BEA0( 21.5 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.0, 0.5, 0.5, -5, 35, 0.0, 0.0 );
    var_0 _id_D397::_id_BEA0( 24.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.5, 0.25, 0.25, 0.0, 0.0, 0.0, 0.0 );
    var_0 _id_D397::_id_BEA0( 0.15 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 24.0 ) _id_D397::_id_BAE4( 0 );
    var_1 = 0.075;
    var_2 = 2.0;
    var_3 = 10000;
    var_4 = level.player;
    var_5 = 26.5;

    for ( var_6 = 0.0; var_6 <= var_5; var_6 += 0.5 )
        var_0 _id_D397::_id_BEA0( var_6 ) _id_D397::_id_B85E( var_1, var_2, var_4, var_3 );

    var_0 _id_D397::_id_BEA0( 21.45 ) _id_D397::_id_B85E( 0.08, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 22.0 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 23.4 ) _id_D397::_id_B85E( 0.14, 1.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.25 );
    var_0 _id_D397::_id_BEA0( 24.15 ) _id_D397::_id_B85E( 0.08, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 24.85 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 26.55 ) _id_D397::_id_B85E( 0.1, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BC26();
}

jeep_ride_intro_team_members()
{
    level._id_BD7E = maps\_utility::spawn_script_noteworthy( "taco", 1 );
    level._id_CE19 = maps\_utility::spawn_script_noteworthy( "commander", 1 );
    level._id_BBCC = maps\_utility::spawn_script_noteworthy( "worm", 1 );
    var_0 = [ level._id_BD7E, level._id_CE19, level._id_BBCC ];
    level._id_CA77 maps\_anim::anim_first_frame( var_0, "invasion_intro_jeepride", "body_animate_jnt" );
    common_scripts\utility::array_call( var_0, ::linkto, level._id_CA77, "body_animate_jnt" );
    level._id_CA77 thread maps\_anim::anim_single( var_0, "invasion_intro_jeepride", "body_animate_jnt" );
    level._id_CA77 waittill( "jeep_ride_intro_unlink" );
    common_scripts\utility::array_call( var_0, ::unlink );
}

jeep_ride_intro_player()
{
    level.player enableinvulnerability();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    var_0 = maps\_utility::spawn_anim_model( "viewbody", level.player.origin, level.player.angles );
    level.player.m_player_rig1 = var_0;
    level._id_CA77 maps\_anim::anim_first_frame_solo( var_0, "invasion_intro_jeepride", "body_animate_jnt" );
    var_0 linkto( level._id_CA77, "body_animate_jnt" );
    maps\_utility::attach_player_current_weapon_to_rig( var_0 );
    level.player playerlinktodelta( var_0, "tag_player", 1.0, 0, 0, 0, 0 );
    level._id_CA77 thread maps\_anim::anim_single_solo( var_0, "invasion_intro_jeepride", "body_animate_jnt" );
    level._id_CA77 maps\_utility::add_wait( maps\_utility::waittill_msg, "jeep_ride_intro_unlink" );
    var_0 maps\_utility::add_call( ::unlink );
    thread maps\_utility::do_wait();
    var_1 = 0.5;
    var_2 = var_0 maps\_utility::getanim( "invasion_intro_jeepride" );
    wait(getanimlength( var_2 ) - var_1);
    var_3 = spawn( "script_origin", level._id_CA77 gettagorigin( "body_animate_jnt" ) );
    var_3.angles = level._id_CA77 gettagangles( "body_animate_jnt" );
    var_0 thread maps\_anim::_id_B695( "player_anim_height", var_2, 0.0, var_3 );
    wait(var_1);
    var_0 notify( "player_anim_height" );
    level.player unlink();
    var_0 delete();
    level._id_A87F.greenberet_disabled = undefined;
    thread _id_C0C3::weapons_specialfeatures( 1 );
    level.player enabledeathshield( 0 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player enableweapons();
}

jeep_ride_intro_unlink()
{
    while ( level._id_CA77.veh_speed == 0.0 )
        waitframe();

    while ( level._id_CA77.veh_speed > 0.0 )
        waitframe();

    level._id_CA77 notify( "jeep_ride_intro_unlink" );
}

_id_C8A0()
{
    maps\_utility::battlechatter_off( "allies" );
    var_0 = getent( "roof_parachute_landing_guy_yards", "targetname" );
    common_scripts\utility::flag_wait( "entering_yards" );
    maps\_utility::autosave_by_name( "yards" );

    if ( isalive( level._id_BBCC ) )
    {
        if ( isdefined( level._id_BBCC.magic_bullet_shield ) )
            level._id_BBCC thread maps\_utility::stop_magic_bullet_shield();
    }

    level._id_CE19 pushplayer( 0 );
    level._id_BD7E pushplayer( 0 );

    if ( isalive( level._id_BBCC ) )
        level._id_BBCC pushplayer( 0 );

    thread _id_D008();
    level._id_C866 = var_0 maps\_utility::spawn_ai();
    level._id_C866.ignoreme = 1;
    thread _id_CE52();
    thread _id_C8DC();
}

_id_C8DC()
{
    common_scripts\utility::flag_wait( "start_house_destroyer" );
    maps\_utility::autosave_by_name( "hd" );
    thread _id_C9B0();
    common_scripts\utility::flag_init( "house_destroyer_unloading" );
    level._id_AE47 = maps\_vehicle::spawn_vehicle_from_targetname( "house_destroyer" );
    level._id_AE47 thread _id_A828();
    thread _id_D0E3();
    common_scripts\utility::flag_wait( "got_visual_on_crash" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_viscrashsite" );
    maps\_utility::battlechatter_on( "allies" );
    thread _id_ADF7();
    thread _id_B268( "house_destroyer_unloading" );
    thread _id_CB1A();
    thread _id_B506();
    thread _id_AEC9();
    thread _id_C2E8();
    thread _id_C9A1();
}

_id_C9A1()
{
    thread _id_ABB8();
    common_scripts\utility::flag_set( "flag_staticmodelgroup_6" );
    common_scripts\utility::flag_wait( "gas_station_truck_spawned" );
    thread maps\_utility::set_ambient( "invasion_ext3" );
    thread _id_AF11();
    thread _id_B268( "leaving_gas_station" );
    setsaveddvar( "ai_perf_maximumPathfGenerationLookaheadAttempts", "1" );
    level.battlechattermaxcanseeperframe = 5;
    thread _id_CDEE();
}

_id_CDEE()
{
    common_scripts\utility::flag_wait( "leaving_gas_station" );
    thread h2_inv_footik_disable();
    thread animated_wires_taco();
    thread animate_nates_beams();
    thread monitor_nates_roof_interior();
    var_0 = getent( "burning_tree", "script_noteworthy" );
    var_0 notify( "stop_burning_tree" );
    level._id_D05B = "north";
    thread _id_BF50();
    thread _id_BFED();
    thread _id_D505();
    thread _id_BF03();
    thread _id_C3D2();
    thread spawn_president();

    if ( !isdefined( level._id_C9E1 ) )
    {
        var_1 = getent( "wells", "script_noteworthy" );
        var_1 maps\_utility::spawn_ai();
    }

    maps\_utility::activate_trigger_with_targetname( "advance_towards_nates" );
    common_scripts\utility::flag_wait( "goto_wells_intro" );
    thread _id_AAFE();
    thread _id_C3C5();
}

_id_C3C5()
{
    if ( !isdefined( level._id_C9E1 ) )
    {
        var_0 = getent( "wells", "script_noteworthy" );
        var_0 maps\_utility::spawn_ai();
    }

    thread _id_BAE0();
    level._id_BD7E maps\_utility::set_force_color( "g" );
    maps\_utility::activate_trigger_with_targetname( "move_to_wells_intro" );
    var_1 = getentarray( "bank_nates_attackers", "targetname" );

    foreach ( var_3 in var_1 )
        var_4 = var_3 maps\_utility::spawn_ai();

    common_scripts\utility::flag_wait( "crash_objective" );
    maps\_utility::autosave_by_name( "crash_site" );
    level._id_D05B = "north";
    thread _id_B537();
    thread _id_B6CB();
}

_id_BAE0()
{
    var_0 = common_scripts\utility::getstruct( "police_car_moment", "script_noteworthy" );
    badplace_cylinder( "police_car_moment", -1, var_0.origin, 600, 300, "axis" );
    var_0 thread maps\_anim::anim_generic_loop( level._id_C9E1, "invasion_vehicle_cover_dialogue_guy1_idle", "stop_invasion_vehicle_cover_dialogue_guy1_idle" );
    level._id_CE19 maps\_utility::disable_ai_color();
    var_0 maps\_anim::anim_generic_reach( level._id_CE19, "invasion_vehicle_cover_dialogue_guy2" );
    level._id_CE19.goalradius = 15;
    common_scripts\utility::flag_wait( "crash_objective" );

    while ( distance2dsquared( level._id_CE19.origin, level._id_CE19.goalpos ) > level._id_CE19.goalradius * level._id_CE19.goalradius )
        waitframe();

    level._id_CE19.goalradius = level.default_goalradius;
    thread _id_C975();
    var_0 notify( "stop_invasion_vehicle_cover_dialogue_guy1_idle" );
    var_0 thread maps\_anim::anim_generic( level._id_C9E1, "invasion_vehicle_cover_dialogue_guy1" );
    var_0 maps\_anim::anim_generic( level._id_CE19, "invasion_vehicle_cover_dialogue_guy2" );
    thread _id_A81F();
    badplace_delete( "police_car_moment" );
}

_id_C975()
{
    if ( common_scripts\utility::flag( "player_on_roof" ) )
        return;

    level endon( "player_on_roof" );
    thread maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_wait( "notetrack_gimmesitrep" );
    level._id_CE19 playsound( "inv_six_gimmesitrep" );
    common_scripts\utility::flag_wait( "notetrack_meatlocker" );
    level._id_C9E1 playsound( "inv_sgw_meatlocker" );
    common_scripts\utility::flag_wait( "notetrack_status" );
    level._id_CE19 playsound( "inv_six_status" );
    common_scripts\utility::flag_wait( "notetrack_unconscious" );
    level._id_C9E1 playsound( "inv_sgw_unconscious" );
    common_scripts\utility::flag_wait( "notetrack_whatelse" );
    level._id_CE19 playsound( "inv_six_whatelse" );
    common_scripts\utility::flag_wait( "notetrack_checkout" );
    thread _id_CC58();
    common_scripts\utility::flag_wait( "notetrack_supplydrop" );
    level._id_C9E1 playsound( "inv_sgw_supplydrop" );
    common_scripts\utility::flag_wait( "notetrack_sentrygunsouth" );
    level._id_CE19 playsound( "inv_six_sentrygunsouth" );
    wait 3;
    common_scripts\utility::flag_set( "player_goto_roof" );
    thread maps\_utility::battlechatter_on( "allies" );
    wait 12;
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_antitank" );
    level._id_C9E1 maps\_utility::dialogue_queue( "inv_sgw_allout" );
    wait 1;
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_rogerthat" );
    common_scripts\utility::flag_set( "wells_intro_done" );
}

_id_B6CB()
{
    thread _id_AD07();
    thread _id_C2AF();
    thread _id_CCBA();
    common_scripts\utility::flag_wait( "player_on_roof" );
    thread maps\_utility::battlechatter_on( "allies" );
    level._id_D05B = "south";
    var_0 = getent( "nates_roof_volume_south", "targetname" );
    var_1 = getaiarray( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_2 == 5 )
            break;

        var_1[var_2].goalheight = 80;
        var_1[var_2].goalradius = 500;
        var_1[var_2].fixednode = 0;
        var_1[var_2] setgoalpos( var_0.origin );
        var_1[var_2] setgoalvolume( var_0 );
    }

    setsaveddvar( "ai_pathReduceLookaheadBadplaceOnPathCreation", 1 );
    setsaveddvar( "ai_pathAlwaysCheckBadplace", 1 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2]._id_AA29 = var_1[var_2].coversearchinterval;
        var_1[var_2].coversearchinterval = 4000;
    }

    level._id_CE19.goalheight = 80;
    level._id_CE19.goalradius = 500;
    level._id_CE19.fixednode = 0;
    level._id_CE19 setgoalpos( var_0.origin );
    level._id_CE19 setgoalvolume( var_0 );
    level._id_BD7E.goalheight = 80;
    level._id_BD7E.goalradius = 500;
    level._id_BD7E.fixednode = 0;
    level._id_BD7E setgoalpos( var_0.origin );
    level._id_BD7E setgoalvolume( var_0 );
    thread safe_saving_roof();
    common_scripts\utility::flag_set( "bank_guys_retreat" );
    wait 3;
    var_3 = getaiarray( "axis" );

    foreach ( var_5 in var_3 )
        var_5 thread _id_ADDD();

    level._id_CBEA = 0;
    level._id_ACA2 = 0;
    level._id_D039 = 0;
    var_7 = thread maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "truck_group_left" );
    var_7.veh_pathtype = "constrained";
    var_7 thread maps\invasion_aud::_id_CA7A();
    wait 0.1;
    var_8 = thread maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "truck_group_right" );
    var_8.veh_pathtype = "constrained";
    var_8 thread maps\invasion_aud::_id_CA7A();
    var_9 = getentarray( "magic_smoke_grenade", "targetname" );
    common_scripts\utility::array_thread( var_9, ::_id_B14C );
    thread _id_C077();
    maps\_utility::radio_dialogue( "inv_six_headsupladies" );
    thread _id_CEDE();
    wait 1;

    while ( level._id_ACA2 > 5 )
        wait 1;

    maps\_utility::autosave_by_name( "trucks_to_north" );
    thread _id_CF48();
}

_id_CF48()
{
    level._id_D05B = "north";
    var_0 = getentarray( "magic_smoke_grenade_north", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_B14C );
    level._id_CBEA = 0;
    level._id_D039 = 0;
    var_1 = thread maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "truck_north_right" );
    var_1.veh_pathtype = "constrained";
    wait 0.1;
    var_2 = thread maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "truck_north_left" );
    var_2.veh_pathtype = "constrained";
    thread _id_A898();
    maps\_utility::radio_dialogue( "inv_tco_incomingnorth" );
    maps\_utility::radio_dialogue( "inv_six_rogerthat" );
    thread _id_B1A6();
    common_scripts\utility::flag_set( "northside_roof" );
    wait 6;
    maps\_utility::radio_dialogue( "inv_tco_contactnorth" );
    maps\_utility::radio_dialogue( "inv_six_contactsn" );
    maps\_utility::radio_dialogue( "inv_six_shiftfiren" );
    thread _id_CAB9();

    while ( level._id_ACA2 > 5 )
        wait 1;

    level._id_D05B = "west";
    common_scripts\utility::flag_set( "truck_guys_retreat" );
    wait 6;
    maps\_utility::autosave_by_name( "truck_retreat" );
    var_3 = getnodearray( "south_side_nodes", "targetname" );
    var_4 = 0;
    var_5 = getent( "nates_roof_volume_south", "targetname" );
    var_6 = getaiarray( "allies" );

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
    {
        if ( common_scripts\utility::cointoss() )
        {
            if ( var_4 >= var_3.size )
                break;

            var_6[var_7].fixednode = 0;
            var_6[var_7] setgoalnode( var_3[var_4] );
            var_6[var_7] setgoalvolume( var_5 );
            var_4++;
        }
    }

    maps\_utility::radio_dialogue( "inv_six_hadenough" );
    maps\_utility::radio_dialogue( "inv_six_sitreponraptor" );
    maps\_utility::radio_dialogue( "inv_tco_secureandstable" );
    maps\_utility::radio_dialogue( "inv_six_checkammo" );
    _id_B8CB();
    thread diner_door_clip();
    thread _id_D52A();
}

_id_D52A()
{
    level._id_D05B = "west";

    if ( isdefined( level._id_AC0A ) )
        thread _id_AC0A();

    thread _id_C3B3();
    thread _id_ACEC();
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2 cleargoalvolume();
        var_2.coversearchinterval = var_2._id_AA29;
    }

    thread _id_AA0F();
    var_4 = getnode( "taco_scopes_diner", "targetname" );

    if ( isdefined( var_4 ) )
        level._id_BD7E setgoalnode( var_4 );

    thread _id_ADC7();
    common_scripts\utility::flag_waitopen( "player_on_roof" );
    common_scripts\utility::flag_set( "diner_attack" );
    var_5 = _id_B26F();
    thread _id_B4F0();
    thread _id_D172();
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_inside_nates" );
    level maps\_utility::add_func( maps\_utility::autosave_by_name, "go_to_diner" );
    level thread maps\_utility::do_wait();
    thread _id_B39E();
    thread _id_AAA5();
    thread _id_AF73();
}

_id_AF73()
{
    common_scripts\utility::flag_wait( "player_has_predator_drones" );
    level._id_D05B = "east";
    thread _id_BCFE();
    maps\_utility::autosave_by_name( "has_drones" );
    maps\_utility::activate_trigger_with_targetname( "burger_town_enemy_defenders_trigger" );
    thread _id_D0B6();
    thread _id_BCD9();
    thread _id_C081();
    common_scripts\utility::flag_wait( "bmp_north_left_dead" );
    common_scripts\utility::flag_wait( "bmp_north_mid_dead" );
    thread _id_C3A6();
    thread _id_CC91();
    common_scripts\utility::flag_wait_either( "player_outside_nates_killzone", "move_president_to_prep" );
    wait 1;
    maps\_utility::autosave_by_name( "bmps_destroyed" );
}

_id_CC91()
{
    common_scripts\utility::flag_wait( "leaving_diner" );
    common_scripts\utility::flag_set( "nates_bomb_incoming" );
    thread monitor_nates_roof_portal();
    _id_BF68();
    level._id_D05B = "south";
    var_0 = getnode( "taco_in_BT", "script_noteworthy" );
    var_1 = var_0.origin;
    var_2 = getent( "BT_goal_volume", "targetname" );
    var_3 = 3;
    level._id_C589 = _id_B907( var_3 );

    foreach ( var_5 in level._id_C589 )
        var_5 thread _id_AB34( "player_in_burgertown", var_1, var_2 );

    common_scripts\utility::flag_set( "move_president_to_prep" );
    thread _id_ABA8();
    thread _id_CADB();
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_in_burgertown" );
    level maps\_utility::add_func( maps\_utility::autosave_by_name, "player_in_burgertown" );
    level thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "burger_town_lower_cleared" );
    maps\_utility::autosave_by_name( "burgertown_cleared" );
    thread _id_B198();
}

_id_B198()
{
    common_scripts\utility::flag_set( "move_president_to_prep" );
    level._id_D05B = undefined;
    wait 3;
    thread _id_CBEE();
    common_scripts\utility::flag_set( "taco_goes_to_roof" );
    common_scripts\utility::flag_set( "time_to_clear_burgertown" );
    var_0 = getnode( "wells_in_bushes", "targetname" );
    level._id_C9E1 setgoalnode( var_0 );
    var_1 = getentarray( "nates_regroup_enemies", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    thread _id_B091();
}

_id_B091()
{
    common_scripts\utility::flag_set( "move_president_to_prep" );
    var_0 = getent( "BT_goal_volume", "targetname" );
    var_1 = getent( "president_in_burgertown_meat_locker", "targetname" ).origin;
    var_2 = 3;
    level._id_C589 = _id_B907( var_2 );

    foreach ( var_4 in level._id_C589 )
    {
        var_4.offsetdirection = undefined;
        var_4 thread _id_B9AE( var_1, var_0 );
    }

    maps\_utility::autosave_by_name( "defend_prez" );
    wait 1;
    maps\_utility::radio_dialogue( "inv_six_lockandload" );
    wait 5;
    common_scripts\utility::flag_waitopen_or_timeout( "player_in_burgertown", 6 );
    thread _id_CB2D();
    var_6 = getent( "president_in_burgertown_meat_locker", "targetname" );
    level.president invisiblenotsolid();
    level._id_CE19 pushplayer( 1 );
    level._id_CE19.dontchangepushplayer = 1;
    var_7 = level._id_CE19.badplaceawareness;
    level._id_CE19.badplaceawareness = 0;
    setsaveddvar( "ai_ignoreBadPlaceDuringPathing", 1 );
    var_8 = getent( "wounded_carry_path", "targetname" );
    level._id_CE19 thread president_move_wrapper( var_8 );
    level._id_CBDB = 1;
    level.president thread maps\_utility::play_sound_on_tag_endon_death( "scn_invasion_raptor_civ_grab", undefined );
    maps\_utility::radio_dialogue( "inv_six_onthree" );
    wait 1;
    maps\_utility::radio_dialogue( "inv_six_one" );
    wait 1;
    maps\_utility::radio_dialogue( "inv_six_two" );
    wait 1;
    maps\_utility::radio_dialogue( "inv_six_three" );
    wait 1;
    maps\_utility::radio_dialogue( "inv_six_gogogo2" );
    level._id_C9E1 thread maps\_utility::stop_magic_bullet_shield();
    level._id_CE19 thread _id_B3B5();
    thread _id_CD52();
    thread _id_C991();
    common_scripts\utility::flag_wait( "president_in_BT_meat_locker" );
    thread _id_B100();
    thread restore_raptor_state( var_7 );
    level._id_CBDB = undefined;
    thread _id_C375();
}

restore_raptor_state( var_0 )
{
    wait 5;
    level._id_CE19.badplaceawareness = var_0;
    setsaveddvar( "ai_ignoreBadPlaceDuringPathing", 0 );
}

_id_C375()
{
    thread _id_B524();
    thread _id_AD04();
    _id_A858();
    thread _id_CFAA();
    thread _id_BE25();
    common_scripts\utility::flag_wait( "first_attack_heli_spawned" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "kill_heli" );
    var_0.circling = 1;
    var_0.no_attractor = 1;
    level._id_B801 = thread vehicle_scripts\_attack_heli::begin_attack_heli_behavior( var_0 );
    level._id_B801 thread maps\_utility::play_sound_on_tag_endon_death( "scn_havok_heli_arrival_01" );
    thread _id_BE4F();
    thread _id_C598();
    var_1 = undefined;

    if ( isalive( level._id_B801 ) )
        level._id_B801 waittill( "death", var_1 );

    common_scripts\utility::flag_set( "first_attack_heli_dead" );

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
        thread _id_B925();

    thread maps\_utility::autosave_by_name( "heli_death" );
    common_scripts\utility::flag_wait( "second_attack_heli_spawned" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "kill_heli" );
    var_0.circling = 1;
    var_0.no_attractor = 1;
    level._id_B801 = thread vehicle_scripts\_attack_heli::begin_attack_heli_behavior( var_0 );
    level._id_B801 thread maps\_utility::play_sound_on_tag_endon_death( "scn_havok_heli_arrival_02" );
    thread _id_C598();
    thread _id_CD0C();
    var_1 = undefined;

    if ( isalive( level._id_B801 ) )
        level._id_B801 waittill( "death", var_1 );

    common_scripts\utility::flag_set( "second_attack_heli_dead" );

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
        thread _id_B925();

    thread maps\_utility::autosave_by_name( "heli_death" );
    wait 12;
    thread _id_C243();
}

president_move_wrapper( var_0 )
{
    level._id_CE19 _id_AE35::_id_ACA9( level.president, var_0 );
    maps\_utility::set_goal_pos( self.origin );
}

_id_AEC5()
{
    thread _id_C2FD();
    common_scripts\utility::flag_wait( "player_at_convoy" );
    maps\_utility::music_stop( 3 );
    level.player playsound( "mus_invasion_ending" );
    maps\_utility::musicplaywrapper( "mus_invasion_ending" );
}

_id_C2FD()
{
    if ( common_scripts\utility::flag( "player_at_convoy" ) )
        return;

    var_0 = maps\_utility::musiclength( "mus_invasion_regroup" );
    level endon( "player_at_convoy" );

    for (;;)
    {
        maps\_utility::musicplaywrapper( "mus_invasion_regroup" );
        wait(var_0);
    }
}

_id_C243()
{
    wait 1;
    level._id_D05B = "south";
    var_0 = undefined;
    var_1 = getentarray( "convoy", "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3.script_noteworthy ) )
            continue;

        if ( var_3.script_noteworthy == "obj_vehicle" )
            var_0 = var_3;
    }

    if ( isdefined( var_0 ) )
    {
        while ( maps\_utility::player_looking_at( var_0.origin, 0, 1 ) && common_scripts\utility::flag( "player_on_roof" ) )
            wait 1;
    }

    thread _id_AEC5();
    maps\invasion_anim::convoy_latvee_remap_dismount_anims();
    var_5 = common_scripts\utility::getstructarray( "convoy_targets", "targetname" );
    var_6 = [];
    thread _id_AF8F();

    foreach ( var_3 in var_1 )
    {
        var_8 = var_3 thread maps\_vehicle::spawn_vehicle_and_gopath();
        var_8 thread _id_AA30( var_5 );
        var_8 thread _id_C3E7();
        var_8 thread maps\invasion_aud::_id_CA7A();

        if ( isdefined( var_3.script_noteworthy ) )
        {
            var_6[var_6.size] = var_8;

            if ( var_3.script_noteworthy == "obj_vehicle" )
                level._id_B818 = var_8;

            var_8 maps\_vehicle::vehicle_set_random_unload_delays( 0, 0.5 );

            if ( var_3.script_noteworthy == "latvee" )
            {
                foreach ( var_10 in var_8.attachedguys )
                    var_10.vehicle_anim_ends_on_finish = 1;
            }

            if ( isdefined( var_3.script_parameters ) && var_3.script_parameters == "convoy_unload" )
                var_8 thread minigun_laatpv_unload();
        }
    }

    setsaveddvar( "ai_count", 64 );
    thread prepareplayerlaatpv();
    level._id_B818 thread h2_ending_spawn_weapon();
    common_scripts\utility::flag_set( "time_to_goto_convoy" );
    var_13 = getaiarray( "axis" );
    var_14 = var_13.size;

    if ( var_14 < 12 )
    {
        var_15 = getentarray( "wounded_carry_attackers_TC", "targetname" );
        common_scripts\utility::array_thread( var_15, maps\_utility::spawn_ai );
    }

    if ( var_14 < 6 )
    {
        var_16 = getentarray( "wounded_carry_attackers_gas", "targetname" );
        common_scripts\utility::array_thread( var_16, maps\_utility::spawn_ai );
    }

    common_scripts\utility::flag_wait( "convoy_has_arrived" );

    if ( !isdefined( level._id_B818.usedpositions ) )
        level._id_B818.usedpositions = [];

    level._id_B818.usedpositions[0] = 1;
    level._id_B818.usedpositions[3] = 1;
    common_scripts\utility::flag_set( "convoy_in_position" );
    common_scripts\utility::flag_wait( "player_at_convoy" );
    thread _id_D3DD( var_6 );
    thread _id_B32D();
    maps\_utility::set_vision_set( "invasion_near_convoy", 3 );
    thread vip_escort_convoy();
    maps\_utility::radio_dialogue( "inv_hqr_sitrep" );
    maps\_utility::radio_dialogue( "inv_six_cargosecure" );
    maps\_utility::radio_dialogue( "inv_hqr_goodjob" );
    wait 1;
    maps\_utility::radio_dialogue( "inv_fly_2kcivvies" );
    maps\_utility::nextmission();
}

minigun_laatpv_unload()
{
    self waittill( "reached_end_node" );
    maps\_vehicle::vehicle_unload( "passengers" );
}

_id_B524()
{
    common_scripts\utility::flag_wait( "first_attack_heli_spawned" );

    for (;;)
    {
        level.player waittill( "begin_firing" );
        var_0 = level.player getcurrentweapon();

        if ( var_0 == "stinger" )
        {
            if ( level.player playerads() == 1.0 )
                return;
            else
            {
                if ( maps\_utility::is_command_bound( "+toggleads_throw" ) )
                {
                    maps\_utility::display_hint_timeout( "hint_toggle_ads_with_stinger", 5 );
                    continue;
                }

                maps\_utility::display_hint_timeout( "hint_ads_with_stinger", 5 );
            }
        }
    }
}

_id_CE85()
{
    var_0 = level.player getcurrentweapon();

    if ( var_0 == "stinger" )
    {
        if ( level.player playerads() == 1.0 )
            return 1;
        else
            return 0;
    }
    else
        return 1;
}

h2_ending_spawn_weapon()
{
    self.weapon_convoy = maps\_utility::spawn_anim_model( "h2_laatpv_ending_weapon", self gettagorigin( "tag_guy1" ), self gettagangles( "tag_guy1" ) );
    maps\_anim::anim_first_frame_solo( self.weapon_convoy, "h2_laatpv_outro_in", "tag_guy1" );
    self.weapon_convoy linkto( self, "tag_guy1" );
}

prepareplayerlaatpv()
{
    var_0 = getent( "convoy_driver", "targetname" );
    var_1 = var_0 maps\_utility::spawn_ai();
    var_1 maps\_utility::gun_remove();
    var_1 forceteleport( level._id_B818 gettagorigin( "tag_driver" ), level._id_B818.angles );
    var_1 linkto( level._id_B818, "tag_driver" );
    var_1.animname = "generic";
    var_1 thread maps\_anim::anim_loop_solo( var_1, "convoy_driver_idle", "player_enter" );
    common_scripts\utility::flag_wait( "playerStartConvoy" );
    var_1 notify( "player_enter" );
    var_1 maps\_anim::anim_single_solo( var_1, "convoy_driver_nod" );
    var_1 thread maps\_anim::anim_loop_solo( var_1, "convoy_driver_idle" );
}

_id_B32D()
{
    var_0 = level._id_B818;

    for (;;)
    {
        if ( var_0.veh_speed == 0 )
            break;

        wait 0.5;
    }

    var_1 = var_0 gettagorigin( "tag_guy1" );
    var_2 = 7225;

    for (;;)
    {
        var_3 = distancesquared( var_1, level.player.origin );

        if ( var_3 <= var_2 )
            break;

        wait 0.05;
    }

    level.player playsound( "scn_invasion_plr_get_in_laatpv" );
    level.player setmovespeedscale( 0 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    wait 0.25;
    level.player disableweapons( 1 );

    for (;;)
    {
        var_4 = getgroundposition( level.player.origin, 2 );

        if ( distancesquared( var_4, level.player.origin ) < 4 )
            break;

        waitframe();
    }

    _id_C7C7( "obj_convoy", "done" );
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "actionSlotsHide", "1" );
    setsaveddvar( "ammoCounterHide", "1" );
    var_5 = var_0.weapon_convoy;
    var_6 = maps\_utility::spawn_anim_model( "viewbody", var_0 gettagorigin( "tag_guy1" ), var_0 gettagangles( "tag_guy1" ) );
    var_6 hide();
    var_6 dontcastshadows();
    var_0 maps\_anim::anim_first_frame_solo( var_6, "h2_laatpv_outro_in", "tag_guy1" );
    var_6 linkto( var_0, "tag_guy1" );
    var_6 maps\_utility::lerp_player_view_to_tag_oldstyle( level.player, "tag_player", 0.5, 1, 0, 0, 0, 0 );
    level.player playerlinktodelta( var_6, "tag_player", 1, 0, 0, 0, 0, 1 );
    thread player_at_convoy_cinematic( var_6 );
    var_6 show();
    common_scripts\utility::flag_set( "playerStartConvoy" );
    var_0 thread maps\_anim::anim_single_solo( var_5, "h2_laatpv_outro_in", "tag_guy1" );
    var_0 maps\_anim::anim_single_solo( var_6, "h2_laatpv_outro_in", "tag_guy1" );
    level.player playerlinktodelta( var_6, "tag_player", 1, 50, 30, 30, 30, 1 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    level.player _meth_85AA( 90, -12, 0, 180 );
    var_5 delete();
    var_6 attach( "h2_weapon_scar_h_reflex", "tag_weapon_right" );
    var_0 thread maps\_anim::anim_loop_solo( var_6, "h2_laatpv_outro_loop", undefined, "tag_guy1" );
    common_scripts\utility::flag_set( "player_in_latvee" );
}

player_at_convoy_cinematic( var_0 )
{
    var_1 = _id_D397::_id_A97A( "player_at_convoy" );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 5.0, -1, 32, 32 ) _id_D397::_id_CCA7( var_0, "tag_dof" ) _id_D397::_id_AF9C();
    var_1 _id_D397::_id_BEA0( 2.95 ) _id_D397::_id_BF3F();
    var_1 _id_D397::_id_BEA0( 0.4 ) _id_D397::_id_B85E( 0.06, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 1.0 ) _id_D397::_id_B85E( 0.06, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 1.95 ) _id_D397::_id_B85E( 0.06, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BC26();
}

vip_escort_convoy()
{
    var_0 = getentarray( "ending_convoy_friendly", "targetname" );
    common_scripts\utility::flag_waitopen( "player_is_near_BT_locker_door" );
    thread _id_C396();
    level.president invisiblenotsolid();
    level._id_CE19 pushplayer( 1 );
    level._id_CE19.dontchangepushplayer = 1;
    var_1 = getent( "wounded_carry_path_convoy", "targetname" );
    level._id_CE19 maps\_utility::gun_remove();
    level._id_CE19 thread _id_AE35::_id_ACA9( level.president, var_1 );
    level._id_CE19.moveplaybackrate = 1.0;
    level._id_CBDB = 1;
    level.president thread maps\_utility::play_sound_on_tag_endon_death( "scn_invasion_raptor_civ_grab", undefined );
    common_scripts\utility::array_thread( var_0, ::soldiers_escort_president, var_1 );
    common_scripts\utility::flag_wait( "player_in_latvee" );
    var_2 = getent( "foley_outside_playerview", "targetname" );

    if ( level._id_CE19 istouching( var_2 ) )
    {
        var_3 = getnode( "foley_teleport_convoy", "targetname" );
        level._id_CE19 maps\_utility::teleport_ai( var_3 );
    }
}

_id_C3E7()
{
    maps\_utility::ent_flag_init( "apply_brakes" );
    maps\_utility::ent_flag_wait( "apply_brakes" );
    self.veh_brake = 1;
}

_id_D3DD( var_0 )
{
    var_1 = getentarray( "friendly_redshirt", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        if ( !isai( var_3 ) )
        {
            if ( isspawner( var_3 ) )
            {
                var_3 maps\_utility::remove_spawn_function( ::_id_B5C7 );
                var_3 maps\_utility::remove_spawn_function( ::_id_B4C5 );
            }
        }
    }

    level._id_B818.usedpositions[3] = 1;
    var_5 = 54;
    var_6 = 4;
    var_7 = getaicount();

    for ( var_8 = var_0.size; var_8; var_7 = getaicount() )
    {
        if ( var_7 + var_6 > var_5 )
            return;

        var_9 = _id_B60B();

        foreach ( var_11 in var_9 )
            thread maps\_utility::guy_runtovehicle_load( var_11, var_0[var_8 - 1] );

        var_8--;
        wait 3;
    }
}

_id_B60B()
{
    var_0 = "redshirt_spawn_group_BT";
    var_1 = common_scripts\utility::getstructarray( var_0, "targetname" );
    var_2 = common_scripts\utility::getfarthest( level.player.origin, var_1 );
    var_3 = getentarray( var_2.target, "targetname" );
    var_4 = [];

    foreach ( var_6 in var_3 )
    {
        if ( var_4.size < 3 )
        {
            var_6.count = 1;

            if ( getaicount() < 54 )
            {
                var_4[var_4.size] = var_6 maps\_utility::spawn_ai();
                continue;
            }

            break;
        }
    }

    return var_4;
}

_id_CCBA()
{
    common_scripts\utility::flag_wait( "player_on_roof" );
    level endon( "diner_attack" );
    var_0 = [];
    var_0[var_0.size] = "inv_six_roofbehind";
    var_0[var_0.size] = "inv_six_enemiesonroof";
    var_0[var_0.size] = "inv_six_insideperim";
    var_0[var_0.size] = "inv_six_turnaround";
    var_1 = 0;
    var_2 = getent( "enemies_on_roof", "targetname" );

    for (;;)
    {
        var_2 waittill( "trigger", var_3 );
        level._id_CE19 maps\_utility::dialogue_queue( var_0[var_1] );
        var_1++;

        if ( var_1 >= var_0.size )
            var_1 = 0;

        wait 10;
    }
}

_id_CAB9()
{
    common_scripts\utility::flag_wait( "player_on_roof" );
    common_scripts\utility::flag_waitopen( "player_on_roof" );
    maps\_utility::activate_trigger_with_targetname( "diner_enemy_defenders_trigger" );
}

_id_D2CF()
{
    if ( isdefined( self.script_noteworthy ) )
    {
        if ( self.script_noteworthy == "paradrop_guy_left" )
            return;

        if ( self.script_noteworthy == "paradrop_guy_right" )
            return;
    }

    if ( isdefined( self.ridingvehicle ) )
    {
        self endon( "death" );
        self waittill( "jumpedout" );
    }

    if ( !isdefined( self.unique_id ) )
        return;

    _id_BCA1::_id_CFA0();
}

_id_BCFE()
{
    var_0 = getent( "nates_roof_volume_south", "targetname" );
    var_1 = getent( "destroyed_nates_inaccessable_volume", "targetname" );
    var_2 = getent( "destroyed_nates_safe_volume", "targetname" );
    var_3 = getent( "raptor_in_nates_prep", "targetname" );
    var_4 = getaiarray( "allies" );

    foreach ( var_6 in var_4 )
    {
        if ( var_6 istouching( var_1 ) || var_6 istouching( var_0 ) )
        {
            var_6.goalradius = 500;
            var_6 setgoalpos( var_3.origin );
            var_6 setgoalvolume( var_2 );
            var_6.fixednode = 0;
        }
    }

    badplace_brush( "destroyed_nates_inaccessable_volume", -1, var_1, "allies", "axis" );
    badplace_brush( "nates_roof_volume_south", -1, var_0, "allies", "axis" );
    common_scripts\utility::flag_wait( "nates_bomb_incoming" );
    badplace_delete( "destroyed_nates_inaccessable_volume" );
    badplace_delete( "nates_roof_volume_south" );
}

_id_AD07()
{
    level endon( "player_on_roof" );
    var_0 = getent( "roof_volume", "targetname" );
    var_1 = getaiarray( "allies" );

    foreach ( var_3 in var_1 )
    {
        if ( var_3 istouching( var_0 ) )
        {
            if ( isdefined( var_3.magic_bullet_shield ) )
                var_3 maps\_utility::stop_magic_bullet_shield();

            var_3 kill();
            wait 0.5;
        }
    }
}

_id_AC0A()
{
    var_0 = getent( "btr80_smash", "targetname" );
    var_0.origin = ( 805.9, -1688.8, 2309.7 );
    var_0.angles = ( 0.0, 149.0, 0.0 );
    level.player maps\_utility::waittill_in_range( var_0.origin, 1350 );
    var_1 = maps\_utility::spawn_anim_model( "btr_ground_smash" );
    var_2 = maps\_utility::spawn_anim_model( "btr_squashedcar" );
    var_1 playsound( "scn_invasion_btr_drop" );
    var_0 thread maps\_anim::anim_single_solo( var_2, "btr_squashedcar" );
    var_0 thread maps\_anim::anim_single_solo( var_1, "btr_ground_smash" );
}

_id_B1A6()
{
    var_0 = getnodearray( "north_side_nodes", "targetname" );
    var_1 = getent( "nates_roof_volume_north", "targetname" );
    var_2 = getaiarray( "allies" );
    level._id_CE19.goalheight = 80;
    level._id_CE19.goalradius = 500;
    level._id_CE19.fixednode = 0;
    level._id_CE19 setgoalnode( var_0[0] );
    level._id_CE19 setgoalvolume( var_1 );
    var_3 = 1;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( var_3 >= var_0.size )
            break;

        if ( !isalive( var_2[var_4] ) )
            continue;
        else
        {
            var_2[var_4].goalheight = 80;
            var_2[var_4].goalradius = 500;
            var_2[var_4].fixednode = 0;
            var_2[var_4] setgoalnode( var_0[var_3] );
            var_2[var_4] setgoalvolume( var_1 );
            var_3++;
            wait 1;
        }
    }
}

_id_D13A()
{
    common_scripts\utility::flag_wait( "leaving_gas_station" );

    if ( common_scripts\utility::flag( "nates_bomb_incoming" ) )
        return;

    var_0 = getentarray( "nates_defenders", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::spawn_ai();
}

_id_C9B0()
{
    common_scripts\utility::flag_wait( "spawn_nates_attackers_in_alley" );
    var_0 = getentarray( "alley_nates_attackers", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::spawn_ai();
}

_id_C081()
{
    level waittill( "player_is_controlling_UAV" );
    var_0 = getentarray( "uav_ambient_battle", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_AA30( var_0 )
{
    if ( self.classname == "script_vehicle_laatpv_minigun" )
    {
        var_1 = self.mgturret[0];
        var_1 waittill( "turret_ready" );
        var_2 = var_1 getturretowner();
        var_2.ignoreall = 1;
        var_1 thread animscripts\laatpv_turret\common::set_manual_target( level.player, 1, 6 );
        var_2.ignoreall = 0;
    }
    else
    {
        while ( !common_scripts\utility::flag( "player_at_convoy" ) )
        {
            var_0 = common_scripts\utility::array_randomize( var_0 );

            foreach ( var_4 in var_0 )
            {
                self setturrettargetvec( var_4.origin );
                self waittill( "turret_on_target" );
                self fireweapon();
                wait(randomfloatrange( 0.2, 0.6 ));
            }
        }
    }
}

_id_B925()
{
    wait 3;
    maps\_utility::radio_dialogue( "inv_six_niceoneheli" );
}

_id_AF8F()
{
    level endon( "player_at_convoy" );
    wait 10;
    maps\_utility::radio_dialogue( "inv_six_convoyshere" );
    wait 4;
    maps\_utility::radio_dialogue( "inv_six_southofbtown" );
    wait 4;
    maps\_utility::radio_dialogue( "inv_tco_backtoconvoy" );

    for (;;)
    {
        wait 15;
        maps\_utility::radio_dialogue( "inv_six_convoyshere" );
        wait 15;
        maps\_utility::radio_dialogue( "inv_six_southofbtown" );
        wait 15;
        maps\_utility::radio_dialogue( "inv_tco_backtoconvoy" );
    }
}

_id_AD64()
{
    wait 8;

    if ( isdefined( level.player.is_controlling_uav ) )
        return;

    level endon( "player_is_controlling_UAV" );

    if ( common_scripts\utility::cointoss() )
        maps\_utility::radio_dialogue( "inv_six_theinfantry" );
    else
        maps\_utility::radio_dialogue( "inv_six_theinfantry2" );

    wait 5;
    level.player thread maps\_utility::display_hint( level.player _id_BC84( "hint_predator_drone" ) );
}

_id_BE4F()
{
    maps\_utility::radio_dialogue( "inv_hqr_enemyhelo" );
    maps\_utility::radio_dialogue( "inv_six_takedown" );
    thread _id_BFB8();
}

_id_BFB8()
{
    level._id_B801 endon( "death" );
    wait 3;
    var_0 = 0;
    var_1 = [];
    var_1[var_1.size] = "inv_tco_roofofnates";
    var_1[var_1.size] = "inv_tco_killthathelo";
    var_1[var_1.size] = "inv_six_checktheroof";
    var_1[var_1.size] = "inv_six_supplydroponroof";
    var_2 = 0;
    var_3 = [];
    var_3[var_3.size] = "inv_tco_dispatchchopper";
    var_3[var_3.size] = "inv_tco_insidediner";
    var_3[var_3.size] = "inv_tco_nexttostation";
    var_3[var_3.size] = "inv_tco_dineruav";

    for (;;)
    {
        var_4 = 1;
        var_5 = level.player getweaponslistall();

        foreach ( var_7 in var_5 )
        {
            if ( var_7 == "stinger" )
                var_4 = 0;
        }

        if ( !var_4 )
        {
            wait 3;
            continue;
        }

        var_9 = getent( "diner", "script_noteworthy" );

        if ( isdefined( var_9 ) )
        {
            var_10 = var_3[var_2];
            maps\_utility::radio_dialogue( var_10 );

            if ( var_10 == "inv_tco_roofofnates" )
                maps\_utility::radio_dialogue( "inv_tco_roofofnates2" );

            if ( var_10 == "inv_tco_killthathelo" )
                maps\_utility::radio_dialogue( "inv_tco_killthathelo2" );

            var_2++;

            if ( var_2 >= var_3.size )
                var_2 = 0;
        }
        else
        {
            var_10 = var_1[var_0];
            maps\_utility::radio_dialogue( var_10 );

            if ( var_10 == "inv_tco_dispatchchopper" )
                maps\_utility::radio_dialogue( "inv_tco_dispatchchopper2" );

            if ( var_10 == "inv_tco_insidediner" )
                maps\_utility::radio_dialogue( "inv_tco_insidediner2" );

            var_0++;

            if ( var_0 >= var_1.size )
                var_0 = 0;
        }

        wait 50;
    }
}

_id_CF94()
{
    level waittill( "bmp_died" );

    if ( isdefined( level.player._id_C2F9 ) )
    {
        wait 3;

        if ( common_scripts\utility::flag( "bmps_from_north_dead" ) )
            return;

        maps\_utility::radio_dialogue( "inv_six_onemore" );
    }
}

_id_CD0C()
{
    maps\_utility::radio_dialogue( "inv_hqr_relaygol1" );
    maps\_utility::radio_dialogue( "inv_tco_eyesup" );
    maps\_utility::radio_dialogue( "inv_six_anotherhelo" );
    thread _id_BFB8();
}

_id_C9E7()
{
    if ( isdefined( level._id_B1DF ) )
        return;

    level._id_C176 maps\_vehicle::godoff();
    level._id_C176.health = 400;
    level waittill( "player_is_controlling_UAV" );
    wait 2;
    thread _id_A9C1();
    var_0 = anglestoforward( level._id_C176.angles );
    var_1 = var_0 * 10000;
    var_2 = var_1 + level._id_C176.origin;
    var_3 = missile_createattractorent( level._id_C176, 100000, 60000 );
    var_4 = magicbullet( "zippy_rockets", ( 497.8, -3564.4, 2346.0 ), var_2 );
    var_4 missile_settargetent( level._id_C176 );
    var_5 = level._id_C176.origin;
    var_6 = 999999999;

    while ( isdefined( var_4 ) )
    {
        if ( !isalive( level._id_C176 ) )
            break;

        var_7 = distance( var_4.origin, level._id_C176.origin );

        if ( var_7 <= 200 )
            break;

        if ( var_7 > var_6 + 100 )
            break;

        var_6 = var_7;
        var_5 = level._id_C176.origin;
        wait 0.05;
    }

    missile_deleteattractor( var_3 );

    if ( isdefined( var_4 ) )
        var_4 delete();

    playfx( common_scripts\utility::getfx( "uav_explosion" ), var_5 );
    level._id_B1DF = 1;
    level.player _id_C630::_id_C6C2();

    if ( isdefined( level._id_C176 ) )
        level._id_C176 delete();

    level notify( "uav_destroyed" );
    wait 2;
    maps\_utility::radio_dialogue_clear_stack();
    maps\_utility::radio_dialogue( "inv_tco_uavoffline" );
}

_id_A9C1()
{
    wait 2;
    maps\_utility::radio_dialogue_clear_stack();
    maps\_utility::radio_dialogue( "inv_tco_firedmissile" );
}

_id_BBC6()
{
    maps\_utility::radio_dialogue( "inv_hqr_enemyhelo" );
    maps\_utility::radio_dialogue( "inv_hqr_relaygol1" );
    maps\_utility::radio_dialogue( "inv_hqr_capunavail" );
    maps\_utility::radio_dialogue( "inv_tco_eyesup" );
}

_id_BE25()
{
    var_0 = getentarray( "friendly_redshirt", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( isai( var_2 ) )
        {
            if ( isalive( var_2 ) )
            {
                var_2 thread _id_B5C7();
                var_2 thread _id_B4C5();
            }

            continue;
        }

        if ( isspawner( var_2 ) )
        {
            var_2 maps\_utility::add_spawn_function( ::_id_B5C7 );
            var_2 maps\_utility::add_spawn_function( ::_id_B4C5 );
        }
    }

    if ( !isdefined( level._id_C589 ) )
        level._id_C589 = [];

    level endon( "time_to_goto_convoy" );

    for (;;)
    {
        wait 1;
        var_4 = 3;
        level._id_C589 = _id_B907( var_4 );
    }
}

_id_B5C7()
{
    self endon( "death" );
    self.ignored_by_attack_heli = 1;
    thread maps\_utility::magic_bullet_shield();
    maps\_utility::waittill_entity_in_range( level.player, 600 );
    self.ignored_by_attack_heli = undefined;
    thread maps\_utility::stop_magic_bullet_shield();
}

smart_barney_goal( var_0, var_1 )
{
    self cleargoalvolume();
    var_2 = vectornormalize( var_1 - var_0 );
    var_3 = self.offsetdirection * 45 - 90;
    var_2 = rotatevector( var_2, ( 0, var_3, 0 ) ) * 300;
    var_4 = var_2 + var_0;
    self setgoalpos( var_4 );
}

smart_barney_goal_offset( var_0 )
{
    if ( !isdefined( level.offsetdirection ) )
        level.offsetdirection = 0;

    if ( !isdefined( self.offsetdirection ) )
    {
        if ( isdefined( var_0 ) && var_0 && level.offsetdirection == 2 )
            level.offsetdirection++;

        self.offsetdirection = level.offsetdirection;
        level.offsetdirection = ( level.offsetdirection + 1 ) % 5;
    }
}

_id_AB34( var_0, var_1, var_2 )
{
    self endon( "stop_barney" );
    self endon( "death" );
    self cleargoalvolume();
    thread _id_D3A5();
    self.goalheight = 80;
    self.goalradius = 250;
    self.usechokepoints = 0;
    self.fixednode = 0;
    var_3 = getent( "nates_roof_goal_volume", "targetname" );
    var_4 = getent( "BT_roof_goal_volume", "targetname" );

    if ( !isdefined( self.favoriteenemy ) )
    {
        var_5 = var_2 maps\_utility::get_ai_touching_volume( "axis" );

        if ( var_5.size )
            self.favoriteenemy = var_5[0];
    }

    smart_barney_goal_offset();

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        if ( common_scripts\utility::flag( "player_on_burgertown_roof" ) )
        {
            self setgoalpos( var_4.origin );
            self setgoalvolume( var_4 );
        }
        else if ( common_scripts\utility::flag( "player_on_roof" ) )
        {
            self setgoalpos( var_3.origin );
            self setgoalvolume( var_3 );
        }
        else
            smart_barney_goal( level.player.origin, var_1 );

        wait 2;
        self.favoriteenemy = undefined;
    }

    self notify( "stop_adjust_movement_speed" );
    self.moveplaybackrate = 1.0;
    self setgoalpos( var_1 );
    self setgoalvolume( var_2 );
}

_id_B4C5()
{
    self notify( "stop_barney" );
    self endon( "stop_barney" );
    self endon( "death" );
    self cleargoalvolume();
    thread _id_D3A5();
    self.goalheight = 80;
    self.usechokepoints = 0;

    if ( !isdefined( self._id_C954 ) )
        self.goalradius = 200;
    else
        self.goalradius = 1000;

    self.fixednode = 0;
    var_0 = getent( "nates_roof_goal_volume", "targetname" );
    var_1 = getent( "BT_roof_goal_volume", "targetname" );
    smart_barney_goal_offset();

    for (;;)
    {
        if ( common_scripts\utility::flag( "player_on_burgertown_roof" ) )
        {
            self setgoalpos( var_1.origin );
            self setgoalvolume( var_1 );
        }
        else if ( common_scripts\utility::flag( "player_on_roof" ) )
        {
            self setgoalpos( var_0.origin );
            self setgoalvolume( var_0 );
        }
        else
        {
            self cleargoalvolume();

            if ( isdefined( level._id_C208 ) )
            {
                var_2 = level._id_C208;
                smart_barney_goal( level.player.origin, var_2 );
            }
            else
            {
                var_3 = level.player.origin;
                self setgoalpos( var_3 );
            }
        }

        wait 2;
    }

    self notify( "stop_adjust_movement_speed" );
    self.moveplaybackrate = 1.0;
}

_id_CFAA()
{
    if ( !isdefined( level._id_CF68 ) )
        level._id_CF68 = 0;

    level._id_CE91[0] = "taco_enemies";
    level._id_CE91[1] = "gas_station_enemies";
    level._id_CE91[2] = "bank_enemies";
    level.dialog = [];
    level.dialog["bank_enemies"][0] = "inv_hqr_enemynorth";
    level.dialog["bank_enemies"][1] = "inv_hqr_banktonorth";
    level.dialog["bank_enemies"][2] = "inv_hqr_footmobiles";
    level.dialog["taco_enemies"][0] = "inv_hqr_southeast";
    level.dialog["taco_enemies"][1] = "inv_hqr_visualse";
    level.dialog["taco_enemies"][2] = "inv_hqr_tacojoint";
    level.dialog["gas_station_enemies"][0] = "inv_hqr_novagasstation";
    level.dialog["gas_station_enemies"][1] = "inv_hqr_enemywest";
    level.dialog["gas_station_enemies"][2] = "inv_hqr_dinerwest";
    level.enemy_heli_attacking = 0;
    level._id_CE91 = common_scripts\utility::array_randomize( level._id_CE91 );
    level._id_C9E9 = 0;
    level._id_BE7A = getentarray( "enemy_groups", "targetname" );

    for (;;)
    {
        var_0 = getaiarray( "axis" );
        var_1 = var_0.size;
        var_2 = var_1;

        if ( var_2 < 7 )
        {
            if ( common_scripts\utility::flag( "first_attack_heli_dead" ) )
            {
                level._id_CF68++;
                level notify( "enemy_group_spawning" );
                spawn_enemy_group();
                wait 9;
                common_scripts\utility::flag_set( "second_attack_heli_spawned" );
                thread maps\_utility::autosave_by_name( "reinforcements" );
                common_scripts\utility::flag_wait( "second_attack_heli_dead" );
                thread maps\_utility::autosave_by_name( "reinforcements" );
                return;
            }

            if ( level._id_CF68 == 3 && !common_scripts\utility::flag( "first_attack_heli_spawned" ) )
            {
                wait 12;
                thread maps\_utility::autosave_by_name( "reinforcements" );
                common_scripts\utility::flag_set( "first_attack_heli_spawned" );
                common_scripts\utility::flag_wait( "first_attack_heli_dead" );
                wait 5;
                continue;
            }

            if ( level._id_CF68 >= 2 )
                thread _id_C9E7();

            level._id_CF68++;
            level notify( "enemy_group_spawning" );

            if ( level._id_CF68 == 1 )
                thread _id_AD64();

            if ( level._id_CF68 == 2 )
                thread _id_AD64();

            spawn_enemy_group();
        }

        wait 1;
    }
}

spawn_enemy_group()
{
    var_0 = common_scripts\utility::getclosest( level.player.origin, level._id_BE7A );

    if ( var_0.target == level._id_CE91[level._id_C9E9] )
        level._id_C9E9++;

    if ( level._id_C9E9 >= level._id_CE91.size )
        level._id_C9E9 = 0;

    var_1 = level._id_CE91[level._id_C9E9];
    level._id_C9E9++;

    if ( level._id_C9E9 >= level._id_CE91.size )
        level._id_C9E9 = 0;

    if ( var_1 == "bank_enemies" )
        level._id_D05B = "north";

    if ( var_1 == "gas_station_enemies" )
        level._id_D05B = "west";

    if ( var_1 == "taco_enemies" )
        level._id_D05B = "east";

    wait 1;
    thread maps\_utility::autosave_by_name( "reinforcements" );
    wait 3;
    var_2 = getentarray( var_1, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( getaicount() >= 54 )
            break;

        var_2[var_3].count = 1;
        var_4 = var_2[var_3] maps\_utility::spawn_ai();
        wait 0.1;
    }

    wait 1;
    var_5 = randomint( level.dialog[var_1].size );
    thread maps\_utility::radio_dialogue( level.dialog[var_1][var_5] );
    wait 3;

    if ( !isdefined( level._id_BFC2 ) )
    {
        if ( level._id_CF68 < 3 )
        {
            foreach ( var_7 in level._id_BE7A )
            {
                if ( var_7.target == var_1 )
                    level._id_BFC2 = var_7.origin;
            }
        }
    }
}

_id_B100()
{
    maps\_utility::radio_dialogue( "inv_six_gotthepresident" );
    maps\_utility::radio_dialogue( "inv_six_friedlyconvoy" );
}

_id_BE36()
{
    level endon( "convoy_is_here" );

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "player_is_close_to_BT" );
        thread _id_D027();
        common_scripts\utility::flag_wait( "player_is_close_to_BT" );
    }
}

_id_D027()
{
    level endon( "convoy_is_here" );
    level endon( "player_is_close_to_BT" );
    level notify( "warning_player_is_leaving_BT" );
    wait 2;
    level notify( "warning_player_is_leaving_BT" );
    wait 2;
    level notify( "warning_player_is_leaving_BT" );
    wait 1;
    setdvar( "ui_deadquote", &"INVASION_FAIL_ABANDONED" );
    maps\_utility::missionfailedwrapper();
}

_id_C612()
{
    var_0 = getent( "nates_meat_locker_door", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_1 linkto( var_0 );
    var_0 rotateyaw( -82, 0.1, 0, 0 );
    var_0 connectpaths();
    common_scripts\utility::flag_wait( "player_on_roof" );
    wait 3;
    common_scripts\utility::flag_wait( "player_on_roof" );
    var_0 rotateyaw( 82, 0.1, 0, 0 );
    var_0 disconnectpaths();
}

_id_C396()
{
    var_0 = getent( "BT_locker_door", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_1 linkto( var_0 );
    var_0 rotateyaw( -172, 0.1, 0, 0 );
    var_0 connectpaths();
}

_id_AD04()
{
    wait 1;
    common_scripts\utility::flag_waitopen( "player_is_near_BT_locker_door" );
    var_0 = getent( "BT_locker_door", "targetname" );
    var_0 rotateyaw( 172, 0.1, 0, 0 );
    var_0 disconnectpaths();
    thread maps\_utility::radio_dialogue( "inv_six_gotthepresident2" );
}

_id_B3B5()
{
    var_0 = getent( "vip_escort_bad_place1", "targetname" );
    var_1 = getent( "vip_escort_bad_place2", "targetname" );
    var_2 = getent( "vip_escort_bad_place3", "targetname" );
    badplace_brush( "vip_escort_bad_place1", -1, var_0, "axis" );
    badplace_brush( "vip_escort_bad_place2", -1, var_1, "axis" );
    badplace_brush( "vip_escort_bad_place3", -1, var_2, "axis" );
    common_scripts\utility::flag_wait( "president_in_BT_meat_locker" );
    badplace_delete( "vip_escort_bad_place1" );
    badplace_delete( "vip_escort_bad_place2" );
    badplace_delete( "vip_escort_bad_place3" );
}

_id_AEBE()
{
    wait 2;
    common_scripts\utility::flag_set( "follow_foley" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_teamthisway" );
}

_id_CE52()
{
    level endon( "dialog_bmp_hasnt_spotted_us" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_reqairsupport" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_hqr_engaged" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_hqr_engaged2" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_onfoot" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_onfoot2" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_hqr_goodluck" );
    wait 2;
    level._id_CE19 maps\_utility::dialogue_queue( "inv_tco_fourselves" );
    level._id_BD7E maps\_utility::dialogue_queue( "inv_six_prettymuch" );
    wait 4;
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_300meast" );
    level._id_BD7E maps\_utility::dialogue_queue( "inv_tco_rogerthat" );
}

_id_BF68()
{
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "bomb_nates" );
    thread maps\_utility::radio_dialogue( "inv_six_fastmovers" );
    wait 3.4;
    common_scripts\_exploder::exploder( 3331 );
    wait 0.1;
    _id_BD23();
    common_scripts\_exploder::exploder( 333 );
    thread _id_C049();
    var_1 = ( 257.2, -4669.1, 2381.0 );

    if ( distance( level.player.origin, var_1 ) < 500 )
        level.player dodamage( level.player.health + 1000, var_1 );

    maps\_utility::delaythread( 2, ::_id_D269 );
}

_id_C049()
{
    earthquake( 0.45, 0.4, level.player.origin, 10000 );
    setblur( 5.2, 0.1 );
    wait 0.1;
    setblur( 0, 0.35 );
    wait 0.3;
    earthquake( 0.15, 2.5, level.player.origin, 10000 );
}

_id_D269()
{
    var_0 = getentarray( "player", "classname" )[0];
    var_1 = 22;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        playfx( level._effect["falling_debris_player"], var_0.origin + ( 0.0, 0.0, 500.0 ) );
        wait 0.2;
    }
}

_id_BD23()
{
    var_0 = getentarray( "exploder_tv_333", "script_noteworthy" );

    foreach ( var_3, var_2 in var_0 )
        var_2 delete();
}

_id_D008()
{
    var_0 = getaiarray( "allies" );
}

_id_AA0F()
{
    wait 5;
    var_0 = getnodearray( "off_roof", "targetname" );
    var_1 = 0;
    var_2 = getent( "roof_volume", "targetname" );
    var_3 = getaiarray( "allies" );

    foreach ( var_5 in var_3 )
    {
        if ( var_5 == level._id_BD7E )
            continue;

        if ( var_5 istouching( var_2 ) )
        {
            var_5 setgoalnode( var_0[var_1] );
            var_1++;
            var_5.goalradius = 96;
            var_5.goalheight = 64;
        }
    }
}

_id_B127()
{
    self waittill( "death" );
    wait 0.05;

    if ( !isdefined( level._id_CC81 ) )
        level._id_CC81 = 1;
    else
        level._id_CC81++;
}

_id_CF6C()
{
    var_0 = [];
    var_0[var_0.size] = "inv_hqr_tenpluskia";
    var_0[var_0.size] = "inv_hqr_tenmoreconfirms";
    var_0[var_0.size] = "inv_hqr_fivenotenkills";
    var_1 = 0;
    var_2 = [];
    var_2[var_2.size] = "inv_hqr_fiveplus";
    var_2[var_2.size] = "inv_hqr_another5plus";
    var_2[var_2.size] = "inv_hqr_morethanfive";
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;
    level._id_CC81 = 0;
    var_6 = 0;

    for (;;)
    {
        level waittill( "remote_missile_exploded" );
        var_7 = level._id_CC81;
        wait 0.1;

        if ( isdefined( level._id_BF44["ai"] ) )
            var_6 = level._id_BF44["ai"];
        else
            var_6 = 0;

        if ( var_6 == 0 )
            continue;

        wait 0.5;

        if ( isdefined( level._id_B1DF ) )
            return;

        if ( var_6 == 1 )
        {
            if ( var_4 )
            {
                maps\_utility::radio_dialogue( "inv_hqr_yougotem" );
                var_4 = 0;
            }
            else
            {
                maps\_utility::radio_dialogue( "inv_hqr_hesdown" );
                var_4 = 1;
            }

            continue;
        }

        if ( var_6 >= 10 )
        {
            maps\_utility::radio_dialogue( var_0[var_1] );
            var_1++;

            if ( var_1 >= var_0.size )
                var_1 = 0;

            continue;
        }

        if ( var_6 >= 5 )
        {
            maps\_utility::radio_dialogue( var_2[var_3] );
            var_3++;

            if ( var_3 >= var_2.size )
                var_3 = 0;

            continue;
        }
        else
        {
            if ( var_5 )
            {
                maps\_utility::radio_dialogue( "inv_hqr_goodkills" );
                var_5 = 0;
            }
            else
            {
                maps\_utility::radio_dialogue( "inv_hqr_directhit" );
                var_5 = 1;
            }

            continue;
        }
    }
}

_id_AAA5()
{
    common_scripts\utility::flag_wait( "player_in_diner" );
    maps\_utility::autosave_by_name( "at_diner" );
    wait 2;
    common_scripts\utility::flag_wait( "player_in_diner" );
    level._id_BD7E maps\_utility::dialogue_queue( "inv_tco_incoming" );
    thread _id_B6B4();
    var_0 = getent( "diner_enemy_counter_attack_trigger", "targetname" );
    var_1 = getentarray( var_0.target, "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_BD2F );
    maps\_utility::activate_trigger_with_targetname( "diner_enemy_counter_attack_trigger" );
    common_scripts\utility::flag_set( "back_door_attack_start" );
    level._id_BD7E maps\_utility::dialogue_queue( "inv_tco_backdoor" );
}

_id_B6B4()
{
    var_0 = getent( "diner_back_door", "targetname" );
    var_1 = getent( "back_door_col", "targetname" );
    var_1 linkto( var_0 );
    var_0 rotateyaw( 85, 0.3 );
    var_0 playsound( "diner_backdoor_slams_open" );
    var_1 connectpaths();
    wait 1;
    common_scripts\utility::flag_set( "diner_door_opened" );
}

_id_A898()
{
    common_scripts\utility::flag_clear( "smoke_screen_starting" );
    common_scripts\utility::flag_wait( "smoke_screen_starting" );
    wait 4;
    maps\_utility::radio_dialogue( "inv_tco_smokescrnth" );
    maps\_utility::radio_dialogue( "inv_six_switchthermal" );
}

_id_B3E9()
{
    var_0 = getent( "wells_in_nates_prep", "targetname" );
    level._id_C9E1 setgoalpos( var_0.origin );
    var_1 = getent( "raptor_in_nates_prep", "targetname" );
    level._id_CE19 _id_AE35::_id_ACA9( level.president, var_1 );
}

_id_C991()
{
    while ( getaiarray( "axis" ).size > 4 )
        wait 1;

    var_0 = getentarray( "wounded_carry_attackers_gas", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );

    while ( getaiarray( "axis" ).size > 4 )
        wait 1;

    var_1 = getentarray( "wounded_carry_attackers_bus", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );

    while ( getaiarray( "axis" ).size > 4 )
        wait 1;

    var_2 = getentarray( "wounded_carry_attackers_TC", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::spawn_ai );
}

_id_CB2D()
{
    level._id_CE19 endon( "death" );
    level._id_C9E1 endon( "death" );
    var_0 = getnode( "wells_cover_path", "script_noteworthy" );
    level._id_C9E1 setgoalnode( var_0 );
    level._id_C9E1 waittill( "goal" );
    var_1 = var_0;

    for (;;)
    {
        while ( distance( level._id_C9E1.origin, level._id_CE19.origin ) > 300 )
            wait 0.1;

        if ( !isdefined( var_1.target ) )
            break;

        var_2 = getnode( var_1.target, "targetname" );
        level._id_C9E1 setgoalnode( var_2 );
        var_1 = var_2;
        level._id_C9E1 waittill( "goal" );
    }
}

_id_CD52()
{
    level endon( "president_in_BT_meat_locker" );
    level._id_CE19 endon( "death" );
    wait 6;
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_teamthisway" );
    wait 5;
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_keepoffme" );
    wait 1;
    level._id_BD7E maps\_utility::dialogue_queue( "inv_tco_hesdown" );
    wait 5;
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_onme" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_gogogo" );
    wait 4;
}

_id_C3A6()
{
    common_scripts\utility::flag_wait( "bmp_north_left_dead" );
    common_scripts\utility::flag_wait( "bmp_north_mid_dead" );
    var_0 = getent( "diner_backdoor_fight_area", "targetname" );
    var_0 maps\_utility::waittill_volume_dead();

    if ( common_scripts\utility::flag( "leaving_diner" ) )
        return;

    level endon( "leaving_diner" );

    for (;;)
    {
        wait 2;
        maps\_utility::radio_dialogue( "inv_six_regroup" );
        wait 15;
        maps\_utility::radio_dialogue( "inv_six_regroupinrest" );
        wait 15;
    }
}

_id_CBC4( var_0 )
{
    if ( isdefined( level._id_C9E1 ) )
        return;

    var_1 = getent( "wells", "script_noteworthy" );
    level._id_C9E1 = var_1 maps\_utility::spawn_ai();

    if ( isdefined( var_0 ) )
    {
        wait 0.5;
        level._id_C9E1 maps\_utility::teleport_ent( var_0 );
        level._id_C9E1 setgoalpos( var_0.origin );
    }
}

spawn_president()
{
    if ( isdefined( level.president ) )
        return;

    var_0 = getent( "president", "script_noteworthy" );
    level.president = var_0 maps\_utility::spawn_ai();
}

_id_ACBC()
{
    self.has_no_ir = 1;
    level.president = self;
    thread maps\_utility::magic_bullet_shield();
    var_0 = getent( "president_in_nates_meat_locker", "targetname" );
    thread _id_AE35::_id_CC94( var_0 );
    common_scripts\utility::flag_wait( "move_president_to_prep" );
    var_0 notify( "stop_wounded_idle" );
    var_0 = getent( "president_in_nates_prep", "targetname" );
    _id_AE35::_id_CC94( var_0 );
}

_id_ADF7()
{
    common_scripts\utility::flag_wait( "house_destroyer_unloading" );
    maps\_utility::autosave_by_name( "unloading" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_grabrpg" );
}

_id_C5F9()
{
    maps\_utility::radio_dialogue( "inv_tco_incomingnorth" );
    maps\_utility::radio_dialogue( "inv_tco_contactnorth" );
}

_id_CCEC()
{
    maps\_utility::radio_dialogue( "inv_tco_incomingsouth" );
    maps\_utility::radio_dialogue( "inv_tco_contactsouth" );
}

_id_CEDE()
{
    wait 12;
    maps\_utility::radio_dialogue( "inv_six_2dozen" );
}

_id_BB48()
{
    maps\invasion_aud::_id_C7D5();
    maps\invasion_aud::_id_B965( "inv_gm1_eastof95" );
    maps\invasion_aud::_id_B965( "inv_gm2_airsupport" );
    maps\invasion_aud::_id_B965( "inv_gm3_cutoff" );
    maps\invasion_aud::_id_B965( "inv_gm4_brokenarrow" );
    maps\invasion_aud::_id_B965( "inv_gm1_495and50" );
}

_id_C3D2()
{
    level endon( "player_on_roof" );
    level endon( "crash_objective" );
    common_scripts\utility::flag_wait( "player_shooting_nates" );
    level._id_CE19 thread maps\_utility::dialogue_queue( "inv_six_purplebuilding" );
}

_id_BF50()
{
    maps\_utility::radio_dialogue( "inv_six_onme" );
    maps\_utility::radio_dialogue( "inv_six_gogogo" );
}

_id_BF03()
{
    var_0 = 1;
    level endon( "crash_objective" );
    common_scripts\utility::flag_wait( "raptor_at_crash_site" );

    for (;;)
    {
        wait 10;

        if ( var_0 )
        {
            maps\_utility::radio_dialogue( "inv_six_crashsite" );
            var_0 = 0;
            continue;
        }

        maps\_utility::radio_dialogue( "inv_six_northofnates" );
        var_0 = 1;
    }
}

_id_D3DF()
{
    wait 1;
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread _id_CEE9( "bmp_out_of_sight" );

    wait 5;
    common_scripts\utility::flag_set( "bmp_out_of_sight" );
}

_id_CEE9( var_0 )
{
    self endon( "death" );
    wait(randomfloatrange( 0, 0.5 ));
    self allowedstances( "prone" );
    var_1 = self.goalpos;
    maps\_anim::anim_generic_custom_animmode( self, "gravity", "pronehide_dive" );
    common_scripts\utility::flag_wait( var_0 );
    wait(randomfloatrange( 0, 0.5 ));
    self allowedstances( "stand", "prone", "crouch" );
}

_id_C2E8()
{
    var_0 = getvehiclenode( "friendlies_move_to_alley", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "btr_backed_away" );
    level._id_AE47 notify( "backed_away" );
    maps\_utility::activate_trigger_with_targetname( "friendlies_hide_in_alley" );
}

_id_C26E()
{
    while ( !common_scripts\utility::flag( "bmps_from_north_dead" ) )
    {
        level waittill( "player_fired_remote_missile" );
        var_0 = level._id_BACA;
        level waittill( "remote_missile_exploded" );
        wait 1;

        if ( !( level._id_BACA > var_0 ) )
        {
            level._id_B8E6 = gettime();
            level.player thread maps\_utility::hintdisplayhandler( "hint_steer_drone" );
        }
    }
}

_id_CC33()
{
    level endon( "leaving_diner" );
    var_0 = getent( "diner_backdoor_fight_area", "targetname" );
    var_0 maps\_utility::waittill_volume_dead();
    wait 2;
}

_id_BCD9()
{
    level endon( "bmps_from_north_dead" );
    _id_CC33();

    if ( common_scripts\utility::flag( "bmps_from_north_dead" ) )
        return;

    maps\_utility::radio_dialogue( "inv_six_neutralizearmor" );
    level.player thread maps\_utility::display_hint( level.player _id_BC84( "hint_predator_drone_vs_bmps" ) );
    thread _id_C26E();
    wait 25;

    for (;;)
    {
        if ( common_scripts\utility::flag( "bmp_north_left_dead" ) || common_scripts\utility::flag( "bmp_north_mid_dead" ) )
        {
            var_0 = randomint( 3 );

            if ( var_0 == 0 )
            {
                _id_D0C0( "inv_six_stillonebmp" );
                level.player thread maps\_utility::display_hint( level.player _id_BC84( "hint_predator_drone_vs_bmps" ) );
            }
            else if ( var_0 == 1 )
            {
                _id_D0C0( "inv_six_wastethatbmpnow" );
                level.player thread maps\_utility::display_hint( level.player _id_BC84( "hint_predator_drone_vs_bmps" ) );
            }
            else
            {
                _id_D0C0( "inv_six_neutralizearmor" );
                level.player thread maps\_utility::display_hint( level.player _id_BC84( "hint_predator_drone_vs_bmps" ) );
            }
        }
        else if ( common_scripts\utility::cointoss() )
        {
            _id_D0C0( "inv_six_wastebmpsnow" );
            level.player thread maps\_utility::display_hint( level.player _id_BC84( "hint_predator_drone_vs_bmps" ) );
        }
        else
        {
            _id_D0C0( "inv_six_destroyapcs" );
            level.player thread maps\_utility::display_hint( level.player _id_BC84( "hint_predator_drone_vs_bmps" ) );
        }

        wait 25;
    }
}

_id_D0C0( var_0 )
{
    if ( common_scripts\utility::flag( "nates_bomb_incoming" ) && !common_scripts\utility::flag( "nates_bombed" ) )
        return;

    maps\_utility::radio_dialogue( var_0 );
}

_id_D505()
{
    level endon( "crash_objective" );
    var_0 = getvehiclenode( "dont_engage_dialog", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    var_1 maps\_utility::waittill_player_lookat_for_time( 0.4, 0.99 );
    level._id_CE19 thread maps\_utility::dialogue_queue( "inv_six_dontengageapc" );
}

_id_B8CB()
{
    maps\_utility::radio_dialogue( "inv_six_bmpsfromnorth" );
    maps\_utility::radio_dialogue( "inv_tco_rogerthat" );
}

_id_CADB()
{
    if ( common_scripts\utility::flag( "burger_town_lower_cleared" ) )
        return;

    level endon( "burger_town_lower_cleared" );
    wait 60;

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "player_in_burgertown" );
        maps\_utility::radio_dialogue( "inv_six_hostilesinbt" );
        wait 20;
        common_scripts\utility::flag_waitopen( "player_in_burgertown" );
        maps\_utility::radio_dialogue( "inv_six_needtomove" );
        wait 20;
        common_scripts\utility::flag_waitopen( "player_in_burgertown" );
        maps\_utility::radio_dialogue( "inv_six_whatsholdup" );
        wait 20;
    }
}

_id_C598()
{
    var_0 = "friendly_redshirt_rpg_BT_spawners";
    var_1 = getentarray( var_0, "targetname" );
    var_2 = 5;

    while ( var_2 > 0 )
    {
        var_3 = common_scripts\utility::getfarthest( level.player.origin, var_1 );
        var_3.count = 1;
        var_4 = var_3 maps\_utility::spawn_ai();
        var_2--;

        if ( isalive( var_4 ) )
        {
            var_4 waittill( "death" );
            continue;
        }

        wait 1;
    }
}

_id_C80E()
{
    self._id_C954 = 1;
    thread _id_B4C5();
    self.ignored_by_attack_heli = 1;
    thread maps\_utility::magic_bullet_shield();
    maps\_utility::waittill_entity_in_range( level.player, 600 );
    self.ignored_by_attack_heli = undefined;
    thread maps\_utility::stop_magic_bullet_shield();
    self endon( "death" );

    while ( !isalive( level._id_B801 ) )
        wait 1;

    self.combatmode = "no_cover";
    self setentitytarget( level._id_B801 );
    wait 1;
    self.combatmode = "no_cover";

    while ( isalive( level._id_B801 ) )
        wait 1;

    self clearentitytarget();
}

_id_A9F8( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 3;

    if ( common_scripts\utility::flag( "president_in_BT_meat_locker" ) )
        var_1 = "redshirt_spawn_group_BT";
    else
        var_1 = "redshirt_spawn_group";

    var_2 = common_scripts\utility::getstructarray( var_1, "targetname" );
    var_3 = common_scripts\utility::getfarthest( level.player.origin, var_2 );
    var_4 = getentarray( var_3.target, "targetname" );
    var_5 = [];

    foreach ( var_7 in var_4 )
    {
        if ( var_5.size < var_0 )
        {
            var_7.count = 1;
            var_5[var_5.size] = var_7 maps\_utility::spawn_ai();
        }
    }

    return var_5;
}

_id_B907( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_C589 )
    {
        if ( isalive( var_3 ) )
            var_1[var_1.size] = var_3;
    }

    var_5 = var_0 - var_1.size;
    var_6 = [];

    if ( var_5 > 0 )
        var_6 = _id_A9F8( var_5 );

    var_7 = maps\_utility::array_merge( var_1, var_6 );
    return var_7;
}

_id_D0B6()
{
    common_scripts\utility::flag_wait( "leaving_diner" );
    var_0 = getnode( "taco_in_BT", "script_noteworthy" );
    var_1 = var_0.origin;
    var_2 = getent( "BT_goal_volume", "targetname" );
    level._id_BD7E thread _id_AB34( "player_in_burgertown", var_1, var_2 );
    var_3 = 3;
    level._id_C589 = _id_B907( var_3 );

    foreach ( var_5 in level._id_C589 )
        var_5 thread _id_AB34( "player_in_burgertown", var_1, var_2 );
}

_id_D172()
{
    common_scripts\utility::flag_waitopen( "player_on_roof" );
    wait 2;
    common_scripts\utility::flag_waitopen( "player_inside_nates" );
    var_0 = getent( "diner_goal_volume", "targetname" );
    var_1 = getent( "predator_drone_control", "targetname" ).origin;
    level._id_BD7E thread _id_AB34( "player_in_diner", var_1, var_0 );
    level._id_C589 = _id_A9F8( 3 );

    foreach ( var_3 in level._id_C589 )
        var_3 thread _id_AB34( "player_in_diner", var_1, var_0 );
}

_id_B9AE( var_0, var_1 )
{
    self endon( "stop_barney" );
    self endon( "death" );
    self cleargoalvolume();
    self.goalheight = 80;
    self.goalradius = 100;
    self.fixednode = 0;
    smart_barney_goal_offset( 1 );

    while ( !common_scripts\utility::flag( "president_in_BT_meat_locker" ) )
    {
        var_2 = level._id_CE19.origin;
        smart_barney_goal( var_2, var_0 );

        if ( !isdefined( self.favoriteenemy ) )
            self.favoriteenemy = maps\_utility::get_closest_ai( self.origin, "axis" );

        wait 0.5;
    }

    self setgoalpos( var_0 );
    self setgoalvolume( var_1 );
}

_id_D3A5()
{
    self notify( "stop_adjust_movement_speed" );
    self endon( "death" );
    self endon( "stop_adjust_movement_speed" );

    for (;;)
    {
        wait(randomfloatrange( 0.5, 1.5 ));

        while ( _id_CFAC() )
        {
            self.moveplaybackrate = 2.5;
            wait 0.05;
        }

        self.moveplaybackrate = 1.0;
    }
}

_id_CFAC()
{
    if ( distancesquared( self.origin, self.goalpos ) <= level._id_B964 )
        return 0;

    if ( common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), self.origin, level.cosine["60"] ) )
        return 0;

    return 1;
}

_id_CBEE()
{
    level._id_BD7E.goalradius = 128;
    level._id_BD7E.goalheight = 64;
    level._id_BD7E setgoalnode( getnode( "taco_on_BT_roof", "script_noteworthy" ) );
    common_scripts\utility::flag_wait( "president_in_BT_meat_locker" );
    level._id_BD7E.goalradius = 1024;
}

_id_C3B3()
{
    var_0 = getent( "predator_drone_control", "targetname" );
    var_0 show();
    var_0 maps\_utility::glow();
    var_0 setcursorhint( "HINT_NOICON" );
    var_0 thread common_scripts\utility::_id_AE1E( level.player, &"INVASION_DRONE_PICKUP", &"INVASION_DRONE_PICKUP_PC", "trigger" );
    var_0 makeusable();
    var_0 waittill( "trigger", var_1 );
    var_0 playsound( "scn_invasion_controlrig_pickup" );
    thread _id_BA5B();
    var_0 maps\_utility::stopglow();
}

_id_BA5B()
{
    common_scripts\utility::flag_set( "player_has_predator_drones" );
    thread _id_CF6C();
    level.player.remotemissile_lowerbound_limit = ( -16640.0, -12320.0, 1120.0 );
    level.player.remotemissile_upperbound_limit = ( 17168.0, 3896.0, 14920.0 );
    level.player _id_C630::_id_AEC2( "remote_missile_detonator" );
    var_0 = getent( "predator_drone_control", "targetname" );
    var_0 hide();
    var_0 makeunusable();
}

_id_B14C()
{
    self waittill( "trigger" );
    common_scripts\utility::flag_set( "smoke_screen_starting" );
    playfx( common_scripts\utility::getfx( "smokescreen" ), self.origin );
    thread common_scripts\utility::play_sound_in_space( "h1_wpn_smoke_pop" );
}

_id_C077()
{
    common_scripts\utility::flag_wait( "smoke_screen_starting" );
    wait 7;
    maps\_utility::radio_dialogue( "inv_tco_usingsmoke" );
    wait 1;
    maps\_utility::radio_dialogue( "inv_six_thermaloptics" );
}

_id_B39E()
{
    var_0 = 1;
    common_scripts\utility::flag_wait( "player_in_diner" );
    common_scripts\utility::flag_wait( "back_door_attack_start" );
    wait 4;
    var_1 = getent( "diner_backdoor_fight_area", "targetname" );
    var_1 maps\_utility::waittill_volume_dead();
    wait 4;

    while ( !common_scripts\utility::flag( "player_has_predator_drones" ) )
    {
        if ( var_0 )
        {
            level._id_BD7E maps\_utility::dialogue_queue( "inv_tco_controlrig" );
            var_0 = 0;
        }
        else
        {
            level._id_BD7E maps\_utility::dialogue_queue( "inv_tco_pickupcontrolrig" );
            var_0 = 1;
        }

        wait 15;
    }
}

_id_ABA8()
{
    if ( common_scripts\utility::flag( "taco_goes_to_roof" ) )
        return;

    level endon( "taco_goes_to_roof" );
    common_scripts\utility::flag_set( "obj_regroup_nates_bombed" );
    wait 3;
    maps\_utility::radio_dialogue( "inv_tco_stillthere" );
    wait 1;
    maps\_utility::radio_dialogue( "inv_six_newplan" );
    maps\_utility::radio_dialogue( "inv_six_secureburgertown" );
    common_scripts\utility::flag_set( "time_to_clear_burgertown" );
    maps\_utility::radio_dialogue( "inv_six_listenup" );
    maps\_utility::radio_dialogue( "inv_six_anotherpass" );
    common_scripts\utility::flag_set( "nates_bombed" );
}

_id_ADC7()
{
    wait 4.5;

    if ( common_scripts\utility::flag( "player_on_roof" ) )
        maps\_utility::radio_dialogue( "inv_wrm_whatwasthat" );

    wait 1;

    while ( common_scripts\utility::flag( "player_on_roof" ) )
    {
        var_0 = randomint( 3 );

        if ( var_0 == 0 )
            maps\_utility::radio_dialogue( "inv_six_offtheroof" );

        if ( var_0 == 1 )
            maps\_utility::radio_dialogue( "inv_six_getoffroof2" );

        if ( var_0 == 2 )
            maps\_utility::radio_dialogue( "inv_six_getoffroofnow" );

        wait(randomfloatrange( 1, 2 ));
    }
}

_id_ACEC()
{
    thread _id_CE8D();
    level endon( "player_on_roof" );
    level.player endon( "death" );
    var_0 = getentarray( "hellfire_attack_target", "targetname" );
    var_1 = maps\_utility::get_closest_to_player_view( var_0 );
    var_2 = _id_AC12( var_1.origin );
    wait(randomfloatrange( 3, 5 ));
    var_3 = common_scripts\utility::array_remove( var_0, var_1 );
    var_4 = maps\_utility::get_closest_to_player_view( var_3 );
    var_2 = _id_AC12( var_4.origin );
    wait(randomfloatrange( 3, 5 ));
    var_3 = common_scripts\utility::array_remove( var_0, var_4 );
    var_4 = var_3[randomint( var_3.size )];
    var_2 = _id_AC12( var_4.origin );
    wait(randomfloatrange( 3, 5 ));
    var_3 = common_scripts\utility::array_remove( var_0, var_4 );
    var_4 = var_3[randomint( var_3.size )];
    var_2 = _id_AC12( var_4.origin );
    wait(randomfloatrange( 3, 5 ));

    if ( common_scripts\utility::flag( "player_on_roof" ) )
    {
        var_5 = level.player.origin;
        var_2 = _id_AC12( var_5 );

        while ( isdefined( var_2 ) )
            wait 0.05;

        if ( common_scripts\utility::flag( "player_on_roof" ) )
            level.player dodamage( level.player.health + 1000, var_5 );
    }
}

_id_AC12( var_0 )
{
    var_1 = magicbullet( "remote_missile_not_player_invasion", level._id_C176.origin + ( 0.0, 0.0, -128.0 ), var_0 );
    var_1 thread maps\_utility::play_sound_on_tag_endon_death( "move_remotemissile_proj_flame" );
    return var_1;
}

_id_CE8D()
{
    wait 0.2;
    common_scripts\utility::flag_waitopen( "player_on_roof" );
    var_0 = getentarray( "ceiling_dust", "targetname" );

    if ( _id_BA11() )
    {
        level waittill( "hellfire" );
        var_1 = level._id_AB47.origin;
        var_2 = magicbullet( "remote_missile_not_player_invasion", level._id_C176.origin + ( 0.0, 0.0, -128.0 ), var_1 );
        common_scripts\utility::array_thread( var_0, ::_id_D4E1 );

        while ( isdefined( var_2 ) )
            wait 0.05;

        level._id_AB47 notify( "deleted" );
        level._id_AB47 delete();
    }

    var_3 = getentarray( "hellfire_attack_target_roof", "targetname" );

    for (;;)
    {
        level waittill( "hellfire" );
        var_4 = var_3[randomint( var_3.size )];
        var_5 = var_4.origin;
        var_2 = _id_AC12( var_5 );
        common_scripts\utility::array_thread( var_0, ::_id_D4E1 );
    }
}

_id_BA11()
{
    if ( isdefined( level.player.placingsentry ) )
        return 0;

    if ( !isdefined( level._id_AB47 ) )
        return 0;

    var_0 = getent( "roof_volume", "targetname" );

    if ( level._id_AB47 istouching( var_0 ) )
        return 1;
    else
        return 0;
}

_id_D4E1()
{
    wait 3;
    playfx( common_scripts\utility::getfx( "ceiling_dust" ), self.origin );
}

_id_B4F0()
{
    level notify( "hellfire" );
    wait 4;
    maps\_utility::radio_dialogue( "inv_tco_uavop" );
    maps\_utility::radio_dialogue( "inv_tco_uavop2" );
    maps\_utility::radio_dialogue( "inv_six_killthatsob" );
    maps\_utility::radio_dialogue( "inv_six_killthatsob2" );
    level notify( "hellfire" );
    common_scripts\utility::flag_set( "time_to_go_get_UAV_control" );

    if ( common_scripts\utility::flag( "player_inside_nates" ) )
        maps\_utility::autosave_by_name( "go_to_diner2" );

    wait 3;
    level notify( "hellfire" );
    wait 4;
}

_id_AF11()
{
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "gas_station_truck" );
    var_0 _meth_85C1( 0.05 );
    var_0 thread maps\invasion_aud::_id_CA7A();
    wait 4;
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_truck12" );
}

_id_D0E3()
{
    wait 2;

    if ( isalive( level._id_AE47 ) )
    {
        level notify( "dialog_bmp_hasnt_spotted_us" );
        level._id_CE19 maps\_utility::dialogue_queue( "inv_six_hangright" );
    }

    if ( isalive( level._id_AE47 ) )
        level._id_CE19 maps\_utility::dialogue_queue( "inv_six_staybehind" );
}

_id_ABB8()
{
    common_scripts\utility::flag_wait( "take_point" );
    var_0 = getent( "tangled_parachute_guy", "script_noteworthy" );
    var_1 = var_0 maps\_utility::spawn_ai();
}

_id_C2AF()
{
    common_scripts\utility::flag_wait( "wells_intro_done" );
    level endon( "player_on_roof" );
    wait 5;

    while ( !common_scripts\utility::flag( "player_on_roof" ) )
    {
        if ( common_scripts\utility::flag( "truck_guys_retreat" ) )
            return;

        if ( common_scripts\utility::cointoss() )
            maps\_utility::radio_dialogue( "inv_six_ladderinkitchen" );
        else
            maps\_utility::radio_dialogue( "inv_six_gettoroof" );

        wait 15;
    }
}

_id_CC58()
{
    var_0 = getnode( "meat_locker_taco", "script_noteworthy" );
    level._id_BD7E maps\_utility::disable_ai_color();
    level._id_BD7E setgoalnode( var_0 );
    level._id_BD7E.goalradius = 16;
}

_id_A81F()
{
    var_0 = getnode( "wells_kitchen", "targetname" );

    if ( isalive( level._id_C9E1 ) )
    {
        level._id_C9E1 maps\_utility::disable_ai_color();
        level._id_C9E1 setgoalnode( var_0 );
        level._id_C9E1.goalradius = 64;
        level._id_C9E1.fixednode = 1;
    }

    var_1 = getnode( "raptor_kitchen", "targetname" );
    level._id_CE19 maps\_utility::disable_ai_color();
    level._id_CE19 setgoalnode( var_1 );
    level._id_CE19.goalradius = 64;
    level._id_CE19.fixednode = 1;

    if ( isalive( level._id_BBCC ) )
    {
        var_2 = getnode( "worm_inside", "script_noteworthy" );
        level._id_BBCC maps\_utility::disable_ai_color();
        level._id_BBCC setgoalnode( var_2 );
        level._id_BBCC.goalradius = 190;
        level._id_BBCC.fixednode = 0;
    }
}

_id_C15D()
{
    var_0 = level.player getweaponammostock( "smoke_grenade_american" );

    if ( var_0 < 1 )
        return 0;
    else
        return 1;
}

_id_C266()
{
    if ( common_scripts\utility::flag( "threw_smoke" ) )
        return 1;
    else
        return 0;
}

_id_AEC9()
{
    level endon( "btr_smoke_starting" );
    level endon( "entered_alley" );
    var_0 = [];
    var_0[var_0.size] = "inv_six_rpgsupplydrop";
    var_0[var_0.size] = "inv_six_pickup";
    var_0[var_0.size] = "inv_six_getmore";
    var_1 = 0;
    var_2 = [];
    var_2[var_2.size] = "inv_six_throwsemtex";
    var_2[var_2.size] = "inv_six_getsemtex";
    var_2[var_2.size] = "inv_six_destroy";
    var_3 = 0;
    common_scripts\utility::flag_wait( "house_destroyer_unloading" );
    wait 4;
    level._id_AE47 endon( "backed_away" );

    for (;;)
    {
        var_4 = level.player getweaponammostock( "smoke_grenade_american" );

        if ( var_4 )
        {
            if ( !common_scripts\utility::flag( "threw_smoke" ) )
            {
                thread _id_B506();
                level._id_CE19 maps\_utility::dialogue_queue( var_2[var_3] );
                var_3++;

                if ( var_3 >= var_2.size )
                    var_3 = 0;

                level.player thread maps\_utility::display_hint_timeout( "hint_throw_smoke", 5 );
            }
        }
        else
        {
            level.player thread maps\_utility::display_hint_timeout( "hint_get_smoke", 5 );
            level._id_CE19 maps\_utility::dialogue_queue( var_0[var_1] );
            var_1++;

            if ( var_1 >= var_0.size )
                var_1 = 0;
        }

        wait 10;
    }
}

_id_B506()
{
    common_scripts\utility::flag_clear( "threw_smoke" );

    for (;;)
    {
        level.player waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "smoke_grenade_american" )
            break;
    }

    common_scripts\utility::flag_set( "threw_smoke" );
    wait 5;
    common_scripts\utility::flag_clear( "threw_smoke" );
}

_id_CB1A()
{
    level endon( "btr_smoke_starting" );
    thread _id_ABFC();
    var_0 = getvehiclenode( "house_destroyer_backwards_path", "targetname" ).origin;

    for (;;)
    {
        level.player waittill( "grenade_fire", var_1, var_2 );

        if ( var_2 == "smoke_grenade_american" )
        {
            var_3 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
            var_1 thread _id_C4A1( var_3 );
            var_1 thread _id_AAC0( var_3, var_0 );
        }
    }
}

_id_C4A1( var_0 )
{
    level endon( "btr_smoked" );
    self endon( "death" );

    for (;;)
    {
        var_0.origin = self.origin;
        wait 0.05;
    }
}

_id_AAC0( var_0, var_1 )
{
    level endon( "btr_smoke_starting" );
    self waittill( "death" );

    if ( distance( var_0.origin, var_1 ) < 400 )
        thread _id_C40B();
    else
        level notify( "btr_smoke_too_far" );
}

_id_ABFC()
{
    if ( common_scripts\utility::flag( "house_destroyer_moving_back" ) )
        return;

    level endon( "house_destroyer_moving_back" );
    level waittill( "btr_smoke_too_far" );

    if ( !common_scripts\utility::flag( "btr_smoke_starting" ) )
        maps\_utility::display_hint_timeout( "hint_smoke_too_far", 5 );
}

_id_B4D1()
{
    if ( common_scripts\utility::flag( "btr_smoke_starting" ) )
        return 1;
    else
        return 0;
}

_id_C40B()
{
    common_scripts\utility::flag_set( "btr_smoke_starting" );
    wait 10;
    maps\_utility::autosave_by_name( "btr_smoked" );
    common_scripts\utility::flag_set( "btr_smoked" );
    maps\_utility::activate_trigger_with_targetname( "friendlies_hide_in_alley" );
    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_coverofsmoke" );
    wait 5;

    if ( common_scripts\utility::flag( "entered_alley" ) )
        return;

    level._id_CE19 maps\_utility::dialogue_queue( "inv_six_cometoalley" );
}

_id_BA25()
{
    var_0 = getent( "diner_window_traverses", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 disconnectpaths();
    common_scripts\utility::flag_wait( "crash_objective" );
    var_0 movez( -1000, 0.1, 0, 0 );
    var_0 connectpaths();
}

_id_D039()
{
    level._id_CBEA++;
    level._id_ACA2++;
    self waittill( "death" );
    level._id_D039++;
    level._id_ACA2--;
    level notify( "truck_guy_died" );
}

_id_A942()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "truck_guys_retreat" );

    if ( isdefined( self.target ) )
        self setgoalpos( getent( self.target, "targetname" ).origin );
    else
        self setgoalpos( getent( "truck_guy_retreat_goal", "targetname" ).origin );

    self.goalradius = 32;
    self waittill( "goal" );

    while ( self cansee( level.player ) )
        wait 1;

    self kill();
}

_id_BAB2()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "bank_guys_retreat" );
    self setgoalpos( getent( "north_trucks_retreat_point", "targetname" ).origin );
    self.ignoreme = 1;
    self.goalradius = 32;
    self waittill( "goal" );

    while ( self cansee( level.player ) )
        wait 1;

    self kill();
}

_id_D596()
{
    level endon( "sentry_in_position" );
    self waittill( "death" );
    setdvar( "ui_deadquote", &"INVASION_FAIL_SENTRY" );
    maps\_utility::missionfailedwrapper();
}

_id_AAFE()
{
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "first_fast_movers" );
    wait 7;
    common_scripts\utility::flag_wait( "wells_intro_done" );
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "first_fast_movers" );
}

_id_BFED()
{
    var_0 = thread maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "crash_objective_bmp" );
    var_0 maps\_vehicle::godon();
    var_0 thread _id_C61B();
    var_0 thread maps\_vehicle_code::damage_hints();
    var_0 endon( "death" );
    var_1 = getent( "west_side", "targetname" );
    var_0 setturrettargetvec( var_1.origin );
    var_2 = getvehiclenode( "first_volley_at_nates", "script_noteworthy" );
    var_2 waittill( "trigger" );
    var_0 _id_C3FD();
    var_2 = getvehiclenode( "crash_obj_bmp_in_pos", "script_noteworthy" );
    var_2 waittill( "trigger" );
    var_0 vehicle_setspeed( 0, 15, 3 );
    var_0 _id_B3D4();
    var_0 resumespeed( 3 );
    var_0 maps\_vehicle::godoff();
    var_0 thread _id_A928();
    var_0 waittill( "reached_end_node" );
    var_0 thread _id_C649( 0, 0 );
    common_scripts\utility::flag_wait( "crash_objective" );
    var_0 delete();
}

_id_B26F()
{
    level._id_D31A = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "nate_attacker_mid" );
    level._id_C477 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "nate_attacker_left" );
    common_scripts\utility::array_thread( getvehiclenodearray( "new_target", "script_noteworthy" ), ::_id_AC74 );
    var_0 = [];
    var_0[var_0.size] = level._id_D31A;
    var_0[var_0.size] = level._id_C477;
    level.btr_kill_no_predator = 0;
    common_scripts\utility::array_thread( var_0, ::btr_silent_skies_monitor_damage );
    thread btr_silent_skies_manager();
    thread _id_D020();
    thread _id_B19F();
    thread _id_CF94();

    foreach ( var_2 in var_0 )
    {
        var_2 thread _id_C2EB();
        var_2 thread _id_BCA1::_id_CFA0();
        var_2 thread _id_CC78();
        var_2 thread maps\_utility::ent_flag_init( "spotted_player" );
        var_2 thread _id_C61B();
        var_2 thread maps\_vehicle_code::damage_hints();
    }

    return var_0;
}

_id_D020()
{
    for (;;)
    {
        level waittill( "starting_predator_drone_control" );
        var_0 = [];

        if ( isalive( level._id_D31A ) )
            var_0[var_0.size] = level._id_D31A;

        if ( isalive( level._id_C477 ) )
            var_0[var_0.size] = level._id_C477;

        if ( var_0.size == 0 )
        {
            level._id_CCF2 = undefined;
            return;
        }

        if ( var_0.size > 1 )
        {
            level._id_CCF2 = maps\_utility::get_closest_to_player_view( var_0 );
            continue;
        }

        level._id_CCF2 = var_0[0];
    }
}

_id_CC78()
{
    self waittill( "death" );

    if ( maps\_utility::ent_flag( "spotted_player" ) )
        common_scripts\utility::flag_clear( "bmp_has_spotted_player" );

    level notify( "bmp_died" );
    level._id_BACA++;
}

_id_B19F()
{
    level endon( "player_has_predator_drones" );
    var_0 = randomint( 3 );

    for (;;)
    {
        common_scripts\utility::flag_wait( "bmp_has_spotted_player" );

        switch ( var_0 )
        {
            case 0:
                _id_D279( "inv_six_bmpspottedyou" );
                break;
            case 1:
                _id_D279( "inv_six_bmphasavisual" );
                break;
            case 2:
                _id_D279( "inv_six_behindsolid" );
                break;
        }

        var_0++;

        if ( var_0 > 2 )
            var_0 = 0;

        wait 10;
    }
}

_id_D279( var_0 )
{
    if ( common_scripts\utility::flag( "player_in_diner" ) )
        return;

    if ( common_scripts\utility::flag( "player_in_burgertown" ) )
        return;

    if ( common_scripts\utility::flag( "player_on_burgertown_roof" ) )
        return;

    maps\_utility::radio_dialogue( var_0 );
}

_id_D250()
{
    level endon( "player_has_predator_drones" );
    level.player endon( "death" );
    var_0 = 10;

    for (;;)
    {
        common_scripts\utility::flag_wait( "bmp_has_spotted_player" );
        _id_C7BF( "inv_six_bmplostyou" );
        wait(var_0);
        common_scripts\utility::flag_wait( "bmp_has_spotted_player" );
        _id_C7BF( "inv_six_bmplostyoumove" );
        wait(var_0);
        common_scripts\utility::flag_wait( "bmp_has_spotted_player" );
        _id_C7BF( "inv_six_bmplostyougo" );
        wait(var_0);
    }
}

_id_C7BF( var_0 )
{
    level endon( "bmp_died" );
    common_scripts\utility::flag_waitopen( "bmp_has_spotted_player" );
    wait 4;
    common_scripts\utility::flag_waitopen( "bmp_has_spotted_player" );
    maps\_utility::radio_dialogue( var_0 );
}

_id_C2EB()
{
    self endon( "death" );
    self._id_BF01 = 0;

    for (;;)
    {
        wait 0.05;

        if ( common_scripts\utility::flag( "player_inside_nates" ) )
            continue;

        if ( common_scripts\utility::flag( "player_in_diner" ) )
            continue;

        if ( common_scripts\utility::flag( "bmp_has_spotted_player" ) )
            continue;

        if ( distance( self.origin, level.player.origin ) > 2400 )
            continue;

        if ( distance( self.origin, level.player.origin ) < level._id_B34F )
            continue;

        var_0 = self gettagangles( "tag_flash" );

        if ( !common_scripts\utility::within_fov( self.origin, var_0, level.player.origin, level.cosine["25"] ) )
            continue;

        if ( !can_see_player( level.player ) )
            continue;

        common_scripts\utility::flag_set( "bmp_has_spotted_player" );
        self notify( "new_target" );
        self._id_BF01 = 1;
        maps\_utility::ent_flag_set( "spotted_player" );
        miss_player( level.player );
        wait(randomfloatrange( 0.8, 2.4 ));
        miss_player( level.player );
        wait(randomfloatrange( 0.8, 2.4 ));

        while ( can_see_player( level.player ) )
        {
            _id_C450( level.player );
            wait(randomfloatrange( 2, 3 ));
        }

        self clearturrettargetent();
        self._id_BF01 = 0;
        maps\_utility::ent_flag_clear( "spotted_player" );
        common_scripts\utility::flag_clear( "bmp_has_spotted_player" );
    }
}

_id_AC74()
{
    level endon( "bmps_from_north_dead" );
    var_0 = getentarray( self.script_linkto, "script_linkname" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isalive( var_1 ) )
            return;

        if ( var_1._id_BF01 )
            continue;

        var_1 notify( "new_target" );
        var_1 setturrettargetent( var_0[0] );
        thread _id_AB2A( var_1 );
    }
}

_id_AB2A( var_0 )
{
    var_0 endon( "new_target" );
    var_0 endon( "death" );
    var_0 waittill( "turret_on_target" );

    for (;;)
    {
        var_1 = randomintrange( 4, 6 );

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            var_0 fireweapon();
            wait 0.2;
        }

        wait(randomfloatrange( 1, 2 ));
    }
}

_id_ADDD()
{
    self endon( "death" );
    var_0 = getent( "nates_restaurant_goal", "targetname" );
    self cleargoalvolume();
    self.goalheight = 100;
    maps\_utility::enable_danger_react( 5 );
    self setgoalpos( var_0.origin );
    self.goalradius = 4000;
    self.aggressivemode = 1;
    common_scripts\utility::flag_wait( "truck_guys_retreat" );
    self setgoalpos( getent( "truck_guy_retreat_goal", "targetname" ).origin );
    self.goalradius = 32;
    self waittill( "goal" );

    while ( self cansee( level.player ) )
        wait 1;

    self kill();
}

_id_A989()
{
    self waittill( "jumpedout" );
    self.keepgoalonunload = 1;
    level endon( "truck_guys_retreat" );
    self endon( "death" );
    var_0 = getent( "nates_restaurant_goal", "targetname" );
    self.goalheight = 100;
    maps\_utility::enable_danger_react( 5 );

    if ( randomint( 3 ) > 0 )
    {
        self setgoalpos( var_0.origin );
        self.goalradius = var_0.radius;
        var_1 = randomintrange( 1, 22 );
        wait(var_1);
        self setgoalpos( self.origin );
        self.goalradius = 900;
        wait(randomfloatrange( 2, 4 ));
        self setgoalpos( var_0.origin );
        self.goalradius = var_0.radius;
    }
    else
    {
        self setgoalpos( var_0.origin );
        self.goalradius = 4000;
        thread truck_group_enemies_setup_stay_on_roof( randomfloatrange( 32, 38 ) );
    }
}

truck_group_enemies_setup_stay_on_roof( var_0 )
{
    self endon( "death" );
    self.script_forcegoal = 1;
    self.ignoresuppression = 1;
    wait(var_0);
    self.script_forcegoal = undefined;
    self.ignoresuppression = 0;

    if ( self.goalradius > level.default_goalradius )
        self.goalradius = level.default_goalradius;
}

_id_BC23()
{
    for (;;)
    {
        self waittill( "enemy" );

        if ( isplayer( self.enemy ) )
        {
            self.goalradius = 3000;
            break;
        }
    }
}

_id_D357()
{
    for (;;)
    {
        self waittill( "enemy" );

        if ( isplayer( self.enemy ) )
        {
            self.goalradius = 3000;
            break;
        }
    }
}

_id_A858()
{
    var_0 = getentarray( "closest_goal_radius", "targetname" );
    level._id_CFEA = common_scripts\utility::getclosest( level.player.origin, var_0 );
    level._id_ABAC = [];
    var_1 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_1, ::_id_B481 );
    var_2 = getentarray( "bank_enemies", "targetname" );
    var_3 = getentarray( "gas_station_enemies", "targetname" );
    var_4 = getentarray( "taco_enemies", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_B481 );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_B481 );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::_id_B481 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_AD85 );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_AD85 );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::_id_AD85 );
    thread _id_C521( var_0 );
}

_id_D499()
{
    if ( isdefined( self.damagemod ) && self.damagemod == "MOD_PROJECTILE_SPLASH" && isdefined( self.lastattacker ) && isdefined( self.lastattacker._id_C2F9 ) )
        self.skipdeathanim = 1;

    return 0;
}

_id_AD85()
{
    self.deathfunction = ::_id_D499;
}

_id_C521( var_0 )
{
    for (;;)
    {
        var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );

        if ( level._id_CFEA != var_1 )
        {
            level._id_CFEA = var_1;
            _id_CB52( var_1 );
        }

        wait 1;
    }
}

_id_B481()
{
    self.goalradius = 2048;
    self.goalheight = 512;
    level._id_ABAC[self.unique_id] = self;
    self.keepgoalonunload = 1;
    self setgoalpos( level._id_CFEA.origin );
    self.pathrandompercent = 200;
    maps\_utility::enable_danger_react( 5 );
    self waittill( "death" );
    level._id_ABAC[self.unique_id] = undefined;
}

_id_CB52( var_0 )
{
    waittillframeend;

    foreach ( var_2 in level._id_ABAC )
        var_2 setgoalpos( var_0.origin );
}

_id_ACD2()
{
    self waittill( "death" );
    level._id_C9CC++;
}

_id_BBDA()
{
    self endon( "death" );
    self.aggressivemode = 1;
    self.usechokepoints = 0;
    self waittill( "goal" );
    self.goalradius = 2000;
    self waittill( "goal" );
    self.goalradius = 2000;
}

_id_BD2F()
{
    self endon( "death" );
    self.aggressivemode = 1;
    self.usechokepoints = 0;
    wait 12;
    self.goalradius = 100;
    self.favoriteenemy = level.player;
    self setgoalentity( level.player );
}

_id_C214()
{
    self endon( "death" );
    self.combatmode = "ambush";
    self.grenadeawareness = 0.9;
    common_scripts\utility::flag_wait( "player_in_burgertown" );
    wait 8;
    self.combatmode = "cover";
    self setgoalentity( level.player );
    self.goalradius = 100;
}

_id_B612()
{
    self endon( "death" );
    thread maps\_utility::magic_bullet_shield();
    common_scripts\utility::flag_wait( "player_on_roof" );
    maps\_utility::stop_magic_bullet_shield();
}

_id_AD65()
{
    level._id_C9E1 = self;
    self.animname = "wells";
    thread maps\_utility::magic_bullet_shield();
    level._id_C9E1 setgoalnode( getnode( "wells_intro_node", "targetname" ) );
    level._id_C9E1.goalradius = 16;
    common_scripts\utility::flag_wait( "move_president_to_prep" );
    var_0 = getent( "wells_in_nates_prep", "targetname" );
    level._id_C9E1 setgoalpos( var_0.origin );
}

_id_B4AC()
{
    level._id_BBCC = self;
    self.animname = "worm";
}

_id_A8B0()
{
    level._id_BD7E = self;
    self.animname = "taco";
    thread maps\_utility::magic_bullet_shield();
}

_id_C3CE()
{
    level._id_CE19 = self;
    self.animname = "raptor";
    thread maps\_utility::magic_bullet_shield();
    common_scripts\utility::flag_wait( "move_president_to_prep" );
    level._id_CE19.goalradius = 64;
    var_0 = getent( "raptor_in_nates_prep", "targetname" );
    level._id_CE19 setgoalpos( var_0.origin );
}

_id_CEFE( var_0 )
{
    if ( var_0 == "ambient_paradrop3" )
        return 1;

    if ( var_0 == "ambient_west_group3" )
        return 1;

    if ( var_0 == "ambient_west_group2" )
        return 1;

    return 0;
}

_id_B1F5()
{
    common_scripts\utility::flag_wait_either( "leaving_gas_station", "crash_objective" );
    var_0 = [];
    var_0[var_0.size] = "ambient_paradrop1";
    var_0[var_0.size] = "ambient_paradrop2";
    var_0[var_0.size] = "ambient_paradrop3";
    var_0[var_0.size] = "ambient_west_group3";
    var_0[var_0.size] = "ambient_west_group2";
    var_0[var_0.size] = "ambient_south_group2";
    var_0[var_0.size] = "ambient_south_group3";
    var_0[var_0.size] = "ambient_east_group2";
    var_0[var_0.size] = "ambient_east_group3";
    var_0[var_0.size] = "ambient_north_group1";
    var_0[var_0.size] = "ambient_north_group2";
    var_0[var_0.size] = "ambient_north_group3";
    var_0[var_0.size] = "curved_mig_flight1";
    var_0[var_0.size] = "paradrop_escort";
    var_0 = common_scripts\utility::array_randomize( var_0 );
    var_1 = 0;
    var_2 = [];
    var_2[var_2.size] = "ambient_north_group1";
    var_2[var_2.size] = "ambient_north_group2";
    var_2[var_2.size] = "ambient_north_group3";
    var_3 = [];
    var_3[var_3.size] = "ambient_paradrop2";
    var_3[var_3.size] = "ambient_south_group2";
    var_3[var_3.size] = "ambient_south_group3";
    var_4 = [];
    var_4[var_4.size] = "ambient_paradrop3";
    var_4[var_4.size] = "ambient_west_group3";
    var_4[var_4.size] = "ambient_west_group2";
    var_5 = [];
    var_5[var_5.size] = "ambient_paradrop1";
    var_5[var_5.size] = "ambient_east_group2";
    var_5[var_5.size] = "ambient_east_group3";

    for (;;)
    {
        var_6 = undefined;
        var_7 = undefined;
        var_8 = undefined;

        if ( isdefined( level._id_D05B ) )
        {
            if ( level._id_D05B == "east" )
                var_7 = var_5[randomint( var_5.size )];

            if ( level._id_D05B == "north" )
                var_7 = var_2[randomint( var_2.size )];

            if ( level._id_D05B == "south" )
                var_7 = var_3[randomint( var_3.size )];

            if ( level._id_D05B == "west" && !common_scripts\utility::flag( "player_is_near_houses" ) )
                var_7 = var_4[randomint( var_4.size )];

            if ( isdefined( var_7 ) )
                var_6 = getentarray( var_7, "targetname" );
        }

        if ( !isdefined( var_6 ) )
        {
            if ( var_1 >= var_0.size )
                var_1 = 0;

            var_9 = var_0[var_1];

            if ( common_scripts\utility::flag( "player_is_near_houses" ) && _id_CEFE( var_9 ) )
            {
                var_1++;
                continue;
            }

            var_6 = getentarray( var_0[var_1], "targetname" );
            var_8 = var_1;
            var_1++;
        }

        var_10 = 1;
        var_11 = 0;

        foreach ( var_13 in var_6 )
        {
            if ( var_13.classname == "script_vehicle_antonov" )
                var_11 = 1;

            if ( var_11 )
            {
                if ( var_10 )
                {
                    var_13 thread _id_AB9A( var_10 );
                    var_10 = 0;
                }
                else
                    var_13 thread _id_AB9A();

                continue;
            }

            var_13 thread maps\_vehicle::spawn_vehicle_and_gopath();
        }

        if ( !var_11 )
            var_0 = common_scripts\utility::array_remove( var_0, var_0[var_8] );

        wait 20;

        if ( getdvar( "invasion_minspec" ) == "1" )
            wait 80;
    }
}

_id_CD34()
{
    var_0 = undefined;
    self waittill( "trigger" );
    var_1 = getentarray( self.target, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_2 == 0 )
        {
            var_3 = 1;
            var_1[var_2] thread _id_AB9A( var_3 );
            continue;
        }

        var_1[var_2] thread _id_AB9A();
    }
}

animate_hanging_parachute()
{
    self.animname = "chute";
    maps\_anim::setanimtree();
    self setanim( maps\_utility::getanim( "idle" ), 1 );
}

_id_B1EE()
{
    var_0 = maps\_utility::spawn_anim_model( "bmp_chute_paradrop" );
    var_1 = maps\_utility::spawn_anim_model( "paradrop_cargo_tank_chuteA" );
    var_2 = maps\_utility::spawn_anim_model( "paradrop_cargo_tank_chuteB" );
    var_3 = maps\_utility::spawn_anim_model( "paradrop_cargo_tank_chuteC" );
    var_4 = maps\_utility::spawn_anim_model( "bmp_paradrop" );
    var_4 linkto( self );
    var_0 linkto( self );
    var_1 linkto( self );
    var_2 linkto( self );
    var_3 linkto( self );
    thread maps\_anim::anim_single_solo( var_0, "bmp_chute_paradrop" );
    thread maps\_anim::anim_single_solo( var_1, "paradrop_cargo_tank_chuteA" );
    thread maps\_anim::anim_single_solo( var_2, "paradrop_cargo_tank_chuteB" );
    thread maps\_anim::anim_single_solo( var_3, "paradrop_cargo_tank_chuteC" );
    maps\_anim::anim_single_solo( var_4, "bmp_paradrop" );
    var_0 delete();
    var_1 delete();
    var_2 delete();
    var_3 delete();
    var_4 delete();
}

_id_AB9A( var_0 )
{
    var_1 = thread maps\_vehicle::spawn_vehicle_and_gopath();

    if ( isdefined( var_0 ) )
        var_1 maps\invasion_aud::_id_BB79();

    var_1.script_vehicle_selfremove = 1;
    var_1 maps\_utility::ent_flag_init( "start_drop" );
    var_1 maps\_utility::ent_flag_init( "stop_drop" );
    var_1 endon( "stop_drop" );
    var_2 = 25;
    var_1 maps\_utility::ent_flag_wait( "start_drop" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "drop_bmp" )
    {
        var_1 thread _id_B1EE();
        wait 2;
    }

    for (;;)
    {
        var_3 = maps\_utility::spawn_anim_model( "distant_parachute_guy" );
        var_3 thread _id_BE72( var_1, var_2 );
        var_4 = maps\_utility::spawn_anim_model( "distant_parachute_guy" );
        var_4 thread _id_C19C( var_1, var_2 );
        wait(randomfloatrange( 0.4, 0.8 ));
    }
}

_id_BE72( var_0, var_1 )
{
    self linkto( var_0 );

    if ( common_scripts\utility::cointoss() )
        var_0 thread maps\_anim::anim_single_solo( self, "distant_parachute_guy_left1" );
    else
        var_0 thread maps\_anim::anim_single_solo( self, "distant_parachute_guy_left2" );

    wait(var_1);

    if ( isdefined( self ) )
        self delete();
}

_id_C19C( var_0, var_1 )
{
    self linkto( var_0 );

    if ( common_scripts\utility::cointoss() )
        var_0 thread maps\_anim::anim_single_solo( self, "distant_parachute_guy_right1" );
    else
        var_0 thread maps\_anim::anim_single_solo( self, "distant_parachute_guy_right2" );

    wait(var_1);

    if ( isdefined( self ) )
        self delete();
}

_id_CAE4( var_0 )
{
    level._id_D1BB fireweapon();
    level notify( "latvee_destroyer_fired" );
}

_id_CE51( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self setturrettargetvec( var_0.origin );
        _id_AE49( var_0.origin );
        var_1 = undefined;

        if ( isdefined( var_0.target ) )
            var_1 = getent( var_0.target, "targetname" );

        common_scripts\_exploder::exploder( var_0.script_prefab_exploder );
        wait 0.15;

        if ( !isdefined( var_1 ) )
            break;

        var_0 = var_1;
    }
}

_id_C3FD()
{
    self endon( "death" );
    var_0 = getent( "north_side_low", "targetname" );
    self setturrettargetvec( var_0.origin );
    self waittill( "turret_on_target" );
    _id_CE51( var_0 );
    var_0 = getent( "north_side_high", "targetname" );
    self setturrettargetvec( var_0.origin );
    self waittill( "turret_on_target" );
    _id_CE51( var_0 );
}

_id_A928()
{
    self endon( "reached_end_node" );
    self endon( "death" );
    var_0 = getentarray( "hellfire_attack_target_roof", "targetname" );

    for (;;)
    {
        wait(randomfloatrange( 1, 3 ));
        var_1 = var_0[randomint( var_0.size )];
        self setturrettargetvec( var_1.origin );
        var_2 = randomintrange( 3, 6 );

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            self fireweapon();
            wait 0.2;
        }
    }
}

_id_B08C()
{
    var_0 = getent( "nates_kitchen_ladder_clip", "targetname" );

    for (;;)
    {
        var_0 notsolid();
        common_scripts\utility::flag_wait( "player_on_roof" );

        while ( level.player istouching( var_0 ) )
            wait 1;

        var_0 solid();
        common_scripts\utility::flag_waitopen( "player_on_roof" );
    }
}

_id_D0E4()
{
    var_0 = getent( "bt_ktichen_ladder_clip", "targetname" );

    for (;;)
    {
        var_0 notsolid();
        common_scripts\utility::flag_wait( "player_on_burgertown_roof" );

        while ( level.player istouching( var_0 ) )
            wait 1;

        var_0 solid();
        common_scripts\utility::flag_waitopen( "player_on_burgertown_roof" );
    }
}

_id_B3D4()
{
    var_0 = getent( "west_side", "targetname" );
    self setturrettargetvec( var_0.origin );
    self waittill( "turret_on_target" );
    _id_CE51( var_0 );
}

_id_A92D( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4["exploder"] = var_2;
    var_4["origin"] = var_1;
    var_4["blastImpact"] = var_3;
    var_0.targets[var_0.targets.size] = var_4;
}
#using_animtree("generic_human");

_id_B152()
{
    var_0 = level._id_C7B1.mgturret[0];
    var_1 = getent( "latvee_destroyer_init_target", "targetname" );
    var_2 = var_0 getturretowner();
    var_2.ignoreall = 0;
    var_0 setmode( "manual" );
    var_3 = getent( "latvee_ride_roof_landing", "targetname" );
    level._id_B152 = var_3 maps\_utility::spawn_ai();

    if ( isdefined( level._id_B32E ) )
        level._id_B152.ignoreme = 1;

    var_0 settargetentity( var_3, ( 0.0, -150.0, 15.0 ) );
    wait 6.5;
    var_0.dofiring = 1;
    wait 2;
    var_0.dofiring = 0;
    level._id_B152 waittill( "death" );

    if ( isdefined( level._id_B32E ) )
        return;

    var_0 thread animscripts\laatpv_turret\common::set_manual_target( var_1, 1, 2, "stop_firing" );
    level.player.m_player_rig1 waittillmatch( "single anim", "start_turret_anim" );
    var_2.animname = "generic";
    var_2 clearanim( %body, 1 );
    var_2 setanim( var_2 maps\_utility::getanim( "turret_guy_panic" ), 1, 1, 1 );
    level waittill( "latvee_destroyer_fired" );
    var_0 notify( "stop_firing" );
    var_2 kill();
}

_id_B459( var_0 )
{
    playfx( common_scripts\utility::getfx( "latvee_explosion" ), level._id_C7B1.origin );
}

_id_BF4E( var_0 )
{
    level._id_C7B1 maps\_vehicle::godoff();
    level._id_C7B1 kill();
}

_id_C7A1()
{
    self endon( "death" );
    thread _id_C61B();
    thread maps\_vehicle_code::damage_hints();
    soundscripts\_snd::snd_message( "intro_btr_showing_up" );
    level._id_C7B1.health = 30000;
    level._id_CA77.health = 30000;
    self setturrettargetent( level._id_C7B1, ( 0.0, 0.0, 40.0 ) );
    wait 1.5;
    level notify( "latvee_blows_up" );
    wait 2.5;
    var_0 = getentarray( "turret_guy", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
            var_2 kill();
    }

    level._id_C7B1 playsound( "scn_invasion_npc_laatpv_explode_01" );

    for ( var_4 = 0; var_4 < 2; var_4++ )
    {
        if ( var_4 != 0 )
            wait 0.2;

        _id_B502( level._id_C7B1.origin );
        self fireweapon();
    }

    playfxontag( level._effect["jeep_car_glass_explode"], level._id_CA77, "tag_hulagirl_attach" );
    maps\_utility::delaythread( 0.25, common_scripts\utility::play_sound_in_space, "scn_invasion_plr_veh_bullet_impact", level._id_CA77.origin + ( 0.0, -90.0, 70.0 ) );
    self setturrettargetent( level._id_CA77, ( 0.0, 0.0, 50.0 ) );
    wait 1;
    playfx( common_scripts\utility::getfx( "latvee_explosion_player" ), level._id_CA77.origin );
    wait 0.6;
    self setturrettargetent( level._id_C7B1, ( 0.0, 0.0, 40.0 ) );
    wait 1;

    for ( var_4 = 0; var_4 < 5; var_4++ )
    {
        self fireweapon();
        wait 0.2;
    }

    _id_D11D();
}

latvee_destroyer_fire_notetrack( var_0 )
{
    level._id_D1BB fireweapon();
}

latvee_player_explode_notetrack( var_0 )
{
    level.player disableinvulnerability();
    level.player enabledeathshield( 1 );
    level._id_CA77 maps\_vehicle::godoff();
    level._id_CA77 kill();
}

_id_D11D()
{
    self endon( "death" );
    thread latvee_destroyer_fires_at_pillars_and_player_trigger();
    var_0 = spawnstruct();
    var_0.targets = [];
    var_1 = common_scripts\utility::getstruct( "pillar1", "targetname" ).origin;
    _id_A92D( var_0, var_1, 9990 );
    var_1 = common_scripts\utility::getstruct( "pillar2", "targetname" ).origin;
    _id_A92D( var_0, var_1, 9991 );
    var_1 = common_scripts\utility::getstruct( "pillar3", "targetname" ).origin;
    _id_A92D( var_0, var_1, 9992 );
    self setturrettargetvec( var_0.targets[0]["origin"] );
    common_scripts\utility::flag_wait( "latvee_destroyer_pillars" );
    latvee_destroyer_fires_at_targets( var_0 );
    maps\_utility::delaythread( 1, soundscripts\_snd::snd_message, "stop_laatpv_ride_intro" );
    var_0.targets = [];
    var_1 = common_scripts\utility::getstruct( "front1", "targetname" ).origin;
    _id_A92D( var_0, var_1, 9993, 1 );
    var_1 = common_scripts\utility::getstruct( "front2", "targetname" ).origin;
    _id_A92D( var_0, var_1, 9994, 1 );
    var_1 = common_scripts\utility::getstruct( "front3", "targetname" ).origin;
    _id_A92D( var_0, var_1, 9995, 1 );
    maps\_utility::add_wait( maps\_utility::_wait, 1 );
    maps\_utility::add_endon( "stop_shooting" );
    maps\_utility::add_func( ::_id_C649, 0, 1 );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "latvee_destroyer_front" );
    self notify( "stop_shooting" );
    self setturrettargetvec( var_0.targets[0]["origin"] );
    latvee_destroyer_fires_at_targets( var_0 );
    maps\_utility::ent_flag_init( "spotted_player" );
    thread _id_C649( 0, 1 );
    common_scripts\utility::flag_wait( "start_house_destroyer" );
    self delete();
}

latvee_destroyer_fires_at_pillars_and_player_trigger()
{
    common_scripts\utility::flag_init( "latvee_destroyer_pillars" );
    common_scripts\utility::flag_init( "latvee_destroyer_front" );
    var_0 = spawn( "trigger_radius", ( 1710.0, 6600.0, 2275.0 ), 2, 75, 50 );

    while ( !( common_scripts\utility::flag( "latvee_destroyer_pillars" ) && common_scripts\utility::flag( "latvee_destroyer_front" ) ) )
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level._id_CE19 )
        {
            common_scripts\utility::flag_set( "latvee_destroyer_pillars" );
            continue;
        }

        if ( var_1 == level.player )
            common_scripts\utility::flag_set( "latvee_destroyer_front" );
    }

    var_0 delete();
}

latvee_destroyer_fires_at_targets( var_0 )
{
    self endon( "death" );
    var_1 = 62500.0;

    for ( var_2 = 0; var_2 < var_0.targets.size; var_2++ )
    {
        self setturrettargetvec( var_0.targets[var_2]["origin"] );
        _id_AE49( var_0.targets[var_2]["origin"] );

        if ( var_0.targets[var_2]["exploder"] > 0 )
        {
            common_scripts\_exploder::exploder( var_0.targets[var_2]["exploder"] );
            earthquake( 0.25, 0.2, var_0.targets[var_2]["origin"], 720 );

            if ( isdefined( var_0.targets[var_2]["blastImpact"] ) && var_0.targets[var_2]["blastImpact"] )
            {
                if ( distance2dsquared( level.player.origin, var_0.targets[var_2]["origin"] ) < var_1 )
                    level.player _meth_859F( var_0.targets[var_2]["origin"] );
            }
        }

        wait 0.15;
    }
}

_id_A828()
{
    maps\_vehicle::godon();
    thread _id_C61B();
    thread maps\_vehicle_code::damage_hints();
    thread _id_BA71();
    self.damageisfromplayer = 1;
    self endon( "death" );
    var_0 = spawnstruct();
    var_1 = common_scripts\utility::getstruct( "bh_roof", "targetname" ).origin;
    var_0.targets = [];
    var_2 = getglassarray( "blue_house_glass" );
    _id_A92D( var_0, var_1, 12 );
    var_1 = common_scripts\utility::getstruct( "bh_corner", "targetname" ).origin;
    _id_A92D( var_0, var_1, 13 );
    var_1 = common_scripts\utility::getstruct( "bh_garage_left", "targetname" ).origin;
    _id_A92D( var_0, var_1, 10 );
    var_1 = common_scripts\utility::getstruct( "bh_garage_right", "targetname" ).origin;
    _id_A92D( var_0, var_1, 11 );

    for ( var_3 = 0; var_3 < var_0.targets.size; var_3++ )
    {
        self setturrettargetvec( var_0.targets[var_3]["origin"] );
        _id_AE49( var_0.targets[var_3]["origin"] );

        if ( var_0.targets[var_3]["exploder"] > 0 )
            common_scripts\_exploder::exploder( var_0.targets[var_3]["exploder"] );

        if ( var_0.targets[var_3]["exploder"] == 13 )
        {
            foreach ( var_5 in var_2 )
                destroyglass( var_5 );
        }

        wait 0.15;
    }

    var_7 = common_scripts\utility::getstruct( "cop_car", "targetname" );
    self setturrettargetvec( var_7.origin );
    self waittill( "turret_on_target" );

    while ( !common_scripts\utility::flag( "house_destroyer_stage2" ) )
    {
        var_8 = randomintrange( 4, 6 );

        for ( var_9 = 0; var_9 < var_8; var_9++ )
        {
            self fireweapon();
            wait 0.2;
        }

        var_10 = randomintrange( 40, 60 );

        for ( var_11 = 0; var_11 < var_10; var_11++ )
        {
            if ( common_scripts\utility::flag( "house_destroyer_stage2" ) )
                break;

            wait 0.05;
        }
    }

    var_0 = spawnstruct();
    var_1 = common_scripts\utility::getstruct( "roof_corner", "targetname" ).origin;
    var_0.targets = [];
    _id_A92D( var_0, var_1, 4 );
    var_1 = common_scripts\utility::getstruct( "bh_corner", "targetname" ).origin;
    _id_A92D( var_0, var_1, 2 );
    var_1 = common_scripts\utility::getstruct( "big_windows", "targetname" ).origin;
    _id_A92D( var_0, var_1, 1 );
    var_1 = common_scripts\utility::getstruct( "back_windows", "targetname" ).origin;
    _id_A92D( var_0, var_1, 3 );

    for ( var_3 = 0; var_3 < var_0.targets.size; var_3++ )
    {
        self setturrettargetvec( var_0.targets[var_3]["origin"] );
        _id_AE49( var_0.targets[var_3]["origin"] );

        if ( var_0.targets[var_3]["exploder"] > 0 )
            common_scripts\_exploder::exploder( var_0.targets[var_3]["exploder"] );

        wait 0.15;
    }

    self endon( "stop_shooting" );
    thread _id_B646();
    var_7 = common_scripts\utility::getstruct( "beemer", "targetname" );
    self setturrettargetvec( var_7.origin );
    self waittill( "turret_on_target" );
    var_8 = randomintrange( 4, 6 );

    for ( var_9 = 0; var_9 < var_8; var_9++ )
    {
        self fireweapon();
        wait 0.2;
    }

    var_7 = common_scripts\utility::getstruct( "barrier_car", "targetname" );
    self setturrettargetvec( var_7.origin );
    self waittill( "turret_on_target" );

    for ( var_3 = 0; var_3 < 3; var_3++ )
    {
        var_8 = randomintrange( 4, 6 );

        for ( var_9 = 0; var_9 < var_8; var_9++ )
        {
            self fireweapon();
            wait 0.2;
        }
    }
}

_id_B646()
{
    self endon( "death" );
    self endon( "stop_shooting" );

    for (;;)
    {
        if ( common_scripts\utility::within_fov( self.origin, self.angles, level.player.origin, level.cosine["60"] ) )
        {
            if ( sighttracepassed( self.origin + ( 0.0, 0.0, 64.0 ), level.player geteye(), 0, self ) )
                break;
        }

        wait 1;
    }

    thread _id_C649();
}

_id_BA71()
{
    self endon( "death" );
    maps\_utility::ent_flag_init( "spotted_player" );
    var_0 = getvehiclenode( "house_destroyer_first_path", "targetname" );
    self startpath( var_0 );
    common_scripts\utility::flag_wait( "house_destroyer_stage2" );
    var_1 = getvehiclenode( "house_destroyer_path", "targetname" );
    self startpath( var_1 );
    self waittill( "reached_end_node" );
    level.player maps\_utility::waittill_entity_in_range_or_timeout( self, 950, 4 );
    common_scripts\utility::flag_set( "house_destroyer_unloading" );
    thread maps\_vehicle::vehicle_unload();
    wait 6;
    thread _id_C649();
    wait 16;
    common_scripts\utility::flag_wait( "take_point" );
    var_2 = getentarray( "bmp_bad_places", "script_noteworthy" );

    foreach ( var_4 in var_2 )
        badplace_cylinder( "", 20, var_4.origin, var_4.radius, 300 );

    common_scripts\utility::flag_set( "house_destroyer_moving_back" );
    var_6 = getvehiclenode( "house_destroyer_backwards_path", "targetname" );
    self startpath( var_6 );
    maps\_vehicle::vehicle_wheels_backward();
    wait 25.0;
    maps\_vehicle::vehicle_wheels_forward();
    common_scripts\utility::flag_wait( "leaving_gas_station" );
    self notify( "stop_shooting" );
    self delete();
}

_id_AE49( var_0 )
{
    _id_B502( var_0 );
    self fireweapon();
    wait 0.05;
}

_id_B502( var_0 )
{
    wait 0.1;
    physicsexplosionsphere( var_0, 200, 100, 4.0 );
}

_id_C649( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self notify( "stop_shooting" );
    self endon( "stop_shooting" );
    self endon( "death" );
    self endon( "delete" );

    for (;;)
    {
        var_2 = maps\_utility::get_closest_player( self.origin );
        wait(randomfloatrange( 0.8, 1.3 ));

        while ( !can_see_player( var_2 ) )
            wait(randomfloatrange( 0.2, 0.6 ));

        if ( !var_1 )
        {
            miss_player( var_2 );
            wait(randomfloatrange( 0.8, 2.4 ));
            miss_player( var_2 );
            wait(randomfloatrange( 0.8, 2.4 ));
        }

        while ( can_see_player( var_2 ) )
        {
            _id_C450( var_2 );
            wait(randomfloatrange( 2, 3 ));
        }

        if ( var_0 )
        {
            if ( !can_see_player( var_2 ) )
            {
                self clearturrettargetent();
                self._id_BF01 = 0;
                maps\_utility::ent_flag_clear( "spotted_player" );
                common_scripts\utility::flag_clear( "bmp_has_spotted_player" );
                self notify( "stop_shooting" );
            }
        }
    }
}

_id_B30F()
{
    self endon( "death" );

    for (;;)
    {
        level.player waittill( "damage", var_0, var_1 );

        if ( var_1 == self )
        {

        }
    }
}

_id_C450( var_0 )
{
    var_1 = randomintrange( 3, 5 );
    var_2 = 0.2;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        self setturrettargetent( var_0, common_scripts\utility::randomvector( 20 ) + ( 0.0, 0.0, 32.0 ) );
        self fireweapon();
        wait(var_2);
    }
}

miss_player( var_0 )
{
    var_1 = anglestoforward( level.player.angles );
    var_2 = var_1 * 100;
    var_3 = var_2 + common_scripts\utility::randomvector( 50 );
    var_4 = randomintrange( 4, 6 );
    var_5 = 0.2;

    for ( var_6 = 0; var_6 < var_4; var_6++ )
    {
        var_7 = common_scripts\utility::randomvector( 15 ) + var_3 + ( 0.0, 0.0, 64.0 );
        self setturrettargetent( var_0, var_7 );
        self fireweapon();
        wait(var_5);
    }
}

can_see_player( var_0 )
{
    if ( common_scripts\utility::flag( "player_inside_nates" ) )
        return 0;

    if ( common_scripts\utility::flag( "player_in_diner" ) )
        return 0;

    if ( distance( self.origin, level.player.origin ) < level._id_B34F )
        return 0;

    var_1 = self gettagorigin( "tag_flash" );
    var_2 = var_0 geteye();

    if ( sighttracepassed( var_1, var_2, 0, self ) )
    {
        if ( isdefined( level.debug ) )
        {

        }

        return 1;
    }
    else
        return 0;
}

_id_CBCB()
{
    iprintlnbold( &"SCRIPT_DEBUG_LEVEL_END" );
}

_id_B268( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    maps\_utility::autosave_by_name( "hello" );
}

_id_BD26( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::flag_init( var_0 );

    if ( !isdefined( level.objectives ) )
        level.objectives = [];

    var_4 = level.objectives.size;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = spawnstruct();
    var_5.name = var_0;
    var_5.id = var_4;
    var_5.state = "invisible";
    var_5.text = var_1;
    var_5.origin = var_2;
    var_5._id_BB0E = 0;
    var_5._id_BF8A = var_3;
    level.objectives[var_0] = var_5;
    return var_5;
}

_id_C7C7( var_0, var_1, var_2 )
{
    var_3 = level.objectives[var_0];
    var_3.state = var_1;

    if ( !var_3._id_BB0E )
    {
        objective_add( var_3.id, var_3.state, var_3.text, var_3.origin );
        var_3._id_BB0E = 1;
        _func_1E7( var_3.id, var_3._id_BF8A );
    }
    else if ( isdefined( var_2 ) && var_2 )
        objective_state_nomessage( var_3.id, var_3.state );
    else
        objective_state( var_3.id, var_3.state );

    if ( var_3.state == "done" )
        common_scripts\utility::flag_set( var_0 );
}

_id_B2F2( var_0, var_1 )
{
    var_2 = level.objectives[var_0];
    var_2.text = var_1;
    objective_string( var_2.id, var_1 );
}

_id_D393( var_0, var_1 )
{
    level notify( "moving " + var_0 );
    level endon( "moving " + var_0 );
    var_2 = level.objectives[var_0];
    var_2._id_BA07 = var_1;
    level._id_C208 = var_1;
    objective_position( var_2.id, level._id_C208 );
}

_id_A94C( var_0 )
{
    level notify( "moving " + var_0 );
    level endon( "moving " + var_0 );
    var_1 = level.objectives[var_0];
    var_2 = undefined;
    _id_D364( var_0, &"INVASION_WAYPOINT_HOSTILES" );
    var_3 = getent( "north_trucks_retreat_point", "targetname" );

    while ( var_1.state != "done" )
    {
        var_4 = getaiarray( "axis" );

        if ( var_4.size < 1 )
        {
            level._id_C208 = var_3.origin;
            objective_position( var_1.id, level._id_C208 );
            wait 3;
            continue;
        }

        var_5 = [];

        foreach ( var_7 in var_4 )
            var_5[var_5.size] = var_7.origin;

        level._id_C208 = averagepoint( var_5 );
        objective_position( var_1.id, level._id_C208 + ( 0.0, 0.0, 70.0 ) );
        wait 2.2;
    }
}

_id_D364( var_0, var_1 )
{
    var_2 = level.objectives[var_0];

    if ( isdefined( var_1 ) )
        objective_setpointertextoverride( var_2.id, var_1 );
    else
        objective_setpointertextoverride( var_2.id );
}

_id_BDC5( var_0, var_1, var_2 )
{
    level notify( "moving " + var_0 );
    level endon( "moving " + var_0 );
    var_3 = level.objectives[var_0];
    objective_onentity( var_3.id, var_1, var_2 );
}

_id_C1A3( var_0, var_1, var_2 )
{
    var_3 = level.objectives[var_0];

    if ( !var_2 )
        objective_string( var_3.id, var_1 );
    else
        objective_string( var_3.id, var_1, var_2 );
}

_id_C368( var_0 )
{
    self setthreatbiasgroup( var_0 );
}

_id_BACA()
{
    common_scripts\utility::flag_wait( "bmp_north_left_dead" );
    common_scripts\utility::flag_wait( "bmp_north_mid_dead" );
    common_scripts\utility::flag_set( "bmps_from_north_dead" );
    level notify( "bmps_from_north_dead" );
}

_id_B5E3()
{
    var_0 = 0;

    if ( isdefined( level.player._id_CA3B ) )
        var_0 = 1;

    if ( level.player getcurrentweapon() == "remote_missile_detonator" )
        var_0 = 1;

    if ( common_scripts\utility::flag( "bmps_from_north_dead" ) )
        var_0 = 1;

    return var_0;
}

_id_BEDE()
{
    var_0 = 0;

    if ( isdefined( level.player._id_CA3B ) )
        var_0 = 1;

    if ( level.player getcurrentweapon() == "remote_missile_detonator" )
        var_0 = 1;

    return var_0;
}

_id_B34D()
{
    var_0 = 0;

    if ( level.player getcurrentweapon() == "remote_missile_detonator" )
        var_0 = 1;

    if ( level._id_B8E6 + 5000 < gettime() )
        var_0 = 1;

    return var_0;
}

_id_B10B()
{
    var_0 = getdvarfloat( "glass_damageToWeaken" );
    var_1 = getdvarfloat( "glass_damageToDestroy" );
    var_2 = ( var_0 + var_1 ) / 100;
    var_3 = getent( self.target, "targetname" );

    for ( var_4 = 0; var_4 < var_2; var_4++ )
        magicbullet( "nosound_magicbullet", self.origin, var_3.origin );
}

_id_C09D()
{
    level._id_C176 endon( "death" );

    for (;;)
    {
        if ( isdefined( level._id_CCF2 ) )
            var_0 = level._id_CCF2.origin;
        else if ( isdefined( level._id_BFC2 ) )
            var_0 = level._id_BFC2;
        else
            var_0 = ( -553.753, -2970.0, 2369.84 );

        var_1 = vectortoangles( var_0 - level._id_C176.origin );
        level.uavrig moveto( level._id_C176.origin, 0.1, 0, 0 );
        level.uavrig rotateto( var_1, 0.1, 0, 0 );
        wait 0.05;
    }
}

_id_B537()
{
    var_0 = getent( "house_area_volume", "targetname" );
    var_1 = getentarray();
    var_2 = [];
    var_2["script_vehicle_corpse"] = 1;
    var_2["script_model"] = 1;
    var_2["script_brushmodel"] = 1;
    var_2["script_vehicle_collmap"] = 1;
    var_2["info_volume_breachroom"] = 1;
    var_2["actor_ally_hero_foley"] = 1;
    var_2["actor_ally_hero_dunn"] = 1;
    var_2["stage"] = 1;

    foreach ( var_4 in var_1 )
    {
        if ( isalive( var_4 ) )
            continue;

        if ( !isdefined( var_4.classname ) )
        {
            if ( var_4 istouching( var_0 ) )
                var_4 delete();

            continue;
        }

        if ( isdefined( var_2[var_4.classname] ) )
            continue;

        if ( isdefined( var_4.code_classname ) && isdefined( var_2[var_4.code_classname] ) )
            continue;

        if ( var_4 == var_0 )
            continue;

        if ( var_4 _id_C0A1() )
        {
            var_5 = spawn( "script_origin", var_4.origin );

            if ( var_5 istouching( var_0 ) )
                var_4 delete();

            var_5 delete();
            continue;
        }

        if ( var_4 istouching( var_0 ) )
            var_4 delete();
    }
}

_id_C0A1()
{
    if ( !isdefined( self.code_classname ) )
        return 0;

    if ( issubstr( self.code_classname, "script_vehicle" ) )
        return 1;

    if ( issubstr( self.code_classname, "script_vehicle_corpse" ) )
        return 1;

    if ( issubstr( self.code_classname, "script_brushmodel" ) )
        return 1;

    if ( issubstr( self.code_classname, "trigger" ) )
        return 1;

    return self.code_classname == "info_volume";
}

_id_C2D5()
{
    var_0 = getent( "house_area_volume", "targetname" );
    var_1 = getentarray();

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 istouching( var_0 ) )
            var_3 delete();
    }
}

_id_D516()
{
    switch ( level.start_point )
    {
        case "latvee":
        case "default":
            _id_BAA4();
        case "yards":
        case "bmp":
        case "pizza":
        case "gas_station":
        case "crash":
            _id_D16B();
        case "nates_roof":
            _id_AAD0();
            _id_B9EB();
        case "attack_diner":
            _id_BB0A();
        case "defend_diner":
            _id_B634();
        case "diner":
            _id_C372();
        case "burgertown":
        case "vip_escort":
        case "helis":
        case "defend_bt":
            _id_B5F5();
            _id_D167();
            _id_CB71();
            _id_B58F();
            _id_AD00();
        case "convoy":
            _id_B31F();
    }
}

_id_BAA4()
{
    common_scripts\utility::flag_wait_either( "follow_foley", "entering_yards" );
}

_id_D16B()
{
    var_0 = common_scripts\utility::getstruct( "police_car_moment", "script_noteworthy" );
    var_1 = var_0.origin;
    _id_BD26( "obj_crash", &"INVASION_OBJ_FOLEY", level._id_CE19.origin );
    _id_C7C7( "obj_crash", "current" );
    thread _id_BDC5( "obj_crash", level._id_CE19, ( 0.0, 0.0, 70.0 ) );
    common_scripts\utility::flag_wait( "crash_objective" );
    common_scripts\utility::flag_wait_either( "player_goto_roof", "player_on_roof" );
    _id_C7C7( "obj_crash", "active" );
    _id_C7C7( "obj_crash", "done", 1 );
    objective_delete( 0 );
}

_id_AAD0()
{
    if ( !common_scripts\utility::flag( "player_on_roof" ) )
    {
        var_0 = level._id_AB47.origin;
        _id_BD26( "obj_roof", &"INVASION_OBJ_ROOF", var_0 );
        _id_C7C7( "obj_roof", "current" );
        common_scripts\utility::flag_wait( "player_on_roof" );
        _id_C7C7( "obj_roof", "done" );
    }
}

_id_B9EB()
{
    var_0 = common_scripts\utility::getstruct( "south_side_of_roof_obj_loc", "targetname" );
    var_1 = var_0.origin;
    _id_BD26( "obj_defend", &"INVASION_OBJ_DEFEND", var_1 );
    _id_C7C7( "obj_defend", "current" );
    _id_D364( "obj_defend", &"INVASION_WAYPOINT_DEFEND" );
    common_scripts\utility::flag_wait( "northside_roof" );
    var_2 = common_scripts\utility::getstruct( "northside_roof", "targetname" );
    _id_D393( "obj_defend", var_2.origin );
    _id_D364( "obj_defend", &"INVASION_WAYPOINT_DEFEND" );
    common_scripts\utility::flag_wait( "truck_guys_retreat" );
    var_3 = common_scripts\utility::getstruct( "off_the_roof", "targetname" );
    _id_D393( "obj_defend", var_3.origin );
    _id_D364( "obj_defend" );
    defend_roof_think( var_3 );
    _id_C7C7( "obj_defend", "done" );
}

defend_roof_think( var_0 )
{
    level endon( "time_to_go_get_UAV_control" );

    while ( !common_scripts\utility::flag( "time_to_go_get_UAV_control" ) )
    {
        common_scripts\utility::flag_wait( "off_roof_obj" );
        _id_D393( "obj_defend", ( 0.0, 0.0, 0.0 ) );
        common_scripts\utility::flag_waitopen( "off_roof_obj" );
        _id_D393( "obj_defend", var_0.origin );
    }
}

_id_BB0A()
{
    var_0 = getent( "predator_drone_control", "targetname" );
    var_1 = var_0.origin;
    _id_BD26( "obj_predator", &"INVASION_OBJ_PREDATOR", var_1 );
    _id_C7C7( "obj_predator", "current" );
    common_scripts\utility::flag_wait( "player_has_predator_drones" );
    _id_C7C7( "obj_predator", "done" );
}

_id_C372()
{
    var_0 = getent( "nates_restaurant_goal", "targetname" );
    var_1 = var_0.origin;
    _id_BD26( "obj_burgertown", &"INVASION_OBJ_REGROUP", var_1 );
    _id_C7C7( "obj_burgertown", "current" );
    _id_D364( "obj_burgertown", &"INVASION_WAYPOINT_REGROUP" );
    common_scripts\utility::flag_wait( "obj_regroup_nates_bombed" );
    wait 3;
    _id_D393( "obj_burgertown", ( 0.0, 0.0, 0.0 ) );
    _id_D364( "obj_burgertown" );
    common_scripts\utility::flag_wait( "time_to_clear_burgertown" );
    var_2 = getent( "objective_burgertown_groundfloor", "targetname" );
    var_1 = var_2.origin;
    _id_B2F2( "obj_burgertown", &"INVASION_OBJ_BURGERTOWN" );
    _id_D393( "obj_burgertown", var_1 );
    common_scripts\utility::flag_wait( "burger_town_lower_cleared" );
    wait 2;
    _id_C7C7( "obj_burgertown", "done" );
}

_id_B634()
{
    wait 0.2;

    if ( !common_scripts\utility::flag( "bmp_north_left_dead" ) )
    {
        _id_BD26( "obj_bmps", &"INVASION_OBJ_BMPS", level._id_C477.origin );
        _id_C7C7( "obj_bmps", "current" );
        thread _id_BDC5( "obj_bmps", level._id_C477, ( 0.0, 0.0, 96.0 ) );
        _id_D364( "obj_bmps", &"INVASION_WAYPOINT_DESTROY" );
    }
    else if ( !common_scripts\utility::flag( "bmp_north_mid_dead" ) )
    {
        _id_BD26( "obj_bmps", &"INVASION_OBJ_BMPS", level._id_D31A.origin );
        _id_C7C7( "obj_bmps", "current" );
        thread _id_BDC5( "obj_bmps", level._id_D31A, ( 0.0, 0.0, 96.0 ) );
        _id_D364( "obj_bmps", &"INVASION_WAYPOINT_DESTROY" );
    }
    else
        return;

    common_scripts\utility::flag_wait( "bmp_north_left_dead" );

    if ( !common_scripts\utility::flag( "bmp_north_mid_dead" ) )
    {
        thread _id_BDC5( "obj_bmps", level._id_D31A, ( 0.0, 0.0, 96.0 ) );
        _id_D364( "obj_bmps", &"INVASION_WAYPOINT_DESTROY" );
    }

    common_scripts\utility::flag_wait( "bmp_north_mid_dead" );
    _id_D364( "obj_bmps" );
    _id_C7C7( "obj_bmps", "done" );
}

_id_AB31()
{
    var_0 = getent( "raptor_in_nates_prep", "targetname" );
    var_1 = var_0.origin;
    _id_BD26( "obj_nates_regroup", &"INVASION_OBJ_NATES_REGROUP", var_1 );
    _id_C7C7( "obj_nates_regroup", "current" );
    _id_D364( "obj_nates_regroup", &"INVASION_WAYPOINT_REGROUP" );
    common_scripts\utility::flag_wait( "player_in_pos_to_cover_vip" );
    _id_C7C7( "obj_nates_regroup", "done" );
    _id_D364( "obj_burgertown" );
}

_id_B5F5()
{
    var_0 = level._id_CE19.origin;
    _id_BD26( "obj_raptor_defend", &"INVASION_OBJ_VIP_ESCORT", var_0 );
    _id_C7C7( "obj_raptor_defend", "current" );
    thread _id_BDC5( "obj_raptor_defend", level._id_CE19, ( 0.0, 0.0, 70.0 ) );
    _id_D364( "obj_raptor_defend", &"INVASION_WAYPOINT_PROTECT" );
    var_1 = getdvar( "objectiveFadeTooFar" );
    setsaveddvar( "objectiveFadeTooFar", 5 );
    common_scripts\utility::flag_wait( "president_in_BT_meat_locker" );
    _id_C7C7( "obj_raptor_defend", "active" );
    _id_BD26( "obj_neutralize", &"INVASION_OBJ_BURGERTOWN_DEFEND", ( 0.0, 0.0, 0.0 ), 1 );
    _id_C7C7( "obj_neutralize", "current" );
    thread _id_A94C( "obj_neutralize" );
    setsaveddvar( "objectiveFadeTooFar", var_1 );
    common_scripts\utility::flag_wait( "first_attack_heli_spawned" );
    wait 9;
}

_id_CE0E()
{
    var_0 = getent( "nates_stinger", "script_noteworthy" );
    var_1 = getent( "diner", "script_noteworthy" );
    level._id_B256 = [];
    level._id_B256["origin"] = var_0.origin;
    level._id_B256["angles"] = var_0.angles;
    level._id_B256["classname"] = var_0.classname;
    var_2 = spawn( "script_model", var_1.origin );
    var_2 setmodel( "h1_weapon_stinger_obj" );
    var_2.angles = var_1.angles;
    var_2 hide();
    var_3 = spawn( "script_model", var_0.origin );
    var_3 setmodel( "h1_weapon_stinger_obj" );
    var_3.angles = var_0.angles;
    var_3 hide();
    level waittill( "attack_heli_spawned" );

    while ( !common_scripts\utility::flag( "second_attack_heli_dead" ) )
    {
        wait 0.1;

        if ( common_scripts\utility::flag( "first_attack_heli_dead" ) && !common_scripts\utility::flag( "second_attack_heli_spawned" ) )
        {
            var_3 hide();
            var_2 hide();
            level waittill( "second_attack_heli_spawned" );
        }

        if ( player_has_stinger() )
        {
            var_3 hide();
            var_2 hide();
            continue;
        }

        if ( isdefined( var_1 ) && !_func_2A5( var_1 ) )
            var_2 show();

        if ( isdefined( var_0 ) && !_func_2A5( var_0 ) )
            var_3 show();

        if ( !isdefined( var_0 ) || _func_2A5( var_0 ) )
        {
            var_0 = spawn( level._id_B256["classname"], level._id_B256["origin"], 1 );
            var_0.angles = level._id_B256["angles"];
            var_0 itemweaponsetammo( 1, 0 );
            var_0.script_noteworthy = "nates_stinger";
        }
    }

    var_2 delete();
    var_3 delete();
}

player_has_stinger()
{
    var_0 = level.player getweaponslistall();

    if ( !isdefined( var_0 ) )
        return 0;

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( var_2, "stinger" ) )
            return 1;
    }

    return 0;
}

_id_D167( var_0 )
{
    level notify( "attack_heli_spawned" );
    level._id_B801 thread maps\invasion_aud::_id_A9A9();
    var_1 = 1;
    var_2 = level.player getweaponslistall();

    foreach ( var_4 in var_2 )
    {
        if ( var_4 == "stinger" )
            var_1 = 0;
    }

    if ( var_1 )
    {
        var_6 = level._id_B256["origin"];
        var_7 = getent( "diner", "script_noteworthy" );

        if ( isdefined( var_7 ) )
        {
            var_6 = var_7.origin;
            level._id_D05B = "west";
        }
        else
            level._id_D05B = "east";

        var_8 = var_6;
    }
    else
        var_8 = level._id_B801.origin;

    level notify( "moving obj_raptor_defend" );
    _id_B2F2( "obj_neutralize", &"INVASION_OBJ_ATTACK_HELI" );
    _id_D393( "obj_neutralize", var_8 );
    _id_D364( "obj_neutralize" );

    if ( var_1 )
        level._id_B801 _id_C94C();

    if ( isalive( level._id_B801 ) )
    {
        level notify( "moving obj_raptor_defend" );
        _id_D393( "obj_neutralize", ( 0.0, 0.0, 0.0 ) );
        _id_C7C7( "obj_raptor_defend", "active_waypoint", 1 );
        _id_D364( "obj_raptor_defend", &"INVASION_WAYPOINT_DESTROY" );
        thread _id_BDC5( "obj_raptor_defend", level._id_B801, ( 0.0, 0.0, 128.0 ) );
        level._id_B801 waittill( "death" );
    }

    _id_C7C7( "obj_raptor_defend", "active", 1 );
    _id_D364( "obj_raptor_defend" );
}

_id_C94C()
{
    self endon( "death" );

    for (;;)
    {
        level.player waittill( "weapon_change" );
        var_0 = level.player getcurrentweapon();

        if ( var_0 == "stinger" )
        {
            maps\_utility::autosave_by_name( "got_stinger" );
            break;
        }
    }
}

_id_CB71()
{
    level notify( "moving obj_raptor_defend" );
    _id_B2F2( "obj_neutralize", &"INVASION_OBJ_BURGERTOWN_DEFEND" );
    thread _id_A94C( "obj_neutralize" );
    common_scripts\utility::flag_wait( "second_attack_heli_spawned" );
    wait 9;
}

_id_B58F()
{
    var_0 = 1;
    _id_D167( var_0 );
}

_id_AD00()
{
    level notify( "moving obj_raptor_defend" );
    _id_B2F2( "obj_neutralize", &"INVASION_OBJ_BURGERTOWN_DEFEND" );
    thread _id_A94C( "obj_neutralize" );
    common_scripts\utility::flag_wait( "time_to_goto_convoy" );
    _id_C7C7( "obj_raptor_defend", "done" );
    _id_C7C7( "obj_neutralize", "done", 1 );
}

_id_B31F()
{
    common_scripts\utility::flag_wait( "time_to_goto_convoy" );

    if ( !isdefined( level._id_B818 ) )
        level._id_B818 = getent( "convoy_obj", "targetname" );

    _id_BD26( "obj_convoy", &"INVASION_OBJ_CONVOY", level._id_B818.origin );
    thread _id_BDC5( "obj_convoy", level._id_B818, ( 35.0, -25.0, 64.0 ) );
    _id_C7C7( "obj_convoy", "current" );
}

_id_BC84( var_0 )
{
    if ( isdefined( self.remotemissile_actionslot ) )
        return var_0 + "_" + self.remotemissile_actionslot;
    else
        return var_0 + "_4";
}

_id_C150( var_0, var_1, var_2, var_3, var_4 )
{
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_5, var_6, var_7 );

        if ( var_5 <= 0 )
            continue;

        if ( isdefined( var_4 ) && var_4 )
        {
            var_8 = getent( self.target, "targetname" );
            var_8 delete();
        }

        if ( isdefined( var_3 ) && var_3 )
            self physicslaunchclient( self.origin, var_7 * var_5 );

        self setmodel( var_0 );
        var_9 = self getorigin();
        var_10 = var_9 + var_2;
        playfx( common_scripts\utility::getfx( var_1 ), var_10 );
        break;
    }
}

btr_silent_skies_monitor_damage()
{
    level endon( "stop_silent_skies" );
    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_0 ) && isdefined( var_2 ) )
    {
        if ( isplayer( var_0 ) && var_2 != "remote_missile_invasion" )
        {
            level.btr_kill_no_predator++;

            if ( level.btr_kill_no_predator >= 2 )
                level notify( "give_silent_skies" );

            return;
        }
    }

    level notify( "stop_silent_skies" );
}

btr_silent_skies_manager()
{
    level endon( "stop_silent_skies" );
    level waittill( "give_silent_skies" );
    maps\_utility::giveachievement_wrapper( "SILENT_SKIES" );
    level notify( "stop_silent_skies" );
}
#using_animtree("vehicles");

jeep_ride_intro_vehicle()
{
    level._id_CA77 setanim( %h2_invasion_intro_jeepride_latvee, 1.0, 0.0, 1.0 );
}

soldiers_escort_president( var_0 )
{
    var_1 = 54;
    var_2 = getaicount();

    if ( var_2 + 1 >= var_1 )
        return;

    var_3 = maps\_utility::spawn_ai();
    wait 6;
    var_3 maps\_utility::ai_ignore_everything();
    var_3 maps\_utility::enable_cqbwalk();
    var_3 thread maps\_utility::follow_path( var_0 );

    if ( !common_scripts\utility::flag( "player_in_latvee" ) )
        common_scripts\utility::flag_wait( "player_in_latvee" );

    var_3.moveplaybackrate = 1.2;
}

smoke_grenade_listener()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "smoke_grenade_american" )
            var_0 thread track_smoke_grenade_fuse( 4 );
    }
}

track_smoke_grenade_fuse( var_0 )
{
    maps\_utility::waittill_or_timeout( "death", var_0 - 0.05 );
    thread fake_grenade_vfx( self.origin );
    self delete();
}

fake_grenade_vfx( var_0 )
{
    var_1 = 400;
    var_2 = level.smoke_normal;
    var_3 = 1;

    if ( !common_scripts\utility::flag( "entered_alley" ) && common_scripts\utility::flag( "got_visual_on_crash" ) )
    {
        var_2 = level.smoke_low;

        if ( isdefined( level.smokegrenadesarray ) )
        {
            foreach ( var_5 in level.smokegrenadesarray )
            {
                if ( distance( var_5.origin, var_0 ) < var_1 )
                {
                    var_2 = level.smoke_dud;
                    var_3 = 0;
                }
            }
        }
    }
    else
    {
        if ( level.smokegrenades > 4 )
            var_2 = level.smoke_low;

        var_3 = 0;
    }

    var_7 = spawnfx( var_2, var_0 );
    triggerfx( var_7 );
    thread common_scripts\utility::play_sound_in_space( "h1_wpn_smoke_pop", var_0 );

    if ( var_3 )
    {
        var_8 = spawn( "script_origin", var_0 );
        level.smokegrenadesarray = common_scripts\utility::array_add( level.smokegrenadesarray, var_8 );
        wait 35;
        level.smokegrenadesarray = common_scripts\utility::array_remove( level.smokegrenadesarray, var_8 );
        var_8 delete();
        wait 15;
        var_7 delete();
    }
    else
    {
        wait 50;
        var_7 delete();
    }
}

staticmodelgroup_init()
{
    var_0 = common_scripts\utility::getstruct( "struct_staticmodelgroup", "targetname" );
    var_1 = int( var_0.script_parameters );

    for ( var_2 = 1; var_2 <= var_1; var_2++ )
    {
        var_3 = "flag_staticmodelgroup_" + var_2;
        common_scripts\utility::flag_init( var_3 );
        thread staticmodelgroup_monitor( var_3, var_2 );
    }

    common_scripts\utility::flag_set( "static_model_initialized" );
}

staticmodelgroup_monitor( var_0, var_1 )
{
    _func_31C( var_1 );

    for (;;)
    {
        if ( common_scripts\utility::flag( var_0 ) )
            _func_31B( var_1 );
        else
            _func_31C( var_1 );

        level waittill( var_0 );
    }
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

    common_scripts\utility::flag_init( var_0 );

    if ( var_2 )
        common_scripts\utility::flag_clear( var_0 );
    else
        common_scripts\utility::flag_set( var_0 );

    for (;;)
    {
        if ( common_scripts\utility::flag( var_0 ) )
        {
            foreach ( var_7 in var_5 )
                var_7 hide();
        }
        else
        {
            foreach ( var_7 in var_5 )
                var_7 show();
        }

        level waittill( var_0 );
    }
}

swap_burning_tree()
{
    wait 9;
    var_0 = getent( "burning_tree", "script_noteworthy" );

    while ( maps\_utility::player_looking_at( var_0.origin, 0.4, 1 ) )
        wait 1;

    var_0 setmodel( "h2_foliage_tree_oak_1_burnt" );
}

animate_nates_beams()
{
    _func_31B( 15 );
    _func_31C( 16 );
    var_0 = getent( "nates_beam_animated", "targetname" );
    var_0 hide();
    level waittill( "exploding_139" );
    var_0 maps\_utility::assign_animtree( "h2_nates_beam_destruction" );
    _func_31C( 15 );
    var_0 show();
    var_0 maps\_anim::anim_single_solo( var_0, "h2_nates_beam_destruction" );
    var_0 hide();
    _func_31B( 16 );
}

animated_wires_taco()
{
    var_0 = getentarray( "animated_wires", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::assign_animtree( "h2_wires_animated" );
        var_2 thread maps\_anim::anim_loop_solo( var_2, "h2_wires_animated" );
    }
}

monitor_nates_roof_interior()
{
    thread hide_destructible_vehicles( "flag_vehicles_nates", "volume_vehicles_nates" );
    common_scripts\utility::flag_wait( "static_model_initialized" );
    thread nates_shadow_object_handler();

    for (;;)
    {
        if ( common_scripts\utility::flag( "player_on_roof" ) )
        {
            common_scripts\utility::flag_clear( "flag_staticmodelgroup_6" );
            common_scripts\utility::flag_clear( "flag_staticmodelgroup_8" );
            common_scripts\utility::flag_set( "flag_vehicles_nates" );
            common_scripts\utility::flag_clear( "flag_portal_road_east_wall" );
        }
        else if ( common_scripts\utility::flag( "player_in_nates" ) )
        {
            common_scripts\utility::flag_clear( "flag_staticmodelgroup_7" );
            common_scripts\utility::flag_set( "flag_vehicles_nates" );
            common_scripts\utility::flag_clear( "flag_portal_road_east_wall" );
        }
        else
        {
            common_scripts\utility::flag_set( "flag_staticmodelgroup_6" );
            common_scripts\utility::flag_set( "flag_staticmodelgroup_7" );
            common_scripts\utility::flag_set( "flag_staticmodelgroup_8" );
            common_scripts\utility::flag_clear( "flag_vehicles_nates" );
            common_scripts\utility::flag_set( "flag_portal_road_east_wall" );
        }

        common_scripts\utility::waittill_either( "player_on_roof", "player_in_nates" );
    }
}

diner_door_clip()
{
    var_0 = getent( "diner_player_push", "targetname" );
    common_scripts\utility::flag_wait( "diner_attack" );
    common_scripts\utility::flag_waitopen( "player_in_diner" );
    var_0.origin += ( 0.0, 0.0, 120.0 );
    common_scripts\utility::flag_wait( "diner_door_opened" );
    var_0.origin -= ( 0.0, 0.0, 120.0 );
}

monitor_nates_portal()
{
    level waittill( "exploding_333" );
    var_0 = getent( "trigger_portal_nates_sides", "targetname" );
    var_0 delete();
    waittillframeend;
    common_scripts\utility::flag_set( "flag_portal_nates_sides" );
}

monitor_nates_roof_portal()
{
    while ( level.player.using_uav )
        wait 0.5;

    common_scripts\utility::flag_set( "flag_portal_nates_roof" );
}

h2_inv_footik_disable()
{
    for (;;)
    {
        if ( common_scripts\utility::flag( "player_on_roof" ) || common_scripts\utility::flag( "player_on_burgertown_roof" ) )
            setsaveddvar( "xanim_disableFootIK", 1 );
        else
            setsaveddvar( "xanim_disableFootIK", 0 );

        common_scripts\utility::waittill_either( "player_on_roof", "player_on_burgertown_roof" );
    }
}

change_remote_missile_zfar()
{
    level endon( "death" );

    for (;;)
    {
        level.player waittill( "player_is_controlling_UAV" );
        setsaveddvar( "r_lodFOVFixedScale", 0.5 );
        common_scripts\utility::flag_clear( "flag_staticmodelgroup_10" );
        common_scripts\utility::flag_clear( "flag_staticmodelgroup_8" );
        level.player waittill( "exiting_uav_control" );
        setsaveddvar( "r_lodFOVFixedScale", 1 );
        common_scripts\utility::flag_set( "flag_staticmodelgroup_10" );
        common_scripts\utility::flag_set( "flag_staticmodelgroup_8" );
    }
}

nates_get_ents()
{
    var_0 = getentarray( "nates_info_volumes", "targetname" );
    var_1 = getentarray( "script_model", "code_classname" );
    common_scripts\utility::array_combine( var_1, getentarray( "script_brushmodel", "code_classname" ) );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( !var_4 _meth_805B() )
        {
            foreach ( var_6 in var_0 )
            {
                if ( var_4 istouching( var_6 ) )
                {
                    var_2[var_2.size] = var_4;
                    break;
                }
            }
        }
    }

    return var_2;
}

nates_shadow_object_handler()
{
    level endon( "exploding_333" );
    common_scripts\utility::flag_wait( "nates_after_bombing_setup_done" );
    var_0 = nates_get_ents();

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_on_roof" );

        foreach ( var_2 in var_0 )
        {
            if ( !_func_2A5( var_2 ) )
            {
                var_2 hide();
                var_2 dontcastshadows();
            }
        }

        common_scripts\utility::flag_waitopen( "player_on_roof" );

        foreach ( var_2 in var_0 )
        {
            if ( !_func_2A5( var_2 ) )
            {
                var_2 show();
                var_2 castshadows();
            }
        }

        waitframe();
    }
}

show_tree()
{
    _func_31C( 14 );
    common_scripts\utility::flag_wait( "flag_staticmodelgroup_14" );
    _func_31C( 13 );
    _func_31B( 14 );
}

monitor_sentry_badplace()
{
    var_0 = getent( "no_sentry_volume", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    for (;;)
    {
        if ( level.player istouching( var_0 ) )
            level.player.nosentry = 1;
        else
            level.player.nosentry = undefined;

        waitframe();
    }
}

safe_saving_roof()
{
    level endon( "truck_guys_retreat" );
    wait 2;

    while ( common_scripts\utility::flag( "unsafe_zone_save" ) )
        wait 1;

    maps\_utility::autosave_by_name( "sentry_in_position" );
}
