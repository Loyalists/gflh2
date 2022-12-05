// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_C2B0()
{
    level._id_CA75 = "mil_frame_charge";
    level._id_B8AB = "h2_gfl_st_ar15_viewbody";
    setdvar( "use_improved_breaches", 1 );
    _id_C989::main();
    _id_C908::main();
    maps\estate_anim::main();
    _id_BA9C::main();
    maps\_load::main();
    level.autosave_proximity_threat_func = ::_id_B5CD;
    maps\_drone_ai::init();
    maps\_slowmo_breach::slowmo_breach_init();
    _id_D2A4::main();
    level._id_BCA6 = _id_D13F();
    precacheitem( "claymore" );
    precacheitem( "flash_grenade" );
    precacheitem( "javelin" );
    precacheitem( "javelin_estate_jeep" );
    precacheitem( "cheytac" );
    precachemodel( "projectile_bouncing_betty_grenade" );
    precachemodel( "accessories_gas_canister_highrez" );
    precachemodel( "prop_cigarette_pack" );
    precachemodel( "prop_price_cigar" );
    precachemodel( "weapon_colt_anaconda_animated" );
    precachemodel( "mil_wireless_dsm_small" );
    precachemodel( "electronics_camera_pointandshoot_animated" );
    precachemodel( "hat_opforce_merc_b" );
    precacheturret( "minigun_littlebird_spinnup" );
    precacheshellshock( "estate_bouncingbetty" );
    precacherumble( "artillery_rumble" );
    precacherumble( "shepherd_pistol" );
    precacherumble( "shot_collapse" );
    precacherumble( "bodytoss_impact" );
    precacherumble( "dsm_rummage" );
    precachestring( &"ESTATE_DSM_FRAME" );
    precachestring( &"ESTATE_DSM_WORKING" );
    precachestring( &"ESTATE_DSM_NETWORK_FOUND" );
    precachestring( &"ESTATE_DSM_IRONBOX" );
    precachestring( &"ESTATE_DSM_BYPASS" );
    precachestring( &"ESTATE_DSM_PROGRESS" );
    precachestring( &"ESTATE_DSM_SLASH_TOTALFILES" );
    precachestring( &"ESTATE_DSM_DLTIMELEFT" );
    precachestring( &"ESTATE_DSM_DLTIMELEFT_MINS" );
    precachestring( &"ESTATE_DSM_DLTIMELEFT_SECS" );
    precachestring( &"ESTATE_DSM_DL_RATEMETER" );
    precachestring( &"ESTATE_DSM_DLRATE" );
    precachestring( &"ESTATE_DSM_DESTROYED_BY_PLAYER" );
    precachestring( &"ESTATE_DSM_DESTROYED_BY_AI_GUNFIRE" );
    precachestring( &"ESTATE_DSM_DESTROYED_BY_DESERTION" );
    precachestring( &"ESTATE_LEARN_PRONE" );
    precachestring( &"ESTATE_LEARN_PRONE_TOGGLE" );
    precachestring( &"ESTATE_LEARN_PRONE_HOLDDOWN" );
    precachestring( &"ESTATE_USE_CLAYMORE_HINT" );
    precachestring( &"ESTATE_REMIND_PRONE_LINE1" );
    precachestring( &"ESTATE_REMIND_PRONE_LINE2" );
    precachestring( &"ESTATE_REMIND_PRONE_LINE2_TOGGLE" );
    precachestring( &"ESTATE_REMIND_PRONE_LINE2_HOLDDOWN" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "h2_hud_ssdd_stats_blur" );
    precacheshader( "h2_hud_ssdd_stats_border" );

    precachemodel( "h2_gfl_st_ar15_viewbody" );
    precachemodel( "h2_gfl_st_ar15_viewhands" );
    precachemodel( "h2_gfl_st_ar15_viewhands_player" );

    maps\estate_aud::main();
    maps\estate_lighting::main();
    level._id_B935 = 0;
    level.custom_linkto_slide = 1;
    level._id_D5D5 = 0;
    level._id_AA48 = 0;
    level._id_C0C5 = 7;
    level._id_B48C = 15;
    level._id_CA82 = 0;
    level.cansave = 1;
    maps\_compass::setupminimap( "compass_map_estate" );
    level.scr_sound["mortar"]["incomming"] = "mortar_incoming";
    level.scr_sound["mortar"]["dirt"] = "mortar_explosion_dirt";
    level._id_D10A = 1;
    maps\_utility::add_hint_string( "claymore_hint", &"ESTATE_USE_CLAYMORE_HINT", ::_id_BCE2, undefined, "medium_background" );
    maps\_utility::add_control_based_hint_strings( "mineavoid_hint_toggle", &"ESTATE_LEARN_PRONE", ::_id_CA9F, &"ESTATE_LEARN_PRONE_TOGGLE", undefined, "medium_background" );
    maps\_utility::add_control_based_hint_strings( "mineavoid_hint_holddown", &"ESTATE_LEARN_PRONE", ::_id_CA9F, &"ESTATE_LEARN_PRONE_HOLDDOWN", undefined, "medium_background" );
    maps\_utility::add_hint_string( "mineavoid_hint", &"ESTATE_LEARN_PRONE", ::_id_CA9F, undefined, "medium_background" );
    level._id_D048 = 0;
    level._id_B1A0 = 0;
    level._id_B8E8 = 0;
    level._id_B515 = 4;
    level._id_C6A2 = 5;
    level._id_A818 = 0;
    level._id_CA86 = 3000;
    level._id_D526 = level._id_CA86;
    level._id_B2D8 = 1000;
    level._id_AA0B = 0;
    level._id_CC89 = 50;
    level._id_AE20 = 1000;
    level._id_B745 = 0;
    level._id_C2AB = 0;
    level._id_CECC = 3;
    level._id_BFA5 = 0;
    level._id_BFB4 = 0;
    level._id_B821 = 30;
    level._id_B5C8 = 44;
    level._id_B1F7 = 0;
    common_scripts\utility::run_thread_on_targetname( "forest_friendly_advance_trig", ::_id_B766 );
    common_scripts\utility::run_thread_on_targetname( "breach_normalguy", ::_id_C102 );
    maps\_utility::array_spawn_function_targetname( "breach_normalguy", ::_id_C8D2 );
    maps\_utility::array_spawn_function_targetname( "breach_extraguy", ::_id_BA5F, 1 );
    maps\_utility::array_spawn_function_targetname( "breach_extraguy", ::_id_BC5F );
    maps\_utility::array_spawn_function_targetname( "breach_enemy_spawner", ::_id_BA5F );
    maps\_utility::array_spawn_function_targetname( "breach_normalguy", ::_id_BA5F );
    thread achievement_claymore_init();
    thread _id_D5D1();
    thread _id_C58D();
    thread _id_B9C6();
    thread _id_D420();
    thread _id_B095();
    thread _id_BBB6();
    thread _id_BB28();
    thread _id_B575();
    thread _id_B6F4();
    thread _id_BCF4();
    thread _id_A939();
    thread _id_B64B();
    thread _id_D56E();
    thread _id_CDE4();
    thread _id_CE18();
    thread _id_C95C();
    thread _id_D417();
    thread _id_BEFD();
    thread _id_C716();
    thread _id_BC1B();
    thread blade_rotate();
    thread lighting_override_venitians();
}

_id_B766()
{
    self endon( "death" );
    var_0 = undefined;

    if ( isdefined( self.script_linkto ) )
    {
        var_0 = [];
        var_0 = common_scripts\utility::get_linked_ents();

        foreach ( var_2 in var_0 )
            var_2.trig = self;
    }

    self waittill( "trigger" );
    level._id_D048 = self.script_index;

    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in var_0 )
            var_2 delete();
    }
    else if ( isdefined( self.trig ) )
        self.trig delete();
}

_id_CA9F()
{
    if ( level.player getstance() == "prone" )
        return 1;
    else
        return 0;
}

_id_C21D()
{
    common_scripts\utility::flag_init( "ending_flag" );
    common_scripts\utility::flag_init( "room_1_frontdoor_cleared" );
    common_scripts\utility::flag_init( "room_1_kitchen_cleared" );
    common_scripts\utility::flag_init( "room_2_laundry_cleared" );
    common_scripts\utility::flag_init( "room_3_armory_cleared" );
    common_scripts\utility::flag_init( "room_5_masterbed_cleared" );
    common_scripts\utility::flag_init( "slam_zoom_done" );
    common_scripts\utility::flag_init( "skip_intro" );
    common_scripts\utility::flag_init( "skip_ambush" );
    common_scripts\utility::flag_init( "skip_forestfight" );
    common_scripts\utility::flag_init( "skip_houseapproach" );
    common_scripts\utility::flag_init( "skip_housebreach" );
    common_scripts\utility::flag_init( "skip_breachandclear" );
    common_scripts\utility::flag_init( "skip_housebriefing" );
    common_scripts\utility::flag_init( "skip_defense" );
    common_scripts\utility::flag_init( "test_alt_ending" );
    common_scripts\utility::flag_init( "print_first_objective" );
    common_scripts\utility::flag_init( "futilejeeps_destroyed" );
    common_scripts\utility::flag_init( "start_ghost_intro_nav" );
    common_scripts\utility::flag_init( "downhill_run_enable" );
    common_scripts\utility::flag_init( "downhill_run_disable" );
    common_scripts\utility::flag_init( "ambush_shouted" );
    common_scripts\utility::flag_init( "deploy_rpg_ambush" );
    common_scripts\utility::flag_init( "deploy_mortar_attack" );
    common_scripts\utility::flag_init( "gameplay_mine_done" );
    common_scripts\utility::flag_init( "bouncing_betty_activated" );
    common_scripts\utility::flag_init( "bouncing_betty_done" );
    common_scripts\utility::flag_init( "mine_throw_player" );
    common_scripts\utility::flag_init( "bouncing_betty_player_released" );
    common_scripts\utility::flag_init( "ambushed_player_back_to_normal" );
    common_scripts\utility::flag_init( "slow_motion_ambush_done" );
    common_scripts\utility::flag_init( "spawn_first_ghillies" );
    common_scripts\utility::flag_init( "smoke_screen_activated" );
    common_scripts\utility::flag_init( "smoke_screen_assault_activated" );
    common_scripts\utility::flag_init( "player_exits_smoke" );
    common_scripts\utility::flag_init( "start_ambush_music" );
    common_scripts\utility::flag_init( "stop_smokescreens" );
    common_scripts\utility::flag_init( "ambush_complete" );
    common_scripts\utility::flag_init( "player_is_out_of_ambush_zone" );
    common_scripts\utility::flag_init( "forestfight_littlebird_1" );
    common_scripts\utility::flag_init( "start_early_helicopter" );
    common_scripts\utility::flag_init( "approaching_house" );
    common_scripts\utility::flag_init( "deploy_house_defense_jeeps" );
    common_scripts\utility::flag_init( "autosave_housearrival" );
    common_scripts\utility::flag_init( "scripted_dialogue_on" );
    common_scripts\utility::flag_init( "first_free_save" );
    common_scripts\utility::flag_init( "dialogue_ghost_orders" );
    common_scripts\utility::flag_init( "dialogue_topfloor_cleared" );
    common_scripts\utility::flag_init( "dialogue_basement_cleared" );
    common_scripts\utility::flag_init( "save_the_game_indoors" );
    common_scripts\utility::flag_init( "save_the_game_downstairs" );
    common_scripts\utility::flag_init( "foyer_breached_first" );
    common_scripts\utility::flag_init( "kitchen_breached_first" );
    common_scripts\utility::flag_init( "basement_breached_first" );
    common_scripts\utility::flag_init( "breach0_foyerhall_cancel" );
    common_scripts\utility::flag_init( "breach0_diningroom_cancel" );
    common_scripts\utility::flag_init( "breach0_bathroomrush_cancel" );
    common_scripts\utility::flag_init( "ghost_begins_sweep" );
    common_scripts\utility::flag_init( "ghost_at_bottom_of_stairs" );
    common_scripts\utility::flag_init( "ghost_goes_outside" );
    common_scripts\utility::flag_init( "topfloor_breached" );
    common_scripts\utility::flag_init( "basement_breached" );
    common_scripts\utility::flag_init( "armory_breached" );
    common_scripts\utility::flag_init( "guestroom_breached" );
    common_scripts\utility::flag_init( "furniture_moving_sounds" );
    common_scripts\utility::flag_init( "scarecrow_said_upstairs" );
    common_scripts\utility::flag_init( "mainfloor_cleared" );
    common_scripts\utility::flag_init( "topfloor_cleared" );
    common_scripts\utility::flag_init( "basement_cleared" );
    common_scripts\utility::flag_init( "mainfloor_cleared_confirmed" );
    common_scripts\utility::flag_init( "basement_cleared_confirmed" );
    common_scripts\utility::flag_init( "ghost_gives_regroup_order" );
    common_scripts\utility::flag_init( "house_friendlies_instructions_given" );
    common_scripts\utility::flag_init( "house_exterior_has_been_breached" );
    common_scripts\utility::flag_init( "house_interior_breaches_done" );
    common_scripts\utility::flag_init( "all_enemies_killed_up_to_house_capture" );
    common_scripts\utility::flag_init( "house_approach_dialogue" );
    common_scripts\utility::flag_init( "house_perimeter_softened" );
    common_scripts\utility::flag_init( "house_briefing_is_over" );
    common_scripts\utility::flag_init( "photographs_done" );
    common_scripts\utility::flag_init( "house_briefing_dialogue_done" );
    common_scripts\utility::flag_init( "dsm_ready_to_use" );
    common_scripts\utility::flag_init( "download_started" );
    common_scripts\utility::flag_init( "download_files_started" );
    common_scripts\utility::flag_init( "dsm_exposed" );
    common_scripts\utility::flag_init( "dsm_destroyed" );
    common_scripts\utility::flag_init( "download_test" );
    common_scripts\utility::flag_init( "download_data_initialized" );
    common_scripts\utility::flag_init( "ozone_to_earlydefense_start" );
    common_scripts\utility::flag_init( "scarecrow_to_earlydefense_start" );
    common_scripts\utility::flag_init( "strike_packages_definitely_underway" );
    common_scripts\utility::flag_init( "abandonment_danger_zone" );
    common_scripts\utility::flag_init( "player_can_fail_by_desertion" );
    common_scripts\utility::flag_init( "player_entered_autofail_zone" );
    common_scripts\utility::flag_init( "dsm_compromised" );
    common_scripts\utility::flag_init( "skip_house_defense_dialogue" );
    common_scripts\utility::flag_init( "defense_battle_begins" );
    common_scripts\utility::flag_init( "defending_dsm" );
    common_scripts\utility::flag_init( "sniper_in_position" );
    common_scripts\utility::flag_init( "skip_defense_firstwave" );
    common_scripts\utility::flag_init( "sniper_attempting_shot" );
    common_scripts\utility::flag_init( "sniper_shot_complete" );
    common_scripts\utility::flag_init( "sniper_shooting" );
    common_scripts\utility::flag_init( "strike_package_birchfield_dialogue" );
    common_scripts\utility::flag_init( "strike_package_bighelidrop_dialogue" );
    common_scripts\utility::flag_init( "strike_package_boathouse_dialogue" );
    common_scripts\utility::flag_init( "strike_package_solarfield_dialogue" );
    common_scripts\utility::flag_init( "strike_package_md500rush_dialogue" );
    common_scripts\utility::flag_init( "rpg_stables_dialogue" );
    common_scripts\utility::flag_init( "rpg_boathouse_dialogue" );
    common_scripts\utility::flag_init( "rpg_southwest_dialogue" );
    common_scripts\utility::flag_init( "scarecrow_death_dialogue" );
    common_scripts\utility::flag_init( "ozone_death_dialogue" );
    common_scripts\utility::flag_init( "sniper_breaktime_dialogue" );
    common_scripts\utility::flag_init( "boathouse_invaders_arrived" );
    common_scripts\utility::flag_init( "activate_package_on_standby" );
    common_scripts\utility::flag_init( "strike_package_spawned" );
    common_scripts\utility::flag_init( "strike_component_activated" );
    common_scripts\utility::flag_init( "activate_component_on_standby" );
    common_scripts\utility::flag_init( "main_defense_fight_finished" );
    common_scripts\utility::flag_init( "download_complete" );
    common_scripts\utility::flag_init( "dsm_recovered" );
    common_scripts\utility::flag_init( "begin_escape_music" );
    common_scripts\utility::flag_init( "fence_removed" );
    common_scripts\utility::flag_init( "player_is_escaping" );
    common_scripts\utility::flag_init( "cointoss_done" );
    common_scripts\utility::flag_init( "birchfield_cleared_sector1" );
    common_scripts\utility::flag_init( "birchfield_cleared_sector2" );
    common_scripts\utility::flag_init( "ghost_covered_player" );
    common_scripts\utility::flag_init( "bracketing_mortars_started" );
    common_scripts\utility::flag_init( "player_retreated_into_birchfield" );
    common_scripts\utility::flag_init( "point_of_no_return" );
    common_scripts\utility::flag_init( "finish_line" );
    common_scripts\utility::flag_init( "begin_ending_music" );
    common_scripts\utility::flag_init( "play_ending_sequence" );
    common_scripts\utility::flag_init( "drag_sequence_slacker_check" );
    common_scripts\utility::flag_init( "drag_sequence_killcount_achieved" );
    common_scripts\utility::flag_init( "no_slow_mo" );
    common_scripts\utility::flag_init( "start_playerdrag_sequence" );
    common_scripts\utility::flag_init( "test_with_pavelow_already_in_place" );
    common_scripts\utility::flag_init( "thunderone_heli" );
    common_scripts\utility::flag_init( "enter_the_littlebirds" );
    common_scripts\utility::flag_init( "made_it_to_lz" );
    common_scripts\utility::flag_init( "test_whole_ending" );
    common_scripts\utility::flag_init( "test_ending" );
    common_scripts\utility::flag_init( "ghost_grabbed_player" );
    common_scripts\utility::flag_init( "test_ending_body_toss" );
    common_scripts\utility::flag_init( "begin_overlapped_gasoline_sequence" );
    common_scripts\utility::flag_init( "cigar_flicked" );
    common_scripts\utility::flag_init( "cigar_flareup" );
    common_scripts\utility::flag_init( "end_the_mission" );
    common_scripts\utility::flag_init( "claymore_hint_printed" );
}

_id_D13F()
{
    var_0 = getent( "player_view_start_1", "targetname" );
    var_1 = getent( "player_view_start_2", "targetname" );
    var_2 = var_1.origin - var_0.origin;
    var_3 = vectortoangles( var_2 );
    return var_3;
}

_id_A914()
{
    level._id_B8D7 = maps\_utility::spawn_targetname( "ghost", 1 );
    level._id_B8D7.animname = "ghost";

    if ( !common_scripts\utility::flag( "test_ending" ) )
    {
        level._id_B8D7 thread _id_BBF2();
        level._id_B8D7.pathrandompercent = 0;
        level._id_B8D7 thread maps\_utility::magic_bullet_shield();

        if ( !common_scripts\utility::flag( "skip_houseapproach" ) )
            level._id_B8D7 allowedstances( "crouch" );

        level._id_B8D7 pushplayer( 1 );
        level._id_B8D7 maps\_utility::enable_cqbwalk();
        level._id_B8D7.ignoresuppression = 1;
    }
}

_id_BBF2()
{
    for (;;)
    {
        var_0 = maps\_utility::trigger_wait_targetname( "downhill_run_enable" );

        if ( var_0 == self )
            break;
    }

    maps\_utility::disable_cqbwalk();

    for (;;)
    {
        var_0 = maps\_utility::trigger_wait_targetname( "downhill_run_disable" );

        if ( var_0 == self )
            break;
    }

    if ( self == level._id_B8D7 )
        self allowedstances( "stand", "crouch", "prone" );

    maps\_utility::enable_cqbwalk();
    maps\_utility::clear_run_anim();
}

