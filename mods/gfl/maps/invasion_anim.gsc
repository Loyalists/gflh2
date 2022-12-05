// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A902()
{
    vehicles();
    anims();
    dialog();
    script_models();
    player();
}
#using_animtree("script_model");

script_models()
{
    level.scr_animtree["tangled_chute_parachute"] = #animtree;
    level.scr_anim["tangled_chute_parachute"]["idle"][0] = %parachute_detach_idle;
    level.scr_anim["tangled_chute_parachute"]["end_idle"][0] = %parachute_detach_endidle;
    level.scr_anim["tangled_chute_parachute"]["reaction"] = %parachute_detach_reaction;
    level.scr_anim["tangled_chute_parachute"]["death"] = %parachute_detach_death;
    level.scr_model["tangled_chute_parachute"] = "invasion_parachute_hanging_char_animated";
    level.scr_animtree["chute"] = #animtree;
    level.scr_anim["chute"]["idle"] = %h2_invasion_parachute_hanging_idle;
    level.scr_animtree["roof_landing_parachute"] = #animtree;
    level.scr_anim["roof_landing_parachute"]["roof_landing_parachute"] = %invasion_paratrooper_roof_landing_parachute;
    level.scr_model["roof_landing_parachute"] = "parachute_roof";
    level.scr_animtree["distant_parachute_guy"] = #animtree;
    level.scr_anim["distant_parachute_guy"]["distant_parachute_guy_left1"] = %paratrooper_jump_lefta_chute;
    level.scr_anim["distant_parachute_guy"]["distant_parachute_guy_right1"] = %paratrooper_jump_righta_chute;
    level.scr_anim["distant_parachute_guy"]["distant_parachute_guy_left2"] = %paratrooper_jump_leftb_chute;
    level.scr_anim["distant_parachute_guy"]["distant_parachute_guy_right2"] = %paratrooper_jump_rightb_chute;
    level.scr_model["distant_parachute_guy"] = "parachute_deploy_low_with_body";
    level.scr_animtree["paradrop_cargo_tank_chuteA"] = #animtree;
    level.scr_anim["paradrop_cargo_tank_chuteA"]["paradrop_cargo_tank_chuteA"] = %paradrop_cargo_tank_chutea;
    level.scr_model["paradrop_cargo_tank_chuteA"] = "parachute_tank_animated_low";
    level.scr_animtree["paradrop_cargo_tank_chuteB"] = #animtree;
    level.scr_anim["paradrop_cargo_tank_chuteB"]["paradrop_cargo_tank_chuteB"] = %paradrop_cargo_tank_chuteb;
    level.scr_model["paradrop_cargo_tank_chuteB"] = "parachute_tank_animated_low";
    level.scr_animtree["paradrop_cargo_tank_chuteC"] = #animtree;
    level.scr_anim["paradrop_cargo_tank_chuteC"]["paradrop_cargo_tank_chuteC"] = %paradrop_cargo_tank_chutec;
    level.scr_model["paradrop_cargo_tank_chuteC"] = "parachute_tank_animated_low";
    level.scr_animtree["bmp_chute_paradrop"] = #animtree;
    level.scr_anim["bmp_chute_paradrop"]["bmp_chute_paradrop"] = %paradrop_cargo_chute;
    level.scr_model["bmp_chute_paradrop"] = "parachute_cargo_animated";
    level._id_A98C = [];
    level._id_A98C[0] = "exploder_script_model";
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h2_invasion_firsthouse_break_a_anim"] = %h2_invasion_firsthouse_break_a_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_firsthouse_break_b_anim"] = %h2_invasion_firsthouse_break_b_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_firsthouse_break_c_anim"] = %h2_invasion_firsthouse_break_c_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_firsthouse_break_d_anim"] = %h2_invasion_firsthouse_break_d_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_firsthouse_break_e_anim"] = %h2_invasion_firsthouse_break_e_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_firsthouse_break_f_anim"] = %h2_invasion_firsthouse_break_f_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_firsthouse_break_g_anim"] = %h2_invasion_firsthouse_break_g_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_firsthouse_break_h_anim"] = %h2_invasion_firsthouse_break_h_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_whitehouse_break_a_anim"] = %h2_invasion_whitehouse_break_a_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_whitehouse_break_b_anim"] = %h2_invasion_whitehouse_break_b_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_whitehouse_break_c_anim"] = %h2_invasion_whitehouse_break_c_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_whitehouse_break_d_anim"] = %h2_invasion_whitehouse_break_d_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_whitehouse_break_e_anim"] = %h2_invasion_whitehouse_break_e_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_whitehouse_break_f_anim"] = %h2_invasion_whitehouse_break_f_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_whitehouse_break_g_anim"] = %h2_invasion_whitehouse_break_g_anim;
    level.scr_anim["exploder_script_model"]["h2_invasion_whitehouse_break_h_anim"] = %h2_invasion_whitehouse_break_h_anim;
    level.scr_model["h2_laatpv_ending_weapon"] = "h2_weapon_scar_h_reflex";
    level.scr_animtree["h2_laatpv_ending_weapon"] = #animtree;
    level.scr_anim["h2_laatpv_ending_weapon"]["h2_laatpv_outro_in"] = %h2_invasion_ending_weapon_climbin;
    level.scr_model["h2_wires_animated"] = "dcburning_commerce_wires1_pho_anim";
    level.scr_animtree["h2_wires_animated"] = #animtree;
    level.scr_anim["h2_wires_animated"]["h2_wires_animated"][0] = %h2_dcburning_commerce_wires1_idle;
    level.scr_animtree["h2_nates_beam_destruction"] = #animtree;
    level.scr_model["h2_nates_beam_destruction"] = "h2_inv_nates_wood_beam_destruct_anim";
    level.scr_anim["h2_nates_beam_destruction"]["h2_nates_beam_destruction"] = %h2_inv_nates_beam_destruction;
}
#using_animtree("vehicles");

