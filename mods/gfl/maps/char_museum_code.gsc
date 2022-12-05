// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_AF50( var_0 )
{
    maps\_utility::set_allowdeath( 1 );
    self.anim_speed = level._id_BEB2;

    if ( !isdefined( level._id_CA35[var_0] ) )
        level._id_CA35[var_0] = [];

    level._id_CA35[var_0][level._id_CA35[var_0].size] = self;
    var_1 = self;

    if ( isdefined( self.target ) )
    {
        var_1 = common_scripts\utility::getstruct( self.target, "targetname" );
        self.animation = var_1.animation;
    }

    self.anim_node = var_1;
    _id_B9DE( var_1 );
    thread _id_B42E();
    thread _id_A9DB( var_0 );
}

_id_A9DB( var_0 )
{
    self waittill( "death" );

    if ( isdefined( self ) )
        level._id_CA35[var_0] = common_scripts\utility::array_remove( level._id_CA35[var_0], self );
    else
        level._id_CA35[var_0] = [];
}

_id_B9DE( var_0 )
{
    self.current_anim = maps\_utility::getanim_generic( var_0.animation );
    var_0 maps\_anim::anim_generic_first_frame( self, var_0.animation );
}

_id_D00C( var_0 )
{
    if ( isai( self ) )
        _id_C988( var_0 );
    else
        _id_ADAC( var_0 );
}

_id_C988( var_0 )
{
    self endon( "panic_button" );
    self endon( "death" );
    self endon( "do_anim" );
    self.current_anim = maps\_utility::getanim_generic( var_0 );
    self._id_B93B = maps\_utility::getanim_generic( var_0 );
    thread _id_B42E();
    _id_C5C0();
    waittillframeend;
    self._id_D547 = undefined;
    self animcustom( ::_id_BE42 );
}

_id_ADAC( var_0 )
{
    self endon( "do_anim" );
    self.current_anim = maps\_utility::getanim_generic( var_0 );
    thread _id_B42E();

    for (;;)
    {
        _id_C5C0();
        waittillframeend;
        self._id_D547 = undefined;
        var_1 = self.current_anim;
        self clearanim( var_1, 0 );
        self setanimrestart( self.current_anim, 1, 0, self.anim_speed );
    }
}

_id_BE42()
{
    self endon( "killanimscript" );
    self endon( "panic_button" );
    self endon( "death" );
    self endon( "do_anim" );
    self notify( "new_custom_anim" );
    self endon( "new_custom_anim" );
    var_0 = self._id_B93B;

    for (;;)
    {
        var_1 = self.current_anim;
        self clearanim( var_1, 0 );
        self animmode( "nogravity" );
        self setanimrestart( self.current_anim, 1, 0, self.anim_speed );
        _id_C5C0();
        waittillframeend;
    }
}

_id_C60E( var_0, var_1 )
{
    if ( isai( self ) )
        _id_CE35( var_0, var_1 );
    else
        _id_BADA( var_0, var_1 );
}

_id_CE35( var_0, var_1 )
{
    self endon( "panic_button" );
    self endon( "death" );
    self endon( "do_anim" );
    self._id_B93B = maps\_utility::getanim_generic( var_0 );
    self._id_CF71 = var_1;
    self.current_anim = maps\_utility::getanim_generic( var_0 );
    thread _id_B42E();
    _id_C5C0();
    waittillframeend;
    self._id_D547 = undefined;
    self animcustom( ::_id_C2FA );
}

_id_BADA( var_0, var_1 )
{
    self endon( "do_anim" );
    self.current_anim = maps\_utility::getanim_generic( var_0 );
    thread _id_B42E();

    for (;;)
    {
        _id_C5C0();
        waittillframeend;
        self._id_D547 = undefined;
        var_2 = self.current_anim;
        self.current_anim = common_scripts\utility::random( level.scr_anim["generic"][var_1] );
        self clearanim( var_2, 0 );
        self setanimrestart( self.current_anim, 1, 0, self.anim_speed );
    }
}

_id_C2FA()
{
    self endon( "killanimscript" );
    self endon( "panic_button" );
    self endon( "death" );
    self endon( "do_anim" );
    self notify( "new_custom_anim" );
    self endon( "new_custom_anim" );
    var_0 = self._id_B93B;
    var_1 = self._id_CF71;

    for (;;)
    {
        var_2 = self.current_anim;
        self.current_anim = common_scripts\utility::random( level.scr_anim["generic"][var_1] );
        self clearanim( var_2, 0 );
        self animmode( "nogravity" );
        self setanimrestart( self.current_anim, 1, 0, self.anim_speed );
        _id_C5C0();
        waittillframeend;
    }
}

