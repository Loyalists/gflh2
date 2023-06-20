// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "riotshield.csv";
    self.team = "axis";
    self.type = "human";
    self.subclass = "elite";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "usp";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 9 ) )
    {
        case 0:
            self.weapon = "tavor_acog";
            break;
        case 1:
            self.weapon = "tavor_mars";
            break;
        case 2:
            self.weapon = "fn2000";
            break;
        case 3:
            self.weapon = "fn2000_acog";
            break;
        case 4:
            self.weapon = "fn2000_reflex";
            break;
        case 5:
            self.weapon = "fn2000_scope";
            break;
        case 6:
            self.weapon = "iw5_ak12_sp";
            break;
        case 7:
            self.weapon = "iw5_hbra3_sp";
            break;
        case 8:
            self.weapon = "iw5_bal27_sp";
            break;
    }

    character\gfl\randomizer_fsb::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_fsb::precache();
    precacheitem( "tavor_acog" );
    precacheitem( "tavor_mars" );
    precacheitem( "fn2000" );
    precacheitem( "fn2000_acog" );
    precacheitem( "fn2000_reflex" );
    precacheitem( "fn2000_scope" );
    precacheitem( "usp" );
    precacheitem( "fraggrenade" );
}
