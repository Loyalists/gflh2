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
            self.weapon = "uzi";
            break;
        case 1:
            self.weapon = "tmp";
            break;
        case 2:
            self.weapon = "mp5";
            break;
        case 3:
            self.weapon = "uzi";
            break;
    }

    character\gfl\randomizer_afghan_smg::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_afghan_smg::precache();
    precacheitem( "uzi" );
    precacheitem( "tmp" );
    precacheitem( "mp5" );
    precacheitem( "uzi" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
