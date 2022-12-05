// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_C6D3();
    setup_dialogue();
    _id_C8F4();
    _id_BAF7();
    thread _id_B371();
}

_id_B371()
{
    while ( !isdefined( level.struct_class_names ) )
        wait 0.05;

    level._id_D115["rooftop_mantle"] = common_scripts\utility::getstruct( "market_evac_friendlies_climb_animspot", "targetname" );
}

_id_C8F4()
{
    level._id_A98C = [];
    level._id_A98C[0] = "exploder_script_model";
}
#using_animtree("generic_human");

_id_C6D3()
{
    level.scr_anim["generic"]["intro_rojas_idle"][0] = %h2_favela_escape_crucified_idle;
    maps\_anim::addnotetrack_customfunction( "generic", "mumbling", maps\favela_escape_aud::crucified_rojas_idle, "intro_rojas_idle" );
    level.scr_anim["generic"]["intro_rojas_death"] = %h2_favela_escape_crucified_death;
    level.scr_anim["sarge"]["opening_radiotower"] = %h2_favela_escape_opening_soap;
    maps\_anim::addnotetrack_dialogue( "sarge", "dialog", "opening_radiotower", "favesc_cmt_fightourway" );
    maps\_anim::addnotetrack_dialogue( "sarge", "dialog", "opening_radiotower", "favesc_cmt_takeover" );
    maps\_anim::addnotetrack_customfunction( "sarge", "drop_phone", maps\favela_escape_aud::soap_hanging_up_phone, "opening_radiotower" );
    level.scr_anim["hero1"]["opening_radiotower"] = %h2_favela_escape_opening_ghost;
    maps\_anim::addnotetrack_dialogue( "hero1", "dialog_gst", "opening_radiotower", "favesc_gst_closingin" );
    maps\_anim::addnotetrack_dialogue( "hero1", "dialog_gst", "opening_radiotower", "favesc_gst_whataboutrojas" );
    maps\_anim::addnotetrack_customfunction( "hero1", "dialog_gst_end", maps\favela_escape_aud::_id_C7F6, "opening_radiotower" );
    level.scr_anim["generic"]["intro_casual_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["favela_run_and_wave"] = %favela_run_and_wave;
    level.scr_anim["generic"]["door_kick_in"] = %door_kick_in;
    level.scr_anim["generic"]["doorburst_wave"] = %doorburst_wave;
    level.scr_anim["generic"]["doorburst_search"] = %doorburst_search;
    level.scr_anim["generic"]["doorburst_fall"] = %doorburst_fall;
    level.scr_anim["generic"]["window_smash_stop_inside"] = %window_smash_stop_inside;
    level.scr_anim["generic"]["window_smash_stop_outside"] = %window_smash_stop_outside;
    level.scr_anim["generic"]["window_smash_run"] = %window_smash_run;
    level.scr_anim["generic"]["favela_chaotic_above_through"] = %favela_chaotic_above_through;
    level.scr_anim["generic"]["favela_chaotic_above_through_uzi"] = %favela_chaotic_above_through_uzi;
    level.scr_anim["generic"]["favela_chaotic_above_back"] = %favela_chaotic_above_back;
    level.scr_anim["curtain_pull"]["pulldown"] = %favela_curtain_pull;
    level.scr_anim["generic"]["traverse_window_M_2_dive"] = %traverse_window_m_2_dive;
    level.scr_anim["generic"]["favela_escape_rooftop_traverse_L"] = %h2_favela_escape_rooftop_traverse_l;
    level.scr_anim["generic"]["favela_escape_rooftop_traverse_R"] = %h2_favela_escape_rooftop_traverse_r;
    level.scr_anim["generic"]["favela_escape_rooftop_traverse_M"] = %h2_favela_escape_rooftop_traverse_m;
    level.scr_anim["sarge"]["favela_escape_rooftop_traverse_M_idle"] = %h2_favela_escape_rooftop_traverse_m_idle;
    level.scr_anim["sarge"]["favela_escape_rooftop_traverse_M_idle_dialog1"] = %h2_favela_escape_rooftop_traverse_m_dialog1;
    level.scr_anim["sarge"]["favela_escape_rooftop_traverse_M_idle_dialog2"] = %h2_favela_escape_rooftop_traverse_m_dialog2;
    level.scr_anim["sarge"]["favela_escape_rooftop_traverse_M_idle_dialog3"] = %h2_favela_escape_rooftop_traverse_m_dialog3;
    maps\_anim::addnotetrack_dialogue( "sarge", "dialog1", "favela_escape_rooftop_traverse_M_idle_dialog1", "favesc_cmt_getuphere" );
    maps\_anim::addnotetrack_dialogue( "sarge", "dialog2", "favela_escape_rooftop_traverse_M_idle_dialog2", "favesc_cmt_climbup" );
    maps\_anim::addnotetrack_dialogue( "sarge", "dialog3", "favela_escape_rooftop_traverse_M_idle_dialog3", "favesc_cmt_climbuphere" );
    level.scr_anim["generic"]["favela_escape_rooftop_traverse_M_idle_2_run"] = %h2_favela_escape_rooftop_traverse_m_idle_2_run;
    level.scr_anim["generic"]["freerunnerA_run"] = %freerunnera_loop;
    level.scr_anim["generic"]["freerunnerB_run"] = %freerunnerb_loop;
    level.scr_anim["freerunner"]["freerunnerA_left"] = %freerunnera_left;
    level.scr_anim["freerunner"]["freerunnerB_mid"] = %freerunnerb_mid;
    level.scr_anim["freerunner"]["freerunnerA_right"] = %freerunnera_right;
    level.scr_anim["freerunner"]["freerunnerA_sideslope"] = %freerunnera_sideslope;
    level.scr_anim["freerunner"]["freerunnerA_laundry"] = %freerunnera_laundry;
    level.scr_anim["freerunner"]["freerunnerB_laundry"] = %freerunnerb_laundry;
    level.scr_anim["freerunner"]["jump_across_100_lunge"] = %jump_across_100_lunge;
    level.scr_anim["freerunner"]["favela_escape_bigjump_faust_loop"][0] = %h2_favela_escape_bigjump_faustloop;
    level.scr_anim["freerunner"]["favela_escape_bigjump_ghost_loop"][0] = %h2_favela_escape_bigjump_ghostloop;
    level.scr_anim["freerunner"]["favela_escape_bigjump_soap_loop"][0] = %h2_favela_escape_bigjump_soap_loop;
    level.scr_anim["freerunner"]["favela_escape_bigjump_soap_reach"] = %h2_favela_escape_bigjump_soap_reach;
    level.scr_anim["freerunner"]["favela_escape_bigjump_soap"] = %h2_favela_escape_bigjump_soap;
    level.scr_anim["freerunner"]["favela_escape_bigjump_ghost"] = %h2_favela_escape_bigjump_ghost;
    level.scr_anim["freerunner"]["favela_escape_bigjump_faust"] = %h2_favela_escape_bigjump_faust;
    maps\_anim::addnotetrack_customfunction( "freerunner", "roof_piece_wobble", ::_id_C895 );
    level.scr_anim["generic"]["chase_run"] = %run_n_gun_f;
    level.scr_sound["freerunner"]["favela_escape_bigjump_faust"] = "favesc_tf1_jumpsfx";
    level.scr_anim["generic"]["mobwalk_A"] = %mob_arc_a;
    level.scr_anim["generic"]["mobwalk_B"] = %mob_arc_b;
    level.scr_anim["generic"]["mobwalk_C"] = %mob_arc_c;
    level.scr_anim["generic"]["mobwalk_D"] = %mob_arc_d;
    level.scr_anim["generic"]["mob2_arc_A"] = %mob2_arc_a;
    level.scr_anim["generic"]["mob2_arc_B"] = %mob2_arc_b;
    level.scr_anim["generic"]["mob3_arc_C"] = %mob3_arc_c;
    level.scr_anim["generic"]["mob2_arc_D"] = %mob2_arc_d;
    level.scr_anim["generic"]["mob2_arc_E"] = %mob2_arc_e;
    level.scr_anim["generic"]["mob2_arc_F"] = %mob2_arc_f;
    level.scr_anim["generic"]["mob2_arc_G"] = %mob2_arc_g;
    level.scr_anim["generic"]["mob2_arc_H"] = %mob2_arc_h;
    level.scr_anim["generic"]["mob_left_A"] = %mob_left_a;
    level.scr_anim["generic"]["mob_left_B"] = %mob_left_b;
    level.scr_anim["generic"]["mob_left_C"] = %mob_left_c;
    level.scr_anim["generic"]["mob_left_D"] = %mob_left_d;
    level.scr_anim["generic"]["favela_escape_rooftop_mob1"] = %favela_escape_rooftop_mob1;
    level.scr_anim["generic"]["favela_escape_rooftop_mob2"] = %favela_escape_rooftop_mob2;
    level.scr_anim["generic"]["favela_escape_rooftop_mob3"] = %favela_escape_rooftop_mob3;
    level.scr_anim["generic"]["favela_escape_rooftop_mob4"] = %favela_escape_rooftop_mob4;
    level.scr_anim["default_civilian"]["run_and_slam_idle"][0] = %flee_alley_civilain_idle;
    level.scr_anim["default_civilian"]["run_and_slam"] = %flee_alley_civilain;
    level.scr_anim["default_civilian"]["run_and_slam_endidle"][0] = %civilain_crouch_hide_idle;
    level.scr_anim["generic"]["unarmed_cowercrouch_react_A"] = %unarmed_cowercrouch_react_a;
    level.scr_anim["generic"]["unarmed_cowercrouch_react_B"] = %unarmed_cowercrouch_react_b;
    level.scr_anim["generic"]["unarmed_cowercrouch_idle"][0] = %unarmed_cowercrouch_idle;
    level.scr_anim["generic"]["cargoship_stunned_react_v2"] = %cargoship_stunned_react_v2;
    level.scr_anim["generic"]["unarmed_cowerstand_react_2_crouch"] = %unarmed_cowerstand_react_2_crouch;
    level.scr_anim["generic"]["unarmed_cowerstand_idle"][0] = %unarmed_cowerstand_idle;
    level.scr_anim["chopper_door_guy"]["chopperjump_in"] = %h2_favela_escape_ending_mctavish_in;
    level.scr_anim["chopper_door_guy"]["chopperjump_loop"][0] = %h2_favela_escape_ending_mctavish_loop;
    level.scr_anim["chopper_door_guy"]["chopperjump_flyaway"] = %h2_favela_escape_ending_mctavish_flying_away;
    maps\_anim::addnotetrack_dialogue( "chopper_door_guy", "dialog", "chopperjump_flyaway", "favesc_cmt_gothim" );
    _id_B230();
    _id_CBA6();
    _id_C888();
}

_id_C895( var_0 )
{
    if ( common_scripts\utility::flag( "no_wobble_roof" ) )
        return;

    if ( var_0 == level._id_C947 )
        var_1 = "wobble_ghost";
    else if ( var_0 == level._id_BAD2 )
        var_1 = "wobble_soap";
    else
        var_1 = "wobble_faust";

    level._id_D4B5.node maps\_anim::anim_single_solo( level._id_D4B5.rig, var_1 );
}

setup_dialogue()
{
    level.scr_sound["hero1"]["favesc_gst_closingin"] = "favesc_gst_closingin";
    level.scr_sound["sarge"]["favesc_cmt_fightourway"] = "favesc_cmt_fightourway";
    level.scr_sound["hero1"]["favesc_gst_whataboutrojas"] = "favesc_gst_whataboutrojas";
    level.scr_sound["sarge"]["favesc_cmt_takeover"] = "favesc_cmt_takeover";
    level.scr_sound["hero1"]["favesc_gst_worksforme"] = "favesc_gst_worksforme";
    level.scr_sound["sarge"]["favesc_cmt_surrounded"] = "favesc_cmt_surrounded";
    level.scr_radio["favesc_nkl_ontheway"] = "favesc_nkl_ontheway";
    level.scr_sound["sarge"]["favesc_cmt_lockandload"] = "favesc_cmt_lockandload";
    level.scr_sound["hero1"]["favesc_gst_letsdothis"] = "favesc_gst_letsdothis";
    level.scr_sound["hero1"]["favesc_gst_onrooftops"] = "favesc_gst_onrooftops";
    level.scr_sound["hero1"]["favesc_gst_deadahead"] = "favesc_gst_deadahead";
    level.scr_sound["hero1"]["favesc_gst_shackonleft"] = "favesc_gst_shackonleft";
    level.scr_sound["hero1"]["favesc_gst_skinnies"] = "favesc_gst_skinnies";
    level.scr_sound["hero1"]["favesc_gst_leftflank"] = "favesc_gst_leftflank";
    level.scr_sound["sarge"]["favesc_cmt_shiftfire"] = "favesc_cmt_shiftfire";
    level.scr_sound["hero1"]["favesc_gst_leftleftleft"] = "favesc_gst_leftleftleft";
    level.scr_sound["sarge"]["favesc_cmt_rpgseast"] = "favesc_cmt_rpgseast";
    level.scr_sound["hero1"]["favesc_gst_tothesouth"] = "favesc_gst_tothesouth";
    level.scr_sound["sarge"]["favesc_cmt_lowfromse"] = "favesc_cmt_lowfromse";
    level.scr_sound["hero1"]["favesc_gst_alotofem"] = "favesc_gst_alotofem";
    level.scr_sound["hero1"]["favesc_gst_gottamove"] = "favesc_gst_gottamove";
    level.scr_sound["generic"]["favesc_pe4_killthemall"] = "favesc_pe4_killthemall";
    level.scr_sound["generic"]["favesc_pe1_heretheycome"] = "favesc_pe1_heretheycome";
    level.scr_sound["generic"]["favesc_pe1_attack"] = "favesc_pe1_attack";
    level.scr_sound["hero1"]["favesc_gst_technical"] = "favesc_gst_technical";
    level.scr_sound["sarge"]["favesc_cmt_technical"] = "favesc_cmt_technical";
    level.scr_sound["sarge"]["favesc_cmt_thruthatgate"] = "favesc_cmt_thruthatgate";
    level.scr_sound["sarge"]["favesc_cmt_thrugate"] = "favesc_cmt_thrugate";
    level.scr_sound["hero1"]["favesc_gst_gogogo"] = "favesc_gst_gogogo";
    level.scr_sound["hero1"]["favesc_gst_chopperinbound"] = "favesc_gst_chopperinbound";
    level.scr_sound["sarge"]["favesc_cmt_hitbyrpg"] = "favesc_cmt_hitbyrpg";
    level.scr_radio["favesc_nkl_doityourway"] = "favesc_nkl_doityourway";
    level.scr_radio["favesc_nkl_manymilitia"] = "favesc_nkl_manymilitia";
    level.scr_sound["sarge"]["favesc_cmt_rogerandthanks"] = "favesc_cmt_rogerandthanks";
    level.scr_sound["sarge"]["favesc_cmt_pushthrustreets"] = "favesc_cmt_pushthrustreets";
    level.scr_sound["sarge"]["favesc_cmt_flankingroutes"] = "favesc_cmt_flankingroutes";
    level.scr_sound["sarge"]["favesc_cmt_laydownfire"] = "favesc_cmt_laydownfire";
    level.scr_sound["sarge"]["favesc_cmt_alleyonleft"] = "favesc_cmt_alleyonleft";
    level.scr_sound["sarge"]["favesc_cmt_almostatmarket"] = "favesc_cmt_almostatmarket";
    level.scr_sound["hero1"]["favesc_gst_highstreet"] = "favesc_gst_highstreet";
    level.scr_sound["sarge"]["favesc_cmt_splitup"] = "favesc_cmt_splitup";
    level.scr_sound["hero1"]["favesc_gst_firingblind"] = "favesc_gst_firingblind";
    level.scr_sound["sarge"]["favesc_cmt_shackonright"] = "favesc_cmt_shackonright";
    level.scr_sound["sarge"]["favesc_cmt_therespavelow"] = "favesc_cmt_therespavelow";
    level.scr_sound["sarge"]["favesc_cmt_immediatedustoff"] = "favesc_cmt_immediatedustoff";
    level.scr_radio["favesc_nkl_notfastenough"] = "favesc_nkl_notfastenough";
    level.scr_sound["sarge"]["favesc_cmt_pickuppace"] = "favesc_cmt_pickuppace";
    level.scr_radio["favesc_nkl_toohot"] = "favesc_nkl_toohot";
    level.scr_sound["sarge"]["favesc_cmt_waveoff"] = "favesc_cmt_waveoff";
    level.scr_radio["favesc_nkl_meetyouthere"] = "favesc_nkl_meetyouthere";
    level.scr_sound["sarge"]["favesc_cmt_gettorooftops"] = "favesc_cmt_gettorooftops";
    level.scr_sound["sarge"]["favesc_cmt_getuphere"] = "favesc_cmt_getuphere";
    level.scr_sound["sarge"]["favesc_cmt_climbup"] = "favesc_cmt_climbup";
    level.scr_sound["sarge"]["favesc_cmt_climbuphere"] = "favesc_cmt_climbuphere";
    level.scr_sound["freerunner"]["favesc_cmt_letsgoletsgo"] = "favesc_cmt_letsgoletsgo";
    level.scr_radio["favesc_nkl_wholevillage"] = "favesc_nkl_wholevillage";
    level.scr_sound["freerunner"]["favesc_cmt_pickusup"] = "favesc_cmt_pickusup";
    level.scr_face["freerunner"]["favesc_cmt_pickusup"] = %favela_escape_soap_pickusup;
    level.scr_radio["favesc_nkl_keepgoing"] = "favesc_nkl_keepgoing";
    level.scr_sound["freerunner"]["favesc_gst_runoutofroof"] = "favesc_gst_runoutofroof";
    level.scr_sound["freerunner"]["favesc_cmt_makeitgogo"] = "favesc_cmt_makeitgogo";
    level.scr_face["freerunner"]["favesc_cmt_makeitgogo"] = %favela_escape_soap_makeitgogo;
    level.scr_sound["freerunner"]["favesc_cmt_getoutta"] = "favesc_cmt_getoutta";
    level.scr_sound["freerunner"]["favesc_cmt_gettochopper"] = "favesc_cmt_gettochopper";
    level.scr_sound["freerunner"]["favesc_cmt_whatsholdup"] = "favesc_cmt_whatsholdup";
    level.scr_radio["favesc_cmt_wakeup"] = "favesc_cmt_wakeup";
    level.scr_radio["favesc_gst_comingforyou"] = "favesc_gst_comingforyou";
    level.scr_radio["favesc_cmt_toomany"] = "favesc_cmt_toomany";
    level.scr_radio["favesc_cmt_runforit"] = "favesc_cmt_runforit";
    level.scr_radio["favesc_cmt_circlingarea"] = "favesc_cmt_circlingarea";
    level.scr_radio["favesc_cmt_lowonfuel"] = "favesc_cmt_lowonfuel";
    level.scr_radio["favesc_cmt_meetussouth"] = "favesc_cmt_meetussouth";
    level.scr_radio["favesc_cmt_leftturnleft"] = "favesc_cmt_leftturnleft";
    level.scr_radio["favesc_cmt_headtoright"] = "favesc_cmt_headtoright";
    level.scr_radio["favesc_cmt_comeon"] = "favesc_cmt_comeon";
    level.scr_radio["favesc_nkl_verylow"] = "favesc_nkl_verylow";
    level.scr_radio["favesc_cmt_onfumes"] = "favesc_cmt_onfumes";
    level.scr_sound["chopper_door_guy"]["favesc_cmt_jump"] = "favesc_cmt_jump";
    level.scr_face["chopper_door_guy"]["favesc_cmt_jump"] = %favela_escape_soap_cmt_jump;
    level.scr_radio["favesc_cmt_gothim"] = "favesc_cmt_gothim";
    level.scr_radio["favesc_nkl_whereto"] = "favesc_nkl_whereto";
    level.scr_radio["favesc_cmt_tothesub"] = "favesc_cmt_tothesub";
}
#using_animtree("player");

_id_C888()
{
    level.scr_anim["player_bigjump"]["jump"] = %h2_favela_escape_bigjump_playerjump;
    level.scr_anim["player_bigjump"]["recover"] = %h2_favela_escape_bigjump_playerfall;
    level.scr_model["player_bigjump"] = "h2_gfl_st_ar15_viewbody";
    level.scr_animtree["player_bigjump"] = #animtree;
    level.scr_model["player"] = "h2_gfl_st_ar15_viewhands_player";
    level.scr_animtree["player"] = #animtree;
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_st_ar15_viewbody";
    level.scr_anim["worldbody"]["slide_loop"][0] = %h2_favelaescape_slide_player_idle;
    level.scr_anim["worldbody"]["slide_in"] = %h2_favelaescape_slide_player_in;
    level.scr_anim["worldbody"]["slide_out"] = %h2_favelaescape_slide_player_out;
    level.scr_anim["worldbody"]["slide_back_loop"][0] = %h2_favelaescape_slide_player_back_idle;
    level.scr_anim["worldbody"]["slide_back_in"] = %h2_favelaescape_slide_player_back_in;
    level.scr_anim["worldbody"]["slide_back_out"] = %h2_favelaescape_slide_player_back_out;
    level.scr_anim["worldbody"]["slide_ar"] = %h2_favelaescape_slide_player_turnl;
    level.scr_anim["worldbody"]["slide_al"] = %h2_favelaescape_slide_player_turnr;
    level.scr_anim["worldbody"]["rooftop_mantle"] = %h2_favela_escape_rooftop_traverse_player;
    level.scr_anim["worldbody"]["chopperjump_jump"] = %h2_favela_escape_ending_player_catch_rope;
    level.scr_model["viewhands"] = "h2_gfl_st_ar15_viewhands_player";
    level.scr_animtree["viewhands"] = #animtree;
}
#using_animtree("script_model");

_id_CBA6()
{
    level.scr_animtree["rojas_restraints"] = #animtree;
    level.scr_model["rojas_restraints"] = "h2_unconscious_rojas_rope";
    level.scr_anim["rojas_restraints"]["idle"][0] = %h2_favela_escape_rojas_rope;
    level.scr_model["curtain"] = "curtain_torn01_animated";
    level.scr_animtree["curtain"] = #animtree;
    level.scr_anim["curtain"]["pulldown"] = %favela_curtain_model_pull;
    level.scr_model["civ_door"] = "com_door_01_handleleft";
    level.scr_animtree["civ_door"] = #animtree;
    level.scr_anim["civ_door"]["run_and_slam_idle"][0] = %flee_alley_door_idle;
    level.scr_anim["civ_door"]["run_and_slam"] = %flee_alley_door;
    level.scr_model["roof_rig"] = "h2_fav_corrugated_metal_roof_animated";
    level.scr_animtree["roof_rig"] = #animtree;
    level.scr_anim["roof_rig"]["breakaway"] = %h2_favela_escape_bigjump_roof_collapse;
    level.scr_anim["roof_rig"]["wobble_faust"] = %h2_favela_escape_bigjump_roof_wobble_faust;
    level.scr_anim["roof_rig"]["wobble_ghost"] = %h2_favela_escape_bigjump_roof_wobble_ghost;
    level.scr_anim["roof_rig"]["wobble_soap"] = %h2_favela_escape_bigjump_roof_wobble;
    level.scr_model["laundry"] = "hanging_sheet";
    level.scr_animtree["laundry"] = #animtree;
    level.scr_anim["laundry"]["roofrun_laundry_1"] = %favela_escape_sheet01_run_through;
    level.scr_anim["laundry"]["roofrun_laundry_2"] = %favela_escape_sheet02_run_through;
    level.scr_model["ladder"] = "favela_escape_ropeladder";
    level.scr_anim["ladder"]["chopperjump_in"] = %h2_favela_escape_ending_rope_in;
    level.scr_anim["ladder"]["chopperjump_loop"][0] = %h2_favela_escape_ending_rope_loop;
    level.scr_anim["ladder"]["chopperjump_jump"] = %h2_favela_escape_ending_rope_interaction;
    level.scr_animtree["ladder"] = #animtree;
    level.scr_model["chicken_anim"] = "chicken";
    level.scr_animtree["chicken_anim"] = #animtree;
    level.scr_anim["chicken_anim"]["crazy01"][0] = %chicken_cage_loop_01;
    level.scr_anim["chicken_anim"]["crazy02"][0] = %chicken_cage_loop_02;
    level.scr_anim["chicken_anim"]["pecking"][0] = %chicken_cage_pecking_idle;
    level.scr_anim["chicken_anim"]["seated"][0] = %chicken_cage_seated_idle;
    level.scr_anim["chicken_anim"]["death01"] = %chicken_cage_death;
    level.scr_anim["chicken_anim"]["death02"] = %chicken_cage_death_02;
    level.scr_model["payphone"] = "h2_fav_phonebooth_phone";
    level.scr_animtree["payphone"] = #animtree;
    level.scr_anim["payphone"]["opening_radiotower"] = %h2_favela_escape_opening_phone;
    level.scr_model["goals"] = "h2_fav_soccer_goal_anim";
    level.scr_animtree["goals"] = #animtree;
    level.scr_anim["goals"]["soccer_goal"][0] = %h2_fav_soccer_goal_idle;
    level.scr_anim["goals"]["soccer_goal_heli"] = %h2_fav_soccer_goal_heli;
    level.scr_anim["goals"]["soccer_goal_heli2idle"] = %h2_fav_soccer_goal_heli2idle;
    level.scr_model["heavy_wires"] = "h2_fave_soccer_field_wires_01_animated";
    level.scr_animtree["heavy_wires"] = #animtree;
    level.scr_anim["heavy_wires"]["helicopter_wires"] = %h2_fave_soccer_field_wires_reacthelico;
    level.scr_model["airconditioner"] = "h2_com_ex_airconditioner";
    level.scr_animtree["airconditioner"] = #animtree;
    level.scr_anim["airconditioner"]["idle"][0] = %h2_com_ex_airconditioner_idle;
}
#using_animtree("vehicles");

_id_B230()
{
    level.scr_anim["chopper"]["cargodoor_open"] = %favela_escape_ending_chopper_open_back_door;
    level.scr_anim["chopper"]["chopperjump_in"] = %h2_favela_escape_ending_chopper_in;
    level.scr_anim["chopper"]["chopperjump_loop"][0] = %h2_favela_escape_ending_chopper_loop;
    level.scr_anim["chopper"]["chopperjump_flyaway"] = %h2_favela_escape_ending_chopper_flying_away;
    level.scr_anim["chopper"]["rotors"] = %bh_rotors;
    level.scr_model["chopper"] = "vehicle_pavelow";
    level.scr_animtree["chopper"] = #animtree;
    level.scr_animtree["car"] = #animtree;
    level.scr_anim["car"]["destroyed_car"] = %h2_favela_ending_crushedcar;
}
#using_animtree("script_model");

_id_BAF7()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h2_favela_escape_truck_fence_break_a_anim"] = %h2_favela_escape_truck_fence_break_a_anim;
    level.scr_anim["exploder_script_model"]["h2_favela_escape_truck_fence_break_b_anim"] = %h2_favela_escape_truck_fence_break_b_anim;
    level.scr_anim["exploder_script_model"]["h2_favela_escape_truck_fence_break_c_anim"] = %h2_favela_escape_truck_fence_break_c_anim;
}