_id_C5C0( var_0, var_1 )
{
    if ( !isdefined( self.current_anim ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = getanimlength( self.current_anim );

    if ( isdefined( var_0 ) && isdefined( self._id_D547 ) )
        var_2 *= ( var_0 - self._id_D547 );
    else if ( isdefined( var_0 ) )
        var_2 *= var_0;
    else if ( isdefined( self._id_D547 ) )
        var_2 *= ( 1.0 - self._id_D547 );

    var_3 = var_2 / self.anim_speed + var_1;

    if ( var_3 > 0 )
        wait(var_3);
}

_id_B856( var_0, var_1, var_2 )
{
    if ( isai( self ) )
        _id_AFB3( var_0, var_1, var_2 );
    else
        _id_CFBB( var_0, var_1, var_2 );
}

_id_AFB3( var_0, var_1, var_2 )
{
    self endon( "panic_button" );
    self endon( "death" );
    wait 0.1;
    _id_C5C0( var_1, var_2 );
    waittillframeend;
    self._id_D547 = undefined;
    self._id_B93B = var_0;
    self._id_D1AF = var_1;
    self._id_B76A = var_2;
    self animcustom( ::_id_D11C );
}

_id_CFBB( var_0, var_1, var_2 )
{
    _id_C5C0( var_1, var_2 );
    waittillframeend;
    self._id_D547 = undefined;
    var_3 = self.current_anim;
    self.current_anim = var_0;
    self clearanim( var_3, 0.2 );
    self setanimrestart( self.current_anim, 1, 0.2, self.anim_speed );
}

_id_D11C()
{
    self endon( "killanimscript" );
    self endon( "panic_button" );
    self endon( "death" );
    self notify( "new_custom_anim" );
    self endon( "new_custom_anim" );
    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;

    if ( isdefined( self._id_B93B ) )
        var_0 = self._id_B93B;

    if ( isdefined( self._id_D1AF ) )
        var_1 = self._id_D1AF;

    if ( isdefined( self._id_B76A ) )
        var_2 = self._id_B76A;

    var_3 = self.current_anim;
    self.current_anim = var_0;
    self clearanim( var_3, 0.2 );
    self animmode( "nogravity" );
    self setanimrestart( self.current_anim, 1, 0.2, self.anim_speed );
    self waittill( "new_custom_anim" );
}

_id_B42E()
{
    if ( isai( self ) )
        _id_C1F4();
    else
        _id_B99A();
}

_id_C1F4()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    maps\_utility::ent_flag_waitopen( "do_anim" );
    self animcustom( ::_id_C0D1 );
}

_id_B99A()
{
    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    maps\_utility::ent_flag_waitopen( "do_anim" );
    self setanim( self.current_anim, 1, 0, 0 );
}

_id_C0D1()
{
    self endon( "killanimscript" );
    self endon( "panic_button" );
    self endon( "death" );
    self notify( "new_custom_anim" );
    self animmode( "nogravity" );
    self setanim( self.current_anim, 1, 0, 0 );
    self waittill( "new_custom_anim" );
}

_id_AD0B( var_0, var_1, var_2, var_3 )
{
    if ( isai( self ) )
        _id_CC66( var_0, var_1, var_2, var_3 );
    else
        _id_CEC1( var_0, var_1, var_2, var_3 );
}

_id_CC66( var_0, var_1, var_2, var_3 )
{
    self._id_B93B = var_0;
    self._id_C1E5 = var_1;
    self._id_BE50 = var_2;
    self._id_CF54 = var_3;
    self animcustom( ::_id_D294 );
}

_id_CEC1( var_0, var_1, var_2, var_3 )
{
    self setanim( var_0, var_1, var_2, var_3 );
}

_id_D294()
{
    self endon( "killanimscript" );
    self endon( "panic_button" );
    self endon( "death" );
    self notify( "new_custom_anim" );
    var_0 = self._id_B93B;
    var_1 = self._id_C1E5;
    var_2 = self._id_BE50;
    var_3 = self._id_CF54;

    if ( isdefined( self._id_AFFD ) )
        self animmode( self._id_AFFD );
    else
        self animmode( "nogravity" );

    self setanim( var_0, var_1, var_2, var_3 );
    self waittill( "new_custom_anim" );
}

_id_CE56( var_0, var_1 )
{
    wait 0.05;
    self._id_D547 = var_1;
    var_2 = spawn( "script_origin", getstartorigin( var_0.origin, var_0.angles, maps\_utility::getanim_generic( var_0.animation ) ) );
    var_2.angles = getstartangles( var_0.origin, var_0.angles, maps\_utility::getanim_generic( var_0.animation ) );
    var_3 = getangledelta( maps\_utility::getanim_generic( var_0.animation ), 0, self._id_D547 );
    var_4 = var_2 localtoworldcoords( var_3 );
    var_5 = getmovedelta( maps\_utility::getanim_generic( var_0.animation ), 0, self._id_D547 );
    self setanimtime( maps\_utility::getanim_generic( var_0.animation ), self._id_D547 );

    if ( isai( self ) )
        self forceteleport( var_4, var_2.angles + ( 0, var_5, 0 ) );
    else
    {
        self.origin = var_4;
        self.angles = var_2.angles + ( 0, var_5, 0 );
    }

    var_2 common_scripts\utility::delaycall( 0.05, ::delete );
}

_id_B50B( var_0, var_1, var_2, var_3 )
{
    var_4 = getvehiclenode( var_0, "targetname" );
    var_5 = level.camera;
    level.camera = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "credits_camera" );
    level.camera vehicle_teleport( var_4.origin, var_4.angles );
    level.camera thread maps\_vehicle::vehicle_paths( var_4 );
    level.camera attachpath( var_4 );
    level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );

    if ( !isdefined( var_1 ) )
        var_1 = 30;

    var_6 = distance( level.camera.origin, var_5.origin );
    var_7 = var_6 / var_1;

    if ( !isdefined( var_2 ) )
        var_2 = 0.25;

    if ( !isdefined( var_3 ) )
        var_3 = 0.25;

    if ( !var_2 && !var_3 )
        level.player playerlinktoblend( level.camera, undefined, var_7 );
    else
        level.player playerlinktoblend( level.camera, undefined, var_7, var_7 * var_2, var_7 * var_3 );

    thread h2_museum_parent_camera_delta( var_7 );

    if ( var_7 > 0.5 && var_7 < 1.0 )
        wait(var_7);
    else if ( var_7 > 1.0 )
        wait(var_7 - 1.0);

    var_5 common_scripts\utility::delaycall( 1.5, ::delete );
}

