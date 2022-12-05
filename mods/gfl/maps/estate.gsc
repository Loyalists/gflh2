// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\estate_mission_select_cam::_id_C490();
        return;
    }

    if ( maps\estate_beautiful_corner::_id_C662() )
        return;

    maps\_vehicle::build_light_override( "script_vehicle_pavelow", "key_light", "tag_light_tail2", "fx/lights/pavelow_lighting_estate", "sheppard", 0.2 );
    maps\_utility::default_start( ::_id_C71D );
    maps\_utility::add_start( "intro", ::_id_C71D, "Intro", ::_id_BA33 );
    maps\_utility::add_start( "ambush", ::_id_D56D, "Ambush", ::_id_BA33 );
    maps\_utility::add_start( "forest_fight", ::_id_B8E2, "Forest Fight", ::_id_BA33 );
    maps\_utility::add_start( "house_approach", ::_id_B2EC, "House Approach", ::_id_BA33 );
    maps\_utility::add_start( "house_breach", ::_id_AA64, "House Breach" );
    maps\_utility::add_start( "house_briefing", ::_id_CBAF, "House Briefing" );
    maps\_utility::add_start( "house_defense", ::_id_B65A, "House Defense" );
    maps\_utility::add_start( "escape", ::_id_ADAE, "Escape to LZ" );
    maps\_utility::add_start( "ending", ::_id_CDB0, "Ending Sequence" );
    maps\_utility::add_start( "ending_body_throw", ::_id_C534 );
    maps\_utility::add_start( "alt_ending", ::_id_C66C, "Alternate Ending" );
    maps\_utility::add_start( "ending_noslowmo", ::_id_BBEA );
    maps\_utility::add_start( "diskdrive", ::_id_ACB2 );
    maps\_utility::add_start( "helicopter_tweak", ::_id_BDF0 );
    maps\_utility::add_start( "helicopter_tweak_2", ::_id_B6E5 );
    maps\_utility::add_start( "ending_pavelow_heli_tweak", ::_id_B0EC );
    maps\_utility::add_start( "ending_shadow_heli_tweak", ::_id_CFFC );
    maps\_utility::add_start( "fakeRPG_tweak", ::_id_C074 );
    maps\estate_code::_id_C21D();
    _id_B22E::main();
    thread _id_AB52::main();
    maps\estate_code::_id_C2B0();

    if ( getdvar( "loc_arabic_sku" ) == "1" )
    {
        var_0 = getent( "blowup_doll", "targetname" );
        var_0 hide();
    }

    _func_2F1( 0, "xyzw", 0.35, 0.4, 0.5, 0.5 );
}

_id_A960()
{
    common_scripts\utility::flag_set( "ending_flag" );
    thread objectives();
    thread maps\estate_code::_id_D002();
    thread maps\estate_code::_id_C6D1();
    thread maps\estate_code::_id_CAC2();
    thread maps\estate_code::_id_B569();
    thread maps\estate_code::_id_B653();
    thread maps\estate_code::_id_AE1C();
    thread _id_D301::_id_D23F();
    thread maps\estate_code::_id_A834();
    thread _id_CE1A();
    thread _id_B386();
    thread _id_D1FF();
    common_scripts\utility::array_thread( getentarray( "boathouse_lamp", "targetname" ), maps\estate_code::animatescriptedmodel, "lamp" );
    common_scripts\utility::array_thread( getentarray( "flower_pot", "targetname" ), maps\estate_code::animatescriptedmodel, "flower" );
    common_scripts\utility::array_thread( getentarray( "chandelier_small", "targetname" ), maps\estate_code::animatescriptedmodel, "chandelier_small" );
    common_scripts\utility::array_thread( getentarray( "chandelier_big", "targetname" ), maps\estate_code::animatescriptedmodel, "chandelier_big" );
    thread static_group_monitor( "static_model_group_start_flag", "death", 1 );

    if ( !common_scripts\utility::flag( "skip_forestfight" ) )
    {
        thread _id_BAAB();
        thread _id_BE1E();
        thread _id_CF3B();
        thread _id_CB8F();
        thread _id_A931();
        thread _id_BF23();
        thread _id_CCBC();
        thread _id_C7E1();
        thread _id_CE45();
    }

    if ( common_scripts\utility::flag( "skip_forestfight" ) )
        common_scripts\utility::flag_set( "start_ambush_music" );

    if ( !common_scripts\utility::flag( "skip_houseapproach" ) )
    {
        thread _id_AB9C();
        thread _id_AD7A();
        thread _id_AA2D();
        thread _id_D223();
        thread _id_BC91();
        thread _id_B56B();
        thread maps\estate_code::_id_C77F();
    }

    if ( !common_scripts\utility::flag( "skip_breachandclear" ) )
    {
        thread _id_BD6D();
        thread _id_BE56();
        thread _id_D484();
        thread _id_CDB3();
        thread _id_B95C();
        thread maps\estate_code::_id_B6F9();
        thread maps\estate_code::_id_B49F();
        thread maps\estate_code::_id_D051();
        thread maps\estate_code::_id_D154();
        thread maps\estate_code::_id_D4BA();
        thread maps\estate_code::_id_C5E1();
        thread maps\estate_code::_id_B753();
        thread maps\estate_code::_id_CD8C();
        thread maps\estate_code::_id_B3B7();
        thread maps\estate_code::_id_CF51();
        thread maps\estate_code::_id_BCB2();
        thread maps\estate_code::_id_CCA9();
        thread maps\estate_code::_id_D4C4();
        thread maps\estate_code::_id_CB23();
        thread maps\estate_code::_id_B98A();
        thread maps\estate_code::_id_C8F0();
        thread maps\estate_code::_id_B37B();
        thread maps\estate_code::_id_D577();
        thread maps\estate_code::_id_BB0C();
        thread maps\estate_code::_id_CD4F();
        thread maps\estate_code::_id_B46F( "breach0_diningroom", "breaching_number_0" );
        thread maps\estate_code::_id_B46F( "breach0_foyerhall", "breaching_number_0" );
        thread maps\estate_code::_id_B46F( "breach0_bathroomrush", "breaching_number_0" );
        thread maps\estate_code::_id_BAD0( "breach0_diningroom", "breach0_diningroom_cancel", "foyer_breached_first" );
        thread maps\estate_code::_id_BAD0( "breach0_foyerhall", "breach0_foyerhall_cancel", "foyer_breached_first" );
        thread maps\estate_code::_id_B521( "breach0_diningroom_spawntrig", "breach0_diningroom_cancel", "breaching_number_0", "breach0_diningroom" );
        thread maps\estate_code::_id_B521( "breach0_foyerhall_spawntrig", "breach0_foyerhall_cancel", "breaching_number_0", "breach0_foyerhall" );
        thread maps\estate_code::_id_B521( "breach0_bathroomrush_spawntrig", undefined, "breaching_number_0", "breach0_bathroomrush" );
        thread maps\estate_code::_id_AB05();
        thread maps\estate_code::_id_B46F( "breach1_foyertodining", "breaching_number_1" );
        thread maps\estate_code::_id_B46F( "breach1_officerush", "breaching_number_1" );
        thread maps\estate_code::_id_BAD0( "breach1_foyertodining", "breach1_foyertodining_cancel", "kitchen_breached_first" );
        thread maps\estate_code::_id_BAD0( "breach1_officerush", "breach1_officerush_cancel", "kitchen_breached_first" );
        thread maps\estate_code::_id_B521( "breach1_foyertodining_spawntrig", "breach1_foyertodining_cancel", "breaching_number_1", "breach1_foyertodining" );
        thread maps\estate_code::_id_B521( "breach1_officerush_spawntrig", undefined, "breaching_number_1", "breach1_officerush" );
        thread maps\estate_code::_id_B46F( "breach2_stairdown", "breaching_number_2" );
        thread maps\estate_code::_id_BAD0( "breach2_stairdown", "breach2_stairdown_cancel", "basement_breached_first" );
        thread maps\estate_code::_id_B521( "breach2_stairdown_spawntrig", "breach2_stairdown_cancel", "breaching_number_2", "breach2_stairdown" );
    }

    if ( common_scripts\utility::flag( "skip_breachandclear" ) )
    {
        thread maps\_slowmo_breach::delete_breach( 0 );
        thread maps\_slowmo_breach::delete_breach( 1 );
        thread maps\_slowmo_breach::delete_breach( 2 );
        thread maps\_slowmo_breach::delete_breach( 3 );
        thread maps\_slowmo_breach::delete_breach( 4 );
        thread maps\_slowmo_breach::delete_breach( 5 );
        thread maps\estate_code::_id_CD6B();
        thread _id_B95C();
    }

    if ( !common_scripts\utility::flag( "skip_housebriefing" ) )
    {
        thread maps\estate_code::_id_AF58();
        thread _id_BF05();
        thread maps\estate_code::_id_D15E();
        thread maps\estate_code::_id_BD87();
        thread maps\estate_code::_id_D3CB();
        thread _id_C4C7();
        thread maps\estate_code::_id_BA8D();
        thread maps\estate_code::_id_AA71();
        thread maps\estate_code::_id_CB82();
    }

    if ( common_scripts\utility::flag( "skip_housebriefing" ) && !common_scripts\utility::flag( "skip_defense" ) )
    {
        thread maps\estate_code::_id_AF58();
        thread maps\estate_code::_id_D15E();
        thread maps\estate_code::_id_BD87();
        thread maps\estate_code::_id_D3CB();
        thread _id_C4C7();
        thread maps\estate_code::_id_BA8D();
        thread maps\estate_code::_id_AA71();
        thread maps\estate_code::_id_CB82();
    }
}

