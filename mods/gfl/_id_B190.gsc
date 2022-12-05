// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_A87F = spawnstruct();
    _id_B0F1();
    _id_D412();
    _id_B8F8();
    greenberet_mode_init();
    _id_B675();
    _id_BD9C();
    _id_B514();
    _id_D2F4();
}

ts_init()
{
    if ( !isdefined( self._id_A87F ) )
        self._id_A87F = spawnstruct();
}

_id_B0F1()
{
    level._id_A87F._id_D159 = 0;
}

_id_B34A( var_0 )
{
    level._id_A87F._id_D159 = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level._id_A87F._id_D159 )
        _id_C0C3::add_specialfeatures_function( ::_id_B2FD );
    else
    {
        _id_C0C3::remove_specialfeatures_function( ::_id_B2FD );
        level notify( "attraction_ended" );

        foreach ( var_2 in getaispeciesarray( "all", "all" ) )
            _id_CA02( var_2 );
    }
}

_id_B2FD()
{
    self endon( "death" );
    level endon( "attraction_ended" );
    self endon( "attraction_ended" );

    while ( !isdefined( self.finished_spawning ) )
        wait 0.05;

    _id_C284( self, "attraction_ended" );

    while ( level._id_A87F._id_D159 )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isdefined( self._id_A87F._id_CD30 ) )
        {
            if ( isdefined( self._id_A87F._id_A93E ) && !_id_C7BE( self, var_4 ) )
                continue;

            var_10 = distance( var_1.origin, var_3 );
            waittillframeend;
            maps\_utility::stop_magic_bullet_shield();
            self._id_A87F.ts_forced_hit_marker = 1;

            if ( var_4 == "MOD_MELEE" )
                self dodamage( var_0, var_3, var_1, var_1, var_4, var_9, self.damagelocation );
            else if ( isdefined( var_9 ) )
                self dodamage( _id_D222( var_0, var_10 ), var_3, var_1, var_1, var_4, var_9, self.damagelocation );
            else
                self dodamage( _id_D222( var_0, var_10 ), var_3, var_1, var_1, var_4, "none", self.damagelocation );

            if ( !isalive( self ) || self.delayeddeath )
                break;

            maps\_utility::magic_bullet_shield( 1 );
        }
    }
}

_id_D222( var_0, var_1 )
{
    var_2 = max( 0, var_0 - var_1 / 8 );
    return var_2;
}

_id_D412()
{
    level._id_A87F._id_C1BB = 0;
}

_id_B13A( var_0 )
{
    level._id_A87F._id_C1BB = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level._id_A87F._id_C1BB )
        _id_C0C3::add_specialfeatures_function( ::_id_C637 );
    else
    {
        _id_C0C3::remove_specialfeatures_function( ::_id_C637 );
        level notify( "desperation_ended" );
    }
}

_id_C637()
{
    level.player endon( "death" );
    level endon( "desperation_ended" );
    self endon( "desperation_ended" );
    thread _id_C88A();
    self waittill( "death", var_0 );
    level.player _id_CEEC( 50, var_0 );
    self notify( "desperation_ended" );
}

_id_C88A()
{
    level.player endon( "death" );
    self endon( "death" );
    level endon( "desperation_ended" );

    while ( level._id_A87F._id_C1BB )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( ( !isdefined( self.magic_bullet_shield ) || !self.magic_bullet_shield ) && !isdefined( self._id_A87F._id_CD30 ) && ( !isdefined( self._id_A87F._id_A93E ) || _id_C7BE( self, var_4 ) ) )
            level.player _id_CEEC( var_0, var_1 );
    }
}

_id_CEEC( var_0, var_1 )
{
    if ( _id_B181( var_1 ) )
    {
        var_2 = ( self.health + var_0 / 2 ) / self.maxhealth;

        if ( var_2 > self.maxhealth )
            var_2 = self.maxhealth;

        if ( self.health > 0 )
            self setnormalhealth( var_2 );
    }
}

_id_B8F8()
{
    level._id_A87F._id_C2B7 = 0;
}

