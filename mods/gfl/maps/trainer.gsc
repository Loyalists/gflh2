// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mission_select_cam" ) == "1" )
    {
        maps\trainer_mission_select_cam::_id_C490();
        return;
    }

    if ( getdvar( "beautiful_corner" ) == "1" || getdvar( "beautiful_corner_demo" ) == "1" )
    {
        maps\trainer_beautiful_corner::_id_C662();
        return;
    }

    pre_load();
    maps\_load::main();
    post_load();
    thread helicopter_dust_ending();
    thread sand_ground_ending_trainer();
    thread h2_gate_outro();
    thread h2_sniper_ee();
    thread h2_end_collision();
    thread h2_intro_gundown();
    thread h2_ac130_animation();
    level._id_A87F.greenberet_disabled = 1;
    setsaveddvar( "fx_cast_shadow", 0 );
    setsaveddvar( "ai_perf_disableStairsSteepMetrics", "1" );
    thread h2_hide_staticdmodelgroup( "h2_hidestaticmodelgroup_2", 2, 1 );
    thread h2_hide_staticdmodelgroup( "h2_showstaticmodelgroup_3", 3 );
    thread h2_hide_staticdmodelgroup( "h2_hidestaticmodelgroup_4", 4, 1 );
    thread h2_hide_staticdmodelgroup( "h2_hidestaticmodelgroup_1", 1, 1 );
    thread h2_loddistscale_outro();
    thread h2_tessellation_pit();
    level.maingun_fx_override = ::maingun_fx_override;
}

pre_load()
{
    maps\_utility::set_console_status();

    if ( level.console )
        level._id_D308 = 1.6;
    else
        level._id_D308 = 1.2;

    setdynamicdvar( "trainer_debug", "0" );
    level._id_CBFE = 0;
    level._id_B781 = 0;
    level._id_CE55 = 0;
    level._id_B7AA = 1.5;
    level.dronecallbackthread = ::_id_B6A2;
    level.spawnercallbackthread = ::_id_D148;
    level._id_BC4C = getdvar( "objectiveAlpha" );
    level._id_D457 = 0;
    setsaveddvar( "ui_hideGrenadeWidget", 1 );
    precachestring( &"MENU_TYPE_INVERT_AXIS" );
    precachestring( &"MENU_TYPE_INVERT_AXIS_CONFIRM" );
    precachestring( &"difficulty_selection_menu" );
    level._id_BA64 = 0;
    level._id_AE5C = [];
    level._id_B78E = undefined;
    level.pitbosstime = 30.0;
    level.studentmastertime = 19.7;
    level.faileddifficulty = 1000;
    level._id_D3FB = 29.05;
    level._id_B222 = 240;
    level._id_CF37 = 75;
    level._id_D3D0 = 43;
    level._id_B6B7 = 35;
    level._id_C42B = 5;
    level._id_B0B5 = 18;
    level._id_CBF6 = 2;
    level._id_C747 = 2;
    level._id_B582 = 160;
    level._id_B783 = 80;
    level._id_A9FA = [];
    level._id_C347 = [];
    level.color["white"] = ( 1.0, 1.0, 1.0 );
    level.color["red"] = ( 1.0, 0.0, 0.0 );
    level.color["blue"] = ( 0.1, 0.3, 1.0 );
    maps\_utility::add_start( "timed_ads", ::_id_B71A, "timed_ads" );
    maps\_utility::add_start( "bullet_penetration", ::_id_D3C3, "bullet_penetration" );
    maps\_utility::add_start( "frag", ::_id_C76D, "frag" );
    maps\_utility::add_start( "pit", ::_id_C0D6, "pit" );
    maps\_utility::add_start( "course", ::_id_CE30, "course" );
    maps\_utility::add_start( "end", ::_id_B122, "end" );

    if ( maps\_utility::is_specialop() )
    {
        maps\_utility::add_start( "so_killspree_trainer_start_map", level._id_B8F6 );
        maps\_utility::default_start( level._id_B8F6 );
    }
    else
    {
        common_scripts\utility::array_call( getentarray( "so_gate", "targetname" ), ::delete );
        maps\_utility::default_start( ::_id_B972 );
        var_0 = getent( "pit", "targetname" );
    }

    _id_ABCE();
    _id_B7C3::main();
    maps\ssdd_lighting::main();
    _id_B806::main();
    _id_AFA5::main();
    _id_C194::main();
    maps\_drone_ai::init();
}

_id_C21D()
{
    common_scripts\utility::flag_init( "never" );
    common_scripts\utility::flag_init( "can_talk" );
    common_scripts\utility::flag_set( "can_talk" );
    common_scripts\utility::flag_init( "start_anims" );
    common_scripts\utility::flag_init( "no_more_course_nags" );
    common_scripts\utility::flag_init( "firing_range_initialized" );
    common_scripts\utility::flag_init( "player_picked_up_rifle" );
    common_scripts\utility::flag_init( "player_facing_targets_for_hip_fire" );
    common_scripts\utility::flag_init( "hip_fire_done" );
    common_scripts\utility::flag_init( "firing_range_hip_and_ads_done" );
    common_scripts\utility::flag_init( "foley_turns_for_ads_demo" );
    common_scripts\utility::flag_init( "foley_done_talking_from_hip_ads_training" );
    common_scripts\utility::flag_init( "foley_done_talking_from_timed_ads_training" );
    common_scripts\utility::flag_init( "foley_turns_for_adstimed_demo" );
    common_scripts\utility::flag_init( "firing_range_timed_ads_done" );
    common_scripts\utility::flag_init( "firing_range_penetration_done" );
    common_scripts\utility::flag_init( "foley_done_talking_from_penetration_training" );
    common_scripts\utility::flag_init( "player_can_pick_up_frags" );
    common_scripts\utility::flag_init( "player_just_threw_a_frag" );
    common_scripts\utility::flag_init( "frags_have_been_spawned" );
    common_scripts\utility::flag_init( "player_picked_up_frags" );
    common_scripts\utility::flag_init( "h2_player_picking_up_frags" );
    common_scripts\utility::flag_init( "targets_hit_with_grenades" );
    common_scripts\utility::flag_init( "player_has_thrown_frag_into_target" );
    common_scripts\utility::flag_init( "firing_range_frags_done" );
    common_scripts\utility::flag_init( "foley_done_talking_from_frag_training" );
    common_scripts\utility::flag_init( "training_intro_trainees_pre_end_idle" );
    common_scripts\utility::flag_init( "training_intro_end_anims" );
    common_scripts\utility::flag_init( "obj_go_to_the_pit_given" );
    common_scripts\utility::flag_init( "obj_go_to_the_pit_done" );
    common_scripts\utility::flag_init( "dunn_dialogue_welcome_01" );
    common_scripts\utility::flag_init( "dunn_dialogue_welcome_02" );
    common_scripts\utility::flag_init( "dunn_finished_welcome_anim" );
    common_scripts\utility::flag_init( "sidearm_complete" );
    common_scripts\utility::flag_init( "case_flip_01" );
    common_scripts\utility::flag_init( "case_flip_02" );
    common_scripts\utility::flag_init( "button_press" );
    common_scripts\utility::flag_init( "dunn_finished_with_open_case_dialogue" );
    common_scripts\utility::flag_init( "melee_target_hit" );
    common_scripts\utility::flag_init( "course_end_targets_dead" );
    common_scripts\utility::flag_init( "sprinted" );
    common_scripts\utility::flag_init( "pit_dialogue_starting" );
    common_scripts\utility::flag_init( "course_start_targets_dead" );
    common_scripts\utility::flag_init( "course_first_floor_targets_dead" );
    common_scripts\utility::flag_init( "course_second_floor_targets_dead" );
    common_scripts\utility::flag_init( "course_end_targets_dead" );
    common_scripts\utility::flag_init( "dunn_finished_with_difficulty_selection_dialogue" );
    common_scripts\utility::flag_init( "player_done_with_course" );
    common_scripts\utility::flag_init( "end_sequence_starting" );
    common_scripts\utility::flag_init( "h2_helicopter_ending_exploder" );
    common_scripts\utility::flag_init( "first_pit_run_done" );
    common_scripts\utility::flag_init( "pit_stop_loop" );
}