h2_museum_prepare_exhibit_input( var_0, var_1, var_2 )
{
    wait(var_2);
    common_scripts\utility::flag_wait( var_0 );

    if ( !common_scripts\utility::flag( "in_an_exhibit" ) )
    {
        common_scripts\utility::flag_set( "in_an_exhibit" );
        common_scripts\utility::flag_wait( "camera_is_parented_delta" );
        thread h2_museum_listen_for_player_input( var_1 );
        common_scripts\utility::flag_wait( var_1 );
        common_scripts\utility::flag_clear( "camera_is_parented_delta" );
        common_scripts\utility::flag_wait( "exhibit_zoomout_done" );
        h2_museum_cleanup_exhibit_flags();
    }
}

h2_museum_custom_exhibit( var_0, var_1, var_2 )
{
    wait(var_0);

    if ( !common_scripts\utility::flag( "in_an_exhibit" ) )
    {
        common_scripts\utility::flag_set( "in_an_exhibit" );

        if ( var_2 == 1 )
            thread h2_museum_parent_camera_delta( 0 );

        common_scripts\utility::flag_wait( "camera_is_parented_delta" );
        thread h2_museum_listen_for_player_input( "custom_exhibit_done" );
        wait(var_1 - var_0);
        common_scripts\utility::flag_set( "custom_exhibit_done" );
        common_scripts\utility::flag_clear( "camera_is_parented_delta" );
        common_scripts\utility::flag_wait( "exhibit_zoomout_done" );
        var_3 = 1;
        level.player playerlinktoblend( level.camera, undefined, var_3, 0, var_3 * 0.33 );
        h2_museum_cleanup_exhibit_flags();
    }
}

h2_museum_cleanup_exhibit_flags()
{
    common_scripts\utility::flag_clear( "in_an_exhibit" );
    common_scripts\utility::flag_clear( "in_a_corridor" );
    common_scripts\utility::flag_clear( "camera_is_parented_delta" );
    common_scripts\utility::flag_clear( "exhibit_zoomout_done" );
    common_scripts\utility::flag_clear( "custom_exhibit_done" );
}

h2_museum_parent_camera_delta( var_0 )
{
    if ( common_scripts\utility::flag( "in_a_corridor" ) )
        common_scripts\utility::flag_clear( "in_a_corridor" );
    else
    {
        wait(var_0 + 0.05);
        common_scripts\utility::flag_wait( "in_an_exhibit" );
        level.player playerlinktodelta( level.camera, undefined, 1.0, 0, 0, 0, 0, 1 );
        level.player setviewangleresistance( 50, 50, 20, 20 );
        wait 0.05;
        common_scripts\utility::flag_set( "camera_is_parented_delta" );
    }
}

h2_museum_listen_for_player_input( var_0 )
{
    var_1 = 45;
    var_2 = 15;
    var_3 = 1.5;

    if ( var_0 == "custom_exhibit_done" )
        var_2 = 25;

    var_4 = ( var_1 - var_2 ) / 1.33;
    var_5 = 0.5625 * var_4;
    var_6 = 0;

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        if ( level.player adsbuttonpressed() )
        {
            if ( var_6 == 0 )
            {
                var_6 = 1;
                thread h2_museum_player_fovchange( var_2, var_3 );
                level.player lerpviewangleclamp( var_3, var_3 * 0.5, var_3 * 0.5, var_4, var_4, var_5, var_5 );
                level.player setviewangleresistance( 50, 50, 20, 20 );
            }
        }
        else if ( var_6 == 1 )
        {
            var_6 = 0;
            thread h2_museum_player_fovchange( var_1, var_3 );
            level.player lerpviewangleclamp( var_3, var_3 * 0.5, var_3 * 0.5, 0, 0, 0, 0 );
            level.player setviewangleresistance( 50, 50, 20, 20 );
        }

        wait 0.05;
    }

    var_7 = common_scripts\utility::ter_op( var_0 == "custom_exhibit_done", 1.0, 2.0 );
    thread h2_museum_player_fovchange( var_1, var_3 * var_7 );
    common_scripts\utility::flag_set( "exhibit_zoomout_done" );
}

h2_museum_player_fovchange( var_0, var_1 )
{
    var_2 = _id_D397::_id_A97A( "new_fov_called", 1 );
    var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_AC9F( var_0, var_1, 0 );
    var_2 _id_D397::_id_BC26();
}

_id_B319()
{
    if ( level._id_AC38 == "free" || self.classname == "actor_enemy_dog" || issubstr( self.classname, "ally_socom_" ) || issubstr( self.classname, "actor_enemy_juggernaut" ) )
    {
        self.script_drone = undefined;
        self.script_moveoverride = 1;
    }
    else
    {
        self.script_drone_override = 1;
        self.script_drone = 1;
    }
}

_id_CAF1()
{
    self.moveplaybackrate = 1.0;
    self.animplaybackrate = 1.0;

    if ( level._id_AC38 == "free" )
        self.script_drone = 1;
    else
        self.script_drone = undefined;
}

_id_CD29( var_0 )
{
    foreach ( var_2 in level._id_CA35[var_0] )
        var_2 maps\_utility::ent_flag_set( "do_anim" );
}

_id_ACA7()
{
    self endon( "death" );
    self waittill( "reached_path_end" );
    self delete();
}

_id_C764()
{
    self endon( "death" );
    wait 0.1;
    var_0 = self;

    if ( isdefined( self.target ) )
    {
        var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
        self.animation = var_0.animation;
    }

    if ( var_0.animation == "civilian_texting_sitting" )
        self attach( "electronics_pda", "TAG_INHAND" );

    maps\_utility::set_allowdeath( 1 );
    var_0 maps\_anim::anim_generic_loop( self, var_0.animation );
}

