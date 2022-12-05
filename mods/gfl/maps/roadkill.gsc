// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" )
    {
        maps\roadkill_beautiful_corner::main();
        return;
    }

    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\roadkill_mission_select_cam::_id_C490();
        return;
    }

    thread _id_A9B2();
    setdvar( "newintro", 1 );
    level._id_D57E = 0;
    level._id_B65E = 1;
    precacheitem( "m14_scoped" );
    precacheitem( "littlebird_FFAR" );
    maps\_drone_ai::init();
    _id_C028::main();
    _id_D0E9::main();
    maps\roadkill_anim::main();
    maps\roadkill_lighting::main();
    _id_B342::main();
    _id_B42D::main();
    maps\_vehicle::_id_CCF4( "script_vehicle_laatpv_minigun_physics_player", maps\roadkill_anim::_id_C3C8, maps\roadkill_anim::_id_C052 );
    maps\roadkill_code::_id_C871();
    maps\_utility::set_default_start( "riverbank" );
    maps\_utility::add_start( "riverbank", ::_id_AC19, "riverbank", ::_id_CED2 );
    maps\_utility::add_start( "convoy", ::_id_AF49, "convoy", ::_id_BD1B );
    maps\_utility::add_start( "ride", ::_id_D537, "ride", ::_id_D37E );
    maps\_utility::add_start( "ambush", ::_id_B137, "ambush", ::_id_BFDD );
    maps\_utility::add_start( "ride_later", ::_id_CB08, "ride_later", ::_id_CDA9 );
    maps\_utility::add_start( "dismount", ::_id_C64C, "dismount", ::_id_A8E2 );
    maps\_utility::add_start( "school", ::_id_CFA1, "school", ::_id_AC24 );
    maps\_utility::add_start( "endfight", ::_id_CAEE, "end", ::_id_CF76 );
    maps\_utility::add_start( "end", ::_id_C2C8, "end", ::_id_CF76 );
    precacheturret( "latvee_50cal_mg" );
    precacheturret( "rpd_bipod_prone" );
    precacheturret( "rpd_bipod_crouch" );
    precachemodel( "weapon_m16" );
    precachemodel( "weapon_rpd_mg_setup" );
    precachemodel( "com_soup_can" );
    precachemodel( "com_bottle1" );
    precachemodel( "me_plastic_crate1" );
    precachemodel( "mil_mre_chocolate01" );
    precachemodel( "weapon_binocular" );
    precachemodel( "vehicle_laatpv_seat_rb_obj" );
    precachemodel( "viewhands_player_us_army" );
    precachemodel( "hat_opforce_arab_d" );
    precachemodel( "electronics_camera_pointandshoot_low" );
    precachemodel( "h2_rkl_cellphone_camera" );
    precachemodel( "viewbody_us_army" );
    precachemodel( "weapon_suburban_minigun_viewmodel" );
    precacherumble( "collapsing_building" );
    precacherumble( "tank_rumble" );
    precachemodel( "me_woodcrateclosed" );
    precachemodel( "com_cardboardboxshortclosed_2" );
    precachemodel( "com_hand_radio" );
    precacheitem( "scripted_silent" );
    precachemodel( "h2_rkl_handheld_gps" );
    precachestring( &"ROADKILL_BRIDGELAYER_DESTROYED" );
    precachestring( &"ROADKILL_HOLD_TO_BOARD" );
    precachestring( &"ROADKILL_SHOT_TOO_MUCH" );
    precachestring( &"ROADKILL_OBJECTIVE_BRIDGELAYER" );
    precachestring( &"ROADKILL_OBJECTIVE_LATVEE" );
    precachestring( &"ROADKILL_OBJECTIVE_AIRSTRIKE" );
    precachestring( &"ROADKILL_OBJECTIVE_SCAN" );
    precachestring( &"ROADKILL_OBJECTIVE_TARGETS" );
    precachestring( &"ROADKILL_OBJECTIVE_DISMOUNT" );
    precachestring( &"ROADKILL_OBJECTIVE_SECURE_TOP_FLOOR" );
    precachestring( &"ROADKILL_OBJECTIVE_SCHOOL" );
    precachestring( &"ROADKILL_OBJECTIVE_REPORT" );
    precachestring( &"ROADKILL_GOT_SNIPED" );
    precachestring( &"ROADKILL_SHOT_UNARMED" );
    precachestring( &"SCRIPT_MISSIONFAIL_KILLTEAM_AMERICAN" );
    precachestring( &"SCRIPT_LEARN_JAVELIN" );
    precachestring( &"SCRIPT_PLATFORM_HINT_FLASH" );
    precachestring( &"SCRIPT_LEARN_GRENADE_LAUNCHER" );
    precachestring( &"SCRIPT_WAYPOINT_TARGETS" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precachemodel( "h2_com_clipboard_wpaper_anim" );
    precachemodel( "h2_characters_accessories_pencil" );

    precachemodel( "h2_gfl_ump45_viewbody" );
    precachemodel( "h2_gfl_ump45_viewhands" );
    precachemodel( "h2_gfl_ump45_viewhands_player" );

    level._id_B9BB = maps\roadkill_code::_id_B9B6;
    level._id_CE62 = [];
    level._id_CE62["detour"] = spawnstruct();
    level._id_CE62["max"] = 4;
    level._id_C1F6 = [];
    level._id_AE2F = [];
    var_0 = getent( "trapper_clip", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    precachestring( &"SCRIPT_LEARN_JAVELIN" );
    vehicle_scripts\_empty::main( "tag_origin" );
    maps\_load::main();
    _id_AC65::init();
    maps\_utility::add_global_spawn_function( "neutral", maps\roadkill_code::_id_D3C7 );
    common_scripts\utility::flag_init( "intro_started" );
    common_scripts\utility::flag_init( "riverbank_baddies_retreat" );
    common_scripts\utility::flag_init( "binoc_explosion" );
    common_scripts\utility::flag_init( "player_gets_in" );
    common_scripts\utility::flag_init( "player_latvee_stops" );
    common_scripts\utility::flag_init( "shepherd_moves_out" );
    common_scripts\utility::flag_init( "shepherd_vehicles_leave" );
    common_scripts\utility::flag_init( "ambush_auto_adjust_speed" );
    common_scripts\utility::flag_init( "player_knocked_down" );
    common_scripts\utility::flag_init( "resume_the_path" );
    common_scripts\utility::flag_init( "bridgelayer_crosses" );
    common_scripts\utility::flag_init( "time_to_go_stair_guys" );
    common_scripts\utility::flag_init( "time_to_go" );
    common_scripts\utility::flag_init( "get_on_the_line" );
    common_scripts\utility::flag_init( "guys_get_in_convoy_vehicles" );
    common_scripts\utility::flag_init( "convoy_moment" );
    common_scripts\utility::flag_init( "lets_go_trigger" );
    common_scripts\utility::flag_init( "room_was_flashed" );
    common_scripts\utility::flag_init( "we're cut off" );
    common_scripts\utility::flag_init( "retreaters_run" );
    common_scripts\utility::flag_init( "final_objective" );
    common_scripts\utility::flag_init( "friendlies_run_to_school" );
    common_scripts\utility::flag_init( "leaving_riverbank" );
    common_scripts\utility::flag_init( "player_attacked_bridge_enemy" );
    common_scripts\utility::flag_init( "player_switched_to_javelin" );
    common_scripts\utility::flag_init( "missile_fire_1" );
    common_scripts\utility::flag_init( "missile_fire_2" );
    common_scripts\utility::flag_init( "missile_fire_3" );
    common_scripts\utility::flag_init( "push_through" );
    common_scripts\utility::flag_init( "100ton_bomb_goes_off" );
    common_scripts\utility::flag_init( "bridge_baddies_retreat" );
    common_scripts\utility::flag_init( "player_is_dismounted" );
    common_scripts\utility::flag_init( "hidden_guy_opens_fire" );
    common_scripts\utility::flag_init( "bridgelayer_starts" );
    common_scripts\utility::flag_init( "roadkill_school_10" );
    common_scripts\utility::flag_init( "roadkill_school_11" );
    common_scripts\utility::flag_init( "pull_garage" );
    common_scripts\utility::flag_init( "rpg_end" );
    common_scripts\utility::flag_init( "friendlies_suppress_school" );
    common_scripts\utility::flag_init( "intro_lines_complete" );
    common_scripts\utility::flag_init( "fight_back" );
    common_scripts\utility::flag_init( "trapper_spawners_ignoreme" );
    common_scripts\utility::flag_init( "riverbank_scene_starts" );
    common_scripts\utility::flag_init( "player_closes_gap" );
    common_scripts\utility::flag_init( "bridgelayer_complete" );
    common_scripts\utility::flag_init( "convoy_oscar_mike_after_explosion" );
    common_scripts\utility::flag_init( "bridge_layer_attacked_by_bridge_baddies" );
    common_scripts\utility::flag_init( "shot_rings_out" );
    common_scripts\utility::flag_init( "latvees_spin_up" );
    common_scripts\utility::flag_init( "video_tapers_react" );
    common_scripts\utility::flag_init( "playground_baddies_retreat" );
    common_scripts\utility::flag_init( "sweep_dismount_building" );
    common_scripts\utility::flag_init( "h2_intro_done" );
    common_scripts\utility::flag_init( "intro_latvee_complete" );
    common_scripts\utility::flag_init( "safe_to_delete_bridge_allies" );
    _id_D3B8::_id_C752();
    maps\_utility::add_hint_string( "learn_javelin", &"SCRIPT_LEARN_JAVELIN", maps\roadkill_code::_id_CE58, undefined, "medium_background" );
    maps\_utility::add_hint_string( "learn_flash", &"SCRIPT_PLATFORM_HINT_FLASH", maps\roadkill_code::_id_ACAE, undefined, "medium_background" );
    maps\_utility::add_hint_string( "learn_m203", &"SCRIPT_LEARN_GRENADE_LAUNCHER", maps\roadkill_code::_id_AA6D, undefined, "medium_background" );
    maps\_utility::add_global_spawn_function( "allies", maps\roadkill_code::get_in_moving_vehicle );
    maps\_utility::add_global_spawn_function( "axis", maps\roadkill_code::_id_B403 );
    common_scripts\utility::run_thread_on_noteworthy( "fire_missile", vehicle_scripts\_attack_heli::boneyard_style_heli_missile_attack_linked );
    common_scripts\utility::run_thread_on_noteworthy( "plane_sound", _id_B596::plane_sound_node );
    common_scripts\utility::run_thread_on_targetname( "helper_model", maps\_utility::self_delete );
    common_scripts\utility::run_thread_on_targetname( "barbwire_ride_cutoff", maps\roadkill_code::_id_D161 );
    common_scripts\utility::run_thread_on_targetname( "vehicle_break", maps\roadkill_code::_id_CFA2 );
    common_scripts\utility::run_thread_on_targetname( "ent_flag_set_trigger", maps\roadkill_code::_id_B7CD );
    common_scripts\utility::run_thread_on_targetname( "trigger_delete_axis_not_in_volume", maps\roadkill_code::_id_BE93 );
    level._id_CD82 = [];
    level._id_B9A9 = [];
    common_scripts\utility::run_thread_on_targetname( "spark_preset", maps\roadkill_code::_id_B243 );
    common_scripts\utility::run_thread_on_targetname( "vehicle_spark_trigger", maps\roadkill_code::_id_BCEE );
    maps\_compass::setupminimap( "compass_map_roadkill" );
    common_scripts\utility::run_thread_on_targetname( "deleteme", maps\_utility::self_delete );
    common_scripts\utility::run_thread_on_targetname( "damage_targ_trigger", maps\roadkill_code::_id_C268 );
    common_scripts\utility::run_thread_on_targetname( "wave_right_trigger", maps\roadkill_code::_id_D20C );
    level.moving_tank = getent( "moving_riverbank_tank", "targetname" );
    level.moving_tank maps\_utility::add_spawn_function( maps\roadkill_code::intro_moving_tank );
    maps\_utility::array_spawn_function_targetname( "riverbank_tank", maps\roadkill_code::_id_BEF6 );
    maps\_utility::array_spawn_function_noteworthy( "retreat_spawner", maps\roadkill_code::_id_CC5F );
    level._id_C815 = 0;
    maps\_utility::array_spawn_function_noteworthy( "extra_retreat_spawner", maps\roadkill_code::_id_ABCD );
    maps\_utility::array_spawn_function_noteworthy( "convoy_gunner", maps\roadkill_code::_id_D419 );
    maps\_utility::array_spawn_function_noteworthy( "dismount_macey", maps\roadkill_code::_id_AA3A );
    maps\_utility::array_spawn_function_noteworthy( "dismount_dunn", maps\roadkill_code::_id_C63F );
    maps\_utility::array_spawn_function_noteworthy( "school_unreachable_spawner", maps\roadkill_code::_id_B62B );
    thread maps\roadkill_code::_id_D23A();
    maps\_utility::array_spawn_function_targetname( "foley_spawner", maps\roadkill_code::_id_B701 );
    maps\_utility::array_spawn_function_noteworthy( "dunn_spawner", maps\roadkill_code::_id_C349 );
    maps\_utility::array_spawn_function_noteworthy( "shepherd_spawner", maps\roadkill_code::_id_C564 );
    level._id_A86D = [];
    maps\_utility::array_spawn_function_targetname( "ambushed_laatpv", maps\roadkill_code::_id_D135 );
    level._id_D2A2 = getentarray( "more_street_spawner", "script_noteworthy" );
    level._id_BB8E = getentarray( "school_ambush", "targetname" );
    maps\_utility::array_spawn_function( level._id_BB8E, maps\roadkill_code::_id_CDC0 );
    level.color_doesnt_care_about_classname = 1;
    level.color_doesnt_care_about_heroes = 1;
    level._id_D3A2 = spawnstruct();
    level._id_C672 = spawnstruct();
    level.special_weapon_dof_funcs["javelin"] = maps\_art::javelin_dof;
    var_1 = getentarray( "player_backtrack_blocker_model", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 hide();

    var_1 = getentarray( "player_backtrack_blocker_brush", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 hide();
        var_3 notsolid();
    }

    var_7 = getentarray( "dead_vehicle_spawner", "targetname" );

    foreach ( var_9 in var_7 )
    {
        var_9.oldcontents = var_9 setcontents( 0 );
        var_9 hide();
    }

    thread maps\roadkill_code::_id_AF3F();
    maps\roadkill_aud::main();
    maps\_utility::vision_set_fog_changes( "roadkill", 0 );
    thread _id_B57A();
    createthreatbiasgroup( "axis_school" );
    createthreatbiasgroup( "axis_school_unreachable" );
    createthreatbiasgroup( "axis_ambush_house" );
    createthreatbiasgroup( "axis_dismount_attackers" );
    createthreatbiasgroup( "ally_with_player" );
    createthreatbiasgroup( "ally_outside_school" );
    createthreatbiasgroup( "bridge_attackers" );
    createthreatbiasgroup( "just_player" );
    level.player setthreatbiasgroup( "just_player" );
    setignoremegroup( "ally_with_player", "axis_school_unreachable" );
    setignoremegroup( "axis_school_unreachable", "ally_with_player" );
    setignoremegroup( "ally_with_player", "axis_school" );
    setignoremegroup( "axis_school", "ally_with_player" );
    setthreatbias( "ally_outside_school", "axis_ambush_house", 750 );
    thread _id_CD01();
    thread _id_C944();
    common_scripts\utility::run_thread_on_targetname( "roadkill_tree", maps\roadkill_code::_id_D120 );
    thread _id_AB52::main();
    var_11 = getent( "pickup_crash_and_shoot", "targetname" );
    var_11 maps\_utility::add_spawn_function( maps\roadkill_code::_id_C31E, 0.05 );
    waittillframeend;
    level.player.bcnameid = undefined;
    thread maps\roadkill_code::bring_back_buildings();
    thread maps\roadkill_code::static_model_groups_think();
    common_scripts\utility::array_thread( getentarray( "building_collapse_lamp_post", "targetname" ), maps\roadkill_code::building_collapse_lamp_post );
}

_id_C0E1()
{

}

_id_B90D()
{
    common_scripts\utility::flag_set( "Beach_Begin_Section_Flag" );
    common_scripts\utility::flag_set( "City_Ceiling_Flag" );
    thread maps\roadkill_lighting::_id_B036();
    common_scripts\utility::array_call( getentarray( "city_dynamics_models", "targetname" ), ::hide );
    common_scripts\utility::array_call( getentarray( "inside_school_dynamiques", "script_noteworthy" ), ::hide );
    thread maps\roadkill_code::_id_AC50();
    var_0 = getent( "bridge_layer_clipbrush", "targetname" );
    var_0 disconnectpaths();
    var_1 = getentarray( "destroyed_latvee_model", "targetname" );
    common_scripts\utility::array_thread( var_1, common_scripts\utility::hide_notsolid );
    maps\_utility::array_spawn_function_noteworthy( "enemy_riverbank_rpg_spawner", maps\roadkill_code::_id_B341 );
    thread maps\roadkill_code::_id_C967();
    maps\_utility::array_spawn_function_targetname( "foley_spawner", maps\roadkill_code::_id_BEDB );
    maps\_utility::array_spawn_function_noteworthy( "stryker", maps\roadkill_code::_id_D25E );
    maps\_utility::array_spawn_function_noteworthy( "network_chatter_spawner1", maps\roadkill_code::_id_C761 );
    maps\_utility::array_spawn_function_noteworthy( "network_chatter_spawner2", maps\roadkill_code::_id_C761 );
    maps\_utility::add_global_spawn_function( "allies", maps\roadkill_code::_id_A9A0 );
    maps\_utility::array_spawn_targetname( "foley_spawner" );

    if ( maps\_utility::is_default_start() )
    {
        thread maps\roadkill_code::h2_roadkill_new_intro();
        maps\_utility::array_spawn_noteworthy( "shepherd_spawner" );
        thread maps\roadkill_code::_id_C80F();
    }

    maps\roadkill_code::_id_CA41();
    level._id_AB11 = [];
    maps\_utility::array_spawn_function_targetname( "riverbank_spawner", maps\roadkill_code::_id_C793 );
    thread maps\roadkill_aud::_id_BB0B();
    thread maps\roadkill_code::_id_C6E5();
    thread maps\roadkill_code::_id_C46C();

    if ( !getdvarint( "use_old_waving_guy" ) )
    {
        var_2 = getent( "stair_wave_spawner", "targetname" );
        var_2 maps\_utility::add_spawn_function( maps\roadkill_code::_id_C14D );
        var_2 maps\_utility::spawn_ai();
    }

    maps\_utility::array_spawn_function_targetname( "enemy_bridge_spawner", maps\roadkill_code::_id_BA9B );

    if ( maps\_utility::is_default_start() )
    {
        thread maps\roadkill_code::_id_B321();
        common_scripts\utility::run_thread_on_targetname( "cover_scene_rock", maps\roadkill_code::_id_CC5D );
        common_scripts\utility::run_thread_on_targetname( "candy_man", maps\roadkill_code::_id_C0AA );
        common_scripts\utility::run_thread_on_targetname( "riverbank_mg", maps\roadkill_code::_id_C205 );
    }

    maps\_utility::array_spawn_function_targetname( "enemy_riverbank_spawner", maps\roadkill_code::_id_AE14 );
    maps\_utility::array_spawn_targetname( "enemy_riverbank_spawner" );
    maps\_utility::array_spawn_function_noteworthy( "player_personal_convoy", maps\roadkill_code::_id_C057 );
    maps\_utility::add_global_spawn_function( "allies", maps\roadkill_code::_id_CEF2, 1 );
    maps\_vehicle::spawn_vehicles_from_targetname( "riverbank_tank" );
    level.moving_tank maps\_utility::delaythread( 4.5, maps\_vehicle::spawn_vehicle_and_gopath );
    common_scripts\utility::run_thread_on_targetname( "mortar_org", maps\roadkill_code::_id_CF90 );
    maps\_utility::array_spawn_targetname( "riverbank_spawner" );
    level._id_B359 = [];
    maps\_utility::array_spawn_function_targetname( "stair_block_guy", maps\roadkill_code::_id_BE4B );

    if ( maps\_utility::is_default_start() )
        maps\_utility::array_spawn_targetname( "stair_block_guy" );

    thread maps\roadkill_code::_id_B777();
}

_id_AC19()
{
    soundscripts\_snd::snd_message( "start_riverbank_checkpoint" );
    soundscripts\_audio_mix_manager::mm_add_submix( "intro_fight_part_a_mix" );
    setsaveddvar( "g_friendlyNameDist", 0 );
    common_scripts\utility::noself_delaycall( 3, ::setsaveddvar, "g_friendlyNameDist", 15000 );
    _id_B90D();
}

_id_B40F()
{
    thread _id_B90D();
}

_id_CED2()
{
    common_scripts\utility::setaicount( 64 );
    var_0 = getentarray( "enemy_riverhouse_spawner", "targetname" );
    var_1 = getentarray( "enemy_riverside_spawner", "targetname" );
    maps\_utility::array_spawn_function( var_0, maps\roadkill_code::_id_ABF7 );
    maps\_utility::array_spawn_function( var_1, maps\roadkill_code::_id_ABF7 );
    thread maps\roadkill_code::_id_AFC3( var_0 );
    thread maps\roadkill_code::_id_BD1C( var_1 );
    maps\_utility::delaythread( 25, ::_id_B2F1, "littlebird_attacks", 9 );
    maps\_utility::delaythread( 30, ::_id_B2F1, "littlebird_attacks_2", 11 );
}

_id_AF49()
{
    soundscripts\_snd::snd_message( "start_convoy_checkpoint" );
    _id_B90D();
    var_0 = common_scripts\utility::getstruct( "start_ride_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
}

_id_BD1B()
{
    var_0 = getent( "friendly_video_blocker", "targetname" );
    var_0 solid();
    var_0 connectpaths();
    var_0 notsolid();
    level._id_CC04 = 0;
    thread maps\roadkill_code::_id_B548();
    maps\_utility::array_spawn_function_targetname( "riverbank_bmp", maps\roadkill_code::_id_BEF6 );
    thread maps\roadkill_code::_id_AB9D();
    thread maps\roadkill_code::_id_D4F6();
    maps\_utility::array_spawn_function_targetname( "lead_vehicle_spawner", maps\roadkill_code::_id_B83F );
    maps\_utility::array_spawn_function_targetname( "ride_vehicle_starts_spawned", maps\roadkill_code::_id_B83F );
    level._id_AECC = [];
    level._id_BFF7 = [];
    var_1 = getent( "guy_gets_in_vehicle", "targetname" );
    var_1 thread maps\roadkill_code::_id_C05E();
    var_2 = getent( "stairs_blocker", "targetname" );
    var_2 connectpaths();
    var_2 delete();
    var_3 = getent( "friendly_midroad_blocker", "targetname" );
    var_3 connectpaths();
    var_3 delete();
    var_4 = getentarray( "player_backtrack_blocker_model", "targetname" );

    foreach ( var_0 in var_4 )
        var_0 show();

    var_4 = getentarray( "player_backtrack_blocker_brush", "targetname" );

    foreach ( var_0 in var_4 )
    {
        var_0 show();
        var_0 solid();
    }

    maps\_utility::array_spawn_function_noteworthy( "friendly_open_latvee", maps\roadkill_code::_id_BD77 );
    maps\_utility::array_spawn_function_targetname( "player_ride_vehicle", maps\roadkill_code::_id_A9A3 );
    maps\_utility::array_spawn_function_targetname( "ride_vehicle_starts_moving", maps\roadkill_code::_id_B8E5 );

    if ( !maps\_utility::is_default_start() )
        wait 0.1;

    level._id_A9A3 = maps\_vehicle::spawn_vehicle_from_targetname( "player_ride_vehicle" );
    maps\_vehicle::spawn_vehicles_from_targetname( "ride_vehicle_starts_moving" );
    level._id_A9A3 maps\roadkill_code::intro_hide_entity();
    level._id_A9A3 thread maps\roadkill_aud::_id_B713();
    thread maps\roadkill_code::_id_D36C();

    if ( maps\_utility::is_default_start() || level.start_point == "riverbank" )
        common_scripts\utility::flag_wait( "get_on_the_line" );

    common_scripts\utility::flag_wait_or_timeout( "player_enters_riverbank", 10 );
    common_scripts\utility::flag_set( "riverbank_scene_starts" );

    if ( maps\_utility::is_default_start() )
    {
        maps\_utility::add_func( maps\roadkill_code::_id_BE06 );
        maps\_utility::add_func( maps\roadkill_code::_id_B2E0 );
        thread maps\_utility::do_funcs();
    }

    common_scripts\utility::flag_wait( "bridge_baddies_retreat" );
    maps\_utility::autosave_by_name( "bridge_baddies_retreat" );
    common_scripts\utility::flag_wait( "bridgelayer_crosses" );
    var_9 = getent( "bridge_layer_clipbrush", "targetname" );
    var_9 connectpaths();
    var_9 delete();
    soundscripts\_audio_mix_manager::mm_clear_submix( "intro_fight_part_b_mix" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "leaving_riverbank" );
    maps\_utility::add_func( maps\roadkill_code::_id_AF89 );
    maps\_utility::add_func( maps\roadkill_code::_id_CDC9 );
    maps\_utility::add_func( maps\roadkill_code::_id_B66F );
    maps\_utility::add_func( maps\_utility::autosave_by_name, "leaving_riverbank" );
    maps\_utility::do_wait();

    if ( getdvarint( "use_old_waving_guy" ) )
    {
        var_10 = getent( "stair_wave_spawner", "targetname" );
        var_10 maps\_utility::add_spawn_function( maps\roadkill_code::_id_C9CB );
        var_10 stalingradspawn();
    }

    var_11 = getent( "player_latvee_passenger_spawner", "targetname" );
    var_11 maps\_utility::add_spawn_function( maps\roadkill_code::_id_AA85 );
    var_11 maps\_utility::spawn_ai();
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_wait( "player_climbs_stairs" );
    maps\_utility::battlechatter_off( "axis" );
    level._id_C48C = 1;
    maps\_utility::array_spawn_function_targetname( "escape_block_spawner", maps\roadkill_code::_id_A9E3 );
    maps\_utility::array_spawn_targetname( "escape_block_spawner" );
    maps\_utility::array_spawn_function_targetname( "escape_block_spawner_middle", maps\roadkill_code::escape_block_spawner_middle );
    maps\_utility::array_spawn_targetname( "escape_block_spawner_middle" );
    common_scripts\utility::flag_set( "convoy_moment" );
    common_scripts\utility::resetaicount();
    thread maps\roadkill_aud::_id_BB2F();
    var_12 = getaiarray( "axis" );

    foreach ( var_14 in var_12 )
    {
        var_15 = randomfloat( 2 );
        var_14 common_scripts\utility::delaycall( var_15, ::kill );
    }

    maps\_utility::delaythread( 4.5, common_scripts\utility::flag_set, "guys_get_in_convoy_vehicles" );
    thread maps\roadkill_code::_id_CC0A();
    common_scripts\utility::flag_wait( "player_gets_in" );
    thread player_gets_in_latvee_dof();
    thread maps\roadkill_code::_id_AD24();
    maps\_utility::array_spawn_function_targetname( "apache_show_building_spawner", maps\roadkill_aud::scn_apache_show_building_scripted_sfx );
    maps\_utility::delaythread( 0, maps\_vehicle::spawn_vehicles_from_targetname_and_drive, "apache_show_building_spawner" );
    clearallcorpses();
    maps\_utility::autosave_by_name( "player_gets_in" );
    var_12 = getaiarray( "allies" );

    foreach ( var_14 in var_12 )
    {
        if ( isdefined( var_14.magic_bullet_shield ) )
            var_14 maps\_utility::stop_magic_bullet_shield();

        var_14.ignoreall = 0;
    }

    thread maps\roadkill_code::_id_BE86();
    wait 0.8;
    common_scripts\utility::run_thread_on_targetname( "film_org", maps\roadkill_code::_id_C8C4 );
    common_scripts\utility::flag_set( "safe_to_delete_bridge_allies" );
    wait 2.7;
    var_0 = getent( "friendly_video_blocker", "targetname" );
    var_0 solid();
    var_0 disconnectpaths();
    var_19 = getentarray( "jeep_rider_spawner", "targetname" );
    maps\_utility::array_spawn_function( var_19, maps\roadkill_code::_id_C6E8 );
    common_scripts\utility::array_thread( var_19, maps\_utility::spawn_ai );
    level notify( "continue_film_explosion_h2" );
    thread maps\roadkill_code::_id_B0CE();
    common_scripts\utility::flag_wait( "convoy_oscar_mike_after_explosion" );
    maps\_utility::delaythread( 2.2, common_scripts\utility::flag_set, "lead_vehicle_rolls_out" );
    var_20 = [];
    var_20[1] = 0.7;
    var_20[2] = 0.6;
    var_20[3] = 0.1;
    var_20[4] = 3.2;
    var_20[5] = 0.4;
    var_20[6] = 0;
    soundscripts\_audio_mix_manager::mm_add_submix( "vehicle_ride_mix" );

    for ( var_21 = 1; var_21 <= 6; var_21++ )
    {
        if ( common_scripts\utility::flag_exist( "convoy_crosses_bridge" + var_21 ) )
            common_scripts\utility::flag_set( "convoy_crosses_bridge" + var_21 );

        wait(var_20[var_21]);
    }

    _id_B185( 0 );
}

player_gets_in_latvee_dof()
{
    var_0 = _id_D397::_id_A97A( "teamplayer_climb_latvee" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 16, 100, 16.0, 16.0 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 3.0, 45, 1.0, 1.0 );
    var_0 _id_D397::_id_BEA0( 1.5 ) _id_D397::_id_C491( 3.0, 37, 1.0, 1.0 );
    var_0 _id_D397::_id_BEA0( 2.15 ) _id_D397::_id_C491( 6.0, 20, 2.0, 2.0 );
    var_0 _id_D397::_id_BEA0( 2.85 ) _id_D397::_id_C491( 7.0, 29, 6.0, 6.0 );
    var_0 _id_D397::_id_BEA0( 3.3 ) _id_D397::_id_C491( 7.0, 18, 3.0, 3.0 );
    var_0 _id_D397::_id_BEA0( 3.85 ) _id_D397::_id_C491( 9.0, 14, 4.0, 4.0 );
    var_0 _id_D397::_id_BEA0( 4.15 ) _id_D397::_id_C491( 14.0, 400, 4.0, 2.0 );
    var_0 _id_D397::_id_BEA0( 5.15 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 5.15 ) _id_D397::_id_B687();
    var_0 _id_D397::_id_BEA0( 25.9 ) _id_D397::_id_B85E( 0.35, 2.0, level.player, 100 );
    var_1 = 0.04;
    var_2 = 1.0;
    var_3 = 10000;
    var_4 = level.player;
    var_5 = 35.5;

    for ( var_6 = 31.85; var_6 <= var_5; var_6 += 0.5 )
        var_0 _id_D397::_id_BEA0( var_6 ) _id_D397::_id_B85E( var_1, var_2, var_4, var_3 );

    var_0 _id_D397::_id_BEA0( 1.05 ) _id_D397::_id_B85E( 0.08, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 1.7 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 2.65 ) _id_D397::_id_B85E( 0.08, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 3.8 ) _id_D397::_id_B85E( 0.1, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.4 );
    var_0 _id_D397::_id_BEA0( 4.45 ) _id_D397::_id_B85E( 0.08, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 5.25 ) _id_D397::_id_B85E( 0.06, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BC26();
}

_id_D537()
{
    soundscripts\_snd::snd_message( "start_ride_checkpoint" );
    common_scripts\utility::flag_set( "Beach_Begin_Section_Flag" );
    common_scripts\utility::flag_set( "City_Ceiling_Flag" );
    common_scripts\utility::flag_set( "First_City_Section_Flag" );
    common_scripts\utility::flag_set( "Crossroads_Flag" );
    maps\roadkill_code::_id_B4C2( "start_vehicle_ride" );
    _id_B185( 1 );
}

_id_B185( var_0 )
{
    thread h2_latvee_ride_cinematic();
    thread h2_latvee_escape_cinematic();
    common_scripts\utility::array_call( getentarray( "city_dynamics_models", "targetname" ), ::show );
    maps\_utility::add_global_spawn_function( "axis", maps\_utility::set_ignoresuppression, 1 );
    maps\_utility::set_custom_gameskill_func( maps\roadkill_code::_id_C0D3 );
    maps\roadkill_code::_id_BAD5();
    var_1 = getentarray( "destroyed_latvee_model", "targetname" );
    common_scripts\utility::array_thread( var_1, common_scripts\utility::hide_notsolid );
    level.createrpgrepulsors = 0;
    level.player enabledeathshield( 1 );
    thread maps\roadkill_code::_id_C2CB();
    level.player disableweapons();
    level.player maps\_utility::ent_flag_clear( "near_death_vision_enabled" );
    level.player_repulsor = missile_createrepulsorent( level.player, 2000, 500 );
    level._id_B271 = [];
    maps\_utility::array_spawn_function_noteworthy( "run_away_die", maps\roadkill_code::_id_C77A );
    maps\_utility::array_spawn_function_noteworthy( "start_player_crazy_ride", maps\roadkill_code::_id_BD4A );
    maps\_utility::array_spawn_function_targetname( "ride_vehicle_spawner", maps\roadkill_code::_id_C057 );
    maps\_utility::array_spawn_function_noteworthy( "traffic_jam_truck", maps\roadkill_code::_id_CBAB );
    maps\_utility::array_spawn_function_noteworthy( "ignore_until_attack", maps\roadkill_code::_id_AE38 );
    maps\_utility::array_spawn_function_noteworthy( "trapper_spawner", maps\roadkill_code::_id_C1E3 );
    maps\_utility::array_spawn_function_noteworthy( "rpg_ambush_spawner", maps\roadkill_code::_id_C5CF );
    thread maps\roadkill_code::_id_AB8A();
    maps\_utility::array_spawn_function_noteworthy( "blocker_driver", maps\roadkill_code::_id_AA44 );
    maps\_utility::array_spawn_function_noteworthy( "ride_killer", maps\roadkill_code::_id_BE39 );

    if ( var_0 )
        maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "ride_vehicle_spawner" );

    maps\_utility::add_global_spawn_function( "axis", maps\roadkill_code::no_grenades );
    thread maps\roadkill_code::_id_A8FB();
    thread maps\roadkill_code::_id_C55B();
}

h2_latvee_ride_cinematic()
{
    var_0 = _id_D397::_id_A97A( "roadkill_latvee_gameplay_ride" );
    var_1 = 1.0;
    var_2 = 10000;
    var_3 = level.player;
    var_4 = 99;

    for ( var_5 = 0.0; var_5 <= var_4; var_5 += 0.25 )
    {
        if ( var_5 > 14.35 && var_5 <= 43.5 )
            var_6 = 0.05;
        else if ( var_5 > 78.5 && var_5 <= 94.0 )
            var_6 = 0.07;
        else
            var_6 = 0.04;

        var_0 _id_D397::_id_BEA0( var_5 ) _id_D397::_id_B85E( var_6, var_1, var_3, var_2 );
    }

    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B85E( 0.16, 0.9, var_3, var_2 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 0.7 ) _id_D397::_id_B85E( 0.12, 0.75, var_3, var_2 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 4.95 ) _id_D397::_id_B85E( 0.16, 0.9, var_3, var_2 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 5.7 ) _id_D397::_id_B85E( 0.12, 0.75, var_3, var_2 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BC26();
}

h2_latvee_escape_cinematic()
{
    common_scripts\utility::flag_wait( "rpg_super_ambush" );
    var_0 = _id_D397::_id_A97A( "roadkill_latvee_gameplay_escape" );
    var_1 = 1.0;
    var_2 = 10000;
    var_3 = level.player;
    var_4 = 41;

    for ( var_5 = 5.6; var_5 <= var_4; var_5 += 0.15 )
    {
        if ( var_5 > 5.6 && var_5 <= 7.95 )
            var_6 = 0.06;

        if ( var_5 > 7.95 && var_5 <= 8.35 )
            var_6 = 0.01;
        else if ( var_5 > 8.35 && var_5 <= 16.5 )
            var_6 = 0.08;
        else if ( var_5 > 18.5 && var_5 <= 23.0 )
            var_6 = 0.07;
        else if ( var_5 > 24.3 && var_5 <= 25.8 )
            var_6 = 0.1;
        else if ( var_5 > 26.3 && var_5 <= 27.3 )
            var_6 = 0.06;
        else if ( var_5 > 28.3 && var_5 <= 30.3 )
            var_6 = 0.1;
        else if ( var_5 > 30.3 && var_5 <= 32.8 )
            var_6 = 0.08;
        else if ( var_5 > 32.8 && var_5 <= 34.0 )
            var_6 = 0.06;
        else
            var_6 = 0.04;

        var_0 _id_D397::_id_BEA0( var_5 ) _id_D397::_id_B85E( var_6, var_1, var_3, var_2 );
    }

    thread h2_latvee_escape_pickup_push_cin();
    var_0 _id_D397::_id_BC26();
}

h2_latvee_escape_pickup_push_cin()
{
    var_0 = _id_D397::_id_A97A( "roadkill_latvee_pickup_push" );
    var_0 _id_D397::_id_BEA0( 0.5 ) _id_D397::_id_B85E( 0.25, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.8 );
    var_0 _id_D397::_id_BEA0( 4.35 ) _id_D397::_id_B85E( 0.25, 1.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 1.6 );
    common_scripts\utility::flag_wait( "push_through" );
    var_0 _id_D397::_id_BC26();
}

_id_D37E()
{
    var_0 = getaiarray();

    foreach ( var_2 in var_0 )
    {
        if ( isalive( level._id_B41B ) && var_2 == level._id_B41B )
            continue;

        if ( isdefined( var_2.magic_bullet_shield ) )
            var_2 maps\_utility::stop_magic_bullet_shield();
    }

    common_scripts\utility::flag_wait( "roadkill_town_dialogue" );
    maps\_utility::autosave_by_name( "roadkill_town_dialogue" );
    thread maps\roadkill_code::_id_C148();
    waittillframeend;

    if ( level.start_point != "ride" )
    {
        var_4 = gettime();
        wait 0.6;
        thread maps\roadkill_code::_id_AA78( "roadkill_fly_breakingaway" );
        wait 2.1;
        thread maps\roadkill_code::_id_AA78( "roadkill_hqr_copyhunter2" );
        maps\_utility::wait_for_buffer_time_to_pass( var_4, 6.5 );
        thread maps\roadkill_code::_id_AA78( "roadkill_fly_eyeoutforciv" );
        wait 6.5;
        thread maps\roadkill_code::_id_AA78( "roadkill_fly_scanrooftops" );
        wait 4.8;
        maps\_utility::wait_for_buffer_time_to_pass( var_4, 17.8 );
    }

    thread maps\roadkill_code::_id_A873( "roadkill_cpd_seeanything" );
    wait 2.2;
    thread maps\roadkill_code::_id_C24A( "roadkill_cpd_placeisdead" );
    wait 2.3;
    thread maps\roadkill_code::_id_A873( "roadkill_ar3_huah" );
    wait 2.5;
    thread maps\roadkill_code::_id_AA78( "roadkill_fly_crossstreeteliz" );
    wait 4.5;
    thread maps\roadkill_code::_id_AA78( "roadkill_hqr_caution" );
    wait 4.0;
    common_scripts\utility::flag_wait( "civie_dialogue" );
    wait 2.9;
    thread maps\roadkill_code::_id_C24A( "roadkill_cpd_wildwest" );
    wait 2.6;
    thread maps\roadkill_code::_id_A873( "roadkill_ar3_rogerthat" );
    common_scripts\utility::flag_wait( "start_runner" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.ridingvehicle ) )
            continue;

        var_2 maps\roadkill_code::_id_CECF();
    }

    thread maps\roadkill_code::_id_AF05();
    maps\_utility::delaythread( 6.0, maps\roadkill_code::_id_AA78, "roadkill_fly_watchalleys" );
    maps\_utility::delaythread( 8.0, maps\roadkill_code::_id_AA78, "roadkill_ar3_covering" );
    wait 13.7;
    thread maps\roadkill_code::_id_AA78( "roadkill_ar1_probablemilitia" );
    wait 3.5;
    thread maps\roadkill_code::_id_AA78( "roadkill_fly_aretheyarmed" );
    wait 2.2;
    thread maps\roadkill_code::_id_AA78( "roadkill_ar1_watchingus" );
    wait 5.1;
    thread maps\roadkill_code::_id_C24A( "roadkill_cpd_scoutingus" );
    wait 2.0;
    thread maps\roadkill_code::_id_A873( "roadkill_fly_doesntmean" );
}

_id_B137()
{
    soundscripts\_snd::snd_message( "start_crazy_ride_checkpoint" );
    common_scripts\utility::flag_set( "First_City_Section_Flag" );
    common_scripts\utility::flag_set( "Crossroads_Flag" );
    _func_31B( 1 );
    _func_31B( 3 );
    _func_31C( 2 );
    maps\roadkill_code::_id_B4C2( "start_vehicle_crazy_ride" );
    _id_B185( 1 );
}

_id_BFDD()
{
    common_scripts\utility::run_thread_on_targetname( "shot_fired_trigger", maps\roadkill_code::_id_D581 );
    thread maps\roadkill_aud::_id_C34B();
    common_scripts\utility::flag_wait( "shot_rings_out" );
    thread maps\roadkill_code::_id_C175();
    thread _id_D091();
    thread maps\roadkill_code::_id_BA53();
    common_scripts\utility::flag_wait( "ambush_spawn" );
    var_0 = getaiarray();

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 getturret() ) )
            continue;

        if ( var_2.team != "neutral" )
            continue;

        var_2 maps\roadkill_code::_id_CECF();
    }

    level.player.ignoreme = 0;
    level.player.ignorerandombulletdamage = 0;
    common_scripts\utility::array_thread( level._id_BB8E, maps\_utility::spawn_ai );
    common_scripts\utility::flag_wait( "ambush" );
    maps\_utility::battlechatter_on( "axis" );
    maps\_utility::add_global_spawn_function( "axis", maps\roadkill_code::_id_A897 );
    level._id_D518 = getdvarfloat( "physveh_explodeforce", 0 );
    setsaveddvar( "physveh_explodeforce", 0 );
    wait 3;
    maps\_utility::autosave_by_name( "ambush" );
}