_id_C71D()
{
    soundscripts\_snd::snd_message( "startIntro_checkpoint" );
    thread _id_A960();
    maps\estate_code::_id_A914();
    var_0 = getentarray( "broken_fence", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 hide();

    thread maps\estate_code::_id_BE3A();
    thread _id_CB2B();
    thread intro_dialogue();
    thread maps\estate_code::_id_C2C5();
    thread maps\estate_code::_id_CE88();
    thread maps\estate_code::_id_BECD();
}

_id_D56D()
{
    common_scripts\utility::flag_set( "ending_flag" );
    soundscripts\_snd::snd_message( "startAmbush_checkpoint" );
    common_scripts\utility::flag_set( "skip_intro" );
    common_scripts\utility::flag_set( "print_first_objective" );
    thread _id_A960();
    maps\estate_code::_id_BECD();
    var_0 = getent( "player_ambush_start", "targetname" );
    level.player maps\_utility::teleport_ent( var_0 );
    maps\estate_code::_id_A914();
    var_1 = getnode( "ghost_ambush_start", "targetname" );
    level._id_B8D7 forceteleport( var_1.origin, var_1.angles );
    var_2 = getentarray( "starterguy", "script_noteworthy" );
    var_3 = getnodearray( "friendly_ambush_start", "targetname" );
    var_4 = var_2.size <= var_3.size;

    foreach ( var_7, var_6 in var_2 )
    {
        var_6.origin = var_3[var_7].origin;
        var_6.angles = var_3[var_7].angles;
    }

    maps\estate_code::_id_C2C5();
    maps\estate_code::_id_CE88();
    maps\_utility::activate_trigger_with_targetname( "ambush_start_redshirts" );
    maps\_utility::activate_trigger_with_targetname( "ambush_start_ghost" );
}

_id_B8E2()
{
    common_scripts\utility::flag_set( "ending_flag" );
    soundscripts\_snd::snd_message( "startForestFight_checkpoint" );
    common_scripts\utility::flag_set( "skip_intro" );
    common_scripts\utility::flag_set( "skip_ambush" );
    common_scripts\utility::flag_set( "bouncing_betty_done" );
    common_scripts\utility::flag_set( "print_first_objective" );
    common_scripts\utility::flag_set( "deploy_rpg_ambush" );
    common_scripts\utility::flag_set( "deploy_mortar_attack" );
    common_scripts\utility::flag_set( "ambush_complete" );
    thread _id_A960();
    var_0 = getent( "player_forestfight_start", "targetname" );
    level.player maps\_utility::teleport_ent( var_0 );
    maps\estate_code::_id_A914();
    var_1 = getnode( "ghost_ambush_start", "targetname" );
    level._id_B8D7 forceteleport( var_1.origin, var_1.angles );
    var_2 = getentarray( "starterguy", "script_noteworthy" );
    var_3 = getnodearray( "friendly_forestfight_start", "targetname" );
    var_4 = getnodearray( "forestfight_friendlykill", "script_noteworthy" );
    var_5 = var_2.size <= var_3.size;

    foreach ( var_8, var_7 in var_2 )
    {
        var_7.origin = var_3[var_8].origin;
        var_7.angles = var_3[var_8].angles;
    }

    maps\estate_code::_id_C2C5();
    maps\estate_code::_id_CE88();
    maps\_utility::activate_trigger_with_targetname( "forestfight_start_redshirts" );
    maps\_utility::activate_trigger_with_targetname( "ambush_start_ghost" );
    wait 0.05;

    foreach ( var_10 in var_4 )
        radiusdamage( var_10.origin, var_10.radius, 1000, 180 );

    wait 3;
    common_scripts\utility::flag_set( "smoke_screen_activated" );
    wait 3;
    common_scripts\utility::flag_set( "spawn_first_ghillies" );
}

_id_B2EC()
{
    common_scripts\utility::flag_set( "ending_flag" );
    soundscripts\_snd::snd_message( "startHouseApproach_checkpoint" );
    common_scripts\utility::flag_set( "skip_intro" );
    common_scripts\utility::flag_set( "skip_ambush" );
    common_scripts\utility::flag_set( "skip_forestfight" );
    common_scripts\utility::flag_set( "bouncing_betty_done" );
    common_scripts\utility::flag_set( "print_first_objective" );
    common_scripts\utility::flag_set( "forestfight_littlebird_1" );
    common_scripts\utility::flag_set( "player_is_out_of_ambush_zone" );
    thread _id_A960();
    var_0 = getent( "player_houseapproach_start", "targetname" );
    level.player maps\_utility::teleport_ent( var_0 );
    maps\estate_code::_id_A914();
    var_1 = getnode( "ghost_houseapproach_start", "targetname" );
    level._id_B8D7 forceteleport( var_1.origin, var_1.angles );
    maps\estate_code::_id_BCB5( "houseapproach" );
}

_id_AA64()
{
    common_scripts\utility::flag_set( "ending_flag" );
    soundscripts\_snd::snd_message( "startHouseBreach_checkpoint" );
    common_scripts\utility::flag_set( "skip_intro" );
    common_scripts\utility::flag_set( "skip_ambush" );
    common_scripts\utility::flag_set( "skip_forestfight" );
    common_scripts\utility::flag_set( "skip_houseapproach" );
    common_scripts\utility::flag_set( "bouncing_betty_done" );
    common_scripts\utility::flag_set( "print_first_objective" );
    common_scripts\utility::flag_set( "futilejeeps_destroyed" );
    common_scripts\utility::flag_set( "deploy_house_defense_jeeps" );
    common_scripts\utility::flag_set( "forestfight_littlebird_1" );
    common_scripts\utility::flag_set( "player_is_out_of_ambush_zone" );
    thread _id_A960();
    var_0 = getent( "breach_tweak_start", "targetname" );
    level.player maps\_utility::teleport_ent( var_0 );
    maps\estate_code::_id_A914();
    var_1 = getnode( "ghost_breachstart_node", "targetname" );
    level._id_B8D7 forceteleport( var_1.origin, var_1.angles );
    maps\estate_code::_id_BCB5( "breachhouse" );
    var_2 = getent( "house_approach_friendlytrigger", "targetname" );
    var_2 notify( "trigger" );
}

_id_CBAF()
{
    common_scripts\utility::flag_set( "ending_flag" );
    soundscripts\_snd::snd_message( "startHouseBriefing_checkpoint" );
    common_scripts\utility::flag_set( "skip_intro" );
    common_scripts\utility::flag_set( "skip_ambush" );
    common_scripts\utility::flag_set( "skip_forestfight" );
    common_scripts\utility::flag_set( "skip_houseapproach" );
    common_scripts\utility::flag_set( "skip_breachandclear" );
    common_scripts\utility::flag_set( "bouncing_betty_done" );
    common_scripts\utility::flag_set( "print_first_objective" );
    common_scripts\utility::flag_set( "futilejeeps_destroyed" );
    common_scripts\utility::flag_set( "house_exterior_has_been_breached" );
    common_scripts\utility::flag_set( "house_interior_breaches_done" );
    common_scripts\utility::flag_set( "forestfight_littlebird_1" );
    common_scripts\utility::flag_set( "player_is_out_of_ambush_zone" );
    level notify( "breaching_number_3" );
    thread _id_A960();
    level._id_B8E7 = "zone_house";
    var_0 = getent( "briefing_tweak_start", "targetname" );
    level.player maps\_utility::teleport_ent( var_0 );
    maps\estate_code::_id_A914();
    var_1 = getnode( "ghost_breachstart_node", "targetname" );
    level._id_B8D7 forceteleport( var_1.origin, var_1.angles );
    maps\estate_code::_id_BCB5( "housebriefing" );
    var_2 = getent( "house_approach_friendlytrigger", "targetname" );
    var_2 notify( "trigger" );
    common_scripts\utility::flag_set( "all_enemies_killed_up_to_house_capture" );
}

_id_B65A()
{
    common_scripts\utility::flag_set( "ending_flag" );
    soundscripts\_snd::snd_message( "startHouseDefense_checkpoint" );
    common_scripts\utility::flag_set( "skip_intro" );
    common_scripts\utility::flag_set( "skip_ambush" );
    common_scripts\utility::flag_set( "skip_forestfight" );
    common_scripts\utility::flag_set( "skip_houseapproach" );
    common_scripts\utility::flag_set( "skip_breachandclear" );
    common_scripts\utility::flag_set( "skip_housebriefing" );
    common_scripts\utility::flag_set( "bouncing_betty_done" );
    common_scripts\utility::flag_set( "print_first_objective" );
    common_scripts\utility::flag_set( "futilejeeps_destroyed" );
    common_scripts\utility::flag_set( "house_exterior_has_been_breached" );
    common_scripts\utility::flag_set( "house_interior_breaches_done" );
    common_scripts\utility::flag_set( "forestfight_littlebird_1" );
    common_scripts\utility::flag_set( "player_is_out_of_ambush_zone" );
    common_scripts\utility::flag_set( "dsm_ready_to_use" );
    common_scripts\utility::flag_set( "house_briefing_is_over" );
    common_scripts\utility::flag_set( "download_started" );
    common_scripts\utility::flag_set( "skip_house_defense_dialogue" );
    level._id_B8E7 = "zone_house";
    level notify( "breaching_number_3" );
    thread _id_A960();
    var_0 = getent( "briefing_tweak_start", "targetname" );
    level.player maps\_utility::teleport_ent( var_0 );
    maps\estate_code::_id_A914();
    var_1 = getnode( "ghost_earlydefense_start", "targetname" );
    level._id_B8D7 forceteleport( var_1.origin, var_1.angles );
    maps\estate_code::_id_BCB5( "housebriefing" );
    var_2 = getent( "house_approach_friendlytrigger", "targetname" );
    var_2 notify( "trigger" );
    common_scripts\utility::flag_set( "scarecrow_to_earlydefense_start" );
    common_scripts\utility::flag_set( "ozone_to_earlydefense_start" );
    common_scripts\utility::flag_set( "all_enemies_killed_up_to_house_capture" );
    wait 1;
    var_1 = getnode( "ghost_earlydefense_start", "targetname" );
    level._id_B8D7 setgoalnode( var_1 );
    thread _id_C2B4();
    thread _id_D5D3();
}

_id_ADAE()
{
    common_scripts\utility::flag_set( "ending_flag" );
    soundscripts\_snd::snd_message( "startEscape_checkpoint" );
    var_0 = getent( "final_area_fence", "targetname" );
    var_0 delete();
    var_1 = getentarray( "broken_fence", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 show();

    var_5 = getent( "dsm", "targetname" );
    var_6 = getent( "dsm_obj", "targetname" );
    var_5 hide();
    var_6 hide();
    common_scripts\utility::flag_set( "skip_intro" );
    common_scripts\utility::flag_set( "skip_ambush" );
    common_scripts\utility::flag_set( "skip_forestfight" );
    common_scripts\utility::flag_set( "skip_houseapproach" );
    common_scripts\utility::flag_set( "skip_breachandclear" );
    common_scripts\utility::flag_set( "skip_housebriefing" );
    common_scripts\utility::flag_set( "skip_defense" );
    common_scripts\utility::flag_set( "bouncing_betty_done" );
    common_scripts\utility::flag_set( "print_first_objective" );
    common_scripts\utility::flag_set( "futilejeeps_destroyed" );
    common_scripts\utility::flag_set( "house_exterior_has_been_breached" );
    common_scripts\utility::flag_set( "house_interior_breaches_done" );
    common_scripts\utility::flag_set( "forestfight_littlebird_1" );
    common_scripts\utility::flag_set( "player_is_out_of_ambush_zone" );
    common_scripts\utility::flag_set( "house_briefing_is_over" );
    common_scripts\utility::flag_set( "download_started" );
    common_scripts\utility::flag_set( "skip_house_defense_dialogue" );
    common_scripts\utility::flag_set( "download_complete" );
    common_scripts\utility::flag_set( "dsm_recovered" );
    level._id_B8E7 = "zone_house";
    level notify( "breaching_number_3" );
    thread _id_A960();
    var_7 = getent( "briefing_tweak_start", "targetname" );
    level.player maps\_utility::teleport_ent( var_7 );
    maps\estate_code::_id_A914();
    var_8 = getnode( "ghost_earlydefense_start", "targetname" );
    level._id_B8D7 forceteleport( var_8.origin, var_8.angles );
    maps\estate_code::_id_BCB5( "housebriefing" );
    var_9 = getent( "house_approach_friendlytrigger", "targetname" );
    var_9 notify( "trigger" );
    common_scripts\utility::flag_set( "scarecrow_to_earlydefense_start" );
    common_scripts\utility::flag_set( "ozone_to_earlydefense_start" );
    common_scripts\utility::flag_set( "all_enemies_killed_up_to_house_capture" );
    wait 1;
    level._id_B4A3 maps\_utility::stop_magic_bullet_shield();
    level._id_B224 maps\_utility::stop_magic_bullet_shield();
}

_id_C66C()
{
    soundscripts\_snd::snd_message( "startAltEnding_checkpoint" );
    var_0 = getent( "final_area_fence", "targetname" );
    var_0 delete();
    var_1 = getentarray( "broken_fence", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 show();

    common_scripts\utility::flag_set( "test_whole_ending" );
    common_scripts\utility::flag_set( "test_ending" );
    common_scripts\utility::flag_set( "play_ending_sequence" );
    common_scripts\utility::flag_set( "point_of_no_return" );
    thread _id_D1FF();
    thread maps\estate_code::_id_A914();
    thread _id_B386();
    level.player enabledeathshield( 1 );
    level.cover_warnings_disabled = 1;
    wait 5;
    common_scripts\utility::flag_set( "finish_line" );
    common_scripts\utility::flag_set( "test_alt_ending" );
    _id_CE1A();
}

_id_CDB0()
{
    soundscripts\_snd::snd_message( "startEnding_checkpoint" );
    var_0 = getent( "final_area_fence", "targetname" );
    var_0 delete();
    maps\_utility::set_vision_set( "estate_end" );
    common_scripts\utility::flag_set( "test_whole_ending" );
    common_scripts\utility::flag_set( "test_ending" );
    common_scripts\utility::flag_set( "play_ending_sequence" );
    common_scripts\utility::flag_set( "point_of_no_return" );
    thread _id_D1FF();
    thread maps\estate_code::_id_A914();
    thread _id_B386();
    level.player enabledeathshield( 1 );
    level.cover_warnings_disabled = 1;
    wait 5;
    common_scripts\utility::flag_set( "finish_line" );
    thread maps\estate_code::_id_D002();
    _id_CE1A();
}

_id_C534()
{
    soundscripts\_snd::snd_message( "startEndingBodyTossOnly_checkpoint" );
    common_scripts\utility::flag_set( "play_ending_sequence" );
    common_scripts\utility::flag_set( "test_ending_body_toss" );
    level.player enabledeathshield( 1 );
    level.cover_warnings_disabled = 1;
    _id_CE1A();
}

_id_BBEA()
{
    soundscripts\_snd::snd_message( "startEndingMeh_checkpoint" );
    var_0 = getent( "final_area_fence", "targetname" );
    var_0 delete();
    common_scripts\utility::flag_set( "test_whole_ending" );
    common_scripts\utility::flag_set( "test_ending" );
    common_scripts\utility::flag_set( "play_ending_sequence" );
    common_scripts\utility::flag_set( "test_with_pavelow_already_in_place" );
    common_scripts\utility::flag_set( "no_slow_mo" );
    level.player enabledeathshield( 1 );
    level.cover_warnings_disabled = 1;
    thread maps\estate_code::_id_A914();
    _id_CE1A();
}

_id_ACB2()
{
    soundscripts\_snd::snd_message( "startDiskdrive_checkpoint" );
    common_scripts\utility::flag_set( "download_started" );
    common_scripts\utility::flag_set( "download_test" );
    thread maps\estate_code::_id_D15E();
    thread maps\estate_code::_id_BD87();
}

_id_BDF0()
{
    soundscripts\_snd::snd_message( "startHeliTweak_checkpoint" );
    common_scripts\utility::flag_set( "skip_intro" );
    var_0 = "md500_rush_3";
    _id_D2CB( var_0 );
}

_id_B6E5()
{
    soundscripts\_snd::snd_message( "startHeliTweak2_checkpoint" );
    common_scripts\utility::flag_set( "skip_intro" );
    var_0 = "boathouse_mi17";
    thread _id_D2CB( var_0 );
    var_0 = "boathouse_md500";
    thread _id_D2CB( var_0 );
}

_id_B0EC()
{
    soundscripts\_snd::snd_message( "startHeliTweakPavelowEnd_checkpoint" );
    common_scripts\utility::flag_set( "skip_intro" );
    common_scripts\utility::flag_set( "point_of_no_return" );
    var_0 = common_scripts\utility::getstruct( "ending_chopper_node", "targetname" );
    level.player maps\_utility::teleport_player( var_0 );
    thread _id_B386();
}

_id_CFFC()
{
    soundscripts\_snd::snd_message( "startHeliTweakShadowBirdsEnd" );
    common_scripts\utility::flag_set( "skip_intro" );
    common_scripts\utility::flag_set( "enter_the_littlebirds" );
    var_0 = common_scripts\utility::getstruct( "ending_chopper_node", "targetname" );
    level.player maps\_utility::teleport_player( var_0 );
    thread _id_B89D();
}

_id_C074()
{
    soundscripts\_snd::snd_message( "startFakeRPGTweak_checkpoint" );
    wait 5;
    maps\estate_code::_id_AC6F();
}

_id_CB2B()
{
    wait 2;
    maps\_introscreen::_id_D1B8();
    soundscripts\_snd::snd_message( "aud_start_stealth_infiltration_mix" );
    common_scripts\utility::flag_set( "slam_zoom_done" );
    level.player setstance( "crouch" );
    wait 1.8;
    soundscripts\_snd::snd_message( "aud_ambient_chainsaw" );
    common_scripts\utility::flag_set( "start_ghost_intro_nav" );
    wait 5;
    common_scripts\utility::flag_set( "print_first_objective" );
}

intro_dialogue()
{
    common_scripts\utility::flag_wait( "slam_zoom_done" );
    maps\_utility::radio_dialogue( "est_snp1_inposition" );
    level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_engageonsight" );
    maps\_utility::radio_dialogue( "est_sld1_rogerthat" );
    maps\_utility::radio_dialogue( "est_sld2_solidcopy" );
    level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_letsgoletsgo" );
}

objectives()
{
    common_scripts\utility::flag_wait( "print_first_objective" );
    var_0 = getent( "objective_location_makarov", "targetname" );
    objective_add( 1, "current", &"ESTATE_OBJ_ASSASSINATE", var_0.origin );
    common_scripts\utility::flag_wait_either( "futilejeeps_destroyed", "deploy_house_defense_jeeps" );
    objective_add( 2, "current", &"ESTATE_OBJ_SAFEHOUSE" );
    objective_current( 2 );
    _func_1E7( 2, 1 );
    objective_state_nomessage( 1, "active" );
    var_1 = getentarray( "breach_objective_exterior", "targetname" );
    maps\_slowmo_breach::assign_script_breachgroup_to_ents( var_1 );
    var_2 = maps\_slowmo_breach::get_breach_indices_from_ents( var_1 );
    maps\_slowmo_breach::objective_breach( 2, var_2[0], var_2[1], var_2[2], var_2[3] );
    thread _id_AC87( "0" );
    thread _id_AC87( "1" );
    thread _id_AC87( "2" );
    common_scripts\utility::flag_wait( "house_exterior_has_been_breached" );
    maps\_utility::objective_clearadditionalpositions( 2 );
    wait 1;
    var_3 = getentarray( "breach_objective_interior", "targetname" );
    maps\_slowmo_breach::assign_script_breachgroup_to_ents( var_3 );
    level._id_CE09 = 0;
    level._id_C77D = var_3.size;

    foreach ( var_5 in var_3 )
        var_5 thread _id_B16B( var_5.script_slowmo_breach );

    var_2 = maps\_slowmo_breach::get_breach_indices_from_ents( var_3 );
    maps\_slowmo_breach::objective_breach( 2, var_2[0], var_2[1], var_2[2], var_2[3] );
    thread _id_C78C( "3" );
    thread _id_C78C( "4" );
    thread _id_C78C( "5" );
    thread _id_B2AA();
    common_scripts\utility::flag_wait( "house_interior_breaches_done" );
    common_scripts\utility::flag_wait( "all_enemies_killed_up_to_house_capture" );
    common_scripts\utility::flag_wait( "ghost_gives_regroup_order" );
    objective_state( 2, "done" );
    objective_state_nomessage( 1, "done" );
    var_7 = common_scripts\utility::getstruct( "ghost_talknode", "targetname" );
    objective_add( 3, "current", &"ESTATE_OBJ_REGROUP", var_7.origin );
    thread remove_objective_ghost();
    common_scripts\utility::flag_wait( "house_briefing_is_over" );
    objective_state( 3, "done" );
    var_8 = getent( "dsm", "targetname" );
    objective_add( 4, "current", &"ESTATE_OBJ_INTEL", var_8.origin );
    common_scripts\utility::flag_wait( "download_started" );
    objective_state_nomessage( 4, "done" );
    objective_add( 4, "current", &"ESTATE_OBJ_DOWNLOAD", var_8.origin );
    objective_state( 4, "current" );
    objective_setpointertextoverride( 4, &"ESTATE_OBJ_POINTER_PROTECT" );
    common_scripts\utility::flag_wait( "download_complete" );
    objective_state_nomessage( 4, "done" );
    objective_add( 4, "current", &"ESTATE_OBJ_RETRIEVE", var_8.origin );
    objective_state( 4, "current" );
    objective_setpointertextoverride( 4, &"ESTATE_OBJ_POINTER_RETRIEVE" );
    common_scripts\utility::flag_wait( "dsm_recovered" );
    var_9 = common_scripts\utility::getstruct( "ending_chopper_node", "targetname" );
    objective_state( 4, "done" );
    objective_add( 5, "current", &"ESTATE_OBJ_LZ", var_9.origin );
    common_scripts\utility::flag_wait( "made_it_to_lz" );
    objective_state_nomessage( 5, "done" );
}

_id_AC87( var_0 )
{
    level waittill( "breaching_number_" + var_0 );
    common_scripts\utility::flag_set( "house_exterior_has_been_breached" );
}

_id_C78C( var_0 )
{
    level waittill( "breaching_number_" + var_0 );

    if ( isdefined( level._id_A87F._id_B5D8 ) && level._id_A87F._id_B5D8 && var_0 == "4" )
    {
        foreach ( var_2 in level.claymores )
            var_2 delete();
    }

    level._id_CE09++;

    if ( level._id_CE09 >= level._id_C77D )
        common_scripts\utility::flag_set( "house_interior_breaches_done" );
}

_id_B2AA()
{
    level waittill( "slomo_breach_over" );
    wait 3;
    maps\_utility::autosave_by_name( "breach_completed" );
}

_id_B16B( var_0 )
{
    level waittill( "breaching_number_" + var_0 );
    self delete();
    var_1 = getentarray( "breach_objective_interior", "targetname" );
    maps\_slowmo_breach::assign_script_breachgroup_to_ents( var_1 );
    maps\_utility::objective_clearadditionalpositions( 2 );
    var_2 = maps\_slowmo_breach::get_breach_indices_from_ents( var_1 );
    maps\_slowmo_breach::objective_breach( 2, var_2[0], var_2[1], var_2[2], var_2[3] );
}

_id_BA33()
{
    if ( common_scripts\utility::flag( "ambush_complete" ) )
        thread maps\estate_code::_id_D0FE( level.player.origin );

    if ( !common_scripts\utility::flag( "ambush_complete" ) )
    {
        common_scripts\utility::flag_wait( "bouncing_betty_activated" );
        maps\_utility::battlechatter_off( "allies" );
        maps\_utility::battlechatter_off( "axis" );
        thread maps\estate_code::_id_D343();
        thread maps\_utility::autosave_by_name( "bouncing_betty_sequence" );
        common_scripts\utility::flag_wait( "bouncing_betty_done" );
        common_scripts\utility::flag_set( "smoke_screen_activated" );
        common_scripts\utility::flag_wait( "slow_motion_ambush_done" );
        wait 1;
    }

    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::battlechatter_on( "axis" );
}

_id_BAAB()
{
    common_scripts\utility::flag_wait( "deploy_mortar_attack" );
    wait 1;
    thread _id_D301::_id_AADA( "1" );
    wait 2;
    thread _id_C811();
    level._id_B4A3 maps\_utility::dialogue_queue( "est_scr_presighted" );
    wait 3;
    level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_counterattack" );
    wait 3;
    level.fixednodesaferadius_default = 256;

    if ( !common_scripts\utility::flag( "player_is_out_of_ambush_zone" ) )
        level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_loseeminsmoke" );

    wait 5;
    thread _id_C62D();
}

_id_C811()
{
    var_0 = getent( "forest_friendly_colortrig", "targetname" );
    var_0 notify( "trigger" );
    var_1 = getaiarray( "allies" );

    foreach ( var_3 in var_1 )
        var_3 thread maps\_utility::disable_cqbwalk();
}

_id_CE45()
{
    common_scripts\utility::flag_wait( "player_is_out_of_ambush_zone" );
    maps\_utility::autosave_by_name( "into_the_forest" );
}

_id_C62D()
{
    wait 3;

    if ( isdefined( level.curautosave ) && level.curautosave >= 3 )
        wait 5;

    if ( !common_scripts\utility::flag( "player_is_out_of_ambush_zone" ) )
    {
        common_scripts\utility::flag_clear( "can_save" );
        thread maps\estate_code::_id_AF72();
    }
}

_id_BE1E()
{
    maps\_utility::array_spawn_function_targetname( "forest_defender_rpg_ambush", ::_id_AFF2 );
    common_scripts\utility::flag_wait( "deploy_rpg_ambush" );
    var_0 = getent( "forest_defender_rpg_ambush_activator", "targetname" );
    var_0 notify( "trigger" );
}

_id_AFF2()
{
    self endon( "death" );
    character\gfl\randomizer_merc_sniper::main();
    common_scripts\utility::flag_wait_any( "approaching_house", "stop_smokescreens" );
    wait(randomfloatrange( 2, 4.25 ));
    var_0 = getent( "futilejeep_javelin_sourcepoint1", "targetname" );
    var_0 thread maps\_utility::play_sound_on_entity( "weap_cheytac_fire_special" );
    _id_B190::_id_D55F( self );
    self kill();
}

_id_BF23()
{
    common_scripts\utility::flag_wait( "bouncing_betty_done" );

    if ( !common_scripts\utility::flag( "ambush_complete" ) )
        wait 10;

    var_0 = getent( "forest_spawn_activator", "targetname" );
    var_0 notify( "trigger" );
}

_id_CF3B()
{
    maps\_utility::array_spawn_function_targetname( "forest_defender", maps\estate_code::_id_B2E5 );
    maps\_utility::array_spawn_function_targetname( "forest_defender", maps\estate_code::_id_B927 );
}

_id_CB8F()
{
    common_scripts\utility::flag_wait( "spawn_first_ghillies" );
    thread maps\estate_code::_id_CFB5( "early_sniper" );
}

_id_A931()
{
    level endon( "smokepot1" );
    common_scripts\utility::flag_wait( "smoke_screen_activated" );
    var_0 = getentarray( "smokepot1", "targetname" );
    var_0 = common_scripts\utility::array_randomize( var_0 );

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            wait 5;
            var_2 thread maps\estate_code::_id_ABE8();
            level._id_AA48++;
            thread maps\estate_code::_id_BC0A();
        }

        wait 30;
    }
}

_id_CCBC()
{
    common_scripts\utility::flag_wait( "smokepot1" );
    thread maps\estate_code::_id_BA93();
}

_id_C7E1()
{
    common_scripts\utility::flag_wait( "smoke_screen_activated" );
    thread maps\estate_code::_id_BE8A();
    thread maps\estate_code::_id_CABA();
    thread maps\estate_code::_id_AADC();
}

_id_D2CB( var_0 )
{
    var_1 = getent( "heli_tweak", "targetname" );
    level.player maps\_utility::teleport_ent( var_1 );
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( var_0 );
}

_id_AD7A()
{
    common_scripts\utility::flag_wait( "approaching_house" );
    thread maps\_utility::autosave_by_name( "approaching_house" );
}

_id_D223()
{
    common_scripts\utility::flag_wait( "autosave_housearrival" );
    thread maps\_utility::autosave_by_name( "arrival_house" );
}

_id_BE56()
{
    level common_scripts\utility::waittill_any( "breaching_number_0", "breaching_number_1", "breaching_number_2" );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    level._id_B8D7.baseaccuracy = 1000000;
    level._id_B224.baseaccuracy = 1000000;
    level._id_B4A3.baseaccuracy = 1000000;
}

_id_AB9C()
{
    common_scripts\utility::flag_wait( "deploy_house_defense_jeeps" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "house_defense_jeep1_frontyard" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "house_defense_jeep2_frontyard" );
    var_0 thread maps\estate_aud::_id_B931();
    var_1 thread maps\estate_aud::_id_B931();
}

_id_B56B()
{
    common_scripts\utility::flag_wait( "house_approach_dialogue" );
    level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_clearperimieter" );
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_wait( "house_perimeter_softened" );
    level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_breachnclear" );
    level.fixednodesaferadius_default = 64;
    level._id_B8D7.fixednodesaferadius = 64;
    level._id_B4A3.fixednodesaferadius = 64;
    level._id_B224.fixednodesaferadius = 64;
}

_id_AA2D()
{
    common_scripts\utility::flag_wait( "deploy_futile_jeep" );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    thread maps\_utility::radio_dialogue( "est_snp1_trucksleaving" );
    wait 1;
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "futile_escape_jeep1" );
    var_0 thread _id_B09B();
    var_0 maps\_vehicle::godon();
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "futile_escape_jeep2" );
    var_1 thread _id_B09B();
    var_1 maps\_vehicle::godon();
    var_0 thread maps\estate_aud::_id_B931();
    var_1 thread maps\estate_aud::_id_B931();
    wait 3;
    level._id_B8D7 thread maps\_utility::dialogue_queue( "est_gst_trucksgetaway" );
    wait 1.5;
    wait 2.0;
    thread maps\_utility::radio_dialogue( "est_snp1_firingjavelin" );
    wait 2;
    var_0 thread _id_B25A( "futilejeep_javelin_sourcepoint1" );
    level._id_B8D7 thread maps\_utility::dialogue_queue( "est_gst_dangerclose" );
    wait 1;
    level._id_B8D7 thread maps\_utility::dialogue_queue( "est_gst_bulletproofed" );
    wait 2;
    var_0 maps\_vehicle::godoff();
    wait 1;
    thread maps\_utility::radio_dialogue( "est_snp1_twoaway" );
    var_1 thread _id_B25A( "futilejeep_javelin_sourcepoint2" );
    wait 3;
    var_1 maps\_vehicle::godoff();
    wait 2.75;
    thread maps\_utility::radio_dialogue( "est_snp1_neutralized" );
    wait 2;
    common_scripts\utility::flag_set( "futilejeeps_destroyed" );
}

