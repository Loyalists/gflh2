// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\arcadia_mission_select_cam::_id_C490();
        return;
    }

    maps\_utility::default_start( ::_id_C7F9 );
    maps\_utility::add_start( "street", ::_id_C7F9 );
    maps\_utility::add_start( "checkpoint", ::_id_D214 );
    maps\_utility::add_start( "golf", ::_id_B3D5 );
    maps\_utility::add_start( "crash", ::_id_C818 );
    common_scripts\_destructible::_id_BDEC( "toy_firehydrant", "fx/props/firehydrant_exp", "fx/props/firehydrant_exp_arcadia" );
    common_scripts\_destructible::_id_BDEC( "toy_firehydrant", "fx/props/firehydrant_spray_10sec", "fx/props/firehydrant_spray_10sec_arcadia" );
    setsaveddvar( "r_outdoorfeather", 64 );
    precachestring( &"ARCADIA_OBJECTIVE_AA_GUNS" );
    precachestring( &"ARCADIA_OBJECTIVE_BROOKMERE" );
    precachestring( &"ARCADIA_OBJECTIVE_INTEL" );
    precachestring( &"ARCADIA_LASER_HINT" );
    precachestring( &"ARCADIA_LASER_HINT_GOLFCOURSE" );
    precachestring( &"ARCADIA_PICK_UP_BRIEFCASE_HINT" );
    precachestring( &"ARCADIA_PICK_UP_BRIEFCASE_HINT_PC" );
    precachestring( &"ARCADIA_OBJECTIVE_LOCATE_AA_GUNS" );
    precachestring( &"ARCADIA_OBJECTIVE_NEUTRALIZE_AA_GUNS" );
    precachestring( &"ARCADIA_OBJECTIVE_EXTRACT_VIP" );
    _func_260( "arcadia" );
    _func_260( "arcadia_nvg_laser" );
    precacheshader( "dpad_laser_designator" );
    precacheshader( "black" );
    precachemodel( "vehicle_zpu4_burn" );
    precachemodel( "cs_vodkabottle01" );
    precachemodel( "electronics_camera_pointandshoot_animated" );
    precachemodel( "com_metal_briefcase_opened_obj" );
    precacherumble( "arcadia_artillery_rumble" );
    setdynamicdvar( "arcadia_debug_stryker", "0" );
    precacheitem( "rpg_straight" );
    precacheitem( "usp_laserdesignator" );

    precachemodel( "h2_gfl_ump9_viewbody" );
    precachemodel( "h2_gfl_ump9_viewhands" );
    precachemodel( "h2_gfl_ump9_viewhands_player" );

    _id_AA4D();
    maps\_utility::add_earthquake( "b2bomb", 0.5, 0.5, 2000 );
    _id_C05A::main();
    _id_C7E8::main();
    _id_ADD3::main();
    maps\arcadia_lighting::main();
    var_0 = getentarray( "volume_second_half", "targetname" );
    maps\_utility::mask_destructibles_in_volumes( var_0 );
    maps\_utility::mask_interactives_in_volumes( var_0 );
    thread _id_AE32();
    setsaveddvar( "fx_cast_shadow", 0 );
    maps\arcadia_code::init_scope_fov_setup();
    maps\_load::main();
    maps\arcadia_anim::main();
    maps\_drone_ai::init();
    _id_D2A4::main();
    maps\_compass::setupminimap( "compass_map_arcadia" );
    maps\arcadia_aud::main();
    common_scripts\utility::flag_init( "used_laser" );
    common_scripts\utility::flag_init( "used_laser_attack" );
    common_scripts\utility::flag_init( "used_laser_golf" );
    common_scripts\utility::flag_init( "laser_hint_print" );
    common_scripts\utility::flag_init( "stealth_bombed_0" );
    common_scripts\utility::flag_init( "stealth_bombed_1" );
    common_scripts\utility::flag_init( "lazed_targets_0" );
    common_scripts\utility::flag_init( "lazed_targets_1" );
    common_scripts\utility::flag_init( "golfcourse_vehicles_dead" );
    common_scripts\utility::flag_init( "objective_laze_golfcourse" );
    common_scripts\utility::flag_init( "foley_in_panic_room" );
    common_scripts\utility::flag_init( "picked_up_briefcase" );
    common_scripts\utility::flag_init( "examine_tats" );
    common_scripts\utility::flag_init( "player_can_pick_up_briefcase" );
    common_scripts\utility::flag_init( "end_dialog_done" );
    common_scripts\utility::flag_init( "foley_leaves_panic_room" );
    common_scripts\utility::flag_init( "disable_stryker_dialog" );
    common_scripts\utility::flag_init( "objective_aa_guns_given" );
    common_scripts\utility::flag_init( "objective_brookmere_road_given" );
    common_scripts\utility::flag_init( "c130_sequence_started" );
    common_scripts\utility::flag_init( "mi17_sequence_started" );
    maps\arcadia_code::initialize_portal_flags();
    thread animate_chandelier();
    level.foley = getent( "foley", "script_noteworthy" );
    level.foley.animname = "foley";
    level.foley maps\_utility::magic_bullet_shield();
    level.foley maps\_utility::make_hero();
    level._id_ACC0 = getent( "dunn", "script_noteworthy" );
    level._id_ACC0.animname = "dunn";
    level._id_ACC0 maps\_utility::magic_bullet_shield();
    level._id_ACC0 maps\_utility::make_hero();
    var_1 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_1, maps\arcadia_code::_id_B39A );
    var_1 = common_scripts\utility::array_remove_array( var_1, maps\_utility::get_heroes() );
    level.friendly_startup_thread = maps\arcadia_code::_id_B39A;
    common_scripts\utility::flag_set( "respawn_friendlies" );
    maps\_utility::set_empty_promotion_order( "r" );
    maps\_utility::set_empty_promotion_order( "b" );
    common_scripts\utility::array_thread( var_1, maps\_utility::replace_on_death );
    var_2 = getspawnerteamarray( "axis" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( !isdefined( var_5.script_parameters ) )
            continue;

        var_3[var_3.size] = var_5;
    }

    maps\_utility::array_spawn_function( var_3, maps\arcadia_code::_id_B761 );
    var_7 = getentarray( "right_mansion_spawner", "targetname" );
    maps\_utility::array_spawn_function( var_7, maps\arcadia_code::act_as_ambush_combat_for_a_while, 1, 8 );
    level._id_C7A3 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "stryker" );
    level._id_C7A3.vehicle_stays_alive = 1;
    level._id_C7A3 vehphys_disablecrashing();
    level._id_C7A3.damageisfromplayer = 1;
    level._id_C7A3 makevehiclenotcollidewithplayers( 1 );
    maps\arcadia_stryker::_id_C7CE();
    level._id_C7A3._id_D215 = level._id_C7A3;
    level._id_C7A3 thread maps\arcadia_stryker::_id_BBBF();
    level._id_C7A3 thread maps\arcadia_stryker::_id_B373();
    level._id_C7A3 thread maps\arcadia_stryker::_id_C2D9();
    level._id_C7A3 thread maps\arcadia_code::_id_C221();
    level._id_C7A3 thread maps\arcadia_stryker::_id_B373();
    level._id_C7A3 thread maps\arcadia_code::_id_C8E7();
    level._id_C7A3 thread maps\arcadia_code::_id_B0C8();
    level._id_C7A3 thread maps\arcadia_code::_id_CFA4();
    level._id_C7A3 thread maps\arcadia_stryker::achievement_target_confirmed_init();
    level._id_C7A3 setvehiclelookattext( "Honey Badger", &"" );
    level._id_C7A3.missileattractor = spawn( "script_origin", level._id_C7A3.origin + ( 0.0, 0.0, 70.0 ) );
    level._id_C7A3.missileattractor linkto( level._id_C7A3 );
    missile_createattractorent( level._id_C7A3.missileattractor, 10000, 3000, undefined, undefined, undefined, "axis" );
    thread maps\arcadia_code::_id_D3D2();
    level._id_C240[0] = 0;
    level._id_C240[1] = 0;
    maps\arcadia_code::_id_AAEE( 9000 );
    maps\_utility::array_spawn_function_noteworthy( "drop_plane", maps\arcadia_code::_id_BE80 );
    common_scripts\utility::run_thread_on_targetname( "sentry_activate", maps\arcadia_code::_id_D199 );
    common_scripts\utility::run_thread_on_targetname( "vehicle_path_disconnector", maps\arcadia_code::_id_B4F3 );
    common_scripts\utility::run_thread_on_targetname( "delete_ai_trigger", maps\arcadia_code::_id_BDAC );
    common_scripts\utility::run_thread_on_noteworthy( "plane_sound", vehicle_scripts\_mig29::plane_sound_node );
    common_scripts\utility::run_thread_on_noteworthy( "evac_chopper_1", maps\_utility::add_spawn_function, maps\arcadia_code::_id_CA47 );
    common_scripts\utility::run_thread_on_noteworthy( "ignore_until_unload", maps\arcadia_code::_id_BBBA );
    common_scripts\utility::run_thread_on_noteworthy( "checkpoing_clear_activate", maps\arcadia_code::_id_C322, "checkpoint_enemies_dead" );
    common_scripts\utility::run_thread_on_noteworthy( "checkpoing_clear_activate", ::_id_ACB7 );
    var_8 = getent( "evac_chopper_1", "script_noteworthy" );
    var_8 maps\_utility::add_spawn_function( ::neighborhood_b_heli_death_animation );
    maps\_utility::add_hint_string( "use_laser", &"ARCADIA_LASER_HINT", maps\arcadia_code::_id_D1FE );
    maps\_utility::add_hint_string( "use_laser_attack", &"ARCADIA_LASER_ATTACK_HINT", maps\arcadia_code::_id_C37B );
    maps\_utility::add_hint_string( "use_laser_golf", &"ARCADIA_LASER_HINT_GOLFCOURSE", maps\arcadia_code::_id_CFEC, 1 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct2", "targetname" ), ::_id_C150, "h1_mwr_com_widescreen_monitor_2_des", "tv_explosion", ( 0.0, 0.0, 25.0 ), 1, 1 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_2_on", "targetname" ), ::_id_C150, "com_widescreen_monitor_on_2_des", "tv_explosion", ( 0.0, 0.0, 27.0 ), 1, 1 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_on1", "targetname" ), ::_id_C150, "com_widescreen_monitor_on_1_des", "tv_explosion", ( 0.0, 0.0, 30.0 ), 1, 1 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_on2", "targetname" ), ::_id_C150, "com_widescreen_monitor_on_2_des", "tv_explosion", ( 0.0, 0.0, 30.0 ), 1, 1 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_on_1_var2", "targetname" ), ::_id_C150, "com_widescreen_monitor_on_1_des", "tv_explosion", ( 0.0, 0.0, 30.0 ), 1, 1 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_on_2_var2", "targetname" ), ::_id_C150, "com_widescreen_monitor_on_2_des", "tv_explosion", ( 0.0, 0.0, 30.0 ), 1, 1 );
    thread maps\arcadia_code::_id_D406();
    thread _id_C16B();
    thread _id_AAAD();
    thread maps\arcadia_code::laser_targeting_device( level.player );
    thread maps\arcadia_code::_id_A964();
    thread maps\arcadia_code::_id_B1C0();
    thread maps\arcadia_code::_id_B6F1();
    thread _id_D014();
    thread maps\arcadia_code::_id_BEF5();
    thread maps\arcadia_code::_id_BE2E();
    thread maps\arcadia_code::harriers();
    thread _id_C582();
    thread _id_CC0D();
    thread _id_CD7C();
    thread maps\arcadia_code::pool();
    thread _id_C6C7();
    thread _id_C8A3();
    thread maps\arcadia_code::_id_C994();
    thread maps\arcadia_code::_id_AE7E();
    thread maps\arcadia_code::_id_CDC6();
    thread maps\arcadia_code::_id_B8FB();
    thread maps\arcadia_code::_id_CF63();
    thread maps\arcadia_code::_id_B6FE();
    thread _id_B486();
    thread _id_B262();
    maps\arcadia_code::static_model_group_setup();
    thread maps\arcadia_code::mansion_ceiling_fans_setup();
    common_scripts\utility::array_thread( getentarray( "rotating_fan", "targetname" ), maps\arcadia_code::_id_C3F2 );
    thread maps\arcadia_code::plane_wire_anim_setup();
    thread maps\arcadia_code::mansion_horizontal_lights_setup();
    thread maps\arcadia_code::bx_signs_setup();
    thread maps\arcadia_code::plane_crash_culldist_setup();
    maps\arcadia_aud::_id_D375();
    maps\arcadia_code::parked_civilian_car_lighting();
    wait 0.05;
    var_9 = getaiarray( "allies" );

    foreach ( var_11 in var_9 )
        var_11.baseaccuracy = 0.4;

    var_13 = maps\arcadia_code::_id_B337( "golf_after", 0 );
    common_scripts\utility::array_call( var_13, ::hide );
    var_14 = maps\arcadia_code::_id_B337( "golf_after", 1 );
    common_scripts\utility::array_call( var_14, ::hide );
    thread maps\arcadia_code::covered_bridge_exit_manage_allies();
}

