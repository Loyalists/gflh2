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
    self.secondaryweapon = "iw5_ak12_sp";
    self.sidearm = "pp2000";

    if ( isai( self ) )
    {
        self setengagementmindist( 768.0, 512.0 );
        self setengagementmaxdist( 1024.0, 1500.0 );
    }

    self.weapon = "rpg";

    character\gfl\randomizer_merc_sniper::main();
}

spawner()
{
    self setspawnerteam( "team3" );
}

precache()
{
    character\gfl\randomizer_merc_sniper::precache();
    precacheitem( "rpg" );
    precacheitem( "ak47_reflex" );
    precacheitem( "pp2000" );
    precacheitem( "fraggrenade" );
}