_id_BE3A()
{
    level endon( "ghost_leaving_start_area_early" );
    common_scripts\utility::flag_wait( "start_ghost_intro_nav" );
    level notify( "ghost_leaving_start_area_on_cue" );
    var_0 = getent( "ghost_starter", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 notify( "trigger" );

    level._id_B8D7 allowedstances( "crouch", "prone", "stand" );
}

_id_AFBE()
{
    level endon( "ghost_leaving_start_area_on_cue" );
    level notify( "ghost_leaving_start_area_early" );
    var_0 = getent( "ghost_starter", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "trigger" );

    level._id_B8D7 allowedstances( "crouch", "prone", "stand" );
}

_id_C2C5()
{
    maps\_utility::array_spawn_function_targetname( "starter_friendly", ::_id_CC55 );
    var_0 = getentarray( "starter_friendly", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_CC55()
{
    self.ignoresuppression = 1;
    self pushplayer( 1 );
    maps\_utility::enable_cqbwalk();
    var_0 = isdefined( self.script_friendname );

    if ( var_0 )
    {
        thread maps\_utility::magic_bullet_shield();

        if ( self.script_friendname == "Ozone" )
        {
            level._id_B224 = self;
            level._id_B224.animname = "ozone";
            level._id_B224 thread _id_BBF2();
            level._id_B224 thread _id_C527();
            level._id_B224 thread _id_C79B();
        }

        if ( self.script_friendname == "Scarecrow" )
        {
            level._id_B4A3 = self;
            level._id_B4A3.animname = "scarecrow";
            level._id_B4A3 thread _id_BBF2();
            level._id_B4A3 thread _id_BC7F();
            level._id_B4A3 thread _id_CFD9();
        }
    }
}

_id_CE88()
{
    maps\_utility::array_spawn_function_targetname( "starter_scout", ::_id_C429 );
    var_0 = getentarray( "starter_scout", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_C429()
{
    self.ignoresuppression = 1;
    self pushplayer( 1 );
    maps\_utility::enable_cqbwalk();
    thread _id_B7B6();
}

_id_B7B6()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "ambush_shouted" );
    thread _id_B942();
    common_scripts\utility::flag_wait( "mine_throw_player" );
    wait(randomfloatrange( 0.1, 1 ));
    self kill();
}

_id_BECD()
{
    maps\_utility::array_spawn_function_targetname( "starter_sniper", ::_id_D141 );
    var_0 = getentarray( "starter_sniper", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_D141()
{
    self endon( "death" );
    self.ignoresuppression = 1;
    self pushplayer( 1 );
    self allowedstances( "crouch" );
    childthread _id_C9A2();
    common_scripts\utility::flag_wait( "player_is_out_of_ambush_zone" );
    self delete();
}

_id_BCB5( var_0 )
{
    _id_C2C5();
    var_1 = getaiarray( "allies" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.script_friendname ) )
        {
            if ( var_3.script_friendname == "Ozone" )
            {
                var_4 = getnode( "ozone_" + var_0 + "_start", "targetname" );
                var_3 forceteleport( var_4.origin, var_4.angles );
            }

            if ( var_3.script_friendname == "Scarecrow" )
            {
                var_4 = getnode( "scarecrow_" + var_0 + "_start", "targetname" );
                var_3 forceteleport( var_4.origin, var_4.angles );
            }

            continue;
        }

        var_3 delete();
    }
}

_id_C77F()
{
    maps\_utility::array_spawn_function_noteworthy( "perimeter_guard", ::_id_CE28 );
}

_id_CE28()
{
    level._id_B1A0++;
    thread _id_AB85();
}

_id_AB85()
{
    self waittill( "death" );
    level._id_B1A0--;

    if ( !level._id_B1A0 )
        common_scripts\utility::flag_set( "house_perimeter_softened" );
}

_id_D343()
{
    soundscripts\_snd::snd_message( "aud_stop_stealth_infiltration_mix" );
    soundscripts\_snd::snd_message( "start_bouncing_betty_sequence" );
    thread _id_A965();
    var_0 = 2;
    var_1 = 0.65;
    var_2 = 0.1;
    var_3 = 0.3;
    var_4 = 10;
    maps\_utility::music_stop();
    maps\_utility::slowmo_start();
    maps\_utility::slowmo_setspeed_slow( var_3 );
    maps\_utility::slowmo_setlerptime_in( var_0 );
    maps\_utility::slowmo_lerp_in();
    common_scripts\utility::flag_set( "deploy_rpg_ambush" );
    level.player setmovespeedscale( var_2 );
    level.player _meth_830F( 0 );
    wait(var_4 * var_3);
    soundscripts\_snd::snd_message( "stop_bouncing_betty_slowmo" );
    maps\_utility::slowmo_setlerptime_out( var_1 );
    maps\_utility::slowmo_lerp_out();
    maps\_utility::slowmo_end();
    level.player setmovespeedscale( 1.0 );
    level.player _meth_830F( 1 );
    common_scripts\utility::flag_set( "slow_motion_ambush_done" );
}

_id_B498( var_0 )
{
    var_1 = level.player getplayerangles();
    var_1 = ( 0, var_1[1], 0 );
    var_2 = anglestoforward( var_1 );
    var_3 = anglestoright( var_1 );
    var_4 = var_3 * -1;
    var_5 = level.player.origin + var_2 * 96;

    if ( isdefined( var_0 ) )
    {
        var_6 = level.player.origin + ( 0.0, 0.0, 64.0 );
        var_7 = level.player.origin + var_2 * 128 + ( 0.0, 0.0, 64.0 );
        var_8 = var_7 + var_3 * 16;
        var_9 = var_7 + var_4 * 16;
        var_10 = level.player.origin + var_2 * 128 + ( 0.0, 0.0, 28.0 );
        var_11 = var_10 + var_3 * 16;
        var_12 = var_10 + var_4 * 16;
        var_13 = bullettracepassed( var_6, var_7, 1, level.player );
        var_14 = bullettracepassed( var_6, var_8, 1, level.player );
        var_15 = bullettracepassed( var_6, var_9, 1, level.player );
        var_16 = bullettracepassed( var_6, var_10, 1, level.player );
        var_17 = bullettracepassed( var_6, var_11, 1, level.player );
        var_18 = bullettracepassed( var_6, var_12, 1, level.player );

        if ( var_13 && var_14 && var_15 && var_16 && var_17 && var_18 )
        {
            var_5 = common_scripts\utility::drop_to_ground( var_5, 200, -200 );
            return var_5;
        }
        else
        {
            var_19 = getentarray( "alternate_bb_location", "targetname" );
            var_20 = 128;
            var_21 = 0;
            var_22 = 0;

            foreach ( var_24 in var_19 )
            {
                var_25 = length( level.player.origin - var_24.origin );
                var_26 = level.player geteye();
                var_27 = var_24.origin + ( 0.0, 0.0, 6.0 );
                var_28 = common_scripts\utility::within_fov( level.player.origin, level.player.angles, var_27, 0.766 );

                if ( var_28 )
                    var_28 = sighttracepassed( var_26, var_27, 1, level.player );

                if ( var_28 )
                    var_21 = 1;
                else
                    var_21 = 0;

                if ( var_25 < var_20 && var_25 > 48 && var_21 )
                {
                    var_22 = 1;
                    var_5 = common_scripts\utility::drop_to_ground( var_24.origin, 200, -200 );
                    return var_5;
                }
            }

            if ( !var_22 )
            {
                var_25 = undefined;
                var_30 = 100000;
                var_31 = undefined;

                foreach ( var_24 in var_19 )
                {
                    var_25 = length( level.player.origin - var_24.origin );

                    if ( var_25 < var_30 )
                    {
                        var_30 = var_25;
                        var_31 = var_24;
                    }
                }

                var_5 = common_scripts\utility::drop_to_ground( var_31.origin, 200, -200 );
                return var_5;
            }
        }
    }
    else
    {
        var_5 = common_scripts\utility::drop_to_ground( var_5, 200, -200 );
        return var_5;
    }
}

_id_A965()
{
    wait 0.2;
    var_0 = getentarray( "bouncing_betty", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 thread _id_B223( undefined, undefined, undefined );
        wait(randomfloatrange( 0.15, 0.2 ));
    }

    var_4 = _id_B498( "specialPlayerCase" );
    level.player _meth_85A0();

    if ( isdefined( var_4 ) )
    {
        thread _id_D0FE( var_4 );
        var_5 = spawn( "script_origin", var_4 );
        var_5 thread _id_B223( 1, undefined );
    }
    else
    {
        thread _id_D0FE( level.player.origin );
        var_5 = spawn( "script_origin", level.player.origin );
        var_5 thread _id_B223( 1, undefined, 1 );
    }

    thread _id_B362();
    setsaveddvar( "objectiveHide", 1 );

    while ( level._id_B935 < var_0.size )
        wait 0.05;

    common_scripts\utility::flag_set( "ambush_shouted" );
    wait 0.35;
    level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_ambush" );
    wait 1;
    setsaveddvar( "objectiveHide", 0 );
    common_scripts\utility::flag_set( "bouncing_betty_done" );
}

_id_B362()
{
    if ( level.console )
    {
        wait 0.6;
        level.player thread maps\_utility::display_hint( "mineavoid_hint" );
    }
    else
    {
        wait 0.1;
        var_0 = "mineavoid_hint";

        if ( maps\_utility::is_command_bound( "toggleprone" ) )
            var_0 = "mineavoid_hint_toggle";
        else if ( maps\_utility::is_command_bound( "+prone" ) )
            var_0 = "mineavoid_hint_holddown";
        else if ( maps\_utility::is_command_bound( "+stance" ) )
            var_0 = "mineavoid_hint";

        if ( var_0 == "mineavoid_hint" )
            level.player thread maps\_utility::display_hint( var_0 );
        else
            level.player thread maps\_utility::hintdisplayhandler( var_0 );
    }
}

_id_B223( var_0, var_1, var_2 )
{
    playfx( common_scripts\utility::getfx( "bouncing_betty_launch" ), self.origin );
    self playsound( "mine_betty_click" );
    self playsound( "mine_betty_spin" );
    var_3 = isdefined( var_1 );
    var_2 = isdefined( var_2 );

    if ( !var_3 )
        level._id_B935++;
    else
    {
        level.cansave = 0;
        level._id_CA82++;
    }

    var_4 = undefined;
    var_5 = undefined;

    if ( !var_2 )
    {
        var_4 = spawn( "script_model", self.origin );
        var_4 setmodel( "projectile_bouncing_betty_grenade" );
        var_4.animname = "bouncingbetty";
        var_4 useanimtree( level.scr_animtree["bouncingbetty"] );
        var_4 thread _id_B300();
        maps\_anim::anim_single_solo( var_4, "bouncing_betty_detonate" );
        var_5 = var_4.origin;

        if ( !var_3 )
            common_scripts\utility::flag_wait( "ambush_shouted" );

        var_4 playsound( "mine_betty_explode" );
    }

    if ( isdefined( var_0 ) )
    {
        if ( !var_2 )
            playfxontag( common_scripts\utility::getfx( "bouncing_betty_explosion" ), var_4, "tag_fx" );
        else
            wait 2;

        var_6 = getaiarray( "allies" );

        foreach ( var_8 in var_6 )
        {
            if ( !isdefined( var_8.name ) )
                continue;

            if ( var_8.name != "Archer" && var_8.name != "Toad" )
                var_8 maps\_utility::delaythread( randomfloat( 0.15 ), maps\_anim::anim_generic, var_8, "exposed_crouch_extendedpainA" );
        }

        var_4 playsound( "scn_last_mine_explode" );
        level.player playrumblelooponentity( "artillery_rumble" );
        setplayerignoreradiusdamage( 0 );

        if ( level.player getstance() == "prone" )
            common_scripts\utility::flag_set( "mine_throw_player" );
        else
        {
            wait 0.05;
            var_10 = common_scripts\utility::ter_op( level.player getstance() == "stand", "h2_wpn_death_stand_explosion", "h2_wpn_death_crouch_explosion" );
            level.player _meth_85A8( var_10 );
            waittillframeend;
            level.player kill();
            thread _id_CBBE();
        }
    }
    else
    {
        playfxontag( common_scripts\utility::getfx( "bouncing_betty_explosion" ), var_4, "tag_fx" );
        var_4 hide();

        if ( var_3 )
        {
            var_11 = length( level.player.origin - self.origin );
            level.player playrumblelooponentity( "artillery_rumble" );

            if ( var_11 <= self.radius )
            {
                if ( level.player getstance() == "prone" )
                {
                    setplayerignoreradiusdamage( 1 );
                    thread _id_D34F( var_5 );
                    var_12 = common_scripts\utility::within_fov( level.player.origin, level.player.angles + ( 0.0, -95.0, 0.0 ), self.origin, cos( 180 ) );
                    var_13 = common_scripts\utility::within_fov( level.player.origin, level.player.angles + ( 0.0, 95.0, 0.0 ), self.origin, cos( 180 ) );
                    var_14 = common_scripts\utility::within_fov( level.player.origin, level.player.angles, self.origin, cos( 10 ) );

                    if ( var_12 )
                        level.player thread maps\_gameskill::grenade_dirt_on_screen( "right" );

                    if ( var_13 )
                        level.player thread maps\_gameskill::grenade_dirt_on_screen( "left" );

                    if ( var_14 )
                        level.player thread maps\_gameskill::grenade_dirt_on_screen( "bottom_b" );

                    thread _id_CF7B();
                }
                else
                {
                    wait 0.2;

                    if ( isalive( level.player ) )
                    {
                        thread _id_D34F( var_5 );
                        level notify( "new_quote_string" );
                        var_10 = common_scripts\utility::ter_op( level.player getstance() == "stand", "h2_wpn_death_stand_explosion", "h2_wpn_death_crouch_explosion" );
                        level.player _meth_85A8( var_10 );
                        waittillframeend;
                        level.player kill();
                        thread _id_CBBE();
                    }
                }
            }
        }
        else
        {
            setplayerignoreradiusdamage( 1 );
            radiusdamage( var_5, self.radius, 1000, 20 );
        }

        setplayerignoreradiusdamage( 0 );
    }

    wait 0.2;

    if ( isdefined( var_4 ) )
        var_4 delete();

    wait 0.5;

    if ( var_3 )
    {
        level._id_CA82--;
        level notify( "gameplay_mine_done" );
    }
}

_id_AE1C()
{
    var_0 = getent( "forestfight_start_redshirts", "targetname" );
    var_0 waittill( "trigger" );
    maps\_utility::autosave_by_name( "bb_autosave" );
}

_id_CBBE()
{
    wait 2.5;
    setdvar( "ui_deadquote", "" );
    setomnvar( "ui_hidebasedeathquote", 1 );
    var_0 = newhudelem();
    var_0.elemtype = "font";
    var_0.font = "default";
    var_0.fontscale = 1;
    var_0.x = 0;
    var_0.y = -30;
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.horzalign = "center";
    var_0.vertalign = "middle";
    var_0.hidewheninmenu = 1;
    var_0.foreground = 1;
    var_0.alpha = 0;
    var_0 fadeovertime( 2 );
    var_0.alpha = 1;
    var_0 settext( &"ESTATE_REMIND_PRONE_LINE1" );
    var_1 = newhudelem();
    var_1.elemtype = "font";
    var_1.font = "default";
    var_1.fontscale = 1;
    var_1.x = 0;
    var_1.y = -25 + level.fontheight * var_1.fontscale;
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1.horzalign = "center";
    var_1.vertalign = "middle";
    var_1.foreground = 1;
    var_1.alpha = 0;
    var_1 fadeovertime( 2 );
    var_1.alpha = 1;
    var_1.hidewheninmenu = 1;

    if ( level.console || level.player common_scripts\utility::is_player_gamepad_enabled() )
        var_1 settext( &"ESTATE_REMIND_PRONE_LINE2" );
    else if ( maps\_utility::is_command_bound( "toggleprone" ) )
        var_1 settext( &"ESTATE_REMIND_PRONE_LINE2_TOGGLE" );
    else if ( maps\_utility::is_command_bound( "+prone" ) )
        var_1 settext( &"ESTATE_REMIND_PRONE_LINE2_HOLDDOWN" );
    else
        var_1 settext( &"ESTATE_REMIND_PRONE_LINE2" );
}

_id_CF7B()
{
    level.player shellshock( "estate_bouncingbetty", 3.5 );
    earthquake( 1, 0.8, level.player.origin, 2000 );
    level.player.ignoreme = 1;
    wait 3.5;
    level.player.ignoreme = 0;
}

_id_CAD0()
{
    level.player dodamage( randomfloatrange( 30, 35 ), self.origin );
}

_id_D34F( var_0 )
{
    radiusdamage( var_0, self.radius * 2, 200, 20 );
}

_id_D5D1()
{
    for (;;)
    {
        level waittill( "gameplay_mine_done" );

        if ( !level._id_CA82 )
            level.cansave = 1;
    }
}

_id_D0FE( var_0 )
{
    if ( !common_scripts\utility::flag( "ambush_complete" ) )
        common_scripts\utility::flag_wait( "mine_throw_player" );

    level.player freezecontrols( 1 );
    var_1 = level.player.origin + ( 0.0, 0.0, 40.0 ) - var_0;
    var_2 = vectornormalize( var_1 );
    var_3 = 2000;
    thread _id_AE2D();
    thread _id_BED6();
    thread _id_AC6F();
    var_4 = 0;
    var_5 = getent( "no_sliding_allowed", "targetname" );

    if ( !level.player istouching( var_5 ) )
    {
        var_4 = 1;
        level.player thread maps\_utility::beginsliding( var_2 * var_3, 10, 0.25 );
    }

    wait 0.5;

    if ( var_4 )
        level.player thread maps\_utility::endsliding();

    common_scripts\utility::flag_set( "bouncing_betty_player_released" );

    if ( var_4 )
        wait 3.5;

    level.player freezecontrols( 0 );
    common_scripts\utility::flag_set( "spawn_first_ghillies" );
}

_id_AE2D()
{
    soundscripts\_snd::snd_message( "start_bouncing_betty_shellshock" );
    level.player shellshock( "estate_bouncingbetty", 10 );
    wait 0.1;
    earthquake( 3, 0.2, level.player.origin, 2000 );
    wait 0.2;
    earthquake( 1, 1, level.player.origin, 2000 );
    wait 1;
    level._id_B8D7 thread maps\_utility::dialogue_queue( "est_gst_targetsleftside" );
    earthquake( 0.5, 0.5, level.player.origin, 2000 );
    wait 0.5;
    common_scripts\utility::flag_wait( "ambushed_player_back_to_normal" );
    level.player allowcrouch( 1 );
    level.player allowstand( 1 );
    wait 3;
    level._id_B224 maps\_utility::dialogue_queue( "est_tf1_ambush" );
    common_scripts\utility::flag_set( "start_ambush_music" );
    wait 2;
    level._id_B4A3 maps\_utility::dialogue_queue( "est_tf2_ambush" );
    wait 1;
    common_scripts\utility::flag_set( "deploy_mortar_attack" );
}

_id_BED6()
{
    common_scripts\utility::flag_wait( "bouncing_betty_player_released" );
    level.player allowcrouch( 0 );
    level.player allowstand( 0 );
    level.player allowprone( 1 );
    wait 5;
    common_scripts\utility::flag_set( "ambushed_player_back_to_normal" );
}

_id_B300()
{
    self endon( "death" );
    var_0 = gettime() + 1000;

    while ( gettime() < var_0 )
    {
        wait 0.05;
        playfxontag( common_scripts\utility::getfx( "bouncing_betty_swirl" ), self, "tag_fx_spin1" );
        playfxontag( common_scripts\utility::getfx( "bouncing_betty_swirl" ), self, "tag_fx_spin3" );
        wait 0.05;
        playfxontag( common_scripts\utility::getfx( "bouncing_betty_swirl" ), self, "tag_fx_spin2" );
        playfxontag( common_scripts\utility::getfx( "bouncing_betty_swirl" ), self, "tag_fx_spin4" );
    }
}

_id_AC6F()
{
    var_0 = common_scripts\utility::getstructarray( "fake_rpg", "targetname" );

    foreach ( var_5, var_2 in var_0 )
    {
        var_3 = missile_createrepulsorent( level.player, 1000, 512 );
        var_4 = common_scripts\utility::getstruct( var_2.target, "targetname" );
        magicbullet( "rpg", var_2.origin, var_4.origin );
        wait(randomfloatrange( 0.8, 1.4 ));
    }
}

_id_CAC2()
{
    var_0 = getentarray( "bouncing_betty_gameplay", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_C76C();
}

_id_C76C()
{
    level endon( "house_exterior_has_been_breached" );
    var_0 = spawn( "script_origin", self.origin );
    var_0.radius = self.radius;
    var_0.origin = self.origin;
    var_1 = 0;
    var_2 = 0.15;
    var_3 = 5;

    while ( !var_1 )
    {
        self waittill( "trigger" );
        var_4 = 0;
        var_5 = common_scripts\utility::within_fov( level.player.origin, level.player.angles, var_0.origin, cos( var_3 ) );

        while ( var_5 )
        {
            if ( var_4 >= var_2 )
            {
                var_0 thread _id_B223( undefined, 1 );
                var_1 = 1;
                level notify( "gameplay_mine_deployed" );
                break;
            }

            var_5 = common_scripts\utility::within_fov( level.player.origin, level.player.angles, var_0.origin, cos( var_3 ) );
            var_4 += 0.05;
            wait 0.05;
        }
    }
}

_id_BE8A()
{
    level endon( "approaching_house" );
    level endon( "stop_smokescreens" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "smokepot1" );
        common_scripts\utility::flag_clear( "smokepot2" );
        common_scripts\utility::flag_clear( "smokepot3" );
        var_0 = getentarray( "smokepot1", "targetname" );
        var_0 = common_scripts\utility::array_randomize( var_0 );
        _id_C0AF( "smokepot1", var_0 );
    }
}

_id_CABA()
{
    level endon( "approaching_house" );
    level endon( "stop_smokescreens" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "smokepot2" );
        common_scripts\utility::flag_clear( "smokepot1" );
        common_scripts\utility::flag_clear( "smokepot3" );
        var_0 = getentarray( "smokepot2", "targetname" );
        var_0 = common_scripts\utility::array_randomize( var_0 );
        _id_C0AF( "smokepot2", var_0 );
    }
}

_id_AADC()
{
    level endon( "approaching_house" );
    level endon( "stop_smokescreens" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "smokepot3" );
        common_scripts\utility::flag_clear( "smokepot1" );
        common_scripts\utility::flag_clear( "smokepot2" );
        var_0 = getentarray( "smokepot3", "targetname" );
        var_0 = common_scripts\utility::array_randomize( var_0 );
        _id_C0AF( "smokepot3", var_0 );
    }
}

_id_C0AF( var_0, var_1 )
{
    level endon( "approaching_house" );
    level endon( "stop_smokescreens" );

    while ( common_scripts\utility::flag( var_0 ) )
    {
        foreach ( var_3 in var_1 )
        {
            wait 6;

            if ( level._id_AA48 <= level._id_C0C5 )
            {
                var_3 thread _id_ABE8();
                level._id_AA48++;
                thread _id_BC0A();
            }
        }

        wait 18;
    }
}

_id_BC0A()
{
    wait(level._id_B48C);
    level._id_AA48--;
}

_id_CFB5( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( var_0 == "early_sniper" )
        maps\_utility::array_spawn_function_targetname( var_0, ::_id_B1AA );

    maps\_utility::array_spawn_function_targetname( var_0, ::_id_B6AC );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
}

_id_B6AC()
{
    _id_CA18();
}

_id_BA93()
{
    maps\_utility::array_spawn_function_targetname( "prowler1", ::_id_CBB5 );
    maps\_utility::array_spawn_function_targetname( "prowler1", ::_id_B1AA );
    maps\_utility::array_spawn_function_targetname( "prowler2", ::_id_C688 );
    maps\_utility::array_spawn_function_targetname( "prowler2", ::_id_B1AA );
    maps\_utility::array_spawn_function_targetname( "prowler3", ::_id_D5B5 );
    maps\_utility::array_spawn_function_targetname( "prowler3", ::_id_B1AA );
    var_0 = [];
    var_0 = getentarray( "prowler1", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_0 = [];
    var_0 = getentarray( "prowler2", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_0 = [];
    var_0 = getentarray( "prowler3", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_B1AA()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "forestfight_littlebird_1" );
    wait(randomfloatrange( 1.5, 4.7 ));
    self.goalradius = 2000;
    self.forcegoal = 1;
    var_0 = randomint( 100 );

    if ( var_0 >= 75 )
    {
        for (;;)
        {
            self setgoalpos( level.player.origin );
            wait(randomfloatrange( 5, 10 ));
        }
    }
    else
    {
        var_1 = getnode( "forestfight_cleanup_enemy_rallypoint", "targetname" );
        self setgoalnode( var_1 );
    }
}

_id_CBB5()
{
    thread _id_B2E5();
    thread _id_B927();
    _id_CA18();
    self.ignoresuppression = 1;
    self pushplayer( 1 );
    var_0 = getnode( "prowler1_start", "targetname" );
    var_1 = 5;
    var_2 = 4420;
    var_3 = 2400;
    var_4 = 0.1;
    var_5 = 5;
    var_6 = "forestfight_littlebird_1";
    thread _id_D53B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_C688()
{
    thread _id_B2E5();
    thread _id_B927();
    _id_CA18();
    var_0 = getnode( "prowler2_start", "targetname" );
    var_1 = 4;
    var_2 = 3700;
    var_3 = 2200;
    var_4 = 0.1;
    var_5 = 5;
    var_6 = "forestfight_littlebird_1";
    thread _id_D53B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_D5B5()
{
    var_0 = getnode( "prowler3_start", "targetname" );
    thread _id_B2E5();
    thread _id_B927();
    var_1 = 3;
    var_2 = 4500;
    var_3 = 3400;
    var_4 = 0.08;
    var_5 = 4;
    var_6 = "forestfight_littlebird_1";
    thread _id_D53B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_CA18()
{
    self endon( "death" );
    self endon( "long_death" );
    self.animname = "ghillie";
    self.allowdeath = 1;
    self.a.pose = "prone";
    wait(randomfloatrange( 0, 0.2 ));
    thread maps\_anim::anim_single_solo( self, "prone_2_stand_firing" );
}

_id_B2E5()
{
    level._id_D5D5++;
    self waittill( "death" );
    level._id_D5D5--;

    if ( level._id_D5D5 < 3 )
        common_scripts\utility::flag_set( "stop_smokescreens" );
}

_id_B927()
{
    self endon( "death" );
    common_scripts\utility::flag_wait_any( "approaching_house", "stop_smokescreens" );
    wait(randomfloatrange( 1.5, 2.25 ));
    var_0 = getent( "futilejeep_javelin_sourcepoint1", "targetname" );
    _id_B190::_id_D55F( self );
    self kill();
}

_id_C58D()
{
    var_0 = getent( "recroom_open_doors", "targetname" );
    var_1 = getent( "recroom_open_doors_model", "targetname" );
    var_1 hide();
    level waittill( "breaching_number_4" );
    var_2 = getent( "recroom_closed_doors", "targetname" );
    var_3 = getent( "recroom_closed_doors_model", "targetname" );
    var_2 delete();
    var_3 delete();
    var_1 show();
}

_id_CD6B()
{
    var_0 = getent( "recroom_open_doors", "targetname" );
    var_1 = getent( "recroom_open_doors_model", "targetname" );
    var_1 hide();
    var_2 = getent( "recroom_closed_doors", "targetname" );
    var_3 = getent( "recroom_closed_doors_model", "targetname" );
    var_2 delete();
    var_3 delete();
    var_0 show();
}

_id_B9C6()
{
    var_0 = getentarray( "window_brokenglass", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 hide();

    level waittill( "breaching_number_3" );
    soundscripts\_snd::snd_message( "handle_breach_sequence", "breaching_number_3" );
    wait 2;
    var_4 = getent( "paper_window_sightblocker", "targetname" );
    var_4 delete();
    var_5 = getentarray( "window_newspaper", "targetname" );

    foreach ( var_7 in var_5 )
        var_7 delete();

    var_9 = getentarray( "window_pane", "targetname" );

    foreach ( var_11 in var_9 )
        var_11 delete();

    foreach ( var_2 in var_0 )
        var_2 show();

    var_15 = getentarray( "window_blinds", "targetname" );

    foreach ( var_17 in var_15 )
        var_17 delete();

    var_19 = getentarray( "window_smasher", "targetname" );

    foreach ( var_21 in var_19 )
        radiusdamage( var_21.origin, var_21.radius, 1000, 1000 );
}

_id_D420()
{
    common_scripts\utility::flag_wait( "furniture_moving_sounds" );
    level endon( "breaching_number_5" );
    var_0 = getent( "furniture_moving_sounds_speaker", "targetname" );
    var_0 maps\_utility::play_sound_on_entity( "scn_estate_furniture_knock_over" );
    var_0 maps\_utility::play_sound_on_entity( "scn_estate_furniture_slide" );
    var_0 maps\_utility::play_sound_on_entity( "scn_estate_furniture_slide" );
    wait 3;
    var_0 maps\_utility::play_sound_on_entity( "scn_estate_furniture_slide" );
    wait 4;
    var_0 maps\_utility::play_sound_on_entity( "scn_estate_furniture_slide" );
    wait 3;
    var_0 maps\_utility::play_sound_on_entity( "scn_estate_furniture_slide" );
    wait 5;
    var_0 maps\_utility::play_sound_on_entity( "scn_estate_furniture_slide" );
}

_id_C102()
{
    level waittill( "breaching_number_" + self.script_slowmo_breach );
    wait 2;
    self stalingradspawn();
}

_id_C8D2()
{
    self endon( "death" );
    self.pathrandompercent = 0;
    self.ignoresuppression = 1;
    self.grenadeammo = 0;

    if ( isdefined( self.script_delay ) )
    {
        self.goalradius = 128;
        wait(self.script_delay);
        self.goalradius = 1000;
    }

    thread _id_C893();

    if ( !isdefined( self.script_noteworthy ) )
        return;

    if ( self.script_noteworthy == "hunter" )
    {
        wait(randomfloatrange( 5, 10 ));
        self.goalradius = 10000;
    }

    if ( self.script_noteworthy == "ambusher" )
        self.combatmode = "ambush";
}

_id_C893()
{
    self endon( "death" );
    self.baseaccuracy = 0;
    wait 3;
    self.baseaccuracy = 1;
}

_id_B095( var_0 )
{
    var_1 = getentarray( "house_pre_breach", "script_noteworthy" );
    var_2 = getentarray( "house_post_breach", "script_noteworthy" );

    if ( !isdefined( var_0 ) || !var_0 )
    {
        common_scripts\utility::array_call( var_2, ::hide );
        common_scripts\utility::array_call( var_2, ::notsolid );
        level waittill( "breaching_number_3" );
    }

    thread common_scripts\_exploder::exploder( "livingroom_post_breach" );
    common_scripts\utility::array_call( var_1, ::hide );
    common_scripts\utility::array_call( var_1, ::notsolid );
    common_scripts\utility::array_call( var_2, ::show );
    common_scripts\utility::array_call( var_2, ::solid );
}

_id_B46F( var_0, var_1 )
{
    level waittill( var_1 );
    var_2 = getentarray( "breach_extraguy", "targetname" );

    foreach ( var_4 in var_2 )
    {
        if ( !isdefined( var_4.script_battleplan ) )
            continue;

        if ( var_4.script_battleplan == var_0 )
        {
            if ( var_4.script_namenumber == "mainfloor" )
                level._id_B8E8++;

            if ( var_4.script_namenumber == "topfloor" )
                level._id_B515++;

            if ( var_4.script_namenumber == "basement" )
                level._id_C6A2++;
        }
    }
}

_id_BC5F()
{
    var_0 = self.script_battleplan;
    level notify( var_0 );
}

_id_AF80( var_0, var_1, var_2 )
{
    level endon( var_0 );
    common_scripts\utility::flag_wait( var_2 );
    common_scripts\utility::flag_wait( "armory_breached" );
    common_scripts\utility::flag_set( var_1 );
}

_id_BAD0( var_0, var_1, var_2 )
{
    level endon( var_0 );
    thread _id_AF80( var_0, var_1, var_2 );
    common_scripts\utility::flag_wait( var_1 );
    var_3 = getspawnerarray();

    foreach ( var_5 in var_3 )
    {
        if ( !isdefined( var_5.script_battleplan ) )
            continue;

        if ( var_5.script_battleplan == var_0 )
        {
            if ( var_5.script_namenumber == "mainfloor" )
                level notify( "mainfloor_enemy_killed" );

            if ( var_5.script_namenumber == "topfloor" )
                level notify( "topfloor_enemy_killed" );

            if ( var_5.script_namenumber == "basement" )
                level notify( "basement_enemy_killed" );
        }

        wait 0.05;
    }
}

_id_B521( var_0, var_1, var_2, var_3 )
{
    var_4 = getentarray( var_0, "targetname" );
    var_4 = undefined;
    level endon( "house_interior_breaches_done" );

    if ( isdefined( var_1 ) )
        level endon( var_1 );

    level waittill( var_2 );
    var_5 = getent( var_0, "targetname" );
    var_5 waittill( "trigger" );
    thread _id_CC13( var_3 );
}

_id_CC13( var_0 )
{
    var_1 = [];
    var_1 = getspawnerarray();
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4.script_battleplan ) )
            continue;

        if ( var_4.script_battleplan == var_0 )
            var_2[var_2.size] = var_4;
    }

    common_scripts\utility::array_thread( var_2, maps\_utility::spawn_ai );
}

_id_AB05()
{
    var_0 = getentarray( "breach_extraguy", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.script_battleplan ) )
            continue;

        if ( var_2.script_battleplan == "breach0_bathroomrush" )
            var_2 thread maps\_utility::add_spawn_function( ::_id_C502 );
    }
}

_id_C502()
{
    thread maps\_utility::play_sound_on_entity( "est_ru1_attack" );
}

_id_B37B()
{
    level waittill( "breaching_number_0" );
    soundscripts\_snd::snd_message( "handle_breach_sequence", "breaching_number_0" );
    common_scripts\utility::flag_set( "foyer_breached_first" );
}

_id_D577()
{
    level waittill( "breaching_number_1" );
    soundscripts\_snd::snd_message( "handle_breach_sequence", "breaching_number_1" );
    common_scripts\utility::flag_set( "kitchen_breached_first" );
}

_id_BB0C()
{
    level waittill( "breaching_number_2" );
    soundscripts\_snd::snd_message( "handle_breach_sequence", "breaching_number_2" );
    common_scripts\utility::flag_set( "basement_breached_first" );
}

_id_CD4F()
{
    level common_scripts\utility::waittill_any( "breaching_number_0", "breaching_number_1", "breaching_number_2" );
    wait 2.5;
    var_0 = getaiarray( "allies" );
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
    {
        level._id_B4A3 getenemyinfo( var_3 );
        level._id_B224 getenemyinfo( var_3 );

        foreach ( var_5 in var_0 )
        {
            var_3 getenemyinfo( var_5 );
            var_3 getenemyinfo( level.player );
        }
    }
}

_id_BA5F( var_0 )
{
    if ( self.script_namenumber == "mainfloor" )
    {
        level._id_B8E8++;
        thread _id_CA1E( var_0 );
    }

    if ( self.script_namenumber == "topfloor" )
    {
        if ( isdefined( self.script_slowmo_breach ) )
        {
            if ( self.script_slowmo_breach != 5 )
                level._id_B515++;
        }
        else
            level._id_B515++;

        thread _id_CB6D( var_0 );
    }

    if ( self.script_namenumber == "basement" )
    {
        if ( isdefined( self.script_slowmo_breach ) )
        {
            if ( self.script_slowmo_breach != 3 && self.script_slowmo_breach != 4 )
                level._id_C6A2++;
        }
        else
            level._id_C6A2++;

        thread _id_C9A0( var_0 );
    }
}

_id_CA1E( var_0 )
{
    self waittill( "death" );
    level notify( "mainfloor_enemy_killed" );
    wait 0.05;

    if ( isdefined( var_0 ) )
        level notify( "mainfloor_enemy_killed" );
}

_id_CB6D( var_0 )
{
    self waittill( "death" );
    level notify( "topfloor_enemy_killed" );
    wait 0.05;

    if ( isdefined( var_0 ) )
        level notify( "topfloor_enemy_killed" );
}

_id_C9A0( var_0 )
{
    self waittill( "death" );
    level notify( "basement_enemy_killed" );
    wait 0.05;

    if ( isdefined( var_0 ) )
        level notify( "basement_enemy_killed" );
}

_id_B49F()
{
    common_scripts\utility::flag_wait( "house_exterior_has_been_breached" );
    wait 2.1;

    while ( level._id_B8E8 > 0 )
    {
        level waittill( "mainfloor_enemy_killed" );
        level._id_B8E8--;
    }

    common_scripts\utility::flag_set( "mainfloor_cleared" );
}

_id_D051()
{
    common_scripts\utility::flag_wait( "house_exterior_has_been_breached" );

    while ( level._id_B515 > 0 )
    {
        level waittill( "topfloor_enemy_killed" );
        level._id_B515--;
    }

    common_scripts\utility::flag_set( "topfloor_cleared" );
    thread common_scripts\utility::play_sound_in_space( "emt_grandfather_clock_ring", ( 485.389, 495.064, 242.834 ) );
}

_id_D154()
{
    common_scripts\utility::flag_wait( "house_exterior_has_been_breached" );

    while ( level._id_C6A2 > 0 )
    {
        level waittill( "basement_enemy_killed" );
        level._id_C6A2--;
    }

    common_scripts\utility::flag_set( "basement_cleared" );
}

_id_CD8C()
{
    level endon( "house_interior_breaches_done" );
    common_scripts\utility::flag_wait( "mainfloor_cleared" );
    common_scripts\utility::flag_set( "mainfloor_cleared_confirmed" );
}

_id_B3B7()
{
    common_scripts\utility::flag_wait( "topfloor_breached" );
    level._id_B4A3 maps\_utility::disable_ai_color();
    var_0 = getnode( "scarecrow_teleport_closer", "targetname" );
    level._id_B4A3 forceteleport( var_0.origin, var_0.angles );
    level._id_B4A3.goalradius = 32;
    level._id_B4A3.attackeraccuracy = 0;
    level._id_B4A3.ignorerandombulletdamage = 1;
    var_0 = getnode( "house_teleport_scarecrow", "targetname" );
    level._id_B4A3 setgoalnode( var_0 );
    common_scripts\utility::flag_wait( "topfloor_cleared" );
    common_scripts\utility::flag_set( "scripted_dialogue_on" );
    wait 2;
    common_scripts\utility::flag_waitopen( "dialogue_ghost_orders" );
    common_scripts\utility::flag_waitopen( "dialogue_basement_cleared" );
    common_scripts\utility::flag_set( "dialogue_topfloor_cleared" );
    maps\_utility::radio_dialogue( "est_scr_topfloor" );
    maps\_utility::radio_dialogue( "est_gst_topfloor" );
    common_scripts\utility::flag_set( "ghost_goes_outside" );
    common_scripts\utility::flag_clear( "scripted_dialogue_on" );
    common_scripts\utility::flag_clear( "dialogue_topfloor_cleared" );

    if ( !common_scripts\utility::flag( "basement_cleared" ) )
    {
        var_0 = getnode( "scarecrow_guard_basement1", "targetname" );
        level._id_B4A3 setgoalnode( var_0 );
    }
}

_id_CF51()
{
    common_scripts\utility::flag_wait( "basement_cleared" );
    wait 2;
    common_scripts\utility::flag_waitopen( "dialogue_ghost_orders" );
    common_scripts\utility::flag_waitopen( "dialogue_topfloor_cleared" );
    common_scripts\utility::flag_set( "dialogue_basement_cleared" );
    common_scripts\utility::flag_set( "scripted_dialogue_on" );
    maps\_utility::radio_dialogue( "est_scr_basement" );
    maps\_utility::radio_dialogue( "est_gst_basement" );
    common_scripts\utility::flag_clear( "scripted_dialogue_on" );
    common_scripts\utility::flag_clear( "dialogue_basement_cleared" );
    common_scripts\utility::flag_set( "basement_cleared_confirmed" );
}

_id_D4BA()
{
    level waittill( "breaching_number_5" );
    soundscripts\_snd::snd_message( "handle_breach_sequence", "breaching_number_5" );
    common_scripts\utility::flag_set( "topfloor_breached" );
    var_0 = getentarray( "window_clip", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();

    level._id_A818++;
}

_id_C5E1()
{
    level waittill( "breaching_number_3" );
    common_scripts\utility::flag_set( "basement_breached" );
    common_scripts\utility::flag_set( "armory_breached" );
    level._id_A818++;
}

_id_B753()
{
    level waittill( "breaching_number_4" );
    soundscripts\_snd::snd_message( "handle_breach_sequence", "breaching_number_4" );
    common_scripts\utility::flag_set( "basement_breached" );
    common_scripts\utility::flag_set( "guestroom_breached" );
    level._id_A818++;
}

_id_BCB2()
{
    level endon( "house_interior_breaches_done" );
    common_scripts\utility::flag_wait( "house_friendlies_instructions_given" );

    while ( !common_scripts\utility::flag( "topfloor_breached" ) )
    {
        var_0 = level._id_B8D7 sightconetrace( level.player.origin + ( 0.0, 0.0, 64.0 ) );

        if ( var_0 && common_scripts\utility::flag( "ghost_at_bottom_of_stairs" ) )
        {
            common_scripts\utility::flag_waitopen( "dialogue_ghost_orders" );
            common_scripts\utility::flag_waitopen( "dialogue_topfloor_cleared" );
            common_scripts\utility::flag_waitopen( "dialogue_basement_cleared" );

            if ( common_scripts\utility::flag( "scarecrow_said_upstairs" ) )
                wait 30;

            if ( !common_scripts\utility::flag( "topfloor_breached" ) )
            {
                common_scripts\utility::flag_set( "scripted_dialogue_on" );
                maps\_utility::radio_dialogue( "est_gst_lockedrooms" );
                common_scripts\utility::flag_clear( "scripted_dialogue_on" );
            }

            break;
        }

        wait 0.5;
    }
}

_id_CCA9()
{
    level endon( "house_interior_breaches_done" );
    common_scripts\utility::flag_wait( "basement_breached" );
    var_0 = getnode( "scarecrow_guard_basement2", "targetname" );
    level._id_B4A3 maps\_utility::disable_ai_color();
    level._id_B4A3 setgoalnode( var_0 );
    level._id_B4A3.goalradius = 16;
    level._id_B4A3 waittill( "goal" );

    if ( !common_scripts\utility::flag( "basement_cleared" ) )
    {
        common_scripts\utility::flag_waitopen( "dialogue_ghost_orders" );
        common_scripts\utility::flag_waitopen( "dialogue_topfloor_cleared" );
        common_scripts\utility::flag_waitopen( "dialogue_basement_cleared" );

        if ( !common_scripts\utility::flag( "basement_cleared" ) )
        {
            common_scripts\utility::flag_set( "scripted_dialogue_on" );
            maps\_utility::radio_dialogue( "est_scr_gotyourback" );
            common_scripts\utility::flag_clear( "scripted_dialogue_on" );
        }
    }

    if ( !common_scripts\utility::flag( "topfloor_breached" ) )
    {
        common_scripts\utility::flag_wait( "basement_cleared_confirmed" );

        if ( !common_scripts\utility::flag( "house_interior_breaches_done" ) )
        {
            while ( !common_scripts\utility::flag( "topfloor_breached" ) )
            {
                var_1 = level._id_B4A3 sightconetrace( level.player.origin + ( 0.0, 0.0, 64.0 ) );

                if ( var_1 )
                {
                    common_scripts\utility::flag_waitopen( "dialogue_ghost_orders" );
                    common_scripts\utility::flag_waitopen( "dialogue_topfloor_cleared" );
                    common_scripts\utility::flag_waitopen( "dialogue_basement_cleared" );
                    common_scripts\utility::flag_set( "scripted_dialogue_on" );
                    common_scripts\utility::flag_set( "scarecrow_said_upstairs" );
                    maps\_utility::radio_dialogue( "est_scr_getupstairs" );
                    common_scripts\utility::flag_clear( "scripted_dialogue_on" );
                    break;
                }

                wait 0.5;
            }
        }
    }
}

_id_D4C4()
{
    common_scripts\utility::flag_wait( "mainfloor_cleared" );
    common_scripts\utility::flag_wait( "topfloor_cleared" );
    wait 4;

    if ( !common_scripts\utility::flag( "house_interior_breaches_done" ) )
    {
        if ( !common_scripts\utility::flag( "basement_cleared" ) )
        {
            common_scripts\utility::flag_set( "scripted_dialogue_on" );
            level._id_B4A3.doorflashchance = 1;
            var_0 = getaiarray( "axis" );

            foreach ( var_2 in var_0 )
                level._id_B4A3 getenemyinfo( var_2 );

            common_scripts\utility::flag_waitopen( "dialogue_ghost_orders" );
            common_scripts\utility::flag_waitopen( "dialogue_topfloor_cleared" );
            common_scripts\utility::flag_waitopen( "dialogue_basement_cleared" );
            maps\_utility::radio_dialogue( "est_gst_checkbasement" );
            common_scripts\utility::flag_clear( "scripted_dialogue_on" );
        }
    }
}

_id_CB23()
{
    level endon( "house_interior_breaches_done" );
    common_scripts\utility::flag_wait( "mainfloor_cleared_confirmed" );
    common_scripts\utility::flag_set( "scripted_dialogue_on" );
    common_scripts\utility::flag_waitopen( "dialogue_topfloor_cleared" );
    common_scripts\utility::flag_waitopen( "dialogue_basement_cleared" );
    common_scripts\utility::flag_set( "dialogue_ghost_orders" );
    wait 2;
    var_0 = getnode( "ozone_guard_kitchen", "targetname" );
    level._id_B224 maps\_utility::disable_ai_color();
    level._id_B224 maps\_utility::follow_path( var_0 );

    if ( !common_scripts\utility::flag( "topfloor_breached" ) || !common_scripts\utility::flag( "basement_breached" ) )
    {
        var_1 = [];
        var_1[var_1.size] = "est_gst_thrukitchen";
        var_1[var_1.size] = "est_ozn_rogerthat";
        var_1[var_1.size] = "est_gst_sitrep";
        var_1[var_1.size] = "est_scr_noonesleaving";

        foreach ( var_4, var_3 in var_1 )
        {
            common_scripts\utility::flag_waitopen( "breaching_on" );
            maps\_utility::radio_dialogue( var_1[var_4] );
        }
    }

    common_scripts\utility::flag_clear( "scripted_dialogue_on" );
    common_scripts\utility::flag_clear( "dialogue_ghost_orders" );
    common_scripts\utility::flag_set( "house_friendlies_instructions_given" );
}

_id_B6F9()
{
    common_scripts\utility::flag_wait( "breaching_on" );
    level._id_B8D7.voice = "seal";
    level._id_B8D7.countryid = "NS";
    level._id_B4A3.voice = "seal";
    level._id_B4A3.countryid = "NS";
    level._id_B224.voice = "seal";
    level._id_B224.countryid = "NS";

    while ( !common_scripts\utility::flag( "all_enemies_killed_up_to_house_capture" ) )
    {
        maps\_utility::battlechatter_off( "allies" );
        maps\_utility::battlechatter_off( "axis" );
        common_scripts\utility::flag_waitopen( "breaching_on" );
        common_scripts\utility::flag_waitopen( "scripted_dialogue_on" );
        maps\_utility::battlechatter_on( "allies" );
        maps\_utility::battlechatter_on( "axis" );
        common_scripts\utility::flag_wait_any( "breaching_on", "scripted_dialogue_on" );
    }
}

_id_C6D1()
{
    if ( common_scripts\utility::flag( "all_enemies_killed_up_to_house_capture" ) )
        return;

    level endon( "all_enemies_killed_up_to_house_capture" );
    level common_scripts\utility::waittill_any( "breaching_number_0", "breaching_number_1", "breaching_number_2" );
    var_0 = getent( "house_clearing_autosave_trigger", "targetname" );

    for (;;)
    {
        if ( level._id_A818 > 0 )
        {
            if ( !common_scripts\utility::flag( "first_free_save" ) )
                level waittill( "slomo_breach_over" );

            var_0 waittill( "trigger" );
            maps\_utility::autosave_by_name( "nearDoorBreach_save" );
            common_scripts\utility::flag_clear( "first_free_save" );
            continue;
        }

        var_0 waittill( "trigger" );
        maps\_utility::autosave_by_name( "nearDoorBreach_save" );
        _id_C0E3();
        common_scripts\utility::flag_set( "first_free_save" );
        continue;
    }
}

_id_C0E3()
{
    level endon( "slomo_breach_over" );
    wait 30;
}

_id_B98A()
{
    common_scripts\utility::flag_set( "no_mercy" );
    level endon( "house_reset_ghost" );
    level common_scripts\utility::waittill_any( "breaching_number_0", "breaching_number_1", "breaching_number_2" );

    if ( common_scripts\utility::flag( "kitchen_breached_first" ) || common_scripts\utility::flag( "basement_breached_first" ) )
    {
        thread _id_D126();
        thread _id_D19B();
    }

    level._id_B8D7 maps\_utility::disable_ai_color();
    level._id_B8D7.attackeraccuracy = 0;
    level._id_B8D7.ignorerandombulletdamage = 1;
    level._id_B8D7 maps\_utility::disable_pain();
    level._id_B8D7 maps\_utility::disable_surprise();
    level._id_B8D7.disablebulletwhizbyreaction = 1;
    level._id_B8D7 maps\_utility::disable_arrivals();
    level._id_B8D7.dontmelee = 1;

    if ( common_scripts\utility::flag( "foyer_breached_first" ) )
    {
        level waittill( "sp_slowmo_breachanim_done" );
        level._id_B8D7.goalradius = 64;
        var_0 = getent( "ghost_slowmo_entry_teleport", "targetname" );
        level._id_B8D7 forceteleport( var_0.origin, var_0.angles );
        level._id_B8D7 maps\_utility::enable_heat_behavior( 1 );
        var_1 = getnode( "ghost_slowmo_entry", "targetname" );
        setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
        level._id_B8D7 setgoalnode( var_1 );
        level._id_B8D7 waittill( "goal" );
        wait 8;
    }
    else
    {
        common_scripts\utility::flag_wait( "ghost_begins_sweep" );
        level._id_B8D7 maps\_utility::delaythread( 3, maps\_utility::enable_heat_behavior, 1 );
    }

    var_1 = getnode( "ghost_house_sweep", "targetname" );
    var_2 = 0;

    for (;;)
    {
        level._id_B8D7 setgoalnode( var_1 );
        level._id_B8D7 waittill( "goal" );
        setsaveddvar( "ai_friendlyFireBlockDuration", "2000" );

        if ( var_2 == 0 )
        {
            wait 4;
            level._id_B8D7.goalradius = 32;
        }

        if ( var_2 == 1 )
        {
            wait 0.5;
            common_scripts\utility::flag_set( "scripted_dialogue_on" );
            common_scripts\utility::flag_waitopen( "dialogue_ghost_orders" );
            common_scripts\utility::flag_waitopen( "dialogue_topfloor_cleared" );
            common_scripts\utility::flag_waitopen( "dialogue_basement_cleared" );
            maps\_utility::radio_dialogue( "est_gst_officeclear" );
            wait 0.5;
            common_scripts\utility::flag_waitopen( "dialogue_ghost_orders" );
            common_scripts\utility::flag_waitopen( "dialogue_topfloor_cleared" );
            common_scripts\utility::flag_waitopen( "dialogue_basement_cleared" );
            maps\_utility::delaythread( 1, maps\_utility::radio_dialogue, "est_gst_letsgo2" );
            common_scripts\utility::flag_clear( "scripted_dialogue_on" );
        }

        if ( var_2 == 2 )
            level._id_B8D7 clearenemy();

        var_2++;

        if ( var_2 == 4 )
        {
            wait 0.25;
            level._id_B8D7 clearenemy();
            common_scripts\utility::flag_waitopen( "dialogue_ghost_orders" );
            common_scripts\utility::flag_waitopen( "dialogue_topfloor_cleared" );
            common_scripts\utility::flag_waitopen( "dialogue_basement_cleared" );
            common_scripts\utility::flag_set( "scripted_dialogue_on" );
            maps\_utility::radio_dialogue( "est_gst_diningroomclr" );
            common_scripts\utility::flag_clear( "scripted_dialogue_on" );
        }

        if ( var_2 == 5 )
        {
            level._id_B8D7 maps\_utility::disable_heat_behavior();
            level._id_B8D7 maps\_utility::enable_arrivals();
        }

        if ( isdefined( var_1.target ) )
        {
            var_1 = getnode( var_1.target, "targetname" );
            continue;
        }

        break;
    }

    var_3 = getent( "ghost_fake_lookat", "targetname" );
    level._id_B8D7 maps\_utility::cqb_aim( var_3 );
    common_scripts\utility::flag_set( "ghost_at_bottom_of_stairs" );
    common_scripts\utility::flag_wait( "topfloor_cleared" );

    if ( !common_scripts\utility::flag( "ghost_goes_outside" ) )
        wait 9.5;

    var_1 = getnode( "ghost_cover_front", "targetname" );
    level._id_B8D7 setgoalnode( var_1 );
}

_id_D126()
{
    level endon( "house_reset_ghost" );
    wait 30;
    common_scripts\utility::flag_set( "ghost_begins_sweep" );
}

_id_D19B()
{
    level endon( "house_reset_ghost" );
    var_0 = getent( "ghost_manual_trig", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "ghost_begins_sweep" );
}

_id_C8F0()
{
    level common_scripts\utility::waittill_any( "breaching_number_0", "breaching_number_1", "breaching_number_2" );
    level common_scripts\utility::waittill_any( "breaching_number_3", "breaching_number_4", "breaching_number_5" );
    level common_scripts\utility::waittill_any( "breaching_number_3", "breaching_number_4", "breaching_number_5" );
    level common_scripts\utility::waittill_any( "breaching_number_3", "breaching_number_4", "breaching_number_5" );
    level notify( "house_reset_ghost" );
    level._id_B8D7 maps\_utility::enable_ai_color();
}

_id_BBB6()
{
    var_0 = getentarray( "solar_panel", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = getent( var_2.target, "targetname" );
        var_3 linkto( var_2 );
    }

    common_scripts\utility::array_thread( var_0, ::_id_C999 );
}

_id_C999()
{
    common_scripts\utility::flag_wait( "forestfight_littlebird_1" );
    wait 3;
    self rotateyaw( -95, 60, 3, 3 );
}

_id_D002()
{
    switch ( level.start_point )
    {
        case "ambush":
        case "house_approach":
        case "house_breach":
        case "default":
        case "forestfight":
            common_scripts\utility::flag_wait( "start_ambush_music" );
            var_0 = maps\_utility::musiclength( "mus_estate_ambushfight" );
            maps\_utility::music_loop( "mus_estate_ambushfight", var_0 );
            common_scripts\utility::flag_wait( "all_enemies_killed_up_to_house_capture" );
            level notify( "stop_music" );
            musicstop( 5 );
            wait 5.1;
        case "house_briefing":
            var_0 = maps\_utility::musiclength( "mus_estate_basement_clear" );
            maps\_utility::music_loop( "mus_estate_basement_clear", var_0 );
            common_scripts\utility::flag_wait( "download_started" );
            level notify( "stop_music" );
            musicstop( 6 );
            wait 6.1;
        case "house_defense":
            maps\_utility::musicplaywrapper( "mus_estate_dsm_wait" );
            common_scripts\utility::flag_wait( "download_complete" );
            musicstop( 1 );
            wait 1.1;
        case "escape":
            var_0 = maps\_utility::musiclength( "mus_estate_escape" );
            maps\_utility::music_loop( "mus_estate_escape", var_0 );
            common_scripts\utility::flag_wait( "finish_line" );
            level notify( "stop_music" );
            musicstop();
        case "ending":
            common_scripts\utility::flag_wait( "begin_ending_music" );
            wait 9;
            maps\_utility::musicplaywrapper( "mus_estate_betrayal" );
            break;
    }
}

_id_AF25( var_0 )
{
    iprintln( var_0 );
}

_id_BB28()
{
    level._id_B8E7 = undefined;
    var_0 = getentarray( "zone_trigger", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_B0A9 );
}

_id_B0A9()
{
    var_0 = 0;

    for (;;)
    {
        self waittill( "trigger" );
        level._id_B8E7 = self.targetname;
    }
}

_id_B575()
{
    level endon( "main_defense_fight_finished" );
    level endon( "player_is_escaping" );
    common_scripts\utility::flag_wait( "defense_battle_begins" );
    level._id_C474 = 0;
    level._id_BC9D = 14;
    level._id_B745 = 0;
    level._id_C898 = 1;
    level._id_CC97 = undefined;
    level._id_CD63 = [];
    _id_B25B( "zone_backsolarpanelfield", ::_id_CC53 );
    _id_B25B( "zone_backsolarpanelfield", ::_id_C0A0 );
    _id_B25B( "zone_backsolarpanelfield", ::_id_D2CD );
    _id_B25B( "zone_backsolarpanelfield", ::_id_BB03 );

    if ( getdvarint( "debug_estate_siege" ) == 1 )
        _id_B25B( "zone_backsolarpanelfield", ::_id_D015 );
    else
    {
        _id_B25B( "zone_backyardshed", ::_id_CC53 );
        _id_B25B( "zone_backyardshed", ::_id_C0A0 );
        _id_B25B( "zone_backyardshed", ::_id_D2CD );
        _id_B25B( "zone_backyardshed", ::_id_D015 );
        _id_B25B( "zone_backyardshed", ::_id_BB03 );
        _id_B25B( "zone_stables", ::_id_CC53 );
        _id_B25B( "zone_stables", ::_id_C0A0 );
        _id_B25B( "zone_stables", ::_id_D2CD );
        _id_B25B( "zone_stables", ::_id_D015 );
        _id_B25B( "zone_stables", ::_id_BB03 );
        _id_B25B( "zone_birchfield", ::_id_CC53 );
        _id_B25B( "zone_birchfield", ::_id_D2CD );
        _id_B25B( "zone_birchfield", ::_id_D015 );
        _id_B25B( "zone_birchfield", ::_id_BB03 );
        _id_B25B( "zone_forest", ::_id_CC53 );
        _id_B25B( "zone_forest", ::_id_C0A0 );
        _id_B25B( "zone_forest", ::_id_BB03 );
        _id_B25B( "zone_frontsolarpanels", ::_id_CC53 );
        _id_B25B( "zone_frontsolarpanels", ::_id_C0A0 );
        _id_B25B( "zone_frontsolarpanels", ::_id_BB03 );
        _id_B25B( "zone_backyardpond", ::_id_CC53 );
        _id_B25B( "zone_backyardpond", ::_id_C0A0 );
        _id_B25B( "zone_backyardpond", ::_id_D2CD );
        _id_B25B( "zone_backyardpond", ::_id_BB03 );
        _id_B25B( "zone_house", ::_id_CC53 );
        _id_B25B( "zone_house", ::_id_C0A0 );
        _id_B25B( "zone_house", ::_id_D2CD );
        _id_B25B( "zone_house", ::_id_D015 );
        _id_B25B( "zone_house", ::_id_BB03 );
        _id_B25B( "zone_parkinglot", ::_id_CC53 );
        _id_B25B( "zone_parkinglot", ::_id_C0A0 );
        _id_B25B( "zone_parkinglot", ::_id_D2CD );
        _id_B25B( "zone_parkinglot", ::_id_BB03 );
        _id_B25B( "zone_porchtriangle", ::_id_CC53 );
        _id_B25B( "zone_porchtriangle", ::_id_C0A0 );
        _id_B25B( "zone_porchtriangle", ::_id_D2CD );
        _id_B25B( "zone_porchtriangle", ::_id_D015 );
        _id_B25B( "zone_porchtriangle", ::_id_BB03 );
        _id_B25B( "zone_porch", ::_id_CC53 );
        _id_B25B( "zone_porch", ::_id_C0A0 );
        _id_B25B( "zone_porch", ::_id_D2CD );
        _id_B25B( "zone_porch", ::_id_D015 );
        _id_B25B( "zone_porch", ::_id_BB03 );
        _id_B25B( "zone_frontyardwedge", ::_id_CC53 );
        _id_B25B( "zone_frontyardwedge", ::_id_C0A0 );
        _id_B25B( "zone_frontyardwedge", ::_id_D2CD );
        _id_B25B( "zone_frontyardwedge", ::_id_BB03 );
        _id_B25B( "zone_frontyardhigh", ::_id_CC53 );
        _id_B25B( "zone_frontyardhigh", ::_id_C0A0 );
        _id_B25B( "zone_frontyardhigh", ::_id_D2CD );
        _id_B25B( "zone_frontyardhigh", ::_id_D015 );
        _id_B25B( "zone_frontyardhigh", ::_id_BB03 );
        _id_B25B( "zone_backpatio", ::_id_CC53 );
        _id_B25B( "zone_backpatio", ::_id_C0A0 );
        _id_B25B( "zone_backpatio", ::_id_D2CD );
        _id_B25B( "zone_backpatio", ::_id_D015 );
        _id_B25B( "zone_backpatio", ::_id_BB03 );
        _id_B25B( "zone_beach", ::_id_CC53 );
        _id_B25B( "zone_beach", ::_id_C0A0 );
        _id_B25B( "zone_beach", ::_id_D2CD );
        _id_B25B( "zone_beach", ::_id_D015 );
        _id_B25B( "zone_boathouse", ::_id_CC53 );
        _id_B25B( "zone_boathouse", ::_id_C0A0 );
        _id_B25B( "zone_boathouse", ::_id_D2CD );
        _id_B25B( "zone_boathouse", ::_id_D015 );
    }

    level._id_BDD5 = [];
    _id_D0DD( "zone_backsolarpanelfield", ::_id_CAB6 );
    _id_D0DD( "zone_backsolarpanelfield", ::_id_BF64 );
    _id_D0DD( "zone_backsolarpanelfield", ::_id_CEF0 );

    if ( getdvarint( "debug_estate_siege" ) != 1 )
    {
        _id_D0DD( "zone_backyardshed", ::_id_CAB6 );
        _id_D0DD( "zone_backyardshed", ::_id_BF64 );
        _id_D0DD( "zone_stables", ::_id_BF64 );
        _id_D0DD( "zone_birchfield", ::_id_BF64 );
        _id_D0DD( "zone_birchfield", ::_id_CEF0 );
        _id_D0DD( "zone_forest", ::_id_CAB6 );
        _id_D0DD( "zone_forest", ::_id_BF64 );
        _id_D0DD( "zone_forest", ::_id_CEF0 );
        _id_D0DD( "zone_frontsolarpanels", ::_id_CAB6 );
        _id_D0DD( "zone_frontsolarpanels", ::_id_BF64 );
        _id_D0DD( "zone_frontsolarpanels", ::_id_CEF0 );
        _id_D0DD( "zone_backyardpond", ::_id_BF64 );
        _id_D0DD( "zone_backyardpond", ::_id_CEF0 );
        _id_D0DD( "zone_house", ::_id_CAB6 );
        _id_D0DD( "zone_house", ::_id_BF64 );
        _id_D0DD( "zone_house", ::_id_CEF0 );
        _id_D0DD( "zone_parkinglot", ::_id_CAB6 );
        _id_D0DD( "zone_parkinglot", ::_id_BF64 );
        _id_D0DD( "zone_parkinglot", ::_id_CEF0 );
        _id_D0DD( "zone_porchtriangle", ::_id_CAB6 );
        _id_D0DD( "zone_porchtriangle", ::_id_BF64 );
        _id_D0DD( "zone_porchtriangle", ::_id_CEF0 );
        _id_D0DD( "zone_porch", ::_id_CAB6 );
        _id_D0DD( "zone_porch", ::_id_BF64 );
        _id_D0DD( "zone_porch", ::_id_CEF0 );
        _id_D0DD( "zone_frontyardwedge", ::_id_CAB6 );
        _id_D0DD( "zone_frontyardwedge", ::_id_BF64 );
        _id_D0DD( "zone_frontyardwedge", ::_id_CEF0 );
        _id_D0DD( "zone_frontyardhigh", ::_id_CAB6 );
        _id_D0DD( "zone_frontyardhigh", ::_id_BF64 );
        _id_D0DD( "zone_frontyardhigh", ::_id_CEF0 );
        _id_D0DD( "zone_backpatio", ::_id_CAB6 );
        _id_D0DD( "zone_beach", ::_id_CAB6 );
        _id_D0DD( "zone_boathouse", ::_id_CAB6 );
    }

    level._id_B745 = 0;
    var_0 = getent( "no_autosave_in_basement", "targetname" );
    var_1 = level._id_CA86 * 0.7;

    for (;;)
    {
        var_2 = level._id_B8E7;

        if ( getdvarint( "debug_estate_siege" ) == 1 )
            var_2 = "zone_backsolarpanelfield";

        _id_CFEE( var_2 );
        var_3 = getent( "dsm", "targetname" );

        if ( isdefined( var_3 ) )
        {
            var_4 = length( level.player.origin - var_3.origin );

            if ( common_scripts\utility::flag( "can_save" ) && var_4 <= level._id_AE20 )
            {
                if ( !level.player istouching( var_0 ) && level._id_D526 >= var_1 )
                    maps\_utility::autosave_by_name( "strikePackageCleared" );
            }
        }

        while ( level._id_B745 > level._id_C474 )
            level waittill( "counterattacker_died" );

        common_scripts\utility::flag_set( "activate_package_on_standby" );

        foreach ( var_2, var_6 in level._id_CD63 )
        {
            if ( level._id_CD63[var_2].size <= 0 )
                level._id_CD63[var_2] = undefined;
        }

        wait 10;

        if ( level._id_CD63.size <= 0 )
            break;

        common_scripts\utility::flag_wait( "strike_package_spawned" );
        common_scripts\utility::flag_clear( "strike_package_spawned" );

        while ( level._id_B745 > level._id_BC9D )
            level waittill( "counterattacker_died" );

        if ( !isdefined( level._id_CC97 ) )
            level._id_CC97 = 30;

        _id_B4B9();
        wait 1;
    }
}

_id_B4B9()
{
    level endon( "main_defense_fight_finished" );
    level endon( "player_is_escaping" );
    var_0 = 0;
    var_1 = undefined;
    thread _id_C431();

    while ( level._id_CC97 > 0 )
    {
        foreach ( var_4, var_3 in level._id_BDD5 )
        {
            if ( level._id_BDD5[var_4].size <= 0 )
                level._id_BDD5[var_4] = undefined;
        }

        if ( level._id_BDD5.size <= 0 )
        {
            level notify( "stop_timeout" );
            break;
        }

        var_4 = level._id_B8E7;

        if ( getdvarint( "debug_estate_siege" ) == 1 )
            var_4 = "zone_backsolarpanelfield";

        var_1 = _id_A827( var_4 );

        if ( isdefined( var_1 ) && var_1 )
        {
            common_scripts\utility::flag_wait( "strike_component_activated" );
            common_scripts\utility::flag_clear( "strike_component_activated" );
            var_0++;

            while ( level._id_B745 > level._id_A861 )
                level waittill( "counterattacker_died" );

            common_scripts\utility::flag_set( "activate_component_on_standby" );
        }

        if ( var_0 >= level._id_C898 )
        {
            level notify( "stop_timeout" );
            break;
        }

        wait(randomfloatrange( 2, 8 ));
    }
}

_id_C431()
{
    level endon( "main_defense_fight_finished" );
    level endon( "player_is_escaping" );
    level endon( "stop_timeout" );

    while ( level._id_CC97 > 0 )
    {
        wait 1;
        level._id_CC97--;
    }
}

_id_B25B( var_0, var_1 )
{
    level endon( "main_defense_fight_finished" );
    level endon( "player_is_escaping" );

    if ( !isdefined( level._id_CD63[var_0] ) )
        level._id_CD63[var_0] = [];

    level._id_CD63[var_0][level._id_CD63[var_0].size] = var_1;
}

_id_CFEE( var_0 )
{
    level endon( "main_defense_fight_finished" );
    level endon( "player_is_escaping" );
    var_1 = getdvarint( "debug_estate_forceStrike" );

    if ( getdvarint( "debug_estate_siege" ) != 1 )
    {
        if ( !isdefined( level._id_CD63[var_0] ) )
            return 0;

        if ( !level._id_CD63[var_0].size )
        {
            level._id_CD63[var_0] = undefined;
            return 0;
        }

        var_2 = common_scripts\utility::random( level._id_CD63[var_0] );
    }
    else
    {
        if ( !isdefined( level._id_C3AD ) )
            level._id_C3AD = 0;

        if ( var_1 > 0 && var_1 <= level._id_CD63[var_0].size )
            level._id_C3AD = var_1 - 1;

        if ( level._id_C3AD >= level._id_CD63[var_0].size )
            return 0;

        var_2 = level._id_CD63[var_0][level._id_C3AD];
        level._id_C3AD++;
    }

    thread [[ var_2 ]]();
    common_scripts\utility::flag_set( "strike_packages_definitely_underway" );

    if ( !var_1 )
    {
        foreach ( var_0, var_4 in level._id_CD63 )
        {
            foreach ( var_7, var_6 in var_4 )
            {
                if ( var_6 == var_2 )
                    level._id_CD63[var_0][var_7] = undefined;
            }
        }
    }

    return 1;
}

_id_D0DD( var_0, var_1 )
{
    level endon( "main_defense_fight_finished" );
    level endon( "player_is_escaping" );

    if ( !isdefined( level._id_BDD5[var_0] ) )
        level._id_BDD5[var_0] = [];

    level._id_BDD5[var_0][level._id_BDD5[var_0].size] = var_1;
}

_id_A827( var_0 )
{
    level endon( "main_defense_fight_finished" );
    level endon( "player_is_escaping" );

    if ( !isdefined( level._id_BDD5[var_0] ) )
        return 0;

    if ( !level._id_BDD5[var_0].size )
    {
        level._id_BDD5[var_0] = undefined;
        return 0;
    }

    if ( getdvarint( "debug_estate_siege" ) != 1 )
        var_1 = common_scripts\utility::random( level._id_BDD5[var_0] );
    else
    {
        if ( !isdefined( level._id_C708 ) )
            level._id_C708 = 0;

        var_1 = level._id_BDD5[var_0][level._id_C708];
        level._id_C708++;
    }

    thread [[ var_1 ]]();

    foreach ( var_0, var_3 in level._id_BDD5 )
    {
        foreach ( var_6, var_5 in var_3 )
        {
            if ( var_5 == var_1 )
                level._id_BDD5[var_0][var_6] = undefined;
        }
    }

    return 1;
}

_id_B569()
{
    common_scripts\utility::flag_wait( "download_complete" );
    maps\_utility::autosave_by_name( "download_done" );

    if ( !common_scripts\utility::flag( "dsm_recovered" ) )
        thread _id_B445();

    if ( common_scripts\utility::flag( "skip_defense" ) )
        wait 3;

    level._id_B8D7.baseaccuracy = 1000;
    common_scripts\utility::flag_wait( "dsm_recovered" );
    soundscripts\_snd::snd_message( "aud_start_escape_mix" );
    maps\_utility::autosave_by_name( "birchfield_exfil_started" );
    wait 3;
    maps\_utility::radio_dialogue( "est_shp_almostatlz" );
    level._id_B8D7 thread maps\_utility::dialogue_queue( "est_gst_onourway" );
    wait 2;
    level.fixednodesaferadius_default = 64;
    level._id_B8D7 maps\_utility::enable_ai_color();

    if ( isalive( level._id_B224 ) )
        level._id_B224 maps\_utility::enable_ai_color();

    if ( isalive( level._id_B4A3 ) )
        level._id_B4A3 maps\_utility::enable_ai_color();

    var_0 = getent( "ghost_exfil", "targetname" );
    var_0 notify( "trigger" );
    common_scripts\utility::flag_wait( "point_of_no_return" );
    maps\_utility::autosave_by_name( "point_of_no_return" );
    thread _id_D301::_id_AADA( "2" );
    thread _id_C28F();
    thread _id_C158();
    level._id_B8D7 thread maps\_utility::dialogue_queue( "est_gst_bracketing" );
    wait 1;
}

_id_B445()
{
    level endon( "dsm_recovered" );
    var_0 = 7;

    for (;;)
    {
        wait 2;
        maps\_utility::radio_dialogue( "est_gst_dsmcomplete" );
        wait(var_0);

        if ( var_0 < 30 )
            var_0 *= 2;

        maps\_utility::radio_dialogue( "est_gst_getouttahere" );
    }
}

_id_C28F()
{
    level endon( "finish_line" );
    common_scripts\utility::flag_wait( "player_retreated_into_birchfield" );
    thread _id_AF72();
}

_id_C158()
{
    level endon( "finish_line" );
    var_0 = getentarray( "ghost_covering_shout", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_B92F();

    wait 9;
    level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_gettothelz" );
}

_id_B92F()
{
    self waittill( "trigger" );

    if ( !common_scripts\utility::flag( "ghost_covered_player" ) )
    {
        common_scripts\utility::flag_set( "ghost_covered_player" );
        level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_gotyoucovered" );
        level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_keepmoving" );
    }
    else
    {
        level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_illcoveryou" );
        level._id_B8D7 maps\_utility::dialogue_queue( "est_gst_gogo" );
    }
}

_id_A834()
{
    common_scripts\utility::flag_wait( "finish_line" );
    level.player enabledeathshield( 1 );
    level.cover_warnings_disabled = 1;
    level.player freezecontrols( 1 );
    var_0 = _id_B498();
    playfx( level._effect["mortar"]["dirt"], var_0 );
    var_1 = spawn( "script_origin", var_0 );
    var_1 playsound( "clusterbomb_explode_default" );
    level.player playrumblelooponentity( "artillery_rumble" );
    wait 0.15;
    common_scripts\utility::flag_set( "play_ending_sequence" );
    level.player freezecontrols( 0 );
    musicstop();
}

_id_AF72()
{
    var_0 = _id_B498();
    playfx( level._effect["mortar"]["dirt"], var_0 );
    level.player playrumblelooponentity( "artillery_rumble" );
    wait 0.15;
    level.player kill();
}

_id_CC53()
{
    common_scripts\utility::flag_waitopen( "strike_package_birchfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_solarfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_md500rush_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_stables_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_southwest_dialogue" );
    common_scripts\utility::flag_waitopen( "scarecrow_death_dialogue" );
    common_scripts\utility::flag_waitopen( "ozone_death_dialogue" );
    common_scripts\utility::flag_waitopen( "sniper_breaktime_dialogue" );
    common_scripts\utility::flag_set( "strike_package_bighelidrop_dialogue" );
    level._id_C474 = 2;
    level._id_CC97 = 90;
    common_scripts\utility::flag_wait( "activate_package_on_standby" );
    common_scripts\utility::flag_clear( "activate_package_on_standby" );

    if ( !common_scripts\utility::flag( "dsm_recovered" ) )
        thread _id_B289();

    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_phoenix_01" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_phoenix_02" );
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_phoenix_03" );
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_phoenix_04" );
    thread _id_B335( var_0, "heli_phoenix_01" );
    thread _id_B335( var_1, "heli_phoenix_02" );
    thread _id_B335( var_2, "heli_phoenix_03" );
    thread _id_B335( var_3, "heli_phoenix_04" );
    wait 3;
    common_scripts\utility::flag_set( "strike_package_spawned" );
}

_id_B289()
{
    maps\_utility::radio_dialogue( "est_snp1_mainroad" );
    maps\_utility::radio_dialogue( "est_snp1_15seconds" );
    maps\_utility::radio_dialogue( "est_gst_15seconds" );
    common_scripts\utility::flag_clear( "strike_package_bighelidrop_dialogue" );
}

_id_C0A0()
{
    common_scripts\utility::flag_waitopen( "strike_package_bighelidrop_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_solarfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_md500rush_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_stables_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_southwest_dialogue" );
    common_scripts\utility::flag_waitopen( "scarecrow_death_dialogue" );
    common_scripts\utility::flag_waitopen( "ozone_death_dialogue" );
    common_scripts\utility::flag_waitopen( "sniper_breaktime_dialogue" );
    common_scripts\utility::flag_set( "strike_package_birchfield_dialogue" );
    level._id_C474 = 10;
    level._id_CC97 = 120;
    common_scripts\utility::flag_wait( "activate_package_on_standby" );
    common_scripts\utility::flag_clear( "activate_package_on_standby" );

    if ( !common_scripts\utility::flag( "dsm_recovered" ) )
        thread _id_AF10();

    var_0 = common_scripts\utility::getstructarray( "chainlink_fence_detonator", "targetname" );

    foreach ( var_2 in var_0 )
    {
        wait(randomfloatrange( 0.25, 1 ));
        playfx( common_scripts\utility::getfx( "fenceblast" ), var_2.origin );
        var_3 = spawn( "script_origin", var_2.origin );
        var_3 playsound( "clusterbomb_explode_default" );
        earthquake( 0.25, 1, level.player.origin, 2000 );
    }

    if ( !common_scripts\utility::flag( "fence_removed" ) )
    {
        var_5 = getent( "final_area_fence", "targetname" );
        var_5 delete();
        common_scripts\utility::flag_set( "fence_removed" );
    }

    var_6 = getentarray( "broken_fence", "targetname" );

    foreach ( var_8 in var_6 )
        var_8 show();

    _id_B8E1( "birchfield_smokeassault_leftflank", ::_id_B5F6 );
    _id_B8E1( "birchfield_smokeassault_rightflank", ::_id_B16C );
    _id_B8E1( "birchfield_smokeassault_centersupport", ::_id_D32F );
    wait 3;
    common_scripts\utility::flag_set( "strike_package_spawned" );
}

_id_AF10()
{
    wait 2;

    if ( isalive( level._id_B4A3 ) )
        maps\_utility::radio_dialogue( "est_scr_whatwasthat" );

    maps\_utility::radio_dialogue( "est_snp1_hostilesse" );
    maps\_utility::radio_dialogue( "est_snp1_thinemout" );

    if ( isalive( level._id_B4A3 ) || isalive( level._id_B224 ) )
        maps\_utility::radio_dialogue( "est_gst_fieldtose" );

    if ( isalive( level._id_B224 ) )
        maps\_utility::radio_dialogue( "est_ozn_eyeson" );

    common_scripts\utility::flag_clear( "strike_package_birchfield_dialogue" );
}

_id_B5F6()
{
    self endon( "death" );
    var_0 = randomfloatrange( 0.5, 2 );
    var_1 = 256;
    var_2 = 128;
    var_3 = 0.5;
    var_4 = 0.5;
    var_5 = "player_is_escaping";
    var_6 = getnodearray( "birchfield_smokeassault_2a", "targetname" );

    if ( !common_scripts\utility::flag( "player_is_escaping" ) )
        _id_CF1C( var_6, var_0, var_1, var_2, var_3, var_4, var_5 );

    _id_B57F();
}

_id_B16C()
{
    self endon( "death" );
    var_0 = randomfloatrange( 0.5, 2 );
    var_1 = 256;
    var_2 = 128;
    var_3 = 0.5;
    var_4 = 0.5;
    var_5 = "player_is_escaping";
    var_6 = getnodearray( "birchfield_smokeassault_1a", "targetname" );

    if ( !common_scripts\utility::flag( "player_is_escaping" ) )
        _id_CF1C( var_6, var_0, var_1, var_2, var_3, var_4, var_5 );

    _id_B57F();
}

_id_D32F()
{
    self endon( "death" );
    var_0 = randomfloatrange( 2, 4 );
    var_1 = 2100;
    var_2 = 1000;
    var_3 = 0.85;
    var_4 = 10;
    var_5 = "player_is_escaping";
    var_6 = getnodearray( "birchfield_smokeassault_3a", "targetname" );

    if ( !common_scripts\utility::flag( "player_is_escaping" ) )
        _id_CF1C( var_6, var_0, var_1, var_2, var_3, var_4, var_5 );

    _id_B57F();
}

_id_BB03()
{
    common_scripts\utility::flag_waitopen( "strike_package_bighelidrop_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_birchfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_solarfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_md500rush_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_stables_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_southwest_dialogue" );
    common_scripts\utility::flag_waitopen( "scarecrow_death_dialogue" );
    common_scripts\utility::flag_waitopen( "ozone_death_dialogue" );
    common_scripts\utility::flag_waitopen( "sniper_breaktime_dialogue" );
    common_scripts\utility::flag_set( "strike_package_boathouse_dialogue" );
    level._id_C474 = 12;
    level._id_CC97 = 45;

    if ( !common_scripts\utility::flag( "dsm_recovered" ) )
        thread _id_ACD6();

    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "boathouse_md500" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "boathouse_mi17" );
    thread _id_B335( var_0, "boathouse_md500" );
    thread _id_B335( var_1, "boathouse_mi17" );
    wait 3;
    common_scripts\utility::flag_set( "strike_package_spawned" );
}

_id_ACD6()
{
    wait 5;
    maps\_utility::radio_dialogue( "est_snp1_troopswest" );
    maps\_utility::radio_dialogue( "est_gst_boathouse" );

    if ( isalive( level._id_B224 ) )
    {
        maps\_utility::radio_dialogue( "est_ozn_249sandrpgs" );
        maps\_utility::radio_dialogue( "est_gst_cutemdown" );
    }

    common_scripts\utility::flag_clear( "strike_package_boathouse_dialogue" );
}

_id_D015()
{
    common_scripts\utility::flag_waitopen( "strike_package_bighelidrop_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_birchfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_md500rush_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_stables_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_southwest_dialogue" );
    common_scripts\utility::flag_waitopen( "scarecrow_death_dialogue" );
    common_scripts\utility::flag_waitopen( "ozone_death_dialogue" );
    common_scripts\utility::flag_waitopen( "sniper_breaktime_dialogue" );
    common_scripts\utility::flag_set( "strike_package_solarfield_dialogue" );
    level._id_C474 = 17;
    level._id_CC97 = 60;
    common_scripts\utility::flag_wait( "activate_package_on_standby" );
    common_scripts\utility::flag_clear( "activate_package_on_standby" );

    if ( !common_scripts\utility::flag( "dsm_recovered" ) )
        thread _id_AC0C();

    _id_B8E1( "solarfield_pkg_openground", ::_id_CD61 );
    _id_B8E1( "solarfield_pkg_forest", ::_id_D2E6 );
    thread _id_BCA0( "solarfield_pkg_smokepot" );
    wait 3;
    common_scripts\utility::flag_set( "strike_package_spawned" );
}

_id_AC0C()
{
    level endon( "dsm_recovered" );
    maps\_utility::radio_dialogue( "est_snp1_additionalhostile" );
    maps\_utility::radio_dialogue( "est_gst_solarpanelseast" );

    if ( isalive( level._id_B4A3 ) )
        maps\_utility::radio_dialogue( "est_scr_comethrutrees" );

    var_0 = level.player getweaponammostock( "claymore" );

    if ( level.gameskill < 2 && !common_scripts\utility::flag( "claymore_hint_printed" ) && var_0 > 4 )
    {
        common_scripts\utility::flag_set( "claymore_hint_printed" );
        level.player thread maps\_utility::display_hint( "claymore_hint" );
    }

    maps\_utility::radio_dialogue( "est_gst_easttrail" );
    common_scripts\utility::flag_clear( "strike_package_solarfield_dialogue" );
}

_id_CD61()
{
    self endon( "death" );
    var_0 = randomfloatrange( 0.5, 2 );
    var_1 = 2400;
    var_2 = 1200;
    var_3 = 0.8;
    var_4 = 0.7;
    var_5 = "player_is_escaping";
    var_6 = getnodearray( "solarfield_pkg_route_1a", "targetname" );

    if ( !common_scripts\utility::flag( "player_is_escaping" ) )
        _id_CF1C( var_6, var_0, var_1, var_2, var_3, var_4, var_5 );

    _id_B57F();
}

_id_D2E6()
{
    self endon( "death" );
    maps\_utility::enable_cqbwalk();
    var_0 = randomfloatrange( 0.5, 2 );
    var_1 = 1000;
    var_2 = 800;
    var_3 = 0.9;
    var_4 = 5;
    var_5 = "player_is_escaping";
    var_6 = getnodearray( "solarfield_pkg_route_2a", "targetname" );

    if ( !common_scripts\utility::flag( "player_is_escaping" ) )
        _id_CF1C( var_6, var_0, var_1, var_2, var_3, var_4, var_5 );

    wait 10;
    _id_B57F();
}

_id_D2CD()
{
    common_scripts\utility::flag_waitopen( "strike_package_bighelidrop_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_birchfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_solarfield_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_stables_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_southwest_dialogue" );
    common_scripts\utility::flag_waitopen( "scarecrow_death_dialogue" );
    common_scripts\utility::flag_waitopen( "ozone_death_dialogue" );
    common_scripts\utility::flag_waitopen( "sniper_breaktime_dialogue" );
    common_scripts\utility::flag_set( "strike_package_md500rush_dialogue" );
    level._id_C474 = 2;
    level._id_CC97 = 90;

    if ( !common_scripts\utility::flag( "dsm_recovered" ) )
        thread _id_B45A();

    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "md500_rush_1" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "md500_rush_2" );
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "md500_rush_3" );
    thread _id_B335( var_0, "md500_rush_1" );
    thread _id_B335( var_1, "md500_rush_2" );
    thread _id_B335( var_2, "md500_rush_3" );
    wait 3;
    common_scripts\utility::flag_set( "strike_package_spawned" );
}