_id_ACB7()
{
    self waittill( "trigger" );
    maps\arcadia_code::_id_AAEE( 0 );
}

_id_B486()
{
    common_scripts\utility::flag_wait( "first_bridge" );
    maps\arcadia_code::_id_AAEE( 9000 );
}

_id_B262()
{
    common_scripts\utility::flag_wait( "golf_course_mansion" );
    maps\arcadia_code::_id_AAEE( 0 );
}

_id_C8A3()
{
    wait 1;
    var_0 = getent( "volume_second_half", "targetname" );
    var_0 maps\_utility::activate_destructibles_in_volume();
    var_0 maps\_utility::activate_interactives_in_volume();
}

_id_AA4D()
{
    loadfx( "fx/smoke/car_damage_whitesmoke" );
    loadfx( "fx/smoke/car_damage_blacksmoke" );
    loadfx( "fx/smoke/car_damage_blacksmoke_fire" );
    loadfx( "fx/explosions/small_vehicle_explosion" );
    loadfx( "fx/props/car_glass_large" );
    loadfx( "fx/props/car_glass_med" );
    loadfx( "fx/props/car_glass_headlight" );
    loadfx( "fx/smoke/motorcycle_damage_blacksmoke_fire" );
    loadfx( "fx/props/car_glass_brakelight" );
    loadfx( "fx/props/mail_box_explode" );
    loadfx( "fx/props/garbage_spew_des" );
    loadfx( "fx/props/garbage_spew" );
    loadfx( "fx/explosions/wallfan_explosion_dmg" );
    loadfx( "fx/explosions/wallfan_explosion_des" );
    loadfx( "fx/props/filecabinet_dam" );
    loadfx( "fx/props/filecabinet_des" );
    loadfx( "fx/misc/light_blowout_runner" );
    loadfx( "fx/props/electricbox4_explode" );
    loadfx( "fx/explosions/ceiling_fan_explosion" );
    loadfx( "fx/props/firehydrant_leak" );
    loadfx( "fx/props/firehydrant_exp" );
    loadfx( "fx/props/firehydrant_spray_10sec" );
    loadfx( "fx/explosions/tv_flatscreen_explosion" );
    precachemodel( "ma_flatscreen_tv_wallmount_broken_02" );
    precachemodel( "vehicle_van_green_destructible" );
    precachemodel( "vehicle_van_green_destroyed" );
    precachemodel( "vehicle_van_green_hood" );
    precachemodel( "vehicle_van_green_door_rb" );
    precachemodel( "vehicle_van_green_mirror_l" );
    precachemodel( "vehicle_van_green_mirror_r" );
    precachemodel( "vehicle_van_wheel_lf" );
    precachemodel( "vehicle_pickup_destructible_mp" );
    precachemodel( "vehicle_pickup_destroyed" );
    precachemodel( "vehicle_pickup_hood" );
    precachemodel( "vehicle_pickup_door_lf" );
    precachemodel( "vehicle_pickup_door_rf" );
    precachemodel( "vehicle_pickup_mirror_l" );
    precachemodel( "vehicle_pickup_mirror_r" );
    precachemodel( "vehicle_luxurysedan_2008_white_destructible" );
    precachemodel( "vehicle_luxurysedan_2008_white_destroy" );
    precachemodel( "vehicle_luxurysedan_2008_white_hood" );
    precachemodel( "vehicle_luxurysedan_2008_white_wheel_lf" );
    precachemodel( "vehicle_luxurysedan_2008_white_door_lf" );
    precachemodel( "vehicle_luxurysedan_2008_white_door_rf" );
    precachemodel( "vehicle_luxurysedan_2008_white_door_lb" );
    precachemodel( "vehicle_luxurysedan_2008_white_door_rb" );
    precachemodel( "vehicle_luxurysedan_2008_white_mirror_l" );
    precachemodel( "vehicle_luxurysedan_2008_white_mirror_r" );
    precachemodel( "vehicle_coupe_gold_destructible" );
    precachemodel( "vehicle_coupe_gold_destroyed" );
    precachemodel( "vehicle_coupe_gold_door_lf" );
    precachemodel( "vehicle_coupe_gold_spoiler" );
    precachemodel( "vehicle_coupe_gold_mirror_l" );
    precachemodel( "vehicle_coupe_gold_mirror_r" );
    precachemodel( "vehicle_coupe_black_destructible" );
    precachemodel( "vehicle_coupe_black_destroyed" );
    precachemodel( "vehicle_coupe_black_door_lf" );
    precachemodel( "vehicle_coupe_black_spoiler" );
    precachemodel( "vehicle_coupe_black_mirror_l" );
    precachemodel( "vehicle_coupe_black_mirror_r" );
    precachemodel( "vehicle_suburban_destructible_beige" );
    precachemodel( "vehicle_suburban_destroyed_beige" );
    precachemodel( "vehicle_suburban_wheel_rf" );
    precachemodel( "vehicle_suburban_door_lb_beige" );
    precachemodel( "vehicle_motorcycle_01_destructible" );
    precachemodel( "vehicle_motorcycle_01_destroy" );
    precachemodel( "vehicle_motorcycle_01_front_wheel_d" );
    precachemodel( "vehicle_motorcycle_01_rear_wheel_d" );
    precachemodel( "vehicle_motorcycle_02_destructible" );
    precachemodel( "vehicle_motorcycle_02_destroy" );
    precachemodel( "vehicle_policecar_lapd_destructible" );
    precachemodel( "vehicle_policecar_lapd_destroy" );
    precachemodel( "vehicle_policecar_lapd_wheel_lf" );
    precachemodel( "vehicle_policecar_lapd_door_lf" );
    precachemodel( "vehicle_policecar_lapd_door_rf" );
    precachemodel( "vehicle_policecar_lapd_door_lb" );
    precachemodel( "vehicle_policecar_lapd_mirror_l" );
    precachemodel( "vehicle_policecar_lapd_mirror_r" );
    precachemodel( "mailbox_black" );
    precachemodel( "mailbox_black_dam" );
    precachemodel( "mailbox_black_dest" );
    precachemodel( "mailbox_black_door" );
    precachemodel( "mailbox_black_flag" );
    precachemodel( "com_trashbin02" );
    precachemodel( "com_trashbin02_dmg" );
    precachemodel( "com_trashbin02_lid" );
    precachemodel( "com_recyclebin01" );
    precachemodel( "com_recyclebin01_dmg" );
    precachemodel( "com_recyclebin01_lid" );
    precachemodel( "com_filecabinetblackclosed" );
    precachemodel( "com_filecabinetblackclosed_dam" );
    precachemodel( "com_filecabinetblackclosed_des" );
    precachemodel( "com_filecabinetblackclosed_drawer" );
    precachemodel( "com_light_ceiling_round_on" );
    precachemodel( "com_light_ceiling_round_off" );
    precachemodel( "me_electricbox2" );
    precachemodel( "me_electricbox2_dest" );
    precachemodel( "me_electricbox2_door" );
    precachemodel( "me_electricbox2_door_upper" );
    precachemodel( "me_electricbox4" );
    precachemodel( "me_electricbox4_dest" );
    precachemodel( "me_electricbox4_door" );
    precachemodel( "h2_us_ceiling_fan_blades_01_dest_animated" );
    precachemodel( "h2_us_ceiling_fan_housing_01_dest" );
    precachemodel( "h2_us_ceiling_fan_blades_02_dest_animated" );
    precachemodel( "h2_us_ceiling_fan_housing_02_dest" );
    precachemodel( "com_trashbin01" );
    precachemodel( "com_trashbin01_dmg" );
    precachemodel( "com_trashbin01_lid" );
    precachemodel( "com_firehydrant" );
    precachemodel( "com_firehydrant_dest" );
    precachemodel( "com_firehydrant_dam" );
    precachemodel( "com_firehydrant_cap" );
    precachemodel( "h1_mwr_com_widescreen_monitor_2_des" );
    precachemodel( "com_widescreen_monitor_on_1_des" );
    precachemodel( "com_widescreen_monitor_on_2_des" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
}

_id_C7F9()
{
    soundscripts\_snd::snd_message( "startStreet_checkpoint" );
    maps\arcadia_lighting::_id_C003( "arcadia_street" );
    maps\arcadia_code::_id_BC5D( "playerstart_street" );
    thread _id_B665();
    thread _id_CC06();
    thread _id_AD33();
    thread _id_B56D();
    thread _id_BB51();
    thread _id_AE0E();
    common_scripts\utility::array_thread( getentarray( "opening_rpg_location", "targetname" ), maps\arcadia_code::_id_B103 );
    level._id_C7A3 thread _id_C1E1();
}

_id_D214()
{
    soundscripts\_snd::snd_message( "startCheckpoint_checkpoint" );
    maps\arcadia_lighting::_id_C003( "arcadia_checkpoint" );
    common_scripts\utility::flag_set( "used_laser" );
    getent( "friendlyspawn_trigger_checkpoint", "script_noteworthy" ) notify( "trigger", level.player );
    maps\arcadia_code::_id_BC5D( "playerstart_checkpoint" );
    thread _id_B665();
}

_id_B3D5()
{
    soundscripts\_snd::snd_message( "startGolf_checkpoint" );
    maps\arcadia_lighting::_id_C003( "arcadia_golf" );
    common_scripts\utility::flag_set( "golf_course_vehicles" );
    common_scripts\utility::flag_set( "golf_course_mansion" );
    common_scripts\utility::flag_set( "used_laser" );
    maps\arcadia_code::_id_BC5D( "playerstart_golf" );
    thread _id_B665();
    thread _id_CAD9();
    common_scripts\utility::flag_set( "first_bridge" );
    common_scripts\utility::flag_set( "golf_course_battle" );
    wait 0.05;
    var_0 = getaiarray( "allies" );
    var_1 = getentarray( "start_golf_friendly_teleport", "targetname" );

    foreach ( var_4, var_3 in var_0 )
        var_3 forceteleport( var_1[var_4].origin, var_1[var_4].angles );

    var_5 = getent( "start_golf_friendly_trigger", "script_noteworthy" );
    var_5 notify( "trigger", level.player );
    common_scripts\_exploder::exploder( "c130_crash_leftovers" );
    thread maps\arcadia_code::_id_AD20();
}

_id_C818()
{
    soundscripts\_snd::snd_message( "startCrash_checkpoint" );
    maps\arcadia_lighting::_id_C003( "arcadia_crash" );
    maps\arcadia_code::_id_BC5D( "playerstart_crash" );
    common_scripts\utility::flag_set( "fridge_guy" );
    common_scripts\utility::flag_set( "ending_prep" );
    common_scripts\utility::flag_set( "used_laser" );
    common_scripts\utility::flag_set( "disable_stryker_dialog" );
    wait 0.05;
    level notify( "golf_course_mansion" );
    level._id_C7A3 connectpaths();
    level._id_C7A3 delete();
    var_0 = getaiarray( "allies" );
    var_1 = getentarray( "start_crash_friendly_teleport", "targetname" );

    foreach ( var_4, var_3 in var_0 )
    {
        var_3 forceteleport( var_1[var_4].origin, var_1[var_4].angles );
        var_3.goalradius = 32;
        var_3 setgoalpos( var_1[var_4].origin );
    }

    var_5 = getent( "start_crash_friendly_respawn_trigger", "script_noteworthy" );
    var_5 notify( "trigger", level.player );
    thread _id_A832();
    thread maps\arcadia_code::_id_AD20();
}

_id_B665()
{
    common_scripts\utility::flag_wait( "objective_aa_guns_given" );
    objective_add( 0, "current", &"ARCADIA_OBJECTIVE_LOCATE_AA_GUNS" );
    objective_onentity( 0, level.foley );
    common_scripts\utility::flag_wait( "objective_brookmere_road_given" );
    objective_add( 1, "invisible", &"ARCADIA_OBJECTIVE_BROOKMERE" );
    objective_state( 1, "active" );
}

_id_CAD9()
{
    if ( common_scripts\utility::flag( "objective_laze_golfcourse" ) )
        return;

    common_scripts\utility::flag_set( "objective_laze_golfcourse" );
    level notify( "objective_laze_golfcourse" );
    wait 0.05;
    thread _id_A832();
    objective_string( 0, &"ARCADIA_OBJECTIVE_NEUTRALIZE_AA_GUNS" );
    objective_state( 0, "current" );
    objective_position( 0, ( 0.0, 0.0, 0.0 ) );
    objective_additionalposition( 0, 0, getent( "obj_location_stealth_0", "targetname" ).origin );
    objective_additionalposition( 0, 1, getent( "obj_location_stealth_1", "targetname" ).origin );
    thread maps\arcadia_code::_id_BCBF();
    common_scripts\utility::flag_wait( "stealth_bombed_0" );
    common_scripts\utility::flag_wait( "stealth_bombed_1" );
    wait 3.0;
    objective_state( 0, "done" );
    wait 2;
    common_scripts\utility::flag_set( "golfcourse_vehicles_dead" );
}

_id_A832()
{
    common_scripts\utility::flag_wait_any( "second_bridge", "golfcourse_vehicles_dead" );
    thread _id_C390();
    thread _id_D3F9();
    wait 3;
    var_0 = getent( "objective_brookmere_location", "targetname" );
    objective_add( 1, "current", &"ARCADIA_OBJECTIVE_BROOKMERE", var_0.origin );
    objective_state( 1, "current" );
    thread _id_D1E6();
}

_id_D3F9()
{
    common_scripts\utility::flag_wait( "player_approaching_house" );
    objective_add( 1, "active", &"ARCADIA_OBJECTIVE_EXTRACT_VIP" );
    objective_state( 1, "current" );
    objective_position( 1, ( 14742.0, -6400.0, 2584.0 ) );
    common_scripts\utility::flag_wait( "start_ending" );
    objective_state_nomessage( 1, "done" );
}

_id_D1E6()
{
    common_scripts\utility::flag_wait( "player_can_pick_up_briefcase" );
    var_0 = getent( "objective_intel_location", "targetname" );
    objective_add( 3, "current", &"ARCADIA_OBJECTIVE_INTEL_BRIEFCASE", var_0.origin );
}

_id_C390()
{
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::flavorbursts_off( "allies" );
    level.foley thread maps\_anim::anim_single_solo( level.foley, "arcadia_fly_headingto4677" );
    wait 7.5;
    level.foley thread maps\_anim::anim_single_solo( level.foley, "arcadia_fly_lookingfor" );
    wait 3;
    maps\_utility::radio_dialogue( "arcadia_shp_genshep" );
    maps\_utility::radio_dialogue( "arcadia_shp_panicroom" );
    level.foley thread maps\_anim::anim_single_solo( level.foley, "arcadia_fly_yessir" );
    wait 1;
    maps\_utility::radio_dialogue( "arcadia_shp_phoenix" );
    maps\_utility::radio_dialogue( "arcadia_shp_reportback" );
    wait 0.5;
    level.foley thread maps\_anim::anim_single_solo( level.foley, "arcadia_fly_heardtheman" );
    wait 2.0;
    maps\_utility::flavorbursts_on( "allies" );
}

_id_D014()
{
    common_scripts\utility::flag_wait( "first_bridge" );
    var_0 = getaiarray( "allies" );

    foreach ( var_3, var_2 in var_0 )
    {
        if ( var_3 == var_0.size - 2 || var_3 == var_0.size - 1 )
        {
            var_2 thread maps\_utility::disable_replace_on_death();
            var_2.health = 1;
        }

        var_2 thread maps\_utility::set_force_color( "g" );
    }
}

_id_CC06()
{
    common_scripts\utility::flag_wait( "enemies_yellow_house" );
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_yellowhouse" );
}

_id_AD33()
{
    common_scripts\utility::flag_wait( "enemies_grey_house" );
    level._id_ACC0 thread maps\_utility::dialogue_queue( "arcadia_cpd_greyhouse" );
    wait 1;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_greyhouse" );
}

_id_B56D()
{
    common_scripts\utility::flag_wait( "enemies_pink_house" );
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_suppressingfire" );
    wait 8;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_suppressingfire" );
}

_id_BB51()
{
    common_scripts\utility::flag_wait( "enemies_apartments" );
    level._id_ACC0 thread maps\_utility::dialogue_queue( "arcadia_cpd_apartments" );
    wait 1;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_apartments" );
}

_id_AE0E()
{
    maps\_utility::battlechatter_off( "allies" );
    wait 5;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_heavylosses" );
    wait 1;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_destroytriplea" );
    common_scripts\utility::flag_set( "objective_aa_guns_given" );
    maps\_utility::battlechatter_on( "allies" );
    wait 10;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_getoffstreets" );
    wait 10;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_offstreets" );
    wait 15;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_outtastreets" );
    wait 15;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_flankthruhouses" );
    wait 20;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_movethruhouses" );
}

_id_AAA2()
{
    self waittill( "trigger" );
    var_0 = undefined;
    var_1 = undefined;
    var_2 = randomint( 4 );

    switch ( var_2 )
    {
        case 0:
            var_0 = level.foley;
            var_1 = "arcadia_fly_everyoneup";
            break;
        case 1:
            var_0 = level.foley;
            var_1 = "arcadia_fly_moveup";
            break;
        case 2:
            var_0 = level._id_ACC0;
            var_1 = "arcadia_cpd_moveup";
            break;
        case 3:
            var_0 = level._id_ACC0;
            var_1 = "arcadia_cpd_letsgo";
            break;
    }

    var_0 thread maps\_utility::dialogue_queue( var_1 );
}

_id_C1E1()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "stryker_rpg_danger_dialog_1" );
    wait 8;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_protectstryker" );
    common_scripts\utility::flag_wait( "stryker_rpg_danger_dialog_2" );
    wait 8;
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_watchforrpgs" );
    common_scripts\utility::flag_wait( "stryker_rpg_danger_dialog_3" );
    wait 8;
    maps\_utility::radio_dialogue( "arcadia_str_rpgfire" );
    level.foley thread maps\_utility::dialogue_queue( "arcadia_fly_wereonit" );
}