post_load()
{
    maps\_compass::setupminimap( "compass_map_trainer" );

    if ( maps\_utility::is_specialop() )
        maps\so_killspree_trainer_aud::main();
    else
        maps\trainer_aud::main();

    maps\trainer_anim::main();
    _id_C21D();
    level._id_C453 = [];
    level._id_B707 = [];
    level._id_B03E = [];
    level._id_BB75 = [];
    level._id_C3E0 = getent( "plywood", "script_noteworthy" );
    level._id_C3E0 rotateroll( -90, 0.25, 0.1, 0.1 );
    level._id_BC88 = gettime();
    level._id_CE33 = getentarray( "target_rail_start_point", "targetname" );
    var_0 = getentarray( "target_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_D4FC );
    var_1 = getentarray( "target_enemy", "script_noteworthy" );
    var_2 = getentarray( "target_friendly", "script_noteworthy" );
    level.target_ents = [];
    common_scripts\utility::array_thread( var_2, ::_id_B742, "friendly" );
    common_scripts\utility::array_thread( var_1, ::_id_B742, "enemy" );
    level._id_CEFF = 0;
    level._id_AEA9 = 0;
    var_3 = getentarray( "target_enemy", "script_noteworthy" );
    var_4 = getentarray( "target_friendly", "script_noteworthy" );
    level.targets = maps\_utility::array_merge( var_3, var_4 );
    level.speakers = getentarray( "speakers", "targetname" );
    level._id_CAD8 = 0;
    level._id_A836 = "m4_grunt_SSDD";
    level._id_BC34 = 30;
    level._id_D033 = "deserteagle";
    var_5 = getentarray( "pit_weapons", "targetname" );
    common_scripts\utility::array_thread( var_5, ::_id_D011 );
    level.cosine = [];
    level.cosine["45"] = cos( 45 );
    level.cosine["90"] = cos( 90 );
    var_6 = maps\_vehicle::_id_C229();
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_B90C );
    common_scripts\utility::array_thread( getentarray( "ai_ambient", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_D0A1 );
    common_scripts\utility::array_thread( getentarray( "ai_shooter", "script_noteworthy" ), maps\_utility::add_spawn_function, ::ai_ambient_shooter_think );
    maps\_utility::array_spawn_function_noteworthy( "patrol", ::_id_C18B );
    maps\_utility::array_spawn_function_noteworthy( "runners", ::_id_C8C3 );
    common_scripts\utility::array_thread( getentarray( "friendlies_basketball", "targetname" ), maps\_utility::add_spawn_function, ::h2_basketball_guys_headswap );
    common_scripts\utility::array_thread( getentarray( "h2_tank_shootingrange", "targetname" ), maps\_utility::add_spawn_function, ::h2_shootingrange_tank );
    common_scripts\utility::array_thread( getentarray( "h2_pit_ai", "targetname" ), maps\_utility::add_spawn_function, ::h2_pit_ai_animation );
    common_scripts\utility::array_thread( getentarray( "trainees", "targetname" ), maps\_utility::add_spawn_function, ::h2_hide_ai_pit );
    getent( "trainee_01", "script_noteworthy" ) thread maps\_utility::add_spawn_function( ::h2_hide_ai_pit );
    level.foley = maps\_utility::spawn_targetname( "foley", 1 );
    level.foley.animname = "foley";
    level.foley.animnode = spawn( "script_origin", ( -2512.5, 5138.8, -56.1 ) );
    level.foley.animnode.angles = ( 0.0, -90.0, 180.0 );
    level.grenade_box = getent( "grenade_box", "targetname" );
    level.grenade_box maps\_utility::assign_animtree( "grenade_box" );
    level._id_B550 = maps\_utility::array_index_by_script_index( getentarray( "frags", "script_noteworthy" ) );

    foreach ( var_8 in level._id_B550 )
        var_8 linkto( level.grenade_box, "J_Box" );

    level.anim_frags = [ level._id_B550[8], level._id_B550[12], level._id_B550[11] ];

    for ( var_10 = 0; var_10 < level.anim_frags.size; var_10++ )
        level.anim_frags[var_10] maps\_utility::assign_animtree( "grenade" + ( var_10 + 1 ) );

    level.foley_frag = level.anim_frags[2];
    level.player_additional_frag = level._id_B550[10];
    level.grenadeanimnode = level.foley.animnode;
    level.grenadeanimnode maps\_anim::anim_first_frame_solo( level.grenade_box, "training_intro_talk7" );
    level.foley maps\_utility::forceuseweapon( "m4_grunt_SSDD", "primary" );
    level._id_D48C = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    level._id_D48C.origin = level.foley.animnode.origin;
    level._id_D48C.angles = level.foley.animnode.angles;
    level._id_D3E4 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    level._id_D3E4.origin = level.foley.animnode.origin;
    level._id_D3E4.angles = level.foley.animnode.angles;
    _id_C4F7();
    level._id_B5F1 = getent( "pit_case_01", "targetname" );
    level._id_C9DA = getent( "pit_case_02", "targetname" );
    level._id_B5F1.animname = "training_case_01";
    level._id_C9DA.animname = "training_case_02";
    level._id_B5F1 maps\_utility::assign_animtree();
    level._id_C9DA maps\_utility::assign_animtree();
    level._id_C16E = [];
    level._id_C16E[0] = level._id_B5F1;
    level._id_C16E[1] = level._id_C9DA;
    level._id_C698 = maps\_utility::array_spawn( getentarray( "trainees", "targetname" ), 1 );
    level._id_CB75 = maps\_utility::spawn_script_noteworthy( "translator", 1 );
    level._id_CB75 maps\_utility::gun_remove();
    level._id_CB75.animname = "translator";
    level._id_D5D6 = maps\_utility::spawn_script_noteworthy( "trainee_01", 1 );
    // level._id_D5D6 codescripts\character::setheadmodel( "head_trn_arab_g" );
    // level._id_D5D6 setmodel( "body_ally_arab_trn_smg_a" );
    level._id_D5D6.animname = "trainee_01";
    level._id_D5D6 maps\_utility::gun_remove();
    level._id_D5D6 maps\_utility::forceuseweapon( "m4_grunt_SSDD", "primary" );
    level._id_D3E4 thread maps\_anim::anim_first_frame_solo( level._id_CB75, "training_intro_begining" );
    level._id_CB75 _id_B3AB::_id_BEBA( "head", level.player, 300, 90, 90, 30, 45, 0, 1, 10, 0 );
    level._id_D48C thread maps\_anim::anim_loop_solo( level._id_D5D6, "training_intro_idle", "stop_firing_range_anim" );
    common_scripts\utility::array_thread( level._id_C698, ::firing_range_generic_trainees_anims );
    level.foley.animnode thread maps\_anim::anim_first_frame_solo( level.foley, "training_intro_begining" );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    level._id_C8EB = 1;
    level.objectives = [];
    _id_C7AD();
    level._id_CDFF = [];
    level._id_CDFF[0] = level.foley;
    level._id_CDFF[1] = level._id_CB75;
    level._id_CDFF[2] = level._id_D5D6;
    level._id_CDFF = maps\_utility::array_merge( level._id_CDFF, level._id_C698 );
    level._id_D2E7 = _id_D448( "gate_cqb_enter" );
    level._id_CB32 = _id_D448( "gate_cqb_exit" );
    level._id_C711 = _id_D448( "gate_cqb_enter_main" );
    level._id_C711._id_BC3F = -170;
    level._id_C711._id_AB59 = 170;
    level._id_CB32._id_BC3F = -95;
    level._id_CB32._id_AB59 = 95;

    if ( !maps\_utility::is_specialop() )
    {
        level._id_C711 thread door_open();
        level.player takeallweapons();
    }

    if ( !maps\_utility::is_specialop() )
    {
        level._id_CFF0 = maps\_utility::array_spawn( getentarray( "friendlies_ambient", "targetname" ), 1 );
        thread _id_B28F();
        level._id_C586 = maps\_utility::array_spawn( getentarray( "friendlies_basketball", "targetname" ), 1 );
        thread _id_CDBE( "runner_group_01" );
        thread _id_CDBE( "runner_group_02" );
        thread _id_B699();
    }

    thread music();
    var_11 = getentarray( "laatpv_gate", "targetname" );

    foreach ( var_13 in var_11 )
        var_13 hide();

    var_15 = getentarray( "dummies", "targetname" );
    common_scripts\utility::array_call( var_15, ::delete );
    level._id_D0AB = getent( "firing_range_area", "targetname" );
    thread _id_D5CA();
    thread _id_C1B0();
    thread _id_A86F();
    thread _id_B01C();
    level.player thread _id_BCCF();
    thread windstock_animations();
    thread init_scope_fov_setup();
}

precognitive_paranoia_think()
{
    thread precognitive_paranoia_watch_death();
    thread precognitive_paranoia_watch_damage();
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
    var_0 = 0;

    for (;;)
    {
        self waittill( "damage", var_1, var_2 );

        if ( isdefined( var_2 ) && isplayer( var_2 ) )
        {
            var_0 += var_1;

            if ( var_0 >= 150 )
            {
                if ( maps\_utility::is_hero() )
                    maps\_utility::unmake_hero();

                if ( isdefined( self.magic_bullet_shield ) && self.magic_bullet_shield == 1 )
                    maps\_utility::stop_magic_bullet_shield();

                self stopanimscripted();
                self startragdoll();
                self kill( self.origin, level.player );
                break;
            }
        }
    }
}

_id_BCCF()
{
    level endon( "button_press" );

    for (;;)
    {
        level.player waittill( "reload_start" );

        if ( common_scripts\utility::flag( "player_inside_course" ) )
            break;

        var_0 = self getcurrentweapon();

        if ( level.player getweaponammostock( var_0 ) < 100 )
            level.player setweaponammostock( var_0, 9999 );
    }
}

_id_D5CA()
{
    wait 0.5;
    level._id_CA61 = level._id_C347.size;
    level._id_BABF = level._id_A9FA.size;
}

_id_B972()
{
    maps\ssdd_lighting::_id_AAC1( "timed_ads" );
    thread _id_B3AF();
    soundscripts\_snd::snd_message( "start_timed_ads_checkpoint" );
}

_id_B584()
{

}

_id_B71A()
{
    maps\ssdd_lighting::_id_AAC1( "timed_ads" );
    soundscripts\_snd::snd_message( "start_timed_ads_checkpoint" );
    _id_A871();
    thread _id_C1D2();
    common_scripts\utility::flag_set( "firing_range_hip_and_ads_done" );
    common_scripts\utility::flag_set( "foley_done_talking_from_hip_ads_training" );
    maps\_utility::delaythread( 3, ::_id_B0F4 );
    thread firing_range_player_pick_up_gun();
}

_id_D3C3()
{
    maps\ssdd_lighting::_id_AAC1( "bullet_penetration" );
    soundscripts\_snd::snd_message( "start_bullet_penetration_checkpoint" );
    _id_A871();
    thread _id_C1D2();
    common_scripts\utility::flag_set( "firing_range_timed_ads_done" );
    common_scripts\utility::flag_set( "foley_done_talking_from_timed_ads_training" );
    thread _id_AD13();
    thread firing_range_player_pick_up_gun();
}

_id_C76D()
{
    maps\ssdd_lighting::_id_AAC1( "frag" );
    soundscripts\_snd::snd_message( "start_frag_checkpoint" );
    _id_A871();
    thread _id_C1D2();
    common_scripts\utility::flag_set( "firing_range_penetration_done" );
    common_scripts\utility::flag_set( "foley_done_talking_from_penetration_training" );
    thread _id_C7D0();
    thread firing_range_player_pick_up_gun();
}

_id_C0D6()
{
    maps\ssdd_lighting::_id_AAC1( "pit" );
    soundscripts\_snd::snd_message( "start_pit_checkpoint" );
    common_scripts\utility::flag_set( "foley_done_talking_from_frag_training" );
    common_scripts\utility::flag_set( "firing_range_frags_done" );
    level.player giveweapon( level._id_A836 );
    level.player switchtoweapon( level._id_A836 );
    var_0 = getent( "pit_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    thread _id_B651();
}

_id_CE30()
{
    maps\ssdd_lighting::_id_AAC1( "course" );
    soundscripts\_snd::snd_message( "start_course_checkpoint" );
    common_scripts\utility::flag_set( "dunn_finished_welcome_anim" );
    level.pitanimnode = spawnstruct();
    level.pitanimnode.origin = ( -3568.0, 2280.0, -192.0 );
    level.pitanimnode.angles = ( 0.0, -90.0, 0.0 );
    level.player giveweapon( level._id_D033 );
    level.player giveweapon( level._id_A836 );
    level.player switchtoweapon( level._id_A836 );
    var_0 = getent( "course_start_pit", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    thread _id_C539();
    maps\_utility::vision_set_fog_changes( "trainer_pit", 0 );
}

_id_B122()
{
    maps\ssdd_lighting::_id_AAC1( "end" );
    soundscripts\_snd::snd_message( "start_end_checkpoint" );
    level.player giveweapon( level._id_D033 );
    level.player giveweapon( level._id_A836 );
    level.player switchtoweapon( level._id_A836 );
    var_0 = getent( "course_leave", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    _id_BD26( "obj_course", &"TRAINER_OBJ_EXIT_THE_PIT", getent( "course_start", "targetname" ) );
    _id_C7C7( "obj_course", "current" );
    thread _id_B370();
    maps\_utility::vision_set_fog_changes( "trainer_pit", 0 );
}

music()
{
    var_0 = getent( "radio_org", "targetname" );

    for (;;)
    {
        var_0 playsound( "mus_training_radio_music_01", "done" );
        var_0 waittill( "done" );
        wait 1;
        var_0 playsound( "mus_training_radio_music_02", "done" );
        var_0 waittill( "done" );
        wait 1;
        var_0 playsound( "mus_training_radio_music_03", "done" );
        var_0 waittill( "done" );
        wait 1;
        var_0 playsound( "mus_training_radio_music_04", "done" );
        var_0 waittill( "done" );
        wait 1;
    }
}

_id_B699()
{
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "heli_group_01" );
    thread maps\trainer_aud::aud_handle_veh_group( var_0, "pavelow", 1 );
    thread h2_tower01_ambient();
}

_id_B3AF()
{
    thread _id_C1D2();
    common_scripts\utility::flag_wait( "start_anims" );
    thread _id_B2CB();
    common_scripts\utility::flag_wait( "firing_range_hip_and_ads_done" );
    thread _id_B0F4();
}

_id_C1D2()
{
    setsaveddvar( "g_friendlyNameDist", 196 );
    level.player disableweaponpickup();
    level.player takeallweapons();
    var_0 = getent( "player_start_range", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getent( "ads_target_trigger_middle", "targetname" );
    var_2 = getent( "ads_target_trigger_front", "targetname" );
    var_3 = getent( "ads_target_trigger_rear", "targetname" );
    var_4 = getent( "timed_ads_target_trigger", "targetname" );
    var_1 thread _id_D4FC();
    var_2 thread _id_D4FC();
    var_3 thread _id_D4FC();
    var_4 thread _id_D4FC();
    level._id_C5CA = var_2.targets;
    level._id_BDA0 = var_1.targets;
    level._id_D168 = var_4.targets;
    level._id_BAAA = var_4.targets;
    level.foley _id_B3AB::_id_BEBA( "upperbody", level.player, undefined, undefined, undefined, undefined, undefined, 1, 1 );
    common_scripts\utility::flag_set( "firing_range_initialized" );
    common_scripts\utility::flag_wait( "obj_go_to_the_pit_given" );
    setsaveddvar( "g_friendlyNameDist", 15000 );
}

firing_range_anim_then_idle( var_0, var_1, var_2 )
{
    self notify( "stop_firing_range_anim" );
    self endon( "stop_firing_range_anim" );
    maps\_anim::anim_single_solo( var_0, var_1 );
    thread maps\_anim::anim_loop_solo( var_0, var_2, "stop_firing_range_anim" );
}

firing_range_generic_trainees_anims()
{
    if ( !isdefined( self.animation ) )
        return;

    // h2_force_body_for_trainees();

    // if ( isdefined( self.script_noteworthy ) )
    //     codescripts\character::setheadmodel( self.script_noteworthy );

    var_0 = self.animation + "_idle";

    if ( anim_exists( var_0, "generic" ) )
        level._id_D48C thread maps\_anim::anim_generic_loop( self, var_0, "stop_firing_range_anim" );

    common_scripts\utility::flag_wait( "training_intro_trainees_pre_end_idle" );
    var_1 = self.animation + "_pre_end_idle";

    if ( anim_exists( var_1, "generic" ) )
        level._id_D48C thread maps\_anim::anim_generic_loop( self, var_1, "stop_firing_range_anim" );

    common_scripts\utility::flag_wait( "training_intro_end_anims" );
    var_2 = self.animation + "_end";

    if ( anim_exists( var_2, "generic" ) )
        level._id_D48C maps\_anim::anim_generic( self, var_2, "stop_firing_range_anim" );

    var_3 = self.animation + "_end_idle";

    if ( anim_exists( var_3, "generic" ) )
        level._id_D48C thread maps\_anim::anim_generic_loop( self, var_3, "stop_firing_range_anim" );
}

firing_range_player_pick_up_gun()
{
    var_0 = getent( "pickup_rifle", "targetname" );
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( var_0.model );
    var_1 maps\_utility::assign_animtree( "intro_gun" );
    var_1 hide();
    level.player enableweaponpickup();
    firing_range_player_pick_up_items( [ var_1 ], "training_intro_gunpickup", var_0 );
    var_1 delete();
}

firing_range_player_pick_up_grenades()
{
    common_scripts\utility::flag_set( "h2_player_picking_up_frags" );
    firing_range_player_pick_up_items( level.anim_frags, "training_intro_grenadepickup" );
    level.player givemaxammo( level.player getoffhandprimaryclass() );
    level.player playsound( "grenade_pickup" );

    foreach ( var_1 in level.anim_frags )
    {
        var_1 hide();
        var_1.hidden = 1;
    }

    common_scripts\utility::array_thread( level.anim_frags, maps\_anim::anim_self_set_time, "training_intro_grenadepickup", 0.0 );
    waitframe();
    common_scripts\utility::array_call( level.anim_frags, ::stopanimscripted );
    thread _id_B4B5( level.anim_frags, 3.0 );

    if ( level.player_additional_frag.hidden )
        thread _id_B4B5( [ level.player_additional_frag ], 3.0 );

    common_scripts\utility::flag_clear( "h2_player_picking_up_frags" );
}

firing_range_player_pick_up_additional_grenade( var_0 )
{
    level.player_additional_frag hide();
    level.player_additional_frag.hidden = 1;
}

firing_range_player_pick_up_items( var_0, var_1, var_2 )
{
    var_3 = level.foley.animnode;
    var_4 = maps\_utility::spawn_anim_model( "worldbody" );
    var_4 hide();
    var_3 maps\_anim::anim_last_frame_solo( var_4, var_1 );
    var_5 = var_4 gettagorigin( "tag_player" );
    var_6 = var_0;
    var_6[var_6.size] = var_4;
    var_3 maps\_anim::anim_first_frame( var_6, var_1 );

    if ( isdefined( var_2 ) )
        var_2 waittill( "trigger" );

    common_scripts\utility::array_call( var_0, ::show );
    level.player disableweapons();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    var_7 = spawn( "script_origin", level.player.origin );
    var_7.angles = level.player getplayerangles();
    level.player playerlinkto( var_7, undefined, 1.0, 0.0, 0.0, 0.0, 0.0 );
    var_8 = level.player maps\_anim::_id_D101( var_4, 50.0, 180.0, 0.35, 0.7 );
    var_7 moveto( var_4 gettagorigin( "tag_camera" ) - ( 0.0, 0.0, 60.0 ), var_8, var_8 * 0.2, var_8 * 0.2 );
    var_7 rotateto( var_4 gettagangles( "tag_camera" ), var_8, var_8 * 0.2, var_8 * 0.2 );
    wait(var_8);
    level.player playerlinktodelta( var_4, "tag_player", 1.0, 0.0, 0.0, 0.0, 0.0, 1 );
    var_4 common_scripts\utility::delaycall( 0.3, ::show );

    if ( var_1 == "training_intro_gunpickup" )
        thread h2_trainer_pickuprifle_cinematic();
    else if ( var_1 == "training_intro_grenadepickup" )
        thread h2_trainer_pickupgrenade_cinematic();

    var_3 thread maps\_anim::anim_single( var_6, var_1 );
    var_8 = 0.5;
    var_9 = var_4 maps\_utility::getanim( var_1 );
    wait(getanimlength( var_9 ) - var_8);
    var_10 = playerphysicstrace( var_5 + ( 0.0, 0.0, 40.0 ), var_5 - ( 0.0, 0.0, 40.0 ) );
    var_11 = spawn( "script_origin", var_3.origin + var_10 - var_5 );
    var_11.angles = var_3.angles;
    var_4 maps\_anim::_id_B6DB( undefined, var_3, var_11, var_8 );
    level.player unlink();
    var_7 delete();
    var_4 delete();
    level.player enableweapons();
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
}

h2_trainer_pickuprifle_cinematic()
{
    var_0 = _id_D397::_id_A97A( "pickup_rifle_cin" );
    var_0 _id_D397::_id_BEA0( 0.6 ) _id_D397::_id_B85E( 0.2, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.0 ) _id_D397::_id_B85E( 0.2, 0.8, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BC26();
}

h2_trainer_pickupgrenade_cinematic()
{
    var_0 = _id_D397::_id_A97A( "pickup_grenades_cin" );
    var_0 _id_D397::_id_BEA0( 0.7 ) _id_D397::_id_B85E( 0.14, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BEA0( 1.1 ) _id_D397::_id_B85E( 0.14, 0.7, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
    var_0 _id_D397::_id_BC26();
}

_id_D20A()
{
    level._id_D3E4 thread firing_range_anim_then_idle( level._id_CB75, "training_intro_begining", "training_intro_idle2" );
    level.foley.animnode firing_range_anim_then_idle( level.foley, "training_intro_begining", "training_intro_idle3" );
    common_scripts\utility::flag_wait( "hip_fire_done" );
    level._id_D3E4 thread firing_range_anim_then_idle( level._id_CB75, "training_intro_talk2", "training_intro_idle" );
    level.foley.animnode firing_range_anim_then_idle( level.foley, "training_intro_talk2", "training_intro_idle2" );
    common_scripts\utility::flag_wait( "firing_range_hip_and_ads_done" );
    level._id_D3E4 thread firing_range_anim_then_idle( level._id_CB75, "training_intro_talk3", "training_intro_idle" );
    level.foley.animnode maps\_anim::anim_single_solo( level.foley, "training_intro_talk3" );
    common_scripts\utility::flag_set( "foley_done_talking_from_hip_ads_training" );
}

_id_A871()
{
    level.foley.animnode thread maps\_anim::anim_loop_solo( level.foley, "training_intro_idle", "stop_firing_range_anim" );
    wait 0.05;
}

_id_B2CB()
{
    common_scripts\utility::flag_wait( "firing_range_initialized" );
    var_0 = 1;
    thread _id_D20A();
    common_scripts\utility::flag_wait( "ps_train_fly_welcome" );
    soundscripts\_snd::snd_message( "aud_start_mix_practice_range" );
    common_scripts\utility::flag_wait( "foley_anim_pickup_weapon" );
    thread firing_range_player_pick_up_gun();

    if ( !_id_D39F() )
    {
        _id_BD26( "obj_rifle", &"TRAINER_PICK_UP_A_RIFLE_FROM", getent( "range_rifle", "script_noteworthy" ) );
        _id_C7C7( "obj_rifle", "current" );
        var_1 = getent( "pickup_rifle", "targetname" );

        if ( isdefined( var_1 ) )
            var_1 maps\_utility::glow( "h2_weapon_m4_grunt_obj" );

        level.foley thread _id_D25D( "nag_rifle_pickup_0", 2, "player_picked_up_rifle" );
    }
    else
        var_0 = 0;

    while ( !_id_D39F() )
        wait 0.05;

    common_scripts\utility::flag_set( "player_picked_up_rifle" );
    maps\_utility::ui_set_waypoint_center_fade_settings( 2000, 0, 0 );

    if ( var_0 == 0 )
    {
        _id_BD26( "obj_rifle", &"TRAINER_SHOOT_EACH_TARGET_WHILE1", getent( "firing_range", "targetname" ) );
        _id_C7C7( "obj_rifle", "current" );
    }
    else
    {
        _id_B2F2( "obj_rifle", &"TRAINER_SHOOT_EACH_TARGET_WHILE1" );
        _id_D393( "obj_rifle", getent( "firing_range", "targetname" ) );
    }

    maps\_utility::add_wait( maps\_utility::_wait, 2.0 );
    maps\_utility::add_abort( common_scripts\utility::flag_wait, "player_facing_targets_for_hip_fire" );
    level.foley maps\_utility::add_func( maps\_utility::dialogue_queue, "train_fly_turnaround" );
    thread maps\_utility::do_wait();
    thread maps\_utility::delaythread( 8, ::_id_C1DE, "player_facing_targets_for_hip_fire" );

    while ( !common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), level._id_D0AB.origin, level.cosine["45"] ) )
        wait 0.05;

    common_scripts\utility::flag_set( "player_facing_targets_for_hip_fire" );
    clear_hints();
    level.foley thread _id_C90F( "nag_hip_fire_0", 2, "player_needs_to_fire_from_the_hip", "hip_fire_done" );

    if ( level.xenon )
        thread _id_CED3( "hip_attack", undefined );
    else
        thread _id_CED3( "pc_hip_attack", undefined );

    var_2 = 2;
    var_3 = 0;
    _id_C5CB( level._id_B03E, var_2, var_3, undefined, undefined, 1 );
    level.player notify( "did_action_stop_ads" );
    clear_hints();
    var_4 = undefined;

    if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
        thread _id_CED3( "look_inversion", 5 );
    else
        thread _id_CED3( "look_inversion_pc", 5 );

    soundscripts\_snd::snd_message( "aud_start_mix_info_popup" );
    _id_C7C7( "obj_rifle", "done" );
    common_scripts\utility::flag_set( "hip_fire_done" );
    level.foley waittill( "train_fly_pickyourtargets" );
    thread maps\_utility::autosave_by_name( "ads_training" );
    level.foley waittill( "train_fly_crouchfirst" );
    _id_C7C7( "obj_rifle", "current" );
    thread _id_B2F2( "obj_rifle", &"TRAINER_SHOOT_EACH_TARGET_WHILE" );
    var_2 = 3;
    var_3 = 1;
    var_5 = 1;

    if ( level.player getstance() != "crouch" )
        thread _id_CED3( "crouch" );

    level.foley thread _id_C90F( "nag_ads_fire_0", 2, "player_needs_to_ADS", "firing_range_hip_and_ads_done" );
    level.foley thread _id_C90F( "nag_crouch_fire_0", 2, "player_needs_to_crouch", "firing_range_hip_and_ads_done" );
    _id_C5CB( level._id_C5CA, var_2, var_3, var_5 );
    level.player notify( "did_action_crouch" );
    level.player notify( "did_action_ads_360" );
    level.player notify( "did_action_ads" );
    clear_hints();
    _id_C7C7( "obj_rifle", "done" );
    common_scripts\utility::flag_set( "firing_range_hip_and_ads_done" );

    if ( level.player getstance() != "stand" )
        thread _id_CED3( "stand" );
}

_id_C1DE( var_0 )
{
    level endon( var_0 );

    if ( !common_scripts\utility::flag( var_0 ) )
        thread _id_B682( &"TRAINER_HINT_TURN_AROUND" );
}

_id_D25D( var_0, var_1, var_2 )
{
    thread _id_CEA3( var_2 );
    level endon( var_2 );

    while ( !common_scripts\utility::flag( var_2 ) )
    {
        wait(randomfloatrange( 25, 35 ));
        var_3 = 1;

        if ( common_scripts\utility::flag( "can_talk" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            dialogue_execute( var_0 + var_3, undefined, 1 );
            common_scripts\utility::flag_set( "can_talk" );
            var_3++;

            if ( var_3 > var_1 )
                var_3 = 1;
        }
    }
}

_id_C90F( var_0, var_1, var_2, var_3 )
{
    thread _id_CEA3( var_3 );
    level endon( var_3 );
    var_4 = 1;

    while ( !common_scripts\utility::flag( var_3 ) )
    {
        level waittill( var_2 );

        if ( common_scripts\utility::flag( "can_talk" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            dialogue_execute( var_0 + var_4, undefined, 1 );
            common_scripts\utility::flag_set( "can_talk" );
            var_4++;

            if ( var_4 > var_1 )
                var_4 = 1;
        }
    }
}

_id_CEA3( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    wait 0.05;
    common_scripts\utility::flag_set( "can_talk" );
}

_id_C5CB( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = 0;

    if ( isdefined( var_5 ) )
    {
        var_7 = [];

        while ( var_7.size < var_0.size )
        {
            wait 0.05;

            foreach ( var_9 in var_0 )
            {
                if ( var_9.script_group == var_7.size )
                    var_7[var_7.size] = var_9;
            }
        }

        var_0 = var_7;
    }

    for (;;)
    {
        wait 0.05;

        if ( var_6 >= var_1 )
            break;

        foreach ( var_9 in var_0 )
        {
            if ( var_6 >= var_1 )
                break;

            var_9 notify( "pop_up" );
            var_9 waittill( "hit" );

            if ( isdefined( var_3 ) )
            {
                if ( level.player getstance() == "crouch" )
                    level.player notify( "did_action_crouch" );
                else
                {
                    thread _id_CED3( "crouch" );
                    level notify( "player_needs_to_crouch" );
                    continue;
                }
            }

            if ( isdefined( var_2 ) )
            {
                if ( var_2 == 0 )
                {
                    if ( !level.player maps\_utility::isads() )
                    {
                        var_6++;
                        level.player notify( "did_action_stop_ads" );
                    }
                    else
                    {
                        thread _id_CED3( "stop_ads", undefined, 1 );
                        level notify( "player_needs_to_fire_from_the_hip" );
                    }
                }

                if ( var_2 == 1 )
                {
                    if ( level.player maps\_utility::isads() )
                    {
                        var_6++;
                        level.player notify( "did_action_ads" );
                        level.player notify( "did_action_ads_360" );
                    }
                    else
                    {
                        if ( level.xenon )
                            thread _id_CED3( "ads_360" );
                        else
                            thread _id_CED3( "ads" );

                        level notify( "player_needs_to_ADS" );
                    }
                }
            }

            if ( isdefined( var_4 ) )
            {
                waittillframeend;
                var_12 = gettime();

                if ( level._id_BC88 == var_12 )
                {
                    var_6++;
                    clear_hints();
                    continue;
                }

                clear_hints();
                level notify( "player_needs_to_shoot_through_plywood" );
                continue;
            }
        }
    }

    common_scripts\utility::array_thread( var_0, ::_id_D1CA );
}

_id_B0F4()
{
    var_0 = level.player getlocalplayerprofiledata( "autoAim" );

    if ( !var_0 || !level.player common_scripts\utility::is_player_gamepad_enabled() )
    {
        level._id_D457 = 1;
        common_scripts\utility::flag_set( "firing_range_timed_ads_done" );
        common_scripts\utility::flag_set( "foley_done_talking_from_timed_ads_training" );
        thread _id_AD13();
    }
    else
    {
        thread _id_B94C();
        common_scripts\utility::flag_wait( "firing_range_timed_ads_done" );
        thread _id_AD13();
    }
}

_id_C733()
{
    common_scripts\utility::flag_wait( "foley_done_talking_from_hip_ads_training" );
    level._id_D3E4 thread firing_range_anim_then_idle( level._id_CB75, "training_intro_talk4", "training_intro_idle2" );
    level.foley.animnode firing_range_anim_then_idle( level.foley, "training_intro_talk4", "training_intro_idle" );
    common_scripts\utility::flag_wait( "firing_range_timed_ads_done" );
    level._id_D3E4 thread firing_range_anim_then_idle( level._id_CB75, "training_intro_talk5", "training_intro_idle" );
    level.foley.animnode maps\_anim::anim_single_solo( level.foley, "training_intro_talk5" );
    common_scripts\utility::flag_set( "foley_done_talking_from_timed_ads_training" );
}

_id_B94C()
{
    common_scripts\utility::flag_wait( "firing_range_hip_and_ads_done" );
    thread _id_C733();
    thread maps\_utility::autosave_by_name( "timed_ads" );
    level.foley waittill( "train_fly_showemprivate" );
    _id_BD26( "obj_timed_rifle", &"TRAINER_SHOOT_EACH_TARGET_AS", getent( "firing_range", "targetname" ) );
    _id_C7C7( "obj_timed_rifle", "current" );
    level.foley waittill( "train_fly_iftargetclose" );

    if ( level.player getweaponammoclip( level._id_A836 ) < level._id_BC34 )
    {
        _id_CED3( "reload" );
        wait 2.0;
    }

    var_0 = 0;
    var_1 = 0;
    level.foley thread _id_C90F( "nag_ads_snap_0", 4, "player_needs_to_ADS", "firing_range_timed_ads_done" );

    for (;;)
    {
        if ( _id_BDD2() && var_0 != 0 )
        {
            if ( level.xenon )
                var_2 = _id_C3F6( "ads_switch" );
            else
                var_2 = _id_C3F6( "ads_switch_shoulder" );

            var_3 = 1;
            thread _id_B682( var_2.hint, 10, var_3 );
            wait 4;
        }

        level._id_AFDF = 0;
        level._id_D15C = 0;
        level._id_CF8B = 0;
        thread _id_C741();
        level waittill( "a timed target has been hit" );
        level common_scripts\utility::waittill_notify_or_timeout( "player_has_hit_too_many_from_hip", 10 );
        level notify( "times_up" );

        if ( level._id_AFDF > 6 )
        {
            if ( level._id_D15C > 4 )
                break;
        }

        wait 1;
        var_0++;
        common_scripts\utility::array_thread( level._id_BAAA, ::_id_D1CA );

        if ( level._id_D15C < 4 )
            level.foley dialogue_execute( "timed_ads_not_snapping_0" + var_1, undefined, 1 );
        else
            level.foley dialogue_execute( "timed_ads_too_slow_0" + var_1, undefined, 1 );

        var_1++;

        if ( var_1 > 2 )
            var_1 = 0;

        wait 1;

        if ( level.player getweaponammoclip( level._id_A836 ) < level._id_BC34 )
        {
            thread _id_CED3( "reload" );

            while ( level.player getweaponammoclip( level._id_A836 ) < level._id_BC34 )
                wait 0.1;

            clear_hints();
            wait 1;
        }
    }

    wait 1;
    _id_C7C7( "obj_timed_rifle", "done" );
    common_scripts\utility::array_thread( level._id_BAAA, ::_id_D1CA );
    wait 0.5;
    common_scripts\utility::flag_set( "firing_range_timed_ads_done" );
}

_id_C741()
{
    level endon( "times_up" );
    var_0 = level._id_BAAA;
    var_1 = -1;

    for (;;)
    {
        for (;;)
        {
            wait 0.05;
            var_2 = randomint( var_0.size );

            if ( var_2 != var_1 )
                break;
        }

        var_1 = var_2;
        var_0[var_2] notify( "pop_up" );
        var_0[var_2] waittill( "hit" );
        level notify( "a timed target has been hit" );

        if ( level.player maps\_utility::isads() )
        {
            level._id_D15C++;
            level.player notify( "did_action_ads" );
            level.player notify( "did_action_ads_360" );
        }
        else
        {
            level._id_CF8B++;

            if ( level._id_CF8B > 2 )
            {
                level notify( "player_has_hit_too_many_from_hip" );
                break;
            }

            if ( level.xenon )
                thread _id_CED3( "ads_360" );
            else
                thread _id_CED3( "ads" );

            level notify( "player_needs_to_ADS" );
        }

        level._id_AFDF++;
        wait 0.1;
    }
}

_id_AD13()
{
    thread _id_D4A6();
    common_scripts\utility::flag_wait( "firing_range_penetration_done" );
    thread _id_C7D0();
}

_id_BCE8()
{
    if ( level._id_D457 == 1 )
        common_scripts\utility::flag_wait( "foley_done_talking_from_hip_ads_training" );

    common_scripts\utility::flag_wait( "foley_done_talking_from_timed_ads_training" );
    level._id_D3E4 thread firing_range_anim_then_idle( level._id_CB75, "training_intro_talk6", "training_intro_idle" );
    level.foley.animnode firing_range_anim_then_idle( level.foley, "training_intro_talk6", "training_intro_idle" );
    common_scripts\utility::flag_set( "foley_done_talking_from_penetration_training" );
}

_id_D4A6()
{
    thread _id_BCE8();
    thread maps\_utility::autosave_by_name( "penetration" );
    level.foley waittill( "train_fly_theprivatehere" );
    _id_BD26( "obj_penetration", &"TRAINER_SHOOT_A_TARGET_THROUGH", getent( "obj_penetration_origin", "targetname" ) );
    _id_C7C7( "obj_penetration", "current" );

    while ( !common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), level._id_D0AB.origin, level.cosine["45"] ) )
        wait 0.05;

    level.foley thread _id_C90F( "nag_penetration_fire_0", 2, "player_needs_to_shoot_through_plywood", "firing_range_penetration_done" );
    thread _id_B3E3();
    var_0 = 1;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = 1;
    _id_C5CB( level._id_C453, var_0, var_1, var_2, var_3 );
    thread _id_CBFB();
    _id_C7C7( "obj_penetration", "done" );
    maps\_utility::delaythread( 3, ::_id_BA2D );
    clear_hints();
    common_scripts\utility::flag_set( "firing_range_penetration_done" );
}

_id_B3E3()
{
    level._id_C3E0 rotateroll( 90, 0.25, 0.1, 0.1 );
    level._id_C3E0 playsound( "trainer_target_up_wood" );
    level._id_C3E0.up = 1;
    level._id_C3E0 endon( "plywood_going_down" );
    level._id_C3E0 solid();
    level._id_C3E0 setcandamage( 1 );
    wait 0.25;

    while ( level._id_C3E0.up == 1 )
    {
        level._id_C3E0 waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !isdefined( var_4 ) )
            continue;

        if ( isplayer( var_1 ) )
            level._id_BC88 = gettime();
    }
}

_id_BA2D()
{
    level._id_C3E0 rotateroll( -90, 0.25, 0.1, 0.1 );
    level._id_C3E0 playsound( "trainer_target_up_wood" );
    level._id_C3E0 notify( "plywood_going_down" );
    level._id_C3E0.up = 0;
}

_id_C7D0()
{
    thread _id_BF02();
    common_scripts\utility::flag_wait( "firing_range_frags_done" );
    thread _id_B651();
}

_id_C627()
{
    common_scripts\utility::flag_wait( "foley_done_talking_from_penetration_training" );
    level.grenadeanimnode maps\_utility::add_wait( maps\_anim::anim_single_solo, level.grenade_box, "training_intro_talk7" );
    maps\_utility::add_func( common_scripts\utility::flag_set, "player_can_pick_up_frags" );
    thread maps\_utility::do_wait();
    thread firing_range_foley_frag();
    level._id_D3E4 thread firing_range_anim_then_idle( level._id_CB75, "training_intro_talk7", "training_intro_idle" );
    level.foley.animnode firing_range_anim_then_idle( level.foley, "training_intro_talk7", "training_intro_idle" );
    wait 0.05;
    common_scripts\utility::flag_set( "foley_done_talking_from_frag_training" );
}

firing_range_foley_frag()
{
    level.foley waittillmatch( "single anim", "grab_grenade" );
    var_0 = level.foley_frag.origin;
    var_1 = level.foley_frag.angles;
    level.foley_frag linkto( level.foley, "tag_inhand", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.foley waittillmatch( "single anim", "drop_grenade" );
    level.foley_frag.origin = var_0;
    level.foley_frag.angles = var_1;
    level.foley_frag linkto( level.grenade_box, "J_Box" );
}

_id_BF02()
{
    if ( !common_scripts\utility::flag( "frags_have_been_spawned" ) )
        thread _id_CBFB();

    thread maps\_utility::autosave_by_name( "frags" );
    thread _id_C627();
    wait 1;
    maps\_utility::ui_reset_waypoint_center_fade_settings();
    common_scripts\utility::flag_wait( "player_can_pick_up_frags" );
    var_0 = 0;

    if ( !common_scripts\utility::flag( "player_picked_up_frags" ) )
    {
        thread _id_B830();
        _id_BD26( "obj_frags", &"TRAINER_PICK_UP_THE_FRAG_GRENADES", getent( "frag_pickup", "targetname" ) );
        _id_C7C7( "obj_frags", "current" );
    }
    else
        var_0 = 1;

    while ( level.player getweaponammostock( level.player getoffhandprimaryclass() ) < 3 )
        wait 0.05;

    maps\_utility::ui_set_waypoint_center_fade_settings( 2000, 0, 0 );
    level.player enableoffhandweapons();
    setsaveddvar( "ui_hideGrenadeWidget", 0 );

    if ( var_0 )
    {
        _id_BD26( "obj_frags", &"TRAINER_THROW_A_GRENADE_INTO", getent( "frag_obj", "targetname" ) );
        _id_C7C7( "obj_frags", "current" );
        _id_D393( "obj_frags", getent( "frag_obj", "targetname" ) );
    }
    else
    {
        thread _id_B2F2( "obj_frags", &"TRAINER_THROW_A_GRENADE_INTO" );
        _id_C7C7( "obj_frags", "current" );
        _id_D393( "obj_frags", getent( "frag_obj", "targetname" ) );
    }

    thread _id_BC27();
    var_1 = 1;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = 1;

    while ( !common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), level._id_D0AB.origin, level.cosine["45"] ) )
        wait 0.05;

    common_scripts\utility::flag_set( "training_intro_trainees_pre_end_idle" );
    level._id_D48C notify( "stop_firing_range_anim" );
    level._id_D48C thread maps\_anim::anim_loop_solo( level._id_D5D6, "training_intro_pre_end_idle", "stop_firing_range_anim" );
    common_scripts\utility::array_thread( level._id_B707, ::_id_CCB4, "targets_hit_with_grenades" );
    common_scripts\utility::array_thread( level._id_B707, ::_id_D338, "targets_hit_with_grenades" );
    thread _id_CED3( "frag", undefined, 1 );
    common_scripts\utility::flag_wait( "targets_hit_with_grenades" );
    common_scripts\utility::flag_set( "firing_range_frags_done" );
    clear_hints();
    wait 1;
    _id_C7C7( "obj_frags", "done" );

    if ( level.player getweaponammostock( level.player getoffhandprimaryclass() ) > 0 )
    {
        level.player setweaponammostock( level.player getoffhandprimaryclass(), 0 );
        setsaveddvar( "ui_hideGrenadeWidget", 1 );
    }

    common_scripts\utility::array_thread( level._id_B707, ::_id_D1CA );
}

_id_BC27()
{
    var_0 = 0;
    level.foley waittill( "train_fly_grenadedownrange" );
    level endon( "targets_hit_with_grenades" );
    thread _id_BAD7();

    while ( !common_scripts\utility::flag( "targets_hit_with_grenades" ) )
    {
        wait 6;

        if ( !common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), level._id_D0AB.origin, level.cosine["45"] ) )
        {
            thread _id_B682( &"TRAINER_HINT_TURN_AROUND" );

            while ( !common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), level._id_D0AB.origin, level.cosine["45"] ) )
                wait 0.05;

            clear_hints();
            continue;
        }

        if ( !common_scripts\utility::flag( "player_just_threw_a_frag" ) )
        {
            level.foley dialogue_execute( "frag_nag_0" + var_0, undefined, 1 );
            var_0++;

            if ( var_0 > 2 )
                var_0 = 0;
        }
    }
}

_id_BAD7()
{
    level endon( "targets_hit_with_grenades" );

    for (;;)
    {
        level.player common_scripts\utility::waittill_either( "grenade_pullback", "did_action_frag" );
        common_scripts\utility::flag_set( "player_just_threw_a_frag" );
        wait 5;
        common_scripts\utility::flag_clear( "player_just_threw_a_frag" );
    }
}

_id_D338( var_0 )
{
    level endon( var_0 );

    for (;;)
    {
        self waittill( "hit_with_grenade" );

        if ( !common_scripts\utility::flag( var_0 ) )
            common_scripts\utility::flag_set( var_0 );
    }
}

_id_CCB4( var_0 )
{
    level endon( var_0 );

    for (;;)
    {
        self notify( "pop_up" );
        self waittill( "hit" );
        wait 1;
    }
}

_id_B4E6( var_0 )
{
    self enablegrenadetouchdamage();

    for (;;)
    {
        self waittill( "trigger" );

        if ( !common_scripts\utility::flag( var_0 ) )
            common_scripts\utility::flag_set( var_0 );

        break;
    }
}

_id_B830()
{
    var_0 = getentarray( "frags", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::glow );
    common_scripts\utility::flag_wait_either( "player_picked_up_frags", "firing_range_frags_done" );
    common_scripts\utility::array_thread( var_0, maps\_utility::stopglow );
}

_id_AAE0()
{
    var_0 = getentarray( "frags", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::stopglow );
}

_id_CBFB()
{
    common_scripts\utility::flag_set( "frags_have_been_spawned" );
    var_0 = getent( "frag_trigger", "script_noteworthy" );
    level._id_CF1E = getentarray( "frags_pickup", "targetname" );
    var_1 = 4;
    level endon( "firing_range_frags_done" );
    common_scripts\utility::flag_wait( "player_can_pick_up_frags" );

    for (;;)
    {
        wait 0.1;
        var_0 waittill( "trigger" );

        if ( common_scripts\utility::flag( "h2_player_picking_up_frags" ) )
            continue;

        if ( !level.player worldpointinreticle_circle( level.grenade_box.origin, 45, 400 ) )
            continue;

        if ( level.player getweaponammostock( level.player getoffhandprimaryclass() ) > 3 )
            continue;

        if ( !common_scripts\utility::flag( "player_picked_up_frags" ) )
        {
            common_scripts\utility::flag_set( "player_picked_up_frags" );
            level.player giveweapon( level.player getoffhandprimaryclass() );
            level.player setweaponammostock( level.player getoffhandprimaryclass(), 0 );
            _id_AAE0();
            thread firing_range_player_pick_up_grenades();
            continue;
        }

        var_2 = level.player getweaponammostock( level.player getoffhandprimaryclass() );
        var_3 = var_1 - var_2;

        if ( var_3 > 0 )
        {
            _id_D0DC( var_3 );
            level.player givemaxammo( level.player getoffhandprimaryclass() );
            level.player playsound( "grenade_pickup" );
        }
    }
}

