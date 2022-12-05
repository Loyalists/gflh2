// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_CF65();
    _id_B2F9();
    _id_BFCC();
    _id_C1F9();
    _id_D47C();
    _id_B531();
    _id_C8F4();
    _id_BAF7();
    thread _id_D082();
}
#using_animtree("generic_human");

_id_CF65()
{
    level.scr_anim["operator"]["pulldown"] = %h2_gulag_slamraam_tarp_pull_guy2;
    level.scr_anim["operator"]["idle"][0] = %h2_gulag_slamraam_tarp_idle_guy2;
    level.scr_anim["puller"]["pulldown"] = %h2_gulag_slamraam_tarp_pull_guy1;
    level.scr_anim["soap"]["rappel_start"] = %h2_gulag_rappel_soap;
    level.scr_anim["pilot"]["idle"][0] = %f15_pilot_idle;
    level.scr_animtree["pilot"] = #animtree;
    level.scr_anim["generic"]["sewer_slide_1"] = %h2_gulag_sewer_slide_guy1;
    level.scr_anim["generic"]["sewer_slide_2"] = %h2_gulag_sewer_slide_guy2;
    level.scr_anim["generic"]["sewer_slide_soap"] = %h2_gulag_sewer_slide_soap;
    var_0 = [ "sewer_slide_1", "sewer_slide_2", "sewer_slide_soap" ];

    foreach ( var_2 in var_0 )
    {
        maps\_anim::addnotetrack_customfunction( "generic", "slide_start", ::_id_D30D, var_2 );
        maps\_anim::addnotetrack_customfunction( "generic", "slide_land", ::_id_D00B, var_2 );
        maps\_anim::addnotetrack_customfunction( "generic", "slide_land_deep", ::_id_AF4E, var_2 );
        maps\_anim::addnotetrack_customfunction( "generic", "slide_end", ::_id_D562, var_2 );
    }

    level.scr_anim["generic"]["breach_stackL_approach"] = %breach_stackl_approach;
    level.scr_anim["generic"]["death_explosion_stand_B_v3"] = %death_explosion_stand_b_v3;
    level.scr_anim["generic"]["react_stand_2_run_R45"] = %react_stand_2_run_r45;
    level.scr_anim["generic"]["execution_fightback_guy1_03"] = %execution_fightback_guy1_03;
    level.scr_anim["generic"]["execution_fightback_guy2_03"] = %execution_fightback_guy2_03;
    level.scr_anim["generic"]["execution_fightback_guy2_03_survives"] = %execution_fightback_guy2_03_survives;
    level.scr_anim["generic"]["execution_fightback_guy2_03_death"] = %execution_fightback_guy2_03_death;
    level.scr_anim["generic"]["h2_gulag_breachwall_enemy1"] = %h2_gulag_breachwall_enemy1;
    level.scr_anim["generic"]["h2_gulag_breachwall_enemy2"] = %h2_gulag_breachwall_enemy2;
    level.scr_anim["ghost"]["laptop_approach"] = %h2_gulag_controlroom_ghost_in;
    level.scr_anim["ghost"]["hacking_vo1"] = %h2_gulag_controlroom_ghost_patchedin;
    level.scr_anim["ghost"]["hacking_vo2"] = %h2_gulag_controlroom_ghost_negative;
    level.scr_anim["ghost"]["hacking_vo3"] = %h2_gulag_controlroom_ghost_ancienthardware;
    level.scr_anim["ghost"]["hacking_vo4"] = %h2_gulag_controlroom_ghost_roger;
    level.scr_anim["ghost"]["hacking_vo5"] = %h2_gulag_controlroom_ghost_gotit;
    level.scr_anim["ghost"]["laptop_idle_0"] = %h2_gulag_controlroom_ghost_angry;
    level.scr_anim["ghost"]["laptop_idle_1"] = %h2_gulag_controlroom_ghost_backspace;
    level.scr_anim["ghost"]["laptop_idle_2"] = %h2_gulag_controlroom_ghost_calculating;
    level.scr_anim["ghost"]["laptop_idle_3"] = %h2_gulag_controlroom_ghost_cantunderstand;
    level.scr_anim["ghost"]["laptop_idle_4"] = %h2_gulag_controlroom_ghost_crackfingers;
    level.scr_anim["ghost"]["laptop_idle_5"] = %h2_gulag_controlroom_ghost_lookaround;
    level.scr_anim["ghost"]["laptop_idle_6"] = %h2_gulag_controlroom_ghost_loop_typing;
    level.scr_anim["generic"]["grenade_throw"] = %corner_standr_grenade_b;
    maps\_anim::addnotetrack_customfunction( "generic", "grenade_right", ::_id_B722, "grenade_throw" );
    maps\_anim::addnotetrack_customfunction( "generic", "grenade_throw", ::_id_B2AB, "grenade_throw" );
    level.scr_anim["guy"]["explosion"] = %death_explosion_run_f_v1;
    level.scr_anim["ghost"]["voiceover"] = %h2_gulag_armory_ghost_voiceover;
    level.scr_anim["generic"]["armory_jumpdown"] = %h2_gulag_armory_guy1_dropdown;
    level.scr_anim["generic"]["armory_wait_in"] = %h2_gulag_armory_guy1_wait;
    level.scr_anim["generic"]["armory_wait_idle"][0] = %h2_gulag_armory_guy1_waitidle;
    level.scr_anim["generic"]["armory_wait_out"] = %h2_gulag_armory_guy1_wait2enter;
    level.scr_anim["soap"]["armory_jumpdown"] = %h2_gulag_armory_soap_dropdown;
    level.scr_anim["soap"]["armory_wait_in"] = %h2_gulag_armory_soap_wait;
    level.scr_anim["soap"]["armory_wait_idle"][0] = %h2_gulag_armory_soap_waitidle;
    level.scr_anim["soap"]["armory_wait_out"] = %h2_gulag_armory_soap_wait2enter;
    level.scr_anim["soap"]["riotshield"] = %h2_gulag_armory_soap_grabriotshield;
    level.scr_anim["generic"]["riotshield_pickup"] = %h2_gulag_armory_guy_grabriotshield;
    level.scr_goaltime["soap"]["riotshield"] = 0.8;
    maps\_anim::addnotetrack_customfunction( "soap", "grab_gun", ::_id_C98E, "armory_wait_out" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "armory_wait_out", "gulag_cmt_seeanything" );
    maps\_anim::_id_C4AE( "ghost", "dialog", "voiceover", "gulag_gst_badnews" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "armory_wait_out", "gulag_cmt_hearcoming" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "armory_wait_out", "gulag_cmt_opendoor" );
    maps\_anim::_id_C4AE( "ghost", "dialog", "voiceover", "gulag_gst_runabypass" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "armory_wait_out", "gulag_cmt_toolate" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "riotshield", "gulag_cmt_morecover" );
    maps\_anim::addnotetrack_notify( "soap", "door_open", "door_open", "armory_wait_out" );
    maps\_anim::addnotetrack_notify( "soap", "wave1_start", "wave1_start", "armory_wait_out" );
    maps\_anim::addnotetrack_notify( "soap", "dialog", "shield_dialog", "riotshield" );
    level.scr_anim["soap"]["securitydoor_soap_enter"] = %h2_gulag_securitydoor_soap_enter;
    level.scr_anim["generic"]["hide_2_stand"] = %covercrouch_hide_2_stand;
    level.scr_anim["generic"]["ai_running_wall_01"] = %h2_gulag_runningsoldier1_run1;
    level.scr_anim["generic"]["ai_running_wall_02"] = %h2_gulag_runningsoldier2_run1;
    level.scr_anim["generic"]["ai_running_wall_11"] = %h2_gulag_runningsoldier1_run2;
    level.scr_anim["generic"]["ai_running_wall_12"] = %h2_gulag_runningsoldier2_run2;
    level.scr_anim["generic"]["ai_running_wall_21"] = %h2_gulag_runningsoldier1_run3;
    level.scr_anim["generic"]["ai_running_wall_22"] = %h2_gulag_runningsoldier2_run3;
    level.scr_anim["generic"]["ai_running_wall_31"] = %h2_gulag_runningsoldier1_run4;
    level.scr_anim["generic"]["ai_running_wall_32"] = %h2_gulag_runningsoldier2_run4;
    level.scr_anim["soap"]["soap_intro_start"] = %h2_gulag_intro_soap;
    level.scr_anim["soap"]["soap_intro_1st_tower"][0] = %h2_gulag_intro_soap_1sttower;
    level.scr_anim["soap"]["soap_intro_2nd_tower"][0] = %h2_gulag_intro_soap_2ndtower;
    level.scr_anim["soap"]["soap_intro_dialog1"] = %h2_gulag_intro_soap_dialogue1;
    level.scr_anim["soap"]["soap_intro_dialog2"] = %h2_gulag_intro_soap_dialogue2;
    level.scr_anim["soap"]["soap_intro_sniping"] = %h2_gulag_intro_soap_sniping_add;
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "soap_intro_start", "gulag_rpt_30sec" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_start", "gulag_hrp1_angelsone" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_start", "gulag_lbp1_gogetem" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_start", "gulag_fp1_goodtone" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_start", "gulag_fp2_goodkill" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_start", "gulag_fp1_niceday" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_start", "gulag_lbp1_copies" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_start", "gulag_lbp2_copiesall" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_start", "gulag_lbp3_solidcopy" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "soap_intro_start", "gulag_rpt_stbyengage" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "soap_intro_start", "gulag_rpt_stabilize" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "soap_intro_start", "gulag_rpt_clearedengage" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "soap_intro_dialog1", "gulag_rpt_shiftright" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_dialog1", "gulag_lbp1_shifting" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "soap_intro_dialog1", "gulag_rpt_stabilize2" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_dialog1", "gulag_lbp1_ready" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_dialog1", "gulag_wrm_ontarget" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "soap_intro_dialog2", "gulag_rpt_shiftright2" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_dialog2", "gulag_lbp1_shifting2" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "soap_intro_dialog2", "gulag_cmt_seehostiles" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_dialog2", "gulag_lbp1_hangon" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "soap_intro_dialog2", "gulag_rpt_tooclose" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_dialog2", "gulag_hqr_moretime" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_dialog2", "gulag_gst_yanks1" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_dialog2", "gulag_rpt_cutchatter" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_dialog2", "gulag_lbp1_2ndwave" );
    maps\_anim::_id_C4AE( "soap", "dialog", "soap_intro_dialog2", "gulag_lbp1_10ft" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "soap_intro_dialog2", "gulag_rpt_gogogo" );
    level.scr_anim["gunner"]["fire_a"] = %h2_gulag_zpu_gunner_fire_a;
    level.scr_anim["gunner"]["fire_b"] = %h2_gulag_zpu_gunner_fire_b;
    level.scr_anim["gunner"]["gunnerdeath"] = %zpu_gunner_deathslouch;
    level.scr_anim["gunner"]["death_idle"][0] = %zpu_gunner_deathslouchidle;
    maps\_anim::addnotetrack_startfxontag( "breach_door_charge", "play_redlight", "breach_price", "redlight_charge_breach_gulag", "j_frame_charge" );
    maps\_anim::addnotetrack_startfxontag( "breach_door_charge", "play_redlight", "breach_price2", "redlight_charge_breach_gulag", "j_frame_charge" );
    maps\_anim::addnotetrack_stopfxontag( "breach_door_charge", "stop_redlight", "breach_price", "redlight_charge_breach_gulag", "j_frame_charge" );
    maps\_anim::addnotetrack_stopfxontag( "breach_door_charge", "stop_redlight", "breach_price2", "redlight_charge_breach_gulag", "j_frame_charge" );
    maps\_anim::addnotetrack_startfxontag( "breach_door_charge", "play_greenlight", "breach_price", "greenlight_charge_breach_gulag", "j_frame_charge" );
    maps\_anim::addnotetrack_startfxontag( "breach_door_charge", "play_greenlight", "breach_price2", "greenlight_charge_breach_gulag", "j_frame_charge" );
}