_id_AAAD()
{
    common_scripts\utility::flag_wait( "crashing_c130" );
    thread _id_AC2C();
    wait 3;
    var_0 = undefined;
    var_1 = undefined;
    var_2 = getaiarray( "allies" );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 maps\_utility::is_hero() )
            continue;

        if ( !isdefined( var_0 ) )
            var_0 = var_4;
        else
            var_1 = var_4;

        if ( isdefined( var_0 ) && isdefined( var_1 ) )
            break;
    }

    var_0 endon( "death" );
    var_1 endon( "death" );
    var_0 maps\_anim::anim_generic( var_0, "arcadia_ar1_lookac130" );
    var_1 maps\_anim::anim_generic( var_1, "arcadia_ar2_dontfly" );
    var_0 maps\_anim::anim_generic( var_0, "arcadia_ar1_suckstobethem" );
    var_1 maps\_anim::anim_generic( var_1, "arcadia_ar2_huah" );
}

_id_C16B()
{
    common_scripts\utility::flag_wait( "past_checkpoint" );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::flavorbursts_off( "allies" );
    common_scripts\utility::flag_set( "disable_stryker_dialog" );
    maps\_utility::radio_dialogue( "arcadia_hqr_sitrep" );
    level.foley maps\_utility::dialogue_queue( "arcadia_fly_intoarcadia" );
    maps\_utility::radio_dialogue( "arcadia_hqr_neworders" );
    level.foley maps\_utility::dialogue_queue( "arcadia_fly_solidcopy" );
    maps\_utility::radio_dialogue( "arcadia_hqr_divertto4677" );
    level.foley maps\_utility::dialogue_queue( "arcadia_fly_divertto4677" );
    maps\_utility::radio_dialogue( "arcadia_hqr_checkback" );
    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::flavorbursts_on( "allies" );
    common_scripts\utility::flag_clear( "disable_stryker_dialog" );
    common_scripts\utility::flag_set( "objective_brookmere_road_given" );
}