_id_D091()
{
    common_scripts\utility::flag_wait( "shot_rings_out" );
    wait 1;
    thread maps\roadkill_code::_id_C405( "roadkill_ar2_seeem" );
    soundscripts\_snd::snd_message( "start_ambush_mix" );
    wait 1.5;
    thread maps\roadkill_code::_id_C24A( "roadkill_cpd_dontseejack" );
    wait 1.5;
    thread maps\roadkill_code::_id_AA78( "roadkill_fly_prepeng" );
    wait 3.8;
    thread maps\roadkill_code::_id_C24A( "roadkill_cpd_goinin" );
    wait 1.8;
    thread maps\roadkill_code::_id_A873( "roadkill_ar1_spinemup" );
    wait 1.5;
    common_scripts\utility::flag_set( "latvees_spin_up" );
    thread maps\roadkill_code::_id_BC58( "roadkill_ar3_12and6" );
    wait 0.5;
    thread maps\roadkill_code::_id_AD34( "roadkill_ar4_tonacontacts" );
    wait 1.5;
    thread maps\roadkill_code::_id_AD34( "roadkill_ar5_longrange" );
    wait 1.0;
    thread maps\roadkill_code::_id_BC58( "roadkill_ar2_goinforward" );
    wait 2.0;
    maps\_utility::battlechatter_on( "axis" );
    thread maps\roadkill_code::_id_C24A( "roadkill_cpd_lightemup" );
    maps\_utility::delaythread( 0.5, maps\roadkill_code::_id_BBFE, "roadkill_AB2_heretheycome" );
    maps\_utility::delaythread( 2.5, maps\roadkill_code::_id_BBFE, "roadkill_AB2_rpgslatvees" );
    common_scripts\utility::flag_wait( "ambush" );
    wait 5.0;
    thread maps\roadkill_code::_id_C24A( "roadkill_cpd_backup" );
    wait 2;
    thread maps\roadkill_code::_id_C24A( "roadkill_cpd_outtahere" );
    maps\_utility::delaythread( 3.5, maps\roadkill_code::_id_BBFE, "roadkill_AB2_hassanmove" );
    maps\_utility::delaythread( 6.5, maps\roadkill_code::_id_BBFE, "roadkill_AB2_diedogs" );
    maps\_utility::delaythread( 8.5, maps\roadkill_code::_id_BBFE, "roadkill_AB2_movex3" );
}

