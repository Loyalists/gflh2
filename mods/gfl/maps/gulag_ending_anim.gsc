// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_BC6F()
{
    _id_AF88();
    _id_C13A();
    _id_CD8B();
    _id_D073();
    _id_B6ED();
    _id_B6C5();
}
#using_animtree("generic_human");

_id_AF88()
{
    level.scr_anim["generic"]["run_root"] = %combatrun_forward;
    level.scr_anim["generic"]["reaction_180"] = %run_reaction_180;
    level.scr_anim["generic"]["run_180"] = %run_turn_180;
    level.scr_anim["generic"]["run_duck"] = %run_react_duck;
    level.scr_anim["generic"]["run_flinch"] = %run_react_flinch;
    level.scr_anim["generic"]["run_stumble"] = %run_react_stumble;
    level.scr_anim["generic"]["walk_and_run_loops"] = %walk_and_run_loops;
    level.scr_anim["generic"]["slide_across_car"] = %slide_across_car;
    level.scr_anim["stumble_baddie"]["stumble"] = %dc_burning_bunker_stumble;
    level.scr_anim["stumble_baddie"]["idle"][0] = %h2_dc_burning_bunker_stumble_idle;
    level.scr_anim["price"]["price_breach"] = %h2_gulag_rescuea_price;
    level.scr_anim["chokey"]["price_breach"] = %h2_gulag_rescuea_enemy;
    level.scr_anim["chokey"]["price_rescue"] = %h2_gulag_rescueb_enemy;
    level.scr_anim["price"]["price_rescue"] = %h2_gulag_rescueb_price;
    level.scr_anim["soap"]["price_rescue"] = %h2_gulag_rescueb_soap;
    level.scr_anim["redshirt"]["price_rescue"] = %h2_gulag_rescueb_soldier;
    level.scr_anim["old_soap"]["price_rescue"] = %gulag_rescueb_soldier1_reshoot;
    level.scr_anim["price"]["price_rescue_intro"] = %gulag_rescueb_price_intro;
    maps\_anim::addnotetrack_customfunction( "price", "bang", ::_id_B690, "price_rescue" );
    maps\_anim::addnotetrack_notify( "price", "bang", "explosion", "price_rescue" );
    maps\_anim::addnotetrack_customfunction( "price", "scn_gulag_evac_jet_attack_incomming", ::_id_B462, "price_rescue" );
    level.scr_anim["soap"]["cafe_entrance"] = %h2_gulag_cafeteria_soap;
    level.scr_anim["price"]["cafe_entrance"] = %h2_gulag_cafeteria_price;
    level.scr_anim["redshirt"]["cafe_entrance"] = %h2_gulag_cafeteria_soldier;
    maps\_anim::addnotetrack_dialogue( "redshirt", "dialog", "cafe_entrance", "gulag_wrm_deadend" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "cafe_entrance", "gulag_cmt_whereareyou" );
    level.scr_anim["redshirt"]["evac"] = %h2_gulag_end_evac_soldier;
    level.scr_anim["price"]["evac"] = %h2_gulag_end_evac_price;
    level.scr_anim["soap"]["evac"] = %h2_gulag_end_evac_soap;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "evac", "gulag_pri_doitfast" );
    level.scr_anim["generic"]["gundrop_death"] = %death_explosion_stand_b_v1;
    maps\_anim::addnotetrack_customfunction( "soap", "fire", ::_id_D322, "evac" );
    maps\_anim::addnotetrack_customfunction( "soap", "player", ::_id_CFCC, "evac" );
    level.scr_anim["soap"]["escape"] = %h2_gulag_escapesequence_soap;
    level.scr_anim["price"]["escape"] = %h2_gulag_escapesequence_price;
    level.scr_anim["redshirt"]["escape"] = %h2_gulag_escapesequence_worm;
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "escape", "gulag_cmt_gogogo1" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "escape", "gulag_cmt_ready2jump" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "escape", "gulag_cmt_anotherway" );
    maps\_anim::addnotetrack_dialogue( "soap", "dialog", "escape", "gulag_wrm_thisway" );
}

_id_B690( var_0 )
{
    wait 0.1;
    common_scripts\utility::flag_set( "background_explosion" );
    level.player thread common_scripts\utility::play_loop_sound_on_entity( "scn_gulag_evac_jet_attack_loop", undefined, 1.0, 1.0 );
    thread maps\gulag_aud::_id_AF8E();
    common_scripts\_exploder::exploder( "background_explosion" );
}

_id_D322( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "tag_laser" );
    var_1.angles = var_0 gettagangles( "tag_laser" );
    var_2 = anglestoforward( var_1.angles );
    var_3 = common_scripts\utility::getfx( "flare_start_gulag" );
    playfxontag( var_3, var_1, "tag_origin" );
    var_4 = common_scripts\utility::getfx( "flare_gulag" );
    playfxontag( var_4, var_1, "tag_origin" );
    var_1 thread maps\_utility::play_sound_on_tag( "scn_evac_soap_fires_flare", "tag_origin" );
    var_1 moveto( var_1.origin + var_2 * 2000, 3, 0, 0 );
    wait 4;
    var_1 delete();
}