_id_C582()
{
    common_scripts\utility::flag_wait( "fridge_guy" );
    var_0 = maps\_utility::spawn_targetname( "fridge_guy_spawner" );
    level._id_C863 = var_0;
    var_0.animname = "fridge_guy";
    var_0 maps\_utility::set_ignoreme( 1 );
    var_0 maps\_utility::disable_surprise();
    thread _id_CB13( var_0 );
    var_1 = getent( "fridge", "targetname" );
    var_1.animname = "fridge";
    var_1 maps\_anim::setanimtree();
    var_2 = spawn( "script_model", var_0.origin );
    var_2 setmodel( "cs_vodkabottle01" );
    var_2 linkto( var_0, "tag_inhand", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 thread _id_AED4( var_2 );
    var_0 thread _id_C337( var_2 );
    var_3[0] = var_0;
    var_3[1] = var_1;
    var_1 thread maps\_anim::anim_loop( var_3, "fridge_idle", "stop_idle" );
    var_0.allowdeath = 1;
    var_1 thread _id_BCA5( var_3 );
}

_id_CB13( var_0 )
{
    var_0 waittill( "death" );
    wait 3.0;
    common_scripts\utility::flag_set( "icepick_callout" );
}

_id_AED4( var_0 )
{
    self endon( "death" );
    self waittillmatch( "single anim", "break_bottle" );
    var_0 notify( "delete" );
    var_0 delete();
}

_id_C337( var_0 )
{
    var_0 endon( "delete" );
    self waittill( "death" );
    var_0 delete();
}

_id_B2E7( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "damage" );
    maps\_utility::trigger_wait( "fridge_guy_react", "targetname" );
}