_id_D082()
{
    waittillframeend;
    maps\_anim::addonstart_animsound( "me_transmitting_tower", "radiotower_fall", "scn_gulag_tower_antenna" );
    maps\_anim::addonstart_animsound( "generic", "armory_jumpdown", "scn_guy_armory_jumpdown" );
    maps\_anim::addonstart_animsound( "soap", "armory_jumpdown", "scn_soap_armory_jumpdown" );
    maps\_anim::addonstart_animsound( "generic", "rappel_start", "scn_gulag_rappel_npc_01" );
    maps\_anim::addonstart_animsound( "generic", "sewer_slide_1", "scn_gulag_npc_sewer_slide_01" );
    maps\_anim::addonstart_animsound( "generic", "sewer_slide_2", "scn_gulag_npc_sewer_slide_02" );
    maps\_anim::addonstart_animsound( "generic", "sewer_slide_soap", "scn_gulag_npc_sewer_slide_soap" );
    maps\_anim::addonstart_animsound( "h2_active_breacher_rig", "breach_inspect", "scn_gulag_breach_bathroom_player" );
    maps\_anim::addonstart_animsound( "h2_active_breacher_rig", "breach_price", "scn_gulag_breach_rescue_player" );
    maps\_anim::addnotetrack_customfunction( "player_rappel", "scn_gulag_intro_player_dismount", ::_id_A9DA, "player_dismount_start" );
}

_id_B722( var_0 )
{
    var_0._id_D30E = spawn( "script_model", var_0 gettagorigin( "tag_inhand" ) );
    var_1 = getweaponmodel( var_0.grenadeweapon );
    var_0._id_D30E setmodel( var_1 );
    var_0._id_D30E linkto( var_0, "tag_inhand", ( 0.0, 0.0, 3.0 ), ( 0.0, 0.0, 0.0 ) );
}

_id_B2AB( var_0 )
{
    var_1 = var_0._id_D30E.origin;
    var_0._id_D30E delete();
    var_0._id_D30E = undefined;
    var_2 = common_scripts\utility::getstruct( "flash_org", "targetname" );
    var_3 = common_scripts\utility::getstruct( var_2.target, "targetname" );
    var_4 = var_3.origin;
    var_5 = var_0 magicgrenade( var_1, var_4, 0.9 );
    var_0.a.nextgrenadetrytime = gettime() + 5000;
    wait 1.0;
    level notify( "flashed_room" );
}

_id_C022( var_0 )
{
    if ( common_scripts\utility::flag( "dont_flash_me_pls" ) )
        var_0 delete();
    else
    {
        common_scripts\utility::wait_for_flag_or_time_elapses( "dont_flash_me_pls", 1 );

        if ( common_scripts\utility::flag( "dont_flash_me_pls" ) )
            var_0 delete();
    }
}

_id_D30D( var_0, var_1 )
{
    var_2 = "water_slide";
    var_3 = 0.0;

    if ( isdefined( var_1 ) )
    {
        var_2 = var_1[0];

        if ( isdefined( var_1[1] ) )
        {
            var_3 = var_1[1];
            thread player_slide_end_fx( var_0 );
        }
    }

    var_4 = common_scripts\utility::getfx( var_2 );
    var_0 endon( "stop_slide_fx" );
    var_0 endon( "death" );

    if ( var_3 > 0.0 )
        wait(var_3);

    for (;;)
    {
        playfxontag( var_4, var_0, "tag_origin" );
        wait 0.03;
    }
}

player_slide_end_fx( var_0 )
{
    common_scripts\utility::flag_wait( "player_fx_slide_end" );
    var_0 notify( "stop_slide_fx" );
}

_id_D562( var_0 )
{
    var_0 notify( "stop_slide_fx" );
}