_id_D0DC( var_0 )
{
    level endon( "firing_range_frags_done" );
    var_1 = [];

    foreach ( var_3 in level._id_CF1E )
    {
        if ( !isdefined( var_3.hidden ) )
            var_1[var_1.size] = var_3;
    }

    if ( var_1.size == 0 )
        return;

    var_5 = 0;
    var_6 = undefined;
    var_7 = [];

    while ( var_5 < var_0 && var_1.size > 0 )
    {
        wait 0.05;
        var_6 = common_scripts\utility::getclosest( level.player.origin, var_1 );

        if ( !isdefined( var_6 ) )
            continue;

        var_1 = common_scripts\utility::array_remove( var_1, var_6 );
        var_6 hide();
        var_6.hidden = 1;
        var_7[var_7.size] = var_6;
        var_5++;
    }

    thread _id_B4B5( var_7, 3 );
}

_id_B4B5( var_0, var_1 )
{
    level endon( "firing_range_frags_done" );
    wait 0.5;

    while ( level.player getweaponammostock( level.player getoffhandprimaryclass() ) > 0 )
        wait 0.05;

    var_2 = gettime();

    for (;;)
    {
        wait 0.5;

        if ( common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), level._id_D0AB.origin, level.cosine["45"] ) )
            break;

        if ( gettime() >= var_2 + var_1 * 1000 )
            break;
    }

    common_scripts\utility::array_call( var_0, ::show );

    foreach ( var_4 in var_0 )
        var_4.hidden = undefined;
}

_id_B651()
{
    thread h2_pitguy_intro();
    maps\_utility::ui_reset_waypoint_center_fade_settings();
    common_scripts\utility::flag_wait( "sidearm_complete" );
    thread _id_C539();
}

h2_pitguy_intro()
{
    level.pitanimnode = spawnstruct();
    level.pitanimnode.origin = ( -3568.0, 2280.0, -192.0 );
    level.pitanimnode.angles = ( 0.0, -90.0, 0.0 );
    level.pitanimnode maps\_anim::anim_first_frame( level._id_C16E, "open_case_soldier" );
    level.pitanimnode thread maps\_anim::anim_loop( level._id_BED5, "sitting_idle_soldier", "stop_idle" );
    thread _id_C4BF();
    level.foley waittill( "train_fly_fragstendtoroll" );
    thread blocker_range_removal();
    thread maps\_utility::autosave_by_name( "find_the_pit" );
    level.foley waittill( "train_fly_thanksforhelp" );
    soundscripts\_snd::snd_message( "aud_stop_mix_practice_range" );
    thread _id_B64A();
    setsaveddvar( "objectiveAlpha", 1 );
    _id_BD26( "obj_course_locate", &"TRAINER_DEBRIEF_WITH_DUNN", getent( "origin_sidearm_table_babystep_1", "targetname" ) );
    _id_C7C7( "obj_course_locate", "current" );
    common_scripts\utility::flag_set( "obj_go_to_the_pit_given" );
    maps\_utility::delaythread( 4, ::_id_AF44, "obj_go_to_the_pit_done" );
    common_scripts\utility::flag_wait( "player_passing_barracks" );
    common_scripts\utility::flag_wait( "player_at_pit_stairs" );
    _id_D393( "obj_course_locate", getent( "origin_sidearm_table", "targetname" ) );
    common_scripts\utility::flag_wait( "player_entering_course" );
    thread cqb_timer_setup();
    thread h2_weapon_inspect_tutorial();
    common_scripts\utility::flag_set( "obj_go_to_the_pit_done" );
    wait 0.05;
    clear_hints();
    _id_C7C7( "obj_course_locate", "done" );
    thread _id_B168();
}

blocker_range_removal()
{
    wait 6;
    var_0 = getent( "blocker_range", "targetname" );
    var_0 maps\_utility::hide_entity();
}

_id_C4BF()
{
    common_scripts\utility::flag_wait( "firing_range_frags_done" );
    common_scripts\utility::flag_wait( "foley_done_talking_from_frag_training" );
    level.foley.animnode notify( "stop_firing_range_anim" );
    level._id_D3E4 notify( "stop_firing_range_anim" );
    level._id_D3E4 thread maps\_anim::anim_single_solo( level._id_CB75, "training_intro_talk8" );
    level.foley.animnode maps\_anim::anim_single_solo( level.foley, "training_intro_talk8" );
    common_scripts\utility::flag_set( "training_intro_end_anims" );
    level.foley.animnode thread firing_range_anim_then_idle( level.foley, "training_intro_end", "training_intro_end_idle" );
    level._id_D48C thread firing_range_anim_then_idle( level._id_D5D6, "training_intro_end", "training_intro_end_idle" );
    level._id_D3E4 thread firing_range_anim_then_idle( level._id_CB75, "training_intro_end", "training_intro_end_idle" );
}

_id_D430()
{
    level._id_B85D._id_D108 = 1;
    level._id_D177 show();
    level._id_B85D.animnode maps\_anim::anim_first_frame( level._id_BED5, "training_pit_sitting_welcome" );
    level._id_B85D.animnode maps\_anim::anim_first_frame( level._id_C16E, "training_pit_open_case" );
    level._id_B85D.animnode thread maps\_anim::anim_loop( level._id_BED5, "training_pit_sitting_idle", "stop_idle" );
    thread _id_C4BF();
    level.foley waittill( "train_fly_fragstendtoroll" );
    var_0 = getent( "blocker_range", "targetname" );
    var_0 maps\_utility::hide_entity();
    thread maps\_utility::autosave_by_name( "find_the_pit" );
    level.foley waittill( "train_fly_thanksforhelp" );
    soundscripts\_snd::snd_message( "aud_stop_mix_practice_range" );
    thread _id_B64A();
    setsaveddvar( "objectiveAlpha", 1 );
    _id_BD26( "obj_course_locate", &"TRAINER_DEBRIEF_WITH_DUNN", getent( "origin_sidearm_table_babystep_1", "targetname" ) );
    _id_C7C7( "obj_course_locate", "current" );
    common_scripts\utility::flag_set( "obj_go_to_the_pit_given" );
    maps\_utility::delaythread( 4, ::_id_AF44, "obj_go_to_the_pit_done" );
    common_scripts\utility::flag_wait( "player_passing_barracks" );
    common_scripts\utility::flag_wait( "player_at_pit_stairs" );
    _id_D393( "obj_course_locate", getent( "origin_sidearm_table", "targetname" ) );
    common_scripts\utility::flag_wait( "player_entering_course" );
    common_scripts\utility::flag_set( "obj_go_to_the_pit_done" );
    wait 0.05;
    clear_hints();
    _id_C7C7( "obj_course_locate", "done" );
    thread _id_B168();
}

_id_B281()
{
    level._id_B85D.animnode notify( "stop_idle" );
    level._id_B85D.animnode maps\_anim::anim_single( level._id_BED5, "training_pit_sitting_welcome" );
    level._id_B85D.animnode notify( "stop_idle" );
    level._id_B85D.animnode thread maps\_anim::anim_loop( level._id_BED5, "training_pit_sitting_idle", "stop_idle" );
    common_scripts\utility::flag_set( "dunn_finished_welcome_anim" );
}

_id_B168()
{
    setsaveddvar( "objectiveAlpha", level._id_BC4C );
    thread maps\_utility::autosave_by_name( "sidearm" );
    level._id_B85D waittill( "readyToGo" );
    level.pitanimnode notify( "stop_idle" );
    level.pitanimnode maps\_anim::anim_single( level._id_BED5, "sitting_welcome_soldier" );

    if ( !level.player hasweapon( level._id_D033 ) )
        level.pitanimnode maps\_anim::anim_single( level._id_BED5, "sitting_welcome_soldier_grab" );
    else
        level.pitanimnode maps\_anim::anim_single( level._id_BED5, "sitting_welcome_soldier_sidearm" );

    var_0 = 1;

    if ( !level.player hasweapon( level._id_D033 ) )
    {
        level.pitanimnode thread maps\_anim::anim_loop( level._id_BED5, "sitting_idle_soldier", "stop_idle" );
        var_0 = 0;
        _id_BD26( "obj_sidearm", &"TRAINER_GET_A_PISTOL_FROM_THE", getent( "origin_sidearm_table", "targetname" ) );
        _id_C7C7( "obj_sidearm", "current" );
        var_1 = getent( "pickup_sidearm", "targetname" );

        if ( isdefined( var_1 ) )
            var_1 maps\_utility::glow( "h2_weapon_desert_eagle_base_obj" );
    }

    while ( !level.player hasweapon( level._id_D033 ) )
        wait 0.05;

    if ( var_0 == 1 )
    {
        _id_BD26( "obj_sidearm", &"TRAINER_GET_A_PISTOL_FROM_THE", getent( "origin_course_01", "targetname" ) );
        _id_C7C7( "obj_sidearm", "current" );
    }
    else
        wait 1;

    _id_D393( "obj_sidearm", undefined );
    _id_B2F2( "obj_sidearm", &"TRAINER_SWITCH_TO_YOUR_RIFLE" );
    var_2 = level.player getcurrentweapon();

    if ( var_2 == level._id_D033 )
    {
        if ( !var_0 )
        {
            level._id_B85D waittill( "readyToGo" );
            level.pitanimnode notify( "stop_idle" );
        }

        level.pitanimnode maps\_anim::anim_single( level._id_BED5, "sitting_switchgun_VO1" );
        var_2 = level.player getcurrentweapon();
        var_3 = 0;

        if ( var_2 != level._id_A836 )
        {
            level.pitanimnode thread maps\_anim::anim_loop( level._id_BED5, "sitting_switchgun_idle", "stop_idle" );
            var_3 = 1;
            thread _id_CED3( "primary" );
        }

        while ( level.player getcurrentweapon() == level._id_D033 )
        {
            _id_CED3( "primary" );
            wait 0.05;
        }

        clear_hints();

        if ( var_3 )
        {
            level._id_B85D waittill( "readyToGo" );
            level.pitanimnode notify( "stop_idle" );
            var_3 = 0;
        }

        level.pitanimnode maps\_anim::anim_single( level._id_BED5, "sitting_switchgun_VO2" );

        if ( level.player getcurrentweapon() != level._id_D033 )
        {
            level.pitanimnode thread maps\_anim::anim_loop( level._id_BED5, "sitting_switchgun_idle", "stop_idle" );
            var_3 = 1;
            thread _id_CED3( "sidearm" );
        }

        while ( level.player getcurrentweapon() != level._id_D033 )
        {
            wait 0.05;
            clear_hints();
            _id_CED3( "sidearm" );
        }

        if ( var_3 )
        {
            level._id_B85D waittill( "readyToGo" );
            level.pitanimnode notify( "stop_idle" );
        }

        clear_hints();
    }
    else
    {
        level.pitanimnode maps\_anim::anim_single( level._id_BED5, "sitting_switchgun_VO1_switch" );
        var_3 = 0;

        if ( level.player getcurrentweapon() != level._id_D033 )
        {
            level.pitanimnode thread maps\_anim::anim_loop( level._id_BED5, "sitting_switchgun_idle", "stop_idle" );
            var_3 = 1;
            thread _id_CED3( "sidearm" );
        }

        while ( level.player getcurrentweapon() != level._id_D033 )
        {
            clear_hints();
            thread _id_CED3( "sidearm" );
            wait 0.05;
        }

        if ( var_3 )
        {
            level._id_B85D waittill( "readyToGo" );
            level.pitanimnode notify( "stop_idle" );
        }

        clear_hints();
    }

    _id_C7C7( "obj_sidearm", "done" );
    common_scripts\utility::flag_set( "sidearm_complete" );
    level notify( "sideArmTraining_end" );
}

_id_C539()
{
    thread _id_B314();
    thread _id_AE2B();
}

_id_B314()
{
    if ( !isdefined( level._id_B85D._id_D108 ) )
        level._id_D177 show();

    thread maps\trainer_aud::aud_handle_pit_scene_mix();
    thread _id_AF00();
    level.pitanimnode thread maps\_anim::anim_single( level._id_BED5, "open_case_soldier" );
    thread handledunnbeforepit();
    common_scripts\utility::flag_wait( "player_has_started_course" );
    level notify( "DunnIsReady" );
    level._id_D177 delete();
    level.pitanimnode maps\_anim::anim_first_frame_solo( level._id_B85D, "dunn_pit_outro" );
    waitframe();
    level._id_B85D.bdisabledefaultfacialanims = undefined;
    thread resetdunn();
}

resetdunn()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "player_course_jumped_down" );
        level._id_B85D maps\_utility::anim_stopanimscripted();
        level.pitanimnode notify( "stop_idle" );
        level notify( "clear_Dunn" );
        level.pitanimnode maps\_anim::anim_first_frame_solo( level._id_B85D, "dunn_pit_outro" );
        wait 2;
        common_scripts\utility::flag_clear( "player_course_jumped_down" );
    }
}

handledunnbeforepit()
{
    level endon( "DunnIsReady" );
    level._id_B85D waittillmatch( "single anim", "end" );
    var_0 = 0;
    level.pitanimnode maps\_anim::anim_single( level._id_BED5, "stand_wait_idle" );
    level.pitanimnode maps\_anim::anim_single( level._id_BED5, "stand_End_VO3" );

    for (;;)
    {
        if ( var_0 )
        {
            var_0 = 0;
            level.pitanimnode maps\_anim::anim_single( level._id_BED5, "stand_End_VO4" );
            continue;
        }

        var_0 = 1;
        level.pitanimnode thread maps\_anim::anim_loop( level._id_BED5, "stand_End_idle", "stop_idle" );
        level._id_B85D waittillmatch( "looping anim", "end" );
        level.pitanimnode notify( "stop_idle" );
    }
}

_id_C338()
{
    common_scripts\utility::flag_wait( "dunn_notetrack_open_case_dialogue" );
    level._id_B85D maps\_utility::play_sound_on_tag( "train_cpd_smileforcameras", "TAG_EYE" );
    common_scripts\utility::flag_set( "dunn_finished_with_open_case_dialogue" );
}

_id_C4F7()
{
    level._id_B85D = maps\_utility::spawn_targetname( "pitguy", 1 );
    level._id_B85D maps\_utility::gun_remove();
    level._id_B85D.animname = "dunn";
    level._id_B85D.bdisabledefaultfacialanims = 1;
    level._id_B85D _id_B3AB::_id_BEBA( "head", level.player, 300, 45, 45, 30, 45, 0, 1, 10, 0 );
    level._id_D177 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level._id_D177 setmodel( "h2_viewmodel_desert_eagle_silver" );
    level._id_D177.origin = level._id_B85D.origin;
    level._id_D177.animname = "pit_gun";
    level._id_D177 maps\_utility::assign_animtree();
    level._id_B85D.animnode = getent( "node_dunn_training", "targetname" );
    level._id_BED5 = [];
    level._id_BED5[0] = level._id_B85D;
    level._id_BED5[1] = level._id_D177;
}

_id_AE2B()
{
    common_scripts\utility::flag_wait( "case_flip_01" );
    level.pitanimnode thread maps\_anim::anim_single_solo( level._id_B5F1, "open_case_soldier" );
    level._id_B5F1 playsound( "scn_trainer_case_open1" );
    var_0 = getentarray( "pit_weapons_case_01", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_C1D1 );
    common_scripts\utility::flag_wait( "case_flip_02" );
    level.pitanimnode thread maps\_anim::anim_single_solo( level._id_C9DA, "open_case_soldier" );
    level._id_C9DA playsound( "scn_trainer_case_open2" );
    var_1 = getentarray( "pit_weapons_case_02", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, ::_id_C1D1 );
    common_scripts\utility::flag_wait( "button_press" );
    var_2 = getent( "switchToPit", "targetname" );
    common_scripts\utility::play_sound_in_space( "scn_training_fence_button", var_2.origin );
    thread maps\_utility::autosave_by_name( "pit_course_start" );
    level._id_D2E7 thread door_open();
    common_scripts\utility::flag_wait( "player_course_stairs2" );
    var_3 = getentarray( "pit_weapons_table", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, ::_id_C1D1 );
}

_id_AF00()
{
    level endon( "clear_course" );
    level endon( "mission failed" );
    var_0 = 0;
    setdvar( "killhouse_too_slow", "0" );
    level._id_AD70 = 1;
    var_1 = 0;
    var_2 = "none";
    clear_hints();
    var_3 = 0;

    for (;;)
    {
        if ( level._id_AD70 )
        {

        }
        else
        {

        }

        if ( level._id_AD70 )
        {

        }

        thread _id_BEE5( level._id_AD70 );

        if ( level._id_AD70 )
        {
            level._id_CBFE = 0;
            _id_BD26( "obj_course", &"TRAINER_COMPLETE_COURSE", getent( "origin_course_01", "targetname" ) );
            _id_C7C7( "obj_course", "current" );
        }

        var_4 = getentarray( "course_triggers_01", "script_noteworthy" );
        maps\_utility::array_notify( var_4, "activate" );
        common_scripts\utility::flag_wait( "player_has_started_course" );
        thread cqb_timer_setup();
        common_scripts\utility::flag_clear( "dunn_finished_with_difficulty_selection_dialogue" );
        _id_D393( "obj_course", getent( "origin_course_01", "targetname" ) );

        if ( level._id_CBFE != 0 )
            _id_B2F2( "obj_course", &"TRAINER_COMPLETE_COURSE" );

        common_scripts\utility::flag_clear( "melee_target_hit" );
        level._id_BA64 = 0;
        thread _id_BA20();

        if ( level._id_AD70 )
        {
            thread _id_C10F();
            maps\_utility::delaythread( 3, ::_id_B38F );
        }

        level._id_B78E = undefined;
        thread _id_B62F();
        var_5 = getentarray( "conversation_orgs_pit", "targetname" );
        var_6 = common_scripts\utility::getclosest( level.player.origin, var_5 );

        if ( common_scripts\utility::cointoss() )
            var_6 maps\_utility::delaythread( 3, common_scripts\utility::play_sound_in_space, "train_ar3_getsome" );
        else if ( common_scripts\utility::cointoss() )
            var_6 maps\_utility::delaythread( 3, common_scripts\utility::play_sound_in_space, "train_ar4_bringit" );
        else
            var_6 maps\_utility::delaythread( 3, common_scripts\utility::play_sound_in_space, "train_ar5_comeon" );

        var_7 = level.player getweaponslistprimaries();

        if ( var_7.size > 0 )
        {
            foreach ( var_9 in var_7 )
            {
                if ( var_9 == "barrett" )
                    continue;
                else
                    level.player givemaxammo( var_9 );
            }
        }

        level._id_CEFF = 0;
        level._id_AEA9 = 0;

        if ( getdvarint( "killhouse_too_slow" ) >= 1 )
            thread _id_BA0E( level._id_B582 );
        else
            thread _id_BA0E( level._id_B783 );

        thread _id_B2AE();

        if ( isdefined( level._id_B828 ) )
            level._id_B828 destroy();

        _id_D393( "obj_course", getent( "origin_course_02", "targetname" ) );
        common_scripts\utility::flag_wait( "player_course_03a" );
        _id_D393( "obj_course", getent( "origin_course_03", "targetname" ) );
        common_scripts\utility::flag_wait( "player_course_stairs2" );
        thread _id_CE48( "melee", "melee_target_hit" );
        common_scripts\utility::flag_wait( "player_course_upstairs" );
        level._id_D2E7 thread door_close();
        level._id_CB32 thread door_open();
        common_scripts\utility::flag_clear( "player_inside_course" );
        var_11 = getent( "course_end_blocker", "targetname" );
        var_11 maps\_utility::hide_entity();
        _id_D393( "obj_course", getent( "origin_course_03a", "targetname" ) );
        common_scripts\utility::flag_wait( "player_course_jumping_down" );
        _id_D393( "obj_course", getent( "origin_course_05", "targetname" ) );
        common_scripts\utility::flag_wait_either( "player_course_end_02", "course_end_targets_dead" );
        common_scripts\utility::flag_wait( "player_course_end_03" );
        common_scripts\utility::flag_clear( "player_has_started_course" );
        var_12 = 1;
        var_13 = 0;
        var_14 = 0;

        for (;;)
        {
            level.light_nosprint = getent( "h2_no_sprint_light", "targetname" );
            common_scripts\utility::flag_wait( "player_standing_on_sprint_marker" );
            common_scripts\utility::flag_clear( "sprinted" );
            thread _id_C828();
            clear_hints();
            _id_D03B();
            thread _id_B1D3( "sprinted" );

            if ( level.xenon )
                thread _id_CE48( "sprint", "sprinted" );
            else
                thread _id_CE48( "sprint_pc", "sprinted" );

            if ( var_12 )
            {
                thread maps\trainer_aud::_id_A865( "train_cpd_sprint", level.pa_course_ext );
                var_12 = 0;
            }
            else
            {
                _id_D393( "obj_course", getent( "origin_course_05", "targetname" ) );
                level._id_CB32 thread door_open( undefined, 1 );
                thread _id_B987();
                thread maps\_utility::radio_dialogue( "nag_sprint_0" + var_14 );
                var_14++;

                if ( var_14 > 3 )
                    var_14 = 0;
            }

            common_scripts\utility::flag_wait( "player_sprint_door_close" );

            if ( !common_scripts\utility::flag( "sprinted" ) )
            {
                _id_D393( "obj_course", getent( "origin_course_sprint", "targetname" ) );
                level._id_CB32 thread door_close( undefined, 1 );
                level._id_CB32 thread maps\_utility::play_sound_on_entity( "door_close_buzzer" );
                thread _id_BD50();
                thread maps\_utility::radio_dialogue( "nag_didnt_sprint_0" + var_13 );
                thread _id_B682( &"TRAINER_TRY_SPRINT_AGAIN", undefined, 1 );
                var_13++;

                if ( var_13 > 3 )
                    var_13 = 0;

                continue;
            }

            break;
        }

        common_scripts\utility::flag_wait( "player_course_end" );
        _id_D393( "obj_course", undefined );
        var_11 = getent( "course_end_blocker", "targetname" );
        var_11 maps\_utility::show_entity();
        var_3++;
        clear_hints();
        thread _id_AB66();
        level._id_CB32 thread door_close( "player_course_end_close_gate" );
        clear_hints();
        common_scripts\utility::flag_clear( "sprinted" );
        level notify( "test_cleared" );
        var_15 = killtimer( level._id_D3FB, 0 );

        while ( !isdefined( level._id_B78E ) )
            wait 0.1;

        var_16 = _id_C21B( var_3 );
        level._id_C9E9 = var_16;

        if ( level._id_B78E == 1000 )
        {
            var_16 = undefined;

            if ( level._id_BA64 > 10 )
                var_16 = "train_cpd_targetswithknife";
            else if ( level._id_D016 && level._id_C55D )
                var_16 = "train_cpd_longandcivilians";
            else if ( level._id_B2DD && level._id_C55D )
                var_16 = "train_cpd_longandtargets";
            else if ( level._id_B2DD )
                var_16 = "train_cpd_targets";
            else if ( level._id_D016 )
                var_16 = "train_cpd_civilians";
            else
                var_16 = "train_cpd_needtorunagain";

            level._id_C9E9 = var_16;
            thread handledunnanimation( "dunn_pit_outro_retry" );
        }
        else
        {
            if ( !common_scripts\utility::flag( "has_cheated" ) && !_id_C0C3::_id_AD40() )
                level.player uploadtime( "LB_KILLHOUSE", var_15 );

            thread _id_B431();
        }

        var_2 = var_16;
        var_1 = var_15;
        level._id_D2E7 thread door_open();

        if ( level._id_B78E != 1000 )
        {
            if ( !common_scripts\utility::flag( "player_has_started_course" ) )
            {
                _id_D393( "obj_course", getent( "course_start", "targetname" ) );
                _id_B2F2( "obj_course", &"TRAINER_OBJ_EXIT_THE_PIT" );
                level._id_CBFE = 1;
            }
        }
        else
            _id_D393( "obj_course", getent( "origin_course_01", "targetname" ) );

        common_scripts\utility::flag_wait_either( "player_inside_course", "player_done_with_course" );

        if ( common_scripts\utility::flag( "player_done_with_course" ) )
            break;

        level._id_AD70 = 0;
    }
}

_id_C828()
{
    level notify( "starting sprint monitor" );
    level endon( "starting sprint monitor" );
    level endon( "sprinted" );
    level endon( "player_course_end" );
    var_0 = getent( "sprint_volume", "targetname" );

    for (;;)
    {
        wait 0.05;
        var_1 = level.player getvelocity();
        var_2 = distance( ( var_1[0], var_1[1], 0 ), ( 0.0, 0.0, 0.0 ) );

        if ( isdefined( var_2 ) && var_2 > 250 && level.player istouching( var_0 ) )
            common_scripts\utility::flag_set( "sprinted" );
    }
}

_id_BD50()
{
    common_scripts\_exploder::exploder( "light_red_flare" );
    level.light_nosprint _meth_81ED( 2000 );
}

_id_B987()
{
    common_scripts\_exploder::kill_exploder( "light_red_flare" );
    level.light_nosprint _meth_81ED( 1 );
}

_id_CB06( var_0 )
{
    var_1 = level.global_fx[var_0];
    return level._effect[var_1];
}

_id_B431()
{
    level endon( "player_has_started_course" );
    level notify( "try_again_thread" );
    level endon( "try_again_thread" );
    thread handledunnanimation( "dunn_pit_outro" );
    common_scripts\utility::flag_wait_either( "player_entering_course", "player_exiting_course_00" );
    soundscripts\_snd::snd_message( "aud_start_mix_info_popup" );
    level.player freezecontrols( 1 );
    setblur( 2, 0.1 );
    _id_BCD8();
    wait 1;
    level.player openluimenu( &"difficulty_selection_menu" );

    for (;;)
    {
        level.player waittill( "menuresponse", var_0, var_1 );

        if ( var_1 == "continue" || var_1 == "tryagain" )
            break;

        level.player openluimenu( &"difficulty_selection_menu" );
    }

    level notify( "clear_Dunn" );
    level.pitanimnode notify( "stop_idle" );
    waitframe();
    level.pitanimnode thread maps\_anim::anim_loop_solo( level._id_B85D, "dunn_pit_outro_idle", "stop_idle" );
    setblur( 0, 0.2 );
    level.player freezecontrols( 0 );
    soundscripts\_snd::snd_message( "aud_stop_mix_info_popup" );

    if ( var_1 == "tryagain" )
    {
        level.pitanimnode notify( "stop_idle" );
        level.pitanimnode maps\_anim::anim_single_solo( level._id_B85D, "dunn_pit_tryagain" );
        level.pitanimnode thread maps\_anim::anim_loop_solo( level._id_B85D, "dunn_pit_outro_retry_idle", "stop_idle" );
        _id_D393( "obj_course", getent( "origin_course_01", "targetname" ) );
        _id_B2F2( "obj_course", &"TRAINER_COMPLETE_COURSE" );
        level._id_CBFE = 0;
    }
    else
    {
        common_scripts\utility::flag_set( "player_done_with_course" );

        if ( !level._id_B781 )
        {
            level._id_B781 = 1;
            thread _id_B370();
        }

        level._id_D2E7 thread door_close( undefined, 1 );
        level.pitanimnode notify( "stop_idle" );
        level.pitanimnode maps\_anim::anim_single_solo( level._id_B85D, "h2_headupstairs_outro_out" );
        level.pitanimnode thread maps\_anim::anim_loop_solo( level._id_B85D, "dunn_pit_outro_idle", "stop_idle" );
        _id_BCD8();
        clear_hints();
        level notify( "kill_timer" );
        level notify( "clear_course" );
    }
}

