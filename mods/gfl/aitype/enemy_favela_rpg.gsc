// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "common_rambo_anims.csv";
    self.team = "axis";
    self.type = "human";
    self.subclass = "militia";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "iw5_ak12_sp";
    self.sidearm = "glock";

    if ( isai( self ) )
    {
        self setengagementmindist( 768.0, 512.0 );
        self setengagementmaxdist( 1024.0, 1500.0 );
    }

    self.weapon = "rpg";

    character\gfl\randomizer_favela_sniper::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_favela_sniper::precache();
    precacheitem( "rpg" );
    precacheitem( "ak47" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
    maps\_rambo::main();
}