_id_D00B( var_0, var_1 )
{
    if ( !isdefined( var_0._id_BF1F ) )
    {
        var_2 = var_0 _id_A8F9();
        var_0._id_BF1F = 1;
        var_0 playsound( "scn_gulag_sewer_slide_friend" + var_2 );
    }

    if ( isdefined( var_1 ) )
        var_3 = common_scripts\utility::getfx( var_1 );
    else
        var_3 = common_scripts\utility::getfx( "water_slide_start" );

    playfxontag( var_3, var_0, "tag_origin" );
}

_id_AF4E( var_0, var_1 )
{
    if ( !isdefined( var_0._id_AD32 ) )
    {
        var_2 = var_0 _id_A8F9();
        var_0._id_AD32 = 1;
        var_0 playsound( "scn_gulag_sewer_splash_friend" + var_2 );
    }

    if ( isdefined( var_1 ) )
        var_3 = common_scripts\utility::getfx( var_1 );
    else
        var_3 = common_scripts\utility::getfx( "water_slide_splash" );

    playfxontag( var_3, var_0, "tag_origin" );
}

_id_A8F9()
{
    var_0 = getaiarray( "allies" );
    var_1 = 0;

    foreach ( var_4, var_3 in var_0 )
    {
        if ( var_3 == self )
        {
            var_1 = var_4;
            break;
        }
    }

    var_1 %= 3;
    var_1++;
    return var_1;
}
#using_animtree("script_model");

_id_BFCC()
{
    level.scr_animtree["tarp"] = #animtree;
    level.scr_anim["tarp"]["pulldown"] = %h2_gulag_slamraam_tarp_simulation;
    level.scr_goaltime["tarp"]["pulldown"] = 0.5;
    level.scr_anim["tarp"]["idle"][0] = %h2_gulag_slamraam_tarp_idle_sim;
    level.scr_model["tarp"] = "slamraam_tarp";
    level.scr_animtree["ai_rope"] = #animtree;
    level.scr_model["ai_rope"] = "h2_gulag_rappel_rope_player_60ft_standard";
    level.scr_anim["ai_rope"]["rappel_start"] = %h2_gulag_rappelrope_soap_60ft;
    maps\_anim::addnotetrack_customfunction( "ai_rope", "scn_gulag_rappel_soap_rope", maps\gulag_aud::_id_CADC );
    level.scr_animtree["rappel_obj"] = #animtree;
    level.scr_model["rappel_obj"] = "h2_gulag_rappel_kicked_part_01";
    level.scr_anim["rappel_obj"]["rappel_start"] = %h2_gulag_rappel_kicked_part;
    maps\_anim::addnotetrack_customfunction( "rappel_obj", "scn_gulag_rappel_metal_plate", maps\gulag_aud::_id_CDD6 );
    level.scr_animtree["player_rope"] = #animtree;
    level.scr_model["player_rope"] = "h2_gulag_rappel_rope_player_60ft_standard";
    level.scr_anim["player_rope"]["rappel_start"] = %h2_gulag_rappelrope_player_60ft;
    level.scr_animtree["player_rope_obj"] = #animtree;
    level.scr_model["player_rope_obj"] = "h2_gulag_rappel_rope_player_60ft";
    level.scr_anim["player_rope_obj"]["rappel_start"] = %h2_gulag_rappelrope_player_60ft;
    level.scr_animtree["folding_chair"] = #animtree;
    level.scr_model["folding_chair"] = "com_folding_chair";
    level.scr_anim["folding_chair"]["laptop_approach"] = %h2_gulag_controlroom_chair_in;
    level.scr_animtree["strangle_chain"] = #animtree;
    level.scr_model["strangle_chain"] = "price_strangle_chain";
    level.scr_anim["strangle_chain"]["price_breach"] = %h2_gulag_rescuea_chain;
    level.scr_anim["strangle_chain"]["price_rescue"] = %h2_gulag_rescueb_chain;
    level.scr_animtree["hanging_light"] = #animtree;
    level.scr_model["hanging_light"] = "h2_gulag_hanging_light";
    level.scr_anim["hanging_light"]["hanging_light_loop"][0] = %h2_gulag_hanging_light_idle;
    level.scr_anim["hanging_light"]["hanging_light_loop_cafeteria"][0] = %h2_gulag_hanging_light_shorter_idle;
    level.scr_anim["hanging_light"]["hanging_light_explosion_a"] = %h2_gulag_hanging_light_explosion_a;
    level.scr_anim["hanging_light"]["hanging_light_explosion_b"] = %h2_gulag_hanging_light_explosion_b;
    level.scr_anim["hanging_light"]["hanging_light_explosion_c"] = %h2_gulag_hanging_light_explosion_c;
    level.scr_anim["hanging_light"]["hanging_light_impact_1"] = %h2_gulag_hanging_light_hit_02;
    level.scr_anim["hanging_light"]["hanging_light_impact_2"] = %h2_gulag_hanging_light_hit_04;
    level.scr_anim["hanging_light"]["hanging_light_impact_3"] = %h2_gulag_hanging_light_hit_06;
    level.scr_anim["hanging_light"]["hanging_light_impact_4"] = %h2_gulag_hanging_light_hit_08;
    level.scr_goaltime["hanging_light"]["hanging_light_impact_1"] = 0.05;
    level.scr_goaltime["hanging_light"]["hanging_light_impact_2"] = 0.05;
    level.scr_goaltime["hanging_light"]["hanging_light_impact_3"] = 0.05;
    level.scr_goaltime["hanging_light"]["hanging_light_impact_4"] = 0.05;
    level.scr_animtree["rat_animations"] = #animtree;
    level.scr_model["rat_animations"] = "rat";
    level.scr_anim["rat_animations"]["frantic_idle"][0] = %h1_mp_rat_frantic_idle;
    level.scr_anim["rat_animations"]["run"][0] = %h1_mp_rat_run_01;
    level.scr_anim["rat_animations"]["death_02"] = %h1_mp_rat_death_02;
    level.scr_anim["rat_animations"]["death_03"] = %h1_mp_rat_death_03;
    level.scr_animtree["me_transmitting_tower"] = #animtree;
    level.scr_anim["me_transmitting_tower"]["radiotower_fall"] = %h2_gulag_introride_radiotower_fall;
    maps\_anim::addnotetrack_customfunction( "me_transmitting_tower", "fx_light_flicker", ::_id_B014 );
    maps\_anim::addnotetrack_customfunction( "me_transmitting_tower", "fx_sparks", ::_id_B650 );
    maps\_anim::addnotetrack_customfunction( "me_transmitting_tower", "fx_fall_impact", ::_id_AE1A );
    level.scr_animtree["h2_chains_01_animated"] = #animtree;
    level.scr_model["h2_chains_01_animated"] = "h2_chains_01_animated";
    level.scr_anim["h2_chains_01_animated"]["idle"][0] = %h2_gulag_chains_01;
    level.scr_anim["h2_chains_01_animated"]["breach"] = %h2_gulag_chains_01_hit;
    level.scr_animtree["h2_chains_02_animated"] = #animtree;
    level.scr_model["h2_chains_02_animated"] = "h2_chains_02_animated";
    level.scr_anim["h2_chains_02_animated"]["idle"][0] = %h2_gulag_chains_02;
    level.scr_anim["h2_chains_02_animated"]["breach"] = %h2_gulag_chains_02_hit;
    level.scr_animtree["h2_chains_03_animated"] = #animtree;
    level.scr_model["h2_chains_03_animated"] = "h2_chains_03_animated";
    level.scr_anim["h2_chains_03_animated"]["idle"][0] = %h2_gulag_chains_03;
    level.scr_anim["h2_chains_03_animated"]["breach"] = %h2_gulag_chains_03_hit;
    level.scr_animtree["h2_chains_04_animated"] = #animtree;
    level.scr_model["h2_chains_04_animated"] = "h2_chains_04_animated";
    level.scr_anim["h2_chains_04_animated"]["idle"][0] = %h2_gulag_chains_04;
    level.scr_anim["h2_chains_04_animated"]["breach"] = %h2_gulag_chains_04_hit;
    level.scr_animtree["h2_chains_05_animated"] = #animtree;
    level.scr_model["h2_chains_05_animated"] = "h2_chains_05_animated";
    level.scr_anim["h2_chains_05_animated"]["idle"][0] = %h2_gulag_chains_05;
    level.scr_anim["h2_chains_05_animated"]["idle_strong"][0] = %h2_gulag_chains_05_escape;
    level.scr_anim["h2_chains_05_animated"]["breach"] = %h2_gulag_chains_05_hit;
    level.scr_animtree["h2_chains_06_animated"] = #animtree;
    level.scr_model["h2_chains_06_animated"] = "h2_chains_06_animated";
    level.scr_anim["h2_chains_06_animated"]["idle"][0] = %h2_gulag_chains_06;
    level.scr_anim["h2_chains_06_animated"]["idle_strong"][0] = %h2_gulag_chains_06_escape;
    level.scr_anim["h2_chains_06_animated"]["breach"] = %h2_gulag_chains_06_hit;
    level.scr_animtree["h2_chains_07_animated"] = #animtree;
    level.scr_model["h2_chains_07_animated"] = "h2_chains_07_animated";
    level.scr_anim["h2_chains_07_animated"]["idle"][0] = %h2_gulag_chains_07;
    level.scr_anim["h2_chains_07_animated"]["idle_strong"][0] = %h2_gulag_chains_07_escape;
    level.scr_anim["h2_chains_07_animated"]["breach"] = %h2_gulag_chains_07_hit;
    level.scr_animtree["h2_chains_08_animated"] = #animtree;
    level.scr_model["h2_chains_08_animated"] = "h2_chains_08_animated";
    level.scr_anim["h2_chains_08_animated"]["idle"][0] = %h2_gulag_chains_08;
    level.scr_anim["h2_chains_08_animated"]["idle_strong"][0] = %h2_gulag_chains_08_escape;
    level.scr_anim["h2_chains_08_animated"]["breach"] = %h2_gulag_chains_08_hit;
    level.scr_animtree["h2_chains_09_animated"] = #animtree;
    level.scr_model["h2_chains_09_animated"] = "h2_chains_09_animated";
    level.scr_anim["h2_chains_09_animated"]["idle"][0] = %h2_gulag_chains_09;
    level.scr_anim["h2_chains_09_animated"]["idle_strong"][0] = %h2_gulag_chains_09_escape;
    level.scr_anim["h2_chains_09_animated"]["breach"] = %h2_gulag_chains_09_hit;
    level.scr_animtree["h2_chains_alone_03_animated"] = #animtree;
    level.scr_model["h2_chains_alone_03_animated"] = "h2_chains_alone_03_animated";
    level.scr_anim["h2_chains_alone_03_animated"]["idle"][0] = %h2_chains_03_alone_animated;
    level.scr_animtree["h2_chains_02_without_attach_animated"] = #animtree;
    level.scr_model["h2_chains_02_without_attach_animated"] = "h2_chains_02_without_attach_animated";
    level.scr_anim["h2_chains_02_without_attach_animated"]["idle"][0] = %h2_gulag_hanging_chains_03;
    level.scr_animtree["h2_cs_chain_accessories_hanging_straight_short_01"] = #animtree;
    level.scr_model["h2_cs_chain_accessories_hanging_straight_short_01"] = "h2_cs_chain_accessories_hanging_straight_short_01";
    level.scr_anim["h2_cs_chain_accessories_hanging_straight_short_01"]["idle"][0] = %h2_gulag_hanging_chains_02;
    level.scr_animtree["h2_cs_chain_accessories_hanging_loop_long"] = #animtree;
    level.scr_model["h2_cs_chain_accessories_hanging_loop_long"] = "h2_cs_chain_accessories_hanging_loop_long";
    level.scr_anim["h2_cs_chain_accessories_hanging_loop_long"]["idle"][0] = %h2_gulag_hanging_chains_01;
    level.scr_animtree["landslide_iceberg"] = #animtree;
    level.scr_anim["landslide_iceberg"]["move"] = %h2_landslide_icebergs_animated;
    level.scr_animtree["shield"] = #animtree;
    level.scr_anim["shield"]["shield"] = %h2_gulag_armory_riotshield_full;
    level.scr_anim["shield"]["guy_shield"] = %h2_gulag_armory_guy_riotshield_full;
    level.scr_animtree["sandbag"] = #animtree;
    level.scr_anim["sandbag"]["destruction"] = %h2_gulag_littlebird_break_sandbag;
}
#using_animtree("player");