vehicles()
{
    level.scr_animtree["btr_ground_smash"] = #animtree;
    level.scr_anim["btr_ground_smash"]["btr_ground_smash"] = %invasion_btr_crash_btr;
    level.scr_model["btr_ground_smash"] = "vehicle_btr80";
    level.scr_animtree["btr_squashedcar"] = #animtree;
    level.scr_anim["btr_squashedcar"]["btr_squashedcar"] = %invasion_btr_crash_squashedcar;
    level.scr_model["btr_squashedcar"] = "vehicle_80s_sedan1_tankcrush";
    level.scr_animtree["bmp_paradrop"] = #animtree;
    level.scr_anim["bmp_paradrop"]["bmp_paradrop"] = %h2_paradrop_cargo_vehicle_btr80;
    level.scr_model["bmp_paradrop"] = "vehicle_btr80_static_low";
    level.scr_animtree["anatov_opendoors"] = #animtree;
    level.scr_anim["anatov_opendoors"]["anatov_opendoors"] = %paratrooper_jet_opendoors;
    var_0 = spawnstruct();
    var_0.anims = [];
    var_0.anims["front"] = %mi17_heli_hitreact_front;
    var_0.anims["rear"] = %mi17_heli_hitreact_rear;
    var_0.anims["left"] = %mi17_heli_hitreact_left;
    var_0.anims["right"] = %mi17_heli_hitreact_right;
    var_0._id_D138 = 0;
    var_0._id_C581 = 1;
    maps\_vehicle::_id_ABA7( "script_vehicle_mi28", undefined, var_0 );
}
#using_animtree("player");

player()
{
    level.scr_model["viewbody"] = "h2_gfl_ump9_viewbody";
    level.scr_animtree["viewbody"] = #animtree;
    level.scr_anim["viewbody"]["invasion_intro_jeepride"] = %h2_invasion_intro_jeepride_player;
    maps\_anim::addnotetrack_customfunction( "viewbody", "btr_shot", maps\invasion::latvee_destroyer_fire_notetrack, "invasion_intro_jeepride" );
    maps\_anim::addnotetrack_customfunction( "viewbody", "latvee_explode", maps\invasion::latvee_player_explode_notetrack, "invasion_intro_jeepride" );
    level.scr_model["carry_sentry_player"] = "h2_gfl_ump9_viewhands_player";
    level.scr_anim["viewbody"]["h2_laatpv_outro_in"] = %h2_invasion_ending_vm_climbin;
    level.scr_anim["viewbody"]["h2_laatpv_outro_loop"][0] = %h2_invasion_ending_vm_idle;
}
#using_animtree("generic_human");