_id_B45A()
{
    level endon( "dsm_recovered" );
    maps\_utility::radio_dialogue( "est_snp1_fastattack" );
    maps\_utility::radio_dialogue( "est_gst_helosnw" );

    if ( isalive( level._id_B4A3 ) )
        maps\_utility::radio_dialogue( "est_scr_frontlawn" );

    if ( isalive( level._id_B224 ) )
    {
        var_0 = getnode( "scarecrow_housebriefing_start", "targetname" );
        level._id_B224 maps\_utility::disable_ai_color();
        level._id_B224 setgoalnode( var_0 );
        maps\_utility::radio_dialogue( "est_ozn_mainwindows" );
    }

    var_1 = level.player getweaponammostock( "claymore" );

    if ( level.gameskill < 2 && !common_scripts\utility::flag( "claymore_hint_printed" ) && var_1 > 4 )
    {
        common_scripts\utility::flag_set( "claymore_hint_printed" );
        level.player thread maps\_utility::display_hint( "claymore_hint" );
    }

    maps\_utility::radio_dialogue( "est_gst_useclaymores" );
    common_scripts\utility::flag_clear( "strike_package_md500rush_dialogue" );
}

_id_CAB6()
{
    common_scripts\utility::flag_waitopen( "strike_package_birchfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_solarfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_md500rush_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_bighelidrop_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_southwest_dialogue" );
    common_scripts\utility::flag_waitopen( "scarecrow_death_dialogue" );
    common_scripts\utility::flag_waitopen( "ozone_death_dialogue" );
    common_scripts\utility::flag_waitopen( "sniper_breaktime_dialogue" );
    common_scripts\utility::flag_set( "rpg_stables_dialogue" );
    common_scripts\utility::flag_set( "strike_component_activated" );
    level._id_A861 = 24;
    common_scripts\utility::flag_wait( "activate_component_on_standby" );
    common_scripts\utility::flag_clear( "activate_component_on_standby" );
    _id_B8E1( "stables_rpg_team", ::_id_B2FA, "stables_rpg_team_fp" );
    thread fake_rpg( "fake_rpg_stables" );
    maps\_utility::radio_dialogue( "est_snp1_rpgteameast" );

    if ( isalive( level._id_B224 ) )
        maps\_utility::radio_dialogue( "est_ozn_rpgteameast" );

    common_scripts\utility::flag_clear( "rpg_stables_dialogue" );
}