_id_D47C()
{
    level.scr_animtree["player_rappel"] = #animtree;
    level.scr_model["player_rappel"] = "h2_gfl_st_ar15_viewbody";
    level.scr_anim["player_rappel"]["rappel_start"] = %h2_gulag_rappel_player;
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_st_ar15_viewbody";
    level.scr_anim["worldbody"]["slide_in"] = %h2_gulag_sewer_slide_player_in;
    level.scr_anim["worldbody"]["slide_loop"][0] = %h2_gulag_sewer_slide_player_idle;
    level.scr_anim["worldbody"]["slide_out"] = %h2_gulag_sewer_slide_player_out;
    level.scr_anim["worldbody"]["slide_ar"] = %h2_gulag_sewer_slide_player_turnr;
    level.scr_anim["worldbody"]["slide_al"] = %h2_gulag_sewer_slide_player_turnl;
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_start", ::_id_D30D, "slide_in", [ "water_slide_player", 0.25 ] );
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_land", ::_id_D00B, "slide_out", "water_slide_splash_player" );
    level.scr_anim["player_rappel"]["player_intro_start"] = %h2_gulag_intro_player;
    level.scr_anim["player_rappel"]["player_dismount_start"] = %h2_gulag_intro_player_dismount;
    level.scr_anim["player_rappel"]["player_shoot_start"] = %h2_gulag_intro_player_shoot;
    level.scr_anim["worldbody"]["explosion_front"] = %h2_gulag_cellexplosion_player_front;
    level.scr_anim["worldbody"]["explosion_back"] = %h2_gulag_cellexplosion_player_back;
    level.scr_anim["worldbody"]["explosion_right"] = %h2_gulag_cellexplosion_player_right;
    level.scr_anim["worldbody"]["explosion_left"] = %h2_gulag_cellexplosion_player_left;
}
#using_animtree("vehicles");