_id_B25A( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = magicbullet( "javelin_estate_jeep", var_1.origin, self.origin );
    var_2 thread _id_CD38( self );
    var_2 missile_settargetent( self );
    var_2 missile_setflightmodetop();
}

_id_B09B()
{
    if ( !isdefined( self.vehicle_spawner ) )
        return;

    if ( !isdefined( self.vehicle_spawner.targetname ) )
        return;

    self waittill( "death" );
    common_scripts\_exploder::exploder( self.vehicle_spawner.targetname + "_destroyed" );
}

_id_CD38( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1 linkto( self );
    self waittill( "death" );
    earthquake( 1.2, 1.5, var_1.origin, 1600 );
    radiusdamage( var_0.origin, 128, 25000, 25000 );
    wait 0.05;
    var_1 delete();
}

_id_BC91()
{
    common_scripts\utility::flag_wait( "futilejeeps_destroyed" );
    thread maps\_utility::radio_dialogue( "est_snp1_decoys" );
    wait 6;

    if ( !common_scripts\utility::flag( "house_perimeter_softened" ) )
        level.fixednodesaferadius_default = 1040;

    var_0 = getent( "house_approach_friendlytrigger", "targetname" );
    var_0 notify( "trigger" );
    wait 1;
    common_scripts\utility::flag_set( "deploy_house_defense_jeeps" );
    wait 2.15;
    level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_advancingonhouse" );
    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::battlechatter_on( "axis" );
    maps\estate_code::_id_AAAE();
}