_id_BF64()
{
    common_scripts\utility::flag_waitopen( "strike_package_birchfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_solarfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_md500rush_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_bighelidrop_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_stables_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_southwest_dialogue" );
    common_scripts\utility::flag_waitopen( "scarecrow_death_dialogue" );
    common_scripts\utility::flag_waitopen( "ozone_death_dialogue" );
    common_scripts\utility::flag_waitopen( "sniper_breaktime_dialogue" );
    common_scripts\utility::flag_set( "rpg_boathouse_dialogue" );
    common_scripts\utility::flag_set( "strike_component_activated" );
    level._id_A861 = 23;
    common_scripts\utility::flag_wait( "activate_component_on_standby" );
    common_scripts\utility::flag_clear( "activate_component_on_standby" );
    _id_B8E1( "boathouse_rpg_team", ::_id_B2FA, "boathouse_rpg_team_fp" );
    thread fake_rpg( "fake_rpg_boathouse" );
    maps\_utility::radio_dialogue( "est_snp1_rpgteamwest" );
    maps\_utility::radio_dialogue( "est_gst_rpgteamwest" );
    common_scripts\utility::flag_clear( "rpg_boathouse_dialogue" );
}

_id_CEF0()
{
    common_scripts\utility::flag_waitopen( "strike_package_birchfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_solarfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_md500rush_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_bighelidrop_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_stables_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "scarecrow_death_dialogue" );
    common_scripts\utility::flag_waitopen( "ozone_death_dialogue" );
    common_scripts\utility::flag_waitopen( "sniper_breaktime_dialogue" );
    common_scripts\utility::flag_set( "rpg_southwest_dialogue" );
    common_scripts\utility::flag_set( "strike_component_activated" );
    level._id_A861 = 23;
    common_scripts\utility::flag_wait( "activate_component_on_standby" );
    common_scripts\utility::flag_clear( "activate_component_on_standby" );
    _id_B8E1( "southwest_rpg_team", ::_id_B2FA, "southwest_rpg_team_fp" );
    thread fake_rpg( "fake_rpg_southwest" );
    maps\_utility::radio_dialogue( "est_snp1_rpgteamsw" );

    if ( isalive( level._id_B224 ) )
        maps\_utility::radio_dialogue( "est_ozn_rpgteamsw" );

    common_scripts\utility::flag_clear( "rpg_southwest_dialogue" );
}

_id_B2FA( var_0 )
{
    self endon( "death" );
    var_1 = getnodearray( var_0, "targetname" );
    var_2 = var_1[randomint( var_1.size )];
    var_3 = 2.5;
    var_4 = 2400;
    var_5 = 200;
    var_6 = 0.5;
    var_7 = randomfloatrange( 0.5, 2 );
    var_8 = "player_is_escaping";

    if ( !common_scripts\utility::flag( "player_is_escaping" ) )
    {
        _id_D53B( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
        self.goalradius = 2200;
        wait(randomfloatrange( 25, 30 ));
    }

    _id_B57F();
}

_id_B335( var_0, var_1 )
{
    var_2 = var_0.riders;
    var_3 = getnodearray( var_1, "targetname" );
    var_4 = var_3[randomint( var_3.size )];

    foreach ( var_6 in var_2 )
    {
        if ( isdefined( var_6.script_startingposition ) )
        {
            if ( isdefined( var_0.vehicletype ) )
            {
                if ( var_0.vehicletype == "littlebird" )
                {
                    if ( var_6.script_startingposition == 1 )
                        continue;
                }

                if ( var_0.vehicletype == "mi17" )
                {
                    if ( var_6.script_startingposition == 0 )
                        continue;
                }
            }
        }

        if ( isalive( var_6 ) )
            var_6 thread _id_ABC1( var_0, var_1, var_4 );
    }

    if ( isdefined( level._id_B224 ) && isalive( level._id_B224 ) )
        level._id_B224.ignoresuppression = 0;
}

_id_ABC1( var_0, var_1, var_2 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "unloaded" );

    var_3 = _id_AF7A( var_1 );
    self.goalradius = var_3["goalradius"];
    var_4 = var_2;
    var_5 = var_3["nodeLoiterTime"];
    var_6 = var_3["nodeInitRadius"];
    var_7 = var_3["nodeEndRadius"];
    var_8 = var_3["nodeClosureRate"];
    var_9 = randomfloatrange( var_3["nodeClosureIntervalLow"], var_3["nodeClosureIntervalHigh"] );
    var_10 = "player_is_escaping";

    if ( !common_scripts\utility::flag( "player_is_escaping" ) )
    {
        self.ignoresuppression = 1;
        _id_D53B( var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    }

    _id_B57F();
}

_id_AF7A( var_0 )
{
    var_1 = [];

    if ( var_0 == "md500_rush_1" )
    {
        var_1["goalradius"] = 3000;
        var_1["nodeLoiterTime"] = 8;
        var_1["nodeInitRadius"] = 3000;
        var_1["nodeEndRadius"] = 1400;
        var_1["nodeClosureRate"] = 0.75;
        var_1["nodeClosureIntervalLow"] = 3;
        var_1["nodeClosureIntervalHigh"] = 8;
    }

    if ( var_0 == "md500_rush_2" )
    {
        var_1["goalradius"] = 2000;
        var_1["nodeLoiterTime"] = 3;
        var_1["nodeInitRadius"] = 1600;
        var_1["nodeEndRadius"] = 800;
        var_1["nodeClosureRate"] = 0.5;
        var_1["nodeClosureIntervalLow"] = 8;
        var_1["nodeClosureIntervalHigh"] = 12;
    }

    if ( var_0 == "boathouse_md500" )
    {
        var_1["goalradius"] = 1600;
        var_1["nodeLoiterTime"] = 4;
        var_1["nodeInitRadius"] = 1600;
        var_1["nodeEndRadius"] = 1000;
        var_1["nodeClosureRate"] = 0.85;
        var_1["nodeClosureIntervalLow"] = 3;
        var_1["nodeClosureIntervalHigh"] = 6;
    }

    if ( var_0 == "boathouse_mi17" )
    {
        var_1["goalradius"] = 1800;
        var_1["nodeLoiterTime"] = 4;
        var_1["nodeInitRadius"] = 1800;
        var_1["nodeEndRadius"] = 1400;
        var_1["nodeClosureRate"] = 0.9;
        var_1["nodeClosureIntervalLow"] = 4;
        var_1["nodeClosureIntervalHigh"] = 6;
    }
    else
    {
        var_1["goalradius"] = 3000;
        var_1["nodeLoiterTime"] = 0;
        var_1["nodeInitRadius"] = 3000;
        var_1["nodeEndRadius"] = 1000;
        var_1["nodeClosureRate"] = 0.8;
        var_1["nodeClosureIntervalLow"] = 3;
        var_1["nodeClosureIntervalHigh"] = 7;
    }

    return var_1;
}

_id_B8E1( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        maps\_utility::array_spawn_function_targetname( var_0, var_1 );
    else
        maps\_utility::array_spawn_function_targetname( var_0, var_1, var_2 );

    var_3 = [];
    var_3 = getentarray( var_0, "targetname" );
    common_scripts\utility::array_thread( var_3, maps\_utility::spawn_ai );
}

_id_B6F4()
{
    maps\_utility::array_spawn_function_noteworthy( "counterattacker", ::_id_B24A );
    maps\_utility::array_spawn_function_noteworthy( "counterattacker", ::_id_C0F2 );
}

_id_C0F2()
{
    if ( level.gameskill >= 2 )
        self.doorflashchance = 1;
    else
        self.doorflashchance = 0.7;
}

_id_B24A()
{
    self endon( "death" );
    thread _id_C64E();
    level._id_B745++;
}

_id_C64E()
{
    self waittill( "death" );
    level notify( "counterattacker_died" );
    level._id_B745--;
}

_id_B64B()
{
    maps\_utility::array_spawn_function_noteworthy( "ending_shadowops_drone", ::_id_AB19 );
}

_id_AB19()
{
    self.team = "allies";
    self.pathrandompercent = randomintrange( 0, 100 );
    maps\_utility::enable_cqbwalk();
    self.cheat._id_BDF2 = 1;
    self.cheat.ignorewolfthink = 1;
    _id_C0C3::addspecialmonitors();
    self waittill( "goal" );
    self allowedstances( "crouch" );
}

_id_D53B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );

    if ( isdefined( var_6 ) )
        level endon( var_6 );

    var_7 = var_2;

    for (;;)
    {
        self setgoalnode( var_0 );
        self waittill( "goal" );

        while ( var_7 > var_3 )
        {
            var_7 *= var_4;
            self.goalradius = var_7;
            self.goalheight = 32;
            self.pathrandompercent = randomintrange( 0, 100 );
            self waittill( "goal" );
            wait(var_5);
        }

        wait(var_1);

        if ( isdefined( var_0.target ) )
        {
            var_0 = getnode( var_0.target, "targetname" );
            continue;
        }

        break;
    }
}