anims()
{
    level.scr_anim["taco"]["invasion_intro_jeepride"] = %h2_invasion_intro_jeepride_dunn;
    level.scr_anim["raptor"]["invasion_intro_jeepride"] = %h2_invasion_intro_jeepride_foley;
    level.scr_anim["worm"]["invasion_intro_jeepride"] = %h2_invasion_intro_jeepride_soldier;
    level.scr_anim["generic"]["invasion_latvee_exit_v1_guy1_idle"][0] = %invasion_latvee_exit_v1_guy1_idle;
    level.scr_anim["generic"]["invasion_latvee_exit_v1_guy1_react"] = %invasion_latvee_exit_v1_guy1_react;
    maps\_anim::addnotetrack_customfunction( "generic", "explosion_react1", maps\invasion::_id_B459, "invasion_latvee_exit_v1_guy1_react" );
    maps\_anim::addnotetrack_customfunction( "generic", "explosion_react2", maps\invasion::_id_BF4E, "invasion_latvee_exit_v1_guy1_react" );
    level.scr_anim["generic"]["invasion_latvee_exit_v1_passenger_idle"][0] = %invasion_latvee_exit_v1_passenger_idle;
    level.scr_anim["generic"]["invasion_latvee_exit_v1_passenger_react"] = %invasion_latvee_exit_v1_passenger_react;
    level.scr_anim["generic"]["invasion_parachute_ground_detach_idle"][0] = %invasion_parachute_ground_detach_idle;
    level.scr_anim["generic"]["tangled_guy_trys_to_free_self"] = %invasion_parachute_ground_detach_reaction;
    level.scr_anim["generic"]["invasion_parachute_ground_detach_death\\t"] = %invasion_parachute_ground_detach_death;
    level.scr_anim["generic"]["distant_parachute_guy_left1"] = %paratrooper_jump_lefta_guy;
    level.scr_anim["generic"]["distant_parachute_guy_right1"] = %paratrooper_jump_righta_guy;
    level.scr_anim["generic"]["distant_parachute_guy_left2"] = %paratrooper_jump_leftb_guy;
    level.scr_anim["generic"]["distant_parachute_guy_right2"] = %paratrooper_jump_rightb_guy;
    level.scr_anim["generic"]["pronehide_dive"] = %hunted_dive_2_pronehide_v1;
    level.scr_anim["generic"]["roof_landing_parachute"] = %invasion_paratrooper_roof_landing;
    level.scr_anim["generic"]["rolldeath"] = %invasion_paratrooper_roof_landing_rolldeath;
    level.scr_anim["generic"]["crawldeath"] = %invasion_paratrooper_roof_landing_crawldeath;
    maps\_anim::addnotetrack_customfunction( "generic", "roll_death", ::_id_CB03, "roof_landing_parachute" );
    maps\_anim::addnotetrack_customfunction( "generic", "crawl_death_start", ::_id_CFC7, "roof_landing_parachute" );
    maps\_anim::addnotetrack_customfunction( "generic", "crawl_death", ::_id_B225, "roof_landing_parachute" );
    maps\_anim::addnotetrack_flag( "generic", "roll_death", "roll_death", "roof_landing_parachute" );
    maps\_anim::addnotetrack_flag( "generic", "crawl_death_start", "crawl_death_start", "roof_landing_parachute" );
    maps\_anim::addnotetrack_flag( "generic", "crawl_death", "crawl_death", "roof_landing_parachute" );
    level.scr_anim["generic"]["invasion_vehicle_cover_dialogue_guy1"] = %invasion_vehicle_cover_dialogue_guy1;
    level.scr_anim["generic"]["invasion_vehicle_cover_dialogue_guy1_idle"][0] = %invasion_vehicle_cover_dialogue_guy1_idle;
    level.scr_anim["generic"]["invasion_vehicle_cover_dialogue_guy2"] = %invasion_vehicle_cover_dialogue_guy2;
    level.scr_anim["generic"]["turret_guy_panic"] = %h2_invasion_latvee_explosion_turret_panic;
    level.scr_anim["generic"]["convoy_driver_idle"][0] = %h2_invasion_ending_driver_idle;
    level.scr_anim["generic"]["convoy_driver_nod"] = %h2_invasion_ending_driver_nod;
    maps\_anim::addnotetrack_customfunction( "generic", "dialog_inv_six_gimmesitrep", ::_id_AA58, "invasion_vehicle_cover_dialogue_guy2" );
    maps\_anim::addnotetrack_customfunction( "generic", "dialog_inv_six_status", ::_id_C0E9, "invasion_vehicle_cover_dialogue_guy2" );
    maps\_anim::addnotetrack_customfunction( "generic", "dialog_inv_six_whatelse", ::_id_D314, "invasion_vehicle_cover_dialogue_guy2" );
    maps\_anim::addnotetrack_customfunction( "generic", "dialog_inv_six_sentrygunsouth", ::_id_C770, "invasion_vehicle_cover_dialogue_guy2" );
    maps\_anim::addnotetrack_customfunction( "generic", "dunn_checkout", ::_id_BA4B, "invasion_vehicle_cover_dialogue_guy2" );
    maps\_anim::addnotetrack_customfunction( "generic", "dialog_inv_sgw_meatlocker", ::_id_D17B, "invasion_vehicle_cover_dialogue_guy1" );
    maps\_anim::addnotetrack_customfunction( "generic", "dialog_inv_sgw_unconscious", ::_id_CA83, "invasion_vehicle_cover_dialogue_guy1" );
    maps\_anim::addnotetrack_customfunction( "generic", "dialog_inv_sgw_supplydrop", ::_id_AC16, "invasion_vehicle_cover_dialogue_guy1" );
}

_id_AA58( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_gimmesitrep" );
}

_id_C0E9( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_status" );
}

_id_D314( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_whatelse" );
}

_id_C770( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_sentrygunsouth" );
}

_id_BA4B( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_checkout" );
}

_id_D17B( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_meatlocker" );
}

_id_CA83( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_unconscious" );
}

_id_AC16( var_0 )
{
    common_scripts\utility::flag_set( "notetrack_supplydrop" );
}

_id_AB60()
{
    self.ignoreme = 1;
    thread maps\_utility::magic_bullet_shield();
    self.deathanim = %invasion_parachute_ground_detach_death;
    var_0 = getent( "tangled_parachute_guy_node", "targetname" );
    var_1 = maps\_utility::spawn_anim_model( "tangled_chute_parachute" );
    var_0 thread maps\_anim::anim_loop_solo( var_1, "idle", "stop_tangled_chute_idle" );
    var_0 thread maps\_anim::anim_generic_loop( self, "invasion_parachute_ground_detach_idle", "stop_tangled_guy_idle" );

    while ( !maps\_utility::_id_D325( self geteye() ) )
        wait 0.05;

    self.allowdeath = 1;
    thread maps\_utility::stop_magic_bullet_shield();
    thread _id_D1D7( var_0, var_1 );
    self endon( "death" );
    wait 1;
    thread _id_CF41( var_0, var_1 );
}

