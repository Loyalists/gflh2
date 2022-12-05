// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "axis";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "glock";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 15 ) )
    {
        case 0:
            self.weapon = "ak47_woodland";
            break;
        case 1:
            self.weapon = "ak47_digital_reflex";
            break;
        case 2:
            self.weapon = "ak47_woodland_grenadier";
            break;
        case 3:
            self.weapon = "ak47_digital_acog";
            break;
        case 4:
            self.weapon = "ak47_woodland_eotech";
            break;
        case 5:
            self.weapon = "famas_woodland";
            break;
        case 6:
            self.weapon = "tavor_woodland_acog";
            break;
        case 7:
            self.weapon = "tavor_mars";
            break;
        case 8:
            self.weapon = "tavor_woodland_eotech";
            break;
        case 9:
            self.weapon = "tavor_reflex";
            break;
        case 10:
            self.weapon = "fn2000_eotech";
            break;
        case 11:
            self.weapon = "famas_woodland_reflex";
            break;
        case 12:
            self.weapon = "fn2000_reflex";
            break;
        case 13:
            self.weapon = "famas_woodland_eotech";
            break;
        case 14:
            self.weapon = "fn2000_acog";
            break;
    }

    character\gfl\randomizer_merc_ar::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_merc_ar::precache();
    precacheitem( "ak47_woodland" );
    precacheitem( "ak47_digital_reflex" );
    precacheitem( "ak47_woodland_grenadier" );
    precacheitem( "gl_ak47_woodland" );
    precacheitem( "ak47_digital_acog" );
    precacheitem( "ak47_woodland_eotech" );
    precacheitem( "famas_woodland" );
    precacheitem( "tavor_woodland_acog" );
    precacheitem( "tavor_mars" );
    precacheitem( "tavor_woodland_eotech" );
    precacheitem( "tavor_reflex" );
    precacheitem( "fn2000_eotech" );
    precacheitem( "famas_woodland_reflex" );
    precacheitem( "fn2000_reflex" );
    precacheitem( "famas_woodland_eotech" );
    precacheitem( "fn2000_acog" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