handledunnanimation( var_0 )
{
    level endon( "clear_Dunn" );
    level.pitanimnode notify( "stop_idle" );
    waitframe();
    level.pitanimnode maps\_anim::anim_single_solo( level._id_B85D, var_0 );
    level.pitanimnode thread maps\_anim::anim_loop_solo( level._id_B85D, var_0 + "_idle", "stop_idle" );
}

_id_CE48( var_0, var_1 )
{
    thread _id_CED3( var_0, undefined, undefined, 1 );
    thread _id_BFBC( var_1 );
}

_id_AB66()
{
    foreach ( var_1 in level.targets )
    {
        var_1 _id_D1CA();

        if ( isdefined( var_1._id_B1B1 ) )
            var_1 thread _id_BE2D();
    }
}

_id_BA20()
{
    _id_D19F( 10, "course_start_targets_dead", "player_course_03a" );
    common_scripts\utility::flag_wait( "player_course_03a" );
    _id_D19F( 3, "course_first_floor_targets_dead", "player_course_stairs" );
    common_scripts\utility::flag_wait( "player_course_stairs" );
    _id_D19F( 5, "course_second_floor_targets_dead", "player_course_jumped_down" );
    common_scripts\utility::flag_wait( "player_course_jumped_down" );
    _id_D19F( 6, "course_end_targets_dead", "player_course_end_03" );
    common_scripts\utility::flag_clear( "course_start_targets_dead" );
    common_scripts\utility::flag_clear( "course_first_floor_targets_dead" );
    common_scripts\utility::flag_clear( "course_second_floor_targets_dead" );
    common_scripts\utility::flag_clear( "course_end_targets_dead" );
}

_id_D19F( var_0, var_1, var_2 )
{
    level endon( var_2 );

    for ( var_3 = 0; var_3 < var_0; var_3++ )
        level waittill( "target_killed" );

    common_scripts\utility::flag_set( var_1 );
}

_id_BC2C()
{
    var_0 = level.player getcurrentweapon();
    var_1 = level.player getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            continue;

        var_4 = level.player getweaponammoclip( var_3 );

        if ( var_4 > 5 )
            return 1;
        else
            return 0;
    }

    return 0;
}

_id_B62F()
{
    common_scripts\utility::flag_wait( "player_has_started_course" );
    common_scripts\utility::flag_clear( "no_more_course_nags" );
    thread _id_A7FA();
    thread _id_B823();
    thread _id_C565();
    level.pa_course_ext = getentarray( "aud_pa_ext", "targetname" );
    level._id_B85D playrumbleonentity();

    if ( common_scripts\utility::flag( "can_talk" ) )
    {
        common_scripts\utility::flag_clear( "can_talk" );
        maps\trainer_aud::_id_A865( "train_cpd_clearfirstgogogo", level.pa_course_ext );
        common_scripts\utility::flag_set( "can_talk" );
    }

    common_scripts\utility::flag_wait_either( "player_course_03a", "course_start_targets_dead" );

    if ( common_scripts\utility::flag( "course_start_targets_dead" ) )
    {
        if ( common_scripts\utility::flag( "can_talk" ) )
            thread dialogue_course_move_into_the_building();
    }
    else if ( common_scripts\utility::flag( "can_talk" ) )
        thread dialogue_course_missed_some_targets();

    common_scripts\utility::flag_wait_either( "player_course_stairs2", "course_first_floor_targets_dead" );

    if ( common_scripts\utility::flag( "course_first_floor_targets_dead" ) )
    {
        if ( common_scripts\utility::flag( "can_talk" ) )
            thread dialogue_course_up_the_stairs();
    }

    common_scripts\utility::flag_wait( "player_course_stairs2" );
    thread _id_C0C3::_id_B47E();
    thread _id_B7BA();
    common_scripts\utility::flag_wait_either( "player_course_jumped_down", "course_second_floor_targets_dead" );

    if ( common_scripts\utility::flag( "course_second_floor_targets_dead" ) )
    {
        if ( common_scripts\utility::flag( "can_talk" ) )
            thread dialogue_course_jump_down();
    }

    common_scripts\utility::flag_wait( "player_course_jumped_down" );
    common_scripts\utility::flag_set( "no_more_course_nags" );
    common_scripts\utility::flag_wait( "can_talk" );

    if ( common_scripts\utility::flag( "can_talk" ) && !common_scripts\utility::flag( "course_end_targets_dead" ) )
        thread dialogue_course_last_area();

    common_scripts\utility::flag_wait( "player_course_end_03" );
}

dialogue_course_move_into_the_building()
{
    common_scripts\utility::flag_clear( "can_talk" );
    maps\trainer_aud::_id_A865( "train_cpd_areacleared", level.pa_course_ext );
    common_scripts\utility::flag_set( "can_talk" );
}

dialogue_course_missed_some_targets()
{
    common_scripts\utility::flag_clear( "can_talk" );
    maps\trainer_aud::_id_A865( "train_cpd_missedsome", level.pa_course_ext );
    common_scripts\utility::flag_set( "can_talk" );
}

dialogue_course_up_the_stairs()
{
    common_scripts\utility::flag_clear( "can_talk" );
    maps\trainer_aud::_id_A865( "train_cpd_upthestairs", level.pa_course_ext );
    common_scripts\utility::flag_set( "can_talk" );
}

dialogue_course_jump_down()
{
    common_scripts\utility::flag_clear( "can_talk" );
    maps\trainer_aud::_id_A865( "train_cpd_jumpdown", level.pa_course_ext );
    common_scripts\utility::flag_set( "can_talk" );
}

dialogue_course_last_area()
{
    common_scripts\utility::flag_clear( "can_talk" );
    maps\trainer_aud::_id_A865( "train_cpd_lastareamove", level.pa_course_ext );
    common_scripts\utility::flag_set( "can_talk" );
}

_id_B7BA()
{
    var_0 = 3;
    var_1 = 0;

    for (;;)
    {
        if ( common_scripts\utility::flag( "melee_target_hit" ) )
        {
            thread _id_C0C3::_id_D57F();
            break;
        }

        if ( common_scripts\utility::flag( "can_talk" ) && !common_scripts\utility::flag( "melee_target_hit" ) )
        {
            if ( !common_scripts\utility::flag( "player_near_melee_target" ) )
            {
                wait 0.5;
                continue;
            }

            common_scripts\utility::flag_clear( "can_talk" );
            maps\trainer_aud::_id_A865( "melee_nag_0" + var_1, level.pa_course_ext );
            common_scripts\utility::flag_set( "can_talk" );
            var_1++;

            if ( var_1 > 4 )
                var_1 = 0;

            common_scripts\utility::flag_wait_or_timeout( "melee_target_hit", var_0 );
            continue;
        }

        wait 0.5;
    }
}

_id_C10F()
{
    level notify( "starting_civilian_nags" );
    level endon( "starting_civilian_nags" );
    var_0 = [];
    var_0[0] = "train_cpd_watchout";
    var_0[1] = "train_cpd_awwkilled";
    var_0[2] = "train_cpd_acivilian";
    var_0[3] = "train_cpd_watchout_b";
    var_0[4] = "train_cpd_watchout_c";
    var_0[5] = "train_cpd_awwkilled_b";
    var_0[6] = "train_cpd_awwkilled_c";
    var_1 = 0;

    while ( !common_scripts\utility::flag( "player_course_jumped_down" ) )
    {
        level waittill( "civilian_killed" );

        if ( common_scripts\utility::flag( "player_course_jumped_down" ) )
            break;

        if ( !common_scripts\utility::flag( "player_inside_course" ) )
            break;

        if ( common_scripts\utility::flag( "no_more_course_nags" ) )
            break;

        if ( common_scripts\utility::flag( "can_talk" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            maps\trainer_aud::_id_A865( var_0[var_1], level.pa_course_ext );
            common_scripts\utility::flag_set( "can_talk" );
            var_1++;

            if ( var_1 > 6 )
                var_1 = 0;

            common_scripts\utility::flag_wait_or_timeout( "player_course_jumped_down", 5 );
        }
    }
}

_id_B823()
{
    level notify( "starting_hurry_nags" );
    level endon( "starting_hurry_nags" );
    thread _id_AACB();
    var_0 = 0;

    while ( !common_scripts\utility::flag( "player_course_jumped_down" ) )
    {
        level waittill( "player_not_killing_targets_at_a_good_rate" );

        if ( !common_scripts\utility::flag( "player_inside_course" ) )
            break;

        if ( common_scripts\utility::flag( "no_more_course_nags" ) )
            break;

        if ( common_scripts\utility::flag( "can_talk" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            maps\trainer_aud::_id_A865( "nag_hurry_0" + var_0, level.pa_course_ext );
            common_scripts\utility::flag_set( "can_talk" );
            var_0++;

            if ( var_0 > 4 )
                var_0 = 0;

            common_scripts\utility::flag_wait_or_timeout( "player_course_jumped_down", 5 );
        }
    }
}

_id_AACB()
{
    level notify( "track_player_kill_frequency" );
    level endon( "track_player_kill_frequency" );
    level endon( "player_course_jumped_down" );

    while ( !common_scripts\utility::flag( "player_course_jumped_down" ) )
    {
        var_0 = level._id_CEFF;
        level common_scripts\utility::waittill_notify_or_timeout( "target_killed", 8 );

        if ( var_0 == level._id_CEFF )
            level notify( "player_not_killing_targets_at_a_good_rate" );

        wait 2;
    }
}

_id_A7FA()
{
    level notify( "starting_reload_nags" );
    level endon( "starting_reload_nags" );

    for (;;)
    {
        level.player waittill( "reload_start" );

        if ( common_scripts\utility::flag( "player_course_jumped_down" ) )
            break;

        if ( !common_scripts\utility::flag( "player_inside_course" ) )
            break;

        if ( common_scripts\utility::flag( "no_more_course_nags" ) )
            break;

        if ( common_scripts\utility::flag( "can_talk" ) && _id_BC2C() )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            maps\trainer_aud::_id_A865( "train_cpd_justswitch", level.pa_course_ext );
            common_scripts\utility::flag_set( "can_talk" );
            break;
        }
    }
}

_id_C565()
{
    level notify( "starting_ADS_nags" );
    level endon( "starting_ADS_nags" );
    var_0 = 0;

    for (;;)
    {
        level waittill( "pit_target_hit_without_ADS" );

        if ( common_scripts\utility::flag( "player_course_jumped_down" ) )
            break;

        if ( !common_scripts\utility::flag( "player_inside_course" ) )
            break;

        if ( common_scripts\utility::flag( "no_more_course_nags" ) )
            break;

        if ( common_scripts\utility::flag( "can_talk" ) )
        {
            common_scripts\utility::flag_clear( "can_talk" );
            maps\trainer_aud::_id_A865( "pit_ads_nag_0" + var_0, level.pa_course_ext );
            common_scripts\utility::flag_set( "can_talk" );
            var_0++;

            if ( var_0 > 2 )
                break;
        }
    }
}

_id_BEE5( var_0 )
{
    level endon( "player_has_started_course" );
    level endon( "player_inside_course" );

    if ( !var_0 )
        var_1 = 0;
    else
        var_1 = 1;

    wait 1;
    common_scripts\utility::flag_wait( "dunn_finished_with_open_case_dialogue" );

    while ( !common_scripts\utility::flag( "player_inside_course" ) )
    {
        if ( common_scripts\utility::flag( "player_inside_course" ) )
            break;

        level._id_B85D dialogue_execute( "train_cpd_timerstarts" );

        if ( var_1 )
        {
            wait 3;
            level._id_B85D dialogue_execute( "train_cpd_putusin" );
            level._id_B85D dialogue_execute( "train_cpd_socombrass" );
            wait 2;
            level._id_B85D dialogue_execute( "train_cpd_realaction" );
            level._id_B85D maps\_utility::play_sound_on_tag( "train_cpd_sigh", "TAG_EYE" );
            var_1 = 0;
            wait 15;
        }
        else
        {
            if ( common_scripts\utility::flag( "player_inside_course" ) )
                break;

            wait 30;
        }

        if ( common_scripts\utility::flag( "player_inside_course" ) )
            break;

        level._id_B85D waittillmatch( "looping anim", "end" );
        level.pitanimnode maps\_anim::anim_single_solo( level._id_B85D, "stand_End_VO3" );

        if ( common_scripts\utility::flag( "player_inside_course" ) )
            break;

        level.pitanimnode notify( "stop_idle" );
        level.pitanimnode thread maps\_anim::anim_loop_solo( level._id_B85D, "stand_End_idle", "stop_idle" );
        wait 15;

        if ( common_scripts\utility::flag( "player_inside_course" ) )
            break;

        level._id_B85D waittillmatch( "looping anim", "end" );
        level.pitanimnode notify( "stop_idle" );
        level.pitanimnode maps\_anim::anim_single_solo( level._id_B85D, "stand_End_VO4" );
        level.pitanimnode thread maps\_anim::anim_loop_solo( level._id_B85D, "stand_End_idle", "stop_idle" );

        if ( common_scripts\utility::flag( "player_inside_course" ) )
            break;

        wait 60;
    }
}

door_open( var_0, var_1 )
{
    if ( isdefined( self.moving ) )
    {
        while ( isdefined( self.moving ) )
            wait 0.05;
    }

    self.moving = 1;
    var_2 = 90;

    if ( isdefined( self._id_BC3F ) )
        var_2 = self._id_BC3F;

    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_wait( var_0 );

    var_3 = 4;

    if ( isdefined( var_1 ) )
    {
        var_3 = 1.5;
        self rotateto( self.angles + ( 0, var_2, 0 ), 1.5, 0.25, 0.25 );
    }
    else
        self rotateto( self.angles + ( 0, var_2, 0 ), 4, 1.5, 1.5 );

    if ( isdefined( self._id_BABB ) )
        self._id_BABB maps\_utility::hide_entity();

    thread maps\_utility::play_sound_on_entity( "scn_training_fence_open" );
    wait(var_3);
    self.moving = undefined;
}

door_close( var_0, var_1 )
{
    if ( isdefined( self.moving ) )
    {
        while ( isdefined( self.moving ) )
            wait 0.05;
    }

    self.moving = 1;
    var_2 = -90;

    if ( isdefined( self._id_AB59 ) )
        var_2 = self._id_AB59;

    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_wait( var_0 );

    var_3 = 2;

    if ( isdefined( var_1 ) )
    {
        var_3 = 1;
        self rotateto( self.angles + ( 0, var_2, 0 ), 1, 0.25, 0.25 );
    }
    else
        self rotateto( self.angles + ( 0, var_2, 0 ), 2, 0.5, 0.5 );

    if ( isdefined( self._id_BABB ) )
        self._id_BABB maps\_utility::show_entity();

    thread maps\_utility::play_sound_on_entity( "scn_training_fence_close" );
    common_scripts\utility::array_call( self._id_CAD5, ::solid );
    wait(var_3);
    self.moving = undefined;
}

_id_B370()
{
    thread _id_AC13();
    _id_C0C3::weapons_specialfeatures_reset();
    _id_C0C3::weapons_specialfeatures();
}

_id_AC13()
{
    var_0 = getaiarray();
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3.script_parameters ) )
            var_1[var_1.size] = var_3;
    }

    var_5 = maps\_utility::array_merge( level.drones["allies"].array, level.drones["axis"].array );
    var_5 = maps\_utility::array_merge( var_5, level.drones["neutral"].array );

    foreach ( var_3 in var_5 )
    {
        if ( isdefined( var_3.script_parameters ) )
            var_5 = common_scripts\utility::array_remove( var_5, var_3 );
    }

    common_scripts\utility::array_thread( var_1, ::_id_BA48 );
    var_8 = getent( "basketball", "targetname" );
    var_8 delete();
    common_scripts\utility::array_thread( var_5, ::_id_BA48 );
    maps\_utility::array_delete( getentarray( "friendlies_basketball_AI", "targetname" ) );
    var_9 = getentarray( "h2_pit_ai", "targetname" );
    common_scripts\utility::array_thread( var_9, ::_id_BA48 );
    var_10 = maps\_utility::array_spawn( getentarray( "friendlies_end_sequence", "targetname" ), 1 );
    var_11 = getent( "ending_sequence_node", "targetname" );
    var_12 = getentarray( "laatpv_gate", "targetname" );

    foreach ( var_14 in var_12 )
    {
        var_14 show();
        var_14.animname = "laatpv";
        var_14 maps\_anim::setanimtree();
        var_11 maps\_anim::anim_first_frame_solo( var_14, var_14.animation );
    }

    var_16 = maps\_utility::array_spawn( getentarray( "friendly_ending_sequence", "targetname" ), 1 );

    foreach ( var_18 in var_16 )
    {
        var_18.animname = "generic";
        var_11 maps\_anim::anim_first_frame_solo( var_18, var_18.animation );

        if ( isdefined( var_18.script_noteworthy ) && var_18.script_noteworthy == "no_gun" )
            var_18 maps\_utility::gun_remove();
    }

    var_20 = maps\_utility::spawn_targetname( "friendly_ending_foley", 1 );
    var_20.animname = "foley";
    var_11 maps\_anim::anim_first_frame_solo( var_20, var_20.animation );
    common_scripts\utility::flag_wait( "player_exiting_course_00" );
    level.player lightset( "trainer_end" );
    level.player enableinvulnerability( 1 );
    thread _id_C324();
    thread _id_BF1C();
    var_21 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "heli_group_pre_end" );
    thread maps\trainer_aud::aud_handle_veh_group( var_21, "apache", 0 );
    common_scripts\utility::flag_wait( "player_exiting_course" );
    common_scripts\utility::flag_set( "end_sequence_starting" );
    _id_BCD8();
    clear_hints();
    level notify( "kill_timer" );
    level notify( "clear_course" );
    var_22 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "heli_group_01" );
    thread maps\trainer_aud::aud_handle_veh_group( var_22, "pavelow", 1 );
    common_scripts\utility::flag_wait( "player_exiting_course_02" );
    level._id_C711 thread door_close();
    _func_31C( 1 );
    thread _id_C2B6( 0.1, 1 );
    level.player _meth_830F( 0 );
    _id_C7C7( "obj_course", "done" );
    var_23 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "ending_sequence_bradley" );
    var_24 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "ending_sequence_bridge" );
    thread spawn_laatpv_on_the_side();

    foreach ( var_14 in var_12 )
        var_11 thread maps\_anim::anim_single_solo( var_14, var_14.animation );

    thread maps\trainer_aud::aud_handle_ending_latvees( var_12 );

    foreach ( var_18 in var_16 )
        var_11 thread maps\_anim::anim_single_solo( var_18, var_18.animation );

    var_11 thread maps\_anim::anim_single_solo( var_20, var_20.animation );
    wait 12;
    var_29 = maps\_hud_util::create_client_overlay( "black", 0, level.player );
    var_29 fadeovertime( 1 );
    var_29.alpha = 1;
    wait 2;
    maps\_utility::nextmission();
}

spawn_laatpv_on_the_side()
{
    level.shep_ending = getent( "shep_ending", "script_noteworthy" );
    level.shep_ending maps\_utility::add_spawn_function( maps\_utility::gun_remove );
    wait 0.5;
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "side_laatpv_ending_01" );
    wait 1.5;
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "side_laatpv_ending_02" );
}

_id_C2B6( var_0, var_1 )
{
    var_2 = 1;
    var_3 = var_0 / ( var_1 / 0.05 );
    var_4 = 0;

    while ( var_4 < var_1 )
    {
        var_2 -= var_3;

        if ( var_2 < 0 )
            break;

        level.player setmovespeedscale( var_2 );
        var_4 += 0.05;
        wait 0.05;
    }
}

_id_C324()
{
    soundscripts\_snd::snd_message( "aud_start_mix_evacuation" );
    thread common_scripts\utility::play_loopsound_in_space( "emt_alarm_trainer_alert", ( 0.0, 0.0, 0.0 ) );
}

_id_BF1C()
{
    var_0 = getentarray( "radio_org_end", "targetname" );
    common_scripts\utility::flag_wait_or_timeout( "player_exiting_course", 1 );
    thread maps\_utility::radio_dialogue( "train_hqr_headedout" );
    common_scripts\utility::flag_wait( "player_exiting_course" );
    var_1 = common_scripts\utility::getfarthest( level.player.origin, var_0 );
    common_scripts\utility::flag_wait( "player_exiting_course_02" );
    var_1 = common_scripts\utility::getfarthest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar2_getamedic" );
}

_id_AD81( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "player_exiting_course_02" );
    var_1 maps\_anim::anim_single( var_0, "wounded_pickup" );

    for (;;)
    {
        var_0[0] thread maps\_anim::anim_single_solo( var_0[0], "wounded_carry" );
        var_0[1] maps\_anim::anim_single_solo( var_0[1], "wounded_carry" );
    }
}

_id_D4FC()
{
    var_0 = common_scripts\utility::get_linked_ents();
    self.targets = [];
    self._id_C35A = [];
    self._id_BED8 = [];

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.script_noteworthy ) )
            continue;

        if ( isdefined( var_2.code_classname ) && var_2.code_classname == "script_model" )
        {
            if ( var_2.script_noteworthy == "target_enemy" )
            {
                self._id_BED8[self._id_BED8.size] = var_2;
                self.targets[self.targets.size] = var_2;
            }
            else if ( var_2.script_noteworthy == "target_friendly" )
            {
                self._id_C35A[self._id_C35A.size] = var_2;
                self.targets[self.targets.size] = var_2;
            }

            continue;
        }
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "course_triggers_01" )
    {
        level._id_A9FA = maps\_utility::array_merge( level._id_A9FA, self._id_C35A );
        level._id_C347 = maps\_utility::array_merge( level._id_C347, self._id_BED8 );
    }

    for (;;)
    {
        common_scripts\utility::trigger_off();
        self waittill( "activate" );
        common_scripts\utility::trigger_on();
        self waittill( "trigger" );
        maps\_utility::array_notify( self.targets, "pop_up" );
    }
}

_id_B742( var_0 )
{
    if ( getdvar( "trainer_debug" ) == "1" )
    {
        self._id_C940 = getent( self.target, "targetname" );
        self.aim_assist_target = getent( self._id_C940.target, "targetname" );
        self.aim_assist_target hide();
        return;
    }

    self._id_AEE6 = undefined;
    self._id_C940 = getent( self.target, "targetname" );
    self linkto( self._id_C940 );
    self.aim_assist_target = getent( self._id_C940.target, "targetname" );
    self.aim_assist_target.health = 1000;
    self.aim_assist_target.maxhealth = 1000;
    self.aim_assist_target hide();
    self.aim_assist_target notsolid();
    self.base = undefined;

    if ( isdefined( self.aim_assist_target.target ) )
        self.base = getent( self.aim_assist_target.target, "targetname" );

    if ( isdefined( self.base ) )
    {
        self.player_collision = getent( self.base.target, "targetname" );
        self.player_collision linkto( self );
        self.player_collision notsolid();
    }

    if ( !isdefined( self._id_C940.script_noteworthy ) )
        self._id_C940.script_noteworthy = "standard";

    if ( self._id_C940.script_noteworthy == "reverse" )
        self._id_C940 rotateroll( 90, 0.05 );
    else if ( self._id_C940.script_noteworthy == "sideways" )
        self._id_C940 rotateyaw( -180, 0.05 );
    else
        self._id_C940 rotateroll( -90, 0.05 );

    wait 0.1;
    self._id_AC09 = undefined;
    self._id_B1B1 = undefined;
    self._id_C922 = undefined;
    self._id_CF24 = undefined;
    self._id_C6AA = undefined;

    if ( isdefined( self.script_parameters ) && self.script_parameters == "penetration_targets" )
        level._id_C453[level._id_C453.size] = self;

    if ( isdefined( self.script_parameters ) && self.script_parameters == "grenade_targets" )
        level._id_B707[level._id_B707.size] = self;

    if ( isdefined( self.script_parameters ) && self.script_parameters == "hip_targets" )
        level._id_B03E[level._id_B03E.size] = self;

    if ( isdefined( self.script_parameters ) && self.script_parameters == "use_rail" )
    {
        self._id_B1B1 = common_scripts\utility::getclosest( self._id_C940.origin, level._id_CE33, 10 );
        self._id_C922 = getent( self._id_B1B1.target, "targetname" );
        self._id_AC09 = [];
        self._id_AC09[0] = self._id_B1B1;
        self._id_AC09[1] = self._id_C922;
        var_1 = distance( self._id_AC09[0].origin, self._id_AC09[1].origin );
        self._id_CF24 = var_1 / 30;
        self._id_CF24 = maps\_utility::rounddecimalplaces( self._id_CF24, 0 );
        self._id_C6AA = var_1 / 22;
        self._id_C6AA = maps\_utility::rounddecimalplaces( self._id_C6AA, 0 );

        foreach ( var_3 in self._id_AC09 )
        {

        }

        _id_BE2D();
    }

    for (;;)
    {
        self waittill( "pop_up" );
        _id_A9DD();

        if ( isdefined( self.script_parameters ) && self.script_parameters == "melee" )
        {
            self._id_AEE6 = 1;
            var_5 = getent( "melee_clip", "targetname" );
            var_5 maps\_utility::show_entity();
        }

        if ( isdefined( self.script_flag ) )
            thread _id_B42B( self.script_flag );

        wait(randomfloatrange( 0, 0.2 ));

        if ( isdefined( self.player_collision ) )
            self.player_collision solid();

        self playsound( "target_up_metal" );
        self setcandamage( 1 );

        if ( var_0 != "friendly" )
            self.aim_assist_target enableaimassist();

        if ( self._id_C940.script_noteworthy == "reverse" )
            self._id_C940 rotateroll( -90, 0.25 );
        else if ( self._id_C940.script_noteworthy == "sideways" )
            self._id_C940 rotateyaw( 180, 0.5 );
        else
            self._id_C940 rotateroll( 90, 0.25 );

        wait 0.25;

        if ( isdefined( self._id_B1B1 ) )
            thread _id_CC5E();

        for (;;)
        {
            self waittill( "damage", var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15 );

            if ( !isdefined( var_7 ) )
                continue;

            if ( !isdefined( var_10 ) )
                continue;

            if ( var_10 == "MOD_IMPACT" )
                continue;

            if ( var_10 == "scripted_target_drop" )
                break;

            if ( var_10 == "timed_target_drop" )
            {
                var_16 = common_scripts\utility::getclosest( level.player.origin, level.speakers );
                var_16 playsound( "target_mistake_buzzer" );
                break;
            }

            if ( isplayer( var_7 ) )
            {
                if ( isdefined( self._id_AEE6 ) )
                {
                    if ( var_10 != "MOD_MELEE" )
                        continue;
                }

                self playsound( "target_metal_hit" );

                if ( var_0 == "friendly" )
                {
                    var_16 = common_scripts\utility::getclosest( level.player.origin, level.speakers );
                    var_16 playsound( "target_mistake_buzzer" );

                    if ( isdefined( var_7._id_AEA9 ) )
                        var_7._id_AEA9++;

                    level._id_AEA9++;

                    if ( !maps\_utility::is_specialop() )
                    {
                        if ( isdefined( level._id_AB22 ) )
                        {
                            level._id_AB22 setvalue( level._id_AEA9 );
                            level._id_AB22.color = ( 0.9, 0.2, 0.2 );
                            level._id_AB22 setpulsefx( 30, 900000, 700 );
                        }
                    }

                    level notify( "civilian_killed" );
                }
                else
                {
                    var_7 maps\_player_stats::register_kill( self, var_10, var_15 );

                    if ( isdefined( var_7._id_CEFF ) )
                        var_7._id_CEFF++;

                    level._id_CEFF++;

                    if ( var_10 == "MOD_MELEE" )
                        level._id_BA64++;

                    level notify( "target_killed" );

                    if ( !maps\_utility::is_specialop() )
                    {
                        if ( isdefined( level._id_C293 ) )
                        {
                            level._id_C293 setvalue( level._id_CEFF );
                            level._id_C293 setpulsefx( 30, 900000, 700 );
                        }
                    }
                }

                if ( var_10 == "MOD_GRENADE_SPLASH" )
                    self notify( "hit_with_grenade" );

                break;
            }
        }

        if ( isdefined( self._id_AEE6 ) )
        {
            self._id_AEE6 = 1;
            var_5 = getent( "melee_clip", "targetname" );
            var_5 thread maps\_utility::hide_entity();
            common_scripts\utility::flag_set( "melee_target_hit" );
        }
        else if ( var_0 != "friendly" && !level.player maps\_utility::isads() )
        {
            if ( isdefined( var_10 ) && var_10 != "MOD_MELEE" && var_10 != "scripted_target_drop" )
                level notify( "pit_target_hit_without_ADS" );
        }

        self notify( "hit" );
        self notify( "target_going_back_down" );
        waitframe();
        self.health = 1000;
        self.aim_assist_target disableaimassist();

        if ( isdefined( self.player_collision ) )
            self.player_collision notsolid();

        if ( self._id_C940.script_noteworthy == "reverse" )
            self._id_C940 rotateroll( 90, 0.25 );
        else if ( self._id_C940.script_noteworthy == "sideways" )
            self._id_C940 rotateyaw( -180, 0.5 );
        else
            self._id_C940 rotateroll( -90, 0.25 );

        self setcandamage( 0 );
        wait 0.25;
        level.target_ents = common_scripts\utility::array_remove( level.target_ents, self._id_C940 );
    }
}