_id_D464()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getfx( "scuba_bubbles_friendly" );

    while ( maps\_utility::ent_flag( "do_anim" ) )
    {
        var_1 = randomint( 3 ) + 1;

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            playfxontag( var_0, self, "tag_eye" );
            wait 0.05;
        }

        wait(randomfloatrange( 0.6, 2.5 ));
    }
}

_id_CDE3()
{
    self.ignoreme = 1;
    thread _id_C0C3::weapons_specialfeatures_reset();
    var_0 = "beretta";
    var_1 = "h2_gfl_ump45_viewhands";
    self takeallweapons();
    self giveweapon( var_0 );
    self switchtoweapon( var_0 );
    self setviewmodel( var_1 );
    self setoffhandprimaryclass( "fraggrenade" );
    self giveweapon( "fraggrenade" );
    self setoffhandsecondaryclass( "flash_grenade" );
    self giveweapon( "flash_grenade" );
    self freezecontrols( 1 );
    thread _id_C0C3::weapons_specialfeatures();
}

_id_C2DD()
{
    var_0 = self.script_noteworthy;

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( isplayer( var_1 ) && level._id_C32B != var_0 )
        {
            _id_B194();

            while ( var_1 istouching( self ) )
                wait 0.05;
        }
    }
}

_id_B194()
{
    if ( common_scripts\utility::flag( "panic_button" ) )
        return;

    level._id_C32B = self.script_noteworthy;

    if ( level._id_AC38 == "free" )
        level.guys = getaispeciesarray();

    foreach ( var_1 in level.guys )
    {
        if ( isdefined( var_1 ) )
            var_1 delete();
    }

    if ( isdefined( level.rope ) )
    {
        level.rope delete();
        level.rope = undefined;
    }

    level.guys = [];
    wait 0.05;

    if ( level._id_C32B == "none" )
        return;

    var_3 = getentarray( self.script_noteworthy, "targetname" );

    if ( level._id_AC38 == "free" )
    {
        switch ( self.script_noteworthy )
        {
            case "room1":
                maps\char_museum::_id_B456();
                break;
            case "room2":
                maps\char_museum::_id_D12E();
                break;
        }
    }

    common_scripts\utility::array_thread( var_3, ::_id_C9BB );
}

_id_C9BB()
{
    self.count = 3;
    maps\_utility::spawn_ai( 1 );
}

_id_C67A()
{
    self endon( "death" );
    maps\_utility::ent_flag_init( "do_anim" );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self._id_B76D = [];
    self._id_B76D["grenadeawareness"] = self.grenadeawareness;
    self._id_B76D["ignoreexplosionevents"] = self.ignoreexplosionevents;
    self._id_B76D["ignorerandombulletdamage"] = self.ignorerandombulletdamage;
    self._id_B76D["ignoresuppression"] = self.ignoresuppression;
    self._id_B76D["disableBulletWhizbyReaction"] = self.disablebulletwhizbyreaction;
    self._id_B76D["newEnemyReactionDistSq"] = self.newenemyreactiondistsq;
    self._id_B76D["health"] = self.health;
    self._id_B76D["maxhealth"] = self.maxhealth;
    self._id_B76D["flashbangimmunity"] = self.flashbangimmunity;
    self.grenadeawareness = 0;
    self.ignoreexplosionevents = 1;
    self.ignorerandombulletdamage = 1;
    self.ignoresuppression = 1;
    self.disablebulletwhizbyreaction = 1;
    self.newenemyreactiondistsq = 0;
    self.name = " ";
    self.health = 1;
    self.maxhealth = 1;
    self.flashbangimmunity = 1;
    maps\_utility::pathrandompercent_zero();

    if ( isdefined( self.team ) && self.team == "axis" )
        self.team = "neutral";

    if ( isai( self ) )
    {
        maps\_utility::disable_pain();
        self clearenemy();
        self pushplayer( 1 );
    }
    else
    {

    }

    self.alertlevel = "noncombat";

    if ( isdefined( self.type ) && self.type == "civilian" )
        return;

    level.guys[level.guys.size] = self;
}

_id_AB7E()
{
    foreach ( var_1 in level.players )
    {
        var_1.black_overlay = maps\_hud_util::create_client_overlay( "black", 0, var_1 );
        var_1.black_overlay.alpha = 1;
    }
}

_id_AB7B( var_0 )
{
    foreach ( var_2 in level.players )
    {
        var_2.black_overlay fadeovertime( var_0 );
        var_2.black_overlay.alpha = 0;
        var_2.black_overlay common_scripts\utility::delaycall( var_0, ::destroy );
    }
}

_id_BE73()
{
    var_0 = _id_C103();
    common_scripts\utility::array_thread( var_0, ::_id_BF9D );
    level._id_B6AA = var_0;
    var_1 = [];
    var_1[var_1.size] = "delayed";
    var_0 = common_scripts\utility::array_randomize( level._id_B6AA );
    common_scripts\utility::flag_wait( "looked_at_big_board" );
    var_2 = getentarray( "snd_departure_board", "targetname" );

    foreach ( var_4 in var_2 )
        var_4 playsound( var_4.script_soundalias );

    var_0 = common_scripts\utility::array_randomize( level._id_B6AA );

    foreach ( var_7 in var_0 )
    {
        var_7 thread _id_AA4B( var_1[randomint( var_1.size )] );
        wait 0.2;
    }
}