_id_C1F9()
{
    level._id_C212 = [];
    level._id_C212["x_right"] = %rotate_body_x_r;
    level.scr_animtree["f15"] = #animtree;
    level.scr_model["f15"] = "vehicle_f15";
    level.scr_animtree["f15"] = #animtree;
    level.scr_model["f15"] = "vehicle_f15";
    level.scr_anim["f15"]["intro_1"] = %h2_gulag_f15_intro_1;
    level.scr_anim["f15"]["landing_gear"] = %mig_landing_gear_up;
    level.scr_anim["f15"]["intro_2"] = %h2_gulag_f15_intro_2;
    maps\_anim::addnotetrack_customfunction( "f15", "explode", ::_id_AD6C );
    level.scr_animtree["intro_1_missile"] = #animtree;
    level.scr_model["intro_1_missile"] = "vehicle_f15_missile";
    level.scr_anim["intro_1_missile"]["missile_fire_a"] = %gulag_missile_f15_1_a;
    level.scr_animtree["intro_1_missile"] = #animtree;
    level.scr_model["intro_1_missile"] = "vehicle_f15_missile";
    level.scr_anim["intro_1_missile"]["missile_fire_b"] = %gulag_missile_f15_1_b;
    level.scr_animtree["intro_2_missile"] = #animtree;
    level.scr_model["intro_2_missile"] = "vehicle_f15_missile";
    level.scr_anim["intro_2_missile"]["missile_fire_a"] = %gulag_missile_f15_2_a;
    level.scr_animtree["intro_2_missile"] = #animtree;
    level.scr_model["intro_2_missile"] = "vehicle_f15_missile";
    level.scr_anim["intro_2_missile"]["missile_fire_b"] = %gulag_missile_f15_2_b;
    maps\_anim::addnotetrack_customfunction( "f15", "missile", ::_id_B4DF );
    maps\_anim::addnotetrack_customfunction( "f15", "missile_fx", ::_id_CC44 );
    maps\_anim::addnotetrack_customfunction( "f15", "afterburner", ::_id_D36D );
    level.scr_animtree["littlebird"] = #animtree;
    level.scr_anim["littlebird"]["spawn"][0] = %h2_gulag_intro_littlebird_shooter;
    level.scr_anim["littlebird"]["spawn"][1] = %h2_gulag_intro_littlebird_soldier01;
    level.scr_anim["littlebird"]["spawn"][2] = %h2_gulag_intro_littlebird_soldier02;
    level.scr_anim["littlebird"]["respawn"][0] = %h2_gulag_landing_helicopter_front;
    level.scr_anim["littlebird"]["respawn"][1] = %h2_gulag_landing_helicopter_solo;
    level.scr_anim["littlebird"]["respawn"][2] = %h2_gulag_landing_helicopter_back;
    level.scr_anim["littlebird"]["bhd_spawner_additive"] = %h2_gulag_landing_helicopter_gattlingattack;
    level.scr_anim["littlebird"]["player_additive"] = %h2_gulag_intro_littlebird_player;
    level.scr_animtree["turret"] = #animtree;
    level.scr_model["turret"] = "h1_vehicle_zpu4_nowheels";
    level.scr_anim["turret"]["fire_a"] = %h2_gulag_zpu_gun_fire_a;
    level.scr_anim["turret"]["fire_b"] = %h2_gulag_zpu_gun_fire_b;
    level.scr_anim["turret"]["idle"] = %zpu_gun_stop;
    maps\_anim::addnotetrack_customfunction( "turret", "fire_1", maps\gulag_code::_id_BA55 );
    maps\_anim::addnotetrack_customfunction( "turret", "fire_2", maps\gulag_code::_id_B784 );
}

_id_B4DF( var_0 )
{
    if ( var_0._id_C2CF == "intro_1" )
        var_0.missiles[0] playsound( "scn_gulag_f15_missile_fire1" );
    else
        var_0.missiles[0] playsound( "scn_gulag_f15_missile_fire2" );

    var_1 = common_scripts\utility::getfx( "missile_brackets" );

    foreach ( var_3 in var_0.missiles )
    {
        var_3 show();
        playfxontag( var_1, var_3, "TAG_FX" );
    }
}

_id_CC44( var_0 )
{
    wait 0.3;
    var_1 = common_scripts\utility::getfx( "javelin_trail" );
    var_2 = common_scripts\utility::getfx( "javelin_ignition" );

    if ( level._id_BE03 == var_0 )
    {
        level._id_BE03 = var_0.missiles[0];
        level notify( "switch_look" );
    }

    foreach ( var_4 in var_0.missiles )
    {
        var_4 show();
        playfxontag( var_1, var_4, "TAG_FX" );
        playfxontag( var_2, var_4, "TAG_FX" );
    }
}

_id_D36D( var_0 )
{
    var_1 = common_scripts\utility::getfx( "jet_afterburner_ignite" );
    playfxontag( var_1, var_0, "tag_engine_left" );
    playfxontag( var_1, var_0, "tag_engine_right" );
    var_0 maps\_utility::ent_flag_set( "contrails" );
}

_id_C8F1( var_0 )
{
    var_0 endon( "death" );
    var_1 = common_scripts\utility::getfx( "missile_trail" );

    for (;;)
    {
        playfxontag( var_1, var_0, "tag_weapon" );
        wait 0.05;
    }
}

_id_AD6C( var_0 )
{
    var_1 = common_scripts\utility::getfx( "missile_explosion" );
    playfxontag( var_1, var_0, "le_side_wing_jnt" );
    var_0 thread _id_C1F5::_id_D03F();
}
#using_animtree("generic_human");