_id_A9DD()
{
    if ( !maps\_utility::is_specialop() )
        return;

    var_0 = self.origin;
    var_1 = undefined;

    if ( isdefined( self.script_parameters ) && self.script_parameters == "melee" )
    {
        var_0 = ( -5723.0, 2547.0, -49.0 );
        var_1 = 2520;
    }

    for (;;)
    {
        var_2 = 0;

        foreach ( var_4 in level.players )
        {
            var_5 = 3136;

            if ( length( var_4 getvelocity() ) > 200 )
                var_5 = 16384;

            if ( distancesquared( var_4.origin, var_0 ) < var_5 )
            {
                var_2 = 1;

                if ( isdefined( var_1 ) && var_4.origin[1] < var_1 )
                    var_2 = 0;
            }
        }

        if ( !var_2 )
            return;

        wait 0.05;
    }
}

_id_CC5E()
{
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_0.angles = self._id_C940.angles;
    var_0.origin = self._id_C940.origin;
    self._id_C940 thread _id_C493( var_0, self.base, self.aim_assist_target );
    var_0 endon( "deleted_because_player_was_too_close" );
    var_0 endon( "death" );

    foreach ( var_2 in level.players )
        var_0 thread _id_B301( var_2 );

    thread _id_B2EF( var_0 );
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "scn_trainer_dummy_target_move" );

    for (;;)
    {
        var_0 moveto( self._id_C922.origin, self._id_C6AA );
        wait(self._id_C6AA);
        var_0 moveto( self._id_B1B1.origin, self._id_C6AA );
        wait(self._id_C6AA);
    }
}

_id_B2EF( var_0 )
{
    var_0 endon( "death" );
    self waittill( "target_going_back_down" );
    var_0 delete();
}

_id_B301( var_0 )
{
    self endon( "death" );
    var_1 = 128;
    var_2 = var_1 * var_1;

    for (;;)
    {
        wait 0.05;

        if ( distancesquared( var_0.origin, self.origin ) < var_2 )
            break;
    }

    self notify( "deleted_because_player_was_too_close" );
    self delete();
}

_id_C493( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_3 = vectornormalize( anglestoright( var_1.angles ) );
    var_4 = var_3 * 4 + ( 0.0, 0.0, 60.0 );

    for (;;)
    {
        wait 0.05;
        self.origin = var_0.origin;
        var_1.origin = var_0.origin + ( 0.0, 0.0, 9.5 );
        var_2.origin = var_0.origin + var_4;
    }
}

_id_BE2D()
{
    if ( common_scripts\utility::array_contains( level.target_ents, self._id_C940 ) )
        return;

    if ( common_scripts\utility::cointoss() )
    {
        self._id_B1B1 = self._id_AC09[0];
        self._id_C922 = self._id_AC09[1];
    }
    else
    {
        self._id_B1B1 = self._id_AC09[1];
        self._id_C922 = self._id_AC09[0];
    }

    var_0 = vectornormalize( anglestoright( self._id_C940.angles ) );
    var_1 = var_0 * 4 + ( 0.0, 0.0, 60.0 );
    level.target_ents[level.target_ents.size] = self._id_C940;
    self._id_C940 moveto( self._id_B1B1.origin, 0.1 );
    self.base.origin = self._id_B1B1.origin + ( 0.0, 0.0, 9.5 );
    self.aim_assist_target.origin = self._id_B1B1.origin + var_1;
}

_id_B42B( var_0 )
{
    if ( maps\_utility::is_specialop() )
        return;

    self endon( "target_going_back_down" );
    common_scripts\utility::flag_wait( var_0 );
    _id_D1CA();
}

_id_D1CA()
{
    self notify( "damage", 1000, "worldspawn", undefined, undefined, "scripted_target_drop" );
}

_id_C0A5()
{
    if ( self.classname == "weapon_fraggrenade" || self.classname == "weapon_flash_grenade" )
        self itemweaponsetammo( 1, 0 );
    else
        self itemweaponsetammo( 999, 999 );
}

_id_ABCE()
{
    precachemodel( "weapon_binocular" );
    precachemodel( "adrenaline_syringe_animated" );
    precachemodel( "clotting_powder_animated" );
    precachemodel( "com_bottle2" );
    precachemodel( "h2_viewmodel_desert_eagle_silver" );
    precacheshader( "black" );
    precachemodel( "h2_weapon_grenade_m67_prop_obj" );
    precachemodel( "h2_prop_npc_cigar" );
    precachemodel( "electronics_pda" );
    precachemodel( "weapon_m4" );
    precachemodel( "weapon_m4_clip" );
    precachemodel( "characters_accessories_pencil" );
    precachemodel( "mil_mre_chocolate01" );
    precachemodel( "h2_weapon_desert_eagle_base_obj" );
    precachemodel( "h2_weapon_m4_grunt_obj" );
    precachemodel( "head_seal_udt_d_lifesaver" );
    precachemodel( "h2_fav_propane_blow_torch" );
    precachemodel( "h2_cs_tool_wrench_adjustable_lrg_anim" );
    precachemodel( "h2_fav_plier" );
    precachemodel( "h2_characters_accessories_pencil" );
    precachemodel( "h2_com_clipboard_wpaper_anim" );
    precachemodel( "h2_rkl_cellphone_appicon" );
    precachemodel( "h2_com_kitchen_utensil_spatula_small_animated" );
    precachemodel( "h1_prop_price_cigar" );
    precachemodel( "head_trn_arab_a" );
    precachemodel( "head_trn_arab_b" );
    precachemodel( "head_trn_arab_c" );
    precachemodel( "head_trn_arab_d" );
    precachemodel( "head_trn_arab_e" );
    precachemodel( "head_trn_arab_f" );
    precachemodel( "head_trn_arab_g" );
    precachemodel( "body_ally_arab_trn_smg_a" );
    precachemodel( "body_ally_arab_trn_assault_a" );
    precachemodel( "head_army_i_casual_wht" );
    precachemodel( "head_army_j_casual_blk" );
    precacheshader( "objective" );
    precacheshader( "hud_icon_c4" );
    precacheshader( "hud_dpad" );
    precacheshader( "hud_arrow_right" );
    precacheshader( "hud_arrow_down" );
    precacheshader( "hud_icon_40mm_grenade" );
    precacheshader( "popmenu_bg" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "h1_hud_timer_blur" );
    precacheshader( "h1_hud_timer_border" );
    precacheshader( "h1_timer_on_flare" );
    precacheshader( "h1_timer_warning_flare" );
    precacheshader( "h1_hud_fng_results_blur" );
    precacheshader( "h1_hud_fng_results_border" );
    precacheshader( "h2_hud_ssdd_results_blur" );
    precacheshader( "h2_hud_ssdd_stats_blur" );
    precacheshader( "h2_hud_ssdd_stats_border" );
    precacheshader( "h2_hud_ssdd_results_line" );
    precachestring( &"TRAINER_OBJ_GET_RIFLE_AMMO" );
    precachestring( &"TRAINER_KILLED_CIVVIES_PENALTY" );
    precachestring( &"TRAINER_TRY_SPRINT_AGAIN" );
    precachestring( &"TRAINER_KILLED_CIVVIES_NONE" );
    precachestring( &"TRAINER_ACCURACY_LABEL" );
    precachestring( &"TRAINER_MISSION_FAIL_FIRE_IN_CAMP" );
    precachestring( &"TRAINER_SHOOT_THE_TARGET_THROUGH" );
    precachestring( &"TRAINER_HINT_SIDEARM" );
    precachestring( &"TRAINER_HINT_OBJECTIVE_MARKER" );
    precachestring( &"TRAINER_HINT_OBJECTIVE_REMINDER" );
    precachestring( &"TRAINER_HINT_OBJECTIVE_REMINDER2" );
    precachestring( &"TRAINER_HINT_HOLDING_SPRINT" );
    precachestring( &"TRAINER_AXIS_OPTION_MENU1_ALL" );
    precachestring( &"TRAINER_AXIS_OPTION_MENU2_ALL" );
    precachestring( &"TRAINER_HINT_OBJECTIVE_MARKER" );
    precachestring( &"TRAINER_HINT_CHECK_OBJECTIVES_PAUSED" );
    precachestring( &"TRAINER_HINT_CHECK_OBJECTIVES_SCORES" );
    precachestring( &"TRAINER_HINT_CHECK_OBJECTIVES_SCORES_PS3" );
    precachestring( &"TRAINER_HINT_OBJECTIVE_MARKER" );
    precachestring( &"TRAINER_HINT_OBJECTIVE_REMINDER" );
    precachestring( &"TRAINER_HINT_OBJECTIVE_REMINDER2" );
    precachestring( &"TRAINER_HINT_ATTACK_PC" );
    precachestring( &"TRAINER_HINT_ATTACK" );
    precachestring( &"TRAINER_HINT_HIP_ATTACK_PC" );
    precachestring( &"TRAINER_HINT_HIP_ATTACK" );
    precachestring( &"TRAINER_HINT_ADS_360" );
    precachestring( &"TRAINER_HINT_ADS" );
    precachestring( &"TRAINER_HINT_ADS_TOGGLE" );
    precachestring( &"TRAINER_HINT_ADS_THROW_360" );
    precachestring( &"TRAINER_HINT_ADS_THROW" );
    precachestring( &"TRAINER_HINT_ADS_TOGGLE_THROW" );
    precachestring( &"TRAINER_HINT_STOP_ADS" );
    precachestring( &"TRAINER_HINT_STOP_ADS_TOGGLE" );
    precachestring( &"TRAINER_HINT_STOP_ADS_THROW" );
    precachestring( &"TRAINER_HINT_STOP_ADS_TOGGLE_THROW" );
    precachestring( &"TRAINER_HINT_BREATH_MELEE" );
    precachestring( &"TRAINER_HINT_BREATH_SPRINT" );
    precachestring( &"TRAINER_HINT_BREATH_BINOCULARS" );
    precachestring( &"TRAINER_HINT_MELEE_BREATH" );
    precachestring( &"TRAINER_HINT_MELEE" );
    precachestring( &"TRAINER_HINT_MELEE_BREATH_CLICK" );
    precachestring( &"TRAINER_HINT_MELEE_CLICK" );
    precachestring( &"TRAINER_HINT_PRONE" );
    precachestring( &"TRAINER_HINT_PRONE_HOLD" );
    precachestring( &"TRAINER_HINT_PRONE_TOGGLE" );
    precachestring( &"TRAINER_HINT_PRONE_STANCE" );
    precachestring( &"TRAINER_HINT_PRONE_DOUBLE" );
    precachestring( &"TRAINER_HINT_CROUCH_STANCE" );
    precachestring( &"TRAINER_HINT_CROUCH_HOLD" );
    precachestring( &"TRAINER_HINT_CROUCH" );
    precachestring( &"TRAINER_HINT_CROUCH_TOGGLE" );
    precachestring( &"TRAINER_HINT_STAND" );
    precachestring( &"TRAINER_HINT_STAND_STANCE" );
    precachestring( &"TRAINER_HINT_JUMP_STAND" );
    precachestring( &"TRAINER_HINT_JUMP" );
    precachestring( &"TRAINER_HINT_SPRINT_PC" );
    precachestring( &"TRAINER_HINT_SPRINT" );
    precachestring( &"TRAINER_HINT_SPRINT_BREATH_PC" );
    precachestring( &"TRAINER_HINT_SPRINT_BREATH" );
    precachestring( &"TRAINER_HINT_HOLDING_SPRINT" );
    precachestring( &"TRAINER_HINT_HOLDING_SPRINT_BREATH" );
    precachestring( &"TRAINER_HINT_RELOAD_USE" );
    precachestring( &"TRAINER_HINT_RELOAD" );
    precachestring( &"TRAINER_HINT_MANTLE" );
    precachestring( &"TRAINER_HINT_ADS_SWITCH" );
    precachestring( &"TRAINER_HINT_ADS_SWITCH_SHOULDER" );
    precachestring( &"TRAINER_HINT_ADS_SWITCH_THROW" );
    precachestring( &"TRAINER_HINT_ADS_SWITCH_THROW_SHOULDER" );
    precachestring( &"TRAINER_HINT_SIDEARM_SWAP" );
    precachestring( &"TRAINER_HINT_PRIMARY_SWAP" );
    precachestring( &"TRAINER_HINT_SIDEARM" );
    precachestring( &"TRAINER_HINT_SIDEARM_RELOAD" );
    precachestring( &"TRAINER_HINT_SIDEARM_RELOAD_USE" );
    precachestring( &"TRAINER_HINT_FRAG" );
    precachestring( &"TRAINER_HINT_CROSSHAIR_CHANGES" );
    precachestring( &"TRAINER_HINT_TURN_AROUND" );
    precachestring( &"TRAINER_HINT_ADS_ACCURACY" );
    precachestring( &"TRAINER_SHIP_TOO_SLOW" );
    precachestring( &"TRAINER_CIVVIES_KILLED" );
    precachestring( &"TRAINER_ENEMIES_KILLED" );
    precachestring( &"TRAINER_YOUR_TIME_IN_SECONDS" );
    precachestring( &"TRAINER_YOUR_TIME" );
    precachestring( &"TRAINER_YOUR_FINAL_TIME" );
    precachestring( &"TRAINER_IW_BEST_TIME" );
    precachestring( &"TRAINER_YOUR_DECK_TIME" );
    precachestring( &"TRAINER_IW_DECK_TIME" );
    precachestring( &"TRAINER_SHIP_OUT_OF_FLASH" );
    precachestring( &"TRAINER_SHIP_JUMPED_TOO_EARLY" );
    precachestring( &"TRAINER_HIT_FRIENDLY" );
    precachestring( &"TRAINER_HINT_FLASH" );
    precachestring( &"TRAINER_MISSED_ENEMY_PENALTY_NONE" );
    precachestring( &"TRAINER_MISSED_ENEMY_PENALTY" );
    precachestring( &"TRAINER_ACCURACY_BONUS" );
    precachestring( &"TRAINER_SHIP_LABEL" );
    precachestring( &"TRAINER_DECK_LABEL" );
    precachestring( &"TRAINER_ACCURACY_NA" );
    precachestring( &"TRAINER_ACCURACY_BONUS_ZERO" );
    precachestring( &"TRAINER_RESULT_YOURTIME_TEXT" );
    precachestring( &"TRAINER_RESULT_ENEMIESHIT_TEXT" );
    precachestring( &"TRAINER_RESULT_CIVILSHIT_TEXT" );
    precachestring( &"TRAINER_RESULT_ACCURACY_TEXT" );
    precachestring( &"TRAINER_RESULT_FINALTIME_TEXT" );
    precachestring( &"TRAINER_RESULT_PERSONALBEST_TEXT" );
    precachestring( &"TRAINER_RESULT_NEW_RECORD" );
    precachestring( &"TRAINER_RESULT_ENEMIESHIT_VALUE" );
    precachestring( &"TRAINER_RESULT_CIVILSHIT_VALUE" );
    precachestring( &"TRAINER_RESULT_ACCURACY_STAT" );
    precachestring( &"TRAINER_RESULT_TIME_VALUE" );
    precachestring( &"TRAINER_RESULT_TIME_BONUS" );
    precachestring( &"TRAINER_RESULT_TIME_PENALTY" );
    precachestring( &"TRAINER_RESULT_TIME_NULL" );
    precachestring( &"TRAINER_RESULT_RECOMMENDEDDIFF" );
    precachestring( &"TRAINER_RESULT_FAILEDCOURSE" );
    precachestring( &"TRAINER_RESULT_TRYAGAIN" );
    precachestring( &"TRAINER_RESULT_RECRUIT" );
    precachestring( &"TRAINER_RESULT_REGULAR" );
    precachestring( &"TRAINER_RESULT_HARDENED" );
    precachestring( &"TRAINER_RESULT_VETERAN" );
    precachestring( &"TRAINER_HINT_GRENADE_TOO_LOW" );
    precachestring( &"TRAINER_HINT_GL_TOO_LOW" );
    precachestring( &"TRAINER_AXIS_OPTION_MENU1" );
    precachestring( &"TRAINER_AXIS_OPTION_MENU2" );
    precachestring( &"TRAINER_AXIS_OPTION_MENU1B" );
    precachestring( &"TRAINER_AXIS_OPTION_MENU2B" );
    precachestring( &"TRAINER_AXIS_OPTION_YES" );
    precachestring( &"TRAINER_AXIS_OPTION_NO" );
    precachestring( &"TRAINER_AXIS_OPTION_MENU1_ALL" );
    precachestring( &"TRAINER_AXIS_OPTION_MENU2_ALL" );
    precachestring( &"TRAINER_LOOK_UP" );
    precachestring( &"TRAINER_LOOK_DOWN" );
    precachestring( &"TRAINER_HINT_LAUNCHER_ICON" );
    precachestring( &"TRAINER_FIRED_NEAR_FRIENDLY" );
    precachestring( &"TRAINER_USE_YOUR_OBJECTIVE_INDICATOR" );
    precachestring( &"TRAINER_PICK_UP_A_RIFLE_FROM" );
    precachestring( &"TRAINER_GET_A_PISTOL_FROM_THE" );
    precachestring( &"TRAINER_MELEE_THE_WATERMELON" );
    precachestring( &"TRAINER_GO_OUTSIDE_AND_REPORT" );
    precachestring( &"TRAINER_PICK_UP_THE_RIFLE_WITH" );
    precachestring( &"TRAINER_PICK_UP_THE_C4_EXPLOSIVE" );
    precachestring( &"TRAINER_RUN_THE_OBSTACLE_COURSE" );
    precachestring( &"OBJ_GO_TO_THE_PIT" );
    precachestring( &"TRAINER_CLIMB_THE_LADDER" );
    precachestring( &"TRAINER_OBJ_EXIT_THE_PIT" );
    precachestring( &"TRAINER_DEBRIEF_WITH_DUNN" );
    precachestring( &"TRAINER_COMPLETE_COURSE" );
    precachestring( &"TRAINER_DEBRIEF_WITH_CPT_PRICE" );
    precachestring( &"TRAINER_ENTER_STATION_NUMBER" );
    precachestring( &"TRAINER_SHOOT_EACH_TARGET_WHILE" );
    precachestring( &"TRAINER_SHOOT_EACH_TARGET_WHILE1" );
    precachestring( &"TRAINER_SHOOT_EACH_TARGET_AS" );
    precachestring( &"TRAINER_EQUIP_THE_MP5_AND_PICK" );
    precachestring( &"TRAINER_CLEAR_THE_CARGOSHIP_BRIDGE" );
    precachestring( &"TRAINER_SWITCH_TO_YOUR_RIFLE" );
    precachestring( &"TRAINER_PICK_UP_THE_FRAG_GRENADES" );
    precachestring( &"TRAINER_ENTER_THE_SAFETY_PIT" );
    precachestring( &"TRAINER_THROW_A_GRENADE_INTO" );
    precachestring( &"TRAINER_RETURN_TO_THE_SAFETY" );
    precachestring( &"TRAINER_FIRE_AT_THE_WALL_WITH" );
    precachestring( &"TRAINER_PLANT_THE_C4_EXPLOSIVE" );
    precachestring( &"TRAINER_FIRE_YOUR_GRENADE_LAUNCHER" );
    precachestring( &"TRAINER_CLIMB_THE_LADDER1" );
    precachestring( &"TRAINER_SHOOT_A_TARGET_THROUGH" );
    precachestring( &"TRAINER_SLIDE_DOWN_THE_ROPE" );
    precachestring( &"TRAINER_COMPLETE_THE_DECK_MOCKUP" );
    precachestring( &"TRAINER_RECOMMENDED_LABEL" );
    precachestring( &"TRAINER_RECOMMENDED_LABEL2" );
    precachestring( &"TRAINER_RECOMMENDED_EASY" );
    precachestring( &"TRAINER_RECOMMENDED_NORMAL" );
    precachestring( &"TRAINER_RECOMMENDED_HARD" );
    precachestring( &"TRAINER_RECOMMENDED_VETERAN" );
    precachestring( &"TRAINER_RECOMMENDED_TRY_AGAIN" );
    precacherumble( "tank_rumble" );

    precachemodel( "h2_gfl_ump45_viewbody" );
    precachemodel( "h2_gfl_ump45_viewhands" );
    precachemodel( "h2_gfl_ump45_viewhands_player" );

}

dialogue_execute( var_0, var_1, var_2 )
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );

    if ( isdefined( var_2 ) && var_2 )
        _id_B3AB::_id_AC8B();

    maps\_utility::dialogue_queue( var_0 );

    if ( isdefined( var_2 ) && var_2 )
        _id_B3AB::_id_B6FF();

    if ( isdefined( var_1 ) )
        common_scripts\utility::flag_set( var_1 );
}

_id_CEAE( var_0, var_1 )
{
    var_2 = 0.5;
    level endon( "clearing_hints" );

    if ( isdefined( level._id_BED3 ) )
        level._id_BED3 maps\_hud_util::destroyelem();

    level._id_BED3 = maps\_hud_util::createfontstring( "default", 1.5 );
    level._id_BED3 maps\_hud_util::setpoint( "BOTTOM", undefined, 0, -60 );
    level._id_BED3.color = ( 1.0, 1.0, 1.0 );
    level._id_BED3 settext( var_0 );
    level._id_BED3.alpha = 0;
    level._id_BED3 fadeovertime( 0.5 );
    level._id_BED3.alpha = 1;
    level._id_BED3.sort = 1;
    wait 0.5;
    level._id_BED3 endon( "death" );

    if ( isdefined( var_1 ) )
        wait(var_1);
    else
        return;

    level._id_BED3 fadeovertime( var_2 );
    level._id_BED3.alpha = 0;
    wait(var_2);
    level._id_BED3 maps\_hud_util::destroyelem();
}

_id_BD26( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::flag_init( var_0 );
    var_4 = level.objectives.size;
    var_5 = spawnstruct();
    var_5.name = var_0;
    var_5.id = var_4;
    var_5.state = "invisible";
    var_5.text = var_1;
    var_5.entity = var_2;
    var_5._id_BB0E = 0;
    var_5.offsetpos = var_3;
    level.objectives[var_0] = var_5;
    return var_5;
}