_id_CF1C( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );

    if ( isdefined( var_6 ) )
        level endon( var_6 );

    var_7 = var_2;
    var_8 = var_0[randomint( var_0.size )];

    for (;;)
    {
        self setgoalnode( var_8 );
        self waittill( "goal" );

        while ( var_7 > var_3 )
        {
            var_7 *= var_4;
            self.goalradius = var_7;
            self.goalheight = 32;
            self.pathrandompercent = randomintrange( 0, 100 );
            self waittill( "goal" );
            wait(var_5);
        }

        wait(var_1);

        if ( isdefined( var_8.script_noteworthy ) )
        {
            var_0 = getnodearray( var_8.script_noteworthy, "targetname" );
            var_8 = var_0[randomint( var_0.size )];
            continue;
        }

        break;
    }
}

_id_B57F()
{
    self endon( "death" );

    if ( !common_scripts\utility::flag( "player_is_escaping" ) )
    {
        var_0 = getent( "dsm", "targetname" );
        var_1 = getnode( "dsm_killnode", "targetname" );
        self setgoalnode( var_1 );
        self.goalradius = 4000;

        if ( !common_scripts\utility::flag( "dsm_recovered" ) && !common_scripts\utility::flag( "dsm_destroyed" ) )
            self getenemyinfo( var_0 );
    }

    common_scripts\utility::flag_wait( "player_is_escaping" );
    thread _id_C870();
}