_id_B2F9()
{
    level.scr_sound["soap"]["gulag_rpt_30sec"] = "gulag_rpt_30sec";
    level.scr_face["soap"]["gulag_rpt_30sec"] = %gulag_rpt_30sec;
    level.scr_radio["gulag_hrp1_angelsone"] = "gulag_hrp1_angelsone";
    level.scr_radio["gulag_lbp1_gogetem"] = "gulag_lbp1_gogetem";
    level.scr_radio["gulag_fp1_goodtone"] = "gulag_fp1_goodtone";
    level.scr_radio["gulag_fp2_goodkill"] = "gulag_fp2_goodkill";
    level.scr_radio["gulag_fp1_niceday"] = "gulag_fp1_niceday";
    level.scr_radio["gulag_lbp1_copies"] = "gulag_lbp1_copies";
    level.scr_radio["gulag_lbp2_copiesall"] = "gulag_lbp2_copiesall";
    level.scr_radio["gulag_lbp3_solidcopy"] = "gulag_lbp3_solidcopy";
    level.scr_radio["gulag_lbp2_goinghot"] = "gulag_lbp2_goinghot";
    level.scr_radio["gulag_lbp1_roger"] = "gulag_lbp1_roger";
    level.scr_radio["gulag_lbp2_guns"] = "gulag_lbp2_guns";
    level.scr_radio["gulag_lbp2_guns2"] = "gulag_lbp2_guns2";
    level.scr_radio["gulag_lbp1_goodeffect"] = "gulag_lbp1_goodeffect";
    level.scr_radio["gulag_lbp2_peeling"] = "gulag_lbp2_peeling";
    level.scr_radio["gulag_lbp1_startattack"] = "gulag_lbp1_startattack";
    level.scr_radio["gulag_lbp3_rollingin"] = "gulag_lbp3_rollingin";
    level.scr_sound["soap"]["gulag_rpt_stbyengage"] = "gulag_rpt_stbyengage";
    level.scr_sound["soap"]["gulag_rpt_stabilize"] = "gulag_rpt_stabilize";
    level.scr_radio["gulag_lbp1_roger2"] = "gulag_lbp1_roger2";
    level.scr_radio["gulag_tco_ontarget"] = "gulag_tco_ontarget";
    level.scr_sound["soap"]["gulag_rpt_clearedengage"] = "gulag_rpt_clearedengage";
    level.scr_sound["soap"]["gulag_rpt_shiftright"] = "gulag_rpt_shiftright";
    level.scr_radio["gulag_lbp1_shifting"] = "gulag_lbp1_shifting";
    level.scr_radio["gulag_rpt_stabilize2"] = "gulag_rpt_stabilize2";
    level.scr_radio["gulag_lbp1_ready"] = "gulag_lbp1_ready";
    level.scr_radio["gulag_wrm_ontarget"] = "gulag_wrm_ontarget";
    level.scr_sound["soap"]["gulag_rpt_shiftright2"] = "gulag_rpt_shiftright2";
    level.scr_radio["gulag_lbp1_shifting2"] = "gulag_lbp1_shifting2";
    level.scr_radio["gulag_rpt_stabilize3"] = "gulag_rpt_stabilize3";
    level.scr_radio["gulag_lbp1_ready2"] = "gulag_lbp1_ready2";
    level.scr_radio["gulag_wrm_ontarget2"] = "gulag_wrm_ontarget2";
    level.scr_radio["gulag_tco_ontarget2"] = "gulag_tco_ontarget2";
    level.scr_radio["gulag_rpt_takeemout"] = "gulag_rpt_takeemout";
    level.scr_radio["gulag_lbp1_hangon"] = "gulag_lbp1_hangon";
    level.scr_radio["gulag_rpt_tooclose"] = "gulag_rpt_tooclose";
    level.scr_radio["gulag_hqr_moretime"] = "gulag_hqr_moretime";
    level.scr_radio["gulag_tco_goodorbad"] = "gulag_tco_goodorbad";
    level.scr_radio["gulag_tco_goodorbad"] = "gulag_gst_yanks2";
    level.scr_radio["gulag_tco_goodorbad"] = "gulag_gst_yanks1";
    level.scr_radio["gulag_rpt_cutchatter"] = "gulag_rpt_cutchatter";
    level.scr_anim["gulag_rpt_cutchatter"] = %gulag_rpt_cutchatter;
    level.scr_radio["gulag_lbp2_firstwave"] = "gulag_lbp2_firstwave";
    level.scr_radio["gulag_lbp2_ondeck"] = "gulag_lbp2_ondeck";
    level.scr_radio["gulag_lbp2_holdingpatt"] = "gulag_lbp2_holdingpatt";
    level.scr_radio["gulag_lbp1_2ndwave"] = "gulag_lbp1_2ndwave";
    level.scr_radio["gulag_lbp1_50ft"] = "gulag_lbp1_50ft";
    level.scr_radio["gulag_lbp1_10ft"] = "gulag_lbp1_10ft";
    level.scr_radio["gulag_lbp1_touchdown"] = "gulag_lbp1_touchdown";
    level.scr_radio["gulag_lbp1_deployed"] = "gulag_lbp1_deployed";
    level.scr_radio["gulag_lbp3_snipercover"] = "gulag_lbp3_snipercover";
    level.scr_radio["gulag_lbp1_solidcopy"] = "gulag_lbp1_solidcopy";
    level.scr_sound["generic"]["gulag_rpt_gogogo"] = "gulag_rpt_gogogo";
    level.scr_sound["soap"]["gulag_cmt_tapinto"] = "gulag_cmt_tapinto";
    level.scr_sound["soap"]["gulag_cmt_secdoor"] = "gulag_cmt_secdoor";
    level.scr_radio["gulag_cmt_ancient"] = "gulag_cmt_ancient";
    level.scr_sound["soap"]["gulag_cmt_wrongdoor"] = "gulag_cmt_wrongdoor";
    level.scr_radio["gulag_gst_standby"] = "gulag_gst_standby";
    level.scr_radio["gulag_gst_gotit2"] = "gulag_gst_gotit2";
    level.scr_sound["soap"]["gulag_cmt_thatsbetter"] = "gulag_cmt_thatsbetter";
    level.scr_radio["gulag_gst_threetwo"] = "gulag_gst_threetwo";
    level.scr_sound["soap"]["gulag_cmt_seeanything"] = "gulag_cmt_seeanything";
    level.scr_sound["soap"]["gulag_cmt_gotcompany"] = "gulag_cmt_gotcompany";
    level.scr_sound["soap"]["gulag_cmt_riotshield"] = "gulag_cmt_riotshield";
    level.scr_face["soap"]["gulag_cmt_riotshield"] = %gulag_cmt_riotshield;
    level.scr_sound["soap"]["gulag_cmt_openarmory"] = "gulag_cmt_openarmory";
    level.scr_radio["gulag_gst_almostthere"] = "gulag_gst_almostthere";
    level.scr_sound["soap"]["gulag_cmt_openthedoor"] = "gulag_cmt_openthedoor";
    level.scr_radio["gulag_gst_gotit"] = "gulag_gst_gotit";
    level.scr_sound["soap"]["gulag_cmt_switchnv"] = "gulag_cmt_switchnv";
    level.scr_radio["gulag_gst_badnews"] = "gulag_gst_badnews";
    level.scr_sound["soap"]["gulag_cmt_hearcoming"] = "gulag_cmt_hearcoming";
    level.scr_sound["soap"]["gulag_cmt_opendoor"] = "gulag_cmt_opendoor";
    level.scr_radio["gulag_gst_runabypass"] = "gulag_gst_runabypass";
    level.scr_sound["soap"]["gulag_cmt_toolate"] = "gulag_cmt_toolate";
    level.scr_radio["gulag_gst_gotmoretangos"] = "gulag_gst_gotmoretangos";
    level.scr_sound["soap"]["gulag_cmt_morecover"] = "gulag_cmt_morecover";
    level.scr_sound["soap"]["gulag_cmt_pickupone"] = "gulag_cmt_pickupone";
    level.scr_sound["soap"]["gulag_cmt_openthedoor"] = "gulag_cmt_openthedoor";
    level.scr_radio["gulag_gst_gotit"] = "gulag_gst_gotit";
    level.scr_sound["soap"]["gulag_cmt_gotcompany"] = "gulag_cmt_gotcompany";
    level.scr_sound["soap"]["gulag_cmt_riotshield"] = "gulag_cmt_riotshield";
    level.scr_sound["soap"]["gulag_cmt_roachisdown"] = "gulag_cmt_roachisdown";
    level.scr_sound["soap"]["gulag_cmt_roach"] = "gulag_cmt_roach";
    level.scr_radio["gulag_tf1_cellclear"] = "gulag_tf1_cellclear";
    level.scr_radio["gulag_tf1_cell4dclear"] = "gulag_tf1_cell4dclear";
    level.scr_radio["gulag_tf1_cellsclear"] = "gulag_tf1_cellsclear";
    level.scr_radio["gulag_tf1_lastfloor"] = "gulag_tf1_lastfloor";
    level.scr_radio["gulag_tf1_captainlastfloor"] = "gulag_tf1_captainlastfloor";
    level.scr_radio["gulag_tf2_clear"] = "gulag_tf2_clear";
    level.scr_radio["gulag_tf2_onesempty"] = "gulag_tf2_onesempty";
    level.scr_radio["gulag_tf3_emptytoo"] = "gulag_tf3_emptytoo";
    level.scr_radio["gulag_tf3_clear"] = "gulag_tf3_clear";
    level.scr_sound["soap"]["gulag_cmt_calloff"] = "gulag_cmt_calloff";
    level.scr_radio["gulag_hqr_working"] = "gulag_hqr_working";
    level.scr_radio["gulag_hqr_loosecannon"] = "gulag_hqr_loosecannon";
    level.scr_sound["soap"]["gulag_cmt_gogogo1"] = "gulag_cmt_gogogo1";
    level.scr_radio["gulag_gst_oncameras"] = "gulag_gst_oncameras";
    level.scr_radio["gulag_gst_30ftonleft"] = "gulag_gst_30ftonleft";
    level.scr_sound["soap"]["gulag_cmt_plantbreach"] = "gulag_cmt_plantbreach";
    level.scr_sound["soap"]["gulag_cmt_hurryup"] = "gulag_cmt_hurryup";
    level.scr_sound["soap"]["gulag_cmt_wegotcompany"] = "gulag_cmt_wegotcompany";
    level.scr_sound["soap"]["gulag_cmt_whichway"] = "gulag_cmt_whichway";
    level.scr_radio["gulag_gst_50meters"] = "gulag_gst_50meters";
    level.scr_sound["soap"]["gulag_cmt_startfiring"] = "gulag_cmt_startfiring";
    level.scr_radio["gulag_gst_cistern"] = "gulag_gst_cistern";
    level.scr_radio["gulag_gst_8tangos"] = "gulag_gst_8tangos";
    level.scr_sound["soap"]["gulag_cmt_needmoretime"] = "gulag_cmt_needmoretime";
    level.scr_radio["gulag_hqr_nocando"] = "gulag_hqr_nocando";
    level.scr_radio["gulag_hqr_getout"] = "gulag_hqr_getout";
    level.scr_sound["soap"]["gulag_cmt_spierig"] = "gulag_cmt_spierig";
    level.scr_radio["gulag_plp_rogeronspie"] = "gulag_plp_rogeronspie";
    level.scr_sound["soap"]["gulag_cmt_sendit"] = "gulag_cmt_sendit";
    level.scr_radio["gulag_plp_ontheway"] = "gulag_plp_ontheway";
    level.scr_sound["soap"]["gulag_cmt_hookup"] = "gulag_cmt_hookup";
    level.scr_sound["soap"]["gulag_cmt_gogogo2"] = "gulag_cmt_gogogo2";
    level.scr_sound["soap"]["gulag_plp_onwayhome"] = "gulag_plp_onwayhome";
    level.scr_sound["soap"]["gulag_cmt_ready2jump"] = "gulag_cmt_ready2jump";
    level.scr_sound["soap"]["gulag_cmt_anotherway"] = "gulag_cmt_anotherway";
    level.scr_sound["soap"]["gulag_cmt_depth100"] = "gulag_cmt_depth100";
    level.scr_radio["gulag_plp_15secs"] = "gulag_plp_15secs";
    level.scr_sound["soap"]["gulag_cmt_deadinfive"] = "gulag_cmt_deadinfive";
    level.scr_sound["soap"]["gulag_cmt_whereareyou"] = "gulag_cmt_whereareyou";
    level.scr_radio["gulag_plp_cantsee"] = "gulag_plp_cantsee";
    level.scr_sound["price"]["gulag_pri_doitfast"] = "gulag_pri_doitfast";
    level.scr_radio["gulag_plp_seeflare"] = "gulag_plp_seeflare";
    level.scr_sound["price"]["gulag_pri_letsgo"] = "gulag_pri_letsgo";
    level.scr_sound["soap"]["gulag_cmt_hookup2"] = "gulag_cmt_hookup2";
    level.scr_sound["soap"]["gulag_cmt_gogo"] = "gulag_cmt_gogo";
    level.scr_sound["price"]["gulag_pri_hangon"] = "gulag_pri_hangon";
    level.scr_radio["gulag_lbp1_gunrun"] = "gulag_lbp1_gunrun";
    level.scr_sound["soap"]["gulag_cmt_lasingtarget"] = "gulag_cmt_lasingtarget";
    level.scr_radio["gulag_lbp1_gotatally"] = "gulag_lbp1_gotatally";
    level.scr_sound["soap"]["gulag_cmt_usem203"] = "gulag_cmt_usem203";
    level.scr_sound["soap"]["gulag_cmt_upahead"] = "gulag_cmt_upahead";
    level.scr_sound["soap"]["gulag_cmt_getout"] = "gulag_cmt_getout";
    level.scr_sound["soap"]["gulag_cmt_checkcorners"] = "gulag_cmt_checkcorners";
    level.scr_radio["gulag_gst_controlroom"] = "gulag_gst_controlroom";
    level.scr_sound["ghost"]["gulag_gst_controlroom_ghost"] = "gulag_gst_controlroom";
    level.scr_radio["gulag_cmt_tapinto"] = "gulag_cmt_tapinto";
    level.scr_sound["ghost"]["gulag_cmt_tapinto_ghost"] = "gulag_cmt_tapinto";
    level.scr_sound["soap"]["gulag_cmt_cellduty"] = "gulag_cmt_cellduty";
    level.scr_radio["gulag_gst_patchedin"] = "gulag_gst_patchedin";
    level.scr_sound["soap"]["gulag_cmt_location"] = "gulag_cmt_location";
    level.scr_radio["gulag_gst_jobeasier"] = "gulag_gst_jobeasier";
    level.scr_sound["soap"]["gulag_cmt_staysharp"] = "gulag_cmt_staysharp";
    level.scr_sound["soap"]["gulag_cmt_wrongdoor"] = "gulag_cmt_wrongdoor";
    level.scr_sound["soap"]["gulag_cmt_talktome"] = "gulag_cmt_talktome";
    level.scr_radio["gulag_gst_eastwing"] = "gulag_gst_eastwing";
    level.scr_sound["soap"]["gulag_cmt_armorydownthere"] = "gulag_cmt_armorydownthere";
    level.scr_radio["gulag_gst_almostthere"] = "gulag_gst_almostthere";
    level.scr_radio["gulag_gst_gotit"] = "gulag_gst_gotit";
    level.scr_sound["soap"]["gulag_cmt_letsgo"] = "gulag_cmt_letsgo";
    level.scr_sound["soap"]["gulag_cmt_ready2jump"] = "gulag_cmt_ready2jump";
    level.scr_sound["soap"]["gulag_cmt_anotherway"] = "gulag_cmt_anotherway";
    level.scr_face["soap"]["gulag_cmt_anotherway"] = %gulag_cmt_anotherway;
    level.scr_sound["redshirt"]["gulag_wrm_thisway"] = "gulag_wrm_thisway";
    level.scr_face["redshirt"]["gulag_wrm_thisway"] = %gulag_wrm_thisway;
    level.scr_sound["redshirt"]["gulag_wrm_deadend"] = "gulag_wrm_deadend";
    level.scr_sound["price"]["gulag_pri_doorsopen"] = "gulag_pri_doorsopen";
    level.scr_sound["soap"]["gulag_cmt_depth100"] = "gulag_cmt_depth100";
    level.scr_radio["gulag_plp_15secs"] = "gulag_plp_15secs";
    level.scr_sound["soap"]["gulag_cmt_deadinfive"] = "gulag_cmt_deadinfive";
    level.scr_sound["soap"]["gulag_cmt_whereareyou"] = "gulag_cmt_whereareyou";
    level.scr_radio["gulag_plp_cantsee"] = "gulag_plp_cantsee";
    level.scr_sound["price"]["gulag_pri_doitfast"] = "gulag_pri_doitfast";
    level.scr_radio["gulag_plp_seeflare"] = "gulag_plp_seeflare";
    level.scr_sound["soap"]["gulag_cmt_hookup2"] = "gulag_cmt_hookup2";
    level.scr_sound["soap"]["gulag_cmt_gogo"] = "gulag_cmt_gogo";
    level.scr_sound["price"]["gulag_pri_hangon"] = "gulag_pri_hangon";
    level.scr_sound["soap"]["gulag_cmt_seehostiles"] = "gulag_cmt_seehostiles";
    level.scr_face["soap"]["gulag_cmt_seehostiles"] = %gulag_cmt_seehostiles;
    level.scr_radio["gulag_rpt_tooclose"] = "gulag_rpt_tooclose";
    level.scr_sound["soap"]["gulag_cmt_usesheild"] = "gulag_cmt_usesheild";
    level.scr_sound["soap"]["gulag_cmt_illdrawfire"] = "gulag_cmt_illdrawfire";
    level.scr_radio["gulag_gst_bypassfloors"] = "gulag_gst_bypassfloors";
    level.scr_sound["soap"]["gulag_cmt_roachfollow"] = "gulag_cmt_roachfollow";
    level.scr_face["soap"]["gulag_cmt_roachfollow"] = %gulag_cmt_roachfollow;
    level.scr_radio["gulag_gst_feedisdead"] = "gulag_gst_feedisdead";
    level.scr_sound["soap"]["gulag_cmt_switchnv"] = "gulag_cmt_switchnv";
    level.scr_sound["soap"]["gulag_cmt_stragglers"] = "gulag_cmt_stragglers";
    level.scr_sound["soap"]["gulag_cmt_calloff"] = "gulag_cmt_calloff";
    level.scr_radio["gulag_hqr_working"] = "gulag_hqr_working";
    level.scr_radio["gulag_hqr_loosecannon"] = "gulag_hqr_loosecannon";
    level.scr_sound["soap"]["gulag_cmt_toonarrow"] = "gulag_cmt_toonarrow";
    level.scr_sound["soap"]["gulag_cmt_plantbreach"] = "gulag_cmt_plantbreach";
    level.scr_sound["soap"]["gulag_cmt_hurryup"] = "gulag_cmt_hurryup";
    level.scr_sound["soap"]["gulag_cmt_forgetthatdoor"] = "gulag_cmt_forgetthatdoor";
    level.scr_sound["soap"]["gulag_cmt_spreadout"] = "gulag_cmt_spreadout";
    level.scr_sound["soap"]["gulag_cmt_hostiles2ndfloor"] = "gulag_cmt_hostiles2ndfloor";
    level.scr_sound["soap"]["gulag_cmt_keepmoving"] = "gulag_cmt_keepmoving";
    level.scr_sound["soap"]["gulag_cmt_uselockers"] = "gulag_cmt_uselockers";
    level.scr_sound["soap"]["gulag_cmt_hitfromside"] = "gulag_cmt_hitfromside";
    level.scr_sound["soap"]["gulag_cmt_cookgrenades"] = "gulag_cmt_cookgrenades";
    level.scr_sound["soap"]["gulag_cmt_holeinfloor"] = "gulag_cmt_holeinfloor";
    level.scr_sound["soap"]["gulag_cmt_needmoretime"] = "gulag_cmt_needmoretime";
    level.scr_radio["gulag_hqr_nocando"] = "gulag_hqr_nocando";
    level.scr_sound["generic"]["gulag_cmt_heswithus"] = "gulag_cmt_heswithus";
    level.scr_sound["generic"]["gulag_pri_soap"] = "gulag_pri_soap";
    level.scr_sound["generic"]["gulag_wrm_whosoap"] = "gulag_wrm_whosoap";
    level.scr_sound["generic"]["gulag_cmt_heswithus"] = "gulag_cmt_heswithus";
    level.scr_sound["generic"]["gulag_pri_soap"] = "gulag_pri_soap";
    level.scr_sound["generic"]["gulag_wrm_whosoap"] = "gulag_wrm_whosoap";
    level.scr_sound["generic"]["gulag_cmt_belongstoyou"] = "gulag_cmt_belongstoyou";
    level.scr_sound["generic"]["gulag_cmt_getouttaheremove"] = "gulag_cmt_getouttaheremove";
    level.scr_sound["generic"]["gulag_rpa_ext_1"] = "gulag_rpa_ext_1";
    level.scr_sound["generic"]["gulag_rpa_ext_2"] = "gulag_rpa_ext_2";
    level.scr_sound["generic"]["gulag_rpa_ext_3"] = "gulag_rpa_ext_3";
    level.scr_sound["generic"]["gulag_rpa_ext_4"] = "gulag_rpa_ext_4";
    level.scr_sound["generic"]["gulag_rpa_ext_5"] = "gulag_rpa_ext_5";
    level.scr_sound["generic"]["gulag_rpa_ext_6"] = "gulag_rpa_ext_6";
    level.scr_sound["generic"]["gulag_rpa_ext_7"] = "gulag_rpa_ext_7";
    level.scr_sound["generic"]["gulag_rpa_ext_8"] = "gulag_rpa_ext_8";
    level.scr_sound["generic"]["gulag_rpa_int_1"] = "gulag_rpa_int_1";
    level.scr_sound["generic"]["gulag_rpa_int_2"] = "gulag_rpa_int_2";
    level.scr_sound["generic"]["gulag_rpa_int_3"] = "gulag_rpa_int_3";
    level.scr_sound["generic"]["gulag_rpa_int_4"] = "gulag_rpa_int_4";
    level.scr_sound["generic"]["gulag_rpa_int_5"] = "gulag_rpa_int_5";
    level.scr_sound["generic"]["gulag_pri_yes"] = "gulag_pri_yes";
}