_id_C7C7( var_0, var_1, var_2 )
{
    var_3 = level.objectives[var_0];
    var_3.state = var_1;

    if ( !var_3._id_BB0E )
    {
        objective_add( var_3.id, var_3.state, var_3.text, var_3.entity.origin );
        var_3._id_BB0E = 1;
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

_id_D393( var_0, var_1, var_2 )
{
    var_3 = level.objectives[var_0];
    var_3._id_BA07 = var_1;

    if ( isdefined( var_2 ) )
        var_3.offsetpos = var_2;

    if ( !isdefined( var_3._id_BA07 ) )
    {
        objective_position( var_3.id, ( 0.0, 0.0, 0.0 ) );
        return;
    }

    if ( isdefined( var_3._id_BA07 ) && isdefined( var_3.offsetpos ) )
    {
        objective_onentity( var_3.id, var_3._id_BA07, var_3.offsetpos );
        return;
    }

    objective_position( var_3.id, var_3._id_BA07.origin );
}

_id_C1A3( var_0, var_1, var_2 )
{
    var_3 = level.objectives[var_0];

    if ( !var_2 )
        objective_string( var_3.id, var_1 );
    else
        objective_string( var_3.id, var_1, var_2 );
}

_id_CED3( var_0, var_1, var_2, var_3 )
{
    clear_hints();
    level endon( "clearing_hints" );
    var_4 = _id_C3F6( var_0 );
    var_5 = var_4.hint;
    var_6 = var_4._id_ADAF;
    var_7 = var_4._id_CB31;
    maps\_utility::hint( var_5, undefined, undefined, var_2, var_7 );

    if ( isdefined( var_6 ) )
        level.hintelement thread common_scripts\utility::_id_BAF1( level.player, var_5, var_6, "clearing_hints" );

    if ( !isdefined( var_3 ) )
    {
        var_8 = "did_action_" + var_0;

        for ( var_9 = 0; var_9 < level._id_D385[var_0].size; var_9++ )
        {
            var_4 = level._id_D385[var_0][var_9];
            notifyoncommand( var_8, var_4._id_BD0C );
        }

        if ( isdefined( var_1 ) )
            level.player thread _id_CA90( var_8, var_1 );

        level.player waittill( var_8 );
        _id_AEBF( 0.5 );
        wait 0.5;
        clear_hints();
    }
}

_id_BFBC( var_0 )
{
    level endon( "clearing_hints" );
    common_scripts\utility::flag_wait( var_0 );
    clear_hints();
}

_id_AD79( var_0, var_1 )
{
    thread _id_BFBC( var_0 );
    level endon( var_0 );
    wait(var_1);
    _id_AA1F();
    wait 2;
    var_2 = 6;

    for (;;)
    {
        if ( var_2 > 20.0 )
        {
            thread _id_D2E4();
            refreshhudcompass();
            var_2 = 0;
        }

        var_2 += 0.05;
        wait 0.05;
    }
}

_id_AF44( var_0 )
{
    level endon( "mission failed" );
    level endon( "navigationTraining_end" );
    level endon( "obj_go_to_the_pit_done" );
    wait 20;

    if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
        _id_CED3( "objectives", 6.0 );
    else
        _id_CED3( "objectives_pc", 6.0 );

    var_1 = 0;

    for (;;)
    {
        if ( !common_scripts\utility::flag( var_0 ) && var_1 > 20.0 )
        {
            thread _id_D2E4();
            refreshhudcompass();
            var_1 = 0;
        }

        var_1 += 0.05;
        wait 0.05;
    }
}

_id_AA1F( var_0, var_1 )
{
    clear_hints();
    level endon( "clearing_hints" );
    maps\_utility::hint( &"TRAINER_HINT_OBJECTIVE_MARKER", undefined, undefined, 1 );
    wait 5;
    wait 0.5;
    _id_AEBF( 0.5 );
    clear_hints();
}

_id_D2E4()
{
    level endon( "mission failed" );
    level endon( "navigationTraining_end" );
    level endon( "obj_go_to_the_pit_done" );
    clear_hints();
    level endon( "clearing_hints" );
    maps\_utility::hint( &"TRAINER_HINT_OBJECTIVE_REMINDER", undefined, undefined, 1, "small_background" );
    wait 5;
    wait 2;
    _id_AEBF( 0.5 );
    clear_hints();
}

clear_hints()
{
    maps\_utility::hint_fade( 0 );
    level notify( "clearing_hints" );
}

_id_AEBF( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    thread maps\_utility::hint_fade( var_0 );
}

_id_B682( var_0, var_1, var_2 )
{
    clear_hints();
    level endon( "clearing_hints" );
    maps\_utility::hint( var_0, undefined, undefined, var_2 );

    if ( isdefined( var_1 ) )
        wait(var_1);
    else
        return;

    _id_AEBF( 0.5 );
    wait 0.5;
    clear_hints();
}

_id_CA90( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
    self notify( var_0 );
}

_id_B458( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_0 );
    self delete();
}

_id_C7AD()
{
    level._id_D385 = [];
    _id_AF68( "objectives", "pause", &"TRAINER_HINT_CHECK_OBJECTIVES_PAUSED", &"TRAINER_HINT_CHECK_OBJECTIVES_SCORES" );
    _id_AF68( "objectives_pc", "+scores", &"TRAINER_HINT_CHECK_OBJECTIVES_SCORES", &"TRAINER_HINT_CHECK_OBJECTIVES_PAUSED" );
    _id_AF68( "pc_attack", "+attack", &"TRAINER_HINT_ATTACK_PC" );
    _id_AF68( "pc_attack", "+attack_akimbo_accessible", &"TRAINER_HINT_HIP_ATTACK_PC" );
    _id_AF68( "pc_hip_attack", "+attack", &"TRAINER_HINT_HIP_ATTACK_PC", undefined, "medium_background" );
    _id_AF68( "pc_hip_attack", "+attack_akimbo_accessible", &"TRAINER_HINT_HIP_ATTACK_PC", undefined, "medium_background" );
    _id_AF68( "hip_attack", "+attack", &"TRAINER_HINT_HIP_ATTACK", undefined, "medium_background" );
    _id_AF68( "hip_attack", "+attack_akimbo_accessible", &"TRAINER_HINT_HIP_ATTACK_PC", undefined, "medium_background" );
    _id_AF68( "attack", "+attack", &"TRAINER_HINT_ATTACK" );
    _id_AF68( "attack", "+attack_akimbo_accessible", &"TRAINER_HINT_HIP_ATTACK_PC", undefined, "medium_background" );
    _id_AF68( "stop_ads", "+speed_throw", &"TRAINER_HINT_STOP_ADS_THROW", &"TRAINER_HINT_STOP_ADS_TOGGLE_THROW" );
    _id_AF68( "stop_ads", "+speed", &"TRAINER_HINT_STOP_ADS" );
    _id_AF68( "stop_ads", "+toggleads_throw", &"TRAINER_HINT_STOP_ADS_TOGGLE_THROW", &"TRAINER_HINT_STOP_ADS_THROW" );
    _id_AF68( "stop_ads", "toggleads", &"TRAINER_HINT_STOP_ADS_TOGGLE" );
    _id_AF68( "ads_360", "+speed_throw", &"TRAINER_HINT_ADS_THROW_360" );
    _id_AF68( "ads_360", "+speed", &"TRAINER_HINT_ADS_360" );
    _id_AF68( "ads", "+speed_throw", &"TRAINER_HINT_ADS_THROW", &"TRAINER_HINT_ADS_TOGGLE_THROW" );
    _id_AF68( "ads", "+speed", &"TRAINER_HINT_ADS" );
    _id_AF68( "ads", "+toggleads_throw", &"TRAINER_HINT_ADS_TOGGLE_THROW", &"TRAINER_HINT_ADS_THROW" );
    _id_AF68( "ads", "toggleads", &"TRAINER_HINT_ADS_TOGGLE" );
    _id_AF68( "ads_switch", "+speed_throw", &"TRAINER_HINT_ADS_SWITCH_THROW" );
    _id_AF68( "ads_switch", "+speed", &"TRAINER_HINT_ADS_SWITCH" );
    _id_AF68( "ads_switch_shoulder", "+speed_throw", &"TRAINER_HINT_ADS_SWITCH_THROW_SHOULDER" );
    _id_AF68( "ads_switch_shoulder", "+speed", &"TRAINER_HINT_ADS_SWITCH_SHOULDER" );
    _id_AF68( "breath", "+melee_breath", &"TRAINER_HINT_BREATH_MELEE" );
    _id_AF68( "breath", "+breath_sprint", &"TRAINER_HINT_BREATH_SPRINT" );
    _id_AF68( "breath", "+holdbreath", &"TRAINER_HINT_BREATH" );
    _id_AF68( "melee", "+melee", &"TRAINER_HINT_MELEE", undefined, "small_background" );
    _id_AF68( "melee", "+melee_breath", &"TRAINER_HINT_MELEE", undefined, "small_background" );
    _id_AF68( "melee", "+melee_zoom", &"TRAINER_HINT_MELEE", undefined, "small_background" );
    _id_AF68( "prone", "goprone", &"TRAINER_HINT_PRONE" );
    _id_AF68( "prone", "+stance", &"TRAINER_HINT_PRONE_STANCE" );
    _id_AF68( "prone", "toggleprone", &"TRAINER_HINT_PRONE_TOGGLE" );
    _id_AF68( "prone", "+prone", &"TRAINER_HINT_PRONE_HOLD" );
    _id_AF68( "prone", "lowerstance", &"TRAINER_HINT_PRONE_DOUBLE" );
    _id_AF68( "crouch", "+stance", &"TRAINER_HINT_CROUCH_STANCE", &"TRAINER_HINT_CROUCH_TOGGLE" );
    _id_AF68( "crouch", "+togglecrouch", &"TRAINER_HINT_CROUCH_TOGGLE", &"TRAINER_HINT_CROUCH_STANCE" );
    _id_AF68( "crouch", "+movedown", &"TRAINER_HINT_CROUCH_HOLD", &"TRAINER_HINT_CROUCH_STANCE" );
    _id_AF68( "crouch", "gocrouch", &"TRAINER_HINT_CROUCH", &"TRAINER_HINT_CROUCH_STANCE" );
    _id_AF68( "stand", "+stance", &"TRAINER_HINT_STAND_STANCE", undefined, "small_background" );
    _id_AF68( "stand", "+gostand", &"TRAINER_HINT_STAND", undefined, "small_background" );
    _id_AF68( "stand", "+moveup", &"TRAINER_HINT_STAND_UP", undefined, "small_background" );
    _id_AF68( "stand", "+togglecrouch", &"TRAINER_HINT_STAND", undefined, "small_background" );
    _id_AF68( "stand", "toggleprone", &"TRAINER_HINT_STAND", undefined, "small_background" );
    _id_AF68( "jump", "+gostand", &"TRAINER_HINT_JUMP_STAND" );
    _id_AF68( "jump", "+moveup", &"TRAINER_HINT_JUMP" );
    _id_AF68( "sprint", "+breath_sprint", &"TRAINER_HINT_SPRINT", undefined, "medium_background" );
    _id_AF68( "sprint", "+sprint", &"TRAINER_HINT_SPRINT", undefined, "medium_background" );
    _id_AF68( "sprint", "+sprint_zoom", &"TRAINER_HINT_SPRINT", undefined, "medium_background" );
    _id_AF68( "sprint_pc", "+breath_sprint", &"TRAINER_HINT_SPRINT_PC", undefined, "medium_background" );
    _id_AF68( "sprint_pc", "+sprint", &"TRAINER_HINT_SPRINT_PC", undefined, "medium_background" );
    _id_AF68( "sprint_pc", "+sprint_zoom", &"TRAINER_HINT_SPRINT_PC", undefined, "medium_background" );
    _id_AF68( "sprint2", "+breath_sprint", &"TRAINER_HINT_HOLDING_SPRINT" );
    _id_AF68( "sprint2", "+sprint", &"TRAINER_HINT_HOLDING_SPRINT" );
    _id_AF68( "sprint2", "+sprint_zoom", &"TRAINER_HINT_HOLDING_SPRINT" );
    _id_AF68( "reload", "+reload", &"TRAINER_HINT_RELOAD", undefined, "medium_background" );
    _id_AF68( "reload", "+usereload", &"TRAINER_HINT_RELOAD_USE", undefined, "medium_background" );
    _id_AF68( "mantle", "+gostand", &"TRAINER_HINT_MANTLE" );
    _id_AF68( "sidearm", "weapnext", &"TRAINER_HINT_SIDEARM_SWAP" );
    _id_AF68( "primary", "weapnext", &"TRAINER_HINT_PRIMARY_SWAP" );
    _id_AF68( "frag", "+frag", &"TRAINER_HINT_FRAG", undefined, "medium_background" );
    _id_AF68( "flash", "+smoke", &"TRAINER_HINT_FLASH" );
    _id_AF68( "swap_launcher", "+activate", &"TRAINER_HINT_SWAP" );
    _id_AF68( "swap_launcher", "+usereload", &"TRAINER_HINT_SWAP_RELOAD" );
    _id_AF68( "firemode", "+actionslot 2", &"TRAINER_HINT_FIREMODE" );
    _id_AF68( "attack_launcher", "+attack", &"TRAINER_HINT_LAUNCHER_ATTACK" );
    _id_AF68( "swap_explosives", "+activate", &"TRAINER_HINT_EXPLOSIVES" );
    _id_AF68( "swap_explosives", "+usereload", &"TRAINER_HINT_EXPLOSIVES_RELOAD" );
    _id_AF68( "plant_explosives", "+activate", &"TRAINER_HINT_EXPLOSIVES_PLANT" );
    _id_AF68( "plant_explosives", "+usereload", &"TRAINER_HINT_EXPLOSIVES_PLANT_RELOAD" );
    _id_AF68( "equip_C4", "+actionslot 4", &"TRAINER_HINT_EQUIP_C4" );
    _id_AF68( "throw_C4", "+toggleads_throw", &"TRAINER_HINT_THROW_C4_TOGGLE" );
    _id_AF68( "throw_C4", "+speed_throw", &"TRAINER_HINT_THROW_C4_SPEED" );
    _id_AF68( "throw_C4", "+throw", &"TRAINER_HINT_THROW_C4" );
    _id_AF68( "detonate_C4", "+attack", &"TRAINER_DETONATE_C4" );
    _id_AF68( "inspect_weapon", "+actionslot 2", &"TRAINER_HINT_WEAPON_INSPECT", &"TRAINER_HINT_WEAPON_INSPECT_PC" );
    _id_AF68( "inspect_weapon_pc", "weapinspect", &"TRAINER_HINT_WEAPON_INSPECT_PC", &"TRAINER_HINT_WEAPON_INSPECT" );
    _id_AF68( "look_inversion", "pause", &"TRAINER_HINT_INVERT_CONTROL", &"TRAINER_HINT_INVERT_CONTROL_PC" );
    _id_AF68( "look_inversion_pc", "pause", &"TRAINER_HINT_INVERT_CONTROL_PC", &"TRAINER_HINT_INVERT_CONTROL" );
    _id_BACF();
    _id_BC36();
}

_id_AF68( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_D385[var_0] ) )
        level._id_D385[var_0] = [];

    var_5 = spawnstruct();
    var_5._id_BD0C = var_1;
    var_5.hint = var_2;
    var_5._id_ADAF = var_3;
    var_5._id_D566 = undefined;
    var_5._id_BC0C = undefined;
    var_5._id_CB31 = var_4;
    precachestring( var_2 );
    level._id_D385[var_0][level._id_D385[var_0].size] = var_5;
}

_id_C3F6( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_D385[var_0].size; var_1++ )
    {
        var_2 = level._id_D385[var_0][var_1];
        var_3 = getkeybinding( var_2._id_BD0C );

        if ( !var_3["count"] )
            continue;

        return level._id_D385[var_0][var_1];
    }

    return level._id_D385[var_0][0];
}

_id_BC36()
{
    if ( level.console )
    {
        _id_C68B( getcommandfromkey( "BUTTON_START" ), "BUTTON_START" );
        _id_C68B( getcommandfromkey( "BUTTON_A" ), "BUTTON_A" );
        _id_C68B( getcommandfromkey( "BUTTON_B" ), "BUTTON_B" );
        _id_C68B( getcommandfromkey( "BUTTON_X" ), "BUTTON_X" );
        _id_C68B( getcommandfromkey( "BUTTON_Y" ), "BUTTON_Y" );
        _id_C68B( getcommandfromkey( "BUTTON_LSTICK" ), "BUTTON_LSTICK" );
        _id_C68B( getcommandfromkey( "BUTTON_RSTICK" ), "BUTTON_RSTICK" );
        _id_C68B( getcommandfromkey( "BUTTON_LSHLDR" ), "BUTTON_LSHLDR" );
        _id_C68B( getcommandfromkey( "BUTTON_RSHLDR" ), "BUTTON_RSHLDR" );
        _id_C68B( getcommandfromkey( "BUTTON_LTRIG" ), "BUTTON_LTRIG" );
        _id_C68B( getcommandfromkey( "BUTTON_RTRIG" ), "BUTTON_RTRIG" );
    }
    else
    {
        for ( var_0 = 0; var_0 < level._id_BFAB.size; var_0++ )
            _id_C68B( getcommandfromkey( level._id_BFAB[var_0] ), level._id_BFAB[var_0] );

        for ( var_0 = 0; var_0 < level._id_A994.size; var_0++ )
            _id_C68B( getcommandfromkey( level._id_A994[var_0] ), level._id_A994[var_0] );
    }
}

_id_CF9D( var_0 )
{
    var_1 = getarraykeys( level._id_D385 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = level._id_D385[var_1[var_2]];

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( var_3[var_4]._id_BD0C != var_0 )
                continue;

            return var_1[var_2];
        }
    }
}

_id_C68B( var_0, var_1 )
{
    if ( var_0 == "" )
        return;

    var_2 = getarraykeys( level._id_D385 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = level._id_D385[var_2[var_3]];

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            if ( var_4[var_5]._id_BD0C != var_0 )
                continue;

            var_4[var_5]._id_B9D8 = var_1;
        }
    }
}

_id_BACF()
{
    level._id_BFAB = "1234567890-=qwertyuiop[]asdfghjkl;'zxcvbnm,./";
    level._id_A994 = [];
    level._id_A994[level._id_A994.size] = "TAB";
    level._id_A994[level._id_A994.size] = "ENTER";
    level._id_A994[level._id_A994.size] = "ESCAPE";
    level._id_A994[level._id_A994.size] = "SPACE";
    level._id_A994[level._id_A994.size] = "BACKSPACE";
    level._id_A994[level._id_A994.size] = "UPARROW";
    level._id_A994[level._id_A994.size] = "DOWNARROW";
    level._id_A994[level._id_A994.size] = "LEFTARROW";
    level._id_A994[level._id_A994.size] = "RIGHTARROW";
    level._id_A994[level._id_A994.size] = "ALT";
    level._id_A994[level._id_A994.size] = "CTRL";
    level._id_A994[level._id_A994.size] = "SHIFT";
    level._id_A994[level._id_A994.size] = "CAPSLOCK";
    level._id_A994[level._id_A994.size] = "F1";
    level._id_A994[level._id_A994.size] = "F2";
    level._id_A994[level._id_A994.size] = "F3";
    level._id_A994[level._id_A994.size] = "F4";
    level._id_A994[level._id_A994.size] = "F5";
    level._id_A994[level._id_A994.size] = "F6";
    level._id_A994[level._id_A994.size] = "F7";
    level._id_A994[level._id_A994.size] = "F8";
    level._id_A994[level._id_A994.size] = "F9";
    level._id_A994[level._id_A994.size] = "F10";
    level._id_A994[level._id_A994.size] = "F11";
    level._id_A994[level._id_A994.size] = "F12";
    level._id_A994[level._id_A994.size] = "INS";
    level._id_A994[level._id_A994.size] = "DEL";
    level._id_A994[level._id_A994.size] = "PGDN";
    level._id_A994[level._id_A994.size] = "PGUP";
    level._id_A994[level._id_A994.size] = "HOME";
    level._id_A994[level._id_A994.size] = "END";
    level._id_A994[level._id_A994.size] = "MOUSE1";
    level._id_A994[level._id_A994.size] = "MOUSE2";
    level._id_A994[level._id_A994.size] = "MOUSE3";
    level._id_A994[level._id_A994.size] = "MOUSE4";
    level._id_A994[level._id_A994.size] = "MOUSE5";
    level._id_A994[level._id_A994.size] = "MWHEELUP";
    level._id_A994[level._id_A994.size] = "MWHEELDOWN";
    level._id_A994[level._id_A994.size] = "AUX1";
    level._id_A994[level._id_A994.size] = "AUX2";
    level._id_A994[level._id_A994.size] = "AUX3";
    level._id_A994[level._id_A994.size] = "AUX4";
    level._id_A994[level._id_A994.size] = "AUX5";
    level._id_A994[level._id_A994.size] = "AUX6";
    level._id_A994[level._id_A994.size] = "AUX7";
    level._id_A994[level._id_A994.size] = "AUX8";
    level._id_A994[level._id_A994.size] = "AUX9";
    level._id_A994[level._id_A994.size] = "AUX10";
    level._id_A994[level._id_A994.size] = "AUX11";
    level._id_A994[level._id_A994.size] = "AUX12";
    level._id_A994[level._id_A994.size] = "AUX13";
    level._id_A994[level._id_A994.size] = "AUX14";
    level._id_A994[level._id_A994.size] = "AUX15";
    level._id_A994[level._id_A994.size] = "AUX16";
    level._id_A994[level._id_A994.size] = "KP_HOME";
    level._id_A994[level._id_A994.size] = "KP_UPARROW";
    level._id_A994[level._id_A994.size] = "KP_PGUP";
    level._id_A994[level._id_A994.size] = "KP_LEFTARROW";
    level._id_A994[level._id_A994.size] = "KP_5";
    level._id_A994[level._id_A994.size] = "KP_RIGHTARROW";
    level._id_A994[level._id_A994.size] = "KP_END";
    level._id_A994[level._id_A994.size] = "KP_DOWNARROW";
    level._id_A994[level._id_A994.size] = "KP_PGDN";
    level._id_A994[level._id_A994.size] = "KP_ENTER";
    level._id_A994[level._id_A994.size] = "KP_INS";
    level._id_A994[level._id_A994.size] = "KP_DEL";
    level._id_A994[level._id_A994.size] = "KP_SLASH";
    level._id_A994[level._id_A994.size] = "KP_MINUS";
    level._id_A994[level._id_A994.size] = "KP_PLUS";
    level._id_A994[level._id_A994.size] = "KP_NUMLOCK";
    level._id_A994[level._id_A994.size] = "KP_STAR";
    level._id_A994[level._id_A994.size] = "KP_EQUALS";
    level._id_A994[level._id_A994.size] = "PAUSE";
    level._id_A994[level._id_A994.size] = "SEMICOLON";
    level._id_A994[level._id_A994.size] = "COMMAND";
    level._id_A994[level._id_A994.size] = "181";
    level._id_A994[level._id_A994.size] = "191";
    level._id_A994[level._id_A994.size] = "223";
    level._id_A994[level._id_A994.size] = "224";
    level._id_A994[level._id_A994.size] = "225";
    level._id_A994[level._id_A994.size] = "228";
    level._id_A994[level._id_A994.size] = "229";
    level._id_A994[level._id_A994.size] = "230";
    level._id_A994[level._id_A994.size] = "231";
    level._id_A994[level._id_A994.size] = "232";
    level._id_A994[level._id_A994.size] = "233";
    level._id_A994[level._id_A994.size] = "236";
    level._id_A994[level._id_A994.size] = "241";
    level._id_A994[level._id_A994.size] = "242";
    level._id_A994[level._id_A994.size] = "243";
    level._id_A994[level._id_A994.size] = "246";
    level._id_A994[level._id_A994.size] = "248";
    level._id_A994[level._id_A994.size] = "249";
    level._id_A994[level._id_A994.size] = "250";
    level._id_A994[level._id_A994.size] = "252";
}

_id_D448( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    var_2 = undefined;
    var_3 = [];
    var_4 = [];
    var_5 = undefined;
    var_6 = undefined;

    foreach ( var_8 in var_1 )
    {
        if ( var_8.code_classname == "script_brushmodel" )
        {
            var_4[var_4.size] = var_8;

            if ( isdefined( var_8.script_noteworthy ) && var_8.script_noteworthy == "blocker" )
                var_6 = var_8;

            continue;
        }

        if ( var_8.code_classname == "script_origin" )
        {
            var_2 = var_8;
            continue;
        }

        if ( var_8.code_classname == "script_model" )
        {
            var_3[var_3.size] = var_8;
            continue;
        }

        if ( var_8.code_classname == "trigger_radius" )
        {
            var_5 = var_8;
            continue;
        }
    }

    foreach ( var_11 in var_3 )
        var_11 linkto( var_2 );

    foreach ( var_14 in var_4 )
        var_14 linkto( var_2 );

    var_16 = var_2;
    var_16._id_CAD5 = var_4;

    if ( isdefined( var_5 ) )
        var_16.trigger = var_5;

    return var_16;
}

_id_D011()
{
    self.origin += ( 0.0, 0.0, -1000.0 );
}

_id_C1D1()
{
    self.origin += ( 0.0, 0.0, 1000.0 );
}

_id_B90C()
{
    switch ( self.vehicletype )
    {
        case "latvee":
        case "laatpv":
        case "laatpv_minigun":
            thread _id_D227();
            break;
        case "m1a1":
            thread _id_BD2E();
            break;
        case "cobra":
            thread _id_AC1C();
            break;
    }
}

_id_D227()
{

}

_id_BD2E()
{

}

_id_AC1C()
{

}

_id_B6A2()
{
    self endon( "death" );
    self endon( "stop_default_drone_behavior" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "ai_ambient" )
    {
        self.dontdonotetracks = 1;
        self.script_looping = 0;
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "runners" )
    {
        self waittill( "goal" );
        self delete();
    }
}

_id_BBA1( var_0, var_1 )
{
    self endon( "death" );
    _id_BA74();
    var_2 = undefined;
    var_3 = undefined;
    var_4 = 0;

    if ( isdefined( self.target ) )
        var_2 = getnode( self.target, "targetname" );

    thread _id_C858();

    if ( isarray( level.scr_anim["generic"][var_0] ) )
    {
        var_4 = 1;

        if ( var_0 == "h2_training_basketball_guy2" )
        {
            var_5 = getent( "basketball", "targetname" );
            var_5.animname = "basketball";
            var_5 maps\_utility::assign_animtree();
            self.eaniment thread maps\_anim::anim_loop_solo( var_5, "training_basketball_loop", "stop_idle" );
        }

        self.eaniment thread maps\_anim::anim_generic_loop( self, var_0, "stop_idle" );
        var_3 = var_0 + "_go";

        if ( anim_exists( var_3 ) )
            var_0 = var_3;
        else
            var_3 = undefined;
    }
    else
        self.eaniment maps\_anim::anim_generic_first_frame( self, var_0 );

    if ( isdefined( self.script_flag ) )
    {
        if ( isdefined( var_1 ) )
            common_scripts\utility::flag_wait_either( self.script_flag, var_1 );
        else
            common_scripts\utility::flag_wait( self.script_flag );
    }

    if ( isdefined( var_2 ) )
    {
        self.disablearrivals = 1;
        self.disableexits = 1;
    }

    if ( !var_4 )
        self.eaniment maps\_anim::anim_generic( self, var_0 );

    if ( isdefined( var_3 ) )
    {
        self.eaniment notify( "stop_idle" );
        self.eaniment maps\_anim::anim_generic( self, var_3 );
    }

    switch ( var_0 )
    {
        case "civilian_run_2_crawldeath":
            self kill();
            break;
    }

    if ( isdefined( var_2 ) )
    {
        self setgoalnode( var_2 );
        wait 1;
        self.disablearrivals = 0;
        self.disableexits = 0;
        self waittill( "goal" );

        if ( isdefined( self.cqbwalking ) && self.cqbwalking )
            maps\_utility::cqb_walk( "off" );
    }
    else if ( isdefined( level.scr_anim["generic"][var_0 + "_idle"] ) )
        self.eaniment thread maps\_anim::anim_generic_loop( self, var_0 + "_idle", "stop_idle" );

    if ( anim_exists( var_0 + "_react" ) )
    {
        if ( !var_4 )
            var_0 += "_idle";

        var_6 = var_0 + "_react";

        if ( anim_exists( var_0 + "_react2" ) )
            var_7 = var_0 + "_react2";
        else
            var_7 = var_6;

        while ( isdefined( self ) )
        {
            level waittill( "mortar_hit" );
            self.eaniment notify( "stop_idle" );
            self notify( "stop_idle" );
            waittillframeend;

            if ( randomint( 100 ) > 50 )
                maps\_anim::anim_generic( self, var_6 );
            else
                maps\_anim::anim_generic( self, var_7 );

            thread maps\_anim::anim_generic_loop( self, var_0, "stop_idle" );
        }
    }
}

_id_C858()
{
    self waittill( "death" );

    if ( isdefined( self.eaniment ) && !isspawner( self.eaniment ) )
        self.eaniment delete();
}

_id_C18B()
{
    self endon( "death" );
    self pushplayer( 1 );
    self _meth_8583();
    maps\_utility::ent_flag_init( "_stealth_normal" );
    maps\_utility::ent_flag_set( "_stealth_normal" );
    self.walkdist = 1000;
    self.disablearrivals = 1;
    wait 0.1;
    level._id_AE5C[level._id_AE5C.size] = self;
    thread h2_hide_ai_pit();
}