_id_C870()
{
    self endon( "death" );
    var_0 = getnode( "chase_player", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 3250;
    self.pathrandompercent = randomintrange( 30, 100 );
    thread maps\_utility::set_group_advance_to_enemy_parameters( 5, 1 );
}

_id_D56E()
{
    common_scripts\utility::flag_wait( "player_is_escaping" );
    var_0 = getentarray( "player_exfil_hunter", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

_id_CDE4()
{
    common_scripts\utility::flag_wait( "point_of_no_return" );

    if ( !common_scripts\utility::flag( "test_ending" ) )
    {
        var_0 = getentarray( "player_exfil_blocker", "targetname" );
        common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    }
}

_id_CE18()
{
    common_scripts\utility::flag_wait( "point_of_no_return" );
    var_0 = getent( "hillchaser_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getentarray( "player_exfil_hillchaser", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
}

_id_BCD1( var_0 )
{
    self waittill( "death" );

    if ( var_0 == "scarecrow" )
    {

    }

    if ( var_0 == "ozone" )
        return;
}

_id_D067()
{

}

_id_BCF4()
{
    common_scripts\utility::flag_wait( "defense_battle_begins" );
    common_scripts\utility::flag_set( "sniper_in_position" );
    level endon( "player_is_escaping" );
    var_0 = 0;

    while ( !common_scripts\utility::flag( "dsm_recovered" ) )
    {
        if ( common_scripts\utility::flag( "sniper_in_position" ) )
        {
            var_0 = _id_CF53();
            wait(randomfloatrange( 1, 3 ));

            if ( var_0 )
            {
                wait 2;
                var_0 = 0;
            }

            continue;
        }

        common_scripts\utility::flag_wait( "sniper_in_position" );
    }
}

_id_A939()
{
    common_scripts\utility::flag_wait( "defense_battle_begins" );
    level endon( "player_is_escaping" );
    level waittill( "magic_sniper_breaktime" );
    common_scripts\utility::flag_waitopen( "strike_package_birchfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_bighelidrop_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_solarfield_dialogue" );
    common_scripts\utility::flag_waitopen( "strike_package_md500rush_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_stables_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_boathouse_dialogue" );
    common_scripts\utility::flag_waitopen( "rpg_southwest_dialogue" );
    common_scripts\utility::flag_waitopen( "ozone_death_dialogue" );
    common_scripts\utility::flag_waitopen( "scarecrow_death_dialogue" );
    common_scripts\utility::flag_set( "sniper_breaktime_dialogue" );

    if ( common_scripts\utility::flag( "sniper_attempting_shot" ) )
        common_scripts\utility::flag_waitopen( "sniper_attempting_shot" );

    common_scripts\utility::flag_clear( "sniper_in_position" );
    maps\_utility::radio_dialogue( "est_snp1_displacing" );
    common_scripts\utility::flag_clear( "sniper_breaktime_dialogue" );
    wait 30;
    common_scripts\utility::flag_set( "sniper_in_position" );
}

_id_CF53( var_0 )
{
    level endon( "player_is_escaping" );
    var_1 = [];
    var_1[0] = "est_snp1_tangodown";
    var_1[1] = "est_snp1_gotone";
    var_1[2] = "est_snp1_hostneut";
    var_1[3] = "est_snp1_thatsakill";
    var_1[4] = "est_snp1_thatsone";
    var_1[5] = "est_snp1_tangodown2";
    var_1[6] = "est_snp1_droppedhim";
    var_1[7] = "est_snp1_hesdown";
    var_0 = getaiarray( "axis" );

    foreach ( var_3 in var_0 )
    {
        wait 1;

        if ( isalive( var_3 ) )
        {
            var_4 = sighttracepassed( level.player.origin + ( 0.0, 0.0, 64.0 ), var_3.origin + ( 0.0, 0.0, 32.0 ), 0, undefined );
            var_5 = var_3 cansee( level.player );
            var_6 = length( level.player.origin - var_3.origin );
            var_7 = 480;

            if ( common_scripts\utility::flag( "sniper_in_position" ) )
            {
                if ( var_4 && var_5 && var_6 >= 480 )
                {
                    common_scripts\utility::flag_set( "sniper_attempting_shot" );
                    var_8 = randomintrange( 0, 100 );

                    if ( var_8 > 10 )
                    {
                        var_3 thread maps\_utility::play_sound_on_entity( "h2_wpn_cheytac_npc_close" );
                        _id_B190::_id_D55F( var_3 );
                        var_3 kill();
                        wait 0.5;
                        maps\_utility::radio_dialogue( var_1[randomint( var_1.size )] );
                        common_scripts\utility::flag_clear( "sniper_attempting_shot" );
                        return 1;
                    }
                    else
                    {
                        var_3 thread maps\_utility::play_sound_on_entity( "h2_wpn_cheytac_npc_close" );
                        common_scripts\utility::flag_clear( "sniper_attempting_shot" );
                        return 0;
                    }
                }
            }
        }
    }

    return 0;
}

_id_D3CB()
{
    common_scripts\utility::flag_wait( "download_started" );
    level._id_A963 = spawnstruct();
    var_0 = getent( "dsm", "targetname" );
    var_0 makeentitysentient( "allies" );
    var_0.threatbias = 50;
    var_0.maxvisibledist = 300;
    thread maps\_utility::set_group_advance_to_enemy_parameters( 6, 2 );
    common_scripts\utility::flag_wait( "dsm_recovered" );
    var_0 freeentitysentient();
    var_0 delete();
}

_id_AF58()
{
    precachemodel( "h2_mil_wireless_dsm_obj_opaque" );
    var_0 = getent( "dsm", "targetname" );
    var_1 = getent( "dsm_obj", "targetname" );
    var_2 = spawn( "script_origin", ( 141.314, 211.295, 168.0 ) );
    var_0 maps\_utility::assign_animtree( "dsm" );
    var_1 maps\_utility::assign_animtree( "dsm" );
    var_2 maps\_anim::anim_first_frame_solo( var_0, "dsm_in" );
    var_2 maps\_anim::anim_first_frame_solo( var_1, "dsm_out" );
    var_0 hide();
    var_1 hide();
    common_scripts\utility::flag_wait( "dsm_ready_to_use" );
    var_3 = getent( "dsm_usetrigger", "targetname" );
    var_3 thread common_scripts\utility::_id_AE1E( level.player, &"ESTATE_DSM_USE_HINT", &"ESTATE_DSM_USE_HINT_PC", "trigger" );
    var_1 show();
    common_scripts\utility::flag_wait( "download_started" );
    common_scripts\utility::flag_set( "dsm_exposed" );
    maps\_utility::autosave_by_name( "started_download" );
    var_1 hide();
    var_0 common_scripts\utility::delaycall( 0.5, ::show );
    var_1 setmodel( "h2_mil_wireless_dsm_obj_opaque" );
    level.player setstance( "stand" );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    thread dsm_drop_bodysense_cinematic();
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "actionSlotsHide", "1" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_plr_dsm_in" );
    var_2 maps\_utility::_id_C0F0( "dsm_in", [ var_0 ], 0, 0.5, 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    var_0 thread _id_CF0A();
    common_scripts\utility::flag_clear( "dsm_ready_to_use" );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "actionSlotsHide", "0" );
    var_3 thread common_scripts\utility::_id_AE1E( level.player, &"ESTATE_DSM_PICKUP_HINT", &"ESTATE_DSM_PICKUP_HINT_PC", "trigger" );
    common_scripts\utility::flag_wait( "download_complete" );
    common_scripts\utility::flag_set( "dsm_ready_to_use" );
    var_1 show();
    var_0 hide();
    var_3 waittill( "trigger" );
    var_1 hide();
    var_0 show();
    level.player thread maps\_utility::play_sound_on_entity( "dsm_pickup" );

    if ( !common_scripts\utility::flag( "fence_removed" ) )
    {
        var_4 = getent( "final_area_fence", "targetname" );
        var_4 delete();
        common_scripts\utility::flag_set( "fence_removed" );
    }

    var_5 = getentarray( "broken_fence", "targetname" );

    foreach ( var_7 in var_5 )
        var_7 show();

    common_scripts\utility::flag_clear( "dsm_ready_to_use" );
    common_scripts\utility::flag_clear( "dsm_exposed" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_plr_dsm_out" );
    thread dsm_pickup_bodysense_cinematic();
    level.player setstance( "stand" );
    var_2 maps\_utility::_id_C0F0( "dsm_out", [ var_0 ], 0, 0.5, 1 );
    var_1 delete();
    var_0 hide();
    common_scripts\utility::flag_set( "dsm_recovered" );

    if ( !common_scripts\utility::flag( "can_save" ) )
        common_scripts\utility::flag_set( "can_save" );
}

dsm_drop_bodysense_cinematic()
{
    var_0 = _id_D397::_id_A97A( "dsm_drop_bodysense" );
    waittillframeend;
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 4.0, -1, 32, 32 ) _id_D397::_id_CCA7( level.player._id_C309, "tag_dof" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 2.8 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 1.3 ) _id_D397::_id_B85E( 0.08, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.65 ) _id_D397::_id_B85E( 0.06, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 2.5 ) _id_D397::_id_B85E( 0.08, 0.6, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BC26();
}

dsm_pickup_bodysense_cinematic()
{
    var_0 = _id_D397::_id_A97A( "dsm_pickup_bodysense" );
    waittillframeend;
    var_0 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 4.0, 50, 32, 32 ) _id_D397::_id_CCA7( level.player._id_C309, "tag_dof" ) _id_D397::_id_AE01( 1 ) _id_D397::_id_AF9C();
    var_0 _id_D397::_id_BEA0( 2.3 ) _id_D397::_id_BF3F();
    var_0 _id_D397::_id_BEA0( 1.15 ) _id_D397::_id_B85E( 0.04, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.4 ) _id_D397::_id_B85E( 0.04, 0.4, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BEA0( 1.75 ) _id_D397::_id_B85E( 0.05, 0.5, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.1 );
    var_0 _id_D397::_id_BC26();
}

_id_CF0A()
{
    self playsound( "scn_estate_data_grab_setdown" );
    wait 2;
    self playloopsound( "scn_estate_data_grab_loop" );
    common_scripts\utility::flag_wait( "download_complete" );
    self stopsounds();
}

_id_D15E()
{
    common_scripts\utility::flag_wait( "download_started" );
    level endon( "main_defense_fight_finished" );
    level endon( "player_is_escaping" );
    level endon( "dsm_has_been_destroyed" );
    level endon( "kill_stats_display_huds" );
    level thread check_kill_download_display();
    var_0 = 210;
    var_1 = 40;
    var_2 = 14;
    var_3 = -28;
    var_4 = -230;
    var_5 = -160;
    var_6 = var_2 + 10;
    var_7 = var_2 + 10;
    var_8 = var_7 + 16;
    var_9 = 0.45;
    var_10 = common_scripts\utility::_id_D5D2();

    switch ( var_10 )
    {
        case "LANGUAGE_FRENCH":
            var_11 = -102;
            var_12 = -35;
            break;
        case "LANGUAGE_RUSSIAN":
        case "LANGUAGE_RUSSIAN_PARTIAL":
            var_0 = 230;
            var_3 = -8;
            var_11 = -90;
            var_12 = -15;
            break;
        case "LANGUAGE_POLISH":
            var_0 = 230;
            var_3 = -8;
            var_11 = -113;
            var_12 = -15;
            break;
        case "LANGUAGE_GERMAN":
            var_11 = -116;
            var_12 = -35;
            break;
        case "LANGUAGE_ARABIC":
            var_0 = 285;
            var_3 = 47;
            var_11 = -198;
            var_12 = -15;
            break;
        case "LANGUAGE_PORTUGUESE":
            var_0 = 240;
            var_3 = 4;
            var_11 = -107;
            var_12 = -38;
            break;
        default:
            var_11 = -107;
            var_12 = -35;
            break;
    }

    if ( !common_scripts\utility::flag( "download_test" ) )
    {
        level.backers = maps\_hud_util::getstatbackers( var_3, var_2, var_0, var_1, 1 );
        level._id_A870 = maps\_hud_util::_id_C465( var_4, var_6, undefined, undefined, var_9, &"ESTATE_DSM_FRAME" );
        level._id_A870 setpulsefx( 30, 900000, 700 );
        wait 0.65;
        level._id_B055 = maps\_hud_util::_id_C465( var_5, var_6, undefined, undefined, var_9, &"ESTATE_DSM_WORKING" );
        level._id_B055 setpulsefx( 30, 900000, 700 );
        wait 2.85;
        level._id_B055 destroy();
        level._id_B055 = maps\_hud_util::_id_C465( var_5, var_6, undefined, undefined, var_9, &"ESTATE_DSM_NETWORK_FOUND" );
        level._id_B055 setpulsefx( 30, 900000, 700 );
        wait 3.75;
        level._id_B055 destroy();
        level._id_B055 = maps\_hud_util::_id_C465( var_5, var_6, undefined, undefined, var_9, &"ESTATE_DSM_IRONBOX" );
        level._id_B055 setpulsefx( 30, 900000, 700 );
        wait 2.25;
        level._id_B055 destroy();
        level._id_B055 = maps\_hud_util::_id_C465( var_5, var_6, undefined, undefined, var_9, &"ESTATE_DSM_BYPASS" );
        level._id_B055 setpulsefx( 30, 900000, 700 );
        wait 3.1;
        level._id_A870 destroy();
        level._id_B055 destroy();
    }

    level._id_B962 = 0;
    level._id_D2E8 = [];
    level._id_D2E8[1] = 95;
    level._id_D2E8[2] = 1280;
    level._id_D2E8[3] = 112;
    level._id_D2E8[4] = 180;
    level._id_D2E8[5] = 400;
    level._id_D085 = 0;

    for ( var_13 = 1; var_13 <= 5; var_13++ )
        level._id_D085 += level._id_D2E8[var_13];

    level._id_A870 = maps\_hud_util::_id_C465( var_4, var_7, undefined, undefined, var_9, &"ESTATE_DSM_PROGRESS" );
    level._id_A870 setpulsefx( 30, 900000, 700 );
    level._id_B055 = maps\_hud_util::_id_C465( var_12, var_7, undefined, undefined, var_9, &"ESTATE_DSM_SLASH_TOTALFILES", undefined, 0 );
    level._id_B055 setpulsefx( 30, 900000, 700 );
    level._id_B055.alignx = "right";
    level._id_BB7F = maps\_hud_util::_id_C465( var_4, var_8, undefined, undefined, var_9, &"ESTATE_DSM_DLTIMELEFT" );
    level._id_BB7F setpulsefx( 30, 900000, 700 );
    level._id_CFC8 = maps\_hud_util::_id_C465( var_11, var_8, undefined, undefined, var_9, &"ESTATE_DSM_DLTIMELEFT_MINS", undefined, 0 );
    level._id_CFC8 setpulsefx( 30, 900000, 700 );

    if ( var_10 == "LANGUAGE_ARABIC" )
        level._id_CFC8.alignx = "left";
    else
        level._id_CFC8.alignx = "right";

    level._id_BE26 = maps\_hud_util::_id_C465( var_12, var_8, undefined, undefined, var_9, &"ESTATE_DSM_DLRATE", undefined, 0 );
    level._id_BE26 setpulsefx( 30, 900000, 700 );
    level._id_BE26.alignx = "right";
    level._id_C129 = 0.85;
    common_scripts\utility::flag_set( "download_data_initialized" );
    var_14 = undefined;
    var_15 = undefined;
    var_16 = undefined;
    var_17 = gettime();

    while ( level._id_B962 < level._id_D085 )
    {
        level._id_D201 = ( gettime() - var_17 ) / 1000;
        var_18 = 0;
        var_19 = randomintrange( 1, 100 );

        if ( var_19 > 0 && var_19 < 10 )
            var_14 = 5;

        if ( var_19 >= 10 && var_19 < 25 )
            var_14 = 2;

        if ( var_19 >= 25 && var_19 < 50 )
            var_14 = 1;

        if ( var_19 >= 50 && var_19 < 75 )
            var_14 = 3;

        if ( var_19 >= 75 && var_19 < 100 )
            var_14 = 4;

        switch ( var_14 )
        {
            case 1:
                var_16 = 5;
                var_15 = 1;
                break;
            case 2:
                var_16 = 80;
                var_15 = 0.05;
                break;
            case 3:
                var_16 = 8;
                var_15 = 0.5;
                break;
            case 4:
                var_16 = 12;
                var_15 = 0.25;
                break;
            case 5:
                var_16 = 50;
                var_15 = 0.1;
                break;
        }

        _id_AAB0( var_18, var_16, var_15, var_14 );

        if ( var_14 == 5 )
        {
            var_14 = 1;
            continue;
        }

        var_14++;
    }

    if ( getdvarint( "debug_dsm_gameplay" ) == 1 )
        return;

    common_scripts\utility::flag_set( "download_complete" );

    if ( !common_scripts\utility::flag( "can_save" ) )
        common_scripts\utility::flag_set( "can_save" );

    thread _id_C920();
}

check_kill_download_display()
{
    self endon( "download_complete" );
    self waittill( "kill_stats_display_huds" );
    _id_C920();
}

_id_C920()
{
    if ( isdefined( level.backers ) )
    {
        foreach ( var_1 in level.backers )
            var_1 destroy();

        level.backers = undefined;
    }

    if ( isdefined( level._id_A870 ) )
        level._id_A870 destroy();

    if ( isdefined( level._id_B055 ) )
        level._id_B055 destroy();

    if ( isdefined( level._id_B6D1 ) )
        level._id_B6D1 destroy();

    if ( isdefined( level._id_CD42 ) )
        level._id_CD42 destroy();

    if ( isdefined( level._id_CFC8 ) )
        level._id_CFC8 destroy();

    if ( isdefined( level._id_BB7F ) )
        level._id_BB7F destroy();

    if ( isdefined( level._id_C1A0 ) )
        level._id_C1A0 destroy();

    if ( isdefined( level._id_BEDF ) )
        level._id_BEDF destroy();

    if ( isdefined( level._id_ACCB ) )
        level._id_ACCB destroy();

    if ( isdefined( level._id_BE26 ) )
        level._id_BE26 destroy();

    if ( isdefined( level._id_C39E ) )
        level._id_C39E destroy();
}

_id_AAB0( var_0, var_1, var_2, var_3 )
{
    level endon( "dsm_has_been_destroyed" );

    if ( !level._id_D2E8[var_3] )
        return;

    var_4 = undefined;
    var_5 = undefined;

    switch ( var_3 )
    {
        case 1:
            var_5 = randomintrange( 70, 130 );
            var_4 = randomfloatrange( 0.08, 0.18 );
            break;
        case 2:
            var_5 = randomintrange( 3, 5 );
            var_4 = randomfloatrange( 20.8, 32.8 );
            break;
        case 3:
            var_5 = randomintrange( 35, 65 );
            var_4 = randomfloatrange( 0.17, 0.46 );
            break;
        case 4:
            var_5 = randomintrange( 17, 33 );
            var_4 = randomfloatrange( 2.8, 7.2 );
            break;
        case 5:
            var_5 = randomintrange( 7, 13 );
            var_4 = randomfloatrange( 11.7, 17.7 );
            break;
    }

    var_4 = _id_B058( var_4 );
    var_6 = level._id_B962 / level._id_D085;

    if ( var_6 < level._id_C129 )
        level._id_CFC8 setvalue( var_5 );

    level._id_BE26 setvalue( var_4 );

    while ( var_0 < var_1 )
    {
        var_0++;
        level._id_B962++;
        level._id_B055 setvalue( level._id_B962 );
        var_7 = getent( "dsm", "targetname" );
        var_8 = length( level.player.origin - var_7.origin );
        var_9 = getent( "no_autosave_in_basement", "targetname" );
        var_10 = level._id_CA86 * 0.7;

        if ( var_8 <= level._id_AE20 && level._id_D526 >= var_10 )
        {
            if ( !level.player istouching( var_9 ) )
            {
                if ( level._id_B962 == 300 )
                    maps\_utility::autosave_by_name( "saved_during_download" );

                if ( level._id_B962 == 600 )
                    maps\_utility::autosave_by_name( "saved_during_download" );

                if ( level._id_B962 == 900 )
                    maps\_utility::autosave_by_name( "saved_during_download" );

                if ( level._id_B962 == 1200 )
                    maps\_utility::autosave_by_name( "saved_during_download" );

                if ( level._id_B962 == 1500 )
                    maps\_utility::autosave_by_name( "saved_during_download" );
            }
        }

        if ( level._id_B962 == 1000 )
            level notify( "magic_sniper_breaktime" );

        level._id_D2E8[var_3]--;
        wait(var_2);
    }
}

_id_BD87()
{
    level endon( "dsm_has_been_destroyed" );
    common_scripts\utility::flag_wait( "download_data_initialized" );
    var_0 = 0;
    var_1 = 0;

    while ( !common_scripts\utility::flag( "download_complete" ) )
    {
        var_2 = level._id_B962 / level._id_D085;

        if ( var_2 >= level._id_C129 && var_2 < 1 && !var_1 )
        {
            var_1 = 1;
            level._id_CFC8.label = &"ESTATE_DSM_DLTIMELEFT_SECS";
        }

        if ( var_2 >= level._id_C129 && var_2 < 1 )
        {
            var_3 = level._id_D2E8[1] / 1;
            var_4 = level._id_D2E8[2] / 20;
            var_5 = level._id_D2E8[3] / 2;
            var_6 = level._id_D2E8[4] / 4;
            var_7 = level._id_D2E8[5] / 10;
            var_0 = var_3 + var_4 + var_5 + var_6 + var_7;
            var_0 = _id_B058( var_0, 1 );
            wait 0.05;
            level._id_CFC8 setvalue( var_0 );
            continue;
        }

        wait 0.05;
    }
}

_id_B058( var_0, var_1 )
{
    if ( var_0 >= 10 || isdefined( var_1 ) )
    {
        var_0 *= 10;
        var_0 = int( var_0 );
        var_0 /= 10;
    }
    else
    {
        var_0 *= 100;
        var_0 = int( var_0 );
        var_0 /= 100;
    }

    if ( var_0 >= 10 || isdefined( var_1 ) )
    {
        var_2 = int( var_0 );
        var_3 = var_0 - var_2;

        if ( var_3 == 0 )
            var_0 += 0.1;
    }
    else if ( var_0 < 10 && var_0 >= 1 )
    {
        var_4 = var_0 * 10;
        var_5 = int( var_0 * 10 );
        var_3 = var_4 - var_5;

        if ( var_3 == 0 )
            var_0 += 0.01;
    }
    else if ( var_0 < 1 && var_0 >= 0.1 )
    {
        var_6 = int( var_0 * 10 );
        var_5 = var_6 / 10;
        var_2 = int( var_0 * 100 );
        var_6 = int( var_5 * 100 );
        var_7 = var_2 % var_6;

        if ( var_7 == 0 )
            var_0 += 0.01;
    }
    else if ( var_0 < 0.1 )
    {
        var_6 = int( var_0 * 100 );
        var_0 = var_6 / 100;
    }

    return var_0;
}

_id_AA71()
{
    common_scripts\utility::flag_wait( "download_started" );

    while ( !common_scripts\utility::flag( "dsm_recovered" ) )
    {
        var_0 = level._id_D526 + level._id_AA0B;

        if ( var_0 >= level._id_CA86 )
            level._id_D526 = level._id_CA86;
        else
            level._id_D526 = var_0;

        wait 1;
    }
}

_id_CB82()
{
    common_scripts\utility::flag_wait( "download_started" );
    var_0 = getent( "dsm", "targetname" );
    var_1 = var_0.origin;

    while ( !common_scripts\utility::flag( "dsm_recovered" ) )
    {
        var_2 = length( level.player.origin - var_1 );

        if ( var_2 >= level._id_B2D8 )
        {
            level._id_AA0B = 0;
            wait 0.25;
            continue;
        }
        else
        {
            var_3 = ( level._id_B2D8 - var_2 ) / level._id_B2D8;
            level._id_AA0B = var_3 * level._id_CC89;
        }

        wait 0.25;
    }
}

_id_BA8D()
{
    level endon( "dsm_recovered" );
    common_scripts\utility::flag_wait( "download_started" );
    var_0 = getent( "dsm_dmg_trigger", "targetname" );

    if ( getdvarint( "debug_dsm_gameplay" ) == 1 || getdvarint( "debug_estate_siege" ) || getdvarint( "debug_estate_forceStrike" ) )
    {
        var_0 delete();
        return;
    }

    while ( !common_scripts\utility::flag( "dsm_recovered" ) )
    {
        var_0 waittill( "damage", var_1, var_2 );

        if ( getdvarint( "debug_estate_siege" ) || getdvarint( "debug_estate_forceStrike" ) )
            continue;

        if ( var_2 != level.player )
        {
            var_3 = length( var_0.origin - var_2.origin );

            if ( var_3 < 512 )
                level._id_D526 -= var_1;
        }
        else
            level._id_D526 -= var_1;

        if ( level._id_D526 <= 1000 )
            common_scripts\utility::flag_clear( "can_save" );

        if ( level._id_D526 > 1000 )
            common_scripts\utility::flag_set( "can_save" );

        if ( level._id_D526 <= 0 )
        {
            if ( var_2 == level.player )
                setdvar( "ui_deadquote", &"ESTATE_DSM_DESTROYED_BY_PLAYER" );
            else
                setdvar( "ui_deadquote", &"ESTATE_DSM_DESTROYED_BY_AI_GUNFIRE" );

            level notify( "dsm_has_been_destroyed" );
            thread _id_C920();
            maps\_utility::missionfailedwrapper();
        }
    }
}

_id_B653()
{
    common_scripts\utility::flag_wait( "player_is_escaping" );
    level.cointoss = common_scripts\utility::cointoss();
    wait 0.1;
    common_scripts\utility::flag_set( "cointoss_done" );
}

_id_CFD9()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "cointoss_done" );

    if ( level.cointoss )
        thread _id_B236();
    else
        thread _id_ADE7();
}

_id_C79B()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "cointoss_done" );

    if ( level.cointoss )
        thread _id_ADE7();
    else
        thread _id_B236();
}

_id_B236()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "birchfield_cleared_sector2" );
    var_0 = getent( "breach_tweak_start", "targetname" );
    var_1 = var_0.origin;
    magicbullet( "cheytac", var_1, self.origin + ( 0.0, 0.0, 60.0 ) );
    self kill();
}