_id_CB08()
{
    soundscripts\_snd::snd_message( "start_crazy_ride_later_checkpoint" );
    common_scripts\utility::flag_set( "School_Section_Flag" );
    common_scripts\utility::flag_set( "Crossroads_Flag" );
    _func_31B( 1 );
    _func_31B( 3 );
    _func_31C( 2 );
    _func_31C( 4 );
    _func_31C( 5 );
    maps\roadkill_code::_id_B4C2( "start_vehicle_ride_later" );
    _id_B185( 1 );
}

_id_CDA9()
{
    thread _id_CBC2();
    var_0 = getent( "player_brake_trigger", "targetname" );
    var_0 thread maps\roadkill_code::_id_B3A4();
    var_1 = level._id_CE62[0];
    var_2 = level._id_CE62[1];
    var_3 = level._id_CE62[2];
    var_2 vehphys_disablecrashing();
    level.player enabledeathshield( 0 );
    wait 0.05;
    thread maps\roadkill_code::_id_B1BB();
    thread maps\roadkill_code::_id_D586();
    common_scripts\utility::flag_wait( "lead_vehicle_speeds_up" );
    level._id_D518 = getdvarfloat( "physveh_explodeforce", 0 );
    setsaveddvar( "physveh_explodeforce", 0 );
    common_scripts\utility::flag_wait( "resume_the_path" );
    setplayerignoreradiusdamage( 1 );
    maps\_utility::delaythread( 0.25, maps\roadkill_code::_id_B1F9, 12 );
    maps\_utility::delaythread( 0.2, maps\roadkill_code::_id_B489 );
    maps\_utility::delaythread( 1.25, maps\roadkill_code::_id_B1F9, 8 );
    common_scripts\utility::flag_wait( "player_is_pushing_truck" );
    common_scripts\utility::array_thread( getentarray( "rotate_object", "targetname" ), maps\roadkill_code::rotate_object );
    var_4 = getvehiclenode( "player_reattach_route", "script_noteworthy" );
    var_2 startpath( var_4 );
    var_3.veh_brake = 0;
    var_1 thread maps\roadkill_code::_id_D415();
    var_2 resumespeed( 5 );
    common_scripts\utility::flag_set( "push_complete" );
    level notify( "stop_updating_player_vehicle_speed" );
    setplayerignoreradiusdamage( 0 );
    thread _id_B478();
    var_1 = level._id_CE62[0];
    var_2 = level._id_CE62[1];
    var_3 = level._id_CE62[2];
    common_scripts\utility::flag_wait( "player_vehicle_wipes_out" );
    var_2 vehicle_setspeed( 14, 2, 2 );
    var_3 vehicle_setspeed( 14, 2, 2 );
    var_5 = getentarray( "last_building_spawner", "targetname" );
    maps\_utility::array_spawn( var_5 );
    missile_deleteattractor( level.player_repulsor );
    var_6 = getent( "missile_target", "targetname" );
    var_7 = getent( var_6.target, "targetname" );
    var_8 = missile_createattractorent( var_7, 50000, 50000, level._id_BE39 );
    maps\_utility::set_player_attacker_accuracy( 0.0 );
    level.player.ignorerandombulletdamage = 1;
    thread maps\roadkill_code::_id_C107();
    wait 2;
    var_2 vehicle_setspeed( 10, 2, 2 );
    var_3 vehicle_setspeed( 10, 2, 2 );
    level.player enabledeathshield( 1 );
    var_9 = undefined;

    for (;;)
    {
        var_10 = 0;
        var_11 = getentarray( "rocket", "classname" );

        foreach ( var_9 in var_11 )
        {
            if ( distance( var_9.origin, level.player.origin ) < 750 )
            {
                var_10 = 1;
                break;
            }
        }

        if ( var_10 )
            break;

        wait 0.05;
    }

    var_14 = maps\_utility::get_dot( level.player geteye(), level.player getplayerangles(), var_9.origin );
    var_15 = var_14 >= 0.8;

    if ( var_15 )
    {
        maps\_utility::slowmo_start();
        maps\_utility::slowmo_setspeed_slow( 0.65 );
        maps\_utility::slowmo_setlerptime_in( 0.2 );
        maps\_utility::slowmo_lerp_in();
        thread maps\roadkill_aud::dismount_rpg_slomo_mix();
    }

    for (;;)
    {
        if ( !isdefined( var_9 ) )
            break;

        if ( distance( var_9.origin, level.player.origin ) < 150 )
        {
            if ( var_15 )
            {
                var_15 = 0;
                maps\_utility::slowmo_setlerptime_out( 0.0 );
                maps\_utility::slowmo_lerp_out();
                maps\_utility::slowmo_end();
            }
        }

        if ( distance( var_9.origin, level.player.origin ) < 75 )
            break;

        wait 0.05;
    }

    if ( var_15 )
    {
        maps\_utility::slowmo_setlerptime_out( 0.0 );
        maps\_utility::slowmo_lerp_out();
        maps\_utility::slowmo_end();
    }

    thread maps\roadkill_code::_id_B0B8();
    var_16 = level.player.origin;
    level.player unlink();
    level._id_AD0D delete();
    level.player setorigin( var_16 );
    level notify( "ride_ends" );
    level.player maps\_gameskill::update_player_attacker_accuracy();
    var_17 = getaiarray( "allies" );

    foreach ( var_19 in var_17 )
    {
        if ( isdefined( var_19.magic_bullet_shield ) )
            var_19 maps\_utility::stop_magic_bullet_shield();
    }

    var_21 = [];
    var_21[0] = var_1;
    var_21[1] = var_2;
    var_21[2] = var_3;
    var_22 = getvehiclenode( "vehicle_hell", "targetname" );

    foreach ( var_24 in var_21 )
        var_24 thread maps\roadkill_code::_id_D483( var_22 );

    setsaveddvar( "physveh_explodeforce", level._id_D518 );
}