_id_CF41( var_0, var_1 )
{
    self endon( "death" );
    var_0 notify( "stop_tangled_chute_idle" );
    var_0 notify( "stop_tangled_guy_idle" );
    self.ignoreme = 0;
    var_0 thread maps\_anim::anim_single_solo( var_1, "reaction" );
    var_0 maps\_anim::anim_generic( self, "tangled_guy_trys_to_free_self" );
    var_0 thread maps\_anim::anim_loop_solo( var_1, "end_idle" );
    self.deathanim = undefined;
    var_0 notify( "he got free" );
}

_id_D1D7( var_0, var_1 )
{
    var_0 endon( "he got free" );
    self waittill( "death" );
    var_0 notify( "stop_tangled_chute_idle" );
    var_0 maps\_anim::anim_single_solo( var_1, "death" );
    var_0 thread maps\_anim::anim_loop_solo( var_1, "end_idle" );
}

_id_CCE0()
{
    wait 3;
    maps\_utility::activate_trigger_with_targetname( "pizza_rushers_trigger" );
}

_id_AB33()
{
    wait 3;
    var_0 = getent( "burning_tree", "script_noteworthy" );
    var_0.animname = "burning_tree";
    var_0 maps\_utility::assign_animtree();
    var_0 maps\_anim::anim_loop_solo( var_0, "tree_oak_fire", "stop_burning_tree" );
}

_id_AB25( var_0 )
{
    self linkto( level._id_C7B1, "tag_guy1" );
    level._id_C7B1 thread maps\_anim::anim_generic_loop( self, "invasion_latvee_exit_v1_guy1_idle", "stop_front_latvee_anims", "tag_guy1" );
    level waittill( "latvee_blows_up" );
    self notify( "stop_front_latvee_anims" );
    var_0 thread maps\_anim::anim_generic( self, "invasion_latvee_exit_v1_guy1_react" );
    level._id_C7B1 waittill( "reached_end_node" );
    self unlink();
    var_0 unlink();
    maps\_utility::waittill_match_or_timeout( "single anim", "end", 1000 );
    self.allowdeath = 1;
    self.a.nodeath = 1;
    self kill();
}

_id_D0C7( var_0 )
{
    self linkto( level._id_C7B1, "tag_passenger" );
    level._id_C7B1 thread maps\_anim::anim_generic_loop( self, "invasion_latvee_exit_v1_passenger_idle", "stop_front_latvee_anims", "tag_passenger" );
    level waittill( "latvee_blows_up" );
    self notify( "stop_front_latvee_anims" );
    var_0 thread maps\_anim::anim_generic( self, "invasion_latvee_exit_v1_passenger_react" );
    level._id_C7B1 waittill( "reached_end_node" );
    self unlink();
    var_0 unlink();
    maps\_utility::waittill_match_or_timeout( "single anim", "end", 1000 );
    self.allowdeath = 1;
    self.a.nodeath = 1;
    self kill();
}

_id_C63C( var_0 )
{
    self.allowdeath = 0;
    self.noragdoll = 1;

    if ( isdefined( var_0 ) )
        self._id_A814 = 1;

    self.health = 1;
    var_1 = spawn( "script_origin", self.origin );
    var_1.angles = self.angles;
    var_2 = maps\_utility::spawn_anim_model( "roof_landing_parachute" );
    var_1 thread maps\_anim::anim_generic( self, "roof_landing_parachute" );
    var_1 maps\_anim::anim_single_solo( var_2, "roof_landing_parachute" );
    var_2 delete();
    level notify( "roof_landing_anim_finished" );
}

_id_CB03( var_0 )
{
    if ( isdefined( var_0._id_A814 ) )
        return;

    var_0.skipdeathanim = 1;
    thread maps\_anim::anim_generic( var_0, "rolldeath" );
    wait 0.5;
    var_0.allowdeath = 1;
    var_0 kill();
}

_id_CFC7( var_0 )
{
    if ( isdefined( var_0._id_A814 ) )
        return;

    level endon( "crawl_death_finished" );
    wait 2;
    var_0.skipdeathanim = 1;
    var_0 thread maps\_anim::anim_generic( var_0, "crawldeath" );
    wait 0.5;
    var_0.allowdeath = 1;
    var_0 kill();
}

_id_B225( var_0 )
{
    var_0.allowdeath = 0;
    level notify( "crawl_death_finished" );
    level waittill( "roof_landing_anim_finished" );
    var_0 delete();
}

convoy_latvee_remap_dismount_anims()
{
    convoy_latvee_remap_dismount_anims_guys();
    convoy_latvee_remap_dismount_anims_vehicle();
}

convoy_latvee_remap_dismount_anims_guys()
{
    level.vehicle_aianims["script_vehicle_laatpv_minigun_physics"][1].getout = %latvee_dismount_frontr;
    level.vehicle_aianims["script_vehicle_laatpv_minigun_physics"][2].getout = %latvee_dismount_backl;
    level.vehicle_aianims["script_vehicle_laatpv_minigun_physics"][3].getout = %latvee_dismount_backr;
}
#using_animtree("vehicles");

convoy_latvee_remap_dismount_anims_vehicle()
{
    level.vehicle_aianims["script_vehicle_laatpv_minigun_physics"][1].vehicle_getoutanim = %latvee_dismount_frontr_door;
    level.vehicle_aianims["script_vehicle_laatpv_minigun_physics"][2].vehicle_getoutanim = %latvee_dismount_backl_door;
    level.vehicle_aianims["script_vehicle_laatpv_minigun_physics"][3].vehicle_getoutanim = %latvee_dismount_backr_door;
}