_id_BB56( var_0 )
{
    level._id_A87F._id_C2B7 = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level._id_A87F._id_C2B7 )
        _id_C0C3::add_specialfeatures_function( ::_id_BE48 );
    else
    {
        _id_C0C3::remove_specialfeatures_function( ::_id_BE48 );
        level notify( "fortitude_ended" );

        foreach ( var_2 in getaispeciesarray( "all", "all" ) )
        {
            var_2._id_A87F._id_CD30 = undefined;
            var_2._id_A87F.ts_fortitude_damage = undefined;
            var_2 notify( "fortitude_ended" );
            _id_CA02( var_2 );
        }
    }
}

_id_BE48()
{
    self endon( "death" );
    level endon( "fortitude_ended" );
    self endon( "fortitude_ended" );

    while ( !isdefined( self.finished_spawning ) )
        wait 0.05;

    _id_C284( self, "fortitude_ended" );
    self._id_A87F._id_CD30 = 1;
    self._id_A87F.ts_fortitude_damage = 0;

    while ( level._id_A87F._id_C2B7 )
    {
        self waittill( "damage", var_0 );
        self._id_A87F.ts_fortitude_damage += var_0;
        self._id_A87F.ts_forced_hit_marker = 1;

        if ( self._id_A87F.ts_fortitude_damage > 300 )
        {
            wait 0.05;
            self._id_A87F._id_CD30 = undefined;
            self._id_A87F.ts_fortitude_damage = undefined;
            _id_CA02( self );
            return;
        }
    }
}

greenberet_mode_init()
{
    setsaveddvar( "g_using_greenberet_ts", 0 );
    level._id_A87F.tactical_greenberet = 0;
    level._id_A87F.greenberet_weaponname = greenberet_choose_weapon();
    precacheitem( level._id_A87F.greenberet_weaponname );
}

greenberet_mode_update( var_0 )
{
    if ( !isdefined( level._id_A87F.greenberet_wait ) )
    {
        wait 0.25;
        level._id_A87F.tactical_greenberet_wait = 1;
    }

    level._id_A87F.tactical_greenberet = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( isdefined( level._id_A87F.greenberet_disabled ) && level._id_A87F.greenberet_disabled )
        return;

    if ( level._id_A87F.tactical_greenberet )
        greenberet_giveweapon();
    else
        greenberet_takeweapon();
}

greenberet_giveweapon()
{
    setsaveddvar( "g_using_greenberet_ts", 1 );
    level._id_A87F.previousdontallowcache = level.player.dont_allow_ammo_cache;
    level.player.dont_allow_ammo_cache = 1;
    level._id_A87F.greenberet_previousweapons = [];
    level._id_A87F.greenberet_currentweapon = level.player getcurrentweapon( 1 );

    foreach ( var_1 in level.player getweaponslistall() )
    {
        if ( ts_isvalidweapon( var_1 ) )
        {
            level._id_A87F.greenberet_previousweapons[var_1] = [];
            level._id_A87F.greenberet_previousweapons[var_1]["ammoClip"] = level.player getweaponammoclip( var_1 );
            level._id_A87F.greenberet_previousweapons[var_1]["ammoStock"] = level.player getweaponammostock( var_1 );
            level._id_A87F.greenberet_previousweapons[var_1]["akimbo"] = level.player _meth_85CE( var_1 );
            level.player takeweapon( var_1 );
        }
    }

    level.player giveweapon( level._id_A87F.greenberet_weaponname );
    level.player switchtoweapon( level._id_A87F.greenberet_weaponname );
    thread greenberet_monitor();
}

ts_isvalidweapon( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( issubstr( var_0, "alt_" ) )
        return 0;

    var_1 = weaponclass( var_0 );

    if ( ( var_1 == "grenade" || var_1 == "item" ) && var_0 != "c4" && var_0 != "m79" )
        return 0;

    return 1;
}