_id_ADE7()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "point_of_no_return" );
    var_0 = self.origin;
    playfx( level._effect["mortar"]["dirt"], var_0 );
    var_1 = spawn( "script_origin", var_0 );
    var_1 playsound( "clusterbomb_explode_default" );
    self kill();
}

_id_BC7F()
{
    self waittill( "death" );

    if ( !common_scripts\utility::flag( "player_is_escaping" ) )
    {
        var_0 = getnode( "scarecrow_earlydefense_start", "targetname" );
        var_1 = sighttracepassed( level.player.origin, var_0.origin, 1, undefined );
        var_2 = length( level.player.origin - var_0.origin );

        if ( var_2 > 384 && !var_1 )
            maps\_utility::radio_dialogue( "est_scr_imhit" );

        var_3 = gettime();
        common_scripts\utility::flag_waitopen( "strike_package_birchfield_dialogue" );
        common_scripts\utility::flag_waitopen( "strike_package_bighelidrop_dialogue" );
        common_scripts\utility::flag_waitopen( "strike_package_boathouse_dialogue" );
        common_scripts\utility::flag_waitopen( "strike_package_solarfield_dialogue" );
        common_scripts\utility::flag_waitopen( "strike_package_md500rush_dialogue" );
        common_scripts\utility::flag_waitopen( "rpg_stables_dialogue" );
        common_scripts\utility::flag_waitopen( "rpg_boathouse_dialogue" );
        common_scripts\utility::flag_waitopen( "rpg_southwest_dialogue" );
        common_scripts\utility::flag_waitopen( "ozone_death_dialogue" );
        common_scripts\utility::flag_waitopen( "sniper_breaktime_dialogue" );
        var_4 = 500.0;
        var_5 = gettime();
        var_6 = var_5 - var_3;

        if ( var_6 <= var_4 )
        {
            common_scripts\utility::flag_set( "scarecrow_death_dialogue" );
            maps\_utility::radio_dialogue( "est_snp1_scarecrowdown" );
            common_scripts\utility::flag_clear( "scarecrow_death_dialogue" );
        }
    }
}

