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
    self.sidearm = "beretta";

    if ( isai( self ) )
    {
        self setengagementmindist( 128.0, 0.0 );
        self setengagementmaxdist( 512.0, 768.0 );
    }

    switch ( codescripts\character::get_random_weapon( 4 ) )
    {
        case 0:
            self.weapon = "ump45";
            break;
        case 1:
            self.weapon = "ump45_acog";
            break;
        case 2:
            self.weapon = "ump45_reflex";
            break;
        case 3:
            self.weapon = "ump45_eotech";
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
    precacheitem( "ump45" );
    precacheitem( "ump45_acog" );
    precacheitem( "ump45_reflex" );
    precacheitem( "ump45_eotech" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