greenberet_takeweapon()
{
    if ( isdefined( level._id_A87F.previousdontallowcache ) )
        level.player.dont_allow_ammo_cache = level._id_A87F.previousdontallowcache;
    else
        level.player.dont_allow_ammo_cache = undefined;

    setsaveddvar( "g_using_greenberet_ts", 0 );

    if ( !isdefined( level._id_A87F.greenberet_previousweapons ) )
        return;

    foreach ( var_1 in level.player getweaponslistall() )
    {
        if ( ts_isvalidweapon( var_1 ) )
            level.player takeweapon( var_1 );
    }

    foreach ( var_5, var_4 in level._id_A87F.greenberet_previousweapons )
    {
        level.player giveweapon( var_5, 0, var_4["akimbo"] );
        level.player setweaponammoclip( var_5, var_4["ammoClip"] );
        level.player setweaponammostock( var_5, var_4["ammoStock"] );

        if ( !isdefined( level._id_A87F.greenberet_currentweapon ) )
            level._id_A87F.greenberet_currentweapon = var_5;
    }

    if ( isdefined( level._id_A87F.greenberet_currentweapon ) && level._id_A87F.greenberet_currentweapon != "none" )
        level.player switchtoweapon( level._id_A87F.greenberet_currentweapon );

    level._id_A87F.greenberet_previousweapons = undefined;
    level._id_A87F.greenberet_currentweapon = undefined;
    level notify( "greenberet_ended" );
}

greenberet_monitor()
{
    level endon( "greenberet_ended" );
    childthread greenberet_flare_monitor();

    for (;;)
    {
        level.player waittill( "pickup" );
        level.player waittill( "weapon_change" );
        var_0 = level.player getcurrentweapon();

        if ( var_0 != "claymore" )
            level.player setweaponammostock( var_0, 0 );

        if ( issubstr( var_0, "at4" ) || issubstr( var_0, "stinger" ) )
            level.player setweaponammoclip( var_0, 1 );

        wait 0.05;
    }
}

greenberet_flare_monitor()
{
    level endon( "greenberet_ended" );

    for (;;)
    {
        level.player waittill( "weapon_change" );
        var_0 = level.player getcurrentweapon();

        if ( issubstr( var_0, "flare" ) )
            level.player setweaponammoclip( var_0, 1 );

        wait 0.05;
    }
}

greenberet_choose_weapon()
{
    switch ( level.script )
    {
        case "cliffhanger":
            return "h2_cheatpickaxe";
        default:
            return "h2_cheatcommandoknife";
    }
}

_id_B675()
{
    level._id_A87F._id_B5D8 = 0;
}

_id_D3B3( var_0 )
{
    level._id_A87F._id_B5D8 = common_scripts\utility::ter_op( var_0, 1, 0 );
}

martyr_mode_dropgrenade( var_0, var_1 )
{
    if ( isdefined( level._id_A87F._id_B5D8 ) && level._id_A87F._id_B5D8 )
    {
        if ( isdefined( self.script_slowmo_breach ) && ( level.script == "oilrig" || level.script == "af_caves" ) )
            return;

        if ( isdefined( self._id_A87F.martyr_ignore ) && self._id_A87F.martyr_ignore )
            return;

        if ( isdefined( self.classname ) && self.classname == "actor_enemy_dog" && var_1 == "MOD_UNKNOWN" )
            var_2 = 5;
        else
            var_2 = 4;

        var_3 = undefined;

        if ( isdefined( var_0 ) )
        {
            if ( isplayer( var_0 ) )
                var_3 = magicgrenademanual( "fraggrenade", self gettagorigin( "j_head" ), ( 0.0, 0.0, 256.0 ), var_2, var_0 );
            else if ( isplayer( var_0.damageowner ) )
                var_3 = magicgrenademanual( "fraggrenade", self gettagorigin( "j_head" ), ( 0.0, 0.0, 256.0 ), var_2, var_0.damageowner );
        }
        else
            var_3 = magicgrenademanual( "fraggrenade", self gettagorigin( "j_head" ), ( 0.0, 0.0, 256.0 ), var_2 );

        if ( isdefined( var_3 ) )
            var_3._id_B7F4 = 1;
    }
}

_id_BD9C()
{
    level._id_A87F._id_CAFD = 0;
    _id_C0C3::add_specialfeatures_function( ::_id_C41E );
}

_id_D40C( var_0 )
{
    level._id_A87F._id_CAFD = common_scripts\utility::ter_op( var_0, 1, 0 );
    level notify( "polterghost_mode_updated" );
}

_id_C41E()
{
    self endon( "death" );
    waitframe();

    if ( isdefined( self._id_A87F._id_B3B8 ) && self._id_A87F._id_B3B8 )
        return;

    if ( isdefined( self.animtree ) && self.animtree == "dog.atr" )
        return;

    if ( isdefined( self.code_classname ) && self.code_classname == "script_vehicle" )
        return;

    for (;;)
    {
        if ( level._id_A87F._id_CAFD )
            makeghost();
        else
            removeghost();

        level waittill( "polterghost_mode_updated" );
    }
}

