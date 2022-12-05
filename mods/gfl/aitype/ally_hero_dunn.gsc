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

    self.weapon = "scar_h_thermal";
    character\gfl\character_gfl_g11::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\gfl\character_gfl_g11::precache();
    precacheitem( "scar_h_thermal" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
