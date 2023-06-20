// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "allies";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 100;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "beretta";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    // self.weapon = "mp5";
    switch ( codescripts\character::get_random_weapon( 2 ) )
    {
        case 0:
            self.weapon = "mp5";
            break;
        case 1:
            self.weapon = "iw5_mp11_sp";
            break;
    }

    character\gfl\randomizer_us_army::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\gfl\randomizer_us_army::precache();
    precacheitem( "mp5" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