_id_C8F4()
{
    level._id_A98C = [];
    level._id_A98C[0] = "exploder_script_model";
}
#using_animtree("script_model");

_id_BAF7()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_a_anim"] = %h2_gulag_castletower_1_break_a_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_b_anim"] = %h2_gulag_castletower_1_break_b_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_c_anim"] = %h2_gulag_castletower_1_break_c_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_d_anim"] = %h2_gulag_castletower_1_break_d_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_d2_anim"] = %h2_gulag_castletower_1_break_d2_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_e_anim"] = %h2_gulag_castletower_1_break_e_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_f_anim"] = %h2_gulag_castletower_1_break_f_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_g_anim"] = %h2_gulag_castletower_1_break_g_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_h_anim"] = %h2_gulag_castletower_1_break_h_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_i_anim"] = %h2_gulag_castletower_1_break_i_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_1_break_j_anim"] = %h2_gulag_castletower_1_break_j_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_2_break_a_anim"] = %h2_gulag_castletower_2_break_a_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_2_break_b_anim"] = %h2_gulag_castletower_2_break_b_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_2_break_c_anim"] = %h2_gulag_castletower_2_break_c_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_2_break_d_anim"] = %h2_gulag_castletower_2_break_d_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_2_break_e_anim"] = %h2_gulag_castletower_2_break_e_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_2_break_f_anim"] = %h2_gulag_castletower_2_break_f_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_castletower_2_break_g_anim"] = %h2_gulag_castletower_2_break_g_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_radiotower_break_a_anim"] = %h2_gulag_radiotower_break_a_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_radiotower_break_b_anim"] = %h2_gulag_radiotower_break_b_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_radiotower_break_c_anim"] = %h2_gulag_radiotower_break_c_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_radiotower_break_d_anim"] = %h2_gulag_radiotower_break_d_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_radiotower_break_e_anim"] = %h2_gulag_radiotower_break_e_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_radiotower_break_f_anim"] = %h2_gulag_radiotower_break_f_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_radiotower_break_g_anim"] = %h2_gulag_radiotower_break_g_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_radiotower_break_h_anim"] = %h2_gulag_radiotower_break_h_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_littlebird_break_a_anim"] = %h2_gulag_littlebird_break_a_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_littlebird_break_b_anim"] = %h2_gulag_littlebird_break_b_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_littlebird_break_c_anim"] = %h2_gulag_littlebird_break_c_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_littlebird_break_d_anim"] = %h2_gulag_littlebird_break_d_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_littlebird_break_e_anim"] = %h2_gulag_littlebird_break_e_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_littlebird_break_f_anim"] = %h2_gulag_littlebird_break_f_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_rockslide_break_a_anim"] = %h2_gulag_rockslide_break_a_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_rockslide_break_b_anim"] = %h2_gulag_rockslide_break_b_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_rockslide_break_c_anim"] = %h2_gulag_rockslide_break_c_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_rockslide_break_d_anim"] = %h2_gulag_rockslide_break_d_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_rockslide_break_e_anim"] = %h2_gulag_rockslide_break_e_anim;
    level.scr_anim["exploder_script_model"]["h2_gulag_rockslide_break_f_anim"] = %h2_gulag_rockslide_break_f_anim;
}
#using_animtree("animated_props");