_id_D0A1()
{
    thread h2_hide_ai_pit();
    self endon( "death" );
    var_0 = self.animation;
    var_1 = 0;

    if ( !isdefined( self.eaniment ) )
        self.eaniment = self.spawner;

    var_2 = undefined;

    switch ( var_0 )
    {
        case "h2_training_latveerepair_behindguy":
            maps\_utility::gun_remove();
            self attach( "h2_com_clipboard_wpaper_anim", "TAG_INHAND", 1 );
            self attach( "h2_characters_accessories_pencil", "TAG_WEAPON_RIGHT", 1 );
            break;
        case "h2_training_burgertown_truck_soldier":
            maps\_utility::gun_remove();
            self attach( "h2_com_clipboard_wpaper_anim", "TAG_INHAND", 1 );
            self attach( "h2_characters_accessories_pencil", "TAG_WEAPON_RIGHT", 1 );
            break;
        case "h2_training_latveerepair_topguy":
            self attach( "h2_fav_propane_blow_torch", "TAG_INHAND", 1 );
            maps\_utility::gun_remove();
            break;
        case "h2_training_chilling_ground_ranger02":
            self attach( "h2_rkl_cellphone_appicon", "TAG_WEAPON_LEFT", 1 );
            maps\_utility::gun_remove();
            break;
        case "h2_training_chilling_ground_ranger01":
            break;
        case "h2_roadkill_latvee_map_sequence_quiet_idle":
            self attach( "characters_accessories_pencil", "TAG_INHAND", 1 );
            maps\_utility::gun_remove();
            break;
        case "h2_training_latveerepair_underguy":
            thread _id_B6E2();
            maps\_utility::gun_remove();
            var_3 = getent( "h2_prop_wrench", "targetname" );
            self attach( "h2_cs_tool_wrench_adjustable_lrg_anim", "TAG_INHAND" );
            var_3 hide();
            break;
        case "roadkill_latvee_map_sequence_quiet_idle":
            self attach( "characters_accessories_pencil", "TAG_INHAND", 1 );
            maps\_utility::gun_remove();
            break;
        case "training_locals_kneel":
            maps\_utility::gun_remove();
            self._id_CE77 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
            self._id_CE77 setmodel( "weapon_m4" );
            self._id_CE77 hidepart( "TAG_THERMAL_SCOPE" );
            self._id_CE77 hidepart( "TAG_FOREGRIP" );
            self._id_CE77 hidepart( "TAG_ACOG_2" );
            self._id_CE77 hidepart( "TAG_HEARTBEAT" );
            self._id_CE77 hidepart( "TAG_RED_DOT" );
            self._id_CE77 hidepart( "TAG_SHOTGUN" );
            self._id_CE77 hidepart( "TAG_SILENCER" );
            self._id_CE77.origin = self gettagorigin( "tag_inhand" );
            self._id_CE77.angles = self gettagangles( "tag_inhand" );
            self._id_CE77 linkto( self, "tag_inhand" );
            thread common_scripts\utility::delete_on_death( self._id_CE77 );
            break;
        case "training_locals_groupA_guy1":
        case "training_locals_groupA_guy2":
        case "training_locals_groupB_guy1":
        case "training_locals_groupB_guy2":
        case "training_locals_sit":
            break;
        case "parabolic_leaning_guy_idle_training":
        case "parabolic_leaning_guy_idle":
        case "little_bird_casual_idle_guy1":
        case "killhouse_sas_2_idle":
            break;
        case "training_sleeping_in_chair":
            maps\_utility::gun_remove();
            self.eaniment = getent( self.target, "targetname" );
            break;
        case "civilian_run_2_crawldeath":
        case "death_explosion_run_F_v1":
            maps\_utility::gun_remove();
            self.skipdeathanim = 1;
            self.noragdoll = 1;
            break;
        case "afgan_caves_sleeping_guard_idle":
            maps\_utility::gun_remove();
            self.eaniment.origin += ( 0.0, 0.0, 26.0 );
            break;
        case "bunker_toss_idle_guy1":
        case "DC_Burning_artillery_reaction_v1_idle":
        case "DC_Burning_artillery_reaction_v2_idle":
        case "DC_Burning_bunker_stumble":
            maps\_utility::gun_remove();
            break;
        case "unarmed_panickedrun_loop_V2":
            maps\_utility::set_generic_run_anim( "unarmed_panickedrun_loop_V2" );
            maps\_utility::gun_remove();
            self.disablearrivals = 1;
            self.disableexits = 1;
            self.goalradius = 16;
            self waittill( "goal" );
            maps\_utility::clear_run_anim();
            wait 1;
            maps\_utility::gun_recall();
            var_1 = 1;
            return;
        case "wounded_carry_fastwalk_carrier":
            var_4 = getent( self.target, "targetname" );
            var_5 = var_4 maps\_utility::spawn_ai();
            self.eaniment maps\_anim::anim_generic_first_frame( self, var_0 );
            self.eaniment maps\_anim::anim_generic_first_frame( var_5, "wounded_carry_fastwalk_wounded" );
            maps\_utility::gun_remove();
            var_5 maps\_utility::gun_remove();
            var_1 = 1;
            var_6 = getent( self.script_linkto, "script_linkname" );

            if ( isdefined( self.script_flag ) )
                common_scripts\utility::flag_wait( self.script_flag );

            while ( distance( var_6.origin, self.origin ) > 128 )
            {
                thread maps\_anim::anim_generic( self, var_0 );
                maps\_anim::anim_generic( var_5, "wounded_carry_fastwalk_wounded" );
            }

            thread maps\_anim::anim_generic( self, "wounded_carry_putdown_closet_carrier" );
            maps\_anim::anim_generic( var_5, "wounded_carry_putdown_closet_wounded" );
            thread maps\_anim::anim_generic_loop( var_5, "wounded_carry_closet_idle_wounded" );
            thread maps\_anim::anim_generic_loop( self, "wounded_carry_closet_idle_carrier" );
            return;
        case "sitting_guard_loadAK_idle":
            maps\_utility::gun_remove();
            self attach( "weapon_m4_clip", "tag_inhand" );
            break;
        case "civilian_texting_standing":
        case "civilian_texting_sitting":
            maps\_utility::gun_remove();
            self attach( "electronics_pda", "tag_inhand" );
            break;
        case "civilian_reader_1":
        case "civilian_reader_2":
            maps\_utility::gun_remove();
            self attach( "open_book_static", "tag_inhand" );
            break;
        case "civilian_smoking_A":
        case "oilrig_balcony_smoke_idle":
        case "parabolic_leaning_guy_smoking_idle":
            thread maps\_props::attach_cig_self();
            break;
        case "cliffhanger_welder_wing":
            maps\_utility::gun_remove();
            self.eaniment.origin += ( 0.0, 0.0, -3.0 );
            self attach( "machinery_welder_handle", "tag_inhand" );
            thread flashing_welding();
            thread common_scripts\utility::play_loop_sound_on_entity( "scn_trainer_welders_working_loop" );
            break;
        case "roadkill_cover_radio_soldier2":
            break;
        case "roadkill_cover_spotter_idle":
            maps\_utility::gun_remove();
            self attach( "weapon_binocular", "TAG_INHAND", 1 );
            break;
        case "roadkill_cover_radio_soldier3":
            self attach( "mil_mre_chocolate01", "TAG_INHAND", 1 );
            break;
        case "training_basketball_rest":
            maps\_utility::gun_remove();
            self attach( "com_bottle2", "TAG_INHAND", 1 );
            break;
        case "favela_run_and_wave":
            break;
        case "h2_training_bbq_guy":
            maps\_utility::gun_remove();
            self attach( "h2_com_kitchen_utensil_spatula_small_animated", "TAG_WEAPON_RIGHT" );
            break;
        case "h2_parabolic_leaning_guy_smoking_idle":
            maps\_utility::gun_remove();
            thread maps\_props::attach_cig_self();
            break;
        default:
            maps\_utility::gun_remove();
            break;
    }

    thread _id_BBA1( var_0, var_2 );
    thread h2_on_spawn_scriptedevent();
    thread h2_pit_intro();
}

ai_ambient_shooter_think()
{
    var_0 = getent( "shooterAnimationNode", "targetname" );
    self.animname = "generic";

    if ( isdefined( self.spawner.animation ) && ( self.spawner.animation == "h2_training_shootingrange_formation_student" || self.spawner.animation == "h2_training_shootingrange_formation_teacher" ) )
        maps\_utility::forceuseweapon( "scar_h", "primary" );
    else
        maps\_utility::forceuseweapon( "m4_grunt_SSDD", "primary" );

    if ( isdefined( self.animation ) )
    {
        var_0 maps\_anim::anim_loop_solo( self, self.animation );
        return;
    }

    var_1 = "Stand";
    var_2 = undefined;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        switch ( var_1 )
        {
            case "Stand":
                var_2 = randomint( 8 );

                if ( var_2 == 7 )
                    var_1 = "Crouch";

                maps\_anim::anim_single_solo( self, "h2_training_stand_" + var_2 );
                continue;
            case "Crouch":
                var_2 = randomint( 4 );

                if ( var_2 == 3 )
                    var_1 = "Stand";

                maps\_anim::anim_single_solo( self, "h2_training_crouch_" + var_2 );
                continue;
        }
    }
}

_id_BA74()
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self.code_classname ) && self.code_classname == "script_model" )
        return;

    maps\_utility::setflashbangimmunity( 1 );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.grenadeawareness = 0;
}

anim_exists( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "generic";

    if ( isdefined( level.scr_anim[var_1][var_0] ) )
        return 1;
    else
        return 0;
}

_id_B6E2()
{
    self endon( "death" );

    for (;;)
    {
        self waittillmatch( "looping anim", "end" );
        thread common_scripts\utility::play_sound_in_space( "scn_trainer_mechanic" );
    }
}

flashing_welding()
{
    self endon( "death" );
    thread stop_sparks();

    for (;;)
    {
        self waittillmatch( "looping anim", "spark on" );
        thread _id_C738();
    }
}

_id_C738()
{
    self endon( "death" );
    self notify( "starting sparks" );
    self endon( "starting sparks" );
    self endon( "spark off" );

    for (;;)
    {
        playfxontag( level._effect["welding_runner"], self, "tag_tip_fx" );
        self playsound( "elec_spark_welding_bursts" );
        wait(randomfloatrange( 0.25, 0.5 ));
    }
}

stop_sparks()
{
    self endon( "death" );

    for (;;)
    {
        self waittillmatch( "looping anim", "spark off" );
        self notify( "spark off" );
    }
}

flashing_welding_death_handler( var_0 )
{
    var_0 waittill( "death" );
}

_id_D148( var_0 )
{
    var_0.ignoreme = 1;
    var_0.ignoreall = 1;
    var_0 thread maps\_utility::magic_bullet_shield();
    var_0 maps\_utility::disable_pain();

    if ( var_0.team == "axis" )
        var_0 thread _id_CCE9();

    if ( var_0.team == "allies" )
        var_0 thread _id_B2D5();
}

_id_B2D5()
{

}

_id_CCE9()
{
    maps\_utility::forceuseweapon( "m4_grunt_SSDD", "primary" );
    self.team = "allies";
}

_id_D39F()
{
    if ( level.player hasweapon( level._id_A836 ) )
        return 1;
    else
        return 0;
}

_id_BDD2()
{
    if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
    {
        if ( level.player getlocalplayerprofiledata( "autoAim" ) )
            return 1;
    }

    return 0;
}

_id_B28F()
{
    var_0 = getent( "bridge_layer", "targetname" );
    var_1 = getent( "bridge_layer_bridge", "targetname" );
    var_0.animname = "bridge_layer";
    var_0 maps\_utility::assign_animtree();
    var_1.animname = "bridge_layer_bridge";
    var_1 maps\_utility::assign_animtree();
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_2.origin = var_0.origin;
    var_2.angles = var_0.angles;
    var_2 thread maps\_anim::anim_first_frame_solo( var_0, "bridge_raise" );
    var_2 maps\_anim::anim_first_frame_solo( var_1, "bridge_raise" );
    var_0 playloopsound( "m1a1_abrams_idle_low" );
    common_scripts\utility::flag_wait( "player_passing_barracks" );
    var_2 thread maps\_anim::anim_single_solo( var_0, "bridge_raise" );
    var_2 maps\_anim::anim_single_solo( var_1, "bridge_raise" );
}

_id_B2AE()
{
    level._id_AB08 = undefined;
    level._id_B204 = undefined;
    level._id_CDFE = level.player getweaponslistprimaries();
    level._id_A8BE = level.player getweaponammostock( level._id_CDFE[0] );
    level._id_C237 = level.player getweaponammostock( level._id_CDFE[1] );
    level._id_BD7C = level.player getweaponammoclip( level._id_CDFE[0] );
    level._id_B6B6 = level.player getweaponammoclip( level._id_CDFE[1] );
    level._id_AFC9 = level._id_A8BE + level._id_C237 + level._id_BD7C + level._id_B6B6;
    level waittill( "test_cleared" );
    level._id_CDFE = level.player getweaponslistprimaries();
    level._id_A8BE = level.player getweaponammostock( level._id_CDFE[0] );
    level._id_C237 = level.player getweaponammostock( level._id_CDFE[1] );
    level._id_BD7C = level.player getweaponammoclip( level._id_CDFE[0] );
    level._id_B6B6 = level.player getweaponammoclip( level._id_CDFE[1] );
    level._id_D42C = level._id_A8BE + level._id_C237 + level._id_BD7C + level._id_B6B6;
    var_0 = level._id_AFC9 - level._id_D42C;
    var_1 = level._id_CEFF;

    if ( var_1 == 0 || var_0 == 0 )
        level._id_B204 = 0;
    else
    {
        level._id_B204 = var_1 / var_0 * 100;
        level._id_B204 = maps\_utility::rounddecimalplaces( level._id_B204, 0 );
    }

    if ( level._id_B204 == 0 )
        level._id_AB08 = 0;
    else
    {
        if ( level._id_B204 > 200 )
            level._id_B204 = 200;

        level._id_AB08 = level._id_B204 / 0.2 / 100;
        level._id_AB08 = maps\_utility::rounddecimalplaces( level._id_AB08, 1 );
    }

    level notify( "accuracy_bonus" );
}

killtimer( var_0, var_1 )
{
    level._id_D016 = 0;
    level._id_B2DD = 0;
    level._id_C55D = 0;
    var_2 = level._id_AEA9;
    var_3 = level._id_CEFF;
    level notify( "kill_timer" );
    thread maps\trainer_aud::course_end_timer_buzzer();
    _id_BCD8();
    var_4 = 1.0;
    var_5 = common_scripts\utility::_id_D5D2();

    if ( var_5 == "LANGUAGE_SPANISH" || var_5 == "LANGUAGE_GERMAN" || var_5 == "LANGUAGE_FRENCH" || var_5 == "LANGUAGE_POLISH" || var_5 == "LANGUAGE_PORTUGUESE" || var_5 == "LANGUAGE_SPANISHNA" || var_5 == "LANGUAGE_RUSSIAN" || var_5 == "LANGUAGE_RUSSIAN_PARTIAL" || var_5 == "LANGUAGE_ITALIAN" )
        var_4 = 1.2;

    var_6 = int( 210 * var_4 );
    var_7 = 180;
    var_8 = 75;
    var_9 = -28;
    var_10 = -1 * var_6 - 20;
    var_11 = -100;
    var_12 = -35;
    var_13 = -133;
    var_14 = 12;
    var_15 = 18;
    var_16 = 30;
    var_17 = var_8 + var_15;
    var_18 = 0.45;
    var_19 = 0.6;
    var_20 = 0.7;
    var_21 = 0.5;
    var_22 = 0.25;
    level.resulthudelems = [];
    var_23 = ( gettime() - level.start_time ) / 1000;
    var_23 = maps\_utility::rounddecimalplaces( var_23, 2 );
    level.backers = maps\_hud_util::getstatbackers( var_9, var_8, var_6, var_7 );
    var_24 = maps\_hud_util::_id_C465( var_10, var_17, undefined, undefined, var_19, &"TRAINER_RESULT_YOURTIME_TEXT" );
    level.resulthudelems[level.resulthudelems.size] = var_24;
    var_25 = maps\_utility::settimeformat( var_23 );
    var_26 = undefined;
    var_27 = maps\_hud_util::_id_C465( var_12, var_17, undefined, undefined, var_19, var_25, undefined, var_26 );
    var_27.alignx = "right";
    var_27 setpulsefx( 30, 900000, 700 );
    level.resulthudelems[level.resulthudelems.size] = var_27;
    var_17 += var_15;
    wait(var_21);
    var_28 = maps\_hud_util::_id_C465( var_10, var_17, undefined, undefined, var_18, &"TRAINER_RESULT_ENEMIESHIT_TEXT" );
    level.resulthudelems[level.resulthudelems.size] = var_28;
    var_29 = maps\_hud_util::_id_C465( var_11, var_17, undefined, undefined, var_18, &"TRAINER_RESULT_ENEMIESHIT_VALUE", undefined, var_3 );
    var_29.alignx = "right";
    level.resulthudelems[level.resulthudelems.size] = var_29;

    if ( var_3 == level._id_CA61 )
    {
        var_30 = 0;
        var_31 = undefined;
        var_25 = &"TRAINER_RESULT_TIME_NULL";
        var_26 = undefined;
    }
    else
    {
        var_31 = "penalty";
        var_32 = level._id_CA61 - var_3;
        var_30 = var_32 * level._id_CBF6;
        var_25 = maps\_utility::settimeformat( var_30, "+" );
        var_26 = undefined;
    }

    var_33 = maps\_hud_util::_id_C465( var_12, var_17, undefined, undefined, var_18, var_25, var_31, var_26 );
    var_33.alignx = "right";
    level.resulthudelems[level.resulthudelems.size] = var_33;
    var_17 += var_14;
    wait(var_22);
    var_34 = maps\_hud_util::_id_C465( var_10, var_17, undefined, undefined, var_18, &"TRAINER_RESULT_CIVILSHIT_TEXT" );
    level.resulthudelems[level.resulthudelems.size] = var_34;
    var_35 = maps\_hud_util::_id_C465( var_11, var_17, undefined, undefined, var_18, &"TRAINER_RESULT_CIVILSHIT_VALUE", undefined, var_2 );
    var_35.alignx = "right";
    level.resulthudelems[level.resulthudelems.size] = var_35;

    if ( var_2 == 0 )
    {
        var_36 = 0;
        var_31 = undefined;
        var_25 = &"TRAINER_RESULT_TIME_NULL";
        var_26 = undefined;
    }
    else
    {
        var_36 = var_2 * level._id_C747;
        var_31 = "penalty";
        var_25 = maps\_utility::settimeformat( var_36, "+" );
        var_26 = undefined;
    }

    var_37 = maps\_hud_util::_id_C465( var_12, var_17, undefined, undefined, var_18, var_25, var_31, var_26 );
    var_37.alignx = "right";
    level.resulthudelems[level.resulthudelems.size] = var_37;
    var_17 += var_14;
    wait(var_22);
    var_38 = maps\_hud_util::_id_C465( var_10, var_17, undefined, undefined, var_18, &"TRAINER_RESULT_ACCURACY_TEXT" );
    level.resulthudelems[level.resulthudelems.size] = var_38;
    var_39 = maps\_hud_util::_id_C465( var_11, var_17, undefined, undefined, var_18, &"TRAINER_RESULT_ACCURACY_STATS", undefined, level._id_B204 );
    var_39.alignx = "right";
    level.resulthudelems[level.resulthudelems.size] = var_39;

    if ( level._id_AB08 <= 0 )
    {
        var_31 = undefined;
        var_25 = &"TRAINER_RESULT_TIME_NULL";
        var_26 = undefined;
    }
    else
    {
        var_31 = "bonus";
        var_25 = maps\_utility::settimeformat( level._id_AB08, "-" );
        var_26 = undefined;
    }

    var_40 = maps\_hud_util::_id_C465( var_12, var_17, undefined, undefined, var_18, var_25, var_31, var_26 );
    var_40.alignx = "right";
    level.resulthudelems[level.resulthudelems.size] = var_40;
    var_41 = var_23 - level._id_AB08;
    var_41 += var_30;
    var_41 += var_36;
    var_41 = maps\_utility::rounddecimalplaces( var_41, 2 );

    if ( var_23 > level._id_B222 )
        level._id_C55D = 1;

    if ( var_3 < level._id_B0B5 )
        level._id_B2DD = 1;

    if ( var_2 > level._id_C42B )
        level._id_D016 = 1;

    var_42 = &"TRAINER_RESULT_RECOMMENDEDDIFF";
    var_31 = undefined;

    if ( var_41 > level._id_B222 || level._id_BA64 > 10 || level._id_B2DD == 1 || level._id_D016 == 1 )
    {
        var_42 = &"TRAINER_RESULT_FAILEDCOURSE";
        var_43 = &"TRAINER_RESULT_TRYAGAIN";
        var_31 = "penalty";
        level._id_B78E = level.faileddifficulty;
    }
    else if ( var_41 > level._id_CF37 )
    {
        setdvar( "recommended_gameskill", "0" );
        var_43 = &"TRAINER_RESULT_RECRUIT";
        level._id_B78E = 0;
    }
    else if ( var_41 > level._id_D3D0 )
    {
        setdvar( "recommended_gameskill", "1" );
        var_43 = &"TRAINER_RESULT_REGULAR";
        level._id_B78E = 1;
    }
    else if ( var_41 > level._id_B6B7 )
    {
        setdvar( "recommended_gameskill", "2" );
        var_43 = &"TRAINER_RESULT_HARDENED";
        var_31 = "bonus";
        level._id_B78E = 2;
    }
    else
    {
        setdvar( "recommended_gameskill", "3" );
        var_43 = &"TRAINER_RESULT_VETERAN";
        var_31 = "bonus";
        level._id_B78E = 3;
    }

    if ( var_41 < level.pitbosstime )
        maps\_utility::giveachievement_wrapper( "PIT_BOSS" );

    if ( var_41 < level.studentmastertime )
        maps\_utility::giveachievement_wrapper( "STUDENT_MASTER" );

    var_44 = var_17 + var_16 * 0.5;
    level.hud_separatorlines[0] = newhudelem();
    level.hud_separatorlines[0].x = var_9;
    level.hud_separatorlines[0].y = var_44;
    level.hud_separatorlines[0] setshader( "h2_hud_ssdd_results_line", var_6, 2 );
    level.hud_separatorlines[0].alignx = "right";
    level.hud_separatorlines[0].aligny = "top";
    level.hud_separatorlines[0].sort = 2;
    level.hud_separatorlines[0].foreground = 0;
    level.hud_separatorlines[0].horzalign = "right_adjustable";
    level.hud_separatorlines[0].vertalign = "top_adjustable";
    level.hud_separatorlines[0].alpha = 0.1;
    level.hud_separatorlines[0].hidewheninmenu = 1;
    level.hud_separatorlines[0].hidewhendead = 1;
    var_25 = maps\_utility::settimeformat( var_41 );
    var_26 = undefined;
    var_17 += var_16;
    wait(var_22);
    var_45 = maps\_hud_util::_id_C465( var_10, var_17, undefined, undefined, var_19, &"TRAINER_RESULT_FINALTIME_TEXT" );
    level.resulthudelems[level.resulthudelems.size] = var_45;
    var_46 = maps\_hud_util::_id_C465( var_12, var_17, undefined, undefined, var_20, var_25, var_31, var_26 );
    var_46.alignx = "right";
    var_46 setpulsefx( 30, 900000, 1400 );
    level.resulthudelems[level.resulthudelems.size] = var_46;
    wait(var_22);
    var_47 = level.player getplayerdata( common_scripts\utility::_id_AC0E(), "timeTrialTime" );
    var_48 = int( var_41 * 100 );
    var_49 = var_16;

    if ( level._id_B78E < level.faileddifficulty )
    {
        if ( ( var_48 < var_47 || var_47 == 0 ) && ( !common_scripts\utility::flag( "has_cheated" ) && !_id_C0C3::_id_AD40() ) )
        {
            if ( var_47 > 0 )
            {
                var_17 += ( var_14 + 2 );
                var_50 = maps\_hud_util::_id_C465( var_12, var_17, undefined, undefined, var_18, &"TRAINER_RESULT_NEW_RECORD", "bonus" );
                var_50.alignx = "right";
                var_50 setpulsefx( 30, 900000, 1400 );
                level.resulthudelems[level.resulthudelems.size] = var_50;
                var_49 = var_16 - 6;
            }

            level.player setplayerdata( common_scripts\utility::_id_AC0E(), "timeTrialTime", var_48 );
        }
        else
        {
            var_17 += ( var_14 + 2 );
            var_50 = maps\_hud_util::_id_C465( var_10, var_17, undefined, undefined, var_18, &"TRAINER_RESULT_PERSONALBEST_TEXT" );
            level.resulthudelems[level.resulthudelems.size] = var_50;
            var_25 = maps\_utility::settimeformat( var_47 / 100 );
            var_26 = undefined;
            var_51 = maps\_hud_util::_id_C465( var_12, var_17, undefined, undefined, var_18, var_25, undefined, var_26 );
            var_51.alignx = "right";
            level.resulthudelems[level.resulthudelems.size] = var_51;
        }
    }

    var_44 = var_17 + var_49 * 0.5;
    var_17 += var_49;
    level.hud_separatorlines[1] = newhudelem();
    level.hud_separatorlines[1].x = var_9;
    level.hud_separatorlines[1].y = var_44;
    level.hud_separatorlines[1] setshader( "h2_hud_ssdd_results_line", var_6, 2 );
    level.hud_separatorlines[1].alignx = "right";
    level.hud_separatorlines[1].aligny = "top";
    level.hud_separatorlines[1].sort = 2;
    level.hud_separatorlines[1].foreground = 0;
    level.hud_separatorlines[1].horzalign = "right_adjustable";
    level.hud_separatorlines[1].vertalign = "top_adjustable";
    level.hud_separatorlines[1].alpha = 0.1;
    level.hud_separatorlines[1].hidewheninmenu = 1;
    level.hud_separatorlines[1].hidewhendead = 1;
    var_52 = maps\_hud_util::_id_C465( var_13, var_17, undefined, undefined, var_18, var_42 );
    var_52.alignx = "center";
    level.resulthudelems[level.resulthudelems.size] = var_52;
    var_17 += ( var_14 + 2 );
    var_53 = maps\_hud_util::_id_C465( var_13, var_17, undefined, undefined, var_20, var_43, var_31 );
    var_53.alignx = "center";
    var_53 setpulsefx( 30, 900000, 1400 );
    level.resulthudelems[level.resulthudelems.size] = var_53;
    maps\_utility::delaythread( 180000, ::_id_BCD8 );
    return var_41;
}

_id_B1D3( var_0 )
{
    level.player waittill( var_0 );
    common_scripts\utility::flag_set( var_0 );
}

_id_D03B()
{
    notifyoncommand( "sprinted", "+breath_sprint" );
    notifyoncommand( "sprinted", "+sprint" );
    notifyoncommand( "sprinted", "+sprint_zoom" );
}

_id_C21B( var_0 )
{
    var_1 = undefined;

    if ( common_scripts\utility::flag( "first_pit_run_done" ) )
    {
        switch ( level._id_B78E )
        {
            case 1000:
                var_1 = "end_of_course_try_again";
                break;
            case 0:
                var_2 = randomintrange( 1, 4 );
                var_1 = "end_of_course_easy_0" + var_2;
                break;
            case 1:
                var_2 = randomintrange( 1, 4 );
                var_1 = "end_of_course_reg_0" + var_2;
                break;
            case 2:
                var_2 = randomintrange( 1, 4 );
                var_1 = "end_of_course_hard_0" + var_2;
                break;
            case 3:
                var_2 = randomintrange( 1, 3 );
                var_1 = "end_of_course_vet_0" + var_2;
                break;
        }
    }
    else
    {
        common_scripts\utility::flag_set( "first_pit_run_done" );

        switch ( level._id_B78E )
        {
            case 1000:
                var_1 = "end_of_course_try_again";
                break;
            case 0:
                var_1 = "end_of_course_easy_02";
                break;
            case 1:
                var_1 = "end_of_course_reg_03";
                break;
            case 2:
                var_1 = "end_of_course_hard_03";
                break;
            case 3:
                var_1 = "end_of_course_vet_01";
                break;
        }
    }

    return var_1;
}