_id_CBC2()
{
    common_scripts\utility::flag_wait( "lead_vehicle_speeds_up" );
    var_0 = gettime();
    thread maps\roadkill_code::_id_B2D4( "roadkill_fly_strungout" );
    common_scripts\utility::flag_wait( "we're cut off" );
    maps\roadkill_code::_id_C24A( "roadkill_cpd_cutoff" );
    common_scripts\utility::flag_wait( "push_through" );
    maps\roadkill_code::_id_B2D4( "roadkill_fly_pushthrough" );
}

_id_B478()
{
    common_scripts\utility::flag_wait( "player_vehicle_wipes_out" );
    maps\roadkill_code::_id_B2D4( "roadkill_fly_headsup" );
    level.player maps\_utility::play_sound_on_entity( "roadkill_cpd_lookout" );
}

_id_C64C()
{
    soundscripts\_snd::snd_message( "start_dismount_checkpoint" );
    common_scripts\utility::flag_set( "School_Section_Flag" );
    common_scripts\utility::array_thread( getentarray( "rotate_object", "targetname" ), maps\roadkill_code::rotate_object );
    _func_31B( 1 );
    _func_31B( 3 );
    _func_31C( 2 );
    _func_31C( 4 );
    _func_31C( 5 );
    level.player disableweapons();
    var_0 = common_scripts\utility::getstruct( "slide_org", "targetname" );
    level.player setorigin( var_0.origin );
}