_id_B531()
{
    var_0 = [ "trq_tree_pine_snow_045_02_rig", "trq_tree_pine_snow_060_02_rig", "trq_tree_pine_snow_070_02_rig", "trq_tree_pine_snow_080_02_rig", "trq_tree_pine_snow_090_02_rig", "trq_tree_pine_snow_105_02_rig" ];

    foreach ( var_2 in var_0 )
    {
        level.anim_prop_models[var_2]["still"] = %h2_trq_tree_pine_still;
        level.anim_prop_models[var_2]["strong"] = %h2_trq_tree_pine_sway;
        level.anim_prop_models[var_2]["heli"] = %h2_trq_tree_pine_heli_sway;
    }
}

_id_A9DA( var_0 )
{
    level.player thread maps\_utility::play_sound_on_entity( "scn_gulag_intro_player_dismount" );
}

_id_B014( var_0 )
{
    killfxontag( common_scripts\utility::getfx( "radio_tower_red_static_glow" ), self, "tag_fx" );
    playfxontag( common_scripts\utility::getfx( "radio_tower_fall_light_flicker" ), self, "tag_fx" );
}

_id_B650( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "radio_tower_fall_sparks_runner" ), self, "transmitting_tower4" );
}

_id_AE1A( var_0 )
{
    common_scripts\_exploder::exploder( "radio_tower_impact" );
}

_id_C98E( var_0 )
{
    level._id_D13B maps\_utility::forceuseweapon( "mp5", "primary" );
    var_1 = getent( "soap_mp5", "targetname" );
    var_1 delete();
}