dialog()
{
    level.scr_sound["raptor"]["inv_six_gotbmp"] = "inv_six_gotbmp";
    level.scr_sound["raptor"]["inv_six_teamthisway"] = "inv_six_teamthisway";
    level.scr_sound["raptor"]["inv_six_300meast"] = "inv_six_300meast";
    level.scr_sound["raptor"]["inv_six_hangright"] = "inv_six_hangright";
    level.scr_sound["raptor"]["inv_six_viscrashsite"] = "inv_six_viscrashsite";
    level.scr_sound["raptor"]["inv_six_grabrpg"] = "inv_six_grabrpg";
    level.scr_sound["raptor"]["inv_six_rpgsupplydrop"] = "inv_six_rpgsupplydrop";
    level.scr_sound["raptor"]["inv_six_takepoint"] = "inv_six_takepoint";
    level.scr_sound["raptor"]["inv_six_truck12"] = "inv_six_truck12";
    level.scr_sound["taco"]["inv_tco_juggernaut"] = "inv_tco_juggernaut";
    level.scr_sound["raptor"]["inv_six_hitflashbang"] = "inv_six_hitflashbang";
    level.scr_sound["raptor"]["inv_six_stayback"] = "inv_six_stayback";
    level.scr_sound["raptor"]["inv_six_aimforthehead"] = "inv_six_aimforthehead";
    level.scr_sound["raptor"]["inv_six_headshot"] = "inv_six_headshot";
    level.scr_sound["raptor"]["inv_six_dontengageapc"] = "inv_six_dontengageapc";
    level.scr_sound["raptor"]["inv_six_getbackfromapc"] = "inv_six_getbackfromapc";
    level.scr_sound["raptor"]["inv_six_closeairsupport"] = "inv_six_closeairsupport";
    level.scr_sound["raptor"]["inv_six_purplebuilding"] = "inv_six_purplebuilding";
    level.scr_sound["raptor"]["inv_six_gimmesitrep"] = "inv_six_gimmesitrep";
    level.scr_sound["wells"]["inv_sgw_meatlocker"] = "inv_sgw_meatlocker";
    level.scr_sound["raptor"]["inv_six_status"] = "inv_six_status";
    level.scr_sound["wells"]["inv_sgw_unconscious"] = "inv_sgw_unconscious";
    level.scr_sound["raptor"]["inv_six_whatelse"] = "inv_six_whatelse";
    level.scr_sound["wells"]["inv_sgw_supplydrop"] = "inv_sgw_supplydrop";
    level.scr_sound["raptor"]["inv_six_sentrygunsouth"] = "inv_six_sentrygunsouth";
    level.scr_sound["raptor"]["inv_six_antitank"] = "inv_six_antitank";
    level.scr_sound["wells"]["inv_sgw_allout"] = "inv_sgw_allout";
    level.scr_sound["raptor"]["inv_six_rogerthat"] = "inv_six_rogerthat";
    level.scr_radio["inv_six_rogerthat"] = "inv_six_rogerthat";
    level.scr_radio["inv_six_ladderinkitchen"] = "inv_six_ladderinkitchen";
    level.scr_radio["inv_six_gettoroof"] = "inv_six_gettoroof";
    level.scr_radio["inv_six_onroofyet"] = "inv_six_onroofyet";
    level.scr_radio["inv_six_headsupladies"] = "inv_six_headsupladies";
    level.scr_radio["inv_six_thermaloptics"] = "inv_six_thermaloptics";
    level.scr_radio["inv_six_hadenough"] = "inv_six_hadenough";
    level.scr_radio["inv_six_checkammo"] = "inv_six_checkammo";
    level.scr_radio["inv_wrm_whatwasthat"] = "inv_wrm_whatwasthat";
    level.scr_radio["inv_six_offtheroof"] = "inv_six_offtheroof";
    level.scr_radio["inv_six_bmpsfromnorth"] = "inv_six_bmpsfromnorth";
    level.scr_radio["inv_tco_rogerthat"] = "inv_tco_rogerthat";
    level.scr_sound["taco"]["inv_tco_controlrig"] = "inv_tco_controlrig";
    level.scr_sound["taco"]["inv_tco_pickupcontrolrig"] = "inv_tco_pickupcontrolrig";
    level.scr_sound["taco"]["inv_tco_incoming"] = "inv_tco_incoming";
    level.scr_sound["taco"]["inv_tco_backdoor"] = "inv_tco_backdoor";
    level.scr_radio["inv_six_wastebmpsnow"] = "inv_six_wastebmpsnow";
    level.scr_radio["inv_six_fastmovers"] = "inv_six_fastmovers";
    level.scr_radio["inv_tco_stillthere"] = "inv_tco_stillthere";
    level.scr_radio["inv_six_newplan"] = "inv_six_newplan";
    level.scr_radio["inv_six_secureburgertown"] = "inv_six_secureburgertown";
    level.scr_radio["inv_six_listenup"] = "inv_six_listenup";
    level.scr_radio["inv_six_anotherpass"] = "inv_six_anotherpass";
    level.scr_radio["inv_six_hostilesinbt"] = "inv_six_hostilesinbt";
    level.scr_radio["inv_six_clearbtroof"] = "inv_six_clearbtroof";
    level.scr_radio["inv_six_gotpresident"] = "inv_six_gotpresident";
    level.scr_radio["inv_six_keepoffme"] = "inv_six_keepoffme";
    level.scr_sound["raptor"]["inv_six_keepoffme"] = "inv_six_keepoffme";
    level.scr_radio["inv_tco_incomingnorth"] = "inv_tco_incomingnorth";
    level.scr_radio["inv_tco_contactnorth"] = "inv_tco_contactnorth";
    level.scr_radio["inv_tco_incomingsouth"] = "inv_tco_incomingsouth";
    level.scr_radio["inv_tco_contactsouth"] = "inv_tco_contactsouth";
    level.scr_radio["inv_tco_contactnw"] = "inv_tco_contactnw";
    level.scr_radio["inv_tco_contactse"] = "inv_tco_contactse";
    level.scr_radio["inv_tco_incominghelo"] = "inv_tco_incominghelo";
    level.scr_radio["inv_six_getoffroof"] = "inv_six_getoffroof";
    level.scr_radio["inv_six_convoyshere"] = "inv_six_convoyshere";
    level.scr_radio["inv_hqr_sitrep"] = "inv_hqr_sitrep";
    level.scr_radio["inv_six_cargosecure"] = "inv_six_cargosecure";
    level.scr_radio["inv_hqr_goodjob"] = "inv_hqr_goodjob";
    level.scr_sound["raptor"]["inv_six_ourobjective"] = "inv_six_ourobjective";
    level.scr_sound["raptor"]["inv_six_pickuprpg"] = "inv_six_pickuprpg";
    level.scr_sound["raptor"]["inv_six_pickupthatrpg"] = "inv_six_pickupthatrpg";
    level.scr_sound["raptor"]["inv_six_morerockets"] = "inv_six_morerockets";
    level.scr_sound["raptor"]["inv_six_anotherrpg"] = "inv_six_anotherrpg";
    level.scr_sound["raptor"]["inv_six_pickup"] = "inv_six_pickup";
    level.scr_sound["raptor"]["inv_six_getmore"] = "inv_six_getmore";
    level.scr_radio["inv_tco_hesdown"] = "inv_tco_hesdown";
    level.scr_sound["taco"]["inv_tco_hesdown"] = "inv_tco_hesdown";
    level.scr_radio["inv_six_niceoneheli"] = "inv_six_niceoneheli";
    level.scr_sound["raptor"]["inv_six_niceoneheli"] = "inv_six_niceoneheli";
    level.scr_radio["inv_six_niceoneguys"] = "inv_six_niceoneguys";
    level.scr_sound["raptor"]["inv_six_niceoneguys"] = "inv_six_niceoneguys";
    level.scr_radio["inv_six_staywithus"] = "inv_six_staywithus";
    level.scr_sound["raptor"]["inv_six_staywithus"] = "inv_six_staywithus";
    level.scr_radio["inv_six_onme"] = "inv_six_onme";
    level.scr_sound["raptor"]["inv_six_onme"] = "inv_six_onme";
    level.scr_radio["inv_six_getoverhere"] = "inv_six_getoverhere";
    level.scr_radio["inv_six_gogogo"] = "inv_six_gogogo";
    level.scr_sound["raptor"]["inv_six_gogogo"] = "inv_six_gogogo";
    level.scr_radio["inv_six_crashsite"] = "inv_six_crashsite";
    level.scr_radio["inv_six_northofnates"] = "inv_six_northofnates";
    level.scr_radio["inv_six_2dozen"] = "inv_six_2dozen";
    level.scr_radio["inv_tco_usingsmoke"] = "inv_tco_usingsmoke";
    level.scr_radio["inv_six_getoffroof2"] = "inv_six_getoffroof2";
    level.scr_radio["inv_six_getoffroofnow"] = "inv_six_getoffroofnow";
    level.scr_radio["inv_six_regroup"] = "inv_six_regroup";
    level.scr_radio["inv_six_regroupinrest"] = "inv_six_regroupinrest";
    level.scr_radio["inv_six_shiftfiren"] = "inv_six_shiftfiren";
    level.scr_radio["inv_six_contactsn"] = "inv_six_contactsn";
    level.scr_radio["inv_tco_smokescrnth"] = "inv_tco_smokescrnth";
    level.scr_radio["inv_six_switchthermal"] = "inv_six_switchthermal";
    level.scr_radio["inv_six_readytocover"] = "inv_six_readytocover";
    level.scr_radio["inv_six_coverusgo"] = "inv_six_coverusgo";
    level.scr_radio["inv_six_needtomove"] = "inv_six_needtomove";
    level.scr_radio["inv_six_whatsholdup"] = "inv_six_whatsholdup";
    level.scr_radio["inv_six_bmpspottedyou"] = "inv_six_bmpspottedyou";
    level.scr_radio["inv_six_bmphasavisual"] = "inv_six_bmphasavisual";
    level.scr_radio["inv_six_behindsolid"] = "inv_six_behindsolid";
    level.scr_radio["inv_six_bmplostyou"] = "inv_six_bmplostyou";
    level.scr_radio["inv_six_bmplostyoumove"] = "inv_six_bmplostyoumove";
    level.scr_radio["inv_six_bmplostyougo"] = "inv_six_bmplostyougo";
    level.scr_radio["inv_six_neutralizearmor"] = "inv_six_neutralizearmor";
    level.scr_radio["inv_six_destroyapcs"] = "inv_six_destroyapcs";
    level.scr_radio["inv_six_stillonebmp"] = "inv_six_stillonebmp";
    level.scr_radio["inv_six_wastethatbmpnow"] = "inv_six_wastethatbmpnow";
    level.scr_radio["inv_six_gotthepresident"] = "inv_six_gotthepresident";
    level.scr_radio["inv_six_friedlyconvoy"] = "inv_six_friedlyconvoy";
    level.scr_sound["raptor"]["inv_six_paratrooper"] = "inv_six_paratrooper";
    level.scr_sound["raptor"]["inv_six_enemyptroop"] = "inv_six_enemyptroop";
    level.scr_sound["raptor"]["inv_six_rusptroop"] = "inv_six_rusptroop";
    level.scr_sound["taco"]["inv_tco_rogerthat"] = "inv_tco_rogerthat";
    level.scr_radio["inv_six_shiftfirew"] = "inv_six_shiftfirew";
    level.scr_radio["inv_six_contactsw"] = "inv_six_contactsw";
    level.scr_radio["inv_tco_smokescrwest"] = "inv_tco_smokescrwest";
    level.scr_radio["inv_six_overwatch"] = "inv_six_overwatch";
    level.scr_radio["inv_tco_regroupsquad"] = "inv_tco_regroupsquad";
    level.scr_radio["inv_six_roachonme"] = "inv_six_roachonme";
    level.scr_radio["inv_six_backhere"] = "inv_six_backhere";
    level.scr_radio["inv_six_theinfantry"] = "inv_six_theinfantry";
    level.scr_radio["inv_six_thatarmor"] = "inv_six_thatarmor";
    level.scr_radio["inv_gm1_eastof95"] = "inv_gm1_eastof95";
    level.scr_radio["inv_gm2_airsupport"] = "inv_gm2_airsupport";
    level.scr_radio["inv_gm3_cutoff"] = "inv_gm3_cutoff";
    level.scr_radio["inv_gm4_brokenarrow"] = "inv_gm4_brokenarrow";
    level.scr_radio["inv_gm1_495and50"] = "inv_gm1_495and50";
    level.scr_sound["raptor"]["inv_six_reqairsupport"] = "inv_six_reqairsupport";
    level.scr_sound["raptor"]["inv_hqr_engaged"] = "inv_hqr_engaged";
    level.scr_sound["raptor"]["inv_six_onfoot"] = "inv_six_onfoot";
    level.scr_sound["raptor"]["inv_hqr_goodluck"] = "inv_hqr_goodluck";
    level.scr_radio["inv_six_convoyshere"] = "inv_six_convoyshere";
    level.scr_radio["inv_six_southofbtown"] = "inv_six_southofbtown";
    level.scr_radio["inv_tco_backtoconvoy"] = "inv_tco_backtoconvoy";
    level.scr_sound["raptor"]["inv_six_staybehind"] = "inv_six_staybehind";
    level.scr_sound["raptor"]["inv_six_throwsemtex"] = "inv_six_throwsemtex";
    level.scr_sound["raptor"]["inv_six_getsemtex"] = "inv_six_getsemtex";
    level.scr_sound["raptor"]["inv_six_destroy"] = "inv_six_destroy";
    level.scr_radio["inv_hqr_enemyhelo"] = "inv_hqr_enemyhelo";
    level.scr_radio["inv_hqr_capunavail"] = "inv_hqr_capunavail";
    level.scr_radio["inv_six_takedown"] = "inv_six_takedown";
    level.scr_radio["inv_tco_roofofnates"] = "inv_tco_roofofnates";
    level.scr_radio["inv_tco_killthathelo"] = "inv_tco_killthathelo";
    level.scr_radio["inv_tco_dispatchchopper"] = "inv_tco_dispatchchopper";
    level.scr_radio["inv_tco_insidediner"] = "inv_tco_insidediner";
    level.scr_radio["inv_hqr_relaygol1"] = "inv_hqr_relaygol1";
    level.scr_radio["inv_tco_eyesup"] = "inv_tco_eyesup";
    level.scr_radio["inv_six_anotherhelo"] = "inv_six_anotherhelo";
    level.scr_radio["inv_six_beforeconvoy"] = "inv_six_beforeconvoy";
    level.scr_radio["inv_six_antiaircraft"] = "inv_six_antiaircraft";
    level.scr_radio["inv_six_takegunship"] = "inv_six_takegunship";
    level.scr_radio["inv_tco_firedmissile"] = "inv_tco_firedmissile";
    level.scr_radio["inv_tco_uavoffline"] = "inv_tco_uavoffline";
    level.scr_radio["inv_hqr_enemynorth"] = "inv_hqr_enemynorth";
    level.scr_radio["inv_hqr_banktonorth"] = "inv_hqr_banktonorth";
    level.scr_radio["inv_hqr_footmobiles"] = "inv_hqr_footmobiles";
    level.scr_radio["inv_hqr_southeast"] = "inv_hqr_southeast";
    level.scr_radio["inv_hqr_visualse"] = "inv_hqr_visualse";
    level.scr_radio["inv_hqr_tacojoint"] = "inv_hqr_tacojoint";
    level.scr_radio["inv_hqr_novagasstation"] = "inv_hqr_novagasstation";
    level.scr_radio["inv_hqr_enemywest"] = "inv_hqr_enemywest";
    level.scr_radio["inv_hqr_dinerwest"] = "inv_hqr_dinerwest";
    level.scr_sound["raptor"]["inv_hqr_engaged2"] = "inv_hqr_engaged2";
    level.scr_sound["raptor"]["inv_six_onfoot2"] = "inv_six_onfoot2";
    level.scr_sound["raptor"]["inv_tco_fourselves"] = "inv_tco_fourselves";
    level.scr_sound["taco"]["inv_six_prettymuch"] = "inv_six_prettymuch";
    level.scr_radio["inv_tco_uavop"] = "inv_tco_uavop";
    level.scr_radio["inv_tco_uavop2"] = "inv_tco_uavop2";
    level.scr_radio["inv_six_killthatsob"] = "inv_six_killthatsob";
    level.scr_radio["inv_six_killthatsob2"] = "inv_six_killthatsob2";
    level.scr_radio["inv_six_onemore"] = "inv_six_onemore";
    level.scr_radio["inv_six_gotthepresident2"] = "inv_six_gotthepresident2";
    level.scr_radio["inv_six_theinfantry2"] = "inv_six_theinfantry2";
    level.scr_radio["inv_tco_roofofnates2"] = "inv_tco_roofofnates2";
    level.scr_radio["inv_tco_killthathelo2"] = "inv_tco_killthathelo2";
    level.scr_radio["inv_six_checktheroof"] = "inv_six_checktheroof";
    level.scr_radio["inv_six_supplydroponroof"] = "inv_six_supplydroponroof";
    level.scr_radio["inv_tco_dispatchchopper2"] = "inv_tco_dispatchchopper2";
    level.scr_radio["inv_tco_nexttostation"] = "inv_tco_nexttostation";
    level.scr_radio["inv_tco_dineruav"] = "inv_tco_dineruav";
    level.scr_radio["inv_six_sitreponraptor"] = "inv_six_sitreponraptor";
    level.scr_radio["inv_tco_secureandstable"] = "inv_tco_secureandstable";
    level.scr_radio["inv_six_lockandload"] = "inv_six_lockandload";
    level.scr_radio["inv_six_onthree"] = "inv_six_onthree";
    level.scr_radio["inv_six_one"] = "inv_six_one";
    level.scr_radio["inv_six_two"] = "inv_six_two";
    level.scr_radio["inv_six_three"] = "inv_six_three";
    level.scr_radio["inv_six_gogogo2"] = "inv_six_gogogo2";
    level.scr_radio["inv_six_concentratefire"] = "inv_six_concentratefire";
    level.scr_radio["inv_six_keepfiring"] = "inv_six_keepfiring";
    level.scr_sound["raptor"]["inv_six_roofbehind"] = "inv_six_roofbehind";
    level.scr_sound["raptor"]["inv_six_enemiesonroof"] = "inv_six_enemiesonroof";
    level.scr_sound["raptor"]["inv_six_insideperim"] = "inv_six_insideperim";
    level.scr_sound["raptor"]["inv_six_turnaround"] = "inv_six_turnaround";
    level._id_AE8C = 1;
    level.scr_radio["uav_offline"] = "inv_hqr_hellfireoffline";
    level.scr_radio["uav_down"] = "inv_hqr_hellfiredown";
    level.scr_radio["uav_down_variant"][0] = "inv_hqr_hellfiredown";
    level.scr_radio["uav_down_variant"][1] = "inv_hqr_predatoroffline";
    level.scr_radio["uav_down_variant"][2] = "inv_hqr_hellfireoffline";
    level.scr_radio["uav_down_variant"][3] = "inv_hqr_predatoroffline2";
    level.scr_radio["inv_hqr_fivenotenkills"] = "inv_hqr_fivenotenkills";
    level.scr_radio["inv_hqr_tenmoreconfirms"] = "inv_hqr_tenmoreconfirms";
    level.scr_radio["inv_hqr_tenpluskia"] = "inv_hqr_tenpluskia";
    level.scr_radio["inv_hqr_fiveplus"] = "inv_hqr_fiveplus";
    level.scr_radio["inv_hqr_another5plus"] = "inv_hqr_another5plus";
    level.scr_radio["inv_hqr_morethanfive"] = "inv_hqr_morethanfive";
    level.scr_radio["inv_hqr_yougotem"] = "inv_hqr_yougotem";
    level.scr_radio["inv_hqr_goodkills"] = "inv_hqr_goodkills";
    level.scr_radio["inv_hqr_directhit"] = "inv_hqr_directhit";
    level.scr_radio["inv_hqr_hesdown"] = "inv_hqr_hesdown";
    level.scr_sound["raptor"]["inv_six_coverofsmoke"] = "inv_six_coverofsmoke";
    level.scr_sound["raptor"]["inv_six_cometoalley"] = "inv_six_cometoalley";
    level.scr_radio["inv_fly_2kcivvies"] = "inv_fly_2kcivvies";
}