_id_A8E2()
{
    common_scripts\utility::flag_set( "kill_drones" );
    maps\_utility::remove_global_spawn_function( "axis", maps\roadkill_code::no_grenades );
    common_scripts\utility::array_call( getentarray( "before_school_dynamiques", "script_noteworthy" ), ::hide );
    soundscripts\_snd::snd_message( "stop_interior_vehicle_context" );
    thread maps\roadkill_code::_id_C9C4();

    if ( isdefined( level._id_CE62["detour"] ) && isdefined( level._id_CE62["detour"].classname ) )
    {
        level._id_CE62["detour"].deathfx_ent delete();
        level._id_CE62["detour"] delete();
    }

    common_scripts\_exploder::exploder( "smoke_column" );
    var_0 = getentarray( "destroyed_latvee_model", "targetname" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::show_solid );
    level notify( "dismount_staged_firelights" );

    if ( level.start_point != "dismount" )
        thread maps\_autosave::_autosave_game_now_nochecks();

    thread _id_A8B5();
    maps\_utility::array_spawn_function( level._id_BB8E, maps\roadkill_code::_id_D103 );
    maps\_utility::array_spawn_function_noteworthy( "school_spawner", maps\_utility::enable_danger_react, 5000 );
    maps\_utility::array_spawn_function_noteworthy( "school_spawner", maps\roadkill_code::_id_CDC0 );
    common_scripts\utility::run_thread_on_targetname( "barbwire_ride_cutoff", maps\roadkill_code::_id_B111 );
    maps\_utility::activate_trigger_with_targetname( "friendlies_flee_ambush_trigger" );
    maps\_utility::delaythread( 0.95, maps\roadkill_code::_id_CC99 );
    var_1 = 5;
    thread maps\roadkill_aud::_id_B715( var_1, "scn_shellshock_latvee_ambush_02", "shellshock_latvee_ambush_02_mix" );
    level.player shellshock( "default", var_1 );
    earthquake( 0.3, 1.0, level.player.origin, 2000 );
    setomnvar( "ui_consciousness_init", 1 );
    setsaveddvar( "ui_consciousnessVignetteDarkness", 0.1 );
    setomnvar( "ui_consciousness_play", 2 );
    var_2 = getentarray( "dead_vehicle_spawner", "targetname" );

    foreach ( var_4 in var_2 )
    {
        var_4 setcontents( var_4.oldcontents );
        var_4 show();
    }

    level._id_C18F = spawn( "script_origin", ( -6382.98, 8474.13, 334.0 ) );
    var_6 = maps\_utility::spawn_anim_model( "player_worldbody", level._id_C18F.origin, ( 0.0, 0.0, 0.0 ) );
    var_6 hide();
    thread thrown_out_of_latvee_cinseq( var_6 );
    level._id_C18F maps\_anim::anim_first_frame_solo( var_6, "exit_latvee" );
    var_7 = spawn( "script_origin", var_6 gettagorigin( "tag_camera" ) - ( 0.0, 0.0, 10.0 ) );
    var_7.angles = var_6 gettagangles( "tag_camera" );
    level.player playerlinkto( var_7, "", 1, 0, 0, 0, 0, 0 );
    waitframe();
    var_7 delete();
    level.player freezecontrols( 1 );
    level.player _meth_84DA( 0 );
    level.player setstance( "prone" );
    level.player allowstand( 0 );
    level.player allowcrouch( 0 );
    level.player allowprone( 1 );
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "actionSlotsHide", 1 );
    var_8 = getaiarray( "axis" );
    common_scripts\utility::get_array_of_closest( level.player.origin, var_8 );

    for ( var_9 = var_8.size - 1; var_9 >= 0 && var_9 >= var_8.size - 4; var_9-- )
    {
        if ( isdefined( var_8[var_9].magic_bullet_shield ) )
            continue;

        var_8[var_9] kill();
    }

    var_10 = getentarray( "friendly_crash_spawner", "targetname" );
    maps\_utility::array_spawn_function( var_10, maps\roadkill_code::_id_CB96 );
    maps\_utility::array_spawn_function_targetname( "dismount_enemy_spawner", maps\roadkill_code::_id_AE7B );
    maps\_utility::delaythread( 4, maps\_utility::array_spawn_targetname, "dismount_enemy_spawner" );
    level.player setthreatbiasgroup( "ally_with_player" );
    common_scripts\utility::array_thread( var_10, maps\_utility::spawn_ai );
    waitframe();
    level.player common_scripts\utility::delaycall( 0.15, ::setviewangleresistance, 50, 50, 20, 20 );
    level.player common_scripts\utility::delaycall( 0.75, ::setviewangleresistance, 50, 50, 20, 20 );
    level.player playerlinktodelta( var_6, "tag_player", 0.9, 0, 0, 0, 0, 1 );
    var_6 show();
    level._id_C18F maps\_anim::anim_single_solo( var_6, "exit_latvee" );
    var_6 delete();
    wait 0.15;
    level.player freezecontrols( 0 );
    level.player _meth_84DB();
    level.player allowcrouch( 1 );
    level.player allowstand( 1 );
    common_scripts\utility::flag_set( "player_knocked_down" );
    common_scripts\_exploder::exploder( "crashed_latvees" );
    maps\_utility::remove_global_spawn_function( "axis", maps\roadkill_code::_id_A897 );
    maps\_utility::remove_global_spawn_function( "axis", maps\_utility::set_ignoresuppression );
    setsaveddvar( "ui_ignoreTurretCompassHide", 0 );
    setsaveddvar( "ui_hidemap", 0 );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "compass", 1 );
    wait 0.5;
    var_11 = 5;
    var_12 = var_11 * 20;

    for ( var_9 = 0; var_9 < var_12; var_9++ )
    {
        if ( level.player getstance() != "prone" )
            break;

        wait 0.05;
    }

    var_13 = level.player getweaponslistprimaries();
    var_14 = level.player getcurrentweapon();
    var_15 = undefined;

    foreach ( var_17 in var_13 )
    {
        if ( var_17 == "javelin" )
        {
            level.player takeweapon( var_17 );
            continue;
        }

        var_15 = var_17;
    }

    if ( isdefined( var_15 ) && var_14 == "javelin" )
        level.player switchtoweapon( var_15 );

    level.player common_scripts\utility::delaycall( 4, ::enabledeathshield, 0 );
    level.player enableweapons();
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "actionSlotsHide", 0 );
    maps\_utility::set_promotion_order( "g", "c" );
    common_scripts\utility::flag_set( "player_is_dismounted" );
    common_scripts\utility::flag_wait( "player_enters_ambush_house" );
    level._id_D049 = 0;
    var_19 = getentarray( "ambush_ally_spawner", "targetname" );
    maps\_utility::array_spawn_function( var_19, maps\roadkill_code::_id_CA5E );
    common_scripts\utility::array_thread( var_19, maps\_utility::spawn_ai );
    var_20 = getentarray( "ambush_house_spawner", "targetname" );
    maps\_utility::array_spawn_function_noteworthy( "slowbie", maps\roadkill_code::_id_D21F );
    maps\_utility::array_spawn_function( var_20, maps\roadkill_code::_id_B685 );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_looks_at_staircase" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_progresses_in_ambush_house" );
    maps\_utility::add_func( maps\_utility::array_spawn_targetname, "ambush_house_spawner" );
    thread maps\_utility::do_wait_any();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "sweep_dismount_building" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_progresses_in_ambush_house" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "ambush_house_friendlies_progress_downstairs" );
    common_scripts\utility::flag_wait( "dismount_friendlies_go_for_staircase" );
    maps\_utility::activate_trigger_with_targetname( "ambush_house_friendlies_reach_staircase" );
    maps\_vehicle::spawn_vehicles_from_targetname( "ambushed_laatpv" );
    var_21 = getent( "remove_car", "script_noteworthy" );
    var_21 delete();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "foley_flashbang" );
    maps\_utility::add_func( maps\roadkill_code::_id_C3CF );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "ambush_house_player_goes_upstairs" );
    thread maps\roadkill_code::_id_D165();
    thread maps\roadkill_code::school_weaponclips();
    level._id_C709 = [];
    maps\_utility::array_spawn_function_noteworthy( "enemy_playground_spawner", maps\roadkill_code::_id_B7A6 );
    maps\_utility::array_spawn_noteworthy( "enemy_playground_spawner" );

    foreach ( var_23 in level._id_BB8E )
    {
        var_23.count = 1;
        var_23.script_accuracy = 1;
        var_23 maps\_utility::spawn_ai();
    }

    var_25 = gettime();
    var_26 = getent( "ambush_house_upstairs_first_room", "targetname" );
    var_26 maps\_utility::add_wait( maps\_utility::waittill_volume_dead_or_dying );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_leaves_ambush_house" );
    maps\_utility::do_wait_any();
    maps\_utility::activate_trigger_with_targetname( "ambush_house_friendlies_upstairs_trigger" );
    common_scripts\utility::flag_wait_or_timeout( "ambush_house_player_goes_last_room", 12 );
    maps\_utility::activate_trigger_with_targetname( "ambush_house_friendlies_last_room_trigger" );
    level.foley maps\_utility::set_force_color( "b" );
    level._id_ACC0 maps\_utility::set_force_color( "p" );
    common_scripts\utility::flag_wait( "playground_baddies_retreat" );
    level.foley maps\_utility::set_ignoresuppression( 1 );
    level.foley thread maps\_utility::delaythread( 10, maps\_utility::set_ignoresuppression, 0 );
    maps\_utility::activate_trigger_with_targetname( "ambush_house_foley_leave_trigger" );
    maps\_utility::activate_trigger_with_targetname( "ambush_house_friendlies_leave_trigger" );
    common_scripts\utility::flag_wait( "player_leaves_ambush_house" );
}