check_kill_stats()
{
    self endon( "clear_course" );
    self waittill( "kill_stats_display_huds" );
    _id_BCD8();
}

_id_BCD8()
{
    if ( isdefined( level._id_C356 ) )
        maps\_hud_util::_id_CA49( level._id_C356 );

    if ( isdefined( level.resulthudelems ) )
    {
        foreach ( var_1 in level.resulthudelems )
            var_1 destroy();

        level.resulthudelems = undefined;
    }

    if ( isdefined( level.backers ) )
    {
        foreach ( var_1 in level.backers )
            var_1 destroy();

        level.backers = undefined;
    }

    if ( isdefined( level.hud_separatorlines ) )
    {
        foreach ( var_1 in level.hud_separatorlines )
            var_1 destroy();

        level.hud_separatorlines = undefined;
    }

    if ( isdefined( level.counterbackers ) )
    {
        foreach ( var_1 in level.counterbackers )
            var_1 destroy();

        level.counterbackers = undefined;
    }

    if ( isdefined( level.counterhudelems ) )
    {
        foreach ( var_1 in level.counterhudelems )
            var_1 destroy();

        level.counterhudelems = undefined;
    }

    if ( isdefined( level._id_C293 ) )
        level._id_C293 destroy();

    if ( isdefined( level._id_AB22 ) )
        level._id_AB22 destroy();
}

_id_BC39()
{
    level endon( "kill_sprint_hint" );
    wait 0.5;
    var_0 = _id_C3F6( "sprint2" );
    _id_B682( var_0.hint, 5 );
}

_id_BA0E( var_0 )
{
    _id_BCD8();
    level endon( "kill_timer" );
    level.hudtimerindex = 20;
    level.start_time = gettime();

    if ( level._id_AD70 )
        level thread check_kill_stats();

    thread cqb_timer_think();
    level._id_C356 = maps\_hud_util::get_countdown_hud();
    level._id_C356.text.label = &"TRAINER_YOUR_TIME";
    level._id_C356 settenthstimerup( 0.05 );
    var_1 = 210;
    var_2 = 40;
    var_3 = 14;
    var_4 = -28;
    var_5 = -230;
    var_6 = -35;
    var_7 = 16;
    var_8 = var_3 + 10;
    var_9 = 0.45;
    var_10 = 0.6;
    level.counterhudelems = [];
    level.counterbackers = maps\_hud_util::getstatbackers( var_4, var_3, var_1, var_2, 1 );
    var_11 = maps\_hud_util::_id_C465( var_5, var_8, undefined, undefined, var_9, &"TRAINER_RESULT_ENEMIESHIT_TEXT" );
    level.counterhudelems[level.counterhudelems.size] = var_11;
    level._id_C293 = maps\_hud_util::_id_C465( var_6, var_8, undefined, undefined, var_10, &"TRAINER_RESULT_ENEMIESHIT_VALUE", undefined, level._id_CEFF );
    level._id_C293.alignx = "right";
    var_8 += var_7;
    var_12 = maps\_hud_util::_id_C465( var_5, var_8, undefined, undefined, var_9, &"TRAINER_RESULT_CIVILSHIT_TEXT" );
    level.counterhudelems[level.counterhudelems.size] = var_12;
    level._id_AB22 = maps\_hud_util::_id_C465( var_6, var_8, undefined, undefined, var_10, &"TRAINER_RESULT_CIVILSHIT_VALUE", undefined, level._id_AEA9 );
    level._id_AB22.alignx = "right";
    wait(var_0);
    maps\_hud_util::_id_CA49( level._id_C356 );
    _id_BCD8();
    level thread _id_A831();
}

_id_A831()
{
    level.player endon( "death" );
    level endon( "kill_timer" );
    var_0 = getdvarint( "killhouse_too_slow" );
    setdvar( "killhouse_too_slow", var_0 + 1 );
    level notify( "mission failed" );

    if ( !common_scripts\utility::flag( "player_course_end" ) )
        setdvar( "ui_deadquote", &"TRAINER_SHIP_TOO_SLOW" );
    else
        setdvar( "ui_deadquote", &"TRAINER_SHIP_DIDNT_SPRINT" );

    maps\_utility::missionfailedwrapper();
}

_id_BEF9( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( !isdefined( var_0 ) )
        var_3 = -225;
    else
        var_3 = var_0;

    if ( !isdefined( var_1 ) )
        var_4 = 100;
    else
        var_4 = var_1;

    if ( isdefined( var_2 ) )
        var_5 = newclienthudelem( var_2 );
    else
        var_5 = newhudelem();

    var_5.alignx = "right";
    var_5.aligny = "middle";
    var_5.horzalign = "right";
    var_5.vertalign = "top";
    var_5.x = var_3;
    var_5.y = var_4;
    var_5.fontscale = 1.3;
    var_5.color = ( 0.8, 1.0, 0.8 );
    var_5.font = "objective";
    var_5.glowcolor = ( 0.26, 0.65, 0.32 );
    var_5.glowalpha = 0.2;
    var_5.foreground = 1;
    var_5.hidewheninmenu = 1;
    var_5.hidewhendead = 1;
    return var_5;
}

_id_D418()
{
    wait(randomfloatrange( 0.5, 1.0 ));
}

_id_B64A()
{
    level endon( "end_sequence_starting" );
    level endon( "pit_dialogue_starting" );
    var_0 = getentarray( "conversation_orgs", "targetname" );
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_2[0] = level.scr_sound["conversation_01"];
    var_2[1] = level.scr_sound["conversation_02"];
    var_2[2] = level.scr_sound["conversation_03"];

    if ( common_scripts\utility::cointoss() )
    {
        var_2[0] = level.scr_sound["conversation_03"];
        var_2[1] = level.scr_sound["conversation_02"];
        var_2[2] = level.scr_sound["conversation_01"];
    }

    var_3 = 0;

    for (;;)
    {
        var_4 = var_2[var_3];

        foreach ( var_6 in var_4 )
        {
            var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
            var_1 common_scripts\utility::play_sound_in_space( var_6 );
            _id_D418();
        }

        var_3++;

        if ( var_3 > 2 )
            var_3 = 0;
    }
}

_id_B1C2()
{
    wait(randomfloatrange( 0.1, 1.2 ));
}

_id_B38F()
{
    level endon( "end_sequence_starting" );
    common_scripts\utility::flag_set( "pit_dialogue_starting" );
    var_0 = getentarray( "conversation_orgs_pit", "targetname" );
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar2_masonstime" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar1_deserteagle" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar2_yomamma" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar1_veryfunny" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar2_maxspeed" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar3_triggertime" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar1_onlydelta" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar2_takecareofyourgf" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar2_keatingsays" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar4_headshot" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar4_funnyaccent" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar1_crosstraining" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar4_slowmotion" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar3_thatisgood" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar4_skimask" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar4_weirdman" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar2_twomanteam" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar2_wifewouldfreak" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar4_howdumb" );
    _id_B1C2();
    var_1 = common_scripts\utility::getclosest( level.player.origin, var_0 );
    var_1 common_scripts\utility::play_sound_in_space( "train_ar4_fightanybody" );
    wait 5;
    thread _id_B64A();
}

_id_CDBE( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    var_2 = undefined;

    while ( !common_scripts\utility::flag( "player_done_with_course" ) )
    {
        var_2 = maps\_utility::array_spawn( var_1, 1 );
        maps\_utility::waittill_dead( var_2 );
        waitframe();
    }
}

_id_C8C3()
{
    maps\_utility::gun_remove();
    self.runanim = level.scr_anim["generic"][self.animation];
    self.forceplayfootsteps = 1;
    self.lastgroundtype = "sand";
    thread animscripts\notetracks::donotetracksforever( "drone_anim", "death" );
}

_id_BA48( var_0 )
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( var_0 ) && var_0.size > 0 )
    {
        if ( maps\_utility::is_in_array( var_0, self ) )
            return;
    }

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    if ( !issentient( self ) )
    {

    }

    self delete();
}

_id_C1B0()
{
    level endon( "mission failed" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_in_camp" );

        while ( common_scripts\utility::flag( "player_in_camp" ) )
        {
            level.player common_scripts\utility::waittill_either( "begin_firing", "player_not_in_camp" );

            if ( common_scripts\utility::flag( "player_in_camp" ) )
            {
                wait 0.5;
                _id_BCD8();
                setdvar( "ui_deadquote", &"TRAINER_MISSION_FAIL_FIRE_IN_CAMP" );
                maps\_utility::missionfailedwrapper();
                level notify( "mission failed" );
                continue;
            }

            break;
        }
    }
}

_id_A86F()
{
    while ( !common_scripts\utility::flag( "player_has_started_course" ) )
    {
        common_scripts\utility::flag_wait( "player_in_camp" );
        setsaveddvar( "cg_gundownanimdelaytime", 250 );
        level.player allowfire( 0 );
        level.player disableoffhandweapons( 1 );

        while ( common_scripts\utility::flag( "player_in_camp" ) )
            wait 1;

        setsaveddvar( "cg_gundownanimdelaytime", -1 );
        level.player allowfire( 1 );
        level.player disableoffhandweapons( 0 );
    }

    level.player enableweapons();
}

_id_B01C()
{
    level endon( "mission failed" );
    var_0 = 0;
    var_1 = getentarray( "conversation_orgs", "targetname" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_on_bball_court" );

        while ( common_scripts\utility::flag( "player_on_bball_court" ) )
        {
            wait 2;

            if ( common_scripts\utility::flag( "player_on_bball_court" ) )
            {
                if ( var_0 > 2 )
                    var_0 = 0;

                var_2 = common_scripts\utility::getclosest( level.player.origin, var_1 );
                var_2 common_scripts\utility::play_sound_in_space( level.scr_sound["court_nag_0" + var_0] );
                var_0++;
                wait(randomfloatrange( 8, 12 ));
                continue;
            }

            break;
        }
    }
}

h2_ambient_ai_animation()
{
    thread h2_hide_ai_pit();
    maps\_utility::gun_remove();
    maps\_anim::anim_single_solo( self, self.animation );

    if ( isdefined( self ) )
        thread maps\_anim::anim_loop_solo( self, self.script_noteworthy );
}

h2_on_spawn_scriptedevent()
{
    var_0 = getentarray( "h2_training_triotalking", "targetname" );
    var_1 = getentarray( "h2_training_ai_ambient", "targetname" );
    var_2 = maps\_utility::array_merge( var_0, var_1 );

    foreach ( var_4 in var_2 )
    {
        var_4.animname = "generic";
        var_4 maps\_utility::assign_animtree();
        var_4 maps\_utility::add_spawn_function( ::h2_ambient_ai_animation );
    }
}

h2_pit_intro_animation()
{
    self endon( "death" );
    thread h2_pit_ai_delete();
    var_0 = spawnstruct();
    var_0.origin = ( -3546.0, 1751.26, -60.0 );

    if ( self.script_noteworthy != "soldier01" )
        maps\_utility::gun_remove();

    thread h2_handle_pitanim( var_0 );
    common_scripts\utility::flag_wait( "player_entering_course" );
    var_0 notify( "stop_loop" );
    var_0 thread maps\_anim::anim_loop_solo( self, "h2_training_shepherdwatching_" + self.script_noteworthy + "_loop", "stop_loop" );
    common_scripts\utility::flag_set( "pit_stop_loop" );
    level._id_B416 maps\_utility::waittill_player_lookat( 0.9, undefined, 1, 60 );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::anim_single_solo( self, "h2_training_shepherdwatching_" + self.script_noteworthy + "_forward" );
    var_0 maps\_anim::anim_loop_solo( self, "h2_training_shepherdwatching_" + self.script_noteworthy + "_Endloop" );
}

h2_handle_pitanim( var_0 )
{
    var_0 maps\_anim::anim_single_solo( self, "h2_training_shepherdwatching_" + self.script_noteworthy + "_walk" );

    if ( !common_scripts\utility::flag( "pit_stop_loop" ) )
        var_0 maps\_anim::anim_loop_solo( self, "h2_training_shepherdwatching_" + self.script_noteworthy + "_loop", "stop_loop" );
}

h2_pit_ai_delete()
{
    common_scripts\utility::flag_wait( "player_course_end_03" );
    maps\_utility::stop_magic_bullet_shield();
    self delete();
}

h2_pit_intro()
{
    var_0 = getentarray( "shepherd_intro", "targetname" );
    level._id_B416 = getent( "shepherd", "script_noteworthy" );
    level._id_B416 maps\_utility::add_spawn_function( ::precognitive_paranoia_think );

    foreach ( var_2 in var_0 )
    {
        var_2.animname = "generic";
        var_2 maps\_utility::assign_animtree();
        var_2 maps\_utility::add_spawn_function( ::h2_pit_intro_animation );
    }
}

helicopter_dust_ending()
{
    common_scripts\utility::flag_wait( "player_done_with_course" );
    common_scripts\_exploder::exploder( "bumblebee_damage_oil_trainer" );
    common_scripts\_exploder::exploder( "bumblebee_damage_smoke_trainer" );
    common_scripts\utility::flag_wait( "h2_helicopter_ending_exploder" );
    common_scripts\_exploder::exploder( "heli_dust_large_exploder" );
}

h2_tower01_ambient()
{
    common_scripts\utility::flag_wait( "tower_01" );
    thread maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "f15_takeoff_01" );
}

h2_tower02_ambient()
{
    common_scripts\utility::flag_wait( "tower_02" );
    thread maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "tower02_vehicles" );
}

cqb_timer_setup()
{
    level.digit_array_tenths = cqb_timer_get_planes( "tenths_plane" );
    level.digit_array_seconds = cqb_timer_get_planes( "seconds_plane" );
    level.digit_array_tens_of_seconds = cqb_timer_get_planes_seconds( "tens_of_seconds_plane" );
    level.digit_array_minutes = cqb_timer_get_planes( "minutes_plane" );
    cqb_digit_reset( level.digit_array_seconds );
    cqb_digit_reset( level.digit_array_tenths );
    cqb_digit_reset_seconds( level.digit_array_tens_of_seconds );
    cqb_digit_reset( level.digit_array_minutes );
}

cqb_timer_get_planes( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 <= 9; var_2++ )
        var_1[var_2] = getent( var_0 + "_" + common_scripts\utility::tostring( var_2 ), "targetname" );

    return var_1;
}

cqb_timer_get_planes_seconds( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 <= 5; var_2++ )
        var_1[var_2] = getent( var_0 + "_" + common_scripts\utility::tostring( var_2 ), "targetname" );

    return var_1;
}

cqb_digit_reset( var_0 )
{
    for ( var_1 = 1; var_1 <= 9; var_1++ )
        var_0[var_1] hide();

    var_0[0] show();
}

cqb_digit_reset_seconds( var_0 )
{
    for ( var_1 = 1; var_1 <= 5; var_1++ )
        var_0[var_1] hide();

    var_0[0] show();
}

cqb_timer_think()
{
    level endon( "kill_timer" );
    wait 0.1;
    level.start_time = gettime();
    cqb_digit_reset( level.digit_array_seconds );
    cqb_digit_reset( level.digit_array_tenths );
    cqb_digit_reset_seconds( level.digit_array_tens_of_seconds );
    cqb_digit_reset( level.digit_array_minutes );
    var_0 = 9;
    var_1 = 9;
    var_2 = 9;
    var_3 = 9;

    for (;;)
    {
        var_4 = ( gettime() - level.start_time ) * 0.001;
        var_5 = floor( var_4 );
        var_6 = int( ( var_4 - var_5 ) * 10 );
        var_7 = int( common_scripts\utility::mod( var_5, 10 ) );
        var_8 = int( common_scripts\utility::mod( var_5 * 0.1, 6 ) );
        var_9 = int( floor( var_5 * 0.0168 ) );

        if ( var_6 != var_0 )
        {
            var_0 = var_6;
            cqb_timer_change_digit( var_6, level.digit_array_tenths );
        }

        if ( var_7 != var_1 )
        {
            var_1 = var_7;
            cqb_timer_change_digit( var_7, level.digit_array_seconds );
        }

        if ( var_8 != var_2 )
        {
            var_2 = var_8;
            cqb_timer_change_digit_seconds( var_8, level.digit_array_tens_of_seconds );
        }

        if ( var_9 != var_3 )
        {
            var_3 = var_9;
            cqb_timer_change_digit( var_9, level.digit_array_minutes );
        }

        wait 0.05;
    }
}

cqb_timer_change_digit( var_0, var_1 )
{
    switch ( var_0 )
    {
        case 0:
            var_1[9] hide();
            var_1[0] show();
            break;
        case 1:
            var_1[0] hide();
            var_1[1] show();
            break;
        case 2:
            var_1[1] hide();
            var_1[2] show();
            break;
        case 3:
            var_1[2] hide();
            var_1[3] show();
            break;
        case 4:
            var_1[3] hide();
            var_1[4] show();
            break;
        case 5:
            var_1[4] hide();
            var_1[5] show();
            break;
        case 6:
            var_1[5] hide();
            var_1[6] show();
            break;
        case 7:
            var_1[6] hide();
            var_1[7] show();
            break;
        case 8:
            var_1[7] hide();
            var_1[8] show();
            break;
        case 9:
            var_1[8] hide();
            var_1[9] show();
            break;
    }
}

cqb_timer_change_digit_seconds( var_0, var_1 )
{
    switch ( var_0 )
    {
        case 0:
            var_1[5] hide();
            var_1[0] show();
            break;
        case 1:
            var_1[0] hide();
            var_1[1] show();
            break;
        case 2:
            var_1[1] hide();
            var_1[2] show();
            break;
        case 3:
            var_1[2] hide();
            var_1[3] show();
            break;
        case 4:
            var_1[3] hide();
            var_1[4] show();
            break;
        case 5:
            var_1[4] hide();
            var_1[5] show();
            break;
    }
}

sand_ground_ending_trainer()
{
    common_scripts\utility::flag_wait( "player_exiting_course_00" );
    common_scripts\_exploder::exploder( "sand_ground_ending_trainer" );
}

h2_weapon_inspect_tutorial()
{
    var_0 = getent( "pickup_sidearm", "targetname" );

    while ( !common_scripts\utility::flag( "player_inside_course" ) )
    {
        if ( level.player hasweapon( level._id_D033 ) )
        {
            if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
                _id_CED3( "inspect_weapon" );
            else
                _id_CED3( "inspect_weapon_pc" );

            break;
        }

        waitframe();
    }
}

h2_gate_outro()
{
    var_0 = getentarray( "h2_gate_open", "targetname" );
    var_1 = getentarray( "h2_gate_close", "targetname" );

    foreach ( var_3 in var_0 )
        var_3 maps\_utility::hide_entity();

    common_scripts\utility::flag_wait( "player_done_with_course" );

    foreach ( var_3 in var_0 )
        var_3 show();

    foreach ( var_8 in var_1 )
        var_8 maps\_utility::hide_entity();
}

h2_sniper_ee()
{
    var_0 = getent( "h2_target_01_ee", "targetname" );
    var_1 = getent( "h2_target_02_ee", "targetname" );
    var_2 = getent( "h2_target_03_ee", "targetname" );
    common_scripts\utility::flag_init( "sniper_ee_complete" );
    common_scripts\utility::flag_init( "h2_target_01_ee_dead" );
    common_scripts\utility::flag_init( "h2_target_02_ee_dead" );
    common_scripts\utility::flag_init( "h2_target_03_ee_dead" );
    thread h2_clown_sniper_ee( "h2_sniper_zone_01_ee", var_0 );
    thread h2_clown_sniper_ee( "h2_sniper_zone_02_ee", var_1 );
    thread h2_clown_sniper_ee( "h2_sniper_zone_03_ee", var_2 );
    common_scripts\utility::flag_wait_all( "h2_target_01_ee_dead", "h2_target_02_ee_dead", "h2_target_03_ee_dead" );
    common_scripts\utility::flag_set( "sniper_ee_complete" );
    maps\_utility::giveachievement_wrapper( "CLOWN_IN_TRAINING" );
}

h2_clown_sniper_ee( var_0, var_1 )
{
    var_2 = "barrett";

    while ( !common_scripts\utility::flag( "sniper_ee_complete" ) )
    {
        var_1 hide();
        common_scripts\utility::flag_wait( var_0 );

        if ( level.player hasweapon( var_2 ) )
        {
            thread h2_hide_show_clown( var_0, var_1 );
            var_1 setcandamage( 1 );

            while ( common_scripts\utility::flag( var_0 ) )
            {
                var_1 waittill( "damage", var_3, var_4, var_3, var_3, var_3, var_3, var_3, var_3, var_3, var_5 );

                if ( isplayer( var_4 ) && var_5 == "barrett" )
                {
                    playfx( level._effect["clown_confetti_firework_ee"], var_1.origin );
                    common_scripts\utility::flag_set( var_1.targetname + "_dead" );
                    var_1 thread maps\_utility::play_sound_on_entity( "scn_trainer_clown_hit" );
                    var_1 delete();
                    return;
                }
            }

            waitframe();
        }

        waitframe();
    }
}

h2_hide_show_clown( var_0, var_1 )
{
    var_1 endon( "death" );

    for (;;)
    {
        common_scripts\utility::flag_wait( var_0 );
        var_1 show();
        common_scripts\utility::flag_waitopen( var_0 );
        var_1 hide();
    }
}

h2_shootingrange_tank()
{
    var_0 = getent( "h2_tank_target", "targetname" );

    while ( !common_scripts\utility::flag( "player_entering_course" ) )
    {
        wait(randomfloatrange( 8, 10 ));
        self setturrettargetent( var_0, common_scripts\utility::randomvectorrange( -5, 5 ) );
        self fireweapon();
    }
}

h2_end_collision()
{
    var_0 = getentarray( "h2_end_collision", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 notsolid();

    common_scripts\utility::flag_wait( "player_done_with_course" );

    foreach ( var_2 in var_0 )
        var_2 solid();
}

h2_intro_gundown()
{
    while ( !common_scripts\utility::flag( "training_intro_end_anims" ) )
    {
        if ( common_scripts\utility::flag( "h2_intro_gundown" ) || common_scripts\utility::flag( "h2_intro_gundown2" ) || common_scripts\utility::flag( "h2_intro_gundown3" ) || common_scripts\utility::flag( "h2_intro_gundown4" ) )
            setsaveddvar( "cg_gundownanimdelaytime", 50 );
        else
            setsaveddvar( "cg_gundownanimdelaytime", -1 );

        waitframe();
    }
}
#using_animtree("script_model");

h2_ac130_animation()
{
    var_0 = getent( "h2_ac130", "targetname" );
    var_0.animname = "ac130";
    var_0 maps\_utility::assign_animtree();
    var_1 = spawnstruct();
    var_1.origin = ( -7350.0, -5440.0, 8.0 );
    var_1 maps\_anim::anim_first_frame_solo( var_0, "ac130_intro" );
    var_0 setanim( %h2_training_ac130_intro_rotors );
    common_scripts\utility::flag_wait( "tower_02" );
    var_0 playloopsound( "scn_trainer_tower_ac130_lp" );
    var_1 maps\_anim::anim_single_solo( var_0, "ac130_intro", undefined, undefined, undefined, undefined, 0 );
}

h2_hide_staticdmodelgroup( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) && var_2 )
        _func_31B( var_1 );
    else
        _func_31C( var_1 );

    for (;;)
    {
        common_scripts\utility::flag_wait( var_0 );

        if ( isdefined( var_2 ) && var_2 )
            _func_31C( var_1 );
        else
            _func_31B( var_1 );

        common_scripts\utility::flag_waitopen( var_0 );

        if ( isdefined( var_2 ) && var_2 )
        {
            _func_31B( var_1 );
            continue;
        }

        _func_31C( var_1 );
    }
}

windstock_animations()
{
    var_0 = getentarray( "windstock_animated", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::assign_animtree( "windstock" );
        var_2 thread maps\_anim::anim_loop_solo( var_2, "windstock_animated_fast" );
    }
}

h2_basketball_guys_headswap()
{
    // codescripts\character::setheadmodel( self.script_parameters );
}

h2_pit_ai_animation()
{
    self.animname = "generic";
    _id_B3AB::_id_BEBA( "head", level.player, 2000, 85, 66, 0, 30, 0, 0 );

    if ( self.animation == "oilrig_balcony_smoke_idle" )
    {
        var_0 = spawn( "script_origin", self.origin );
        var_0.angles = self.angles;
        var_0 maps\_anim::anim_loop_solo( self, self.animation );
    }
    else
        maps\_anim::anim_loop_solo( self, self.animation );
}

h2_loddistscale_outro()
{
    common_scripts\utility::flag_wait( "player_done_with_course" );
    setsaveddvar( "r_lodFOVFixedScale", 2 );
}

h2_tessellation_pit()
{
    common_scripts\utility::flag_wait( "player_inside_course" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "displacement" ) )
            maps\_utility::_setsaveddvar( "r_tessellation", 0 );
        else
            maps\_utility::_setsaveddvar( "r_tessellation", 1 );

        waitframe();
    }
}

h2_hide_ai_pit()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "h2_hide_ai_pit" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "h2_hide_ai_pit" ) )
            self hide();

        if ( !common_scripts\utility::flag( "h2_hide_ai_pit" ) )
            self show();

        wait 1;
    }
}

init_scope_fov_setup()
{
    common_scripts\utility::flag_wait( "player_course_stairs2" );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 15 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 0 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.75 );
}

maingun_fx_override()
{
    var_0 = self.model;

    if ( !isdefined( level.vehicle_deckdust[var_0] ) )
        return;

    self endon( "death" );

    for (;;)
    {
        self waittill( "weapon_fired" );

        if ( distancesquared( level.player.origin, self.origin ) > 1690000 )
            continue;

        playfxontag( level._effect["abrams_deck_dust_trainer"], self, "tag_engine_exhaust" );
        var_1 = self gettagorigin( "tag_flash" );
        var_2 = physicstrace( var_1, var_1 + ( 0.0, 0.0, -128.0 ) );
        physicsexplosionsphere( var_2, 192, 100, 1 );
    }
}

h2_force_body_for_trainees()
{
    switch ( self.animation )
    {
        case "training_intro_soldier1":
            self setmodel( "body_ally_arab_trn_assault_a" );
            break;
        case "training_intro_soldier2":
            self setmodel( "body_ally_arab_trn_smg_a" );
            break;
        case "training_intro_soldier3":
            self setmodel( "body_ally_arab_trn_smg_a" );
            break;
        case "training_intro_soldier4":
            self setmodel( "body_ally_arab_trn_assault_a" );
            break;
        case "training_intro_soldier6":
            self setmodel( "body_ally_arab_trn_smg_a" );
            break;
        case "training_intro_soldier7":
            self setmodel( "body_ally_arab_trn_assault_a" );
            break;
    }
}