_id_C103()
{
    var_0 = getentarray( "sign_departure_status", "targetname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = 1;
        var_5 = var_3.origin;

        foreach ( var_7 in var_1 )
        {
            if ( var_7.origin != var_5 )
                continue;

            var_4 = 0;
            var_7._id_C59E[var_3.script_noteworthy] = var_3;
            break;
        }

        if ( !var_4 )
            continue;

        var_9 = spawnstruct();
        var_9.origin = var_5;
        var_9._id_C59E = [];
        var_9._id_C59E[var_3.script_noteworthy] = var_3;
        var_1[var_1.size] = var_9;
    }

    return var_1;
}

_id_BF9D()
{
    self.status["angles"] = [];
    self.status["angles"]["bottom"] = self._id_C59E["ontime"].angles;
    self.status["angles"]["top"] = self._id_C59E["boarding"].angles;
    self.status["angles"]["waiting"] = self._id_C59E["delayed"].angles;
    self.status["order"] = [];
    self.status["order"]["ontime"] = "arriving";
    self.status["order"]["arriving"] = "boarding";
    self.status["order"]["boarding"] = "delayed";
    self.status["order"]["delayed"] = "ontime";
    self.status["ontime"] = [];
    self.status["ontime"]["bottom"] = "ontime";
    self.status["ontime"]["top"] = "arriving";
    self.status["arriving"] = [];
    self.status["arriving"]["bottom"] = "arriving";
    self.status["arriving"]["top"] = "boarding";
    self.status["boarding"] = [];
    self.status["boarding"]["bottom"] = "boarding";
    self.status["boarding"]["top"] = "delayed";
    self.status["delayed"] = [];
    self.status["delayed"]["bottom"] = "delayed";
    self.status["delayed"]["top"] = "ontime";
    self._id_B748 = "ontime";
    self._id_C59E["arriving"].angles = self.status["angles"]["top"];
    self._id_C59E["boarding"].angles = self.status["angles"]["waiting"];
    self._id_C59E["boarding"] hide();
    self._id_C59E["delayed"] hide();
}

_id_AA4B( var_0 )
{
    for ( var_1 = 0.2; self._id_B748 != var_0; self._id_B748 = var_2 )
    {
        var_2 = self.status["order"][self._id_B748];
        var_3 = self.status[self._id_B748]["top"];
        var_4 = self.status[self._id_B748]["bottom"];
        var_5 = self.status[var_2]["top"];
        var_6 = self._id_C59E[var_3];
        var_7 = self._id_C59E[var_4];
        var_8 = self._id_C59E[var_5];
        var_6 rotatepitch( 180, var_1 );
        var_8.angles = self.status["angles"]["top"];
        wait 0.05;
        var_8 show();
        wait(var_1 - 0.1);
        var_7 hide();
        var_7.angles = self.status["angles"]["waiting"];
        wait 0.05;
    }
}

_id_CC37()
{
    self endon( "death" );
    self.gun_remove = 1;
    maps\_utility::gun_remove();
    var_0 = getweaponmodel( "beretta" );
    self attach( var_0, "tag_weapon_right" );
    self hidepart( "TAG_SILENCER" );
    self waittill( "panic_button" );
    self detach( var_0, "tag_weapon_right" );
}

_id_B1D7( var_0, var_1 )
{
    self endon( "panic_button" );
    self endon( "death" );
    self endon( "do_anim" );
    self._id_B93B = maps\_utility::getanim_generic( var_0 );
    self._id_CF71 = var_1;
    self.current_anim = maps\_utility::getanim_generic( var_0 );
    thread _id_B42E();
    _id_C5C0();
    waittillframeend;
    self animcustom( ::_id_CC9C );
}

_id_CC9C()
{
    self endon( "panic_button" );
    self endon( "killanimscript" );
    self endon( "death" );
    self endon( "do_anim" );
    self notify( "new_custom_anim" );
    self endon( "new_custom_anim" );
    var_0 = self._id_B93B;
    var_1 = self._id_CF71;

    for (;;)
    {
        var_2 = self.current_anim;
        self.current_anim = common_scripts\utility::random( level.scr_anim["generic"][var_1] );
        self clearanim( var_2, 0 );
        self animmode( "nogravity" );
        self setanimrestart( self.current_anim, 1, 0, self.anim_speed );
        _id_C5C0();
        waittillframeend;
    }
}

_id_AE75()
{
    thread common_scripts\utility::_id_AE1E( level.player, &"CHAR_MUSEUM_DO_NOT", &"CHAR_MUSEUM_DO_NOT_PC", "trigger" );
    self usetriggerrequirelookat();
    thread _id_B960();
    thread _id_D5D0();
    var_0 = getent( self.target, "targetname" );
    var_0 maps\_utility::ent_flag_init( "ready" );
    var_0 maps\_utility::ent_flag_set( "ready" );
    var_1 = getentarray( "panic_button", "targetname" );
    var_2 = [];

    foreach ( var_4 in var_1 )
        var_2[var_2.size] = getent( var_4.target, "targetname" );

    foreach ( var_8, var_7 in var_2 )
    {
        var_7 maps\_utility::assign_animtree( "bell" );
        var_1[var_8] maps\_anim::anim_first_frame_solo( var_7, "pressing_button_infront" );
    }

    for (;;)
    {
        var_0 maps\_utility::ent_flag_wait( "ready" );
        self waittill( "trigger" );
        soundscripts\_snd::snd_message( "aud_start_battle_mix" );
        panic_button_body_sense();
        var_9 = getaispeciesarray();

        if ( !var_9.size )
            continue;

        if ( !_id_B6D2( var_9 ) )
            continue;

        if ( common_scripts\utility::flag( "panic_button" ) )
            continue;

        common_scripts\utility::flag_set( "panic_button" );
        common_scripts\utility::array_thread( level.players, maps\_utility::playlocalsoundwrapper, "arcademode_kill_streak_lost" );
        level.player.ignoreme = 0;
        common_scripts\utility::array_thread( var_9, ::_id_B154 );
        var_10 = 32;
        var_11 = 26;

        if ( self.script_noteworthy == "room1_button" && var_9.size == var_10 )
            thread do_not_push_this_button_think( self.script_noteworthy );
        else if ( self.script_noteworthy == "room2_button" && var_9.size == var_11 )
            thread do_not_push_this_button_think( self.script_noteworthy );

        common_scripts\utility::flag_waitopen( "panic_button" );
        soundscripts\_snd::snd_message( "aud_stop_battle_mix" );
    }
}