_id_BD6D()
{
    common_scripts\utility::flag_wait( "house_interior_breaches_done" );
    wait 2.5;
    var_0 = [];
    var_0 = getaiarray( "axis" );
    level._id_C2AB = var_0.size;
    var_1 = getent( "enemy_presence_volume", "targetname" );

    if ( level._id_C2AB )
    {
        foreach ( var_3 in var_0 )
        {
            var_3 thread _id_CF81();

            if ( var_3 istouching( var_1 ) )
            {
                var_3.goalradius = 128;
                var_3 thread _id_D169();
                continue;
            }

            _id_B190::_id_D55F( var_3 );
            var_3 kill();
        }
    }
    else
        common_scripts\utility::flag_set( "all_enemies_killed_up_to_house_capture" );
}

_id_D169()
{
    self endon( "death" );
    wait(randomfloatrange( 7, 10 ));
    self setgoalentity( level.player );
}

_id_CF81()
{
    self waittill( "death" );
    level._id_C2AB--;

    if ( !level._id_C2AB )
        common_scripts\utility::flag_set( "all_enemies_killed_up_to_house_capture" );
}

_id_D484()
{
    common_scripts\utility::flag_wait( "save_the_game_indoors" );
}

_id_CDB3()
{
    common_scripts\utility::flag_wait( "save_the_game_downstairs" );
}

_id_B95C()
{
    var_0 = getent( "fake_backwards_door", "targetname" );
    var_1 = getent( "fake_backwards_door_clip", "targetname" );

    if ( !common_scripts\utility::flag( "skip_breachandclear" ) )
        level common_scripts\utility::waittill_any( "breaching_number_0", "breaching_number_1", "breaching_number_2" );

    level waittill( "breach_explosion" );
    var_0 delete();
    var_1 delete();
}

_id_C2B4()
{
    level._id_B4A3 endon( "death" );
    level._id_B4A3.voice = "taskforce";
    level._id_B4A3.countryid = "TF";
    level._id_B4A3 maps\_utility::disable_ai_color();
    level._id_B4A3 maps\_utility::disable_cqbwalk();
    level._id_B4A3.goalradius = 16;

    if ( !common_scripts\utility::flag( "skip_house_defense_dialogue" ) )
    {
        var_0 = common_scripts\utility::getstruct( "scarecrow_photonode_new", "targetname" );
        var_0 maps\_anim::anim_generic_reach( level._id_B4A3, "estate_house_photoshoot" );
        maps\_utility::delaythread( 10, common_scripts\utility::flag_set, "photographs_done" );
        var_0 maps\_anim::anim_generic_run( level._id_B4A3, "estate_house_photoshoot" );
    }

    var_1 = getnode( "scarecrow_earlydefense_start", "targetname" );
    level._id_B4A3 setgoalnode( var_1 );
    level._id_B4A3 waittill( "goal" );
    common_scripts\utility::flag_wait( "scarecrow_to_earlydefense_start" );
    maps\_utility::radio_dialogue( "est_scr_inposition" );
    level._id_B4A3 maps\_utility::stop_magic_bullet_shield();

    switch ( level.gameskill )
    {
        case 0:
            level._id_B4A3.health = 800;
            break;
        case 1:
            level._id_B4A3.health = 600;
            break;
        case 2:
            level._id_B4A3.health = 300;
            break;
        case 3:
            level._id_B4A3.health = 300;
            break;
    }

    level._id_B4A3 thread maps\estate_code::_id_BCD1( "scarecrow" );
    level._id_B4A3 thread maps\estate_code::_id_D067();
    common_scripts\utility::flag_wait( "dsm_compromised" );
    level._id_B4A3.health = 1;
}

_id_D5D3()
{
    level._id_B224 endon( "death" );
    level._id_B224.voice = "taskforce";
    level._id_B224.countryid = "TF";
    level._id_B224 maps\_utility::disable_ai_color();
    level._id_B224 maps\_utility::disable_cqbwalk();
    level._id_B224.goalradius = 16;
    var_0 = getnode( "ozone_housebriefing_start", "targetname" );
    level._id_B224 setgoalnode( var_0 );
    level._id_B224 waittill( "goal" );
    common_scripts\utility::flag_wait( "ozone_to_earlydefense_start" );
    var_0 = getnode( "ozone_earlydefense_start", "targetname" );
    level._id_B224 setgoalnode( var_0 );
    level._id_B224 waittill( "goal" );
    common_scripts\utility::flag_wait( "defense_battle_begins" );
    maps\_utility::radio_dialogue( "est_ozn_readyengage" );
    level._id_B224 maps\_utility::stop_magic_bullet_shield();

    switch ( level.gameskill )
    {
        case 0:
            level._id_B224.health = 800;
            break;
        case 1:
            level._id_B224.health = 600;
            break;
        case 2:
            level._id_B224.health = 300;
            break;
        case 3:
            level._id_B224.health = 300;
            break;
    }

    level._id_B224 thread maps\estate_code::_id_BCD1( "ozone" );
    level._id_B224 thread maps\estate_code::_id_D067();
    common_scripts\utility::flag_wait( "dsm_compromised" );
    level._id_B224.health = 1;
}

_id_C2B8()
{
    var_0 = common_scripts\utility::getstruct( "ghost_talknode", "targetname" );
    var_0 maps\_anim::anim_generic_reach( level._id_B8D7, "estate_ghost_radio" );
    level._id_B8D7 _id_B3AB::_id_BEBA( "head", level.player, 200, 65, 65, 30, 45, 1, 1, 10, 0 );
    var_0 maps\_anim::anim_generic_run( level._id_B8D7, "estate_ghost_radio" );
}

_id_BF05()
{
    common_scripts\utility::flag_wait( "all_enemies_killed_up_to_house_capture" );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    wait 5;
    thread maps\_utility::autosave_by_name( "house_briefing_sequence" );
    level._id_B8D7.voice = "taskforce";
    level._id_B8D7.countryid = "TF";
    thread _id_C2B4();
    thread _id_D5D3();
    level._id_B8D7 maps\_utility::disable_ai_color();
    _id_C2B8();
    common_scripts\utility::flag_set( "ozone_to_earlydefense_start" );
    var_0 = getnode( "ghost_cover_front", "targetname" );
    level._id_B8D7 setgoalnode( var_0 );
    level._id_B8D7 maps\_utility::clear_run_anim();
    maps\_utility::radio_dialogue( "est_ozn_onmyway" );
    wait 2;
    maps\_utility::radio_dialogue( "est_pri_searching" );
    maps\_utility::radio_dialogue( "est_pri_gettingcloser" );
    maps\_utility::radio_dialogue( "est_pri_goingsilent" );
    common_scripts\utility::flag_set( "house_briefing_dialogue_done" );
    thread _id_C4DC();
    wait 10;
    var_0 = getnode( "ghost_earlydefense_start", "targetname" );
    level._id_B8D7 setgoalnode( var_0 );
}

