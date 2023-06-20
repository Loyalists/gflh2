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
    self.sidearm = "glock";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 3 ) )
    {
        case 0:
            self.weapon = "mp5";
            break;
        case 1:
            self.weapon = "mp5_reflex";
            break;
        case 2:
            self.weapon = "iw5_mp11_sp";
            break;
    }

    character\gfl\randomizer_socom::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\gfl\randomizer_socom::precache();
    precacheitem( "mp5" );
    precacheitem( "mp5_reflex" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
