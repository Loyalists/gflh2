// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "team3";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "pp2000";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 12 ) )
    {
        case 0:
            self.weapon = "tavor_woodland_acog";
            break;
        case 1:
            self.weapon = "tavor_mars";
            break;
        case 2:
            self.weapon = "tavor_woodland_eotech";
            break;
        case 3:
            self.weapon = "tavor_reflex";
            break;
        case 4:
            self.weapon = "fn2000";
            break;
        case 5:
            self.weapon = "fn2000_acog";
            break;
        case 6:
            self.weapon = "fn2000_eotech";
            break;
        case 7:
            self.weapon = "fn2000_reflex";
            break;
        case 8:
            self.weapon = "fn2000_thermal";
            break;
        case 9:
            self.weapon = "iw5_ak12_sp";
            break;
        case 10:
            self.weapon = "iw5_hbra3_sp";
            break;
        case 11:
            self.weapon = "iw5_bal27_sp";
            break;
    }

    character\gfl\randomizer_merc_ar::main();
}

spawner()
{
    self setspawnerteam( "team3" );
}

precache()
{
    character\gfl\randomizer_merc_ar::precache();
    precacheitem( "tavor_woodland_acog" );
    precacheitem( "tavor_mars" );
    precacheitem( "tavor_woodland_eotech" );
    precacheitem( "tavor_reflex" );
    precacheitem( "fn2000" );
    precacheitem( "fn2000_acog" );
    precacheitem( "fn2000_eotech" );
    precacheitem( "fn2000_reflex" );
    precacheitem( "fn2000_thermal" );
    precacheitem( "pp2000" );
    precacheitem( "fraggrenade" );
}