_id_C4C7()
{
    common_scripts\utility::flag_wait( "download_started" );

    if ( !common_scripts\utility::flag( "skip_house_defense_dialogue" ) )
    {
        wait 3;
        common_scripts\utility::flag_wait( "house_briefing_dialogue_done" );
        maps\_utility::radio_dialogue( "est_ozn_stockup" );
        common_scripts\utility::flag_wait( "photographs_done" );
        maps\_utility::radio_dialogue( "est_gst_withintel" );
        maps\_utility::radio_dialogue( "est_gst_weaponscache" );
        common_scripts\utility::flag_set( "scarecrow_to_earlydefense_start" );
    }

    common_scripts\utility::flag_set( "defense_battle_begins" );
    maps\_utility::autosave_by_name( "defense_started" );
    wait 1;
    level._id_B8D7.baseaccuracy = 1;
    level._id_B224.baseaccuracy = 1;
    level._id_B4A3.baseaccuracy = 1;
    level._id_B8D7.threatbias = -1000;
    level._id_B8D7.voice = "taskforce";
    level._id_B8D7.countryid = "TF";
    level._id_B4A3.voice = "taskforce";
    level._id_B4A3.countryid = "TF";
    level._id_B224.voice = "taskforce";
    level._id_B224.countryid = "TF";
    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::battlechatter_on( "axis" );
}

_id_C4DC()
{
    level endon( "download_started" );

    while ( !common_scripts\utility::flag( "download_started" ) )
    {
        wait 10;
        maps\_utility::radio_dialogue( "est_gst_filesoff" );
        wait 8;
        maps\_utility::radio_dialogue( "est_gst_startdownload" );
        wait 30;
    }
}

_id_BC4B()
{
    level endon( "stop_blur_cycler" );

    for (;;)
    {
        level.player _id_CBBC( 0.6, 2 );
        level.player _id_CBBC( 0.1, 0.8 );
        level.player _id_CBBC( 0.2, 1 );
        level.player _id_CBBC( 0.1, 0.7 );
        level.player _id_CBBC( 0.5, 1.1 );
    }
}

_id_CBBC( var_0, var_1 )
{
    level endon( "stop_blur_cycler" );
    self notify( "blurview_stop" );
    self endon( "blurview_stop" );
    self setblurforplayer( var_0, var_1 );
    wait 0.05;
    self setblurforplayer( 0, var_1 );
}

_id_D131( var_0 )
{
    wait 3.55;
    thread maps\_utility::radio_dialogue( "est_gst_hanginthere" );
}

_id_BDCB()
{
    wait 3;

    if ( level.eq_track[level.eq_main_track] == "" )
        _id_B417::deactivate_index( level.eq_main_track );
    else
        thread _id_B417::use_eq_settings( level.eq_track[level.eq_main_track], level.eq_main_track );

    if ( level.reverb_track == "" )
        _id_B417::deactivate_reverb();
    else
        thread _id_B417::use_reverb_settings( level.reverb_track );
}

_id_BA8B()
{
    var_0 = getentarray( "ending_attacker", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_C6FE );
    wait 1;
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
    {
        var_3.grenadeammo = 0;
        var_3.baseaccuracy = 0.2;
        var_3 maps\_utility::add_damage_function( ::_id_AC88 );
    }
}

_id_AC88( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isalive( self ) )
    {
        if ( var_1 == level.player )
        {
            level._id_B1F7++;

            if ( level.gameskill == 0 )
            {
                level.player.attackeraccuracy = 0;
                common_scripts\utility::flag_set( "drag_sequence_killcount_achieved" );
            }

            if ( level.gameskill == 1 )
            {
                level.player.attackeraccuracy = 0;
                common_scripts\utility::flag_set( "drag_sequence_killcount_achieved" );
            }

            if ( level.gameskill == 2 )
            {
                if ( level._id_B1F7 > 1 )
                {
                    level.player.attackeraccuracy = 0;
                    common_scripts\utility::flag_set( "drag_sequence_killcount_achieved" );
                }
            }

            if ( level.gameskill == 3 )
            {
                if ( level._id_B1F7 > 1 )
                {
                    level.player.attackeraccuracy = 0;
                    common_scripts\utility::flag_set( "drag_sequence_killcount_achieved" );
                }
            }
        }
    }
}

_id_C6FE()
{
    var_0 = self stalingradspawn();

    if ( isdefined( var_0 ) )
    {
        var_0 endon( "death" );
        wait 1;
        var_0.grenadeammo = 0;
        var_0.baseaccuracy = 0.2;
    }
}

_id_C52B()
{
    level.player.attackeraccuracy = 0;
    wait 5;
    level.player.attackeraccuracy = 0.15;
    wait 3;
    level.player.attackeraccuracy = 0.2;
}

_id_B681()
{
    level endon( "ending_normal_death" );
    level endon( "drag_sequence_killcount_achieved" );
    common_scripts\utility::flag_wait( "drag_sequence_slacker_check" );

    if ( !common_scripts\utility::flag( "drag_sequence_killcount_achieved" ) )
    {
        level notify( "ending_slacker_death" );
        level.player dodamage( 25 / level.player.damagemultiplier, level.player.origin );
        wait 1.5;
        level.player dodamage( 35 / level.player.damagemultiplier, level.player.origin );
        wait 0.5;
        level.player dodamage( 25 / level.player.damagemultiplier, level.player.origin );
        wait 2.5;
        level.player dodamage( 30 / level.player.damagemultiplier, level.player.origin );
        wait 0.15;
        level.player dodamage( 30 / level.player.damagemultiplier, level.player.origin );
        wait 0.25;
        level.player dodamage( 15 / level.player.damagemultiplier, level.player.origin );
        wait 0.2;
        level.player dodamage( 15 / level.player.damagemultiplier, level.player.origin );
        wait 3;
        level.player dodamage( 45 / level.player.damagemultiplier, level.player.origin );
        wait 0.15;
        level.player dodamage( 75 / level.player.damagemultiplier, level.player.origin );
        wait 0.15;
        level.player dodamage( 85 / level.player.damagemultiplier, level.player.origin );
        thread _id_B4A2();
    }
}

_id_B4A2()
{
    level.player takeallweapons();
    level.player.ignoreme = 1;
    level.player shellshock( "estate_bouncingbetty", 9 );
    setdvar( "ui_deadquote", &"ESTATE_FAKE_DEATH_QUOTE" );
    maps\_utility::missionfailedwrapper();
}

_id_B583()
{
    level endon( "stop_player_breathing" );

    for (;;)
    {
        level.player maps\_utility::play_sound_on_entity( "breathing_hurt" );
        wait(0.1 + randomfloat( 0.8 ));
    }
}