_id_BCA5( var_0 )
{
    var_0[0] endon( "death" );
    _id_B2E7( var_0[0] );
    self notify( "stop_idle" );
    thread maps\_anim::anim_single( var_0, "fridge_react" );
    var_0[0] maps\_utility::set_ignoreme( 0 );
}

_id_CC0D()
{
    common_scripts\utility::flag_wait( "heros_become_red" );
    var_0 = getnode( "finalRedIndex", "targetname" );
    level.currentcolorforced[level.foley maps\_colors::get_team()]["r"] = var_0.script_color_allies;
    level.foley thread maps\_utility::set_force_color( "r" );
    level.foley.animplaybackrate = 1.2;
    level.foley allowedstances( "stand" );
    level._id_ACC0 thread maps\_utility::set_force_color( "r" );
    level._id_ACC0.animplaybackrate = 1.2;
    level._id_ACC0 allowedstances( "stand" );
}

_id_CD7C()
{
    thread _id_CD8E();
    common_scripts\utility::flag_wait( "ending_prep" );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    maps\_utility::flavorbursts_off( "allies" );
    maps\_utility::flavorbursts_off( "axis" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
        var_2.baseaccuracy = 100;

    var_4 = getnode( "housenode_foley", "targetname" );
    var_5 = getnode( "housenode_dunn", "targetname" );
    var_6 = getnode( "hallnode_foley", "targetname" );
    var_7 = getnode( "hallnode_dunn", "targetname" );
    var_8 = getnode( "ending_node_foley", "targetname" );
    var_9 = getent( "ending_node_dunn", "targetname" );
    var_10 = getnode( "node_dunn_guard", "targetname" );
    thread _id_CD10( "ending_enemy_spawner", "ending_node_hvi", "generic", "panicroom_viktor_turnhead" );
    level.foley pushplayer( 1 );
    level._id_ACC0 pushplayer( 1 );
    wait 0.1;
    level.foley.goalradius = 16;
    level.foley setgoalnode( var_4 );
    level._id_ACC0.goalradius = 16;
    level._id_ACC0 setgoalnode( var_5 );
    common_scripts\utility::flag_wait( "player_approaching_house" );
    level.foley.goalradius = 16;
    level.foley setgoalnode( var_6 );
    wait 0.5;
    level._id_ACC0.goalradius = 16;
    level._id_ACC0 setgoalnode( var_7 );
    common_scripts\utility::flag_wait( "end_dialog_done" );
    maps\_utility::nextmission();
}

_id_BC9B( var_0 )
{
    level._id_ACC0 allowedstances( "stand" );
    var_0 maps\_anim::anim_teleport_solo( level._id_ACC0, "ending" );
    var_0 maps\_anim::anim_single_solo( level._id_ACC0, "ending" );
    level._id_ACC0.alertlevel = "noncombat";
    level._id_ACC0.goalradius = 16;
    level._id_ACC0 allowedstances( "stand" );
    level._id_ACC0 setgoalpos( level._id_ACC0.origin );
}

_id_CD10( var_0, var_1, var_2, var_3 )
{
    var_4 = getent( var_0, "targetname" );
    var_5 = getent( var_1, "targetname" );
    var_6 = _id_AD6E( var_4 );
    var_6.animname = var_2;
    var_5 thread maps\_anim::anim_first_frame_solo( var_6, var_3 );
    common_scripts\utility::flag_wait( "picked_up_briefcase" );
    var_5 maps\_anim::anim_single_solo( var_6, var_3 );
    var_5 thread maps\_anim::anim_last_frame_solo( var_6, var_3 );
}
#using_animtree("generic_human");

_id_AD6E( var_0 )
{
    var_1 = var_0 maps\_utility::spawn_ai( 1 );
    var_1 maps\_utility::gun_remove();
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = var_1.angles;
    var_2 setmodel( var_1.model );
    var_3 = var_1 getattachsize();

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        var_5 = var_1 getattachmodelname( var_4 );
        var_6 = var_1 getattachtagname( var_4 );
        var_2 attach( var_5, var_6, 1 );
    }

    var_2 useanimtree( #animtree );
    var_1 delete();
    return var_2;
}

_id_CD8E()
{
    common_scripts\utility::flag_wait( "icepick_callout" );
    level.foley maps\_utility::dialogue_queue( "arcadia_fly_icepick1" );
    wait 1.5;
    common_scripts\utility::flag_wait( "player_upstairs" );
    var_0 = getent( "ending_node_hvi", "targetname" );
    thread handledunn( var_0 );
    level.foley waittill( "goal" );

    if ( !common_scripts\utility::flag( "start_ending" ) )
    {
        level.foley maps\_utility::cqb_walk( "on" );
        var_0 maps\_anim::anim_reach_solo( level.foley, "panicroom_foley_intro" );
        var_0 maps\_anim::anim_single_solo( level.foley, "panicroom_foley_intro" );
        thread maps\_utility::music_play( "mus_arcadia_panicroom" );

        if ( !common_scripts\utility::flag( "start_ending" ) )
        {
            var_0 thread maps\_anim::anim_loop_solo( level.foley, "panicroom_foley_intro_idle", "stop_foley" );
            common_scripts\utility::flag_wait( "start_ending" );
            var_0 notify( "stop_foley" );
            waitframe();
        }

        var_0 maps\_anim::anim_single_solo( level.foley, "panicroom_foley_intro_walk" );
    }
    else
    {
        thread maps\_utility::music_play( "mus_arcadia_panicroom" );
        var_0 maps\_anim::anim_reach_solo( level.foley, "panicroom_foley_panicroom" );
    }

    var_0 maps\_anim::anim_single_solo( level.foley, "panicroom_foley_panicroom" );
    var_0 thread maps\_anim::anim_loop_solo( level.foley, "panicroom_foley_idle", "stop_foley" );
    common_scripts\utility::flag_set( "player_can_pick_up_briefcase" );
    common_scripts\utility::flag_wait( "picked_up_briefcase" );
    objective_state( 3, "done" );
    common_scripts\utility::flag_set( "examine_tats" );
    var_0 notify( "stop_foley" );
    var_0 maps\_anim::anim_single_solo( level.foley, "panicroom_foley_outro" );
}

handledunn( var_0 )
{
    common_scripts\utility::flag_wait( "start_ending" );
    var_0 maps\_anim::anim_reach_solo( level._id_ACC0, "panicroom_dunn_intro" );
    var_0 maps\_anim::anim_single_solo( level._id_ACC0, "panicroom_dunn_intro" );
    var_0 thread maps\_anim::anim_loop_solo( level._id_ACC0, "panicroom_dunn_idle", "stop_dunn" );
    common_scripts\utility::flag_wait( "picked_up_briefcase" );
    var_0 notify( "stop_dunn" );
    var_0 maps\_anim::anim_single_solo( level._id_ACC0, "panicroom_dunn_outro" );
}

h2_hvi_spawn()
{
    var_0 = getent( "hvi_spawner", "targetname" );
    var_1 = self;
    var_2 = _id_AD6E( var_0 );
    var_2.animname = "panicroom_hvi";
    var_1 thread maps\_anim::anim_first_frame_solo( var_2, "h2_briefcase_pickup" );
    var_2 attach( "cellphone_kit_05", "tag_inhand" );
    return var_2;
}

_id_C6C7()
{
    var_0 = getent( "ending_node_hvi", "targetname" );
    var_1 = var_0 h2_hvi_spawn();
    var_2 = getent( "briefcase_trigger", "targetname" );
    var_2 thread common_scripts\utility::_id_AE1E( level.player, &"ARCADIA_PICK_UP_BRIEFCASE_HINT", &"ARCADIA_PICK_UP_BRIEFCASE_HINT_PC", "trigger", thisthread );
    var_2 setcursorhint( "HINT_ACTIVATE" );
    var_3 = getent( "briefcase", "targetname" );
    var_3 maps\_utility::assign_animtree( "briefcase" );
    var_0 thread maps\_anim::anim_first_frame_solo( var_3, "h2_briefcase_pickup" );
    var_2 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( "player_can_pick_up_briefcase" );
    var_3 setmodel( "com_metal_briefcase_opened_obj" );
    var_2 common_scripts\utility::trigger_on();
    var_2 waittill( "trigger" );
    var_3 thread common_scripts\utility::play_sound_in_space( "intelligence_briefcase_pickup" );
    var_3 setmodel( "com_metal_briefcase_opened" );
    var_4 = 0.6;

    if ( level.player getstance() == "prone" )
        var_4 = 0.8;

    level.player setstance( "stand" );
    var_5 = [ var_3, var_1 ];
    thread briefcase_pickup_bodysense_cinematic( var_4 );
    var_0 maps\_utility::_id_C0F0( "h2_briefcase_pickup", var_5, 0, var_4, 1 );
    common_scripts\utility::flag_set( "picked_up_briefcase" );
    var_2 delete();
    var_3 delete();
}

briefcase_pickup_bodysense_cinematic( var_0 )
{
    var_1 = _id_D397::_id_A97A( "briefcase_pickup_bodysense" );
    waittillframeend;
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 4.0, -1, 32, 32 ) _id_D397::_id_CCA7( level.player._id_C309, "tag_dof" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_1 _id_D397::_id_BEA0( 5.0 + var_0 ) _id_D397::_id_BF3F();
    var_1 _id_D397::_id_BEA0( 0.85 + var_0 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 1.1 + var_0 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 2.55 + var_0 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 3.1 + var_0 ) _id_D397::_id_B85E( 0.12, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_1 _id_D397::_id_BEA0( 3.65 + var_0 ) _id_D397::_id_B85E( 0.08, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 4.35 + var_0 ) _id_D397::_id_B85E( 0.04, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 4.6 + var_0 ) _id_D397::_id_B85E( 0.06, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BC26();
}

_id_AC2C()
{
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "vip_gun_down" );
    setsaveddvar( "cg_gunDownAnimDelayTime", 250 );
}

neighborhood_b_heli_death_animation()
{
    self waittill( "death" );
    self setanim( level.scr_anim["blackhawk_death_additive"]["hit_rear"] );
}

_id_AE32()
{
    level common_scripts\utility::waittill_any( "createfx_common_done", "start_is_set" );
    common_scripts\utility::flag_init( "disable_fx_last_section" );
    common_scripts\utility::flag_init( "disable_fx_first_section" );

    if ( isdefined( level.start_point ) )
    {
        if ( level.start_point == "crash" || level.start_point == "golf" )
            common_scripts\utility::flag_set( "disable_fx_first_section" );
        else
            common_scripts\utility::flag_set( "disable_fx_last_section" );
    }

    var_0 = "first_section_fx_vol";
    maps\_utility::_id_D193( var_0, undefined, "disable_fx_first_section" );
    maps\_utility::_id_CD67( var_0, getentarray( "fx_volume_first_section", "targetname" ) );
    var_0 = "last_section_fx_vol";
    maps\_utility::_id_D193( var_0, undefined, "disable_fx_last_section" );
    maps\_utility::_id_CD67( var_0, getentarray( "fx_volume_last_section", "targetname" ) );
}

animate_chandelier()
{
    common_scripts\utility::flag_wait( "ending_prep" );
    var_0 = getent( "chandelier_animated", "targetname" );
    var_0 maps\_utility::assign_animtree( "chandelier" );
    var_0 maps\_anim::anim_loop_solo( var_0, "idle" );
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