panic_button_body_sense()
{
    var_0 = getent( common_scripts\utility::getclosest( level.player.origin, getentarray( "panic_button", "targetname" ), 512 ).target, "targetname" );

    if ( ( common_scripts\utility::flag( "button_infront" ) || common_scripts\utility::flag( "button_behind" ) ) && level.player isonground() && level.player getstance() != "prone" )
    {
        setsaveddvar( "actionSlotsHide", 1 );
        setsaveddvar( "compass", 0 );
        setsaveddvar( "hud_showStance", 0 );
        setsaveddvar( "ammoCounterHide", 1 );
        var_1 = spawn( "script_origin", var_0.origin + ( 0.0, 0.0, 8.0 ) );
        var_2 = maps\_utility::spawn_anim_model( "viewbody" );
        var_2 maps\_utility::assign_animtree();
        var_2 dontcastshadows();
        var_2 hide();

        if ( common_scripts\utility::flag( "button_infront" ) )
            var_1 maps\_anim::anim_first_frame_solo( var_2, "pressing_button_infront" );
        else
            var_1 maps\_anim::anim_first_frame_solo( var_2, "pressing_button_behind" );

        level.player allowcrouch( 0 );
        level.player allowprone( 0 );
        level.player disableweapons( 1, 200, 0.1 );
        var_3 = level.player maps\_anim::_id_D101( var_2, 40, 100, 0.2, 0.5 );
        level.player playerlinktoblend( var_2, "tag_player", var_3, var_3 / 4, var_3 / 4 );
        wait(var_3 + 0.05);
        var_2 show();

        if ( common_scripts\utility::flag( "button_infront" ) )
        {
            thread h2_button_press( "front", var_0 );
            thread maps\_anim::anim_single_solo( var_0, "pressing_button_infront" );
            var_1 maps\_anim::anim_single_solo( var_2, "pressing_button_infront" );
        }
        else
        {
            thread h2_button_press( "back", var_0 );
            thread maps\_anim::anim_single_solo( var_0, "pressing_button_behind" );
            var_1 maps\_anim::anim_single_solo( var_2, "pressing_button_behind" );
        }

        level.player unlink();
        var_2 delete();
        level.player allowcrouch( 1 );
        level.player allowprone( 1 );
        level.player enableweapons();
        setsaveddvar( "actionSlotsHide", 0 );
        setsaveddvar( "compass", 1 );
        setsaveddvar( "hud_showStance", 1 );
        setsaveddvar( "ammoCounterHide", 0 );
    }
    else
        thread maps\_anim::anim_single_solo( var_0, "pressing_button_else" );
}

h2_button_press( var_0, var_1 )
{
    var_2 = _id_D397::_id_A97A( "bell" + var_0, 1 );

    switch ( var_0 )
    {
        case "front":
            var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 12, -1, 16.0, 16.0 ) _id_D397::_id_CCA7( var_1, "tag_origin" ) _id_D397::_id_ADE6( -4 ) _id_D397::_id_AF9C();
            var_2 _id_D397::_id_BEA0( 0.25 ) _id_D397::_id_C491( 4.2, -1, 6.0, 6.0 ) _id_D397::_id_CCA7( var_1, "tag_origin" ) _id_D397::_id_ADE6( -4 );
            var_2 _id_D397::_id_BEA0( 0.9 ) _id_D397::_id_C491( 12, -1, 8.0, 8.0 ) _id_D397::_id_CCA7( var_1, "tag_origin" ) _id_D397::_id_ADE6( -4 );
            var_2 _id_D397::_id_BEA0( 1.35 ) _id_D397::_id_BF3F();
            var_2 _id_D397::_id_BEA0( 0.65 ) _id_D397::_id_B85E( 0.08, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
            break;
        case "back":
            var_2 _id_D397::_id_BEA0( 0.0 ) _id_D397::_id_C491( 12, -1, 16.0, 16.0 ) _id_D397::_id_CCA7( var_1, "tag_origin" ) _id_D397::_id_ADE6( -4 ) _id_D397::_id_AF9C();
            var_2 _id_D397::_id_BEA0( 0.25 ) _id_D397::_id_C491( 4.2, -1, 6.0, 6.0 ) _id_D397::_id_CCA7( var_1, "tag_origin" ) _id_D397::_id_ADE6( -4 );
            var_2 _id_D397::_id_BEA0( 1.4 ) _id_D397::_id_C491( 12, -1, 8.0, 8.0 ) _id_D397::_id_CCA7( var_1, "tag_origin" ) _id_D397::_id_ADE6( -4 );
            var_2 _id_D397::_id_BEA0( 2.0 ) _id_D397::_id_BF3F();
            var_2 _id_D397::_id_BEA0( 0.3 ) _id_D397::_id_B85E( 0.06, 0.2, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.05 );
            var_2 _id_D397::_id_BEA0( 1.0 ) _id_D397::_id_B85E( 0.08, 0.3, level.player, 10000 ) _id_D397::_id_BC21( "tank_rumble", level.player, 0.15 );
            break;
    }

    var_2 _id_D397::_id_BC26();
}