makeghost()
{
    if ( _func_2A5( self ) )
        return;

    if ( _id_C0C3::iswolf( self ) )
        self waittill( "wolf_removed" );

    if ( isdefined( self.accessorymodels ) )
    {
        foreach ( acc in self.accessorymodels ) 
        {
            self detach( acc );
        }
    }

    if ( isdefined( self.hatmodel ) )
        self detach( self.hatmodel );

    if ( isdefined( self.headmodel ) )
    {
        if ( !isdefined( self.cheat.pineapple_previoushead ) )
            self._id_A87F.polterghostmode_previousheadmodel = self.headmodel;
        else
            self._id_A87F.polterghostmode_previousheadmodel = self.cheat.pineapple_previoushead;

        self detach( self.headmodel );
    }

    self._id_A87F.polterghostmode_previousmodel = self.model;
    self setmodel( level.invisibleman_body );
    self attach( level.invisibleman_head );
    self.headmodel = level.invisibleman_head;

    if ( isdefined( self.hatmodel ) )
        self attach( self.hatmodel );

    self._id_A87F.polterghostmode = 1;
}

removeghost()
{
    if ( _func_2A5( self ) )
        return;

    if ( !isdefined( self._id_A87F.polterghostmode ) )
        return;

    if ( isdefined( self.accessorymodels ) )
    {
        foreach ( acc in self.accessorymodels ) 
        {
            self attach( acc, "", true );
        }
    }

    if ( isdefined( self.hatmodel ) )
        self detach( self.hatmodel );

    if ( isdefined( self._id_A87F.polterghostmode_previousmodel ) )
    {
        self setmodel( self._id_A87F.polterghostmode_previousmodel );
        self._id_A87F.polterghostmode_previousmodel = undefined;
    }

    if ( isdefined( self._id_A87F.polterghostmode_previousheadmodel ) && !isdefined( self.cheat._id_C86E ) )
    {
        self detach( self.headmodel );
        self attach( self._id_A87F.polterghostmode_previousheadmodel );
        self.headmodel = self._id_A87F.polterghostmode_previousheadmodel;
        self._id_A87F.polterghostmode_previousheadmodel = undefined;
    }
    else if ( isdefined( self.cheat._id_C86E ) )
        self.cheat.pineapple_previoushead = self._id_A87F.polterghostmode_previousheadmodel;

    if ( isdefined( self.hatmodel ) )
        self attach( self.hatmodel );

    self._id_A87F.polterghostmode = undefined;
    self notify( "polterghost_removed" );
}

_id_B514()
{
    level._id_A87F._id_C5B4 = 0;
}

_id_D3FC( var_0 )
{
    level._id_A87F._id_C5B4 = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level._id_A87F._id_C5B4 )
        _id_C0C3::add_specialfeatures_function( ::_id_CF2E );
    else
    {
        _id_C0C3::remove_specialfeatures_function( ::_id_CF2E );
        level notify( "precision_ended" );

        foreach ( var_2 in getaispeciesarray( "all", "all" ) )
        {
            var_2._id_A87F._id_A93E = undefined;
            _id_CA02( var_2 );
        }
    }
}

_id_CF2E()
{
    self endon( "death" );
    level endon( "precision_ended" );
    self endon( "precision_ended" );

    while ( !isdefined( self.finished_spawning ) )
        wait 0.05;

    _id_C284( self, "precision_ended" );
    self._id_A87F._id_A93E = 1;

    while ( level._id_A87F._id_C5B4 )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( ( _id_C7BE( self, var_4 ) || var_4 == "MOD_EXPLOSIVE" ) && !isdefined( self._id_A87F._id_CD30 ) )
        {
            waittillframeend;
            maps\_utility::stop_magic_bullet_shield();
            self._id_A87F.ts_forced_hit_marker = 1;

            if ( isdefined( var_9 ) )
                self dodamage( var_0, var_3, var_1, var_1, var_4, var_9, self.damagelocation );
            else
                self dodamage( var_0, var_3, var_1, var_1, var_4, "none", self.damagelocation );

            if ( !isalive( self ) || self.delayeddeath )
                break;

            maps\_utility::magic_bullet_shield( 1 );
        }
    }
}