_id_C527()
{
    self waittill( "death" );

    if ( !common_scripts\utility::flag( "player_is_escaping" ) )
    {
        maps\_utility::radio_dialogue( "est_ozn_imhit" );
        var_0 = gettime();
        common_scripts\utility::flag_waitopen( "strike_package_birchfield_dialogue" );
        common_scripts\utility::flag_waitopen( "strike_package_bighelidrop_dialogue" );
        common_scripts\utility::flag_waitopen( "strike_package_boathouse_dialogue" );
        common_scripts\utility::flag_waitopen( "strike_package_solarfield_dialogue" );
        common_scripts\utility::flag_waitopen( "strike_package_md500rush_dialogue" );
        common_scripts\utility::flag_waitopen( "rpg_stables_dialogue" );
        common_scripts\utility::flag_waitopen( "rpg_boathouse_dialogue" );
        common_scripts\utility::flag_waitopen( "rpg_southwest_dialogue" );
        common_scripts\utility::flag_waitopen( "scarecrow_death_dialogue" );
        common_scripts\utility::flag_waitopen( "sniper_breaktime_dialogue" );
        var_1 = 500.0;
        var_2 = gettime();
        var_3 = var_2 - var_0;

        if ( var_3 <= var_1 )
        {
            common_scripts\utility::flag_set( "ozone_death_dialogue" );
            maps\_utility::radio_dialogue( "est_snp1_ozoneisdown" );
            common_scripts\utility::flag_clear( "ozone_death_dialogue" );
        }
    }
}

_id_C95C()
{
    common_scripts\utility::flag_wait( "strike_packages_definitely_underway" );

    if ( common_scripts\utility::flag( "abandonment_danger_zone" ) )
    {
        common_scripts\utility::flag_waitopen( "abandonment_danger_zone" );
        common_scripts\utility::flag_set( "player_can_fail_by_desertion" );
    }
    else
        common_scripts\utility::flag_set( "player_can_fail_by_desertion" );
}

_id_D417()
{
    level endon( "dsm_recovered" );
    common_scripts\utility::flag_wait( "strike_packages_definitely_underway" );
    wait(level._id_B821);
    common_scripts\utility::flag_set( "player_can_fail_by_desertion" );
}

_id_BEFD()
{
    level endon( "dsm_recovered" );
    level endon( "player_deserted_the_area" );
    common_scripts\utility::flag_wait( "strike_packages_definitely_underway" );

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "abandonment_danger_zone" );
        level notify( "player_is_out_of_danger_zone" );
        common_scripts\utility::flag_wait( "abandonment_danger_zone" );
    }
}

_id_C716()
{
    level endon( "dsm_recovered" );
    level endon( "player_deserted_the_area" );
    common_scripts\utility::flag_wait( "strike_packages_definitely_underway" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "abandonment_danger_zone" );
        common_scripts\utility::flag_clear( "can_save" );
        thread _id_AED1();
        common_scripts\utility::flag_waitopen( "abandonment_danger_zone" );
        common_scripts\utility::flag_set( "can_save" );
    }
}

_id_AED1()
{
    level endon( "dsm_recovered" );
    level endon( "player_deserted_the_area" );
    level endon( "player_is_out_of_danger_zone" );

    if ( !level._id_BFA5 )
    {
        thread maps\_utility::radio_dialogue( "est_gst_dontstray" );
        level._id_BFA5 = 1;
    }
    else
    {
        thread maps\_utility::radio_dialogue( "est_gst_stayclose" );
        level._id_BFA5 = 0;
    }

    wait(level._id_B5C8 / 2);

    if ( !level._id_BFB4 )
    {
        thread maps\_utility::radio_dialogue( "est_gst_fallback" );
        level._id_BFB4 = 1;
    }
    else
    {
        thread maps\_utility::radio_dialogue( "est_gst_tryingtostop" );
        level._id_BFB4 = 0;
    }

    wait(level._id_B5C8 / 2);
    common_scripts\utility::flag_set( "player_entered_autofail_zone" );
}

_id_BC1B()
{
    common_scripts\utility::flag_wait( "player_can_fail_by_desertion" );
    common_scripts\utility::flag_wait( "player_entered_autofail_zone" );
    level notify( "player_deserted_the_area" );
    maps\_utility::radio_dialogue( "est_gst_destroyedthedsm" );
    maps\_utility::radio_dialogue_stop();
    setdvar( "ui_deadquote", &"ESTATE_DSM_DESTROYED_BY_DESERTION" );
    maps\_utility::missionfailedwrapper();
}

_id_BCA0( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
        var_3 thread _id_ABE8();
}

_id_ABE8()
{
    playfx( common_scripts\utility::getfx( "smoke_cloud" ), self.origin );
    self playsound( "estate_smokegrenade_explode" );
}

blackout( var_0, var_1 )
{
    fadeoverlay( var_0, 1, var_1 );
}

_id_C931( var_0, var_1 )
{
    fadeoverlay( var_0, 0.6, var_1 );
}

restorevision( var_0, var_1 )
{
    fadeoverlay( var_0, 0, var_1 );
}

fadeoverlay( var_0, var_1, var_2 )
{
    self fadeovertime( var_0 );
    self.alpha = var_1;
    setblur( var_2, var_0 );
    wait(var_0);
}

_id_BCE2()
{
    var_0 = level.player getcurrentweapon();

    if ( var_0 == "claymore" )
        return 1;

    if ( !level.player buttonpressed( "DPAD_RIGHT" ) )
        return 0;
    else
        return 1;
}

_id_B5CD( var_0 )
{
    foreach ( var_2 in level.players )
    {
        var_3 = distance( var_0.origin, var_2.origin );
        var_4 = abs( var_0.origin[2] - var_2.origin[2] );

        if ( var_3 < 360 && var_4 < 200 )
            return "return";
        else if ( var_3 < 1000 )
            return "threat_exists";
    }

    return "none";
}

_id_AAAE()
{
    if ( !common_scripts\utility::flag( "house_interior_breaches_done" ) )
    {
        var_0 = getaicount( "axis", "all" );
        var_1 = getaiarray( "axis" );
        var_2 = getaiarray( "allies" );

        foreach ( var_4 in var_2 )
            maps\_colors::clear_color_progress( var_4 );

        while ( var_0 != 0 )
        {
            var_0 = getaicount( "axis", "all" );
            var_6 = common_scripts\utility::random( var_1 );

            foreach ( var_4 in var_2 )
            {
                if ( isalive( var_6 ) )
                    var_4 maps\_utility::set_goal_entity( var_6 );
            }

            wait 0.5;
        }

        var_9 = getent( "house_approach_friendlytrigger", "targetname" );
        var_9 notify( "trigger" );
    }
}
#using_animtree("generic_human");

_id_C9A2()
{
    if ( !isdefined( self.target ) )
        return;

    var_0 = getnode( self.target, "targetname" );

    if ( !isdefined( var_0 ) || var_0.type != "Guard" )
        return;

    var_1 = animscripts\utility::lookuptransitionanim( "cover_trans", "exposed_crouch_crouchwalk", 2 );
    var_2 = getangledelta( var_1, 0, 1 );
    var_3 = length2dsquared( var_2 );
    var_4 = squared( 8 );

    for ( var_5 = distance2dsquared( self.origin, var_0.origin ); var_5 > var_3 + var_4; var_5 = distance2dsquared( self.origin, var_0.origin ) )
        wait 0.05;

    self notify( "move_interrupt" );
    self clearanim( %body, 0.2 );
    self setflaggedanimrestart( "cover_arrival", var_1, 1, 0.2, self.movetransitionrate );
    animscripts\shared::donotetracks( "cover_arrival" );
    self.a.movement = "stop";
    self clearanim( %animscript_root, 0.2 );
    thread animscripts\move::main();
}

_id_D180()
{
    if ( !isdefined( level._id_B24E ) )
        level._id_B24E = 0;

    var_0 = level._id_B24E;
    level._id_B24E = common_scripts\utility::mod( level._id_B24E + 1, 4 );
    return var_0;
}

_id_B942()
{
    var_0 = _id_D180();
    wait(0.1 + 0.1 * var_0);
    animscripts\grenade_cower::main();
}

achievement_claymore_init()
{
    if ( !isdefined( level.playerclaymorekill ) )
        level.playerclaymorekill = 0;

    maps\_utility::add_global_spawn_function( "axis", ::achievement_claymore_enemy_spawned );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::achievement_claymore_enemy_spawned );
    thread achievement_claymore_manager();
}

achievement_claymore_enemy_spawned()
{
    level endon( "achievement_claymore_done" );
    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
    {
        if ( isdefined( var_1 ) && var_1 == "MOD_GRENADE_SPLASH" )
        {
            if ( isdefined( var_2 ) && var_2 == "claymore" )
                level.playerclaymorekill++;
        }
    }
}

achievement_claymore_manager()
{
    while ( level.playerclaymorekill < 11 )
        waitframe();

    maps\_utility::giveachievement_wrapper( "CLAYMORE" );
    maps\_utility::remove_global_spawn_function( "axis", ::achievement_claymore_enemy_spawned );
    level notify( "achievement_claymore_done" );
}

fake_rpg( var_0 )
{
    var_1 = common_scripts\utility::getstructarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = common_scripts\utility::getstruct( var_3.target, "targetname" );
        magicbullet( "rpg", var_3.origin, var_4.origin );
        wait(randomfloatrange( 2.5, 4.5 ));
    }
}

blade_rotate()
{
    common_scripts\utility::flag_wait( "autosave_housearrival" );
    common_scripts\utility::array_thread( getentarray( "blade", "targetname" ), ::fan_blade_rotate );
}

lighting_override_venitians()
{
    common_scripts\utility::flag_wait( "autosave_housearrival" );
    var_0 = getentarray( "override_light", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 _meth_848A( ( 848.0, -102.5, 262.5 ) );
}

fan_blade_rotate()
{
    var_0 = randomfloatrange( 0.7, 1.5 );

    for (;;)
    {
        self rotateyaw( 360, var_0 );
        wait(var_0);
    }
}

animatescriptedmodel( var_0 )
{
    common_scripts\utility::flag_wait( "approaching_house" );

    if ( !isdefined( self ) )
        return;

    self.animname = var_0;
    maps\_anim::setanimtree();
    var_1 = maps\_utility::getanim( "idle" );
    self setanim( var_1 );
    var_2 = randomfloat( 1 );
    self setanimtime( var_1, var_2 );
}