do_not_push_this_button_think( var_0 )
{
    level.player endon( "death" );

    if ( var_0 != "room1_button" && var_0 != "room2_button" )
        return;

    common_scripts\utility::flag_waitopen( "panic_button" );

    if ( var_0 == "room1_button" )
        level.room1_cleared = 1;
    else if ( var_0 == "room2_button" )
        level.room2_cleared = 1;

    if ( level.room1_cleared && level.room2_cleared )
        maps\_utility::giveachievement_wrapper( "NIGHT_MUSEUM" );
}

_id_CCCD( var_0 )
{
    var_0 maps\_utility::ent_flag_clear( "ready" );

    if ( !isdefined( self.trigger_off ) )
        common_scripts\utility::trigger_off();

    var_0 movez( -1, 0.1 );
    var_0 playsound( "detpack_trigger" );
    wait 1;
    var_0 movez( 1, 0.1 );
    wait 0.25;
    var_0 maps\_utility::ent_flag_set( "ready" );
    common_scripts\utility::flag_waitopen( "panic_button" );

    if ( isdefined( self.trigger_off ) )
        common_scripts\utility::trigger_on();
}

_id_D5D0()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "panic_button" );

        if ( !isdefined( self.trigger_off ) )
            common_scripts\utility::trigger_off();

        common_scripts\utility::flag_waitopen( "panic_button" );

        if ( isdefined( self.trigger_off ) )
            common_scripts\utility::trigger_on();
    }
}

_id_B960()
{
    var_0 = spawn( "trigger_radius", self.origin, 0, 50, 72 );
    var_1 = newhudelem();
    var_1 setshader( "panic_button", 1, 1 );
    var_1.alpha = 0;
    var_1.color = ( 1.0, 1.0, 1.0 );
    var_1.x = self.origin[0];
    var_1.y = self.origin[1];
    var_1.z = self.origin[2];
    var_1 setwaypoint( 1, 0, 0 );
    wait 0.05;

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );

        if ( !isplayer( var_2 ) )
            continue;

        while ( var_2 istouching( var_0 ) )
        {
            var_3 = 1;

            if ( maps\_utility::player_looking_at( self.origin, 0.8, 1 ) && var_3 )
                _id_D14B( var_1 );
            else
                _id_CEB5( var_1 );

            wait 0.25;
        }

        _id_CEB5( var_1 );
    }
}

_id_D14B( var_0 )
{
    if ( var_0.alpha != 0 )
        return;

    var_0 fadeovertime( 0.2 );
    var_0.alpha = 0.6;
    wait 0.2;
}

_id_CEB5( var_0 )
{
    if ( var_0.alpha == 0 )
        return;

    var_0 fadeovertime( 0.2 );
    var_0.alpha = 0;
    wait 0.2;
}

_id_B6D2( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( var_2 _id_B0C3() )
            return 1;
    }

    return 0;
}
#using_animtree("generic_human");

_id_B0C3()
{
    if ( isdefined( self.current_anim ) && ( self.current_anim == %oilrig_sub_b_idle_3 || self.current_anim == %oilrig_sub_b_idle_4 ) )
        return 0;

    if ( isdefined( self.type ) && self.type == "civilian" )
        return 0;

    return 1;
}

_id_B154()
{
    if ( !isalive( self ) )
        return;

    if ( !_id_B0C3() )
        return;

    if ( self.classname == "actor_enemy_villian_shepherd" )
    {
        maps\_utility::forceuseweapon( self.sidearm, "primary" );
        self.neverswitchweapon = 1;
    }

    self notify( "panic_button" );
    self notify( "stop_first_frame" );
    self stopanimscripted();

    if ( self.anim_node.animation == "gulag_end_evac_soap" )
    {
        self unlink();
        var_0 = self getdroptofloorposition( self.origin );
        self forceteleport( var_0, self.angles );
    }

    if ( isdefined( self.gun_remove ) )
        maps\_utility::gun_recall();

    thread _id_C123();
    self.grenadeawareness = self._id_B76D["grenadeawareness"];
    self.ignoreexplosionevents = self._id_B76D["ignoreexplosionevents"];
    self.ignorerandombulletdamage = self._id_B76D["ignorerandombulletdamage"];
    self.ignoresuppression = self._id_B76D["ignoresuppression"];
    self.disablebulletwhizbyreaction = self._id_B76D["disableBulletWhizbyReaction"];
    self.newenemyreactiondistsq = self._id_B76D["newEnemyReactionDistSq"];
    self.flashbangimmunity = self._id_B76D["flashbangimmunity"];
    self.health = 150;
    self.maxhealth = 150;

    if ( isdefined( self.juggernaut ) && self.juggernaut == 1 )
    {
        self.health = 3600;
        self.maxhealth = 3600;
    }

    if ( isdefined( self.script_health ) )
    {
        self.health = self.script_health;
        self.maxhealth = self.script_health;
    }

    maps\_utility::pathrandompercent_reset();
    maps\_utility::enable_pain();
    self pushplayer( 0 );
    self.goalradius = 4000;
    self.fixednode = 0;
    level._id_B1CF++;
    self waittill( "death" );
    level._id_B1CF--;
    wait 0.5;

    if ( level._id_B1CF == 0 )
        common_scripts\utility::flag_clear( "panic_button" );
}

_id_C123()
{
    self endon( "death" );
    wait 0.5;
    wait(randomfloat( 0.5 ));
    self.ignoreall = 0;
    self.ignoreme = 0;
    self.team = "axis";
    self.favoriteenemy = level.player;
}

_id_C00C()
{
    wait(randomfloatrange( 0, 0.6 ));
    playfxontag( common_scripts\utility::getfx( "c4_blink" ), self, "tag_fx" );
}