_id_CE1A()
{
    common_scripts\utility::flag_wait( "play_ending_sequence" );
    objective_position( 5, ( 0.0, 0.0, 0.0 ) );
    thread _id_D371();
    thread ending_drag_cinseq();
    var_0 = undefined;

    if ( common_scripts\utility::flag( "test_ending" ) )
        thread _id_D301::_id_AADA( "2" );

    if ( !common_scripts\utility::flag( "test_ending_body_toss" ) )
    {
        thread _id_B374();
        thread _id_B89D();
        thread maps\_utility::battlechatter_off( "allies" );
        thread maps\_utility::battlechatter_off( "axis" );
    }

    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "black", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 0;
    var_0.sort = 1;
    var_0.foreground = 1;
    var_0 maps\estate_code::blackout( 0.05, 6 );

    if ( !common_scripts\utility::flag( "test_ending_body_toss" ) )
    {
        soundscripts\_snd::snd_message( "aud_stop_escape_mix" );
        soundscripts\_snd::snd_message( "aud_start_finale_mix" );
        soundscripts\_snd::snd_message( "aud_start_escape_bs_0_3_mix" );
        level.player playsound( "scn_estate_escape_shellshock_01" );
        level.player freezecontrols( 1 );
        level.player allowprone( 0 );
        level.player allowcrouch( 0 );
        level.player allowstand( 1 );
        level.player shellshock( "estate_bouncingbetty", 11 );
        common_scripts\utility::flag_set( "begin_ending_music" );
        setsaveddvar( "compass", 0 );
        setsaveddvar( "hud_showStance", "0" );
        level.player setstance( "stand" );
        var_1 = common_scripts\utility::getstruct( "ghost_dragnode", "targetname" );
        var_2 = maps\_utility::spawn_anim_model( "worldbody" );
        var_2.angles = ( 0.0, 0.0, 0.0 );
        level.player disableweapons();
        level.player takeallweapons();

        if ( !common_scripts\utility::flag( "test_ending_body_toss" ) )
            level._id_B8D7.attackeraccuracy = 0;

        level.player.attackeraccuracy = 0;
        level.player.ignorerandombulletdamage = 1;
        thread dragged_by_ghost_cinseq();
        var_1 maps\_anim::anim_first_frame_solo( level._id_B8D7, "estate_ending_drag" );
        var_1 maps\_anim::anim_first_frame_solo( var_2, "estate_ending_drag" );
        level.player playerlinktodelta( var_2, "tag_player", 1, 30, 30, 30, 3 );
        level._id_B8D7 common_scripts\utility::hide_friendname_until_flag_or_notify( "begin_overlapped_gasoline_sequence" );
        var_1 maps\_anim::anim_first_frame_solo( level._id_B8D7, "estate_ending_drag" );
        var_3 = common_scripts\utility::spawn_tag_origin();
        var_3 linkto( var_2, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        level.player playersetgroundreferenceent( var_3 );
        wait 1;
        soundscripts\_snd::snd_message( "aud_stop_escape_bs_0_3_mix" );
        thread _id_BA8B();
        level.player giveweapon( "ak47_woodland_grenadier" );
        wait 2;
        thread _id_B583();
        level.player freezecontrols( 0 );
        level.player lerpviewangleclamp( 0, 0, 0, 3, 3, 5, 2 );
        level.player setviewangleresistance( 50, 50, 20, 20 );
        var_0 thread maps\estate_code::restorevision( 3, 0 );
        setomnvar( "ui_consciousness_init", 1 );
        setsaveddvar( "ui_consciousnessVignetteDarkness", 0.5 );
        setomnvar( "ui_consciousness_play", 1 );
        maps\_utility::autosave_by_name( "drag_started" );
        thread _id_C963();
        thread _id_C327();
        var_1 thread maps\_anim::anim_single_solo( var_2, "estate_ending_drag" );
        var_1 maps\_anim::anim_single_solo( level._id_B8D7, "estate_ending_drag" );
        level.player lerpviewangleclamp( 1, 1, 1, 30, 30, 30, 5 );
        level.player setviewangleresistance( 50, 50, 20, 20 );
        level.player enableweapons();
        level.player switchtoweapon( "ak47_woodland_grenadier" );
        level.player thread _id_C52B();

        if ( !common_scripts\utility::flag( "test_ending_body_toss" ) && !common_scripts\utility::flag( "test_ending" ) )
            level._id_B8D7 maps\_utility::stop_magic_bullet_shield();

        if ( !common_scripts\utility::flag( "test_ending_body_toss" ) )
            level._id_B8D7 delete();

        var_2 waittillmatch( "single anim", "mortarhit" );
        thread _id_C089( "ending_mortarhit_1" );
        var_2 waittillmatch( "single anim", "mortarhit" );
        thread _id_C089( "ending_mortarhit_2" );
        level notify( "stop_blur_cycler" );
        maps\_utility::delaythread( 2, ::_id_D131, var_0 );
        var_2 waittillmatch( "single anim", "mortarhit" );
        thread _id_C089( "ending_mortarhit_3" );
        level.player thread maps\_gameskill::grenade_dirt_on_screen( "left" );
        var_2 waittillmatch( "single anim", "mortarhit" );
        thread _id_C089( "ending_mortarhit_4" );
        var_2 waittillmatch( "single anim", "helicopterbuzz" );
        var_2 waittillmatch( "single anim", "gettingfuzzy" );
        common_scripts\utility::flag_set( "enter_the_littlebirds" );
        thread _id_D301::_id_C303( "2" );
        soundscripts\_snd::snd_message( "aud_start_escape_bs_2_2_mix" );
        var_0 maps\estate_code::blackout( 3, 12 );
        level.player common_scripts\utility::delaycall( 3, ::takeallweapons );
        level.player freezecontrols( 1 );
        level.player disableoffhandweapons();
        setsaveddvar( "cg_drawCrosshair", 0 );
        setsaveddvar( "ui_hidemap", 1 );
        setsaveddvar( "compass", "0" );
        setsaveddvar( "ammoCounterHide", "1" );
        setsaveddvar( "actionSlotsHide", "1" );
        var_4 = getaiarray( "axis" );

        foreach ( var_6 in var_4 )
        {
            _id_B190::_id_D55F( var_6 );
            var_6 kill();
        }

        wait 1;
        soundscripts\_snd::snd_message( "aud_stop_escape_bs_2_2_mix" );
    }

    common_scripts\utility::array_thread( getentarray( "ending_actors", "targetname" ), maps\_utility::add_spawn_function, ::_id_ACD9 );
    maps\_utility::activate_trigger( "ending_actors", "target" );
    wait 0.1;
    thread meeting_shepherd_cinseq();
    var_8 = undefined;
    var_9 = undefined;
    var_1 = common_scripts\utility::getstruct( "ending_chopper_node", "targetname" );
    var_10 = [];

    foreach ( var_12 in level._id_BF27 )
    {
        if ( var_12.script_noteworthy == "gasolineGuy" )
        {
            var_8 = var_12;
            var_8 hide();
            var_8.cheat._id_BDF2 = 1;
            var_8.cheat.ignorewolfthink = 1;
            continue;
        }

        if ( !common_scripts\utility::flag( "test_alt_ending" ) && var_12.script_noteworthy == "alt_ending_dead_guy" )
            continue;
        else
        {
            if ( common_scripts\utility::flag( "test_alt_ending" ) && var_12.script_noteworthy == "alt_ending_dead_guy" )
            {
                var_12.script_noteworthy = "ghost_ending_dead";
                var_12.animname = "ghost_ending_dead";
                var_9 = var_12;
                var_9 hide();
                continue;
            }

            if ( common_scripts\utility::flag( "test_alt_ending" ) && var_12.script_noteworthy == "ghost_ending_dead" )
                continue;
            else
            {
                if ( !common_scripts\utility::flag( "test_alt_ending" ) && var_12.script_noteworthy == "ghost_ending_dead" )
                {
                    var_9 = var_12;
                    var_9 hide();
                    continue;
                }

                if ( !common_scripts\utility::flag( "test_alt_ending" ) && var_12.script_noteworthy == "alt_ending_guy" )
                    continue;
                else
                {
                    if ( common_scripts\utility::flag( "test_alt_ending" ) && var_12.script_noteworthy == "alt_ending_guy" )
                    {
                        var_12.script_noteworthy = "ghost_ending";
                        var_12.animname = "ghost_ending";
                        var_10[var_10.size] = var_12;
                        continue;
                    }

                    if ( common_scripts\utility::flag( "test_alt_ending" ) && var_12.script_noteworthy == "ghost_ending" )
                        continue;
                    else
                        var_10[var_10.size] = var_12;
                }
            }
        }
    }

    if ( common_scripts\utility::flag( "test_with_pavelow_already_in_place" ) || common_scripts\utility::flag( "test_ending_body_toss" ) )
    {
        var_14 = maps\_vehicle::spawn_vehicle_from_targetname( "final_pavelow_liftoff_1" );
        var_14.animname = "pavelow";
        level._id_BD32 = var_14;
    }
    else
    {
        level._id_BD32 delete();
        var_14 = maps\_vehicle::spawn_vehicle_from_targetname( "animated_pavelow" );
        var_14.animname = "pavelow";
        level._id_BD32 = var_14;
    }

    level._id_BD32 maps\_vehicle::vehicle_lights_on( "sheppard" );
    level.player takeallweapons();
    level.player disableweapons( 1 );
    var_2 = maps\_utility::spawn_anim_model( "worldbody" );
    var_1 maps\_anim::anim_first_frame_solo( var_2, "estate_ending_part1" );
    level.player playerlinktodelta( var_2, "tag_player", 1, 10, 10, 10, 2 );
    var_1 maps\_anim::anim_first_frame_solo( var_14, "estate_ending_part1" );
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3 linkto( var_2, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( var_3 );
    var_15 = level._id_BF27["ghost_ending"];
    var_15 common_scripts\utility::hide_friendname_until_flag_or_notify( "begin_overlapped_gasoline_sequence" );
    var_16 = level._id_BF27["shepherd_ending"];
    var_16 maps\_utility::gun_remove();

    if ( !common_scripts\utility::flag( "test_ending_body_toss" ) )
    {
        wait 2;
        var_0 maps\_utility::delaythread( 0.5, maps\estate_code::restorevision, 3, 0 );
        setomnvar( "ui_consciousness_play", 0 );
        setomnvar( "ui_consciousness_play", 3 );
        level.player common_scripts\utility::delaycall( 0.5, ::freezecontrols, 0 );
        level.player lerpviewangleclamp( 1, 1, 1, 3, 3, 3, 3 );
        common_scripts\utility::flag_set( "made_it_to_lz" );
        var_14 thread maps\_utility::play_sound_on_entity( "scn_estate_finale_heli_landing_01" );
        level.player playsound( "scn_estate_finale_foley_plr_01" );
        var_1 thread maps\_anim::anim_single( var_10, "estate_ending_part1" );
        var_1 thread maps\_anim::anim_single_solo( var_2, "estate_ending_part1" );
        var_14 setanim( level.scr_anim["pavelow"]["estate_ending_part1"] );
        thread _id_BDCB();
        level.player lerpviewangleclamp( 7, 1, 1, 30, 30, 30, 15 );
        level.player setviewangleresistance( 50, 50, 20, 20 );
        level._id_B174 = gettime();
        thread _id_B0AF( 0.12, 20, 14 );
        level._id_BF27["guy1_ending"] hide();
        level._id_BF27["guy2_ending"] hide();
        level._id_BF27["guy1_ending"].cheat._id_BDF2 = 1;
        level._id_BF27["guy1_ending"].cheat.ignorewolfthink = 1;
        level._id_BF27["guy2_ending"].cheat._id_BDF2 = 1;
        level._id_BF27["guy2_ending"].cheat.ignorewolfthink = 1;
        thread _id_D1E7( var_16, var_15 );
        var_16 maps\_utility::waittill_notetrack_or_damage( "pistol_pullout" );
        var_17 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        var_17 linkto( var_16, "tag_weapon_right", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        var_16 attach( "weapon_colt_anaconda_animated", "tag_weapon_right" );
        var_16 thread maps\estate_anim::play_shepherd_ending_gun_anim();
        level.player lerpviewangleclamp( 1, 0.5, 0.5, 0, 0, 0, 0 );
        level.player setviewangleresistance( 50, 50, 20, 20 );
        level._id_BF27["guy1_ending"] show();
        level._id_BF27["guy2_ending"] show();
        var_16 maps\_utility::waittill_notetrack_or_damage( "shepherd_fire2" );
        var_17 playsound( "scn_estate_deserteagle_fire_shepherd" );
        playfxontag( common_scripts\utility::getfx( "anaconda_muzzle_flash" ), var_16, "tag_flash" );
        setomnvar( "ui_consciousness_play", 0 );
        setomnvar( "ui_consciousness_play", 4 );
        level.player playrumblelooponentity( "shepherd_pistol" );
        level.player common_scripts\utility::delaycall( 1.3, ::playrumblelooponentity, "shot_collapse" );
        level.dosoftpulseoverlay = 1;
        level.player setnormalhealth( 1 );
        var_18 = var_16 geteye();
        level.player dodamage( 99 / level.player.damagemultiplier, var_18 );
        level.player maps\_utility::delaythread( 0.3, ::_id_B99F );
        level notify( "stop_player_breathing" );
        setsaveddvar( "g_friendlyNameDist", 0 );

        if ( common_scripts\utility::flag( "no_slow_mo" ) )
            maps\_utility::delaythread( 1.5, ::_id_D29C, 3 );

        var_16 maps\_utility::waittill_notetrack_or_damage( "shepherd_fire1" );
        var_17 playsound( "h2_wpn_desert_eagle_npc_close" );
        playfxontag( common_scripts\utility::getfx( "anaconda_muzzle_flash" ), var_16, "tag_flash" );
        var_16 maps\_utility::waittill_notetrack_or_damage( "pistol_putaway" );
        var_17 delete();
        var_16 detach( "weapon_colt_anaconda_animated", "tag_weapon_right" );
        level.player common_scripts\utility::delaycall( 0.8, ::playrumblelooponentity, "dsm_rummage" );
        var_16 maps\_utility::waittill_notetrack_or_damage( "dsm_pullout" );
        var_19 = maps\_utility::spawn_anim_model( "dsm" );
        var_19 linkto( var_16, "tag_inhand", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        var_19 setanim( var_19 maps\_utility::getanim( "estate_ending_part1" ) );
        var_16 thread delete_dsm( var_19 );
        var_16 maps\_utility::waittill_notetrack_or_damage( "trigger_part2" );
        level.player playsound( "scn_estate_finale_betrayal_screen_fadeout_01" );
        level.dosoftpulseoverlay = 0;
        var_0 thread maps\estate_code::blackout( 7, 6 );
        wait 8;
    }

    var_20 = level._id_BF27["guy1_ending"];
    var_21 = level._id_BF27["guy2_ending"];
    var_1 = common_scripts\utility::getstruct( "ending_chopper_node2", "targetname" );
    var_10 = [];
    var_10[var_10.size] = var_20;
    var_10[var_10.size] = var_21;
    common_scripts\utility::array_thread( level._id_BF27, maps\_utility::gun_remove );
    thread thrown_and_burned_cinseq();
    var_1 maps\_anim::anim_first_frame_solo( var_2, "estate_ending_part2" );
    level.player playerlinktodelta( var_2, "tag_player", 1, 10, 10, 5, 5 );
    var_0 thread maps\estate_code::restorevision( 3, 0 );
    setomnvar( "ui_consciousness_play", 0 );
    setomnvar( "ui_consciousness_play", 5 );
    level.player lerpviewangleclamp( 1, 1, 1, 0, 0, 0, 0 );
    thread _id_C744( var_8, var_16, var_0 );
    var_1 thread maps\_anim::anim_single_solo( var_2, "estate_ending_part2" );
    var_1 thread maps\_anim::anim_single( var_10, "estate_ending_part2" );
    wait 1;
    common_scripts\utility::flag_set( "begin_overlapped_gasoline_sequence" );
    level.player playsound( "scn_estate_finale_throw_plr_01" );
    wait 1.8;
    level.player playrumblelooponentity( "bodytoss_impact" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_estate_betrayal_drop_plr_01" );
    wait 1.3;
    level._id_BF27["ghost_ending"] hide();
    var_9 show();
    var_10[var_10.size] = var_9;
    var_1 maps\_anim::anim_first_frame( var_10, "estate_ending_part2_2ndbody" );
    var_1 thread maps\_anim::anim_single( var_10, "estate_ending_part2_2ndbody" );
    var_20 maps\_utility::waittill_notetrack_or_damage( "ghost_throw_release" );

    if ( !common_scripts\utility::flag( "no_slow_mo" ) )
        thread _id_D29C( 10.5 );

    thread _id_B0AF( 0.05, 2, 1, 0.1 );
    wait 2.2;
    var_0 thread maps\estate_code::blackout( 0.8, 3 );
    thread _id_B0AF( 0.12, 2, 1, 0.1 );
    wait 0.8;
    var_20 hide();
    var_21 hide();
    var_8 show();
    var_16 show();
    var_8 showallparts();
    var_16 thread maps\_utility::play_sound_on_entity( "scn_estate_shepherd_light_fire_foley_01" );
    var_8 thread maps\_utility::play_sound_on_entity( "scn_estate_soldier_gas_01" );
    var_0 thread maps\estate_code::restorevision( 5, 0 );
    setomnvar( "ui_consciousness_play", 0 );
    setomnvar( "ui_consciousness_play", 6 );
    wait 3;
}

dragged_by_ghost_cinseq()
{
    var_0 = _id_D397::_id_A97A( "dragged_by_ghost" );
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 2.8, 150, 32, 32 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 8.5 ) _id_D397::_id_C491( 2.0, 80, 4, 4 );
    var_0 _id_D397::_id_BEA0( 12.5 ) _id_D397::_id_C491( 2.0, 300, 4, 4 );
    var_0 _id_D397::_id_BEA0( 16.5 ) _id_D397::_id_C491( 2.0, 80, 4, 4 );
    var_0 _id_D397::_id_BEA0( 18.5 ) _id_D397::_id_C491( 2.0, 300, 4, 4 );
    var_0 _id_D397::_id_BEA0( 20.5 ) _id_D397::_id_C491( 2.0, 80, 4, 4 );
    var_0 _id_D397::_id_BEA0( 22.5 ) _id_D397::_id_C491( 2.0, 300, 4, 4 );
    var_0 _id_D397::_id_BEA0( 24.5 ) _id_D397::_id_C491( 2.0, 80, 4, 4 );
    var_0 _id_D397::_id_BEA0( 26.5 ) _id_D397::_id_C491( 2.0, 300, 4, 4 );
    var_0 _id_D397::_id_BEA0( 29.8 ) _id_D397::_id_BF3F() _id_D397::_id_B687();
    var_0 _id_D397::_id_BEA0( 19.8 ) _id_D397::_id_A970( ::h2_dragged_blink, undefined, 0.2, 2.4, 1.5 );
    var_0 _id_D397::_id_BEA0( 22.2 ) _id_D397::_id_A970( ::h2_dragged_blink, undefined, 0.35, 3.8, 2.5 );
    var_0 _id_D397::_id_BC26();
}

h2_dragged_blink( var_0, var_1, var_2 )
{
    var_3 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_3 fadeovertime( 0.45 * var_1 );
    var_3.alpha = var_0;
    setblur( var_2, 0.45 * var_1 );
    wait(0.55 * var_1);
    var_3 fadeovertime( 0.45 * var_1 );
    var_3.alpha = 0.0;
    setblur( 0.0, 0.45 * var_1 );
    wait(0.45 * var_1);
    var_3 destroy();
}

delete_dsm( var_0 )
{
    maps\_utility::waittill_notetrack_or_damage( "dsm_putaway" );
    var_0 delete();
}

_id_B99F()
{
    self setnormalhealth( 1 );
}

_id_B386()
{
    level endon( "finish_line" );
    common_scripts\utility::flag_wait( "point_of_no_return" );
    level._id_BD32 = maps\_vehicle::spawn_vehicle_from_targetname( "final_pavelow_liftoff_1" );
    level._id_BD32.animname = "pavelow";
    level._id_BD32 vehicle_setspeed( 15 );
    var_0 = common_scripts\utility::getstruct( level._id_BD32.target, "targetname" );
    level._id_BD32 setvehgoalpos( var_0.origin, 0 );
    level._id_BD32 common_scripts\utility::waittill_any( "goal", "near_goal" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    level._id_BD32 setvehgoalpos( var_1.origin, 0 );
    level._id_BD32 common_scripts\utility::waittill_any( "goal", "near_goal" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    level._id_BD32 setvehgoalpos( var_2.origin, 1 );
    level._id_BD32 common_scripts\utility::waittill_any( "goal", "near_goal" );

    if ( !common_scripts\utility::flag( "finish_line" ) )
        thread maps\estate_code::_id_AF72();
}

_id_B374()
{
    common_scripts\utility::flag_wait( "thunderone_heli" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "ending_treecutter_heli_1" );
    var_0 maps\_vehicle::godon();
    var_0 thread maps\_utility::play_sound_on_entity( "scn_estate_finale_heli_flyby" );
    var_0 vehicle_setspeed( 12 );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 setvehgoalpos( var_1.origin, 0 );
    var_0 settargetyaw( 195 );
    var_0 waittill( "goal" );
    var_0 vehicle_setspeed( 8 );
    wait 0.6;
    var_0 settargetyaw( 210 );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_0 setvehgoalpos( var_2.origin, 1 );
    var_0 common_scripts\utility::waittill_any( "goal", "near_goal" );
    wait 1;
    var_3 = common_scripts\utility::getstruct( var_2.target, "targetname" );
    var_0 setvehgoalpos( var_3.origin, 0 );
    wait 0.5;
    var_0 settargetyaw( 190 );
    var_0 common_scripts\utility::waittill_any( "goal", "near_goal" );
    wait 2;
    var_4 = common_scripts\utility::getstruct( var_3.target, "targetname" );
    var_0 setvehgoalpos( var_4.origin );
    var_0 vehicle_setspeed( 50 );
    var_0 cleartargetyaw();
    wait 1;
    var_0 maps\_vehicle::godoff();
    var_0 delete();
}

_id_D371()
{
    level._id_B77F = spawn( "script_origin", ( 0.25, 0.0, 0.0 ) );

    for (;;)
    {
        setsaveddvar( "sm_sunSampleSizeNear", level._id_B77F.origin[0] );
        wait 0.05;
    }
}

_id_B0AF( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.25;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    level._id_B77F moveto( ( var_0, 0, 0 ), var_1, var_2, var_3 );
}

_id_B89D()
{
    common_scripts\utility::flag_wait( "enter_the_littlebirds" );
    var_0 = maps\_utility::delaythread( 1, maps\_vehicle::spawn_vehicle_from_targetname_and_drive, "ending_shadowops_heli_1" );
    var_1 = maps\_utility::delaythread( 4, maps\_vehicle::spawn_vehicle_from_targetname_and_drive, "ending_shadowops_heli_2" );
    var_2 = maps\_utility::delaythread( 4, maps\_vehicle::spawn_vehicle_from_targetname_and_drive, "ending_shadowops_heli_3" );
    var_3 = maps\_utility::delaythread( 2.5, maps\_vehicle::spawn_vehicle_from_targetname_and_drive, "ending_shadowops_heli_4" );
    var_4 = getent( "ending_shouter_trig", "targetname" );
    var_4 waittill( "trigger" );
    var_5 = getentarray( "ending_shouter", "targetname" );
    common_scripts\utility::array_randomize( var_5 );
    var_6 = ( 9612.3, 4611.8, -683.5 );
    maps\_utility::delaythread( 1.5, common_scripts\utility::play_sound_in_space, "scn_estate_finale_soldiers_walla", var_6 );

    foreach ( var_9, var_8 in var_5 )
    {
        if ( var_9 > 2 )
            break;

        if ( var_9 == 0 )
            var_8 maps\_utility::play_sound_on_entity( "est_tf2_coverthem" );

        if ( var_9 == 1 )
            var_8 maps\_utility::play_sound_on_entity( "est_tf2_spreadout" );

        if ( var_9 == 2 )
            var_8 maps\_utility::play_sound_on_entity( "est_tf1_gogogo" );

        if ( var_9 == 3 )
            var_8 maps\_utility::play_sound_on_entity( "est_tf3_straferidgeline" );

        if ( var_9 == 4 )
            var_8 maps\_utility::play_sound_on_entity( "est_tf4_rogerthat" );

        if ( var_9 == 5 )
            var_8 maps\_utility::play_sound_on_entity( "est_tf1_goldeagle" );
    }
}

_id_D1E7( var_0, var_1 )
{
    wait 6.5;
    thread maps\_utility::radio_dialogue( "est_hp2_watchforsnipers" );
    wait 10.5;
    wait 2.05;
    wait 1.5;
    wait 12;
    maps\_utility::radio_dialogue( "est_hp2_sanitized" );
    maps\_utility::radio_dialogue( "est_hp1_holdingpattern" );
}

_id_C963()
{
    var_0 = common_scripts\utility::getstruct( "redsmoke", "targetname" );
    playfx( common_scripts\utility::getfx( "redsmoke" ), var_0.origin );
    maps\_utility::radio_dialogue( "est_gst_gotyouroach" );
    maps\_utility::radio_dialogue( "est_gst_redsmoke" );
    maps\_utility::radio_dialogue( "est_fp1_visual" );
    common_scripts\utility::flag_set( "drag_sequence_slacker_check" );
    maps\_utility::radio_dialogue( "est_gst_clearedhot" );
    maps\_utility::radio_dialogue( "est_fp1_clearedhot" );
    common_scripts\utility::flag_set( "thunderone_heli" );
    maps\_utility::radio_dialogue( "est_hp1_gunsgunsguns" );
    wait 9;
    maps\_utility::radio_dialogue( "est_hp1_rocketattck" );
    maps\_utility::radio_dialogue( "est_hp2_hitemhard" );
    maps\_utility::radio_dialogue( "est_hp1_imonit" );
    maps\_utility::radio_dialogue( "est_hp1_linedup" );
}

_id_C327()
{
    thread _id_C089( "ending_mortarhit_a" );
    wait 1;
    thread _id_C089( "ending_mortarhit_b" );
    wait 0.75;
    thread _id_C089( "ending_mortarhit_c" );
    level.player thread maps\_gameskill::grenade_dirt_on_screen( "right" );
    wait 0.6;
    thread _id_C089( "ending_mortarhit_d" );
    wait 1;
    thread _id_C089( "ending_mortarhit_e" );
    wait 0.5;
    thread _id_C089( "ending_mortarhit_f" );
    wait 0.25;
    thread _id_C089( "ending_mortarhit_g" );
    wait 0.6;
    thread _id_C089( "ending_mortarhit_h" );
    level.player thread maps\_gameskill::grenade_dirt_on_screen( "left" );
    wait 0.45;
    thread _id_C089( "ending_mortarhit_i" );
}

_id_C089( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_1 common_scripts\utility::play_sound_in_space( level.scr_sound["mortar"]["incomming"] );
    earthquake( 0.5, 1.4, level.player.origin, 2000 );
    playrumbleonposition( "artillery_rumble", var_1.origin );
    var_1 thread common_scripts\utility::play_sound_in_space( level.scr_sound["mortar"]["dirt"] );
    playfx( level._effect["mortar"]["dirt"], var_1.origin );
}

_id_D4EE()
{
    if ( !common_scripts\utility::flag( "no_slow_mo" ) )
    {
        musicstop( 6 );
        wait 7;
        musicplay( "mus_estate_betrayal" );
    }
    else
    {
        musicstop( 1 );
        wait 1.5;
        musicplay( "mus_estate_betrayal" );
    }
}

_id_C744( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait( "begin_overlapped_gasoline_sequence" );
    level._id_BD32 delete();
    thread _id_C8A9();
    var_3 = common_scripts\utility::getstruct( "ending_chopper_node2", "targetname" );
    var_4 = maps\_utility::spawn_anim_model( "cigar" );
    var_1.cigar = var_4;
    var_0 attach( "accessories_gas_canister_highrez", "tag_inhand" );
    var_5 = [];
    var_5[var_5.size] = var_0;
    var_5[var_5.size] = var_1;
    var_5[var_5.size] = var_4;
    var_1 thread _id_AFD6();
    var_3 thread maps\_anim::anim_single( var_5, "estate_ending_part3" );
    var_0 thread maps\estate_anim::play_cannister_guy_cannister_anim();
    common_scripts\utility::flag_wait( "cigar_flicked" );
    wait 0.15;
    common_scripts\utility::flag_set( "cigar_flareup" );
    var_6 = maps\_vehicle::spawn_vehicles_from_targetname( "final_pavelow_liftoff_2" );
    var_7 = getent( "final_pavelow_flyover", "targetname" );
    var_6[0] thread maps\_vehicle_code::_id_A894( var_7 );
    wait 0.1;
    soundscripts\_snd::snd_message( "aud_start_slowmo_burning_mix" );

    if ( !common_scripts\utility::flag( "no_slow_mo" ) )
        thread _id_D29C( 140, 0.1 );

    wait 0.6;
    level.player playsound( "scn_estate_betrayal_slomo_01" );
    playfx( common_scripts\utility::getfx( "gasoline_fire_on_player_ignite" ), level.player.origin + ( -6.0, 56.0, 54.0 ) );
    playfx( common_scripts\utility::getfx( "gasoline_fire_on_player" ), level.player.origin + ( -6.0, 56.0, 54.0 ) );
    wait 0.1;
    setblur( 2, 3 );
    wait 1.2;
    level.player playsound( "scn_estate_betrayal_heli_slomo_01" );
    wait 0.5;
    wait 1;
    var_2 thread maps\estate_code::blackout( 2, 6 );
    wait 2;
    common_scripts\utility::flag_set( "end_the_mission" );
}

_id_C2A7( var_0 )
{
    self setyawspeedbyname( var_0 );

    if ( var_0 == "faster" )
        self setmaxpitchroll( 25, 50 );
}

_id_C8A9()
{
    wait 2;
    level.player lerpviewangleclamp( 1, 1, 1, 0, 0, 0, 0 );
    level.player setviewangleresistance( 50, 50, 20, 20 );
    wait 5;
    maps\_utility::radio_dialogue( "est_pri_underattack" );
}

_id_AFD6()
{
    maps\_utility::waittill_notetrack_or_damage( "cigar_box_pullout" );
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "prop_cigarette_pack" );
    var_0 linkto( self, "tag_inhand", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    wait 0.25;
    var_1 = self.cigar;
    maps\_utility::waittill_notetrack_or_damage( "lighter_pullout" );
    var_0 delete();
    maps\_utility::waittill_notetrack_or_damage( "lighter_on" );
    playfxontag( common_scripts\utility::getfx( "cigar_glow_puff" ), var_1, "tag_cigarglow" );
    wait 1;
    playfxontag( common_scripts\utility::getfx( "cigar_smoke_puff" ), self, "tag_eye" );
    maps\_utility::waittill_notetrack_or_damage( "shepherd_exhale" );
    playfxontag( common_scripts\utility::getfx( "cigar_exhale_estate" ), self, "tag_eye" );
    maps\_utility::waittill_notetrack_or_damage( "shepherd_exhale" );
    playfxontag( common_scripts\utility::getfx( "cigar_glow_puff" ), var_1, "tag_cigarglow" );
    wait 1;
    playfxontag( common_scripts\utility::getfx( "cigar_smoke_puff" ), self, "tag_eye" );
    maps\_utility::waittill_notetrack_or_damage( "shepherd_exhale" );
    playfxontag( common_scripts\utility::getfx( "cigar_exhale_estate" ), self, "tag_eye" );
    maps\_utility::waittill_notetrack_or_damage( "shepher_flick" );
    common_scripts\utility::flag_set( "cigar_flicked" );
    playfxontag( common_scripts\utility::getfx( "cigar_glow" ), var_1, "tag_cigarglow" );
    common_scripts\utility::flag_wait( "cigar_flareup" );
}

_id_D29C( var_0, var_1 )
{
    var_2 = 0.1;
    var_3 = 1;
    var_4 = 0.1;
    var_5 = 0.31;

    if ( isdefined( var_1 ) )
        var_6 = var_1;

    var_7 = var_0;
    maps\_utility::slowmo_start();
    maps\_utility::slowmo_setspeed_slow( var_5 );
    maps\_utility::slowmo_setlerptime_in( var_2 );
    maps\_utility::slowmo_lerp_in();
    level.player setmovespeedscale( var_4 );
    wait(var_7 * var_5);
    maps\_utility::slowmo_setlerptime_out( var_3 );
    maps\_utility::slowmo_lerp_out();
    maps\_utility::slowmo_end();
    level.player setmovespeedscale( 1.0 );
}

_id_ACD9()
{
    self.cheat._id_BDF2 = 1;
    self.cheat.ignorewolfthink = 1;

    if ( !isdefined( level._id_BF27 ) )
        level._id_BF27 = [];

    self.animname = self.script_noteworthy;
    self.team = "allies";
    level._id_BF27[self.script_noteworthy] = self;

    if ( !issubstr( self.script_noteworthy, "ghost_ending" ) && !issubstr( self.script_noteworthy, "shepherd_ending" ) )
        thread _id_C0C3::addspecialmonitors();

    thread maps\_utility::magic_bullet_shield();
}

_id_D1FF()
{
    common_scripts\utility::flag_wait( "end_the_mission" );
    wait 1.9;
    maps\_utility::nextmission();
}

remove_objective_ghost()
{
    common_scripts\utility::flag_clear( "player_close" );
    common_scripts\utility::flag_wait( "player_close" );
    objective_position( 3, ( 0.0, 0.0, 0.0 ) );
}

ending_drag_cinseq()
{

}

meeting_shepherd_cinseq()
{
    var_0 = _id_D397::_id_A97A( "meeting_shepherd" );
    var_1 = level._id_BF27["shepherd_ending"];
    var_1 hidepart( "J_Holster_gun" );
    thread hiding_shepherd_name();
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 24, 250, 32, 32 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 3.5 ) _id_D397::_id_C491( 2.8, -1, 4, 4 ) _id_D397::_id_CCA7( level._id_BF27["ghost_ending"], "tag_eye" ) _id_D397::_id_ADE6( -1.0 ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 7.0 ) _id_D397::_id_C491( 2.8, -1, 4, 4 ) _id_D397::_id_CCA7( var_1, "tag_eye" ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 22.5 ) _id_D397::_id_C491( 5.6, -1, 4, 4 ) _id_D397::_id_CCA7( var_1, "tag_eye" ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 25.0 ) _id_D397::_id_C491( 5.6, -1, 6, 6 ) _id_D397::_id_CCA7( var_1, "tag_eye" ) _id_D397::_id_ADE6( -1.0 ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 26.5 ) _id_D397::_id_C491( 5.6, -1, 4, 4 ) _id_D397::_id_CCA7( var_1, "tag_eye" ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 31.5 ) _id_D397::_id_C491( 5.6, -1, 6, 6 ) _id_D397::_id_CCA7( var_1, "tag_eye" ) _id_D397::_id_ADE6( -1.0 ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 34.0 ) _id_D397::_id_C491( 5.6, -1, 6, 6 ) _id_D397::_id_CCA7( var_1, "tag_eye" ) _id_D397::_id_ADE6( -2.0 ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 34.5 ) _id_D397::_id_C491( 5.6, -1, 6, 6 ) _id_D397::_id_CCA7( var_1, "tag_eye" ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 39.5 ) _id_D397::_id_C491( 5.6, -1, 6, 6 ) _id_D397::_id_CCA7( level._id_BF27["guy2_ending"], "tag_eye" ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 42.5 ) _id_D397::_id_C491( 5.6, 500, 6, 6 );
    var_0 _id_D397::_id_BEA0( 43.85 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 24.75 ) _id_D397::_id_AC9F( 53, 0.05, 0 );
    var_0 _id_D397::_id_BEA0( 26.85 ) _id_D397::_id_A9EC( 4.5, 0 );
    var_0 _id_D397::_id_BEA0( 26.35 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 30.0 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 24.75 ) _id_D397::_id_A970( ::meet_shepherd_whiteflash, level.player, 0.5 );
    var_0 _id_D397::_id_BEA0( 3.9 ) _id_D397::_id_B85E( 0.12, 0.5, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 5.1 ) _id_D397::_id_B85E( 0.12, 0.4, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 7.25 ) _id_D397::_id_B85E( 0.14, 0.8, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 22.5 ) _id_D397::_id_B85E( 0.14, 0.75, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 24.75 ) _id_D397::_id_B85E( 0.35, 1.0, level.player, 1000 );
    var_0 _id_D397::_id_BEA0( 25.5 ) _id_D397::_id_B85E( 0.12, 0.5, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 25.75 ) _id_D397::_id_B85E( 0.12, 0.5, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BEA0( 26.4 ) _id_D397::_id_B85E( 0.1, 0.3, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 27.2 ) _id_D397::_id_B85E( 0.1, 0.4, level.player, 1000 );
    var_0 _id_D397::_id_BEA0( 27.4 ) _id_D397::_id_B85E( 0.1, 0.5, level.player, 1000 );
    var_0 _id_D397::_id_BEA0( 30.25 ) _id_D397::_id_B85E( 0.12, 0.5, level.player, 1000 );
    var_0 _id_D397::_id_BEA0( 30.65 ) _id_D397::_id_B85E( 0.1, 0.7, level.player, 1000 );
    var_0 _id_D397::_id_BEA0( 32.1 ) _id_D397::_id_B85E( 0.12, 0.4, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 32.8 ) _id_D397::_id_B85E( 0.1, 0.2, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 33.85 ) _id_D397::_id_B85E( 0.12, 1.0, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BEA0( 39.85 ) _id_D397::_id_B85E( 0.1, 0.3, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 40.3 ) _id_D397::_id_B85E( 0.1, 0.3, level.player, 1000 );
    var_0 _id_D397::_id_BEA0( 40.8 ) _id_D397::_id_B85E( 0.12, 0.5, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BC26();
}

meet_shepherd_whiteflash( var_0 )
{
    var_1 = maps\_hud_util::create_client_overlay( "white", 1 );
    var_1 thread maps\_hud_util::fade_over_time( 0, var_0 );
}

thrown_and_burned_cinseq()
{
    var_0 = _id_D397::_id_A97A( "thrown_and_burned" );
    var_1 = level._id_BF27["shepherd_ending"];

    if ( maps\_utility::hastag( var_1.model, "J_Holster_gun" ) )
        var_1 showpart( "J_Holster_gun" );

    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 2.8, -1, 8, 8 ) _id_D397::_id_CCA7( level._id_BF27["guy2_ending"], "tag_eye" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 3.0 ) _id_D397::_id_C491( 5.6, 10, 6, 6 );
    var_0 _id_D397::_id_BEA0( 4.2 ) _id_D397::_id_C491( 5.6, 300, 6, 6 );
    var_0 _id_D397::_id_BEA0( 5.75 ) _id_D397::_id_C491( 2.8, -1, 6, 6 ) _id_D397::_id_CCA7( level._id_BF27["ghost_ending_dead"], "tag_eye" ) _id_D397::_id_ADE6( 0.5 ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 12.2 ) _id_D397::_id_C491( 3.5, -1, 6, 6 ) _id_D397::_id_CCA7( level._id_BF27["gasolineGuy"], "tag_eye" ) _id_D397::_id_AE01( 1 );
    var_0 _id_D397::_id_BEA0( 21.0 ) _id_D397::_id_C491( 3.5, -1, 4, 4 ) _id_D397::_id_CCA7( level._id_BF27["shepherd_ending"], "tag_eye" ) _id_D397::_id_AE01( 2 );
    var_0 _id_D397::_id_BEA0( 49.0 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 4.85 ) _id_D397::_id_AC9F( 48, 0.75, 0 );
    var_0 _id_D397::_id_BEA0( 6.0 ) _id_D397::_id_A9EC( 3.35, 0 );
    var_0 _id_D397::_id_BEA0( 9.35 ) _id_D397::_id_AC9F( 57, 0.05, 0 );
    var_0 _id_D397::_id_BEA0( 10.0 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 2.5, 0.7, 1.5, 0, 0, 4, -4 );
    var_0 _id_D397::_id_BEA0( 18.3 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 4.5, 2.0, 2.0, 0, 0, 1, -1 );
    var_0 _id_D397::_id_BEA0( 20.2 ) _id_D397::_id_A9EC( 5.15, 0 );
    var_0 _id_D397::_id_BEA0( 26.85 ) _id_D397::_id_A970( ::lerpviewangleclamp, level.player, 3.5, 2.0, 1.0, 0, 0, 0, 0 );
    var_0 _id_D397::_id_BEA0( 2.65 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 9.5 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 25.8 ) _id_D397::_id_BAE4( 2 );
    var_0 _id_D397::_id_BEA0( 26.7 ) _id_D397::_id_BAE4( 0 );
    var_0 _id_D397::_id_BEA0( 2.0 ) _id_D397::_id_B85E( 0.1, 0.4, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 2.65 ) _id_D397::_id_B85E( 0.12, 0.85, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 4.5 ) _id_D397::_id_B85E( 0.1, 0.5, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 6.75 ) _id_D397::_id_B85E( 0.1, 0.4, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 8.45 ) _id_D397::_id_B85E( 0.08, 0.3, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 13.35 ) _id_D397::_id_B85E( 0.05, 0.45, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 14.15 ) _id_D397::_id_B85E( 0.05, 0.45, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 16.6 ) _id_D397::_id_B85E( 0.05, 0.45, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 17.65 ) _id_D397::_id_B85E( 0.05, 0.45, level.player, 1000 );
    var_0 _id_D397::_id_BEA0( 18.3 ) _id_D397::_id_B85E( 0.05, 0.45, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 27.25 ) _id_D397::_id_B85E( 0.12, 1.0, level.player, 1000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
    var_0 _id_D397::_id_BC26();
}

hiding_shepherd_name()
{
    var_0 = level._id_BF27["shepherd_ending"];
    var_0 common_scripts\utility::hide_friendname_until_flag_or_notify( "begin_overlapped_gasoline_sequence" );
}

static_group_monitor( var_0, var_1, var_2 )
{
    level endon( var_1 );
    _func_31C( var_2 );

    for (;;)
    {
        common_scripts\utility::flag_wait( var_0 );
        _func_31B( var_2 );
        common_scripts\utility::flag_waitopen( var_0 );
        _func_31C( var_2 );
    }
}