_id_CFCC( var_0 )
{
    var_0._id_CFCC = 1;
    var_1 = maps\_utility::getentwithflag( "player_uses_rig" );
    var_1 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_set( "player_evac" );

    if ( common_scripts\utility::flag( "player_uses_rig" ) )
        return;

    wait 2;
    thread maps\gulag_ending_code::_id_B3D1( 0 );
    var_2 = 0.4;
    var_3 = 0.1;

    for ( var_4 = 0; var_4 < 25; var_4++ )
    {
        earthquake( var_2, var_3, level.player.origin, 5000 );
        wait(var_3);
        var_2 += 0.01;
    }
}
#using_animtree("player");

_id_C13A()
{
    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_st_ar15_viewbody";
    level.scr_anim["player_rig"]["evac"] = %h2_gulag_end_buried_player;
    level.scr_anim["player_rig"]["fly_away"] = %h2_gulag_end_evac_player;
    level.scr_anim["player_rig"]["hookup"] = %h2_gulag_end_evac_player_hookup;
    level.scr_anim["player_rig"]["idle"][0] = %h2_gulag_end_evac_player_idle;
    level.scr_anim["player_rig"]["price_breach"] = %h2_gulag_rescuea_player;
    level.scr_anim["player_rig"]["price_rescue"] = %h2_gulag_rescueb_player;
    maps\_anim::addnotetrack_customfunction( "player_rig", "black", maps\gulag_ending_code::black_screen );
}

_id_B6ED()
{
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_st_ar15_viewbody";
    level.scr_anim["worldbody"]["player_downed"] = %h2_gulag_cafeteria_playerdowned;
}

_id_B462( var_0 )
{
    common_scripts\utility::play_sound_in_space( "scn_gulag_evac_jet_attack_incomming", ( -4715.05, 1620.07, 461.188 ) );
}
#using_animtree("script_model");

_id_CD8B()
{
    level.scr_animtree["rock"] = #animtree;
    level.scr_model["rock"] = "gulag_rock";
    level.scr_anim["rock"]["evac"] = %h2_gulag_prop_rock;
    level.scr_animtree["rescue_chair"] = #animtree;
    level.scr_model["rescue_chair"] = "com_folding_chair";
    level.scr_anim["rescue_chair"]["rescuea_chair"] = %h2_gulag_rescuea_chair;
    level.scr_anim["rescue_chair"]["rescueb_chair"] = %h2_gulag_rescueb_chair;
    level.scr_animtree["ending_rope1"] = #animtree;
    level.scr_model["ending_rope1"] = "gulag_escape_rope_100ft_part1";
    level.scr_anim["ending_rope1"]["evac"] = %h2_gulag_end_rope;
    level.scr_animtree["ending_rope"] = #animtree;
    level.scr_model["ending_rope"] = "gulag_escape_rope_100ft";
    level.scr_anim["ending_rope"]["evac"] = %gulag_escape_rope;
    level.scr_animtree["player_carabiner"] = #animtree;
    level.scr_model["player_carabiner"] = "h2_weapon_carabiner";
    level.scr_anim["player_carabiner"]["hookup"] = %h2_gulag_end_carabiner;
    level.scr_animtree["1911"] = #animtree;
    level.scr_model["1911"] = "h1_weapon_colt1911_black";
    level.scr_anim["1911"]["price_rescue"] = %h2_gulag_rescueb_pistol;
    level.scr_animtree["strangle_chain"] = #animtree;
    level.scr_anim["strangle_chain"]["escape"] = %h2_gulag_escape_chains;
    level.scr_anim["strangle_chain"]["cafe_entrance"] = %h2_gulag_cafeteria_chains;
    level.scr_anim["strangle_chain"]["evac"] = %h2_gulag_end_chain;
}
#using_animtree("vehicles");

_id_D073()
{
    level.scr_animtree["pavelow"] = #animtree;
    level.scr_model["pavelow"] = "vehicle_pavelow";
    level.scr_anim["pavelow"]["evac"] = %h2_gulag_end_pavelow;
}
#using_animtree("script_model");

_id_B6C5()
{
    level.scr_animtree["crate"] = #animtree;
    level.scr_anim["crate"]["crate_falling"] = %h2_gulag_escapesequence_plastic_case;
    level.scr_model["crate"] = "com_plasticcase_beige_big_animated";
    level.scr_animtree["barrel"] = #animtree;
    level.scr_anim["barrel"]["barrel_falling"] = %h2_gulag_escapesequence_barrel;
    level.scr_model["barrel"] = "com_barrel_biohazard_rust_animated";
}