museum_vfx_volumes()
{
    level common_scripts\utility::waittill_any( "createfx_common_done", "start_is_set" );

    if ( isdefined( level.createfx_enabled ) && level.createfx_enabled )
        return;

    if ( isdefined( level.start_point ) && level.start_point == "no_game" || level.start_point == "museum_credits" )
        return;

    var_0 = [ "northeast_vfx", "south_vfx", "northwest_vfx" ];
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        maps\_utility::_id_D193( var_3, var_3 );
        maps\_utility::_id_CD67( var_3, getentarray( var_3, "targetname" ) );
    }

    common_scripts\utility::flag_set( "northwest_vfx" );
}

museum_monitors()
{
    var_0 = getentarray( "museum_monitor", "targetname" );

    if ( level._id_AC38 == "free" )
        common_scripts\utility::array_thread( var_0, ::museum_monitors_physics );
    else
        common_scripts\utility::array_thread( var_0, ::museum_monitors_model );
}

museum_monitors_physics()
{
    self physicslaunchclient( self.origin, ( 0.0, 0.0, 0.0 ) );
}

museum_monitors_model()
{
    if ( self.model == "com_widescreen_monitor_2" )
        self setmodel( "h2_com_widescreen_monitor_on_0" + ( randomint( 8 ) + 1 ) );

    common_scripts\utility::flag_wait( "favela_done" );
    self hide();
    wait 5;
    self show();
}

museum_chicken()
{
    var_0 = getent( "favela_chicken", "targetname" );
    var_0 maps\_utility::assign_animtree( "chicken" );

    switch ( randomint( 3 ) )
    {
        case 1:
            var_0 setmodel( "chicken_white" );
            break;
        case 2:
            var_0 setmodel( "chicken_black_white" );
            break;
        default:
            break;
    }

    if ( level._id_AC38 == "free" )
        var_0 thread museum_chicken_free();
    else
    {
        var_0 thread museum_chicken_credits();
        return;
    }

    var_0 setcandamage( 1 );

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2 );

        if ( isplayer( var_2 ) )
            break;
    }

    var_0 notify( "death" );
    var_0 stopanimscripted();
    var_0 thread maps\_utility::play_sound_on_entity( "animal_chicken_death" );

    if ( randomint( 2 ) )
        var_3 = "chicken_cage_death";
    else
        var_3 = "chicken_cage_death_02";

    var_0 maps\_anim::anim_single_solo( var_0, var_3 );
}

museum_chicken_free()
{
    self endon( "death" );
    thread museum_chicken_free_start_stop();

    for (;;)
    {
        if ( randomint( 2 ) )
            var_0 = "chicken_cage_seated_idle";
        else
            var_0 = "chicken_cage_pecking_idle";

        thread maps\_anim::anim_loop_solo( self, var_0, "stop_idle" );
        self.current_anim = level.scr_anim["chicken"][var_0][0];
        self notify( "anim_defined" );
        thread maps\_utility::play_loop_sound_on_tag( "animal_chicken_idle_loop", undefined, 1, 1 );
        common_scripts\utility::flag_wait( "panic_button" );
        self notify( "stop_idle" );
        thread common_scripts\utility::stop_loop_sound_on_entity( "animal_chicken_idle_loop" );
        thread maps\_utility::play_loop_sound_on_tag( "animal_chicken_panic_loop", undefined, 1, 1 );
        thread maps\_anim::anim_loop_solo( self, "chicken_cage_freakout", "stop_freakout" );
        self.current_anim = level.scr_anim["chicken"]["chicken_cage_freakout"][0];
        common_scripts\utility::flag_waitopen( "panic_button" );
        self notify( "stop_freakout" );
        thread common_scripts\utility::stop_loop_sound_on_entity( "animal_chicken_panic_loop" );
    }
}

museum_chicken_free_start_stop()
{
    self waittill( "anim_defined" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "panic_button" ) )
            self setanim( self.current_anim, 1, 0, 1 );
        else if ( common_scripts\utility::flag( "favela_go" ) && !common_scripts\utility::flag( "favela_done" ) )
            self setanim( self.current_anim, 1, 0, level._id_BEB2 );
        else
            self setanim( self.current_anim, 1, 0, 0 );

        level common_scripts\utility::waittill_any( "favela_go", "favela_done", "panic_button" );
    }
}

museum_chicken_credits()
{
    maps\_anim::anim_first_frame_solo( self, "chicken_cage_loop_01" );
    thread museum_chicken_credits_stop();
    common_scripts\utility::flag_wait( "favela_go" );
    wait 3;
    maps\_anim::anim_single_solo( self, "chicken_cage_loop_01" );

    for (;;)
    {
        if ( randomint( 2 ) )
            var_0 = "chicken_cage_loop_01";
        else
            var_0 = "chicken_cage_loop_02";

        self.current_anim = level.scr_anim["chicken"][var_0];
        maps\_anim::anim_single_solo( self, var_0 );
    }
}

museum_chicken_credits_stop()
{
    common_scripts\utility::flag_wait( "favela_done" );
    self setanim( self.current_anim, 1, 0, 0 );
}

h2_wh_animated_lantern()
{
    self.animname = "lantern";
    maps\_utility::assign_animtree();
    wait(randomfloatrange( 0, 3 ));
    maps\_anim::anim_set_rate( [ self ], "idle", randomfloatrange( 0.8, 1.2 ) );
    thread maps\_anim::anim_loop_solo( self, "idle", "kill_anim" );
    playfxontag( level._effect["lamp_ceiling_glow"], self, "tag_light" );
    playfxontag( level._effect["lamp_ceiling_dust"], self, "tag_light" );
}