_id_D2F4()
{
    level._id_A87F._id_D1C8 = 0;
}

_id_D20D( var_0 )
{
    level._id_A87F._id_D1C8 = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level._id_A87F._id_D1C8 )
    {
        level.player thread _id_A7F7();
        _id_C0C3::add_specialfeatures_function( ::_id_CDD8 );
    }
    else
    {
        _id_C0C3::remove_specialfeatures_function( ::_id_CDD8 );
        level notify( "starvation_mode_ended" );
        level.player notify( "starvation_mode_ended" );
    }
}

_id_CDD8()
{
    level endon( "starvation_mode_ended" );

    if ( level._id_A87F._id_D1C8 )
    {
        self waittill( "death", var_0 );

        if ( _id_B181( var_0 ) )
            level._id_A87F._id_ABC7 += level._id_A87F._id_BD8E * 5;
    }
}

_id_A7F7()
{
    self endon( "starvation_mode_ended" );
    self endon( "death" );
    level._id_A87F._id_BD8E = 1000;
    level._id_A87F._id_ABC7 = gettime();

    if ( level.script == "oilrig" )
    {
        while ( !common_scripts\utility::flag( "obj_stealthkill_complete" ) )
            waitframe();
    }
    else if ( level.script == "favela" )
    {
        while ( !common_scripts\utility::flag( "torture_sequence_done" ) )
            waitframe();
    }

    while ( level._id_A87F._id_D1C8 )
    {
        if ( gettime() > level._id_A87F._id_BD8E + level._id_A87F._id_ABC7 )
        {
            foreach ( var_1 in level.player getweaponslistall() )
            {
                if ( !ts_isvalidweapon( var_1 ) )
                    continue;

                var_2 = self getweaponammostock( var_1 );
                var_3 = weaponclipsize( var_1 ) / 10;

                if ( var_2 > 0 )
                {
                    self setweaponammostock( var_1, int( var_2 - var_3 ) );
                    continue;
                }

                var_4 = self getweaponammoclip( var_1 );
                self setweaponammoclip( var_1, int( var_4 - var_3 ) );
            }

            level._id_A87F._id_ABC7 = gettime();
        }

        wait 0.05;
    }
}

_id_B181( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( isplayer( var_0 ) )
        return 1;

    if ( isdefined( var_0.damageowner ) && isplayer( var_0.damageowner ) )
        return 1;

    return 0;
}

_id_C7BE( var_0, var_1 )
{
    if ( isdefined( var_0.damagelocation ) && ( self.damagelocation == "head" || self.damagelocation == "helmet" ) || var_1 == "MOD_MELEE" )
        return 1;
    else
        return 0;
}

_id_D55F( var_0 )
{
    if ( isdefined( var_0._id_A87F ) && isdefined( var_0._id_A87F._id_D2DE ) )
    {
        var_0 maps\_utility::stop_magic_bullet_shield();
        var_0._id_A87F._id_D2DE = undefined;
        var_0._id_A87F._id_CD30 = undefined;
        var_0._id_A87F._id_A93E = undefined;
        var_0 notify( "attraction_ended" );
        var_0 notify( "precision_ended" );
        var_0 notify( "fortitude_ended" );
    }
}

_id_C284( var_0, var_1 )
{
    if ( isdefined( var_0._id_A87F._id_BB3D ) )
        var_0 notify( var_1 );
    else if ( isdefined( var_0._id_A87F._id_D2DE ) )
        var_0._id_A87F._id_D2DE++;
    else
    {
        if ( !isdefined( var_0.magic_bullet_shield ) || !var_0.magic_bullet_shield )
        {
            var_0._id_A87F._id_D2DE = 1;
            var_0 maps\_utility::magic_bullet_shield( 1 );
            return;
        }

        var_0._id_A87F._id_BB3D = 1;
        var_0 notify( var_1 );
    }
}

_id_CA02( var_0 )
{
    if ( isdefined( var_0._id_A87F._id_D2DE ) )
    {
        var_0._id_A87F._id_D2DE--;

        if ( var_0._id_A87F._id_D2DE <= 0 )
        {
            var_0._id_A87F._id_D2DE = undefined;
            var_0 maps\_utility::stop_magic_bullet_shield();
        }
    }
}