thrown_out_of_latvee_cinseq( var_0 )
{
    var_1 = _id_D397::_id_A97A( "thrown_out_of_latvee" );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 2.8, -1, 32, 8 ) _id_D397::_id_CCA7( var_0, "tag_dof" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_1 _id_D397::_id_BEA0( 7.5 ) _id_D397::_id_BF3F() _id_D397::_id_B687();
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_B85E( 0.4, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.65 );
    var_1 _id_D397::_id_BEA0( 0.9 ) _id_D397::_id_B85E( 0.2, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_1 _id_D397::_id_BEA0( 1.5 ) _id_D397::_id_B85E( 0.15, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 _id_D397::_id_BEA0( 2.5 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_1 _id_D397::_id_BEA0( 2.85 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 _id_D397::_id_BEA0( 6.4 ) _id_D397::_id_B85E( 0.12, 1.0, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.5 );
    var_1 _id_D397::_id_BEA0( 7.5 ) _id_D397::_id_B85E( 0.12, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 _id_D397::_id_BEA0( 7.7 ) _id_D397::_id_B85E( 0.1, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 _id_D397::_id_BEA0( 8.5 ) _id_D397::_id_B85E( 0.08, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_1 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_BAE4( 2 );
    var_1 _id_D397::_id_BEA0( 0.9 ) _id_D397::_id_BAE4( 0 );
    var_1 _id_D397::_id_BEA0( 1.5 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.5, 0.1, 0.2, 20, 20, 15, 5 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_1 _id_D397::_id_BEA0( 5.3 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 0.65, 0.2, 0.2, 15, 0, 5, 3 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_1 _id_D397::_id_BEA0( 7.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 1.0, 0.3, 0.4, 20, 10, 10, 3 ) _id_D397::_id_A970( ::setviewangleresistance, level.player, 50, 50, 20, 20 );
    var_1 _id_D397::_id_BEA0( 1.4 ) _id_D397::_id_AC9F( 72, 1.6, 0 );
    var_1 _id_D397::_id_BEA0( 3.0 ) _id_D397::_id_AC9F( 58, 2.1, 0 );
    var_1 _id_D397::_id_BEA0( 5.35 ) _id_D397::_id_A9EC( 2.3, 0 );
    var_1 _id_D397::_id_BC26();
}

_id_A8B5()
{
    wait 4;
    thread maps\roadkill_code::_id_B2D4( "roadkill_fly_getoffstreet" );
    common_scripts\utility::flag_wait( "player_is_dismounted" );
    wait 0.5;
    common_scripts\utility::flag_wait( "player_enters_ambush_house" );
    wait 3.0;
    maps\roadkill_code::_id_B2D4( "roadkill_fly_everybodyok" );
    wait 0.5;
    maps\roadkill_code::_id_C24A( "roadkill_cpd_huah" );
    wait 0.45;
    maps\roadkill_code::_id_C24A( "roadkill_cpd_movinaroundup" );
    maps\roadkill_code::_id_B2D4( "roadkill_fly_securetopfloor" );
    common_scripts\utility::flag_set( "sweep_dismount_building" );
    common_scripts\utility::flag_wait( "eyes_on_school" );

    if ( !common_scripts\utility::flag( "lets_go_trigger" ) )
    {
        maps\_utility::add_endon( "lets_go_trigger" );
        var_0 = getent( "ambush_house_last_room", "targetname" );
        var_0 maps\_utility::add_wait( maps\_utility::waittill_volume_dead );
        maps\_utility::add_wait( maps\_utility::_wait, 4 );
        maps\_utility::do_wait_any();
    }

    thread maps\roadkill_code::_id_B838();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_leaves_ambush_house" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "playground_baddies_retreat" );
    maps\_utility::add_wait( maps\_utility::_wait, 20 );
    maps\_utility::do_wait_any();
    common_scripts\utility::flag_set( "playground_baddies_retreat" );
    maps\roadkill_code::_id_CD57();
    maps\_utility::delaythread( 5.1, common_scripts\utility::flag_set, "friendlies_run_to_school" );
    thread maps\roadkill_code::_id_B2D4( "roadkill_fly_followme" );
    common_scripts\utility::flag_wait( "friendlies_run_to_school" );
    var_2 = level._id_CD82;
    level._id_CD82 = maps\_utility::array_removedead( level._id_CD82 );

    foreach ( var_4 in level._id_CD82 )
        var_4 maps\_utility::enable_heat_behavior();

    maps\_utility::activate_trigger_with_targetname( "school_friendlies_gather_outside_trigger" );
    common_scripts\utility::run_thread_on_targetname( "stop_sprinting_trigger", maps\roadkill_code::_id_C227 );
}

_id_CFA1()
{
    soundscripts\_snd::snd_message( "start_roadkill_school_fight_checkpoint" );
    common_scripts\utility::flag_set( "School_Section_Flag" );
    common_scripts\utility::flag_set( "classroom_down_stair" );
    common_scripts\utility::flag_set( "Crossroads_Flag" );
    _func_31B( 1 );
    _func_31B( 3 );
    _func_31C( 2 );
    _func_31C( 4 );
    _func_31C( 5 );
    common_scripts\utility::array_thread( getentarray( "rotate_object", "targetname" ), maps\roadkill_code::rotate_object );
    thread maps\roadkill_code::school_weaponclips();
    var_0 = common_scripts\utility::getstruct( "school_start_player", "targetname" );
    level.player maps\_utility::teleport_ent( var_0 );
    maps\_utility::array_spawn_noteworthy( "dismount_macey" );
    maps\_utility::array_spawn_noteworthy( "dismount_dunn" );
    waittillframeend;
    var_0 = common_scripts\utility::getstruct( "school_start_foley", "targetname" );
    level.foley maps\_utility::teleport_ent( var_0 );
    level.foley thread maps\_utility::magic_bullet_shield();
    var_0 = common_scripts\utility::getstruct( "school_start_dunn", "targetname" );
    level._id_ACC0 maps\_utility::teleport_ent( var_0 );
    level._id_ACC0 thread maps\_utility::magic_bullet_shield();
    level.foley maps\_utility::set_force_color( "b" );
    level._id_ACC0 maps\_utility::set_force_color( "p" );
    maps\_utility::activate_trigger_with_targetname( "school_friendlies_gather_outside_trigger" );
}

_id_AC24()
{
    thread _id_AE36();
    thread maps\roadkill_code::_id_D35B();
    maps\_utility::array_spawn_function_noteworthy( "hidden_room_spawner", maps\roadkill_code::_id_C084 );
    common_scripts\utility::array_call( getentarray( "inside_school_dynamiques", "script_noteworthy" ), ::show );
    thread maps\roadkill_code::_id_B6D7();
    thread maps\roadkill_code::_id_C41C();
    common_scripts\utility::flag_set( "lets_go_trigger" );
    common_scripts\utility::flag_wait( "roadkill_school_2" );
    maps\roadkill_code::_id_C24A( "roadkill_cpd_classonright" );
    wait 2;
    maps\_utility::add_func( maps\roadkill_code::_id_B2D4, "roadkill_fly_intheschool" );
    maps\_utility::add_func( maps\roadkill_code::_id_B27C, "roadkill_shp_copythat21" );
    thread maps\_utility::do_funcs();
    common_scripts\utility::flag_wait( "roadkill_school_3" );
    setthreatbias( "axis_school", "ally_with_player", 0 );
    setthreatbias( "ally_with_player", "axis_school", 0 );
    common_scripts\utility::flag_wait( "roadkill_school_5" );
    maps\_utility::add_wait( maps\roadkill_code::_id_AE0A );
    maps\_utility::add_wait( maps\_utility::_wait, 3.5 );
    maps\_utility::add_func( maps\roadkill_code::_id_B2D4, "roadkill_fly_pressureoff" );
    thread maps\_utility::do_wait_any();
    common_scripts\utility::flag_wait( "roadkill_school_6" );
    maps\roadkill_code::_id_CE82();
    var_0 = getent( "player_shoot_detection_trigger", "targetname" );
    var_0 thread maps\roadkill_code::_id_AE71();
    maps\_utility::array_spawn_function_noteworthy( "fleeing_baddie_spawner", maps\roadkill_code::_id_A816 );
    common_scripts\utility::flag_wait( "roadkill_school_9" );
    common_scripts\utility::flag_set( "shepherd_moves_out" );
    common_scripts\utility::flag_wait( "roadkill_school_13" );
    thread _id_BCDA();
    thread maps\roadkill_code::_id_B33E();
}

_id_AE36()
{
    common_scripts\utility::flag_wait( "retreaters_run" );
    wait 2;
    maps\roadkill_code::_id_B27C( "roadkill_shp_thanksforassist" );
    maps\roadkill_code::_id_B2D4( "roadkill_fly_allthewaysir" );
}

_id_BCDA()
{
    if ( common_scripts\utility::flag( "player_rounds_end_corner" ) )
        return;

    level endon( "player_rounds_end_corner" );
    var_0 = getent( "roadkill_school_14", "targetname" );
    var_1 = var_0 maps\_utility::get_color_volume_from_trigger();
    var_1 maps\_utility::waittill_volume_dead_or_dying();
    wait 1;
    maps\roadkill_code::_id_B2D4( "roadkill_fly_togoliath" );
    maps\roadkill_code::_id_BE3C( "roadkill_ar3_sendtraffic" );
    maps\roadkill_code::_id_B2D4( "roadkill_fly_schoolsecure" );
    maps\roadkill_code::_id_BE3C( "roadkill_ar3_rallypoint" );
    maps\roadkill_code::_id_B2D4( "roadkill_fly_thanksfortip" );
    maps\roadkill_code::_id_B2D4( "roadkill_fly_watchstragglers" );
    common_scripts\utility::flag_set( "final_objective" );
}

_id_C2C8()
{
    soundscripts\_snd::snd_message( "start_roadkill_end_checkpoint" );
    common_scripts\utility::flag_set( "School_Section_Flag" );
    common_scripts\utility::flag_set( "Final_Section_Flag" );
    common_scripts\utility::flag_set( "classroom_down_stair" );
    common_scripts\utility::array_thread( getentarray( "rotate_object", "targetname" ), maps\roadkill_code::rotate_object );
    thread maps\roadkill_code::school_weaponclips();
    _func_31B( 1 );
    _func_31B( 3 );
    _func_31C( 2 );
    _func_31C( 4 );
    _func_31C( 5 );
    var_0 = common_scripts\utility::getstruct( "start_player_end", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
}

_id_CAEE()
{
    soundscripts\_snd::snd_message( "start_roadkill_endfight_checkpoint" );
    common_scripts\utility::flag_set( "School_Section_Flag" );
    common_scripts\utility::flag_set( "Final_Section_Flag" );
    common_scripts\utility::flag_set( "classroom_down_stair" );
    common_scripts\utility::array_thread( getentarray( "rotate_object", "targetname" ), maps\roadkill_code::rotate_object );
    thread maps\roadkill_code::school_weaponclips();
    _func_31B( 1 );
    _func_31B( 3 );
    _func_31C( 2 );
    _func_31C( 4 );
    _func_31C( 5 );
    var_0 = common_scripts\utility::getstruct( "start_player_endfight", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = common_scripts\utility::getstructarray( "start_ally_endfight", "targetname" );
    var_2 = getent( "dismount_macey", "script_noteworthy" );
    var_2.origin = var_1[0].origin;
    var_3 = getent( "dismount_dunn", "script_noteworthy" );
    var_3.origin = var_1[1].origin;
    level.foley = var_2 stalingradspawn();
    level._id_ACC0 = var_3 stalingradspawn();

    for ( var_4 = 0; var_4 <= 16; var_4++ )
    {
        if ( common_scripts\utility::flag_exist( "roadkill_school_" + var_4 ) )
            common_scripts\utility::flag_set( "roadkill_school_" + var_4 );
    }

    thread maps\roadkill_code::_id_D35B();
    waittillframeend;
    level.foley maps\_utility::set_force_color( "b" );
    level._id_ACC0 maps\_utility::set_force_color( "p" );
    maps\_utility::array_spawn_function_noteworthy( "fleeing_baddie_spawner", maps\roadkill_code::_id_A816 );
}

_id_CF76()
{
    maps\_utility::array_spawn_function_targetname( "shepherd_ending_spawner", maps\roadkill_code::_id_C6C0 );
    maps\_utility::array_spawn_function_targetname( "ending_hangout_spawner", maps\roadkill_code::_id_C6C3 );
    maps\_utility::array_spawn_function_targetname( "ending_wounded_spawner", maps\roadkill_code::ending_wounded_spawner );
    level._id_D0BE = [];
    maps\_utility::array_spawn_function_noteworthy( "ending_vehicle", maps\roadkill_code::_id_BCF7 );
    maps\_utility::array_spawn_function_noteworthy( "shepherd_ending_vehicle", maps\roadkill_code::_id_B218 );
    maps\_utility::array_spawn_function_noteworthy( "pistol_walk_spawner", maps\roadkill_code::_id_B4DB );
    maps\_utility::array_spawn_function_noteworthy( "pistol_killer_spawner", maps\roadkill_code::_id_B59A );
    common_scripts\utility::run_thread_on_targetname( "friendlies_get_on_exit_convoy_trigger", maps\roadkill_code::_id_C86B );
    thread dropplayergun();
    common_scripts\utility::flag_wait( "roadkill_school_20" );
    level._id_D4C7 = [];
    level._id_AA06 = [];
    maps\_utility::array_spawn_function_noteworthy( "heli_spawner_left", maps\roadkill_code::_id_AC51 );
    maps\_utility::array_spawn_noteworthy( "heli_spawner_left" );
    maps\_utility::array_spawn_function_noteworthy( "heli_spawner_right", maps\roadkill_code::_id_CEFC );
    maps\_utility::array_spawn_noteworthy( "heli_spawner_right" );
    maps\_utility::array_spawn_function_targetname( "ending_takeoff_heli_spawner", maps\roadkill_code::_id_B038 );
    maps\_utility::array_spawn_targetname( "ending_takeoff_heli_spawner" );

    if ( !getdvarint( "use_old_rangers_before_finale" ) )
        thread _id_BA8E();

    common_scripts\utility::flag_wait( "pistol_runner_died" );
    maps\_utility::activate_trigger_with_targetname( "final_friendly_trigger" );

    if ( isalive( level._id_B27E ) )
        level._id_B27E thread maps\_utility::generic_dialogue_queue( "roadkill_fly_lastofem" );

    soundscripts\_audio_mix_manager::mm_add_submix( "finale" );
    common_scripts\utility::flag_wait( "player_rounds_end_corner" );
    var_0 = getent( "shepherd_ending_spawner", "targetname" );
    var_0 maps\_utility::spawn_ai();
    maps\_utility::array_spawn_targetname( "ending_hangout_spawner" );
    maps\_utility::array_spawn_targetname( "ending_wounded_spawner" );
    common_scripts\utility::flag_wait( "approaching_end" );
    var_0 = getent( "stryker_blocker_spawner", "targetname" );
    var_0 maps\_utility::spawn_vehicle();
    common_scripts\utility::flag_wait( "the_end" );
    var_1 = maps\_utility::get_force_color_guys( "allies", "c" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.magic_bullet_shield ) )
            var_3 maps\_utility::stop_magic_bullet_shield();

        var_3 delete();
    }

    var_5 = getaiarray( "axis" );

    foreach ( var_3 in var_5 )
        var_3 kill();

    maps\_utility::array_spawn_function_targetname( "friendly_ending_runner_spawner", maps\roadkill_code::_id_B511 );
    maps\_utility::array_spawn_targetname( "friendly_ending_runner_spawner" );
}

dropplayergun()
{
    common_scripts\utility::flag_wait( "start_shepherd_end" );
    setsaveddvar( "cg_gunDownAnimDelayTime", 250 );
}

_id_BA8E()
{
    common_scripts\utility::flag_wait( "player_rounds_end_corner_setup" );
    var_0 = [];
    var_1 = getentarray( "pistol_killer_spawner", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        if ( isai( var_3 ) )
        {
            var_0 = common_scripts\utility::array_add( var_0, var_3 );
            break;
        }
    }

    var_1 = getentarray( "pistol_killer_friend_spawner", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        if ( isai( var_3 ) )
        {
            var_0 = common_scripts\utility::array_add( var_0, var_3 );
            break;
        }
    }

    if ( var_0.size > 0 )
    {
        for ( var_7 = 0; var_7 < var_0.size; var_7++ )
            thread _id_C5F2( var_0[var_7], var_7 + 1 );
    }
    else
    {

    }
}

_id_C5F2( var_0, var_1 )
{
    var_2 = spawn( "script_origin", ( -9703.88, 12828.4, 511.943 ) );
    var_2.angles = ( 0.0, 34.957, 0.0 );

    if ( var_1 == 1 )
        var_2 maps\_anim::anim_generic_first_frame( var_0, "end_ranger_pointing" + var_1 );
    else if ( var_1 == 2 )
        var_2 thread maps\_anim::anim_generic_loop( var_0, "end_ranger_idle" + var_1, "stop_idle_loop" );

    common_scripts\utility::flag_wait( "player_rounds_end_corner" );
    var_2 notify( "stop_idle_loop" );
    waitframe();
    var_2 maps\_anim::anim_generic( var_0, "end_ranger_pointing" + var_1 );
    var_2 maps\_anim::anim_generic_loop( var_0, "end_ranger_idle" + var_1 );
}

_id_D5C2()
{
    soundscripts\_audio_mix_manager::mm_clear_submix( "finale" );
    thread maps\roadkill_code::_id_C687( "roadkill_ar2_oscarmike2" );
    wait 1.2;
    thread maps\roadkill_code::_id_C687( "roadkill_ar3_stowyourgear" );
    wait 0.7;
    common_scripts\utility::flag_wait( "the_end" );
    thread maps\roadkill_code::_id_C687( "roadkill_ar4_upandrunning" );
    wait 2.1;
    thread maps\roadkill_code::_id_C687( "roadkill_ar1_sparemre" );
    wait 0.3;
    thread maps\roadkill_code::_id_C687( "roadkill_ar4_oscarmike" );
    wait 0.4;
    thread maps\roadkill_code::_id_C687( "roadkill_fly_mountup" );
    wait 1.2;
    thread maps\roadkill_code::_id_C687( "roadkill_fly_movingout" );
}

_id_B57A()
{
    waittillframeend;
    var_0 = level.start_point;

    if ( var_0 == "intro" )
        return;

    if ( var_0 == "riverbank" )
        return;

    if ( var_0 == "move_out" )
        return;

    common_scripts\utility::flag_set( "bridgelayer_crosses" );
    common_scripts\utility::flag_set( "riverbank_baddies_retreat" );
    common_scripts\utility::flag_set( "leaving_riverbank" );
    common_scripts\utility::flag_set( "player_enters_riverbank" );
    common_scripts\utility::flag_set( "bridge_baddies_retreat" );
    maps\_utility::battlechatter_off( "allies" );

    if ( var_0 == "convoy" )
        return;

    maps\_utility::battlechatter_off( "axis" );
    common_scripts\utility::flag_set( "player_gets_in" );
    common_scripts\utility::flag_set( "roadkill_town_dialogue" );
    common_scripts\utility::flag_set( "100ton_bomb_goes_off" );

    if ( var_0 == "ride" )
        return;

    common_scripts\utility::flag_set( "fight_back" );

    if ( var_0 == "ambush" )
        return;

    common_scripts\utility::flag_set( "detour_convoy_slows_down" );
    common_scripts\utility::flag_set( "ambush_spawn" );
    common_scripts\utility::flag_set( "ambush" );

    if ( var_0 == "ride_later" )
        return;

    if ( var_0 == "ride_end" )
        return;

    maps\_utility::set_player_attacker_accuracy( 0.0 );
    level.player.ignorerandombulletdamage = 1;
    thread maps\roadkill_code::_id_B0B8();

    if ( var_0 == "dismount" )
        return;

    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_set( "player_enters_ambush_house" );
    common_scripts\utility::flag_set( "player_is_dismounted" );

    if ( var_0 == "school" )
        return;

    common_scripts\utility::flag_set( "final_objective" );
    common_scripts\utility::flag_set( "roadkill_school_20" );
    common_scripts\utility::flag_set( "school_back_baddies_dead" );

    if ( var_0 == "endfight" )
        return;

    if ( var_0 == "end" )
        return;
}

_id_CD01()
{
    switch ( level.start_point )
    {
        case "default":
        case "intro":
        case "riverbank":
        case "move_out":
        case "convoy":
            maps\roadkill_code::_id_B6C1();
        case "ambush":
        case "ride":
        case "ride_later":
        case "ride_end":
            maps\roadkill_code::_id_B0F5();
        case "dismount":
            maps\roadkill_code::_id_CD40();
            maps\roadkill_code::_id_C068();
        case "end":
        case "school":
        case "endfight":
            maps\roadkill_code::_id_BFC8();
            break;
        default:
            break;
    }
}

_id_C944()
{
    switch ( level.start_point )
    {
        case "default":
        case "intro":
            common_scripts\utility::flag_wait( "get_on_the_line" );
        case "riverbank":
        case "move_out":
        case "convoy":
            common_scripts\utility::flag_wait( "intro_latvee_complete" );
            wait 5;
            maps\_utility::musicplaywrapper( "mus_roadkill_intro" );
            common_scripts\utility::flag_wait( "player_starts_stairs" );
            musicstop( 10 );
            common_scripts\utility::flag_wait( "player_gets_in" );
        case "ambush":
        case "ride":
        case "ride_later":
        case "ride_end":
        case "dismount":
        case "school":
        case "endfight":
            thread maps\_utility::music_loop( "mus_roadkill_armored_and_combat" );
        case "end":
            common_scripts\utility::flag_wait( "start_shepherd_end" );
            level notify( "stop_music" );
            musicstop( 5 );
            level.player maps\_utility::play_sound_on_entity( "mus_roadkill_finish" );
            break;
        default:
            break;
    }
}

_id_C9F2( var_0, var_1, var_2 )
{
    var_2 = clamp( ( var_2 - var_0 ) / ( var_1 - var_0 ), 0.0, 1.0 );
    return var_2 * var_2 * ( 3 - 2 * var_2 );
}

_id_A9B2()
{
    var_0 = 0.25;
    var_1 = 4.0;
    var_2 = 0.0;
    var_3 = 0.05;
    _func_2F1( 0, "x", 1.0 );
    _func_2F1( 0, "y", 0.0 );
    level waittill( "building_collapse" );
    wait(var_0);
    _func_2F1( 0, "y", 1.0 );
    var_2 = var_1;

    while ( var_2 > 0.0 )
    {
        var_4 = _id_C9F2( 0.0, var_1, var_2 );
        _func_2F1( 0, "y", var_4 );
        var_2 -= var_3;
        wait(var_3);
    }
}

_id_B2F1( var_0, var_1 )
{
    var_2 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( var_0 );
    wait(var_1);

    foreach ( var_4 in var_2 )
    {
        var_4 maps\roadkill_aud::_id_C3BF();
        var_4 thread maps\_utility::play_sound_on_entity( var_4._id_A95C );
    }
}
